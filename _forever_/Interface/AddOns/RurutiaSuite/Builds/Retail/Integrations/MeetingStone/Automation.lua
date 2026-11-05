-- 文件职责：在统一 PLAYER_LOGIN 自动化链中同步集合石悬浮窗；受限登录放弃同步，不干预队伍列表。

local _, ns = ...

if not (ns.Build and ns.Build.IsFamily and ns.Build.IsFamily("retail")
    and ns.Automation and type(ns.Automation.Register) == "function") then return end

local Integration = {
    addonName = "MeetingStone",
    floatingPanelSetting = "panel",
}

local function IsAddOnLoaded(addonName)
    local addons = _G.C_AddOns
    local callback = type(addons) == "table" and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(callback) ~= "function" then return false end
    local ok, loadedOrLoading, fullyLoaded = pcall(callback, addonName)
    return ok and (fullyLoaded == true or loadedOrLoading == true)
end

local function IsAddOnAvailable(addonName)
    local addons = _G.C_AddOns
    local callback = type(addons) == "table" and addons.GetAddOnInfo or _G.GetAddOnInfo
    if type(callback) ~= "function" then return false end
    local result = { pcall(callback, addonName) }
    if result[1] ~= true then return false end
    if type(result[2]) == "table" then
        local info = result[2]
        return type(info.name) == "string" and info.name ~= ""
            and (info.loadable ~= false or info.reason == "DEMAND_LOADED")
    end
    return type(result[2]) == "string" and result[2] ~= ""
        and (result[5] ~= false or result[6] == "DEMAND_LOADED")
end

local function GetProfile()
    if not IsAddOnLoaded(Integration.addonName) then
        return nil, IsAddOnAvailable(Integration.addonName)
            and "addon_not_loaded" or "addon_unavailable"
    end
    local libStub = _G.LibStub
    if type(libStub) ~= "table" or type(libStub.GetLibrary) ~= "function" then
        return nil, "library_registry_unavailable"
    end
    local libraryOK, addonRegistry = pcall(libStub.GetLibrary, libStub, "AceAddon-3.0", true)
    if not libraryOK or type(addonRegistry) ~= "table"
        or type(addonRegistry.GetAddon) ~= "function" then
        return nil, "addon_registry_unavailable"
    end
    local addonOK, addon = pcall(addonRegistry.GetAddon, addonRegistry, Integration.addonName, true)
    if not addonOK or type(addon) ~= "table" or type(addon.GetModule) ~= "function" then
        return nil, "addon_object_unavailable"
    end
    local profileOK, profile = pcall(addon.GetModule, addon, "Profile", true)
    if not profileOK or type(profile) ~= "table" then return nil, "profile_unavailable" end
    return profile
end

-- Reuse the legacy namespace through the native DB; keep one settings owner.
function Integration:GetSettings()
    if not (ns.DB and type(ns.DB.RegisterNamespace) == "function") then return nil end
    local db = ns.DB:RegisterNamespace("MeetingStoneEnhancements", {
        profile = { showFloatingWindow = false },
    })
    return db and db.profile
end

local function IsInCombat()
    return type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() == true
end

local function IsChallengeActive()
    local api = _G.C_ChallengeMode
    return type(api) == "table" and type(api.IsChallengeModeActive) == "function"
        and api.IsChallengeModeActive() == true
end

function Integration:Apply(manual)
    -- Check before provider lookup: a restricted login must not wait for a late addon.
    if manual ~= true and (self.startupSkipped or IsInCombat() or IsChallengeActive()) then
        self.startupSkipped = true
        return false, "startup_skipped"
    end
    if IsInCombat() then return false, "combat_lockdown" end
    local profile, reason = GetProfile()
    if not profile then return false, reason end
    local cdb = profile.cdb
    local settings = type(cdb) == "table" and type(cdb.profile) == "table"
        and cdb.profile.settings or nil
    if type(profile.SetSetting) ~= "function" then return false, "set_setting_unavailable" end
    if type(settings) ~= "table" then return false, "character_settings_unavailable" end
    local ownSettings = self:GetSettings()
    if not ownSettings then return false, "settings_unavailable" end
    local value = ownSettings.showFloatingWindow == true
    local ok = pcall(profile.SetSetting, profile, self.floatingPanelSetting, value)
    if not ok then return false, "panel_write_failed" end
    if settings[self.floatingPanelSetting] ~= value then return false, "provider_write_not_applied" end
    return true, "applied"
end

ns.MeetingStoneAutomationIntegration = Integration
ns.Automation:Register("meetingstone", function()
    return Integration:Apply()
end, { addonName = Integration.addonName })
