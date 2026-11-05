local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("elvui") then return end
if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")) then return end

local Base = ns.ChatBarAdapterBase
if type(Base) ~= "table" then error("ChatBar Classic adapter must load before its integrations", 2) end

Base.RegisterProvider({
    id = "elvui",
    label = "ElvUI",
    priority = 90,
    IsAvailable = function(_, adapter)
        return adapter:IsAddOnLoaded("ElvUI")
    end,
    Open = function(_, adapter)
        local engine = _G.ElvUI and _G.ElvUI[1]
        if engine and type(engine.ToggleOptions) == "function" then
            engine:ToggleOptions()
            return true
        end
        return adapter:RunSlash("ELVUI", "/ec")
    end,
})
