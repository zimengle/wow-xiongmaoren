local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("ndui") then return end
if not (ns.Build and ns.Build.GetID and ns.Build.GetID() == "retail") then return end
local Registry = ns.RetailChatBarAdapterBase
if type(Registry) ~= "table" then return end

Registry.RegisterProvider({
    id = "ndui",
    label = "NDui",
    priority = 100,
    IsAvailable = function(_, adapter) return adapter:IsAddOnLoaded("NDui") end,
    Open = function() return ns.OpenRetailNDuiSettings() end,
})
