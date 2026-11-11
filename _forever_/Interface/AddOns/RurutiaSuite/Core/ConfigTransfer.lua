local _, ns = ...

-- RS 自有配置分享边界：只处理当前配置档的模块设置差异，不接触缓存、
-- 版本元数据、第三方插件数据库或 RSS 数据库。
local ConfigTransfer = {}
ns.ConfigTransfer = ConfigTransfer

local PREFIX = "!RSS:3:"
local LEGACY_PREFIX = "!RSS:2:"
local MAX_TEXT = 262144
local MAX_DEPTH = 32
local MAX_ITEMS = 50000
local MAX_STRING = 32768
local APPEARANCE_SCHEMA = {
    mainWindowOpacity = "number",
    containerOpacity = "number",
    borderAlpha = "number",
    interfaceFont = "string",
    chatBarFont = "string",
    tooltipFont = "string",
    timeFont = "string",
    combatTimerFont = "string",
    experienceBarFont = "string",
    celestialBarFont = "string",
    magePortalFont = "string",
}
-- 协议白名单必须显式维护；新增模块/字段不会自动进入分享字符串。
-- fields 仅列玩家设置的 profile 顶层叶/容器，迁移标志与运行时状态不在表内。
local MODULE_SCHEMA = {
    AddonProfile = { fields = { enabled=true, showSwitchButton=true, strictWhitelist=true,
        currentId=true, overrides=true, custom=true, position=true }, open = { overrides=true, custom=true } },
    AutoMark = { fields = { enabled=true, leaderOnly=true, logLevel=true, updateDelay=true,
        tankMarks=true, healMarks=true } },
    ChatBar = { fields = { enabled=true, tabChannelSwitchEnabled=true,
        fontSize=true, buttonsEnabled=true, offsetX=true,
        offsetY=true, buttonWidth=true, buttonHeight=true, spacing=true, paddingX=true,
        paddingY=true, frameStrata=true, frameLevel=true } },
    CenterTextGroup = { fields = { position=true, fontSize=true, rowGap=true } },
    ClassReminders = { fields = { classEnabled=true, generalEnabled=true, weapon=true, beacon=true, feast=true, intellect=true, frostArmor=true, hideResting=true } },
    CombatReminder = { fields = { alert={enabled=true, duration=true, x=true, y=true, fontSize=true},
        timer={enabled=true, onlyInCombat=true, x=true, y=true, fontSize=true, anchorToPlayer=true} } },
    NativeTooltip = { fields = { combatVisibility=true, follow=true, direction=true, x=true, y=true,
        fontSize=true, opacity=true, color=true, health=true,
        showItemLevel=true, showSpellID=true, showItemID=true, showIconID=true, showNPCID=true } },
    ConsumableBar = { fields = { enabled=true, ownedOnly=true, cooldownDesaturate=true,
        positions=true, groupOverrides=true }, open = { positions=true, groupOverrides=true } },
    CVarSettings = { fields = { enabled=true, customSettings=true, specialSettings=true, autoApply=true,
        notifyOnApply=true, smartApply=true, disableAddonProfiler=true,
        notifyAddonProfiler=true }, open = { customSettings=true } },
    ExperienceBar = { fields = { enabled=true, position=true, width=true, height=true,
        fontSize=true, texture=true, color=true, restedColor=true, showText=true,
        showQuestXP=true, hideAtMaxLevel=true, hideNativeExperienceBar=true,
        showXPPerHour=true, showQuestRestedText=true, trackCompletedQuestXP=true, showLevelTime=true,
        showSessionTime=true, resetSessionOnReload=true, showIncompleteQuestOverlay=true,
        x=true, y=true, textScale=true, alpha=true, colors=true } },
    ExtraTools = { fields = { enabled=true, position=true, buttons=true,
        enableLeftHint=true, enableImportCopyButton=true, detailsNumberFix=true,
        bwHideDungeonNames=true, hideAddonCompartment=true, tinyInspectYellowSpamFix=true,
        tinyInspectPartyItemLevelWanted=true, tinyInspectRaidItemLevelWanted=true,
        ellesmereMinimapVolume=true, ellesmereTimerCompact=true, ellesmereStatFont="string", blizzardUI={hideMicroMenu=true, hideBackpackButton=true, unlockWindowDrag=true, microMenuManualChoice=true} } },
    CurrencyBar = { fields = { enabled=true, attachment=true, alignment=true, scale=true,
        enabledCurrencies=true, customPosition="boolean", positionX="number",
        positionY="number", positionAnchor="string" } },
    CursedTide = { fields = { enabled=true, scale=true, collapsed=true,
        customPosition="boolean", positionX="number", positionY="number", positionAnchor="string" } },
    MacroUI = { fields = { enabled=true, avoidNDui=true, avoidElvUI=true, avoidPig=true } },
    EUICNRuneCompat = { fields = { enabled=true } },
    QuestAutomation = { fields = { enabled=true, autoAccept=true, autoTurnIn=true } },
    PlayerTooltip = { fields = { enabled=true, modifier=true, showScore=true, showRuns=true,
        showKeystone=true, showRaids=true, showLegendAchievement=true,
        allowWithCompetingUI=true } },
    RaidMarker = { fields = { enabled=true, sideButtonsEnabled=true, alphaWithTarget=true,
        alphaNoTarget=true, markerSize=true, sideButtonXOffset=true, sideButtonGap=true,
        spacing=true, disableWhenSimilarAddon=true, hideInPetBattle=true, hideWhenSolo=true,
        pullCountdown=true, reverseOrder=true, position=true } },
    RoleMarker = { fields = { enabled=true, tankMark=true, healerMark=true } },
    RSFastFocus = { fields = { enabled=true, modifier=true, mouseButton=true,
        allowClearFocus=true, markEnabled=true, marker=true, overwriteExistingMark=true,
        chatMarkerMode=true, showFocusName=true, disableMarkInRaid=true,
        excludedMarkers=true, chatEnabled=true, disableChatInRaid=true, chatCommand=true,
        useEnglishChat=true, chatTemplateCN=true, chatTemplateEN=true,
        disableCenterReminder=true, disableHealerReminder=true, reminderPosition=true } },
    TopBar = { fields = { enabled=true, hideInPetBattle=true, disableWhenSimilarAddon=true, position=true,
        meetingstone=true, handbook=true, hearthstone=true, rolemarker=true, automark=true,
        -- layoutVersion is local migration state, not a shareable menu setting.
        micromenu = { enabled=true, useClassColor=true, disableWhenNDuiMenu=true,
            disableWhenWindToolsGameBar=true, showGroupFinder=true,
            size=true, spacing=true, alpha=true, position=true } } },
    VersionDisplay = { fields = { enabled=true, text=true, fontSize=true,
        xOffset=true, yOffset=true } },
}
local ROOT_MODULE_ALLOWLIST = {
    AddonProfile=true, AutoMark=true, ChatBar=true, CombatReminder=true,
    CenterTextGroup=true, ClassReminders=true,
    ConsumableBar=true, CVarSettings=true, ExperienceBar=true, ExtraTools=true,
    BlizzardEnhancements=true, PluginEnhancements=true, LootTools=true, LFGTools=true, CelestialBar=true,
    CurrencyBar=true, CursedTide=true, MacroUI=true, FastFocus=true, EUICNRuneCompat=true,
    Guide=true, MagePortal=true, NativeTooltip=true, PlayerTooltip=true, RaidMarker=true,
    RoleMarker=true, RSFastFocus=true, TopBar=true, VersionDisplay=true,
}

local function IsEmpty(value)
    return type(value) == "table" and next(value) == nil
end

local function DeepEqual(left, right, seen)
    if type(left) ~= type(right) then return false end
    if type(left) ~= "table" then return left == right end
    seen = seen or {}
    if seen[left] == right then return true end
    seen[left] = right
    for key, value in pairs(left) do
        if not DeepEqual(value, right[key], seen) then return false end
    end
    for key in pairs(right) do
        if left[key] == nil then return false end
    end
    return true
end

local function Difference(current, defaults, seen)
    if type(current) ~= "table" then
        if current == defaults then return nil end
        return current
    end
    if type(defaults) ~= "table" then return ns.Database.DeepCopy(current) end
    seen = seen or {}
    if seen[current] then return nil end
    seen[current] = true
    local result = {}
    for key, value in pairs(current) do
        local childDefault = defaults[key]
        if childDefault == nil then childDefault = defaults["*"] end
        local child = Difference(value, childDefault, seen)
        if child ~= nil then result[key] = child end
    end
    seen[current] = nil
    return next(result) and result or nil
end

local function SelectFields(profile, schema)
    local selected = {}
    for key, rule in pairs(schema.fields) do
        local value = rawget(profile, key)
        if value ~= nil then
            if type(rule) == "table" and type(value) == "table" then
                selected[key] = SelectFields(value, { fields = rule })
            else
                selected[key] = value
            end
        end
    end
    return selected
end

local function ValidatePrimitiveTree(value, state, depth)
    depth = depth or 1
    if depth > MAX_DEPTH then return false, "配置嵌套过深" end
    local kind = type(value)
    if kind == "string" then
        if #value > MAX_STRING then return false, "配置文字过长" end
        state.items = state.items + 1
        return state.items <= MAX_ITEMS, "配置项目过多"
    end
    if kind == "number" then
        if value ~= value or value == math.huge or value == -math.huge then
            return false, "配置包含非法数字"
        end
        state.items = state.items + 1
        return state.items <= MAX_ITEMS, "配置项目过多"
    end
    if kind == "boolean" then
        state.items = state.items + 1
        return state.items <= MAX_ITEMS, "配置项目过多"
    end
    if kind ~= "table" then return false, "配置包含不支持的数据类型" end
    state.seen = state.seen or {}
    if state.seen[value] then return false, "配置包含循环引用" end
    state.seen[value] = true
    for key, child in pairs(value) do
        local keyType = type(key)
        if keyType ~= "string" and keyType ~= "number" then
            return false, "配置包含不支持的键类型"
        end
        if keyType == "string" and #key > MAX_STRING then return false, "配置键名过长" end
        if keyType == "number" and (key ~= key or key == math.huge or key == -math.huge) then
            return false, "配置包含非法数字键"
        end
        state.items = state.items + 1
        if state.items > MAX_ITEMS then return false, "配置项目过多" end
        local ok, reason = ValidatePrimitiveTree(child, state, depth + 1)
        if not ok then state.seen[value] = nil return false, reason end
    end
    state.seen[value] = nil
    return true
end

local function ValidateAgainstDefaults(value, defaults, state, depth)
    local ok, reason = ValidatePrimitiveTree(value, state, depth)
    if not ok then return false, reason end
    if type(defaults) == "table" and type(value) ~= "table" then
        return false, "配置值类型不匹配"
    end
    if type(value) ~= "table" or type(defaults) ~= "table" or IsEmpty(defaults) then
        if defaults ~= nil and type(defaults) ~= "table" and type(value) ~= type(defaults) then
            return false, "配置值类型不匹配"
        end
        return true
    end
    for key, child in pairs(value) do
        local childDefault = defaults[key]
        if childDefault == nil then childDefault = defaults["*"] end
        if childDefault == nil then return false, "配置包含当前版本未知字段：" .. tostring(key) end
        local childOk, childReason = ValidateAgainstDefaults(child, childDefault, { items = 0 }, (depth or 1) + 1)
        if not childOk then return false, childReason end
    end
    return true
end

local function GetEntries()
    return ns.Assembly and ns.Assembly:GetEntries({}) or {}
end

local function GetEntryMap()
    local map = {}
    for _, entry in ipairs(GetEntries()) do map[entry.name] = entry end
    return map
end

local function BuildPayload()
    local payload = {
        schema = 3,
        build = ns.Build and ns.Build.GetID and ns.Build.GetID() or "unknown",
        root = {},
        modules = {},
    }
    local rootDefaults = ns.DB and ns.DB.defaults and ns.DB.defaults.profile or {}
    for _, key in ipairs({ "modules", "appearance" }) do
        local current = rawget(ns.DB.profile, key) or {}
        if key == "modules" then current = SelectFields(current, { fields = ROOT_MODULE_ALLOWLIST }) end
        if key == "appearance" then current = SelectFields(current, { fields = APPEARANCE_SCHEMA }) end
        local delta = Difference(current, rootDefaults[key])
        if delta ~= nil then payload.root[key] = delta end
    end
    for _, entry in ipairs(GetEntries()) do
        local schema = MODULE_SCHEMA[entry.databaseName] or MODULE_SCHEMA[entry.name]
        local db = entry.module and entry.module.db
        local defaults = entry.defaults and entry.defaults.profile
        if schema and db and type(db.profile) == "table" and type(defaults) == "table" then
            local delta = Difference(SelectFields(db.profile, schema), defaults)
            if delta ~= nil then payload.modules[entry.name] = delta end
        end
    end
    return payload
end

local function ValidatePayload(payload)
    if type(payload) ~= "table" or payload.schema ~= 3
        or type(payload.root) ~= "table" or type(payload.modules) ~= "table" then
        return false, "不是受支持的 RS 配置字符串"
    end
    local ok, reason = ValidatePrimitiveTree(payload, { items = 0 }, 1)
    if not ok then return false, reason end
    for key in pairs(payload.root) do
        if key ~= "modules" and key ~= "appearance" then
            return false, "配置包含不允许的根字段"
        end
    end
    local entryMap = GetEntryMap()
    if payload.root.modules then
        for name, enabled in pairs(payload.root.modules) do
            local entry = entryMap[name]
            if not entry or not ROOT_MODULE_ALLOWLIST[name] or type(enabled) ~= "boolean" then
                return false, "配置包含未知模块开关：" .. tostring(name)
            end
        end
    end
    for key, value in pairs(payload.root.appearance or {}) do
        local expected = APPEARANCE_SCHEMA[key]
        if not expected then return false, "配置包含未知外观字段：" .. tostring(key) end
        if type(value) ~= expected then return false, "外观字段类型不匹配：" .. tostring(key) end
        if expected == "number" then
            local minimum = key == "mainWindowOpacity" and 20 or 0
            if value < minimum or value > 100 then return false, "外观数值超出范围：" .. tostring(key) end
        elseif #value > 128 then
            return false, "外观字体名称过长"
        end
    end
    for name, profile in pairs(payload.modules) do
        local entry = entryMap[name]
        local schema = entry and (MODULE_SCHEMA[entry.databaseName] or MODULE_SCHEMA[name])
        if not schema or type(entry.defaults) ~= "table" or type(entry.defaults.profile) ~= "table" then
            return false, "配置包含当前版本不可用模块：" .. tostring(name)
        end
        for key, value in pairs(profile) do
            if not schema.fields[key] then return false, tostring(name) .. " 包含未知字段：" .. tostring(key) end
            local rule = schema.fields[key]
            if type(rule) == "string" and type(value) ~= rule then
                return false, tostring(name) .. " 配置值类型不匹配：" .. tostring(key)
            end
            if type(rule) == "table" then
                if type(value) ~= "table" then return false, tostring(name) .. " 配置值类型不匹配：" .. tostring(key) end
                for childKey in pairs(value) do
                    if not rule[childKey] then return false, tostring(name) .. " 包含未知字段：" .. tostring(childKey) end
                end
            end
            local default = entry.defaults.profile[key]
            if schema.open and schema.open[key] then
                ok, reason = ValidatePrimitiveTree(value, { items = 0 }, 1)
            else
                ok, reason = ValidateAgainstDefaults(value, default, { items = 0 }, 1)
            end
            if not ok then return false, tostring(name) .. "：" .. tostring(reason) end
        end
    end
    return true
end

-- Preflight the LibSerialize wire grammar before its recursive decoder allocates
-- tables. This is a bounded reader, not an Ace runtime or an executable Lua codec.
local function CheckLegacyWire(data)
    local version = string.byte(data, 1)
    if version ~= 1 and version ~= 2 then error("旧配置序列化版本不受支持") end
    local position, items, strings, tables = 2, 0, 0, 0
    local function Skip(count)
        if position + count - 1 > #data then error("旧配置数据不完整") end
        position = position + count
    end
    local function Integer(bytes)
        local value = 0
        for _ = 1, bytes do
            local byte = string.byte(data, position)
            Skip(1)
            value = value * 256 + byte
        end
        return value
    end
    local function String(length)
        if length > MAX_STRING then error("配置文字过长") end
        Skip(length)
        if length > 2 then strings = strings + 1 end
    end
    local Read
    local function Container(array, map, depth)
        local children = array + map * 2
        if children > MAX_ITEMS - items then error("配置项目过多") end
        tables = tables + 1
        for _ = 1, children do Read(depth + 1) end
    end
    Read = function(depth)
        if depth > MAX_DEPTH then error("配置嵌套过深") end
        items = items + 1
        if items > MAX_ITEMS then error("配置项目过多") end
        local byte = Integer(1)
        if byte % 2 == 1 then return end
        if byte % 4 == 2 then
            local packed = (byte - 2) / 4
            local kind, count = packed % 4, math.floor(packed / 4)
            if kind == 0 then String(count)
            elseif kind == 1 then Container(0, count, depth)
            elseif kind == 2 then Container(count, 0, depth)
            else Container(count % 4 + 1, math.floor(count / 4) + 1, depth) end
            return
        end
        if byte % 8 == 4 then Skip(1) return end
        local kind = byte / 8
        if kind == 0 then error("旧配置包含空值")
        elseif kind <= 8 then Skip(({2, 2, 3, 3, 4, 4, 7, 7})[kind])
        elseif kind == 9 then Skip(8)
        elseif kind <= 11 then Skip(Integer(1))
        elseif kind <= 13 then return
        elseif kind <= 16 then String(Integer(kind - 13))
        elseif kind <= 19 then Container(0, Integer(kind - 16), depth)
        elseif kind <= 22 then Container(Integer(kind - 19), 0, depth)
        elseif kind <= 25 then
            local bytes = kind - 22
            local array, map = Integer(bytes), Integer(bytes)
            Container(array, map, depth)
        else
            local stringRef = kind <= 28
            local index = Integer(kind - (stringRef and 25 or 28))
            if index < 1 or index > (stringRef and strings or tables) then
                error("旧配置引用无效")
            end
        end
    end
    Read(1)
    if position ~= #data + 1 then error("旧配置包含多余数据") end
end

local function DecodeLegacy(text, prefix)
    if not _G.LibStub then return nil, "请加载 RSS 配置安装器后导入旧字符串" end
    local deflate = _G.LibStub("LibDeflate", true)
    local serializer = _G.LibStub("LibSerialize", true)
    if not deflate or type(deflate.DecompressDeflateWithLimit) ~= "function"
        or not serializer or type(serializer.Deserialize) ~= "function" then
        return nil, "旧配置安全解码服务不可用，请加载新版 RSS"
    end
    local compressed = deflate:DecodeForPrint(string.sub(text, #(prefix or LEGACY_PREFIX) + 1))
    if not compressed then return nil, "旧配置解码失败" end
    local data, remaining = deflate:DecompressDeflateWithLimit(compressed, MAX_TEXT)
    if not data or #data > MAX_TEXT or remaining ~= 0 then
        return nil, "旧配置解压失败、超过限制或包含多余数据"
    end
    CheckLegacyWire(data)
    local ok, payload = serializer:Deserialize(data)
    if not ok then return nil, "旧配置反序列化失败" end
    return payload
end

-- Shared bounded wire reader; callers still own payload validation and writes.
function ConfigTransfer:DecodeLegacyPayload(text, prefix)
    if prefix ~= LEGACY_PREFIX and prefix ~= "!RSAP:1:" and prefix ~= "!RSAP:2:" then
        return nil, "不支持的分享格式"
    end
    if type(text) ~= "string" or #text > MAX_TEXT or text:sub(1, #prefix) ~= prefix then
        return nil, "分享字符串格式错误或超过长度限制"
    end
    local ok, payload, reason = pcall(DecodeLegacy, text, prefix)
    if not ok then return nil, "分享字符串内容损坏或超过限制" end
    return payload, reason
end

-- Fixed 11a66cd exported only profile/global, never AceDB namespaces. Preserve
-- current namespaces; hand only these RSS-owned booleans to its import service.
local LEGACY_SETUP_DEFAULTS = {
    autoSwitchLayout=true, autoSwitchSenseiBrewmaster=true, senseiSwitchNotify=false,
    autoSwitchExBossVoice=true, autoSwitchDFProfile=true, autoSwitchDFProfileMythicOnly=true,
    showImportPresetButton=true,
}
local LEGACY_APPEARANCE_FIELDS = {
    interfaceFont=true, chatBarFont=true, tooltipFont=true, timeFont=true,
    combatTimerFont=true, experienceBarFont=true,
}

local function ValidateLegacy(payload)
    if type(payload) ~= "table" or type(payload.profile) ~= "table"
        or (payload.global ~= nil and type(payload.global) ~= "table") then
        return false, "不是旧版 RS 当前配置档字符串"
    end
    local ok, reason = ValidatePrimitiveTree(payload, {items=0}, 1)
    if not ok then return false, reason end
    for key in pairs(payload) do
        if key ~= "profile" and key ~= "global" then return false, "旧配置包含其他数据库或未知字段" end
    end
    local profile = payload.profile
    for key, value in pairs(profile) do
        if key == "debugMode" then
            if type(value) ~= "boolean" then return false, "旧调试字段类型错误" end
        elseif key == "modules" or key == "appearance" or key == "setup"
            or key == "minimap" or key == "uiSizes" then
            if type(value) ~= "table" then return false, "旧配置字段类型错误：" .. key end
        else return false, "旧配置包含未知根字段：" .. tostring(key) end
    end
    local root, setup = {appearance={}}, {}
    -- In 11a66cd profile.modules was an unused default shell: no RS/RSS code
    -- consumed it to enable modules. Real switches lived in omitted namespaces.
    -- Even explicit old flags must never become new Assembly instructions.
    for name, value in pairs(profile.modules or {}) do
        if type(name) ~= "string" or type(value) ~= "boolean" then return false, "旧模块开关类型错误" end
    end
    for key, value in pairs(profile.appearance or {}) do
        local target = key == "font" and "interfaceFont" or key
        if not LEGACY_APPEARANCE_FIELDS[target] then return false, "旧配置包含未知外观字段" end
        if value == "系统默认字体" then value = "默认"
        elseif value == "RS 默认字体" then value = "RS Rurutia" end
        if key ~= "font" or profile.appearance.interfaceFont == nil then root.appearance[target] = value end
    end
    for key, default in pairs(LEGACY_SETUP_DEFAULTS) do
        local value = profile.setup and profile.setup[key]
        if value == nil then value = default end
        if type(value) ~= "boolean" then return false, "旧 RSS 开关类型错误：" .. key end
        setup[key] = value
    end
    ok, reason = ValidatePayload({schema=3, root=root, modules={}})
    if not ok then return false, reason end
    return true, {root=root, setup=setup}
end

local function MergeLegacy(legacy)
    local payload = BuildPayload()
    local values = payload.root.appearance or {}
    -- Missing old font overrides restore defaults; new appearance fields survive.
    for key in pairs(LEGACY_APPEARANCE_FIELDS) do values[key] = nil end
    for key, value in pairs(legacy.root.appearance) do values[key] = value end
    payload.root.appearance = next(values) and values or nil
    return payload
end

local function ReplaceRaw(target, source)
    for key in pairs(target) do rawset(target, key, nil) end
    for key, value in pairs(source or {}) do rawset(target, key, ns.Database.DeepCopy(value)) end
end

local function ReplaceAllowed(target, source, allowlist)
    for key, rule in pairs(allowlist) do
        local value = source and source[key]
        if type(rule) == "table" then
            -- Keep local-only nested fields (for example menu layoutVersion).
            local child = rawget(target, key)
            if type(child) ~= "table" then child = {} end
            ReplaceAllowed(child, value, rule)
            rawset(target, key, next(child) and child or nil)
        else
            rawset(target, key, ns.Database.DeepCopy(value))
        end
    end
end

local function CaptureState()
    local state = {
        hasModules = rawget(ns.DB.profile, "modules") ~= nil,
        hasAppearance = rawget(ns.DB.profile, "appearance") ~= nil,
        modules = ns.Database.DeepCopy(rawget(ns.DB.profile, "modules") or {}),
        appearance = ns.Database.DeepCopy(rawget(ns.DB.profile, "appearance") or {}),
        namespaces = {},
    }
    for _, entry in ipairs(GetEntries()) do
        local db = entry.module and entry.module.db
        local schema = MODULE_SCHEMA[entry.databaseName] or MODULE_SCHEMA[entry.name]
        if schema and db and type(db.profile) == "table" and type(entry.defaults and entry.defaults.profile) == "table" then
            state.namespaces[entry.name] = ns.Database.DeepCopy(db.profile)
        end
    end
    return state
end

local function ApplyState(state, isPayload)
    local rootModules, appearance
    if isPayload then rootModules, appearance = state.root.modules, state.root.appearance
    else rootModules, appearance = state.modules, state.appearance end
    if isPayload then
        ReplaceAllowed(ns.DB.profile.modules, rootModules or {}, ROOT_MODULE_ALLOWLIST)
        ReplaceAllowed(ns.DB.profile.appearance, appearance or {}, APPEARANCE_SCHEMA)
    else
        ReplaceRaw(ns.DB.profile.modules, rootModules or {})
        ReplaceRaw(ns.DB.profile.appearance, appearance or {})
    end
    local sourceModules = isPayload and state.modules or state.namespaces
    for _, entry in ipairs(GetEntries()) do
        local db = entry.module and entry.module.db
        local schema = MODULE_SCHEMA[entry.databaseName] or MODULE_SCHEMA[entry.name]
        if schema and db and type(db.profile) == "table" and type(entry.defaults and entry.defaults.profile) == "table" then
            local source = sourceModules and sourceModules[entry.name] or {}
            if isPayload then
                ReplaceAllowed(db.profile, source, schema.fields)
            else
                for key in pairs(schema.fields) do rawset(db.profile, key, nil) end
                for key, value in pairs(source) do rawset(db.profile, key, ns.Database.DeepCopy(value)) end
            end
            db:ReapplyDefaults()
        end
    end
    ns.DB:ReapplyDefaults()
    if not isPayload then
        if not state.hasModules then rawset(ns.DB.profile, "modules", nil) end
        if not state.hasAppearance then rawset(ns.DB.profile, "appearance", nil) end
    end
    return ns.Assembly:RefreshProfile(ns.DB:GetCurrentProfile())
end

function ConfigTransfer:Export()
    local adapter = ns.ShareCodec or ns.AddonProfileAdapter
    if not ns.DB or type(adapter) ~= "table" or type(adapter.EncodePayload) ~= "function" then
        return nil, "RS 配置服务尚未就绪"
    end
    local built, payload = pcall(BuildPayload)
    if not built then return nil, "无法读取当前 RS 配置：" .. tostring(payload) end
    local validated, ok, reason = pcall(ValidatePayload, payload)
    if not validated then return nil, "RS 配置校验失败：" .. tostring(ok) end
    if not ok then return nil, reason end
    local encodedOK, encoded, encodeReason = pcall(adapter.EncodePayload, adapter, payload, PREFIX)
    if not encodedOK then return nil, "RS 配置编码失败：" .. tostring(encoded) end
    if not encoded then return nil, encodeReason end
    if #encoded > MAX_TEXT then return nil, "配置字符串超过安全体积限制" end
    return encoded
end

function ConfigTransfer:Import(text, prepareLegacySetup)
    if type(_G.InCombatLockdown) == "function" and _G.InCombatLockdown() then
        return false, "请脱离战斗后再导入"
    end
    local legacy = type(text) == "string" and string.sub(text, 1, #LEGACY_PREFIX) == LEGACY_PREFIX
    if type(text) ~= "string" or #text <= #PREFIX or #text > MAX_TEXT
        or (not legacy and string.sub(text, 1, #PREFIX) ~= PREFIX) then
        return false, "不是受支持的 RS 配置字符串"
    end
    local adapter = ns.ShareCodec or ns.AddonProfileAdapter
    if type(adapter) ~= "table" or type(adapter.DecodePayload) ~= "function" then
        return false, "RS 配置服务尚未就绪"
    end
    local decoded, payload, decodeReason
    if legacy then decoded, payload, decodeReason = pcall(DecodeLegacy, text)
    else decoded, payload, decodeReason = pcall(adapter.DecodePayload, adapter, text, PREFIX) end
    if not decoded then
        if legacy then return false, "旧配置解码失败或超过安全限制" end
        return false, "RS 配置解码失败：" .. tostring(payload)
    end
    if not payload then return false, decodeReason end
    local commitLegacySetup
    if legacy then
        local checked, valid, selection = pcall(ValidateLegacy, payload)
        if not checked then return false, "旧配置校验失败" end
        if not valid then return false, selection end
        if type(prepareLegacySetup) ~= "function" then return false, "请通过 RSS 配置迁移页面导入旧字符串" end
        local prepared, commit, prepareReason = pcall(prepareLegacySetup, selection.setup)
        if not prepared or type(commit) ~= "function" then
            return false, prepareReason or "RSS 旧配置接收服务尚未就绪"
        end
        commitLegacySetup = commit
        local merged, result = pcall(MergeLegacy, selection)
        if not merged then return false, "无法读取当前 RS 配置" end
        payload = result
    end
    local validated, valid, reason = pcall(ValidatePayload, payload)
    if not validated then return false, "RS 配置校验失败：" .. tostring(valid) end
    if not valid then return false, reason end
    local captured, backup = pcall(CaptureState)
    if not captured then return false, "无法建立 RS 配置恢复点：" .. tostring(backup) end
    local ok, applied, failures = pcall(ApplyState, payload, true)
    if not ok or not applied then
        local restored, restoreResult = pcall(ApplyState, backup, false)
        if not restored or not restoreResult then
            return false, "导入失败且自动恢复未完成，请立即 /reload"
        end
        return false, ok and ("模块刷新失败：" .. tostring(failures)) or tostring(applied)
    end
    local readOK, expected = pcall(BuildPayload)
    local compareOK, matches = false, false
    if readOK then
        compareOK, matches = pcall(function()
            return DeepEqual(expected.root, payload.root)
                and DeepEqual(expected.modules, payload.modules)
        end)
    end
    if not readOK or not compareOK or not matches then
        local restored, restoreResult = pcall(ApplyState, backup, false)
        if not restored or not restoreResult then
            return false, "导入回读不一致且自动恢复未完成，请立即 /reload"
        end
        if not readOK then
            return false, "导入回读失败，已恢复原配置"
        end
        return false, "导入回读不一致，已恢复原配置"
    end
    if commitLegacySetup then
        local committed, result = pcall(commitLegacySetup)
        if not committed or result ~= true then
            local restored, restoreResult = pcall(ApplyState, backup, false)
            if not restored or not restoreResult then return false, "旧配置接收失败且恢复未完成，请立即 /reload" end
            return false, "RSS 旧配置接收失败，已恢复 RS 配置"
        end
    end
    return true, { changed = true, reloadRequired = true,
        legacyNote = legacy and "已兼容读取旧版外观与 RSS 自动化设置；当前模块开关、模块设置及本机提醒、缓存保持不变。" or nil }
end

ConfigTransfer.PREFIX = PREFIX
