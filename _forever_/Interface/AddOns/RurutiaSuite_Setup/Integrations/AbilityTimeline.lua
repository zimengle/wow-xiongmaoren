local _, ns = ...

ns.Integrations = ns.Integrations or {}

local Integration = {}

-- AbilityTimeline keeps its live profile/global tables behind its own AceDB
-- instance and exposes no public database API. RS/RSS do not ship or use AceDB
-- for their own storage; this narrow boundary only obtains the target addon's
-- already-loaded database object.
function Integration:GetDatabase()
    local libStub = _G.LibStub
    if type(libStub) ~= "table" and type(libStub) ~= "function" then
        return nil, "database-unavailable"
    end
    local libraryOK, aceDB = pcall(libStub, "AceDB-3.0", true)
    if not libraryOK or type(aceDB) ~= "table" or type(aceDB.New) ~= "function" then
        return nil, "database-unavailable"
    end
    local openOK, db = pcall(aceDB.New, aceDB, "AbilityTimeline", {}, true)
    if not openOK or type(db) ~= "table" or type(db.profile) ~= "table"
        or type(db.global) ~= "table" then
        return nil, "database-unavailable"
    end
    return db
end

ns.Integrations.AbilityTimeline = Integration

return Integration
