local _, ns = ...

local Imports = ns.LegacyPresetImports or {}
ns.LegacyPresetImports = Imports

local Adapter = {}
Imports.at = Adapter

local EXPORT_PREFIX = "!ATS:2:"
local MAX_TEXT = 524288
local MAX_DECODED = 2097152
local MAX_DEPTH = 40
local MAX_ITEMS = 100000
local MAX_STRING = 262144

local function IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

local function IsLoaded(addonName)
    local addons = _G.C_AddOns
    if type(addons) == "table" and type(addons.IsAddOnLoaded) == "function" then
        local ok, loaded = pcall(addons.IsAddOnLoaded, addonName)
        return ok and loaded and true or false
    end
    if type(_G.IsAddOnLoaded) == "function" then
        local ok, loaded = pcall(_G.IsAddOnLoaded, addonName)
        return ok and loaded and true or false
    end
    return false
end

local function EnsureLoaded(addonName)
    if IsLoaded(addonName) then return true end
    local loader = _G.C_AddOns and _G.C_AddOns.LoadAddOn or _G.LoadAddOn
    if type(loader) ~= "function" then return false end
    local ok, loaded = pcall(loader, addonName)
    return ok and loaded ~= false and IsLoaded(addonName)
end

local function HasAcceptedPrefix(payload, prefixes)
    for index = 1, #prefixes do
        if string.sub(payload, 1, #prefixes[index]) == prefixes[index] then return true end
    end
    return false
end

local function GetServices(forExport)
    local catalog = Imports.Catalog and Imports.Catalog.at
    if type(catalog) ~= "table" then return nil, "catalog-unavailable" end
    if not EnsureLoaded(catalog.addon) then return nil, "addon-not-loaded" end
    local libStub = _G.LibStub
    if type(libStub) ~= "table" then return nil, "codec-unavailable" end
    local deflateOK, deflate = pcall(libStub, "LibDeflate", true)
    local serializeOK, serialize = pcall(libStub, "LibSerialize", true)
    if not deflateOK or not serializeOK then
        return nil, "codec-unavailable"
    end
    if type(deflate) ~= "table" or type(serialize) ~= "table"
        or type(deflate.DecodeForPrint) ~= "function"
        or type(deflate.DecompressDeflateWithLimit) ~= "function"
        or type(serialize.Deserialize) ~= "function" then
        return nil, "codec-unavailable"
    end
    if forExport and (type(deflate.CompressDeflate) ~= "function"
        or type(deflate.EncodeForPrint) ~= "function"
        or type(serialize.Serialize) ~= "function") then
        return nil, "codec-unavailable"
    end
    local integration = ns.Integrations and ns.Integrations.AbilityTimeline
    if type(integration) ~= "table" or type(integration.GetDatabase) ~= "function" then
        return nil, "database-unavailable"
    end
    local ok, db, reason = pcall(integration.GetDatabase, integration)
    if not ok or type(db) ~= "table" then return nil, reason or "database-unavailable" end
    return { catalog = catalog, deflate = deflate, serialize = serialize, db = db }
end

local function ValidateTree(value, state, depth, seen)
    depth = depth or 1
    if depth > MAX_DEPTH then return false, "data-too-deep" end
    local kind = type(value)
    if kind == "string" then
        if #value > MAX_STRING then return false, "string-too-large" end
        state.items = state.items + 1
        return state.items <= MAX_ITEMS, "data-too-large"
    end
    if kind == "number" then
        if value ~= value or value == math.huge or value == -math.huge then return false, "data-invalid" end
        state.items = state.items + 1
        return state.items <= MAX_ITEMS, "data-too-large"
    end
    if kind == "boolean" then
        state.items = state.items + 1
        return state.items <= MAX_ITEMS, "data-too-large"
    end
    if kind ~= "table" then return false, "data-invalid" end
    seen = seen or {}
    if seen[value] then return false, "data-cyclic" end
    seen[value] = true
    for key, child in pairs(value) do
        local keyType = type(key)
        if keyType ~= "string" and keyType ~= "number" then return false, "data-invalid" end
        if keyType == "string" and #key > MAX_STRING then return false, "string-too-large" end
        if keyType == "number" and (key ~= key or key == math.huge or key == -math.huge) then
            return false, "data-invalid"
        end
        state.items = state.items + 1
        if state.items > MAX_ITEMS then return false, "data-too-large" end
        local ok, reason = ValidateTree(child, state, depth + 1, seen)
        if not ok then return false, reason end
    end
    seen[value] = nil
    return true
end

local function ValidateData(data)
    if type(data) ~= "table" or type(data.profile) ~= "table" or type(data.global) ~= "table" then
        return false, "data-invalid"
    end
    for key in pairs(data) do
        if key ~= "profile" and key ~= "global" then return false, "data-invalid" end
    end
    return ValidateTree(data, { items = 0 }, 1)
end

local function DeepCopy(value, seen)
    if type(value) ~= "table" then return value end
    seen = seen or {}
    if seen[value] then return seen[value] end
    local copy = {}
    seen[value] = copy
    for key, child in pairs(value) do copy[DeepCopy(key, seen)] = DeepCopy(child, seen) end
    return copy
end

local function DeepEqual(left, right, seen)
    if type(left) ~= type(right) then return false end
    if type(left) ~= "table" then return left == right end
    seen = seen or {}
    if seen[left] == right then return true end
    seen[left] = right
    for key, value in pairs(left) do
        if not DeepEqual(value, right[key], seen) then return false end
    end
    for key in pairs(right) do if left[key] == nil then return false end end
    return true
end

local function Replace(target, source)
    for key in pairs(target) do target[key] = nil end
    for key, value in pairs(source or {}) do target[key] = DeepCopy(value) end
end

local function DecodePayload(services, payload)
    if type(payload) ~= "string" or payload == "" then return nil, "payload-missing" end
    if #payload > MAX_TEXT then return nil, "payload-too-large" end
    if not HasAcceptedPrefix(payload, services.catalog.acceptedPrefixes or {}) then
        return nil, "unsupported-codec"
    end
    local prefix = string.sub(payload, 1, 7)
    local ok, decoded = pcall(services.deflate.DecodeForPrint, services.deflate,
        string.sub(payload, #prefix + 1))
    if not ok or decoded == nil then return nil, "decode-failed" end
    local trailing
    ok, decoded, trailing = pcall(services.deflate.DecompressDeflateWithLimit,
        services.deflate, decoded, MAX_DECODED)
    if not ok or decoded == nil then
        return nil, trailing == -18 and "payload-too-large" or "decompress-failed"
    end
    if trailing ~= 0 then return nil, "compressed-trailing-data" end
    local success, data
    ok, success, data = pcall(services.serialize.Deserialize, services.serialize, decoded)
    if not ok or success ~= true then return nil, "deserialize-failed" end
    local valid, reason = ValidateData(data)
    if not valid then return nil, reason end
    return data
end

function Adapter:Import(request)
    if IsInCombat() then return false, "combat-lockdown" end
    request = type(request) == "table" and request or {}
    local catalog = Imports.Catalog and Imports.Catalog.at
    if type(catalog) ~= "table" then return false, "catalog-unavailable" end
    if request.parentCommand == "all" or request.command == "all" then
        local getInfo = _G.C_AddOns and _G.C_AddOns.GetAddOnInfo or _G.GetAddOnInfo
        if type(getInfo) == "function" and not IsLoaded(catalog.addon) then
            local ok, name = pcall(getInfo, catalog.addon)
            if ok and name == nil then
                return true, { changed = false, reloadRequired = false, skipped = true,
                    provider = catalog.addon, reason = "addon-not-installed" }
            end
        end
    end
    local payload = request.payload
    if payload == nil then payload = catalog.defaultPayload end
    if type(payload) ~= "string" or payload == "" then return false, "payload-missing" end
    if not HasAcceptedPrefix(payload, catalog.acceptedPrefixes or {}) then
        return false, "unsupported-codec"
    end
    local services, reason = GetServices(false)
    if not services then return false, reason end
    local data
    data, reason = DecodePayload(services, payload)
    if not data then return false, reason end

    local backup = { profile = DeepCopy(services.db.profile), global = DeepCopy(services.db.global) }
    local applied = pcall(function()
        Replace(services.db.profile, data.profile)
        Replace(services.db.global, data.global)
    end)
    local readOK, matches = false, false
    if applied then
        readOK, matches = pcall(function()
            return DeepEqual(services.db.profile, data.profile)
                and DeepEqual(services.db.global, data.global)
        end)
    end
    if not applied or not readOK or not matches then
        local restored, verified = pcall(function()
            Replace(services.db.profile, backup.profile)
            Replace(services.db.global, backup.global)
            return DeepEqual(services.db.profile, backup.profile)
                and DeepEqual(services.db.global, backup.global)
        end)
        if not restored or not verified then return false, "rollback-failed" end
        return false, applied and "readback-mismatch" or "apply-failed"
    end
    return true, { changed = true, reloadRequired = true, provider = services.catalog.provider }
end

function Adapter:Export()
    if IsInCombat() then return nil, "combat-lockdown" end
    local services, reason = GetServices(true)
    if not services then return nil, reason end
    local data = { profile = DeepCopy(services.db.profile), global = DeepCopy(services.db.global) }
    local valid
    valid, reason = ValidateData(data)
    if not valid then return nil, reason end
    local ok, serialized = pcall(services.serialize.Serialize, services.serialize, data)
    if not ok or type(serialized) ~= "string" or #serialized > MAX_DECODED then
        return nil, "serialize-failed"
    end
    local compressed
    ok, compressed = pcall(services.deflate.CompressDeflate, services.deflate, serialized)
    if not ok or type(compressed) ~= "string" then return nil, "compress-failed" end
    local encoded
    ok, encoded = pcall(services.deflate.EncodeForPrint, services.deflate, compressed)
    if not ok or type(encoded) ~= "string" then return nil, "encode-failed" end
    local payload = EXPORT_PREFIX .. encoded
    if #payload > MAX_TEXT then return nil, "payload-too-large" end
    return payload
end

Adapter.EXPORT_PREFIX = EXPORT_PREFIX

return Adapter
