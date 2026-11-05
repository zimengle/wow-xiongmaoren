local _, ns = ...
if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("classic")
    and ns.Build.GetID and ns.Build.GetID() ~= "classic-infinite"
    and ns.Build.HasModule and ns.Build.HasModule("ExtraTools")) then return end

local Registry = ns.ExtraToolsProviderRegistry
if type(Registry) ~= "table" then error("ExtraTools Providers.lua must load before EllesmereUI integration", 2) end

local function IsLoaded(name)
    local addons = _G.C_AddOns
    local callback = addons and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    return type(callback) == "function" and callback(name) and true or false
end

Registry:Register({
    id = "ellesmereui-actionbars",
    priority = 30,
    addonNames = { EllesmereUI = true, EllesmereUIActionBars = true },
    IsActionBarEnabled = function()
        if not IsLoaded("EllesmereUI") or not IsLoaded("EllesmereUIActionBars") then return false end
        -- The suite's action-bar switch enables/disables this separate addon.
        -- A disabled addon may remain loaded until reload; respect that choice.
        local addons = _G.C_AddOns
        local getState = addons and addons.GetAddOnEnableState
        if type(getState) == "function" and getState("EllesmereUIActionBars") == 0 then return false end
        local core = _G.EllesmereUI
        local lite = type(core) == "table" and core.Lite or nil
        if type(lite) == "table" and type(lite.GetAddon) == "function" then
            local actionbars = lite.GetAddon("EllesmereUIActionBars", true)
            if actionbars then return actionbars.enabledState == true end
        end
        return true
    end,
})
