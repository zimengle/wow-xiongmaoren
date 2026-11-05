local _, ns = ...

if not ns.Build.IsFamily("retail") then
    return
end

local Compat = ns.Compat

ns.AutoMarkAdapter = {
    id = "retail",
    available = ns.Build.GetCapability("autoMark", false) == true,
    defaultEnabled = false,
    GetRaidTargetIndex = function(unit)
        return Compat.GetRaidTargetIndex(unit)
    end,
    SetRaidTarget = function(unit, mark)
        return Compat.SetRaidTarget(unit, mark)
    end,
}
