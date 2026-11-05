local _, ns = ...
if not (ns.Build and ns.Build.Is and ns.Build.Is("retail")) then return end
local Adapter = ns.PlayerTooltipAdapter
if type(Adapter) ~= "table" or type(Adapter.SetKeystoneProvider) ~= "function"
    or type(Adapter.SetKeystoneProviderResolver) ~= "function" then return end

local Bridge = {}

function Bridge:Resolve()
    local libStub = _G.LibStub
    if type(libStub) ~= "table" or type(libStub.GetLibrary) ~= "function" then return nil end
    local ok, provider = pcall(libStub.GetLibrary, libStub, "LibKeystone", true)
    if not ok or type(provider) ~= "table" then return nil end
    Adapter:SetKeystoneProvider(provider)
    return provider
end

Adapter:SetKeystoneProviderResolver(function() return Bridge:Resolve() end)
Bridge:Resolve()
ns.PlayerTooltipLibKeystoneBridge = Bridge
