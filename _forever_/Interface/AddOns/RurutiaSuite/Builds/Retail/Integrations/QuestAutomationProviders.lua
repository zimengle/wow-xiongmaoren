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
}

local function Loaded(name)
    local api = _G.C_AddOns and _G.C_AddOns.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(api) ~= "function" then return false end
    local ok, value = pcall(api, name)
    return ok and value == true
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
            return api, key == "ellesAccept" and "autoAccept" or "autoTurnIn", true
        end
    end
end

function Providers:GetState(key)
    local target, field, api = Resolve(key)
    if not target then return {available=false, enabled=false} end
    local ok, value = pcall(function()
        if api then return target.Cfg(field) end
        return target[field]
    end)
    if not ok then return {available=false, enabled=false} end
    return {available=true, enabled=value == true}
end

function Providers:SetEnabled(key, value)
    local target, field, api = Resolve(key)
    if not target then return false, "provider-unavailable" end
    local readOK, before = pcall(function()
        if api then return target.Cfg(field) end
        return rawget(target, field)
    end)
    if not readOK then return false, "provider-read-failed" end
    local desired = value == true
    local ok = pcall(function()
        if api then target.Set(field, desired) else target[field] = desired end
    end)
    local state = self:GetState(key)
    if not ok or not state.available or state.enabled ~= desired then
        if api then pcall(target.Set, field, before) else rawset(target, field, before) end
        return false, "provider-write-failed"
    end
    return true
end

function Providers:IsRelevantAddon(name)
    return name == "RXPGuides" or name == "Questie" or name == "EllesmereUIQuestTracker"
end
