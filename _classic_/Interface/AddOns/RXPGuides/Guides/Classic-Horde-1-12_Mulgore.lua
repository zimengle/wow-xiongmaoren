local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end


RXPGuides.RegisterGuide([[
#classic
#xprate <1.99
#era/som--h
<< Horde
#name 1-6 莫高雷
#displayname 1-6 莫高雷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 11
#group RestedXP 联盟 1-22
#defaultfor Tauren
#next 6-12 莫高雷；6-13 莫高雷


step << !Tauren
    #completewith next
    .goto Mulgore,44.92,77.12
    +|cRXP_WARN_您选择的指南专为牛头人设计. 由于该区域缺少仅限牛头人开启的主要任务线, 因此对您来说无法正常进行. 建议您选择与您初始起始区域相同的区域|r
step
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .accept 747 >>接任务: |cRXP_LOOT_开始狩猎|r
    .target Grull Hawkwind
step
    .goto Mulgore,44.18,76.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .accept 752 >>接任务: |cRXP_LOOT_一件琐事|r
    .target Chief Hawkwind
step << Warrior/Shaman
    #completewith next
    .goto Mulgore,46.05,75.32,30,0
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r. 掠夺它们, 直到获得价值10铜的商人可售物品(包括你的装备)|r << Warrior/Shaman
    .mob Plainstrider
    .money >0.01
step << Warrior/Shaman
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kawnie|r交谈
    .vendor >>出售垃圾
    .target Kawnie Softbreeze
    .money >0.01
step << Warrior
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 6673 >>训练 |T132333:0|t[战斗怒吼]
    .target Harutt Thunderhorn
step << Shaman
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .train 8017 >>训练 |T136086:0|t[图腾打击武器]
    .target Meela Dawnstrider
step
    #completewith next
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 掠夺其|cRXP_LOOT_肉|r和|cRXP_LOOT_羽毛|r
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
    .mob Plainstrider
step
    .goto Mulgore,50.03,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长的母亲|r交谈
    .turnin 752 >>交任务: |cRXP_FRIENDLY_一件琐事|r
    .accept 753 >>接任务: |cRXP_LOOT_一件琐事|r
    .target Greatmother Hawkwind
step
    .goto Mulgore,50.22,81.37
    >>在|hHawkwind|r身后井中的水罐上拾取物品
    .complete 753,1 --Water Pitcher (1)
step
    #loop
    .goto Mulgore,47.36,83.05,0
    .goto Mulgore,50.23,79.38,50,0
    .goto Mulgore,51.02,78.68,50,0
    .goto Mulgore,50.85,75.68,50,0
    .goto Mulgore,48.43,77.18,50,0
    .goto Mulgore,47.10,76.54,50,0
    .goto Mulgore,45.77,80.39,50,0
    .goto Mulgore,45.56,82.39,50,0
    .goto Mulgore,47.36,83.05,50,0
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 掠夺其|cRXP_LOOT_肉|r和|cRXP_LOOT_羽毛|r
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
    .mob Plainstrider
step
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 747,1 >>交任务: |cRXP_FRIENDLY_开始狩猎|r << Druid
    .turnin 747 >>交任务: |cRXP_FRIENDLY_开始狩猎|r << !Druid
    .accept 3091 >>接任务: |cRXP_LOOT_简易便笺|r << Warrior
    .accept 3092 >>接任务: |cRXP_LOOT_风化便笺|r << Hunter
    .accept 3093 >>接任务: |cRXP_LOOT_符文便笺|r << Shaman
    .accept 3094 >>接任务: |cRXP_LOOT_绿色便笺|r << Druid
    .accept 750 >>接任务: |cRXP_LOOT_继续狩猎|r
    .target Grull Hawkwind
step
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kawnie|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132384:0|t[轻弹丸]|r << Hunter
    .collect 2516,1000,750,1 << Hunter --Light Shot (1000)
    .vendor >>出售垃圾
    .target Kawnie Softbreeze
step
    .goto Mulgore,44.18,76.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .turnin 753 >>交任务: |cRXP_FRIENDLY_一件琐事|r
    .accept 755 >>接任务: |cRXP_LOOT_大地之母仪祭|r
    .target Chief Hawkwind
step << Shaman
    .goto Mulgore,44.07,77.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Marjak|r|cRXP_BUY_交谈. 从他那里购买|r|T135139:0|t[学徒法杖]|r
    .collect 2132,1,750,1 --Collect Short Staff (1)
    .money <0.0102
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
    .target Marjak Keenblade
step << Shaman
    #completewith RitesoftheEarthmother
    +装备 |T135139:0|t[学徒法杖]
    .use 2132
    .itemcount 2132,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
step
    #completewith next
    >>击杀|cRXP_ENEMY_山狮|r. 击杀后搜刮它们的|cRXP_LOOT_皮毛|r
    .complete 750,1 --Mountain Cougar Pelt (10)
    .mob Mountain Cougar
step
    #label RitesoftheEarthmother
    .goto Mulgore,42.58,92.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灰舌先知|r交谈
    >>|cRXP_WARN_路上刷怪提醒|r
    .turnin 755 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
    .accept 757 >>接任务: |cRXP_LOOT_力量仪祭|r
    .target Seer Graytongue
step
    #loop
    .goto Mulgore,44.60,90.86,0
    .goto Mulgore,43.21,89.26,50,0
    .goto Mulgore,44.64,91.58,50,0
    .goto Mulgore,45.82,90.52,50,0
    .goto Mulgore,46.35,91.45,50,0
    .goto Mulgore,48.05,91.83,50,0
    .goto Mulgore,49.25,90.69,50,0
    .goto Mulgore,50.98,90.37,50,0
    .goto Mulgore,49.10,89.50,50,0
    .goto Mulgore,47.06,88.64,50,0
    .goto Mulgore,45.06,89.89,50,0
    .goto Mulgore,44.60,90.86,50,0
    >>击杀|cRXP_ENEMY_山狮|r. 击杀后搜刮它们的|cRXP_LOOT_皮毛|r
    .complete 750,1 --Mountain Cougar Pelt (10)
    .mob Mountain Cougar
step
    #xprate <1.5
    #loop
	.goto Mulgore,45.56,87.95,40,0
	.goto Mulgore,46.92,87.84,40,0
	.goto Mulgore,48.67,86.83,40,0
	.goto Mulgore,50.65,85.87,40,0
	.goto Mulgore,51.01,83.71,40,0
	.goto Mulgore,52.06,81.53,40,0
	.goto Mulgore,51.87,79.58,40,0
	.goto Mulgore,51.67,77.39,40,0
	.goto Mulgore,51.95,75.16,40,0
	.goto Mulgore,50.32,76.33,40,0
	.goto Mulgore,48.85,75.82,40,0
	.goto Mulgore,47.41,75.30,40,0
	.goto Mulgore,46.80,78.21,40,0
	.goto Mulgore,45.84,80.41,40,0
	.goto Mulgore,45.03,82.15,40,0
	.goto Mulgore,44.09,83.89,40,0
	.goto Mulgore,43.90,86.08,40,0
    .xp 3+1150 >>升级至1150/1400经验值
    .mob Plainstrider
step
    #xprate >1.49
    #loop
	.goto Mulgore,45.56,87.95,40,0
	.goto Mulgore,46.92,87.84,40,0
	.goto Mulgore,48.67,86.83,40,0
	.goto Mulgore,50.65,85.87,40,0
	.goto Mulgore,51.01,83.71,40,0
	.goto Mulgore,52.06,81.53,40,0
	.goto Mulgore,51.87,79.58,40,0
	.goto Mulgore,51.67,77.39,40,0
	.goto Mulgore,51.95,75.16,40,0
	.goto Mulgore,50.32,76.33,40,0
	.goto Mulgore,48.85,75.82,40,0
	.goto Mulgore,47.41,75.30,40,0
	.goto Mulgore,46.80,78.21,40,0
	.goto Mulgore,45.84,80.41,40,0
	.goto Mulgore,45.03,82.15,40,0
	.goto Mulgore,44.09,83.89,40,0
	.goto Mulgore,43.90,86.08,40,0
    .xp 3+1025 >>升级至1025/1400经验值
    .mob Plainstrider
step << Warrior/Druid
    #completewith GrullTurnin2
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r. 掠夺它们, 直到你获得价值2银的商人物品|r
    .mob Plainstrider
	.money >0.02
step << !Warrior !Druid
    #completewith next
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r. 刷怪直到你获得价值1银的商人物品|r
    .mob Plainstrider
    .money >0.01
step
    #label GrullTurnin2
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 750 >>交任务: |cRXP_FRIENDLY_继续狩猎|r
    .accept 780 >>接任务: |cRXP_LOOT_斗猪|r
    .target Grull Hawkwind
step
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kawnie|r交谈
    .vendor >>出售垃圾
    .target Kawnie Softbreeze
step
    .goto Mulgore,44.67,76.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Brave|r交谈
    .accept 3376 >>接任务: |cRXP_LOOT_刺鬃酋长|r
    .target Brave Windfeather
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务: |cRXP_FRIENDLY_简易便笺|r
    .accept 77651 >>接受任务:踏入荆棘丛
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Harutt Thunderhorn
    .money <0.02
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务: |cRXP_FRIENDLY_简易便笺|r
    .accept 77651 >>接受任务:踏入荆棘丛
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Harutt Thunderhorn
step << Warrior
    #season 0
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务: |cRXP_FRIENDLY_简易便笺|r
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Harutt Thunderhorn
    .money <0.02
step << Warrior
    #season 0
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务: |cRXP_FRIENDLY_简易便笺|r
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Harutt Thunderhorn
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .turnin 3092 >>交任务: |cRXP_FRIENDLY_风化便笺|r
    .accept 77649 >>接任务: |cRXP_WARN_猎人的力量|r
    .train 1978 >>训练 |T132204:0|t[蛇毒之刺]
    .target Lanka Farshot
step << Hunter
    #season 0
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .turnin 3092 >>交任务: |cRXP_FRIENDLY_风化便笺|r
    .train 1978 >>训练 |T132204:0|t[蛇毒之刺]
    .target Lanka Farshot
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .turnin 3094 >>交任务: |cRXP_FRIENDLY_绿色便笺|r
    .accept 77648 >>接任务: |cRXP_WARN_牛头人的圣物|r
    .train 8921 >>训练 |T136096:0|t[月火术]
    .target Gart Mistrunner
step << Druid
    #season 0
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .turnin 3094 >>交任务: |cRXP_FRIENDLY_绿色便笺|r
    .train 8921 >>训练 |T136096:0|t[月火术]
    .target Gart Mistrunner
step << Shaman
    .goto Mulgore,44.73,76.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ravenfeather|r交谈
    .accept 1519 >>接任务: |cRXP_LOOT_大地的召唤|r
    .target Seer Ravenfeather
step << Shaman
    #season 2
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .turnin 3093 >>交任务: |cRXP_FRIENDLY_符文便笺|r
    .train 8042 >>训练 |T136026:0|t[地震术]
    .target Meela Dawnstrider
step << Shaman
    #season 0
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .turnin 3093 >>交任务: |cRXP_FRIENDLY_符文便笺|r
    .train 8042 >>训练 |T136026:0|t[地震术]
    .target Meela Dawnstrider
step
    #loop
    .goto Mulgore,55.99,85.46,0
    .goto Mulgore,52.70,79.32,50,0
    .goto Mulgore,54.19,79.83,50,0
    .goto Mulgore,55.73,80.28,50,0
    .goto Mulgore,56.48,81.67,50,0
    .goto Mulgore,55.63,83.86,50,0
    .goto Mulgore,56.03,85.53,50,0
    .goto Mulgore,55.80,87.71,50,0
    .goto Mulgore,56.72,89.27,50,0
    .goto Mulgore,57.92,89.27,50,0
    .goto Mulgore,57.69,86.77,50,0
    .goto Mulgore,57.31,85.39,50,0
    .goto Mulgore,55.99,85.46,50,0
    >>击杀 |cRXP_ENEMY_斗猪|r. 击败它们后拾取其 |cRXP_LOOT_獠牙|r 和 |cRXP_LOOT_猪鼻|r
    .complete 780,2 --Battleboar Flank (8)
    .complete 780,1 --Battleboar Snout (8)
    .mob Battleboar
step
    #completewith BristlebackBelts
    .goto Mulgore,59.67,83.33,30 >>穿越洞穴
step
    #completewith DirtyMap
    >>击杀|cRXP_ENEMY_刺背野猪人|r. 击败后搜刮其掉落的|cRXP_LOOT_腰带|r
    .complete 757,1 --Bristleback Belt (12)
    .mob Bristleback Quilboar
step << Shaman
    #completewith DirtyMap
    >>击杀|cRXP_ENEMY_刺背萨满祭司|r. 从他们身上搜刮|cRXP_LOOT_药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob Bristleback Shaman
step
    .goto Mulgore,60.54,81.04,35,0
    .goto Mulgore,62.35,81.27,35,0
    .goto Mulgore,62.49,78.78,35,0
    .goto Mulgore,64.71,77.67
    >>击杀大屋内的刺鬃酋长·荆棘皮. 搜刮他的头颅
    .complete 3376,1 --Chief Sharptusk Thornmantle's Head (1)
    .mob Chief Sharptusk Thornmantle
step
    #completewith next
    .goto Mulgore,63.24,82.70,40 >>进入洞穴
step
    #label DirtyMap
    .goto Mulgore,63.24,82.70
    >>拾取地面上的 |T134269:0|t[|cRXP_LOOT_沾满泥土的地图|r]. 使用它来开启任务
    .collect 4851,1,781 --Collect Dirt-Stained Map
    .accept 781 >>接任务: |cRXP_LOOT_纳拉其营地的危机|r
    .use 4851
step << Shaman
    #completewith next
    >>击杀|cRXP_ENEMY_刺背萨满祭司|r. 从他们身上搜刮|cRXP_LOOT_药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob Bristleback Shaman
step
    #label BristlebackBelts
    #loop
    .goto Mulgore,63.93,78.34,0
    .goto Mulgore,63.81,76.65,40,0
    .goto Mulgore,62.92,76.91,40,0
    .goto Mulgore,61.31,77.22,40,0
    .goto Mulgore,61.58,78.89,40,0
    .goto Mulgore,62.53,79.52,40,0
    .goto Mulgore,64.20,79.01,40,0
    .goto Mulgore,65.82,78.13,40,0
    .goto Mulgore,63.93,78.34,40,0
    >>击杀|cRXP_ENEMY_刺背野猪人|r. 击败后搜刮其掉落的|cRXP_LOOT_腰带|r
    .complete 757,1 --Bristleback Belt (12)
    .mob Bristleback Quilboar
step << Shaman
    #loop
    .goto Mulgore,63.86,80.14,0
    .goto Mulgore,63.74,81.18,40,0
    .goto Mulgore,63.86,79.97,40,0
    .goto Mulgore,65.00,78.60,40,0
    .goto Mulgore,66.05,77.83,40,0
    .goto Mulgore,65.93,77.10,40,0
    .goto Mulgore,63.57,76.25,40,0
    .goto Mulgore,63.86,80.14,40,0
    >>击杀|cRXP_ENEMY_刺背萨满祭司|r. 从他们身上搜刮|cRXP_LOOT_药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob Bristleback Shaman
step
    #xprate <1.5
    #loop
    .goto Mulgore,63.98,80.08,40,0
    .goto Mulgore,64.31,78.29,40,0
    .goto Mulgore,63.67,76.18,40,0
    .goto Mulgore,62.67,76.10,40,0
    .goto Mulgore,61.34,77.13,40,0
    .goto Mulgore,61.72,78.98,40,0
    .goto Mulgore,62.29,81.53,40,0
    .goto Mulgore,60.82,80.81,40,0
    .goto Mulgore,60.08,81.93,40,0
    .goto Mulgore,61.03,82.32,40,0
    .goto Mulgore,62.27,82.03,40,0
    .xp 5+880 >>刷到880/2800经验值 << !Shaman
    .xp 5 >>升级到5级 << Shaman
step
    #xprate >1.49
    #loop
    .goto Mulgore,63.98,80.08,40,0
    .goto Mulgore,64.31,78.29,40,0
    .goto Mulgore,63.67,76.18,40,0
    .goto Mulgore,62.67,76.10,40,0
    .goto Mulgore,61.34,77.13,40,0
    .goto Mulgore,61.72,78.98,40,0
    .goto Mulgore,62.29,81.53,40,0
    .goto Mulgore,60.82,80.81,40,0
    .goto Mulgore,60.08,81.93,40,0
    .goto Mulgore,61.03,82.32,40,0
    .goto Mulgore,62.27,82.03,40,0
    .xp 5 >>升级到5级 << !Shaman
    .xp 4+700 >>升级至700/2100经验值 << Shaman
step
    #completewith next
    .hs >>传送至纳拉其营地
    .use 6948
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Grull|r和|cRXP_FRIENDLY_Brave|r和|cRXP_FRIENDLY_Hawkwind|r交谈 << !Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Grull|r和|cRXP_FRIENDLY_Brave|r和|cRXP_FRIENDLY_Seer|r和 |cRXP_FRIENDLY_Hawkwind|r交谈 << Shaman
    .turnin 780 >>交任务: |cRXP_FRIENDLY_斗猪|r
    .target +Grull Hawkwind
    .goto Mulgore,44.92,77.12
    .turnin 3376 >>交任务: |cRXP_FRIENDLY_刺鬃酋长|r
    .target +Brave Windfeather
    .goto Mulgore,44.67,76.68
    .turnin 1519 >>交任务: |cRXP_FRIENDLY_大地的召唤|r << Shaman
    .accept 1520 >>接任务: |cRXP_LOOT_大地的召唤|r << Shaman
    .target +Seer Ravenfeather << Shaman
    .goto Mulgore,44.73,76.18 << Shaman
    .turnin 781 >>交任务: |cRXP_FRIENDLY_纳拉其营地的危机|r
    .turnin 757 >>交任务: |cRXP_FRIENDLY_力量仪祭|r
    .accept 763 >>接任务: |cRXP_LOOT_大地之母仪祭|r
    .target +Chief Hawkwind
    .goto Mulgore,44.18,76.07
step << Shaman
    #completewith CallofEarth
    #label Rock
    .goto Mulgore,53.74,80.15,30 >>前往岩石方向
step << Shaman
    #completewith next
    #requires Rock
    .cast 8202 >>使用 |T134743:0|t[大地灵契]
    .use 6635
step << Shaman
    .goto Mulgore,53.74,80.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Manifestation|r交谈
    .turnin 1520 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
    .accept 1521 >>接任务: |cRXP_LOOT_大地的召唤|r
    .target Minor Manifestation of Earth
step << Shaman
    .goto Mulgore,44.73,76.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ravenfeather|r交谈
    .turnin 1521 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
    .target Seer Ravenfeather
step << Shaman
    #season 2
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .turnin 77652 >>交任务: |cRXP_FRIENDLY_力量圣像|r
    .train 332 >>训练 |T136052:0|t[治疗波]
    .target Shikrik
    .target Meela Dawnstrider
step << Shaman
    #season 0
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .train 332 >>训练 |T136052:0|t[治疗波]
    .target Shikrik
    .target Meela Dawnstrider
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .train 1130 >>训练 |T132212:0|t[猎人印记]
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .turnin 77649 >>交任务: |cRXP_FRIENDLY_猎人的力量|r
    .target Lanka Farshot
    .money <0.02
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .turnin 77649 >>交任务: |cRXP_FRIENDLY_猎人的力量|r
    .target Lanka Farshot
step << Hunter
    #season 0
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .train 1130 >>训练 |T132212:0|t[猎人印记]
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target Lanka Farshot
    .money <0.02
step << Hunter
    #season 0
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target Lanka Farshot
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .train 467 >>训练 |T136104:0|t[荆棘]
    .train 5177 >>训练 |T136006:0|t[愤怒]
    .turnin 77648 >>交任务: |cRXP_FRIENDLY_牛头人的圣物|r
    .target Gart Mistrunner
    .money <0.02
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .train 5177 >>训练 |T136006:0|t[愤怒]
    .turnin 77648 >>交任务: |cRXP_FRIENDLY_牛头人的圣物|r
    .target Gart Mistrunner
step << Druid
    #season 0
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .train 467 >>训练 |T136104:0|t[荆棘]
    .train 5177 >>训练 |T136006:0|t[愤怒]
    .target Gart Mistrunner
    .money <0.02
step << Druid
    #season 0
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .train 5177 >>训练 |T136006:0|t[愤怒]
    .target Gart Mistrunner
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>训练 |T132269:0|t[招架]
    .train 6343 >>训练 |T136105:0|t[雷霆一击]
    .turnin 77651 >>交给荆棘丛
    .target Harutt Thunderhorn
    .money <0.02
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>训练 |T132269:0|t[招架]
    .turnin 77651 >>交给荆棘丛
    .target Harutt Thunderhorn
step << Warrior
    #season 0
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>训练 |T132269:0|t[招架]
    .train 6343 >>训练 |T136105:0|t[雷霆一击]
    .target Harutt Thunderhorn
    .money <0.02
step << Warrior
    #season 0
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>训练 |T132269:0|t[招架]
    .target Harutt Thunderhorn
step
    .goto Mulgore,38.51,81.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安图尔·荒野|r交谈
    .accept 1656 >>接任务: |cRXP_LOOT_未完的任务|r
    .target Antur Fallow
]])


RXPGuides.RegisterGuide([[
#classic
#xprate <1.99
<< Horde
#name 6-12 莫高雷
#displayname 6-12 莫高雷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 11
#group RestedXP 联盟 1-22
#defaultfor Tauren
#next 12-17 贫瘠之地


step << Druid
    #season 2
    .goto Mulgore,35.72,69.57
    >>|cRXP_WARN_对三块|r|cRXP_ENEMY_Lunar Stones|r|cRXP_WARN_施放|r|T136096:0|t[月火术]|cRXP_WARN_. 一颗宝箱将会出现在它们之间|r
    >>打开|cRXP_PICK_Lunar Chest|r获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Sun|r]
    .collect 206989,1 --Rune of the Sun (1)
    .mob Lunar Stone
    .train 416044,1
step << Druid
    #season 2
    .train 416044 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_太阳符文|r]|cRXP_WARN_来训练|r|T236216:0|t[太阳之火]
    .use 206989
    .itemcount 206989,1
step
	#completewith BloodhoofHome
	#softcore
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
	#hardcore
	#completewith BloodhoofHome
    .goto Mulgore,47.35,60.70,120 >>跑向血蹄村
step
    #softcore
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .accept 766 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target Maur Raincaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ruul|r和|cRXP_FRIENDLY_Baine|r交谈
    .accept 743 >>接任务: |cRXP_LOOT_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.36,62.01
    .turnin 763 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
    .accept 745 >>接任务: |cRXP_LOOT_土地之争|r
    .accept 767 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .accept 746 >>接任务: |cRXP_LOOT_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
step
    #label BloodhoofHome
    .goto Mulgore,46.63,61.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    .turnin 1656 >>交任务: |cRXP_FRIENDLY_未完的任务|r
    .home >>将你的[炉石]设置为血蹄村
    .target Innkeeper Kauth
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买 |T135145:0|t[手杖] (5银4铜) 的钱. 如果暂时不够, 稍后再来处理
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T135145:0|t[手杖] |r
    .collect 2495,1,761,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T133053:0|t[木槌棒] (7s 1c) 的钱. 如果暂时不够, 以后再来
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,761,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯纳·鹰眼|r交谈
    .vendor >>出售垃圾, 如果钱够买一把 |T135611:0|t[精制短枪](4银14铜), 就直接购买. 如果钱不够, 稍后再来处理
    .target Kennah Hawkseye
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah|r|cRXP_BUY_交谈. 从他那里购买|r|T135611:0|t[精制短枪]|r
    .collect 2509,1,761,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah交谈|r
    >>|cRXP_BUY_从他那里购买|r|T132384:0|t[轻弹丸]|r << Hunter
    .collect 2516,1000,750,1 << Hunter --Light Shot (1000)
    .target Kennah Hawkseye
step << Shaman/Druid
    #completewith Well
    +装备 |T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #completewith Well
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #completewith Well
    +装备 |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r和|cRXP_FRIENDLY_Zarlman|r和|cRXP_FRIENDLY_Harken|r和|cRXP_FRIENDLY_Mull|r交谈
    .accept 766 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target +Maur Raincaller
    .goto Mulgore,46.97,57.07
    .turnin 767 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .accept 771 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .target +Zarlman Two-Moons
    .goto Mulgore,47.76,57.53
    .accept 761 >>接任务: |cRXP_LOOT_猎捕猛鹫|r
    .target +Harken Windtotem
    .goto Mulgore,48.71,59.32
    .accept 748 >>接任务: |cRXP_LOOT_毒水|r
    .target +Mull Thunderhorn
    .goto Mulgore,48.53,60.40
step << !Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r和|cRXP_FRIENDLY_Zarlman|r和|cRXP_FRIENDLY_Harken|r交谈
    .accept 766 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target +Maur Raincaller
    .goto Mulgore,46.97,57.07
    .turnin 767 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .accept 771 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .target +Zarlman Two-Moons
    .goto Mulgore,47.76,57.53
    .accept 761 >>接任务: |cRXP_LOOT_猎捕猛鹫|r
    .target +Harken Windtotem
    .goto Mulgore,48.71,59.32
step
    #sticky
    #completewith Well
    >>|cRXP_WARN_在该区域完成任务时, 收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Tauren
    #completewith Ambercorns
    >>击杀|cRXP_ENEMY_Prairie Wolves|r和|cRXP_ENEMY_成年平原陆行鸟|r. 击败它们后搜刮其|cRXP_LOOT_Paws|r和|cRXP_LOOT_Talons|r
    .complete 748,1 --Prairie Wolf Paw (6)
    .complete 748,2 --Plainstrider Talon (4)
    .mob Prairie Wolf
    .mob Adult Plainstrider
step << Hunter
    #season 2
    .goto Mulgore,59.02,54.36
    >>对|cRXP_ENEMY_Rustling Bush|r施放 |T132212:0|t[猎人印记]
    >>击杀生成的|r|cRXP_ENEMY_ 企业公司偷猎者|r, 从他身上搜刮|T134419:0|t[|cRXP_FRIENDLY_ 精准符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Venture Co. Poacher
    .train 410113,1
step << Hunter
    #season 2
    .train 410113 >>使用 |T134419:0|t[|cRXP_FRIENDLY_射击天赋符文|r]
    .use 206155
    .itemcount 206155,1
step
    #label Ambercorns
    #loop
    .goto Mulgore,50.36,66.49,0
    .goto Mulgore,48.71,64.44,15,0
    .goto Mulgore,50.36,66.49,15,0
    .goto Mulgore,51.92,63.85,15,0
    .goto Mulgore,51.13,71.06,15,0
    .goto Mulgore,50.36,66.49,15,0
    >>收集|cRXP_PICK_琥珀颗粒|r. 它们可以躲在树下的地面上
    .complete 771,2 --Ambercorn (2)
step
	#completewith next
	>>在莫高雷击杀各处的猛鹫. 掠夺它们掉落的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
step << Tauren
    #loop
	.goto Mulgore,50.82,66.66,0
	.goto Mulgore,50.82,66.66,50,0
	.goto Mulgore,51.06,63.63,50,0
	.goto Mulgore,52.79,62.06,50,0
	.goto Mulgore,53.98,61.68,50,0
	.goto Mulgore,55.67,62.77,50,0
	.goto Mulgore,56.46,64.93,50,0
	.goto Mulgore,56.02,67.78,50,0
	.goto Mulgore,55.02,69.65,50,0
	.goto Mulgore,52.33,70.07,50,0
	.goto Mulgore,50.40,70.24,50,0
	.goto Mulgore,48.60,69.43,50,0
	.goto Mulgore,45.98,69.70,50,0
	.goto Mulgore,48.58,67.37,50,0
    >>击杀|cRXP_ENEMY_Prairie Wolves|r和|cRXP_ENEMY_成年平原陆行鸟|r. 击败它们后搜刮其|cRXP_LOOT_Paws|r和|cRXP_LOOT_Talons|r
    .complete 748,1 --Prairie Wolf Paw (6)
    .mob +Prairie Wolf
    .complete 748,2 --Plainstrider Talon (4)
    .mob +Adult Plainstrider
step << Tauren
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 748 >>交任务: |cRXP_FRIENDLY_毒水|r
    .accept 754 >>接任务: |cRXP_LOOT_净化冰蹄之井|r
    .target Mull Thunderhorn
step << Tauren
    #completewith next
    >>收集井周围的|cRXP_PICK_水井石|r
    .complete 771,1 --Well Stone (2)
step << Tauren
    #label Well
    .goto Mulgore,53.68,66.28
    >>|cRXP_WARN_使用|r|T135139:0|t[冰蹄之井净化图腾] |cRXP_WARN_在井边|r
    .complete 754,1 --Cleanse the Winterhoof Water Well (1)
step
    #label Stones
    #loop
    .goto Mulgore,54.06,66.40,0
    .goto Mulgore,53.35,65.78,10,0
    .goto Mulgore,53.70,65.59,10,0
    .goto Mulgore,53.98,65.94,10,0
    .goto Mulgore,54.06,66.40,10,0
    >>收集井周围的|cRXP_PICK_水井石|r
    .complete 771,1 --Well Stone (2)
step
    #completewith Gnolls
    >>|cRXP_WARN_在该区域完成任务时, 收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Warrior
    #season 2
    #loop
    .goto Mulgore,53.5,73.0,0
    .goto Mulgore,48.3,72.0,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    >>在两个营地之间来回穿梭, 击杀白鬃制革工和白鬃剥皮工和白鬃偷猎者. 从他们身上搜刮断首兽人头颅
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_断矛|r|cRXP_WARN_(等级9稀有). 他太难对付了|r
    .complete 745,1 --Palemane Tanner (10)
    .mob +Palemane Tanner
    .complete 745,2 --Palemane Skinner (8)
    .mob +Palemane Skinner
    .complete 745,3 --Palemane Poacher (5)
    .mob +Palemane Poacher
    .collect 204478,1 --Severed Gnoll Head (1)
    .unitscan Snagglespear
    .train 403475,1
step
    #label Gnolls
    #loop
    .goto Mulgore,53.5,73.0,0
    .goto Mulgore,48.3,72.0,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    >>在两个营地之间来回穿梭, 击杀|r白鬃制革工|r和|r白鬃剥皮工|r和|r白鬃偷猎者|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_断矛|r|cRXP_WARN_(等级9稀有). 他太难对付了|r
    .complete 745,1 --Palemane Tanner (10)
    .mob +Palemane Tanner
    .complete 745,2 --Palemane Skinner (8)
    .mob +Palemane Skinner
    .complete 745,3 --Palemane Poacher (5)
    .mob +Palemane Poacher
    .unitscan Snagglespear
step
    .goto Mulgore,47.63,61.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jhwana|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Shaman/Druid
    >>|cRXP_BUY_从她那里购买|r|T133968:0|t[刚出炉的面包]|r << Warrior
    .vendor >>出售垃圾
    .collect 1179,10,746,1 << Shaman/Druid --Ice Cold Milk (10)
    .collect 4541,10,746,1 << Warrior --Freshly Baked Bread (10)
    .target Jhawna Oatwind
    .money <0.025
step << Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r和|cRXP_FRIENDLY_Baine|r交谈
    .turnin 754 >>交任务: |cRXP_FRIENDLY_净化冰蹄之井|r
    .accept 756 >>接任务: |cRXP_LOOT_雷角图腾|r
    .target +Mull Thunderhorn
    .goto Mulgore,48.53,60.40
    .turnin 745 >>交任务: |cRXP_FRIENDLY_土地之争|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
step << !Tauren
    .goto Mulgore,47.51,60.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r和|cRXP_FRIENDLY_Baine|r交谈
    .turnin 745 >>交任务: |cRXP_FRIENDLY_土地之争|r
    .target Baine Bloodhoof
step << Warrior
    .goto Mulgore,46.80,60.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔拉·幼蹄|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .money <0.01
    .target Vira Younghoof
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买 |T135145:0|t[手杖] (5银4铜) 的钱. 如果暂时不够, 稍后再来处理
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T135145:0|t[手杖] |r
    .collect 2495,1,749,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T133053:0|t[木槌棒] (7s 1c) 的钱. 如果暂时不够, 以后再来
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,749,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯纳·鹰眼|r交谈
    .vendor >>出售垃圾, 如果钱够买一把 |T135611:0|t[精制短枪](4银14铜), 就直接购买. 如果钱不够, 稍后再来处理
    .target Kennah Hawkseye
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah|r|cRXP_BUY_交谈. 从他那里购买|r|T135611:0|t[精制短枪]|r
    .collect 2509,1,749,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Shaman/Druid
    #completewith Clawsx
    +装备 |T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #completewith Clawsx
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #completewith Clawsx
    +装备 |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step
    #label Vision
    .goto Mulgore,47.76,57.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zarlman|r交谈
    >>|cRXP_WARN_不要跟随出现的狼|r
    .turnin 771 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .accept 772 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .target Zarlman Two-Moons
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 5116 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <8,1
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 5186 >>训练你的职业法术
    .target Gennia Runetotem
    .xp <8,1
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 284 >>训练你的职业法术
    .target Krang Stonehoof
    .xp <8,1
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .train 8044 >>训练你的职业法术
    .target Narm Skychaser
    .xp <8,1
step
    #loop
    .goto Mulgore,55.14,60.65,0
    .goto Mulgore,51.50,59.23,50,0
    .goto Mulgore,53.00,60.24,50,0
    .goto Mulgore,55.14,60.65,50,0
    .goto Mulgore,57.47,61.26,50,0
    .goto Mulgore,59.65,62.40,50,0
    .goto Mulgore,55.14,60.65,50,0
    .line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    >>|cRXP_WARN_他沿着东侧道路巡逻|r
    .accept 749 >>接任务: |cRXP_LOOT_不幸的商队|r
	.unitscan Morin Cloudstalker
step
    #completewith Clawsx
    >>|cRXP_WARN_在该区域完成任务时, 收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Tauren
    #completewith RavagedCaravan1
    >>击杀 |cRXP_ENEMY_Stalkers|r 和 |cRXP_ENEMY_Cougars|r, 搜刮他们的 |cRXP_LOOT_Claws|r
    .complete 756,1 --Stalker Claws (6)
    .mob +Prairie Stalker
    .complete 756,2 --Cougar Claws (6)
    .mob +Flatland Cougar
step
	#completewith Clawsx
	>>在莫高雷击杀各处的猛鹫. 掠夺它们掉落的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
step
    #label RavagedCaravan1
    .goto Mulgore,53.74,48.17
    >>点击|cRXP_PICK_密封的补给箱|r
    .turnin 749 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 751 >>接任务: |cRXP_LOOT_不幸的商队|r
step << Tauren
    #loop
    .goto Mulgore,58.1,48.6,0
    .goto Mulgore,58.1,48.6,60,0
    .goto Mulgore,54.5,40.1,60,0
    .goto Mulgore,46.4,50.7,60,0
    >>击杀 |cRXP_ENEMY_Stalkers|r 和 |cRXP_ENEMY_Cougars|r, 搜刮他们的 |cRXP_LOOT_Claws|r
    .complete 756,1 --Stalker Claws (6)
    .mob +Prairie Stalker
    .complete 756,2 --Cougar Claws (6)
    .mob +Flatland Cougar
step
    #optional
    #label Clawsx
step
    #softcore
	#completewith Thunderhorn
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #hardcore
    #completewith Thunderhorn
    .goto Mulgore,46.5,55.5,150 >>返回血蹄村
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 5116 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <8,1
step
    #label Mazzturnin
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .turnin 766 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
    .target Maur Raincaller
    .isQuestComplete 766
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买 |T135145:0|t[手杖] (5银4铜) 的钱. 如果暂时不够, 稍后再来处理
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T135145:0|t[手杖] |r
    .collect 2495,1,743,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T133053:0|t[木槌棒] (7s 1c) 的钱. 如果暂时不够, 以后再来
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,743,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯纳·鹰眼|r交谈
    .vendor >>出售垃圾, 如果钱够买一把 |T135611:0|t[精制短枪](4银14铜), 就直接购买. 如果钱不够, 稍后再来处理
    .target Kennah Hawkseye
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah|r|cRXP_BUY_交谈. 从他那里购买|r|T135611:0|t[精制短枪]|r
    .collect 2509,1,743,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.86,57.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Loorat交谈|r
    .collect 2516,1000,743,1 << Hunter --Light Shot (1000)
    .target Moorat Longstride
    .itemcount 2512,<800 << Hunter
step << Shaman/Druid
    #completewith ThunderhornCleanse
    +装备 |T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #completewith ThunderhornCleanse
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #completewith ThunderhornCleanse
    +装备 |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step
    #completewith Thunderhorn
    .goto Mulgore,45.90,58.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈兰特|r交谈
    .vendor >>出售垃圾并修理
    .target Harant Ironbrace
step
    .goto Mulgore,48.71,59.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target Harken Windtotem
    .isQuestComplete 761
step << Tauren
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 756 >>交任务: |cRXP_FRIENDLY_雷角图腾|r
    .accept 758 >>接任务: |cRXP_LOOT_净化雷角之井|r
    .target Mull Thunderhorn
step
    #optional
    #label Thunderhorn
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .train 8044 >>训练你的职业法术
    .target Narm Skychaser
    .xp <8,1
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 5186 >>训练你的职业法术
    .target Gennia Runetotem
    .xp <8,1
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 284 >>训练你的职业法术
    .target Krang Stonehoof
    .xp <8,1
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 5116 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <8,1
step
    .goto Mulgore,46.63,61.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|r << Shaman/Druid
    >>|cRXP_BUY_从他那里购买|r|T133968:0|t[刚出炉的面包]|r << Warrior
    .vendor >>出售垃圾 << !Hunter
    .collect 1179,10,746,1 << Shaman/Druid --Ice Cold Milk (10)
    .collect 4541,10,746,1 << Warrior --Freshly Baked Bread (10)
    .target Innkeeper Kauth
    .money <0.025
step
    #completewith Burial
    >>|cRXP_WARN_完成收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
	#completewith Burial
	>>在莫高雷击杀各处的猛鹫. 掠夺它们掉落的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
step << Tauren
    #era/som
    #label ThunderhornCleanse
    .goto Mulgore,44.49,45.36
    >>|cRXP_WARN_使用|r|T135139:0|t[雷角之井净化图腾] |cRXP_WARN_在井处|r
    .complete 758,1 --Cleanse the Thunderhorn Water Well (1)
step << Shaman
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_Bael'dun Diggers|r和|cRXP_ENEMY_Bael'dun Appraisers|r, 从他们身上搜刮出|cRXP_LOOT_Artifact Storage Key|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
    .train 425344,1
    .xp <3,1
step
    .goto Mulgore,31.27,49.87
    >>击杀|cRXP_ENEMY_Bael'dun Diggers|r和|cRXP_ENEMY_Bael'dun Appraisers|r, 搜刮他们掉落的|cRXP_LOOT_Prospector's Picks|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_Bael'dun Appraisers|r会施放|r |T135929:0|t[治疗术] |cRXP_WARN_(远程施法:为自己或附近生命值低于50%的敌人恢复约75点生命值)|r
    .use 4702 >>击碎熔炉中的 |T134707:0|t[镐]
    .complete 746,1 --Broken Tools (5)
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
step << Shaman
    #season 2
    #loop
    .goto Mulgore,34.33,47.54,0
    .goto Mulgore,34.33,47.54,40,0
    .goto Mulgore,33.62,49.61,40,0
    .goto Mulgore,32.58,48.96,40,0
    .goto Mulgore,31.88,50.17,40,0
    .goto Mulgore,31.14,50.08,40,0
    .goto Mulgore,30.98,48.24,40,0
    .goto Mulgore,31.59,48.19,40,0
    .goto Mulgore,33.10,47.69,40,0
    >>击杀|cRXP_ENEMY_Bael'dun Diggers|r和|cRXP_ENEMY_Bael'dun Appraisers|r, 从他们身上搜刮出|cRXP_LOOT_Artifact Storage Key|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_Bael'dun Appraisers|r会施放|r |T135929:0|t[治疗术] |cRXP_WARN_(远程施法:为自己或附近生命值低于50%的敌人恢复约75点生命值)|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
    .train 425344,1
    .xp <3,1
step << Shaman
    #season 2
    .goto Mulgore,31.56,49.54
    >>打开|cRXP_PICK_Artifact Storage|r宝箱, 获取 |T134918:0|t|cRXP_LOOT_[硫磺图标]|r
    .collect 206388,1 --Sulfurous Icon (1)
    .train 425344,1
    .xp <3,1
step << Shaman
    #season 2
    .equip 18,206388 >>|cRXP_WARN_装备|r|T134918:0|t|cRXP_LOOT_[硫磺徽记]|r
    .use 206388
    .itemcount 206388,1 --Sulfurous Icon (1)
    .train 425344,1
    .xp <3,1
step << Shaman
    #season 2
    #label MoltenBlast
    #completewith Burial
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
    .train 425344,1
    .xp <3,1
    .xp >13,1
step << Warrior
    #season 2
    #loop
	.goto Mulgore,31.74,40.31,0
	.goto Mulgore,34.08,43.71,50,0
	.goto Mulgore,32.98,42.96,50,0
	.goto Mulgore,31.72,43.08,50,0
	.goto Mulgore,31.08,42.09,50,0
	.goto Mulgore,31.12,40.87,50,0
	.goto Mulgore,31.74,40.31,50,0
	.goto Mulgore,32.44,41.17,50,0
	.goto Mulgore,33.57,41.30,50,0
	.goto Mulgore,33.82,40.26,50,0
	.goto Mulgore,34.48,41.21,50,0
	.goto Mulgore,34.50,42.29,50,0
    >>击杀|cRXP_ENEMY_Windfury 风怒女巫|r和|cRXP_ENEMY_Windfury 哈比鸟|r. 击杀后搜刮它们的|cRXP_LOOT_利爪|r和一个|cRXP_LOOT_被斩首的哈比鸟头颅|r
    .complete 743,1 --Windfury Talon (8)
    .collect 206995,1 ---Severed Harpy Head (1)
    .mob Windfury Wind Witch
    .mob Windfury Harpy
    .train 403475,1
step
    #loop
	.goto Mulgore,31.74,40.31,0
	.goto Mulgore,34.08,43.71,50,0
	.goto Mulgore,32.98,42.96,50,0
	.goto Mulgore,31.72,43.08,50,0
	.goto Mulgore,31.08,42.09,50,0
	.goto Mulgore,31.12,40.87,50,0
	.goto Mulgore,31.74,40.31,50,0
	.goto Mulgore,32.44,41.17,50,0
	.goto Mulgore,33.57,41.30,50,0
	.goto Mulgore,33.82,40.26,50,0
	.goto Mulgore,34.48,41.21,50,0
	.goto Mulgore,34.50,42.29,50,0
    >>击杀|cRXP_ENEMY_Windfury 风怒女巫|r和|cRXP_ENEMY_Windfury 哈比妖|r. 击败它们后搜刮其|cRXP_LOOT_利爪|r
    .complete 743,1 --Windfury Talon (8)
    .mob Windfury Wind Witch
    .mob Windfury Harpy
step
    #completewith next
    .goto Mulgore,33.37,36.52,50 >>进入风怒鹰身女妖北方的洞穴
step
	#label Burial
    .goto Mulgore,32.72,36.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wiserunner|r交谈
    .turnin 772 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .accept 773 >>接任务: |cRXP_LOOT_智慧仪祭|r
    .target Seer Wiserunner
step << Shaman
    #season 2
    #requires MoltenBlast
    .cast 402265 >>|cRXP_WARN_使用|r|T134918:0|t|cRXP_LOOT_[硫磺图腾]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套:熔岩冲击]
    .use 206388
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <3,1
step
    #completewith SacredBurial
    .destroy 4823 >>摧毁: |cRXP_ENEMY_先知之水|r, 它在你的背包中. 不再需要它了
step
    #completewith SacredBurial
    >>|cRXP_WARN_完成收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    #completewith SacredBurial
    >>留意|cRXP_ENEMY_鬼嚎|r. 击败他后搜刮其掉落的 |T134358:0|t[|cRXP_LOOT_恶魔之伤|r]. 使用该物品开启任务
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_鬼嚎|r因为等级为12而难度较高|r
    .collect 4854,1,770 --Collect Demon Scarred Cloak
    .accept 770 >>接任务: |cRXP_LOOT_恶魔之伤|r
    .use 4854
    .unitscan Ghost Howl
step
	#completewith next
	>>在莫高雷击杀各处的猛鹫. 掠夺它们掉落的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
    .mob Taloned Swoop
step
    #label SacredBurial
    .goto Mulgore,59.85,25.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Raintotem|r交谈
    .accept 833 >>接任务: |cRXP_LOOT_神圣的墓地|r
    .target Lorekeeper Raintotem
step << Warrior
    #season 2
    #completewith RiteofWisdom
    >>击杀 |cRXP_ENEMY_刺背干涉者|r. 击败他们后可获得 |cRXP_LOOT_断头兽人头颅|r
    .collect 206994,1 ---Severed Quilboar Head (1)
    .mob Bristleback Interloper
    .train 403475,1
step
    #completewith next
    >>击杀|cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper (8)
    .mob Bristleback Interloper
step
    #label RiteofWisdom
    .goto Mulgore,61.45,21.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先祖之魂|r交谈
    .turnin 773 >>交任务: |cRXP_FRIENDLY_智慧仪祭|r
    .accept 775 >>接任务: |cRXP_LOOT_雷霆崖之旅|r
    .target Ancestral Spirit
step << Warrior
    #season 2
    #loop
	.goto Mulgore,59.85,25.62,0
	.goto Mulgore,59.85,25.62,25,0
	.goto Mulgore,61.14,22.93,25,0
	.goto Mulgore,61.77,22.49,25,0
	.goto Mulgore,62.18,22.05,25,0
	.goto Mulgore,62.32,20.89,25,0
	.goto Mulgore,61.62,19.50,25,0
	.goto Mulgore,60.44,19.50,25,0
	.goto Mulgore,60.16,21.06,25,0
	.goto Mulgore,60.41,21.96,25,0
	.goto Mulgore,61.12,22.88,25,0
    >>击杀 |cRXP_ENEMY_刺背干涉者|r. 击败他们后可获得 |cRXP_LOOT_断头兽人头颅|r
    .complete 833,1 --Bristleback Interloper (8)
    .collect 206994,1 ---Severed Quilboar Head (1)
    .mob Bristleback Interloper
    .train 403475,1
step
    #loop
	.goto Mulgore,59.85,25.62,0
	.goto Mulgore,59.85,25.62,25,0
	.goto Mulgore,61.14,22.93,25,0
	.goto Mulgore,61.77,22.49,25,0
	.goto Mulgore,62.18,22.05,25,0
	.goto Mulgore,62.32,20.89,25,0
	.goto Mulgore,61.62,19.50,25,0
	.goto Mulgore,60.44,19.50,25,0
	.goto Mulgore,60.16,21.06,25,0
	.goto Mulgore,60.41,21.96,25,0
	.goto Mulgore,61.12,22.88,25,0
    >>击杀|cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper (8)
    .mob Bristleback Interloper
step
    .goto Mulgore,59.85,25.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Raintotem|r交谈
    .turnin 833 >>交任务: |cRXP_FRIENDLY_神圣的墓地|r
    .target Lorekeeper Raintotem
step
    #completewith next
    >>|cRXP_WARN_完成收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    #loop
	.goto Mulgore,51.00,18.40,0
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
	>>击杀|cRXP_ENEMY_猛鹫|r. 掠夺其|cRXP_LOOT_羽毛|r`
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
    .mob Taloned Swoop
step
    #loop
	.goto Mulgore,50.79,29.37,0
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
    >>|cRXP_WARN_完成收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    #xprate <1.5
    #optional
    #loop
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
    .xp 9+3020 >>升级至3020+/6500经验值
    .isQuestComplete 761
    .isQuestComplete 766
step
    #xprate <1.5
    #optional
    #loop
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
    .xp 9+3720 >>升级至3720/6500经验值
    .isQuestComplete 761
step
    #xprate <1.5
    #optional
    #loop
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
    .xp 9+3700 >>刷到3700+/6500经验值
    .isQuestComplete 766
step
    #xprate <1.5
    #optional
    #loop
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
    .xp 9+4400 >>升级至4400+/6500经验值
step
    #xprate >1.49
    #optional
    #loop
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
    .xp 9+1280 >>升级至1280+/6500经验值
    .isQuestComplete 761
    .isQuestComplete 766
step
    #xprate >1.49
    #optional
    #loop
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
    .xp 9+2330 >>升级至2330+/6500经验值
    .isQuestComplete 761
step
    #xprate >1.49
    #optional
    #loop
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
    .xp 9+2300 >>刷到2300+/6500经验
    .isQuestComplete 766
step
    #xprate >1.49
    #optional
    #loop
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
    .xp 9+3350 >>升级至3350+/6500经验值
step << !Druid
    #completewith Bloodhoofturnins1
    .hs >>传送至血蹄村
    .use 6948
step << Druid
    #sofcore
    #completewith Bloodhoofturnins1
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step << Druid
    #hardcore
    #completewith Bloodhoofturnins1
    .goto Mulgore,47.33,57.17,120 >>返回血蹄村
step
    .goto Mulgore,46.62,61.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    .vendor >>出售垃圾
    .target Innkeeper Kauth
    .isQuestAvailable 870
step
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯克恩|r交谈
    .turnin 770 >>交任务: |cRXP_FRIENDLY_恶魔之伤|r
    .target Skorn Whitecloud
    .isOnQuest 770
step << Warrior
    #season 2
    .goto Mulgore,46.29,61.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与血蹄村的|cRXP_FRIENDLY_Vateya|r交谈
    >>上交你收集到的|cRXP_LOOT_Heads|r, 换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target Vateya Timberhoof
    .train 403475,1
step << Warrior
    #season 2
    .use 204688 >>使用 |T134455:0|t[符文碎片] 制作 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step << Warrior
    #season 2
    .train 403475 >>使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .use 204703
    .itemcount 204703,1
step << Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r和|cRXP_FRIENDLY_Ruul|r和|cRXP_FRIENDLY_Mull|r和|cRXP_FRIENDLY_Harken|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.35,62.02
    .turnin 758 >>交任务: |cRXP_FRIENDLY_净化雷角之井|r
    .accept 759 >>接任务: |cRXP_LOOT_蛮鬃图腾|r
    .target +Mull Thunderhorn
    .goto Mulgore,48.54,60.38
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target +Harken Windtotem
    .goto Mulgore,48.71,59.32
    .isQuestComplete 761
step << Tauren
    #label Bloodhoofturnins1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r和|cRXP_FRIENDLY_Ruul|r和|cRXP_FRIENDLY_Mull|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.35,62.02
    .turnin 758 >>交任务: |cRXP_FRIENDLY_净化雷角之井|r
    .accept 759 >>接任务: |cRXP_LOOT_蛮鬃图腾|r
    .target +Mull Thunderhorn
    .goto Mulgore,48.54,60.38
step << !Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r和|cRXP_FRIENDLY_Ruul|r和|cRXP_FRIENDLY_Harken|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.35,62.02
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target +Harken Windtotem
    .goto Mulgore,48.71,59.32
    .isQuestComplete 761
step << !Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r和|cRXP_FRIENDLY_Ruul|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.35,62.02
step
    #optional
    #label Bloodhoofturnins1
step
    #completewith AlphaTeeth
    .destroy 4702 >>摧毁: |cRXP_ENEMY_勘察员的锄头|r, 它在你的背包中. 不再需要它了
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah交谈|r
    >>|cRXP_BUY_从他那里购买|r|T132384:0|t[重弹丸]|r << Hunter
    .collect 2519,1000,6061,1 << Hunter --Heavy Shot (1000)
    .target Kennah Hawkseye
step
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .turnin 766 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
    .target Maur Raincaller
    .isQuestComplete 766
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .trainer >>训练你的职业法术
    .accept 1505 >>接任务: |cRXP_LOOT_老兵犹塞克|r
    .target Krang Stonehoof
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .accept 2984 >>接任务: |cRXP_LOOT_火焰的召唤|r
    .trainer >>训练你的职业法术
    .target Narm Skychaser
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .accept 6061 >>接任务: |cRXP_LOOT_驯服野兽|r
    .trainer >>训练你的职业法术
    .target Yaw Sharpmane
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .trainer >>训练你的职业法术
    .accept 5928 >>接任务: |cRXP_LOOT_响应召唤|r
    .target Gennia Runetotem
    .isQuestAvailable 5928
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 8924 >>训练你的职业法术
    .target Gennia Runetotem
step << Hunter
    #loop
    .goto Mulgore,39.38,57.43,0
    .goto Mulgore,42.87,54.88,50,0
    .goto Mulgore,40.73,55.60,50,0
    .goto Mulgore,39.38,57.43,50,0
    .use 15914 >>|cRXP_WARN_使用你的|r |T132164:0|t[驯兽棒] |cRXP_WARN_ 对|r |cRXP_ENEMY_ 成年平原陆行鸟|r |cRXP_WARN_ 在最远距离|r
    .complete 6061,1 --Tame an Adult Plainstrider (1)
    .mob Adult Plainstrider
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6061 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6087 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Yaw Sharpmane
step << Hunter
    #loop
    .goto Mulgore,49.49,42.27,0
    .goto Mulgore,47.18,50.15,50,0
    .goto Mulgore,46.65,47.22,50,0
    .goto Mulgore,48.18,45.27,50,0
    .goto Mulgore,49.49,42.27,50,0
    .use 15915 >>|cRXP_WARN_使用你的|r|T132164:0|t[驯兽棒] |cRXP_WARN_对|r|cRXP_ENEMY_草原捕食者|r|cRXP_WARN_在最大距离处|r
    .complete 6087,1 --Tame a Prairie Stalker (1)
    .mob Prairie Stalker
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6087 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6088 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Yaw Sharpmane
step << Hunter
    #loop
    .goto Mulgore,47.25,41.33,0
    .goto Mulgore,47.25,41.33,80,0
    .goto Mulgore,45.41,40.29,80,0
    .goto Mulgore,51.57,44.40,80,0
    .use 15916 >>|cRXP_WARN_使用你的|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_猛鹫|r|cRXP_WARN_在最大范围内施放, 并在它们击倒你时立即重新施放|r
    >>|cRXP_WARN_如果失败且驯兽棒充能用尽, 请放弃任务后重新接取并返回|r
    .complete 6088,1 --Tame a Swoop (1)
    .mob Swoop
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6088 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6089 >>接任务: |cRXP_LOOT_训练野兽|r
    .target Yaw Sharpmane
step
    .goto Mulgore,47.63,61.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jhwana|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Shaman/Druid
    >>|cRXP_BUY_从她那里购买|r|T133968:0|t[刚出炉的面包]|r << Warrior
    .collect 1179,20,818,1 << Shaman/Druid --Ice Cold Milk (20)
    .collect 4541,20,818,1 << Warrior --Freshly Baked Bread (20)
    .target Innkeeper Grosk
    .money <0.05
    .target Jhawna Oatwind
step
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯克恩|r交谈
    .accept 861 >>接任务: |cRXP_LOOT_猎人之道|r
    .target Skorn Whitecloud
step
    #loop
    .goto Mulgore,55.14,60.65,0
    .goto Mulgore,51.50,59.23,50,0
    .goto Mulgore,53.00,60.24,50,0
    .goto Mulgore,55.14,60.65,50,0
    .goto Mulgore,57.47,61.26,50,0
    .goto Mulgore,59.65,62.40,50,0
    .goto Mulgore,55.14,60.65,50,0
    .line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    >>|cRXP_WARN_他沿着东侧道路巡逻|r
    .turnin 751 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 764 >>接任务: |cRXP_WARN_风险投资公司|r
    .accept 765 >>接任务: |cRXP_LOOT_菲兹普罗克主管|r
	.unitscan Morin Cloudstalker
step
    #completewith AlphaTeeth
    >>击杀|cRXP_ENEMY_平原徘徊者|r. 从他们身上搜刮|cRXP_LOOT_爪子|r
    .complete 861,1 --Flatland Prowler Claw (4)
    .mob Flatland Prowler
step << Hunter
    #completewith next
    .cast 1515 >>驯服一只|cRXP_ENEMY_草原狼前锋|r
    >>|cRXP_WARN_这将允许你学习|r|T132140:0|t[利爪技能等级2]
    .mob Prairie Wolf Alpha
step << Tauren
    #label AlphaTeeth
    #loop
    .goto Mulgore,66.34,67.01,0
    .goto Mulgore,67.19,63.78,50,0
    .goto Mulgore,66.34,67.01,50,0
    .goto Mulgore,63.86,66.31,50,0
    .goto Mulgore,61.81,65.52,50,0
    .goto Mulgore,61.61,61.32,50,0
    .goto Mulgore,63.58,60.51,50,0
    .goto Mulgore,65.56,59.37,50,0
    .goto Mulgore,67.62,59.06,50,0
    >>击杀该区域的|cRXP_ENEMY_草原狼前锋|r, 掠夺他们的|cRXP_LOOT_牙齿|r
    .complete 759,1 --Prairie Alpha Tooth (8)
    .mob Prairie Wolf Alpha
step << Tauren
    #softcore
	#completewith Thunderhorn2
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step << Tauren
    #hardcore
    #completewith Thunderhorn2
    .goto Mulgore,46.5,55.5,150 >>返回血蹄村
step << Tauren
    #label Thunderhorn2
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 759 >>交任务: |cRXP_FRIENDLY_蛮鬃图腾|r
    .accept 760 >>接任务: |cRXP_LOOT_净化蛮鬃之井|r
    .target Mull Thunderhorn
step
    #completewith CampTFP
    .goto Mulgore,69.6,60.4,100,0
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step << !Druid
    .goto The Barrens,44.45,59.15
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
    .fp Camp Taurajo >>获取陶拉日营地的飞行路径
	.target Omusa Thunderhorn
step << Druid
    .goto The Barrens,44.45,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
    .fp Camp Taurajo >>获取陶拉日营地的飞行路径
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Omusa Thunderhorn
step
    #optional
    #label CampTFP
step << Druid
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将你的炉石设置为雷霆崖
    .target Innkeeper Pala
step << Druid
    .goto Thunder Bluff,78.1,28.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈缪尔·符文图腾|r交谈
    .accept 886 >>接任务: |cRXP_LOOT_贫瘠之地的绿洲|r
    .target Arch Druid Hamuul Runetotem
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .goto Thunder Bluff,76.7,27.3
    .turnin 5928 >>交任务: |cRXP_FRIENDLY_响应召唤|r
    .accept 5922 >>接任务: |cRXP_LOOT_月光林地|r
    .target Arch Druid Hamuul Runetotem
    .target Turak Runetotem
    .isOnQuest 5928
step << Druid
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .accept 5922 >>接任务: |cRXP_LOOT_月光林地|r
    .target Arch Druid Hamuul Runetotem
    .target Turak Runetotem
step << Druid
    #completewith next
    .cast 18960 >>施放 |T135758:0|t[传送:月光林地]
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dendrite|r交谈
    .turnin 5922 >>交任务: |cRXP_FRIENDLY_月光林地|r
    .accept 5930 >>接任务: |cRXP_LOOT_巨熊之灵|r
    .target Dendrite Starblaze
step << Druid
    .goto Moonglade,39.2,27.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨熊之灵|r交谈
    .complete 5930,1 --Seek out the Great Bear Spirit and learn what it has to share with you about the nature of the bear. (1)
    .target Great Bear Spirit
    .skipgossip
step << Druid
    #completewith next
    .cast 18960 >>施放 |T135758:0|t[传送:月光林地]
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dendrite|r交谈
    .turnin 5930 >>交任务: |cRXP_FRIENDLY_巨熊之灵|r
    .accept 5932 >>接任务: |cRXP_LOOT_返回雷霆崖|r
    .target Dendrite Starblaze
step << Druid
    #completewith DruidBearForm
    .hs >>炉石传送至雷霆崖
    .cooldown item,6948,>0
    .use 6948
step << Druid
    #completewith next
    .goto Moonglade,44.29,45.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑟恩·草风|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Bunthen Plainswind
    .cooldown item,6948,<0
step << Druid
    #label DruidBearForm
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .turnin 5932 >>交任务: |cRXP_FRIENDLY_返回雷霆崖|r
    .accept 6002 >>接任务: |cRXP_LOOT_身心之力|r
    .target Turak Runetotem
step << Druid
    #completewith next
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .fly Camp Taurajo >>飞往陶拉霍营地
    .target Tal
step << Druid
    .goto The Barrens,42.00,60.86
    .use 15710 >>|cRXP_WARN_使用|r|T132857:0|t[赛纳里奥银尘] |cRXP_WARN_在|r|cRXP_PICK_月夜枭兽之石|r
    >>击杀|cRXP_ENEMY_月爪枭兽|r, 待其刷新后. 随后与|cRXP_FRIENDLY_月爪枭兽的灵魂|r交谈
    >>|cRXP_WARN_小心！|cRXP_ENEMY_月爪枭兽|r施放|r|T132152:0|t[猛击]|cRXP_WARN_(每10秒获得2次额外攻击)|r
    >>|cRXP_WARN_避开该区域的|r|cRXP_ENEMY_电角蜥蜴|r|r
    .complete 6002,1 --Face Lunaclaw and earn the strength of body and heart it possesses. (1)
    .mob Lunaclaw
    .target Lunaclaw Spirit
    .skipgossip
step << Tauren
    .goto The Barrens,44.9,58.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔格·锐角|r交谈
    .accept 854 >>接任务: |cRXP_LOOT_十字路口之旅|r
    .target Kirge Sternhorn
step
    #completewith next
    .goto The Barrens,52.07,31.96,120 >>前往北方的十字路口
step
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tonga|r交谈
    .turnin 886 >>交任务: |cRXP_FRIENDLY_贫瘠之地的绿洲|r << Druid
    .accept 870 >>接任务: |cRXP_LOOT_遗忘之池|r
    .target Tonga Runetotem
step << Tauren
    .goto The Barrens,51.5,30.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .turnin 854 >>交任务: |cRXP_FRIENDLY_十字路口之旅|r
    .target Thork
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    .accept 848 >>接任务: |cRXP_LOOT_菌类孢子|r
    .target Apothecary Helbrim
step
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fp The Crossroads >>获取十字路口的飞行路径
    .target Devrak
step
    .goto The Barrens,51.1,29.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加翰·鹰翼|r交谈
    .accept 6361 >>接任务: |cRXP_LOOT_一捆兽皮|r
    .target Jahan Hawkwing
step
    #completewith next
    >>在遗忘之池周围收集|cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_采集蘑菇时, 请与|cRXP_ENEMY_Kolkar|r|cRXP_WARN_保持最大距离. 它们的等级为12-14级|r
    >>|cRXP_WARN_此任务的后续奖励为强大的|cRXP_FRIENDLY_大锅 蛰刺|r|cRXP_WARN_. 若您暂不打算使用该物品, 可暂时跳过此任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    .goto The Barrens,45.06,22.54
    >>潜入水下至|cRXP_PICK_Bubble Fissure|r
    .complete 870,1 --Explore the waters of the Forgotten Pools
step
    #loop
    .goto The Barrens,45.2,23.3,0
    .goto The Barrens,45.2,23.3,40,0
    .goto The Barrens,45.2,22.0,40,0
    .goto The Barrens,44.6,22.5,40,0
    .goto The Barrens,43.9,24.4,40,0
    >>在遗忘之池周围收集|cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_与该区域内的|cRXP_ENEMY_Kolkar|r|cRXP_WARN_保持最大距离. 它们等级为12-14级|r
    >>|cRXP_WARN_此任务的后续奖励为强大的|cRXP_FRIENDLY_大锅 蛰刺|r|cRXP_WARN_. 若您暂不打算使用该物品, 可暂时跳过此任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #softcore
	#completewith ZamahPickup
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #hardcore
    #completewith ZamahPickup
    .subzone 380 >>返回十字路口
step
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tonga|r交谈
    .turnin 870 >>交任务: |cRXP_FRIENDLY_遗忘之池|r
    .accept 877 >>接任务: |cRXP_LOOT_死水绿洲|r
    .target Tonga Runetotem
    .isQuestComplete 870
step
    #optional
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tonga|r交谈
    .accept 877 >>接任务: |cRXP_LOOT_死水绿洲|r
    .target Tonga Runetotem
    .isQuestTurnedIn 877
step
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板博兰德|r交谈
    .home >>将你的炉石设置为十字路口
    .target Innkeeper Boorand Plainswind
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    >>|cRXP_WARN_等待RP结束|r
    >>|cRXP_WARN_这将开启一个45分钟的限时任务|r
    .turnin 848 >>交任务: |cRXP_FRIENDLY_菌类孢子|r
    .accept 853 >>接任务: |cRXP_LOOT_药剂师扎玛|r
    .target Apothecary Helbrim
    .isQuestComplete 848
step
    #optional
    #label ZamahPickup
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    >>|cRXP_WARN_这将开启一个45分钟的限时任务|r
    .accept 853 >>接任务: |cRXP_LOOT_药剂师扎玛|r
    .target Apothecary Helbrim
    .isQuestTurnedIn 848
step
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .turnin 6361 >>交任务: |cRXP_FRIENDLY_一捆兽皮|r
    .accept 6362 >>接任务: |cRXP_LOOT_飞往雷霆崖|r
    .target Devrak
step
    #completewith RideToTB
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Devrak
step
    #sticky
    #completewith CauldronStirrer
    +|cRXP_WARN_你正在进行限时任务, 请不要离开. 任务将在领取后约5-10分钟内自动提交|r
    .isOnQuest 853
step
    #label RideToTB
    .goto Thunder Bluff,45.6,55.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安哈努|r 交谈
    .turnin 6362 >>交任务: |cRXP_FRIENDLY_飞往雷霆崖|r
    .accept 6363 >>接任务: |cRXP_LOOT_双足飞龙管理员塔尔|r
    .target Ahanu
step << Hunter
    .goto Thunder Bluff,61.3,80.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melor|r交谈
    .turnin 861 >>交任务: |cRXP_FRIENDLY_猎人之道|r
    .accept 860 >>接任务: |cRXP_LOOT_瑟格拉·黑棘|r
    .target Melor Stonehoof
    .isQuestComplete 861
step << Hunter
    .goto Thunder Bluff,61.3,80.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melor|r交谈
    .accept 860 >>接任务: |cRXP_LOOT_瑟格拉·黑棘|r
    .target Melor Stonehoof
    .isQuestTurnedIn 861
step << Hunter
	.goto Thunder Bluff,57.4,89.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍尔特|r交谈
	.turnin 6089 >>交任务: |cRXP_FRIENDLY_训练野兽|r
    .target Holt Thunderhorn
step << Hunter
    .goto Thunder Bluff,54.08,84.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
    .train 24547 >>训练你的宠物法术
    .target Hesuwa Thunderhorn
step << Hunter
    #completewith CauldronStirrer
    +|cRXP_WARN_将|r|T132162:0|t[训练野兽]|cRXP_WARN_拖到你的动作栏上. 为你的宠物传授技能|r
step << Druid
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 199 >>训练双手锤
    .target Ansekhwas
    .money <0.1154
step << Warrior/Hunter
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 227 >>训练法杖
    .target Ansekhwa
step
    .goto Thunder Bluff,37.8,59.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .accept 744 >>接任务: |cRXP_LOOT_准备典礼|r
    .target Eyahn Eagletalon
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .accept 76156 >>接任务: |cRXP_WARN_大地母亲与匿同在|r
    .target Boarton Shadetotem
    .train 410104,1
    .xp <4,1
step
    #completewith next
    .goto Thunder Bluff,28.14,32.97,40,0
    .goto Thunder Bluff,28.51,28.95,10 >>前往灵魂高地, 进入幻视之池
step
    #label CauldronStirrer
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >>交任务: |cRXP_FRIENDLY_药剂师扎玛|r
    .target Apothecary Zamah
    .isOnQuest 853
step
    #completewith ReturntoJahan
    +装备 |T135145:0|t[锅炉搅拌器]
    .use 5340
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
    .itemcount 5340,1
step << Warrior
    #season 2
    #completewith next
    .goto Thunder Bluff,28.73,18.00,-1
    .goto Thunder Bluff,26.19,18.65,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与灵魂高地上的|cRXP_FRIENDLY_Netali|r和|cRXP_FRIENDLY_Mooart|r交谈
    +击杀变为敌对的 |cRXP_FRIENDLY_Mooart|r
    .target Netali Proudwind
    .target Mooart
    .skipgossip
    --Gossipoption
step << Warrior
    #season 2
    .goto Thunder Bluff,28.73,18.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈塔莉|r交谈
    >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target Netali
    .train 425447,1
    .skipgossip
step << Warrior
    #season 2
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .use 204716
    .itemcount 204716,1
step
    #label ReturntoJahan
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .turnin 6363 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员塔尔|r
    .accept 6364 >>接任务: |cRXP_LOOT_向加翰回复|r
    .target Tal
step
    .goto Thunder Bluff,60.0,51.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·血蹄|r交谈
    .turnin 775 >>交任务: |cRXP_FRIENDLY_雷霆崖之旅|r
    .accept 776 >>接任务: |cRXP_LOOT_大地之母仪祭|r
    .target Cairne Bloodhoof
step << Druid
    .goto Thunder Bluff,76.477,27.221
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .turnin 6002 >>交任务: |cRXP_FRIENDLY_身心之力|r
    .target Turak Runetotem
step
    #ah
    .goto Thunder Bluff,44.43,43.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫兰塔|r交谈
    >>|cRXP_WARN_这将解锁一个简单的任务. 如果你已经有两个专业技能, 请跳过此步骤|r
    .train 8613 >>训练 |T134366:0|t[剥皮]
    .target Mooranta
step
    #ah
    .goto Thunder Bluff,44.39,44.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔伦·陆行者|r交谈
    .accept 768 >>接任务: |cRXP_WARN_收集皮革|r
    .target Veren Tallstrider
    .skill skinning,<1,1
step
    #ah
    .goto Thunder Bluff,40.39,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师斯塔比交谈|cRXP_FRIENDLY_Auctioneer Stampi|r
    >>|cRXP_BUY_从拍卖行购买十二|r|T134252:0|t[轻皮革]|r
    .collect 2318,12,768,1 --Light Leather (12)
    .target Auctioneer Stampi
    .skill skinning,<1,1
step
    #ah
    .goto Thunder Bluff,44.39,44.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔伦·陆行者|r交谈
    .turnin 768 >>交任务: |cRXP_FRIENDLY_收集皮革|r
    .target Veren Tallstrider
    .skill skinning,<1,1
step << Hunter
    .goto Thunder Bluff,52.32,47.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加|r交谈
    >>|cRXP_BUY_从她那里购买|r|T133972:0|t[硬肉干]|cRXP_BUY_来喂养你的宠物|r
    .collect 117,5,744,1 --Tough Jerky (5)
    .target Kaga Mistrunner
step << Shaman
    #season 2
    #loop
    #completewith VentureCoKills
    >>打开矿洞内和另一侧外面的|cRXP_PICK_爆破补给|r, 拾取它们以获得|cRXP_LOOT_海火采矿炸药|r
    >>|cRXP_WARN_如果可能的话, 尽量待在洞穴的上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
	#era/som
    #completewith Fizsprocket1
    .goto Mulgore,61.51,47.29,20 >>Travel to 接任务: |cRXP_WARN_风险投资公司|r. Mine
step << Shaman
    #season 2
    #completewith next
    >>杀死|cRXP_ENEMY_风险投资公司工人|r 和|cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +Venture Co. Worker
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +Venture Co. Supervisor
step << Shaman
    #season 2
    #label Fizsprocket1
    .goto Mulgore,64.95,43.33
    >>Run into the mine and hug the right/east side. Kill |cRXP_ENEMY_Supervisor Fizsprocket|r. Loot him for his |cRXP_LOOT_Clipboard|r
    .complete 765,1 --Fizsprocket's Clipboard (1)
    .mob Supervisor Fizsprocket
step << Shaman
    #season 2
    #label VentureCoKills
    #loop
	.goto Mulgore,61.35,47.55,0
	.goto Mulgore,61.35,47.55,25,0
	.goto Mulgore,60.10,47.84,25,0
	.goto Mulgore,59.50,48.21,25,0
	.goto Mulgore,59.68,48.85,25,0
	.goto Mulgore,60.14,49.14,25,0
	.goto Mulgore,62.01,48.74,25,0
	.goto Mulgore,61.89,47.84,25,0
    >>杀死|cRXP_ENEMY_风险投资公司工人|r 和|cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +Venture Co. Worker
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +Venture Co. Supervisor
step << Shaman
    #season 2
    #loop
    .goto Mulgore,63.77,43.97,15,0
    .goto Mulgore,62.81,42.81,15,0
    .goto Mulgore,60.38,42.78,15,0
    .goto Mulgore,61.64,41.33,15,0
    .goto Mulgore,63.51,39.29,15,0
    .goto Mulgore,63.39,40.80,15,0
--  .goto Mulgore,66.53,39.47,15,0 --Very deep inside the top of the mine, skipping
    .goto Mulgore,60.99,37.00,15,0
    .goto Mulgore,59.64,36.05,15,0 --Outside
    .goto Mulgore,61.72,35.15,15,0 --Outside
    >>打开矿洞内和另一侧外面的|cRXP_PICK_爆破补给|r, 拾取它们以获得|cRXP_LOOT_海火采矿炸药|r
    >>|cRXP_WARN_如果可能的话, 尽量待在洞穴的上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #completewith next
    .zone Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .turnin 76156 >>交任务: |cRXP_FRIENDLY_大地母亲与匿同在|r
    .accept 76160 >>接任务: |cRXP_WARN_大地母亲与匿同在|r
    .target Boarton Shadetotem
    .train 410104,1
    .xp <4,1
step
    #sticky
    #completewith ThunderBluff
    >>留意|cRXP_ENEMY_鬼嚎|r. 击败他后搜刮其掉落的 |T134358:0|t[|cRXP_LOOT_恶魔之伤|r]. 使用该物品开启任务
    >>如果找不到他, 请跳过此步骤
    .collect 4854,1,770 --Collect Demon Scarred Cloak
    .accept 770 >>接任务: |cRXP_LOOT_恶魔之伤|r
    .use 4854
    .unitscan Ghost Howl
step << Druid
    #season 2
    #completewith ProwlerClaws
    >>击杀|cRXP_ENEMY_平原徘徊者|r 和|cRXP_ENEMY_草原狼前锋|r . 击败它们后可获得 |T134903:0|t[|cRXP_FRIENDLY_熊之怒狂石|r ]
    .collect 206954,1 --Idol of Ursine Rage (1)
    .mob Flatland Prowler
    .mob Prairie Wolf Alpha
    .train 410025,1
step
    #completewith Arrachea
    >>击杀|cRXP_ENEMY_平原徘徊者|r. 从他们身上搜刮|cRXP_LOOT_爪子|r
    .complete 861,1 --Flatland Prowler Claw (4)
    .mob Flatland Prowler
step << Shaman
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_风怒女巫|r. 从她们身上搜刮|cRXP_LOOT_碧蓝色羽毛|r
    >>击杀风怒女族长. 从她们身上搜刮古铜色的羽毛
    .complete 744,1 --Azure Feather (6)
    .mob +Windfury Sorceress
    .complete 744,2 --Bronze Feather (6)
    .mob +Windfury Matriarch
    .train 410104,1
step << Shaman
    #season 2
    #loop
    .goto Mulgore,37.18,12.36,0
    .goto Mulgore,38.80,16.03,10,0
    .goto Mulgore,37.79,10.86,10,0
    .goto Mulgore,38.01,10.21,10,0
    .goto Mulgore,38.55,8.10,10,0
    .goto Mulgore,38.06,7.47,10,0
    .goto Mulgore,37.36,9.99,10,0
    .goto Mulgore,37.31,10.41,10,0
    .goto Mulgore,35.80,11.21,10,0
    .goto Mulgore,36.20,11.41,10,0
    .goto Mulgore,36.21,12.60,10,0
    .goto Mulgore,36.55,12.84,10,0
    .goto Mulgore,36.65,13.26,10,0
    .goto Mulgore,37.18,12.36,10,0
    >>拾取地面上的风怒锥体|cRXP_LOOT_Windfury Cones|r
    .collect 206170,8,76160,1 --Windfury Cone (8)
    .train 410104,1
step
    #loop
    .goto Mulgore,31.7,28.2,0
    .goto Mulgore,30.2,19.5,0
    .goto Mulgore,31.7,28.2,40,0
    .goto Mulgore,30.2,19.5,40,0
    >>击杀|cRXP_ENEMY_风怒女巫|r. 从她们身上搜刮|cRXP_LOOT_碧蓝色羽毛|r
    >>击杀风怒女族长. 从她们身上搜刮古铜色的羽毛
    .complete 744,1 --Azure Feather (6)
    .mob +Windfury Sorceress
    .complete 744,2 --Bronze Feather (6)
    .mob +Windfury Matriarch
step << Tauren
    .goto Mulgore,42.5,13.8
    .use 5416 >>|cRXP_WARN_使用|r|T135139:0|t[蛮鬃之井净化图腾]|cRXP_WARN_在井边|r
    .complete 760,1 --Cleanse the Wildmane Well (1)
step << Warrior/Hunter
    #season 2
    #loop
    .goto Mulgore,52.6,12.2,0
    .goto Mulgore,52.6,12.2,90,0
    .goto Mulgore,48.6,16.1,90,0
    .goto Mulgore,51.8,33.8,90,0
    .goto Mulgore,56.2,32.9,90,0
    >>击杀|cRXP_ENEMY_Arra'Chea|r(大黑科多兽). 击杀并拾取其|cRXP_LOOT_Horn|r << !Warrior !Hunter
    >>杀死|cRXP_ENEMY_Arra'Chea|r(大黑科多兽). 击杀并搜刮其掉落的|cRXP_LOOT_Horn|r和 |T134419:0|t[|cRXP_FRIENDLY_狂雷符文|r] << Warrior
    >>击杀|cRXP_ENEMY_Arra'Chea|r(大黑科多兽). 杀死并搜刮他, 获得他的|cRXP_LOOT_Horn|r和 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r] << Hunter
    >>|cRXP_WARN_他沿着莫高雷北部顺时针巡逻|r
    .complete 776,1 --Horn of Arra'chea (1)
    .collect 204809,1 << Warrior --Rune of Furious Thunder(1)
    .collect 206169,1 << Hunter --Rune of Explosive Shot (1)
    .unitscan Arra'chea
    .train 403476,1 << Warrior
    .train 410123,1 << Hunter
    --VV .line
step << Warrior
    #season 2
    .train 403476 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂怒雷霆符文|r]
    .use 204809
    .itemcount 204809,1
step << Hunter
    #season 2
    .train 410123 >>使用 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r]
    .use 206169
    .itemcount 206169,1
step
    #label Arrachea
    #loop
    .goto Mulgore,52.6,12.2,0
    .goto Mulgore,52.6,12.2,90,0
    .goto Mulgore,48.6,16.1,90,0
    .goto Mulgore,51.8,33.8,90,0
    .goto Mulgore,56.2,32.9,90,0
    >>击杀|cRXP_ENEMY_Arra'Chea|r(大黑科多兽). 击杀并拾取其|cRXP_LOOT_Horn|r
    >>|cRXP_WARN_他沿着莫高雷北部顺时针巡逻|r
    .complete 776,1 --Horn of Arra'chea (1)
    .unitscan Arra'chea
    --VV .line
step
    #label ProwlerClaws
    #loop
    .goto Mulgore,43.78,10.96,0
    .goto Mulgore,43.78,10.96,90,0
    .goto Mulgore,39.62,13.35,90,0
    .goto Mulgore,37.12,16.84,90,0
    .goto Mulgore,44.57,17.39,90,0
    .goto Mulgore,48.70,20.85,90,0
    >>击杀|cRXP_ENEMY_平原徘徊者|r. 从他们身上搜刮|cRXP_LOOT_爪子|r
    .complete 861,1 --Flatland Prowler Claw (4)
    .mob Flatland Prowler
step << Druid
    #season 2
    #loop
    .goto Mulgore,43.78,10.96,0
    .goto Mulgore,43.78,10.96,90,0
    .goto Mulgore,39.62,13.35,90,0
    .goto Mulgore,37.12,16.84,90,0
    .goto Mulgore,44.57,17.39,90,0
    .goto Mulgore,48.70,20.85,90,0
    >>击杀|cRXP_ENEMY_平原徘徊者|r 和|cRXP_ENEMY_草原狼前锋|r . 击败它们后可获得 |T134903:0|t[|cRXP_FRIENDLY_熊之怒狂石|r ]
    .collect 206954,1 --Idol of Ursine Rage (1)
    .mob Flatland Prowler
    .mob Prairie Wolf Alpha
    .train 410025,1
step << Druid
    #season 2
    .equip 18,206954 >>|cRXP_WARN_装备|r|T134903:0|t[|cRXP_FRIENDLY_熊怒之偶像|r]
    .use 206954
    .train 410025,1
step << Druid
    #season 2
    #completewith next
    +|cRXP_WARN_保持50+怒气至少60秒方可学习|r|T132135:0|t[撕裂]
step << Druid
    #season 2
    .train 410025 >>|cRXP_WARN_使用|r|T134903:0|t[|cRXP_FRIENDLY_熊之怒图腾|r]|cRXP_WARN_来训练|r|T132135:0|t[撕裂]
    .use 206954
    .itemcount 206954,1
step
    #completewith next
    .subzone 1638 >>返回雷霆崖
    .zoneskip Thunder Bluff
step
    #label RFCPickups1
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉哈罗|r交谈
    .accept 5722 >>接任务: |cRXP_WARN_寻找背包|r
    .accept 5723 >>接任务: |cRXP_WARN_试探敌人|r
    .target Rahauro
    .dungeon RFC
step
    .goto Thunder Bluff,60.0,51.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·血蹄|r交谈
    .turnin 776 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
    .target Cairne Bloodhoof
    .isQuestComplete 776
step
    .goto Thunder Bluff,37.8,59.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .turnin 744 >>交任务: |cRXP_FRIENDLY_准备典礼|r
    .target Eyahn Eagletalon
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .turnin 76160 >>交任务: |cRXP_FRIENDLY_大地母亲与匿同在|r
    .accept 76240 >>接任务: |cRXP_WARN_大地母亲与匿同在|r
    .target Boarton Shadetotem
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ah
    .goto Thunder Bluff,45.23,59.40,0
    .goto Thunder Bluff,40.41,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师斯塔比交谈|cRXP_FRIENDLY_Auctioneer Stampi|r
    >>|cRXP_BUY_从拍卖行购买|r|T133894:0|t[新鲜的美味小鱼] |r
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .target Auctioneer Stampi
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #completewith Sewa
    .goto Thunder Bluff,46.13,51.59,12,0
    .goto Thunder Bluff,47.09,50.07,4,0
    .goto Thunder Bluff,46.49,49.16,4,0
    .goto Thunder Bluff,46.05,49.74,4,0
    .goto Thunder Bluff,46.34,50.50,4,0
    .goto Thunder Bluff,55.78,47.02,15 >>前往|cRXP_FRIENDLY_苏瓦·迷雾行者|r
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #sticky
    #label Kah
    .goto Thunder Bluff,56.13,46.39,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔·迷雾行者|r交谈
    .train 7734 >>训练 |T136245:0|t[钓鱼]
    .target Kah Mistrunner
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #label Sewa
    .goto Thunder Bluff,55.78,47.02,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏瓦·迷雾行者|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132932:0|t[钓鱼竿]|cRXP_BUY_和|r|T134335:0|t[闪光的小珠]|r
    .collect 6256,1 --Fishing Pole (1)
    .collect 6529,1 --Shiny Bauble (1)
    .target Sewa Mistrunner
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #completewith Fish
    #requires Kah
    #label Pole
    .equip 16,6256 >>|cRXP_WARN_装备|r|T132932:0|t[钓鱼竿]
    .use 6256
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #completewith Fish
    #requires Pole
    .aura 8087 >>|cRXP_WARN_将|r|T134335:0|t[闪光的小珠] |cRXP_WARN_附着到你的|r|T132932:0|t[钓鱼竿]
    .use 6529
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #label Fish
    #requires Kah
    .goto Thunder Bluff,40.42,58.55
    >>在池塘里钓鱼, 直到钓到 |T133894:0|t[|cRXP_LOOT_新鲜的美味小鱼|r]
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    >>使用 |T132147:0|t[刀具套装] 制作 |T134007:0|t[鱼肉碎块]
    .complete 76240,1 --Fish Chunks (1)
    .use 206344
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .turnin 76240 >>交任务: |cRXP_FRIENDLY_大地母亲与匿同在|r
-- .train 410104 >>|cRXP_WARN_你将训练|r|T236289:0|t[熔岩鞭笞]|cRXP_WARN_和|r|T132147:0|t[双持]|cRXP_WARN_在提交时|r
    .target Boarton Shadetotem
    .train 410104,1
    .xp <4,1
step
    .goto Thunder Bluff,61.3,80.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melor|r交谈
    .turnin 861 >>交任务: |cRXP_FRIENDLY_猎人之道|r
    .accept 860 >>接任务: |cRXP_LOOT_瑟格拉·黑棘|r
    .target Melor Stonehoof
step
    #completewith WildManeTurnIn
    .subzone 222 >>前往血蹄村
step
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯克恩|r交谈
    .turnin 770 >>交任务: |cRXP_FRIENDLY_恶魔之伤|r
    .target Skorn Whitecloud
    .isOnQuest 770
step << Tauren
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 760 >>交任务: |cRXP_FRIENDLY_净化蛮鬃之井|r
    .target Mull Thunderhorn
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .train 547 >>训练你的职业法术
    .target Narm Skychaser
    .xp <12,1
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 8936 >>训练你的职业法术
    .target Gennia Runetotem
    .xp <12,1
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 7384 >>训练你的职业法术
    .target Krang Stonehoof
    .xp <12,1
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 14281 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <12,1
step
    #optional
    #label WildManeTurnIn
step
    #completewith Fizsprocket
    .goto Mulgore,61.51,47.29,20 >>Travel to 接任务: |cRXP_WARN_风险投资公司|r. Mine
step
    #completewith next
    >>杀死|cRXP_ENEMY_风险投资公司工人|r 和|cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob Venture Co. Worker
    .mob Venture Co. Supervisor
step
    #label Fizsprocket
    .goto Mulgore,64.95,43.33
    >>Run into the mine and hug the right/east side. Kill |cRXP_ENEMY_Supervisor Fizsprocket|r. Loot him for his |cRXP_LOOT_Clipboard|r
    .complete 765,1 --Fizsprocket's Clipboard (1)
    .mob Supervisor Fizsprocket
step
    #loop
	.goto Mulgore,61.35,47.55,0
	.goto Mulgore,61.35,47.55,25,0
	.goto Mulgore,60.10,47.84,25,0
	.goto Mulgore,59.50,48.21,25,0
	.goto Mulgore,59.68,48.85,25,0
	.goto Mulgore,60.14,49.14,25,0
	.goto Mulgore,62.01,48.74,25,0
	.goto Mulgore,61.89,47.84,25,0
    >>杀死|cRXP_ENEMY_风险投资公司工人|r 和|cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +Venture Co. Worker
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +Venture Co. Supervisor
step
    #xprate <1.5
    #loop
	.goto Mulgore,61.35,47.55,25,0
	.goto Mulgore,60.10,47.84,25,0
	.goto Mulgore,59.50,48.21,25,0
	.goto Mulgore,59.68,48.85,25,0
	.goto Mulgore,60.14,49.14,25,0
	.goto Mulgore,62.01,48.74,25,0
	.goto Mulgore,61.89,47.84,25,0
    .xp 11+7150 >>升级至7150+/8700经验值
step
    #xprate >1.49
    #loop
	.goto Mulgore,61.35,47.55,25,0
	.goto Mulgore,60.10,47.84,25,0
	.goto Mulgore,59.50,48.21,25,0
	.goto Mulgore,59.68,48.85,25,0
	.goto Mulgore,60.14,49.14,25,0
	.goto Mulgore,62.01,48.74,25,0
	.goto Mulgore,61.89,47.84,25,0
    .xp 11+6375 >>升级至6375/8700经验值
step
    #loop
    .goto Mulgore,55.14,60.65,0
    .goto Mulgore,51.50,59.23,50,0
    .goto Mulgore,53.00,60.24,50,0
    .goto Mulgore,55.14,60.65,50,0
    .goto Mulgore,57.47,61.26,50,0
    .goto Mulgore,59.65,62.40,50,0
    .goto Mulgore,55.14,60.65,50,0
    .line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    >>|cRXP_WARN_他沿着东侧道路巡逻|r
    .turnin 764 >>交任务: |cRXP_FRIENDLY_风险投资公司|r
    .turnin 765 >>交任务: |cRXP_FRIENDLY_菲兹普罗克主管|r
	.unitscan Morin Cloudstalker
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .trainer >>训练你的职业法术
    .target Narm Skychaser
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .trainer >>训练你的职业法术
    .target Gennia Runetotem
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .trainer >>训练你的职业法术
    .target Krang Stonehoof
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .trainer >>训练你的职业法术
    .target Yaw Sharpmane
step
    #completewith HidesTurnIn
    .hs >>传送至十字路口
    .cooldown item,6948,>0
    .use 6948
step
    #completewith next
    .subzone 378 >>前往陶拉霍营地
step
    .goto The Barrens,44.45,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
    .fly Crossroads >>飞往十字路口
    .target Omusa Thunderhorn
    .cooldown item,6948,<0,1
step
    #label HidesTurnIn
    .goto The Barrens,51.1,29.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加翰·鹰翼|r交谈
    .turnin 6364 >>交任务: |cRXP_FRIENDLY_向加翰回复|r
    .target Jahan Hawkwing
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    .accept 1492 >>接任务: |cRXP_LOOT_码头管理员迪兹维格|r
    .target Apothecary Helbrim
step
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .accept 871 >>接任务: |cRXP_LOOT_野猪人的袭击|r
    .accept 5041 >>接任务: |cRXP_LOOT_十字路口的补给品|r
    .target Thork
step
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索克|r交谈
    >>|cRXP_WARN_他在塔顶|r
    .accept 867 >>接任务: |cRXP_LOOT_鹰身强盗|r
    .target Darsok Swiftdagger
step
    .goto The Barrens,52.23,31.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 860 >>交任务: |cRXP_FRIENDLY_瑟格拉·黑棘|r
    .accept 844 >>接任务: |cRXP_LOOT_平原陆行鸟的威胁|r
    .target Sergra Darkthorn
step
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r交谈
    .accept 869 >>接任务: |cRXP_LOOT_偷钱的迅猛龙|r
    .target Gazrog
step << Shaman
    #completewith next
    >>检查|r旁边的老陈的空酒桶. 拾取它并开始任务, 否则稍后会自动获得该任务
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
step << Shaman
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳尔|r交谈
    .turnin 2984 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
    .accept 1524 >>接任务: |cRXP_LOOT_火焰的召唤|r
    .target Kranal Fiss
step << Shaman
    #completewith next
    .goto Durotar,36.74,57.78,10,0
    .goto Durotar,36.63,58.15,8,0
    .goto Durotar,36.63,58.15,8,0
    .goto Durotar,36.77,58.98,8,0
    .goto Durotar,36.85,58.32,8,0
    .goto Durotar,37.24,58.13,8,0
    .goto Durotar,37.86,58.18,8,0
    .goto Durotar,38.05,57.79,8,0
    .goto Durotar,38.93,57.54,8,0
    .goto Durotar,39.19,57.90,8,0
    .goto Durotar,39.16,58.56,10 >>沿着山路向上前行, 前往|cRXP_FRIENDLY_Telf|r
    >>|cRXP_WARN_小心别从山上掉下去, 路非常狭窄. 一旦坠落, 可能会死亡|r
step << Shaman
    #label CallofFire2
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰尔夫|r交谈
    .turnin 1524 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
    .accept 1525 >>接任务: |cRXP_LOOT_火焰的召唤|r
    .target Telf Joolam
step << Warrior
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1505 >>交任务: |cRXP_FRIENDLY_老兵犹塞克|r
    .accept 1498 >>接任务: |cRXP_LOOT_防御之道|r
    .target Uzzek
step << Warrior
    #loop
    .goto Durotar,39.34,28.25,0
    .goto Durotar,39.11,30.76,40,0
    .goto Durotar,39.34,28.25,40,0
    .goto Durotar,39.11,26.46,40,0
    .goto Durotar,39.39,25.05,40,0
    .goto Durotar,40.00,24.06,40,0
    .goto Durotar,42.51,24.29,40,0
    .goto Durotar,39.34,28.25,40,0
    >>击杀闪电蜥蜴. 掠夺其身上的鳞片
    .complete 1498,1 --Singed Scale (5)
    .mob Lightning Hide
step << Warrior
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1498 >>交任务: |cRXP_FRIENDLY_防御之道|r
    .accept 1502 >>接任务: |cRXP_LOOT_索恩格瑞姆·火眼|r
    .target Uzzek

]])


local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end


RXPGuides.RegisterGuide([[
#classic
<< Horde
#xprate >1.99
#version 1
#group RestedXP 联盟 1-22
#name 1-7 莫高雷
#displayname 1-7 莫高雷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 7-13 莫高雷
#defaultfor Tauren


step << !Tauren
    #completewith next
    .goto Mulgore,44.92,77.12
    +|cRXP_WARN_您选择的指南专为牛头人设计. 由于该区域缺少仅限牛头人开启的主要任务线, 因此对您来说无法正常进行. 建议您选择与您初始起始区域相同的区域|r
step
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .accept 747 >>接任务: |cRXP_LOOT_开始狩猎|r
    .target Grull Hawkwind
step
    #season 2
    .goto Mulgore,44.35,76.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]|cRXP_BUY_和你的一|r|T133964:0|t[面包块]|cRXP_WARN_(可通过按住Shift键点击分割)|r|cRXP_BUY_, 然后从他那里购买|r|T134419:0|t[|cRXP_FRIENDLY_狂暴冲锋符文|r]和|r|T134419:0|t[|cRXP_FRIENDLY_胜利冲刺符文|r]|r << Warrior
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]|cRXP_BUY_和其中一个|r|T134534:0|t[蘑菇帽]|cRXP_WARN_(可通过按住Shift键点击拆分)|r|cRXP_BUY_, 并从他那里购买|r|T134920:0|t[|cRXP_FRIENDLY_Kajaric图标|r]|cRXP_BUY_和|r|T134918:0|t[|cRXP_FRIENDLY_Dyadic图标|r]|r << Shaman
    >>|cRXP_BUY_出售你的|r|T135005:0|t[衬衫]|cRXP_BUY_和|r|T132794:0|t[水]|cRXP_BUY_并购买以下符文:|r  << Hunter
    >>|cRXP_BUY_出售你的|r|T133975:0|t[苹果]|cRXP_BUY_并购买以下符文:|r << Druid
    >>|cRXP_BUY_出售垃圾并购买以下所有符文:|r << Shaman
    .collect 204716,1 << Warrior --Rune of Frenzied Assault
    .collect 204806,1 << Warrior --Rune of Victory Rush
    .collect 209852,1 << Hunter --Rune of Kill Command
    .collect 206168,1 << Hunter --Rune of the Chimera
    .collect 226401,1 << Hunter --Treatise on the Heart of the Lion
    .collect 216770,1 << Hunter --Treatise on Aspect of the Viper
    .collect 206387,1 << Shaman --Kajaric Icon
    .collect 206381,1 << Shaman --Dyadic Icon
    .collect 208414,1 << Druid --Lunar Idol
    .collect 210500,1 << Druid --Rune of the Stars
    .collect 206989,1 << Druid --Rune of the Sun
    .collect 227749,1 << Druid --Rune of the Falling Star
    >>你很快就会得到剩下的符文
    .target Rune Broker
    .skipgossip
step
    #season 2
    #sticky
    #optional
    .use 204716 << Warrior --Rune of Frenzied Assault
    .use 204806 << Warrior --Rune of Victory Rush
    .use 209852 << Hunter --Rune of Kill Command
    .use 206168 << Hunter --Rune of the Chimera
    .use 226401 << Hunter --Treatise on the Heart of the Lion
    .use 216770 << Hunter --Treatise on Aspect of the Viper
    .use 206387 << Shaman --Kajaric Icon
    .use 208414 << Druid --Lunar Idol
    .use 210500 << Druid --Rune of the Stars
    .use 206989 << Druid --Rune of the Sun
    .use 227749 << Druid --Rune of the Falling Star
    .equip 18 >>装备|T134920:0|t[|cRXP_FRIENDLY_Kajaric Icon|r], 30秒后可使用它来学习|T237582:0|t[熔岩爆裂] << Shaman
    .equip 18 >>装备|T134903:0|t[|cRXP_FRIENDLY_月之祭品|r], 30秒后可使用它来训练|T237472:0|t[风暴之怒] << Druid
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r] << Warrior
    .train 403470 >>使用 |T134419:0|t[|cRXP_FRIENDLY_胜利之纹|r] 来训练 |T132342:0|t[胜利冲刺], 你将很快将其刻印 << Warrior
    .train 410111 >>使用|T134419:0|t[|cRXP_FRIENDLY_击杀命令符文|r]来训练|T236174:0|t[致命一击] << Hunter
    .train 410121 >>使用|T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]来训练|T236176:0|t[奇美拉射击] << Hunter
    .train 409580 >>使用|T133739:0|t[|cRXP_FRIENDLY_雄狮之心论|r]来训练|T132185:0|t[雄狮之心] << Hunter
    .train 415423 >>使用|T133739:0|t[|cRXP_FRIENDLY_《毒蛇之心》论述|r]来训练|T132160:0|t[毒蛇之心] << Hunter
    .train 424718 >>使用|T134419:0|t[|cRXP_FRIENDLY_ 星之符文|r]来训练|T135730:0|t[星涌] << Druid
    .train 416044 >>使用|T134419:0|t[|cRXP_FRIENDLY_太阳符文|r]来训练|T236216:0|t[太阳之火] << Druid
    .train 439770 >>使用|T134419:0|t[|cRXP_FRIENDLY_坠星石符文|r]来训练|T236168:0|t[坠星石] << Druid
    .engrave 7 >>在你的裤子上刻上|T236174:0|t[致命一击] << Hunter
    .engrave 7 >>在你的裤子上刻上|T236317:0|t[狂暴突袭] << Warrior
    .engrave 7 >>在你的裤子上刻印[Starsurge] |T135730:0|t << Druid
step << Hunter
    #season 2
    #optional
    #sticky
    .aura 409583 >>记得激活你的 |T132185:0|t[雄狮之心]
step << Shaman
    #season 2
    #optional
    #label LavaBurst
    #sticky
    .train 410095 >>使用角色面板中的|T134920:0|t[|cRXP_FRIENDLY_Kajaric Icon|r]来学习|T237582:0|t[熔岩爆裂]
step << Druid
    #season 2
    #optional
    #sticky
    .train 410061 >>使用角色面板中的|T134903:0|t[|cRXP_FRIENDLY_Lunar Idol|r]来学习|T237472:0|t[风暴之怒的狂怒]
    .engrave 5 >>在你的胸膛上刻下 |T237472:0|t[风暴怒吼的狂怒]
step << Shaman
    #season 2
    #optional
    #requires LavaBurst
    #label Overload
    #sticky
    .equip 18,206381 >>装备 |T134918:0|t[|cRXP_FRIENDLY_Dyadic Icon|r]
    .train 410094 >>30秒后使用它训练 |T136050:0|t[超载]
    .use 206381
step
    .goto Mulgore,44.18,76.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .accept 752 >>接任务: |cRXP_LOOT_一件琐事|r
    .target Chief Hawkwind
step << Warrior/Shaman
    #season 0
    #completewith next
    .goto Mulgore,46.05,75.32,30,0
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r. 掠夺它们, 直到获得价值10铜的商人可售物品(包括你的装备)|r << Warrior/Shaman
    .mob Plainstrider
    .money >0.01
step
    #season 2
    .goto Mulgore,46.05,75.32
    .xp 2 >>|cRXP_WARN_击杀4只平原陆行鸟以达到2级. 击杀它们, 直到你获得价值10铜的商人物品|r << !Shaman !Druid
    .xp 2 >>|cRXP_WARN_击杀4只|cRXP_ENEMY_平原陆行鸟|r以达到2级. 掠夺它们, 直到你获得价值42铜币的商人物品|r << Shaman
    .xp 2 >>|cRXP_WARN_击杀4只平原陆行鸟以达到2级. 击败它们, 直到获得价值20铜币的商人可售物品|r << Druid
    .mob Plainstrider
step << Shaman/Druid
    #season 2
    .goto Mulgore,46.36,75.89,50,0
    #completewith next
    +|cRXP_WARN_继续击杀平原陆行鸟, 直到你获得价值42铜的商人物品|r << Shaman
    +|cRXP_WARN_持续击杀平原陆行鸟, 直到你获得价值20铜的商人物品|r << Druid
    .money >0.0042 << Shaman
    .money >0.002 << Druid
step << Druid
    #season 2
    .goto Mulgore,45.08,75.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .accept 77648 >>接任务: |cRXP_WARN_牛头人的圣物|r
    .turnin 77648 >>交任务: |cRXP_FRIENDLY_牛头人的圣物|r
    .target Gart Mistrunner
step << Warrior/Shaman
    #season 0
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kawnie|r交谈
    .vendor >>出售垃圾
    .target Kawnie Softbreeze
    .money >0.01
step << Warrior/Shaman
    #season 2
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kawnie|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>出售垃圾
    .target Kawnie Softbreeze
    .money >0.01
step << Warrior
    #season 0
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 6673 >>训练 |T132333:0|t[战斗怒吼]
    .target Harutt Thunderhorn
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 6673 >>训练 |T132333:0|t[战斗怒吼]
    .accept 77651 >>接受任务:踏入荆棘丛
    .turnin 77651 >>交给荆棘丛
    .target Harutt Thunderhorn
step << Shaman
    #season 0
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .train 8017 >>训练 |T136086:0|t[图腾打击武器]
    .target Meela Dawnstrider
step << Shaman
    #season 2
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .train 8017 >>训练 |T136086:0|t[图腾打击武器]
    .accept 77652 >>接任务: |cRXP_WARN_力量圣像|r
    .turnin 77652 >>交任务: |cRXP_FRIENDLY_力量圣像|r
    .target Meela Dawnstrider
step << Shaman/Druid
    #season 2
    .goto Mulgore,44.15,77.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Varia|r交谈
    >>|cRXP_BUY_出售垃圾|r|cRXP_WARN_请确保不要出售可以装备的物品|r << Druid
    >>|cRXP_BUY_购买一对|r|T132952:0|t[肮脏的皮手套]|cRXP_BUY_以刻上符文|r
    .collect 714,1 -- Dirty Leather Gloves
    .target Varia Hardhide
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .accept 77649 >>接任务: |cRXP_WARN_猎人的力量|r
    .turnin 77649 >>交任务: |cRXP_FRIENDLY_猎人的力量|r
    .target Lanka Farshot
step << Warrior/Shaman/Druid
    #season 2
    .equip 10 >>装备 |T132938:0|t[无光泽的链甲手套] << Warrior
    .equip 10 >>装备 |T132952:0|t[肮脏的皮手套] << Shaman/Druid
    .engrave 10 >>在你的手套上刻上[胜利冲刺]|T132342:0|t << Warrior
    .equip 5 >>装备 |T135010:0|t[破损的皮外衣] << Shaman
    .engrave 5 >>在你的胸前刻上|T136050:0|t[过载] << Shaman
    .engrave 10 >>在你的手套上刻印|T237582:0|t[熔岩爆发] << Shaman
    .engrave 10 >>在你的手套上刻上|T236216:0|t[太阳之火] << Druid
    .use 2127 << Shaman/Druid --Cracked Leather Vest
    .use 2385 << Warrior -- Tarnished Chain Gloves
    .use 714 << Shaman --Dirty Leather Gloves
step << Hunter
    #season 2
    .goto Mulgore,44.35,76.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_出售垃圾并购买以下所有符文:|r << Hunter
    .collect 210818,1 << Hunter --Rune of Lone Wolf
    .collect 213124,1 << Hunter --Rune of Close Combat
    .collect 226252,1 << Hunter --Rune of the Guerrilla
    >>|cRXP_WARN_稍后您将获得剩余的符文|r
    .target Rune Broker
    .skipgossip
step << Hunter
    #season 2
    .train 410122 >>使用|T134419:0|t[|cRXP_FRIENDLY_独狼符文|r]训练|T132266:0|t[独狼] << Hunter
    .train 416086 >>使用|T134419:0|t[|cRXP_FRIENDLY_近战符文|r]来训练|T132394:0|t[近战专家] << Hunter
    .train 440563 >>使用|T134419:0|t[|cRXP_FRIENDLY_游击符文|r]来训练|T132171:0|t[突袭与撤退] << Hunter
    .use 210818 << Hunter --Rune of Lone Wolf
    .use 213124 << Hunter --Rune of Close Combat
    .use 226252 << Hunter --Rune of the Guerrilla
step << Hunter
    .equip 10 >>装备 |T132952:0|t[破损的皮手套]
    .engrave 10 >>在你的手套上刻印|T236176:0|t[幻影射击]
    .use 2125 --Cracked Leather Gloves
step << Hunter
    #sticky
    #optional
    >>|cRXP_WARN_请注意任何|r胸甲/腰带/披风|cRXP_WARN_掉落|r|cRXP_WARN_. 装备它们并刻上相应的符文|r
    .engrave 5 >>在你的胸甲上刻上[独狼]
    .engrave 6 >>刻印 |T132394:0|t[近战专家] 在你的 |T132513:0|t[腰带] 上
    .engrave 15 >>在你的|T133771:0|t[斗篷]上刻上|T132171:0|t[突袭]
step << Druid
    #sticky
    #optional
    >>|cRXP_WARN_留意任何|r|cRXP_WARN_披风|r|cRXP_WARN_掉落, 装备并刻印|r|T236168:0|t[坠星]|cRXP_WARN_于其上|r
    .engrave 15 >>在你的斗篷上刻上坠星村
step
    #completewith next
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 掠夺其|cRXP_LOOT_肉|r和|cRXP_LOOT_羽毛|r
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
    .mob Plainstrider
step
    .goto Mulgore,50.03,81.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长的母亲|r交谈
    .turnin 752 >>交任务: |cRXP_FRIENDLY_一件琐事|r
    .accept 753 >>接任务: |cRXP_LOOT_一件琐事|r
    .target Greatmother Hawkwind
step
    .goto Mulgore,50.22,81.37
    >>在|hHawkwind|r身后井中的水罐上拾取物品
    .complete 753,1 --Water Pitcher (1)
step
    #loop
    .goto Mulgore,47.36,83.05,0
    .goto Mulgore,50.23,79.38,50,0
    .goto Mulgore,51.02,78.68,50,0
    .goto Mulgore,50.85,75.68,50,0
    .goto Mulgore,48.43,77.18,50,0
    .goto Mulgore,47.10,76.54,50,0
    .goto Mulgore,45.77,80.39,50,0
    .goto Mulgore,45.56,82.39,50,0
    .goto Mulgore,47.36,83.05,50,0
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 掠夺其|cRXP_LOOT_肉|r和|cRXP_LOOT_羽毛|r
    .complete 747,1 --Plainstrider Meat (7)
    .complete 747,2 --Plainstrider Feather (7)
    .mob Plainstrider
step
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 747,1 >>交任务: |cRXP_FRIENDLY_开始狩猎|r << Druid
    .turnin 747 >>交任务: |cRXP_FRIENDLY_开始狩猎|r << !Druid
    .accept 3091 >>接任务: |cRXP_LOOT_简易便笺|r << Warrior
    .accept 3092 >>接任务: |cRXP_LOOT_风化便笺|r << Hunter
    .accept 3093 >>接任务: |cRXP_LOOT_符文便笺|r << Shaman
    .accept 3094 >>接任务: |cRXP_LOOT_绿色便笺|r << Druid
    .accept 750 >>接任务: |cRXP_LOOT_继续狩猎|r
    .target Grull Hawkwind
step
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kawnie|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132384:0|t[轻弹丸]|r << Hunter
    .collect 2516,1000,750,1 << Hunter --Light Shot (1000)
    .vendor >>出售垃圾
    .target Kawnie Softbreeze
step
    .goto Mulgore,44.18,76.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鹰风酋长|r交谈
    .turnin 753 >>交任务: |cRXP_FRIENDLY_一件琐事|r
    .accept 755 >>接任务: |cRXP_LOOT_大地之母仪祭|r
    .target Chief Hawkwind
step << Shaman
    .goto Mulgore,44.07,77.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Marjak|r|cRXP_BUY_交谈. 从他那里购买|r|T135139:0|t[学徒法杖]|r
    .collect 2132,1,750,1 --Collect Short Staff (1)
    .money <0.0102
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
    .target Marjak Keenblade
step << Shaman
    #completewith RitesoftheEarthmother
    +装备 |T135139:0|t[学徒法杖]
    .use 2132
    .itemcount 2132,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
step
    #completewith next
    >>击杀|cRXP_ENEMY_山狮|r. 击杀后搜刮它们的|cRXP_LOOT_皮毛|r
    .complete 750,1 --Mountain Cougar Pelt (10)
    .mob Mountain Cougar
step
    #label RitesoftheEarthmother
    .goto Mulgore,42.58,92.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_灰舌先知|r交谈
    -->>|cRXP_WARN_路上刷怪提醒|r
    .turnin 755 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
    .accept 757 >>接任务: |cRXP_LOOT_力量仪祭|r
    .target Seer Graytongue
step
    #loop
    .goto Mulgore,44.60,90.86,0
    .goto Mulgore,43.21,89.26,50,0
    .goto Mulgore,44.64,91.58,50,0
    .goto Mulgore,45.82,90.52,50,0
    .goto Mulgore,46.35,91.45,50,0
    .goto Mulgore,48.05,91.83,50,0
    .goto Mulgore,49.25,90.69,50,0
    .goto Mulgore,50.98,90.37,50,0
    .goto Mulgore,49.10,89.50,50,0
    .goto Mulgore,47.06,88.64,50,0
    .goto Mulgore,45.06,89.89,50,0
    .goto Mulgore,44.60,90.86,50,0
    >>击杀|cRXP_ENEMY_山狮|r. 击杀后搜刮它们的|cRXP_LOOT_皮毛|r
    .complete 750,1 --Mountain Cougar Pelt (10)
    .mob Mountain Cougar
step
    #optional
    #loop
	.goto Mulgore,45.56,87.95,40,0
	.goto Mulgore,46.92,87.84,40,0
	.goto Mulgore,48.67,86.83,40,0
	.goto Mulgore,50.65,85.87,40,0
	.goto Mulgore,51.01,83.71,40,0
	.goto Mulgore,52.06,81.53,40,0
	.goto Mulgore,51.87,79.58,40,0
	.goto Mulgore,51.67,77.39,40,0
	.goto Mulgore,51.95,75.16,40,0
	.goto Mulgore,50.32,76.33,40,0
	.goto Mulgore,48.85,75.82,40,0
	.goto Mulgore,47.41,75.30,40,0
	.goto Mulgore,46.80,78.21,40,0
	.goto Mulgore,45.84,80.41,40,0
	.goto Mulgore,45.03,82.15,40,0
	.goto Mulgore,44.09,83.89,40,0
	.goto Mulgore,43.90,86.08,40,0
    .xp 3+850 >>升级至850/1400经验值
    .mob Plainstrider
step << Warrior/Druid
    #completewith GrullTurnin2
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r. 掠夺它们, 直到你获得价值2银的商人物品|r
    .mob Plainstrider
	.money >0.02
step << !Warrior !Druid
    #completewith next
    +|cRXP_WARN_击杀|cRXP_ENEMY_平原陆行鸟|r. 刷怪直到你获得价值1银的商人物品|r
    .mob Plainstrider
    .money >0.01
step
    #label GrullTurnin2
    .goto Mulgore,44.92,77.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 750 >>交任务: |cRXP_FRIENDLY_继续狩猎|r
    .accept 780 >>接任务: |cRXP_LOOT_斗猪|r
    .target Grull Hawkwind
step
    .goto Mulgore,45.30,76.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kawnie|r交谈
    .vendor >>出售垃圾
    .target Kawnie Softbreeze
step
    .goto Mulgore,44.67,76.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Brave|r交谈
    .accept 3376 >>接任务: |cRXP_LOOT_刺鬃酋长|r
    .target Brave Windfeather
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务: |cRXP_FRIENDLY_简易便笺|r
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Harutt Thunderhorn
    .money <0.02
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务: |cRXP_FRIENDLY_简易便笺|r
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Harutt Thunderhorn
step << Warrior
    #season 0
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务: |cRXP_FRIENDLY_简易便笺|r
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Harutt Thunderhorn
    .money <0.02
step << Warrior
    #season 0
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务: |cRXP_FRIENDLY_简易便笺|r
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Harutt Thunderhorn
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .turnin 3092 >>交任务: |cRXP_FRIENDLY_风化便笺|r
    .train 1978 >>训练 |T132204:0|t[蛇毒之刺]
    .target Lanka Farshot
step << Hunter
    #season 0
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .turnin 3092 >>交任务: |cRXP_FRIENDLY_风化便笺|r
    .train 1978 >>训练 |T132204:0|t[蛇毒之刺]
    .target Lanka Farshot
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .turnin 3094 >>交任务: |cRXP_FRIENDLY_绿色便笺|r
    .train 8921 >>训练 |T136096:0|t[月火术]
    .target Gart Mistrunner
step << Druid
    #season 0
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .turnin 3094 >>交任务: |cRXP_FRIENDLY_绿色便笺|r
    .train 8921 >>训练 |T136096:0|t[月火术]
    .target Gart Mistrunner
step << Shaman
    .goto Mulgore,44.73,76.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ravenfeather|r交谈
    .accept 1519 >>接任务: |cRXP_LOOT_大地的召唤|r
    .target Seer Ravenfeather
step << Shaman
    #season 2
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .turnin 3093 >>交任务: |cRXP_FRIENDLY_符文便笺|r
    .train 8042 >>训练 |T136026:0|t[地震术]
    .target Meela Dawnstrider
step << Shaman
    #season 0
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .turnin 3093 >>交任务: |cRXP_FRIENDLY_符文便笺|r
    .train 8042 >>训练 |T136026:0|t[地震术]
    .target Meela Dawnstrider
step
    #loop
    .goto Mulgore,55.99,85.46,0
    .goto Mulgore,52.70,79.32,50,0
    .goto Mulgore,54.19,79.83,50,0
    .goto Mulgore,55.73,80.28,50,0
    .goto Mulgore,56.48,81.67,50,0
    .goto Mulgore,55.63,83.86,50,0
    .goto Mulgore,56.03,85.53,50,0
    .goto Mulgore,55.80,87.71,50,0
    .goto Mulgore,56.72,89.27,50,0
    .goto Mulgore,57.92,89.27,50,0
    .goto Mulgore,57.69,86.77,50,0
    .goto Mulgore,57.31,85.39,50,0
    .goto Mulgore,55.99,85.46,50,0
    >>击杀 |cRXP_ENEMY_斗猪|r. 击败它们后拾取其 |cRXP_LOOT_獠牙|r 和 |cRXP_LOOT_猪鼻|r
    .complete 780,2 --Battleboar Flank (8)
    .complete 780,1 --Battleboar Snout (8)
    .mob Battleboar
step
    #completewith BristlebackBelts
    .goto Mulgore,59.67,83.33,30 >>穿越洞穴
step
    #completewith DirtyMap
    >>击杀|cRXP_ENEMY_刺背野猪人|r. 击败后搜刮其掉落的|cRXP_LOOT_腰带|r
    .complete 757,1 --Bristleback Belt (12)
    .mob Bristleback Quilboar
step << Shaman
    #completewith DirtyMap
    >>击杀|cRXP_ENEMY_刺背萨满祭司|r. 从他们身上搜刮|cRXP_LOOT_药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob Bristleback Shaman
step
    .goto Mulgore,60.54,81.04,35,0
    .goto Mulgore,62.35,81.27,35,0
    .goto Mulgore,62.49,78.78,35,0
    .goto Mulgore,64.71,77.67
    >>击杀大屋内的刺鬃酋长·荆棘皮. 搜刮他的头颅
    .complete 3376,1 --Chief Sharptusk Thornmantle's Head (1)
    .mob Chief Sharptusk Thornmantle
step
    #completewith next
    .goto Mulgore,63.24,82.70,40 >>进入洞穴
step
    #label DirtyMap
    .goto Mulgore,63.24,82.70
    >>拾取地面上的 |T134269:0|t[|cRXP_LOOT_沾满泥土的地图|r]. 使用它来开启任务
    .collect 4851,1,781 --Collect Dirt-Stained Map
    .accept 781 >>接任务: |cRXP_LOOT_纳拉其营地的危机|r
    .use 4851
step << Shaman
    #completewith next
    >>击杀|cRXP_ENEMY_刺背萨满祭司|r. 从他们身上搜刮|cRXP_LOOT_药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob Bristleback Shaman
step
    #label BristlebackBelts
    #loop
    .goto Mulgore,63.93,78.34,0
    .goto Mulgore,63.81,76.65,40,0
    .goto Mulgore,62.92,76.91,40,0
    .goto Mulgore,61.31,77.22,40,0
    .goto Mulgore,61.58,78.89,40,0
    .goto Mulgore,62.53,79.52,40,0
    .goto Mulgore,64.20,79.01,40,0
    .goto Mulgore,65.82,78.13,40,0
    .goto Mulgore,63.93,78.34,40,0
    >>击杀|cRXP_ENEMY_刺背野猪人|r. 击败后搜刮其掉落的|cRXP_LOOT_腰带|r
    .complete 757,1 --Bristleback Belt (12)
    .mob Bristleback Quilboar
step << Shaman
    #loop
    .goto Mulgore,63.86,80.14,0
    .goto Mulgore,63.74,81.18,40,0
    .goto Mulgore,63.86,79.97,40,0
    .goto Mulgore,65.00,78.60,40,0
    .goto Mulgore,66.05,77.83,40,0
    .goto Mulgore,65.93,77.10,40,0
    .goto Mulgore,63.57,76.25,40,0
    .goto Mulgore,63.86,80.14,40,0
    >>击杀|cRXP_ENEMY_刺背萨满祭司|r. 从他们身上搜刮|cRXP_LOOT_药膏|r
    .complete 1519,1 --Ritual Salve (2)
    .mob Bristleback Shaman
step
    #completewith next
    .hs >>传送至纳拉其营地
    .use 6948
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Grull|r和|cRXP_FRIENDLY_Brave|r和|cRXP_FRIENDLY_Hawkwind|r交谈 << !Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Grull|r和|cRXP_FRIENDLY_Brave|r和|cRXP_FRIENDLY_Seer|r和 |cRXP_FRIENDLY_Hawkwind|r交谈 << Shaman
    .turnin 780 >>交任务: |cRXP_FRIENDLY_斗猪|r
    .target +Grull Hawkwind
    .goto Mulgore,44.92,77.12
    .turnin 3376 >>交任务: |cRXP_FRIENDLY_刺鬃酋长|r
    .target +Brave Windfeather
    .goto Mulgore,44.67,76.68
    .turnin 1519 >>交任务: |cRXP_FRIENDLY_大地的召唤|r << Shaman
    .accept 1520 >>接任务: |cRXP_LOOT_大地的召唤|r << Shaman
    .target +Seer Ravenfeather << Shaman
    .goto Mulgore,44.73,76.18 << Shaman
    .turnin 781 >>交任务: |cRXP_FRIENDLY_纳拉其营地的危机|r
    .turnin 757 >>交任务: |cRXP_FRIENDLY_力量仪祭|r
    .accept 763 >>接任务: |cRXP_LOOT_大地之母仪祭|r
    .target +Chief Hawkwind
    .goto Mulgore,44.18,76.07
step << Shaman
    #completewith CallofEarth
    #label Rock
    .goto Mulgore,53.74,80.15,30 >>前往岩石方向
step << Shaman
    #completewith next
    #requires Rock
    .cast 8202 >>使用 |T134743:0|t[大地灵契]
    .use 6635
step << Shaman
    .goto Mulgore,53.74,80.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Manifestation|r交谈
    .turnin 1520 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
    .accept 1521 >>接任务: |cRXP_LOOT_大地的召唤|r
    .target Minor Manifestation of Earth
step << Shaman
    .goto Mulgore,44.73,76.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ravenfeather|r交谈
    .turnin 1521 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
    .target Seer Ravenfeather
step << Shaman
    #season 2
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .turnin 77652 >>交任务: |cRXP_FRIENDLY_力量圣像|r
    .train 332 >>训练 |T136052:0|t[治疗波]
    .target Shikrik
    .target Meela Dawnstrider
step << Shaman
    #season 0
    .goto Mulgore,45.01,75.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .train 332 >>训练 |T136052:0|t[治疗波]
    .target Shikrik
    .target Meela Dawnstrider
step << Hunter
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .train 1130 >>训练 |T132212:0|t[猎人印记]
    .target Lanka Farshot
    .money <0.02
step << Hunter
    #season 0
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .train 1130 >>训练 |T132212:0|t[猎人印记]
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target Lanka Farshot
    .money <0.02
step << Hunter
    #season 0
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target Lanka Farshot
step << Druid
    #season 2
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .train 467 >>训练 |T136104:0|t[荆棘]
    .train 5177 >>训练 |T136006:0|t[愤怒]
    .target Gart Mistrunner
    .money <0.02
step << Druid
    #season 0
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .train 467 >>训练 |T136104:0|t[荆棘]
    .train 5177 >>训练 |T136006:0|t[愤怒]
    .target Gart Mistrunner
    .money <0.02
step << Druid
    #season 0
    .goto Mulgore,45.09,75.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .train 5177 >>训练 |T136006:0|t[愤怒]
    .target Gart Mistrunner
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>训练 |T132269:0|t[招架]
    .train 6343 >>训练 |T136105:0|t[雷霆一击]
    .target Harutt Thunderhorn
    .money <0.02
step << Warrior
    #season 2
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>训练 |T132269:0|t[招架]
    .target Harutt Thunderhorn
step << Warrior
    #season 0
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>训练 |T132269:0|t[招架]
    .train 6343 >>训练 |T136105:0|t[雷霆一击]
    .target Harutt Thunderhorn
    .money <0.02
step << Warrior
    #season 0
    .goto Mulgore,44.02,76.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .train 3127 >>训练 |T132269:0|t[招架]
    .target Harutt Thunderhorn
step
    #season 2
    .goto Mulgore,44.35,76.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_从商人那里购买所有你需要的|T134419:0|t|cRXP_WARN_[符文]|r|r
    .target Rune Broker
    .skipgossip
step
    .goto Mulgore,38.51,81.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安图尔·荒野|r交谈
    .accept 1656 >>接任务: |cRXP_LOOT_未完的任务|r
    .target Antur Fallow
]])


RXPGuides.RegisterGuide([[
#classic
<< Horde
#xprate >1.99
#version 1
#group RestedXP 联盟 1-22
#name 7-13 莫高雷
#displayname 7-13 莫高雷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 13-20 贫瘠之地
#defaultfor Tauren


step << Druid
    #season 2
    .goto Mulgore,35.72,69.57
    >>|cRXP_WARN_对三块|r|cRXP_ENEMY_Lunar Stones|r|cRXP_WARN_施放|r|T136096:0|t[月火术]|cRXP_WARN_. 一颗宝箱将会出现在它们之间|r
    >>打开|cRXP_PICK_Lunar Chest|r获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Sun|r]
    .collect 206989,1 --Rune of the Sun (1)
    .mob Lunar Stone
    .train 416044,1
step << Druid
    #season 2
    .train 416044 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_太阳符文|r]|cRXP_WARN_来训练|r|T236216:0|t[太阳之火]
    .use 206989
    .itemcount 206989,1
step
	#completewith BloodhoofHome
	#softcore
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
	#hardcore
	#completewith BloodhoofHome
    .goto Mulgore,47.35,60.70,120 >>跑向血蹄村
step
    #softcore
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .accept 766 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target Maur Raincaller
step
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ruul|r和|cRXP_FRIENDLY_Baine|r交谈
    .accept 743 >>接任务: |cRXP_LOOT_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.36,62.01
    .turnin 763 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
    .accept 745 >>接任务: |cRXP_LOOT_土地之争|r
    .accept 767 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .accept 746 >>接任务: |cRXP_LOOT_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
step
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ruul|r和|cRXP_FRIENDLY_Baine|r交谈
    .accept 743 >>接任务: |cRXP_LOOT_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.36,62.01
    .turnin 763 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
    .accept 767 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .accept 746 >>接任务: |cRXP_LOOT_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
step
    #label BloodhoofHome
    .goto Mulgore,46.63,61.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    .turnin 1656 >>交任务: |cRXP_FRIENDLY_未完的任务|r
    .home >>将你的[炉石]设置为血蹄村
    .target Innkeeper Kauth
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买 |T135145:0|t[手杖] (5银4铜) 的钱. 如果暂时不够, 稍后再来处理
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T135145:0|t[手杖] |r
    .collect 2495,1,761,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T133053:0|t[木槌棒] (7s 1c) 的钱. 如果暂时不够, 以后再来
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,761,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯纳·鹰眼|r交谈
    .vendor >>出售垃圾, 如果钱够买一把 |T135611:0|t[精制短枪](4银14铜), 就直接购买. 如果钱不够, 稍后再来处理
    .target Kennah Hawkseye
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah|r|cRXP_BUY_交谈. 从他那里购买|r|T135611:0|t[精制短枪]|r
    .collect 2509,1,761,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah交谈|r
    >>|cRXP_BUY_从他那里购买|r|T132384:0|t[轻弹丸]|r << Hunter
    .collect 2516,1000,750,1 << Hunter --Light Shot (1000)
    .target Kennah Hawkseye
step << Shaman/Druid
    #completewith Well
    +装备 |T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #completewith Well
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #completewith Well
    +装备 |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r和|cRXP_FRIENDLY_Zarlman|r和|cRXP_FRIENDLY_Harken|r和|cRXP_FRIENDLY_Mull|r交谈
    .accept 766 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target +Maur Raincaller
    .goto Mulgore,46.97,57.07
    .turnin 767 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .accept 771 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .target +Zarlman Two-Moons
    .goto Mulgore,47.76,57.53
    .accept 761 >>接任务: |cRXP_LOOT_猎捕猛鹫|r
    .target +Harken Windtotem
    .goto Mulgore,48.71,59.32
    .accept 748 >>接任务: |cRXP_LOOT_毒水|r
    .target +Mull Thunderhorn
    .goto Mulgore,48.53,60.40
step << !Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r和|cRXP_FRIENDLY_Zarlman|r和|cRXP_FRIENDLY_Harken|r交谈
    .accept 766 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target +Maur Raincaller
    .goto Mulgore,46.97,57.07
    .turnin 767 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .accept 771 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .target +Zarlman Two-Moons
    .goto Mulgore,47.76,57.53
    .accept 761 >>接任务: |cRXP_LOOT_猎捕猛鹫|r
    .target +Harken Windtotem
    .goto Mulgore,48.71,59.32
step
    #sticky
    #completewith Well
    >>|cRXP_WARN_在该区域完成任务时, 收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Tauren
    #completewith Ambercorns
    >>击杀|cRXP_ENEMY_Prairie Wolves|r和|cRXP_ENEMY_成年平原陆行鸟|r. 击败它们后搜刮其|cRXP_LOOT_Paws|r和|cRXP_LOOT_Talons|r
    .complete 748,1 --Prairie Wolf Paw (6)
    .mob +Prairie Wolf
    .complete 748,2 --Plainstrider Talon (4)
    .mob +Adult Plainstrider
step << Hunter
    #season 2
    .goto Mulgore,59.02,54.36
    >>对|cRXP_ENEMY_Rustling Bush|r施放 |T132212:0|t[猎人印记]
    >>击杀生成的|r|cRXP_ENEMY_ 企业公司偷猎者|r, 从他身上搜刮|T134419:0|t[|cRXP_FRIENDLY_ 精准符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Venture Co. Poacher
    .train 410113,1
step << Hunter
    #season 2
    .train 410113 >>使用 |T134419:0|t[|cRXP_FRIENDLY_射击天赋符文|r]
    .use 206155
    .itemcount 206155,1
step
    #label Ambercorns
    #loop
    .goto Mulgore,50.36,66.49,0
    .goto Mulgore,48.71,64.44,15,0
    .goto Mulgore,50.36,66.49,15,0
    .goto Mulgore,51.92,63.85,15,0
    .goto Mulgore,51.13,71.06,15,0
    .goto Mulgore,50.36,66.49,15,0
    >>收集|cRXP_PICK_琥珀颗粒|r. 它们可以躲在树下的地面上
    .complete 771,2 --Ambercorn (2)
step
	#completewith next
	>>在莫高雷击杀各处的猛鹫. 掠夺它们掉落的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
step << Tauren
    #loop
	.goto Mulgore,50.82,66.66,0
	.goto Mulgore,50.82,66.66,50,0
	.goto Mulgore,51.06,63.63,50,0
	.goto Mulgore,52.79,62.06,50,0
	.goto Mulgore,53.98,61.68,50,0
	.goto Mulgore,55.67,62.77,50,0
	.goto Mulgore,56.46,64.93,50,0
	.goto Mulgore,56.02,67.78,50,0
	.goto Mulgore,55.02,69.65,50,0
	.goto Mulgore,52.33,70.07,50,0
	.goto Mulgore,50.40,70.24,50,0
	.goto Mulgore,48.60,69.43,50,0
	.goto Mulgore,45.98,69.70,50,0
	.goto Mulgore,48.58,67.37,50,0
    >>击杀|cRXP_ENEMY_Prairie Wolves|r和|cRXP_ENEMY_成年平原陆行鸟|r. 击败它们后搜刮其|cRXP_LOOT_Paws|r和|cRXP_LOOT_Talons|r
    .complete 748,1 --Prairie Wolf Paw (6)
    .mob +Prairie Wolf
    .complete 748,2 --Plainstrider Talon (4)
    .mob +Adult Plainstrider
step << Tauren
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 748 >>交任务: |cRXP_FRIENDLY_毒水|r
    .accept 754 >>接任务: |cRXP_LOOT_净化冰蹄之井|r
    .target Mull Thunderhorn
step << Tauren
    #completewith next
    >>收集井周围的|cRXP_PICK_水井石|r
    .complete 771,1 --Well Stone (2)
step << Tauren
    #label Well
    .goto Mulgore,53.68,66.28
    >>|cRXP_WARN_使用|r|T135139:0|t[冰蹄之井净化图腾] |cRXP_WARN_在井边|r
    .complete 754,1 --Cleanse the Winterhoof Water Well (1)
step
    #label Stones
    #loop
    .goto Mulgore,54.06,66.40,0
    .goto Mulgore,53.35,65.78,10,0
    .goto Mulgore,53.70,65.59,10,0
    .goto Mulgore,53.98,65.94,10,0
    .goto Mulgore,54.06,66.40,10,0
    >>收集井周围的|cRXP_PICK_水井石|r
    .complete 771,1 --Well Stone (2)
step
    #xprate <2.1
    #completewith Gnolls
    >>|cRXP_WARN_在该区域完成任务时, 收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Warrior
    #xprate <2.1
    #season 2
    #loop
    .goto Mulgore,53.5,73.0,0
    .goto Mulgore,48.3,72.0,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    >>在两个营地之间来回穿梭, 击杀白鬃制革工和白鬃剥皮工和白鬃偷猎者. 从他们身上搜刮断首兽人头颅
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_断矛|r|cRXP_WARN_(等级9稀有). 他太难对付了|r
    .complete 745,1 --Palemane Tanner (10)
    .mob +Palemane Tanner
    .complete 745,2 --Palemane Skinner (8)
    .mob +Palemane Skinner
    .complete 745,3 --Palemane Poacher (5)
    .mob +Palemane Poacher
    .collect 204478,1 --Severed Gnoll Head (1)
    .unitscan Snagglespear
    .train 403475,1
step
    #xprate <2.1
    #label Gnolls
    #loop
    .goto Mulgore,53.5,73.0,0
    .goto Mulgore,48.3,72.0,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    >>在两个营地之间来回穿梭, 击杀|r白鬃制革工|r和|r白鬃剥皮工|r和|r白鬃偷猎者|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_断矛|r|cRXP_WARN_(等级9稀有). 他太难对付了|r
    .complete 745,1 --Palemane Tanner (10)
    .mob +Palemane Tanner
    .complete 745,2 --Palemane Skinner (8)
    .mob +Palemane Skinner
    .complete 745,3 --Palemane Poacher (5)
    .mob +Palemane Poacher
    .unitscan Snagglespear
step
    .goto Mulgore,47.63,61.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jhwana|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Shaman/Druid
    >>|cRXP_BUY_从她那里购买|r|T133968:0|t[刚出炉的面包]|r << Warrior
    .vendor >>出售垃圾
    .collect 1179,10,746,1 << Shaman/Druid --Ice Cold Milk (10)
    .collect 4541,10,746,1 << Warrior --Freshly Baked Bread (10)
    .target Jhawna Oatwind
    .money <0.025
step << Tauren
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r和|cRXP_FRIENDLY_Baine|r交谈
    .turnin 754 >>交任务: |cRXP_FRIENDLY_净化冰蹄之井|r
    .accept 756 >>接任务: |cRXP_LOOT_雷角图腾|r
    .target +Mull Thunderhorn
    .goto Mulgore,48.53,60.40
    .turnin 745 >>交任务: |cRXP_FRIENDLY_土地之争|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
step << !Tauren
    #xprate <2.1
    .goto Mulgore,47.51,60.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r和|cRXP_FRIENDLY_Baine|r交谈
    .turnin 745 >>交任务: |cRXP_FRIENDLY_土地之争|r
    .target Baine Bloodhoof
step << Tauren
    #xprate >2.09
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 754 >>交任务: |cRXP_FRIENDLY_净化冰蹄之井|r
    .target Mull Thunderhorn
step << Warrior
    .goto Mulgore,46.80,60.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔拉·幼蹄|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .money <0.01
    .target Vira Younghoof
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买 |T135145:0|t[手杖] (5银4铜) 的钱. 如果暂时不够, 稍后再来处理
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T135145:0|t[手杖] |r
    .collect 2495,1,749,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T133053:0|t[木槌棒] (7s 1c) 的钱. 如果暂时不够, 以后再来
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,749,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯纳·鹰眼|r交谈
    .vendor >>出售垃圾, 如果钱够买一把 |T135611:0|t[精制短枪](4银14铜), 就直接购买. 如果钱不够, 稍后再来处理
    .target Kennah Hawkseye
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah|r|cRXP_BUY_交谈. 从他那里购买|r|T135611:0|t[精制短枪]|r
    .collect 2509,1,749,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Shaman/Druid
    #completewith Clawsx
    +装备 |T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #completewith Clawsx
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #completewith Clawsx
    +装备 |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step
    #label Vision
    .goto Mulgore,47.76,57.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zarlman|r交谈
    >>|cRXP_WARN_不要跟随出现的狼|r
    .turnin 771 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .accept 772 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .target Zarlman Two-Moons
step << Hunter
    #xprate <2.1
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 5116 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <8,1
step << Druid
    #xprate <2.1
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 5186 >>训练你的职业法术
    .target Gennia Runetotem
    .xp <8,1
step << Warrior
    #xprate <2.1
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 284 >>训练你的职业法术
    .target Krang Stonehoof
    .xp <8,1
step << Shaman
    #xprate <2.1
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .train 8044 >>训练你的职业法术
    .target Narm Skychaser
    .xp <8,1
step
    #xprate <2.1
    #loop
    .goto Mulgore,55.14,60.65,0
    .goto Mulgore,51.50,59.23,50,0
    .goto Mulgore,53.00,60.24,50,0
    .goto Mulgore,55.14,60.65,50,0
    .goto Mulgore,57.47,61.26,50,0
    .goto Mulgore,59.65,62.40,50,0
    .goto Mulgore,55.14,60.65,50,0
    .line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    >>|cRXP_WARN_他沿着东侧道路巡逻|r
    .accept 749 >>接任务: |cRXP_LOOT_不幸的商队|r
	.unitscan Morin Cloudstalker
step
    #xprate <2.1
    #completewith Clawsx
    >>|cRXP_WARN_在该区域完成任务时, 收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    #xprate <2.1
	#completewith Clawsx
	>>在莫高雷击杀各处的猛鹫. 掠夺它们掉落的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
step << Tauren
    #xprate <2.1
    #completewith next
    >>击杀 |cRXP_ENEMY_Stalkers|r 和 |cRXP_ENEMY_Cougars|r, 搜刮他们的 |cRXP_LOOT_Claws|r
    .complete 756,1 --Stalker Claws (6)
    .mob +Prairie Stalker
    .complete 756,2 --Cougar Claws (6)
    .mob +Flatland Cougar
step
    #xprate <2.1
    .goto Mulgore,53.74,48.17
    >>点击|cRXP_PICK_密封的补给箱|r
    .turnin 749 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 751 >>接任务: |cRXP_LOOT_不幸的商队|r
step << Tauren
    #xprate <2.1
	#label Clawsx
    #loop
    .goto Mulgore,58.1,48.6,0
    .goto Mulgore,58.1,48.6,60,0
    .goto Mulgore,54.5,40.1,60,0
    .goto Mulgore,46.4,50.7,60,0
    >>击杀 |cRXP_ENEMY_Stalkers|r 和 |cRXP_ENEMY_Cougars|r, 搜刮他们的 |cRXP_LOOT_Claws|r
    .complete 756,1 --Stalker Claws (6)
    .mob +Prairie Stalker
    .complete 756,2 --Cougar Claws (6)
    .mob +Flatland Cougar
step
    #xprate <2.1
    #softcore
	#completewith Thunderhorn
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #xprate <2.1
    #hardcore
    #completewith Thunderhorn
    .goto Mulgore,46.5,55.5,150 >>返回血蹄村
step << Hunter
    #xprate <2.1
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 5116 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <8,1
step
    #xprate <2.1
    #label Mazzturnin
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .turnin 766 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
    .target Maur Raincaller
    .isQuestComplete 766
step << Shaman/Druid
    #xprate <2.1
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买 |T135145:0|t[手杖] (5银4铜) 的钱. 如果暂时不够, 稍后再来处理
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman/Druid
    #xprate <2.1
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T135145:0|t[手杖] |r
    .collect 2495,1,743,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #xprate <2.1
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T133053:0|t[木槌棒] (7s 1c) 的钱. 如果暂时不够, 以后再来
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior
    #xprate <2.1
    .goto Mulgore,45.66,58.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 从他那里购买|r|T133053:0|t[木槌棒]|r
    .collect 2493,1,743,1 --Collect Wooden Mallet (1)
    .money <0.0701
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #xprate <2.1
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯纳·鹰眼|r交谈
    .vendor >>出售垃圾, 如果钱够买一把 |T135611:0|t[精制短枪](4银14铜), 就直接购买. 如果钱不够, 稍后再来处理
    .target Kennah Hawkseye
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    #xprate <2.1
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah|r|cRXP_BUY_交谈. 从他那里购买|r|T135611:0|t[精制短枪]|r
    .collect 2509,1,743,1 --Collect Ornate Blunderbuss (1)
    .money <0.0414
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step << Hunter
    #xprate <2.1
    .goto Mulgore,45.86,57.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Loorat交谈|r
    .collect 2516,1000,743,1 << Hunter --Light Shot (1000)
    .target Moorat Longstride
    .itemcount 2512,<800 << Hunter
step << Shaman/Druid
    #xprate <2.1
    #completewith ThunderhornCleanse
    +装备 |T135145:0|t[手杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Warrior
    #xprate <2.1
    #completewith ThunderhornCleanse
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #xprate <2.1
    #completewith ThunderhornCleanse
    +装备 |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.0
step
    #xprate <2.1
    #completewith Thunderhorn
    .goto Mulgore,45.90,58.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈兰特|r交谈
    .vendor >>出售垃圾并修理
    .target Harant Ironbrace
step
    #xprate <2.1
    .goto Mulgore,48.71,59.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target Harken Windtotem
    .isQuestComplete 761
step << Tauren
    #xprate <2.1
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 756 >>交任务: |cRXP_FRIENDLY_雷角图腾|r
    .accept 758 >>接任务: |cRXP_LOOT_净化雷角之井|r
    .target Mull Thunderhorn
step
    #optional
    #label Thunderhorn
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .train 8044 >>训练你的职业法术
    .target Narm Skychaser
    .xp <8,1
    .xp >10,1
step << Shaman
    #optional
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .accept 2984 >>接任务: |cRXP_LOOT_火焰的召唤|r
    .trainer >>训练你的职业法术
    .target Narm Skychaser
    .xp <10,1
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 5186 >>训练你的职业法术
    .target Gennia Runetotem
    .xp <8,1
    .xp >10,1
step << Druid
    #optional
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .trainer >>训练你的职业法术
    .accept 5928 >>接任务: |cRXP_LOOT_响应召唤|r
    .target Gennia Runetotem
    .isQuestAvailable 5928
    .xp <10,1
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 284 >>训练你的职业法术
    .target Krang Stonehoof
    .xp <8,1
    .xp >10,1
step << Warrior
    #optional
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .trainer >>训练你的职业法术
    .accept 1505 >>接任务: |cRXP_LOOT_老兵犹塞克|r
    .target Krang Stonehoof
    .xp <10,1
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 5116 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <8,1
    .xp >10,1
step << Hunter
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .accept 6061 >>接任务: |cRXP_LOOT_驯服野兽|r
    .trainer >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <10,1
step << Hunter
    #optional
    #loop
    .goto Mulgore,39.38,57.43,0
    .goto Mulgore,42.87,54.88,50,0
    .goto Mulgore,40.73,55.60,50,0
    .goto Mulgore,39.38,57.43,50,0
    .use 15914 >>|cRXP_WARN_使用你的|r |T132164:0|t[驯兽棒] |cRXP_WARN_ 对|r |cRXP_ENEMY_ 成年平原陆行鸟|r |cRXP_WARN_ 在最远距离|r
    .complete 6061,1 --Tame an Adult Plainstrider (1)
    .mob Adult Plainstrider
    .isOnQuest 6061
step << Hunter
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6061 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6087 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Yaw Sharpmane
    .isQuestComplete 6061
step << Hunter
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .accept 6087 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Yaw Sharpmane
    .isQuestTurnedIn 6061
step << Hunter
    #optional
    #loop
    .goto Mulgore,49.49,42.27,0
    .goto Mulgore,47.18,50.15,50,0
    .goto Mulgore,46.65,47.22,50,0
    .goto Mulgore,48.18,45.27,50,0
    .goto Mulgore,49.49,42.27,50,0
    .use 15915 >>|cRXP_WARN_使用你的|r|T132164:0|t[驯兽棒] |cRXP_WARN_对|r|cRXP_ENEMY_草原捕食者|r|cRXP_WARN_在最大距离处|r
    .complete 6087,1 --Tame a Prairie Stalker (1)
    .mob Prairie Stalker
    .isQuestTurnedIn 6061
step << Hunter
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6087 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6088 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Yaw Sharpmane
    .isQuestTurnedIn 6061
step << Hunter
    #optional
    #loop
    .goto Mulgore,47.25,41.33,0
    .goto Mulgore,47.25,41.33,80,0
    .goto Mulgore,45.41,40.29,80,0
    .goto Mulgore,51.57,44.40,80,0
    .use 15916 >>|cRXP_WARN_使用你的|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_猛鹫|r|cRXP_WARN_在最大范围内施放, 并在它们击倒你时立即重新施放|r
    >>|cRXP_WARN_如果失败且驯兽棒充能用尽, 请放弃任务后重新接取并返回|r
    .complete 6088,1 --Tame a Swoop (1)
    .mob Swoop
    .isQuestTurnedIn 6061
step << Hunter
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6088 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6089 >>接任务: |cRXP_LOOT_训练野兽|r
    .target Yaw Sharpmane
    .isQuestTurnedIn 6061
step
    .goto Mulgore,46.63,61.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|r << Shaman/Druid
    >>|cRXP_BUY_从他那里购买|r|T133968:0|t[刚出炉的面包]|r << Warrior
    .vendor >>出售垃圾 << !Hunter
    .collect 1179,10,746,1 << Shaman/Druid --Ice Cold Milk (10)
    .collect 4541,10,746,1 << Warrior --Freshly Baked Bread (10)
    .target Innkeeper Kauth
    .money <0.025
step
    #completewith Burial
    >>|cRXP_WARN_完成收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
	#completewith Burial
	>>在莫高雷击杀各处的猛鹫. 掠夺它们掉落的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
step << Tauren
    #xprate <2.1
    #label ThunderhornCleanse
    .goto Mulgore,44.49,45.36
    >>|cRXP_WARN_使用|r|T135139:0|t[雷角之井净化图腾] |cRXP_WARN_在井处|r
    .complete 758,1 --Cleanse the Thunderhorn Water Well (1)
step << Shaman
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_Bael'dun Diggers|r和|cRXP_ENEMY_Bael'dun Appraisers|r, 从他们身上搜刮出|cRXP_LOOT_Artifact Storage Key|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
    .train 425344,1
step
    .goto Mulgore,31.27,49.87
    >>击杀|cRXP_ENEMY_Bael'dun Diggers|r和|cRXP_ENEMY_Bael'dun Appraisers|r, 搜刮他们掉落的|cRXP_LOOT_Prospector's Picks|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_Bael'dun Appraisers|r会施放|r |T135929:0|t[治疗术] |cRXP_WARN_(远程施法:为自己或附近生命值低于50%的敌人恢复约75点生命值)|r
    .use 4702 >>击碎熔炉中的 |T134707:0|t[镐]
    .complete 746,1 --Broken Tools (5)
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
step << Shaman
    #season 2
    #loop
    .goto Mulgore,34.33,47.54,0
    .goto Mulgore,34.33,47.54,40,0
    .goto Mulgore,33.62,49.61,40,0
    .goto Mulgore,32.58,48.96,40,0
    .goto Mulgore,31.88,50.17,40,0
    .goto Mulgore,31.14,50.08,40,0
    .goto Mulgore,30.98,48.24,40,0
    .goto Mulgore,31.59,48.19,40,0
    .goto Mulgore,33.10,47.69,40,0
    >>击杀|cRXP_ENEMY_Bael'dun Diggers|r和|cRXP_ENEMY_Bael'dun Appraisers|r, 从他们身上搜刮出|cRXP_LOOT_Artifact Storage Key|r
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_Bael'dun Appraisers|r会施放|r |T135929:0|t[治疗术] |cRXP_WARN_(远程施法:为自己或附近生命值低于50%的敌人恢复约75点生命值)|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
    .train 425344,1
step << Shaman
    #season 2
    .goto Mulgore,31.56,49.54
    >>打开|cRXP_PICK_Artifact Storage|r宝箱, 获取 |T134918:0|t|cRXP_LOOT_[硫磺图标]|r
    .collect 206388,1 --Sulfurous Icon (1)
    .train 425344,1
step << Shaman
    #season 2
    .equip 18,206388 >>|cRXP_WARN_装备|r|T134918:0|t|cRXP_LOOT_[硫磺徽记]|r
    .use 206388
    .itemcount 206388,1 --Sulfurous Icon (1)
    .train 425344,1
step << Shaman
    #season 2
    #label MoltenBlast
    #completewith Burial
    .aura 408828 >>|cRXP_WARN_击杀至少被你使用|r|T136026:0|t[地震术]|cRXP_WARN_造成过伤害的敌人. 完成此操作10次即可获得|r|T136116:0|t[鼓舞]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意:你必须对能提供经验值的敌人执行此操作才能叠加层数|r
    .mob Bael'dun Digger
    .mob Bael'dun Appraiser
    .train 425344,1
step << Warrior
    #xprate <2.1
    #season 2
    #loop
	.goto Mulgore,31.74,40.31,0
	.goto Mulgore,34.08,43.71,50,0
	.goto Mulgore,32.98,42.96,50,0
	.goto Mulgore,31.72,43.08,50,0
	.goto Mulgore,31.08,42.09,50,0
	.goto Mulgore,31.12,40.87,50,0
	.goto Mulgore,31.74,40.31,50,0
	.goto Mulgore,32.44,41.17,50,0
	.goto Mulgore,33.57,41.30,50,0
	.goto Mulgore,33.82,40.26,50,0
	.goto Mulgore,34.48,41.21,50,0
	.goto Mulgore,34.50,42.29,50,0
    >>击杀|cRXP_ENEMY_Windfury 风怒女巫|r和|cRXP_ENEMY_Windfury 哈比鸟|r. 击杀后搜刮它们的|cRXP_LOOT_利爪|r和一个|cRXP_LOOT_被斩首的哈比鸟头颅|r
    .complete 743,1 --Windfury Talon (8)
    .collect 206995,1 ---Severed Harpy Head (1)
    .mob Windfury Wind Witch
    .mob Windfury Harpy
    .train 403475,1
step
    #loop
	.goto Mulgore,31.74,40.31,0
	.goto Mulgore,34.08,43.71,50,0
	.goto Mulgore,32.98,42.96,50,0
	.goto Mulgore,31.72,43.08,50,0
	.goto Mulgore,31.08,42.09,50,0
	.goto Mulgore,31.12,40.87,50,0
	.goto Mulgore,31.74,40.31,50,0
	.goto Mulgore,32.44,41.17,50,0
	.goto Mulgore,33.57,41.30,50,0
	.goto Mulgore,33.82,40.26,50,0
	.goto Mulgore,34.48,41.21,50,0
	.goto Mulgore,34.50,42.29,50,0
    >>击杀|cRXP_ENEMY_Windfury 风怒女巫|r和|cRXP_ENEMY_Windfury 哈比妖|r. 击败它们后搜刮其|cRXP_LOOT_利爪|r
    .complete 743,1 --Windfury Talon (8)
    .mob Windfury Wind Witch
    .mob Windfury Harpy
step
    #completewith next
    .goto Mulgore,33.37,36.52,50 >>进入风怒鹰身女妖北方的洞穴
step
    #xprate <2.1
	#label Burial
    .goto Mulgore,32.72,36.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wiserunner|r交谈
    .turnin 772 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .accept 773 >>接任务: |cRXP_LOOT_智慧仪祭|r
    .target Seer Wiserunner
step
    #xprate >2.09
	#label Burial
    .goto Mulgore,32.72,36.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wiserunner|r交谈
    .turnin 772 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .target Seer Wiserunner
step << Shaman
    #season 2
    #requires MoltenBlast
    .cast 402265 >>|cRXP_WARN_使用|r|T134918:0|t|cRXP_LOOT_[硫磺图腾]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套:熔岩冲击]
    .use 206388
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <3,1
step
    #completewith SacredBurial
    .destroy 4823 >>摧毁: |cRXP_ENEMY_先知之水|r, 它在你的背包中. 不再需要它了
step << Druid/Hunter/Shaman
    #completewith next
    .goto Thunder Bluff,32.00,66.69
    .zone Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .isOnQuest 6089 << Hunter
    .xp <10,1 << Druid
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .accept 76156 >>接任务: |cRXP_WARN_大地母亲与匿同在|r
    .target Boarton Shadetotem
    .train 410104,1
step << Druid
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将你的炉石设置为雷霆崖
    .target Innkeeper Pala
    .xp <10,1
step << Druid
    .goto Thunder Bluff,78.1,28.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈缪尔·符文图腾|r交谈
    .accept 886 >>接任务: |cRXP_LOOT_贫瘠之地的绿洲|r
    .target Arch Druid Hamuul Runetotem
    .xp <10,1
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .goto Thunder Bluff,76.7,27.3
    .turnin 5928 >>交任务: |cRXP_FRIENDLY_响应召唤|r
    .accept 5922 >>接任务: |cRXP_LOOT_月光林地|r
    .target Arch Druid Hamuul Runetotem
    .target Turak Runetotem
    .isOnQuest 5928
step << Druid
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .accept 5922 >>接任务: |cRXP_LOOT_月光林地|r
    .target Arch Druid Hamuul Runetotem
    .target Turak Runetotem
    .xp <10,1
step << Druid
    #completewith GreatBearS
    .cast 18960 >>施放 |T135758:0|t[传送:月光林地]
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dendrite|r交谈
    .turnin 5922 >>交任务: |cRXP_FRIENDLY_月光林地|r
    .accept 5930 >>接任务: |cRXP_LOOT_巨熊之灵|r
    .target Dendrite Starblaze
    .isOnQuest 5922
step << Druid
    #label GreatBearS
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dendrite|r交谈
    .accept 5930 >>接任务: |cRXP_LOOT_巨熊之灵|r
    .target Dendrite Starblaze
    .isQuestTurnedIn 5922
step << Druid
    .goto Moonglade,39.2,27.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨熊之灵|r交谈
    .complete 5930,1 --Seek out the Great Bear Spirit and learn what it has to share with you about the nature of the bear. (1)
    .target Great Bear Spirit
    .skipgossip
    .isQuestTurnedIn 5922
step << Druid
    #completewith next
    .cast 18960 >>施放 |T135758:0|t[传送:月光林地]
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dendrite|r交谈
    .turnin 5930 >>交任务: |cRXP_FRIENDLY_巨熊之灵|r
    .accept 5932 >>接任务: |cRXP_LOOT_返回雷霆崖|r
    .target Dendrite Starblaze
    .isQuestTurnedIn 5922
step << Druid
    #completewith DruidBearForm
    .hs >>炉石传送至雷霆崖
    .cooldown item,6948,>0
    .use 6948
    .zoneskip Thunder Bluff
    .isQuestTurnedIn 5922
step << Druid
    #completewith next
    .goto Moonglade,44.29,45.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑟恩·草风|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Bunthen Plainswind
    .cooldown item,6948,<0
step << Druid
    #label DruidBearForm
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .turnin 5932 >>交任务: |cRXP_FRIENDLY_返回雷霆崖|r
    .accept 6002 >>接任务: |cRXP_LOOT_身心之力|r
    .target Turak Runetotem
    .isQuestTurnedIn 5922
step << Hunter
	.goto Thunder Bluff,57.4,89.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍尔特|r交谈
	.turnin 6089 >>交任务: |cRXP_FRIENDLY_训练野兽|r
    .target Holt Thunderhorn
    .isOnQuest 6089
step << Hunter
    .goto Thunder Bluff,54.08,84.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
    .train 24547 >>训练你的宠物法术
    .target Hesuwa Thunderhorn
    .isQuestTurnedIn 6089
step << Hunter
    #completewith SacredBurial
    +|cRXP_WARN_将|r|T132162:0|t[训练野兽]|cRXP_WARN_拖到你的动作栏上. 为你的宠物传授技能|r
    .isQuestTurnedIn 6089
step << Druid/Hunter/Shaman
    #xprate <2.1
    .goto Thunder Bluff,53.81,27.82,30,0
    .goto Mulgore,59.85,25.62
    .zone Mulgore >>前往: |cRXP_PICK_莫高雷|r
    .zoneskip Thunder Bluff,1
    .isQuestTurnedIn 6089 << Hunter
    .isQuestTurnedIn 5932 << Druid
step << Hunter
    #xprate <2.1
    #completewith SacredBurial
    .cast 1515 >>驯服一只|cRXP_ENEMY_草原狼前锋|r
    >>|cRXP_WARN_这将允许你学习|r|T132140:0|t[利爪技能等级2]
    .mob Prairie Wolf Alpha
step
    #xprate <2.1
    #completewith SacredBurial
    >>|cRXP_WARN_完成收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    #xprate <2.1
    #completewith SacredBurial
    >>留意|cRXP_ENEMY_鬼嚎|r. 击败他后搜刮其掉落的 |T134358:0|t[|cRXP_LOOT_恶魔之伤|r]. 使用该物品开启任务
    >>|cRXP_WARN_请注意, |cRXP_ENEMY_鬼嚎|r因为等级为12而难度较高|r
    .collect 4854,1,770 --Collect Demon Scarred Cloak
    .accept 770 >>接任务: |cRXP_LOOT_恶魔之伤|r
    .use 4854
    .unitscan Ghost Howl
step
    #xprate <2.1
	#completewith next
	>>在莫高雷击杀各处的猛鹫. 掠夺它们掉落的羽毛
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
    .mob Taloned Swoop
step
    #xprate <2.1
    .goto Mulgore,59.85,25.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Raintotem|r交谈
    .accept 833 >>接任务: |cRXP_LOOT_神圣的墓地|r
    .target Lorekeeper Raintotem
step
    #optional
    #label SacredBurial
step << Warrior
    #xprate <2.1
    #season 2
    #completewith RiteofWisdom
    >>击杀 |cRXP_ENEMY_刺背干涉者|r. 击败他们后可获得 |cRXP_LOOT_断头兽人头颅|r
    .collect 206994,1 ---Severed Quilboar Head (1)
    .mob Bristleback Interloper
    .train 403475,1
step
    #xprate <2.1
    #completewith next
    >>击杀|cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper (8)
    .mob Bristleback Interloper
step
    #xprate <2.1
    #label RiteofWisdom
    .goto Mulgore,61.45,21.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先祖之魂|r交谈
    .turnin 773 >>交任务: |cRXP_FRIENDLY_智慧仪祭|r
    .accept 775 >>接任务: |cRXP_LOOT_雷霆崖之旅|r
    .target Ancestral Spirit
step << Warrior
    #xprate <2.1
    #season 2
    #loop
	.goto Mulgore,59.85,25.62,0
	.goto Mulgore,59.85,25.62,25,0
	.goto Mulgore,61.14,22.93,25,0
	.goto Mulgore,61.77,22.49,25,0
	.goto Mulgore,62.18,22.05,25,0
	.goto Mulgore,62.32,20.89,25,0
	.goto Mulgore,61.62,19.50,25,0
	.goto Mulgore,60.44,19.50,25,0
	.goto Mulgore,60.16,21.06,25,0
	.goto Mulgore,60.41,21.96,25,0
	.goto Mulgore,61.12,22.88,25,0
    >>击杀 |cRXP_ENEMY_刺背干涉者|r. 击败他们后可获得 |cRXP_LOOT_断头兽人头颅|r
    .complete 833,1 --Bristleback Interloper (8)
    .collect 206994,1 ---Severed Quilboar Head (1)
    .mob Bristleback Interloper
    .train 403475,1
step
    #xprate <2.1
    #loop
	.goto Mulgore,59.85,25.62,0
	.goto Mulgore,59.85,25.62,25,0
	.goto Mulgore,61.14,22.93,25,0
	.goto Mulgore,61.77,22.49,25,0
	.goto Mulgore,62.18,22.05,25,0
	.goto Mulgore,62.32,20.89,25,0
	.goto Mulgore,61.62,19.50,25,0
	.goto Mulgore,60.44,19.50,25,0
	.goto Mulgore,60.16,21.06,25,0
	.goto Mulgore,60.41,21.96,25,0
	.goto Mulgore,61.12,22.88,25,0
    >>击杀|cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper (8)
    .mob Bristleback Interloper
step
    #xprate <2.1
    .goto Mulgore,59.85,25.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Raintotem|r交谈
    .turnin 833 >>交任务: |cRXP_FRIENDLY_神圣的墓地|r
    .target Lorekeeper Raintotem
step
    #xprate <2.1
    #completewith next
    >>|cRXP_WARN_完成收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step
    #xprate <2.1
    #loop
	.goto Mulgore,51.00,18.40,0
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
	>>击杀|cRXP_ENEMY_猛鹫|r. 掠夺其|cRXP_LOOT_羽毛|r`
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Wiry Swoop
    .mob Swoop
    .mob Taloned Swoop
step
    #xprate <2.1
    #loop
	.goto Mulgore,50.79,29.37,0
	.goto Mulgore,59.52,23.36,60,0
	.goto Mulgore,57.51,19.08,60,0
	.goto Mulgore,55.21,18.67,60,0
	.goto Mulgore,52.99,17.34,60,0
	.goto Mulgore,51.00,18.40,60,0
	.goto Mulgore,49.84,20.74,60,0
	.goto Mulgore,49.82,23.69,60,0
	.goto Mulgore,49.52,26.10,60,0
	.goto Mulgore,49.72,28.14,60,0
	.goto Mulgore,50.79,29.37,60,0
	.goto Mulgore,52.24,30.07,60,0
	.goto Mulgore,54.21,30.43,60,0
	.goto Mulgore,56.15,30.35,60,0
	.goto Mulgore,57.77,30.48,60,0
	.goto Mulgore,58.79,28.52,60,0
	.goto Mulgore,60.56,25.88,60,0
	.goto Mulgore,59.52,23.36,60,0
    >>|cRXP_WARN_完成收集马兹拉纳其所需的物品|r
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << skip --Cannon removed from game
    #season 2
    #softcore
    #completewith Bloodhoofturnins1
    .goto Thunder Bluff,41.17,67.66
    +点击|cRXP_PICK_Ultra Cannon|r将自己炸回血蹄村
    >>|cRXP_WARN_抵达后将会死亡, 但可立即复活|r
    >>|cRXP_WARN_ 当剩余时间还有2秒时, 移除你的|r|T135992:0|t[魔法之翼]|cRXP_WARN_ 增益效果, 尝试降落在河中以避免死亡
    .zoneskip Thunder Bluff,1
step
    #completewith Bloodhoofturnins1
    .zone Mulgore >>离开雷霆崖
    .zoneskip Thunder Bluff,1
step
    #softcore
    #completewith Bloodhoofturnins1
    .goto Mulgore,48.22,38.85
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    >>|cRXP_WARN_确保你在路标箭头处或更靠南的位置死亡|r
    .zoneskip Thunder Bluff
step
    #hardcore
    #completewith Bloodhoofturnins1
    .goto Mulgore,47.33,57.17,120 >>返回血蹄村
step
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .turnin 766 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
    .target Maur Raincaller
    .isQuestComplete 766
step
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯克恩|r交谈
    .turnin 770 >>交任务: |cRXP_FRIENDLY_恶魔之伤|r
    .target Skorn Whitecloud
    .isOnQuest 770
step << Warrior
    #xprate <2.1
    #season 2
    .goto Mulgore,46.29,61.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与血蹄村的|cRXP_FRIENDLY_Vateya|r交谈
    >>上交你收集到的|cRXP_LOOT_Heads|r, 换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target Vateya Timberhoof
    .train 403475,1
step << Warrior
    #xprate <2.1
    #season 2
    .use 204688 >>使用 |T134455:0|t[符文碎片] 制作 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step << Warrior
    #xprate <2.1
    #season 2
    .train 403475 >>使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .use 204703
    .itemcount 204703,1
step << Tauren
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r和|cRXP_FRIENDLY_Ruul|r和|cRXP_FRIENDLY_Mull|r和|cRXP_FRIENDLY_Harken|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.35,62.02
    .turnin 758 >>交任务: |cRXP_FRIENDLY_净化雷角之井|r
    --.accept 759 >>接任务: |cRXP_LOOT_蛮鬃图腾|r
    .target +Mull Thunderhorn
    .goto Mulgore,48.54,60.38
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target +Harken Windtotem
    .goto Mulgore,48.71,59.32
    .isQuestComplete 761
step << !Tauren
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r和|cRXP_FRIENDLY_Ruul|r和|cRXP_FRIENDLY_Harken|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.35,62.02
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target +Harken Windtotem
    .goto Mulgore,48.71,59.32
    .isQuestComplete 761
step << Tauren
    #xprate <2.1
    #label Bloodhoofturnins1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r和|cRXP_FRIENDLY_Ruul|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.35,62.02
    .turnin 758 >>交任务: |cRXP_FRIENDLY_净化雷角之井|r
    --.accept 759 >>接任务: |cRXP_LOOT_蛮鬃图腾|r
    .target +Mull Thunderhorn
    .goto Mulgore,48.54,60.38
step << !Tauren
    #xprate <2.1
    #label Bloodhoofturnins1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r和|cRXP_FRIENDLY_Ruul|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.35,62.02
step
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r和|cRXP_FRIENDLY_Ruul|r和|cRXP_FRIENDLY_Harken|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.35,62.02
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target +Harken Windtotem
    .goto Mulgore,48.71,59.32
    .isQuestComplete 761
step
    #xprate >2.09
    #label Bloodhoofturnins1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r和|cRXP_FRIENDLY_Ruul|r交谈
    .turnin 746 >>交任务: |cRXP_FRIENDLY_矮人的挖掘场|r
    .target +Baine Bloodhoof
    .goto Mulgore,47.51,60.16
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target +Ruul Eagletalon
    .goto Mulgore,47.35,62.02
step
    #completewith AlphaTeeth
    .destroy 4702 >>摧毁: |cRXP_ENEMY_勘察员的锄头|r, 它在你的背包中. 不再需要它了
step << Hunter
    .goto Mulgore,45.50,58.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah交谈|r
    >>|cRXP_BUY_从他那里购买|r|T132384:0|t[重弹丸]|r << Hunter
    .collect 2519,1000,6061,1 << Hunter --Heavy Shot (1000)
    .target Kennah Hawkseye
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 2687 >>训练你的职业法术
    .accept 1505 >>接任务: |cRXP_LOOT_老兵犹塞克|r
    .target Krang Stonehoof
step << Warrior
    #optional
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 7384 >>训练你的职业法术
    .target Krang Stonehoof
    .xp <12,1
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .train 8050 >>训练你的职业法术
    .accept 2984 >>接任务: |cRXP_LOOT_火焰的召唤|r
    .target Narm Skychaser
step << Shaman
    #optional
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .train 547 >>训练你的职业法术
    .target Narm Skychaser
    .xp <12,1
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .accept 6061 >>接任务: |cRXP_LOOT_驯服野兽|r
    .train 13165 >>训练你的职业法术
    .target Yaw Sharpmane
    .isQuestAvailable 6061
step << Hunter
    #optional
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 14281 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <12,1
step << Druid
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 8924 >>训练你的职业法术
    .accept 5928 >>接任务: |cRXP_LOOT_响应召唤|r
    .target Gennia Runetotem
    .isQuestAvailable 5928
step << Druid
    #optional
    .goto Mulgore,48.48,59.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 8936 >>训练你的职业法术
    .target Gennia Runetotem
    .xp <12,1
step << Hunter
    #loop
    .goto Mulgore,39.38,57.43,0
    .goto Mulgore,42.87,54.88,50,0
    .goto Mulgore,40.73,55.60,50,0
    .goto Mulgore,39.38,57.43,50,0
    .use 15914 >>|cRXP_WARN_使用你的|r |T132164:0|t[驯兽棒] |cRXP_WARN_ 对|r |cRXP_ENEMY_ 成年平原陆行鸟|r |cRXP_WARN_ 在最远距离|r
    .complete 6061,1 --Tame an Adult Plainstrider (1)
    .mob Adult Plainstrider
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6061 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6087 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Yaw Sharpmane
step << Hunter
    #loop
    .goto Mulgore,49.49,42.27,0
    .goto Mulgore,47.18,50.15,50,0
    .goto Mulgore,46.65,47.22,50,0
    .goto Mulgore,48.18,45.27,50,0
    .goto Mulgore,49.49,42.27,50,0
    .use 15915 >>|cRXP_WARN_使用你的|r|T132164:0|t[驯兽棒] |cRXP_WARN_对|r|cRXP_ENEMY_草原捕食者|r|cRXP_WARN_在最大距离处|r
    .complete 6087,1 --Tame a Prairie Stalker (1)
    .mob Prairie Stalker
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6087 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6088 >>接任务: |cRXP_LOOT_驯服野兽|r
    .target Yaw Sharpmane
step << Hunter
    #loop
    .goto Mulgore,47.25,41.33,0
    .goto Mulgore,47.25,41.33,80,0
    .goto Mulgore,45.41,40.29,80,0
    .goto Mulgore,51.57,44.40,80,0
    .use 15916 >>|cRXP_WARN_使用你的|r|T132164:0|t[驯兽棒]|cRXP_WARN_对|r|cRXP_ENEMY_猛鹫|r|cRXP_WARN_在最大范围内施放, 并在它们击倒你时立即重新施放|r
    >>|cRXP_WARN_如果失败且驯兽棒充能用尽, 请放弃任务后重新接取并返回|r
    .complete 6088,1 --Tame a Swoop (1)
    .mob Swoop
step << Hunter
    .goto Mulgore,47.81,55.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .turnin 6088 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
    .accept 6089 >>接任务: |cRXP_LOOT_训练野兽|r
    .target Yaw Sharpmane
step
    .goto Mulgore,47.63,61.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jhwana|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Shaman/Druid
    >>|cRXP_BUY_从她那里购买|r|T133968:0|t[刚出炉的面包]|r << Warrior
    .collect 1179,20,818,1 << Shaman/Druid --Ice Cold Milk (20)
    .collect 4541,20,818,1 << Warrior --Freshly Baked Bread (20)
    .target Innkeeper Grosk
    .money <0.05
    .target Jhawna Oatwind
step << skip
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯克恩|r交谈
    .accept 861 >>接任务: |cRXP_LOOT_猎人之道|r
    .target Skorn Whitecloud
step
    #xprate >2.09
    #loop
    .goto Mulgore,55.14,60.65,0
    .goto Mulgore,51.50,59.23,50,0
    .goto Mulgore,53.00,60.24,50,0
    .goto Mulgore,55.14,60.65,50,0
    .goto Mulgore,57.47,61.26,50,0
    .goto Mulgore,59.65,62.40,50,0
    .goto Mulgore,55.14,60.65,50,0
    .line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    >>|cRXP_WARN_他沿着东侧道路巡逻|r
    .accept 749 >>接任务: |cRXP_LOOT_不幸的商队|r
	.unitscan Morin Cloudstalker
step << Hunter
    #xprate >2.09
    #loop
    .goto Mulgore,67.19,63.78,0
    .goto Mulgore,67.19,63.78,50,0
    .goto Mulgore,66.34,67.01,50,0
    .goto Mulgore,63.86,66.31,50,0
    .goto Mulgore,61.81,65.52,50,0
    .goto Mulgore,61.61,61.32,50,0
    .goto Mulgore,63.58,60.51,50,0
    .goto Mulgore,65.56,59.37,50,0
    .goto Mulgore,67.62,59.06,50,0
    .goto Mulgore,66.34,67.01,50,0
    .cast 1515 >>驯服一只|cRXP_ENEMY_草原狼前锋|r
    >>|cRXP_WARN_这将允许你学习|r|T132140:0|t[利爪技能等级2]
    .mob Prairie Wolf Alpha
step
    #xprate >2.09
    .goto Mulgore,53.74,48.17
    >>点击|cRXP_PICK_密封的补给箱|r
    .turnin 749 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 751 >>接任务: |cRXP_LOOT_不幸的商队|r
step
    #loop
    .goto Mulgore,55.14,60.65,0
    .goto Mulgore,51.50,59.23,50,0
    .goto Mulgore,53.00,60.24,50,0
    .goto Mulgore,55.14,60.65,50,0
    .goto Mulgore,57.47,61.26,50,0
    .goto Mulgore,59.65,62.40,50,0
    .goto Mulgore,55.14,60.65,50,0
    .line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    >>|cRXP_WARN_他沿着东侧道路巡逻|r
    .turnin 751 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 764 >>接任务: |cRXP_WARN_风险投资公司|r
    .accept 765 >>接任务: |cRXP_LOOT_菲兹普罗克主管|r
	.unitscan Morin Cloudstalker
step
    #season 2
    #completewith Fizsprocket1
    .goto Mulgore,61.51,47.29,20 >>Travel to 接任务: |cRXP_WARN_风险投资公司|r. Mine
step << Shaman
    #season 2
    #completewith VentureCoKills
    >>打开矿洞内和另一侧外面的|cRXP_PICK_爆破补给|r, 拾取它们以获得|cRXP_LOOT_海火采矿炸药|r
    >>|cRXP_WARN_如果可能的话, 尽量待在洞穴的上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
step
    #completewith next
    >>杀死|cRXP_ENEMY_风险投资公司工人|r 和|cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob Venture Co. Worker
    .mob Venture Co. Supervisor
step
    #label Fizsprocket1
    .goto Mulgore,64.95,43.33
    >>Run into the mine and hug the right/east side. Kill |cRXP_ENEMY_Supervisor Fizsprocket|r. Loot him for his |cRXP_LOOT_Clipboard|r
    .complete 765,1 --Fizsprocket's Clipboard (1)
    .mob Supervisor Fizsprocket
step
    #label VentureCoKills
    #loop
	.goto Mulgore,61.35,47.55,0
	.goto Mulgore,61.35,47.55,25,0
	.goto Mulgore,60.10,47.84,25,0
	.goto Mulgore,59.50,48.21,25,0
	.goto Mulgore,59.68,48.85,25,0
	.goto Mulgore,60.14,49.14,25,0
	.goto Mulgore,62.01,48.74,25,0
	.goto Mulgore,61.89,47.84,25,0
    >>杀死|cRXP_ENEMY_风险投资公司工人|r 和|cRXP_ENEMY_风险投资公司主官|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +Venture Co. Worker
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +Venture Co. Supervisor
step << Shaman
    #season 2
    #loop
    .goto Mulgore,63.77,43.97,15,0
    .goto Mulgore,62.81,42.81,15,0
    .goto Mulgore,60.38,42.78,15,0
    .goto Mulgore,61.64,41.33,15,0
    .goto Mulgore,63.51,39.29,15,0
    .goto Mulgore,63.39,40.80,15,0
--  .goto Mulgore,66.53,39.47,15,0 --Very deep inside the top of the mine, skipping
    .goto Mulgore,60.99,37.00,15,0
    .goto Mulgore,59.64,36.05,15,0 --Outside
    .goto Mulgore,61.72,35.15,15,0 --Outside
    >>打开矿洞内和另一侧外面的|cRXP_PICK_爆破补给|r, 拾取它们以获得|cRXP_LOOT_海火采矿炸药|r
    >>|cRXP_WARN_如果可能的话, 尽量待在洞穴的上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
step
    #loop
    .goto Mulgore,55.14,60.65,0
    .goto Mulgore,51.50,59.23,50,0
    .goto Mulgore,53.00,60.24,50,0
    .goto Mulgore,55.14,60.65,50,0
    .goto Mulgore,57.47,61.26,50,0
    .goto Mulgore,59.65,62.40,50,0
    .goto Mulgore,55.14,60.65,50,0
    .line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    >>|cRXP_WARN_他沿着东侧道路巡逻|r
    .turnin 764 >>交任务: |cRXP_FRIENDLY_风险投资公司|r
    .turnin 765 >>交任务: |cRXP_FRIENDLY_菲兹普罗克主管|r
	.unitscan Morin Cloudstalker
step << Druid
    #season 2
    #loop
    .goto Mulgore,66.34,67.01,0
    .goto Mulgore,67.19,63.78,50,0
    .goto Mulgore,66.34,67.01,50,0
    .goto Mulgore,63.86,66.31,50,0
    .goto Mulgore,61.81,65.52,50,0
    .goto Mulgore,61.61,61.32,50,0
    .goto Mulgore,63.58,60.51,50,0
    .goto Mulgore,65.56,59.37,50,0
    .goto Mulgore,67.62,59.06,50,0
    >>击杀|cRXP_ENEMY_平原徘徊者|r 和|cRXP_ENEMY_草原狼前锋|r . 击败它们后可获得 |T134903:0|t[|cRXP_FRIENDLY_熊之怒狂石|r ]
    .collect 206954,1 --Idol of Ursine Rage (1)
    .mob Flatland Prowler
    .mob Prairie Wolf Alpha
    .train 410025,1
step << Druid
    #season 2
    .equip 18,206954 >>|cRXP_WARN_装备|r|T134903:0|t[|cRXP_FRIENDLY_熊怒之偶像|r]
    .use 206954
    .train 410025,1
    .itemcount 206954,1
step << Druid
    #season 2
    #completewith next
    +|cRXP_WARN_保持50+怒气至少60秒方可学习|r|T132135:0|t[撕裂]
step << Druid
    #season 2
    .train 410025 >>|cRXP_WARN_使用|r|T134903:0|t[|cRXP_FRIENDLY_熊之怒图腾|r]|cRXP_WARN_来训练|r|T132135:0|t[撕裂]
    .use 206954
    .itemcount 206954,1
step << skip
    #label AlphaTeeth
    .goto Mulgore,67.19,63.78,50,0
    .goto Mulgore,66.34,67.01,50,0
    .goto Mulgore,63.86,66.31,50,0
    .goto Mulgore,61.81,65.52,50,0
    .goto Mulgore,61.61,61.32,50,0
    .goto Mulgore,63.58,60.51,50,0
    .goto Mulgore,65.56,59.37,50,0
    .goto Mulgore,67.62,59.06,50,0
    .goto Mulgore,66.34,67.01
    >>击杀该区域的|cRXP_ENEMY_草原狼前锋|r, 掠夺他们的|cRXP_LOOT_牙齿|r
    .complete 759,1 --Prairie Alpha Tooth (8)
    .mob Prairie Wolf Alpha
step << skip
    #softcore
	#completewith Thunderhorn2
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step << skip
    #hardcore
    #completewith Thunderhorn2
    .goto Mulgore,46.5,55.5,150 >>返回血蹄村
step << skip
    #label Thunderhorn2
    .goto Mulgore,48.53,60.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 759 >>交任务: |cRXP_FRIENDLY_蛮鬃图腾|r
    .accept 760 >>接任务: |cRXP_LOOT_净化蛮鬃之井|r
    .target Mull Thunderhorn
step
    .goto Mulgore,69.6,60.4,100,0
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step << Druid
    .goto The Barrens,44.45,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
    .fp Camp Taurajo >>获取陶拉日营地的飞行路径
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Omusa Thunderhorn
    .isQuestAvailable 5922
step << Druid
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将你的炉石设置为雷霆崖
    .target Innkeeper Pala
    .isQuestAvailable 5922
step << Druid
    .goto Thunder Bluff,78.1,28.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈缪尔·符文图腾|r交谈
    .accept 886 >>接任务: |cRXP_LOOT_贫瘠之地的绿洲|r
    .target Arch Druid Hamuul Runetotem
    .isQuestAvailable 5922
step << Druid
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .goto Thunder Bluff,76.7,27.3
    .turnin 5928 >>交任务: |cRXP_FRIENDLY_响应召唤|r
    .accept 5922 >>接任务: |cRXP_LOOT_月光林地|r
    .target Arch Druid Hamuul Runetotem
    .target Turak Runetotem
    .isOnQuest 5928
step << Druid
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .accept 5922 >>接任务: |cRXP_LOOT_月光林地|r
    .target Arch Druid Hamuul Runetotem
    .target Turak Runetotem
step << Druid
    #completewith next
    .cast 18960 >>施放 |T135758:0|t[传送:月光林地]
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dendrite|r交谈
    .turnin 5922 >>交任务: |cRXP_FRIENDLY_月光林地|r
    .accept 5930 >>接任务: |cRXP_LOOT_巨熊之灵|r
    .target Dendrite Starblaze
step << Druid
    .goto Moonglade,39.2,27.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨熊之灵|r交谈
    .complete 5930,1 --Seek out the Great Bear Spirit and learn what it has to share with you about the nature of the bear. (1)
    .target Great Bear Spirit
    .skipgossip
step << Druid
    #completewith next
    .cast 18960 >>施放 |T135758:0|t[传送:月光林地]
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dendrite|r交谈
    .turnin 5930 >>交任务: |cRXP_FRIENDLY_巨熊之灵|r
    .accept 5932 >>接任务: |cRXP_LOOT_返回雷霆崖|r
    .target Dendrite Starblaze
step << Druid
    #completewith DruidBearForm
    .hs >>炉石传送至雷霆崖
    .cooldown item,6948,>0
    .use 6948
step << Druid
    #completewith next
    .goto Moonglade,44.29,45.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑟恩·草风|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Bunthen Plainswind
    .cooldown item,6948,<0
step << Druid
    #label DruidBearForm
    .goto Thunder Bluff,76.7,27.3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .turnin 5932 >>交任务: |cRXP_FRIENDLY_返回雷霆崖|r
    .accept 6002 >>接任务: |cRXP_LOOT_身心之力|r
    .target Turak Runetotem
step << Druid
    #completewith next
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .fly Camp Taurajo >>飞往陶拉霍营地
    .target Tal
    .zoneskip Thunder Bluff,1
step << Druid
    .goto The Barrens,42.00,60.86
    .use 15710 >>跑到月夜枭兽之石处并使用 |T132857:0|t[赛纳里奥银尘]. 击杀|cRXP_ENEMY_月爪枭兽|r
    >>|cRXP_WARN_避开该区域的|r|cRXP_ENEMY_电角蜥蜴|r|r
    .complete 6002,1 --Face Lunaclaw and earn the strength of body and heart it possesses. (1)
    .use 15710
    .mob Lunaclaw
step
    .goto The Barrens,44.45,59.15
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
    .fp Camp Taurajo >>获取陶拉日营地的飞行路径
	.target Omusa Thunderhorn
step << Tauren
    .goto The Barrens,44.9,58.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基尔格·锐角|r交谈
    .accept 854 >>接任务: |cRXP_LOOT_十字路口之旅|r
    .target Kirge Sternhorn
step
    #completewith next
    .goto The Barrens,52.07,31.96,120 >>前往北方的十字路口
step
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tonga|r交谈
    .turnin 886 >>交任务: |cRXP_FRIENDLY_贫瘠之地的绿洲|r << Druid
    .accept 870 >>接任务: |cRXP_LOOT_遗忘之池|r
    .target Tonga Runetotem
step
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板博兰德|r交谈
    .home >>将你的炉石设置为十字路口
    .target Innkeeper Boorand Plainswind
step << Tauren
    .goto The Barrens,51.5,30.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .turnin 854 >>交任务: |cRXP_FRIENDLY_十字路口之旅|r
    .target Thork
step
    .goto The Barrens,51.1,29.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加翰·鹰翼|r交谈
    .accept 6361 >>接任务: |cRXP_LOOT_一捆兽皮|r
    .target Jahan Hawkwing
step
    #xprate <2.1
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    .accept 848 >>接任务: |cRXP_LOOT_菌类孢子|r
    .accept 1492 >>接任务: |cRXP_LOOT_码头管理员迪兹维格|r
    .target Apothecary Helbrim
step
    #xprate <2.1
    #completewith next
    >>在遗忘之池周围收集|cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_采集蘑菇时, 请与|cRXP_ENEMY_Kolkar|r|cRXP_WARN_保持最大距离. 它们的等级为12-14级|r
    >>|cRXP_WARN_此任务的后续奖励为强大的|cRXP_FRIENDLY_大锅 蛰刺|r|cRXP_WARN_. 若您暂不打算使用该物品, 可暂时跳过此任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #xprate <2.1
    .goto The Barrens,45.06,22.54
    >>潜入水下至|cRXP_PICK_Bubble Fissure|r
    .complete 870,1 --Explore the waters of the Forgotten Pools
step
    #xprate <2.1
    #loop
    .goto The Barrens,45.2,23.3,0
    .goto The Barrens,45.2,23.3,40,0
    .goto The Barrens,45.2,22.0,40,0
    .goto The Barrens,44.6,22.5,40,0
    .goto The Barrens,43.9,24.4,40,0
    >>在遗忘之池周围收集|cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_与该区域内的|cRXP_ENEMY_Kolkar|r|cRXP_WARN_保持最大距离. 它们等级为12-14级|r
    >>|cRXP_WARN_此任务的后续奖励为强大的|cRXP_FRIENDLY_大锅 蛰刺|r|cRXP_WARN_. 若您暂不打算使用该物品, 可暂时跳过此任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #xprate <2.1
    #softcore
	#completewith ZamahPickup
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #xprate <2.1
    #hardcore
    #completewith ZamahPickup
    .subzone 380 >>返回十字路口
step
    #xprate <2.1
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tonga|r交谈
    .turnin 870 >>交任务: |cRXP_FRIENDLY_遗忘之池|r
    .accept 877 >>接任务: |cRXP_LOOT_死水绿洲|r
    .target Tonga Runetotem
    .isQuestComplete 870
step
    #xprate <2.1
    #optional
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tonga|r交谈
    .turnin 870 >>交任务: |cRXP_FRIENDLY_遗忘之池|r
    .accept 877 >>接任务: |cRXP_LOOT_死水绿洲|r
    .target Tonga Runetotem
    .isQuestTurnedIn 877
step
    #xprate <2.1
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    >>|cRXP_WARN_等待RP结束|r
    >>|cRXP_WARN_这将开启一个45分钟的限时任务|r
    .turnin 848 >>交任务: |cRXP_FRIENDLY_菌类孢子|r
    .accept 853 >>接任务: |cRXP_LOOT_药剂师扎玛|r
    .target Apothecary Helbrim
    .isQuestComplete 848
step
    #xprate <2.1
    #optional
    #label ZamahPickup
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    >>|cRXP_WARN_这将开启一个45分钟的限时任务|r
    .accept 853 >>接任务: |cRXP_LOOT_药剂师扎玛|r
    .target Apothecary Helbrim
    .isQuestTurnedIn 848
step
    #xprate <2.1
    #sticky
    #completewith CauldronStirrer
    +|cRXP_WARN_你正在进行限时任务, 请不要离开. 任务将在领取后约5-10分钟内自动提交|r
    .isOnQuest 853
step
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .turnin 6361 >>交任务: |cRXP_FRIENDLY_一捆兽皮|r
    .accept 6362 >>接任务: |cRXP_LOOT_飞往雷霆崖|r
    .target Devrak
step
    #completewith CauldronStirrer
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Devrak
step
    .goto Thunder Bluff,45.6,55.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安哈努|r 交谈
    .turnin 6362 >>交任务: |cRXP_FRIENDLY_飞往雷霆崖|r
    .accept 6363 >>接任务: |cRXP_LOOT_双足飞龙管理员塔尔|r
    .target Ahanu
step
    .goto Thunder Bluff,61.3,80.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melor|r交谈
    .turnin 861 >>交任务: |cRXP_FRIENDLY_猎人之道|r
    .accept 860 >>接任务: |cRXP_LOOT_瑟格拉·黑棘|r
    .target Melor Stonehoof
    .isQuestComplete 861
step
    .goto Thunder Bluff,61.3,80.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Melor|r交谈
    .accept 860 >>接任务: |cRXP_LOOT_瑟格拉·黑棘|r
    .target Melor Stonehoof
    .isQuestTurnedIn 861
step << Hunter
	.goto Thunder Bluff,57.4,89.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍尔特|r交谈
	.turnin 6089 >>交任务: |cRXP_FRIENDLY_训练野兽|r
    .target Holt Thunderhorn
step << Hunter
    #optional
	.goto Thunder Bluff,57.4,89.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍尔特|r交谈
    .train 14281 >>训练你的职业法术
    .target Holt Thunderhorn
    .xp <12,1
step << Hunter
    .goto Thunder Bluff,54.08,84.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
    >>|cRXP_WARN_将|r|T132162:0|t[训练野兽]|cRXP_WARN_拖到你的动作栏上. 为你的宠物传授技能|r
    .train 24547 >>训练你的宠物法术
    .target Hesuwa Thunderhorn
step << Warrior
    #optional
    .goto Thunder Bluff,57.59,85.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ker|r交谈
    .train 7384 >>训练你的职业法术
    .target Ker Ragetotem
    .xp <12,1
step << Druid
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 199 >>训练双手锤
    .target Ansekhwas
    .money <0.1154
step << Warrior/Hunter
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 227 >>训练法杖
    .target Ansekhwa
step << Shaman
    #season 2
    .goto Thunder Bluff,37.8,59.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .accept 744 >>接任务: |cRXP_LOOT_准备典礼|r
    .target Eyahn Eagletalon
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .turnin 76156 >>交任务: |cRXP_FRIENDLY_大地母亲与匿同在|r
    .accept 76160 >>接任务: |cRXP_WARN_大地母亲与匿同在|r
    .target Boarton Shadetotem
    .train 410104,1
step
    #xprate <2.1
    #completewith next
    .goto Thunder Bluff,28.14,32.97,40,0
    .goto Thunder Bluff,28.51,28.95,10 >>前往灵魂高地, 进入幻视之池
step
    #xprate <2.1
    #label CauldronStirrer
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >>交任务: |cRXP_FRIENDLY_药剂师扎玛|r
    .target Apothecary Zamah
    .isOnQuest 853
step
    #xprate <2.1
    #completewith ReturntoJahan
    +装备 |T135145:0|t[锅炉搅拌器]
    .use 5340
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
    .itemcount 5340,1
step << Shaman
    #optional
    .goto Thunder Bluff,23.64,18.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
    .train 547 >>训练你的职业法术
    .target Tigor Skychaser
    .xp <12,1
step << Warrior
    #season 2
    #completewith next
    .goto Thunder Bluff,28.73,18.00,-1
    .goto Thunder Bluff,26.19,18.65,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与灵魂高地上的|cRXP_FRIENDLY_Netali|r和|cRXP_FRIENDLY_Mooart|r交谈
    +击杀变为敌对的 |cRXP_FRIENDLY_Mooart|r
    .target Netali Proudwind
    .target Mooart
    .skipgossip
    --Gossipoption
step << Warrior
    #season 2
    .goto Thunder Bluff,28.73,18.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奈塔莉|r交谈
    >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target Netali
    .train 425447,1
    .skipgossip
step << Warrior
    #season 2
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .use 204716
    .itemcount 204716,1
step
    #label ReturntoJahan
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .turnin 6363 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员塔尔|r
    .accept 6364 >>接任务: |cRXP_LOOT_向加翰回复|r
    .target Tal
step
    #xprate <2.1
    .goto Thunder Bluff,60.0,51.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯恩·血蹄|r交谈
    .turnin 775 >>交任务: |cRXP_FRIENDLY_雷霆崖之旅|r
    --.accept 776 >>接任务: |cRXP_LOOT_大地之母仪祭|r
    .target Cairne Bloodhoof
step << Druid
    .goto Thunder Bluff,76.477,27.221
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .turnin 6002 >>交任务: |cRXP_FRIENDLY_身心之力|r
    .target Turak Runetotem
step << Druid
    #optional
    .goto Thunder Bluff,76.477,27.221
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .train 8936 >>训练你的职业法术
    .target Turak Runetotem
    .xp <12,1
step
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉哈罗|r交谈
    .accept 5722 >>接任务: |cRXP_WARN_寻找背包|r
    .accept 5723 >>接任务: |cRXP_WARN_试探敌人|r
    .target Rahauro
    .dungeon RFC
step
    #ah
    .goto Thunder Bluff,44.43,43.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫兰塔|r交谈
    >>|cRXP_WARN_这将解锁一个简单的任务. 如果你已经有两个专业技能, 请跳过此步骤|r
    .train 8613 >>训练 |T134366:0|t[剥皮]
    .target Mooranta
step
    #optional
    #ah
    .goto Thunder Bluff,44.39,44.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔伦·陆行者|r交谈
    .accept 768 >>接任务: |cRXP_WARN_收集皮革|r
    .target Veren Tallstrider
    .skill skinning,<1,1
step
    #optional
    #ah
    .goto Thunder Bluff,40.39,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师斯塔比交谈|cRXP_FRIENDLY_Auctioneer Stampi|r
    >>|cRXP_BUY_从拍卖行购买十二|r|T134252:0|t[轻皮革]|r
    .collect 2318,12,768,1 --Light Leather (12)
    .target Auctioneer Stampi
    .skill skinning,<1,1
step
    #optional
    #ah
    .goto Thunder Bluff,44.39,44.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔伦·陆行者|r交谈
    .turnin 768 >>交任务: |cRXP_FRIENDLY_收集皮革|r
    .target Veren Tallstrider
    .skill skinning,<1,1
step << Hunter
    .goto Thunder Bluff,52.32,47.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加|r交谈
    >>|cRXP_BUY_从她那里购买|r|T133972:0|t[硬肉干]|cRXP_BUY_来喂养你的宠物|r
    .collect 117,5,744,1 --Tough Jerky (5)
    .target Kaga Mistrunner
step << Shaman
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_风怒女巫|r. 从她们身上搜刮|cRXP_LOOT_碧蓝色羽毛|r
    >>击杀风怒女族长. 从她们身上搜刮古铜色的羽毛
    .complete 744,1 --Azure Feather (6)
    .mob +Windfury Sorceress
    .complete 744,2 --Bronze Feather (6)
    .mob +Windfury Matriarch
    .train 410104,1
step << Shaman
    #season 2
    #loop
    .goto Mulgore,37.18,12.36,0
    .goto Mulgore,38.80,16.03,10,0
    .goto Mulgore,37.79,10.86,10,0
    .goto Mulgore,38.01,10.21,10,0
    .goto Mulgore,38.55,8.10,10,0
    .goto Mulgore,38.06,7.47,10,0
    .goto Mulgore,37.36,9.99,10,0
    .goto Mulgore,37.31,10.41,10,0
    .goto Mulgore,35.80,11.21,10,0
    .goto Mulgore,36.20,11.41,10,0
    .goto Mulgore,36.21,12.60,10,0
    .goto Mulgore,36.55,12.84,10,0
    .goto Mulgore,36.65,13.26,10,0
    .goto Mulgore,37.18,12.36,10,0
    >>拾取地面上的风怒锥体|cRXP_LOOT_Windfury Cones|r
    .collect 206170,8,76160,1 --Windfury Cone (8)
    .train 410104,1
step << Shaman
    #season 2
    #loop
    .goto Mulgore,31.7,28.2,0
    .goto Mulgore,30.2,19.5,0
    .goto Mulgore,31.7,28.2,40,0
    .goto Mulgore,30.2,19.5,40,0
    >>击杀|cRXP_ENEMY_风怒女巫|r. 从她们身上搜刮|cRXP_LOOT_碧蓝色羽毛|r
    >>击杀风怒女族长. 从她们身上搜刮古铜色的羽毛
    .complete 744,1 --Azure Feather (6)
    .mob +Windfury Sorceress
    .complete 744,2 --Bronze Feather (6)
    .mob +Windfury Matriarch
step << Shaman
    #season 2
    #completewith next
    .subzone 1638 >>返回雷霆崖
    .zoneskip Thunder Bluff
step << Shaman
    #season 2
    .goto Thunder Bluff,37.8,59.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .turnin 744 >>交任务: |cRXP_FRIENDLY_准备典礼|r
    .target Eyahn Eagletalon
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .turnin 76160 >>交任务: |cRXP_FRIENDLY_大地母亲与匿同在|r
    .accept 76240 >>接任务: |cRXP_WARN_大地母亲与匿同在|r
    .target Boarton Shadetotem
    .train 410104,1
step << Shaman
    #season 2
    #ah
    .goto Thunder Bluff,45.23,59.40,0
    .goto Thunder Bluff,40.41,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师斯塔比交谈|cRXP_FRIENDLY_Auctioneer Stampi|r
    >>|cRXP_BUY_从拍卖行购买|r|T133894:0|t[新鲜的美味小鱼] |r
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .target Auctioneer Stampi
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #completewith Sewa
    .goto Thunder Bluff,46.13,51.59,12,0
    .goto Thunder Bluff,47.09,50.07,4,0
    .goto Thunder Bluff,46.49,49.16,4,0
    .goto Thunder Bluff,46.05,49.74,4,0
    .goto Thunder Bluff,46.34,50.50,4,0
    .goto Thunder Bluff,55.78,47.02,15 >>前往|cRXP_FRIENDLY_苏瓦·迷雾行者|r
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #sticky
    #label Kah
    .goto Thunder Bluff,56.13,46.39,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔·迷雾行者|r交谈
    .train 7734 >>训练 |T136245:0|t[钓鱼]
    .target Kah Mistrunner
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #label Sewa
    .goto Thunder Bluff,55.78,47.02,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏瓦·迷雾行者|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132932:0|t[钓鱼竿]|cRXP_BUY_和|r|T134335:0|t[闪光的小珠]|r
    .collect 6256,1 --Fishing Pole (1)
    .collect 6529,1 --Shiny Bauble (1)
    .target Sewa Mistrunner
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #completewith Fish
    #requires Kah
    #label Pole
    .equip 16,6256 >>|cRXP_WARN_装备|r|T132932:0|t[钓鱼竿]
    .use 6256
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #completewith Fish
    #requires Pole
    .aura 8087 >>|cRXP_WARN_将|r|T134335:0|t[闪光的小珠] |cRXP_WARN_附着到你的|r|T132932:0|t[钓鱼竿]
    .use 6529
    .train 410104,1
step << Shaman
    #season 2
    #ssf
    #label Fish
    #requires Kah
    .goto Thunder Bluff,40.42,58.55
    >>在池塘里钓鱼, 直到钓到 |T133894:0|t[|cRXP_LOOT_新鲜的美味小鱼|r]
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .train 410104,1
step << Shaman
    #season 2
    >>使用 |T132147:0|t[刀具套装] 制作 |T134007:0|t[鱼肉碎块]
    .complete 76240,1 --Fish Chunks (1)
    .use 206344
    .train 410104,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博顿·暗图腾|r交谈
    >>|cRXP_WARN_他|r|T132320:0|t[潜行中]
    .turnin 76240 >>交任务: |cRXP_FRIENDLY_大地母亲与匿同在|r
-- .train 410104 >>|cRXP_WARN_你将训练|r|T236289:0|t[熔岩鞭笞]|cRXP_WARN_和|r|T132147:0|t[双持]|cRXP_WARN_在提交时|r
    .target Boarton Shadetotem
    .train 410104,1
step
    #completewith HidesTurnIn
    .hs >>传送至十字路口
    .cooldown item,6948,>0
    .use 6948
step
    #completewith next
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .fly Crossroads >>飞往十字路口
    .target Tal
    .zoneskip The Barrens
    .cooldown item,6948,<0
step
    #label HidesTurnIn
    .goto The Barrens,51.1,29.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加翰·鹰翼|r交谈
    .turnin 6364 >>交任务: |cRXP_FRIENDLY_向加翰回复|r
    .target Jahan Hawkwing
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    .accept 1492 >>接任务: |cRXP_LOOT_码头管理员迪兹维格|r
    .target Apothecary Helbrim
step
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .accept 871 >>接任务: |cRXP_LOOT_野猪人的袭击|r
    .accept 5041 >>接任务: |cRXP_LOOT_十字路口的补给品|r
    .target Thork
step
    #xprate <2.1
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索克|r交谈
    >>|cRXP_WARN_他在塔顶|r
    .accept 867 >>接任务: |cRXP_LOOT_鹰身强盗|r
    .target Darsok Swiftdagger
step
    #optional
    .goto The Barrens,52.23,31.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 860 >>交任务: |cRXP_FRIENDLY_瑟格拉·黑棘|r
    .accept 844 >>接任务: |cRXP_LOOT_平原陆行鸟的威胁|r
    .target Sergra Darkthorn
    .isOnQuest 860
step
    .goto The Barrens,52.23,31.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .accept 844 >>接任务: |cRXP_LOOT_平原陆行鸟的威胁|r
    .target Sergra Darkthorn
step
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r交谈
    .accept 869 >>接任务: |cRXP_LOOT_偷钱的迅猛龙|r
    .target Gazrog
step << Tauren Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_阿瑟罗克|r|cRXP_BUY_交谈. 从他那里购买|r|T135613:0|t[猎人的火枪] |r
    .collect 2511,1,871,1 --Collect Hunter's Boomstick (1)
    .money <0.1324
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
    .target Uthrok
step << Tauren Hunter
    #completewith DisruptTheAttacks
    +装备 |T135613:0|t[猎人的爆破枪]
    .use 2511
    .itemcount 2511,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Shaman
    #completewith next
    >>检查|r旁边的老陈的空酒桶. 拾取它并开始任务, 否则稍后会自动获得该任务
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
step << Shaman
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳尔|r交谈
    .turnin 2984 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
    .accept 1524 >>接任务: |cRXP_LOOT_火焰的召唤|r
    .target Kranal Fiss
step << Shaman
    #completewith next
    .goto Durotar,36.74,57.78,10,0
    .goto Durotar,36.63,58.15,8,0
    .goto Durotar,36.63,58.15,8,0
    .goto Durotar,36.77,58.98,8,0
    .goto Durotar,36.85,58.32,8,0
    .goto Durotar,37.24,58.13,8,0
    .goto Durotar,37.86,58.18,8,0
    .goto Durotar,38.05,57.79,8,0
    .goto Durotar,38.93,57.54,8,0
    .goto Durotar,39.19,57.90,8,0
    .goto Durotar,39.16,58.56,10 >>沿着山路向上前行, 前往|cRXP_FRIENDLY_Telf|r
    >>|cRXP_WARN_小心别从山上掉下去, 路非常狭窄. 一旦坠落, 可能会死亡|r
step << Shaman
    #label CallofFire2
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰尔夫|r交谈
    .turnin 1524 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
    .accept 1525 >>接任务: |cRXP_LOOT_火焰的召唤|r
    .target Telf Joolam
step << Shaman
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林|r交谈
    .accept 840 >>接任务: |cRXP_LOOT_部落的新兵|r
    .target Takrin Pathseeker
step << Shaman
    #completewith next
    .goto Durotar,54.31,39.44,30,0
    .goto Durotar,52.8,28.7,20 >>进入尘风洞窟
step << Shaman
    #loop
    .goto Durotar,53.18,29.15,0
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    .goto Durotar,51.90,25.70,12,0
    >>击杀|cRXP_ENEMY_Cultists|r. 击杀后可从其身上搜刮出|cRXP_LOOT_试剂袋|r
    .complete 1525,2 --Reagent Pouch (1)
    .mob Burning Blade Cultist
step << Shaman
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kargal|r交谈
    .turnin 840 >>交任务: |cRXP_FRIENDLY_部落的新兵|r
    .accept 842 >>接任务: |cRXP_LOOT_十字路口征兵|r
    .target Kargal Battlescar
step << Warrior
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1505 >>交任务: |cRXP_FRIENDLY_老兵犹塞克|r
    .accept 1498 >>接任务: |cRXP_LOOT_防御之道|r
    .target Uzzek
step << Warrior
    #loop
    .goto Durotar,39.34,28.25,0
    .goto Durotar,39.11,30.76,40,0
    .goto Durotar,39.34,28.25,40,0
    .goto Durotar,39.11,26.46,40,0
    .goto Durotar,39.39,25.05,40,0
    .goto Durotar,40.00,24.06,40,0
    .goto Durotar,42.51,24.29,40,0
    .goto Durotar,39.34,28.25,40,0
    >>击杀闪电蜥蜴. 掠夺其身上的鳞片
    .complete 1498,1 --Singed Scale (5)
    .mob Lightning Hide
step << Warrior
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1498 >>交任务: |cRXP_FRIENDLY_防御之道|r
    .accept 1502 >>接任务: |cRXP_LOOT_索恩格瑞姆·火眼|r
    .target Uzzek
step
    #optional
    .abandon 761 >>放弃猎捕猛鹫
step
    #optional
    .abandon 766 >>放弃马兹拉纳其
]])
