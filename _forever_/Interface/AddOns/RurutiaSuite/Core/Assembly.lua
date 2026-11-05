local _, ns = ...

local Build = ns.Build
local Runtime = ns.Runtime
local Assembly = {}
ns.Assembly = Assembly

local entries = {}
local entryByName = {}

local function BindDatabase(module, entry)
    if entry.defaults == nil then
        return true
    end
    if ns.DB == nil then
        error("RurutiaSuite database must open before module initialization", 2)
    end

    local database, reason = ns.DB:RegisterNamespace(entry.databaseName, entry.defaults)
    if database == nil then
        error("Unable to bind database for " .. entry.name .. ": " .. tostring(reason), 2)
    end
    module.db = database
    return true
end

function Assembly:RegisterModule(name, definition)
    if type(name) ~= "string" or name == "" then
        error("Assembly:RegisterModule expects a non-empty module name", 2)
    end
    if type(definition) ~= "table" then
        error("Assembly:RegisterModule expects a definition table", 2)
    end
    if entryByName[name] ~= nil then
        error("Assembly module already registered: " .. name, 2)
    end
    if not Build.HasModule(name) then
        return nil, "module is not available for build " .. Build.GetID()
    end

    local entry = {
        name = name,
        databaseName = definition.databaseName or name,
        defaults = definition.defaults,
        defaultEnabled = definition.defaultEnabled ~= false,
        definition = definition,
    }
    -- Definitions are shared prototypes, not per-instance state. Only the
    -- database initialization wrapper belongs to Assembly; copying every method
    -- retains a second hash table for each module for the whole session.
    local runtimeDefinition = setmetatable({}, { __index = definition })
    local initialize = definition.Initialize

    runtimeDefinition.Initialize = function(module)
        module.addon = ns
        BindDatabase(module, entry)
        if initialize ~= nil then
            return initialize(module)
        end
    end

    local module = Runtime:RegisterModule(name, runtimeDefinition)
    entry.module = module
    entries[#entries + 1] = entry
    entryByName[name] = entry
    return module
end

-- Assembly owns switch defaults; Database owns only its registered schema.
-- Remove exact matches only, keeping explicit opt-outs and unknown modules.
function Assembly:PrepareForSave()
    local profile = ns.DB and ns.DB.profile
    local switches = profile and rawget(profile, "modules")
    if type(switches) ~= "table" then return end
    for name, entry in pairs(entryByName) do
        if rawget(switches, name) == entry.defaultEnabled then switches[name] = nil end
    end
end

function Assembly:GetEntry(name)
    return entryByName[name]
end

function Assembly:GetEntries(result)
    result = result or {}
    local index
    for index = #result, 1, -1 do
        result[index] = nil
    end
    for index = 1, #entries do
        result[index] = entries[index]
    end
    return result
end

function Assembly:IsModuleEnabled(moduleOrName)
    local name = type(moduleOrName) == "string" and moduleOrName or moduleOrName:GetName()
    local entry = entryByName[name]
    if entry == nil then
        return false
    end

    local configured
    if ns.DB and ns.DB.profile and ns.DB.profile.modules then
        configured = ns.DB.profile.modules[name]
    end
    if configured == nil then
        return entry.defaultEnabled
    end
    return configured ~= false
end

function Assembly:SetModuleConfigured(name, enabled)
    local entry = entryByName[name]
    if entry == nil or ns.DB == nil then
        return false, "Unknown module: " .. tostring(name)
    end

    ns.DB.profile.modules = ns.DB.profile.modules or {}
    enabled = enabled and true or false
    if enabled == entry.defaultEnabled then
        rawset(ns.DB.profile.modules, name, nil)
    else
        rawset(ns.DB.profile.modules, name, enabled)
    end
    return true
end

function Assembly:SyncModuleConfigured(name, enabled)
    local entry = entryByName[name]
    if entry == nil or ns.DB == nil then
        return false, "Unknown module: " .. tostring(name)
    end
    ns.DB.profile.modules = ns.DB.profile.modules or {}
    local configured = rawget(ns.DB.profile.modules, name)
    if configured ~= nil then
        configured = configured ~= false
        if configured == entry.defaultEnabled then
            rawset(ns.DB.profile.modules, name, nil)
        else
            rawset(ns.DB.profile.modules, name, configured)
        end
        return true
    end
    return self:SetModuleConfigured(name, enabled)
end

-- A page may suspend a dependent RS feature without changing its own saved
-- choice or any third-party configuration. Gates are evaluated only on changes.
function Assembly:ApplyModuleState(name)
    local entry = entryByName[name]
    if not entry then return false, "Unknown module: " .. tostring(name) end
    local gate = entry.definition.activationGate
    local wanted = self:IsModuleEnabled(name)
    if wanted and gate then wanted = self:IsModuleEnabled(gate) end
    if wanted then return Runtime:EnableModule(entry.module) end
    return Runtime:DisableModule(entry.module)
end

function Assembly:SetModuleEnabled(name, enabled)
    local entry = entryByName[name]
    if entry == nil or ns.DB == nil then
        return false, "Unknown module: " .. tostring(name)
    end

    self:SetModuleConfigured(name, enabled)
    local ok, reason = self:ApplyModuleState(name)
    for _, dependent in ipairs(entries) do
        if dependent.definition.activationGate == name then
            local applied, failure = self:ApplyModuleState(dependent.name)
            if not applied then ok, reason = false, failure end
        end
    end
    return ok, reason
end

function Assembly:Activate()
    local failures = {}
    local index
    for index = 1, #entries do
        local entry = entries[index]
        local ok, reason = Runtime:InitializeModule(entry.module)
        if not ok then failures[entry.name] = reason end
    end
    if next(failures) ~= nil then return false, failures end

    for index = 1, #entries do
        local entry = entries[index]
        if self:IsModuleEnabled(entry.module) then
            local ok, reason = self:ApplyModuleState(entry.name)
            if not ok then failures[entry.name] = reason end
        end
    end
    return next(failures) == nil, failures
end

function Assembly:Deactivate()
    local failures = {}
    local index
    for index = #entries, 1, -1 do
        local entry = entries[index]
        local ok, reason = Runtime:DisableModule(entry.module)
        if not ok then failures[entry.name] = reason end
    end
    return next(failures) == nil, failures
end

function Assembly:RefreshProfile(profileName)
    local failures = {}
    local index
    for index = #entries, 1, -1 do
        local entry = entries[index]
        local ok, reason = Runtime:DisableModule(entry.module)
        if not ok then failures[entry.name] = reason end
    end
    for index = 1, #entries do
        local entry = entries[index]
        local callback = entry.definition.ProfileChanged
        if callback ~= nil then
            local ok, reason = Runtime:_CallModule(entry.module, "ProfileChanged", callback, profileName)
            if not ok then
                failures[entry.name] = reason
            end
        end
    end

    for index = 1, #entries do
        local entry = entries[index]
        if self:IsModuleEnabled(entry.module) then
            local ok, reason = self:ApplyModuleState(entry.name)
            if not ok then failures[entry.name] = reason end
        end
    end
    return next(failures) == nil, failures
end

ns.RegisterModule = function(name, definition)
    return Assembly:RegisterModule(name, definition)
end
