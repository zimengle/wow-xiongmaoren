local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("ndui") then return end
if not (ns.Build and ns.Build.Is and ns.Build.Is("retail")) then return end
local Adapter = ns.PlayerTooltipAdapter
if type(Adapter) ~= "table" then return end

Adapter:RegisterCompetingUI({
    id = "ndui",
    label = "NDui",
    settingKey = "disableWhenNDui",
    addonName = "NDui",
    IsAvailable = function()
        return ns.Compat and ns.Compat.IsAddOnLoaded and ns.Compat.IsAddOnLoaded("NDui") or false
    end,
})
