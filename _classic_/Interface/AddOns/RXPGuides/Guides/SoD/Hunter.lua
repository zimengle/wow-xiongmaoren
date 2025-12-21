RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 奇美拉射击 - 2(丹莫洛)
#displayname Chimera Shot


step
    +|cRXP_WARN_你至少需要达到2级, 才能单独获得|r|T133816:0|t[雕纹手套 - 奇美拉射击] |cRXP_WARN_在丹莫罗|r
    .train 410121,1
    .xp >2,1
step
    #completewith Rune
    #label Dun1
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
    .train 410121,1
step
    #optional
    #requires Dun1
    #label FrostMCave1
    #completewith Rune
    .goto 1426,27.098,80.707,20 >>进入霜鬃洞穴
    .train 410121,1
step
    #optional
    #requires FrostMCave1
    #completewith Rune
    .goto 1426,28.298,79.836,15,0
    .goto 1426,29.252,79.043,15,0
    .goto 1426,30.489,80.165,50 >>前往位于里面的|cRXP_PICK_Frostmane 掉落物宝箱|r
    .train 410121,1
step
    #label Rune
    .goto Dun Morogh,30.773,80.063
    >>打开地面内的 |cRXP_PICK_Frostmane Loot Cache|r, 从中获取 |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r
    .collect 206168,1 -- Rune of the Chimera (1)
    .train 410121,1
step
    .train 410121 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[奇美拉符文]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 奇美拉射击]
    .use 206168
    .itemcount 206168,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 奇美拉射击 - 3(泰达希尔)
#displayname Chimera Shot

step
    +|cRXP_WARN_你至少需要达到 3 级, 才能单独在泰达希尔获得|r|T133816:0|t[雕文手套 - 奇美拉射击]|r
    .train 410121,1
    .xp >3,1
step
    #completewith Rune
    #label Teld1
    .zone Teldrassil >>前往: |cRXP_PICK_泰达希尔|r
    .train 410121,1
step
    #optional
    #requires Teld1
    #label ShadowCave1
    #completewith Rune
    .goto 1438,56.694,31.485
    .subzone 25 >>进入暗影丝洞窟
    .train 410121,1
step
    #optional
    #requires ShadowCave1
    #completewith Rune
    .goto 1438,56.137,24.971,15,0
    .goto 1438,55.785,25.341,15,0
    .goto 1438,56.137,24.971,15,0
    .goto 1438,56.358,25.242,20,0
    .goto 1438,56.654,26.430,50,0
    .goto 1438,56.874,26.323,10 >>前往邪恶的基塞伊斯内部
    .train 410121,1
step
    #label Rune
    .goto Teldrassil,56.68,26.12
    >>击杀邪恶的基塞伊斯. 击败她后可掉落 |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r
    .collect 206168,1 -- Rune of the Chimera (1)
    .mob Githyiss the Vile
    .train 410121,1
step
    .train 410121 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[奇美拉符文]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 奇美拉射击]
    .use 206168
    .itemcount 206168,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 爆炸射击 - 5(丹莫洛)
#displayname Explosive Shot

step
    +|cRXP_WARN_你至少需要达到5级, 才能在丹莫罗独自获得|r|T133816:0|t[雕纹手套 - 爆炸射击] |r
    .train 410123,1
    .xp >5,1
step
    #completewith Rune
    .zone Dun Morogh >>前往: |cRXP_PICK_丹莫罗|r
    .train 410123,1
step
    #loop
    .goto 1426,31.87,38.45,0
    .goto 1426,30.42,39.84,0
    .goto 1426,30.02,39.08,0
    .goto 1426,33.82,37.26,0
    .goto 1426,31.87,38.45,50,0
    .goto 1426,30.42,39.84,50,0
    .goto 1426,30.02,39.08,50,0
    .goto 1426,33.82,37.26,50,0
    >>击杀|cRXP_ENEMY_Fyodi|r. 击败他后搜刮出 |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r
    >>|cRXP_WARN_尽管|cRXP_ENEMY_Fyodi|r显示为精英怪, 但其生命值和伤害和护甲数值仍与普通怪物一致|r
    >>|cRXP_WARN_注意, 当他施放时|r|T132337:0|t[冲锋]|cRXP_WARN_(自身瞬发:提升移动速度3秒, 命中时造成35-80点近战伤害. 仅可在远程状态下施放)|r
    >>|cRXP_WARN_注意:|r|T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r|cRXP_WARN_也可能从丹莫罗的每个稀有怪物身上掉落, 包括|cRXP_ENEMY_瓦加什|r和|cRXP_ENEMY_癞爪|r和|cRXP_ENEMY_冰须|r|r
    .collect 206169,1 --Rune of Explosive Shot (1)
    .mob Fyodi
    .train 410123,1
    .xp >10,1
step
    #label Rune
    .goto 1426,62.094,47.154,40,0
    .goto 1426,62.434,48.989,40,0
    .goto 1426,62.538,46.195
    >>击杀|cRXP_ENEMY_瓦加什|r. 击败他后搜刮出 |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r
    >>|cRXP_WARN_注意:|r|T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r|cRXP_WARN_也可能从丹莫罗的所有稀有怪物身上掉落, 包括|cRXP_ENEMY_Fyodi|r和|cRXP_ENEMY_癞爪|r和|cRXP_ENEMY_冰须|r|r|r
    .collect 206169,1 --Rune of Explosive Shot (1)
    .mob Vagash
    .train 410123,1
    .xp <10,1
step
    .train 410123 >>|cRXP_WARN_使用|r|T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r|cRXP_WARN_来学习|r|T133816:0|t[雕纹手套 - 爆炸射击]
    .use 206169
    .itemcount 206169,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 爆炸射击 - 2(杜隆塔尔)
#displayname Explosive Shot


    --Rune of Explosive Shot

step
    #season 2
    .goto Durotar,40.60,66.80
    >>击杀 |cRXP_ENEMY_萨科斯|r. 击败他后搜刮出 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r]
    .collect 206169,1 --Rune of Explosive Shot (1)
    .mob Sarkoth
    .train 410123,1
step
    #season 2
    .train 410123 >>使用 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r]
    .use 206169
    .itemcount 206169,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 奇美拉射击 - 2(杜隆塔尔)
#displayname Chimera Shot


    --Rune of Chimera Shot

step << !Tauren
    #season 2
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jen'shan|r交谈
    .accept 77590 >>接受崎岖地形任务 << Troll Hunter
    .accept 77584 >>接受符文猎杀任务 << Orc Hunter
    .target Jen'shan
step
    #season 2
#loop
	.line Durotar,43.26,58.28,42.81,58.41,41.90,58.35,41.97,59.20,41.36,60.35,40.66,61.27,40.07,61.35,39.42,61.29,39.46,62.17,39.55,63.10,40.13,64.04,40.84,64.06,40.74,65.86,39.93,66.03,40.04,66.99,40.09,67.66,40.13,68.50,40.72,68.55,41.30,67.84,41.37,66.72,41.89,66.05,41.27,65.71,41.36,64.07,41.33,63.12,41.35,61.98,41.49,61.25,41.90,60.24,42.51,59.34,43.08,59.62,43.91,59.33,45.15,59.46,45.81,59.30,45.85,60.34,46.46,61.11,47.09,62.24,47.08,63.15,47.14,64.08,47.58,64.04,47.08,63.15,47.09,62.24,46.90,61.15,46.98,60.18,47.07,59.34,46.47,58.28,45.81,59.30,45.15,59.46,43.91,59.33,43.26,58.28
	.goto Durotar,43.26,58.28,25,0
	.goto Durotar,42.81,58.41,25,0
	.goto Durotar,41.90,58.35,25,0
	.goto Durotar,41.97,59.20,25,0
	.goto Durotar,41.36,60.35,25,0
	.goto Durotar,40.66,61.27,25,0
	.goto Durotar,40.07,61.35,25,0
	.goto Durotar,39.42,61.29,25,0
	.goto Durotar,39.46,62.17,25,0
	.goto Durotar,39.55,63.10,25,0
	.goto Durotar,40.13,64.04,25,0
	.goto Durotar,40.84,64.06,25,0
	.goto Durotar,40.74,65.86,25,0
	.goto Durotar,39.93,66.03,25,0
	.goto Durotar,40.04,66.99,25,0
	.goto Durotar,40.09,67.66,25,0
	.goto Durotar,40.13,68.50,25,0
	.goto Durotar,40.72,68.55,25,0
	.goto Durotar,41.30,67.84,25,0
	.goto Durotar,41.37,66.72,25,0
	.goto Durotar,41.89,66.05,25,0
	.goto Durotar,41.27,65.71,25,0
	.goto Durotar,41.36,64.07,25,0
	.goto Durotar,41.33,63.12,25,0
	.goto Durotar,41.35,61.98,25,0
	.goto Durotar,41.49,61.25,25,0
	.goto Durotar,41.90,60.24,25,0
	.goto Durotar,42.51,59.34,25,0
	.goto Durotar,43.08,59.62,25,0
	.goto Durotar,43.91,59.33,25,0
	.goto Durotar,45.15,59.46,25,0
	.goto Durotar,45.81,59.30,25,0
	.goto Durotar,45.85,60.34,25,0
	.goto Durotar,46.46,61.11,25,0
	.goto Durotar,47.09,62.24,25,0
	.goto Durotar,47.08,63.15,25,0
	.goto Durotar,47.14,64.08,25,0
	.goto Durotar,47.58,64.04,25,0
	.goto Durotar,47.08,63.15,25,0
	.goto Durotar,47.09,62.24,25,0
	.goto Durotar,46.90,61.15,25,0
	.goto Durotar,46.98,60.18,25,0
	.goto Durotar,47.07,59.34,25,0
	.goto Durotar,46.47,58.28,25,0
	.goto Durotar,45.81,59.30,25,0
	.goto Durotar,45.15,59.46,25,0
	.goto Durotar,43.91,59.33,25,0
	.goto Durotar,43.26,58.28,25,0
    >>击杀 |cRXP_ENEMY_蝎子工人|r. 击杀后掠夺他们, 获取 |T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]
    .collect 206168,1 --Rune of the Chimera (1)
    .mob Scorpid Worker
    .train 410121,1
step
    #season 2
    .train 410121 >>使用 |T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]
    .use 206168
    .itemcount 206168,1
step << !Tauren
    #season 2
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jen'shan|r交谈
    .turnin 77590 >>提交崎岖地形任务 << Troll Hunter
    .turnin 77584 >>交还“符文猎杀”任务 << Orc Hunter
    .target Jen'shan
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 奇美拉射击 - 2(莫高雷)
#displayname Chimera Shot


    --Rune of Chimera Shot

step << Tauren
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .accept 77649 >>接任务: |cRXP_WARN_猎人的力量|r
    .target Lanka Farshot
step
    #season 2
    .goto Mulgore,63.81,76.65,40,0
    .goto Mulgore,62.92,76.91,40,0
    .goto Mulgore,61.31,77.22,40,0
    .goto Mulgore,61.58,78.89,40,0
    .goto Mulgore,62.53,79.52,40,0
    .goto Mulgore,64.20,79.01,40,0
    .goto Mulgore,65.82,78.13,40,0
    .goto Mulgore,63.93,78.34
    >>击杀|r|cRXP_ENEMY_刺背斗猪|r. 击败它们后可获得|r|T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]
    .collect 206168,1 --Rune of the Chimera (1)
    .mob Bristleback Battleboar
    .train 410121,1
step
    #season 2
    .train 410121 >>使用 |T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]
    .use 206168
    .itemcount 206168,1
step << Tauren
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .turnin 77649 >>交任务: |cRXP_FRIENDLY_猎人的力量|r
    .target Lanka Farshot
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 大师射手 - 6(杜洛塔尔)
#displayname Master Marksman


    --Rune of Master Marksman

step
    #season 2
    .goto Durotar,40.61,52.19
    >>对|cRXP_ENEMY_Rustling Bush|r施放 |T132212:0|t[猎人印记]
    >>击杀生成的|cRXP_ENEMY_剃刀爪偷猎者|r, 从他身上搜刮|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Razormane Poacher
    .train 410113,1
step
    #season 2
    .train 410113 >>使用 |T134419:0|t[|cRXP_FRIENDLY_射击天赋符文|r]
    .use 206155
    .itemcount 206155,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 大师射手 - 6(莫高雷)
#displayname Master Marksman


    --Rune of Master Marksman

step
    #season 2
    .goto Mulgore,59.02,54.36
    >>对|cRXP_ENEMY_Rustling Bush|r施放 |T132212:0|t[猎人印记]
    >>击杀生成的|r|cRXP_ENEMY_ 企业公司偷猎者|r, 从他身上搜刮|T134419:0|t[|cRXP_FRIENDLY_ 精准符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Venture Co. Poacher
    .train 410113,1
step
    #season 2
    .train 410113 >>使用 |T134419:0|t[|cRXP_FRIENDLY_射击天赋符文|r]
    .use 206155
    .itemcount 206155,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 大师射手 - 6(丹莫洛)
#displayname Master Marksman


    --Rune of Master Marksman

step
    #season 2
    .goto Dun Morogh,28.852,49.859
    >>对|cRXP_ENEMY_Rustling Bush|r施放 |T132212:0|t[猎人印记]
    >>击杀生成的|cRXP_ENEMY_剃刀爪偷猎者|r, 从他身上搜刮|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Razormane Poacher
    .train 410113,1
step
    #season 2
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_射击天赋符文|r]
    .use 206155
    .train 410113,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Chest
#name 大师神射手 - 6(泰达希尔)
#displayname Master Marksman


    --Rune of Master Marksman

step
    #season 2
    .goto Teldrassil,46.6,46.3
    >>对|cRXP_ENEMY_Rustling Bush|r施放 |T132212:0|t[猎人印记]
    >>击杀生成的堕根偷猎者. 从他身上搜刮[精准符文]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Fallenroot Poacher
    .train 410113,1
step
    #season 2
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_射击天赋符文|r]
    .use 206155
    .train 410113,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 侧翼进攻-6(莫高雷)
#displayname Flanking


    --Rune of Flanking

step
    #season 2
    .goto Mulgore,41.41,66.32,60,0
    .goto Mulgore,38.66,66.29,60,0
    .goto Mulgore,37.63,63.00,60,0
    .goto Mulgore,36.74,58.53
    >>击杀|cRXP_ENEMY_平原陆行鸟|r和|cRXP_ENEMY_猛鹫|r. 击杀后搜刮出 |T134025:0|t[|cRXP_LOOT_莫高雷鸟肉|r]
    .collect 205961,1 --Mulgore Bird Meat (1)
    .mob Elder Plainstrider
    .mob Adult Plainstrider
    .mob Swoop
    .mob Wiry Swoop
    .mob Taloned Swoop
    .train 425762,1
step
    #season 2
    .goto Mulgore,35.22,57.42
    >>在尸体上使用 |T134025:0|t[|cRXP_LOOT_莫高雷鸟肉|r] 来召唤|cRXP_ENEMY_Mokwa|r
    >>击杀他并将其身上的物品 loot 为 |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r]
    .collect 205979,1 --Rune of Flanking (1)
    .mob Mokwa
    .use 205961
    .train 425762,1
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r]|cRXP_WARN_来训练|r|T132175:0|t[突袭打击]
    .use 205979
    .itemcount 205979,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 侧翼进攻 - 6 (杜隆塔尔)
#displayname Flanking


    --Rune of Flanking

step
    #season 2
    .goto Durotar,53.43,48.62,70,0
    .goto Durotar,51.77,56.01,70,0
    .goto Durotar,54.04,67.14
    >>击杀|cRXP_ENEMY_可怕的杂斑野猪|r. 击败后可拾取|T134026:0|t[|cRXP_LOOT_杜洛塔猪排|r]
    .collect 207590,1 --Durotar Pig Meat (1)
    .mob Dire Mottled Boar
    .train 425762,1
step
    #season 2
    .goto Durotar,68.67,71.68
    .use 207590 >>在尸体上使用 |T134026:0|t[|cRXP_LOOT_杜隆塔尔猪肉|r] 来召唤 |cRXP_ENEMY_Raluk|r
    >>击杀他并将其身上的物品 loot 为 |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r]
    .collect 205979,1 --Rune of Flanking (1)
    .mob Raluk
    .train 425762,1
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r]|cRXP_WARN_来训练|r|T132175:0|t[突袭打击]
    .use 205979
    .itemcount 205979,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 雕刻 - 10(杜隆塔尔)
#displayname Carve


    --Rune of Carve

step
    #season 2
    #completewith n`t
    +|cRXP_WARN_你需要学会|r|T132164:0|t[驯服野兽]|cRXP_WARN_才能获得此符文|r
step
    #season 2
    .goto Durotar,50.21,50.78,30,0
    .goto Durotar,50.18,49.23,30,0
    .goto Durotar,49.48,49.14,30,0
    .goto Durotar,49.32,48.18,30,0
    .goto Durotar,48.81,49.00,30,0
    .goto Durotar,48.49,49.29,30,0
    .goto Durotar,47.58,49.62,30,0
    .goto Durotar,47.06,49.53,30,0
    .goto Durotar,46.90,48.11,30,0
    .goto Durotar,49.22,48.96
    >>击杀|cRXP_ENEMY_钢鬃野猪人|r. 击败它们后可获得 |T134743:0|t[|cRXP_LOOT_蝰蛇信息素|r]
    .collect 207631,1 --Adder Pheromone (1)
    .mob Razormane Quilboar
    .mob Razormane Scout
    .train 425758,1
step
    #season 2
    #completewith next
    +找到一只|cRXP_ENEMY_Adder|r(蛇类生物). 使用你的 |T134743:0|t[|cRXP_LOOT_Adder Pheromone|r] 并施放 |T132164:0|t[驯服野兽]
    >>|cRXP_WARN_它们在剃刀岭附近更容易被发现|r
    .use 207631
    .unitscan Adder
step
    #season 2
    .goto Durotar,52.15,44.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|Razzil|c交谈
    >>交付|cRXP_ENEMY_蝰蛇|r以获得 |T134419:0|t[|cRXP_FRIENDLY_刻印|r]
    .collect 206032,1 --Rune of Carve (1)
    .target Razzil
    .train 425758,1
step
    #season 2
    .train 425758 >>使用 |T134419:0|t[|cRXP_FRIENDLY_刻痕符文|r]
    .use 206032
    .itemcount 206032,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 雕刻 - 10 (莫高雷)
#displayname Carve


    --Rune of Carve

step
    #season 2
    #completewith next
    +|cRXP_WARN_你需要学会|r|T132164:0|t[驯服野兽]|cRXP_WARN_才能获得此符文|r
step
    #season 2
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0
    >>击杀|cRXP_ENEMY_Palemane Gnolls|r. 击败他们后搜刮出 |T134419:0|t[|cRXP_LOOT_Prairie Dog Musk|r]
    .collect 205995,1 --Prairie Dog Musk (1)
    .unitscan Snagglespear
    .mob Palemane Tanner
    .mob Palemane Skinner
    .mob Palemane Poacher
    .train 425758,1
step
    #season 2
    #completewith next
    +找到一只|cRXP_ENEMY_Prairie Dog|r(草原土拨鼠). 使用你的 |T134419:0|t[|cRXP_LOOT_Prairie Dog Musk|r] 并施放 |T132164:0|t[驯服野兽]
    >>|cRXP_WARN_它们更容易在血蹄村以南或东南方向的道路沿线找到|r
    .use 205995
    .unitscan Prairie Dog
step
    #season 2
    .goto Mulgore,46.19,60.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔科达|r交谈
    >>交付|cRXP_ENEMY_草原土拨鼠|r以获得 |T134419:0|t[|cRXP_FRIENDLY_雕纹|r]
    .collect 206032,1 --Rune of Carve (1)
    .target Takoda Sunmane
    .train 425758,1
step
    #season 2
    .train 425758 >>使用 |T134419:0|t[|cRXP_FRIENDLY_刻痕符文|r]
    .use 206032
    .itemcount 206032,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 雕刻 - 10(丹莫罗)
#displayname Carve


    --Rune of Carve
step
    #season 2
    #completewith next
    +|cRXP_WARN_你需要学会|r|T132164:0|t[驯服野兽]|cRXP_WARN_才能获得此符文|r
step
    #season 2
    #loop
    .goto Dun Morogh,68.2,56.2,20,0
    .goto Dun Morogh,68.8,58.2,20,0
    .goto Dun Morogh,71.0,58.0,20,0
    .goto Dun Morogh,71.0,58.0,20,0
    .goto Dun Morogh,72.6,52.6,20,0
    >>击杀|cRXP_ENEMY_石腭穴居人|r. 击杀后搜刮出 |T134419:0|t[|cRXP_LOOT_兔子麝香|r]
    .collect 208180,1 --Rabbit Musk (1)
    .mob Rockjaw Skullthumper
    .mob Rockjaw Bonesnapper
    .mob Rockjaw Backbreaker
    .mob Rockjaw Ambusher
    .train 425758,1
step
    #season 2
    #completewith next
    .goto Dun Morogh,44.4,56.2,20,0
    .goto Dun Morogh,44.8,59.8,20,0
    .goto Dun Morogh,47.4,54.4,20,0
    .goto Dun Morogh,49.2,46.0,20,0
    .goto Dun Morogh,47.0,44.6,20,0
    .goto Dun Morogh,46.8,47.8
    >>对|cRXP_ENEMY_兔子|r使用 |T134419:0:0|t[兔麝香] |cRXP_WARN_不要驱散你当前的宠物. |r
    .use 208180
    .unitscan Rabbit
step
    #season 2
    .goto Dun Morogh,63.40,50.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托比|r交谈
    >>交付|r兔|r敌人以获得|T134419:0|t[|cRXP_FRIENDLY_刻印|r]
    .collect 206032,1 --Rune of Carve (1)
    .target Toby
    .train 425758,1
step
    #season 2
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_刻痕符文|r]
    .use 206032
    .train 425758,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 雕刻 - 10(泰达希尔)
#displayname Carve


    --Rune of Carve

step
    #season 2
    #completewith next
    +|cRXP_WARN_你需要学会|r|T132164:0|t[驯服野兽]|cRXP_WARN_才能获得此符文|r
step
    #season 2
    .goto Teldrassil,46.2,51.2,20,0
    .goto Teldrassil,46.8,54.6,20,0
    .goto Teldrassil,48.8,55.4,20,0
    .goto Teldrassil,71.0,58.0,20,0
    .goto Teldrassil,44.8,61.2
    >>击杀|cRXP_ENEMY_Gnarlpines|r. 击败后可掠夺出 |T134419:0|t[|cRXP_LOOT_Deer Musk|r]
    .collect 208607,1 --Deer Musk (1)
    .train 425758,1
    .mob Gnarlpine Augur
    .mob Gnarlpine Pathfinder
    .mob Gnarlpine Totemic
    .mob Gnarlpine Ambusher
    .mob Gnarlpine Defender
    .mob Gnarlpine Avenger
    .mob Gnarlpine Shaman
step
    #season 2
    #completewith next
    .goto Teldrassil,42.2,71.6,20,0
    .goto Teldrassil,43.2,74.2,20,0
    .goto Teldrassil,47.6,74.0,20,0
    .goto Teldrassil,53.4,77.0,20,0
    .goto Teldrassil,54.8,58.4
    >>使用 |T134419:0|t[亲爱的麝香] 对一只|cRXP_ENEMY_鹿|r使用, |cRXP_WARN_请勿驱散你当前的宠物. |r
    .use 208607,1
    .unitscan Deer
step
    #season 2
    .goto Teldrassil,39.8,9.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达纳苏斯的|cRXP_FRIENDLY_Relaeron|r交谈
    >>交付|cRXP_ENEMY_鹿|r以获得 |T134419:0|t[|cRXP_FRIENDLY_刻印|r]
    .collect 206032,1 --Rune of Carve (1)
    .target Relaeron
    .train 425758,1
step
    #season 2
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_刻痕符文|r]
    .use 206032
    .train 425758,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 兽王 - 16(贫瘠之地)
#displayname Beast Mastery

    --Rune of Beast Mastery

step
    #season 2
    #completewith next
    +|cRXP_WARN_你需要学会|r|T135813:0|t[献祭陷阱]|cRXP_WARN_或任何其他陷阱, 才能获得此符文|r
step
    #season 2
    .goto The Barrens,44.60,55.51,40,0
    .goto The Barrens,44.05,56.20,40,0
    .goto The Barrens,43.12,57.37
    .line The Barrens,44.60,55.51,44.60,55.51,43.12,57.37
    >>在|cRXP_ENEMY_Patrolling Cheetah|r的巡逻路径上使用 |T135813:0|t[献祭陷阱], 以清除其增益效果
    >>杀死他并搜刮出 |T134419:0|t[|cRXP_FRIENDLY_兽王符文|r]
    .collect 208701,1 --Rune of Beast Mastery (1)
    .mob Patrolling Cheetah
    .train 410110,1
step
    #season 2
    .train 410110 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_兽王符文|r]|cRXP_WARN_进行训练|r|T132270:0|t[兽王专精]
    .use 208701
    .itemcount 208701,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Gloves
#name 兽王 - 16(银松森林)
#displayname Beast Mastery

    --Rune of Beast Mastery

step
    #season 2
    .goto Silverpine Forest,41.37,19.64,50,0
    .goto Silverpine Forest,41.60,21.65,50,0
    .goto Silverpine Forest,42.36,23.77,50,0
    .goto Silverpine Forest,44.67,24.84,50,0
    .goto Silverpine Forest,46.08,26.62,50,0
    .goto Silverpine Forest,41.60,21.65
    >>击杀|cRXP_ENEMY_凶猛的灰斑熊|r, 直到出现一只|cRXP_ENEMY_灰斑守护者|r(16名精英)
    >>杀死他并搜刮出 |T134419:0|t[|cRXP_FRIENDLY_兽王符文|r]
    .collect 208701,1 --Rune of Beast Mastery (1)
    .mob Ferocious Grizzled Bear
    .mob Grizzled Protecter
step
    #season 2
    .train 410110 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_兽王符文|r]|cRXP_WARN_进行训练|r|T132270:0|t[兽王专精]
    .use 208701
    .itemcount 208701,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狙击手训练 - 18(暗礁海岸)
#displayname Sniper Training


    --Rune of the Sniper

step
    #season 2
    #completewith next
    .train 416091,1
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
step
    #season 2
    .goto 1439,44.081,20.739
    >>在骷髅的眼中拾取|T135129:0|t[扭曲鱼叉]
    .collect 209047,1 --Gnarled Harpoon (1)
    .train 416091,1
step
    #completewith next
    .goto 1439,44.081,20.739
    .cast 422397 >>|cRXP_WARN_使用|r|T135129:0|t[扭曲鱼叉], |cRXP_WARN_目标: |r|cRXP_ENEMY_Paxnozz|r, 将他的最大生命值降至743|r
    .train 416091,1
step
    #season 2
    #loop
    .goto Darkshore,48.0,18.0,0
    .goto Darkshore,47.6,13.2,0
    .goto Darkshore,50.4,12.0,0
    .goto Darkshore,48.8,16.0,0
    .goto Darkshore,48.0,18.0,40,0
    .goto Darkshore,47.6,13.2,40,0
    .goto Darkshore,50.4,12.0,40,0
    .goto Darkshore,48.8,16.0,40,0
    >>击杀|cRXP_ENEMY_Paxnozz|r. 击败他后搜刮出 |T134419:0|t|cRXP_LOOT_[狙击符文]|r
    >>|cRXP_WARN_小心, 他是个20级精英怪|r
    .collect 208777,1 --Rune of the Sniper (1)
    .train 416091,1
    .use 209047
    .mob Paxnozz
step
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r]|cRXP_WARN_来训练|r|T132212:0|t[狙击手训练]
    .use 208777
    .itemcount 208777,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狙击手训练 - 16(西部荒野)
#displayname Sniper Training


    --Rune of the Sniper

step
    #season 2
    #completewith next
    .train 416091,1
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    #season 2
    #loop
    .goto Westfall,51.2,47.0,20,0
    .goto Westfall,50.2,48.6,20,0
    .goto Westfall,51.6,55.6,20,0
    >>击杀|cRXP_ENEMY_Defias Scout|r. 从他身上搜刮出 |T134419:0|t[|cRXP_LOOT_Rune of the Sniper|r]
    .collect 208777,1
    .train 416091,1
    .mob Defias Scout
step
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r]|cRXP_WARN_来训练|r|T132212:0|t[狙击手训练]
    .use 208777
    .itemcount 208777,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 狙击手训练 - 16(洛克莫丹)
#displayname Sniper Training


    --Rune of the Sniper

step
    #season 2
    #completewith next
    .train 416091,1
    .zone Loch Modan >>前往: |cRXP_PICK_洛克莫丹|r
step
    #season 2
    #loop
    .goto Loch Modan,55.6,52.2,20,0
    .goto Loch Modan,55.8,54.4,20,0
    .goto Loch Modan,54.2,56.8,20,0
    .goto Loch Modan,53.8,54.4,20,0
    >>击杀|cRXP_ENEMY_Kackle|r. 击败他后搜刮出 |T134419:0|t[|cRXP_LOOT_狙击手符文|r]
    .collect 208777,1
    .train 416091,1
    .mob Kackle
step
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r]|cRXP_WARN_来训练|r|T132212:0|t[狙击手训练]
    .use 208777
    .itemcount 208777,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 突袭侧翼 - 7 (丹莫洛)
#displayname Flanking


    --Rune of Flanking

step
    #season 2
    #loop
    .goto Dun Morogh,43.4,65.6,20,0
    .goto Dun Morogh,49.2,61.4,20,0
    .goto Dun Morogh,51.0,51.8,20,0
    .goto Dun Morogh,45.8,50.0,20,0
    .goto Dun Morogh,42.6,60.2,20,0
    .goto Dun Morogh,38.2,60.6,20,0
    .train 425762,1
    >>击杀|cRXP_ENEMY_野猪|r. 击杀后搜刮出 |T134026:0|t[丹莫罗猪肉]
    .collect 208192,1
    .mob Crag Boar
    .mob Large Crag Boar
    .mob Elder Crag Boar
    .mob Scarred Crag Boar
step
    #season 2
    .train 425762,1
    .goto Dun Morogh,37.78,42.55
    >>在|cFFfa9602冰流洞穴|r中尸体附近使用|T134026:0|t[丹莫罗猪肉], 召唤|cRXP_ENEMY_Jorul|r
    >>击杀|cRXP_ENEMY_Jorul|r并从他身上获取|T135142:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .use 208192
    .mob Jorul
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r]|cRXP_WARN_来训练|r|T132175:0|t[突袭打击]
    .use 205979
    .itemcount 205979,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Legs
#name 突袭侧翼 - 7(泰达希尔)
#displayname Flanking


    --Rune of Flanking
step
    #season 2
    #loop
    .goto Teldrassil,42.6,52.6,20,0
    .goto Teldrassil,39.8,53.2,20,0
    .goto Teldrassil,39.4,36.2,20,0
    .goto Teldrassil,40.8,31.6,20,0
    .goto Teldrassil,46.6,31.2,20,0
    .train 425762,1
    >>击杀泰达希尔(|cFFfa9602Teldrassil|r)中的鸟类敌人(|cRXP_ENEMY_Birds|r), 并搜刮它们以获得 |T134025:0|t[泰达希尔鸟肉]
    .collect 208608,1
    .mob Strigid Owl
    .mob Strigid Screecher
    .mob Strigid Hunter
step
    #season 2
    .train 425762,1
    .goto Teldrassil,48.3,31.4
    >>在尸体附近使用 |T134025:0|t[泰达希尔鸟肉] 召唤|cRXP_ENEMY_Mowgh|r
    >>击杀 |cRXP_ENEMY_Mowgh|r并从他身上获取 |T134419:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .use 208608
    .mob Mowgh
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r]|cRXP_WARN_来训练|r|T132175:0|t[突袭打击]
    .use 205979
    .itemcount 205979,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#displayname Expose Weakness
#name 揭示弱点 - 40(艾泽拉斯)


-- Expose Weakness

step
    #optional
    .train 426445,1
    +|cRXP_WARN_你必须至少达到 26 级才能获得|r|T132353:0|t[暴露弱点]|cRXP_WARN_符文|r
    .xp >26,1
step
    #completewith next
    .zone Badlands >>前往: |cRXP_PICK_荒芜之地|r
step
    .goto Badlands,66.6,23.4,0
    .goto Badlands,51.2,69.4,0
    .goto Badlands,29.6,56.8,0
    .goto Badlands,62.6,69.2,0
    .goto Badlands,9.6,77.6,0
    .goto Badlands,66.6,23.4,50,0
    .goto Badlands,51.2,69.4,50,0
    .goto Badlands,29.6,56.8,50,0
    .goto Badlands,62.6,69.2,50,0
    .goto Badlands,9.6,77.6
    .use 211269 >>击杀任意|cRXP_ENEMY_火烟食人魔|r 或|cRXP_ENEMY_石窟穴居人|r. 击杀后搜刮出 |T237388:0|t[|cRXP_LOOT_原始图纸|r ]
    >>|cRXP_WARN_使用|r|T237388:0|t[|cRXP_LOOT_原始图纸|r]|cRXP_WARN_来开始任务|r
    >>|cRXP_WARN_它们的位置已标记在你的地图上|r
    .collect 211269,1,78823,1 --Primitive Drawing
    .accept 78823 >>接任务: |cRXP_WARN_沙海的苍穹灾星|r
    .mob Dustbelcher Ogre
    .mob Dustbelcher Brute
    .mob Dustbelcher Mauler
    .mob Dustbelcher Mystic
    .mob Dustbelcher Shaman
    .mob Dustbelcher Warrior
    .mob Dustbelcher Wyrmhunter
    .mob Stonevault Bonesnapper
    .mob Stonevault Shaman
    .train 410114,1
step
    #optional
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .train 410114,1
step
    .goto Stranglethorn Vale,35.658,10.808
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫米特·奈辛瓦里|r交谈
    .turnin 78823 >>交任务: |cRXP_FRIENDLY_沙海的苍穹灾星|r
    .accept 78830 >>接任务: |cRXP_WARN_沙海的苍穹灾星|r
    .target Hemet Nesingwary
    .train 410114,1
step
    #loop
    .goto Stranglethorn Vale,43.8,18.6,20,0
    .goto Stranglethorn Vale,45.2,19.6,20,0
    .goto Stranglethorn Vale,44.2,22.0,20,0
    .goto Stranglethorn Vale,45.6,23,0,20,0
    .use 211272 >>|cRXP_WARN_在STV中, 对|r|T132599:0|t[空诱饵笼], |cRXP_WARN_目标: |r|cRXP_ENEMY_阿博尔狼蛛|r生物使用. 它们通常出现在树桩顶部|r
    >>|cRXP_WARN_你也可以将它用于世界中见到的任何其他生物|r
    .collect 211273,1 --Trapped Critter
    .mob Arbor Tarantula
    .mob Rat
    .mob Black Rat
    .mob Chicken
    .train 410114,1
step
    #completewith next
    .zone Badlands >>前往: |cRXP_PICK_荒芜之地|r
    .train 410114,1
step
    #completewith next
    .goto Badlands,22.352,67.733
    +点击山巅的大型巢穴召唤加里克
    .itemcount 211272,<1
step
    .goto Badlands,22.352,67.733
    >>击杀|cRXP_ENEMY_Gharik|r. 击败她并搜刮出|cRXP_LOOT_Crimson Trophy Quill|r
    .complete 78830,1 --Crimson Trophy Quill (1)
    .mob Gharik
    .train 410114,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .train 410114,1
step
    .goto Stranglethorn Vale,35.658,10.808
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫米特·奈辛瓦里|r交谈
    .turnin 78830 >>交任务: |cRXP_FRIENDLY_沙海的苍穹灾星|r
    .target Hemet Nesingwary
    .train 410114,1
step
    #season 2
    .train 410114 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_暴露弱点符文|r]|cRXP_WARN_来训练|r|T132353:0|t[暴露弱点]
    .use 211301
    .itemcount 211301,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Belt
#displayname Steady Shot
#name 稳固射击 - 30(阿拉希高地)

step
    #completewith next
    .zone Arathi Highlands >>前往: |cRXP_PICK_阿拉希高地|r
step
    .train 410109,1
    #loop
    .goto Arathi Highlands,67.8,66.0,0
    .goto Arathi Highlands,69.4,63.2,25,0
    .goto Arathi Highlands,67.8,66.0,25,0
    .goto Arathi Highlands,68.4,68.2,25,0
    >>击杀|cRXP_ENEMY_Needletooth|r. 击败后拾取其掉落的 |T134419:0|t[|cRXP_FRIENDLY_稳固射击符文|r]
    >>|cRXP_ENEMY_针齿|r|cRXP_WARN_是一种在枯木村湖中游动的鱼|r
    .collect 213122,1
    .mob Needletooth
step
    .train 410109 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_稳固射击符文|r] |cRXP_WARN_来训练|r|T132213:0|t[稳固射击]
    .use 213122
    .itemcount 213122,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Boots
#displayname Dual-Wield Specialization
#name 双持专精 - 32(荆棘谷)

step
    #optional
    .train 410116,1
    +|cRXP_WARN_你必须至少达到32级才能获得|r|T132147:0|t[双持专精]|cRXP_WARN_rune|r
    .xp >32,1
step
    .train 410116,1
    #optional
    .train 1543 >>|cRXP_WARN_你必须训练|r|T135815:0|t[信火]|cRXP_WARN_以习得|r|T132147:0|t[双持专精]|cRXP_WARN_符文|r
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
step
    .train 410116,1
    .goto Stranglethorn Vale,31.84,15.61
    +|cRXP_WARN_前往箭头指示的位置并四处奔跑, 直到你身上出现名为「|r|T132118:0|t[危险！]|cRXP_WARN_」的增益效果|r
    .aura 435548
    .aura 435428
    .aura 435546
step
    .train 410116,1
    .goto Stranglethorn Vale,31.84,15.61
    #completewith next
    .cast 1543 >>|cRXP_WARN_使用|r |T135815:0|t[信火] |cRXP_WARN_揭露|r |cRXP_ENEMY_血皮游击队|r
    .usespell 1543
step
    .train 410116,1
    .goto Stranglethorn Vale,31.84,15.61
    >>击杀 |cRXP_ENEMY_Bloodscalp 游击者|r. 击败他后搜刮出 |T134419:0|t[|cRXP_FRIENDLY_废铁符文|r]
    .collect 213126,1
    .mob Bloodscalp Guerrilla
step
    .itemcount 213126,1
    .use 213126
    .train 410116 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_ 废料符文|r]|cRXP_WARN_来训练|r|T132147:0|t[双武器专精]
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文与书籍指南
#subgroup Bracers
#displayname Focus Fire
#name 集中火力 - 40(灼热峡谷)

step
    #completewith next
    +|cRXP_WARN_你需要在敌对区域击杀一只45级怪物才能获得这个符文. 如果你等级较低, 务必带上帮手|r
    .xp <45,1
step
    .goto Searing Gorge,53.10,55.85
    >>小心沿着树枝走向鸟巢, 拾取其中的|cRXP_PICK_风暴乌鸦蛋|r
    .collect 221544,1 --Stormcrow Egg
step
    .goto 1427/0,-1532.400,-6953.600
    >>沿着树枝往回走. 等待几秒钟, 让|r|cRXP_ENEMY_狂暴风暴乌鸦|r出现. 击杀它并拾取|r|T134419:0|t[|cRXP_FRIENDLY_专注火焰符文|r]
    .collect 221445,1
    .mob Enraged Stormcrow
    .train 431601,1
step
    .itemcount 221445,1
    .use 221445
    .train 431601 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_聚焦射击符文|r] |cRXP_WARN_来训练|r |T135548:0|t[集中火力]
 ]])

 RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文与书籍指南
    #subgroup Bracers
    #displayname Raptor Fury
    #name 迅猛龙之怒 - 40 (塔纳利斯)

step
    #completewith next
    .zone Tanaris >>前往: |cRXP_PICK_塔纳利斯|r
step
    #loop
    .goto 1446/1,-3973.700,-7372.900,0
    .goto 1446/1,-3777.100,-7358.200,0
    .goto 1446/1,-3290.200,-7330.700,0
    .goto 1446/1,-3563.000,-7352.400,0
    .goto 1446/1,-3386.400,-7337.400,0
    .goto 1446/1,-3290.200,-7330.700,0
    >>击杀|cRXP_ENEMY_Zopilote|r. 击败后拾取, 获得 |T134419:0|t[|cRXP_FRIENDLY_迅猛龙符文|r]
    >>|cRXP_ENEMY_Zopilote|r|cRXP_WARN_是一种食腐鸟, 沿东西方向巡逻, 活动范围从流沙岗哨南部延伸至加基森|r
    >>提示:与其四处奔跑, 不如使用 |T132172:0|t[|cRXP_FRIENDLY_鹰眼|r] 来侦察他的位置. 如果找不到他, 他很可能已死亡, 应该会在地图上标记为“2+”的位置附近重生
    .collect 220687,1
    .unitscan Zopilote
    .train 416093,1
step
    .train 416093 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_猛禽符文|r]|cRXP_WARN_来训练|r|T132253:0|t[猛禽之怒]
    .use 2220687
    .itemcount 220687,1

    ]])
RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文与书籍指南
    #subgroup 头盔
    #displayname Catlike Reflexes
    #name 猫类反射 - 40(费拉斯)

step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    +|cRXP_WARN_你需要其中一种物品:|T133951:0|t|cRXP_PICK_软香蕉面包|r或 |T133980:0|t|cRXP_PICK_特尔阿宾香蕉|r, 才能获得此符文. |cRXP_FRIENDLY_马德拉克·格林韦尔|r在月光岛为联盟出售此面包. |cRXP_FRIENDLY_旅店老板格鲁尔|r在莫沙彻营地为部落出售此面包
    .itemcount 4601,<1 --Soft Banana Bread
    .itemcount 4537,<1 --Tel'Abim Banana
    .target Innkeeper Greul
    .target Madrack Greenwell
    .train 416083,1
step
    >>前往高原荒野的熊怪洞穴
    .goto 1444/1,1599.300,-4977.800,10
    .train 416083,1
step
    .goto 1444/1,1778.900,-5179.100,
    >>进入第二个洞穴后, 在岔路口选择中间的路径. 在洞穴深处, 你会找到一个|cRXP_FRIENDLY_Groddoc 幼体|r
    .gossip 222376,1 >>完成猴子的对话, 喂它 |T133951:0|t|cRXP_PICK_软香蕉面包|r或 |T133980:0|t|cRXP_PICK_Tel'Abim香蕉|r. 这样会召唤一个跟随你的副本版本
    .target Groddoc Infant
    .train 416083,1
step
    .goto 1444/1,1330.900,-5078.100
    >>护送|cRXP_FRIENDLY_Groddoc 幼崽|r前往地图上标记的|cRXP_FRIENDLY_Groddoc 母体|r. 请注意, 幼崽具有攻击性, 会主动攻击附近的敌人, 包括敌对阵营玩家
    .gossip 222406,1 >>到达那里后, 与女族长交谈并完成对话, 即可获得 |T134419:0|t[|cRXP_FRIENDLY_丛林豹符文|r]
    .collect 220791,1 -- Rune of the Jungle Cat
    .train 416083,1
step
    .train 416083 >>使用 |T134419:0|t[|cRXP_FRIENDLY_丛林豹符文|r]|cRXP_WARN_进行训练|r|T132167:0|t[猫科反射]
    .use 220791
]])

RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文与书籍指南
    #subgroup 头盔
    #displayname Rapid Killing
    #name 快速杀戮 - 45(灼热峡谷 & 焦土之地)
step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
step
    .goto 1427/0,-832.800,-6647.500,10
    >>前往火焰守望岭的洞穴入口. 请注意, 你需要进入一个充满47-48级精英怪的洞穴. 不过, 使用死亡跑图(Deathruns)也可以完成这一部分
    .train 416090,1
step
    .goto Searing Gorge,14.5,36.5
    >>|cRXP_WARN_进入洞穴后, 沿着右侧的路径前进. 你会很快在洞穴中段的高地上看到一块名为|cRXP_FRIENDLY_风化刻痕|r的巨大石板. 跑过去接受任务
    >>提示:如果你是独自一人, 可以尝试使用陷阱和宠物尽可能跑远, 再使用 |T132293:0|t[|cRXP_FRIENDLY_假死|r] 来转移怪物的仇恨. 或者, 你也可以选择尸体回城前往物品位置
    .accept 81900 >>接任务: |cRXP_WARN_烈燃猛兽|r
step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step
    .goto Blasted Lands,50.6,14.2
    >>与|cRXP_FRIENDLY_血法师莱诺雷|r交谈
    .turnin 81900 >>交任务: |cRXP_FRIENDLY_烈燃猛兽|r
    .accept 81917 >>接受绑定任务链
    .target Bloodmage Lynnore
step
    .goto Blasted Lands,64.24,32.36
    >>前往影誓者洞穴区域, 击杀任意一名|cRXP_ENEMY_魔誓祭司和恶棍或能手|r以获得|cRXP_LOOT_地狱火爪牙|r
    .complete 81917,1 --Infernal Chains 5/5
    .mob Shadowsworn Cultist
    .mob Shadowsworn Thug
    .mob Shadowsworn Adept
step
    .goto Blasted Lands,50.6,14.2
    >>与|cRXP_FRIENDLY_血法师莱诺雷|r交谈
    .turnin 81917 >>交还束缚之锁链
    .accept 81919 >>接受任务:屈服于脚跟
    .target Bloodmage Lynnore
step
    #loop
    .goto 1419/0,-2976.500,-11483.101
    .goto 1419/0,-2778.300,-11420.800
    .goto 1419/0,-2821.900,-11353.700
    .goto 1419/0,-2934.700,-11419.101
    >>寻找|cRXP_ENEMY_Calefactus the Unleashed|r— 一只50级的绿色核心猎犬. 他会在地图红色区域南部边缘的多个位置刷新. 建议使用 |T132172:0|t[|cRXP_FRIENDLY_鹰眼|r] 来搜寻他. 找到后, 对他使用 |T136091:0|t|cRXP_LOOT_地狱火套索|r, 击杀并采集他的血液
    .complete 81919,1 --Fel Lifeblood 1/1
    .use 220216
    .unitscan Calefactus the Unleashed
step
    .goto Blasted Lands,50.6,14.2
    >>与|cRXP_FRIENDLY_血法师莱诺雷|r交谈
    .turnin 81919 >>交任务:驯服桀骜者
    .target Bloodmage Lynnore
step
    .train 416090 >>使用 |T134419:0|t[|cRXP_FRIENDLY_食尸者符文|r] |cRXP_WARN_来训练|r |T132205:0|t[快速击杀]
    >>你还获得了一个 |T136091:0|t|cRXP_LOOT_地狱火爪牙锁链|r副本饰品, 可用于驯服核心猎犬
    .use 220217
]])

RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文与书籍指南
    #subgroup Cloak
    #displayname Hit and Run
    #name 突袭与逃逸 - 50(燃烧平原)
step
    #completewith next
    .zone Burning Steppes >>前往: |cRXP_PICK_燃烧平原|r
step
    >>寻找一只|cRXP_ENEMY_熔火恶犬|r, 它可能在该区域的多个地点刷新, |cRXP_WARN_请查看地图上的标记点以确认可能的生成位置|r. 击杀它后可获得符文
    >>提示:你无需四处奔跑, 可以使用 |T132172:0|t[|cRXP_FRIENDLY_鹰眼|r] 来侦察他的位置
    .goto Burning Steppes,84.8,68.0,0
    .goto Burning Steppes,83.8,60.0,0
    .goto Burning Steppes,88.6,54.8
    .goto Burning Steppes,61.6,54.4,0
    .goto Burning Steppes,39.8,59.4,0
    .goto Burning Steppes,31.8,53.0,0
    .goto Burning Steppes,24.8,55.6,0
    .unitscan Escaped Core Hound
    .collect 226252,1 --rune of the guerrilla (1)
step
    .train 440563 >>使用 |T134419:0|t[|cRXP_FRIENDLY_游击符文|r]|cRXP_WARN_进行训练|r|T132171:0|t[突袭与撤退]
    .use 226252
]])

RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文与书籍指南
    #subgroup Cloak
    #displayname Resourcefulness
    #name 足智多谋 - 58(东瘟疫之地)
step
    #completewith next
    .zone Eastern Plaguelands >>前往: |cRXP_PICK_东瘟疫之地|r
step
    .goto Eastern Plaguelands,74.4,62.7
    .goto Eastern Plaguelands,72.5,66.4,0
    .goto Eastern Plaguelands,72.6,63.7,0
    .goto Eastern Plaguelands,76.7,62.6,0
    .goto Eastern Plaguelands,74.8,58.9,0
    .goto Eastern Plaguelands,76.7,58.7,0
    .goto Eastern Plaguelands,55.6,67.0,0
    .goto Eastern Plaguelands,54.3,70.1,0
    .goto Eastern Plaguelands,51.9,70.0,0
    >>击杀并掠夺任意|cRXP_ENEMY_腐烂淤泥怪|r和|cRXP_ENEMY_腐朽软泥怪|r, 直到你获得 |T132108:0|t[|cRXP_LOOT_冒泡的绿色粘液|r]
    >>|cRXP_WARN_秽液是一种灰色物品, 小心不要卖给商人！|r
    .collect 20770,1 --Bubbling Green Ichor (1)
    .mob Living Decay
    .mob Rotting Sludge
step
    .goto Eastern Plaguelands,17.8,30.2
    >>前往恐惧谷, 击杀瘟疫野猪, 直到你获得战利品 [被污染的野猪肉]
    .collect 225942,1 --Tainted Boar Meat (1)
    .mob Plagued Swine
step
    >>使用 |T134046:0|t[|cRXP_LOOT_受污染的野猪肉|r] 与 |T132108:0|t[|cRXP_LOOT_冒泡的绿色粘液|r] 合成, 制作出 |T134047:0|t[腐臭的肉块]
    .collect 225943,1 --Rancid Hunk of Flesh (1)
    .use 225942
step
    .goto Eastern Plaguelands,22.68,37.12,-1
    .goto Eastern Plaguelands,19.37,26.42,-1
    .goto Eastern Plaguelands,29.83,39.05,-1
    >>寻找一个|cRXP_ENEMY_腐肉虫|r 或一个|cRXP_ENEMY_腐肉吞噬者|r. 距离恐惧谷最近的刷新点就在它的北面和南面
    >>使用 |T134047:0|t[腐臭的肉块] 喂食它. |cRXP_WARN_幼虫在短暂动画后会生成一具骷髅, 击败它可获得|r|T134419:0|t[|cRXP_FRIENDLY_足智多谋符文|r]
    .use 225943
    .collect 225955,1 --Rune of the resourceful (1)
    .mob Carrion Grub
    .mob Carrion Devourer
step
    .train 440557 >>使用 |T134419:0|t[|cRXP_FRIENDLY_机敏符文|r]|cRXP_WARN_进行训练|r|T132178:0|t[机敏]
    .use 225955
]])

RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文与书籍指南
    #subgroup Cloak
    #displayname Improved Volley
    #name 增强散射 - 60(希利苏斯)
step
    #completewith next
    .zone Silithus >>前往: |cRXP_PICK_希利苏斯|r
step
    >>在希利苏斯击杀|cRXP_WARN_ANY 怪物|r, 直到你获得 |T132997:0|t[|cRXP_LOOT_ 破碎的吉兹莫|r]. 掉落几率较低, 但该物品可能从区域内所有怪物身上掉落
    .collect 226526,1
    .itemcount 226546,<1
step
    .goto Silithus,41.2,88.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往铜须营地与|cRXP_FRIENDLY_Edwi Copperbolt|r交谈, 通过对话获取一个|T133878:0|t[沙漠声纳]
    .collect 226546,1 --Desert Sonar (1)
    .itemcount 226546,<1
step
    .goto Silithus,36.00,71.00
    >>|cRXP_WARN_在地图上标记的位置周围跑动, 直到看到地面开始移动. 当出现这种情况时, 使用|r|T133878:0|t[沙漠声纳]|cRXP_WARN_召唤一只|r|cRXP_ENEMY_沙虫|r. 击杀它并拾取符文|r
    >>这种虫子拥有大量生命值, 并具备钻洞能力, 可暂时消失. 在召唤它之前, 请确保已做好战斗准备
    .collect 226587,1 --rune of shelling
    .mob Sandworm
step
    .train 440560 >>使用 |T134419:0|t[|cRXP_FRIENDLY_炮击符文|r] 来训练 |T236179:0|t[|cRXP_FRIENDLY_强化连射|r]
    .use 226587
]])