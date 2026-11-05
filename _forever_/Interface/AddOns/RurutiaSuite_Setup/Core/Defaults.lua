local _, ns = ...

ns.Defaults = {
    global = {
        schemaVersion = 2,
        layout = {
            editModeLayoutName = ns.LayoutPolicy.CANONICAL_LAYOUT_NAME,
            side = ns.LayoutPolicy.DEFAULT_SIDE,
            edgeOnSwitch = true,
            adjustKira = true,
            adjustKiraInterrupts = true,
            adjustKiraStops = true,
            canvasMode = ns.LayoutPolicy.DEFAULT_CANVAS_MODE,
        },
        automation = {
            enabled = true,
            editModeLayout = true,
            senseiBrewmaster = true,
            senseiNotify = false,
            exbossVoice = true,
            dandersProfile = true,
            dandersMythicOnly = true,
        },
        automationState = {
            sensei = {},
        },
        gameMenu = {
            enabled = true,
        },
        health = {
            reminderEnabled = true,
            activationReminder = false,
            ignoredCategories = { cooldown = true },
            acknowledgedIssues = {},
        },
        migration = {
            legacySetupVersion = 0,
        },
    },
}
