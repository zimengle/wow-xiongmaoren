local _, ns = ...
ns.Integrations = ns.Integrations or {}
local Integration = {}
ns.Integrations.RXP = Integration

-- Read-only lookup of RXP's already-loaded instance. RSS does not create an
-- Ace addon/module, register callbacks, or use that framework for its own life cycle.
function Integration:GetAddon()
    if not _G.LibStub then return nil end
    local ok, library = pcall(_G.LibStub, "AceAddon-3.0", true)
    if not ok or type(library) ~= "table" or type(library.GetAddon) ~= "function" then return nil end
    local found, addon = pcall(library.GetAddon, library, "RXPGuides", true)
    if found and type(addon) == "table" then return addon end
end
