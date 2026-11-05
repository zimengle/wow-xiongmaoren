-- Lazy transactional adapter for the bundled EXWINDTOOLS account preset.
local _, ns = ...

local Imports = ns.LegacyPresetImports or {}
ns.LegacyPresetImports = Imports
local Adapter = {}
Imports.exwind = Adapter

local SOURCE = Imports.Data and Imports.Data.exwind
local DATA
local TARGET_ADDON = "ExwindTools"
local TARGET_DB_VERSION = 1
local VARIANT_DEFAULT = "default"
local VARIANT_NDUI = "ndui"
local VARIANT_ELVUI = "elvui"
local MAX_DEPTH, MAX_VALUES = 40, 50000

local function Copy(value, seen, state, depth)
    local kind = type(value)
    if kind == "nil" or kind == "boolean" or kind == "string" then return value end
    if kind == "number" then
        if value ~= value or value == math.huge or value == -math.huge then return nil, "非法数字" end
        return value
    end
    if kind ~= "table" then return nil, "不支持的配置类型：" .. kind end
    state = state or { count = 0 }
    depth = depth or 0
    if depth > MAX_DEPTH then return nil, "配置嵌套层级过深" end
    state.count = state.count + 1
    if state.count > MAX_VALUES then return nil, "配置数据量超过限制" end
    seen = seen or {}
    if seen[value] then return nil, "配置包含循环引用" end
    seen[value] = true
    local out = {}
    for key, child in pairs(value) do
        if type(key) ~= "string" and (type(key) ~= "number" or key ~= math.floor(key)) then
            return nil, "配置包含非法键"
        end
        local copied, reason = Copy(child, seen, state, depth + 1)
        if reason then return nil, reason end
        out[key] = copied
    end
    seen[value] = nil
    return out
end

local function Equal(left, right, seen)
    if type(left) ~= type(right) then return false end
    if type(left) ~= "table" then return left == right end
    seen = seen or {}
    if seen[left] then return seen[left] == right end
    seen[left] = right
    for key, value in pairs(left) do
        if not Equal(value, right[key], seen) then return false end
    end
    for key in pairs(right) do
        if left[key] == nil then return false end
    end
    return true
end

local function RestoreInPlace(target, snapshot)
    for key in pairs(target) do
        if snapshot[key] == nil then target[key] = nil end
    end
    for key, value in pairs(snapshot) do
        if type(value) == "table" and type(target[key]) == "table" then
            RestoreInPlace(target[key], value)
        else
            target[key] = Copy(value)
        end
    end
end

local function IsLoaded(name)
    local api = (_G.C_AddOns and _G.C_AddOns.IsAddOnLoaded) or _G.IsAddOnLoaded
    if type(api) ~= "function" then return false end
    local ok, loaded = pcall(api, name)
    return ok and loaded == true
end

local function DecodeData()
    if DATA then return DATA end
    if type(SOURCE) ~= "table" or tonumber(SOURCE.Schema) ~= 1
        or type(SOURCE.LuaSource) ~= "string" or tonumber(SOURCE.SnapshotBytes) ~= #SOURCE.LuaSource
        or type(SOURCE.SnapshotSHA256) ~= "string" or #SOURCE.SnapshotSHA256 ~= 64 then
        return nil, "内置 EXWINDTOOLS 快照元数据无效"
    end
    if type(loadstring) ~= "function" or type(setfenv) ~= "function" then
        return nil, "客户端不支持安全解析 EXWINDTOOLS 快照"
    end
    local chunk, reason = loadstring(SOURCE.LuaSource, "@RSS_EXWINDTOOLS_SNAPSHOT")
    if not chunk then return nil, "EXWINDTOOLS 快照语法无效：" .. tostring(reason) end
    setfenv(chunk, {})
    local captured = {}
    local ok, failure = pcall(chunk, nil, captured)
    if not ok then return nil, "EXWINDTOOLS 快照解析失败：" .. tostring(failure) end
    local decoded = captured.RSS_Data and captured.RSS_Data.ExwindTools
    if type(decoded) ~= "table" then return nil, "EXWINDTOOLS 快照缺少预设数据" end
    DATA = decoded
    return DATA
end

local function GetPresetVariant()
    local switcher = ns.ProfileSwitcher
    if type(switcher) ~= "table" or type(switcher.Inspect) ~= "function" then
        return nil, "界面主体检测不可用"
    end
    local called, inspected, status = pcall(switcher.Inspect, switcher)
    if not called then return nil, "界面主体检测失败" end
    if inspected ~= true then
        if status == "no supported UI profile provider is available" then return VARIANT_DEFAULT end
        return nil, tostring(status or "界面主体检测失败")
    end
    if status.provider == "ndui" then return VARIANT_NDUI end
    if status.provider == "elvui" then return VARIANT_ELVUI end
    return VARIANT_DEFAULT
end

local function AddOnExists(name)
    local api = (_G.C_AddOns and _G.C_AddOns.GetAddOnInfo) or _G.GetAddOnInfo
    if type(api) ~= "function" then return false end
    local ok, first = pcall(api, name)
    return ok and first ~= nil
end

local function EnsureLoaded()
    if IsLoaded(TARGET_ADDON) then return true end
    if not AddOnExists(TARGET_ADDON) then return false, "未安装 EXWINDTOOLS" end
    local api = (_G.C_AddOns and _G.C_AddOns.LoadAddOn) or _G.LoadAddOn
    if type(api) ~= "function" then return false, "EXWINDTOOLS 加载接口不可用" end
    local ok, loaded, reason = pcall(api, TARGET_ADDON)
    if not ok then return false, "EXWINDTOOLS 加载异常：" .. tostring(loaded) end
    if loaded == false or not IsLoaded(TARGET_ADDON) then
        return false, "EXWINDTOOLS 加载失败：" .. tostring(reason or "未知原因")
    end
    return true
end

local function ValidateData()
    local decoded, decodeReason = DecodeData()
    if not decoded then return false, decodeReason end
    if type(DATA) ~= "table" or tonumber(DATA.Schema) ~= 2
        or type(DATA.SourceSHA256) ~= "string" or #DATA.SourceSHA256 ~= 64
        or tonumber(DATA.SourceBytes) == nil or tonumber(DATA.ModuleCount) == nil
        or tonumber(DATA.LoadStateCount) == nil or type(DATA.LoadByKey) ~= "table"
        or type(DATA.ModuleDB) ~= "table" then
        return false, "内置 EXWINDTOOLS 预设元数据无效"
    end
    local count = 0
    for moduleKey, values in pairs(DATA.ModuleDB) do
        if type(moduleKey) ~= "string" or type(values) ~= "table"
            or not (moduleKey:match("^ExTools%.") or moduleKey:match("^ExClass%.") or moduleKey:match("^ExM%+") or moduleKey:match("^ExBoss%.")) then
            return false, "内置 EXWINDTOOLS 模块数据无效"
        end
        count = count + 1
    end
    if count ~= tonumber(DATA.ModuleCount) then return false, "内置 EXWINDTOOLS 模块数量不一致" end
    count = 0
    for moduleKey, enabled in pairs(DATA.LoadByKey) do
        if type(moduleKey) ~= "string" or type(enabled) ~= "boolean"
            or not (moduleKey:match("^ExTools%.") or moduleKey:match("^ExClass%.") or moduleKey:match("^ExM%+") or moduleKey:match("^ExBoss%.")) then
            return false, "内置 EXWINDTOOLS 模块启停数据无效"
        end
        count = count + 1
    end
    if count ~= tonumber(DATA.LoadStateCount) then return false, "内置 EXWINDTOOLS 模块启停数量不一致" end
    local miniTools = DATA.ModuleDB["ExTools.MiniTools"]
    if type(miniTools) ~= "table" or type(miniTools.MerchantExpansion) ~= "boolean" then
        return false, "内置 EXWINDTOOLS 商人界面扩展配置无效"
    end
    local copied, reason = Copy(DATA.ModuleDB)
    if not copied then return false, reason end
    copied, reason = Copy(DATA.LoadByKey)
    if not copied then return false, reason end
    return true
end

local function BuildPreset(variant)
    local replacement, reason = Copy(DATA and DATA.ModuleDB)
    if not replacement then return nil, nil, reason end
    local loadByKey
    loadByKey, reason = Copy(DATA and DATA.LoadByKey)
    if not loadByKey then return nil, nil, reason end
    if variant == VARIANT_NDUI or variant == VARIANT_ELVUI then
        local miniTools = replacement["ExTools.MiniTools"]
        if type(miniTools) ~= "table" or type(miniTools.MerchantExpansion) ~= "boolean" then
            return nil, nil, "商人界面扩展配置无效"
        end
        miniTools.MerchantExpansion = false
    end
    return replacement, loadByKey
end

local function SaveRecord(variant, replacement)
    _G.RurutiaSuiteSetupDB = type(_G.RurutiaSuiteSetupDB) == "table" and _G.RurutiaSuiteSetupDB or {}
    _G.RurutiaSuiteSetupDB.exwindToolsPreset = {
        schema = 1,
        revision = DATA.Revision,
        sourceSHA256 = DATA.SourceSHA256,
        sourceBytes = DATA.SourceBytes,
        moduleCount = DATA.ModuleCount,
        loadStateCount = DATA.LoadStateCount,
        variant = variant,
        merchantExpansion = replacement["ExTools.MiniTools"].MerchantExpansion,
    }
end

function Adapter:IsAvailable()
    return IsLoaded(TARGET_ADDON) or AddOnExists(TARGET_ADDON)
end

function Adapter:IsCurrent()
    if not IsLoaded(TARGET_ADDON) then return false end
    local valid = ValidateData()
    if not valid then return false end
    local root = rawget(_G, "EXTOOLS12S2")
    local variant = GetPresetVariant()
    if not variant then return false end
    local replacement, loadByKey = BuildPreset(variant)
    return type(root) == "table" and tonumber(root.DBVersion) == TARGET_DB_VERSION
        and type(root.ModuleDB) == "table" and type(root.LoadByKey) == "table"
        and replacement ~= nil and loadByKey ~= nil
        and Equal(root.ModuleDB, replacement) and Equal(root.LoadByKey, loadByKey)
end

function Adapter:Import(request)
    request = type(request) == "table" and request or {}
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return false, "combat-lockdown"
    end
    local valid, reason = ValidateData()
    if not valid then return false, reason end
    local loaded
    loaded, reason = EnsureLoaded()
    if not loaded then
        if request.command == "all" and reason == "未安装 EXWINDTOOLS" then
            return true, { changed = false, reloadRequired = false, skipped = true,
                provider = TARGET_ADDON, reason = "addon-not-installed" }
        end
        return false, reason
    end
    local root = rawget(_G, "EXTOOLS12S2")
    if type(root) ~= "table" or tonumber(root.DBVersion) ~= TARGET_DB_VERSION
        or type(root.ModuleDB) ~= "table" or type(root.LoadByKey) ~= "table" then
        return false, "EXWINDTOOLS 配置结构不兼容"
    end
    local variant
    variant, reason = GetPresetVariant()
    if not variant then return false, reason end
    local replacement, loadByKey
    replacement, loadByKey, reason = BuildPreset(variant)
    if not replacement then return false, "EXWINDTOOLS 预设复制失败：" .. tostring(reason) end
    if Equal(root.ModuleDB, replacement) and Equal(root.LoadByKey, loadByKey) then
        SaveRecord(variant, replacement)
        return true, { changed = false, reloadRequired = false, reused = true,
            provider = TARGET_ADDON, variant = variant, moduleCount = DATA.ModuleCount }
    end
    local moduleSnapshot
    moduleSnapshot, reason = Copy(root.ModuleDB)
    if not moduleSnapshot then return false, "EXWINDTOOLS 配置快照失败：" .. tostring(reason) end
    local loadStateSnapshot
    loadStateSnapshot, reason = Copy(root.LoadByKey)
    if not loadStateSnapshot then return false, "EXWINDTOOLS 模块启停快照失败：" .. tostring(reason) end
    local called, failure = pcall(function()
        RestoreInPlace(root.ModuleDB, replacement)
        RestoreInPlace(root.LoadByKey, loadByKey)
    end)
    if not called or not Equal(root.ModuleDB, replacement) or not Equal(root.LoadByKey, loadByKey) then
        local rolledBack, verified = pcall(function()
            RestoreInPlace(root.ModuleDB, moduleSnapshot)
            RestoreInPlace(root.LoadByKey, loadStateSnapshot)
            return Equal(root.ModuleDB, moduleSnapshot) and Equal(root.LoadByKey, loadStateSnapshot)
        end)
        if not rolledBack or not verified then return false, "rollback-failed" end
        reason = not called and tostring(failure) or "写后校验失败"
        return false, reason
    end
    SaveRecord(variant, replacement)
    return true, { changed = true, reloadRequired = true, provider = TARGET_ADDON,
        variant = variant, moduleCount = DATA.ModuleCount, loadStateCount = DATA.LoadStateCount }
end

return Adapter
