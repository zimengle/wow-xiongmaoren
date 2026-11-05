local _, RS = ...
if RS.Build and RS.Build.SupportsIntegration and not RS.Build.SupportsIntegration("ellesmereui") then return end

if not RS.Build.IsFamily("retail") then return end

local Provider = {}
function Provider:IsAvailable()
    return RS.Compat.IsAddOnLoaded("EllesmereUI") == true
end
function Provider:Apply()
    -- Selection alone is not proof of a real appearance bridge.
    return false
end

RS.UI:RegisterSkinProvider("EllesmereUI", Provider, 30)
