local _, ns = ...

ns.ClassicBuildCommon.Register({
    id = "classic-titan",
    label = "Classic Titan",
    minInterface = 38000,
    maxInterface = 39999,
    capabilities = {
        expansion = "titan",
        consumableData = "titan",
        autoMark = true,
        macroTargetMarkerClear = true,
        barModules = true,
    },
})
