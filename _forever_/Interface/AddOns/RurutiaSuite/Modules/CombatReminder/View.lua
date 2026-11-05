local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("CombatReminder")) then return end

local View = {}
View.__index = View

local function Call(target, method, ...)
    local callback = target and target[method]
    if type(callback) == "function" then return callback(target, ...) end
    return nil
end

local function Hide(frame)
    Call(frame, "Hide")
end

function View:New(module, adapter)
    return setmetatable({
        module = module,
        adapter = adapter,
        ownedFrames = {},
        ownershipActive = false,
        builds = 0,
        alertShows = 0,
        timerRefreshes = 0,
    }, self)
end

function View:Track(frame)
    self.ownedFrames[#self.ownedFrames + 1] = frame
    self.ownershipActive = true
    return frame
end

function View:AcquireOwnership()
    if self.ownershipActive then return true end
    local index
    for index = 1, #self.ownedFrames do
        self.module:OwnFrame(self.ownedFrames[index], Hide, "CombatReminder retained frame")
    end
    self.ownershipActive = true
    return true
end

function View:ReleaseOwnership()
    if not self.ownershipActive then return false end
    local index
    for index = 1, #self.ownedFrames do self.module:ReleaseFrame(self.ownedFrames[index]) end
    self.ownershipActive = false
    return true
end

function View:CreateTextFrame(template, frameStrata)
    local frame = self:Track(self.module:CreateFrame(
        "Frame", nil, self.adapter:GetRootFrame(), nil, Hide, "CombatReminder text frame"
    ))
    Call(frame, "SetFrameStrata", frameStrata)
    Call(frame, "SetMovable", true)
    Call(frame, "SetClampedToScreen", true)
    Call(frame, "EnableMouse", false)
    local text = Call(frame, "CreateFontString", nil, "OVERLAY", template)
    Call(text, "SetPoint", "CENTER")
    Hide(frame)
    return frame, text
end

function View:EnsureAlert()
    if self.alertFrame then self:AcquireOwnership() return self.alertFrame end
    self.alertFrame, self.alertText = self:CreateTextFrame("GameFontNormalHuge", "HIGH")
    self.builds = self.builds + 1
    return self.alertFrame
end

function View:EnsureTimer()
    if self.timerFrame then self:AcquireOwnership() return self.timerFrame end
    self.timerFrame, self.timerText = self:CreateTextFrame("GameFontNormalLarge", "HIGH")
    Call(self.timerText, "SetTextColor", 1, 1, 1)
    Call(self.timerText, "SetText", "00:00")
    self.builds = self.builds + 1
    return self.timerFrame
end

function View:SizeToText(frame, text)
    local width = tonumber(Call(text, "GetStringWidth")) or 0
    local height = tonumber(Call(text, "GetStringHeight")) or 0
    Call(frame, "SetSize", width + 20, height + 20)
end

local function FrameIsVisible(frame)
    if not frame then return false end
    if type(frame.IsShown) == "function" then return frame:IsShown() end
    return frame.shown == true
end

function View:ApplyAlert(profile)
    self:EnsureAlert()
    local strata = self.module.previewMode and "FULLSCREEN_DIALOG" or profile.frameStrata or "HIGH"
    if Call(self.alertFrame, "GetFrameStrata") ~= strata then
        Call(self.alertFrame, "SetFrameStrata", strata)
    end
    self.adapter:ApplyFont(self.alertText, self.adapter:GetAlertFontPath(), profile.fontSize, "OUTLINE")
    Call(self.alertFrame, "ClearAllPoints")
    Call(self.alertFrame, "SetPoint", "CENTER", self.adapter:GetRootFrame(), "CENTER", profile.x, profile.y)
    self:SizeToText(self.alertFrame, self.alertText)
    return true
end

function View:ApplyTimer(profile)
    self:EnsureTimer()
    local strata = self.module.previewMode and "FULLSCREEN_DIALOG" or profile.frameStrata or "HIGH"
    if Call(self.timerFrame, "GetFrameStrata") ~= strata then
        Call(self.timerFrame, "SetFrameStrata", strata)
    end
    self.adapter:ApplyFont(self.timerText, self.adapter:GetTimerFontPath(), profile.fontSize, "OUTLINE")
    Call(self.timerFrame, "ClearAllPoints")
    if self.adapter.ApplyTimerAnchor then
        self.adapter:ApplyTimerAnchor(self.timerFrame, profile)
    else
        Call(self.timerFrame, "SetPoint", "CENTER", self.adapter:GetRootFrame(), "CENTER", profile.x, profile.y)
    end
    self:SizeToText(self.timerFrame, self.timerText)
    self:_CacheTimerAnchorTarget(profile)
    return true
end

function View:_GetTimerAnchorTarget(profile)
    if self.adapter.GetTimerAnchorTarget then
        return self.adapter:GetTimerAnchorTarget(profile)
    end
    return self.adapter:GetRootFrame()
end

function View:_CacheTimerAnchorTarget(profile)
    self.lastTimerAnchorTarget = self:_GetTimerAnchorTarget(profile)
end

function View:ApplyTimerAnchorOnly(profile)
    if not self.timerFrame then return false end
    Call(self.timerFrame, "ClearAllPoints")
    if self.adapter.ApplyTimerAnchor then
        self.adapter:ApplyTimerAnchor(self.timerFrame, profile)
    else
        Call(self.timerFrame, "SetPoint", "CENTER", self.adapter:GetRootFrame(), "CENTER", profile.x, profile.y)
    end
    self:_CacheTimerAnchorTarget(profile)
    return true
end

function View:ShowAlert(message, r, g, b, profile)
    self:ApplyAlert(profile)
    Call(self.alertText, "SetText", message or "")
    Call(self.alertText, "SetTextColor", r or 1, g or 1, b or 1)
    self:SizeToText(self.alertFrame, self.alertText)
    Call(self.alertFrame, "Show")
    self.alertShows = self.alertShows + 1
    return true
end

function View:HideAlert()
    if not self.alertFrame then return false end
    Hide(self.alertFrame)
    return true
end

function View:SetTimer(text, shown, profile)
    if not shown then
        if self.timerFrame then Hide(self.timerFrame) end
        return false
    end
    local isVisible = FrameIsVisible(self.timerFrame)
    local current = self.timerText and Call(self.timerText, "GetText")
    local target = self:_GetTimerAnchorTarget(profile)
    local targetChanged = self.timerFrame and target ~= self.lastTimerAnchorTarget

    if not self.timerFrame then
        self:ApplyTimer(profile)
    elseif not isVisible or targetChanged then
        if not isVisible then
            self:ApplyTimer(profile)
        else
            self:ApplyTimerAnchorOnly(profile)
        end
    end
    if current ~= text then
        Call(self.timerText, "SetText", text)
        self:SizeToText(self.timerFrame, self.timerText)
    end
    if not isVisible then Call(self.timerFrame, "Show") end
    self.timerRefreshes = self.timerRefreshes + 1
    return true
end

function View:GetCenterOffset(frame)
    local root = self.adapter:GetRootFrame()
    local x, y = Call(frame, "GetCenter")
    local rootX, rootY = Call(root, "GetCenter")
    if not x or not y or not rootX or not rootY then return 0, 0 end
    return x - rootX, y - rootY
end

function View:EnsureOverlay(kind, profile)
    local frame = kind == "alert" and self:EnsureAlert() or self:EnsureTimer()
    local key = kind .. "Overlay"
    if self[key] then self:AcquireOwnership() end
    local service = ns.MoveOverlay
    if type(service) ~= "table" then return nil end
    self.nudgeConfigs = self.nudgeConfigs or {}
    if not self.nudgeConfigs[kind] then
        local owner = self
        self.nudgeConfigs[kind] = {
            label = kind == "alert" and "进出战斗提醒" or "战斗计时器",
            getPosition = function()
                local target = owner.module:GetProfile()[kind]
                return target.x, target.y
            end,
            setPosition = function(x, y)
                local target = owner.module:GetProfile()[kind]
                target.x, target.y = tonumber(x) or 0, tonumber(y) or 0
            end,
            applyPosition = function()
                local target = owner.module:GetProfile()[kind]
                if kind == "alert" then return owner:ApplyAlert(target) end
                return owner:ApplyTimer(target)
            end,
            onSettings = function() return owner.module:OpenSettings() end,
            onLock = function()
                if type(ns.SetRsMoveMode) == "function" then return ns:SetRsMoveMode(false) end
                return owner.module:SetUnlocked(false)
            end,
        }
    end
    local overlay = service:Ensure(frame, {
        label = kind == "alert" and "进出战斗提醒" or "战斗计时器",
        createFrame = function(parent)
            return self:Track(self.module:CreateFrame(
                "Button", nil, parent, "BackdropTemplate", Hide, "CombatReminder " .. kind .. " overlay"
            ))
        end,
        canInteract = function() return not self.adapter:IsInCombatLockdown() end,
        onDragStop = function() self.module:CommitPosition(kind) end,
        onSettings = function() return self.module:OpenSettings() end,
        nudgeConfig = self.nudgeConfigs[kind],
    })
    self[key] = overlay
    return overlay
end

function View:SetUnlocked(unlocked, alertProfile, timerProfile)
    if self.adapter:IsInCombatLockdown() then return false end
    if unlocked then
        if alertProfile.enabled then
            self:ShowAlert("进入战斗", 1, 1, 0, alertProfile)
            Call(self:EnsureOverlay("alert", alertProfile), "Show")
        elseif self.alertOverlay then Hide(self.alertOverlay) end
        if timerProfile.enabled then
            self:SetTimer("00:00", true, timerProfile)
            Call(self:EnsureOverlay("timer", timerProfile), "Show")
        elseif self.timerOverlay then Hide(self.timerOverlay) end
    else
        if self.alertOverlay then Hide(self.alertOverlay) end
        if self.timerOverlay then Hide(self.timerOverlay) end
        self:HideAlert()
    end
    return true
end

function View:HideAll()
    local index
    for index = 1, #self.ownedFrames do Hide(self.ownedFrames[index]) end
    return true
end

function View:GetDiagnostics()
    return {
        builds = self.builds,
        alertCreated = self.alertFrame ~= nil,
        timerCreated = self.timerFrame ~= nil,
        overlaysCreated = (self.alertOverlay and 1 or 0) + (self.timerOverlay and 1 or 0),
        ownershipActive = self.ownershipActive,
        ownedFrames = #self.ownedFrames,
        alertShows = self.alertShows,
        timerRefreshes = self.timerRefreshes,
    }
end

ns.CombatReminderViewClass = View
