-- 文件职责：维护 Cata Classic 消耗品动作条数据。
-- 负责：Cata 物品目录、分组顺序和布局；不处理渲染、冷却和点击绑定。

local _, ns = ...

-- Do not retain another client's catalogue factory and its constants.
if ns.Build and ns.Build.GetID and ns.Build.GetID() ~= "classic-cata-legacy" then return end

local H = ns.ConsumableBarDataHelpers
local DATASETS = ns.ConsumableBarDataSets
local LOADERS = ns.ConsumableBarDataLoaders
if not (H and DATASETS and LOADERS) then return end

LOADERS[H.EXP_CATA] = function()

local Entry = H.Entry
local ItemClick = H.ItemClick
local ClassicPotionGroup = H.ClassicPotionGroup
local PreMopOtherGroup = H.PreMopOtherGroup

DATASETS[H.EXP_CATA] = {
    catalog = {
        Entry({ key = "ctm_health_potion", name = "奇效治疗药水", kind = "potion", itemID = 57191, color = "ff4040", clickColors = { left = "ff4040", right = "ff4040" } }),
        Entry({ key = "ctm_mana_potion", name = "奇效法力药水", kind = "potion", itemID = 57192, color = "00ffff", clickColors = { left = "00ffff", right = "00ffff" } }),
        Entry({
            key = "ctm_flask_strength_agility",
            name = "泰坦之力合剂 / 风行合剂",
            kind = "flask",
            color = "ff4040",
            clickColors = { left = "ff4040", right = "00ff00" },
            clickNames = { left = "泰坦之力合剂", right = "风行合剂" },
            buffIDs = { 79472, 79471 },
            displayItemID = 58088,
            clicks = { left = ItemClick(58088), right = ItemClick(58087) },
        }),
        Entry({
            key = "ctm_flask_int_spirit",
            name = "神龙心智合剂 / 流水合剂",
            kind = "flask",
            color = "00ffff",
            clickColors = { left = "00ff00", right = "00ffff" },
            clickNames = { left = "神龙心智合剂", right = "流水合剂" },
            buffIDs = { 79470, 94160 },
            displayItemID = 58086,
            clicks = { left = ItemClick(58086), right = ItemClick(67438) },
        }),
    },
    groups = {
        ClassicPotionGroup({ "ctm_health_potion", "ctm_mana_potion" }),
        PreMopOtherGroup({ "ctm_flask_strength_agility", "ctm_flask_int_spirit" }),
    },
}
end
