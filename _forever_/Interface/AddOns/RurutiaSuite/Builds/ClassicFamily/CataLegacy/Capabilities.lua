local _, ns = ...

ns.ClassicBuildCommon.Register({
    id = "classic-cata-legacy",
    label = "Classic Cata",
    minInterface = 40000,
    maxInterface = 49999,
    capabilities = {
        expansion = "cata",
        consumableData = "cata",
        autoMark = true,
        worldMarkers = true,
        macroTargetMarkerClear = true,
    },
})
