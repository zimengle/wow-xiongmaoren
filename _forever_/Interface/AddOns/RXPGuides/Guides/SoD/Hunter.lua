RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Chimera Shot - 2 (Dun Morogh)
#title 奇美拉射击
#displayname 奇美拉射击 - 2（丹莫罗）
step
    +|cRXP_WARN_你至少应达到2级，才能独自在丹莫罗获取|r |T133816:0|t[铭刻手套 - 奇美拉射击] |cRXP_WARN_符文|r
    .train 410121,1
    .xp 2,1
    .itemcount 206168,<1
step
    #completewith Rune
    #label Dun1
    .zone Dun Morogh >> 前往丹莫罗
    .train 410121,1
    .itemcount 206168,<1
step
    #optional
    #requires Dun1
    #label FrostMCave1
    #completewith Rune
    .goto 1426,27.098,80.707,20 >> 进入霜鬃洞穴
    .train 410121,1
    .itemcount 206168,<1
step
    #optional
    #requires FrostMCave1
    #completewith Rune
    .goto 1426,28.298,79.836,15,0
    .goto 1426,29.252,79.043,15,0
    .goto 1426,30.489,80.165,50 >> 前往内部的 |cRXP_PICK_霜鬃战利品箱|r
    .train 410121,1
    .itemcount 206168,<1
step
    #label Rune
    .goto Dun Morogh,30.773,80.063
    >>打开洞穴内地上的|cRXP_PICK_霜鬃战利品箱|r，拾取|T134419:0|t|cRXP_LOOT_[奇美拉符文]|r
    .collect 206168,1 -- Rune of the Chimera (1)
    .train 410121,1
    .itemcount 206168,<1
step
    .train 410121 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r |cRXP_WARN_来学习|r |T133816:0|t[铭刻手套 - 奇美拉射击]
    .use 206168
    .itemcount 206168,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Chimera Shot - 3 (Teldrassil)
#title 奇美拉射击
#displayname 奇美拉射击 - 3（泰达希尔）
step
    +|cRXP_WARN_你至少应达到3级，才能独自在泰达希尔获取|r |T133816:0|t[铭刻手套 - 奇美拉射击] |cRXP_WARN_符文|r
    .train 410121,1
    .xp 3,1
    .itemcount 206168,<1
step
    #completewith Rune
    #label Teld1
    .zone Teldrassil >> 前往泰达希尔
    .train 410121,1
    .itemcount 206168,<1
step
    #optional
    #requires Teld1
    #label ShadowCave1
    #completewith Rune
    .goto 1438,56.694,31.485
    .subzone 25 >> 进入黑丝洞
    .train 410121,1
    .itemcount 206168,<1
step
    #optional
    #requires ShadowCave1
    #completewith Rune
    .goto 1438,56.137,24.971,15,0
    .goto 1438,55.785,25.341,15,0
    .goto 1438,56.137,24.971,15,0
    .goto 1438,56.358,25.242,20,0
    .goto 1438,56.654,26.430,50,0
    .goto 1438,56.874,26.323,10 >> 前往内部的 |cRXP_ENEMY_邪恶的基塞伊斯|r
    .train 410121,1
    .itemcount 206168,<1
step
    #label Rune
    .goto Teldrassil,56.68,26.12
    >>击杀|cRXP_ENEMY_邪恶的基塞伊斯|r，拾取|T134419:0|t|cRXP_LOOT_[奇美拉符文]|r
    .collect 206168,1 -- Rune of the Chimera (1)
    .mob 邪恶的基塞伊斯
    .train 410121,1
    .itemcount 206168,<1
step
    .train 410121 >>|cRXP_WARN_使用|r |T134419:0|t|cRXP_LOOT_[奇美拉符文]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 奇美拉射击]
    .use 206168
    .itemcount 206168,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Explosive Shot - 5 (Dun Morogh)
#title 爆炸射击
#displayname 爆炸射击 - 5（丹莫罗）
step
    +|cRXP_WARN_建议至少达到5级，再单独在丹莫罗获取|r|T133816:0|t[铭刻手套 - 爆炸射击]|cRXP_WARN_符文|r
    .train 410123,1
    .xp 5,1
    .itemcount 206169,<1
step
    #completewith Rune
    .zone Dun Morogh >>前往丹莫罗
    .train 410123,1
    .itemcount 206169,<1
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
    >>击杀|cRXP_ENEMY_菲欧迪|r，拾取他掉落的|T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r
    >>|cRXP_WARN_虽然|cRXP_ENEMY_菲欧迪|r显示为精英，但他的生命值、伤害和护甲与普通怪物相同|r
    >>|cRXP_WARN_小心他施放|r|T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒，命中时造成35-80点近战伤害。只能在远距离施放）|r
    >>|cRXP_WARN_注意：|r|T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r|cRXP_WARN_也可由丹莫罗的所有稀有怪物，以及|cRXP_ENEMY_瓦加什|r、|cRXP_ENEMY_癞爪|r和|r|cRXP_ENEMY_冰须|r掉落
    .collect 206169,1 --Rune of Explosive Shot (1)
    .mob 菲欧迪
    .train 410123,1
    .xp 10,1
    .itemcount 206169,<1
step
    .goto 1426,62.094,47.154,40,0
    .goto 1426,62.434,48.989,40,0
    .goto 1426,62.538,46.195
    >>击杀|cRXP_ENEMY_瓦加什|r，拾取他掉落的|T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r
    >>|cRXP_WARN_注意：|r|T134419:0|t|cRXP_LOOT_[爆炸射击符文]|r|cRXP_WARN_也可由丹莫罗的所有稀有怪物，以及|cRXP_ENEMY_菲欧迪|r、|cRXP_ENEMY_癞爪|r和|r|cRXP_ENEMY_冰须|r掉落
    .collect 206169,1 --Rune of Explosive Shot (1)
    .mob 瓦加什
    .train 410123,1
    .xp <10,1
    .itemcount 206169,<1
step
    #label Rune
    .train 410123 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_LOOT_爆炸射击符文|r] |cRXP_WARN_来学习|r |T133816:0|t[铭刻手套 - 爆炸射击]
    .use 206169
    .itemcount 206169,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Explosive Shot - 2 (Durotar)
#title 爆炸射击
    --Rune of Explosive Shot
#displayname 爆炸射击 - 2（杜隆塔尔）
step
    #season 2
    .goto Durotar,40.60,66.80
    >>击杀|cFFFF5722萨科斯|r，拾取|T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r]
    .collect 206169,1 --Rune of Explosive Shot (1)
    .mob 萨科斯
    .train 410123,1
    .itemcount 206169,<1
step
    #season 2
    .train 410123 >>使用 |T134419:0|t[|cRXP_FRIENDLY_爆炸射击符文|r]
    .use 206169
    .itemcount 206169,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Chimera Shot - 2 (Durotar)
#title 奇美拉射击
    --Rune of Chimera Shot
#displayname 奇美拉射击 - 2（杜隆塔尔）
step << !Tauren
    #season 2
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cFF00FF25基沙|r交谈
    .accept 77590 >>接任务：崎岖地形 << Troll Hunter
    .accept 77584 >>接任务：符文狩猎 << Orc Hunter
    .target 基沙
    .train 410121,1
    .itemcount 206168,<1
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
    >>击杀|cFFFF5722蝎子|r，拾取它们掉落的|T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]
    .collect 206168,1 --Rune of the Chimera (1)
    .mob 蝎子
    .train 410121,1
    .itemcount 206168,<1
step
    #season 2
    .train 410121 >>使用 |T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]
    .use 206168
    .itemcount 206168,1
step << !Tauren
    #season 2
    .isOnQuest 77590 << Troll
    .isOnQuest 77584 << Orc
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cFF00FF25基沙|r交谈
    .turnin 77590 >>交任务：崎岖地形 << Troll Hunter
    .turnin 77584 >>交任务：符文狩猎 << Orc Hunter
    .target 基沙
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Chimera Shot - 2 (Mulgore)
#title 奇美拉射击
    --Rune of Chimera Shot
#displayname 奇美拉射击 - 2（莫高雷）
step << Tauren
    #season 2
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .accept 77649 >>接受任务 猎人的力量
    .target 兰卡·远箭
    .train 410121,1
    .itemcount 206168,<1
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
    >>击杀|cRXP_ENEMY_刺背斗猪|r，拾取|T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]
    .collect 206168,1 --Rune of the Chimera (1)
    .mob 刺背斗猪
    .train 410121,1
    .itemcount 206168,<1
step
    #season 2
    .train 410121 >>使用 |T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r]
    .use 206168
    .itemcount 206168,1
step << Tauren
    #season 2
    .isOnQuest 77649
    .goto Mulgore,44.26,75.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .turnin 77649 >>交任务 猎人的力量
    .target 兰卡·远箭
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Master Marksman - 6 (Durotar)
#title 神射手
    --Rune of Master Marksman
#displayname 神射手 - 6（杜隆塔尔）
step
    #season 2
    .goto Durotar,40.61,52.19
    >>施放|T132212:0|t[猎人印记]，目标为|cRXP_ENEMY_沙沙作响的灌木丛|r
    >>击杀出现的|cRXP_ENEMY_钢鬃偷猎者|r，拾取|T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob 沙沙作响的灌木丛
    .mob 钢鬃偷猎者
    .train 410113,1
    .itemcount 206155,<1
step
    #season 2
    .train 410113 >>使用 |T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .use 206155
    .itemcount 206155,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Master Marksman - 6 (Mulgore)
#title 神射手
    --Rune of Master Marksman
#displayname 神射手 - 6（莫高雷）
step
    #season 2
    .goto Mulgore,59.02,54.36
    >>施放|T132212:0|t[猎人印记]，目标选择|cRXP_ENEMY_沙沙作响的灌木丛|r
    >>击杀出现的|cRXP_ENEMY_风险投资公司偷猎者|r，拾取|T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob 沙沙作响的灌木丛
    .mob 风险投资公司偷猎者::205700
    .train 410113,1
    .itemcount 206155,<1
step
    #season 2
    .train 410113 >>使用|T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .use 206155
    .itemcount 206155,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Master Marksman - 6 (Dun Morogh)
#title 神射手
    --Rune of Master Marksman
#displayname 神射手 - 6（丹莫罗）
step
    #season 2
    .goto Dun Morogh,28.852,49.859
    >>施放|T132212:0|t[猎人印记]，目标为|cRXP_ENEMY_沙沙作响的灌木丛|r
    >>击杀出现的|cRXP_ENEMY_钢鬃偷猎者|r，从他身上拾取|T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob 沙沙作响的灌木丛::208975
    .mob 钢鬃偷猎者
    .train 410113,1
    .itemcount 206155,<1
step
    #season 2
    .train 410113 >>使用|T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .use 206155
    .itemcount 206155,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Master Marksman - 6 (Teldrassil)
#title 神射手
    --Rune of Master Marksman
#displayname 神射手 - 6（泰达希尔）
step
    #season 2
    .goto Teldrassil,46.6,46.3
    >>施放 |T132212:0|t[猎人印记]，目标为 |cRXP_ENEMY_沙沙作响的灌木丛|r
    >>击杀现身的|cRXP_ENEMY_堕根偷猎者|r，拾取|T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .collect 206155,1 --Rune of Marksmanship (1)
    .mob 沙沙作响的灌木丛
    .mob 堕根偷猎者::209812
    .train 410113,1
    .itemcount 206155,<1
step
    #season 2
    .train 410113 >>使用|T134419:0|t[|cRXP_FRIENDLY_神射手符文|r]
    .use 206155
    .itemcount 206155,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Flanking - 6 (Mulgore)
#title 侧翼打击
    --Rune of Flanking
#displayname 侧翼打击 - 6（莫高雷）
step
    #season 2
    .goto Mulgore,41.41,66.32,60,0
    .goto Mulgore,38.66,66.29,60,0
    .goto Mulgore,37.63,63.00,60,0
    .goto Mulgore,36.74,58.53
    >>击杀|cRXP_ENEMY_平原陆行鸟|r和|cRXP_ENEMY_猛鹫|r，拾取|T134025:0|t[|cRXP_LOOT_莫高雷鸟肉|r]
    .collect 205961,1 --Mulgore Bird Meat (1)
    .mob 老平原陆行鸟
    .mob 成年平原陆行鸟
    .mob 猛鹫
    .mob 消瘦的猛鹫
    .mob 长爪猛鹫
    .train 425762,1
    .itemcount 205979,<1
step
    #season 2
    .goto Mulgore,35.22,57.42
    >>在尸骸处使用|T134025:0|t[|cRXP_LOOT_莫高雷鸟肉|r]，召唤|cRXP_ENEMY_默克瓦|r
    >>击杀它，拾取|T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r]
    .collect 205979,1 --Rune of Flanking (1)
    .mob 默克瓦
    .use 205961
    .train 425762,1
    .itemcount 205979,<1
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r] |cRXP_WARN_学习|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Flanking - 6 (Durotar)
#title 侧翼打击
    --Rune of Flanking
#displayname 侧翼打击 - 6（杜隆塔尔）
step
    #season 2
    .goto Durotar,53.43,48.62,70,0
    .goto Durotar,51.77,56.01,70,0
    .goto Durotar,54.04,67.14
    >>击杀|cRXP_ENEMY_可怕的杂斑野猪|r，拾取其掉落的|T134026:0|t[|cRXP_LOOT_杜隆塔尔猪肉|r]
    .collect 207590,1 --Durotar Pig Meat (1)
    .mob 可怕的杂斑野猪
    .train 425762,1
    .itemcount 205979,<1
step
    #season 2
    .goto Durotar,68.67,71.68
    .use 207590 >>在尸体旁使用|T134026:0|t[|cRXP_LOOT_杜隆塔尔猪肉|r]，召唤|cRXP_ENEMY_莱卢克|r
    >>击杀它，拾取其掉落的|T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r]
    .collect 205979,1 --Rune of Flanking (1)
    .mob 莱卢克
    .train 425762,1
    .itemcount 205979,<1
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r] |cRXP_WARN_学习|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Carve - 10 (Durotar)
#title 削凿
    --Rune of Carve
#displayname 削凿 - 10（杜隆塔尔）
step
    #season 2
    #completewith next
    +|cRXP_WARN_必须先学会|r|T132164:0|t[驯服野兽]|cRXP_WARN_，才能获取此符文|r
    .train 425758,1
    .itemcount 206032,<1
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
    >>击杀|cRXP_ENEMY_钢鬃野猪人|r，拾取他们掉落的|T134743:0|t[|cRXP_LOOT_蝰蛇信息素|r]
    .collect 207631,1 --Adder Pheromone (1)
    .mob 钢鬃野猪人
    .mob 钢鬃斥候
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    #completewith next
    +寻找一条|cRXP_ENEMY_蝰蛇|r（小动物）。使用|T134743:0|t[|cRXP_LOOT_蝰蛇信息素|r]，然后施放|T132164:0|t[驯服野兽]
    >>|cRXP_WARN_剃刀岭周围更容易找到它们|r
    .use 207631
    .unitscan 蝰蛇
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    .goto Durotar,52.15,44.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱基尔|r交谈
    >>交付|cRXP_ENEMY_蝰蛇|r，获得|T134419:0|t[|cRXP_FRIENDLY_削凿符文|r]
    .collect 206032,1 --Rune of Carve (1)
    .target 莱基尔
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    .train 425758 >>使用 |T134419:0|t[|cRXP_FRIENDLY_削凿符文|r]
    .use 206032
    .itemcount 206032,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Carve - 10 (Mulgore)
#title 削凿
    --Rune of Carve
#displayname 削凿 - 10（莫高雷）
step
    #season 2
    #completewith next
    +|cRXP_WARN_必须先学会|r |T132164:0|t[驯服野兽] |cRXP_WARN_才能获取此符文|r
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0,90,0
    .goto Mulgore,53.5,73.0,90,0
    .goto Mulgore,48.3,72.0
    >>击杀|cRXP_ENEMY_白鬃豺狼人|r，拾取|T134419:0|t[|cRXP_LOOT_土拨鼠麝香|r]
    .collect 205995,1 --Prairie Dog Musk (1)
    .unitscan 断矛
    .mob 白鬃制革工
    .mob 白鬃剥皮工
    .mob 白鬃偷猎者
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    #completewith next
    +找到一只|cRXP_ENEMY_草原土拨鼠|r（小动物），使用|T134419:0|t[|cRXP_LOOT_土拨鼠麝香|r]并施放|T132164:0|t[驯服野兽]
    >>|cRXP_WARN_血蹄村南面或东面的道路沿线更容易找到它们|r
    .use 205995
    .unitscan 草原土拨鼠
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    .goto Mulgore,46.19,60.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔可达·日鬃|r交谈
    >>交付|cRXP_ENEMY_草原土拨鼠|r，获得|T134419:0|t[|cRXP_FRIENDLY_削凿符文|r]
    .collect 206032,1 --Rune of Carve (1)
    .target 塔可达·日鬃
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    .train 425758 >>使用 |T134419:0|t[|cRXP_FRIENDLY_削凿符文|r]
    .use 206032
    .itemcount 206032,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Carve - 10 (Dun Morogh)
#title 削凿
    --Rune of Carve
#displayname 削凿 - 10（丹莫罗）
step
    #season 2
    #completewith next
    +|cRXP_WARN_必须先学会|r|T132164:0|t[驯服野兽]|cRXP_WARN_，才能获得此符文|r
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    #loop
    .goto Dun Morogh,68.2,56.2,20,0
    .goto Dun Morogh,68.8,58.2,20,0
    .goto Dun Morogh,71.0,58.0,20,0
    .goto Dun Morogh,71.0,58.0,20,0
    .goto Dun Morogh,72.6,52.6,20,0
    >>击杀|cRXP_ENEMY_石腭穴居人|r，拾取|T134419:0|t[|cRXP_LOOT_兔子麝香|r]
    .collect 208180,1 --Rabbit Musk (1)
    .mob 石腭击颅者
    .mob 石腭断骨者
    .mob 石腭碎脊者
    .mob 石腭伏击者
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    #completewith next
    .goto Dun Morogh,44.4,56.2,20,0
    .goto Dun Morogh,44.8,59.8,20,0
    .goto Dun Morogh,47.4,54.4,20,0
    .goto Dun Morogh,49.2,46.0,20,0
    .goto Dun Morogh,47.0,44.6,20,0
    .goto Dun Morogh,46.8,47.8
    >>使用 |T134419:0|t[兔子麝香]，目标为 |cRXP_ENEMY_兔子|r，然后对它施放|T132164:0|t[驯服野兽]。|cRXP_WARN_不要解散当前宠物。|r
    .use 208180
    .unitscan 兔子
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    .goto Dun Morogh,63.40,50.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托比|r交谈
    >>交出|cRXP_ENEMY_兔子|r，获得|T134419:0|t[|cRXP_FRIENDLY_削凿符文|r]
    .collect 206032,1 --Rune of Carve (1)
    .target 托比
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    .train 425758 >>使用 |T134419:0|t[|cRXP_FRIENDLY_削凿符文|r]
    .use 206032
    .itemcount 206032,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Gloves
#subgroupdisplayname 手套
#name Carve - 10 (Teldrassil)
#title 削凿
    --Rune of Carve
#displayname 削凿 - 10（泰达希尔）
step
    #season 2
    #completewith next
    +|cRXP_WARN_你需要先学会|r |T132164:0|t[驯服野兽] |cRXP_WARN_才能获得此符文|r
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    .goto Teldrassil,46.2,51.2,20,0
    .goto Teldrassil,46.8,54.6,20,0
    .goto Teldrassil,48.8,55.4,20,0
    .goto Teldrassil,44.8,61.2
    >>击杀|cRXP_ENEMY_瘤背熊怪|r，拾取|T134419:0|t[|cRXP_LOOT_鹿麝香|r]
    .collect 208607,1 --Deer Musk (1)
    .train 425758,1
    .mob 瘤背占卜师
    .mob 瘤背探险者
    .mob 瘤背图腾师
    .mob 瘤背伏击者
    .mob 瘤背防御者
    .mob 瘤背复仇者
    .mob 瘤背萨满祭司
    .itemcount 206032,<1
step
    #season 2
    #completewith next
    .goto Teldrassil,42.2,71.6,20,0
    .goto Teldrassil,43.2,74.2,20,0
    .goto Teldrassil,47.6,74.0,20,0
    .goto Teldrassil,53.4,77.0,20,0
    .goto Teldrassil,54.8,58.4
    >>使用 |T134419:0|t[鹿麝香]，目标为 |cRXP_ENEMY_鹿|r，然后对它施放|T132164:0|t[驯服野兽]。|cRXP_WARN_不要解散当前宠物。|r
    .use 208607,1
    .unitscan 鹿
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    .goto Darnassus,39.8,9.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱雷隆|r 交谈，他在 |cFFfa9602达纳苏斯|r
    >>将|cRXP_ENEMY_鹿|r带给他，获得|T134419:0|t[|cRXP_FRIENDLY_削凿符文|r]
    .collect 206032,1 --Rune of Carve (1)
    .target 莱雷隆
    .train 425758,1
    .itemcount 206032,<1
step
    #season 2
    .train 425758 >>使用 |T134419:0|t[|cRXP_FRIENDLY_削凿符文|r]
    .use 206032
    .itemcount 206032,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Beast Mastery - 16 (The Barrens)
#title 野兽控制
    --Rune of Beast Mastery
#displayname 野兽控制 - 16（贫瘠之地）
step
    #season 2
    #completewith next
    +|cRXP_WARN_你必须已经学会|r |T135813:0|t[献祭陷阱] |cRXP_WARN_或其他任意陷阱，才能获得此符文|r
    .train 410110,1
    .itemcount 208701,<1
step
    #season 2
    .goto The Barrens,44.60,55.51,40,0
    .goto The Barrens,44.05,56.20,40,0
    .goto The Barrens,43.12,57.37
    .line The Barrens,44.60,55.51,44.60,55.51,43.12,57.37
    >>放置|T135813:0|t[献祭陷阱]于|cRXP_ENEMY_巡游中的猎豹|r的巡逻路线上，移除它的增益效果
    >>击杀它并拾取|T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r]
    .collect 208701,1 --Rune of Beast Mastery (1)
    .mob 巡游中的猎豹
    .train 410110,1
    .itemcount 208701,<1
step
    #season 2
    .train 410110 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r] |cRXP_WARN_学习|r |T132270:0|t[野兽控制]
    .use 208701
    .itemcount 208701,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Horde Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Chest
#subgroupdisplayname 胸甲
#name Beast Mastery - 16 (Silverpine)
#title 野兽控制
    --Rune of Beast Mastery
#displayname 野兽控制 - 16（银松森林）
step
    #season 2
    .goto Silverpine Forest,41.37,19.64,50,0
    .goto Silverpine Forest,41.60,21.65,50,0
    .goto Silverpine Forest,42.36,23.77,50,0
    .goto Silverpine Forest,44.67,24.84,50,0
    .goto Silverpine Forest,46.08,26.62,50,0
    .goto Silverpine Forest,41.60,21.65
    >>击杀|cRXP_ENEMY_凶猛的灰斑熊|r，直到出现|cRXP_ENEMY_老练的保护者|r（16级精英）
    >>击杀它，拾取|T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r]
    .collect 208701,1 --Rune of Beast Mastery (1)
    .mob 凶猛的灰斑熊
    .mob 老练的保护者
    .train 410110,1
    .itemcount 208701,<1
step
    #season 2
    .train 410110 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r] |cRXP_WARN_学习|r |T132270:0|t[野兽控制]
    .use 208701
    .itemcount 208701,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Sniper Training - 18 (Darkshore)
#title 狙击训练
    --Rune of the Sniper
#displayname 狙击训练 - 18（黑海岸）
step
    #season 2
    #completewith next
    .train 416091,1
    .zone Darkshore >>前往黑海岸
    .itemcount 208777,<1
step
    #season 2
    .goto 1439,44.081,20.739
    >>拾取骸骨眼窝中的 |T135129:0|t[多节鱼叉]
    .collect 209047,1 --Gnarled Harpoon (1)
    .train 416091,1
    .itemcount 208777,<1
step
    #completewith next
    .goto 1439,44.081,20.739
    .cast 422397 >>|cRXP_WARN_使用|r |T135129:0|t[多节鱼叉] |cRXP_WARN_攻击 |cRXP_ENEMY_帕克斯诺兹|r，将其最大生命值降至743|r
    .train 416091,1
    .itemcount 208777,<1
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
    >>击杀 |cRXP_ENEMY_帕克斯诺兹|r，拾取 |T134419:0|t|cRXP_LOOT_[狙击手符文]|r
    >>|cRXP_WARN_小心，他是20级精英怪|r
    .collect 208777,1 --Rune of the Sniper (1)
    .train 416091,1
    .use 209047
    .mob 帕克斯诺兹
    .itemcount 208777,<1
step
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r] |cRXP_WARN_学习|r |T132212:0|t[狙击训练]
    .use 208777
    .itemcount 208777,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Sniper Training - 16 (Westfall)
#title 狙击训练
    --Rune of the Sniper
#displayname 狙击训练 - 16（西部荒野）
step
    #season 2
    #completewith next
    .train 416091,1
    .zone Westfall >>前往西部荒野
    .itemcount 208777,<1
step
    #season 2
    #loop
    .goto Westfall,51.2,47.0,20,0
    .goto Westfall,50.2,48.6,20,0
    .goto Westfall,51.6,55.6,20,0
    >>击杀|cRXP_ENEMY_迪菲亚斥候|r，拾取|T134419:0|t[|cRXP_LOOT_狙击手符文|r]
    .collect 208777,1
    .train 416091,1
    .mob 迪菲亚斥候
    .itemcount 208777,<1
step
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r] |cRXP_WARN_学习|r |T132212:0|t[狙击训练]
    .use 208777
    .itemcount 208777,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Sniper Training - 16 (Loch Modan)
#title 狙击训练
    --Rune of the Sniper
#displayname 狙击训练 - 16（洛克莫丹）
step
    #season 2
    #completewith next
    .train 416091,1
    .zone Loch Modan >>前往洛克莫丹
    .itemcount 208777,<1
step
    #season 2
    #loop
    .goto Loch Modan,55.6,52.2,20,0
    .goto Loch Modan,55.8,54.4,20,0
    .goto Loch Modan,54.2,56.8,20,0
    .goto Loch Modan,53.8,54.4,20,0
    >>击杀|cRXP_ENEMY_凯克尔|r，拾取他掉落的|T134419:0|t[|cRXP_LOOT_狙击手符文|r]
    .collect 208777,1
    .train 416091,1
    .mob 凯克尔
    .itemcount 208777,<1
step
    #season 2
    .train 416091 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狙击手符文|r]|cRXP_WARN_学习|r|T132212:0|t[狙击训练]
    .use 208777
    .itemcount 208777,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Flanking - 7 (Dun Morogh)
#title 侧翼打击
    --Rune of Flanking
#displayname 侧翼打击 - 7（丹莫罗）
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
    >>击杀|cRXP_ENEMY_野猪|r。拾取它们的|T134026:0|t[丹莫罗猪肉]
    .collect 208192,1
    .mob 峭壁野猪
    .mob 大峭壁野猪
    .mob 老峭壁野猪
    .mob 有伤疤的峭壁野猪
    .itemcount 205979,<1
step
    #season 2
    .train 425762,1
    .goto Dun Morogh,37.78,42.55
    >>使用 |T134026:0|t[丹莫罗猪肉]，在 |cFFfa9602冰流洞穴|r 内的尸体附近召唤 |cRXP_ENEMY_乔鲁尔|r
    >>击杀 |cRXP_ENEMY_乔鲁尔|r 并拾取他的 |T135142:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .use 208192
    .mob 乔鲁尔
    .itemcount 205979,<1
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r] |cRXP_WARN_学习|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Alliance Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Legs
#subgroupdisplayname 腿部
#name Flanking - 7 (Teldrassil)
#title 侧翼打击
    --Rune of Flanking
#displayname 侧翼打击 - 7（泰达希尔）
step
    #season 2
    #loop
    .goto Teldrassil,42.6,52.6,20,0
    .goto Teldrassil,39.8,53.2,20,0
    .goto Teldrassil,39.4,36.2,20,0
    .goto Teldrassil,40.8,31.6,20,0
    .goto Teldrassil,46.6,31.2,20,0
    .train 425762,1
    >>击杀|cRXP_ENEMY_鸟类|r，地点在|cFFfa9602泰达希尔|r，拾取|T134025:0|t[泰达希尔鸟肉]
    .collect 208608,1
    .mob 巨翼枭
    .mob 巨翼恶枭
    .mob 巨翼猎枭
    .itemcount 205979,<1
step
    #season 2
    .train 425762,1
    .goto Teldrassil,48.3,31.4
    >>在尸体附近使用 |T134025:0|t[泰达希尔鸟肉] 来召唤 |cRXP_ENEMY_莫格|r
    >>击杀|cRXP_ENEMY_莫格|r，拾取|T134419:0|t|cRXP_LOOT_[侧翼符文]|r
    .collect 205979,1
    .use 208608
    .mob 莫格
    .itemcount 205979,<1
step
    #season 2
    .train 425762 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_侧翼符文|r] |cRXP_WARN_学习|r |T132175:0|t[侧翼打击]
    .use 205979
    .itemcount 205979,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Belt
#subgroupdisplayname 腰带
#title 破甲虚弱
#name Expose Weakness - 40 (Azeroth)
-- Expose Weakness
#displayname 破甲虚弱 - 40（艾泽拉斯）
step
    #optional
    .train 410114,1
    +|cRXP_WARN_你必须至少达到26级才能获得|r |T132353:0|t[破甲虚弱] |cRXP_WARN_符文|r
    .xp 26,1
    .itemcount 211301,<1
step
    #completewith next
    .zone Badlands >>前往荒芜之地
    .train 410114,1
    .itemcount 211301,<1
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
    .use 211269 >>击杀任意 |cRXP_ENEMY_火烟食人魔|r 或 |cRXP_ENEMY_石窟穴居人|r，拾取它们的 |T237388:0|t[|cRXP_LOOT_粗糙的绘画|r]
    >>|cRXP_WARN_使用|r |T237388:0|t[|cRXP_LOOT_粗糙的绘画|r] |cRXP_WARN_开启任务|r
    >>|cRXP_WARN_它们的位置已标在地图上|r
    .collect 211269,1,78823,1 --Primitive Drawing
    .accept 78823 >> 接任务：沙海的苍穹灾星
    .mob 火烟食人魔
    .mob 火烟蛮兵
    .mob 火烟虐待者
    .mob 火烟秘法师
    .mob 火烟萨满祭司
    .mob 火烟战士
    .mob 火烟猎龙者
    .mob 石窟断骨者
    .mob 石窟萨满祭司
    .train 410114,1
    .itemcount 211301,<1
step
    #optional
    #completewith next
    .zone Stranglethorn Vale >>前往荆棘谷
    .train 410114,1
    .itemcount 211301,<1
step
    .goto Stranglethorn Vale,35.658,10.808
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫米特·奈辛瓦里|r 交谈
    .turnin 78823 >> 交任务：沙海的苍穹灾星
    .accept 78830 >> 接任务：沙海的苍穹灾星
    .target 赫米特·奈辛瓦里
    .train 410114,1
    .itemcount 211301,<1
step
    #loop
    .goto Stranglethorn Vale,43.8,18.6,20,0
    .goto Stranglethorn Vale,45.2,19.6,20,0
    .goto Stranglethorn Vale,44.2,22.0,20,0
    .goto Stranglethorn Vale,45.6,23.0,20,0
    .use 211272 >>|cRXP_WARN_使用|r |T132599:0|t[空的诱饵笼] |cRXP_WARN_捕捉荆棘谷的小动物 |cRXP_ENEMY_树栖狼蛛|r，它们通常在树桩顶部|r
    >>|cRXP_WARN_也可以对世界中见到的其他小动物使用|r
    .collect 211273,1 --Trapped Critter
    .mob 树栖狼蛛
    .mob 老鼠
    .mob 黑老鼠
    .mob 鸡
    .train 410114,1
    .isOnQuest 78830
    .isQuestNotComplete 78830
    .itemcount 211301,<1
step
    #completewith next
    .zone Badlands >>前往荒芜之地
    .train 410114,1
    .itemcount 211301,<1
step
    #completewith next
    .goto Badlands,22.352,67.733
    +点击山顶的|cRXP_PICK_大鸟巢|r，召唤|cRXP_ENEMY_嘎里克|r
    .itemcount 211272,<1
    .isOnQuest 78830
    .isQuestNotComplete 78830
    .train 410114,1
    .itemcount 211301,<1
step
    .goto Badlands,22.352,67.733
    >>击杀|cRXP_ENEMY_嘎里克|r，拾取|cRXP_LOOT_深红战利品翎羽|r
    .complete 78830,1 --Crimson Trophy Quill (1)
    .mob 嘎里克
    .train 410114,1
    .itemcount 211301,<1
step
    #completewith next
    .zone Stranglethorn Vale >>前往荆棘谷
    .train 410114,1
    .itemcount 211301,<1
step
    .goto Stranglethorn Vale,35.658,10.808
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫米特·奈辛瓦里|r 交谈
    .turnin 78830 >> 交任务：沙海的苍穹灾星
    .target 赫米特·奈辛瓦里
    .train 410114,1
    .itemcount 211301,<1
step
    #season 2
    .train 410114 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_破甲虚弱符文|r] |cRXP_WARN_学习|r |T132353:0|t[破甲虚弱]
    .use 211301
    .itemcount 211301,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Belt
#subgroupdisplayname 腰带
#title 稳固射击
#name Steady Shot - 30 (Arathi Highlands)
#displayname 稳固射击 - 30（阿拉希高地）
step
    #completewith next
    .zone Arathi Highlands >>前往阿拉希高地
    .train 410109,1
    .itemcount 213122,<1
step
    .train 410109,1
    #loop
    .goto Arathi Highlands,67.8,66.0,0
    .goto Arathi Highlands,69.4,63.2,25,0
    .goto Arathi Highlands,67.8,66.0,25,0
    .goto Arathi Highlands,68.4,68.2,25,0
    >>击杀|cRXP_ENEMY_针齿|r，拾取它掉落的|T134419:0|t[|cRXP_FRIENDLY_稳固射击符文|r]
    >>|cRXP_ENEMY_针齿|r|cRXP_WARN_是一条在枯木村湖中游动的鱼|r
    .collect 213122,1
    .mob 针齿
    .itemcount 213122,<1
step
    .train 410109 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_稳固射击符文|r]|cRXP_WARN_学习|r|T132213:0|t[稳固射击]
    .use 213122
    .itemcount 213122,1
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Boots
#subgroupdisplayname 靴子
#title 双武器专精
#name Dual-Wield Specialization - 32 (Stranglethorn Vale)
#displayname 双武器专精 - 32（荆棘谷）
step
    #optional
    .train 410116,1
    +|cRXP_WARN_你必须至少达到32级，才能获取|r |T132147:0|t[双武器专精] |cRXP_WARN_符文|r
    .xp 32,1
    .itemcount 213126,<1
step
    .train 410116,1
    #optional
    .train 1543 >>|cRXP_WARN_你必须学习|r |T135815:0|t[照明弹] |cRXP_WARN_才能获取|r |T132147:0|t[双武器专精] |cRXP_WARN_符文|r
    .itemcount 213126,<1
step
    #completewith next
    .zone Stranglethorn Vale >>前往荆棘谷
    .train 410116,1
    .itemcount 213126,<1
step
    .train 410116,1
    .goto Stranglethorn Vale,31.84,15.61
    +|cRXP_WARN_前往箭头所示位置，四处跑动，直到身上出现|r |T132118:0|t[危险！] |cRXP_WARN_增益|r
    .aura 435548
    .aura 435428
    .aura 435546
    .itemcount 213126,<1
step
    .train 410116,1
    .goto Stranglethorn Vale,31.84,15.61
    #completewith next
    .cast 1543 >>|cRXP_WARN_施放|r |T135815:0|t[照明弹] |cRXP_WARN_使|r |cRXP_ENEMY_血顶游击兵|r 显形
    .usespell 1543
    .itemcount 213126,<1
step
    .train 410116,1
    .goto Stranglethorn Vale,31.84,15.61
    >>击杀 |cRXP_ENEMY_血顶游击兵|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_搏击者符文|r]
    .collect 213126,1
    .mob 血顶游击兵
    .itemcount 213126,<1
step
    .itemcount 213126,1
    .use 213126
    .train 410116 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_搏击者符文|r] |cRXP_WARN_学习|r |T132147:0|t[双武器专精]
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
#classic
<< Hunter SoD
#group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#title 集中火力
#name Focus Fire - 40 (Searing Gorge)
#displayname 集中火力 - 40（灼热峡谷）
step
    #completewith next
    +|cRXP_WARN_要获得这个符文，你需要在敌对区域击杀一只45级怪物。等级较低时请带上帮手|r
    .xp 45,1
    .train 431601,1
    .itemcount 221445,<1
step
    .goto Searing Gorge,53.10,55.85
    >>小心沿树枝走向鸟巢，从中拾取|cRXP_PICK_风暴乌鸦蛋|r。
    .collect 221544,1 --Stormcrow Egg
    .train 431601,1
    .itemcount 221445,<1
step
    .goto 1427/0,-1532.400,-6953.600
    >>沿树枝返回，等待几秒，让|cRXP_ENEMY_暴怒的风暴乌鸦|r出现。击杀它，拾取|T134419:0|t[|cRXP_FRIENDLY_聚火符文|r]
    .collect 221445,1
    .mob 暴怒的风暴乌鸦
    .train 431601,1
    .itemcount 221445,<1
step
    .itemcount 221445,1
    .use 221445
    .train 431601 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_聚火符文|r]|cRXP_WARN_学习|r|T135548:0|t[集中火力]
 ]])
 RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
    #classic
    << Hunter SoD
    #group RestedXP Rune & Books Guide
#subgroup Bracers
#subgroupdisplayname 护腕
#title 猛禽之怒
#name Raptor Fury - 40 (Tanaris)
#displayname 猛禽之怒 - 40（塔纳利斯）
step
    #completewith next
    .zone Tanaris >>前往塔纳利斯
    .train 416093,1
    .itemcount 220687,<1
step
    #loop
    .goto 1446/1,-3973.700,-7372.900,0
    .goto 1446/1,-3777.100,-7358.200,0
    .goto 1446/1,-3290.200,-7330.700,0
    .goto 1446/1,-3563.000,-7352.400,0
    .goto 1446/1,-3386.400,-7337.400,0
    .goto 1446/1,-3290.200,-7330.700,0
    >>击杀|cRXP_ENEMY_佐匹洛特|r，拾取|T134419:0|t[|cRXP_FRIENDLY_猛禽符文|r]
    >>|cRXP_ENEMY_佐匹洛特|r|cRXP_WARN_是一只食腐鸟，会在流沙岗哨南部至加基森之间的大片区域东西向巡逻|r
    >>提示：你可以使用|T132172:0|t[|cRXP_FRIENDLY_鹰眼术|r]侦察它的位置，无需四处奔跑。如果找不到它，可能是它已被击杀；它应该会在地图上标记为“2+”的位置附近刷新
    .collect 220687,1
    .unitscan 佐匹洛特
    .train 416093,1
    .itemcount 220687,<1
step
    .train 416093 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_猛禽符文|r]|cRXP_WARN_学习|r|T132253:0|t[猛禽之怒]
    .use 220687
    .itemcount 220687,1
    ]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
    #classic
    << Hunter SoD
    #group RestedXP Rune & Books Guide
#subgroup Helmet
#subgroupdisplayname 头盔
#title 猎豹敏捷
#name Catlike Reflexes - 40 (Feralas)
#displayname 猎豹敏捷 - 40（菲拉斯）
step
    #completewith next
    .zone Feralas >>前往菲拉斯
    .train 416083,1
    .itemcount 220791,<1
step
    +|cRXP_WARN_获取该符文需要以下任一物品：|T133951:0|t|cRXP_PICK_软香蕉面包|r或|T133980:0|t|cRXP_PICK_泰拉比姆香蕉|r。联盟玩家可在羽月要塞向|cRXP_FRIENDLY_玛德拉克·绿井|r购买面包；部落玩家可在莫沙彻营地向|cRXP_FRIENDLY_旅店老板格鲁尔|r购买面包。
    .itemcount 4601,<1 --Soft Banana Bread
    .itemcount 4537,<1 --Tel'Abim Banana
    .target 旅店老板格鲁尔
    .target 玛德拉克·绿井
    .train 416083,1
    .itemcount 220791,<1
step
    >>前往高原荒野的雪人洞穴
    .goto 1444/1,1599.300,-4977.800,10
    .train 416083,1
    .itemcount 220791,<1
step
    .goto 1444/1,1778.900,-5179.100,
    >>进入第二个洞穴后，在岔路口走中间的路。你会在洞穴深处找到一只|cRXP_FRIENDLY_格罗多克幼崽|r
    .gossip 222376,1 >>完成猴子的对话，喂它|T133951:0|t|cRXP_PICK_软香蕉面包|r或|T133980:0|t|cRXP_PICK_泰拉比姆香蕉|r，随后会出现一只跟随你的幼崽。
    .target 格罗多克幼崽::222376
    .train 416083,1
    .itemcount 220791,<1
step
    .goto 1444/1,1330.900,-5078.100
    >>将|cRXP_FRIENDLY_格罗多克幼崽|r护送到地图上标记的|cRXP_FRIENDLY_格罗多克母兽|r处。小心，幼崽具有攻击性，会攻击附近的敌人，包括敌对阵营玩家。
    .gossip 222406,1 >>到达后与母兽交谈并完成对话，获得|T134419:0|t[|cRXP_FRIENDLY_丛林猎豹符文|r]
    .collect 220791,1 -- Rune of the Jungle Cat
    .train 416083,1
    .itemcount 220791,<1
step
    .train 416083 >>使用|T134419:0|t[|cRXP_FRIENDLY_丛林猎豹符文|r]|cRXP_WARN_学习|r|T132167:0|t[猎豹敏捷]
    .use 220791
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
    #classic
    << Hunter SoD
    #group RestedXP Rune & Books Guide
#subgroup Helmet
#subgroupdisplayname 头盔
#title 疾速杀戮
#name Rapid Killing - 45 (Searing Gorge & Blasted Lands)
#displayname 疾速杀戮 - 45（灼热峡谷与诅咒之地）
step
    #completewith next
    .zone Searing Gorge >>前往灼热峡谷
    .train 416090,1
    .itemcount 220217,<1
step
    .goto 1427/0,-832.800,-6647.500,10
    >>前往观火岭的洞穴入口。注意，你需要进入一个满是 47-48 级精英怪的洞穴；也可以通过跑尸完成这部分。
    .train 416090,1
    .itemcount 220217,<1
step
    .goto Searing Gorge,14.5,36.5
    >>|cRXP_WARN_进入洞穴后沿右侧路线走。你很快会在洞穴中段的高地上看到一块名为|cRXP_FRIENDLY_风化的刻痕|r的大石板。跑过去接取任务。
    >>提示：如果独自前往，尽量利用陷阱和宠物深入洞穴，再使用|T132293:0|t[|cRXP_FRIENDLY_假死|r]消除怪物仇恨。也可以通过跑尸抵达该物件。
    .accept 81900 >> 接任务: 烈燃猛兽
    .train 416090,1
    .itemcount 220217,<1
step
    #completewith next
    .zone Blasted Lands >>前往诅咒之地
    .train 416090,1
    .itemcount 220217,<1
step
    .goto Blasted Lands,50.6,14.2
    >>与|cRXP_FRIENDLY_血法师莱诺雷|r交谈
    .turnin 81900 >>交任务 烈燃猛兽
    .accept 81917 >>接任务：束缚枷锁
    .target 血法师莱诺雷
    .train 416090,1
    .itemcount 220217,<1
step
    .goto Blasted Lands,64.24,32.36
    >>前往魔誓洞穴区域，击杀任意|cRXP_ENEMY_魔誓祭司、暴徒或专家|r，拾取其掉落的|cRXP_LOOT_地狱火链环|r
    .complete 81917,1 --Infernal Chains 5/5
    .mob 魔誓祭司
    .mob 魔誓暴徒
    .mob 魔誓专家
    .train 416090,1
    .itemcount 220217,<1
step
    .goto Blasted Lands,50.6,14.2
    >>与|cRXP_FRIENDLY_血法师莱诺雷|r交谈
    .turnin 81917 >>交任务：束缚枷锁
    .accept 81919 >>接任务：俯首听命
    .target 血法师莱诺雷
    .train 416090,1
    .itemcount 220217,<1
step
    #loop
    .goto 1419/0,-2976.500,-11483.101
    .goto 1419/0,-2778.300,-11420.800
    .goto 1419/0,-2821.900,-11353.700
    .goto 1419/0,-2934.700,-11419.101
    >>寻找|cRXP_ENEMY_脱缰的卡勒法图斯|r，一只 50 级的绿色熔岩犬。它在地图红色区域的南缘有多个刷新点，可以尝试使用|T132172:0|t[|cRXP_FRIENDLY_鹰眼术|r]寻找它。找到后，对它使用|T136091:0|t|cRXP_LOOT_地狱火套索|r，然后击杀它并拾取其血液。
    .complete 81919,1 --Fel Lifeblood 1/1
    .use 220216
    .unitscan 脱缰的卡勒法图斯
    .train 416090,1
    .itemcount 220217,<1
step
    .goto Blasted Lands,50.6,14.2
    >>与|cRXP_FRIENDLY_血法师莱诺雷|r交谈
    .turnin 81919 >>交任务：俯首听命
    .target 血法师莱诺雷
    .train 416090,1
    .itemcount 220217,<1
step
    .train 416090 >>使用|T134419:0|t[|cRXP_FRIENDLY_嗜猎成性符文|r] |cRXP_WARN_学习|r |T132205:0|t[疾速杀戮]
    >>你还获得了|T136091:0|t|cRXP_LOOT_地狱火套索|r饰品，可用于驯服熔岩犬
    .use 220217
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
    #classic
    << Hunter SoD
    #group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#title 一击脱离
#name Hit and Run - 50 (Burning Steppes)
#displayname 一击脱离 - 50（燃烧平原）
step
    #completewith next
    .zone Burning Steppes >>前往燃烧平原
    .train 440563,1
    .itemcount 226252,<1
step
    >>寻找|cRXP_ENEMY_逃脱的熔火恶犬|r，它可能出现在该区域的多个位置。|cRXP_WARN_查看地图上的路标，寻找可能的刷新地点|r。击杀并拾取符文
    >>提示：可以使用|T132172:0|t[|cRXP_FRIENDLY_鹰眼术|r]侦察它的位置，省去四处奔跑
    .goto Burning Steppes,84.8,68.0,0
    .goto Burning Steppes,83.8,60.0,0
    .goto Burning Steppes,88.6,54.8
    .goto Burning Steppes,61.6,54.4,0
    .goto Burning Steppes,39.8,59.4,0
    .goto Burning Steppes,31.8,53.0,0
    .goto Burning Steppes,24.8,55.6,0
    .unitscan 逃脱的熔火恶犬
    .collect 226252,1 --rune of the guerrilla (1)
    .train 440563,1
    .itemcount 226252,<1
step
    .train 440563 >>使用|T134419:0|t[|cRXP_FRIENDLY_游击符文|r] |cRXP_WARN_学习|r |T132171:0|t[一击脱离]
    .use 226252
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
    #classic
    << Hunter SoD
    #group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#title 游刃有余
#name Resourcefulness - 58 (Eastern Plaguelands)
#displayname 游刃有余 - 58（东瘟疫之地）
step
    #completewith next
    .zone Eastern Plaguelands >>前往东瘟疫之地
    .train 440557,1
    .itemcount 225955,<1
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
    >>击杀|cRXP_ENEMY_腐烂淤泥怪|r和|cRXP_ENEMY_腐朽软泥怪|r，拾取|T132108:0|t[|cRXP_LOOT_冒泡的绿色粘液|r]
    >>|cRXP_WARN_粘液是灰色物品，注意不要卖给商人！|r
    .collect 20770,1 --Bubbling Green Ichor (1)
    .mob 腐朽软泥怪
    .mob 腐烂淤泥怪
    .train 440557,1
    .itemcount 225955,<1
step
    .goto Eastern Plaguelands,17.8,30.2
    >>前往恐惧谷，击杀|cRXP_ENEMY_瘟疫野猪|r，直到拾取|T134046:0|t[|cRXP_LOOT_被污染的野猪肉|r]
    .collect 225942,1 --Tainted Boar Meat (1)
    .mob 瘟疫野猪
    .train 440557,1
    .itemcount 225955,<1
step
    >>使用|T134046:0|t[|cRXP_LOOT_被污染的野猪肉|r]，将其与|T132108:0|t[|cRXP_LOOT_冒泡的绿色粘液|r]组合，制作|T134047:0|t[腐臭肉块]
    .collect 225943,1 --Rancid Hunk of Flesh (1)
    .use 225942
    .train 440557,1
    .itemcount 225955,<1
step
    .goto Eastern Plaguelands,22.68,37.12,-1
    .goto Eastern Plaguelands,19.37,26.42,-1
    .goto Eastern Plaguelands,29.83,39.05,-1
    >>寻找一只|cRXP_ENEMY_腐肉虫|r或|cRXP_ENEMY_腐肉吞噬者|r。离恐惧谷最近的刷新点就在其北边和南边
    >>对它使用|T134047:0|t[腐臭肉块]进行喂食。|cRXP_WARN_短暂动画后，虫子会生成一具骸骨，拾取其中的|r |T134419:0|t[|cRXP_FRIENDLY_游刃有余符文|r]
    .use 225943
    .collect 225955,1 --Rune of the resourceful (1)
    .mob 腐肉虫
    .mob 腐肉吞噬者
    .train 440557,1
    .itemcount 225955,<1
step
    .train 440557 >>使用|T134419:0|t[|cRXP_FRIENDLY_游刃有余符文|r] |cRXP_WARN_学习|r |T132178:0|t[游刃有余]
    .use 225955
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 符文与技能书指南
    #classic
    << Hunter SoD
    #group RestedXP Rune & Books Guide
#subgroup Cloak
#subgroupdisplayname 披风
#title 强化乱射
#name Improved Volley - 60 (Silithus)
#displayname 强化乱射 - 60（希利苏斯）
step
    #completewith next
    .zone Silithus >>前往希利苏斯
    .train 440560,1
    .itemcount 226587,<1
step
    >>击杀希利苏斯的|cRXP_WARN_任意怪物|r，直到拾取|T132997:0|t[|cRXP_LOOT_损坏的装置|r]。掉率较低，但该区域的所有怪物都有可能掉落
    .collect 226526,1
    .itemcount 226546,<1
    .train 440560,1
    .itemcount 226587,<1
step
    .goto Silithus,41.2,88.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与铜须营地的|cRXP_FRIENDLY_艾德威·铜栓|r交谈，完成对话以获得|T133878:0|t[沙漠声呐]
    .collect 226546,1 --Desert Sonar (1)
    .itemcount 226546,<1
    .train 440560,1
    .itemcount 226587,<1
step
    >>先将沙漠声呐装备在任意饰品栏，等待装备冷却结束后再使用。
    .goto Silithus,36.00,71.00
    >>|cRXP_WARN_在地图标记的位置附近四处移动，直到看到地面蠕动。随后使用|r|T133878:0|t[沙漠声呐]|cRXP_WARN_召唤|cRXP_ENEMY_沙虫|r。击杀它，拾取符文|r
    >>这只沙虫的生命值较高，还会钻地暂时消失。召唤前请做好战斗准备
    .use 226546
    .collect 226587,1 --rune of shelling
    .mob 沙虫::227493
    .train 440560,1
    .itemcount 226587,<1
step
    .train 440560 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_炮轰符文|r] 学习 |T236179:0|t[|cRXP_FRIENDLY_强化乱射|r]
    .use 226587
]])
