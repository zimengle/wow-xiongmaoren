local _, ns = ...

if ns.Build and ns.Build.HasModule and not ns.Build.HasModule("PlayerTooltip") then return end

local Data = {
    compatibilityOptions = {
        { key = "disableWhenNDui", label = "NDui" },
        { key = "disableWhenElvUI", label = "ElvUI" },
    },
    defaults = {
        profile = {
            enabled = true,
            modifier = "SHIFT",
            showScore = true,
            showRuns = true,
            showKeystone = true,
            showRaids = true,
            showLegendAchievement = true,
            disableWhenNDui = true,
            disableWhenElvUI = true,
        },
    },
    summaryCacheTTL = 120,
    raidCacheTTL = 120,
    raidRequestCooldown = 2,
    keystoneCacheTTL = 300,
    keystoneRequestCooldown = 5,
    cacheMaxEntries = 64,
    keystoneCacheMaxEntries = 128,
    modifierOrder = { "NONE", "SHIFT", "CTRL", "ALT" },
    modifierLabels = {
        NONE = "始终显示",
        SHIFT = "Shift",
        CTRL = "Ctrl",
        ALT = "Alt",
    },
    raidDifficulties = {
        { name = "随机", color = "ffff8000" },
        { name = "普通", color = "ff1eff00" },
        { name = "英雄", color = "ff0070dd" },
        { name = "史诗", color = "ffa335ee" },
    },
    seasonLegendAchievement = {
        id = 61258,
        label = "S1钥匙传奇",
    },
    raidData = {
        {
            key = "Dreamrift",
            name = "梦境裂隙",
            bossStatisticIDs = {
                { 61474, 61475, 61476, 61477 },
            },
        },
        {
            key = "Voidspire",
            name = "虚影尖塔",
            bossStatisticIDs = {
                { 61276, 61277, 61278, 61279 },
                { 61280, 61281, 61282, 61283 },
                { 61284, 61285, 61286, 61287 },
                { 61288, 61289, 61290, 61291 },
                { 61292, 61293, 61294, 61295 },
                { 61296, 61297, 61298, 61299 },
            },
        },
        {
            key = "QuelDanas",
            name = "进军奎尔丹纳斯",
            bossStatisticIDs = {
                { 61300, 61301, 61302, 61303 },
                { 61304, 61305, 61306, 61307 },
            },
        },
    },
}

ns.PlayerTooltipData = Data
