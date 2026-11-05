local _, RS = ...
if RS.Build and RS.Build.SupportsIntegration and not RS.Build.SupportsIntegration("ndui") then return end

if not RS.Build.IsFamily("classic") then return end

local Provider = {}
function Provider:IsAvailable()
    return RS.Compat.IsAddOnLoaded("NDui") == true
end
function Provider:Apply(kind, component)
    if kind ~= "external-button" then return false end
    local button = type(component) == "table" and (component.frame or component) or component
    local environment = _G.NDui
    if not button or type(environment) ~= "table" then return false end
    if button._RSS_NDuiSkinned then return true end
    for _, candidate in pairs(environment) do
        if type(candidate) == "table" and type(candidate.Reskin) == "function"
            and pcall(candidate.Reskin, button) then
            button._RSS_NDuiSkinned = true
            return true
        end
    end
    return false
end

RS.UI:RegisterSkinProvider("NDui", Provider, 20)
