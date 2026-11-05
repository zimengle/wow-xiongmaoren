local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")) then return end

local Factory = ns.CVarSettingsDataFactory
if type(Factory) ~= "table" then
    error("CVarSettings Data must load before the Retail adapter", 2)
end

local Adapter = {
    family = "retail",
    isWoW12 = true,
    isWrath = false,
    supportsLossOfControl = true,
    supportsAddonProfiler = false,
    supportsSimplifiedNameplates = true,
}

local SIMPLIFIED_NAMEPLATES_CVAR = "nameplateSimplifiedTypes"
local SIMPLIFIED_NAMEPLATES_FIRST_BIT = 1
local SIMPLIFIED_NAMEPLATES_LAST_BIT = 4

function Adapter:IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() and true or false
end

function Adapter:IsLoggedIn()
    return type(_G.IsLoggedIn) == "function" and _G.IsLoggedIn() and true or false
end

function Adapter:ResolveCVarName(cvar)
    local cvarAPI = _G.C_CVar
    if cvarAPI and type(cvarAPI.GetCVar) == "function" then
        local candidate = tostring(cvar) .. "_v2"
        local ok, value = pcall(cvarAPI.GetCVar, candidate)
        if ok and value ~= nil then return candidate end
    end
    return cvar
end

function Adapter:GetCVar(cvar)
    if type(_G.GetCVar) ~= "function" then return nil end
    local ok, value = pcall(_G.GetCVar, self:ResolveCVarName(cvar))
    if ok then return value end
    return nil
end

function Adapter:CVarExists(cvar)
    return self:GetCVar(cvar) ~= nil
end

function Adapter:RefreshCombatText(changedCVar)
    if type(changedCVar) ~= "string" then return false end
    if not string.match(changedCVar, "^floatingCombatText")
        and changedCVar ~= "enableFloatingCombatText" then
        return false
    end
    if type(_G.CombatText_UpdateDisplayedMessages) == "function" then
        pcall(_G.CombatText_UpdateDisplayedMessages)
    end
    local cvarAPI = _G.C_CVar
    if cvarAPI and type(cvarAPI.GetCVarBool) == "function"
        and cvarAPI.GetCVarBool("enableFloatingCombatText")
        and type(_G.SetCVar) == "function" then
        pcall(_G.SetCVar, "enableFloatingCombatText", "0")
        pcall(_G.SetCVar, "enableFloatingCombatText", "1")
    end
    return true
end

function Adapter:SetCVar(cvar, value)
    if type(_G.SetCVar) ~= "function" then return false end
    local ok, result = pcall(_G.SetCVar, self:ResolveCVarName(cvar), tostring(value))
    if ok and result ~= nil then
        self:RefreshCombatText(cvar)
        return true
    end
    return false
end

function Adapter:IsSimplifiedNameplatesSupported()
    local cvarAPI = _G.C_CVar
    return cvarAPI
        and type(cvarAPI.GetCVarBitfield) == "function"
        and type(cvarAPI.SetCVarBitfield) == "function"
        and type(cvarAPI.GetCVarDefault) == "function"
        and type(cvarAPI.SetCVar) == "function"
        or false
end

function Adapter:GetSimplifiedNameplatesDisabled()
    if not self:IsSimplifiedNameplatesSupported() then return nil end
    local index
    for index = SIMPLIFIED_NAMEPLATES_FIRST_BIT, SIMPLIFIED_NAMEPLATES_LAST_BIT do
        local ok, value = pcall(_G.C_CVar.GetCVarBitfield, SIMPLIFIED_NAMEPLATES_CVAR, index)
        if not ok or type(value) ~= "boolean" then return nil end
        if value then return false end
    end
    return true
end

function Adapter:SetSimplifiedNameplatesDisabled(disabled)
    if not self:IsSimplifiedNameplatesSupported() then return false end
    local cvarAPI = _G.C_CVar
    if not disabled then
        local okDefault, defaultValue = pcall(cvarAPI.GetCVarDefault, SIMPLIFIED_NAMEPLATES_CVAR)
        if not okDefault or type(defaultValue) ~= "string" then return false end
        local okSet, result = pcall(cvarAPI.SetCVar, SIMPLIFIED_NAMEPLATES_CVAR, defaultValue)
        return okSet and result == true
    end

    local previous = {}
    local index
    for index = SIMPLIFIED_NAMEPLATES_FIRST_BIT, SIMPLIFIED_NAMEPLATES_LAST_BIT do
        local ok, value = pcall(cvarAPI.GetCVarBitfield, SIMPLIFIED_NAMEPLATES_CVAR, index)
        if not ok or type(value) ~= "boolean" then return false end
        previous[index] = value
    end
    for index = SIMPLIFIED_NAMEPLATES_FIRST_BIT, SIMPLIFIED_NAMEPLATES_LAST_BIT do
        local ok, result = pcall(cvarAPI.SetCVarBitfield, SIMPLIFIED_NAMEPLATES_CVAR, index, false)
        if not ok or result ~= true then
            local rollbackIndex
            for rollbackIndex = SIMPLIFIED_NAMEPLATES_FIRST_BIT, index do
                pcall(cvarAPI.SetCVarBitfield, SIMPLIFIED_NAMEPLATES_CVAR, rollbackIndex, previous[rollbackIndex])
            end
            return false
        end
    end
    return self:GetSimplifiedNameplatesDisabled() == true
end


-- Exact shared CVar: probe APIs on this client, never infer support from its flavor.
function Adapter:GetDeathRecapRetention()
    local api = _G.C_CVar
    local getter = api and api.GetCVar
    if type(getter) ~= "function" then getter = _G.GetCVar end
    if type(getter) ~= "function" then return nil end
    local ok, value = pcall(getter, "combatLogRetentionTime")
    if ok then return value end
    return nil
end

function Adapter:CanWriteDeathRecapRetention()
    local api = _G.C_CVar
    return (api and type(api.SetCVar) == "function") or type(_G.SetCVar) == "function"
end

function Adapter:SetDeathRecapRetention()
    if self:IsInCombat() or self:GetDeathRecapRetention() == nil then return false end
    local api = _G.C_CVar
    local setter = api and api.SetCVar
    if type(setter) ~= "function" then setter = _G.SetCVar end
    if type(setter) ~= "function" then return false end
    local ok, result = pcall(setter, "combatLogRetentionTime", "300")
    -- Legacy setters may return nil on success. An explicit false is a failure.
    return ok and result ~= false and tonumber(self:GetDeathRecapRetention()) == 300
end

function Adapter:IsSettingSupported(cvar)
    if cvar == "lossOfControl" or cvar == "spellActivationOverlayOpacity" then
        return ns.CVarSettingsData and ns.CVarSettingsData.metadata[cvar] ~= nil
    end
    return true
end

function Adapter:DisableAddonProfiler()
    return false
end

ns.CVarSettingsAdapter = Adapter
ns.CVarSettingsData = Factory:Build(Adapter)
