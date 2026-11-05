local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（联盟）
#hardcore
#classic
#tbc
<< Alliance
#name 13-15 Westfall
#version 1
#group RestedXP Survival Guide (A)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#defaultfor Human/Gnome/Dwarf/NightElf
#next 15-18 Darkshore
#displayname 13-15 西部荒野
step
    #sticky
    .goto Elwynn Forest,19.00,81.00
    .zone Westfall >> 前往西部荒野
step
    .goto Westfall,59.95,19.35
    .target 农夫法布隆
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r交谈
    .accept 64 >> 接任务：遗失的怀表
    .accept 109 >> 接任务：向格里安·斯托曼报到
step
    .goto Westfall,59.92,19.42
    .target 弗娜·法布隆
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 36 >> 接任务：杂味炖肉
    .accept 151 >> 接任务：老马布兰契
step
    #completewith SalmaS
    .goto Westfall,56.04,31.23,65 >> 前往萨丁农场
step
    .goto Westfall,56.04,31.23
    .target 农夫萨丁
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .accept 9 >> 接任务：清理荒野
step
    #label SalmaS
    .goto Westfall,56.40,30.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .turnin 36 >> 交任务：杂味炖肉
    .target 萨尔玛·萨丁
    .accept 38 >> 接任务：杂味炖肉
    .accept 22 >> 接任务：猪肝馅饼
step << Human
    #label Lewis
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官刘易斯|r交谈
    .target 军需官刘易斯
    .goto Westfall,57.00,47.17
    .turnin 6285 >> 交任务：返回西部荒野
step
    .goto Westfall,56.33,47.52
    .target 格里安·斯托曼
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 109 >> 交任务：向格里安·斯托曼报到
    .isOnQuest 109
step
    .goto Westfall,56.33,47.52
    .target 格里安·斯托曼
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 12 >> 接任务：西部荒野人民军
step
    #era
    .goto Westfall,56.42,47.62
    .target 丹努文队长
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹努文队长|r交谈
    .accept 102 >> 接任务：西部荒野的豺狼人
step << Human
    #requires Lewis
    .goto Westfall,54.00,53.00
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target 哨兵加里安
    .accept 153 >> 接任务：红色皮质面罩
step << !Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target 哨兵加里安
    .goto Westfall,54.00,53.00
    .accept 153 >> 接任务：红色皮质面罩
step
    .goto Westfall,52.86,53.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
	>>|cRXP_BUY_按需购买食物和水|r << !Warrior !Rogue
	>>|cRXP_BUY_如有需要，购买食物|r << Warrior/Rogue
    .vendor >>|T133918:0|t[长嘴泥鳅]|cRXP_WARN_非常便宜|r
	.target 旅店老板希瑟尔
step
	#completewith bennytime
    >>打开地上的|cRXP_PICK_一袋燕麦|r，并从中拾取|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_通常可在农场围栏或建筑附近找到|r
    .complete 151,1 --Handful of Oats (8)
step
    #completewith HarvestW
    >>击杀|cRXP_ENEMY_幼年血牙野猪|r和|cRXP_ENEMY_小碎尸鸟|r，拾取|cRXP_LOOT_秃鹫肉条|r、|cRXP_LOOT_血牙野猪的头|r和|cRXP_LOOT_血牙野猪的肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +小碎尸鸟
    .mob +碎尸鸟
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .mob +血牙野猪
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .mob +血牙野猪
step
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取|cRXP_LOOT_红色皮质面罩|r
    .goto Westfall,48.21,46.70,60,0
    .goto Westfall,46.74,52.87,60,0
    .goto Westfall,50.74,40.07,60,0
    .goto Westfall,46.21,38.26,60,0
    .goto Westfall,41.21,40.75,60,0
    .goto Westfall,44.57,26.09,60,0
    .goto Westfall,48.21,46.70
    .goto Westfall,41.21,40.75
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者
step
	#label bennytime
    .goto Westfall,49.34,19.27
    >>打开|cRXP_PICK_法布隆的柜子|r，拾取|cRXP_LOOT_法布隆的怀表|r
    >>|cRXP_WARN_调整好镜头角度后，可在屋外拾取|cRXP_PICK_法布隆的柜子|r里的物品|r
	>>|cRXP_WARN_小心|cRXP_ENEMY_本尼·布兰科|r，他的伤害很高|r
    .complete 64,1 --Furlbrow's Pocket Watch
step
	#completewith next
    >>打开地上的|cRXP_PICK_一袋燕麦|r，并从中拾取|cRXP_LOOT_一捧燕麦|r
	>>|cRXP_WARN_通常可在农场围栏或建筑附近找到|r
	.complete 151,1 --Handful of Oats (8)
step
    #era
    .goto Westfall,56.40,13.50,60,0
    .goto Westfall,42.82,14.70,60,0
    .goto Westfall,45.83,13.75,60,0
    .goto Westfall,52.36,14.82,60,0
    .goto Westfall,56.86,13.53,60,0
    .goto Westfall,56.86,13.53,60,0
    .goto Westfall,42.82,14.70,60,0
    .goto Westfall,52.36,14.82,60,0
    .goto Westfall,45.83,13.75
    >>击杀|cRXP_ENEMY_河爪豺狼人|r和|cRXP_ENEMY_河爪斥候|r，拾取|cRXP_LOOT_豺狼人的爪子|r
    .complete 102,1 --Gnoll Paw (8)
    .mob 河爪豺狼人
    .mob 河爪斥候
step
    .goto Westfall,56.40,9.40,60,0
    .goto Westfall,52.13,10.36,60,0
    .goto Westfall,56.40,9.40,60,0
    .goto Westfall,52.13,10.36,60,0
    .goto Westfall,56.40,9.40
    >>击杀|cRXP_ENEMY_鱼人袭击者|r和|cRXP_ENEMY_滩行鱼人|r，拾取|cRXP_LOOT_鱼人的眼球|r
    .collect 730,3,38,1 --Murloc Eye (3)
    .mob 鱼人袭击者
    .mob 滩行鱼人
step
    .goto Westfall,57.48,13.58,60,0
    .goto Westfall,57.23,19.78,60,0
    .goto Westfall,52.13,33.22,60,0
    .goto Westfall,57.06,34.47,60,0
    .goto Westfall,57.23,19.78
    >>打开地上的|cRXP_PICK_一袋燕麦|r，并从中拾取|cRXP_LOOT_一捧燕麦|r
	>>|cRXP_WARN_通常可在农场围栏或建筑附近找到|r
	.complete 151,1 --Handful of Oats (8)
step
    #era
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >> 交任务：遗失的怀表
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .turnin 151 >> 交任务：老马布兰契
    .goto Westfall,59.92,19.42
	.target +弗娜·法布隆
step
    #som
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >> 交任务：遗失的怀表
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .turnin 151 >> 交任务：老马布兰契
    .goto Westfall,59.92,19.42
	.target +弗娜·法布隆
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto Westfall,56.40,30.50
    .turnin 22 >> 交任务：猪肝馅饼
    .isQuestComplete 22
    .target 萨尔玛·萨丁
step
    #completewith next
	.goto Westfall,56.04,31.23
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .vendor
    >>|cRXP_WARN_不要出售|T133884:0|t[鱼人的眼球]、|T135997:0|t[血牙野猪的头]、|T134341:0|t[血牙野猪的肝]或|T133972:0|t[秃鹫肉条]|r
	.target 农夫萨丁
step
    #label HarvestW
    .goto Westfall,53.84,32.00,60,0
    .goto Westfall,50.80,21.76,80,0
    .goto Westfall,44.47,35.35,80,0
    .goto Westfall,53.84,32.00,80,0
    .goto Westfall,50.80,21.76,80,0
    .goto Westfall,44.47,35.35,80,0
    .goto Westfall,53.84,32.00,60,0
    .goto Westfall,44.47,35.35,60,0
    .goto Westfall,50.80,21.76
    >>击杀|cRXP_ENEMY_看守傀儡|r，拾取|cRXP_LOOT_灯油|r和|cRXP_LOOT_秋葵|r
    .complete 9,1 --Harvest Watcher (20)
    .collect 732,3,38,1 --Okra (3)
    .collect 814,5,103,1
    .mob 看守傀儡
step
    .goto Westfall,52.49,42.11,75,0
    .goto Westfall,53.67,46.07,75,0
    .goto Westfall,61.60,45.55,75,0
    .goto Westfall,60.36,27.38,75,0
    .goto Westfall,54.63,19.20,75,0
    .goto Westfall,49.09,26.92,75,0
    .goto Westfall,47.89,42.94,75,0
    .goto Westfall,54.42,40.38
    >>击杀|cRXP_ENEMY_幼年血牙野猪|r和|cRXP_ENEMY_小碎尸鸟|r，拾取|cRXP_LOOT_秃鹫肉条|r、|cRXP_LOOT_血牙野猪的头|r和|cRXP_LOOT_血牙野猪的肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +小碎尸鸟
    .mob +碎尸鸟
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .mob +血牙野猪
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .mob +血牙野猪
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
	.target 农夫萨丁
    .goto Westfall,56.04,31.23
    .turnin 9 >> 交任务：清理荒野
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
	.target 萨尔玛·萨丁
    .goto Westfall,56.40,30.50
    .turnin 38 >> 交任务：杂味炖肉
    .turnin 22 >> 交任务：猪肝馅饼
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
	.target 格里安·斯托曼
    .goto Westfall,56.33,47.52
    .turnin 12 >> 交任务：西部荒野人民军
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
	.target 格里安·斯托曼
    .goto Westfall,56.33,47.52
    .accept 65 >> 接任务：迪菲亚兄弟会
step
    #era
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹努文队长|r交谈
	.target 丹努文队长
    .goto Westfall,56.42,47.62
    .turnin 102 >> 交任务：西部荒野的豺狼人
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
	.target 哨兵加里安
    .goto Westfall,54.00,53.00
    .turnin 153 >> 交任务：红色皮质面罩
step << Druid
    .goto Westfall,32.6,22.6,30,0
    .goto Westfall,38.8,18.2,30,0
    .goto Westfall,41.0,12.0,30,0
    .goto Westfall,47.6,9.0,30,0
    .goto Westfall,51.8,9.4,30,0
    .goto Westfall,32.6,22.6
    .goto Westfall,38.8,18.2,0
    .goto Westfall,41.0,12.0,0
    .goto Westfall,47.6,9.0,0
    .goto Westfall,51.8,9.4,0
    .xp 16 >> 在西部荒野刷螃蟹升至16级
step << Dwarf !Paladin/Gnome
    #label end
    .hs >> 使用炉石返回塞尔萨玛
step << Dwarf !Paladin/Gnome
    #hardcore
    .goto Loch Modan,33.94,50.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
step << Human/Dwarf Paladin
    #label end
    .goto Westfall,56.55,52.64
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Ironforge >> 飞往铁炉堡
    .target 索尔
step << !NightElf
    .goto Ironforge,55.093,58.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·火石|r交谈
    >>提升|T135966:0|t[急救]技能
    .train 3274 >> 学习中级急救
    .target 尼莎·火石
step << Human Warrior
    .goto Ironforge,62.0,89.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯|r交谈
    .train 2567 >>学习投掷技能
    .target 比克斯
step << Dwarf Paladin
    .goto Ironforge,24.55,4.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔杜克·凝眉|r交谈
    .trainer >> 学习职业技能
    .target 贝尔杜克·凝眉
step << Dwarf Paladin
    #completewith next
    .goto Ironforge,25.27,1.53,6,0
    .goto Ironforge,24.35,11.90,10 >> 上楼前往|cRXP_FRIENDLY_穆里顿|r处
step << Dwarf Paladin
    .goto Ironforge,23.539,8.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆里顿·热炉|r交谈
    .turnin 1784 >>交任务：圣洁之书
    .accept 1785 >>接任务：圣洁之书
    .target 穆里顿·热炉
step << Dwarf Paladin
    .goto Ironforge,27.63,12.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 1785 >>交任务：圣洁之书
    .target 蒂萨·热炉
step
    .goto Ironforge,39.553,57.478
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_参议员巴林·红石|r交谈
    .turnin 291 >> 交任务：森内尔的报告
    .target 参议员巴林·红石
    .isOnQuest 291
step
    #ah
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁炉堡拍卖师|r交谈
    >>购买以下物品，稍后到黑海岸可立即交付相应任务；如果不想购买，可跳过此步骤
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师林姆克
    .target 拍卖师雷姆斯
    .target 拍卖师巴克尔
    .zoneskip Ironforge,1
step << !NightElf
    #hardcore
    .goto Dun Morogh,53.5,34.9
    .zone Dun Morogh>>离开铁炉堡
step << !NightElf
    #hardcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >> 前往丹莫罗通往湿地的捷径起点
step << !NightElf
    #hardcore
    .goto Dun Morogh,59.5,42.8,40,0
    .goto Dun Morogh,60.4,44.1,40,0
    .goto Dun Morogh,61.1,44.1,40,0
    .goto Dun Morogh,61.2,42.3,40,0
    .goto Dun Morogh,60.8,40.9,40,0
    .goto Dun Morogh,59.0,39.5,40,0
    .goto Dun Morogh,60.3,38.6,40,0
    .goto Dun Morogh,61.7,38.7,40,0
    .goto Dun Morogh,65.7,21.6,40,0
    .goto Dun Morogh,65.8,12.5,40,0
    .goto Dun Morogh,65.6,10.8,40,0
    .goto Dun Morogh,66.5,10.0,40,0
    .goto Dun Morogh,66.9,8.5,40,0
    .goto Wetlands,20.6,67.2,50,0
    .goto Wetlands,17.7,67.7,40,0
    .goto Wetlands,16.8,65.3,40,0
    .goto Wetlands,15.1,64.0,40,0
    .goto Wetlands,12.1,60.3,40,0
    >>|cRXP_WARN_先观看视频，了解如何走这条捷径！|r
    >>|cRXP_WARN_走无需死亡的丹莫罗通往湿地捷径|r
    >>|cRXP_WARN_过水时避开|cRXP_ENEMY_湿地鳄鱼|r和|cRXP_ENEMY_鱼人|r|r
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >> |cRXP_WARN_点击此处查看视频指南|r
    .goto Wetlands,12.1,60.3,80 >> 前往米奈希尔港
    .mob 湿地鳄鱼
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
step << !NightElf
    .money <0.08
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto Wetlands,10.761,56.737
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔·奥雷|r交谈
    .vendor >> |cRXP_BUY_购买一根|r|T133024:0|t[青铜管]
    >>|cRXP_WARN_此物品限量出售；如果|cRXP_FRIENDLY_尼尔·奥雷|r没有货，就跳过此步骤|r
	.target 尼尔·奥雷
    .bronzetube
step << !NightElf
    .goto Wetlands,10.43,61.01,10,0
    .goto Wetlands,10.496,60.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_萨莫尔·菲斯蒂沃斯|r交谈
    .vendor >> |cRXP_BUY_尽量买下现有的|r|T134831:0|t[治疗药水]|cRXP_BUY_存货|r
    >>|cRXP_WARN_此物品限量出售；如果|cRXP_FRIENDLY_萨莫尔·菲斯蒂沃斯|r没有货，就跳过此步骤|r
    .target 萨莫尔·菲斯蒂沃斯
step << !NightElf
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_谢尔雷|r交谈
    .fp Wetlands>> 开通湿地飞行路线
    .target 谢尔雷·布隆迪尔
step << Hunter !NightElf
	.goto Wetlands,11.334,59.554
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆恩达·德斯|r交谈
    >>|cRXP_WARN_购买|r |T135612:0|t[大口径短枪]
    >>如果买不起，跳过此步骤
	.collect 3023,1 -- Large Bore Blunderbuss
    .target 穆恩达·德斯
step << !NightElf
    .goto Wetlands,7.95,56.38
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德温·晨光|r交谈
    .vendor >> |cRXP_BUY_尽量买下现有的|r|T134831:0|t[治疗药水]|cRXP_BUY_存货|r
    >>|cRXP_WARN_此物品限量出售；如果|cRXP_FRIENDLY_德温·晨光|r没有货，就跳过此步骤|r
    .target 德温·晨光
step << !NightElf
    #completewith next
    .goto Wetlands,7.10,57.96,30,0
    .goto Wetlands,4.61,57.26,15 >> 前往米奈希尔港码头，等待前往黑海岸的船
step << !NightElf
    .zone Darkshore >> 乘船前往黑海岸
    >>|cRXP_WARN_提升|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能，利用等候黑海岸船只的时间练习|r
    >>|cRXP_WARN_提升|r|T133971:0|t[烹饪]|cRXP_WARN_技能，使用|r|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_（之前刷到的），最好练至10点|r
step << NightElf !Druid
    .goto Westfall,56.556,52.643
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fp Westfall >> 开通西部荒野飞行路线
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step << Druid
	#completewith next
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
step << Druid
    .goto Moonglade,44.1444,45.227
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r交谈
    .skipgossip 1
    .fly Teldrassil >> 飞往鲁瑟兰村
    .target 希尔瓦·菲纳雯斯
step << Druid
    #completewith next
    .goto Teldrassil,55.889,89.456
    .zone Darnassus >> 通过紫色传送门进入达纳苏斯
step << Druid
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .accept 6121 >> 接任务：新的课程
    .accept 26 >> 接任务：必修的课程
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
step << Druid
	#completewith next
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
step << Druid
    .goto Moonglade,56.21,30.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 6121 >> 交任务：新的课程
    .accept 6122 >> 接任务：毒水之源
    .turnin 26 >> 交任务：必修的课程
    .accept 29 >> 接任务：湖中试炼
    .target 德迪利特·星焰
step << Druid
    .goto Moonglade,52.6,51.6
    >>游进月神湖
    >>打开|cRXP_PICK_神殿灵珠容器|r，拾取|T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_它可能出现在水下的不同位置|r
    .collect 15877,1,29,1 -- Shrine Bauble (1)
step << Druid
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    >>|cRXP_WARN_这样更快，无需长时间游泳|r
step << Druid
    .goto Moonglade,36.026,41.374
    .use 15877 >>|cRXP_WARN_使用|r |T134125:0|t[神殿灵珠]|cRXP_WARN_（在雷姆洛斯神殿的树旁）|r
    .complete 29,1 --Complete the Trial of the Lake.
step << Druid
    .goto Moonglade,36.517,40.104
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔加里|r交谈
    .turnin 29 >> 交任务：湖中试炼
    .target 塔加里
    .accept 272 >> 接任务：海狮试炼
step << NightElf Priest
    .goto StormwindClassic,38.550,26.853
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r交谈
    .trainer >> 学习职业技能
    .target 乔舒修士
step << NightElf Warrior
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    .vendor >> |cRXP_BUY_购买|r|T133046:0|t[巨型石锤]|cRXP_BUY_，前提是有足够的钱|r
    .target 冈瑟尔·维勒
step << NightElf Rogue
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    .vendor >> |cRXP_BUY_购买|r|T133052:0|t[重型钉锤]|cRXP_BUY_，前提是有足够的钱|r
    .target 冈瑟尔·维勒
step << NightElf Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .target 吴平
    .goto StormwindClassic,57.130,57.704
    .train 201 >> 学习单手剑（1h）技能
step << NightElf Hunter
    .goto StormwindClassic,49.990,57.641
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_购买|r |T135490:0|t[强化弓]
    >>|cRXP_BUY_补充|r|T132382:0|t[锋利的箭]
    .collect 3026,1
    .target 弗德瑞克·斯图瓦
step << NightElf !Druid
    .goto StormwindClassic,43.065,26.156
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>提升|T135966:0|t[急救]技能
    .train 3274 >> 学习中级急救
    .target 珊娜·弗勒
step << NightElf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_武神|r或|cRXP_FRIENDLY_伊尔萨|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾
step << NightElf Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯伯|r交谈
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
step << NightElf Hunter
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛
step << NightElf
    .hs >> 使用炉石返回奥伯丁
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（联盟）
#hardcore
#classic
#tbc
<< Alliance
#name 15-18 Darkshore
#version 1
#group RestedXP Survival Guide (A)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
--#defaultfor !NightElf
#next 18-19 Loch Modan
#displayname 15-18 黑海岸
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
	.target 温尼斯·布莱葛
    .goto Darkshore,36.71,44.98,5,0
    .goto Felwood,19.10,20.63
    .accept 3524 >> 接任务：搁浅的巨兽
step << !NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
	.target 凯莱斯·月羽
    .goto Darkshore,36.336,45.574
    .fp Auberdine >> 开通奥伯丁飞行点
step << !NightElf
    .goto Darkshore,37.04,44.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板莎希因|r交谈
    .home >> 将炉石绑定在奥伯丁
    .target 旅店老板莎希因
step
    #completewith next
    .goto Darkshore,36.70,43.78,5 >> 走上楼梯前往 |cRXP_FRIENDLY_维兹班恩·曲针|r
step
#map Darkshore
    .goto Felwood,19.51,18.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >> 接任务：传声盒827号
    .target 维兹班恩·曲针
step
#map Darkshore
    .goto Felwood,21.63,18.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >> 接任务：瘟疫蔓延
    .target 萨纳瑞恩·绿树
step
#map Darkshore
    #label BigThreat
    .goto Felwood,22.24,18.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >> 接任务：熊怪的威胁
    .target 特伦希斯
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .goto Darkshore,36.096,44.931
    .accept 1141 >> 接任务：钓鱼世家
    .turnin 1141 >> 交任务：钓鱼世家
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target 古博·布拉普
step
    #completewith RabidThistle
    .goto Darkshore,35.88,47.01,0
    .goto Darkshore,36.50,53.30,0
    .goto Darkshore,35.72,55.84,0
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，获取|cRXP_LOOT_蟹腿|r
    >>|cRXP_WARN_你可能得下水才能看到它们|r
    .complete 983,1
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
#map Darkshore
    .goto Felwood,18.81,26.69
    >>拾取|cRXP_PICK_搁浅的海洋生物|r获得|cRXP_LOOT_海洋生物的骸骨|r
    .complete 3524,1
step
#map Darkshore
    .goto Felwood,22.39,29.45
    >>发现熊怪营地
    .complete 984,1 -- Find a corrupt furbolg camp
step
    #label RabidThistle
    .goto Darkshore,38.47,57.92,50,0
    .goto Darkshore,39.79,58.33,50,0
    .goto Darkshore,38.86,60.72,50,0
    .goto Darkshore,38.47,57.92
    .use 7586 >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望]|cRXP_WARN_捕捉|r|cRXP_ENEMY_狂暴蓟熊|r
    .complete 2118,1
    .unitscan 狂暴蓟熊
step
    .goto Darkshore,36.53,53.39,55,0
    .goto Darkshore,36.38,55.96,55,0
    .goto Darkshore,35.11,54.69,55,0
    .goto Darkshore,35.79,47.35,55,0
    .goto Darkshore,36.53,53.39
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，获取|cRXP_LOOT_蟹腿|r
    >>|cRXP_WARN_你可能得下水才能看到它们|r
    .complete 983,1
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
#map Darkshore
    .goto Felwood,19.13,21.39
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .turnin 983 >> 交任务：传声盒827号
step
#map Darkshore
	#era/som
	.goto Felwood,19.13,21.39
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .accept 1001 >> 接任务：传声盒411号
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
	.target 温尼斯·布莱葛
    .goto Darkshore,36.71,44.98,10,0
    .goto Felwood,19.10,20.63
    .turnin 3524 >> 交任务：搁浅的巨兽
    .accept 4681 >> 接任务：搁浅的巨兽
step
    #completewith next
    .goto Darkshore,36.88,44.10,8,0
    .goto Darkshore,36.01,43.77,10 >> 前往码头上的 |cRXP_FRIENDLY_塞瑞利恩·白爪|r
step
#map Darkshore
    .goto Felwood,18.10,18.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >> 接任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #completewith next
    .goto 1439,32.432,43.744,15 >> 走到码头尽头然后跳入水中
step
    #era/som
    #completewith washed1
    .goto Darkshore,33.59,40.36,0
    .goto Darkshore,30.94,45.79,0
    .goto Darkshore,33.03,48.13,0
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，获取|cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1
    .mob 黑海岸蛇颈龙
step
#map Darkshore
    .goto Felwood,13.63,21.44
    >>拾取|cRXP_PICK_海龟骨头|r获得|cRXP_LOOT_海龟的残骸|r
    .complete 4681,1
step
#map Darkshore
    #label washed1
    .goto Darkshore,36.71,44.98,10,0
    .goto Felwood,19.10,20.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4681 >> 交任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
.group
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
	.target 巴瑞萨斯·月影
    .goto Felwood,19.90,18.40
    .accept 947 >> 接任务：洞中的蘑菇
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
	.target 哨兵戈琳达·纳希恩
    .goto Felwood,20.34,18.12
    .accept 4811 >> 接任务：红色水晶
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
	.target 萨纳瑞恩·绿树
    .goto Felwood,21.63,18.15
    .turnin 2118 >> 交任务：瘟疫蔓延
    .accept 2138 >> 接任务：清除疫病
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
	.target 特伦希斯
    .goto Felwood,22.24,18.22
    .turnin 984 >> 交任务：熊怪的威胁
    .accept 985 >> 接任务：熊怪的威胁
    .accept 4761 >> 接任务：桑迪斯·织风
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
	.target 高尔博德·钢手
    .goto Felwood,20.80,15.58
    .accept 982 >> 接任务：深不可测的海洋
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
	.target 桑迪斯·织风
    .goto Felwood,19.98,14.40
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 958 >> 接任务：上层精灵的工具
    .accept 954 >> 接任务：巴莎兰
step
	#era/som
    #completewith MistVeil
    .goto Darkshore,35.44,35.83,55,0
    .goto Darkshore,35.71,32.27,55,0
    .goto Darkshore,35.44,35.83,0
    .goto Darkshore,35.71,32.27,0
    .goto Darkshore,36.70,30.00,0
    .goto Darkshore,38.73,28.25,0
    .goto Darkshore,40.17,28.76,0
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，获取|cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1
    .mob 黑海岸蛇颈龙
step
    #completewith next
    .goto Darkshore,38.95,29.36,30 >> 游向银色清晨号沉船
step
#map Darkshore
    .goto Darkshore,38.95,29.36,10,0
    .goto Felwood,20.94,1.49
    >>|cRXP_WARN_从底部破损的船体进入沉没的银色清晨号，下潜前确保呼吸条充满|r
    >>拾取地面上的|cRXP_LOOT_银色清晨号的保险箱|r
    .complete 982,1
step
    #completewith next
    .goto Darkshore,40.30,27.56,30 >> 游向迷雾之纱号沉船
step
    #label MistVeil
    .goto Darkshore,40.30,27.56,10,0
    .goto Darkshore,39.63,27.45
    >>|cRXP_WARN_从底部破损的船体进入沉没的迷雾之纱号，下潜前确保呼吸条充满|r
    >>拾取地面上的|cRXP_LOOT_迷雾之纱号的保险箱|r
    .complete 982,2
step
    #era/som
    .goto Darkshore,40.17,28.76,0
    .goto Darkshore,38.73,28.25,0
    .goto Darkshore,36.70,30.00,0
    .goto Darkshore,40.17,28.76,55,0
    .goto Darkshore,38.73,28.25,55,0
    .goto Darkshore,36.70,30.00,55,0
    .goto Darkshore,35.71,32.27,55,0
    .goto Darkshore,35.44,35.83,55,0
    .goto Darkshore,35.71,32.27,55,0
    .goto Darkshore,35.44,35.83
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，获取|cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1
    .mob 黑海岸蛇颈龙
step
#map Darkshore
	#era/som
    .goto Felwood,25.19,1.29
    >>点击地面上的|cRXP_PICK_传声盒411号|r
    .turnin 1001 >> 交任务：传声盒411号
    .accept 1002 >> 接任务：传声盒323号
step
#map Darkshore
    .goto Felwood,25.15,4.61
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物
step << Druid
    #completewith cure1
    >>任务过程中收集 5 个 |T134187:0|t[地根草]
    .collect 2449,5,6123,1
step
    #completewith Ameth
    >>击杀|cRXP_ENEMY_森林陆行鸟|r和|cRXP_ENEMY_森林陆行鸟雏鸟|r，获取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat
    .mob 森林陆行鸟雏鸟
    .mob 森林陆行鸟
step
    #era/som
    #completewith Ameth
    >>击杀|cRXP_ENEMY_月夜猛虎|r和|cRXP_ENEMY_月夜猛虎幼崽|r，获取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .unitscan 月夜猛虎;月夜猛虎幼崽
step
    #completewith bears1
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step
    .goto Darkshore,44.18,20.60
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4725 >> 接任务：搁浅的海龟
step
    .goto Darkshore,50.81,25.50
    .use 12350 >>|cRXP_WARN_使用|r |T134865:0|t[空的水样试管]|cRXP_WARN_在壁泉河靠海的瀑布下方水潭中取水样|r
    .complete 4762,1
step
#map Darkshore
    #completewith next
    .goto Felwood,27.70,10.03,60 >> 前往巴莎兰
step
#map Darkshore
    #label bears1
    .goto Felwood,27.70,10.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_途中不要击杀|cRXP_ENEMY_野生劣魔|r和|cRXP_ENEMY_恶灵劣魔|r|r
    .turnin 954 >> 交任务：巴莎兰
    .accept 955 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    .goto Darkshore,44.78,37.91,40,0
    .goto Darkshore,45.43,39.15,40,0
    .goto Darkshore,46.30,39.01,40,0
    .goto Darkshore,47.36,36.86,40,0
    .goto Darkshore,44.80,36.91,40,0
    .goto Darkshore,46.30,39.01
    >>击杀|cRXP_ENEMY_野生劣魔|r和|cRXP_ENEMY_恶灵劣魔|r，获取|cRXP_LOOT_劣魔耳环|r
    .complete 955,1
    .mob 野生劣魔
    .mob 恶灵劣魔
step
#map Darkshore
    .goto Felwood,27.70,10.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 955 >> 交任务：巴莎兰
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    .goto Darkshore,45.88,38.56,40,0
    .goto Darkshore,46.76,39.13,40,0
    .goto Darkshore,47.69,36.73,40,0
    .goto Darkshore,45.07,36.76
    >>击杀|cRXP_ENEMY_戴瑟雷萨特|r，获取|cRXP_LOOT_远古月亮石封印|r
    .complete 956,1
    .mob 戴瑟雷萨特
step
#map Darkshore
    .goto Felwood,27.70,10.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 956 >> 交任务：巴莎兰
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
step << !NightElf
#map Darkshore
    .goto Felwood,31.29,24.14
    >>击杀|cRXP_ENEMY_月夜枭兽|r，获取 |T132832:0|t[|cRXP_LOOT_小蛋|r]
    >>|cRXP_WARN_稍后将把|r |T133971:0|t[烹饪]|cRXP_WARN_练到 10 点，材料为|r |T132832:0|t[|cRXP_LOOT_小蛋|r]
    .collect 6889,10,2178,1,0x21,cooking -- Small Egg
    >>前往|cRXP_PICK_红色水晶|r
    .complete 4811,1
step << NightElf
#map Darkshore
    .goto Felwood,31.29,24.14
    >>前往|cRXP_PICK_红色水晶|r
    .complete 4811,1
step
    .goto Darkshore,45.34,49.70,60,0
    .goto Darkshore,45.48,45.24,60,0
    .goto Darkshore,42.73,45.67,60,0
    .goto Darkshore,45.34,49.70,60,0
    .goto Darkshore,45.48,45.24,60,0
    .goto Darkshore,42.73,45.67
    >>击杀|cRXP_ENEMY_月夜枭兽|r，获取 |T132832:0|t[|cRXP_LOOT_小蛋|r]
    .collect 6889,10,2178,1,0x20,cooking -- Small Egg
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
step
    #completewith next
    .goto Darkshore,40.30,59.70,70 >> 向南前往亚米萨兰的 |cRXP_FRIENDLY_哨兵坦莎·月刃|r
step
    #label Ameth
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
	.target 哨兵坦莎·月刃
    .goto Darkshore,40.30,59.70
    .accept 953 >> 接任务：亚米萨兰的毁灭
step
    #completewith TheLay
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_ENEMY_安娜雅·晨路|r|cRXP_WARN_在亚米萨兰巡逻|r
    .complete 963,1
    .unitscan 安娜雅·晨路
step
    #completewith TheLay
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r、|cRXP_ENEMY_挣扎的贵族|r和|cRXP_ENEMY_哀嚎的贵族|r，拾取|cRXP_LOOT_上层精灵的遗物|r
    .complete 958,1
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
    .mob 哀嚎的贵族
step
#map Darkshore
    .goto Felwood,25.98,40.62
    >>点击|cRXP_PICK_亚米萨兰的毁灭|r（石板）
    .complete 953,2 -- The Fall of Ameth'Aran
step
#map Darkshore
    .goto Felwood,25.66,39.11
    >>点击|cRXP_PICK_上古之火|r
    .complete 957,1
step
    #label TheLay
    .goto Darkshore,43.30,58.70
    >>点击|cRXP_PICK_亚米萨兰的衰落|r（石板）
    .complete 953,1 -- The Lay of Ameth'Aran
step
    #completewith next
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_ENEMY_安娜雅·晨路|r|cRXP_WARN_在亚米萨兰巡逻|r
    .complete 963,1
    .unitscan 安娜雅·晨路
step
    .goto Darkshore,41.91,57.92,50,0
    .goto Darkshore,41.81,59.77,50,0
    .goto Darkshore,41.98,62.13,50,0
    .goto Darkshore,42.92,62.50,50,0
    .goto Darkshore,43.30,58.70,50,0
    .goto Darkshore,41.91,57.92,50,0
    .goto Darkshore,41.81,59.77,50,0
    .goto Darkshore,41.98,62.13,50,0
    .goto Darkshore,42.92,62.50,50,0
    .goto Darkshore,43.30,58.70
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r、|cRXP_ENEMY_挣扎的贵族|r和|cRXP_ENEMY_哀嚎的贵族|r，拾取|cRXP_LOOT_上层精灵的遗物|r
    .complete 958,1
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
    .mob 哀嚎的贵族
step
    .goto Darkshore,41.91,57.92,50,0
    .goto Darkshore,41.81,59.77,50,0
    .goto Darkshore,41.98,62.13,50,0
    .goto Darkshore,42.92,62.50,50,0
    .goto Darkshore,43.30,58.70,50,0
    .goto Darkshore,41.91,57.92,50,0
    .goto Darkshore,41.81,59.77,50,0
    .goto Darkshore,41.98,62.13,50,0
    .goto Darkshore,42.92,62.50,50,0
    .goto Darkshore,43.30,58.70
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_ENEMY_安娜雅·晨路|r|cRXP_WARN_在亚米萨兰巡逻，刷新时间较长；若当前不在，可以跳过此步骤|r
    .complete 963,1
    .unitscan 安娜雅·晨路
step
#map Darkshore
    .goto Felwood,23.29,36.73
    .target 哨兵坦莎·月刃
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .turnin 953 >> 交任务：亚米萨兰的毁灭
step
    #era/som
    #completewith ReturnAuber
    >>击杀|cRXP_ENEMY_月夜猛虎|r和|cRXP_ENEMY_月夜猛虎幼崽|r，获取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .unitscan 月夜猛虎;月夜猛虎幼崽
step
    #completewith BearComplete
    >>击杀|cRXP_ENEMY_森林陆行鸟|r和|cRXP_ENEMY_森林陆行鸟雏鸟|r，获取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat
    .mob 森林陆行鸟雏鸟
    .mob 森林陆行鸟
step
    #completewith Beached4728
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step
    >>击杀|cRXP_ENEMY_黑木探路者|r和|cRXP_ENEMY_黑木风语者|r
    .goto Darkshore,39.84,53.82,50,0
    .goto Darkshore,40.03,56.24,50,0
    .goto Darkshore,39.34,56.58,50,0
    .goto Darkshore,39.84,53.82
    .complete 985,1 -- Blackwood Pathfinder
    .mob +黑木探路者
    .complete 985,2 -- Blackwood Windtalker
    .mob +黑木风语者
step
#map Darkshore
    .goto Felwood,22.39,29.45
    .xp 16 >> 去刷怪升到 16 级
step
#map Darkshore
    .goto Felwood,19.64,39.52
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >> 接任务：搁浅的海龟
step
#map Darkshore
    #label Beached4728
    .goto Felwood,18.41,49.43
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4728 >> 接任务：搁浅的海洋生物
step
    #label BearComplete
    .goto Darkshore,40.11,69.39,60,0
    .goto Darkshore,43.37,68.78,70,0
    .goto Darkshore,41.97,64.81,70,0
    .goto Darkshore,38.51,64.72,70,0
    .goto Darkshore,38.67,59.54,60,0
    .goto Darkshore,40.11,69.39
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step
    .goto Darkshore,40.11,69.39,60,0
    .goto Darkshore,43.37,68.78,70,0
    .goto Darkshore,41.97,64.81,70,0
    .goto Darkshore,38.51,64.72,70,0
    .goto Darkshore,38.67,59.54,60,0
    .goto Darkshore,40.11,69.39
    >>击杀|cRXP_ENEMY_森林陆行鸟|r和|cRXP_ENEMY_森林陆行鸟雏鸟|r，获取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat
    .mob 森林陆行鸟雏鸟
    .mob 森林陆行鸟
step
#map Darkshore
    #label ReturnAuber
    #completewith ManyBeached
    .goto Felwood,18.50,19.87,100 >> 前往奥伯丁
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
	.target 古博·布拉普
    .goto Felwood,18.50,19.87
    .accept 1138 >> 接任务：海中的水果
step
#map Darkshore
    #label ManyBeached
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
	.target 温尼斯·布莱葛
    .goto Darkshore,36.71,44.98,5,0
    .goto Felwood,19.10,20.63
    .turnin 4723 >> 交任务：搁浅的海洋生物
    .turnin 4728 >> 交任务：搁浅的海洋生物
    .turnin 4722 >> 交任务：搁浅的海龟
    .turnin 4725 >> 交任务：搁浅的海龟
step
    #completewith next
    .goto Darkshore,36.88,44.10,8,0
    .goto Darkshore,36.01,43.77,10 >> 前往码头上的 |cRXP_FRIENDLY_塞瑞利恩·白爪|r
step
#map Darkshore
	.isQuestComplete 963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
	.target 塞瑞利恩·白爪
    .goto Felwood,18.10,18.48
    .turnin 963 >> 交任务：永志不渝
step << !NightElf !Mage !Paladin !Warlock
    .goto Darkshore,33.17,40.17,40,0
    .goto Darkshore,33.17,40.17,0
    .zone Teldrassil >> 乘船前往达纳苏斯
    .zoneskip Darnassus
step << !NightElf !Mage !Paladin !Warlock
    #completewith next
    .goto Teldrassil,55.889,89.456
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯
step << !NightElf Hunter
    .goto Darnassus,40.377,8.545
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .trainer >> 学习职业技能
    .target 祖卡斯特
step << !NightElf Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾德莉亚|r交谈
    .goto Darnassus,37.901,82.742
    .trainer >> 学习职业技能
    .target 贾德莉亚
step << !NightElf Warrior
    .goto Darnassus,58.945,35.336
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达纳斯·刃歌|r交谈
    .trainer >> 学习职业技能
    .target 达纳斯·刃歌
step << !NightElf Rogue
    .goto Darnassus,31.21,17.72,8,0
    .goto Darnassus,36.99,21.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树屋内的|cRXP_FRIENDLY_塞尤娜|r交谈
    .trainer >> 学习职业技能
    .target 塞尤娜
step << !NightElf Hunter/!NightElf Warrior
    #sticky
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .skipgossip 11866,1
    .goto Darnassus,57.56,46.72
    .train 264 >> 学习弓箭
    .train 227 >> 学习[法杖]
    .target 伊琳尼雅·月火
step << !NightElf !Mage !Paladin !Warlock
    .goto Darnassus,30.7,41.3,15 >> 穿过紫色传送门返回 鲁瑟兰村
    .zoneskip Darkshore
    .zoneskip Teldrassil
step << !NightElf !Mage !Paladin !Warlock
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >> 飞往黑海岸
    .target 维斯派塔斯
step
    #completewith next
    .goto Darkshore,38.109,41.170,5,0
    .goto Darkshore,37.512,41.674
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    +购买 |T134059:0|t[甜香料]
    >>|cRXP_WARN_使用|r |T134059:0|t[甜香料]|cRXP_WARN_和|r |T132832:0|t[小蛋]|cRXP_WARN_制作草药烘蛋，直到烹饪技能达到 10 点|r
    .skill cooking,10,1 -- step only displays if cooking skill is less than 10
    .target 高尔博德·钢手
step
    #completewith ezstrider
    +|cRXP_WARN_使用|r |T133971:0|t[烹饪]|cRXP_WARN_专业制作草药烘蛋，直到|r |T133971:0|t[烹饪]|cRXP_WARN_达到 10 点|r
    .skill cooking,10,1 -- step only displays if cooking skill is less than 10
    .target 高尔博德·钢手
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
	.target 高尔博德·钢手
    .goto Felwood,20.80,15.58
    .turnin 982 >> 交任务：深不可测的海洋
step
    #label ezstrider
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
	.target 奥兰达利亚·夜歌
    .goto Darkshore,37.70,40.70
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher than x
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
	.target 桑迪斯·织风
    .goto Felwood,19.98,14.40
    .turnin 958 >> 交任务：上层精灵的工具
    .turnin 4762 >> 交任务：壁泉河
    .accept 4763 >> 接任务：黑木熊怪的堕落
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
	.target 哨兵戈琳达·纳希恩
    .goto Felwood,20.34,18.12
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
step
#sticky
#label tube1
    .goto Darkshore,37.78,44.06
    .use 14338 >>|cRXP_WARN_在奥伯丁月亮井使用|r |T134865:0|t[空水瓶]|cRXP_WARN_取水|r
    .complete 4812,1
step
    .goto Darkshore,37.78,44.06
    .use 12346 >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗]|cRXP_WARN_在奥伯丁月亮井取水|r
    .collect 12347,1,4763,1
step
#requires tube1
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
	.target 萨纳瑞恩·绿树
    .goto Felwood,21.63,18.15
    .turnin 2138 >> 交任务：清除疫病
    .accept 2139 >> 接任务：萨纳瑞恩的希望
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
	.target 特伦希斯
    .goto Felwood,22.24,18.22
    .turnin 985 >> 交任务：熊怪的威胁
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
	.target 特伦希斯
    .goto Felwood,22.24,18.22
    .accept 986 >> 接任务：丢失的主人
    .group
step
#map Darkshore
    .goto Darkshore,39.26,43.04,5,0
    .goto Felwood,21.86,18.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_哨兵艾莉萨·星风|r交谈
    .accept 965 >> 接任务：奥萨拉克斯之塔
    .target 哨兵艾莉萨·星风
step
    #era/som
    #completewith CliffCave
    >>击杀|cRXP_ENEMY_月夜猛虎|r和|cRXP_ENEMY_月夜猛虎幼崽|r，获取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .unitscan 月夜猛虎;月夜猛虎幼崽
step
#map Darkshore
    #completewith next
    .goto Felwood,31.29,24.14,15 >> 再次前往红色水晶
step
#map Darkshore
    .goto Felwood,31.29,24.14
    >>点击|cRXP_PICK_红色水晶|r
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨
step
#map Darkshore
    #completewith next
    .goto Felwood,27.70,10.03,70 >> 前往巴莎兰找 |cRXP_FRIENDLY_阿斯特利安|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
	.target 阿斯特利安
    .goto Felwood,27.70,10.03
    .turnin 957 >> 交任务：巴莎兰
step << Human Paladin
    .goto Darkshore,50.74,34.68
	>>击杀|cRXP_ENEMY_黑木战士|r和|cRXP_ENEMY_黑木图腾师|r，获取 |T132889:0|t[亚麻布]
    >>|cRXP_WARN_保留 10 块|r |T132889:0|t[亚麻布]|cRXP_WARN_用于后续的|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_职业任务|r
	.collect 2589,10,1644,1 --Linen Cloth (10)
    .mob 黑木战士
    .mob 黑木图腾师
step
.group
    .goto Darkshore,50.66,34.94
    >>打开|cRXP_PICK_黑木谷物|r，拾取其中的|cRXP_LOOT_黑木谷物|r
    >>|cRXP_WARN_拾取该物品会刷出 2 只|cRXP_ENEMY_黑木熊怪|r，它们会立刻向你冲来。准备迎战，或设法脱战重置。|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
step
.group
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀|cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_蓟熊幼崽|r会施放|r |T132152:0|t[毁灭]|cRXP_WARN_。这是近战瞬发攻击，会使你昏迷 2 秒。|r
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊
    .mob 蓟熊幼崽
step
.group
    .goto Darkshore,51.83,33.50
    >>打开|cRXP_PICK_黑木坚果|r，拾取其中的|cRXP_LOOT_黑木坚果|r
    >>|cRXP_WARN_拾取该物品会刷出 2 只|cRXP_ENEMY_黑木熊怪|r，它们会立刻向你冲来。准备迎战，或设法脱战重置。|r
    .collect 12343,1,4763,1 -- Blackwood Nut Sample (1)
step
.group
    #label Fruit
    .goto Darkshore,52.86,33.41
    >>打开|cRXP_PICK_黑木水果|r，拾取其中的|cRXP_LOOT_黑木水果|r
    >>|cRXP_WARN_拾取该物品会刷出 2 只|cRXP_ENEMY_黑木熊怪|r，它们会立刻向你冲来。准备迎战，或设法脱战重置。|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
step
.group
    #completewith next
    .goto Darkshore,52.38,33.39
    .cast 16072 >> |cRXP_WARN_使用|r |T134712:0|t[装满水的净化碗] |cRXP_WARN_，在 |cRXP_PICK_篝火|r 旁召唤|r |cRXP_ENEMY_萨巴克希斯|r
    .timer 17,黑木熊怪的堕落剧情演出
    .use 12347
step
.group
    .goto Darkshore,52.38,33.39
    >>击杀|cRXP_ENEMY_萨巴克希斯|r。打开他掉落在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，拾取|cRXP_LOOT_堕落护符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob 萨巴克希斯
step
.group << !Druid
#map Darkshore
    #label CliffCave
    #completewith next
    .goto Darkshore,54.99,32.04,30,0
    .goto Darkshore,54.99,33.41,15 >> 前往壁泉河洞穴
step << Druid
    >>|cRXP_WARN_使用|r |T134776:0|t[空的峭壁之泉取样器]|cRXP_WARN_在壁泉河洞口的水中取样|r
    .goto Darkshore,54.99,33.41
    .complete 6122,1 --Filled Cliffspring Falls Sampler (1)
step
.group
    .goto Darkshore,55.66,34.89
    >>拾取地面上的|cRXP_LOOT_粗柄蘑菇|r和|cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_待在上层区域。若|cRXP_LOOT_毒帽蘑菇|r不在顶部尽头，跳下去从下方获取|r
    >>|cRXP_WARN_不要背对中心！|cRXP_ENEMY_雷鳞御浪者|r会将你击退！|r
    .complete 947,1 --Scaber Stalk (5)
    .complete 947,2 --Death Cap (1)
step
.group
    .isQuestComplete 947
    .goto Darkshore,54.81,32.92,30 >> 离开壁泉河洞穴
step
    #era/som
    #completewith next
    >>击杀|cRXP_ENEMY_月夜猛虎|r和|cRXP_ENEMY_月夜猛虎幼崽|r，获取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .unitscan 月夜猛虎;月夜猛虎幼崽
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
	.target 巴苏尔·影击
    .goto Winterspring,4.82,27.18
    .turnin 965 >> 交任务：奥萨拉克斯之塔
    .accept 966 >> 接任务：奥萨拉克斯之塔
step << !Paladin/!Human
    .goto Darkshore,55.27,27.74,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,57.54,25.99,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,55.27,27.74
    >>击杀|cRXP_ENEMY_暗滩狂热者|r，获取|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者
step << Human Paladin
    .goto Darkshore,55.27,27.74,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,57.54,25.99,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,55.27,27.74
    >>击杀|cRXP_ENEMY_暗滩狂热者|r，获取|cRXP_LOOT_破旧的羊皮纸|r和 |T132889:0|t[亚麻布]
    >>|cRXP_WARN_保留 10 块|r |T132889:0|t[亚麻布]|cRXP_WARN_用于后续的|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_职业任务|r
    .complete 966,1 --Worn Parchment (4)
    .collect 2589,10,1644,1 --Linen Cloth (10)
    .mob 暗滩狂热者
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
	.target 巴苏尔·影击
    .goto Winterspring,4.82,27.18
    .turnin 966 >> 交任务：奥萨拉克斯之塔
    .accept 967 >> 接任务：奥萨拉克斯之塔
step
.group 3
#map Darkshore
    #completewith next
    .goto Winterspring,6.37,16.66,50 >> 前往薄雾海
step
.group 3
#map Darkshore
    .goto Winterspring,6.37,16.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .accept 2098 >> 接任务: 基尔卡克的钥匙
    .target 基尔卡克·旋杆
step
.group 3
    #completewith next
    .goto Darkshore,56.10,16.88,0
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r和|cRXP_ENEMY_硬壳潮行蟹|r，拾取|cRXP_LOOT_基尔卡克钥匙的尾部|r
    >>|cRXP_WARN_注意|cRXP_ENEMY_狂暴暗礁蟹|r的 |T132152:0|t[痛击]技能，近战攻击可瞬间造成 200 点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key
    .mob 狂暴暗礁蟹
    .mob 硬壳潮行蟹
step
.group 3
    .goto Darkshore,54.93,12.19
    >>击杀|cRXP_ENEMY_灰雾智者|r和|cRXP_ENEMY_灰雾潮行者|r，获取|cRXP_LOOT_基尔卡克钥匙的中部|r
    >>|cRXP_WARN_注意|cRXP_ENEMY_灰雾智者|r的 |T136048:0|t[闪电箭]伤害，它们还会用 |T136052:0|t[治疗波]回血|r
    >>注意|cRXP_ENEMY_灰雾潮行者|r在近战时可施放 |T136016:0|t[|cRXP_FRIENDLY_毒药|r]，每 3 秒造成 13 点伤害，持续 30 秒
    .complete 2098,2 -- Middle of Gelkak's Key (1)
    .mob 灰雾智者
    .mob 灰雾潮行者
step
.group 3
    .goto Darkshore,55.59,16.98,45,0
    .goto Darkshore,53.76,18.96,45,0
    .goto Darkshore,51.34,22.00,45,0
    .goto Darkshore,56.63,12.08
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r和|cRXP_ENEMY_硬壳潮行蟹|r，拾取|cRXP_LOOT_基尔卡克钥匙的尾部|r
    >>|cRXP_WARN_注意|cRXP_ENEMY_狂暴暗礁蟹|r的 |T132152:0|t[痛击]技能，近战攻击可瞬间造成 200 点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key
    .mob 狂暴暗礁蟹
    .mob 硬壳潮行蟹
step
.group 3
    #sticky
    #label foreststriders
    .goto Darkshore,59.29,13.22,55,0
    .goto Darkshore,61.40,9.40,50,0
    .goto Darkshore,61.51,12.66,50,0
    .goto Darkshore,61.24,15.38,50,0
    .goto Darkshore,61.40,9.40
    >>击杀|cRXP_ENEMY_凶猛的森林陆行鸟|r，拾取|cRXP_LOOT_基尔卡克钥匙的头部|r
    .complete 2098,1 -- Top of Gelkak's Key (1)
    .mob 凶猛的森林陆行鸟
step
.group
    .goto Darkshore,61.40,9.40,45,0
    .goto Darkshore,62.42,7.67
    >>击杀|cRXP_ENEMY_月夜雄虎|r和|cRXP_ENEMY_月夜雌虎|r，获取|cRXP_LOOT_优质月夜猛虎毛皮|r和|cRXP_LOOT_月夜猛虎的牙齿|r
    >>|cRXP_WARN_注意|cRXP_ENEMY_月夜雌虎|r。她们总是带着一只|cRXP_ENEMY_月夜猛虎幼崽|r一同进攻|r
    >>|cRXP_ENEMY_月夜雄虎|r可以施放 |T132090:0|t[攻击弱点]——背对它们时触发背刺，造成 20-40 点伤害
    .complete -986,1 -- Fine Moonstalker Pelt (5)
    .complete -1002,1 -- Moonstalker Fang (6)
    .mob 月夜雄虎
    .mob 月夜雌虎
    .mob 月夜猛虎幼崽
    .isOnQuest 986,1002
step
.group 3
#map Darkshore
    #requires foreststriders
    .goto Winterspring,6.37,16.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .turnin 2098 >> 交任务: 基尔卡克的钥匙
    .accept 2078 >> 接任务: 基尔卡克的报复
    .target 基尔卡克·旋杆
step
.group 3
#map Darkshore
    .goto Winterspring,5.59,21.09,10,0
    .goto Winterspring,6.37,16.66
    >>与|cRXP_FRIENDLY_机械打手4100型|r交谈，开始护送
    >>护送|cRXP_FRIENDLY_机械打手4100型|r到|cRXP_FRIENDLY_基尔卡克·旋杆|r那去
    >>等|cRXP_ENEMY_机械打手4100型|r变为敌对状态后将其击杀
    >>|cRXP_WARN_此任务难度很高|r
    .skipgossip
    .complete 2078,1
    .link https://youtu.be/1WRRmKYBr9s >> |cRXP_WARN_点击此处查看视频攻略|r
    .mob 机械打手4100型
step
.group 3
#map Darkshore
    .goto Winterspring,6.37,16.66
    .target 基尔卡克·旋杆
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .turnin 2078 >> 交任务: 基尔卡克的报复
    .isQuestComplete 2078
step
.group
    #sticky
    .destroy 7442 >> 从背包中删除基尔卡克的钥匙
step
#map Darkshore
    .goto Winterspring,3.10,20.90
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4727 >> 接任务：搁浅的海龟
step << Druid
    .goto Darkshore,48.87,11.32
    >>|cRXP_WARN_游到水中|r
    >>打开|cRXP_PICK_奇怪的保险箱|r，获取|cRXP_LOOT_水兽敏捷坠饰|r
    .collect 15883,1,272,1 --Collect Half Pendant of Aquatic Agility (x1)
step
    #completewith next
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r，获取|cRXP_LOOT_优质蟹肉|r
    >>|cRXP_WARN_如果|cRXP_ENEMY_硬壳潮行蟹|r太难打，就专杀|r|cRXP_ENEMY_暗礁蟹|r
    >>注意|cRXP_ENEMY_暗礁蟹|r可以施放 |T132155:0|t[撕裂肌肉]——瞬发攻击，造成 30-55 点伤害
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
    .mob 暗礁蟹
step
    #era/som
#map Darkshore
    .goto Winterspring,1.42,26.89
    >>点击地面上的|cRXP_PICK_传声盒323号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
step
    .goto Darkshore,51.50,22.26,50,0
    .goto Darkshore,49.66,21.39
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r，获取|cRXP_LOOT_优质蟹肉|r
    >>|cRXP_WARN_如果|cRXP_ENEMY_硬壳潮行蟹|r太难打，就专杀|r|cRXP_ENEMY_暗礁蟹|r
    >>注意|cRXP_ENEMY_暗礁蟹|r可以施放 |T132155:0|t[撕裂肌肉]——瞬发攻击，造成 30-55 点伤害
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
    .mob 暗礁蟹
step
    .goto Darkshore,50.74,34.68
	.xp 18-2750 >>刷怪直到距离 18 级还差 2750 点经验
    >>击杀|cRXP_ENEMY_黑木战士|r和|cRXP_ENEMY_黑木图腾师|r
    .mob 黑木战士
    .mob 黑木图腾师
step
    #completewith NorthDarkshore
    #map Darkshore
    .goto Felwood,18.50,19.87,100 >> 前往奥伯丁
    .cooldown item,6948,<0
step
    #completewith next
    .hs >> 炉石回奥伯丁
    .cooldown item,6948,>0,1
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
	.target 温尼斯·布莱葛
    .goto Darkshore,36.71,44.98,5,0
    .goto Felwood,19.10,20.63
    .turnin 4727 >> 交任务：搁浅的海龟
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
	.target 古博·布拉普
    .goto Felwood,18.50,19.87
    .turnin 1138 >> 交任务：海中的水果
step
.group
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
	.target 巴瑞萨斯·月影
    .goto Felwood,19.90,18.40
    .turnin 947 >> 交任务：洞中的蘑菇
    .accept 948 >> 接任务：安努
step
#map Darkshore
    #label NorthDarkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
	.target 哨兵戈琳达·纳希恩
    .goto Darkshore,37.70,43.39
    .turnin 4813 >> 交任务：水晶中的碎骨
step
.group
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
	.target 萨纳瑞恩·绿树
    .goto Felwood,21.63,18.15
    .turnin 2139 >> 交任务: 萨纳瑞恩的希望
step
.group
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
	.target 特伦希斯
    .goto Darkshore,39.37,43.48
    .turnin 986 >> 交任务: 丢失的主人
    .accept 993 >> 接任务：丢失的主人
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
	.target 奥兰达利亚·夜歌
    .goto Darkshore,37.70,40.70
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher than x
step
.group
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
	.target 桑迪斯·织风
    .goto Felwood,19.98,14.40
    .turnin 4763 >> 交任务: 黑木熊怪的堕落
step << Druid
    .goto Darkshore,37.7,40.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .turnin 6122 >> 交任务：毒水之源
    .target 奥兰达利亚·夜歌
    .accept 6123 >> 接任务：收集解药
step << Druid
#label cure1
    .goto Darkshore,43.4,45.9,90,0
    .goto Darkshore,43.3,49.1,90,0
    .goto Darkshore,42.4,52.6,90,0
    .goto Darkshore,45.7,50.3,90,0
    .goto Darkshore,45.3,53.3
    .goto Darkshore,43.4,45.9,0
    .goto Darkshore,43.3,49.1,0
    .goto Darkshore,42.4,52.6,0
    .goto Darkshore,45.7,50.3,0
    >>击杀|cRXP_ENEMY_月夜枭兽|r，获取 |T132832:0|t[|cRXP_LOOT_小蛋|r]
    >>稍后任务需要 50 点烹饪技能
    .collect 6889,40,90,1,0x21,cooking
    >>在洞穴各处的地上拾取|cRXP_LOOT_月亮菇|r
    .complete 6123,2
step
    .goto Darkshore,45.34,49.70,60,0
    .goto Darkshore,45.48,45.24,60,0
    .goto Darkshore,42.73,45.67,60,0
    .goto Darkshore,45.34,49.70,60,0
    .goto Darkshore,45.48,45.24,60,0
    .goto Darkshore,42.73,45.67
    >>击杀|cRXP_ENEMY_月夜枭兽|r，获取 |T132832:0|t[|cRXP_LOOT_小蛋|r]
    >>稍后任务需要 50 点烹饪技能
    .collect 6889,40,90,1,0x20,cooking
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
step << Druid
    #label earthroot
    >>完成收集 5 个 |T134187:0|t[地根草]
    >>可沿东边的山脉采集
    .collect 2449,5,6123,1
step << Druid
    #requires earthroot
    .goto Darkshore,37.7,40.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .turnin 6123 >> 交任务: 收集解药
    .accept 6124 >> 接任务: 消除疾病
    .target 奥兰达利亚·夜歌
step << Druid
    .goto Darkshore,41.0,79.6
    >>|cRXP_WARN_向南前进时使用|r |T132801:0|t[动物医疗药膏]|cRXP_WARN_治疗|r|cRXP_ENEMY_生病的鹿|r
    .complete 6124,1 -- Sickly Deer cured (10)
    .unitscan 生病的鹿
step << Druid
	#completewith next
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
step << Druid
    .goto Moonglade,56.2,30.4
    >>去月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 6124 >> 交任务: 消除疾病
    .accept 6125 >> 接任务: 解毒之术
    .target 德迪利特·星焰
step << Druid
    .goto Moonglade,52.53,40.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔
step << Druid
    .goto Moonglade,44.1444,45.227
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦·菲纳雯斯|r交谈
    .skipgossip 1
    .fly Teldrassil >> 飞往鲁瑟兰村
    .target 希尔瓦·菲纳雯斯
    .zoneskip Teldrassil
    .zoneskip Darnassus
step << Druid
    #completewith next
    .goto Teldrassil,55.889,89.456
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯
step << Druid
    .goto Darnassus,35.375,8.405
    .target 玛斯雷·驭熊者
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 6125 >> 交任务：解毒之术
step << Druid
    .goto Darnassus,30.7,41.3 >> 穿过紫色传送门返回 鲁瑟兰村
    .zoneskip Darkshore
    .zoneskip Teldrassil
step << Druid
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >> 飞往黑海岸
    .target 维斯派塔斯
step
    #completewith next
    .goto 1439,32.432,43.744,15 >> 前往奥伯丁码头, 等待前往米奈希尔港的船
step
    .goto Darkshore,32.44,43.71
    >>|cRXP_WARN_在等待米奈希尔港的船时提升|r |T135966:0|t[急救]|cRXP_WARN_和|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    .zone Wetlands >> 乘船前往米奈希尔港
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 生存指南（联盟）
#hardcore
#classic
#tbc
<< Alliance
#name 20-21 Darkshore/Ashenvale
#version 1
#group RestedXP Survival Guide (A)
#subgroup RXP Survival Guide 1-20
#subgroupdisplayname 1-20
#next 21-23 Stonetalon/Ashenvale
#displayname 20-21 黑海岸/灰谷
step << Druid
	#completewith next
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
step << Druid
    .goto Moonglade,52.53,40.57
	>>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔
step
    #completewith TheryluneE
    .hs >> 使用炉石返回奥伯丁
    .zoneskip Darkshore
    .zoneskip Ashenvale
step
    .goto Darkshore,37.21,44.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击|cRXP_FRIENDLY_通缉告示|r
    .accept 4740 >> 接受任务：通缉：莫克迪普！
step
#map Darkshore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .target 巴瑞萨斯·月影
    .goto Felwood,19.90,18.40
    .accept 947 >> 接受任务：洞中的蘑菇
step
    .goto Darkshore,37.44,41.83
    .target 考古学家霍莉
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >> 接受任务：健忘的勘察员
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
	.target 桑迪斯·织风
    .goto Felwood,19.98,14.40
    .accept 4763 >> 接受任务：黑木熊怪的堕落
step
    .goto Darkshore,37.78,44.06
    .use 12346 >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗]|cRXP_WARN_在奥伯丁月亮井取水|r
    .collect 12347,1,4763,1
step
    .goto Darkshore,38.326,43.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈沙拉·夜语|r交谈
    .turnin 3765 >> 交任务：遥远的旅途
    .target 戈沙拉·夜语
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
	.target 萨纳瑞恩·绿树
    .goto Felwood,21.63,18.15
    .accept 2139 >> 接受任务：萨纳瑞恩的希望
step
    .goto Darkshore,50.66,34.94
    >>打开|cRXP_PICK_黑木谷物|r，拾取其中的|cRXP_LOOT_黑木谷物|r
    >>|cRXP_WARN_拾取后会出现2只|cRXP_ENEMY_黑木熊怪|r，它们会立即向你冲来。准备好应战，或脱战让它们重置|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
step
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀|cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_蓟熊幼崽|r会施放|r |T132152:0|t[毁灭]|cRXP_WARN_，这是会使你昏迷2秒的近战瞬发攻击|r
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊
    .mob 蓟熊幼崽
step
    .goto Darkshore,51.83,33.50
    >>打开|cRXP_PICK_黑木坚果|r，拾取其中的|cRXP_LOOT_黑木坚果|r
    >>|cRXP_WARN_拾取后会出现2只|cRXP_ENEMY_黑木熊怪|r，它们会立即向你冲来。准备好应战，或脱战让它们重置|r
    .collect 12343,1,4763,1 -- Blackwood Nut Sample (1)
step
    #label Fruit
    .goto Darkshore,52.86,33.41
    >>打开|cRXP_PICK_黑木水果|r，拾取其中的|cRXP_LOOT_黑木水果|r
    >>|cRXP_WARN_拾取后会出现2只|cRXP_ENEMY_黑木熊怪|r，它们会立即向你冲来。准备好应战，或脱战让它们重置|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
step
    #completewith next
    .goto Darkshore,52.38,33.39
    .cast 16072 >> |cRXP_WARN_使用|r |T134712:0|t[装满水的净化碗]|cRXP_WARN_，在|cRXP_PICK_篝火|r旁召唤|r |cRXP_ENEMY_萨巴克希斯|r
    .timer 17,黑木熊怪的堕落剧情
    .use 12347
step
    .goto Darkshore,52.38,33.39
    >>击杀|cRXP_ENEMY_萨巴克希斯|r，打开他掉在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，拾取其中的|cRXP_LOOT_堕落护符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob 萨巴克希斯
step
    .goto Darkshore,55.66,34.89
    >>拾取地上的|cRXP_LOOT_粗柄蘑菇|r和|cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_沿洞穴上层走。如果上层尽头没有|cRXP_LOOT_毒帽蘑菇|r，就跳到下层拾取|r
    >>|cRXP_WARN_不要背对洞穴中央！|cRXP_ENEMY_雷鳞御浪者|r会把你击退！|r
    .complete 947,1 --Scaber Stalk (5)
    .complete 947,2 --Death Cap (1)
--TODO: Add logout skip video
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
	.target 桑迪斯·织风
    .goto Felwood,19.98,14.40
    .turnin 4763 >> 交任务：黑木熊怪的堕落
step
#map Darkshore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .target 巴瑞萨斯·月影
    .goto Felwood,19.90,18.40
    .turnin 947 >> 交任务：洞中的蘑菇
    .accept 948 >> 接受任务：安努
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
	.target 萨纳瑞恩·绿树
    .goto Felwood,21.63,18.15
    .turnin 2139 >> 交任务：萨纳瑞恩的希望
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
	.target 特伦希斯
    .goto Darkshore,39.37,43.48
    .accept 986 >> 接受任务：丢失的主人
step
    #completewith moonstalkers
    >>击杀|cRXP_ENEMY_月夜雄虎|r和|cRXP_ENEMY_月夜雌虎|r，拾取它们掉落的|cRXP_LOOT_毛皮|r和|cRXP_LOOT_牙齿|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_月夜雌虎|r，它们身边总有一只|cRXP_ENEMY_月夜猛虎幼崽|r一起攻击|r
    >>|cRXP_ENEMY_月夜雄虎|r会施放|T132090:0|t[攻击弱点]，这是一种背刺攻击；若你背对它们，会受到20-40点伤害
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .mob 月夜雌虎
    .mob 月夜猛虎幼崽
step
	#era/som
    #completewith Murkdeep
    #optional
    .goto Darkshore,40.23,81.28,0
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取它们掉落的|cRXP_LOOT_灰色头皮|r
    >>小心它们会施放|T132152:0|t[毁灭]，这是造成20-40点伤害并|cRXP_WARN_将你击倒2秒|r的瞬发攻击
    .complete 1003,1
    .isOnQuest 1003
    .mob 灰斑蓟熊
step
#map Darkshore
    #completewith OnuGrove
    .goto Felwood,27.00,55.59,80 >> 前往古树之林
step
#map Darkshore
    #label OnuGrove
    .goto Felwood,27.00,55.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 952 >> 交任务：古树之林 << NightElf
    .turnin 948 >> 交任务：安努
    .accept 944 >> 接受任务：主宰之剑
    .target 安努
step
    #completewith next
    #label MasterG
    .goto Darkshore,38.54,86.05,60 >> 前往主宰之剑
step
#label moonstalkers
    .goto Darkshore,38.54,86.05
    >>探索主宰之剑
    >>|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]，|cRXP_WARN_使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior
    >>|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为 3 秒的|r |T135915:0|t[治疗术]
    .complete 944,1
step
    #completewith next
    .cast 5809 >> |cRXP_WARN_使用|r |T134715:0|t[占卜之水]|cRXP_WARN_，将其放在地上|r
    .use 5251
step
    .goto Darkshore,38.54,86.05
    .use 5251 >> 点击|cRXP_PICK_占卜之碗|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接受任务：暮光之锤的营地
    >>|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]，|cRXP_WARN_使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior
    >>|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为3秒的|r |T135915:0|t[治疗术]
step
    .goto Ashenvale,22.24,2.52
    >>点击|cRXP_PICK_暮光之书|r
    .turnin 949 >> 交任务：暮光之锤的营地
    .accept 950 >> 接受任务：向安努回复
    >>|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]，|cRXP_WARN_使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior
    >>|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为3秒的|r |T135915:0|t[治疗术]
step
    .goto Ashenvale,22.36,3.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟瑞露尼|r交谈，开始护送
    >>|cRXP_WARN_如果她不在，就跳过这一步|r
    >>|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]，|cRXP_WARN_使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior
    >>|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为3秒的|r |T135915:0|t[治疗术]
    .accept 945 >> 接受任务：护送瑟瑞露尼
    .target 瑟瑞露尼
step
    #label TheryluneE
    .goto Darkshore,40.51,87.09
    >>|cRXP_WARN_护送|cRXP_FRIENDLY_瑟瑞露尼|r离开主宰之剑|r
    >>|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_会施放|r |T132343:0|t[缴械]，|cRXP_WARN_使你无法使用武器，持续6秒|r << Rogue/Paladin/Warrior
    >>|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_会施放|r |T135953:0|t[恢复]|cRXP_WARN_以及施法时间为 3 秒的|r |T135915:0|t[治疗术]
    .complete 945,1 -- Escort Therylune
    .isOnQuest 945
step
    .destroy 5251 >> 摧毁|T134715:0|t[占卜之水]，之后不再需要它
step
    .goto Darkshore,39.3,91.8,60,0
    .goto Darkshore,37.38,91.87,100,0
    .goto Darkshore,38.96,80.07,100,0
    .goto Darkshore,43.82,82.08,100,0
    .goto Darkshore,38.96,80.07,0
	.goto Darkshore,39.3,91.8
    >>击杀|cRXP_ENEMY_月夜雄虎|r和|cRXP_ENEMY_月夜雌虎|r，拾取它们掉落的|cRXP_LOOT_毛皮|r和|cRXP_LOOT_牙齿|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_月夜雌虎|r，它们身边总有一只|cRXP_ENEMY_月夜猛虎幼崽|r一起攻击|r
    >>|cRXP_ENEMY_月夜雄虎|r会施放|T132090:0|t[攻击弱点]，这是一种背刺攻击；若你背对它们，会受到20-40点伤害
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .mob 月夜雌虎
    .mob 月夜猛虎幼崽
step
#map Darkshore
    #sticky
    #label prospector
    .goto Felwood,18.08,64.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .turnin 729 >> 交任务：健忘的勘察员
    .target 勘察员雷姆塔维尔
step
    .goto Darkshore,35.72,83.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>这会开始护送任务
    .accept 731,1 >> 接受任务：健忘的勘察员
    >>|cRXP_WARN_这个任务非常困难。如果无法组队，也无法独自完成，就跳过这一步|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处观看视频攻略|r
    .target 勘察员雷姆塔维尔
step
    #requires prospector
    >>|cRXP_WARN_护送|cRXP_FRIENDLY_勘察员雷姆塔维尔|r穿过挖掘场|r
    >>|cRXP_WARN_这个任务非常困难。如果无法组队，也无法独自完成，就跳过这一步|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处观看视频攻略|r
    .complete 731,1
    .isOnQuest 731
step
    .goto Ashenvale,13.97,4.10
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >> 接受任务：搁浅的海洋生物
    >>|cRXP_WARN_这个任务可能非常困难。与|cRXP_ENEMY_鱼人|r交战时，要1只接1只地引怪，否则可能同时引到多个|r
    .link https://youtu.be/lfQM3Q-Ag5A >> |cRXP_WARN_点击此处观看视频攻略|r
step
    .goto Ashenvale,13.93,2.01
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接受任务：搁浅的海龟
step
#map Darkshore
    .goto Felwood,13.47,64.01
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接受任务：搁浅的海龟
step
#map Darkshore
    .goto Felwood,14.62,60.72
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接受任务：搁浅的海洋生物
step
    #label Murkdeep
    .goto Darkshore,36.64,76.53
    >>击杀营地里的|cRXP_ENEMY_灰雾战士|r和|cRXP_ENEMY_灰雾猎人|r
    >>|cRXP_WARN_移动到营地中央的篝火处以召唤|r|cRXP_ENEMY_莫克迪普|r
    >>击杀|cRXP_ENEMY_莫克迪普|r，他会从水里跑出来
    .complete 4740,1
    .unitscan 莫克迪普
    .mob 灰雾战士
    .mob 灰雾猎人
    .mob 灰雾滩行者
step
	#era/som
    .goto Darkshore,41.44,86.06,50,0
    .goto Darkshore,41.77,84.60,50,0
    .goto Darkshore,42.94,82.25,50,0
    .goto Darkshore,43.59,80.02,50,0
    .goto Darkshore,39.74,80.43,50,0
    .goto Darkshore,38.00,83.55
    #optional
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取它们掉落的|cRXP_LOOT_灰色头皮|r
    >>小心它们会施放|T132152:0|t[毁灭]，这是造成20-40点伤害并|cRXP_WARN_将你击倒2秒|r的瞬发攻击
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob 灰斑蓟熊
step
    #era/som
    .goto Darkshore,41.389,80.565
    >>点击地上的|cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务：传声盒525号
    .isOnQuest 1003
step
.group
    #completewith next
    .goto Darkshore,45.00,85.30,30 >> 前往洞穴中的|cRXP_FRIENDLY_沃科尔|r处
step
.group
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .turnin 993 >> 交任务：丢失的主人
    .accept 995 >> 接受任务：偷偷溜走
    .timer 20,偷偷溜走剧情
    .target 沃科尔
    .isQuestTurnedIn 986
step
.group
    .goto Darkshore,44.44,84.69
    >>|cRXP_WARN_等待剧情结束|r
    .complete 995,1
    .isQuestTurnedIn 986
step
#map Darkshore
    .goto Felwood,27.00,55.59
    .target 安努
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 951 >> 交任务：玛塞斯特拉遗物
    .isQuestComplete 951
step
#map Darkshore
    .goto Felwood,27.00,55.59
    .target 安努
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >> 交任务：向安努回复
step
#map Darkshore
    .goto Felwood,27.96,55.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈，开始护送
    >>|cRXP_WARN_如果他不在，就跳过这一步。他最多可能需要25分钟才会刷新|r
	.target 克罗尼亚·恒影
    .accept 5321 >> 接受任务：昏昏欲睡
step
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取其中的|T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
step
    #completewith tower
    .zone Ashenvale >> 向南前往灰谷
    .goto Ashenvale,29.7,13.6
step
    .goto Ashenvale,27.26,35.58
    >>|cRXP_WARN_护送|cRXP_FRIENDLY_克罗尼亚|r前往灰谷的迈斯特拉岗哨|r
    .use 13536 >> |cRXP_WARN_每当他睡着时，使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r]。|cRXP_WARN_使用时要站在|cRXP_FRIENDLY_克罗尼亚|r身边|r
    >>|cRXP_WARN_尽量避开大路，只有走在路上才会刷出敌人|r
    .complete 5321,2
    .isOnQuest 5321
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_利拉迪斯·月河|r交谈
	.target 利拉迪斯·月河
    .goto Ashenvale,27.26,35.58
    .turnin 5321 >> 交任务：昏昏欲睡
    .isQuestComplete 5321
step
    #label tower
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target 净化者德尔格伦
    .goto Ashenvale,26.19,38.69
    .turnin 967 >> 交任务：奥萨拉克斯之塔
step
	#era/som
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target 净化者德尔格伦
    .goto Ashenvale,26.19,38.69
    .accept 970 >> 接受任务：奥萨拉克斯之塔
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
	.target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .accept 1010 >> 接受任务：巴斯兰的头发
    .xp <20,1
step
    #era/som
    .goto Ashenvale,31.25,30.70
    >>击杀|cRXP_ENEMY_暗滩祭司|r、|cRXP_ENEMY_暗滩精兵|r、|cRXP_ENEMY_暗滩执行者|r和|cRXP_ENEMY_暗滩挖掘者|r，拾取它们掉落的|cRXP_LOOT_发光的灵魂宝石|r
    .complete 970,1
    .mob 暗滩祭司
    .mob 暗滩精兵
    .mob 暗滩执行者
    .mob 暗滩挖掘者
step
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地上的|cRXP_PICK_草药|r，拾取其中的|cRXP_LOOT_巴斯兰的头发|r
    >>|cRXP_WARN_它们看起来像棕色小袋子，可能不太容易发现|r
    .complete 1010,1
    .isOnQuest 1010
step
	#era/som
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target 净化者德尔格伦
    .goto Ashenvale,26.19,38.69
    .turnin 970 >> 交任务：奥萨拉克斯之塔
    .accept 973 >> 接受任务：奥萨拉克斯之塔
step
    .goto Ashenvale,31.89,22.53
    .xp 20 >> 刷怪升到20级
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
	.target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .accept 1010 >> 接受任务：巴斯兰的头发
step
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地上的|cRXP_PICK_草药|r，拾取其中的|cRXP_LOOT_巴斯兰的头发|r
    >>|cRXP_WARN_它们看起来像棕色小袋子，可能不太容易发现|r
    .complete 1010,1
    .isOnQuest 1010
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
	.target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .turnin 1010 >> 交任务：巴斯兰的头发
    .accept 1020 >> 接受任务：奥雷迪尔的药剂
step
    #completewith next
    .goto Ashenvale,25.49,39.59,25,0
    .goto Ashenvale,25.98,41.72,25,0
    .goto Ashenvale,26.88,44.47,30,0
    .goto Ashenvale,28.16,47.68,60,0
    .goto Ashenvale,34.40,48.00
    .subzone 415 >> 前往阿斯特兰纳
step
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fp Astranaar>> 开通阿斯特兰纳的飞行路线
	.target 黛琳希亚
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德瑞尔·速火|r交谈
	.target 辛德瑞尔·速火
    .goto Ashenvale,34.67,48.83
    .accept 1008 >> 接受任务：佐拉姆海岸
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵塞恩希尔|r交谈
	.target 哨兵塞恩希尔
    .goto Ashenvale,34.89,49.79
    .accept 1070 >> 接受任务：守卫石爪山
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法德瑞斯·戈森沙尔|r交谈
	.target 法德瑞斯·戈森沙尔
    .goto Ashenvale,35.76,49.10
    .accept 1056 >> 接受任务：石爪峰之旅
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
	.target 莱恩·狼行者
    .goto Ashenvale,36.61,49.58
    .accept 991 >> 接受任务：莱恩的净化
step
    .goto Ashenvale,36.99,49.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板基姆利雅|r交谈
    .home >> 将炉石绑定在阿斯特兰纳
    .target 旅店老板基姆利雅
step
    .goto Ashenvale,37.36,51.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
	.target 皮尔图拉斯·怀特姆恩
    .turnin 1020 >> 交任务：奥雷迪尔的药剂
step
.dungeon WC
    #completewith TravelRatchet
    .goto Ashenvale,20.31,42.33,0
    .zone The Barrens >> 寻找哀嚎洞穴队伍时，击杀|cRXP_ENEMY_盐沫鱼人|r刷经验，它们的位置已在地图上标出
	.mob 盐沫战士
	.mob 盐沫泥浆鱼人
	.mob 盐沫智者
	.mob 盐沫污水鱼人
step
.dungeon WC
    #label TravelRatchet
    .goto Ashenvale,69.71,86.87,50,0
    .goto The Barrens,48.98,5.42,35,0
    .goto The Barrens,49.07,12.80,50,0
    .goto The Barrens,53.87,21.52,120,0
    .goto The Barrens,59.15,25.48,120,0
    .goto The Barrens,63.087,37.607
    .subzone 392 >> 前往贫瘠之地的棘齿城，沿箭头走以避开|cRXP_ENEMY_贫瘠之地卫兵|r
step
.dungeon WC
    .goto The Barrens,63.084,37.163
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fp Ratchet >> 开通棘齿城的飞行路线
    .target 布拉高克
step
.dungeon WC
    .goto The Barrens,63.087,37.607
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_起重机操作员比戈弗兹|r交谈
    .accept 959 >> 接受任务：港口的麻烦
    .target 起重机操作员比戈弗兹
step
.dungeon WC
    #completewith next
    .goto The Barrens,46.95,35.44,0
    .goto The Barrens,46.95,35.44,20,0
    .goto The Barrens,47.01,34.67,15,0
    .goto 1414,51.92,55.27,45,0
    .goto 1414,51.82,55.56,20 >> 前往哀嚎洞穴。爬上山，再跳进哀嚎洞穴入口上方的隐蔽洞穴，沿箭头找到|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r
step
.dungeon WC
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    .accept 1486 >> 接受任务：变异皮革
    .target +纳尔帕克
    .goto 1414,51.912,55.422 -- Nalpak
    .accept 1487 >> 接受任务：清除变异者
    .goto 1414,51.918,55.444 -- Ebru
    .target +厄布鲁
step
.dungeon WC
    #completewith EnterWC
    >>击杀所有类型的|cRXP_ENEMY_变异生物|r，拾取掉落的|cRXP_LOOT_变异皮革|r
    >>|cRXP_WARN_哀嚎洞穴副本内外都能完成此任务|r
    .complete 1486,1 -- Deviate Hide (20)
    .isOnQuest 1486
step
.dungeon WC
    .goto 1414,52.04,55.37,20,0
    .goto 1414,52.14,55.14,20,0
    .goto 1414,51.82,54.85,20,0
    .goto 1414,52.04,55.37,20,0
    .goto 1414,52.14,55.14,20,0
    .goto 1414,51.82,54.85,20,0
    .goto 1414,52.04,55.37,20,0
    .goto 1414,52.14,55.14,20,0
    .goto 1414,51.82,54.85
    >>击杀|cRXP_ENEMY_疯狂的马格利什|r，拾取他掉落的|cRXP_LOOT_99年波尔多陈酿|r
    >>|cRXP_ENEMY_疯狂的马格利什|r|cRXP_WARN_可能在几个不同的位置刷新|r
    >>|cRXP_WARN_此任务在哀嚎洞穴副本外完成|r
    .complete 959,1 -- 99-Year-Old Port (1)
    .isOnQuest 959
    .mob 疯狂的马格利什
step
.dungeon WC
    #label EnterWC
    .goto 1414,52.37,55.20
    +进入哀嚎洞穴
    .zoneskip 1414,1 -- similar to stockades, no subzone for WC
step
.dungeon WC
    >>击杀所有类型的|cRXP_ENEMY_变异生物|r，拾取掉落的|cRXP_LOOT_变异皮革|r
    .complete 1487,1 -- Deviate Ravager slain (7)
    .complete 1487,2 -- Deviate Viper slain (7)
    .complete 1487,3 -- Deviate Shambler slain (7)
    .complete 1487,4 -- Deviate Dreadfang slain (7)
    .complete 1486,1 -- Deviate Hide (20)
    .disablecheckbox
    .isOnQuest 1487
    .isOnQuest 1486
step
.dungeon WC
    >>击杀所有类型的|cRXP_ENEMY_变异生物|r
    .complete 1487,1 -- Deviate Ravager slain (7)
    .complete 1487,2 -- Deviate Viper slain (7)
    .complete 1487,3 -- Deviate Shambler slain (7)
    .complete 1487,4 -- Deviate Dreadfang slain (7)
    .isOnQuest 1487
step
.dungeon WC
    #completewith next
    >>击杀所有类型的|cRXP_ENEMY_变异生物|r，拾取掉落的|cRXP_LOOT_变异皮革|r
    .complete 1486,1 -- Deviate Hide (20)
    .isOnQuest 1486
step
.dungeon WC
    >>击杀|cRXP_ENEMY_考布莱恩|r、|cRXP_ENEMY_皮萨斯|r、|cRXP_ENEMY_瑟芬迪斯|r和|cRXP_ENEMY_安娜科德拉|r，然后与副本入口处的|cRXP_FRIENDLY_纳拉雷克斯的信徒|r交谈，开始护送他
    >>护送|cRXP_FRIENDLY_纳拉雷克斯的信徒|r穿过哀嚎洞穴，完成唤醒仪式
    >>击杀|cRXP_ENEMY_吞噬者穆坦努斯|r，拾取他掉落的|T135229:0|t[|cRXP_LOOT_发光的碎片|r]
    >>|cRXP_WARN_使用|T135229:0|t[|cRXP_LOOT_发光的碎片|r]接受任务|r
    .collect 10441,1,6981,1 -- Glowing Shard (1)
    .accept 6981 >> 接受任务：发光的碎片
    .use 10441 -- Glowing Shard
    .skipgossip
    .target 纳拉雷克斯的信徒
    .mob 吞噬者穆坦努斯
step
.dungeon WC
    >>击杀所有类型的|cRXP_ENEMY_变异生物|r，拾取掉落的|cRXP_LOOT_变异皮革|r
    >>|cRXP_WARN_哀嚎洞穴副本内外都能完成此任务|r
    .complete 1486,1 -- Deviate Hide (20)
    .isOnQuest 1486
step
.dungeon WC
    #completewith RatchetTurnin
    .goto The Barrens,62.984,37.218
    .subzone 392 >> 前往棘齿城，稍后再到哀嚎洞穴上方交任务
    .isOnQuest 6981,959
step
.dungeon WC
    .goto The Barrens,62.984,37.218
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .complete 6981,1 -- Speak with someone in Ratchet about the Glowing Shard
    .skipgossip 1
    .target 斯布特瓦夫
    .isOnQuest 6981
step
.dungeon WC
    #label RatchetTurnin
    .goto The Barrens,63.087,37.607
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_起重机操作员比戈弗兹|r交谈
    .turnin 959 >> 交任务：港口的麻烦
    .target 起重机操作员比戈弗兹
    .isQuestComplete 959
step
.dungeon WC
    #completewith next
    .goto The Barrens,50.11,35.21,35,0
    .goto The Barrens,48.60,33.34,35,0
    .goto The Barrens,48.184,32.781,15 >> 沿箭头爬上哀嚎洞穴上方的陡山
    .isQuestComplete 6981
step
.dungeon WC
    .goto The Barrens,48.184,32.781
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲拉·古风|r交谈
    .turnin 6981 >> 交任务：发光的碎片
    .target 菲拉·古风
    .isQuestComplete 6981
step
.dungeon WC
    #completewith NalpakEbru
    .goto 1414,51.92,55.27,45,0
    .goto 1414,51.82,55.56,20 >> 跳进哀嚎洞穴入口上方的隐蔽洞穴，沿箭头找到|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r
step
.dungeon WC
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    .turnin 1486 >> 交任务：变异皮革
    .goto 1414,51.912,55.422 -- Nalpak
    .target +纳尔帕克
    .turnin 1487 >> 交任务：清除变异者
    .goto 1414,51.918,55.444 -- Ebru
    .target +厄布鲁
    .isQuestComplete 1486
    .isQuestComplete 1487
step
.dungeon WC
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄布鲁|r交谈
    .turnin 1487 >> 交任务：清除变异者
    .goto 1414,51.918,55.444 -- Ebru
    .target 厄布鲁
    .isQuestComplete 1487
step
.dungeon WC
    #label NalpakEbru
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r交谈
    .turnin 1486 >> 交任务：变异皮革
    .goto 1414,51.912,55.422 -- Nalpak
    .target 纳尔帕克
    .isQuestComplete 1486
step
.dungeon WC
    .hs >> 使用炉石返回阿斯特兰纳
]])
