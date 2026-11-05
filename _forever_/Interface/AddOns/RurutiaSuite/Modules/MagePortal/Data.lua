local _, ns = ...

if not (ns.Build and ns.Build.HasModule and ns.Build.HasModule("MagePortal")) then return end

local Data = {}

Data.portalRunes = { portal = 17032, teleport = 17031 }

local CLASSIC = {
    { name = "奥格瑞玛", short = "奥格", icon = 135759, portal = 11417, tele = 3567, faction = "Horde" },
    { name = "幽暗城", short = "幽暗", icon = 135766, portal = 11418, tele = 3563, faction = "Horde" },
    { name = "雷霆崖", short = "雷霆", icon = 135765, portal = 11420, tele = 3566, faction = "Horde" },
    { name = "暴风城", short = "暴风", icon = 135763, portal = 10059, tele = 3561, faction = "Alliance" },
    { name = "铁炉堡", short = "铁炉", icon = 135757, portal = 11416, tele = 3562, faction = "Alliance" },
    { name = "达纳苏斯", short = "达纳", icon = 135755, portal = 11419, tele = 3565, faction = "Alliance" },
}

local TBC_NEUTRAL = {
    { name = "沙塔斯", short = "沙城", icon = 135760, portal = 33691, tele = 33690, faction = "Alliance" },
    { name = "沙塔斯", short = "沙城", icon = 135760, portal = 35717, tele = 35715, faction = "Horde" },
}

local TBC_FACTION = {
    { name = "银月城", short = "银月", icon = 135761, portal = 32267, tele = 32272, faction = "Horde" },
    { name = "埃索达", short = "埃索", icon = 135756, portal = 32266, tele = 32271, faction = "Alliance" },
}

local WRATH_NEUTRAL = {
    { name = "达拉然", short = "达拉", icon = 237509, portal = 53142, tele = 53140 },
}

local WRATH_FACTION = {
    { name = "斯通纳德", short = "斯通", icon = 135762, portal = 49361, tele = 49358, faction = "Horde" },
    { name = "塞拉摩", short = "塞拉", icon = 135764, portal = 49360, tele = 49359, faction = "Alliance" },
}

local MISTS_NEUTRAL = {
    { name = "锦绣谷", short = "锦绣", icon = 851297, portal = 132620, tele = 132621, faction = "Alliance" },
    { name = "锦绣谷", short = "锦绣", icon = 851297, portal = 132626, tele = 132627, faction = "Horde" },
    { name = "达拉然巨坑", short = "巨坑", icon = nil, portal = 120146, tele = 120145,
        spellLeft = "远古传送门：达拉然", spellRight = "远古传送：达拉然" },
    { name = "托尔巴拉德", short = "托巴", icon = nil, portal = 88345, tele = 88342, faction = "Alliance" },
    { name = "托尔巴拉德", short = "托巴", icon = nil, portal = 88346, tele = 88344, faction = "Horde" },
}

local GROUPS = {
    era = { CLASSIC },
    wrath = { WRATH_NEUTRAL, TBC_NEUTRAL, CLASSIC, TBC_FACTION, WRATH_FACTION },
    mists = { MISTS_NEUTRAL, WRATH_NEUTRAL, TBC_NEUTRAL, CLASSIC, TBC_FACTION, WRATH_FACTION },
}

local function CopyPortal(portal, icon)
    return {
        type = "custom_portal",
        name = portal.name,
        icon = icon,
        overlayText = portal.short,
        spellLeft = portal.spellLeft or "传送门：" .. portal.name,
        itemPortal = Data.portalRunes.portal,
        spellRight = portal.spellRight or "传送：" .. portal.name,
        itemTeleport = Data.portalRunes.teleport,
        portalID = portal.portal,
        teleportID = portal.tele,
        cdSpellID = portal.tele,
        requiredFaction = portal.faction,
    }
end

function Data:GetRawGroups(key)
    return GROUPS[key]
end

function Data:IsReagentFree(key)
    return key == "mists"
end

function Data:Build(key, faction, resolveIcon)
    local groups = GROUPS[key]
    if not groups then return nil end
    local result = {}
    local groupIndex
    for groupIndex = 1, #groups do
        local group = groups[groupIndex]
        local index
        for index = 1, #group do
            local portal = group[index]
            if not portal.faction or portal.faction == faction then
                local icon = portal.icon
                if not icon and type(resolveIcon) == "function" then
                    icon = resolveIcon(portal.portal) or resolveIcon(portal.tele)
                end
                result[#result + 1] = CopyPortal(portal, icon)
            end
        end
    end
    return result
end

function Data:GetDiagnostics()
    return { keys = { "era", "wrath", "mists" }, portalRune = 17032, teleportRune = 17031 }
end

ns.MagePortalDataSource = Data
