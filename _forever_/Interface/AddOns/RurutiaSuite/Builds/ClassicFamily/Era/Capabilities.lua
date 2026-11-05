local _, ns = ...

ns.ClassicBuildCommon.Register({
    id = "classic-era",
    label = "Classic Era",
    minInterface = 1,
    maxInterface = 15999,
    capabilities = {
        expansion = "era",
        consumableData = "era",
        secureClickMode = "era",
        macroTargetMarkerClear = true,
    },
})
