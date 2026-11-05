local _, ns = ...

local Data = ns.ExperienceBarData
local Adapter = ns.ExperienceBarAdapter
local View = ns.ExperienceBarView
if type(Data) ~= "table" or type(Adapter) ~= "table" or type(View) ~= "table" then
    error("ExperienceBar requires Data, active Build Adapter, and View before Core", 2)
end

local features = Adapter:GetFeatures()
local defaults = Data.CreateDefaults(features)
local Definition = {
    defaults = defaults,
    defaultEnabled = true,
}

local max = math.max
local min = math.min
local now = _G.time or os.time

local function Clamp(value, low, high, fallback)
    value = tonumber(value) or fallback
    return min(high, max(low, value))
end

local function CopyInto(target, source)
    local key
    local value
    for key in pairs(target) do
        target[key] = nil
    end
    for key, value in pairs(source) do
        target[key] = Data.Copy(value)
    end
end

local function OnFontChanged(owner, _, role)
    if role == "experienceBar" and (owner.runtimeActive or owner.previewMode) then
        owner:ApplyAppearance()
    end
end

function Definition:GetProfile()
    return self.db and self.db.profile
end

function Definition:GetSession(create)
    local char = self.db and self.db.char
    if not char then return nil end
    local session = rawget(char, "session")
    if not session and create then
        session = Data.Copy(defaults.char.session)
        rawset(char, "session", session)
    end
    return session
end

function Definition:ClearInactiveSession(playerState)
    -- A missing XP maximum during login is not proof of a capped character.
    local capped = playerState.level and playerState.level > 0
        and playerState.maxLevel and playerState.level >= playerState.maxLevel
    if not capped and not playerState.isXPDisabled then return false end
    if self.db and self.db.char then rawset(self.db.char, "session", nil) end
    return true
end

function Definition:SanitizeProfile()
    local profile = self:GetProfile()
    if not profile then
        return
    end

    Data.MigrateLegacyProfile(profile)

    local layout = Data.layout
    profile.x = tonumber(profile.x) or layout.defaultX
    profile.y = tonumber(profile.y) or layout.defaultY
    profile.width = Clamp(profile.width, layout.minWidth, layout.maxWidth, layout.defaultWidth)
    profile.height = Clamp(profile.height, layout.minHeight, layout.maxHeight, layout.defaultHeight)
    profile.textScale = Clamp(profile.textScale, layout.minTextScale, layout.maxTextScale, 1)
    profile.alpha = Clamp(profile.alpha, 0.2, 1, 1)
    profile.colors = type(profile.colors) == "table" and profile.colors or {}

    local key
    local defaultColor
    for key, defaultColor in pairs(defaults.profile.colors) do
        if type(profile.colors[key]) ~= "table" then
            profile.colors[key] = Data.Copy(defaultColor)
        end
        local index
        for index = 1, 4 do
            profile.colors[key][index] = Clamp(
                profile.colors[key][index],
                0,
                1,
                defaultColor[index]
            )
        end
    end
end

function Definition:ResetSession(force, playerState)
    playerState = playerState or Adapter:GetPlayerState()
    if self:ClearInactiveSession(playerState) then return end
    if (tonumber(playerState.level) or 0) <= 0 or (tonumber(playerState.maxXP) or 0) <= 0 then return end
    local session = self:GetSession(true)
    if not session then
        return
    end
    local timestamp = now()
    if force then
        session.gainedXP = 0
        session.startTime = timestamp
        session.totalPlayed = 0
        session.levelPlayed = 0
        session.playedAt = 0
    end
    session.lastXP = playerState.currentXP
    session.lastXPMax = playerState.maxXP
    if not session.startTime or session.startTime <= 0 then
        session.startTime = timestamp
    end
end

function Definition:Initialize()
    self.adapter = Adapter
    self.features = features
    self.supported = Adapter:IsSupported()
    self.completeQuestXP = 0
    self.incompleteQuestXP = 0
    self.previewMode = false
    self.isUnlocked = false
    self.runtimeActive = false
    self.runtimeState = "initialized"
    self.view = View.New(self, features)
    self:SanitizeProfile()
    self:ClearInactiveSession(Adapter:GetPlayerState())

    if ns.Font and type(ns.Font.Subscribe) == "function" then
        ns.Font:Subscribe(self, OnFontChanged)
    end

    if ns.ExperienceBarSettings and type(ns.ExperienceBarSettings.Register) == "function" then
        ns.ExperienceBarSettings:Register(self, Data, features)
    end
end

function Definition:ProfileChanged()
    self:SanitizeProfile()
    self:ClearInactiveSession(Adapter:GetPlayerState())
    if self.runtimeActive then self:ResetSession(false) end
end

function Definition:RegisterRuntimeEvents()
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.PLAYER_ENTERING_WORLD)
    self:RegisterEvent("PLAYER_XP_UPDATE", self.PLAYER_XP_UPDATE)
    self:RegisterEvent("PLAYER_LEVEL_UP", self.PLAYER_LEVEL_UP)
    self:RegisterEvent("UPDATE_EXHAUSTION", self.UPDATE_EXHAUSTION)
    self:RegisterEvent("ENABLE_XP_GAIN", self.ENABLE_XP_GAIN)
    self:RegisterEvent("DISABLE_XP_GAIN", self.DISABLE_XP_GAIN)
    self:RegisterEvent("TIME_PLAYED_MSG", self.TIME_PLAYED_MSG)
    if self:ShouldScanQuestXP() then
        self:RegisterEvent("QUEST_LOG_UPDATE", self.QUEST_LOG_UPDATE)
        if self.features.questMutationEvents then
            self:RegisterEvent("QUEST_ACCEPTED", self.QUEST_ACCEPTED)
            self:RegisterEvent("QUEST_REMOVED", self.QUEST_REMOVED)
            self:RegisterEvent("QUEST_TURNED_IN", self.QUEST_TURNED_IN)
        else
            self:RegisterEvent("UNIT_QUEST_LOG_CHANGED", self.UNIT_QUEST_LOG_CHANGED)
        end
    end
end

function Definition:CancelMinuteTicker()
    if self.minuteTicker then
        self.minuteTicker:Cancel()
        self.minuteTicker = nil
    end
end

function Definition:CancelQuestScan()
    if self.questScanHandle then
        self.questScanHandle:Cancel()
        self.questScanHandle = nil
    end
end

function Definition:SetQuestTracking(enabled)
    self:GetProfile().trackCompletedQuestXP = enabled and true or false
    self:CancelQuestScan()
    self.completeQuestXP, self.incompleteQuestXP = 0, 0
    if self.runtimeActive then
        -- 仅在设置切换时重新订阅；停用任务统计不影响经验条本身。
        self:UnregisterAllEvents()
        self:RegisterRuntimeEvents()
        self:QueueQuestScan(0)
    end
    self:UpdateDisplay()
end

function Definition:EnterDormantState(playerState)
    playerState = playerState or Adapter:GetPlayerState()
    -- Entry is reached only after the player state or level-up event confirms
    -- dormancy. Other characters and profile settings remain untouched.
    self:ClearInactiveSession(playerState)
    self.runtimeActive = false
    self.runtimeState = playerState.isMaxLevel and "max_level" or "xp_disabled"
    self:UnregisterAllEvents()
    self:CancelMinuteTicker()
    self:CancelQuestScan()
    Adapter:RestoreNativeExperienceBar(self)
    self.isUnlocked = false
    self.view:SetUnlocked(false)
    self.view:Hide()
    self.view:ReleaseOwnership()

    if not playerState.isMaxLevel and playerState.isXPDisabled then
        self:RegisterEvent("ENABLE_XP_GAIN", self.ENABLE_XP_GAIN)
    end
end

function Definition:ActivateRuntime(playerState)
    playerState = playerState or Adapter:GetPlayerState()
    -- Login may run before player XP is available. Zero XP maximum is not
    -- evidence of a capped character; keep the wake events until data arrives.
    if playerState.level <= 0 or (playerState.maxXP <= 0
        and not (playerState.maxLevel and playerState.level >= playerState.maxLevel)) then
        self.runtimeActive = false
        self.runtimeState = "waiting_player"
        self:UnregisterAllEvents()
        self:CancelMinuteTicker()
        self:CancelQuestScan()
        Adapter:RestoreNativeExperienceBar(self)
        self.view:Hide()
        self:RegisterEvent("PLAYER_ENTERING_WORLD", self.PLAYER_ENTERING_WORLD)
        self:RegisterEvent("PLAYER_XP_UPDATE", self.PLAYER_XP_UPDATE)
        return false
    end
    if playerState.isMaxLevel or playerState.isXPDisabled then
        self:EnterDormantState(playerState)
        return false
    end

    self:UnregisterAllEvents()
    self.runtimeActive = true
    self.runtimeState = "active"
    self:ResetSession(false, playerState)
    self:RegisterRuntimeEvents()
    self:EnsureFrame()
    if self.features.questXP then
        self:QueueQuestScan(0, playerState)
    end
    self:ApplyAllSettings(playerState)
    return true
end

function Definition:Enable()
    local profile = self:GetProfile()
    if not self.supported or not (profile and profile.enabled) then
        self.runtimeActive = false
        self.runtimeState = not self.supported and "unsupported" or "disabled"
        Adapter:RestoreNativeExperienceBar(self)
        if self.view then
            self.view:Hide()
        end
        return
    end
    self:ActivateRuntime(Adapter:GetPlayerState())
end

function Definition:Disable()
    self.runtimeActive = false
    self.runtimeState = "disabled"
    self.previewMode = false
    self.isUnlocked = false
    self:UnregisterAllEvents()
    self:CancelMinuteTicker()
    self:CancelQuestScan()
    Adapter:RestoreNativeExperienceBar(self)
    if self.view then
        self.view:SetUnlocked(false)
        self.view:Hide()
    end
end

function Definition:EnsureFrame()
    local frame = self.view:Ensure()
    self.frame = frame
    return frame
end

function Definition:ApplyAppearance()
    local profile = self:GetProfile()
    if profile and (self.runtimeActive or self.previewMode or self.isUnlocked) then
        self.view:ApplyAppearance(profile)
    end
end

function Definition:ApplyPosition()
    local profile = self:GetProfile()
    if profile and (self.runtimeActive or self.previewMode or self.isUnlocked) then
        self.view:ApplyPosition(profile)
    end
end

function Definition:SavePosition()
    local profile = self:GetProfile()
    return profile and self.view:SavePosition(profile) or false
end

function Definition:RefreshClamp()
    return self.view:RefreshClamp()
end

function Definition:GetElapsedTimes()
    local session = self:GetSession() or {}
    local timestamp = now()
    local sessionTime = max(0, timestamp - (session.startTime or timestamp))
    local levelTime = tonumber(session.levelPlayed) or 0
    if (session.playedAt or 0) > 0 then
        levelTime = levelTime + max(0, timestamp - session.playedAt)
    end
    return sessionTime, levelTime
end

function Definition:GetDisplayState(playerState)
    local showQuestXP = self.features.questXP and self:GetProfile().trackCompletedQuestXP ~= false
    if self.previewMode or self.isUnlocked then
        return {
            level = Adapter:GetMaxLevel() and Adapter:GetMaxLevel() - 3 or 77,
            currentXP = 48000,
            maxXP = 100000,
            restedXP = 22000,
            completeXP = showQuestXP and 12000 or nil,
            incompleteXP = showQuestXP and self.features.incompleteQuestXP ~= false
                and 9000 or nil,
            gainedXP = 18000,
            sessionTime = 3600,
            levelTime = 5400,
            isMaxLevel = false,
            isXPDisabled = false,
        }
    end

    playerState = playerState or Adapter:GetPlayerState()
    local session = self:GetSession() or {}
    local sessionTime, levelTime = self:GetElapsedTimes()
    return {
        level = playerState.level,
        currentXP = playerState.currentXP,
        maxXP = playerState.maxXP,
        restedXP = playerState.restedXP,
        completeXP = showQuestXP and (self.completeQuestXP or 0) or nil,
        incompleteXP = showQuestXP and self.features.incompleteQuestXP ~= false
            and (self.incompleteQuestXP or 0) or nil,
        gainedXP = session.gainedXP or 0,
        sessionTime = sessionTime,
        levelTime = levelTime,
        isMaxLevel = playerState.isMaxLevel,
        isXPDisabled = playerState.isXPDisabled,
    }
end

function Definition:ShouldShow(state)
    local profile = self:GetProfile()
    if self.previewMode or self.isUnlocked then
        return true
    end
    if not (self.supported and profile and profile.enabled) then
        return false
    end
    return not state.isXPDisabled and not state.isMaxLevel
end

function Definition:UpdateDisplay(playerState)
    if not (self.runtimeActive or self.previewMode or self.isUnlocked) then
        if self.view then
            self.view:Hide()
        end
        Adapter:RestoreNativeExperienceBar(self)
        return false
    end

    local profile = self:GetProfile()
    local state = self:GetDisplayState(playerState)
    local shouldShow = self:ShouldShow(state)
    self.view:Render(state, profile, shouldShow)
    Adapter:SetNativeExperienceBarHidden(
        self,
        self.runtimeActive and profile.enabled and profile.hideNativeExperienceBar
    )
    if shouldShow then
        self:SyncMinuteTicker(state)
    else
        self:CancelMinuteTicker()
    end
    return shouldShow
end

function Definition:OnMinuteTick()
    self:UpdateDisplay()
end

function Definition:SyncMinuteTicker(state)
    local profile = self:GetProfile()
    local frame = self.frame
    local needsTicker = self.runtimeActive
        and frame
        and frame:IsShown()
        and not (state and state.isMaxLevel)
        and (profile.showXPPerHour or profile.showLevelTime or profile.showSessionTime)
    if needsTicker and not self.minuteTicker then
        self.minuteTicker = self:ScheduleRepeating(60, self.OnMinuteTick, "ExperienceBar minute refresh")
    elseif not needsTicker then
        self:CancelMinuteTicker()
    end
end

function Definition:ShouldScanQuestXP(playerState)
    local profile = self:GetProfile()
    if not (self.features.questXP and self.runtimeActive and self.supported
        and profile and profile.enabled and profile.trackCompletedQuestXP ~= false) then
        return false
    end
    playerState = playerState or Adapter:GetPlayerState()
    return not playerState.isXPDisabled and not playerState.isMaxLevel
end

function Definition:OnQuestScanDue()
    self.questScanHandle = nil
    self:ScanQuestXP()
end

function Definition:QueueQuestScan(delay, playerState)
    if not self:ShouldScanQuestXP(playerState) or self.questScanHandle then
        return false
    end
    self.questScanHandle = self:RequestRefresh(
        "experience-quest-scan",
        self.OnQuestScanDue,
        delay or 0.2
    )
    return true
end

function Definition:ScanQuestXP()
    if not self:ShouldScanQuestXP() then
        return false
    end
    self.completeQuestXP, self.incompleteQuestXP = Adapter:ScanQuestXP()
    self:RecordScan()
    self:UpdateDisplay()
    return true
end

function Definition:RequestPlayedTimeIfNeeded()
    local profile = self:GetProfile()
    if profile and profile.showLevelTime and type(_G.RequestTimePlayed) == "function" then
        pcall(_G.RequestTimePlayed)
    end
end

function Definition:TrackXP(playerState)
    local session = self:GetSession()
    if not session then
        return
    end
    playerState = playerState or Adapter:GetPlayerState()
    local currentXP = playerState.currentXP
    local maxXP = playerState.maxXP
    local lastXP = tonumber(session.lastXP) or currentXP
    local lastMax = tonumber(session.lastXPMax) or maxXP
    local gained = currentXP - lastXP
    if gained < 0 and lastMax > 0 then
        gained = lastMax - lastXP + currentXP
    end
    if gained > 0 then
        session.gainedXP = (session.gainedXP or 0) + gained
    end
    session.lastXP = currentXP
    session.lastXPMax = maxXP
end

function Definition:PLAYER_ENTERING_WORLD(_, isInitialLogin, isReloadingUi)
    local profile = self:GetProfile()
    local playerState = Adapter:GetPlayerState()
    if playerState.level <= 0 or (playerState.maxXP <= 0
        and not (playerState.maxLevel and playerState.level >= playerState.maxLevel)) then
        return self:ActivateRuntime(playerState)
    end
    self:ResetSession(isInitialLogin or (isReloadingUi and profile.resetSessionOnReload), playerState)
    if self.runtimeState == "waiting_player" then return self:ActivateRuntime(playerState) end
    if playerState.isMaxLevel or playerState.isXPDisabled then
        self:EnterDormantState(playerState)
        return
    end
    self:RequestPlayedTimeIfNeeded()
    if self.features.questXP then
        self:QueueQuestScan(0.2, playerState)
    end
    self:ApplyAllSettings(playerState)
end

function Definition:PLAYER_XP_UPDATE()
    local playerState = Adapter:GetPlayerState()
    if self.runtimeState == "waiting_player" then return self:ActivateRuntime(playerState) end
    self:TrackXP(playerState)
    self:UpdateDisplay(playerState)
end

function Definition:PLAYER_LEVEL_UP(_, level)
    local playerState = Adapter:GetPlayerState()
    local maxLevel = Adapter:GetMaxLevel()
    if maxLevel and tonumber(level) and tonumber(level) >= maxLevel then
        playerState.isMaxLevel = true
        playerState.level = tonumber(level)
    end
    self:TrackXP(playerState)
    local session = self:GetSession()
    if session then
        session.levelPlayed = 0
        session.playedAt = now()
    end
    if playerState.isMaxLevel then
        self:EnterDormantState(playerState)
        return
    end
    self:RequestPlayedTimeIfNeeded()
    self:UpdateDisplay(playerState)
end

function Definition:UPDATE_EXHAUSTION()
    self:UpdateDisplay()
end

function Definition:ENABLE_XP_GAIN()
    self:ActivateRuntime(Adapter:GetPlayerState())
end

function Definition:DISABLE_XP_GAIN()
    local playerState = Adapter:GetPlayerState()
    playerState.isXPDisabled = true
    self:EnterDormantState(playerState)
end

function Definition:QUEST_LOG_UPDATE()
    self:QueueQuestScan(0.2)
end

function Definition:UNIT_QUEST_LOG_CHANGED(_, unit)
    if unit == "player" then
        self:QueueQuestScan(0.2)
    end
end

function Definition:TIME_PLAYED_MSG(_, totalPlayed, levelPlayed)
    local session = self:GetSession()
    if not session then
        return
    end
    session.totalPlayed = tonumber(totalPlayed) or session.totalPlayed or 0
    session.levelPlayed = tonumber(levelPlayed) or session.levelPlayed or 0
    session.playedAt = now()
    self:UpdateDisplay()
end

function Definition:ApplyAllSettings(playerState)
    self:SanitizeProfile()
    if not self.previewMode then
        playerState = playerState or Adapter:GetPlayerState()
        if playerState.isMaxLevel or playerState.isXPDisabled then
            self:EnterDormantState(playerState)
            return false
        end
    end
    self:EnsureFrame()
    self:ApplyAppearance()
    self:ApplyPosition()
    self:UpdateDisplay(playerState)
    return true
end

function Definition:SetEnabled(enabled)
    local profile = self:GetProfile()
    profile.enabled = enabled and true or false
    if profile.enabled then
        if not self:IsEnabled() then
            self:Enable()
        end
        if not self.runtimeActive and not self.previewMode then
            self:ActivateRuntime(Adapter:GetPlayerState())
        else
            self:ApplyAllSettings()
        end
    else
        self:Disable()
    end
end

function Definition:ResetPosition()
    local profile = self:GetProfile()
    rawset(profile, "x", nil)
    rawset(profile, "y", nil)
    self:ApplyPosition()
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
end

function Definition:ResetDefaults()
    if self.db and type(self.db.ResetProfile) == "function" then self.db:ResetProfile() end
    self:SanitizeProfile()
    if not self:IsEnabled() then
        self:Enable()
    end
    if not self.runtimeActive then
        self:ActivateRuntime(Adapter:GetPlayerState())
    else
        self:ApplyAllSettings()
    end
    if self.db and type(self.db.PrepareForSave) == "function" then self.db:PrepareForSave() end
end

function Definition:SetPreview(enabled)
    enabled = enabled and true or false
    local profile = self:GetProfile()
    if enabled and not self:IsEnabled() then
        self:Enable()
    end
    self.previewMode = enabled
    if enabled then
        self:ApplyAllSettings()
    elseif self.runtimeActive then
        self:UpdateDisplay()
    else
        self.view:Hide()
        self.view:ReleaseOwnership()
        if profile and not profile.enabled and self:IsEnabled() then
            self:Disable()
        end
    end
end

function Definition:SetUnlocked(unlocked)
    if not self.supported then
        return false
    end
    self.isUnlocked = unlocked and true or false
    if self.isUnlocked then
        self:EnsureFrame()
        self:ApplyAppearance()
        self:ApplyPosition()
        self:UpdateDisplay()
    end
    self.view:SetUnlocked(self.isUnlocked)
    if not self.isUnlocked then
        if self.runtimeActive or self.previewMode then
            self:UpdateDisplay()
        else
            self.view:Hide()
        end
        self:RefreshClamp()
    end
    return true
end

function Definition:OpenSettings()
    if ns.UI and type(ns.UI.OpenMain) == "function" then
        return ns.UI:OpenMain("experience-bar")
    end
    return false
end

function Definition:GetViewSnapshot()
    return self.view and self.view:GetSnapshot() or nil
end

function Definition:QUEST_ACCEPTED()
    self:QueueQuestScan(0.1)
end

function Definition:QUEST_REMOVED()
    self:QueueQuestScan(0.1)
end

function Definition:QUEST_TURNED_IN()
    self:QueueQuestScan(0.1)
end

local module, reason = ns.RegisterModule("ExperienceBar", Definition)
if module then
    ns.ExperienceBar = module
    ns.ExperienceBarDefinition = Definition
else
    ns.ExperienceBarRegistrationError = reason
end
