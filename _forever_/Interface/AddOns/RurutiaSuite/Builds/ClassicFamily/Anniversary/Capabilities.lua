local _, ns = ...

ns.ClassicBuildCommon.Register({
    id = "classic-anniversary",
    label = "Classic Anniversary / TBC",
    minInterface = 20000,
    maxInterface = 29999,
    capabilities = {
        expansion = "tbc",
        consumableData = "tbc",
    },
})

