local faction = UnitFactionGroup("player")
if faction == "Horde" then return end


RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Alliance
#name 13-15 西部荒野
#displayname 13-15 西部荒野 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南((联盟)
#subgroup RXP生存指南 1-20
#defaultfor Human/Gnome/Dwarf/NightElf
#next 15-18 黑海岸

step
    #sticky
    .goto Elwynn Forest,19.00,81.00
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    .goto Westfall,59.95,19.35
    .target Farmer Furlbrow
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r交谈
    .accept 64 >>接任务: |cRXP_LOOT_遗失的怀表|r
    .accept 109 >>接任务: |cRXP_LOOT_向格里安·斯托曼报到|r
step
    .goto Westfall,59.92,19.42
    .target Verna Furlbrow
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .accept 36 >>接任务: |cRXP_LOOT_杂味炖肉|r
    .accept 151 >>接任务: |cRXP_LOOT_老马布兰契|r
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
step
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
    #era
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
	>>|cRXP_BUY_如需, 请购买食物或饮水|r << !Warrior !Rogue
	>>|cRXP_BUY_如果需要, 购买食物|r << Warrior/Rogue
    .vendor >>|T133918:0|t[长嘴泥鳅]|cRXP_WARN_非常便宜|r
	.target Innkeeper Heather
step
	#completewith bennytime
    >>打开地面上的|cRXP_PICK_Sacks of Oats|r, 拾取其中的|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_你通常可以在农场围栏或建筑物附近找到它们|r
    .complete 151,1 --Handful of Oats (8)
step
    #completewith HarvestW
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
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r 和|cRXP_ENEMY_迪菲亚走私者|r . 掠夺他们, 获取|cRXP_LOOT_红色皮质面罩|r
    .goto Westfall,48.21,46.70,60,0
    .goto Westfall,46.74,52.87,60,0
    .goto Westfall,50.74,40.07,60,0
    .goto Westfall,46.21,38.26,60,0
    .goto Westfall,41.21,40.75,60,0
    .goto Westfall,44.57,26.09,60,0
    .goto Westfall,48.21,46.70
    .goto Westfall,41.21,40.75
    .complete 12,1 -- Defias Trapper slain (15)
    .mob +Defias Trapper
    .complete 12,2 -- Defias Smuggler slain (15)
    .mob +Defias Smuggler
    .complete 153,1 -- Red Leather Bandana (15)
    .mob +Defias Trapper
    .mob +Defias Smuggler
step
	#label bennytime
    .goto Westfall,49.34,19.27
    >>打开|cRXP_PICK_法布隆的柜子|r. 从中获取|cRXP_LOOT_法布隆的怀表|r
    >>|cRXP_WARN_如果你调整相机角度正确, 可以从外面拾取|cRXP_PICK_法布隆的柜子|r|r
	>>|cRXP_WARN_留意|cRXP_ENEMY_Benny Blanco|r. 他伤害很高|r
    .complete 64,1 --Furlbrow's Pocket Watch
step
	#completewith next
    >>打开地面上的|cRXP_PICK_Sacks of Oats|r, 拾取其中的|cRXP_LOOT_一捧燕麦|r
	>>|cRXP_WARN_你通常可以在农场围栏或建筑物附近找到它们|r
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
    >>击杀 |cRXP_ENEMY_河爪豺狼人|r和 |cRXP_ENEMY_河爪斥候|r. 掠夺他们的 |cRXP_LOOT_豺狼人的爪子|r
    .complete 102,1 --Gnoll Paw (8)
    .mob Riverpaw Gnoll
    .mob Riverpaw Scout
step
    .goto Westfall,56.40,9.40,60,0
    .goto Westfall,52.13,10.36,60,0
    .goto Westfall,56.40,9.40,60,0
    .goto Westfall,52.13,10.36,60,0
    .goto Westfall,56.40,9.40
    >>击杀|cRXP_ENEMY_鱼人袭击者|r和|cRXP_ENEMY_滩行鱼人|r. 击败后搜刮他们的|cRXP_LOOT_眼睛|r
    .collect 730,3,38,1 --Murloc Eye (3)
    .mob Murloc Raider
    .mob Murloc Coastrunner
step
    .goto Westfall,57.48,13.58,60,0
    .goto Westfall,57.23,19.78,60,0
    .goto Westfall,52.13,33.22,60,0
    .goto Westfall,57.06,34.47,60,0
    .goto Westfall,57.23,19.78
    >>打开地面上的|cRXP_PICK_Sacks of Oats|r, 拾取其中的|cRXP_LOOT_一捧燕麦|r
	>>|cRXP_WARN_你通常可以在农场围栏或建筑物附近找到它们|r
	.complete 151,1 --Handful of Oats (8)
step
    #era
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >>交任务: |cRXP_FRIENDLY_遗失的怀表|r
    .target +Farmer Furlbrow
    .goto Westfall,59.95,19.35
    .turnin 151 >>交任务: |cRXP_FRIENDLY_老马布兰契|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
step
    #som
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜·法布隆|r交谈
    .turnin 64 >>交任务: |cRXP_FRIENDLY_遗失的怀表|r
    .target +Farmer Furlbrow
    .goto Westfall,59.95,19.35
    .turnin 151 >>交任务: |cRXP_FRIENDLY_老马布兰契|r
    .goto Westfall,59.92,19.42
	.target +Verna Furlbrow
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
    .goto Westfall,56.40,30.50
    .turnin 22 >>交任务: |cRXP_FRIENDLY_猪肝馅饼|r
    .isQuestComplete 22
    .target Salma Saldean
step
    #completewith next
	.goto Westfall,56.04,31.23
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .vendor
    >>|cRXP_WARN_请勿出售 |T133884:0|t[鱼人的眼球]和|T135997:0|t[血牙野猪的头]和|T134341:0|t[血牙野猪的肝] 或 |T133972:0|t[秃鹫肉条]|r
	.target Farmer Saldean
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
    >>击杀|cRXP_ENEMY_看守傀儡|r. 击败他们后搜刮出|cRXP_LOOT_灯油|r和|cRXP_LOOT_秋葵|r
    .complete 9,1 --Harvest Watcher (20)
    .collect 732,3,38,1 --Okra (3)
    .collect 814,5,103,1
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
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔玛·萨丁|r交谈
	.target Salma Saldean
    .goto Westfall,56.40,30.50
    .turnin 38 >>交任务: |cRXP_FRIENDLY_杂味炖肉|r
    .turnin 22 >>交任务: |cRXP_FRIENDLY_猪肝馅饼|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
	.target Gryan Stoutmantle
    .goto Westfall,56.33,47.52
    .turnin 12 >>交任务: |cRXP_FRIENDLY_西部荒野人民军|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
	.target Gryan Stoutmantle
    .goto Westfall,56.33,47.52
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与丹努文队长交谈|cRXP_FRIENDLY_丹努文队长|r
	.target Captain Danuvin
    .goto Westfall,56.42,47.62
    .turnin 102 >>交任务: |cRXP_FRIENDLY_西部荒野的豺狼人|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
	.target Scout Galiaan
    .goto Westfall,54.00,53.00
    .turnin 153 >>交任务: |cRXP_FRIENDLY_红色皮质面罩|r
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
    .xp 16 >>在西部荒野击杀螃蟹刷级至16级
step << Dwarf !Paladin/Gnome
    #label end
    .hs >>炉石传送至塞尔萨玛
step << Dwarf !Paladin/Gnome
    #hardcore
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
step << !NightElf
    .goto Ironforge,55.093,58.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼莎·火石|r交谈
    >>提升你的 |T135966:0|t[急救技能]
    .train 3274 >>火车急救员 急救
    .target Nissa Firestone
step << Human Warrior
    .goto Ironforge,62.0,89.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比克斯·晃骨|r交谈
    .train 2567 >>投掷训练
    .target Bixi Wobblebonk
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
step
    .goto Ironforge,39.553,57.478
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_参议员巴林·红石|r交谈
    .turnin 291 >>交任务: |cRXP_FRIENDLY_森内尔的报告|r
    .target Senator Barin Redstone
    .isOnQuest 291
step
    #ah
    .goto Ironforge,25.800,75.500,-1
    .goto Ironforge,24.200,74.600,-1
    .goto Ironforge,23.800,71.800,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铁炉堡拍卖商交谈|r
    >>请在黑海岸尽快购买以下物品以便立即提交. 如不打算购买任何物品, 请跳过此步骤
    >>|T133972:0|t[陆行鸟肉]
    >>|T133912:0|t[黑海岸石斑鱼]
    .collect 5469,5,2178,1 -- Strider Meat (5)
    .collect 12238,6,1141,1 -- Darkshore Grouper (6)
    .target Auctioneer Lympkin
    .target Auctioneer Redmuse
    .target Auctioneer Buckler
    .zoneskip Ironforge,1
step << !NightElf
    #hardcore
    .goto Dun Morogh,53.5,34.9
    .zone Dun Morogh>>前往: |cRXP_PICK_丹莫罗|r
step << !NightElf
    #hardcore
    #completewith next
    .goto Dun Morogh,59.43,42.85,150 >>前往丹莫罗 -> 湿地传送点
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
    >>|cRXP_WARN_观看视频指南, 了解如何跳过第一个！|r
    >>|cRXP_WARN_完成不死者任务：丹莫罗 -> 湿地 跳过|r
    >>|cRXP_WARN_穿越水域时避开 |cRXP_ENEMY_湿地鳄鱼|r 和 |cRXP_ENEMY_鱼人|r|r
    .link https://www.youtube.com/watch?v=9afQTimaiZQ >>|cRXP_WARN_点击此处查看视频攻略|r
    .goto Wetlands,12.1,60.3,80 >>前往: |cRXP_PICK_湿地|r
    .mob Wetlands Crocolisk
    .mob Young Wetlands Crocolisk
    .mob Bluegill Raider
step << !NightElf
    .money <0.08
    .goto Wetlands,10.4,56.0,15,0
    .goto Wetlands,10.1,56.9,15,0
    .goto Wetlands,10.6,57.2,15,0
    .goto Wetlands,10.761,56.737
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔·奥雷|r交谈
    .vendor >>|cRXP_BUY_购买|r|T133024:0|t[青铜管]
    >>|cRXP_WARN_这是一个限量供应的物品. 如果|cRXP_FRIENDLY_尼尔·奥雷|r没有此物品, 请跳过此步骤|r
	.target Neal Allen
    .bronzetube
step << !NightElf
    .goto Wetlands,10.43,61.01,10,0
    .goto Wetlands,10.496,60.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_萨莫尔·菲斯蒂沃斯|r交谈
    .vendor >>|cRXP_BUY_购买尽可能多的|r|T134831:0|t[治疗药水]|cRXP_BUY_可用|r
    >>|cRXP_WARN_这是一件限量供应的物品. 如果|cRXP_FRIENDLY_萨莫尔·菲斯蒂沃斯|r没有, 请跳过此步骤|r
    .target Samor Festivus
step << !NightElf
    .goto Wetlands,9.49,59.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_暴风城|r
    .fp Wetlands>>获取湿地飞行路线
    .target Shellei Brondir
step << Hunter !NightElf
	.goto Wetlands,11.334,59.554
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_穆恩达·德斯|r 对话
    >>|cRXP_WARN_购买|r|T135612:0|t[大口径短枪]
    >>如果无法承担, 可跳过此步骤
	.collect 3023,1 -- Large Bore Blunderbuss
    .target Murndan Derth
step << !NightElf
    .goto Wetlands,7.95,56.38
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德温·晨光|r交谈
    .vendor >>|cRXP_BUY_购买尽可能多的|r|T134831:0|t[治疗药水]|cRXP_BUY_可用|r
    >>|cRXP_WARN_这是一件限量供应的物品. 如果|cRXP_FRIENDLY_德温·晨光|r没有, 可跳过此步骤|r
    .target Dewin Shimmerdawn
step << !NightElf
    #completewith next
    .goto Wetlands,7.10,57.96,30,0
    .goto Wetlands,4.61,57.26,15 >>前往米奈希尔港码头, 等待开往黑海岸的船只
step << !NightElf
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
    >>|cRXP_WARN_在等待前往黑海岸的船时, 提升你的|r|T135966:0|t[急救]|cRXP_WARN_和|r|T133971:0|t[烹饪]|cRXP_WARN_技能|r
    >>|cRXP_WARN_提升你的|r|T133971:0|t[烹饪]|cRXP_WARN_技能等级, 使用你之前采集的|r|T133970:0|t|cRXP_LOOT_[野猪肉块]|r|cRXP_WARN_食材. 理想情况下将其升至10级|r
step << NightElf !Druid
    .goto Westfall,56.556,52.643
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fp Westfall >>获取西部荒野的飞行路径
    .fly Stormwind >>飞往暴风城
    .target Thor
step << Druid
	#completewith next
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
step << Druid
    .goto Moonglade,44.1444,45.227
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Silva Fil'naveth|r 交谈
    .skipgossip 1
    .fly Teldrassil >>飞往鲁瑟兰村
    .target Silva Fil'naveth
step << Druid
    #completewith next
    .goto Teldrassil,55.889,89.456
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Druid
    .goto Darnassus,35.375,8.405
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .accept 6121 >>接任务: |cRXP_LOOT_新的课程|r
    .accept 26 >>接任务: |cRXP_WARN_必修的课程|r
    .trainer >>训练你的职业法术
    .target Mathrengyl Bearwalker
step << Druid
	#completewith next
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
step << Druid
    .goto Moonglade,56.21,30.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上|cRXP_FRIENDLY_德迪利特·星焰|r谈话
    .turnin 6121 >>交任务: |cRXP_FRIENDLY_新的课程|r
    .accept 6122 >>接任务: |cRXP_LOOT_毒水之源|r
    .turnin 26 >>交任务: |cRXP_FRIENDLY_必修的课程|r
    .accept 29 >>接任务: |cRXP_LOOT_湖中试炼|r
    .target Dendrite Starblaze
step << Druid
    .goto Moonglade,52.6,51.6
    >>游入艾露恩阿拉湖
    >>打开一个|cRXP_PICK_神殿灵珠容器|r. 从中获取 |T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_它可能在水下不同位置生成|r
    .collect 15877,1,29,1 -- Shrine Bauble (1)
step << Druid
    #completewith next
    .cast 18960 >>传送术:月光林地
    >>|cRXP_WARN_这样会更快, 你就不需要游太久|r
step << Druid
    .goto Moonglade,36.026,41.374
    .use 15877 >>|cRXP_WARN_使用|r|T134125:0|t[神殿灵珠] |cRXP_WARN_在雷姆洛斯神殿的树旁|r
    .complete 29,1 --Complete the Trial of the Lake.
step << Druid
    .goto Moonglade,36.517,40.104
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔加里|r交谈
    .turnin 29 >>交任务: |cRXP_FRIENDLY_湖中试炼|r
    .target Tajarri
    .accept 272 >>接任务: |cRXP_LOOT_海狮试炼|r
step << NightElf Priest
    .goto StormwindClassic,38.550,26.853
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒修士|r谈话
    .trainer >>训练你的职业法术
    .target Brother Joshua
step << NightElf Warrior
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    .vendor >>|cRXP_BUY_购买|r|T133046:0|[巨型石锤]|cRXP_BUY_如果你买得起|r
    .target Gunther Weller
step << NightElf Rogue
    .goto StormwindClassic,57.547,57.076
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    .vendor >>|cRXP_BUY_购买|r|T133052:0|[锤子]|cRXP_BUY_如果你买得起|r
    .target Gunther Weller
step << NightElf Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .target Woo Ping
    .goto StormwindClassic,57.130,57.704
    .train 201 >>学习1小时剑术
step << NightElf Hunter
    .goto StormwindClassic,49.990,57.641
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗德瑞克·斯图瓦|r交谈
    >>|cRXP_BUY_购买|r|T135490:0|t[强化弓]
    >>|cRXP_BUY_储备|r|T132382:0|t[锋利的箭]
    .collect 3026,1
    .target Frederick Stover
step << NightElf
    .goto StormwindClassic,43.065,26.156
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>提升你的 |T135966:0|t[急救技能]
    .train 3274 >>火车急救员 急救
    .target Shaina Fuller
step << NightElf Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >>训练你的职业法术
    .target Wu Shen
    .target Ilsa Corbin
step << NightElf Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Osborne|r交谈
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
step << NightElf Hunter
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
    .trainer >>训练你的职业法术
    .target Einris Brightspear
step << NightElf
    .hs >>传送至奥伯丁
]])

RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Alliance
#name 15-18 黑海岸
#displayname 15-18 黑海岸 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南((联盟)
#subgroup RXP生存指南 1-20
--#defaultfor !NightElf
#next 18-19 洛克莫丹

step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
	.target Gwennyth Bly'Leggonde
    .goto Darkshore,36.71,44.98,5,0
    .goto Felwood,19.10,20.63
    .accept 3524 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
step << !NightElf
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
	.target Caylais Moonfeather
    .goto Darkshore,36.336,45.574
    .fp Auberdine >>获取奥伯丁的飞行路径
step << !NightElf
    .goto Darkshore,37.04,44.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shaussiy|r交谈
    .home >>将你的[炉石]设置为奥伯丁
    .target Innkeeper Shaussiy
step
    #completewith next
    .goto Darkshore,36.70,43.78,5 >>走上楼梯前往|cRXP_FRIENDLY_维兹班恩·曲针|r
step
#map Darkshore
    .goto Felwood,19.51,18.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈
    .accept 983 >>接任务: |cRXP_LOOT_传声盒827号|r
    .target Wizbang Cranktoggle
step
#map Darkshore
    .goto Felwood,21.63,18.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .accept 2118 >>接任务: |cRXP_LOOT_瘟疫蔓延|r
    .target Tharnariun Treetender
step
#map Darkshore
    #label BigThreat
    .goto Felwood,22.24,18.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
    .accept 984 >>接任务: |cRXP_LOOT_熊怪的威胁|r
    .target Terenthis
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
    .goto Darkshore,36.096,44.931
    .accept 1141 >>接任务: |cRXP_WARN_钓鱼世家|r
    .turnin 1141 >>交任务: |cRXP_FRIENDLY_钓鱼世家|r
    .itemcount 12238,6 -- Darkshore Grouper (6)
    .target Gubber Blump
step
    #completewith RabidThistle
    .goto Darkshore,35.88,47.01,0
    .goto Darkshore,36.50,53.30,0
    .goto Darkshore,35.72,55.84,0
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r. 击败它们后拾取其|cRXP_LOOT_Legs|r
    >>|cRXP_WARN_你可能需要下水才能看到它们|r
    .complete 983,1
    .mob Pygmy Tide Crawler
    .mob Young Reef Crawler
step
#map Darkshore
    .goto Felwood,18.81,26.69
    >>掠夺|cRXP_PICK_搁浅的海洋生物|r以获得|cRXP_LOOT_海洋生物的骸骨|r
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
    .use 7586 >>|cRXP_WARN_|cRXP_WARN_请选中|r |cRXP_ENEMY_狂暴蓟熊|r并使用|r|T134335:0|t[萨纳瑞恩的希望]|r
    .complete 2118,1
    .unitscan Rabid Thistle Bear
step
    .goto Darkshore,36.53,53.39,55,0
    .goto Darkshore,36.38,55.96,55,0
    .goto Darkshore,35.11,54.69,55,0
    .goto Darkshore,35.79,47.35,55,0
    .goto Darkshore,36.53,53.39
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r. 击败它们后拾取其|cRXP_LOOT_Legs|r
    >>|cRXP_WARN_你可能需要下水才能看到它们|r
    .complete 983,1
    .mob Pygmy Tide Crawler
    .mob Young Reef Crawler
step
#map Darkshore
    .goto Felwood,19.13,21.39
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .turnin 983 >>交任务: |cRXP_FRIENDLY_传声盒827号|r
step
#map Darkshore
	#era/som
	.goto Felwood,19.13,21.39
    >>点击地面上的|cRXP_PICK_传声盒827号|r
    .accept 1001 >>接任务: |cRXP_LOOT_传声盒411号|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
	.target Gwennyth Bly'Leggonde
    .goto Darkshore,36.71,44.98,10,0
    .goto Felwood,19.10,20.63
    .turnin 3524 >>交任务: |cRXP_FRIENDLY_搁浅的巨兽|r
    .accept 4681 >>接任务: |cRXP_LOOT_搁浅的巨兽|r
step
    #completewith next
    .goto Darkshore,36.88,44.10,8,0
    .goto Darkshore,36.01,43.77,10 >>前往码头上朝塞瑞利恩·白爪方向前进
step
#map Darkshore
    .goto Felwood,18.10,18.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
    .accept 963 >>接任务: |cRXP_LOOT_永志不渝|r
    .target Cerellean Whiteclaw
step
    #completewith next
    .goto 1439,32.432,43.744,15 >>走到码头尽头, 然后跳入水中
step
    #completewith washed1
    .goto Darkshore,33.59,40.36,0
    .goto Darkshore,30.94,45.79,0
    .goto Darkshore,33.03,48.13,0
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r. 击败它们并搜刮其|cRXP_LOOT_眼睛|r
    .complete 1001,1
    .mob Darkshore Thresher
step
#map Darkshore
    .goto Felwood,13.63,21.44
    >>掠夺|cRXP_PICK_海龟骨头|r以获得|cRXP_LOOT_海龟的残骸|r
    .complete 4681,1
step
#map Darkshore
    #label washed1
    .goto Darkshore,36.71,44.98,10,0
    .goto Felwood,19.10,20.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
    .turnin 4681 >>交任务: |cRXP_FRIENDLY_搁浅的巨兽|r
    .target Gwennyth Bly'Leggonde
step
.group
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
	.target Barithras Moonshade
    .goto Felwood,19.90,18.40
    .accept 947 >>接任务: |cRXP_LOOT_洞中的蘑菇|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
	.target Sentinel Glynda Nal'Shea
    .goto Felwood,20.34,18.12
    .accept 4811 >>接任务: |cRXP_LOOT_红色水晶|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
	.target Tharnariun Treetender
    .goto Felwood,21.63,18.15
    .turnin 2118 >>交任务: |cRXP_FRIENDLY_瘟疫蔓延|r
    .accept 2138 >>接任务: |cRXP_LOOT_清除疫病|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
	.target Terenthis
    .goto Felwood,22.24,18.22
    .turnin 984 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
    .accept 985 >>接任务: |cRXP_LOOT_熊怪的威胁|r
    .accept 4761 >>接任务: |cRXP_LOOT_桑迪斯·织风|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
	.target Gorbold Steelhand
    .goto Felwood,20.80,15.58
    .accept 982 >>接任务: |cRXP_LOOT_深不可测的海洋|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
	.target Thundris Windweaver
    .goto Felwood,19.98,14.40
    .turnin 4761 >>交任务: |cRXP_FRIENDLY_桑迪斯·织风|r
    .accept 4762 >>接任务: |cRXP_LOOT_壁泉河|r
    .accept 958 >>接任务: |cRXP_LOOT_上层精灵的工具|r
    .accept 954 >>接任务: |cRXP_LOOT_巴莎兰|r
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
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r. 击败它们并搜刮其|cRXP_LOOT_眼睛|r
    .complete 1001,1
    .mob Darkshore Thresher
step
    #completewith next
    .goto Darkshore,38.95,29.36,30 >>游向失事的银色黎明号船
step
#map Darkshore
    .goto Darkshore,38.95,29.36,10,0
    .goto Felwood,20.94,1.49
    >>|cRXP_WARN_通过底部破损的船体进入沉没的银色黎明号飞船. 下潜前请确保呼吸条已充满|r
    >>拾取地面上的银色清晨号的保险箱
    .complete 982,1
step
    #completewith next
    .goto Darkshore,40.30,27.56,30 >>游向沉没的迷雾面纱号船只
step
    #label MistVeil
    .goto Darkshore,40.30,27.56,10,0
    .goto Darkshore,39.63,27.45
    >>|cRXP_WARN_通过底部破损的船体进入沉没的迷雾面号. 下潜前请确保呼吸条已充满|r
    >>拾取地面上的迷雾之纱号的保险箱
    .complete 982,2
step
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
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r. 击败它们并搜刮其|cRXP_LOOT_眼睛|r
    .complete 1001,1
    .mob Darkshore Thresher
step
#map Darkshore
	#era/som
    .goto Felwood,25.19,1.29
    >>点击地面上的|cRXP_PICK_传声盒411号|r
    .turnin 1001 >>交任务: |cRXP_FRIENDLY_传声盒411号|r
    .accept 1002 >>接任务: |cRXP_LOOT_传声盒323号|r
step
#map Darkshore
    .goto Felwood,25.15,4.61
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4723 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step << Druid
    #completewith cure1
    >>在任务过程中收集 5 |T134187:0|t[地根草]
    .collect 2449,5,6123,1
step
    #completewith Ameth
    >>击杀|cRXP_ENEMY_森林陆行鸟|r和|cRXP_ENEMY_森林陆行鸟雏鸟|r, 搜刮它们以获得|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat
    .mob Foreststrider Fledgling
    .mob Foreststrider
step
    #era/som
    #completewith Ameth
    >>击杀|cRXP_ENEMY_月夜猛虎|r和|cRXP_ENEMY_月夜猛虎幼崽|r. 击败它们后拾取其|cRXP_LOOT_毒牙|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .unitscan Moonstalker;Moonstalker Runt
step
    #completewith bears1
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob Rabid Thistle Bear
step
    .goto Darkshore,44.18,20.60
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4725 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
    .goto Darkshore,50.81,25.50
    .use 12350 >>|cRXP_WARN_使用|r|T134865:0|t[空的水样试管] |cRXP_WARN_在悬崖泉河底部|r
    .complete 4762,1
step
#map Darkshore
    #completewith next
    .goto Felwood,27.70,10.03,60 >>前往巴莎兰
step
#map Darkshore
    #label bears1
    .goto Felwood,27.70,10.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    >>|cRXP_WARN_避免在途中击杀|cRXP_ENEMY_野生劣魔|r和|cRXP_ENEMY_恶灵劣魔|r|r
    .turnin 954 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .accept 955 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
step
    .goto Darkshore,44.78,37.91,40,0
    .goto Darkshore,45.43,39.15,40,0
    .goto Darkshore,46.30,39.01,40,0
    .goto Darkshore,47.36,36.86,40,0
    .goto Darkshore,44.80,36.91,40,0
    .goto Darkshore,46.30,39.01
    >>击杀|cRXP_ENEMY_野生劣魔|r和|cRXP_ENEMY_恶灵劣魔|r, 搜刮他们的|cRXP_LOOT_耳环|r
    .complete 955,1
    .mob Wild Grell
    .mob Vile Sprite
step
#map Darkshore
    .goto Felwood,27.70,10.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 955 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .accept 956 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
step
    .goto Darkshore,45.88,38.56,40,0
    .goto Darkshore,46.76,39.13,40,0
    .goto Darkshore,47.69,36.73,40,0
    .goto Darkshore,45.07,36.76
    >>击杀|cRXP_ENEMY_Deth'ryll Satyr|r. 击败后可获得|cRXP_LOOT_Moonstone Seal|r
    .complete 956,1
    .mob Deth'ryll Satyr
step
#map Darkshore
    .goto Felwood,27.70,10.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 956 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
    .accept 957 >>接任务: |cRXP_LOOT_巴莎兰|r
    .target Asterion
step << !NightElf
#map Darkshore
    .goto Felwood,31.29,24.14
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 从它们身上搜刮出 |T132832:0|t[|cRXP_LOOT_小蛋|r]
    >>|cRXP_WARN_你将升级|r|T133971:0|t[烹饪] |cRXP_WARN_至 10 级, 使用|r|T132832:0|t[|cRXP_LOOT_小蛋|r]
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
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 从它们身上搜刮出 |T132832:0|t[|cRXP_LOOT_小蛋|r]
    .collect 6889,10,2178,1,0x20,cooking -- Small Egg
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
step
    #completewith next
    .goto Darkshore,40.30,59.70,70 >>向南前往亚米萨兰的|cRXP_FRIENDLY_哨兵坦莎·月刃|r
step
    #label Ameth
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
	.target Sentinel Tysha Moonblade
    .goto Darkshore,40.30,59.70
    .accept 953 >>接任务: |cRXP_LOOT_亚米萨兰的毁灭|r
step
    #completewith TheLay
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r. 从她身上搜刮出她的|cRXP_LOOT_项链|r
    >>|cRXP_ENEMY_安娜雅·晨路|r|cRXP_WARN_patrols 亚米萨兰|r
    .complete 963,1
    .unitscan Anaya Dawnrunner
step
    #completewith TheLay
    >>击杀 |cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r和 |cRXP_ENEMY_哀嚎的贵族|r. 击败后掠夺他们的 |cRXP_LOOT_遗物|r
    .complete 958,1
    .mob Cursed Highborne
    .mob Writhing Highborne
    .mob Wailing Highborne
step
#map Darkshore
    .goto Felwood,25.98,40.62
    >>点击|cRXP_PICK_亚米萨兰的毁灭|r
    .complete 953,2 -- The Fall of Ameth'Aran
step
#map Darkshore
    .goto Felwood,25.66,39.11
    >>点击|cRXP_PICK_上古之火|r
    .complete 957,1
step
    #label TheLay
    .goto Darkshore,43.30,58.70
    >>点击|cRXP_PICK_亚米萨兰的衰落|r
    .complete 953,1 -- The Lay of Ameth'Aran
step
    #completewith next
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r. 从她身上搜刮出她的|cRXP_LOOT_项链|r
    >>|cRXP_ENEMY_安娜雅·晨路|r|cRXP_WARN_patrols 亚米萨兰|r
    .complete 963,1
    .unitscan Anaya Dawnrunner
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
    >>击杀 |cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r和 |cRXP_ENEMY_哀嚎的贵族|r. 击败后掠夺他们的 |cRXP_LOOT_遗物|r
    .complete 958,1
    .mob Cursed Highborne
    .mob Writhing Highborne
    .mob Wailing Highborne
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
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r. 从她身上搜刮出她的|cRXP_LOOT_项链|r
    >>|cRXP_ENEMY_安娜雅·晨路|r|cRXP_WARN_巡逻阿梅萨兰. 她的刷新时间较长, 如果她现在还没出现, 你可以跳过这一步|r
    .complete 963,1
    .unitscan Anaya Dawnrunner
step
#map Darkshore
    .goto Felwood,23.29,36.73
    .target Sentinel Tysha Moonblade
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈
    .turnin 953 >>交任务: |cRXP_FRIENDLY_亚米萨兰的毁灭|r
step
    #era/som
    #completewith ReturnAuber
    >>击杀|cRXP_ENEMY_月夜猛虎|r和|cRXP_ENEMY_月夜猛虎幼崽|r. 击败它们后拾取其|cRXP_LOOT_毒牙|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .unitscan Moonstalker;Moonstalker Runt
step
    #completewith BearComplete
    >>击杀|cRXP_ENEMY_森林陆行鸟|r和|cRXP_ENEMY_森林陆行鸟雏鸟|r, 搜刮它们以获得|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat
    .mob Foreststrider Fledgling
    .mob Foreststrider
step
    #completewith Beached4728
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r
    .complete 2138,1 -- Rabid Thistle Bear slain (20)
    .mob Rabid Thistle Bear
step
    >>击杀黑木探路者和黑木风语者
    .goto Darkshore,39.84,53.82,50,0
    .goto Darkshore,40.03,56.24,50,0
    .goto Darkshore,39.34,56.58,50,0
    .goto Darkshore,39.84,53.82
    .complete 985,1 -- Blackwood Pathfinder
    .mob +Blackwood Pathfinder
    .complete 985,2 -- Blackwood Windtalker
    .mob +Blackwood Windtalker
step
#map Darkshore
    .goto Felwood,22.39,29.45
    .xp 16 >>刷到16级

step
#map Darkshore
    .goto Felwood,19.64,39.52
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4722 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
#map Darkshore
    #label Beached4728
    .goto Felwood,18.41,49.43
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4728 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
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
    .mob Rabid Thistle Bear
step
    .goto Darkshore,40.11,69.39,60,0
    .goto Darkshore,43.37,68.78,70,0
    .goto Darkshore,41.97,64.81,70,0
    .goto Darkshore,38.51,64.72,70,0
    .goto Darkshore,38.67,59.54,60,0
    .goto Darkshore,40.11,69.39
    >>击杀|cRXP_ENEMY_森林陆行鸟|r和|cRXP_ENEMY_森林陆行鸟雏鸟|r, 搜刮它们以获得|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 -- Strider Meat
    .mob Foreststrider Fledgling
    .mob Foreststrider
step
#map Darkshore
    #label ReturnAuber
    #completewith ManyBeached
    .goto Felwood,18.50,19.87,100 >>前往奥伯丁
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
	.target Gubber Blump
    .goto Felwood,18.50,19.87
    .accept 1138 >>接任务: |cRXP_LOOT_海中的水果|r
step
#map Darkshore
    #label ManyBeached
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
	.target Gwennyth Bly'Leggonde
    .goto Darkshore,36.71,44.98,5,0
    .goto Felwood,19.10,20.63
    .turnin 4723 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .turnin 4728 >>交任务: |cRXP_FRIENDLY_搁浅的海洋生物|r
    .turnin 4722 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
    .turnin 4725 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
step
    #completewith next
    .goto Darkshore,36.88,44.10,8,0
    .goto Darkshore,36.01,43.77,10 >>前往码头上朝塞瑞利恩·白爪方向前进
step
#map Darkshore
	.isQuestComplete 963
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈
	.target Cerellean Whiteclaw
    .goto Felwood,18.10,18.48
    .turnin 963 >>交任务: |cRXP_FRIENDLY_永志不渝|r
step << !NightElf !Mage !Paladin !Warlock
    .goto Darkshore,33.17,40.17,40,0
    .goto Darkshore,33.17,40.17,0
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Darnassus
step << !NightElf !Mage !Paladin !Warlock
    #completewith next
    .goto Teldrassil,55.889,89.456
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << !NightElf Hunter
    .goto Darnassus,40.377,8.545
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖卡斯特|r交谈
    .trainer >>训练你的职业法术
    .target Jocaste
step << !NightElf Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贾德莉亚|r交谈
    .goto Darnassus,37.901,82.742
    .trainer >>训练你的职业法术
    .target Jandria
step << !NightElf Warrior
    .goto Darnassus,58.945,35.336
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达纳斯·刃歌|r交谈
    .trainer >>训练你的职业法术
    .target Darnath Bladesinger
step << !NightElf Rogue
    .goto Darnassus,31.21,17.72,8,0
    .goto Darnassus,36.99,21.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树屋内的|cRXP_FRIENDLY_塞尤娜|r交谈
    .trainer >>训练你的职业法术
    .target Syurna
step << !NightElf Hunter/!NightElf Warrior
    #sticky
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊琳尼雅·月火|r交谈
    .goto Darnassus,57.56,46.72
    .train 264 >>训练弓箭
    .train 227 >>训练法杖
    .target Ilyenia Moonfire
step << !NightElf !Mage !Paladin !Warlock
    .goto Darnassus,30.7,41.3,15 >>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Darkshore
    .zoneskip Teldrassil
step << !NightElf !Mage !Paladin !Warlock
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >>飞往黑海岸
    .target Vesprystus
step
    #completewith next
    .goto Darkshore,38.109,41.170,5,0
    .goto Darkshore,37.512,41.674
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
    +购买 |T134059:0|t[甜香料]
    >>|cRXP_WARN_使用|r|T134059:0|t[甜香料] |cRXP_WARN_和你的|r|T132832:0|t[小蛋] |cRXP_WARN_制作草药焗蛋. 重复此操作, 直到你的烹饪技能达到10级|r
    .skill cooking,10,1 -- step only displays if cooking skill is less than 10
    .target Gorbold Steelhand
step
    #completewith ezstrider
    +|cRXP_WARN_使用你的|r|T133971:0|t[烹饪]|cRXP_WARN_专业技能制作草药焗蛋, 重复此操作直至你的|r|T133971:0|t[烹饪]|cRXP_WARN_等级达到10级|r
    .skill cooking,10,1 -- step only displays if cooking skill is less than 10
    .target Gorbold Steelhand
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高尔博德·钢手|r交谈
	.target Gorbold Steelhand
    .goto Felwood,20.80,15.58
    .turnin 982 >>交任务: |cRXP_FRIENDLY_深不可测的海洋|r
step
    #label ezstrider
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
	.target Alanndarian Nightsong
    .goto Darkshore,37.70,40.70
    .accept 2178 >>接任务: |cRXP_LOOT_炖陆行鸟|r
    .turnin 2178 >>交任务: |cRXP_FRIENDLY_炖陆行鸟|r
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher than x
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
	.target Thundris Windweaver
    .goto Felwood,19.98,14.40
    .turnin 958 >>交任务: |cRXP_FRIENDLY_上层精灵的工具|r
    .turnin 4762 >>交任务: |cRXP_FRIENDLY_壁泉河|r
    .accept 4763 >>接任务: |cRXP_LOOT_黑木熊怪的堕落|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
	.target Sentinel Glynda Nal'Shea
    .goto Felwood,20.34,18.12
    .turnin 4811 >>交任务: |cRXP_FRIENDLY_红色水晶|r
    .accept 4812 >>接任务: |cRXP_LOOT_清洗水晶|r
step
#sticky
#label tube1
    .goto Darkshore,37.78,44.06
    .use 14338 >>|cRXP_WARN_使用|r|T134865:0|t[空水瓶]|cRXP_WARN_在羽月岗哨|r
    .complete 4812,1
step
    .goto Darkshore,37.78,44.06
    .use 12346 >>|cRXP_WARN_使用|r|T133748:0|t[空的净化碗]|cRXP_WARN_在羽月岗哨|r
    .collect 12347,1,4763,1
step
#requires tube1
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
	.target Tharnariun Treetender
    .goto Felwood,21.63,18.15
    .turnin 2138 >>交任务: |cRXP_FRIENDLY_清除疫病|r
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
	.target Terenthis
    .goto Felwood,22.24,18.22
    .turnin 985 >>交任务: |cRXP_FRIENDLY_熊怪的威胁|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
	.target Terenthis
    .goto Felwood,22.24,18.22
    .accept 986 >>接任务: |cRXP_LOOT_丢失的主人|r
    .group
step
#map Darkshore
    .goto Darkshore,39.26,43.04,5,0
    .goto Felwood,21.86,18.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话楼上|cRXP_FRIENDLY_哨兵艾莉萨·星风|r
    .accept 965 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
    .target Sentinel Elissa Starbreeze
step
    #era/som
    #completewith CliffCave
    >>击杀|cRXP_ENEMY_月夜猛虎|r和|cRXP_ENEMY_月夜猛虎幼崽|r. 击败它们后拾取其|cRXP_LOOT_毒牙|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .unitscan Moonstalker;Moonstalker Runt
step
#map Darkshore
    #completewith next
    .goto Felwood,31.29,24.14,15 >>再次前往红色水晶
step
#map Darkshore
    .goto Felwood,31.29,24.14
    >>点击|cRXP_PICK_红色水晶|r
    .turnin 4812 >>交任务: |cRXP_FRIENDLY_清洗水晶|r
    .accept 4813 >>接任务: |cRXP_LOOT_水晶中的碎骨|r
step
#map Darkshore
    #completewith next
    .goto Felwood,27.70,10.03,70 >>前往巴莎兰找|cRXP_FRIENDLY_阿斯特利安|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿斯特利安|r交谈
	.target Asterion
    .goto Felwood,27.70,10.03
    .turnin 957 >>交任务: |cRXP_FRIENDLY_巴莎兰|r
step << Paladin
    .goto Darkshore,50.74,34.68
	>>击杀|cRXP_ENEMY_黑木战士|r 和|cRXP_ENEMY_黑木图腾师|r . 掠夺他们以获取 |T132889:0|t[亚麻布]
    >>|cRXP_WARN_你需要保存 10|r|T132889:0|t[亚麻布] |cRXP_WARN_以备稍后完成|r|T626003:0|t|cFFF48CBASan骑士|r|cRXP_WARN_职业任务|r
	.collect 2589,10,1,1644 --Linen Cloth (10)
    .mob Blackwood Warrior
    .mob Blackwood Totemic
step
.group
    .goto Darkshore,50.66,34.94
    >>打开|cRXP_PICK_黑木谷物商店|r. 搜刮获得|cRXP_LOOT_黑木谷物样本|r
    >>|cRXP_WARN_掠夺此物品会刷新2只|cRXP_ENEMY_黑木熊怪|r, 它们会仇恨并冲向你. 请做好战斗准备或重置它们|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
step
.group
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀|cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_蓟熊幼崽|r可以施放|r|T132152:0|t[毁灭]|cRXP_WARN_, 这是一种近战瞬发技能, 会使你眩晕2秒|r
    .complete 2139,1 --Den Mother (1)
    .mob Den Mother
    .mob Thistle Cub
step
.group
    .goto Darkshore,51.83,33.50
    >>打开|cRXP_PICK_黑木坚果商店|r, 从中获取|cRXP_LOOT_黑木坚果样本|r
    >>|cRXP_WARN_掠夺此物品会刷新2只|cRXP_ENEMY_黑木熊怪|r, 它们会仇恨并冲向你. 请做好战斗准备或重置它们|r
    .collect 12343,1,4763,1 -- Blackwood Nut Sample (1)
step
.group
    #label Fruit
    .goto Darkshore,52.86,33.41
    >>打开|cRXP_PICK_黑木水果商店|r. 从中获取|cRXP_LOOT_黑木水果样本|r
    >>|cRXP_WARN_掠夺此物品会刷新2只|cRXP_ENEMY_黑木熊怪|r, 它们会仇恨并冲向你. 请做好战斗准备或重置它们|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
step
.group
    #completewith next
    .goto Darkshore,52.38,33.39
    .cast 16072 >>|cRXP_WARN_使用|r|T134712:0|t[装满水的净化碗] |cRXP_WARN_在 |cRXP_PICK_篝火|r处召唤|r|cRXP_ENEMY_萨巴克希斯|r
    .timer 17,The Blackwood Corrupted RP
    .use 12347
step
.group
    .goto Darkshore,52.38,33.39
    >>击杀|cRXP_ENEMY_萨巴克希斯|r. 打开他掉落在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r, 从中拾取|cRXP_LOOT_堕落护符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob Xabraxxis
step
.group << !Druid
#map Darkshore
    #label CliffCave
    #completewith next
    .goto Darkshore,54.99,32.04,30,0
    .goto Darkshore,54.99,33.41,15 >>前往悬崖泉河洞窟
step << Druid
    >>|cRXP_WARN_使用|r|T134776:0|t[空的峭壁之泉取样器]|cRXP_WARN_在悬崖泉河洞穴入口处的水中|r
    .goto Darkshore,54.99,33.41
    .complete 6122,1 --Filled Cliffspring Falls Sampler (1)
step
.group
    .goto Darkshore,55.66,34.89
    >>拾取地面上的|cRXP_LOOT_粗柄蘑菇|r和|cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_待在上半部分. 如果|cRXP_LOOT_毒帽蘑菇|r不在顶部尽头, 请跳下去从下方获取一个|r
    >>|cRXP_WARN_不要背对中心！|cRXP_ENEMY_风暴鳞波浪骑手|r会将你击退！|r
    .complete 947,1 --Scaber Stalk (5)
    .complete 947,2 --Death Cap (1)
step
.group
    .isQuestComplete 947
    .goto Darkshore,54.81,32.92,30 >>离开悬崖泉河洞窟
step
    #completewith next
    >>击杀|cRXP_ENEMY_月夜猛虎|r和|cRXP_ENEMY_月夜猛虎幼崽|r. 击败它们后拾取其|cRXP_LOOT_毒牙|r
    .complete 1002,1 -- Moonstalker Fang (6)
    .unitscan Moonstalker;Moonstalker Runt
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
	.target Balthule Shadowstrike
    .goto Winterspring,4.82,27.18
    .turnin 965 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 966 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
step << !Paladin
    .goto Darkshore,55.27,27.74,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,57.54,25.99,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,55.27,27.74
    >>击杀|r暗滩狂热者|cRXP_ENEMY_. 从他们身上搜刮|r|cRXP_LOOT_羊皮卷|r
    .complete 966,1 --Worn Parchment (4)
    .mob Dark Strand Fanatic
step << Paladin
    .goto Darkshore,55.27,27.74,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,57.54,25.99,40,0
    .goto Darkshore,56.92,27.27,40,0
    .goto Darkshore,55.27,27.74
    >>击杀|r|cRXP_ENEMY_暗滩狂热者|r. 掠夺他们以获得|r|cRXP_LOOT_羊皮卷|r和|T132889:0|t[亚麻布]
    >>|cRXP_WARN_你需要保存 10|r|T132889:0|t[亚麻布] |cRXP_WARN_以备稍后完成|r|T626003:0|t|cFFF48CBASan骑士|r|cRXP_WARN_职业任务|r
    .complete 966,1 --Worn Parchment (4)
    .collect 2589,10,1,1644 --Linen Cloth (10)
    .mob Dark Strand Fanatic
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴苏尔·影击|r交谈
	.target Balthule Shadowstrike
    .goto Winterspring,4.82,27.18
    .turnin 966 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 967 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
step
.group 3
#map Darkshore
    #completewith next
    .goto Winterspring,6.37,16.66,50 >>前往迷雾边缘
step
.group 3
#map Darkshore
    .goto Winterspring,6.37,16.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .accept 2098 >>接任务: |cRXP_LOOT_基尔卡克的钥匙|r
    .target Gelkak Gyromast
step
.group 3
    #completewith next
    .goto Darkshore,56.10,16.88,0
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r 和|cRXP_ENEMY_硬壳潮行蟹|r , 从它们身上搜刮出|cRXP_LOOT_戈尔卡克钥匙的底部|r
    >>|cRXP_WARN_注意|r狂暴暗礁蟹|r |T132152:0|t[猛击]技能. 它们的近战攻击可立即造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key
    .mob Raging Reef Crawler
    .mob Encrusted Tide Crawler
step
.group 3
    .goto Darkshore,54.93,12.19
    >>击杀|cRXP_ENEMY_灰雾智者|r 和|cRXP_ENEMY_灰雾潮行者|r . 击败他们后搜刮出|cRXP_LOOT_盖尔卡克之钥的中间部分|r
    >>|cRXP_WARN_请注意|cRXP_ENEMY_灰雾智者|r|T136048:0|t[闪电箭]伤害, 它们也可使用 |T136052:0|t[治疗波] 进行治疗|r
    >>注意, |cRXP_ENEMY_灰雾潮行者|r 在近战时可以施放 |T136016:0|t[|cRXP_FRIENDLY_中毒|r ], 造成每3秒13点伤害, 持续30秒
    .complete 2098,2 -- Middle of Gelkak's Key (1)
    .mob Greymist Oracle
    .mob Greymist Tidehunter
step
.group 3
    .goto Darkshore,55.59,16.98,45,0
    .goto Darkshore,53.76,18.96,45,0
    .goto Darkshore,51.34,22.00,45,0
    .goto Darkshore,56.63,12.08
    >>击杀|cRXP_ENEMY_狂暴暗礁蟹|r 和|cRXP_ENEMY_硬壳潮行蟹|r , 从它们身上搜刮出|cRXP_LOOT_戈尔卡克钥匙的底部|r
    >>|cRXP_WARN_注意|r狂暴暗礁蟹|r |T132152:0|t[猛击]技能. 它们的近战攻击可立即造成200点伤害|r
    .complete 2098,3 -- Bottom of Gelkak's Key
    .mob Raging Reef Crawler
    .mob Encrusted Tide Crawler
step
.group 3
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
.group
    .goto Darkshore,61.40,9.40,45,0
    .goto Darkshore,62.42,7.67
    >>击杀月夜雄虎和月夜雌虎. 从它们身上掠夺兽皮和毒牙
    >>|cRXP_WARN_注意|cRXP_ENEMY_月夜雌虎|r. 她们总是带着一只|cRXP_ENEMY_月夜猛虎幼崽|r一同进攻|r
    >>|cRXP_ENEMY_月夜雄虎|r可以施放 |T132090:0|t[弱点打击], 如果你背对它们, 将触发一次造成 20-40 点伤害的背刺攻击
    .complete 986,1 -- Fine Moonstalker Pelt (5)
    .complete 1002,1 -- Moonstalker Fang (6)
    .mob Moonstalker Sire
    .mob Moonstalker Matriarch
    .mob Moonstalker Runt
    .isOnQuest 986,1002
step
.group 3
#map Darkshore
    #requires foreststriders
    .goto Winterspring,6.37,16.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .turnin 2098 >>交任务: |cRXP_FRIENDLY_基尔卡克的钥匙|r
    .accept 2078 >>接任务: |cRXP_LOOT_基尔卡克的报复|r
    .target Gelkak Gyromast
step
.group 3
#map Darkshore
    .goto Winterspring,5.59,21.09,10,0
    .goto Winterspring,6.37,16.66
    >>与|cRXP_FRIENDLY_机械打手4100型|r交谈以开启护送任务
    >>护送|cRXP_FRIENDLY_机械打手4100型|r至|cRXP_FRIENDLY_基尔卡克·旋杆|r
    >>一旦机械打手4100型变成敌对状态, 将其击杀
    >>|cRXP_WARN_这个任务非常困难|r
    .skipgossip
    .complete 2078,1
    .link https://youtu.be/1WRRmKYBr9s >>|cRXP_WARN_点击此处查看视频攻略|r
    .mob The Threshwackonator 4100
step
.group 3
#map Darkshore
    .goto Winterspring,6.37,16.66
    .target Gelkak Gyromast
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔卡克·旋杆|r交谈
    .turnin 2078 >>交任务: |cRXP_FRIENDLY_基尔卡克的报复|r
    .isQuestComplete 2078
step
.group
    #sticky
    .destroy 7442 >>摧毁: |cRXP_ENEMY_基尔卡克的钥匙|r
step
#map Darkshore
    .goto Winterspring,3.10,20.90
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4727 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step << Druid
    .goto Darkshore,48.87,11.32
    >>|cRXP_WARN_游到水中|r
    >>打开|cRXP_PICK_奇怪的保险箱|r, 从中获取|cRXP_LOOT_水兽敏捷坠饰|r
    .collect 15883,1,272,1 --Collect Half Pendant of Aquatic Agility (x1)
step
    #completewith next
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r, 击败它们后可获得|cRXP_LOOT_蟹块|r
    >>|cRXP_WARN_如果|cRXP_ENEMY_硬壳潮行蟹|r太强, 就只集中攻击|cRXP_ENEMY_暗礁蟹|r|r
    >>请注意, |cRXP_ENEMY_暗礁蟹|r 可以施放 |T132155:0|t[肌肉撕裂], 这是一种瞬间攻击, 造成 30-55 点伤害
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
    .mob Reef Crawler
step
#map Darkshore
    .goto Winterspring,1.42,26.89
    >>点击地面上的|cRXP_PICK_传声盒323号|r
    .turnin 1002 >>交任务: |cRXP_FRIENDLY_传声盒323号|r
    .accept 1003 >>接任务: |cRXP_LOOT_传声盒525号|r
step
    .goto Darkshore,51.50,22.26,50,0
    .goto Darkshore,49.66,21.39
    >>击杀|cRXP_ENEMY_硬壳潮行蟹|r和|cRXP_ENEMY_暗礁蟹|r, 击败它们后可获得|cRXP_LOOT_蟹块|r
    >>|cRXP_WARN_如果|cRXP_ENEMY_硬壳潮行蟹|r太强, 就只集中攻击|cRXP_ENEMY_暗礁蟹|r|r
    >>请注意, |cRXP_ENEMY_暗礁蟹|r 可以施放 |T132155:0|t[肌肉撕裂], 这是一种瞬间攻击, 造成 30-55 点伤害
    .complete 1138,1 -- Fine Crab Chunks (6)
    .mob Encrusted Tide Crawler
    .mob Reef Crawler
step
    .goto Darkshore,50.74,34.68
	.xp 18-2750 >>刷怪直到距离18级还差2750点经验值
    >>击杀|cRXP_ENEMY_黑木战士|r和|cRXP_ENEMY_黑木图腾师|r
    .mob Blackwood Warrior
    .mob Blackwood Totemic
step
    #completewith NorthDarkshore
    #map Darkshore
    .goto Felwood,18.50,19.87,100 >>前往奥伯丁
    .cooldown item,6948,<0
step
    #completewith next
    .hs >>传送至奥伯丁
    .cooldown item,6948,>0,1
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈
	.target Gwennyth Bly'Leggonde
    .goto Darkshore,36.71,44.98,5,0
    .goto Felwood,19.10,20.63
    .turnin 4727 >>交任务: |cRXP_FRIENDLY_搁浅的海龟|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古博·布拉普|r交谈
	.target Gubber Blump
    .goto Felwood,18.50,19.87
    .turnin 1138 >>交任务: |cRXP_FRIENDLY_海中的水果|r
step
.group
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
	.target Barithras Moonshade
    .goto Felwood,19.90,18.40
    .turnin 947 >>交任务: |cRXP_FRIENDLY_洞中的蘑菇|r
    .accept 948 >>接任务: |cRXP_LOOT_安努|r
step
#map Darkshore
    #label NorthDarkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_森提内尔格琳达·纳尔谢|r交谈
	.target Sentinel Glynda Nal'Shea
    .goto Darkshore,37.70,43.39
    .turnin 4813 >>交任务: |cRXP_FRIENDLY_水晶中的碎骨|r
step
.group
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
	.target Tharnariun Treetender
    .goto Felwood,21.63,18.15
    .turnin 2139 >>交任务: |cRXP_FRIENDLY_萨纳瑞恩的希望|r
step
.group
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
	.target Terenthis
    .goto Darkshore,39.37,43.48
    .turnin 986 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
    .accept 993 >>接任务: |cRXP_LOOT_丢失的主人|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
	.target Alanndarian Nightsong
    .goto Darkshore,37.70,40.70
    .accept 2178 >>接任务: |cRXP_LOOT_炖陆行鸟|r
    .turnin 2178 >>交任务: |cRXP_FRIENDLY_炖陆行鸟|r
    .skill cooking,<10,1 -- step only displays if skill is 10 or higher than x
step
.group
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
	.target Thundris Windweaver
    .goto Felwood,19.98,14.40
    .turnin 4763 >>交任务: |cRXP_FRIENDLY_黑木熊怪的堕落|r
step << Druid
    .goto Darkshore,37.7,40.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .turnin 6122 >>交任务: |cRXP_FRIENDLY_毒水之源|r
    .target Alanndarian Nightsong
    .accept 6123 >>接任务: |cRXP_LOOT_收集解药|r
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
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 从它们身上搜刮出 |T132832:0|t[|cRXP_LOOT_小蛋|r]
    >>稍后完成任务需要50点烹饪技能
    .collect 6889,40,90,1,0x21,cooking
    >>在洞穴各处地面拾取|cRXP_LOOT_Lunar Fungi|r的战利品
    .complete 6123,2
step
    .goto Darkshore,45.34,49.70,60,0
    .goto Darkshore,45.48,45.24,60,0
    .goto Darkshore,42.73,45.67,60,0
    .goto Darkshore,45.34,49.70,60,0
    .goto Darkshore,45.48,45.24,60,0
    .goto Darkshore,42.73,45.67
    >>击杀|cRXP_ENEMY_月夜枭兽|r. 从它们身上搜刮出 |T132832:0|t[|cRXP_LOOT_小蛋|r]
    >>稍后完成任务需要50点烹饪技能
    .collect 6889,40,90,1,0x20,cooking
    .mob Young Moonkin
    .mob Raging Moonkin
    .mob Moonkin Oracle
    .mob Moonkin
step << Druid
    >>完成收集 5 |T134187:0|t[地根草]
    >>你可以沿着东边的山脉采集它们
    .collect 2449,5,6123,1
step << Druid
    #requires earthroot
    .goto Darkshore,37.7,40.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈
    .turnin 6123 >>交任务: |cRXP_FRIENDLY_收集解药|r
    .accept 6124 >>接任务: |cRXP_LOOT_消除疾病|r
    .target Alanndarian Nightsong
step << Druid
    .goto Darkshore,41.0,79.6
    >>|cRXP_WARN_向南前进时使用|r|T132801:0|t[动物医疗药膏], |cRXP_WARN_目标: |r|cRXP_ENEMY_生病的鹿|r
    .complete 6124,1 -- Sickly Deer cured (10)
    .unitscan Sickly Deer
step << Druid
	#completewith next
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
step << Druid
    .goto Moonglade,56.2,30.4
    >>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 6124 >>交任务: |cRXP_FRIENDLY_消除疾病|r
    .accept 6125 >>接任务: |cRXP_LOOT_解毒之术|r
    .target Dendrite Starblaze
step << Druid
    .goto Moonglade,52.53,40.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >>训练你的职业法术
    .target Loganaar
step << Druid
    .goto Moonglade,44.1444,45.227
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Silva Fil'naveth|r 交谈
    .skipgossip 1
    .fly Teldrassil >>飞往鲁瑟兰村
    .target Silva Fil'naveth
    .zoneskip Teldrassil
    .zoneskip Darnassus
step << Druid
    #completewith next
    .goto Teldrassil,55.889,89.456
    .zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << Druid
    .goto Darnassus,35.375,8.405
    .target Mathrengyl Bearwalker
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_玛斯雷·驭熊者|r交谈
    .turnin 6125 >>交任务: |cRXP_FRIENDLY_解毒之术|r
step << Druid
    .goto Darnassus,30.7,41.3 >>前往: |cRXP_PICK_泰达希尔|r
    .zoneskip Darkshore
    .zoneskip Teldrassil
step << Druid
    .goto Teldrassil,58.39,94.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fly Darkshore >>飞往黑海岸
    .target Vesprystus
step
    #completewith next
    .goto 1439,32.432,43.744,15 >>前往奥伯丁码头, 等待前往米奈希尔港的船
step
    .goto Darkshore,32.44,43.71
    >>|cRXP_WARN_提升你的|r|T135966:0|t[急救]|cRXP_WARN_等级, 或|r|T33971:0|t[烹饪]|cRXP_WARN_等级, 同时等待米奈希尔港的船只|r
    .zone Wetlands >>前往: |cRXP_PICK_湿地|r
    .zoneskip Loch Modan
    .zoneskip Dun Morogh
    .zoneskip Ironforge
]])


RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Alliance
#name 20-21 黑海岸/灰谷
#displayname 20-21 黑海岸/灰谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南((联盟)
#subgroup RXP生存指南 1-20
#next 21-23 石爪山/灰谷

step << Druid
	#completewith next
	.cast 18960 >>传送术:月光林地
	.zoneskip Moonglade
step << Druid
    .goto Moonglade,52.53,40.57
	>>前往月光林地
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .trainer >>训练你的职业法术
    .target Loganaar
step
    #completewith TheryluneE
    .hs >>传送至奥伯丁
    .zoneskip Darkshore
    .zoneskip Ashenvale
step
    .goto Darkshore,37.21,44.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击|cRXP_FRIENDLY_通缉告示|r
    .accept 4740 >>接任务: |cRXP_LOOT_通缉：莫克迪普！|r
step
#map Darkshore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .target Barithras Moonshade
    .goto Felwood,19.90,18.40
    .accept 947 >>接任务: |cRXP_LOOT_洞中的蘑菇|r
step
    .goto Darkshore,37.44,41.83
    .target Archaeologist Hollee
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考古学家霍莉|r交谈
    .accept 729 >>接任务: |cRXP_LOOT_健忘的勘察员|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
	.target Thundris Windweaver
    .goto Felwood,19.98,14.40
    .accept 4763 >>接任务: |cRXP_LOOT_黑木熊怪的堕落|r
step
    .goto Darkshore,37.78,44.06
    .use 12346 >>|cRXP_WARN_使用|r|T133748:0|t[空的净化碗] |cRXP_WARN_在羽月岗哨中|r
    .collect 12347,1,4763,1
step
    .goto Darkshore,38.326,43.040
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈沙拉·夜语|r交谈
    .turnin 3765 >>交任务: |cRXP_FRIENDLY_遥远的旅途|r
    .target Gershala Nightwhisper
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
	.target Tharnariun Treetender
    .goto Felwood,21.63,18.15
    .accept 2139 >>接任务: |cRXP_LOOT_萨纳瑞恩的希望|r
step
    .goto Darkshore,50.66,34.94
    >>打开|cRXP_PICK_黑木谷物商店|r. 搜刮获得|cRXP_LOOT_黑木谷物样本|r
    >>|cRXP_WARN_掠夺此物品会刷新2只|cRXP_ENEMY_黑木熊怪|r, 它们会仇恨并冲向你. 请做好战斗准备或重置它们|r
    .collect 12342,1,4763,1 -- Blackwood Grain Stores (1)
step
    .goto Darkshore,52.60,36.65,45,0
    .goto Darkshore,51.48,38.26
    >>击杀|cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_蓟熊幼崽|r可以施放|r|T132152:0|t[毁灭]|cRXP_WARN_, 这是一种近战瞬发技能, 会使你眩晕2秒|r
    .complete 2139,1 --Den Mother (1)
    .mob Den Mother
    .mob Thistle Cub
step
    .goto Darkshore,51.83,33.50
    >>打开|cRXP_PICK_黑木坚果商店|r, 从中获取|cRXP_LOOT_黑木坚果样本|r
    >>|cRXP_WARN_掠夺此物品会刷新2只|cRXP_ENEMY_黑木熊怪|r, 它们会仇恨并冲向你. 请做好战斗准备或重置它们|r
    .collect 12343,1,4763,1 -- Blackwood Nut Sample (1)
step
    #label Fruit
    .goto Darkshore,52.86,33.41
    >>打开|cRXP_PICK_黑木水果商店|r. 从中获取|cRXP_LOOT_黑木水果样本|r
    >>|cRXP_WARN_掠夺此物品会刷新2只|cRXP_ENEMY_黑木熊怪|r, 它们会仇恨并冲向你. 请做好战斗准备或重置它们|r
    .collect 12341,1,4763,1 -- Blackwood Fruit Sample (1)
step
    #completewith next
    .goto Darkshore,52.38,33.39
    .cast 16072 >>|cRXP_WARN_使用|r|T134712:0|t[装满水的净化碗] |cRXP_WARN_在 |cRXP_PICK_篝火|r处召唤|r|cRXP_ENEMY_萨巴克希斯|r
    .timer 17,The Blackwood Corrupted RP
    .use 12347
step
    .goto Darkshore,52.38,33.39
    >>击杀|cRXP_ENEMY_萨巴克希斯|r. 打开他掉落在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r, 从中拾取|cRXP_LOOT_堕落护符|r
    .use 12347
    .complete 4763,1 -- Talisman of Corruption (1)
    .mob Xabraxxis
step
    .goto Darkshore,55.66,34.89
    >>拾取地面上的|cRXP_LOOT_粗柄蘑菇|r和|cRXP_LOOT_毒帽蘑菇|r
    >>|cRXP_WARN_待在上半部分. 如果|cRXP_LOOT_毒帽蘑菇|r不在顶部尽头, 请跳下去从下方获取一个|r
    >>|cRXP_WARN_不要背对中心！|cRXP_ENEMY_风暴鳞波浪骑手|r会将你击退！|r
    .complete 947,1 --Scaber Stalk (5)
    .complete 947,2 --Death Cap (1)
--TODO: Add logout skip video
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_桑迪斯·织风|r交谈
	.target Thundris Windweaver
    .goto Felwood,19.98,14.40
    .turnin 4763 >>交任务: |cRXP_FRIENDLY_黑木熊怪的堕落|r
step
#map Darkshore
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈
    .target Barithras Moonshade
    .goto Felwood,19.90,18.40
    .turnin 947 >>交任务: |cRXP_FRIENDLY_洞中的蘑菇|r
    .accept 948 >>接任务: |cRXP_LOOT_安努|r
step
#map Darkshore
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
	.target Tharnariun Treetender
    .goto Felwood,21.63,18.15
    .turnin 2139 >>交任务: |cRXP_FRIENDLY_萨纳瑞恩的希望|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特伦希斯|r交谈
	.target Terenthis
    .goto Darkshore,39.37,43.48
    .accept 986 >>接任务: |cRXP_LOOT_丢失的主人|r
step
    #completewith moonstalkers
    >>击杀月夜雄虎和月夜雌虎. 从它们身上掠夺兽皮和毒牙
    >>|cRXP_WARN_注意|cRXP_ENEMY_月夜雌虎|r. 她们总是带着一只|cRXP_ENEMY_月夜猛虎幼崽|r一同进攻|r
    >>|cRXP_ENEMY_月夜雄虎|r可以施放 |T132090:0|t[弱点打击], 如果你背对它们, 将触发一次造成 20-40 点伤害的背刺攻击
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob Moonstalker Sire
    .mob Moonstalker Matriarch
    .mob Moonstalker Runt
step
	#era/som
    #completewith Murkdeep
    #optional
    .goto Darkshore,40.23,81.28,0
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r. 击杀后可掠夺其|cRXP_LOOT_头皮|r
    >>注意他们的施法 |T132152:0|t[毁灭], 这是一个瞬发攻击, 造成20-40点伤害, 并且|cRXP_WARN_将你击倒2秒|r
    .complete 1003,1
    .isOnQuest 1003
    .mob Grizzled Thistle Bear
step
#map Darkshore
    #completewith OnuGrove
    .goto Felwood,27.00,55.59,80 >>前往古树之林
step
#map Darkshore
    #label OnuGrove
    .goto Felwood,27.00,55.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 952 >>交任务: |cRXP_FRIENDLY_古树之林|r << NightElf
    .turnin 948 >>交任务: |cRXP_FRIENDLY_安努|r
    .accept 944 >>接任务: |cRXP_LOOT_主宰之剑|r
    .target Onu
step
    #completewith next
    #label MasterG
    .goto Darkshore,38.54,86.05,60 >>前往主宰之剑
step
#label moonstalkers
    .goto Darkshore,38.54,86.05
    >>发现主宰之剑
    >>|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_can|r|T132343:0|t[缴械]|cRXP_WARN_ 你, 持续6秒|r << Rogue/Paladin/Warrior
    >>|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_施法|r|T135953:0|t[续命]|cRXP_WARN_和一个3秒|r|T135915:0|t[治疗]
    .complete 944,1
step
    #completewith next
    .cast 5809 >>|cRXP_WARN_使用|r|T134715:0|t[占卜之水] |cRXP_WARN_并将其放置在地面上|r
    .use 5251
step
    .goto Darkshore,38.54,86.05
    .use 5251 >>点击|cRXP_PICK_占卜之碗|r
    .turnin 944 >>交任务: |cRXP_FRIENDLY_主宰之剑|r
    .accept 949 >>接任务: |cRXP_LOOT_暮光之锤的营地|r
    >>|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_can|r|T132343:0|t[缴械]|cRXP_WARN_ 你, 持续6秒|r << Rogue/Paladin/Warrior
    >>|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_施法|r|T135953:0|t[续命]|cRXP_WARN_和一个3秒|r|T135915:0|t[治疗]
step
    .goto Ashenvale,22.24,2.52
    >>点击|cRXP_PICK_暮光宝典|r
    .turnin 949 >>交任务: |cRXP_FRIENDLY_暮光之锤的营地|r
    .accept 950 >>接任务: |cRXP_LOOT_向安努回复|r
    >>|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_can|r|T132343:0|t[缴械]|cRXP_WARN_ 你, 持续6秒|r << Rogue/Paladin/Warrior
    >>|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_施法|r|T135953:0|t[续命]|cRXP_WARN_和一个3秒|r|T135915:0|t[治疗]
step
    .goto Ashenvale,22.36,3.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_瑟瑞露尼|r. 这将开启护送任务
    >>|cRXP_WARN_如果她不在场, 请跳过此步骤|r
    >>|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_can|r|T132343:0|t[缴械]|cRXP_WARN_ 你, 持续6秒|r << Rogue/Paladin/Warrior
    >>|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_施法|r|T135953:0|t[续命]|cRXP_WARN_和一个3秒|r|T135915:0|t[治疗]
    .accept 945 >>接任务: |cRXP_LOOT_护送瑟瑞露尼|r
    .target Therylune
step
    .goto Darkshore,40.51,87.09
    >>|cRXP_WARN_护送瑟瑞露尼离开大师之刃|r
    >>|cRXP_ENEMY_暮光暴徒|r|cRXP_WARN_can|r|T132343:0|t[缴械]|cRXP_WARN_ 你, 持续6秒|r << Rogue/Paladin/Warrior
    >>|cRXP_ENEMY_暮光信徒|r|cRXP_WARN_施法|r|T135953:0|t[续命]|cRXP_WARN_和一个3秒|r|T135915:0|t[治疗]
    .complete 945,1 -- 护送瑟瑞露尼
    .isOnQuest 945
step
    .destroy 5251 >>摧毁: |cRXP_ENEMY_占卜之水|r
step
    .goto Darkshore,39.3,91.8,60,0
    .goto Darkshore,37.38,91.87,100,0
    .goto Darkshore,38.96,80.07,100,0
    .goto Darkshore,43.82,82.08,100,0
    .goto Darkshore,38.96,80.07,0
	.goto Darkshore,39.3,91.8
    >>击杀月夜雄虎和月夜雌虎. 从它们身上掠夺兽皮和毒牙
    >>|cRXP_WARN_注意|cRXP_ENEMY_月夜雌虎|r. 她们总是带着一只|cRXP_ENEMY_月夜猛虎幼崽|r一同进攻|r
    >>|cRXP_ENEMY_月夜雄虎|r可以施放 |T132090:0|t[弱点打击], 如果你背对它们, 将触发一次造成 20-40 点伤害的背刺攻击
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob Moonstalker Sire
    .mob Moonstalker Matriarch
    .mob Moonstalker Runt
step
#map Darkshore
    #sticky
    #label prospector
    .goto Felwood,18.08,64.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    .turnin 729 >>交任务: |cRXP_FRIENDLY_健忘的勘察员|r
    .target Prospector Remtravel
step
    .goto Darkshore,35.72,83.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘察员雷姆塔维尔|r交谈
    >>这将开始护送任务
    .accept 731,1 >>接任务: |cRXP_LOOT_健忘的勘察员|r
    >>|cRXP_WARN_这个任务非常困难. 如果你无法组队或单人完成, 请跳过此步骤|r
    .link https://youtu.be/3d-htESNztE >>|cRXP_WARN_点击此处查看视频攻略|r
    .target Prospector Remtravel
step
    #requires prospector
    >>|cRXP_WARN_护送勘察员雷姆塔维尔穿过挖掘区|r
    >>|cRXP_WARN_这个任务非常困难. 如果你无法组队或单人完成, 请跳过此步骤|r
    .link https://youtu.be/3d-htESNztE >>|cRXP_WARN_点击此处查看视频攻略|r
    .complete 731,1
    .isOnQuest 731
step
    .goto Ashenvale,13.97,4.10
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4733 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_这个任务可能非常困难. 请逐个攻击|cRXP_ENEMY_鱼人|r, 否则可能会同时引燃多个目标的仇恨|r
    .link https://youtu.be/lfQM3Q-Ag5A >>|cRXP_WARN_点击此处查看视频攻略|r
step
    .goto Ashenvale,13.93,2.01
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4732 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
#map Darkshore
    .goto Felwood,13.47,64.01
    >>点击|cRXP_PICK_搁浅的海龟|r
    .accept 4731 >>接任务: |cRXP_LOOT_搁浅的海龟|r
step
#map Darkshore
    .goto Felwood,14.62,60.72
    >>点击|cRXP_PICK_搁浅的海洋生物|r
    .accept 4730 >>接任务: |cRXP_LOOT_搁浅的海洋生物|r
step
    #label Murkdeep
    .goto Darkshore,36.64,76.53
    >>击杀营地中的灰雾战士和灰雾猎人
    >>|cRXP_WARN_前往营地中央的篝火处召唤|r|cRXP_ENEMY_莫克迪普|r
    >>击杀|cRXP_ENEMY_莫克迪普|r. 他会从水中冲出来
    .complete 4740,1
    .unitscan Murkdeep
    .mob Greymist Warrior
    .mob Greymist Hunter
    .mob Greymist Coastrunner
step
	#era/som
    .goto Darkshore,41.44,86.06,50,0
    .goto Darkshore,41.77,84.60,50,0
    .goto Darkshore,42.94,82.25,50,0
    .goto Darkshore,43.59,80.02,50,0
    .goto Darkshore,39.74,80.43,50,0
    .goto Darkshore,38.00,83.55
    #optional
    >>击杀|cRXP_ENEMY_灰斑蓟熊|r. 击杀后可掠夺其|cRXP_LOOT_头皮|r
    >>注意他们的施法 |T132152:0|t[毁灭], 这是一个瞬发攻击, 造成20-40点伤害, 并且|cRXP_WARN_将你击倒2秒|r
    .complete 1003,1 -- Grizzled Scalp (4)
    .isOnQuest 1003
    .mob Grizzled Thistle Bear
step
    #era/som
    .goto Darkshore,41.389,80.565
    >>点击地面上的 |cRXP_PICK_传声盒525号|r
    .turnin 1003 >>交任务: |cRXP_FRIENDLY_传声盒525号|r
    .isOnQuest 1003
step
.group
    #completewith next
    .goto Darkshore,45.00,85.30,30 >>前往洞穴中|cRXP_FRIENDLY_沃科尔|r方向
step
.group
    .goto Darkshore,45.00,85.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃科尔|r交谈
    .turnin 993 >>交任务: |cRXP_FRIENDLY_丢失的主人|r
    .accept 995 >>接任务: |cRXP_LOOT_偷偷溜走|r
    .timer 20,Escape Through Stealth RP
    .target Volcor
    .isQuestTurnedIn 986
step
.group
    .goto Darkshore,44.44,84.69
    >>|cRXP_WARN_等待RP结束|r
    .complete 995,1
    .isQuestTurnedIn 986
step
#map Darkshore
    .goto Felwood,27.00,55.59
    .target Onu
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 951 >>交任务: |cRXP_FRIENDLY_玛塞斯特拉遗物|r
    .isQuestComplete 951
step
#map Darkshore
    .goto Felwood,27.00,55.59
    .target Onu
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >>交任务: |cRXP_FRIENDLY_向安努回复|r
step
#map Darkshore
    .goto Felwood,27.96,55.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈以开启护送任务
    >>|cRXP_WARN_如果他不在那里, 请跳过此步骤. 他重生可能需要长达25分钟|r
	.target Kerlonian Evershade
    .accept 5321 >>接任务: |cRXP_LOOT_昏昏欲睡|r
step
    .isOnQuest 5321
    .goto Darkshore,44.38,76.30
    >>打开|cRXP_PICK_克罗尼亚的箱子|r. 拾取其中的 |T134229:0|t[|cRXP_LOOT_唤醒号角|r]
    .complete 5321,1 -- Horn of Awakening (1)
step
    #completewith tower
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
    .goto Ashenvale,29.7,13.6
step
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
	#era/som
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
    #era/som
    .goto Ashenvale,31.25,30.70
    >>击杀|cRXP_ENEMY_暗滩祭司|r和|cRXP_ENEMY_暗滩精兵|r和|cRXP_ENEMY_暗滩执行者|r和|cRXP_ENEMY_暗滩挖掘者|r, 掠夺他们以获得|cRXP_LOOT_发光的灵魂宝石|r
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
	#era/som
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target Delgren the Purifier
    .goto Ashenvale,26.19,38.69
    .turnin 970 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 973 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
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
	#era/som
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_净化者德尔格伦|r交谈
	.target Delgren the Purifier
    .goto Ashenvale,26.19,38.69
    .turnin 970 >>交任务: |cRXP_FRIENDLY_奥萨拉克斯之塔|r
    .accept 973 >>接任务: |cRXP_LOOT_奥萨拉克斯之塔|r
step
    #completewith next
    .goto Ashenvale,25.49,39.59,25,0
    .goto Ashenvale,25.98,41.72,25,0
    .goto Ashenvale,26.88,44.47,30,0
    .goto Ashenvale,28.16,47.68,60,0
    .goto Ashenvale,34.40,48.00
    .subzone 415 >>前往阿斯特兰纳
step
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
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵塞恩希尔|r交谈
	.target Sentinel Thenysil
    .goto Ashenvale,34.89,49.79
    .accept 1070 >>接任务: |cRXP_LOOT_守卫石爪山|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔德瑞斯·戈思谢尔|r交谈
	.target Faldreas Goeth'Shael
    .goto Ashenvale,35.76,49.10
    .accept 1056 >>接任务: |cRXP_LOOT_石爪峰之旅|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱恩·狼行者|r交谈
	.target Raene Wolfrunner
    .goto Ashenvale,36.61,49.58
    .accept 991 >>接任务: |cRXP_LOOT_莱恩的净化|r
step
    .goto Ashenvale,36.99,49.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板基姆利雅|r交谈
    .home >>将你的[炉石]设置为阿斯特兰纳
    .target Innkeeper Kimlya
step
    .goto Ashenvale,37.36,51.79
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮尔图拉斯·怀特姆恩|r交谈
	.target Pelturas Whitemoon
    .turnin 1020 >>交任务: |cRXP_FRIENDLY_奥雷迪尔的药剂|r
step
.dungeon WC
    #completewith TravelRatchet
    .goto Ashenvale,20.31,42.33,0
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r, 一边击杀|cRXP_ENEMY_盐沫泥浆鱼人|r，一边寻找哀嚎洞穴的队伍。他们的位置已标记在你的地图上
	.mob Saltspittle Warrior
	.mob Saltspittle Muckdweller
	.mob Saltspittle Oracle
	.mob Saltspittle Puddlejumper
step
.dungeon WC
    #label TravelRatchet
    .goto Ashenvale,69.71,86.87,50,0
    .goto The Barrens,48.98,5.42,35,0
    .goto The Barrens,49.07,12.80,50,0
    .goto The Barrens,53.87,21.52,120,0
    .goto The Barrens,59.15,25.48,120,0
    .goto The Barrens,63.087,37.607
    .subzone 392 >>前往贫瘠之地的棘齿城. 跟随箭头指示避开|cRXP_ENEMY_贫瘠之地卫兵|r
step
.dungeon WC
    .goto The Barrens,63.084,37.163
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fp Ratchet >>获取棘齿城飞行路线
    .target Bragok
step
.dungeon WC
    .goto The Barrens,63.087,37.607
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_起重机操作员比戈弗兹|r交谈
    .accept 959 >>接任务: |cRXP_LOOT_港口的麻烦|r
    .target Crane Operator Bigglefuzz
step
.dungeon WC
    #completewith next
    .goto The Barrens,46.95,35.44,0
    .goto The Barrens,46.95,35.44,20,0
    .goto The Barrens,47.01,34.67,15,0
    .goto 1414,51.92,55.27,45,0
    .goto 1414,51.82,55.56,20 >>前往哀嚎洞穴. 登上山顶后, 从上方的隐藏洞穴跳下, 进入哀嚎洞穴入口上方的隐蔽区域. 跟随箭头前往|cRXP_FRIENDLY_纳尔帕克|r 和|cRXP_FRIENDLY_厄布鲁|r
step
.dungeon WC
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    .accept 1486 >>接任务: |cRXP_LOOT_变异皮革|r
    .target +Nalpak
    .goto 1414,51.912,55.422 -- Nalpak
    .accept 1487 >>接任务: |cRXP_WARN_清除变异者|r
    .goto 1414,51.918,55.444 -- Ebru
    .target +Ebru
step
.dungeon WC
    #completewith EnterWC
    >>击杀所有类型的|cRXP_ENEMY_Deviate|r怪物, 击败后可获得其|cRXP_LOOT_变异皮革|r
    >>|cRXP_WARN_这可以在哀嚎洞穴内部和外部完成|r
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
    >>击杀|cRXP_ENEMY_疯狂的马格利什|r. 击败他后搜刮物品, 获得|cRXP_LOOT_99年波尔多陈酿|r
    >>|cRXP_ENEMY_疯狂的马格利什|r|cRXP_WARN_可能出现在多个地点|r
    >>|cRXP_WARN_此任务需在哀嚎洞穴外部完成|r
    .complete 959,1 -- 99-Year-Old Port (1)
    .isOnQuest 959
    .mob Mad Magglish
step
.dungeon WC
    #label EnterWC
    .goto 1414,52.37,55.20
    +进入哀嚎洞穴
    .zoneskip 1414,1 -- similar to stockades, no subzone for WC
step
.dungeon WC
    >>击杀所有类型的|cRXP_ENEMY_Deviate|r怪物, 击败后可获得其|cRXP_LOOT_变异皮革|r
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
    >>击杀所有类型的|cRXP_ENEMY_Deviate|r怪物
    .complete 1487,1 -- Deviate Ravager slain (7)
    .complete 1487,2 -- Deviate Viper slain (7)
    .complete 1487,3 -- Deviate Shambler slain (7)
    .complete 1487,4 -- Deviate Dreadfang slain (7)
    .isOnQuest 1487
step
.dungeon WC
    #completewith next
    >>击杀所有类型的|cRXP_ENEMY_Deviate|r怪物, 击败后可获得其|cRXP_LOOT_变异皮革|r
    .complete 1486,1 -- Deviate Hide (20)
    .isOnQuest 1486
step
.dungeon WC
    >>击杀|cRXP_ENEMY_考布莱恩|r和|cRXP_ENEMY_皮萨斯|r和|cRXP_ENEMY_瑟芬迪斯|r和|cRXP_ENEMY_安娜科德拉|r, 然后与副本入口处的|cRXP_FRIENDLY_纳拉雷克斯的信徒|r交谈, 以开启护送任务
    >>护送|cRXP_FRIENDLY_纳拉雷克斯的信徒|r穿过哀嚎洞穴并完成唤醒仪式
    >>Kill |cRXP_ENEMY_Mutanus the Devourer|r. Loot him for the |T135229:0|t[|cRXP_LOOT_交任务: |cRXP_FRIENDLY_发光的碎片|r|r]
    >>|cRXP_WARN_Use the |T135229:0|t[|cRXP_LOOT_交任务: |cRXP_FRIENDLY_发光的碎片|r|r] to start the quest|r
    .collect 10441,1,6981,1 -- 交任务: |cRXP_FRIENDLY_发光的碎片|r (1)
    .accept 6981 >>接任务: |cRXP_WARN_发光的碎片|r
    .use 10441 -- 交任务: |cRXP_FRIENDLY_发光的碎片|r
    .skipgossip
    .target Disciple of Naralex
    .mob Mutanus the Devourer
step
.dungeon WC
    >>击杀所有类型的|cRXP_ENEMY_Deviate|r怪物, 击败后可获得其|cRXP_LOOT_变异皮革|r
    >>|cRXP_WARN_这可以在哀嚎洞穴内部和外部完成|r
    .complete 1486,1 -- Deviate Hide (20)
    .isOnQuest 1486
step
.dungeon WC
    #completewith RatchetTurnin
    .goto The Barrens,62.984,37.218
    .subzone 392 >>前往拉切特. 你很快就会完成上述WC任务
    .isOnQuest 6981,959
step
.dungeon WC
    .goto The Barrens,62.984,37.218
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .complete 6981,1 -- Speak with someone in Ratchet about the 交任务: |cRXP_FRIENDLY_发光的碎片|r
    .skipgossip 1
    .target Sputtervalve
    .isOnQuest 6981
step
.dungeon WC
    #label RatchetTurnin
    .goto The Barrens,63.087,37.607
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_起重机操作员比戈弗兹|r交谈
    .turnin 959 >>交任务: |cRXP_FRIENDLY_港口的麻烦|r
    .target Crane Operator Bigglefuzz
    .isQuestComplete 959
step
.dungeon WC
    #completewith next
    .goto The Barrens,50.11,35.21,35,0
    .goto The Barrens,48.60,33.34,35,0
    .goto The Barrens,48.184,32.781,15 >>登上哀嚎洞穴上方的陡峭山峰. 跟随箭头指示
    .isQuestComplete 6981
step
.dungeon WC
    .goto The Barrens,48.184,32.781
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲拉·古风|r交谈
    .turnin 6981 >>交任务: |cRXP_FRIENDLY_发光的碎片|r
    .target Falla Sagewind
    .isQuestComplete 6981
step
.dungeon WC
    #completewith NalpakEbru
    .goto 1414,51.92,55.27,45,0
    .goto 1414,51.82,55.56,20 >>跳入哀嚎洞穴入口上方的隐藏洞穴, 跟随箭头前往|cRXP_FRIENDLY_纳尔帕克|r 和|cRXP_FRIENDLY_厄布鲁|r
step
.dungeon WC
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    .turnin 1486 >>交任务: |cRXP_FRIENDLY_变异皮革|r
    .goto 1414,51.912,55.422 -- Nalpak
    .target +Nalpak
    .turnin 1487 >>交任务: |cRXP_FRIENDLY_清除变异者|r
    .goto 1414,51.918,55.444 -- Ebru
    .target +Ebru
    .isQuestComplete 1486
    .isQuestComplete 1487
step
.dungeon WC
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    .turnin 1487 >>交任务: |cRXP_FRIENDLY_清除变异者|r
    .goto 1414,51.918,55.444 -- Ebru
    .target Ebru
    .isQuestComplete 1487
step
.dungeon WC
    #label NalpakEbru
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    .turnin 1486 >>交任务: |cRXP_FRIENDLY_变异皮革|r
    .goto 1414,51.912,55.422 -- Nalpak
    .target Nalpak
    .isQuestComplete 1486
step
.dungeon WC
    .hs >>炉石传送至阿斯特兰纳
]])
