local _, RS = ...

local ClassicUI = RS.ClassicUI
if type(ClassicUI) ~= "table" then
    error("MoveNudge requires ClassicUI before it", 2)
end

ClassicUI.MoveNudgeLayout = {
    width = 240,
    height = 160,
    titleY = -10,
    anchorY = -34,
    xRowY = -58,
    yRowY = -88,
    inputWidth = 60,
    inputHeight = 22,
    arrowSize = 20,
    footerWidth = 100,
    footerHeight = 22,
}

local ANCHOR_POINT_LABELS = {
    CENTER = "中心",
    TOP = "上",
    BOTTOM = "下",
    LEFT = "左",
    RIGHT = "右",
    TOPLEFT = "左上",
    TOPRIGHT = "右上",
    BOTTOMLEFT = "左下",
    BOTTOMRIGHT = "右下",
}

local MoveNudge = {}
MoveNudge.__index = MoveNudge

local function IsFrameObject(frame)
    local objectType = type(frame)
    return (objectType == "table" or objectType == "userdata")
        and type(frame.IsShown) == "function"
end

local function GetFramePoint(self, target)
    if not target or type(target.GetPoint) ~= "function" then
        return "CENTER", self.parent, "CENTER", 0, 0
    end
    local point, relativeTo, relativePoint, x, y = target:GetPoint(1)
    return point or "CENTER", relativeTo or self.parent,
        relativePoint or point or "CENTER", tonumber(x) or 0, tonumber(y) or 0
end

local function OnRootDragStart(frame)
    local component = frame.__rsUIComponent
    local owner = component and component.moveNudgeOwner
    if owner and frame.StartMoving then frame:StartMoving() end
end

local function OnRootDragStop(frame)
    local component = frame.__rsUIComponent
    local owner = component and component.moveNudgeOwner
    if not owner then return end
    if frame.StopMovingOrSizing then frame:StopMovingOrSizing() end
    owner.userPositioned = true
end

local function OnControlAction(component)
    local owner = component and component.moveNudgeOwner
    if not owner then return end
    local action = component.moveNudgeAction
    if action == "apply" then
        owner:ApplyPosition()
    elseif action == "settings" then
        owner:OpenSettings()
    elseif action == "lock" then
        owner:Lock()
    elseif action == "nudge" then
        owner:Nudge(component.moveNudgeDX, component.moveNudgeDY)
    end
end

local function OnThemeChanged(owner)
    if owner:IsShown() then
        owner:RefreshTheme()
    else
        owner.themeDirty = true
    end
end

function MoveNudge:New(system, options)
    if type(system) ~= "table" or type(system.components) ~= "table" then
        error("MoveNudge requires an initialized RS.UI system", 2)
    end
    options = options or {}
    local instance = setmetatable({}, self)
    instance.system = system
    instance.components = system.components
    instance.theme = system.theme
    instance.parent = options.parent or _G.UIParent
    instance.layout = options.layout or ClassicUI.MoveNudgeLayout
    instance.inCombat = options.inCombat or _G.InCombatLockdown
    instance.print = options.print or RS.Print
    instance.getMainFrame = options.getMainFrame
    instance.onDefaultSettings = options.onDefaultSettings
    instance.onDefaultLock = options.onDefaultLock
    instance.target = nil
    instance.config = nil
    instance.root = nil
    instance.userPositioned = false
    instance.themeDirty = false
    instance.showCount = 0
    instance.applyCount = 0
    return instance
end

function MoveNudge:Print(message)
    if type(self.print) == "function" then self.print(message) end
end

function MoveNudge:IsInCombat()
    return type(self.inCombat) == "function" and self.inCombat() == true
end

function MoveNudge:CanApplyPosition()
    if self:IsInCombat() then
        self:Print("战斗中不能调整位置。")
        return false
    end
    local config = self.config
    if config and type(config.canApply) == "function" then
        local allowed, reason = config.canApply(self.target)
        if not allowed then
            if reason then self:Print(reason) end
            return false
        end
    end
    return true
end

function MoveNudge:GetPosition()
    local config = self.config
    if config and type(config.getPosition) == "function" then
        local x, y = config.getPosition(self.target)
        if x ~= nil or y ~= nil then
            return tonumber(x) or 0, tonumber(y) or 0
        end
    end
    local _, _, _, x, y = GetFramePoint(self, self.target)
    return x, y
end

function MoveNudge:GetAnchorDescription()
    local config = self.config
    if config and type(config.getAnchorLabel) == "function" then
        local label = config.getAnchorLabel(self.target)
        if label and label ~= "" then return "锚点自：" .. label end
    end

    local _, relativeTo, relativePoint = GetFramePoint(self, self.target)
    local source
    if relativeTo == self.parent then
        source = "屏幕"
    else
        local name = relativeTo and relativeTo.GetName and relativeTo:GetName()
        local lowerName = name and string.lower(name) or ""
        if relativeTo == _G.PlayerFrame or string.find(lowerName, "player", 1, true) then
            source = "玩家头像"
        else
            source = name or "其他框体"
        end
    end
    return "锚点自：" .. source .. (ANCHOR_POINT_LABELS[relativePoint] or relativePoint or "中心")
end

function MoveNudge:CreateControl(kind, parent, options, action)
    local control = self.components:Create(kind, parent, options)
    control.moveNudgeOwner = self
    control.moveNudgeAction = action
    if action then control:SetOnAction(OnControlAction) end
    return control
end

function MoveNudge:CreateArrow(text, x, y, dx, dy)
    local size = self.layout.arrowSize
    local button = self:CreateControl("button", self.root, {
        text = text,
        width = size,
        height = size,
        point = "TOPRIGHT",
        relativeTo = self.root,
        relativePoint = "TOPRIGHT",
        x = x,
        y = y,
        fontKey = "body",
    }, "nudge")
    button.moveNudgeDX = dx
    button.moveNudgeDY = dy
    self.arrows[#self.arrows + 1] = button
    return button
end

function MoveNudge:EnsureCreated()
    if self.root then return self.root end
    local layout = self.layout
    self.root = self:CreateControl("popup", self.parent, {
        width = layout.width,
        height = layout.height,
        hidden = true,
        backgroundToken = "color.window.background",
    })
    local frame = self.root.frame
    if frame.SetFrameStrata then frame:SetFrameStrata("MEDIUM") end
    if frame.SetFrameLevel then frame:SetFrameLevel(300) end
    if frame.SetClampedToScreen then frame:SetClampedToScreen(true) end
    if frame.EnableMouse then frame:EnableMouse(true) end
    if frame.SetMovable then frame:SetMovable(true) end
    if frame.RegisterForDrag then frame:RegisterForDrag("LeftButton") end
    frame:SetScript("OnDragStart", OnRootDragStart)
    frame:SetScript("OnDragStop", OnRootDragStop)

    self.title = self:CreateControl("label", self.root, {
        text = "坐标调整",
        width = 220,
        height = 24,
        point = "TOP",
        relativeTo = self.root,
        relativePoint = "TOP",
        y = layout.titleY,
        fontKey = "heading",
        textToken = "color.accent",
    })
    self.anchor = self:CreateControl("label", self.root, {
        text = "",
        width = 220,
        height = 18,
        point = "TOP",
        relativeTo = self.root,
        relativePoint = "TOP",
        y = layout.anchorY,
        fontKey = "body",
        textToken = "color.text.muted",
    })
    self.xLabel = self:CreateControl("label", self.root, {
        text = "X:", width = 28, height = layout.inputHeight,
        point = "TOPLEFT", relativeTo = self.root, relativePoint = "TOPLEFT",
        x = 20, y = layout.xRowY, fontKey = "heading", textToken = "color.accent",
    })
    self.yLabel = self:CreateControl("label", self.root, {
        text = "Y:", width = 28, height = layout.inputHeight,
        point = "TOPLEFT", relativeTo = self.root, relativePoint = "TOPLEFT",
        x = 20, y = layout.yRowY, fontKey = "heading", textToken = "color.accent",
    })
    self.xEdit = self:CreateControl("editbox", self.root, {
        width = layout.inputWidth, height = layout.inputHeight,
        point = "LEFT", relativeTo = self.xLabel, relativePoint = "RIGHT", x = 10,
    }, "apply")
    self.yEdit = self:CreateControl("editbox", self.root, {
        width = layout.inputWidth, height = layout.inputHeight,
        point = "LEFT", relativeTo = self.yLabel, relativePoint = "RIGHT", x = 10,
    }, "apply")
    if self.xEdit.frame.SetAutoFocus then self.xEdit.frame:SetAutoFocus(false) end
    if self.yEdit.frame.SetAutoFocus then self.yEdit.frame:SetAutoFocus(false) end
    if self.xEdit.frame.SetJustifyH then self.xEdit.frame:SetJustifyH("CENTER") end
    if self.yEdit.frame.SetJustifyH then self.yEdit.frame:SetJustifyH("CENTER") end

    self.arrows = {}
    self:CreateArrow("^", -50, -52, 0, 1)
    self:CreateArrow("v", -50, -94, 0, -1)
    self:CreateArrow("<", -76, -73, -1, 0)
    self:CreateArrow(">", -24, -73, 1, 0)

    self.settingsButton = self:CreateControl("button", self.root, {
        text = "设置", width = layout.footerWidth, height = layout.footerHeight,
        point = "BOTTOMLEFT", relativeTo = self.root, relativePoint = "BOTTOMLEFT",
        x = 10, y = 12, fontKey = "body",
    }, "settings")
    self.lockButton = self:CreateControl("button", self.root, {
        text = "锁定", width = layout.footerWidth, height = layout.footerHeight,
        point = "BOTTOMRIGHT", relativeTo = self.root, relativePoint = "BOTTOMRIGHT",
        x = -10, y = 12, fontKey = "body",
    }, "lock")

    if self.theme and type(self.theme.Subscribe) == "function" then
        self.theme:Subscribe(self, OnThemeChanged)
    end
    return self.root
end

function MoveNudge:RefreshTheme()
    if not self.root then return false end
    self.root:RefreshTheme()
    self.title:RefreshTheme()
    self.anchor:RefreshTheme()
    self.xLabel:RefreshTheme()
    self.yLabel:RefreshTheme()
    self.xEdit:RefreshTheme()
    self.yEdit:RefreshTheme()
    self.settingsButton:RefreshTheme()
    self.lockButton:RefreshTheme()
    local index = 1
    while index <= #self.arrows do
        self.arrows[index]:RefreshTheme()
        index = index + 1
    end
    self.themeDirty = false
    return true
end

function MoveNudge:Refresh(target)
    if not self.root then return false end
    if target and target ~= self.target then return false end
    local x, y = self:GetPosition()
    self.xEdit:SetValue(string.format("%.1f", x or 0), true)
    self.yEdit:SetValue(string.format("%.1f", y or 0), true)
    self.anchor:SetText(self:GetAnchorDescription())
    return true
end

function MoveNudge:ApplyPosition()
    if not self.target then return false end
    if not self:CanApplyPosition() then
        self:Refresh(self.target)
        return false
    end
    local x = tonumber(self.xEdit:GetValue()) or 0
    local y = tonumber(self.yEdit:GetValue()) or 0
    local config = self.config or {}
    if type(config.setPosition) == "function" then
        config.setPosition(x, y, self.target)
    else
        local point, relativeTo, relativePoint = GetFramePoint(self, self.target)
        if self.target.ClearAllPoints then self.target:ClearAllPoints() end
        if self.target.SetPoint then self.target:SetPoint(point, relativeTo, relativePoint, x, y) end
    end
    if type(config.savePosition) == "function" then config.savePosition(self.target) end
    if type(config.applyPosition) == "function" then config.applyPosition(self.target) end
    self.applyCount = self.applyCount + 1
    return true
end

function MoveNudge:Nudge(dx, dy)
    local x = tonumber(self.xEdit:GetValue()) or 0
    local y = tonumber(self.yEdit:GetValue()) or 0
    self.xEdit:SetValue(string.format("%.1f", x + (tonumber(dx) or 0)), true)
    self.yEdit:SetValue(string.format("%.1f", y + (tonumber(dy) or 0)), true)
    return self:ApplyPosition()
end

function MoveNudge:OpenSettings()
    local callback = self.config and self.config.onSettings
    if type(callback) == "function" then
        callback(self.target)
    elseif type(self.onDefaultSettings) == "function" then
        self.onDefaultSettings(self.target)
    end
    self:Hide()
end

function MoveNudge:Lock()
    local callback = self.config and self.config.onLock
    if type(callback) == "function" then
        callback(self.target)
    elseif type(self.onDefaultLock) == "function" then
        self.onDefaultLock(self.target)
    end
    self:Hide()
end

function MoveNudge:Show(target, config)
    if not target then return nil end
    if self:IsInCombat() then
        self:Print("战斗中不能调整位置。")
        return nil
    end
    self:EnsureCreated()
    self.target = target
    self.config = config or {}
    self.title:SetText(self.config.label or "坐标调整")
    if self.themeDirty then self:RefreshTheme() end
    if not self.userPositioned then
        self.root.frame:ClearAllPoints()
        local mainFrame = self.getMainFrame and self.getMainFrame()
        if IsFrameObject(mainFrame) and mainFrame:IsShown() then
            self.root.frame:SetPoint("BOTTOM", mainFrame, "TOP", 0, 2)
        else
            local height = self.parent and self.parent.GetHeight and self.parent:GetHeight() or 0
            local maxY = math.max((height / 2) - 100, 0)
            self.root.frame:SetPoint("CENTER", self.parent, "CENTER", 0, math.min(300, maxY))
        end
    end
    self:Refresh(target)
    self.root:SetVisible(true)
    self.showCount = self.showCount + 1
    return self.root.frame
end

function MoveNudge:Hide()
    if not self.root then return false end
    self.root:StopTemporaryWork()
    self.root:SetVisible(false)
    return true
end

function MoveNudge:IsShown()
    return self.root and self.root:IsVisible() or false
end

function MoveNudge:GetDiagnostics()
    return {
        built = self.root ~= nil,
        visible = self:IsShown(),
        shows = self.showCount,
        applies = self.applyCount,
    }
end

ClassicUI.MoveNudge = MoveNudge

local MoveOverlay = {
    created = 0,
}

local MOVE_OVERLAY_FONT = "Interface\\AddOns\\RurutiaSuite\\Media\\Fonts\\Rurutia.ttf"
local MOVE_OVERLAY_GREEN = { 0, 1, 0, 1 }

local function ResolveMoveOverlayColor(key, fallback)
    local system = RS.UISystem or (RS.UI and RS.UI.GetSystem and RS.UI:GetSystem())
    local theme = system and system.theme
    local color = theme and theme.Get and theme:Get(key)
    return type(color) == "table" and color or fallback
end

local function CanUseMoveOverlay(record)
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        if type(record.config.onBlocked) == "function" then record.config.onBlocked() end
        return false
    end
    if type(record.config.canInteract) == "function" then
        return record.config.canInteract(record.target) ~= false
    end
    return true
end

local function BindMoveOverlay(record)
    local overlay = record.overlay
    overlay:SetScript("OnDragStart", function()
        if not CanUseMoveOverlay(record) then return end
        if type(record.config.onDragStart) == "function" then
            record.config.onDragStart(record.target)
        elseif record.target.StartMoving then
            record.target:StartMoving()
        end
        record.dragActive = true
        record.dragged = true
    end)
    overlay:SetScript("OnDragStop", function()
        if not record.dragActive then return end
        record.dragActive = false
        if record.target.StopMovingOrSizing then record.target:StopMovingOrSizing() end
        if type(record.config.onDragStop) == "function" then record.config.onDragStop(record.target) end
    end)
    overlay:SetScript("OnClick", function(_, button)
        if record.dragged then record.dragged = false return end
        if not CanUseMoveOverlay(record) then return end
        if button == "RightButton" then
            if type(record.config.onSettings) == "function" then record.config.onSettings(record.target) end
            return
        end
        if button == "LeftButton" and type(RS.ShowMoveNudgeFrame) == "function" then
            local nudgeConfig = record.config.nudgeConfig
            if type(nudgeConfig) == "function" then nudgeConfig = nudgeConfig(record.target) end
            if type(nudgeConfig) == "table" then RS:ShowMoveNudgeFrame(record.target, nudgeConfig) end
        end
    end)
end

function MoveOverlay:Refresh(record)
    if not (record and record.overlay) then return false end
    local config = record.config
    local overlay = record.overlay
    local borderColor = ResolveMoveOverlayColor("color.border", { 0, 0, 0, 1 })
    if overlay.SetBackdrop then
        overlay:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8" })
        overlay:SetBackdropColor(MOVE_OVERLAY_GREEN[1], MOVE_OVERLAY_GREEN[2], MOVE_OVERLAY_GREEN[3], tonumber(config.alpha) or 0.45)
        overlay:SetBackdropBorderColor(0, 0, 0, 0)
    end
    if RS.UI and RS.UI.PixelBorder then
        record.pixelBorder = record.pixelBorder or RS.UI.PixelBorder:Ensure(overlay)
        RS.UI.PixelBorder:Update(record.pixelBorder, borderColor, true)
    end
    if record.label then
        local fontPath = config.fontPath or MOVE_OVERLAY_FONT
        local fontSize = tonumber(config.fontSize) or 17
        local ok, applied = pcall(record.label.SetFont, record.label, fontPath, fontSize, "OUTLINE")
        if not ok or applied == false then
            local fallback = _G.STANDARD_TEXT_FONT or "Fonts\\FRIZQT__.TTF"
            ok, applied = pcall(record.label.SetFont, record.label, fallback, fontSize, "OUTLINE")
        end
        if not ok or applied == false then return false end
        -- WoW rejects SetText on a FontString that has not received a valid
        -- font yet. Keep this after SetFont; test mocks used to hide the bug.
        record.label:SetText(config.label or "移动模块")
        record.label:SetTextColor(1, 1, 1, 1)
        if record.label.SetShadowColor then record.label:SetShadowColor(0, 0, 0, 1) end
        if record.label.SetShadowOffset then record.label:SetShadowOffset(1, -1) end
    end
    if type(config.layout) == "function" then
        config.layout(overlay, record.target)
    else
        overlay:ClearAllPoints()
        overlay:SetAllPoints(record.target)
    end
    local targetLevel = record.target.GetFrameLevel and record.target:GetFrameLevel() or 0
    if overlay.SetFrameLevel then overlay:SetFrameLevel(targetLevel + (tonumber(config.frameLevelOffset) or 10)) end
    return true
end

function MoveOverlay:Ensure(target, config)
    if not target then return nil end
    config = config or {}
    local record = target.__rsMoveOverlayRecord
    if record then
        record.config = config
        BindMoveOverlay(record)
        if not self:Refresh(record) then return nil end
        return record.overlay, record
    end
    local create = config.createFrame
    local parent = config.parent or target
    local overlay
    if type(create) == "function" then
        overlay = create(parent)
    end
    if not overlay then return nil end

    record = { overlay = overlay, target = target, config = config, dragged = false, dragActive = false }
    target.__rsMoveOverlayRecord = record
    overlay.__rsMoveOverlayRecord = record
    if overlay.SetFrameStrata then overlay:SetFrameStrata("DIALOG") end
    if overlay.EnableMouse then overlay:EnableMouse(true) end
    if overlay.RegisterForClicks then overlay:RegisterForClicks("LeftButtonUp", "RightButtonUp") end
    if overlay.RegisterForDrag then overlay:RegisterForDrag("LeftButton") end
    record.label = overlay:CreateFontString(nil, "OVERLAY")
    record.label:SetPoint("CENTER", overlay, "CENTER", 0, 0)
    if record.label.SetJustifyH then record.label:SetJustifyH("CENTER") end
    if record.label.SetJustifyV then record.label:SetJustifyV("MIDDLE") end
    BindMoveOverlay(record)
    overlay:Hide()
    if not self:Refresh(record) then
        target.__rsMoveOverlayRecord = nil
        overlay.__rsMoveOverlayRecord = nil
        overlay:Hide()
        return nil
    end
    self.created = self.created + 1
    return overlay, record
end

function MoveOverlay:GetDiagnostics()
    return { created = self.created }
end

ClassicUI.MoveOverlay = MoveOverlay
RS.MoveOverlay = MoveOverlay
