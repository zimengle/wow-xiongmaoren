-- Activities.lua
-- 英雄团本活动定义

---@type MeetingHornHeroicNS
local ns = select(2, ...)

-- 团本活动定义
-- 这里定义了所有支持的25人英雄团本

-- 初始化活动数据
function ns.InitializeActivities()
    -- 确保 raidData 存在
    if not ns.raidData then
        ns.Addon:Print("团本数据未初始化")
        return
    end

    -- 验证所有团本数据的完整性
    for raidId, raidData in pairs(ns.raidData) do
        -- 确保所有必要字段都存在
        assert(raidData.name, "团本名称不能为空: " .. raidId)
        assert(raidData.maxPlayers == 25, "只支持25人英雄模式: " .. raidData.name)
        assert(raidData.difficulty == ns.SPEC.HEROIC_25, "必须是英雄难度: " .. raidData.name)
        
        -- 设置默认值
        raidData.shortName = raidData.shortName or raidData.name
        raidData.description = raidData.description or ("经典" .. raidData.name .. "25人英雄模式")
        
        -- 验证BOSS图片路径
        if not raidData.bossImage then
            -- 设置默认BOSS图片
            local defaultImages = {
                [ns.SPEC.NAXXRAMAS] = "Interface/Icons/Achievement_Boss_KelThuzad",
                [ns.SPEC.OBSIDIAN_SANCTUM] = "Interface/Icons/Achievement_Boss_Sartharion",
                [ns.SPEC.EYE_OF_ETERNITY] = "Interface/Icons/Achievement_Boss_Malygos",
                [ns.SPEC.VAULT_OF_ARCHAVON] = "Interface/Icons/Achievement_Boss_Archavon",
                [ns.SPEC.MOLTEN_CORE] = "Interface/Icons/Achievement_Boss_Ragnaros",
                [ns.SPEC.SERPENTSHRINE_CAVERN] = "Interface/Icons/Achievement_Boss_LadyVashj",
                [ns.SPEC.THE_EYE] = "Interface/Icons/Achievement_Boss_KaelThasSunstrider"
            }
            raidData.bossImage = defaultImages[raidId] or "Interface/Icons/Achievement_Boss_Ragnaros"
        end

        -- 验证需求配置
        if not raidData.requirements then
            raidData.requirements = {}
        end

        -- 设置默认装等要求
        if not raidData.requirements.minItemLevel then
            local defaultItemLevels = {
                [ns.SPEC.NAXXRAMAS] = 200,
                [ns.SPEC.OBSIDIAN_SANCTUM] = 200,
                [ns.SPEC.EYE_OF_ETERNITY] = 200,
                [ns.SPEC.VAULT_OF_ARCHAVON] = 200,
                [ns.SPEC.MOLTEN_CORE] = 200,
                [ns.SPEC.SERPENTSHRINE_CAVERN] = 350,
                [ns.SPEC.THE_EYE] = 350
            }
            raidData.requirements.minItemLevel = defaultItemLevels[raidId] or 200
        end
    end

    -- 验证活动模式数据
    for _, mode in ipairs(ns.activityModes) do
        assert(mode.id, "活动模式ID不能为空")
        assert(mode.name, "活动模式名称不能为空")
        assert(mode.description, "活动模式描述不能为空")

        -- 设置默认图标
        mode.icon = mode.icon or "Interface/Icons/INV_Misc_QuestionMark"
    end

    -- 验证职业配置
    for roleName, roleConfig in pairs(ns.classConfigs) do
        assert(roleConfig.classes and #roleConfig.classes > 0, "职业列表不能为空: " .. roleName)
        assert(roleConfig.maxCount and roleConfig.maxCount > 0, "最大数量必须大于0: " .. roleName)
        assert(roleConfig.displayName, "显示名称不能为空: " .. roleName)

        -- 设置默认值
        roleConfig.minCount = roleConfig.minCount or 0
        roleConfig.icon = roleConfig.icon or "Interface/Icons/INV_Misc_QuestionMark"
    end
end

-- 获取团本推荐配置
function ns.GetRecommendedRaidConfiguration(raidId)
    local configs = {
        [ns.SPEC.MOLTEN_CORE] = {
            tank = {
                count = 3,
                classes = {ns.SPEC.WARRIOR, ns.SPEC.PALADIN},
                notes = "需要火抗装备，主坦建议300+火抗"
            },
            healer = {
                count = 6,
                classes = {ns.SPEC.PRIEST, ns.SPEC.PALADIN, ns.SPEC.SHAMAN, ns.SPEC.DRUID},
                notes = "建议配置2个牧师，应对分散治疗需求"
            },
            dps = {
                count = 16,
                classes = {
                    ns.SPEC.MAGE, ns.SPEC.WARLOCK, ns.SPEC.HUNTER,
                    ns.SPEC.ROGUE, ns.SPEC.WARRIOR, ns.SPEC.SHAMAN
                },
                notes = "法师和术士优先，火抗装备有加分"
            },
            special = {
                notes = "全团需要一定火抗，建议150+，主坦300+"
            }
        },
        [ns.SPEC.SERPENTSHRINE_CAVERN] = {
            tank = {
                count = 2,
                classes = {ns.SPEC.WARRIOR, ns.SPEC.PALADIN, ns.SPEC.DEATHKNIGHT},
                notes = "需要自然抗性装备应对某些BOSS"
            },
            healer = {
                count = 7,
                classes = {ns.SPEC.PRIEST, ns.SPEC.PALADIN, ns.SPEC.SHAMAN, ns.SPEC.DRUID},
                notes = "萨满优先，群体治疗能力强"
            },
            dps = {
                count = 16,
                classes = {
                    ns.SPEC.HUNTER, ns.SPEC.MAGE, ns.SPEC.WARLOCK,
                    ns.SPEC.ROGUE, ns.SPEC.WARRIOR, ns.SPEC.SHAMAN, ns.SPEC.DRUID
                },
                notes = "猎人和法系DPS优先，远程输出更安全"
            },
            special = {
                notes = "部分战斗需要自然抗性，建议准备抗性装备"
            }
        },
        [ns.SPEC.THE_EYE] = {
            tank = {
                count = 2,
                classes = {ns.SPEC.WARRIOR, ns.SPEC.PALADIN, ns.SPEC.DEATHKNIGHT},
                notes = "需要奥术抗性应对凯尔萨斯"
            },
            healer = {
                count = 7,
                classes = {ns.SPEC.PRIEST, ns.SPEC.PALADIN, ns.SPEC.SHAMAN, ns.SPEC.DRUID},
                notes = "需要强力单体和群体治疗能力"
            },
            dps = {
                count = 16,
                classes = {
                    ns.SPEC.HUNTER, ns.SPEC.MAGE, ns.SPEC.WARLOCK,
                    ns.SPEC.ROGUE, ns.SPEC.WARRIOR, ns.SPEC.SHAMAN, ns.SPEC.DRUID
                },
                notes = "需要高DPS，凤凰阶段时间紧张"
            },
            special = {
                notes = "凯尔萨斯战斗复杂，建议有经验的队员"
            }
        },
        [ns.SPEC.NAXXRAMAS] = {
            tank = {
                count = 3,
                classes = {ns.SPEC.WARRIOR, ns.SPEC.PALADIN, ns.SPEC.DEATHKNIGHT},
                notes = "四区需要多坦克轮换，建议3坦"
            },
            healer = {
                count = 7,
                classes = {ns.SPEC.PRIEST, ns.SPEC.PALADIN, ns.SPEC.SHAMAN, ns.SPEC.DRUID},
                notes = "蜘蛛区和瘟疫区对治疗压力较大"
            },
            dps = {
                count = 15,
                classes = {
                    ns.SPEC.HUNTER, ns.SPEC.MAGE, ns.SPEC.WARLOCK,
                    ns.SPEC.ROGUE, ns.SPEC.WARRIOR, ns.SPEC.SHAMAN, ns.SPEC.DRUID,
                    ns.SPEC.DEATHKNIGHT
                },
                notes = "塔迪乌斯需要快速走位，远程DPS优先"
            },
            special = {
                notes = "四翼+克尔苏加德，全程约2-3小时，建议有冰抗装备"
            }
        },
        [ns.SPEC.OBSIDIAN_SANCTUM] = {
            tank = {
                count = 2,
                classes = {ns.SPEC.WARRIOR, ns.SPEC.PALADIN, ns.SPEC.DEATHKNIGHT},
                notes = "主坦拉萨塔里奥，副坦处理暮光幼龙"
            },
            healer = {
                count = 6,
                classes = {ns.SPEC.PRIEST, ns.SPEC.PALADIN, ns.SPEC.SHAMAN, ns.SPEC.DRUID},
                notes = "需要快速响应熔岩墙伤害"
            },
            dps = {
                count = 17,
                classes = {
                    ns.SPEC.HUNTER, ns.SPEC.MAGE, ns.SPEC.WARLOCK,
                    ns.SPEC.ROGUE, ns.SPEC.WARRIOR, ns.SPEC.SHAMAN, ns.SPEC.DRUID,
                    ns.SPEC.DEATHKNIGHT
                },
                notes = "三龙模式需要高DPS，快速击杀暮光幼龙"
            },
            special = {
                notes = "可选择保留幼龙增加难度和掉落，三龙模式为最高难度"
            }
        },
        [ns.SPEC.EYE_OF_ETERNITY] = {
            tank = {
                count = 2,
                classes = {ns.SPEC.WARRIOR, ns.SPEC.PALADIN, ns.SPEC.DEATHKNIGHT},
                notes = "一阶段需要稳定坦住玛里苟斯"
            },
            healer = {
                count = 6,
                classes = {ns.SPEC.PRIEST, ns.SPEC.PALADIN, ns.SPEC.SHAMAN, ns.SPEC.DRUID},
                notes = "三阶段使用龙的技能治疗，需要熟悉龙骑术"
            },
            dps = {
                count = 17,
                classes = {
                    ns.SPEC.HUNTER, ns.SPEC.MAGE, ns.SPEC.WARLOCK,
                    ns.SPEC.ROGUE, ns.SPEC.WARRIOR, ns.SPEC.SHAMAN, ns.SPEC.DRUID,
                    ns.SPEC.DEATHKNIGHT
                },
                notes = "一阶段注意火花控制，三阶段熟练使用龙的技能"
            },
            special = {
                notes = "三阶段全员骑龙作战，需要提前熟悉龙骑术技能"
            }
        },
        [ns.SPEC.VAULT_OF_ARCHAVON] = {
            tank = {
                count = 2,
                classes = {ns.SPEC.WARRIOR, ns.SPEC.PALADIN, ns.SPEC.DEATHKNIGHT},
                notes = "主坦副坦交替嘲讽，应对践踏+穿刺"
            },
            healer = {
                count = 6,
                classes = {ns.SPEC.PRIEST, ns.SPEC.PALADIN, ns.SPEC.SHAMAN, ns.SPEC.DRUID},
                notes = "全团分散治疗，注意岩石碎片范围伤害"
            },
            dps = {
                count = 17,
                classes = {
                    ns.SPEC.HUNTER, ns.SPEC.MAGE, ns.SPEC.WARLOCK,
                    ns.SPEC.ROGUE, ns.SPEC.WARRIOR, ns.SPEC.SHAMAN, ns.SPEC.DRUID,
                    ns.SPEC.DEATHKNIGHT
                },
                notes = "5分钟狂暴，需要足够DPS"
            },
            special = {
                notes = "需要占领温特勒湖才能进入，战斗简单但有狂暴计时"
            }
        }
    }

    return configs[raidId] or configs[ns.SPEC.NAXXRAMAS]
end

-- 获取团本难点提示
function ns.GetRaidDifficultyTips(raidId)
    local tips = {
        [ns.SPEC.MOLTEN_CORE] = {
            "拉格纳罗斯的子嗣击退技能威胁巨大",
            "熔岩爆裂需要快速散开",
            "火抗装备必不可少，特别是近战职业",
            "DKP分配建议提前商定"
        },
        [ns.SPEC.SERPENTSHRINE_CAVERN] = {
            "瓦丝琪女士的静电连锁需要注意站位",
            "海度斯需要合理的仇恨管理",
            "莱欧塞拉斯的旋风需要及时躲避",
            "推荐携带自然抗性药水"
        },
        [ns.SPEC.THE_EYE] = {
            "凯尔萨斯四个顾问阶段需要合理分配DPS",
            "武器阶段需要快速拾取传奇武器",
            "重力失效阶段需要适应特殊机制",
            "凤凰阶段是整个战斗的关键时刻"
        },
        [ns.SPEC.NAXXRAMAS] = {
            "蜘蛛区迈克斯纳的网裹需要及时解救队友",
            "瘟疫区洛欧塞布的孢子必须正确分配",
            "军事区四骑士需要合理站位和换坦",
            "克尔苏加德冰冻需要快速打碎冰块"
        },
        [ns.SPEC.OBSIDIAN_SANCTUM] = {
            "熔岩墙从两侧扫来，需要找缺口躲避",
            "保留暮光幼龙会大幅增加难度",
            "三龙模式萨塔里奥攻击力显著提升",
            "熔岩元素需要及时清理避免溢出"
        },
        [ns.SPEC.EYE_OF_ETERNITY] = {
            "一阶段注意控制能量火花，不要被BOSS吸收",
            "二阶段击杀飞盘上的法师，注意反弹技能",
            "三阶段全员骑龙，需要熟悉龙的技能",
            "三阶段治疗龙技能是关键，保持HoT叠加"
        },
        [ns.SPEC.VAULT_OF_ARCHAVON] = {
            "分散站位避免岩石碎片的范围伤害",
            "远离重压跳跃后产生的窒息云雾",
            "践踏后副坦需要及时嘲讽接手",
            "5分钟狂暴计时，DPS不能松懈"
        }
    }

    return tips[raidId] or {"这是一个充满挑战的英雄团本！"}
end

-- 获取团本奖励信息
function ns.GetRaidRewards(raidId)
    local rewards = {
        [ns.SPEC.MOLTEN_CORE] = {
            lootLevel = "装等要求: 200",
            keyItems = {
                "雷霆之怒，逐风者的祝福之剑",
                "萨弗拉斯，炎魔拉格纳罗斯之手",
                "法师T1套装: 魔导师长袍",
                "战士T1套装: 熔火战甲"
            },
            currency = "约300-500金币收益（金团模式）"
        },
        [ns.SPEC.SERPENTSHRINE_CAVERN] = {
            lootLevel = "装等要求: 350",
            keyItems = {
                "瓦丝琪的多彩项链",
                "朝圣者坠饰",
                "T5职业套装头盔",
                "各职业T5套装胸甲"
            },
            currency = "约800-1200金币收益（金团模式）"
        },
        [ns.SPEC.THE_EYE] = {
            lootLevel = "装等要求: 350",
            keyItems = {
                "阿泰施，逐星者的法杖",
                "虚空水晶",
                "T5职业套装护腿",
                "凯尔萨斯的法球"
            },
            currency = "约800-1200金币收益（金团模式）"
        },
        [ns.SPEC.NAXXRAMAS] = {
            lootLevel = "装等要求: 200",
            keyItems = {
                "T7职业套装（多件掉落）",
                "末日决战",
                "夺魂者",
                "流浪者的灾祸徽记"
            },
            currency = "约500-800金币收益（金团模式）"
        },
        [ns.SPEC.OBSIDIAN_SANCTUM] = {
            lootLevel = "装等要求: 200",
            keyItems = {
                "暮光幼龙缰绳（三龙模式）",
                "勇气纹章",
                "T7手套/衣物代币",
                "萨塔里奥掉落的高级装备"
            },
            currency = "约300-500金币收益（金团模式）"
        },
        [ns.SPEC.EYE_OF_ETERNITY] = {
            lootLevel = "装等要求: 200",
            keyItems = {
                "蔚蓝幼龙缰绳",
                "玛里苟斯之眼",
                "T7胸甲代币",
                "英雄钥匙碎片"
            },
            currency = "约300-500金币收益（金团模式）"
        },
        [ns.SPEC.VAULT_OF_ARCHAVON] = {
            lootLevel = "装等要求: 200",
            keyItems = {
                "T7职业套装散件",
                "PVP角斗士套装散件",
                "勇气纹章",
                "随机职业掉落"
            },
            currency = "约200-400金币收益（金团模式）"
        }
    }
    
    return rewards[raidId] or {
        lootLevel = "高级装备",
        keyItems = {"未知物品"},
        currency = "待定收益"
    }
end

-- 验证玩家是否满足团本要求
function ns.ValidatePlayerRequirements(raidId, playerData)
    local raidData = ns.raidData[raidId]
    if not raidData then
        return false, "未知的团本"
    end
    
    local errors = {}
    
    -- 检查等级要求
    if playerData.level < raidData.minLevel then
        table.insert(errors, string.format("等级不足，需要%d级", raidData.minLevel))
    end
    
    -- 检查装等要求
    if raidData.requirements.minItemLevel and playerData.itemLevel then
        if playerData.itemLevel < raidData.requirements.minItemLevel then
            table.insert(errors, string.format("装等不足，需要%d+", raidData.requirements.minItemLevel))
        end
    end
    
    -- 检查职业限制
    if raidData.classRestrictions then
        local validClass = false
        for _, validClassName in ipairs(raidData.classRestrictions) do
            if playerData.class == validClassName then
                validClass = true
                break
            end
        end
        if not validClass then
            table.insert(errors, "职业不符合要求")
        end
    end
    
    if #errors > 0 then
        return false, table.concat(errors, ", ")
    end
    
    return true, "满足要求"
end

-- 生成活动广播消息模板
function ns.GenerateBroadcastTemplate(raidId, modeId, leaderName, comment, neededRoles)
    local raidData = ns.raidData[raidId]
    local modeData = nil
    
    for _, mode in ipairs(ns.activityModes) do
        if mode.id == modeId then
            modeData = mode
            break
        end
    end
    
    if not raidData or not modeData then
        return nil
    end
    
    -- 构建基础消息
    local message = string.format("[%s][%s] %s", 
        raidData.name, 
        modeData.name, 
        comment
    )
    
    -- 添加需求信息
    local needsInfo = {}
    for roleName, count in pairs(neededRoles or {}) do
        if count > 0 then
            local roleConfig = ns.classConfigs[roleName]
            if roleConfig then
                table.insert(needsInfo, string.format("%s%d", roleConfig.displayName, count))
            end
        end
    end
    
    if #needsInfo > 0 then
        message = message .. " [缺: " .. table.concat(needsInfo, ",") .. "]"
    end
    
    -- 添加联系信息
    message = message .. string.format(" 团长:%s", leaderName)
    
    return message
end

-- 初始化活动系统
ns.InitializeActivities()

-- 导出用于其他模块的函数
ns.GetRecommendedConfiguration = ns.GetRecommendedRaidConfiguration
ns.GetDifficultyTips = ns.GetRaidDifficultyTips
ns.GetRaidRewards = ns.GetRaidRewards
ns.ValidatePlayer = ns.ValidatePlayerRequirements
ns.GenerateBroadcast = ns.GenerateBroadcastTemplate