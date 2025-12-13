local _, ns = ...

-- ========================================
-- Bar 1: 消耗品数据
-- ========================================
ns.ConsumableData = {
    ["Test"] = {
        { id = 6948, name = "炉石" },
        { id = 159,  name = "清凉的泉水" },
        { id = 118,  name = "初级治疗药水" },
    },
    ["Burst"] = { 
        { id = 22838, name = "加速药水" },
        { id = 40211, name = "速度药水" },
        { id = 40212, name = "狂野魔法药水" },
    },
    ["Health"] = { 
        { id = 33447, name = "符文治疗药水" },
        { id = 43531, name = "银色治疗药水" },
        { id = 22829, name = "超级治疗药水" },
    },
    ["Mana"] = {
        { id = 33448, name = "符文法力药水" },
        { id = 43530, name = "银色法力药水" },
        { id = 22832, name = "超级法力药水" },
    },
    ["Utility"] = {},
    ["Food"] = {},
}

-- ========================================
-- Bar 2: 法术/传送门数据
-- ========================================

-- [修改] 辅助函数：增加 faction 参数
-- faction: "Horde" (部落), "Alliance" (联盟), nil (中立/通用)
local function CreatePortalData(name, shortName, iconID, portalID, teleportID, faction)
    return {
        type = "custom_portal",
        name = name,
        icon = iconID,
        overlayText = shortName,
        
        spellLeft = "传送门："..name,
        itemPortal = 17032,
        
        spellRight = "传送："..name,
        itemTeleport = 17031,
        
        cdSpellID = teleportID,
        requiredFaction = faction -- [新增] 阵营要求字段
    }
end

ns.SpellBarData = {
    -- [常用法术] (无阵营要求)
    -- { id = 133,   name = "火球术",     type = "spell" },
    -- { id = 28730, name = "奥术洪流",   type = "spell" },
    
    -- [中立主城] (无阵营要求)
    CreatePortalData("达拉然", "达拉", 237509, 53140, 53140, nil),
    CreatePortalData("沙塔斯", "沙城", 135760, 33690, 35715, nil),
    
    -- [部落主城] (标记为 Horde)
    CreatePortalData("奥格瑞玛", "奥格", 135759, 11417, 3567, "Horde"),
    CreatePortalData("幽暗城",   "幽暗", 135766, 11418, 3563, "Horde"),
    CreatePortalData("雷霆崖",   "雷霆", 135765, 11420, 3566, "Horde"),
    CreatePortalData("银月城",   "银月", 135761, 32267, 32272, "Horde"),
    CreatePortalData("斯通纳德", "斯通", 135762, 49361, 49358, "Horde"),
    
    -- [联盟主城] (标记为 Alliance)
    CreatePortalData("暴风城",   "暴风", 135763, 10059, 3561, "Alliance"),
    CreatePortalData("铁炉堡",   "铁炉", 135757, 11416, 3562, "Alliance"),
    CreatePortalData("达纳苏斯", "达纳", 135755, 11419, 3565, "Alliance"),
    CreatePortalData("埃索达",   "埃索", 135756, 32266, 32271, "Alliance"),
    CreatePortalData("塞拉摩",   "塞拉", 135764, 49360, 49359, "Alliance"),
}