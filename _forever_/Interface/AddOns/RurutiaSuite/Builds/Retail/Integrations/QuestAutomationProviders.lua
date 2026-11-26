local _, ns = ...
if not ns.Build.HasModule("QuestAutomation") then return end

-- Shared Retail/Forever integration. Fixed-size lookups only; no loading,
-- callbacks, polling or retained copies of third-party profiles.
local Providers = {}
ns.QuestAutomationProviders = Providers
Providers.options = {
    {key="rxp", label="RXP自动交接", addon="RXPGuides"},
    {key="questieAccept", label="Questie自动接", addon="Questie"},
    {key="questieTurnIn", label="Questie自动交", addon="Questie"},
    {key="ellesAccept", label="Elles自动接", addon="EllesmereUIQuestTracker"},
    {key="ellesTurnIn", label="Elles自动交", addon="EllesmereUIQuestTracker"},
    {key="polestarAccept", label="北极星自动接", addon="Polestar"},
    {key="polestarTurnIn", label="北极星自动交", addon="Polestar"},
}

local function Loaded(name)
    local api = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(api) ~= "function" then return false end
    local ok, value = pcall(api, name)
    return ok and value == true
end

local function ReadField(target, field)
    return target[field]
end

local function WriteField(target, field, value)
    target[field] = value
end

local function Resolve(key)
    if key == "rxp" then
        if not Loaded("RXPGuides") or not _G.LibStub then return end
        local ok, lib = pcall(_G.LibStub, "AceAddon-3.0", true)
        if not ok or type(lib) ~= "table" or type(lib.GetAddon) ~= "function" then return end
        local found, addon = pcall(lib.GetAddon, lib, "RXPGuides", true)
        local profile = found and type(addon) == "table" and addon.settings and addon.settings.profile
        if type(profile) == "table" then return profile, "enableQuestAutomation" end
    elseif key == "questieAccept" or key == "questieTurnIn" then
        if not Loaded("Questie") then return end
        local addon = _G.Questie
        local profile = type(addon) == "table" and addon.db and addon.db.profile
        if type(profile) ~= "table" then return end
        if key == "questieTurnIn" then return profile, "autocomplete" end
        if type(profile.autoAccept) == "table" then return profile.autoAccept, "enabled" end
    elseif key == "ellesAccept" or key == "ellesTurnIn" then
        if not Loaded("EllesmereUIQuestTracker") then return end
        local api = _G.EllesmereUIQuestTracker
        if type(api) == "table" and type(api.Cfg) == "function" and type(api.Set) == "function" then
            return api, key == "ellesAccept" and "autoAccept" or "autoTurnIn", "Cfg"
        end
    elseif key == "polestarAccept" or key == "polestarTurnIn" then
        if not Loaded("Polestar") then return end
        local api = _G.Polestar
        if type(api) == "table" and type(api.Get) == "function" and type(api.Set) == "function" then
            return api, key == "polestarAccept" and "behavior.autoAccept" or "behavior.autoTurnin", "Get"
        end
    end
end

function Providers:GetState(key)
    local target, field, readMethod = Resolve(key)
    if not target then return {available=false, enabled=false} end
    local ok, value
    if readMethod then
        ok, value = pcall(target[readMethod], field)
    else
        ok, value = pcall(ReadField, target, field)
    end
    if not ok or (readMethod == "Get" and type(value) ~= "boolean") then
        return {available=false, enabled=false}
    end
    return {available=true, enabled=value == true}
end

function Providers:SetEnabled(key, value)
    local target, field, readMethod = Resolve(key)
    if not target then return false, "provider-unavailable" end
    local readOK, before
    if readMethod then
        readOK, before = pcall(target[readMethod], field)
    else
        readOK, before = pcall(rawget, target, field)
    end
    if not readOK then return false, "provider-read-failed" end
    if readMethod == "Get" and type(before) ~= "boolean" then return false, "provider-unavailable" end
    local desired = value == true
    local ok
    if readMethod then
        ok = pcall(target.Set, field, desired)
    else
        ok = pcall(WriteField, target, field, desired)
    end
    local state = self:GetState(key)
    if not ok or not state.available or state.enabled ~= desired then
        if readMethod then
            pcall(target.Set, field, before)
        else
            pcall(rawset, target, field, before)
        end
        return false, "provider-write-failed"
    end
    return true
end
