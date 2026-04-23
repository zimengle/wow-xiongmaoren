local addonName, ST = ...

ST.UI = {
    elementButtons = {},
}

local UI = ST.UI
local hideTaskToken = 0
local barButtons = {}
local BAR_SIZE = 36
local BAR_GAP_DEFAULT = 6
local MENU_OFFSET_Y = 4
local TIMER_UPDATE_INTERVAL = 0.1
local SPELL_COOLDOWN_GCD_THRESHOLD = 1.6
local EMPTY_SLOT_ICON = "Interface\\Icons\\INV_Misc_QuestionMark"
local ICON_TEX_COORD = { 0.07, 0.93, 0.07, 0.93 }
local MENU_SELECTED_BORDER_COLOR = { 0.2, 1, 0.2, 1 }
local MENU_DEFAULT_BORDER_COLOR = { 0.45, 0.45, 0.45, 0.9 }
local MENU_ICON_ALPHA = 1
local ACTION_OUTER_BORDER_PADDING = 3
local ACTION_OUTER_BORDER_EDGE_SIZE = 12
local ACTION_BORDER_STYLE_PRESETS = {
    default = {
        borderPadding = ACTION_OUTER_BORDER_PADDING,
        edgeSize = ACTION_OUTER_BORDER_EDGE_SIZE,
        borderColor = { 0.45, 0.45, 0.45, 0.9 },
        iconTexCoord = ICON_TEX_COORD,
    },
    ndui = {
        borderPadding = 2,
        edgeSize = 13,
        borderColor = { 0.2, 0.2, 0.2, 1 },
        iconTexCoord = { 0.08, 0.92, 0.08, 0.92 },
    },
    ndui_plus = {
        borderPadding = 2,
        edgeSize = 13,
        borderColor = { 0.2, 0.2, 0.2, 1 },
        iconTexCoord = { 0.08, 0.92, 0.08, 0.92 },
    },
    elvui = {
        borderPadding = 2,
        edgeSize = 12,
        borderColor = { 0.25, 0.25, 0.25, 1 },
        iconTexCoord = { 0.08, 0.92, 0.08, 0.92 },
    },
}
local MENU_BUTTON_BASE_X = 0
local MENU_BUTTON_BASE_Y = 8

local function anchorMenuToButton(menu, anchorButton, menuOffsetY, popupUp)
    menu:ClearAllPoints()
    if popupUp then
        menu:SetPoint("BOTTOMLEFT", anchorButton, "TOPLEFT", 0, menuOffsetY - MENU_BUTTON_BASE_Y)
    else
        menu:SetPoint("TOPLEFT", anchorButton, "BOTTOMLEFT", 0, menuOffsetY)
    end
end

local function shouldMenuPopupUp(isSecondaryBar)
    local key = isSecondaryBar and "secondaryMenuPopupDirection" or "mainMenuPopupDirection"
    local v = ST.db and ST.db[key]
    return v ~= "down"
end
local READY_FLASH_DURATION = 0.65
local SECONDARY_TIMER_UPDATE_INTERVAL = 0.2
local BAR_DRAG_THRESHOLD_PIXELS = 8
local SETTINGS_CONTENT_WIDTH = 620
local SETTINGS_SCROLL_RIGHT_COMPENSATION = 0
local SETTINGS_GROUP_INSET = 14
local SETTINGS_GROUP_INNER_PADDING = 24
local SETTINGS_GROUP_RIGHT_SAFE_PADDING = 36
local SETTINGS_GROUP_TOP_GAP = 10
local DEFAULT_FONT_DROPDOWN_WIDTH = 210
local DEFAULT_DROPDOWN_ANCHOR_X = 18
local DEFAULT_DROPDOWN_ANCHOR_Y = 8
local DEFAULT_DROPDOWN_BUTTON_HEIGHT = 24
local TM_NOOP = function() end
local GetNumSubgroupMembersCompat = GetNumSubgroupMembers or GetNumPartyMembers
local callMenu
local elementMenu
local elementMenusBySlot = {}
local shieldMenu
local weaponMenu
local earthTargetMenu
local setButtonSpell

local barDragWatcher = CreateFrame("Frame")
local barDragState = {
    button = nil,
    targetFrame = nil,
    savePoint = nil,
    startX = 0,
    startY = 0,
    dragging = false,
}
barDragWatcher:Hide()

local function clearBarDragState()
    barDragState.button = nil
    barDragState.targetFrame = nil
    barDragState.savePoint = nil
    barDragState.startX = 0
    barDragState.startY = 0
    barDragState.dragging = false
    barDragWatcher:Hide()
end

local function stopBarProxyDrag(commit)
    if barDragState.dragging and barDragState.targetFrame and barDragState.targetFrame.StopMovingOrSizing then
        barDragState.targetFrame:StopMovingOrSizing()
        if commit and barDragState.savePoint then
            barDragState.savePoint(barDragState.targetFrame)
        end
    end
    clearBarDragState()
end

local function beginBarProxyDrag(button, targetFrame, savePoint)
    if not button or not targetFrame or (ST and ST.db and ST.db.lock) then
        return
    end
    barDragState.button = button
    barDragState.targetFrame = targetFrame
    barDragState.savePoint = savePoint
    barDragState.startX, barDragState.startY = GetCursorPosition()
    barDragState.dragging = false
    barDragWatcher:Show()
end

barDragWatcher:SetScript("OnUpdate", function()
    if not barDragState.button then
        barDragWatcher:Hide()
        return
    end
    if not (IsMouseButtonDown and IsMouseButtonDown("LeftButton")) then
        stopBarProxyDrag(true)
        return
    end
    if barDragState.dragging then
        return
    end
    local x, y = GetCursorPosition()
    local dx = math.abs((x or 0) - (barDragState.startX or 0))
    local dy = math.abs((y or 0) - (barDragState.startY or 0))
    if dx < BAR_DRAG_THRESHOLD_PIXELS and dy < BAR_DRAG_THRESHOLD_PIXELS then
        return
    end
    if ST and ST.db and ST.db.lock then
        stopBarProxyDrag(false)
        return
    end
    if not (barDragState.targetFrame and barDragState.targetFrame.StartMoving) then
        stopBarProxyDrag(false)
        return
    end
    if barDragState.button then
        barDragState.button.tmSuppressNextLeftRelease = true
    end
    barDragState.dragging = true
    barDragState.targetFrame:StartMoving()
end)

local function bindProxyDragToButton(button, targetFrameProvider, savePoint)
    if not button or button.tmProxyDragBound then
        return
    end
    button.tmProxyDragBound = true
    button:HookScript("OnMouseDown", function(self, mouseButton)
        if mouseButton ~= "LeftButton" then
            return
        end
        local targetFrame = targetFrameProvider and targetFrameProvider(self)
        beginBarProxyDrag(self, targetFrame, savePoint)
    end)
    button:HookScript("OnMouseUp", function(_, mouseButton)
        if mouseButton == "LeftButton" then
            stopBarProxyDrag(true)
        end
    end)
    button:HookScript("OnHide", function(self)
        if barDragState.button == self then
            stopBarProxyDrag(false)
        end
    end)
    button:HookScript("PreClick", function(self, mouseButton, down)
        if mouseButton ~= "LeftButton" or down then
            return
        end
        if not self.tmSuppressNextLeftRelease then
            return
        end
        self.tmSuppressNextLeftRelease = nil
        self.tmDraggedRelease = true
        if InCombatLockdown and InCombatLockdown() then
            return
        end
        self:SetAttribute("type1", nil)
        self:SetAttribute("*type1", nil)
    end)
    button:HookScript("PostClick", function(self, mouseButton, down)
        if mouseButton ~= "LeftButton" or down then
            return
        end
        if self.tmDraggedRelease then
            self.tmDraggedRelease = nil
            if InCombatLockdown and InCombatLockdown() then
                return
            end
            setButtonSpell(self, self.spellID, 1)
        end
    end)
end

local LEGACY_FONT_FAMILY_MAP = {
    standard = "STANDARD_TEXT_FONT",
    unit = "UNIT_NAME_FONT",
    nameplate = "NAMEPLATE_FONT",
    damage = "DAMAGE_TEXT_FONT",
}

local function buildFontOptionList()
    local options = {}
    local seenPaths = {}

    local function addOption(fontPath, label)
        if type(fontPath) ~= "string" or fontPath == "" or seenPaths[fontPath] then
            return
        end
        seenPaths[fontPath] = true
        options[#options + 1] = {
            value = fontPath,
            text = label or fontPath,
        }
    end

    addOption(_G["STANDARD_TEXT_FONT"], "默认")
    addOption(_G["UNIT_NAME_FONT"], "单位名字体")
    addOption(_G["NAMEPLATE_FONT"], "姓名板字体")
    addOption(_G["DAMAGE_TEXT_FONT"], "伤害数字字体")

    if LibStub then
        local lsm = LibStub("LibSharedMedia-3.0", true)
        if lsm and lsm.List and lsm.Fetch then
            local fontNames = lsm:List("font")
            if type(fontNames) == "table" then
                for i = 1, #fontNames do
                    local name = fontNames[i]
                    local fontPath = lsm:Fetch("font", name)
                    addOption(fontPath, tostring(name))
                end
            end
        end
    end

    if #options == 0 then
        addOption("Fonts\\FRIZQT__.TTF", "默认")
    end
    return options
end

local function getConfiguredFontPath()
    if ST and ST.db then
        local selectedPath = ST.db.timerFontPath
        if type(selectedPath) == "string" and selectedPath ~= "" then
            return selectedPath
        end
        local legacy = ST.db.timerFontFamily
        local globalKey = legacy and LEGACY_FONT_FAMILY_MAP[legacy]
        if globalKey then
            local fontPath = _G[globalKey]
            if type(fontPath) == "string" and fontPath ~= "" then
                return fontPath
            end
        end
    end
    return STANDARD_TEXT_FONT
end

local FONT_OUTLINE_OPTIONS = {
    { value = "NONE", text = "无描边" },
    { value = "OUTLINE", text = "描边" },
    { value = "THICKOUTLINE", text = "粗描边" },
    { value = "MONOCHROME", text = "单色" },
    { value = "MONOCHROMEOUTLINE", text = "单色描边" },
    { value = "MONOCHROMETHICKOUTLINE", text = "单色粗描边" },
    { value = "SHADOW", text = "阴影" },
    { value = "SHADOWOUTLINE", text = "阴影描边" },
    { value = "SHADOWTHICKOUTLINE", text = "阴影粗描边" },
}

local FONT_OUTLINE_STYLE_MAP = {
    NONE = { flags = "", shadow = false },
    OUTLINE = { flags = "OUTLINE", shadow = false },
    THICKOUTLINE = { flags = "THICKOUTLINE", shadow = false },
    MONOCHROME = { flags = "MONOCHROME", shadow = false },
    MONOCHROMEOUTLINE = { flags = "OUTLINE,MONOCHROME", shadow = false },
    MONOCHROMETHICKOUTLINE = { flags = "THICKOUTLINE,MONOCHROME", shadow = false },
    SHADOW = { flags = "", shadow = true },
    SHADOWOUTLINE = { flags = "OUTLINE", shadow = true },
    SHADOWTHICKOUTLINE = { flags = "THICKOUTLINE", shadow = true },
}

local TIMER_FONT_DROPDOWN_LAYOUT = {
    dropdownWidth = DEFAULT_FONT_DROPDOWN_WIDTH,
    controlOffsetX = 36,
    labelWidthExtra = 24,
    anchorBaseX = DEFAULT_DROPDOWN_ANCHOR_X,
    anchorY = DEFAULT_DROPDOWN_ANCHOR_Y,
    buttonHeight = DEFAULT_DROPDOWN_BUTTON_HEIGHT,
    visualLeftCompensation = 34,
}
local TIMER_FONT_BASE_CONTROL_COMPENSATION_X = -(tonumber(TIMER_FONT_DROPDOWN_LAYOUT.visualLeftCompensation) or 0)
local TIMER_FONT_LAYOUT_PRESETS = {
    default = {
        buttonVisualOffsetX = 0,
        controlColumnCompensationX = TIMER_FONT_BASE_CONTROL_COMPENSATION_X,
        dropdownLayoutOverrides = {},
    },
    ndui = {
        buttonVisualOffsetX = 0,
        controlColumnCompensationX = TIMER_FONT_BASE_CONTROL_COMPENSATION_X,
        dropdownLayoutOverrides = {},
    },
    ndui_plus = {
        buttonVisualOffsetX = 0,
        controlColumnCompensationX = TIMER_FONT_BASE_CONTROL_COMPENSATION_X,
        dropdownLayoutOverrides = {},
    },
    elvui = {
        buttonVisualOffsetX = 0,
        controlColumnCompensationX = 0,
        dropdownLayoutOverrides = {
            controlOffsetX = 18,
        },
    },
}

local function isAddOnLoadedCompat(name)
    if type(name) ~= "string" or name == "" then
        return false
    end
    local ok, loaded = pcall(function()
        if C_AddOns and C_AddOns.IsAddOnLoaded then
            return C_AddOns.IsAddOnLoaded(name)
        end
        if IsAddOnLoaded then
            return IsAddOnLoaded(name)
        end
        return false
    end)
    return ok and loaded and loaded ~= false
end

local function getActiveLayoutBranch()
    if isAddOnLoadedCompat("ElvUI") or _G["ElvUI"] ~= nil then
        return "elvui"
    end
    if isAddOnLoadedCompat("NDui_Plus") or _G["NDui_Plus"] ~= nil then
        return "ndui_plus"
    end
    if isAddOnLoadedCompat("NDui") or _G["NDui"] ~= nil then
        return "ndui"
    end
    return "default"
end

local function getActiveTimerFontLayoutPreset()
    local branch = getActiveLayoutBranch()
    local preset = TIMER_FONT_LAYOUT_PRESETS[branch]
    if type(preset) ~= "table" then
        preset = TIMER_FONT_LAYOUT_PRESETS.default
    end
    if type(preset) ~= "table" then
        return {}
    end
    return preset
end

local function getActiveActionBorderStylePreset()
    local branch = getActiveLayoutBranch()
    local preset = ACTION_BORDER_STYLE_PRESETS[branch]
    if type(preset) ~= "table" then
        preset = ACTION_BORDER_STYLE_PRESETS.default
    end
    if type(preset) ~= "table" then
        return {
            borderPadding = ACTION_OUTER_BORDER_PADDING,
            edgeSize = ACTION_OUTER_BORDER_EDGE_SIZE,
            borderColor = MENU_DEFAULT_BORDER_COLOR,
            iconTexCoord = ICON_TEX_COORD,
        }
    end
    return preset
end

local function getActiveIconTexCoord()
    if ST and ST.db and ST.db.showIconBorder == false then
        return ICON_TEX_COORD
    end
    local style = getActiveActionBorderStylePreset()
    local coord = style.iconTexCoord
    if type(coord) == "table" and #coord >= 4 then
        return coord
    end
    return ICON_TEX_COORD
end

local function applyIconTexCoord(icon)
    if not (icon and icon.SetTexCoord) then
        return
    end
    local coord = getActiveIconTexCoord()
    icon:SetTexCoord(coord[1], coord[2], coord[3], coord[4])
end

local function getTimerFontButtonVisualOffsetX()
    local preset = getActiveTimerFontLayoutPreset()
    local offset = preset.buttonVisualOffsetX
    if type(offset) == "number" then
        return offset
    end
    return 0
end

local function getTimerFontControlColumnCompensationX(layoutConfig)
    local preset = getActiveTimerFontLayoutPreset()
    local offset = preset.controlColumnCompensationX
    if type(offset) == "number" then
        return offset
    end
    local compensation = tonumber(layoutConfig and layoutConfig.visualLeftCompensation)
    if compensation == nil then
        return TIMER_FONT_BASE_CONTROL_COMPENSATION_X
    end
    return -compensation
end

local function resolveDropdownVisualColumnX(parent, dropdown)
    if not (parent and dropdown and parent.GetLeft and dropdown.GetLeft) then
        return nil
    end
    local parentLeft = parent:GetLeft()
    if not parentLeft then
        return nil
    end
    local dropdownName = dropdown.GetName and dropdown:GetName()
    if type(dropdownName) == "string" and dropdownName ~= "" then
        local dropdownLeftTexture = _G[dropdownName .. "Left"]
        if dropdownLeftTexture and dropdownLeftTexture.GetLeft then
            local leftTextureLeft = dropdownLeftTexture:GetLeft()
            if leftTextureLeft then
                return leftTextureLeft - parentLeft
            end
        end
        local dropdownButton = _G[dropdownName .. "Button"]
        if dropdownButton and dropdownButton.GetLeft then
            local normalTexture = dropdownButton.GetNormalTexture and dropdownButton:GetNormalTexture()
            if normalTexture and normalTexture.GetLeft then
                local normalTextureLeft = normalTexture:GetLeft()
                if normalTextureLeft then
                    return normalTextureLeft - parentLeft
                end
            end
            local buttonLeft = dropdownButton:GetLeft()
            if buttonLeft then
                return buttonLeft - parentLeft
            end
        end
    end
    local dropdownLeft = dropdown:GetLeft()
    if dropdownLeft then
        return dropdownLeft - parentLeft
    end
    return nil
end

local function resolveDropdownLayoutConfig(dropdownConfig, controlOffsetX, labelWidthExtra)
    if type(dropdownConfig) == "table" then
        return dropdownConfig
    end
    return {
        dropdownWidth = dropdownConfig,
        controlOffsetX = controlOffsetX,
        labelWidthExtra = labelWidthExtra,
    }
end

local function getTimerFontDropdownLayoutConfig(baseLayout)
    local resolvedBaseLayout = resolveDropdownLayoutConfig(baseLayout)
    local activePreset = getActiveTimerFontLayoutPreset()
    local overrides = activePreset.dropdownLayoutOverrides
    if type(overrides) ~= "table" then
        return resolvedBaseLayout
    end
    local merged = {}
    for key, value in pairs(resolvedBaseLayout) do
        merged[key] = value
    end
    for key, value in pairs(overrides) do
        if value ~= nil then
            merged[key] = value
        end
    end
    return merged
end

local function getDropdownControlColumnX(x, width, layoutConfig)
    local dropdownWidth = layoutConfig.dropdownWidth or DEFAULT_FONT_DROPDOWN_WIDTH
    local anchorBaseX = tonumber(layoutConfig.anchorBaseX) or DEFAULT_DROPDOWN_ANCHOR_X
    local appliedControlOffsetX = tonumber(layoutConfig.controlOffsetX) or 0
    return x + width + anchorBaseX + appliedControlOffsetX - dropdownWidth
end

local function getDropdownVisualControlColumnX(x, width, layoutConfig)
    local columnX = getDropdownControlColumnX(x, width, layoutConfig)
    local compensation = tonumber(layoutConfig and layoutConfig.visualLeftCompensation) or 0
    return columnX - compensation
end

local function resolveControlColumnX(parent, dropdown, x, width, layoutConfig, overrideX)
    local explicitX = tonumber(overrideX)
    if explicitX then
        return explicitX
    end
    if parent and dropdown then
        local anchorRightX = tonumber(dropdown.tmAnchorX)
        if anchorRightX then
            local resolvedLayout = resolveDropdownLayoutConfig(layoutConfig)
            local dropdownWidth = tonumber(resolvedLayout and resolvedLayout.dropdownWidth) or DEFAULT_FONT_DROPDOWN_WIDTH
            local getDropdownWidth = _G and _G.UIDropDownMenu_GetWidth
            if getDropdownWidth then
                local runtimeWidth = getDropdownWidth(dropdown)
                if tonumber(runtimeWidth) and runtimeWidth > 0 then
                    dropdownWidth = runtimeWidth
                end
            end
            local branchCompensationX = getTimerFontControlColumnCompensationX(resolvedLayout)
            return anchorRightX - dropdownWidth + branchCompensationX
        end
        local visualColumnX = resolveDropdownVisualColumnX(parent, dropdown)
        if tonumber(visualColumnX) then
            return visualColumnX
        end
    end
    return getDropdownVisualControlColumnX(x, width, layoutConfig)
end

local function getControlLabelWidth(x, width, layoutConfig)
    local resolvedLayout = resolveDropdownLayoutConfig(layoutConfig)
    local dropdownWidth = resolvedLayout.dropdownWidth or DEFAULT_FONT_DROPDOWN_WIDTH
    local appliedLabelWidthExtra = tonumber(resolvedLayout.labelWidthExtra) or 0
    return math.max(20, width - dropdownWidth - 10 + appliedLabelWidthExtra)
end

local function getControlLabelWidthByColumn(x, controlColumnX, padding)
    local effectivePadding = tonumber(padding) or 10
    local effectiveColumnX = tonumber(controlColumnX) or 0
    return math.max(20, effectiveColumnX - x - effectivePadding)
end

local function alignControlToColumn(parent, control, controlColumnX)
    if not (parent and control and tonumber(controlColumnX)) then
        return
    end
    local controlY = tonumber(control.tmControlY) or 0
    local visualOffsetX = tonumber(control.tmVisualOffsetX) or 0
    control:ClearAllPoints()
    control:SetPoint("TOPLEFT", parent, "TOPLEFT", controlColumnX + visualOffsetX, controlY)
end

local function getConfiguredFontOutline()
    local value = ST and ST.db and ST.db.timerFontOutline
    if type(value) ~= "string" then
        return "OUTLINE"
    end
    local normalized = string.upper(value)
    if FONT_OUTLINE_STYLE_MAP[normalized] then
        return normalized
    end
    return "OUTLINE"
end

local function getConfiguredFontStyle()
    local style = FONT_OUTLINE_STYLE_MAP[getConfiguredFontOutline()] or FONT_OUTLINE_STYLE_MAP.OUTLINE
    return style.flags, style.shadow
end

local function applyConfiguredFontStyle(textObj, fontSize)
    if not textObj or not textObj.SetFont then
        return
    end
    local flags, shadow = getConfiguredFontStyle()
    textObj:SetFont(getConfiguredFontPath(), fontSize, flags)
    if textObj.SetShadowOffset then
        if shadow then
            textObj:SetShadowOffset(1, -1)
            if textObj.SetShadowColor then
                textObj:SetShadowColor(0, 0, 0, 0.9)
            end
        else
            textObj:SetShadowOffset(0, 0)
        end
    end
end

local function getFontColorMode()
    if ST and ST.db and ST.db.fontColorMode == "custom" then
        return "custom"
    end
    return "smart"
end

local function getConfiguredFontColorRGBA()
    local color = ST and ST.db and ST.db.fontColor
    if type(color) ~= "table" then
        return 1, 1, 1, 1
    end
    local r = tonumber(color.r) or 1
    local g = tonumber(color.g) or 1
    local b = tonumber(color.b) or 1
    local a = tonumber(color.a)
    if a == nil then
        a = 1
    end
    return r, g, b, a
end

local function setFontStringColorSafe(textObj, r, g, b, a)
    if not textObj or not textObj.SetTextColor then
        return
    end
    local nr = tonumber(r) or 1
    local ng = tonumber(g) or 1
    local nb = tonumber(b) or 1
    local na = tonumber(a)
    if na == nil then
        na = 1
    end
    if textObj.tmLastColorR ~= nr or textObj.tmLastColorG ~= ng or textObj.tmLastColorB ~= nb or textObj.tmLastColorA ~= na then
        textObj:SetTextColor(nr, ng, nb, na)
        textObj.tmLastColorR = nr
        textObj.tmLastColorG = ng
        textObj.tmLastColorB = nb
        textObj.tmLastColorA = na
    end
end

local function tryApplyElvUIDropDownStyle(dropdown, dropdownWidth)
    local elvUI = _G["ElvUI"]
    if type(elvUI) ~= "table" then
        return false
    end
    local E = unpack(elvUI)
    if type(E) ~= "table" then
        return false
    end
    local skins = E:GetModule("Skins")
    if type(skins) ~= "table" or type(skins.HandleDropDownBox) ~= "function" then
        return false
    end
    skins:HandleDropDownBox(dropdown, dropdownWidth)
    return true
end

local function fixElvUIDropDownTextVertical(dropdown)
    if not dropdown or not dropdown.tmFontDropdown then
        return
    end
    local text = dropdown.Text
    if not text and dropdown.GetName then
        text = _G[(dropdown:GetName() or "") .. "Text"]
    end
    if not text or not text.GetPoint then
        return
    end
    local point, relativeTo, relativePoint, x = text:GetPoint(1)
    if point then
        text:ClearAllPoints()
        text:SetPoint(point, relativeTo, relativePoint, x or 0, -1)
    end
    if text.SetJustifyV then
        text:SetJustifyV("MIDDLE")
    end
end

local function registerElvUIDropDownCallback(dropdown, dropdownWidth)
    if not dropdown or dropdown.tmElvCallbackRegistered then
        return
    end
    local elvUI = _G["ElvUI"]
    if type(elvUI) ~= "table" then
        return
    end
    local E = unpack(elvUI)
    if type(E) ~= "table" then
        return
    end
    local skins = E:GetModule("Skins")
    if type(skins) ~= "table" or type(skins.AddCallbackForAddon) ~= "function" or type(skins.HandleDropDownBox) ~= "function" then
        return
    end
    dropdown.tmElvCallbackRegistered = true
    local callbackName = "TotemMaster_FontDropDown_" .. (dropdown:GetName() or tostring(dropdown))
    skins:AddCallbackForAddon("TotemMaster", callbackName, function()
        skins:HandleDropDownBox(dropdown, dropdownWidth)
        fixElvUIDropDownTextVertical(dropdown)
    end, true)
end

local function tryApplyNDuiPlusDropDownStyle(dropdown)
    local ns = _G["NDui_Plus"]
    local plusAPI = type(ns) == "table" and ns[5] or nil
    if type(plusAPI) ~= "table" or type(plusAPI.ReskinDropDown) ~= "function" then
        return false
    end
    plusAPI.ReskinDropDown(dropdown)
    return true
end

local function tryApplyNDuiDropDownStyle(dropdown)
    local ns = _G["NDui"]
    local ndUIAPI = type(ns) == "table" and ns[1] or nil
    if type(ndUIAPI) ~= "table" or type(ndUIAPI.ReskinDropDown) ~= "function" then
        return false
    end
    ndUIAPI.ReskinDropDown(dropdown)
    return true
end

local function applyNDuiFontDropDownFixups(dropdown)
    if not dropdown or not dropdown.tmFontDropdown then
        return
    end
    local name = dropdown.GetName and dropdown:GetName()
    local down = dropdown.Button
    if not down and name then
        down = _G[name .. "Button"]
    end

    if dropdown.tmAnchorParent and dropdown.tmAnchorX and dropdown.tmAnchorY and not dropdown.tmNDuiAnchorAdjusted then
        dropdown.tmNDuiAnchorAdjusted = true
        dropdown:ClearAllPoints()
        dropdown:SetPoint("TOPRIGHT", dropdown.tmAnchorParent, "TOPLEFT", dropdown.tmAnchorX, dropdown.tmAnchorY - 6)
    end

    if not dropdown.tmClickCover then
        local cover = CreateFrame("Button", nil, dropdown)
        cover:SetAllPoints(dropdown)
        cover:RegisterForClicks("AnyUp")
        cover:SetScript("OnClick", function()
            if down and down.Click then
                down:Click()
            elseif ToggleDropDownMenu then
                ToggleDropDownMenu(1, nil, dropdown, dropdown, 0, 0)
            end
        end)
        if down and down.GetScript then
            local onEnter = down:GetScript("OnEnter")
            local onLeave = down:GetScript("OnLeave")
            if onEnter then
                cover:SetScript("OnEnter", function()
                    onEnter(down)
                end)
            end
            if onLeave then
                cover:SetScript("OnLeave", function()
                    onLeave(down)
                end)
            end
        end
        dropdown.tmClickCover = cover
    end
    if dropdown.tmClickCover then
        dropdown.tmClickCover:Show()
        if down and down.GetFrameLevel then
            dropdown.tmClickCover:SetFrameLevel(down:GetFrameLevel() + 1)
        else
            dropdown.tmClickCover:SetFrameLevel(dropdown:GetFrameLevel() + 1)
        end
    end
end

local function applyExternalDropDownStyle(dropdown, dropdownWidth)
    if not dropdown then
        return
    end

    local styleBranch
    if _G["ElvUI"] ~= nil then
        styleBranch = "elvui"
    elseif _G["NDui_Plus"] ~= nil then
        styleBranch = "ndui_plus"
    elseif _G["NDui"] ~= nil then
        styleBranch = "ndui"
    else
        return
    end

    local function run()
        if styleBranch == "elvui" then
            registerElvUIDropDownCallback(dropdown, dropdownWidth)
            tryApplyElvUIDropDownStyle(dropdown, dropdownWidth)
            fixElvUIDropDownTextVertical(dropdown)
            return
        end
        if styleBranch == "ndui_plus" then
            if dropdown.tmFontDropdown then
                tryApplyNDuiPlusDropDownStyle(dropdown)
                applyNDuiFontDropDownFixups(dropdown)
                return
            end
            tryApplyNDuiPlusDropDownStyle(dropdown)
            return
        end
        if dropdown.tmFontDropdown then
            tryApplyNDuiDropDownStyle(dropdown)
            applyNDuiFontDropDownFixups(dropdown)
            return
        end
        tryApplyNDuiDropDownStyle(dropdown)
    end

    run()
    if not dropdown.tmExternalSkinHooked then
        dropdown.tmExternalSkinHooked = true
        dropdown:HookScript("OnShow", run)
        if C_Timer and C_Timer.After then
            C_Timer.After(0, run)
            C_Timer.After(0.1, run)
            C_Timer.After(0.5, run)
            C_Timer.After(1, run)
            C_Timer.After(2, run)
        end
    end
end

local function applyThirdPartySkinToPanelButton(button)
    if not button or button._tmPanelSkinApplied then
        return
    end
    local branch = getActiveLayoutBranch()
    if branch == "default" then
        return
    end
    local ok = false
    if branch == "elvui" then
        if (isAddOnLoadedCompat("ElvUI") or _G.ElvUI) and type(_G.ElvUI) == "table" then
            local okUnpack, E = pcall(unpack, _G.ElvUI)
            if okUnpack and type(E) == "table" and type(E.GetModule) == "function" then
                local okSkin, S = pcall(E.GetModule, E, "Skins", true)
                if okSkin and type(S) == "table" and type(S.HandleButton) == "function" then
                    ok = select(1, pcall(function()
                        S:HandleButton(button)
                    end))
                end
            end
        end
    elseif branch == "ndui" or branch == "ndui_plus" then
        local B = _G.NDui and _G.NDui[1]
        if type(B) == "table" and type(B.Reskin) == "function" then
            ok = select(1, pcall(B.Reskin, button))
        end
    end
    if ok then
        button._tmPanelSkinApplied = true
    end
end

local function applyThirdPartySkinToCheckButton(cb)
    if not cb or cb._tmCheckSkinApplied then
        return
    end
    if cb.IsSkinned then
        cb._tmCheckSkinApplied = true
        return
    end
    local branch = getActiveLayoutBranch()
    if branch == "default" then
        return
    end
    local ok = false
    if branch == "elvui" then
        if (isAddOnLoadedCompat("ElvUI") or _G.ElvUI) and type(_G.ElvUI) == "table" then
            local okUnpack, E = pcall(unpack, _G.ElvUI)
            if okUnpack and type(E) == "table" and type(E.GetModule) == "function" then
                local okSkin, S = pcall(E.GetModule, E, "Skins", true)
                if okSkin and type(S) == "table" and type(S.HandleCheckBox) == "function" then
                    ok = select(1, pcall(function()
                        S:HandleCheckBox(cb)
                    end))
                end
            end
        end
    elseif branch == "ndui" or branch == "ndui_plus" then
        local B = _G.NDui and _G.NDui[1]
        if type(B) == "table" and type(B.ReskinCheck) == "function" then
            ok = select(1, pcall(B.ReskinCheck, cb))
        end
    end
    if ok then
        cb._tmCheckSkinApplied = true
    end
end

local function registerSettingsUIPanelButton(b)
    if not b or not UI.settingsUIPanelButtons then
        return
    end
    table.insert(UI.settingsUIPanelButtons, b)
end

local function applyThirdPartySkinToSettingsSlider(slider)
    if not slider or slider._tmSliderSkinApplied then
        return
    end
    local branch = getActiveLayoutBranch()
    if branch == "default" then
        return
    end
    local ok = false
    if branch == "elvui" then
        if (isAddOnLoadedCompat("ElvUI") or _G.ElvUI) and type(_G.ElvUI) == "table" then
            local okUnpack, E = pcall(unpack, _G.ElvUI)
            if okUnpack and type(E) == "table" and type(E.GetModule) == "function" then
                local okSkin, S = pcall(E.GetModule, E, "Skins", true)
                if okSkin and type(S) == "table" and type(S.HandleSliderFrame) == "function" then
                    ok = select(1, pcall(function()
                        S:HandleSliderFrame(slider)
                    end))
                end
            end
        end
    elseif branch == "ndui" or branch == "ndui_plus" then
        local B = _G.NDui and _G.NDui[1]
        if type(B) == "table" and type(B.ReskinSlider) == "function" then
            ok = select(1, pcall(B.ReskinSlider, slider))
        end
    end
    if ok then
        slider._tmSliderSkinApplied = true
    end
end

local function registerSettingsSlider(s)
    if not s or not UI.settingsSliders then
        return
    end
    table.insert(UI.settingsSliders, s)
end

local function normalizeBarGap(gap)
    gap = tonumber(gap) or BAR_GAP_DEFAULT
    if gap < 0 then
        gap = 0
    elseif gap > 20 then
        gap = 20
    end
    return gap
end

local function getMainBarGap()
    local gap = ST and ST.db and ST.db.mainIconGap
    if gap == nil then
        gap = ST and ST.db and ST.db.iconGap
    end
    if gap == nil then
        gap = ST and ST.defaults and (ST.defaults.mainIconGap or ST.defaults.iconGap)
    end
    return normalizeBarGap(gap)
end

local function getSecondaryBarGap()
    local mainGap = getMainBarGap()
    if not (ST and ST.db and ST.db.splitSecondaryBar) then
        return mainGap
    end
    local gap = ST.db.secondaryIconGap
    if gap == nil then
        gap = ST.db.iconGap
    end
    if gap == nil then
        gap = ST and ST.defaults and (ST.defaults.secondaryIconGap or ST.defaults.iconGap)
    end
    return normalizeBarGap(gap)
end

local function getClickSuffix()
    if GetCVarBool and GetCVarBool("ActionButtonUseKeyDown") then
        return "Down"
    end
    return "Up"
end

local function registerSecureClicks(button)
    button:RegisterForClicks(
        "LeftButtonDown", "LeftButtonUp",
        "RightButtonDown", "RightButtonUp"
    )
end

setButtonSpell = function(button, spellID, click)
    local usableSpellID = (spellID and spellID ~= 0) and spellID or nil
    button.spellID = usableSpellID or 0
    local spell = usableSpellID and (GetSpellInfo(usableSpellID) or usableSpellID) or nil
    if spell then
        button:SetAttribute("type" .. click, "spell")
        button:SetAttribute("spell" .. click, spell)
        button:SetAttribute("*type" .. click, "spell")
        button:SetAttribute("*spell" .. click, spell)
    else
        button:SetAttribute("type" .. click, nil)
        button:SetAttribute("spell" .. click, nil)
        button:SetAttribute("*type" .. click, nil)
        button:SetAttribute("*spell" .. click, nil)
    end
    local icon = usableSpellID and select(3, GetSpellInfo(usableSpellID))
    if button.icon and icon then
        button.icon:SetTexture(icon)
        applyIconTexCoord(button.icon)
        button.icon:SetVertexColor(1, 1, 1, 1)
        button.icon:SetAlpha(1)
    end
    if button.tmEmptyFill then
        button.tmEmptyFill:Hide()
    end
end

local function attachSpellTooltip(button, getSpellID)
    button:HookScript("OnEnter", function(self)
        local spellID = getSpellID and getSpellID(self) or self.spellID
        if not spellID or spellID == 0 then
            return
        end
        if GameTooltip_SetDefaultAnchor then
            GameTooltip_SetDefaultAnchor(GameTooltip, self)
        else
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        end
        if GameTooltip.SetSpellByID then
            GameTooltip:SetSpellByID(spellID)
        else
            GameTooltip:SetText(tostring(spellID))
        end
        GameTooltip:Show()
    end)
    button:HookScript("OnLeave", function()
        GameTooltip:Hide()
    end)
end

local function attachReincarnationTooltip(button)
    button:HookScript("OnEnter", function(self)
        if not GameTooltip or not self.tmReincState then
            return
        end
        local state = self.tmReincState
        local function formatRemainMs(remain)
            if not remain or remain <= 0 then
                return "0"
            end
            if remain >= 60 then
                local total = math.floor(remain + 0.0001)
                local mins = math.floor(total / 60)
                local secs = total % 60
                return string.format("%d:%02d", mins, secs)
            end
            return string.format("%d", math.floor(remain + 0.999))
        end
        GameTooltip:AddLine(" ")
        if state.active and state.remain and state.remain > 0 then
            GameTooltip:AddLine(string.format("冷却剩余：%s", formatRemainMs(state.remain)), 1, 0.82, 0)
        else
            GameTooltip:AddLine("冷却状态：就绪", 0.3, 1, 0.3)
        end
        if state.hasGlyph then
            GameTooltip:AddLine("已插新生雕文：无需十字", 0.3, 1, 0.3)
        else
            local charges = tonumber(state.charges) or 0
            if charges > 0 then
                GameTooltip:AddLine(string.format("十字章数量：%d（可释放%d次）", charges, charges), 0.3, 1, 0.3)
            else
                GameTooltip:AddLine("缺少十字章", 1, 0.25, 0.25)
            end
        end
        GameTooltip:Show()
    end)
end

local clearActionButtonTemplateArtifacts
local function applyActionButtonOuterBorderStyle(button)
    if not button or not button.tmOuterBorder then
        return
    end
    local border = button.tmOuterBorder
    local style = getActiveActionBorderStylePreset()
    local padding = tonumber(style.borderPadding) or ACTION_OUTER_BORDER_PADDING
    local edgeSize = tonumber(style.edgeSize) or ACTION_OUTER_BORDER_EDGE_SIZE
    border:ClearAllPoints()
    border:SetPoint("TOPLEFT", button, "TOPLEFT", -padding, padding)
    border:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", padding, -padding)
    if border.SetBackdrop then
        border:SetBackdrop({
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = edgeSize,
            insets = {
                left = padding,
                right = padding,
                top = padding,
                bottom = padding,
            },
        })
    end
end

local function createActionButton(name, parent, size)
    local button = CreateFrame(
        "Button",
        name,
        parent,
        "ActionButtonTemplate,SecureActionButtonTemplate,SecureHandlerEnterLeaveTemplate,SecureHandlerAttributeTemplate"
    )
    button:SetSize(size, size)
    registerSecureClicks(button)
    button.icon = _G[name .. "Icon"]
    local n = _G[name .. "Name"]
    local h = _G[name .. "HotKey"]
    local c = _G[name .. "Count"]
    if n then n:Hide() end
    if h then h:Hide() end
    if c then c:Hide() end
    local emptyFill = button:CreateTexture(nil, "BACKGROUND")
    emptyFill:SetAllPoints(button)
    emptyFill:SetColorTexture(0, 0, 0, 0.35)
    emptyFill:Hide()
    button.tmEmptyFill = emptyFill
    applyIconTexCoord(button.icon)

    local outerBorder = CreateFrame("Frame", nil, button, "BackdropTemplate")
    outerBorder:SetFrameStrata(button:GetFrameStrata())
    outerBorder:SetFrameLevel(button:GetFrameLevel() + 3)
    outerBorder:SetPoint("TOPLEFT", button, "TOPLEFT", -ACTION_OUTER_BORDER_PADDING, ACTION_OUTER_BORDER_PADDING)
    outerBorder:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", ACTION_OUTER_BORDER_PADDING, -ACTION_OUTER_BORDER_PADDING)
    if outerBorder.SetBackdrop then
        outerBorder:SetBackdrop({
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = ACTION_OUTER_BORDER_EDGE_SIZE,
            insets = {
                left = ACTION_OUTER_BORDER_PADDING,
                right = ACTION_OUTER_BORDER_PADDING,
                top = ACTION_OUTER_BORDER_PADDING,
                bottom = ACTION_OUTER_BORDER_PADDING,
            },
        })
        outerBorder:SetBackdropBorderColor(0.45, 0.45, 0.45, 0.9)
    end
    button.tmOuterBorder = outerBorder
    applyActionButtonOuterBorderStyle(button)
    clearActionButtonTemplateArtifacts(button)
    button:HookScript("OnShow", function(self)
        if not self._tmUsesThirdPartyActionChrome then
            clearActionButtonTemplateArtifacts(self)
        end
    end)
    button:HookScript("PostClick", function(self)
        if self._tmUsesThirdPartyActionChrome then
            return
        end
        clearActionButtonTemplateArtifacts(self)
        if C_Timer and C_Timer.After then
            C_Timer.After(0, function()
                if self and self:IsShown() and not self._tmUsesThirdPartyActionChrome then
                    clearActionButtonTemplateArtifacts(self)
                end
            end)
        end
    end)
    return button
end

clearActionButtonTemplateArtifacts = function(button)
    if not button then
        return
    end

    local normalTexture = button.GetNormalTexture and button:GetNormalTexture()
    if normalTexture then
        normalTexture:SetTexture(nil)
        normalTexture:Hide()
    end
    local pushedTexture = button.GetPushedTexture and button:GetPushedTexture()
    if pushedTexture then
        pushedTexture:SetTexture(nil)
        pushedTexture:Hide()
    end
    local highlightTexture = button.GetHighlightTexture and button:GetHighlightTexture()
    if highlightTexture then
        highlightTexture:SetTexture(nil)
        highlightTexture:Hide()
    end
    local checkedTexture = button.GetCheckedTexture and button:GetCheckedTexture()
    if checkedTexture then
        checkedTexture:SetTexture(nil)
        checkedTexture:Hide()
    end

    local buttonName = button.GetName and button:GetName() or nil
    if buttonName and buttonName ~= "" then
        for _, suffix in pairs({
            "Flash",
            "Border",
            "SpellHighlightTexture",
            "NewActionTexture",
            "FlyoutArrow",
            "FloatingBG",
            "Shine",
        }) do
            local region = _G[buttonName .. suffix]
            if region then
                if region.SetTexture then
                    region:SetTexture(nil)
                end
                if region.Hide then
                    region:Hide()
                end
            end
        end
    end

    local count = select("#", button:GetRegions())
    for i = 1, count do
        local region = select(i, button:GetRegions())
        if region
            and region.GetObjectType
            and region:GetObjectType() == "Texture"
            and region ~= button.icon
            and region ~= button.tmEmptyFill then
            if region.SetTexture then
                region:SetTexture(nil)
            end
            region:Hide()
        end
    end

    if button.icon then
        button.icon:SetAlpha(1)
    end
end

local function setActionButtonOuterBorderColor(button, r, g, b, a)
    if not button or not button.tmOuterBorder or not button.tmOuterBorder.SetBackdropBorderColor then
        return
    end
    local style = getActiveActionBorderStylePreset()
    local defaultColor = style.borderColor or MENU_DEFAULT_BORDER_COLOR
    button.tmOuterBorder:SetBackdropBorderColor(
        r or defaultColor[1],
        g or defaultColor[2],
        b or defaultColor[3],
        a or defaultColor[4]
    )
end

local function tryNDuiSkinOnButton(button)
    if not button then
        return false
    end
    local nduiNs = _G.NDui
    local B = type(nduiNs) == "table" and nduiNs[1]
    if type(B) ~= "table" or type(B.GetModule) ~= "function" then
        return false
    end
    if isAddOnLoadedCompat("NDui_Plus") and type(_G.NDui_Plus) == "table" then
        local okUnpack, _, _, _, _, P = pcall(function()
            return unpack(_G.NDui_Plus)
        end)
        if okUnpack and type(P) == "table" and type(P.GetModule) == "function" then
            local AB = P:GetModule("ActionBar")
            if AB and type(AB.StyleActionButton) == "function" and AB.BarConfig then
                local ok = pcall(function()
                    AB:StyleActionButton(button, AB.BarConfig)
                end)
                if ok then
                    return true
                end
            end
        end
    end
    local Bar = B:GetModule("Actionbar")
    if Bar and type(Bar.StyleActionButton) == "function" then
        if pcall(function()
            Bar:StyleActionButton(button)
        end) then
            return true
        end
    end
    if type(B.Reskin) == "function" and pcall(B.Reskin, button) then
        return true
    end
    return false
end

local function tryThirdPartyActionButtonSkin(button)
    if not button or ST.db.showIconBorder == false then
        return false
    end
    local branch = getActiveLayoutBranch()
    if branch == "default" then
        button._tmUsesThirdPartyActionChrome = nil
        return false
    end
    if button._tmUsesThirdPartyActionChrome then
        return true
    end
    if branch == "ndui" or branch == "ndui_plus" then
        if tryNDuiSkinOnButton(button) then
            button._tmUsesThirdPartyActionChrome = "ndui"
            return true
        end
        return false
    elseif branch == "elvui" then
        if (isAddOnLoadedCompat("ElvUI") or _G.ElvUI) and type(_G.ElvUI) == "table" then
            local okUnpack, E = pcall(unpack, _G.ElvUI)
            if okUnpack and type(E) == "table" and type(E.GetModule) == "function" then
                local okSkin, S = pcall(E.GetModule, E, "Skins", true)
                if okSkin and type(S) == "table" and type(S.HandleButton) == "function" then
                    local okH = pcall(function()
                        S:HandleButton(button)
                    end)
                    if okH then
                        button._tmUsesThirdPartyActionChrome = "elvui"
                        return true
                    end
                end
            end
        end
    end
    return false
end

local function applyElementMenuButtonBorder(button, selected)
    if not button or not button.tmOuterBorder then
        return
    end
    if button._tmUsesThirdPartyActionChrome then
        applyActionButtonOuterBorderStyle(button)
        if selected then
            button.tmOuterBorder:Show()
            setActionButtonOuterBorderColor(
                button,
                MENU_SELECTED_BORDER_COLOR[1],
                MENU_SELECTED_BORDER_COLOR[2],
                MENU_SELECTED_BORDER_COLOR[3],
                MENU_SELECTED_BORDER_COLOR[4]
            )
        else
            setActionButtonOuterBorderColor(button)
            button.tmOuterBorder:Hide()
        end
        return
    end
    if selected then
        button.tmOuterBorder:Show()
        setActionButtonOuterBorderColor(
            button,
            MENU_SELECTED_BORDER_COLOR[1],
            MENU_SELECTED_BORDER_COLOR[2],
            MENU_SELECTED_BORDER_COLOR[3],
            MENU_SELECTED_BORDER_COLOR[4]
        )
    else
        setActionButtonOuterBorderColor(button)
        if ST.db.showIconBorder ~= false then
            button.tmOuterBorder:Show()
        else
            button.tmOuterBorder:Hide()
        end
    end
end

local function applySelectableMenuButtonStyle(button, selected)
    if button and button.icon then
        button.icon:SetVertexColor(1, 1, 1, 1)
        button.icon:SetAlpha(MENU_ICON_ALPHA)
    end
    applyElementMenuButtonBorder(button, selected)
    if button then
        button:SetAlpha(MENU_ICON_ALPHA)
    end
end

local function setupSelectableMenuState(menu, spells, selectedSpell)
    if not menu then
        return
    end
    menu.tmSpells = spells
    menu.tmSelectedSpell = selectedSpell
end

local function refreshSelectableMenuBorders(menu)
    if not menu or not menu:IsShown() or not menu.buttons or not menu.tmSpells then
        return
    end
    for i = 1, #menu.tmSpells do
        local button = menu.buttons[i]
        local spellInfo = menu.tmSpells[i]
        local spellID = type(spellInfo) == "table" and spellInfo.id or spellInfo
        applyElementMenuButtonBorder(button, spellID and (spellID == menu.tmSelectedSpell))
    end
end

local function applyButtonBorderVisible(button, visible)
    if not button then
        return
    end
    applyActionButtonOuterBorderStyle(button)
    if button.tmOuterBorder then
        setActionButtonOuterBorderColor(button)
        if visible then
            local useOurBorder = true
            if ST.db.showIconBorder ~= false and tryThirdPartyActionButtonSkin(button) then
                useOurBorder = false
                button.tmOuterBorder:Hide()
            end
            if useOurBorder then
                button.tmOuterBorder:Show()
            end
        else
            button.tmOuterBorder:Hide()
        end
    end
    if visible then
        if button._tmHiddenDecorRegions then
            for i = 1, #button._tmHiddenDecorRegions do
                local info = button._tmHiddenDecorRegions[i]
                local region = info and info.region
                if region then
                    if info.shown and region.Show then
                        region:Show()
                    elseif not info.shown and region.Hide then
                        region:Hide()
                    end
                    if region.SetAlpha then
                        region:SetAlpha(info.alpha or 1)
                    end
                end
            end
            button._tmHiddenDecorRegions = nil
        end
    else
        local hidden = {}
        local n = select("#", button:GetRegions())
        for i = 1, n do
            local region = select(i, button:GetRegions())
            if region
                and region.GetObjectType
                and region:GetObjectType() == "Texture"
                and region ~= button.icon
                and region ~= button.tmEmptyFill then
                hidden[#hidden + 1] = {
                    region = region,
                    alpha = (region.GetAlpha and region:GetAlpha()) or 1,
                    shown = region.IsShown and region:IsShown() or true,
                }
                if region.SetAlpha then
                    region:SetAlpha(0)
                end
                if region.Hide then
                    region:Hide()
                end
            end
        end
        button._tmHiddenDecorRegions = hidden
    end
    if not button._tmUsesThirdPartyActionChrome then
        clearActionButtonTemplateArtifacts(button)
    end
end

local function createHiddenSecureButton(name)
    local b = CreateFrame("Button", name, UIParent, "SecureActionButtonTemplate")
    b:SetSize(1, 1)
    b:Hide()
    registerSecureClicks(b)
    return b
end

local function createTextSecureButton(name, parent, width, height)
    local b = CreateFrame("Button", name, parent, "SecureActionButtonTemplate")
    b:SetSize(width, height)
    registerSecureClicks(b)
    local bg = b:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(b)
    bg:SetColorTexture(0.08, 0.08, 0.08, 0.85)
    b.bg = bg

    local border = CreateFrame("Frame", nil, b, "BackdropTemplate")
    border:SetPoint("TOPLEFT", -3, 2)
    border:SetPoint("BOTTOMRIGHT", 1, -1)
    if border.SetBackdrop then
        border:SetBackdrop({
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 },
        })
        border:SetBackdropBorderColor(0.45, 0.45, 0.45, 0.9)
    end
    b.border = border
    bg:ClearAllPoints()
    bg:SetPoint("TOPLEFT", border, "TOPLEFT", 3, -3)
    bg:SetPoint("BOTTOMRIGHT", border, "BOTTOMRIGHT", -3, 3)

    local text = b:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    text:SetPoint("CENTER", b, "CENTER", 0, 0)
    text:SetJustifyH("CENTER")
    b.text = text

    b:SetScript("OnEnter", function(self)
        if self.bg then
            self.bg:SetColorTexture(0.14, 0.14, 0.14, 0.95)
        end
    end)
    b:SetScript("OnLeave", function(self)
        if self.bg then
            self.bg:SetColorTexture(0.08, 0.08, 0.08, 0.85)
        end
    end)

    function b:SetText(value)
        if self.text then
            self.text:SetText(value or "")
        end
    end
    return b
end

local function getCurrentPreset()
    return ST.Presets:GetCurrentSummonPreset()
end

local function normalizeTotemName(name)
    if not name or name == "" then
        return ""
    end
    name = tostring(name)
    name = name:gsub("%s*%b()", "")
    name = name:gsub("%s+[IVXLCM]+$", "")
    name = name:gsub("%s+[Rr]ank%s*%d+$", "")
    name = name:gsub("%s*等级%s*%d+$", "")
    name = name:gsub("%s+%d+$", "")
    name = name:gsub("%s+", "")
    return string.lower(name)
end

local function getActiveTotemSpellID(slot, startTime, duration, now)
    local hasTotem, totemName, _, _, totemIcon = GetTotemInfo(slot)
    if not hasTotem or not totemName or totemName == "" then
        return nil
    end
    if not startTime or startTime <= 0 or not duration or duration <= 0 then
        return nil
    end
    local remain = (startTime + duration) - (now or GetTime())
    if remain <= 0 then
        return nil
    end
    local activeName = normalizeTotemName(totemName)
    local list = ST.SpellCatalog:GetElementSpells(slot)
    for i = 1, #list do
        local info = list[i]
        local spellName, _, spellIcon = GetSpellInfo(info.id)
        if info.name == totemName
            or spellName == totemName
            or normalizeTotemName(info.name) == activeName
            or normalizeTotemName(spellName) == activeName
            or (totemIcon and (info.icon == totemIcon or spellIcon == totemIcon)) then
            return info.id
        end
    end
    if totemIcon then
        for i = 1, #list do
            local info = list[i]
            local icon = select(3, GetSpellInfo(info.id))
            if info.icon == totemIcon or icon == totemIcon then
                return info.id
            end
        end
    end
    for i = 1, #list do
        local spellName = GetSpellInfo(list[i].id)
        if normalizeTotemName(spellName) == activeName then
            return list[i].id
        end
    end
    return nil
end

local function setElementButtonDisplaySpell(button, spellID)
    local targetSpellID = spellID or 0
    if button.displaySpellID == targetSpellID then
        return
    end
    button.displaySpellID = targetSpellID
    if not button.icon then
        return
    end
    if spellID and spellID ~= 0 then
        local icon = select(3, GetSpellInfo(spellID))
        if icon then
            button.icon:SetTexture(icon)
            applyIconTexCoord(button.icon)
            button.icon:SetVertexColor(1, 1, 1, 1)
            button.icon:SetAlpha(1)
            if button.tmEmptyFill then
                button.tmEmptyFill:Hide()
            end
        end
    else
        button.icon:SetTexture(nil)
        applyIconTexCoord(button.icon)
        button.icon:SetVertexColor(1, 1, 1, 1)
        button.icon:SetAlpha(0)
        if button.tmEmptyFill then
            button.tmEmptyFill:Show()
        end
    end
end

local function applyIconCooldownNumberSetting(button)
    if not button then
        return
    end
    button.noCooldownCount = true
    if not button.cooldown then
        return
    end
    button.cooldown.noCooldownCount = true
    if button.cooldown.SetHideCountdownNumbers then
        button.cooldown:SetHideCountdownNumbers(true)
    end
end

local function colorizeUnitName(unit)
    local name = UnitName(unit) or unit
    local _, class = UnitClass(unit)
    local classColors = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)
    local color = class and classColors and classColors[class]
    if color and color.r and color.g and color.b then
        return string.format("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, name), name
    end
    return name, name
end

local function colorizeTextForUnit(unit, text)
    if not text or text == "" then
        return ""
    end
    local _, class = UnitClass(unit)
    local classColors = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)
    local color = class and classColors and classColors[class]
    if color and color.r and color.g and color.b then
        return string.format("|cff%02x%02x%02x%s|r", color.r * 255, color.g * 255, color.b * 255, text)
    end
    return text
end

local function utf8truncate(str, maxChars)
    if not str or str == "" then
        return ""
    end
    if not maxChars or maxChars <= 0 then
        return ""
    end
    local len = #str
    local i = 1
    local chars = 0
    while i <= len do
        chars = chars + 1
        if chars > maxChars then
            return string.sub(str, 1, i - 1)
        end
        local c = string.byte(str, i)
        if c < 0x80 then
            i = i + 1
        elseif c < 0xE0 then
            i = i + 2
        elseif c < 0xF0 then
            i = i + 3
        else
            i = i + 4
        end
    end
    return str
end

local function utf8len(str)
    if not str or str == "" then
        return 0
    end
    local len = #str
    local i = 1
    local chars = 0
    while i <= len do
        chars = chars + 1
        local c = string.byte(str, i)
        if c < 0x80 then
            i = i + 1
        elseif c < 0xE0 then
            i = i + 2
        elseif c < 0xF0 then
            i = i + 3
        else
            i = i + 4
        end
    end
    return chars
end

local function formatEarthShieldTargetName(name)
    local raw = tostring(name or "")
    if raw == "" then
        return ""
    end
    raw = raw:gsub("%-.+$", "")
    local mode = (ST and ST.db and ST.db.earthShieldTargetNameMode) or "full"
    if mode == "short" then
        local short = utf8truncate(raw, 3)
        if utf8len(raw) > 3 then
            return short .. "..."
        end
        return short
    end
    return raw
end

local function iterateMenus()
    local list = {}
    if callMenu then
        list[#list + 1] = callMenu
    end
    if shieldMenu then
        list[#list + 1] = shieldMenu
    end
    if weaponMenu then
        list[#list + 1] = weaponMenu
    end
    if earthTargetMenu then
        list[#list + 1] = earthTargetMenu
    end
    for _, slot in ipairs(ST.Config.ElementOrder) do
        local menu = elementMenusBySlot[slot]
        if menu then
            list[#list + 1] = menu
        end
    end
    return list
end

local function isProtectedMenuInCombat(menu)
    if not menu then
        return false
    end
    if not (InCombatLockdown and InCombatLockdown()) then
        return false
    end
    return menu.IsProtected and menu:IsProtected()
end

local function safeShowMenu(menu)
    if not menu then
        return false
    end
    if not menu:IsShown() then
        if isProtectedMenuInCombat(menu) then
            return false
        end
        menu:Show()
    end
    return true
end

local function safeHideMenu(menu)
    if not menu then
        return true
    end
    if not menu:IsShown() then
        return true
    end
    if isProtectedMenuInCombat(menu) then
        return false
    end
    menu:Hide()
    return true
end

local function hideMenuNow()
    local menus = iterateMenus()
    for i = 1, #menus do
        safeHideMenu(menus[i])
    end
end

local function hideOtherMenus(targetMenu)
    local menus = iterateMenus()
    for i = 1, #menus do
        local menu = menus[i]
        if menu and menu ~= targetMenu and menu:IsShown() then
            safeHideMenu(menu)
        end
    end
end

local function isAnyMenuShown()
    local menus = iterateMenus()
    for i = 1, #menus do
        if menus[i] and menus[i]:IsShown() then
            return true
        end
    end
    return false
end

local function isMouseOverMenusOrButtons()
    local menus = iterateMenus()
    for i = 1, #menus do
        local m = menus[i]
        if m and m:IsShown() and m:IsMouseOver() then
            return true
        end
    end
    for i = 1, #barButtons do
        if barButtons[i] and barButtons[i]:IsShown() and barButtons[i]:IsMouseOver() then
            return true
        end
    end
    return false
end

function UI:ScheduleHideMenu()
    hideTaskToken = hideTaskToken + 1
    local token = hideTaskToken
    if C_Timer and C_Timer.After then
        C_Timer.After(0.12, function()
            if token ~= hideTaskToken then
                return
            end
            local keep = false
            local menus = iterateMenus()
            for i = 1, #menus do
                local m = menus[i]
                if m and m:IsShown() and m:IsMouseOver() then
                    keep = true
                    break
                end
            end
            if not keep then
                for i = 1, #barButtons do
                    if barButtons[i]:IsMouseOver() then
                        keep = true
                        break
                    end
                end
            end
            if not keep then
                hideMenuNow()
            end
        end)
    else
        hideMenuNow()
    end
end

function UI:UpdateMenuAutoHide(elapsed)
    if not isAnyMenuShown() then
        self.menuHideIdle = 0
        return
    end
    if isMouseOverMenusOrButtons() then
        self.menuHideIdle = 0
        return
    end
    self.menuHideIdle = (self.menuHideIdle or 0) + (elapsed or 0)
    if self.menuHideIdle >= 0.2 then
        hideTaskToken = hideTaskToken + 1
        hideMenuNow()
        self.menuHideIdle = 0
    end
end

local function createMenuFrame(name)
    local f = CreateFrame("Frame", name, UIParent, "SecureHandlerEnterLeaveTemplate,SecureHandlerAttributeTemplate")
    f:SetFrameStrata("TOOLTIP")
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:SetScript("OnEnter", function()
        hideTaskToken = hideTaskToken + 1
    end)
    f:SetScript("OnLeave", function()
        UI:ScheduleHideMenu()
    end)
    f.buttons = {}
    f:Hide()
    return f
end

local function bindMenuSecureVisibility(anchorButton, menu)
    if not anchorButton or not menu then
        return false
    end
    local inCombat = InCombatLockdown and InCombatLockdown()
    if inCombat then
        if anchorButton.tmMenuSecureWrapInstalled and menu.tmMenuSecureWrapInstalled then
            return true
        end
        return false
    end
    if menu.GetParent and menu:GetParent() ~= anchorButton then
        menu:SetParent(anchorButton)
    end
    local menuName = menu:GetName() or tostring(menu)
    anchorButton:SetFrameRef("tm_menu", menu)
    if not anchorButton.tmMenuSecureWrapInstalled then
        anchorButton:WrapScript(anchorButton, "OnEnter", [[
            local menuFrame = self:GetFrameRef("tm_menu")
            if menuFrame then
                menuFrame:Show()
            end
        ]])
        anchorButton:WrapScript(anchorButton, "OnLeave", [[
            if not self:IsUnderMouse(true) then
                if PlayerInCombat() then
                    local menuFrame = self:GetFrameRef("tm_menu")
                    if menuFrame then
                        menuFrame:Hide()
                    end
                end
            end
        ]])
        anchorButton.tmMenuSecureWrapInstalled = true
    end
    if not menu.tmMenuSecureWrapInstalled then
        menu:WrapScript(menu, "OnLeave", [[
            local parent = self:GetParent()
            if not self:IsUnderMouse(true) and (not parent or not parent:IsUnderMouse(true)) then
                self:Hide()
            end
        ]])
        menu.tmMenuSecureWrapInstalled = true
    end
    anchorButton.tmBoundMenuName = menuName
    return true
end

local function buildIconMenuButtons(menu, count, size, gap, popupUp)
    if popupUp == nil then
        popupUp = true
    end
    for i = 1, #menu.buttons do
        menu.buttons[i]:Hide()
    end
    for i = 1, count do
        local b = menu.buttons[i]
        if not b then
            b = createActionButton(menu:GetName() .. "Button" .. i, menu, size)
            applyButtonBorderVisible(b, ST.db.showIconBorder ~= false)
            attachSpellTooltip(b)
            menu.buttons[i] = b
        end
        b:SetSize(size, size)
        b:ClearAllPoints()
        if popupUp then
            b:SetPoint("BOTTOMLEFT", MENU_BUTTON_BASE_X, MENU_BUTTON_BASE_Y + ((i - 1) * (size + gap)))
        else
            b:SetPoint("TOPLEFT", menu, "TOPLEFT", MENU_BUTTON_BASE_X, -MENU_BUTTON_BASE_Y - ((i - 1) * (size + gap)))
        end
        b:Show()
    end
end

local function buildTextMenuButtons(menu, count, width, height, gap, popupUp)
    if popupUp == nil then
        popupUp = true
    end
    for i = 1, #menu.buttons do
        menu.buttons[i]:Hide()
    end
    for i = 1, count do
        local b = menu.buttons[i]
        if not b then
            b = createTextSecureButton(menu:GetName() .. "Button" .. i, menu, width, height)
            menu.buttons[i] = b
        end
        b:SetSize(width, height)
        b:ClearAllPoints()
        if popupUp then
            b:SetPoint("BOTTOMLEFT", MENU_BUTTON_BASE_X, MENU_BUTTON_BASE_Y + ((i - 1) * (height + gap)))
        else
            b:SetPoint("TOPLEFT", menu, "TOPLEFT", MENU_BUTTON_BASE_X, -MENU_BUTTON_BASE_Y - ((i - 1) * (height + gap)))
        end
        b:Show()
    end
end

local function formatRemain(remain, formatMode)
    if remain <= 0 then
        return ""
    end
    if formatMode == "ms" and remain >= 60 then
        local total = math.floor(remain + 0.0001)
        local m = math.floor(total / 60)
        local s = total % 60
        return string.format("%d:%02d", m, s)
    end
    if remain >= 10 then
        return tostring(math.floor(remain + 0.5))
    end
    if ST.db.showDecimalBelowTen ~= false then
        return string.format("%.1f", remain)
    end
    return tostring(math.floor(remain + 0.5))
end

local function updateTimerColor(text, remain, duration)
    if getFontColorMode() == "custom" then
        local r, g, b, a = getConfiguredFontColorRGBA()
        setFontStringColorSafe(text, r, g, b, a)
        return
    end
    local remainPct = (duration and duration > 0) and (remain / duration) or 0
    if remainPct <= 0.15 or remain <= 6 then
        setFontStringColorSafe(text, 1, 0.2, 0.2, 1)
    elseif remainPct > 0.50 and remain > 10 then
        setFontStringColorSafe(text, 0.25, 1, 0.25, 1)
    else
        setFontStringColorSafe(text, 1, 0.9, 0.2, 1)
    end
end

local function formatIconRemain(remain, formatMode)
    if remain <= 0 then
        return ""
    end
    if formatMode == "ms" and remain >= 60 then
        local total = math.floor(remain + 0.0001)
        local m = math.floor(total / 60)
        local s = total % 60
        return string.format("%d:%02d", m, s)
    end
    if remain >= 10 then
        return tostring(math.floor(remain + 0.5))
    end
    if ST.db.showDecimalBelowTen ~= false then
        return string.format("%.1f", remain)
    end
    return tostring(math.floor(remain + 0.5))
end

function UI:ApplyTimerTextStyle(button)
    if not button.timerText then
        return
    end
    local isSecondary = button.tmTimerProfile == "secondary"
    local fontSize
    local offsetX
    local offsetY
    if isSecondary then
        fontSize = ST.db.timerOuterFontSizeSecondary or ST.db.timerOuterFontSize or ST.db.timerFontSize or 12
        offsetX = ST.db.timerOffsetXSecondary
        offsetY = ST.db.timerOffsetYSecondary
    else
        fontSize = ST.db.timerOuterFontSize or ST.db.timerFontSize or 12
        offsetX = ST.db.timerOffsetX
        offsetY = ST.db.timerOffsetY
    end
    if offsetX == nil then
        offsetX = ST.db.timerOffsetX
    end
    if offsetY == nil then
        offsetY = ST.db.timerOffsetY
    end
    local side
    if isSecondary then
        side = ST.db.timerOuterSideSecondary
        if side == nil or side == "" then
            side = ST.db.timerOuterSide or "below"
        end
    else
        side = ST.db.timerOuterSide or "below"
    end
    if side ~= "above" then
        side = "below"
    end
    button.timerText:ClearAllPoints()
    if side == "above" then
        button.timerText:SetPoint("BOTTOM", button, "TOP", offsetX, -offsetY)
    else
        button.timerText:SetPoint("TOP", button, "BOTTOM", offsetX, offsetY)
    end
    applyConfiguredFontStyle(button.timerText, fontSize)
end

function UI:ApplyIconTimerTextStyle(button)
    if not button or not button.iconTimerText then
        return
    end
    local isSecondary = button.tmTimerProfile == "secondary"
    local fontSize = isSecondary
        and (ST.db.timerInnerFontSizeSecondary or ST.db.timerInnerFontSize or 20)
        or (ST.db.timerInnerFontSize or 20)
    applyConfiguredFontStyle(button.iconTimerText, fontSize)
end

local function ensureButtonStackText(button)
    if not button then
        return nil
    end
    local function applyStackStyle(textObj)
        if not textObj then
            return
        end
        local fontSize = 16
        if button.tmTimerProfile == "secondary" and ST.db and ST.db.stackFontSizeSecondary ~= nil then
            fontSize = ST.db.stackFontSizeSecondary
        end
        applyConfiguredFontStyle(textObj, fontSize)
    end
    local function applyStackAnchor(textObj)
        if not textObj then
            return
        end
        local x = -2
        local y = 2
        if button.tmTimerProfile == "secondary" then
            if ST.db and ST.db.stackOffsetXSecondary ~= nil then
                x = ST.db.stackOffsetXSecondary
            end
            if ST.db and ST.db.stackOffsetYSecondary ~= nil then
                y = ST.db.stackOffsetYSecondary
            end
        end
        textObj:ClearAllPoints()
        textObj:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", x, y)
    end
    if button.tmStackText then
        applyStackAnchor(button.tmStackText)
        applyStackStyle(button.tmStackText)
        return button.tmStackText
    end
    local text = button:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
    applyStackAnchor(text)
    applyStackStyle(text)
    text:SetJustifyH("RIGHT")
    text:Hide()
    button.tmStackText = text
    return text
end

local function updateButtonStackVisual(button, active, stackCount)
    local text = ensureButtonStackText(button)
    if not text then
        return
    end
    local count = tonumber(stackCount) or 0
    if getFontColorMode() == "custom" then
        local r, g, b, a = getConfiguredFontColorRGBA()
        setFontStringColorSafe(text, r, g, b, a)
    else
        setFontStringColorSafe(text, 1, 1, 1, 1)
    end
    if active and count > 0 then
        local textValue = tostring(count)
        if text.tmLastText ~= textValue then
            text:SetText(textValue)
            text.tmLastText = textValue
        end
        if not text:IsShown() then
            text:Show()
        end
    else
        if text.tmLastText ~= "" then
            text:SetText("")
            text.tmLastText = ""
        end
        if text:IsShown() then
            text:Hide()
        end
    end
end

local function setFontStringTextSafe(textObj, value)
    if not textObj then
        return
    end
    local newValue = value or ""
    if textObj.tmLastText ~= newValue then
        textObj:SetText(newValue)
        textObj.tmLastText = newValue
    end
end

local function setRegionShownSafe(region, shouldShow)
    if not region then
        return
    end
    if shouldShow then
        if not region:IsShown() then
            region:Show()
        end
    elseif region:IsShown() then
        region:Hide()
    end
end

local function setIconVisualSafe(icon, r, g, b, a)
    if not icon then
        return
    end
    local nr, ng, nb, na = r or 1, g or 1, b or 1, a or 1
    if icon.tmColorR ~= nr or icon.tmColorG ~= ng or icon.tmColorB ~= nb then
        icon:SetVertexColor(nr, ng, nb, 1)
        icon.tmColorR, icon.tmColorG, icon.tmColorB = nr, ng, nb
    end
    if icon.tmAlpha ~= na then
        icon:SetAlpha(na)
        icon.tmAlpha = na
    end
end

local function tryShowOverlayGlow(button)
    local showOverlayGlow = _G and _G.ActionButton_ShowOverlayGlow
    if not button or not showOverlayGlow then
        return false
    end
    local ok = pcall(showOverlayGlow, button)
    if ok then
        button.tmUsingOverlayGlow = true
        return true
    end
    return false
end

local function tryHideOverlayGlow(button)
    local hideOverlayGlow = _G and _G.ActionButton_HideOverlayGlow
    if not button or not button.tmUsingOverlayGlow or not hideOverlayGlow then
        return
    end
    pcall(hideOverlayGlow, button)
    button.tmUsingOverlayGlow = nil
end

local function ensureReadyFlashTexture(button)
    if not button then
        return nil
    end
    if button.tmReadyFlash then
        return button.tmReadyFlash
    end
    local tex = button:CreateTexture(nil, "OVERLAY")
    tex:SetAllPoints(button)
    tex:SetColorTexture(1, 0.9, 0.25, 1)
    tex:SetBlendMode("ADD")
    tex:Hide()
    button.tmReadyFlash = tex
    return tex
end

local function startReadyFlash(button)
    if not button then
        return
    end
    button.tmReadyFlashEndTime = GetTime() + READY_FLASH_DURATION
    if tryShowOverlayGlow(button) then
        if button.tmReadyFlash then
            button.tmReadyFlash:Hide()
        end
        return
    end
    local tex = ensureReadyFlashTexture(button)
    if tex then
        tex:SetAlpha(0.95)
        tex:Show()
    end
end

local function updateReadyFlashVisual(button)
    if not button then
        return
    end
    local endTime = tonumber(button.tmReadyFlashEndTime) or 0
    if endTime <= 0 then
        tryHideOverlayGlow(button)
        if button.tmReadyFlash then
            button.tmReadyFlash:Hide()
        end
        return
    end
    local now = GetTime()
    local remain = endTime - now
    if remain <= 0 then
        button.tmReadyFlashEndTime = nil
        tryHideOverlayGlow(button)
        if button.tmReadyFlash then
            button.tmReadyFlash:Hide()
        end
        return
    end
    if button.tmUsingOverlayGlow then
        return
    end
    if not button.tmReadyFlash then
        return
    end
    local progress = 1 - (remain / READY_FLASH_DURATION)
    local pulse = 1 - progress
    button.tmReadyFlash:SetAlpha(0.95 * pulse)
    button.tmReadyFlash:Show()
end

local function updateReadyTransitionFlash(button, readyNow, enabled)
    if not button then
        return
    end
    if not enabled then
        button.tmPrevReadyState = readyNow and true or false
        button.tmReadyFlashEndTime = nil
        tryHideOverlayGlow(button)
        if button.tmReadyFlash then
            button.tmReadyFlash:Hide()
        end
        return
    end
    local ready = readyNow and true or false
    local prevReady = button.tmPrevReadyState
    if ready and prevReady == false then
        startReadyFlash(button)
    end
    button.tmPrevReadyState = ready
    updateReadyFlashVisual(button)
end

local function getButtonTimerConfig(button)
    local isSecondary = button and button.tmTimerProfile == "secondary"
    if isSecondary then
        return {
            showCooldownRing = ST.db.showCooldownRingSecondary ~= false,
            showIconNumber = ST.db.showIconCooldownNumberSecondary == true,
            showOuterNumber = ST.db.showNumericTimerSecondary ~= false,
            innerFormat = ST.db.timerInnerFormatSecondary or "s",
            outerFormat = ST.db.timerOuterFormatSecondary or "s",
        }
    end
    return {
        showCooldownRing = ST.db.showCooldownRing ~= false,
        showIconNumber = ST.db.showIconCooldownNumber == true,
        showOuterNumber = ST.db.showNumericTimer ~= false,
        innerFormat = ST.db.timerInnerFormat or "s",
        outerFormat = ST.db.timerOuterFormat or "s",
    }
end

local function updateButtonTimerVisual(button, active, startTime, duration, remain, allowOuter)
    if not button then
        return
    end
    local cfg = getButtonTimerConfig(button)
    if button.cooldown then
        local allowCooldownRing = cfg.showCooldownRing and not button.tmDisableCooldownRing
        if allowCooldownRing and active and duration and duration > 0 then
            local shouldReset = true
            if button.tmCooldownActive
                and button.tmCooldownStart
                and button.tmCooldownDuration
                and math.abs((button.tmCooldownStart or 0) - (startTime or 0)) < 0.05
                and math.abs((button.tmCooldownDuration or 0) - (duration or 0)) < 0.05 then
                shouldReset = false
            end
            if shouldReset then
                button.cooldown:SetCooldown(startTime or 0, duration or 0)
                button.tmCooldownStart = startTime or 0
                button.tmCooldownDuration = duration or 0
            end
            button.tmCooldownActive = true
            button.cooldown:Show()
        else
            if button.tmCooldownActive then
                button.cooldown:SetCooldown(0, 0)
            end
            button.tmCooldownActive = false
            button.tmCooldownStart = nil
            button.tmCooldownDuration = nil
            button.cooldown:Hide()
        end
    end
    if button.iconTimerText then
        if cfg.showIconNumber and active and remain > 0 then
            setFontStringTextSafe(button.iconTimerText, formatIconRemain(remain, cfg.innerFormat))
            updateTimerColor(button.iconTimerText, remain, duration)
            setRegionShownSafe(button.iconTimerText, true)
        else
            setFontStringTextSafe(button.iconTimerText, "")
            setRegionShownSafe(button.iconTimerText, false)
        end
    end
    if button.timerText then
        if allowOuter and cfg.showOuterNumber and active and remain > 0 then
            setFontStringTextSafe(button.timerText, formatRemain(remain, cfg.outerFormat))
            updateTimerColor(button.timerText, remain, duration)
            setRegionShownSafe(button.timerText, true)
        else
            setFontStringTextSafe(button.timerText, "")
            setRegionShownSafe(button.timerText, false)
        end
    end
end

local function getSpellCooldownState(spellID)
    if not spellID or spellID == 0 then
        return false, 0, 0, 0
    end
    local startTime, duration = GetSpellCooldown(spellID)
    if not startTime or not duration or startTime <= 0 or duration <= 0 then
        return false, 0, 0, 0
    end
    if duration <= SPELL_COOLDOWN_GCD_THRESHOLD then
        return false, 0, 0, 0
    end
    local now = GetTime()
    local remain = (startTime + duration) - now
    if remain <= 0 then
        return false, 0, 0, 0
    end
    return true, startTime, duration, remain
end

local function getBuffRemainBySpellIDs(unit, spellIDs)
    if not unit or not UnitExists(unit) then
        return nil
    end
    local targets = {}
    for i = 1, #spellIDs do
        local name = GetSpellInfo(spellIDs[i])
        if name and name ~= "" then
            targets[name] = true
        end
    end
    if not next(targets) then
        return nil
    end
    local now = GetTime()
    for i = 1, 40 do
        local name, _, count, _, _, v6, v7 = UnitBuff(unit, i)
        if not name then
            break
        end
        if targets[name] then
            local stackCount = tonumber(count) or 0
            local duration, expires
            if type(v6) == "number" and type(v7) == "number" then
                duration = v6
                expires = v7
            elseif type(v6) == "number" and v6 > now then
                expires = v6
            elseif type(v7) == "number" and v7 > now then
                expires = v7
            end
            if expires and expires > now then
                local remain = expires - now
                if remain > 0 then
                    if not duration or duration <= 0 then
                        duration = remain
                    end
                    return remain, duration, expires - duration, stackCount
                end
            end
        end
    end
    return nil
end

local function resolveStableAuraTimer(button, active, remain, duration)
    if not button then
        return 0, 0
    end
    if not active or not remain or remain <= 0 then
        button.tmAuraEndTime = nil
        button.tmAuraDuration = nil
        button.tmAuraPrevRemain = nil
        return 0, 0
    end
    local now = GetTime()
    local prevRemain = tonumber(button.tmAuraPrevRemain) or 0
    local isNewAura = (not button.tmAuraEndTime)
        or (remain > (prevRemain + 1.0))
        or ((button.tmAuraEndTime - now) < -0.5)
    local validDuration = (duration and duration > 0) and duration or nil
    if validDuration then
        if isNewAura or math.abs((button.tmAuraDuration or 0) - validDuration) > 0.25 then
            button.tmAuraDuration = validDuration
            button.tmAuraEndTime = now + remain
        end
    elseif isNewAura then
        button.tmAuraDuration = math.max(remain, 1)
        button.tmAuraEndTime = now + remain
    end
    button.tmAuraPrevRemain = remain
    local stableDuration = math.max(tonumber(button.tmAuraDuration) or remain or 1, 1)
    local stableStart = (button.tmAuraEndTime or (now + remain)) - stableDuration
    return stableStart, stableDuration
end

local function hasRenewedLifeGlyph()
    if not GetGlyphSocketInfo then
        return false
    end
    local sockets = (GetNumGlyphSockets and GetNumGlyphSockets()) or 6
    for i = 1, sockets do
        local enabled, _, glyphSpellID = GetGlyphSocketInfo(i)
        if enabled and glyphSpellID and glyphSpellID > 0 then
            if ST.Config.RenewedLifeGlyphSpellID and glyphSpellID == ST.Config.RenewedLifeGlyphSpellID then
                return true
            end
            local glyphName = GetSpellInfo(glyphSpellID)
            if glyphName and (glyphName:find("新生") or string.lower(glyphName):find("renewed life", 1, true)) then
                return true
            end
        end
    end
    return false
end

local function getReincarnationState()
    local spellID = ST.Config.ReincarnationSpellID
    local start, duration = GetSpellCooldown(spellID)
    local now = GetTime()
    local remain = 0
    if start and duration and start > 0 and duration > 0 then
        remain = (start + duration) - now
        if remain < 0 then
            remain = 0
        end
    end
    local hasGlyph = hasRenewedLifeGlyph()
    local ankhCount = 0
    if GetItemCount and ST.Config.AnkhItemID then
        ankhCount = tonumber(GetItemCount(ST.Config.AnkhItemID) or 0) or 0
    end
    local charges = hasGlyph and 0 or math.max(0, ankhCount)
    local active = remain > 0
    return {
        active = active,
        remain = remain,
        duration = active and duration or 0,
        startTime = active and start or 0,
        hasGlyph = hasGlyph,
        charges = charges,
        missingReagent = (not hasGlyph) and charges <= 0,
    }
end

function UI:GetEarthShieldTimerUnit()
    if ST.db and ST.db.earthShieldTarget and ST.db.earthShieldTarget ~= "" then
        local targetName = ST.db.earthShieldTarget
        if UnitName("player") == targetName and not UnitIsDeadOrGhost("player") then
            return "player"
        end
        local units = self:GetGroupUnitList()
        for i = 1, #units do
            local unit = units[i]
            if UnitExists(unit) and UnitName(unit) == targetName and UnitIsFriend("player", unit) and not UnitIsDeadOrGhost(unit) then
                return unit
            end
        end
    end
    if UnitExists("maintank1") and UnitIsFriend("player", "maintank1") and not UnitIsDeadOrGhost("maintank1") then
        return "maintank1"
    end
    if UnitExists("maintank2") and UnitIsFriend("player", "maintank2") and not UnitIsDeadOrGhost("maintank2") then
        return "maintank2"
    end
    if UnitExists("focus") and UnitIsFriend("player", "focus") and not UnitIsDeadOrGhost("focus") then
        return "focus"
    end
    return nil
end

function UI:RefreshButtonBorderVisibility()
    local showBorder = ST.db.showIconBorder ~= false
    applyButtonBorderVisible(self.callButton, showBorder)
    for _, slot in ipairs(ST.Config.ElementOrder) do
        applyButtonBorderVisible(self.elementButtons and self.elementButtons[slot], showBorder)
    end
    applyButtonBorderVisible(self.shieldButton, showBorder)
    applyButtonBorderVisible(self.weaponButton, showBorder)
    applyButtonBorderVisible(self.reincarnationButton, showBorder)
    applyButtonBorderVisible(self.earthShieldButton, showBorder)
    local menus = iterateMenus()
    for i = 1, #menus do
        local menu = menus[i]
        if menu and menu.buttons then
            for j = 1, #menu.buttons do
                applyButtonBorderVisible(menu.buttons[j], showBorder)
            end
        end
    end
    refreshSelectableMenuBorders(callMenu)
    for _, slot in ipairs(ST.Config.ElementOrder) do
        refreshSelectableMenuBorders(elementMenusBySlot[slot])
    end
    refreshSelectableMenuBorders(shieldMenu)
    refreshSelectableMenuBorders(weaponMenu)
    if earthTargetMenu then
        refreshSelectableMenuBorders(earthTargetMenu)
    end
    local function refreshOneButtonIcon(btn)
        if btn and btn.icon then
            applyIconTexCoord(btn.icon)
        end
    end
    refreshOneButtonIcon(self.callButton)
    for _, slot in ipairs(ST.Config.ElementOrder) do
        refreshOneButtonIcon(self.elementButtons and self.elementButtons[slot])
    end
    refreshOneButtonIcon(self.shieldButton)
    refreshOneButtonIcon(self.weaponButton)
    refreshOneButtonIcon(self.reincarnationButton)
    refreshOneButtonIcon(self.earthShieldButton)
    if self.secondaryButtons then
        for i = 1, #self.secondaryButtons do
            refreshOneButtonIcon(self.secondaryButtons[i])
        end
    end
    local menusForIcons = iterateMenus()
    for i = 1, #menusForIcons do
        local menu = menusForIcons[i]
        if menu and menu.buttons then
            for j = 1, #menu.buttons do
                refreshOneButtonIcon(menu.buttons[j])
            end
        end
    end
end

function UI:UpdateTotemTimers(forceSecondary)
    if not self.mainFrame or not self.mainFrame:IsShown() then
        return
    end
    local nowForThrottle = GetTime()
    local runSecondary = forceSecondary ~= false
    if not runSecondary then
        local nextUpdateAt = tonumber(self.tmNextSecondaryUpdateAt) or 0
        if nowForThrottle >= nextUpdateAt then
            runSecondary = true
        end
    end
    if runSecondary then
        self.tmNextSecondaryUpdateAt = nowForThrottle + SECONDARY_TIMER_UPDATE_INTERVAL
    end
    for _, slot in ipairs(ST.Config.ElementOrder) do
        local button = self.elementButtons[slot]
        if button then
            local _, _, startTime, duration = GetTotemInfo(slot)
            local now = GetTime()
            local remain = (startTime and duration and startTime > 0 and duration > 0) and ((startTime + duration) - now) or 0
            local hasActiveTotem = remain > 0
            local activeSpellID = hasActiveTotem and getActiveTotemSpellID(slot, startTime, duration, now) or nil
            button.activeTotemSpellID = activeSpellID

            local presetSpellID = ST.Presets:GetSpell(getCurrentPreset(), slot)
            if activeSpellID then
                setElementButtonDisplaySpell(button, activeSpellID)
            else
                setElementButtonDisplaySpell(button, presetSpellID)
            end

            local timerActive = hasActiveTotem
            local timerStart = startTime or 0
            local timerDuration = duration or 0
            local timerRemain = remain or 0
            local hasSpellCooldown = false
            local cdActive, cdStart, cdDuration, cdRemain = getSpellCooldownState(presetSpellID)
            if not hasActiveTotem then
                if cdActive then
                    timerActive = true
                    timerStart = cdStart
                    timerDuration = cdDuration
                    timerRemain = cdRemain
                    hasSpellCooldown = true
                end
            end

            updateButtonTimerVisual(button, timerActive, timerStart, timerDuration, timerRemain, true)
            updateReadyTransitionFlash(
                button,
                (presetSpellID and presetSpellID ~= 0) and (not hasActiveTotem) and (not cdActive),
                ST.db.flashReadyMainElements ~= false
            )
            if button.icon and button.displaySpellID and button.displaySpellID ~= 0 then
                if hasActiveTotem then
                    setIconVisualSafe(button.icon, 1, 1, 1, 1)
                elseif hasSpellCooldown then
                    setIconVisualSafe(button.icon, 0.8, 0.8, 0.8, 0.8)
                else
                    setIconVisualSafe(button.icon, 1, 1, 1, 1)
                end
            end
        end
    end
    if runSecondary then
        if self.shieldButton and self.shieldButton:IsShown() then
            local shieldIDs = (#ST.SpellCatalog.knownShield > 0) and ST.SpellCatalog.knownShield or ST.Config.ShieldSpellIDs
            local remain, duration, startTime, stackCount = getBuffRemainBySpellIDs("player", shieldIDs)
            local active = remain and remain > 0
            if active then
                startTime, duration = resolveStableAuraTimer(self.shieldButton, true, remain, duration)
            else
                resolveStableAuraTimer(self.shieldButton, false, 0, 0)
            end
            updateButtonTimerVisual(self.shieldButton, active and true or false, startTime or 0, duration or 0, remain or 0, true)
            updateButtonStackVisual(self.shieldButton, active and true or false, stackCount)
        end
        if self.weaponButton and self.weaponButton:IsShown() then
            local hasMain, mainExpirationMS = GetWeaponEnchantInfo()
            local remain = (hasMain and mainExpirationMS and mainExpirationMS > 0) and (mainExpirationMS / 1000) or 0
            local active = remain > 0
            local duration = 0
            local startTime = 0
            if active then
                local now = GetTime()
                local defaultDuration = tonumber(ST.Config.WeaponEnchantDuration) or 1800
                local prevRemain = tonumber(self.weaponButton.tmEnchantPrevRemain) or 0
                local isNewEnchant = (not self.weaponButton.tmEnchantEndTime)
                    or remain > (prevRemain + 1.5)
                    or (self.weaponButton.tmEnchantEndTime - now) < -0.5
                if isNewEnchant then
                    self.weaponButton.tmEnchantEndTime = now + remain
                    self.weaponButton.tmEnchantDuration = math.max(remain, defaultDuration, 1)
                end
                duration = math.max(tonumber(self.weaponButton.tmEnchantDuration) or 0, remain or 0, 1)
                startTime = (self.weaponButton.tmEnchantEndTime or (now + remain)) - duration
                self.weaponButton.tmEnchantPrevRemain = remain
            else
                self.weaponButton.tmEnchantEndTime = nil
                self.weaponButton.tmEnchantDuration = nil
                self.weaponButton.tmEnchantPrevRemain = nil
            end
            updateButtonTimerVisual(self.weaponButton, active, startTime, duration, remain, true)
            updateButtonStackVisual(self.weaponButton, false, 0)
            updateReadyTransitionFlash(
                self.weaponButton,
                not active,
                ST.db.flashReadyWeapon ~= false
            )
        end
        if self.reincarnationButton and self.reincarnationButton:IsShown() then
            local state = getReincarnationState()
            updateButtonTimerVisual(self.reincarnationButton, state.active, state.startTime, state.duration, state.remain, true)
            if state.hasGlyph then
                updateButtonStackVisual(self.reincarnationButton, false, 0)
            else
                updateButtonStackVisual(self.reincarnationButton, state.charges > 0, state.charges)
            end
            if self.reincarnationButton.icon then
                if state.missingReagent then
                    setIconVisualSafe(self.reincarnationButton.icon, 1, 0.35, 0.35, 0.9)
                else
                    setIconVisualSafe(self.reincarnationButton.icon, 1, 1, 1, 1)
                end
            end
            self.reincarnationButton.tmReincState = state
            updateReadyTransitionFlash(
                self.reincarnationButton,
                (not state.active) and (not state.missingReagent),
                ST.db.flashReadyReincarnation ~= false
            )
        end
        if self.earthShieldButton and self.earthShieldButton:IsShown() then
            local earthUnit = self:GetEarthShieldTimerUnit()
            local remain, duration, startTime, stackCount = nil, nil, nil, nil
            if earthUnit then
                remain, duration, startTime, stackCount = getBuffRemainBySpellIDs(earthUnit, { ST.Config.EarthShieldSpellID })
            end
            local active = remain and remain > 0
            if active then
                startTime, duration = resolveStableAuraTimer(self.earthShieldButton, true, remain, duration)
            else
                resolveStableAuraTimer(self.earthShieldButton, false, 0, 0)
            end
            updateButtonTimerVisual(self.earthShieldButton, active and true or false, startTime or 0, duration or 0, remain or 0, ST.db.showEarthShieldTargetText == false)
            updateButtonStackVisual(self.earthShieldButton, active and true or false, stackCount)
        end
    end
end

function UI:BuildEarthShieldMacro()
    local spell = GetSpellInfo(ST.Config.EarthShieldSpellID) or "Earth Shield"
    local lines = {}
    lines[#lines + 1] = "/cast [@focus,help,nodead] " .. spell
    if ST.db.earthShieldTarget and ST.db.earthShieldTarget ~= "" then
        lines[#lines + 1] = "/cast [@" .. ST.db.earthShieldTarget .. ",help,nodead] " .. spell
    end
    lines[#lines + 1] = "/cast [@maintank1,help,nodead] " .. spell
    lines[#lines + 1] = "/cast [@maintank2,help,nodead] " .. spell
    lines[#lines + 1] = "/cast [@target,help,nodead] " .. spell
    lines[#lines + 1] = "/cast [@player] " .. spell
    return table.concat(lines, "\n")
end

function UI:HasEarthShieldTarget()
    if ST.db and ST.db.earthShieldTarget and ST.db.earthShieldTarget ~= "" then
        local targetName = ST.db.earthShieldTarget
        if UnitName("player") == targetName and not UnitIsDeadOrGhost("player") then
            return true
        end
        local units = self:GetGroupUnitList()
        for i = 1, #units do
            local unit = units[i]
            if UnitExists(unit) and UnitName(unit) == targetName and UnitIsFriend("player", unit) and not UnitIsDeadOrGhost(unit) then
                return true
            end
        end
    end
    if UnitExists("maintank1") and UnitIsFriend("player", "maintank1") and not UnitIsDeadOrGhost("maintank1") then
        return true
    end
    if UnitExists("maintank2") and UnitIsFriend("player", "maintank2") and not UnitIsDeadOrGhost("maintank2") then
        return true
    end
    if UnitExists("focus") and UnitIsFriend("player", "focus") and not UnitIsDeadOrGhost("focus") then
        return true
    end
    return false
end

function UI:RefreshEarthShieldMacro()
    if not self.earthShieldButton then
        return
    end
    local macro = self:BuildEarthShieldMacro()
    self.earthShieldButton:SetAttribute("type1", "macro")
    self.earthShieldButton:SetAttribute("macrotext1", macro)
    self.earthShieldButton:SetAttribute("*type1", "macro")
    self.earthShieldButton:SetAttribute("*macrotext1", macro)
    self:UpdateEarthShieldTargetText()
end

function UI:GetColoredEarthShieldTargetName(targetName)
    if not targetName or targetName == "" then
        return ""
    end
    if getFontColorMode() == "custom" then
        return formatEarthShieldTargetName(targetName)
    end
    if UnitExists("player") and UnitName("player") == targetName then
        return colorizeTextForUnit("player", formatEarthShieldTargetName(targetName))
    end
    local units = self:GetGroupUnitList()
    for i = 1, #units do
        local unit = units[i]
        if UnitExists(unit) and UnitName(unit) == targetName then
            return colorizeTextForUnit(unit, formatEarthShieldTargetName(targetName))
        end
    end
    return formatEarthShieldTargetName(targetName)
end

function UI:UpdateEarthShieldTargetText()
    if not self.earthShieldButton or not self.earthShieldButton.targetText then
        return
    end
    local name = ST.db and ST.db.earthShieldTarget or ""
    if name and name ~= "" and ST.db.showEarthShieldIcon and ST.db.showEarthShieldTargetText ~= false then
        if getFontColorMode() == "custom" then
            local r, g, b, a = getConfiguredFontColorRGBA()
            setFontStringColorSafe(self.earthShieldButton.targetText, r, g, b, a)
        else
            setFontStringColorSafe(self.earthShieldButton.targetText, 1, 1, 1, 1)
        end
        setFontStringTextSafe(self.earthShieldButton.targetText, self:GetColoredEarthShieldTargetName(name))
        setRegionShownSafe(self.earthShieldButton.targetText, true)
    else
        setFontStringTextSafe(self.earthShieldButton.targetText, "")
        setRegionShownSafe(self.earthShieldButton.targetText, false)
    end
end

function UI:GetGroupUnitList()
    local units = {}
    local inRaid = (IsInRaid and IsInRaid()) or ((GetNumRaidMembers and GetNumRaidMembers() or 0) > 0)
    local inGroup = (IsInGroup and IsInGroup()) or ((GetNumPartyMembers and GetNumPartyMembers() or 0) > 0)
    if inRaid then
        local n = GetNumGroupMembers() or 0
        for i = 1, n do
            local unit = "raid" .. i
            if UnitExists(unit) and UnitIsFriend("player", unit) then
                units[#units + 1] = unit
            end
        end
    elseif inGroup then
        local n = (GetNumSubgroupMembersCompat and GetNumSubgroupMembersCompat()) or 0
        for i = 1, n do
            local unit = "party" .. i
            if UnitExists(unit) and UnitIsFriend("player", unit) then
                units[#units + 1] = unit
            end
        end
    end

    if GetPartyAssignment and #units > 1 then
        table.sort(units, function(a, b)
            local aMain = GetPartyAssignment("MAINTANK", a) and 1 or 0
            local bMain = GetPartyAssignment("MAINTANK", b) and 1 or 0
            if aMain ~= bMain then
                return aMain > bMain
            end
            return (UnitName(a) or "") < (UnitName(b) or "")
        end)
    end
    return units
end

function UI:GetEarthShieldMenuUnitList()
    local out = {}
    local seen = {}
    local function pushUnit(unit)
        if not unit or not UnitExists(unit) or not UnitIsFriend("player", unit) or UnitIsDeadOrGhost(unit) then
            return
        end
        local nm = UnitName(unit)
        if not nm or nm == "" or seen[nm] then
            return
        end
        seen[nm] = true
        out[#out + 1] = unit
    end
    local full = self:GetGroupUnitList()
    if GetPartyAssignment then
        for i = 1, #full do
            local unit = full[i]
            if GetPartyAssignment("MAINTANK", unit) then
                pushUnit(unit)
            end
        end
    end
    if UnitExists("focus") and UnitIsFriend("player", "focus") and not UnitIsDeadOrGhost("focus") then
        pushUnit("focus")
    end
    if #out == 0 and UnitExists("player") and not UnitIsDeadOrGhost("player") then
        pushUnit("player")
    end
    return out
end

function UI:ShowCallMenu(anchorButton)
    if not callMenu then
        callMenu = createMenuFrame("TotemMaster_CallMenu")
    end
    if not bindMenuSecureVisibility(anchorButton, callMenu) and (InCombatLockdown and InCombatLockdown()) then
        return
    end
    local inCombat = InCombatLockdown and InCombatLockdown()
    local menuOffsetY = inCombat and 0 or MENU_OFFSET_Y
    hideTaskToken = hideTaskToken + 1
    hideOtherMenus(callMenu)
    if not inCombat then
        local size = BAR_SIZE
        local gap = getMainBarGap()
        local count = 3
        callMenu:SetSize(size, MENU_BUTTON_BASE_Y + (count * size) + ((count - 1) * gap))
        local popupUp = shouldMenuPopupUp(false)
        anchorMenuToButton(callMenu, anchorButton, menuOffsetY, popupUp)
        buildIconMenuButtons(callMenu, count, size, gap, popupUp)
        callMenu.tmReadyForCombat = true
    elseif not callMenu.tmReadyForCombat then
        return
    end
    local currentPreset = getCurrentPreset()
    setupSelectableMenuState(callMenu, ST.Config.CallSpellByPreset, ST.Config.CallSpellByPreset[currentPreset])
    for i = 1, 3 do
        local b = callMenu.buttons[i]
        if not b then
            break
        end
        b.tmPresetIndex = i
        if not inCombat then
            setButtonSpell(b, ST.Config.CallSpellByPreset[i], 1)
        end
        applySelectableMenuButtonStyle(b, i == currentPreset)
        if not b.tmCallMenuScriptBound then
            b:SetScript("PreClick", function(selfButton, mouseButton, down)
                if down then
                    return
                end
                if mouseButton == "LeftButton" then
                    local presetIndex = tonumber(selfButton.tmPresetIndex) or 1
                    ST:RunOrQueue("临时召唤前应用预设" .. presetIndex, function()
                        ST.CastEngine:ApplyPreset(presetIndex)
                    end)
                end
            end)
            b:SetScript("PostClick", function(selfButton, mouseButton, down)
                if down then
                    return
                end
                if mouseButton == "RightButton" then
                    local presetIndex = tonumber(selfButton.tmPresetIndex) or 1
                    ST.Presets:SetCurrentSummonPreset(presetIndex)
                    ST:RunOrQueue("切换召唤后应用预设" .. presetIndex, function()
                        ST.CastEngine:ApplyPreset(presetIndex)
                    end)
                    ST:RunOrQueue("刷新界面(召唤菜单)", function()
                        UI:RefreshAll()
                    end)
                end
                if mouseButton == "LeftButton" and C_Timer and C_Timer.After then
                    C_Timer.After(0.05, hideMenuNow)
                else
                    hideMenuNow()
                end
            end)
            b.tmCallMenuScriptBound = true
        end
    end
    safeShowMenu(callMenu)
end

function UI:ShowElementMenu(anchorButton, elementSlot)
    local menu = elementMenusBySlot[elementSlot]
    if not menu then
        menu = createMenuFrame("TotemMaster_ElementMenu" .. tostring(elementSlot))
        elementMenusBySlot[elementSlot] = menu
    end
    if not bindMenuSecureVisibility(anchorButton, menu) and (InCombatLockdown and InCombatLockdown()) then
        return
    end
    elementMenu = menu
    local inCombat = InCombatLockdown and InCombatLockdown()
    local menuOffsetY = inCombat and 0 or MENU_OFFSET_Y
    hideTaskToken = hideTaskToken + 1
    hideOtherMenus(menu)
    local preset = getCurrentPreset()
    local selectedSpell = ST.Presets:GetSpell(preset, elementSlot)
    local spells = ST.SpellCatalog:GetElementSpells(elementSlot)
    setupSelectableMenuState(menu, spells, selectedSpell)
    if not inCombat then
        local size = BAR_SIZE
        local gap = getMainBarGap()
        local count = #spells
        local menuHeight = (count * size) + ((count - 1) * gap)
        if menuHeight < size then menuHeight = size end
        menu:SetSize(size, MENU_BUTTON_BASE_Y + menuHeight)
        local popupUp = shouldMenuPopupUp(false)
        anchorMenuToButton(menu, anchorButton, menuOffsetY, popupUp)
        buildIconMenuButtons(menu, count, size, gap, popupUp)
        menu.tmReadyForCombat = true
    elseif not menu.tmReadyForCombat then
        return
    end
    for i = 1, #spells do
        local info = spells[i]
        local button = menu.buttons[i]
        if not button then
            break
        end
        button.tmElementSlot = elementSlot
        button.tmElementSpellID = info.id
        if not inCombat then
            setButtonSpell(button, info.id, 1)
        end
        applySelectableMenuButtonStyle(button, selectedSpell == info.id)
        if not button.tmElementMenuScriptBound then
            button:SetScript("PostClick", function(selfButton, mouseButton, down)
                if down then
                    return
                end
                if mouseButton == "RightButton" then
                    local preset = getCurrentPreset()
                    local slot = tonumber(selfButton.tmElementSlot) or 0
                    local spellID = tonumber(selfButton.tmElementSpellID) or 0
                    if slot > 0 then
                        ST.Presets:SetSpell(preset, slot, spellID)
                    end
                    ST:RunOrQueue("刷新界面(元素菜单)", function()
                        UI:RefreshAll()
                    end)
                    ST:RunOrQueue("更新预设" .. preset, function()
                        ST.CastEngine:ApplyPreset(preset)
                    end)
                end
                if mouseButton == "LeftButton" and C_Timer and C_Timer.After then
                    C_Timer.After(0.05, hideMenuNow)
                else
                    hideMenuNow()
                end
            end)
            button.tmElementMenuScriptBound = true
        end
    end
    safeShowMenu(menu)
end

function UI:ShowShieldMenu(anchorButton)
    if not shieldMenu then
        shieldMenu = createMenuFrame("TotemMaster_ShieldMenu")
    end
    if not bindMenuSecureVisibility(anchorButton, shieldMenu) and (InCombatLockdown and InCombatLockdown()) then
        return
    end
    local inCombat = InCombatLockdown and InCombatLockdown()
    local menuOffsetY = inCombat and 0 or MENU_OFFSET_Y
    hideTaskToken = hideTaskToken + 1
    hideOtherMenus(shieldMenu)
    local list = ST.SpellCatalog.knownShield
    setupSelectableMenuState(shieldMenu, list, ST.db.defaultShieldSpell)
    if not inCombat then
        local size = BAR_SIZE
        local gap = getSecondaryBarGap()
        local count = #list
        local menuHeight = (count * size) + ((count - 1) * gap)
        if menuHeight < size then menuHeight = size end
        shieldMenu:SetSize(size, MENU_BUTTON_BASE_Y + menuHeight)
        local popupUp = shouldMenuPopupUp(true)
        anchorMenuToButton(shieldMenu, anchorButton, menuOffsetY, popupUp)
        buildIconMenuButtons(shieldMenu, count, size, gap, popupUp)
        shieldMenu.tmReadyForCombat = true
    elseif not shieldMenu.tmReadyForCombat then
        return
    end
    for i = 1, #list do
        local spellID = list[i]
        local b = shieldMenu.buttons[i]
        if not b then
            break
        end
        b.tmShieldSpellID = spellID
        if not inCombat then
            setButtonSpell(b, spellID, 1)
        end
        applySelectableMenuButtonStyle(b, spellID == shieldMenu.tmSelectedSpell)
        if not b.tmShieldMenuScriptBound then
            b:SetScript("PostClick", function(selfButton, mouseButton, down)
                if down then
                    return
                end
                if mouseButton == "RightButton" then
                    ST.db.defaultShieldSpell = tonumber(selfButton.tmShieldSpellID) or ST.db.defaultShieldSpell
                    ST:RunOrQueue("刷新界面(护盾菜单)", function()
                        UI:RefreshAll()
                    end)
                end
                if mouseButton == "LeftButton" and C_Timer and C_Timer.After then
                    C_Timer.After(0.05, hideMenuNow)
                else
                    hideMenuNow()
                end
            end)
            b.tmShieldMenuScriptBound = true
        end
    end
    safeShowMenu(shieldMenu)
end

function UI:ShowWeaponMenu(anchorButton)
    if not weaponMenu then
        weaponMenu = createMenuFrame("TotemMaster_WeaponMenu")
    end
    if not bindMenuSecureVisibility(anchorButton, weaponMenu) and (InCombatLockdown and InCombatLockdown()) then
        return
    end
    local inCombat = InCombatLockdown and InCombatLockdown()
    local menuOffsetY = inCombat and 0 or MENU_OFFSET_Y
    hideTaskToken = hideTaskToken + 1
    hideOtherMenus(weaponMenu)
    local list = ST.SpellCatalog.knownWeapon
    setupSelectableMenuState(weaponMenu, list, ST.db.defaultWeaponSpell)
    if not inCombat then
        local size = BAR_SIZE
        local gap = getSecondaryBarGap()
        local count = #list
        local menuHeight = (count * size) + ((count - 1) * gap)
        if menuHeight < size then menuHeight = size end
        weaponMenu:SetSize(size, MENU_BUTTON_BASE_Y + menuHeight)
        local popupUp = shouldMenuPopupUp(true)
        anchorMenuToButton(weaponMenu, anchorButton, menuOffsetY, popupUp)
        buildIconMenuButtons(weaponMenu, count, size, gap, popupUp)
        weaponMenu.tmReadyForCombat = true
    elseif not weaponMenu.tmReadyForCombat then
        return
    end
    for i = 1, #list do
        local spellID = list[i]
        local b = weaponMenu.buttons[i]
        if not b then
            break
        end
        b.tmWeaponSpellID = spellID
        if not inCombat then
            setButtonSpell(b, spellID, 1)
        end
        applySelectableMenuButtonStyle(b, spellID == weaponMenu.tmSelectedSpell)
        if not b.tmWeaponMenuScriptBound then
            b:SetScript("PostClick", function(selfButton, mouseButton, down)
                if down then
                    return
                end
                if mouseButton == "RightButton" then
                    ST.db.defaultWeaponSpell = tonumber(selfButton.tmWeaponSpellID) or ST.db.defaultWeaponSpell
                    ST:RunOrQueue("刷新界面(武器菜单)", function()
                        UI:RefreshAll()
                    end)
                end
                if mouseButton == "LeftButton" and C_Timer and C_Timer.After then
                    C_Timer.After(0.05, hideMenuNow)
                else
                    hideMenuNow()
                end
            end)
            b.tmWeaponMenuScriptBound = true
        end
    end
    safeShowMenu(weaponMenu)
end

function UI:ShowEarthTargetMenu(anchorButton)
    if not earthTargetMenu then
        earthTargetMenu = createMenuFrame("TotemMaster_EarthTargetMenu")
    end
    if not bindMenuSecureVisibility(anchorButton, earthTargetMenu) and (InCombatLockdown and InCombatLockdown()) then
        return
    end
    local inCombat = InCombatLockdown and InCombatLockdown()
    local menuOffsetY = inCombat and 0 or MENU_OFFSET_Y
    hideTaskToken = hideTaskToken + 1
    hideOtherMenus(earthTargetMenu)
    local units = self:GetEarthShieldMenuUnitList()
    if #units == 0 then
        safeHideMenu(earthTargetMenu)
        return
    end
    local width = 120
    local height = 22
    local gap = 2
    local count = #units
    local menuHeight = (count * height) + ((count - 1) * gap)
    if menuHeight < height then menuHeight = height end
    if not inCombat then
        earthTargetMenu:SetSize(width, MENU_BUTTON_BASE_Y + menuHeight)
        local popupUp = shouldMenuPopupUp(true)
        anchorMenuToButton(earthTargetMenu, anchorButton, menuOffsetY, popupUp)
        buildTextMenuButtons(earthTargetMenu, count, width, height, gap, popupUp)
        earthTargetMenu.tmReadyForCombat = true
    elseif not earthTargetMenu.tmReadyForCombat then
        return
    end
    local spellName = GetSpellInfo(ST.Config.EarthShieldSpellID) or "Earth Shield"
    for i = 1, #units do
        local unit = units[i]
        local coloredName, plainName = colorizeUnitName(unit)
        local b = earthTargetMenu.buttons[i]
        if not b then
            break
        end
        b.tmEarthTargetName = plainName
        if not inCombat then
            b:SetText(coloredName)
            local macro = "/cast [@" .. unit .. ",help,nodead] " .. spellName
            b:SetAttribute("type1", "macro")
            b:SetAttribute("macrotext1", macro)
            b:SetAttribute("*type1", "macro")
            b:SetAttribute("*macrotext1", macro)
        end
        if not b.tmEarthTargetScriptBound then
            b:SetScript("PostClick", function(selfButton, mouseButton, down)
                if down then
                    return
                end
                if mouseButton == "RightButton" then
                    ST.db.earthShieldTarget = selfButton.tmEarthTargetName or ST.db.earthShieldTarget
                    ST:RunOrQueue("刷新地盾宏", function()
                        UI:RefreshEarthShieldMacro()
                    end)
                end
                hideMenuNow()
            end)
            b.tmEarthTargetScriptBound = true
        end
    end
    safeShowMenu(earthTargetMenu)
end

function UI:RefreshCallButton()
    if not self.callButton then
        return
    end
    local preset = getCurrentPreset()
    local callSpellID = ST.Config.CallSpellByPreset[preset]
    setButtonSpell(self.callButton, callSpellID, 1)
    self.callButton:SetAttribute("type2", "spell")
    self.callButton:SetAttribute("spell2", ST.Config.CallSpellIDs.Recall)
    self.callButton:SetAttribute("*type2", "spell")
    self.callButton:SetAttribute("*spell2", ST.Config.CallSpellIDs.Recall)
end

function UI:RefreshElementButtons()
    local preset = getCurrentPreset()
    for _, slot in ipairs(ST.Config.ElementOrder) do
        local button = self.elementButtons[slot]
        if button then
            local spellID = ST.Presets:GetSpell(preset, slot)
            button.activeTotemSpellID = nil
            button.displaySpellID = nil
            setButtonSpell(button, spellID, 1)
            setElementButtonDisplaySpell(button, spellID)
        end
    end
end

function UI:RefreshSecondaryButtons()
    if self.shieldButton and ST.db.defaultShieldSpell then
        setButtonSpell(self.shieldButton, ST.db.defaultShieldSpell, 1)
    end
    if self.weaponButton and ST.db.defaultWeaponSpell then
        setButtonSpell(self.weaponButton, ST.db.defaultWeaponSpell, 1)
    end
    if self.reincarnationButton then
        setButtonSpell(self.reincarnationButton, ST.Config.ReincarnationSpellID, 1)
    end
    if self.earthShieldButton then
        setButtonSpell(self.earthShieldButton, ST.Config.EarthShieldSpellID, 1)
        self:RefreshEarthShieldMacro()
    end
end

function UI:ApplyLayout()
    if not self.mainFrame then
        return
    end
    self.mainFrame:SetScale(ST.db.mainScale or 1)
    self.secondaryFrame:SetScale(ST.db.secondaryScale or 1)
    local mainGap = getMainBarGap()
    local secondaryGap = getSecondaryBarGap()
    local mainButtonCount = 1 + #ST.Config.ElementOrder
    self.mainFrame:SetSize((mainButtonCount * BAR_SIZE) + ((mainButtonCount - 1) * mainGap) + 8, BAR_SIZE + 8)
    if self.callButton then
        self.callButton:ClearAllPoints()
        self.callButton:SetPoint("TOPLEFT", self.mainFrame, "TOPLEFT", 4, -4)
        local prev = self.callButton
        for _, slot in ipairs(ST.Config.ElementOrder) do
            local b = self.elementButtons[slot]
            if b then
                b:ClearAllPoints()
                b:SetPoint("LEFT", prev, "RIGHT", mainGap, 0)
                prev = b
            end
        end
    end
    local visible = {}
    if ST.db.showShieldIcon then visible[#visible + 1] = self.shieldButton end
    if ST.db.showWeaponIcon then visible[#visible + 1] = self.weaponButton end
    if ST.db.showReincarnationIcon then visible[#visible + 1] = self.reincarnationButton end
    if ST.db.showEarthShieldIcon then visible[#visible + 1] = self.earthShieldButton end
    for i = 1, #self.secondaryButtons do
        self.secondaryButtons[i]:Hide()
    end
    if #visible == 0 then
        self.secondaryFrame:Hide()
    else
        self.secondaryFrame:Show()
        local size = BAR_SIZE
        for i = 1, #visible do
            local b = visible[i]
            b:Show()
            b:ClearAllPoints()
            if i == 1 then
                b:SetPoint("TOPLEFT", self.secondaryFrame, "TOPLEFT", 0, 0)
            else
                b:SetPoint("LEFT", visible[i - 1], "RIGHT", secondaryGap, 0)
            end
        end
        self.secondaryFrame:SetSize((#visible * size) + ((#visible - 1) * secondaryGap), size)
    end
    if ST.db.splitSecondaryBar then
        self.secondaryFrame:SetParent(UIParent)
        self.secondaryFrame:SetMovable(true)
        self.secondaryFrame:EnableMouse(true)
        self.secondaryFrame:RegisterForDrag("LeftButton")
        self.secondaryFrame:SetScript("OnDragStart", function(frame)
            if ST.db.lock then return end
            frame:StartMoving()
        end)
        self.secondaryFrame:SetScript("OnDragStop", function(frame)
            frame:StopMovingOrSizing()
            local p, _, rp, x, y = frame:GetPoint()
            ST.db.secondaryPoint = { p, "UIParent", rp, x, y }
        end)
        local sp = ST.db.secondaryPoint or ST.defaults.secondaryPoint
        self.secondaryFrame:ClearAllPoints()
        self.secondaryFrame:SetPoint(sp[1], _G[sp[2]] or UIParent, sp[3], sp[4], sp[5])
    else
        self.secondaryFrame:SetParent(self.mainFrame)
        self.secondaryFrame:SetMovable(false)
        self.secondaryFrame:EnableMouse(false)
        self.secondaryFrame:SetScript("OnDragStart", nil)
        self.secondaryFrame:SetScript("OnDragStop", nil)
        self.secondaryFrame:ClearAllPoints()
        local lastMainButton = self.elementButtons[ST.Config.ElementOrder[#ST.Config.ElementOrder]]
        if lastMainButton then
            self.secondaryFrame:SetPoint("LEFT", lastMainButton, "RIGHT", mainGap, 0)
        else
            self.secondaryFrame:SetPoint("TOPLEFT", self.mainFrame, "TOPRIGHT", mainGap, -4)
        end
    end
end

function UI:RefreshTimerVisibility()
    for _, slot in ipairs(ST.Config.ElementOrder) do
        local b = self.elementButtons[slot]
        if b then
            local cfg = getButtonTimerConfig(b)
            self:ApplyTimerTextStyle(b)
            self:ApplyIconTimerTextStyle(b)
            applyIconCooldownNumberSetting(b)
            if (not cfg.showCooldownRing or b.tmDisableCooldownRing) and b.cooldown then
                b.cooldown:Hide()
            end
            if not cfg.showIconNumber and b.iconTimerText then
                b.iconTimerText:SetText("")
                b.iconTimerText:Hide()
            end
            if not cfg.showOuterNumber and b.timerText then
                b.timerText:SetText("")
                b.timerText:Hide()
            end
        end
    end
    local secondaryTimerButtons = { self.shieldButton, self.weaponButton, self.reincarnationButton, self.earthShieldButton }
    for i = 1, #secondaryTimerButtons do
        local b = secondaryTimerButtons[i]
        if b then
            local cfg = getButtonTimerConfig(b)
            self:ApplyTimerTextStyle(b)
            self:ApplyIconTimerTextStyle(b)
            applyIconCooldownNumberSetting(b)
            if not cfg.showCooldownRing and b.cooldown then
                b.cooldown:Hide()
            end
            if not cfg.showIconNumber and b.iconTimerText then
                b.iconTimerText:SetText("")
                b.iconTimerText:Hide()
            end
            if not cfg.showOuterNumber and b.timerText then
                b.timerText:SetText("")
                b.timerText:Hide()
            end
        end
    end
    if self.earthShieldButton and self.earthShieldButton.targetText then
        local fontSize = ST.db.earthShieldTargetFontSize
            or (ST.db.timerOuterFontSizeSecondary or ST.db.timerOuterFontSize or ST.db.timerFontSize or 12)
        applyConfiguredFontStyle(self.earthShieldButton.targetText, fontSize)
        self:UpdateEarthShieldTargetText()
    end
end

function UI:ApplySettings()
    self:ApplyLayout()
    self:RefreshButtonBorderVisibility()
    self:RefreshTimerVisibility()
    self:RefreshSettingsState()
    self:RefreshAll()
end

function UI:PromptReloadForBorderChange(oldValue, newValue, checkButton)
    if oldValue == newValue then
        return
    end
    ST.db.showIconBorder = newValue and true or false
    local staticPopupDialogs = _G.StaticPopupDialogs
    local staticPopupShow = _G.StaticPopup_Show
    local staticPopupHide = _G.StaticPopup_Hide
    if not staticPopupDialogs or not staticPopupShow then
        if ReloadUI then
            ReloadUI()
        end
        return
    end
    local dialogKey = "TOTEMMASTER_RELOAD_UI_BORDER"
    if not staticPopupDialogs[dialogKey] then
        staticPopupDialogs[dialogKey] = {
            text = "图标边框变更需要重载界面，是否立即重载？",
            button1 = "确定",
            button2 = "取消",
            OnAccept = function()
                if ReloadUI then
                    ReloadUI()
                end
            end,
            OnCancel = function()
                local data = UI.borderReloadPending
                if not data then
                    return
                end
                ST.db.showIconBorder = data.oldValue and true or false
                UI:RefreshButtonBorderVisibility()
                if data.checkButton and data.checkButton.SetChecked then
                    data.checkButton:SetChecked(ST.db.showIconBorder ~= false)
                end
            end,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        }
    end
    UI.borderReloadPending = {
        oldValue = oldValue,
        checkButton = checkButton,
    }
    if staticPopupHide then
        staticPopupHide(dialogKey)
    end
    staticPopupShow(dialogKey)
end

function UI:RefreshPanelButtonThirdPartySkins()
    local list = self.settingsUIPanelButtons
    if list then
        for i = 1, #list do
            applyThirdPartySkinToPanelButton(list[i])
        end
    else
        applyThirdPartySkinToPanelButton(self.fontColorModeButton)
        applyThirdPartySkinToPanelButton(self.fontColorButton)
    end
end

function UI:RefreshCheckButtonThirdPartySkins()
    local list = self.settingsCheckButtons
    if not list then
        return
    end
    for i = 1, #list do
        applyThirdPartySkinToCheckButton(list[i])
    end
end

function UI:RefreshSettingsSliderThirdPartySkins()
    local list = self.settingsSliders
    if not list then
        return
    end
    for i = 1, #list do
        applyThirdPartySkinToSettingsSlider(list[i])
    end
end

function UI:RefreshSettingsState()
    if self.secondaryScaleRow and self.secondaryScaleSlider then
        local enabled = ST.db and ST.db.splitSecondaryBar
        self.secondaryScaleRow:SetAlpha(enabled and 1 or 0.45)

        if self.secondaryScaleSlider.EnableMouse then
            self.secondaryScaleSlider:EnableMouse(enabled and true or false)
        end
        if self.secondaryScaleSlider.Enable and self.secondaryScaleSlider.Disable then
            if enabled then
                self.secondaryScaleSlider:Enable()
            else
                self.secondaryScaleSlider:Disable()
            end
        end
        local thumb = self.secondaryScaleSlider.GetThumbTexture and self.secondaryScaleSlider:GetThumbTexture() or nil
        if thumb and thumb.SetAlpha then
            thumb:SetAlpha(enabled and 1 or 0.35)
        end

        if self.secondaryGapRow and self.secondaryGapSlider then
            self.secondaryGapRow:SetAlpha(enabled and 1 or 0.45)
            if self.secondaryGapSlider.EnableMouse then
                self.secondaryGapSlider:EnableMouse(enabled and true or false)
            end
            if self.secondaryGapSlider.Enable and self.secondaryGapSlider.Disable then
                if enabled then
                    self.secondaryGapSlider:Enable()
                else
                    self.secondaryGapSlider:Disable()
                end
            end
            local gapThumb = self.secondaryGapSlider.GetThumbTexture and self.secondaryGapSlider:GetThumbTexture() or nil
            if gapThumb and gapThumb.SetAlpha then
                gapThumb:SetAlpha(enabled and 1 or 0.35)
            end
        end
    end

    if self.fontColorButton then
        local customMode = getFontColorMode() == "custom"
        self.fontColorButton:SetAlpha(customMode and 1 or 0.45)
        if self.fontColorButton.EnableMouse then
            self.fontColorButton:EnableMouse(customMode and true or false)
        end
        if self.fontColorButton.tmRefresh then
            self.fontColorButton:tmRefresh()
        end
    end
end

local sliderIndex = 0
local fontDropdownIndex = 0

local function createCheck(parent, text, x, y, getter, setter)
    local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    cb:SetPoint("TOPLEFT", x, y)
    local label = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", cb, "RIGHT", 6, 0)
    label:SetText(text)
    cb:SetChecked(getter())
    cb:SetScript("OnClick", function(self)
        setter(self:GetChecked())
    end)
    if UI.settingsCheckButtons then
        table.insert(UI.settingsCheckButtons, cb)
    end
    applyThirdPartySkinToCheckButton(cb)
    if C_Timer and C_Timer.After then
        C_Timer.After(0, function()
            applyThirdPartySkinToCheckButton(cb)
        end)
        C_Timer.After(0.2, function()
            applyThirdPartySkinToCheckButton(cb)
        end)
    end
    return cb
end

local function createFormatToggle(parent, labelText, x, y, width, getter, setter)
    local options = {
        { value = "s", text = "秒" },
        { value = "ms", text = "分:秒" },
    }
    local function getIndex(value)
        for i = 1, #options do
            if options[i].value == value then
                return i
            end
        end
        return 1
    end
    local buttonWidth = math.min(96, math.max(72, math.floor(width * 0.42)))
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", parent, "TOPLEFT", x + 2, y - 12)
    label:SetWidth(math.max(20, width - buttonWidth - 10))
    label:SetJustifyH("LEFT")
    label:SetText(labelText)

    local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    b:SetPoint("TOPRIGHT", parent, "TOPLEFT", x + width, y)
    b:SetSize(buttonWidth, 24)
    local customText
    if not b.SetText then
        customText = b:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        customText:SetPoint("CENTER", b, "CENTER", 0, 0)
        customText:SetJustifyH("CENTER")
    end
    local function setLabel(text)
        if b.SetText then
            b:SetText(text)
        elseif customText then
            customText:SetText(text or "")
        end
    end
    local function refreshText()
        local idx = getIndex(getter())
        setLabel(options[idx].text)
    end
    b:SetScript("OnClick", function()
        local idx = getIndex(getter())
        local nextIdx = (idx % #options) + 1
        setter(options[nextIdx].value)
        refreshText()
    end)
    refreshText()
    registerSettingsUIPanelButton(b)
    return b
end

local function createOuterTimerSideToggle(parent, x, y, width, getter, setter)
    local options = {
        { value = "below", text = "下" },
        { value = "above", text = "上" },
    }
    local function getIndex(value)
        for i = 1, #options do
            if options[i].value == value then
                return i
            end
        end
        return 1
    end
    local buttonWidth = math.min(96, math.max(72, math.floor(width * 0.42)))
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", parent, "TOPLEFT", x + 2, y - 12)
    label:SetWidth(math.max(20, width - buttonWidth - 10))
    label:SetJustifyH("LEFT")
    label:SetText("外计时位置")

    local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    b:SetPoint("TOPRIGHT", parent, "TOPLEFT", x + width, y)
    b:SetSize(buttonWidth, 24)
    local customText
    if not b.SetText then
        customText = b:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        customText:SetPoint("CENTER", b, "CENTER", 0, 0)
        customText:SetJustifyH("CENTER")
    end
    local function setLabel(text)
        if b.SetText then
            b:SetText(text)
        elseif customText then
            customText:SetText(text or "")
        end
    end
    local function refreshText()
        local idx = getIndex(getter())
        setLabel(options[idx].text)
    end
    b:SetScript("OnClick", function()
        local idx = getIndex(getter())
        local nextIdx = (idx % #options) + 1
        setter(options[nextIdx].value)
        refreshText()
    end)
    refreshText()
    registerSettingsUIPanelButton(b)
    return b
end

local function createMenuPopupDirectionToggle(parent, x, y, width, getter, setter)
    local options = {
        { value = "up", text = "上" },
        { value = "down", text = "下" },
    }
    local function getIndex(value)
        for i = 1, #options do
            if options[i].value == value then
                return i
            end
        end
        return 1
    end
    local buttonWidth = math.min(96, math.max(72, math.floor(width * 0.42)))
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", parent, "TOPLEFT", x + 2, y - 12)
    label:SetWidth(math.max(20, width - buttonWidth - 10))
    label:SetJustifyH("LEFT")
    label:SetText("悬停菜单位置")

    local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    b:SetPoint("TOPRIGHT", parent, "TOPLEFT", x + width, y)
    b:SetSize(buttonWidth, 24)
    local customText
    if not b.SetText then
        customText = b:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        customText:SetPoint("CENTER", b, "CENTER", 0, 0)
        customText:SetJustifyH("CENTER")
    end
    local function setLabel(text)
        if b.SetText then
            b:SetText(text)
        elseif customText then
            customText:SetText(text or "")
        end
    end
    local function refreshText()
        local idx = getIndex(getter())
        setLabel(options[idx].text)
    end
    b:SetScript("OnClick", function()
        local idx = getIndex(getter())
        local nextIdx = (idx % #options) + 1
        setter(options[nextIdx].value)
        refreshText()
    end)
    refreshText()
    registerSettingsUIPanelButton(b)
    return b
end

local function createEarthTargetNameModeToggle(parent, x, y, width, getter, setter)
    local options = {
        { value = "full", text = "完整" },
        { value = "short", text = "简短" },
    }
    local function getIndex(value)
        for i = 1, #options do
            if options[i].value == value then
                return i
            end
        end
        return 1
    end
    local buttonWidth = math.min(96, math.max(72, math.floor(width * 0.42)))
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", parent, "TOPLEFT", x + 2, y - 12)
    label:SetWidth(math.max(20, width - buttonWidth - 10))
    label:SetJustifyH("LEFT")
    label:SetText("土盾目标玩家名")

    local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    b:SetPoint("TOPRIGHT", parent, "TOPLEFT", x + width, y)
    b:SetSize(buttonWidth, 24)
    local customText
    if not b.SetText then
        customText = b:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        customText:SetPoint("CENTER", b, "CENTER", 0, 0)
        customText:SetJustifyH("CENTER")
    end
    local function setLabel(text)
        if b.SetText then
            b:SetText(text)
        elseif customText then
            customText:SetText(text or "")
        end
    end
    local function refreshText()
        local idx = getIndex(getter())
        setLabel(options[idx].text)
    end
    b:SetScript("OnClick", function()
        local idx = getIndex(getter())
        local nextIdx = (idx % #options) + 1
        setter(options[nextIdx].value)
        refreshText()
    end)
    refreshText()
    registerSettingsUIPanelButton(b)
    return b
end

local function createFontColorModeToggle(parent, x, y, width, getter, setter, layoutConfig, controlColumnXOverride)
    local options = {
        { value = "smart", text = "智能" },
        { value = "custom", text = "统一自定义" },
    }
    local function getIndex(value)
        for i = 1, #options do
            if options[i].value == value then
                return i
            end
        end
        return 1
    end
    local buttonWidth = math.min(126, math.max(96, math.floor(width * 0.5)))
    local appliedLayout = layoutConfig or getTimerFontDropdownLayoutConfig(TIMER_FONT_DROPDOWN_LAYOUT)
    local controlColumnX = resolveControlColumnX(parent, nil, x, width, appliedLayout, controlColumnXOverride)
    local visualOffsetX = getTimerFontButtonVisualOffsetX()
    local visualControlColumnX = controlColumnX + visualOffsetX
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", parent, "TOPLEFT", x + 2, y - 12)
    label:SetWidth(getControlLabelWidthByColumn(x, visualControlColumnX, 8))
    if label.SetWordWrap then
        label:SetWordWrap(false)
    end
    label:SetJustifyH("LEFT")
    label:SetText("字体颜色模式")

    local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    b:SetPoint("TOPLEFT", parent, "TOPLEFT", visualControlColumnX, y)
    b:SetSize(buttonWidth, 24)
    b.tmControlY = y
    b.tmLabel = label
    b.tmVisualOffsetX = visualOffsetX
    local function refreshText()
        local idx = getIndex(getter())
        b:SetText(options[idx].text)
    end
    b:SetScript("OnClick", function()
        local idx = getIndex(getter())
        local nextIdx = (idx % #options) + 1
        setter(options[nextIdx].value)
        refreshText()
    end)
    refreshText()
    registerSettingsUIPanelButton(b)
    return b
end

local fontColorPickerSourceButton
local function ensureFontColorPickerHideHook()
    if not ColorPickerFrame or ColorPickerFrame.tmTotemMasterHideHook then
        return
    end
    ColorPickerFrame.tmTotemMasterHideHook = true
    ColorPickerFrame:HookScript("OnHide", function()
        fontColorPickerSourceButton = nil
    end)
end

local function createFontColorPickerRow(parent, x, y, width, getter, setter, anchorParent, anchorX, anchorY, layoutConfig, controlColumnXOverride)
    local appliedLayout = layoutConfig or getTimerFontDropdownLayoutConfig(TIMER_FONT_DROPDOWN_LAYOUT)
    local controlColumnX = resolveControlColumnX(parent, nil, x, width, appliedLayout, controlColumnXOverride)
    local visualOffsetX = getTimerFontButtonVisualOffsetX()
    local visualControlColumnX = controlColumnX + visualOffsetX
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", parent, "TOPLEFT", x + 2, y - 12)
    label:SetWidth(getControlLabelWidthByColumn(x, visualControlColumnX, 8))
    if label.SetWordWrap then
        label:SetWordWrap(false)
    end
    label:SetJustifyH("LEFT")
    label:SetText("计时字体颜色")

    local previewButton = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    previewButton:SetPoint("TOPLEFT", parent, "TOPLEFT", visualControlColumnX, y)
    previewButton:SetSize(80, 24)
    previewButton:SetText("选择")
    previewButton.tmControlY = y
    previewButton.tmLabel = label
    previewButton.tmVisualOffsetX = visualOffsetX

    local swatch = previewButton:CreateTexture(nil, "ARTWORK")
    swatch:SetSize(16, 16)
    swatch:SetPoint("LEFT", previewButton, "LEFT", 6, 0)
    swatch:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")

    local function refreshPreview()
        local color = getter() or {}
        local r = tonumber(color.r) or 1
        local g = tonumber(color.g) or 1
        local b = tonumber(color.b) or 1
        local a = tonumber(color.a)
        if a == nil then
            a = 1
        end
        swatch:SetVertexColor(r, g, b, a)
    end

    previewButton:SetScript("OnClick", function()
        if not ColorPickerFrame then
            return
        end
        ensureFontColorPickerHideHook()
        if ColorPickerFrame:IsShown() and fontColorPickerSourceButton == previewButton then
            ColorPickerFrame:Hide()
            fontColorPickerSourceButton = nil
            return
        end
        fontColorPickerSourceButton = previewButton
        local color = getter() or {}
        local r = tonumber(color.r) or 1
        local g = tonumber(color.g) or 1
        local b = tonumber(color.b) or 1
        local a = tonumber(color.a)
        if a == nil then
            a = 1
        end
        ColorPickerFrame.func = function()
            local nr, ng, nb = ColorPickerFrame:GetColorRGB()
            local opacity = 0
            if OpacitySliderFrame and OpacitySliderFrame.GetValue then
                opacity = OpacitySliderFrame:GetValue() or 0
            end
            setter({ r = nr, g = ng, b = nb, a = 1 - opacity })
            refreshPreview()
        end
        ColorPickerFrame.opacityFunc = ColorPickerFrame.func
        ColorPickerFrame.cancelFunc = function(prev)
            if type(prev) ~= "table" then
                return
            end
            setter({
                r = tonumber(prev.r) or 1,
                g = tonumber(prev.g) or 1,
                b = tonumber(prev.b) or 1,
                a = tonumber(prev.a) or 1,
            })
            refreshPreview()
        end
        ColorPickerFrame.hasOpacity = true
        ColorPickerFrame.opacity = 1 - a
        ColorPickerFrame.previousValues = { r = r, g = g, b = b, a = a }
        ColorPickerFrame:SetColorRGB(r, g, b)
        if anchorParent and anchorParent.IsShown and anchorParent:IsShown() then
            ColorPickerFrame:ClearAllPoints()
            local ax = anchorX or 0
            local ay = anchorY or 0
            local br = getActiveLayoutBranch()
            if br == "ndui" or br == "ndui_plus" then
                ax = ax - 33.5
                ay = ay + 8
            elseif br == "elvui" then
                ax = ax - 18
            end
            ColorPickerFrame:SetPoint("TOPLEFT", anchorParent, "TOPLEFT", ax, ay)
        end
        ColorPickerFrame:Hide()
        ColorPickerFrame:Show()
    end)

    refreshPreview()
    previewButton.tmRefresh = refreshPreview
    registerSettingsUIPanelButton(previewButton)
    return previewButton
end

local function createDropdownToggle(parent, x, y, width, labelText, options, getter, setter, dropdownConfig, controlOffsetX, labelWidthExtra)
    local config = resolveDropdownLayoutConfig(dropdownConfig, controlOffsetX, labelWidthExtra)

    local dropdownWidth = config.dropdownWidth or DEFAULT_FONT_DROPDOWN_WIDTH
    local appliedControlOffsetX = tonumber(config.controlOffsetX) or 0
    local anchorBaseX = tonumber(config.anchorBaseX) or DEFAULT_DROPDOWN_ANCHOR_X
    local anchorY = tonumber(config.anchorY) or DEFAULT_DROPDOWN_ANCHOR_Y
    local buttonHeight = tonumber(config.buttonHeight) or DEFAULT_DROPDOWN_BUTTON_HEIGHT
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", parent, "TOPLEFT", x + 2, y - 12)
    label:SetWidth(getControlLabelWidth(x, width, config))
    label:SetJustifyH("LEFT")
    label:SetText(labelText)
    local canUseDropdown = UIDropDownMenu_Initialize and UIDropDownMenu_CreateInfo and UIDropDownMenu_AddButton
    if not canUseDropdown then
        local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
        b:SetPoint("TOPRIGHT", parent, "TOPLEFT", x + width + appliedControlOffsetX, y)
        b:SetSize(dropdownWidth, buttonHeight)
        local customText
        if not b.SetText then
            customText = b:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            customText:SetPoint("CENTER", b, "CENTER", 0, 0)
            customText:SetJustifyH("CENTER")
        end
        local function findCurrentOption()
            local selected = getter()
            for i = 1, #options do
                if options[i].value == selected then
                    return i
                end
            end
            return 1
        end
        local function setLabel(text)
            if b.SetText then
                b:SetText(text)
            elseif customText then
                customText:SetText(text or "")
            end
        end
        local function refreshText()
            local idx = findCurrentOption()
            setLabel(options[idx].text)
        end
        b:SetScript("OnClick", function()
            local idx = findCurrentOption()
            local nextIdx = (idx % #options) + 1
            setter(options[nextIdx].value)
            refreshText()
        end)
        refreshText()
        registerSettingsUIPanelButton(b)
        return b
    end

    fontDropdownIndex = fontDropdownIndex + 1
    local dropdownName = "TotemMaster_FontDropdown" .. fontDropdownIndex
    local dropdown = CreateFrame("Frame", dropdownName, parent, "UIDropDownMenuTemplate")
    dropdown.tmAnchorParent = parent
    dropdown.tmAnchorX = x + width + anchorBaseX + appliedControlOffsetX
    dropdown.tmAnchorY = y + anchorY
    dropdown:SetPoint("TOPRIGHT", parent, "TOPLEFT", dropdown.tmAnchorX, dropdown.tmAnchorY)
    UIDropDownMenu_SetWidth(dropdown, dropdownWidth)
    UIDropDownMenu_SetButtonWidth(dropdown, dropdownWidth)
    UIDropDownMenu_JustifyText(dropdown, "LEFT")

    local function syncDropdownListGeometry()
        local list = _G["DropDownList1"]
        if not list or _G["UIDROPDOWNMENU_OPEN_MENU"] ~= dropdown then
            return
        end
        local function forceOpaqueFrame(frame)
            if not frame then
                return
            end
            if frame.SetAlpha then
                frame:SetAlpha(1)
            end
            if frame.SetBackdropColor then
                local r, g, b = 0, 0, 0
                if frame.GetBackdropColor then
                    local cr, cg, cb = frame:GetBackdropColor()
                    r = tonumber(cr) or 0
                    g = tonumber(cg) or 0
                    b = tonumber(cb) or 0
                end
                frame:SetBackdropColor(r, g, b, 1)
            end
            if frame.SetBackdropBorderColor then
                local r, g, b = 1, 1, 1
                if frame.GetBackdropBorderColor then
                    local cr, cg, cb = frame:GetBackdropBorderColor()
                    r = tonumber(cr) or 1
                    g = tonumber(cg) or 1
                    b = tonumber(cb) or 1
                end
                frame:SetBackdropBorderColor(r, g, b, 1)
            end
        end
        local function forceOpaqueRegions(frame)
            if not frame or not frame.GetRegions then
                return
            end
            local count = select("#", frame:GetRegions())
            for i = 1, count do
                local region = select(i, frame:GetRegions())
                if region and region.SetAlpha then
                    region:SetAlpha(1)
                end
                if region and region.SetVertexColor and region.GetVertexColor then
                    local r, g, b = region:GetVertexColor()
                    region:SetVertexColor(tonumber(r) or 1, tonumber(g) or 1, tonumber(b) or 1, 1)
                end
            end
        end
        local function forceOpaqueKnownChildren(frame)
            if not frame then
                return
            end
            local keys = { "backdrop", "Backdrop", "MenuBackdrop", "menuBackdrop", "bg", "BG", "bd", "shadow", "Shadow", "__bg", "__bd" }
            for i = 1, #keys do
                local child = frame[keys[i]]
                if child then
                    forceOpaqueFrame(child)
                    forceOpaqueRegions(child)
                end
            end
        end
        forceOpaqueFrame(list)
        forceOpaqueFrame(list.backdrop)
        forceOpaqueRegions(list)
        forceOpaqueRegions(list.backdrop)
        forceOpaqueKnownChildren(list)
        if list.SetAlpha then
            list:SetAlpha(1)
        end
        local listName = list.GetName and list:GetName() or nil
        if listName then
            local backdrop = _G[listName .. "Backdrop"]
            forceOpaqueFrame(backdrop)
            forceOpaqueRegions(backdrop)
            local menuBackdrop = _G[listName .. "MenuBackdrop"]
            forceOpaqueFrame(menuBackdrop)
            forceOpaqueRegions(menuBackdrop)
            forceOpaqueKnownChildren(backdrop)
            forceOpaqueKnownChildren(menuBackdrop)
        end

        if _G["NDui"] ~= nil or _G["NDui_Plus"] ~= nil then
            local darkR, darkG, darkB, darkA = 0, 0, 0, 1
            local function applyDarkDropDownListBackdrop(f)
                if not f or not f.SetBackdropColor then
                    return
                end
                f:SetBackdropColor(darkR, darkG, darkB, darkA)
                if f.SetBackdropBorderColor then
                    f:SetBackdropBorderColor(0, 0, 0, 1)
                end
            end
            local function nduiDarkenBackdropTree(frame, depthLeft)
                if not frame then
                    return
                end
                applyDarkDropDownListBackdrop(frame)
                if frame.SetAlpha then
                    frame:SetAlpha(1)
                end
                forceOpaqueRegions(frame)
                if depthLeft <= 0 then
                    return
                end
                local n = frame.GetNumChildren and frame:GetNumChildren() or 0
                for i = 1, n do
                    nduiDarkenBackdropTree(select(i, frame:GetChildren()), depthLeft - 1)
                end
            end
            local function nduiDarkenDropDownShell(shell)
                if not shell then
                    return
                end
                nduiDarkenBackdropTree(shell, 3)
            end
            applyDarkDropDownListBackdrop(list)
            applyDarkDropDownListBackdrop(list.backdrop)
            if listName then
                nduiDarkenDropDownShell(_G[listName .. "Backdrop"])
                nduiDarkenDropDownShell(_G[listName .. "MenuBackdrop"])
            end
            local maxLvl = _G["UIDROPDOWNMENU_MAXLEVELS"] or 3
            for lvl = 1, maxLvl do
                nduiDarkenDropDownShell(_G["DropDownList" .. lvl .. "Backdrop"])
                nduiDarkenDropDownShell(_G["DropDownList" .. lvl .. "MenuBackdrop"])
            end
            nduiDarkenDropDownShell(list.backdrop)
        end

        local targetWidth = dropdownWidth
        if (not targetWidth or targetWidth <= 0) and UIDropDownMenu_GetWidth then
            targetWidth = UIDropDownMenu_GetWidth(dropdown)
        end
        if (not targetWidth or targetWidth <= 0) and dropdown.GetWidth then
            targetWidth = dropdown:GetWidth()
        end
        if targetWidth and targetWidth > 0 then
            local currentWidth = list:GetWidth() or 0
            local delta = targetWidth - currentWidth
            if math.abs(delta) > 0.5 then
                local maxButtons = _G["UIDROPDOWNMENU_MAXBUTTONS"] or 32
                for i = 1, maxButtons do
                    local button = _G["DropDownList1Button" .. i]
                    if button and button:IsShown() then
                        local btnWidth = button:GetWidth() or 0
                        button:SetWidth(math.max(10, btnWidth + delta))
                    end
                end
                list:SetWidth(targetWidth)
            end
        end

        local maxButtons = _G["UIDROPDOWNMENU_MAXBUTTONS"] or 32
        for i = 1, maxButtons do
            local button = _G["DropDownList1Button" .. i]
            if button and button:IsShown() then
                if button.SetAlpha then
                    button:SetAlpha(1)
                end
                local text = _G["DropDownList1Button" .. i .. "NormalText"]
                if text then
                    text:ClearAllPoints()
                    if button.Check then
                        text:SetPoint("LEFT", button.Check, "RIGHT", 6, 0)
                    else
                        text:SetPoint("LEFT", button, "LEFT", 24, 0)
                    end
                    text:SetJustifyV("MIDDLE")
                end
            end
        end

        local listXOffset = 0
        local isElvUI = (_G["ElvUI"] ~= nil)
        if (not isElvUI) and dropdown.GetName then
            local name = dropdown:GetName()
            if name then
                local middleRegion = _G[name .. "Middle"]
                if middleRegion and middleRegion.GetObjectType then
                    local dropdownLeft = dropdown.GetLeft and dropdown:GetLeft() or nil
                    local visualLeft = middleRegion.GetLeft and middleRegion:GetLeft() or nil
                    if visualLeft and dropdownLeft then
                        listXOffset = math.floor((visualLeft - dropdownLeft) + 0.5) - 8
                    else
                        listXOffset = -8
                    end
                else
                    local leftRegion = _G[name .. "Left"]
                    if leftRegion and leftRegion.GetObjectType and leftRegion.GetLeft and dropdown.GetLeft then
                        local visualLeft = leftRegion:GetLeft()
                        local dropdownLeft = dropdown:GetLeft()
                        if visualLeft and dropdownLeft then
                            listXOffset = math.floor((visualLeft - dropdownLeft) + 0.5)
                        end
                    end
                end
            end
        end

        local listYOffset = 6
        if _G["NDui_Plus"] ~= nil or _G["NDui"] ~= nil then
            listYOffset = 6
        elseif _G["ElvUI"] ~= nil then
            listYOffset = -2
        end
        if _G["NDui_Plus"] ~= nil or _G["NDui"] ~= nil or _G["ElvUI"] ~= nil then
            listXOffset = listXOffset - 0.4
        end
        list:ClearAllPoints()
        list:SetPoint("TOPLEFT", dropdown, "BOTTOMLEFT", listXOffset, listYOffset)
    end

    local function getCurrentOption()
        local selected = getter()
        for i = 1, #options do
            if options[i].value == selected then
                return options[i]
            end
        end
        return options[1]
    end

    local function refreshDropdownText()
        local option = getCurrentOption()
        if UIDropDownMenu_SetSelectedValue then
            UIDropDownMenu_SetSelectedValue(dropdown, option.value)
        end
        if UIDropDownMenu_SetText then
            UIDropDownMenu_SetText(dropdown, option.text)
        end
    end

    UIDropDownMenu_Initialize(dropdown, function(_, level)
        if level ~= 1 then
            return
        end
        local selected = getter()
        for i = 1, #options do
            local option = options[i]
            local info = UIDropDownMenu_CreateInfo()
            info.text = option.text
            info.value = option.value
            info.checked = (option.value == selected)
            info.minWidth = dropdownWidth
            info.func = function(selfButton)
                setter(selfButton.value)
                refreshDropdownText()
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    dropdown.tmFontDropdown = true
    refreshDropdownText()
    applyExternalDropDownStyle(dropdown, dropdownWidth)
    if not dropdown.tmListGeometryHooked then
        dropdown.tmListGeometryHooked = true
        local ddButton = _G[dropdownName .. "Button"] or dropdown.Button
        if ddButton and ddButton.HookScript then
            ddButton:HookScript("OnClick", function()
                if C_Timer and C_Timer.After then
                    C_Timer.After(0, syncDropdownListGeometry)
                    C_Timer.After(0.05, syncDropdownListGeometry)
                    C_Timer.After(0.15, syncDropdownListGeometry)
                    if _G["NDui"] ~= nil or _G["NDui_Plus"] ~= nil then
                        C_Timer.After(0.25, syncDropdownListGeometry)
                    end
                else
                    syncDropdownListGeometry()
                end
            end)
        end

        local list = _G["DropDownList1"]
        if list and list.HookScript then
            list:HookScript("OnShow", function()
                syncDropdownListGeometry()
                if C_Timer and C_Timer.After then
                    C_Timer.After(0.05, syncDropdownListGeometry)
                    C_Timer.After(0.15, syncDropdownListGeometry)
                    if _G["NDui"] ~= nil or _G["NDui_Plus"] ~= nil then
                        C_Timer.After(0.25, syncDropdownListGeometry)
                    end
                end
            end)
        end
    end
    return dropdown
end

local function createFontFamilyToggle(parent, x, y, width, getter, setter, layoutConfig)
    local appliedLayout = layoutConfig or getTimerFontDropdownLayoutConfig(TIMER_FONT_DROPDOWN_LAYOUT)
    return createDropdownToggle(parent, x, y, width, "计时字体设置", buildFontOptionList(), getter, setter, appliedLayout)
end

local function createFontOutlineToggle(parent, x, y, width, getter, setter, layoutConfig)
    local appliedLayout = layoutConfig or getTimerFontDropdownLayoutConfig(TIMER_FONT_DROPDOWN_LAYOUT)
    return createDropdownToggle(parent, x, y, width, "计时字体描边", FONT_OUTLINE_OPTIONS, getter, setter, appliedLayout)
end

local function applyDropdownStyleWithRetry(owner, key, dropdownWidth)
    if not owner or not key then
        return
    end
    local dropdown = owner[key]
    if not dropdown then
        return
    end
    applyExternalDropDownStyle(dropdown, dropdownWidth)
    if C_Timer and C_Timer.After then
        C_Timer.After(0.2, function()
            local currentDropdown = owner[key]
            if currentDropdown then
                applyExternalDropDownStyle(currentDropdown, dropdownWidth)
            end
        end)
    end
end

local function formatSliderValue(step, value)
    if step >= 1 then
        return string.format("%d", value)
    end
    return string.format("%.2f", value)
end

local function createSlider(parent, text, x, y, width, minVal, maxVal, step, getter, setter)
    sliderIndex = sliderIndex + 1
    local name = "TotemMaster_SettingSlider" .. sliderIndex
    local row = CreateFrame("Frame", nil, parent)
    row:SetSize(width, 58)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)

    local s = CreateFrame("Slider", name, row, "OptionsSliderTemplate")
    s:SetPoint("TOPLEFT", row, "TOPLEFT", 0, -20)
    s:SetWidth(width)
    s:SetMinMaxValues(minVal, maxVal)
    s:SetValueStep(step)
    s:SetObeyStepOnDrag(true)
    local low = _G[name .. "Low"]
    local high = _G[name .. "High"]
    local txt = _G[name .. "Text"]
    if low then low:SetText("") end
    if high then high:SetText("") end
    if txt then txt:SetText("") end
    s:SetValue(getter())
    local labelText = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    labelText:SetPoint("TOP", row, "TOP", 0, 0)
    labelText:SetText(text)
    local valueText = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    valueText:SetPoint("TOPRIGHT", row, "TOPRIGHT", 0, 0)
    valueText:SetTextColor(1, 0.82, 0)
    local minText = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    minText:SetPoint("TOPLEFT", row, "TOPLEFT", 0, -44)
    minText:SetText(formatSliderValue(step, minVal))
    local maxText = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    maxText:SetPoint("TOPRIGHT", row, "TOPRIGHT", 0, -44)
    maxText:SetText(formatSliderValue(step, maxVal))
    s:SetScript("OnValueChanged", function(self, value)
        local v = math.floor((value / step) + 0.5) * step
        if math.abs(value - v) > 0.0001 then
            self:SetValue(v)
            return
        end
        valueText:SetText(formatSliderValue(step, v))
        setter(v)
    end)
    valueText:SetText(formatSliderValue(step, s:GetValue()))
    row.labelText = labelText
    row.valueText = valueText
    row.minText = minText
    row.maxText = maxText
    row.slider = s
    registerSettingsSlider(s)
    applyThirdPartySkinToSettingsSlider(s)
    return row, s
end

function UI:CreateSettings()
    if self.settingsFrame then
        return
    end
    self.settingsCheckButtons = {}
    self.settingsUIPanelButtons = {}
    self.settingsSliders = {}
    local f = CreateFrame("Frame", "TotemMaster_SettingsFrame", UIParent)
    f.name = "图腾大师"
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("TotemMaster")
    local subtitle = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -6)
    subtitle:SetText("萨满图腾管理插件设置")

    local tabContainer = CreateFrame("Frame", nil, f, "BackdropTemplate")
    tabContainer:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", 0, -8)
    tabContainer:SetPoint("TOPRIGHT", f, "TOPRIGHT", -30, -52)
    tabContainer:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -30, 12)
    if tabContainer.SetBackdrop then
        tabContainer:SetBackdrop({
            bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 },
        })
        tabContainer:SetBackdropColor(0.04, 0.04, 0.04, 0.75)
        tabContainer:SetBackdropBorderColor(0.36, 0.36, 0.36, 0.95)
    end

    local contentHost = CreateFrame("Frame", "TotemMaster_SettingsContentHost", f)
    contentHost:SetPoint("TOPLEFT", tabContainer, "TOPLEFT", 0, -34)
    contentHost:SetPoint("BOTTOMRIGHT", tabContainer, "BOTTOMRIGHT", SETTINGS_SCROLL_RIGHT_COMPENSATION, 0)

    local width = SETTINGS_CONTENT_WIDTH
    local twoColGap = 44
    local left = SETTINGS_GROUP_INNER_PADDING
    local innerUsableWidth = width - SETTINGS_GROUP_INNER_PADDING * 2 - SETTINGS_GROUP_RIGHT_SAFE_PADDING
    local twoColWidth = math.floor((innerUsableWidth - twoColGap) / 2)
    local rightColX = left + twoColWidth + twoColGap
    local CHECK_ROW_H = 44
    local SLIDER_ROW_H = 76
    local SECTION_GAP = 12
    local function applyGroupBackdrop(frame)
        local borderR, borderG, borderB, borderA = 0.4, 0.4, 0.4, 1
        if frame.SetBackdrop then
            frame:SetBackdrop({
                bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true,
                tileSize = 16,
                edgeSize = 16,
                insets = { left = 3, right = 3, top = 5, bottom = 3 },
            })
            frame:SetBackdropColor(0.06, 0.06, 0.06, 0.68)
            frame:SetBackdropBorderColor(borderR, borderG, borderB, borderA)
        else
            local bg = frame:CreateTexture(nil, "BACKGROUND")
            bg:SetAllPoints(frame)
            bg:SetColorTexture(0.06, 0.06, 0.06, 0.68)
            if not frame._tmBorderTop then
                local top = frame:CreateTexture(nil, "BORDER")
                top:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)
                top:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -1)
                top:SetHeight(1)
                top:SetColorTexture(borderR, borderG, borderB, borderA)
                frame._tmBorderTop = top

                local bottom = frame:CreateTexture(nil, "BORDER")
                bottom:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 1, 1)
                bottom:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -1, 1)
                bottom:SetHeight(1)
                bottom:SetColorTexture(borderR, borderG, borderB, borderA)
                frame._tmBorderBottom = bottom

                local leftBorder = frame:CreateTexture(nil, "BORDER")
                leftBorder:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)
                leftBorder:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 1, 1)
                leftBorder:SetWidth(1)
                leftBorder:SetColorTexture(borderR, borderG, borderB, borderA)
                frame._tmBorderLeft = leftBorder

                local rightBorder = frame:CreateTexture(nil, "BORDER")
                rightBorder:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -1)
                rightBorder:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -1, 1)
                rightBorder:SetWidth(1)
                rightBorder:SetColorTexture(borderR, borderG, borderB, borderA)
                frame._tmBorderRight = rightBorder
            end
        end
    end

    local function createGroup(parent, groupHeight, titleText, hideTitle)
        local groupFrame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
        groupFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", SETTINGS_GROUP_INSET, -SETTINGS_GROUP_TOP_GAP)
        groupFrame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", -SETTINGS_GROUP_INSET, SETTINGS_GROUP_TOP_GAP)
        applyGroupBackdrop(groupFrame)

        local innerScroll = CreateFrame("ScrollFrame", nil, groupFrame, "UIPanelScrollFrameTemplate")
        innerScroll:SetPoint("TOPLEFT", groupFrame, "TOPLEFT", 6, -6)
        innerScroll:SetPoint("BOTTOMRIGHT", groupFrame, "BOTTOMRIGHT", -6, 6)
        innerScroll:EnableMouseWheel(true)

        local group = CreateFrame("Frame", nil, innerScroll)
        group:SetWidth(width)
        group:SetHeight(math.max(1, groupHeight))
        innerScroll:SetScrollChild(group)
        group:SetPoint("TOPLEFT", innerScroll, "TOPLEFT", 0, 0)

        local scrollBar = innerScroll.ScrollBar
        if scrollBar then
            scrollBar:ClearAllPoints()
            scrollBar:SetPoint("TOPLEFT", groupFrame, "TOPRIGHT", 20, -16)
            scrollBar:SetPoint("BOTTOMLEFT", groupFrame, "BOTTOMRIGHT", 20, 16)
        end

        local function getMeasuredContentHeight()
            local top = group:GetTop()
            if not top then
                return group:GetHeight() or 0
            end
            local lowestBottom = top

            local childCount = select("#", group:GetChildren())
            for i = 1, childCount do
                local child = select(i, group:GetChildren())
                if child and (not child.IsShown or child:IsShown()) and child.GetBottom then
                    local bottom = child:GetBottom()
                    if bottom and bottom < lowestBottom then
                        lowestBottom = bottom
                    end
                end
            end

            local regionCount = select("#", group:GetRegions())
            for i = 1, regionCount do
                local region = select(i, group:GetRegions())
                if region and region.GetObjectType and region:GetObjectType() == "FontString" and region.GetBottom then
                    if not region.IsShown or region:IsShown() then
                        local bottom = region:GetBottom()
                        if bottom and bottom < lowestBottom then
                            lowestBottom = bottom
                        end
                    end
                end
            end

            local usedHeight = (top - lowestBottom) + 12
            if usedHeight < 1 then
                usedHeight = 1
            end
            return usedHeight
        end

        local function getMaxScrollValue()
            local childHeight = getMeasuredContentHeight()
            local viewHeight = innerScroll:GetHeight() or 0
            local maxValue = childHeight - viewHeight
            if maxValue < 0 then
                maxValue = 0
            end
            return maxValue
        end

        local function refreshScrollState()
            local measuredHeight = getMeasuredContentHeight()
            local currentHeight = group:GetHeight() or 0
            if math.abs(currentHeight - measuredHeight) > 0.5 then
                group:SetHeight(measuredHeight)
            end
            local maxValue = getMaxScrollValue()
            local current = innerScroll:GetVerticalScroll() or 0
            if current < 0 then
                innerScroll:SetVerticalScroll(0)
            elseif current > maxValue then
                innerScroll:SetVerticalScroll(maxValue)
            end
            if scrollBar then
                if maxValue > 0.5 then
                    scrollBar:Show()
                else
                    scrollBar:Hide()
                end
            end
        end

        innerScroll:SetScript("OnMouseWheel", function(self, delta)
            local maxValue = getMaxScrollValue()
            if maxValue <= 0 then
                self:SetVerticalScroll(0)
                return
            end
            local current = self:GetVerticalScroll() or 0
            local step = 40
            local target = current - (delta * step)
            if target < 0 then
                target = 0
            elseif target > maxValue then
                target = maxValue
            end
            self:SetVerticalScroll(target)
        end)

        innerScroll:HookScript("OnShow", refreshScrollState)
        innerScroll:HookScript("OnSizeChanged", refreshScrollState)
        group:HookScript("OnSizeChanged", refreshScrollState)
        if C_Timer and C_Timer.After then
            C_Timer.After(0, refreshScrollState)
        else
            refreshScrollState()
        end

        groupFrame.tmScroll = innerScroll
        groupFrame.tmContent = group

        if not hideTitle then
            local titleTextFS = group:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            titleTextFS:SetPoint("TOPLEFT", group, "TOPLEFT", 12, -8)
            titleTextFS:SetText(titleText)
        end
        return groupFrame, group
    end

    local generalGroupHeight = 30 + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + 12
    local generalGroupFrame, generalGroup = createGroup(contentHost, generalGroupHeight, "常规设置", true)
    local generalRowY = -30
    local timerFontRowWidth = math.min(innerUsableWidth, twoColWidth + 80)
    local timerFontDropdownLayout = getTimerFontDropdownLayoutConfig(TIMER_FONT_DROPDOWN_LAYOUT)
    local timerFontDropdown = createFontFamilyToggle(generalGroup, left, generalRowY + 2, timerFontRowWidth, function()
        return getConfiguredFontPath()
    end, function(v)
        ST.db.timerFontPath = v
        ST.db.timerFontFamily = nil
        UI:ApplySettings()
    end, timerFontDropdownLayout)
    self.timerFontDropdown = timerFontDropdown
    applyDropdownStyleWithRetry(self, "timerFontDropdown", DEFAULT_FONT_DROPDOWN_WIDTH)
    local timerControlColumnX = resolveControlColumnX(generalGroup, timerFontDropdown, left, timerFontRowWidth, timerFontDropdownLayout)
    local outlineRowY = generalRowY - CHECK_ROW_H
    local fontOutlineDropdown = createFontOutlineToggle(generalGroup, left, outlineRowY + 2, timerFontRowWidth, function()
        return getConfiguredFontOutline()
    end, function(v)
        ST.db.timerFontOutline = v
        UI:ApplySettings()
    end, timerFontDropdownLayout)
    self.fontOutlineDropdown = fontOutlineDropdown
    applyDropdownStyleWithRetry(self, "fontOutlineDropdown", DEFAULT_FONT_DROPDOWN_WIDTH)
    local colorModeRowY = outlineRowY - CHECK_ROW_H
    local fontColorModeButton = createFontColorModeToggle(generalGroup, left, colorModeRowY + 2, timerFontRowWidth, function()
        return getFontColorMode()
    end, function(v)
        ST.db.fontColorMode = (v == "custom") and "custom" or "smart"
        UI:ApplySettings()
    end, timerFontDropdownLayout, timerControlColumnX)
    local colorPickerRowY = colorModeRowY - CHECK_ROW_H
    local colorPickerAnchorX = rightColX - 120
    local colorPickerAnchorY = generalRowY - 170
    local fontColorButton = createFontColorPickerRow(generalGroup, left, colorPickerRowY + 2, timerFontRowWidth, function()
        return ST.db.fontColor
    end, function(color)
        ST.db.fontColor = {
            r = tonumber(color and color.r) or 1,
            g = tonumber(color and color.g) or 1,
            b = tonumber(color and color.b) or 1,
            a = tonumber(color and color.a) or 1,
        }
        UI:ApplySettings()
    end, generalGroup, colorPickerAnchorX, colorPickerAnchorY, timerFontDropdownLayout, timerControlColumnX)
    local function syncTimerFontControlsColumn()
        local syncedColumnX = resolveControlColumnX(generalGroup, timerFontDropdown, left, timerFontRowWidth, timerFontDropdownLayout)
        alignControlToColumn(generalGroup, fontColorModeButton, syncedColumnX)
        alignControlToColumn(generalGroup, fontColorButton, syncedColumnX)
        if fontColorModeButton.tmLabel and fontColorModeButton.tmLabel.SetWidth then
            local modeVisualOffsetX = tonumber(fontColorModeButton.tmVisualOffsetX) or 0
            fontColorModeButton.tmLabel:SetWidth(getControlLabelWidthByColumn(left, syncedColumnX + modeVisualOffsetX, 8))
        end
        if fontColorButton.tmLabel and fontColorButton.tmLabel.SetWidth then
            local pickerVisualOffsetX = tonumber(fontColorButton.tmVisualOffsetX) or 0
            fontColorButton.tmLabel:SetWidth(getControlLabelWidthByColumn(left, syncedColumnX + pickerVisualOffsetX, 8))
        end
    end
    syncTimerFontControlsColumn()
    if C_Timer and C_Timer.After then
        C_Timer.After(0, syncTimerFontControlsColumn)
        C_Timer.After(0.05, syncTimerFontControlsColumn)
        C_Timer.After(0.2, syncTimerFontControlsColumn)
    end
    self.fontColorModeButton = fontColorModeButton
    self.fontColorButton = fontColorButton
    self.fontColorResetButton = nil
    generalGroup.tmFontColorPanel = nil
    self.fontColorPanel = nil
    local trackerVisibilityRowY = colorPickerRowY - CHECK_ROW_H
    createCheck(generalGroup, "隐藏系统图腾监控", left, trackerVisibilityRowY, function()
        return ST.db.hideBlizzardTotemTracker ~= false
    end, function(v)
        ST.db.hideBlizzardTotemTracker = v and true or false
        if ST.RequestHideBlizzardTotemTracker then
            ST:RequestHideBlizzardTotemTracker(2, 0.2)
        end
    end)

    local mainGroupHeight = 30 + SLIDER_ROW_H + SLIDER_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + SLIDER_ROW_H + SLIDER_ROW_H + 12
    local mainGroupFrame, mainGroup = createGroup(contentHost, mainGroupHeight, "主条设置", true)
    local mainScaleRowY = -30
    createSlider(mainGroup, "缩放", left, mainScaleRowY, twoColWidth, 0.6, 1.6, 0.05, function()
        return ST.db.mainScale
    end, function(v)
        ST.db.mainScale = v
        UI:ApplySettings()
    end)
    createSlider(mainGroup, "间距", rightColX, mainScaleRowY, twoColWidth, 0, 20, 1, function()
        return getMainBarGap()
    end, function(v)
        ST.db.mainIconGap = v
        ST.db.iconGap = v
        UI:ApplySettings()
    end)
    local mainTimerRowY = mainScaleRowY - SLIDER_ROW_H
    createCheck(mainGroup, "显示图标冷却环", left, mainTimerRowY, function() return ST.db.showCooldownRing end, function(v)
        ST.db.showCooldownRing = v and true or false
        UI:ApplySettings()
    end)
    createCheck(mainGroup, "显示图标内计时", rightColX, mainTimerRowY, function() return ST.db.showIconCooldownNumber end, function(v)
        ST.db.showIconCooldownNumber = v and true or false
        UI:ApplySettings()
    end)
    local mainTimerRow2Y = mainTimerRowY - CHECK_ROW_H
    createCheck(mainGroup, "显示图标外计时", left, mainTimerRow2Y, function() return ST.db.showNumericTimer end, function(v)
        ST.db.showNumericTimer = v and true or false
        UI:ApplySettings()
    end)
    createCheck(mainGroup, "显示图标计时小数", rightColX, mainTimerRow2Y, function()
        return ST.db.showDecimalBelowTen ~= false
    end, function(v)
        ST.db.showDecimalBelowTen = v and true or false
        UI:ApplySettings()
    end)
    local mainOuterSideRowY = mainTimerRow2Y - CHECK_ROW_H
    createOuterTimerSideToggle(mainGroup, left, mainOuterSideRowY + 2, twoColWidth, function()
        return ST.db.timerOuterSide or "below"
    end, function(v)
        ST.db.timerOuterSide = v
        UI:ApplySettings()
    end)
    createMenuPopupDirectionToggle(mainGroup, rightColX, mainOuterSideRowY + 2, twoColWidth, function()
        return ST.db.mainMenuPopupDirection or "up"
    end, function(v)
        ST.db.mainMenuPopupDirection = v
    end)
    local mainFormatRowY = mainOuterSideRowY - CHECK_ROW_H
    createFormatToggle(mainGroup, "内计时格式", left, mainFormatRowY + 2, twoColWidth, function()
        return ST.db.timerInnerFormat or "s"
    end, function(v)
        ST.db.timerInnerFormat = v
        UI:ApplySettings()
    end)
    createFormatToggle(mainGroup, "外计时格式", rightColX, mainFormatRowY + 2, twoColWidth, function()
        return ST.db.timerOuterFormat or "s"
    end, function(v)
        ST.db.timerOuterFormat = v
        UI:ApplySettings()
    end)
    local mainFlashRowY = mainFormatRowY - CHECK_ROW_H
    createCheck(mainGroup, "图腾就绪闪光", left, mainFlashRowY, function()
        return ST.db.flashReadyMainElements ~= false
    end, function(v)
        ST.db.flashReadyMainElements = v and true or false
        UI:ApplySettings()
    end)
    local mainFontRowY = mainFlashRowY - 48
    createSlider(mainGroup, "图标内计时字号", left, mainFontRowY, twoColWidth, 8, 30, 1, function()
        return ST.db.timerInnerFontSize or 20
    end, function(v)
        ST.db.timerInnerFontSize = v
        UI:ApplySettings()
    end)
    createSlider(mainGroup, "图标外计时字号", rightColX, mainFontRowY, twoColWidth, 8, 24, 1, function()
        return ST.db.timerOuterFontSize or ST.db.timerFontSize
    end, function(v)
        ST.db.timerOuterFontSize = v
        ST.db.timerFontSize = v
        UI:ApplySettings()
    end)
    local mainPosRowY = mainFontRowY - SLIDER_ROW_H
    createSlider(mainGroup, "图标外计时 X", left, mainPosRowY, twoColWidth, -30, 30, 1, function() return ST.db.timerOffsetX end, function(v)
        ST.db.timerOffsetX = v
        UI:ApplySettings()
    end)
    createSlider(mainGroup, "图标外计时 Y", rightColX, mainPosRowY, twoColWidth, -30, 30, 1, function() return ST.db.timerOffsetY end, function(v)
        ST.db.timerOffsetY = v
        UI:ApplySettings()
    end)

    local secondaryGroupHeight = 30 + CHECK_ROW_H + SLIDER_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + CHECK_ROW_H + SLIDER_ROW_H + SLIDER_ROW_H + SLIDER_ROW_H + SLIDER_ROW_H + 12
    local secondaryGroupFrame, secondaryGroup = createGroup(contentHost, secondaryGroupHeight, "副条设置", true)
    local secSplitRowY = -30
    createCheck(secondaryGroup, "分离副条", left, secSplitRowY, function()
        return ST.db.splitSecondaryBar
    end, function(v)
        ST.db.splitSecondaryBar = v and true or false
        UI:ApplySettings()
    end)
    local secScaleRowY = secSplitRowY - CHECK_ROW_H
    local secondaryScaleRow, secondaryScaleSlider = createSlider(secondaryGroup, "缩放", left, secScaleRowY, twoColWidth, 0.6, 1.6, 0.05, function()
        return ST.db.secondaryScale
    end, function(v)
        ST.db.secondaryScale = v
        UI:ApplySettings()
    end)
    self.secondaryScaleRow = secondaryScaleRow
    self.secondaryScaleSlider = secondaryScaleSlider
    local secondaryGapRow, secondaryGapSlider = createSlider(secondaryGroup, "间距", rightColX, secScaleRowY, twoColWidth, 0, 20, 1, function()
        return getSecondaryBarGap()
    end, function(v)
        ST.db.secondaryIconGap = v
        UI:ApplySettings()
    end)
    self.secondaryGapRow = secondaryGapRow
    self.secondaryGapSlider = secondaryGapSlider
    local secIconRow1Y = secScaleRowY - SLIDER_ROW_H
    createCheck(secondaryGroup, "显示水/电盾图标", left, secIconRow1Y, function()
        return ST.db.showShieldIcon
    end, function(v)
        ST.db.showShieldIcon = v and true or false
        UI:ApplySettings()
    end)
    createCheck(secondaryGroup, "显示武器附魔图标", rightColX, secIconRow1Y, function()
        return ST.db.showWeaponIcon
    end, function(v)
        ST.db.showWeaponIcon = v and true or false
        UI:ApplySettings()
    end)
    local secIconRow2Y = secIconRow1Y - CHECK_ROW_H
    createCheck(secondaryGroup, "显示复生图标", left, secIconRow2Y, function()
        if ST.db.showReincarnationIcon == nil then
            return true
        end
        return ST.db.showReincarnationIcon
    end, function(v)
        ST.db.showReincarnationIcon = v and true or false
        UI:ApplySettings()
    end)
    createCheck(secondaryGroup, "显示土盾图标", rightColX, secIconRow2Y, function()
        return ST.db.showEarthShieldIcon
    end, function(v)
        ST.db.showEarthShieldIcon = v and true or false
        UI:ApplySettings()
    end)
    local secIconRow3Y = secIconRow2Y - CHECK_ROW_H
    createCheck(secondaryGroup, "显示土盾目标玩家", left, secIconRow3Y, function()
        if ST.db.showEarthShieldTargetText == nil then
            return true
        end
        return ST.db.showEarthShieldTargetText
    end, function(v)
        ST.db.showEarthShieldTargetText = v and true or false
        UI:ApplySettings()
    end)
    createCheck(secondaryGroup, "武器附魔就绪闪光", rightColX, secIconRow3Y, function()
        return ST.db.flashReadyWeapon ~= false
    end, function(v)
        ST.db.flashReadyWeapon = v and true or false
        UI:ApplySettings()
    end)
    local secIconRow4Y = secIconRow3Y - CHECK_ROW_H
    createCheck(secondaryGroup, "复生就绪闪光", left, secIconRow4Y, function()
        return ST.db.flashReadyReincarnation ~= false
    end, function(v)
        ST.db.flashReadyReincarnation = v and true or false
        UI:ApplySettings()
    end)
    local secTimerRowY = secIconRow4Y - CHECK_ROW_H
    createCheck(secondaryGroup, "显示图标冷却环", left, secTimerRowY, function()
        return ST.db.showCooldownRingSecondary ~= false
    end, function(v)
        ST.db.showCooldownRingSecondary = v and true or false
        UI:ApplySettings()
    end)
    createCheck(secondaryGroup, "显示图标内计时", rightColX, secTimerRowY, function()
        return ST.db.showIconCooldownNumberSecondary == true
    end, function(v)
        ST.db.showIconCooldownNumberSecondary = v and true or false
        UI:ApplySettings()
    end)
    local secTimerRow2Y = secTimerRowY - CHECK_ROW_H
    createCheck(secondaryGroup, "显示图标外计时", left, secTimerRow2Y, function()
        return ST.db.showNumericTimerSecondary ~= false
    end, function(v)
        ST.db.showNumericTimerSecondary = v and true or false
        UI:ApplySettings()
    end)
    local secOuterSideRowY = secTimerRow2Y - CHECK_ROW_H
    createOuterTimerSideToggle(secondaryGroup, left, secOuterSideRowY + 2, twoColWidth, function()
        local s = ST.db.timerOuterSideSecondary
        if s == nil or s == "" then
            s = ST.db.timerOuterSide or "below"
        end
        return s
    end, function(v)
        ST.db.timerOuterSideSecondary = v
        UI:ApplySettings()
    end)
    createMenuPopupDirectionToggle(secondaryGroup, rightColX, secOuterSideRowY + 2, twoColWidth, function()
        return ST.db.secondaryMenuPopupDirection or "up"
    end, function(v)
        ST.db.secondaryMenuPopupDirection = v
    end)
    local secTimerRow3Y = secOuterSideRowY - CHECK_ROW_H
    createFormatToggle(secondaryGroup, "内计时格式", left, secTimerRow3Y + 2, twoColWidth, function()
        return ST.db.timerInnerFormatSecondary or "s"
    end, function(v)
        ST.db.timerInnerFormatSecondary = v
        UI:ApplySettings()
    end)
    createFormatToggle(secondaryGroup, "外计时格式", rightColX, secTimerRow3Y + 2, twoColWidth, function()
        return ST.db.timerOuterFormatSecondary or "s"
    end, function(v)
        ST.db.timerOuterFormatSecondary = v
        UI:ApplySettings()
    end)
    local secTimerFontRowY = secTimerRow3Y - 48
    createSlider(secondaryGroup, "图标内计时字号", left, secTimerFontRowY, twoColWidth, 8, 30, 1, function()
        return ST.db.timerInnerFontSizeSecondary or ST.db.timerInnerFontSize or 20
    end, function(v)
        ST.db.timerInnerFontSizeSecondary = v
        UI:ApplySettings()
    end)
    createSlider(secondaryGroup, "图标外计时字号", rightColX, secTimerFontRowY, twoColWidth, 8, 24, 1, function()
        return ST.db.timerOuterFontSizeSecondary or ST.db.timerOuterFontSize or ST.db.timerFontSize
    end, function(v)
        ST.db.timerOuterFontSizeSecondary = v
        UI:ApplySettings()
    end)
    local secStackFontRowY = secTimerFontRowY - SLIDER_ROW_H
    createSlider(secondaryGroup, "角标字号", left, secStackFontRowY, twoColWidth, 10, 28, 1, function()
        if ST.db.stackFontSizeSecondary == nil then
            return 16
        end
        return ST.db.stackFontSizeSecondary
    end, function(v)
        ST.db.stackFontSizeSecondary = v
        UI:ApplySettings()
    end)
    local secTimerPosRowY = secStackFontRowY - SLIDER_ROW_H
    createSlider(secondaryGroup, "图标外计时 X", left, secTimerPosRowY, twoColWidth, -30, 30, 1, function()
        if ST.db.timerOffsetXSecondary == nil then
            return ST.db.timerOffsetX
        end
        return ST.db.timerOffsetXSecondary
    end, function(v)
        ST.db.timerOffsetXSecondary = v
        UI:ApplySettings()
    end)
    createSlider(secondaryGroup, "图标外计时 Y", rightColX, secTimerPosRowY, twoColWidth, -30, 30, 1, function()
        if ST.db.timerOffsetYSecondary == nil then
            return ST.db.timerOffsetY
        end
        return ST.db.timerOffsetYSecondary
    end, function(v)
        ST.db.timerOffsetYSecondary = v
        UI:ApplySettings()
    end)
    local secStackPosRowY = secTimerPosRowY - SLIDER_ROW_H
    createSlider(secondaryGroup, "角标 X", left, secStackPosRowY, twoColWidth, -20, 20, 1, function()
        if ST.db.stackOffsetXSecondary == nil then
            return -2
        end
        return ST.db.stackOffsetXSecondary
    end, function(v)
        ST.db.stackOffsetXSecondary = v
        UI:ApplySettings()
    end)
    createSlider(secondaryGroup, "角标 Y", rightColX, secStackPosRowY, twoColWidth, -20, 20, 1, function()
        if ST.db.stackOffsetYSecondary == nil then
            return 2
        end
        return ST.db.stackOffsetYSecondary
    end, function(v)
        ST.db.stackOffsetYSecondary = v
        UI:ApplySettings()
    end)

    local otherGroupHeight = 30 + CHECK_ROW_H + SLIDER_ROW_H + 12
    local otherGroupFrame, otherGroup = createGroup(contentHost, otherGroupHeight, "其他设置", true)
    local otherRowY = -30
    local iconBorderCheck
    iconBorderCheck = createCheck(otherGroup, "显示图标边框", left, otherRowY, function()
        return ST.db.showIconBorder ~= false
    end, function(v)
        local oldValue = ST.db.showIconBorder ~= false
        local newValue = v and true or false
        UI:PromptReloadForBorderChange(oldValue, newValue, iconBorderCheck)
    end)
    local earthTargetFontRowY = otherRowY - CHECK_ROW_H
    createSlider(otherGroup, "土盾目标字号", left, earthTargetFontRowY, twoColWidth, 8, 24, 1, function()
        return ST.db.earthShieldTargetFontSize
            or (ST.db.timerOuterFontSizeSecondary or ST.db.timerOuterFontSize or ST.db.timerFontSize or 12)
    end, function(v)
        ST.db.earthShieldTargetFontSize = v
        UI:ApplySettings()
    end)
    createEarthTargetNameModeToggle(otherGroup, rightColX, earthTargetFontRowY + 2, twoColWidth, function()
        return ST.db.earthShieldTargetNameMode or "full"
    end, function(v)
        ST.db.earthShieldTargetNameMode = v
        UI:ApplySettings()
    end)

    local guideGroupHeight = 560
    local guideGroupFrame, guideGroup = createGroup(contentHost, guideGroupHeight, "操作说明", true)
    local guideText = guideGroup:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    guideText:SetPoint("TOPLEFT", guideGroup, "TOPLEFT", left, -30)
    guideText:SetWidth(innerUsableWidth)
    guideText:SetJustifyH("LEFT")
    guideText:SetJustifyV("TOP")
    if guideText.SetWordWrap then
        guideText:SetWordWrap(true)
    end
    guideText:SetText(table.concat({
        "|cffffd100打开设置：|r输入 /tm",
        "|cffffd100锁定/解锁：|r输入 /tm lock",
        "|cffffd100显示/隐藏主副条：|r输入 /tm bar",
        "",
        "|cffffd100主召唤按钮：|r左键施放当前预设",
        "|cffffd100主召唤菜单：|r悬停打开，左键临时施放，右键切换预设",
        "",
        "|cffffd100四系按钮：|r左键按预设施放，右键清空该系预设",
        "|cffffd100四系菜单：|r悬停打开，左键临时施放，右键保存该系预设",
        "",
        "|cffffd100护盾/武器菜单：|r悬停打开，左键临时施放，右键设默认技能",
        "",
        "|cffffd100大地之盾菜单：|r悬停打开，右键设置预设目标",
        "|cffffd100清空地盾目标：|r在大地之盾按钮上点右键",
        "|cffffd100地盾优先级：|r预设目标 > 主坦 > 焦点 > 自己",
        "",
        "|cffffd100战斗限制：|r战斗中受保护操作会排队，脱战后自动生效",
        "|cffffd100快捷键：|r按键绑定可设置元素/先祖/灵魂召唤",
        "|cffffd100异常刷新：|r输入 /reload",
    }, "\n"))

    local categoryDefs = {
        { key = "general", text = "常规设置", group = generalGroupFrame },
        { key = "main", text = "主条设置", group = mainGroupFrame },
        { key = "secondary", text = "副条设置", group = secondaryGroupFrame },
        { key = "other", text = "其他设置", group = otherGroupFrame },
        { key = "guide", text = "操作说明", group = guideGroupFrame },
    }
    local categoryButtons = {}
    local selectedCategoryKey
    local function selectCategory(key)
        selectedCategoryKey = key
        for i = 1, #categoryButtons do
            local btn = categoryButtons[i]
            local isActive = (btn.tmCategoryKey == key)
            if btn.tmLabel and btn.tmLabel.SetTextColor then
                if isActive then
                    btn.tmLabel:SetTextColor(1, 0.85, 0.15)
                else
                    btn.tmLabel:SetTextColor(0.8, 0.8, 0.8)
                end
            end
            if btn.SetBackdropColor then
                if isActive then
                    btn:SetBackdropColor(0.28, 0.06, 0.06, 0.92)
                else
                    btn:SetBackdropColor(0.08, 0.08, 0.08, 0.85)
                end
            end
            if btn.SetBackdropBorderColor then
                if isActive then
                    btn:SetBackdropBorderColor(1, 0.82, 0.1, 0.95)
                else
                    btn:SetBackdropBorderColor(0.45, 0.45, 0.45, 0.92)
                end
            end
        end
        for i = 1, #categoryDefs do
            local def = categoryDefs[i]
            if def.group then
                if def.key == key then
                    def.group:Show()
                    if def.group.tmScroll and def.group.tmScroll.SetVerticalScroll then
                        def.group.tmScroll:SetVerticalScroll(0)
                    end
                else
                    def.group:Hide()
                end
            end
        end
    end
    local tabX = 24
    for i = 1, #categoryDefs do
        local def = categoryDefs[i]
        local tabBtn = CreateFrame("Button", nil, tabContainer, "BackdropTemplate")
        tabBtn:SetPoint("TOPLEFT", tabContainer, "TOPLEFT", tabX, -12)
        tabBtn:SetSize(96, 24)
        if tabBtn.SetBackdrop then
            tabBtn:SetBackdrop({
                bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true,
                tileSize = 16,
                edgeSize = 12,
                insets = { left = 3, right = 3, top = 3, bottom = 3 },
            })
            tabBtn:SetBackdropColor(0.08, 0.08, 0.08, 0.85)
            tabBtn:SetBackdropBorderColor(0.45, 0.45, 0.45, 0.92)
        end
        local label = tabBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        label:SetPoint("CENTER", tabBtn, "CENTER", 0, 0)
        label:SetText(def.text)
        tabBtn.tmLabel = label
        tabBtn.tmCategoryKey = def.key
        tabBtn:SetScript("OnClick", function()
            selectCategory(def.key)
        end)
        categoryButtons[#categoryButtons + 1] = tabBtn
        tabX = tabX + 100
    end

    selectCategory("general")

    f.default = function()
        ST.db.showCooldownRing = ST.defaults.showCooldownRing
        ST.db.showIconCooldownNumber = ST.defaults.showIconCooldownNumber
        ST.db.timerInnerFormat = ST.defaults.timerInnerFormat
        ST.db.timerOuterFormat = ST.defaults.timerOuterFormat
        ST.db.showNumericTimer = ST.defaults.showNumericTimer
        ST.db.showDecimalBelowTen = ST.defaults.showDecimalBelowTen
        ST.db.timerOffsetX = ST.defaults.timerOffsetX
        ST.db.timerOffsetY = ST.defaults.timerOffsetY
        ST.db.timerOuterSide = ST.defaults.timerOuterSide
        ST.db.timerFontSize = ST.defaults.timerFontSize
        ST.db.timerOuterFontSize = ST.defaults.timerOuterFontSize
        ST.db.timerInnerFontSize = ST.defaults.timerInnerFontSize
        ST.db.showCooldownRingSecondary = ST.defaults.showCooldownRingSecondary
        ST.db.showIconCooldownNumberSecondary = ST.defaults.showIconCooldownNumberSecondary
        ST.db.timerInnerFormatSecondary = ST.defaults.timerInnerFormatSecondary
        ST.db.timerOuterFormatSecondary = ST.defaults.timerOuterFormatSecondary
        ST.db.showNumericTimerSecondary = ST.defaults.showNumericTimerSecondary
        ST.db.timerOffsetXSecondary = ST.defaults.timerOffsetXSecondary
        ST.db.timerOffsetYSecondary = ST.defaults.timerOffsetYSecondary
        ST.db.timerOuterSideSecondary = ST.defaults.timerOuterSideSecondary
        ST.db.stackOffsetXSecondary = ST.defaults.stackOffsetXSecondary
        ST.db.stackOffsetYSecondary = ST.defaults.stackOffsetYSecondary
        ST.db.stackFontSizeSecondary = ST.defaults.stackFontSizeSecondary
        ST.db.timerOuterFontSizeSecondary = ST.defaults.timerOuterFontSizeSecondary
        ST.db.timerInnerFontSizeSecondary = ST.defaults.timerInnerFontSizeSecondary
        ST.db.timerFontPath = ST.defaults.timerFontPath
        ST.db.timerFontFamily = ST.defaults.timerFontFamily
        ST.db.timerFontOutline = ST.defaults.timerFontOutline
        ST.db.fontColorMode = ST.defaults.fontColorMode
        ST.db.fontColor = {
            r = ST.defaults.fontColor.r,
            g = ST.defaults.fontColor.g,
            b = ST.defaults.fontColor.b,
            a = ST.defaults.fontColor.a,
        }
        ST.db.earthShieldTargetFontSize = ST.defaults.earthShieldTargetFontSize
        ST.db.earthShieldTargetNameMode = ST.defaults.earthShieldTargetNameMode
        ST.db.showShieldIcon = ST.defaults.showShieldIcon
        ST.db.showWeaponIcon = ST.defaults.showWeaponIcon
        ST.db.showReincarnationIcon = ST.defaults.showReincarnationIcon
        ST.db.flashReadyMainElements = ST.defaults.flashReadyMainElements
        ST.db.flashReadyWeapon = ST.defaults.flashReadyWeapon
        ST.db.flashReadyReincarnation = ST.defaults.flashReadyReincarnation
        ST.db.showEarthShieldIcon = ST.defaults.showEarthShieldIcon
        ST.db.showIconBorder = ST.defaults.showIconBorder
        ST.db.showEarthShieldTargetText = ST.defaults.showEarthShieldTargetText
        ST.db.hideBlizzardTotemTracker = ST.defaults.hideBlizzardTotemTracker
        ST.db.splitSecondaryBar = ST.defaults.splitSecondaryBar
        ST.db.iconGap = ST.defaults.iconGap
        ST.db.mainIconGap = ST.defaults.mainIconGap or ST.defaults.iconGap
        ST.db.secondaryIconGap = ST.defaults.secondaryIconGap or ST.defaults.iconGap
        ST.db.mainScale = ST.defaults.mainScale
        ST.db.secondaryScale = ST.defaults.secondaryScale
        ST.db.mainMenuPopupDirection = ST.defaults.mainMenuPopupDirection
        ST.db.secondaryMenuPopupDirection = ST.defaults.secondaryMenuPopupDirection
        if ST.RequestHideBlizzardTotemTracker then
            ST:RequestHideBlizzardTotemTracker(2, 0.2)
        end
        UI:ApplySettings()
    end
    f.okay = function() end
    f.cancel = function() end

    self:RefreshPanelButtonThirdPartySkins()
    if C_Timer and C_Timer.After then
        C_Timer.After(0, function()
            self:RefreshPanelButtonThirdPartySkins()
        end)
        C_Timer.After(0.2, function()
            self:RefreshPanelButtonThirdPartySkins()
        end)
    end

    self:RefreshCheckButtonThirdPartySkins()
    if C_Timer and C_Timer.After then
        C_Timer.After(0, function()
            self:RefreshCheckButtonThirdPartySkins()
        end)
        C_Timer.After(0.2, function()
            self:RefreshCheckButtonThirdPartySkins()
        end)
    end

    self:RefreshSettingsSliderThirdPartySkins()
    if C_Timer and C_Timer.After then
        C_Timer.After(0, function()
            self:RefreshSettingsSliderThirdPartySkins()
        end)
        C_Timer.After(0.2, function()
            self:RefreshSettingsSliderThirdPartySkins()
        end)
    end

    self:RefreshSettingsState()

    self.settingsFrame = f
    self.settingsRegistered = false
end

function UI:EnsureSettingsRegistered()
    if not self.settingsFrame then
        self:CreateSettings()
    end
    if self.settingsRegistered then
        return
    end

    if not InterfaceOptions_AddCategory and not (Settings and Settings.RegisterCanvasLayoutCategory and Settings.RegisterAddOnCategory) then
        if LoadAddOn then
            pcall(LoadAddOn, "Blizzard_InterfaceOptions")
            pcall(LoadAddOn, "Blizzard_Options")
        end
    end

    if Settings and Settings.RegisterCanvasLayoutCategory and Settings.RegisterAddOnCategory then
        self.settingsFrame.OnCommit = self.settingsFrame.okay
        self.settingsFrame.OnDefault = self.settingsFrame.default
        self.settingsFrame.OnRefresh = self.settingsFrame.refresh
        local category = Settings.RegisterCanvasLayoutCategory(self.settingsFrame, self.settingsFrame.name, self.settingsFrame.name)
        if category then
            category.ID = self.settingsFrame.name
            Settings.RegisterAddOnCategory(category)
            self.settingsRegistered = true
        end
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(self.settingsFrame)
        self.settingsRegistered = true
    elseif BlizzardOptionsPanel_RegisterCategory then
        BlizzardOptionsPanel_RegisterCategory(self.settingsFrame)
        self.settingsRegistered = true
    end
end

function UI:ToggleSettings()
    self:EnsureSettingsRegistered()
    if Settings and Settings.OpenToCategory and self.settingsFrame and self.settingsFrame.name then
        Settings.OpenToCategory(self.settingsFrame.name)
    elseif InterfaceOptionsFrame_OpenToCategory and self.settingsFrame then
        InterfaceOptionsFrame_OpenToCategory(self.settingsFrame)
        InterfaceOptionsFrame_OpenToCategory(self.settingsFrame)
    end
    if InterfaceOptionsFrame and not InterfaceOptionsFrame:IsShown() then
        InterfaceOptionsFrame:Show()
    end
end

function UI:RefreshAll()
    if not self.mainFrame then
        return
    end
    self:RefreshCallButton()
    self:RefreshElementButtons()
    self:RefreshSecondaryButtons()
    self:ApplyLayout()
    self:RefreshButtonBorderVisibility()
    self:RefreshTimerVisibility()
    local preset = getCurrentPreset()
    setButtonSpell(self.callElementsProxy, ST.Config.CallSpellByPreset[1], 1)
    setButtonSpell(self.callAncestorsProxy, ST.Config.CallSpellByPreset[2], 1)
    setButtonSpell(self.callSpiritsProxy, ST.Config.CallSpellByPreset[3], 1)
    if self.defaultShieldButton and ST.db.defaultShieldSpell then
        setButtonSpell(self.defaultShieldButton, ST.db.defaultShieldSpell, 1)
    end
    if self.defaultWeaponButton and ST.db.defaultWeaponSpell then
        setButtonSpell(self.defaultWeaponButton, ST.db.defaultWeaponSpell, 1)
    end
    if preset < 1 then
        ST.Presets:SetCurrentSummonPreset(1)
    end
    self:UpdateTotemTimers()
    self:PrimeCombatMenus()
end

function UI:PrimeCombatMenus()
    if not self.mainFrame then
        return
    end
    if InCombatLockdown and InCombatLockdown() then
        return
    end
    local mainAlpha = self.mainFrame:GetAlpha()
    local secondaryAlpha = (self.secondaryFrame and self.secondaryFrame:GetAlpha()) or 1
    self.mainFrame:SetAlpha(0)
    if self.secondaryFrame then
        self.secondaryFrame:SetAlpha(0)
    end
    if self.callButton then
        self:ShowCallMenu(self.callButton)
    end
    for _, slot in ipairs(ST.Config.ElementOrder) do
        local b = self.elementButtons and self.elementButtons[slot]
        if b then
            self:ShowElementMenu(b, slot)
        end
    end
    if self.shieldButton then
        self:ShowShieldMenu(self.shieldButton)
    end
    if self.weaponButton then
        self:ShowWeaponMenu(self.weaponButton)
    end
    hideMenuNow()
    self.mainFrame:SetAlpha(mainAlpha or 1)
    if self.secondaryFrame then
        self.secondaryFrame:SetAlpha(secondaryAlpha or 1)
    end
end

function UI:Create()
    if self.mainFrame then
        return
    end

    local frame = CreateFrame("Frame", "TotemMaster_MainFrame", UIParent)
    frame:SetSize(218, 44)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self)
        if ST.db.lock then return end
        self:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local p, _, rp, x, y = self:GetPoint()
        ST.db.point = { p, "UIParent", rp, x, y }
    end)
    local point = ST.db.point or ST.defaults.point
    frame:SetPoint(point[1], _G[point[2]] or UIParent, point[3], point[4], point[5])
    self.mainFrame = frame

    local function saveMainFramePoint(targetFrame)
        if not targetFrame or targetFrame ~= self.mainFrame then
            return
        end
        local p, _, rp, x, y = targetFrame:GetPoint()
        ST.db.point = { p, "UIParent", rp, x, y }
    end

    local function saveSecondaryFramePoint(targetFrame)
        if not targetFrame or targetFrame ~= self.secondaryFrame then
            return
        end
        local p, _, rp, x, y = targetFrame:GetPoint()
        ST.db.secondaryPoint = { p, "UIParent", rp, x, y }
    end

    local function saveBarPointByTarget(targetFrame)
        if targetFrame == self.secondaryFrame then
            saveSecondaryFramePoint(targetFrame)
        else
            saveMainFramePoint(targetFrame)
        end
    end

    local function getSecondaryDragTargetFrame()
        if ST.db and ST.db.splitSecondaryBar and self.secondaryFrame then
            return self.secondaryFrame
        end
        return self.mainFrame
    end

    local callButton = createActionButton("TotemMaster_BarCallButton", frame, BAR_SIZE)
    callButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -4)
    callButton:SetScript("PreClick", function(selfButton, mouseButton, down)
        if down then
            return
        end
        if mouseButton == "LeftButton" and selfButton.tmSuppressNextLeftRelease then
            return
        end
        if mouseButton == "LeftButton" then
            local preset = getCurrentPreset()
            ST:RunOrQueue("主召唤按钮应用预设" .. tostring(preset), function()
                ST.CastEngine:ApplyPreset(preset)
            end)
        end
    end)
    callButton:SetScript("OnEnter", function(selfButton)
        hideTaskToken = hideTaskToken + 1
        UI:ShowCallMenu(selfButton)
    end)
    callButton:SetScript("OnLeave", function()
        UI:ScheduleHideMenu()
    end)
    attachSpellTooltip(callButton, function()
        return ST.Config.CallSpellByPreset[getCurrentPreset()]
    end)
    bindProxyDragToButton(callButton, function()
        return self.mainFrame
    end, saveMainFramePoint)
    self.callButton = callButton
    barButtons[#barButtons + 1] = callButton

    for idx, slot in ipairs(ST.Config.ElementOrder) do
        local name = "TotemMaster_BarElementButton" .. idx
        local b = createActionButton(name, frame, BAR_SIZE)
        local gap = getMainBarGap()
        b:SetPoint("LEFT", callButton, "RIGHT", (idx - 1) * (BAR_SIZE + gap) + gap, 0)
        b.slot = slot
        b.cooldown = CreateFrame("Cooldown", name .. "Cooldown", b, "CooldownFrameTemplate")
        b.cooldown:SetAllPoints(b)
        if b.cooldown.SetDrawEdge then
            b.cooldown:SetDrawEdge(false)
        end
        applyIconCooldownNumberSetting(b)
        b.iconTimerText = b.cooldown:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        b.iconTimerText:SetDrawLayer("OVERLAY", 7)
        b.iconTimerText:SetPoint("CENTER", b, "CENTER", 0, 0)
        self:ApplyIconTimerTextStyle(b)
        b.iconTimerText:SetShadowColor(0, 0, 0, 0.9)
        b.iconTimerText:SetShadowOffset(1, -1)
        b.iconTimerText:Hide()
        b.timerText = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        self:ApplyTimerTextStyle(b)
        b:SetScript("OnEnter", function(selfButton)
            hideTaskToken = hideTaskToken + 1
            UI:ShowElementMenu(selfButton, selfButton.slot)
        end)
        b:SetScript("OnLeave", function()
            UI:ScheduleHideMenu()
        end)
        b:SetScript("PostClick", function(selfButton, mouseButton, down)
            if down then
                return
            end
            if mouseButton ~= "RightButton" then
                return
            end
            local preset = getCurrentPreset()
            local slotLabel = tostring(ST.Config.ElementLabels[selfButton.slot] or "?")
            local presetLabel = tostring(ST.Config.PresetNames[preset] or preset)
            ST.Presets:SetSpell(preset, selfButton.slot, 0)
            selfButton.activeTotemSpellID = nil
            setElementButtonDisplaySpell(selfButton, 0)
            ST:RunOrQueue("清空" .. slotLabel .. "系预设", function()
                UI:RefreshAll()
                ST.CastEngine:ApplyPreset(preset)
            end)
            ST:Print(string.format("已将%s系预设设为空（%s召唤）", slotLabel, presetLabel))
        end)
        attachSpellTooltip(b, function(selfButton)
            return selfButton.activeTotemSpellID or ST.Presets:GetSpell(getCurrentPreset(), selfButton.slot)
        end)
        bindProxyDragToButton(b, function()
            return self.mainFrame
        end, saveMainFramePoint)
        self.elementButtons[slot] = b
        barButtons[#barButtons + 1] = b
    end

    local secondary = CreateFrame("Frame", "TotemMaster_SecondaryFrame", UIParent)
    secondary:SetSize(1, 1)
    self.secondaryFrame = secondary

    local shield = createActionButton("TotemMaster_ShieldButton", secondary, BAR_SIZE)
    shield.tmTimerProfile = "secondary"
    shield.tmDisableCooldownRing = true
    shield.cooldown = CreateFrame("Cooldown", "TotemMaster_ShieldButtonCooldown", shield, "CooldownFrameTemplate")
    shield.cooldown:SetAllPoints(shield)
    if shield.cooldown.SetDrawEdge then
        shield.cooldown:SetDrawEdge(false)
    end
    applyIconCooldownNumberSetting(shield)
    shield.iconTimerText = shield.cooldown:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    shield.iconTimerText:SetDrawLayer("OVERLAY", 7)
    shield.iconTimerText:SetPoint("CENTER", shield, "CENTER", 0, 0)
    self:ApplyIconTimerTextStyle(shield)
    shield.iconTimerText:SetShadowColor(0, 0, 0, 0.9)
    shield.iconTimerText:SetShadowOffset(1, -1)
    shield.iconTimerText:Hide()
    shield.timerText = shield:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    self:ApplyTimerTextStyle(shield)
    shield:SetScript("OnEnter", function(selfButton)
        hideTaskToken = hideTaskToken + 1
        UI:ShowShieldMenu(selfButton)
    end)
    shield:SetScript("OnLeave", function()
        UI:ScheduleHideMenu()
    end)
    attachSpellTooltip(shield, function()
        return ST.db.defaultShieldSpell
    end)
    self.shieldButton = shield
    barButtons[#barButtons + 1] = shield

    local weapon = createActionButton("TotemMaster_WeaponButton", secondary, BAR_SIZE)
    weapon.tmTimerProfile = "secondary"
    weapon.cooldown = CreateFrame("Cooldown", "TotemMaster_WeaponButtonCooldown", weapon, "CooldownFrameTemplate")
    weapon.cooldown:SetAllPoints(weapon)
    if weapon.cooldown.SetDrawEdge then
        weapon.cooldown:SetDrawEdge(false)
    end
    applyIconCooldownNumberSetting(weapon)
    weapon.iconTimerText = weapon.cooldown:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    weapon.iconTimerText:SetDrawLayer("OVERLAY", 7)
    weapon.iconTimerText:SetPoint("CENTER", weapon, "CENTER", 0, 0)
    self:ApplyIconTimerTextStyle(weapon)
    weapon.iconTimerText:SetShadowColor(0, 0, 0, 0.9)
    weapon.iconTimerText:SetShadowOffset(1, -1)
    weapon.iconTimerText:Hide()
    weapon.timerText = weapon:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    self:ApplyTimerTextStyle(weapon)
    weapon:SetScript("OnEnter", function(selfButton)
        hideTaskToken = hideTaskToken + 1
        UI:ShowWeaponMenu(selfButton)
    end)
    weapon:SetScript("OnLeave", function()
        UI:ScheduleHideMenu()
    end)
    attachSpellTooltip(weapon, function()
        return ST.db.defaultWeaponSpell
    end)
    self.weaponButton = weapon
    barButtons[#barButtons + 1] = weapon

    local reincarnation = createActionButton("TotemMaster_ReincarnationButton", secondary, BAR_SIZE)
    reincarnation.tmTimerProfile = "secondary"
    reincarnation.cooldown = CreateFrame("Cooldown", "TotemMaster_ReincarnationButtonCooldown", reincarnation, "CooldownFrameTemplate")
    reincarnation.cooldown:SetAllPoints(reincarnation)
    if reincarnation.cooldown.SetDrawEdge then
        reincarnation.cooldown:SetDrawEdge(false)
    end
    applyIconCooldownNumberSetting(reincarnation)
    reincarnation.iconTimerText = reincarnation.cooldown:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    reincarnation.iconTimerText:SetDrawLayer("OVERLAY", 7)
    reincarnation.iconTimerText:SetPoint("CENTER", reincarnation, "CENTER", 0, 0)
    self:ApplyIconTimerTextStyle(reincarnation)
    reincarnation.iconTimerText:SetShadowColor(0, 0, 0, 0.9)
    reincarnation.iconTimerText:SetShadowOffset(1, -1)
    reincarnation.iconTimerText:Hide()
    reincarnation.timerText = reincarnation:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    self:ApplyTimerTextStyle(reincarnation)
    attachSpellTooltip(reincarnation, function()
        return ST.Config.ReincarnationSpellID
    end)
    attachReincarnationTooltip(reincarnation)
    self.reincarnationButton = reincarnation
    barButtons[#barButtons + 1] = reincarnation

    local earth = createActionButton("TotemMaster_EarthShieldButton", secondary, BAR_SIZE)
    earth.tmTimerProfile = "secondary"
    earth.tmDisableCooldownRing = true
    earth.cooldown = CreateFrame("Cooldown", "TotemMaster_EarthShieldButtonCooldown", earth, "CooldownFrameTemplate")
    earth.cooldown:SetAllPoints(earth)
    if earth.cooldown.SetDrawEdge then
        earth.cooldown:SetDrawEdge(false)
    end
    applyIconCooldownNumberSetting(earth)
    earth.iconTimerText = earth.cooldown:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    earth.iconTimerText:SetDrawLayer("OVERLAY", 7)
    earth.iconTimerText:SetPoint("CENTER", earth, "CENTER", 0, 0)
    self:ApplyIconTimerTextStyle(earth)
    earth.iconTimerText:SetShadowColor(0, 0, 0, 0.9)
    earth.iconTimerText:SetShadowOffset(1, -1)
    earth.iconTimerText:Hide()
    earth.timerText = earth:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    self:ApplyTimerTextStyle(earth)
    earth:SetScript("OnEnter", function(selfButton)
        hideTaskToken = hideTaskToken + 1
        UI:ShowEarthTargetMenu(selfButton)
    end)
    earth:SetScript("OnLeave", function()
        UI:ScheduleHideMenu()
    end)
    earth:SetScript("PostClick", function(_, mouseButton, down)
        if down then
            return
        end
        if mouseButton == "LeftButton" and earth.tmDraggedRelease then
            return
        end
        if mouseButton == "LeftButton" then
            if not UI:HasEarthShieldTarget() then
                ST:Print("No valid target")
            end
        elseif mouseButton == "RightButton" then
            ST.db.earthShieldTarget = ""
            UI:RefreshEarthShieldMacro()
            hideMenuNow()
            ST:Print("已清除大地之盾预设目标")
        end
    end)
    attachSpellTooltip(earth, function()
        return ST.Config.EarthShieldSpellID
    end)
    earth.targetText = earth:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    earth.targetText:SetPoint("TOP", earth, "BOTTOM", 0, -2)
    earth.targetText:SetTextColor(1, 1, 1)
    earth.targetText:Hide()
    self.earthShieldButton = earth
    barButtons[#barButtons + 1] = earth

    self.secondaryButtons = { shield, weapon, reincarnation, earth }
    for i = 1, #self.secondaryButtons do
        bindProxyDragToButton(self.secondaryButtons[i], function()
            return getSecondaryDragTargetFrame()
        end, saveBarPointByTarget)
    end

    self.callElementsProxy = createHiddenSecureButton("TotemMaster_CallElementsButton")
    self.callAncestorsProxy = createHiddenSecureButton("TotemMaster_CallAncestorsButton")
    self.callSpiritsProxy = createHiddenSecureButton("TotemMaster_CallSpiritsButton")
    self.callElementsProxy:SetScript("PreClick", function(_, _, down)
        if down then
            return
        end
        ST:RunOrQueue("快捷键应用预设1", function()
            ST.CastEngine:ApplyPreset(1)
        end)
    end)
    self.callAncestorsProxy:SetScript("PreClick", function(_, _, down)
        if down then
            return
        end
        ST:RunOrQueue("快捷键应用预设2", function()
            ST.CastEngine:ApplyPreset(2)
        end)
    end)
    self.callSpiritsProxy:SetScript("PreClick", function(_, _, down)
        if down then
            return
        end
        ST:RunOrQueue("快捷键应用预设3", function()
            ST.CastEngine:ApplyPreset(3)
        end)
    end)

    self.defaultShieldButton = createHiddenSecureButton("TotemMaster_DefaultShieldButton")
    self.defaultWeaponButton = createHiddenSecureButton("TotemMaster_DefaultWeaponButton")

    frame.elapsed = 0
    frame:SetScript("OnUpdate", function(_, elapsed)
        UI:UpdateMenuAutoHide(elapsed)
        frame.elapsed = frame.elapsed + elapsed
        if frame.elapsed >= TIMER_UPDATE_INTERVAL then
            frame.elapsed = frame.elapsed - TIMER_UPDATE_INTERVAL
            UI:UpdateTotemTimers(false)
        end
    end)

    self:CreateSettings()
    self:EnsureSettingsRegistered()
end
