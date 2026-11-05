local _, ns = ...

local Factory = {}

-- Construct owned metadata once per Build; do not retain a second template table.
local function CreateBaseMetadata()
return {
    cameraDistanceMaxZoomFactor = {
        name = "最远视距",
        description = "控制镜头的最大缩放距离",
        category = "camera",
        type = "range",
        min = 1,
        max = 3.4,
        step = 0.1,
        default = 3.4,
    },
    nameplateMaxDistance = {
        name = "姓名板距离",
        description = "姓名板的最大显示距离",
        category = "interface",
        type = "select",
        options = { 20, 41 },
        optionNames = { "标准 (20码)", "扩展 (41码)" },
        default = 41,
    },
    alwaysCompareItems = {
        name = "装备自动对比",
        description = "鼠标悬停在装备上时自动对比属性",
        category = "interface",
        type = "toggle",
        default = 1,
    },
    chatClassColorOverride = {
        name = "聊天框职业色",
        description = "在聊天框中显示职业颜色",
        category = "interface",
        type = "toggle",
        default = 0,
        invert = true,
    },
    equipmentManager = {
        name = "装备管理",
        description = "启用系统自带的装备管理功能",
        category = "interface",
        type = "toggle",
        default = 1,
    },
    ffxDeath = {
        name = "死亡特效",
        description = "角色死亡时的视觉特效",
        category = "effects",
        type = "toggle",
        default = 0,
    },
    ffxGlow = {
        name = "全屏幕泛光",
        description = "全屏幕的光晕效果",
        category = "effects",
        type = "toggle",
        default = 0,
    },
    violenceLevel = {
        name = "暴力等级",
        description = "血液和暴力效果的强度",
        category = "effects",
        type = "range",
        min = 0,
        max = 5,
        step = 1,
        optionNames = { "无", "最小", "低", "中", "高", "最大" },
        default = 2,
    },
    weatherdensity = {
        name = "天气密度",
        description = "天气效果的密度和强度",
        category = "environment",
        type = "range",
        min = 0,
        max = 3,
        step = 1,
        optionNames = { "关闭", "低", "中", "高" },
        default = 1,
    },
    floatingCombatTextCombatDamage = {
        name = "伤害数字",
        description = "显示战斗伤害数字",
        category = "combat",
        type = "toggle",
        default = 1,
    },
    scriptErrors = {
        name = "Lua错误显示",
        description = "是否显示Lua脚本错误",
        category = "debug",
        type = "toggle",
        default = 0,
    },
    spellActivationOverlayOpacity = {
        name = "法术警报透明度",
        description = "控制法术触发提示（如冰冷手指、节能施法等）的透明度",
        category = "combat",
        type = "range",
        min = 0,
        max = 1,
        step = 0.1,
        default = 0,
    },
    lossOfControl = {
        name = "禁用失控警报",
        description = "关闭系统失控警报提示",
        category = "combat",
        type = "toggle",
        default = 0,
        invert = true,
    },
}
end

local function CreateRetailMetadata()
return {
    autoLootDefault = {
        name = "自动拾取",
        description = "自动拾取怪物掉落物品",
        category = "interface",
        type = "toggle",
        default = 1,
    },
    chatStyle = {
        name = "聊天样式",
        description = "聊天框样式设置",
        category = "interface",
        type = "select",
        options = { "classic", "im" },
        optionNames = { "经典风格", "即时通讯" },
        default = "classic",
    },
    whisperMode = {
        name = "悄悄话模式",
        description = "悄悄话弹出和显示方式",
        category = "interface",
        type = "select",
        options = { "inline", "popout_and_inline", "popout" },
        optionNames = { "一致模式", "同时", "新标签页" },
        default = "inline",
    },
}
end

-- 无限（classic-infinite）姓名板控件。preset=false 表示这些值只表示当前运行状态，
-- 不进入工具箱预设，也不参与登录自动应用；只有 loginPolicy=true 的三项在登录/重载时被设为开。
local function CreateNameplateMetadata()
return {
    nameplateShowEnemies = {
        name = "敌方姓名板",
        description = "显示敌方单位的姓名板；登录或重载时按“登录时自动应用”重新开启。",
        category = "nameplate",
        type = "toggle",
        default = 1,
        preset = false,
        loginPolicy = true,
    },
    nameplateShowFriendlyPlayers = {
        name = "友方姓名板",
        description = "只控制友方玩家姓名板的开关，不参与登录自动应用，也不检查友方NPC。",
        category = "nameplate",
        type = "toggle",
        default = 0,
        preset = false,
    },
    nameplateShowOnlyNameForFriendlyPlayerUnits = {
        name = "友方仅显示名称",
        description = "友方玩家姓名板只显示名字；登录或重载时按“登录时自动应用”开启。",
        category = "nameplate",
        type = "toggle",
        default = 1,
        preset = false,
        loginPolicy = true,
    },
    nameplateUseClassColorForFriendlyPlayerUnitNames = {
        name = "友方姓名职业色",
        description = "友方玩家姓名板的名字使用职业颜色；只影响名字，不影响血条颜色。",
        category = "nameplate",
        type = "toggle",
        default = 1,
        preset = false,
        loginPolicy = true,
    },
    nameplateStyle = {
        name = "姓名板样式",
        description = "无限客户端可用的姓名板外观样式。",
        category = "nameplate",
        type = "select",
        options = { 1, 0, 2, 4 },
        optionNames = { "细条（默认）", "现代", "方块", "施法焦点" },
        default = 2,
        preset = false,
    },
    nameplateSize = {
        name = "姓名板尺寸",
        description = "姓名板的整体尺寸。1=小，2=中，3=大，4=特大，5=巨大。",
        category = "nameplate",
        type = "range",
        min = 1,
        max = 5,
        step = 1,
        default = 3,
        preset = false,
    },
}
end

-- 暴雪 forever @ 943764493e6b 的 WorldMapTrackingOptionsButtonMixin 原生过滤项。
-- 纳入普通预设，允许 customSettings 覆盖；不属于强制登录策略。
local function CreateWorldMapMetadata()
    return {
        worldMapShowPlayerCoords = {
            name = "大地图玩家坐标", description = "在系统大地图上显示玩家位置坐标。",
            category = "interface", type = "toggle", default = 1,
        },
        worldMapShowCursorCoords = {
            name = "大地图鼠标坐标", description = "在系统大地图上显示鼠标指向位置的坐标。",
            category = "interface", type = "toggle", default = 1,
        },
        questPOI = {
            name = "任务目标", description = "在世界地图上显示任务目标。",
            category = "interface", type = "toggle", default = 1,
        },
        showQuestDifficultyColor = {
            name = "任务难度颜色", description = "按任务难度显示任务标题颜色。",
            category = "interface", type = "toggle", default = 1,
        },
        showDungeonEntrancesOnMap = {
            name = "副本入口", description = "在世界地图上显示副本入口。",
            category = "interface", type = "toggle", default = 1,
        },
        contentTrackingFilter = {
            name = "追踪的物品", description = "在世界地图上显示追踪的物品。",
            category = "interface", type = "toggle", default = 1,
        },
    }
end

local CATEGORIES = {
    camera = { name = "镜头设置", description = "镜头和视角相关设置", order = 1 },
    interface = { name = "界面设置", description = "用户界面相关设置", order = 2 },
    effects = { name = "视觉效果", description = "视觉特效相关设置", order = 3 },
    environment = { name = "环境效果", description = "环境和天气相关设置", order = 4 },
    combat = { name = "战斗设置", description = "战斗相关设置", order = 5 },
    debug = { name = "调试设置", description = "调试和开发相关设置", order = 6 },
    nameplate = { name = "姓名板", description = "姓名板显示与外观", order = 7 },
}

local PERFORMANCE = {
    low = {
        "cameraDistanceMaxZoomFactor",
        "nameplateMaxDistance",
        "chatClassColorOverride",
        "alwaysCompareItems",
        "equipmentManager",
        "lossOfControl",
    },
    medium = { "floatingCombatTextCombatDamage", "violenceLevel" },
    high = { "ffxDeath", "ffxGlow", "weatherdensity" },
}

local function Copy(value)
    if type(value) ~= "table" then return value end
    local result = {}
    local key
    local item
    for key, item in pairs(value) do
        result[key] = Copy(item)
    end
    return result
end

local function Validate(metadata, cvar, value)
    local definition = metadata[cvar]
    if not definition then
        return false, "未知的CVAR: " .. tostring(cvar)
    end
    if definition.type == "toggle" then
        if value ~= "0" and value ~= "1" then
            return false, string.format(
                "开关类型CVAR %s 的值必须是 0 或 1，当前值: %s",
                cvar,
                tostring(value)
            )
        end
    elseif definition.type == "range" then
        local numeric = tonumber(value)
        if not numeric then
            return false, string.format("范围类型CVAR %s 的值必须是数字，当前值: %s", cvar, tostring(value))
        end
        if numeric < definition.min or numeric > definition.max then
            return false, string.format(
                "CVAR %s 的值超出范围 [%s, %s]，当前值: %s",
                cvar,
                tostring(definition.min),
                tostring(definition.max),
                tostring(value)
            )
        end
    elseif definition.type == "select" then
        local valid = false
        local index
        for index = 1, #(definition.options or {}) do
            if tostring(value) == tostring(definition.options[index]) then
                valid = true
                break
            end
        end
        if not valid then
            return false, string.format("选择类型CVAR %s 的值不在有效选项中，当前值: %s", cvar, tostring(value))
        end
    end
    return true
end

function Factory:Build(policy)
    policy = policy or {}
    local metadata = CreateBaseMetadata()
    if policy.family == "retail" then
        local key
        local value
        for key, value in pairs(CreateRetailMetadata()) do
            metadata[key] = value
        end
        metadata.nameplateMaxDistance.options = { 20, 41, 60 }
        metadata.nameplateMaxDistance.optionNames = { "标准 (20码)", "扩展 (41码)", "超远 (60码)" }
        metadata.lossOfControl.name = "失控警报"
        metadata.lossOfControl.description = "开启系统失控警报提示"
        metadata.lossOfControl.default = 1
        metadata.lossOfControl.invert = false
    end

    if policy.isWrath then
        metadata.spellActivationOverlayOpacity = nil
    end
    if not policy.supportsLossOfControl then
        metadata.lossOfControl = nil
    end
    if policy.supportsNameplateControls then
        local key
        local value
        for key, value in pairs(CreateNameplateMetadata()) do
            metadata[key] = value
        end
    end

    if policy.supportsWorldMapFilters then
        for key, value in pairs(CreateWorldMapMetadata()) do
            metadata[key] = value
        end
    end

    if policy.supportsStatusText then
        metadata.statusTextDisplay = {
            name = "状态文字",
            description = "控制原生头像等状态条的生命值与资源文字；默认显示数值，选择无可关闭。",
            category = "interface",
            type = "select",
            options = { "NUMERIC", "PERCENT", "BOTH", "NONE" },
            optionNames = { "数值", "百分比", "两者", "无" },
            default = "NUMERIC",
        }
    end

    local preset = {}
    local cvar
    local definition
    for cvar, definition in pairs(metadata) do
        if definition.default ~= nil and definition.preset ~= false then
            local skip = policy.isWoW12 and cvar == "spellActivationOverlayOpacity"
            if not skip then
                preset[cvar] = definition.default
            end
        end
    end
    if policy.isWoW12 and metadata.nameplateMaxDistance then
        preset.nameplateMaxDistance = 60
    end
    if policy.family == "retail" then
        preset.floatingCombatTextCombatDamage = 1
    end

    local data = {
        presets = { rurutia = preset },
        metadata = metadata,
        categories = Copy(CATEGORIES),
        performance = Copy(PERFORMANCE),
        presetNames = { rurutia = "工具箱预设" },
        policy = Copy(policy),
    }
    function data.validate(cvarName, value)
        return Validate(metadata, cvarName, value)
    end
    function data.getImpact(cvarName)
        local level
        local values
        for level, values in pairs(PERFORMANCE) do
            local index
            for index = 1, #values do
                if values[index] == cvarName then return level end
            end
        end
        return "low"
    end
    function data.getByCategory(category)
        local result = {}
        local name
        local item
        for name, item in pairs(metadata) do
            if item.category == category then result[name] = item end
        end
        return result
    end
    return data
end

ns.CVarSettingsDataFactory = Factory
