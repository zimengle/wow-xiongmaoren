local _, ns = ...

local Imports = ns.LegacyPresetImports or {}
ns.LegacyPresetImports = Imports

local Adapter = {}
Imports.exboss = Adapter

local function IsInCombat()
    local callback = _G.InCombatLockdown
    return type(callback) == "function" and callback() == true
end

local function IsLoaded(name)
    local addons = _G.C_AddOns
    local callback = type(addons) == "table" and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(callback) ~= "function" then return false end
    local ok, loading, loaded = pcall(callback, name)
    return ok and (loading == true or loaded == true)
end

local function GetProviderAPI(catalog)
    if not IsLoaded(catalog.addon) then return nil, "addon-not-loaded" end
    if not IsLoaded(catalog.providerAddon) then return nil, "provider-not-loaded" end
    local api = rawget(_G, "EXBOSSRurutiaPresetAPI")
    local version = type(api) == "table" and tonumber(api.API_VERSION)
    if not version or version < (tonumber(catalog.requiredAPIVersion) or math.huge)
        or type(api.Install) ~= "function" or type(api.ShowInstaller) ~= "function" then
        return nil, "unsupported-import-api"
    end
    return api
end

function Adapter:Import(request)
    local catalog = Imports.Catalog and Imports.Catalog.exboss
    if type(catalog) ~= "table" then return false, "catalog-unavailable" end
    if IsInCombat() then return false, "combat-lockdown" end
    local api, reason = GetProviderAPI(catalog)
    if not api then
        if type(request) == "table" and (request.parentCommand == "all" or request.command == "all")
            and (reason == "addon-not-loaded" or reason == "provider-not-loaded") then
            return true, { changed = false, reloadRequired = false, skipped = true,
                provider = catalog.providerAddon, reason = reason }
        end
        return false, reason
    end
    local called, installed, result = pcall(api.Install, api, "all", {
        variant = catalog.defaultVariant,
        reload = false,
    })
    if not called then return false, "provider-error" end
    if installed ~= true then return false, result or "import-failed" end
    local reused = type(result) == "table" and result.reused == true
    return true, {
        -- Reuse means retaining provider-owned IDs, not a no-op: Install still
        -- re-enables role selections and restores/activates the appearance.
        changed = true,
        reloadRequired = false,
        reused = reused,
        provider = catalog.providerAddon,
        presetID = catalog.presetID,
        variant = catalog.defaultVariant,
    }
end

function Adapter:OpenInstaller()
    local catalog = Imports.Catalog and Imports.Catalog.exboss
    if type(catalog) ~= "table" then return false, "catalog-unavailable" end
    if IsInCombat() then return false, "combat-lockdown" end
    local api, reason = GetProviderAPI(catalog)
    if not api then return false, reason end
    local called, opened, openReason = pcall(api.ShowInstaller, api)
    if not called then return false, "provider-error" end
    if opened ~= true then return false, openReason or "open-failed" end
    return true
end

return Adapter
