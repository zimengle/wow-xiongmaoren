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