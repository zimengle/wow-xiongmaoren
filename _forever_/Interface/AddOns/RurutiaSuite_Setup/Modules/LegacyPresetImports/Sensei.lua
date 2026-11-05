local _, ns = ...

-- Sensei 常规与酒仙预设共用手动导入器；这里刻意不注册专精切换事件。
local Sensei = {}

ns.LegacyPresetImports = ns.LegacyPresetImports or {}
ns.LegacyPresetImports.Sensei = Sensei

local function IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() == true
end

local function IsAddonLoaded()
    if type(_G.SCRB) == "table" then return true end
    local addons = _G.C_AddOns
    if type(addons) == "table" and type(addons.IsAddOnLoaded) == "function" then
        local ok, loaded = pcall(addons.IsAddOnLoaded, "SenseiClassResourceBar")
        return ok and loaded == true
    end
    if type(_G.IsAddOnLoaded) == "function" then
        local ok, loaded = pcall(_G.IsAddOnLoaded, "SenseiClassResourceBar")
        return ok and loaded == true
    end
    return false
end

local function EnsureAddonLoaded()
    if IsAddonLoaded() then return true end
    local loader = _G.C_AddOns and _G.C_AddOns.LoadAddOn or _G.LoadAddOn
    if type(loader) ~= "function" then return false, "SenseiClassResourceBar is not loaded" end
    local ok, loaded, loadReason = pcall(loader, "SenseiClassResourceBar")
    if not ok then
        return false, "unable to load SenseiClassResourceBar: " .. tostring(loaded)
    end
    if loaded == false then
        return false, "unable to load SenseiClassResourceBar: " .. tostring(loadReason or "unknown error")
    end
    if not IsAddonLoaded() then return false, "SenseiClassResourceBar is not loaded" end
    return true
end

local function NormalizePreset(preset)
    if preset == nil or preset == "sensei" or preset == "default" or preset == "regular" then
        return "default"
    end
    if preset == "jx" or preset == "brewmaster" or preset == "sensei_brewmaster" then
        return "brewmaster"
    end
    return nil
end

local function GetConfigString(preset)
    local data = ns.LegacyPresetData and ns.LegacyPresetData.Sensei
    if not data then return nil end
    if preset == "default" then return data.default or data.Default end
    if preset == "brewmaster" then return data.brewmaster or data.Brewmaster end
    return nil
end

function Sensei:CanImport(preset)
    if IsInCombat() then return false, "IN_COMBAT" end
    local normalized = NormalizePreset(preset)
    if not normalized then return false, "UNSUPPORTED_PRESET" end
    local configString = GetConfigString(normalized)
    if type(configString) ~= "string" or configString == "" then
        return false, "DATA_MISSING"
    end
    if not configString:match("^SenseiClassResourceBar:") then
        return false, "DATA_INVALID"
    end
    if not IsAddonLoaded() then return false, "ADDON_NOT_LOADED" end
    local scrb = _G.SCRB
    if type(scrb) ~= "table" or type(scrb.importProfileFromString) ~= "function" then
        return false, "API_UNAVAILABLE"
    end
    return true, { preset = normalized, configString = configString }
end

function Sensei:Import(preset)
    if type(preset) == "table" then preset = preset.preset or preset.mode end
    if IsInCombat() then return false, "IN_COMBAT" end
    local loaded, loadReason = EnsureAddonLoaded()
    if not loaded then return false, "ADDON_NOT_LOADED" end
    local canImport, context = self:CanImport(preset)
    if not canImport then return false, context end

    local scrb = _G.SCRB
    local ok, imported, importReason = pcall(scrb.importProfileFromString, context.configString)
    if not ok then return false, "STATE_UNKNOWN_AFTER_IMPORT" end
    if imported == false then
        return false, "API_REJECTED"
    end

    local refresh = scrb.fullUpdateBars or scrb.updateBars
    if type(refresh) ~= "function" then
        return true, {
            changed = true,
            provider = "SenseiClassResourceBar",
            preset = context.preset,
            refreshed = false,
            reloadRequired = true,
        }
    end
    ok, importReason = pcall(refresh)
    if not ok then
        return true, {
            changed = true,
            provider = "SenseiClassResourceBar",
            preset = context.preset,
            refreshed = false,
            refreshReason = "REFRESH_FAILED",
            reloadRequired = true,
        }
    end
    return true, {
        changed = true,
        provider = "SenseiClassResourceBar",
        preset = context.preset,
        refreshed = true,
        reloadRequired = false,
    }
end

function Sensei:Execute(preset)
    return self:Import(preset)
end

local function MakeEntry(preset)
    return {
        CanImport = function()
            return Sensei:CanImport(preset)
        end,
        Import = function(_, request)
            return Sensei:Import(preset)
        end,
        Execute = function(_, request)
            return Sensei:Import(preset)
        end,
    }
end

ns.LegacyPresetImports.sensei = MakeEntry("sensei")
ns.LegacyPresetImports.jx = MakeEntry("jx")
