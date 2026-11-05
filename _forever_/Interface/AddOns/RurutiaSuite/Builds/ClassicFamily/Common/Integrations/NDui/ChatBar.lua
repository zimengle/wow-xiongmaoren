local _, ns = ...
if ns.Build and ns.Build.SupportsIntegration and not ns.Build.SupportsIntegration("ndui") then return end
if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")) then return end

local Base = ns.ChatBarAdapterBase
if type(Base) ~= "table" then error("ChatBar Classic adapter must load before its integrations", 2) end

Base.RegisterProvider({
    id = "ndui",
    label = "NDui",
    priority = 100,
    IsAvailable = function(_, adapter)
        return adapter:IsAddOnLoaded("NDui")
    end,
    Open = function()
        if type(ns.OpenNDuiSettings) == "function" then
            ns:OpenNDuiSettings()
            return true
        end
        local frame = _G.NDuiGUI
        if frame and type(frame.Show) == "function" then
            frame:Show()
            return true
        end
        return false
    end,
})
