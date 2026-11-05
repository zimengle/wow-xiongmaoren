-- On-demand adapter for the bundled BigWigs profile and boss options.
local _, ns = ...

local Imports = ns.LegacyPresetImports or {}
ns.LegacyPresetImports = Imports
local Adapter = {}
Imports.bigwigs = Adapter

local DATA = Imports.Data and Imports.Data.bigwigs
local TARGET_ADDON = "BigWigs"
local AURA_ADDON = "BigWigs_Plugins"
local REQUEST_ADDON = "RurutiaSuite_Setup"
local PROFILE_PREFIX = "BW2:"
local BOSS_PREFIX = "BWB1:"
local AURA_PREFIX = "RSAURA1:"
local AURA_PROFILE_KEYS = {
    player = true,
    other = true,
    otherPlayerType = true,
    onlyWhenYouAreTank = true,
}

local RS = {
    Print = function(_, message)
        if type(ns.Print) == "function" then pcall(ns.Print, message); return end
        local frame = _G.DEFAULT_CHAT_FRAME
        if frame and type(frame.AddMessage) == "function" then
            frame:AddMessage("|cff77ccff[RSS]|r " .. tostring(message))
        end
    end,
}

local function IsLoaded(name)
    local api = (_G.C_AddOns and _G.C_AddOns.IsAddOnLoaded) or _G.IsAddOnLoaded
    if type(api) ~= "function" then return false end
    local ok, loaded = pcall(api, name)
    return ok and loaded == true
end

local function AddOnExists(name)
    local api = (_G.C_AddOns and _G.C_AddOns.GetAddOnInfo) or _G.GetAddOnInfo
    if type(api) ~= "function" then return false end
    local ok, first = pcall(api, name)
    return ok and first ~= nil
end

local function EnsureAddOnLoaded(name, label)
    if IsLoaded(name) then return true end
    if not AddOnExists(name) then return nil, label .. "未安装" end
    local load = (_G.C_AddOns and _G.C_AddOns.LoadAddOn) or _G.LoadAddOn
    if type(load) ~= "function" then return nil, label .. "加载接口不可用" end
    local ok, loaded, reason = pcall(load, name)
    if not ok then return nil, label .. "加载异常：" .. tostring(loaded) end
    if loaded == false or not IsLoaded(name) then
        return nil, label .. "加载失败：" .. tostring(reason or "未知原因")
    end
    return true
end

local function EnsureAPI()
    local loaded, reason = EnsureAddOnLoaded(TARGET_ADDON, "BigWigs")
    if not loaded then return nil, reason end
    local api = rawget(_G, "BigWigsAPI")
    if type(api) ~= "table" then return nil, "BigWigs 官方配置接口不可用" end
    return api
end

local function IsOfficialString(value, prefix)
    return type(value) == "string" and #value > #prefix and value:sub(1, #prefix) == prefix
        and not value:find("%s")
end

local function CopyAuraValue(current, defaults, depth)
    if depth > 8 then return nil, "光环配置层级异常" end
    if type(defaults) ~= "table" then
        if type(current) ~= type(defaults) then return nil, "光环配置类型异常" end
        return current
    end
    if type(current) ~= "table" then return nil, "光环配置结构异常" end
    local result = {}
    for key, defaultValue in pairs(defaults) do
        local copied, reason = CopyAuraValue(current[key], defaultValue, depth + 1)
        if copied == nil and reason then return nil, reason end
        result[key] = copied
    end
    return result
end

local function Equal(left, right, seen)
    if type(left) ~= type(right) then return false end
    if type(left) ~= "table" then return left == right end
    seen = seen or {}
    if seen[left] then return seen[left] == right end
    seen[left] = right
    for key, value in pairs(left) do if not Equal(value, right[key], seen) then return false end end
    for key in pairs(right) do if left[key] == nil then return false end end
    return true
end

local function DecodeAuraProfile()
    local codec = _G.C_EncodingUtil
    if type(codec) ~= "table" or type(codec.DecodeBase64) ~= "function"
        or type(codec.DecompressString) ~= "function" or type(codec.DeserializeCBOR) ~= "function" then
        return nil, nil, "客户端光环配置解码接口不可用"
    end
    local loaded, loadReason = EnsureAddOnLoaded(AURA_ADDON, "BigWigs 光环插件包")
    if not loaded then return nil, nil, loadReason end
    local payload = DATA.AuraString:sub(#AURA_PREFIX + 1)
    local ok, decoded = pcall(codec.DecodeBase64, payload)
    if not ok or type(decoded) ~= "string" then return nil, nil, "光环配置 Base64 无效" end
    local decompressed
    ok, decompressed = pcall(codec.DecompressString, decoded, 0)
    if not ok or type(decompressed) ~= "string" then return nil, nil, "光环配置解压失败" end
    local value
    ok, value = pcall(codec.DeserializeCBOR, decompressed)
    if not ok or type(value) ~= "table" or tonumber(value.schema) ~= 1
        or value.plugin ~= "Auras" or type(value.profile) ~= "table" then
        return nil, nil, "光环配置数据无效"
    end
    local core = rawget(_G, "BigWigs")
    local plugin = core and core.GetPlugin and core:GetPlugin("Auras", true)
    -- BigWigs 的公开 GetPlugin 只暴露插件声明的 globalFuncs；Auras 默认只公开 db，
    -- defaultDB 是内部实现，不可作为“插件是否可用”的判断条件。
    if not plugin or not plugin.db or type(plugin.db.profile) ~= "table" then
        return nil, nil, "BigWigs 光环插件不可用"
    end
    local replacement = {}
    for key in pairs(AURA_PROFILE_KEYS) do
        if value.profile[key] == nil then return nil, nil, "光环配置缺少字段：" .. key end
        local copied, reason = CopyAuraValue(value.profile[key], value.profile[key], 1)
        if copied == nil and reason then return nil, nil, reason end
        replacement[key] = copied
    end
    return plugin, replacement
end

local function ImportAuraProfile()
    local plugin, replacement, reason = DecodeAuraProfile()
    if not plugin then return false, reason end
    local snapshot = {}
    for key in pairs(AURA_PROFILE_KEYS) do
        local copied, copyReason = CopyAuraValue(plugin.db.profile[key], replacement[key], 1)
        if copied == nil and copyReason then return false, copyReason end
        snapshot[key] = copied
    end
    local ok, failure = pcall(function()
        for key, value in pairs(replacement) do plugin.db.profile[key] = value end
    end)
    local actual = {}
    if ok then
        for key in pairs(AURA_PROFILE_KEYS) do
            local copied, copyReason = CopyAuraValue(plugin.db.profile[key], replacement[key], 1)
            if copied == nil and copyReason then ok, failure = false, copyReason break end
            actual[key] = copied
        end
        if ok and not Equal(actual, replacement) then ok, failure = false, "光环配置写后校验失败" end
    end
    if not ok then
        for key, value in pairs(snapshot) do plugin.db.profile[key] = value end
        return false, tostring(failure)
    end
    local core = rawget(_G, "BigWigs")
    if core and core.SendMessage then core:SendMessage("BigWigs_ProfileUpdate") end
    return true
end

local function ValidateData()
    if type(DATA) ~= "table" or tonumber(DATA.Schema) ~= 1 or DATA.Ready ~= true
        or tonumber(DATA.Revision) == nil or tonumber(DATA.Revision) < 1
        or type(DATA.ProfileName) ~= "string" or #DATA.ProfileName < 3
        or type(DATA.ProfileSHA256) ~= "string" or #DATA.ProfileSHA256 ~= 64
        or type(DATA.BossSHA256) ~= "string" or #DATA.BossSHA256 ~= 64
        or type(DATA.AuraSHA256) ~= "string" or #DATA.AuraSHA256 ~= 64
        or not IsOfficialString(DATA.ProfileString, PROFILE_PREFIX)
        or not IsOfficialString(DATA.BossString, BOSS_PREFIX)
        or not IsOfficialString(DATA.AuraString, AURA_PREFIX) then
        return false, "内置 BigWigs 预设尚未生成或元数据无效"
    end
    return true
end

local function SaveInstallRecord()
    _G.RurutiaSuiteSetupDB = type(_G.RurutiaSuiteSetupDB) == "table" and _G.RurutiaSuiteSetupDB or {}
    _G.RurutiaSuiteSetupDB.bigWigsPreset = {
        schema = 1,
        revision = DATA.Revision,
        profileSHA256 = DATA.ProfileSHA256,
        bossSHA256 = DATA.BossSHA256,
        auraSHA256 = DATA.AuraSHA256,
        profileName = DATA.ProfileName,
    }
end

local function Complete(options, success, reason)
    if type(options.onComplete) == "function" then
        local ok, err = pcall(options.onComplete, success, reason)
        if not ok then RS:Print("|cffff0000BigWigs 完成回调失败：|r" .. tostring(err)) end
    end
end

function Adapter:IsAvailable()
    return IsLoaded(TARGET_ADDON) or AddOnExists(TARGET_ADDON)
end

function Adapter:IsCurrent()
    local record = type(_G.RurutiaSuiteSetupDB) == "table" and _G.RurutiaSuiteSetupDB.bigWigsPreset
    if type(record) ~= "table" or type(DATA) ~= "table" or DATA.Ready ~= true then return false end
    local api = rawget(_G, "BigWigsAPI")
    local active = api and type(api.GetProfileName) == "function" and api.GetProfileName() or nil
    return record.revision == DATA.Revision and record.profileSHA256 == DATA.ProfileSHA256
        and record.bossSHA256 == DATA.BossSHA256 and record.auraSHA256 == DATA.AuraSHA256
        and active == DATA.ProfileName
end

function Adapter:Import(request)
    request = type(request) == "table" and request or {}
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return false, "combat-lockdown"
    end
    local valid, reason = ValidateData()
    if not valid then return false, reason end
    local api
    api, reason = EnsureAPI()
    if not api then
        return false, reason
    end
    if type(api.RegisterProfile) ~= "function" or type(api.ImportBossOptions) ~= "function" then
        return false, "当前 BigWigs 版本不支持官方配置导入"
    end

    local finished, completionSuccess, completionReason = false, false, nil
    local profileHandled, bossHandled = false, false
    local function finish(success, message)
        if finished then return end
        finished = true
        completionSuccess = success == true
        completionReason = message
        if success then
            SaveInstallRecord()
            completionReason = { changed = true, reloadRequired = true, provider = TARGET_ADDON,
                pending = false, revision = DATA.Revision }
        end
        if type(request.onComplete) ~= "function" then
            if success then RS:Print("BigWigs 通用、Boss和光环配置已导入；重载后生效。")
            elseif message then RS:Print("|cffffcc00BigWigs 配置未完成：|r" .. tostring(message)) end
        end
        Complete(request, success, completionReason)
    end
    local function importBoss(accepted)
        if finished or profileHandled then return end
        profileHandled = true
        if accepted ~= true then
            finish(false, "已取消通用配置导入")
            return
        end
        local ok, err = pcall(api.ImportBossOptions, REQUEST_ADDON, DATA.BossString, function(bossAccepted)
            if finished or bossHandled then return end
            bossHandled = true
            if bossAccepted == true then
                local called, auraOK, auraReason = pcall(ImportAuraProfile)
                if called and auraOK then
                    finish(true)
                else
                    finish(false, "光环配置导入失败：" .. tostring(called and auraReason or auraOK))
                end
            else
                finish(false, "已取消 Boss 配置导入")
            end
        end)
        if not ok then finish(false, "Boss 配置导入异常：" .. tostring(err)) end
    end
    local ok, err = pcall(api.RegisterProfile, REQUEST_ADDON, DATA.ProfileString, DATA.ProfileName, importBoss)
    if not ok then
        finish(false, "通用配置导入异常：" .. tostring(err))
    end
    if finished then
        if not completionSuccess then return false, completionReason or "import-failed" end
        return true, completionReason
    end
    if type(request.onComplete) ~= "function" then
        RS:Print("BigWigs 配置导入已启动，请按 BigWigs 提示确认。")
    end
    return true, { changed = false, reloadRequired = false, provider = TARGET_ADDON,
        pending = true, revision = DATA.Revision }
end

return Adapter
