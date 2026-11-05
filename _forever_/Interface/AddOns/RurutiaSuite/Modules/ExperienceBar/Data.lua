local _, ns = ...

local Data = {
    layout = {
        defaultX = 0,
        defaultY = -72,
        defaultWidth = 450,
        defaultHeight = 10,
        minWidth = 240,
        maxWidth = 900,
        minHeight = 6,
        maxHeight = 30,
        minTextScale = 0.6,
        maxTextScale = 1.8,
    },
    colors = {
        background = { 0, 0, 0, 0.5 },
        gradientStart = { 0.3373, 0.3882, 1, 1 },
        gradientEnd = { 0.7765, 0.3804, 1, 1 },
        completeQuest = { 1, 0.5922, 0, 1 },
        incompleteQuest = { 1, 0.8235, 0.3098, 1 },
        rested = { 0.3098, 0.5647, 1, 0.545 },
    },
}

local function Copy(source)
    if type(source) ~= "table" then
        return source
    end
    local result = {}
    local key
    local value
    for key, value in pairs(source) do
        result[key] = Copy(value)
    end
    return result
end

function Data.CreateDefaults(features)
    features = features or {}
    local profile = {
        enabled = true,
        hideNativeExperienceBar = true,
        showXPPerHour = true,
        showQuestRestedText = true,
        showLevelTime = false,
        showSessionTime = false,
        resetSessionOnReload = false,
        x = Data.layout.defaultX,
        y = Data.layout.defaultY,
        width = Data.layout.defaultWidth,
        height = Data.layout.defaultHeight,
        textScale = 1,
        alpha = 1,
        colors = {
            gradientStart = Copy(Data.colors.gradientStart),
            gradientEnd = Copy(Data.colors.gradientEnd),
            rested = Copy(Data.colors.rested),
        },
    }

    if features.questXP then
        profile.trackCompletedQuestXP = true
        profile.colors.completeQuest = Copy(Data.colors.completeQuest)
    end
    if features.questXP and features.incompleteQuestXP ~= false then
        profile.showIncompleteQuestOverlay = true
        profile.colors.incompleteQuest = Copy(Data.colors.incompleteQuest)
    end

    return {
        profile = profile,
        char = {
            session = {
                gainedXP = 0,
                lastXP = 0,
                lastXPMax = 0,
                startTime = 0,
                totalPlayed = 0,
                levelPlayed = 0,
                playedAt = 0,
            },
        },
    }
end

-- Retail 旧版把已完成任务 XP 颜色保存为 completedQuest，新 View 统一读
-- completeQuest。只迁移真实落盘的 raw 值；旧数据库/当前 Database 默认继承不是用户差异。
function Data.MigrateLegacyProfile(profile)
    if type(profile) ~= "table" then return false end
    local colors = rawget(profile, "colors")
    if type(colors) ~= "table" then return false end
    local legacy = rawget(colors, "completedQuest")
    if legacy == nil then return false end
    if rawget(colors, "completeQuest") == nil and type(legacy) == "table" then
        rawset(colors, "completeQuest", Copy(legacy))
    end
    rawset(colors, "completedQuest", nil)
    return true
end

Data.Copy = Copy
ns.ExperienceBarData = Data
