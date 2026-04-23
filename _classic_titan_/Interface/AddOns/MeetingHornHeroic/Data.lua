-- Data.lua
-- MeetingHornHeroic Data Definitions

---@type MeetingHornHeroicNS
local ns = select(2, ...)

-- 团本数据定义
ns.raidData = {
    -- WotLK 团本
    [ns.SPEC.NAXXRAMAS] = {
        id = ns.SPEC.NAXXRAMAS,
        name = "纳克萨玛斯",
        shortName = "NAXX",
        maxPlayers = 25,
        minLevel = 80,
        difficulty = ns.SPEC.HEROIC_25,
        bossId = 1114, -- 克尔苏加德的NPC ID
        bossImage = "Interface\\AddOns\\MeetingHornHeroic\\Media\\TeamDungeon\\Naxxramas",
        finalBoss = "克尔苏加德",
        description = "巫妖王之怒纳克萨玛斯25人模式",
        lootLevel = "装等要求: 200",
        requirements = {
            frostResistance = true,
            minItemLevel = 200
        }
    },
    [ns.SPEC.OBSIDIAN_SANCTUM] = {
        id = ns.SPEC.OBSIDIAN_SANCTUM,
        name = "黑曜石圣殿",
        shortName = "OS",
        maxPlayers = 25,
        minLevel = 80,
        difficulty = ns.SPEC.HEROIC_25,
        bossId = 742, -- 萨塔里奥的NPC ID
        bossImage = "Interface\\AddOns\\MeetingHornHeroic\\Media\\TeamDungeon\\ObsidianSanctum",
        finalBoss = "萨塔里奥",
        description = "巫妖王之怒黑曜石圣殿25人模式",
        lootLevel = "装等要求: 200",
        requirements = {
            fireResistance = true,
            minItemLevel = 200
        }
    },
    [ns.SPEC.EYE_OF_ETERNITY] = {
        id = ns.SPEC.EYE_OF_ETERNITY,
        name = "永恒之眼",
        shortName = "EoE",
        maxPlayers = 25,
        minLevel = 80,
        difficulty = ns.SPEC.HEROIC_25,
        bossId = 734, -- 玛里苟斯的NPC ID
        bossImage = "Interface\\AddOns\\MeetingHornHeroic\\Media\\TeamDungeon\\EyeOfEternity",
        finalBoss = "玛里苟斯",
        description = "巫妖王之怒永恒之眼25人模式",
        lootLevel = "装等要求: 200",
        requirements = {
            arcaneResistance = true,
            minItemLevel = 200
        }
    },
    [ns.SPEC.VAULT_OF_ARCHAVON] = {
        id = ns.SPEC.VAULT_OF_ARCHAVON,
        name = "阿尔卡冯的宝库",
        shortName = "VoA",
        maxPlayers = 25,
        minLevel = 80,
        difficulty = ns.SPEC.HEROIC_25,
        bossId = 0, -- 看守者（上游未分配具体bossId）
        bossImage = "Interface\\AddOns\\MeetingHornHeroic\\Media\\TeamDungeon\\VaultOfArchavon",
        finalBoss = "看守者",
        description = "巫妖王之怒阿尔卡冯的宝库25人模式",
        lootLevel = "装等要求: 200",
        requirements = {
            minItemLevel = 200
        }
    },
    -- 经典/TBC 团本
    [ns.SPEC.MOLTEN_CORE] = {
        id = ns.SPEC.MOLTEN_CORE,
        name = "熔火之心",
        shortName = "MC",
        maxPlayers = 25,
        minLevel = 80,
        difficulty = ns.SPEC.HEROIC_25,
        bossId = 11502, -- 拉格纳罗斯的NPC ID
        bossImage = "Interface\\AddOns\\MeetingHornHeroic\\Media\\TeamDungeon\\MoltenCore",
        finalBoss = "拉格纳罗斯",
        description = "经典熔火之心25人模式",
        lootLevel = "装等要求: 200",
        requirements = {
            fireResistance = true,
            minItemLevel = 200
        }
    },
    [ns.SPEC.SERPENTSHRINE_CAVERN] = {
        id = ns.SPEC.SERPENTSHRINE_CAVERN,
        name = "毒蛇神殿",
        shortName = "SSC",
        maxPlayers = 25,
        minLevel = 80,
        difficulty = ns.SPEC.HEROIC_25,
        bossId = 21212, -- 瓦丝琪女士的NPC ID
        bossImage = "Interface\\AddOns\\MeetingHornHeroic\\Media\\TeamDungeon\\SerpentshrineCavern",
        finalBoss = "瓦丝琪女士",
        description = "燃烧的远征毒蛇神殿25人模式",
        lootLevel = "装等要求: 350",
        requirements = {
            natureResistance = true,
            minItemLevel = 350
        }
    },
    [ns.SPEC.THE_EYE] = {
        id = ns.SPEC.THE_EYE,
        name = "风暴要塞",
        shortName = "TK",
        maxPlayers = 25,
        minLevel = 80,
        difficulty = ns.SPEC.HEROIC_25,
        bossId = 19622, -- 凯尔萨斯王子的NPC ID
        bossImage = "Interface\\AddOns\\MeetingHornHeroic\\Media\\TeamDungeon\\TheEye",
        finalBoss = "凯尔萨斯王子",
        description = "燃烧的远征风暴要塞25人模式",
        lootLevel = "装等要求: 350",
        requirements = {
            arcaneResistance = true,
            minItemLevel = 350
        }
    }
}

-- 团本显示排序（所有UI遍历必须使用此列表）
ns.raidOrder = {
    ns.SPEC.NAXXRAMAS,         -- 纳克萨玛斯
    ns.SPEC.OBSIDIAN_SANCTUM,  -- 黑曜石圣殿
    ns.SPEC.EYE_OF_ETERNITY,   -- 永恒之眼
    ns.SPEC.VAULT_OF_ARCHAVON, -- 阿尔卡冯的宝库
    ns.SPEC.SERPENTSHRINE_CAVERN, -- 毒蛇神殿
    ns.SPEC.MOLTEN_CORE,       -- 熔火之心
    ns.SPEC.THE_EYE,           -- 风暴要塞
}

-- 副本名称→raidId 反向映射表（用于通过活动名称查找对应的 MHH raidId）
-- 包含完整名称、缩写、以及集结号常见的带人数后缀变体（如"纳克萨玛斯(25人)"）
ns.raidNameToId = {}
for raidId, raidData in pairs(ns.raidData) do
    if raidData.name then
        ns.raidNameToId[raidData.name] = raidId
        -- 注册集结号常见的带人数后缀变体（半角/全角括号）
        ns.raidNameToId[raidData.name .. "(25人)"] = raidId
        ns.raidNameToId[raidData.name .. "（25人）"] = raidId
        ns.raidNameToId[raidData.name .. "(10人)"] = raidId
        ns.raidNameToId[raidData.name .. "（10人）"] = raidId
    end
    if raidData.shortName then
        ns.raidNameToId[raidData.shortName] = raidId
    end
end

-- 职业配置数据
ns.classConfigs = {
    tank = {
        classes = {ns.SPEC.WARRIOR, ns.SPEC.PALADIN, ns.SPEC.DEATHKNIGHT},
        maxCount = 3,
        minCount = 2,
        displayName = "坦克",
        icon = "Interface/Icons/Ability_Defend"
    },
    healer = {
        classes = {ns.SPEC.PRIEST, ns.SPEC.PALADIN, ns.SPEC.SHAMAN, ns.SPEC.DRUID},
        maxCount = 7,
        minCount = 5,
        displayName = "治疗",
        icon = "Interface/Icons/Spell_Holy_Heal"
    },
    dps = {
        classes = {
            ns.SPEC.WARRIOR, ns.SPEC.HUNTER, ns.SPEC.ROGUE, ns.SPEC.PRIEST,
            ns.SPEC.SHAMAN, ns.SPEC.MAGE, ns.SPEC.WARLOCK, ns.SPEC.DRUID,
            ns.SPEC.DEATHKNIGHT
        },
        maxCount = 20,
        minCount = 15,
        displayName = "伤害输出",
        icon = "Interface/Icons/Ability_DualWield"
    }
}

-- 活动模式配置
ns.activityModes = {
    {
        id = 1,
        name = "金团",
        description = "装备拍卖分金",
        icon = "Interface/Icons/INV_Misc_Coin_01"
    },
    {
        id = 2,
        name = "DKP",
        description = "DKP积分分配",
        icon = "Interface/Icons/INV_Misc_Note_01"
    },
    {
        id = 3,
        name = "Roll点",
        description = "装备Roll点分配",
        icon = "Interface/Icons/INV_Misc_Dice_02"
    },
    {
        id = 4,
        name = "公会团",
        description = "公会内部组织",
        icon = "Interface/Icons/INV_Misc_GroupNeedMore"
    },
    {
        id = 5,
        name = "固定团",
        description = "固定成员团队",
        icon = "Interface/Icons/Achievement_Guild_ClassyRaid"
    }
}

-- activityModes 哈希表：modeId → mode 对象，供 GetModeData() O(1) 查找
ns.activityModeMap = {}
for _, mode in ipairs(ns.activityModes) do
    ns.activityModeMap[mode.id] = mode
end

-- 频道配置
ns.channelConfig = {
    defaultChannel = "寻求组队",
    broadcastInterval = 60, -- 秒
    maxBroadcastCount = 3,
    customChannels = {
        "公会",
        "世界",
        "综合",
        "交易"
    }
}

-- 筛选配置（raidType 按 raidOrder 动态生成）
ns.filterOptions = {
    raidType = (function()
        local options = {{value = 0, text = "所有团本"}}
        for _, raidId in ipairs(ns.raidOrder) do
            local rd = ns.raidData[raidId]
            if rd then
                table.insert(options, {value = raidId, text = rd.name})
            end
        end
        return options
    end)(),
    activityMode = {
        {value = 0, text = "所有模式"}
    },
    playerCount = {
        {value = 25, text = "25人模式"}
    },
    neededRoles = {
        {value = "all", text = "所有职位"},
        {value = "tank", text = "需要坦克"},
        {value = "healer", text = "需要治疗"},
        {value = "dps", text = "需要DPS"}
    },
    sortOrder = {
        {value = "time", text = "按时间排序"},
        {value = "raid", text = "按团本排序"},
        {value = "mode", text = "按模式排序"},
        {value = "leader", text = "按队长排序"}
    }
}

-- 初始化活动模式筛选选项
for _, mode in ipairs(ns.activityModes) do
    table.insert(ns.filterOptions.activityMode, {
        value = mode.id,
        text = mode.name
    })
end

-- ========================================================
-- 天赋页→职责映射表（WotLK）
-- 格式: ns.SPEC_ROLE_MAP[classFileName][tabIndex] = role
-- ========================================================
ns.SPEC_ROLE_MAP = {
    WARRIOR     = { [1] = "dps",    [2] = "dps",    [3] = "tank"   }, -- 武器/狂暴/防护
    PALADIN     = { [1] = "healer", [2] = "tank",   [3] = "dps"    }, -- 神圣/防护/惩戒
    DEATHKNIGHT = { [1] = "tank",   [2] = "dps",    [3] = "dps"    }, -- 鲜血/冰霜/邪恶
    DRUID       = { [1] = "dps",    [2] = "dps",    [3] = "healer" }, -- 平衡/野性/恢复
    PRIEST      = { [1] = "healer", [2] = "healer", [3] = "dps"    }, -- 戒律/神圣/暗影
    SHAMAN      = { [1] = "dps",    [2] = "dps",    [3] = "healer" }, -- 元素/增强/恢复
    HUNTER      = { [1] = "dps",    [2] = "dps",    [3] = "dps"    },
    ROGUE       = { [1] = "dps",    [2] = "dps",    [3] = "dps"    },
    MAGE        = { [1] = "dps",    [2] = "dps",    [3] = "dps"    },
    WARLOCK     = { [1] = "dps",    [2] = "dps",    [3] = "dps"    },
}

-- ========================================================
-- 职业缩写表
-- ========================================================
ns.CLASS_SHORT_NAME = {
    WARRIOR     = "战",
    PALADIN     = "骑",
    HUNTER      = "猎",
    ROGUE       = "贼",
    PRIEST      = "牧",
    DEATHKNIGHT = "DK",
    SHAMAN      = "萨",
    MAGE        = "法",
    WARLOCK     = "术",
    DRUID       = "德",
}

-- 职业中文全名
ns.CLASS_FULL_NAME = {
    WARRIOR     = "战士",
    PALADIN     = "圣骑士",
    HUNTER      = "猎人",
    ROGUE       = "盗贼",
    PRIEST      = "牧师",
    DEATHKNIGHT = "死亡骑士",
    SHAMAN      = "萨满",
    MAGE        = "法师",
    WARLOCK     = "术士",
    DRUID       = "德鲁伊",
}

-- ========================================================
-- 天赋缩写表（每职业3个天赋页，按 tabIndex 排列）
-- ========================================================
ns.SPEC_SHORT_NAME = {
    WARRIOR     = { "武器", "狂暴", "防护" },
    PALADIN     = { "神圣", "防护", "惩戒" },
    DEATHKNIGHT = { "鲜血", "冰霜", "邪恶" },
    DRUID       = { "平衡", "野性", "恢复" },
    PRIEST      = { "戒律", "神圣", "暗影" },
    SHAMAN      = { "元素", "增强", "恢复" },
    HUNTER      = { "兽王", "射击", "生存" },
    ROGUE       = { "刺杀", "战斗", "敏锐" },
    MAGE        = { "奥术", "火焰", "冰霜" },
    WARLOCK     = { "痛苦", "恶魔", "毁灭" },
}

-- ========================================================
-- 纯DPS职业集合（快速判定，跳过天赋检测）
-- ========================================================
ns.PURE_DPS_CLASSES = {
    HUNTER  = true,
    ROGUE   = true,
    MAGE    = true,
    WARLOCK = true,
}

-- ========================================================
-- 金额格式化函数
-- 输入: amount (数字，单位万金币)
-- 输出: 带 WoW 颜色代码的格式化字符串
-- 整个数字统一颜色，按数量级区分，方便快速识别金额大小
-- 超过 10000 万自动转为 X.Y 亿
-- ========================================================

-- 按数量级区分颜色（整个数字同一个颜色）
-- 1-9万: 白色（小额）
-- 10-99万: 绿色（一般）
-- 100-999万: 金色（较高）
-- 1000-9999万: 橙色（高额）
-- 1亿+: 红色（超高）
function ns.FormatGoldAmount(amount)
    if not amount or amount <= 0 then
        return "|cff888888-|r"
    end

    -- 超过 10000 万 → 转为亿
    if amount >= 10000 then
        local yi = amount / 10000
        local yiStr
        if yi == math.floor(yi) then
            yiStr = tostring(math.floor(yi))
        else
            yiStr = string.format("%.1f", yi)
        end
        return "|cffFF4500" .. yiStr .. "亿|r"
    end

    -- 按数量级选择颜色
    local color
    if amount >= 1000 then
        color = "|cffFF8C00"  -- 橙色: 1000-9999万
    elseif amount >= 100 then
        color = "|cffFFD700"  -- 金色: 100-999万
    elseif amount >= 10 then
        color = "|cff00FF00"  -- 绿色: 10-99万
    else
        color = "|cffFFFFFF"  -- 白色: 1-9万
    end

    return color .. math.floor(amount) .. "万|r"
end

-- ========================================================
-- 获取玩家天赋缩写名 + 职业颜色
-- 返回: label (string), classColor (table {r,g,b})
-- 示例: "防护战", {r=0.78, g=0.61, b=0.43}
-- ========================================================
function ns.GetPlayerSpecLabel()
    local _, classFileName = UnitClass("player")
    if not classFileName then
        return "未知", {r = 1, g = 1, b = 1}
    end

    local classColor = RAID_CLASS_COLORS[classFileName]
    if not classColor then
        classColor = {r = 1, g = 1, b = 1}
    end

    local classShort = ns.CLASS_SHORT_NAME[classFileName] or classFileName
    local specNames = ns.SPEC_SHORT_NAME[classFileName]

    if not specNames then
        return classShort, classColor
    end

    -- 通过 GetTalentTabInfo 找主天赋页（点数最多的）
    local maxPoints = 0
    local maxTab = 1
    for tab = 1, 3 do
        local _, _, pointsSpent = GetTalentTabInfo(tab, false, false)
        local pts = tonumber(pointsSpent) or 0
        if pts > maxPoints then
            maxPoints = pts
            maxTab = tab
        end
    end

    local specShort = specNames[maxTab] or ""
    return specShort .. classShort, classColor
end

-- ========================================================
-- 专精数据（全局共享，供 PlayerSquareFrame / CreatorFrame 等使用）
-- ========================================================
ns.SPEC_DATA = {
    -- 战士
    {id = 1, class = "WARRIOR", name = "武器", icon = 132355, role = "dps"},
    {id = 2, class = "WARRIOR", name = "狂怒", icon = 132347, role = "dps"},
    {id = 3, class = "WARRIOR", name = "防护", icon = 132341, role = "tank"},
    -- 圣骑士
    {id = 4, class = "PALADIN", name = "神圣", icon = 135920, role = "healer"},
    {id = 5, class = "PALADIN", name = "防护", icon = 135893, role = "tank"},
    {id = 6, class = "PALADIN", name = "惩戒", icon = 135873, role = "dps"},
    -- 猎人
    {id = 7, class = "HUNTER", name = "野兽控制", icon = 132164, role = "dps"},
    {id = 8, class = "HUNTER", name = "射击", icon = 132222, role = "dps"},
    {id = 9, class = "HUNTER", name = "生存", icon = 132215, role = "dps"},
    -- 盗贼
    {id = 10, class = "ROGUE", name = "刺杀", icon = 132292, role = "dps"},
    {id = 11, class = "ROGUE", name = "战斗", icon = 132090, role = "dps"},
    {id = 12, class = "ROGUE", name = "敏锐", icon = 132320, role = "dps"},
    -- 牧师
    {id = 13, class = "PRIEST", name = "戒律", icon = 135940, role = "healer"},
    {id = 14, class = "PRIEST", name = "神圣", icon = 135920, role = "healer"},
    {id = 15, class = "PRIEST", name = "暗影", icon = 136207, role = "dps"},
    -- 死亡骑士
    {id = 16, class = "DEATHKNIGHT", name = "鲜血", icon = 135770, role = "tank"},
    {id = 17, class = "DEATHKNIGHT", name = "冰霜", icon = 135773, role = "dps"},
    {id = 18, class = "DEATHKNIGHT", name = "邪恶", icon = 135775, role = "dps"},
    -- 萨满祭司
    {id = 19, class = "SHAMAN", name = "元素", icon = 136048, role = "dps"},
    {id = 20, class = "SHAMAN", name = "增强", icon = 136051, role = "dps"},
    {id = 21, class = "SHAMAN", name = "恢复", icon = 136052, role = "healer"},
    -- 法师
    {id = 22, class = "MAGE", name = "奥术", icon = 135932, role = "dps"},
    {id = 23, class = "MAGE", name = "火焰", icon = 135810, role = "dps"},
    {id = 24, class = "MAGE", name = "冰霜", icon = 135846, role = "dps"},
    -- 术士
    {id = 25, class = "WARLOCK", name = "痛苦", icon = 136145, role = "dps"},
    {id = 26, class = "WARLOCK", name = "恶魔学识", icon = 136172, role = "dps"},
    {id = 27, class = "WARLOCK", name = "毁灭", icon = 136186, role = "dps"},
    -- 德鲁伊
    {id = 28, class = "DRUID", name = "平衡", icon = 136096, role = "dps"},
    {id = 29, class = "DRUID", name = "野性战斗", icon = 132276, role = "dps"},
    {id = 30, class = "DRUID", name = "野性守护", icon = 132276, role = "tank"},
    {id = 31, class = "DRUID", name = "恢复", icon = 136041, role = "healer"},
}

-- specId → spec 快速查找表
ns.SPEC_DATA_MAP = {}
for _, spec in ipairs(ns.SPEC_DATA) do
    ns.SPEC_DATA_MAP[spec.id] = spec
end
