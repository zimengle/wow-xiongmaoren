local _, ns = ...
ns.Integrations = ns.Integrations or {}
local Integration = {}
ns.Integrations.Questie = Integration

local function IsLoaded(name)
    local api = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(api) ~= "function" then return false end
    local ok, loaded = pcall(api, name)
    return ok and loaded == true
end

-- Resolve only the already-loaded active AceDB profile. Never load Questie,
-- change its profile mapping, or touch character/quest-history data.
function Integration:Resolve()
    if not IsLoaded("Questie") then return nil end
    local addon = _G.Questie
    local db = type(addon) == "table" and addon.db
    if type(db) ~= "table" or type(db.profile) ~= "table" then return nil end
    return db.profile, IsLoaded("EllesmereUI") and "elles" or "native"
end
