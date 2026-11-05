local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("CombatReminder")) then return end

local Adapter = ns.CombatReminderAdapter
local View = ns.CombatReminderViewClass
local Settings = ns.CombatReminderSettings
if type(Adapter) ~= "table" or type(View) ~= "table" or type(Settings) ~= "table" then
    error("CombatReminder requires client Adapter, View, and Settings before Core.lua", 2)
end

local Definition = {
    defaultEnabled = true,
    defaults = {
        profile = {
            alert = { enabled = true, duration = 2, x = 0, y = 100, fontSize = 24, frameStrata = "HIGH" },
            timer = { enabled = true, onlyInCombat = true, x = -190, y = -110, fontSize = 20, frameStrata = "HIGH" },
        },
    },
}

if Adapter.timerDefaults then
    for key, value in pairs(Adapter.timerDefaults) do Definition.defaults.profile.timer[key] = value end
end

local function Clamp(value, minimum, maximum, fallback)
    value = tonumber(value) or fallback
    return math.max(minimum, math.min(maximum, value))
end

local ALERT_STRATA = { LOW = true, MEDIUM = true, HIGH = true, DIALOG = true, FULLSCREEN = true, FULLSCREEN_DIALOG = true }
local function AlertStrata(value, fallback)
    return ALERT_STRATA[value] and value or fallback or "HIGH"
end

local function FormatTime(seconds)
    seconds = math.floor(math.max(tonumber(seconds) or 0, 0))
    return string.format("%02d:%02d", math.floor((seconds % 3600) / 60), seconds % 60)
end

local function OnFontChanged(owner, _, role)
    if owner:IsEnabled() and (role == "interface" or role == "combatTimer") then
        owner:ApplySharedFont(role)
    end
end

function Definition:GetProfile()
    return self.db and self.db.profile
end

function Definition:SanitizeProfile()
    local profile = self:GetProfile()
    profile.alert = type(profile.alert) == "table" and profile.alert or {}
    profile.timer = type(profile.timer) == "table" and profile.timer or {}
    local alert, timer = profile.alert, profile.timer
    if Adapter.MigrateTimerPosition then Adapter:MigrateTimerPosition(timer) end
    if alert.enabled == nil then alert.enabled = true end
    alert.duration = Clamp(alert.duration, 0.5, 10, 2)
    alert.x = Clamp(alert.x, -1000, 1000, 0)
    alert.y = Clamp(alert.y, -1000, 1000, 100)
    alert.fontSize = Clamp(alert.fontSize, 10, 60, 24)
    alert.frameStrata = AlertStrata(alert.frameStrata)
    if timer.enabled == nil then timer.enabled = true end
    if timer.onlyInCombat == nil then timer.onlyInCombat = true end
    timer.x = Clamp(timer.x, -1000, 1000, Definition.defaults.profile.timer.x)
    timer.y = Clamp(timer.y, -1000, 1000, Definition.defaults.profile.timer.y)
    timer.fontSize = Clamp(timer.fontSize, 10, 60, 20)
    timer.frameStrata = AlertStrata(timer.frameStrata, "HIGH")
end

function Definition:Initialize()
    self.adapter = Adapter
    self.view = View:New(self, Adapter)
    self.isUnlocked = false
    self.state = { showUntil = 0 }
    self:SanitizeProfile()
    if ns.Font and type(ns.Font.Subscribe) == "function" then ns.Font:Subscribe(self, OnFontChanged) end
    Settings:Register(self)
end

function Definition:ProfileChanged()
    self:SetPreview(false)
    self:SanitizeProfile()
end

function Definition:ResetRuntimeStateFromClient()
    local state = self.state
    state.combatStart = nil
    state.combatEnd = nil
    state.encounterStart = nil
    state.encounterEnd = nil
    state.showUntil = 0
    if Adapter:IsPlayerInCombat() then state.combatStart = Adapter:GetTime() end
    return true
end

function Definition:Enable()
    self:ResetRuntimeStateFromClient()
    self:RegisterEvent("PLAYER_REGEN_DISABLED", self.PLAYER_REGEN_DISABLED)
    self:RegisterEvent("PLAYER_REGEN_ENABLED", self.PLAYER_REGEN_ENABLED)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.PLAYER_ENTERING_WORLD)
    self:RegisterEvent("ENCOUNTER_START", self.ENCOUNTER_START)
    self:RegisterEvent("ENCOUNTER_END", self.ENCOUNTER_END)
end

function Definition:Disable()
    self:SetPreview(false)
    self:UnregisterAllEvents()
    self:StopTimerTicker()
    if self.alertHideHandle then self:CancelSchedule(self.alertHideHandle) self.alertHideHandle = nil end
    self.isUnlocked = false
    self.view:HideAll()
    self.view:ReleaseOwnership()
    self:ResetRuntimeStateFromClient()
end

function Definition:IsCombatActive()
    local state = self.state
    return (state.combatStart and not state.combatEnd)
        or (state.encounterStart and not state.encounterEnd) or false
end

function Definition:GetCurrentTimerSeconds()
    local state = self.state
    if state.encounterStart and not state.encounterEnd then return Adapter:GetTime() - state.encounterStart end
    if state.encounterStart and state.encounterEnd and state.combatStart
        and state.encounterEnd > state.combatStart then
        return state.encounterEnd - state.encounterStart
    end
    if state.combatStart and not state.combatEnd then return Adapter:GetTime() - state.combatStart end
    if state.combatStart and state.combatEnd then return state.combatEnd - state.combatStart end
    return 0
end

function Definition:ShouldShowTimer()
    local timer = self:GetProfile().timer
    if self.isUnlocked then return true end
    if not timer.enabled then return false end
    if self:IsCombatActive() then return true end
    return not timer.onlyInCombat and self.state.showUntil > Adapter:GetTime()
end

function Definition:OnTimerTick()
    self:UpdateTimerDisplay()
end

function Definition:StartTimerTicker()
    if self.timerTicker then return false end
    self.timerTicker = self:ScheduleRepeating(0.1, self.OnTimerTick, "CombatReminder visible timer")
    return true
end

function Definition:StopTimerTicker()
    if not self.timerTicker then return false end
    self:CancelSchedule(self.timerTicker)
    self.timerTicker = nil
    return true
end

function Definition:UpdateTimerDisplay()
    if self.previewMode then
        self:StopTimerTicker()
        return self.view:SetTimer("01:23", true, self:GetProfile().timer)
    end
    local shown = self:ShouldShowTimer()
    if shown then
        local timerProfile = self:GetProfile().timer
        self.view:SetTimer(FormatTime(self:GetCurrentTimerSeconds()), true, timerProfile)
        if not self.isUnlocked then self:StartTimerTicker() end
    else
        self.view:SetTimer("00:00", false, self:GetProfile().timer)
        self:StopTimerTicker()
    end
    return shown
end

function Definition:OnAlertHide()
    self.alertHideHandle = nil
    if not self.isUnlocked and not self.previewMode then self.view:HideAlert() end
end

function Definition:ShowAlert(message, r, g, b)
    local alert = self:GetProfile().alert
    if not alert.enabled then return false end
    if self.alertHideHandle then self:CancelSchedule(self.alertHideHandle) end
    self.view:ShowAlert(message, r, g, b, alert)
    self.alertHideHandle = self:Schedule(alert.duration, self.OnAlertHide, "CombatReminder alert hide")
    return true
end

function Definition:PLAYER_REGEN_DISABLED()
    self:SetPreview(false)
    local state = self.state
    state.combatStart = Adapter:GetTime()
    state.combatEnd = nil
    state.showUntil = 0
    self:ShowAlert("进入战斗", 1, 0.15, 0.15)
    self:UpdateTimerDisplay()
end

function Definition:PLAYER_REGEN_ENABLED()
    local state = self.state
    state.combatEnd = Adapter:GetTime()
    local profile = self:GetProfile()
    if profile.timer.enabled and not profile.timer.onlyInCombat then
        state.showUntil = Adapter:GetTime() + profile.alert.duration
    else
        state.showUntil = 0
    end
    self:ShowAlert("离开战斗", 0.2, 1, 0.2)
    self:UpdateTimerDisplay()
end

function Definition:PLAYER_ENTERING_WORLD()
    local state = self.state
    if Adapter:IsPlayerInCombat() then
        state.combatStart = Adapter:GetTime()
        state.combatEnd = nil
        state.showUntil = 0
    else
        state.combatStart = nil
        state.combatEnd = nil
        state.encounterStart = nil
        state.encounterEnd = nil
        state.showUntil = 0
    end
    self:UpdateTimerDisplay()
end

function Definition:ENCOUNTER_START()
    self:SetPreview(false)
    self.state.encounterStart = Adapter:GetTime()
    self.state.encounterEnd = nil
    self:UpdateTimerDisplay()
end

function Definition:ENCOUNTER_END()
    self.state.encounterEnd = Adapter:GetTime()
    self:UpdateTimerDisplay()
end

function Definition:GuardCombat()
    if not Adapter:IsInCombatLockdown() then return false end
    if type(ns.Print) == "function" then ns.Print("战斗中不可用，请脱战后修改。") end
    return true
end

function Definition:SetPreview(enabled)
    enabled = enabled == true
    if enabled and (self:GuardCombat() or not self:IsEnabled()) then return false end
    if self.previewMode == enabled or (not enabled and not self.previewMode) then return true end
    self.previewMode = enabled
    if enabled then
        if self.alertHideHandle then self:CancelSchedule(self.alertHideHandle) self.alertHideHandle = nil end
        self:StopTimerTicker()
        self.view:ShowAlert("进入战斗 · 预览", 1, 0.15, 0.15, self:GetProfile().alert)
        self.view:SetTimer("01:23", true, self:GetProfile().timer)
        self.previewAlertLevel = self.view.alertFrame.GetFrameLevel and self.view.alertFrame:GetFrameLevel()
        self.previewTimerLevel = self.view.timerFrame.GetFrameLevel and self.view.timerFrame:GetFrameLevel()
        self.view.alertFrame:SetFrameStrata("FULLSCREEN_DIALOG")
        self.view.timerFrame:SetFrameStrata("FULLSCREEN_DIALOG")
        if self.view.alertFrame.SetFrameLevel then self.view.alertFrame:SetFrameLevel(200) end
        if self.view.timerFrame.SetFrameLevel then self.view.timerFrame:SetFrameLevel(200) end
    else
        if self.view.alertFrame then self.view.alertFrame:SetFrameStrata(self:GetProfile().alert.frameStrata) end
        if self.view.timerFrame then self.view.timerFrame:SetFrameStrata(self:GetProfile().timer.frameStrata) end
        if self.previewAlertLevel then self.view.alertFrame:SetFrameLevel(self.previewAlertLevel) end
        if self.previewTimerLevel then self.view.timerFrame:SetFrameLevel(self.previewTimerLevel) end
        self.previewAlertLevel, self.previewTimerLevel = nil, nil
        self.view:HideAlert()
        if self.isUnlocked then self.view:SetUnlocked(true, self:GetProfile().alert, self:GetProfile().timer)
        else self:UpdateTimerDisplay() end
    end
    return true
end

function Definition:CommitPosition(kind)
    if self:GuardCombat() then return false end
    local frame = kind == "alert" and self.view.alertFrame or self.view.timerFrame
    local target = self:GetProfile()[kind]
    local x, y
    if kind == "timer" and Adapter.GetTimerPositionOffset then
        x, y = Adapter:GetTimerPositionOffset(frame, target)
    end
    if x == nil then x, y = self.view:GetCenterOffset(frame) end
    target.x, target.y = math.floor(x + 0.5), math.floor(y + 0.5)
    if kind == "alert" then self.view:ApplyAlert(target) else self.view:ApplyTimer(target) end
    return true
end

function Definition:SetUnlocked(unlocked)
    if self:GuardCombat() then return false end
    self.isUnlocked = unlocked and true or false
    self.view:SetUnlocked(self.isUnlocked, self:GetProfile().alert, self:GetProfile().timer)
    if not self.isUnlocked then self:UpdateTimerDisplay() else self:StopTimerTicker() end
    return true
end

function Definition:ToggleAnchor()
    return self:SetUnlocked(not self.isUnlocked)
end

function Definition:ResetPositions()
    if self:GuardCombat() then return false end
    local profile = self:GetProfile()
    rawset(profile.alert, "x", nil)
    rawset(profile.alert, "y", nil)
    rawset(profile.timer, "x", nil)
    rawset(profile.timer, "y", nil)
    rawset(profile.timer, "anchorToPlayer", nil)
    if self.view.alertFrame then self.view:ApplyAlert(profile.alert) end
    if self.view.timerFrame then self.view:ApplyTimer(profile.timer) end
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return true
end

function Definition:SetAlertEnabled(enabled) self:GetProfile().alert.enabled = enabled and true or false return true end
function Definition:SetAlertDuration(value) self:GetProfile().alert.duration = Clamp(value, 0.5, 10, 2) return true end
function Definition:SetAlertFrameStrata(value)
    self:GetProfile().alert.frameStrata = AlertStrata(value)
    if self.view.alertFrame then self.view:ApplyAlert(self:GetProfile().alert) end
    return true
end
function Definition:SetAlertFontSize(value)
    self:GetProfile().alert.fontSize = Clamp(value, 10, 60, 24)
    if self.view.alertFrame then self.view:ApplyAlert(self:GetProfile().alert) end
    return true
end
function Definition:SetAlertX(value)
    self:GetProfile().alert.x = Clamp(value, -1000, 1000, 0)
    if self.view.alertFrame then self.view:ApplyAlert(self:GetProfile().alert) end
    return true
end
function Definition:SetAlertY(value)
    self:GetProfile().alert.y = Clamp(value, -1000, 1000, 100)
    if self.view.alertFrame then self.view:ApplyAlert(self:GetProfile().alert) end
    return true
end
function Definition:SetTimerEnabled(enabled)
    self:GetProfile().timer.enabled = enabled and true or false
    return self:UpdateTimerDisplay()
end
function Definition:SetOnlyInCombat(enabled)
    self:GetProfile().timer.onlyInCombat = enabled and true or false
    return self:UpdateTimerDisplay()
end
function Definition:SetTimerFontSize(value)
    self:GetProfile().timer.fontSize = Clamp(value, 10, 60, 20)
    local profile = self:GetProfile().timer
    if self.view.timerFrame then self.view:ApplyTimer(profile) end
    return self:UpdateTimerDisplay()
end
function Definition:SetTimerFrameStrata(value)
    self:GetProfile().timer.frameStrata = AlertStrata(value, "HIGH")
    if self.view.timerFrame then self.view:ApplyTimer(self:GetProfile().timer) end
    return true
end
function Definition:SetTimerX(value)
    self:GetProfile().timer.x = Clamp(value, -1000, 1000, Definition.defaults.profile.timer.x)
    if self.view.timerFrame then self.view:ApplyTimer(self:GetProfile().timer) end
    return true
end
function Definition:SetTimerY(value)
    self:GetProfile().timer.y = Clamp(value, -1000, 1000, Definition.defaults.profile.timer.y)
    if self.view.timerFrame then self.view:ApplyTimer(self:GetProfile().timer) end
    return true
end

function Definition:ResetDefaults()
    if self:GuardCombat() then return false end
    if self.db and type(self.db.ResetProfile) == "function" then self.db:ResetProfile() end
    self:SanitizeProfile()
    self:StopTimerTicker()
    if self.alertHideHandle then self:CancelSchedule(self.alertHideHandle) self.alertHideHandle = nil end
    if self.previewMode then
        self.view:ShowAlert("进入战斗 · 预览", 1, 0.15, 0.15, self:GetProfile().alert)
        self.view:ApplyTimer(self:GetProfile().timer)
        self:UpdateTimerDisplay()
    elseif self.isUnlocked then
        self.view:SetUnlocked(true, self:GetProfile().alert, self:GetProfile().timer)
        self:StopTimerTicker()
    else
        if self.view.alertFrame then self.view:ApplyAlert(self:GetProfile().alert) self.view:HideAlert() end
        if self.view.timerFrame then self.view:ApplyTimer(self:GetProfile().timer) end
        self:UpdateTimerDisplay()
    end
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
    return true
end

function Definition:OpenSettings()
    return ns.UI and type(ns.UI.OpenMain) == "function" and ns.UI:OpenMain("combat") or false
end

function Definition:ApplySharedFont(role)
    local profile = self:GetProfile()
    if (role == nil or role == "interface") and self.view.alertFrame then
        self.view:ApplyAlert(profile.alert)
    end
    if (role == nil or role == "combatTimer") and self.view.timerFrame then
        self.view:ApplyTimer(profile.timer)
    end
end

function Definition:GetDiagnostics()
    return {
        unlocked = self.isUnlocked,
        timerTicker = self.timerTicker ~= nil,
        alertHidePending = self.alertHideHandle ~= nil,
        combatActive = self:IsCombatActive(),
        timerSeconds = self:GetCurrentTimerSeconds(),
        view = self.view:GetDiagnostics(),
    }
end

local module, reason = ns.RegisterModule("CombatReminder", Definition)
if module then
    ns.CombatReminder = module
    ns.CombatReminderDefinition = Definition
else
    ns.CombatReminderRegistrationError = reason
end
