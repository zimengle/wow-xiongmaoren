local _, ns = ...

if not ns.Build.IsFamily("classic") then
    return
end

local Compat = ns.Compat
local available = ns.Build.GetCapability("autoMark", false) == true

ns.AutoMarkAdapter = {
    id = "classic-family",
    available = available,
    defaultEnabled = available,
    GetRaidTargetIndex = function(unit)
        return Compat.GetRaidTargetIndex(unit)
    end,
    SetRaidTarget = function(unit, mark)
        return Compat.SetRaidTarget(unit, mark)
    end,
}
