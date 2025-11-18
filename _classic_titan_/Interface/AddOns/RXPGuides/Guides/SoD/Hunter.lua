RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 奇美拉射击-2（丹莫洛）
#title Chimera Shot


step
    +|cRXP_WARN_你必须至少达到 2 级才能单独获得|r |T133816:0|t[雕刻手套 - 奇美拉射击] |cRXP_WARN_in 丹莫洛|r
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
    .goto 1426,30.489,80.165,50 >>前往里面的 |cRXP_PICK_Frostmane Loot Cache|r
    .train 410121,1
step
    #label Rune
    .goto Dun Morogh,30.773,80.063
    >>打开里面地面上的 |cRXP_PICK_Frostmane Loot Cache|r。从中获取 |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r
    .collect 206168,1 -- Rune of the Chimera (1)
    .train 410121,1
step
    .train 410121 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 奇美拉射击]
    .use 206168
    .itemcount 206168,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 奇美拉射击 - 3（泰达希尔）
#title Chimera Shot

step
    +|cRXP_WARN_你必须至少达到 3 级才能单独获得|r |T133816:0|t[雕刻手套 - 奇美拉射击] |cRXP_WARN_in 泰达希尔|r
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
    .subzone 25 >>进入影线洞穴
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
    .goto 1438,56.874,26.323,10 >>前往 |cRXP_ENEMY_Githyiss the Vile|r 内部
    .train 410121,1
step
    #label Rune
    .goto Teldrassil,56.68,26.12
    >>杀死 |cRXP_ENEMY_Githyiss the Vile|r。掠夺她以获得 |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r
    .collect 206168,1 -- Rune of the Chimera (1)
    .mob Githyiss the Vile
    .train 410121,1
step
    .train 410121 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 奇美拉射击]
    .use 206168
    .itemcount 206168,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 爆炸射击 - 5（丹莫洛）
#title Explosive Shot

step
    +|cRXP_WARN_你必须至少达到 5 级才能单独获得|r |T133816:0|t[雕刻手套 - 爆炸射击] |cRXP_WARN_in 丹莫洛|r
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
    >>杀死 |cRXP_ENEMY_Fyodi|r。从他身上搜刮 |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r
    >>|cRXP_WARN_尽管 |cRXP_ENEMY_Fyodi|r 显示为精英，但他的生命值、伤害和护甲值与标准暴徒相同|r
    >>|cRXP_WARN_当他施放时要小心|r |T132337:0|t[冲锋] |cRXP_WARN_（自身瞬发：增加移动速度 3 秒，击中时造成 35-80 点近战伤害。仅可远距离施放）|r
    >>|cRXP_WARN_注意：|r |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r |cRXP_WARN_ 也可以掉落丹莫洛的所有稀有怪物，以及 |cRXP_ENEMY_Vagash|r、|cRXP_ENEMY_Mangeclaw|r 和|r |cRXP_ENEMY_Old Icebeard|r
    .collect 206169,1 --Rune of Explosive Shot (1)
    .mob Fyodi
    .train 410123,1
    .xp >10,1
step
    #label Rune
    .goto 1426,62.094,47.154,40,0
    .goto 1426,62.434,48.989,40,0
    .goto 1426,62.538,46.195
    >>杀死 |cRXP_ENEMY_Vagash|r。从他身上搜刮 |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r
    >>|cRXP_WARN_注意：|r |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r |cRXP_WARN_ 也可以掉落丹莫洛的所有稀有怪物，以及 |cRXP_ENEMY_Fyodi|r、|cRXP_ENEMY_Mangeclaw|r 和|r |cRXP_ENEMY_Old Icebeard|r
    .collect 206169,1 --Rune of Explosive Shot (1)
    .mob Vagash
    .train 410123,1
    .xp <10,1
step
    .train 410123 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r |cRXP_WARN_学习|r |T133816:0|t[雕刻手套 - 爆炸射击]
    .use 206169
    .itemcount 206169,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 爆炸射击 - 2（杜隆塔尔）
#title Explosive Shot


    --Rune of Explosive Shot

step
    #season 2
    .goto Durotar,40.60,66.80
    >>杀死 |cFFFF5722Sarkoth|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r]
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
#group RestedXP 符文书指南
#subgroup Gloves
#name 奇美拉射击 - 2（杜隆塔尔）
#title Chimera Shot


    --Rune of Chimera Shot

step << !Tauren
    #season 2
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cFF00FF25基沙|r
    .accept 77590 >>接受崎岖地形 << Troll Hunter
    .accept 77584 >>接受寻找符文 << Orc Hunter
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
    >>杀死 |cFFFF5722Scorpid Workers|r。掠夺他们以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of The Chimera|r]
    .collect 206168,1 --Rune of the Chimera (1)
    .mob Scorpid Worker
    .train 410121,1
step
    #season 2
    .train 410121 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of The Chimera|r]
    .use 206168
    .itemcount 206168,1
step << !Tauren
    #season 2
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cFF00FF25基沙|r
    .turnin 77590 >>在崎岖地形中转弯 << Troll Hunter
    .turnin 77584 >>交出“寻找符文” << Orc Hunter
    .target Jen'shan
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 奇美拉射击 - 2（莫高雷）
#title Chimera Shot


    --Rune of Chimera Shot

step << Tauren
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_兰卡·远箭|r
    .accept 77649 >>接受猎人的力量
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
    >>杀死 |cRXP_ENEMY_Bristleback Battleboars|r。拾取它们以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of The Chimera|r]
    .collect 206168,1 --Rune of the Chimera (1)
    .mob Bristleback Battleboar
    .train 410121,1
step
    #season 2
    .train 410121 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of The Chimera|r]
    .use 206168
    .itemcount 206168,1
step << Tauren
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_兰卡·远箭|r
    .turnin 77649 >>交出猎人的力量
    .target Lanka Farshot
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 神射手 - 6（杜隆塔尔）
#title Master Marksman


    --Rune of Master Marksman

step
    #season 2
    .goto Durotar,40.61,52.19
    >>对 |cRXP_ENEMY_Rustling Bush|r 施放 |T132212:0|t[猎人印记]
    >>杀死生成的 |cRXP_ENEMY_Razormane Poacher|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_Rune of Marksmanship|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Razormane Poacher
    .train 410113,1
step
    #season 2
    .train 410113 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神射符文|r]
    .use 206155
    .itemcount 206155,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 神射手-6（莫高雷）
#title Master Marksman


    --Rune of Master Marksman

step
    #season 2
    .goto Mulgore,59.02,54.36
    >>对 |cRXP_ENEMY_Rustling Bush|r 施放 |T132212:0|t[猎人印记]
    >>杀死生成的 |cRXP_ENEMY_Venture Co. Poacher|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_Rune of Marksmanship|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Venture Co. Poacher
    .train 410113,1
step
    #season 2
    .train 410113 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神射符文|r]
    .use 206155
    .itemcount 206155,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 神射手-6（丹莫洛）
#title Master Marksman


    --Rune of Master Marksman

step
    #season 2
    .goto Dun Morogh,28.852,49.859
    >>对 |cRXP_ENEMY_Rustling Bush|r 施放 |T132212:0|t[猎人印记]
    >>杀死生成的 |cRXP_ENEMY_Razormane Poacher|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_Rune of Marksmanship|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Razormane Poacher
    .train 410113,1
step
    #season 2
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神射符文|r]
    .use 206155
    .train 410113,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Chest
#name 神射手-6（泰达希尔）
#title Master Marksman


    --Rune of Master Marksman

step
    #season 2
    .goto Teldrassil,46.6,46.3
    >>对 |cRXP_ENEMY_Rustling Bush|r 施放 |T132212:0|t[猎人印记]
    >>杀死生成的 |cRXP_ENEMY_Fallenroot Poacher|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_Rune of Marksmanship|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob Rustling Bush
    .mob Fallenroot Poacher
    .train 410113,1
step
    #season 2
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神射符文|r]
    .use 206155
    .train 410113,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 侧翼进攻-6（莫高雷）
#title Flanking


    --Rune of Flanking

step
    #season 2
    .goto Mulgore,41.41,66.32,60,0
    .goto Mulgore,38.66,66.29,60,0
    .goto Mulgore,37.63,63.00,60,0
    .goto Mulgore,36.74,58.53
    >>杀死 |cRXP_ENEMY_Plainstriders|r 和 |cRXP_ENEMY_Swoops|r。掠夺他们以获得 |T134025:0|t[|cRXP_LOOT_Mulgore Bird Meat|r]
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
    >>在尸体上使用 |T134025:0|t[|cRXP_LOOT_Mulgore Bird Meat|r] 来召唤 |cRXP_ENEMY_Mokwa|r
    >>杀死他并从他身上夺取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Flanking|r]
    .collect 205979,1 --Rune of Flanking (1)
    .mob Mokwa
    .use 205961
    .train 425762,1
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r] |cRXP_WARN_进行训练|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 侧翼进攻 - 6 (杜隆塔尔)
#title Flanking


    --Rune of Flanking

step
    #season 2
    .goto Durotar,53.43,48.62,70,0
    .goto Durotar,51.77,56.01,70,0
    .goto Durotar,54.04,67.14
    >>杀死 |cRXP_ENEMY_Dire Mottled Boars|r。拾取它们以获得 |T134026:0|t[|cRXP_LOOT_Durotar Pig Meat|r]
    .collect 207590,1 --Durotar Pig Meat (1)
    .mob Dire Mottled Boar
    .train 425762,1
step
    #season 2
    .goto Durotar,68.67,71.68
    .use 207590 >>在尸体上使用 |T134026:0|t[|cRXP_LOOT_杜罗塔猪肉|r] 来召唤 |cRXP_ENEMY_Raluk|r
    >>杀死他并从他身上夺取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Flanking|r]
    .collect 205979,1 --Rune of Flanking (1)
    .mob Raluk
    .train 425762,1
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r] |cRXP_WARN_进行训练|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 雕刻 - 10（杜隆塔尔）
#title Carve


    --Rune of Carve

step
    #season 2
    #completewith n`t
    +|cRXP_WARN_你需要学会|r |T132164:0|t[驯服野兽] |cRXP_WARN_才能获得此符文|r
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
    >>杀死 |cRXP_ENEMY_钢鬃野猪人s|r。掠夺它们以获得 |T134743:0|t[|cRXP_LOOT_Adder Pheromone|r]
    .collect 207631,1 --Adder Pheromone (1)
    .mob 钢鬃野猪人
    .mob 钢鬃斥候
    .train 425758,1
step
    #season 2
    #completewith next
    +找到 |cRXP_ENEMY_Adder|r（小动物）。使用你的 |T134743:0|t[|cRXP_LOOT_Adder Pheromone|r] 并施放 |T132164:0|t[Tame Beast]
    >>|cRXP_WARN_在剃刀岭附近更容易找到它们|r
    .use 207631
    .unitscan Adder
step
    #season 2
    .goto Durotar,52.15,44.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Razzil|r
    >>交付 |cRXP_ENEMY_Adder|r 以接收 |T134419:0|t[|cRXP_FRIENDLY_Rune of Carve|r]
    .collect 206032,1 --Rune of Carve (1)
    .target Razzil
    .train 425758,1
step
    #season 2
    .train 425758 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Carve|r]
    .use 206032
    .itemcount 206032,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 雕刻 - 10（莫高雷）
#title Carve


    --Rune of Carve

step
    #season 2
    #completewith next
    +|cRXP_WARN_你需要学会|r |T132164:0|t[驯服野兽] |cRXP_WARN_才能获得此符文|r
step
    #season 2
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0
    >>杀死 |cRXP_ENEMY_Palemane Gnolls|r。掠夺他们以获得 |T134419:0|t[|cRXP_LOOT_Prairie Dog Musk|r]
    .collect 205995,1 --Prairie Dog Musk (1)
    .unitscan Snagglespear
    .mob Palemane Tanner
    .mob Palemane Skinner
    .mob Palemane Poacher
    .train 425758,1
step
    #season 2
    #completewith next
    +找到 |cRXP_ENEMY_Prairie Dog|r（小动物）。使用你的 |T134419:0|t[|cRXP_LOOT_Prairie Dog Musk|r] 并施放 |T132164:0|t[Tame Beast]
    >>|cRXP_WARN_它们在血蹄村东南边的路上更容易找到|r
    .use 205995
    .unitscan Prairie Dog
step
    #season 2
    .goto Mulgore,46.19,60.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Takoda|r
    >>交付 |cRXP_ENEMY_Prairie Dog|r 以接收 |T134419:0|t[|cRXP_FRIENDLY_Rune of Carve|r]
    .collect 206032,1 --Rune of Carve (1)
    .target Takoda Sunmane
    .train 425758,1
step
    #season 2
    .train 425758 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Carve|r]
    .use 206032
    .itemcount 206032,1

]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 雕刻 - 10（丹莫罗）
#title Carve


    --Rune of Carve
step
    #season 2
    #completewith next
    +|cRXP_WARN_你需要学会|r |T132164:0|t[驯服野兽] |cRXP_WARN_才能获得此符文|r
step
    #season 2
    #loop
    .goto Dun Morogh,68.2,56.2,20,0
    .goto Dun Morogh,68.8,58.2,20,0
    .goto Dun Morogh,71.0,58.0,20,0
    .goto Dun Morogh,71.0,58.0,20,0
    .goto Dun Morogh,72.6,52.6,20,0
    >>杀死 |cRXP_ENEMY_Rockjaw Troggs|r。掠夺他们以获得 |T134419:0|t[|cRXP_LOOT_Rabbit Musk。|r]
    .collect 208180,1 --Rabbit Musk (1)
    .mob Rockjaw Skullthumper
    .mob 岩颚骨撕咬者
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
    >>对 |cRXP_ENEMY_Rabbit|r |cRXP_WARN_不要解散你当前的宠物使用 |T134419:0|t[Rabbit Musk]。|r
    .use 208180
    .unitscan Rabbit
step
    #season 2
    .goto Dun Morogh,63.40,50.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Toby|r
    >>交付 |cRXP_ENEMY_Rabit|r 以接收 |T134419:0|t[|cRXP_FRIENDLY_Rune of Carve|r]
    .collect 206032,1 --Rune of Carve (1)
    .target Toby
    .train 425758,1
step
    #season 2
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Carve|r]
    .use 206032
    .train 425758,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 雕刻 - 10（泰达希尔）
#title Carve


    --Rune of Carve

step
    #season 2
    #completewith next
    +|cRXP_WARN_你需要学会|r |T132164:0|t[驯服野兽] |cRXP_WARN_才能获得此符文|r
step
    #season 2
    .goto Teldrassil,46.2,51.2,20,0
    .goto Teldrassil,46.8,54.6,20,0
    .goto Teldrassil,48.8,55.4,20,0
    .goto Teldrassil,71.0,58.0,20,0
    .goto Teldrassil,44.8,61.2
    >>杀死 |cRXP_ENEMY_Gnarlpines|r。掠夺他们以获得 |T134419:0|t[|cRXP_LOOT_Deer Musk|r]
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
    >>对 |cRXP_ENEMY_Deer|r |cRXP_WARN_不要解雇你当前的宠物使用 |T134419:0|t[亲爱的麝香]。|r
    .use 208607,1
    .unitscan Deer
step
    #season 2
    .goto Teldrassil,39.8,9.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Relaeron|r in |cFFfa9602Darnassus|r
    >>交付 |cRXP_ENEMY_Deer|r 以接收 |T134419:0|t[|cRXP_FRIENDLY_Rune of Carve|r]
    .collect 206032,1 --Rune of Carve (1)
    .target Relaeron
    .train 425758,1
step
    #season 2
    .cast 402265 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Carve|r]
    .use 206032
    .train 425758,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 兽王 - 16（贫瘠之地）
#title Beast Mastery

    --Rune of Beast Mastery

step
    #season 2
    #completewith next
    +|cRXP_WARN_你需要学会|r|T135813:0|t[献祭陷阱]|cRXP_WARN_或任何其他陷阱才能获得此符文|r
step
    #season 2
    .goto The Barrens,44.60,55.51,40,0
    .goto The Barrens,44.05,56.20,40,0
    .goto The Barrens,43.12,57.37
    .line The Barrens,44.60,55.51,44.60,55.51,43.12,57.37
    >>在 |cRXP_ENEMY_Patrolling Cheetah|r 的巡逻路径上使用 |T135813:0|t[献祭陷阱] 来移除他的增益效果
    >>杀死他并从他身上夺取 |T134419:0|t[|cRXP_FRIENDLY_兽王符文|r]
    .collect 208701,1 --Rune of Beast Mastery (1)
    .mob Patrolling Cheetah
    .train 410110,1
step
    #season 2
    .train 410110 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_兽王符文|r] |cRXP_WARN_进行训练|r |T132270:0|t[兽王]
    .use 208701
    .itemcount 208701,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Horde Hunter SoD
#group RestedXP 符文书指南
#subgroup Gloves
#name 兽王 - 16（银松森林）
#title Beast Mastery

    --Rune of Beast Mastery

step
    #season 2
    .goto Silverpine Forest,41.37,19.64,50,0
    .goto Silverpine Forest,41.60,21.65,50,0
    .goto Silverpine Forest,42.36,23.77,50,0
    .goto Silverpine Forest,44.67,24.84,50,0
    .goto Silverpine Forest,46.08,26.62,50,0
    .goto Silverpine Forest,41.60,21.65
    >>杀死 |cRXP_ENEMY_Ferocious Grizzled 熊s|r 直到 |cRXP_ENEMY_Grizzled Protecter|r (16 名精英) 出现
    >>杀死他并从他身上夺取 |T134419:0|t[|cRXP_FRIENDLY_兽王符文|r]
    .collect 208701,1 --Rune of Beast Mastery (1)
    .mob Ferocious Grizzled 熊
    .mob Grizzled Protecter
step
    #season 2
    .train 410110 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_兽王符文|r] |cRXP_WARN_进行训练|r |T132270:0|t[兽王]
    .use 208701
    .itemcount 208701,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 狙击手训练-18（黑海岸）
#title Sniper Training


    --Rune of the Sniper

step
    #season 2
    #completewith next
    .train 416091,1
    .zone Darkshore >>前往: |cRXP_PICK_黑海岸|r
step
    #season 2
    .goto 1439,44.081,20.739
    >>拾取骷髅眼中的|T135129:0|t[粗糙鱼叉]
    .collect 209047,1 --Gnarled Harpoon (1)
    .train 416091,1
step
    #completewith next
    .goto 1439,44.081,20.739
    .cast 422397 >>|cRXP_WARN_使用|r |T135129:0|t[Gnarled Harpoon] |cRXP_WARN_on |cRXP_ENEMY_Paxnozz|r 将他的最大生命值降低至 743|r
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
    >>杀死 |cRXP_ENEMY_Paxnozz|r。从他身上搜刮 |T134419:0|t|cRXP_LOOT_[狙击符文]|r
    >>|cRXP_WARN_小心，因为他是 20 级精英|r
    .collect 208777,1 --Rune of the Sniper (1)
    .train 416091,1
    .use 209047
    .mob Paxnozz
step
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r] |cRXP_WARN_进行训练|r |T132212:0|t[狙击手训练]
    .use 208777
    .itemcount 208777,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 狙击手训练-16（西部荒野）
#title Sniper Training


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
    >>杀死 |cRXP_ENEMY_Defias Scout|r。从他身上搜刮 |T134419:0|t[|cRXP_LOOT_Rune of the Sniper|r]
    .collect 208777,1
    .train 416091,1
    .mob Defias Scout
step
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r] |cRXP_WARN_进行训练|r |T132212:0|t[狙击手训练]
    .use 208777
    .itemcount 208777,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 狙击手训练-16（洛克莫丹）
#title Sniper Training


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
    >>杀死 |cRXP_ENEMY_Kackle|r。从他身上搜刮物品，获得 |T134419:0|t[|cRXP_LOOT_狙击手符文|r]
    .collect 208777,1
    .train 416091,1
    .mob Kackle
step
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r] |cRXP_WARN_进行训练|r |T132212:0|t[狙击手训练]
    .use 208777
    .itemcount 208777,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 侧翼进攻 - 7 (丹莫洛)
#title Flanking


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
    >>杀死 |cRXP_ENEMY_Boars|r。拾取它们以获得 |T134026:0|t[丹莫洛猪肉]
    .collect 208192,1
    .mob Crag Boar
    .mob Large Crag Boar
    .mob 老峭壁野猪
    .mob Scarred Crag Boar
step
    #season 2
    .train 425762,1
    .goto Dun Morogh,37.78,42.55
    >>在 |cFFfa9602Iceflow Cavern|r 中的尸体附近使用 |T134026:0|t[丹莫洛猪肉] 召唤 |cRXP_ENEMY_Jorul|r
    >>杀死 |cRXP_ENEMY_Jorul|r 并从他身上夺取 |T135142:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .use 208192
    .mob Jorul
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r] |cRXP_WARN_进行训练|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Alliance Hunter SoD
#group RestedXP 符文书指南
#subgroup Legs
#name 侧翼进攻 - 7（泰达希尔）
#title Flanking


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
    >>杀死 |cFFfa9602Teldrassil|r 中的 |cRXP_ENEMY_Birds|r 并掠夺它们以获得 |T134025:0|t[泰达希尔鸟肉]
    .collect 208608,1
    .mob 鸮
    .mob Strigid Screecher
    .mob Strigid Hunter
step
    #season 2
    .train 425762,1
    .goto Teldrassil,48.3,31.4
    >>在尸体附近使用 |T134025:0|t[泰达希尔鸟肉] 召唤 |cRXP_ENEMY_Mowgh|r
    >>杀死 |cRXP_ENEMY_Mowgh|r 并从他身上夺取 |T134419:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .use 208608
    .mob Mowgh
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r] |cRXP_WARN_进行训练|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文书指南
#subgroup Belt
#title Expose Weakness
#name 暴露弱点 - 40（艾泽拉斯）


-- Expose Weakness

step
    #optional
    .train 426445,1
    +|cRXP_WARN_你必须至少达到 26 级才能获得|r |T132353:0|t[Expose Weakness] |cRXP_WARN_rune|r
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
    .use 211269 >>杀死任意 |cRXP_ENEMY_Dustbelcher Ogre|r 或 |cRXP_ENEMY_Stonevault Trogg|r。拾取他们以获得 |T237388:0|t[|cRXP_LOOT_Primitive Drawing|r]
    >>|cRXP_WARN_使用|r |T237388:0|t[|cRXP_LOOT_Primitive Drawing|r] |cRXP_WARN_来开始任务|r
    >>|cRXP_WARN_它们的位置已标记在你的地图上|r
    .collect 211269,1,78823,1 --Primitive Drawing
    .accept 78823 >>接受“沙漠天空的恐怖”
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫米特·奈辛瓦里|r
    .turnin 78823 >>转入沙漠天空的恐怖
    .accept 78830 >>接受“沙漠天空的恐怖”
    .target 赫米特·奈辛瓦里
    .train 410114,1
step
    #loop
    .goto Stranglethorn Vale,43.8,18.6,20,0
    .goto Stranglethorn Vale,45.2,19.6,20,0
    .goto Stranglethorn Vale,44.2,22.0,20,0
    .goto Stranglethorn Vale,45.6,23,0,20,0
    .use 211272 >>|cRXP_WARN_在荆棘谷中使用 |r |T132599:0|t[空诱饵笼] |cRXP_WARN_on |cRXP_ENEMY_Arbor 狼蛛|r 小动物。它们位于树桩顶部|r
    >>|cRXP_WARN_你也可以将它用在世界上看到的任何其他生物上|r
    .collect 211273,1 --Trapped Critter
    .mob Arbor 狼蛛
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
    +点击山顶的 |cRXP_PICK_Large Nest|r 召唤 |cRXP_ENEMY_Gharik|r
    .itemcount 211272,<1
step
    .goto Badlands,22.352,67.733
    >>杀死 |cRXP_ENEMY_Gharik|r。掠夺她以获得 |cRXP_LOOT_Crimson Trophy Quill|r
    .complete 78830,1 --Crimson Trophy Quill (1)
    .mob Gharik
    .train 410114,1
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
    .train 410114,1
step
    .goto Stranglethorn Vale,35.658,10.808
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫米特·奈辛瓦里|r
    .turnin 78830 >>转入沙漠天空的恐怖
    .target 赫米特·奈辛瓦里
    .train 410114,1
step
    #season 2
    .train 410114 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_暴露弱点符文|r] |cRXP_WARN_进行训练|r |T132353:0|t[暴露弱点]
    .use 211301
    .itemcount 211301,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文书指南
#subgroup Belt
#title Steady Shot
#name 稳固射击 - 30（阿拉希高地）

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
    >>击杀 |cRXP_ENEMY_Needletooth|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_稳固射击符文|r]
    >>|cRXP_ENEMY_Needletooth|r |cRXP_WARN_是一条在枯木村湖里游动的鱼|r
    .collect 213122,1
    .mob Needletooth
step
    .train 410109 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_稳固射击符文|r] |cRXP_WARN_进行训练|r |T132213:0|t[稳固射击]
    .use 213122
    .itemcount 213122,1
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文书指南
#subgroup Boots
#title Dual-Wield Specialization
#name 双持专精-32（荆棘谷）

step
    #optional
    .train 410116,1
    +|cRXP_WARN_你必须至少达到 32 级才能获得|r |T132147:0|t[双持专精] |cRXP_WARN_rune|r
    .xp >32,1
step
    .train 410116,1
    #optional
    .train 1543 >>|cRXP_WARN_你必须训练|r |T135815:0|t[Flare] |cRXP_WARN_才能获得|r |T132147:0|t[Dual-Wield Specialization] |cRXP_WARN_rune|r
step
    #completewith next
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
step
    .train 410116,1
    .goto Stranglethorn Vale,31.84,15.61
    +|cRXP_WARN_前往箭头位置并四处奔跑，直到名为 |r |T132118:0|t[危险！] |cRXP_WARN_ 的增益效果出现在你身上|r
    .aura 435548
    .aura 435428
    .aura 435546
step
    .train 410116,1
    .goto Stranglethorn Vale,31.84,15.61
    #completewith next
    .cast 1543 >>|cRXP_WARN_施放|r |T135815:0|t[闪光] |cRXP_WARN_揭露|r |cRXP_ENEMY_Bloodscalp Guerrilla|r
    .usespell 1543
step
    .train 410116,1
    .goto Stranglethorn Vale,31.84,15.61
    >>杀死 |cRXP_ENEMY_Bloodscalp Guerrilla|r。从他身上搜刮物品，获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Scrapper|r]
    .collect 213126,1
    .mob Bloodscalp Guerrilla
step
    .itemcount 213126,1
    .use 213126
    .train 410116 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_废料符文|r] |cRXP_WARN_训练|r |T132147:0|t[双持专长]
]])

RXPGuides.RegisterGuide([[
#classic
<< Hunter SoD
#group RestedXP 符文书指南
#subgroup Bracers
#title Focus Fire
#name 集中火力 - 40（灼热峡谷）

step
    #completewith next
    +|cRXP_WARN_您必须在敌对区域杀死 45 级怪物才能获得此符文。如果您的等级较低，请务必寻求帮助|r
    .xp <45,1
step
    .goto Searing Gorge,53.10,55.85
    >>小心地沿着树枝走向鸟巢。从鸟巢中拾取 |cRXP_PICK_Stormcrow Egg|r。
    .collect 221544,1 --Stormcrow Egg
step
    .goto 1427/0,-1532.400,-6953.600
    >>沿着树枝往回走。等待几秒钟，|cRXP_ENEMY_Enraged Stormcrow|r 就会出现。杀死它并拾取 |T134419:0|t[|cRXP_FRIENDLY_Rune of Focused Fire|r]
    .collect 221445,1
    .mob Enraged Stormcrow
    .train 431601,1
step
    .itemcount 221445,1
    .use 221445
    .train 431601 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_聚焦射击符文|r] |cRXP_WARN_进行训练|r |T135548:0|t[聚焦射击]
 ]])

 RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文书指南
    #subgroup Bracers
    #title Raptor Fury
    #name 猛禽之怒 - 40（塔纳利斯）

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
    >>击杀 |cRXP_ENEMY_Zopilote|r。拾取它以获得 |T134419:0|t[|cRXP_FRIENDLY_Rune of The Raptor|r]
    >>|cRXP_ENEMY_Zopilote|r |cRXP_WARN_是一只食腐鸟，从东到西巡逻，范围从沙哀岗哨南部到加基森|r
    >>提示：您可以使用 |T132172:0|t[|cRXP_FRIENDLY_Eagle Eye|r] 侦察他的位置，而不是四处奔跑。如果你找不到他，他可能已经死了，应该会在地图上标有“2+”的位置附近重生
    .collect 220687,1
    .unitscan Zopilote
    .train 416093,1
step
    .train 416093 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_猛禽符文|r] |cRXP_WARN_训练|r |T132253:0|t[猛禽之怒]
    .use 2220687
    .itemcount 220687,1

    ]])
RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文书指南
    #subgroup Helmet
    #title Catlike Reflexes
    #name 猫般的反射 - 40（菲拉斯）

step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
step
    +|cRXP_WARN_你需要 |T133951:0|t|cRXP_PICK_Soft Banana Bread|r 或 |T133980:0|t|cRXP_PICK_Tel'Abim Banana|r 中的一个来获取此符文。|cRXP_FRIENDLY_Madrack Greenwell|r 在 Feathermoon 为联盟出售面包。|cRXP_FRIENDLY_Innkeeper Greul|r 在 Camp Mojache 为部落出售面包。
    .itemcount 4601,<1 --Soft Banana Bread
    .itemcount 4537,<1 --Tel'Abim Banana
    .target Innkeeper Greul
    .target Madrack Greenwell
    .train 416083,1
step
    >>前往荒野高地的雪人洞穴
    .goto 1444/1,1599.300,-4977.800,10
    .train 416083,1
step
    .goto 1444/1,1778.900,-5179.100,
    >>进入第二个洞穴后，在十字路口走中间的路。在它的后面你会发现一个|cRXP_FRIENDLY_Groddoc Infant|r
    .gossip 222376,1 >>完成猴子对话来喂它 |T133951:0|t|cRXP_PICK_Soft Banana Bread|r 或 |T133980:0|t|cRXP_PICK_Tel'Abim Banana|r。它将生成一个跟随你的版本。
    .target Groddoc Infant
    .train 416083,1
step
    .goto 1444/1,1330.900,-5078.100
    >>护送 |cRXP_FRIENDLY_Groddoc Infant|r 到地图上标记的 |cRXP_FRIENDLY_Groddoc Matriarch|r。小心，婴儿具有攻击性，会攻击附近的敌人，包括敌对阵营的玩家。
    .gossip 222406,1 >>到达那里后，与女族长交谈并完成她的对话以接收 |T134419:0|t[|cRXP_FRIENDLY_丛林​​猫符文|r]
    .collect 220791,1 -- Rune of the Jungle Cat
    .train 416083,1
step
    .train 416083 >>使用 |T134419:0|t[|cRXP_FRIENDLY_丛林​​猫符文|r] |cRXP_WARN_训练|r |T132167:0|t[猫科动物反射]
    .use 220791
]])

RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文书指南
    #subgroup Helmet
    #title Rapid Killing
    #name 快速杀戮 - 45 (灼热峡谷诅咒之地)
step
    #completewith next
    .zone Searing Gorge >>前往: |cRXP_PICK_灼热峡谷|r
step
    .goto 1427/0,-832.800,-6647.500,10
    >>前往 Firewatch Ridge 的洞穴入口。请注意，您需要进入一个充满 47-48 级精英的洞穴。话虽如此，也可以使用死亡奔跑来完成这一部分。
    .train 416090,1
step
    .goto Searing Gorge,14.5,36.5
    >>|cRXP_WARN_进入洞穴后，走右边的路。你很快就会看到洞穴中部高地上有一块名为 |cRXP_FRIENDLY_Weathered Etching|r 的大石碑。跑过去接受任务。
    >>提示：如果您是独自一人，请尝试使用陷阱和宠物尽可能地走远，然后再使用 |T132293:0|t[|cRXP_FRIENDLY_Feign Death|r] 来消除怪物的仇恨。或者，您也可以使用尸体奔跑来获取物品。
    .accept 81900 >>接受燃烧野兽
step
    #completewith next
    .zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step
    .goto Blasted Lands,50.6,14.2
    >>对话: |cRXP_FRIENDLY_血法师莱诺雷|r
    .turnin 81900 >>交出燃烧的野兽
    .accept 81917 >>接受束缚的锁链
    .target Bloodmage Lynnore
step
    .goto Blasted Lands,64.24,32.36
    >>前往 Shadowsworn 洞穴区域并杀死任何 |cRXP_ENEMY_Shadowsworn Cultist, Thug 或 Adept|r 以获得 |cRXP_LOOT_Infernal Chains|r
    .complete 81917,1 --Infernal Chains 5/5
    .mob Shadowsworn Cultist
    .mob Shadowsworn Thug
    .mob Shadowsworn Adept
step
    .goto Blasted Lands,50.6,14.2
    >>对话: |cRXP_FRIENDLY_血法师莱诺雷|r
    .turnin 81917 >>交出束缚之锁链
    .accept 81919 >>接受屈服
    .target Bloodmage Lynnore
step
    #loop
    .goto 1419/0,-2976.500,-11483.101
    .goto 1419/0,-2778.300,-11420.800
    .goto 1419/0,-2821.900,-11353.700
    .goto 1419/0,-2934.700,-11419.101
    >>寻找 |cRXP_ENEMY_Calefactus the Unleashed|r 一只 50 级绿色熔岩猎犬。他在地图红色部分的南部边缘周围有多个刷新点。尝试使用 |T132172:0|t[|cRXP_FRIENDLY_Eagle Eye|r] 寻找他。找到他后，对他使用 |T136091:0|t|cRXP_LOOT_Infernal Lasso|r，杀死他，然后掠夺他的血液。
    .complete 81919,1 --Fel Lifeblood 1/1
    .use 220216
    .unitscan Calefactus the Unleashed
step
    .goto Blasted Lands,50.6,14.2
    >>对话: |cRXP_FRIENDLY_血法师莱诺雷|r
    .turnin 81919 >>让特宁屈服
    .target Bloodmage Lynnore
step
    .train 416090 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Ravenous|r] |cRXP_WARN_训练|r |T132205:0|t[Rapid Killing]
    >>你还收到了一个 |T136091:0|t|cRXP_LOOT_Infernal Lasso|r 饰品，可用于驯服熔岩猎犬
    .use 220217
]])

RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文书指南
    #subgroup 披风
    #title Hit and Run
    #name 肇事逃逸 - 50（燃烧平原）
step
    #completewith next
    .zone Burning Steppes >>前往: |cRXP_PICK_燃烧平原|r
step
    >>寻找 |cRXP_ENEMY_Escaped 熔核猎犬|r 他可能在区域的多个地点生成，|cRXP_WARN_检查地图上可能生成地点的路径点|r。从他身上抢走符文
    >>提示：你可以使用 |T132172:0|t[|cRXP_FRIENDLY_Eagle Eye|r] 来侦察他的位置，而不必到处跑。
    .goto Burning Steppes,84.8,68.0,0
    .goto Burning Steppes,83.8,60.0,0
    .goto Burning Steppes,88.6,54.8
    .goto Burning Steppes,61.6,54.4,0
    .goto Burning Steppes,39.8,59.4,0
    .goto Burning Steppes,31.8,53.0,0
    .goto Burning Steppes,24.8,55.6,0
    .unitscan Escaped 熔核猎犬
    .collect 226252,1 --rune of the guerrilla (1)
step
    .train 440563 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Guerrilla|r] |cRXP_WARN_进行训练|r |T132171:0|t[Hit and Run]
    .use 226252
]])

RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文书指南
    #subgroup 披风
    #title Resourcefulness
    #name 足智多谋 - 58（东瘟疫之地）
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
    >>杀死并掠夺任何 |cRXP_ENEMY_Rotting Sludges|r 和 |cRXP_ENEMY_Living Decay|r 直到你掠夺 |T132108:0|t[|cRXP_LOOT_Bubbling Green Ichor|r]
    >>|cRXP_WARN_脓液是灰色物品，小心不要将其出售！|r
    .collect 20770,1 --Bubbling Green Ichor (1)
    .mob Living Decay
    .mob Rotting Sludge
step
    .goto Eastern Plaguelands,17.8,30.2
    >>前往恐怖谷并杀死 |cRXP_ENEMY_Plagued Swines|r 直到你掠夺 |T134046:0|t[|cRXP_LOOT_Tainted Boar Meat|r]
    .collect 225942,1 --Tainted Boar Meat (1)
    .mob Plagued Swine
step
    >>使用 |T134046:0|t[|cRXP_LOOT_Tainted Boar Meat|r] 将其与 |T132108:0|t[|cRXP_LOOT_Bubbling Green Ichor|r] 结合并制作 |T134047:0|t[Rancid Hunk of Flesh]
    .collect 225943,1 --Rancid Hunk of Flesh (1)
    .use 225942
step
    .goto Eastern Plaguelands,22.68,37.12,-1
    .goto Eastern Plaguelands,19.37,26.42,-1
    .goto Eastern Plaguelands,29.83,39.05,-1
    >>寻找 |cRXP_ENEMY_Carrion Grub|r 或 |cRXP_ENEMY_Carrion Devourer|r。距离恐怖谷最近的可能产卵点就在它的北面和南面
    >>使用 |T134047:0|t[腐臭的肉块] 来喂养它。|cRXP_WARN_幼虫会在短暂的动画后生成一具骷髅，将其拾取以获得|r |T134419:0|t[|cRXP_FRIENDLY_足智多谋符文|r]
    .use 225943
    .collect 225955,1 --Rune of the resourceful (1)
    .mob Carrion Grub
    .mob Carrion Devourer
step
    .train 440557 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of the Resourceful|r] |cRXP_WARN_进行训练|r |T132178:0|t[Resourcefulness]
    .use 225955
]])

RXPGuides.RegisterGuide([[
    #classic
    << Hunter SoD
    #group RestedXP 符文书指南
    #subgroup 披风
    #title Improved Volley
    #name 改进齐射 - 60（希利苏斯）
step
    #completewith next
    .zone Silithus >>前往: |cRXP_PICK_希利苏斯|r
step
    >>在希利苏斯杀死 |cRXP_WARN_ANY 怪物|r，直到你获得 |T132997:0|t[|cRXP_LOOT_Busted Gizmo|r]。掉落率相对较低，但它可以从区域内的所有怪物身上掉落
    .collect 226526,1
    .itemcount 226546,<1
step
    .goto Silithus,41.2,88.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Edwi Copperbolt|r at the Bronzebeard Encampment. 回顾他的对话 to receive a |T133878:0|t[Desert Sonar]
    .collect 226546,1 --Desert Sonar (1)
    .itemcount 226546,<1
step
    .goto Silithus,36.00,71.00
    >>|cRXP_WARN_绕着地图上标记的位置跑，直到看到地面移动。看到地面移动时，使用|r |T133878:0|t[沙漠声纳] |cRXP_WARN_召唤 |cRXP_ENEMY_Sandworm|r。杀死它并拾取符文|r
    >>蠕虫具有大量的生命值和潜行能力，可以让它消失一段时间。在生成它之前，请确保你已经做好了战斗的准备
    .collect 226587,1 --rune of shelling
    .mob Sandworm
step
    .train 440560 >>使用 |T134419:0|t[|cRXP_FRIENDLY_Rune of Shelling|r] 来训练 |T236179:0|t[|cRXP_FRIENDLY_Improved Volley|r]
    .use 226587
]])