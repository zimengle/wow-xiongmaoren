local _, ns = ...
if not ns.Build.IsFamily("classic") then return end

-- Query the installed addon's registry only on an explicit click. RS does not
-- embed Ace3, create an addon, or retain the third-party object.
local Integration = {}
function Integration:GetAddon(name)
    if name ~= "MeetingHorn" then return nil end
    local stub = _G.LibStub
    if stub == nil then return nil end
    local ok, registry = pcall(stub, "AceAddon-3.0", true)
    if not ok or type(registry) ~= "table" or type(registry.GetAddon) ~= "function" then
        return nil
    end
    local found, addon = pcall(registry.GetAddon, registry, name, true)
    if found and type(addon) == "table" then return addon end
    return nil
end
ns.MeetingHornIntegration = Integration
