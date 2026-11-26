local _, ns = ...
if not ns.Build.HasModule("HunterAspects") then return end

local Adapter = ns.HunterAspectsAdapter
local Tracking = {}
local IDS = Adapter.TRACKING_IDS
local ID_SET = {}
for _, id in ipairs(IDS) do ID_SET[id] = true end
local DEFAULTS = {enabled = true, detached = false, slot = "LAST", menuDirection = "AUTO", menuPerLine = 3,
    x = 0, y = -350, direction = "RIGHT", alignment = "CENTER", perLine = 9,
    useAspectStyle = true, iconWidth = 30, iconHeight = 30, spacing = 1}
local GROWTH = {
    RIGHT = {x = 1, y = 0, point = "TOPLEFT", opposite = "TOPRIGHT"},
    LEFT = {x = -1, y = 0, point = "TOPRIGHT", opposite = "TOPLEFT"},
    UP = {x = 0, y = 1, point = "BOTTOMLEFT", opposite = "TOPLEFT"},
    DOWN = {x = 0, y = -1, point = "TOPLEFT", opposite = "BOTTOMLEFT"},
}
local ALIGNMENTS = {LEFT = true, CENTER = true, RIGHT = true, TOP = true, BOTTOM = true}
local LIMITS = {perLine = {1, 9}, menuPerLine = {1, 9}, iconWidth = {16, 80}, iconHeight = {16, 80}, spacing = {0, 20}}
local TRACKING_EVENT = "MINIMAP_UPDATE_TRACKING"
local TRACKING_ICON = 132328
local CANCEL_ICON = 136813
local CANCEL_ROW = {cancel = true, name = "取消追踪", icon = CANCEL_ICON}
local NO_TRACKING_ROW = {name = "猎人追踪", icon = CANCEL_ICON}
local POSITION_FRAMES = {"trackingBar", "trackingMoveTarget", "trackingPreviewBar"}

-- Combat ends editing immediately. The restricted condition lets the live menu
-- reopen before the addon can clear the edit gate out of combat.
local MENU_GUARD = [[
    if self:GetAttribute("menu-off") and not SecureCmdOptionParse("[combat] show") then return end
    local m = self:GetFrameRef("menu")
    if not m or not self:GetAttribute("has-choices") then return end
]]
local SHOW_MENU = [[
    m:Show()
    m:RegisterAutoHide(0.2)
    m:AddToAutoHide(self)
]]
local CLICK_MENU = MENU_GUARD .. [[
    if m:IsShown() then
        m:UnregisterAutoHide()
        m:Hide()
        return
    end
]] .. SHOW_MENU
-- Wrapped_Click runs the post snippet only with a message from the pre
-- snippet. Its self is the clicked button and control is the menu header.
local CLOSE_ON_CLICK = [[
    if self:GetAttribute("tracking-menu") then return nil, true end
]]
local CLOSE_AFTER_CLICK = [[
    control:UnregisterAutoHide()
    control:Hide()
]]

local function NormalizeValue(key, value)
    local default = DEFAULTS[key]
    if type(default) == "boolean" then
        if type(value) == "boolean" then return value end
    elseif LIMITS[key] then
        local limits, number = LIMITS[key], tonumber(value)
        if number and number == number then
            return math.max(limits[1], math.min(limits[2], math.floor(number + 0.5)))
        end
    elseif key == "direction" and GROWTH[value]
        or key == "alignment" and ALIGNMENTS[value]
        or key == "menuDirection" and (value == "AUTO" or GROWTH[value])
        or key == "slot" and (value == "FIRST" or value == "LAST")
        or (key == "x" or key == "y") and type(value) == "number" and math.abs(value) < math.huge then
        return value
    end
end

function Tracking.Normalize(profile)
    local p = profile.tracking
    if type(p) ~= "table" then p = {}; profile.tracking = p end
    for key, default in pairs(DEFAULTS) do
        local value = NormalizeValue(key, p[key])
        if value == nil then value = default end
        p[key] = value
    end
    local seen, order = {}, {}
    if type(p.order) == "table" then
        local indices = {}
        for index, id in pairs(p.order) do
            if type(index) == "number" and index >= 1 and index % 1 == 0 and ID_SET[id] then
                indices[#indices + 1] = index
            end
        end
        table.sort(indices)
        for _, index in ipairs(indices) do
            local id = p.order[index]
            if not seen[id] then order[#order + 1], seen[id] = id, true end
        end
    end
    for _, id in ipairs(IDS) do
        if not seen[id] then order[#order + 1] = id end
    end
    p.order = order
    if type(p.hidden) ~= "table" then p.hidden = {} end
    for id, value in pairs(p.hidden) do
        if not ID_SET[id] or value ~= true then p.hidden[id] = nil end
    end
end

function Tracking.ResetPosition(profile)
    if profile.tracking.detached then
        profile.tracking.x, profile.tracking.y = DEFAULTS.x, DEFAULTS.y
    end
end

function Tracking.RestoreDefaults(profile)
    profile.tracking = {enabled = profile.tracking.enabled}
    Tracking.Normalize(profile)
end

local function SettingsChanged(module)
    if module:IsEnabled() and Adapter:IsHunter() then module:Refresh() end
    module:RefreshSettings("tracking")
    return true
end

function Tracking.SetSetting(module, key, value)
    if Adapter:InCombat() or key == "x" or key == "y" then return false end
    value = NormalizeValue(key, value)
    if value == nil then return false end
    module.db.profile.tracking[key] = value
    return SettingsChanged(module)
end

function Tracking.SetChecked(module, index, checked)
    if Adapter:InCombat() then return false end
    local p = module.db.profile.tracking
    local id = p.order[index]
    if not id then return false end
    p.hidden[id] = not checked or nil
    return SettingsChanged(module)
end

function Tracking.Move(module, index, step)
    if Adapter:InCombat() then return false end
    local order = module.db.profile.tracking.order
    local other = index + step
    if not order[index] or not order[other] then return false end
    order[index], order[other] = order[other], order[index]
    return SettingsChanged(module)
end

function Tracking.RestoreOrder(module)
    if Adapter:InCombat() then return false end
    local order = module.db.profile.tracking.order
    for i, id in ipairs(IDS) do order[i] = id end
    return SettingsChanged(module)
end

function Tracking.CatalogByID()
    local byID = {}
    for _, row in ipairs(Adapter:TrackingCatalog()) do byID[row.id] = row end
    return byID
end

local function SetSize(frame, width, height)
    if frame:GetWidth() ~= width or frame:GetHeight() ~= height then frame:SetSize(width, height) end
end

local function Place(frame, point, parent, relativePoint, x, y)
    local oldPoint, oldParent, oldRelative, oldX, oldY = frame:GetPoint(1)
    if oldPoint == point and oldParent == parent and oldRelative == relativePoint
        and oldX == x and oldY == y then return end
    frame:ClearAllPoints()
    frame:SetPoint(point, parent, relativePoint, x, y)
end
Tracking.SetFrameSize, Tracking.PlaceFrame = SetSize, Place

local function Hide(frame)
    if frame then frame:Hide() end
end
local function ClearPreview(button)
    button.row = nil
    button:Hide()
end

local function HideSecure(frame)
    if not Adapter:InCombat() then frame:Hide() end
end

local function CloseMenu(menu)
    if not menu or Adapter:InCombat() or not menu:IsShown() then return end
    if menu.Execute then menu:Execute("self:UnregisterAutoHide()") end
    menu:Hide()
end

local function ClearTrackingButton(button)
    if not Adapter:InCombat() then
        button:SetAttribute("tracking-menu", nil)
        button:SetAttribute("type1", nil)
        button:SetAttribute("spell1", nil)
        button:Hide()
        button.row = nil
    end
end

local function ClearMain(button)
    if not Adapter:InCombat() then
        button:SetAttribute("has-choices", nil)
        button:SetAttribute("menu-off", true)
        button:Hide()
        button.row = nil
    end
end

local function ClearCancelButton(button)
    if not Adapter:InCombat() then
        button:SetAttribute("tracking-menu", nil)
        button:SetAttribute("type1", nil)
        button:SetAttribute("spell1", nil)
        button:Hide()
        button.row = nil
    end
end

local function OnCancelClick(button)
    local module = button.trackingModule
    if not module or not module.trackingEvent then return end
    if Adapter:CancelHunterTracking() then
        module.activeTracking, module.trackingKnown = nil, true
        Tracking.ApplyState(module)
        Tracking.RefreshState(module)
    end
end

local function Tooltip(button)
    local module = button.trackingModule
    local preview, isMain = button.trackingPreview, button.trackingMain
    local status
    if isMain and not preview then
        if not module.trackingKnown then status = "追踪状态未知"
        elseif not module.activeTracking then status = "当前未开启猎人追踪"
        else status = "当前追踪" end
    end
    Adapter:TrackingTooltip(button, button.row, preview, isMain, status)
end

local function HideTooltip() Adapter:HideTooltip() end

local function EnsureCancelBg(button)
    if button.cancelBg then return button.cancelBg end
    local bg = button:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints(button)
    bg:SetColorTexture(0.06, 0.06, 0.06, 0.82)
    bg:Hide()
    button.cancelBg = bg
    return bg
end

local function EnsureCancelButton(module, container, menu)
    local button = module.trackingCancelButton
    if not button then
        button = module:CreateIconButton(container, "SecureActionButtonTemplate", ClearCancelButton,
            Tooltip, HideTooltip)
        EnsureCancelBg(button)
        button.trackingModule = module
        ns.Compat.RegisterPrimarySecureClicks(button)
        button:SetScript("PostClick", OnCancelClick)
        Adapter:WrapSecureScript(button, "OnClick", CLOSE_ON_CLICK, CLOSE_AFTER_CLICK, menu)
        module.trackingCancelButton = button
    else
        module:OwnFrame(button, ClearCancelButton)
    end
    return button
end

local function SetTexture(button, row)
    local texture = row.icon or TRACKING_ICON
    if button.trackingTexture ~= texture then
        button.icon:SetTexture(texture)
        button.trackingTexture = texture
        if button.cancelBg then
            if texture == CANCEL_ICON then button.cancelBg:Show() else button.cancelBg:Hide() end
        end
    end
end

local function EnsureMenu(module)
    local menu = module.trackingMenu
    if menu then
        module:OwnFrame(menu, CloseMenu)
    else
        menu = module:CreateFrame("Frame", nil, module.trackingMain or module.bar,
            "SecureHandlerBaseTemplate", CloseMenu)
        menu:SetFrameStrata("HIGH")
        menu:Hide()
        module.trackingMenu = menu
    end
    return menu
end

local function EnsureMain(module, menu)
    if module.trackingMain then
        module:OwnFrame(module.trackingMain, ClearMain)
        return
    end
    local main = module:CreateIconButton(module.bar, "SecureActionButtonTemplate, SecureHandlerBaseTemplate",
        ClearMain, Tooltip, HideTooltip)
    EnsureCancelBg(main)
    main.trackingModule, main.trackingMain = module, true
    module.trackingMain = main
    ns.Compat.RegisterPrimarySecureClicks(main)
    menu:SetParent(main)
    Adapter:SetSecureFrameRef(main, "menu", menu)
    Adapter:WrapSecureScript(main, "OnEnter", MENU_GUARD .. SHOW_MENU)
    Adapter:WrapSecureScript(main, "OnClick", CLICK_MENU)
end

local function DetachedStyle(profile)
    local p = profile.tracking
    return p.useAspectStyle and profile or p
end

function Tracking.GetMenuDirection(profile)
    local direction = profile.tracking.menuDirection
    if direction ~= "AUTO" then return direction end
    return GROWTH[profile.direction].y == 0 and "UP" or "RIGHT"
end

local function PlaceMenu(menu, main, direction, spacing)
    local growth = GROWTH[direction]
    main.trackingMenuDirection = direction
    Place(menu, growth.point, main, growth.opposite, growth.x * spacing, growth.y * spacing)
end

local function GridSize(count, direction, perLine, style)
    local primary, secondary = math.min(count, perLine), math.ceil(count / perLine)
    if GROWTH[direction].y ~= 0 then primary, secondary = secondary, primary end
    return primary * (style.iconWidth + style.spacing) - style.spacing,
        secondary * (style.iconHeight + style.spacing) - style.spacing
end

local function PlaceCell(button, container, index, direction, perLine, style)
    local growth = GROWTH[direction]
    local primary, secondary = (index - 1) % perLine, math.floor((index - 1) / perLine)
    local x, y = growth.x * primary, growth.y * primary
    if growth.y == 0 then y = -secondary else x = secondary end
    SetSize(button, style.iconWidth, style.iconHeight)
    Place(button, growth.point, container, growth.point,
        x * (style.iconWidth + style.spacing), y * (style.iconHeight + style.spacing))
end

function Tracking.ApplyPosition(module)
    local p = module.db.profile.tracking
    for _, key in ipairs(POSITION_FRAMES) do
        local frame = module[key]
        if frame then Place(frame, p.alignment, UIParent, "CENTER", p.x, p.y) end
    end
end

local function EnsureDetached(module, count, style)
    if count > 0 then
        if not module.trackingBar then
            module.trackingBar = module:CreateFrame("Frame", "RSHunterTracking", UIParent, nil, HideSecure)
        else module:OwnFrame(module.trackingBar, HideSecure) end
    end
    if module.unlocked and not module.trackingMoveTarget then
        module.trackingMoveTarget = module:CreateMoveTarget()
    end
    local p = module.db.profile.tracking
    local width, height = GridSize(math.max(1, count), p.direction, p.perLine, style)
    if module.trackingBar then SetSize(module.trackingBar, width, height) end
    if module.trackingMoveTarget then SetSize(module.trackingMoveTarget, width, height) end
end

function Tracking.ApplyState(module)
    local rows = module.trackingRows
    local detached = module.db.profile.tracking.detached
    for i, row in ipairs(rows) do
        local active
        if module.trackingKnown then
            if module.activeTracking == row.id then
                active = true
            elseif detached then
                active = false
            end
        end
        module:ApplyButtonVisual(module.trackingButtons[i], active)
    end
    local activeRow = module.activeTracking and module.trackingByID and module.trackingByID[module.activeTracking]
    if module.trackingCancelButton and #rows > 0 then
        module:ApplyButtonVisual(module.trackingCancelButton, nil)
    end
    if #rows == 0 or detached then return end
    local main = module.trackingMain
    main.row = activeRow or (module.trackingKnown and NO_TRACKING_ROW) or rows[1]
    SetTexture(main, main.row)
    module:ApplyButtonVisual(main, activeRow and true)
end

function Tracking.RefreshState(module)
    if not module.trackingEvent then return end
    local active, status = Adapter:ReadActiveTracking()
    if status == "known" then module.activeTracking, module.trackingKnown = active, true end
    Tracking.ApplyState(module)
end

function Tracking.OnCast(module, spellID)
    if not module.trackingEvent or not module.trackingByID[spellID] then return false end
    if module.trackingKnown and module.activeTracking == spellID then return true end
    module.activeTracking, module.trackingKnown = spellID, true
    Tracking.ApplyState(module)
    return true
end

function Tracking.UpdateMenuGate(module)
    local main, menu = module.trackingMain, module.trackingMenu
    if not main then return end
    local off = module.unlocked or module.preview or not main:IsShown()
    if main:GetAttribute("menu-off") ~= off then main:SetAttribute("menu-off", off) end
    if off then CloseMenu(menu) end
end

function Tracking.Rebuild(module)
    local p = module.db.profile.tracking
    local rows = module.trackingRows
    for i = #rows, 1, -1 do rows[i] = nil end
    module.trackingByID = p.enabled and Tracking.CatalogByID() or nil
    if module.trackingByID then
        for _, id in ipairs(p.order) do
            local row = module.trackingByID[id]
            if row.known and row.name and not p.hidden[id] then rows[#rows + 1] = row end
        end
    end
    local count = #rows
    local eventNeeded = count > 0
    if eventNeeded ~= module.trackingEvent then
        if eventNeeded then module:RegisterEvent(TRACKING_EVENT, Tracking.RefreshState)
        else module:UnregisterEvent(TRACKING_EVENT) end
        module.trackingEvent = eventNeeded
    end
    CloseMenu(module.trackingMenu)
    -- The secure header is shared, even in detached mode, so each pooled
    -- button can be wrapped once and moved between both parents.
    local menu = eventNeeded and EnsureMenu(module)
    local merged = eventNeeded and not p.detached
    if merged then
        EnsureMain(module, menu)
        if not module.trackingMain:GetAttribute("has-choices") then
            module.trackingMain:SetAttribute("has-choices", true)
        end
        module.trackingMain:Show()
    elseif module.trackingMain then ClearMain(module.trackingMain) end
    local totalCells = eventNeeded and (count + 1) or 0
    if p.enabled and p.detached and (eventNeeded or module.unlocked) then
        EnsureDetached(module, totalCells, DetachedStyle(module.db.profile))
    end
    if module.trackingBar then
        if eventNeeded and p.detached then module.trackingBar:Show() else module.trackingBar:Hide() end
    end
    if eventNeeded then
        local container, direction, perLine, style
        if merged then
            container, direction, perLine, style = menu,
                Tracking.GetMenuDirection(module.db.profile), p.menuPerLine, module.db.profile
            SetSize(container, GridSize(totalCells, direction, perLine, style))
            PlaceMenu(container, module.trackingMain, direction, style.spacing)
        else
            container, direction, perLine, style = module.trackingBar, p.direction, p.perLine,
                DetachedStyle(module.db.profile)
        end
        for i, row in ipairs(rows) do
            local button = module.trackingButtons[i]
            if not button then
                button = module:CreateIconButton(container, "SecureActionButtonTemplate", ClearTrackingButton,
                    Tooltip, HideTooltip)
                button.trackingModule = module
                Adapter:WrapSecureScript(button, "OnClick", CLOSE_ON_CLICK, CLOSE_AFTER_CLICK, menu)
                module.trackingButtons[i] = button
            else module:OwnFrame(button, ClearTrackingButton) end
            if button:GetParent() ~= container then button:SetParent(container) end
            local menuChoice = merged or nil
            if button:GetAttribute("tracking-menu") ~= menuChoice then button:SetAttribute("tracking-menu", menuChoice) end
            if not button.row or button.row.name ~= row.name then Adapter:Configure(button, row.name) end
            button.row = row
            SetTexture(button, row)
            PlaceCell(button, container, i, direction, perLine, style)
            button:Show()
        end
        local cancel = EnsureCancelButton(module, container, menu)
        if cancel:GetParent() ~= container then cancel:SetParent(container) end
        local menuChoice = merged or nil
        if cancel:GetAttribute("tracking-menu") ~= menuChoice then cancel:SetAttribute("tracking-menu", menuChoice) end
        cancel.row = CANCEL_ROW
        SetTexture(cancel, CANCEL_ROW)
        PlaceCell(cancel, container, totalCells, direction, perLine, style)
        cancel:Show()
    else
        if module.trackingCancelButton and module.trackingCancelButton.row then
            ClearCancelButton(module.trackingCancelButton)
        end
        module.activeTracking, module.trackingKnown = nil, false
    end
    for i = count + 1, #module.trackingButtons do
        if module.trackingButtons[i].row then ClearTrackingButton(module.trackingButtons[i]) end
    end
    Tracking.UpdateMenuGate(module)
    return merged
end

local function PreviewOver(button)
    button.trackingModule.trackingPreviewMenu:Show()
    Tooltip(button)
end

local function PreviewOut(button)
    button.trackingModule.trackingPreviewMenu:Hide()
    HideTooltip()
end

function Tracking.HidePreview(module)
    Hide(module.trackingPreviewMain)
    Hide(module.trackingPreviewMenu)
    Hide(module.trackingPreviewBar)
    Hide(module.trackingPreviewCancel)
end

function Tracking.RefreshPreview(module)
    Tracking.HidePreview(module)
    local profile = module.db.profile
    local p = profile.tracking
    if not module.preview or not p.enabled then return false end
    local rows = module.trackingByID or Tracking.CatalogByID()
    local previewTotal = #IDS + 1
    local parent, direction, perLine, style
    if p.detached then
        if not module.trackingPreviewBar then
            module.trackingPreviewBar = module:CreateFrame("Frame", nil, UIParent, nil, Hide)
        else module:OwnFrame(module.trackingPreviewBar, Hide) end
        parent, direction, perLine, style = module.trackingPreviewBar, p.direction, p.perLine, DetachedStyle(profile)
        parent:SetFrameLevel((module.trackingBar or module.bar):GetFrameLevel() + 10)
    else
        if not module.trackingPreviewMain then
            local main = module:CreateIconButton(module.previewBar, nil, ClearPreview, PreviewOver, PreviewOut)
            main.trackingModule, main.trackingMain, main.trackingPreview = module, true, true
            module.trackingPreviewMain = main
            module.trackingPreviewMenu = module:CreateFrame("Frame", nil, main, nil, Hide)
            module.trackingPreviewMenu:SetFrameStrata("HIGH")
            module.trackingPreviewMenu:Hide()
        else
            module:OwnFrame(module.trackingPreviewMain, ClearPreview)
            module:OwnFrame(module.trackingPreviewMenu, Hide)
        end
        local main = module.trackingPreviewMain
        main.row = rows[p.order[1]]
        SetTexture(main, main.row)
        module:ApplyButtonVisual(main, true)
        parent, direction, perLine, style = module.trackingPreviewMenu, Tracking.GetMenuDirection(profile),
            p.menuPerLine, profile
        PlaceMenu(parent, main, direction, style.spacing)
        main:Show()
    end
    SetSize(parent, GridSize(previewTotal, direction, perLine, style))
    for i, id in ipairs(p.order) do
        local row = rows[id]
        local button = module.trackingPreviewButtons[i]
        if not button then
            button = module:CreateIconButton(parent, nil, ClearPreview, Tooltip, HideTooltip)
            module.trackingPreviewButtons[i] = button
            button.trackingModule, button.trackingPreview = module, true
        else module:OwnFrame(button, ClearPreview) end
        if button:GetParent() ~= parent then button:SetParent(parent) end
        button:EnableMouse(p.detached)
        button.row = row
        SetTexture(button, row)
        PlaceCell(button, parent, i, direction, perLine, style)
        local active
        if i == 1 or p.detached then active = i == 1 end
        module:ApplyButtonVisual(button, active)
        button:Show()
    end
    local previewCancel = module.trackingPreviewCancel
    if not previewCancel then
        previewCancel = module:CreateIconButton(parent, nil, ClearPreview, Tooltip, HideTooltip)
        EnsureCancelBg(previewCancel)
        previewCancel.trackingModule, previewCancel.trackingPreview = module, true
        module.trackingPreviewCancel = previewCancel
    else module:OwnFrame(previewCancel, ClearPreview) end
    if previewCancel:GetParent() ~= parent then previewCancel:SetParent(parent) end
    previewCancel:EnableMouse(p.detached)
    previewCancel.row = CANCEL_ROW
    SetTexture(previewCancel, CANCEL_ROW)
    PlaceCell(previewCancel, parent, previewTotal, direction, perLine, style)
    module:ApplyButtonVisual(previewCancel, nil)
    previewCancel:Show()
    if p.detached then parent:Show() end
    return not p.detached
end

function Tracking.Disable(module)
    for i = #module.trackingRows, 1, -1 do module.trackingRows[i] = nil end
    module.trackingByID, module.activeTracking, module.trackingKnown, module.trackingEvent = nil, nil, false, false
end

ns.HunterAspectsTracking = Tracking
