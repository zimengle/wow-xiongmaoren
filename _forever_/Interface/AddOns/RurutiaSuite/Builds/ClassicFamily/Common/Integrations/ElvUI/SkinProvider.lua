local _, RS = ...
if RS.Build and RS.Build.SupportsIntegration and not RS.Build.SupportsIntegration("elvui") then return end

if not RS.Build.IsFamily("classic") then return end

local Provider = {}
local Unpack = unpack or table.unpack
function Provider:IsAvailable()
    return RS.Compat.IsAddOnLoaded("ElvUI") == true
end
function Provider:Apply(kind, component)
    if kind ~= "external-button" then return false end
    local button = type(component) == "table" and (component.frame or component) or component
    if not button or button._RSS_ElvUISkinned then return button and true or false end
    local environment = _G.ElvUI
    if type(environment) ~= "table" or type(Unpack) ~= "function" then return false end
    local unpacked, engine = pcall(Unpack, environment)
    if not unpacked or type(engine) ~= "table" or type(engine.GetModule) ~= "function" then
        return false
    end
    local ok, skins = pcall(engine.GetModule, engine, "Skins", true)
    if not ok or type(skins) ~= "table" then
        ok, skins = pcall(engine.GetModule, engine, "Skins")
    end
    if not ok or type(skins) ~= "table" or type(skins.HandleButton) ~= "function"
        or not pcall(skins.HandleButton, skins, button) then
        return false
    end
    button._RSS_ElvUISkinned = true
    return true
end

RS.UI:RegisterSkinProvider("ElvUI", Provider, 10)
