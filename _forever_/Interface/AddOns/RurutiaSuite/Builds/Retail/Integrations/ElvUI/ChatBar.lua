local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("elvui") then return end
if not (ns.Build and ns.Build.GetID and ns.Build.GetID() == "retail") then return end
local Registry = ns.RetailChatBarAdapterBase
if type(Registry) ~= "table" then return end

Registry.RegisterProvider({
    id = "elvui",
    label = "ElvUI",
    priority = 90,
    IsAvailable = function(_, adapter) return adapter:IsAddOnLoaded("ElvUI") end,
    Open = function()
        local engine = _G.ElvUI and _G.ElvUI[1]
        if engine and type(engine.ToggleOptions) == "function" then
            engine:ToggleOptions()
            return true
        end
        return false
    end,
})
