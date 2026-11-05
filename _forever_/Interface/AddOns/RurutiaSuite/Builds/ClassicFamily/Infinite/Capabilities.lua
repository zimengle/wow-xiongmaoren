local _, ns = ...

-- Forever 1.60 has its own identity. Shared Classic features and the Era item
-- catalog remain the baseline until Infinite-specific data is verified.
ns.ClassicBuildCommon.Register({
    id = "classic-infinite",
    label = "无限（Forever）",
    minInterface = 16000,
    maxInterface = 19999,
    modules = {
        RangeMonitor = true,
        NameplateTarget = true,
        CenterTextGroup = true,
        FastFocus = true,
        ClassReminders = true,
        HunterAspects = true,
        CombatReminder = true,
        QuestAutomation = true,
        MapEnhancement = true,
        SwingTimerPolicy = true,
    },
    integrations = {
        ellesmereui = true,
    },
    capabilities = {
        expansion = "era",
        consumableData = "era",
        secureClickMode = "era",
        raidMarkerStyle = "retail",
        worldMarkers = true,
    },
})
