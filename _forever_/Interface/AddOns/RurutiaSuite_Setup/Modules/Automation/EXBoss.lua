local _, ns = ...

local EXBoss = {}
ns.EXBossAutomation = EXBoss
local TARGET_ADDON = "EXBOSS-RURUTIA"
local TARGET_PACK = "露露缇娅"

local function IsLoaded(name)
    local addons = _G.C_AddOns
    local isLoaded = type(addons) == "table" and addons.IsAddOnLoaded or _G.IsAddOnLoaded
    if type(isLoaded) ~= "function" then return false end
    local checked, present = pcall(isLoaded, name)
    return checked and present and true or false
end

local function CurrentGlobal()
    local db = _G.EXBOSS12S2
    local voice = type(db) == "table" and db.voice
    return type(voice) == "table" and type(voice.global) == "table" and voice.global or nil
end

local function ReadLocale(exboss)
    if type(exboss.Locale) == "table" and type(exboss.Locale.GetCurrentLocale) == "function" then
        return exboss.Locale:GetCurrentLocale()
    end
    if type(exboss.GetEffectiveLocale) == "function" and type(exboss.GetLocaleMode) == "function" then
        return exboss:GetEffectiveLocale(exboss:GetLocaleMode())
    end
    if type(_G.GetLocale) == "function" then return _G.GetLocale() end
end

function EXBoss:Apply()
    local settings = ns.DB and ns.DB.global and ns.DB.global.automation
    if not settings or settings.enabled == false or settings.exbossVoice ~= true then return true, "disabled" end
    if type(_G.InCombatLockdown) ~= "function" then return false, "combat-api-unavailable" end
    local combatOK, combat = pcall(_G.InCombatLockdown)
    if not combatOK then return false, "combat-api-unavailable" end
    if combat then
        return false, "combat-pending"
    end
    if not IsLoaded("EXBoss") or not IsLoaded(TARGET_ADDON) then
        return false, "ADDON_NOT_LOADED"
    end
    local exboss = _G.ExBoss
    local voice = type(exboss) == "table" and exboss.Voice
    local registry = type(voice) == "table" and voice.PackRegistry
    local engine = type(voice) == "table" and voice.Engine
    if type(registry) ~= "table" or type(registry.GetPack) ~= "function"
        or type(engine) ~= "table" or type(engine.InvalidateLabelCache) ~= "function"
        or type(engine.ApplyEventOverridesToAPI) ~= "function" then
        return false, "voice-api-unavailable"
    end
    -- GetPack is a plain function; Engine APIs are methods.
    local registered, pack = pcall(registry.GetPack, TARGET_PACK)
    if not registered or type(pack) ~= "table" or pack.addon ~= TARGET_ADDON or pack.display ~= TARGET_PACK then
        return false, "voice-pack-not-registered"
    end
    local global = CurrentGlobal()
    if not global then return false, "voice-settings-unavailable" end
    local localeOK, locale = pcall(ReadLocale, exboss)
    if not localeOK or type(locale) ~= "string" or locale == "" then return false, "locale-unavailable" end
    locale = locale:gsub("%s+", "")
    local english = locale == "enUS" or locale == "enGB"
    if type(_G.GetInstanceInfo) ~= "function" then return false, "instance-api-unavailable" end
    local instanceOK, _, instanceType = pcall(_G.GetInstanceInfo)
    if not instanceOK or type(instanceType) ~= "string" then return false, "instance-api-unavailable" end
    local applyOverrides = instanceType == "party" or instanceType == "raid"
    if global.selectedVoicePack == TARGET_PACK and global.voicePackUserSelected == true
        and (not english or global.allowNonEnglishVoicePackOnEnglishLocale == true) then
        return true, "unchanged"
    end
    local oldPack, oldSelected, oldAllow = global.selectedVoicePack, global.voicePackUserSelected,
        global.allowNonEnglishVoicePackOnEnglishLocale
    local function Refresh()
        local ok, result = pcall(engine.InvalidateLabelCache, engine)
        -- InvalidateLabelCache has no return value; overrides must explicitly succeed.
        if not ok or result == false then return false, "voice-cache-refresh-failed" end
        if applyOverrides then
            ok, result = pcall(engine.ApplyEventOverridesToAPI, engine)
            if not ok or result ~= true then return false, "voice-overrides-refresh-failed" end
        end
        return true
    end
    global.selectedVoicePack = TARGET_PACK
    global.voicePackUserSelected = true
    if english then global.allowNonEnglishVoicePackOnEnglishLocale = true end
    local success, reason = Refresh()
    if success and (CurrentGlobal() ~= global or global.selectedVoicePack ~= TARGET_PACK
        or global.voicePackUserSelected ~= true
        or (english and global.allowNonEnglishVoicePackOnEnglishLocale ~= true)) then
        success, reason = false, "voice-pack-readback-failed"
    end
    if not success then
        global.selectedVoicePack, global.voicePackUserSelected = oldPack, oldSelected
        global.allowNonEnglishVoicePackOnEnglishLocale = oldAllow
        local restored = Refresh()
        if not restored or CurrentGlobal() ~= global or global.selectedVoicePack ~= oldPack
            or global.voicePackUserSelected ~= oldSelected
            or global.allowNonEnglishVoicePackOnEnglishLocale ~= oldAllow then
            -- Retain our saved fields even when EXBoss cannot restore its runtime.
            global.selectedVoicePack, global.voicePackUserSelected = oldPack, oldSelected
            global.allowNonEnglishVoicePackOnEnglishLocale = oldAllow
            return false, reason .. ":rollback-failed"
        end
        return false, reason
    end
    return true, "applied"
end

return EXBoss
