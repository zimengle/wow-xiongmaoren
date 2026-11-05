-- Retail 资源条共享命名；不拥有资源条运行时或配置。
local _, ns = ...
if not ns.Build.IsFamily("retail") then return end
local Integration = {}
function Integration:GetDisplayName()
    local class = type(UnitClass) == "function" and select(2, UnitClass("player"))
    return class == "PALADIN" and "骑士星星圣能" or "露露的资源条"
end
ns.PowerBarIntegration = Integration
