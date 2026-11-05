local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")) then
    return
end

local NativeBar = ns.ExperienceBarNativeBar
if type(NativeBar) ~= "table" then
    error("ExperienceBar NativeBar.lua must load before the Classic adapter", 2)
end

local Adapter = {
    family = "classic",
    nativeBar = NativeBar.New(),
}

local FEATURES = {
    questXP = true,
}

local MAX_LEVEL_BY_TOC_MAJOR = {
    [1] = 60,
    [2] = 70,
    [3] = 80,
    [4] = 85,
    [5] = 90,
}

local function SafeCall(callback, ...)
    if type(callback) ~= "function" then
        return nil
    end
    local ok, a, b, c, d, e, f, g, h = pcall(callback, ...)
    if not ok then
        return nil
    end
    return a, b, c, d, e, f, g, h
end

local function SafeNumber(callback, ...)
    local value = SafeCall(callback, ...)
    return tonumber(value) or 0
end

function Adapter:GetFeatures()
    return FEATURES
end

function Adapter:GetTocVersion()
    if type(_G.GetBuildInfo) ~= "function" then
        return 0
    end
    local tocVersion = select(4, _G.GetBuildInfo())
    return tonumber(tocVersion) or 0
end

function Adapter:GetMaxLevel()
    return MAX_LEVEL_BY_TOC_MAJOR[math.floor(self:GetTocVersion() / 10000)]
end

function Adapter:IsSupported()
    return self:GetMaxLevel() ~= nil
end

function Adapter:IsXPDisabled()
    return SafeCall(_G.IsXPUserDisabled) == true
end

function Adapter:GetPlayerState()
    local level = SafeNumber(_G.UnitLevel, "player")
    local maxXP = SafeNumber(_G.UnitXPMax, "player")
    local maxLevel = self:GetMaxLevel()
    local atEffectiveMax = false
    if type(_G.IsPlayerAtEffectiveMaxLevel) == "function" then
        atEffectiveMax = SafeCall(_G.IsPlayerAtEffectiveMaxLevel) == true
    elseif type(_G.GameRulesUtil) == "table"
        and type(_G.GameRulesUtil.IsPlayerAtEffectiveMaxLevel) == "function" then
        atEffectiveMax = SafeCall(_G.GameRulesUtil.IsPlayerAtEffectiveMaxLevel) == true
    end
    return {
        level = level,
        currentXP = SafeNumber(_G.UnitXP, "player"),
        maxXP = maxXP,
        restedXP = SafeNumber(_G.GetXPExhaustion),
        maxLevel = maxLevel,
        isMaxLevel = atEffectiveMax or (maxLevel and level >= maxLevel) or maxXP <= 0,
        isXPDisabled = self:IsXPDisabled(),
    }
end

local function IsQuestComplete(questID, titleComplete)
    local questLog = _G.C_QuestLog
    if questLog and type(questLog.ReadyForTurnIn) == "function"
        and SafeCall(questLog.ReadyForTurnIn, questID) == true then
        return true
    end
    if titleComplete == true or tonumber(titleComplete) == 1 then
        return true
    end
    if questLog and type(questLog.IsComplete) == "function" then
        return SafeCall(questLog.IsComplete, questID) == true
    end
    if type(_G.IsQuestComplete) == "function" then
        return SafeCall(_G.IsQuestComplete, questID) == true
    end
    return false
end

function Adapter:ScanQuestXP()
    local getCount = _G.GetNumQuestLogEntries
    local getTitle = _G.GetQuestLogTitle
    local getRewardXP = _G.GetQuestLogRewardXP
    local questLog = _G.C_QuestLog
    local getQuestID
    -- Forever uses the namespaced quest log. Keep the legacy pair for older
    -- Classic clients, and never mix an index count with a different reader.
    if type(getCount) ~= "function" or type(getTitle) ~= "function" then
        getCount = questLog and questLog.GetNumQuestLogEntries
        getQuestID = questLog and questLog.GetQuestIDForLogIndex
        if type(getQuestID) ~= "function" then return 0, 0 end
    end
    if type(getCount) ~= "function" or type(getRewardXP) ~= "function" then
        return 0, 0
    end

    local numEntries = SafeNumber(getCount)
    local completeXP = 0
    local incompleteXP = 0
    local index
    for index = 1, numEntries do
        local isHeader, isComplete, questID
        if getQuestID then
            -- Blizzard returns nil for headers; use shown entries, not numQuests.
            questID = SafeCall(getQuestID, index)
        else
            local title, level, tag, collapsed, suggestedGroup
            title, level, tag, isHeader, collapsed, isComplete, suggestedGroup, questID = SafeCall(getTitle, index)
        end
        questID = tonumber(questID) or 0
        if not isHeader and questID > 0 then
            local rewardXP = SafeNumber(getRewardXP, questID)
            if rewardXP > 0 then
                if IsQuestComplete(questID, isComplete) then
                    completeXP = completeXP + rewardXP
                else
                    incompleteXP = incompleteXP + rewardXP
                end
            end
        end
    end
    return completeXP, incompleteXP
end

function Adapter:SetNativeExperienceBarHidden(module, hidden)
    return self.nativeBar:SetHidden(module, hidden)
end

function Adapter:RestoreNativeExperienceBar(module)
    return self.nativeBar:Restore(module)
end

ns.ExperienceBarAdapter = Adapter
ns.ExperienceBarClassicAdapter = Adapter
