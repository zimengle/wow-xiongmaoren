local _, ns = ...

local Data = ns.ExtraToolsData
local Adapter = ns.ExtraToolsAdapter
if type(Data) ~= "table" then error("ExtraTools Data must load before View.lua", 2) end
if type(Adapter) ~= "table" then return end

local View = {}

local LAYOUT = {
    copyWindowWidth = 400,
    copyWindowHeight = 200,
    copyButtonWidth = 150,
    copyButtonHeight = 35,
    copyButtonDialogLevel = 260,
    lfgStrata = "DIALOG",
    celestialStrata = "MEDIUM",
}

local function CleanupFrame(frame, preserveSecureClick)
    if not frame then return end
    if type(frame.SetScript) == "function" then
        if not preserveSecureClick then frame:SetScript("OnClick", nil) end
        frame:SetScript("OnEnter", nil)
        frame:SetScript("OnLeave", nil)
        frame:SetScript("OnMouseDown", nil)
        frame:SetScript("OnMouseUp", nil)
        frame:SetScript("OnDragStart", nil)
        frame:SetScript("OnDragStop", nil)
    end
    if type(frame.SetAttribute) == "function" then
        frame:SetAttribute("type1", nil)
        frame:SetAttribute("macrotext1", nil)
    end
    if type(frame.Hide) == "function" then frame:Hide() end
end

local function CleanupSecureFrame(frame)
    -- Keep the template-owned macro entry point when retained buttons are reused.
    CleanupFrame(frame, true)
end

local function ReownFrame(module, frame, label, cleanup)
    if not frame then return nil end
    module:OwnFrame(frame, cleanup or CleanupFrame, label)
    return frame
end

local function ResolveFont()
    local system = ns.UI and ns.UI.GetSystem and ns.UI:GetSystem()
    local theme = system and system.theme
    if theme and type(theme.ResolveFont) == "function" then
        local path = theme:ResolveFont("body")
        if path then return path end
    end
    return Adapter:GetFontPath()
end

function View:EnsureLayoutHint(module, visible)
    if not visible then
        if module.layoutHint and module.layoutHint.Hide then module.layoutHint:Hide() end
        if module.layoutTitle and module.layoutTitle.Hide then module.layoutTitle:Hide() end
        return false
    end
    local manager = Adapter:GetEditModeManager()
    local dropdown = manager and manager.LayoutDropdown
    if not dropdown or type(dropdown.CreateFontString) ~= "function" then return false end
    if module.layoutHint then module.layoutHint:Show() module.layoutTitle:Show() return true end
    local title = dropdown:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPRIGHT", manager, "TOPLEFT", -10, -30)
    title:SetJustifyH("RIGHT")
    title:SetText("|cffff559a重要提醒|r")
    title:SetFont(ResolveFont(), 20, "OUTLINE")
    local hint = dropdown:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    hint:SetPoint("TOPRIGHT", title, "BOTTOMRIGHT", 0, -8)
    hint:SetJustifyH("RIGHT")
    hint:SetSpacing(4)
    hint:SetText("如果你的布局不正确\n注意在右侧下拉菜单选择|cffff559a露露|r布局\n推荐用 RSS 一键导入全部预设\n输入 /rs 打开设置")
    hint:SetFont(ResolveFont(), 15, "OUTLINE")
    module.layoutTitle, module.layoutHint = title, hint
    return true
end

function View:EnsureImportCopyButton(module, dialog, onClick)
    if not dialog or not Adapter:IsShown(dialog) then return nil end
    local button = module.importCopyButton
    if not button then
        button = module:CreateFrame("Button", "RS_ExtraTools_ImportCopyButton", Adapter:GetRootFrame(),
            "UIPanelButtonTemplate", CleanupFrame, "ExtraTools import copy button")
        button:SetText("复制 露露 16:9")
        button:SetFrameStrata("FULLSCREEN_DIALOG")
        module.importCopyButton = button
    else
        ReownFrame(module, button, "ExtraTools retained import copy button")
    end
    button:SetScript("OnClick", function() onClick() end)
    button:SetSize(LAYOUT.copyButtonWidth, LAYOUT.copyButtonHeight)
    button:ClearAllPoints()
    local importBox = dialog.ImportBox
    if importBox and type(importBox.GetObjectType) == "function" and importBox:GetObjectType() == "Frame" then
        button:SetPoint("TOP", importBox, "TOP", 0, 6)
    else
        button:SetPoint("TOP", dialog, "TOP", 0, -90)
    end
    button:SetFrameLevel((type(dialog.GetFrameLevel) == "function" and dialog:GetFrameLevel() or 0)
        + LAYOUT.copyButtonDialogLevel)
    button:Show()
    return button
end

function View:ShowCopyWindow(module, text, anchor)
    if type(text) ~= "string" or text == "" then return false end
    local frame = module.copyWindow
    if not frame then
        frame = module:CreateFrame("Frame", "RSExtraToolsCopyWindow", Adapter:GetRootFrame(),
            "BasicFrameTemplateWithInset", CleanupFrame, "ExtraTools copy window")
        frame:SetSize(LAYOUT.copyWindowWidth, LAYOUT.copyWindowHeight)
        frame:SetFrameStrata("FULLSCREEN_DIALOG")
        local edit = module:CreateFrame("EditBox", nil, frame, "InputBoxTemplate",
            CleanupFrame, "ExtraTools copy edit box")
        edit:SetMultiLine(true)
        edit:SetAutoFocus(false)
        edit:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -36)
        edit:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -16, 16)
        frame.__rsEditBox = edit
        module.copyWindow = frame
    else
        ReownFrame(module, frame, "ExtraTools retained copy window")
        ReownFrame(module, frame.__rsEditBox, "ExtraTools retained copy edit box")
    end
    frame.__rsEditBox:SetText(text)
    frame.__rsEditBox:SetFocus()
    frame.__rsEditBox:HighlightText(0, string.len(text))
    frame:ClearAllPoints()
    if anchor and Adapter:IsShown(anchor) then frame:SetPoint("TOP", anchor, "BOTTOM", 0, -8)
    else frame:SetPoint("CENTER", Adapter:GetRootFrame(), "CENTER", 0, 0) end
    frame:Show()
    return true
end

function View:HideRetailUI(module)
    self:EnsureLayoutHint(module, false)
    if module.importCopyButton then module.importCopyButton:Hide() end
    if module.copyWindow then module.copyWindow:Hide() end
end

function View:ConfigureLFGButton(module, button, info)
    ReownFrame(module, button, "ExtraTools retained LFG " .. info.key, CleanupSecureFrame)
    button:SetSize(Data.LFG.buttonWidth, Data.LFG.buttonHeight)
    local compat = Adapter:GetCompat()
    if compat and type(compat.RegisterPrimarySecureClicks) == "function" then
        compat.RegisterPrimarySecureClicks(button)
    else
        button:RegisterForClicks("AnyUp", "AnyDown")
    end
    button:SetAttribute("type1", "macro")
    button:SetAttribute("macrotext1", info.macro)
    local text = button.__rsText
    local tooltip = Adapter:GetTooltip()
    button:SetScript("OnEnter", function(owner)
        text:SetFont(ResolveFont(), Data.LFG.buttonHoverFontSize, "OUTLINE")
        if tooltip then
            tooltip:SetOwner(owner, "ANCHOR_RIGHT")
            tooltip:SetText("|cffffffff露露的快捷按钮|r")
            tooltip:AddLine(info.tooltip, 0, 1, 0, true)
            tooltip:Show()
        end
    end)
    button:SetScript("OnLeave", function(owner)
        text:SetFont(ResolveFont(), Data.LFG.buttonFontSize, "OUTLINE")
        owner:SetAlpha(owner.__rsBaseAlpha or 1)
        if tooltip then tooltip:Hide() end
    end)
    button:SetScript("OnMouseDown", function(owner) owner:SetAlpha((owner.__rsBaseAlpha or 1) * 0.5) end)
    button:SetScript("OnMouseUp", function(owner) owner:SetAlpha(owner.__rsBaseAlpha or 1) end)
    return button
end

function View:CreateLFGButtons(module)
    local buttons = module.lfgButtons
    if buttons then
        local index
        for index = 1, #Data.LFG.buttons do
            local info = Data.LFG.buttons[index]
            self:ConfigureLFGButton(module, buttons[info.key], info)
        end
        return buttons
    end

    buttons = {}
    local root = Adapter:GetRootFrame()
    local index
    for index = 1, #Data.LFG.buttons do
        local info = Data.LFG.buttons[index]
        local name = info.key == "leave" and "RSLFGToolsLeaveButton" or "RSLFGToolsTeleportButton"
        local button = module:CreateFrame("Button", name, root, "SecureActionButtonTemplate",
            CleanupSecureFrame, "ExtraTools LFG " .. info.key)
        local text = button:CreateFontString(nil, "ARTWORK")
        text:SetPoint("CENTER", button, "CENTER", 0, 0)
        text:SetFont(ResolveFont(), Data.LFG.buttonFontSize, "OUTLINE")
        text:SetText(info.label)
        text:SetTextColor(info.color[1], info.color[2], info.color[3], 1)
        button.__rsText = text
        self:ConfigureLFGButton(module, button, info)
        buttons[info.key] = button
    end
    module.lfgButtons = buttons
    return buttons
end

function View:ApplyLFGButtons(module, profile, x, y, shouldShow)
    if Adapter:IsInCombat() then return false, "combat" end
    local buttons = self:CreateLFGButtons(module)
    local shown = {}
    local index
    for index = 1, #Data.LFG.buttons do
        local info = Data.LFG.buttons[index]
        local button = buttons[info.key]
        local enabled = info.key == "leave" and profile.showLeaveButton or profile.showTeleportButton
        if enabled then shown[#shown + 1] = button end
        if enabled and shouldShow then button:Show() else button:Hide() end
        Adapter:SyncSecureClick(button)
    end
    local total = (#shown * Data.LFG.buttonWidth) + math.max(#shown - 1, 0) * Data.LFG.buttonSpacing
    local start = x - total + Data.LFG.buttonWidth
    for index = 1, #shown do
        local button = shown[index]
        button:ClearAllPoints()
        button:SetPoint("TOPRIGHT", Adapter:GetRootFrame(), "TOPRIGHT",
            start + ((index - 1) * (Data.LFG.buttonWidth + Data.LFG.buttonSpacing)), y)
        button.__rsBaseAlpha = profile.alpha
        button:SetScale(profile.scale)
        button:SetAlpha(profile.alpha)
    end
    return #shown > 0 and shouldShow
end

function View:ReleaseLFGOwnership(module)
    local _, button
    for _, button in pairs(module.lfgButtons or {}) do
        button:Hide()
        module:ReleaseFrame(button)
    end
    if module.lfgToolsMoveOverlay then
        module.lfgToolsMoveOverlay:Hide()
        module:ReleaseFrame(module.lfgToolsMoveOverlay)
    end
    if module.lfgToolsMover then
        module.lfgToolsMover:Hide()
        module:ReleaseFrame(module.lfgToolsMover)
    end
    return true
end

function View:EnsureLFGMover(module, x, y, width)
    local mover = module.lfgToolsMover
    if not mover then
        mover = module:CreateFrame("Frame", "RSLFGToolsMover", Adapter:GetRootFrame(), nil,
            CleanupFrame, "ExtraTools LFG mover")
        mover:SetFrameStrata(LAYOUT.lfgStrata)
        module.lfgToolsMover = mover
    else
        ReownFrame(module, mover, "ExtraTools retained LFG mover")
    end
    mover:SetSize(width, Data.LFG.buttonHeight)
    mover:SetMovable(true)
    mover:EnableMouse(true)
    mover:RegisterForDrag("LeftButton")
    mover:SetScript("OnDragStart", function(owner) owner:StartMoving() end)
    mover:SetScript("OnDragStop", function(owner)
        owner:StopMovingOrSizing()
        local newX, newY = Adapter:GetFrameTopRightOffset(owner)
        if newX then module:SetActiveLFGToolsPosition(newX, newY) end
        module:UpdateLFGTools()
    end)
    if not mover.__rsPositioned then
        mover:SetPoint("TOPRIGHT", Adapter:GetRootFrame(), "TOPRIGHT", x, y)
        mover.__rsPositioned = true
    end
    return mover
end

function View:EnsureLFGMoveOverlay(module, mover)
    local service = ns.MoveOverlay
    if type(service) ~= "table" or type(service.Ensure) ~= "function" then return nil end
    if module.lfgToolsMoveOverlay then
        ReownFrame(module, module.lfgToolsMoveOverlay, "ExtraTools retained LFG move overlay")
    end
    local overlay, record = service:Ensure(mover, {
        label = "退队 / 传送",
        fontSize = 13,
        createFrame = function(parent)
            local retained = module.lfgToolsMoveOverlay
            if retained then return retained end
            local created = module:CreateFrame("Button", nil, parent, "BackdropTemplate",
                CleanupFrame, "ExtraTools LFG move overlay")
            module.lfgToolsMoveOverlay = created
            return created
        end,
        canInteract = function() return not Adapter:IsInCombat() end,
        onDragStop = function(owner)
            local newX, newY = Adapter:GetFrameTopRightOffset(owner)
            if newX then module:SetActiveLFGToolsPosition(newX, newY) end
            module:UpdateLFGTools()
        end,
        layout = function(moveOverlay, owner)
            moveOverlay:ClearAllPoints()
            moveOverlay:SetPoint("TOPLEFT", owner, "TOPLEFT", 0, 0)
            moveOverlay:SetPoint("BOTTOMRIGHT", owner, "BOTTOMRIGHT", 0, 0)
        end,
    })
    if overlay then
        module.lfgToolsMoveOverlay = overlay
        module.lfgToolsMoveOverlayRecord = record
    end
    return overlay
end

function View:HideLFGMover(module)
    if module.lfgToolsMoveOverlay then
        module.lfgToolsMoveOverlay:Hide()
        module:ReleaseFrame(module.lfgToolsMoveOverlay)
    end
    if module.lfgToolsMover then
        module.lfgToolsMover:Hide()
        module:ReleaseFrame(module.lfgToolsMover)
    end
end

function View:PositionLFGMover(mover, x, y, width)
    mover:ClearAllPoints()
    mover:SetPoint("TOPRIGHT", Adapter:GetRootFrame(), "TOPRIGHT", x, y)
    mover:SetSize(width, Data.LFG.buttonHeight)
end

function View:BindCelestialBar(module, bar)
    local tooltip = Adapter:GetTooltip()
    bar:SetScript("OnEnter", function(owner)
        if not tooltip then return end
        tooltip:SetOwner(owner, "ANCHOR_TOP")
        tooltip:SetText(module.celestialTooltipTitle or "天神能量条", 1, 1, 1)
        if module.celestialTooltipText then tooltip:AddLine(module.celestialTooltipText, 0.85, 0.85, 0.85, true) end
        tooltip:Show()
    end)
    bar:SetScript("OnLeave", function() if tooltip then tooltip:Hide() end end)
end

function View:EnsureCelestialBar(module, profile)
    local bar = module.simpleCelestialBar
    if not bar then
        bar = module:CreateFrame("StatusBar", "RSSimpleAltPowerBar", Adapter:GetRootFrame(), nil,
            CleanupFrame, "ExtraTools celestial bar")
        bar:SetFrameStrata(LAYOUT.celestialStrata)
        bar:SetStatusBarTexture("Interface\\Buttons\\WHITE8X8")
        local background = bar:CreateTexture(nil, "BACKGROUND")
        background:SetPoint("TOPLEFT", -1, 1)
        background:SetPoint("BOTTOMRIGHT", 1, -1)
        background:SetColorTexture(0, 0, 0, 0.5)
        local text = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        text:SetPoint("CENTER", bar, "CENTER", 0, 0)
        bar.__rsValueText = text
        module.simpleCelestialBar = bar
    else
        ReownFrame(module, bar, "ExtraTools retained celestial bar")
    end
    self:BindCelestialBar(module, bar)
    return bar
end

function View:ApplyCelestialFont(module)
    local bar = module.simpleCelestialBar
    if not bar or not bar.__rsValueText then return end
    local font, profile = ns.Font, module:GetCelestialBarDB()
    local path = font and type(font.GetCelestialBarFontPath) == "function"
        and font:GetCelestialBarFontPath() or ResolveFont()
    if font and type(font.ApplyFontString) == "function" then
        font:ApplyFontString(bar.__rsValueText, path, profile.fontSize, "OUTLINE", ResolveFont())
    else
        bar.__rsValueText:SetFont(path, profile.fontSize, "OUTLINE")
    end
end

function View:ApplyCelestialState(module, profile, state)
    -- This is an unprotected display; combat must not suppress encounter power updates.
    local bar = self:EnsureCelestialBar(module, profile)
    bar:SetSize(profile.width, profile.height)
    bar:ClearAllPoints()
    bar:SetPoint("TOP", Adapter:GetRootFrame(), "TOP", profile.x, profile.y)
    bar:SetMinMaxValues(0, state.maximum)
    bar:SetValue(state.value)
    local color = Adapter:GetPlayerClassColor()
    if color then bar:SetStatusBarColor(color.r, color.g, color.b, 1)
    else bar:SetStatusBarColor(0.18, 0.72, 1, 1) end
    self:ApplyCelestialFont(module)
    bar.__rsValueText:SetText(string.format("%d / %d", state.value, state.maximum))
    module.celestialTooltipTitle, module.celestialTooltipText = state.title, state.tooltip
    bar:Show()
    return true
end

function View:HideCelestial(module)
    if module.simpleCelestialBar then module.simpleCelestialBar:Hide() end
end

function View:DisableNativeAltPower(module)
    local frame = Adapter:GetNativeAltPowerFrame()
    if not frame then return false end
    if module._nativeAltPowerFrame ~= frame then
        module._nativeAltPowerFrame = frame
        module._nativeAltPowerState = {
            alpha = type(frame.GetAlpha) == "function" and frame:GetAlpha() or 1,
            mouse = type(frame.IsMouseEnabled) == "function" and frame:IsMouseEnabled() or false,
            shown = Adapter:IsShown(frame),
        }
        module._nativeAltPowerHook = module:HookSecureFunction(frame, "Show", function()
            if module.nativeAltPowerDisabled and module:ShouldOwnNativeAltPowerBar() then
                View:DisableNativeAltPower(module)
            end
        end, "ExtraTools native alt power Show")
    end
    module.nativeAltPowerDisabled = true
    if type(frame.SetAlpha) == "function" then frame:SetAlpha(0) end
    if type(frame.EnableMouse) == "function" then frame:EnableMouse(false) end
    Adapter:Hide(frame)
    return true
end

function View:RestoreNativeAltPower(module)
    if not module.nativeAltPowerDisabled then return false end
    local frame, state = module._nativeAltPowerFrame, module._nativeAltPowerState or {}
    module.nativeAltPowerDisabled = false
    if module._nativeAltPowerHook then module:RemoveHook(module._nativeAltPowerHook) end
    module._nativeAltPowerHook = nil
    module._nativeAltPowerFrame, module._nativeAltPowerState = nil, nil
    if not frame then return false end
    if type(frame.SetAlpha) == "function" then frame:SetAlpha(state.alpha or 1) end
    if type(frame.EnableMouse) == "function" then frame:EnableMouse(state.mouse and true or false) end
    if not Adapter:RefreshNativeAltPower(frame) and state.shown then Adapter:Show(frame) end
    return true
end

function View:EnsureCelestialMover(module, profile)
    local mover = module.celestialMover
    if not mover then
        mover = module:CreateFrame("Frame", "RSExtraTools_CelestialBarMover", Adapter:GetRootFrame(), nil,
            CleanupFrame, "ExtraTools celestial mover")
        mover:SetFrameStrata(LAYOUT.lfgStrata)
        module.celestialMover = mover
    else
        ReownFrame(module, mover, "ExtraTools retained celestial mover")
    end
    mover:SetSize(profile.width, profile.height)
    mover:SetMovable(true)
    mover:EnableMouse(true)
    mover:RegisterForDrag("LeftButton")
    mover:SetPoint("TOP", Adapter:GetRootFrame(), "TOP", profile.x, profile.y)
    mover:SetScript("OnDragStart", function(owner) owner:StartMoving() end)
    mover:SetScript("OnDragStop", function(owner)
        owner:StopMovingOrSizing()
        local x, y = Adapter:GetFrameTopOffset(owner)
        if x then profile.x, profile.y = x, y end
        module:RefreshCelestialBar()
    end)
    return mover
end

ns.ExtraToolsView = View
