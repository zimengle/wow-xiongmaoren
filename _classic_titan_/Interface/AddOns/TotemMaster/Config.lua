local addonName, ST = ...

ST.Config = {}
local C = ST.Config

C.Interface = 38001

C.ElementOrder = {
    EARTH_TOTEM_SLOT or 2,
    FIRE_TOTEM_SLOT or 1,
    WATER_TOTEM_SLOT or 3,
    AIR_TOTEM_SLOT or 4,
}

C.ElementKeys = {
    [EARTH_TOTEM_SLOT or 2] = "earth",
    [FIRE_TOTEM_SLOT or 1] = "fire",
    [WATER_TOTEM_SLOT or 3] = "water",
    [AIR_TOTEM_SLOT or 4] = "air",
}

C.ElementLabels = {
    [EARTH_TOTEM_SLOT or 2] = "土",
    [FIRE_TOTEM_SLOT or 1] = "火",
    [WATER_TOTEM_SLOT or 3] = "水",
    [AIR_TOTEM_SLOT or 4] = "气",
}

C.CallSpellIDs = {
    Elements = 66842,
    Ancestors = 66843,
    Spirits = 66844,
    Recall = 36936,
}

C.CallSpellByPreset = {
    [1] = C.CallSpellIDs.Elements,
    [2] = C.CallSpellIDs.Ancestors,
    [3] = C.CallSpellIDs.Spirits,
}

C.PresetNames = {
    [1] = "元素",
    [2] = "先祖",
    [3] = "灵魂",
}

C.ShieldSpellIDs = {
    52127,
    324,
}

C.EarthShieldSpellID = 974
C.ReincarnationSpellID = 20608
C.AnkhItemID = 17030
C.RenewedLifeGlyphSpellID = 58059

C.WeaponSpellIDs = {
    8033,
    8024,
    8017,
    8232,
    51730,
}

C.WeaponEnchantDuration = 30 * 60

C.TotemBaseIDsByElement = {
    [EARTH_TOTEM_SLOT or 2] = {
        8071, 2484, 5730, 8075, 8143, 2062,
    },
    [FIRE_TOTEM_SLOT or 1] = {
        8181, 3599, 8190, 8227, 30706, 1275836,
    },
    [WATER_TOTEM_SLOT or 3] = {
        5394, 5675, 8184, 8170, 16190,
    },
    [AIR_TOTEM_SLOT or 4] = {
        8177, 10595, 8512, 6495, 3738,
    },
}
