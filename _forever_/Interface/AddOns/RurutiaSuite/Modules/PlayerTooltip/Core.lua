local _, ns = ...

local Data = ns.PlayerTooltipData
local Adapter = ns.PlayerTooltipAdapter
local Settings = ns.PlayerTooltipSettings
if type(Data) ~= "table" or type(Adapter) ~= "table" or type(Settings) ~= "table" then
    ns.PlayerTooltipUnavailableReason = "no active Retail PlayerTooltip adapter"
    return
end

local Definition = {
    defaultEnabled = true,
    defaults = Data.defaults,
}

local ACHIEVEMENT_SECTION_TITLE = "特殊成就"
local RAID_SECTION_TITLE = "团队副本"
local MYTHIC_SECTION_TITLE = "史诗钥石地下城"
local MYTHIC_SECTION_RIGHT = "分数 (层数)"
local KEYSTONE_LABELS = { "当前钥匙", "當前鑰匙", "钥匙", "鑰匙", "Keystone" }
-- 英文与旧中文仅用于识别第三方 Tooltip 文本；玩家可见文案统一使用“大秘境”。
local SCORE_LABELS = { "M+ Score", "Mythic Score", "M+ 总分", "大秘境总分", "史诗评分", "传说评分", "傳奇分數" }

local function HasText(lines, needle)
    if type(needle) ~= "string" then return false end
    local index
    for index = 1, #lines do
        local text = lines[index]
        if type(text) == "string" and string.find(text, needle, 1, true) then return true end
    end
    return false
end

local function HasAnyText(lines, needles)
    local index
    for index = 1, #needles do
        if HasText(lines, needles[index]) then return true end
    end
    return false
end

local function HasExactText(lines, needles)
    local lineIndex, needleIndex
    for lineIndex = 1, #lines do
        local text = lines[lineIndex]
        if type(text) == "string" then
            for needleIndex = 1, #needles do
                local needle = needles[needleIndex]
                if text == needle or text == needle .. ":" then return true end
            end
        end
    end
    return false
end

local function AddLine(operations, text, r, g, b)
    operations[#operations + 1] = { kind = "line", text = text, r = r, g = g, b = b }
end

local function AddDoubleLine(operations, left, right, lr, lg, lb, rr, rg, rb)
    operations[#operations + 1] = {
        kind = "double", left = left, right = right,
        lr = lr, lg = lg, lb = lb, rr = rr, rg = rg, rb = rb,
    }
end

local function CopyDefault(value)
    if type(value) ~= "table" then return value end
    local result = {}
    local key, child
    for key, child in pairs(value) do result[key] = CopyDefault(child) end
    return result
end

function Definition:GetProfile()
    return self.db and self.db.profile
end

function Definition:SanitizeProfile()
    local profile = self:GetProfile()
    if type(profile) ~= "table" then return false end
    local defaults = Data.defaults.profile
    if profile.compatibilityVersion ~= 2 then
        local legacyCoexistence = rawget(profile, "allowWithCompetingUI")
        if type(legacyCoexistence) == "boolean" then
            for _, option in ipairs(Data.compatibilityOptions) do
                if rawget(profile, option.key) == nil then profile[option.key] = not legacyCoexistence end
            end
        end
        profile.allowWithCompetingUI = nil
        -- Version 1 defaults were inherited through DB __index. Unset keys
        -- now inherit the corrected defaults; explicit choices remain intact.
        profile.compatibilityVersion = 2
    end
    local key, value
    for key, value in pairs(defaults) do
        if profile[key] == nil then profile[key] = CopyDefault(value) end
    end
    if Data.modifierLabels[profile.modifier] == nil then profile.modifier = "SHIFT" end
    return true
end

function Definition:GetDetectedCompetingUI()
    return self.detectedCompetingUI
end

local function NeedsKeystoneProvider(profile)
    return profile and (profile.showKeystone or profile.showScore) and true or false
end

function Definition:RefreshDetectedCompetingUI()
    self.detectedCompetingUI, self.compatibilityBlocker = Adapter:GetDetectedCompetingUI(self:GetProfile())
    return self.detectedCompetingUI
end

function Definition:GetCompatibilityBlocker()
    return self.compatibilityBlocker
end

function Definition:IsModifierActive()
    local profile = self:GetProfile()
    return profile and Adapter:IsModifierDown(profile.modifier) or false
end

function Definition:HasModifierGatedContent()
    local profile = self:GetProfile()
    return profile and (profile.showScore or profile.showRuns
        or profile.showRaids or profile.showLegendAchievement) or false
end

function Definition:IsLifecycleActive()
    local state = self:GetState()
    return state == "enabling" or state == "enabled"
end

function Definition:EnsureTooltipHook()
    if self.tooltipSubscription then return true end
    local token = Adapter:SubscribeTooltip(self, self.OnTooltipPostCall)
    if not token then return false end
    self.tooltipSubscription = token
    return true
end

function Definition:ReleaseTooltipHook()
    if not self.tooltipSubscription then return false end
    local token = self.tooltipSubscription
    self.tooltipSubscription = nil
    return Adapter:UnsubscribeTooltip(self, token)
end

function Definition:OnTooltipPostCall(tooltip, tooltipData)
    self:ProcessUnitTooltip(tooltip, tooltipData)
end

function Definition:OnRefreshRequested()
    if self.runtimeActive then Adapter:RefreshCurrentPlayerTooltip() end
end

function Definition:RequestTooltipRefresh()
    if not self.runtimeActive then return false end
    self:RequestRefresh("player-tooltip", self.OnRefreshRequested, 0)
    return true
end

function Definition:OnModifierStateChanged(_, key)
    local profile = self:GetProfile()
    if profile and Adapter:KeyMatchesModifier(key, profile.modifier) then
        self:RequestTooltipRefresh()
    end
end

function Definition:OnKeystoneDataChanged(key)
    local profile = self:GetProfile()
    if self.runtimeActive and NeedsKeystoneProvider(profile) then
        if key and not Adapter:CurrentTooltipMatchesKeystoneKey(key) then return end
        self:RequestTooltipRefresh()
    end
end

function Definition:OnKeystoneProviderEvent()
    local profile = self:GetProfile()
    if not (self.runtimeActive and NeedsKeystoneProvider(profile)) then return end
    Adapter:EnableKeystoneData(self, self.OnKeystoneDataChanged)
    Adapter:RequestKeystoneData()
end

function Definition:OnAddonLoaded(_, addonName)
    if addonName == "Blizzard_AchievementUI" then
        Adapter:EnsureAchievementFrameGuard()
    end

    if Adapter:ShouldReevaluateForAddon(addonName) then
        self:ApplyRuntimeSettings()
        return
    end
    local profile = self:GetProfile()
    if self.worldEntered and self.runtimeActive and NeedsKeystoneProvider(profile)
        and not Adapter:IsKeystoneProviderActive() then
        self:OnKeystoneProviderEvent()
    end
end

function Definition:OnPlayerEnteringWorld()
    self.worldEntered = true
    self:ApplyRuntimeSettings()
end

function Definition:OnInspectAchievementReady(_, guid)
    if Adapter:IsInCombatLockdown() then return end
    if Adapter:HandleInspectAchievementReady(guid)
        and self:IsModifierActive() and not self.processingTooltip then
        self:RequestTooltipRefresh()
    end
end

function Definition:OnPlayerRegenEnabled()
    Adapter:CancelRaidInspection()
end

function Definition:RefreshRuntimeRegistrations()
    self:UnregisterAllEvents()
    local profile = self:GetProfile()
    if not (self:IsLifecycleActive() and profile and profile.enabled) then
        Adapter:DisableKeystoneData(self)
        Adapter:CancelRaidInspection()
        return
    end

    if self:GetCompatibilityBlocker() then
        Adapter:DisableKeystoneData(self)
        Adapter:CancelRaidInspection()
        return
    end

    self:RegisterEvent("ADDON_LOADED", self.OnAddonLoaded)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", self.OnPlayerEnteringWorld)
    if not self.runtimeActive then
        Adapter:DisableKeystoneData(self)
        Adapter:CancelRaidInspection()
        return
    end
    if profile.modifier ~= "NONE" and self:HasModifierGatedContent() then
        self:RegisterEvent("MODIFIER_STATE_CHANGED", self.OnModifierStateChanged)
    end
    if profile.showRaids or profile.showLegendAchievement then
        self:RegisterEvent("INSPECT_ACHIEVEMENT_READY", self.OnInspectAchievementReady)
        self:RegisterEvent("PLAYER_REGEN_ENABLED", self.OnPlayerRegenEnabled)
    else
        Adapter:CancelRaidInspection()
    end
    if NeedsKeystoneProvider(profile) then
        local available = Adapter:EnableKeystoneData(self, self.OnKeystoneDataChanged)
        self:RegisterEvent("GROUP_ROSTER_UPDATE", self.OnKeystoneProviderEvent)
        if available then Adapter:RequestKeystoneData() end
    else
        Adapter:DisableKeystoneData(self)
    end
end

function Definition:ActivateRuntime()
    self.runtimeActive = true
    Adapter:EnsureAchievementFrameGuard()
    if self.worldEntered then self:EnsureTooltipHook() end
    self:RefreshRuntimeRegistrations()
    return true
end

function Definition:DeactivateRuntime()
    self.runtimeActive = false
    self:CancelRefresh("player-tooltip")
    self:ReleaseTooltipHook()
    Adapter:DisableKeystoneData(self)
    Adapter:ClearCaches()
    self:RefreshRuntimeRegistrations()
    return true
end

function Definition:ApplyRuntimeSettings()
    if not self:IsLifecycleActive() then return false end
    self:RefreshDetectedCompetingUI()
    local profile = self:GetProfile()
    if profile and profile.enabled and not self:GetCompatibilityBlocker() then
        self:ActivateRuntime()
        if self.worldEntered then self:RequestTooltipRefresh() end
    else
        self:DeactivateRuntime()
    end
    return true
end

function Definition:SetEnabled(enabled)
    local profile = self:GetProfile()
    if not profile then return false end
    profile.enabled = enabled == true
    return self:ApplyRuntimeSettings()
end

function Definition:SetModifier(modifier)
    local profile = self:GetProfile()
    if not profile then return false end
    profile.modifier = Data.modifierLabels[modifier] and modifier or "SHIFT"
    return self:ApplyRuntimeSettings()
end

function Definition:SetOption(key, enabled)
    local profile = self:GetProfile()
    if not profile or Data.defaults.profile[key] == nil then return false end
    profile[key] = enabled == true
    return self:ApplyRuntimeSettings()
end

function Definition:BuildTooltipOperations(profile, summary, keystone, raidSummary, lines)
    local operations = {}
    local modifierActive = Adapter:IsModifierDown(profile.modifier)
    local hasScore = modifierActive and profile.showScore and summary and summary.score
        and summary.score > 0 and not HasAnyText(lines, SCORE_LABELS)
    local hasRuns = false
    if modifierActive and profile.showRuns and summary and summary.runs then
        local index
        for index = 1, #summary.runs do
            if not HasText(lines, summary.runs[index].name) then hasRuns = true break end
        end
    end
    local hasKeystone = profile.showKeystone and keystone and keystone.verified
        and not HasExactText(lines, KEYSTONE_LABELS)
    local hasRaids = modifierActive and profile.showRaids and raidSummary
        and raidSummary.raids and #raidSummary.raids > 0
    local hasAchievement = modifierActive and profile.showLegendAchievement and raidSummary
        and raidSummary.legendAchievement
    if not (hasScore or hasRuns or hasKeystone or hasRaids or hasAchievement) then return operations end

    if hasScore then
        AddDoubleLine(operations, "史诗评分:", Adapter:ColorOverallScore(summary.score),
            1, .82, 0, 1, 1, 1)
    end
    if hasAchievement then
        local achievement = raidSummary.legendAchievement
        if not HasText(lines, ACHIEVEMENT_SECTION_TITLE) then
            AddLine(operations, " ")
            AddLine(operations, ACHIEVEMENT_SECTION_TITLE, 1, .82, 0)
        end
        if not HasText(lines, Data.seasonLegendAchievement.label) then
            local status = achievement.completed and (achievement.date or "已完成") or "|cff888888未完成|r"
            AddDoubleLine(operations, Data.seasonLegendAchievement.label, status, .6, .8, 1, 1, 1, 1)
        end
    end
    if hasRaids then
        if not HasText(lines, RAID_SECTION_TITLE) then
            AddLine(operations, " ")
            AddLine(operations, RAID_SECTION_TITLE, 1, .82, 0)
        end
        local raidIndex
        for raidIndex = 1, #raidSummary.raids do
            local raid = raidSummary.raids[raidIndex]
            if not HasText(lines, raid.name) then
                local parts = {}
                local progressIndex
                for progressIndex = 1, #raid.progress do
                    local entry = raid.progress[progressIndex]
                    local difficulty = Data.raidDifficulties[entry.difficulty]
                    if difficulty then
                        parts[#parts + 1] = string.format("|c%s%s %d/%d|r", difficulty.color,
                            difficulty.name, entry.killed, entry.total)
                    end
                end
                if #parts > 0 then
                    AddDoubleLine(operations, raid.name, table.concat(parts, "  "), .6, .8, 1, 1, 1, 1)
                end
            end
        end
    end
    if hasRuns then
        AddLine(operations, " ")
        if not HasText(lines, MYTHIC_SECTION_TITLE) then
            AddDoubleLine(operations, MYTHIC_SECTION_TITLE, MYTHIC_SECTION_RIGHT, 1, .82, 0, 1, .82, 0)
        end
        local index
        for index = 1, #summary.runs do
            local run = summary.runs[index]
            if not HasText(lines, run.name) then
                local levelColor = run.finishedSuccess and "|cffffffff" or "|cff888888"
                local levelText = levelColor .. string.format("%d", run.level) .. "|r"
                local scoreText = Adapter:ColorMapScore(run.score)
                AddDoubleLine(operations, run.name, string.format("%s (%s)", scoreText, levelText),
                    .6, .8, 1, 1, 1, 1)
            end
        end
    end
    if hasKeystone then
        AddLine(operations, " ")
        if keystone.level == 0 then
            AddDoubleLine(operations, "当前钥匙", "|cff888888无钥匙|r", 1, 1, 1, 1, 1, 1)
        else
            AddDoubleLine(operations, "当前钥匙",
                string.format("|cffa335ee%s (%d)|r", keystone.name, keystone.level), 1, 1, 1, 1, 1, 1)
        end
    end
    return operations
end

function Definition:ProcessUnitTooltip(tooltip, tooltipData)
    if not self.runtimeActive or Adapter:IsInCombatLockdown() then return false end
    if not Adapter:IsOwnedTooltip(tooltip) then return false end
    local profile = self:GetProfile()
    if not (profile and profile.enabled) then return false end
    local modifierActive = Adapter:IsModifierDown(profile.modifier)
    if not (modifierActive or profile.showKeystone) then return false end
    local guid, unit, playerKey = Adapter:ResolveTooltipPlayer(tooltip, tooltipData)
    if not guid then return false end
    local summary = modifierActive and (profile.showScore or profile.showRuns)
        and Adapter:GetMythicPlusSummary(unit, guid) or nil
    if not summary and modifierActive and profile.showScore then
        summary = Adapter:GetSharedMythicPlusSummary(playerKey)
    end
    local keystone = profile.showKeystone and Adapter:GetPlayerKeystone(unit, playerKey) or nil
    self.processingTooltip = true
    local needsProgression = modifierActive and (profile.showRaids or profile.showLegendAchievement)
    local raidSummary = needsProgression and Adapter:GetRaidProgress(unit, guid) or nil
    self.processingTooltip = false
    -- Adapter results are secret-safe. Keep data requests above this gate so
    -- asynchronous results can still trigger a later tooltip refresh.
    local hasMythic = modifierActive and summary and (
        profile.showScore and summary.score and summary.score > 0
        or profile.showRuns and summary.runs and #summary.runs > 0)
    local hasProgression = modifierActive and raidSummary and (
        profile.showRaids and raidSummary.raids and #raidSummary.raids > 0
        or profile.showLegendAchievement and raidSummary.legendAchievement)
    local hasKeystone = profile.showKeystone and keystone and keystone.verified
    if not (hasMythic or hasProgression or hasKeystone) then return false end
    local snapshot = Adapter:CaptureTooltip(tooltip)
    local operations = self:BuildTooltipOperations(profile, summary, keystone, raidSummary, snapshot.lines)
    if #operations == 0 then return false end
    Adapter:ApplyTooltipOperations(tooltip, operations, snapshot.font)
    return true
end

function Definition:Initialize()
    self.adapter = Adapter
    self.runtimeActive = false
    self.worldEntered = false
    self.processingTooltip = false
    self.detectedCompetingUI = nil
    self:SanitizeProfile()
    self:RefreshDetectedCompetingUI()
    Settings:Register(self, Data)
end

function Definition:ProfileChanged()
    self:SanitizeProfile()
end

function Definition:Enable()
    return self:ApplyRuntimeSettings()
end

function Definition:Disable()
    self.runtimeActive = false
    self:CancelRefresh("player-tooltip")
    self:ReleaseTooltipHook()
    Adapter:DisableKeystoneData(self)
    Adapter:ClearCaches()
    self:UnregisterAllEvents()
end

function Definition:GetDiagnostics()
    local info = Adapter:GetDiagnostics()
    return {
        runtimeActive = self.runtimeActive == true,
        tooltipHooked = self.tooltipSubscription ~= nil,
        worldEntered = self.worldEntered == true,
        modifier = self:GetProfile() and self:GetProfile().modifier or nil,
        compatibilityBlocker = self:GetCompatibilityBlocker(),
        summaryCacheEntries = info.summaryCacheEntries,
        raidCacheEntries = info.raidCacheEntries,
        raidInspectionPending = info.raidInspectionPending,
        keystoneCacheEntries = info.keystoneCacheEntries,
        keystoneProviderActive = info.keystoneProviderActive,
    }
end

local module, reason = ns.RegisterModule("PlayerTooltip", Definition)
if module then
    ns.PlayerTooltip = module
    ns.PlayerTooltipDefinition = Definition
else
    ns.PlayerTooltipRegistrationError = reason
end
