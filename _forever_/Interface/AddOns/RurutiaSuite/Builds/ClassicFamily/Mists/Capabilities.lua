local _, ns = ...

ns.ClassicBuildCommon.Register({
    id = "classic-mists",
    label = "Classic Mists",
    minInterface = 50000,
    maxInterface = 59999,
    modules = {
        RoleGuard = true,
    },
    capabilities = {
        expansion = "mists",
        consumableData = "mists",
        autoMark = true,
        worldMarkers = true,
        macroTargetMarkerClear = true,
        barModules = true,
    },
})
