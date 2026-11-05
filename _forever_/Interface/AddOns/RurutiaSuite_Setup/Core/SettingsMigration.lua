-- 文件职责：首次迁入旧 RS 设置时保留有效行为；新装默认与已迁入后的选择不被覆盖。
local _, ns = ...
local Migration = {}
ns.SettingsMigration = Migration

local VERSION = 4
local BOOLEAN_MAP = {
    autoSwitchLayout = { "automation", "editModeLayout", true },
    autoSwitchSenseiBrewmaster = { "automation", "senseiBrewmaster", true },
    senseiSwitchNotify = { "automation", "senseiNotify", false },
    autoSwitchExBossVoice = { "automation", "exbossVoice", true },
    autoSwitchDFProfile = { "automation", "dandersProfile", true },
    autoSwitchDFProfileMythicOnly = { "automation", "dandersMythicOnly", true },
    showImportPresetButton = { "gameMenu", "enabled", true },
}

local function ReadLegacySetup()
    local host = _G.RurutiaSuite
    local profile = type(host) == "table" and type(host.DB) == "table" and host.DB.profile or nil
    if type(profile) ~= "table" then return nil end
    local setup = rawget(profile, "setup")
    if type(setup) == "table" then return setup end
    local global = host.DB.global
    if type(global) == "table" and rawget(global, "setupOrigin") == "legacy-retail" then
        return {} -- AceDB 可剥离整个默认 setup 表；不把它误认为新安装。
    end
    return nil
end

-- 独立于设置开关版本：v4 已迁过的账号也需要补齐旧 Sensei 槽。
local function MigrateSenseiSlots(global, migration)
    if migration.senseiSlotsVersion == 1 then return false end
    local legacy = _G.RurutiaSuiteSetupDB
    local source = type(legacy) == "table" and rawget(legacy, "sensei")
    local changed = false
    if type(source) == "table" then
        global.automationState = global.automationState or {}
        global.automationState.sensei = global.automationState.sensei or {}
        local target = global.automationState.sensei
        for _, key in ipairs({ "defaultProfile", "brewmasterProfile" }) do
            local value = rawget(source, key)
            if rawget(target, key) == nil and (type(value) == "string" or value == false) then
                target[key] = value
                changed = true
            end
        end
    end
    migration.senseiSlotsVersion = 1
    return changed
end

function Migration:Run()
    local global = ns.DB and ns.DB.global
    if type(global) ~= "table" then return false, "RSS database is unavailable" end
    local migration = global.migration
    if type(migration) ~= "table" then return false, "RSS migration database is unavailable" end
    local changed = MigrateSenseiSlots(global, migration)
    -- Previous 4.x defaults for these options were false and may have been
    -- stripped on save. Preserve that effective choice on existing installs;
    -- only new installs / first legacy import receive the aligned defaults.
    if migration.automationDefaultsVersion ~= 1 then
        if (tonumber(migration.legacySetupVersion) or 0) >= VERSION then
            local settings=global.automation
            if type(settings)=="table" then
                for _, key in ipairs({"senseiBrewmaster","exbossVoice","dandersProfile"}) do
                    if rawget(settings,key)==nil then settings[key]=false end
                end
            end
        end
        migration.automationDefaultsVersion=1
        changed=true
    end
    if (tonumber(migration.legacySetupVersion) or 0) >= VERSION then
        return true, { changed = changed, version = VERSION }
    end

    local setup = ReadLegacySetup()
    if setup then
        local legacyKey, target
        for legacyKey, target in pairs(BOOLEAN_MAP) do
            local value = rawget(setup, legacyKey)
            -- 只采用固定旧版默认，不执行任意旧表的 __index。
            if value == nil then value = target[3] end
            if type(value) == "boolean" then
                global[target[1]][target[2]] = value
                changed = true
            end
        end
        local dismissed = rawget(setup, "setupHintDismissed")
        if type(dismissed) == "boolean" then
            global.health.reminderEnabled = not dismissed
            changed = true
        end
        local ignored = rawget(setup, "setupCheckIgnored")
        if type(ignored) == "table" then
            local target = rawget(global.health, "ignoredCategories")
            if type(target) ~= "table" then
                target = {}
                rawset(global.health, "ignoredCategories", target)
            end
            for _, key in ipairs({ "editMode", "uiLayout", "sensei", "ellesQuickSignup" }) do
                if rawget(ignored, key) == true then
                    target[key] = true
                    changed = true
                end
            end
        end
        -- 旧版冷却检查是单独开关，默认关闭；不读取旧 ignored.cooldown。
        -- 仅首次迁入时保留旧版的有效行为，不重跑已迁移候选以覆盖后续选择。
        local categories = global.health.ignoredCategories
        if type(categories) ~= "table" then
            categories = {}
            global.health.ignoredCategories = categories
        end
        categories.cooldown = rawget(setup, "setupCheckCooldown") ~= true
        changed = true
        local activation = rawget(setup, "setupCheckActivation")
        if type(activation) == "boolean" then
            global.health.activationReminder = activation
            changed = true
        end
    end
    migration.legacySetupVersion = VERSION
    return true, { changed = changed, version = VERSION }
end

return Migration
