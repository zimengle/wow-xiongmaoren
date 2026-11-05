-- 文件职责：维护 MoP Classic 消耗品动作条数据。
-- 负责：MoP 物品目录、WA 复刻分组顺序和布局；不处理渲染、冷却和点击绑定。

local _, ns = ...

-- Do not retain another client's catalogue factory and its constants.
if ns.Build and ns.Build.GetID and ns.Build.GetID() ~= "classic-mists" then return end

local H = ns.ConsumableBarDataHelpers
local DATASETS = ns.ConsumableBarDataSets
local LOADERS = ns.ConsumableBarDataLoaders
if not (H and DATASETS and LOADERS) then return end

LOADERS[H.EXP_MOP] = function()

local Entry = H.Entry
local ItemClick = H.ItemClick
local SlotClick = H.SlotClick
local MacroClick = H.MacroClick
local ClassicPotionGroup = H.ClassicPotionGroup

local GROUP_POTION_WA = ClassicPotionGroup({
        "mop_jade_serpent_potion",
        "mop_rabbit_bite",
        "mop_mogu_power_potion",
        "mop_mountains_potion",
        "mop_health_potion",
        "mop_mana_potion",
        "mop_flask_sun_autumn",
        "mop_flask_spring_winter",
        "mop_flask_earth",
        "slot_gloves",
        "slot_waist",
        "slot_cloak",
        "mop_healthstone",
})

local GROUP_OTHER_WA = {
    key = "other",
    title = "其他组",
    frameName = "RSConsumableBar_Other",
    label = "消耗品-其他组",
    anchorPoint = "BOTTOM",
    selfPoint = "BOTTOMLEFT",
    xOffset = 224,
    yOffset = 75,
    grow = "GRID",
    gridType = "RU",
    gridWidth = 8,
    buttonWidth = 32,
    buttonHeight = 32,
    columnSpace = 1,
    rowSpace = 1,
    zoom = 0.3,
    frameStrata = "MEDIUM",
    frameLevel = 300,
    items = {
        "mop_pandaren_treasure_noodle_cart",
        "mop_pandaren_treasure_noodle",
        "mop_noodle",
        "mop_banquet",
        "mop_fish_soup",
        "mop_ribs_shrimp",
        "mop_spring_rolls",
        "mop_stuffed_mushrooms",
    },
}

DATASETS[H.EXP_MOP] = {
    catalog = {
        Entry({ key = "mop_rabbit_bite", name = "兔妖之啮", kind = "potion", itemID = 76089, color = "0000ff", clickColors = { left = "0000ff", right = "0000ff" } }),
        Entry({ key = "mop_health_potion", name = "神效治疗药水", kind = "potion", itemID = 76097, color = "ff4040", clickColors = { left = "ff4040", right = "ff4040" } }),
        Entry({ key = "mop_mana_potion", name = "神效法力药水", kind = "potion", itemID = 76098, color = "00ffff", clickColors = { left = "00ffff", right = "00ffff" } }),
        Entry({ key = "mop_mountains_potion", name = "群山药水", kind = "potion", itemID = 76090, color = "ff00ff", clickColors = { left = "ff00ff", right = "ff00ff" } }),
        Entry({ key = "mop_jade_serpent_potion", name = "青龙药水", kind = "potion", itemID = 76093, color = "00ff00", clickColors = { left = "00ff00", right = "00ff00" } }),
        Entry({ key = "mop_mogu_power_potion", name = "魔古之力药水", kind = "potion", itemID = 76095, color = "ff9600", clickColors = { left = "ff9600", right = "ff9600" } }),
        Entry({ key = "mop_healthstone", name = "治疗石", kind = "healthstone", itemID = 5512, color = "00ff00", clickColors = { left = "00ff00", right = "00ff00" } }),
        Entry({
            key = "mop_flask_spring_winter",
            name = "春华合剂 / 冬噬合剂",
            kind = "flask",
            color = "00ff00",
            clickColors = { left = "00ff00", right = "00ffff" },
            clickNames = { left = "春华合剂", right = "冬噬合剂" },
            buffIDs = { 105689, 105696 },
            displayItemID = 76084,
            clicks = { left = ItemClick(76084), right = ItemClick(76088) },
        }),
        Entry({
            key = "mop_flask_sun_autumn",
            name = "暖阳合剂 / 秋叶合剂",
            kind = "flask",
            color = "ff4040",
            clickColors = { left = "ff4040", right = "ff00ff" },
            clickNames = { left = "暖阳合剂", right = "秋叶合剂" },
            buffIDs = { 105691, 105693 },
            displayItemID = 76085,
            clicks = { left = ItemClick(76085), right = ItemClick(76086) },
        }),
        Entry({
            key = "mop_flask_earth",
            name = "大地合剂",
            kind = "flask",
            color = "ff4040",
            clickColors = { left = "ff4040", right = "ff4040" },
            buffID = 105694,
            displayItemID = 76087,
            clicks = { left = ItemClick(76087), right = ItemClick(76087) },
        }),
        Entry({ key = "slot_gloves", name = "手套", kind = "equipment", slot = 10, clickColors = { left = "00ff00" }, clicks = { left = SlotClick(10) } }),
        Entry({ key = "slot_waist", name = "腰带", kind = "equipment", slot = 6, clickColors = { left = "00ff00" }, clicks = { left = MacroClick("/use 6\n/cancelaura 腐化之怒冰冻瓶剂") } }),
        Entry({ key = "slot_cloak", name = "披风", kind = "equipment", slot = 15, clickColors = { left = "00ff00" }, clicks = { left = SlotClick(15) } }),
        Entry({ key = "mop_pandaren_treasure_noodle_cart", name = "熊猫人八宝汤面餐车", kind = "food", itemID = 101662, color = "00ffff", clickColors = { left = "00ffff", right = "00ffff" } }),
        Entry({ key = "mop_pandaren_treasure_noodle", name = "熊猫人八宝汤面", kind = "food", itemID = 101618, buffID = 104275, color = "00ffff", clickColors = { left = "00ffff", right = "00ffff" } }),
        Entry({ key = "mop_noodle", name = "海雾米线", kind = "food", itemID = 74648, buffID = 104275, color = "00ffff", clickColors = { left = "00ffff", right = "00ffff" } }),
        Entry({ key = "mop_banquet", name = "熊猫人盛宴", kind = "food", itemID = 75016, buffID = 104276, color = "00ffff", clickColors = { left = "00ffff", right = "00ffff" } }),
        Entry({ key = "mop_fish_soup", name = "魔古鱼汤", kind = "food", itemID = 74650, buffID = 104277, color = "00ffff", clickColors = { left = "00ffff", right = "00ffff" } }),
        Entry({ key = "mop_ribs_shrimp", name = "黑胡椒肋排配虾", kind = "food", itemID = 74646, buffID = 104272, color = "00ffff", clickColors = { left = "00ffff", right = "00ffff" } }),
        Entry({ key = "mop_spring_rolls", name = "春卷", kind = "food", itemID = 74656, buffID = 104283, color = "00ffff", clickColors = { left = "00ffff", right = "00ffff" } }),
        Entry({ key = "mop_stuffed_mushrooms", name = "荷包厚味菇", kind = "food", itemID = 101749, buffID = 146808, color = "00ffff", clickColors = { left = "00ffff", right = "00ffff" } }),
    },
    groups = {
        GROUP_POTION_WA,
        GROUP_OTHER_WA,
    },
}
end
