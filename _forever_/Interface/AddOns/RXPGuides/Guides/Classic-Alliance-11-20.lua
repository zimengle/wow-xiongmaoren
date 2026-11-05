local faction = UnitFactionGroup("player")
if faction == "Horde" then return end
----Start of <1.5x Westfall----
----Night Elves and Hunters stay in Darkshore and Grind----

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#xprate <1.5
#classic
#tbc
#season 0,1
#version 1
<< Alliance
#name 13-15 Westfall
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#next 14-16 Darkshore
#defaultfor !NightElf !Hunter
#displayname 14-15 西部荒野 << Dwarf/Gnome
#displayname 13-15 西部荒野
step
    #sticky
    #optional
    .goto Elwynn Forest,19.00,81.00
    .zone Westfall >> 前往西部荒野
step
    .goto Westfall,59.95,19.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫法布隆|r 对话
    .accept 64 >> 接任务: 遗失的怀表
    .target 农夫法布隆
step
    .goto Westfall,59.92,19.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗娜·法布隆|r 对话
    .accept 36 >> 接任务: 杂味炖肉
    .accept 151 >> 接任务: 老马布兰契
    .target 弗娜·法布隆
step
    #completewith SalmaS
    .goto Westfall,56.04,31.23,65 >> 前往萨丁农场
step
    .goto Westfall,56.04,31.23
    .target 农夫萨丁
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫萨丁|r 对话
    .accept 9 >> 接任务: 清理荒野
step
    #label SalmaS
    .goto Westfall,56.40,30.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔玛·萨丁|r 对话
    .turnin 36 >> 交任务: 杂味炖肉
    .target 萨尔玛·萨丁
    .accept 38 >> 接任务: 杂味炖肉
    .accept 22 >> 接任务: 猪肝馅饼
step << Human
    #label Lewis
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_军需官刘易斯|r 对话
    .target 军需官刘易斯
    .goto Westfall,57.00,47.17
    .turnin 6285 >> 交任务: 返回西部荒野
step << Gnome/Dwarf
    #completewith next
    .goto Westfall,56.33,47.52
    .target 格里安·斯托曼
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 109 >> 交任务: 向格里安·斯托曼报到
    .isOnQuest 109
step
    .goto Westfall,56.33,47.52
    .target 格里安·斯托曼
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .accept 12 >> 接任务: 西部荒野人民军
step
    #xprate <1.2
    .goto Westfall,56.42,47.62
    .target 丹努文队长
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹努文队长|r 交谈
    .accept 102 >> 接任务: 西部荒野的豺狼人
step << Human
    #requires Lewis
    .goto Westfall,54.00,53.00
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵加里安|r 对话
    .target 哨兵加里安
    .accept 153 >> 接任务: 红色皮质面罩
step << !Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵加里安|r 对话
    .target 哨兵加里安
    .goto Westfall,54.00,53.00
    .accept 153 >> 接任务: 红色皮质面罩
step
    .goto Westfall,52.86,53.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_如有需要, 购买食物和水|r
    .vendor >>|T133918:0|t[长嘴泥鳅]|cRXP_WARN_价格很便宜|r
	.target 旅店老板希瑟尔
step
	#completewith Oats
    >>打开地上的|cRXP_PICK_一袋燕麦|r，并从中拾取|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_你通常可以在农场围栏或建筑附近找到它们|r
    .complete 151,1 --Handful of Oats (8)
step
    #completewith TravelCompass
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
    #completewith TravelCompass
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取 |T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者
step
    #label TravelCompass
    .isOnQuest 399
    .goto Westfall,40.4,52.7,75 >> 前往阿历克斯顿农场, |cRXP_WARN_途中继续完成其他任务目标|r
step
    #sticky
    #completewith bennytime
    >>击杀路过田地时遇到的|cRXP_ENEMY_看守傀儡|r
    >>拾取 |cRXP_LOOT_秋葵|r 和 |cRXP_LOOT_灯油|r
    .mob 看守傀儡
    .complete 9,1 --Havest Watcher slain (20)
    .collect 732,3,38,1 --Okra (3)
    .collect 814,5,103,1 --Flask of Oil (5)
step
    .goto Westfall,36.24,54.52
    >>打开|cRXP_PICK_阿历克斯顿的箱子|r，获取|cRXP_LOOT_简易罗盘|r
    .complete 399,1 --A Simple Compass (1)
    .isOnQuest 399
step
    #completewith bennytime
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
    #completewith bennytime
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取 |T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者
step
    .goto Westfall,50.0,22.6,75 >> 前往贾森农场, |cRXP_WARN_途中继续完成其他任务目标|r
step
	#label bennytime
    .goto Westfall,49.34,19.27
    >>打开|cRXP_PICK_法布隆的衣柜|r，拾取其中的|cRXP_LOOT_法布隆的怀表|r
    >>|cRXP_WARN_如果正确调整镜头角度，就可以从房子外面摸到|cRXP_PICK_法布隆的衣柜|r|r
	>>|cRXP_WARN_注意|cRXP_ENEMY_本尼·布兰科|r，他伤害很高|r
    .complete 64,1 --Furlbrow's Pocket Watch
step
    #xprate <1.2
    #completewith next
    >>击杀 |cRXP_ENEMY_河爪豺狼人|r 和 |cRXP_ENEMY_河爪斥候|r, 拾取 |T134297:0|t|cRXP_LOOT_豺狼人的爪子|r
    .complete 102,1 --Gnoll Paw (8)
    .mob 河爪豺狼人
    .mob 河爪斥候
step
    .goto Westfall,52.13,10.36,60,0
    .goto Westfall,56.40,9.40,60,0
    .goto Westfall,52.13,10.36,60,0
    .goto Westfall,56.40,9.40,60,0
    .goto Westfall,52.13,10.36
    .goto Westfall,56.40,9.40,0
    >>|cRXP_WARN_前往海岸, 途中击杀豺狼人|r 收集 |T134297:0|t[|cRXP_LOOT_豺狼人的爪子|r](如有需要)
    >>击杀|cRXP_ENEMY_鱼人袭击者|r和|cRXP_ENEMY_滩行鱼人|r，拾取|cRXP_LOOT_鱼人的眼球|r
    .collect 730,3,38,1 --Murloc Eye (3)
    .mob 鱼人袭击者
    .mob 滩行鱼人
step
    #xprate <1.2
    #label GnollPaws
    .goto Westfall,56.40,13.50,60,0
    .goto Westfall,42.82,14.70,60,0
    .goto Westfall,45.83,13.75,60,0
    .goto Westfall,52.36,14.82,60,0
    .goto Westfall,56.86,13.53,60,0
    .goto Westfall,56.86,13.53,60,0
    .goto Westfall,42.82,14.70,60,0
    .goto Westfall,52.36,14.82,60,0
    .goto Westfall,45.83,13.75
    .goto Westfall,42.82,14.70,0
    .goto Westfall,52.36,14.82,0
    .goto Westfall,56.81,13.30,0
    >>击杀 |cRXP_ENEMY_河爪豺狼人|r 和 |cRXP_ENEMY_河爪斥候|r, 拾取 |T134297:0|t|cRXP_LOOT_豺狼人的爪子|r
    .complete 102,1 --Gnoll Paw (8)
    .mob 河爪豺狼人
    .mob 河爪斥候
step
    #label Oats
    .goto Westfall,57.48,13.58,60,0
    .goto Westfall,57.23,19.78,60,0
    .goto Westfall,52.13,33.22,60,0
    .goto Westfall,57.06,34.47,60,0
    .goto Westfall,57.23,19.78
    >>打开地上的|cRXP_PICK_一袋燕麦|r，并从中拾取|cRXP_LOOT_一捧燕麦|r
	>>|cRXP_WARN_你通常可以在农场围栏或建筑附近找到它们|r
	.complete 151,1 --Handful of Oats (8)
step << Human Warlock
    #xprate <1.2
    #label FurlbrowFarm
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫法布隆|r 和 |cRXP_FRIENDLY_弗娜·法布隆|r 对话
    .turnin 64 >> 交任务: 遗失的怀表
    .turnin 184 >> 交任务: 法布隆的地契
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .turnin 151 >> 交任务: 老马布兰契
    .goto Westfall,59.92,19.42
	.target +弗娜·法布隆
    .isOnQuest 184
step << Human Warlock
    #xprate >1.1
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫法布隆|r 和 |cRXP_FRIENDLY_弗娜·法布隆|r 对话
    .turnin 64 >> 交任务: 遗失的怀表
    .turnin 184 >> 交任务: 法布隆的地契
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .turnin 151 >> 交任务: 老马布兰契
    .target +弗娜·法布隆
    .goto Westfall,59.92,19.42
    .isOnQuest 184
step
    #xprate <1.2
    #optional << Human Warlock
    #label FurlbrowFarm << !Human/!Warlock
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫法布隆|r 和 |cRXP_FRIENDLY_弗娜·法布隆|r 对话
    .turnin 64 >> 交任务: 遗失的怀表
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .turnin 151 >> 交任务: 老马布兰契
    .target +弗娜·法布隆
    .goto Westfall,59.92,19.42
step
    #xprate >1.1
    #optional << Human Warlock
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫法布隆|r 和 |cRXP_FRIENDLY_弗娜·法布隆|r 对话
    .turnin 64 >> 交任务: 遗失的怀表
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .turnin 151 >> 交任务: 老马布兰契
    .goto Westfall,59.92,19.42
	.target +弗娜·法布隆
step
    #completewith SaldeanVendor
	.goto Westfall,56.04,31.23
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫萨丁|r 对话
    .vendor >> |cRXP_BUY_卖掉杂物|r
    >>|cRXP_WARN_切勿出售|r |T133884:0|t[鱼人的眼球]、|T135997:0|t[血牙野猪的头]、|T134341:0|t[血牙野猪的肝] |cRXP_WARN_或|r |T133972:0|t[秃鹫肉条]
	.target 农夫萨丁
step
    #optional
    .isQuestComplete 9
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫萨丁|r 对话
	.target 农夫萨丁
    .goto Westfall,56.04,31.23
    .turnin 9 >> 交任务: 清理荒野
step
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔玛·萨丁|r 对话
    .goto Westfall,56.40,30.50
    .turnin 22 >> 交任务: 猪肝馅饼
    .turnin 38 >> 交任务: 杂味炖肉
    .isQuestComplete 22
    .isQuestComplete 38
    .target 萨尔玛·萨丁
step
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔玛·萨丁|r 对话
    .goto Westfall,56.40,30.50
    .turnin 22 >> 交任务: 猪肝馅饼
    .isQuestComplete 22
    .target 萨尔玛·萨丁
step
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔玛·萨丁|r 对话
    .goto Westfall,56.40,30.50
    .turnin 38 >> 交任务: 杂味炖肉
    .isQuestComplete 38
    .target 萨尔玛·萨丁
  step
    .isQuestAvailable 38
    .goto Westfall,53.84,32.00,60,0
    .goto Westfall,50.80,21.76,80,0
    .goto Westfall,44.47,35.35,80,0
    .goto Westfall,53.84,32.00,80,0
    .goto Westfall,50.80,21.76,80,0
    .goto Westfall,44.47,35.35,80,0
    .goto Westfall,53.84,32.00,60,0
    .goto Westfall,44.47,35.35,60,0
    .goto Westfall,50.80,21.76
    >>击杀 |cRXP_ENEMY_看守傀儡|r, 搜刮 |cRXP_LOOT_秋葵|r 和 |cRXP_LOOT_灯油|r
    .complete 9,1 --Harvest Watcher (20)
    .collect 732,3,38,1 --Okra (3)
    .collect 814,5,103,1 --Flask of Oil (5)
    .mob 看守傀儡
step
    .isQuestTurnedIn 38
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
    >>击杀 |cRXP_ENEMY_看守傀儡|r, 搜刮 |cRXP_LOOT_灯油|r
    .complete 9,1 --Harvest Watcher (20)
    .collect 814,5,103,1 --Flask of Oil (5)
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
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_农夫萨丁|r 对话
	.target 农夫萨丁
    .goto Westfall,56.04,31.23
    .turnin 9 >> 交任务: 清理荒野
step
    #label SaldeanVendor
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔玛·萨丁|r 对话
	.target 萨尔玛·萨丁
    .goto Westfall,56.40,30.50
    .turnin 38 >> 交任务: 杂味炖肉
    .turnin 22 >> 交任务: 猪肝馅饼
step
    .goto Westfall,50.0,45.4
    >>在地图标记的区域内完成剩余的|cRXP_ENEMY_迪菲亚|r任务。|cRXP_WARN_这里采用动态刷新机制，击杀足够多的怪物后，它们就会不断刷新|r
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取 |T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +迪菲亚走私者
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
	.target 格里安·斯托曼
    .goto Westfall,56.33,47.52
    .turnin 12 >> 交任务: 西部荒野人民军
step
	.xp <14,1
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
	.target 格里安·斯托曼
    .goto Westfall,56.33,47.52
    .accept 65 >> 接任务: 迪菲亚兄弟会
step
    #xprate <1.2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丹努文队长|r 交谈
	.target 丹努文队长
    .goto Westfall,56.42,47.62
    .turnin 102 >> 交任务: 西部荒野的豺狼人
step
    .goto Westfall,57.002,47.169
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官刘易斯|r交谈
    >>|cRXP_BUY_购买一捆|r |T135435:0|t[普通木柴]|cRXP_BUY_和一块|r |T135237:0|t[燧石和火绒]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_这些用于制作|r |T135805:0|t[基础营火] |cRXP_WARN_，以便在乘船或乘坐矿道地铁时提升|r |T133971:0|t[烹饪] |cRXP_WARN_技能，节省时间|r
    >>|cRXP_WARN_你需要 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .target 军需官刘易斯
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵加里安|r 对话
	.target 哨兵加里安
    .goto Westfall,54.00,53.00
    .turnin 153 >> 交任务: 红色皮质面罩
step << Gnome Rogue/Dwarf Rogue
    #completewith next
    .goto Westfall,56.55,52.64
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step << Gnome Rogue/Dwarf Rogue
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    .vendor 1287 >>|cRXP_BUY_从她那里购买|r |T135343:0|t[战士阔剑] |cRXP_BUY_一把，或在拍卖行购买更好的武器，并装备到副手|r
    .money <0.3815
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 玛尔达·维勒
step << Gnome Rogue/Dwarf Rogue
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    .vendor 1287 >>|cRXP_BUY_向她购买|r |T135343:0|t[战士阔剑]|cRXP_BUY_一把|r
    .money <0.3815
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 玛尔达·维勒
step << Gnome Rogue/Dwarf Rogue
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拍卖师亚克森|r
    >>提前购买以下物品，以便稍后在黑海岸快速交任务
    >>这样可以省去四处找怪击杀的时间。如果不想购买这些物品，就跳过此步骤。
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target 拍卖师亚克森
step << Gnome Rogue/Dwarf Rogue
    .goto StormwindClassic,49.194,30.284
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r 对话
    .turnin 399 >> 交任务: 童年的记忆
    .target 巴隆斯·阿历克斯顿
    .zoneskip Stormwind City,1
    .isQuestComplete 399
step << Dwarf !Paladin/Gnome
    #label end
    #completewith DarkshoreBoat
    .hs >> 炉石回塞尔萨玛
step << Dwarf !Paladin/Gnome
    #softcore
    #completewith DarkshoreBoat
    .goto Loch Modan,33.94,50.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索格拉姆·伯雷森|r 对话
    .fly Wetlands >> 飞往湿地
    .target 索格拉姆·伯雷森
step << Dwarf !Paladin/Gnome
    #hardcore
    #completewith next
    .goto Loch Modan,33.94,50.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索格拉姆·伯雷森|r 对话
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
step << Human/Dwarf Paladin
    #label end
    .goto Westfall,56.55,52.64
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fly Ironforge >> 飞往铁炉堡
    .target 索尔
step << Human Mage/Human Rogue/Human Warrior/Human Warlock/Human Paladin/Human Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比尔班·飞钳|r 对话 << Human Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_芬斯维克|r 对话 << Human Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托德雷·铁矿|r 对话 << Human Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丁克|r 对话 << Human Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布兰度尔·铁锤|r 对话 << Human Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑞尔索恩|r 对话 << Human Warlock
    .goto Ironforge,51.1,8.7,15,0 << Human Warlock
    .goto Ironforge,50.343,5.657 << Human Warlock
    .goto Ironforge,65.905,88.405 << Human Warrior
    .goto Ironforge,51.495,15.330 << Human Rogue
    .goto Ironforge,25.207,10.756 << Human Priest
    .goto Ironforge,27.18,8.60 << Human Mage
    .goto Ironforge,23.141,6.149 << Human Paladin
    .trainer >> 学习职业技能
    .target 比尔班·飞钳 << Human Warrior
    .target 芬斯维克 << Human Rogue
    .target 托德雷·铁矿 << Human Priest
    .target 丁克 << Human Mage
    .target 布兰度尔·铁锤 << Human Paladin
    .target 布瑞尔索恩 << Human Warlock
step << Human Warrior
    .goto Ironforge,62.0,89.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯|r交谈
    .train 2567 >>学习 [投掷]
    .target 比克斯
step << Human Rogue
    #ah
    .goto Ironforge,62.375,88.679
    .vendor >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    +|cRXP_BUY_向她购买|r |T135343:0|t[战士阔剑]|cRXP_BUY_一把，或在拍卖行寻找更好/更便宜的武器|r
    .target 布雷文·寒钢
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Human Rogue
    #ssf
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    +|cRXP_BUY_若买得起，向她购买并装备|r |T135343:0|t[战士阔剑]|cRXP_BUY_一把|r
    .money <0.3815
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target 布雷文·寒钢
step << Human Rogue
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买一把|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]
    .collect 3107,100 << !tbc
    .collect 25873,1 << tbc
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.30
step << Human Rogue
    #completewith next
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]
    .use 3107 << !tbc
    .use 25873 << tbc
    .itemcount 3107,1 << !tbc
    .itemcount 25873,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.29
step << Dwarf Paladin
    .goto Ironforge,24.55,4.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝尔杜克·凝眉|r 对话
    .trainer >> 学习职业技能
    .target 贝尔杜克·凝眉
step << Dwarf Paladin
    #completewith next
    .goto Ironforge,25.27,1.53,6,0
    .goto Ironforge,24.35,11.90,10 >> 上楼前往 |cRXP_FRIENDLY_穆里顿·热炉|r 处
step << Dwarf Paladin
    .goto Ironforge,23.539,8.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆里顿·热炉|r交谈
    .turnin 1784 >>交任务圣洁之书
    .accept 1785 >>接受任务圣洁之书
    .target 穆里顿·热炉
step << Dwarf Paladin
    .goto Ironforge,27.63,12.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒂萨·热炉|r 交谈
    .turnin 1785 >>交任务圣洁之书
    .target 蒂萨·热炉
step << Dwarf Paladin
    #softcore
    #completewith DarkshoreBoat
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 对话
    .fly Wetlands>> 飞往湿地
    .target 格莱斯·瑟登
step
    #hardcore << !Human
    .goto Dun Morogh,53.5,34.9
    .zone Dun Morogh>>离开铁炉堡
step
    #hardcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >> 前往丹莫罗 -> 湿地跳点
step
    #hardcore
    .goto Dun Morogh,59.5,42.8,40,0
    .goto Dun Morogh,60.4,44.1,40,0
    .goto Dun Morogh,61.1,44.1,20,0
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
    >>|cRXP_WARN_请先观看视频指南，了解这条捷径的走法！|r
    >>|cRXP_WARN_走丹莫罗 -> 湿地的免死捷径|r
    >>|cRXP_WARN_渡过水域时注意避开 |cRXP_ENEMY_湿地鳄鱼|r 和 |cRXP_ENEMY_鱼人|r|r
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >> |cRXP_WARN_点击此处查看视频攻略|r
    .goto Wetlands,12.1,60.3,80 >> 前往米奈希尔港
    .mob 湿地鳄鱼
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
step << Human
    #softcore
    #completewith next
    .goto Dun Morogh,30.9,33.1,20 >> 前往丹莫罗到湿地的死回城跳点
step << Human
    #softcore
    .goto Dun Morogh,32.4,29.1,20 >> 继续翻山前往死回城位置
step << Human
    #softcore
    .goto Dun Morogh,33.0,27.2,20,0
    .goto Dun Morogh,33.0,25.2,20,0
    .goto Wetlands,11.727,43.306
    .deathskip >> 直接跑向北方的边缘并跳下去. 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << Human
    #softcore
    .goto Wetlands,12.7,46.7,80 >> 游往米奈希尔港
step
    .money <0.08
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔·奥雷|r 对话
    .vendor 1448 >> |cRXP_WARN_购买:|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量供应的物品。如果 |cRXP_FRIENDLY_尼尔·奥雷|r 没有出售，请跳过此步骤|r
	.target 尼尔·奥雷
    .bronzetube
step << Human/Dwarf Paladin
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r 对话
    .fp Wetlands>> 获取湿地飞行点
    .target 谢尔雷·布隆迪尔
step
    .goto Wetlands,7.95,56.38
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德温·晨光|r 对话
    .vendor 1453 >> |cRXP_WARN_尽量购买所有在售的|r |T134831:0|t[治疗药水] |cRXP_WARN_。|r
    >>|cRXP_WARN_这是限量供应的物品. 如果 |cRXP_FRIENDLY_德温·晨光|r 没有, 可跳过此步骤|r
    .target 德温·晨光
step
    #optional
    #label DockTravel
    #completewith next
    .goto Wetlands,7.10,57.96,30,0
    .goto Wetlands,4.61,57.26,15 >> 前往奥伯丁船码头
    .zoneskip Darkshore
step
    #optional
    #requires DockTravel
    #label DarkshoreCook1
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到就在船上执行以下操作；船刚离开，就在码头执行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火] |cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires DarkshoreCook1
    #label DarkshoreCook2
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到就在船上执行以下操作；船刚离开，就在码头执行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火] |cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires DarkshoreCook2
    #label DarkshoreCook3
    #completewith DarkshoreBoat
    >>|cRXP_WARN_船刚到就在船上执行以下操作；船刚离开，就在码头执行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火] |cRXP_WARN_（可在法术书的“通用”标签页中找到）|r
    .usespell 818
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
    #optional
    #requires DarkshoreCook3
    #label DarkshoreCook4
    #completewith DarkshoreBoat
    >>|cRXP_WARN_你需要 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_以下物品：|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1+)
    .itemcount 2672,1 --Stringy Wolf Meat (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #optional
    #requires DarkshoreCook4
    #label DarkshoreCook5
    #completewith DarkshoreBoat
    >>|cRXP_WARN_你需要 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[多汁狼肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烧烤狼肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,<1 --Chunk of Boar Meat (<1)
    .itemcount 2672,1 --Stringy Wolf Meat (1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #optional
    #requires DarkshoreCook5
    #label DarkshoreCook6
    #completewith DarkshoreBoat
    >>|cRXP_WARN_你需要 50 点|r |T133971:0|t[烹饪] |cRXP_WARN_技能，以便之后在暮色森林完成一个任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_将|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_制作成|r |T133974:0|t[烤野猪肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #label DarkshoreBoat
    .goto 1437,4.370,56.762
    >>|cRXP_WARN_如果需要，在等待前往黑海岸的船时提升|r |T135966:0|t[急救] |cRXP_WARN_技能|r
    .zone Darkshore >> 乘船前往黑海岸
]])
----End of <1.5x Westfall----
----Start of Darkshore Part 1----
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#tbc
#season 0,1
#version 1
<< Alliance
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 14-16 Darkshore
#next 16-19 Darkshore
-- #displayname 11-16 Darkshore << NightElf/Dwarf Hunter !SoD
-- #displayname 15-17 Darkshore << !NightElf !Dwarf/!Hunter !SoD
-- #displayname 13-18 Darkshore << Dwarf Hunter/!NightElf sod
#displayname 11-16 黑海岸 << NightElf
#displayname 13-16 黑海岸 << Dwarf Hunter
#displayname 15-16 黑海岸 << !NightElf !Hunter/!NightElf !Dwarf
#displayname 14-16 黑海岸
step
    #label start --hidden step for #include
step << NightElf
    #label WashedA
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step << !NightElf
    #optional
    #completewith BigThreat
    .goto Darkshore,37.04,44.13,0
    >>当船离奥伯丁岸边最近时跳下去
    .subzone 442 >> 游往奥伯丁
step
    #ah
    #optional
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果 << !sod/Hunter/Druid
    .accept 1141 >> 接任务：钓鱼世家
    .turnin 1141 >> 交任务：钓鱼世家
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target 古博·布拉普
    .xp <15,1
step
    #ah
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1141 >> 接任务：钓鱼世家
    .turnin 1141 >> 交任务：钓鱼世家
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target 古博·布拉普
step
    #optional
    #season 0,1
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普
    .xp <15,1
step << NightElf
    #optional
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_WARN_向他购买最多40条|r |T133918:0|t[长嘴泥鳅]|cRXP_WARN_，并出售其他所有5级或以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .turnin 6342 >> 交任务：飞往奥伯丁
    .accept 6343 >> 接任务：飞回泰达希尔 << Druid sod
    .target 莱尔德
    .xp >15,1 << Warrior/Rogue/Paladin
    .isQuestAvailable 2118
step << NightElf
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    .turnin 6342 >> 交任务：飞往奥伯丁
    .target 莱尔德
step << !NightElf
    #optional
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_WARN_向他购买最多40条|r |T133918:0|t[长嘴泥鳅]|cRXP_WARN_，并出售其他所有5级或以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .xp >15,1 << Warrior/Rogue
    .target 莱尔德
    .isQuestAvailable 2118
step
    #completewith BigThreat
    .goto Darkshore,37.04,44.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_旅店老板莎希因|r交谈
    .home >> 将炉石绑定在奥伯丁
    .target 旅店老板莎希因
step
    #optional
    #completewith next
    .goto 1439,36.826,44.150
    .goto 1439,36.688,43.952,8 >> 走上楼梯前往|cRXP_FRIENDLY_维兹班恩·曲针|r处
step
    #xprate <1.5
    .goto 1439,36.976,44.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >> 接任务：传声盒827号
    .target 维兹班恩·曲针
step
    #xprate >1.49
    .goto 1439,36.976,44.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >> 接任务：传声盒827号
    .target 维兹班恩·曲针
    .xp >15,1 --XX Skip if 15+
step
    #xprate <1.5
    #optional << NightElf
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >> 接任务：洞中的蘑菇
    .target 巴瑞萨斯·月影
    .xp <12,1
step
    #xprate <1.5
    #optional << NightElf
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >> 接任务：红色水晶
    .target 哨兵戈琳达·纳希恩
    .xp <12,1
step
    #xprate >1.49
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >> 接任务：洞中的蘑菇
    .target 巴瑞萨斯·月影
step
    #xprate >1.49
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >> 接任务：红色水晶
    .target 哨兵戈琳达·纳希恩
step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >> 接任务：瘟疫蔓延
    .target 萨纳瑞恩·绿树
step
    #label BigThreat
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >> 接任务：熊怪的威胁
    .target 特伦希斯
step
    #optional
    .goto Darkshore,37.04,44.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_旅店老板莎希因|r交谈
    .home >> 将炉石绑定在奥伯丁
    .target 旅店老板莎希因
    .bindlocation 442
step << !NightElf
    #label WashedA
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step << !NightElf
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fp Auberdine >> 获取奥伯丁飞行点
    .target 凯莱斯·月羽
step << Dwarf Hunter
    #optional
    #completewith RabidThistle
    #loop
    .goto Darkshore,40.75,70.49,0
    .goto Darkshore,40.77,78.56,0
    .goto Darkshore,38.21,73.32,0
    .goto Darkshore,40.75,70.49,40,0
    .goto Darkshore,40.77,78.56,40,0
    .goto Darkshore,38.21,73.32,40,0
    >>|cRXP_WARN_让宠物去攻击一只|cRXP_ENEMY_蓟熊|r。宠物被|cRXP_ENEMY_蓟熊|r击晕后，放弃宠物并开始驯服它|r
    .tame 2163 >>|cRXP_WARN_施放|r |T132164:0|t[驯服野兽]|cRXP_WARN_来驯服|cRXP_ENEMY_蓟熊|r|r
    .target 蓟熊
step
    #optional
    #completewith FirstWashed
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .subzoneskip 442
step
    #sticky
    #label BuzzBox1
    #loop
    .goto 1439,36.051,44.757,0
    .goto 1439,36.280,50.071,0
    .goto 1439,35.275,53.464,0
    .waypoint 1439,36.091,51.501,60,0
    .waypoint 1439,37.115,52.368,60,0
    .waypoint 1439,37.130,53.663,60,0
    .waypoint 1439,36.740,55.221,60,0
    .waypoint 1439,35.655,55.872,60,0
    .waypoint 1439,35.088,55.085,60,0
    .waypoint 1439,35.275,53.464,60,0
    .waypoint 1439,36.091,51.501,60,0
    .waypoint 1439,36.280,50.071,60,0
    .waypoint 1439,36.523,48.554,60,0
    .waypoint 1439,35.977,48.408,60,0
    .waypoint 1439,35.902,47.145,60,0
    .waypoint 1439,35.759,45.455,60,0
    .waypoint 1439,36.051,44.757,60,0
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，拾取|cRXP_LOOT_蟹腿|r
    >>|cRXP_WARN_你可能需要下水才能接近它们|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
    .isOnQuest 983
step
    .goto 1439,36.371,50.920
    >>打开|cRXP_PICK_搁浅的海洋生物|r，拾取|cRXP_LOOT_海洋生物的骸骨|r
    .complete 3524,1 --Sea Creature Bones (1)
step << Druid
    #ah
    #season 0,1
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_将|r |T136065:0|t[草药学]|cRXP_WARN_提升至15点，以便采集|r |T134187:0|t[地根草]|cRXP_WARN_，供稍后的重要职业任务使用。之后可以遗忘该专业|r
    >>|cRXP_WARN_如果打算稍后从拍卖行购买5株|r |T134187:0|t[地根草]|cRXP_WARN_，可以跳过此步骤|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox
step << Druid
    #ssf
    #season 0,1
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_将|r |T136065:0|t[草药学]|cRXP_WARN_提升至15点，以便采集5株|r |T134187:0|t[地根草]|cRXP_WARN_，供稍后的重要职业任务使用。之后可以遗忘该专业|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox
step << Druid
    #optional
    #season 0,1
    #completewith CliffspringEnd
    #requires GatheringQ
    >>|cRXP_WARN_为后续职业任务收集5株 |T134187:0|t[地根草]，可通过 |T136065:0|t[草药学]采集，也有较低几率从|cRXP_PICK_破损的箱子|r中找到|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .skill herbalism,<15,1
step
    #sticky
    #label RabidThistle
    #loop
    .goto 1439,38.226,52.780,0
    .goto 1439,39.129,59.176,0
    .goto 1439,38.226,52.780,50,0
    .goto 1439,38.527,54.661,50,0
    .goto 1439,38.037,56.815,50,0
    .goto 1439,38.095,58.395,50,0
    .goto 1439,38.696,57.874,50,0
    .goto 1439,39.129,59.176,50,0
    >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望]|cRXP_WARN_，目标为|r|cRXP_ENEMY_狂暴蓟熊|r|cRXP_WARN_。只要选中这只熊，就可在任意距离使用|r
    >>|cRXP_WARN_附近没有熊时，切勿使用任务物品|r
    >>|cRXP_WARN_可能会浪费陷阱，导致任务无法完成！若发生这种情况，返回任务发布人处领取新陷阱|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .unitscan 狂暴蓟熊
    .use 7586
step
    #label FurlbogCamp
    .goto Darkshore,38.90,53.59
    >>跑向熊怪营地的边缘
    .complete 984,1 -- Find a corrupt furbolg camp
step << NightElf
    #xprate <1.5
    #loop
    .goto 1439,36.051,44.757,0
    .goto 1439,36.280,50.071,0
    .goto 1439,35.275,53.464,0
    .goto 1439,36.051,44.757,60,0
    .goto 1439,35.759,45.455,60,0
    .goto 1439,35.902,47.145,60,0
    .goto 1439,35.977,48.408,60,0
    .goto 1439,36.523,48.554,60,0
    .goto 1439,36.280,50.071,60,0
    .goto 1439,36.091,51.501,60,0
    .goto 1439,37.115,52.368,60,0
    .goto 1439,37.130,53.663,60,0
    .goto 1439,36.740,55.221,60,0
    .goto 1439,35.655,55.872,60,0
    .goto 1439,35.088,55.085,60,0
    .goto 1439,35.275,53.464,60,0
    .goto 1439,36.091,51.501,60,0
    .xp 11+7300 >> 刷怪至 7300+/8800 经验值
step
    #label invisThistle
    #optional
    #requires RabidThistle
--XXREQ Placeholder invis step until multiple requires per step
step
    #xprate <1.5
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .turnin 983 >> 交任务：传声盒827号
    .accept 1001 >> 接任务：传声盒411号
step
    #xprate >1.49
    #optional << !NightElf/Hunter
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .turnin 983 >> 交任务：传声盒827号
    .accept 1001 >> 接任务：传声盒411号 << !sod
    .isQuestComplete 983
step << !sod
    #xprate >1.49
    #optional
    .goto 1439,36.634,46.250
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .accept 1001 >>接任务：传声盒411号
    .isQuestTurnedIn 983
step << NightElf !Hunter
    #xprate >1.49
    #optional
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .accept 1001 >> 接任务：传声盒411号
    .isQuestTurnedIn 983
--XX so NEs can catch up on xp from those that came via menethil
--XX Hunters skip this as they will get better xp/hr grinding furbolgs
step
    #label FirstWashed
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 3524 >> 交任务：搁浅的巨兽
    .accept 4681 >> 接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 前往码头上的|cRXP_FRIENDLY_塞瑞利恩·白爪|r处
step
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >> 接任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #season 0,1 << Rogue
    #optional
    #completewith SeaT1
    .goto 1439,32.432,43.744,15 >> 走到码头尽头，跳进水里
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith washed1
    .goto Darkshore,33.59,40.36,0
    .goto Darkshore,30.94,45.79,0
    .goto Darkshore,33.03,48.13,0
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，拾取|cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
    .isOnQuest 1001
step
    #label SeaT1
    .goto 1439,31.841,46.304
    >>打开|cRXP_PICK_海龟骨头|r，拾取|cRXP_LOOT_海龟的残骸|r
    .complete 4681,1 --Sea Turtle Remains (1)
step
    #optional
    #season 0,1
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普
    .xp <15,1
step
    #label washed1
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4681 >> 交任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
    #xprate <1.5
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >> 接任务：洞中的蘑菇
    .target 巴瑞萨斯·月影
step
    #xprate <1.5
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4811 >> 接任务：红色水晶
    .target 哨兵戈琳达·纳希恩
step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2118 >> 交任务：瘟疫蔓延
    .accept 2138 >> 接任务：清除疫病
    .target 萨纳瑞恩·绿树
step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >> 交任务：熊怪的威胁
    .accept 985 >> 接任务：熊怪的威胁
    .accept 4761 >> 接任务：桑迪斯·织风
    .target 特伦希斯
step << NightElf Warrior/NightElf Rogue
    #sticky
    #season 0,1
    #label DeepOceanStart
    .goto 1439,38.107,41.165,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手
    .xp <13,1
step << NightElf Warrior/NightElf Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库德拉姆·石锤|r和|cRXP_FRIENDLY_迪尔弗拉姆·火须|r交谈
    .train 2575 >> 学习 |T134708:0|t[采矿]
    .target +库德拉姆·石锤
    .goto Darkshore,38.249,41.008
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .target +迪尔弗拉姆·火须
    .goto Darkshore,38.191,40.935
    >>|cRXP_WARN_这样就能制作|r |T135248:0|t[劣质磨刀石]|cRXP_WARN_，使用后可使近战伤害提高2点|r << Warrior/Rogue
    >>|cRXP_WARN_如果不打算完成此步骤，请跳过此步骤|r
step << NightElf Warrior/NightElf Rogue
    #optional
    .goto Darkshore,38.142,41.108
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾丽萨·钢拳|r交谈
    >>|cRXP_BUY_向她购买|r |T134708:0|t[矿工锄]|cRXP_BUY_一把|r
    .target 艾丽萨·钢拳
    .collect 2901,1 -- Mining Pick (1)
    .train 2575,3 --Mining Trained
step << NightElf Warrior/NightElf Rogue
    #optional
    #completewith Bashal1
    .cast 2580 >> |cRXP_WARN_激活技能：|r|T136025:0|t[寻找矿物]
    .usespell 2580
    .train 2575,3 --Mining Trained
step << !NightElf/!Warrior !Rogue
    #xprate <1.5 --<< !NightElf/Hunter --XX Night Elves do it on 2x to catch up on xp EXCEPT Dwarf/NE Hunters (1x only)
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手
    .xp <13,1
step
    #optional
    #requires DeepOceanStart << NightElf Warrior/NightElf Rogue
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
step << NightElf Rogue
    .goto 1439,37.575,40.348
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉姆·长爪|r交谈
    .vendor 4183 >>|cRXP_BUY_向他购买一把|r |T135640:0|t[双刃弯刀]|cRXP_BUY_，如果买得起|r
    .collect 2207,1 -- Jambiya (1)
    .disablecheckbox
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.10
--  .money <0.2390
    .target 纳拉姆·长爪
step
    #optional
    #completewith next
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor 4182 >> |cRXP_BUY_按需向他购买|r |T133634:0|t[棕色小包]|cRXP_BUY_或|r |T133634:0|t[棕色小皮包]|cRXP_BUY_，数量按实际需要决定|r
    >>|cRXP_BUY_向他购买|r |T132382:0|t[锋利的箭]|cRXP_BUY_或|r |T132384:0|t[重弹丸]|cRXP_BUY_，直到箭袋/弹药袋装满|r << Hunter
    .target 达蒙德
step
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 954 >> 接任务：巴莎兰
    .accept 958 >> 接任务：上层精灵的工具 << !sod
    .target 桑迪斯·织风
    .xp >16,1
--XX if 16+, skip Tools
step
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .accept 954 >> 接任务：巴莎兰
    .target 桑迪斯·织风
    .xp >18,1
--XX if 18+, skip Bashal
step
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
----Start of NE >1.49x catchup (everyone 1x) Early boat section----
step
    #xprate <1.5 --<< !NightElf/Hunter
    #completewith MistVeilEarly
    .goto Darkshore,35.44,35.83,0
    .goto Darkshore,35.71,32.27,0
    .goto Darkshore,36.70,30.00,0
    .goto Darkshore,38.73,28.25,0
    .goto Darkshore,40.17,28.76,0
    .goto Darkshore,35.44,35.83,55,0
    .goto Darkshore,35.71,32.27,55,0
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，拾取|cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
    .isOnQuest 1001
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith next
    +|cRXP_WARN_按 Esc 键，进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选"启用互动按键"，并将"与目标互动"选项绑定至一个快捷键|r
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,38.213,28.754
--  .goto 1439,38.234,28.796
    >>|cRXP_WARN_==注意呼吸条（氧气值）==|r
    >>|cRXP_WARN_从水下潜至船尾外侧|r
    >>|cRXP_WARN_在箭头位置，按下"与目标互动"快捷键来在船体外部拾取|cRXP_LOOT_银色清晨号的保险箱|r|r
    >>|cRXP_WARN_如果不想这么做，也可以潜入船内底层去拾取|cRXP_LOOT_银色清晨号的保险箱|r|r
    .complete 982,1 --Silver Dawning's Lockbox (1)
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    #label MistVeilEarly
    .goto 1439,39.581,27.487
--  .goto 1439,39.629,27.462
    >>|cRXP_WARN_==注意呼吸条（氧气值）==|r
    >>|cRXP_WARN_从水下潜至船尾外侧|r
    >>|cRXP_WARN_在箭头位置，按下"与目标互动"快捷键来在船体外部拾取|cRXP_LOOT_迷雾之纱号的保险箱|r|r
    >>|cRXP_WARN_如果不想这么做，就潜到船底层，然后拿里面的|cRXP_LOOT_迷雾之纱号的保险箱|r|r
    .complete 982,2 --Mist Veil Lockbox (1)
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    #loop
    .goto Darkshore,40.17,28.76,0
    .goto Darkshore,38.73,28.25,0
    .goto Darkshore,36.70,30.00,0
    .goto Darkshore,40.17,28.76,55,0
    .goto Darkshore,38.73,28.25,55,0
    .goto Darkshore,36.70,30.00,55,0
    .goto Darkshore,35.71,32.27,55,0
    .goto Darkshore,35.44,35.83,55,0
    .goto Darkshore,35.71,32.27,55,0
    .goto Darkshore,35.44,35.83,55,0
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，拾取|cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
    .isOnQuest 1001
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物
    .isOnQuest 1001
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,41.960,28.616
    >>点击地面上的|cRXP_PICK_传声盒411号|r
    .turnin 1001 >> 交任务：传声盒411号
    .accept 1002 >> 接任务：传声盒323号
    .isQuestComplete 1001
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,41.960,28.616
    >>点击地面上的|cRXP_PICK_传声盒411号|r
    .accept 1002 >> 接任务：传声盒323号
    .isQuestTurnedIn 1001
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith AsterionTravel
    .goto 1439,44.190,33.697,0
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isQuestTurnedIn 1001
----End of NE >1.49x catchup (everyone 1x) Early boat section----
 step
    #optional
    #completewith Bashal1
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
step
    #xprate <1.5
    #optional
    #label AsterionTravel
    #completewith Bashal1
    .goto 1439,44.629,36.316,20,0
    .goto 1439,44.168,36.289,15 >> 前往|cRXP_FRIENDLY_阿斯特利安|r处
step
    #xprate >1.49
    #optional
    #label AsterionTravelSoD
    #completewith Bashal1
    .goto 1439,44.376,36.754,20,0
    .goto 1439,44.168,36.289,15 >> 前往|cRXP_FRIENDLY_阿斯特利安|r处
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_途中不要击杀|cRXP_ENEMY_野生劣魔|r和|cRXP_ENEMY_恶灵劣魔|r|r
    .turnin 954 >> 交任务：巴莎兰
    .accept 955 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isOnQuest 954
    .xp >16,1
--XX skip Bashal Aran qline if 16+
step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_途中不要击杀|cRXP_ENEMY_野生劣魔|r和|cRXP_ENEMY_恶灵劣魔|r|r
    .turnin 954 >> 交任务：巴莎兰
    .target 阿斯特利安
    .isOnQuest 954
--XX Turn in Breadcrumb if you picked it up earlier before 18
step
    #label Bashal1
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .accept 955 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestTurnedIn 954
    .xp >16,1
--XX if you ding 16 from turnin, skip Bashal Aran qline
step
    #loop
    .goto 1439,44.528,36.587,0
    .goto 1439,45.334,39.393,0
    .goto 1439,46.096,36.541,0
    .goto 1439,44.528,36.587,50,0
    .goto 1439,44.435,37.404,50,0
    .goto 1439,44.443,38.202,50,0
    .goto 1439,44.493,39.008,50,0
    .goto 1439,44.821,39.711,50,0
    .goto 1439,45.334,39.393,50,0
    .goto 1439,45.167,38.652,50,0
    .goto 1439,45.091,37.865,50,0
    .goto 1439,45.495,37.019,50,0
    .goto 1439,45.831,36.790,50,0
    .goto 1439,46.096,36.541,50,0
    .goto 1439,46.906,36.171,50,0
    .goto 1439,47.431,36.151,50,0
    .goto 1439,47.022,37.083,50,0
    .goto 1439,47.166,37.580,50,0
    .goto 1439,45.827,36.812,50,0
    >>击杀|cRXP_ENEMY_野生劣魔|r和|cRXP_ENEMY_恶灵劣魔|r，拾取|cRXP_LOOT_劣魔耳环|r
    >>|cRXP_WARN_暂时不要杀|cRXP_ENEMY_戴瑟雷萨特|r|r
    .complete 955,1 --Grell Earring (8)
    .mob 野生劣魔
    .mob 恶灵劣魔
    .isOnQuest 955
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 955 >> 交任务：巴莎兰
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestComplete 955
step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestTurnedIn 955
step
    #completewith HCHunterEnd
    #optional
    .abandon 955 >> 放弃任务[巴莎兰]
    .isQuestAvailable 955
step
    #xprate >1.59
    #loop
    .goto 1439,45.393,36.472,0
    .goto 1439,45.429,39.773,0
    .goto 1439,47.368,36.774,0
    .goto 1439,45.393,36.472,45,0
    .goto 1439,45.938,37.800,45,0
    .goto 1439,45.938,38.040,45,0
    .goto 1439,46.531,39.134,45,0
    .goto 1439,45.429,39.773,45,0
    .goto 1439,47.262,37.674,45,0
    .goto 1439,47.920,37.228,45,0
    .goto 1439,47.368,36.774,45,0
    >>击杀|cRXP_ENEMY_戴瑟雷萨特|r，拾取|cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_它们没有动态刷新。如果找不到以下敌人，请跳过此步骤：|r|cRXP_ENEMY_戴瑟雷萨特|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob 戴瑟雷萨特
    .isQuestTurnedIn 955
step
    #xprate <1.59
    #loop
    .goto 1439,45.393,36.472,0
    .goto 1439,45.429,39.773,0
    .goto 1439,47.368,36.774,0
    .goto 1439,45.393,36.472,45,0
    .goto 1439,45.938,37.800,45,0
    .goto 1439,45.938,38.040,45,0
    .goto 1439,46.531,39.134,45,0
    .goto 1439,45.429,39.773,45,0
    .goto 1439,47.262,37.674,45,0
    .goto 1439,47.920,37.228,45,0
    .goto 1439,47.368,36.774,45,0
    >>击杀|cRXP_ENEMY_戴瑟雷萨特|r，拾取|cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_注意，这些怪没有动态刷新|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob 戴瑟雷萨特
    .isQuestTurnedIn 955
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 956 >> 交任务：巴莎兰
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestComplete 956
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
    .isQuestTurnedIn 956
step << NightElf/Dwarf Hunter
    #optional
    #xprate <1.5
    .goto 1439,44.528,36.587,0
    .goto 1439,45.334,39.393,0
    .goto 1439,46.096,36.541,0
    .goto 1439,44.528,36.587,50,0
    .goto 1439,44.435,37.404,50,0
    .goto 1439,44.443,38.202,50,0
    .goto 1439,44.493,39.008,50,0
    .goto 1439,44.821,39.711,50,0
    .goto 1439,45.334,39.393,50,0
    .goto 1439,45.167,38.652,50,0
    .goto 1439,45.091,37.865,50,0
    .goto 1439,45.495,37.019,50,0
    .goto 1439,45.831,36.790,50,0
    .goto 1439,46.096,36.541,50,0
    .goto 1439,46.906,36.171,50,0
    .goto 1439,47.431,36.151,50,0
    .goto 1439,47.022,37.083,50,0
    .goto 1439,47.166,37.580,50,0
    .goto 1439,45.827,36.812,50,0
    .xp 13 >> 刷怪升至13级
step
    #optional
    #label HCHunterEnd --hidden step for #include
step
    #optional
    #completewith AuberdineTurnin2 << NightElf/Hunter/Druid/Warrior
    #completewith AmethStart << !NightElf !Hunter !Druid !Warrior
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .subzoneskip 442
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith AuberdineTurnin2 << NightElf/Hunter/Druid/Warrior
    #completewith AmethStart << !NightElf !Hunter !Druid !Warrior
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isQuestTurnedIn 1001
step
    #xprate <1.5
    #completewith RedCrystal
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_提升至 10 点|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #xprate <1.5
    #completewith AuberdineTurnin2 << NightElf/Hunter/Druid/Warrior
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_提升至 50 点|r
    >>|cRXP_WARN_现在不用特意刷小蛋；记得留好这些蛋，并估算烹饪达到50点还需要提升多少技能点|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1
step
    #season 0,1
    #completewith LateTurtleStart
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_提升至 50 点|r
    >>|cRXP_WARN_现在不用特意刷小蛋；记得留好这些蛋，并估算烹饪达到50点还需要提升多少技能点|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1
    .subzoneskip 442 --Auberdine
    .subzoneskip 447 --Ameth'Aran
step
    #season 0,1
    #label RedCrystal
    .goto 1439,47.314,48.676
    >>前往|cRXP_PICK_神秘的红色水晶|r处
    >>|cRXP_WARN_小心|cRXP_ENEMY_狂暴的月夜枭兽|r：|cRXP_PICK_神秘的红色水晶|r西侧有两组，每组2只；彼此靠近的成对枭兽会联动仇恨|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range
step << Druid
    #optional
    #season 0,1
    #completewith Lunaclaw
    .goto 1439,43.126,45.593,15 >> 进入有|cRXP_PICK_月夜枭兽之石|r的洞穴
step << Druid
    #optional
    #season 0,1
    #completewith Lunaclaw
    .goto Darkshore,43.50,45.97
    .cast 18974 >>|cRXP_WARN_使用|r |T132857:0|t[塞纳里奥月尘]|cRXP_WARN_，在洞穴内的|cRXP_PICK_月夜枭兽之石|r上召唤|cRXP_ENEMY_月爪枭兽|r，它会出现在洞口|r
    .timer 4,身心之力剧情
    .use 15208
    .isOnQuest 6001
step << Druid
    #label Lunaclaw
    #season 0,1
    .goto Darkshore,43.09,45.55
    >>击败|cRXP_ENEMY_月爪枭兽|r后，与出现的|cRXP_FRIENDLY_月爪枭兽的灵魂|r交谈
    .complete 6001,1 --Defeat Lunaclaw (x1)
    .use 15208
    .mob 月爪枭兽
    .target 月爪枭兽的灵魂
----Start of Early Red Crystal turnin Section (NE below 14 for xp, Hunters/Druids for staff wep upgrade)/Druid bear q final if not done earlier----
step << NightElf/Hunter/Warrior/Druid
    #optional
    #completewith Cascade
    #season 0,1
    .hs >> 炉石回奥伯丁
    .cooldown item,6948,>0,1
    .subzoneskip 442
    .isQuestTurnedIn 6001 << Druid
step << NightElf/Hunter/Druid/Warrior
    #optional
    #label AuberdineTurnin2
    #completewith Cascade
    .goto 1439,37.703,43.393
    .subzone 442 >> 返回奥伯丁
    .cooldown item,6948,<0,1 << !Druid
step << NightElf/Hunter/Druid/Warrior
    #optional
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .xp >14,1 << Hunter/Druid
--XX If Night Elves, Hunters, or Druids are lower than level 14, do questline
step << Hunter/Druid/Warrior
    #season 0,1 << Druid
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5 << Hunter/Druid
--XX If Hunters and Druids (in Era) have a worse weapon than the Oakthrush Staff, do the quest even if 14+
step << NightElf/Hunter/Druid/Warrior
    #optional
    #label Cascade
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isQuestTurnedIn 4811 --show step if Red Crystal turned in
step << NightElf/Hunter/Druid/Warrior
    #optional
    #season 0,1
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_WARN_向他购买最多40条|r |T133918:0|t[长嘴泥鳅]|cRXP_WARN_，并出售其他所有5级或以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .target 莱尔德
    .subzoneskip 442,1 --skip if you leave Auber
    .xp >15,1 << Warrior/Rogue
    .isQuestTurnedIn 4811 --show step if you turned in red crystal
step << NightElf/Hunter/Druid
    #optional
    #season 0,1
    .goto Darkshore,37.0,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥林迪雅|r交谈
    >>|cRXP_WARN_向她购买最多35瓶|r |T132815:0|t[冰镇牛奶]|cRXP_WARN_，并出售其他所有5级或以下的饮料|r
    .collect 1179,35 --Ice Cold Milk (35)
    .target 奥林迪雅
    .subzoneskip 442,1 --skip if you leave Auber
    .isQuestTurnedIn 4811 --show step if you turned in red crystal
step << NightElf/Hunter/Druid/Warrior
    #optional
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r |T134865:0|t[空水管]|cRXP_WARN_在奥伯丁的月亮井取水|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
    .isQuestTurnedIn 4811
step << NightElf Hunter
    #optional
    #season 0,1
    .goto Darkshore,37.4,40.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    >>|cRXP_WARN_向他购买最多2000支|r |T132382:0|t[锋利的箭]|cRXP_WARN_，稍后的刷怪阶段会用到|r
    .collect 2515,2000 --Sharp Arrow (2000)
    .target 达蒙德
    .subzoneskip 442,1 --skip if you leave Auber
    .isQuestTurnedIn 4811 --show step if you turned in red crystal
step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith HCHunterStart
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith EarlyCrystalEnd
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_提升至 10 点|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith EarlyCrystalEnd
    #season 0,1
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_提升至 50 点|r
    >>|cRXP_WARN_现在不用特意刷小蛋；记得留好这些蛋，并估算烹饪达到50点还需要提升多少技能点|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith HCHunterStart
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isOnQuest 1002
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #season 0,1
    .goto 1439,47.314,48.676
    #label EarlyCrystalEnd
    >>点击|cRXP_PICK_神秘的红色水晶|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_狂暴的月夜枭兽|r：|cRXP_PICK_神秘的红色水晶|r西侧有两组，每组2只；彼此靠近的成对枭兽会联动仇恨|r
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #season 0,1
    #loop
    .goto 1439,46.918,48.630,0
    .goto 1439,45.338,54.337,0
    .goto 1439,45.108,49.184,0
    .goto 1439,45.322,44.756,0
    .goto 1439,46.918,48.630,60,0
    .goto 1439,46.233,49.578,60,0
    .goto 1439,46.110,50.828,60,0
    .goto 1439,45.766,51.560,60,0
    .goto 1439,45.652,52.729,60,0
    .goto 1439,45.338,54.337,60,0
    .goto 1439,44.817,53.601,60,0
    .goto 1439,44.398,52.137,60,0
    .goto 1439,44.424,50.766,60,0
    .goto 1439,45.090,50.415,60,0
    .goto 1439,45.108,49.184,60,0
    .goto 1439,44.578,48.547,60,0
    .goto 1439,44.311,47.903,60,0
    .goto 1439,43.577,46.772,60,0
    .goto 1439,42.237,46.108,60,0
    .goto 1439,42.715,45.372,60,0
    .goto 1439,43.101,44.400,60,0
    .goto 1439,45.322,44.756,60,0
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_提升至 10 点|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Warrior/Druid
    #optional
    #completewith HCHunterStart
    .hs >> 炉石回奥伯丁
    .cooldown item,6948,>0,1
    .subzoneskip 442
    .isQuestTurnedIn 6001 << Druid
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith HCHunterStart
    .goto 1439,37.703,43.393
    .subzone 442 >> 返回奥伯丁
    .cooldown item,6948,<0,1 << !Druid
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #season 0,1
    .goto Darkshore,37.70,43.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4813,3 >> 交任务：水晶中的碎骨
    .target 哨兵戈琳达·纳希恩
    .isQuestTurnedIn 4811
step << Hunter/Druid/Warrior
    #completewith AmethStart
    +|cRXP_WARN_装备|r |T135145:0|t[橡木法杖]
    .use 15397
    .itemcount 15397,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
    .isQuestTurnedIn 4811
----Start of forced Level 14 Druid Turnin/train----
step << Druid
    #season 0,1
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    .accept 6343 >> 接任务：飞回泰达希尔
    .target 莱尔德
step << Druid
    #optional
    #xprate <1.5
    #loop
    .goto 1439,36.051,44.757,0
    .goto 1439,36.280,50.071,0
    .goto 1439,35.275,53.464,0
    .goto 1439,36.051,44.757,60,0
    .goto 1439,35.759,45.455,60,0
    .goto 1439,35.902,47.145,60,0
    .goto 1439,35.977,48.408,60,0
    .goto 1439,36.523,48.554,60,0
    .goto 1439,36.280,50.071,60,0
    .goto 1439,36.091,51.501,60,0
    .goto 1439,37.115,52.368,60,0
    .goto 1439,37.130,53.663,60,0
    .goto 1439,36.740,55.221,60,0
    .goto 1439,35.655,55.872,60,0
    .goto 1439,35.088,55.085,60,0
    .goto 1439,35.275,53.464,60,0
    .goto 1439,36.091,51.501,60,0
    .xp 13+9500 >> 刷怪至 9500+/11400 经验值
step << Druid
    #season 0,1
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >> 飞往泰达希尔
    .target 凯莱斯·月羽
step << Druid
    .goto Teldrassil,56.25,92.44
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .target 尼莎·影歌
step << Druid
    #optional
    #completewith next
    #season 0,1
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯
step << Druid
    .goto Darnassus,35.375,8.405
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 6001 >> 交任务：身心之力
    .accept 6121 >> 接任务：新的课程
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
step << Druid
    #optional
    #season 0,1
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .accept 6121 >> 接任务：新的课程
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
    .isQuestTurnedIn 6001
    .zoneskip Darnassus,1
step << Druid
    #optional
    #season 0,1
	#completewith next
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
step << Druid
    #season 0,1
    .goto Moonglade,56.21,30.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 6121 >> 交任务：新的课程
    .accept 6122 >> 接任务：毒水之源
    .target 德迪利特·星焰
step << Druid
    #season 0,1
    #optional
    #completewith AmethStart
    .hs >> 炉石回黑海岸
    .zoneskip Darkshore
----End of forced Level 14 Druid Turnin/train----
----End of Early Red Crystal turnin Section (NE for xp, Hunters/Druids for staff)/Druid bear q final if not done earlier----
step << Druid
    #season 0,1
    #optional
    #completewith AmethStart
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .subzoneskip 447
----Start of alternate section if early Red Crystal turnin----
step << NightElf/Hunter/Druid/Warrior
    #xprate <1.5 --<< !NightElf/Hunter
    #completewith EarlyBlackwood
    #optional
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isOnQuest 1002
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #loop
    #season 0,1
    #label EarlyBlackwood
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>击杀|cRXP_ENEMY_黑木探路者|r和|cRXP_ENEMY_黑木风语者|r
    .complete 985,1 -- Blackwood Pathfinder (8)
    .mob +黑木探路者
    .complete 985,2 -- Blackwood Windtalker (5)
    .mob +黑木风语者
    .isQuestTurnedIn 4811
step
    #optional
    #label HCHunterStart --hidden step for #include
step << NightElf/Hunter/Druid/Warrior
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith EarlyTurtleStart
    >>击杀|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎
    .subzoneskip 447
    .isOnQuest 1002
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #season 0,1
    #completewith Anaya
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，如果杀得不够快，它们会施放 |r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
    .isQuestTurnedIn 4811
    .subzoneskip 447
step << NightElf/Hunter/Druid/Warrior
    #optional
    #season 0,1
    #label EarlyTurtleStart
    .goto 1439,37.105,62.167
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >> 接任务：搁浅的海龟
    .isQuestTurnedIn 4811
step
    #optional
    #season 0,1
    #label EarlyAmethStart
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >> 接任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
    .isQuestTurnedIn 4811
    .xp >17,1
----End of alternate section if early Red Crystal turnin----
----Start of small south loop for ERA and SoD Warrior/Rogue/Priest----
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith AmethStart
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isQuestTurnedIn 1001
    .isQuestAvailable 4811
step
    #season 0,1
    #loop
    .goto 1439,46.918,48.630,0
    .goto 1439,45.338,54.337,0
    .goto 1439,45.108,49.184,0
    .goto 1439,45.322,44.756,0
    .goto 1439,46.918,48.630,60,0
    .goto 1439,46.233,49.578,60,0
    .goto 1439,46.110,50.828,60,0
    .goto 1439,45.766,51.560,60,0
    .goto 1439,45.652,52.729,60,0
    .goto 1439,45.338,54.337,60,0
    .goto 1439,44.817,53.601,60,0
    .goto 1439,44.398,52.137,60,0
    .goto 1439,44.424,50.766,60,0
    .goto 1439,45.090,50.415,60,0
    .goto 1439,45.108,49.184,60,0
    .goto 1439,44.578,48.547,60,0
    .goto 1439,44.311,47.903,60,0
    .goto 1439,43.577,46.772,60,0
    .goto 1439,42.237,46.108,60,0
    .goto 1439,42.715,45.372,60,0
    .goto 1439,43.101,44.400,60,0
    .goto 1439,45.322,44.756,60,0
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_提升至 10 点|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #sticky
    #optional
    #label Anaya
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_WARN_注意，她的刷新时间是 7 到 8 分钟，在亚米萨兰有 4 个不同刷新点|r
    >>|cRXP_WARN_如果找不到她，并想稍后再试，可以跳过此步骤；之后可能需要多刷一些怪|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
    .solo
step
    #sticky
    #optional
    #label Anaya
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_WARN_注意，她的刷新时间是 7 到 8 分钟，在亚米萨兰有 4 个不同刷新点|r
    >>|cRXP_WARN_如果找不到她，可以与附近的人组队。请在综合频道（/1） 中询问是否有其他玩家也在寻找她|r
    >>|cRXP_WARN_如果找不到她，并想稍后再试，可以跳过此步骤；之后可能需要多刷一些怪|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
    .group
step
    #season 0,1
    #sticky
    #label Relics
    .goto 1439,42.670,57.390,0
    .goto 1439,41.986,62.462,0
    .goto 1439,44.072,60.507,0
    .waypoint 1439,42.670,57.390,55,0
    .waypoint 1439,41.708,57.888,55,0
    .waypoint 1439,41.597,59.765,55,0
    .waypoint 1439,42.058,61.199,55,0
    .waypoint 1439,41.986,62.462,55,0
    .waypoint 1439,42.773,63.420,55,0
    .waypoint 1439,43.253,63.287,55,0
    .waypoint 1439,43.945,62.188,55,0
    .waypoint 1439,44.072,60.507,55,0
    .waypoint 1439,43.410,59.784,55,0
    .waypoint 1439,43.787,58.959,55,0
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r、|cRXP_ENEMY_挣扎的贵族|r和|cRXP_ENEMY_哀嚎的贵族|r，拾取|cRXP_LOOT_上层精灵的遗物|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
    .mob 哀嚎的贵族
    .isOnQuest 958
step
    #season 0,1
    #label AmethStart
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >> 接任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
    .isQuestAvailable 4811
    .xp >17,1
step
    #season 0,1
    .goto 1439,42.652,63.145
    >>点击|cRXP_PICK_亚米萨兰的毁灭|r（石板）
    .complete 953,2 --Read The Fall of Ameth'Aran (1)
    .isOnQuest 953
step << !sod/Warrior/Rogue/Priest
    .goto 1439,42.373,61.815
    >>点击|cRXP_PICK_上古之火|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
    .isOnQuest 957
step
    #season 0,1
    #label TheLay
    .goto Darkshore,43.30,58.70
    >>点击|cRXP_PICK_亚米萨兰的衰落|r（石板）
    .complete 953,1 --Read The Lay of Ameth'Aran (1)
    .isOnQuest 953
step
    #optional
    #requires Relics
--XXREQ Placeholder invis step until multiple requires per step
step
    #optional
    #requires Anaya
--XXREQ Placeholder invis step until multiple requires per step
step
    #xprate <1.59
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .turnin 953 >> 交任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
step
    #optional
    #label HCHunterEndTwo --hidden step for #include
step << !sod/Warrior/Rogue
    #optional
    #completewith FurbolgGrind
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith FurbolgGrind
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002
step
    #optional
    #completewith FurbolgGrind
    #season 0,1
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，如果杀得不够快，它们会施放 |r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step
    #label LateTurtleStart
    .goto 1439,37.105,62.167
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >> 接任务：搁浅的海龟
step
    #loop
    #label FurbolgGrind
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>击杀|cRXP_ENEMY_黑木探路者|r和|cRXP_ENEMY_黑木风语者|r
    .complete 985,1 -- Blackwood Pathfinder (8)
    .mob +黑木探路者
    .complete 985,2 -- Blackwood Windtalker (5)
    .mob +黑木风语者
step
    #xprate <1.5
    #optional
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>在营地中刷|cRXP_ENEMY_熊怪|r。|cRXP_WARN_这里是怪物快速刷新区|r，死亡怪物达到一定数量后，游戏会强制刷新。因此这里是当前等级|cRXP_WARN_非常高效的刷怪地点|r（每小时经验收益堪比做任务）
    >>|cRXP_WARN_完成这段刷怪后，你之后就能顺畅做完整个黑海岸任务线，不必再费心处理高等级怪物|r
    >>注意，|cRXP_ENEMY_黑木探路者|r会使用 |T132152:0|t[痛击]，一次最多能打到你 3 次
    >>|cRXP_ENEMY_黑木风语者|r会施放 |T136022:0|t[阵风]，这是一个近战范围昏迷技能。|cRXP_WARN_施法时请离开近战范围，以免被击晕|r
    .xp 15+11875 >> 刷怪至 11875+/14400 经验值
    .mob 黑木探路者
    .mob 黑木风语者
    .itemcount 5382,<1 --Anaya's Pendant (<1)
step
    #xprate <1.5
    #optional
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>在营地中刷|cRXP_ENEMY_熊怪|r。|cRXP_WARN_这里是怪物快速刷新区|r，死亡怪物达到一定数量后，游戏会强制刷新。因此这里是当前等级|cRXP_WARN_非常高效的刷怪地点|r（每小时经验收益堪比做任务）
    >>|cRXP_WARN_完成这段刷怪后，你之后就能顺畅做完整个黑海岸任务线，不必再费心处理高等级怪物|r
    >>注意，|cRXP_ENEMY_黑木探路者|r会使用 |T132152:0|t[痛击]，一次最多能打到你 3 次
    >>|cRXP_ENEMY_黑木风语者|r会施放 |T136022:0|t[阵风]，这是一个近战范围昏迷技能。|cRXP_WARN_施法时请离开近战范围，以免被击晕|r
    .xp 15+11000 >> 刷怪至 11000+/14400 经验值
    .mob 黑木探路者
    .mob 黑木风语者
    .itemcount 5382,1 --Anaya's Pendant (1)
step
    #xprate 1.49-1.59
    #optional
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>在营地中刷|cRXP_ENEMY_熊怪|r。|cRXP_WARN_这里是怪物快速刷新区|r，死亡怪物达到一定数量后，游戏会强制刷新。因此这里是当前等级|cRXP_WARN_非常高效的刷怪地点|r（每小时经验收益堪比做任务）
    >>|cRXP_WARN_完成这段刷怪后，你之后就能顺畅做完整个黑海岸任务线，不必再费心处理高等级怪物|r
    >>注意，|cRXP_ENEMY_黑木探路者|r会使用 |T132152:0|t[痛击]，一次最多能打到你 3 次
    >>|cRXP_ENEMY_黑木风语者|r会施放 |T136022:0|t[阵风]，这是一个近战范围昏迷技能。|cRXP_WARN_施法时请离开近战范围，以免被击晕|r
    .xp 15+600 >> 刷怪至 600+/14400 经验值
    .mob 黑木探路者
    .mob 黑木风语者
    .itemcount 5382,<1 --Anaya's Pendant (<1)
step
    #xprate 1.49-1.59
    #optional
    #loop
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    >>在营地中刷|cRXP_ENEMY_熊怪|r。|cRXP_WARN_这里是怪物快速刷新区|r，死亡怪物达到一定数量后，游戏会强制刷新。因此这里是当前等级|cRXP_WARN_非常高效的刷怪地点|r（每小时经验收益堪比做任务）
    >>|cRXP_WARN_完成这段刷怪后，你之后就能顺畅做完整个黑海岸任务线，不必再费心处理高等级怪物|r
    >>注意，|cRXP_ENEMY_黑木探路者|r会使用 |T132152:0|t[痛击]，一次最多能打到你 3 次
    >>|cRXP_ENEMY_黑木风语者|r会施放 |T136022:0|t[阵风]，这是一个近战范围昏迷技能。|cRXP_WARN_施法时请离开近战范围，以免被击晕|r
    .xp 14+12210 >> 刷怪至 12210+/12900 经验值
    .mob 黑木探路者
    .mob 黑木风语者
    .itemcount 5382,1 --Anaya's Pendant (1)
step
    #optional
    #completewith FurbolgGrindEnd
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .isQuestAvailable 2178
step
    #optional
    #completewith FurbolgGrindEnd
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isOnQuest 1002
step
    #label FurbolgGrindEnd
    #completewith TOTH
    #optional
    .goto 1439,36.701,45.122
    .subzone 442 >> 返回奥伯丁
    .isOnQuest 4722
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >> 交任务：搁浅的海龟
    .turnin 4723 >> 交任务：搁浅的海洋生物
    .target 温尼斯·布莱葛
    .isOnQuest 4722,4723
step
    #xprate >1.49
    #optional << NightElf !Hunter
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >> 交任务：搁浅的海龟
    .turnin 4723 >> 交任务：搁浅的海洋生物 << Warrior sod
    .target 温尼斯·布莱葛
step
    #season 0,1
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >> 接任务：海中的水果
    .target 古博·布拉普
step
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 回到码头去找|cRXP_FRIENDLY_塞瑞利恩·白爪|r
step
    #optional
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    >>|cRXP_WARN_如果刚有人交完任务，你可能需要等他的剧情对话结束|r
    .turnin 963 >> 交任务：永志不渝
    .target 塞瑞利恩·白爪
    .isQuestComplete 963
step
    #season 0,1
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >> 交任务：红色水晶
    .accept 4812 >> 接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isOnQuest 4811
step
    #optional
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .accept 4812 >>接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isQuestTurnedIn 4811
step
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4812 >> 交任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
    .isQuestComplete 4812
step
    #season 0,1
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r |T134865:0|t[空水管]|cRXP_WARN_在奥伯丁的月亮井取水|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
step
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >> 交任务：清除疫病
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestComplete 2138
step
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestTurnedIn 2138
step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 985 >> 交任务：熊怪的威胁
    .accept 986 >> 接任务：丢失的主人 << !sod
    .target 特伦希斯
step
    #optional
    #completewith next
    .goto 1439,39.280,43.121,6,0
    .goto 1439,39.162,43.194,6 >> 上楼
step
    .goto 1439,39.043,43.555
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_哨兵艾莉萨·星风|r交谈
    .accept 965 >> 接任务：奥萨拉克斯之塔
    .target 哨兵艾莉萨·星风
step << !Hunter
    #optional
    #completewith Level10CookEnd
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor 6301 >>|cRXP_BUY_向他购买|r |T134059:0|t[甜香料]|cRXP_BUY_，直到你持有的|r |T134059:0|t[甜香料]|cRXP_BUY_数量等于或超过当前持有的|r |T132832:0|t[小蛋]|cRXP_BUY_数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target 高尔博德·钢手
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >> 交任务：深不可测的海洋
    .target 高尔博德·钢手
    .isQuestComplete 982
step
    #label Level10CookEnd
    .goto 1439,37.511,41.670
    >>|cRXP_WARN_前往地上的|cRXP_PICK_营火|r|r
    +|cRXP_WARN_开始用|r |T133971:0|t[烹饪]制作 |T132834:0|t[草药烘蛋]|cRXP_WARN_，重复制作直到你的|r |T133971:0|t[烹饪]|cRXP_WARN_至少达到10点|r
    >>|cRXP_WARN_继续提升|r |T133971:0|t[烹饪]|cRXP_WARN_直到用完|r |T132832:0|t[小蛋] << !sod
    >>|cRXP_WARN_暮色森林稍后有一个任务要求|r |T133971:0|t[烹饪]|cRXP_WARN_达到 50 点或更高。你也可以在稍后乘船时烹饪|r << !sod
    .skill cooking,50,1
    .itemcount 6889,1 -- Small Egg (1+)
step
    #optional
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
step << !sod/Rogue
    #label TOTH
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 958 >> 交任务：上层精灵的工具 << !sod
    .turnin 4762 >> 交任务：壁泉河 << sod
    .accept 4763 >> 接任务：黑木熊怪的堕落 << sod
    .target 桑迪斯·织风
    .isQuestComplete 958
----End of small south loop for ERA and SoD Warrior/Rogue/Priest----
----Start of NE >1.49x catchup (everyone 1x) Final boat section----
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith next
    +|cRXP_WARN_按 Esc 键，进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选"启用互动按键"，并将"与目标互动"选项绑定至一个快捷键|r
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,38.213,28.754
--  .goto 1439,38.234,28.796
    >>|cRXP_WARN_==注意呼吸条（氧气值）==|r
    >>|cRXP_WARN_从水下潜至船尾外侧|r
    >>|cRXP_WARN_在箭头位置，按下"与目标互动"快捷键来在船体外部拾取|cRXP_LOOT_银色清晨号的保险箱|r|r
    >>|cRXP_WARN_如果不想这么做，也可以潜入船内底层去拾取|cRXP_LOOT_银色清晨号的保险箱|r|r
    .complete 982,1 --Silver Dawning's Lockbox (1)
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    #label MistVeil
    .goto 1439,39.581,27.487
--  .goto 1439,39.629,27.462
    >>|cRXP_WARN_==注意呼吸条（氧气值）==|r
    >>|cRXP_WARN_从水下潜至船尾外侧|r
    >>|cRXP_WARN_在箭头位置，按下"与目标互动"快捷键来在船体外部拾取|cRXP_LOOT_迷雾之纱号的保险箱|r|r
    >>|cRXP_WARN_如果不想这么做，就潜到船底层，然后拿里面的|cRXP_LOOT_迷雾之纱号的保险箱|r|r
    .complete 982,2 --Mist Veil Lockbox (1)
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物
    .isOnQuest 982
----End of NE >1.49x catchup (everyone 1x) Final boat section----
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith BoatSeaCreature
    .goto 1439,44.190,33.697,0
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isOnQuest 1002
step
    #season 0,1
    #optional
    #completewith BoatSeaCreature
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
step
    #season 0,1
    #optional
    #completewith BoatSeaCreature
    >>击杀|cRXP_ENEMY_月夜枭兽|r，拾取 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这些小蛋稍后用于将|r |T133971:0|t[烹饪]|cRXP_WARN_练到 50 点|r
    >>|cRXP_WARN_现在不用特意刷小蛋；记得留好这些蛋，并估算烹饪达到50点还需要提升多少技能点|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob 小月夜枭兽
    .mob 狂暴的月夜枭兽
    .mob 月夜枭兽圣者
    .mob 月夜枭兽
    .subzoneskip 446 --BashalAran
    .subzoneskip 452 --Mists Edge
--   .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 10-50
step
    #season 0,1
    .goto 1439,47.314,48.676
    >>点击|cRXP_PICK_神秘的红色水晶|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_狂暴的月夜枭兽|r：|cRXP_PICK_神秘的红色水晶|r西侧有2组，每组2只；彼此靠近的成对枭兽会联动仇恨|r
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨
step
    #season 0,1 << !Warrior !Rogue
    #label BashalEnd
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957 >> 交任务：巴莎兰
    .isOnQuest 957
    .target 阿斯特利安
step
    #optional
    #season 0,1 << !Warrior !Rogue
    #completewith CrabTurtle
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，如果杀得不够快，它们会施放 |r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step
    #label BoatSeaCreature
    #season 0,1
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >> 接任务：搁浅的海洋生物
step
    #optional
    #season 0,1 << !Warrior !Rogue
    #completewith CrabTurtle
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r和|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，|r|cRXP_ENEMY_森林陆行鸟雏鸟|r会 |T132307:0|t[逃跑]|cRXP_WARN_（生命值低于30%时）|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .mob 森林陆行鸟
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith CrabTurtle
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002
step
    #label CrabTurtle
    #season 0,1 << !Warrior !Rogue
    .goto Darkshore,44.18,20.60
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4725 >> 接任务：搁浅的海龟
step
    #optional
    #completewith next
    #season 0,1 << !Warrior !Rogue
    .goto 1439,45.004,21.344,0
    .goto 1439,48.013,21.409,0
    .goto 1439,49.680,22.468,0
    .goto 1439,45.004,21.344,55,0
    .goto 1439,45.468,20.336,55,0
    .goto 1439,47.356,20.559,55,0
    .goto 1439,48.013,21.409,55,0
    .goto 1439,48.612,20.745,55,0
    .goto 1439,49.680,22.468,55,0
    .goto 1439,49.313,24.271,55,0
    >>击杀|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    >>|cRXP_WARN_可以考虑跳过一部分17级的|r|cRXP_ENEMY_暗礁蟹|r|cRXP_WARN_，前提是当前掉落情况不错。|r|cRXP_WARN_你现在不必完成此任务|r
    >>注意它们可以施放 |T132155:0|t[撕裂肌肉]——瞬发攻击，造成 30-55 点伤害
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹
step
    .goto Darkshore,50.81,25.50
    #season 0,1 << !Warrior !Rogue
    >>|cRXP_WARN_使用|r |T134865:0|t[空的水样试管]|cRXP_WARN_在壁泉河下游取样|r
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350
step
	#xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith next
    .goto 1439,51.118,23.670,20,0
    .goto 1439,51.288,24.554,12 >>沿着坡道向上前往|cRXP_PICK_传声盒 323 号|r
    .isQuestComplete 1002
step
    #optional
	#xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,51.288,24.554
    >>点击地面上的|cRXP_PICK_传声盒323号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
    .isQuestComplete 1002
step
	#xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,51.288,24.554
    >>点击地面上的|cRXP_PICK_传声盒323号|r
    .accept 1003 >> 接任务：传声盒525号
    .isQuestTurnedIn 1002
----Start of Hunter/Druid 1x early Althalaxx section (for money+xp)----
step << Hunter/Druid
	#xprate <1.5 << Hunter/Druid
    #optional
    #completewith Tower1
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，如果杀得不够快，它们会施放 |r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step << Hunter/Druid
	#xprate <1.5 << Hunter/Druid
    #optional
    #completewith Tower1
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟
step << Hunter/Druid
#xprate <1.5 << Hunter/Druid
    #optional
    #completewith Tower1
    >>击杀|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎
    .isOnQuest 1002
step << Hunter/Druid
#xprate <1.5 << Hunter/Druid
    #optional
    #completewith Tower1
    .goto 1439,51.118,23.670,20,0
    .goto 1439,51.490,24.368,30,0
    .goto 1439,54.973,24.885,15 >>前去找|cRXP_FRIENDLY_巴苏尔·影击|r
    .isQuestAvailable 1002 << !NightElf/Hunter
step << Hunter/Druid
#xprate <1.5 << Hunter/Druid
    #label Tower1
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >> 交任务：奥萨拉克斯之塔
    .accept 966 >> 接任务：奥萨拉克斯之塔
    .target 巴苏尔·影击
step << Hunter/Druid
#xprate <1.5 << Hunter/Druid
    #loop
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .goto 1439,55.231,26.508,50,0
    .goto 1439,55.369,27.025,50,0
    .goto 1439,55.763,26.695,50,0
    .goto 1439,55.815,26.972,50,0
    .goto 1439,56.194,27.071,50,0
    .goto 1439,56.790,27.621,50,0
    .goto 1439,57.278,26.311,50,0
    .goto 1439,57.046,26.234,50,0
    .goto 1439,56.544,26.598,50,0
    .goto 1439,56.047,26.586,50,0
    .goto 1439,55.743,25.915,50,0
    >>击杀|cRXP_ENEMY_暗滩狂热者|r，拾取|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者
step << Hunter/Druid
#xprate <1.5 << Hunter/Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >> 交任务：奥萨拉克斯之塔
    .accept 967 >> 接任务：奥萨拉克斯之塔
    .target 巴苏尔·影击
step << Hunter/Druid
#xprate <1.5 << Hunter/Druid
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,53.629,26.054,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,48.022,27.199,60,0
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟
----End of Hunter/Druid 1x and SoD Warrior early Althalaxx section (for money+xp)----
step
    #optional
    #completewith CliffCave
    #season 0,1 << !Warrior !Rogue
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，如果杀得不够快，它们会施放 |r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith CliffCave
    >>击杀|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎
    .isOnQuest 1002
step
    #optional
    #season 0,1 << !Warrior !Rogue
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,53.629,26.054,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,48.022,27.199,60,0
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟
    .itemcount 5469,3 --Strider Meat (3+)
----XX Start from West Side if 3+
step
    #season 0,1 << !Warrior !Rogue
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,48.022,27.199,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.629,26.054,60,0
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob 森林陆行鸟
step
    #optional
	#xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,51.288,24.554
    >>点击地面上的|cRXP_PICK_传声盒323号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
    .isQuestComplete 1002
    .subzoneskip 456,1 --Only turnin if you're nearby (Cliffspring River)
step
    #xprate <1.5
    #optional
    .goto 1439,51.288,24.554
    >>点击地面上的|cRXP_PICK_传声盒323号|r
    .accept 1003 >>接任务：传声盒525号
    .isQuestTurnedIn 1002
    .subzoneskip 456,1
step
    #optional
    #completewith next
    #season 0,1 << !Warrior !Rogue
    #label CliffCave
    .goto 1439,54.934,32.721,20,0
    .goto 1439,55.108,33.600,40 >> 前往壁泉河洞穴
step << Druid
    .goto Darkshore,54.99,33.41
    #season 0,1
    >>|cRXP_WARN_使用|r |T134776:0|t[空的峭壁之泉取样器]|cRXP_WARN_在壁泉河洞穴入口处的水中取样|r
    .complete 6122,1 --Filled Cliffspring Falls Sampler (1)
step
    #label CaveMushrooms
    .goto Darkshore,55.45,36.23,12,0
    .goto Darkshore,55.70,36.30,12,0
    .goto Darkshore,55.89,35.40,12,0
    #season 0,1 << !Warrior !Rogue
    >>拾取地面上的|cRXP_LOOT_粗柄蘑菇|r和|cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_待在上层区域。如果顶部尽头没有|cRXP_LOOT_毒帽蘑菇|r，就跳下去从下方南侧房间获取一个|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_雷鳞御浪者|r会施放 |r |T135836:0|t[水流喷射]|cRXP_WARN_（远程瞬发：对附近敌人造成伤害并击退），别站在会被打下洞穴上层边缘的位置|r
    .complete 947,1 --Scaber Stalk (5)
    .goto Darkshore,55.04,33.34,8,0
    .goto Darkshore,55.28,34.00,8,0
    .goto Darkshore,55.09,34.67,8,0
    .goto Darkshore,55.30,35.58,8,0
    .goto Darkshore,55.04,33.34,8,0
    .goto Darkshore,55.28,34.00,8,0
    .goto Darkshore,55.09,34.67,8,0
    .goto Darkshore,55.30,35.58,8,0
    .goto Darkshore,55.04,33.34
    .complete 947,2 --Death Cap (1)
    .goto Darkshore,55.38,36.34
step << NightElf !Druid
    #softcore
    #optional
    #completewith CavetoAuber
    #season 0,1
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target 灵魂医者
step << skip --logout skip
    #hardcore << NightElf !Druid
    #optional
    #label MushroomLS
    #completewith CavetoAuber
    #season 0,1
    .goto 1439,54.964,34.536
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_跳到洞穴顶层的岩石上，调整角色位置直到看起来像在漂浮，然后登出再登录，使用卡登出捷径|r
step
    #hardcore << NightElf !Druid
    #completewith CavetoAuber
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心，它们在生命值低于30%时会|r |T132307:0|t[逃跑]|cRXP_WARN_。|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
    .isQuestAvailable 2178
step
    #hardcore << NightElf !Druid
    #xprate <1.5 --<< !NightElf/Hunter
    #completewith CavetoAuber
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .isOnQuest 1002
step
    #optional
    #label CavetoAuber
    #completewith CliffspringEnd
    .subzone 442 >> 前往奥伯丁
step
    #label CliffspringEnd
    #season 0,1
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4762 >> 交任务：壁泉河
    .accept 4763 >> 接任务：黑木熊怪的堕落
    .target 桑迪斯·织风
step
    .goto Darkshore,37.70,40.70
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >> 接任务：炖陆行鸟
    .turnin 2178 >> 交任务：炖陆行鸟
    .turnin 6122 >> 交任务：毒水之源 << Druid
    .accept 6123 >> 接任务：收集解药 << Druid
    .target 奥兰达利亚·夜歌
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
    .isQuestAvailable 2178 << Druid
step << Druid
    #optional
    #season 0,1
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .turnin 6122 >> 交任务：毒水之源
    .accept 6123 >> 接任务：收集解药
    .target 奥兰达利亚·夜歌
step << !NightElf
    #xprate <1.5
    #optional
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >> 接任务：健忘的勘察员
    .target 考古学家霍莉
    .isQuestComplete 2138
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >> 交任务：深不可测的海洋
    .target 高尔博德·钢手
step << !NightElf
    #season 0,1
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >> 接任务：健忘的勘察员
    .target 考古学家霍莉
step
    .goto 1439,38.843,43.416
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >> 交任务：清除疫病
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestComplete 2138
step
    .goto 1439,38.843,43.416
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2139 >> 接任务：萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
    .isQuestTurnedIn 2138
step
    .goto Darkshore,37.70,43.39
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    >>|cRXP_WARN_选择|r |T135641:0|t[曲木匕首]|cRXP_WARN_作为奖励；记得留一把|r |T135641:0|t[匕首]|cRXP_WARN_供之后的|r |T132290:0|t[毒药]|cRXP_WARN_任务使用|r << Rogue
    .turnin 4813 >> 交任务：水晶中的碎骨
    .target 哨兵戈琳达·纳希恩
step
    .goto Darkshore,37.78,44.06
    #season 0,1
    >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗]|cRXP_WARN_在奥伯丁的月亮井取水|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .use 12346
    .isOnQuest 4763
step
    .goto 1439,37.322,43.640
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .turnin 947 >> 交任务：洞中的蘑菇
    .accept 948 >> 接任务：安努
    .target 巴瑞萨斯·月影
step
    .goto Darkshore,37.21,44.22
    #season 0,1
    >>点击|cRXP_PICK_通缉告示|r
    .accept 4740 >> 接任务：通缉：莫克迪普！
step << NightElf !Druid
    .goto 1439,36.767,44.285
    #season 0,1
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r交谈
    .accept 6343 >> 接任务：飞回泰达希尔
    .isQuestAvailable 6343
    .target 莱尔德
step
    #optional
    .goto Darkshore,36.096,44.931
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >> 交任务：海中的水果
    .target 古博·布拉普
    .isQuestComplete 1138
step
    #optional
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4723 >> 交任务：搁浅的海洋生物
    .turnin 4725 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛
    .isOnQuest 4723
step
    #optional
    #season 0,1
    #label End
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4725 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛
----Start of Druid Quest section----
step << Druid
    #optional
    #season 0,1
    .goto 1439,39.899,54.745,0
    .goto 1439,40.181,56.229,0
    .goto 1439,39.267,53.092,50,0
    .goto 1439,39.754,53.444,50,0
    .goto 1439,40.234,54.325,50,0
    .goto 1439,39.899,54.745,50,0
    .goto 1439,40.181,56.229,50,0
    .goto 1439,39.388,56.671,50,0
    .goto 1439,39.191,56.382,50,0
    .goto 1439,39.957,55.300,50,0
    .goto 1439,39.332,54.079,50,0
    .xp 16 >> 去刷怪升到 16 级
    .mob 黑木探路者
    .mob 黑木风语者
step << Druid
    #optional
    #season 0,1
    #completewith DruidLesson
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >> 飞往泰达希尔
    .target 凯莱斯·月羽
step << Druid
    #optional
    #season 0,1
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·影歌|r交谈
    .turnin 6343 >> 交任务：飞回泰达希尔
    .target 尼莎·影歌
step << Druid
    #optional
    #season 0,1
    #label DruidLesson
    #completewith next
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯
step << Druid
    .goto Darnassus,35.375,8.405
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .accept 26 >> 接任务：必修的课程
    .trainer >> 学习职业技能
    .target 玛斯雷·驭熊者
step << Druid
    #optional
    #season 0,1
    #completewith next
    .abandon 729 >> 放弃任务[健忘的勘察员]，以便接受任务[黑海岸的麻烦事]
step << Druid
    .goto Teldrassil,23.70,64.51
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .accept 730 >> 接任务：黑海岸的麻烦事
    .target 首席考古学家杜瑟·灰须
step << Druid
    #optional
	#completewith TotL
    #season 0,1
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
step << Druid
    #season 0,1
    .goto Moonglade,56.1,30.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 26 >> 交任务：必修的课程
    .accept 29 >> 接任务：湖中试炼
    .target 德迪利特·星焰
step << Druid
    #season 0,1
    .goto Moonglade,52.6,51.6
    >>游入月神湖
    >>打开一个|cRXP_PICK_神殿灵珠容器|r，获取 |T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_它可能在水下不同位置刷新|r
    .collect 15877,1,29,1 -- Shrine Bauble (1)
step << Druid
    #optional
    #season 0,1
    #completewith next
    .cast 18960 >> 施放传送：月光林地
    .itemcount 15877,1 -- Shrine Bauble (1)
step << Druid
    #season 0,1
    .goto Moonglade,36.026,41.374
    >>|cRXP_WARN_使用|r |T134125:0|t[神殿灵珠]|cRXP_WARN_，地点在雷姆洛斯神殿的树旁|r
    .complete 29,1 --Complete the Trial of the Lake.
    .use 15877
step << Druid
    #label TotL
    #season 0,1
    .goto Moonglade,36.517,40.104
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔加里|r交谈
    .turnin 29 >> 交任务：湖中试炼
    .accept 272 >> 接任务：海狮试炼
    .target 塔加里
step << Druid
    #optional
    #season 0,1
    .hs >> 炉石回黑海岸
    .zoneskip Darkshore
----End of Druid Quest section----
]])
----End of Darkshore Part 1----
----Start of Darkshore Part 2----
----Hunters stay in Darkshore/Ashenvale and Grind, 2x skips Redridge----
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#tbc
#season 0,1
#version 1
<< Alliance
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 16-19 Darkshore
#next 19-20 Redridge;20-21 Darkshore/Ashenvale << !Hunter
#next 19-21 Darkshore/Ashenvale << Hunter
#displayname 16-19 黑海岸
step << NightElf !Druid
    #optional
    #completewith PortalDarn
    #season 0,1
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯莱斯·月羽|r 对话
    .fly Teldrassil >> 飞往泰达希尔
    .target 凯莱斯·月羽
    .zoneskip Teldrassil
step << NightElf !Druid
    .goto Teldrassil,56.25,92.44
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼莎·影歌|r 对话
    .turnin 6343 >> 交任务: 飞回泰达希尔
    .target 尼莎·影歌
step << NightElf !Druid
    #completewith next
    #season 0,1
    #label PortalDarn
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯
step << NightElf Warrior
    .goto Darnassus,58.72,34.92
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿雷亚斯塔·刃歌|r 对话
    .trainer >> 学习职业技能
    .target 阿雷亚斯塔·刃歌
step << NightElf Warrior
    .goto Darnassus,57.56,46.72
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊琳尼雅·月火|r 对话
    .skipgossip 11866,1
    .train 2567 >> 学习 [投掷]
    .target 伊琳尼雅·月火
step << NightElf Hunter
    #completewith start
    #season 0,1
    .goto Darnassus,40.38,8.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_祖卡斯特|r 对话
    .trainer >> 学习职业技能
    .target 祖卡斯特
step << NightElf Hunter
    #completewith start
    #season 0,1
    #label RecruveReinforced
    .goto Darnassus,63.27,66.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰德瑞亚|r交谈
    >>|cRXP_WARN_买一把|r |T135489:0|t[重型弯弓]|cRXP_WARN_如果买得起。如果买不起，就买一把|r |T135490:0|t[强化弓]
    >>|cRXP_WARN_补足|r |T132382:0|t[锋利的箭]
    .collect 3027,1
    .target 兰德瑞亚
    .money <0.3812
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.50
step << Hunter
    #requires RecruveReinforced
    #season 0,1
    #completewith next
    +|cRXP_WARN_装备|r |T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.19
    .xp <20,1
step << Hunter
    #requires RecruveReinforced
    #season 0,1
    #completewith next
    +|cRXP_WARN_装备|r |T135490:0|t[强化弓]
    .use 3026
    .itemcount 3026,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.49
step << NightElf Rogue
    >>进入塞纳里奥区
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞尤娜|r 对话
    .goto Darnassus,31.84,16.69,15,0
    .goto Darnassus,37.00,21.92
    .trainer >> 学习职业技能
    .target 塞尤娜
step << NightElf !Druid
    #optional
    #season 0,1
    #completewith next
    .abandon 729 >> 放弃任务 [健忘的勘察员]，以便接任务 [黑海岸的麻烦事]
step << NightElf !Druid
    .goto Teldrassil,23.70,64.51
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r 对话
    .accept 730 >> 接任务: 黑海岸的麻烦事
    .target 首席考古学家杜瑟·灰须
step << NightElf Priest
    .goto Darnassus,37.90,82.74
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贾德莉亚|r 对话
    .trainer >> 学习职业技能
    .target 贾德莉亚
step << NightElf !Druid
    #label start
    #season 0,1
    .hs >> 炉石回奥伯丁
step
    .goto Darkshore,37.21,44.22
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击 |cRXP_PICK_通缉告示|r
    .accept 4740 >> 接任务: 通缉：莫克迪普！
step << NightElf
    .goto 1439,37.439,41.839
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考古学家霍莉|r 对话
    .turnin 730 >> 交任务: 黑海岸的麻烦事
    .accept 729 >> 接任务: 健忘的勘察员
    .target 考古学家霍莉
    .isOnQuest 730
step << NightElf
    #optional
    .goto 1439,37.439,41.839
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考古学家霍莉|r 对话
    .accept 729 >> 接任务: 健忘的勘察员
    .target 考古学家霍莉
step
    .goto 1439,37.394,40.128
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_桑迪斯·织风|r 对话
    .turnin 4762 >> 交任务: 壁泉河
    .accept 4763 >> 接任务: 黑木熊怪的堕落
    .target 桑迪斯·织风
step
    .goto Darkshore,37.78,44.06
    #season 0,1
    .use 12346 >>|cRXP_WARN_使用|r |T133748:0|t[空的净化碗]|cRXP_WARN_在|r|cRXP_PICK_奥伯丁月亮井|r取水
    .collect 12347,1,4763,1
    .isOnQuest 4763
step
    #season 0,1
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_WARN_注意，她的刷新时间是 7 到 8 分钟，在亚米萨兰有 4 个不同刷新点|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
    .solo
step
    #season 0,1
    .goto 1439,42.017,58.866,0 --NE spawn
    .goto 1439,43.222,59.693,0 --NE spawn
    .goto 1439,43.069,62.448,0 --SE spawn
    .goto 1439,42.489,60.677,0 --Middle spawn
    .waypoint 1439,42.017,58.866,50,0 --NE spawn
    .waypoint 1439,42.311,58.645,50,0
    .waypoint 1439,42.448,58.236,50,0
    .waypoint 1439,43.222,59.693,50,0 --NE spawn
    .waypoint 1439,43.447,60.131,50,0
    .waypoint 1439,43.780,60.275,50,0
    .waypoint 1439,43.069,62.448,50,0 --SE spawn
    .waypoint 1439,43.104,62.563,50,0
    .waypoint 1439,42.794,62.166,50,0
    .waypoint 1439,42.489,60.677,50,0 --Middle spawn
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    >>|cRXP_WARN_注意，她的刷新时间是 7 到 8 分钟，在亚米萨兰有 4 个不同刷新点|r
    >>|cRXP_WARN_如果找不到她，可以与附近的人组队。请在综合频道（/1） 中询问是否有其他玩家也在寻找她|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
    .group
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith CompleteFangs
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002
step
    #season 0,1
    #loop
    .waypoint Darkshore,39.03,67.32,0
    .waypoint Darkshore,42.54,67.76,0
    .waypoint Darkshore,39.99,78.46,0
    .waypoint Darkshore,39.03,67.32,70,0
    .waypoint Darkshore,42.54,67.76,70,0
    .waypoint Darkshore,39.99,78.46,70,0
    >>击杀黑海岸南部的|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，若未能迅速击杀这些熊，它们会施放|r |T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：使所有生命恢复效果降低 50%，持续 10 分钟）|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob 狂暴蓟熊
step << Druid
    #xprate <1.5
    #sticky
    #label earthroot
    >>做任务时顺手收集5个 |T134187:0|t[地根草]|r
    .complete 6123,1 --Earthroot (5)
    .isOnQuest 6123
step << Druid
    #xprate <1.5
    .goto Darkshore,43.4,45.9,90,0
    .goto Darkshore,43.3,49.1,90,0
    .goto Darkshore,42.4,52.6,90,0
    .goto Darkshore,45.7,50.3,90,0
    .goto Darkshore,45.3,53.3
    .goto Darkshore,43.4,45.9,0
    .goto Darkshore,43.3,49.1,0
    .goto Darkshore,42.4,52.6,0
    .goto Darkshore,45.7,50.3,0
    >>在洞穴各处的地面上拾取|cRXP_LOOT_月亮菇|r
    .complete 6123,2
    .isOnQuest 6123
step
    #completewith OnuGrove
    #season 0,1
    .goto 1439,43.555,76.293,80 >> 前往古树之林
step
    #label OnuGrove
    #season 0,1
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安努|r 对话
    .turnin 952 >> 交任务: 古树之林 << NightElf
    .turnin 948 >> 交任务: 安努
    .accept 944 >> 接任务: 主宰之剑
    .target 安努
step
    #completewith MasterG
    #season 0,1
    >>击杀|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>注意它们的 |T132090:0|t[攻击弱点]——背对它们时会触发背刺，造成 20-40 点伤害
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .unitscan 月夜雄虎
    .isOnQuest 986
step
	#xprate <1.5 --<< !NightElf/Hunter
    #completewith MasterG
    #optional
    .goto Darkshore,38.60,80.50,0
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_灰色头皮|r
    >>注意它们的 |T132152:0|t[毁灭]——瞬发攻击，造成 20-40 点伤害并|cRXP_WARN_将你击倒 2 秒|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob 灰斑蓟熊
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,41.390,80.563
    >>点击地面上的 |cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务: 传声盒525号
    .isQuestComplete 1003
step
    #label MasterG
    #season 0,1
    .goto Darkshore,38.54,86.05,100 >> 前往主宰之剑
    .subzoneskip 449
    .isOnQuest 944
step
    #optional
    #completewith TheryluneEnd
    #season 0,1
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取掉落的|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心，|cRXP_ENEMY_暮光暴徒|r会|r |T132343:0|t[缴械]|cRXP_WARN_你，使你缴械6秒|r << Rogue/Paladin/Warrior
    *|cRXP_WARN_小心，|cRXP_ENEMY_暮光信徒|r会施放|r |T135953:0|t[恢复]|cRXP_WARN_，并施放需要3秒的|r |T135915:0|t[治疗术]
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob 暮光信徒
    .mob 暮光暴徒
--  .use 13536
step
    #optional
    #season 0,1
    .goto 1439,38.537,86.050
    >>探索主宰之剑区域
    .complete 944,1 --Enter the Master's Glaive (1)
step
    #optional
    #completewith next
    #season 0,1
    .cast 5809 >> |cRXP_WARN_使用|r |T134715:0|t[占卜之水] |cRXP_WARN_并将其放在地面上|r
    .use 5251
step
    .goto 1439,38.537,86.050
    #season 0,1
    >>|cRXP_WARN_点击地上的 |cRXP_PICK_占卜之碗|r|r
    .turnin 944 >> 交任务: 主宰之剑
    .accept 949 >> 接任务: 暮光之锤的营地
    .use 5251
step
    .goto 1439,38.537,86.050
    #season 0,1
    >>点击北侧基座上的 |cRXP_PICK_暮光之书|r
    .turnin 949 >> 交任务: 暮光之锤的营地
    .accept 950 >> 接任务: 向安努回复
step
    .goto 1439,38.660,87.305
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟瑞露尼|r 交谈. 这将开启护送任务
    >>|cRXP_WARN_如果她不在, 就跳过这一步|r
    .accept 945 >> 接任务: 护送瑟瑞露尼
    .target 瑟瑞露尼
step
    #label TheryluneEnd
    #season 0,1
    .goto Darkshore,40.51,87.09
    >>|cRXP_WARN_护送|cRXP_FRIENDLY_瑟瑞露尼|r离开主宰之剑|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .isOnQuest 945
step
    #optional
    #season 0,1
    #sticky
    .isQuestTurnedIn 949
    .destroy 5251 >> 从背包中删除 |T134715:0|t[占卜之水]，因为之后不再需要
step
    #optional
    #season 0,1
    #completewith TurtleSouth
    #completewith prospector << Hunter
    >>击杀|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>注意它们的 |T132090:0|t[攻击弱点]——背对它们时触发背刺，造成 20-40 点伤害
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .isOnQuest 986
    .unitscan 月夜雄虎
step
	#xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto Darkshore,41.44,86.06,50,0
    .goto Darkshore,41.77,84.60,50,0
    .goto Darkshore,42.94,82.25,50,0
    .goto Darkshore,43.59,80.02,50,0
    .goto Darkshore,39.74,80.43,50,0
    .goto Darkshore,38.00,83.55
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_灰色头皮|r
    >>注意它们的 |T132152:0|t[毁灭]——瞬发攻击，造成 20-40 点伤害并|cRXP_WARN_将你击倒 2 秒|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob 灰斑蓟熊
step
    #xprate <1.5 --<< !NightElf/Hunter
    #label LastBuzz
    .goto 1439,41.390,80.563
    >>点击地面上的 |cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务: 传声盒525号
    .isQuestComplete 1003
step
    .goto 1439,43.555,76.293
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安努|r 对话
    .turnin 950 >> 交任务: 向安努回复
    .timer 11.5,安努的剧情对话
--  .timer 14,Return to Onu RP
    .accept 951 >> 接任务: 玛塞斯特拉遗物
    .target 安努
step << Hunter
    #optional
    #season 0,1
    .goto Darkshore,38.54,86.05
    .xp 17 >> 去刷怪升到 17 级
step << Hunter
    #sticky
    #season 0,1
    #label prospector
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r 对话
    >>|cRXP_WARN_你可能得等他刷新, 或等别人把护送做完|r
    .turnin 729 >> 交任务: 健忘的勘察员
    .target 勘察员雷姆塔维尔
step << Hunter
    .goto Darkshore,35.72,83.69
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r 交谈. 这将开启一个护送任务
    .accept 731,1 >> 接任务: 健忘的勘察员
    >>|cRXP_WARN_这个任务非常困难. 你可以跳过这一步, 等达到 19 级再回来做|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处查看视频攻略|r
    .target 勘察员雷姆塔维尔
step << Hunter
    #requires prospector
    #season 0,1
    >>|cRXP_WARN_护送 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r 走完整个挖掘场|r
    >>|cRXP_WARN_这个任务非常困难. 你可以跳过这一步, 等达到 19 级再回来做|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处查看视频攻略|r
    .complete 731,1
    .isOnQuest 731
step << Hunter
    #xprate <1.5
    #season 0,1
    .goto 1439,31.251,87.419
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >> 接任务: 搁浅的海洋生物
    >>|cRXP_WARN_这个任务可能非常困难。请将|cRXP_ENEMY_鱼人|r 1 只接 1 只地引出，否则可能同时引到多只|r
    >>|cRXP_WARN_注意 |cRXP_ENEMY_灰雾智者|r 的|r |T136048:0|t[闪电箭] |cRXP_WARN_伤害, 它们还会用|r |T136052:0|t[治疗波] 回血|r
    .link https://youtu.be/lfQM3Q-Ag5A >> |cRXP_WARN_点击此处查看视频攻略|r
step
    #completewith CompleteThistleBears
    #season 0,1
--  .goto Darkshore,33.85,80.92,45,0
--  .goto Darkshore,32.17,82.92,45,0
--  .goto Darkshore,35.41,78.96,45,0
--  .goto Darkshore,35.68,75.23,45,0
--  .goto Darkshore,35.03,72.19,45,0
--  .goto Darkshore,35.68,75.23,45,0
--  .goto Darkshore,35.41,78.96,45,0
--  .goto Darkshore,32.17,82.92,45,0
--  .goto Darkshore,33.85,80.92,45,0
--  .goto Darkshore,35.03,72.19
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    >>注意|cRXP_ENEMY_暗礁蟹|r可以施放 |T132155:0|t[撕裂肌肉]——瞬发攻击，造成 30-55 点伤害
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 暗礁蟹
    .mob 硬壳潮行蟹
step << Hunter
	#xprate <1.5
    #season 0,1
    .goto 1439,31.229,85.564
    >>|cRXP_WARN_注意 |cRXP_ENEMY_灰雾智者|r 的|r |T136048:0|t[闪电箭] |cRXP_WARN_伤害, 它们还会用|r |T136052:0|t[治疗波] 回血|r
    >>小心，|cRXP_ENEMY_灰雾潮行者|r会在近战时施放 |T136016:0|t[|cRXP_FRIENDLY_毒药|r]，对你施加持续伤害效果，每3秒造成13点伤害，持续30秒
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接任务: 搁浅的海龟
step
    #label TurtleSouth
	#xprate <1.5
    #season 0,1
    .goto 1439,31.690,83.700
    >>|cRXP_WARN_注意 |cRXP_ENEMY_灰雾智者|r 的|r |T136048:0|t[闪电箭] |cRXP_WARN_伤害, 它们还会用|r |T136052:0|t[治疗波] 回血|r
    >>小心，|cRXP_ENEMY_灰雾潮行者|r会在近战时施放 |T136016:0|t[|cRXP_FRIENDLY_毒药|r]，对你施加持续伤害效果，每3秒造成13点伤害，持续30秒
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接任务: 搁浅的海龟
step << !Hunter
	#xprate <1.5
    #season 0,1
    .goto 1439,32.644,80.711
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接任务: 搁浅的海洋生物
step << Hunter
	#xprate <1.5
    #season 0,1
    .goto 1439,32.644,80.711
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接任务: 搁浅的海洋生物
step << Druid
    #optional
    #season 0,1
    >>|cRXP_WARN_收集剩下的 |T134187:0|t[地根草]，可通过 |T136065:0|t[草药学]采集，也有极小概率来自|r|cRXP_PICK_破损的箱子|r
    >>|cRXP_WARN_如果找不到足够的地根草而决定放弃，就跳过此步骤|r
    .complete 6123,1 --Earthroot (5)
    .isOnQuest 6123
    .skill herbalism,<15,1
--XX Add waypoints later
step
    #label Murk
    #season 0,1
    .goto 1439,35.429,76.566,0
    .goto 1439,35.429,76.566,60,0
    .goto Darkshore,36.64,76.53
    >>|cRXP_WARN_检查|cRXP_ENEMY_莫克迪普|r是否已经在水里了（如果有玩家之前打输了，或者是没把跟他一起刷出来的|cRXP_ENEMY_灰雾猎人|r杀掉，他可能会一直留在那里）|r
    >>击杀营地里的|cRXP_ENEMY_灰雾战士|r和|cRXP_ENEMY_灰雾猎人|r
    >>|cRXP_WARN_去营地中间的篝火处来触发和|cRXP_ENEMY_莫克迪普|r的战斗：|r
    >>|cRXP_WARN_水中将刷新 3 波敌人，每波都在上一波被击杀后出现：第 1 波有 3 个 12-13 级的 |cRXP_ENEMY_灰雾滩行者|r，第 2 波有 2 个 15-16 级的 |cRXP_ENEMY_灰雾战士|r，第 3 波包含一只 19 级的 |cRXP_ENEMY_莫克迪普|r 和一只 16-17 级的 |cRXP_ENEMY_灰雾猎人|r。可以远离篝火，避免引到下一波|r
    .complete 4740,1 -- Murkdeep (1)
    .unitscan 莫克迪普
    .mob 灰雾战士
    .mob 灰雾猎人
    .mob 灰雾滩行者
step
    #label CompleteThistleBears
    #season 0,1
    .goto 1439,35.968,70.807
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4728 >> 接任务: 搁浅的海洋生物
step << Druid
    #label Southcrabs
    #season 0,1
	#completewith FlyDarkshore
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
step << Druid
    #season 0,1
    .goto Moonglade,52.53,40.57
	>>去月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔
    .xp <18,1
step << Druid
    #label FlyDarkshore
    #season 0,1
    .goto Moonglade,48.11,67.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛德拉尔|r 交谈
    .fly Auberdine >> 飞往黑海岸
    .target 辛德拉尔
    .zoneskip Darkshore
step << NightElf !Druid/Dwarf Hunter
    #label Southcrabs
    #season 0,1
    #completewith CleansingTharnariun
    .subzone 442 >> 前往奥伯丁
step
    #optional
    #completewith next
    #season 0,1
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >> 回到码头去找 |cRXP_FRIENDLY_塞瑞利恩·白爪|r
step
    #optional
    #season 0,1
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞瑞利恩·白爪|r 对话
    >>|cRXP_WARN_如果刚有人交完任务，你可能需要等他的剧情对话结束|r
    .turnin 963 >> 交任务: 永志不渝
    .target 塞瑞利恩·白爪
    .isQuestComplete 963
step
    #optional
    #season 0,1
    #completewith CleansingTharnariun
    .abandon 963 >> 放弃任务: [永志不渝]
step
    #xprate <1.5
    #season 0,1
    #label BeachedTurnins
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 对话
    .turnin 4728 >> 交任务: 搁浅的海洋生物
    .turnin 4730 >> 交任务: 搁浅的海洋生物
    .turnin 4731 >> 交任务: 搁浅的海龟
    .turnin 4732 >> 交任务: 搁浅的海龟 << Hunter
    .turnin 4733 >> 交任务: 搁浅的海洋生物 << Hunter
    .target 温尼斯·布莱葛
step
    #optional
    #season 0,1
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_古博·布拉普|r 对话
    .turnin 1138 >> 交任务: 海中的水果
    .isQuestComplete 1138
    .target 古博·布拉普
step
    .goto Darkshore,36.8,44.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r 和|cRXP_FRIENDLY_奥林迪雅|r 交谈
    .vendor >> |cRXP_BUY_卖掉杂物并补充食物和水|r
    .target 莱尔德
    .target 奥林迪雅
step
    .goto 1439,37.703,43.393
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r 对话
    .turnin 4740 >> 交任务: 通缉：莫克迪普！
    .target 哨兵戈琳达·纳希恩
step
    #label CleansingTharnariun
    #season 0,1
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r 对话
    .turnin 2138 >> 交任务: 清除疫病
    .accept 2139 >> 接任务: 萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
step << Hunter
    .goto 1439,37.439,41.839
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考古学家霍莉|r 对话
    .turnin 731 >> 交任务: 健忘的勘察员
    .accept 741 >> 接任务: 健忘的勘察员
    .target 考古学家霍莉
    .isQuestComplete 731
step << Hunter
    #optional
    #season 0,1
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考古学家霍莉|r 对话
    .accept 741 >> 接任务: 健忘的勘察员
    .target 考古学家霍莉
    .isQuestTurnedIn 731
step << Hunter
    #optional
    #season 0,1
    .goto Darkshore,37.4,40.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor >>|cRXP_BUY_补充弹药|r
    .target 达蒙德
step << Druid
    #xprate <1.5
    #season 0,1
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥兰达利亚·夜歌|r 对话
    .turnin 6123 >> 交任务: 收集解药
    .accept 6124 >> 接任务: 消除疾病
    .isQuestComplete 6123
step << Druid
    #xprate <1.5
    #optional
    #season 0,1
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥兰达利亚·夜歌|r 对话
    .accept 6124 >> 接任务: 消除疾病
    .target 奥兰达利亚·夜歌
    .isQuestTurnedIn 6123
step << Druid
    #optional
    #season 0,1
    #completewith Buzzbox323End
    .abandon 6123 >> 放弃任务: [收集解药]
step << Druid
    #xprate <1.5
    #optional
    #season 0,1
    #completewith Buzzbox323End
    .goto Darkshore,49.7,33.2,0
    .goto Darkshore,43.4,25.1,0
    .goto Darkshore,39.6,34.8,0
    >>|cRXP_WARN_将|r |T132801:0|t[动物医疗药膏]|cRXP_WARN_涂在|r|cRXP_ENEMY_生病的鹿|r
    .use 15826
    .complete 6124,1 -- Sickly Deer cured (10)
    .mob 生病的鹿
    .isQuestAvailable 1138
step << Druid
    #xprate <1.5
    #season 0,1
    #sticky
    #label SicklyDeers
    #loop
    .goto Darkshore,49.7,33.2,0
    .goto Darkshore,43.4,25.1,0
    .goto Darkshore,39.6,34.8,0
    .waypoint Darkshore,49.7,33.2,40,0
    .waypoint Darkshore,43.4,25.1,40,0
    .waypoint Darkshore,39.6,34.8,40,0
    >>|cRXP_WARN_将|r |T132801:0|t[动物医疗药膏]|cRXP_WARN_涂在|r|cRXP_ENEMY_生病的鹿|r
    .complete 6124,1 -- Sickly Deer cured (10)
    .mob 生病的鹿
    .use 15826
    .isQuestTurnedIn 1138
step
    #sticky
    #label Blackwood1
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,50.66,34.94
    >>打开|cRXP_PICK_黑木谷物|r，并拾取|T134059:0|t|cRXP_LOOT_[黑木谷物]|r
    >>|cRXP_WARN_拾取后会刷出 2 只 |cRXP_ENEMY_黑木熊怪|r，它们会立即对你产生仇恨并冲来。请准备好战斗，或设法重置它们|r
    >>|cRXP_WARN_如果看到|cRXP_ENEMY_萨巴克希斯|r在聊天中大喊，或看到有人正在与他战斗，请帮忙。打开他掉在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，并拾取其中的|r|cRXP_LOOT_堕落护符|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)
step
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀|cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_蓟熊幼崽|r会施放|r |T132152:0|t[毁灭]|cRXP_WARN_，这种近战瞬发攻击会使你昏迷2秒|r
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊
step
    #sticky
    #requires Blackwood1
    #label Blackwood2
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,51.83,33.50
    >>打开|cRXP_PICK_黑木坚果|r，并拾取|T133944:0|t|cRXP_LOOT_[黑木坚果]|r
    >>|cRXP_WARN_拾取后会刷出 2 只 |cRXP_ENEMY_黑木熊怪|r，它们会立即对你产生仇恨并冲来。请准备好战斗，或设法重置它们|r
    >>|cRXP_WARN_如果看到|cRXP_ENEMY_萨巴克希斯|r在聊天中大喊，或看到有人正在与他战斗，请帮忙。打开他掉在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，并拾取其中的|r|cRXP_LOOT_堕落护符|r
    .collect 12343,1,4763,1 -- Blackwood Nut Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)
step
    #sticky
    #requires Blackwood2
    #label Blackwood3
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,52.86,33.41
    >>打开|cRXP_PICK_黑木水果|r，并拾取|T134013:0|t|cRXP_LOOT_[黑木水果]|r
    >>|cRXP_WARN_拾取后会刷出 2 只 |cRXP_ENEMY_黑木熊怪|r，它们会立即对你产生仇恨并冲来。请准备好战斗，或设法重置它们|r
    >>|cRXP_WARN_如果看到|cRXP_ENEMY_萨巴克希斯|r在聊天中大喊，或看到有人正在与他战斗，请帮忙。打开他掉在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，并拾取其中的|r|cRXP_LOOT_堕落护符|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)
step
    #optional
    #requires Blackwood3
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39
    .cast 16072 >> |cRXP_WARN_使用|r |T134712:0|t[装满水的净化碗] |cRXP_WARN_，在 |cRXP_PICK_篝火|r 旁召唤|r |cRXP_ENEMY_萨巴克希斯|r
    .timer 17,黑木熊怪剧情对话
    .use 12347
step
    #requires Blackwood3
    #label Xabraxxis
    .goto Darkshore,52.38,33.39
    >>击杀|cRXP_ENEMY_萨巴克希斯|r。打开他掉落在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，拾取|cRXP_LOOT_堕落护符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob 萨巴克希斯
step << !Hunter
    #xprate <1.5
    #label CompleteFangs
    .goto Darkshore,52.6,33.6
    .xp 18 >> 刷到18级
step << Hunter
    #label CompleteFangs
    #season 0,1
    .goto Darkshore,52.6,33.6
    .xp 18.75 >> 刷到18级 + 75%进度
    >>确保你的炉石冷却时间少于10分钟
    >>如果该区域太拥挤, 就跳过这一步
step
    #label LateStalkerFangs
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #loop
    .goto 1439,53.629,26.054,0
    .goto 1439,54.204,30.475,0
    .goto 1439,49.775,30.351,0
    .goto 1439,48.894,26.514,0
    .goto 1439,48.022,27.199,60,0
    .goto 1439,48.894,26.514,60,0
    .goto 1439,49.558,26.087,60,0
    .goto 1439,49.902,27.511,60,0
    .goto 1439,49.776,28.393,60,0
    .goto 1439,49.775,30.351,60,0
    .goto 1439,50.818,30.486,60,0
    .goto 1439,50.689,32.001,60,0
    .goto 1439,51.267,32.319,60,0
    .goto 1439,54.204,30.475,60,0
    .goto 1439,53.899,28.638,60,0
    .goto 1439,53.049,27.983,60,0
    .goto 1439,52.764,26.312,60,0
    .goto 1439,53.629,26.054,60,0
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
    .isOnQuest 1002
--XX Can do later during Pelts but better if player gets more xp beforehand
step
    #xprate <1.5 --<< !NightElf/Hunter
    #label Buzzbox323End
    #requires SicklyDeers << Druid --xprate <1.5
    .goto 1439,51.288,24.554
    >>点击地面上的 |cRXP_PICK_传声盒323号|r
    .turnin 1002 >> 交任务: 传声盒323号
    .accept 1003 >> 接任务: 传声盒525号
step
	#xprate >1.49 << Hunter/Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴苏尔·影击|r 对话
    .turnin 965 >> 交任务: 奥萨拉克斯之塔
    .accept 966 >> 接任务: 奥萨拉克斯之塔
    .target 巴苏尔·影击
step
	#xprate >1.49 << Hunter/Druid
    #loop
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .goto 1439,55.231,26.508,50,0
    .goto 1439,55.369,27.025,50,0
    .goto 1439,55.763,26.695,50,0
    .goto 1439,55.815,26.972,50,0
    .goto 1439,56.194,27.071,50,0
    .goto 1439,56.790,27.621,50,0
    .goto 1439,57.278,26.311,50,0
    .goto 1439,57.046,26.234,50,0
    .goto 1439,56.544,26.598,50,0
    .goto 1439,56.047,26.586,50,0
    .goto 1439,55.743,25.915,50,0
    >>击杀|cRXP_ENEMY_暗滩狂热者|r，拾取|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者
step
    #xprate >1.59
    #loop
    #optional
    .goto 1439,55.231,26.508,0
    .goto 1439,56.194,27.071,0
    .goto 1439,56.047,26.586,0
    .goto 1439,55.743,25.915,50,0
    .goto 1439,56.047,26.586,50,0
    .goto 1439,56.544,26.598,50,0
    .goto 1439,57.046,26.234,50,0
    .goto 1439,57.278,26.311,50,0
    .goto 1439,56.790,27.621,50,0
    .goto 1439,56.194,27.071,50,0
    .goto 1439,55.815,26.972,50,0
    .goto 1439,55.763,26.695,50,0
    .goto 1439,55.369,27.025,50,0
    .goto 1439,55.231,26.508,50,0
    .xp 18+15000 >> 刷怪至 15000+/19400 经验值
    .mob 暗滩狂热者
step
	#xprate >1.49 << Hunter/Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴苏尔·影击|r 对话
    .turnin 966 >> 交任务: 奥萨拉克斯之塔
    .accept 967 >> 接任务: 奥萨拉克斯之塔
    .target 巴苏尔·影击
step
    #season 0,1
    .goto Darkshore,57.13,22.04,55,0
    .goto Darkshore,57.97,20.23,55,0
    .goto Darkshore,58.36,23.61,55,0
    .goto Darkshore,59.42,24.62,55,0
    .goto Darkshore,60.26,21.75
    >>拾取地上的|cRXP_LOOT_黑暗深渊遗物|r
    .complete 951,1 -- Mathystra Relics (6)
step
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基尔卡克·旋杆|r 对话
    .accept 2098 >> 接任务: 基尔卡克的钥匙
    .target 基尔卡克·旋杆
step
    #optional
    #completewith next
    .goto Darkshore,56.10,16.88,0
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r和|cRXP_ENEMY_硬壳潮行蟹|r，拾取|cRXP_LOOT_基尔卡克钥匙的尾部|r
    >>|cRXP_WARN_注意|cRXP_ENEMY_狂暴暗礁蟹|r的|r |T132152:0|t[痛击]|cRXP_WARN_技能，它们的近战攻击可能瞬间造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob 狂暴暗礁蟹
    .mob 硬壳潮行蟹
step
    .goto Darkshore,54.93,12.19
    >>击杀|cRXP_ENEMY_灰雾智者|r和|cRXP_ENEMY_灰雾潮行者|r，拾取|cRXP_LOOT_基尔卡克钥匙的中部|r
    >>|cRXP_WARN_注意|cRXP_ENEMY_灰雾智者|r的|r |T136048:0|t[闪电箭]|cRXP_WARN_伤害，它们还会使用|r |T136052:0|t[治疗波]回血|r
    >>注意|cRXP_ENEMY_灰雾潮行者|r在近战时可施放 |T136016:0|t[|cRXP_FRIENDLY_毒药|r]，每 3 秒造成 13 点伤害，持续 30 秒
    >>|cRXP_WARN_可以利用沉船卡视线，躲避|cRXP_ENEMY_灰雾智者|r的|r  |T136048:0|t[闪电箭]|cRXP_WARN_伤害|r
    .complete 2098,2 -- Middle of Gelkak's Key (1)
    .mob 灰雾潮行者
    .mob 灰雾智者
step
    .goto Darkshore,55.59,16.98,45,0
    .goto Darkshore,53.76,18.96,45,0
    .goto Darkshore,51.34,22.00,45,0
    .goto Darkshore,56.63,12.08
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r和|cRXP_ENEMY_硬壳潮行蟹|r，拾取|cRXP_LOOT_基尔卡克钥匙的尾部|r
    >>|cRXP_WARN_注意|cRXP_ENEMY_狂暴暗礁蟹|r的|r |T132152:0|t[痛击]|cRXP_WARN_技能，它们的近战攻击可能瞬间造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob 狂暴暗礁蟹
    .mob 硬壳潮行蟹
step
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
    #xprate <1.59
    #label NorthStalkerPelts
    .goto Darkshore,61.40,9.40,45,0
    .goto Darkshore,62.42,7.67
    >>击杀|cRXP_ENEMY_月夜雄虎|r和|cRXP_ENEMY_月夜雌虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_WARN_注意|cRXP_ENEMY_月夜雌虎|r。她们总是带着一只|cRXP_ENEMY_月夜猛虎幼崽|r一同进攻|r
    >>|cRXP_ENEMY_月夜雄虎|r可以施放 |T132090:0|t[攻击弱点]——背对它们时触发背刺，造成 20-40 点伤害
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .mob 月夜雌虎
    .mob 月夜猛虎幼崽
step << Warrior/Paladin/Rogue
    #season 0,1
    #requires foreststriders
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基尔卡克·旋杆|r 对话
    >>|cRXP_WARN_开始寻找队友，以完成基尔卡克的报复并击杀|r|cRXP_ENEMY_机械打手4100型|r << Warrior/Paladin/Rogue
    .turnin 2098 >> 交任务: 基尔卡克的钥匙
    .accept 2078 >> 接任务: 基尔卡克的报复
    .target 基尔卡克·旋杆
    .solo
step
    #requires foreststriders
    .group 2 << Warrior/Paladin/Rogue
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基尔卡克·旋杆|r 对话
    >>|cRXP_WARN_开始寻找队友，以完成基尔卡克的报复并击杀|r|cRXP_ENEMY_机械打手4100型|r << Warrior/Paladin/Rogue
    .turnin 2098 >> 交任务: 基尔卡克的钥匙
    .accept 2078 >> 接任务: 基尔卡克的报复
    .target 基尔卡克·旋杆
step
    #optional
    #completewith next
    .goto 1439,55.802,18.290
    .gossipoption 95406 >> 与 |cRXP_FRIENDLY_机械打手4100型|r 对话，开始护送
--  .gossipoption 87696 >> Talk to |cRXP_FRIENDLY_The Threshwackonator 4100|r to start the escort
    >>|cRXP_WARN_这个任务难度非常大|r
    .target 机械打手4100型
    .isOnQuest 2078 << Warrior/Paladin/Rogue
step
    #label Turtle4727
    .goto 1439,53.113,18.099
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4727 >> 接任务: 搁浅的海龟
step
    .goto 1439,56.654,13.484
    #optional
    >>护送 |cRXP_FRIENDLY_机械打手 4100 型|r 到 |cRXP_FRIENDLY_基尔卡克·旋杆|r 那去
    >>等 |cRXP_ENEMY_机械打手 4100 型|r 变为敌对状态后将其击杀
    >>|cRXP_WARN_这个任务难度非常大|r
    *逃跑时只使用远程攻击，并避免进入它的近战范围。 << Druid
    >>|cRXP_WARN_尽量完成这个任务，因为它会奖励|r |T134797:0|t[水下呼吸药剂] |cRXP_WARN_，能为后续的水下任务节省时间|r << !Druid !Warlock
    >>|cRXP_WARN_在它变为敌对时使用|r |T136100:0|t[纠缠根须] |cRXP_WARN_，然后拉开距离并用瞬发法术风筝它|r << Druid
    >>|cRXP_WARN_如果打不过 |cRXP_ENEMY_机械打手 4100 型|r, 就跳过这一步|r
    .complete 2078,1 --Gyromast's Revenge (1)
    .link https://youtu.be/1WRRmKYBr9s >> |cRXP_WARN_点击此处查看视频攻略|r
    .mob 机械打手4100型
    .isOnQuest 2078 << Warrior/Paladin/Rogue
--XX DRUID: Test if you can root
step
    #optional << Warrior/Paladin/Rogue
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基尔卡克·旋杆|r 对话
    .turnin 2078 >> 交任务: 基尔卡克的报复
    .target 基尔卡克·旋杆
    .isQuestComplete 2078
step
    #optional
    #completewith BeachedCloak
    .abandon 2078 >> 放弃任务: [基尔卡克的报复]
step << Druid
    #xprate <1.5
    #optional
    #completewith DeerComplete
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
step
    #sticky
    #label DeleteGyromast
    #optional
    .destroy 7442 >> 从背包中删除 |T134459:0|t[基尔卡克的钥匙]，因为之后不再需要
step << !NightElf !Druid !Hunter/!NightElf !Druid !Dwarf
    #completewith BeachedCloak
    #map Darkshore
    .goto Felwood,18.50,19.87,100 >> 前往奥伯丁
    .cooldown item,6948,<0
step << !NightElf !Druid !Hunter/!NightElf !Druid !Dwarf
    #xprate <1.59
    #optional
    #completewith next
    .hs >> 炉石回奥伯丁
    .cooldown item,6948,>0,1
step << Druid
    .goto 1439,53.113,18.099
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4727 >> 接任务: 搁浅的海龟
step << Druid
    #xprate <1.5
    #label DeerComplete
    #loop
    .goto Darkshore,49.7,33.2,0
    .goto Darkshore,43.4,25.1,0
    .goto Darkshore,39.6,34.8,0
    .goto Darkshore,49.7,33.2,40,0
    .goto Darkshore,43.4,25.1,40,0
    .goto Darkshore,39.6,34.8,40,0
    >>|cRXP_WARN_将|r |T132801:0|t[动物医疗药膏]|cRXP_WARN_涂在|r|cRXP_ENEMY_生病的鹿|r
    .complete 6124,1 -- Sickly Deer cured (10)
    .mob 生病的鹿
    .use 15826
step << Druid
    .goto Darkshore,48.87,11.32
    >>|cRXP_WARN_游到水中|r
    >>打开|cRXP_PICK_奇怪的保险箱|r，获取|cRXP_LOOT_水兽敏捷坠饰|r
    .collect 15883,1,272,1 --Collect Half Pendant of Aquatic Agility (x1)
----Start of Darkshore 2x 20 Turnins & Druid Training----
step << Druid
    #xprate >1.59
    #optional
	#completewith next
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
    .xp <20,1
step << Druid
    #xprate >1.59
    #optional
    .goto Moonglade,52.53,40.57
	>>去月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔
    .xp <20,1
step << Druid
    #xprate >1.59
    #optional
    #completewith next
    .hs >> 炉石回奥伯丁
    .zoneskip Darkshore
    .subzoneskip 442
    .xp <20,1
step
    #xprate >1.59
    #label BlackwoodSod
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_桑迪斯·织风|r 对话
    .turnin 4763 >> 交任务: 黑木熊怪的堕落
    .target 桑迪斯·织风
step
    #xprate >1.59
    #optional
    #completewith BeachedCloak
    .destroy 12342 >> 从背包中删除 |T134059:0|t|cRXP_LOOT_[黑木谷物]|r，因为之后不再需要。
step
    #xprate >1.59
    #optional
    #completewith BeachedCloak
    .destroy 12343 >> 从背包中删除 |T133944:0|t|cRXP_LOOT_[黑木坚果]|r，因为之后不再需要。
step
    #xprate >1.59
    #optional
    #completewith BeachedCloak
    .destroy 12341 >> 从背包中删除 |T134013:0|t|cRXP_LOOT_[黑木水果]|r，因为之后不再需要。
step
    #season 1
    #xprate >1.59
    #optional
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    >>|cRXP_BUY_向他购买一个|r |T135237:0|t[燧石和火绒]|cRXP_BUY_和一个|r |T135435:0|t[普通木柴]|cRXP_BUY_。|r
    >>|cRXP_WARN_这些材料用于稍后在船上提升|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_需要达到50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，才能完成之后在暮色森林的任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .itemcount 6889,1 -- Small Egg (1+)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .target 达蒙德
step
    #season 1
    #xprate >1.59
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor 6301 >>|cRXP_BUY_向他购买|r |T134059:0|t[甜香料]|cRXP_BUY_，直到持有的|r |T134059:0|t[甜香料]|cRXP_BUY_数量不少于当前持有的|r |T132832:0|t[小蛋]|cRXP_BUY_数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target 高尔博德·钢手
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)
step
    #xprate >1.59
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r 对话
    .turnin 2139 >> 交任务: 萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
step
    #xprate >1.59
    #optional
    #label PeltEnd
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特伦希斯|r 对话
    .turnin 986 >> 交任务: 丢失的主人
    .accept 993 >> 接任务：丢失的主人
    .target 特伦希斯
    .isQuestComplete 986
step
    #xprate >1.59
    #optional
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特伦希斯|r 对话
    .accept 993 >> 接任务：丢失的主人
    .target 特伦希斯
    .isQuestTurnedIn 986
step
    #xprate >1.59
    #optional
    #completewith BeachedCloak
    >>|cRXP_WARN_如果装备了|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_，记得保留当前披风，因为后续交任务时这件|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_会被收走|r
    .equip 15,5387 >>|cRXP_WARN_装备|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_（如果它比你的当前披风更好）|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7
step
    #xprate >1.59
    #requires DeleteGyromast
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_古博·布拉普|r 对话
    .turnin 1138 >> 交任务: 海中的水果
    .target 古博·布拉普
    .isQuestComplete 1138
step
    #xprate >1.59
    #label BeachedCloak
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 对话
    .turnin 4727 >> 交任务: 搁浅的海龟
    .target 温尼斯·布莱葛
----End of Darkshore 2x 20 Turnins & Druid Training----
----Start of 2x Non-Deadmines Training/Class q section----
step << Warrior/Paladin/Mage/Warlock/Rogue
    #xprate >1.59
    #label TravelMenethilNoDMBoat
    #completewith MenethilNoDMBoat
    .goto Darkshore,32.44,43.71,15 >> 前往开往米奈希尔港的船只停靠的码头
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Warrior/Paladin/Mage/Warlock/Rogue
    #season 1
    #xprate >1.59
    #optional
    #label DarkshoreNoDMCook1
    #requires TravelMenethilNoDMBoat
    #completewith MenethilNoDMBoat
    >>|cRXP_WARN_如果船刚到，就在船上进行下面的操作；如果船刚走，就在码头上进行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火]|cRXP_WARN_（在法术书的“通用”标签页中）|r
    .usespell 818
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .dungeon !DM
step << Warrior/Paladin/Mage/Warlock/Rogue
    #season 1
    #xprate >1.59
    #optional
    #requires DarkshoreNoDMCook1
    #completewith MenethilNoDMBoat
    >>|cRXP_WARN_需要达到50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，才能完成之后在暮色森林的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T132832:0|t|cRXP_LOOT_[小蛋]|r|cRXP_WARN_和|r |T134059:0|t[甜香料]|cRXP_WARN_制作成|r |T132834:0|t[草药烘蛋]
    .usespell 2550
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
    .dungeon !DM
step << Warrior/Paladin
    #xprate >1.59
    #ah
    #label MenethilNoDMBoat
    .goto Darkshore,32.29,44.05
    >>|cRXP_WARN_如有需要，在等候前往米奈希尔港的船时提升你的|r |T135966:0|t[急救] |cRXP_WARN_技能|r << Warrior/Paladin/Rogue
    >>|cRXP_WARN_如果你包里已经有一把快能换上的好武器了, 就跳过这一步|r
    .zone Wetlands >> 乘船前往米奈希尔港
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8 << Paladin/Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Warrior/Paladin/Mage/Warlock/Rogue
    #xprate >1.59
    #ssf << Paladin/Warrior
    #label MenethilNoDMBoat
    .goto Darkshore,32.29,44.05
    >>|cRXP_WARN_如有需要，在等候前往米奈希尔港的船时提升你的|r |T135966:0|t[急救] |cRXP_WARN_技能|r << Warrior/Paladin/Rogue
    .zone Wetlands >> 乘船前往米奈希尔港
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8 << Paladin/Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Warrior/Paladin
    #ah
    #xprate >1.59
    #optional
    #label PalWarSkip20
    .goto 1437,11.579,59.540,6,0
    .goto 1437,11.435,59.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与米奈希尔港的|cRXP_FRIENDLY_布拉克·唐纳德|r交谈
    .vendor 1441 >>|cRXP_BUY_有货且资金足够时，向他购买一把|r |T135329:0|t[刽子手之剑] |cRXP_BUY_|r
    >>|cRXP_WARN_如果没有，别担心，待会儿我们会去拍卖行|r
    .collect 4818,1,2040,1 --Collect Executioner's Sword (1)
    .disablecheckbox
    .target 布拉克·唐纳德
    .zoneskip Darkshore
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .itemcount 4818,<1 --Executioner's Sword (<1)
    .dungeon !DM
step << Warrior/Paladin
    #ssf
    #xprate >1.59
    .goto 1437,11.579,59.540,6,0
    .goto 1437,11.435,59.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_布拉克·唐纳德|r交谈
    >>|cRXP_BUY_有货且资金足够时，向他购买一把|r |T135329:0|t[刽子手之剑] |cRXP_BUY_|r
    >>|cRXP_BUY_如果没有刽子手之剑，就向他购买一把|r |T135280:0|t[微光重剑]|cRXP_BUY_（如果买得起）|r
    .collect 4818,1,2040,1 --Collect Executioner's Sword (1)
    .disablecheckbox
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target 布拉克·唐纳德
    .zoneskip Darkshore
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8 --Intentionally lower than Falx so people don't buy the Falx if they have Executioners
    .itemcount 922,<1 --Dacian Falx (<1)
    .itemcount 4818,<1 --Executioner's Sword (<1)
    .dungeon !DM
step << !NightElf Warrior/Paladin
    #xprate >1.59
    #optional
    +|cRXP_WARN_装备|r |T135329:0|t[刽子手之剑]
    .use 4818
    .itemcount 4818,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon !DM
step << !NightElf Warrior/Paladin
    #xprate >1.59
    #optional
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .xp <21,1
    .dungeon !DM
step << !NightElf Warrior/Paladin/Mage/Warlock/!NightElf Rogue
    #xprate >1.59
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r 对话
    .fly Ironforge >> 飞往铁炉堡
    .target 谢尔雷·布隆迪尔
    .zoneskip Darkshore << Warrior/Paladin
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r 对话
    .fp Menethil Harbor >> 获取米奈希尔港飞行点
    .target 谢尔雷·布隆迪尔
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto Wetlands,5.485,64.156,40 >> 从码头尽头跳进水里, 游向坐标点
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    .goto Wetlands,2.433,78.689,-1
    .goto Ironforge,17.089,83.373,-1
    .zone Ironforge >>使用角色解困自助服务功能跳转到铁炉堡。到达该位置后先登出，再用另一个角色打开帮助菜单（也可将下方的解困链接粘贴到浏览器中），向下滚动到“自助服务”，选择该角色并点击“移动”。如果无法使用解困服务，就跳过此步，沿山脉游向西部荒野。
    .link https://www.youtube.com/watch?v=oVoxsr4zcg4 >> 点击这里查看视频参考
    .link https://us.battle.net/support/en/help/product/wow/197/834/solution >> 点击此处打开角色解困链接
    .subzoneskip 809 --IF Gates
    .subzoneskip 2257 --Deeprun Tram
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon !DM
----Start of NE Warrior and Rogue 2x No Deadmines swim to Westfall Alternative section----
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto 1415,44.720,49.200,60,0 -- Wetlands to Westfall Swim
    .goto 1415,43.162,49.946,60,0
    .goto 1415,42.564,50.884,20,0
    .goto 1415,42.363,50.812,20,0
    .goto 1415,41.682,50.232,20,0
    .goto 1415,40.959,50.142,20,0
    .goto 1415,39.818,51.078,20,0
    .goto 1415,39.778,51.615,30,0
    .goto 1415,39.505,52.636,30,0
    .goto 1415,40.160,54.451,20,0
    .goto 1415,40.505,54.507,20,0
    .goto 1415,41.370,57.126,40,0
    .goto 1415,41.988,59.434,30,0
    .goto 1415,41.342,61.214,30,0
    .goto 1415,41.309,61.938,20,0
    .goto 1415,40.545,64.111,30,0
    .goto 1415,41.066,65.878,20,0
    .goto 1415,41.349,66.265,30,0
    .goto 1415,41.363,66.995,30,0
    .goto 1415,41.625,67.689,30,0
    .goto StormwindClassic,4.493,29.157,20,0
    .goto StormwindClassic,10.336,40.166,10,0
    .goto StormwindClassic,7,45.471,10,0
    .goto StormwindClassic,5.560,50.125,10,0
    .goto StormwindClassic,13.669,74.499,20,0
    .goto Westfall,42.024,70.980
    .zone Westfall >> 如果网站解困服务不可用，就游泳前往西部荒野
    .zoneskip Ironforge
    .subzoneskip 809--IF Gates
    .subzoneskip 2257--Deeprun Tram
    .zoneskip Stormwind City
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto Westfall,54.28,9.26,100,0
    .goto Westfall,56.55,52.64,100 >> 上岸后前往哨兵岭
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fp Sentinel Hill >> 获取哨兵岭飞行点
    .target 索尔
    .zoneskip Ironforge --Skips if you didn't swim from Wetlands
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .accept 65 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
    .zoneskip Westfall,1
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Elwynn Forest,36.809,72.429,100,0
    .goto StormwindClassic,69.961,86.583
    .zone Stormwind City >> 跑向暴风城
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59 << !Hunter
    #optional << NightElf
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吴平|r 对话（武器大师）
    .train 201 >> 学习单手剑（1手） << Rogue
    .train 202 >> 学习双手剑（2手） << Warrior
    .target 吴平
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Darkshore
    .zoneskip Wetlands
    .zoneskip Ironforge
    .dungeon !DM
----End of NE Warrior Rogue 2x No Deadmines swim to Westfall Alternative section----
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional
    .goto Ironforge,61.177,89.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_布里维夫·石手|r 对话
    .train 197 >> 学习双手斧（2手）
    .train 199 >> 学习双手锤（2手）
    .target 布里维夫·石手
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]|cRXP_BUY_（向她购买）|r
    .collect 3107,1 << !tbc
    .collect 25873,1 << tbc
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Paladin/Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #ah
    #optional << NightElf
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_向她购买一把|r |T135280:0|t[微光重剑]|cRXP_BUY_，或去拍卖行寻找更好或更便宜的武器|r
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target 布雷文·寒钢
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.0 --Arbitrary number lower than Falx/Exe
    .train 202,3 << NightElf Warrior --2h swords trained
    .dungeon !DM
step << Paladin/Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .xp <21,1
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional << NightElf
    #completewith DeeprunDM
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]
    .use 3107 << !tbc
    .use 25873 << tbc
    .itemcount 3107,1 << !tbc
    .itemcount 25873,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional
    #completewith next
    .goto 1455,67.400,84.909,15,0
    .goto Ironforge,65.905,88.405,12 >> 前往 |cRXP_FRIENDLY_比尔班·飞钳|r
    .zoneskip Darkshore
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .train 202,3 << NightElf Warrior --2h swords trained
    .dungeon !DM
step << Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional << NightElf
    .goto Ironforge,65.905,88.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比尔班·飞钳|r 对话
    .trainer >> 学习职业技能
    .target 比尔班·飞钳
    .zoneskip Darkshore
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .train 202,3 << NightElf Warrior --2h swords trained
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 对话
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step <<Paladin/Mage/Warlock/Rogue
    #xprate >1.59
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r] 来开启任务|r
    .accept 968 >> 接任务: 深渊之神
    .use 5352
    .itemcount 5352,1
    .zoneskip Darkshore << Warrior/Paladin
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Paladin/Mage/Warlock/Rogue
    #xprate >1.59
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_葛利·硬骨|r 对话
    .turnin 968 >> 交任务: 深渊之神
    .target 葛利·硬骨
    .isOnQuest 968
    .zoneskip Darkshore << Warrior/Paladin
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .goto Ironforge,28.70,25.58,12,0
    .goto Ironforge,29.60,26.62,10,0
    .goto Ironforge,30.50,26.58,10,0
    .goto Ironforge,31.32,27.80,12 >>前往屋内的|cRXP_FRIENDLY_吉恩|r处
    .dungeon !DM
step << Mage
    #xprate >1.59
    .goto Ironforge,31.32,27.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_吉恩|r交谈
    >>|cRXP_BUY_向她购买并补足至4个|r |T134419:0|t[传送符文]|cRXP_BUY_。|r
    .collect 17031,4 --Rune of Teleportation (4)
    .target 吉恩
    .dungeon !DM
step << Mage
    #xprate >1.59
    #label MilstaffNoDM
    .goto Ironforge,25.50,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝尔斯塔弗·风暴之眼|r 对话
    .train 3562 >> 学习 |T135763:0|t[传送：铁炉堡]
    .target 贝尔斯塔弗·风暴之眼
    .dungeon !DM
step << Mage
    #xprate >1.59
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丁克|r 对话
    .trainer >> 学习职业技能
    .target 丁克
    .dungeon !DM
step << Paladin
    #xprate >1.59
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布兰度尔·铁锤|r 对话
    .trainer >> 学习职业技能
    .target 布兰度尔·铁锤
    .zoneskip Darkshore
    .dungeon !DM
step << skip --logout skip Mage
    #xprate >1.59
    #optional
    #completewith DeeprunNoDM
    .goto 1455,27.611,8.074
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳上|cRXP_FRIENDLY_彬克|r上方的柱顶，稍向东走到箭头位置，调整角色直到看起来像在漂浮，然后登出再重新登录，利用登出机制走捷径|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Warlock/Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1455,53.164,7.037,10 >> 进入 |cRXP_FRIENDLY_寻尸者祖贝尔|r 的房子
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestTurnedIn 968
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << skip --logout skip Warlock/Rogue
    #xprate >1.59
    #optional
    #completewith DeeprunNoDM
    .goto 1455,52.825,5.060
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶，然后跳到书架顶。登出后再重新登录，利用登出机制走捷径|r
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestTurnedIn 968
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << skip --logout skip Warlock/Rogue
    #xprate >1.59
    #optional
    #completewith DeeprunNoDM
    .goto 1455,56.207,46.844
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到狮鹫头顶，然后登出再重新登录，利用登出机制走捷径|r
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestAvailable 968
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Mage/Warlock/Rogue
    #xprate >1.59
    #requires MilstaffNoDM << Mage
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考格斯宾|r 对话
    .vendor 5175 >> |cRXP_BUY_向他购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（若有货）|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .target 考格斯宾
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .subzoneskip 2257
    .bronzetube
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Mage/Warlock/Rogue
    #xprate >1.59
    #requires MilstaffNoDM << Mage
    #label DeeprunNoDM
    .goto Ironforge,78.00,51.40
    .subzone 2257 >>进入矿道地铁
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Mage/Warlock/Rogue
    #xprate >1.59
    #completewith WepTrainNoDM << !Warrior
    >>|cRXP_WARN_在乘坐电车时, 如果需要, 可提升你的|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_你需要你的|r|T135966:0|t[急救]|cRXP_WARN_达到 80 以上, 才能做后面的任务|r << Rogue !Dwarf
    .zone Stormwind City >> 乘坐矿道地铁前往暴风城
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Westfall
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Mage/Warlock/Rogue
    #xprate >1.59
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利巴布·旋轮|r 对话
    .vendor 5519 >> |cRXP_BUY_向他购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（若有货）|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .target 比利巴布·旋轮
    .zoneskip Darkshore << Warrior/Paladin
    .bronzetube
    .train 201,1 << NightElf Rogue --1h swords not trained
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Mage/Warlock/Rogue
    #xprate >1.59
    .goto StormwindClassic,58.08,16.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗伦·长须|r 对话
    .turnin 1338 >> 交任务: 卡尔·雷矛的订单
    .target 弗伦·长须
    .isOnQuest 1338
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >> 前往旧城区指挥中心内的 |cRXP_FRIENDLY_武神|r 处
    .zoneskip Darkshore
    .zoneskip Ironforge
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_武神|r 交谈
    .trainer >> 学习职业技能
    .target 武神
    .zoneskip Darkshore
    .zoneskip Ironforge
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith RogueTrainNoDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    >>|cRXP_WARN_如果你有闲钱，可以学习|r |T132282:0|t[伏击] |cRXP_WARN_，前提是已装备或背包里有一把|r |T135641:0|t[匕首] |cRXP_WARN_。之后能节省时间|r
    .train 8676 >> 学习 |T132282:0|t[伏击]
    .target 夜行者奥斯伯
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    >>|cRXP_WARN_确保学习|r |T132320:0|t[潜行]|cRXP_WARN_、|r |T133644:0|t[搜索]|cRXP_WARN_和|r |T136058:0|t[开锁] |cRXP_WARN_后续会用到|r
    .train 1784 >>学习 |T132320:0|t[潜行]
    .train 921 >>学习 |T133644:0|t[搜索]
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon !DM
    .train 1784,1
    .train 921,1
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    >>|cRXP_WARN_确保学习|r |T133644:0|t[搜索]|cRXP_WARN_和|r |T136058:0|t[开锁] |cRXP_WARN_后续会用到|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必小心管理金钱. 只购买必要的法术. 你很快将需要钱来学习消失|r
    .train 921 >>学习 |T133644:0|t[搜索]
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon !DM
    .train 921,1
step << Rogue
    #xprate >1.59
    #label RogueTrainNoDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    >>|cRXP_WARN_务必学习|r |T136058:0|t[开锁] |cRXP_WARN_，因为之后会用到|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必小心管理金钱. 只购买必要的法术. 你很快将需要钱来学习消失|r
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.799,53.815,15,0
    .goto 1453,77.290,58.138,12,0
    .goto 1453,78.466,60.034,12,0
    .goto 1453,78.560,58.435,6,0
    .goto 1453,75.754,60.369,12 >> 前往军情七处 (SI:7) 楼上找 |cRXP_FRIENDLY_“剃刀”雷吉克|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_“剃刀”雷吉克|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 对话
    .accept 2281 >> 接任务: 赤脊山的联络员
    .goto StormwindClassic,75.76,60.35
    .target +“剃刀”雷吉克
    .accept 2360 >> 接任务: 马迪亚斯和迪菲亚潜行者
    .goto StormwindClassic,75.78,59.84
    .target +马迪亚斯·肖尔
    .dungeon !DM
step << NightElf Rogue/Mage/Warlock
    #xprate >1.59 << !Hunter
    #season 1 << Rogue sod
    #label WepTrainNoDM
    #optional << NightElf
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吴平|r 对话（武器大师）
    .train 201 >> 学习单手剑（1手） << Mage/Rogue/Warlock
    .train 1180 >> 学习匕首技能 << Mage
    .train 202 >> 学习双手剑（2手） << Warrior
    .target 吴平
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional
    #completewith NoDMStockadeEnd
    +|cRXP_WARN_装备|r |T135329:0|t[刽子手之剑]
    .use 4818
    .itemcount 4818,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #ah
    #optional
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_向她购买一把|r |T135280:0|t[微光重剑]|cRXP_BUY_，或去拍卖行寻找更好或更便宜的武器|r
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target 玛尔达·维勒
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.0 --Arbitrary number lower than Falx/Exe
    .zoneskip Stormwind City,1
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .xp <21,1
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_向她购买一把|r |T135342:0|t[波刃短剑]|cRXP_BUY_，或去拍卖行寻找更好或更便宜的武器|r
    >>|cRXP_WARN_在接下来的步骤中，请务必小心管理金钱。如果钱不够，就只买一把匕首。你很快会需要花钱学习消失|r
    .collect 2209,2 --Kris (2)
    .target 玛尔达·维勒
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_购买一把|r |T135342:0|t[波刃短剑]|cRXP_BUY_（向她购买，如果买得起）|r
    >>|cRXP_WARN_在接下来的步骤中，请务必小心管理金钱。如果钱不够，就只买一把匕首。你很快会需要花钱学习消失|r
    .collect 2209,1 --Kris (2)
    .target 玛尔达·维勒
    .money <0.7115
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith NoDMStockadeEnd
    +|cRXP_WARN_装备|r |T135342:0|t[波刃短剑]
    .use 2209
    .itemcount 2209,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .xp <19,1
    .dungeon !DM
----Start of 2x Non-Deadmines Rogue Class q section----
step << Rogue
    #xprate >1.59
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买 |T134437:0|t[抗毒药剂]用于稍后的 |T132290:0|t[毒药]职业任务，其余物品用于稍后在赤脊山更快地交任务 << !Dwarf
    >>购买以下物品，以便稍后在赤脊山更快地交任务 << Dwarf
    >>这样可节省找怪时间。如果不想购买任何物品，请跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf --Anti-Venom (1)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target 拍卖师亚克森
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #completewith GryanAll << Human
    #optional << Human
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fp Stormwind >> 获取暴风城飞行点 << !Human
    .fly Westfall >> 飞往西部荒野 << Human
    .target 杜加尔·朗德瑞克
    .zoneskip Westfall << Human
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .zone Westfall >> 前往西部荒野
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label GryanAll << Human
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .accept 65 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fp Sentinel Hill >> 获取哨兵岭飞行点 << !Human
    .fly Redridge >> 飞往赤脊山 << Human
    .target 索尔
    .dungeon !DM
step << Human Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fly Redridge >> 飞往赤脊山
    .target 杜加尔·朗德瑞克
    .zoneskip Stormwind City,1
    .isOnQuest 65
    .dungeon !DM
step << !Human Rogue
    #xprate >1.59
    .goto Elwynn Forest,65.20,69.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与阿祖拉之塔顶的 |cRXP_FRIENDLY_塞欧克瑞图斯|r 对话
    .accept 94 >> 接任务: 法师的眼线
    .target 塞欧克瑞图斯
    .dungeon !DM
    .xp <20,1
step << !Human Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >> 前往赤脊山
    .dungeon !DM
step << Rogue
    #xprate >1.59 << !Hunter
    #optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_厨师布雷纳|r 对话
    .accept 92 >> 接任务: 赤脊山炖肉
    .turnin 92 >> 交任务: 赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target 厨师布雷纳
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label WileyStart
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_黑衣威利|r 对话
    .turnin 65 >> 交任务: 迪菲亚兄弟会
    .accept 132 >> 接任务: 迪菲亚兄弟会
	.target 黑衣威利
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label Rendevous
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2281 >> 交任务: 赤脊山的联络员
    .accept 2282 >> 接任务: 奥瑟尔伐木场
    .target 卢修斯
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,32.2,48.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 对话
    .accept 89 >> 接任务: 止水湖上的桥
    .target 工头奥斯洛
    .xp 21.4,1
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #sticky
    #completewith next
    .goto Redridge Mountains,39.6,33.2,0
    .goto Redridge Mountains,38.2,35.7,0
    .goto Redridge Mountains,35.2,37.8,0
    .goto Redridge Mountains,31.9,39.5,0
    .goto Redridge Mountains,28.5,38.7,0
    .goto Redridge Mountains,25.1,37.7,0
    >>前往奥瑟尔伐木场途中可以击杀一些豺狼人，返程时再完成这个目标
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .isOnQuest 89
    .dungeon !DM
    .mob 赤脊山蛮兵
    .mob 赤脊山秘法师
    .mob 赤脊山猛击者
step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116,100 >> 前往奥瑟尔伐木场
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_必须完成这一步，才能进行后续的|r |T132290:0|t[毒药]|cRXP_WARN_任务|r
    >>|cRXP_WARN_站在路点位置，调整镜头和鼠标位置，使你无需移动即可点击 3 个|cRXP_PICK_练习用保险箱|r|r
    .skill lockpicking,80 >>|cRXP_WARN_打开奥瑟尔伐木场地面上的|cRXP_PICK_练习用保险箱|r，直到你的|r |T136058:0|t[开锁]技能达到 80|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
	.goto Redridge Mountains,52.05,44.69
    >>打开|cRXP_PICK_卢修斯的箱子|r，获取|cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery (1)
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,39.6,33.2
    .goto Redridge Mountains,38.2,35.7,0
    .goto Redridge Mountains,35.2,37.8,0
    .goto Redridge Mountains,31.9,39.5,0
    .goto Redridge Mountains,28.5,38.7,0
    .goto Redridge Mountains,25.1,37.7,0
    >>继续击杀|cRXP_WARN_豺狼人|r收集完修桥的材料
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .isOnQuest 89
    .dungeon !DM
    .mob 赤脊山蛮兵
    .mob 赤脊山秘法师
    .mob 赤脊山猛击者
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,32.2,48.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 对话
    .turnin 89 >> 交任务: 止水湖上的桥
    .isQuestComplete 89
    .target 工头奥斯洛
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2282 >> 交任务: 奥瑟尔伐木场
    .target 卢修斯
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith DefiasWestfall2
    .destroy 7907 >> 从背包中删除 |T134328:0|t[偷窃技能认证书]，因为之后不再需要
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .xp 21+14325 >> 离开赤脊山前，确保21级已获得至少14k经验。若尚未达到，可以考虑完成|cRXP_ENEMY_希拉里的项链|r任务，任务给予者为|cRXP_FRIENDLY_肖恩|r；或完成|cRXP_ENEMY_丢失的工具|r任务，任务给予者为|cRXP_FRIENDLY_工头奥斯洛|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 对话
    .fp Redridge Mountains >> 获取赤脊山飞行点 << !Human
    .fly Westfall >> 飞往西部荒野
    .target 艾蕾娜·斯托姆法瑟
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label DefiasWestfall2
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 132 >> 交任务: 迪菲亚兄弟会
    .accept 135 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith KlavenFinish
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    .goto Duskwood,15.90,72.10,60,0
    .goto Duskwood,14.86,64.56,50,0
    .goto Duskwood,10.43,53.97
    >>击杀|cRXP_ENEMY_小型结网毒蜘蛛|r和|cRXP_ENEMY_结网毒蜘蛛|r，拾取|cRXP_LOOT_小毒囊|r和|cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_需要|cRXP_LOOT_小毒囊|r，之后用它制作|r |T134437:0|t[抗毒药剂]|cRXP_WARN_，以移除后续任务施加的|r |T136230:0|t[赞吉尔之触]|cRXP_WARN_减益效果|r
    >>|cRXP_WARN_把|cRXP_LOOT_粘糊的蜘蛛腿|r留着以后用|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r|cRXP_WARN_朋友，可以跳过此步骤，稍后请他们帮你移除减益效果|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob 小型结网毒蜘蛛
    .mob 结网毒蜘蛛
    .itemcount 6452,<1 --Anti Venom (<1)
    .isQuestAvailable 2359
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请注意即将出现的章节==|r
    >>|cRXP_WARN_按 Esc 键，进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选"启用互动按键"，并将"与目标互动"选项绑定至一个快捷键|r
    >>|cRXP_WARN_另外，建议开启"显示敌方姓名板"（默认快捷键：V），这样你就能隔墙看到塔内转角处的敌人了|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_密探吉尔妮|r 对话
    >>|cRXP_WARN_你必须完成这个任务才能获得|r |T132290:0|t[毒药]
    .turnin 2360 >> 交任务: 马迪亚斯和迪菲亚潜行者
    .accept 2359 >> 接任务: 克拉文之塔
    .target 密探吉尔妮
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label TowerKey
    #loop
    .goto Westfall,71.49,73.49,0
    .goto Westfall,71.01,75.72,0
    .goto Westfall,69.58,73.07,0
    .goto Westfall,71.49,73.49,30,0
    .goto Westfall,71.01,75.72,30,0
    .goto Westfall,69.58,73.07,30,0
    >>|T133644:0|t[搜索] |cRXP_ENEMY_丑陋的迪菲亚懒汉|r, 获取 |cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    >>|cRXP_WARN_|cRXP_ENEMY_丑陋的迪菲亚懒汉|r 会在塔楼入口刷新，然后在塔外巡逻|r
    >>|cRXP_WARN_小心，他的伤害很高。如果你的|r |T132320:0|t[潜行] |cRXP_WARN_被打破，立刻使用|r |T132307:0|t[疾跑] |cRXP_WARN_逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 丑陋的迪菲亚懒汉
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith Mortwake
    +|cRXP_WARN_为此任务装备|r |T135641:0|t[曲木匕首]|cRXP_WARN_，前提是你尚未装备|r |T135641:0|t[匕首]|cRXP_WARN_ |r
    .use 15396
    .itemcount 15396,1
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼从上往下第 2 层。在|r |T132320:0|t[潜行] |cRXP_WARN_状态下，趁 |cRXP_ENEMY_迪菲亚哨兵|r 不在身边，依次跳上椅子、灯和路点位置上方的书架顶|r
    >>|cRXP_WARN_手动|r |T132320:0|t[取消潜行]|cRXP_WARN_，然后按下“与目标互动”快捷键打开|cRXP_PICK_暮色森林的箱子|r，拾取其中的|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_注意: 你的|r |T132320:0|t[潜行] |cRXP_WARN_在拾取后会暂时失效, 因为你拿到了|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_如果你在第2层没有击杀 |cRXP_ENEMY_迪菲亚哨兵|r，请做好逃跑的准备。当你站在书架顶部时，他们很可能会一直对你产生仇恨 (但不会攻击你) ，因为那里是一个怪物无法攻击的位置|r
    >>|cRXP_WARN_如果背包里或已装备|r |T135641:0|t[匕首]|cRXP_WARN_，你可以施放|r |T132282:0|t[伏击] |cRXP_WARN_瞬间击杀塔内的|cRXP_ENEMY_迪菲亚巡塔员|r和|cRXP_ENEMY_迪菲亚哨兵|r。击杀第一个|cRXP_ENEMY_迪菲亚哨兵|r后准备逃跑，并记住可能受到来自上方的攻击。这种方法较慢，但安全得多|r
    >>|cRXP_WARN_如果必须跑出塔楼，小心入口处可能出现的|cRXP_ENEMY_丑陋的迪菲亚懒汉|r和|cRXP_ENEMY_迪菲亚苦工|r|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 迪菲亚巡塔员
    .mob 迪菲亚哨兵
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包里的 |T134437:0|t[抗毒药剂]移除 |T136230:0|t[赞吉尔之触]减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon !DM
step << Dwarf Rogue
    #xprate >1.59
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石像形态]移除 |T136230:0|t[赞吉尔之触]减益效果|r
    .aura -9991
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith KlavenFinish
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fly Stormwind >> 飞往暴风城
    .target 索尔
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >> 前往 |cRXP_FRIENDLY_珊娜·弗勒|r 处
    .aura -9991
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊娜·弗勒|r 对话
    >>|cRXP_WARN_如果你有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以请他们帮你移除|r |T136230:0|t[赞吉尔之触]|cRXP_WARN_ |r
    .skill firstaid,80 >> |cRXP_WARN_将|r |T135966:0|t[急救] |cRXP_WARN_练到80点|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊娜·弗勒|r 对话
    >>|cRXP_WARN_如果你有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以请他们帮你移除|r |T136230:0|t[赞吉尔之触]|cRXP_WARN_ |r
    .train 7934 >> |cRXP_WARN_学习|r |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包里的 |T134437:0|t[抗毒药剂]移除 |T136230:0|t[赞吉尔之触]减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,10 >> 进入军情七处（SI:7）总部，上楼前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r处
    .dungeon !DM
step << Rogue
    #xprate >1.59 << !Hunter
    #label KlavenFinish
    .goto Stormwind City,75.78,59.84
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 对话
    >>|cRXP_WARN_如果你之前换用了|r |T135641:0|t[匕首]|cRXP_WARN_，记得重新装备主武器|r << Rogue !sod
    .turnin 135 >> 交任务: 迪菲亚兄弟会
--  .accept 141 >> Accept The Defias Brotherhood
    .turnin 2359 >> 交任务: 克拉文之塔
    .target 马迪亚斯·肖尔
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Stormwind City,78.2,58.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑一楼的|cRXP_FRIENDLY_贾斯伯·菲尔|r交谈
    >>向他购买制作 |T132273:0|t[|cRXP_FRIENDLY_速效药膏|r]的材料，以及施放 |T132331:0|t[|cRXP_FRIENDLY_消失|r]所需的材料
    .collect 3371,20 --Empty Vial (20)
    .collect 2928,20 --Dust of Decay (20)
    .collect 5140,20 --Flash Powder (20)
    .target 贾斯伯·菲尔
    .dungeon !DM
step << Rogue
    #xprate >1.59
    >>打开法术书，在通用选项卡中找到 |T136242:0|t[|cRXP_FRIENDLY_毒药|r]技能。打开该技能并制作 20 个速效药膏。|cRXP_WARN_记得在战斗中将它们施加到两把武器上|r
    .collect 6947,20 --Instant Poison (20)
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    >>|cRXP_WARN_在接下来的步骤中, 请务必谨慎管理金钱. 只购买必要的法术. 为之后的必要技能预留足够资金|r
    >>|cRXP_WARN_学习|r |T132331:0|t[消失]|cRXP_WARN_和|r |T132320:0|t[潜行]（等级2）
    .train 1856 >> 学习 |T132331:0|t[消失]
    .train 1785 >> 学习 |T132320:0|t[潜行] (等级 2)
    .target 夜行者奥斯伯
    .dungeon !DM
----End of 2x Non-Deadmines Rogue Class q section----
step << Warlock
    #xprate >1.59
    #ah
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    .vendor 1312 >>|cRXP_BUY_购买|r |T135469:0|t[黄昏魔杖]|cRXP_BUY_，前提是你买得起；向她购买|r
    >>|cRXP_BUY_或者，从拍卖行购买|r |T135144:0|t[强效魔法杖]|cRXP_BUY_，前提是价格低于52银47铜|r
    .collect 5211,1 --Dusk Wand (1)
    .disablecheckbox
    .target 阿德温·凯伦
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #ssf
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_BUY_购买|r |T135469:0|t[黄昏魔杖]|cRXP_BUY_（从她那里）|r
    .collect 5211,1 --Dusk Wand (1)
    .target 阿德温·凯伦
    .money <0.5247
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith NoDMStockadeEnd
    +|cRXP_WARN_装备|r |T135469:0|t[黄昏魔杖]
    .use 5211
    .itemcount 5211,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith NoDMStockadeEnd
    +|cRXP_WARN_装备|r |T135144:0|t[强效魔法杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 进入“屠羊酒馆”，下楼
    .dungeon !DM
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r对话
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2NoDM
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯巴克尔|r交谈
    .vendor >>|cRXP_BUY_购买|r |T133738:0|t[魔典：折磨（等级 2）]|cRXP_BUY_（从她那里）|r
    .target 斯巴克尔
    .itemcount 16346,<1 --Grimoire of Torment (<1)
    .train 20317,1
    .dungeon !DM
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 对话
    .accept 1716 >> 接任务: 噬魂者
    .target 黑暗缚灵者加科因
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2NoDMEnd
    #requires Torment2NoDM
    .train 20317 >>|cRXP_WARN_使用|r |T133738:0|t[魔典：折磨（等级 2）]
    .target 斯巴克尔
    .use 16346
    .itemcount 16346,1 --Grimoire of Torment (<1)
    .train 20317,1
    .dungeon !DM
step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,38.589,81.879,20,0
    .goto 1453,37.278,81.918,12,0
    .goto 1453,36.715,80.265,12,0
    .goto 1453,37.267,78.871,12,0
    .goto 1453,38.051,78.664,12,0
    .goto 1453,38.562,79.269,12,0
    .goto 1453,38.324,80.965,12,0
    .goto 1453,37.550,81.405,8,0
    .goto 1453,38.035,81.729,6,0
    .goto 1453,37.550,82.500,10,0
    >>登上法师塔，通过绿色传送门
    .goto Stormwind City,39.681,79.538,15 >>前往 |cRXP_FRIENDLY_拉瑞麦尼·普尔度|r 处
    .dungeon !DM
step << Mage
    #xprate >1.59
    .goto Stormwind City,39.681,79.538
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉瑞麦尼·普尔度|r 对话
    .train 3561 >> 学习 |T135763:0|t[传送：暴风城]
    .target 拉瑞麦尼·普尔度
    .dungeon !DM
step << Mage/Warlock/Rogue
    #xprate >1.59
    #season 1 << Rogue
    #requires Torment2NoDMEnd << Warlock
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿古斯·夜语|r 对话
    .accept 3765 >> 接任务: 遥远的旅途
    .zoneskip Ironforge << Warrior
    .zoneskip Darkshore << Warrior
    .target 阿古斯·夜语
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .hs >> 使用炉石返回奥伯丁。 |cRXP_WARN_如果炉石处于冷却状态, 可在暴风城监狱内使用退队传送返回奥伯丁|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto StormwindClassic,39.834,54.360
    >>|cRXP_WARN_进入副本: 暴风城监狱|r
    >>|cRXP_WARN_进入后:|r
    .link /run InviteUnit("aa");C_Timer.After(1,function() LeaveParty() end) >> |cRXP_WARN_点这里把这个宏复制到聊天里, 就能直接炉石回奥伯丁|r
    .zone Darkshore >>|cRXP_WARN_如果无法完成这一步，请返回奥伯丁|r
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Ironforge
    .zoneskip Wetlands
    .cooldown item,6948,<0
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    #completewith NEWarRogNoDMIFPP
    .goto 1453,60.972,11.690,30,0
    .goto 1453,65.933,5.771
    .subzone 2257 >>进入矿道地铁
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Ironforge
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    #label NEWarRogNoDMNoFP1
    #completewith NEWarRogNoDMIFPP
    >>|cRXP_WARN_在乘坐电车时, 如果需要, 可提升你的|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    .zone Ironforge >> 乘坐矿道地铁前往铁炉堡
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    #requires NEWarRogNoDMNoFP1
    #label NEWarRogNoDMNoFP2
    #completewith NEWarRogNoDMIFPP
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考格斯宾|r 对话
    .vendor 5175 >> |cRXP_BUY_向他购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（若有货）|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .target 考格斯宾
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .bronzetube
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #requires NEWarRogNoDMNoFP2
    #label NEWarRogNoDMNoFP3
    #completewith NEWarRogNoDMIFPP
    .goto Ironforge,61.177,89.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_布里维夫·石手|r 对话
    .train 197 >> 学习双手斧（2手）
    .train 199 >> 学习双手锤（2手）
    .target 布里维夫·石手
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #requires NEWarRogNoDMNoFP3
    #label NEWarRogNoDMNoFP4
    #completewith NEWarRogNoDMIFPP
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r |T135427:0|t[重型飞刀]|cRXP_BUY_（从她那里）|r
    .collect 3108,200 << !tbc
    .collect 29009,1 << tbc
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7 << !tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.39 << tbc
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #requires NEWarRogNoDMNoFP4
    #label NEWarRogNoDMNoFP5
    #completewith NEWarRogNoDMIFPP
    +|cRXP_WARN_装备|r |T135427:0|t[重型飞刀]
    .use 3108 << !tbc
    .use 29009 << tbc
    .itemcount 3108,1 << !tbc
    .itemcount 29009,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7 << !tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.39 << tbc
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #label NEWarRogNoDMIFPP
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 对话
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r] 来开启任务|r
    .accept 968 >> 接任务: 深渊之神
    .use 5352
    .itemcount 5352,1
    .zoneskip Ironforge,1
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_葛利·硬骨|r 对话
    .turnin 968 >> 交任务: 深渊之神
    .target 葛利·硬骨
    .zoneskip Ironforge,1
    .zoneskip Wetlands
    .isOnQuest 968
    .dungeon !DM
----End of 2x Non-Deadmines Training/Class q section----
----Start of 2x Non-Deadmines (Darnassus) training section----
step << Mage/Warlock/Rogue
    #xprate >1.59
    #label NoDMStockadeEnd
    #requires Torment2NoDMEnd << Warlock
    .goto StormwindClassic,39.834,54.360
    >>|cRXP_WARN_进入副本: 暴风城监狱|r
    >>|cRXP_WARN_进入后:|r
    .link /run InviteUnit("aa");C_Timer.After(1,function() LeaveParty() end) >> |cRXP_WARN_点这里把这个宏复制到聊天里, 就能直接炉石回奥伯丁|r
    .zone Darkshore >>|cRXP_WARN_如果无法完成这一步，请返回奥伯丁|r
    .zoneskip Teldrassil << Warrior
    .zoneskip Darnassus << Warrior
    .zoneskip Ironforge
    .cooldown item,6948,<0
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 对话
    .fly Menethil >> 飞往湿地
    .zoneskip Ironforge,1
    .cooldown item,6948,<0
    .dungeon !DM
step << Warrior/NightElf Rogue
    #xprate >1.59
    #optional
    .zone Wetlands >> 前往米奈希尔港
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Darkshore
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .cooldown item,6948,<0
    .dungeon !DM
step << Warrior/NightElf Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto Wetlands,7.10,57.96,30,0
    .goto Wetlands,4.61,57.26,15 >> 前往奥伯丁船码头
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Darkshore
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .cooldown item,6948,<0
    .dungeon !DM
step << Warrior/NightElf Rogue
    #xprate >1.59
    #optional
    .goto 1437,4.370,56.762
    >>|cRXP_WARN_如果需要，可在等船前往奥伯丁时提升|r |T135966:0|t[急救] |cRXP_WARN_技能|r << Warrior/Paladin/Rogue
    .zone Darkshore >> 乘船前往奥伯丁
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Darkshore
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .cooldown item,6948,<0
    .dungeon !DM
step << !Druid
    #xprate >1.59
    #optional
    #completewith next
    .hs >> 炉石回奥伯丁
    .zoneskip Darkshore
    .subzoneskip 442
    .cooldown item,6948,>0,1
    .dungeon !DM << !Dwarf/!Hunter
----End of 2x no DM Return to Darkshore Steps----
----End of 2x Non-Deadmines (Darnassus) training section----
step << Dwarf Hunter
    #xprate <1.59
    #softcore
    #optional
    #completewith next
    .deathskip >> 刷怪直到炉石冷却时间小于 6 分钟. 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << Dwarf Hunter
    #xprate <1.59
    #hardcore
    #optional
    #completewith next
    +刷怪，直到炉石冷却时间小于9分钟，然后跑回奥伯丁
step << !NightElf !Hunter
    #xprate <1.59
    #softcore
    #optional
    #completewith next
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
step << !NightElf
    #xprate <1.59
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_桑迪斯·织风|r 对话
    .turnin 4763 >> 交任务: 黑木熊怪的堕落
    .target 桑迪斯·织风
step << !NightElf
    #xprate <1.59
    #optional
    #completewith BeachedCloak
    .destroy 12342 >> 从背包中删除 |T134059:0|t|cRXP_LOOT_[黑木谷物]|r，因为之后不再需要。
step << !NightElf
    #xprate <1.59
    #optional
    #completewith BeachedCloak
    .destroy 12343 >> 从背包中删除 |T133944:0|t|cRXP_LOOT_[黑木坚果]|r，因为之后不再需要。
step << !NightElf
    #xprate <1.59
    #optional
    #completewith BeachedCloak
    .destroy 12341 >> 从背包中删除 |T134013:0|t|cRXP_LOOT_[黑木水果]|r，因为之后不再需要。
step << !NightElf
    #xprate <1.59
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r 对话
    .turnin 2139 >> 交任务: 萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
step << !NightElf
    #xprate <1.59
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特伦希斯|r 对话
    .turnin 986 >> 交任务: 丢失的主人
    .accept 993 >> 接任务: 丢失的主人
    .target 特伦希斯
step << !NightElf
    #xprate <1.59
    #optional
    #completewith BeachedCloak
    >>|cRXP_WARN_如果装备了|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_，记得保留当前披风，因为后续交任务时这件|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_会被收走|r
    .equip 15,5387 >>|cRXP_WARN_装备|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_（如果它比你的当前披风更好）|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7
step << Dwarf Hunter
    #xprate <1.59
    #label TravelDarnDwarfHBoat
    #completewith DarnDwarfHBoat
    .goto 1439,33.169,40.179,15 >> 前往达纳苏斯船的码头
    .zoneskip Teldrassil
    .zoneskip Darnassus
step << Dwarf Hunter
    #xprate <1.59
    #optional
    #label DarnDwarfHCook1
    #requires TravelDarnDwarfHBoat
    #completewith DarnDwarfHBoat
    >>|cRXP_WARN_如果船刚到，就在船上进行下面的操作；如果船刚走，就在码头上进行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火]|cRXP_WARN_（在法术书的“通用”标签页中）|r
    .usespell 818
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step << Dwarf Hunter
    #xprate <1.59
    #optional
    #requires DarnDwarfHCook1
    #completewith DarnDwarfHBoat
    >>|cRXP_WARN_需要达到50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，才能完成之后在暮色森林的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T132832:0|t|cRXP_LOOT_[小蛋]|r|cRXP_WARN_和|r |T134059:0|t[甜香料]|cRXP_WARN_制作成|r |T132834:0|t[草药烘蛋]
    .usespell 2550
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step << Dwarf Hunter
    #xprate <1.59
    #label DarnDwarfHBoat
    .goto 1439,33.213,39.883
    .zone Teldrassil >> 乘船前往达纳苏斯
    .zoneskip Darnassus
step << Dwarf Hunter
    #xprate <1.59
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维斯派塔斯|r 对话
    .fp Teldrassil >> 获取泰达希尔飞行点
    .target 维斯派塔斯
step << Dwarf Hunter
    #xprate <1.59
    #optional
    #completewith next
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >> 穿过紫色传送门进入达纳苏斯
step << Dwarf Hunter
    #xprate <1.59
    #completewith next
    .goto Darnassus,40.38,8.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_祖卡斯特|r 对话
    .trainer >> 学习职业技能
    .target 祖卡斯特
    .dungeon !DM
step << Dwarf Hunter
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊琳尼雅·月火|r 对话
    .skipgossip 11866,1
    .goto Darnassus,57.56,46.72
    .train 264 >> 学习弓箭
    .train 227 >> 学习 [法杖]
    .target 伊琳尼雅·月火
step << Dwarf Hunter
    #xprate <1.59
    .goto Darnassus,63.27,66.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰德瑞亚|r交谈
    >>|cRXP_BUY_购买|r |T135489:0|t[重型弯弓]|cRXP_BUY_和|r |T134410:0|t[中型箭袋]|cRXP_BUY_（从她那里）|r
    .collect 3027,1 -- Heavy Recurve Bow
    .collect 11362,1 -- Medium Quiver
    .target 兰德瑞亚
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
step << Hunter
    #xprate <1.59
    #completewith next
    +|cRXP_WARN_装备|r |T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.19
    .xp <20,1
step << Dwarf Hunter
    #xprate <1.59
    .goto Teldrassil,23.70,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r 对话
    .turnin 741 >> 交任务: 健忘的勘察员
    .accept 942 >> 接任务: 健忘的勘察员
    .target 首席考古学家杜瑟·灰须
    .isOnQuest 741
step << Dwarf Hunter
    #xprate <1.59
    #optional
    .goto Teldrassil,23.70,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r 对话
    .accept 942 >> 接任务: 健忘的勘察员
    .target 首席考古学家杜瑟·灰须
    .isQuestTurnedIn 741
step << Druid
    #xprate <1.59
    #optional
	#completewith MoongladeTrain
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
step << Druid
    #xprate <1.5
    .goto Moonglade,56.2,30.4
    >>去月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德迪利特·星焰|r 对话
    .turnin 6124 >> 交任务: 消除疾病
    .accept 6125 >> 接任务: 解毒之术
    .target 德迪利特·星焰
    .isQuestTurnedIn 6123
step << Druid
    #xprate <1.59
    #label MoongladeTrain
    .goto Moonglade,52.53,40.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .trainer >> 学习职业技能
    .target 洛甘纳尔
step << NightElf/Dwarf Hunter
    #completewith BeachedCloak
    #map Darkshore
    .goto Felwood,18.50,19.87,100 >> 前往奥伯丁
    .cooldown item,6948,<0
step << NightElf/Dwarf Hunter
    #xprate <1.59
    #optional
    #completewith next
    .hs >> 炉石回奥伯丁
    .cooldown item,6948,>0,1
step
    #xprate <1.59
    #label BeachedCloak
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 对话
    .turnin 4727 >> 交任务: 搁浅的海龟
    .target 温尼斯·布莱葛
step
    #xprate <1.59
    #requires DeleteGyromast
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_古博·布拉普|r 对话
    .turnin 1138 >> 交任务: 海中的水果
    .target 古博·布拉普
    .isQuestComplete 1138
step << NightElf
    #xprate <1.59
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_桑迪斯·织风|r 对话
    .turnin 4763 >> 交任务: 黑木熊怪的堕落
    .target 桑迪斯·织风
step << NightElf
    #xprate <1.59
    #optional
    #completewith LostMasters
    .destroy 12342 >> 从背包中删除 |T134059:0|t|cRXP_LOOT_[黑木谷物]|r，因为之后不再需要。
step << NightElf
    #xprate <1.59
    #optional
    #completewith LostMasters
    .destroy 12343 >> 从背包中删除 |T133944:0|t|cRXP_LOOT_[黑木坚果]|r，因为之后不再需要。
step << NightElf
    #xprate <1.59
    #optional
    #completewith LostMasters
    .destroy 12341 >> 从背包中删除 |T134013:0|t|cRXP_LOOT_[黑木水果]|r，因为之后不再需要。
step << NightElf Hunter
    #xprate <1.59
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达蒙德|r 对话
    .vendor >> 补充 |T132382:0|t[锋利的箭]
    .target 达蒙德
step << NightElf
    #xprate <1.59
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨纳瑞恩·绿树|r 对话
    .turnin 2139 >> 交任务: 萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
step << NightElf
    #xprate <1.59
    #label LostMasters
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特伦希斯|r 对话
    .turnin 986 >> 交任务: 丢失的主人
    .accept 993 >> 接任务: 丢失的主人
    .target 特伦希斯
----End of <1.59x Turnin section----
step << NightElf
    #optional
    >>|cRXP_WARN_如果装备了|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_，记得保留当前披风，因为后续交任务时这件|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_会被收走|r
    .equip 15,5387 >>|cRXP_WARN_装备|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_（如果它比你的当前披风更好）|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7
----Start of Hunter Deadmines/All 2x Deadmines Section----
step
    #xprate <1.59 << !Hunter
    #label TravelMenethilDMBoat
    #completewith DarnDMBoat
    .goto 1439,32.432,43.744,15 >> 前往开往米奈希尔港的船只停靠的码头
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .zoneskip Wetlands
    .dungeon DM
step
    #optional
    #label DarkshoreDMCook1
    #requires TravelMenethilDMBoat
    #completewith DarnDMBoat
    >>|cRXP_WARN_如果船刚到，就在船上进行下面的操作；如果船刚走，就在码头上进行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火]|cRXP_WARN_（在法术书的“通用”标签页中）|r
    .usespell 818
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .zoneskip Wetlands
    .dungeon DM
step
    #optional
    #requires DarkshoreDMCook1
    #completewith DarnDMBoat
    >>|cRXP_WARN_需要达到50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，才能完成之后在暮色森林的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T132832:0|t|cRXP_LOOT_[小蛋]|r|cRXP_WARN_和|r |T134059:0|t[甜香料]|cRXP_WARN_制作成|r |T132834:0|t[草药烘蛋]
    .usespell 2550
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .zoneskip Wetlands
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #label DarnDMBoat
    .goto Darkshore,32.29,44.05
    >>|cRXP_WARN_现在准备出发去"死亡矿井"副本|r
    >>|cRXP_WARN_如有需要，在等候前往米奈希尔港的船时提升你的|r |T135966:0|t[急救] |cRXP_WARN_技能|r << Warrior/Paladin/Rogue
    .zone Wetlands >> 乘船前往米奈希尔港
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << Paladin/Warrior
    #ah
    #xprate >1.59
    .goto 1437,11.579,59.540,6,0
    .goto 1437,11.435,59.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_布拉克·唐纳德|r交谈
    .vendor 1441 >>|cRXP_BUY_有货且资金足够时，向他购买一把|r |T135329:0|t[刽子手之剑] |cRXP_BUY_|r
    >>|cRXP_WARN_或者，可以稍后去拍卖行看看有没有更好的或更便宜的物品|r
    .collect 4818,1,2040,1 --Collect Executioner's Sword (1)
    .disablecheckbox
    .target 布拉克·唐纳德
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .itemcount 4818,<1 --Executioner's Sword (<1)
    .dungeon DM
step << Paladin/Warrior
    #ssf
    #optional
    #xprate >1.59
    .goto 1437,11.579,59.540,6,0
    .goto 1437,11.435,59.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_布拉克·唐纳德|r交谈
    >>|cRXP_BUY_有货且资金足够时，向他购买一把|r |T135329:0|t[刽子手之剑] |cRXP_BUY_|r
    >>|cRXP_BUY_如果没有刽子手之剑，就向他购买一把|r |T135280:0|t[微光重剑]|cRXP_BUY_（如果买得起）|r
    .collect 4818,1,2040,1 --Collect Executioner's Sword (1)
    .disablecheckbox
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target 布拉克·唐纳德
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8 --Intentionally lower than Falx so people don't buy the Falx if they have Executioners
    .itemcount 922,<1 --Dacian Falx (<1)
    .itemcount 4818,<1 --Executioner's Sword (<1)
    .dungeon DM
step << Paladin/Warrior !NightElf
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    +|cRXP_WARN_装备|r |T135329:0|t[刽子手之剑]
    .use 4818
    .itemcount 4818,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
step << Paladin/Warrior !NightElf
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
    .xp <21,1
step << !NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r 对话
    .fly Ironforge >> 飞往铁炉堡
    .target 谢尔雷·布隆迪尔
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_谢尔雷·布隆迪尔|r 对话
    .fp Menethil Harbor >> 获取米奈希尔港飞行点
    .target 谢尔雷·布隆迪尔
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Wetlands,5.485,64.156,40 >> 从码头尽头跳进水里, 游向坐标点
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Wetlands,2.433,78.689,-1
    .goto Ironforge,17.089,83.373,-1
    .zone Ironforge >>使用角色解困自助服务功能跳转到铁炉堡。到达该位置后先登出，再用另一个角色打开帮助菜单（也可将下方的解困链接粘贴到浏览器中），向下滚动到“自助服务”，选择该角色并点击“移动”。如果无法使用解困服务，就跳过此步，沿山脉游向西部荒野。
    .link https://www.youtube.com/watch?v=oVoxsr4zcg4 >> 点击这里查看视频参考
    .link https://us.battle.net/support/en/help/product/wow/197/834/solution >> 点击此处打开角色解困链接
    .subzoneskip 809 --IF Gates
    .subzoneskip 2257 --Deeprun Tram
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon DM
----Start of Hunter/All Night Elves 2x Deadmines swim to Westfall Alternative section----
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto 1415,44.720,49.200,60,0 -- Wetlands to Westfall Swim
    .goto 1415,43.162,49.946,60,0
    .goto 1415,42.564,50.884,20,0
    .goto 1415,42.363,50.812,20,0
    .goto 1415,41.682,50.232,20,0
    .goto 1415,40.959,50.142,20,0
    .goto 1415,39.818,51.078,20,0
    .goto 1415,39.778,51.615,30,0
    .goto 1415,39.505,52.636,30,0
    .goto 1415,40.160,54.451,20,0
    .goto 1415,40.505,54.507,20,0
    .goto 1415,41.370,57.126,40,0
    .goto 1415,41.988,59.434,30,0
    .goto 1415,41.342,61.214,30,0
    .goto 1415,41.309,61.938,20,0
    .goto 1415,40.545,64.111,30,0
    .goto 1415,41.066,65.878,20,0
    .goto 1415,41.349,66.265,30,0
    .goto 1415,41.363,66.995,30,0
    .goto 1415,41.625,67.689,30,0
    .goto StormwindClassic,4.493,29.157,20,0
    .goto StormwindClassic,10.336,40.166,10,0
    .goto StormwindClassic,7,45.471,10,0
    .goto StormwindClassic,5.560,50.125,10,0
    .goto StormwindClassic,13.669,74.499,20,0
    .goto Westfall,42.024,70.980
    .zone Westfall >> 如果网站解困服务不可用，就游泳前往西部荒野
    .zoneskip Ironforge
    .subzoneskip 809--IF Gates
    .subzoneskip 2257--Deeprun Tram
    .zoneskip Stormwind City
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Westfall,54.28,9.26,100,0
    .goto Westfall,56.55,52.64,100 >> 上岸后前往哨兵岭
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fp Sentinel Hill >> 获取哨兵岭飞行点
    .target 索尔
    .zoneskip Ironforge --Skips if you didn't swim from Wetlands
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .accept 65 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
    .zoneskip Westfall,1
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Elwynn Forest,36.809,72.429,100,0
    .goto StormwindClassic,69.961,86.583
    .zone Stormwind City >> 跑向暴风城
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .dungeon DM
step << NightElf Priest
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 处
    .zoneskip Stormwind City,1
    .dungeon DM
step << NightElf Priest
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 对话
    .trainer >> 学习职业技能
    .target 高阶牧师劳瑞娜
    .zoneskip Stormwind City,1
    .dungeon DM
--XX Alt if NE priest cant website unstuck
----End of Hunter/All Night Elves 2x Deadmines swim to Westfall Alternative (and Alt NE Priest Training) section----
step << NightElf Warrior/NightElf Hunter
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,61.177,89.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_布里维夫·石手|r 对话
    .train 197 >> 学习双手斧（2手） << Warrior
    .train 199 >> 学习双手锤（2手） << Warrior
    .train 266 >> 学习枪械 << Hunter
    .target 布里维夫·石手
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #optional
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]|cRXP_BUY_（向她购买）|r
    .collect 3107,1 << !tbc
    .collect 25873,1 << tbc
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    +|cRXP_WARN_装备|r |T135425:0|t[锋利的飞刀（燃烧的远征：锐利的飞刀）]
    .use 3107 << !tbc
    .use 25873 << tbc
    .itemcount 3107,1 << !tbc
    .itemcount 25873,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 对话
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r] 来开启任务|r
    .accept 968 >> 接任务: 深渊之神
    .use 5352
    .itemcount 5352,1
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << NightElf
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_葛利·硬骨|r 对话
    .turnin 968 >> 交任务: 深渊之神
    .target 葛利·硬骨
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isOnQuest 968
    .dungeon DM
step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .goto Ironforge,28.70,25.58,12,0
    .goto Ironforge,29.60,26.62,10,0
    .goto Ironforge,30.50,26.58,10,0
    .goto Ironforge,31.32,27.80,12 >>前往屋内的|cRXP_FRIENDLY_吉恩|r处
    .dungeon DM
step << Mage
    #xprate >1.59
    .goto Ironforge,31.32,27.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_吉恩|r交谈
    >>|cRXP_BUY_向她购买并补足至4个|r |T134419:0|t[传送符文]|cRXP_BUY_。|r
    .collect 17031,4 --Rune of Teleportation (4)
    .target 吉恩
    .dungeon DM
step << Mage
    #xprate >1.59
    #label MilstaffDM
    .goto Ironforge,25.50,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贝尔斯塔弗·风暴之眼|r 对话
    .train 3562 >> 学习 |T135757:0|t[传送：铁炉堡]
    .target 贝尔斯塔弗·风暴之眼
    .dungeon DM
step << Mage
    #xprate >1.59
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_丁克|r 对话
    .trainer >> 学习职业技能
    .target 丁克
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional << NightElf
    .goto Ironforge,25.207,10.756
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托德雷·铁矿|r 对话
    .trainer >> 学习职业技能
    .target 托德雷·铁矿
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << skip --logout skip Mage/Priest
    #xprate >1.59
    #optional
    #requires MilstaffDM << Mage
    #completewith DeeprunDM
    .goto 1455,27.611,8.074
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳上|cRXP_FRIENDLY_彬克|r上方的柱顶，稍向东走到箭头位置，调整角色直到看起来像在漂浮，然后登出再重新登录，利用登出机制走捷径|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << skip --Warlock
    #xprate >1.59
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑞尔索恩|r 对话
    .trainer >> 学习职业技能
    .target 布瑞尔索恩
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << skip --Warlock
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    .goto 1455,53.164,7.037,10 >> 进入 |cRXP_FRIENDLY_寻尸者祖贝尔|r 的房子
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
step << skip --Warlock
    #xprate >1.59
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_寻尸者祖贝尔|r 对话
    .vendor 6382 >> |cRXP_BUY_购买|r |T133738:0|t[魔典] |cRXP_BUY_供宠物使用（如有需要）|r
    .target 寻尸者祖贝尔
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << skip --logout skip skip --Warlock
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    .goto 1455,52.825,5.060
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶，然后跳到书架顶。登出后再重新登录，利用登出机制走捷径|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << !Mage !Priest
    #xprate >1.59 << !Hunter
    #completewith DeeprunDM
    #optional
    .goto 1455,53.164,7.037,10 >> 进入 |cRXP_FRIENDLY_寻尸者祖贝尔|r 的房子
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestTurnedIn 968
    .dungeon DM
step << skip --logout skip !Mage !Priest
    #xprate >1.59 << !Hunter
    #completewith DeeprunDM
    #optional
    .goto 1455,52.825,5.060
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶，然后跳到书架顶。登出后再重新登录，利用登出机制走捷径|r
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestTurnedIn 968
    .dungeon DM
step << skip --NightElf Hunter/NightElf Warrior
    #xprate >1.59 << !Hunter
    #optional
    #completewith DeeprunDM
    .goto 1455,60.975,90.479
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_按箭头指示，走到|cRXP_FRIENDLY_布里维夫·石手|r身旁的栏杆上。调整位置，直到角色看起来悬空，再退出并重新登录，完成登出跳过|r
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestAvailable 968
    .dungeon DM
step << skip --logout skip !Mage !Priest
    #xprate >1.59 << !Hunter
    #completewith DeeprunDM
    #optional
    .goto 1455,56.207,46.844
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到狮鹫头顶，然后登出再重新登录，利用登出机制走捷径|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .isQuestAvailable 968
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #requires MilstaffDM << Mage
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考格斯宾|r 对话
    .vendor 5175 >> |cRXP_BUY_向他购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（若有货）|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .target 考格斯宾
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .subzoneskip 2257
    .bronzetube
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #requires MilstaffDM << Mage
    #label DeeprunDM
    .goto Ironforge,78.00,51.40
    .subzone 2257 >>进入矿道地铁
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << NightElf
    #completewith ShoniAccept
    >>|cRXP_WARN_在乘坐电车时, 如果需要, 可提升你的|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_你的|r|T135966:0|t[急救]|cRXP_WARN_需要达到至少80点，才能做后面的任务|r << Rogue !Dwarf
    .zone Stormwind City >> 乘坐矿道地铁前往暴风城
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Westfall
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利巴布·旋轮|r 对话
    .vendor 5519 >> |cRXP_BUY_向他购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（若有货）|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 比利巴布·旋轮
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label ShoniAccept
    .goto StormwindClassic,55.510,12.504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沉默的舒尼|r 对话
    .accept 2040 >> 接任务: 地底突袭
    .target 沉默的舒尼
    .dungeon DM
step << Human
    #xprate >1.59
    .goto StormwindClassic,58.08,16.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗伦·长须|r 对话
    .turnin 1338 >> 交任务: 卡尔·雷矛的订单
    .target 弗伦·长须
    .isOnQuest 1338
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔德·蓟草|r 对话
    .accept 167 >> 接任务: 我的兄弟……
    .accept +168 >> 接任务: 收集记忆
    .goto StormwindClassic,65.438,21.175
    .target 维尔德·蓟草
    .dungeon DM
step << Hunter
--   #xprate >1.59
    #sticky
    #label DMPetTrain
    .goto 1453,61.576,15.998
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_卡瑞娜·麦肯达|r 对话
    .trainer 2879 >> 学习宠物技能
    .target 卡瑞娜·麦肯达
    .dungeon DM
step << Hunter
--   #xprate >1.59
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进去与 |cRXP_FRIENDLY_恩瑞斯·锐矛|r 交谈
    .trainer 5515 >> 学习职业技能
    .target 恩瑞斯·锐矛
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #requires DMPetTrain << Hunter
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_维尔德·蓟草|r 对话
    .accept 167 >> 接任务: 我的兄弟……
    .accept 168 >> 接任务: 收集记忆
    .target 维尔德·蓟草
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith RogueTrainDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    >>|cRXP_WARN_如果你有闲钱，可以学习|r |T132282:0|t[伏击] |cRXP_WARN_，前提是已装备或背包里有一把|r |T135641:0|t[匕首] |cRXP_WARN_。之后能节省时间|r
    .train 8676 >> 学习 |T132282:0|t[伏击]
    .target 夜行者奥斯伯
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    >>|cRXP_WARN_确保学习|r |T132320:0|t[潜行]|cRXP_WARN_、|r |T133644:0|t[搜索]|cRXP_WARN_和|r |T136058:0|t[开锁] |cRXP_WARN_后续会用到|r
    .train 1784 >>学习 |T132320:0|t[潜行]
    .train 921 >>学习 |T133644:0|t[搜索]
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon DM
    .train 1784,1
    .train 921,1
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    >>|cRXP_WARN_确保学习|r |T133644:0|t[搜索]|cRXP_WARN_和|r |T136058:0|t[开锁] |cRXP_WARN_后续会用到|r
    .train 921 >>学习 |T133644:0|t[搜索]
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon DM
    .train 921,1
step << Rogue
    #xprate >1.59
    #label RogueTrainDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    >>|cRXP_WARN_务必学习|r |T136058:0|t[开锁] |cRXP_WARN_，因为之后会用到|r
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.799,53.815,15,0
    .goto 1453,77.290,58.138,12,0
    .goto 1453,78.466,60.034,12,0
    .goto 1453,78.560,58.435,6,0
    .goto 1453,75.754,60.369,12 >> 前往军情七处 (SI:7) 楼上找 |cRXP_FRIENDLY_“剃刀”雷吉克|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔|r
    .dungeon DM
step << Rogue
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_“剃刀”雷吉克|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 对话
    .accept 2281 >> 接任务: 赤脊山的联络员
    .goto StormwindClassic,75.76,60.35
    .target +“剃刀”雷吉克
    .accept 2360 >> 接任务: 马迪亚斯和迪菲亚潜行者
    .goto StormwindClassic,75.78,59.84
    .target +马迪亚斯·肖尔
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >> 前往旧城区指挥中心内的 |cRXP_FRIENDLY_武神|r 处
    .dungeon DM
step << Warrior
    #xprate >1.59
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_武神|r 交谈
    .trainer >> 学习职业技能
    .target 武神
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吴平|r 对话（武器大师）
    .train 201 >> 学习单手剑（1手） << Mage/Rogue/Warlock
    .train 1180 >> 学习匕首技能 << Mage/Druid/Priest
    .train 202 >> 学习双手剑（2手） << Warrior/Paladin/Hunter
    .target 吴平
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r |T135329:0|t[刽子手之剑]
    .use 4818
    .itemcount 4818,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
step << Rogue
    #xprate >1.59
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_向她购买|r |T135324:0|t[长剑]|cRXP_BUY_，或在拍卖行寻找更好或更便宜的替代品|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
    .dungeon DM
step << Rogue
    #xprate >1.59
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_购买|r |T135324:0|t[长剑]|cRXP_BUY_（若买得起，从她那里）|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,42.917,34.221,15,0
    .goto 1453,41.385,31.547,15,0
    .goto 1453,39.810,29.788,15
    .goto StormwindClassic,42.51,33.51,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 处
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈。他会给你一本 |T133739:0|t[|cRXP_LOOT_勇气之书|r]
    .use 6776 >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_勇气之书|r]开启任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务: 勇气之书
    .target 达索瑞恩·拉尔
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1649 >>交任务: 勇气之书
    .accept 1650 >>接任务: 勇气之书
    .target 达索瑞恩·拉尔
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 对话
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿古斯·夜语|r 对话
    .accept 3765 >> 接任务: 遥远的旅途
    .target 阿古斯·夜语
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #ah
    #optional
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_向她购买一把|r |T135280:0|t[微光重剑]|cRXP_BUY_，或去拍卖行寻找更好或更便宜的武器|r
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target 玛尔达·维勒
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.0 --Arbitrary number lower than Falx/Exe
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #optional
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .xp <21,1
    .dungeon DM
step << Warlock/Priest
    #xprate >1.59
    #ah
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    .vendor 1312 >>|cRXP_BUY_购买|r |T135469:0|t[黄昏魔杖]|cRXP_BUY_，前提是你买得起；向她购买|r
    >>|cRXP_BUY_或者，从拍卖行购买|r |T135144:0|t[强效魔法杖]|cRXP_BUY_，前提是价格低于52银47铜|r
    .collect 5211,1 --Dusk Wand (1)
    .disablecheckbox
    .target 阿德温·凯伦
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon DM
step << Warlock/Priest
    #xprate >1.59
    #ssf
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_BUY_购买|r |T135469:0|t[黄昏魔杖]|cRXP_BUY_（从她那里）|r
    .collect 5211,1 --Dusk Wand (1)
    .target 阿德温·凯伦
    .money <0.5247
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon DM
step << Warlock/Priest
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r |T135469:0|t[黄昏魔杖]
    .use 5211
    .itemcount 5211,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon DM
step << Warlock/Priest
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r |T135144:0|t[强效魔法杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 进入“屠羊酒馆”，下楼
    .dungeon DM
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r对话
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
    .dungeon DM
step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2DM
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯巴克尔|r交谈
    .vendor >>|cRXP_BUY_购买|r |T133738:0|t[魔典：折磨（等级 2）]|cRXP_BUY_（从她那里）|r
    .target 斯巴克尔
    .itemcount 16346,<1 --Grimoire of Torment (<1)
    .train 20317,1
    .dungeon DM
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 对话
    .accept 1716 >> 接任务: 噬魂者
    .target 黑暗缚灵者加科因
    .dungeon DM
step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2DMEnd
    #requires Torment2DM
    .train 20317 >>|cRXP_WARN_使用|r |T133738:0|t[魔典：折磨（等级 2）]
    .target 斯巴克尔
    .use 16346
    .itemcount 16346,1 --Grimoire of Torment (<1)
    .train 20317,1
    .dungeon DM
step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,38.589,81.879,20,0
    .goto 1453,37.278,81.918,12,0
    .goto 1453,36.715,80.265,12,0
    .goto 1453,37.267,78.871,12,0
    .goto 1453,38.051,78.664,12,0
    .goto 1453,38.562,79.269,12,0
    .goto 1453,38.324,80.965,12,0
    .goto 1453,37.550,81.405,8,0
    .goto 1453,38.035,81.729,6,0
    .goto 1453,37.550,82.500,10,0
    >>登上法师塔，通过绿色传送门
    .goto Stormwind City,39.681,79.538,15 >>前往 |cRXP_FRIENDLY_拉瑞麦尼·普尔度|r 处
    .dungeon DM
step << Mage
    #xprate >1.59
    .goto Stormwind City,39.681,79.538
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉瑞麦尼·普尔度|r 对话
    .train 3561 >> 学习 |T135763:0|t[传送：暴风城]
    .target 拉瑞麦尼·普尔度
    .dungeon DM
step << !Paladin
    #xprate >1.59
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿古斯·夜语|r 对话
    .accept 3765 >> 接任务: 遥远的旅途
    .target 阿古斯·夜语
    .dungeon DM
step << Druid
    #xprate >1.59
    .goto 1453,20.883,55.505
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沙德拉斯·月树|r 对话
    .train 6756 >> 学习职业技能
    .target 沙德拉斯·月树
    .dungeon DM
step << Hunter
--  #xprate >1.59
    #optional
    #completewith next
    .goto 1453,50.929,57.781,10 >>进入贸易区中环内出售弓和箭袋的商店
    .dungeon DM
step << Hunter
--  #xprate >1.59
    #ssf
    .goto 1453,49.962,57.638
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_购买|r |T135489:0|t[重型弯弓]|cRXP_BUY_和|r |T134410:0|t[中型箭袋]|cRXP_BUY_（从他那里）|r
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .collect 11362,1 -- Medium Quiver (1)
    .target 弗德瑞克·斯图瓦
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
    .dungeon DM
step << Hunter
--  #xprate >1.59
    #ah
    .goto 1453,49.962,57.638
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_购买|r |T135489:0|t[重型弯弓]|cRXP_BUY_和|r |T134410:0|t[中型箭袋]|cRXP_BUY_，可向他购买，或在拍卖行寻找更好或更便宜的替代品|r
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .collect 11362,1 -- Medium Quiver (1)
    .target 弗德瑞克·斯图瓦
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
    .dungeon DM
step
    #xprate >1.59
    #ah
    #softcore
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买 |T134437:0|t[抗毒药剂]用于稍后的 |T132290:0|t[毒药]职业任务，其余物品用于稍后在赤脊山更快地交任务 << !Dwarf Rogue
    >>购买以下物品，以便稍后在赤脊山和西部荒野更快交任务 << Paladin
    >>购买以下物品，以便稍后在赤脊山更快地交任务 << !Paladin !Rogue/Dwarf Rogue
    >>这样可节省找怪时间。如果不想购买任何物品，请跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf Rogue
    >>|T132794:0|t[灯油] << Paladin
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 814,5,103,1 << Paladin -- Flask of Oil (5)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target 拍卖师亚克森
    .dungeon DM
step
    #xprate >1.59
    #ah
    #hardcore
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买 |T134437:0|t[抗毒药剂]，用于稍后的 |T132290:0|t[毒药]任务；其余物品也一并购买，以便之后在赤脊山和西部荒野更快交任务。 << !Dwarf Rogue
    >>购买以下物品，以便稍后在赤脊山和西部荒野更快交任务 << !Rogue/Dwarf Rogue
    >>这样可节省找怪时间。如果不想购买任何物品，请跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf Rogue
    >>|T132794:0|t[灯油]
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 814,5,103,1 -- Flask of Oil (5)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target 拍卖师亚克森
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #completewith GryanAll << Human
    #optional << Human
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fp Stormwind >> 获取暴风城飞行点 << !Human
    .fly Westfall >> 飞往西部荒野 << Human
    .target 杜加尔·朗德瑞克
    .zoneskip Westfall << Human
    .dungeon DM
step << !Human
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .zone Westfall >> 前往西部荒野
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label GryanAll << Human
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .accept 65 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << Human/Warlock
    #requires Torment2DMEnd << Warlock
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fp Sentinel Hill >> 获取哨兵岭飞行点 << !Human
    .fly Redridge >> 飞往赤脊山 << Human/Warlock
    .target 索尔
    .zoneskip Westfall,1
    .dungeon DM
step << Human
    #xprate >1.59
    #optional
    #completewith WileyStart
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fly Redridge >> 飞往赤脊山
    .target 杜加尔·朗德瑞克
    .zoneskip Stormwind City,1
    .dungeon DM
    .isOnQuest 65
step << !Human !Warlock
    #xprate >1.59 << !Hunter
    .goto Elwynn Forest,65.20,69.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与阿祖拉之塔顶的 |cRXP_FRIENDLY_塞欧克瑞图斯|r 对话
    .accept 94 >> 接任务: 法师的眼线
    .target 塞欧克瑞图斯
    .dungeon DM
    .xp <20,1
step << !Human !Warlock
    #xprate >1.59 << !Hunter
    #optional
    #completewith WileyStart
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >> 前往赤脊山
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_厨师布雷纳|r 对话
    .accept 92 >> 接任务: 赤脊山炖肉
    .turnin 92 >> 交任务: 赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target 厨师布雷纳
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label WileyStart
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_黑衣威利|r 对话
    .turnin 65 >> 交任务: 迪菲亚兄弟会
    .accept 132 >> 接任务: 迪菲亚兄弟会
	.target 黑衣威利
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2281 >> 交任务: 赤脊山的联络员
    .accept 2282 >> 接任务: 奥瑟尔伐木场
    .target 卢修斯
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_必须完成这一步，才能进行后续的|r |T132290:0|t[毒药]|cRXP_WARN_任务|r
    >>|cRXP_WARN_站在路点位置，调整镜头和鼠标位置，使你无需移动即可点击 3 个|cRXP_PICK_练习用保险箱|r|r
    .skill lockpicking,80 >>|cRXP_WARN_打开奥瑟尔伐木场地面上的|cRXP_PICK_练习用保险箱|r，直到你的|r |T136058:0|t[开锁]技能达到 80|r
    .dungeon DM
step << Rogue
    #xprate >1.59
	.goto Redridge Mountains,52.05,44.69
    >>打开|cRXP_PICK_卢修斯的箱子|r，获取|cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery (1)
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2282 >> 交任务: 奥瑟尔伐木场
    .target 卢修斯
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith DefiasWestfall2
    .destroy 7907 >> 从背包中删除 |T134328:0|t[偷窃技能认证书]，因为之后不再需要
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << Human/Warlock
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 对话
    .fp Redridge Mountains >> 获取赤脊山飞行点 << !Human !Warlock
    .fly Westfall >> 飞往西部荒野
    .target 艾蕾娜·斯托姆法瑟
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label DefiasWestfall2
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 132 >> 交任务: 迪菲亚兄弟会
    .accept 135 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith KlavenFinish
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    .goto Duskwood,15.90,72.10,60,0
    .goto Duskwood,14.86,64.56,50,0
    .goto Duskwood,10.43,53.97
    >>击杀|cRXP_ENEMY_小型结网毒蜘蛛|r和|cRXP_ENEMY_结网毒蜘蛛|r，拾取|cRXP_LOOT_小毒囊|r和|cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_需要|cRXP_LOOT_小毒囊|r，之后用它制作|r |T134437:0|t[抗毒药剂]|cRXP_WARN_，以移除后续任务施加的|r |T136230:0|t[赞吉尔之触]|cRXP_WARN_减益效果|r
    >>|cRXP_WARN_把|cRXP_LOOT_粘糊的蜘蛛腿|r留着以后用|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r|cRXP_WARN_朋友，可以跳过此步骤，稍后请他们帮你移除减益效果|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob 小型结网毒蜘蛛
    .mob 结网毒蜘蛛
    .itemcount 6452,<1 --Anti Venom (<1)
    .isQuestAvailable 2359
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请注意即将出现的章节==|r
    >>|cRXP_WARN_按 Esc 键，进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选"启用互动按键"，并将"与目标互动"选项绑定至一个快捷键|r
    >>|cRXP_WARN_另外，建议开启"显示敌方姓名板"（默认快捷键：V），这样你就能隔墙看到塔内转角处的敌人了|r
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_密探吉尔妮|r 对话
    >>|cRXP_WARN_你必须完成这个任务才能获得|r |T132290:0|t[毒药]
    .turnin 2360 >> 交任务: 马迪亚斯和迪菲亚潜行者
    .accept 2359 >> 接任务: 克拉文之塔
    .target 密探吉尔妮
    .dungeon DM
step << Rogue
    #xprate >1.59
    #label TowerKey
    #loop
    .goto Westfall,71.49,73.49,0
    .goto Westfall,71.01,75.72,0
    .goto Westfall,69.58,73.07,0
    .goto Westfall,71.49,73.49,30,0
    .goto Westfall,71.01,75.72,30,0
    .goto Westfall,69.58,73.07,30,0
    >>|T133644:0|t[搜索] |cRXP_ENEMY_丑陋的迪菲亚懒汉|r, 获取 |cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_你必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    >>|cRXP_WARN_|cRXP_ENEMY_丑陋的迪菲亚懒汉|r 会在塔楼入口刷新，然后在塔外巡逻|r
    >>|cRXP_WARN_小心，他的伤害很高。如果你的|r |T132320:0|t[潜行] |cRXP_WARN_被打破，立刻使用|r |T132307:0|t[疾跑] |cRXP_WARN_逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 丑陋的迪菲亚懒汉
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith Mortwake
    +|cRXP_WARN_为此任务装备|r |T135641:0|t[曲木匕首]|cRXP_WARN_，前提是你尚未装备|r |T135641:0|t[匕首]|cRXP_WARN_ |r
    .use 15396
    .itemcount 15396,1
    .dungeon DM
step << Rogue
    #xprate >1.59
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼从上往下第2层。在|r |T132320:0|t[潜行] |cRXP_WARN_状态下，且 |cRXP_ENEMY_迪菲亚哨兵|r 不在身旁时，跳到椅子上，再跳到灯上，最后跳到路标位置上方的书架上|r
    >>|cRXP_WARN_手动|r |T132320:0|t[取消潜行]|cRXP_WARN_，然后按下“与目标互动”快捷键打开|cRXP_PICK_暮色森林的箱子|r，拾取其中的|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_注意: 你的|r |T132320:0|t[潜行] |cRXP_WARN_在拾取后会暂时失效, 因为你拿到了|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_如果你在第2层没有击杀 |cRXP_ENEMY_迪菲亚哨兵|r，请做好逃跑的准备。当你站在书架顶部时，他们很可能会一直对你产生仇恨 (但不会攻击你) ，因为那里是一个怪物无法攻击的位置|r
    >>|cRXP_WARN_如果背包里或已装备|r |T135641:0|t[匕首]|cRXP_WARN_，你可以施放|r |T132282:0|t[伏击] |cRXP_WARN_瞬间击杀塔内的|cRXP_ENEMY_迪菲亚巡塔员|r和|cRXP_ENEMY_迪菲亚哨兵|r。击杀第一个|cRXP_ENEMY_迪菲亚哨兵|r后准备逃跑，并记住可能受到来自上方的攻击。这种方法较慢，但安全得多|r
    >>|cRXP_WARN_如果必须跑出塔楼，小心入口处可能出现的|cRXP_ENEMY_丑陋的迪菲亚懒汉|r和|cRXP_ENEMY_迪菲亚苦工|r|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 迪菲亚巡塔员
    .mob 迪菲亚哨兵
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包里的 |T134437:0|t[抗毒药剂]移除 |T136230:0|t[赞吉尔之触]减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon DM
step << Dwarf Rogue
    #xprate >1.59
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石像形态]移除 |T136230:0|t[赞吉尔之触]减益效果|r
    .aura -9991
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith KlavenFinish
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fly Stormwind >> 飞往暴风城
    .target 索尔
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >> 前往 |cRXP_FRIENDLY_珊娜·弗勒|r 处
    .aura -9991
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊娜·弗勒|r 对话
    >>|cRXP_WARN_如果你有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以请他们帮你移除|r |T136230:0|t[赞吉尔之触]|cRXP_WARN_ |r
    .skill firstaid,80 >> |cRXP_WARN_将|r |T135966:0|t[急救] |cRXP_WARN_练到80点|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊娜·弗勒|r 对话
    >>|cRXP_WARN_如果你有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以请他们帮你移除|r |T136230:0|t[赞吉尔之触]|cRXP_WARN_ |r
    .train 7934 >> |cRXP_WARN_学习|r |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包里的 |T134437:0|t[抗毒药剂]移除 |T136230:0|t[赞吉尔之触]减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon DM
step
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,10 >> 进入军情七处（SI:7）总部，上楼前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r处
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label KlavenFinish
    .goto Stormwind City,75.78,59.84
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 对话
    >>|cRXP_WARN_如果你之前换用了|r |T135641:0|t[匕首]|cRXP_WARN_，记得重新装备主武器|r << Rogue
    .turnin 135 >> 交任务: 迪菲亚兄弟会
    .accept 141 >> 接任务: 迪菲亚兄弟会
    .turnin 2359 >> 交任务: 克拉文之塔 << Rogue
    .target 马迪亚斯·肖尔
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith BandanaStart
    +开始为死亡矿井集结队伍
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 141 >> 交任务: 迪菲亚兄弟会
    .accept 142 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Westfall,44.50,69.62,55 >> 前往月溪镇
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,44.50,69.62
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>击杀|cRXP_ENEMY_迪菲亚信使|r，拾取|cRXP_LOOT_神秘的信件|r
    >>|cRXP_WARN_|cRXP_ENEMY_迪菲亚信使|r 会在月溪镇刷新. 他会沿着月溪镇以北的道路前往金海岸矿洞和詹戈洛德矿洞. 如果在路上没有看到他, 请等待他在月溪镇重新刷新|r
    >>|cRXP_WARN_他的刷新时间大约是 4 到 5 分钟|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan 迪菲亚信使
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 142 >> 交任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,55.68,47.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪菲亚叛徒|r 对话
    >>|cRXP_WARN_如果他不在, 你可能得等一下 |cRXP_FRIENDLY_迪菲亚叛徒|r 刷新|r
    >>|cRXP_WARN_如果你已经组好队了, 确保所有队友都交了前一步任务后再开启护送|r
    .accept 155 >> 接任务: 迪菲亚兄弟会
    .target 迪菲亚叛徒
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,42.56,71.71
    >>护送|cRXP_FRIENDLY_迪菲亚叛徒|r前往死亡矿井
    >>|cRXP_WARN_始终待在|cRXP_FRIENDLY_迪菲亚叛徒|r身边。抵达月溪镇后，随时准备对抗|cRXP_ENEMY_迪菲亚抢劫者|r和|cRXP_ENEMY_迪菲亚强夺者|r|r
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target 迪菲亚叛徒
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 155 >> 交任务: 迪菲亚兄弟会
    .accept 166 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label BandanaStart
    .goto Westfall,56.67,47.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的 |cRXP_FRIENDLY_哨兵瑞尔|r 对话
    .accept 214 >> 接任务: 红色丝质面罩
    .target 哨兵瑞尔
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto 1436,56.454,69.982,0
    .goto 1436,56.434,74.339,0
    .goto 1436,59.384,74.184,0
    .goto 1436,60.871,74.362,0
    .goto 1436,60.902,77.640,0
    .goto 1436,63.442,77.339,0
    .goto 1436,65.203,75.286,0
    .goto 1436,63.594,72.862,0
    .goto 1436,63.825,70.125,0
    .goto 1436,42.649,71.376
    >>|cRXP_WARN_组建死亡矿井队伍的同时，在哨兵岭南侧刷|cRXP_ENEMY_豺狼人|r获取经验|r
    .subzone 20 >>组好人后, 前往月溪镇
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,42.55,71.69
    .subzone 1581 >> 和你的队伍一起进入迪菲亚藏身处
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith EnterDM
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
    .xp <21,1
step << Rogue
    #xprate >1.59
    #optional
    #completewith EnterDM
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #completewith EnterDM
    >>击杀|cRXP_ENEMY_迪菲亚|r，拾取|cRXP_LOOT_红色丝质面罩|r
    >>|cRXP_WARN_这一部分也可以在死亡矿井副本里面做|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #completewith next
    >>击杀|cRXP_ENEMY_骷髅矿工|r、|cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r，拾取掉落的|cRXP_LOOT_卡片|r
    >>|cRXP_WARN_这一步要在副本外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_工头希斯耐特|r，拾取|cRXP_LOOT_徽章|r
    >>|cRXP_WARN_这一步要在副本外完成|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan 工头希斯耐特
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_骷髅矿工|r、|cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r，拾取掉落的|cRXP_LOOT_卡片|r
    >>|cRXP_WARN_这一步要在副本外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label EnterDM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >> 进入"死亡矿井"副本
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #softcore
    #optional
    #completewith VanCleef << !Paladin
    #completewith DeadminesBackdoor << Paladin
    >>击杀死亡矿井内的|cRXP_ENEMY_迪菲亚|r，拾取|cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #hardcore
    #optional
    #completewith DeadminesBackdoor
    >>击杀死亡矿井内的|cRXP_ENEMY_迪菲亚|r，拾取|cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    >>击杀|cRXP_ENEMY_斯尼德|r，拾取|cRXP_LOOT_小型高能发动机|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith VanCleef
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
    .xp <21,1
step << Rogue
    #xprate >1.59
    #optional
    #completewith VanCleef
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label VanCleef
    >>击杀|cRXP_ENEMY_艾德温·范克里夫|r，拾取|cRXP_LOOT_头颅|r和 |T133471:0|t[|cRXP_LOOT_未寄出的信|r]
    .collect 2874,1,373,1 -- An Unsent Letter (1)
    .complete 166,1 -- Head of VanCleef (1)
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #hardcore << !Paladin
    #optional
    #label DeadminesBackdoor
    #completewith DeadminesEnd
    .goto 1436,38.909,84.014
    >>|cRXP_WARN_询问队友能否留下来，稍后帮你完成圣骑士专属的|cRXP_FRIENDLY_达芙妮·斯迪威尔|r护送任务（如果可以的话）|r << Paladin
    .subzone 920 >>从|cRXP_ENEMY_艾德温·范克里夫|r东侧的后门离开死亡矿井
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1436,39.444,85.755
    .goto 1436,40.010,86.514,20 >> 前往 |cRXP_FRIENDLY_达芙妮·斯迪威尔|r 的田地
    .dungeon DM
step << Paladin
    #xprate >1.59
    #loop
    .goto 1436,41.645,88.729,0
    .goto 1436,41.196,89.173,10,0
    .goto 1436,41.696,89.244,10,0
    .goto 1436,41.645,88.729,10,0
    .goto 1436,41.461,88.498,10,0
    .goto 1436,41.311,88.506,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与田地里的 |cRXP_FRIENDLY_达芙妮·斯迪威尔|r 对话，开始护送任务
    >>|cRXP_WARN_她会在田里附近小范围巡逻|r
    >>|cRXP_WARN_小心，这项护送稍有难度。你将面对 3 波敌人，数量依次为 3、4、5 个，都是 17-18 级的 |cRXP_ENEMY_迪菲亚袭击者|r
    .turnin 1650 >>交任务: 勇气之书
    .accept 1651,1 >>接任务: 勇气之书
    .link https://youtu.be/1-nnLcqIIlQ?si=kZi41eXT8ZQmSBY2&t=10 >> 点击此处查看视频指南
    .target 达芙妮·斯迪威尔
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto 1436,41.311,88.506
    >>保护|cRXP_FRIENDLY_达芙妮·斯迪威尔|r
    >>|cRXP_WARN_如果你或|cRXP_FRIENDLY_达芙妮·斯迪威尔|r死亡，任务会失败，需要重做|r
    >>|cRXP_WARN_注意，这场战斗可能有些困难。你将面对3波敌人，每波分别有3名、4名和5名17-18级的 |cRXP_ENEMY_迪菲亚袭击者|r
    .complete 1651,1 --Protect Daphne Stilwell (1)
    .dungeon DM
step << Paladin
    #xprate >1.59
    #loop
    .goto 1436,41.645,88.729,0
    .goto 1436,41.196,89.173,10,0
    .goto 1436,41.696,89.244,10,0
    .goto 1436,41.645,88.729,10,0
    .goto 1436,41.461,88.498,10,0
    .goto 1436,41.311,88.506,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达芙妮·斯迪威尔|r交谈
    >>|cRXP_WARN_她会在田里附近小范围巡逻|r
    .turnin 1651 >>交任务: 勇气之书
    .accept 1652 >>接任务: 勇气之书
    .target 达芙妮·斯迪威尔
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #hardcore << !Paladin
    #optional
    #completewith next
    .goto Westfall,30.01,86.02,40 >> 前往西部荒野灯塔
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #ah
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r 对话
    .accept 104 >> 接任务: 海岸上的威胁
    .accept 103 >> 接任务: 长明的灯塔
    .turnin 103 >> 交任务: 长明的灯塔
    .target 葛瑞森船长
    .itemcount 814,5 -- Flask of Oil (5)
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #ssf
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r 对话
    .accept 104 >> 接任务: 海岸上的威胁
    .target 葛瑞森船长
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #ah
    #optional
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r 对话
    .accept 104 >> 接任务: 海岸上的威胁
    .target 葛瑞森船长
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #hardcore << !Paladin
    .goto Westfall,34.43,83.93
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀|cRXP_ENEMY_老瞎眼|r，获取|cRXP_LOOT_鳞片|r
    >>|cRXP_ENEMY_老瞎眼|r|cRXP_WARN_会沿着长滩来回巡逻。如果找不到它，就跳过此步骤|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan 老瞎眼
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r 对话
    .turnin 104 >> 交任务: 海岸上的威胁
    .target 葛瑞森船长
    .isQuestComplete 104
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #hardcore << !Paladin
    #completewith DeadminesEnd
    .abandon 103 >> 放弃任务: [长明的灯塔]
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto Westfall,42.55,71.69
    .subzone 1581 >> 独自进入迪菲亚据点
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto 1415,40.678,79.578
    >>击杀死亡矿井副本外的|cRXP_ENEMY_迪菲亚|r，拾取|cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step << !Paladin
    #xprate >1.59 << !Hunter
    >>击杀死亡矿井内的|cRXP_ENEMY_迪菲亚|r，拾取|cRXP_LOOT_红色丝质面罩|r
    >>|cRXP_WARN_如果死亡矿井内已经没有|cRXP_ENEMY_迪菲亚|r，就改在副本外击杀他们|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #softcore
    #completewith DeadminesEnd
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .target 灵魂医者
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #optional
    #completewith DeadminesEnd
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
    .xp <21,1
step << Rogue
    #xprate >1.59
    #optional
    #completewith DeadminesEnd
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label DeadminesEnd
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 166 >> 交任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.67,47.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的 |cRXP_FRIENDLY_哨兵瑞尔|r 对话
    .turnin 214 >> 交任务: 红色丝质面罩
    .target 哨兵瑞尔
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #sticky
    #label LetterLater
    .abandon 373 >> 放弃任务 [未寄出的信]，稍后再做
    .dungeon DM
step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .cast 3561 >>施放 |T135763:0|t[传送：暴风城]
    .zoneskip Stormwind City
    .dungeon DM
step << Mage
    #xprate >1.59
    #optional
    .goto 1453,36.863,81.132
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .train 2138 >> 学习职业技能
    .target 艾尔莎林
    .xp <22,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << Mage
    #completewith ShoniEnd
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fly Stormwind >> 飞往暴风城
    .zoneskip Stormwind City
    .target 索尔
    .dungeon DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 进入“屠羊酒馆”，下楼
    .xp <22,1
    .dungeon DM
step << Warlock
    #xprate >1.59
    #optional
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r对话
    .train 6202 >> 学习职业技能
    .target 厄苏拉·德林
    .xp <22,1
    .dungeon DM
--XX Not adding one to check xp after turnins, waste of time to do that/take tram and train etc
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,42.917,34.221,15,0
    .goto 1453,41.385,31.547,15,0
    .goto 1453,39.810,29.788,15
    .goto StormwindClassic,42.51,33.51,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 处
    .xp <22,1
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1652 >>交任务: 勇气之书
    .accept 1653 >>接任务: 正义试炼
    .target 达索瑞恩·拉尔
    .xp <22,1
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 对话
    .train 19835 >> 学习职业技能
    .target 虔诚的亚瑟
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 处
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 对话
    .train 8103 >> 学习职业技能
    .target 高阶牧师劳瑞娜
    .xp <22,1
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    .train 1856 >> 学习职业技能
    .target 夜行者奥斯伯
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >> 前往旧城区指挥中心内的 |cRXP_FRIENDLY_武神|r 处
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_武神|r 交谈
    .train 6192 >> 学习职业技能
    .target 武神
    .xp <22,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_维尔德·蓟草|r 对话
    .turnin 167 >> 交任务: 我的兄弟……
    .turnin 168 >> 交任务: 收集记忆
    .target 维尔德·蓟草
    .dungeon DM
step << skip --Hunter - nothing good to train at 22
    #xprate >1.59
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进去与 |cRXP_FRIENDLY_恩瑞斯·锐矛|r 交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛
    .xp <22,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label ShoniEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沉默的舒尼|r 对话
    .turnin 2040 >> 交任务: 地底突袭
    .goto StormwindClassic,55.510,12.504
    .target 沉默的舒尼
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利巴布·旋轮|r 对话
    .vendor 5519 >> |cRXP_BUY_向他购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（若有货）|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 比利巴布·旋轮
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,42.917,34.221,15,0
    .goto 1453,41.385,31.547,15,0
    .goto 1453,39.810,29.788,15
    .goto StormwindClassic,42.51,33.51,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_达索瑞恩·拉尔|r 处
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1652 >>交任务: 勇气之书
    .accept 1653 >>接任务: 正义试炼
    .target 达索瑞恩·拉尔
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 对话
    .train 19835 >> 学习职业技能
    .target 虔诚的亚瑟
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >> 前往暴风城大教堂内的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 处
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_高阶牧师劳瑞娜|r 对话
    .train 8103 >> 学习职业技能
    .target 高阶牧师劳瑞娜
    .xp <22,1
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_夜行者奥斯伯|r 对话
    .train 1856 >> 学习职业技能
    .target 夜行者奥斯伯
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >> 前往旧城区指挥中心内的 |cRXP_FRIENDLY_武神|r 处
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_武神|r 交谈
    .train 6192 >> 学习职业技能
    .target 武神
    .xp <22,1
    .dungeon DM
--XX No way to check if the user has the ironforge FP, if they don't, send them to the trainer there instead
step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .cast 3561 >>施放 |T135763:0|t[传送：暴风城]
    .dungeon DM
step << Mage
    #xprate >1.59
    #optional
    .goto 1453,36.863,81.132
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_艾尔莎林|r交谈
    .train 2138 >> 学习职业技能
    .target 艾尔莎林
    .xp <22,1
    .dungeon DM
step << Druid
    #xprate >1.59
    #optional
    #completewith next
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
    .dungeon DM
step << Druid
    #xprate >1.59
    #optional
    #completewith next
    .goto Moonglade,52.53,40.57
	>>去月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .train 8926 >> 学习职业技能
    .target 洛甘纳尔
    .xp <22,1
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith NEIFFP
    .goto 1453,60.972,11.690,30,0
    .goto 1453,65.933,5.771
    .subzone 2257 >>进入矿道地铁
    .zoneskip Ironforge
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #label DeeprunDMNoFP1
    #completewith NEIFFP
    >>|cRXP_WARN_在乘坐电车时, 如果需要, 可提升你的|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    .zone Ironforge >> 乘坐矿道地铁前往铁炉堡
    .zoneskip Ironforge
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #requires DeeprunDMNoFP1
    #label DeeprunDMNoFP2
    #completewith NEIFFP
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考格斯宾|r 对话
    .vendor 5175 >> |cRXP_BUY_向他购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_（若有货）|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .target 考格斯宾
    .bronzetube
    .dungeon DM
step << NightElf Warrior/NightElf Hunter
    #xprate >1.59 << !Hunter
    #requires DeeprunDMNoFP2
    #label DeeprunDMNoFP3
    #completewith NEIFFP
    .goto Ironforge,61.177,89.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_布里维夫·石手|r 对话
    .train 197 >> 学习双手斧（2手） << Warrior
    .train 199 >> 学习双手锤（2手） << Warrior
    .train 266 >> 学习枪械 << Hunter
    .target 布里维夫·石手
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #requires DeeprunDMNoFP3
    #label DeeprunDMNoFP4
    #completewith NEIFFP
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t下楼与|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r |T135427:0|t[重型飞刀]|cRXP_BUY_（从她那里）|r
    .collect 3108,200 << !tbc
    .collect 29009,1 << tbc
    .target 布雷文·寒钢
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7 << !tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.39 << tbc
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #requires DeeprunDMNoFP4
    #label DeeprunDMNoFP5
    #completewith NEIFFP
    +|cRXP_WARN_装备|r |T135427:0|t[重型飞刀]
    .use 3108 << !tbc
    .use 29009 << tbc
    .itemcount 3108,1 << !tbc
    .itemcount 29009,1 << tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7 << !tbc
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.39 << tbc
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #label NEIFFP
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯·瑟登|r 对话
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r] 来开启任务|r
    .accept 968 >> 接任务: 深渊之神
    .use 5352
    .itemcount 5352,1
    .zoneskip Ironforge,1
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_葛利·硬骨|r 对话
    .turnin 968 >> 交任务: 深渊之神
    .target 葛利·硬骨
    .zoneskip Ironforge,1
    .isOnQuest 968
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #requires LetterLater
    #optional
    .hs >> 炉石回黑海岸
    .zoneskip Darkshore
    .dungeon DM
----End of Hunter/All 2x Deadmines section----
----Start of <1.59x Redridge Transition----
step << !Hunter
--XX NightElf
    #xprate <1.59
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    >>|cRXP_BUY_向他购买一个|r |T135237:0|t[燧石和火绒]|cRXP_BUY_和一个|r |T135435:0|t[普通木柴]|cRXP_BUY_。|r
    >>|cRXP_WARN_这些材料用于稍后在船上提升|r |T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_需要达到50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，才能完成之后在暮色森林的任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .itemcount 6889,1 -- Small Egg (1+)
    .skill cooking,50,1
    .target 达蒙德
step << !Hunter
--XX NightElf
    #xprate <1.59
    #completewith next
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor 6301 >>|cRXP_BUY_向他购买|r |T134059:0|t[甜香料]|cRXP_BUY_，直到持有的|r |T134059:0|t[甜香料]|cRXP_BUY_数量不少于当前持有的|r |T132832:0|t[小蛋]|cRXP_BUY_数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target 高尔博德·钢手
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)
--ZXCV
step << !Hunter
    #xprate <1.59
    #label TravelMenethilRRBoat
    #completewith MenethilRRBoat
    .goto 1439,32.432,43.744,15 >> 前往开往米奈希尔港的船只停靠的码头
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
    .zoneskip Wetlands
step << !Hunter
    #xprate <1.59
    #optional
    #label DarkshoreRRCook1
    #requires TravelMenethilRRBoat
    #completewith MenethilRRBoat
    >>|cRXP_WARN_如果船刚到，就在船上进行下面的操作；如果船刚走，就在码头上进行：|r
    .cast 818 >>|cRXP_WARN_制作|r |T135805:0|t[基础营火]|cRXP_WARN_（在法术书的“通用”标签页中）|r
    .usespell 818
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
    .zoneskip Wetlands
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4470,1 --Simple Wood (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step << !Hunter
    #xprate <1.59
    #optional
    #requires DarkshoreRRCook1
    #completewith MenethilRRBoat
    >>|cRXP_WARN_需要达到50点|r |T133971:0|t[烹饪]|cRXP_WARN_技能，才能完成之后在暮色森林的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r |T132832:0|t|cRXP_LOOT_[小蛋]|r|cRXP_WARN_和|r |T134059:0|t[甜香料]|cRXP_WARN_制作成|r |T132834:0|t[草药烘蛋]
    .usespell 2550
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
    .zoneskip Wetlands
    .itemcount 6889,1 --Small Egg (1+)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step << !Hunter
    #xprate <1.59
    #label MenethilRRBoat
    .goto Darkshore,32.29,44.05
    >>|cRXP_WARN_如有需要，在等候前往米奈希尔港的船时提升你的|r |T135966:0|t[急救] |cRXP_WARN_技能|r << Rogue/Warrior/Paladin
    .zone Wetlands >> 乘船前往米奈希尔港
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
step << !NightElf !Hunter
    #xprate <1.59
    .money <0.08
    .goto Wetlands,10.4,56.0,25,0
    .goto Wetlands,10.1,56.9,25,0
    .goto Wetlands,10.6,57.2,25,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔·奥雷|r 对话
    .vendor >> |cRXP_WARN_购买:|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量供应的物品. 如果 |cRXP_FRIENDLY_尼尔·奥雷|r 没有此物品, 请跳过此步骤|r
	.target 尼尔·奥雷
    .bronzetube
step << !NightElf !Hunter
    #xprate <1.59
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_谢尔雷|r对话
    .fly Ironforge >> 飞往铁炉堡
    .target 谢尔雷·布隆迪尔
----Start of <1.59x Night Elf Wetlands->IF Transition----
step << !Hunter NightElf
    #xprate <1.59
    .goto Wetlands,8.509,55.697
    .target 詹姆斯·哈洛兰
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_詹姆斯·哈洛兰|r 对话
    .accept 484 >> 接任务: 小鳄鱼皮
step << !Hunter NightElf
    #xprate <1.59
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_谢尔雷|r对话
    .fp Wetlands>> 获取湿地飞行点
    .target 谢尔雷·布隆迪尔
step << !Hunter NightElf
    #xprate <1.59
    .money <0.08
    .goto Wetlands,10.4,56.0,25,0
    .goto Wetlands,10.1,56.9,25,0
    .goto Wetlands,10.6,57.2,25,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔·奥雷|r 对话
    .vendor >> |cRXP_WARN_购买:|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量供应的物品. 如果 |cRXP_FRIENDLY_尼尔·奥雷|r 没有此物品, 请跳过此步骤|r
	.target 尼尔·奥雷
    .bronzetube
step << !Hunter NightElf !Warrior
    #xprate <1.59
    #completewith crocs
    >>击杀|cRXP_ENEMY_湿地鳄鱼幼崽|r，拾取|cRXP_LOOT_小鳄鱼皮|r
    .complete 484,1
    .mob 湿地鳄鱼幼崽
    .xp <19,1--ignore if level 18 or below
step << !Hunter NightElf
    #xprate <1.59
    #completewith next
    .goto Wetlands,49.91,39.36,50 >> 向东前往 |cRXP_FRIENDLY_埃纳尔·石钳|r 处
step << !Hunter NightElf
    #xprate <1.59
    #label crocs
    .goto Wetlands,49.91,39.36
    .target 埃纳尔·石钳
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_埃纳尔·石钳|r 对话
    .accept 469 >> 接任务: 日常供货
step << !Hunter NightElf !Warrior
    #xprate <1.59
    .goto Wetlands,53.2,41.3,55,0
    .goto Wetlands,58.5,50.8,55,0
    .goto Wetlands,62.1,61.4,55,0
    .goto Wetlands,64.0,72.2
    >>击杀|cRXP_ENEMY_湿地鳄鱼幼崽|r，拾取|cRXP_LOOT_小鳄鱼皮|r
    .complete 484,1
    .mob 湿地鳄鱼幼崽
    .xp <19,1
step << skip --logout skip !Hunter NightElf
    #xprate 1.49-1.59
	#completewith next
	.goto Wetlands,63.9,78.6
    >>前往湿地东边水坝底部的山洞
	.zone Loch Modan >> 在洞穴尽头的蘑菇顶部下线。
    >>重新登录后, 你会被传送到塞尔萨玛
	.link https://www.youtube.com/watch?v=21CuGto26Mk >> |cRXP_WARN_点击这里查看参考|r
step << !Hunter NightElf
    #xprate <1.59
    #completewith next
    .goto Wetlands,53.14,70.38,30,0
    .goto Wetlands,48.32,67.07,35,0
    .goto Wetlands,50.14,72.10,30,0
    .goto Loch Modan,25.4,10.6,30 >> 前往洛克莫丹
    .zone Loch Modan >> |cRXP_WARN_沿主路前行，以避开怪物。|r
step << !Hunter NightElf
    #xprate <1.5
    .goto Loch Modan,46.05,13.61
    .target 主工程师辛德维尔七世
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_主工程师辛德维尔七世|r 对话
    .accept 250 >> 接任务: 水坝危机
step << !Hunter NightElf
    #xprate <1.5
    .goto Loch Modan,56.05,13.24
    >>点击 |cRXP_PICK_可疑的桶|r
    .turnin 250 >> 交任务: 水坝危机
    .accept 199 >> 接任务: 水坝危机
step << !Hunter NightElf
    #xprate <1.5
    .goto Loch Modan,46.05,13.61
    .target 主工程师辛德维尔七世
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_主工程师辛德维尔七世|r 对话
    .turnin 199 >> 交任务: 水坝危机
step << !Hunter NightElf
    #xprate <1.5
    #softcore
    #completewith next
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << !Hunter NightElf
    #xprate <1.59
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索格拉姆|r 交谈
    .fp Thelsamar >> 获取塞尔萨玛飞行点
    .target 索格拉姆·伯雷森
step << !Hunter NightElf
    #xprate <1.59
    .goto Loch Modan,21.30,68.60,40,0
    .goto Loch Modan,19.11,62.11,25,0
    .goto Dun Morogh,86.04,51.05,20 >> 前往丹莫罗
    .zoneskip Ironforge
    .zoneskip Dun Morogh
step << !Hunter NightElf
    #xprate <1.59
    .goto Dun Morogh,55.13,34.91
    .zone Ironforge >> 前往铁炉堡
step << skip --logout skip !Hunter NightElf
    #xprate <1.59
    .goto Dun Morogh,70.66,56.70,40,0
    .goto Dun Morogh,70.60,54.87
    .zone Ironforge >>前往西边的穴居人洞穴，在入口附近的钻孔机顶部下线，以触发下线跳点并传送到铁炉堡。
    .link https://www.youtube.com/watch?v=kbUSo62CfAM >> 点击这里查看参考
step << !Hunter NightElf
    #xprate <1.59
    .goto Ironforge,55.51,47.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格莱斯|r 对话
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
----End of <1.59x Night Elf Wetlands->IF Transition----
step << skip --logout skip !Hunter
    #xprate <1.59
    #completewith next
    #optional
    .goto Ironforge,56.23,46.83,0
    .goto Ironforge,78.00,52.00,20 >> |cRXP_WARN_跳到一只狮鹫头上, 然后登出再登录, 就能跳过这一段|r
    .link https://www.youtube.com/watch?v=PWMJhodh6Bw >> |cRXP_WARN_点击此处查看视频攻略|r
step << !Hunter
    #xprate <1.59
    #completewith next
    .goto Ironforge,67.84,42.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考格斯宾|r 对话
    .vendor >> |cRXP_WARN_购买:|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量供应的物品. 如果 |cRXP_FRIENDLY_考格斯宾|r 没有此物品, 请跳过此步骤|r
--  >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 考格斯宾
step << !Hunter
    #xprate <1.59
    .goto Ironforge,78.00,52.00,5,0
    .zone Stormwind City >> 进入矿道地铁，乘车前往暴风城。
    >>|cRXP_WARN_等待矿道地铁时，如有需要可练习|r |T135966:0|t[急救] |cRXP_WARN_和|r |T133971:0|t[烹饪] |cRXP_WARN_技能|r
    >>|cRXP_WARN_你的|r|T135966:0|t[急救]|cRXP_WARN_需要达到80点，以便在24级时完成一个任务|r << Rogue !Dwarf
----End of <1.59x Redridge Transition----
]])
----Start of <1.59x Redridge----
----2x and ALL Hunters stay in Darkshore/Ashen and grind----
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#xprate <1.59
#classic
#tbc
#season 0,1
#version 1
<< Alliance !Hunter
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 19-20 Redridge
#next 20-21 Darkshore/Ashenvale
#displayname 19-20 赤脊山
step
    #completewith BMenace
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利巴布·旋轮|r 对话
    .vendor >> |cRXP_WARN_购买:|r |T133024:0|t[青铜管]
    >>|cRXP_WARN_这是限量供应的物品. 如果 |cRXP_FRIENDLY_比利巴布·旋轮|r 没有, 请跳过此步骤|r
--    >>You will need 2 bronze tubes for a quest later << Rogue
    .bronzetube
    .target 比利巴布·旋轮
step
    .goto StormwindClassic,55.510,12.504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沉默的舒尼|r 对话
    .accept 2040 >> 接任务: 地底突袭
    .target 沉默的舒尼
    .dungeon DM
step << !NightElf
    .goto StormwindClassic,58.08,16.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗伦·长须|r 对话
    .turnin 1338 >> 交任务: 卡尔·雷矛的订单
    .target 弗伦·长须
    .isOnQuest 1338
step
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔德·蓟草|r 对话
    .accept 167 >> 接任务: 我的兄弟……
    .accept 168 >> 接任务: 收集记忆
    .target 维尔德·蓟草
    .dungeon DM
step << !NightElf
    #xprate <1.5
    .goto StormwindClassic,49.194,30.284
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r 对话
    .turnin 399 >> 交任务: 童年的记忆
    .target 巴隆斯·阿历克斯顿
    .isQuestComplete 399
--XX Westfall 1x only
step << Mage
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >> 前往法师塔
step << Mage
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林
step << Paladin/Priest !NightElf
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step << Paladin
    #label PalTrainer
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 对话
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
step << Priest !NightElf
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒修士|r 对话
    .trainer >> 学习职业技能
    .target 乔舒修士
step << Warlock/Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_WARN_购买|r |T135139:0|t[燃烧魔杖]|cRXP_WARN_，前提是它能提升你的装备|r
    >>|cRXP_WARN_务必购买一把非暗影伤害的魔杖，之后会遇到抵抗暗影伤害的怪物|r
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    .collect 5210,1
    .target 阿德温·凯伦
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往屠羊酒馆并下楼。
step << Warlock
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
step << Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 对话
    >>|cRXP_WARN_确保也学习|r|T136058:0|t[开锁]|cRXP_WARN_，稍后的盗贼职业任务会用到它|r
    .trainer >> 学习职业技能
    .train 1804 >> 学习|T136058:0|t[开锁]
    .target 夜行者奥斯伯
step << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >> 进入军情7处总部，沿楼梯上楼前往|cRXP_FRIENDLY_“剃刀”雷吉克|r处
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_“剃刀”雷吉克|r 对话
    .accept 2281 >> 接任务: 赤脊山的联络员
    .goto StormwindClassic,75.76,60.35
    .target “剃刀”雷吉克
step << Warrior !NightElf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_武神|r或|cRXP_FRIENDLY_伊尔萨|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾
step
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r对话
    .train 201 >> 学习1H剑技能（单手剑） << Mage/Rogue/Warlock
    .train 1180 >> 学习匕首技能 << Mage/Druid
    .train 202 >> 学习2H剑技能（双手剑） << Warrior/Paladin
    .target 吴平
step << Human Paladin
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯蒂芬妮·特纳|r 对话
    .turnin 1643 >> 交任务: 圣洁之书
    .target 斯蒂芬妮·特纳
    .accept 1644 >> 接任务: 圣洁之书
    .turnin 1644 >> 交任务: 圣洁之书
    >>|cRXP_WARN_你需要10块|T132889:0|t[亚麻布]|r
--  .accept 1780 >> Accept The Tome of Divinity
step << Rogue
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买|r |T135342:0|t[波刃短剑]|cRXP_BUY_，或在拍卖行购买更好的武器|r
    >>|cRXP_WARN_达到19级后装备它|r
    .collect 2209,1 --Kris
    .target 玛尔达·维勒
    .money <0.7115
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.9
step << Rogue
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_购买|r |T135342:0|t[波刃短剑]
    >>|cRXP_WARN_达到19级后装备它|r
    .collect 2209,1 --Kris
    .money <0.7115
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.9
    .target 玛尔达·维勒
step << Rogue
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135342:0|t[波刃短剑]
    .use 2209
    .itemcount 2209,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.89
    .xp <19,1
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买|T134437:0|t[抗毒药剂]，供之后的|T132290:0|t[制毒]任务使用；其余物品可让你稍后在赤脊山快速交任务 << !Dwarf Rogue
    >>购买以下物品，以便稍后在赤脊山快速交任务 << !Rogue/Dwarf Rogue
    >>这样可以省去四处寻找怪物并击杀的时间。如果不想购买，就跳过此步骤。
    >>|T134437:0|t[抗毒药剂] << !Dwarf Rogue
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target 拍卖师亚克森
    .dungeon !DM
step << !Human !Warlock
    #completewith start
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .goto StormwindClassic,66.27,62.12
    .fp Stormwind >> 获取暴风城飞行点
    .target 杜加尔·朗德瑞克
step << NightElf
    .goto StormwindClassic,73.2,92.1
    .zone Elwynn Forest >> 离开暴风城
step << !NightElf
#xprate <1.5 << Dwarf/Gnome
.dungeon DM
    #completewith next
    .goto StormwindClassic,66.27,62.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
    .zoneskip Westfall
step << !NightElf
#xprate <1.5 << Dwarf/Gnome
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .accept 65 >> 接任务: 迪菲亚兄弟会
    .goto Westfall,56.33,47.52
    .target 格里安·斯托曼
step << !NightElf
#xprate <1.5 << Dwarf/Gnome
.dungeon DM
    .goto Westfall,56.55,52.64,-1
    .goto StormwindClassic,66.27,62.12,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 或 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fly Redridge >> 飞往赤脊山
    .target 索尔
    .target 杜加尔·朗德瑞克
step << !Human
#xprate >1.49 << Dwarf/Gnome
.dungeon DM
    #completewith WestEntry
    .goto Westfall,59.95,19.35
    .zone Westfall >> 前往西部荒野
step << !Human
#xprate >1.49 << Dwarf/Gnome
.dungeon DM
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fp Sentinel Hill >> 获取哨兵岭飞行点
    .target 索尔
step << Gnome Warlock
#xprate >1.49
.dungeon DM
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fly Redridge >> 飞往赤脊山
    .target 索尔
step << !Human
    #label WestEntry
#xprate >1.49 << Dwarf/Gnome
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .accept 65 >> 接任务: 迪菲亚兄弟会
    .goto Westfall,56.33,47.52
    .target 格里安·斯托曼
step << NightElf Warrior/NightElf Priest
    #completewith next
    .goto Elwynn Forest,41.08,65.76,25 >> 前往闪金镇 << Warrior
    .goto Elwynn Forest,43.17,65.70,15 >> 前往闪金镇 << Priest
step << NightElf Warrior
    .goto Elwynn Forest,41.08,65.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里瑞亚|r交谈
    .trainer >> 学习职业技能
    .target 里瑞亚·杜拉克
step << NightElf Priest
    >>前往旅店, 上楼
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_女牧师洁塞塔|r 对话
    .goto Elwynn Forest,43.17,65.70,12,0
    .goto Elwynn Forest,43.80,66.47,8,0
    .goto Elwynn Forest,43.28,65.72
    .trainer >> 学习职业技能
    .target 女牧师洁塞塔
step << !Human !Warlock
    #xprate >1.49 << !NightElf
    .xp <20,1
    >>前往阿祖拉之塔
    .goto Elwynn Forest,65.20,69.80
    .target 塞欧克瑞图斯
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞欧克瑞图斯|r 对话
    .accept 94 >> 接任务: 法师的眼线
step << !NightElf
.dungeon !DM
    #xprate <1.5 << !Human
    #completewith next
    .goto StormwindClassic,66.27,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Redridge >>飞往赤脊山
    .target 杜加尔·朗德瑞克
step << !Human !Warlock
    #xprate >1.49 << Gnome/Dwarf
    #completewith next
    #label start
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >> 前往赤脊山
step << !Human !Warlock
    #xprate >1.49 << Gnome/Dwarf
    .goto Redridge Mountains,15.27,71.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >> 接任务: 豺狼人的入侵
    .target 卫兵帕克
step << !Human !Warlock
    #xprate >1.49 << Gnome/Dwarf
    .goto Redridge Mountains,30.73,59.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 对话
    .turnin 244 >> 交任务: 豺狼人的入侵
    .target 菲尔顿副队长
step << NightElf
    #xprate <1.5
    .goto Redridge Mountains,30.73,59.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 对话
    .target 菲尔顿副队长
    .accept 246 >> 接任务: 审时度势
step
.dungeon DM
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与 |cRXP_FRIENDLY_黑衣威利|r 交谈
    .turnin 65 >> 交任务: 迪菲亚兄弟会
    .accept 132 >> 接任务: 迪菲亚兄弟会
	.target 黑衣威利
step
.dungeon DM
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_所罗门镇长|r 对话
	.target 所罗门镇长
    .accept 120 >> 接任务: 送往暴风城的信
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 对话
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .accept 118 >> 接任务: 马掌
step
.dungeon DM
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 对话
    .fly Westfall >> 飞往西部荒野
    .target 艾蕾娜·斯托姆法瑟
step
.dungeon DM
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 132 >> 交任务: 迪菲亚兄弟会
    .accept 135 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
step
.dungeon DM
    #completewith next
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step
.dungeon DM
    .goto Stormwind City,75.78,59.84
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 对话
    .turnin 135 >> 交任务: 迪菲亚兄弟会
    .accept 141 >> 接任务: 迪菲亚兄弟会
    .target 马迪亚斯·肖尔
step
.dungeon DM
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
step
.dungeon DM
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 141 >> 交任务: 迪菲亚兄弟会
    .accept 142 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
step
.dungeon DM
    #completewith next
    .goto Westfall,44.50,69.62,55 >> 前往月溪镇
step
.dungeon DM
    .goto Westfall,44.50,69.62
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>击杀|cRXP_ENEMY_迪菲亚信使|r，拾取|cRXP_LOOT_神秘的信件|r
    >>|cRXP_WARN_|cRXP_ENEMY_迪菲亚信使|r 会在月溪镇刷新. 他会沿着月溪镇以北的道路前往金海岸矿洞和詹戈洛德矿洞. 如果在路上没有看到他, 请等待他在月溪镇重新刷新|r
    >>|cRXP_WARN_他的刷新时间为4-5分钟|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan 迪菲亚信使
step
.dungeon DM
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 142 >> 交任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
step
.dungeon DM
    .goto Westfall,55.68,47.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪菲亚叛徒|r 对话
    >>|cRXP_WARN_如果他不在, 你可能得等一下 |cRXP_FRIENDLY_迪菲亚叛徒|r 刷新|r
    .accept 155 >> 接任务: 迪菲亚兄弟会
    .target 迪菲亚叛徒
step
.dungeon DM
    .goto Westfall,42.56,71.71
    >>护送|cRXP_FRIENDLY_迪菲亚叛徒|r前往死亡矿井
    >>|cRXP_WARN_始终待在|cRXP_FRIENDLY_迪菲亚叛徒|r身旁！抵达月溪镇时，准备迎战|cRXP_ENEMY_迪菲亚成员|r|r
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target 迪菲亚叛徒
step
.dungeon DM
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格里安·斯托曼|r 对话
    .turnin 155 >> 交任务: 迪菲亚兄弟会
    .accept 166 >> 接任务: 迪菲亚兄弟会
    .target 格里安·斯托曼
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的 |cRXP_FRIENDLY_哨兵瑞尔|r 对话
    .accept 214 >> 接任务: 红色丝质面罩
    .goto Westfall,56.67,47.35
    .target 哨兵瑞尔
step
.dungeon DM
    .goto Westfall,60.4,72.2
    .goto Westfall,40.4,71.6
    .subzone 1581 >> 现在该找个"死亡矿井"副本的队伍了
    >>等副本队伍的时候, 就在这刷刷豺狼人练练级
step
.dungeon DM
    .goto Westfall,42.55,71.69
    .subzone 1581 >> 前往死亡矿井
step
.dungeon DM
    #completewith EnterDM
    >>击杀|cRXP_ENEMY_迪菲亚成员|r，拾取|cRXP_LOOT_红色丝质面罩|r
    >>|cRXP_WARN_可以在进入地下城后完成此任务|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
step
.dungeon DM
    #completewith next
    >>击杀|cRXP_ENEMY_骷髅矿工|r, |cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r，拾取|cRXP_LOOT_会员卡|r
    >>|cRXP_WARN_此任务在地下城外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_工头希斯耐特|r，拾取|cRXP_LOOT_徽章|r
    >>|cRXP_WARN_此任务在地下城外完成|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan 工头希斯耐特
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_骷髅矿工|r, |cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r，拾取|cRXP_LOOT_会员卡|r
    >>|cRXP_WARN_此任务在地下城外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者
step
.dungeon DM
    #label EnterDM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >> 进入"死亡矿井"副本
step
.dungeon DM
    #completewith DMend
    >>击杀死亡矿井内的|cRXP_ENEMY_迪菲亚成员|r，拾取|cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
step
.dungeon DM
    >>击杀|cRXP_ENEMY_斯尼德|r，拾取|cRXP_LOOT_小型高能发动机|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)
step
.dungeon DM
    >>击杀 |cRXP_ENEMY_艾德温·范克里夫|r, 搜刮 |cRXP_LOOT_头颅|r 和 |T133471:0|t[|cRXP_LOOT_未寄出的信|r]
    >>|cRXP_WARN_使用|T133471:0|t[|cRXP_LOOT_未寄出的信|r]开启任务|r
    .collect 2874,1,373 -- An Unsent Letter (1)
    .complete 166,1 -- Head of VanCleef (1)
    .accept 373 >> 接任务: 未寄出的信
    .use 2874 -- An Unsent Letter
step
.dungeon DM
    #label DMend
    #completewith next
    .goto Westfall,56.33,47.52,100 >> 前往哨兵岭
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r和塔顶的|cRXP_FRIENDLY_哨兵瑞尔|r对话
    .turnin 166 >> 交任务: 迪菲亚兄弟会
    .target +格里安·斯托曼
    .goto Westfall,56.33,47.52
    .turnin -214 >> 交任务: 红色丝质面罩
    .target +哨兵瑞尔
    .goto Westfall,56.67,47.35
step
.dungeon DM
    #completewith next
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step
.dungeon DM
    .goto StormwindClassic,63.982,75.338
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 对话
    .turnin 120 >> 交任务: 送往暴风城的信
    .accept 121 >> 接任务: 送往暴风城的信
    .target 马库斯·乔纳森将军
step << Mage
.dungeon DM
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >> 前往法师塔
step << Mage
.dungeon DM
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林
step << Mage
.dungeon DM
    .goto StormwindClassic,39.68,79.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉瑞麦尼|r 对话
    .train 3561 >> 学习|T135763:0|t[传送：暴风城]
	.xp <20,1
    .target 拉瑞麦尼·普尔度
step << Warlock
.dungeon DM
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往屠羊酒馆并下楼。
step << Warlock
.dungeon DM
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
step << Warlock
.dungeon DM
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 对话
    .accept 1716 >> 接任务: 噬魂者
    .target 黑暗缚灵者加科因
    .xp <20,1
step
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿古斯·夜语|r 对话
    .accept 3765 >> 接任务: 遥远的旅途
    .target 阿古斯·夜语
    .dungeon DM
step << Druid
.dungeon DM
    #season 2
    #completewith next
    +|cRXP_WARN_在获得符文后，应准备切换到|r |T132276:0|t[野性] |cRXP_WARN_，不再使用|r |T136096:0|t[平衡] |cRXP_WARN_技能；所需符文对应以下技能：|r |T132135:0|t[割碎] |cRXP_WARN_和|r |T236167:0|t[野蛮咆哮]
step << Druid
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沙德拉斯·月树|r 对话
    .goto StormwindClassic,20.89,55.50
    .trainer >> 学习职业技能
    .train 768 >> 学习 |T132115:0|t[猎豹形态]
    .target 沙德拉斯·月树
step << Paladin/Priest
.dungeon DM
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step << Paladin
.dungeon DM
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈，他会给你|T133739:0|t[|cRXP_LOOT_勇气之书|r]
    .use 6776 >>|cRXP_WARN_使用|T133739:0|t[|cRXP_LOOT_勇气之书|r]来开启任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务: 勇气之书
    .target 达索瑞恩·拉尔
step << Paladin
.dungeon DM
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1649 >>交任务: 勇气之书
    .accept 1650 >>接任务: 勇气之书
    .target 达索瑞恩·拉尔
step << Paladin
.dungeon DM
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 对话
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
step << Priest
.dungeon DM
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒修士|r 对话
    .trainer >> 学习职业技能
    .target 乔舒修士
step
.dungeon DM
    .goto StormwindClassic,48.079,30.913,10,0
    .goto StormwindClassic,49.193,30.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r 对话
    .turnin 373 >> 交任务: 未寄出的信
    .accept 389 >> 接任务: 巴吉尔·特雷德
    .target 巴隆斯·阿历克斯顿
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔德·蓟草|r 和 |cRXP_FRIENDLY_沉默的舒尼|r 对话
    .turnin 167 >> 交任务: 我的兄弟……
    .turnin 168 >> 交任务: 收集记忆
    .target +维尔德·蓟草
    .goto StormwindClassic,65.438,21.175
    .turnin 2040 >> 交任务: 地底突袭
    .target +沉默的舒尼
    .goto StormwindClassic,55.510,12.504
step << Rogue
.dungeon DM
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 对话
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
step << Rogue
.dungeon DM
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >> 进入军情7处总部，沿楼梯上楼前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r处
step << Rogue
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 对话
    .accept 2360 >> 接任务: 马迪亚斯和迪菲亚潜行者
    .goto StormwindClassic,75.78,59.84
    .target 马迪亚斯·肖尔
step << Warrior
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_武神|r或|cRXP_FRIENDLY_伊尔萨|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾
step << Rogue
.dungeon DM
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_购买|r |T135324:0|t[长剑]|cRXP_WARN_，并在21级时装备|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的装备，可以改为在那里购买|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
step << Rogue
.dungeon DM
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_购买|r |T135324:0|t[长剑]|cRXP_WARN_，并在21级时装备|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
step << Rogue
.dungeon DM
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
step << Warrior/Paladin
.dungeon DM
    #ah
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_WARN_购买|r |T135280:0|t[微光重剑]|cRXP_WARN_，前提是钱足够。21级时装备|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的装备，可以改为在那里购买|r
    .collect 922,1 --Dacian Falx (1)
    .target 冈瑟尔·维勒
    .money <1.2038
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0
step << Warrior/Paladin
.dungeon DM
    #ssf
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_WARN_购买|r |T135280:0|t[微光重剑]|cRXP_WARN_，前提是钱足够。21级时装备|r
    .collect 922,1 --Dacian Falx (1)
    .target 冈瑟尔·维勒
    .money <1.2038
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0
step << Warrior/Paladin
.dungeon DM
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.89
    .xp <21,1
step
.dungeon DM
    .goto StormwindClassic,42.435,59.236,10,0
    .goto StormwindClassic,41.102,58.091
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_典狱官塞尔沃特|r 对话
    .turnin 389 >> 交任务: 巴吉尔·特雷德
--  .accept 391 >> Accept The Stockade Riots -- Accept later when going to do Stockades
    .target 典狱官塞尔沃特
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买|T134437:0|t[抗毒药剂]，供之后的|T132290:0|t[制毒]任务使用；其余物品可让你稍后在赤脊山快速交任务 << !Dwarf Rogue
    >>购买以下物品，以便稍后在赤脊山快速交任务 << !Rogue/Dwarf Rogue
    >>这样可以省去四处寻找怪物并击杀的时间。如果不想购买，就跳过此步骤。
    >>|T134437:0|t[抗毒药剂] << !Dwarf Rogue
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target 拍卖师亚克森
    .dungeon DM
step
.dungeon DM
    #completewith next
    .goto Elwynn Forest,32.240,49.723,60 >> 离开暴风城，前往闪金镇
    .isOnQuest 118
    .xp <20,1
step
.dungeon DM
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_铁匠阿古斯|r 对话
	.target 铁匠阿古斯
    .turnin 118 >> 交任务: 马掌
    .accept 119 >> 接任务: 回复弗纳
    .isOnQuest 118
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 118
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_铁匠阿古斯|r 对话
	.target 铁匠阿古斯
    .accept 119 >> 接任务: 回复弗纳
    .xp <20,1
step
.dungeon DM
    #completewith next
    .subzone 91 >> 前往阿祖拉之塔并登顶
    .xp <20,1
step
.dungeon DM
    .goto Elwynn Forest,65.22,69.71
    .target 塞欧克瑞图斯
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t到顶部与 |cRXP_FRIENDLY_塞欧克瑞图斯|r 交谈
    .accept 94 >> 接任务: 法师的眼线
    .xp <20,1
step
.dungeon DM
    .goto Elwynn Forest,64.880,69.192
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_当恩·布赖特斯塔|r 对话
    .vendor >> |cRXP_FRIENDLY_当恩·布赖特斯塔|r|cRXP_BUY_还有限量供应的|r|T134938:0|t|T134937:0|t|T134943:0|t[卷轴]|cRXP_BUY_和|r|T134850:0|t|T134830:0|t[药水]|cRXP_BUY_，如果有货就购买|r << !Warrior !Rogue
    .vendor >> |cRXP_FRIENDLY_当恩·布赖特斯塔|r|cRXP_BUY_还有限量供应的|r|T134938:0|t|T134937:0|t|T134943:0|t[卷轴]|cRXP_BUY_和|r|T134830:0|t[药水]|cRXP_BUY_，如果有货就购买|r << Warrior/Rogue
    .target 当恩·布赖特斯塔
    .subzoneskip 91,1
step
.dungeon DM
    #completewith FlyR
	.goto Redridge Mountains,6.7,72.4
    .zone Redridge Mountains >> 前往赤脊山
step
.dungeon DM
    #xprate <1.5
    #label GParker
    .goto Redridge Mountains,15.27,71.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >> 接任务: 豺狼人的入侵
    .target 卫兵帕克
step
.dungeon DM
    #xprate <1.5
    .goto Redridge Mountains,30.73,59.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 对话
    .turnin 244 >> 交任务: 豺狼人的入侵
    .target 菲尔顿副队长
step
    #label BMenace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官马瑞斯|r 对话
    .goto Redridge Mountains,33.50,48.97
    .accept 20 >> 接任务: 黑石氏族的威胁
    .target 治安官马瑞斯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 对话
    .goto Redridge Mountains,32.13,48.63
    .accept 125 >> 接任务: 丢失的工具
    .target 工头奥斯洛
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 对话
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .accept 118 >> 接任务: 马掌
step
.dungeon DM
#xprate >1.49
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 对话
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .turnin 119 >> 交任务: 回复弗纳
    .accept 124 >> 接任务: 豺狼人的乱吠
step
.dungeon DM
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 对话
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .turnin 119 >> 交任务: 回复弗纳
    .accept 124 >> 接任务: 豺狼人的乱吠
step
.dungeon DM
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 对话
	.target 马库斯·乔纳森将军
    .goto StormwindClassic,63.982,75.338
    .turnin 120 >> 交任务: 送往暴风城的信
    .accept 121 >> 接任务: 送往暴风城的信
step
.dungeon !DM
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_所罗门镇长|r 对话
	.target 所罗门镇长
    .accept 120 >> 接任务: 送往暴风城的信
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_码头管理员巴伦|r 对话
	.target 码头管理员巴伦
    .goto Redridge Mountains,27.70,47.40
    .accept 127 >> 接任务: 卖鱼
step
#xprate <1.5
    .goto Redridge Mountains,26.80,44.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达希|r交谈
    >>|cRXP_FRIENDLY_达希|r|cRXP_WARN_ 在旅店里来回走动|r
	.target 达希
    .accept 129 >> 接任务: 免费的午餐
step
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_黑衣威利|r 对话
	.target 黑衣威利
    .turnin 65 >> 交任务: 迪菲亚兄弟会
    .isOnQuest 65
step
#optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 对话
    .accept 92 >> 接任务: 赤脊山炖肉
    .turnin 92 >> 交任务: 赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target 厨师布雷纳
step << Warlock
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛蒂·詹罗斯|r 对话
	.target 玛蒂·詹罗斯
    .goto Redridge Mountains,21.85,46.32
    .accept 34 >> 接任务: 不速之客
step << Warlock
    .goto Redridge Mountains,15.68,49.30
    >>击杀 |cRXP_ENEMY_贝利格拉布|r, 拾取 |cRXP_LOOT_獠牙|r
    >>|cRXP_WARN_将|cRXP_ENEMY_贝利格拉布|r风筝回湖畔镇，让|cRXP_FRIENDLY_卫兵|r协助你击杀|r|cRXP_ENEMY_贝利格拉布|r
    >>|cRXP_WARN_这个任务非常困难. 你可以跳过这一步, 稍后再回来做|r
    .complete 34,1 -- Bellygrub's Tusk (1)
    .link https://youtu.be/6JE967OG3CU?t=1845 >> |cRXP_WARN_点击此处查看视频攻略|r
    .mob 贝利格拉布
step << Warlock
    .goto Redridge Mountains,21.85,46.32
    .target 玛蒂·詹罗斯
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛蒂·詹罗斯|r 对话
    .turnin 34 >> 交任务: 不速之客
step << Rogue
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
    .turnin 2281 >> 交任务: 赤脊山的联络员
    .accept 2282 >> 接任务: 奥瑟尔伐木场
    .target 卢修斯
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肖恩|r 对话
	.target 肖恩
    .goto Redridge Mountains,29.31,53.63
    .accept 3741 >> 接任务: 希拉里的项链
step
    >>|cRXP_WARN_跳入湖中|r
    >>打开|cRXP_PICK_闪光的泥土|r，拾取|cRXP_LOOT_希拉里的项链|r
    >>|cRXP_WARN_它在湖中有多个刷新点|r
    .goto Redridge Mountains,27.80,56.05,0
    .goto Redridge Mountains,26.56,50.63,0
    .goto Redridge Mountains,23.96,55.17,0
    .goto Redridge Mountains,19.16,51.75,0
    .goto Redridge Mountains,31.12,54.21,0
    .goto Redridge Mountains,34.03,55.34,0
    .goto Redridge Mountains,38.09,54.49,0
    .goto Redridge Mountains,19.16,51.75,70,0
    .goto Redridge Mountains,38.09,54.49,70,0
    .complete 3741,1 --Hilary's Necklace (1)
step << Druid
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希拉里|r交谈
	.target 希拉里
    .goto Redridge Mountains,29.24,53.63
    .turnin 3741 >> 交任务: 希拉里的项链
step
    #softcore
    >>打开|cRXP_PICK_沉没的箱子|r，拾取|cRXP_LOOT_奥斯洛的工具箱|r
    .goto Redridge Mountains,41.52,54.68
    .complete 125,1 --Oslow's Toolbox (1)
step
    #xprate <1.5
    #sticky
    #completewith orcs
    >>击杀|cRXP_ENEMY_巨型血牙野猪|r，拾取|cRXP_LOOT_巨型血牙野猪头|r
    >>击杀|cRXP_ENEMY_狼蛛|r，拾取|cRXP_LOOT_香脆蜘蛛肉|r
    >>击杀|cRXP_ENEMY_恐鹫|r，拾取|cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_交完“赤脊山炖肉”任务前，不要卖掉这些物品|r
    >>|cRXP_WARN_保留拾取的所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，用它们将|r |T133971:0|t[烹饪]|cRXP_WARN_练到50，这是之后暮色森林路线的要求|r
    .collect 2296,5,92,1
    .collect 1080,5,92,1
    .collect 1081,5,92,1
    .mob 巨型血牙野猪
    .mob 狼蛛
    .mob 恐鹫
step
    #xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
	.target 卫兵帕克
    .goto Redridge Mountains,15.30,71.50
    .accept 244 >> 接任务: 豺狼人的入侵
step
    #xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
	.target 卫兵帕克
    .goto Redridge Mountains,15.27,71.45
    .turnin 129 >> 交任务: 免费的午餐
    .accept 130 >> 接任务: 寻访草药师
step
    #xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 对话
	.target 菲尔顿副队长
    .goto Redridge Mountains,30.70,60.00
    .turnin 244 >> 交任务: 豺狼人的入侵
    .accept 246 >> 接任务: 审时度势
step
    #xprate <1.5
    .goto Redridge Mountains,21.22,67.77,45,0
    .goto Redridge Mountains,17.70,73.39,45,0
    .goto Redridge Mountains,11.20,76.31,45,0
    .goto Redridge Mountains,13.37,81.48,45,0
    .goto Redridge Mountains,18.86,73.63
    >>击杀|cRXP_ENEMY_狼蛛|r，拾取|cRXP_LOOT_香脆蜘蛛肉|r
    .collect 1081,5,92,1
    .mob 狼蛛
step
    #xprate <1.5
    .goto Redridge Mountains,29.49,82.80,45,0
    .goto Redridge Mountains,32.52,81.78,45,0
    .goto Redridge Mountains,43.18,72.22,45,0
    .goto Redridge Mountains,31.13,82.18
	>>击杀|cRXP_ENEMY_混血赤脊山豺狼人|r和|cRXP_ENEMY_赤脊山偷猎者|r
    .complete 246,1 --Redridge Mongrel (10)
    .mob +混血赤脊山豺狼人
    .complete 246,2 --Redridge Poacher (6)
	.mob +赤脊山偷猎者
step
    .goto Redridge Mountains,49.0,70.0
    >>击杀|cRXP_ENEMY_鱼人巡滩者|r和|cRXP_ENEMY_鱼人小招潮者|r，拾取|cRXP_LOOT_鱼人鳍|r和|cRXP_LOOT_斑点太阳鱼|r
	>>|cRXP_WARN_注意，此区域会快速刷新，|cRXP_ENEMY_鱼人|r复活得很快|r
    .complete 127,1
    .collect 1468,8,150,1
    .mob 鱼人巡滩者
    .mob 鱼人小招潮者
step
    #xprate <1.5
    .goto Redridge Mountains,61.37,77.10
    >>击杀|cRXP_ENEMY_恐鹫|r，拾取|cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_若找不到这些敌人，就跳过此步骤：|r|cRXP_ENEMY_恐鹫|r
    .collect 1080,5,92,1
    .mob 恐鹫
step
    #label orcs
    >>击杀|cRXP_ENEMY_黑石步兵|r和|cRXP_ENEMY_黑石前锋|r，拾取|cRXP_LOOT_用旧的战斧|r
	>>|cRXP_WARN_注意，|cRXP_ENEMY_黑石前锋|r会对你施放|T132149:0|t[投网]|r
    .goto Redridge Mountains,74.00,79.00,60,0
    .goto Redridge Mountains,76.18,83.39,60,0
    .goto Redridge Mountains,77.80,68.50,60,0
    .goto Redridge Mountains,70.11,77.34,60,0
    .goto Redridge Mountains,74.00,79.00
    .complete 20,1 --Battleworn Axe (10)
    .mob 黑石步兵
	.mob 黑石前锋
step
    #xprate <1.5
    .goto Redridge Mountains,61.37,77.10
    >>击杀|cRXP_ENEMY_恐鹫|r，拾取|cRXP_LOOT_硬秃鹫肉|r
    .collect 1080,5,92,1
    .mob 恐鹫
step
    #hardcore
    >>|cRXP_WARN_跳入湖中|r
    >>打开|cRXP_PICK_沉没的箱子|r，拾取|cRXP_LOOT_奥斯洛的工具箱|r
    .goto Redridge Mountains,41.52,54.68
    .complete 125,1 --Oslow's Toolbox (1)
step
    .goto Redridge Mountains,49.0,70.0
    .xp 20-7687 >> 刷怪直到还差7687经验升到20级 << !Rogue
    .xp 20-10012 >> 刷怪直到还差10012经验升到20级 << Rogue
step << Rogue
    #completewith next
    .subzone 97 >> 前往奥瑟尔伐木场
step << Rogue
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_必须完成这一步，之后的|r |T132290:0|t[制毒]|cRXP_WARN_任务需要它|r
    >>|cRXP_WARN_站在路径点处，调整镜头和鼠标位置，确保能依次点击3个|cRXP_PICK_练习用保险箱|r，不必移动角色、镜头或光标|r
    .skill lockpicking,80 >>|cRXP_WARN_打开奥瑟尔伐木场地上的|cRXP_PICK_练习用保险箱|r，直到你的|r|T136058:0|t[开锁]技能达到80点|r
step << Rogue
	.goto Redridge Mountains,52.05,44.69
    >>打开|cRXP_PICK_卢修斯的箱子|r，拾取|cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery
    .skill lockpicking,<80,1
step
    #completewith next
    .goto Redridge Mountains,33.50,48.97,150 >> 前往湖畔镇
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_治安官马瑞斯|r 对话
	.target 治安官马瑞斯
    .goto Redridge Mountains,33.50,48.97
    .turnin 20 >> 交任务: 黑石氏族的威胁
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 对话
	.target 工头奥斯洛
    .goto Redridge Mountains,32.13,48.63
    .turnin 125 >> 交任务: 丢失的工具
    .accept 89 >> 接任务: 止水湖上的桥
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_码头管理员巴伦|r 对话
	.target 码头管理员巴伦
    .goto Redridge Mountains,27.72,47.38
    .turnin 127 >> 交任务: 卖鱼
    .accept 150 >> 接任务: 鱼人偷猎者
    .turnin 150 >> 交任务: 鱼人偷猎者
    .xp <20,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_码头管理员巴伦|r 对话
	.target 码头管理员巴伦
    .goto Redridge Mountains,27.72,47.38
    .turnin 127 >> 交任务: 卖鱼
step
#optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 对话
	.target 厨师布雷纳
    .goto Redridge Mountains,22.67,43.83
    .accept 92 >> 接任务: 赤脊山炖肉
    .turnin 92 >> 交任务: 赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛蒂·詹罗斯|r 对话
	.target 玛蒂·詹罗斯
    .goto Redridge Mountains,21.86,46.33
    .turnin 130 >> 交任务: 寻访草药师
    .accept 131 >> 接任务: 水仙诉衷情
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达希|r交谈
    >>|cRXP_FRIENDLY_达希|r|cRXP_WARN_ 在旅店里来回走动|r
	.target 达希
    .goto Redridge Mountains,26.80,44.30
    .turnin 131 >> 交任务: 水仙诉衷情
step << Rogue
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卢修斯|r 交谈
	.target 卢修斯
    .goto Redridge Mountains,28.07,52.02
    .turnin 2282 >> 交任务: 奥瑟尔伐木场
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希拉里|r交谈
	.target 希拉里
    .goto Redridge Mountains,29.24,53.63
    .turnin 3741 >> 交任务: 希拉里的项链
step << Rogue
    #optional
	#completewith InRR
	.destroy 7907 >> 摧毁 |T134328:0|t[偷窃技能认证书]。你不再需要它。
step
    #xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲尔顿副队长|r 对话
	.target 菲尔顿副队长
    .goto Redridge Mountains,30.73,59.99
    .turnin 246 >> 交任务: 审时度势
step
    .goto Redridge Mountains,49.0,70.0
    .xp 20 >> 刷怪练级, 直到升上 20 级
step << Rogue
.dungeon DM
    #softcore
    .isOnQuest 2360
    .goto Redridge Mountains,30.59,59.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 对话
    .fp Redridge Mountains >> 获取赤脊山飞行点 << !Human
    .fly Westfall >> 飞往西部荒野
    .target 艾蕾娜·斯托姆法瑟
step
.dungeon !DM << Rogue
    #completewith InRR
    .goto Redridge Mountains,30.59,59.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r 对话
	.target 艾蕾娜·斯托姆法瑟
    .fp Redridge Mountains >> 获取赤脊山飞行点 << !Human !Warlock
    .fly Stormwind >> 飞往暴风城
step << Rogue
.dungeon !DM
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_购买|r |T135324:0|t[长剑]|cRXP_WARN_，并在21级时装备|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的装备，可以改为在那里购买|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
step << Rogue
.dungeon !DM
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_购买|r |T135324:0|t[长剑]|cRXP_WARN_，并在21级时装备|r
    .collect 923,1 --Longsword (1)
    .target 玛尔达·维勒
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
step << Rogue
.dungeon !DM
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
step << Warrior/Paladin
.dungeon !DM
    #ah
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_WARN_购买|r |T135280:0|t[微光重剑]|cRXP_WARN_，前提是钱足够。21级时装备|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的装备，可以改为在那里购买|r
    .collect 922,1 --Dacian Falx (1)
    .target 冈瑟尔·维勒
    .money <1.2038
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0
step << Warrior/Paladin
.dungeon !DM
    #ssf
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_WARN_购买|r |T135280:0|t[微光重剑]|cRXP_WARN_，前提是钱足够。21级时装备|r
    .collect 922,1 --Dacian Falx (1)
    .target 冈瑟尔·维勒
    .money <1.2038
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0
step << Warrior/Paladin
.dungeon !DM
    #optional
    #completewith next
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.89
    .xp <21,1
step << Warlock
.dungeon !DM
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往屠羊酒馆并下楼。
step << Warlock
.dungeon !DM
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黑暗缚灵者加科因|r 对话
    .accept 1716 >> 接任务: 噬魂者
    .target 黑暗缚灵者加科因
step << Mage
.dungeon !DM
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >> 前往法师塔
step << Mage
.dungeon !DM
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林
step << Mage
.dungeon !DM
    .goto StormwindClassic,39.68,79.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉瑞麦尼|r 对话
    .train 3561 >> 学习|T135763:0|t[传送：暴风城]
	.xp <20,1
    .target 拉瑞麦尼·普尔度
step
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿古斯·夜语|r 对话
    .accept 3765 >> 接任务: 遥远的旅途
    .target 阿古斯·夜语
    .dungeon !DM
step << Druid
.dungeon !DM
    #season 2
    #completewith next
    +|cRXP_WARN_在获得符文后，应准备切换到|r |T132276:0|t[野性] |cRXP_WARN_，不再使用|r |T136096:0|t[平衡] |cRXP_WARN_技能；所需符文对应以下技能：|r |T132135:0|t[割碎] |cRXP_WARN_和|r |T236167:0|t[野蛮咆哮]
step << Druid
.dungeon !DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沙德拉斯·月树|r 对话
    .goto StormwindClassic,20.89,55.50
    .trainer >> 学习职业技能
    .train 768 >> 学习 |T132115:0|t[猎豹形态]
    .target 沙德拉斯·月树
step << Paladin/Priest
.dungeon !DM
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >> 前往 [暴风城大教堂]
step << Paladin
.dungeon !DM
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈，他会给你|T133739:0|t[|cRXP_LOOT_勇气之书|r]
    .use 6776 >>|cRXP_WARN_使用|T133739:0|t[|cRXP_LOOT_勇气之书|r]来开启任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务: 勇气之书
    .target 达索瑞恩·拉尔
step << Paladin
.dungeon !DM
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1649 >>交任务: 勇气之书
    .accept 1650 >>接任务: 勇气之书
    .target 达索瑞恩·拉尔
step << Paladin
.dungeon !DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_虔诚的亚瑟|r 对话
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
step << Priest
.dungeon !DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔舒修士|r 对话
    .goto StormwindClassic,38.54,26.86
    .trainer >> 学习职业技能
    .target 乔舒修士
step << Rogue
.dungeon !DM
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥斯伯|r 对话
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
step << Rogue
.dungeon !DM
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >> 进入军情7处总部，沿楼梯上楼前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r处
step << Rogue
.dungeon !DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 对话
    .accept 2360 >> 接任务: 马迪亚斯和迪菲亚潜行者
    .goto StormwindClassic,75.78,59.84
    .target 马迪亚斯·肖尔
step << Warrior
.dungeon !DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_武神|r或|cRXP_FRIENDLY_伊尔萨|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾
----Start of Rogue 20 Quest <1.59x Section----
step << NightElf Rogue
    .goto Westfall,56.55,52.64,5,0
    .zone Westfall >> 前往西部荒野
    >>要是开了西部荒野的飞行点, 就直接飞过去
    .isOnQuest 2360
step << NightElf Rogue
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fp Westfall >> 获取西部荒野飞行点
    .target 索尔
    .isOnQuest 2360
step << !NightElf Rogue
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 对话
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
step << !Dwarf Rogue
    .goto Duskwood,15.90,72.10,60,0
    .goto Duskwood,14.86,64.56,50,0
    .goto Duskwood,10.43,53.97
    >>击杀|cRXP_ENEMY_小型结网毒蜘蛛|r和|cRXP_ENEMY_结网毒蜘蛛|r，拾取一个|cRXP_LOOT_小毒囊|r及|cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_你需要|cRXP_LOOT_小毒囊|r来制作|r|T134437:0|t[抗毒药剂]|cRXP_WARN_，以便稍后移除|r|T136230:0|t[赞吉尔之触]|cRXP_WARN_减益效果|r
    >>|cRXP_WARN_保留|cRXP_LOOT_粘糊的蜘蛛腿|r供之后使用|r
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r|cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r|cRXP_WARN_朋友，可以跳过此步骤，请他们帮忙移除减益|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob 小型结网毒蜘蛛
    .mob 结网毒蜘蛛
    .itemcount 6452,<1 --Anti Venom (<1)
step << Rogue
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请留意接下来的部分==|r
    >>|cRXP_WARN_按Esc，然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用交互键”，并为“与目标互动”设置按键|r
    >>|cRXP_WARN_此外，建议开启敌方姓名板（默认按键：V），方便看见塔内部分拐角后的敌人|r
step << Rogue
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_密探吉尔妮|r 对话
    >>|cRXP_WARN_必须完成此任务才能解锁|r |T132290:0|t[毒药]
    .turnin 2360 >> 交任务: 马迪亚斯和迪菲亚潜行者
    .accept 2359 >> 接任务: 克拉文之塔
    .target 密探吉尔妮
step << Rogue
    #label TowerKey
    #loop
    .goto Westfall,71.49,73.49,0
    .goto Westfall,71.01,75.72,0
    .goto Westfall,69.58,73.07,0
    .goto Westfall,71.49,73.49,30,0
    .goto Westfall,71.01,75.72,30,0
    .goto Westfall,69.58,73.07,30,0
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_丑陋的迪菲亚懒汉|r，拾取 |cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行] |cRXP_WARN_状态才能使用|r |T133644:0|t[偷窃]
    >>|cRXP_WARN_|cRXP_ENEMY_丑陋的迪菲亚懒汉|r 会在塔楼入口刷新，然后在塔外巡逻|r
    >>|cRXP_WARN_小心，他伤害很高。如果你的|r|T132320:0|t[潜行]|cRXP_WARN_被打破，立刻使用|r|T132307:0|t[疾跑]|cRXP_WARN_逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 丑陋的迪菲亚懒汉
step << Rogue
    #optional
    #completewith Mortwake
    +|cRXP_WARN_使用|r |T135641:0|t[曲木匕首]|cRXP_WARN_完成此任务；如果已经装备其他|r |T135641:0|t[匕首]|cRXP_WARN_，则无需更换|r
    .use 15396
    .itemcount 15396,1
step << Rogue
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼从上往下第2层。在|r|T132320:0|t[潜行]|cRXP_WARN_状态下，等|cRXP_ENEMY_迪菲亚哨兵|r不在你身旁时，跳上椅子，再跳上灯，最后跳到路径点上方的书架顶|r
    >>|cRXP_WARN_手动|r|T132320:0|t[取消潜行]|cRXP_WARN_，然后按下“与目标互动”快捷键打开|cRXP_PICK_暮色森林的箱子|r，并拾取其中的|r|cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_注意: 你的|r |T132320:0|t[潜行] |cRXP_WARN_在拾取后会暂时失效, 因为你拿到了|r |cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_如果没有击杀2楼的|cRXP_ENEMY_迪菲亚哨兵|r，要做好逃跑准备。书架顶是怪物无法攻击的位置，它们很可能会持续保持仇恨，但不会攻击你|r
    >>|cRXP_WARN_如果背包里有或已装备|r|T135641:0|t[匕首]|cRXP_WARN_，可以施放|r|T132282:0|t[伏击]|cRXP_WARN_，瞬间击杀塔内的|cRXP_ENEMY_迪菲亚巡塔员|r和|cRXP_ENEMY_迪菲亚哨兵|r。击杀第一个|cRXP_ENEMY_迪菲亚哨兵|r后做好逃跑准备，并记住可能受到来自上方的攻击。这种方法较慢，但安全得多|r
    >>|cRXP_WARN_如果必须跑出塔楼，小心入口处可能出现的|cRXP_ENEMY_丑陋的迪菲亚懒汉|r和|cRXP_ENEMY_迪菲亚苦工|r|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 迪菲亚巡塔员
    .mob 迪菲亚哨兵
step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >> 制作一剂 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
step << !Dwarf Rogue
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包中的|T134437:0|t[抗毒药剂]移除|T136230:0|t[赞吉尔之触]减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
step << Dwarf Rogue
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放|T136225:0|t[石像形态]移除|T136230:0|t[赞吉尔之触]减益效果|r
    .aura -9991
step << Rogue
    #optional
    #completewith KlavenEnd
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 对话
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step << !Dwarf Rogue
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >> 前往 |cRXP_FRIENDLY_珊娜·弗勒|r 处
    .aura -9991
step << !Dwarf Rogue
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊娜·弗勒|r 对话
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_，不必自己处理。|r
    .skill firstaid,80 >> |cRXP_WARN_将你的|r|T135966:0|t[急救]|cRXP_WARN_提升到80点|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
step << !Dwarf Rogue
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊娜·弗勒|r 对话
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以请他们帮你移除|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_，不必自己处理。|r
    .train 7934 >> |cRXP_WARN_学习|r |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >> 制作一剂 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
step << !Dwarf Rogue
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包中的|T134437:0|t[抗毒药剂]移除|T136230:0|t[赞吉尔之触]减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
step << Rogue
    #optional
    #requires AntiVenomEnd2 << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,10 >> 进入军情7处总部，沿楼梯上楼前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r处
step << Rogue
    #label KlavenEnd
    #requires AntiVenomEnd2 << Rogue
    .goto StormwindClassic,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔|r 对话
    >>|cRXP_WARN_如果之前换上了|r |T135641:0|t[匕首] |cRXP_WARN_，记得重新装备主武器。|r << Rogue
    .turnin 2359 >> 交任务: 克拉文之塔
    .target 马迪亚斯·肖尔
----End of Rogue 20 Quest <1.59x Section----
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 对话
	.target 马库斯·乔纳森将军
    .goto StormwindClassic,63.982,75.338
    .turnin 120 >> 交任务: 送往暴风城的信
    .accept 121 >> 接任务: 送往暴风城的信
step
    #completewith next
    .goto Elwynn Forest,41.80,65.60,60 >> 前往闪金镇
step
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_铁匠阿古斯|r 对话
	.target 铁匠阿古斯
    .turnin 118 >> 交任务: 马掌
    .accept 119 >> 接任务: 回复弗纳
step
    #completewith next
    .goto Elwynn Forest,65.20,69.80,50 >> 前往阿祖拉之塔并登顶
step
    .goto Elwynn Forest,65.22,69.71
    .target 塞欧克瑞图斯
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t到顶部与 |cRXP_FRIENDLY_塞欧克瑞图斯|r 交谈
    .accept 94 >> 接任务: 法师的眼线
    .xp <20,1
step
    #label InRR
    #completewith FlyR
    .goto StormwindClassic,66.30,62.30,-1
	.goto Redridge Mountains,6.7,72.4,-1
    .zone Redridge Mountains >>前往: 赤脊山
    .fly Redridge >> 飞往赤脊山
    >>|cRXP_WARN_如果你正在闪金镇, 先回暴风城再乘坐飞行坐骑会更快|r
	>>|cRXP_WARN_要是你在阿祖拉之塔, 直接跑过去赤脊山就行|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 对话
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .turnin 119 >> 交任务: 回复弗纳
    .accept 124 >> 接任务: 豺狼人的乱吠
step
    #xprate <1.2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 对话
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .accept 122 >> 接任务: 雏龙的鳞片
step
    #label FlyR
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_所罗门镇长|r 对话
	.target 所罗门镇长
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    .turnin 121 >> 交任务: 送往暴风城的信
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希拉里|r交谈
	.target 希拉里
    .goto Redridge Mountains,29.24,53.63
    .turnin 3741 >> 交任务: 希拉里的项链
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_码头管理员巴伦|r 对话
	.target 码头管理员巴伦
    .goto Redridge Mountains,27.72,47.38
    .turnin 127 >> 交任务: 卖鱼
    .accept 150 >> 接任务: 鱼人偷猎者
    .turnin 150 >> 交任务: 鱼人偷猎者
step
#optional
#xprate >1.49
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 对话
	.target 厨师布雷纳
    .goto Redridge Mountains,22.67,43.83
    .accept 92 >> 接任务: 赤脊山炖肉
    .turnin 92 >> 交任务: 赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
step
    #optional
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 对话
	.target 厨师布雷纳
    .goto Redridge Mountains,22.67,43.83
    .accept 92 >> 接任务: 赤脊山炖肉
    .turnin 92 >> 交任务: 赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛蒂·詹罗斯|r 对话
	.target 玛蒂·詹罗斯
    .goto Redridge Mountains,21.86,46.33
    .turnin 130 >> 交任务: 寻访草药师
    .accept 131 >> 接任务: 水仙诉衷情
step
    #xprate <1.2
	#completewith next
	>>击杀|cRXP_ENEMY_黑龙雏龙|r，拾取|cRXP_LOOT_雏龙的鳞片|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob 黑龙雏龙
step
    #xprate <1.5
    >>击杀|cRXP_ENEMY_巨型血牙野猪|r，拾取|cRXP_LOOT_巨型血牙野猪头|r
    >>|cRXP_WARN_保留拾取的所有|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，用它们将|r |T133971:0|t[烹饪]|cRXP_WARN_练到50，这是之后暮色森林路线的要求|r
    .goto Redridge Mountains,15.73,52.83,60,0
    .goto Redridge Mountains,32.25,70.20,60,0
    .goto Redridge Mountains,31.02,72.14,60,0
    .goto Redridge Mountains,15.73,52.83
    .collect 2296,5,92,1
    .mob 巨型血牙野猪
step
#optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r 对话
	.target 厨师布雷纳
    .goto Redridge Mountains,22.67,43.83
    .accept 92 >> 接任务: 赤脊山炖肉
    .turnin 92 >> 交任务: 赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
step
    #xprate <1.2
	#completewith next
	>>击杀|cRXP_ENEMY_黑龙雏龙|r，拾取|cRXP_LOOT_雏龙的鳞片|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob 黑龙雏龙
step
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,22.5,35.7,0
    >>击杀|cRXP_ENEMY_赤脊山蛮兵|r和|cRXP_ENEMY_赤脊山秘法师|r，拾取|cRXP_LOOT_铁矛|r和|cRXP_LOOT_铁铆钉|r
    .complete 124,1 --Redridge Brute (10)
    .mob +赤脊山蛮兵
    .complete 124,2 --Redridge Mystic (8)
    .mob +赤脊山秘法师
    .complete 89,1 --Iron Pike (5)
    .mob +赤脊山秘法师
	.mob +赤脊山蛮兵
    .complete 89,2 --Iron Rivet (5)
	.mob +赤脊山秘法师
	.mob +赤脊山蛮兵
step
    #xprate <1.2
    .goto Redridge Mountains,43.47,31.68,50,0
    .goto Redridge Mountains,46.52,35.66,50,0
    .goto Redridge Mountains,34.56,65.79,50,0
    .goto Redridge Mountains,36.58,73.93
	>>击杀|cRXP_ENEMY_黑龙雏龙|r，拾取|cRXP_LOOT_雏龙的鳞片|r
	.mob 黑龙雏龙
    .complete 122,1 --Underbelly Whelp Scale (6)
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达希|r交谈
    >>|cRXP_FRIENDLY_达希|r|cRXP_WARN_ 在旅店里来回走动|r
	.target 达希
    .goto Redridge Mountains,26.80,44.30
    .turnin 131 >> 交任务: 水仙诉衷情
step
    #xprate <1.2
    #completewith next
    .goto Redridge Mountains,15.55,50.06,0
    .goto Redridge Mountains,19.24,41.53,0
    .goto Redridge Mountains,16.90,55.02,0
    .goto Redridge Mountains,26.52,44.95
    +|cRXP_WARN_提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_，使用之前收集的|r|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_。你需要50点|r|T133971:0|t[烹饪]
    +|cRXP_WARN_如果需要更多|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r |cRXP_WARN_，前往西边的|r |cRXP_ENEMY_贝利格拉布|r |cRXP_WARN_附近，击杀更多|r |cRXP_ENEMY_巨型血牙野猪|r
    .skill cooking,50,1
    .mob 巨型血牙野猪
step
    #xprate <1.2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 对话
	.target 弗纳·奥斯古
    .goto Redridge Mountains,31.00,47.30
    .turnin 124 >> 交任务: 豺狼人的乱吠
    .turnin 122 >> 交任务: 雏龙的鳞片
step
    #xprate >1.0
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗纳·奥斯古|r 对话
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .turnin 124 >> 交任务: 豺狼人的乱吠
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头奥斯洛|r 对话
	.target 工头奥斯洛
    .goto Redridge Mountains,32.10,48.70
    .turnin 89 >> 交任务: 止水湖上的桥
]])
----End of <1.59x Redridge----
----Start of Hunter-only Darkshore/Ashen (Needs to be merged)----
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#tbc
#season 0,1
#version 1
<< Alliance Hunter
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 19-21 Darkshore/Ashenvale
#next RestedXP Alliance 20-30\21-23 Ashenvale/Stonetalon
#displayname 19-21 黑海岸/灰谷
step
    #xprate >1.59
    .goto 1439,38.325,43.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_戈沙拉·夜语|r 对话
    .turnin 3765 >> 交任务: 遥远的旅途
    .target 戈沙拉·夜语
    .isOnQuest 3765
    .dungeon DM
step
	#xprate >1.59
    #optional
    .goto Darkshore,39.2,43.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵塞拉伊|r 对话，如果她已刷新
    .accept 990 >> 接任务: 灰谷之旅
    .target 哨兵塞拉伊
step
    #xprate >1.49
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r，拾取它们掉落的|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
    .mob 暗礁蟹
step
    #xprate >1.49
    .goto 1439,32.644,80.711
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接任务: 搁浅的海洋生物
step
    #xprate >1.49
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r，拾取它们掉落的|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
step
    #xprate >1.49
    .goto 1439,31.690,83.700
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接任务: 搁浅的海龟
step
    #xprate >1.49
    #loop
    .goto 1439,32.674,81.752,0
    .goto 1439,36.327,73.408,0
    .goto 1439,35.195,71.864,0
    .goto 1439,32.674,81.752,60,0
    .goto 1439,33.284,80.330,60,0
    .goto 1439,34.174,80.488,60,0
    .goto 1439,35.432,79.052,60,0
    .goto 1439,36.327,73.408,60,0
    .goto 1439,35.412,73.176,60,0
    .goto 1439,35.033,72.432,60,0
    .goto 1439,35.195,71.864,60,0
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r，拾取它们掉落的|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
    .mob 暗礁蟹
step
    #xprate >1.49
    .goto 1439,31.229,85.564
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接任务: 搁浅的海龟
step
    #xprate >1.49
    #label SeaCreatureEnd
    .goto 1439,31.251,87.419
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >> 接任务: 搁浅的海洋生物
    >>|cRXP_WARN_这个任务可能非常困难。请引开 |cRXP_ENEMY_鱼人|r，每次1只，打完1只再拉下一只，以免同时引到多只|r
    .link https://youtu.be/lfQM3Q-Ag5A >> |cRXP_WARN_点击此处查看视频攻略|r
step
    #optional
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安努|r 对话
    .turnin 951 >> 交任务: 玛塞斯特拉遗物
    .target 安努
    .isQuestTurnedIn 731 --Only shows if Prospector was already escorted
step
    #optional
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克罗尼亚·恒影|r 对话，开始护送任务
    >>|cRXP_WARN_如果他不在，就跳过这一步。他的刷新时间最长可达25分钟|r
    >>|cRXP_WARN_这是限时任务，你必须在25分钟内将他护送到灰谷|r
    .accept 5321 >> 接任务: 昏昏欲睡
    .target 克罗尼亚·恒影
    .isQuestTurnedIn 731 --Only shows if Prospector was already escorted
step
    #optional
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取其中的|T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .isQuestTurnedIn 731 --Only shows if Prospector was already escorted
step
    #sticky
    #label prospector
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r 对话
    >>|cRXP_WARN_你可能需要等待他刷新，或等其他玩家完成护送|r
    .turnin 729 >> 交任务: 健忘的勘察员
    .isOnQuest 729
    .target 勘察员雷姆塔维尔
step
    .goto Darkshore,35.72,83.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r 对话
    >>这会开始护送任务
    .accept 731,1 >> 接任务: 健忘的勘察员
    >>|cRXP_WARN_这个任务难度很高。如果既找不到队伍，也无法单人完成，就跳过这一步|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处查看视频攻略|r
    .target 勘察员雷姆塔维尔
    .isQuestAvailable 731
step
    #requires prospector
    >>|cRXP_WARN_护送 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r穿过挖掘场|r
    >>|cRXP_WARN_这个任务难度很高。如果既找不到队伍，也无法单人完成，就跳过这一步|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处查看视频攻略|r
    .complete 731,1
    .isOnQuest 731
step
    #optional
    #completewith TheryluneEnd
    >>击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，拾取它们掉落的|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    *|cRXP_WARN_小心，|cRXP_ENEMY_暮光暴徒|r会对你施放|r|T132343:0|t[缴械]|cRXP_WARN_，持续6秒|r << Rogue/Paladin/Warrior
    *|cRXP_WARN_小心，|cRXP_ENEMY_暮光信徒|r会施放|r|T135953:0|t[恢复]|cRXP_WARN_，还会施放需读条3秒的|r|T135915:0|t[治疗术]
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob 暮光信徒
    .mob 暮光暴徒
    --  .use 13536
step
    .goto 1439,38.660,87.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟瑞露尼|r 对话，开始护送任务
    >>|cRXP_WARN_如果她不在，就跳过这一步|r
    .accept 945 >> 接任务: 护送瑟瑞露尼
    .target 瑟瑞露尼
step
    #label TheryluneEnd
    .goto Darkshore,40.51,87.09
    >>|cRXP_WARN_护送|cRXP_FRIENDLY_瑟瑞露尼|r离开主宰之剑|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .isOnQuest 945
step
    #xprate <1.5
    #optional
    .goto 1439,31.251,87.419
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >> 接任务: 搁浅的海洋生物
    >>|cRXP_WARN_这个任务可能非常困难。请引开 |cRXP_ENEMY_鱼人|r，每次1只，打完1只再拉下一只，以免同时引到多只|r
    .link https://youtu.be/lfQM3Q-Ag5A >> |cRXP_WARN_点击此处查看视频攻略|r
step
    #xprate <1.5
    #optional
    .goto 1439,31.229,85.564
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接任务: 搁浅的海龟
step
    #xprate <1.5
    #optional
    .goto 1439,31.690,83.700
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接任务: 搁浅的海龟
step
    #xprate <1.5
    #optional
    .goto 1439,32.644,80.711
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接任务: 搁浅的海洋生物
step
	#xprate <1.5
    #optional
    .goto Darkshore,41.44,86.06,50,0
    .goto Darkshore,41.77,84.60,50,0
    .goto Darkshore,42.94,82.25,50,0
    .goto Darkshore,43.59,80.02,50,0
    .goto Darkshore,39.74,80.43,50,0
    .goto Darkshore,38.00,83.55
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取它们掉落的|cRXP_LOOT_灰色头皮|r
    >>小心，它们会施放|T132152:0|t[毁灭]：造成20-40点伤害的瞬发攻击，并|cRXP_WARN_将你击倒2秒|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob 灰斑蓟熊
step
    #xprate <1.5
    .goto Darkshore,41.389,80.565
    >>点击 |cRXP_PICK_传声盒525号|r，它就在地上
    .turnin 1003 >> 交任务: 传声盒525号
    .isOnQuest 1003
step
    #xprate <1.5
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃科尔|r 对话
    >>|cRXP_WARN_与他对话前，先清理洞穴附近的熊怪|r
    .turnin 993 >> 交任务: 丢失的主人
    .accept 994 >> 接任务: 杀出重围
    .target 沃科尔
    .isOnQuest 993
step
    #xprate <1.5
    #optional
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃科尔|r 对话
    >>|cRXP_WARN_与他对话前，先清理洞穴附近的熊怪|r
    .accept 994 >> 接任务: 杀出重围
    .target 沃科尔
    .isQuestTurnedIn 993
step
	#xprate >1.49
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃科尔|r 对话
    .turnin 993 >> 交任务: 丢失的主人
    .accept 995 >> 接任务: 偷偷溜走
    .target 沃科尔
    .isOnQuest 993
step
	#xprate >1.49
    #optional
    #label Escaped
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃科尔|r 对话
    .accept 995 >> 接任务: 偷偷溜走
    .target 沃科尔
    .isQuestTurnedIn 993
step
	#xprate <1.5
    .goto 1439,43.594,84.489,0
    .goto 1439,42.576,82.897,0
    .goto 1439,43.594,84.489,15,0
    .goto 1439,42.576,82.897,15,0
    .goto 1439,42.004,81.688
    >>护送|cRXP_FRIENDLY_沃科尔|r
    >>离开洞穴并经过第3个火把后，两侧都会刷新 |cRXP_ENEMY_熊怪|r，攻击 |cRXP_FRIENDLY_沃科尔|r
    >>前往道路的半途中，两侧会刷新|cRXP_ENEMY_熊怪|r并攻击|cRXP_FRIENDLY_沃科尔|r
    .complete 994,1 --Help Volcor to the road (1)
    .isQuestTurnedIn 993
step
	#xprate >1.49
    .goto Darkshore,44.44,84.69
    >>|cRXP_WARN_等待剧情演出结束|r
    .complete 995,1 --Help Volcor escape the cave (1)
    .isQuestTurnedIn 993
step
    #xprate >1.49
    #optional
    #completewith tower
    .equip 15 >>|cRXP_WARN_重新装备之前那件|r |T133762:0|t[披风]
    .itemStat 15,QUALITY,<7
    .isOnQuest 995
step
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安努|r 对话
    .turnin 951 >> 交任务: 玛塞斯特拉遗物
    .target 安努
    .isOnQuest 951
step
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克罗尼亚·恒影|r 对话，开始护送任务
    >>|cRXP_WARN_如果他不在，就跳过这一步。他的刷新时间最长可达25分钟|r
    >>|cRXP_WARN_这是限时任务，你必须在25分钟内将他护送到灰谷|r
    .accept 5321 >> 接任务: 昏昏欲睡
    .target 克罗尼亚·恒影
    .itemcount 13536,<1 --Horn of Awakening
step
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取其中的|T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .itemcount 13536,<1 --Horn of Awakening
step
    #label AshenStart
    #completewith tower
    .zone Ashenvale >> 向南前往灰谷
    .goto Ashenvale,29.7,13.6
step
    #sticky
    #completewith Kerlonian
    >>击杀任务途中遇到的|cRXP_WARN_幽爪奔跑者|r并拾取掉落物。保留获得的|T133970:0|t[|cRXP_LOOT_狼肋排|r]，后续烹饪任务需要10个
    .collect 1015,10
    .mob 幽爪奔跑者
step
    #label Kerlonian
    .goto Ashenvale,27.26,35.58
    >>|cRXP_WARN_护送 |cRXP_FRIENDLY_克罗尼亚|r 到灰谷的迈斯特拉岗哨|r
    .use 13536 >> |cRXP_WARN_使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r] |cRXP_WARN_，每当 |cRXP_FRIENDLY_克罗尼亚|r 睡着时，都要在他身边使用|r
    >>|cRXP_WARN_尽量别在主路上奔跑；敌人只会在道路上刷新。|r
    .complete 5321,2
    .isOnQuest 5321
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_利拉迪斯·月河|r 对话
	.target 利拉迪斯·月河
    .goto Ashenvale,27.26,35.58
    .turnin 5321 >> 交任务: 昏昏欲睡
    .isQuestComplete 5321
step
    #label tower
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_净化者德尔格伦|r 对话
	.target 净化者德尔格伦
    .goto Ashenvale,26.19,38.69
    .turnin 967 >> 交任务: 奥萨拉克斯之塔
step
	#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_净化者德尔格伦|r 对话
	.target 净化者德尔格伦
    .goto Ashenvale,26.19,38.69
    .accept 970 >> 接任务: 奥萨拉克斯之塔
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥雷迪尔·阔叶|r 对话
	.target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .accept 1010 >> 接任务: 巴斯兰的头发
    .xp <20,1
step
    #xprate <1.5
    .goto Ashenvale,31.25,30.70
    >>击杀|cRXP_ENEMY_暗滩祭司|r、|cRXP_ENEMY_暗滩精兵|r、|cRXP_ENEMY_暗滩执行者|r和|cRXP_ENEMY_暗滩挖掘者|r，拾取它们掉落的|cRXP_LOOT_发光的灵魂宝石|r
    >>此物品掉率较低，请耐心刷取
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
    >>|cRXP_WARN_它们像棕色的小袋子，不太容易发现。|r
    .complete 1010,1
    .isOnQuest 1010
step
    .goto Ashenvale,31.25,30.70
    .xp 20-1650 >>继续击杀|cRXP_ENEMY_暗滩的怪物|r，直到经验足够升到20级
    .mob 暗滩祭司
    .mob 暗滩精兵
    .mob 暗滩执行者
    .mob 暗滩挖掘者
step
	#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_净化者德尔格伦|r 对话
	.target 净化者德尔格伦
    .goto Ashenvale,26.19,38.69
    .turnin 970 >> 交任务: 奥萨拉克斯之塔
step
    .goto Ashenvale,31.89,22.53
    .xp 20 >> 刷到20级
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥雷迪尔·阔叶|r 对话
	.target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .accept 1010 >> 接任务: 巴斯兰的头发
step
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地上的|cRXP_PICK_草药|r，拾取其中的|cRXP_LOOT_巴斯兰的头发|r
    >>|cRXP_WARN_它们像棕色的小袋子，不太容易发现。|r
    .complete 1010,1
    .isOnQuest 1010
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥雷迪尔·阔叶|r 对话
	.target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .turnin 1010 >> 交任务: 巴斯兰的头发
    .accept 1020 >> 接任务: 奥雷迪尔的药剂
step
	#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_净化者德尔格伦|r 对话
    .goto Ashenvale,26.19,38.69
    .turnin 970 >> 交任务: 奥萨拉克斯之塔
    .accept 973 >> 接任务: 奥萨拉克斯之塔
    .target 净化者德尔格伦
step
    #sticky
    #completewith Astranaar
    >>击杀任务途中遇到的|cRXP_WARN_幽爪奔跑者|r并拾取掉落物。保留获得的|T133970:0|t[|cRXP_LOOT_狼肋排|r]，后续烹饪任务需要10个
    .collect 1015,10
    .mob 幽爪奔跑者
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟瑞希尔|r 对话
	.target 瑟瑞希尔
    .goto Ashenvale,22.64,51.91
    .turnin 945 >> 交任务: 护送瑟瑞露尼
    .isQuestComplete 945
step << Hunter
    #xprate <1.59
    .goto 1440/1,522.900,2716.100,30 >> 沿西北方向的坡道向上前进
step
    #xprate <1.59
    #completewith Astranaar
    >>保留最多6个|cRXP_LOOT_粘糊的蜘蛛腿|r，它们从本区域的|cRXP_ENEMY_蜘蛛|r身上掉落，留待后续使用
    .collect 2251,6,93,1 -- Gooey Spider Legs
step << Hunter
    #xprate <1.59
    #sticky
    .goto Ashenvale,17.976,60.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_波尔温|r 对话
    .trainer >> 学习宠物技能
    .target 波尔温
--XX Train in darn at 20 on 2x
step << Hunter
    #xprate <1.59
    .goto Ashenvale,18.010,59.832
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥林达尔·石鹿|r 对话
    .trainer >> 学习职业技能
    .train 5118 >> 学习 |T132242:0|t[猎豹守护]
    .target 奥林达尔·石鹿
step
    #label Astranaar
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黛琳希亚|r 对话
    .fp Astranaar>> 获取阿斯特兰纳飞行点
	.target 黛琳希亚
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛德瑞尔·速火|r 对话
	.target 辛德瑞尔·速火
    .goto Ashenvale,34.67,48.83
    .accept 1008 >> 接任务: 佐拉姆海岸
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵塞恩希尔|r 对话
	.target 哨兵塞恩希尔
    .goto Ashenvale,34.89,49.79
    .accept 1070 >> 接任务: 守卫石爪山
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_法德瑞斯·戈森沙尔|r 对话
	.target 法德瑞斯·戈森沙尔
    .goto Ashenvale,35.76,49.10
    .accept 1056 >> 接任务: 石爪峰之旅
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱恩·狼行者|r 对话
	.target 莱恩·狼行者
    .goto Ashenvale,36.61,49.58
    .accept 991 >> 接任务: 莱恩的净化
    .accept 1054 >> 接任务: 解除威胁
step
    #label HCHunterNoHS --hidden step for #include
step << !Dwarf/!Hunter
    #xprate <1.59
    .goto Ashenvale,36.99,49.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板基姆利雅|r 对话
    .home >> 将你的炉石设置为阿斯特兰纳
    .target 旅店老板基姆利雅
step
    #label HCHunterNoHSStart --hidden step for #include
step
    #xprate <1.59
    .goto Ashenvale,36.6,49.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛琳|r 对话
    .vendor >> |cRXP_BUY_必要时购买食物和水|r
    .target 玛琳
step
    #xprate <1.59
    .goto Ashenvale,37.36,51.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r 对话
	.target 皮尔图拉斯·怀特姆恩
    .turnin 1020 >> 交任务: 奥雷迪尔的药剂
    .timer 24,奥雷迪尔的药剂剧情演出
    .accept 1033 >> 接任务: 月神之泪
step << Hunter
    #xprate <1.59
    .goto Ashenvale,34.8,50.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈尔詹·橡木之心|r 对话
    .vendor >> |cRXP_BUY_必要时补充弹药|r
    .target 哈尔詹·橡木之心
step
    #xprate <1.59
    #completewith ElunesTear
    >>保留最多6个|cRXP_LOOT_粘糊的蜘蛛腿|r，它们从本区域的|cRXP_ENEMY_蜘蛛|r身上掉落，后续任务会用到
    .collect 2251,6,93,1 -- Gooey Spider Legs
step
    #xprate <1.59
    .goto Ashenvale,46.37,46.38
    >>拾取地上的|cRXP_LOOT_月神之泪|r
    .complete 1033,1
step
    #xprate <1.59
    #label ElunesTear
    .goto Ashenvale,37.36,51.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r 对话
	.target 皮尔图拉斯·怀特姆恩
    .turnin 1033 >> 交任务: 月神之泪
    .timer 17,月神之泪剧情演出
    .accept 1034 >> 接任务: 星尘废墟
step
    #xprate <1.59
    .goto Ashenvale,33.30,67.79
    >>搜寻|cRXP_PICK_覆盖着星尘的灌木丛|r，拾取|cRXP_LOOT_一份星尘|r
    >>|cRXP_WARN_它们的刷新点散布在整座岛上|r
    .complete 1034,1
step
    #xprate <1.5
    #completewith next
    .goto Ashenvale,31.67,64.24,15 >> 去山脚下
    .goto Ashenvale,31.21,61.60,15 >>爬山时一直向正北前进
step
    #xprate <1.5
    #completewith next
    .goto Ashenvale,27.50,60.76,8 >> 爬上火痕神殿入口右侧大树旁的山坡
    >>跳过树根，贴着右侧前进，以免引到怪物
step
    #xprate <1.5
    .goto Ashenvale,25.27,60.68
    >>击杀 |cRXP_ENEMY_伊克鲁德·玛格苏尔|r，拾取他掉落的 |cRXP_LOOT_魔典|r
    >>|cRXP_ENEMY_伊克鲁德·玛格苏尔|r |cRXP_WARN_会施放|r |T136221:0|t[伊克鲁德的守护者] |cRXP_WARN_（施法时间为5秒，会召唤2名虚空行者。能打断时请打断。）|r
    >>|cRXP_WARN_如有需要，先清出撤退路线，以便将这些敌人连同|cRXP_ENEMY_魅魔|r一起重置。如愿意，也可以跳过，等到23级再做。|r
    .complete 973,1
    .link https://youtu.be/03nTrdcQiKY >> |cRXP_WARN_点击这里查看视频参考|r
	.isOnQuest 973
    .mob 伊克鲁德·玛格苏尔
step
    #xprate <1.5
    .isQuestComplete 973
    .goto Ashenvale,26.19,38.69
    .target 净化者德尔格伦
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_净化者德尔格伦|r 对话
    .turnin 973 >> 交任务: 奥萨拉克斯之塔
step
    #label HCHunterEnd --hidden step for #include
step
    #xprate <1.59
    #sticky
    #completewith StatuetteStart
    >>保留最多6个|cRXP_LOOT_粘糊的蜘蛛腿|r，它们从本区域的|cRXP_ENEMY_蜘蛛|r身上掉落，后续任务会用到
    .collect 2251,6,93,1 -- Gooey Spider Legs
step
    #sticky
    #completewith StatuetteStart
    >>击杀任务途中遇到的|cRXP_WARN_幽爪奔跑者|r并拾取掉落物。保留获得的|T133970:0|t[|cRXP_LOOT_狼肋排|r]，后续烹饪任务需要10个
    .collect 1015,10
    .mob 幽爪奔跑者
step
    #label StatuetteStart
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔伦|r 对话
	.target 塔尔伦
    .goto Ashenvale,14.79,31.29
    .accept 1007 >> 接任务: 远古雕像
step
    #xprate <1.59
    #completewith nagas
    >>击杀|cRXP_ENEMY_怒尾纳迦|r，拾取它们掉落的|cRXP_LOOT_怒尾纳迦的头颅|r
    >>|cRXP_WARN_现在不必特意绕路完成此任务|r
	.mob 怒尾御浪者
	.mob 怒尾巫师
    .complete 1008,1
step
    #xprate <1.59
    .goto Ashenvale,14.20,20.64
    >>拾取地上的|cRXP_LOOT_古代雕像|r
    .complete 1007,1
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔伦|r 对话
	.target 塔尔伦
    .goto Ashenvale,14.79,31.29
    .turnin 1007 >> 交任务: 远古雕像
    .timer 22,远古雕像剧情演出
    .accept 1009 >> 接任务: 卢泽尔
step
    #xprate <1.59
    .goto Ashenvale,6.528,13.361
    >>击杀 |cRXP_ENEMY_卢泽尔|r, 搜刮 |cRXP_LOOT_佐拉姆之戒|r
    >>|cRXP_ENEMY_卢泽尔|r |cRXP_WARN_与 |cRXP_ENEMY_怒尾侍从|r 和 |cRXP_ENEMY_怒尾海巫|r 一同在岛上巡逻。必要时可以先击杀其中一只，再让其余敌人脱战|r
    >>|cRXP_WARN_如果你有|r |T133717:0|t[炸弹]|cRXP_WARN_/|r[手榴弹] |cRXP_WARN_，也可以用它们单独拉|r |cRXP_ENEMY_卢泽尔|r
    >>|cRXP_ENEMY_薇丝比娅|r |cRXP_WARN_是稀有怪，遇到时可以击杀；她也会掉落 |cRXP_LOOT_佐拉姆之戒|r。|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >> |cRXP_WARN_点击此处查看"分开拉怪"的视频参考|r
	.unitscan 薇丝比娅
	.mob 卢泽尔
    .complete 1009,1
    .skill engineering,<1,1
step
    #xprate <1.59
    #label nagas
    .goto Ashenvale,6.528,13.361
    >>击杀|cRXP_ENEMY_卢泽尔|r，拾取她掉落的|cRXP_LOOT_佐拉姆之戒|r
    >>|cRXP_ENEMY_卢泽尔|r |cRXP_WARN_与 |cRXP_ENEMY_怒尾侍从|r 和 |cRXP_ENEMY_怒尾海巫|r 一同在岛上巡逻。必要时可以先击杀其中一只，再让其余敌人脱战|r
    >>|cRXP_ENEMY_薇丝比娅|r|cRXP_WARN_是稀有怪，遇到时可以击杀；她也会掉落|cRXP_LOOT_佐拉姆之戒|r。|r
	.unitscan 薇丝比娅
	.mob 卢泽尔
    .complete 1009,1
step
    #xprate <1.59
    .goto Ashenvale,7.00,15.20,0
    .goto Ashenvale,14.46,17.15,0
    .goto Ashenvale,14.86,21.06,0
    .goto Ashenvale,13.13,25.03,0
    .goto Ashenvale,10.89,30.03,0
    .goto Ashenvale,7.00,15.20,70,0
    .goto Ashenvale,14.46,17.15,70,0
    .goto Ashenvale,14.86,21.06,70,0
    .goto Ashenvale,13.13,25.03,70,0
    .goto Ashenvale,10.89,30.03,70,0
    .goto Ashenvale,13.13,25.03,70,0
    .goto Ashenvale,14.86,21.06,70,0
    .goto Ashenvale,14.46,17.15,70,0
    >>击杀|cRXP_ENEMY_怒尾纳迦|r，拾取它们掉落的|cRXP_LOOT_怒尾纳迦的头颅|r
	.mob 怒尾御浪者
	.mob 怒尾巫师
    .mob 怒尾侍从
    .mob 怒尾女祭司
    .mob 怒尾纳迦
    .mob 怒尾海巫
    .complete 1008,1
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔伦|r 对话
	.target 塔尔伦
    .goto Ashenvale,14.79,31.29
    .turnin 1009 >> 交任务: 卢泽尔
step
    #xprate <1.59
    #sticky
    #completewith SoulGemStart
    >>保留最多6个|cRXP_LOOT_粘糊的蜘蛛腿|r，它们从本区域的|cRXP_ENEMY_蜘蛛|r身上掉落，后续任务会用到
    .collect 2251,6,93,1 -- Gooey Spider Legs
step
    #sticky
    #completewith SoulGemStart
    >>击杀任务途中遇到的|cRXP_WARN_幽爪奔跑者|r并拾取掉落物。保留获得的|T133970:0|t[|cRXP_LOOT_狼肋排|r]，后续烹饪任务需要10个
    .collect 1015,10
    .mob 幽爪奔跑者
step
    #label SoulGemStart
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泰洛尼斯的尸体|r 对话
	.target 泰洛尼斯的尸体
    .goto Ashenvale,20.31,42.33
    .turnin 991 >> 交任务: 莱恩的净化
    .accept 1023 >> 接任务: 莱恩的净化
step
    #sticky
    #completewith GlowingGem
    >>保留获得的|T134304:0|t[鱼人的鳍]，后续任务需要8个
    .collect 1468,8 --Murloc Fin(8)
step
    #label GlowingGem
    #xprate <1.59
    .goto Ashenvale,20.41,43.82,50,0
    .goto Ashenvale,19.43,42.09,50,0
    .goto Ashenvale,21.01,41.61,50,0
    .goto Ashenvale,20.31,42.33
    >>击杀|cRXP_ENEMY_盐沫鱼人|r，拾取它们掉落的|cRXP_LOOT_发光的宝石|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_盐沫智者|r会治疗，还会每隔几秒施放一次造成90点伤害的瞬发震击法术|r
	.mob 盐沫战士
	.mob 盐沫泥浆鱼人
	.mob 盐沫智者
	.mob 盐沫污水鱼人
    .complete 1023,1
step << Dwarf Hunter
    #xprate <1.59
    .hs >> 炉石回奥伯丁
step << !Dwarf/!Hunter
    #xprate <1.59
    #softcore
    #completewith next
    .deathskip >> 在湖东边找怪自杀, 然后在阿斯特兰纳 [灵魂医者] 处虚弱复活
step << !Dwarf/!Hunter
    #xprate <1.59
    #hardcore
    #completewith next
    .goto Ashenvale,34.40,48.00,200 >> 前往阿斯特兰纳
step << !Dwarf/!Hunter
    #xprate <1.59
    .goto Ashenvale,34.41,47.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黛琳希亚|r 对话
    .fly Darkshore>> 飞往黑海岸
    .target 黛琳希亚
step
    #xprate <1.59
    .goto Darkshore,37.44,41.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考古学家霍莉|r 对话
    .turnin 731 >> 交任务: 健忘的勘察员
    .accept 741 >> 接任务: 健忘的勘察员
    .target 考古学家霍莉
    .isQuestComplete 731
step
    #xprate <1.59
    #optional
    .goto Darkshore,37.44,41.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考古学家霍莉|r 对话
    .accept 741 >> 接任务：健忘的勘察员
    .target 考古学家霍莉
    .isQuestTurnedIn 731
step
    #xprate <1.59
    #completewith end
    .vendor >> 补充物资
step
    #xprate <1.59
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特伦希斯|r 对话
    .turnin 995 >> 交任务: 偷偷溜走
    .target 特伦希斯
    .isOnQuest 995
step
    #xprate <1.59
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特伦希斯|r 对话
    .turnin 994 >> 交任务: 杀出重围
    .target 特伦希斯
    .isOnQuest 994
step
    #xprate <1.59
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_温尼斯·布莱葛|r 对话
    .turnin 4730 >> 交任务: 搁浅的海洋生物
    .turnin 4731 >> 交任务: 搁浅的海龟
    .turnin 4732 >> 交任务: 搁浅的海龟
    .turnin 4733 >> 交任务: 搁浅的海洋生物
    .target 温尼斯·布莱葛
step
    #xprate <1.59
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯莱斯·月羽|r 对话
    .fly Teldrassil >> 飞往泰达希尔
	.target 凯莱斯·月羽
step
    #xprate <1.59
    #optional
    #completewith next
    .goto Teldrassil,55.889,89.456
    .zone Darnassus >> 通过紫色传送门进入达纳苏斯。
step << Hunter
    #xprate <1.59
    .goto Darnassus,40.377,8.545
    .target 祖卡斯特
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_祖卡斯特|r 对话
    .trainer >> 学习职业法术
    .xp <22,1
step
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加瑞斯|r 对话
    .goto Darnassus,40.0,42.2
    .bankdeposit 5996,1468,2251,1015 >> 将以下物品存入银行
    .target 加瑞斯
    >>|T134797:0|t[水下呼吸药剂] --5996
    >>|T134304:0|t[鱼人的鳍] --1468
    >>|T134321:0|t[粘糊的蜘蛛腿] --2251
    >>|T133970:0|t[狼肋排] --1015
step << Dwarf Hunter
    #xprate <1.59
-- #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊琳尼雅·月火|r 对话
    .skipgossip 11866,1
    .goto Darnassus,57.56,46.72
    .train 264 >> 学习弓箭
    .train 227 >> 学习法杖
    .target 伊琳尼雅·月火
    .dungeon DM
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r 对话
	.target 首席考古学家杜瑟·灰须
    .goto Teldrassil,23.70,64.51
    .turnin 741 >> 交任务: 健忘的勘察员
    .accept 942 >> 接任务: 健忘的勘察员
    .isOnQuest 741
step
    #optional
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r 对话
	.target 首席考古学家杜瑟·灰须
    .goto Teldrassil,23.70,64.51
    .accept 942 >> 接任务: 健忘的勘察员
    .isQuestTurnedIn 741
step << !Dwarf/!Hunter
    #xprate <1.59
    #label end
    .hs >> 炉石回阿斯特兰纳
step << Dwarf Hunter
    #xprate <1.59
    .goto Darnassus,29.466,41.405
    .zone Teldrassil >> 通过紫色传送门前往鲁瑟兰村。
    .zoneskip Ashenvale
    .zoneskip Darkshore
step << Dwarf Hunter
    #xprate <1.59
    #label end
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维斯派塔斯|r 对话
    .fly Ashenvale >> 飞往灰谷
    .target 维斯派塔斯
    .zoneskip Ashenvale
]])
----End of Hunter-only Darkshore/Ashen (Needs to be merged)----
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#tbc
#season 0,1
#version 1
<< Alliance !Hunter
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 20-21 Darkshore/Ashenvale
#next RestedXP Alliance 20-30\21-23 Stonetalon/Ashenvale;RestedXP Alliance 20-30\21-22 Ashenvale SoD
#displayname 20-21 黑海岸/灰谷
step << Druid
    #xprate <1.59
	#completewith next
	.cast 18960 >> 施放传送：月光林地
	.zoneskip Moonglade
step << Druid
    #xprate <1.59
    .goto Moonglade,52.53,40.57
	>>去月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .trainer >> 学习职业法术
    .target 洛甘纳尔
step
    #xprate <1.59
    #optional
    #completewith TheryluneEnd
    .hs >> 炉石回奥伯丁
step
    .goto Darkshore,37.21,44.22
    >>点击 [|cRXP_PICK_通缉告示|r]
    .accept 4740 >> 接任务：通缉：莫克迪普！
step
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴瑞萨斯·月影|r 对话
    .accept 948 >> 接任务：安努
    .target 巴瑞萨斯·月影
step
    .goto Darkshore,37.44,41.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_考古学家霍莉|r 对话
    .accept 729 >> 接任务：健忘的勘察员
    .target 考古学家霍莉
step
    #xprate <1.59
    .goto 1439,38.325,43.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_戈沙拉·夜语|r 对话
    .turnin 3765 >> 交任务：遥远的旅途
    .target 戈沙拉·夜语
    .isOnQuest 3765
--  .dungeon !DM << NightElf Warrior/Mage/Warlock/Rogue
step
    #xprate >1.59
    .goto 1439,38.325,43.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_戈沙拉·夜语|r 对话
    .turnin 3765 >> 交任务：遥远的旅途
    .target 戈沙拉·夜语
    .isOnQuest 3765
    .dungeon !DM << NightElf Warrior/Mage/Warlock/Rogue
step
    .goto 1439,39.373,43.483
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特伦希斯|r 对话
    .accept 993 >> 接任务：丢失的主人
	.target 特伦希斯
    .isQuestTurnedIn 986
step
    #optional
    #completewith OnuGrove
    >>|cRXP_WARN_如果你装备了|r |T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_，记得留好当前披风，因为后续交任务时这件|r |T133762:0|t[附有魔法的月虎披风] |cRXP_WARN_会被收回。|r
    .equip 15,5387 >>|cRXP_WARN_如果|r |T133762:0|t[附有魔法的月虎披风] |cRXP_WARN_比你现在的披风更好，就装备它。|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7
step
	#xprate <1.5 --<< !NightElf/Hunter
    #completewith MasterG
    #optional
    .goto Darkshore,40.23,81.28,0
    >>击杀 |cRXP_ENEMY_灰斑蓟熊|r, 搜刮 |cRXP_LOOT_头皮|r
    >>注意它们的 |T132152:0|t[毁灭]——瞬发攻击, 造成 20-40 点伤害并 |cRXP_WARN_将你击倒 2 秒|r
    .complete 1003,1
    .isOnQuest 1003
    .mob 灰斑蓟熊
step
    #optional
    #completewith OnuGrove
    .goto 1439,43.555,76.293,80 >> 前往古树之林
step
    #xprate >1.49
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安努|r 对话
    .turnin 951 >> 交任务：玛塞斯特拉遗物
    .target 安努
    .isQuestComplete 951
step
    #xprate >1.49
    #label OnuGrove
    #optional
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安努|r 对话
    .turnin 948 >> 交任务：安努
    .target 安努
    .isOnQuest 948
step
    #xprate >1.49
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃科尔|r 交谈
    .turnin 993 >> 交任务：丢失的主人
    .accept 995 >> 接任务：偷偷溜走
    .timer 20,偷偷溜走剧情演出
    .target 沃科尔
    .isOnQuest 993
step
    #xprate >1.49
    #optional
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃科尔|r 交谈
    .accept 995 >> 接任务：偷偷溜走
    .timer 20,偷偷溜走剧情演出
    .target 沃科尔
    .isQuestTurnedIn 993
step
    #xprate >1.49
    .goto Darkshore,44.44,84.69
    >>|cRXP_WARN_等待剧情演出结束|r
    .complete 995,1 --Help Volcor escape the cave (1)
    .isOnQuest 995
step
    #xprate >1.49
    #optional
    #completewith Murkdeep
    .equip 15 >>|cRXP_WARN_重新装备之前那件|r |T133762:0|t[披风]
    .itemStat 15,QUALITY,<7
    .isOnQuest 995
step
    #xprate <1.5
    #label OnuGrove
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安努|r 对话
    .turnin 952 >> 交任务：古树之林 << NightElf
    .turnin 948 >> 交任务：安努
    .accept 944 >> 接任务：主宰之剑
    .target 安努
step
    #xprate <1.5
    #label MasterG
    .goto Darkshore,38.54,86.05,100 >> 前往主宰之剑
    .subzoneskip 449
    .isOnQuest 944
step
    #optional
    #completewith TheryluneEnd
    >>击杀 |cRXP_ENEMY_暮光信徒|r 和 |cRXP_ENEMY_暮光暴徒|r，搜刮 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r]。
    *|cRXP_WARN_小心，|cRXP_ENEMY_暮光暴徒|r 会对你施放|r |T132343:0|t[缴械] |cRXP_WARN_，持续6秒。|r << Rogue/Paladin/Warrior
    *|cRXP_WARN_小心，|cRXP_ENEMY_暮光信徒|r 会施放|r |T135953:0|t[恢复] |cRXP_WARN_，还会施放需3秒施法的|r |T135915:0|t[治疗术]
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob 暮光信徒
    .mob 暮光暴徒
--  .use 13536
step
    #xprate <1.5
    #optional
    .goto Darkshore,38.54,86.05
    >>探索主宰之剑区域
    .complete 944,1 --Enter the Master's Glaive (1)
step
    #xprate <1.5
    #completewith next
    .cast 5809 >> |cRXP_WARN_使用|r |T134715:0|t[占卜之水] |cRXP_WARN_并将其放在地上。|r
    .use 5251
step
    #xprate <1.5
    .goto Darkshore,38.54,86.05
    >>|cRXP_WARN_点击地上的 |cRXP_PICK_占卜之碗|r|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接任务：暮光之锤的营地
    .use 5251
step
    #xprate <1.5
    .goto 1439,38.537,86.050
    >>点击北侧基座上的 |cRXP_PICK_暮光之书|r
    .turnin 949 >> 交任务：暮光之锤的营地
    .accept 950 >> 接任务：向安努回复
step
    .goto 1439,38.660,87.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟瑞露尼|r 对话，开始护送任务
    >>|cRXP_WARN_如果她不在，就跳过这一步|r
    .accept 945 >> 接任务：护送瑟瑞露尼
    .target 瑟瑞露尼
step
    #label TheryluneEnd
    .goto Darkshore,40.51,87.09
    >>|cRXP_WARN_护送 |cRXP_FRIENDLY_瑟瑞露尼|r 离开主宰之剑|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .isOnQuest 945
step
	#xprate <1.5 --<< !NightElf/Hunter
    #completewith prospectorEscort
    #optional
    .goto Darkshore,40.23,81.28,0
    >>击杀 |cRXP_ENEMY_灰斑蓟熊|r, 搜刮 |cRXP_LOOT_头皮|r
    >>注意它们的 |T132152:0|t[毁灭]——瞬发攻击, 造成 20-40 点伤害并 |cRXP_WARN_将你击倒 2 秒|r
    .complete 1003,1
    .isOnQuest 1003
    .mob 灰斑蓟熊
step
    #sticky
    #label prospector
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r 对话
    >>|cRXP_WARN_你可能得等他刷新, 或等别人把护送做完|r
    .turnin 729 >> 交任务：健忘的勘察员
    .target 勘察员雷姆塔维尔
    .isOnQuest 729
step
    #label prospectorEscort
    .goto Darkshore,35.72,83.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r 对话，开始护送任务
    .accept 731,1 >> 接任务：健忘的勘察员
    >>|cRXP_WARN_这个任务难度很高。如果既找不到队伍，也无法单人完成，请跳过这一步。|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处查看视频攻略|r
    .target 勘察员雷姆塔维尔
    .isQuestAvailable 731
step
    #requires prospector
    >>|cRXP_WARN_护送 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r 走完整个挖掘场|r
    >>|cRXP_WARN_这个任务难度很高。如果既找不到队伍，也无法单人完成，请跳过这一步。|r
    .link https://www.youtube.com/watch?v=crQAvyRIceU >> |cRXP_WARN_点击此处查看视频攻略|r
    .complete 731,1
    .isOnQuest 731
step
    #xprate <1.5
    #optional
    #completewith Murkdeep
    >>击杀 |cRXP_ENEMY_硬壳潮行蟹|r 和 |cRXP_ENEMY_暗礁蟹|r, 搜刮 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
    .mob 暗礁蟹
step
    #xprate >1.49
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_硬壳潮行蟹|r 和 |cRXP_ENEMY_暗礁蟹|r, 搜刮 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
    .mob 暗礁蟹
step
    #xprate >1.49
    .goto 1439,32.644,80.711
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接任务：搁浅的海洋生物
step
    #xprate >1.49
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_硬壳潮行蟹|r, 搜刮 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
step
    #xprate >1.49
    .goto 1439,31.690,83.700
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接任务：搁浅的海龟
step
    #xprate >1.49
    #loop
    .goto 1439,32.674,81.752,0
    .goto 1439,36.327,73.408,0
    .goto 1439,35.195,71.864,0
    .goto 1439,32.674,81.752,60,0
    .goto 1439,33.284,80.330,60,0
    .goto 1439,34.174,80.488,60,0
    .goto 1439,35.432,79.052,60,0
    .goto 1439,36.327,73.408,60,0
    .goto 1439,35.412,73.176,60,0
    .goto 1439,35.033,72.432,60,0
    .goto 1439,35.195,71.864,60,0
    >>击杀 |cRXP_ENEMY_硬壳潮行蟹|r 和 |cRXP_ENEMY_暗礁蟹|r, 搜刮 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
    .mob 暗礁蟹
step
    #xprate >1.49
    .goto 1439,31.229,85.564
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接任务：搁浅的海龟
step
    .goto 1439,31.251,87.419
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >> 接任务：搁浅的海洋生物
    >>|cRXP_WARN_此任务可能非常困难。逐个（1 对 1）击杀|cRXP_ENEMY_鱼人|r，否则可能同时引到多个敌人|r
    .link https://youtu.be/lfQM3Q-Ag5A >> |cRXP_WARN_点击此处查看视频攻略|r
step
    #xprate <1.5
    .goto 1439,31.229,85.564
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4732 >> 接任务：搁浅的海龟
step
    #xprate <1.5
    #optional
    .goto 1439,31.690,83.700
    >>点击 |cRXP_PICK_搁浅的海龟|r
    .accept 4731 >> 接任务：搁浅的海龟
step
    #xprate <1.5
    #optional
    .goto 1439,32.644,80.711
    >>点击 |cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >> 接任务：搁浅的海洋生物
step
    #xprate <1.5
    #optional
    #label Murkdeep
    .goto 1439,35.429,76.566,0
    .goto 1439,35.429,76.566,60,0
    .goto Darkshore,36.64,76.53
    >>|cRXP_WARN_先检查 |cRXP_ENEMY_莫克迪普|r 是否已在水中（如果其他玩家之前未完成战斗，或没有击杀与他同时刷新的 |cRXP_ENEMY_灰雾猎人|r，他可能会留在那里）|r
    >>击杀营地里的 |cRXP_ENEMY_灰雾战士|r 和 |cRXP_ENEMY_灰雾猎人|r
    >>|cRXP_WARN_前往营地中央的篝火处，触发与 |cRXP_ENEMY_莫克迪普|r 的战斗：|r
    >>|cRXP_WARN_水中会刷出3波敌人，击杀前一波后才会出现下一波：第1波为3只12-13级的|cRXP_ENEMY_灰雾滩行者|r，第2波为2只15-16级的|cRXP_ENEMY_灰雾战士|r，第3波为19级的|cRXP_ENEMY_莫克迪普|r和16-17级的|cRXP_ENEMY_灰雾猎人|r。你可以远离篝火，避免引到下一波敌人|r
    .complete 4740,1 -- Murkdeep (1)
    .unitscan 莫克迪普
    .mob 灰雾战士
    .mob 灰雾猎人
    .mob 灰雾滩行者
step
    #xprate <1.5
    #loop
    .goto 1439,32.674,81.752,0
    .goto 1439,36.327,73.408,0
    .goto 1439,35.195,71.864,0
    .goto 1439,32.674,81.752,60,0
    .goto 1439,33.284,80.330,60,0
    .goto 1439,34.174,80.488,60,0
    .goto 1439,35.432,79.052,60,0
    .goto 1439,36.327,73.408,60,0
    .goto 1439,35.412,73.176,60,0
    .goto 1439,35.033,72.432,60,0
    .goto 1439,35.195,71.864,60,0
    >>击杀 |cRXP_ENEMY_硬壳潮行蟹|r 和 |cRXP_ENEMY_暗礁蟹|r, 搜刮 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
    .mob 暗礁蟹
step
	#xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto Darkshore,41.44,86.06,50,0
    .goto Darkshore,41.77,84.60,50,0
    .goto Darkshore,42.94,82.25,50,0
    .goto Darkshore,43.59,80.02,50,0
    .goto Darkshore,39.74,80.43,50,0
    .goto Darkshore,38.00,83.55
    >>击杀 |cRXP_ENEMY_灰斑蓟熊|r, 搜刮 |cRXP_LOOT_头皮|r
    >>注意它们的 |T132152:0|t[毁灭]——瞬发攻击, 造成 20-40 点伤害并 |cRXP_WARN_将你击倒 2 秒|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob 灰斑蓟熊
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto Darkshore,41.389,80.565
    >>点击地面上的 |cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务：传声盒525号
    .isOnQuest 1003
step
    #xprate <1.5
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安努|r 对话
    .turnin 951 >> 交任务：玛塞斯特拉遗物
    .target 安努
    .isQuestComplete 951
step
    #xprate <1.5
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安努|r 对话
    .turnin 950 >> 交任务：向安努回复
    .target 安努
step
    #xprate <1.5
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克罗尼亚·恒影|r 对话，开始护送任务
    >>|cRXP_WARN_如果他不在，就跳过这一步。他的刷新时间最长可达 25 分钟|r
    >>|cRXP_WARN_这是一个限时任务, 你必须在 25 分钟内护送他抵达灰谷|r
    .accept 5321 >> 接任务：昏昏欲睡
    .target 克罗尼亚·恒影
step
    #xprate <1.5
    .goto Darkshore,44.38,76.30
    >>打开 |cRXP_PICK_克罗尼亚的箱子|r, 拾取 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .isOnQuest 5321
step
#xprate <1.5
    #completewith volcorEnd
    .goto Ashenvale,27.26,35.58
    +|cRXP_FRIENDLY_克罗尼亚|r 会跟随你，偶尔也会协助战斗。|cRXP_WARN_别让他掉队：睡着时他会停下来。你有25分钟抵达灰谷并完成任务。|r
    .use 13536 >> |cRXP_WARN_在他睡着时使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r] |cRXP_WARN_；使用时要站在|cRXP_FRIENDLY_克罗尼亚·恒影|r身旁，将他唤醒|r
    >>|cRXP_WARN_尽量避开主路；敌人只会在你走上道路时刷新。|r
    .isOnQuest 5321
step
#xprate <1.5
    #completewith next
    .goto Darkshore,45.00,85.30,30 >> 前往山洞里的 |cRXP_FRIENDLY_沃科尔|r 处
    .isOnQuest 993
step
#xprate <1.5
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃科尔|r 交谈
    .turnin 993 >> 交任务：丢失的主人
    .accept 995 >> 接任务：偷偷溜走
    .timer 20,偷偷溜走剧情演出
    .target 沃科尔
step
#xprate <1.5
    #label volcorEnd
    .goto Darkshore,44.44,84.69
    >>|cRXP_WARN_等待剧情演出结束|r
    .complete 995,1
    .isOnQuest 995
step -- adjusted to heading there straight from southern most beached sea creature
#xprate >1.49
    #completewith tower
    .zone Ashenvale >> 向南前往灰谷
    .goto Ashenvale,25.77,14.55
step
#xprate <1.50
    #completewith tower
    .zone Ashenvale >> 向南前往灰谷
    .goto Ashenvale,29.7,13.6
step
#xprate <1.5
    .goto Ashenvale,27.26,35.58
    >>|cRXP_WARN_护送 |cRXP_FRIENDLY_克罗尼亚|r 去灰谷的迈斯特拉岗哨|r
    .use 13536 >> |cRXP_WARN_在他睡着时使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r] |cRXP_WARN_；使用时要站在|cRXP_FRIENDLY_克罗尼亚·恒影|r身旁，将他唤醒|r
    >>|cRXP_WARN_尽量避开主路；敌人只会在你走上道路时刷新。|r
    .complete 5321,2
    .isOnQuest 5321
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_利拉迪斯·月河|r 交谈
	.target 利拉迪斯·月河
    .goto Ashenvale,27.26,35.58
    .turnin 5321 >> 交任务：昏昏欲睡
    .isQuestComplete 5321
step << Paladin
    #season 2
    .goto Ashenvale,26.19,38.69
    >>与 |cRXP_FRIENDLY_净化者德尔格伦|r 对话
    .turnin 967 >> 交任务：奥萨拉克斯之塔
    --.accept 970 >> Accept The Tower of Althalaxx
    .turnin 78088 >> 交任务：奇怪的神器
    .accept 78089 >> 接任务：暴风城的建议
    .target 净化者德尔格伦
    .train 410014,1
    .itemcount 209836,1 --Athalaxx Orb (1)
step << Paladin
    #season 2
    #label tower
    #optional
    .goto Ashenvale,26.19,38.69
    >>与 |cRXP_FRIENDLY_净化者德尔格伦|r 对话
    .turnin 967 >> 交任务：奥萨拉克斯之塔
    --.accept 970 >> Accept The Tower of Althalaxx
    .accept 78089 >> 接任务：暴风城的建议
    .target 净化者德尔格伦
    .train 410014,1
    .isQuestTurnedIn 78088
step << !Warlock
    #season 0,1 << Paladin
	#xprate >1.49
    #label tower
    .goto Ashenvale,26.19,38.69
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_净化者德尔格伦|r 对话
    .turnin 967 >> 交任务：奥萨拉克斯之塔
    .target 净化者德尔格伦
step
    #season 0,1 << Paladin
	#xprate <1.5 << !Warlock
    #label tower
    .goto Ashenvale,26.19,38.69
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_净化者德尔格伦|r 对话
    .turnin 967 >> 交任务：奥萨拉克斯之塔
    .accept 970 >> 接任务：奥萨拉克斯之塔
    .target 净化者德尔格伦
step
    #xprate <1.59
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥雷迪尔·阔叶|r 对话
	.target 奥雷迪尔·阔叶
    .goto Ashenvale,26.43,38.59
    .accept 1010 >> 接任务：巴斯兰的头发
    .xp <20,1
step
    #xprate <1.5
    .goto Ashenvale,31.25,30.70
    >>击杀 |cRXP_ENEMY_暗滩祭司|r 和 |cRXP_ENEMY_暗滩精兵|r, 搜刮 |cRXP_LOOT_发光的灵魂宝石|r
    .complete 970,1
    .mob 暗滩祭司
    .mob 暗滩精兵
step
    .goto Ashenvale,31.25,30.70
    .xp 20-1650 >>继续击杀|cRXP_ENEMY_暗滩怪物|r，直到经验足够升到20级
    .mob 暗滩祭司
    .mob 暗滩精兵
    .mob 暗滩执行者
    .mob 暗滩挖掘者
step
    #xprate <1.59
    #optional
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>点击地上的 |cRXP_PICK_草药|r，拾取 |cRXP_LOOT_巴斯兰的头发|r。
    >>|cRXP_WARN_它们像棕色的小袋子，可能有一部分埋在地里，不太容易发现。|r
    >>|cRXP_WARN_请确保已启用|r |T134916:0|t[寻找草药] |cRXP_WARN_，这样才能在小地图上看到这些草药。|r
    .complete 1010,1 --Bathran's Hair (5)
    .isOnQuest 1010
    .skill herbalism,<1,1
step
    #xprate <1.59
    #optional
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>点击地上的 |cRXP_PICK_草药|r，拾取 |cRXP_LOOT_巴斯兰的头发|r。
    >>|cRXP_WARN_它们像棕色的小袋子，可能有一部分埋在地里，不太容易发现。|r
    .complete 1010,1 --Bathran's Hair (5)
    .isOnQuest 1010
    .skill herbalism,1,1
step
    #xprate <1.59
    #optional
    .goto Ashenvale,26.43,38.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥雷迪尔·阔叶|r 对话
    .turnin 1010 >> 交任务：巴斯兰的头发
    .accept 1020 >> 接任务：奥雷迪尔的药剂
    .target 奥雷迪尔·阔叶
    .isQuestComplete 1010
step
    #optional
    #xprate <1.59
    .goto Ashenvale,26.43,38.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥雷迪尔·阔叶|r 对话
    .accept 1020 >> 接任务：奥雷迪尔的药剂
    .target 奥雷迪尔·阔叶
    .isQuestTurnedIn 1010
step
	#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_净化者德尔格伦|r 对话
	.target 净化者德尔格伦
    .goto Ashenvale,26.19,38.69
    .turnin 970 >> 交任务：奥萨拉克斯之塔
    .accept 973 >> 接任务：奥萨拉克斯之塔
step
    #xprate <1.59
    .goto Ashenvale,31.89,22.53
    .xp 20 >> 刷到20级
step
    .goto Ashenvale,26.43,38.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥雷迪尔·阔叶|r 对话
    .accept 1010 >> 接任务：巴斯兰的头发
    .target 奥雷迪尔·阔叶
step
    #optional
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>点击地上的 |cRXP_PICK_草药|r，拾取 |cRXP_LOOT_巴斯兰的头发|r。
    >>|cRXP_WARN_它们像棕色的小袋子，可能有一部分埋在地里，不太容易发现。|r
    >>|cRXP_WARN_请确保已启用|r |T134916:0|t[寻找草药] |cRXP_WARN_，这样才能在小地图上看到这些草药。|r
    .complete 1010,1 --Bathran's Hair (5)
    .skill herbalism,<1,1
step
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>点击地上的 |cRXP_PICK_草药|r，拾取 |cRXP_LOOT_巴斯兰的头发|r。
    >>|cRXP_WARN_它们像棕色的小袋子，可能有一部分埋在地里，不太容易发现。|r
    .complete 1010,1 --Bathran's Hair (5)
    .skill herbalism,1,1
step
    .goto Ashenvale,26.43,38.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥雷迪尔·阔叶|r 对话
    .turnin 1010 >> 交任务：巴斯兰的头发
    .accept 1020 >> 接任务：奥雷迪尔的药剂
    .target 奥雷迪尔·阔叶
step
    #xprate >1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟瑞希尔|r 交谈
	.target 瑟瑞希尔
    .goto Ashenvale,22.64,51.91
    .turnin 945 >> 交任务：护送瑟瑞露尼
    .isQuestComplete 945
step
    #optional
    #completewith TZS
    .subzone 415 >> 前往阿斯特兰纳
step
    #label AshenvaleEnd
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_黛琳希亚|r 对话
    .fp Astranaar >> 获取阿斯特兰纳飞行点
	.target 黛琳希亚
step
    #label TZS
    .goto Ashenvale,34.67,48.83
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛德瑞尔·速火|r 对话
    .accept 1008 >> 接任务：佐拉姆海岸
    .target 辛德瑞尔·速火
step
    #xprate <1.59
    .goto Ashenvale,34.89,49.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哨兵塞恩希尔|r 对话
    .accept 1070 >> 接任务：守卫石爪山
    .target 哨兵塞恩希尔
step
    #xprate <1.59
    .goto Ashenvale,35.76,49.10
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_法德瑞斯·戈森沙尔|r 对话
    .accept 1056 >> 接任务：石爪峰之旅
    .target 法德瑞斯·戈森沙尔
step
    #xprate <1.59
    .goto Ashenvale,36.61,49.58
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱恩·狼行者|r 对话
    .accept 991 >> 接任务：莱恩的净化
    .accept 1054 >> 接任务：解除威胁
    .target 莱恩·狼行者
step << !Warlock
    #xprate <1.59
    .goto Ashenvale,36.99,49.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板基姆利雅|r 对话
    .home 415 >> 将你的炉石设置为阿斯特兰纳
    .target 旅店老板基姆利雅
step
    #xprate <1.59
    .goto Ashenvale,37.36,51.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r 对话
	.target 皮尔图拉斯·怀特姆恩
    .turnin 1020 >> 交任务：奥雷迪尔的药剂
    .timer 24,奥雷迪尔的药剂剧情演出
    .accept 1033 >> 接任务：月神之泪
]])
