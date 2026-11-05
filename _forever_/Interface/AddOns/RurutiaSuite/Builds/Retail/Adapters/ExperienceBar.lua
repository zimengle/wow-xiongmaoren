local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")) then
    return
end

local NativeBar = ns.ExperienceBarNativeBar
if type(NativeBar) ~= "table" then
    error("ExperienceBar NativeBar.lua must load before the Retail adapter", 2)
end

local Adapter = {
    family = "retail",
    nativeBar = NativeBar.New(),
}

local FEATURES = {
    questXP = true,
    incompleteQuestXP = false,
    questMutationEvents = true,
    hideEmptyQuestProjection = true,
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
    if type(_G.GetMaxLevelForPlayerExpansion) == "function" then
        local maxLevel = SafeNumber(_G.GetMaxLevelForPlayerExpansion)
        if maxLevel > 0 then
            return maxLevel
        end
    end
    if type(_G.GameRulesUtil) == "table"
        and type(_G.GameRulesUtil.GetEffectiveMaxLevelForPlayer) == "function" then
        local maxLevel = SafeNumber(_G.GameRulesUtil.GetEffectiveMaxLevelForPlayer)
        if maxLevel > 0 then
            return maxLevel
        end
    end
    if type(_G.IsPlayerAtEffectiveMaxLevel) == "function"
        and SafeCall(_G.IsPlayerAtEffectiveMaxLevel) == true then
        return SafeNumber(_G.UnitLevel, "player")
    end
    return nil
end

function Adapter:IsSupported()
    return self:GetTocVersion() >= 110000
end

function Adapter:IsXPDisabled()
    return SafeCall(_G.IsXPUserDisabled) == true
end

function Adapter:GetPlayerState()
    local maxXP = SafeNumber(_G.UnitXPMax, "player")
    local atMaxLevel = false
    if type(_G.GameRulesUtil) == "table"
        and type(_G.GameRulesUtil.IsPlayerAtEffectiveMaxLevel) == "function" then
        atMaxLevel = SafeCall(_G.GameRulesUtil.IsPlayerAtEffectiveMaxLevel) == true
    elseif type(_G.IsPlayerAtEffectiveMaxLevel) == "function" then
        atMaxLevel = SafeCall(_G.IsPlayerAtEffectiveMaxLevel) == true
    end
    return {
        level = SafeNumber(_G.UnitLevel, "player"),
        currentXP = SafeNumber(_G.UnitXP, "player"),
        maxXP = maxXP,
        restedXP = SafeNumber(_G.GetXPExhaustion),
        maxLevel = self:GetMaxLevel(),
        isMaxLevel = atMaxLevel or maxXP <= 0,
        isXPDisabled = self:IsXPDisabled(),
    }
end

function Adapter:GetQuestLogCounts()
    local questLog = _G.C_QuestLog
    local getCount = questLog and questLog.GetNumQuestLogEntries
    if type(getCount) ~= "function" then return 0, 0 end
    local shownEntries, questCount = SafeCall(getCount)
    return tonumber(shownEntries) or 0, tonumber(questCount) or 0
end

function Adapter:BuildQuestCache()
    local questLog = _G.C_QuestLog
    local getQuestID = questLog and questLog.GetQuestIDForLogIndex
    if type(getQuestID) ~= "function" then return {} end

    local shownEntries = self:GetQuestLogCounts()
    local questIDs = {}
    local index
    for index = 1, shownEntries do
        local questID = tonumber(SafeCall(getQuestID, index)) or 0
        if questID > 0 then questIDs[questID] = true end
    end
    return questIDs
end

function Adapter:IsQuestComplete(questID)
    questID = tonumber(questID) or 0
    if questID <= 0 then return false end
    local questLog = _G.C_QuestLog
    if not questLog then return false end
    if type(questLog.IsComplete) == "function"
        and SafeCall(questLog.IsComplete, questID) == true then
        return true
    end
    return type(questLog.ReadyForTurnIn) == "function"
        and SafeCall(questLog.ReadyForTurnIn, questID) == true
end

function Adapter:GetQuestRewardXP(questID)
    questID = tonumber(questID) or 0
    if questID <= 0 then return 0 end
    -- Retail 返回 (totalXP, baseXP)；预测交付收益必须使用包含当前加成的 totalXP。
    return SafeNumber(_G.GetQuestLogRewardXP, questID)
end

function Adapter:ScanQuestXP()
    local questIDs = self:BuildQuestCache()
    local completeXP = 0
    local questID
    for questID in pairs(questIDs) do
        if self:IsQuestComplete(questID) then
            completeXP = completeXP + self:GetQuestRewardXP(questID)
        end
    end
    -- 旧 Retail 只统计已完成任务；第二返回值保留 shared View 的适配契约。
    return completeXP, 0
end

function Adapter:SetNativeExperienceBarHidden(module, hidden)
    return self.nativeBar:SetHidden(module, hidden)
end

function Adapter:RestoreNativeExperienceBar(module)
    return self.nativeBar:Restore(module)
end

ns.ExperienceBarAdapter = Adapter
ns.ExperienceBarRetailAdapter = Adapter
