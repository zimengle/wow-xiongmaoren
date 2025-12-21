local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

----Start of <1.5x Westfall----
----Night Elves and Hunters stay in Darkshore and Grind----

RXPGuides.RegisterGuide([[
#xprate <1.5
#classic
#season 0,1
#version 1
<< Alliance
#name 13-15 西部荒野
#displayname 14-15 西部荒野 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Dwarf/Gnome
#displayname 13-15 西部荒野 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|rl
#group RestedXP 联盟 1-20级
#next 14-16 黑海岸
#defaultfor !NightElf !Hunter

step
    #sticky
    #optional
    .goto Elwynn Forest,19.00,81.00
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    .goto Westfall,59.95,19.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r交谈
    .accept 64 >>接任务: |cRXP_LOOT_遗失的怀表|r
    .target Farmer Furlbrow
step
    .goto Westfall,59.92,19.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .accept 151 >>接任务: |cRXP_LOOT_老马布兰契|r
    .target Verna Furlbrow
step
    #completewith SalmaS
    .goto Westfall,56.04,31.23,65 >>前往萨尔迪安农场
step
    .goto Westfall,56.04,31.23
    .target Farmer Saldean
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .accept 9 >>接任务: |cRXP_LOOT_清理荒野|r
step
    #label SalmaS
    .goto Westfall,56.40,30.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .turnin 36 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
    .target Salma Saldean
    .accept 38 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .accept 22 >>接任务: |cRXP_LOOT_猪肝馅饼|r
step << Human
    #label Lewis
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官刘易斯|r交谈
    .target Quartermaster Lewis
    .goto Westfall,57.00,47.17
    .turnin 6285 >>交任务: |cRXP_FRIENDLY_返回西部荒野|r
step << Gnome/Dwarf
    #completewith next
    .goto Westfall,56.33,47.52
    .target Gryan Stoutmantle
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 109 >>交任务: |cRXP_FRIENDLY_向格里安·斯托曼报到|r
    .isOnQuest 109
step
    .goto Westfall,56.33,47.52
    .target Gryan Stoutmantle
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 12 >>接任务: |cRXP_LOOT_西部荒野人民军|r
step
    #xprate <1.2
    .goto Westfall,56.42,47.62
    .target Captain Danuvin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与丹努文队长交谈|cRXP_FRIENDLY_丹努文队长|r
    .accept 102 >>接任务: |cRXP_LOOT_西部荒野的豺狼人|r
step << Human
    #requires Lewis
    .goto Westfall,54.00,53.00
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target Scout Galiaan
    .accept 153 >>接任务: |cRXP_LOOT_红色皮质面罩|r
step << !Human
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target Scout Galiaan
    .goto Westfall,54.00,53.00
    .accept 153 >>接任务: |cRXP_LOOT_红色皮质面罩|r
step
    .goto Westfall,52.86,53.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_如需, 请购买食物或饮水|r
    .vendor >>|T133918:0|t[长嘴泥鳅]|cRXP_WARN_非常便宜|r
	.target Innkeeper Heather
step
	#completewith GnollPaws
    >>打开地面上的|cRXP_PICK_Sacks of Oats|r, 拾取其中的|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_你通常可以在农场围栏或建筑物附近找到它们|r
    .complete 151,1 --Handful of Oats (8)
step
    #completewith TravelCompass
    >>击杀|cRXP_ENEMY_幼年血牙野猪|r和|cRXP_ENEMY_小碎尸鸟|r. 击败它们后搜刮掉落的|cRXP_LOOT_秃鹫肉|r和|cRXP_LOOT_猪鼻|r和|cRXP_LOOT_猪肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +Young Fleshripper
    .mob +Fleshripper
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +Young Goretusk
    .mob +Goretusk
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +Young Goretusk
    .mob +Goretusk
step
    #completewith TravelCompass
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r 和|cRXP_ENEMY_迪菲亚走私者|r, 从他们身上搜刮出|T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +Defias Trapper
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +Defias Smuggler
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +Defias Trapper
    .mob +Defias Smuggler
step
    #label TravelCompass
    .isOnQuest 399
    .goto Westfall,40.4,52.7,75 >>前往亚历克斯顿农场, |cRXP_WARN_在前往途中请继续完成其他任务目标|r
step
    #sticky
    #completewith bennytime
    >>击杀你在经过时遇到的任意区域内的看守傀儡|r
    >>击杀他们, 获取其|cRXP_LOOT_秋葵|r和|cRXP_LOOT_油瓶|r
    .mob Harvest Watcher
    .complete 9,1 --Havest Watcher slain (20)
    .collect 732,3,38,1 --Okra (3)
    .collect 814,5,103,1 --Flask of Oil (5)
step
    .goto Westfall,36.24,54.52
    >>打开|cRXP_PICK_阿历克斯顿的箱子|r. 从中获取|cRXP_LOOT_简易罗盘|r
    .complete 399,1 --A Simple Compass (1)
    .isOnQuest 399
step
    #completewith bennytime
    >>击杀|cRXP_ENEMY_幼年血牙野猪|r和|cRXP_ENEMY_小碎尸鸟|r. 击败它们后搜刮掉落的|cRXP_LOOT_秃鹫肉|r和|cRXP_LOOT_猪鼻|r和|cRXP_LOOT_猪肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +Young Fleshripper
    .mob +Fleshripper
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +Young Goretusk
    .mob +Goretusk
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +Young Goretusk
    .mob +Goretusk
step
    #completewith bennytime
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r 和|cRXP_ENEMY_迪菲亚走私者|r, 从他们身上搜刮出|T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +Defias Trapper
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +Defias Smuggler
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +Defias Trapper
    .mob +Defias Smuggler
step
    .goto Westfall,50.0,22.6,75 >>前往詹森牧场, |cRXP_WARN_在前往途中请继续完成其他任务目标|r
step
	#label bennytime
    .goto Westfall,49.34,19.27
    >>打开|cRXP_PICK_法布隆的柜子|r. 从中获取|cRXP_LOOT_法布隆的怀表|r
    >>|cRXP_WARN_如果你调整相机角度正确, 可以从外面拾取|cRXP_PICK_法布隆的柜子|r|r
	>>|cRXP_WARN_留意|cRXP_ENEMY_Benny Blanco|r. 他伤害很高|r
    .complete 64,1 --Furlbrow's Pocket Watch
step
    #xprate <1.2
    #completewith next
    >>击杀 |cRXP_ENEMY_河爪豺狼人|r和 |cRXP_ENEMY_河爪斥候|r. 击败它们后搜刮出 |cRXP_LOOT_豺狼人的爪子|r(图标:|T134297:0|t)
    .complete 102,1 --Gnoll Paw (8)
    .mob Riverpaw Gnoll
    .mob Riverpaw Scout
step
    .goto Westfall,52.13,10.36,60,0
    .goto Westfall,56.40,9.40,60,0
    .goto Westfall,52.13,10.36,60,0
    .goto Westfall,56.40,9.40,60,0
    .goto Westfall,52.13,10.36
    .goto Westfall,56.40,9.40,0
    >>|cRXP_WARN_前往海岸, 途中击杀豺狼人|r, 以获取 |T134297:0|t[|cRXP_LOOT_豺狼人的爪子|r](如有需要)
    >>击杀|cRXP_ENEMY_鱼人袭击者|r和|cRXP_ENEMY_滩行鱼人|r. 击败后搜刮他们的|cRXP_LOOT_眼睛|r
    .collect 730,3,38,1 --Murloc Eye (3)
    .mob Murloc Raider
    .mob Murloc Coastrunner
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
    >>击杀 |cRXP_ENEMY_河爪豺狼人|r和 |cRXP_ENEMY_河爪斥候|r. 击败它们后搜刮出 |cRXP_LOOT_豺狼人的爪子|r(图标:|T134297:0|t)
    .complete 102,1 --Gnoll Paw (8)
    .mob Riverpaw Gnoll
    .mob Riverpaw Scout
step
    .goto Westfall,57.48,13.58,60,0
    .goto Westfall,57.23,19.78,60,0
    .goto Westfall,52.13,33.22,60,0
    .goto Westfall,57.06,34.47,60,0
    .goto Westfall,57.23,19.78
    >>打开地面上的|cRXP_PICK_Sacks of Oats|r, 拾取其中的|cRXP_LOOT_一捧燕麦|r
	>>|cRXP_WARN_你通常可以在农场围栏或建筑物附近找到它们|r
	.complete 151,1 --Handful of Oats (8)
step << Human Warlock
    #xprate <1.2
    #label FurlbrowFarm
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >>交任务: |cRXP_FRIENDLY_遗失的怀表|r
    .turnin 184 >>交任务: |cRXP_FRIENDLY_法布隆的地契|r
    .target +Farmer Furlbrow
    .goto Westfall,59.95,19.35
    .turnin 151 >>交任务: |cRXP_FRIENDLY_老马布兰契|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
    .isOnQuest 184
step << Human Warlock
    #xprate >1.1
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >>交任务: |cRXP_FRIENDLY_遗失的怀表|r
    .turnin 184 >>交任务: |cRXP_FRIENDLY_法布隆的地契|r
    .target +Farmer Furlbrow
    .goto Westfall,59.95,19.35
    .turnin 151 >>交任务: |cRXP_FRIENDLY_老马布兰契|r
    .target +Verna Furlbrow
    .goto Westfall,59.92,19.42
    .isOnQuest 184
step
    #xprate <1.2
    #optional << Human Warlock
    #label FurlbrowFarm << !Human/!Warlock
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >>交任务: |cRXP_FRIENDLY_遗失的怀表|r
    .target +Farmer Furlbrow
    .goto Westfall,59.95,19.35
    .turnin 151 >>交任务: |cRXP_FRIENDLY_老马布兰契|r
    .target +Verna Furlbrow
    .goto Westfall,59.92,19.42
step
    #xprate >1.1
    #optional << Human Warlock
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >>交任务: |cRXP_FRIENDLY_遗失的怀表|r
    .target +Farmer Furlbrow
    .goto Westfall,59.95,19.35
    .turnin 151 >>交任务: |cRXP_FRIENDLY_老马布兰契|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
step
    #completewith SaldeanVendor
	.goto Westfall,56.04,31.23
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .vendor >>|cRXP_BUY_出售垃圾|r
    >>|cRXP_WARN_切勿出售|r |T133884:0|t[鱼人的眼球], |T135997:0|t[血牙野猪的头], |T134341:0|t[血牙野猪的肝] |cRXP_WARN_或|r |T133972:0|t[秃鹫肉条]
	.target Farmer Saldean
step
    #optional
    .isQuestComplete 9
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
	.target Farmer Saldean
    .goto Westfall,56.04,31.23
    .turnin 9 >>交任务: |cRXP_FRIENDLY_清理荒野|r
step
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto Westfall,56.40,30.50
    .turnin 22 >>交任务: |cRXP_FRIENDLY_猪肝馅饼|r
    .turnin 38 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
    .isQuestComplete 22
    .isQuestComplete 38
    .target Salma Saldean
step
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto Westfall,56.40,30.50
    .turnin 22 >>交任务: |cRXP_FRIENDLY_猪肝馅饼|r
    .isQuestComplete 22
    .target Salma Saldean
step
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto Westfall,56.40,30.50
    .turnin 38 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
    .isQuestComplete 38
    .target Salma Saldean
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
    >>击杀|cRXP_ENEMY_看守傀儡|r. 击败他们后可获得|cRXP_LOOT_秋葵|r和|cRXP_LOOT_油瓶|r`
    .complete 9,1 --Harvest Watcher (20)
    .collect 732,3,38,1 --Okra (3)
    .collect 814,5,103,1 --Flask of Oil (5)
    .mob Harvest Watcher
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
    >>击杀|cRXP_ENEMY_看守傀儡|r. 从他们身上搜刮出|cRXP_LOOT_油瓶|r`
    .complete 9,1 --Harvest Watcher (20)
    .collect 814,5,103,1 --Flask of Oil (5)
    .mob Harvest Watcher
step
    .goto Westfall,52.49,42.11,75,0
    .goto Westfall,53.67,46.07,75,0
    .goto Westfall,61.60,45.55,75,0
    .goto Westfall,60.36,27.38,75,0
    .goto Westfall,54.63,19.20,75,0
    .goto Westfall,49.09,26.92,75,0
    .goto Westfall,47.89,42.94,75,0
    .goto Westfall,54.42,40.38
    >>击杀|cRXP_ENEMY_幼年血牙野猪|r和|cRXP_ENEMY_小碎尸鸟|r. 击败它们后搜刮掉落的|cRXP_LOOT_秃鹫肉|r和|cRXP_LOOT_猪鼻|r和|cRXP_LOOT_猪肝|r
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +Young Fleshripper
    .mob +Fleshripper
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +Young Goretusk
    .mob +Goretusk
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +Young Goretusk
    .mob +Goretusk
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
	.target Farmer Saldean
    .goto Westfall,56.04,31.23
    .turnin 9 >>交任务: |cRXP_FRIENDLY_清理荒野|r
step
    #label SaldeanVendor
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
	.target Salma Saldean
    .goto Westfall,56.40,30.50
    .turnin 38 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
    .turnin 22 >>交任务: |cRXP_FRIENDLY_猪肝馅饼|r
step
    .goto Westfall,50.0,45.4
    >>完成地图标记区域内所有的|r|cRXP_ENEMY_Defias|r任务. |r|cRXP_WARN_这是一个动态刷新区域, 意味着如果你击杀足够多的怪物, 它们会不断重生|r
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r 和|cRXP_ENEMY_迪菲亚走私者|r, 从他们身上搜刮出|T133694:0|t|cRXP_LOOT_红色皮质面罩|r
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +Defias Trapper
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +Defias Smuggler
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +Defias Trapper
    .mob +Defias Smuggler
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
	.target Gryan Stoutmantle
    .goto Westfall,56.33,47.52
    .turnin 12 >>交任务: |cRXP_FRIENDLY_西部荒野人民军|r
step
	.xp <14,1
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
	.target Gryan Stoutmantle
    .goto Westfall,56.33,47.52
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
step
    #xprate <1.2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与丹努文队长交谈|cRXP_FRIENDLY_丹努文队长|r
	.target Captain Danuvin
    .goto Westfall,56.42,47.62
    .turnin 102 >>交任务: |cRXP_FRIENDLY_西部荒野的豺狼人|r
step
    .goto Westfall,57.002,47.169
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官刘易斯|r交谈
    >>|cRXP_BUY_从他那里购买 a|r|T135435:0|t[普通木柴]|cRXP_BUY_和 a|r|T135237:0|t[燧石和火绒]|r
    >>|cRXP_WARN_此功能用于在船上或电车上制作|r|T135805:0|t[基础营火]|cRXP_WARN_, 以提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_技能, 而无需浪费时间|r
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .target Quartermaster Lewis
    .skill cooking,50,1 --XX Shows if cooking skill is <50
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
	.target Scout Galiaan
    .goto Westfall,54.00,53.00
    .turnin 153 >>交任务: |cRXP_FRIENDLY_红色皮质面罩|r
step << Gnome Rogue/Dwarf Rogue
    #completewith next
    .goto Westfall,56.55,52.64
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
    .money <0.3815
step << Gnome Rogue/Dwarf Rogue
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    .vendor 1287 >>|cRXP_BUY_从她那里购买一把|r|T135343:0|t[战士阔剑]|cRXP_BUY_, 或从拍卖行购买更好的武器, 装备到你的副手位置|r
    .money <0.3815
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target Marda Weller
step << Gnome Rogue/Dwarf Rogue
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    .vendor 1287 >>|cRXP_BUY_从她那里购买 a|r|T135343:0|t[战士阔剑]|r
    .money <0.3815
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target Marda Weller
step << Gnome Rogue/Dwarf Rogue
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>请在黑海岸尽快购买以下物品, 以加快任务提交速度
    >>这将节省你的时间, 因为你无需到处寻找怪物击杀. 如果你想不购买任何物品, 请跳过此步骤
    >>|T133972:0|t[秃鹫肉条]
    >>|T133884:0|t[鱼人的眼球]
    >>|T135997:0|t[血牙野猪的头]
    >>|T134185:0|t[秋葵]
    >>|T134341:0|t[血牙野猪的肝脏]
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target Auctioneer Jaxon
    .isQuestComplete 399
step << Gnome Rogue/Dwarf Rogue
    .goto StormwindClassic,49.194,30.284
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈
    .turnin 399 >>交任务: |cRXP_FRIENDLY_童年的记忆|r
    .target Baros Alexston
    .zoneskip Stormwind City,1
    .isQuestComplete 399
step << Dwarf !Paladin/Gnome
    #label end
    #completewith DarkshoreBoat
    .hs >>炉石传送至塞尔萨玛
step << Dwarf !Paladin/Gnome
    #softcore
    #completewith DarkshoreBoat
    .goto Loch Modan,33.94,50.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fly Wetlands >>飞往湿地
    .target Thorgrum Borrelson
step << Dwarf !Paladin/Gnome
    #hardcore
    #completewith next
    .goto Loch Modan,33.94,50.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆·伯雷森|r交谈
    .fly Ironforge >>飞往铁炉堡
    .target Thorgrum Borrelson
step << Human/Dwarf Paladin
    #label end
    .goto Westfall,56.55,52.64
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Ironforge >>飞往铁炉堡
    .target Thor
step << Human Mage/Human Rogue/Human Warrior/Human Warlock/Human Paladin/Human Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比尔班·飞钳|r交谈 << Human Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_芬斯维克|r交谈 << Human Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托德雷·铁矿|r交谈 << Human Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈 << Human Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈 << Human Paladin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞尔索恩|r交谈 << Human Warlock
    .goto Ironforge,51.1,8.7,15,0 << Human Warlock
    .goto Ironforge,50.343,5.657 << Human Warlock
    .goto Ironforge,65.905,88.405 << Human Warrior
    .goto Ironforge,51.495,15.330 << Human Rogue
    .goto Ironforge,25.207,10.756 << Human Priest
    .goto Ironforge,27.18,8.60 << Human Mage
    .goto Ironforge,23.141,6.149 << Human Paladin
    .trainer >>训练你的职业法术
    .target Bilban Tosslespanner << Human Warrior
    .target Fenthwick << Human Rogue
    .target Toldren Deepiron << Human Priest
    .target Dink << Human Mage
    .target Brandur Ironhammer << Human Paladin
    .target Briarthorn << Human Warlock
step << Human Warrior
    .goto Ironforge,62.0,89.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯·晃骨|r交谈
    .train 2567 >>投掷训练
    .target Bixi Wobblebonk
step << Human Rogue
    #ah
    .goto Ironforge,62.375,88.679
    .vendor >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    +|cRXP_BUY_购买|r|T135343:0|t[战士阔剑]|cRXP_BUY_, 或前往拍卖行查看是否有更好/更便宜的|r
    .target Brenwyn Wintersteel
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
step << Human Rogue
    #ssf
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    +|cRXP_BUY_如果你负担得起, 就从她那里购买并装备一把|r|T135343:0|t[战士阔剑]|r
    .money <0.3815
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.7
    .target Brenwyn Wintersteel
step << Human Rogue
    .goto Ironforge,62.375,88.679
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r|T135425:0|t[锐利投掷匕首]
    .collect 3107,100 -- Keen Throwing Dagger
    .target Brenwyn Wintersteel
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.30
step << Human Rogue
    #completewith next
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.29
step << Dwarf Paladin
    .goto Ironforge,24.55,4.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔杜克·凝眉|r交谈
    .trainer >>训练你的职业法术
    .target Beldruk Doombrow
step << Dwarf Paladin
    #completewith next
    .goto Ironforge,25.27,1.53,6,0
    .goto Ironforge,24.35,11.90,10 >>前往楼上的 |cRXP_FRIENDLY_Muiredon|r
step << Dwarf Paladin
    .goto Ironforge,23.539,8.300
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆里顿·热炉|r谈话
    .turnin 1784 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1785 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Muiredon Battleforge
step << Dwarf Paladin
    .goto Ironforge,27.63,12.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_蒂萨·热炉|r交谈
    .turnin 1785 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Tiza Battleforge
step << Dwarf Paladin
    #softcore
    #completewith DarkshoreBoat
    .goto Ironforge,55.501,47.742
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fly Wetlands>>飞往湿地
    .target Gryth Thurden
step
    #hardcore << !Human
    .goto Dun Morogh,53.5,34.9
    .zone Dun Morogh>>前往: |cRXP_PICK_丹莫罗|r
step
    #hardcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >>前往丹莫罗 -> 湿地传送点
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
    >>|cRXP_WARN_观看视频指南, 了解如何跳过第一个！|r
    >>|cRXP_WARN_完成不死者任务：丹莫罗 -> 湿地 跳过|r
    >>|cRXP_WARN_穿越水域时避开 |cRXP_ENEMY_湿地鳄鱼|r 和 |cRXP_ENEMY_鱼人|r|r
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >>|cRXP_WARN_点击此处查看视频攻略|r
    .goto Wetlands,12.1,60.3,80 >>前往: |cRXP_PICK_湿地|r
    .mob Wetlands Crocolisk
    .mob Young Wetlands Crocolisk
    .mob Bluegill Raider
step << Human
    #softcore
    #completewith next
    .goto Dun Morogh,30.9,33.1,20 >>前往丹莫罗 -> 湿地死亡跳点
step << Human
    #softcore
    .goto Dun Morogh,32.4,29.1,20 >>继续沿山路前行, 前往死亡跳点位置
step << Human
    #softcore
    .goto Dun Morogh,33.0,27.2,20,0
    .goto Dun Morogh,33.0,25.2,20,0
    .goto Wetlands,11.727,43.306
    .deathskip >>直接跑向北方的边缘并跳下去. 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << Human
    #softcore
    .goto Wetlands,12.7,46.7,80 >>游到米奈希尔港
step
    .money <0.08
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔·奥雷|r交谈
    .vendor 1448 >>|cRXP_WARN_购买|r|T133024:0|t[青铜管]
    >>|cRXP_WARN_这是一个限量供应的物品. 如果|cRXP_FRIENDLY_尼尔·奥雷|r没有此物品, 请跳过此步骤|r
	.target Neal Allen
    .bronzetube
step << Human/Dwarf Paladin
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_暴风城|r
    .fp Wetlands>>获取湿地飞行路线
    .target Shellei Brondir
step
    .goto Wetlands,7.95,56.38
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德温·晨光|r交谈
    .vendor 1453 >>|cRXP_WARN_购买尽可能多的|r|T134831:0|t[治疗药水]|cRXP_WARN_可用|r
    >>|cRXP_WARN_这是一件限量供应的物品. 如果|cRXP_FRIENDLY_德温·晨光|r没有, 可跳过此步骤|r
    .target Dewin Shimmerdawn
step
    #optional
    #label DockTravel
    #completewith next
    .goto Wetlands,7.10,57.96,30,0
    .goto Wetlands,4.61,57.26,15 >>前往奥伯丁码头的船只
    .zoneskip Darkshore
step
    #optional
    #requires DockTravel
    #label DarkshoreCook1
    #completewith DarkshoreBoat
    >>|cRXP_WARN_如果船刚抵达, 则在船上；如果船刚离开, 则在码头上:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_如果船刚抵达, 则在船上；如果船刚离开, 则在码头上:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_如果船刚抵达, 则在船上；如果船刚离开, 则在码头上:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_以下物品:|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_the|r |T133970:0|t|cRXP_LOOT_[野猪肉块]|r |cRXP_WARN_into|r |T133974:0|t[烤野猪肉]
    >>|T133971:0|t[烹饪]|cRXP_WARN_the|r|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_into|r|T133974:0|t[烧烤狼肉]
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_the|r|T133970:0|t|cRXP_LOOT_[多汁狼肉]|r|cRXP_WARN_into|r|T133974:0|t[烧烤狼肉]
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪] |cRXP_WARN_the|r |T133970:0|t|cRXP_LOOT_[野猪肉块]|r |cRXP_WARN_into|r |T133974:0|t[烤野猪肉]
    .usespell 2550
    .zoneskip Darkshore
    .itemcount 769,1 --Chunk of Boar Meat (1)
    .itemcount 2672,<1 --Stringy Wolf Meat (<1)
    .itemcount 4471,1 --Flint and Tinder (1)
    .skill cooking,50,1
step
    #label DarkshoreBoat
    .goto 1437,4.370,56.762
    >>|cRXP_WARN_如果需要, 请在等待前往黑海岸的船时升级你的|r|T135966:0|t[急救]|r
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
]])

----End of <1.5x Westfall----
----Start of Darkshore Part 1----

RXPGuides.RegisterGuide([[
#classic
#season 0,1
#version 1
<< Alliance
#group RestedXP 联盟 1-20级
#name 14-16 黑海岸
#displayname 11-16 黑海岸 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << NightElf
#displayname 15-16 黑海岸 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << !NightElf
#next 16-19 黑海岸


-- #displayname 11-16 黑海岸 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << NightElf/Dwarf Hunter !SoD
-- #displayname 15-17 黑海岸 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << !NightElf !Dwarf/!Hunter !SoD
-- #displayname 13-18 黑海岸 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << Dwarf Hunter/!NightElf sod

step << NightElf
    #label WashedA
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
    .target Gwennyth Bly'Leggonde
step << !NightElf
    #optional
    #completewith BigThreat
    .goto Darkshore,37.04,44.13,0
    >>当船最靠近奥伯丁海岸时跳下船
    .subzone 442 >>游向奥伯丁
step
    #ah
    #optional
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r << !sod/Hunter/Druid
    .accept 1141 >>接任务: |cRXP_WARN_钓鱼世家|r
    .turnin 1141 >>交任务: |cRXP_FRIENDLY_钓鱼世家|r
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target Gubber Blump
    .xp <15,1
step
    #ah
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1141 >>接任务: |cRXP_WARN_钓鱼世家|r
    .turnin 1141 >>交任务: |cRXP_FRIENDLY_钓鱼世家|r
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target Gubber Blump
step
    #optional
    #season 0
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r
    .target Gubber Blump
    .xp <15,1
step << NightElf
    #optional
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_WARN_购买最多40|r|T133918:0|t[长嘴泥鳅]|cRXP_WARN_. 出售你所有其他等级为5级或以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .turnin 6342 >>交任务: |cRXP_FRIENDLY_飞往奥伯丁|r
    .accept 6343 >>接任务: |cRXP_LOOT_飞回泰达希尔|r << Druid sod
    .target Laird
    .xp >15,1 << Warrior/Rogue/Paladin
    .isQuestAvailable 2118
step << NightElf
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱尔德|r交谈
    .turnin 6342 >>交任务: |cRXP_FRIENDLY_飞往奥伯丁|r
    .target Laird
step << !NightElf
    #optional
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_WARN_购买最多40|r|T133918:0|t[长嘴泥鳅]|cRXP_WARN_. 出售你所有其他等级为5级或以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .xp >15,1 << Warrior/Rogue
    .target Laird
    .isQuestAvailable 2118
step
    #completewith BigThreat
    .goto Darkshore,37.04,44.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下|cRXP_FRIENDLY_Shaussiy|r交谈
    .home >>将你的[炉石]设置为奥伯丁
    .target Innkeeper Shaussiy
step
    #optional
    #completewith next
    .goto 1439,36.826,44.150
    .goto 1439,36.688,43.952,8 >>走上楼梯前往|cRXP_FRIENDLY_维兹班恩·曲针|r
step
    #xprate <1.5
    .goto 1439,36.976,44.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >>接任务: |cRXP_LOOT_传声盒827号|r
    .target Wizbang Cranktoggle
step
    #xprate >1.49
    .goto 1439,36.976,44.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >>接任务: |cRXP_LOOT_传声盒827号|r
    .target Wizbang Cranktoggle
    .xp >15,1 --XX Skip if 15+
step
    #xprate <1.5
    #optional << NightElf
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >>接任务: |cRXP_LOOT_洞中的蘑菇|r
    .target Barithras Moonshade
    .xp <12,1
step
    #xprate <1.5
    #optional << NightElf
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .accept 4811 >>接任务: |cRXP_LOOT_红色水晶|r
    .target Sentinel Glynda Nal'Shea
    .xp <12,1
step
    #xprate >1.49
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >>接任务: |cRXP_LOOT_洞中的蘑菇|r
    .target Barithras Moonshade
step
    #xprate >1.49
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .accept 4811 >>接任务: |cRXP_LOOT_红色水晶|r
    .target Sentinel Glynda Nal'Shea
step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >>接任务: |cRXP_LOOT_瘟疫蔓延|r
    .target Tharnariun Treetender
step
    #label BigThreat
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >>接任务: |cRXP_LOOT_熊怪的威胁|r
    .target Terenthis
step << !NightElf
    #label WashedA
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .accept 3524 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
    .target Gwennyth Bly'Leggonde
step << !NightElf
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fp Auberdine >>获取奥伯丁的飞行路径
    .target Caylais Moonfeather
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
    >>|cRXP_WARN_派你的宠物去攻击一只蓟熊. 一旦你的宠物被蓟熊击晕, 就放弃宠物并开始驯服它|r
    .tame 2163 >>|cRXP_WARN_对|cRXP_ENEMY_蓟熊|r 施放 |T132164:0|t[驯服野兽] 以驯服它|r
    .target Thistle Bear
step
    #optional
    #completewith FirstWashed
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r. 击败它们后可获得其掉落的|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心, 因为他们|r|T132307:0|t[逃跑]|cRXP_WARN_在<30% 生命值|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob Foreststrider Fledgling
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
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r. 击败它们后拾取其|cRXP_LOOT_蟹腿|r
    >>|cRXP_WARN_你可能需要下水才能看到它们|r
    .complete 983,1 --Crawler Leg (6)
    .mob Pygmy Tide Crawler
    .mob Young Reef Crawler
    .isOnQuest 983
step
    .goto 1439,36.371,50.920
    >>打开|cRXP_PICK_搁浅的海洋生物|r, 从中拾取|cRXP_LOOT_海洋生物的骸骨|r
    .complete 3524,1 --Sea Creature Bones (1)
step << Druid
    #ah
    #season 0
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_将你的|r|T136065:0|t[草药学] |cRXP_WARN_等级提升至15级, 以便能采集|r|T134187:0|t[地根草] |cRXP_WARN_完成一个重要的职业任务. 完成后你可以将其遗忘|r
    >>|cRXP_WARN_如果您希望稍后从拍卖行购买 5|r|T134187:0|t[地根草]|cRXP_WARN_, 请跳过此步骤|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox
step << Druid
    #ssf
    #season 0
    #optional
    #completewith CliffspringEnd
    #label GatheringQ
    .skill herbalism,15 >>|cRXP_WARN_将你的|r|T136065:0|t[草药学] |cRXP_WARN_等级提升至15级, 以便采集5|r|T134187:0|t[地根草] |cRXP_WARN_用于即将开启的重要职业任务. 完成后可选择遗忘该技能|r
    .collect 2449,5,6123,1 --Earthroot (5)
    .disablecheckbox
step << Druid
    #optional
    #season 0
    #completewith CliffspringEnd
    #requires GatheringQ
    >>|cRXP_WARN_通过|T136065:0|t[草药学]收集5个|T134187:0|t[地根草], 并偶尔从|r|RXP_PICK_破损的箱子|r中获取, 用于未来的职业任务|r
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
    >>|cRXP_WARN_使用|r|T134335:0|t[萨纳瑞恩的希望] |cRXP_WARN_对|r|cRXP_ENEMY_狂暴蓟熊|r|cRXP_WARN_. 只要目标是这只熊, 即可在任意距离下使用|r
    >>|cRXP_WARN_==若附近无熊, 请勿使用任务物品==|r
    >>|cRXP_WARN_你可能会浪费掉陷阱, 导致任务无法完成！如果发生这种情况, 需要返回任务发布人处, 请求另一个陷阱|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .unitscan Rabid Thistle Bear
    .use 7586
step
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
    .xp 11+7300 >>升级至7300+/8800经验值
step
    #optional
    #requires RabidThistle
--XXREQ Placeholder invis step until multiple requires per step
step
    #xprate <1.5
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .turnin 983 >>交任务: |cRXP_FRIENDLY_传声盒827号|r
    .accept 1001 >>接任务: |cRXP_LOOT_传声盒411号|r
step
    #xprate >1.49
    #optional << !NightElf/Hunter
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .turnin 983 >>交任务: |cRXP_FRIENDLY_传声盒827号|r
    .accept 1001 >>接任务: |cRXP_LOOT_传声盒411号|r << !sod
    .isQuestComplete 983
step << NightElf !Hunter
    #xprate >1.49
    #optional
    #requires BuzzBox1
    .goto 1439,36.634,46.250
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .accept 1001 >>接任务: |cRXP_LOOT_传声盒411号|r
    .isQuestTurnedIn 983
--XX so NEs can catch up on xp from those that came via menethil
--XX Hunters skip this as they will get better xp/hr grinding furbolgs
step
    #label FirstWashed
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 3524 >>交任务: |cRXP_FRIENDLY_搁浅的巨兽|r
    .accept 4681 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
    .target Gwennyth Bly'Leggonde
step
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >>前往码头上朝塞瑞利恩·白爪方向前进
step
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >>接任务: |cRXP_LOOT_永志不渝|r
    .target Cerellean Whiteclaw
step
    #season 0,1 << Rogue
    #optional
    #completewith SeaT1
    .goto 1439,32.432,43.744,15 >>前往码头尽头, 然后跳入水中
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith washed1
    .goto Darkshore,33.59,40.36,0
    .goto Darkshore,30.94,45.79,0
    .goto Darkshore,33.03,48.13,0
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r. 击败它们后搜刮出|cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob Darkshore Thresher
    .isOnQuest 1001
step
    #label SeaT1
    .goto 1439,31.841,46.304
    >>打开|cRXP_PICK_海龟骨头|r, 击败它后拾取|cRXP_LOOT_海龟的残骸|r
    .complete 4681,1 --Sea Turtle Remains (1)
step
    #optional
    #season 0
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r
    .target Gubber Blump
    .xp <15,1
step
    #label washed1
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4681 >>交任务: |cRXP_FRIENDLY_搁浅的巨兽|r
    .target Gwennyth Bly'Leggonde
step
    #xprate <1.5
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 947 >>接任务: |cRXP_LOOT_洞中的蘑菇|r
    .target Barithras Moonshade
step
    #xprate <1.5
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .accept 4811 >>接任务: |cRXP_LOOT_红色水晶|r
    .target Sentinel Glynda Nal'Shea
step
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2118 >>交任务: |cRXP_FRIENDLY_瘟疫蔓延|r
    .accept 2138 >>接任务: |cRXP_LOOT_清除疫病|r
    .target Tharnariun Treetender
step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
    .accept 985 >>接任务: |cRXP_LOOT_熊怪的威胁|r
    .accept 4761 >>接任务: |cRXP_LOOT_桑迪斯·织风|r
    .target Terenthis
step << NightElf Warrior/NightElf Rogue
    #sticky
    #season 0
    #label DeepOceanStart
    .goto 1439,38.107,41.165,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >>接任务: |cRXP_LOOT_深不可测的海洋|r
    .target Gorbold Steelhand
    .xp <13,1
step << NightElf Warrior/NightElf Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库德拉姆·石锤|r和|cRXP_FRIENDLY_迪尔弗拉姆·火须|r交谈
    .train 2575 >>训练 |T134708:0|t[采矿]
    .target +Kurdram Stonehammer
    .goto Darkshore,38.249,41.008
    .train 2018 >>训练 |T136241:0|t[锻造]
    .target +Delfrum Flintbeard
    .goto Darkshore,38.191,40.935
    >>|cRXP_WARN_这将使你制作|r|T135248:0|t[劣质磨刀石]|cRXP_WARN_, 提升你的近战伤害2点|r << Warrior/Rogue
    >>|cRXP_WARN_如果你不想这样做, 请跳过此步骤|r
step << NightElf Warrior/NightElf Rogue
    #optional
    .goto Darkshore,38.142,41.108
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾丽萨·钢拳|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T134708:0|t[矿工锄]|r
    .target Elisa Steelhand
    .collect 2901,1 -- Mining Pick (1)
    .train 2575,3 --Mining Trained
step << NightElf Warrior/NightElf Rogue
    #optional
    #completewith Bashal1
    .cast 2580 >>|cRXP_WARN_Cast|r|T136025:0|t[采集矿物]
    .usespell 2580
    .train 2575,3 --Mining Trained
step << !NightElf/!Warrior !Rogue
    #xprate <1.5 --<< !NightElf/Hunter --XX Night Elves do it on 2x to catch up on xp EXCEPT Dwarf/NE Hunters (1x only)
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >>接任务: |cRXP_LOOT_深不可测的海洋|r
    .target Gorbold Steelhand
    .xp <13,1
step
    #optional
    #requires DeepOceanStart << NightElf Warrior/NightElf Rogue
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >>接任务: |cRXP_LOOT_炖陆行鸟|r
    .turnin 2178 >>交任务: |cRXP_FRIENDLY_炖陆行鸟|r
    .target Alanndarian Nightsong
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
step << NightElf Rogue
    .goto 1439,37.575,40.348
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉姆·长爪|r交谈
    .vendor 4183 >>|cRXP_BUY_如果你负担得起, 可以从他那里购买一个|r|T135640:0|t[双刃弯刀]|r
    .collect 2207,1 -- Jambiya (1)
    .disablecheckbox
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.10
--  .money <0.2390
    .target Naram Longclaw
step
    #optional
    #completewith next
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r对话, 他在里面
    .vendor 4182 >>|cRXP_BUY_从他那里购买你需要的任意数量的|r|T133634:0|t[小棕色布袋]|cRXP_BUY_或|r|T133634:0|t[棕色小皮包]|r
    >>|cRXP_BUY_购买|r|T132382:0|t[锋利的箭] |cRXP_BUY_或|r|T132384:0|t[重弹丸] |cRXP_BUY_, 直到你的箭袋/弹药袋装满|r << Hunter
    .target Dalmond
step
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >>交任务: |cRXP_FRIENDLY_桑迪斯·织风|r
    .accept 4762 >>接任务: |cRXP_LOOT_壁泉河|r
    .accept 954 >>接任务: |cRXP_LOOT_巴莎兰|r
    .accept 958 >>接任务: |cRXP_LOOT_上层精灵的工具|r << !sod
    .target Thundris Windweaver
    .xp >16,1
--XX if 16+跳过工具
step
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >>交任务: |cRXP_FRIENDLY_桑迪斯·织风|r
    .accept 4762 >>接任务: |cRXP_LOOT_壁泉河|r
    .accept 954 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Thundris Windweaver
    .xp >18,1
--XX if 18+, 跳过巴沙尔
step
    #optional
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4761 >>交任务: |cRXP_FRIENDLY_桑迪斯·织风|r
    .accept 4762 >>接任务: |cRXP_LOOT_壁泉河|r

----Start of NE >1.49x catchup (everyone 1x) Early boat section----


step
    #xprate <1.5 --<< !NightElf/Hunter
    #completewith MistVeil
    .goto Darkshore,35.44,35.83,0
    .goto Darkshore,35.71,32.27,0
    .goto Darkshore,36.70,30.00,0
    .goto Darkshore,38.73,28.25,0
    .goto Darkshore,40.17,28.76,0
    .goto Darkshore,35.44,35.83,55,0
    .goto Darkshore,35.71,32.27,55,0
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r. 击败它们后搜刮出|cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob Darkshore Thresher
    .isOnQuest 1001
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith next
    +|cRXP_WARN_按 Esc 键, 然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用互动键”, 并将“与目标互动”选项绑定到一个按键|r
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,38.213,28.754
--  .goto 1439,38.234,28.796
    >>|cRXP_WARN_==注意你的呼吸条==|r
    >>|cRXP_WARN_潜入水下, 游到船尾外侧|r
    >>|cRXP_WARN_在箭头指示位置, 按下“与目标互动”键绑定, 从船外拾取|cRXP_LOOT_银色清晨号的保险箱|r|r
    >>|cRXP_WARN_如果你不想这样做, 可以潜入船底最底层, 然后打开|cRXP_LOOT_银色清晨号的保险箱|r进行搜刮|r
    .complete 982,1 --Silver Dawning's Lockbox (1)
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    #label MistVeil
    .goto 1439,39.581,27.487
--  .goto 1439,39.629,27.462
    >>|cRXP_WARN_==注意你的呼吸条==|r
    >>|cRXP_WARN_潜入水下, 游到船尾外侧|r
    >>|cRXP_WARN_在箭头指示位置, 按下“与目标互动”键, 从船外拾取|cRXP_LOOT_迷雾之纱号的保险箱|r|r
    >>|cRXP_WARN_如果你不想这么做, 可以潜入水底, 到达船体底层, 然后打开|cRXP_LOOT_迷雾之纱号的保险箱|r进行搜刮|r
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
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r. 击败它们后搜刮出|cRXP_LOOT_蛇颈龙的眼球|r
    .complete 1001,1 --Thresher Eye (3)
    .mob Darkshore Thresher
    .isOnQuest 1001
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
    .isOnQuest 1001
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,41.960,28.616
    >>点击地面上的|cRXP_PICK_传声盒411号|r
    .turnin 1001 >>交任务: |cRXP_FRIENDLY_传声盒411号|r
    .accept 1002 >>接任务: |cRXP_LOOT_传声盒323号|r
    .isQuestComplete 1001
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,41.960,28.616
    >>点击地面上的|cRXP_PICK_传声盒411号|r
    .accept 1002 >>接任务: |cRXP_LOOT_传声盒323号|r
    .isQuestTurnedIn 1001
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith AsterionTravel
    .goto 1439,44.190,33.697,0
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r. 从它们身上获取 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .isQuestTurnedIn 1001


----End of NE >1.49x catchup (everyone 1x) Early boat section----


 step
    #optional
    #completewith AsterionTravel
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r. 击败它们后可获得其掉落的|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心, 因为他们|r|T132307:0|t[逃跑]|cRXP_WARN_在<30% 生命值|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob Foreststrider Fledgling
step
    #xprate <1.5
    #optional
    #label AsterionTravel
    #completewith Bashal1
    .goto 1439,44.629,36.316,20,0
    .goto 1439,44.168,36.289,15 >>前往 |cRXP_FRIENDLY_阿斯特利安|r
step
    #xprate >1.49
    #optional
    #label AsterionTravelSoD
    #completewith Bashal1
    .goto 1439,44.376,36.754,20,0
    .goto 1439,44.168,36.289,15 >>前往 |cRXP_FRIENDLY_阿斯特利安|r
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_避免在途中击杀|cRXP_ENEMY_野生劣魔|r和|cRXP_ENEMY_恶灵劣魔|r|r
    .turnin 954 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .accept 955 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isOnQuest 954
    .xp >16,1
--XX skip Bashal Aran qline if 16+
step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_避免在途中击杀|cRXP_ENEMY_野生劣魔|r和|cRXP_ENEMY_恶灵劣魔|r|r
    .turnin 954 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .target Asterion
    .isOnQuest 954
--XX Turn in Breadcrumb if you picked it up earlier before 18
step
    #label Bashal1
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .accept 955 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isQuestTurnedIn 954
    .xp >16,1
--XX if you ding 16 from turnin, 跳过巴沙尔 Aran qline
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
    >>击杀|cRXP_ENEMY_野生劣魔|r 和|cRXP_ENEMY_恶灵劣魔|r . 击败它们后 loot 出它们的|cRXP_LOOT_劣魔耳环|r
    >>|cRXP_WARN_暂时不要击杀 |cRXP_ENEMY_Deth'ryll Satyrs|r|r
    .complete 955,1 --Grell Earring (8)
    .mob Wild Grell
    .mob Vile Sprite
    .isOnQuest 955
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 955 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .accept 956 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isQuestComplete 955
step
    #optional
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .accept 956 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isQuestTurnedIn 955
step
    #completewith MeatFangEgg1
    #optional
    .abandon 955 >>放弃巴莎兰
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
    >>击杀|cRXP_ENEMY_Deth'ryll Satyrs|r. 击败后可拾取|cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_它们没有动态重生. 如果你找不到任何|r |cRXP_ENEMY_Deth'ryll Satyrs, 请跳过此步骤|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob Deth'ryll Satyr
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
    >>击杀|cRXP_ENEMY_Deth'ryll Satyrs|r. 击败后可拾取|cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_请注意, 它们不会动态刷新|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob Deth'ryll Satyr
    .isQuestTurnedIn 955
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 956 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .accept 957 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
    .isQuestComplete 956
step
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .accept 957 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
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
    .xp 13 >>刷到13级
step
    #optional
    #completewith AuberdineTurnin2 << NightElf/Hunter/Druid/Warrior
    #completewith AmethStart << !NightElf !Hunter !Druid !Warrior
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r. 击败它们后可获得其掉落的|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心, 因为他们|r|T132307:0|t[逃跑]|cRXP_WARN_在<30% 生命值|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob Foreststrider Fledgling
    .subzoneskip 442
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith AuberdineTurnin2 << NightElf/Hunter/Druid/Warrior
    #completewith AmethStart << !NightElf !Hunter !Druid !Warrior
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r. 从它们身上获取 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .isQuestTurnedIn 1001
step
    #xprate <1.5
    #completewith RedCrystal
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 击败后从其身上搜刮出 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_later|r|cRXP_WARN_至10级|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,10,1 --XX Shows if cooking skill is <10
step
    #xprate <1.5
    #completewith AuberdineTurnin2 << NightElf/Hunter/Druid/Warrior
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 击败后从其身上搜刮出 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于在之后将你的烹饪技能提升至50级|r|T133971:0|t[烹饪]|cRXP_WARN_稍后|r|cRXP_WARN_至50级|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只要记得保留好鸡蛋, 开始考虑一下你还需要多少次技能升级才能达到50级烹饪即可|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1
step
    #season 0
    #completewith LateTurtleStart
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 击败后从其身上搜刮出 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于在之后将你的烹饪技能提升至50级|r|T133971:0|t[烹饪]|cRXP_WARN_稍后|r|cRXP_WARN_至50级|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只要记得保留好鸡蛋, 开始考虑一下你还需要多少次技能升级才能达到50级烹饪即可|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1
    .subzoneskip 442 --Auberdine
    .subzoneskip 447 --Ameth'Aran
step
    #season 0
    #label RedCrystal
    .goto 1439,47.314,48.676
    >>前往|cRXP_PICK_神秘的红色水晶|r
    >>|cRXP_WARN_小心位于|cRXP_PICK_神秘的红色水晶|r以西的两组|cRXP_ENEMY_狂暴的月夜枭兽|r, 其中距离最近的一对会被锁链连接|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range
step << Druid
    #optional
    #season 0
    #completewith Lunaclaw
    .goto 1439,43.126,45.593,15 >>进入|cRXP_PICK_月夜枭兽之石|r洞穴
step << Druid
    #optional
    #season 0
    #completewith Lunaclaw
    .goto Darkshore,43.50,45.97
    .cast 18974 >>|cRXP_WARN_使用|r |T132857:0|t[塞纳里奥月尘] |cRXP_WARN_在洞穴内的 |cRXP_PICK_月夜枭兽之石|r 上, 召唤 |cRXP_ENEMY_月爪枭兽|r 出现在洞穴入口处|r
    .timer 4,Body and Heart RP
    .use 15208
    .isOnQuest 6001
step << Druid
    #label Lunaclaw
    #season 0
    .goto Darkshore,43.09,45.55
    >>击杀|cRXP_ENEMY_月爪枭兽|r
    .complete 6001,1 --Defeat Lunaclaw (x1)
    .use 15208
    .mob Lunaclaw

----Start of Early Red Crystal turnin Section (NE below 14 for xp, Hunters/德鲁伊 for staff wep upgrade)/Druid bear q final if not done earlier----


step << NightElf/Hunter/Warrior/Druid
    #optional
    #completewith Cascade
    #season 0
    .hs >>传送至奥伯丁
    .cooldown item,6948,>0,1
    .subzoneskip 442
    .isQuestTurnedIn 6001 << Druid
step << NightElf/Hunter/Druid/Warrior
    #optional
    #label AuberdineTurnin2
    #completewith Cascade
    .goto 1439,37.703,43.393
    .subzone 442 >>返回奥伯丁
    .cooldown item,6948,<0,1 << !Druid
step << NightElf/Hunter/Druid/Warrior
    #optional
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .turnin 4811 >>交任务: |cRXP_FRIENDLY_红色水晶|r
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r
    .target Sentinel Glynda Nal'Shea
    .xp >14,1 << Hunter/Druid
--XX If Night Elves, Hunters, or 德鲁伊 are lower than level 14, do questline
step << Hunter/Druid/Warrior
    #season 0,1 << Druid
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .turnin 4811 >>交任务: |cRXP_FRIENDLY_红色水晶|r
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r
    .target Sentinel Glynda Nal'Shea
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5 << Hunter/Druid
--XX If Hunters and 德鲁伊 (in Era) have a worse weapon than the Oakthrush Staff, do the quest even if 14+
step << NightElf/Hunter/Druid/Warrior
    #optional
    #label Cascade
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r
    .target Sentinel Glynda Nal'Shea
    .isQuestTurnedIn 4811 --show step if Red Crystal turned in
step << NightElf/Hunter/Druid/Warrior
    #optional
    #season 0
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_WARN_购买最多40|r|T133918:0|t[长嘴泥鳅]|cRXP_WARN_. 出售你所有其他等级为5级或以下的食物|r
    .collect 4592,40 --Longjaw Mud Snapper (40)
    .target Laird
    .subzoneskip 442,1 --skip if you leave Auber
    .xp >15,1 << Warrior/Rogue
    .isQuestTurnedIn 4811 --show step if you turned in red crystal
step << NightElf/Hunter/Druid
    #optional
    #season 0
    .goto Darkshore,37.0,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥林迪雅|r交谈
    >>|cRXP_WARN_购买最多40个|r|T132815:0|t[冰镇牛奶]|cRXP_WARN_来自她的物品. 出售你所有其他等级为5级或以下的水|r
    .collect 1179,35 --Ice Cold Milk (35)
    .target Allyndia
    .subzoneskip 442,1 --skip if you leave Auber
    .isQuestTurnedIn 4811 --show step if you turned in red crystal
step << NightElf/Hunter/Druid/Warrior
    #optional
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r|T134865:0|t[空水瓶]|cRXP_WARN_在奥伯丁月泉|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
    .isQuestTurnedIn 4811
step << NightElf Hunter
    #optional
    #season 0
    .goto Darkshore,37.4,40.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    >>|cRXP_WARN_最多购买 2000|r|T132382:0|t[锋利的箭]|cRXP_WARN_来自他. 你很快将在刷怪环节需要用到它们|r
    .collect 2515,2000 --Sharp Arrow (35)
    .target Dalmond
    .subzoneskip 442,1 --skip if you leave Auber
    .isQuestTurnedIn 4811 --show step if you turned in red crystal
step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith MysteriousCrystalHuntDruidEnd
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r. 击败它们后可获得其掉落的|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心, 因为他们|r|T132307:0|t[逃跑]|cRXP_WARN_在<30% 生命值|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob Foreststrider Fledgling
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith EarlyCrystalEnd
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 击败后从其身上搜刮出 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_later|r|cRXP_WARN_至10级|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith EarlyCrystalEnd
    #season 0
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 击败后从其身上搜刮出 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于在之后将你的烹饪技能提升至50级|r|T133971:0|t[烹饪]|cRXP_WARN_稍后|r|cRXP_WARN_至50级|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只要记得保留好鸡蛋, 开始考虑一下你还需要多少次技能升级才能达到50级烹饪即可|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,<10,1 --XX Shows if cooking skill is 10-50
    .skill cooking,50,1
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith MysteriousCrystalHuntDruidEnd
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r. 从它们身上获取 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .isOnQuest 1002
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #season 0
    .goto 1439,47.314,48.676
    #label EarlyCrystalEnd
    >>点击|cRXP_PICK_神秘的红色水晶|r
    >>|cRXP_WARN_小心位于|cRXP_PICK_神秘的红色水晶|r以西的两组|cRXP_ENEMY_狂暴的月夜枭兽|r, 其中距离最近的一对会被锁链连接|r
    .turnin 4812 >>交任务: |cRXP_FRIENDLY_清洗水晶|r
    .accept 4813 >>接任务: |cRXP_LOOT_水晶中的碎骨|r
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #season 0
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
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 击败后从其身上搜刮出 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_later|r|cRXP_WARN_至10级|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .skill cooking,10,1 --XX Shows if cooking skill is <10
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Warrior/Druid
    #optional
    #completewith MysteriousCrystalHuntDruidEnd
    .hs >>传送至奥伯丁
    .cooldown item,6948,>0,1
    .subzoneskip 442
    .isQuestTurnedIn 6001 << Druid
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #completewith MysteriousCrystalHuntDruidEnd
    .goto 1439,37.703,43.393
    .subzone 442 >>返回奥伯丁
    .cooldown item,6948,<0,1 << !Druid
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #season 0
    .goto Darkshore,37.70,43.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .turnin 4813,3 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r
    .target Sentinel Glynda Nal'Shea
    .isQuestTurnedIn 4811
step << Hunter/Druid/Warrior
    #completewith AmethStart
    +|cRXP_WARN_装备|r|T135145:0|t[橡木法杖]
    .use 15397
    .itemcount 15397,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
    .isQuestTurnedIn 4811


----Start of forced Level 14 Druid Turnin/train----


step << Druid
    #season 0
    .goto 1439,36.767,44.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱尔德|r交谈
    .accept 6343 >>接任务: |cRXP_LOOT_飞回泰达希尔|r
    .target Laird
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
    .xp 13+9500 >>升级至9500/11400经验值
step << Druid
    #season 0
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >>飞往泰达希尔
    .target Caylais Moonfeather
step << Druid
    .goto Teldrassil,56.25,92.44
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼莎·影歌|r 交谈
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
    .target Nessa Shadowsong
step << Druid
    #optional
    #completewith next
    #season 0
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Druid
    .goto Darnassus,35.375,8.405
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 6001 >>交任务: |cRXP_FRIENDLY_身心之力|r
    .accept 6121 >>接任务: |cRXP_LOOT_新的课程|r
    .trainer >>训练你的职业法术
    .target Mathrengyl Bearwalker
step << Druid
    #optional
    #season 0
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .accept 6121 >>接任务: |cRXP_LOOT_新的课程|r
    .trainer >>训练你的职业法术
    .target Mathrengyl Bearwalker
    .isQuestTurnedIn 6001
    .zoneskip Darnassus,1
step << Druid
    #optional
    #season 0
	#completewith next
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
step << Druid
    #season 0
    .goto Moonglade,56.21,30.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_德迪利特·星焰|r谈话
    .turnin 6121 >>交任务: |cRXP_FRIENDLY_新的课程|r
    .accept 6122 >>接任务: |cRXP_LOOT_毒水之源|r
    .target Dendrite Starblaze
step << Druid
    #season 0
    #optional
    #completewith AmethStart
    .hs >>传送至黑海岸
    .zoneskip Darkshore

----End of forced Level 14 Druid Turnin/train----
----End of Early Red Crystal turnin Section (NE for xp, Hunters/德鲁伊 for staff)/Druid bear q final if not done earlier----


step << Druid
    #season 0
    #optional
    #completewith AmethStart
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r. 击败它们后可获得其掉落的|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心, 因为他们|r|T132307:0|t[逃跑]|cRXP_WARN_在<30% 生命值|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider Fledgling
    .subzoneskip 447


----Start of alternate section if early Red Crystal turnin----


step << NightElf/Hunter/Druid/Warrior
    #xprate <1.5 --<< !NightElf/Hunter
    #completewith EarlyBlackwood
    #optional
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r. 从它们身上获取 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .isOnQuest 1002
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #loop
    #season 0
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
    >>击杀黑木探路者和黑木风语者
    .complete 985,1 -- Blackwood Pathfinder (8)
    .mob +Blackwood Pathfinder
    .complete 985,2 -- Blackwood Windtalker (5)
    .mob +Blackwood Windtalker
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #requires EarlyTreats3 << Druid --Season 2
    #completewith EarlyTurtleStart
    >>击杀 |cRXP_ENEMY_月夜猛虎|r. 掠夺他们的 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker
    .subzoneskip 447
    .isOnQuest 1002
    .isQuestTurnedIn 4811
step << NightElf/Hunter/Druid/Warrior
    #optional
    #season 0
    #completewith Anaya
    #requires EarlyTreats3 << Druid --Season 2
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_请注意, 当它们施放|r|T135914:0|t[狂犬病]|cRXP_WARN_时, 如果你未能及时击杀它们(近战效果:使所有生命值恢复降低50%, 持续10分钟)|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob Rabid Thistle Bear
    .isQuestTurnedIn 4811
    .subzoneskip 447
step << NightElf/Hunter/Druid/Warrior
    #optional
    #season 0
    #label EarlyTurtleStart
    #requires EarlyTreats3 << Druid --Season 2
    .goto 1439,37.105,62.167
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >>接任务: |cRXP_LOOT_搁浅的海龟|r
    .isQuestTurnedIn 4811
step
    #optional
    #season 0
    #label EarlyAmethStart
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >>接任务: |cRXP_LOOT_亚米萨兰的毁灭|r
    .target Sentinel Tysha Moonblade
    .isQuestTurnedIn 4811
    .xp >17,1

----End of alternate section if early Red Crystal turnin----

----Start of small south loop for ERA and SoD Warrior/Rogue/Priest----

step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith AmethStart
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r. 从它们身上获取 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .isQuestTurnedIn 1001
    .isQuestAvailable 4811
step
    #season 0
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
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 击败后从其身上搜刮出 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_later|r|cRXP_WARN_至10级|r
    .collect 6889,10,2178,1,0x20,cooking --Small Egg (1-9)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
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
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r. 从她身上搜刮出她的|cRXP_LOOT_项链|r
    >>|cRXP_WARN_请注意, 她的刷新时间为7至8分钟, 共有4个不同的刷新点分布在亚米萨兰区域|r
    >>|cRXP_WARN_如果你找不到她, 且打算稍后再试, 但可能会很快需要刷更多怪物, 请跳过此步骤|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan Anaya Dawnrunner
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
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r. 从她身上搜刮出她的|cRXP_LOOT_项链|r
    >>|cRXP_WARN_请注意, 她的刷新时间为7至8分钟, 共有4个不同的刷新点分布在亚米萨兰区域|r
    >>|cRXP_WARN_如果你找不到她, 可以考虑与附近的人组队. 请在通用聊天(/1)中询问是否有其他玩家也在寻找她, 并一起组队行动|r
    >>|cRXP_WARN_如果你找不到她, 且打算稍后再试, 但可能会很快需要刷更多怪物, 请跳过此步骤|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan Anaya Dawnrunner
    .group
step
    #season 0
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
    >>击杀 |cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r和 |cRXP_ENEMY_哀嚎的贵族|r. 击败后掠夺他们的 |cRXP_LOOT_遗物|r
    .complete 958,1 --Highborne Relic (7)
    .mob Cursed Highborne
    .mob Writhing Highborne
    .mob Wailing Highborne
    .isOnQuest 958
step
    #season 0
    #label AmethStart
    .goto 1439,40.302,59.731
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .accept 953 >>接任务: |cRXP_LOOT_亚米萨兰的毁灭|r
    .target Sentinel Tysha Moonblade
    .isQuestAvailable 4811
    .xp >17,1
step
    #season 0
    .goto 1439,42.652,63.145
    >>点击|cRXP_PICK_亚米萨兰的毁灭|r
    .complete 953,2 --Read The Fall of Ameth'Aran (1)
    .isOnQuest 953
step << !sod/Warrior/Rogue/Priest
    .goto 1439,42.373,61.815
    >>点击|cRXP_PICK_上古之火|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
    .isOnQuest 957
step
    #season 0
    #label TheLay
    .goto Darkshore,43.30,58.70
    >>点击|cRXP_PICK_亚米萨兰的衰落|r
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
    .turnin 953 >>交任务: |cRXP_FRIENDLY_亚米萨兰的毁灭|r
    .target Sentinel Tysha Moonblade
step << !sod/Warrior/Rogue
    #optional
    #completewith FurbolgGrind
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r. 击败它们后可获得其掉落的|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心, 因为他们|r|T132307:0|t[逃跑]|cRXP_WARN_在<30% 生命值|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider Fledgling
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith FurbolgGrind
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r 和|cRXP_ENEMY_月夜猛虎|r . 击败它们后可获得其|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .mob Moonstalker
    .isOnQuest 1002
step
    #optional
    #completewith FurbolgGrind
    #season 0
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_请注意, 当它们施放|r|T135914:0|t[狂犬病]|cRXP_WARN_时, 如果你未能及时击杀它们(近战效果:使所有生命值恢复降低50%, 持续10分钟)|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob Rabid Thistle Bear
step
    #label LateTurtleStart
    .goto 1439,37.105,62.167
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >>接任务: |cRXP_LOOT_搁浅的海龟|r
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
    >>击杀黑木探路者和黑木风语者
    .complete 985,1 -- Blackwood Pathfinder (8)
    .mob +Blackwood Pathfinder
    .complete 985,2 -- Blackwood Windtalker (5)
    .mob +Blackwood Windtalker
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
    >>在营地中击杀|cRXP_ENEMY_Furlbogs|r. |cRXP_WARN_这是一个高密度刷新区域|r, 意味着若足够多的怪物死亡, 游戏会强制刷新. 这使得该地点成为该等级的|cRXP_WARN_极其高效的练级点|r(每小时经验值与完成任务相当)
    >>|cRXP_WARN_完成这项刷怪任务后, 你后续探索整个黑海岸时便无需再与高等级怪物战斗|r
    >>请注意, |cRXP_ENEMY_黑木探路者|r|T132152:0|t[Thrash] 可能会一次性击中你多达3次
    >>|cRXP_ENEMY_黑木风语者|r施放 |T136022:0|t[狂风冲击], 这是一个近战范围眩晕技能, |cRXP_WARN_当他们施放此技能时, 请移出近战范围|r以避免被眩晕
    .xp 15+11875 >>升级至11875/14400经验
    .mob Blackwood Pathfinder
    .mob Blackwood Windtalker
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
    >>在营地中击杀|cRXP_ENEMY_Furlbogs|r. |cRXP_WARN_这是一个高密度刷新区域|r, 意味着若足够多的怪物死亡, 游戏会强制刷新. 这使得该地点成为该等级的|cRXP_WARN_极其高效的练级点|r(每小时经验值与完成任务相当)
    >>|cRXP_WARN_完成这项刷怪任务后, 你后续探索整个黑海岸时便无需再与高等级怪物战斗|r
    >>请注意, |cRXP_ENEMY_黑木探路者|r|T132152:0|t[Thrash] 可能会一次性击中你多达3次
    >>|cRXP_ENEMY_黑木风语者|r施放 |T136022:0|t[狂风冲击], 这是一个近战范围眩晕技能, |cRXP_WARN_当他们施放此技能时, 请移出近战范围|r以避免被眩晕
    .xp 15+11000 >>升级至11000/14400经验值
    .mob Blackwood Pathfinder
    .mob Blackwood Windtalker
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
    >>在营地中击杀|cRXP_ENEMY_Furlbogs|r. |cRXP_WARN_这是一个高密度刷新区域|r, 意味着若足够多的怪物死亡, 游戏会强制刷新. 这使得该地点成为该等级的|cRXP_WARN_极其高效的练级点|r(每小时经验值与完成任务相当)
    >>|cRXP_WARN_完成这项刷怪任务后, 你后续探索整个黑海岸时便无需再与高等级怪物战斗|r
    >>请注意, |cRXP_ENEMY_黑木探路者|r|T132152:0|t[Thrash] 可能会一次性击中你多达3次
    >>|cRXP_ENEMY_黑木风语者|r施放 |T136022:0|t[狂风冲击], 这是一个近战范围眩晕技能, |cRXP_WARN_当他们施放此技能时, 请移出近战范围|r以避免被眩晕
    .xp 15+600 >>升级至600+/14400经验值
    .mob Blackwood Pathfinder
    .mob Blackwood Windtalker
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
    >>在营地中击杀|cRXP_ENEMY_Furlbogs|r. |cRXP_WARN_这是一个高密度刷新区域|r, 意味着若足够多的怪物死亡, 游戏会强制刷新. 这使得该地点成为该等级的|cRXP_WARN_极其高效的练级点|r(每小时经验值与完成任务相当)
    >>|cRXP_WARN_完成这项刷怪任务后, 你后续探索整个黑海岸时便无需再与高等级怪物战斗|r
    >>请注意, |cRXP_ENEMY_黑木探路者|r|T132152:0|t[Thrash] 可能会一次性击中你多达3次
    >>|cRXP_ENEMY_黑木风语者|r施放 |T136022:0|t[狂风冲击], 这是一个近战范围眩晕技能, |cRXP_WARN_当他们施放此技能时, 请移出近战范围|r以避免被眩晕
    .xp 14+12210 >>升级至12210/12900经验值
    .mob Blackwood Pathfinder
    .mob Blackwood Windtalker
    .itemcount 5382,1 --Anaya's Pendant (1)
step
    #optional
    #completewith FurbolgGrindEnd
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r. 击败它们后可获得其掉落的|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心, 因为他们|r|T132307:0|t[逃跑]|cRXP_WARN_在<30% 生命值|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider Fledgling
    .isQuestAvailable 2178
step
    #optional
    #completewith FurbolgGrindEnd
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r. 从它们身上获取 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .isOnQuest 1002
step
    #label FurbolgGrindEnd
    #completewith TOTH
    #optional
    .goto 1439,36.701,45.122
    .subzone 442 >>返回奥伯丁
    .isOnQuest 4722
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4723 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .target Gwennyth Bly'Leggonde
    .isOnQuest 4723
step
    #xprate >1.49
    #optional << NightElf !Hunter
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4722 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4723 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r << Warrior sod
    .target Gwennyth Bly'Leggonde
step
    #season 0
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r
    .target Gubber Blump
step
    #optional
    #completewith next
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >>返回码头上的|cRXP_FRIENDLY_塞瑞利恩·白爪|r
step
    #optional
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    >>|cRXP_WARN_如果有人刚交任务, 你可能需要等他的RP时间结束|r
    .turnin 963 >>交任务: |cRXP_FRIENDLY_永志不渝|r
    .target Cerellean Whiteclaw
    .isQuestComplete 963
step
    #season 0
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .turnin 4811 >>交任务: |cRXP_FRIENDLY_红色水晶|r
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r
    .target Sentinel Glynda Nal'Shea
    .isOnQuest 4811
step
    .goto 1439,37.703,43.393
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .turnin 4812 >>交任务: |cRXP_FRIENDLY_清洗水晶|r
    .target Sentinel Glynda Nal'Shea
    .isQuestComplete 4812
step
    #season 0
    .goto 1439,37.767,44.001
    >>|cRXP_WARN_使用|r|T134865:0|t[空水瓶]|cRXP_WARN_在奥伯丁月泉|r
    .complete 4812,1 --Moonwell Water Tube (1)
    .use 14338
step
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >>交任务: |cRXP_FRIENDLY_清除疫病|r
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
    .target Tharnariun Treetender
    .isQuestComplete 2138
step
    #optional
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
    .target Tharnariun Treetender
    .isQuestTurnedIn 2138
step
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 985 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
    .accept 986 >>接任务: |cRXP_LOOT_丢失的主人|r << !sod
    .target Terenthis
step
    #optional
    #completewith next
    .goto 1439,39.280,43.121,6,0
    .goto 1439,39.162,43.194,6 >>上楼
step
    .goto 1439,39.043,43.555
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_哨兵艾莉萨·星风|r交谈
    .accept 965 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Sentinel Elissa Starbreeze
step << !Hunter
    #optional
    #completewith Level10CookEnd
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor 6301 >>|cRXP_BUY_从他那里购买|r|T134059:0|t[甜香料]|cRXP_BUY_, 直到你拥有的|r|T134059:0:0|t[甜香料]|cRXP_BUY_数量等于或超过你当前持有的|r|T132832:0|t[小蛋]|cRXP_BUY_数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target Gorbold Steelhand
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .accept 982 >>接任务: |cRXP_LOOT_深不可测的海洋|r
    .target Gorbold Steelhand
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >>交任务: |cRXP_FRIENDLY_深不可测的海洋|r
    .target Gorbold Steelhand
    .isQuestComplete 982
step
    #label Level10CookEnd
    .goto 1439,37.511,41.670
    >>|cRXP_WARN_前往地面上的|cRXP_PICK_营火|r|r
    +|cRXP_WARN_开始|r|T133971:0|t[烹饪] |T132834:0|t[草药烘蛋]|cRXP_WARN_. 重复此任务, 直到你的|r|T133971:0|t[烹饪]|cRXP_WARN_等级达到至少10级|r
    >>|cRXP_WARN_继续提升你的|r |T133971:0|t[烹饪] |cRXP_WARN_等级, 直到你用完|r |T132832:0|t[小蛋] << !sod
    >>|cRXP_WARN_暮色森林稍后有一个任务, 要求你的|r|T133971:0|t[烹饪]|cRXP_WARN_等级达到50或更高. 你也可以在即将登船时烹饪这个|r << !sod
    .skill cooking,50,1
    .itemcount 6889,1 -- Small Egg (1+)
step
    #optional
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >>接任务: |cRXP_LOOT_炖陆行鸟|r
    .turnin 2178 >>交任务: |cRXP_FRIENDLY_炖陆行鸟|r
    .target Alanndarian Nightsong
    .itemcount 5469,5 -- Strider Meat (5)
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
step << !sod/Rogue
    #label TOTH
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 958 >>交任务: |cRXP_FRIENDLY_上层精灵的工具|r << !sod
    .turnin 4762 >>交任务: |cRXP_FRIENDLY_壁泉河|r << sod
    .accept 4763 >>接任务: |cRXP_LOOT_黑木熊怪的堕落|r << sod
    .target Thundris Windweaver
    .isQuestComplete 958

----End of small south loop for ERA and SoD Warrior/Rogue/Priest----


----Start of NE >1.49x catchup (everyone 1x) Final boat section----


step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith next
    +|cRXP_WARN_按 Esc 键, 然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用互动键”, 并将“与目标互动”选项绑定到一个按键|r
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,38.213,28.754
--  .goto 1439,38.234,28.796
    >>|cRXP_WARN_==注意你的呼吸条==|r
    >>|cRXP_WARN_潜入水下, 游到船尾外侧|r
    >>|cRXP_WARN_在箭头指示位置, 按下“与目标互动”键绑定, 从船外拾取|cRXP_LOOT_银色清晨号的保险箱|r|r
    >>|cRXP_WARN_如果你不想这样做, 可以潜入船底最底层, 然后打开|cRXP_LOOT_银色清晨号的保险箱|r进行搜刮|r
    .complete 982,1 --Silver Dawning's Lockbox (1)
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    #label MistVeil
    .goto 1439,39.581,27.487
--  .goto 1439,39.629,27.462
    >>|cRXP_WARN_==注意你的呼吸条==|r
    >>|cRXP_WARN_潜入水下, 游到船尾外侧|r
    >>|cRXP_WARN_在箭头指示位置, 按下“与目标互动”键, 从船外拾取|cRXP_LOOT_迷雾之纱号的保险箱|r|r
    >>|cRXP_WARN_如果你不想这么做, 可以潜入水底, 到达船体底层, 然后打开|cRXP_LOOT_迷雾之纱号的保险箱|r进行搜刮|r
    .complete 982,2 --Mist Veil Lockbox (1)
    .isOnQuest 982
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
    .isOnQuest 982


----End of NE >1.49x catchup (everyone 1x) Final boat section----


step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith BoatSeaCreature
    .goto 1439,44.190,33.697,0
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r. 从它们身上获取 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .isOnQuest 1002
step
    #season 0
    #optional
    #completewith BoatSeaCreature
    .goto 1439,43.509,33.207,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r. 击败它们后可获得其掉落的|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心, 因为他们|r|T132307:0|t[逃跑]|cRXP_WARN_在<30% 生命值|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob Foreststrider Fledgling
step
    #season 0
    #optional
    #completewith BoatSeaCreature
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 击败后从其身上搜刮出 |T132832:0|t|cRXP_LOOT_[小蛋]|r
    >>|cRXP_WARN_这将用于在之后将你的烹饪技能提升至50级|r|T133971:0|t[烹饪]|cRXP_WARN_稍后|r|cRXP_WARN_至50级|r
    >>|cRXP_WARN_现在不用特意去刷这个. 只要记得保留好鸡蛋, 开始考虑一下你还需要多少次技能升级才能达到50级烹饪即可|r
    .collect 6889,50,90,1,0x20,cooking --Small Egg (10-49)
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
    .subzoneskip 446 --BashalAran
    .subzoneskip 452 --Mists Edge
--   .skill cooking,<10,1
    .skill cooking,50,1 --XX Shows if cooking skill is between 10-50
step
    #season 0
    .goto 1439,47.314,48.676
    >>点击|cRXP_PICK_神秘的红色水晶|r
    >>|cRXP_WARN_小心位于|cRXP_PICK_神秘的红色水晶|r以西的两组狂暴的月夜枭兽, 每组两只, 距离最近的两只之间会被锁链连接|r
    .turnin 4812 >>交任务: |cRXP_FRIENDLY_清洗水晶|r
    .accept 4813 >>接任务: |cRXP_LOOT_水晶中的碎骨|r
step
    #season 0 << !Warrior !Rogue
    #label BashalEnd
    .goto 1439,44.168,36.289
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .isOnQuest 957
    .target Asterion
step
    #optional
    #season 0 << !Warrior !Rogue
    #completewith CrabTurtle
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_请注意, 当它们施放|r|T135914:0|t[狂犬病]|cRXP_WARN_时, 如果你未能及时击杀它们(近战效果:使所有生命值恢复降低50%, 持续10分钟)|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob Rabid Thistle Bear
step
    #label BoatSeaCreature
    #season 0
    .goto 1439,41.901,31.339
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    #optional
    #season 0 << !Warrior !Rogue
    #completewith CrabTurtle
    >>击杀 |cRXP_ENEMY_森林陆行鸟雏鸟|r 和 |cRXP_ENEMY_森林陆行鸟|r , 搜刮它们以获取 |cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_森林陆行鸟雏鸟|r|T132307:0|t[逃跑]|cRXP_WARN_生命值低于30%|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider Fledgling
    .mob Foreststrider
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith CrabTurtle
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r 和|cRXP_ENEMY_月夜猛虎|r . 击败它们后可获得其|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .mob Moonstalker
    .isOnQuest 1002
step
    #label CrabTurtle
    #season 0 << !Warrior !Rogue
    .goto Darkshore,44.18,20.60
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4725 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    #optional
    #completewith next
    #season 0 << !Warrior !Rogue
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
    >>击杀|cRXP_ENEMY_暗礁蟹|r. 击败它们获取|cRXP_LOOT_优质蟹肉|r
    >>|cRXP_WARN_考虑跳过一些17级的|r|cRXP_ENEMY_暗礁蟹|r|cRXP_WARN_如果你获得了不错的掉落物品. |r|cRXP_WARN_你现在不必完成这个任务|r
    >>请注意, 它们可以施放|T132155:0|t[肌肉撕裂], 这是一个瞬发攻击, 造成30-55点伤害
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob Reef Crawler
step
    .goto Darkshore,50.81,25.50
    #season 0 << !Warrior !Rogue
    >>|cRXP_WARN_使用|r|T134865:0|t[空的水样试管] |cRXP_WARN_在悬崖泉河底部|r
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350
step
	#xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith next
    .goto 1439,51.118,23.670,20,0
    .goto 1439,51.288,24.554,12 >>沿着坡道向上前往|cRXP_PICK_传声盒323号|r
    .isQuestComplete 1002
step
    #optional
	#xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,51.288,24.554
    >>点击地面上的|cRXP_PICK_传声盒323号|r
    .turnin 1002 >>交任务: |cRXP_FRIENDLY_传声盒323号|r
    .accept 1003 >>接任务: |cRXP_LOOT_传声盒525号|r
    .isQuestComplete 1002
step
	#xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,51.288,24.554
    >>点击地面上的|cRXP_PICK_传声盒323号|r
    .accept 1003 >>接任务: |cRXP_LOOT_传声盒525号|r
    .isQuestTurnedIn 1002


----Start of Hunter/Druid 1x early Althalaxx section (for money+xp)----


step << Hunter/Druid
	#xprate <1.5 << Hunter/Druid
    #optional
    #completewith Tower1
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_请注意, 当它们施放|r|T135914:0|t[狂犬病]|cRXP_WARN_时, 如果你未能及时击杀它们(近战效果:使所有生命值恢复降低50%, 持续10分钟)|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob Rabid Thistle Bear
step << Hunter/Druid
	#xprate <1.5 << Hunter/Druid
    #optional
    #completewith Tower1
    >>击杀|cRXP_ENEMY_森林陆行鸟|r. 击败它们后搜刮出|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider
step << Hunter/Druid
#xprate <1.5 << Hunter/Druid
    #optional
    #completewith Tower1
    >>击杀 |cRXP_ENEMY_月夜猛虎|r. 掠夺他们的 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker
    .isOnQuest 1002
step << Hunter/Druid
#xprate <1.5 << Hunter/Druid
    #optional
    #completewith Tower1
    .goto 1439,51.118,23.670,20,0
    .goto 1439,51.490,24.368,30,0
    .goto 1439,54.973,24.885,15 >>前往|cRXP_FRIENDLY_巴苏尔·影击|r
    .isQuestAvailable 1002 << !NightElf/Hunter
step << Hunter/Druid
#xprate <1.5 << Hunter/Druid
    #label Tower1
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 966 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Balthule Shadowstrike
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
    >>击杀|cRXP_ENEMY_暗滩狂热者|r. 击败他们后搜刮出|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob Dark Strand Fanatic
step << Hunter/Druid
#xprate <1.5 << Hunter/Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 967 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Balthule Shadowstrike
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
    >>击杀|cRXP_ENEMY_森林陆行鸟|r. 击败它们后搜刮出|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider

----End of Hunter/Druid 1x and SoD Warrior early Althalaxx section (for money+xp)----

step
    #optional
    #completewith CliffCave
    #season 0 << !Warrior !Rogue
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_请注意, 当它们施放|r|T135914:0|t[狂犬病]|cRXP_WARN_时, 如果你未能及时击杀它们(近战效果:使所有生命值恢复降低50%, 持续10分钟)|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob Rabid Thistle Bear
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith CliffCave
    >>击杀 |cRXP_ENEMY_月夜猛虎|r. 掠夺他们的 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker
    .isOnQuest 1002
step
    #optional
    #season 0 << !Warrior !Rogue
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
    >>击杀|cRXP_ENEMY_森林陆行鸟|r. 击败它们后搜刮出|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider
    .itemcount 5469,3 --Strider Meat (3+)
----XX Start from West Side if 3+
step
    #season 0 << !Warrior !Rogue
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
    >>击杀|cRXP_ENEMY_森林陆行鸟|r. 击败它们后搜刮出|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .mob Foreststrider
step
    #optional
	#xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,51.288,24.554
    >>点击地面上的|cRXP_PICK_传声盒323号|r
    .turnin 1002 >>交任务: |cRXP_FRIENDLY_传声盒323号|r
    .accept 1003 >>接任务: |cRXP_LOOT_传声盒525号|r
    .isQuestComplete 1002
    .subzoneskip 456,1 --Only turnin if you're nearby (Cliffspring River)
step
    #optional
    #completewith next
    #season 0 << !Warrior !Rogue
    #label CliffCave
    .goto 1439,54.934,32.721,20,0
    .goto 1439,55.108,33.600,40 >>前往悬崖泉河洞窟
step << Druid
    .goto Darkshore,54.99,33.41
    #season 0
    >>|cRXP_WARN_使用|r|T134776:0|t[空的峭壁之泉取样器]|cRXP_WARN_在悬崖泉河洞穴入口处的水中|r
    .complete 6122,1 --Filled Cliffspring Falls Sampler (1)
step
    .goto Darkshore,55.45,36.23,12,0
    .goto Darkshore,55.70,36.30,12,0
    .goto Darkshore,55.89,35.40,12,0
    #season 0 << !Warrior !Rogue
    >>拾取地面上的|cRXP_LOOT_粗柄蘑菇|r和|cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_待在上层区域. 如果顶部尽头没有|cRXP_LOOT_毒帽蘑菇|r, 就跳下去, 从下方的南侧房间获取一个|r
    >>|cRXP_WARN_请注意, 当|r雷鳞御浪者|r施放|r|T135836:0|t[水波冲击]时|r(远程瞬发:对附近敌人造成伤害并将其击退)——确保你不会被击退至洞穴上层边缘而坠落|r
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
    #season 0
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step << skip --logout skip
    #hardcore << NightElf !Druid
    #optional
    #label MushroomLS
    #completewith CavetoAuber
    #season 0
    .goto 1439,54.964,34.536
    .goto 1439,41.705,36.507,20 >>|cRXP_WARN_Jump on top of the rock on the top floor inside the cave. Position your character until it looks like they're floating, then perform a Logout Skip by logging out and back in|r
step
    #hardcore << NightElf !Druid
    #completewith CavetoAuber
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r. 击败它们后可获得其掉落的|cRXP_LOOT_陆行鸟肉|r
    >>|cRXP_WARN_小心, 因为他们|r|T132307:0|t[逃跑]|cRXP_WARN_在<30% 生命值|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob Foreststrider Fledgling
    .isQuestAvailable 2178
step
    #hardcore << NightElf !Druid
    #xprate <1.5 --<< !NightElf/Hunter
    #requires MushroomLS
    #completewith CavetoAuber
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r. 从它们身上获取 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .isOnQuest 1002
step
    #optional
    #label CavetoAuber
    #completewith CliffspringEnd
    .subzone 442 >>前往奥伯丁
step
    #label CliffspringEnd
    #season 0
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4762 >>交任务: |cRXP_FRIENDLY_壁泉河|r
    .accept 4763 >>接任务: |cRXP_LOOT_黑木熊怪的堕落|r
    .target Thundris Windweaver
step
    .goto Darkshore,37.70,40.70
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 2178 >>接任务: |cRXP_LOOT_炖陆行鸟|r
    .turnin 2178 >>交任务: |cRXP_FRIENDLY_炖陆行鸟|r
    .turnin 6122 >>交任务: |cRXP_FRIENDLY_毒水之源|r << Druid
    .accept 6123 >>接任务: |cRXP_LOOT_收集解药|r << Druid
    .target Alanndarian Nightsong
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher
    .isQuestAvailable 2178 << Druid
step << Druid
    #optional
    #season 0
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .turnin 6122 >>交任务: |cRXP_FRIENDLY_毒水之源|r
    .accept 6123 >>接任务: |cRXP_LOOT_收集解药|r
    .target Alanndarian Nightsong
step << !NightElf
    #xprate <1.5
    #optional
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
    .isQuestComplete 2138
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .turnin 982 >>交任务: |cRXP_FRIENDLY_深不可测的海洋|r
    .target Gorbold Steelhand
step << !NightElf
    #season 0
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
step
    .goto 1439,38.843,43.416
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >>交任务: |cRXP_FRIENDLY_清除疫病|r
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
    .target Tharnariun Treetender
    .isQuestComplete 2138
step
    .goto 1439,38.843,43.416
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
    .target Tharnariun Treetender
    .isQuestTurnedIn 2138
step
    .goto Darkshore,37.70,43.39
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    >>|cRXP_WARN_选择|r|T135641:0|t[曲木匕首]|cRXP_WARN_, 因为你应该尝试为后续的|r|T132290:0|t[毒药]|cRXP_WARN_任务保留一把|r|T135641:0|t[匕首]|r << Rogue
    .turnin 4813 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r
    .target Sentinel Glynda Nal'Shea
step
    .goto Darkshore,37.78,44.06
    #season 0
    >>|cRXP_WARN_使用|r|T133748:0|t[空的净化碗]|cRXP_WARN_在奥伯丁月井|r
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .use 12346
    .isOnQuest 4763
step
    .goto 1439,37.322,43.640
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .turnin 947 >>交任务: |cRXP_FRIENDLY_洞中的蘑菇|r
    .accept 948 >>接任务: |cRXP_LOOT_安努|r
    .target Barithras Moonshade
step
    .goto Darkshore,37.21,44.22
    #season 0
    >>点击|cRXP_PICK_通缉告示|r
    .accept 4740 >>接任务: |cRXP_LOOT_通缉：莫克迪普！|r
step << NightElf !Druid
    .goto 1439,36.767,44.285
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱尔德|r交谈
    .accept 6343 >>接任务: |cRXP_LOOT_飞回泰达希尔|r
    .target Laird
step
    #optional
    .goto Darkshore,36.096,44.931
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务: |cRXP_FRIENDLY_海中的水果|r
    .target Gubber Blump
    .isQuestComplete 1138
step
    #optional
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4723 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .turnin 4725 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .target Gwennyth Bly'Leggonde
    .isOnQuest 4723
step
    #optional
    #season 0
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4725 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .target Gwennyth Bly'Leggonde


----Start of Druid Quest section----


step << Druid
    #optional
    #season 0
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
    .xp 16 >>刷到16级
    .mob Blackwood Pathfinder
    .mob Blackwood Windtalker
step << Druid
    #optional
    #season 0
    #completewith DruidLesson
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >>飞往泰达希尔
    .target Caylais Moonfeather
step << Druid
    #optional
    #season 0
    .goto Teldrassil,56.25,92.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼莎·影歌|r 交谈
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
    .target Nessa Shadowsong
step << Druid
    #optional
    #season 0
    #label DruidLesson
    #completewith next
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Druid
    .goto Darnassus,35.375,8.405
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .accept 26 >>接任务: |cRXP_LOOT_必修的课程|r
    .trainer >>训练你的职业法术
    .target Mathrengyl Bearwalker
step << Druid
    #optional
    #season 0
    #completewith next
    .abandon 729 >>放弃“健忘的勘察员”去接受任务“黑海岸的麻烦事”吗？
step << Druid
    .goto Teldrassil,23.70,64.51
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .accept 730 >>接任务: |cRXP_LOOT_黑海岸的麻烦事|r
    .target Chief Archaeologist Greywhisker
step << Druid
    #optional
	#completewith TotL
    #season 0
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
step << Druid
    #season 0
    .goto Moonglade,56.1,30.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 26 >>交任务: |cRXP_FRIENDLY_必修的课程|r
    .accept 29 >>接任务: |cRXP_LOOT_湖中试炼|r
    .target Dendrite Starblaze
step << Druid
    #season 0
    .goto Moonglade,52.6,51.6
    >>游入艾露恩阿拉湖
    >>打开一个|cRXP_PICK_神殿灵珠容器|r. 从中获取 |T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_它可能在水下不同位置生成|r
    .collect 15877,1,29,1 -- Shrine Bauble (1)
step << Druid
    #optional
    #season 0
    #completewith next
    .cast 18960 >>传送术:月光林地
    .itemcount 15877,1 -- Shrine Bauble (1)
step << Druid
    #season 0
    .goto Moonglade,36.026,41.374
    >>|cRXP_WARN_使用|r|T134125:0|t[神殿灵珠] |cRXP_WARN_在雷姆洛斯神殿的树旁|r
    .complete 29,1 --Complete the Trial of the Lake.
    .use 15877
step << Druid
    #label TotL
    #season 0
    .goto Moonglade,36.517,40.104
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔加里|r交谈
    .turnin 29 >>交任务: |cRXP_FRIENDLY_湖中试炼|r
    .accept 272 >>接任务: |cRXP_LOOT_海狮试炼|r
    .target Tajarri
step << Druid
    #optional
    #season 0
    .hs >>传送至黑海岸
    .zoneskip Darkshore


----End of Druid Quest section----


]])

----End of Darkshore Part 1----
----Start of Darkshore Part 2----
----Hunters stay in Darkshore/Ashenvale and Grind, 2x skips Redridge----

RXPGuides.RegisterGuide([[
#classic
#season 0,1
#version 1
<< Alliance
#group RestedXP 联盟 1-20级
#name 16-19 黑海岸
#displayname 16-19 黑海岸 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 19-20 赤脊山；20-21 黑海岸/灰谷 << !Hunter
#next 19-21 黑海岸/灰谷 << Hunter

step << NightElf !Druid
    #optional
    #completewith PortalDarn
    #season 0
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >>飞往泰达希尔
    .target Caylais Moonfeather
    .zoneskip Teldrassil
step << NightElf !Druid
    .goto Teldrassil,56.25,92.44
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼莎·影歌|r 交谈
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
    .target Nessa Shadowsong
step << NightElf !Druid
    #completewith next
    #season 0
    #label PortalDarn
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << NightElf Warrior
    .goto Darnassus,58.72,34.92
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arias'ta 刀锋舞者|r交谈
    .trainer >>训练你的职业法术
    .target Arias'ta Bladesinger
step << NightElf Warrior
    .goto Darnassus,57.56,46.72
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .train 2567 >>投掷训练
    .target Ilyenia Moonfire
step << NightElf Hunter
    #completewith start
    #season 0
    .goto Darnassus,40.38,8.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .trainer >>训练你的职业法术
    .target Jocaste
step << NightElf Hunter
    #completewith start
    #season 0
    #label RecruveReinforced
    .goto Darnassus,63.27,66.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰德瑞亚|r交谈
    >>|cRXP_WARN_买一把|r|T135489:0|t[重型弯弓] |cRXP_WARN_如果你买得起. 如果买不起, 就买一把|r|T135490:0|t[强化弓]
    >>|cRXP_WARN_准备充足|r|T132382:0|t[锋利的箭]
    .collect 3027,1
    .target Landria
    .money <0.3812
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.50
step << Hunter
    #requires RecruveReinforced
    #season 0
    #completewith next
    +|cRXP_WARN_装备|r|T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.19
    .xp <20,1
step << Hunter
    #requires RecruveReinforced
    #season 0
    #completewith next
    +|cRXP_WARN_装备|r |T135490:0|t[强化弓]
    .use 3026
    .itemcount 3026,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.49
step << NightElf Rogue
    >>进入塞纳里奥议会 enclave
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尤娜|r交谈
    .goto Darnassus,31.84,16.69,15,0
    .goto Darnassus,37.00,21.92
    .trainer >>训练你的职业法术
    .target Syurna
step << NightElf !Druid
    #optional
    #season 0
    #completewith next
    .abandon 729 >>放弃“健忘的勘察员”去接受任务“黑海岸的麻烦事”吗？
step << NightElf !Druid
    .goto Teldrassil,23.70,64.51
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .accept 730 >>接任务: |cRXP_LOOT_黑海岸的麻烦事|r
    .target Chief Archaeologist Greywhisker
step << NightElf Priest
    .goto Darnassus,37.90,82.74
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾德莉亚|r交谈
    .trainer >>训练你的职业法术
    .target Jandria
step << NightElf !Druid
    #label start
    #season 0
    .hs >>传送至奥伯丁
step
    .goto Darkshore,37.21,44.22
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击|cRXP_FRIENDLY_通缉告示|r
    .accept 4740 >>接任务: |cRXP_LOOT_通缉：莫克迪普！|r
step << NightElf
    .goto 1439,37.439,41.839
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .turnin 730 >>交任务: |cRXP_FRIENDLY_黑海岸的麻烦事|r
    .accept 729 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
    .isOnQuest 730
step << NightElf
    #optional
    .goto 1439,37.439,41.839
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
step
    .goto 1439,37.394,40.128
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4762 >>交任务: |cRXP_FRIENDLY_壁泉河|r
    .accept 4763 >>接任务: |cRXP_LOOT_黑木熊怪的堕落|r
    .target Thundris Windweaver
step
    .goto Darkshore,37.78,44.06
    #season 0
    .use 12346 >>|cRXP_WARN_使用|r|T133748:0|t[空的净化碗] |cRXP_WARN_于|r|cRXP_PICK_羽月岗哨|r
    .collect 12347,1,4763,1
    .isOnQuest 4763
step
    #season 0
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
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r. 从她身上搜刮出她的|cRXP_LOOT_项链|r
    >>|cRXP_WARN_请注意, 她的刷新时间为7至8分钟, 共有4个不同的刷新点分布在亚米萨兰区域|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan Anaya Dawnrunner
    .solo
step
    #season 0
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
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r. 从她身上搜刮出她的|cRXP_LOOT_项链|r
    >>|cRXP_WARN_请注意, 她的刷新时间为7至8分钟, 共有4个不同的刷新点分布在亚米萨兰区域|r
    >>|cRXP_WARN_如果你找不到她, 可以考虑与附近的人组队. 请在通用聊天(/1)中询问是否有其他玩家也在寻找她, 并一起组队行动|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan Anaya Dawnrunner
    .group
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    #completewith CompleteFangs
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r 和|cRXP_ENEMY_月夜猛虎|r . 击败它们后可获得其|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .mob Moonstalker
    .isOnQuest 1002
step
    #season 0
    #completewith OnuGrove
    >>击杀南方黑海岸的狂暴蓟熊|r
    >>|cRXP_WARN_请注意, 当它们施放|r|T135914:0|t[狂犬病]|cRXP_WARN_时, 如果你未能及时击杀它们(近战效果:使所有生命值恢复降低50%, 持续10分钟)|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob Rabid Thistle Bear
step << Druid
    #xprate <1.5
    #sticky
    #label earthroot
    >>在任务过程中收集 5 |T134187:0|t[地根草]
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
    >>在洞穴各处地面拾取|cRXP_LOOT_Lunar Fungi|r的战利品
    .complete 6123,2
    .isOnQuest 6123
step
    #completewith OnuGrove
    #season 0
    .goto 1439,43.555,76.293,80 >>前往古树之林
step
    #label OnuGrove
    #season 0
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 952 >>交任务: |cRXP_FRIENDLY_古树之林|r << NightElf
    .turnin 948 >>交任务: |cRXP_FRIENDLY_安努|r
    .accept 944 >>接任务: |cRXP_LOOT_主宰之剑|r
    .target Onu
step
    #completewith MasterG
    #season 0
    >>击杀|r月夜雄虎|r. 从它们身上搜刮|r兽皮|r
    >>小心它们的背刺攻击 |T132090:0:0|t[利用弱点], 如果你背对它们, 将造成20-40点伤害
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .unitscan Moonstalker Sire
    .isOnQuest 986
step
	#xprate <1.5 --<< !NightElf/Hunter
    #completewith MasterG
    #optional
    .goto Darkshore,38.60,80.50,0
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r. 击杀后可掠夺其|cRXP_LOOT_头皮|r
    >>注意他们的施法 |T132152:0|t[毁灭], 这是一个瞬发攻击, 造成20-40点伤害, 并且|cRXP_WARN_将你击倒2秒|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob Grizzled Thistle Bear
step
    #xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto 1439,41.390,80.563
    >>点击地面上的 |cRXP_PICK_传声盒525号|r
    .turnin 1003 >>交任务: |cRXP_FRIENDLY_传声盒525号|r
    .isQuestComplete 1003
step
    #label MasterG
    #season 0
    .goto Darkshore,38.54,86.05,100 >>前往主宰之剑
    .subzoneskip 449
    .isOnQuest 944
step
    #optional
    #completewith TheryluneEnd
    #season 0
    >>击杀|cRXP_ENEMY_暮光信徒|r 和|cRXP_ENEMY_暮光暴徒|r . 从他们身上搜刮出 |T133743:0|t[|cRXP_LOOT_Book: 《深渊之神》|r ]
    *|cRXP_WARN_Be careful as |cRXP_ENEMY_Twilight Thugs|r can|r |T132343:0|t[Disarm] |cRXP_WARN_you for 6 seconds|r << Rogue/Paladin/Warrior
    *|cRXP_WARN_Be careful as |cRXP_ENEMY_Twilight Disciples|r cast|r |T135953:0|t[Renew] |cRXP_WARN_and a 3 second|r |T135915:0|t[Heal]
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob Twilight Disciple
    .mob Twilight Thug
--  .use 13536
step
    #optional
    #season 0
    .goto 1439,38.537,86.050
    >>发现主宰之剑
    .complete 944,1 --Enter the Master's Glaive (1)
step
    #optional
    #completewith next
    #season 0
    .cast 5809 >>|cRXP_WARN_使用|r|T134715:0|t[占卜之水] |cRXP_WARN_并将其放置在地面上|r
    .use 5251
step
    .goto 1439,38.537,86.050
    #season 0
    >>|cRXP_WARN_点击地面上的|cRXP_PICK_占卜之碗|r|r
    .turnin 944 >>交任务: |cRXP_FRIENDLY_主宰之剑|r
    .accept 949 >>接任务: |cRXP_LOOT_暮光之锤的营地|r
    .use 5251
step
    .goto 1439,38.537,86.050
    #season 0
    >>点击北方基座上的|cRXP_PICK_暮光宝典|r
    .turnin 949 >>交任务: |cRXP_FRIENDLY_暮光之锤的营地|r
    .accept 950 >>接任务: |cRXP_LOOT_向安努回复|r
step
    .goto 1439,38.660,87.305
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_瑟瑞露尼|r. 这将开启护送任务
    >>|cRXP_WARN_如果她不在场, 请跳过此步骤|r
    .accept 945 >>接任务: |cRXP_LOOT_护送瑟瑞露尼|r
    .target Therylune
step
    #label TheryluneEnd
    #season 0
    .goto Darkshore,40.51,87.09
    >>|cRXP_WARN_护送瑟瑞露尼离开大师之刃|r
    .complete 945,1 --护送瑟瑞露尼 away from the Master's Glaive (1)
    .isOnQuest 945
step
    #optional
    #season 0
    #sticky
    .isQuestTurnedIn 949
    .destroy 5251 >>摧毁: |cRXP_ENEMY_占卜之水|r, 它在你的背包中. 不再需要它了
step
    #optional
    #season 0
    #completewith TurtleSouth
    #completewith prospector << Hunter
    >>击杀|r月夜雄虎|r. 从它们身上搜刮|r兽皮|r
    >>请注意, 他们可以施放|T132090:0|t[利用弱点], 如果你背对他们, 会发动一次造成20-40点伤害的背刺攻击
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .isOnQuest 986
    .unitscan Moonstalker Sire
step
	#xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto Darkshore,41.44,86.06,50,0
    .goto Darkshore,41.77,84.60,50,0
    .goto Darkshore,42.94,82.25,50,0
    .goto Darkshore,43.59,80.02,50,0
    .goto Darkshore,39.74,80.43,50,0
    .goto Darkshore,38.00,83.55
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r. 击杀后可掠夺其|cRXP_LOOT_头皮|r
    >>注意他们的施法 |T132152:0|t[毁灭], 这是一个瞬发攻击, 造成20-40点伤害, 并且|cRXP_WARN_将你击倒2秒|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob Grizzled Thistle Bear
step
    #xprate <1.5 --<< !NightElf/Hunter
    #label LastBuzz
    .goto 1439,41.390,80.563
    >>点击地面上的 |cRXP_PICK_传声盒525号|r
    .turnin 1003 >>交任务: |cRXP_FRIENDLY_传声盒525号|r
    .isQuestComplete 1003
step
    .goto 1439,43.555,76.293
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >>交任务: |cRXP_FRIENDLY_向安努回复|r
    .timer 11.5,Return to Onu RP
--  .timer 14,Return to Onu RP
    .accept 951 >>接任务: |cRXP_LOOT_玛塞斯特拉遗物|r
    .target Onu
step << Hunter
    #optional
    #season 0
    .goto Darkshore,38.54,86.05
    .xp 17 >>升级到17级
step << Hunter
    #sticky
    #season 0
    #label prospector
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>|cRXP_WARN_你可能需要等待他重生, 或等待其他玩家完成护送任务|r
    .turnin 729 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .target Prospector Remtravel
step << Hunter
    .goto Darkshore,35.72,83.69
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈. 这将开启一个护送任务
    .accept 731,1 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    >>|cRXP_WARN_这个任务非常困难. 你可以跳过这一步, 等达到19级再回来做|r
    .link https://youtu.be/3d-htESNztE >>|cRXP_WARN_点击此处查看视频攻略|r
    .target Prospector Remtravel
step << Hunter
    #requires prospector
    #season 0
    >>|cRXP_WARN_护送勘察员雷姆塔维尔穿过挖掘区|r
    >>|cRXP_WARN_这个任务非常困难. 你可以跳过这一步, 等达到19级再回来做|r
    .link https://youtu.be/3d-htESNztE >>|cRXP_WARN_点击此处查看视频攻略|r
    .complete 731,1
    .isOnQuest 731
step << Hunter
    #xprate <1.5
    #season 0
    .goto 1439,31.251,87.419
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_这个任务可能非常困难. 请逐个攻击|cRXP_ENEMY_鱼人|r, 否则可能会同时引燃多个目标的仇恨|r
    >>|cRXP_WARN_请注意|cRXP_ENEMY_灰雾智者|r '|r|T136048:0|t[闪电箭]|cRXP_WARN_伤害, 它们还能使用|r |T136052:0|t[治疗波]进行治疗|r
    .link https://youtu.be/lfQM3Q-Ag5A >>|cRXP_WARN_点击此处查看视频攻略|r
step
    #completewith CompleteThistleBears
    #season 0
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
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r, 击败它们后可获得|cRXP_LOOT_优质蟹肉|r
    >>请注意, |cRXP_ENEMY_暗礁蟹|r 可以施放 |T132155:0|t[肌肉撕裂], 这是一种瞬间攻击, 造成 30-55 点伤害
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Reef Crawler
    .mob Encrusted Tide Crawler
step << Hunter
	#xprate <1.5
    #season 0
    .goto 1439,31.229,85.564
    >>|cRXP_WARN_请注意|cRXP_ENEMY_灰雾智者|r '|r|T136048:0|t[闪电箭]|cRXP_WARN_伤害, 它们还能使用|r |T136052:0|t[治疗波]进行治疗|r
    >>注意, |cRXP_ENEMY_灰雾潮行者|r在近战状态下可以施放|T136016:0|t[|cRXP_FRIENDLY_毒药|r], 造成每3秒13点伤害的持续伤害效果, 持续30秒
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    #label TurtleSouth
	#xprate <1.5
    #season 0
    .goto 1439,31.690,83.700
    >>|cRXP_WARN_请注意|cRXP_ENEMY_灰雾智者|r '|r|T136048:0|t[闪电箭]|cRXP_WARN_伤害, 它们还能使用|r |T136052:0|t[治疗波]进行治疗|r
    >>注意, |cRXP_ENEMY_灰雾潮行者|r 在近战时可以施放 |T136016:0|t[|cRXP_FRIENDLY_中毒|r ], 造成每3秒13点伤害, 持续30秒
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step << !Hunter
	#xprate <1.5
    #season 0
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step << Hunter
	#xprate <1.5
    #season 0
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step << Druid
    #optional
    #season 0
    >>|cRXP_WARN_通过|T136065:0|t[草药学]采集|T134187:0|t[地根草], 并有极小概率获得|r|cRXP_PICK_破损的箱子|r
    >>|cRXP_WARN_如果你放弃且无法获得足够的物品, 请跳过此步骤|r
    .complete 6123,1 --Earthroot (5)
    .isOnQuest 6123
    .skill herbalism,<15,1
--XX Add waypoints later
step
    #label Murk
    #season 0
    .goto 1439,35.429,76.566,0
    .goto 1439,35.429,76.566,60,0
    .goto Darkshore,36.64,76.53
    >>|cRXP_WARN_请确保检查|cRXP_ENEMY_莫克迪普|r 是否已在水中(如果有人先前未能成功击败该遭遇, 或是在他生成的波次中留下了活着的|cRXP_ENEMY_灰雾猎人|r)|r
    >>击杀营地中的灰雾战士和灰雾猎人
    >>|cRXP_WARN_前往营地中心的篝火处, 开始与|cRXP_ENEMY_莫克迪普|r的遭遇战:|r
    >>|cRXP_WARN_水中将陆续刷新3波敌人, 每击杀前一波后才会生成下一波：第1波有3个12-13级的|cRXP_ENEMY_灰雾滩行者|r, 第2波有2个15-16级的|cRXP_ENEMY_灰雾战士|r, 第3波则包含1个19级的|cRXP_ENEMY_莫克迪普|r和1个16-17级的|cRXP_ENEMY_灰雾猎人|r. 你可以远离篝火, 以避免吸引下一波敌人的仇恨|r
    .complete 4740,1 -- Murkdeep (1)
    .unitscan Murkdeep
    .mob Greymist Warrior
    .mob Greymist Hunter
    .mob Greymist Coastrunner
step
    #label CompleteThistleBears
    #season 0
    .goto 1439,35.968,70.807
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4728 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step << Druid
    #label Southcrabs
    #season 0
    #requires earthroot
	#completewith FlyDarkshore
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
step << Druid
    #requires earthroot
    #season 0
    .goto Moonglade,52.53,40.57
	>>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >>训练你的职业法术
    .target Loganaar
    .xp <18,1
step << Druid
    #label FlyDarkshore
    #season 0
    .goto Moonglade,48.11,67.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德拉尔|r交谈
    .fly Auberdine >>飞往黑海岸
    .target Sindrayl
    .zoneskip Darkshore
step << NightElf !Druid/Dwarf Hunter
    #label Southcrabs
    #season 0
    #completewith CleansingTharnariun
    .subzone 442 >>前往奥伯丁
step
    #optional
    #completewith next
    #season 0
    .goto 1439,36.806,44.137,8,0
    .goto 1439,35.743,43.710,12 >>返回码头上的|cRXP_FRIENDLY_塞瑞利恩·白爪|r
step
    #optional
    #season 0
    .goto 1439,35.743,43.710
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    >>|cRXP_WARN_如果有人刚交任务, 你可能需要等他的RP时间结束|r
    .turnin 963 >>交任务: |cRXP_FRIENDLY_永志不渝|r
    .target Cerellean Whiteclaw
    .isQuestComplete 963
step
    #optional
    #season 0
    #completewith CleansingTharnariun
    .abandon 963 >>永志不渝而弃
step
    #xprate <1.5
    #season 0
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4728 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .turnin 4730 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .turnin 4731 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4732 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r << Hunter
    .turnin 4733 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r << Hunter
    .target Gwennyth Bly'Leggonde
step
    #optional
    #season 0
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务: |cRXP_FRIENDLY_海中的水果|r
    .isQuestComplete 1138
    .target Gubber Blump
step
    .goto Darkshore,36.8,44.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱尔德|r 和|cRXP_FRIENDLY_奥林迪雅|r 交谈
    .vendor >>|cRXP_BUY_购买并补充食物和水|r
    .target Laird
    .target Allyndia
step
    .goto 1439,37.703,43.393
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
    .turnin 4740 >>交任务: |cRXP_FRIENDLY_通缉：莫克迪普！|r
    .target Sentinel Glynda Nal'Shea
step
    #label CleansingTharnariun
    #season 0
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2138 >>交任务: |cRXP_FRIENDLY_清除疫病|r
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
    .target Tharnariun Treetender
step << Hunter
    .goto 1439,37.439,41.839
    #season 0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .turnin 731 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .accept 741 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
    .isQuestComplete 731
step << Hunter
    #optional
    #season 0
    .goto 1439,37.439,41.839
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 741 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
    .isQuestTurnedIn 731
step << Hunter
    #optional
    #season 0
    .goto Darkshore,37.4,40.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor >>|cRXP_BUY_补充弹药|r
    .target Dalmond
step << Druid
    #xprate <1.5
    #season 0
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .turnin 6123 >>交任务: |cRXP_FRIENDLY_收集解药|r
    .accept 6124 >>接任务: |cRXP_LOOT_消除疾病|r
    .isQuestComplete 6123
step << Druid
    #xprate <1.5
    #optional
    #season 0
    .goto Darkshore,37.70,40.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .accept 6124 >>接任务: |cRXP_LOOT_消除疾病|r
    .target Alanndarian Nightsong
    .isQuestTurnedIn 6123
step << Druid
    #optional
    #season 0
    #completewith Buzzbox323End
    .abandon 6123 >>放弃收集解药
step << Druid
    #xprate <1.5
    #optional
    #season 0
    #completewith Buzzbox323End
    .goto Darkshore,49.7,33.2,0
    .goto Darkshore,43.4,25.1,0
    .goto Darkshore,39.6,34.8,0
    >>|cRXP_WARN_使用|r|T132801:0|t[动物医疗药膏], |cRXP_WARN_目标: |r|cRXP_ENEMY_生病的鹿|r
    .complete 6124,1 -- Sickly Deer cured (10)
    .mob Sickly Deer
    .isQuestAvailable 1138
step << Druid
    #xprate <1.5
    #season 0
    #sticky
    #label SicklyDeers
    #loop
    .goto Darkshore,49.7,33.2,0
    .goto Darkshore,43.4,25.1,0
    .goto Darkshore,39.6,34.8,0
    .waypoint Darkshore,49.7,33.2,40,0
    .waypoint Darkshore,43.4,25.1,40,0
    .waypoint Darkshore,39.6,34.8,40,0
    >>|cRXP_WARN_使用|r|T132801:0|t[动物医疗药膏], |cRXP_WARN_目标: |r|cRXP_ENEMY_生病的鹿|r
    .complete 6124,1 -- Sickly Deer cured (10)
    .mob Sickly Deer
    .use 15826
    .isQuestTurnedIn 1138
step
    #sticky
    #label Blackwood1
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,50.66,34.94
    >>打开|r|cRXP_PICK_黑木谷物仓库|r, 从中搜刮|r|T134059:0|t|cRXP_LOOT_[黑木谷物样本]|r
    >>|cRXP_WARN_拾取此物品会刷新2只|cRXP_ENEMY_黑木熊怪|r, 它们会仇恨并朝你跑来. 请做好战斗准备或重置它们|r
    >>|cRXP_WARN_如果你看到|cRXP_ENEMY_Xabraxxis|r在聊天中喊话, 或发现有人正在与他战斗, 请协助他们. 打开他掉落的地上的|cRXP_PICK_Xabraxxis' Demon Bag|r(萨巴克希斯的恶魔之包), 从中拾取|cRXP_LOOT_Talisman of Corruption|r(堕落护符)|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)
step
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀|cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_蓟熊幼崽|r可以施放|r|T132152:0|t[毁灭]|cRXP_WARN_, 这是一种近战瞬发技能, 会使你眩晕2秒|r
    .complete 2139,1 --Den Mother (1)
    .mob Den Mother
step
    #sticky
    #requires Blackwood1
    #label Blackwood2
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39,0
    .goto Darkshore,51.83,33.50
    >>打开|cRXP_PICK_黑木坚果商店|r. 将其开启, 获得 |T133944:0|t|cRXP_LOOT_[黑木坚果样本]|r
    >>|cRXP_WARN_拾取此物品会刷新2只|cRXP_ENEMY_黑木熊怪|r, 它们会仇恨并朝你跑来. 请做好战斗准备或重置它们|r
    >>|cRXP_WARN_如果你看到|cRXP_ENEMY_Xabraxxis|r在聊天中喊话, 或发现有人正在与他战斗, 请协助他们. 打开他掉落的地上的|cRXP_PICK_Xabraxxis' Demon Bag|r(萨巴克希斯的恶魔之包), 从中拾取|cRXP_LOOT_Talisman of Corruption|r(堕落护符)|r
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
    >>打开 |cRXP_PICK_黑木水果店|r. 搜索该地点, 获取 |T134013:0|t|cRXP_LOOT_[黑木水果样本]|r
    >>|cRXP_WARN_拾取此物品会刷新2只|cRXP_ENEMY_黑木熊怪|r, 它们会仇恨并朝你跑来. 请做好战斗准备或重置它们|r
    >>|cRXP_WARN_如果你看到|cRXP_ENEMY_Xabraxxis|r在聊天中喊话, 或发现有人正在与他战斗, 请协助他们. 打开他掉落的地上的|cRXP_PICK_Xabraxxis' Demon Bag|r(萨巴克希斯的恶魔之包), 从中拾取|cRXP_LOOT_Talisman of Corruption|r(堕落护符)|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
    .complete 4763,1 --Talisman of Corruption (1)
    .disablecheckbox
    .itemcount 12355,<1 --Talisman of Corruption (<1)
step
    #optional
    #requires Blackwood3
    #completewith Xabraxxis
    .goto Darkshore,52.38,33.39
    .cast 16072 >>|cRXP_WARN_使用|r|T134712:0|t[装满水的净化碗] |cRXP_WARN_在 |cRXP_PICK_篝火|r处召唤|r|cRXP_ENEMY_萨巴克希斯|r
    .timer 17,The Blackwood Corrupted RP
    .use 12347
step
    #requires Blackwood3
    #label Xabraxxis
    .goto Darkshore,52.38,33.39
    >>击杀|cRXP_ENEMY_萨巴克希斯|r. 打开他掉落在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r, 从中拾取|cRXP_LOOT_堕落护符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob Xabraxxis
step << !Hunter
    #xprate <1.5
    #label CompleteFangs
    .goto Darkshore,52.6,33.6
    .xp 18 >>刷到18级
step << Hunter
    #label CompleteFangs
    #season 0
    .goto Darkshore,52.6,33.6
    .xp 18.75 >>升级至18级 + 75%进度
    >>确保你的治疗之泉(HS)冷却时间小于10分钟
    >>如果该区域过于拥挤, 请跳过此步骤
step
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
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r 和|cRXP_ENEMY_月夜猛虎|r . 击败它们后可获得其|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Runt
    .mob Moonstalker
    .isOnQuest 1002
--XX Can do later during Pelts but better if player gets more xp beforehand
step
    #xprate <1.5 --<< !NightElf/Hunter
    #label Buzzbox323End
    #requires SicklyDeers << Druid --xprate <1.5
    .goto 1439,51.288,24.554
    >>点击地面上的|cRXP_PICK_传声盒323号|r
    .turnin 1002 >>交任务: |cRXP_FRIENDLY_传声盒323号|r
    .accept 1003 >>接任务: |cRXP_LOOT_传声盒525号|r
step
	#xprate >1.49 << Hunter/Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 965 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 966 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Balthule Shadowstrike
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
    >>击杀|cRXP_ENEMY_暗滩狂热者|r. 击败他们后搜刮出|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob Dark Strand Fanatic
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
    .xp 18+15000 >>升级至15000/19400经验值
    .mob Dark Strand Fanatic
step
	#xprate >1.49 << Hunter/Druid
    .goto 1439,54.973,24.885
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
    .turnin 966 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 967 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Balthule Shadowstrike
step
    #season 0
    .goto Darkshore,57.13,22.04,55,0
    .goto Darkshore,57.97,20.23,55,0
    .goto Darkshore,58.36,23.61,55,0
    .goto Darkshore,59.42,24.62,55,0
    .goto Darkshore,60.26,21.75
    >>拾取地面上的|cRXP_LOOT_玛塞斯特拉遗物|r
    .complete 951,1 -- Mathystra Relics (6)
step
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .accept 2098 >>接任务: |cRXP_LOOT_基尔卡克的钥匙|r
    .target Gelkak Gyromast
step
    #optional
    #completewith next
    .goto Darkshore,56.10,16.88,0
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r 和|cRXP_ENEMY_硬壳潮行蟹|r , 从它们身上搜刮出|cRXP_LOOT_戈尔卡克钥匙的底部|r
    >>|cRXP_WARN_请注意|cRXP_ENEMY_狂暴暗礁蟹|r'|r|T132152:0|t[横扫]|cRXP_WARN_ability. 它们的近战攻击会立即对你造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob Raging Reef Crawler
    .mob Encrusted Tide Crawler
step
    .goto Darkshore,54.93,12.19
    >>击杀|cRXP_ENEMY_灰雾智者|r 和|cRXP_ENEMY_灰雾潮行者|r. 击败他们后搜刮出|cRXP_LOOT_甘克之钥的中段|r
    >>|cRXP_WARN_注意|cRXP_ENEMY_灰雾智者|r'|r|T136048:0|t[闪电箭] |cRXP_WARN_伤害, 他们也会使用|r|T136052:0|t[治疗波] 进行治疗|r
    >>注意, |cRXP_ENEMY_灰雾潮行者|r 在近战时可以施放 |T136016:0|t[|cRXP_FRIENDLY_中毒|r ], 造成每3秒13点伤害, 持续30秒
    >>|cRXP_WARN_你可以通过视线(LoS)观察沉船周围的|cRXP_ENEMY_灰雾智者|r|r|T136048:0|t[闪电之球]|cRXP_WARN_以避免受到其伤害|r
    .complete 2098,2 -- Middle of Gelkak's Key (1)
    .mob Greymist Tidehunter
    .mob Greymist Oracle
step
    .goto Darkshore,55.59,16.98,45,0
    .goto Darkshore,53.76,18.96,45,0
    .goto Darkshore,51.34,22.00,45,0
    .goto Darkshore,56.63,12.08
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r 和|cRXP_ENEMY_硬壳潮行蟹|r , 从它们身上搜刮出|cRXP_LOOT_戈尔卡克钥匙的底部|r
    >>|cRXP_WARN_请注意|cRXP_ENEMY_狂暴暗礁蟹|r'|r|T132152:0|t[横扫]|cRXP_WARN_ability. 它们的近战攻击会立即对你造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key (1)
    .mob Raging Reef Crawler
    .mob Encrusted Tide Crawler
step
    #sticky
    #label foreststriders
    .goto Darkshore,59.29,13.22,55,0
    .goto Darkshore,61.40,9.40,50,0
    .goto Darkshore,61.51,12.66,50,0
    .goto Darkshore,61.24,15.38,50,0
    .goto Darkshore,61.40,9.40
    >>击杀|cRXP_ENEMY_凶猛的森林陆行鸟|r. 击败它们后可获得|cRXP_LOOT_盖尔卡克钥匙顶端|r
    .complete 2098,1 -- Top of Gelkak's Key (1)
    .mob Giant Foreststrider
step
    #xprate <1.59
    .goto Darkshore,61.40,9.40,45,0
    .goto Darkshore,62.42,7.67
    >>击杀月夜雄虎和月夜雌虎. 从它们身上掠夺兽皮
    >>|cRXP_WARN_注意|cRXP_ENEMY_月夜雌虎|r. 她们总是带着一只|cRXP_ENEMY_月夜猛虎幼崽|r一同进攻|r
    >>|cRXP_ENEMY_月夜雄虎|r可以施放 |T132090:0|t[弱点打击], 如果你背对它们, 将触发一次造成 20-40 点伤害的背刺攻击
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .mob Moonstalker Sire
    .mob Moonstalker Matriarch
    .mob Moonstalker Runt
step << Warrior/Paladin/Rogue
    #season 0
    #requires foreststriders
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    >>|cRXP_WARN_开始寻找《Gyromast的复仇》团队/|r|cRXP_ENEMY_机械打手4100型|r << Warrior/Paladin/Rogue
    .turnin 2098 >>交任务: |cRXP_FRIENDLY_基尔卡克的钥匙|r
    .accept 2078 >>接任务: |cRXP_LOOT_基尔卡克的报复|r
    .target Gelkak Gyromast
    .solo
step
    #requires foreststriders
    .group 2 << Warrior/Paladin/Rogue
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    >>|cRXP_WARN_开始寻找《Gyromast的复仇》团队/|r|cRXP_ENEMY_机械打手4100型|r << Warrior/Paladin/Rogue
    .turnin 2098 >>交任务: |cRXP_FRIENDLY_基尔卡克的钥匙|r
    .accept 2078 >>接任务: |cRXP_LOOT_基尔卡克的报复|r
    .target Gelkak Gyromast
step
    #optional
    #completewith next
    .goto 1439,55.802,18.290
    .gossipoption 95406 >>与|cRXP_FRIENDLY_机械打手4100型|r交谈以开启护送任务
--  .gossipoption 87696 >>与|cRXP_FRIENDLY_机械打手4100型|r交谈以开启护送任务
    >>|cRXP_WARN_这个任务非常困难|r
    .target The Threshwackonator 4100
    .isOnQuest 2078 << Warrior/Paladin/Rogue
step
    #label Turtle4727
    .goto 1439,53.113,18.099
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4727 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    .goto 1439,56.654,13.484
    #optional
    >>护送|cRXP_FRIENDLY_机械打手4100型|r至|cRXP_FRIENDLY_基尔卡克·旋杆|r
    >>一旦机械打手4100型变成敌对状态, 将其击杀
    >>|cRXP_WARN_这个任务非常困难|r
    *Only use ranged attacks while running from it, avoid being at melee range << Druid
    >>|cRXP_WARN_如果可以的话, 尽量完成这个任务, 因为它能为你节省后续时间——奖励|r|T134797:0|t[水下呼吸药剂]|cRXP_WARN_用于之后的水下任务|r << !Druid !Warlock
    >>|cRXP_WARN_使用|r|T136100:0|t[缠绕根须]|cRXP_WARN_在他转为敌对时施放, 然后拉开距离, 用瞬发法术风筝他|r << Druid
    >>|cRXP_WARN_如果你无法击杀|r机械打手4100型|r, 请跳过此步骤|r
    .complete 2078,1 --Gyromast's Revenge (1)
    .link https://youtu.be/1WRRmKYBr9s >>|cRXP_WARN_点击此处查看视频攻略|r
    .mob The Threshwackonator 4100
    .isOnQuest 2078 << Warrior/Paladin/Rogue
--XX DRUID: Test if you can root
step
    #optional << Warrior/Paladin/Rogue
    .goto 1439,56.654,13.484
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .turnin 2078 >>交任务: |cRXP_FRIENDLY_基尔卡克的报复|r
    .target Gelkak Gyromast
    .isQuestComplete 2078
step
    #optional
    #completewith BeachedCloak
    .abandon 2078 >>放弃基尔卡克的报复
step << Druid
    #xprate <1.5
    #optional
    #completewith DeerComplete
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r, 掠夺其|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
step
    #sticky
    #label DeleteGyromast
    #optional
    .destroy 7442 >>摧毁: |cRXP_ENEMY_基尔卡克的钥匙|r, 它在你的背包中. 不再需要它了
step << !NightElf !Dwarf Hunter !Druid
    #completewith BeachedCloak
    #map Darkshore
    .goto Felwood,18.50,19.87,100 >>前往奥伯丁
    .cooldown item,6948,<0
step << !NightElf !Dwarf Hunter !Druid
    #xprate <1.59
    #optional
    #completewith next
    .hs >>传送至奥伯丁
    .cooldown item,6948,>0,1
step << Druid
    #label Turtle4727
    .goto 1439,53.113,18.099
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4727 >>接任务: |cRXP_LOOT_搁浅的海龟|r
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
    >>|cRXP_WARN_使用|r|T132801:0|t[动物医疗药膏], |cRXP_WARN_目标: |r|cRXP_ENEMY_生病的鹿|r
    .complete 6124,1 -- Sickly Deer cured (10)
    .mob Sickly Deer
    .use 15826
step << Druid
    .goto Darkshore,48.87,11.32
    >>|cRXP_WARN_游到水中|r
    >>打开|cRXP_PICK_奇怪的保险箱|r, 从中获取|cRXP_LOOT_水兽敏捷坠饰|r
    .collect 15883,1,272,1 --Collect Half Pendant of Aquatic Agility (x1)


----Start of Darkshore 2x 20 Turnins & Druid Training----


step << Druid
    #xprate >1.59
    #optional
	#completewith next
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
    .xp <20,1
step << Druid
    #xprate >1.59
    #optional
    .goto Moonglade,52.53,40.57
	>>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >>训练你的职业法术
    .target Loganaar
    .xp <20,1
step << Druid
    #xprate >1.59
    #optional
    #completewith next
    .hs >>传送至奥伯丁
    .zoneskip Darkshore
    .subzoneskip 442
    .xp <20,1
step
    #xprate >1.59
    #label BlackwoodSod
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4763 >>交任务: |cRXP_FRIENDLY_黑木熊怪的堕落|r
    .target Thundris Windweaver
step
    #xprate >1.59
    #optional
    #completewith BeachedCloak
    .destroy 12342 >>摧毁: |cRXP_ENEMY_黑木谷物|r
step
    #xprate >1.59
    #optional
    #completewith BeachedCloak
    .destroy 12343 >>摧毁: |cRXP_ENEMY_黑木坚果|r, 它在你的背包中. 不再需要它了
step
    #xprate >1.59
    #optional
    #completewith BeachedCloak
    .destroy 12341 >>摧毁: |cRXP_ENEMY_黑木水果|r, 它在你的背包中. 不再需要它了
step
    #season 1
    #xprate >1.59
    #optional
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135237:0|t[燧石和火绒]|cRXP_BUY_和|r|T135435:0|t[普通木柴]|r
    >>|cRXP_WARN_这是为了提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_, 很快就会在船上|r
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .itemcount 6889,1 -- Small Egg (1+)
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .target Dalmond
step
    #season 1
    #xprate >1.59
    #optional
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor 6301 >>|cRXP_BUY_从他那里购买|r|T134059:0|t[甜香料]|cRXP_BUY_, 直到你拥有的|r|T134059:0:0|t[甜香料]|cRXP_BUY_数量等于或超过你当前持有的|r|T132832:0|t[小蛋]|cRXP_BUY_数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target Gorbold Steelhand
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)
step
    #xprate >1.59
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139 >>交任务: |cRXP_FRIENDLY_萨纳瑞恩的希望|r
    .target Tharnariun Treetender
step
    #xprate >1.59
    #optional
    #label PeltEnd
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 986 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
    .target Terenthis
    .isQuestTurnedIn 986
step
    #xprate >1.59
    #optional
    #completewith BeachedCloak
    >>|cRXP_WARN_如果你装备了|r|T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_, 请确保保留当前的披风以备后用, 因为|r|T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_在后续任务中会永久丢失|r
    .equip 15,5387 >>|cRXP_WARN_装备|r|T133762:0|t[附有魔法的月虎披风] |cRXP_WARN_如果它比你当前的披风更好|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7
step
    #xprate >1.59
    #requires DeleteGyromast
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务: |cRXP_FRIENDLY_海中的水果|r
    .target Gubber Blump
    .isQuestComplete 1138
step
    #xprate >1.59
    #label BeachedCloak
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4727 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .target Gwennyth Bly'Leggonde

----End of Darkshore 2x 20 Turnins & Druid Training----
----Start of 2x Non-Deadmines Training/Class q section----



step << Warrior/Paladin/Mage/Warlock/Rogue
    #xprate >1.59
    #label TravelMenethilNoDMBoat
    #completewith MenethilNoDMBoat
    .goto Darkshore,32.44,43.71,15 >>前往米奈希尔港码头乘船
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
    >>|cRXP_WARN_如果船刚抵达, 则在船上；如果船刚离开, 则在码头上:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r|T132832:0|t|cRXP_LOOT_[小蛋]|r|cRXP_WARN_和|r|T134059:0|t[甜香料]|cRXP_WARN_制成|r|T132834:0|t[草药烘蛋]
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
    >>|cRXP_WARN_在等待前往米奈希尔港的船只时, 如需升级, 请将你的|r|T135966:0|t[急救]|cRXP_WARN_技能提升|r << Warrior/Paladin/Rogue
    >>|cRXP_WARN_如果你的背包里有一把非常不错的武器, 可以立即装备, 请跳过此步骤|r
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
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
    >>|cRXP_WARN_在等待前往米奈希尔港的船只时, 如需升级, 请将你的|r|T135966:0|t[急救]|cRXP_WARN_技能提升|r << Warrior/Paladin/Rogue
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在米奈希尔港与|cRXP_FRIENDLY_布拉克·唐纳德|r交谈
    .vendor 1441 >>|cRXP_BUY_购买一把|r|T135329:0|t[刽子手之剑]|cRXP_BUY_(如果物品在售且你买得起)|r
    >>|cRXP_WARN_如果没有, 别担心, 稍后你会去拍卖场|r
    .collect 4818,1,2040,1 --Collect Executioner's Sword (1)
    .disablecheckbox
    .target Brak Durnad
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_inside|cRXP_FRIENDLY_布拉克·唐纳德|r交谈
    >>|cRXP_BUY_购买一把|r|T135329:0|t[刽子手之剑]|cRXP_BUY_(如果物品在售且你买得起)|r
    >>|cRXP_BUY_如果没有的话, 如果你能负担得起, 从他那里买一个|r|T135280:0|t[微光重剑]|r
    .collect 4818,1,2040,1 --Collect Executioner's Sword (1)
    .disablecheckbox
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target Brak Durnad
    .zoneskip Darkshore
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8 --Intentionally lower than Falx so people don't buy the Falx if they have Executioners
    .itemcount 922,<1 --Dacian Falx (<1)
    .itemcount 4818,<1 --Executioner's Sword (<1)
    .dungeon !DM
step << !NightElf Warrior/Paladin
    #xprate >1.59
    #optional
    +|cRXP_WARN_装备|r|T135329:0|t[刽子手之剑]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_谢尔雷·布隆迪尔|r交谈
    .fly Ironforge >>飞往铁炉堡
    .target Shellei Brondir
    .zoneskip Darkshore << Warrior/Paladin
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_谢尔雷·布隆迪尔|r交谈
    .fp Menethil Harbor >>获取米奈希尔港的飞行路径
    .target Shellei Brondir
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto Wetlands,5.485,64.156,40 >>从码头末端跳下, 游向下一个目标点
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    .goto Wetlands,2.433,78.689,-1
    .goto Ironforge,17.089,83.373,-1
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r，使用角色解困自助服务功能传送到铁炉堡。您必须在该位置注销并登录另一个角色并呼出帮助菜单，然后向下滚动到自助​​服务。如果您无法解困，请跳过此步骤。
    .link https://www.youtube.com/watch?v=oVoxsr4zcg4 >>点击此处查看视频参考
    .link https://us.battle.net/support/en/help/product/wow/197/834/solution >>点击此处获取解困链接
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
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
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
    .goto Westfall,56.55,52.64,100 >>沿着海岸跑, 前往哨兵岭
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fp Sentinel Hill >>获取哨兵岭的飞行点
    .target Thor
    .zoneskip Ironforge --Skips if you didn't swim from Wetlands
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
    .zoneskip Westfall,1
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Elwynn Forest,36.809,72.429,100,0
    .goto StormwindClassic,69.961,86.583
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59 << !Hunter
    #label WepTrainNoDM
    #optional << NightElf
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .train 201 >>学习1小时剑术 << Rogue
    .train 202 >>学习两小时剑术 << Warrior
    .target Woo Ping
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布里维夫·石拳|r交谈, 他在里面
    .train 197 >>训练双刃斧
    .train 199 >>学习2小时锤类武器技能
    .target Buliwyf Stonehand
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_楼下的布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r |T135425:0|t[锐利投掷匕首] |r
    .collect 3107,1 --Collect Keen Throwing Knife (200)
    .target Brenwyn Wintersteel
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_楼下的布雷文·寒钢|r交谈
    >>|cRXP_BUY_购买|r|T135280:0|t[微光重剑]|cRXP_BUY_从她那里, 或前往拍卖行看看是否有更优或更便宜的选项|r
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target Brenwyn Wintersteel
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
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
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
    .goto Ironforge,65.905,88.405,12 >>前往|cRXP_FRIENDLY_比尔班·飞钳|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比尔班·飞钳|r交谈
    .trainer >>训练你的职业法术
    .target Bilban Tosslespanner
    .zoneskip Darkshore
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .train 202,3 << NightElf Warrior --2h swords trained
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fp Ironforge >>获取铁炉堡的飞行点
    .target Gryth Thurden
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step <<Paladin/Mage/Warlock/Rogue
    #xprate >1.59
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_Book: 《深渊之神》|r] 开始任务|r
    .accept 968 >>接任务: |cRXP_LOOT_深渊之神|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛利·硬骨|r交谈, 他在里面
    .turnin 968 >>交任务: |cRXP_FRIENDLY_深渊之神|r
    .target Gerrig Bonegrip
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
    .goto Ironforge,31.32,27.80,12 >>前往吉恩所在之地
    .dungeon !DM
step << Mage
    #xprate >1.59
    .goto Ironforge,31.32,27.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩|r对话, 他在里面
    >>|cRXP_BUY_从她那里购买最多 4|r|T134419:0|t[传送符文]|r
    .collect 17031,4 --Rune of Teleportation (4)
    .target Ginny Longberry
    .dungeon !DM
step << Mage
    #xprate >1.59
    #label MilstaffNoDM
    .goto Ironforge,25.50,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔斯塔弗·风暴之眼|r交谈
    .train 3562 >>坐火车 |T135763:0|t[传送:铁炉堡]
    .target Milstaff Stormeye
    .dungeon !DM
step << Mage
    #xprate >1.59
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >>训练你的职业法术
    .target Dink
    .dungeon !DM
step << Paladin
    #xprate >1.59
    .goto Ironforge,23.131,6.143
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈
    .trainer >>训练你的职业法术
    .target Brandur Ironhammer
    .zoneskip Darkshore
    .dungeon !DM
step << skip --logout skip Mage
    #xprate >1.59
    #optional
    #completewith DeeprunNoDM
    .goto 1455,27.611,8.074
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_Jump on top of the pillar above |cRXP_FRIENDLY_Bink|r, then walk slightly east of her onto the arrow position. Position your character until it looks like they're floating, then perform a Logout Skip by logging out and back in|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon !DM
step << Warlock/Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1455,53.164,7.037,10 >>进入|cRXP_FRIENDLY_寻尸者祖贝尔|r的房子
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
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶, 然后跳到书架顶. 通过退出再重新登录来完成登出跳过(Logout Skip)|r
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
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到狮鹫的头部上方, 通过登出再重新登录来跳过登出界面|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考格斯宾|r交谈
    .vendor 5175 >>|cRXP_BUY_从他那里购买 a|r|T133024:0|t[青铜管]|cRXP_BUY_(如果可用)|r
--    >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .target Gearcutter Cogspinner
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
    >>|cRXP_WARN_你需要你的|r|T135966:0|t[急救]|cRXP_WARN_达到80级或以上, 才能接取后续任务|r << Rogue !Dwarf
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .zoneskip Darkshore << Warrior
    .zoneskip Elwynn Forest
    .zoneskip Westfall
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Mage/Warlock/Rogue
    #xprate >1.59
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利巴布·旋轮|r交谈
    .vendor 5519 >>|cRXP_BUY_从他那里购买 a|r|T133024:0|t[青铜管]|cRXP_BUY_(如果可用)|r
--    >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .target Billibub Cogspinner
    .zoneskip Darkshore << Warrior/Paladin
    .bronzetube
    .train 201,1 << NightElf Rogue --单手剑 not trained
    .train 202,1 << Warrior --2h swords not trained
    .dungeon !DM
step << Mage/Warlock/Rogue
    #xprate >1.59
    .goto StormwindClassic,58.08,16.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
    .target Furen Longbeard
    .isOnQuest 1338
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >>前往指挥中心内的|cRXP_FRIENDLY_武神|r
    .zoneskip Darkshore
    .zoneskip Ironforge
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_武神|r交谈
    .trainer >>训练你的职业法术
    .target Wu Shen
    .zoneskip Darkshore
    .zoneskip Ironforge
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith RogueTrainNoDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_训练|r|T132282:0|t[伏击]|cRXP_WARN_如果你有多余的钱, 并且|r|T135641:0|t[匕首]|cRXP_WARN_已装备或存于背包中, 这将为你节省后续时间|r
    .train 8676 >>训练 |T132282:0|t[伏击]
    .target Osborne the Night Man
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_确保你训练|r|T132320:0|t[潜行]|cRXP_WARN_和|r|T133644:0|t[扒窃]|cRXP_WARN_和|r|T136058:0|t[开锁]|cRXP_WARN_, 因为稍后你会需要用到它们|r
    .train 1784 >>训练 |T132320:0|t[潜行]
    .train 921 >>训练 |T133644:0|t[扒窃]
    .train 1804 >>训练 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon !DM
    .train 1784,1
    .train 921,1
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_确保你训练|r|T133644:0|t[扒窃]|cRXP_WARN_和|r|T136058:0|t[撬锁]|cRXP_WARN_, 因为你稍后会需要它们|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必小心管理你的金钱. 只购买必要的法术. 你很快将需要钱来学习隐身术(Vanish), 以及75银币, 以便返回湿地后获得符文|r
    .train 921 >>训练 |T133644:0|t[扒窃]
    .train 1804 >>训练 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon !DM
    .train 921,1
step << Rogue
    #xprate >1.59
    #label RogueTrainNoDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_确保你训练|r|T136058:0|t[撬锁]|cRXP_WARN_, 因为你稍后会需要它|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必小心管理你的金钱. 只购买必要的法术. 你很快将需要钱来学习隐身术(Vanish), 以及75银币, 以便返回湿地后获得符文|r
    .train 1804 >>训练 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.799,53.815,15,0
    .goto 1453,77.290,58.138,12,0
    .goto 1453,78.466,60.034,12,0
    .goto 1453,78.560,58.435,6,0
    .goto 1453,75.754,60.369,12 >>前往SI:7楼上找|cRXP_FRIENDLY_“剃刀”雷吉克和马迪亚斯·肖尔|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“剃刀”雷吉克|r和|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .accept 2281 >>接任务: |cRXP_LOOT_赤脊山的联络员|r
    .goto StormwindClassic,75.76,60.35
    .target +Renzik "The Shiv"
    .accept 2360 >>接任务: |cRXP_LOOT_马迪亚斯和迪菲亚潜行者|r
    .goto StormwindClassic,75.78,59.84
    .target +Master Mathias Shaw
    .dungeon !DM
step << NightElf Rogue/Mage/Warlock
    #xprate >1.59 << !Hunter
    #season 1 << Rogue sod
    #label WepTrainNoDM
    #optional << NightElf
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .train 201 >>学习1小时剑术 << Mage/Rogue/Warlock
    .train 1180 >>学习匕首技能 << Mage
    .train 202 >>学习两小时剑术 << Warrior
    .target Woo Ping
    .dungeon !DM
step << NightElf Warrior
    #xprate >1.59
    #season 1 --Not loading for now
    #optional
    #completewith NoDMStockadeEnd
    +|cRXP_WARN_装备|r|T135329:0|t[刽子手之剑]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r对话, 她在里面
    >>|cRXP_BUY_购买|r|T135280:0|t[微光重剑]|cRXP_BUY_从她那里, 或前往拍卖行看看是否有更优或更便宜的选项|r
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target Marda Weller
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r对话, 她在里面
    >>|cRXP_BUY_购买|r|T135342:0|t[波刃短剑]|cRXP_BUY_从她那里, 或前往拍卖行寻找更优/更便宜的选项|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必小心管理你的金钱. 如果你没钱, 就只买一把匕首. 你很快会需要花钱购买隐身药水, 以及返回湿地后用75银币获取符文|r
    .collect 2209,2 --Kris (2)
    .target Marda Weller
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_如果你负担得起, 可以向她购买一个|r|T135342:0|t[波刃短剑]|r
    >>|cRXP_WARN_在接下来的步骤中, 请务必小心管理你的金钱. 如果你没钱, 就只买一把匕首. 你很快会需要花钱购买隐身药水, 以及返回湿地后用75银币获取符文|r
    .collect 2209,1 --Kris (2)
    .target Marda Weller
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith NoDMStockadeEnd
    +|cRXP_WARN_装备|r|T135342:0|t[波刃短剑]
    .use 2209
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.93
    .xp <21,1
    .dungeon !DM



----Start of 2x Non-Deadmines Rogue Class q section----



step << Rogue
    #xprate >1.59
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>稍后为你的 |T132290:0|t[毒药] 任务购买 |T134437:0|t[抗毒药剂], 其余物品则用于在赤脊山更快地交任务 << !Dwarf
    >>请尽快在赤脊山购买以下物品, 以便更快地提交任务 << Dwarf
    >>这将节省你的时间, 因为你无需到处寻找怪物击杀. 如果你想不购买任何物品, 请跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf --Anti-Venom (1)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target Auctioneer Jaxon
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #completewith GryanAll << Human
    #optional << Human
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fp Stormwind >>获取暴风城飞行点 << !Human
    .fly Westfall >>飞往西部荒野 << Human
    .target Dungar Longdrink
    .zoneskip Westfall << Human
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label GryanAll << Human
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fp Sentinel Hill >>获取哨兵岭的飞行点 << !Human
    .fly Redridge >>飞往赤脊山脉 << Human
    .target Thor
    .dungeon !DM
step << Human Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Redridge >>飞往赤脊山脉
    .target Dungar Longdrink
    .zoneskip Stormwind City,1
    .isOnQuest 65
    .dungeon !DM
step << !Human Rogue
    #xprate >1.59
    .goto Elwynn Forest,65.20,69.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔楼顶端的|cRXP_FRIENDLY_塞欧克瑞图斯|r交谈
    .accept 94 >>接任务: |cRXP_LOOT_法师的眼线|r
    .target Theocritus
    .dungeon !DM
    .xp <20,1
step << !Human Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .dungeon !DM
step << Rogue
    #xprate >1.59 << !Hunter
    #optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_内|cRXP_FRIENDLY_厨师布雷纳|r交谈
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target Chef Breanna
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label WileyStart
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_黑衣威利|r交谈
    .turnin 65 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 132 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
	.target Wiley the Black
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label Rendevous
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢修斯|r交谈
    .turnin 2281 >>交任务: |cRXP_FRIENDLY_赤脊山的联络员|r
    .accept 2282 >>接任务: |cRXP_LOOT_奥瑟尔伐木场|r
    .target Lucius
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,32.2,48.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .accept 89 >>接任务: |cRXP_LOOT_止水湖上的桥|r
    .target Foreman Oslow
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
    >>你可以在前往阿尔瑟磨坊的途中击杀一些豺狼人, 此目标将在返程时完成
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .isOnQuest 89
    .dungeon !DM
    .mob Redridge Brute
    .mob Redridge Mystic
    .mob Redridge Basher
step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116,100 >>前往奥瑟尔伐木场
step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_你必须为你的|r|T132290:0|t[毒药]|cRXP_WARN_quest 稍后完成此任务|r
    >>|cRXP_WARN_站在标记的路点位置, 调整相机和鼠标视角, 直到可以一次性点击3个|cRXP_PICK_Practice Lockboxes|r而无需移动任何位置|r
    .skill lockpicking,80 >>|cRXP_WARN_在奥瑟尔伐木场地面上打开|r|cRXP_PICK_Practice 锁匠练习箱|r, 直到你的|r|T136058:0|t[开锁]技能达到80|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
	.goto Redridge Mountains,52.05,44.69
    >>打开|cRXP_PICK_卢修斯的箱子|r. 从中获取|cRXP_LOOT_偷窃技能证明物|r
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
    >>完成击杀|cRXP_WARN_gnolls|r以获取桥部件
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .isOnQuest 89
    .dungeon !DM
    .mob Redridge Brute
    .mob Redridge Mystic
    .mob Redridge Basher
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,32.2,48.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .turnin 89 >>交任务: |cRXP_FRIENDLY_止水湖上的桥|r
    .isQuestComplete 89
    .target Foreman Oslow
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢修斯|r交谈
    .turnin 2282 >>交任务: |cRXP_FRIENDLY_奥瑟尔伐木场|r
    .target Lucius
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith DefiasWestfall2
    .destroy 7907 >>摧毁: |cRXP_ENEMY_偷窃技能认证书|r, 它在你的背包中. 不再需要它了
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .xp 21+14325 >>在离开红ridge之前, 请确保你至少已获得14k经验值并达到21级. 如果还未达到此标准, 建议完成由|cRXP_FRIENDLY_肖恩|r提供的|cRXP_ENEMY_希拉里的项链|r任务, 或由|cRXP_FRIENDLY_工头奥斯洛|r提供的|cRXP_ENEMY_丢失的工具|r任务
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点 << !Human
    .fly Westfall >>飞往西部荒野
    .target Ariena Stormfeather
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label DefiasWestfall2
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 132 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 135 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith KlavenFinish
    +|cRXP_WARN_装备|r|T135324:0|t[长剑]
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
    >>击杀|cRXP_ENEMY_小型结网毒蜘蛛|r和|cRXP_ENEMY_结网毒蜘蛛|r. 击败它们可获得|cRXP_LOOT_小毒囊|r和它们的|cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_你需要一个|cRXP_LOOT_小毒囊|r来制作|T134437:0 |t[抗毒药剂], 稍后用于移除|T136230:0 |t[赞吉尔之触]的负面效果|r
    >>|cRXP_WARN_稍后保存粘糊的蜘蛛腿|r|r
    >>|cRXP_WARN_如果你有一个|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_的朋友, 可以跳过此步骤, 稍后再请他们帮你移除|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob Pygmy Venom Web Spider
    .mob Venom Web Spider
    .itemcount 6452,<1 --Anti Venom (<1)
    .isQuestAvailable 2359
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请注意即将出现的章节==|r
    >>|cRXP_WARN_按 Esc 键, 然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用互动键”, 并将“与目标互动”选项绑定到一个按键|r
    >>|cRXP_WARN_此外, 建议你启用敌人姓名板(默认键:V), 这样可以让你看到塔内某些角落后方的敌人|r
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密探吉尔妮|r交谈
    >>|cRXP_WARN_你必须完成这个任务|r|T132290:0|t[毒药]
    .turnin 2360 >>交任务: |cRXP_FRIENDLY_马迪亚斯和迪菲亚潜行者|r
    .accept 2359 >>接任务: |cRXP_LOOT_克拉文之塔|r
    .target Agent Kearnen
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
    >>|T133644:0|t[劫掠]|cRXP_ENEMY_丑陋的迪菲亚懒汉|r. 将其击杀后获取|cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_WARN_|cRXP_ENEMY_丑陋的迪菲亚懒汉|r会在塔楼入口处生成, 然后在塔楼外围巡逻|r
    >>|cRXP_WARN_注意, 他会造成大量伤害. 如果你的|r|T132320:0|t[潜行]|cRXP_WARN_效果中断, 请迅速使用|r|T132307:0|t[冲刺]|cRXP_WARN_并逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频攻略
    .mob Malformed Defias Drone
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith Mortwake
    +|cRXP_WARN_如果你尚未装备|r|T135641:0|t[曲木匕首]|cRXP_WARN_, 请为完成此任务装备|r|T135641:0|t[匕首]|r
    .use 15396
    .itemcount 15396,1
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼的第二层顶层. 在处于|r|T132320:0|t[潜行]|cRXP_WARN_且|cRXP_ENEMY_Defias 塔哨兵|r不在你身边时, 跳上椅子, 再跳到灯上, 最后跳到路径点位置上方的书架上|r
    >>|cRXP_WARN_手动|r|T132320:0|t[解除隐身]|cRXP_WARN_, 然后按下你的“与目标互动”键绑定以开启|r|cRXP_PICK_暮色森林的箱子|r. 拾取其中的|r|cRXP_LOOT_克莱文·莫特韦克的日志|r|r
    >>|cRXP_WARN_注意:你的|r|T132320:0|t[潜行]|cRXP_WARN_在拾取物品后将暂时失效|r|cRXP_LOOT_克拉文·莫特韦克的日记|r
    >>|cRXP_WARN_如果你未能击杀二楼的|cRXP_ENEMY_Defias Tower Sentries|r, 要做好逃跑的准备. 当你站在书架顶部时(这是一个躲避点), 它们很可能会永久性地对你产生仇恨(但不会攻击你)|r
    >>|cRXP_WARN_如果你的背包里或装备中有|r|T135641:0|t[匕首]|cRXP_WARN_, 你可以对位于塔内的|cRXP_ENEMY_迪菲亚巡塔员|r和|cRXP_ENEMY_迪菲亚哨兵|r施放|r|T132282:0|t[伏击]|cRXP_WARN_, 立即击杀他们. 击杀第一个|cRXP_ENEMY_迪菲亚哨兵|r后, 请立刻准备逃跑, 并记住你可能会受到来自上方的攻击. 这种方法虽然较慢, 但安全得多|r
    >>|cRXP_WARN_请注意, 如果你必须从塔楼中跑出来, |cRXP_ENEMY_丑陋的迪菲亚懒汉|r 和 |cRXP_ENEMY_迪菲亚苦工|r 可能会出现在塔楼入口处|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频攻略
    .mob Defias Tower Patroller
    .mob Defias Tower Sentry
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >>制作 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 的负面效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon !DM
step << Dwarf Rogue
    #xprate >1.59
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石肤术] 以移除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .aura -9991
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith KlavenFinish
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >>前往|cRXP_FRIENDLY_珊娜·弗勒|r
    .aura -9991
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果你有|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_好友, 请他们帮你移除|r|T136230:0|t[赞吉尔之触]|r
    .skill firstaid,80 >>|cRXP_WARN_将你的|r|T135966:0|t[急救]|cRXP_WARN_提升至80级|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果你有|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_好友, 请他们帮你移除|r|T136230:0|t[赞吉尔之触]|r
    .train 7934 >>|cRXP_WARN_Train|r|T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >>制作 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon !DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 的负面效果|r
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
    .goto StormwindClassic,78.67,60.13,10 >>进入瑞兹尔·铜栓总部, 沿楼梯向上前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r
    .dungeon !DM
step << Rogue
    #xprate >1.59 << !Hunter
    #label KlavenFinish
    .goto Stormwind City,75.78,59.84
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    >>|cRXP_WARN_记得在切换到|r|T135641:0|t[匕首]|cRXP_WARN_earlier后, 重新装备你的主武器|r << Rogue !sod
    .turnin 135 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
--  .accept 141 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .turnin 2359 >>交任务: |cRXP_FRIENDLY_克拉文之塔|r
    .target Master Mathias Shaw
    .dungeon !DM
step << Rogue
    #xprate >1.59
    .goto Stormwind City,78.2,58.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与一楼建筑内的|cRXP_FRIENDLY_贾斯伯·菲尔|r交谈
    >>从他那里购买制作【速效药膏】和【消失术】所需的材料
    .collect 3371,20 --Empty Vial (20)
    .collect 2928,20 -Dust of Decay (20)
    .collect 5140,20 --Flash Powder (20)
    .target Jasper Fel
step << Rogue
    #xprate >1.59
    >>打开你的法术书, 在通用选项卡中找到 |T136242:0|t[|cRXP_FRIENDLY_Poisons|r] 技能. 打开该技能并制作 20 个瞬间毒药. |cRXP_WARN_记得在战斗中将它们施加到两把武器上|r
    .collect 6947,20 --Instant Poison (20)
step << Rogue
    #xprate >1.59
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_在接下来的步骤中, 请务必谨慎管理你的金钱. 只购买必要的法术. 完成湿地中的几个任务后, 你将需要75银币来获得一枚符文|r
    >>|cRXP_WARN_Train|r|T132331:0|t[消失] 和 |T132320:0|t[潜行](等级2)你很快将需要它们来解锁 |T236270:0|t[致命酿造]
    .train 1856 >>训练 |T132331:0|t[潜行]
    .train 1785 >>训练 |T132320:0|t[潜行](等级 2)
    .target Osborne the Night Man
    .dungeon !DM


----End of 2x Non-Deadmines Rogue Class q section----


step << Warlock
    #xprate >1.59
    #ah
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r对话, 他在里面
    .vendor 1312 >>|cRXP_BUY_如果你买得起, 就从她那里买一把|r|T135469:0|t[暮色魔杖]|r
    >>|cRXP_BUY_或者, 如果价格低于52银47铜, 可从拍卖行购买|r|T135144:0|t[强效魔法杖]|r
    .collect 5211,1 --Dusk Wand (1)
    .disablecheckbox
    .target Ardwyn Cailen
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #ssf
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r对话, 他在里面
    >>|cRXP_BUY_从她那里购买|r|T135469:0|t[暮色魔杖]|r
    .collect 5211,1 --Dusk Wand (1)
    .target Ardwyn Cailen
    .money <0.5247
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith NoDMStockadeEnd
    +|cRXP_WARN_装备|r|T135469:0|t[暮色魔杖]
    .use 5211
    .itemcount 5211,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith NoDMStockadeEnd
    +|cRXP_WARN_装备|r|T135144:0|t[强效魔法杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>进入屠羊酒馆. 下楼
    .dungeon !DM
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2NoDM
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯巴克尔|r交谈
    .vendor >>|cRXP_BUY_从她那里购买|r|T133738:0|t[魔典：折磨(等级 2)]|r
    .target Spackle Thornberry
    .itemcount 16346,<1 --Grimoire of Torment (<1)
    .train 20317,1
    .dungeon !DM
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .accept 1716 >>接任务: |cRXP_LOOT_噬魂者|r
    .target Gakin the Darkbinder
    .dungeon !DM
step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2NoDMEnd
    #requires Torment2NoDM
    .train 20317 >>|cRXP_WARN_使用|r|T133738:0|t[魔典：折磨(等级 2)]
    .target Spackle Thornberry
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
    >>登上法师塔, 通过绿色传送门
    .goto Stormwind City,39.681,79.538,15 >>前往|cRXP_FRIENDLY_拉瑞麦尼·普尔度|r
    .dungeon !DM
step << Mage
    #xprate >1.59
    .goto Stormwind City,39.681,79.538
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拉瑞麦尼·普尔度交谈|cRXP_FRIENDLY_Larimaine Purdue|r
    .train 3561 >>坐火车 |T135763:0|t[传送:暴风城]
    .target Larimaine Purdue
    .dungeon !DM
step << Mage/Warlock/Rogue
    #xprate >1.59
    #season 1 >>Rogue
    #requires Torment2NoDMEnd << Warlock
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿古斯·夜语|r交谈
    .accept 3765 >>接任务: |cRXP_LOOT_遥远的旅途|r
    .zoneskip Ironforge << Warrior
    .zoneskip Darkshore << Warrior
    .target Argos Nightwhisper
    .dungeon !DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .hs >>炉石前往米奈希尔港. |cRXP_WARN_贫民窟炉石, 如果当前处于冷却状态, 请改用监狱炉石|r
step << Rogue
    #xprate >1.59
    .goto StormwindClassic,39.834,54.360
    >>|cRXP_WARN_进入暴风城监狱区域|r
    >>|cRXP_WARN_进入后:|r
    .link /run InviteUnit("aa");C_Timer.After(1,function() LeaveParty() end) >>|cRXP_WARN_点击此处将此宏复制并粘贴到聊天框中, 即可快捷传送到奥伯丁|r
    .zone Darkshore >>|cRXP_WARN_前往: |cRXP_PICK_黑海岸|r|r
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
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考格斯宾|r交谈
    .vendor 5175 >>|cRXP_BUY_从他那里购买 a|r|T133024:0|t[青铜管]|cRXP_BUY_(如果可用)|r
--    >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .target Gearcutter Cogspinner
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布里维夫·石拳|r交谈, 他在里面
    .train 197 >>训练双刃斧
    .train 199 >>学习2小时锤类武器技能
    .target Buliwyf Stonehand
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_楼下的布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135427:0|t[重型投掷刀]|r
    .collect 3108,200 --Collect Heavy Throwing Knife (200)
    .target Brenwyn Wintersteel
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
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
    +|cRXP_WARN_装备|r|T135427:0|t[重型投掷匕首]
    .use 3108
    .itemcount 3108,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #label NEWarRogNoDMIFPP
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fp Ironforge >>获取铁炉堡的飞行点
    .target Gryth Thurden
    .zoneskip Darkshore
    .zoneskip Teldrassil
    .zoneskip Darnassus
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_Book: 《深渊之神》|r] 开始任务|r
    .accept 968 >>接任务: |cRXP_LOOT_深渊之神|r
    .use 5352
    .itemcount 5352,1
    .zoneskip Ironforge,1
    .zoneskip Wetlands
    .dungeon !DM
step << NightElf Rogue
    #xprate >1.59
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛利·硬骨|r交谈, 他在里面
    .turnin 968 >>交任务: |cRXP_FRIENDLY_深渊之神|r
    .target Gerrig Bonegrip
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
    >>|cRXP_WARN_进入暴风城监狱区域|r
    >>|cRXP_WARN_进入后:|r
    .link /run InviteUnit("aa");C_Timer.After(1,function() LeaveParty() end) >>|cRXP_WARN_点击此处将此宏复制并粘贴到聊天框中, 即可快捷传送到奥伯丁|r
    .zone Darkshore >>|cRXP_WARN_前往: |cRXP_PICK_黑海岸|r|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fly Menethil >>飞往湿地
    .zoneskip Ironforge,1
    .cooldown item,6948,<0
    .dungeon !DM
step << Warrior/NightElf Rogue
    #xprate >1.59
    #optional
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
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
    .goto Wetlands,4.61,57.26,15 >>前往奥伯丁码头的船只
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
    >>|cRXP_WARN_如果需要, 请在等待前往奥伯丁的船只时提升你的|r|T135966:0|t[急救]|cRXP_WARN_技能|r << Warrior/Paladin/Rogue
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
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
    .hs >>传送至奥伯丁
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
    .deathskip >>刷怪直到你的治疗之泉(HS)冷却时间小于6分钟. 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step << Dwarf Hunter
    #xprate <1.59
    #hardcore
    #optional
    #completewith next
    +刷怪直到你的治疗之泉(HS)冷却时间小于9分钟, 然后跑回奥伯丁
step << !NightElf !Hunter
    #xprate <1.59
    #softcore
    #optional
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step << !NightElf
    #xprate <1.59
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4763 >>交任务: |cRXP_FRIENDLY_黑木熊怪的堕落|r
    .target Thundris Windweaver
step << !NightElf
    #xprate <1.59
    #optional
    #completewith BeachedCloak
    .destroy 12342 >>摧毁: |cRXP_ENEMY_黑木谷物|r
step << !NightElf
    #xprate <1.59
    #optional
    #completewith BeachedCloak
    .destroy 12343 >>摧毁: |cRXP_ENEMY_黑木坚果|r, 它在你的背包中. 不再需要它了
step << !NightElf
    #xprate <1.59
    #optional
    #completewith BeachedCloak
    .destroy 12341 >>摧毁: |cRXP_ENEMY_黑木水果|r, 它在你的背包中. 不再需要它了
step << !NightElf
    #xprate <1.59
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139 >>交任务: |cRXP_FRIENDLY_萨纳瑞恩的希望|r
    .target Tharnariun Treetender
step << !NightElf
    #xprate <1.59
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 986 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
    .accept 993 >>接任务: |cRXP_LOOT_丢失的主人|r
    .target Terenthis
step << !NightElf
    #xprate <1.59
    #optional
    #completewith BeachedCloak
    >>|cRXP_WARN_如果你装备了|r|T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_, 请确保保留当前的披风以备后用, 因为|r|T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_在后续任务中会永久丢失|r
    .equip 15,5387 >>|cRXP_WARN_装备|r|T133762:0|t[附有魔法的月虎披风] |cRXP_WARN_如果它比你当前的披风更好|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7
step << Dwarf Hunter
    #xprate <1.59
    #label TravelDarnDwarfHBoat
    #completewith DarnDwarfHBoat
    .goto 1439,33.169,40.179,15 >>前往达纳苏斯船只的码头
    .zoneskip Teldrassil
    .zoneskip Darnassus
step << Dwarf Hunter
    #xprate <1.59
    #optional
    #label DarnDwarfHCook1
    #requires TravelDarnDwarfHBoat
    #completewith DarnDwarfHBoat
    >>|cRXP_WARN_如果船刚抵达, 则在船上；如果船刚离开, 则在码头上:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r|T132832:0|t|cRXP_LOOT_[小蛋]|r|cRXP_WARN_和|r|T134059:0|t[甜香料]|cRXP_WARN_制成|r|T132834:0|t[草药烘蛋]
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
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Darnassus
step << Dwarf Hunter
    #xprate <1.59
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fp Teldrassil >>获取泰达希尔飞行路线
    .target Vesprystus
step << Dwarf Hunter
    #xprate <1.59
    #optional
    #completewith next
    .goto Teldrassil,55.95,89.88
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Dwarf Hunter
    #xprate <1.59
    #completewith next
    .goto Darnassus,40.38,8.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .trainer >>训练你的职业法术
    .target Jocaste
    .dungeon !DM
step << Dwarf Hunter
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .goto Darnassus,57.56,46.72
    .train 264 >>训练弓箭
    .train 227 >>训练法杖
    .target Ilyenia Moonfire
step << Dwarf Hunter
    #xprate <1.59
    .goto Darnassus,63.27,66.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰德瑞亚|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135489:0|t[重型弯弓]|cRXP_BUY_和|r|T134410:0|t[中型箭袋]|r
    .collect 3027,1 -- Heavy Recurve Bow
    .collect 11362,1 -- Medium Quiver
    .target Landria
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
step << Hunter
    #xprate <1.59
    #completewith next
    +|cRXP_WARN_装备|r|T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.19
    .xp <20,1
step << Dwarf Hunter
    #xprate <1.59
    .goto Teldrassil,23.70,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .turnin 741 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .accept 942 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Chief Archaeologist Greywhisker
    .isOnQuest 741
step << Dwarf Hunter
    #xprate <1.59
    #optional
    .goto Teldrassil,23.70,64.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
    .accept 942 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Chief Archaeologist Greywhisker
    .isQuestTurnedIn 741
step << Druid
    #xprate <1.59
    #optional
	#completewith MoongladeTrain
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
step << Druid
    #xprate <1.5
    .goto Moonglade,56.2,30.4
    >>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 6124 >>交任务: |cRXP_FRIENDLY_消除疾病|r
    .accept 6125 >>接任务: |cRXP_LOOT_解毒之术|r
    .target Dendrite Starblaze
    .isQuestTurnedIn 6123
step << Druid
    #xprate <1.59
    #label MoongladeTrain
    .goto Moonglade,52.53,40.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >>训练你的职业法术
    .target Loganaar
step << NightElf/Dwarf Hunter
    #completewith BeachedCloak
    #map Darkshore
    .goto Felwood,18.50,19.87,100 >>前往奥伯丁
    .cooldown item,6948,<0
step << NightElf/Dwarf Hunter
    #xprate <1.59
    #optional
    #completewith next
    .hs >>传送至奥伯丁
    .cooldown item,6948,>0,1
step
    #xprate <1.59
    #label BeachedCloak
    .goto 1439,36.701,45.122,8,0
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4727 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .target Gwennyth Bly'Leggonde
step
    #xprate <1.59
    #requires DeleteGyromast
    .goto Darkshore,36.096,44.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .turnin 1138 >>交任务: |cRXP_FRIENDLY_海中的水果|r
    .target Gubber Blump
    .isQuestComplete 1138
step << NightElf
    #xprate <1.59
    .goto 1439,37.394,40.128
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
    .turnin 4763 >>交任务: |cRXP_FRIENDLY_黑木熊怪的堕落|r
    .target Thundris Windweaver
step << NightElf
    #xprate <1.59
    #optional
    #completewith LostMasters
    .destroy 12342 >>摧毁: |cRXP_ENEMY_黑木谷物|r
step << NightElf
    #xprate <1.59
    #optional
    #completewith LostMasters
    .destroy 12343 >>摧毁: |cRXP_ENEMY_黑木坚果|r, 它在你的背包中. 不再需要它了
step << NightElf
    #xprate <1.59
    #optional
    #completewith LostMasters
    .destroy 12341 >>摧毁: |cRXP_ENEMY_黑木水果|r, 它在你的背包中. 不再需要它了
step << NightElf Hunter
    #xprate <1.59
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor >>备齐 |T132382:0|t[锋利的箭]
    .target Dalmond
step << NightElf
    #xprate <1.59
    .goto 1439,38.843,43.416
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139 >>交任务: |cRXP_FRIENDLY_萨纳瑞恩的希望|r
    .target Tharnariun Treetender
step << NightElf
    #xprate <1.59
    #label LostMasters
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 986 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
    .accept 993 >>接任务: |cRXP_LOOT_丢失的主人|r
    .target Terenthis




----End of <1.59x Turnin section----




step << NightElf
    #optional
    >>|cRXP_WARN_如果你装备了|r|T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_, 请确保保留当前的披风以备后用, 因为|r|T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_在后续任务中会永久丢失|r
    .equip 15,5387 >>|cRXP_WARN_装备|r|T133762:0|t[附有魔法的月虎披风] |cRXP_WARN_如果它比你当前的披风更好|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7

----Start of Hunter Deadmines/All 2x Deadmines Section----
step
    #xprate <1.59 << !Hunter
    #label TravelMenethilDMBoat
    #completewith MenethilDMBoat
    .goto 1439,32.432,43.744,15 >>前往米奈希尔港码头乘船
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .zoneskip Wetlands
    .dungeon DM
step
    #optional
    #label DarkshoreDMCook1
    #requires TravelMenethilDMBoat
    #completewith MenethilDMBoat
    >>|cRXP_WARN_如果船刚抵达, 则在船上；如果船刚离开, 则在码头上:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r|T132832:0|t|cRXP_LOOT_[小蛋]|r|cRXP_WARN_和|r|T134059:0|t[甜香料]|cRXP_WARN_制成|r|T132834:0|t[草药烘蛋]
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
    >>|cRXP_WARN_你现在将开始前往死亡矿井|r
    >>|cRXP_WARN_在等待前往米奈希尔港的船只时, 如需升级, 请将你的|r|T135966:0|t[急救]|cRXP_WARN_技能提升|r << Warrior/Paladin/Rogue
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << Paladin/Warrior
    #ah
    #xprate >1.59
    .goto 1437,11.579,59.540,6,0
    .goto 1437,11.435,59.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_inside|cRXP_FRIENDLY_布拉克·唐纳德|r交谈
    .vendor 1441 >>|cRXP_BUY_购买一把|r|T135329:0|t[刽子手之剑]|cRXP_BUY_(如果物品在售且你买得起)|r
    >>|cRXP_WARN_或者, 你可以稍后去拍卖行看看有没有更好的或更便宜的物品|r
    .collect 4818,1,2040,1 --Collect Executioner's Sword (1)
    .disablecheckbox
    .target Brak Durnad
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_inside|cRXP_FRIENDLY_布拉克·唐纳德|r交谈
    >>|cRXP_BUY_购买一把|r|T135329:0|t[刽子手之剑]|cRXP_BUY_(如果物品在售且你买得起)|r
    >>|cRXP_BUY_如果没有的话, 如果你能负担得起, 从他那里买一个|r|T135280:0|t[微光重剑]|r
    .collect 4818,1,2040,1 --Collect Executioner's Sword (1)
    .disablecheckbox
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target Brak Durnad
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8 --Intentionally lower than Falx so people don't buy the Falx if they have Executioners
    .itemcount 922,<1 --Dacian Falx (<1)
    .itemcount 4818,<1 --Executioner's Sword (<1)
    .dungeon DM
step << Paladin/Warrior !NightElf
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    +|cRXP_WARN_装备|r|T135329:0|t[刽子手之剑]
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_谢尔雷·布隆迪尔|r交谈
    .fly Ironforge >>飞往铁炉堡
    .target Shellei Brondir
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Wetlands,9.490,59.694
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_谢尔雷·布隆迪尔|r交谈
    .fp Menethil Harbor >>获取米奈希尔港的飞行路径
    .target Shellei Brondir
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Wetlands,5.485,64.156,40 >>从码头末端跳下, 游向下一个目标点
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Ironforge
    .zoneskip Westfall
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Wetlands,2.433,78.689,-1
    .goto Ironforge,17.089,83.373,-1
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r，使用角色解困自助服务功能传送到铁炉堡。您必须在该位置注销并登录另一个角色并呼出帮助菜单，然后向下滚动到自助​​服务。如果您无法解困，请跳过此步骤。
    .link https://www.youtube.com/watch?v=oVoxsr4zcg4 >>点击此处查看视频参考
    .link https://us.battle.net/support/en/help/product/wow/197/834/solution >>点击此处获取解困链接
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
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
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
    .goto Westfall,56.55,52.64,100 >>沿着海岸跑, 前往哨兵岭
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fp Sentinel Hill >>获取哨兵岭的飞行点
    .target Thor
    .zoneskip Ironforge --Skips if you didn't swim from Wetlands
    .subzoneskip 809
    .subzoneskip 2257
    .zoneskip Stormwind City
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
    .zoneskip Westfall,1
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Elwynn Forest,36.809,72.429,100,0
    .goto StormwindClassic,69.961,86.583
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .zoneskip Ironforge
    .subzoneskip 809
    .subzoneskip 2257
    .dungeon DM
step << NightElf Priest
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >>前往暴风城大教堂内|cRXP_FRIENDLY_高阶牧师劳瑞娜|r处
    .zoneskip Stormwind City,1
    .dungeon DM
step << NightElf Priest
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .trainer >>训练你的职业法术
    .target High Priestess Laurena
    .zoneskip Stormwind City,1
    .dungeon DM
--XX Alt if NE priest cant website unstuck




----End of Hunter/All Night Elves 2x Deadmines swim to Westfall Alternative (and Alt NE Priest Training) section----





step << NightElf Warrior/NightElf Hunter
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,61.177,89.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布里维夫·石拳|r交谈, 他在里面
    .train 197 >>训练双刃斧 << Warrior
    .train 199 >>学习2小时锤类武器技能 << Warrior
    .train 266 >>训练枪械 << Hunter
    .target Buliwyf Stonehand
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #optional
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_楼下的布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r |T135425:0|t[锐利投掷匕首] |r
    .collect 3107,1 --Collect Keen Throwing Knife (200)
    .target Brenwyn Wintersteel
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
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fp Ironforge >>获取铁炉堡的飞行点
    .target Gryth Thurden
    .zoneskip Wetlands
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_Book: 《深渊之神》|r] 开始任务|r
    .accept 968 >>接任务: |cRXP_LOOT_深渊之神|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛利·硬骨|r交谈, 他在里面
    .turnin 968 >>交任务: |cRXP_FRIENDLY_深渊之神|r
    .target Gerrig Bonegrip
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
    .goto Ironforge,31.32,27.80,12 >>前往吉恩所在之地
    .dungeon DM
step << Mage
    #xprate >1.59
    .goto Ironforge,31.32,27.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吉恩|r对话, 他在里面
    >>|cRXP_BUY_从她那里购买最多 4|r|T134419:0|t[传送符文]|r
    .collect 17031,4 --Rune of Teleportation (4)
    .target Ginny Longberry
    .dungeon DM
step << Mage
    #xprate >1.59
    #label MilstaffDM
    .goto Ironforge,25.50,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔斯塔弗·风暴之眼|r交谈
    .train 3562 >>火车 |T135757:0|t[传送:铁炉堡]
    .target Milstaff Stormeye
    .dungeon DM
step << Mage
    #xprate >1.59
    .goto Ironforge,27.18,8.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >>训练你的职业法术
    .target Dink
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional << NightElf
    .goto Ironforge,25.207,10.756
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托德雷·铁矿|r交谈
    .trainer >>训练你的职业法术
    .target Toldren Deepiron
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
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_Jump on top of the pillar above |cRXP_FRIENDLY_Bink|r, then walk slightly east of her onto the arrow position. Position your character until it looks like they're floating, then perform a Logout Skip by logging out and back in|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << skip --Warlock
    #xprate >1.59
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞尔索恩|r交谈
    .trainer >>训练你的职业法术
    .target Briarthorn
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << skip --Warlock
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    .goto 1455,53.164,7.037,10 >>进入|cRXP_FRIENDLY_寻尸者祖贝尔|r的房子
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
step << skip --Warlock
    #xprate >1.59
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_寻尸者祖贝尔|r交谈
    .vendor 6382 >>|cRXP_BUY_如果你愿意, 可以购买|r|T133738:0|t[魔法书]|cRXP_BUY_为你的宠物|r
    .target Jubahl Corpseseeker
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << skip --logout skip skip --Warlock
    #xprate >1.59
    #optional
    #completewith DeeprunDM
    .goto 1455,52.825,5.060
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶, 然后跳到书架顶. 通过退出再重新登录来完成登出跳过(Logout Skip)|r
    .zoneskip Elwynn Forest
    .zoneskip Stormwind City
    .zoneskip Westfall
    .dungeon DM
step << !Mage !Priest
    #xprate >1.59 << !Hunter
    #completewith DeeprunDM
    #optional
    .goto 1455,53.164,7.037,10 >>进入|cRXP_FRIENDLY_寻尸者祖贝尔|r的房子
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
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_走到床顶, 然后跳到书架顶. 通过退出再重新登录来完成登出跳过(Logout Skip)|r
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
    .goto 1455,76.414,51.226,20 >>前往: |cRXP_PICK_丹莫罗|r, |cRXP_WARN_走到箭头位置上|r|cRXP_FRIENDLY_Buliwyf Stonehand|r旁边的栏杆上。调整你的角色，直到它们看起来像是漂浮起来，然后通过退出并重新登录来执行跳过操作
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
    .goto 1455,76.414,51.226,20 >>|cRXP_WARN_跳到狮鹫的头部上方, 通过登出再重新登录来跳过登出界面|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考格斯宾|r交谈
    .vendor 5175 >>|cRXP_BUY_从他那里购买 a|r|T133024:0|t[青铜管]|cRXP_BUY_(如果可用)|r
--    >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .target Gearcutter Cogspinner
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
    >>|cRXP_WARN_你需要你的|r|T135966:0|t[急救]|cRXP_WARN_达到80级或以上, 才能接取后续任务|r << Rogue !Dwarf
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    .zoneskip Wetlands << NightElf
    .zoneskip Elwynn Forest
    .zoneskip Westfall
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利巴布·旋轮|r交谈
    .vendor 5519 >>|cRXP_BUY_从他那里购买 a|r|T133024:0|t[青铜管]|cRXP_BUY_(如果可用)|r
--    >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .bronzetube
    .target Billibub Cogspinner
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label ShoniAccept
    .goto StormwindClassic,55.510,12.504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沉默的舒尼|r交谈
    .accept 2040 >>接任务: |cRXP_WARN_地底突袭|r
    .target Shoni the Shilent
    .dungeon DM
step << Human
    #xprate >1.59
    .goto StormwindClassic,58.08,16.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
    .target Furen Longbeard
    .isOnQuest 1338
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔德·蓟草|r交谈
    .accept 167 >>接任务: |cRXP_WARN_我的兄弟……|r
    .accept +168 >>接任务: |cRXP_WARN_收集记忆|r
    .goto StormwindClassic,65.438,21.175
    .target Wilder Thistlenettle
    .dungeon DM
step << Hunter
--   #xprate >1.59
    #sticky
    #label DMPetTrain
    .goto 1453,61.576,15.998
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡瑞娜·麦肯达|r对话, 她在里面
    .trainer 2879 >>训练你的宠物法术
    .target Karrina Mekenda
    .dungeon DM
step << Hunter
--   #xprate >1.59
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈, 他在里面
    .trainer 5515 >>训练你的职业法术
    .target Einris Brightspear
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #requires DMPetTrain << Hunter
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔德·蓟草|r交谈, 他在里面
    .accept 167 >>接任务: |cRXP_WARN_我的兄弟……|r
    .accept 168 >>接任务: |cRXP_WARN_收集记忆|r
    .target Wilder Thistlenettle
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith RogueTrainDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_训练|r|T132282:0|t[伏击]|cRXP_WARN_如果你有多余的钱, 并且|r|T135641:0|t[匕首]|cRXP_WARN_已装备或存于背包中, 这将为你节省后续时间|r
    .train 8676 >>训练 |T132282:0|t[伏击]
    .target Osborne the Night Man
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_确保你训练|r|T132320:0|t[潜行]|cRXP_WARN_和|r|T133644:0|t[扒窃]|cRXP_WARN_和|r|T136058:0|t[开锁]|cRXP_WARN_, 因为稍后你会需要用到它们|r
    .train 1784 >>训练 |T132320:0|t[潜行]
    .train 921 >>训练 |T133644:0|t[扒窃]
    .train 1804 >>训练 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon DM
    .train 1784,1
    .train 921,1
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_确保你训练|r|T133644:0|t[扒窃]|cRXP_WARN_和|r|T136058:0|t[撬锁]|cRXP_WARN_, 因为你稍后会需要它们|r
    .train 921 >>训练 |T133644:0|t[扒窃]
    .train 1804 >>训练 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon DM
    .train 921,1
step << Rogue
    #xprate >1.59
    #label RogueTrainDMEnd
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_确保你训练|r|T136058:0|t[撬锁]|cRXP_WARN_, 因为你稍后会需要它|r
    .train 1804 >>训练 |T136058:0|t[撬锁]
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.799,53.815,15,0
    .goto 1453,77.290,58.138,12,0
    .goto 1453,78.466,60.034,12,0
    .goto 1453,78.560,58.435,6,0
    .goto 1453,75.754,60.369,12 >>前往SI:7楼上找|cRXP_FRIENDLY_“剃刀”雷吉克和马迪亚斯·肖尔|r
    .dungeon DM
step << Rogue
    #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“剃刀”雷吉克|r和|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .accept 2281 >>接任务: |cRXP_LOOT_赤脊山的联络员|r
    .goto StormwindClassic,75.76,60.35
    .target +Renzik "The Shiv"
    .accept 2360 >>接任务: |cRXP_LOOT_马迪亚斯和迪菲亚潜行者|r
    .goto StormwindClassic,75.78,59.84
    .target +Master Mathias Shaw
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >>前往指挥中心内的|cRXP_FRIENDLY_武神|r
    .dungeon DM
step << Warrior
    #xprate >1.59
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_武神|r交谈
    .trainer >>训练你的职业法术
    .target Wu Shen
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .train 201 >>学习1小时剑术 << Mage/Rogue/Warlock
    .train 1180 >>学习匕首技能 << Mage/Druid/Priest
    .train 202 >>学习两小时剑术 << Warrior/Paladin/Hunter
    .target Woo Ping
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r|T135329:0|t[刽子手之剑]
    .use 4818
    .itemcount 4818,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .dungeon DM
step << Rogue
    #xprate >1.59
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r对话, 她在里面
    >>|cRXP_BUY_从她那里购买一把|r|T135324:0|t[长剑]|cRXP_BUY_, 或前往拍卖行看看有没有更优或更便宜的选项|r
    .collect 923,1 --Longsword (1)
    .target Marda Weller
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
    .dungeon DM
step << Rogue
    #xprate >1.59
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_如果你负担得起, 就从她那里买一把|r|T135324:0|t[长剑]|r
    .collect 923,1 --Longsword (1)
    .target Marda Weller
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r|T135324:0|t[长剑]
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
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂内与达索瑞恩·拉尔会合
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈. 他会给你一本|T133739:0|t[|cRXP_LOOT_勇气之书|r]
    .use 6776 >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_勇气之书|r] 开始任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Duthorian Rall
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1649 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1650 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Duthorian Rall
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿古斯·夜语|r交谈
    .accept 3765 >>接任务: |cRXP_LOOT_遥远的旅途|r
    .target Argos Nightwhisper
    .dungeon DM
step << Paladin/Warrior
    #xprate >1.59
    #ah
    #optional
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r对话, 她在里面
    >>|cRXP_BUY_购买|r|T135280:0|t[微光重剑]|cRXP_BUY_从她那里, 或前往拍卖行看看是否有更优或更便宜的选项|r
    .collect 922,1,2040,1 --Collect Dacian Falx (1)
    .target Marda Weller
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r对话, 他在里面
    .vendor 1312 >>|cRXP_BUY_如果你买得起, 就从她那里买一把|r|T135469:0|t[暮色魔杖]|r
    >>|cRXP_BUY_或者, 如果价格低于52银47铜, 可从拍卖行购买|r|T135144:0|t[强效魔法杖]|r
    .collect 5211,1 --Dusk Wand (1)
    .disablecheckbox
    .target Ardwyn Cailen
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon DM
step << Warlock/Priest
    #xprate >1.59
    #ssf
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r对话, 他在里面
    >>|cRXP_BUY_从她那里购买|r|T135469:0|t[暮色魔杖]|r
    .collect 5211,1 --Dusk Wand (1)
    .target Ardwyn Cailen
    .money <0.5247
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
    .dungeon DM
step << Warlock/Priest
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r|T135469:0|t[暮色魔杖]
    .use 5211
    .itemcount 5211,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon DM
step << Warlock/Priest
    #xprate >1.59
    #optional
    #completewith WileyStart
    +|cRXP_WARN_装备|r|T135144:0|t[强效魔法杖]
    .use 11288
    .itemcount 11288,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .dungeon DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>进入屠羊酒馆. 下楼
    .dungeon DM
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
    .dungeon DM
step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2DM
    .goto StormwindClassic,25.665,77.649
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯巴克尔|r交谈
    .vendor >>|cRXP_BUY_从她那里购买|r|T133738:0|t[魔典：折磨(等级 2)]|r
    .target Spackle Thornberry
    .itemcount 16346,<1 --Grimoire of Torment (<1)
    .train 20317,1
    .dungeon DM
step << Warlock
    #xprate >1.59
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .accept 1716 >>接任务: |cRXP_LOOT_噬魂者|r
    .target Gakin the Darkbinder
    .dungeon DM
step << Warlock
    #xprate >1.59
    #sticky
    #label Torment2DMEnd
    #requires Torment2DM
    .train 20317 >>|cRXP_WARN_使用|r|T133738:0|t[魔典：折磨(等级 2)]
    .target Spackle Thornberry
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
    >>登上法师塔, 通过绿色传送门
    .goto Stormwind City,39.681,79.538,15 >>前往|cRXP_FRIENDLY_拉瑞麦尼·普尔度|r
    .dungeon DM
step << Mage
    #xprate >1.59
    .goto Stormwind City,39.681,79.538
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拉瑞麦尼·普尔度交谈|cRXP_FRIENDLY_Larimaine Purdue|r
    .train 3561 >>坐火车 |T135763:0|t[传送:暴风城]
    .target Larimaine Purdue
    .dungeon DM
step << !Paladin
    #xprate >1.59
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿古斯·夜语|r交谈
    .accept 3765 >>接任务: |cRXP_LOOT_遥远的旅途|r
    .target Argos Nightwhisper
    .dungeon DM
step << Druid
    #xprate >1.59
    .goto 1453,20.883,55.505
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙德拉斯·月树|r谈话
    .train 6756 >>训练你的职业法术
    .target Sheldras Moontree
    .dungeon DM
step << Hunter
--  #xprate >1.59
    #optional
    #completewith next
    .goto 1453,50.929,57.781,10 >>进入贸易区中环内的空箭袋
    .dungeon DM
step << Hunter
--  #xprate >1.59
    #ssf
    .goto 1453,49.962,57.638
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_从他那里购买一个|r|T135489:0|t[重型弯弓]|cRXP_BUY_和一个|r|T134410:0|t[中型箭袋]|r
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .collect 11362,1 -- Medium Quiver (1)
    .target Landria
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
    .dungeon DM
step << Hunter
--  #xprate >1.59
    #ah
    .goto 1453,49.962,57.638
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135489:0|t[重型弯弓]|cRXP_BUY_和|r|T134410:0|t[中型箭袋]|cRXP_BUY_, 或前往拍卖行看看是否有更优或更便宜的选项|r
    .collect 3027,1 -- Heavy Recurve Bow (1)
    .collect 11362,1 -- Medium Quiver (1)
    .target Landria
    .money <0.7349
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.20
    .dungeon DM
step
    #xprate >1.59
    #ah
    #softcore
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>稍后为你的 |T132290:0|t[毒药] 任务购买 |T134437:0|t[抗毒药剂], 其余物品则用于在赤脊山更快地交任务 << !Dwarf Rogue
    >>请尽快购买以下物品, 以便在赤脊山和西部荒野更快地提交任务 << Paladin
    >>请尽快在赤脊山购买以下物品, 以便更快地提交任务 << !Paladin !Rogue/Dwarf Rogue
    >>这将节省你的时间, 因为你无需到处寻找怪物击杀. 如果你想不购买任何物品, 请跳过此步骤
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
    .target Auctioneer Jaxon
    .dungeon DM
step
    #xprate >1.59
    #ah
    #hardcore
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>稍后为你的 |T132290:0|t[毒药] 任务购买 |T134437:0|t[抗毒药剂], 其余物品可用于在赤脊山和西部荒野更快地完成任务交还 << !Dwarf Rogue
    >>请尽快购买以下物品, 以便在赤脊山和西部荒野更快地提交任务 << !Rogue/Dwarf Rogue
    >>这将节省你的时间, 因为你无需到处寻找怪物击杀. 如果你想不购买任何物品, 请跳过此步骤
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
    .target Auctioneer Jaxon
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #completewith GryanAll << Human
    #optional << Human
    .goto StormwindClassic,57.816,58.331,30,0
    .goto StormwindClassic,63.301,62.103,30,0
    .goto StormwindClassic,63.047,65.744,15,0
    .goto StormwindClassic,66.276,62.135
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fp Stormwind >>获取暴风城飞行点 << !Human
    .fly Westfall >>飞往西部荒野 << Human
    .target Dungar Longdrink
    .zoneskip Westfall << Human
    .dungeon DM
step << !Human
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label GryanAll << Human
    .goto Westfall,56.33,47.52
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << Human/Warlock
    #requires Torment2DMEnd << Warlock
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fp Sentinel Hill >>获取哨兵岭的飞行点 << !Human
    .fly Redridge >>飞往赤脊山脉 << Human/Warlock
    .target Thor
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Redridge >>飞往赤脊山脉
    .target Dungar Longdrink
    .zoneskip Stormwind City,1
    .dungeon DM
    .isOnQuest 65
step << !Human !Warlock
    #xprate >1.59 << !Hunter
    .goto Elwynn Forest,65.20,69.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔楼顶端的|cRXP_FRIENDLY_塞欧克瑞图斯|r交谈
    .accept 94 >>接任务: |cRXP_LOOT_法师的眼线|r
    .target Theocritus
    .dungeon DM
    .xp <20,1
step << !Human !Warlock
    #xprate >1.59 << !Hunter
    #optional
    #completewith WileyStart
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_内|cRXP_FRIENDLY_厨师布雷纳|r交谈
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target Chef Breanna
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label WileyStart
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_黑衣威利|r交谈
    .turnin 65 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 132 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
	.target Wiley the Black
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢修斯|r交谈
    .turnin 2281 >>交任务: |cRXP_FRIENDLY_赤脊山的联络员|r
    .accept 2282 >>接任务: |cRXP_LOOT_奥瑟尔伐木场|r
    .target Lucius
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_你必须为你的|r|T132290:0|t[毒药]|cRXP_WARN_quest 稍后完成此任务|r
    >>|cRXP_WARN_站在标记的路点位置, 调整相机和鼠标视角, 直到可以一次性点击3个|cRXP_PICK_Practice Lockboxes|r而无需移动任何位置|r
    .skill lockpicking,80 >>|cRXP_WARN_在奥瑟尔伐木场地面上打开|r|cRXP_PICK_Practice 锁匠练习箱|r, 直到你的|r|T136058:0|t[开锁]技能达到80|r
    .dungeon DM
step << Rogue
    #xprate >1.59
	.goto Redridge Mountains,52.05,44.69
    >>打开|cRXP_PICK_卢修斯的箱子|r. 从中获取|cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery (1)
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto Redridge Mountains,28.07,52.02
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢修斯|r交谈
    .turnin 2282 >>交任务: |cRXP_FRIENDLY_奥瑟尔伐木场|r
    .target Lucius
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith DefiasWestfall2
    .destroy 7907 >>摧毁: |cRXP_ENEMY_偷窃技能认证书|r, 它在你的背包中. 不再需要它了
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << Human/Warlock
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点 << !Human !Warlock
    .fly Westfall >>飞往西部荒野
    .target Ariena Stormfeather
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label DefiasWestfall2
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 132 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 135 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith KlavenFinish
    +|cRXP_WARN_装备|r|T135324:0|t[长剑]
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
    >>击杀|cRXP_ENEMY_小型结网毒蜘蛛|r和|cRXP_ENEMY_结网毒蜘蛛|r. 击败它们可获得|cRXP_LOOT_小毒囊|r和它们的|cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_你需要一个|cRXP_LOOT_小毒囊|r来制作|T134437:0 |t[抗毒药剂], 稍后用于移除|T136230:0 |t[赞吉尔之触]的负面效果|r
    >>|cRXP_WARN_稍后保存粘糊的蜘蛛腿|r|r
    >>|cRXP_WARN_如果你有一个|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_的朋友, 可以跳过此步骤, 稍后再请他们帮你移除|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob Pygmy Venom Web Spider
    .mob Venom Web Spider
    .itemcount 6452,<1 --Anti Venom (<1)
    .isQuestAvailable 2359
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请注意即将出现的章节==|r
    >>|cRXP_WARN_按 Esc 键, 然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用互动键”, 并将“与目标互动”选项绑定到一个按键|r
    >>|cRXP_WARN_此外, 建议你启用敌人姓名板(默认键:V), 这样可以让你看到塔内某些角落后方的敌人|r
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密探吉尔妮|r交谈
    >>|cRXP_WARN_你必须完成这个任务|r|T132290:0|t[毒药]
    .turnin 2360 >>交任务: |cRXP_FRIENDLY_马迪亚斯和迪菲亚潜行者|r
    .accept 2359 >>接任务: |cRXP_LOOT_克拉文之塔|r
    .target Agent Kearnen
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
    >>|T133644:0|t[劫掠]|cRXP_ENEMY_丑陋的迪菲亚懒汉|r. 将其击杀后获取|cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_WARN_|cRXP_ENEMY_丑陋的迪菲亚懒汉|r会在塔楼入口处生成, 然后在塔楼外围巡逻|r
    >>|cRXP_WARN_注意, 他会造成大量伤害. 如果你的|r|T132320:0|t[潜行]|cRXP_WARN_效果中断, 请迅速使用|r|T132307:0|t[冲刺]|cRXP_WARN_并逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频攻略
    .mob Malformed Defias Drone
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith Mortwake
    +|cRXP_WARN_如果你尚未装备|r|T135641:0|t[曲木匕首]|cRXP_WARN_, 请为完成此任务装备|r|T135641:0|t[匕首]|r
    .use 15396
    .itemcount 15396,1
    .dungeon DM
step << Rogue
    #xprate >1.59
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼的第二层顶层. 在处于|r|T132320:0|t[潜行]|cRXP_WARN_且|cRXP_ENEMY_Defias 塔哨兵|r不在你身边时, 跳上椅子, 再跳到灯上, 最后跳到路径点位置上方的书架上|r
    >>|cRXP_WARN_手动|r|T132320:0|t[解除隐身]|cRXP_WARN_, 然后按下你的“与目标互动”键绑定以开启|r|cRXP_PICK_暮色森林的箱子|r. 拾取其中的|r|cRXP_LOOT_克莱文·莫特韦克的日志|r|r
    >>|cRXP_WARN_注意:你的|r|T132320:0|t[潜行]|cRXP_WARN_在拾取物品后将暂时失效|r|cRXP_LOOT_克拉文·莫特韦克的日记|r
    >>|cRXP_WARN_如果你未能击杀二楼的|cRXP_ENEMY_Defias Tower Sentries|r, 要做好逃跑的准备. 当你站在书架顶部时(这是一个躲避点), 它们很可能会永久性地对你产生仇恨(但不会攻击你)|r
    >>|cRXP_WARN_如果你的背包里或装备中有|r|T135641:0|t[匕首]|cRXP_WARN_, 你可以对位于塔内的|cRXP_ENEMY_迪菲亚巡塔员|r和|cRXP_ENEMY_迪菲亚哨兵|r施放|r|T132282:0|t[伏击]|cRXP_WARN_, 立即击杀他们. 击杀第一个|cRXP_ENEMY_迪菲亚哨兵|r后, 请立刻准备逃跑, 并记住你可能会受到来自上方的攻击. 这种方法虽然较慢, 但安全得多|r
    >>|cRXP_WARN_请注意, 如果你必须从塔楼中跑出来, |cRXP_ENEMY_丑陋的迪菲亚懒汉|r 和 |cRXP_ENEMY_迪菲亚苦工|r 可能会出现在塔楼入口处|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频攻略
    .mob Defias Tower Patroller
    .mob Defias Tower Sentry
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >>制作 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 的负面效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
    .dungeon DM
step << Dwarf Rogue
    #xprate >1.59
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石肤术] 以移除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .aura -9991
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith KlavenFinish
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >>前往|cRXP_FRIENDLY_珊娜·弗勒|r
    .aura -9991
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果你有|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_好友, 请他们帮你移除|r|T136230:0|t[赞吉尔之触]|r
    .skill firstaid,80 >>|cRXP_WARN_将你的|r|T135966:0|t[急救]|cRXP_WARN_提升至80级|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果你有|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_好友, 请他们帮你移除|r|T136230:0|t[赞吉尔之触]|r
    .train 7934 >>|cRXP_WARN_Train|r|T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >>制作 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
    .dungeon DM
step << !Dwarf Rogue
    #xprate >1.59
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 的负面效果|r
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
    .goto StormwindClassic,78.67,60.13,10 >>进入瑞兹尔·铜栓总部, 沿楼梯向上前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label KlavenFinish
    .goto Stormwind City,75.78,59.84
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    >>|cRXP_WARN_记得在切换到|r|T135641:0|t[匕首]|cRXP_WARN_earlier后, 重新装备你的主武器|r << Rogue
    .turnin 135 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 141 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .turnin 2359 >>交任务: |cRXP_FRIENDLY_克拉文之塔|r << Rogue
    .target Master Mathias Shaw
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith BandanaStart
    +开始组队进入死亡矿井
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 141 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 142 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    #completewith next
    +|cRXP_WARN_装备|r|T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #completewith next
    .goto Westfall,44.50,69.62,55 >>前往月溪镇
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,44.50,69.62
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>击杀|cRXP_ENEMY_迪菲亚信使|r, 搜刮出他的|cRXP_LOOT_神秘信息|r
    >>|cRXP_WARN_|cRXP_ENEMY_迪菲亚信使|r 会在月溪镇生成. 他会沿着月溪镇以北的道路, 前往金海岸采石场和江戈洛德矿场. 如果你在路上没有看到他, 请等待他在月溪镇重新出现|r
    >>|cRXP_WARN_他有4到5分钟的刷新时间|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan Defias Messenger
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 142 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,55.68,47.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪菲亚叛徒|r交谈
    >>|cRXP_WARN_如果他不在那里, 你可能需要等待|cRXP_FRIENDLY_迪菲亚叛徒|r生成|r
    >>|cRXP_WARN_如果你已经组好队伍, 请确保队伍成员已先提交前一个任务环节, 再开始护送任务|r
    .accept 155 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target The Defias Traitor
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,42.56,71.71
    >>护送|cRXP_FRIENDLY_迪菲亚叛徒|r到死亡矿井
    >>|cRXP_WARN_始终待在 |cRXP_FRIENDLY_迪菲亚叛徒|r 身边. 抵达月溪镇后, 随时准备对抗 |cRXP_ENEMY_迪菲亚抢劫者|r 和 |cRXP_ENEMY_迪菲亚强夺者|r|r
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target The Defias Traitor
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 155 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 166 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label BandanaStart
    .goto Westfall,56.67,47.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔顶的哨兵瑞尔|r交谈
    .accept 214 >>接任务: |cRXP_WARN_红色丝质面罩|r
    .target Scout Riell
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
    >>|cRXP_WARN_在哨兵岭以南刷|cRXP_ENEMY_Gnolls|r, 同时组队准备进入死亡矿井|r
    .subzone 20 >>当你的队伍集结完成后, 前往月溪镇
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,42.55,71.69
    .subzone 1581 >>与你的团队一起进入迪菲亚藏身处
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
    +|cRXP_WARN_装备|r|T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #completewith EnterDM
    >>击杀|cRXP_ENEMY_Defias|r. 搜刮他们的|cRXP_LOOT_红色丝质面罩|r
    >>|cRXP_WARN_你也可以在死亡矿井中完成这个任务|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #completewith next
    >>击杀|cRXP_ENEMY_骷髅矿工|r和|cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r, 掠夺他们的|cRXP_LOOT_卡片|r
    >>|cRXP_WARN_这是在副本外完成的|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_工头希斯耐特|r. 从他身上搜刮|cRXP_LOOT_勋章|r
    >>|cRXP_WARN_这是在副本外完成的|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan Foreman Thistlenettle
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_骷髅矿工|r和|cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r, 掠夺他们的|cRXP_LOOT_卡片|r
    >>|cRXP_WARN_这是在副本外完成的|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label EnterDM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >>进入死亡矿井副本
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #softcore
    #optional
    #completewith VanCleef << !Paladin
    #completewith DeadminesBackdoor << Paladin
    >>击杀死亡矿井内的|cRXP_ENEMY_Defias|c敌人, 搜刮他们掉落的|cRXP_LOOT_红色丝质面罩|c
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #hardcore
    #optional
    #completewith DeadminesBackdoor
    >>击杀死亡矿井内的|cRXP_ENEMY_Defias|c敌人, 搜刮他们掉落的|cRXP_LOOT_红色丝质面罩|c
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    >>击杀|cRXP_ENEMY_斯尼德|r. 击败他后搜刮出|cRXP_LOOT_小型高能发动机|r
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
    +|cRXP_WARN_装备|r|T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label VanCleef
    >>击杀|cRXP_ENEMY_艾德温·范克里夫|r, 搜刮他的|cRXP_LOOT_头颅|r和 |T133471:0|t[|cRXP_LOOT_未寄出的信|r]
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
    >>|cRXP_WARN_询问你的团队是否能留下来帮你完成圣骑士专属的|cRXP_FRIENDLY_达芙妮·斯迪威尔|r护送任务(如果可能的话)|r << Paladin
    .subzone 920 >>通过位于|cRXP_ENEMY_艾德温·范克里夫|r东侧的后门离开死亡矿井
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1436,39.444,85.755
    .goto 1436,40.010,86.514,20 >>前往|cRXP_FRIENDLY_达芙妮·斯迪威尔|r在她的田地里
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_达芙妮·斯迪威尔|r, 她在田野里, 开始护送任务
    >>|cRXP_WARN_她在其领地内稍作巡逻|r
    >>|cRXP_WARN_请注意, 这可能会稍微有些困难. 你将面对3波敌人, 每波分别为3个和4个和5个等级为17-18的|cRXP_ENEMY_迪菲亚袭击者|r
    .turnin 1650 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1651,1 >>接任务: |cRXP_LOOT_勇气之书|r
    .link https://youtu.be/1-nnLcqIIlQ?si=kZi41eXT8ZQmSBY2&t=10 >>点击此处查看视频攻略
    .target Daphne Stilwell
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto 1436,41.311,88.506
    >>保护|cRXP_FRIENDLY_达芙妮·斯迪威尔|r
    >>|cRXP_WARN_如果你或|cRXP_FRIENDLY_达芙妮·斯迪威尔|r死亡, 任务将失败, 你必须重新开始|r
    >>|cRXP_WARN_请注意, 这可能会稍微有些困难. 你将面对3波敌人, 每波分别为3个和4个和5个等级为17-18的|cRXP_ENEMY_迪菲亚袭击者|r
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
    >>|cRXP_WARN_她在其领地内稍作巡逻|r
    .turnin 1651 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1652 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Daphne Stilwell
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #hardcore << !Paladin
    #optional
    #completewith next
    .goto Westfall,30.01,86.02,40 >>前往西部荒野灯塔
    .dungeon DM
step
    #xprate >1.59
    #ah
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 104 >>接任务: |cRXP_WARN_海岸上的威胁|r
    .accept 103 >>接任务: |cRXP_WARN_长明的灯塔|r
    .turnin 103 >>交任务: |cRXP_FRIENDLY_长明的灯塔|r
    .target Captain Grayson
    .itemcount 814,5 -- Flask of Oil (5)
    .dungeon DM
step
    #xprate >1.59
    #ssf
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 104 >>接任务: |cRXP_WARN_海岸上的威胁|r
    .target Captain Grayson
    .dungeon DM
step
    #xprate >1.59
    #ah
    #optional
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 104 >>接任务: |cRXP_WARN_海岸上的威胁|r
    .target Captain Grayson
    .dungeon DM
step
    #xprate >1.59
    #hardcore << !Paladin
    .goto Westfall,34.43,83.93
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀|cRXP_ENEMY_老瞎眼|r. 击败他后搜刮其掉落的|cRXP_LOOT_Scale|r
    >>|cRXP_ENEMY_老瞎眼|r|cRXP_WARN_在长岸来回巡逻. 如果你找不到他, 就跳过此步骤|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan Old Murk-Eye
    .dungeon DM
step
    #xprate >1.59
    #hardcore << !Paladin
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .turnin 104 >>交任务: |cRXP_FRIENDLY_海岸上的威胁|r
    .target Captain Grayson
    .isQuestComplete 104
    .dungeon DM
step
    #xprate >1.59
    #optional
    #hardcore << !Paladin
    #completewith DeadminesEnd
    .abandon 103 >>放弃长明的灯塔
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto Westfall,42.55,71.69
    .subzone 1581 >>独自进入迪菲亚据点
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto 1415,40.678,79.578
    >>击杀死亡矿井副本外的|cRXP_ENEMY_Defias|r, 搜刮他们掉落的|cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step << !Paladin
    #xprate >1.59 << !Hunter
    >>击杀死亡矿井内的|cRXP_ENEMY_Defias|c敌人, 搜刮他们掉落的|cRXP_LOOT_红色丝质面罩|c
    >>|cRXP_WARN_如果死亡矿井内已无更多|r德莱尼敌对者|cRXP_ENEMY_Defias|r, 可到矿井外击杀他们|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #softcore
    #completewith DeadminesEnd
    .deathskip >>在|cRXP_FRIENDLY_灵魂医者|r处死亡并复活
    .target Spirit Healer
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
    +|cRXP_WARN_装备|r|T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label DeadminesEnd
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 166 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto Westfall,56.67,47.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔顶的哨兵瑞尔|r交谈
    .turnin 214 >>交任务: |cRXP_FRIENDLY_红色丝质面罩|r
    .target Scout Riell
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional
    #sticky
    #label LetterLater
    .abandon 373 >>放弃未寄出的信件. 你稍后再做这件事
    .dungeon DM
step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .cast 3561 >>施放 |T135763:0|t[传送:暴风城]
    .zoneskip Stormwind City
    .dungeon DM
step << Mage
    #xprate >1.59
    #optional
    .goto 1453,36.863,81.132
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .train 2138 >>训练你的职业法术
    .target Elsharin
    .xp <22,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #optional << Mage
    #completewith ShoniEnd
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .zoneskip Stormwind City
    .target Thor
    .dungeon DM
step << Warlock
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>进入屠羊酒馆. 下楼
    .xp <22,1
    .dungeon DM
step << Warlock
    #xprate >1.59
    #optional
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .train 6202 >>训练你的职业法术
    .target Ursula Deline
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
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂内与达索瑞恩·拉尔会合
    .xp <22,1
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1652 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1653 >>接任务: |cRXP_LOOT_正义试炼|r
    .target Duthorian Rall
    .xp <22,1
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 19835 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >>前往暴风城大教堂内|cRXP_FRIENDLY_高阶牧师劳瑞娜|r处
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .train 8103 >>训练你的职业法术
    .target High Priestess Laurena
    .xp <22,1
    .dungeon DM
step << Rogue
    #xprate >1.59
    #optional
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    .train 1856 >>训练你的职业法术
    .target Osborne the Night Man
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >>前往指挥中心内的|cRXP_FRIENDLY_武神|r
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_武神|r交谈
    .train 6192 >>训练你的职业法术
    .target Wu Shen
    .xp <22,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔德·蓟草|r交谈, 他在里面
    .turnin 167 >>交任务: |cRXP_FRIENDLY_我的兄弟……|r
    .turnin 168 >>交任务: |cRXP_FRIENDLY_收集记忆|r
    .target Wilder Thistlenettle
    .dungeon DM
step << skip --Hunter - nothing good to train at 22
    #xprate >1.59
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈, 他在里面
    .trainer >>训练你的职业法术
    .target Einris Brightspear
    .xp <22,1
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #label ShoniEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沉默的舒尼|r交谈
    .turnin 2040 >>交任务: |cRXP_FRIENDLY_地底突袭|r
    .goto StormwindClassic,55.510,12.504
    .target Shoni the Shilent
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利巴布·旋轮|r交谈
    .vendor 5519 >>|cRXP_BUY_从他那里购买 a|r|T133024:0|t[青铜管]|cRXP_BUY_(如果可用)|r
--    >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .bronzetube
    .target Billibub Cogspinner
    .dungeon DM
step << Paladin
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,42.917,34.221,15,0
    .goto 1453,41.385,31.547,15,0
    .goto 1453,39.810,29.788,15
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂内与达索瑞恩·拉尔会合
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1652 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1653 >>接任务: |cRXP_LOOT_正义试炼|r
    .target Duthorian Rall
    .dungeon DM
step << Paladin
    #xprate >1.59
    .goto StormwindClassic,38.58,32.00,12,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .train 19835 >>训练你的职业法术
    .target Arthur the Faithful
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    #optional
    #completewith next
    .goto StormwindClassic,42.51,33.51,20,0
    .goto StormwindClassic,38.54,26.86,20 >>前往暴风城大教堂内|cRXP_FRIENDLY_高阶牧师劳瑞娜|r处
    .xp <22,1
    .dungeon DM
step << Priest
    #xprate >1.59
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .train 8103 >>训练你的职业法术
    .target High Priestess Laurena
    .xp <22,1
    .dungeon DM
step << Rogue
    #xprate >1.59
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    .train 1856 >>训练你的职业法术
    .target Osborne the Night Man
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    #optional
    #completewith next
    .goto 1453,74.592,51.567,15,0
    .goto 1453,78.011,47.797,15,0
    .goto 1453,80.030,45.591,12 >>前往指挥中心内的|cRXP_FRIENDLY_武神|r
    .xp <22,1
    .dungeon DM
step << Warrior
    #xprate >1.59
    .goto 1453,78.673,45.791
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_武神|r交谈
    .train 6192 >>训练你的职业法术
    .target Wu Shen
    .xp <22,1
    .dungeon DM
--XX No way to check if the user has the ironforge FP, if they don't, send them to the trainer there instead
step << Mage
    #xprate >1.59
    #optional
    #completewith next
    .cast 3561 >>施放 |T135763:0|t[传送:暴风城]
    .dungeon DM
step << Mage
    #xprate >1.59
    #optional
    .goto 1453,36.863,81.132
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|r艾尔莎林|r交谈
    .train 2138 >>训练你的职业法术
    .target Elsharin
    .xp <22,1
    .dungeon DM
step << Druid
    #xprate >1.59
    #optional
    #completewith next
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
step << Druid
    #xprate >1.59
    #optional
    #completewith next
    .goto Moonglade,52.53,40.57
	>>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 8926 >>训练你的职业法术
    .target Loganaar
    .xp <22,1
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
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
    .zoneskip Ironforge
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    #requires DeeprunDMNoFP1
    #label DeeprunDMNoFP2
    #completewith NEIFFP
    .goto 1455,67.842,42.456
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考格斯宾|r交谈
    .vendor 5175 >>|cRXP_BUY_从他那里购买 a|r|T133024:0|t[青铜管]|cRXP_BUY_(如果可用)|r
--    >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .target Gearcutter Cogspinner
    .bronzetube
    .dungeon DM
step << NightElf Warrior/NightElf Hunter
    #xprate >1.59 << !Hunter
    #requires DeeprunDMNoFP2
    #label DeeprunDMNoFP3
    #completewith NEIFFP
    .goto Ironforge,61.177,89.508
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布里维夫·石拳|r交谈, 他在里面
    .train 197 >>训练双刃斧 << Warrior
    .train 199 >>学习2小时锤类武器技能 << Warrior
    .train 266 >>训练枪械 << Hunter
    .target Buliwyf Stonehand
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #requires DeeprunDMNoFP3
    #label DeeprunDMNoFP4
    #completewith NEIFFP
    .goto 1455,62.378,88.671
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼下的|cRXP_FRIENDLY_楼下的布雷文·寒钢|r交谈
    >>|cRXP_BUY_从她那里购买|r|T135427:0|t[重型投掷刀]|r
    .collect 3108,200 --Collect Heavy Throwing Knife (200)
    .target Brenwyn Wintersteel
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
    .dungeon DM
step << NightElf Warrior
    #xprate >1.59
    #requires DeeprunDMNoFP4
    #label DeeprunDMNoFP5
    #completewith NEIFFP
    +|cRXP_WARN_装备|r|T135427:0|t[重型投掷匕首]
    .use 3108
    .itemcount 3108,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.7
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #label NEIFFP
    .goto Ironforge,55.491,47.751
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fp Ironforge >>获取铁炉堡的飞行点
    .target Gryth Thurden
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    #optional
    .goto Ironforge,50.826,5.613
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_Book: 《深渊之神》|r] 开始任务|r
    .accept 968 >>接任务: |cRXP_LOOT_深渊之神|r
    .use 5352
    .itemcount 5352,1
    .zoneskip Ironforge,1
    .dungeon DM
step << NightElf
    #xprate >1.59 << !Hunter
    .goto Ironforge,50.826,5.613
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛利·硬骨|r交谈, 他在里面
    .turnin 968 >>交任务: |cRXP_FRIENDLY_深渊之神|r
    .target Gerrig Bonegrip
    .zoneskip Ironforge,1
    .isOnQuest 968
    .dungeon DM
step
    #xprate >1.59 << !Hunter
    #requires LetterLater
    #optional
    .hs >>传送至黑海岸
    .zoneskip Darkshore
    .dungeon DM




----End of Hunter/All 2x Deadmines section----
----Start of <1.59x Redridge Transition----






step << !Hunter
--XX NightElf
    #xprate <1.59
    .goto Darkshore,37.45,40.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达蒙德|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135237:0|t[燧石和火绒]|cRXP_BUY_和|r|T135435:0|t[普通木柴]|r
    >>|cRXP_WARN_这是为了提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_, 很快就会在船上|r
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    .collect 4470,1 --Simple Wood (1)
    .collect 4471,1 --Flint and Tinder (1)
    .itemcount 6889,1 -- Small Egg (1+)
    .skill cooking,50,1
    .target Dalmond
step << !Hunter
--XX NightElf
    #xprate <1.59
    #completewith next
    .goto 1439,38.107,41.165
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    .vendor 6301 >>|cRXP_BUY_从他那里购买|r|T134059:0|t[甜香料]|cRXP_BUY_, 直到你拥有的|r|T134059:0:0|t[甜香料]|cRXP_BUY_数量等于或超过你当前持有的|r|T132832:0|t[小蛋]|cRXP_BUY_数量|r
    .collect 2678,50,90,1,0x20,cooking --Mild Spices (1-50)
    .disablecheckbox
    .collect 6889,50,90,1,0x20,cooking --Small Egg (1-50)
    .disablecheckbox
    .target Gorbold Steelhand
    .skill cooking,50,1 --XX Shows if cooking skill is <50
    .itemcount 6889,1 -- Small Egg (1+)
--ZXCV
step << !Hunter
    #xprate <1.59
    #label TravelMenethilRRBoat
    #completewith MenethilRRBoat
    .goto 1439,32.432,43.744,15 >>前往米奈希尔港码头乘船
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
    >>|cRXP_WARN_如果船刚抵达, 则在船上；如果船刚离开, 则在码头上:|r
    .cast 818 >>|cRXP_WARN_创建一个|r|T135805:0|t[基础营火]|cRXP_WARN_(在法术书的常规选项卡下)|r
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
    >>|cRXP_WARN_你需要 50|r|T133971:0|t[烹饪]|cRXP_WARN_才能完成暮色森林后续的任务|r
    >>|T133971:0|t[烹饪]|cRXP_WARN_将|r|T132832:0|t|cRXP_LOOT_[小蛋]|r|cRXP_WARN_和|r|T134059:0|t[甜香料]|cRXP_WARN_制成|r|T132834:0|t[草药烘蛋]
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
    >>|cRXP_WARN_在等待前往米奈希尔港的船只时, 如需升级, 请将你的|r|T135966:0|t[急救]|cRXP_WARN_技能提升|r << Rogue/Warrior/Paladin
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔·奥雷|r交谈
    .vendor >>|cRXP_WARN_购买|r|T133024:0|t[青铜管]
    >>|cRXP_WARN_这是一个限量供应的物品. 如果|cRXP_FRIENDLY_尼尔·奥雷|r没有此物品, 请跳过此步骤|r
	.target Neal Allen
    .bronzetube
step << !NightElf !Hunter
    #xprate <1.59
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_暴风城|r
    .fly Ironforge >>飞往铁炉堡
    .target Shellei Brondir



----Start of <1.59x Night Elf Wetlands->IF Transition----



step << !Hunter NightElf
    #xprate <1.59
    .goto Wetlands,8.509,55.697
    .target James Halloran
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹姆斯·哈洛兰|r交谈
    .accept 484 >>接任务: |cRXP_LOOT_小鳄鱼皮|r
step << !Hunter NightElf
    #xprate <1.59
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_暴风城|r
    .fp Wetlands>>获取湿地飞行路线
    .target Shellei Brondir
step << !Hunter NightElf
    #xprate <1.59
    .money <0.08
    .goto Wetlands,10.4,56.0,25,0
    .goto Wetlands,10.1,56.9,25,0
    .goto Wetlands,10.6,57.2,25,0
    .goto 1437,10.760,56.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔·奥雷|r交谈
    .vendor >>|cRXP_WARN_购买|r|T133024:0|t[青铜管]
    >>|cRXP_WARN_这是一个限量供应的物品. 如果|cRXP_FRIENDLY_尼尔·奥雷|r没有此物品, 请跳过此步骤|r
	.target Neal Allen
    .bronzetube
step << !Hunter NightElf
    #xprate <1.59
    #completewith crocs
    >>击杀|cRXP_ENEMY_湿地鳄鱼幼崽|r. 击杀后从它们身上获取|cRXP_LOOT_小鳄鱼皮|r
    .complete 484,1
    .mob Young Wetlands Crocolisk
step << !Hunter NightElf
    #xprate <1.59
    #completewith next
    .goto Wetlands,49.91,39.36,50 >>向东前往|cRXP_FRIENDLY_埃纳尔·石钳|r
step << !Hunter NightElf
    #xprate <1.59
    #label crocs
    .goto Wetlands,49.91,39.36
    .target Einar Stonegrip
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃纳尔·石钳|r谈话
    .accept 469 >>接任务: |cRXP_LOOT_日常供货|r
step << !Hunter NightElf
    #xprate <1.59
    .goto Wetlands,53.2,41.3,55,0
    .goto Wetlands,58.5,50.8,55,0
    .goto Wetlands,62.1,61.4,55,0
    .goto Wetlands,64.0,72.2
    >>击杀|cRXP_ENEMY_湿地鳄鱼幼崽|r. 击杀后从它们身上获取|cRXP_LOOT_小鳄鱼皮|r
    .complete 484,1
    .mob Young Wetlands Crocolisk
step << skip --logout skip !Hunter NightElf
    #xprate 1.49-1.59
	#completewith next
	.goto Wetlands,63.9,78.6
    >>前往东部湿地水坝底部的洞穴
	.zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
    >>当你重新登录时, 这会将你传送至塞尔萨玛
	.link https://www.youtube.com/watch?v=21CuGto26Mk >>|cRXP_WARN_点击此处查看参考|r
step << !Hunter NightElf
    #xprate <1.5
    #completewith next
    .goto Wetlands,53.14,70.38,30,0
    .goto Wetlands,48.32,67.07,35,0
    .goto Wetlands,50.14,72.10,30,0
    .goto Loch Modan,25.4,10.6,30 >>前往: |cRXP_PICK_洛克莫丹|r
    .zone Loch Modan >>|cRXP_WARN_前往: |cRXP_PICK_洛克莫丹|r|r
step << !Hunter NightElf
    #xprate <1.5
    .goto Loch Modan,46.05,13.61
    .target Chief Engineer Hinderweir VII
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_主工程师辛德维尔七世|r交谈
    .accept 250 >>接任务: |cRXP_LOOT_水坝危机|r
step << !Hunter NightElf
    #xprate <1.5
    .goto Loch Modan,56.05,13.24
    >>点击|cRXP_PICK_可疑的桶|r
    .turnin 250 >>交任务: |cRXP_FRIENDLY_水坝危机|r
    .accept 199 >>接任务: |cRXP_LOOT_水坝危机|r
step << !Hunter NightElf
    #xprate <1.5
    .goto Loch Modan,46.05,13.61
    .target Chief Engineer Hinderweir VII
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_主工程师辛德维尔七世|r交谈
    .turnin 199 >>交任务: |cRXP_FRIENDLY_水坝危机|r
step << !Hunter NightElf
    #xprate <1.5
    #softcore
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step << !Hunter NightElf
    #xprate <1.59
    .goto Loch Modan,33.938,50.954
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索格拉姆|r交谈
    .fp Thelsamar >>获取塞尔萨玛的飞行路径
    .target Thorgrum Borrelson
step << !Hunter NightElf
    #xprate <1.59
    .goto Loch Modan,21.30,68.60,40,0
    .goto Loch Modan,19.11,62.11,25,0
    .goto Dun Morogh,86.04,51.05,20 >>前往: |cRXP_PICK_丹莫罗|r
    .zoneskip Ironforge
    .zoneskip Dun Morogh
step << !Hunter NightElf
    #xprate <1.59
    .goto Dun Morogh,55.13,34.91
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
step << skip --logout skip !Hunter NightElf
    #xprate <1.59
    .goto Dun Morogh,70.66,56.70,40,0
    .goto Dun Morogh,70.60,54.87
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r，前往西边的穴居人洞穴，在入口附近的钻孔机顶部注销，执行注销跳过，将你传送到铁炉堡
    .link https://www.youtube.com/watch?v=kbUSo62CfAM >>点击此处参考
step << !Hunter NightElf
    #xprate <1.59
    .goto Ironforge,55.51,47.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gryth|r交谈
    .fp Ironforge >>获取铁炉堡的飞行点
    .target Gryth Thurden



----End of <1.59x Night Elf Wetlands->IF Transition----



step << skip --logout skip !Hunter
    #xprate <1.59
    #completewith next
    #optional
    .goto Ironforge,56.23,46.83,0
    .goto Ironforge,78.00,52.00,20 >>|cRXP_WARN_通过跳上狮鹫头部之一来执行登出跳过, 然后退出再重新登录|r
    .link https://www.youtube.com/watch?v=PWMJhodh6Bw >>|cRXP_WARN_点击此处查看视频攻略|r
step << !Hunter
    #xprate <1.59
    #completewith next
    .goto Ironforge,67.84,42.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考格斯宾|r交谈
    .vendor >>|cRXP_WARN_购买|r|T133024:0|t[青铜管]
    >>|cRXP_WARN_这是一个限量供应的物品. 如果|cRXP_FRIENDLY_考格斯宾|r没有此物品, 请跳过此步骤|r
--  >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .bronzetube
    .target Gearcutter Cogspinner
step << !Hunter
    #xprate <1.59
    .goto Ironforge,78.00,52.00,5,0
    .zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
    >>|cRXP_WARN_在等待电车时, 如有需要, 请先将|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_提升至当前等级|r
    >>|cRXP_WARN_你需要|r|T135966:0|t[急救]|cRXP_WARN_达到80级才能接取24级的任务 << Rogue !Dwarf




----End of <1.59x Redridge Transition----




]])

----Start of <1.59x Redridge----
----2x and ALL Hunters stay in Darkshore/Ashen and grind----

RXPGuides.RegisterGuide([[
#xprate <1.59
#classic
#season 0,1
#version 1
<< Alliance !Hunter
#group RestedXP 联盟 1-20级
#displayname RestedXP 联盟 1-20级 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#name 19-20 赤脊山谷
#next 20-21 黑海岸/灰谷

step
    #completewith BMenace
    .goto StormwindClassic,55.21,7.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利巴布·旋轮|r交谈
    .vendor >>|cRXP_WARN_购买|r|T133024:0|t[青铜管]
    >>|cRXP_WARN_这是一件限量供应物品. 如果|cRXP_FRIENDLY_比利巴布·旋轮|r没有, 請跳過此步驟|r
--    >>你稍后完成任务时需要 2 个青铜管 << Rogue
    .bronzetube
    .target Billibub Cogspinner
step
    .goto StormwindClassic,55.510,12.504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沉默的舒尼|r交谈
    .accept 2040 >>接任务: |cRXP_WARN_地底突袭|r
    .target Shoni the Shilent
    .dungeon DM
step << !NightElf
    .goto StormwindClassic,58.08,16.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
    .target Furen Longbeard
    .isOnQuest 1338
step
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔德·蓟草|r交谈
    .accept 167 >>接任务: |cRXP_WARN_我的兄弟……|r
    .accept 168 >>接任务: |cRXP_WARN_收集记忆|r
    .target Wilder Thistlenettle
    .dungeon DM
step << !NightElf
    #xprate <1.5
    .goto StormwindClassic,49.194,30.284
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈
    .turnin 399 >>交任务: |cRXP_FRIENDLY_童年的记忆|r
    .target Baros Alexston
    .isQuestComplete 399
--XX Westfall 1x only
step << Mage
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >>前往法师塔
step << Mage
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >>训练你的职业法术
    .target Elsharin
step << Paladin/Priest !NightElf
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Paladin
    #label PalTrainer
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
step << Priest !NightElf
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r谈话
    .trainer >>训练你的职业法术
    .target Brother Joshua
step << Warlock/Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    >>|cRXP_WARN_购买 a|r|T135139:0|t[燃烧魔杖]|cRXP_WARN_如果它是升级品|r
    >>|cRXP_WARN_购买一根非暗影伤害的法杖非常重要, 之后你会遇到对暗影伤害有抗性的怪物|r
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    .collect 5210,1
    .target Ardwyn Cailen
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Osborne|r交谈
    >>|cRXP_WARN_确保你训练|r|T136058:0|t[开锁技能] |cRXP_WARN_, 因为你很快就会需要它来完成潜行者职业任务|r
    .trainer >>训练你的职业法术
    .train 1804 >>训练 |T136058:0|t[撬锁]
    .target Osborne the Night Man
step << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >>进入SI:7总部, 沿楼梯向上前往|cRXP_FRIENDLY_“剃刀”雷吉克|r
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“剃刀”雷吉克|r交谈
    .accept 2281 >>接任务: |cRXP_LOOT_赤脊山的联络员|r
    .goto StormwindClassic,75.76,60.35
    .target Renzik "The Shiv"
step << Warrior !NightElf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >>训练你的职业法术
    .target Wu Shen
    .target Ilsa Corbin
step
    .goto StormwindClassic,57.12,57.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .train 201 >>学习1小时剑术 << Mage/Rogue/Warlock
    .train 1180 >>学习匕首技能 << Mage/Druid
    .train 202 >>学习两小时剑术 << Warrior/Paladin
    .target Woo Ping
step << Human Paladin
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯蒂芬妮·特纳|r交谈
    .turnin 1643 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Stephanie Turner
    .accept 1644 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1644 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    >>|cRXP_WARN_你需要 10 |T132889:0|t[亚麻布]|r
--  .accept 1780 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Rogue
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_BUY_从拍卖行购买|r |T135342:0|t[波刃短剑] |cRXP_BUY_或更优的物品|r
    >>|cRXP_WARN_达到19级后装备它|r
    .collect 2209,1 --Kris
    .target Marda Weller
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
    .target Marda Weller
step << Rogue
    #optional
    #completewith next
    +|cRXP_WARN_装备|r|T135342:0|t[波刃短剑]
    .use 2209
    .itemcount 2209,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.89
    .xp <19,1
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>稍后为你的 |T132290:0|t[毒药] 任务购买 |T134437:0|t[抗毒药剂], 其余物品则用于在赤脊山更快地交任务 << !Dwarf Rogue
    >>请尽快在赤脊山购买以下物品, 以便更快地提交任务 << !Rogue/Dwarf Rogue
    >>这将节省你的时间, 因为你无需到处寻找怪物击杀. 如果你想不购买任何物品, 请跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf Rogue
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target Auctioneer Jaxon
    .dungeon !DM
step << !Human !Warlock
    #completewith start
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .goto StormwindClassic,66.27,62.12
    .fp Stormwind >>获取暴风城飞行路径
    .target Dungar Longdrink
step << NightElf
    .goto StormwindClassic,73.2,92.1
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
step << !NightElf
#xprate <1.5 << Dwarf/Gnome
.dungeon DM
    #completewith next
    .goto StormwindClassic,66.27,62.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink
    .zoneskip Westfall
step << !NightElf
#xprate <1.5 << Dwarf/Gnome
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .goto Westfall,56.33,47.52
    .target Gryan Stoutmantle
step << !NightElf
#xprate <1.5 << Dwarf/Gnome
.dungeon DM
    .goto Westfall,56.55,52.64,-1
    .goto StormwindClassic,66.27,62.12,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r或|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Redridge >>飞往赤脊山脉
    .target Thor
    .target Dungar Longdrink
step << !Human
#xprate >1.49 << Dwarf/Gnome
.dungeon DM
    #completewith WestEntry
    .goto Westfall,59.95,19.35
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step << !Human
#xprate >1.49 << Dwarf/Gnome
.dungeon DM
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fp Sentinel Hill >>获取哨兵岭的飞行点
    .target Thor
step << Gnome Warlock
#xprate >1.49
.dungeon DM
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Redridge >>飞往赤脊山
    .target Thor
step << !Human
#xprate >1.49 << Dwarf/Gnome
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .goto Westfall,56.33,47.52
    .target Gryan Stoutmantle
step << NightElf Warrior/NightElf Priest
    #completewith next
    .goto Elwynn Forest,41.08,65.76,25 >>前往闪金镇 << Warrior
    .goto Elwynn Forest,43.17,65.70,15 >>前往闪金镇 << Priest
step << NightElf Warrior
    .goto Elwynn Forest,41.08,65.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱莉娅|r交谈
    .trainer >>训练你的职业法术
    .target Lyria Du Lac
step << NightElf Priest
    >>前往旅店. 上楼
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女牧师洁塞塔|r交谈
    .goto Elwynn Forest,43.17,65.70,12,0
    .goto Elwynn Forest,43.80,66.47,8,0
    .goto Elwynn Forest,43.28,65.72
    .trainer >>训练你的职业法术
    .target Priestess Josetta
step << !Human !Warlock
    #xprate >1.49 << !NightElf
    .xp <20,1
    >>前往阿佐拉之塔
    .goto Elwynn Forest,65.20,69.80
    .target Theocritus
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞欧克瑞图斯|r交谈
    .accept 94 >>接任务: |cRXP_LOOT_法师的眼线|r
step << !NightElf
.dungeon !DM
    #xprate <1.5 << !Human
    #completewith next
    .goto StormwindClassic,66.27,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Redridge >>飞往赤脊山脉
    .target Dungar Longdrink
step << !Human !Warlock
    #xprate >1.49 << Gnome/Dwarf
    #completewith next
    #label start
    .goto Redridge Mountains,15.27,71.45
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step << !Human !Warlock
    #xprate >1.49 << Gnome/Dwarf
    .goto Redridge Mountains,15.27,71.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
    .target Guard Parker
step << !Human !Warlock
    #xprate >1.49 << Gnome/Dwarf
    .goto Redridge Mountains,30.73,59.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .target Deputy Feldon
step << NightElf
    #xprate <1.5
    .goto Redridge Mountains,30.73,59.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .target Deputy Feldon
    .accept 246 >>接任务: |cRXP_LOOT_审时度势|r
step
.dungeon DM
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_黑衣威利|r交谈
    .turnin 65 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 132 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
	.target Wiley the Black
step
.dungeon DM
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_所罗门镇长|r交谈
	.target Magistrate Solomon
    .accept 120 >>接任务: |cRXP_LOOT_送往暴风城的信|r
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .accept 118 >>接任务: |cRXP_LOOT_马掌|r
step
.dungeon DM
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fly Westfall >>飞往西部荒野
    .target Ariena Stormfeather
step
.dungeon DM
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 132 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 135 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
step
.dungeon DM
    #completewith next
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
step
.dungeon DM
    .goto Stormwind City,75.78,59.84
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .turnin 135 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 141 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Master Mathias Shaw
step
.dungeon DM
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink
step
.dungeon DM
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 141 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 142 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
step
.dungeon DM
    #completewith next
    .goto Westfall,44.50,69.62,55 >>前往月溪镇
step
.dungeon DM
    .goto Westfall,44.50,69.62
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>击杀|cRXP_ENEMY_迪菲亚信使|r, 搜刮出他的|cRXP_LOOT_神秘信息|r
    >>|cRXP_WARN_|cRXP_ENEMY_迪菲亚信使|r 会在月溪镇生成. 他会沿着月溪镇以北的道路, 前往金海岸采石场和江戈洛德矿场. 如果你在路上没有看到他, 请等待他在月溪镇重新出现|r
    >>|cRXP_WARN_他有4到5分钟的刷新时间|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan Defias Messenger
step
.dungeon DM
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 142 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
step
.dungeon DM
    .goto Westfall,55.68,47.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪菲亚叛徒|r交谈
    >>|cRXP_WARN_如果他不在那里, 你可能需要等待|cRXP_FRIENDLY_迪菲亚叛徒|r生成|r
    .accept 155 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target The Defias Traitor
step
.dungeon DM
    .goto Westfall,42.56,71.71
    >>护送|cRXP_FRIENDLY_迪菲亚叛徒|r到死亡矿井
    >>|cRXP_WARN_时刻待在|cRXP_FRIENDLY_迪菲亚叛徒|r身边！抵达月溪镇后, 随时准备对抗|cRXP_ENEMY_迪菲亚|r|r
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target The Defias Traitor
step
.dungeon DM
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 155 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 166 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target Gryan Stoutmantle
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔顶的哨兵瑞尔|r交谈
    .accept 214 >>接任务: |cRXP_WARN_红色丝质面罩|r
    .goto Westfall,56.67,47.35
    .target Scout Riell
step
.dungeon DM
    .goto Westfall,60.4,72.2
    .goto Westfall,40.4,71.6
    .subzone 1581 >>现在你应该寻找一个团队前往死亡矿井
    >>在组建死亡矿井队伍的同时刷豺狼人
step
.dungeon DM
    .goto Westfall,42.55,71.69
    .subzone 1581 >>前往死亡矿井
step
.dungeon DM
    #completewith EnterDM
    >>击杀|cRXP_ENEMY_Defias|r. 搜刮他们的|cRXP_LOOT_Bandanas|r
    >>|cRXP_WARN_你可以在进入地下城后完成此任务|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
step
.dungeon DM
    #completewith next
    >>击杀|cRXP_ENEMY_骷髅矿工|r和|cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r, 掠夺他们的|cRXP_LOOT_卡片|r
    >>|cRXP_WARN_这是在副本外完成的|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_工头希斯耐特|r. 从他身上搜刮|cRXP_LOOT_勋章|r
    >>|cRXP_WARN_这是在副本外完成的|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan Foreman Thistlenettle
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_骷髅矿工|r和|cRXP_ENEMY_亡灵爆破者|r和|cRXP_ENEMY_亡灵挖掘者|r, 掠夺他们的|cRXP_LOOT_卡片|r
    >>|cRXP_WARN_这是在副本外完成的|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
step
.dungeon DM
    #label EnterDM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >>进入死亡矿井副本
step
.dungeon DM
    #completewith DMend
    >>击杀死亡矿井内的|cRXP_ENEMY_Defias|r, 搜刮他们掉落的|cRXP_LOOT_Bandanas|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
step
.dungeon DM
    >>击杀|cRXP_ENEMY_斯尼德|r. 击败他后搜刮出|cRXP_LOOT_小型高能发动机|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)
step
.dungeon DM
    >>击杀|cRXP_ENEMY_艾德温·范克里夫|r, 搜刮他的|cRXP_LOOT_头颅|r和 |T133471:0|t[|cRXP_LOOT_未寄出的信|r]
    >>|cRXP_WARN_使用 |T133471:0|t[|cRXP_LOOT_未寄出的信|r] 开始任务|r
    .collect 2874,1,373 -- An Unsent Letter (1)
    .complete 166,1 -- Head of VanCleef (1)
    .accept 373 >>接任务: |cRXP_WARN_未寄出的信|r
    .use 2874 -- An Unsent Letter
step
.dungeon DM
    #label DMend
    #completewith next
    .goto Westfall,56.33,47.52,100 >>前往哨兵岭
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_格里安·斯托曼和哨兵瑞尔|r交谈
    .turnin 166 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target +Gryan Stoutmantle
    .goto Westfall,56.33,47.52
    .turnin -214 >>交任务: |cRXP_FRIENDLY_红色丝质面罩|r
    .target +Scout Riell
    .goto Westfall,56.67,47.35
step
.dungeon DM
    #completewith next
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
step
.dungeon DM
    .goto StormwindClassic,63.982,75.338
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 交谈
    .turnin 120 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
    .accept 121 >>接任务: |cRXP_LOOT_送往暴风城的信|r
    .target General Marcus Jonathan
step << Mage
.dungeon DM
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >>前往法师塔
step << Mage
.dungeon DM
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >>训练你的职业法术
    .target Elsharin
step << Mage
.dungeon DM
    .goto StormwindClassic,39.68,79.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉瑞麦尼|r交谈
    .train 3561 >>坐火车 |T135763:0|t[传送:暴风城]
	.xp <20,1
    .target Larimaine Purdue
step << Warlock
.dungeon DM
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
.dungeon DM
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Warlock
.dungeon DM
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .accept 1716 >>接任务: |cRXP_LOOT_噬魂者|r
    .target Gakin the Darkbinder
    .xp <20,1
step
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿古斯·夜语|r交谈
    .accept 3765 >>接任务: |cRXP_LOOT_遥远的旅途|r
    .target Argos Nightwhisper
    .dungeon DM
step << Druid
.dungeon DM
    #season 2
    #completewith next
    +|cRXP_WARN_一旦获得符文, 你应该准备切换到|r|T132276:0|t[野性]|cRXP_WARN_而非继续使用|r|T136096:0|t[平衡]|cRXP_WARN_技能, 例如|r|T132135:0|t[撕裂]|cRXP_WARN_和|r|T236167:0|t[狂暴咆哮]
step << Druid
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙德拉斯·月树|r谈话
    .goto StormwindClassic,20.89,55.50
    .trainer >>训练你的职业法术
    .train 768 >>训练 |T132115:0|t[猫形态]
    .target Sheldras Moontree
step << Paladin/Priest
.dungeon DM
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Paladin
.dungeon DM
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈. 他会给你一本|T133739:0|t[|cRXP_LOOT_勇气之书|r]
    use 6776 >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_勇气之书|r] 开始任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Duthorian Rall
step << Paladin
.dungeon DM
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1649 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1650 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Duthorian Rall
step << Paladin
.dungeon DM
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
step << Priest
.dungeon DM
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r谈话
    .trainer >>训练你的职业法术
    .target Brother Joshua
step
.dungeon DM
    .goto StormwindClassic,48.079,30.913,10,0
    .goto StormwindClassic,49.193,30.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈
    .turnin 373 >>交任务: |cRXP_FRIENDLY_未寄出的信|r
    .accept 389 >>接任务: |cRXP_WARN_巴吉尔·特雷德|r
    .target Baros Alexston
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔德·蓟草|cRXP_FRIENDLY_和|r沉默的舒尼|cRXP_FRIENDLY_交谈
    .turnin 167 >>交任务: |cRXP_FRIENDLY_我的兄弟……|r
    .turnin 168 >>交任务: |cRXP_FRIENDLY_收集记忆|r
    .target +Wilder Thistlenettle
    .goto StormwindClassic,65.438,21.175
    .turnin 2040 >>交任务: |cRXP_FRIENDLY_地底突袭|r
    .target +Shoni the Shilent
    .goto StormwindClassic,55.510,12.504    
step << Rogue
.dungeon DM
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Osborne|r交谈
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
step << Rogue
.dungeon DM
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >>进入瑞兹尔·铜栓总部, 沿楼梯向上前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r
step << Rogue
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .accept 2360 >>接任务: |cRXP_LOOT_马迪亚斯和迪菲亚潜行者|r
    .goto StormwindClassic,75.78,59.84
    .target Master Mathias Shaw
step << Warrior
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >>训练你的职业法术
    .target Wu Shen
    .target Ilsa Corbin
step << Rogue
.dungeon DM
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_购买 a|r|T135324:0|t[长剑]|cRXP_WARN_并在21级时装备它|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的物品, 就买一些|r
    .collect 923,1 --Longsword (1)
    .target Marda Weller
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
step << Rogue
.dungeon DM
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_购买 a|r|T135324:0|t[长剑]|cRXP_WARN_并在21级时装备它|r
    .collect 923,1 --Longsword (1)
    .target Marda Weller
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
step << Rogue
.dungeon DM
    #optional
    #completewith next
    +|cRXP_WARN_装备|r|T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
step << Warrior/Paladin
.dungeon DM
    #ah
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_WARN_如果你有足够的钱, 可以买 a|r|T135280:0|t[微光重剑]|cRXP_WARN_. 在21级时装备它|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的物品, 就买一些|r
    .collect 922,1 --Dacian Falx (1)
    .target Gunther Weller
    .money <1.2038
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0
step << Warrior/Paladin
.dungeon DM
    #ssf
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_WARN_如果你有足够的钱, 可以买 a|r|T135280:0|t[微光重剑]|cRXP_WARN_. 在21级时装备它|r
    .collect 922,1 --Dacian Falx (1)
    .target Gunther Weller
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_典狱官塞尔沃特|cRXP_FRIENDLY_典狱官塞尔沃特|r交谈
    .turnin 389 >>交任务: |cRXP_FRIENDLY_巴吉尔·特雷德|r
--  .accept 391 >>接任务: |cRXP_WARN_监狱暴动|r
    .target Warden Thelwater
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>稍后为你的 |T132290:0|t[毒药] 任务购买 |T134437:0|t[抗毒药剂], 其余物品则用于在赤脊山更快地交任务 << !Dwarf Rogue
    >>请尽快在赤脊山购买以下物品, 以便更快地提交任务 << !Rogue/Dwarf Rogue
    >>这将节省你的时间, 因为你无需到处寻找怪物击杀. 如果你想不购买任何物品, 请跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf Rogue
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target Auctioneer Jaxon
    .dungeon DM
step
.dungeon DM
    #completewith next
    .goto Elwynn Forest,32.240,49.723,60 >>前往: |cRXP_PICK_艾尔文森林|r
    .isOnQuest 118
    .xp <20,1
step
.dungeon DM
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
	.target Smith Argus
    .turnin 118 >>交任务: |cRXP_FRIENDLY_马掌|r
    .accept 119 >>接任务: |cRXP_LOOT_回复弗纳|r
    .isOnQuest 118
    .xp <20,1
step
.dungeon DM
    .isQuestTurnedIn 118
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
	.target Smith Argus
    .accept 119 >>接任务: |cRXP_LOOT_回复弗纳|r
    .xp <20,1
step
.dungeon DM
    #completewith next
    .subzone 91 >>前往阿佐拉塔. 攀登塔楼
    .xp <20,1
step
.dungeon DM
    .goto Elwynn Forest,65.22,69.71
    .target Theocritus
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与位于顶部的|cRXP_FRIENDLY_塞欧克瑞图斯|r交谈
    .accept 94 >>接任务: |cRXP_LOOT_法师的眼线|r
    .xp <20,1
step
.dungeon DM
    .goto Elwynn Forest,64.880,69.192
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_当恩·布赖特斯塔|r交谈
    .vendor >>|cRXP_FRIENDLY_当恩·布赖特斯塔|r|cRXP_BUY_拥有有限供应的物品, 例如|r|T134938:0|t|T134937:0|t|T134943:0|t[卷轴] |cRXP_BUY_和|r|T134850:0|t|T134830:0|t[药水] |cRXP_BUY_, 如果 available(可购买), 建议优先购买|r << !Warrior !Rogue
    .vendor >>|cRXP_FRIENDLY_当恩·布赖特斯塔|r|cRXP_BUY_有有限供应的物品, 例如|r|T134938:0|t|T134937:0|t|T134943:0|t[卷轴] |cRXP_BUY_和|r|T134830:0|t[药水] |cRXP_BUY_, 如果 available 就应该购买|r << Warrior/Rogue
    .target Dawn Brightstar
    .subzoneskip 91,1
step
.dungeon DM
    #completewith FlyR
	.goto Redridge Mountains,6.7,72.4
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r

step
.dungeon DM
    #xprate <1.5
    #label GParker
    .goto Redridge Mountains,15.27,71.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
    .target Guard Parker
step
.dungeon DM
    #xprate <1.5
    .goto Redridge Mountains,30.73,59.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .target Deputy Feldon


step
    #label BMenace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .goto Redridge Mountains,33.50,48.97
    .accept 20 >>接任务: |cRXP_LOOT_黑石氏族的威胁|r
    .target Marshal Marris
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .goto Redridge Mountains,32.13,48.63
    .accept 125 >>接任务: |cRXP_LOOT_丢失的工具|r
    .target Foreman Oslow
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .accept 118 >>接任务: |cRXP_LOOT_马掌|r
step
.dungeon DM
#xprate >1.49
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .turnin 119 >>交任务: |cRXP_FRIENDLY_回复弗纳|r
    .accept 124 >>接任务: |cRXP_LOOT_豺狼人的乱吠|r
step
.dungeon DM
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .turnin 119 >>交任务: |cRXP_FRIENDLY_回复弗纳|r
    .accept 124 >>接任务: |cRXP_LOOT_豺狼人的乱吠|r
    .accept 122 >>接任务: |cRXP_LOOT_雏龙的鳞片|r
step
.dungeon DM
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 交谈
	.target General Marcus Jonathan
    .goto StormwindClassic,63.982,75.338
    .turnin 120 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
    .accept 121 >>接任务: |cRXP_LOOT_送往暴风城的信|r
step
.dungeon !DM
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_所罗门镇长|r交谈
	.target Magistrate Solomon
    .accept 120 >>接任务: |cRXP_LOOT_送往暴风城的信|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
	.target Dockmaster Baren
    .goto Redridge Mountains,27.70,47.40
    .accept 127 >>接任务: |cRXP_LOOT_卖鱼|r
step
#xprate <1.5
    .goto Redridge Mountains,26.80,44.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达希|r交谈
    >>|cRXP_FRIENDLY_达希|r|cRXP_WARN_在旅店内部来回走动|r
	.target Darcy
    .accept 129 >>接任务: |cRXP_LOOT_免费的午餐|r
step
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_楼上黑衣威利|r交谈
	.target Wiley the Black
    .turnin 65 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .isOnQuest 65
step
#optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r交谈
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target Chef Breanna
step << Warlock
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
	.target Martie Jainrose
    .goto Redridge Mountains,21.85,46.32
    .accept 34 >>接任务: |cRXP_LOOT_不速之客|r
step << Warlock
    .goto Redridge Mountains,15.68,49.30
    >>击杀|cRXP_ENEMY_贝利格拉布|r. 击败他后搜刮他的|cRXP_LOOT_牙齿|r
    >>|cRXP_WARN_风筝 |cRXP_ENEMY_贝利格拉布|r返回湖畔镇, 以便 |cRXP_FRIENDLY_守卫|r协助你击杀 |cRXP_ENEMY_贝利格拉布|r|r
    >>|cRXP_WARN_这个任务非常困难. 你可以跳过这一步, 稍后再回来做|r
    .complete 34,1 -- Bellygrub's Tusk (1)
    .link https://youtu.be/6JE967OG3CU?t=1845 >>|cRXP_WARN_点击此处查看视频攻略|r
    .mob Bellygrub
step << Warlock
    .goto Redridge Mountains,21.85,46.32
    .target Martie Jainrose
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
    .turnin 34 >>交任务: |cRXP_FRIENDLY_不速之客|r
step << Rogue
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢修斯|r交谈
    .turnin 2281 >>交任务: |cRXP_FRIENDLY_赤脊山的联络员|r
    .accept 2282 >>接任务: |cRXP_LOOT_奥瑟尔伐木场|r
    .target Lucius
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖恩|r交谈
	.target Shawn
    .goto Redridge Mountains,29.31,53.63
    .accept 3741 >>接任务: |cRXP_LOOT_希拉里的项链|r
step
    >>|cRXP_WARN_跳入湖中|r
    >>打开|cRXP_PICK_闪光的泥浆|r, 从中获取|cRXP_LOOT_希拉里的项链|r
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
	.target Hilary
    .goto Redridge Mountains,29.24,53.63
    .turnin 3741 >>交任务: |cRXP_FRIENDLY_希拉里的项链|r
step
    #softcore
    >>打开|cRXP_PICK_沉没的箱子|r, 搜刮出|cRXP_LOOT_奥洛斯的工具箱|r
    .goto Redridge Mountains,41.52,54.68
    .complete 125,1 --Oslow's Toolbox (1)
step
    #xprate <1.5
    #sticky
    #completewith orcs
    >>击杀|cRXP_ENEMY_巨型血牙野猪|r. 击败后可获得其|cRXP_LOOT_巨型血牙野猪头|r
    >>击杀|cRXP_ENEMY_狼蛛|r. 击败后可获得其掉落的|cRXP_LOOT_香脆蜘蛛肉|r
    >>击杀|cRXP_ENEMY_恐鹫|r. 击败它们后掠夺|cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_在完成“赤脊山炖肉”任务之前, 请勿出售任何这些物品|r
    >>|cRXP_WARN_拾取任何|r |T133970:0|t|cRXP_LOOT_[野猪碎肉]|r |cRXP_WARN_你拾取的越多, 越有助于提升烹饪技能|r |T133971:0|t[烹饪] |cRXP_WARN_至50级, 这是后续进入暮色森林所必需的|r
    .collect 2296,5,92,1
    .collect 1080,5,92,1
    .collect 1081,5,92,1
    .mob Great Goretusk
    .mob Tarantula
    .mob Dire Condor
step
    #xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
	.target Guard Parker
    .goto Redridge Mountains,15.30,71.50
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
step
    #xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
	.target Guard Parker
    .goto Redridge Mountains,15.27,71.45
    .turnin 129 >>交任务: |cRXP_FRIENDLY_免费的午餐|r
    .accept 130 >>接任务: |cRXP_LOOT_寻访草药师|r
step
    #xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
	.target Deputy Feldon
    .goto Redridge Mountains,30.70,60.00
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .accept 246 >>接任务: |cRXP_LOOT_审时度势|r
step
    #xprate <1.5
    .goto Redridge Mountains,21.22,67.77,45,0
    .goto Redridge Mountains,17.70,73.39,45,0
    .goto Redridge Mountains,11.20,76.31,45,0
    .goto Redridge Mountains,13.37,81.48,45,0
    .goto Redridge Mountains,18.86,73.63
    >>击杀|cRXP_ENEMY_狼蛛|r. 击败后可获得其掉落的|cRXP_LOOT_香脆蜘蛛肉|r
    .collect 1081,5,92,1
    .mob Tarantula
step
    #xprate <1.5
    .goto Redridge Mountains,29.49,82.80,45,0
    .goto Redridge Mountains,32.52,81.78,45,0
    .goto Redridge Mountains,43.18,72.22,45,0
    .goto Redridge Mountains,31.13,82.18
	>>击杀|cRXP_ENEMY_混血赤脊山豺狼人|r 和|cRXP_ENEMY_赤脊山偷猎者|r
    .complete 246,1 --Redridge Mongrel (10)
    .mob +Redridge Mongrel
    .complete 246,2 --Redridge Poacher (6)
	.mob +Redridge Poacher
step
    .goto Redridge Mountains,49.0,70.0
    >>击杀 |cRXP_ENEMY_鱼人巡滩者|r和 |cRXP_ENEMY_鱼人小招潮者|r. 击败它们后搜刮掉落的 |cRXP_LOOT_鳍|r和 |cRXP_LOOT_阳光鱼|r
	>>|cRXP_WARN_请注意, 此区域为高频率刷新区, 意味着|cRXP_ENEMY_鱼人|r会快速重生|r
    .complete 127,1
    .collect 1468,8,150,1
    .mob Murloc Shorestriker
    .mob Murloc Minor Tidecaller
step
    #xprate <1.5
    .goto Redridge Mountains,61.37,77.10
    >>击杀|cRXP_ENEMY_恐鹫|r. 击败它们后掠夺|cRXP_LOOT_硬秃鹫肉|r
    >>|cRXP_WARN_如果未看到任何|r|cRXP_ENEMY_恐鹫, 请跳过此步骤|r
    .collect 1080,5,92,1
    .mob Dire Condor
step
    #label orcs
    >>击杀|cRXP_ENEMY_黑石步兵|r和|cRXP_ENEMY_黑石前锋|r. 击败他们后搜刮其掉落的|cRXP_LOOT_斧头|r
	>>|cRXP_WARN_请注意, |cRXP_ENEMY_黑石前锋|r将对你施放 |T132149:0|t[缠网]|r
    .goto Redridge Mountains,74.00,79.00,60,0
    .goto Redridge Mountains,76.18,83.39,60,0
    .goto Redridge Mountains,77.80,68.50,60,0
    .goto Redridge Mountains,70.11,77.34,60,0
    .goto Redridge Mountains,74.00,79.00
    .complete 20,1 --Battleworn Axe (10)
    .mob Blackrock Grunt
	.mob Blackrock Outrunner
step
    #xprate <1.5
    .goto Redridge Mountains,61.37,77.10
    >>击杀|cRXP_ENEMY_恐鹫|r. 击败它们后掠夺|cRXP_LOOT_硬秃鹫肉|r
    .collect 1080,5,92,1
    .mob Dire Condor
step
    #hardcore
    >>|cRXP_WARN_跳入湖中|r
    >>打开|cRXP_PICK_沉没的箱子|r, 搜刮出|cRXP_LOOT_奥洛斯的工具箱|r
    .goto Redridge Mountains,41.52,54.68
    .complete 125,1 --Oslow's Toolbox (1)
step
    .goto Redridge Mountains,49.0,70.0
    .xp 20-7687 >>刷怪直到距离20级还差7687点经验值 << !Rogue
    .xp 20-10012 >>刷怪直到距离20级还差10012点经验值 << Rogue
step << Rogue
    #completewith next
    .subzone 97 >>前往奥瑟尔伐木场
step << Rogue
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_你必须为你的|r|T132290:0|t[毒药]|cRXP_WARN_quest 稍后完成此任务|r
    >>|cRXP_WARN_站在标记的路点位置, 调整相机和鼠标视角, 直到可以一次性点击3个|cRXP_PICK_Practice Lockboxes|r而无需移动任何位置|r
    .skill lockpicking,80 >>|cRXP_WARN_在奥瑟尔伐木场地面上打开|r|cRXP_PICK_Practice 锁匠练习箱|r, 直到你的|r|T136058:0|t[开锁]技能达到80|r
step << Rogue
	.goto Redridge Mountains,52.05,44.69
    >>打开|cRXP_PICK_卢修斯的箱子|r. 从中获取|cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery
    .skill lockpicking,<80,1
step
    #completewith next
    .goto Redridge Mountains,33.50,48.97,150 >>前往湖畔镇
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
	.target Marshal Marris
    .goto Redridge Mountains,33.50,48.97
    .turnin 20 >>交任务: |cRXP_FRIENDLY_黑石氏族的威胁|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
	.target Foreman Oslow
    .goto Redridge Mountains,32.13,48.63
    .turnin 125 >>交任务: |cRXP_FRIENDLY_丢失的工具|r
    .accept 89 >>接任务: |cRXP_LOOT_止水湖上的桥|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
	.target Dockmaster Baren
    .goto Redridge Mountains,27.72,47.38
    .turnin 127 >>交任务: |cRXP_FRIENDLY_卖鱼|r
    .accept 150 >>接任务: |cRXP_LOOT_鱼人偷猎者|r
    .turnin 150 >>交任务: |cRXP_FRIENDLY_鱼人偷猎者|r
    .xp <20,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
	.target Dockmaster Baren
    .goto Redridge Mountains,27.72,47.38
    .turnin 127 >>交任务: |cRXP_FRIENDLY_卖鱼|r
step
#optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r交谈
	.target Chef Breanna
    .goto Redridge Mountains,22.67,43.83
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
	.target Martie Jainrose
    .goto Redridge Mountains,21.86,46.33
    .turnin 130 >>交任务: |cRXP_FRIENDLY_寻访草药师|r
    .accept 131 >>接任务: |cRXP_LOOT_水仙诉衷情|r
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达希|r交谈
    >>|cRXP_FRIENDLY_达希|r|cRXP_WARN_在旅店内部来回走动|r
	.target Darcy
    .goto Redridge Mountains,26.80,44.30
    .turnin 131 >>交任务: |cRXP_FRIENDLY_水仙诉衷情|r
step << Rogue
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢修斯|r交谈
	.target Lucius
    .goto Redridge Mountains,28.07,52.02
    .turnin 2282 >>交任务: |cRXP_FRIENDLY_奥瑟尔伐木场|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希拉里|r交谈
	.target Hilary
    .goto Redridge Mountains,29.24,53.63
    .turnin 3741 >>交任务: |cRXP_FRIENDLY_希拉里的项链|r
step << Rogue
    #optional
	#completewith InRR
	.destroy 7907 >>摧毁: |cRXP_ENEMY_偷窃技能认证书|r
step
    #xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
	.target Deputy Feldon
    .goto Redridge Mountains,30.73,59.99
    .turnin 246 >>交任务: |cRXP_FRIENDLY_审时度势|r
step
    .goto Redridge Mountains,49.0,70.0
    .xp 20 >>刷怪直到你升到20级
step << Rogue
.dungeon DM
    #softcore
    .isOnQuest 2360
    .goto Redridge Mountains,30.59,59.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >>获取赤脊山飞行点 << !Human
    .fly Westfall >>飞往西部荒野
    .target Ariena Stormfeather
step
.dungeon !DM << Rogue
    #completewith InRR
    .goto Redridge Mountains,30.59,59.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
	.target Ariena Stormfeather
    .fp Redridge Mountains >>获取赤脊山飞行点 << !Human !Warlock
    .fly Stormwind >>飞往暴风城
step << Rogue
.dungeon !DM
    #ah
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_购买 a|r|T135324:0|t[长剑]|cRXP_WARN_并在21级时装备它|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的物品, 就买一些|r
    .collect 923,1 --Longsword (1)
    .target Marda Weller
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
step << Rogue
.dungeon !DM
    #ssf
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>|cRXP_WARN_购买 a|r|T135324:0|t[长剑]|cRXP_WARN_并在21级时装备它|r
    .collect 923,1 --Longsword (1)
    .target Marda Weller
    .money <0.8743
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.2
step << Rogue
.dungeon !DM
    #optional
    #completewith next
    +|cRXP_WARN_装备|r|T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.19
    .xp <21,1
step << Warrior/Paladin
.dungeon !DM
    #ah
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_WARN_如果你有足够的钱, 可以买 a|r|T135280:0|t[微光重剑]|cRXP_WARN_. 在21级时装备它|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的物品, 就买一些|r
    .collect 922,1 --Dacian Falx (1)
    .target Gunther Weller
    .money <1.2038
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0
step << Warrior/Paladin
.dungeon !DM
    #ssf
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_WARN_如果你有足够的钱, 可以买 a|r|T135280:0|t[微光重剑]|cRXP_WARN_. 在21级时装备它|r
    .collect 922,1 --Dacian Falx (1)
    .target Gunther Weller
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
    .goto StormwindClassic,27.2,78.1,15 >>前往已宰的羔羊并下楼
step << Warlock
.dungeon !DM
    .goto StormwindClassic,26.11,77.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .accept 1716 >>接任务: |cRXP_LOOT_噬魂者|r
    .target Gakin the Darkbinder
step << Mage
.dungeon !DM
    #completewith next
    .goto StormwindClassic,37.69,82.09,10 >>前往法师塔
step << Mage
.dungeon !DM
    .goto StormwindClassic,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔莎林|r交谈
    .trainer >>训练你的职业法术
    .target Elsharin
step << Mage
.dungeon !DM
    .goto StormwindClassic,39.68,79.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉瑞麦尼|r交谈
    .train 3561 >>坐火车 |T135763:0|t[传送:暴风城]
	.xp <20,1
    .target Larimaine Purdue
step
    .goto StormwindClassic,21.40,55.80
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿古斯·夜语|r交谈
    .accept 3765 >>接任务: |cRXP_LOOT_遥远的旅途|r
    .target Argos Nightwhisper
    .dungeon !DM
step << Druid
.dungeon !DM
    #season 2
    #completewith next
    +|cRXP_WARN_一旦获得符文, 你应该准备切换到|r|T132276:0|t[野性]|cRXP_WARN_而非继续使用|r|T136096:0|t[平衡]|cRXP_WARN_技能, 例如|r|T132135:0|t[撕裂]|cRXP_WARN_和|r|T236167:0|t[狂暴咆哮]
step << Druid
.dungeon !DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙德拉斯·月树|r谈话
    .goto StormwindClassic,20.89,55.50
    .trainer >>训练你的职业法术
    .train 768 >>训练 |T132115:0|t[猫形态]
    .target Sheldras Moontree
step << Paladin/Priest
.dungeon !DM
    #completewith next
    .goto StormwindClassic,42.51,33.51,20 >>前往暴风城大教堂
step << Paladin
.dungeon !DM
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈. 他会给你一本|T133739:0|t[|cRXP_LOOT_勇气之书|r]
    use 6776 >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_勇气之书|r] 开始任务|r
    .collect 6776,1,1649 --Tome of Valor (1)
    .accept 1649 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Duthorian Rall
step << Paladin
.dungeon !DM
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1649 >>交任务: |cRXP_FRIENDLY_勇气之书|r
    .accept 1650 >>接任务: |cRXP_LOOT_勇气之书|r
    .target Duthorian Rall
step << Paladin
.dungeon !DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .goto StormwindClassic,38.82,31.27,10,0
    .goto StormwindClassic,38.67,32.82
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
step << Priest
.dungeon !DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r谈话
    .goto StormwindClassic,38.54,26.86
    .trainer >>训练你的职业法术
    .target Brother Joshua
step << Rogue
.dungeon !DM
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Osborne|r交谈
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
step << Rogue
.dungeon !DM
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >>进入瑞兹尔·铜栓总部, 沿楼梯向上前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r
step << Rogue
.dungeon !DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    .accept 2360 >>接任务: |cRXP_LOOT_马迪亚斯和迪菲亚潜行者|r
    .goto StormwindClassic,75.78,59.84
    .target Master Mathias Shaw
step << Warrior
.dungeon !DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >>训练你的职业法术
    .target Wu Shen
    .target Ilsa Corbin



----Start of Rogue 20 Quest <1.59x Section----



step << NightElf Rogue
    .goto Westfall,56.55,52.64,5,0
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
    >>如果你已学会西部荒野的飞行路径, 可以直接飞过去
    .isOnQuest 2360
step << NightElf Rogue
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fp Westfall >>获取西部荒野的飞行路径
    .target Thor
    .isOnQuest 2360
step << !NightElf Rogue
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink
step << !Dwarf Rogue
    .goto Duskwood,15.90,72.10,60,0
    .goto Duskwood,14.86,64.56,50,0
    .goto Duskwood,10.43,53.97
    >>击杀|cRXP_ENEMY_小型结网毒蜘蛛|r和|cRXP_ENEMY_结网毒蜘蛛|r. 击败它们可获得|cRXP_LOOT_小毒囊|r和它们的|cRXP_LOOT_粘糊的蜘蛛腿|r
    >>|cRXP_WARN_你需要一个|cRXP_LOOT_小毒囊|r来制作|T134437:0 |t[抗毒药剂], 稍后用于移除|T136230:0 |t[赞吉尔之触]的负面效果|r
    >>|cRXP_WARN_稍后保存粘糊的蜘蛛腿|r|r
    >>|cRXP_WARN_如果你有一个|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_的朋友, 你可以跳过此步骤, 并请他们帮你移除|r
    .collect 1475,1,2359,1 -- Small Venom Sac (1)
    .collect 2251,6,93,1,1 -- Gooey Spider Legs (6)
    .disablecheckbox
    .mob Pygmy Venom Web Spider
    .mob Venom Web Spider
    .itemcount 6452,<1 --Anti Venom (<1)
step << Rogue
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请注意即将出现的章节==|r
    >>|cRXP_WARN_按 Esc 键, 然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用互动键”, 并将“与目标互动”选项绑定到一个按键|r
    >>|cRXP_WARN_此外, 建议你启用敌人姓名板(默认键:V), 这样可以让你看到塔内某些角落后方的敌人|r
step << Rogue
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密探吉尔妮|r交谈
    >>|cRXP_WARN_你必须完成这个任务|r|T132290:0|t[毒药]
    .turnin 2360 >>交任务: |cRXP_FRIENDLY_马迪亚斯和迪菲亚潜行者|r
    .accept 2359 >>接任务: |cRXP_LOOT_克拉文之塔|r
    .target Agent Kearnen
step << Rogue
    #label TowerKey
    #loop
    .goto Westfall,71.49,73.49,0
    .goto Westfall,71.01,75.72,0
    .goto Westfall,69.58,73.07,0
    .goto Westfall,71.49,73.49,30,0
    .goto Westfall,71.01,75.72,30,0
    .goto Westfall,69.58,73.07,30,0
    >>|T133644:0|t[劫掠]|cRXP_ENEMY_丑陋的迪菲亚懒汉|r. 将其击杀后获取|cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_您必须处于|r|T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r|T133644:0|t[盗贼技能:扒窃]
    >>|cRXP_WARN_|cRXP_ENEMY_丑陋的迪菲亚懒汉|r会在塔楼入口处生成, 然后在塔楼外围巡逻|r
    >>|cRXP_WARN_注意, 他会造成大量伤害. 如果你的|r|T132320:0|t[潜行]|cRXP_WARN_效果中断, 请迅速使用|r|T132307:0|t[冲刺]|cRXP_WARN_并逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频攻略
    .mob Malformed Defias Drone
step << Rogue
    #optional
    #completewith Mortwake
    +|cRXP_WARN_如果你尚未装备|r|T135641:0|t[曲木匕首]|cRXP_WARN_, 请为完成此任务装备|r|T135641:0|t[匕首]|r
    .use 15396
    .itemcount 15396,1
step << Rogue
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼的第二层顶层. 在处于|r|T132320:0|t[潜行]|cRXP_WARN_且|cRXP_ENEMY_Defias 塔哨兵|r不在你身边时, 跳上椅子, 再跳到灯上, 最后跳到路径点位置上方的书架上|r
    >>|cRXP_WARN_手动|r|T132320:0|t[解除隐身]|cRXP_WARN_, 然后按下你的“与目标互动”键绑定以开启|r|cRXP_PICK_暮色森林的箱子|r. 拾取其中的|r|cRXP_LOOT_克莱文·莫特韦克的日志|r|r
    >>|cRXP_WARN_注意:你的|r|T132320:0|t[潜行]|cRXP_WARN_在拾取物品后将暂时失效|r|cRXP_LOOT_克拉文·莫特韦克的日记|r
    >>|cRXP_WARN_如果你未能击杀二楼的|cRXP_ENEMY_Defias Tower Sentries|r, 要做好逃跑的准备. 当你站在书架顶部时(这是一个躲避点), 它们很可能会永久性地对你产生仇恨(但不会攻击你)|r
    >>|cRXP_WARN_如果你的背包里或装备中有|r|T135641:0|t[匕首]|cRXP_WARN_, 你可以对位于塔内的|cRXP_ENEMY_迪菲亚巡塔员|r和|cRXP_ENEMY_迪菲亚哨兵|r施放|r|T132282:0|t[伏击]|cRXP_WARN_, 立即击杀他们. 击杀第一个|cRXP_ENEMY_迪菲亚哨兵|r后, 请立刻准备逃跑, 并记住你可能会受到来自上方的攻击. 这种方法虽然较慢, 但安全得多|r
    >>|cRXP_WARN_请注意, 如果你必须从塔楼中跑出来, |cRXP_ENEMY_丑陋的迪菲亚懒汉|r 和 |cRXP_ENEMY_迪菲亚苦工|r 可能会出现在塔楼入口处|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频攻略
    .mob Defias Tower Patroller
    .mob Defias Tower Sentry
step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >>制作 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
step << !Dwarf Rogue
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 的负面效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
step << Dwarf Rogue
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石肤术] 以移除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .aura -9991
step << Rogue
    #optional
    #completewith KlavenEnd
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >>飞往暴风城
    .target Thor
step << !Dwarf Rogue
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >>前往|cRXP_FRIENDLY_珊娜·弗勒|r
    .aura -9991
step << !Dwarf Rogue
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果你有|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_好友, 请他们帮你移除|r|T136230:0|t[赞吉尔之触]|r
    .skill firstaid,80 >>|cRXP_WARN_将你的|r|T135966:0|t[急救]|cRXP_WARN_提升至80级|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
step << !Dwarf Rogue
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果你有|r|T626003:0|t|cFFF48CBAS圣骑士|r |cRXP_WARN_或|r|T625999:0|t|cFFFF7C0AD德鲁伊|r |cRXP_WARN_好友, 请他们帮你移除|r|T136230:0|t[赞吉尔之触]|r
    .train 7934 >>|cRXP_WARN_Train|r|T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >>制作 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
step << !Dwarf Rogue
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437:0|t[抗毒药剂] 来移除 |T136230:0|t[赞吉尔之触] 的负面效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
step << Rogue
    #optional
    #requires AntiVenomEnd2 << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,10 >>进入瑞兹尔·铜栓总部, 沿楼梯向上前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r
step << Rogue
    #label KlavenEnd
    #requires AntiVenomEnd2 << Rogue
    .goto StormwindClassic,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔大师|r交谈
    >>|cRXP_WARN_记得在切换到|r|T135641:0|t[匕首]|cRXP_WARN_earlier后, 重新装备你的主武器|r << Rogue
    .turnin 2359 >>交任务: |cRXP_FRIENDLY_克拉文之塔|r
    .target Master Mathias Shaw



----End of Rogue 20 Quest <1.59x Section----




step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马库斯·乔纳森将军|r 交谈
	.target General Marcus Jonathan
    .goto StormwindClassic,63.982,75.338
    .turnin 120 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
    .accept 121 >>接任务: |cRXP_LOOT_送往暴风城的信|r
step
    #completewith next
    .goto Elwynn Forest,41.80,65.60,60 >>前往闪金镇
step
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
	.target Smith Argus
    .turnin 118 >>交任务: |cRXP_FRIENDLY_马掌|r
    .accept 119 >>接任务: |cRXP_LOOT_回复弗纳|r
step
    #completewith next
    .goto Elwynn Forest,65.20,69.80,50 >>前往阿佐拉塔. 攀登塔楼
step
    .goto Elwynn Forest,65.22,69.71
    .target Theocritus
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与位于顶部的|cRXP_FRIENDLY_塞欧克瑞图斯|r交谈
    .accept 94 >>接任务: |cRXP_LOOT_法师的眼线|r
    .xp <20,1
step
    #label InRR
    #completewith FlyR
    .goto StormwindClassic,66.30,62.30,-1
	.goto Redridge Mountains,6.7,72.4,-1
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
    .fly Redridge >>飞往赤脊山
    >>|cRXP_WARN_如果你在闪金镇, 从暴风城飞行过来会更快|r
	>>|cRXP_WARN_如果你在阿佐拉塔, 直接前往赤脊山即可|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .turnin 119 >>交任务: |cRXP_FRIENDLY_回复弗纳|r
    .accept 124 >>接任务: |cRXP_LOOT_豺狼人的乱吠|r
step
    #xprate <1.2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .accept 122 >>接任务: |cRXP_LOOT_雏龙的鳞片|r
step
    #label FlyR
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官索拉曼|r交谈
	.target Magistrate Solomon
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    .turnin 121 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希拉里|r交谈
	.target Hilary
    .goto Redridge Mountains,29.24,53.63
    .turnin 3741 >>交任务: |cRXP_FRIENDLY_希拉里的项链|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
	.target Dockmaster Baren
    .goto Redridge Mountains,27.72,47.38
    .turnin 127 >>交任务: |cRXP_FRIENDLY_卖鱼|r
    .accept 150 >>接任务: |cRXP_LOOT_鱼人偷猎者|r
    .turnin 150 >>交任务: |cRXP_FRIENDLY_鱼人偷猎者|r
step
#optional
#xprate >1.49
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r交谈
	.target Chef Breanna
    .goto Redridge Mountains,22.67,43.83
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r交谈
	.target Chef Breanna
    .goto Redridge Mountains,22.67,43.83
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
	.target Martie Jainrose
    .goto Redridge Mountains,21.86,46.33
    .turnin 130 >>交任务: |cRXP_FRIENDLY_寻访草药师|r
    .accept 131 >>接任务: |cRXP_LOOT_水仙诉衷情|r
step
    #xprate <1.2
	#completewith next
	>>击杀 |cRXP_ENEMY_黑龙雏龙|r. 击败它们后搜刮其 |cRXP_LOOT_鳞片|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob Black Dragon Whelp
step
    #xprate <1.5
    >>击杀|cRXP_ENEMY_巨型血牙野猪|r. 击败后可获得其|cRXP_LOOT_巨型血牙野猪头|r
    >>|cRXP_WARN_拾取任何|r |T133970:0|t|cRXP_LOOT_[野猪碎肉]|r |cRXP_WARN_你拾取的越多, 越有助于提升烹饪技能|r |T133971:0|t[烹饪] |cRXP_WARN_至50级, 这是后续进入暮色森林所必需的|r
    .goto Redridge Mountains,15.73,52.83,60,0
    .goto Redridge Mountains,32.25,70.20,60,0
    .goto Redridge Mountains,31.02,72.14,60,0
    .goto Redridge Mountains,15.73,52.83
    .collect 2296,5,92,1
    .mob Great Goretusk
step
#optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师布雷纳|r交谈
	.target Chef Breanna
    .goto Redridge Mountains,22.67,43.83
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
step
    #xprate <1.2
	#completewith next
	>>击杀 |cRXP_ENEMY_黑龙雏龙|r. 击败它们后搜刮其 |cRXP_LOOT_鳞片|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob Black Dragon Whelp
step
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,22.5,35.7,0
    >>击杀|cRXP_ENEMY_赤脊山蛮兵|r 和|cRXP_ENEMY_赤脊山秘法师|r, 击败他们后搜刮其掉落的|cRXP_LOOT_铁矛|r 和|cRXP_LOOT_铁铆钉|r
    .complete 124,1 --Redridge Brute (10)
    .mob +Redridge Brute
    .complete 124,2 --Redridge Mystic (8)
    .mob +Redridge Mystic
    .complete 89,1 --Iron Pike (5)
    .mob +Redridge Mystic
	.mob +Redridge Brute
    .complete 89,2 --Iron Rivet (5)
	.mob +Redridge Mystic
	.mob +Redridge Brute
step
    #xprate <1.2
    .goto Redridge Mountains,43.47,31.68,50,0
    .goto Redridge Mountains,46.52,35.66,50,0
    .goto Redridge Mountains,34.56,65.79,50,0
    .goto Redridge Mountains,36.58,73.93
	>>击杀 |cRXP_ENEMY_黑龙雏龙|r. 击败它们后搜刮其 |cRXP_LOOT_鳞片|r
	.mob Black Dragon Whelp
    .complete 122,1 --Underbelly Whelp Scale (6)
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达希|r交谈
    >>|cRXP_FRIENDLY_达希|r|cRXP_WARN_在旅店内部来回走动|r
	.target Darcy
    .goto Redridge Mountains,26.80,44.30
    .turnin 131 >>交任务: |cRXP_FRIENDLY_水仙诉衷情|r
step
    #xprate <1.2
    #completewith next
    .goto Redridge Mountains,15.55,50.06,0
    .goto Redridge Mountains,19.24,41.53,0
    .goto Redridge Mountains,16.90,55.02,0
    .goto Redridge Mountains,26.52,44.95
    +|cRXP_WARN_升级你的|r |T133971:0|t[烹饪] |cRXP_WARN_使用之前你采集的|r |T133970:0|t|cRXP_LOOT_[野猪肉块]|r |cRXP_WARN_你需要等级达到50|r |T133971:0|t[烹饪]
    +|cRXP_WARN_如果你需要更多|r|T133970:0|t|cRXP_LOOT_[野猪肉块]|r|cRXP_WARN_前往西方附近|r|cRXP_ENEMY_贝利格拉布|r|cRXP_WARN_并击杀更多|r|cRXP_ENEMY_巨型血牙野猪|r|r
    .skill cooking,50,1
    .mob Great Goretusk
step
    #xprate <1.2
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,31.00,47.30
    .turnin 124 >>交任务: |cRXP_FRIENDLY_豺狼人的乱吠|r
    .turnin 122 >>交任务: |cRXP_FRIENDLY_雏龙的鳞片|r
step
    #xprate >1.0
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .turnin 124 >>交任务: |cRXP_FRIENDLY_豺狼人的乱吠|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
	.target Foreman Oslow
    .goto Redridge Mountains,32.10,48.70
    .turnin 89 >>交任务: |cRXP_FRIENDLY_止水湖上的桥|r
]])

----End of <1.59x Redridge----
----Start of Hunter-only Darkshore/Ashen (Needs to be merged)----

RXPGuides.RegisterGuide([[
#classic
#season 0,1
#version 1
#season 0
<< Alliance Hunter
#group RestedXP 联盟 1-20级
#name 19-21 黑海岸/灰谷
#displayname 19-21 黑海岸/灰谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next RestedXP 联盟 20-30/21-23 灰谷/石爪山脉

step
    #xprate >1.59
    .goto 1439,38.325,43.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈沙拉·夜语|r交谈
    .turnin 3765 >>交任务: |cRXP_FRIENDLY_遥远的旅途|r
    .target Gershala Nightwhisper
    .isOnQuest 3765
    .dungeon DM
step
    #xprate >1.49
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r, 击败它们后可获得|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
    .mob Reef Crawler
step
    #xprate >1.49
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    #xprate >1.49
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r, 掠夺其|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
step
    #xprate >1.49
    .goto 1439,31.690,83.700
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >>接任务: |cRXP_LOOT_搁浅的海龟|r
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
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r, 击败它们后可获得|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
    .mob Reef Crawler
step
    #xprate >1.49
    .goto 1439,31.229,85.564
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    #xprate >1.49
    #label SeaCreatureEnd
    .goto 1439,31.251,87.419
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_这个任务可能非常困难. 请逐个攻击|cRXP_ENEMY_鱼人|r, 否则可能会同时引燃多个目标的仇恨|r
    .link https://youtu.be/lfQM3Q-Ag5A >>|cRXP_WARN_点击此处查看视频攻略|r
step
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 951 >>交任务: |cRXP_FRIENDLY_玛塞斯特拉遗物|r
    .target Onu
    .isQuestComplete 731 --Only shows if Prospector was already escorted
step
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈以开启护送任务
    >>|cRXP_WARN_如果他不在那里, 请跳过此步骤. 他重生可能需要长达25分钟|r
    >>|cRXP_WARN_这是一个限时任务, 你必须在20分钟内护送他抵达灰谷|r
    .accept 5321 >>接任务: |cRXP_LOOT_昏昏欲睡|r
    .target Kerlonian Evershade
    .isQuestComplete 731 --Only shows if Prospector was already escorted
step
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开|cRXP_PICK_克罗尼亚的箱子|r. 拾取其中的 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .isQuestComplete 731 --Only shows if Prospector was already escorted
step
    #sticky
    #label prospector
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>|cRXP_WARN_你可能需要等待他重生, 或等待其他玩家完成护送任务|r
    .turnin 729 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .isOnQuest 729
    .target Prospector Remtravel
step
    .goto Darkshore,35.72,83.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>这将开始护送任务
    .accept 731,1 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    >>|cRXP_WARN_这个任务非常困难. 如果你无法组队或单人完成, 请跳过此步骤|r
    .link https://youtu.be/3d-htESNztE >>|cRXP_WARN_点击此处查看视频攻略|r
    .target Prospector Remtravel
    .isQuestAvailable 731
step
    #requires prospector
    >>|cRXP_WARN_护送勘察员雷姆塔维尔穿过挖掘区|r
    >>|cRXP_WARN_这个任务非常困难. 如果你无法组队或单人完成, 请跳过此步骤|r
    .link https://youtu.be/3d-htESNztE >>|cRXP_WARN_点击此处查看视频攻略|r
    .complete 731,1
    .isOnQuest 731
step
    #optional
    #completewith TheryluneEnd
    >>击杀|cRXP_ENEMY_暮光信徒|r 和|cRXP_ENEMY_暮光暴徒|r . 从他们身上搜刮出 |T133743:0|t[|cRXP_LOOT_Book: 《深渊之神》|r ]
    *|cRXP_WARN_Be careful as |cRXP_ENEMY_Twilight Thugs|r can|r |T132343:0|t[Disarm] |cRXP_WARN_you for 6 seconds|r << Rogue/Paladin/Warrior
    *|cRXP_WARN_Be careful as |cRXP_ENEMY_Twilight Disciples|r cast|r |T135953:0|t[Renew] |cRXP_WARN_and a 3 second|r |T135915:0|t[Heal]
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob Twilight Disciple
    .mob Twilight Thug
    --  .use 13536
step
    .goto 1439,38.660,87.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_瑟瑞露尼|r. 这将开启护送任务
    >>|cRXP_WARN_如果她不在场, 请跳过此步骤|r
    .accept 945 >>接任务: |cRXP_LOOT_护送瑟瑞露尼|r
    .target Therylune
step
    #label TheryluneEnd
    .goto Darkshore,40.51,87.09
    >>|cRXP_WARN_护送瑟瑞露尼离开大师之刃|r
    .complete 945,1 --护送瑟瑞露尼 away from the Master's Glaive (1)
    .isOnQuest 945
step
    #xprate <1.5
    #optional
    .goto 1439,31.251,87.419
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_这个任务可能非常困难. 请逐个攻击|cRXP_ENEMY_鱼人|r, 否则可能会同时引燃多个目标的仇恨|r
    .link https://youtu.be/lfQM3Q-Ag5A >>|cRXP_WARN_点击此处查看视频攻略|r
step
    #xprate <1.5
    #optional
    .goto 1439,31.229,85.564
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    #xprate <1.5
    #optional
    .goto 1439,31.690,83.700
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    #xprate <1.5
    #optional
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
	#xprate <1.5
    #optional
    .goto Darkshore,41.44,86.06,50,0
    .goto Darkshore,41.77,84.60,50,0
    .goto Darkshore,42.94,82.25,50,0
    .goto Darkshore,43.59,80.02,50,0
    .goto Darkshore,39.74,80.43,50,0
    .goto Darkshore,38.00,83.55
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r. 击杀后可掠夺其|cRXP_LOOT_头皮|r
    >>注意他们的施法 |T132152:0|t[毁灭], 这是一个瞬发攻击, 造成20-40点伤害, 并且|cRXP_WARN_将你击倒2秒|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob Grizzled Thistle Bear
step
    #xprate <1.5
    .goto Darkshore,41.389,80.565
    >>点击地面上的 |cRXP_PICK_传声盒525号|r
    .turnin 1003 >>交任务: |cRXP_FRIENDLY_传声盒525号|r
    .isOnQuest 1003
step
    #xprate <1.5
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    >>|cRXP_WARN_在与他交谈前, 请先清理洞穴附近的熊怪|r
    .turnin 993 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
    .accept 994 >>接任务: |cRXP_LOOT_杀出重围|r
    .target Volcor
    .isOnQuest 993
step
    #xprate <1.5
    #optional
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    >>|cRXP_WARN_在与他交谈前, 请先清理洞穴附近的熊怪|r
    .accept 994 >>接任务: |cRXP_LOOT_杀出重围|r
    .target Volcor
    .isQuestTurnedIn 993
step
	#xprate >1.59
    #optional
    #completewith Escaped
    .goto Darkshore,39.2,43.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t如果哨兵塞拉伊在场, 请与|cRXP_FRIENDLY_她|r交谈
    .accept 990 >>接任务: |cRXP_WARN_灰谷之旅|r
    .target Sentinel Selarin
step
	#xprate >1.49
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .turnin 993 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
    .accept 995 >>接任务: |cRXP_LOOT_偷偷溜走|r
    .target Volcor
    .isOnQuest 993
step
	#xprate >1.49
    #optional
    #label Escaped
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .accept 995 >>接任务: |cRXP_LOOT_偷偷溜走|r
    .target Volcor
    .isQuestTurnedIn 993
step
	#xprate <1.5
    .goto 1439,43.594,84.489,0
    .goto 1439,42.576,82.897,0
    .goto 1439,43.594,84.489,15,0
    .goto 1439,42.576,82.897,15,0
    .goto 1439,42.004,81.688
    >>护送|cRXP_FRIENDLY_沃科尔|r
    >>在穿过第三个火炬并离开洞穴后, |cRXP_ENEMY_弗尔博格|r将从两侧出现并攻击|cRXP_FRIENDLY_沃科尔|r
    >>在通往道路的半途中, 两侧将分别刷新出一个|rFurlbogs|r敌人, 并攻击|r沃科尔|r
    .complete 994,1 --Help Volcor to the road (1)
    .isQuestTurnedIn 993
step
	#xprate >1.49
    .goto Darkshore,44.44,84.69
    >>|cRXP_WARN_等待RP结束|r
    .complete 995,1 --Help Volcor escape the cave (1)
    .isQuestTurnedIn 993
step
    #xprate >1.49
    #optional
    #completewith tower
    .equip 15 >>|cRXP_WARN_重新装备你之前的|r|T133762:0|t[披风]
    .itemStat 15,QUALITY,<7
    .isOnQuest 995
step
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 951 >>交任务: |cRXP_FRIENDLY_玛塞斯特拉遗物|r
    .target Onu
    .isOnQuest 951
step
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈以开启护送任务
    >>|cRXP_WARN_如果他不在那里, 请跳过此步骤. 他重生可能需要长达25分钟|r
    >>|cRXP_WARN_这是一个限时任务, 你必须在20分钟内护送他抵达灰谷|r
    .accept 5321 >>接任务: |cRXP_LOOT_昏昏欲睡|r
    .target Kerlonian Evershade
    .itemcount 13536,<1 --Horn of Awakening
step
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开|cRXP_PICK_克罗尼亚的箱子|r. 拾取其中的 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .itemcount 13536,<1 --Horn of Awakening
step
    #completewith tower
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .goto Ashenvale,29.7,13.6
step
    #sticky
    #completewith Kerlonian
    >>击杀并掠夺你在任务过程中遇到的|cRXP_WARN_幽爪奔跑者|r. 保留你获得的任何 |T133970:0|t[|cRXP_LOOT_狼肋排|r], 稍后烹饪任务中你需要收集10个
    .collect 1015,10
    .mob Ghostpaw Runner
step
    #label Kerlonian
    .goto Ashenvale,27.26,35.58
    >>|cRXP_WARN_护送|cRXP_FRIENDLY_Kerlonian|r前往灰谷的梅伊瑟娜岗哨|r
    .use 13536 >>|cRXP_WARN_每当|cRXP_FRIENDLY_Kerlonian|r在他旁边睡着时, 使用|r|T134229:0|t[|cRXP_LOOT_唤醒号角|r]|r
    >>|cRXP_WARN_尽量避免在主路上奔跑, 敌人只会出现在道路上|r
    .complete 5321,2
    .isOnQuest 5321
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉亚德里斯·月河|r交谈
	.target Liladris Moonriver
    .goto Ashenvale,27.26,35.58
    .turnin 5321 >>交任务: |cRXP_FRIENDLY_昏昏欲睡|r
    .isQuestComplete 5321
step
    #label tower
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target Delgren the Purifier
    .goto Ashenvale,26.19,38.69
    .turnin 967 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
step
	#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target Delgren the Purifier
    .goto Ashenvale,26.19,38.69
    .accept 970 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
	.target Orendil Broadleaf
    .goto Ashenvale,26.43,38.59
    .accept 1010 >>接任务: |cRXP_LOOT_巴斯兰的头发|r
    .xp <20,1
step
    #xprate <1.5
    .goto Ashenvale,31.25,30.70
    >>击杀|cRXP_ENEMY_暗滩祭司|r和|cRXP_ENEMY_暗滩精兵|r和|cRXP_ENEMY_暗滩执行者|r和|cRXP_ENEMY_暗滩挖掘者|r, 掠夺他们以获得|cRXP_LOOT_发光的灵魂宝石|r
    >>请耐心, 此物品掉率较低
    .complete 970,1
    .mob Dark Strand Cultist
    .mob Dark Strand Adept
    .mob Dark Strand Enforcer
    .mob Dark Strand Excavator
step
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地面上的|cRXP_PICK_草药包|r. 拾取它们以获得|cRXP_LOOT_草药|r
    >>|cRXP_WARN_它们看起来像棕色的小袋子, 很难被发现|r
    .complete 1010,1
    .isOnQuest 1010
step
    .goto Ashenvale,31.25,30.70
    .xp 20-1650 >>继续击杀|cRXP_ENEMY_Dark Strand mobs|r, 直到你获得足够的经验值达到 20 级
    .mob Dark Strand Cultist
    .mob Dark Strand Adept
    .mob Dark Strand Enforcer
    .mob Dark Strand Excavator
step
	#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target Delgren the Purifier
    .goto Ashenvale,26.19,38.69
    .turnin 970 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
step
    .goto Ashenvale,31.89,22.53
    .xp 20 >>升级至20级
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
	.target Orendil Broadleaf
    .goto Ashenvale,26.43,38.59
    .accept 1010 >>接任务: |cRXP_LOOT_巴斯兰的头发|r
step
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地面上的|cRXP_PICK_草药包|r. 拾取它们以获得|cRXP_LOOT_草药|r
    >>|cRXP_WARN_它们看起来像棕色的小袋子, 很难被发现|r
    .complete 1010,1
    .isOnQuest 1010
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
	.target Orendil Broadleaf
    .goto Ashenvale,26.43,38.59
    .turnin 1010 >>交任务: |cRXP_FRIENDLY_巴斯兰的头发|r
    .accept 1020 >>接任务: |cRXP_LOOT_奥雷迪尔的药剂|r
step
	#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .goto Ashenvale,26.19,38.69
    .turnin 970 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 973 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Delgren the Purifier
step
    #sticky
    #completewith Astranaar
    >>击杀并掠夺你在任务过程中遇到的|cRXP_WARN_幽爪奔跑者|r. 保留你获得的任何 |T133970:0|t[|cRXP_LOOT_狼肋排|r], 稍后烹饪任务中你需要收集10个
    .collect 1015,10
    .mob Ghostpaw Runner
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
	.target Therysil
    .goto Ashenvale,22.64,51.91
    .turnin 945 >>交任务: |cRXP_FRIENDLY_护送瑟瑞露尼|r
    .isQuestComplete 945
step << Hunter
    #xprate <1.59
    .goto 1440/1,522.900,2716.100,30 >>沿西北方向的坡道向上前进
step
    #xprate <1.59
    #completewith Astranaar
    >>保存最多 6 个从该区域蜘蛛身上掉落的粘糊蜘蛛腿, 以备日后使用
    .collect 2251,6,93,1 -- Gooey Spider Legs
step << Hunter
    #xprate <1.59
    #sticky
    .goto Ashenvale,17.976,60.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尔温|r交谈
    .trainer >>训练你的宠物技能
    .target Bolyun
--XX Train in darn at 20 on 2x
step << Hunter
    #xprate <1.59
    .goto Ashenvale,18.010,59.832
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥林达尔·石鹿|r交谈
    .trainer >>训练你的职业技能
    .train 5118 >>训练 |T132242:0|t[猎豹之姿]
    .target Alenndaar Lapidaar
step
    #label Astranaar
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fp Astranaar>>获取阿斯特兰纳的飞行路径
	.target Daelyshia
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德瑞尔·速火|r交谈
	.target Shindrell Swiftfire
    .goto Ashenvale,34.67,48.83
    .accept 1008 >>接任务: |cRXP_LOOT_佐拉姆海岸|r
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵塞恩希尔|r交谈
	.target Sentinel Thenysil
    .goto Ashenvale,34.89,49.79
    .accept 1070 >>接任务: |cRXP_LOOT_守卫石爪山|r
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔德瑞斯·戈思谢尔|r交谈
	.target Faldreas Goeth'Shael
    .goto Ashenvale,35.76,49.10
    .accept 1056 >>接任务: |cRXP_LOOT_石爪峰之旅|r
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
	.target Raene Wolfrunner
    .goto Ashenvale,36.61,49.58
    .accept 991 >>接任务: |cRXP_LOOT_莱恩的净化|r
    .accept 1054 >>接任务: |cRXP_LOOT_解除威胁|r
step << !Dwarf/!Hunter
    #xprate <1.59
    .goto Ashenvale,36.99,49.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板基姆利雅|r交谈
    .home >>将你的[炉石]设置为阿斯特兰纳
    .target Innkeeper Kimlya
step
    #xprate <1.59
    .goto Ashenvale,36.6,49.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛琳|r交谈
    .vendor >>|cRXP_BUY_必要时购买食物和水|r
    .target Maliynn
step
    #xprate <1.59
    .goto Ashenvale,37.36,51.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
	.target Pelturas Whitemoon
    .turnin 1020 >>交任务: |cRXP_FRIENDLY_奥雷迪尔的药剂|r
    .timer 24,Orendil's Cure RP
    .accept 1033 >>接任务: |cRXP_LOOT_月神之泪|r
step << Hunter
    #xprate <1.59
    .goto Ashenvale,34.8,50.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈尔詹·橡木之心|r交谈
    .vendor >>|cRXP_BUY_必要时补充弹药|r
    .target Haljan Oakheart
step
    #xprate <1.59
    #completewith ElunesTear
    >>收集最多 6 个|cRXP_LOOT_粘糊的蜘蛛腿|r, 这些是来自该区域的|cRXP_ENEMY_蜘蛛|r掉落的物品, 稍后完成任务时需要用到
    .collect 2251,6,93,1 -- Gooey Spider Legs
step
    #xprate <1.59
    .goto Ashenvale,46.37,46.38
    >>拾取地面上的|cRXP_LOOT_月神之泪|r
    .complete 1033,1
step
    #xprate <1.59
    #label ElunesTear
    .goto Ashenvale,37.36,51.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
	.target Pelturas Whitemoon
    .turnin 1033 >>交任务: |cRXP_FRIENDLY_月神之泪|r
    .timer 17,Elune's Tear RP
    .accept 1034 >>接任务: |cRXP_LOOT_星尘废墟|r
step
    #xprate <1.59
    .goto Ashenvale,33.30,67.79
    >>从|cRXP_PICK_星尘覆盖的灌木丛|r中搜刮出|cRXP_LOOT_一份星尘|r
    >>|cRXP_WARN_它们的刷新点散布在整个岛屿上|r
    .complete 1034,1
step
    #xprate <1.59
    #completewith next
    .goto Ashenvale,31.67,64.24,15 >>前往山脚基地
    .goto Ashenvale,31.21,61.60,15 >>一边爬山一边向北直行
step
    #xprate <1.59
    #completewith next
    .goto Ashenvale,27.50,60.76,8 >>爬上火痕神社入口右侧大树旁的小山
    >>跳过树根, 紧贴右侧前进, 以避免吸引怪物仇恨
step
    #xprate <1.5
    .goto Ashenvale,25.27,60.68
    >>击杀|cRXP_ENEMY_伊克鲁德·玛格苏尔|r. 从他身上搜刮其|cRXP_LOOT_典籍|r
    >>|cRXP_ENEMY_伊克鲁德·玛格苏尔|r|cRXP_WARN_将施放|r|T136221:0|t[伊克鲁德的守护者] |cRXP_WARN_这是一个持续5秒的法术, 会召唤2名虚空行者. 若能打断, 请立即打断|r
    >>|cRXP_WARN_如有需要, 请清理出口路径, 以便在必要时与魅魔一起重置. 此步骤可跳过, 建议在等级23时再进行|r
    .complete 973,1
    .link https://youtu.be/03nTrdcQiKY >>|cRXP_WARN_点击此处查看视频参考|r
	.isOnQuest 973
    .mob Ilkrud Magthrull
step
    #xprate <1.5
    .isQuestComplete 973
    .goto Ashenvale,26.19,38.69
    .target Delgren the Purifier
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 973 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
step
    #xprate <1.59
    #sticky
    #completewith StatuetteStart
    >>收集最多 6 个|cRXP_LOOT_粘糊的蜘蛛腿|r, 这些是来自该区域的|cRXP_ENEMY_蜘蛛|r掉落的物品, 稍后完成任务时需要用到
    .collect 2251,6,93,1 -- Gooey Spider Legs
step
    #sticky
    #completewith StatuetteStart
    >>击杀并掠夺你在任务过程中遇到的|cRXP_WARN_幽爪奔跑者|r. 保留你获得的任何 |T133970:0|t[|cRXP_LOOT_狼肋排|r], 稍后烹饪任务中你需要收集10个
    .collect 1015,10
    .mob Ghostpaw Runner
step
    #label StatuetteStart
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔伦|r交谈
	.target Talen
    .goto Ashenvale,14.79,31.29
    .accept 1007 >>接任务: |cRXP_LOOT_远古雕像|r
step
    #xprate <1.59
    #completewith nagas
    >>击杀|cRXP_ENEMY_Wrathtail Nagas|r. 掠夺他们的|cRXP_LOOT_Heads|r
    >>|cRXP_WARN_暂时不必特意去完成这个任务|r
	.mob Wrathtail Wave Rider
	.mob Wrathtail Sorceress
    .complete 1008,1
step
    #xprate <1.59
    .goto Ashenvale,14.20,20.64
    >>拾取地面上的古代雕像
    .complete 1007,1
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔伦|r交谈
	.target Talen
    .goto Ashenvale,14.79,31.29
    .turnin 1007 >>交任务: |cRXP_FRIENDLY_远古雕像|r
    .timer 22,The Ancient Statuette RP
    .accept 1009 >>接任务: |cRXP_LOOT_卢泽尔|r
step
    #xprate <1.59
    .goto Ashenvale,6.528,13.361
    >>击杀|cRXP_ENEMY_卢泽尔|r. 击败她后可掉落|cRXP_LOOT_佐拉姆之戒|r
    >>|cRXP_ENEMY_卢泽尔|r|cRXP_WARN_与怒尾侍从|r和怒尾海巫|r一同巡逻岛屿. 击杀其中一人, 必要时重新生成他们|r
    >>|cRXP_WARN_如果你有任何|r|T133717:0|t[炸弹]|cRXP_WARN_/|r[手榴弹]|cRXP_WARN_你也可以用它们来分散拉怪|r|cRXP_ENEMY_卢泽尔|r
    >>|cRXP_ENEMY_薇丝比娅|r|cRXP_WARN_是一个稀有刷新, 如果你看到她, 还有可能掉落|cRXP_LOOT_佐拉姆之戒|r|r
    .link https://www.youtube.com/watch?v=H-IwZ6P-ldY >>|cRXP_WARN_点击此处查看“分体拉怪”视频参考|r
	.unitscan Lady Vespia
	.mob Ruuzel
    .complete 1009,1
    .skill engineering,<1,1
step
    #xprate <1.59
    #label nagas
    .goto Ashenvale,6.528,13.361
    >>击杀|cRXP_ENEMY_卢泽尔|r. 击败她后可掉落|cRXP_LOOT_佐拉姆之戒|r
    >>|cRXP_ENEMY_卢泽尔|r|cRXP_WARN_与怒尾侍从|r和怒尾海巫|r一同巡逻岛屿. 击杀其中一人, 必要时重新生成他们|r
    >>|cRXP_ENEMY_薇丝比娅|r|cRXP_WARN_是一个稀有刷新, 如果你看到她, 还有可能掉落|cRXP_LOOT_佐拉姆之戒|r|r
	.unitscan Lady Vespia
	.mob Ruuzel
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
    >>击杀|cRXP_ENEMY_Wrathtail Nagas|r. 掠夺他们的|cRXP_LOOT_Heads|r
	.mob Wrathtail Wave Rider
	.mob Wrathtail Sorceress
    .mob Wrathtail Myrmidon
    .mob Wrathtail Priestess
    .mob Wrathtail Razortail
    .mob Wrathtail Sea Witch
    .complete 1008,1
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔伦|r交谈
	.target Talen
    .goto Ashenvale,14.79,31.29
    .turnin 1009 >>交任务: |cRXP_FRIENDLY_卢泽尔|r
step
    #xprate <1.59
    #sticky
    #completewith SoulGemStart
    >>收集最多 6 个|cRXP_LOOT_粘糊的蜘蛛腿|r, 这些是来自该区域的|cRXP_ENEMY_蜘蛛|r掉落的物品, 稍后完成任务时需要用到
    .collect 2251,6,93,1 -- Gooey Spider Legs
step
    #sticky
    #completewith SoulGemStart
    >>击杀并掠夺你在任务过程中遇到的|cRXP_WARN_幽爪奔跑者|r. 保留你获得的任何 |T133970:0|t[|cRXP_LOOT_狼肋排|r], 稍后烹饪任务中你需要收集10个
    .collect 1015,10
    .mob Ghostpaw Runner
step
    #label SoulGemStart
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Teronis的尸体|r交谈
	.target Teronis' Corpse
    .goto Ashenvale,20.31,42.33
    .turnin 991 >>交任务: |cRXP_FRIENDLY_莱恩的净化|r
    .accept 1023 >>接任务: |cRXP_LOOT_莱恩的净化|r
step
    #sticky
    #completewith GlowingGem
    >>保留你可能掉落的任何|T134304:0 |t[鱼人的鳍]. 完成后续任务时你需要8个
    .collect 1468,8 --Murloc Fin(8)
step
    #label GlowingGem
    #xprate <1.59
    .goto Ashenvale,20.41,43.82,50,0
    .goto Ashenvale,19.43,42.09,50,0
    .goto Ashenvale,21.01,41.61,50,0
    .goto Ashenvale,20.31,42.33
    >>击杀|cRXP_ENEMY_Saltspittle 鱼人|r. 击败它们获取|cRXP_LOOT_发光的宝石|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_Oracles|r可以治疗自身, 并且每隔几秒就会施放一个造成90点伤害的瞬发冲击法术|r
	.mob Saltspittle Warrior
	.mob Saltspittle Muckdweller
	.mob Saltspittle Oracle
	.mob Saltspittle Puddlejumper
    .complete 1023,1
step << Dwarf Hunter
    #xprate <1.59
    .hs >>传送至奥伯丁
step << !Dwarf/!Hunter
    #xprate <1.59
    #softcore
    #completewith next
    .deathskip >>死在湖的东边, 灵魂在阿斯特兰纳复活
step << !Dwarf/!Hunter
    #xprate <1.59
    #hardcore
    #completewith next
    .goto Ashenvale,34.40,48.00,200 >>前往阿斯特兰纳
step << !Dwarf/!Hunter
    #xprate <1.59
    .goto Ashenvale,34.41,47.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fly Darkshore>>飞往黑海岸
    .target Daelyshia
step
    #xprate <1.59
    .goto Darkshore,37.44,41.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .turnin 731 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .accept 741 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
step
    #xprate <1.59
    #completewith end
    .vendor >>补给/重置补给
step
    #xprate <1.59
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 995 >>交任务: |cRXP_FRIENDLY_偷偷溜走|r
    .target Terenthis
    .isOnQuest 995
step
    #xprate <1.59
    .goto 1439,39.373,43.483
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 994 >>交任务: |cRXP_FRIENDLY_杀出重围|r
    .target Terenthis
    .isOnQuest 994
step
    #xprate <1.59
    .goto 1439,36.621,45.596
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4730 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .turnin 4731 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4732 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4733 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .target Gwennyth Bly'Leggonde
step
    #xprate <1.59
    .goto Darkshore,36.336,45.574
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fly Teldrassil >>飞往泰达希尔
	.target Caylais Moonfeather
step
    #xprate <1.59
    #optional
    #completewith next
    .goto Teldrassil,55.889,89.456
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Hunter
    .goto Darnassus,40.377,8.545
    .target Jocaste
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .trainer >>训练你的职业法术
    .xp <22,1
step
    #xprate <1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加瑞斯|r交谈
    .goto Darnassus,40.0,42.2
    .bankdeposit 5996,1468,2251,1015 >>将以下物品存入银行
    .target Garryeth
    >>|T134797:0|t[水下呼吸药剂]--5996
    >>|T134304:0|t[鱼人的鳍] --1468
    >>|T134321:0|t[粘糊的蜘蛛腿] --2251
    >>|T133970:0|t[狼肋排] --1015
step << Dwarf Hunter
    #xprate <1.59
-- #xprate >1.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .goto Darnassus,57.56,46.72
    .train 264 >>训练弓箭
    .train 227 >>训练法杖
    .target Ilyenia Moonfire
    .dungeon DM
step
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
	.target Chief Archaeologist Greywhisker
    .goto Teldrassil,23.70,64.51
    .turnin 741 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .accept 942 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .isOnQuest 741
step
    #optional
    #xprate <1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_首席考古学家杜瑟·灰须|r交谈
	.target Chief Archaeologist Greywhisker
    .goto Teldrassil,23.70,64.51
    .accept 942 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .isQuestTurnedIn 741
step << !Dwarf/!Hunter
    #xprate <1.59
    #label end
    .hs >>炉石传送至阿斯特兰纳
step << Dwarf Hunter
    #xprate <1.59
    .goto Darnassus,29.466,41.405
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Ashenvale
    .zoneskip Darkshore
step << Dwarf Hunter
    #xprate <1.59
    #label end
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Ashenvale >>飞往灰谷
    .target Vesprystus
    .zoneskip Ashenvale
]])


----End of Hunter-only Darkshore/Ashen (Needs to be merged)----


RXPGuides.RegisterGuide([[
#classic
#season 0
#version 1
<< Alliance !Hunter
#season 0
#group RestedXP 联盟 1-20级
#name 20-21 黑海岸/灰谷
#displayname 20-21 黑海岸/灰谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next RestedXP 联盟 20-30/21-23 石爪山脉/灰谷；RestedXP 联盟 20-30/21-22 灰谷 赛季服


step << Druid
    #xprate <1.59
	#completewith next
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
step << Druid
    #xprate <1.59
    .goto Moonglade,52.53,40.57
	>>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >>训练你的职业法术
    .target Loganaar
step
    #xprate <1.59
    #optional
    #completewith TheryluneE
    .hs >>传送至奥伯丁
step
    .goto Darkshore,37.21,44.22
    >>点击|cRXP_PICK_通缉告示|r
    .accept 4740 >>接任务: |cRXP_LOOT_通缉：莫克迪普！|r
step
    .goto 1439,37.322,43.640
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .accept 948 >>接任务: |cRXP_LOOT_安努|r
    .target Barithras Moonshade
step
    .goto Darkshore,37.44,41.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    .target Archaeologist Hollee
step
    #xprate <1.59
    .goto 1439,38.325,43.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈沙拉·夜语|r交谈
    .turnin 3765 >>交任务: |cRXP_FRIENDLY_遥远的旅途|r
    .target Gershala Nightwhisper
    .isOnQuest 3765
--  .dungeon !DM << NightElf Warrior/Mage/Warlock/Rogue
step
    #xprate >1.59
    .goto 1439,38.325,43.039
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈沙拉·夜语|r交谈
    .turnin 3765 >>交任务: |cRXP_FRIENDLY_遥远的旅途|r
    .target Gershala Nightwhisper
    .isOnQuest 3765
    .dungeon !DM << NightElf Warrior/Mage/Warlock/Rogue
step
    .goto 1439,39.373,43.483
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 993 >>接任务: |cRXP_LOOT_丢失的主人|r
	.target Terenthis
    .isQuestTurnedIn 986
step
    #optional
    #completewith OnuGrove
    >>|cRXP_WARN_如果你装备了|r|T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_, 请确保保留当前的披风以备后用, 因为|r|T133762:0|t[附有魔法的月虎披风]|cRXP_WARN_在后续任务中会永久丢失|r
    .equip 15,5387 >>|cRXP_WARN_装备|r|T133762:0|t[附有魔法的月虎披风] |cRXP_WARN_如果它比你当前的披风更好|r
    .itemcount 5387,1
    .itemStat 15,QUALITY,<7
step
	#xprate <1.5 --<< !NightElf/Hunter
    #completewith MasterG
    #optional
    .goto Darkshore,40.23,81.28,0
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r. 击杀后可掠夺其|cRXP_LOOT_头皮|r
    >>注意他们的施法 |T132152:0|t[毁灭], 这是一个瞬发攻击, 造成20-40点伤害, 并且|cRXP_WARN_将你击倒2秒|r
    .complete 1003,1
    .isOnQuest 1003
    .mob Grizzled Thistle Bear
step
    #optional
    #completewith OnuGrove
    .goto 1439,43.555,76.293,80 >>前往古树之林
step
    #xprate >1.49
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 951 >>交任务: |cRXP_FRIENDLY_玛塞斯特拉遗物|r
    .target Onu
    .isQuestComplete 951
step
    #xprate >1.49
    #label OnuGrove
    #optional
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 948 >>交任务: |cRXP_FRIENDLY_安努|r
    .target Onu
    .isOnQuest 948
step
    #xprate >1.49
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .turnin 993 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
    .accept 995 >>接任务: |cRXP_LOOT_偷偷溜走|r
    .timer 20,Escape Through Stealth RP
    .target Volcor
    .isOnQuest 993
step
    #xprate >1.49
    #optional
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .accept 995 >>接任务: |cRXP_LOOT_偷偷溜走|r
    .timer 20,Escape Through Stealth RP
    .target Volcor
    .isQuestTurnedIn 993
step
    #xprate >1.49
    .goto Darkshore,44.44,84.69
    >>|cRXP_WARN_等待RP结束|r
    .complete 995,1 --Help Volcor escape the cave (1)
    .isOnQuest 995
step
    #xprate >1.49
    #optional
    #completewith Murkdeep
    .equip 15 >>|cRXP_WARN_重新装备你之前的|r|T133762:0|t[披风]
    .itemStat 15,QUALITY,<7
    .isOnQuest 995
step
    #xprate <1.5
    #label OnuGrove
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 952 >>交任务: |cRXP_FRIENDLY_古树之林|r << NightElf
    .turnin 948 >>交任务: |cRXP_FRIENDLY_安努|r
    .accept 944 >>接任务: |cRXP_LOOT_主宰之剑|r
    .target Onu
step
    #xprate <1.5
    #label MasterG
    .goto Darkshore,38.54,86.05,100 >>前往主宰之剑
    .subzoneskip 449
    .isOnQuest 944
step
    #optional
    #completewith TheryluneEnd
    >>击杀|cRXP_ENEMY_暮光信徒|r 和|cRXP_ENEMY_暮光暴徒|r . 从他们身上搜刮出 |T133743:0|t[|cRXP_LOOT_Book: 《深渊之神》|r ]
    *|cRXP_WARN_Be careful as |cRXP_ENEMY_Twilight Thugs|r can|r |T132343:0|t[Disarm] |cRXP_WARN_you for 6 seconds|r << Rogue/Paladin/Warrior
    *|cRXP_WARN_Be careful as |cRXP_ENEMY_Twilight Disciples|r cast|r |T135953:0|t[Renew] |cRXP_WARN_and a 3 second|r |T135915:0|t[Heal]
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .mob Twilight Disciple
    .mob Twilight Thug
--  .use 13536
step
    #xprate <1.5
    #optional
    .goto Darkshore,38.54,86.05
    >>发现主宰之剑
    .complete 944,1 --Enter the Master's Glaive (1)
step
    #xprate <1.5
    #completewith next
    .cast 5809 >>|cRXP_WARN_使用|r|T134715:0|t[占卜之水] |cRXP_WARN_并将其放置在地面上|r
    .use 5251
step
    #xprate <1.5
    .goto Darkshore,38.54,86.05
    >>|cRXP_WARN_点击地面上的|cRXP_PICK_占卜之碗|r|r
    .turnin 944 >>交任务: |cRXP_FRIENDLY_主宰之剑|r
    .accept 949 >>接任务: |cRXP_LOOT_暮光之锤的营地|r
    .use 5251
step
    #xprate <1.5
    .goto 1439,38.537,86.050
    >>点击北方基座上的|cRXP_PICK_暮光宝典|r
    .turnin 949 >>交任务: |cRXP_FRIENDLY_暮光之锤的营地|r
    .accept 950 >>接任务: |cRXP_LOOT_向安努回复|r
step
    .goto 1439,38.660,87.305
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_瑟瑞露尼|r. 这将开启护送任务
    >>|cRXP_WARN_如果她不在场, 请跳过此步骤|r
    .accept 945 >>接任务: |cRXP_LOOT_护送瑟瑞露尼|r
    .target Therylune
step
    #label TheryluneEnd
    .goto Darkshore,40.51,87.09
    >>|cRXP_WARN_护送瑟瑞露尼离开大师之刃|r
    .complete 945,1 --护送瑟瑞露尼 away from the Master's Glaive (1)
    .isOnQuest 945
step
	#xprate <1.5 --<< !NightElf/Hunter
    #completewith prospectorEscort
    #optional
    .goto Darkshore,40.23,81.28,0
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r. 击杀后可掠夺其|cRXP_LOOT_头皮|r
    >>注意他们的施法 |T132152:0|t[毁灭], 这是一个瞬发攻击, 造成20-40点伤害, 并且|cRXP_WARN_将你击倒2秒|r
    .complete 1003,1
    .isOnQuest 1003
    .mob Grizzled Thistle Bear
step
    #sticky
    #label prospector
    .goto 1439,35.724,83.696
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>|cRXP_WARN_你可能需要等待他重生, 或等待其他玩家完成护送任务|r
    .turnin 729 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .target Prospector Remtravel
    .isOnQuest 729
step
    #label prospectorEscort
    .goto Darkshore,35.72,83.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈. 这将开启一个护送任务
    .accept 731,1 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    >>|cRXP_WARN_这个任务非常困难. 如果你无法组队或单人完成, 请跳过此步骤|r
    .link https://youtu.be/3d-htESNztE >>|cRXP_WARN_点击此处查看视频攻略|r
    .target Prospector Remtravel
    .isQuestAvailable 731
step
    #requires prospector
    >>|cRXP_WARN_护送勘察员雷姆塔维尔穿过挖掘区|r
    >>|cRXP_WARN_这个任务非常困难. 如果你无法组队或单人完成, 请跳过此步骤|r
    .link https://youtu.be/3d-htESNztE >>|cRXP_WARN_点击此处查看视频攻略|r
    .complete 731,1
    .isOnQuest 731
step
    #xprate <1.5
    #optional
    #completewith Murkdeep
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r, 击败它们后可获得|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
    .mob Reef Crawler
step
    #xprate >1.49
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r, 击败它们后可获得|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
    .mob Reef Crawler
step
    #xprate >1.49
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    #xprate >1.49
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r, 掠夺其|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
step
    #xprate >1.49
    .goto 1439,31.690,83.700
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >>接任务: |cRXP_LOOT_搁浅的海龟|r
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
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r, 击败它们后可获得|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
    .mob Reef Crawler
step
    #xprate >1.49
    .goto 1439,31.229,85.564
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    .goto 1439,31.251,87.419
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_这个任务可能非常困难. 请逐个攻击|cRXP_ENEMY_鱼人|r, 否则可能会同时引燃多个目标的仇恨|r
    .link https://youtu.be/lfQM3Q-Ag5A >>|cRXP_WARN_点击此处查看视频攻略|r
step
    #xprate <1.5
    .goto 1439,31.229,85.564
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    #xprate <1.5
    #optional
    .goto 1439,31.690,83.700
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    #xprate <1.5
    #optional
    .goto 1439,32.644,80.711
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    #xprate <1.5
    #optional
    #label Murkdeep
    .goto 1439,35.429,76.566,0
    .goto 1439,35.429,76.566,60,0
    .goto Darkshore,36.64,76.53
    >>|cRXP_WARN_请确保检查|cRXP_ENEMY_莫克迪普|r 是否已在水中(如果有人先前未能成功击败该遭遇, 或是在他生成的波次中留下了活着的|cRXP_ENEMY_灰雾猎人|r)|r
    >>击杀营地中的灰雾战士和灰雾猎人
    >>|cRXP_WARN_前往营地中心的篝火处, 开始与|cRXP_ENEMY_莫克迪普|r的遭遇战:|r
    >>|cRXP_WARN_水中将陆续刷新3波敌人, 每击杀前一波后才会生成下一波：第1波有3个12-13级的|cRXP_ENEMY_灰雾滩行者|r, 第2波有2个15-16级的|cRXP_ENEMY_灰雾战士|r, 第3波则包含1个19级的|cRXP_ENEMY_莫克迪普|r和1个16-17级的|cRXP_ENEMY_灰雾猎人|r. 你可以远离篝火, 以避免吸引下一波敌人的仇恨|r
    .complete 4740,1 -- Murkdeep (1)
    .unitscan Murkdeep
    .mob Greymist Warrior
    .mob Greymist Hunter
    .mob Greymist Coastrunner
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
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r, 击败它们后可获得|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
    .mob Reef Crawler
step
	#xprate <1.5 --<< !NightElf/Hunter
    #optional
    .goto Darkshore,41.44,86.06,50,0
    .goto Darkshore,41.77,84.60,50,0
    .goto Darkshore,42.94,82.25,50,0
    .goto Darkshore,43.59,80.02,50,0
    .goto Darkshore,39.74,80.43,50,0
    .goto Darkshore,38.00,83.55
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r. 击杀后可掠夺其|cRXP_LOOT_头皮|r
    >>注意他们的施法 |T132152:0|t[毁灭], 这是一个瞬发攻击, 造成20-40点伤害, 并且|cRXP_WARN_将你击倒2秒|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob Grizzled Thistle Bear
step
    #xprate <1.5 --<< !NightElf/Hunter
    .goto Darkshore,41.389,80.565
    >>点击地面上的 |cRXP_PICK_传声盒525号|r
    .turnin 1003 >>交任务: |cRXP_FRIENDLY_传声盒525号|r
    .isOnQuest 1003
step
    #xprate <1.5
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 951 >>交任务: |cRXP_FRIENDLY_玛塞斯特拉遗物|r
    .target Onu
    .isQuestComplete 951
step
    #xprate <1.5
    .goto 1439,43.555,76.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >>交任务: |cRXP_FRIENDLY_向安努回复|r
    .target Onu
step
    #xprate <1.5
    .goto 1439,44.401,76.425
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈以开启护送任务
    >>|cRXP_WARN_如果他不在那里, 请跳过此步骤. 他重生可能需要长达25分钟|r
    >>|cRXP_WARN_这是一个限时任务, 你必须在20分钟内护送他抵达灰谷|r
    .accept 5321 >>接任务: |cRXP_LOOT_昏昏欲睡|r
    .target Kerlonian Evershade
step
    #xprate <1.5
    .goto Darkshore,44.38,76.30
    >>打开|cRXP_PICK_克罗尼亚的箱子|r. 拾取其中的 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
    .isOnQuest 5321
step
#xprate <1.5
    #completewith volcorEnd
    .goto Ashenvale,27.26,35.58
    +|cRXP_FRIENDLY_Kerlonian|r将跟随你, 并在战斗中偶尔提供帮助. |cRXP_WARN_请确保不要与他失散, 因为他一旦睡着就会停止移动. 你有25分钟的时间前往灰谷并完成此任务|r
    .use 13536 >>|cRXP_WARN_使用|r|T134229:0|t[|cRXP_LOOT_唤醒号角|r]|cRXP_WARN_当|r|cRXP_FRIENDLY_Kerlonian|r站在他旁边睡着时, 可唤醒他|r
    >>|cRXP_WARN_尽量避免在主路上奔跑, 敌人只会出现在道路上|r
    .isOnQuest 5321
step
#xprate <1.5
    #completewith next
    .goto Darkshore,45.00,85.30,30 >>前往洞穴中|cRXP_FRIENDLY_沃科尔|r方向
    .isOnQuest 993
step
#xprate <1.5
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .turnin 993 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
    .accept 995 >>接任务: |cRXP_LOOT_偷偷溜走|r
    .timer 20,Escape Through Stealth RP
    .target Volcor
step
#xprate <1.5
    #label volcorEnd
    .goto Darkshore,44.44,84.69
    >>|cRXP_WARN_等待RP结束|r
    .complete 995,1
    .isOnQuest 995
step -- adjusted to heading there straight from southern most beached sea creature
#xprate >1.49
    #completewith tower
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .goto Ashenvale,25.77,14.55
step
#xprate <1.50
    #completewith tower
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .goto Ashenvale,29.7,13.6
step
#xprate <1.5
    .goto Ashenvale,27.26,35.58
    >>|cRXP_WARN_护送|cRXP_FRIENDLY_Kerlonian|r前往灰谷的梅伊瑟娜岗哨|r
    .use 13536 >>|cRXP_WARN_每当|cRXP_FRIENDLY_Kerlonian|r在他旁边睡着时, 使用|r|T134229:0|t[|cRXP_LOOT_唤醒号角|r]|r
    >>|cRXP_WARN_尽量避免在主路上奔跑, 敌人只会出现在道路上|r
    .complete 5321,2
    .isOnQuest 5321
step
#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉亚德里斯·月河|r交谈
	.target Liladris Moonriver
    .goto Ashenvale,27.26,35.58
    .turnin 5321 >>交任务: |cRXP_FRIENDLY_昏昏欲睡|r
    .isQuestComplete 5321
step << Paladin
    #season 2
    .goto Ashenvale,26.19,38.69
    >>与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 967 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    --.accept 970 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .turnin 78088 >>上交一件奇怪的文物
    .accept 78089 >>接任务: |cRXP_WARN_暴风城的建议|r
    .target Delgren the Purifier
    .train 410014,1
    .itemcount 209836,1 --Athalaxx Orb (1)
step << Paladin
    #season 2
    #label tower
    #optional
    .goto Ashenvale,26.19,38.69
    >>与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 967 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    --.accept 970 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .accept 78089 >>接任务: |cRXP_WARN_暴风城的建议|r
    .target Delgren the Purifier
    .train 410014,1
    .isQuestTurnedIn 78088
step << !Warlock
    #season 0,1 << Paladin
	#xprate >1.49
    #label tower
    .goto Ashenvale,26.19,38.69
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 967 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .target Delgren the Purifier
step
    #season 0,1 << Paladin
	#xprate <1.5 << !Warlock
    #label tower
    .goto Ashenvale,26.19,38.69
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
    .turnin 967 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 970 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Delgren the Purifier
step
    #xprate <1.59
    #optional
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
	.target Orendil Broadleaf
    .goto Ashenvale,26.43,38.59
    .accept 1010 >>接任务: |cRXP_LOOT_巴斯兰的头发|r
    .xp <20,1
step
    #xprate <1.5
    .goto Ashenvale,31.25,30.70
    >>击杀|cRXP_ENEMY_暗滩祭司|r和|cRXP_ENEMY_暗滩精兵|r. 击败后搜刮, 获取|cRXP_LOOT_发光的灵魂宝石|r
    .complete 970,1
    .mob Dark Strand Cultist
    .mob Dark Strand Adept
step
    .goto Ashenvale,31.25,30.70
    .xp 20-1650 >>继续击杀|cRXP_ENEMY_Dark Strand mobs|r, 直到你获得足够的经验值达到 20 级
    .mob Dark Strand Cultist
    .mob Dark Strand Adept
    .mob Dark Strand Enforcer
    .mob Dark Strand Excavator
step
    #xprate <1.59
    #optional
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地面的|cRXP_PICK_草药包|r. 从中拾取|cRXP_LOOT_草药|r
    >>|cRXP_WARN_它们看起来像棕色的小袋子, 可以部分埋入地面, 不易被发现|r
    >>|cRXP_WARN_确保你已启用|r|T134916:0|t[追踪草药]|cRXP_WARN_enabled, 才能在小地图上看到它们|r
    .complete 1010,1 --草药巴桑兰的头发 (5)
    .isOnQuest 1010
    .skill herbalism,<1,1
step
    #xprate <1.59
    #optional
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地面的|cRXP_PICK_草药包|r. 从中拾取|cRXP_LOOT_草药|r
    >>|cRXP_WARN_它们看起来像棕色的小袋子, 可以部分埋入地面, 不易被发现|r
    .complete 1010,1 --草药巴桑兰的头发 (5)
    .isOnQuest 1010
    .skill herbalism,1,1
step
    #xprate <1.59
    #optional
    .goto Ashenvale,26.43,38.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .turnin 1010 >>交任务: |cRXP_FRIENDLY_巴斯兰的头发|r
    .accept 1020 >>接任务: |cRXP_LOOT_奥雷迪尔的药剂|r
    .target Orendil Broadleaf
    .isQuestComplete 1010
step
    #optional
    #xprate <1.59
    .goto Ashenvale,26.43,38.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .accept 1020 >>接任务: |cRXP_LOOT_奥雷迪尔的药剂|r
    .target Orendil Broadleaf
    .isQuestTurnedIn 1010
step
	#xprate <1.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target Delgren the Purifier
    .goto Ashenvale,26.19,38.69
    .turnin 970 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 973 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
step
    #xprate <1.59
    .goto Ashenvale,31.89,22.53
    .xp 20 >>升级至20级
step
    .goto Ashenvale,26.43,38.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .accept 1010 >>接任务: |cRXP_LOOT_巴斯兰的头发|r
    .target Orendil Broadleaf
step
    #optional
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地面的|cRXP_PICK_草药包|r. 从中拾取|cRXP_LOOT_草药|r
    >>|cRXP_WARN_它们看起来像棕色的小袋子, 可以部分埋入地面, 不易被发现|r
    >>|cRXP_WARN_确保你已启用|r|T134916:0|t[追踪草药]|cRXP_WARN_enabled, 才能在小地图上看到它们|r
    .complete 1010,1 --草药巴桑兰的头发 (5)
    .skill herbalism,<1,1
step
    .goto Ashenvale,33.01,21.41,50,0
    .goto Ashenvale,29.53,24.33,40,0
    .goto Ashenvale,31.89,22.53
    >>打开地面的|cRXP_PICK_草药包|r. 从中拾取|cRXP_LOOT_草药|r
    >>|cRXP_WARN_它们看起来像棕色的小袋子, 可以部分埋入地面, 不易被发现|r
    .complete 1010,1 --草药巴桑兰的头发 (5)
    .skill herbalism,1,1
step
    .goto Ashenvale,26.43,38.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥雷迪尔·阔叶|r交谈
    .turnin 1010 >>交任务: |cRXP_FRIENDLY_巴斯兰的头发|r
    .accept 1020 >>接任务: |cRXP_LOOT_奥雷迪尔的药剂|r
    .target Orendil Broadleaf
step
    #xprate >1.59
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
	.target Therysil
    .goto Ashenvale,22.64,51.91
    .turnin 945 >>交任务: |cRXP_FRIENDLY_护送瑟瑞露尼|r
    .isQuestComplete 945
step
    #optional
    #completewith TZS
    .subzone 415 >>前往阿斯特兰纳
step
    #label AshenvaleEnd
    .goto Ashenvale,34.40,48.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fp Astranaar >>获取阿斯特兰纳的飞行路径
	.target Daelyshia
step
    #label TZS
    .goto Ashenvale,34.67,48.83
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛德瑞尔·速火|r交谈
    .accept 1008 >>接任务: |cRXP_LOOT_佐拉姆海岸|r
    .target Shindrell Swiftfire
step
    #xprate <1.59
    .goto Ashenvale,34.89,49.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵塞恩希尔|r交谈
    .accept 1070 >>接任务: |cRXP_LOOT_守卫石爪山|r
    .target Sentinel Thenysil
step
    #xprate <1.59
    .goto Ashenvale,35.76,49.10
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔德瑞斯·戈思谢尔|r交谈
    .accept 1056 >>接任务: |cRXP_LOOT_石爪峰之旅|r
    .target Faldreas Goeth'Shael
step
    #xprate <1.59
    .goto Ashenvale,36.61,49.58
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
    .accept 991 >>接任务: |cRXP_LOOT_莱恩的净化|r
    .accept 1054 >>接任务: |cRXP_LOOT_解除威胁|r
    .target Raene Wolfrunner
step << !Warlock
    #xprate <1.59
    .goto Ashenvale,36.99,49.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板基姆利雅|r交谈
    .home 415 >>将你的[炉石]设置为阿斯特兰纳
    .target Innkeeper Kimlya
step
    #xprate <1.59
    .goto Ashenvale,37.36,51.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
	.target Pelturas Whitemoon
    .turnin 1020 >>交任务: |cRXP_FRIENDLY_奥雷迪尔的药剂|r
    .timer 24,Orendil's Cure RP
    .accept 1033 >>接任务: |cRXP_LOOT_月神之泪|r
]])
