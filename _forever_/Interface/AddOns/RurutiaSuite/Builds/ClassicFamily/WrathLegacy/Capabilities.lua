local _, ns = ...

ns.ClassicBuildCommon.Register({
    id = "classic-wrath-legacy",
    label = "Classic Wrath Legacy",
    minInterface = 30000,
    maxInterface = 37999,
    capabilities = {
        expansion = "wrath",
        consumableData = "wrath",
        autoMark = true,
        macroTargetMarkerClear = true,
        barModules = true,
    },
})
