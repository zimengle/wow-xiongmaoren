-- Simple localization utility for BiS-Tooltip

local CURRENT_LOCALE = GetLocale()

local enUS = {
    -- Tooltip header and hints
    SPEC_NAME_HEADER = "Spec name",
    HOLD_ALT_HINT = "Hold ALT to disable spec filtering",
    YOU_HAVE_EQUIPPED = "You have this item equipped",
    YOU_HAVE_IN_BAGS = "You have this item in your inventory",

    -- UI labels
    SLOT_HEADER = "Slot",
    TOP_LABEL = "Top %d",

    -- Minimap tooltip
    MINIMAP_LEFT = "Left click to open the BiS lists window",
    MINIMAP_RIGHT = "Right click to open addon configuration window",

    -- Config options
    OPT_MINIMAP_ICON_NAME = "Show minimap icon",
    OPT_MINIMAP_ICON_DESC = "Shows/hides minimap icon",
    OPT_HIDE_CLASS_NAMES_NAME = "Hide class names",
    OPT_HIDE_CLASS_NAMES_DESC = "Removes class name separators from item tooltips",
    OPT_TOOLTIP_WITH_CTRL_NAME = "Show item tooltips with Ctrl",
    OPT_TOOLTIP_WITH_CTRL_DESC = "Show item tooltips only when holding Ctrl key",
    OPT_DATA_SOURCE_NAME = "Data source",
    OPT_DATA_SOURCE_DESC = "Changes bis data source",
    OPT_HIDE_SPECS_NAME = "Hide specs",
    OPT_HIDE_SPECS_DESC = "Removes unselected specs from item tooltips",
    OPT_HIGHLIGHT_SPEC_NAME = "Highlight spec",
    OPT_HIGHLIGHT_SPEC_DESC = "Highlights selected spec in item tooltips",
    OPT_SELECT_SOURCE_PROMPT = "Please select a bis data source to be used for this addon:",
}

local zhCN = {
    SPEC_NAME_HEADER = "专精",
    HOLD_ALT_HINT = "按住 Alt 显示所有专精",
    YOU_HAVE_EQUIPPED = "你已装备此物品",
    YOU_HAVE_IN_BAGS = "你的背包中有此物品",

    SLOT_HEADER = "部位",
    TOP_LABEL = "推荐 %d",

    MINIMAP_LEFT = "左键 打开BiS列表窗口",
    MINIMAP_RIGHT = "右键 打开插件配置",

    OPT_MINIMAP_ICON_NAME = "显示小地图图标",
    OPT_MINIMAP_ICON_DESC = "显示/隐藏小地图图标",
    OPT_HIDE_CLASS_NAMES_NAME = "隐藏职业分隔",
    OPT_HIDE_CLASS_NAMES_DESC = "在物品提示中移除职业名称分隔行",
    OPT_TOOLTIP_WITH_CTRL_NAME = "按住Ctrl才显示提示",
    OPT_TOOLTIP_WITH_CTRL_DESC = "仅在按住Ctrl键时显示物品提示的扩展信息",
    OPT_DATA_SOURCE_NAME = "数据源",
    OPT_DATA_SOURCE_DESC = "切换BiS数据来源",
    OPT_HIDE_SPECS_NAME = "隐藏专精",
    OPT_HIDE_SPECS_DESC = "在物品提示中隐藏未勾选的专精",
    OPT_HIGHLIGHT_SPEC_NAME = "高亮专精",
    OPT_HIGHLIGHT_SPEC_DESC = "在物品提示中高亮显示所选专精",
    OPT_SELECT_SOURCE_PROMPT = "请选择要用于本插件的BiS数据源：",
}

local dict = enUS
if CURRENT_LOCALE == "zhCN" then
    dict = setmetatable(zhCN, { __index = enUS })
else
    dict = enUS
end

function BistooltipAddon_GetString(key, ...)
    local value = dict[key] or enUS[key] or key
    if select('#', ...) > 0 then
        return string.format(value, ...)
    end
    return value
end

-- Class/Spec Chinese mappings (display only; data keys remain English)
local CLASS_ZHCN = {
    ["Death knight"] = "死亡骑士",
    ["Druid"] = "德鲁伊",
    ["Hunter"] = "猎人",
    ["Mage"] = "法师",
    ["Monk"] = "武僧",
    ["Paladin"] = "圣骑士",
    ["Priest"] = "牧师",
    ["Rogue"] = "盗贼",
    ["Shaman"] = "萨满祭司",
    ["Warlock"] = "术士",
    ["Warrior"] = "战士",
}

local SPEC_ZHCN = {
    -- Death knight
    ["Blood tank"] = "鲜血（坦）",
    ["Frost"] = "冰霜",
    ["Unholy"] = "邪恶",
    -- Druid
    ["Balance"] = "平衡",
    ["Guardian"] = "守护",
    ["Feral"] = "野性",
    ["Restoration"] = "恢复",
    -- Hunter
    ["Beast mastery"] = "野兽控制",
    ["Marksmanship"] = "射击",
    ["Survival"] = "生存",
    -- Mage
    ["Arcane"] = "奥术",
    ["Fire"] = "火焰",
    -- Frost 已有
    -- Monk
    ["Brewmaster"] = "酒仙",
    ["Mistweaver"] = "织雾",
    ["Windwalker"] = "踏风",
    -- Paladin
    ["Holy"] = "神圣",
    ["Protection"] = "防护",
    ["Retribution"] = "惩戒",
    -- Priest
    ["Discipline"] = "戒律",
    -- Holy 已有
    ["Shadow"] = "暗影",
    -- Rogue
    ["Assassination"] = "刺杀",
    ["Combat"] = "战斗",
    ["Subtlety"] = "敏锐",
    -- Shaman
    ["Elemental"] = "元素",
    ["Enhancement"] = "增强",
    -- Restoration 已有
    -- Warlock
    ["Affliction"] = "痛苦",
    ["Demonology"] = "恶魔学识",
    ["Destruction"] = "毁灭",
    ["Destruction fire"] = "毁灭（火）",
    -- Warrior
    ["Arms"] = "武器",
    ["Fury"] = "狂暴",
    -- Protection 已有
}

function BistooltipAddon_LocalizeClass(class_en)
    if GetLocale() == "zhCN" then
        return CLASS_ZHCN[class_en] or class_en
    end
    return class_en
end

function BistooltipAddon_LocalizeSpec(spec_en)
    if GetLocale() == "zhCN" then
        return SPEC_ZHCN[spec_en] or spec_en
    end
    return spec_en
end

-- Slot names mapping
local SLOT_ZHCN = {
    ["Head"] = "头部",
    ["Neck"] = "颈部",
    ["Shoulder"] = "肩部",
    ["Back"] = "背部",
    ["Chest"] = "胸部",
    ["Wrist"] = "护腕",
    ["Hands"] = "手部",
    ["Waist"] = "腰部",
    ["Legs"] = "腿部",
    ["Feet"] = "脚部",
    ["Finger"] = "戒指",
    ["Trinket"] = "饰品",
    ["Weapon"] = "主手",
    ["Off hand"] = "副手",
    ["Weapon 1h"] = "单手武器",
    ["Weapon 2h"] = "双手武器",
}

function BistooltipAddon_LocalizeSlotName(slot_en)
    if GetLocale() == "zhCN" then
        return SLOT_ZHCN[slot_en] or slot_en
    end
    return slot_en
end


