local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate <1.99
<< Horde
#name 1-6 Durotar
#version 11
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 6-10 Durotar
#displayname 1-6 杜隆塔尔
step << !Orc !Troll
    #completewith next
    +|cRXP_WARN_你选择的是面向兽人和巨魔的指南。请选择与你的角色起始区域一致的指南。|r
step << !Troll Mage
    #season 2
    #completewith next
    +在探索赛季中，法师应从本种族出生区域开始，否则无法在当地获得第一个符文（|T133816:0|t[铭刻手套 - 冰枪术]）
step
    .goto Durotar,43.29,68.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔图克|r交谈
    .accept 4641 >>起点
    .target 卡尔图克
step << Warrior/Shaman/Warlock
    #completewith next
    +|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷到可出售物品（含装备）价值达 35 铜|r << Warlock
    +|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷到可出售物品（含装备）价值达 10 铜|r << Warrior/Shaman
    .goto Durotar,43.85,71.73,30,0 << Warlock
    .goto Durotar,44.19,65.34,30,0 << Warrior/Shaman
    .mob 杂斑野猪
    .money >0.01
step << Warlock
    .goto Durotar,42.59,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁赞|r交谈
    .accept 1485 >>邪灵劣魔
    .target 鲁赞
step << Warrior/Shaman
    .goto Durotar,42.59,67.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >> 出售杂物
    .target 多克纳
    .money >0.01
step
    .goto Durotar,42.28,68.48,12,0 << !Warrior !Shaman
    .goto Durotar,42.29,68.39,12,0 << Warrior/Shaman
    .goto Durotar,42.06,68.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 4641 >>起点
    .accept 788 >>小试身手
    .target 高内克
step << Warrior/Shaman
    .goto Durotar,42.28,68.48,10,0
    .goto Durotar,42.89,69.44 << Warrior
    .goto Durotar,42.39,69.00 << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈 << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈 << Shaman
    .train 6673 >>学习 |T132333:0|t[战斗怒吼] << Warrior
    .train 8017 >>学习 |T136086:0|t[石化武器] << Shaman
    .target 弗朗恩 << Warrior
    .target 史克里克 << Shaman
step << Warlock
    #softcore
    #completewith Nartok
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.65,68.52,12 >>前去找|cRXP_FRIENDLY_纳托克|r
    .money <0.01
step << Warlock
    #softcore
    #completewith next
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>朝|cRXP_FRIENDLY_赫劳格|r方向前进
    .money >0.01
step << Warlock
    #hardcore
    #completewith next
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>朝|cRXP_FRIENDLY_赫劳格|r方向前进
step << Warlock
    #softcore
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售杂物
    .target 赫劳格
    .money >0.01
step << Warlock
    #hardcore
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售杂物
    .target 赫劳格
step << Warlock
    #season 2
    #label Nartok
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .accept 77586 >>失窃的力量
    .train 348 >>学习 |T135817:0|t[献祭]
    .target 纳托克
step << Warlock
    #season 0,1
    #label Nartok
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 348 >>学习 |T135817:0|t[献祭]
    .target 纳托克
step << !Warrior !Rogue
    #softcore
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（她有售）|r << !Hunter !Shaman
    >>|cRXP_BUY_向她购买|r |T132382:0|t[劣质箭]|cRXP_BUY_|r << Hunter
    .collect 159,30,6394,1 << !Hunter !Shaman --Refreshing Spring Water (30)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .target 多克纳
    .money <0.015 << !Hunter
    .money <0.0040 << Hunter
step << Warlock
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（她有售）|r
    .collect 159,5,6394,1 --Refreshing Spring Water (5)
    .target 多克纳
    .money <0.0025
step << Warlock
    #completewith next
    .goto Durotar,43.57,67.28,25,0
    >>去火刃集会所的路上，顺便击杀|cRXP_ENEMY_杂斑野猪|r
    >>|cRXP_WARN_尽量在到那儿之前升到 2 级|r
    .complete 788,1 --Mottled Boar (10)
    .mob 杂斑野猪
step << Warlock
    .goto Durotar,45.30,56.42,100 >> 前往火刃集会所
    .isOnQuest 1485
step << Warlock
    #loop
    .goto Durotar,43.87,58.42,0
    .goto Durotar,43.87,58.42,40,0
    .goto Durotar,44.53,58.62,40,0
    .goto Durotar,45.18,58.42,40,0
    .goto Durotar,45.83,58.59,40,0
    .goto Durotar,45.79,57.43,40,0
    .goto Durotar,46.46,57.57,40,0
    .goto Durotar,47.19,57.12,40,0
    .goto Durotar,46.21,56.69,40,0
    .goto Durotar,46.28,56.11,40,0
    .goto Durotar,45.65,56.90,40,0
    .goto Durotar,45.35,56.32,40,0
    .goto Durotar,44.77,56.87,40,0
    .goto Durotar,44.58,56.10,40,0
    .goto Durotar,44.27,56.59,40,0
    .goto Durotar,43.85,55.52,40,0
    >>击杀|cRXP_ENEMY_邪灵劣魔|r，拾取|cRXP_LOOT_邪灵劣魔的头颅|r
    .complete 1485,1 --Vile Familiar Head (6)
    .mob 邪灵劣魔
step
    #completewith Sarkoth
    .goto Durotar,43.57,67.28,35,0 << !Warlock
    .goto Durotar,43.89,65.84,45,0 << !Warlock
    >>击杀|cRXP_ENEMY_杂斑野猪|r
    .complete 788,1 --Mottled Boar (10)
    .mob 杂斑野猪
step
    .goto Durotar,40.59,62.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳祖|r交谈
    .accept 790 >>萨科斯
    .target 哈纳祖
step
    #season 2
    #label Sarkoth
    .goto Durotar,40.60,66.80
    >>击杀|cRXP_ENEMY_萨科斯|r，拾取|cRXP_LOOT_萨科斯的爪子|r
    .complete 790,1 --Sarkoth's Mangled Claw (1)
    .mob 萨科斯
step
    #season 0,1
    #label Sarkoth
    .goto Durotar,40.60,66.80
    >>击杀|cRXP_ENEMY_萨科斯|r，拾取|cRXP_LOOT_萨科斯的爪子|r
    .complete 790,1 --Sarkoth's Mangled Claw (1)
    .mob 萨科斯
step
    .goto Durotar,40.59,62.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳祖|r交谈
    .turnin 790 >>萨科斯
    .accept 804 >>萨科斯
    .target 哈纳祖
step
    #loop
    .goto Durotar,41.30,65.03,0
    .goto Durotar,41.30,65.03,40,0
    .goto Durotar,41.92,64.74,40,0
    .goto Durotar,42.66,64.92,40,0
    .goto Durotar,43.31,65.02,40,0
    .goto Durotar,43.90,65.96,40,0
    .goto Durotar,44.54,65.96,40,0
    .goto Durotar,45.16,65.77,40,0
    .goto Durotar,45.72,65.93,40,0
    .goto Durotar,45.72,65.04,40,0
    .goto Durotar,45.21,63.95,40,0
    .goto Durotar,45.83,63.01,40,0
    .goto Durotar,45.81,62.17,40,0
    .goto Durotar,45.78,61.14,40,0
    .goto Durotar,45.15,60.20,40,0
    .goto Durotar,44.50,59.45,40,0
    .goto Durotar,43.86,60.43,40,0
    .goto Durotar,43.07,60.24,40,0
    .goto Durotar,42.58,60.09,40,0
    .goto Durotar,42.02,61.19,40,0
    .goto Durotar,42.02,62.15,40,0
    .goto Durotar,42.00,62.92,40,0
    .goto Durotar,41.99,64.03,40,0
    >>击杀|cRXP_ENEMY_杂斑野猪|r
    .complete 788,1 --Mottled Boar (10)
    .mob 杂斑野猪
step << Warlock/Warrior/Shaman/Hunter
    #xprate >1.49
    #loop
	.goto Durotar,41.30,65.03,0
    .goto Durotar,41.30,65.03,40,0
    .goto Durotar,41.92,64.74,40,0
    .goto Durotar,42.66,64.92,40,0
    .goto Durotar,43.31,65.02,40,0
    .goto Durotar,43.90,65.96,40,0
    .goto Durotar,44.54,65.96,40,0
    .goto Durotar,45.16,65.77,40,0
    .goto Durotar,45.72,65.93,40,0
    .goto Durotar,45.72,65.04,40,0
    .goto Durotar,45.21,63.95,40,0
    .goto Durotar,45.83,63.01,40,0
    .goto Durotar,45.81,62.17,40,0
    .goto Durotar,45.78,61.14,40,0
    .goto Durotar,45.15,60.20,40,0
    .goto Durotar,44.50,59.45,40,0
    .goto Durotar,43.86,60.43,40,0
    .goto Durotar,43.07,60.24,40,0
    .goto Durotar,42.58,60.09,40,0
    .goto Durotar,42.02,61.19,40,0
    .goto Durotar,42.02,62.15,40,0
    .goto Durotar,42.00,62.92,40,0
    .goto Durotar,41.99,64.03,40,0
    .xp 3+325 >> 刷怪至 325+/1400 经验值 << Warlock
    .xp 3+925 >> 刷怪至 925+/1400 经验值 << Warrior/Shaman/Hunter
    .mob 杂斑野猪
step << Warlock
    #xprate <1.5
    #loop
	.goto Durotar,41.30,65.03,0
    .goto Durotar,41.30,65.03,40,0
    .goto Durotar,41.92,64.74,40,0
    .goto Durotar,42.66,64.92,40,0
    .goto Durotar,43.31,65.02,40,0
    .goto Durotar,43.90,65.96,40,0
    .goto Durotar,44.54,65.96,40,0
    .goto Durotar,45.16,65.77,40,0
    .goto Durotar,45.72,65.93,40,0
    .goto Durotar,45.72,65.04,40,0
    .goto Durotar,45.21,63.95,40,0
    .goto Durotar,45.83,63.01,40,0
    .goto Durotar,45.81,62.17,40,0
    .goto Durotar,45.78,61.14,40,0
    .goto Durotar,45.15,60.20,40,0
    .goto Durotar,44.50,59.45,40,0
    .goto Durotar,43.86,60.43,40,0
    .goto Durotar,43.07,60.24,40,0
    .goto Durotar,42.58,60.09,40,0
    .goto Durotar,42.02,61.19,40,0
    .goto Durotar,42.02,62.15,40,0
    .goto Durotar,42.00,62.92,40,0
    .goto Durotar,41.99,64.03,40,0
    .xp 3+685 >> 刷怪至 685+/1400 经验值
    .mob 杂斑野猪
step << Warlock
    #xprate <1.5
    #completewith Ruzan2
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷怪直到获得价值 1 银的可出售物品|r
    .mob 杂斑野猪
	.money >0.01
step << Warlock/Warrior/Shaman/Hunter
    #xprate >1.49
    #completewith Ruzan2
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷怪直到获得价值 2 银的可出售物品|r << Warrior
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷怪直到获得价值 1 银 75 铜的可出售物品|r << Warlock
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷怪直到获得价值 1 银 10 铜的可出售物品|r << Hunter
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷怪直到获得价值 1 银的可出售物品|r << Shaman
    .mob 杂斑野猪
	.money >0.02 << Warrior
	.money >0.0175 << Warlock
	.money >0.011 << Hunter
	.money >0.01 << Shaman
step << Rogue
    #label Duokna2
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >> 出售杂物
    .target 多克纳
step << Warlock
    #label Ruzan2
    .goto Durotar,42.59,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁赞|r交谈
    .turnin 1485 >>邪灵劣魔
    .accept 1499 >>邪灵劣魔
    .target 鲁赞
step << Warlock
    #completewith Gornek2
    .cast 688 >>|cRXP_WARN_施放|r |T136218:0|t[召唤小鬼]
step << Warlock
	.goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 1499 >>邪灵劣魔
    .accept 794 >>火刃奖章
    .target 祖雷萨
step
    #label Gornek2
    .goto Durotar,42.28,68.48,12,0 << Warlock
    .goto Durotar,42.29,68.39,12,0 << !Warlock
    .goto Durotar,42.06,68.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 788,2 >>小试身手 << Shaman
    .turnin 788 >>小试身手 << !Shaman
    .accept 789 >>工蝎的尾巴
    .accept 2383 >>简易羊皮纸 << Orc Warrior
    .accept 3065 >>普通石板 << Troll Warrior
    .accept 3082 >>风蚀石板 << Troll Hunter
    .accept 3083 >>密文石板 << Troll Rogue
    .accept 3084 >>符文石板 << Troll Shaman
    .accept 3085 >>神圣石板 << Troll Priest
    .accept 3086 >>雕文石板 << Troll Mage
    .accept 3087 >>风蚀羊皮纸 << Orc Hunter
    .accept 3088 >>密文羊皮纸 << Orc Rogue
    .accept 3089 >>符文羊皮纸 << Orc Shaman
    .accept 3090 >>被污染的羊皮纸 << Orc Warlock
    .turnin 804,1 >>萨科斯 << Shaman
    .turnin 804 >>萨科斯 << !Shaman
    .target 高内克
step << Rogue
    #season 0,1
    #completewith Rwag
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.27,68.00,12 >>朝|cRXP_FRIENDLY_鲁瓦格|r方向前进
step << Rogue
    #season 0,1
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .turnin 3083 >>密文石板 << Troll Rogue
    .turnin 3088 >>密文羊皮纸 << Orc Rogue
    .train 53 >> 学习 |T132090:0|t[背刺]
    .target 鲁瓦格
    .money <0.04
    .xp <4,1
step << Rogue
    #season 0,1
    #label Rwag
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .turnin 3083 >>密文石板 << Troll Rogue
    .turnin 3088 >>密文羊皮纸 << Orc Rogue
    .target 鲁瓦格
step << Rogue
    #season 2
    #label Rwag
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁瓦格|r 交谈
    .turnin 3083 >> 交任务：密文石板 << Troll
    .turnin 3088 >> 交任务：密文羊皮纸 << Orc
    .target 鲁瓦格
step << Warlock
    #completewith Nartok2
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.65,68.52,12 >>前去找|cRXP_FRIENDLY_纳托克|r
    .money <0.01
step << Warlock
    #completewith next
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>朝|cRXP_FRIENDLY_赫劳格|r方向前进
    .money >0.01
step << Warlock
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售杂物
    .target 赫劳格
    .money >0.01
step << Warlock
    #season 2
    #label Nartok2
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .turnin 3090 >>被污染的羊皮纸
    .accept 77586 >>失窃的力量
    .target 纳托克
step << Warlock
    #season 0,1
    #label Nartok2
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .turnin 3090 >>被污染的羊皮纸
    .train 172 >> 学习 |T136118:0|t[腐蚀术]
    .target 纳托克
step
    #label Galgar
    .goto Durotar,42.73,67.23,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .accept 4402 >>戈加尔的清凉果
    .target 戈加尔
step << !Rogue
    #xprate <1.5
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（她有售）|r << !Rogue !Warrior !Hunter !Shaman
    >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_（她有售）|r << Hunter
    .collect 159,15,6394,1 << !Rogue !Warrior !Hunter !Shaman --Refreshing Spring Water (15)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >> 出售杂物
    .target 多克纳
    .money >0.1 << Rogue/Warrior
    .itemcount 159,<15 << !Rogue !Warrior !Hunter !Shaman
step << !Rogue
    #xprate >1.49
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cFF00FF25多克纳|r 交谈
    >>|cFF0E8312向她购买|r |T132794:0|t[清凉的泉水]|cFF0E8312|r << !Rogue !Warrior !Hunter !Shaman
    >>|cFF0E8312向她购买|r |T132382:0|t[劣质箭]|cFF0E8312|r << Hunter
    >>|cRXP_WARN_留出 10 铜币来学习|r |T135932:0|t[奥术智慧] << Mage
    .collect 159,15,6394,1 << !Rogue !Warrior !Hunter !Shaman --Refreshing Spring Water (15)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >> 出售杂物
    .target 多克纳
    .money <0.005 << Hunter
    .money >0.1 << Rogue/Warrior/Shaman
    .itemcount 159,<15 << !Rogue !Warrior !Hunter !Shaman
step << Hunter
    #optional
    #xprate >1.49
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_（她有售）|r
    .collect 2512,400,6394,1 --Rough Arrow (400)
    .vendor >> 出售杂物
    .target 多克纳
    .money <0.002
    .itemcount 2512,<200
step << Hunter
    #optional
    #xprate >1.49
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_（她有售）|r
    .collect 2512,200,6394,1 --Rough Arrow (200)
    .vendor >> 出售杂物
    .target 多克纳
    .money <0.001
    .itemcount 2512,<200
step << Shaman
    #season 2
    #xprate >1.49
    #requires Galgar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .turnin 3084 >>符文石板 << Troll
    .turnin 3089 >>符文羊皮纸 << Orc
    .accept 77587 >>力量圣像 << Troll Shaman
    .accept 77585 >>力量圣像 << Orc Shaman
    .train 8042 >>学习 |T136026:0|t[地震术]
    .goto Durotar,42.39,69.00
    .accept 1516 >>大地的召唤
    .goto Durotar,42.40,69.17
    .target 史克里克
    .target 坎纳甘·地鸣
step << Shaman
    #season 2
    #xprate <1.5
    #requires Galgar
    .goto Durotar,42.39,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .turnin 3084 >>符文石板 << Troll
    .turnin 3089 >>符文羊皮纸 << Orc
    .accept 77587 >>力量圣像 << Troll Shaman
    .accept 77585 >>力量圣像 << Orc Shaman
    .target 史克里克
step << Shaman
    #season 0,1
    #requires Galgar
    .goto Durotar,42.39,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .turnin 3084 >>符文石板 << Troll
    .turnin 3089 >>符文羊皮纸 << Orc
    .target 史克里克
step << Mage
    #season 2
    #requires Galgar
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .turnin 3086 >>雕文石板 << Troll
    .accept 77643 >>法术研究 << Troll Mage
    .train 1459 >> 学习 |T135932:0|t[奥术智慧]
    .target 迈安
step << Mage
    #season 0,1
    #requires Galgar
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .turnin 3086 >>雕文石板 << Troll
    .train 1459 >> 学习 |T135932:0|t[奥术智慧]
    .target 迈安
step << !Warlock
    #requires Galgar
	.goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .accept 792 >>邪灵劣魔
    .target 祖雷萨
step << Hunter
    #season 2
    #xprate >1.49
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .accept 77590 >>崎岖地形 << Troll Hunter
    .accept 77584 >>搜寻符文 << Orc Hunter
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 基沙
    .money <0.01
step << Hunter
    #season 2
    #xprate >1.49
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .accept 77590 >>崎岖地形 << Troll Hunter
    .accept 77584 >>搜寻符文 << Orc Hunter
    .target 基沙
step << Hunter
    #xprate <1.5
    #season 2
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .accept 77590 >>崎岖地形 << Troll Hunter
    .accept 77584 >>搜寻符文 << Orc Hunter
    .target 基沙
step << Hunter
    #xprate >1.49
    #season 0,1
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 基沙
    .money <0.01
step << Hunter
    #xprate >1.49
    #season 0,1
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .target 基沙
step << Hunter
    #xprate <1.5
    #season 0,1
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .target 基沙
step << Warrior
    #xprate >1.49
    #season 2
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .accept 77588 >>体能试炼 << Troll
    .accept 77582 >>体能试炼 << Orc
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
    .money <0.01
step << Warrior
    #xprate >1.49
    #season 2
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .accept 77588 >>体能试炼 << Troll
    .accept 77582 >>体能试炼 << Orc
    .target 弗朗恩
step << Warrior
    #xprate >1.49
    #season 0,1
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
    .money <0.01
step << Warrior
    #xprate >1.49
    #season 0,1
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .target 弗朗恩
step << Warrior
    #xprate <1.5
    #season 2
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .accept 77588 >>体能试炼 << Troll
    .accept 77582 >>体能试炼 << Orc
    .target 弗朗恩
step << Warrior
    #season 2
    .goto Durotar,42.89,69.44,0
    >>爬上 |cRXP_FRIENDLY_弗朗恩|r 身后的悬崖，打开隐藏的宝箱，右键使用其中的符文，学会 |T132342:0|t[铭刻手套 - 乘胜追击]
    .complete 77588,1 << Troll
    .complete 77582,1 << Orc
step << Warrior
    #season 2
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t回去与 |cRXP_FRIENDLY_弗朗恩|r 交谈
    .turnin 77588 >> 交任务：体能试炼 << Troll
    .turnin 77582 >> 交任务：体能试炼 << Orc
    .target 弗朗恩
step << Warrior
    #xprate <1.5
    #season 0,1
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .target 弗朗恩
step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .turnin 3085 >>神圣石板
    .accept 77642 >>洛阿的智慧
    .target 肯杰
step << Shaman
    .goto Durotar,40.47,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克赞·荆条|r交谈
    >>|cRXP_BUY_购买|r |T135145:0|t[短杖]，如果它能提升装备
    .collect 2132,1,5441,1 --Collect Short Staff (1)
    .money <0.0102
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
    .target 克赞·荆条
step
    #requires Galgar << Warlock
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔兹利尔|r交谈
    .accept 5441 >>懒惰的苦工
    .target 工头塔兹利尔
step << Priest
    #season 2
    .goto Durotar,55.41,72.84
    >>前往森金村的 |cRXP_FRIENDLY_毒蛇洛阿神灵|r 雕像处，然后输入 /kneel
    .use 205951 >>当它出现时，与|cRXP_FRIENDLY_毒蛇洛阿神灵|r交谈，然后使用|T136222:0|t[|cRXP_FRIENDLY_忧虑助祭的回忆|r]
    .complete 77642,1 --Learn Spell: Engrave Gloves - Penance
    .target 毒蛇洛阿神灵
    .skipgossip
    .emote KNEEL
step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .turnin 77642 >>洛阿的智慧
    .target 肯杰
step
    #completewith Sting
    >>拾取仙人掌旁的|cRXP_LOOT_仙人掌果|r
    .complete 4402,1 --Cactus Apple (10)
step
    #completewith Tails
    .goto Durotar,44.98,69.13,20,0
    .goto Durotar,45.64,65.70,45,0
    .goto Durotar,47.37,65.67,45,0
    >>|cRXP_WARN_使用|r |T133486:0|t[工头的木棒]|cRXP_WARN_敲醒正在睡觉的|r|cRXP_FRIENDLY_懒惰的苦工|r
    .complete 5441,1 --Peons Awoken (5)
    .target 懒惰的苦工
    .use 16114
step << !Warlock
    #completewith Imps
    >>击杀|cRXP_ENEMY_工蝎|r，拾取|cRXP_LOOT_工蝎的尾巴|r
    .complete 789,1 --Scorpid Worker Tail (10)
    .mob 工蝎
step << Hunter
    #season 2
    #label ChimeraRune
    .goto Durotar,43.26,58.28,0
    >>击杀 |cRXP_ENEMY_工蝎|r，拾取掉落的符文并右键使用，学会 |T236176:0|t[铭刻手套 - 奇美拉射击]
    .complete 77590,1 << Troll
    .complete 77584,1 << Orc
    .mob 工蝎
step << skip --Shaman
    #season 2
    #completewith OverloadRune
    >>击杀|cRXP_ENEMY_邪灵劣魔|r
    .complete 792,1 --Vile Familiar (12)
    .mob 邪灵劣魔
step << Shaman
    #season 2
    #loop
	.goto Durotar,43.26,58.28,0
    .goto Durotar,43.26,58.28,40,0
    .goto Durotar,42.81,58.41,40,0
    .goto Durotar,41.90,58.35,40,0
    .goto Durotar,41.97,59.20,40,0
    .goto Durotar,41.36,60.35,40,0
    .goto Durotar,40.66,61.27,40,0
    .goto Durotar,40.07,61.35,40,0
    .goto Durotar,39.42,61.29,40,0
    .goto Durotar,39.46,62.17,40,0
    .goto Durotar,39.55,63.10,40,0
    .goto Durotar,40.13,64.04,40,0
    .goto Durotar,40.84,64.06,40,0
    .goto Durotar,40.74,65.86,40,0
    .goto Durotar,39.93,66.03,40,0
    .goto Durotar,40.04,66.99,40,0
    .goto Durotar,40.09,67.66,40,0
    .goto Durotar,40.13,68.50,40,0
    .goto Durotar,40.72,68.55,40,0
    .goto Durotar,41.30,67.84,40,0
    .goto Durotar,41.37,66.72,40,0
    .goto Durotar,41.89,66.05,40,0
    .goto Durotar,41.27,65.71,40,0
    .goto Durotar,41.36,64.07,40,0
    .goto Durotar,41.33,63.12,40,0
    .goto Durotar,41.35,61.98,40,0
    .goto Durotar,41.49,61.25,40,0
    .goto Durotar,41.90,60.24,40,0
    .goto Durotar,42.51,59.34,40,0
    .goto Durotar,43.08,59.62,40,0
    .goto Durotar,43.91,59.33,40,0
    .goto Durotar,45.15,59.46,40,0
    .goto Durotar,45.81,59.30,40,0
    .goto Durotar,45.85,60.34,40,0
    .goto Durotar,46.46,61.11,40,0
    .goto Durotar,47.09,62.24,40,0
    .goto Durotar,47.08,63.15,40,0
    .goto Durotar,47.14,64.08,40,0
    .goto Durotar,47.58,64.04,40,0
    .goto Durotar,47.08,63.15,40,0
    .goto Durotar,47.09,62.24,40,0
    .goto Durotar,46.90,61.15,40,0
    .goto Durotar,46.98,60.18,40,0
    .goto Durotar,47.07,59.34,40,0
    .goto Durotar,46.47,58.28,40,0
    .goto Durotar,45.81,59.30,40,0
    .goto Durotar,45.15,59.46,40,0
    .goto Durotar,43.91,59.33,40,0
    >>击杀|cRXP_ENEMY_工蝎|r，拾取 |T134918:0|t[|cRXP_FRIENDLY_二价圣像|r]
    .collect 206381,1,77587,1 << Troll Shaman --Dyadic Icon (1)
    .collect 206381,1,77585,1 << Orc Shaman --Dyadic Icon (1)
    .mob 工蝎
    .train 410094,1
step << Shaman
    #season 2
    .equip 18,206381 >> |cRXP_WARN_装备|r |T134918:0|t|cRXP_LOOT_[二价圣像]|r
    .use 206381
    .itemcount 206381,1 --Dyadic Icon (1)
    .train 410094,1
    .xp <3,1
step << Shaman
    #season 2
    #loop
	.goto Durotar,43.26,58.28,0
    .goto Durotar,43.26,58.28,40,0
    .goto Durotar,42.81,58.41,40,0
    .goto Durotar,41.90,58.35,40,0
    .goto Durotar,41.97,59.20,40,0
    .goto Durotar,41.36,60.35,40,0
    .goto Durotar,40.66,61.27,40,0
    .goto Durotar,40.07,61.35,40,0
    .goto Durotar,39.42,61.29,40,0
    .goto Durotar,39.46,62.17,40,0
    .goto Durotar,39.55,63.10,40,0
    .goto Durotar,40.13,64.04,40,0
    .goto Durotar,40.84,64.06,40,0
    .goto Durotar,40.74,65.86,40,0
    .goto Durotar,39.93,66.03,40,0
    .goto Durotar,40.04,66.99,40,0
    .goto Durotar,40.09,67.66,40,0
    .goto Durotar,40.13,68.50,40,0
    .goto Durotar,40.72,68.55,40,0
    .goto Durotar,41.30,67.84,40,0
    .goto Durotar,41.37,66.72,40,0
    .goto Durotar,41.89,66.05,40,0
    .goto Durotar,41.27,65.71,40,0
    .goto Durotar,41.36,64.07,40,0
    .goto Durotar,41.33,63.12,40,0
    .goto Durotar,41.35,61.98,40,0
    .goto Durotar,41.49,61.25,40,0
    .goto Durotar,41.90,60.24,40,0
    .goto Durotar,42.51,59.34,40,0
    .goto Durotar,43.08,59.62,40,0
    .goto Durotar,43.91,59.33,40,0
    .goto Durotar,45.15,59.46,40,0
    .goto Durotar,45.81,59.30,40,0
    .goto Durotar,45.85,60.34,40,0
    .goto Durotar,46.46,61.11,40,0
    .goto Durotar,47.09,62.24,40,0
    .goto Durotar,47.08,63.15,40,0
    .goto Durotar,47.14,64.08,40,0
    .goto Durotar,47.58,64.04,40,0
    .goto Durotar,47.08,63.15,40,0
    .goto Durotar,47.09,62.24,40,0
    .goto Durotar,46.90,61.15,40,0
    .goto Durotar,46.98,60.18,40,0
    .goto Durotar,47.07,59.34,40,0
    .goto Durotar,46.47,58.28,40,0
    .goto Durotar,45.81,59.30,40,0
    .goto Durotar,45.15,59.46,40,0
    .goto Durotar,43.91,59.33,40,0
    .aura 408828 >>继续击杀|cRXP_ENEMY_工蝎|r；它们对你造成自然伤害时，你会获得 |T237556:0|t[灵感勃发]层数，直到叠满10层
    .mob 工蝎
    .train 410094,1
    --User must be level 3 to be able to use item!
step << Shaman
    #season 2
    #label OverloadRune
    >>叠满十层灵感后，右键使用装备的 |T134918:0|t[二价圣像]，学会 |T136014:0|t[铭刻胸甲 - 过载]
    .use 206381
    .complete 77587,1 << Troll
    .complete 77585,1 << Orc
    .train 410094,1
step << skip --Hunter
    #season 2
    #completewith ChimeraRune
    >>击杀|cRXP_ENEMY_邪灵劣魔|r
    .complete 792,1 --Vile Familiar (12)
    .mob 邪灵劣魔
step << !Warlock
    #label Imps
    #loop
    .goto Durotar,43.87,58.42,0
    .goto Durotar,43.87,58.42,40,0
    .goto Durotar,44.53,58.62,40,0
    .goto Durotar,45.18,58.42,40,0
    .goto Durotar,45.83,58.59,40,0
    .goto Durotar,45.79,57.43,40,0
    .goto Durotar,46.46,57.57,40,0
    .goto Durotar,47.19,57.12,40,0
    .goto Durotar,46.21,56.69,40,0
    .goto Durotar,46.28,56.11,40,0
    .goto Durotar,45.65,56.90,40,0
    .goto Durotar,45.35,56.32,40,0
    .goto Durotar,44.77,56.87,40,0
    .goto Durotar,44.58,56.10,40,0
    .goto Durotar,44.27,56.59,40,0
    .goto Durotar,43.85,55.52,40,0
    >>击杀|cRXP_ENEMY_邪灵劣魔|r
    .complete 792,1 --Vile Familiar (12)
    .mob 邪灵劣魔
step
    #label Tails
    #loop
    .goto Durotar,43.26,58.28,0
    .goto Durotar,43.26,58.28,40,0
    .goto Durotar,42.81,58.41,40,0
    .goto Durotar,41.90,58.35,40,0
    .goto Durotar,41.97,59.20,40,0
    .goto Durotar,41.36,60.35,40,0
    .goto Durotar,40.66,61.27,40,0
    .goto Durotar,40.07,61.35,40,0
    .goto Durotar,39.42,61.29,40,0
    .goto Durotar,39.46,62.17,40,0
    .goto Durotar,39.55,63.10,40,0
    .goto Durotar,40.13,64.04,40,0
    .goto Durotar,40.84,64.06,40,0
    .goto Durotar,40.74,65.86,40,0
    .goto Durotar,39.93,66.03,40,0
    .goto Durotar,40.04,66.99,40,0
    .goto Durotar,40.09,67.66,40,0
    .goto Durotar,40.13,68.50,40,0
    .goto Durotar,40.72,68.55,40,0
    .goto Durotar,41.30,67.84,40,0
    .goto Durotar,41.37,66.72,40,0
    .goto Durotar,41.89,66.05,40,0
    .goto Durotar,41.27,65.71,40,0
    .goto Durotar,41.36,64.07,40,0
    .goto Durotar,41.33,63.12,40,0
    .goto Durotar,41.35,61.98,40,0
    .goto Durotar,41.49,61.25,40,0
    .goto Durotar,41.90,60.24,40,0
    .goto Durotar,42.51,59.34,40,0
    .goto Durotar,43.08,59.62,40,0
    .goto Durotar,43.91,59.33,40,0
    .goto Durotar,45.15,59.46,40,0
    .goto Durotar,45.81,59.30,40,0
    .goto Durotar,45.85,60.34,40,0
    .goto Durotar,46.46,61.11,40,0
    .goto Durotar,47.09,62.24,40,0
    .goto Durotar,47.08,63.15,40,0
    .goto Durotar,47.14,64.08,40,0
    .goto Durotar,47.58,64.04,40,0
    .goto Durotar,47.08,63.15,40,0
    .goto Durotar,47.09,62.24,40,0
    .goto Durotar,46.90,61.15,40,0
    .goto Durotar,46.98,60.18,40,0
    .goto Durotar,47.07,59.34,40,0
    .goto Durotar,46.47,58.28,40,0
    .goto Durotar,45.81,59.30,40,0
    .goto Durotar,45.15,59.46,40,0
    .goto Durotar,43.91,59.33,40,0
    >>击杀|cRXP_ENEMY_工蝎|r，拾取|cRXP_LOOT_工蝎的尾巴|r
    .complete 789,1 --Scorpid Worker Tail (10)
    .mob 工蝎
step
    #loop
	.goto Durotar,44.98,69.13,0
	.goto Durotar,44.98,69.13,25,0
	.goto Durotar,45.64,65.70,25,0
	.goto Durotar,47.37,65.67,25,0
	.goto Durotar,46.74,60.66,25,0
	.goto Durotar,47.09,57.90,25,0
	.goto Durotar,43.90,57.79,25,0
	.goto Durotar,42.70,57.25,25,0
	.goto Durotar,41.27,58.95,25,0
	.goto Durotar,40.91,60.41,25,0
	.goto Durotar,38.83,61.84,25,0
    >>|cRXP_WARN_使用|r |T133486:0|t[工头的木棒]|cRXP_WARN_敲醒正在睡觉的|r|cRXP_FRIENDLY_懒惰的苦工|r
    .complete 5441,1 --Peons Awoken (5)
    .target 懒惰的苦工
    .use 16114
step
    #xprate <1.5
    #loop
    .goto Durotar,41.30,65.03,0
    .goto Durotar,41.30,65.03,40,0
    .goto Durotar,41.92,64.74,40,0
    .goto Durotar,42.66,64.92,40,0
    .goto Durotar,43.31,65.02,40,0
    .goto Durotar,43.90,65.96,40,0
    .goto Durotar,44.54,65.96,40,0
    .goto Durotar,45.16,65.77,40,0
    .goto Durotar,45.72,65.93,40,0
    .goto Durotar,45.72,65.04,40,0
    .goto Durotar,45.21,63.95,40,0
    .goto Durotar,45.83,63.01,40,0
    .goto Durotar,45.81,62.17,40,0
    .goto Durotar,45.78,61.14,40,0
    .goto Durotar,45.15,60.20,40,0
    .goto Durotar,44.50,59.45,40,0
    .goto Durotar,43.86,60.43,40,0
    .goto Durotar,43.07,60.24,40,0
    .goto Durotar,42.58,60.09,40,0
    .goto Durotar,42.02,61.19,40,0
    .goto Durotar,42.02,62.15,40,0
    .goto Durotar,42.00,62.92,40,0
    .goto Durotar,41.99,64.03,40,0
    .xp 4 >> 刷到 4 级
    .mob 杂斑野猪
    .mob 工蝎
    .mob 邪灵劣魔
step
    .goto Durotar,42.73,67.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .turnin 4402 >>戈加尔的清凉果
    .target 戈加尔
    .isQuestComplete 4402
step
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（她有售）|r << !Rogue !Warrior !Hunter !Shaman
    >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_（她有售）|r << Hunter
    .collect 159,5,6394,1 << !Rogue !Warrior !Hunter !Shaman --Refreshing Spring Water (5)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >> 出售杂物
    .target 多克纳
    .money >0.1 << Rogue/Warrior
    .itemcount 159,<5 << !Rogue !Warrior !Hunter !Shaman
    .itemcount 2512,<600 << Hunter
step
    #label Sting
    .goto Durotar,42.29,68.39,12,0
    .goto Durotar,42.06,68.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 789,2 >>工蝎的尾巴 << Shaman
    .turnin 789 >>工蝎的尾巴 << !Shaman
    .target 高内克
step << Shaman
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .train 8042 >> 学习 |T136026:0|t[地震术]
    .turnin 77587 >>力量圣像 << Troll Shaman
    .turnin 77585 >>力量圣像 << Orc Shaman
    .goto Durotar,42.39,69.00
    .accept 1516 >>大地的召唤
    .goto Durotar,42.40,69.17
    .target 史克里克
    .target 坎纳甘·地鸣
step << Shaman
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .train 8042 >> 学习 |T136026:0|t[地震术]
    .goto Durotar,42.39,69.00
    .accept 1516 >>大地的召唤
    .goto Durotar,42.40,69.17
    .target 史克里克
    .target 坎纳甘·地鸣
step << Mage
    #season 0,1
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .train 116 >> 学习 |T135846:0|t[寒冰箭]
    .target 迈安
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .money <0.011
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .money <0.01
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 589 >> 学习职业技能
    .turnin 3085 >>神圣石板
    .money <0.021
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .turnin 3085 >>神圣石板
    .money <0.011
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .turnin 3085 >>神圣石板
    .money <0.01
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯杰|r 交谈
    .turnin 3085 >> 交任务：神圣石板
    .target 肯杰
step << !Warlock
	.goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 792 >>邪灵劣魔
    .accept 794 >>火刃奖章
    .target 祖雷萨
step << Hunter
    #season 2
    #optional
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .turnin 77590 >>崎岖地形 << Troll Hunter
    .turnin 77584 >>搜寻符文 << Orc Hunter
    .target 基沙
    .xp <4,1
    .money <0.01
step << Hunter
    #season 2
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 77590 >>崎岖地形 << Troll Hunter
    .turnin 77584 >>搜寻符文 << Orc Hunter
    .target 基沙
step << Hunter
    #season 0,1
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 基沙
    .xp <4,1
    .money <0.01
step << Warrior
    #xprate <1.5
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
    .money <0.02
    .train 772,1
step << Warrior
    #xprate <1.5
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
step << Warrior
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .target 弗朗恩
    .money <0.01
step
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔兹利尔|r交谈
    .turnin 5441 >>懒惰的苦工
    .accept 6394 >>塔兹利尔的镐
    .target 工头塔兹利尔
step
    #xprate <1.5
    #completewith next
    .xp 4+1720 >> 刷怪至 1720+/2100 经验值
    .mob 杂斑野猪
    .mob 工蝎
    .mob 邪灵劣魔
    .isOnQuest 4402
step
    #loop
	.goto Durotar,44.67,64.92,0
	.goto Durotar,43.45,62.96,25,0
	.goto Durotar,43.82,62.72,25,0
	.goto Durotar,44.85,61.54,25,0
	.goto Durotar,44.88,59.66,25,0
	.goto Durotar,44.61,58.20,25,0
	.goto Durotar,45.46,58.49,25,0
	.goto Durotar,45.93,60.62,25,0
	.goto Durotar,46.87,60.36,25,0
	.goto Durotar,47.28,62.80,25,0
	.goto Durotar,46.08,62.98,25,0
	.goto Durotar,44.67,64.92,25,0
    >>拾取仙人掌旁的|cRXP_LOOT_仙人掌果|r
    .complete 4402,1 --Cactus Apple (10)
step << !Warrior !Rogue !Shaman
    #optional
    #xprate <1.5
    #loop
    .goto Durotar,43.87,58.42,0
    .goto Durotar,43.87,58.42,40,0
    .goto Durotar,44.53,58.62,40,0
    .goto Durotar,45.18,58.42,40,0
    .goto Durotar,45.83,58.59,40,0
    .goto Durotar,45.79,57.43,40,0
    .goto Durotar,46.46,57.57,40,0
    .goto Durotar,47.19,57.12,40,0
    .goto Durotar,46.21,56.69,40,0
    .goto Durotar,46.28,56.11,40,0
    .goto Durotar,45.65,56.90,40,0
    .goto Durotar,45.35,56.32,40,0
    .goto Durotar,44.77,56.87,40,0
    .goto Durotar,44.58,56.10,40,0
    .goto Durotar,44.27,56.59,40,0
    .goto Durotar,43.85,55.52,40,0
    .xp 4+1720 >> 刷怪至 1720+/2100 经验值
    .mob 邪灵劣魔
    .isOnQuest 4402
step << !Warrior !Rogue !Shaman
    #xprate <1.5
    #optional
    #loop
    .goto Durotar,43.87,58.42,40,0
    .goto Durotar,44.53,58.62,40,0
    .goto Durotar,45.18,58.42,40,0
    .goto Durotar,45.83,58.59,40,0
    .goto Durotar,45.79,57.43,40,0
    .goto Durotar,46.46,57.57,40,0
    .goto Durotar,47.19,57.12,40,0
    .goto Durotar,46.21,56.69,40,0
    .goto Durotar,46.28,56.11,40,0
    .goto Durotar,45.65,56.90,40,0
    .goto Durotar,45.35,56.32,40,0
    .goto Durotar,44.77,56.87,40,0
    .goto Durotar,44.58,56.10,40,0
    .goto Durotar,44.27,56.59,40,0
    .goto Durotar,43.85,55.52,40,0
    .xp 5 >> 刷到 5 级
    .mob 邪灵劣魔
    .isQuestTurnedIn 4402
step
	#completewith Thazz
    #label Cave
    .goto Durotar,45.35,56.27,30 >>进入洞穴
    .isOnQuest 6394
step
	#completewith Thazz
    #requires Cave
    .goto Durotar,45.37,55.39,15,0
    .goto Durotar,44.43,54.51,15,0
    .goto Durotar,43.72,53.79,10 >>前去找|cRXP_LOOT_塔兹利尔的镐|r
    .isOnQuest 6394
step << Shaman
    #completewith Yarrog
    #requires Cave
    >>击杀|cRXP_ENEMY_地狱捕猎者|r，拾取|cRXP_LOOT_地狱捕猎者的蹄子|r
    .complete 1516,1 --Felstalker Hoof (2)
    .mob 地狱捕猎者
step
    #label Thazz
    .goto Durotar,43.72,53.79
    >>在墙边拾取|cRXP_LOOT_塔兹利尔的镐|r
    .complete 6394,1 --Thazz'ril's Pick (1)
step << Warlock
    #season 2
    .goto Durotar,43.00,54.40
    >>打开洞穴水池底部的箱子，拾取其中的符文并右键使用，学会 |T136223:0|t[铭刻手套 - 鬼影缠身]
    .complete 77586,1
    .isOnQuest 77586
step << Troll Mage
    #season 2
    .goto Durotar,43.00,54.40
    >>打开洞穴水池底部的箱子，拾取其中的法术笔记并右键使用，学会 |T135844:0|t[铭刻手套 - 冰枪术]
    .complete 77643,1
    .isOnQuest 77643
step
    #label Yarrog
    .goto Durotar,42.70,52.99
    >>击杀|cRXP_ENEMY_亚罗格·刺影|r，拾取|cRXP_LOOT_火刃奖章|r
    .complete 794,1 --Burning Blade Medallion (1)
	.mob 亚罗格·刺影
step << Shaman
    #loop
	.goto Durotar,42.70,52.99,0
	.goto Durotar,42.70,52.99,25,0
	.goto Durotar,42.97,51.14,25,0
	.goto Durotar,43.56,52.05,25,0
	.goto Durotar,43.74,52.65,25,0
	.goto Durotar,44.13,52.85,25,0
	.goto Durotar,44.82,52.51,25,0
	.goto Durotar,44.83,53.40,25,0
	.goto Durotar,44.78,54.57,25,0
	.goto Durotar,45.14,55.02,25,0
	.goto Durotar,45.51,55.23,25,0
	.goto Durotar,45.14,55.02,25,0
	.goto Durotar,44.51,55.03,25,0
	.goto Durotar,44.21,54.12,25,0
	.goto Durotar,43.92,54.30,25,0
	.goto Durotar,43.87,55.22,25,0
	.goto Durotar,43.46,55.56,25,0
	.goto Durotar,43.05,55.24,25,0
	.goto Durotar,42.38,54.22,25,0
	.goto Durotar,42.53,53.48,25,0
	.goto Durotar,43.27,53.82,25,0
    >>击杀|cRXP_ENEMY_地狱捕猎者|r，拾取|cRXP_LOOT_地狱捕猎者的蹄子|r
    .complete 1516,1 --Felstalker Hoof (2)
    .mob 地狱捕猎者
step
    #optional
    #xprate <1.5
    #loop
	.goto Durotar,42.70,52.99,25,0
	.goto Durotar,42.97,51.14,25,0
	.goto Durotar,43.56,52.05,25,0
	.goto Durotar,43.74,52.65,25,0
	.goto Durotar,44.13,52.85,25,0
	.goto Durotar,44.82,52.51,25,0
	.goto Durotar,44.83,53.40,25,0
	.goto Durotar,44.78,54.57,25,0
	.goto Durotar,45.14,55.02,25,0
	.goto Durotar,45.51,55.23,25,0
	.goto Durotar,45.14,55.02,25,0
	.goto Durotar,44.51,55.03,25,0
	.goto Durotar,44.21,54.12,25,0
	.goto Durotar,43.92,54.30,25,0
	.goto Durotar,43.87,55.22,25,0
	.goto Durotar,43.46,55.56,25,0
	.goto Durotar,43.05,55.24,25,0
	.goto Durotar,42.38,54.22,25,0
	.goto Durotar,42.53,53.48,25,0
	.goto Durotar,43.27,53.82,25,0
    .xp 5+1680 >> 刷到 1680+/2800经验值 << !Shaman
    .xp 5+690 >> 刷到 690+/2800经验值 << Shaman
    .isQuestTurnedIn 4402
step
    #xprate <1.5
    #optional
    #loop
	.goto Durotar,42.70,52.99,25,0
	.goto Durotar,42.97,51.14,25,0
	.goto Durotar,43.56,52.05,25,0
	.goto Durotar,43.74,52.65,25,0
	.goto Durotar,44.13,52.85,25,0
	.goto Durotar,44.82,52.51,25,0
	.goto Durotar,44.83,53.40,25,0
	.goto Durotar,44.78,54.57,25,0
	.goto Durotar,45.14,55.02,25,0
	.goto Durotar,45.51,55.23,25,0
	.goto Durotar,45.14,55.02,25,0
	.goto Durotar,44.51,55.03,25,0
	.goto Durotar,44.21,54.12,25,0
	.goto Durotar,43.92,54.30,25,0
	.goto Durotar,43.87,55.22,25,0
	.goto Durotar,43.46,55.56,25,0
	.goto Durotar,43.05,55.24,25,0
	.goto Durotar,42.38,54.22,25,0
	.goto Durotar,42.53,53.48,25,0
	.goto Durotar,43.27,53.82,25,0
    .xp 5+1300 >> 刷到 1300+/2800经验值 << !Shaman
    .xp 5+310 >> 刷到 310+/2800经验值 << Shaman
    .isOnQuest 4402
step << skip
	#completewith next
    .goto Durotar,44.70,52.47
    .goto Durotar,53.55,44.68,30 >>|cRXP_WARN_将角色移动到岩石边缘，直到看起来悬空，然后退出游戏再重新登录，以此跳过一段路程|r
	.link https://www.youtube.com/watch?v=7vmnvdjbUnM >> 点击这里查看示例
step
    #softcore
    #completewith next
    .goto Durotar,44.70,52.47
    .deathskip >> |cRXP_WARN_死亡后在箭头附近的|cRXP_FRIENDLY_灵魂医者|r处复活|r
    .target 灵魂医者
step
    #softcore
    #label Betrayers
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加索克|r交谈
    >>|cRXP_WARN_可以隔着地堡外墙或者在房顶跟他对话|r
    .accept 784 >>背信弃义的人类
    .target 加索克
step
    #softcore
    #completewith next
    .goto Durotar,50.22,43.06,12,0
    .goto Durotar,50.09,42.97,8,0
    .goto Durotar,50.20,42.30,12,0
    .goto Durotar,49.96,40.96,12,0
    .goto Durotar,49.67,40.42,10 >>朝塔楼方向走
step
    #softcore
    #completewith next
    .goto Durotar,49.75,40.38,6,0
    .goto Durotar,49.77,40.24,6,0
    .goto Durotar,49.69,40.21,6,0
    .goto Durotar,49.68,40.30,6,0
    .goto Durotar,49.78,40.34,6,0
    .goto Durotar,49.79,39.96,6,0
    .goto Durotar,49.60,40.04,8 >>沿塔楼向上走，前往弗恩·凝眉处
step
    #softcore
    .goto Durotar,49.89,40.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .accept 791 >>新的背包
    .target 弗恩·凝眉
step << Warrior/Rogue
    #softcore
    .goto Durotar,51.81,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克鲁恩|r 交谈
    .train 2575 >> 学习专业技能：|T136248:0|t[采矿]
    >>|cRXP_WARN_这样就能从矿点采集|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r，|cRXP_WARN_用来制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（武器伤害 +2，持续 30 分钟）|r
    .target 克鲁恩
step << Warrior/Rogue
    #softcore
    .goto Durotar,51.90,41.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃克|r交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄]|cRXP_BUY_（售卖者：|r|cRXP_BUY_沃克）|r
    .collect 2901,1,784,1 --Mining Pick (1)
    .target 沃克
step << Warrior/Rogue
    #softcore
    .goto Durotar,52.05,40.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜克|r 交谈
    .train 2018 >> 学习|T136241:0|t[锻造]
    .target 杜克
    .skill blacksmithing,1,1
step
    #completewith next
    .hs >>炉石回到试炼谷
    .use 6948
step
    #xprate <1.5
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔兹利尔|r交谈
    .turnin 6394 >>塔兹利尔的镐
    .target 工头塔兹利尔
step
    .goto Durotar,42.73,67.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .turnin 4402 >>戈加尔的清凉果
    .target 戈加尔
step
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >> 出售杂物
    .target 多克纳
    .money >0.03
step
    .goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 794 >>火刃奖章
    .accept 805 >>去森金村报到
    .target 祖雷萨
step << Priest
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
	.accept 5649 >> 部族的传统
	.train 591 >>学习 |T135924:0|t[惩击]
    .train 17 >>学习 |T135940:0|t[真言术：盾]
    .target 肯杰
step << Mage
    #season 2
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .train 143 >> 学习 |T135812:0|t[火球术]
    .train 2136 >>学习 |T135807:0|t[火焰冲击]
    .turnin 77643 >> 法术研究
    .target 迈安
    .isQuestComplete 77643
step << Mage
    #season 0,1
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .train 143 >> 学习 |T135812:0|t[火球术]
    .train 2136 >>学习 |T135807:0|t[火焰冲击]
    .target 迈安
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .train 332 >>学习 |T136052:0|t[治疗波]
    .target +史克里克
    .goto Durotar,42.39,69.00
    .turnin 1516 >>大地的召唤
    .accept 1517 >>大地的召唤
    .target +坎纳甘·地鸣
    .goto Durotar,42.40,69.17
    .xp <6,1
step << Shaman
    .goto Durotar,42.40,69.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .turnin 1516 >>大地的召唤
    .accept 1517 >>大地的召唤
    .target 坎纳甘·地鸣
step << Hunter
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .train 1130 >>学习 |T132212:0|t[猎人印记]
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target 基沙
    .money <0.02
step << Hunter
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target 基沙
step << Warrior
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .train 6343 >>学习 |T136105:0|t[雷霆一击]
    .target 弗朗恩
    .money <0.02
step << Warrior
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .target 弗朗恩
step << Rogue
    #completewith RogueTraining
    .goto Durotar,42.13,68.41,15,0
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.27,68.00,12 >>朝|cRXP_FRIENDLY_鲁瓦格|r方向前进
step << Rogue
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .train 1757 >> 学习 |T136189:0|t[邪恶攻击]
    .train 1776 >> 学习 |T132155:0|t[凿击]
    .target 鲁瓦格
    .money <0.02
    .xp <6,1
step << Rogue
    #label RogueTraining
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .train 1757 >> 学习 |T136189:0|t[邪恶攻击]
    .target 鲁瓦格
    .xp <6,1
step << Warlock
    #completewith Hraug3
    .goto Durotar,42.13,68.41,15,0
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>朝|cRXP_FRIENDLY_赫劳格|r方向前进
step << Warlock
    #label Hraug3
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    >>|cRXP_BUY_向他购买|r |T133738:0|t[魔典:血契]|cRXP_BUY_|r
    .collect 16321,1,817,1 --Grimoire of Blood Pact
    .vendor >>出售杂物
    .target 赫劳格
    .money <0.03
    .train 6307,1 --Blood Pact (Rank 1)
step << Warlock
    #season 2
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .train 1454 >> 学习 |T136126:0|t[生命分流]
    .turnin 77586 >>失窃的力量
    .target 纳托克
    .money <0.02
step << Warlock
    #season 2
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .turnin 77586 >>失窃的力量
    .target 纳托克
step << Warlock
    #season 0,1
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .train 1454 >> 学习 |T136126:0|t[生命分流]
    .target 纳托克
    .money <0.02
step << Warlock
    #season 0,1
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .target 纳托克
step << Shaman
    #completewith CallOE1
    #label Shrine
    .goto Durotar,43.36,69.60,25,0
    .goto Durotar,43.18,70.93,25,0
    .goto Durotar,41.31,73.63,12,0
    .goto Durotar,40.82,74.37,8,0
    .goto Durotar,42.71,75.18,10,0
    .goto Durotar,43.57,75.51,15,0
    .goto Durotar,44.13,76.36,25 >>朝|cRXP_PICK_萨满圣地|r方向前进
    .isOnQuest 1517
step << Shaman
    #completewith next
    #requires Shrine
    .cast 8202 >>|cRXP_WARN_使用|r |T134743:0|t[大地灵契]
    .use 6635
step << Shaman
    #label CallOE1
    .goto Durotar,44.03,76.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大地之魂|r交谈
    .turnin 1517 >>大地的召唤
    .accept 1518 >>大地的召唤
    .target 大地之魂
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .goto Durotar,42.40,69.17
    .turnin 1518 >>大地的召唤
    .target 坎纳甘·地鸣
step << Shaman
    .goto Durotar,42.39,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .train 332 >>学习 |T136052:0|t[治疗波]
    .target 史克里克
step
    #xprate >1.49
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔兹利尔|r交谈
    .turnin 6394 >>塔兹利尔的镐
    .target 工头塔兹利尔
step
    #label Leave
    .goto Durotar,47.09,69.21,25,0
    .goto Durotar,49.02,69.13,20,0
    .goto Durotar,49.90,68.43,25 >>离开试炼谷
    .isOnQuest 805
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate <1.99
<< Horde
#name 6-10 Durotar
#version 11
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 10-12 Durotar
#displayname 6-10 杜隆塔尔
step
    .goto Durotar,52.06,68.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌克尔|r交谈
    .accept 2161 >>接任务：苦工的重担
    .target 乌克尔
step
    #completewith next
    .subzone 367 >>前往森金村
step
    #xprate <1.5
    #loop
    .goto Durotar,54.20,73.36,0
    .goto Durotar,54.09,76.31,25,0
    .goto Durotar,54.52,74.83,25,0
    .goto Durotar,54.20,73.36,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔·猎齿|r交谈。他正在附近巡逻
    .accept 786 >>接任务：科卡尔半人马的进攻
    .target 拉尔·猎齿
step
    #label SenjinPickups
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尔林|r、|cRXP_FRIENDLY_沃纳尔|r和|cRXP_FRIENDLY_加德林|r交谈
    .accept 817 >>接任务：生活所需的虎皮
    .target +维尔林·长牙
    .goto Durotar,55.95,73.93
    .accept 818 >>接任务：沃纳尔大师
    .target +沃纳尔大师
    .goto Durotar,55.94,74.40
    .turnin 805 >>交任务：去森金村报到
    .accept 808 >>接任务：明希纳的颅骨
    .accept 826 >>接任务：扎拉赞恩
    .accept 823 >>接任务：向奥戈尼尔报告
    .target +加德林大师
    .goto Durotar,55.94,74.72
step
    #completewith next
    .goto Durotar,56.16,74.43,8,0
    .goto Durotar,56.31,73.8,8 >> 进入大屋
step << Rogue
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_克瓦埃|r|cRXP_BUY_交谈，然后向她购买一把|r |T132414:0|t[增重飞斧]|cRXP_BUY_。|r
    .collect 3131,200,786,1 << !tbc
    .collect 29007,1,786,1 << tbc
    .target 克瓦埃
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Warlock/Mage/Priest
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_克瓦埃|r交谈
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r --Refreshing Spring Water (20)
    .collect 159,20,786,1
    .target 克瓦埃
    .money <0.010
step << Warlock/Mage/Priest
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_克瓦埃|r交谈
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r --Refreshing Spring Water (10)
    .collect 159,10,786,1
    .target 克瓦埃
    .money <0.0050
step << Shaman
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后有足够的钱购买 |T135145:0|t[学徒短杖]（5银04铜），就卖掉武器；如果钱还不够，稍后再回来。
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，然后向他购买一根|r |T135145:0|t[学徒短杖]|cRXP_BUY_。|r
    .collect 2495,1,786,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后有足够的钱购买 |T135641:0|t[卷刃的剑]（4银01铜），就卖掉武器；如果钱还不够，稍后再回来。
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，然后向他购买一把|r |T135641:0|t[卷刃的剑]|cRXP_BUY_。|r
    .collect 2494,1,786,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后有足够的钱购买 |T132401:0|t[双刃战斧]（4银84铜），就卖掉武器；如果钱还不够，稍后再回来。
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，然后向他购买一把|r |T132401:0|t[双刃战斧]|cRXP_BUY_。|r
    .collect 2491,1,786,1 --Collect Large Axe (1)
    .money <0.0484
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后有足够的钱购买 |T135421:0|t[小手斧]（5银40铜），就卖掉武器；如果钱还不够，稍后再回来。
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，然后向他购买一把|r |T135421:0|t[小手斧]|cRXP_BUY_。|r
    .collect 2490,1,786,1 --Collect Tomahawk (1)
    .money <0.0540
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后有足够的钱购买 |T135499:0|t[角木弯弓]（2银83铜），就卖掉武器；如果钱还不够，稍后再回来。
    .target 特莱耶克
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，然后向他购买一张|r |T135499:0|t[角木弯弓]|cRXP_BUY_。|r
    .collect 2506,1,786,1 --Collect Hornwood Recurve Bow (1)
    .money <0.0283
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Rogue
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T132414:0|t[增重飞斧]
    .use 3131 << !tbc
    .use 29007 << tbc
    .itemcount 3131,1 << !tbc
    .itemcount 29007,1 << tbc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Shaman
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Mage
    .goto Durotar,56.30,75.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安苏瓦|r交谈
    .train 143 >> 学习 |T135812:0|t[火球术]
    .train 2136 >>学习 |T135807:0|t[火焰冲击]
    .target 安苏瓦
step << Warrior/Rogue
    #softcore
    #completewith TravelToTiragarde
    +|cRXP_WARN_施放|r |T136025:0|t[寻找矿物] |cRXP_WARN_并挖掘找到的铜矿脉，获得|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，再用它们制作|r |T135248:0|t[磨刀石] |cRXP_WARN_。|r
    .collect 2862,1,837,1
    .skill blacksmithing,<1,1
    .train 2575,3 --Mining Trained
step
    #xprate >1.49
    #completewith next
    .goto Durotar,58.54,75.89,40,0
    .goto Durotar,57.73,77.91,40,0
    .goto Durotar,55.72,79.62,40,0
    .goto Durotar,54.23,82.26,40,0
    .goto Durotar,52.20,83.00,40,0
    >>沿海滩前进，击杀|cRXP_ENEMY_海蟹|r和|cRXP_ENEMY_龙虾人|r，拾取|cRXP_LOOT_蟹胶|r和|cRXP_LOOT_龙虾人的眼球|r。此步骤无需在这里完成。
    .complete 818,2,4 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1,2 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #xprate >1.49
    .goto Durotar,54.17,82.60,75 >> 跑到海滩尽头
step
    #xprate <1.5
    #completewith next
    .goto Durotar,58.54,75.89,40,0
    .goto Durotar,57.73,77.91,40,0
    .goto Durotar,55.72,79.62,40,0
    .goto Durotar,54.23,82.26,40,0
    .goto Durotar,52.20,83.00,40,0
    >>沿海滩前进，击杀|cRXP_ENEMY_海蟹|r和|cRXP_ENEMY_龙虾人|r，拾取|cRXP_LOOT_蟹胶|r和|cRXP_LOOT_龙虾人的眼球|r。此步骤无需在这里完成。
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #xprate <1.5
    .goto Durotar,52.20,83.00,75 >> 跑到海滩尽头
    .isOnQuest 818
step
    #xprate <1.5
    #completewith Bonfire
    >>击杀|cRXP_ENEMY_科卡尔苦工|r和|cRXP_ENEMY_科卡尔前锋|r，拾取|cRXP_LOOT_帆布脚料|r
--   >>|cRXP_WARN_Do not focus on completing this|r
    .complete 791,1 --Canvas Scraps (8)
    .isOnQuest 791
step
    #xprate <1.5
    .goto Durotar,50.9,79.2,30 >>进入科卡尔营地
    .isOnQuest 786
step << Priest
    #xprate <1.5
    #sticky
    #softcore
    #label Linen
    #completewith DurotarEnd
    >>|cRXP_WARN_开始收集3组|r |T132889:0|t[亚麻布] |cRXP_WARN_，在杜隆塔尔做任务时顺便收集，稍后用它们制作魔杖|r
    >>|cRXP_WARN_如果已经买到魔杖，或能在拍卖行低价买到，就跳过这一步。|r
    .collect 2589,60 --Linen Cloth (60)
step << Priest
    #xprate <1.5
    #sticky
    #hardcore
    #label Linen
    #completewith DurotarEnd
    >>|cRXP_WARN_开始收集3组|r |T132889:0|t[亚麻布] |cRXP_WARN_，在杜隆塔尔做任务时顺便收集，稍后用它们制作魔杖|r
    .collect 2589,60 --Linen Cloth (60)
step
    #sticky
    #xprate <1.5
    #completewith Bonfire
    +|cRXP_WARN_如果|r|cRXP_ENEMY_科卡尼斯|r|cRXP_WARN_出现，请小心；他是9级稀有怪。你可能需要使用一瓶|r |T134829:0|t[初级治疗药水]|cRXP_WARN_（如果有）|r
    .unitscan 科卡尼斯
step << Warrior
    #xprate <1.5
    #season 2
    #completewith Bonfire
    >>击杀|cRXP_ENEMY_科卡尔苦工|r和|cRXP_ENEMY_科卡尔前锋|r，拾取|cRXP_LOOT_被砍下的半人马的头|r
    .collect 207062,1 --Severed Centaur Head (1)
    .mob 科卡尔苦工
    .mob 科卡尔前锋
    .train 403475,1
step
    #xprate <1.5
    .goto Durotar,49.81,81.29
    >>烧毁帐篷内地上的|cRXP_PICK_作战计划|r
    .complete 786,1 --Attack Plan: Valley of Trials destroyed (1)
step
    #xprate <1.5
    >>烧毁地上的|cRXP_PICK_作战计划|r
    .goto Durotar,47.66,77.34
    .complete 786,2 --Attack Plan: Sen'jin Village destroyed (1)
step
    #xprate <1.5
    #label Bonfire
    >>烧毁地上的|cRXP_PICK_作战计划|r
    .goto Durotar,46.23,78.94
    .complete 786,3 --Attack Plan: Orgrimmar destroyed (1)
step << Warrior
    #season 2
    #loop
    .goto Durotar,50.10,79.24,0
    .goto Durotar,50.10,79.24,40,0
    .goto Durotar,47.74,80.35,40,0
    .goto Durotar,46.54,80.12,40,0
    >>击杀|cRXP_ENEMY_科卡尔苦工|r和|cRXP_ENEMY_科卡尔前锋|r，拾取|cRXP_LOOT_被砍下的半人马的头|r
    .collect 207062,1 --Severed Centaur Head (1)
    .mob 科卡尔苦工
    .mob 科卡尔前锋
    .train 403475,1
step
    #xprate <1.5
    #softcore
    .goto Durotar,46.43,79.25,-1
    .goto Durotar,57.50,73.26,-1
    .deathskip >> 在篝火处死亡，然后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .isQuestComplete 786
step
    #xprate <1.5
    #hardcore
    #completewith next
    .goto Durotar,50.95,79.14,30 >>离开科卡尔营地
    .isQuestComplete 786
step
    #hardcore
    #xprate <1.5
    #loop
    .goto Durotar,54.20,73.36,0
    .goto Durotar,54.09,76.31,25,0
    .goto Durotar,54.52,74.83,25,0
    .goto Durotar,54.20,73.36,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔·猎齿|r交谈。他正在附近巡逻
    .turnin 786,1 >>交任务：科卡尔半人马的进攻 << Shaman
    .turnin 786 >>交任务：科卡尔半人马的进攻 << !Shaman
    .target 拉尔·猎齿
    .isQuestComplete 786
step << Shaman
    #xprate <1.5
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后能凑够购买 |T135145:0|t[学徒短杖]（5银04铜）的钱，就卖掉武器；如果钱还不够，稍后再回来。
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman
    #xprate <1.5
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，然后向他购买一根|r |T135145:0|t[学徒短杖]|cRXP_BUY_。|r
    .collect 2495,1,784,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    #xprate <1.5
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后能凑够购买 |T135641:0|t[卷刃的剑]（4银01铜）的钱，就卖掉武器；如果钱还不够，稍后再回来。
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.5
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，然后向他购买一把|r |T135641:0|t[卷刃的剑]|cRXP_BUY_。|r
    .collect 2494,1,784,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #xprate <1.5
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后能凑够购买 |T132401:0|t[双刃战斧]（4 银 84 铜）的钱，就卖掉武器；如果钱还不够，稍后再回来。
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    #xprate <1.5
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，然后向他购买一把|r |T132401:0|t[双刃战斧]|cRXP_BUY_。|r
    .collect 2491,1,784,1 --Collect Large Axe (1)
    .money <0.0484
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #xprate <1.5
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后能凑够购买 |T135421:0|t[小手斧]（5 银 40 铜）的钱，就卖掉武器；如果钱还不够，稍后再回来。
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    #xprate <1.5
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，然后向他购买一把|r |T135421:0|t[小手斧]|cRXP_BUY_。|r
    .collect 2490,1,784,1 --Collect Tomahawk (1)
    .money <0.0540
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    #xprate <1.5
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后能凑够购买 |T135499:0|t[角木弯弓]（2 银 83 铜）的钱，就卖掉武器；如果钱还不够，稍后再回来。
    .target 特莱耶克
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    #xprate <1.5
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，然后向他购买一张|r |T135499:0|t[角木弯弓]|cRXP_BUY_。|r
    .collect 2506,1,784,1 --Collect Hornwood Recurve Bow (1)
    .money <0.0283
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Rogue
    #xprate <1.5
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T132414:0|t[增重飞斧]
    .use 3131 << !tbc
    .use 29007 << tbc
    .itemcount 3131,1 << !tbc
    .itemcount 29007,1 << tbc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Shaman
    #xprate <1.5
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    #xprate <1.5
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #xprate <1.5
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #xprate <1.5
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    #xprate <1.5
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step
    #xprate <1.5
    #optional
    .goto Durotar,55.95,74.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃纳尔|r交谈
    .turnin 818 >>交任务：沃纳尔大师
    .target 沃纳尔大师
    .isQuestComplete 818
step << Warrior/Rogue/Shaman
    #xprate <1.5
    .goto Durotar,55.62,73.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海赞|r交谈
    >>|cRXP_BUY_向他购买|r |T133974:0|t[肉排] |cRXP_BUY_。|r
    .vendor >> 出售杂物
    .collect 2287,10,784,1 --Haunch of Meat (10)
    .money <0.025
    .target 海赞
step << Warlock/Mage/Priest
    #xprate <1.5
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_克瓦埃|r交谈
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r --Refreshing Spring Water (20)
    .collect 159,20,784,1
    .target 克瓦埃
    .money <0.010
step << Warlock/Mage/Priest
    #xprate <1.5
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|cRXP_FRIENDLY_克瓦埃|r交谈
    >>|cRXP_BUY_向她购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_。|r --Refreshing Spring Water (10)
    .collect 159,10,784,1
    .target 克瓦埃
    .money <0.0050
step
    #xprate <1.5
    #softcore
    #loop
    .goto Durotar,54.20,73.36,0
    .goto Durotar,54.09,76.31,25,0
    .goto Durotar,54.52,74.83,25,0
    .goto Durotar,54.20,73.36,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔·猎齿|r交谈。他正在附近巡逻
    .turnin 786,1 >>交任务：科卡尔半人马的进攻 << Shaman
    .turnin 786 >>交任务：科卡尔半人马的进攻 << !Shaman
    .target 拉尔·猎齿
step << Rogue
    #season 2
    .goto Durotar,51.82,58.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴索|r交谈，以获得|T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    >>|cRXP_WARN_他已潜行！|r
    .collect 203990,1 --Rune of Mutilation (1)
    .target 巴索
    .skipgossip
    .itemcount 207098,1
    .train 400094,1
step << Rogue
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]|cRXP_WARN_学习|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
step
    #hardcore
    #completewith next
    .subzone 362 >>前往剃刀岭
step
    #hardcore
    #label Betrayers
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔|r、|cRXP_FRIENDLY_加索克|r和|cRXP_FRIENDLY_托尔卡|r交谈
    .turnin 823 >>交任务：向奥戈尼尔报告
    .accept 806 >>接任务：黑暗风暴
    .target +奥戈尼尔·魂痕
    .goto Durotar,52.24,43.15
    .accept 784 >>接任务：背信弃义的人类
    .accept 837 >>接任务：野猪人的进犯
    .target +加索克
    .goto Durotar,51.95,43.50
    .accept 815 >>接任务：恐龙蛋大餐
    .target +厨师托尔卡
    .goto Durotar,51.09,42.49
step
    #hardcore
    #completewith next
    .goto Durotar,50.22,43.06,12,0
    .goto Durotar,50.09,42.97,8,0
    .goto Durotar,50.20,42.30,12,0
    .goto Durotar,49.96,40.96,12,0
    .goto Durotar,49.67,40.42,10 >>朝塔楼方向走
step
    #hardcore
    #completewith next
    .goto Durotar,49.75,40.38,6,0
    .goto Durotar,49.77,40.24,6,0
    .goto Durotar,49.69,40.21,6,0
    .goto Durotar,49.68,40.30,6,0
    .goto Durotar,49.78,40.34,6,0
    .goto Durotar,49.79,39.96,6,0
    .goto Durotar,49.60,40.04,8 >>沿塔楼向上走，前往弗恩·凝眉处
step
    #hardcore
    .goto Durotar,49.89,40.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .accept 791 >>接任务：新的背包
    .target 弗恩·凝眉
step << Warrior/Rogue
    #hardcore
    .goto Durotar,51.81,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁恩|r交谈
    .train 2575 >> 学习专业技能：|T136248:0|t[采矿]
    >>|cRXP_WARN_这样就能采集到|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r |cRXP_WARN_，用于制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（+2武器伤害，持续30分钟）|r
    .target 克鲁恩
step << Warrior/Rogue
    #hardcore
    .goto Durotar,51.90,41.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃克|r交谈
    >>|cRXP_BUY_向他购买|r |T134708:0|t[矿工锄] |cRXP_BUY_一|r|cRXP_BUY_把|r
    .collect 2901,1,784,1 --Mining Pick (1)
    .target 沃克
step << Warrior/Rogue
    #hardcore
    .goto Durotar,52.05,40.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜克|r交谈
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .target 杜克
    .skill blacksmithing,1,1
step << Warrior/Rogue
    #hardcore
    #completewith TravelToTiragarde
    +|cRXP_WARN_施放|r |T136025:0|t[寻找矿物] |cRXP_WARN_并挖掘找到的铜矿脉，获得|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，再用它们制作|r |T135248:0|t[磨刀石] |cRXP_WARN_。|r
    .collect 2862,1,837,1
    .skill blacksmithing,<1,1
    .train 2575,3 --Mining Trained
step
    #softcore
    #label TravelToTiragarde
    .goto Durotar,54.42,62.64,60,0
    .subzone 372 >> 前往提拉加德城堡
    >>|cRXP_WARN_顺路击杀怪物|r
    .isOnQuest 784
step
    #hardcore
    #label TravelToTiragarde
    .goto Durotar,57.26,54.69,60,0
    .subzone 372 >> 前往提拉加德城堡
    >>|cRXP_WARN_顺路击杀怪物|r
    .isOnQuest 784
step
    #sticky
    #completewith AgedEnvelope
    +|cRXP_WARN_如果|r|cRXP_ENEMY_指挥官萨拉菲尔|r|cRXP_WARN_出现，请小心；他是9级稀有怪。你可能需要使用一瓶|r |T134829:0|t[初级治疗药水]|cRXP_WARN_（如果有）|r
    .unitscan 指挥官萨拉菲尔
step
    #completewith Benedict
    #requires TravelToTiragarde
    .goto Durotar,59.81,58.22,8,0
    .goto Durotar,59.64,58.44,8,0
    .goto Durotar,59.55,57.89,8,0
    .goto Durotar,59.29,57.89,8 >> 前往要塞二楼
step << Priest
    #season 2
    #completewith ScrapsFinished
    >>击杀|cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r，拾取 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    .collect 205940,1 --Memory of a Dark Purpose (1)
    .train 425216,1
step
    #completewith AgedEnvelope
    >>击杀|cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r，拾取|cRXP_LOOT_帆布脚料|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +库尔提拉斯水手
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +库尔提拉斯水兵
    .complete 791,1 --Canvas Scraps (8)
    .mob +库尔提拉斯水兵
    .mob +库尔提拉斯水手
step
    #label Benedict
    .goto Durotar,59.75,58.27
    >>击杀|cRXP_ENEMY_本尼迪克上尉|r，拾取|cRXP_LOOT_钥匙|r
    .complete 784,3 --Lieutenant Benedict (1)
    .collect 4882,1,830,1 --Collect Benedict's Key (1)
    .mob 本尼迪克上尉
step
    #label AgedEnvelope
    .goto Durotar,59.87,57.87,5,0
    .goto Durotar,59.83,57.58,5,0
    .goto Durotar,59.80,57.82,5,0
    .goto Durotar,59.94,57.82,5,0
    .goto Durotar,59.94,57.61,5,0
    .goto Durotar,59.27,57.65
    >>|cRXP_WARN_前往城堡楼上|r
    >>打开|cRXP_PICK_本尼迪克的箱子|r，拾取 |T133471:0|t[|cRXP_LOOT_旧信封|r]
    >>使用 |T133471:0|t[|cRXP_LOOT_旧信封|r]接任务
    .collect 4881,1,830 --Collect Aged Envelope (1)
    .accept 830 >>接任务：将军的命令
    .use 4881
step
    #loop
    .goto Durotar,58.99,58.30,0
    .goto Durotar,57.65,58.52,30,0
    .goto Durotar,57.36,56.59,30,0
    .goto Durotar,58.10,55.52,30,0
    .goto Durotar,58.54,53.68,30,0
    .goto Durotar,56.54,54.52,30,0
    .goto Durotar,56.37,58.35,30,0
    .goto Durotar,58.99,58.30,30,0
    >>击杀|cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r，拾取|cRXP_LOOT_帆布脚料|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +库尔提拉斯水手
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +库尔提拉斯水兵
    .complete 791,1 --Canvas Scraps (8)
    .mob +库尔提拉斯水兵
    .mob +库尔提拉斯水手
    .itemcount 4870,<8 --Canvas Scraps (<8)
step
    #optional
    #loop
    .goto Durotar,58.99,58.30,0
    .goto Durotar,57.65,58.52,30,0
    .goto Durotar,57.36,56.59,30,0
    .goto Durotar,58.10,55.52,30,0
    .goto Durotar,58.54,53.68,30,0
    .goto Durotar,56.54,54.52,30,0
    .goto Durotar,56.37,58.35,30,0
    .goto Durotar,58.99,58.30,30,0
    >>击杀|cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +库尔提拉斯水手
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +库尔提拉斯水兵
step
    #optional
    #label ScrapsFinished
    #loop
    .goto Durotar,58.99,58.30,0
    .goto Durotar,57.65,58.52,30,0
    .goto Durotar,57.36,56.59,30,0
    .goto Durotar,58.10,55.52,30,0
    .goto Durotar,58.54,53.68,30,0
    .goto Durotar,56.54,54.52,30,0
    .goto Durotar,56.37,58.35,30,0
    .goto Durotar,58.99,58.30,30,0
    >>击杀|cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r，拾取|cRXP_LOOT_帆布脚料|r
    .complete 791,1 --Canvas Scraps (8)
    .mob 库尔提拉斯水手
    .mob 库尔提拉斯水兵
step << Priest
    #season 2
    #loop
    .goto Durotar,58.99,58.30,0
    .goto Durotar,57.65,58.52,30,0
    .goto Durotar,57.36,56.59,30,0
    .goto Durotar,58.10,55.52,30,0
    .goto Durotar,58.54,53.68,30,0
    .goto Durotar,56.54,54.52,30,0
    .goto Durotar,56.37,58.35,30,0
    .goto Durotar,58.99,58.30,30,0
    >>击杀|cRXP_ENEMY_库尔提拉斯水手|r和|cRXP_ENEMY_库尔提拉斯水兵|r，拾取 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    .collect 205940,1 --Memory of a Dark Purpose (1)
    .train 425216,1
    .mob 库尔提拉斯水手
    .mob 库尔提拉斯水兵
step << Priest
    #season 2
    #completewith next
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>在|cRXP_PICK_洛阿神灵祭坛|r前跪下，并与|cRXP_FRIENDLY_毒蛇洛阿神灵|r交谈，获得 |T136077:0|t[洛阿神灵之思]增益
    .skipgossip 208307,1
    .target 毒蛇洛阿神灵
    .train 425216,1
step << Priest
    #season 2
    .use 205940
    .itemcount 205940,1
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]|cRXP_WARN_学习|r |T237514:0|t[虚空疫病]
step << !Priest !Mage
    #xprate <1.5
    #optional
    #loop
    .goto Durotar,59.02,50.24,50,0
    .goto Durotar,57.93,47.71,50,0
    .goto Durotar,59.20,44.30,50,0
    .goto Durotar,57.96,42.46,50,0
    .goto Durotar,56.47,43.45,50,0
    .goto Durotar,55.50,48.97,50,0
    .xp 7+2520 >> 刷到 2520+/4500 经验
    .isNotOnQuest 823
step << !Priest !Mage
    #xprate <1.5
    #optional
    #loop
    .goto Durotar,59.02,50.24,50,0
    .goto Durotar,57.93,47.71,50,0
    .goto Durotar,59.20,44.30,50,0
    .goto Durotar,57.96,42.46,50,0
    .goto Durotar,56.47,43.45,50,0
    .goto Durotar,55.50,48.97,50,0
    .xp 7+2200 >> 刷怪至 2200+/4500 经验值
    .isOnQuest 823
step << !Priest !Mage
    #xprate >1.49
    #optional
    #loop
    .goto Durotar,59.02,50.24,50,0
    .goto Durotar,57.93,47.71,50,0
    .goto Durotar,59.20,44.30,50,0
    .goto Durotar,57.96,42.46,50,0
    .goto Durotar,56.47,43.45,50,0
    .goto Durotar,55.50,48.97,50,0
    .xp 7+1530 >> 刷到 1530+/4500 经验
    .isNotOnQuest 823
step << !Priest !Mage
    #xprate >1.49
    #optional
    #loop
    .goto Durotar,59.02,50.24,50,0
    .goto Durotar,57.93,47.71,50,0
    .goto Durotar,59.20,44.30,50,0
    .goto Durotar,57.96,42.46,50,0
    .goto Durotar,56.47,43.45,50,0
    .goto Durotar,55.50,48.97,50,0
    .xp 7+1050 >> 刷怪至 1050+/4500 经验值
    .isOnQuest 823
step << Priest
    #xprate <1.5
    #optional
    #loop
    .goto Durotar,59.02,50.24,50,0
    .goto Durotar,57.93,47.71,50,0
    .goto Durotar,59.20,44.30,50,0
    .goto Durotar,57.96,42.46,50,0
    .goto Durotar,56.47,43.45,50,0
    .goto Durotar,55.50,48.97,50,0
    .xp 7+2070 >> 刷到 2070+/4500 经验
    .isNotOnQuest 823
step << Priest
    #xprate <1.5
    #optional
    #loop
    .goto Durotar,59.02,50.24,50,0
    .goto Durotar,57.93,47.71,50,0
    .goto Durotar,59.20,44.30,50,0
    .goto Durotar,57.96,42.46,50,0
    .goto Durotar,56.47,43.45,50,0
    .goto Durotar,55.50,48.97,50,0
    .xp 7+1750 >> 刷怪至 1750+/4500 经验值
    .isOnQuest 823
step << Priest
    #xprate >1.49
    #optional
    #loop
    .goto Durotar,59.02,50.24,50,0
    .goto Durotar,57.93,47.71,50,0
    .goto Durotar,59.20,44.30,50,0
    .goto Durotar,57.96,42.46,50,0
    .goto Durotar,56.47,43.45,50,0
    .goto Durotar,55.50,48.97,50,0
    .xp 7+855 >> 刷到 855+/4500 经验
    .isNotOnQuest 823
step << Priest
    #xprate >1.49
    #optional
    #loop
    .goto Durotar,59.02,50.24,50,0
    .goto Durotar,57.93,47.71,50,0
    .goto Durotar,59.20,44.30,50,0
    .goto Durotar,57.96,42.46,50,0
    .goto Durotar,56.47,43.45,50,0
    .goto Durotar,55.50,48.97,50,0
    .xp 7+375 >> 刷怪至 375+/4500 经验值
    .isOnQuest 823
step
    #softcore
    #completewith RazorTurnins1
    .goto Durotar,57.3,53.5,120,0
    .deathskip >> 在提拉加德城堡外的北塔死一次，然后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #hardcore
    #completewith next
    .subzone 362 >>前往剃刀岭
step
    #softcore
    #label RazorTurnins1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔|r、|cRXP_FRIENDLY_加索克|r和|cRXP_FRIENDLY_托尔卡|r交谈
    .turnin 823 >>交任务：向奥戈尼尔报告
    .accept 806 >>接任务：黑暗风暴
    .target +奥戈尼尔·魂痕
    .goto Durotar,52.24,43.15
    .turnin 784 >>交任务：背信弃义的人类
    .turnin 830 >>交任务：将军的命令
    .accept 825 >>接任务：海底沉船
    .accept 831 >>接任务：将军的命令
    .accept 837 >>接任务：野猪人的进犯
    .target +加索克
    .goto Durotar,51.95,43.50
    .accept 815 >>接任务：恐龙蛋大餐
    .target +厨师托尔卡
    .goto Durotar,51.09,42.49
step
    #hardcore
    #label RazorTurnins1
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加索克|r交谈
    .turnin 784 >>交任务：背信弃义的人类
    .turnin 830 >>交任务：将军的命令
    .accept 825 >>接任务：海底沉船
    .accept 831 >>接任务：将军的命令
    .target +加索克
step
    #completewith next
    .goto Durotar,50.22,43.06,12,0
    .goto Durotar,50.09,42.97,8,0
    .goto Durotar,50.20,42.30,12,0
    .goto Durotar,49.96,40.96,12,0
    .goto Durotar,49.67,40.42,10 >>朝塔楼方向走
step
    #completewith next
    .goto Durotar,49.75,40.38,6,0
    .goto Durotar,49.77,40.24,6,0
    .goto Durotar,49.69,40.21,6,0
    .goto Durotar,49.68,40.30,6,0
    .goto Durotar,49.78,40.34,6,0
    .goto Durotar,49.79,39.96,6,0
    .goto Durotar,49.60,40.04,8 >>沿塔楼向上走，前往弗恩·凝眉处
step
    .goto Durotar,49.89,40.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .turnin 791 >>交任务：新的背包
    .target 弗恩·凝眉
step << Warrior/Rogue
    .goto Durotar,51.81,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁恩|r交谈
    .train 2575 >> 学习专业技能：|T136248:0|t[采矿]
    >>|cRXP_WARN_这样就能采集到|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r |cRXP_WARN_，用于制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（+2武器伤害，持续30分钟）|r
    .target 克鲁恩
step << Warrior/Rogue
    .goto Durotar,51.90,41.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃克|r交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄] |cRXP_BUY_，卖家是|r |cRXP_FRIENDLY_沃克|r
    .collect 2901,1,825,1 --Mining Pick (1)
    .target 沃克
step << Warrior/Rogue
    .goto Durotar,52.05,40.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜克|r交谈
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .target 杜克
    .skill blacksmithing,1,1
step << Shaman
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后能凑够购买 |T135145:0|t[学徒短杖]（5银04铜）的钱，就卖掉武器；如果钱还不够，稍后再回来。
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，向他购买|r |T135145:0|t[学徒短杖] |cRXP_BUY_。|r
    .collect 2495,1,825,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后能凑够购买 |T135641:0|t[卷刃的剑]（4银01铜）的钱，就卖掉武器；如果钱还不够，稍后再回来。
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，向他购买|r |T135641:0|t[卷刃的剑] |cRXP_BUY_。|r
    .collect 2494,1,825,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后能凑够购买 |T132401:0|t[双刃战斧]（4 银 84 铜）的钱，就卖掉武器；如果钱还不够，稍后再回来。
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，向他购买|r |T132401:0|t[双刃战斧] |cRXP_BUY_。|r
    .collect 2491,1,825,1 --Collect Large Axe (1)
    .money <0.0484
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后能凑够购买 |T135421:0|t[小手斧]（5 银 40 铜）的钱，就卖掉武器；如果钱还不够，稍后再回来。
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，向他购买|r |T135421:0|t[小手斧] |cRXP_BUY_。|r
    .collect 2490,1,825,1 --Collect Tomahawk (1)
    .money <0.0540
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    #optional
    #completewith Tools
    +|cRXP_WARN_装备|r |T132414:0|t[增重飞斧]
    .use 3131 << !tbc
    .use 29007 << tbc
    .itemcount 3131,1 << !tbc
    .itemcount 29007,1 << tbc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Shaman
    #optional
    #completewith Tools
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    #optional
    #completewith Tools
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #optional
    #completewith Tools
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #optional
    #completewith Tools
    +|cRXP_WARN_装备|r |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    .goto Durotar,52.97,41.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格劳特|r交谈
    .vendor >> 出售杂物。若卖掉当前武器后能凑够购买 |T135499:0|t[角木弯弓]（2 银 83 铜）的钱，就卖掉武器；如果钱还不够，稍后再回来。
    .target 格劳特
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    .goto Durotar,52.97,41.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_格劳特|r|cRXP_BUY_交谈，向他购买|r |T135499:0|t[角木弯弓] |cRXP_BUY_。|r
    .collect 2506,1,818,1 --Collect Hornwood Recurve Bow (1)
    .money <0.0283
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    #optional
    #completewith Tools
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    .goto Durotar,52.97,41.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_格劳特|r交谈，向他购买|r |T132382:0|t[劣质箭] |cRXP_BUY_。|r
    .collect 2512,1000,825,1 << Hunter --Rough Arrow (1000)
    .target 格劳特
    .itemcount 2512,<800 << Hunter
step
    .goto Durotar,51.51,41.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    >>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_BUY_向他购买|r |T133974:0|t[肉排] |cRXP_BUY_。|r << Rogue/Warrior
    >>|cRXP_WARN_为职业法术留好 4 银！|r << Rogue/Warrior/Shaman/Warlock
    >>|cRXP_WARN_为职业法术留好 2 银！|r << Priest
    .vendor >> 出售杂物
    .home >> 将炉石绑定在剃刀岭
    .turnin 2161 >>交任务：苦工的重担
    .target 旅店老板格罗斯克
    .train 6760,1 << Rogue
    .train 139,1 << Priest
    .train 980,1 << Warlock
    .train 8044,1 << Shaman
    .train 284,1 << Warrior
step << !Mage !Hunter !Druid
    #optional
    .goto Durotar,51.51,41.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    >>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_BUY_向他购买|r |T133974:0|t[肉排] |cRXP_BUY_。|r << Rogue/Warrior
    .vendor >> 出售杂物
    .home >> 将炉石绑定在剃刀岭
    .turnin 2161 >>交任务：苦工的重担
    .target 旅店老板格罗斯克
    .train 6760,3 << Rogue
    .train 139,3 << Priest
    .train 980,3 << Warlock
    .train 8044,3 << Shaman
    .train 284,3 << Warrior
step << Warrior
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 284 >> 学习职业技能
    .target 塔绍尔·锯痕
step << Shaman
    .goto Durotar,54.42,42.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8044 >> 学习职业技能
    .target 斯瓦特
step << Warlock
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈
    .train 1120 >> 学习职业技能
    .target 杜格鲁·血怒
step << Warlock
    .goto Durotar,54.70,41.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基萨|r交谈并购买 |T133738:0|t[火焰箭（等级2）]
    .collect 16302,1,825,1 --Grimoire of Firebolt (Rank 2) (1)
    .target 基萨
    .money <0.01
    .train 7799,1
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_索塔尔|r交谈
    .train 5116 >> 学习职业技能
    .target 索塔尔
step << Rogue
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 6760 >> 学习职业技能
    .target 卡普拉克
step << Priest
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .turnin 5649 >> 交任务：部族的传统
    .accept 5648 >> 接任务：灵魂之衣
    .train 2052 >> 学习 |T135929:0|t[次级治疗术(2级)]
    .target 泰金
step << Priest
    .goto Durotar,53.10,46.46
    >>施放 |T135929:0|t[次级治疗术]和 |T135987:0|t[真言术：韧]，目标为|cRXP_FRIENDLY_科雅|r
    .complete 5648,1 --Heal and fortify Grunt Kor'ja
    .target 步兵科雅
step << Priest
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .turnin 5648 >>交任务：灵魂之衣
    .trainer >> 学习职业技能
    .target 泰金
step << Rogue/Warrior
    .goto Durotar,54.17,41.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉乌克|r交谈
    .train 3273 >>学习 |T135966:0|t[急救]
    .money <0.01
    .target 拉乌克
step
    .goto Durotar,54.39,42.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔克|r交谈
    >>|cRXP_BUY_向他购买|r |T133634:0|t[棕色小包] |cRXP_BUY_一|r|cRXP_BUY_个|r
    .collect 4496,1,825,1 --Small Brown Pouch (1)
    .target 加尔克
    .money <0.05
step
    #completewith next
    >>击杀|cRXP_ENEMY_小海浪蟹|r和|cRXP_ENEMY_海浪蟹|r，拾取|cRXP_LOOT_蟹胶|r
    >>击杀|cRXP_ENEMY_厚壳龙虾人|r和|cRXP_ENEMY_巨钳龙虾人|r，拾取掉落的|cRXP_LOOT_龙虾人的眼球|r
    -->>This does not need to be finished now
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #label Tools
    #loop
    .goto Durotar,61.96,55.46,0
    .goto Durotar,61.96,55.46,20,0
    .goto Durotar,62.25,56.34,20,0
    .goto Durotar,62.43,59.84,20,0
    .goto Durotar,62.09,60.68,20,0
    .goto Durotar,62.51,60.56,20,0
    .goto Durotar,63.24,58.10,20,0
    .goto Durotar,62.25,56.34,20,0
    >>搜刮船里和周围的|cRXP_PICK_侏儒工具箱|r
    .complete 825,1 --Gnomish Tools (3)
step
    #completewith TaillasherEggs
    .goto Durotar,67.10,69.29,100 >> 游到岛上
step
    #completewith MinshinasSkull
    >>击杀|cRXP_ENEMY_杜隆塔尔猛虎|r，拾取|cRXP_LOOT_杜隆塔尔虎皮|r
    -->>This does not need to be finished now
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob 杜隆塔尔猛虎
step
    #completewith next
    >>击杀|cRXP_ENEMY_小海浪蟹|r和|cRXP_ENEMY_海浪蟹|r，拾取|cRXP_LOOT_蟹胶|r
    >>击杀|cRXP_ENEMY_厚壳龙虾人|r和|cRXP_ENEMY_巨钳龙虾人|r，拾取掉落的|cRXP_LOOT_龙虾人的眼球|r
    -->>This does not need to be finished now
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #label TaillasherEggs
    #loop
    .goto Durotar,67.04,71.40,0
    .goto Durotar,70.23,70.84,0
    .goto Durotar,67.04,71.40,40,0
    .goto Durotar,67.66,73.86,40,0
    .goto Durotar,68.67,74.47,40,0
    .goto Durotar,69.76,74.69,40,0
    .goto Durotar,70.29,73.31,40,0
    .goto Durotar,70.23,70.84,40,0
    .goto Durotar,69.69,70.35,40,0
    .goto Durotar,69.21,69.69,40,0
    .goto Durotar,67.74,69.86,40,0
    >>拾取地面上的|cRXP_PICK_鞭尾龙蛋|r
    >>|cRXP_WARN_它们通常由一只|r |cRXP_ENEMY_血爪鞭尾龙|r守卫
    .complete 815,1 --Taillasher Egg (3)
    .mob 血爪鞭尾龙
step
    #completewith next
    >>击杀|cRXP_ENEMY_小海浪蟹|r和|cRXP_ENEMY_海浪蟹|r，拾取|cRXP_LOOT_蟹胶|r
    >>击杀|cRXP_ENEMY_厚壳龙虾人|r和|cRXP_ENEMY_巨钳龙虾人|r，拾取掉落的|cRXP_LOOT_龙虾人的眼球|r
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    .goto Durotar,66.94,84.41,150 >>游往主岛
    .isOnQuest 826
step
    #completewith MinshinasSkull
    >>击杀|cRXP_ENEMY_妖术巨魔|r和|cRXP_ENEMY_巫毒巨魔|r
    .complete 826,1 --Hexed Troll (8)
    .mob +妖术巨魔
    .complete 826,2 --Voodoo Troll (8)
    .mob +巫毒巨魔
step << Priest
    #season 2
    #completewith Fur
    >>击杀|cRXP_ENEMY_巫毒巨魔|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .collect 205947,1 --Prophecy of a Desecrated Citadel (1)
    .mob 巫毒巨魔
    .train 402852,1
step << Mage
    #season 2
    #completewith ZalazaneKill
    >>击杀|cRXP_ENEMY_扎拉赞恩|r，拾取 |cRXP_LOOT_|T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r]|r
    .collect 203753,1
    .mob 扎拉赞恩
    .train 401765,1
step
    #completewith next
    >>击杀|cRXP_ENEMY_扎拉赞恩|r，获取|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_保留你的|r |T136026:0|t[地震术]|cRXP_WARN_，在他施放|r |T136052:0|t[治疗波]时使用 << Shaman
    >>|cRXP_WARN_保留你的|r |T132155:0|t[凿击]|cRXP_WARN_，在他施放|r |T136052:0|t[治疗波]时使用 << Rogue
    .complete 826,3 --Zalazane's Head (1)
    .mob 扎拉赞恩
step
    #label MinshinasSkull
    .goto Durotar,67.4,87.8
    >>拾取地上的一个|cRXP_LOOT_头骨|r
    .complete 808,1 --Minshina's Skull (1)
step
    #label ZalazaneKill
    .goto Durotar,67.4,87.8
    >>击杀|cRXP_ENEMY_扎拉赞恩|r，获取|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_保留你的|r |T136026:0|t[地震术]|cRXP_WARN_，在他施放|r |T136052:0|t[治疗波]时使用 << Shaman
    >>|cRXP_WARN_保留你的|r |T132155:0|t[凿击]|cRXP_WARN_，在他施放|r |T136052:0|t[治疗波]时使用 << Rogue
    .complete 826,3 --Zalazane's Head (1)
    .mob 扎拉赞恩
step << Mage
    #season 2
    .goto Durotar,67.4,87.8
    >>击杀|cRXP_ENEMY_扎拉赞恩|r，拾取 |cRXP_LOOT_|T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r]|r
    .collect 203753,1
    .mob 扎拉赞恩
    .train 401765,1
step << Mage
    #optional
    #completewith DurotarEnd
    #season 2
    .collect 211779,1 >>若持有 |T135933:0|t[理解魔符]，现在可解读笔记；否则先继续路线，稍后在奥格瑞玛向施法材料商购买。
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r] |cRXP_WARN_学习|r |T236227:0|t[寒冰指]
    .use 203753
    .train 401765,1
    .itemcount 203753,1
step
    #completewith next
    >>击杀|cRXP_ENEMY_杜隆塔尔猛虎|r，拾取|cRXP_LOOT_杜隆塔尔虎皮|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob 杜隆塔尔猛虎
step
    #label Fur
    #loop
    .goto Durotar,67.23,88.76,0
    .goto Durotar,67.23,88.76,40,0
    .goto Durotar,66.52,87.74,40,0
    .goto Durotar,65.94,86.72,40,0
    .goto Durotar,65.90,84.04,40,0
    .goto Durotar,65.88,82.85,40,0
    .goto Durotar,67.38,82.61,40,0
    .goto Durotar,68.42,82.43,40,0
    .goto Durotar,68.50,84.32,40,0
    .goto Durotar,68.47,86.77,40,0
    .goto Durotar,67.23,88.00,40,0
    >>击杀|cRXP_ENEMY_妖术巨魔|r和|cRXP_ENEMY_巫毒巨魔|r
    .complete 826,1 --Hexed Troll (8)
    .mob +妖术巨魔
    .complete 826,2 --Voodoo Troll (8)
    .mob +巫毒巨魔
step << Priest
    #season 2
    #loop
    .goto Durotar,67.23,88.76,0
    .goto Durotar,67.23,88.76,40,0
    .goto Durotar,66.52,87.74,40,0
    .goto Durotar,65.94,86.72,40,0
    .goto Durotar,65.90,84.04,40,0
    .goto Durotar,65.88,82.85,40,0
    .goto Durotar,67.38,82.61,40,0
    .goto Durotar,68.42,82.43,40,0
    .goto Durotar,68.50,84.32,40,0
    .goto Durotar,68.47,86.77,40,0
    .goto Durotar,67.23,88.00,40,0
    >>击杀|cRXP_ENEMY_巫毒巨魔|r，拾取 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .collect 205947,1 --Prophecy of a Desecrated Citadel (1)
    .mob 巫毒巨魔
    .train 402852,1
step
    #completewith next
    >>击杀|cRXP_ENEMY_小海浪蟹|r和|cRXP_ENEMY_海浪蟹|r，拾取|cRXP_LOOT_蟹胶|r
    >>击杀|cRXP_ENEMY_厚壳龙虾人|r和|cRXP_ENEMY_巨钳龙虾人|r，拾取掉落的|cRXP_LOOT_龙虾人的眼球|r
    -->>This does not need to be finished now
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #loop
    .goto Durotar,59.79,83.44,0
    .goto Durotar,65.27,87.86,50,0
    .goto Durotar,64.72,88.53,50,0
    .goto Durotar,64.70,84.89,50,0
    .goto Durotar,64.68,80.80,50,0
    .goto Durotar,65.35,80.11,50,0
    .goto Durotar,65.87,81.23,50,0
    .goto Durotar,60.28,80.04,50,0
    .goto Durotar,60.60,82.26,50,0
    .goto Durotar,59.88,83.51,50,0
    .goto Durotar,59.56,84.86,50,0
    .goto Durotar,60.84,88.79,50,0
    .goto Durotar,61.41,89.69,50,0
    .goto Durotar,61.48,91.37,50,0
    .goto Durotar,60.37,91.36,50,0
    .goto Durotar,59.04,90.51,50,0
    .goto Durotar,59.79,83.44,50,0
    >>击杀|cRXP_ENEMY_杜隆塔尔猛虎|r，拾取|cRXP_LOOT_杜隆塔尔虎皮|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob 杜隆塔尔猛虎
step
    #loop
    .goto Durotar,59.64,73.84,0
    .goto Durotar,59.64,73.84,60,0
    .goto Durotar,58.11,77.30,60,0
    .goto Durotar,57.27,79.38,60,0
    .goto Durotar,55.66,80.47,60,0
    .goto Durotar,53.8,83.14,60,0
    >>击杀|cRXP_ENEMY_小海浪蟹|r和|cRXP_ENEMY_海浪蟹|r，拾取|cRXP_LOOT_蟹胶|r
    >>击杀|cRXP_ENEMY_厚壳龙虾人|r和|cRXP_ENEMY_巨钳龙虾人|r，拾取掉落的|cRXP_LOOT_龙虾人的眼球|r
    -->>This does not need to be finished now
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #softcore
    #completewith next
    .goto Durotar,57.50,73.26,50,0
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活，或直接跑回去
step
    #hardcore
    #completewith Zalazaneturnin
    .subzone 367 >>前往森金村
step
    .goto Durotar,56.48,73.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    >>|cRXP_WARN_跳进小屋|r
    .vendor >> 出售杂物并修理装备
    .target 特莱耶克
    .isOnQuest 808
step << Mage
    .goto Durotar,56.3,75.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安苏瓦|r交谈
    .train 118 >> 学习职业技能
    .target 安苏瓦
step
    #label Zalazaneturnin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加德林|r、|cRXP_FRIENDLY_沃纳尔|r和|cRXP_FRIENDLY_维尔林|r交谈
    .turnin 808 >>交任务：明希纳的颅骨
    .turnin 826,2 >>交任务：扎拉赞恩 << Shaman
    .turnin 826 >>交任务：扎拉赞恩 << !Shaman
    .target +加德林大师
    .goto Durotar,55.95,74.73
    .turnin 818 >>交任务：沃纳尔大师
    .target +沃纳尔大师
    .goto Durotar,55.95,74.39
    .turnin 817 >>交任务：生活所需的虎皮
    .target +维尔林·长牙
    .goto Durotar,55.95,73.93
step << Priest
    #season 2
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>在|cRXP_PICK_洛阿神灵祭坛|r前跪下，并与|cRXP_FRIENDLY_毒蛇洛阿神灵|r交谈，获得 |T136077:0|t[洛阿神灵之思]增益
    .train 402852,1
step << Priest
    #season 2
    #completewith QuilboarsScouts
    .aura 418459 >>|cRXP_WARN_需要另一名带有“亡灵之思”增益的牧师。你在他面前使用 /kneel（下跪），再请他对你使用 /pray（祈祷）表情，以获得第二种冥想增益。|r
    .use 205947
    .train 402852 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]|cRXP_WARN_学习|r |T237570:0|t[裂魂魔]
    .itemcount 205947,1
step
    #completewith QuilboarsScouts
    +|cRXP_WARN_将|r |T133728:0|t[微光颅骨]|cRXP_WARN_和|r |T134712:0|t[强力胶水]|cRXP_WARN_绑定快捷键，留作紧急情况使用|r
step << Warrior
    #season 2
    #loop
    .goto Durotar,49.22,48.96,0
    .goto Durotar,50.21,50.78,30,0
    .goto Durotar,50.18,49.23,30,0
    .goto Durotar,49.48,49.14,30,0
    .goto Durotar,49.32,48.18,30,0
    .goto Durotar,48.81,49.00,30,0
    .goto Durotar,48.49,49.29,30,0
    .goto Durotar,47.58,49.62,30,0
    .goto Durotar,47.06,49.53,30,0
    .goto Durotar,46.90,48.11,30,0
    .goto Durotar,49.22,48.96,30,0
    >>击杀|cRXP_ENEMY_钢鬃野猪人|r和|cRXP_ENEMY_钢鬃斥候|r，拾取|cRXP_LOOT_被砍下的野猪人的头|r
    .collect 206994,1 ---Severed Quilboar Head (1)
    .complete 837,1 --Razormane Quilboar (4)
    .mob +钢鬃野猪人
    .complete 837,2 --Razormane Scout (4)
    .mob +钢鬃斥候
    .train 403475,1
step
    #label QuilboarsScouts
    #loop
    .goto Durotar,49.22,48.96,0
    .goto Durotar,50.21,50.78,30,0
    .goto Durotar,50.18,49.23,30,0
    .goto Durotar,49.48,49.14,30,0
    .goto Durotar,49.32,48.18,30,0
    .goto Durotar,48.81,49.00,30,0
    .goto Durotar,48.49,49.29,30,0
    .goto Durotar,47.58,49.62,30,0
    .goto Durotar,47.06,49.53,30,0
    .goto Durotar,46.90,48.11,30,0
    .goto Durotar,49.22,48.96,30,0
    >>击杀|cRXP_ENEMY_钢鬃野猪人|r和|cRXP_ENEMY_钢鬃斥候|r
    .complete 837,1 --Razormane Quilboar (4)
    .mob +钢鬃野猪人
    .complete 837,2 --Razormane Scout (4)
    .mob +钢鬃斥候
step
    #xprate <1.5
    #loop
    .goto Durotar,44.45,39.74,0
    .goto Durotar,44.45,39.74,50,0
    .goto Durotar,44.49,37.47,50,0
    .goto Durotar,43.30,37.32,50,0
    .goto Durotar,41.70,37.09,50,0
    .goto Durotar,41.64,38.27,50,0
    .goto Durotar,41.94,40.46,50,0
    .goto Durotar,43.30,40.40,50,0
    >>击杀|cRXP_ENEMY_钢鬃传令兵|r和|cRXP_ENEMY_钢鬃卫兵|r
    .complete 837,3 --Razormane Dustrunner (4)
    .mob +钢鬃传令兵
    .complete 837,4 --Razormane Battleguard (4)
    .mob +钢鬃卫兵
step << Hunter
    #optional
    #xprate <1.5
    #loop
	.goto Durotar,47.52,48.67,0
	.goto Durotar,47.52,48.67,50,0
	.goto Durotar,46.12,45.47,50,0
	.goto Durotar,43.65,43.91,50,0
	.goto Durotar,41.68,44.69,50,0
	.goto Durotar,41.00,46.13,50,0
	.goto Durotar,42.47,48.50,50,0
	.goto Durotar,44.21,49.68,50,0
	.goto Durotar,47.17,49.44,50,0
    .xp 9+4470 >> 刷怪至 4470+/6500 经验值
step
    #optional
    #xprate >1.49
    #loop
    .goto Durotar,49.14,48.89,0
    .goto Durotar,49.14,48.89,30,0
    .goto Durotar,47.43,49.18,30,0
    .xp 9+4400 >> 刷怪至 4400+/6500 经验值
step
    #xprate >1.49 << !Hunter
    #softcore
    #completewith RazorTurnins015
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活，或跑回剃刀岭
step
    #xprate >1.49 << !Hunter
    #hardcore
    #completewith RazorTurnins015
    .goto Durotar,51.95,43.50,100 >>前往剃刀岭
step << Shaman
    #xprate >1.49
    .goto Durotar,54.42,42.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8050 >> 学习职业技能
    .accept 2983 >>接任务：火焰的召唤
    .target 斯瓦特
    .isNotOnQuest 1522
    .xp <10,1
step << Hunter
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托尔卡|r和|cRXP_FRIENDLY_加索克|r交谈
    .turnin 815 >>交任务：恐龙蛋大餐
    .target +厨师托尔卡
    .goto Durotar,51.12,42.46
    .turnin 825 >>交任务：海底沉船
    .turnin 837 >>交任务：野猪人的进犯
    .target +加索克
    .goto Durotar,51.95,43.50
step
    #xprate >1.49
    #label RazorTurnins015
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托尔卡|r和|cRXP_FRIENDLY_加索克|r交谈
    .turnin 815 >>交任务：恐龙蛋大餐
    .target +厨师托尔卡
    .goto Durotar,51.12,42.46
    .turnin 825 >>交任务：海底沉船
    .target +加索克
    .goto Durotar,51.95,43.50
step << Shaman
    #xprate >1.49
    .goto Durotar,54.42,42.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8050 >>学习职业技能
    .accept 2983 >>接任务：火焰的召唤
    .target 斯瓦特
    .isNotOnQuest 1522
step << Warrior
    #xprate >1.49
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .accept 1505 >>接任务：老兵犹塞克
    .trainer >>学习职业技能
    .target 塔绍尔·锯痕
step << Warlock
    #xprate >1.49
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈
    .train 1120 >>学习职业技能
    .target 杜格鲁·血怒
step << Warlock
    #xprate >1.49
    .goto Durotar,54.70,41.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基萨|r交谈并购买 |T133738:0|t[火焰箭（等级2）]
    .collect 16302,1,837,1 --Grimoire of Firebolt (Rank 2) (1)
    .target 基萨
    .money <0.01
    .train 7799,1
step << Priest
    #xprate >1.49
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .accept 5654 >> 接任务：虚弱妖术 << Troll
    .accept 5660 >> 接任务：虚弱之触 << Undead
    .trainer >> 学习职业技能
    .target 泰金
step << Rogue
    #xprate >1.49
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 674 >> 学习职业技能
    .target 卡普拉克
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_索塔尔|r交谈
    .accept 6062 >>接任务：驯服野兽
    .trainer >> 学习职业技能
    .target 索塔尔
step << Hunter
    .goto Durotar,52.97,41.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_格劳特|r交谈，向他购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_和|r |T134410:0|t[中型箭袋] |cRXP_BUY_。|r
    .collect 2515,1200,6082,1 --Sharp Arrow (1200)
    --.collect 11362,1,6082,1 --Medium Quiver (1)
    .target 格劳特
    --.money <0.1300
step << Hunter
    .goto Durotar,52.97,41.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_格劳特|r交谈，向他购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_。|r
    .collect 2515,1200,6082,1 --Sharp Arrow (1200)
    .target 格劳特
    .itemcount 2515,<600 --Sharp Arrow (600)
step << Hunter
    #loop
    .goto Durotar,51.65,56.51,0
    .goto Durotar,51.76,48.41,40,0
    .goto Durotar,51.70,50.23,40,0
    .goto Durotar,51.65,51.34,40,0
    .goto Durotar,51.80,53.18,40,0
    .goto Durotar,50.82,53.65,40,0
    .use 15917 >> |cRXP_WARN_使用|r|T132164:0|t[驯兽棒]|cRXP_WARN_，对|r|cRXP_ENEMY_可怕的杂斑野猪|r|cRXP_WARN_施放时保持最远距离|r
    .complete 6062,1 --Tame a Dire Mottled Boar
    .mob 可怕的杂斑野猪
    .isOnQuest 6062
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_索塔尔|r交谈
    .turnin 6062 >>交任务：驯服野兽
    .accept 6083 >>接任务：驯服野兽
    .target 索塔尔
    .isQuestComplete 6062
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_索塔尔|r交谈
    .accept 6083 >>接任务：驯服野兽
    .target 索塔尔
    .isQuestTurnedIn 6062
step << Hunter
    #completewith next
    +|cRXP_WARN_解散你的|cRXP_ENEMY_可怕的杂斑野猪|r：右键点击宠物头像并选择“解散”，否则无法驯服|r|cRXP_ENEMY_海浪蟹|r
step << Hunter
    #loop
    .goto Durotar,59.63,23.38,0
    .goto Durotar,59.18,28.35,40,0
    .goto Durotar,59.89,26.42,40,0
    .goto Durotar,60.04,24.79,40,0
    >>|cRXP_WARN_不要杀掉你看到的|r|cRXP_ENEMY_硬甲蝎|r|cRXP_WARN_，稍后还会用到它们|r
    .use 15919 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_对一只|r|cRXP_ENEMY_海浪蟹|r|cRXP_WARN_施放，保持最远距离|r
    .complete 6083,1 --Tame a Surf Crawler
    .mob 海浪蟹
    .isQuestTurnedIn 6062
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_索塔尔|r交谈
    .turnin 6083 >>交任务：驯服野兽
    .accept 6082 >>接任务：驯服野兽
    .target 索塔尔
    .isQuestTurnedIn 6062
step << Hunter
    #completewith next
    +|cRXP_WARN_解散你的|cRXP_ENEMY_海浪蟹|r：右键点击宠物头像并选择“解散”，否则无法驯服|r|cRXP_ENEMY_硬甲蝎|r
step << Hunter
    #loop
    .goto Durotar,54.84,36.94,0
    .goto Durotar,54.84,36.94,40,0
    .goto Durotar,54.01,33.81,40,0
    .goto Durotar,54.22,30.50,40,0
    .goto Durotar,55.71,30.66,40,0
    .goto Durotar,56.19,29.28,40,0
    .goto Durotar,56.95,27.28,40,0
    .goto Durotar,57.15,25.59,40,0
    .use 15920 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_对一只|r|cRXP_ENEMY_硬甲蝎|r|cRXP_WARN_施放，保持最远距离|r
    .complete 6082,1 --Tame an Armored Scorpid
    .mob 硬甲蝎
    .isQuestTurnedIn 6062
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_索塔尔|r交谈
    .turnin 6082 >>交任务：驯服野兽
    .accept 6081 >>接任务：训练野兽
    .target 索塔尔
    .isQuestTurnedIn 6062
step << Hunter
    #completewith ConscriptH
    +|cRXP_WARN_将|r |T132164:0|t[驯服野兽]|cRXP_WARN_、|r |T136095:0|t[解散野兽]|cRXP_WARN_和|r |T132161:0|t[召唤宠物]|cRXP_WARN_添加到动作条上|r
step << Hunter
    .goto Durotar,51.13,42.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞姆塔克|r交谈
    >>|cRXP_BUY_向他购买|r |T133972:0|t[硬肉干] |cRXP_BUY_。|r |cRXP_BUY_稍后用它喂养宠物|r
    .vendor >> 出售杂物
    .collect 117,5,828,1 --Tough Jerky (5)
    .target 格瑞姆塔克
    .isQuestTurnedIn 6062
    .isQuestAvailable 834 --Winds in the Desert
step
    #label ConscriptH
    #xprate >1.49 << !Hunter
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林|r交谈
    .accept 840 >>接任务：部落的新兵
    .target 塔克林·寻路者
step
    #xprate >1.49
    #loop
	.goto Durotar,44.45,39.74,0
	.goto Durotar,44.45,39.74,50,0
	.goto Durotar,44.49,37.47,50,0
	.goto Durotar,43.30,37.32,50,0
	.goto Durotar,41.70,37.09,50,0
	.goto Durotar,41.64,38.27,50,0
	.goto Durotar,41.94,40.46,50,0
	.goto Durotar,43.30,40.40,50,0
    >>击杀|cRXP_ENEMY_钢鬃传令兵|r和|cRXP_ENEMY_钢鬃卫兵|r
    .complete 837,3 --Razormane Dustrunner (4)
    .mob +钢鬃传令兵
    .complete 837,4 --Razormane Battleguard (4)
    .mob +钢鬃卫兵
step << Warrior/Shaman
    #xprate >1.49
    .goto The Barrens,62.26,19.38,40 >> 前往前沿哨所
    .zoneskip The Barrens
step << Warrior/Shaman
    #xprate >1.49
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔·战痕|r交谈
    .turnin 840 >>交任务：部落的新兵
    .accept 842 >>接任务：十字路口征兵
    .target 卡加尔·战痕
step << Warrior/Shaman
    #xprate >1.49
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡加尔·战痕|r 交谈
    .accept 842 >> 接任务：十字路口征兵
    .target 卡加尔·战痕
    .isQuestTurnedIn 840
step << Warrior
    #xprate >1.49
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1505 >>交任务：老兵犹塞克
    .accept 1498 >>接任务：防御之道
    .target 犹塞克
step << Shaman
    #xprate >1.49
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳尔|r交谈
    .turnin 2983 >>交任务：火焰的召唤
    .accept 1524 >>接任务：火焰的召唤
    .target 卡纳尔·菲斯
step << Shaman
    #xprate >1.49
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡纳尔·菲斯|r 交谈
    .accept 1524 >> 接任务：火焰的召唤
    .target 卡纳尔·菲斯
    .isQuestTurnedIn 2983
step << Shaman
    #xprate >1.49
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
    .goto Durotar,39.16,58.56,10 >> 沿山路向上前往|cRXP_FRIENDLY_泰尔夫|r处
    >>|cRXP_WARN_山路狭窄，坠落可能致死，请小心|r
step << Shaman
    #xprate >1.49
    #label CallofFire3
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰尔夫|r交谈
    .turnin 1524 >>交任务：火焰的召唤
    .accept 1525 >>接任务：火焰的召唤
    .target 泰尔夫·祖拉姆
step << Hunter/Shaman/Warrior
    #xprate <1.5 << Shaman/Warrior
    .goto Durotar,43.11,30.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莎|r交谈
    .accept 816 >>接任务：丢失的孩子
    .target 米莎·托克伦
step << Warrior
    #xprate >1.49
    #loop
    .goto Durotar,43.19,24.34,0
    .goto Durotar,39.16,30.84,40,0
    .goto Durotar,39.23,28.38,40,0
    .goto Durotar,39.43,24.94,40,0
    .goto Durotar,41.39,24.28,40,0
    .goto Durotar,43.19,24.34,40,0
    >>进入雷霆山，击杀|cRXP_ENEMY_闪电蜥蜴|r并拾取|cRXP_ENEMY_烧焦的鳞片|r
    .complete 1498,1 --Singed Scale (5)
    .mob 闪电蜥蜴
step << Shaman
    #xprate >1.49
    #completewith next
    .goto Durotar,41.66,25.68,20 >>跳入雷霆山
step << Warrior/Shaman
    #xprate >1.49
    #softcore
    .goto Durotar,42.13,26.67
    >>击杀|cRXP_ENEMY_费索·暗雷|r，并拾取|cRXP_LOOT_费索的爪子|r
    >>|cRXP_WARN_小心！先击杀巡逻的|r |cRXP_ENEMY_火刃狂热者|r |cRXP_WARN_以及后方的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_，再攻击费索|r
    >>|cRXP_WARN_把他向后拉到刚击杀的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_所在的位置。否则可能因靠得太近而引到额外的火刃怪物|r
    >>|cRXP_WARN_不必担心为了拿到|cRXP_LOOT_费索的爪子|r而死亡，之后会在|cRXP_FRIENDLY_灵魂医者|r处复活|r
    >>|cRXP_WARN_先击杀小鬼。使用|r |T132155:0|t[凿击] |cRXP_WARN_应对他施放的|r |T136169:0|t[灵魂虹吸] << Rogue
    >>|cRXP_WARN_先击杀小鬼。使用|r |T136026:0|t[地震术] |cRXP_WARN_应对他施放的|r |T136169:0|t[灵魂虹吸] << Shaman
    >>|cRXP_WARN_可以施放|r |T136071:0|t[变形术]|cRXP_WARN_，目标为|r|cRXP_ENEMY_费索·暗雷|r|cRXP_WARN_，然后先击杀|r|cRXP_ENEMY_小鬼|r |cRXP_WARN_|r << Mage
    >>|cRXP_WARN_先击杀小鬼|r << Warrior/Warlock/Priest
    >>|cRXP_WARN_如果持有，就使用一瓶|r |T134829:0|t[初级治疗药水]|cRXP_WARN_；必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << !Warlock
    >>|cRXP_WARN_如果持有，就使用|r |T134829:0|t[初级治疗药水]、|T133728:0|t[初级治疗石]|cRXP_WARN_；必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << Warlock
    .complete 806,1 --Fizzle's Claw (1)
    .mob 费索·暗雷
    .mob 小鬼爪牙
    .mob 火刃狂热者
    .mob 闪电蜥蜴
step << Warrior/Shaman
    #xprate >1.49
    #hardcore
    .goto Durotar,42.13,26.67
    >>击杀|cRXP_ENEMY_费索·暗雷|r，并拾取|cRXP_LOOT_费索的爪子|r
    >>|cRXP_WARN_小心！先击杀巡逻的|r |cRXP_ENEMY_火刃狂热者|r |cRXP_WARN_以及后方的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_，再攻击费索|r
    >>|cRXP_WARN_把他向后拉到刚击杀的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_所在的位置。否则可能因靠得太近而引到额外的火刃怪物|r
    >>|cRXP_WARN_先击杀小鬼。使用|r |T132155:0|t[凿击] |cRXP_WARN_应对他施放的|r |T136169:0|t[灵魂虹吸] << Rogue
    >>|cRXP_WARN_先击杀小鬼。使用|r |T136026:0|t[地震术] |cRXP_WARN_应对他施放的|r |T136169:0|t[灵魂虹吸] << Shaman
    >>|cRXP_WARN_可以施放|r |T136071:0|t[变形术]|cRXP_WARN_，目标为|r|cRXP_ENEMY_费索·暗雷|r|cRXP_WARN_，然后先击杀|r|cRXP_ENEMY_小鬼|r |cRXP_WARN_|r << Mage
    >>|cRXP_WARN_先击杀小鬼|r << Warrior/Warlock/Priest
    >>|cRXP_WARN_如果持有，就使用一瓶|r |T134829:0|t[初级治疗药水]|cRXP_WARN_；必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << !Warlock
    >>|cRXP_WARN_如果持有，就使用|r |T134829:0|t[初级治疗药水]、|T133728:0|t[初级治疗石]|cRXP_WARN_；必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << Warlock
    .complete 806,1 --Fizzle's Claw (1)
    .mob 费索·暗雷
    .mob 小鬼爪牙
    .mob 火刃狂热者
    .mob 闪电蜥蜴
step << Warrior/Shaman
    #xprate >1.49
    #softcore
    .goto Durotar,47.04,17.58
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .isQuestComplete 806
step << Warrior/Shaman
    #xprate >1.49
    #hardcore
    .goto Durotar,39.20,32.02,60 >> 从雷霆山突围出来
    .isQuestComplete 806
step
    #completewith next
    .goto Durotar,46.37,22.94,50 >> 前往雷兹拉克
step
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .accept 834 >>接任务：沙漠之风
    .target 雷兹拉克
step << Warrior
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_尘风鹰身人|r，拾取|cRXP_LOOT_被砍下的鹰身人的头|r
    .collect 206995,1 ---Severed Harpy Head (1)
    .mob 尘风暴徒
    .mob 尘风雷巫
    .mob 尘风抢劫者
    .mob 尘风鹰身人
    .train 403475,1
step
    #loop
    .goto Durotar,49.70,21.90,0
    .goto Durotar,49.70,21.90,40,0
    .goto Durotar,49.70,24.33,40,0
    .goto Durotar,50.13,25.70,40,0
    .goto Durotar,50.85,25.96,40,0
    .goto Durotar,51.65,27.67,40,0
    .goto Durotar,49.85,27.07,40,0
    .goto Durotar,50.68,31.55,40,0
    .goto Durotar,48.10,34.36,40,0
    .goto Durotar,47.35,33.40,40,0
    .goto Durotar,48.49,32.01,40,0
    .goto Durotar,47.19,30.87,40,0
    >>拾取地上的|cRXP_PICK_被盗的补给袋|r
    .complete 834,1 --Sack of Supplies (5)
step << Warrior
    #season 2
    #loop
    .goto Durotar,53.98,23.70,0
    .goto Durotar,54.02,27.23,40,0
    .goto Durotar,52.82,24.27,40,0
    .goto Durotar,51.85,23.95,40,0
    .goto Durotar,54.01,23.63,40,0
    .goto Durotar,52.13,20.77,40,0
    .goto Durotar,51.26,19.19,40,0
    .goto Durotar,53.98,23.70,40,0
    >>击杀|cRXP_ENEMY_尘风鹰身人|r，拾取|cRXP_LOOT_被砍下的鹰身人的头|r
    .collect 206995,1 ---Severed Harpy Head (1)
    .mob 尘风暴徒
    .mob 尘风雷巫
    .mob 尘风抢劫者
    .mob 尘风鹰身人
    .train 403475,1
step
    #xprate <1.5
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 834 >>交任务：沙漠之风
    .accept 835 >>接任务：保卫商路
    .target 雷兹拉克
step
    #xprate <1.5
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷兹拉克|r 交谈
    .accept 835 >> 接任务：保卫商路
    .target 雷兹拉克
    .isQuestTurnedIn 834
step
    #xprate >1.49
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 834 >>交任务：沙漠之风
    .target 雷兹拉克
step << Shaman
    #xprate >1.49
    #completewith next
    .goto Durotar,49.42,18.47,40,0
    .goto Durotar,51.35,16.76,40,0
    .goto Durotar,54.65,19.02,40,0
    .goto Durotar,55.86,28.31,40,0
    .subzone 371 >>前往尘风洞穴
    >>|cRXP_WARN_向东绕过山丘到达洞穴。请跟随地图上的航点箭头指引|r
step << Shaman
    #xprate >1.49
    #loop
    .goto Durotar,53.18,29.15,0
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    .goto Durotar,51.90,25.70,12,0
    >>击杀|cRXP_ENEMY_火刃祭司|r，拾取|cRXP_LOOT_试剂袋|r
    .complete 1525,2 --Reagent Pouch (1)
    .mob 火刃祭司
step
    #xprate <1.5 << Shaman/Warrior
    #completewith next
    .goto Durotar,44.72,24.86,40,0
    .goto Durotar,42.28,25.45,30,0
    .goto Durotar,41.66,25.68,20 >>跳入雷霆山 << !Hunter !Warlock
    .goto Durotar,41.66,25.68,20 >>|cRXP_WARN_解散你的|r |T136218:0|t[小鬼]|cRXP_WARN_：右键点击其头像并选择“解散”|r << Warlock
    .cast 2641 >> |cRXP_WARN_施放|r|T136095:0|t[解散野兽]|cRXP_WARN_，然后跳入雷霆山|r << Hunter
step
    #xprate <1.5 << Shaman/Warrior
    #softcore
    .goto Durotar,42.13,26.67
    >>击杀|cRXP_ENEMY_费索·暗雷|r，并拾取|cRXP_LOOT_费索的爪子|r
    >>|cRXP_WARN_小心！先击杀巡逻的|r |cRXP_ENEMY_火刃狂热者|r |cRXP_WARN_以及后方的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_，再攻击费索|r
    >>|cRXP_WARN_把他向后拉到刚击杀的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_所在的位置。否则可能因靠得太近而引到额外的火刃怪物|r
    >>|cRXP_WARN_不必担心为了拿到|cRXP_LOOT_费索的爪子|r而死亡，之后会在|cRXP_FRIENDLY_灵魂医者|r处复活|r
    >>|cRXP_WARN_先击杀小鬼。使用|r |T132155:0|t[凿击] |cRXP_WARN_应对他施放的|r |T136169:0|t[灵魂虹吸] << Rogue
    >>|cRXP_WARN_先击杀小鬼。使用|r |T136026:0|t[地震术] |cRXP_WARN_应对他施放的|r |T136169:0|t[灵魂虹吸] << Shaman
    >>|cRXP_WARN_可以施放|r |T136071:0|t[变形术]|cRXP_WARN_，目标为|r|cRXP_ENEMY_费索·暗雷|r|cRXP_WARN_，然后把|r|cRXP_ENEMY_小鬼|r|cRXP_WARN_优先击杀|r << Mage
    >>|cRXP_WARN_先击杀小鬼|r << Warrior/Warlock/Priest
    >>|cRXP_WARN_如果持有，就使用一瓶|r |T134829:0|t[初级治疗药水]|cRXP_WARN_；必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << !Warlock
    >>|cRXP_WARN_如果持有，就使用|r |T134829:0|t[初级治疗药水]、|T133728:0|t[初级治疗石]|cRXP_WARN_；必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << Warlock
    .complete 806,1 --Fizzle's Claw (1)
    .mob 费索·暗雷
    .mob 小鬼爪牙
    .mob 火刃狂热者
    .mob 闪电蜥蜴
step
    #xprate <1.5 << Shaman/Warrior
    #hardcore
    .goto Durotar,42.13,26.67
    >>击杀|cRXP_ENEMY_费索·暗雷|r，并拾取|cRXP_LOOT_费索的爪子|r
    >>|cRXP_WARN_小心！先击杀巡逻的|r |cRXP_ENEMY_火刃狂热者|r |cRXP_WARN_以及后方的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_，再攻击费索|r
    >>|cRXP_WARN_把他向后拉到刚击杀的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_所在的位置。否则可能因靠得太近而引到额外的火刃怪物|r
    >>|cRXP_WARN_先击杀小鬼。使用|r |T132155:0|t[凿击] |cRXP_WARN_应对他施放的|r |T136169:0|t[灵魂虹吸] << Rogue
    >>|cRXP_WARN_先击杀小鬼。使用|r |T136026:0|t[地震术] |cRXP_WARN_应对他施放的|r |T136169:0|t[灵魂虹吸] << Shaman
    >>|cRXP_WARN_可以施放|r |T136071:0|t[变形术]|cRXP_WARN_，目标为|r|cRXP_ENEMY_费索·暗雷|r|cRXP_WARN_，然后把|r|cRXP_ENEMY_小鬼|r|cRXP_WARN_优先击杀|r << Mage
    >>|cRXP_WARN_先击杀小鬼|r << Warrior/Warlock/Priest
    >>|cRXP_WARN_如果持有，就使用一瓶|r |T134829:0|t[初级治疗药水]|cRXP_WARN_；必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << !Warlock
    >>|cRXP_WARN_如果持有，就使用|r |T134829:0|t[初级治疗药水]、|T133728:0|t[初级治疗石]|cRXP_WARN_；必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << Warlock
    .complete 806,1 --Fizzle's Claw (1)
    .mob 费索·暗雷
    .mob 小鬼爪牙
    .mob 火刃狂热者
    .mob 闪电蜥蜴
step << Warrior/Shaman/Hunter
    #xprate <1.5 << Shaman/Warrior
    #softcore
    .goto Durotar,47.04,17.58
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .isQuestComplete 806
step << Warrior/Shaman/Hunter
    #xprate <1.5 << Shaman/Warrior
    #hardcore
    .goto Durotar,39.20,32.02,60 >> 从雷霆山突围出来
    .isQuestComplete 806
step << !Warrior !Shaman !Hunter
    #xprate >1.49
    #softcore
    .goto Durotar,47.04,17.58
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .isQuestComplete 806
step << !Warrior !Shaman !Hunter
    #xprate >1.49
    #hardcore
    .goto Durotar,39.20,32.02,60 >> 从雷霆山突围出来
    .isQuestComplete 806
step << Warrior/Shaman/Hunter
    #xprate <1.5 << Shaman/Warrior
    .goto Durotar,41.54,18.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林纳格|r交谈
    >>|cRXP_WARN_此时会开始任务的 45 分钟计时器。接下来的 5 分钟内请勿离开或退出游戏|r
    .accept 812 >>接任务：救命如救火
    .target 林纳格
step << Warrior/Shaman
    #optional
    #xprate <1.5
    #loop
    .goto Durotar,43.56,15.08,0
    .goto Durotar,44.16,19.19,60,0
    .goto Durotar,44.13,17.02,60,0
    .goto Durotar,43.56,15.08,60,0
    .xp 9+2930 >>刷怪，直到经验达到 2930+/6500（9 级）
step << Warrior/Shaman
    #optional
    #xprate <1.5
    #loop
    .goto Durotar,43.56,15.08,0
    .goto Durotar,44.16,19.19,60,0
    .goto Durotar,44.13,17.02,60,0
    .goto Durotar,43.56,15.08,60,0
    +刷怪直到炉石冷却结束
    .cooldown item,6948,<0
step << Warrior/Shaman/Hunter
    #xprate <1.5 << Shaman
    #label EnterOrg
    #completewith next
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 前往：奥格瑞玛
    .zoneskip Orgrimmar
step << Warrior/Shaman/Hunter
    #xprate <1.5 << Shaman
    .goto Orgrimmar,32.28,35.80 << !tbc
    .goto Orgrimmar,34.40,36.60 << tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳兹格雷尔|r 交谈 << !tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃金|r 交谈 << tbc
    .turnin 831 >>交任务：将军的命令
    .target 纳兹格雷尔 << !tbc
    .target 沃金 << tbc
step << Warrior/Shaman/Hunter
    #xprate <1.5 << Shaman
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .accept 5726 >>接任务：隐藏的敌人
    .target 萨尔
step << Hunter
    #completewith next
    .goto Orgrimmar,68.02,38.69,30 >> 前往荣誉谷
step << Hunter
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .turnin 6081 >>交任务：训练野兽
    .target 奥玛克
step << Hunter
    .goto Orgrimmar,66.34,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖祖|r交谈
    .train 24547 >>学习宠物技能
    .target 肖祖
step << Hunter
    #completewith FindAntidote
    +|cRXP_WARN_将|r |T132162:0|t[训练野兽]|cRXP_WARN_（常规标签下）、|r |T132163:0|t[复活宠物]|cRXP_WARN_和|r |T132165:0|t[喂养宠物]|cRXP_WARN_添加到动作条上|r
    >>|cRXP_WARN_宠物获得训练点数时，记得使用|r |T132162:0|t[训练野兽]来训练它
step << Hunter
    .goto Orgrimmar,81.17,18.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_交谈，向他购买|r |T135499:0|t[多层弯弓] |cRXP_BUY_。|r
    .collect 2507,1,835,1 --Collect Laminated Recurve Bow (1)
    .money <0.1751
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .target 森度吉安
step << Hunter
    #optional
    #completewith FindAntidote
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓]|cRXP_WARN_（达到11级后）|r
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .xp >11,1
step << Hunter
    #optional
    #completewith FindAntidote
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .xp <11,1
step << Warrior/Shaman/Hunter
    #xprate <1.5 << Shaman/Warrior
    #label FindAntidote
    .goto Orgrimmar,47.24,53.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暗影裂口里的|cRXP_FRIENDLY_考格汉|r交谈
    .accept 813 >>接任务：寻找解毒剂
    .target 考格汉
    .isOnQuest 812
step << Warrior/Shaman/Hunter
    #xprate <1.5 << Shaman/Warrior
    #completewith RazorTurnins2
    #label NeedACure
    >>|cRXP_WARN_放弃任务：救命如救火。这会移除该任务的计时器，但你仍可继续完成它。|r
    .abandon 812 >>放弃任务：救命如救火
    .isOnQuest 812
step << Warrior
    #season 2
    #completewith next
    .goto Orgrimmar,57.40,53.93,-1
    .goto Orgrimmar,58.05,51.40,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎姆沙|r和|cRXP_FRIENDLY_格鲁阿克|r交谈
    +当|cRXP_ENEMY_格鲁阿克|r变为敌对时击杀他
    .target 扎姆沙
    .target 格鲁阿克
    .skipgossip
    --Gossipoption
step << Warrior
    #season 2
    .goto Orgrimmar,58.52,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎姆沙|r交谈
    >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target 扎姆沙
    .train 425447,1
    .skipgossip
step << Warrior
    #season 2
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .use 204716
    .itemcount 204716,1
step
    #xprate <1.5 << Mage/Warlock/Priest/Rogue
    #completewith RazorTurnins2
    .hs >> 炉石回剃刀岭
    .isQuestComplete 806
    .use 6948
    .subzoneskip 362
    .bindlocation 362,1
step
    #xprate <1.5 << Mage/Warlock/Priest/Rogue
    #requires NeedACure
    .goto Durotar,51.51,41.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    .vendor >> 出售杂物
    >>|cRXP_BUY_向他购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_。|r << Mage/Warlock/Priest/Shaman
    >>|cRXP_BUY_向他购买|r |T133974:0|t[肉排] |cRXP_BUY_。|r << Rogue/Warrior
    .collect 1179,15,813,1 << Mage/Warlock/Priest/Shaman --Ice Cold Milk (15)
    .collect 2287,15,813,1 << Rogue/Warrior --Haunch of Meat (15)
    .target 旅店老板格罗斯克
    .money <0.0375
step << Warrior
    #season 2
    .goto Durotar,53.14,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦希|r交谈
    >>交出收集到的|cRXP_LOOT_头颅|r换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target 瓦希·裂骨
    .train 403475,1
step << Warrior
    #season 2
    .use 204688 >>使用 |T134455:0|t[符文碎片]制作 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step << Warrior
    #season 2
    .train 403475 >>使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .use 204703
    .itemcount 204703,1
step << Hunter
    #xprate <1.5
    .goto Durotar,52.24,43.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
    .turnin 806 >>交任务：黑暗风暴
    .accept 828 >>接任务：玛高兹
    .target 奥戈尼尔·魂痕
step << !Hunter
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师托尔卡|r、|cRXP_FRIENDLY_奥戈尼尔·魂痕|r和|cRXP_FRIENDLY_加索克|r交谈
    .turnin 815 >>交任务：恐龙蛋大餐
    .target +厨师托尔卡
    .goto Durotar,51.12,42.46
    .turnin 806 >>交任务：黑暗风暴
    .accept 828 >>接任务：玛高兹
    .target +奥戈尼尔·魂痕
    .goto Durotar,52.24,43.15
    .turnin 825 >>交任务：海底沉船
    .turnin 837 >>交任务：野猪人的进犯
    .target +加索克
    .goto Durotar,51.95,43.50
step
    #xprate <1.5
    .goto Durotar,52.24,43.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔·魂痕|r 交谈
    .accept 828 >> 接任务：玛高兹
    .target 奥戈尼尔·魂痕
    .isQuestTurnedIn 806
step << Hunter/Shaman/Warrior
    #xprate >1.49
    #label RazorTurnins2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔·魂痕|r和|cRXP_FRIENDLY_加索克|r交谈
    .turnin 806 >>交任务：黑暗风暴
    .target +奥戈尼尔·魂痕
    .goto Durotar,52.24,43.15
    .turnin 837 >>交任务：野猪人的进犯
    .target +加索克
    .goto Durotar,51.95,43.50
step << Hunter
    #xprate >1.49
    .goto Durotar,52.24,43.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔·魂痕|r 交谈
    .accept 828 >> 接任务：玛高兹
    .target 奥戈尼尔·魂痕
    .isQuestTurnedIn 806
step << Warrior
    #xprate <1.5
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 6546 >> 学习职业技能
    .accept 1505 >>接任务：老兵犹塞克
    .target 塔绍尔·锯痕
step << Shaman
    #xprate <1.5
    .goto Durotar,54.42,42.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8050 >> 学习职业技能
    .accept 2983 >>接任务：火焰的召唤
    .target 斯瓦特
    .isNotOnQuest 1522
step << Shaman
    #xprate <1.5
    .goto Durotar,54.42,42.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯瓦特|r交谈
    .train 8050 >> 学习职业技能
    .target 斯瓦特
step << Warlock
    #xprate <1.5
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜格鲁·血怒|r交谈
    .train 1120 >> 学习职业技能
    .target 杜格鲁·血怒
step << Warlock
    #xprate <1.5
    .goto Durotar,54.70,41.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基萨|r交谈，并购买 |T133738:0|t[火焰箭（等级 2）]
    .collect 16302,1,813,1 --Grimoire of Firebolt (Rank 2) (1)
    .target 基萨
    .money <0.01
    .train 7799,1
step << Priest
    #xprate <1.5
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .accept 5654 >> 接任务：虚弱妖术 << Troll
    .accept 5660 >> 接任务：虚弱之触 << Undead
    .trainer >> 学习职业技能
    .target 泰金
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与碉堡内的|cRXP_FRIENDLY_索塔尔|r交谈
    .train 13549 >> 学习职业技能
    .target 索塔尔
step << Rogue
    #xprate <1.5
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 674 >> 学习职业技能
    .target 卡普拉克
step << Rogue
    #season 2
    .goto Durotar,51.82,58.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t若已从火刃成员处获得 |cRXP_LOOT_巴索的便条|r，与树下潜行的 |cRXP_FRIENDLY_巴索|r 交谈
    .collect 203990,1 --Rune of Mutilation
    .target 巴索
    .skipgossip
    .itemcount 207098,1
    .train 400094,1
step << Rogue
    #season 2
    .train 400094 >> 使用 |cRXP_LOOT_毁伤符文|r 学会毁伤
    .use 203990
    .itemcount 203990,1
step
    #label DurotarEnd
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate <1.99
<< Horde
#name 10-12 Durotar
#version 11
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 10-12 Tirisfal << Troll Rogue/Orc Rogue/Orc Warlock/Troll Mage/Troll Priest
#next 12-17 The Barrens << Troll !Rogue !Mage !Priest/Orc !Rogue !Warlock
#displayname 10-12 杜隆塔尔
step << Warrior/Shaman
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林·寻路者|r交谈
    .accept 840 >>接受任务: 部落的新兵
    .target 塔克林·寻路者
step << Warrior/Shaman
    #label FarWatchPost
    .goto The Barrens,62.26,19.38,40 >> 前往 [前沿哨所]
    .zoneskip The Barrens
step << Warrior/Shaman
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔·战痕|r交谈
    .turnin 840 >>交任务: 部落的新兵
    .accept 842 >>接受任务: 十字路口征兵
    .target 卡加尔·战痕
step << Warrior
    #xprate <1.5
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1505 >>交任务: 老兵犹塞克
    .accept 1498 >>接受任务: 防御之道
    .target 犹塞克
step << Warrior
    #xprate >1.49
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1498 >>交任务: 防御之道
    .accept 1502 >>接受任务: 索恩格瑞姆·火眼
    .target 犹塞克
step << Shaman
    #xprate <1.5
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡纳尔|r交谈
    .turnin 2983 >>交任务: 火焰的召唤
    .accept 1524 >>接受任务: 火焰的召唤
    .target 卡纳尔·菲斯
step << Warrior/Shaman
    #hardcore
    #completewith PoolsPickup
    .goto The Barrens,52.34,29.27,150,0
    .subzone 380 >> 前往十字路口 (贫瘠之地)
step << Warrior/Shaman
    #softcore
    #completewith next
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << Warrior/Shaman
    #label PoolsPickup
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图加·符文图腾|r交谈
    .accept 870 >>接受任务: 遗忘之池
    .target 图加·符文图腾
step << Warrior/Shaman
    .goto The Barrens,52.23,31.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 842 >>交任务: 十字路口征兵
    .accept 844 >>接受任务: 平原陆行鸟的威胁
    .target 瑟格拉·黑棘
step << Warrior/Shaman
    .goto The Barrens,52.62,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔夫|r交谈
    .accept 6365 >>接受任务: 送往奥格瑞玛的肉
    .target 扎尔夫
step << Warrior/Shaman
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹罗格|r交谈
    .accept 869 >>接受任务: 偷钱的迅猛龙
    .target 加兹罗格
step << Warrior/Shaman
    #xprate >1.49
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板伯兰德·草风|r交谈
    .home >>将炉石绑定在十字路口
    .target 旅店老板伯兰德·草风
    .bindlocation 380
    .subzoneskip 380,1
step << Warrior/Shaman
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .accept 871 >>接受任务: 野猪人的袭击
    .accept 5041 >>接受任务: 十字路口的补给品
    .target 索克
step << Warrior/Shaman
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 交谈
    >>|cRXP_WARN_别飞奥格瑞玛! (留在贫瘠之地做任务)|r
    .fp The Crossroads >> 获取十字路口飞行点
    .turnin 6365 >>交任务: 送往奥格瑞玛的肉
    .accept 6384 >>接任务: 飞往奥格瑞玛
    .target 迪弗拉克
    .zoneskip Orgrimmar
step << Warrior/Shaman
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫布瑞姆|r交谈
    .accept 848 >>接受任务: 菌类孢子
    .accept 1492 >>接受任务: 码头管理员迪兹维格
    .target 药剂师赫布瑞姆
step << Warrior/Shaman
    #completewith next
    >>在遗忘之池周围采集|cRXP_LOOT_饱满的蘑菇|r
    >>|cRXP_WARN_采集蘑菇时，请与|cRXP_ENEMY_科卡尔|r|cRXP_WARN_保持最大距离。它们的等级为 12-14 级|r
    >>|cRXP_WARN_此任务后续奖励为强力的|cRXP_FRIENDLY_坩埚搅拌棒|r|cRXP_WARN_。如果暂时不打算使用它，可以先跳过此任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step << Warrior/Shaman
    .goto The Barrens,45.06,22.54
    >>潜入水下，前往|cRXP_PICK_气泡裂隙|r
    .complete 870,1 --Explore the waters of the Forgotten Pools
step << Warrior/Shaman
    #loop
    .goto The Barrens,45.2,23.3,0
    .goto The Barrens,45.2,23.3,40,0
    .goto The Barrens,45.2,22.0,40,0
    .goto The Barrens,44.6,22.5,40,0
    .goto The Barrens,43.9,24.4,40,0
    >>在遗忘之池周围采集|cRXP_LOOT_饱满的蘑菇|r
    >>|cRXP_WARN_与该区域内的|cRXP_ENEMY_科卡尔|r|cRXP_WARN_保持最大距离。它们等级为 12-14 级|r
    >>|cRXP_WARN_此任务后续奖励为强力的|cRXP_FRIENDLY_坩埚搅拌棒|r|cRXP_WARN_。如果暂时不打算使用它，可以先跳过此任务|r
    .complete 848,1 --Collect Fungal Spores (x4)
step << Warrior/Shaman
    #hardcore
    #completewith FungalSporesComplete
    .goto The Barrens,52.34,29.27,150,0
    .subzone 380 >> 前往十字路口 (贫瘠之地)
step << Warrior/Shaman
    #softcore
    #completewith next
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << Warrior/Shaman
    #label FungalSporesComplete
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫布瑞姆|r 交谈
    >>|cRXP_WARN_等待剧情结束|r
    >>|cRXP_WARN_接取后将开启 45 分钟限时任务|r
    .turnin 848 >> 交任务：菌类孢子
    .timer 7,菌类孢子剧情
    .accept 853 >> 接任务：药剂师扎玛
    .target 药剂师赫布瑞姆
step << Warrior/Shaman
    .goto The Barrens,51.67,29.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔格|r交谈
    >>|cRXP_BUY_向他购买一个或多个|r |T133634:0|t[棕色小包] |cRXP_BUY_。|r|cRXP_BUY_|r
    .collect 4496,1,743,1 --Small Brown Pouch (1)
    .target 巴尔格
    .money <0.05
step << Warrior/Shaman
    #sticky
    #completewith ZamahTurnin2
    +|cRXP_WARN_这是限时任务，别挂机；按本路线，接取后约30分钟会交付任务|r
    .isOnQuest 853
step << Warrior/Shaman
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .turnin 870 >> 交任务：遗忘之池
    .target 图加·符文图腾
step << Warrior/Shaman
    #completewith next
    .goto The Barrens,47.44,56.48,70,0
    .subzone 378 >>沿路向南前往 [陶拉祖营地]
step << Warrior/Shaman
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨|r 对话
    .fp Camp Taurajo >> 获取陶拉祖营地飞行点
    .target 欧姆萨·雷角
step << Warrior/Shaman
    #loop
    .goto Mulgore,55.14,60.65,0
    .goto Mulgore,59.65,62.40,50,0
    .goto Mulgore,57.47,61.26,50,0
    .goto Mulgore,55.14,60.65,50,0
    .goto Mulgore,53.00,60.24,50,0
    .goto Mulgore,51.50,59.23,50,0
    .goto Mulgore,55.14,60.65,50,0
    .line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    >>|cRXP_WARN_他在东侧道路上巡逻|r
    .accept 749 >>接受任务: 被破坏的货车
	.unitscan 摩林·云行者
step << Warrior/Shaman
    #xprate <1.5
    .goto Mulgore,48.715,59.325
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .accept 761 >>接受任务: 猎捕猛鹫
    .target 哈肯·风之图腾
step << Warrior/Shaman
    .goto Mulgore,47.513,60.164
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .accept 767 >>接受任务: 幻象仪祭
    .accept 746 >>接受任务: 矮人的挖掘场
    .target 贝恩·血蹄
step << Warrior/Shaman
    .goto Mulgore,47.3,62.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢尔·鹰爪|r交谈
    .accept 743 >>接受任务: 风怒鹰身人
    .target 卢尔·鹰爪
step << Warrior/Shaman
    .goto Mulgore,47.8,57.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔曼·双月|r交谈
    .turnin 767 >>交任务: 幻象仪祭
    .accept 771 >>接受任务: 幻象仪祭
    .target 扎尔曼·双月
step << Warrior/Shaman
    .goto Mulgore,47.0,57.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茂尔·祈雨|r交谈
    .accept 766 >>接受任务: 马兹拉纳其
    .target 茂尔·祈雨
step << Warrior/Shaman
    #xprate <1.5
    #completewith EnterTB
    >>在该区域做任务时，顺路击杀|cRXP_ENEMY_狼|r、|cRXP_ENEMY_山狮|r、|cRXP_ENEMY_平原陆行鸟|r和|cRXP_ENEMY_猛鹫|r。
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
    .complete 761,1 --Trophy Swoop Quill (8)
step << Warrior/Shaman
    #xprate >1.49
    #completewith EnterTB
    >>在该区域做任务时，顺路击杀|cRXP_ENEMY_狼|r、|cRXP_ENEMY_山狮|r、|cRXP_ENEMY_平原陆行鸟|r和|cRXP_ENEMY_猛鹫|r。
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Warrior/Shaman
	#completewith EnterTB
    >>留意|cRXP_ENEMY_鬼嚎|r。击败它并拾取掉落的 |T134358:0|t[|cRXP_LOOT_恶魔之伤|r]，留着稍后接取任务。
    >>|cRXP_WARN_暂时不要接任务|r
    .collect 4854,1,770 --Collect Demon Scarred Cloak
    .unitscan 鬼嚎
step << Warrior/Shaman
    #loop
    .goto Mulgore,50.36,66.49,0
    .goto Mulgore,48.71,64.44,15,0
    .goto Mulgore,50.36,66.49,15,0
    .goto Mulgore,51.92,63.85,15,0
    .goto Mulgore,51.13,71.06,15,0
    .goto Mulgore,50.36,66.49,15,0
    >>收集|cRXP_PICK_琥珀颗粒|r。它们可以在树下的地面上找到
    .complete 771,2 --Ambercorn (2)
step << Warrior/Shaman
    #loop
    .goto Mulgore,54.06,66.40,0
    .goto Mulgore,53.35,65.78,10,0
    .goto Mulgore,53.70,65.59,10,0
    .goto Mulgore,53.98,65.94,10,0
    .goto Mulgore,54.06,66.40,10,0
    >>在井口周围采集|cRXP_PICK_水井石|r
    .complete 771,1 --Well Stone (2)
step << Warrior/Shaman
    .goto Mulgore,47.76,57.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔曼·双月|r交谈
    >>|cRXP_WARN_不要跟随出现的狼|r
    .turnin 771 >>交任务: 幻象仪祭
    .accept 772 >>接受任务: 幻象仪祭
    .target 扎尔曼·双月
step << Warrior/Shaman
    #label EnterTB
    #completewith ZamahTurnin2
    .goto Thunder Bluff,32.0,66.9,60,0
    .zone Thunder Bluff >> 前往雷霆崖
step << Warrior
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 227 >>学习使用[法杖]
    .train 199 >>学习使用双手锤
    .target 安塞瓦
    .money <0.2
step << Warrior
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 227 >>学习使用[法杖]
    .target 安塞瓦
    .money <0.1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴通·阴影图腾|r交谈
    >>|cRXP_WARN_他|r |T132320:0|t[潜行中]
    .accept 76156 >>接受任务: 大地母亲与匿同在
    .target 巴通·阴影图腾
    .train 410104,1
    .xp <4,1
step << Warrior/Shaman
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 交谈
    .fp Thunder Bluff >> 获取雷霆崖飞行点 << !Tauren
    .target 塔尔
step << Warrior/Shaman
    #completewith next
    .goto Thunder Bluff,28.14,32.97,40,0
    .goto Thunder Bluff,28.51,28.95,10 >> 前往灵魂高地并进入幻视之池
step << Warrior/Shaman
    #label ZamahTurnin2
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师扎玛|r 交谈
    .turnin 853 >> 交任务：药剂师扎玛
    .target 药剂师扎玛
    .isOnQuest 853
step << Warrior/Shaman
    #optional
    #completewith RiteofWisdomTurnin
    +|cRXP_WARN_装备|r |T135145:0|t[坩埚搅拌棒]
    .use 5340
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.1
    .itemcount 5340,1
step << Warrior/Shaman
    #completewith RiteofWisdomTurnin
    .goto Thunder Bluff,29.04,37.68,55,0
    .goto Mulgore,33.48,36.68,40 >> 跑出洞穴, 然后从桥下某处跳下离开雷霆崖
    .zoneskip Mulgore
step << Warrior/Shaman
    #xprate <1.5
    #completewith SacredBurialTurnIn
    >>在该区域做任务时，顺路击杀|cRXP_ENEMY_狼|r、|cRXP_ENEMY_山狮|r、|cRXP_ENEMY_平原陆行鸟|r和|cRXP_ENEMY_猛鹫|r。
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
    .complete 761,1 --Trophy Swoop Quill (8)
step << Warrior/Shaman
    #xprate >1.49
    #completewith SacredBurialTurnIn
    >>在该区域做任务时，顺路击杀|cRXP_ENEMY_狼|r、|cRXP_ENEMY_山狮|r、|cRXP_ENEMY_平原陆行鸟|r和|cRXP_ENEMY_猛鹫|r。
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Warrior/Shaman
	#completewith SacredBurialTurnIn
    >>留意|cRXP_ENEMY_鬼嚎|r。击败它并拾取掉落的 |T134358:0|t[|cRXP_LOOT_恶魔之伤|r]
    >>|cRXP_WARN_暂时不要接任务|r
    .collect 4854,1,770 --Collect Demon Scarred Cloak
    .unitscan 鬼嚎
step << Warrior/Shaman
    #label RiteofWisdomTurnin
    .goto Mulgore,32.72,36.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先知奥萨迪·智慧行者|r交谈
    >>|cRXP_WARN_他在[雷霆崖]西南方的洞穴中|r
    .turnin 772 >>交任务: 幻象仪祭
    .accept 773 >>接受任务: 智慧仪祭
    .target 先知奥萨迪·智慧行者
step << Warrior/Shaman
    #completewith next
    .destroy 4823 >>摧毁 |T134712:0|t[先知之水]，之后用不上它了
step << Warrior/Shaman
    #loop
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
    >>击杀|cRXP_ENEMY_风怒唤风者|r和|cRXP_ENEMY_风怒鹰身人|r，拾取掉落的|cRXP_LOOT_风怒鹰身人的爪子|r
    .complete 743,1 --Windfury Talon (8)
    .mob 风怒唤风者
    .mob 风怒鹰身人
step << Shaman
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_巴尔丹掘地工|r和|cRXP_ENEMY_巴尔丹鉴定官|r，拾取掉落的|cRXP_LOOT_神器仓库钥匙|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
    .train 425344,1
    .xp <3,1
step << Warrior/Shaman
    .goto Mulgore,31.27,49.87
    >>击杀 |cRXP_ENEMY_巴尔丹掘地工|r 和 |cRXP_ENEMY_巴尔丹鉴定官|r，拾取它们掉落的 |cRXP_LOOT_勘探者的镐|r
    .use 4702 >> 在熔炉处砸碎|T134707:0|t[勘探者的镐]
    .complete 746,1 --Broken Tools (5)
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
step << Shaman
    #season 2
    #loop
    .goto Mulgore,33.10,47.69,0
    .goto Mulgore,34.33,47.54,40,0
    .goto Mulgore,33.62,49.61,40,0
    .goto Mulgore,32.58,48.96,40,0
    .goto Mulgore,31.88,50.17,40,0
    .goto Mulgore,31.14,50.08,40,0
    .goto Mulgore,30.98,48.24,40,0
    .goto Mulgore,31.59,48.19,40,0
    .goto Mulgore,33.10,47.69,40,0
    >>击杀|cRXP_ENEMY_巴尔丹掘地工|r和|cRXP_ENEMY_巴尔丹鉴定官|r，拾取掉落的|cRXP_LOOT_神器仓库钥匙|r
    >>|cRXP_WARN_当心|cRXP_ENEMY_巴尔丹鉴定官|r会施放|r |T135929:0|t[次级治疗术]|cRXP_WARN_（远程施法：为自身或附近血量低于 50% 的敌人回复约 75 点生命）|r
    .collect 206975,1 --Artifact Storage Key (1)
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
    .train 425344,1
    .xp <3,1
step << Shaman
    #season 2
    .goto Mulgore,31.56,49.54
    >>打开|cRXP_PICK_神器仓库|r箱子，拾取其中的 |T134918:0|t[|cRXP_LOOT_硫息圣像|r]
    .collect 206388,1 --Sulfurous Icon (1)
    .train 425344,1
    .xp <3,1
step << Shaman
    #season 2
    .equip 18,206388 >> |cRXP_WARN_装备|r |T134918:0|t[|cRXP_LOOT_硫息圣像|r]
    .use 206388
    .itemcount 206388,1 --Sulfurous Icon (1)
    .train 425344,1
    .xp <3,1
step << Shaman
    #season 2
    #label MoltenBlast
    #completewith SacredBurialTurnIn
    .aura 408828 >>|cRXP_WARN_击杀敌人时，至少对其施放一次|r |T136026:0|t[地震术]|cRXP_WARN_并造成伤害。重复10次可获得|r |T136116:0|t[灵感勃发]|cRXP_WARN_增益效果|r
    >>|cRXP_WARN_注意：必须对能提供经验的敌人使用才能叠加层数|r
    .mob 巴尔丹掘地工
    .mob 巴尔丹鉴定官
    .train 425344,1
step << Warrior/Shaman
    #label SacredBurial
    .goto Mulgore,59.85,25.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暴雨图腾|r交谈
    .accept 833 >>接受任务: 神圣的墓地
    .target 博学者诺拉·暴雨图腾
step << Warrior/Shaman
    #completewith next
    >>击杀|cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper (8)
    .mob 刺背干涉者
step << Warrior/Shaman
    .goto Mulgore,61.45,21.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先祖之魂|r交谈
    .turnin 773 >>交任务: 智慧仪祭
    .target 先祖之魂
step << Warrior/Shaman
    #loop
	.goto Mulgore,61.12,22.88,0
	.goto Mulgore,59.85,25.62,40,0
	.goto Mulgore,61.14,22.93,40,0
	.goto Mulgore,61.77,22.49,40,0
	.goto Mulgore,62.18,22.05,40,0
	.goto Mulgore,62.32,20.89,40,0
	.goto Mulgore,61.62,19.50,40,0
	.goto Mulgore,60.44,19.50,40,0
	.goto Mulgore,60.16,21.06,40,0
	.goto Mulgore,60.41,21.96,40,0
	.goto Mulgore,61.12,22.88,40,0
    >>击杀|cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper (8)
    .mob 刺背干涉者
step << Warrior/Shaman
    #label SacredBurialTurnIn
    .goto Mulgore,59.85,25.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暴雨图腾|r交谈
    .turnin 833 >>交任务: 神圣的墓地
    .target 博学者诺拉·暴雨图腾
step << Shaman
    #season 2
    #requires MoltenBlast
    .cast 402265 >>|cRXP_WARN_使用|r |T134918:0|t[|cRXP_LOOT_硫息圣像|r]|cRXP_WARN_学习|r |T133816:0|t[铭刻手套：熔火爆裂]
    .use 206388
    .aura -408828
    .itemStat 18,QUALITY,2
    .train 425344,1
    .xp <3,1
step << Warrior/Shaman
    #xprate <1.5
    #completewith next
    >>在该区域做任务时，顺路击杀|cRXP_ENEMY_狼|r、|cRXP_ENEMY_山狮|r、|cRXP_ENEMY_平原陆行鸟|r和|cRXP_ENEMY_猛鹫|r。
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
    .complete 761,1 --Trophy Swoop Quill (8)
step << Warrior/Shaman
    #xprate >1.49
    #completewith next
    >>在该区域做任务时，顺路击杀|cRXP_ENEMY_狼|r、|cRXP_ENEMY_山狮|r、|cRXP_ENEMY_平原陆行鸟|r和|cRXP_ENEMY_猛鹫|r。
    .complete 766,1 --Prairie Wolf Heart (1)
    .complete 766,2 --Flatland Cougar Femur (1)
    .complete 766,3 --Plainstrider Scale (1)
    .complete 766,4 --Swoop Gizzard (1)
step << Warrior/Shaman
    .goto Mulgore,53.74,48.17
    >>点击|cRXP_PICK_密封的补给箱|r
    .turnin 749 >>交任务: 被破坏的货车
    .accept 751 >>接受任务: 被破坏的货车
step << Warrior/Shaman
    .goto Mulgore,46.97,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_茂尔·祈雨|r交谈
    .turnin 766 >>交任务: 马兹拉纳其
    .target 茂尔·祈雨
    .isQuestComplete 766
step << Warrior/Shaman
    .goto Mulgore,46.75,60.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯考恩|r交谈
    .accept 770 >>接受任务: 恶魔之伤
    .turnin 770 >>交任务: 恶魔之伤
    .target 斯考恩·白云
    .target 斯考恩·白云
    .use 4854
    .itemcount 4854,1
step << Warrior/Shaman
    .goto Mulgore,47.51,60.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝恩·血蹄|r交谈
    .turnin 746 >>交任务: 矮人的挖掘场
    .target 贝恩·血蹄
step << Warrior/Shaman
    .goto Mulgore,47.35,62.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢尔·鹰爪|r交谈
    .turnin 743 >>交任务: 风怒鹰身人
    .target 卢尔·鹰爪
step << Warrior/Shaman
    #xprate <1.5
    .goto Mulgore,48.71,59.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 761 >>交任务: 猎捕猛鹫
    .target 哈肯·风之图腾
    .isQuestComplete 761
step << Shaman
    .goto Mulgore,48.38,59.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳姆|r交谈
    .train 547 >> 学习职业技能
    .target 纳姆·逐星
    .xp <12,1
step << Warrior
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗·石蹄|r 交谈
    .train 7384 >> 学习职业技能
    .target 克朗·石蹄
    .xp <12,1
step << Warrior/Shaman
    #loop
    .goto Mulgore,55.14,60.65,0
    .goto Mulgore,59.65,62.40,50,0
    .goto Mulgore,57.47,61.26,50,0
    .goto Mulgore,55.14,60.65,50,0
    .goto Mulgore,53.00,60.24,50,0
    .goto Mulgore,51.50,59.23,50,0
    .goto Mulgore,55.14,60.65,50,0
    .line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩林·云行者|r 交谈
    >>|cRXP_WARN_他在东侧道路上巡逻|r
    .turnin 751 >> 交任务: 被破坏的货车
    .accept 764 >> 接任务：风险投资公司
    .accept 765 >> 接任务：菲兹普罗克主管
	.unitscan 摩林·云行者
step << Warrior/Shaman
    #completewith Fizsprocket
    .goto Mulgore,61.51,47.29,20 >> 前往风险投资公司矿井
step << Shaman
    #season 2
    #completewith VentureCoKills
    >>在矿洞内和另一侧外面打开|cRXP_PICK_冲击补给品|r，拾取|cRXP_LOOT_爆盐采矿炸弹|r
    >>|cRXP_WARN_尽量待在洞穴上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
    .xp <4,1
step << Warrior/Shaman
    #completewith next
    >>击杀|cRXP_ENEMY_风险投资公司工人|r和|cRXP_ENEMY_风险投资公司主管|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +风险投资公司工人
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +风险投资公司主管
step << Warrior/Shaman
    #label Fizsprocket
    .goto Mulgore,64.95,43.33
    >>跑进矿洞后沿右侧（东侧）前进，击杀|cRXP_ENEMY_菲兹普罗克主管|r并拾取掉落的|cRXP_LOOT_菲兹普罗克的笔记板|r
    .complete 765,1 --Fizsprocket's Clipboard (1)
    .mob 菲兹普罗克主管
step << Warrior/Shaman
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
    >>击杀|cRXP_ENEMY_风险投资公司工人|r和|cRXP_ENEMY_风险投资公司主管|r
    .complete 764,1 --Venture Co. Worker (14)
    .mob +风险投资公司工人
    .complete 764,2 --Venture Co. Supervisor (6)
    .mob +风险投资公司主管
step << Shaman
    #season 2
    #loop
    .goto Mulgore,61.72,35.15,0
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
    >>打开矿洞内和另一侧外面的|cRXP_PICK_冲击补给品|r，拾取|cRXP_LOOT_爆盐采矿炸弹|r
    >>|cRXP_WARN_尽量待在洞穴上层|r
    .complete 76156,1 --Seaforium Mining Charge (5)
    .train 410104,1
    .xp <4,1
step << Warrior/Shaman
    #optional
    #xprate <1.5
    #loop
	.goto Mulgore,61.35,47.55,25,0
	.goto Mulgore,60.10,47.84,25,0
	.goto Mulgore,59.50,48.21,25,0
	.goto Mulgore,59.68,48.85,25,0
	.goto Mulgore,60.14,49.14,25,0
	.goto Mulgore,62.01,48.74,25,0
	.goto Mulgore,61.89,47.84,25,0
    .xp 11+7150 >> 刷怪至 7150+/8700 经验值
step << Warrior/Shaman
    #optional
    #xprate >1.49
    #loop
	.goto Mulgore,61.35,47.55,25,0
	.goto Mulgore,60.10,47.84,25,0
	.goto Mulgore,59.50,48.21,25,0
	.goto Mulgore,59.68,48.85,25,0
	.goto Mulgore,60.14,49.14,25,0
	.goto Mulgore,62.01,48.74,25,0
	.goto Mulgore,61.89,47.84,25,0
    .xp 11+6375 >> 刷怪至 6375+/8700 经验值
step << Warrior/Shaman
    #loop
    .goto Mulgore,55.14,60.65,0
    .goto Mulgore,59.65,62.40,50,0
    .goto Mulgore,57.47,61.26,50,0
    .goto Mulgore,55.14,60.65,50,0
    .goto Mulgore,53.00,60.24,50,0
    .goto Mulgore,51.50,59.23,50,0
    .goto Mulgore,55.14,60.65,50,0
    .line Mulgore,51.50,59.23,53.00,60.24,55.14,60.65,57.47,61.26,59.65,62.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    >>|cRXP_WARN_他在东侧道路上巡逻|r
    .turnin 764 >>交任务: 风险投资公司
    .turnin 765 >>交任务: 菲兹普罗克主管
	.unitscan 摩林·云行者
step << Warrior
    #xprate >1.49
    .goto Mulgore,49.52,60.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克朗·石蹄|r 交谈
    .train 7384 >> 学习职业技能
    .target 克朗·石蹄
step << Shaman
    #season 2
    #completewith next
    .zone Thunder Bluff >> 前往雷霆崖
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴通·阴影图腾|r交谈
    >>|cRXP_WARN_他|r |T132320:0|t[潜行中]
    .turnin 76156 >>交任务: 大地母亲与匿同在
    .accept 76160 >>接受任务: 大地母亲与匿同在
    .target 巴通·阴影图腾
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    .goto Thunder Bluff,37.8,59.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .accept 744 >>接受任务: 准备典礼
    .target 伊恩·鹰爪
    .train 410104,1
step << Shaman
    #season 2
    #completewith next
    .zone Mulgore >>乘坐北侧升降梯下到莫高雷
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_风怒女巫|r，拾取掉落的|cRXP_LOOT_碧蓝色的羽毛|r
    >>击杀|cRXP_ENEMY_风怒女族长|r，拾取掉落的|cRXP_LOOT_古铜色的羽毛|r
    .complete 744,1 --Azure Feather (6)
    .mob +风怒女巫
    .complete 744,2 --Bronze Feather (6)
    .mob +风怒女族长
    .train 410104,1
step << Shaman
    #season 2
    #loop
    #loop
    .goto Mulgore,30.89,22.41,0
    .goto Mulgore,30.89,22.41,20,0
    .goto Mulgore,29.57,23.43,20,0
    .goto Mulgore,29.63,26.32,20,0
    >>拾取地面上的|cRXP_LOOT_风怒球果|r
    .collect 206170,8,76160,1 --Windfury Cone (8)
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #loop
    .goto Mulgore,31.7,28.2,0
    .goto Mulgore,30.2,19.5,0
    .goto Mulgore,31.7,28.2,40,0
    .goto Mulgore,30.2,19.5,40,0
    >>击杀|cRXP_ENEMY_风怒女巫|r，拾取掉落的|cRXP_LOOT_碧蓝色的羽毛|r
    >>击杀|cRXP_ENEMY_风怒女族长|r，拾取掉落的|cRXP_LOOT_古铜色的羽毛|r
    .complete 744,1 --Azure Feather (6)
    .mob +风怒女巫
    .complete 744,2 --Bronze Feather (6)
    .mob +风怒女族长
    .train 410104,1
step << Shaman
    #season 2
    >>使用 |T133748:0|t[研钵和捣杵]制作 |T133213:0|t[松树药膏]
    .complete 76160,1 --Pine Salve (1)
    .use 206176
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    .goto Thunder Bluff,37.8,59.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .turnin 744 >>交任务: 准备典礼
    .target 伊恩·鹰爪
    .train 410104,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴通·阴影图腾|r交谈
    >>|cRXP_WARN_他|r |T132320:0|t[潜行中]
    .turnin 76160 >>交任务: 大地母亲与匿同在
    .accept 76240 >>接受任务: 大地母亲与匿同在
    .target 巴通·阴影图腾
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ah
    .goto Thunder Bluff,45.23,59.40,0
    .goto Thunder Bluff,40.41,51.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师斯塔比|r交谈
    >>|cRXP_BUY_购买|r |T133894:0|t[新鲜的美味小鱼]|cRXP_BUY_（拍卖行有售）|r
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .target 拍卖师斯塔比
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
    .goto Thunder Bluff,55.78,47.02,15 >>前往 |cRXP_FRIENDLY_苏瓦·迷雾行者|r 处
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #sticky
    #label Kah
    .goto Thunder Bluff,56.13,46.39,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔·迷雾行者|r交谈
    .train 7733 >>学习 |T136245:0|t[钓鱼]
    .target 卡尔·迷雾行者
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #label Sewa
    .goto Thunder Bluff,55.78,47.02,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏瓦·迷雾行者|r交谈
    >>|cRXP_BUY_购买|r |T132932:0|t[鱼竿]|cRXP_BUY_和|r |T134335:0|t[闪光的小珠]|cRXP_BUY_（她有售）|r
    .collect 6256,1 --Fishing Pole (1)
    .collect 6529,1 --Shiny Bauble (1)
    .target 苏瓦·迷雾行者
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #completewith Fish
    #requires Kah
    #label Pole
    .equip 16,6256 >> |cRXP_WARN_装备|r |T132932:0|t[钓鱼竿]
    .use 6256
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #completewith Fish
    #requires Pole
    .aura 8087 >> |cRXP_WARN_将|r |T134335:0|t[闪光的小珠] |cRXP_WARN_挂到|r |T132932:0|t[钓鱼竿] 上
    .use 6529
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    #ssf
    #label Fish
    #requires Kah
    .goto Thunder Bluff,40.42,58.55
    >>在池塘钓鱼，直到钓到 |T133894:0|t[|cRXP_LOOT_新鲜的美味小鱼|r]
    .collect 6291,1,76240,1 --Raw Brilliant Smallfish (1)
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    >>使用 |T132147:0|t[一套匕首]制作 |T134007:0|t[鱼块]
    .complete 76240,1 --Fish Chunks (1)
    .use 206344
    .train 410104,1
    .xp <4,1
step << Shaman
    #season 2
    .goto Thunder Bluff,39.45,65.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴通·阴影图腾|r交谈
    >>|cRXP_WARN_他|r |T132320:0|t[潜行中]
    .turnin 76240 >>交任务: 大地母亲与匿同在
-- .train 410104 >>|cRXP_WARN_You will train|r |T236289:0|t[Lava Lash] |cRXP_WARN_and|r |T132147:0|t[Dual Wield] |cRXP_WARN_upon turnin|r
    .target 巴通·阴影图腾
    .train 410104,1
    .xp <4,1
step << Warrior/Shaman
    #optional
    .abandon 766 >> 放弃任务 [马兹拉纳其]
step << Warrior/Shaman
    #xprate >1.49
    .hs >> 炉石回十字路口
    .subzoneskip 380
    .bindlocation 380,1
    .use 6948
step << Warrior/Shaman
    #xprate <1.5
    #completewith MargozTurnIn
    .hs >> 炉石回剃刀岭
    .subzoneskip 362
    .bindlocation 362,1
    .use 6948
step << Warrior
    #xprate <1.5
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔绍尔·锯痕|r 交谈
    .train 6546 >> 学习职业技能
    .target 塔绍尔·锯痕
    .xp <12,1
step << Shaman
    #xprate <1.5
    .goto Durotar,54.42,42.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯瓦特|r 交谈
    .train 8050 >> 学习职业技能
    .target 斯瓦特
    .xp <12,1
step << Shaman
    #xprate <1.5
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
    .goto Durotar,39.16,58.56,10 >> 沿山路上山，前往|cRXP_FRIENDLY_泰尔夫·祖拉姆|r处
    >>|cRXP_WARN_小心别从山上掉下去, 路非常狭窄. 一旦坠落, 可能会死亡|r
step << Shaman
    #xprate <1.5
    #label CallofFire3
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰尔夫·祖拉姆|r交谈
    .turnin 1524 >>交任务: 火焰的召唤
    .accept 1525 >>接受任务: 火焰的召唤
    .target 泰尔夫·祖拉姆
step << Warrior
    #xprate <1.5
    .goto Durotar,54.39,42.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔克|r交谈
    .vendor >>|cRXP_BUY_购买|r |T133634:0|t[棕色小包]|cRXP_BUY_（卖家是|r|cRXP_BUY_加尔克）|r
    .target 加尔克
step << Hunter
    #completewith MargozTurnIn
    +驯服一只|cRXP_ENEMY_毒尾蝎|r
    .mob 毒尾蝎
    .train 16828,1 --Claw rank 2
step << Shaman
    #xprate <1.5
    #completewith next
    .subzone 371 >>前往 [尘风洞穴]
step << Shaman
    #xprate <1.5
    #loop
    .goto Durotar,53.18,29.15,0
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    .goto Durotar,51.90,25.70,12,0
    >>击杀|cRXP_ENEMY_火刃祭司|r，拾取|cRXP_LOOT_试剂袋|r
    .complete 1525,2 --Reagent Pouch (1)
    .mob 火刃祭司
step
    #xprate <1.5 << !Hunter
    #completewith next
    .goto Durotar,56.30,27.91,80,0
    .goto Durotar,56.41,20.04,50 >> 前往 |cRXP_FRIENDLY_玛高兹|r 处
    .isQuestTurnedIn 806
step
    #xprate <1.5 << !Hunter
    #label MargozTurnIn
    .goto Durotar,56.41,20.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
    .turnin 828 >>交任务: 玛高兹
    .accept 827 >>接受任务: 骷髅石
    .target 玛高兹
    .isQuestTurnedIn 806
step
    #xprate <1.5 << !Hunter
    .goto Durotar,56.41,20.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛高兹|r 交谈
    .accept 827 >> 接任务：骷髅石
    .target 玛高兹
    .isQuestTurnedIn 828
step << !Warrior !Shaman !Hunter
    #xprate <1.5
    #completewith next
    .goto Durotar,56.49,25.04,50,0
    .goto Durotar,56.11,27.94,50,0
    .goto Durotar,53.18,29.15,50 >> 前往 [尘风洞穴]
    .isQuestTurnedIn 828
step << Mage
    #xprate <1.5
    #season 2
    #completewith next
    >>击杀尘风洞穴内的|cRXP_ENEMY_火刃兽人|r，拾取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN|r]
    .collect 203752,1 --Spell Notes: MILEGIN VALF (1)
    .train 401768,1
step << !Warrior !Shaman !Hunter
    #xprate <1.5
    #loop
    .goto Durotar,53.18,29.15,0
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    .goto Durotar,52.70,27.97,12,0
    >>击杀|cRXP_ENEMY_火刃兽人|r，拾取|cRXP_LOOT_灼热项圈|r
    .complete 827,1 --Searing Collar (6)
    .mob 火刃暴徒
    .mob 火刃新兵
    .mob 火刃祭司
    .isQuestTurnedIn 828
step << Mage
    #season 2
    #xprate <1.5
    #loop
    .goto Durotar,53.18,29.15,0
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    .goto Durotar,52.70,27.97,12,0
    >>击杀尘风洞穴内的|cRXP_ENEMY_火刃兽人|r，拾取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN|r]
    .collect 203752,1 --Spell Notes: MILEGIN VALF (1)
    .mob 火刃暴徒
    .mob 火刃新兵
    .mob 火刃祭司
    .train 401768,1
step << Mage
    #optional
    #completewith ZeptoUC1
    #xprate <1.5
    #season 2
    .collect 211779,1 >>若持有 |T135933:0|t[理解魔符]，现在可解读笔记；否则先继续路线，稍后在奥格瑞玛向施法材料商购买。
    .train 401768 >>|cRXP_WARN_使用 |r|T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN|r] |cRXP_WARN_学习|r |T135820:0|t[活体烈焰]
    .use 203752
    .itemcount 203752,1
    .train 401768,1
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #completewith Gazzuz
    .goto Durotar,55.12,10.10,60 >> 前往 [骷髅石]
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #completewith Gazzuz
    >>击杀|cRXP_ENEMY_毒尾蝎|r，拾取|cRXP_LOOT_毒尾蝎毒囊|r
    .complete 813,1 --Venomtail Poison Sac (4)
    .mob 毒尾蝎
    .itemcount 4904,<1 --Venomtail Antidote
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #completewith Gazzuz
    .goto Durotar,54.72,8.78,15,0
    .goto Durotar,54.29,8.89,15,0
    .goto Durotar,53.77,8.87,15,0
    .goto Durotar,53.37,7.73,15,0
    .goto Durotar,52.73,7.85,15,0
    .goto Durotar,52.42,8.59,15,0
    .goto Durotar,51.65,8.19,15,0
    .goto Durotar,51.39,8.71,15,0
    .goto Durotar,51.48,9.71,15,0
    >>击杀|cRXP_ENEMY_火刃兽人|r，拾取|cRXP_LOOT_灼热项圈|r和|cRXP_LOOT_军官的徽章|r
    .complete 827,1 --Searing Collar (6)
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #label Gazzuz
    .goto Durotar,51.8,10.0
    >>击杀|cRXP_ENEMY_加祖兹|r，拾取掉落的 |T134085:0|t[|cRXP_LOOT_燃影之眼|r]
    >>|cRXP_WARN_使用 |T134085:0|t[|cRXP_LOOT_燃影之眼|r]开启任务|r
    >>|cRXP_WARN_使用|r |T134712:0|t[强力胶水]|cRXP_WARN_定身|r|cRXP_ENEMY_虚空行者|r|cRXP_WARN_以避免被击中，并使用|r |T134829:0|t[治疗药水]|cRXP_WARN_恢复生命值。利用障碍物遮挡视线（LoS），躲避|r|cRXP_ENEMY_加祖兹|r|cRXP_WARN_的暗影箭|r
    >>|cRXP_WARN_击杀|r|cRXP_ENEMY_加祖兹|r|cRXP_WARN_后，跑到洞穴内的水域躲避|r|cRXP_ENEMY_虚空行者|r
    >>|cRXP_WARN_小心，这家伙非常难打。如果需要，可以跳过此任务|r
    .collect 4903,1,832,1 --Collect Eye of Burning Shadow
    .accept 832 >>接受任务: 燃影之眼
    .use 4903
	.unitscan 加祖兹
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #loop
    .goto Durotar,53.77,8.87,0
    .goto Durotar,54.72,8.78,15,0
    .goto Durotar,54.29,8.89,15,0
    .goto Durotar,53.77,8.87,15,0
    .goto Durotar,53.37,7.73,15,0
    .goto Durotar,52.73,7.85,15,0
    .goto Durotar,52.42,8.59,15,0
    .goto Durotar,51.65,8.19,15,0
    .goto Durotar,51.39,8.71,15,0
    .goto Durotar,51.48,9.71,15,0
    .goto Durotar,53.77,8.87,15,0
    >>击杀|cRXP_ENEMY_火刃兽人|r，拾取|cRXP_LOOT_灼热项圈|r和|cRXP_LOOT_军官的徽章|r
    >>|cRXP_WARN_如果迟迟未掉落|r|cRXP_LOOT_军官的徽章|r|cRXP_WARN_，就跳过收集它|r
    .complete 827,1 --Searing Collar (6)
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #completewith Ravine
    >>击杀|cRXP_ENEMY_毒尾蝎|r，拾取|cRXP_LOOT_毒尾蝎毒囊|r
    .complete 813,1 --Venomtail Poison Sac (4)
    .mob 毒尾蝎
    .itemcount 4904,<1 --Venomtail Antidote
step
    #xprate <1.5 << !Hunter
    .goto Durotar,56.41,20.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
    .turnin 827 >>交任务: 骷髅石
    .accept 829 >>接受任务: 尼尔鲁·火刃
    .target 玛高兹
    .isQuestTurnedIn 806
step
    #xprate <1.5 << !Hunter
    .goto Durotar,56.41,20.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛高兹|r 交谈
    .accept 829 >> 接任务：尼尔鲁·火刃
    .target 玛高兹
    .isQuestTurnedIn 827
step
    #xprate <1.5
    #label Ravine
    #completewith next
    .subzone 370 >> 跳下进入枯水谷
step
    #xprate <1.5
    #loop
    .goto Durotar,53.98,23.70,0
    .goto Durotar,54.02,27.23,40,0
    .goto Durotar,52.82,24.27,40,0
    .goto Durotar,51.85,23.95,40,0
    .goto Durotar,54.01,23.63,40,0
    .goto Durotar,52.13,20.77,40,0
    .goto Durotar,51.26,19.19,40,0
    .goto Durotar,53.98,23.70,40,0
    >>击杀|cRXP_ENEMY_尘风暴徒|r和|cRXP_ENEMY_尘风雷巫|r
    .complete 835,1 --Dustwind Savage (12)
    .mob +尘风暴徒
    .complete 835,2 --Dustwind Storm Witch (8)
    .mob +尘风雷巫
step
    #xprate <1.5
    #softcore
    #completewith SecuringLinesTurnIn
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .isQuestComplete 813 << Warrior/Shaman/Hunter
step
    #xprate <1.5
    #hardcore
    #completewith next
    .goto Durotar,53.75,27.74,60,0
    .goto Durotar,51.75,27.40,60,0
    .goto Durotar,46.37,22.94,60 >> 穿过洞穴前往 |cRXP_FRIENDLY_雷兹拉克|r 处
step
    #xprate <1.5
    #label SecuringLinesTurnIn
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 835 >>交任务: 保卫商路
    .target 雷兹拉克
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #loop
    .goto Durotar,38.73,22.04,0
    .goto Durotar,42.64,20.45,60,0
    .goto Durotar,40.43,19.72,60,0
    .goto Durotar,40.59,16.41,60,0
    .goto Durotar,38.79,17.00,60,0
    .goto Durotar,38.73,22.04,60,0
    >>击杀|cRXP_ENEMY_毒尾蝎|r，收集齐它们掉落的|cRXP_LOOT_毒尾蝎毒囊|r
    .complete 813,1 --Venomtail Poison Sac (4)
    .mob 毒尾蝎
    .itemcount 4904,<1 --Venomtail Antidote
step
    #xprate <1.5 << Warrior/Shaman/Hunter
    #completewith Admiralorders1 << !Warrior !Shaman !Hunter
    #completewith NeeruFireblade << Warrior/Shaman/Hunter
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 进入奥格瑞玛
step << !Rogue
    #xprate <1.5 << Shaman/Warrior
    .goto Orgrimmar,47.21,70.27,15,0
    .goto Orgrimmar,47.55,68.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌萨罗|r 交谈
    .vendor >> 出售杂物并修理装备
    .target 乌萨罗
step << Shaman/Warrior
    #xprate <1.5
    #label Gryhskaturnin1
    .goto Orgrimmar,54.097,68.407
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷什卡|r交谈
    .turnin 6384 >>交任务: 飞往奥格瑞玛
    .accept 6385 >>接受任务: 双足飞龙管理员多拉斯
    .target 旅店老板格雷什卡
step << Shaman/Warrior
    #xprate <1.5
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
    .turnin 6385 >> 交任务：双足飞龙管理员多拉斯
    .accept 6386 >> 接任务：返回十字路口
    .target 多拉斯
step << Shaman
    #xprate <1.5
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
    .train 8050 >> 学习职业技能
    .target 卡德里斯
step << Rogue
    .goto Orgrimmar,48.12,80.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_特拉克根|r |cRXP_BUY_对话，并购买|r |T135419:0|t[锋利的飞斧（燃烧的远征：锐利的飞斧）] |cRXP_BUY_（他有售）|r
    .collect 3135,200,354,1 << !tbc
    .collect 29008,1,354,1 << tbc
    .vendor >> 出售杂物
    .target 特拉克根
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #optional
    #completewith ZeptoUC1
    +|cRXP_WARN_装备|r |T135421:0|t[锋利的飞斧（燃烧的远征：锐利的飞斧）]|cRXP_WARN_（达到11级时）|r
    .use 3135 << !tbc
    .use 29008 << tbc
    .itemcount 3135,1 << !tbc
    .itemcount 29008,1 << tbc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Troll Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r 交谈
    .turnin 5654 >> 交任务：虚弱妖术
    .trainer >> 学习职业技能
    .target 乌尔库
    .isOnQuest 5654
step << Troll Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r 交谈
    .turnin 5652 >> 交任务：虚弱妖术
    .trainer >> 学习职业技能
    .target 乌尔库
step << Mage
    .goto Orgrimmar,38.33,85.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_皮菲瑞多|r 交谈
    .train 122 >> 学习职业技能
    .target 皮菲瑞多
step << Warrior
    #xprate <1.5
    #completewith next
    .goto Orgrimmar,68.02,38.69,30 >> 前往 [荣誉谷]
step << Warrior
    #xprate <1.5
    .goto Orgrimmar,79.93,31.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 6546 >> 学习职业技能
    .target 格雷兹·怒拳
step << !Warrior !Shaman !Hunter
    #label Admiralorders1
    .goto Orgrimmar,32.28,35.80 << !tbc
    .goto Orgrimmar,34.40,36.60 << tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳兹格雷尔|r 交谈 << !tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃金|r 交谈 << tbc
    .turnin 831 >>交任务: 将军的命令
    .target 纳兹格雷尔 << !tbc
    .target 沃金 << tbc
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5726 >>交任务: 隐藏的敌人
    .accept 5727 >>接受任务: 隐藏的敌人
    .target 萨尔
    .isQuestComplete 5726
    .dungeon RFC
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    .dungeon RFC
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 交谈
    .accept 5727 >> 接任务：隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5726
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5726 >>交任务: 隐藏的敌人
    .target 萨尔
    .isQuestComplete 5726
    .dungeon !RFC
step << Rogue
    .goto Orgrimmar,42.75,53.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 交谈
	.accept 1963 >> 接任务：碎手氏族 << Orc Rogue/Troll Rogue
    .target 瑟祖克
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    .goto Orgrimmar,47.24,53.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考格汉|r交谈
    .turnin 813 >>交任务: 寻找解毒剂
    .target 考格汉
    .itemcount 4904,<1 --Venomtail Antidote
step << Warlock
    .goto Orgrimmar,48.59,46.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米尔科特|r 交谈
    .train 1120 >> 学习职业技能
    .target 米尔科特
step
    #xprate <1.5 << !Hunter
    .goto Orgrimmar,49.49,50.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 829 >>交任务: 尼尔鲁·火刃
    .turnin 832 >>交任务: 燃影之眼
    .accept 809 >>接受任务: 雅克塞罗斯
    .target 尼尔鲁·火刃
    .isQuestTurnedIn 827
    .isOnQuest 832
step
    #xprate <1.5 << !Hunter
    #label NeeruFireblade
    .goto Orgrimmar,49.49,50.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 829 >>交任务: 尼尔鲁·火刃
    .accept 809 >>接受任务: 雅克塞罗斯
    .target 尼尔鲁·火刃
    .isQuestTurnedIn 827
step << Rogue
    #season 2
    .goto Orgrimmar,55.87,44.89
    >>打开|cRXP_PICK_落满灰尘的箱子|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_它在暗巷区的上层|r
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
step << !Warrior !Shaman !Hunter
    #softcore
    #completewith ZeptoUC1
    .goto Orgrimmar,53.03,48.78
    .subzone 2437 >> 进入怒焰裂谷
step << !Warrior !Shaman !Hunter
    #softcore
    #completewith ZeptoUC1
    .goto Durotar,47.05,17.58
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << !Warrior !Shaman !Hunter
    #hardcore
    #completewith ZeptoUC1
    .zone Durotar >> 离开奥格瑞玛
    .zoneskip Durotar
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #softcore
    #completewith FoundtheCure
    .goto Orgrimmar,53.03,48.78
    .subzone 2437 >> 进入怒焰裂谷
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #softcore
    #completewith FoundtheCure
    .goto Durotar,47.05,17.58
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #hardcore
    #completewith FoundtheCure
    .zone Durotar >> 离开奥格瑞玛
    .zoneskip Durotar
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #label FoundtheCure
    .goto Durotar,41.54,18.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林纳格|r交谈
    .accept 812 >>接受任务: 救命如救火
    .turnin 812 >>交任务: 救命如救火
    .target 林纳格
step << Warrior
    #xprate <1.5 << !Hunter
    .goto Durotar,42.01,24.33,90,0
    .goto Durotar,39.18,31.65
    >>跳下进入雷霆山，击杀|cRXP_ENEMY_闪电蜥蜴|r并拾取它们的|cRXP_ENEMY_鳞片|r
    .complete 1498,1 --Singed Scale (5)
    .mob 闪电蜥蜴
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    .goto Durotar,34.80,32.84,50,0 << !Warrior
    .goto Durotar,34.81,37.02,50,0 << !Warrior
    .goto Durotar,34.44,44.53,50,0
    .goto Durotar,34.27,47.02,50,0
    .goto Durotar,34.71,42.30
    >>沿河向南前往 [前沿哨所]
    >>击杀途中出现的|cRXP_ENEMY_巨齿鳄鱼|r，拾取|cRXP_LOOT_克鲁恩的护身符|r
    >>|cRXP_WARN_若掉落不佳，跳过并放弃此任务|r
    .complete 816,1 --Kron's Amulet (1)
    .mob 巨齿鳄鱼
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    .goto Durotar,43.11,30.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莎·托克伦|r交谈
    .turnin 816 >>交任务: 丢失的孩子
    .target 米莎·托克伦
    .isQuestComplete 816
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #label FarWatchPost
    .goto The Barrens,62.26,19.38,40 >> 前往 [前沿哨所]
    .zoneskip The Barrens
step << Hunter
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡加尔·战痕|r交谈
    .turnin 840 >>交任务: 部落的新兵
    .accept 842 >>接受任务: 十字路口征兵
    .target 卡加尔·战痕
step << Hunter
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡加尔·战痕|r 交谈
    .accept 842 >> 接任务：十字路口征兵
    .target 卡加尔·战痕
    .isQuestTurnedIn 840
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    #label Akzeloth
    .goto The Barrens,62.34,20.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
    .turnin 809 >>交任务: 雅克塞罗斯
    .accept 924 >>接受任务: 恶魔之种
    .target 雅克塞罗斯
    .isQuestTurnedIn 829
step << Warrior/Shaman/Hunter
    #xprate <1.5 << !Hunter
    .goto The Barrens,62.34,20.03
    >>|cRXP_WARN_拾取|r |T134095:0|t[有瑕疵的能量石]|cRXP_WARN_，它就在|r|cRXP_FRIENDLY_雅克塞罗斯|r|cRXP_WARN_旁边。该物品有30分钟计时限制，请抓紧|r
    .turnin 926 >>交任务: 有瑕疵的能量石
    .isOnQuest 924
step << Warrior
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1498 >>交任务: 防御之道
    .accept 1502 >>接受任务: 索恩格瑞姆·火眼
    .target 犹塞克
step << Mage
    #xprate >1.49
    #season 2
    #loop
    .goto Durotar,52.93,9.01,0
    .goto Durotar,54.96,9.69,30,0
    .goto Durotar,54.69,8.73,30,0
    .goto Durotar,53.78,9.14,30,0
    .goto Durotar,52.93,9.01,30,0
    >>击杀骷髅石洞内的|cRXP_ENEMY_火刃兽人|r，拾取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN|r]
    .collect 203752,1 --Spell Notes: MILEGIN VALF (1)
    .mob 火刃狂热者
    .mob 火刃学徒
    .train 401768,1
step << Mage
    #optional
    #completewith ZeptoUC1
    #xprate >1.49
    #season 2
    .collect 211779,1 >>若持有 |T135933:0|t[理解魔符]，现在可解读笔记；否则先继续路线，稍后在奥格瑞玛向施法材料商购买。
    .train 401768 >>|cRXP_WARN_使用 |r|T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN|r] |cRXP_WARN_学习|r |T135820:0|t[活体烈焰]
    .use 203752
    .itemcount 203752,1
    .train 401768,1
step << Mage
    #season 2
    #optional
    #completewith FingersOfFrostSupplies
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 进入奥格瑞玛，向试剂商购买理解魔符以解读笔记
    .zoneskip Orgrimmar
    .itemcount 203753,1
    .train 401765,1
    .money <0.075
step << Mage
    #season 2
    #optional
    #label FingersOfFrostSupplies
    .goto Orgrimmar,45.60,56.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍苏斯|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401765 >> 使用 [法术笔记：IGBHNHZNAI] 学习 [寒冰指]
    .use 203753
    .target 霍苏斯
    .itemcount 203753,1
    .train 401765,1
    .money <0.075
step << Mage
    #season 2
    #optional
    #completewith LivingFlameSupplies
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 进入奥格瑞玛，向试剂商购买理解魔符以解读笔记
    .zoneskip Orgrimmar
    .itemcount 203752,1
    .train 401768,1
    .money <0.075
step << Mage
    #season 2
    #optional
    #label LivingFlameSupplies
    .goto Orgrimmar,45.60,56.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍苏斯|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401768 >> 使用 [法术笔记：IULAOYIHTEN] 学习 [活体烈焰]
    .use 203752
    .target 霍苏斯
    .itemcount 203752,1
    .train 401768,1
    .money <0.075
step << Rogue/Mage/Priest/Warlock
    #label ZeptoUC1
    .goto Durotar,50.8,13.8,40 >>上飞艇塔
    .zone Tirisfal Glades >>乘坐飞艇前往提瑞斯法林地
    >>|cRXP_WARN_等待期间施放[造水术]|r << Mage
    .zoneskip Tirisfal Glades
step
    #optional
    .abandon 816 >>放弃任务[丢失的孩子]
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
<< Horde
#xprate <1.99
#name 10-12 Tirisfal
#version 11
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Troll Rogue/Orc Rogue/Orc Warlock/Troll Mage/Troll Priest
#next 12-14 Silverpine Forest << Undead/Troll Rogue/Orc Rogue/Orc Warlock/Troll Mage/Troll Priest
#displayname 10-12 提瑞斯法林地
step << Orc Rogue/Troll Rogue
    #completewith Swordtraining1
    .goto Tirisfal Glades,61.80,65.06,20,0
    .zone Undercity >> 进入幽暗城
    .zoneskip Undercity
    .money <0.3023
step << Orc Rogue/Troll Rogue
    #completewith Swordtraining1
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘坐升降梯下到幽暗城
    .money <0.3023
step << Orc Rogue/Troll Rogue
    .goto Undercity,63.25,48.56
    .fp Undercity >> 开启幽暗城的飞行点
    .target 迈克尔·加勒特
    .money <0.3023
step << Orc Rogue/Troll Rogue
    #label Swordtraining1
    .goto Undercity,57.29,32.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与军事区的|cRXP_FRIENDLY_阿基巴德|r交谈
    .train 201 >>学习单手剑（1h）
    .target 阿基巴德
    .money <0.3023
step << Orc Rogue/Troll Rogue
    #ssf
    #optional
    #label RogueCutlass1
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    .collect 851,1,435,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 刘易斯·瓦伦
    .zoneskip Undercity,1
step << Orc Rogue/Troll Rogue
    #ah
    #optional
    #label RogueCutlass1
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 851,1,435,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 刘易斯·瓦伦
    .zoneskip Undercity,1
step << Orc Rogue/Troll Rogue
    #optional
    #completewith KillDevlin
    +|cRXP_WARN_装备|r |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Orc Rogue/Troll Rogue
    #optional
    #ah
    .goto Undercity,64.20,49.60
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师雷克尔|r交谈
    >>|cRXP_BUY_购买六个|r |T134339:0|t[变色的狼心] |cRXP_BUY_（拍卖行有售）|r
    >>|cRXP_WARN_可跳过，仅节省少量时间|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .target 拍卖师雷克尔
    .zoneskip Undercity,1
step << skip --Orc Rogue/Troll Rogue
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_在魔法区进行登出跳点：把角色站在最低一层楼梯的最高处，调整到看起来像悬浮在空中，然后登出并重新登录|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >> |cRXP_WARN_点击此处观看示范|r
    >>|cRXP_WARN_如果无法完成登出跳过操作，就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
step
    #completewith next
    .zone Tirisfal Glades >>离开幽暗城
    .zoneskip Undercity,1
step
    #completewith DeliverytoSPF
    .goto Tirisfal Glades,61.52,53.20,80 >> 前往布瑞尔
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_库勒曼·法席恩|r和|cRXP_FRIENDLY_格莉丝·戴玛|r交谈
    >>|cRXP_FRIENDLY_格莉丝|r|cRXP_WARN_在二楼|r
    .accept 354 >>接受任务: 阿加曼德家族
    .accept 362 >>接受任务: 闹鬼的磨坊
    .target +库勒曼·法席恩
    .goto Tirisfal Glades,61.72,52.29
    .accept 375 >>接受任务: 死亡之寒
    .target +格莉丝·戴玛
    .goto Tirisfal Glades,61.89,52.73
    .maxlevel 11 << !Warrior !Warlock
    .maxlevel 12 << Warlock
    .maxlevel 13 << Warrior
step << Warrior
    #optional
    .abandon 1505 >>放弃任务[老兵犹塞克]
    .isOnQuest 1505
step << Warrior
    #optional
    .abandon 1498 >>放弃任务[防御之道]
    .isOnQuest 1498
step << Warrior
    .goto Tirisfal Glades,61.85,52.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .accept 1818 >> 接任务：迪林格尔
    .target 奥斯蒂尔·德·蒙
    .isQuestAvailable 1498
step << Warlock
    .goto Tirisfal Glades,61.62,52.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅馆内的 |cRXP_FRIENDLY_埃格隆·卡加尔|r 交谈
    .accept 1478 >> 接任务：哈加尔的召唤
    .target 埃格隆·卡加尔
    .isQuestAvailable 1504
step << Undead Rogue
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_马里恩·考尔|r交谈
    .accept 1885 >>接受任务: 米奈特·卡加德
    .target 马里恩·考尔
step << Rogue
    #season 2
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店二楼的 |cRXP_FRIENDLY_马里恩·考尔|r 交谈
    .train 1784 >> 学习 |T132320:0|t[潜行]
    .train 921 >> 学习 |T133644:0|t[搜索]，稍后用于取得毁伤符文的前置物品
    .target 马里恩·考尔
    .train 400094,1
step << Mage
    .goto Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅馆内的 |cRXP_FRIENDLY_凯恩|r 交谈
    .accept 1881 >> 接任务：安娜斯塔西娅
    .target 凯恩·火歌
step << !Mage
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_。|r << Mage/Priest/Shaman
    >>|cRXP_BUY_向她购买|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_|r <<Warrior/Rogue
    >>|cRXP_BUY_向她购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_。|r << Warlock
    .vendor >> 出售杂物
    .collect 1179,20,367,1 << Mage/Priest/Shaman --Ice Cold Milk (20)
    .collect 4605,20,367,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,367,1 << Warlock --Ice Cold Milk (15)
    .collect 4605,15,367,1 << Warlock --Red-speckled Mushroom (15)
    .money <0.075 << Warlock
    .money <0.05 << !Warlock
    .target 旅店老板瑞尼
step
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温特斯夫人|r交谈
    >>|cRXP_BUY_购买一个或多个|r |T133634:0|t[棕色小包]|cRXP_BUY_（卖家是|r|cRXP_FRIENDLY_温特斯夫人）|r
    .collect 4496,1,398,1 --Small Brown Pouch (1)
    .target 温特斯夫人
    .money <0.05
step
    #season 0,1
    .goto Tirisfal Glades,60.59,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .accept 427 >>接受任务: 与血色十字军的战争
    .target 执行官塞加德
    .maxlevel 10 << !Warlock
    .maxlevel 11 << Warlock
step
    #season 2
    .goto Tirisfal Glades,60.59,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .accept 427 >>接受任务: 与血色十字军的战争
    .target 执行官塞加德
    .maxlevel 10 << !Warlock !Rogue
    .maxlevel 11 << Warlock
    .train 400095,1 << Rogue
step << Rogue
    #season 2
    #optional
    .goto Tirisfal Glades,60.59,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .accept 427 >>接受任务: 与血色十字军的战争
    .target 执行官塞加德
    .maxlevel 10
step
    #season 0,1
    .goto Tirisfal Glades,60.74,51.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击|cRXP_PICK_通缉告示|r
    .accept 398 >>接受任务: 悬赏：蛆眼
    .maxlevel 11 << !Warrior !Warlock
    .maxlevel 12 << Warlock
    .maxlevel 13 << Warrior
step
    #season 2
    .goto Tirisfal Glades,60.74,51.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击|cRXP_PICK_通缉告示|r
    .accept 398 >>接受任务: 悬赏：蛆眼
    .maxlevel 11 << !Warrior !Warlock !Rogue
    .maxlevel 12 << Warlock/Rogue
    .maxlevel 13 << Warrior
    .train 400095,1 << Rogue
step
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .accept 358 >>接受任务: 盗墓贼
    .target 执政官塞弗伦
    .maxlevel 10
step
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .accept 445 >>接受任务: 给银松森林送信
    .accept 367 >>接受任务: 新的瘟疫
    .target 药剂师乔汉
    .maxlevel 10 << !Warlock
    .maxlevel 11 << Warlock
step
    #label DeliverytoSPF
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .accept 445 >>接受任务: 给银松森林送信
    .target 药剂师乔汉
step
    .goto Tirisfal Glades,58.20,51.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈
    .accept 404 >>接受任务: 腐烂的爪子
    .target 亡灵卫兵迪林格尔
    .maxlevel 10 << !Warlock
    .maxlevel 11 << Warlock
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈
    .turnin 1818 >> 交任务：迪林格尔
    .accept 1819 >> 接任务：切割者奥拉格
    .target 亡灵卫兵迪林格尔
    .isQuestAvailable 1498
step << Warrior
    .goto Tirisfal Glades,59.16,48.51
    >>|cRXP_WARN_点击地上的|r|cRXP_WARN_陵墓触发器|r。|cRXP_WARN_这样会召唤出|r|cRXP_ENEMY_切割者奥拉格|r。|cRXP_WARN_将其击杀|r
    .complete 1819,1 --Ulag the Cleaver (1)
    .mob 切割者奥拉格
    .isQuestAvailable 1498
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈
    .turnin 1819 >> 交任务：切割者奥拉格
    .accept 1820 >> 接任务：库勒曼
    .target 亡灵卫兵迪林格尔
    .isQuestAvailable 1498
step
    #optional
    #completewith Pumpkins
    >>击杀你看到的任何|cRXP_ENEMY_黑暗犬|r，拾取|cRXP_LOOT_黑暗犬的血液|r
    >>|cRXP_WARN_你会获得|r |T133849:0|t[沉睡之砂]|cRXP_WARN_（此任务的后续奖励）|r
    .complete 367,1 --Darkhound Blood (5)
    .mob 衰老的黑暗犬
    .mob 被诅咒的黑暗犬
    .isOnQuest 367
step
    #optional
    #label Claws
    #loop
    .goto Tirisfal Glades,52.63,56.98,0
    .goto Tirisfal Glades,54.95,50.53,50,0
    .goto Tirisfal Glades,53.35,50.29,50,0
    .goto Tirisfal Glades,52.12,50.38,50,0
    .goto Tirisfal Glades,51.28,51.63,50,0
    .goto Tirisfal Glades,52.03,53.74,50,0
    .goto Tirisfal Glades,52.29,56.72,50,0
    .goto Tirisfal Glades,53.95,56.53,50,0
    .goto Tirisfal Glades,53.55,58.25,50,0
    .goto Tirisfal Glades,52.63,56.98,50,0
    >>击杀|cRXP_ENEMY_腐烂的死者|r和|cRXP_ENEMY_破碎的尸体|r，拾取|cRXP_LOOT_腐烂的爪子|r
    .complete 404,1 --Putrid Claw (7)
    .mob 腐烂的死者
    .mob 破碎的尸体
    .isOnQuest 404
step
    #optional
    #completewith Pumpkins
    >>击杀你看到的任何|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_夜行蝙蝠的毛皮|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .isOnQuest 375
step
    #optional
    #label Pumpkins
    .goto Tirisfal Glades,40.91,54.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希米尔|r交谈
    .accept 365 >>接受任务: 悲伤之地
    .target 亡灵卫兵希米尔
    .maxlevel 10 << !Warlock
    .maxlevel 11 << Warlock
step << Rogue
    #season 2
    #optional
    .goto Tirisfal Glades,40.91,54.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希米尔|r交谈
    .accept 365 >>接受任务: 悲伤之地
    .target 亡灵卫兵希米尔
    .maxlevel 10
step << Mage
    #season 2
    #completewith next
    .goto Tirisfal Glades,36.72,50.94,0
    .goto Tirisfal Glades,34.78,51.24,0
    >>施放 |T136071:0|t[变形术]，目标为|cRXP_ENEMY_古怪的甜瓜|r
    >>拾取地上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step
    #optional
    #loop
    .goto Tirisfal Glades,36.63,50.09,0
    .goto Tirisfal Glades,37.20,52.17,50,0
    .goto Tirisfal Glades,36.64,50.09,50,0
    .goto Tirisfal Glades,36.10,49.07,50,0
    .goto Tirisfal Glades,35.08,49.82,50,0
    .goto Tirisfal Glades,35.30,50.91,50,0
    .goto Tirisfal Glades,34.57,51.58,50,0
    .goto Tirisfal Glades,36.63,50.09,50,0
    >>拾取田野中的|cRXP_LOOT_提瑞斯法南瓜|r
    .complete 365,1 --Tirisfal Pumpkin (10)
    .isOnQuest 365
step
    #optional
    #loop
    .goto Tirisfal Glades,31.78,51.36,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    .goto Tirisfal Glades,33.65,51.07,50,0
    .goto Tirisfal Glades,31.78,51.36,50,0
    .goto Tirisfal Glades,30.02,50.48,50,0
    .goto Tirisfal Glades,29.91,49.24,50,0
    .goto Tirisfal Glades,30.62,47.53,50,0
    .goto Tirisfal Glades,31.01,46.50,50,0
    .goto Tirisfal Glades,32.15,44.83,50,0
    .goto Tirisfal Glades,33.73,45.29,50,0
    .goto Tirisfal Glades,34.10,47.88,50,0
    .goto Tirisfal Glades,33.73,49.34,50,0
    >>击杀|cRXP_ENEMY_血色战士|r
    .complete 427,1 --Scarlet Warrior (10)
    .mob 血色战士
    .isOnQuest 427
step
    #optional
    #completewith next
    >>击杀你看到的任何|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_夜行蝙蝠的毛皮|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .isOnQuest 375
step
    #optional
    #label Darkhounds1
    #loop
    .goto Tirisfal Glades,50.36,49.51,0
    .goto Tirisfal Glades,45.90,50.95,50,0
    .goto Tirisfal Glades,45.11,48.06,50,0
    .goto Tirisfal Glades,47.07,45.37,50,0
    .goto Tirisfal Glades,50.36,49.51,50,0
    >>击杀你看到的任何|cRXP_ENEMY_黑暗犬|r，拾取|cRXP_LOOT_黑暗犬的血液|r
    .complete 367,1 --Darkhound Blood (5)
    .mob 衰老的黑暗犬
    .mob 被诅咒的黑暗犬
    .isOnQuest 367
step
    #optional
    #softcore
    #completewith ProofofDemiseTurnin
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .isQuestComplete 427
step
    #optional
    #hardcore
    #completewith ProofofDemiseTurnin
    .goto Tirisfal Glades,58.20,51.43,120 >> 返回布瑞尔
    .isQuestComplete 427
step
    #optional
    .goto Tirisfal Glades,58.20,51.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈
    .turnin 404 >>交任务: 腐烂的爪子
    .accept 426 >>接受任务: 磨坊告急
    .isQuestComplete 404
    .target 亡灵卫兵迪林格尔
step
    #optional
    .goto Tirisfal Glades,58.20,51.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈
    .accept 426 >>接受任务: 磨坊告急
    .isQuestTurnedIn 404
    .target 亡灵卫兵迪林格尔
step
    #optional
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .turnin 367 >>交任务: 新的瘟疫
    .accept 368 >>接受任务: 新的瘟疫
    .isQuestComplete 367
    .target 药剂师乔汉
step
    #optional
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .accept 368 >>接受任务: 新的瘟疫
    .isQuestTurnedIn 367
    .target 药剂师乔汉
step
    #optional
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .turnin 365 >> 交任务: 悲伤之地
    .accept 407 >> 接受任务: 悲伤之地
    .isQuestComplete 365
    .target 药剂师乔汉
step
    #optional
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .accept 407 >> 接受任务: 悲伤之地
    .isQuestTurnedIn 365
    .target 药剂师乔汉
step
    #optional
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .turnin 427 >>交任务: 与血色十字军的战争
    .accept 370 >>接受任务: 与血色十字军的战争
    .target 执行官塞加德
    .isQuestComplete 427
step
    #optional
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .accept 370 >>接受任务: 与血色十字军的战争
    .target 执行官塞加德
    .isQuestTurnedIn 427
step
    #optional
    #label ProofofDemiseTurnin
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯吉斯|r交谈
    .accept 374 >>接受任务: 死亡证明
    .target 亡灵卫兵伯吉斯
    .isQuestTurnedIn 427
step << Warlock/Mage
    #completewith UCflightpath1
    .goto Tirisfal Glades,61.80,65.06,20,0
    .zone Undercity >> 进入幽暗城
    .zoneskip Undercity
step << Warlock/Mage
    #completewith UCflightpath1
    .goto Undercity,66.09,20.06,35,0
    .goto Undercity,64.37,23.94,35,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘坐升降梯下到幽暗城
step << Warlock/Mage
    #label UCflightpath1
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔|r交谈
    .fp Undercity >> 开启幽暗城的飞行点
    .target 迈克尔·加勒特
step << Warlock/Mage
    #optional
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师雷克尔|r交谈
    >>|cRXP_BUY_购买六个|r |T134339:0|t[变色的狼心] |cRXP_BUY_（拍卖行有售）|r
    >>|cRXP_WARN_可跳过，仅节省少量时间|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .target 拍卖师雷克尔
    .zoneskip Undercity,1
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的 |cRXP_FRIENDLY_凯伦丁·哈加尔|r 对话
    .turnin 1478 >> 交任务：哈加尔的召唤
    .accept 1473 >> 接任务：虚空中的生物
    .isQuestAvailable 1504
step << Mage
    #optional
    .abandon 1883 >> 放弃任务: [安苏瓦], 否则接不到后面的任务
    .isOnQuest 1883
step << Mage
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1881 >> 交任务：安娜斯塔西娅
    .accept 1882 >> 接任务：巴尼尔农场
    .target 安娜斯塔西娅·哈特威尔
step << Undead Priest
    #completewith TouchofWeakness
    .goto Tirisfal Glades,61.80,65.06,20,0
    .zone Undercity >> 进入幽暗城
    .zoneskip Undercity
step << Undead Priest
    #completewith TouchofWeakness
    .goto Undercity,66.09,20.06,35,0
    .goto Undercity,64.37,23.94,35,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘坐升降梯下到幽暗城
step << Undead Priest
    #optional
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师雷克尔|r交谈
    >>|cRXP_BUY_购买六个|r |T134339:0|t[变色的狼心] |cRXP_BUY_（拍卖行有售）|r
    >>|cRXP_WARN_可跳过，仅节省少量时间|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .target 拍卖师雷克尔
    .zoneskip Undercity,1
step << Undead Priest
    #optional
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r 对话
    .turnin 5660 >> 交任务：虚弱之触
    .target 艾萨莱斯特
    .isOnQuest 5660
step << Undead Priest
    #label TouchofWeakness
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r 对话
    .accept 5658 >> 接受任务：虚弱之触
    .turnin 5658 >> 交任务：虚弱之触
    .target 艾萨莱斯特
step << Rogue
    #completewith Swordtraining2
    .goto Tirisfal Glades,61.80,65.06,20,0
    .zone Undercity >> 进入幽暗城
    .zoneskip Undercity
    .money <0.3023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    #completewith Swordtraining2
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘坐升降梯下到幽暗城
    .money <0.3023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    .goto Undercity,63.25,48.56
    .fp Undercity >> 开启幽暗城的飞行点
    .target 迈克尔·加勒特
    .money <0.3023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Orc Rogue/Troll Rogue
    #ssf
    #optional
    #label RogueCutlass2
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    .collect 851,1,354,1 --Collect Cutlass (1)
    .money <0.3023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 刘易斯·瓦伦
    .zoneskip Undercity,1
step << Orc Rogue/Troll Rogue
    #ah
    #optional
    #label RogueCutlass2
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 851,1,354,1 --Collect Cutlass (1)
    .money <0.3023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 刘易斯·瓦伦
    .zoneskip Undercity,1
step << Undead Rogue
    .goto Undercity,83.52,69.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈
    .turnin 1885 >>交任务: 米奈特·卡加德
    .accept 1886 >>接受任务: 亡灵哨兵
    .target 米奈特·卡加德
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .zoneskip Undercity,1
step << Rogue
    #label Swordtraining2
    .goto Undercity,57.29,32.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与军事区的|cRXP_FRIENDLY_阿基巴德|r交谈
    .train 201 >>学习单手剑（1h）
    .target 阿基巴德
    .money <0.1
    .zoneskip Undercity,1
step << Rogue
    #optional
    #completewith KillDevlin
    +|cRXP_WARN_装备|r |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    #optional
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师雷克尔|r交谈
    >>|cRXP_BUY_购买六个|r |T134339:0|t[变色的狼心] |cRXP_BUY_（拍卖行有售）|r
    >>|cRXP_WARN_可跳过，仅节省少量时间|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .target 拍卖师雷克尔
    .zoneskip Undercity,1
step << Warlock/Mage/Rogue
    #optional
    .goto Undercity,47.25,39.12,50,0
    .goto Undercity,46.35,43.86,10,0
    .goto Undercity,45.24,39.35,10,0
    .goto Undercity,41.32,38.40,10,0
    .goto Undercity,40.74,33.95,10,0
    .goto Undercity,34.80,33.19,15,0
    .goto Undercity,27.39,30.23,35,0
    .goto Undercity,21.89,43.35,35,0
    .goto Tirisfal Glades,51.10,71.53,50,0
    .zone Tirisfal Glades >> 从幽暗城下水道离开
    .zoneskip Tirisfal Glades
step << Undead Priest
    #optional
    .goto Undercity,47.25,39.12,50,0
    .goto Undercity,46.35,43.86,10,0
    .goto Undercity,45.24,39.35,10,0
    .goto Undercity,41.32,38.40,10,0
    .goto Undercity,40.74,33.95,10,0
    .goto Undercity,34.80,33.19,15,0
    .goto Undercity,27.39,30.23,35,0
    .goto Undercity,21.89,43.35,35,0
    .goto Tirisfal Glades,51.10,71.53,50,0
    .zone Tirisfal Glades >> 从幽暗城下水道离开
    .zoneskip Tirisfal Glades
step
    #optional
    #completewith ScarletCrusade1
    >>收集|cRXP_LOOT_血色十字军徽记之戒|r
    >>|cRXP_WARN_此步骤现在不必完成|r
    .complete 374,1 --Scarlet Insignia Ring (10)
    .isOnQuest 374
step << Warlock
    #optional
    #completewith next
    .goto Tirisfal Glades,51.06,67.57
    >>打开地上的|cRXP_PICK_派瑞恩的箱子|r，拾取 |T133733:0|t[埃加林的魔典]
    .complete 1473,1 --Egalin's Grimoire (1)
    .isQuestAvailable 1504
step << Rogue
    #season 2
    .goto Tirisfal Glades,51.60,67.60
    >>在击杀 |cRXP_ENEMY_派瑞恩队长|r 前，先进入 |T132320:0|t[潜行]，对他使用 |T133644:0|t[搜索]，取得 |T133385:0|t[|cRXP_LOOT_血色军官玺戒|r]
    .collect 208085,1
    .target 派瑞恩队长
    .train 400094,1
    .itemcount 208086,<1
    .itemcount 203990,<1
step
    #optional
    #label ScarletCrusade1
    #loop
	.goto Tirisfal Glades,51.03,69.55,0
	.goto Tirisfal Glades,50.07,68.87,40,0
	.goto Tirisfal Glades,50.23,66.94,40,0
	.goto Tirisfal Glades,51.16,65.73,40,0
	.goto Tirisfal Glades,51.75,66.04,40,0
	.goto Tirisfal Glades,52.93,67.62,40,0
	.goto Tirisfal Glades,52.72,69.33,40,0
	.goto Tirisfal Glades,51.96,69.57,40,0
	.goto Tirisfal Glades,51.03,69.55,40,0
    >>击杀|cRXP_ENEMY_派瑞恩队长|r、|cRXP_ENEMY_血色狂热者|r和|cRXP_ENEMY_血色传教士|r
    .complete 370,1 --Captain Perrine (1)
    .mob +派瑞恩队长
    .complete 370,2 --Scarlet Zealot (3)
    .mob +血色狂热者
    .complete 370,3 --Scarlet Missionary (3)
    .mob +血色传教士
    .isOnQuest 370
step << Warlock
    .goto Tirisfal Glades,51.06,67.57
    >>打开地上的|cRXP_PICK_派瑞恩的箱子|r，拾取 |T133733:0|t[埃加林的魔典]
    .complete 1473,1 --Egalin's Grimoire (1)
    .isQuestAvailable 1504
step << Warlock
    #completewith next
    .goto Undercity,16.51,42.76,35,0
    .goto Undercity,22.98,39.76,35,0
    .goto Undercity,24.93,32.54,35,0
    .goto Undercity,34.78,33.24,10,0
    .goto Undercity,40.83,34.08,10,0
    .goto Undercity,41.35,38.40,10,0
    .goto Undercity,45.25,39.20,10,0
    .goto Undercity,45.67,43.60,10,0
    .zone Undercity >> 经下水道返回幽暗城
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的 |cRXP_FRIENDLY_凯伦丁·哈加尔|r 对话
    .turnin 1473 >> 交任务：虚空中的生物
    .accept 1471 >> 接任务：誓缚
    .target 凯伦丁·哈加尔
    .isQuestAvailable 1504
step << Warlock
    #completewith next
    .goto Undercity,86.64,27.10
    .cast 9221 >>|cRXP_WARN_使用|r |T134416:0|t[召唤符文]|cRXP_WARN_（在召唤法阵处）|r
    .use 6284
step << Warlock
    .goto Undercity,86.64,27.10
    >>击杀召唤出的|cRXP_ENEMY_虚空行者|r
    .complete 1471,1 --Kill Summoned Voidwalker (1)
    .mob 虚空行者
    .use 6284
    .isQuestAvailable 1504
step << Warlock
    .goto Undercity,85.04,25.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_凯伦丁·哈加尔|r交谈
    .turnin 1471 >>交任务：誓缚
    .target 凯伦丁·哈加尔
    .isQuestAvailable 1504
step << skip --Warlock
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_进行登出跳点：把角色站在最低一层楼梯的最高处，调整到看起来像悬浮在空中，然后登出并重新登录|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >> |cRXP_WARN_点击此处观看示范|r
    >>|cRXP_WARN_如果无法完成登出跳过操作，就正常从幽暗城跑出去|r
    .zoneskip Undercity,1
step << Warlock
    #completewith next
    .goto Tirisfal Glades,61.92,64.85,50,0
    .zone Tirisfal Glades >> 离开幽暗城
    .zoneskip Tirisfal Glades
step
    #optional
    #completewith next
    >>击杀你看到的任何|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_夜行蝙蝠的毛皮|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .isOnQuest 375
step
    #optional
    .goto Tirisfal Glades,47.60,44.03,150 >> 向西北前往 [阿加曼德磨坊]
    .isOnQuest 362
step
    #optional
    #completewith ThurmanGregor
    >>|T134939:0|t[|cRXP_LOOT_萨尔曼的信件|r] |cRXP_WARN_可能由这些怪物掉落；若获得，请接取对应任务|r
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >> 接任务：未寄出的信件
    .use 2839
step
    #completewith ThurmanGregor
    >>击杀|cRXP_ENEMY_断骨士兵和碎颅士兵|r和|cRXP_ENEMY_暗眼骷髅法师|r，拾取|cRXP_LOOT_锯齿肋骨|r和|cRXP_LOOT_焦黑的颅骨|r
    .complete 426,1 --Notched Rib (5)
    .mob +断骨士兵
    .mob +碎颅士兵
    .complete 426,2 --Blackened Skull (3)
    .mob +暗眼骷髅法师
    .isOnQuest 426
step
    #optional
    #label KillDevlin
    .goto Tirisfal Glades,47.34,40.78
    >>击杀|cRXP_ENEMY_代弗林|r，获取|cRXP_LOOT_代弗林的遗骸|r
    .complete 362,1 --Devlin's Remains (1)
    .mob 代弗林·阿加曼德
    .isOnQuest 362
step
    #optional
    .goto Tirisfal Glades,49.34,36.02
    >>击杀|cRXP_ENEMY_妮萨|r，拾取|cRXP_LOOT_妮萨的残骸|r。她可能在建筑物内
    .complete 354,2 --Nissa's Remains (1)
    .mob 妮萨·阿加曼德
    .isOnQuest 354
step
    #optional
    #label ThurmanGregor
    #loop
    .goto Tirisfal Glades,45.08,31.15,0
    .goto Tirisfal Glades,43.71,35.25,60,0
    .goto Tirisfal Glades,45.03,30.99,60,0
    .goto Tirisfal Glades,46.79,29.80,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,45.08,31.15,60,0
    >>击杀|cRXP_ENEMY_萨尔曼·阿加曼德|r和|cRXP_ENEMY_格里高·阿加曼德|r，拾取掉落的|cRXP_LOOT_萨尔曼的遗骸和格里高的遗骸|r。他们可能在附近巡逻
    .complete 354,3 --Thurman's Remains (1)
    .unitscan +萨尔曼·阿加曼德
    .complete 354,1 --Gregor's Remains (1)
    .unitscan +格里高·阿加曼德
    .isOnQuest 354
step
    #loop
    #label MillsOverun
    .goto Tirisfal Glades,45.08,31.15,0
    .goto Tirisfal Glades,43.71,35.25,60,0
    .goto Tirisfal Glades,45.03,30.99,60,0
    .goto Tirisfal Glades,46.79,29.80,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,45.08,31.15,60,0
    >>击杀|cRXP_ENEMY_断骨士兵和碎颅士兵|r和|cRXP_ENEMY_暗眼骷髅法师|r，拾取|cRXP_LOOT_锯齿肋骨|r和|cRXP_LOOT_焦黑的颅骨|r
    .complete 426,1 --Notched Rib (5)
    .mob +断骨士兵
    .mob +碎颅士兵
    .complete 426,2 --Blackened Skull (3)
    .mob +暗眼骷髅法师
    .isOnQuest 426
step
    #requires MillsOverun
    #optional
    #completewith MaggotEye
    .goto Tirisfal Glades,54.32,31.56,15,0
    .goto Tirisfal Glades,54.78,32.75,15,0
    .goto Tirisfal Glades,55.84,32.28,15,0
    .goto Tirisfal Glades,56.55,32.43,40,0
    .goto Tirisfal Glades,57.77,31.69,50 >> 沿山坡向下走
    >>|cRXP_WARN_当心。不要承受太多的坠落伤害。为了安全起见，请跟随导航点移动|r
    .isQuestComplete 354
step
    #optional
    #requires MillsOverun
    #completewith next
    >>击杀|cRXP_ENEMY_腐皮豺狼人|r和|cRXP_ENEMY_混血腐皮豺狼人|r，拾取|cRXP_LOOT_防腐剂|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .mob 腐皮豺狼人
    .mob 混血腐皮豺狼人
    .isOnQuest 358
step
    #optional
    #requires MillsOverun
    #label MaggotEye
    .goto Tirisfal Glades,58.66,30.77
    >>击杀|cRXP_ENEMY_蛆眼|r，获取|cRXP_LOOT_蛆眼的爪子|r
    .complete 398,1 --Maggot Eye's Paw (1)
    .mob 蛆眼
step
    #optional
    #loop
    .goto Tirisfal Glades,59.54,27.86,0
    .goto Tirisfal Glades,59.38,29.05,50,0
    .goto Tirisfal Glades,59.54,27.86,50,0
    .goto Tirisfal Glades,60.64,28.66,50,0
    .goto Tirisfal Glades,61.49,29.40,50,0
    .goto Tirisfal Glades,62.96,29.46,50,0
    .goto Tirisfal Glades,65.68,30.22,50,0
    .goto Tirisfal Glades,67.48,28.97,50,0
    .goto Tirisfal Glades,68.22,26.46,50,0
    .goto Tirisfal Glades,59.54,27.86,50,0
    >>击杀|cRXP_ENEMY_鱼人|r，拾取|cRXP_LOOT_邪鳍鱼人的鳞片|r
    .complete 368,1 --Vile Fin Scale (5)
    .mob 邪鳍污水鱼人
    .mob 邪鳍先知
    .mob 邪鳍泥浆鱼人
    .isOnQuest 368
step
    #optional
    #completewith RotHideGnolls
    >>击杀你看到的任何|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_夜行蝙蝠的毛皮|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .isOnQuest 375
step << Mage
    #season 2
    #optional
    #completewith RotHideGnolls
    .goto Tirisfal Glades,59.84,33.17,0
    .goto Tirisfal Glades,58.38,35.28,0
    .goto Tirisfal Glades,60.09,37.01,0
    >>施放 |T136071:0|t[变形术]，目标为|cRXP_ENEMY_古怪的甜瓜|r
    >>拾取地上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step
    #optional
    #label RotHideGnolls
    #loop
    .goto Tirisfal Glades,55.24,42.54,0
    .goto Tirisfal Glades,56.31,39.67,40,0
    .goto Tirisfal Glades,54.71,41.19,40,0
    .goto Tirisfal Glades,53.90,43.93,40,0
    .goto Tirisfal Glades,55.24,42.54,40,0
    .goto Tirisfal Glades,56.43,43.92,40,0
    .goto Tirisfal Glades,55.24,42.54,40,0
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r和|cRXP_ENEMY_腐皮盗墓贼|r，拾取掉落的|cRXP_LOOT_防腐剂|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,1 --Rot Hide Graverobber (8)
    .complete 358,3 --Embalming Ichor (8)
    .mob 混血腐皮豺狼人
    .mob 腐皮盗墓贼
    .isOnQuest 358
step
    #optional
    #softcore
    #completewith MillsTurnin
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #optional
    #hardcore
    #completewith MillsTurnin
    .subzone 159 >> 前往布瑞尔
step
    #optional
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵迪林格尔|r交谈
    .turnin 426 >>交任务: 磨坊告急
    .target 亡灵卫兵迪林格尔
    .isQuestComplete 426
step
    #optional
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .turnin 368 >>交任务: 新的瘟疫
    .accept 369 >>接受任务: 新的瘟疫
    .target 药剂师乔汉
    .isQuestComplete 368
step
    #optional
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .accept 369 >>接受任务: 新的瘟疫
    .target 药剂师乔汉
    .isQuestTurnedIn 368
step
    #optional
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .turnin 398 >>交任务: 悬赏：蛆眼
    .turnin 370 >>交任务: 与血色十字军的战争
    .accept 371 >>接受任务: 与血色十字军的战争
    .target 执行官塞加德
    .isQuestComplete 370
step << Rogue
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    .use 208085 >>使用 |T133385:0|t[|cRXP_LOOT_血色军官玺戒|r]制作 |T134328:0|t[|cRXP_LOOT_伪造的血色备忘录|r]
    .collect 208086,1 --Forged Scarlet Memorandum (1)
    .train 400094,1
step << Rogue
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加米尔·诺瑞|r交谈，获得 |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    .collect 203990,1 --Rune of Mutilation (1)
    .target 加米尔·诺瑞
    .skipgossip
    .train 400094,1
step << Rogue
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]|cRXP_WARN_学习|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
step
    #optional
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .turnin 398 >>交任务: 悬赏：蛆眼
    .accept 371 >>接受任务: 与血色十字军的战争
    .target 执行官塞加德
    .isQuestTurnedIn 370
step
    #optional
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .turnin 398 >>交任务: 悬赏：蛆眼
    .target 执行官塞加德
    .isQuestComplete 398
step
    #optional
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .turnin 358 >>交任务: 盗墓贼
    .accept 359 >>接受任务: 亡灵卫兵的职责
    .target 执政官塞弗伦
    .isQuestComplete 358
step
    #optional
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .accept 359 >>接受任务: 亡灵卫兵的职责
    .target 执政官塞弗伦
    .isQuestTurnedIn 358
step
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔·沙伊尔|r交谈
    >>|cRXP_BUY_购买一根|r |T132891:0|t[粗线]|cRXP_BUY_（卖家是|r|cRXP_FRIENDLY_阿比盖尔·沙伊尔）|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5
    .isOnQuest 375
step
    #optional
    .goto Tirisfal Glades,61.58,52.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊维特|r交谈
    .turnin 361 >>交任务: 未寄出的信件
    .target 伊维特·法席恩
    .isOnQuest 361
step
    #optional
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼·法席恩|r交谈
    .turnin 354 >>交任务: 阿加曼德家族
    .turnin 362 >>交任务: 闹鬼的磨坊
    .accept 355 >>接受任务: 与塞弗伦交谈
    .target 库勒曼·法席恩
    .isQuestComplete 354
step
    #optional
    #label MillsTurnin
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼·法席恩|r交谈
    .turnin 354 >>交任务: 阿加曼德家族
    .turnin 362 >>交任务: 闹鬼的磨坊
    .accept 355 >>接受任务: 与塞弗伦交谈
    .target 库勒曼·法席恩
    .isQuestComplete 362
step
    #optional
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼·法席恩|r交谈
    .accept 355 >>接受任务: 与塞弗伦交谈
    .target 库勒曼·法席恩
    .isQuestTurnedIn 354
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库勒曼·法席恩|r交谈
    .turnin 1820 >>交任务: 库勒曼 << Warrior
    .accept 1821 >>接受任务: 阿加曼德家传武器 << Warrior
    .accept 355 >>接受任务: 与塞弗伦交谈
    .target 库勒曼·法席恩
    .isQuestTurnedIn 1819
step
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店二楼的|cRXP_FRIENDLY_格莉丝·戴玛|r交谈
    .turnin 375 >>交任务: 死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
	.train 588 >>学习 |T135926:0|t[心灵之火]
    .target 黑暗牧师贝里尔
    .xp <12,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 145 >> 学习|T135812:0|t[火球术（等级3）]
    .target 凯恩·火歌
    .xp <12,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 7384 >>学习 |T132223:0|t[压制]
    .target 奥斯蒂尔·德·蒙
    .xp <12,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在二楼与 |cRXP_FRIENDLY_马里恩|r 对话
    .train 1766 >> 学习|T132219:0|t[脚踢]
    .target 马里恩·考尔
    .xp <12,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特·鲍什|r 对话
    .train 755 >> 学习|T136168:0|t[生命通道]
    .target 鲁伯特·鲍什
    .xp <12,1
step << !Mage
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_。|r << Mage/Priest/Shaman
    >>|cRXP_BUY_购买|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_（她有售）|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_（她有售）|r << Warlock/Hunter
    .vendor >> 出售杂物
    .collect 1179,20,369,1 << Mage/Priest/Shaman --Ice Cold Milk (20)
    .collect 4605,20,369,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,369,1 << Warlock/Hunter --Ice Cold Milk (15)
    .collect 4605,15,369,1 << Warlock/Hunter --Red-speckled Mushroom (15)
    .money <0.050 << !Warlock !Hunter
    .money <0.075 << Warlock/Hunter
    .target 旅店老板瑞尼
step
    #optional
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵林奈|r交谈
    .turnin 359 >>交任务: 亡灵卫兵的职责
    .accept 360 >>接受任务: 向塞弗伦回报
    .accept 356 >>接受任务: 巡查后方
    .target 亡灵卫兵林奈
    .isQuestTurnedIn 358
    .maxlevel 13 << !Warrior !Warlock !Mage
step
    #optional
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵林奈|r交谈
    .accept 356 >>接受任务: 巡查后方
    .target 亡灵卫兵林奈
    .maxlevel 13 << !Warrior !Warlock !Mage
step
    #optional
    #completewith HorrorsandSpirits
    >>击杀你看到的任何|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_夜行蝙蝠的毛皮|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .isOnQuest 375
step << Mage
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_可怕的血僵尸|r和|cRXP_ENEMY_游荡的幽灵|r
    .complete 356,1 --Bleeding Horror (8)
    .mob +可怕的血僵尸
    .complete 356,2 --Wandering Spirit (8)
    .mob +游荡的幽灵
    .isOnQuest 356
step << Mage
    #season 2
    #completewith HorrorsandSpirits
    >>施放 |T136071:0|t[变形术]，目标为|cRXP_ENEMY_古怪的甜瓜|r
    >>拾取地上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step << Mage
    .goto Tirisfal Glades,77.48,62.00
    >>拾取地面上的任意植物，获得|cRXP_PICK_巴尼尔金鱼草|r
    .complete 1882,1 --Balnir Snapdragons (1)
step
    #optional
    #label HorrorsandSpirits
    #loop
	.goto Tirisfal Glades,74.31,60.98,0
	.goto Tirisfal Glades,74.31,60.98,50,0
	.goto Tirisfal Glades,74.45,59.64,50,0
	.goto Tirisfal Glades,75.08,58.56,50,0
	.goto Tirisfal Glades,76.45,58.67,50,0
	.goto Tirisfal Glades,77.41,58.66,50,0
	.goto Tirisfal Glades,78.55,60.43,50,0
	.goto Tirisfal Glades,77.45,61.46,50,0
	.goto Tirisfal Glades,76.79,62.60,50,0
	.goto Tirisfal Glades,74.99,61.98,50,0
    >>击杀|cRXP_ENEMY_可怕的血僵尸|r和|cRXP_ENEMY_游荡的幽灵|r
    .complete 356,1 --Bleeding Horror (8)
    .mob +可怕的血僵尸
    .complete 356,2 --Wandering Spirit (8)
    .mob +游荡的幽灵
    .isOnQuest 356
step << Mage
    #season 2
    #loop
    .goto Tirisfal Glades,76.51,61.77,0
    .goto Tirisfal Glades,75.12,61.49,20,0
    .goto Tirisfal Glades,76.51,61.77,20,0
    .goto Tirisfal Glades,76.04,59.31,20,0
    >>施放 |T136071:0|t[变形术]，目标为|cRXP_ENEMY_古怪的甜瓜|r
    >>拾取地上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob 古怪的甜瓜
    .train 415942,1
    .train 118,3
step << Mage
    #season 2
    >>使用 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r 制作 |T134332:0|t|cRXP_LOOT_[法术笔记：启迪]|r
    .collect 203749,1 --Spell Notes: Enlightenment (1)
    .use 208183 --Apothecary Notes
    .train 415942,1
    .itemcount 208183,6
step << Mage
    #season 2
    .train 415942 >>|cRXP_WARN_使用|r |T134332:0|t|cRXP_LOOT_[法术笔记：启迪]|r |cRXP_WARN_学习|r |T133815:0|t[铭刻胸甲 - 启迪]
    .use 203749
    .itemcount 203749,1 --Spell Notes: Enlightenment (1)
step << Priest
    #optional
    #completewith ScarletRings
    >>|cRXP_WARN_收集3组|r |T132889:0|t[亚麻布]|cRXP_WARN_用于制作你的次级魔法杖。这是进入银松森林前收集足够数量的最后机会|r
    .collect 2589,60,435,1 --Linen Cloth (60)
    .mob 血色苦行修士
    .mob 血色狂热者
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step
    #optional
    #completewith next
    >>收集|cRXP_LOOT_血色十字军徽记之戒|r
    .complete 374,1 --Scarlet Insignia Ring (10)
    .isOnQuest 374
step
    #optional
    #loop
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,78.82,56.14,20,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>击杀|cRXP_ENEMY_瓦松队长|r和|cRXP_ENEMY_血色苦行修士|r
    >>|cRXP_WARN_当心！|r|cRXP_ENEMY_血色苦行修士|r|cRXP_WARN_会施放|r |T135929:0|t[次级治疗术]
    .complete 371,1 --Captain Vachon (1)
    .mob +瓦松队长
    .complete 371,2 --Scarlet Friar (5)
    .mob +血色苦行修士
    .isOnQuest 371
step
    #optional
    #label ScarletRings
    #loop
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>收集|cRXP_LOOT_血色十字军徽记之戒|r
    .complete 374,1 --Scarlet Insignia Ring (10)
    .mob 血色苦行修士
    .mob 血色狂热者
    .isOnQuest 374
step << Priest
    #loop
    .goto Tirisfal Glades,79.82,56.40,0
    .goto Tirisfal Glades,80.95,57.21,40,0
    .goto Tirisfal Glades,81.62,54.84,40,0
    .goto Tirisfal Glades,81.56,53.07,40,0
    .goto Tirisfal Glades,79.31,55.25,40,0
    .goto Tirisfal Glades,77.14,54.92,40,0
    .goto Tirisfal Glades,76.15,55.30,40,0
    .goto Tirisfal Glades,76.12,57.22,40,0
    .goto Tirisfal Glades,77.16,56.75,40,0
    .goto Tirisfal Glades,79.82,56.40,40,0
    >>|cRXP_WARN_收集3组|r |T132889:0|t[亚麻布]|cRXP_WARN_用于制作你的次级魔法杖。这是进入银松森林前收集足够数量的最后机会|r
    .collect 2589,60,435,1 --Linen Cloth (60)
    .mob 血色苦行修士
    .mob 血色狂热者
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step
    #optional
    #completewith next
    >>击杀你看到的任何|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_夜行蝙蝠的毛皮|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .isOnQuest 375
step
    #optional
    #loop
    .goto Tirisfal Glades,85.03,54.72,0
    .goto Tirisfal Glades,83.50,55.56,30,0
    .goto Tirisfal Glades,85.03,54.72,30,0
    .goto Tirisfal Glades,86.56,54.51,30,0
    .goto Tirisfal Glades,88.06,54.99,30,0
    .goto Tirisfal Glades,88.94,53.56,30,0
    .goto Tirisfal Glades,89.70,51.88,30,0
    .goto Tirisfal Glades,90.92,50.56,30,0
    .goto Tirisfal Glades,90.87,48.33,30,0
    .goto Tirisfal Glades,89.87,46.65,30,0
    .goto Tirisfal Glades,85.04,46.68,30,0
    .goto Tirisfal Glades,84.52,49.29,30,0
    .goto Tirisfal Glades,83.46,52.09,30,0
    >>击杀|cRXP_ENEMY_邪恶的夜行蜘蛛|r，拾取|cRXP_LOOT_邪恶夜行蜘蛛的毒液|r
    .complete 369,1 --Vicious Night Web Spider Venom (4)
    .mob 邪恶的夜行蜘蛛
    .isOnQuest 369
step
    #optional
    #completewith LinneaTurnin
    .goto Tirisfal Glades,65.49,60.25,60 >> 返回 |cRXP_FRIENDLY_亡灵卫兵林奈|r 附近
step
    #optional
    #completewith next
    >>继续击杀|cRXP_ENEMY_夜行蝙蝠|r，拾取|cRXP_LOOT_夜行蝙蝠的毛皮|r
    >>|cRXP_WARN_掉落运气不佳可跳过此任务|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob 巨型夜行蝙蝠
    .mob 吸血夜行蝙蝠
    .isOnQuest 375
step
    #optional
    #label LinneaTurnin
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵林奈|r交谈
    .turnin 356 >>交任务: 巡查后方
    .target 亡灵卫兵林奈
    .isQuestComplete 356
step
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔·沙伊尔|r交谈
    >>|cRXP_BUY_购买一根|r |T132891:0|t[粗线]|cRXP_BUY_（卖家是|r|cRXP_FRIENDLY_阿比盖尔·沙伊尔）|r
    .complete 375,2 --Coarse Thread (1)
    .target 阿比盖尔·沙伊尔
    .itemcount 2876,5
    .isOnQuest 375
step
    #optional
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯吉斯|r交谈
    .turnin 374 >>交任务: 死亡证明
    .target 亡灵卫兵伯吉斯
    .isQuestComplete 374
step
    #optional
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官塞加德|r交谈
    .turnin 371 >>交任务: 与血色十字军的战争
    .target 执行官塞加德
    .isQuestComplete 371
step
    #optional
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .turnin 360 >>交任务: 向塞弗伦回报
    .target 执政官塞弗伦
    .isQuestTurnedIn 359
step
    #optional
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .turnin 355 >>交任务: 与塞弗伦交谈
    .target 执政官塞弗伦
    .isQuestTurnedIn 354
step << Warrior
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .turnin 355 >>交任务: 与塞弗伦交谈
    .accept 408 >>接受任务: 家族墓穴
    .target 执政官塞弗伦
    .isQuestTurnedIn 354
step
    #optional
    .goto Tirisfal Glades,59.45,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .turnin 369 >>交任务: 新的瘟疫
    .accept 492 >>接受任务: 新的瘟疫
    .accept 445 >>接受任务: 给银松森林送信
    .target 药剂师乔汉
    .isQuestTurnedIn 368
step
    .goto Tirisfal Glades,59.45,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r交谈
    .accept 445 >>接受任务: 给银松森林送信
    .target 药剂师乔汉
step
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店二楼的|cRXP_FRIENDLY_格莉丝·戴玛|r交谈
    .turnin 375 >>交任务: 死亡之寒
    .target 格莉丝·戴玛
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
	.train 588,1 >>学习 |T135926:0|t[心灵之火]
    .target 黑暗牧师贝里尔
    .xp <12,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 145,1 >> 学习|T135812:0|t[火球术（等级3）]
    .target 凯恩·火歌
    .xp <12,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 7384,1 >>学习 |T132223:0|t[压制]
    .target 奥斯蒂尔·德·蒙
    .xp <12,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在二楼与 |cRXP_FRIENDLY_马里恩|r 对话
    .train 1766,1 >> 学习|T132219:0|t[脚踢]
    .target 马里恩·考尔
    .xp <12,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特·鲍什|r 对话
    .train 755,1 >> 学习|T136168:0|t[生命通道]
    .target 鲁伯特·鲍什
    .xp <12,1
step << Warrior
    .goto Tirisfal Glades,47.39,43.64,150,0
    .goto Tirisfal Glades,52.23,26.91,20,0
    .goto Tirisfal Glades,52.29,26.40,8 >> 前往 [阿加曼德磨坊] 的墓穴
    .isOnQuest 1821
step << Warrior
    #completewith CaptainDargol
    >>从地面上的|cRXP_PICK_阿加曼德武器架|r上拾取武器
    .complete 1821,1 --Agamand Family Axe (1)
    .complete 1821,2 --Agamand Family Dagger (1)
    .complete 1821,3 --Agamand Family Mace (1)
    .complete 1821,4 --Agamand Family Sword (1)
    .isOnQuest 1821
step << Warrior
    #completewith next
    >>击杀|cRXP_ENEMY_哀嚎的鬼魂|r和|cRXP_ENEMY_腐烂的古尸|r
    >>|cRXP_WARN_小心！这个墓穴里的敌人会动态刷新！|r
    .complete 408,1 --Wailing Ancestor (8)
    .mob +哀嚎的鬼魂
    .complete 408,2 --Rotting Ancestor (8)
    .mob +腐烂的古尸
    .isOnQuest 408
step << Warrior
    #label CaptainDargol
    .goto Tirisfal Glades,52.53,26.78,8,0
    .goto Tirisfal Glades,52.08,26.81,8,0
    .goto Tirisfal Glades,52.03,26.43,8,0
    .goto Tirisfal Glades,52.81,26.36
    >>击杀|cRXP_ENEMY_达高尔队长|r，拾取|cRXP_LOOT_达高尔的颅骨|r。他位于墓穴底部
    .complete 408,3 --Dargol's Skull (1)
    .mob 达高尔队长
    .isOnQuest 408
step << Warrior
    #completewith next
    >>从地面上的|cRXP_PICK_阿加曼德武器架|r上拾取武器
    .complete 1821,1 --Agamand Family Axe (1)
    .complete 1821,2 --Agamand Family Dagger (1)
    .complete 1821,3 --Agamand Family Mace (1)
    .complete 1821,4 --Agamand Family Sword (1)
    .isOnQuest 1821
step << Warrior
    #loop
	.goto Tirisfal Glades,51.90,26.87,0
	.goto Tirisfal Glades,51.88,25.86,15,0
	.goto Tirisfal Glades,52.61,25.85,15,0
	.goto Tirisfal Glades,52.60,26.88,15,0
	.goto Tirisfal Glades,51.90,26.87,15,0
    >>击杀|cRXP_ENEMY_哀嚎的鬼魂|r和|cRXP_ENEMY_腐烂的古尸|r
    >>|cRXP_WARN_小心！这个墓穴里的敌人会动态刷新！|r
    .complete 408,1 --Wailing Ancestor (8)
    .mob +哀嚎的鬼魂
    .complete 408,2 --Rotting Ancestor (8)
    .mob +腐烂的古尸
    .isOnQuest 408
step << Warrior
    #loop
    .goto Tirisfal Glades,52.66,25.87,0
    .goto Tirisfal Glades,51.70,25.69,12,0
    .goto Tirisfal Glades,52.62,25.62,12,0
    .goto Tirisfal Glades,52.65,27.02,12,0
    .goto Tirisfal Glades,51.89,27.10,12,0
    .goto Tirisfal Glades,52.66,25.87,12,0
    >>从地面上的|cRXP_PICK_阿加曼德武器架|r上拾取武器
    .complete 1821,1 --Agamand Family Axe (1)
    .complete 1821,2 --Agamand Family Dagger (1)
    .complete 1821,3 --Agamand Family Mace (1)
    .complete 1821,4 --Agamand Family Sword (1)
    .isOnQuest 1821
step << skip --Warrior
    .goto Tirisfal Glades,51.68,25.67
    .goto Tirisfal Glades,56.24,49.42,30 >>|cRXP_WARN_跳到其中一个武器架上，然后登出并重新登录，以完成登出跳点|r
    .link https://www.youtube.com/watch?v=bH_NYmWf8Lc&ab >> |cRXP_WARN_点击此处观看示范|r
    .isQuestComplete 408
step << Warrior
    #softcore
    #completewith next
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << Warrior
    #hardcore
    #completewith next
    .subzone 159 >>前往布瑞尔
step << Warrior
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .turnin 408 >>交任务: 家族墓穴
    .target 执政官塞弗伦
    .isQuestComplete 408
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_库勒曼·法席恩|r交谈
    .turnin 1821 >>交任务: 阿加曼德家传武器
    .target 库勒曼·法席恩
    .isQuestComplete 1821
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_库勒曼·法席恩|r交谈
    .turnin 1822 >>祖传武器
    .target 库勒曼·法席恩
    .isQuestTurnedIn 1821
step
    #optional
    .goto Tirisfal Glades,61.97,51.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅馆后方地下室里的|cRXP_FRIENDLY_血色十字军俘虏|r交谈
    .turnin 407 >>交任务: 悲伤之地
    .target 血色十字军俘虏
    .isQuestTurnedIn 365
step
    #optional
    .goto Tirisfal Glades,61.94,51.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅馆楼下最里面的 |cRXP_FRIENDLY_被俘虏的巡山人|r 对话
    .turnin 492 >> 交任务: 新的瘟疫
    .target 被俘虏的巡山人
    .isOnQuest 492
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
	.train 588,1 >>学习 |T135926:0|t[心灵之火]
    .target 黑暗牧师贝里尔
    .xp <12,1
    .xp >14,1
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_贝里尔|r交谈
	.train 6074 >> 学习职业技能
    .target 黑暗牧师贝里尔
    .xp <14,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 145,1 >> 学习|T135812:0|t[火球术（等级3）]
    .target 凯恩·火歌
    .xp <12,1
    .xp >14,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_凯恩·火歌|r交谈
    .train 2137 >> 学习职业技能
    .target 凯恩·火歌
    .xp <14,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 7384,1 >>学习 |T132223:0|t[压制]
    .target 奥斯蒂尔·德·蒙
    .xp <12,1
    .xp >14,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥斯蒂尔|r交谈
    .train 1160 >> 学习职业技能
    .target 奥斯蒂尔·德·蒙
    .xp <14,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在二楼与 |cRXP_FRIENDLY_马里恩|r 对话
    .train 1766,1 >> 学习|T132219:0|t[脚踢]
    .target 马里恩·考尔
    .xp <12,1
    .xp >14,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在二楼与 |cRXP_FRIENDLY_马里恩|r 对话
    .train 1758 >> 学习职业技能
    .target 马里恩·考尔
    .xp <14,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特·鲍什|r 对话
    .train 755,1 >> 学习|T136168:0|t[生命通道]
    .target 鲁伯特·鲍什
    .xp <12,1
    .xp >14,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_鲁伯特·鲍什|r 对话
    .train 6222 >> 学习职业技能
    .target 鲁伯特·鲍什
    .xp <14,1
step << Mage
    #completewith next
    .goto Tirisfal Glades,61.80,65.06,20,0
    .zone Undercity >> 进入幽暗城
    .zoneskip Undercity
step << Mage
    #completewith next
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘坐升降梯下到幽暗城
step << Mage
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1882 >>交任务: 巴尼尔农场
    .target 安娜斯塔西娅·哈特威尔
step << Rogue
    #completewith Swordtraining3
    .goto Tirisfal Glades,61.80,65.06,20,0
    .zone Undercity >> 进入幽暗城
    .zoneskip Undercity
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    #completewith Swordtraining3
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘坐升降梯下到幽暗城
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << !Rogue !Mage
    #completewith UCflightpath3
    .goto Tirisfal Glades,61.80,65.06,20,0
    .zone Undercity >> 进入幽暗城
    .zoneskip Undercity
step << !Rogue !Mage
    #completewith UCflightpath3
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘坐升降梯下到幽暗城
step << !Undead
    #label UCflightpath3
    .goto Undercity,63.25,48.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔|r交谈
    .fp Undercity >> 开启幽暗城的飞行点
    >>|cRXP_WARN_若已解锁飞行点，请跳过此步骤！|r
    .target 迈克尔·加勒特
step << Orc Rogue/Troll Rogue
    #ssf
    #optional
    #label RogueCutlass3
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    .collect 851,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 刘易斯·瓦伦
    .zoneskip Undercity,1
step << Orc Rogue/Troll Rogue
    #ah
    #optional
    #label RogueCutlass3
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与贸易区的|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_购买|r |T135346:0|t[斗士短剑]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_也可去拍卖行寻找更好或更便宜的替代品|r
    .collect 851,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target 刘易斯·瓦伦
    .zoneskip Undercity,1
step << Undead Rogue
    .goto Undercity,83.52,69.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米奈特·卡加德|r交谈
    .turnin 1885 >>交任务: 米奈特·卡加德
    .accept 1886 >>接受任务: 亡灵哨兵
    .target 米奈特·卡加德
    .isOnQuest 1885
step << Undead Rogue
    .goto Undercity,83.52,69.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米奈特·卡加德|r 交谈
    .accept 1886 >> 接任务：亡灵哨兵
    .target 米奈特·卡加德
    .isQuestTurnedIn 1885
step << Rogue
    #label Swordtraining3
    .goto Undercity,57.29,32.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_阿基巴德|r交谈，地点在军事区
    .train 201 >>学习单手剑（1h）
    .target 阿基巴德
    .money <0.1
step << Rogue
    #optional
    #completewith Entersilverpine
    +|cRXP_WARN_装备|r |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .train 201,1
step << Undead Warrior
    #completewith Entersilverpine
    .goto Tirisfal Glades,61.80,65.06,20,0
    .zone Undercity >> 进入幽暗城
    .zoneskip Undercity
    .money <0.3022
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Undead Warrior
    #completewith Entersilverpine
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >> 乘坐升降梯下到幽暗城
    .money <0.3022
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Troll Warrior/Undead Warrior/Tauren Shaman/Troll Shaman/Orc Shaman
    .goto Undercity,58.82,32.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_本尼亚·芬奈尔|r|cRXP_BUY_交谈，购买一根|r |T135154:0|t[短杖]|cRXP_BUY_（他有售）|r
    .collect 854,1,435,1 --Collect Quarter Staff (1)
    .money <0.3022
    .target 本尼亚·芬奈尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Troll Warrior/Undead Warrior/Tauren Shaman/Troll Shaman/Orc Shaman
    #optional
    #completewith Entersilverpine
    +|cRXP_WARN_装备|r |T135154:0|t[短杖]
    .use 854
    .itemcount 854,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step
    #optional
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师雷克尔|r交谈
    >>|cRXP_BUY_购买六个|r |T134339:0|t[变色的狼心] |cRXP_BUY_（拍卖行有售）|r
    >>|cRXP_WARN_可跳过，仅节省少量时间|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .target 拍卖师雷克尔
    .zoneskip Undercity,1
step << Priest
    .goto Undercity,62.47,61.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉文尼亚·克洛文|r 对话
    .train 7411 >> 学习|T136244:0|t[附魔]
    .target 拉文尼亚·克洛文
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    .goto Undercity,70.77,30.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔瑟夫·格里高利|r 对话
    .train 3908 >> 学习|T136249:0|t[裁缝]
    .target 乔瑟夫·格里高利
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    .goto Undercity,70.76,30.67
    >>|cRXP_WARN_将所有|r |T132889:0|t[亚麻布] |cRXP_WARN_制成|r |T132890:0|t[亚麻布卷]
    .collect 2996,30,435,1 --Bolt of Linen Cloth (30)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    .goto Undercity,70.76,30.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔瑟夫·格里高利|r 对话
    .train 7623 >> 学习|T132662:0|t[棕色亚麻长袍]
    .target 乔瑟夫·格里高利
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    .goto Undercity,70.57,30.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米利尔·格里高利|r交谈
    >>|cRXP_BUY_购买|r |T132891:0|t[粗线]|cRXP_BUY_（她有售）|r
    .collect 2320,30,435,1 --Coarse Thread (30)
    .target 米利尔·格里高利
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    >>|cRXP_WARN_制作|r |T132662:0|t[棕色亚麻长袍]|cRXP_WARN_，数量越多越好|r
    .collect 6238,9,435,1 --Brown Linen Robe(9)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    .goto Undercity,62.35,60.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_萨德乌斯·韦伯|r|cRXP_BUY_交谈，购买|r |T133942:0|t[铜棒]|cRXP_BUY_和|r |T135435:0|t[普通木柴]|cRXP_BUY_（他有售）|r
    >>|cRXP_WARN_分解你制作的所有|r |T132662:0|t[棕色亚麻长袍]|cRXP_WARN_，再制作|r |T135225:0|t[符文铜棒]
    >>|cRXP_WARN_如果还没有|r |T132867:0|t[次级魔法精华]|cRXP_WARN_，请从|r|cRXP_FRIENDLY_萨德乌斯·韦伯|r|cRXP_WARN_处购买（如果有货）。否则稍后再完成这一步|r
    .collect 6218,1,435,1 --Runed Copper Rod (1)
    .collect 4470,1,435,1 --Simple Wood (1)
    .target 萨德乌斯·韦伯
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    .goto Undercity,62.54,60.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛考布·维恩|r 对话
    .train 14293 >> 学习|T135139:0|t[次级魔法杖]
    .target 玛考布·维恩
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    >>|cRXP_WARN_制作一根|r |T135139:0|t[次级魔法杖]
    >>|cRXP_WARN_如果还没有|r |T132867:0|t[次级魔法精华]|cRXP_WARN_，请从|r|cRXP_FRIENDLY_萨德乌斯·韦伯|r|cRXP_WARN_处购买（如果有货）。否则稍后再完成这一步|r
    .collect 11287,1,435,1 --Lesser Magic Wand (1)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    #completewith Entersilverpine
    +|cRXP_WARN_装备|r |T135139:0|t[次级魔法杖]
    .use 11287
    .itemcount 11287,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step
    #xprate <1.5
    #optional
    .abandon 806 >> 放弃任务：黑暗风暴
step
    #optional
    .abandon 408 >> 放弃任务: 家族墓穴
step << Warrior
    #optional
    .abandon 1821 >> 放弃任务: [阿加曼德家传武器]
step
    #optional
    #xprate >1.49
    .abandon 830 >> 放弃任务: 将军的命令
step
    #label LeaveUndercity3
    .goto Undercity,47.25,39.12,50,0
    .goto Undercity,46.35,43.86,10,0
    .goto Undercity,45.24,39.35,10,0
    .goto Undercity,41.32,38.40,10,0
    .goto Undercity,40.74,33.95,10,0
    .goto Undercity,34.80,33.19,15,0
    .goto Undercity,27.39,30.23,35,0
    .goto Undercity,21.89,43.35,35,0
    .goto Tirisfal Glades,51.10,71.53,50,0
    .zone Tirisfal Glades >> 从幽暗城下水道离开
    .zoneskip Tirisfal Glades
step
    #label Entersilverpine
    .goto Tirisfal Glades,53.20,75.82
    .zone Silverpine Forest >> 前往银松森林
    .zoneskip Silverpine Forest
]])
local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate >1.99
<< Horde
#name 1-7 Durotar
#version 1
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 7-13 Durotar
#displayname 1-7 杜隆塔尔
step << !Orc !Troll
    #completewith next
    +|cRXP_WARN_这份指南适用于兽人和巨魔；请选择与你角色起始区域对应的指南。|r
step
    .goto Durotar,43.29,68.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔图克|r交谈
    .accept 4641 >>起点
    .target 卡尔图克
step
    #season 2
    .xp 2 >> 击杀四只 |cRXP_ENEMY_杂斑野猪|r，升到2级
    >>|cRXP_WARN_拾取它们的掉落物，直到可出售物品总价达到15铜币|r << !Warlock !Priest
    >>|cRXP_WARN_拾取它们的掉落物，直到可出售物品总价达到30铜币|r << Warlock/Priest
    .goto Durotar,44.32,71.16
    .mob 杂斑野猪
step
    #season 2
    .goto Durotar,42.73,68.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文贩子|r交谈
    >>|cRXP_WARN_不要将可装备的物品卖给商人|r
    >>|cRXP_BUY_出售杂物，并购买|r |T134419:0|t[|cRXP_FRIENDLY_乘胜追击符文|r] 和 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r] << Orc Warrior
    >>|cRXP_BUY_出售杂物，并购买|r |T134419:0|t[|cRXP_FRIENDLY_乘胜追击符文|r] << Troll Warrior
    >>|cRXP_BUY_出售垃圾并购买|r |T134920:0|t[|cRXP_FRIENDLY_卡亚圣像|r] |cRXP_BUY_和|r |T134918:0|t[|cRXP_FRIENDLY_二价圣像|r] << Shaman
    >>|cRXP_BUY_出售杂物并购买所有关键 AOE 符文|r << Mage
    >>|cRXP_BUY_出售杂物并购买以下所有符文：|r << Hunter/Warlock/Rogue/Priest
    .collect 206387,1 << Shaman --Kajaric Icon
    .collect 206381,1 << Shaman --Dyadic Icon
    .collect 204806,1 << Warrior --Rune of Victory Rush
    .collect 204716,1 << Orc Warrior --Rune of Frenzied Assault
    .collect 208799,1 << Mage --Spell Notes: Living Bomb
    .collect 203746,1 << Mage --Spell Notes: Living Flame
    .collect 203748,1 << Mage --Spell Notes: Burnout
    .collect 225690,1 << Mage --Spell Notes: Frozen Orb
    .collect 203745,1 << Mage --Spell Notes: Ice Lance
    .collect 209852,1 << Hunter --Rune of Kill Command
    .collect 226401,1 << Hunter --Treatise on the Heart of the Lion
    .collect 216770,1 << Hunter --Treatise on Aspect of the Viper
    .collect 206168,1 << Hunter --Rune of the Chimera
    .collect 210818,1 << Hunter --Rune of Lone Wolf
    .collect 213124,1 << Hunter --Rune of Close Combat
    .collect 226252,1 << Hunter --Rune of the Guerrilla
    .collect 205215,1 << Warlock --Rune of Tactics
    .collect 210824,1 << Warlock --Rune of the Pact
    .collect 211477,1 << Warlock --Rune of Incinerate
    .collect 205230,1 << Warlock --Rune of Haunting
    .collect 228797,1 << Warlock --Grimoire of Fel Armor
    .collect 210979,1 << Rogue --Rune of Shadowstep
    .collect 221428,1 << Rogue --Rune of Foul Play
    .collect 204795,1 << Rogue --Rune of Shadowstrike
    .collect 208772,1 << Rogue --Rune of Saber Slash
    .collect 227922,1 << Rogue --Rune of the Swashbuckler
    .collect 212552,1 << Priest --Psychosophic Epiphany
    .collect 205940,1 << Priest --Memory of a Dark Purpose
    .collect 205951,1 << Priest --Memory of a Troubled Acolyte
    .collect 205932,1 << Priest --Prophecy of a King's Demise
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel
    >> 冰枪术仅在后续交任务时有用 << Mage
    >>|cRXP_WARN_其余符文稍后获取|r
    .target 符文贩子
    .skipgossip
step
    #season 2
    .train 403470 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_乘胜追击符文|r] 学习 |T132342:0|t[乘胜追击]<< Warrior
    .train 415936 >> 使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：活动炸弹|r] 学习 |T236220:0|t[活动炸弹] << Mage
    .train 401759 >> 使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:燃尽|r] 学习 |T236207:0|t[燃尽] << Mage
    .train 440858 >> 使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:寒冰宝珠|r] 学习 |T135851:0|t[寒冰宝珠] << Mage
    .train 401760 >> 使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记:冰枪术|r] 学习 |T135844:0|t[冰枪术] << Mage
    .train 401768 >> 使用 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：活体烈焰|r] 学习 |T135820:0|t[活体烈焰]  << Mage
    .train 410121 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_奇美拉符文|r] 学习 |T236176:0|t[奇美拉射击] << Hunter
    .train 410122 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_独来独往符文|r] 学习 |T132266:0|t[独来独往] << Hunter
    .train 416086 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_短兵相接符文|r] 学习 |T132394:0|t[近战专家] << Hunter
    .train 440563 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_游击符文|r] 学习 |T132171:0|t[一击脱离] << Hunter
    .train 415423 >> 使用 |T133739:0|t[|cRXP_FRIENDLY_论述：蝰蛇守护|r] 学习 |T132160:0|t[蝰蛇守护] << Hunter
    .train 416009 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_战术符文|r] 学习 |T136150:0|t[恶魔战术] << Warlock
    .train 425476 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_契约符文|r] 学习 |T237562:0|t[恶魔契约] << Warlock
    .train 416015 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_烧尽符文|r] 学习 |T135789:0|t[烧尽] << Warlock
    .train 403919 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_鬼影缠身符文|r] 学习 |T236298:0|t[鬼影缠身] << Warlock
    .train 403619 >> 使用 |T133733:0|t[|cRXP_FRIENDLY_魔典：邪甲术|r] 学习 |T136156:0|t[邪甲术] |cRXP_WARN_将其设为主要护甲法术|r << Warlock
    .train 402852 >> 使用 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] 学习 |T237570:0|t[裂魂魔] << Priest
    .train 425447 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r] 学习 |T236317:0|t[狂乱攻击] << Orc Warrior
    .train 410111 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_杀戮命令符文|r] 学习 |T236174:0|t[夺命射击] << Hunter
    .train 409580 >> 使用 |T133739:0|t[|cRXP_FRIENDLY_论述：雄狮之心|r] 学习 |T132185:0|t[雄狮之心] << Hunter
    .train 400101 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_暗影步符文|r] 学习 |T132303:0|t[暗影步] << Rogue
    .train 432301 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_犯禁符文|r] 学习 |T236285:0|t[压倒优势] << Rogue
    .train 400105 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_暗影打击符文|r] 学习 |T132323:0|t[暗影打击] << Rogue
    .train 424984 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r] 学习 |T132375:0|t[军刀猛刺] << Rogue
    .train 415922 >> 使用 |T134419:0|t[|cRXP_FRIENDLY_豪侠符文|r] 学习 |T134538:0|t[短枪射击] << Rogue
    .equip 18 >> 装备 |T134920:0|t[|cRXP_FRIENDLY_卡亚圣像|r]，30秒后即可使用它学习 |T237582:0|t[熔岩爆裂] << Shaman
    .train 431663 >> 使用 |T135791:0|t[|cRXP_FRIENDLY_灵智顿悟|r] 学习 |T136181:0|t[心灵尖刺] << Priest
    .train 425216 >> 使用 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] 学习 |T237514:0|t[虚空疫病] << Priest
    .train 402862 >> 使用 |T136222:0|t[|cRXP_FRIENDLY_忧虑助祭的回忆|r] 学习 |T237545:0|t[苦修] << Priest
    .train 402849 >> 使用 |T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言|r] 学习 |T136149:0|t[暗言术：灭] << Priest
    .use 206387 << Shaman --Kajaric Icon
    .use 205947 << Priest --Prophecy of a Desecrated Citadel
    .use 212552 << Priest --Psychosophic Epiphany
    .use 205940 << Priest --Memory of a Dark Purpose
    .use 205951 << Priest --Memory of a Troubled Acolyte
    .use 205932 << Priest --Prophecy of a King's Demise
    .use 204716 << Orc Warrior --Rune of Frenzied Assault
    .use 203746 << Mage --Spell Notes: Living Flame
    .use 209852 << Hunter --Rune of Kill Command
    .use 226401 << Hunter --Treatise on the Heart of the Lion
    .use 208799 << Mage --Spell Notes: Living Bomb
    .use 203748 << Mage --Spell Notes: Burnout
    .use 225690 << Mage --Spell Notes: Frozen Orb
    .use 203746 << Mage --Spell Notes: Living Flame
    .use 203745 << Mage --Spell Notes: Ice Lance
    .use 204716 << Orc Warrior --Rune of Frenzied Assault
    .use 206168 << Hunter --Rune of the Chimera
    .use 210818 << Hunter --Rune of Lone Wolf
    .use 213124 << Hunter --Rune of Close Combat
    .use 226252 << Hunter --Rune of the Guerrilla
    .use 216770 << Hunter --Treatise on Aspect of the Viper
    .use 204806 << Warrior --Rune of Victory Rush
    .use 205215 << Warlock --Rune of Tactics
    .use 210824 << Warlock --Rune of the Pact
    .use 211477 << Warlock --Rune of Incinerate
    .use 205230 << Warlock --Rune of Haunting
    .use 228797 << Warlock --Grimoire of Fel Armor
    .use 210979 << Rogue --Rune of Shadowstep
    .use 221428 << Rogue --Rune of Foul Play
    .use 204795 << Rogue --Rune of Shadowstrike
    .use 208772 << Rogue --Rune of Saber Slash
    .use 227922 << Rogue --Rune of the Swashbuckler
step << Warlock
    #season 2
    #optional
    #sticky
    .aura 403619 >> 记得激活 |T136156:0|t[邪甲术]
step << Warlock
    .goto Durotar,42.59,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁赞|r交谈
    .accept 1485 >>邪灵劣魔
    .target 鲁赞
step << Shaman
    #season 2
    #optional
    #label LavaBurst
    #sticky
    .train 410095 >> 从角色面板使用 |T134920:0|t[|cRXP_FRIENDLY_卡亚圣像|r] 学习 |T237582:0|t[熔岩爆裂]
step << Shaman
    #season 2
    #optional
    #requires LavaBurst
    #label Overload
    #sticky
    .equip 18,206381 >> 装备 |T134918:0|t[|cRXP_FRIENDLY_二价圣像|r]
    .train 410094 >> 30秒后使用它学习 |T136050:0|t[过载]
    .use 206381
step
    .goto Durotar,42.28,68.48,12,0 << !Warrior !Shaman
    .goto Durotar,42.29,68.39,12,0 << Warrior/Shaman
    .goto Durotar,42.06,68.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 4641 >>起点
    .accept 788 >>小试身手
    .target 高内克
step << Priest
    #season 2
    .goto Durotar,40.61,67.81
    >>|cRXP_WARN_深入巢穴|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈克拉恩|r交谈
    .vendor >>|cRXP_BUY_出售杂物并购买|r |T132513:0|t[破布腰带]|cRXP_BUY_供你刻印符文|r
    .collect 3595,1 --Tattered Cloth Belt
    .target 哈克拉恩
step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .accept 77642 >>洛阿的智慧
    .turnin 77642 >>洛阿的智慧
    .target 肯杰
step << Priest
    #season 2
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .equip 6,3595 >> |cRXP_WARN_装备|r |T132513:0|t[破布腰带]
    .use 711
    .use 3595
    .engrave 6 >> 在腰带上刻印 |T136181:0|t[心灵尖刺]
    .engrave 10 >> 在手套上刻印 |T136149:0|t[暗言术：灭]
    .engrave 7 >> 在裤子上刻印 |T237570:0|t[裂魂魔]
step << Mage
    #season 2
    #requires Galgar
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .accept 77643 >>法术研究 << Troll Mage
    .turnin 77643 >>法术研究 << Troll Mage
    .train 1459 >> 学习 |T135932:0|t[奥术智慧]
    .target 迈安
step << Mage
    #season 2
    #optional
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .use 711
    .engrave 10 >>|cRXP_WARN_在手套上|r刻印|r |T236220:0|t[活动炸弹]
    .engrave 7 >>|cRXP_WARN_在裤子上刻印|r |T135820:0|t[活体烈焰]
    .engrave 5 >>|cRXP_WARN_在胸甲上刻印|r |T236207:0|t[燃尽]
step << Mage
    #season 2
    #optional
    #sticky
    .engrave 15 >> 留意披风掉落, 获得后刻印 |T135851:0|t[寒冰宝珠]
    >>|cRXP_WARN_此法术极其强大|r
step << Hunter
    #season 2
    #xprate >1.49
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .accept 77590 >>崎岖地形 << Troll Hunter
    .accept 77584 >>搜寻符文 << Orc Hunter
    .turnin 77590 >>崎岖地形 << Troll Hunter
    .turnin 77584 >>搜寻符文 << Orc Hunter
    .target 基沙
step << Rogue
    #season 2
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与洞内的|cRXP_FRIENDLY_鲁瓦格|r交谈
    .accept 77592 >>悬崖之巅 << Troll Rogue
    .accept 77583 >>悬崖之巅 << Orc Rogue
    .turnin 77592 >>悬崖之巅 << Troll Rogue
    .turnin 77583 >>悬崖之巅 << Orc Rogue
    .train 1784 >>学习 |T132320:0|t[潜行]
    .target 鲁瓦格
step << Rogue
    #season 2
    #optional
    .equip 10 >> 装备 |T132952:0|t[破损的皮手套]
    .engrave 10 >> 在手套上刻印 |T132375:0|t[军刀猛刺]
    .use 2125 --Cracked Leather Gloves
step << Warrior/Shaman
    #season 0,1
    .goto Durotar,42.28,68.48,10,0
    .goto Durotar,42.89,69.44 << Warrior
    .goto Durotar,42.39,69.00 << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈 << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈 << Shaman
    .train 6673 >>学习 |T132333:0|t[战斗怒吼] << Warrior
    .train 8017 >>学习 |T136086:0|t[石化武器] << Shaman
    .target 弗朗恩 << Warrior
    .target 史克里克 << Shaman
step << Warrior/Shaman
    #season 2
    .goto Durotar,42.28,68.48,10,0
    .goto Durotar,42.89,69.44 << Warrior
    .goto Durotar,42.39,69.00 << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈 << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈 << Shaman
    .train 6673 >>学习 |T132333:0|t[战斗怒吼] << Warrior
    .train 8017 >>学习 |T136086:0|t[石化武器] << Shaman
    .accept 77588 >>体能试炼 << Troll Warrior
    .accept 77582 >>体能试炼 << Orc Warrior
    .turnin 77588 >>体能试炼 << Troll Warrior
    .turnin 77582 >>体能试炼 << Orc Warrior
    .target 弗朗恩 << Warrior
    .target 史克里克 << Shaman
step << Warrior
    #season 2
    .equip 10 >> 装备 |T132938:0|t[无光泽的链甲手套] << Warrior
    .engrave 10 >> 在手套上刻印 |T132342:0|t[乘胜追击] << Warrior
    .engrave 7 >> 在裤子上刻印 |T236317:0|t[狂乱攻击] << Orc Warrior
    .use 2385 << Warrior -- Tarnished Chain Gloves
step << Warlock
    #softcore
    #completewith Nartok
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.65,68.52,12 >>前去找|cRXP_FRIENDLY_纳托克|r
    .money <0.01
step << Warlock
    #softcore
    #completewith next
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>前去找|cRXP_FRIENDLY_纳托克|r
    .money >0.01
step << Warlock
    #hardcore
    #completewith next
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>前去找|cRXP_FRIENDLY_纳托克|r
step << Warlock
    #softcore
    #season 0,1
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售杂物
    .target 赫劳格
    .money >0.01
step << Warlock
    #hardcore
    #season 0,1
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售杂物
    .target 赫劳格
step << Warlock
    #season 2
    #label Nartok
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .accept 77586 >>失窃的力量
    .turnin 77586 >>失窃的力量
    .target 纳托克
step << Warlock
    #season 2
    .goto Durotar,40.61,67.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈克拉恩|r交谈
    .vendor >>|cRXP_BUY_出售杂物并购买一副|r[破布护腕]|cRXP_BUY_（他有售，可铭刻符文）|r
    .collect 3596,1 --Tattered Cloth Bracers
    .target 哈克拉恩
step << Warlock
    #season 2
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .equip 9,3596 >> |cRXP_ENEMY_装备|r |T132606:0|t[破布护腕]
    .use 711
    .use 3596
    .engrave 10 >>|cRXP_WARN_在手套上|r刻印|r |T133816:0|t[鬼影缠身] << Warlock
    .engrave 9 >> |cRXP_WARN_在护腕上刻印|r |T135789:0|t[烧尽]
    .engrave 7 >> |cRXP_WARN_在裤子上刻印 |T237562:0|t[恶魔契约]|r
step << Warlock
    #season 0,1
    #label Nartok
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 348 >>学习 |T135817:0|t[献祭]
    .target 纳托克
step << !Warrior !Rogue
    #softcore
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（她有售）|r << !Hunter !Shaman
    >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_（她有售）|r << Hunter
    .collect 159,30,6394,1 << !Hunter !Shaman --Refreshing Spring Water (30)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .target 多克纳
    .money <0.005 << !Hunter
    .money <0.0040 << Hunter
step << Warlock
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（她有售）|r
    .collect 159,5,6394,1 --Refreshing Spring Water (5)
    .target 多克纳
    .money <0.0025
step << Warlock
    #completewith next
    .goto Durotar,43.57,67.28,25,0
    >>去火刃集会所的路上，顺便击杀|cRXP_ENEMY_杂斑野猪|r
    >>|cRXP_WARN_尽量在到那儿之前升到 2 级|r
    .complete 788,1 --Mottled Boar (10)
    .mob 杂斑野猪
step << Warlock
    .goto Durotar,45.30,56.42,100 >> 前往火刃集会所
    .isOnQuest 1485
step << Warlock
    #loop
    .goto Durotar,43.87,58.42,0
    .goto Durotar,43.87,58.42,40,0
    .goto Durotar,44.53,58.62,40,0
    .goto Durotar,45.18,58.42,40,0
    .goto Durotar,45.83,58.59,40,0
    .goto Durotar,45.79,57.43,40,0
    .goto Durotar,46.46,57.57,40,0
    .goto Durotar,47.19,57.12,40,0
    .goto Durotar,46.21,56.69,40,0
    .goto Durotar,46.28,56.11,40,0
    .goto Durotar,45.65,56.90,40,0
    .goto Durotar,45.35,56.32,40,0
    .goto Durotar,44.77,56.87,40,0
    .goto Durotar,44.58,56.10,40,0
    .goto Durotar,44.27,56.59,40,0
    .goto Durotar,43.85,55.52,40,0
    >>击杀|cRXP_ENEMY_邪灵劣魔|r，拾取|cRXP_LOOT_邪灵劣魔的头颅|r
    .complete 1485,1 --Vile Familiar Head (6)
    .mob 邪灵劣魔
step << Hunter
    #season 2
    #optional
    #completewith Sarkoth
    .equip 10 >> 装备 |T132952:0|t[破损的皮手套]
    .engrave 7 >> 在裤子上刻印 |T236174:0|t[夺命射击]
    .engrave 10 >> 在手套上刻印 |T236176:0|t[奇美拉射击]
    .aura 409583 >> 记得激活 |T132185:0|t[雄狮之心]
    .use 2125 --Cracked Leather Gloves
step << Hunter
    #season 2
    #sticky
    #optional
    >>|cRXP_WARN_留意是否有|r 胸甲/腰带/披风 |cRXP_WARN_掉落|r|cRXP_WARN_。装备它们并铭刻相应的符文|r
    .engrave 5 >> 将 |T132266:0|t[独来独往] 铭刻在你的 |T132724:0|t[胸甲] 上
    .engrave 6 >> 将 |T132394:0|t[近战专家] 铭刻在你的 |T132513:0|t[腰带] 上
    .engrave 15 >> 将 |T132171:0|t[一击脱离] 铭刻在你的 |T133771:0|t[披风] 上
step << Rogue
    #season 2
    #sticky
    #optional
    >>|cRXP_WARN_留意是否有|r 腰带/披风/护腕 |cRXP_WARN_掉落|r|cRXP_WARN_。装备它们并铭刻相应的符文|r
    .engrave 6 >> 将 |T132303:0|t[暗影步] 铭刻在你的 |T132513:0|t[腰带] 上
    .engrave 15 >> 将 |T134538:0|t[短枪射击] 铭刻在你的 |T133771:0|t[披风] 上
    .engrave 9 >> 将 |T236285:0|t[压倒优势] 铭刻在你的 |T133830:0|t[护腕] 上
step
    #completewith Sarkoth
    .goto Durotar,43.57,67.28,35,0 << !Warlock
    .goto Durotar,43.89,65.84,45,0 << !Warlock
    >>击杀|cRXP_ENEMY_杂斑野猪|r
    .complete 788,1 --Mottled Boar (10)
    .mob 杂斑野猪
step
    .goto Durotar,40.59,62.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳祖|r交谈
    .accept 790 >>萨科斯
    .target 哈纳祖
step
    #label Sarkoth
    .goto Durotar,40.60,66.80
    >>击杀|cRXP_ENEMY_萨科斯|r，拾取|cRXP_LOOT_萨科斯的爪子|r
    .complete 790,1 --Sarkoth's Mangled Claw (1)
    .mob 萨科斯
step
    .goto Durotar,40.59,62.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳祖|r交谈
    .turnin 790 >>萨科斯
    .accept 804 >>萨科斯
    .target 哈纳祖
step
    #loop
    .goto Durotar,41.30,65.03,0
    .goto Durotar,41.30,65.03,40,0
    .goto Durotar,41.92,64.74,40,0
    .goto Durotar,42.66,64.92,40,0
    .goto Durotar,43.31,65.02,40,0
    .goto Durotar,43.90,65.96,40,0
    .goto Durotar,44.54,65.96,40,0
    .goto Durotar,45.16,65.77,40,0
    .goto Durotar,45.72,65.93,40,0
    .goto Durotar,45.72,65.04,40,0
    .goto Durotar,45.21,63.95,40,0
    .goto Durotar,45.83,63.01,40,0
    .goto Durotar,45.81,62.17,40,0
    .goto Durotar,45.78,61.14,40,0
    .goto Durotar,45.15,60.20,40,0
    .goto Durotar,44.50,59.45,40,0
    .goto Durotar,43.86,60.43,40,0
    .goto Durotar,43.07,60.24,40,0
    .goto Durotar,42.58,60.09,40,0
    .goto Durotar,42.02,61.19,40,0
    .goto Durotar,42.02,62.15,40,0
    .goto Durotar,42.00,62.92,40,0
    .goto Durotar,41.99,64.03,40,0
    >>击杀|cRXP_ENEMY_杂斑野猪|r
    .complete 788,1 --Mottled Boar (10)
    .mob 杂斑野猪
step << Warlock
    #xprate <1.5
    #completewith Gornek2
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷怪直到获得价值 1 银的可出售物品|r
    .mob 杂斑野猪
	.money >0.01
step << Warlock/Warrior/Shaman/Hunter
    #xprate >1.49
    #completewith Gornek2
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷怪直到获得价值 2 银的可出售物品|r << Warrior
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷怪直到获得价值 1 银 75 铜的可出售物品|r << Warlock
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷怪直到获得价值 1 银 10 铜的可出售物品|r << Hunter
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r，刷怪直到获得价值 1 银的可出售物品|r << Shaman
    .mob 杂斑野猪
	.money >0.02 << Warrior
	.money >0.0175 << Warlock
	.money >0.011 << Hunter
	.money >0.01 << Shaman
step << Rogue
    #label Duokna2
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >> 出售杂物
    .target 多克纳
step << Warlock
    #label Ruzan2
    .goto Durotar,42.59,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁赞|r交谈
    .turnin 1485 >>邪灵劣魔
    .accept 1499 >>邪灵劣魔
    .target 鲁赞
step << Warlock
    #completewith Gornek2
    .cast 688 >>|cRXP_WARN_施放|r |T136218:0|t[召唤小鬼]
step << Warlock
	.goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 1499 >>邪灵劣魔
    .accept 794 >>火刃奖章
    .target 祖雷萨
step
    #label Gornek2
    .goto Durotar,42.28,68.48,12,0 << Warlock
    .goto Durotar,42.29,68.39,12,0 << !Warlock
    .goto Durotar,42.06,68.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 788,2 >>小试身手 << Shaman
    .turnin 788 >>小试身手 << !Shaman
    .accept 789 >>工蝎的尾巴
    .accept 2383 >>简易羊皮纸 << Orc Warrior
    .accept 3065 >>普通石板 << Troll Warrior
    .accept 3082 >>风蚀石板 << Troll Hunter
    .accept 3083 >>密文石板 << Troll Rogue
    .accept 3084 >>符文石板 << Troll Shaman
    .accept 3085 >>神圣石板 << Troll Priest
    .accept 3086 >>雕文石板 << Troll Mage
    .accept 3087 >>风蚀羊皮纸 << Orc Hunter
    .accept 3088 >>密文羊皮纸 << Orc Rogue
    .accept 3089 >>符文羊皮纸 << Orc Shaman
    .accept 3090 >>被污染的羊皮纸 << Orc Warlock
    .turnin 804,1 >>萨科斯 << Shaman
    .turnin 804 >>萨科斯 << !Shaman
    .target 高内克
step << Rogue
    #season 0,1
    #completewith Rwag
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.27,68.00,12 >>朝|cRXP_FRIENDLY_鲁瓦格|r方向前进
step << Rogue
    #season 0,1
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .turnin 3083 >>密文石板 << Troll Rogue
    .turnin 3088 >>密文羊皮纸 << Orc Rogue
    .train 53 >> 学习 |T132090:0|t[背刺]
    .target 鲁瓦格
    .money <0.04
    .xp <4,1
step << Rogue
    #season 0,1
    #label Rwag
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .turnin 3083 >>密文石板 << Troll Rogue
    .turnin 3088 >>密文羊皮纸 << Orc Rogue
    .target 鲁瓦格
step << Rogue
    #season 2
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与洞内的 |cRXP_FRIENDLY_鲁瓦格|r 交谈
    .turnin 3083 >> 交任务：密文石板 << Troll
    .turnin 3088 >> 交任务：密文羊皮纸 << Orc
    .target 鲁瓦格
step << Warlock
    #completewith Nartok2
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.65,68.52,12 >>前去找|cRXP_FRIENDLY_纳托克|r
    .money <0.01
step << Warlock
    #completewith next
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>朝|cRXP_FRIENDLY_赫劳格|r方向前进
    .money >0.01
step << Warlock
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售杂物
    .target 赫劳格
    .money >0.01
step << Warlock
    #season 2
    #label Nartok2
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .turnin 3090 >>被污染的羊皮纸
    .target 纳托克
step << Warlock
    #season 0,1
    #label Nartok2
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .turnin 3090 >>被污染的羊皮纸
    .train 172 >> 学习 |T136118:0|t[腐蚀术]
    .target 纳托克
step
    #label Galgar
    .goto Durotar,42.73,67.23,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .accept 4402 >>戈加尔的清凉果
    .target 戈加尔
    .xp >4,1
step << !Rogue
    #xprate <1.5
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（她有售）|r << !Rogue !Warrior !Hunter !Shaman
    >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_（她有售）|r << Hunter
    .collect 159,15,6394,1 << !Rogue !Warrior !Hunter !Shaman --Refreshing Spring Water (15)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >> 出售杂物
    .target 多克纳
    .money >0.01 << Rogue/Warrior
    .itemcount 159,<15 << !Rogue !Warrior !Hunter !Shaman
step << !Rogue
    #xprate >1.49
    #season 0 << Mage
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cFF00FF25多克纳|r 交谈
    >>|cFF0E8312向她购买|r |T132794:0|t[清凉的泉水]|cFF0E8312|r << !Rogue !Warrior !Hunter !Shaman
    >>|cFF0E8312向她购买|r |T132382:0|t[劣质箭]|cFF0E8312|r << Hunter
    >>|cRXP_WARN_留出 10 铜币来学习|r |T135932:0|t[奥术智慧] << Mage
    .collect 159,15,6394,1 << !Rogue !Warrior !Hunter !Shaman --Refreshing Spring Water (15)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >> 出售杂物
    .target 多克纳
    .money <0.005 << Hunter
    .money >0.1 << Rogue/Warrior/Shaman
    .itemcount 159,<15 << !Rogue !Warrior !Hunter !Shaman
step << Hunter
    #optional
    #xprate >1.49
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_（她有售）|r
    .collect 2512,400,6394,1 --Rough Arrow (400)
    .vendor >> 出售杂物
    .target 多克纳
    .money <0.002
    .itemcount 2512,<200
step << Hunter
    #optional
    #xprate >1.49
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_（她有售）|r
    .collect 2512,200,6394,1 --Rough Arrow (200)
    .vendor >> 出售杂物
    .target 多克纳
    .money <0.001
    .itemcount 2512,<200
step << Shaman
    #season 2
    #xprate >1.49
    #requires Galgar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .turnin 3084 >>符文石板 << Troll
    .turnin 3089 >>符文羊皮纸 << Orc
    .accept 77587 >>力量圣像 << Troll Shaman
    .accept 77585 >>力量圣像 << Orc Shaman
    .train 8042 >>学习 |T136026:0|t[地震术]
    .goto Durotar,42.39,69.00
    .accept 1516 >>大地的召唤
    .goto Durotar,42.40,69.17
    .target 史克里克
    .target 坎纳甘·地鸣
step << Shaman
    #season 2
    #xprate <1.5
    #requires Galgar
    .goto Durotar,42.39,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .turnin 3084 >>符文石板 << Troll
    .turnin 3089 >>符文羊皮纸 << Orc
    .accept 77587 >>力量圣像 << Troll Shaman
    .accept 77585 >>力量圣像 << Orc Shaman
    .target 史克里克
step << Shaman
    #season 0,1
    #requires Galgar
    .goto Durotar,42.39,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .turnin 3084 >>符文石板 << Troll
    .turnin 3089 >>符文羊皮纸 << Orc
    .target 史克里克
step << Mage
    #season 2
    #requires Galgar
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .turnin 3086 >>雕文石板 << Troll
    .target 迈安
step << Mage
    #season 0,1
    #requires Galgar
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .turnin 3086 >>雕文石板 << Troll
    .train 1459 >> 学习 |T135932:0|t[奥术智慧]
    .target 迈安
step << !Warlock
    #requires Galgar
	.goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .accept 792 >>邪灵劣魔
    .target 祖雷萨
step << Hunter
    #season 2
    #xprate >1.49
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 基沙
    .money <0.01
step << Hunter
    #optional
    #season 2
    #xprate >1.49
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .target 基沙
step << Hunter
    #xprate <1.5
    #season 2
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .target 基沙
step << Hunter
    #xprate >1.49
    #season 0,1
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 基沙
    .money <0.01
step << Hunter
    #optional
    #xprate >1.49
    #season 0,1
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .target 基沙
step << Hunter
    #xprate <1.5
    #season 0,1
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 3082 >>风蚀石板 << Troll
    .turnin 3087 >>风蚀羊皮纸 << Orc
    .target 基沙
step << Warrior
    #xprate >1.49
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
    .money <0.02
step << Warrior
    #xprate >1.49
    #season 2
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
    .money <0.01
step << Warrior
    #xprate >1.49
    #season 2
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .target 弗朗恩
step << Warrior
    #xprate >1.49
    #season 0,1
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
    .money <0.01
step << Warrior
    #xprate >1.49
    #season 0,1
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .target 弗朗恩
step << Warrior
    #xprate <1.5
    #season 2
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .target 弗朗恩
step << Warrior
    #xprate <1.5
    #season 0,1
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>简易羊皮纸 << Orc
    .turnin 3065 >>普通石板 << Troll
    .target 弗朗恩
step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .turnin 3085 >>神圣石板
    .accept 77642 >>洛阿的智慧
    .target 肯杰
step << Shaman
    .goto Durotar,40.47,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克赞|r交谈
    >>|cRXP_BUY_向他购买一根|r |T135154:0|t[短杖]
    .collect 2132,1,5441,1 --Collect Short Staff (1)
    .money <0.0102
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<1.9
    .target 克赞·荆条
step
    #requires Galgar << Warlock
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔兹利尔|r交谈
    .accept 5441 >>懒惰的苦工
    .target 工头塔兹利尔
step
    #completewith Sting
    >>拾取仙人掌旁的|cRXP_LOOT_仙人掌果|r
    .complete 4402,1 --Cactus Apple (10)
    .isOnQuest 4402
step
    #completewith Tails
    .goto Durotar,44.98,69.13,45,0
    .goto Durotar,45.64,65.70,45,0
    .goto Durotar,47.37,65.67,45,0
    >>|cRXP_WARN_使用|r |T133486:0|t[工头的木棒]|cRXP_WARN_敲醒沉睡的|r|cRXP_FRIENDLY_懒惰的苦工|r
    .complete 5441,1 --Peons Awoken (5)
    .target 懒惰的苦工
    .use 16114
step << !Warlock
    #completewith Imps
    >>击杀|cRXP_ENEMY_工蝎|r，拾取|cRXP_LOOT_工蝎的尾巴|r
    .complete 789,1 --Scorpid Worker Tail (10)
    .mob 工蝎
step << skip --Shaman
    #season 2
    #completewith Overload
    >>击杀|cRXP_ENEMY_邪灵劣魔|r
    .complete 792,1 --Vile Familiar (12)
    .mob 邪灵劣魔
step << skip --Hunter
    #season 2
    #completewith Sarkoth
    >>击杀|cRXP_ENEMY_邪灵劣魔|r
    .complete 792,1 --Vile Familiar (12)
    .mob 邪灵劣魔
step << !Warlock
    #label Imps
    #loop
    .goto Durotar,43.87,58.42,0
    .goto Durotar,43.87,58.42,40,0
    .goto Durotar,44.53,58.62,40,0
    .goto Durotar,45.18,58.42,40,0
    .goto Durotar,45.83,58.59,40,0
    .goto Durotar,45.79,57.43,40,0
    .goto Durotar,46.46,57.57,40,0
    .goto Durotar,47.19,57.12,40,0
    .goto Durotar,46.21,56.69,40,0
    .goto Durotar,46.28,56.11,40,0
    .goto Durotar,45.65,56.90,40,0
    .goto Durotar,45.35,56.32,40,0
    .goto Durotar,44.77,56.87,40,0
    .goto Durotar,44.58,56.10,40,0
    .goto Durotar,44.27,56.59,40,0
    .goto Durotar,43.85,55.52,40,0
    >>击杀|cRXP_ENEMY_邪灵劣魔|r
    .complete 792,1 --Vile Familiar (12)
    .mob 邪灵劣魔
step
    #label Tails
    #loop
    .goto Durotar,43.26,58.28,0
    .goto Durotar,43.26,58.28,40,0
    .goto Durotar,42.81,58.41,40,0
    .goto Durotar,41.90,58.35,40,0
    .goto Durotar,41.97,59.20,40,0
    .goto Durotar,41.36,60.35,40,0
    .goto Durotar,40.66,61.27,40,0
    .goto Durotar,40.07,61.35,40,0
    .goto Durotar,39.42,61.29,40,0
    .goto Durotar,39.46,62.17,40,0
    .goto Durotar,39.55,63.10,40,0
    .goto Durotar,40.13,64.04,40,0
    .goto Durotar,40.84,64.06,40,0
    .goto Durotar,40.74,65.86,40,0
    .goto Durotar,39.93,66.03,40,0
    .goto Durotar,40.04,66.99,40,0
    .goto Durotar,40.09,67.66,40,0
    .goto Durotar,40.13,68.50,40,0
    .goto Durotar,40.72,68.55,40,0
    .goto Durotar,41.30,67.84,40,0
    .goto Durotar,41.37,66.72,40,0
    .goto Durotar,41.89,66.05,40,0
    .goto Durotar,41.27,65.71,40,0
    .goto Durotar,41.36,64.07,40,0
    .goto Durotar,41.33,63.12,40,0
    .goto Durotar,41.35,61.98,40,0
    .goto Durotar,41.49,61.25,40,0
    .goto Durotar,41.90,60.24,40,0
    .goto Durotar,42.51,59.34,40,0
    .goto Durotar,43.08,59.62,40,0
    .goto Durotar,43.91,59.33,40,0
    .goto Durotar,45.15,59.46,40,0
    .goto Durotar,45.81,59.30,40,0
    .goto Durotar,45.85,60.34,40,0
    .goto Durotar,46.46,61.11,40,0
    .goto Durotar,47.09,62.24,40,0
    .goto Durotar,47.08,63.15,40,0
    .goto Durotar,47.14,64.08,40,0
    .goto Durotar,47.58,64.04,40,0
    .goto Durotar,47.08,63.15,40,0
    .goto Durotar,47.09,62.24,40,0
    .goto Durotar,46.90,61.15,40,0
    .goto Durotar,46.98,60.18,40,0
    .goto Durotar,47.07,59.34,40,0
    .goto Durotar,46.47,58.28,40,0
    .goto Durotar,45.81,59.30,40,0
    .goto Durotar,45.15,59.46,40,0
    .goto Durotar,43.91,59.33,40,0
    >>击杀|cRXP_ENEMY_工蝎|r，拾取|cRXP_LOOT_工蝎的尾巴|r
    .complete 789,1 --Scorpid Worker Tail (10)
    .mob 工蝎
step
    #loop
	.goto Durotar,44.98,69.13,0
	.goto Durotar,44.98,69.13,25,0
	.goto Durotar,45.64,65.70,25,0
	.goto Durotar,47.37,65.67,25,0
	.goto Durotar,46.74,60.66,25,0
	.goto Durotar,47.09,57.90,25,0
	.goto Durotar,43.90,57.79,25,0
	.goto Durotar,42.70,57.25,25,0
	.goto Durotar,41.27,58.95,25,0
	.goto Durotar,40.91,60.41,25,0
	.goto Durotar,38.83,61.84,25,0
    >>|cRXP_WARN_使用|r |T133486:0|t[工头的木棒]|cRXP_WARN_敲醒沉睡的|r|cRXP_FRIENDLY_懒惰的苦工|r
    .complete 5441,1 --Peons Awoken (5)
    .target 懒惰的苦工
    .use 16114
step
    .goto Durotar,42.73,67.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .turnin 4402 >>戈加尔的清凉果
    .target 戈加尔
    .isQuestComplete 4402
step
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（她有售）|r << !Rogue !Warrior !Hunter !Shaman
    >>|cRXP_BUY_购买|r |T132382:0|t[劣质箭]|cRXP_BUY_（她有售）|r << Hunter
    .collect 159,5,6394,1 << !Rogue !Warrior !Hunter !Shaman --Refreshing Spring Water (5)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >> 出售杂物
    .target 多克纳
    .money >0.1 << Rogue/Warrior
    .itemcount 159,<5 << !Rogue !Warrior !Hunter !Shaman
    .itemcount 2512,<600 << Hunter
step
    #label Sting
    .goto Durotar,42.29,68.39,12,0
    .goto Durotar,42.06,68.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 789,2 >>工蝎的尾巴 << Shaman
    .turnin 789 >>工蝎的尾巴 << !Shaman
    .target 高内克
step << Shaman
    #season 2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .train 8042 >> 学习 |T136026:0|t[地震术]
    .turnin 77587 >>力量圣像 << Troll Shaman
    .turnin 77585 >>力量圣像 << Orc Shaman
    .goto Durotar,42.39,69.00
    .accept 1516 >>大地的召唤
    .goto Durotar,42.40,69.17
    .target 史克里克
    .target 坎纳甘·地鸣
step << Shaman
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .train 8042 >> 学习 |T136026:0|t[地震术]
    .goto Durotar,42.39,69.00
    .accept 1516 >>大地的召唤
    .goto Durotar,42.40,69.17
    .target 史克里克
    .target 坎纳甘·地鸣
step << Mage
    #season 0,1
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .train 116 >> 学习 |T135846:0|t[寒冰箭]
    .target 迈安
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 589 >> 学习职业技能
    .money <0.021
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .money <0.011
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .money <0.01
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 589 >> 学习职业技能
    .turnin 3085 >>神圣石板
    .money <0.021
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .turnin 3085 >>神圣石板
    .money <0.011
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
    .train 589 >> 学习 |T136207:0|t[暗言术：痛]
    .turnin 3085 >>神圣石板
    .money <0.01
    .target 肯杰
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯杰|r 交谈
    .turnin 3085 >> 交任务：神圣石板
    .target 肯杰
step << !Warlock
	.goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 792 >>邪灵劣魔
    .accept 794 >>火刃奖章
    .target 祖雷萨
step << Hunter
    #season 2
    #optional
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .turnin 77590 >>崎岖地形 << Troll Hunter
    .turnin 77584 >>搜寻符文 << Orc Hunter
    .target 基沙
    .xp <4,1
step << Hunter
    #season 2
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .turnin 77590 >>崎岖地形 << Troll Hunter
    .turnin 77584 >>搜寻符文 << Orc Hunter
    .target 基沙
step << Hunter
    #season 0,1
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .train 1978 >> 学习 |T132204:0|t[毒蛇钉刺]
    .target 基沙
    .xp <4,1
    .money <0.01
step << Warrior
    #xprate <1.5
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
    .money <0.02
    .train 772,1
step << Warrior
    #xprate <1.5
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 772 >> 学习 |T132155:0|t[撕裂]
    .target 弗朗恩
step << Warrior
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 100 >> 学习 |T132337:0|t[冲锋]
    .target 弗朗恩
    .money <0.01
step
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头塔兹利尔|r交谈
    .turnin 5441 >>懒惰的苦工
    .accept 6394 >>塔兹利尔的镐
    .target 工头塔兹利尔
step
    #loop
    .goto Durotar,44.67,64.92,0
    .goto Durotar,44.67,64.92,25,0
    .goto Durotar,43.45,62.96,25,0
    .goto Durotar,43.82,62.72,25,0
    .goto Durotar,44.85,61.54,25,0
    .goto Durotar,44.88,59.66,25,0
    .goto Durotar,44.61,58.20,25,0
    .goto Durotar,45.46,58.49,25,0
    .goto Durotar,45.93,60.62,25,0
    .goto Durotar,46.87,60.36,25,0
    .goto Durotar,47.28,62.80,25,0
    .goto Durotar,46.08,62.98,25,0
    >>拾取仙人掌旁的|cRXP_LOOT_仙人掌果|r
    .complete 4402,1 --Cactus Apple (10)
    .isOnQuest 4402
step
	#completewith Thazz
    #label Cave
    .goto Durotar,45.35,56.27,30 >>进入洞穴
    .isOnQuest 6394
step
	#completewith Thazz
    #requires Cave
    .goto Durotar,45.37,55.39,15,0
    .goto Durotar,44.43,54.51,15,0
    .goto Durotar,43.72,53.79,10 >>前去找 |cRXP_LOOT_塔兹利尔的镐|r
    .isOnQuest 6394
step << Shaman
    #completewith Yarrog
    #requires Cave
    >>击杀|cRXP_ENEMY_地狱捕猎者|r，拾取|cRXP_LOOT_地狱捕猎者的蹄子|r
    .complete 1516,1 --Felstalker Hoof (2)
    .mob 地狱捕猎者
step
    #label Thazz
    .goto Durotar,43.72,53.79
    >>在墙边拾取|cRXP_LOOT_塔兹利尔的镐|r
    .complete 6394,1 --Thazz'ril's Pick (1)
step
    #label Yarrog
    .goto Durotar,42.70,52.99
    >>击杀|cRXP_ENEMY_亚罗格·刺影|r，拾取|cRXP_LOOT_火刃奖章|r
    .complete 794,1 --Burning Blade Medallion (1)
	.mob 亚罗格·刺影
step << Shaman
    #loop
	.goto Durotar,42.70,52.99,0
	.goto Durotar,42.70,52.99,25,0
	.goto Durotar,42.97,51.14,25,0
	.goto Durotar,43.56,52.05,25,0
	.goto Durotar,43.74,52.65,25,0
	.goto Durotar,44.13,52.85,25,0
	.goto Durotar,44.82,52.51,25,0
	.goto Durotar,44.83,53.40,25,0
	.goto Durotar,44.78,54.57,25,0
	.goto Durotar,45.14,55.02,25,0
	.goto Durotar,45.51,55.23,25,0
	.goto Durotar,45.14,55.02,25,0
	.goto Durotar,44.51,55.03,25,0
	.goto Durotar,44.21,54.12,25,0
	.goto Durotar,43.92,54.30,25,0
	.goto Durotar,43.87,55.22,25,0
	.goto Durotar,43.46,55.56,25,0
	.goto Durotar,43.05,55.24,25,0
	.goto Durotar,42.38,54.22,25,0
	.goto Durotar,42.53,53.48,25,0
	.goto Durotar,43.27,53.82,25,0
    >>击杀|cRXP_ENEMY_地狱捕猎者|r，拾取|cRXP_LOOT_地狱捕猎者的蹄子|r
    .complete 1516,1 --Felstalker Hoof (2)
    .mob 地狱捕猎者
step << skip
	#completewith next
    .goto Durotar,44.70,52.47
    .goto Durotar,53.55,44.68,30 >>|cRXP_WARN_将角色移动到岩石边缘，直到看起来悬空，然后退出游戏再重新登录，以此跳过一段路程|r
	.link https://www.youtube.com/watch?v=7vmnvdjbUnM >> 点击这里查看示例
step
    #softcore
    #completewith next
    .goto Durotar,44.70,52.47
    .deathskip >> |cRXP_WARN_死亡后在箭头附近的|cRXP_FRIENDLY_灵魂医者|r处复活|r
    .target 灵魂医者
step
    #softcore
    #label Betrayers
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加索克|r交谈
    >>|cRXP_WARN_可以隔着地堡外墙或者在房顶跟他对话|r
    .accept 784 >>背信弃义的人类
    .target 加索克
step
    #softcore
    .goto Durotar,51.09,42.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师托尔卡|r交谈
    .accept 815 >>恐龙蛋大餐
    .target 厨师托尔卡
step
    #softcore
    #completewith next
    .goto Durotar,50.22,43.06,12,0
    .goto Durotar,50.09,42.97,8,0
    .goto Durotar,50.20,42.30,12,0
    .goto Durotar,49.96,40.96,12,0
    .goto Durotar,49.67,40.42,10 >>朝塔楼方向走
step
    #softcore
    #completewith next
    .goto Durotar,49.75,40.38,6,0
    .goto Durotar,49.77,40.24,6,0
    .goto Durotar,49.69,40.21,6,0
    .goto Durotar,49.68,40.30,6,0
    .goto Durotar,49.78,40.34,6,0
    .goto Durotar,49.79,39.96,6,0
    .goto Durotar,49.60,40.04,8 >>沿塔楼向上走，前往弗恩·凝眉处
step
    #softcore
    .goto Durotar,49.89,40.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .accept 791 >>新的背包
    .target 弗恩·凝眉
step << Warrior/Rogue
    #softcore
    .goto Durotar,51.81,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克鲁恩|r 交谈
    .train 2575 >> 学习专业技能：|T136248:0|t[采矿]
    >>|cRXP_WARN_这样就能从矿点采集|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r，|cRXP_WARN_用来制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（武器伤害 +2，持续 30 分钟）|r
    .target 克鲁恩
step << Warrior/Rogue
    #softcore
    .goto Durotar,51.90,41.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃克|r交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄]|cRXP_BUY_（售卖者：|r|cRXP_BUY_沃克）|r
    .collect 2901,1,784,1 --Mining Pick (1)
    .target 沃克
step << Warrior/Rogue
    #softcore
    .goto Durotar,52.05,40.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜克|r 交谈
    .train 2018 >> 学习|T136241:0|t[锻造]
    .target 杜克
    .skill blacksmithing,1,1
step
    #completewith BurningBladeTurnin
    .hs >>炉石回到试炼谷
    .use 6948
step
    #xprate <1.5
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头塔兹利尔|r交谈
    .turnin 6394 >>塔兹利尔的镐
    .target 工头塔兹利尔
step
    .goto Durotar,42.73,67.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .turnin 4402 >>戈加尔的清凉果
    .target 戈加尔
    .isQuestComplete 4402
step
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >> 出售杂物
    .target 多克纳
    .money >0.03
step
    #season 2
    .goto Durotar,42.74,68.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文贩子|r交谈
    >>|cRXP_WARN_不要将可装备的物品卖给商人|r
    .vendor >> |cRXP_BUY_出售杂物，并向他购买所需的所有 |T134419:0|t|cRXP_WARN_[符文]|r|r
    .target 符文贩子
    .skipgossip
step
    #label BurningBladeTurnin
    .goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 794 >>火刃奖章
    .accept 805 >>去森金村报到
    .target 祖雷萨
step << Priest
    #season 0,1
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
	.accept 5649 >> 部族的传统
	.train 591 >>学习 |T135924:0|t[惩击]
    .train 17 >>学习 |T135940:0|t[真言术：盾]
    .target 肯杰
step << Priest
    #season 2
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯杰|r交谈
	.accept 5649 >> 部族的传统
    .train 17 >>学习 |T135940:0|t[真言术：盾]
    .target 肯杰
step << Mage
    #season 0,1
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈安|r交谈
    .train 143 >> 学习 |T135812:0|t[火球术]
    .train 2136 >>学习 |T135807:0|t[火焰冲击]
    .target 迈安
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .train 332 >>学习 |T136052:0|t[治疗波]
    .target +史克里克
    .goto Durotar,42.39,69.00
    .turnin 1516 >>大地的召唤
    .accept 1517 >>大地的召唤
    .target +坎纳甘·地鸣
    .goto Durotar,42.40,69.17
    .xp <6,1
step << Shaman
    .goto Durotar,42.40,69.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .turnin 1516 >>大地的召唤
    .accept 1517 >>大地的召唤
    .target 坎纳甘·地鸣
step << Hunter
    #season 2
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基沙|r交谈
    .train 1130 >>学习 |T132212:0|t[猎人印记]
--    .train 3044 >>Train |T132218:0|t[Arcane Shot]
    .target 基沙
    .money <0.01
step << Warrior
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .train 6343 >>学习 |T136105:0|t[雷霆一击]
    .target 弗朗恩
    .money <0.02
step << Warrior
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 3127 >>学习 |T132269:0|t[招架]
    .target 弗朗恩
step << Rogue
    #completewith RogueTraining
    .goto Durotar,42.13,68.41,15,0
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.27,68.00,12 >>朝|cRXP_FRIENDLY_鲁瓦格|r方向前进
step << Rogue
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .train 1757 >> 学习 |T136189:0|t[邪恶攻击]
    .train 1776 >> 学习 |T132155:0|t[凿击]
    .target 鲁瓦格
    .money <0.02
    .xp <6,1
step << Rogue
    #label RogueTraining
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .train 1757 >> 学习 |T136189:0|t[邪恶攻击]
    .target 鲁瓦格
    .xp <6,1
step << Warlock
    #completewith Hraug3
    .goto Durotar,42.13,68.41,15,0
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>朝|cRXP_FRIENDLY_赫劳格|r方向前进
step << Warlock
    #label Hraug3
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    >>|cRXP_BUY_购买|r |T133738:0|t[魔典：血契]|cRXP_BUY_（他有售）|r
    .collect 16321,1,817,1 --Grimoire of Blood Pact
    .vendor >>出售杂物
    .target 赫劳格
    .money <0.03
    .train 6307,1 --Blood Pact (Rank 1)
step << Warlock
    #season 2
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .train 1454 >> 学习 |T136126:0|t[生命分流]
    .turnin 77586 >>失窃的力量
    .target 纳托克
    .money <0.02
step << Warlock
    #season 2
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .turnin 77586 >>失窃的力量
    .target 纳托克
step << Warlock
    #season 0,1
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .train 1454 >> 学习 |T136126:0|t[生命分流]
    .target 纳托克
    .money <0.02
step << Warlock
    #season 0,1
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >> 学习 |T136197:0|t[暗影箭]
    .target 纳托克
step << Shaman
    #completewith CallOE1
    #label Shrine
    .goto Durotar,43.36,69.60,25,0
    .goto Durotar,43.18,70.93,25,0
    .goto Durotar,41.31,73.63,12,0
    .goto Durotar,40.82,74.37,8,0
    .goto Durotar,42.71,75.18,10,0
    .goto Durotar,43.57,75.51,15,0
    .goto Durotar,44.13,76.36,25 >>朝|cRXP_PICK_萨满圣地|r方向前进
    .isOnQuest 1517
step << Shaman
    #completewith next
    #requires Shrine
    .cast 8202 >>|cRXP_WARN_使用|r |T134743:0|t[大地灵契]
    .use 6635
step << Shaman
    #label CallOE1
    .goto Durotar,44.03,76.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大地之魂|r交谈
    .turnin 1517 >>大地的召唤
    .accept 1518 >>大地的召唤
    .target 大地之魂
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .goto Durotar,42.40,69.17
    .turnin 1518 >>大地的召唤
    .target 坎纳甘·地鸣
step << Shaman
    .goto Durotar,42.39,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .train 332 >>学习 |T136052:0|t[治疗波]
    .target 史克里克
step
    #xprate >1.49
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头塔兹利尔|r交谈
    .turnin 6394 >>塔兹利尔的镐
    .target 工头塔兹利尔
step
    #label Leave
    .goto Durotar,47.09,69.21,25,0
    .goto Durotar,49.02,69.13,20,0
    .goto Durotar,49.90,68.43,25 >>离开试炼谷
    .isOnQuest 805
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate >1.99
<< Horde
#name 7-13 Durotar
#version 1
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#defaultfor Troll/Orc
#next 13-20 The Barrens
#displayname 7-13 杜隆塔尔
step
    .goto Durotar,52.06,68.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌克尔|r 交谈
    .accept 2161 >>接受任务 苦工的重担
    .target 乌克尔
step
    #completewith next
    .subzone 367 >>前往森金村
step
    #xprate <1.5
    #loop
    .goto Durotar,54.20,73.36,0
    .goto Durotar,54.09,76.31,25,0
    .goto Durotar,54.52,74.83,25,0
    .goto Durotar,54.20,73.36,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉尔·猎齿|r 交谈。他会在附近巡逻。
    .accept 786 >>接受任务 科卡尔半人马的进攻
    .target 拉尔·猎齿
step
    #label SenjinPickups
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尔林·长牙|r、|cRXP_FRIENDLY_沃纳尔大师|r 和 |cRXP_FRIENDLY_加德林大师|r 交谈
    .accept 817 >>接受任务 生活所需的虎皮
    .target +维尔林·长牙
    .goto Durotar,55.95,73.93
    .accept 818 >>接受任务 沃纳尔大师
    .target +沃纳尔大师
    .goto Durotar,55.94,74.40
    .turnin 805 >>交任务 去森金村报到
    .accept 808 >>接受任务 明希纳的颅骨
    .accept 826 >>接受任务 扎拉赞恩
    .accept 823 >>接受任务 向奥戈尼尔报告
    .target +加德林大师
    .goto Durotar,55.94,74.72
step
    #completewith next
    .goto Durotar,56.16,74.43,8,0
    .goto Durotar,56.31,73.8,8 >> 进入大屋
step << Rogue
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_克瓦埃|r|cRXP_BUY_交谈，购买|r |T132414:0|t[增重飞斧] |cRXP_BUY_（她有售）|r
    .collect 3131,200,786,1 << !tbc
    .collect 29007,1,786,1 << tbc
    .target 克瓦埃
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Warlock/Mage/Priest
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_克瓦埃|r 交谈
    >>|cRXP_BUY_购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_（她有售）|r --Refreshing Spring Water (20)
    .collect 159,20,786,1
    .target 克瓦埃
    .money <0.010
step << Warlock/Mage/Priest
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_克瓦埃|r 交谈
    >>|cRXP_BUY_购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_（她有售）|r --Refreshing Spring Water (10)
    .collect 159,10,786,1
    .target 克瓦埃
    .money >0.001
    .money <0.005
step << Shaman
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特莱耶克|r 交谈
    .vendor >> 出售杂物。如果卖掉当前武器就能凑够购买 |T135145:0|t[学徒短杖]（5 银 04 铜）的钱，就卖掉它；如果暂时不够，稍后再回来
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一根|r |T135145:0|t[学徒短杖] |cRXP_BUY_（他有售）|r
    .collect 2495,1,786,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特莱耶克|r 交谈
    .vendor >> 出售杂物。如果卖掉当前武器就能凑够购买 |T135641:0|t[卷刃的剑]（4 银 01 铜）的钱，就卖掉它；如果暂时不够，稍后再回来
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T135641:0|t[卷刃的剑] |cRXP_BUY_（他有售）|r
    .collect 2494,1,786,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特莱耶克|r 交谈
    .vendor >> 出售杂物；如果卖掉当前武器就能凑够买一把 |T132401:0|t[双刃战斧] (4 银 84 铜) 的钱，就卖掉它。 如果暂时不够, 稍后再回来处理
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T132401:0|t[双刃战斧] |cRXP_BUY_（他有售）|r
    .collect 2491,1,786,1 --Collect Large Axe (1)
    .money <0.0484
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特莱耶克|r 交谈
    .vendor >> 出售杂物；如果卖掉当前武器就能凑够买一把 |T135421:0|t[小手斧] (5 银 40 铜) 的钱，就卖掉它。 如果暂时不够, 稍后再回来处理
    .target 特莱耶克
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T135421:0|t[小手斧] |cRXP_BUY_（他有售）|r
    .collect 2490,1,786,1 --Collect Tomahawk (1)
    .money <0.0540
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特莱耶克|r 交谈
    .vendor >> 出售杂物；如果卖掉当前武器就能凑够买一把 |T135499:0|t[角木弯弓] (2 银 83 铜) 的钱，就卖掉它。 如果钱不够, 稍后再回来
    .target 特莱耶克
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈，购买一把|r |T135499:0|t[角木弯弓] |cRXP_BUY_（他有售）|r
    .collect 2506,1,786,1 --Collect Hornwood Recurve Bow (1)
    .money <0.0283
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Rogue
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T132414:0|t[增重飞斧]
    .use 3131 << !tbc
    .use 29007 << tbc
    .itemcount 3131,1 << !tbc
    .itemcount 29007,1 << tbc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Shaman
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    #optional
    #completewith TravelToTiragarde
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Mage
    .goto Durotar,56.30,75.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_安苏瓦|r
    .train 143 >> 学习 |T135812:0|t[火球术]
    .train 2136 >>学习 |T135807:0|t[火焰冲击]
    .target 安苏瓦
step << Warrior/Rogue
    #completewith TravelToTiragarde
    +|cRXP_WARN_施放|r |T136025:0|t[寻找矿物] |cRXP_WARN_并开采找到的铜矿脉，获取|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_，用它们制作|r |T135248:0|t[磨刀石] |cRXP_WARN_。|r
    .collect 2862,1,786,1
    .skill blacksmithing,<1,1
    .train 2575,3 --Mining Trained
step << Warrior
    #xprate <2.1
    #season 2
    #loop
    .goto Durotar,50.10,79.24,0
    .goto Durotar,50.10,79.24,40,0
    .goto Durotar,47.74,80.35,40,0
    .goto Durotar,46.54,80.12,40,0
    >>击杀 |cRXP_ENEMY_科卡尔苦工|r 和 |cRXP_ENEMY_科卡尔前锋|r, 搜刮 |cRXP_LOOT_被砍下的半人马的头|r
    .collect 207062,1 --Severed Centaur Head (1)
    .mob 科卡尔苦工
    .mob 科卡尔前锋
    .train 403475,1
step
    #completewith MainIsle
    >>击杀 |cRXP_ENEMY_海蟹|r 和 |cRXP_ENEMY_龙虾人|r, 搜刮 |cRXP_LOOT_蟹胶|r 和 |cRXP_LOOT_龙虾人的眼球|r
    .complete 818,2,4 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1,2 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #completewith MainIsle
    >>击杀 |cRXP_ENEMY_杜隆塔尔猛虎|r, 搜刮 |cRXP_LOOT_杜隆塔尔虎皮|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob 杜隆塔尔猛虎
step
    #softcore
    #completewith MainIsle
    >>拾取地面上的 |cRXP_PICK_鞭尾龙蛋|r
    >>|cRXP_WARN_蛋通常由|r |cRXP_ENEMY_血爪鞭尾龙|r 守护
    .complete 815,1 --Taillasher Egg (3)
    .mob 血爪鞭尾龙
step
    #label MainIsle
    .goto Durotar,66.94,84.41,150 >>游往主岛
    .isOnQuest 826
step
    #completewith ZalazaneKill1
    >>击杀 |cRXP_ENEMY_妖术巨魔|r 和 |cRXP_ENEMY_巫毒巨魔|r
    .complete 826,1 --Hexed Troll (8)
    .mob +妖术巨魔
    .complete 826,2 --Voodoo Troll (8)
    .mob +巫毒巨魔
step
    #completewith next
    >>击杀 |cRXP_ENEMY_扎拉赞恩|r, 获取 |cRXP_LOOT_扎拉赞恩的头颅|r
    >>|cRXP_WARN_保留|r |T136026:0|t[地震术] |cRXP_WARN_，等他施放|r |T136052:0|t[治疗波]时使用 << Shaman
    >>|cRXP_WARN_保留|r |T132155:0|t[凿击] |cRXP_WARN_，等他施放|r |T136052:0|t[治疗波]时使用 << Rogue
    .complete 826,3 --Zalazane's Head (1)
    .mob 扎拉赞恩
step
    #label MinshinasSkull
    .goto Durotar,67.4,87.8
    >>拾取地上的一个 |cRXP_LOOT_明希纳的颅骨|r
    .complete 808,1 --Minshina's Skull (1)
step
    #label ZalazaneKill1
    .goto Durotar,67.4,87.8
    >>击杀 |cRXP_ENEMY_扎拉赞恩|r, 获取 |cRXP_LOOT_扎拉赞恩的头颅|r
    >>|cRXP_WARN_保留|r |T136026:0|t[地震术] |cRXP_WARN_，等他施放|r |T136052:0|t[治疗波]时使用 << Shaman
    >>|cRXP_WARN_保留|r |T132155:0|t[凿击] |cRXP_WARN_，等他施放|r |T136052:0|t[治疗波]时使用 << Rogue
    .complete 826,3 --Zalazane's Head (1)
    .mob 扎拉赞恩
step << Mage
    #season 2
    .goto Durotar,67.4,87.8
    >>击杀 |cRXP_ENEMY_扎拉赞恩|r。拾取他的|cRXP_LOOT_|T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r]|r
    .collect 203753,1
    .mob 扎拉赞恩
    .train 401765,1
step << Mage
    #optional
    #completewith End
    #season 2
    .collect 211779,1 >>若持有 |T135933:0|t[理解魔符]，现在可解读笔记；否则先继续路线，稍后在奥格瑞玛向施法材料商购买。
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IGBHNHZNAI|r] |cRXP_WARN_学习|r |T236227:0|t[寒冰指]
    .use 203753
    .train 401765,1
    .itemcount 203753,1
step
    #completewith TrollsDone
    >>击杀 |cRXP_ENEMY_杜隆塔尔猛虎|r, 搜刮 |cRXP_LOOT_杜隆塔尔虎皮|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob 杜隆塔尔猛虎
step
    #completewith TigerFur
    >>击杀 |cRXP_ENEMY_小海浪蟹|r 和 |cRXP_ENEMY_海浪蟹|r, 搜刮 |cRXP_LOOT_蟹胶|r
    >>击杀 |cRXP_ENEMY_厚壳龙虾人|r 和 |cRXP_ENEMY_巨钳龙虾人|r, 拾取它们的 |cRXP_LOOT_龙虾人的眼球|r
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #softcore
    #completewith CrawlMakru
    >>拾取地面上的 |cRXP_PICK_鞭尾龙蛋|r
    >>|cRXP_WARN_蛋通常由|r |cRXP_ENEMY_血爪鞭尾龙|r 守护
    .complete 815,1 --Taillasher Egg (3)
    .mob 血爪鞭尾龙
step
    #label TrollsDone
    #loop
    .goto Durotar,67.23,88.76,0
    .goto Durotar,67.23,88.76,40,0
    .goto Durotar,66.52,87.74,40,0
    .goto Durotar,65.94,86.72,40,0
    .goto Durotar,65.90,84.04,40,0
    .goto Durotar,65.88,82.85,40,0
    .goto Durotar,67.38,82.61,40,0
    .goto Durotar,68.42,82.43,40,0
    .goto Durotar,68.50,84.32,40,0
    .goto Durotar,68.47,86.77,40,0
    .goto Durotar,67.23,88.00,40,0
    >>击杀 |cRXP_ENEMY_妖术巨魔|r 和 |cRXP_ENEMY_巫毒巨魔|r
    .complete 826,1 --Hexed Troll (8)
    .mob +妖术巨魔
    .complete 826,2 --Voodoo Troll (8)
    .mob +巫毒巨魔
step << Priest
    #season 2
    #loop
    .goto Durotar,67.23,88.76,0
    .goto Durotar,67.23,88.76,40,0
    .goto Durotar,66.52,87.74,40,0
    .goto Durotar,65.94,86.72,40,0
    .goto Durotar,65.90,84.04,40,0
    .goto Durotar,65.88,82.85,40,0
    .goto Durotar,67.38,82.61,40,0
    .goto Durotar,68.42,82.43,40,0
    .goto Durotar,68.50,84.32,40,0
    .goto Durotar,68.47,86.77,40,0
    .goto Durotar,67.23,88.00,40,0
    >>击杀 |cRXP_ENEMY_巫毒巨魔|r, 搜刮 |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r]
    .collect 205947,1 --Prophecy of a Desecrated Citadel (1)
    .mob 巫毒巨魔
    .train 402852,1
step
    #label TigerFur
    #loop
    .goto Durotar,59.79,83.44,0
    .goto Durotar,65.27,87.86,50,0
    .goto Durotar,64.72,88.53,50,0
    .goto Durotar,64.70,84.89,50,0
    .goto Durotar,64.68,80.80,50,0
    .goto Durotar,65.35,80.11,50,0
    .goto Durotar,65.87,81.23,50,0
    .goto Durotar,60.28,80.04,50,0
    .goto Durotar,60.60,82.26,50,0
    .goto Durotar,59.88,83.51,50,0
    .goto Durotar,59.56,84.86,50,0
    .goto Durotar,60.84,88.79,50,0
    .goto Durotar,61.41,89.69,50,0
    .goto Durotar,61.48,91.37,50,0
    .goto Durotar,60.37,91.36,50,0
    .goto Durotar,59.04,90.51,50,0
    .goto Durotar,59.79,83.44,50,0
    >>击杀 |cRXP_ENEMY_杜隆塔尔猛虎|r, 搜刮 |cRXP_LOOT_杜隆塔尔虎皮|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob 杜隆塔尔猛虎
step
    #label CrawlMakru
    #loop
    .goto Durotar,62.88,93.48,0
    .goto Durotar,59.48,86.33,0
    .goto Durotar,59.92,80.80,0
    .goto Durotar,57.90,78.13,0
    .goto Durotar,53.27,83.05,0
    .goto Durotar,62.88,93.48,50,0
    .goto Durotar,59.48,86.33,50,0
    .goto Durotar,59.92,80.80,50,0
    .goto Durotar,57.90,78.13,50,0
    .goto Durotar,53.27,83.05,50,0
    >>击杀 |cRXP_ENEMY_小海浪蟹|r 和 |cRXP_ENEMY_海浪蟹|r, 搜刮 |cRXP_LOOT_蟹胶|r
    >>击杀 |cRXP_ENEMY_厚壳龙虾人|r 和 |cRXP_ENEMY_巨钳龙虾人|r, 拾取它们的 |cRXP_LOOT_龙虾人的眼球|r
    .complete 818,2 --Crawler Mucus (8)
    .mob +小海浪蟹
    .mob +海浪蟹
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +厚壳龙虾人
    .mob +巨钳龙虾人
step
    #softcore
    .goto Durotar,59.86,89.64,0
    .goto Durotar,59.51,83.64,0
    .goto Durotar,60.94,78.75,0
    .goto Durotar,63.54,74.33,0
    .goto Durotar,67.04,71.40,0
    .goto Durotar,59.86,89.64,40,0
    .goto Durotar,59.51,83.64,40,0
    .goto Durotar,60.94,78.75,40,0
    .goto Durotar,63.54,74.33,40,0
    .goto Durotar,67.04,71.40,40,0
    .goto Durotar,67.66,73.86,40,0
    .goto Durotar,68.67,74.47,40,0
    .goto Durotar,69.76,74.69,40,0
    .goto Durotar,70.29,73.31,40,0
    .goto Durotar,70.23,70.84,40,0
    .goto Durotar,69.69,70.35,40,0
    .goto Durotar,69.21,69.69,40,0
    .goto Durotar,67.74,69.86,40,0
    >>拾取地面上的 |cRXP_PICK_鞭尾龙蛋|r
    >>|cRXP_WARN_蛋通常由|r |cRXP_ENEMY_血爪鞭尾龙|r 守护
    .complete 815,1 --Taillasher Egg (3)
    .mob 血爪鞭尾龙
step
    #softcore
    #completewith next
    .goto Durotar,57.50,73.26,50,0
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活, 或直接跑回去
step
    #hardcore
    #completewith Zalazaneturnin
    .subzone 367 >>前往森金村
step
    .goto Durotar,56.48,73.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_特莱耶克|r 交谈
    >>|cRXP_WARN_跳进小屋|r
    .vendor >> 卖掉杂物并修理
    .target 特莱耶克
    .isOnQuest 808
step << Mage
    .goto Durotar,56.3,75.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_安苏瓦|r
    .train 118 >> 学习职业技能
    .target 安苏瓦
step
    #label Zalazaneturnin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加德林大师|r、|cRXP_FRIENDLY_沃纳尔大师|r 和 |cRXP_FRIENDLY_维尔林·长牙|r 交谈
    .turnin 808 >>交任务 明希纳的颅骨
    .turnin 826,2 >>交任务 扎拉赞恩 << Shaman
    .turnin 826 >>交任务 扎拉赞恩 << !Shaman
    .target +加德林大师
    .goto Durotar,55.95,74.73
    .turnin 818 >>交任务 沃纳尔大师
    .target +沃纳尔大师
    .goto Durotar,55.95,74.39
    .turnin 817 >>交任务 生活所需的虎皮
    .target +维尔林·长牙
    .goto Durotar,55.95,73.93
step << Priest
    #season 2
    .emote KNEEL,208309
    .goto Durotar,55.32,72.66
    .skipgossip 208307,1
    .aura 417316 >>在 |cRXP_PICK_洛阿祭坛|r 前跪下，并与 |cRXP_FRIENDLY_毒蛇洛阿神灵|r 交谈，获得 |T136077:0|t[洛阿神灵之思]增益效果
    .train 402852,1
step << Priest
    #season 2
    #completewith TravelToTiragarde
    .aura 418459 >>|cRXP_WARN_找到一位带有 [亡灵之思] 增益的牧师。在他面前跪下，让他以你为目标使用 /pray（祈祷），传授第二种冥想增益|r
    .use 205947
    .train 402852 >>|cRXP_WARN_使用|r |T135975:0|t[|cRXP_FRIENDLY_遭渎城堡的预言|r] |cRXP_WARN_学习|r |T237570:0|t[裂魂魔]
    .itemcount 205947,1
step
    #completewith TravelToTiragarde
    +|cRXP_WARN_将|r |T133728:0|t[微光颅骨] |cRXP_WARN_和|r |T134712:0|t[强力胶水]|cRXP_WARN_绑定到快捷键，留作紧急时使用|r
step << Rogue
    #season 2
    .goto Durotar,51.82,58.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴索|r 交谈，获得 |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r]
    >>|cRXP_WARN_他已潜行!|r
    .collect 203990,1 --Rune of Mutilation (1)
    .target 巴索
    .skipgossip
    .itemcount 207098,1
    .train 400094,1
step << Rogue
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_毁伤符文|r] |cRXP_WARN_学习|r |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
step
    #hardcore
    #completewith next
    .subzone 362 >>前往 [剃刀岭]
step
    #hardcore
    #label Betrayers
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加索克|r 交谈
    >>|cRXP_WARN_你可以隔着地堡外墙或者在房顶跟他对话|r
    .accept 784 >>接受任务 背信弃义的人类
    .target 加索克
step
    #hardcore
    #completewith next
    .goto Durotar,50.22,43.06,12,0
    .goto Durotar,50.09,42.97,8,0
    .goto Durotar,50.20,42.30,12,0
    .goto Durotar,49.96,40.96,12,0
    .goto Durotar,49.67,40.42,10 >>朝塔楼方向走
step
    #hardcore
    #completewith next
    .goto Durotar,49.75,40.38,6,0
    .goto Durotar,49.77,40.24,6,0
    .goto Durotar,49.69,40.21,6,0
    .goto Durotar,49.68,40.30,6,0
    .goto Durotar,49.78,40.34,6,0
    .goto Durotar,49.79,39.96,6,0
    .goto Durotar,49.60,40.04,8 >>沿塔往上,前往弗恩·凝眉
step
    #hardcore
    .goto Durotar,49.89,40.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .accept 791 >>接受任务 新的背包
    .target 弗恩·凝眉
step << Warrior/Rogue
    #hardcore
    .goto Durotar,51.81,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_克鲁恩|r
    .train 2575 >> 学习专业技能：|T136248:0|t[采矿]
    >>|cRXP_WARN_这使你可以从矿点获取|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r |cRXP_WARN_，用于制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（武器伤害+2，持续30分钟）|r
    .target 克鲁恩
step << Warrior/Rogue
    #hardcore
    .goto Durotar,51.90,41.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃克|r 交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄] |cRXP_BUY_（售卖者：|r |cRXP_BUY_沃克）|r
    .collect 2901,1,784,1 --Mining Pick (1)
    .target 沃克
step << Warrior/Rogue
    #hardcore
    .goto Durotar,52.05,40.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜克|r 交谈
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .target 杜克
    .skill blacksmithing,1,1
step
    #softcore
    #xprate <1.5
    #label TravelToTiragarde
    .goto Durotar,59.20,58.38,60,0
    .subzone 372 >> 前往 [提拉加德城堡]
    >>|cRXP_WARN_顺路击杀怪物|r
    .isOnQuest 784
step
    #softcore
    #xprate >1.49
    #label TravelToTiragarde
    .goto Durotar,59.20,58.38,60,0
    .subzone 372 >> 前往 [提拉加德城堡]
    .isOnQuest 784
    .maxlevel 11
step
    #hardcore
    #label TravelToTiragarde
    .goto Durotar,59.20,58.38,60,0
    .subzone 372 >> 前往提拉加德城堡
    .isOnQuest 784
    .maxlevel 11
step
    #sticky
    #completewith AgedEnvelope
    +|cRXP_WARN_注意刷新出的|r |cRXP_ENEMY_指挥官萨拉菲尔|r |cRXP_WARN_，它是9级稀有怪；必要时使用|r |T134829:0|t[初级治疗药水] |cRXP_WARN_（若你有的话）|r
    .unitscan 指挥官萨拉菲尔
step
    #completewith Benedict
    #requires TravelToTiragarde
    .goto Durotar,59.81,58.22,8,0
    .goto Durotar,59.64,58.44,8,0
    .goto Durotar,59.55,57.89,8,0
    .goto Durotar,59.29,57.89,8 >> 前往要塞二楼
step << Priest
    #season 2
    #completewith ScrapsFinished
    >>击杀 |cRXP_ENEMY_水手|r 和 |cRXP_ENEMY_海军陆战队员|r, 搜刮 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    .collect 205940,1 --Memory of a Dark Purpose (1)
    .train 425216,1
step
    #completewith AgedEnvelope
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r 和 |cRXP_ENEMY_库尔提拉斯水兵|r, 搜刮 |cRXP_LOOT_帆布脚料|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +库尔提拉斯水手
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +库尔提拉斯水兵
    .complete 791,1 --Canvas Scraps (8)
step
    #label Benedict
    .goto Durotar,59.75,58.27
    >>击杀 |cRXP_ENEMY_本尼迪克上尉|r, 搜刮 |cRXP_LOOT_本尼迪克的钥匙|r
    .complete 784,3 --Lieutenant Benedict (1)
    .collect 4882,1,830,1 --Collect Benedict's Key (1)
    .mob 本尼迪克上尉
    .maxlevel 11
step
    #label AgedEnvelope
    .goto Durotar,59.87,57.87,5,0
    .goto Durotar,59.83,57.58,5,0
    .goto Durotar,59.80,57.82,5,0
    .goto Durotar,59.94,57.82,5,0
    .goto Durotar,59.94,57.61,5,0
    .goto Durotar,59.27,57.65
    >>|cRXP_WARN_前往要塞楼上|r
    >>打开 |cRXP_PICK_本尼迪克的箱子|r, 拾取 |T133471:0|t[|cRXP_LOOT_旧信封|r]
    >>使用 |T133471:0|t[|cRXP_LOOT_旧信封|r] 开启任务
    .collect 4881,1,830 --Collect Aged Envelope (1)
    .accept 830 >>接受任务 将军的命令
    .use 4881
    .maxlevel 11
step
    #loop
    .goto Durotar,58.99,58.30,0
    .goto Durotar,57.65,58.52,30,0
    .goto Durotar,57.36,56.59,30,0
    .goto Durotar,58.10,55.52,30,0
    .goto Durotar,58.54,53.68,30,0
    .goto Durotar,56.54,54.52,30,0
    .goto Durotar,56.37,58.35,30,0
    .goto Durotar,58.99,58.30,30,0
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r 和 |cRXP_ENEMY_库尔提拉斯水兵|r, 搜刮 |cRXP_LOOT_帆布脚料|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +库尔提拉斯水手
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +库尔提拉斯水兵
    .complete 791,1 --Canvas Scraps (8)
    .mob +库尔提拉斯水兵
    .mob +库尔提拉斯水手
    .itemcount 4870,<8 --Canvas Scraps (<8)
    .maxlevel 11
step
    #optional
    #loop
    .goto Durotar,58.99,58.30,0
    .goto Durotar,57.65,58.52,30,0
    .goto Durotar,57.36,56.59,30,0
    .goto Durotar,58.10,55.52,30,0
    .goto Durotar,58.54,53.68,30,0
    .goto Durotar,56.54,54.52,30,0
    .goto Durotar,56.37,58.35,30,0
    .goto Durotar,58.99,58.30,30,0
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r 和 |cRXP_ENEMY_库尔提拉斯水兵|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +库尔提拉斯水手
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +库尔提拉斯水兵
    .maxlevel 11
step
    #label ScrapsFinished
    #loop
    .goto Durotar,58.99,58.30,0
    .goto Durotar,57.65,58.52,30,0
    .goto Durotar,57.36,56.59,30,0
    .goto Durotar,58.10,55.52,30,0
    .goto Durotar,58.54,53.68,30,0
    .goto Durotar,56.54,54.52,30,0
    .goto Durotar,56.37,58.35,30,0
    .goto Durotar,58.99,58.30,30,0
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r 和 |cRXP_ENEMY_库尔提拉斯水兵|r, 搜刮 |cRXP_LOOT_帆布脚料|r
    .complete 791,1 --Canvas Scraps (8)
    .mob 库尔提拉斯水手
    .mob 库尔提拉斯水兵
    .maxlevel 11
step << Priest
    #season 2
    #loop
    .goto Durotar,58.99,58.30,0
    .goto Durotar,57.65,58.52,30,0
    .goto Durotar,57.36,56.59,30,0
    .goto Durotar,58.10,55.52,30,0
    .goto Durotar,58.54,53.68,30,0
    .goto Durotar,56.54,54.52,30,0
    .goto Durotar,56.37,58.35,30,0
    .goto Durotar,58.99,58.30,30,0
    >>击杀 |cRXP_ENEMY_水手|r 和 |cRXP_ENEMY_海军陆战队员|r, 搜刮 |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r]
    .collect 205940,1 --Memory of a Dark Purpose (1)
    .train 425216,1
    .mob 库尔提拉斯水手
    .mob 库尔提拉斯水兵
    .maxlevel 11
step << Priest
    #season 2
    #completewith next
    .goto Durotar,55.32,72.66
    .emote KNEEL,208309
    .aura 417316 >>在 |cRXP_PICK_洛阿祭坛|r 前跪下，并与 |cRXP_FRIENDLY_毒蛇洛阿神灵|r 交谈，获得 |T136077:0|t[洛阿神灵之思]增益效果
    .skipgossip 208307,1
    .target 毒蛇洛阿神灵
    .train 425216,1
step << Priest
    #season 2
    .use 205940
    .itemcount 205940,1
    .train 425216 >>|cRXP_WARN_使用|r |T136222:0|t[|cRXP_FRIENDLY_黑暗意图的回忆|r] |cRXP_WARN_学习|r |T237514:0|t[虚空疫病]
step
    #softcore
    #completewith RazorTurnins1
    .goto Durotar,57.3,53.5,120,0
    .deathskip >> 在提拉加德城堡外的北塔死一次, 然后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step
    #hardcore
    #completewith next
    .subzone 362 >>前往 [剃刀岭]
step
    #xprate <2.1
    .goto Durotar,52.24,43.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔·魂痕|r 对话
    .turnin 823 >>交任务 向奥戈尼尔报告
    .accept 806 >>接受任务 黑暗风暴
    .target 奥戈尼尔·魂痕
step
    #xprate >2.09
    .goto Durotar,52.24,43.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔·魂痕|r 对话
    .turnin 823 >>交任务 向奥戈尼尔报告
    .target 奥戈尼尔·魂痕
step
    #xprate <2.1
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加索克|r 交谈
    .turnin 784 >>交任务 背信弃义的人类
    .target 加索克
    .isQuestComplete 784
step
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加索克|r 交谈
    .turnin 830 >> 交任务：将军的命令
    .target 加索克
    .isOnQuest 830
step
    #xprate <2.1
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加索克|r 对话
    .accept 831 >>接受任务 将军的命令 << !Mage !Shaman
    .accept 837 >>接受任务 野猪人的进犯
    .target 加索克
    .isQuestTurnedIn 830
step
    #xprate >2.09
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加索克|r 交谈
    .turnin 784 >>交任务 背信弃义的人类
    .target 加索克
    .isQuestComplete 784
step
    #xprate >2.09
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加索克|r 对话
    .accept 831 >>接受任务 将军的命令
    .target 加索克
    .isQuestTurnedIn 830
step
    #xprate <2.1
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加索克|r 交谈
    .accept 837 >> 接任务：野猪人的进犯
    .target 加索克
step
    .goto Durotar,51.09,42.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厨师托尔卡|r 对话
    .turnin 815 >>交任务 恐龙蛋大餐
    .target 厨师托尔卡
    .isQuestComplete 815
step
    #completewith next
    .goto Durotar,50.22,43.06,12,0
    .goto Durotar,50.09,42.97,8,0
    .goto Durotar,50.20,42.30,12,0
    .goto Durotar,49.96,40.96,12,0
    .goto Durotar,49.67,40.42,10 >>朝塔楼方向走
step
    #completewith next
    .goto Durotar,49.75,40.38,6,0
    .goto Durotar,49.77,40.24,6,0
    .goto Durotar,49.69,40.21,6,0
    .goto Durotar,49.68,40.30,6,0
    .goto Durotar,49.78,40.34,6,0
    .goto Durotar,49.79,39.96,6,0
    .goto Durotar,49.60,40.04,8 >>沿塔往上,前往弗恩·凝眉
step
    .goto Durotar,49.89,40.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .turnin 791 >>交任务 新的背包
    .target 弗恩·凝眉
step << Warrior/Rogue
    .goto Durotar,51.81,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_克鲁恩|r
    .train 2575 >> 学习专业技能：|T136248:0|t[采矿]
    >>|cRXP_WARN_这使你可以从矿点获取|r |T135232:0|t|cRXP_LOOT_[劣质的石头]|r |cRXP_WARN_，用于制作|r |T135248:0|t[磨刀石] |cRXP_WARN_（武器伤害+2，持续30分钟）|r
    .target 克鲁恩
step << Warrior/Rogue
    .goto Durotar,51.90,41.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃克|r 交谈
    >>|cRXP_BUY_购买一把|r |T134708:0|t[矿工锄] |cRXP_BUY_（售卖者：|r |cRXP_FRIENDLY_沃克|r）
    .collect 2901,1,825,1 --Mining Pick (1)
    .target 沃克
step << Warrior/Rogue
    .goto Durotar,52.05,40.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜克|r 交谈
    .train 2018 >> 学习 |T136241:0|t[锻造]
    .target 杜克
    .skill blacksmithing,1,1
step << Shaman
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尤加尔|r 交谈
    .vendor >> 出售杂物。如果卖掉当前武器就能凑够购买 |T135145:0|t[学徒短杖]（5 银 04 铜）的钱，就卖掉它；如果暂时不够，稍后再回来
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Shaman
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，购买一根|r |T135145:0|t[学徒短杖] |cRXP_BUY_（他有售）|r
    .collect 2495,1,825,1 --Collect Walking Stick (1)
    .money <0.0504
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尤加尔|r 交谈
    .vendor >> 出售杂物。如果卖掉当前武器就能凑够购买 |T135641:0|t[卷刃的剑]（4 银 01 铜）的钱，就卖掉它；如果暂时不够，稍后再回来
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，购买一把|r |T135641:0|t[卷刃的剑] |cRXP_BUY_（他有售）|r
    .collect 2494,1,825,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尤加尔|r 交谈
    .vendor >> 出售杂物；如果卖掉当前武器就能凑够买一把 |T132401:0|t[双刃战斧] (4 银 84 铜) 的钱，就卖掉它。 如果暂时不够, 稍后再回来处理
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，购买一把|r |T132401:0|t[双刃战斧] |cRXP_BUY_（他有售）|r
    .collect 2491,1,825,1 --Collect Large Axe (1)
    .money <0.0484
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尤加尔|r 交谈
    .vendor >> 出售杂物；如果卖掉当前武器就能凑够买一把 |T135421:0|t[小手斧] (5 银 40 铜) 的钱，就卖掉它。 如果暂时不够, 稍后再回来处理
    .target 尤加尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈，购买一把|r |T135421:0|t[小手斧] |cRXP_BUY_（他有售）|r
    .collect 2490,1,825,1 --Collect Tomahawk (1)
    .money <0.0540
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    #optional
    #completewith End
    +|cRXP_WARN_装备|r |T132414:0|t[增重飞斧]
    .use 3131 << !tbc
    .use 29007 << tbc
    .itemcount 3131,1 << !tbc
    .itemcount 29007,1 << tbc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Shaman
    #optional
    #completewith End
    +|cRXP_WARN_装备|r |T135145:0|t[学徒短杖]
    .use 2495
    .itemcount 2495,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Rogue
    #optional
    #completewith End
    +|cRXP_WARN_装备|r |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #optional
    #completewith End
    +|cRXP_WARN_装备|r |T132401:0|t[双刃战斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #optional
    #completewith End
    +|cRXP_WARN_装备|r |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Hunter
    .goto Durotar,52.97,41.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格劳特|r
    .vendor >> 出售杂物；如果卖掉当前武器就能凑够买一把 |T135499:0|t[角木弯弓] (2 银 83 铜) 的钱，就卖掉它。 如果钱不够, 稍后再回来
    .target 格劳特
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    .goto Durotar,52.97,41.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_格劳特|r|cRXP_BUY_交谈，购买一把|r |T135499:0|t[角木弯弓] |cRXP_BUY_（他有售）|r
    .collect 2506,1,825,1 --Collect Hornwood Recurve Bow (1)
    .money <0.0283
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    #optional
    #completewith End
    +|cRXP_WARN_装备|r |T135499:0|t[角木弯弓]
    .use 2506
    .itemcount 2506,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.3
step << Hunter
    .goto Durotar,52.97,41.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_格劳特|r交谈，购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_（他有售）|r
    .collect 2515,1200,6082,1 --Sharp Arrow (1200)
    --.collect 11362,1,6082,1 --Medium Quiver (1)
    .target 格劳特
    --.money <0.1300
step << Hunter
    .goto Durotar,52.97,41.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_格劳特|r交谈，购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_（他有售）|r
    .collect 2515,1200,6082,1 --Sharp Arrow (1200)
    .target 格劳特
    .itemcount 2515,<600 --Sharp Arrow (600)
step
    #label RazorTurnins1
    .goto Durotar,51.51,41.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板格罗斯克|r
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（他有售）|r << Mage/Warlock/Priest/Shaman
    >>|cRXP_BUY_购买|r |T133974:0|t[肉排] |cRXP_BUY_（他有售）|r << Rogue/Warrior
    .vendor >> 卖掉杂物
    .home >> 将你的炉石设置为剃刀岭
    .turnin 2161 >>交任务：苦工的重担
    .target 旅店老板格罗斯克
step << Priest
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_泰金|r
    .turnin 5649 >> 交任务：部族的传统
    .accept 5648 >> 接任务：灵魂之衣
    .train 1243 >> 学习 |T135987:0|t[真言术：韧]，稍后为步兵科雅施放
    .train 2052 >> 学习 |T135929:0|t[次级治疗术(2级)]
    .target 泰金
step << Priest
    .goto Durotar,53.10,46.46
    >>施放 |T135929:0|t[次级治疗术] 和 |T135987:0|t[真言术：韧]，目标为 |cRXP_FRIENDLY_科雅|r
    .complete 5648,1 --Heal and fortify Grunt Kor'ja
    .target 步兵科雅
step << Priest
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_泰金|r
    .turnin 5648 >>交任务：灵魂之衣
    .trainer >> 学习职业技能
    .target 泰金
step << Rogue/Warrior
    .goto Durotar,54.17,41.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_拉乌克|r
    .train 3273 >>学习 |T135966:0|t[急救]
    .money <0.01
    .target 拉乌克
step
    .goto Durotar,54.39,42.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_加尔克|r
    >>|cRXP_BUY_购买一个|r |T133634:0|t[棕色小包] |cRXP_BUY_（售卖者：|r |cRXP_BUY_加尔克）|r
    .collect 4496,1,825,1 --Small Brown Pouch (1)
    .target 加尔克
    .money <0.05
step << Shaman
    #xprate >1.49
    .goto Durotar,54.42,42.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_斯瓦特|r
    .train 8050 >> 学习职业技能
    .accept 2983 >>接任务：火焰的召唤
    .target 斯瓦特
    .isNotOnQuest 1522
step << Warrior
    #xprate >1.49
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塔绍尔·锯痕|r
    .accept 1505 >>接任务：老兵犹塞克
    .trainer >> 学习职业技能
    .target 塔绍尔·锯痕
step << Warlock
    #xprate >1.49
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杜格鲁·血怒|r
    .accept 1506 >>接任务：甘鲁尔的召唤
    .trainer >> 学习职业技能
    .target 杜格鲁·血怒
step << Warlock
    #xprate >1.49
    .goto Durotar,54.70,41.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基萨|r 交谈并购买 |T133738:0|t[魔典：火焰箭（等级2）]
    .collect 16302,1,837,1 --Grimoire of Firebolt (Rank 2) (1)
    .target 基萨
    .money <0.01
    .train 7799,1
step << Priest
    #xprate >1.49
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_泰金|r
    .accept 5654 >> 接任务：虚弱妖术 << Troll
    .accept 5660 >> 接任务：虚弱之触 << Undead
    .trainer >> 学习职业技能
    .target 泰金
step << Rogue
    #xprate >1.49
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_卡普拉克|r
    .train 674 >> 学习职业技能
    .target 卡普拉克
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_索塔尔|r
    .accept 6062 >>接任务：驯服野兽
    .trainer >> 学习职业技能
    .target 索塔尔
step << Hunter
    #loop
    .goto Durotar,51.65,56.51,0
    .goto Durotar,51.76,48.41,40,0
    .goto Durotar,51.70,50.23,40,0
    .goto Durotar,51.65,51.34,40,0
    .goto Durotar,51.80,53.18,40,0
    .goto Durotar,50.82,53.65,40,0
    .use 15917 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_，对|r|cRXP_ENEMY_可怕的杂斑野猪|r|cRXP_WARN_施放，站在最大施法距离。|r
    .complete 6062,1 --Tame a Dire Mottled Boar
    .mob 可怕的杂斑野猪
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_索塔尔|r
    .turnin 6062 >>交任务 驯服野兽
    .accept 6083 >>接受任务 驯服野兽
    .target 索塔尔
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_索塔尔|r
    .accept 6083 >>接受任务 驯服野兽
    .target 索塔尔
step << Hunter
    #completewith next
    +|cRXP_WARN_解散|cRXP_ENEMY_可怕的杂斑野猪|r：右键点击它的头像并选择“解散”，否则无法驯服|r|cRXP_ENEMY_海浪蟹|r
step << Hunter
    #loop
    .goto Durotar,59.63,23.38,0
    .goto Durotar,59.18,28.35,40,0
    .goto Durotar,59.89,26.42,40,0
    .goto Durotar,60.04,24.79,40,0
    >>|cRXP_WARN_不要杀死你看到的|r |cRXP_ENEMY_硬甲蝎|r |cRXP_WARN_，之后还要用到它们|r
    .use 15919 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_，对|r|cRXP_ENEMY_海浪蟹|r|cRXP_WARN_施放，站在最大施法距离。|r
    .complete 6083,1 --Tame a Surf Crawler
    .mob 海浪蟹
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_索塔尔|r
    .turnin 6083 >>交任务 驯服野兽
    .accept 6082 >>接受任务 驯服野兽
    .target 索塔尔
step << Hunter
    #completewith next
    +|cRXP_WARN_解散|cRXP_ENEMY_海浪蟹|r：右键点击它的头像并选择“解散”，否则无法驯服|r|cRXP_ENEMY_硬甲蝎|r
step << Hunter
    #loop
    .goto Durotar,54.84,36.94,0
    .goto Durotar,54.84,36.94,40,0
    .goto Durotar,54.01,33.81,40,0
    .goto Durotar,54.22,30.50,40,0
    .goto Durotar,55.71,30.66,40,0
    .goto Durotar,56.19,29.28,40,0
    .goto Durotar,56.95,27.28,40,0
    .goto Durotar,57.15,25.59,40,0
    .use 15920 >> |cRXP_WARN_使用|r |T132164:0|t[驯兽棒]|cRXP_WARN_，对|r|cRXP_ENEMY_硬甲蝎|r|cRXP_WARN_施放，站在最大施法距离。|r
    .complete 6082,1 --Tame an Armored Scorpid
    .mob 硬甲蝎
step << Hunter
    .goto Durotar,51.85,43.49
    >>进入掩体
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话里面的 |cRXP_FRIENDLY_索塔尔|r
    .turnin 6082 >>交任务 驯服野兽
    .accept 6081 >>接受任务 训练野兽
    .target 索塔尔
step << Hunter
    #completewith ConscriptH
    +|cRXP_WARN_将|r |T132164:0|t[驯服野兽]|cRXP_WARN_、|r |T136095:0|t[解散宠物]|cRXP_WARN_和|r |T132161:0|t[召唤宠物] |cRXP_WARN_放到动作条上|r
step << Hunter
    .goto Durotar,51.13,42.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞姆塔克|r
    >>|cRXP_BUY_购买|r |T133972:0|t[硬肉干] |cRXP_BUY_（他有售）|r。|cRXP_BUY_之后给宠物喂食时会用到|r
    .vendor >> 卖掉杂物
    .collect 117,5,828,1 --Tough Jerky (5)
    .target 格瑞姆塔克
    .isQuestAvailable 834 --Winds in the Desert
step << !Hunter
    .goto Durotar,51.13,42.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_格瑞姆塔克|r
	.vendor >>|cRXP_BUY_卖掉杂物, 按需补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉杂物, 按需补充食物|r << Rogue/Warrior
    .target 格瑞姆塔克
step
    #label ConscriptH
    #xprate >1.49
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔克林·寻路者|r 交谈
    .accept 840 >>接受任务 部落的新兵
    .target 塔克林·寻路者
step
    #xprate <2.1
    #loop
    .goto Durotar,49.22,48.96,0
    .goto Durotar,50.21,50.78,40,0
    .goto Durotar,49.48,49.14,40,0
    .goto Durotar,48.49,49.29,40,0
    .goto Durotar,47.06,49.53,40,0
    >>击杀 |cRXP_ENEMY_钢鬃野猪人|r 和 |cRXP_ENEMY_钢鬃斥候|r，完成野猪人的进犯的前两项目标
    .complete 837,1
    .mob +钢鬃野猪人
    .complete 837,2
    .mob +钢鬃斥候
    .isOnQuest 837
step
    #xprate <2.1
    #loop
	.goto Durotar,44.45,39.74,0
	.goto Durotar,44.45,39.74,50,0
	.goto Durotar,44.49,37.47,50,0
	.goto Durotar,43.30,37.32,50,0
	.goto Durotar,41.70,37.09,50,0
	.goto Durotar,41.64,38.27,50,0
	.goto Durotar,41.94,40.46,50,0
	.goto Durotar,43.30,40.40,50,0
    >>击杀 |cRXP_ENEMY_钢鬃传令兵|r 和 |cRXP_ENEMY_钢鬃卫兵|r
    .complete 837,3 --Razormane Dustrunner (4)
    .mob +钢鬃传令兵
    .complete 837,4 --Razormane Battleguard (4)
    .mob +钢鬃卫兵
    .isOnQuest 837
step << Warrior
    #season 2
    #xprate <2.1
    #loop
    .goto Durotar,49.22,48.96,0
    .goto Durotar,50.21,50.78,30,0
    .goto Durotar,50.18,49.23,30,0
    .goto Durotar,49.48,49.14,30,0
    .goto Durotar,49.32,48.18,30,0
    .goto Durotar,48.81,49.00,30,0
    .goto Durotar,48.49,49.29,30,0
    .goto Durotar,47.58,49.62,30,0
    .goto Durotar,47.06,49.53,30,0
    .goto Durotar,46.90,48.11,30,0
    .goto Durotar,49.22,48.96,30,0
    >>击杀 |cRXP_ENEMY_钢鬃野猪人|r 和 |cRXP_ENEMY_钢鬃斥候|r, 搜刮 |cRXP_LOOT_被砍下的野猪人的头|r
    .collect 206994,1 ---Severed Quilboar Head (1)
    .complete 837,1 --Razormane Quilboar (4)
    .mob +钢鬃野猪人
    .complete 837,2 --Razormane Scout (4)
    .mob +钢鬃斥候
    .train 403475,1
step << Warrior/Shaman
    #xprate <2.1
    #completewith next
    .goto The Barrens,62.26,19.38,40 >> 前往 [前沿哨所]
    .zoneskip The Barrens
step << Warrior/Shaman
    #xprate <2.1
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡加尔·战痕|r 交谈
    .turnin 840 >>交任务 部落的新兵
    .accept 842 >>接受任务 十字路口征兵
    .target 卡加尔·战痕
step
    #xprate >2.09
    #completewith next
    .goto The Barrens,62.26,19.38,40 >> 前往 [前沿哨所]
    .zoneskip The Barrens
step
    #xprate >2.09
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡加尔·战痕|r 交谈
    .turnin 840 >>交任务 部落的新兵
    .accept 842 >>接受任务 十字路口征兵
    .target 卡加尔·战痕
step << Warrior
    #xprate >1.49
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_犹塞克|r
    .turnin 1505 >>交任务 老兵犹塞克
    .accept 1498 >>接受任务 防御之道
    .target 犹塞克
step << Shaman
    #xprate >1.49
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_卡纳尔|r
    .turnin 2983 >>交任务  火焰的召唤
    .accept 1524 >>接受任务 火焰的召唤
    .target 卡纳尔·菲斯
step << Shaman
    #xprate >1.49
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
    .goto Durotar,39.16,58.56,10 >> 沿山路上行，前往 |cRXP_FRIENDLY_泰尔夫·祖拉姆|r 处
    >>|cRXP_WARN_小心别从山上掉下去, 路非常狭窄. 一旦坠落, 可能会死亡|r
step << Shaman
    #xprate >1.49
    #label CallofFire3
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泰尔夫·祖拉姆|r 对话
    .turnin 1524 >>交任务 火焰的召唤
    .accept 1525 >>接受任务 火焰的召唤
    .target 泰尔夫·祖拉姆
step << Warrior
    #xprate >1.49
    #loop
    .goto Durotar,43.19,24.34,0
    .goto Durotar,39.16,30.84,40,0
    .goto Durotar,39.23,28.38,40,0
    .goto Durotar,39.43,24.94,40,0
    .goto Durotar,41.39,24.28,40,0
    .goto Durotar,43.19,24.34,40,0
    >>进入雷霆山，击杀 |cRXP_ENEMY_闪电蜥蜴|r，拾取它们的 |cRXP_ENEMY_鳞片|r
    .complete 1498,1 --Singed Scale (5)
    .mob 闪电蜥蜴
step << !Warrior
    #xprate <2.1
    #completewith next
    .goto Durotar,41.66,25.68,20 >>跳入雷霆山 << !Hunter !Warlock
    .goto Durotar,41.66,25.68,20 >>|cRXP_WARN_右键点击|r |T136218:0|t[小鬼] |cRXP_WARN_的宠物头像并选择“解散”|r << Warlock
    .goto Durotar,41.66,25.68,20 >>|cRXP_WARN_施放|r |T136095:0|t[解散宠物]|cRXP_WARN_, 然后跳入 [雷霆山]|r << Hunter
step
    #xprate <2.1
    #softcore
    .goto Durotar,42.13,26.67
    >>击杀 |cRXP_ENEMY_费索·暗雷|r，拾取他的 |cRXP_LOOT_费索的爪子|r
    >>|cRXP_WARN_小心。先击杀巡逻的|r |cRXP_ENEMY_火刃狂热者|r |cRXP_WARN_以及他后方的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_，再拉费索|r
    >>|cRXP_WARN_把他往后拉，带到你刚杀死的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_附近，否则可能意外引来其他火刃怪|r
    >>|cRXP_WARN_别担心为了拿到|cRXP_LOOT_费索的爪子|r而死，之后会在|cRXP_FRIENDLY_灵魂医者|r处复活|r
    >>|cRXP_WARN_先击杀小鬼。施放|r |T132155:0|t[凿击] |cRXP_WARN_打断费索·暗雷的|r |T136169:0|t[灵魂虹吸] << Rogue
    >>|cRXP_WARN_先击杀小鬼。施放|r |T136026:0|t[地震术] |cRXP_WARN_打断费索·暗雷的|r |T136169:0|t[灵魂虹吸] << Shaman
    >>|cRXP_WARN_你可以施放|r |T136071:0|t[变形术] |cRXP_WARN_控制|r |cRXP_ENEMY_费索·暗雷|r |cRXP_WARN_，然后先击杀|r |cRXP_ENEMY_小鬼|r |cRXP_WARN_|r << Mage
    >>|cRXP_WARN_先击杀小鬼|r << Warrior/Warlock/Priest
    >>|cRXP_WARN_如有，使用|r |T134829:0|t[初级治疗药水] |cRXP_WARN_，必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << !Warlock
    >>|cRXP_WARN_使用|r |T134829:0|t[初级治疗药水] 和 |T133728:0|t[初级治疗石] |cRXP_WARN_（如有），必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << Warlock
    .complete 806,1 --Fizzle's Claw (1)
    .mob 费索·暗雷
    .mob 小鬼爪牙
    .mob 火刃狂热者
    .mob 闪电蜥蜴
step
    #xprate <2.1
    #hardcore
    .goto Durotar,42.13,26.67
    >>击杀 |cRXP_ENEMY_费索·暗雷|r，拾取他的 |cRXP_LOOT_费索的爪子|r
    >>|cRXP_WARN_小心。先击杀巡逻的|r |cRXP_ENEMY_火刃狂热者|r |cRXP_WARN_以及他后方的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_，再拉费索|r
    >>|cRXP_WARN_把他往后拉，带到你刚杀死的|r |cRXP_ENEMY_闪电蜥蜴|r |cRXP_WARN_附近，否则可能意外引来其他火刃怪|r
    >>|cRXP_WARN_先击杀小鬼。施放|r |T132155:0|t[凿击] |cRXP_WARN_打断费索·暗雷的|r |T136169:0|t[灵魂虹吸] << Rogue
    >>|cRXP_WARN_先击杀小鬼。施放|r |T136026:0|t[地震术] |cRXP_WARN_打断费索·暗雷的|r |T136169:0|t[灵魂虹吸] << Shaman
    >>|cRXP_WARN_你可以施放|r |T136071:0|t[变形术] |cRXP_WARN_控制|r |cRXP_ENEMY_费索·暗雷|r |cRXP_WARN_，然后先击杀|r |cRXP_ENEMY_小鬼|r |cRXP_WARN_|r << Mage
    >>|cRXP_WARN_先击杀小鬼|r << Warrior/Warlock/Priest
    >>|cRXP_WARN_如有，使用|r |T134829:0|t[初级治疗药水] |cRXP_WARN_，必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << !Warlock
    >>|cRXP_WARN_使用|r |T134829:0|t[初级治疗药水] 和 |T133728:0|t[初级治疗石] |cRXP_WARN_（如有），必要时使用|r |T133728:0|t[微光颅骨] |cRXP_WARN_|r << Warlock
    .complete 806,1 --Fizzle's Claw (1)
    .mob 费索·暗雷
    .mob 小鬼爪牙
    .mob 火刃狂热者
    .mob 闪电蜥蜴
step
    #xprate <2.1
    #softcore
    .goto Durotar,47.04,17.58
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .isQuestComplete 806
step
    #xprate <2.1
    #hardcore
    .goto Durotar,39.20,32.02,60 >> 从 [雷霆山] 突围出来
    .isQuestComplete 806
step
    #xprate <2.1
    #completewith next
    .goto Durotar,46.37,22.94,50 >> 前往雷兹拉克
step
    #xprate <2.1
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷兹拉克|r
    .accept 834 >>接受任务 沙漠之风
    .target 雷兹拉克
step << Warrior
    #xprate <2.1
    #season 2
    #completewith next
    >>击杀 |cRXP_ENEMY_尘风鹰身人|r，拾取 |cRXP_LOOT_被砍下的鹰身人的头|r
    .collect 206995,1 ---Severed Harpy Head (1)
    .mob 尘风暴徒
    .mob 尘风雷巫
    .mob 尘风抢劫者
    .mob 尘风鹰身人
    .train 403475,1
step
    #xprate <2.1
    #loop
    .goto Durotar,49.70,21.90,0
    .goto Durotar,49.70,21.90,40,0
    .goto Durotar,49.70,24.33,40,0
    .goto Durotar,50.13,25.70,40,0
    .goto Durotar,50.85,25.96,40,0
    .goto Durotar,51.65,27.67,40,0
    .goto Durotar,49.85,27.07,40,0
    .goto Durotar,50.68,31.55,40,0
    .goto Durotar,48.10,34.36,40,0
    .goto Durotar,47.35,33.40,40,0
    .goto Durotar,48.49,32.01,40,0
    .goto Durotar,47.19,30.87,40,0
    >>拾取地上的 |cRXP_PICK_被盗的补给袋|r
    .complete 834,1 --Sack of Supplies (5)
step << Warrior
    #xprate <2.1
    #season 2
    #loop
    .goto Durotar,53.98,23.70,0
    .goto Durotar,54.02,27.23,40,0
    .goto Durotar,52.82,24.27,40,0
    .goto Durotar,51.85,23.95,40,0
    .goto Durotar,54.01,23.63,40,0
    .goto Durotar,52.13,20.77,40,0
    .goto Durotar,51.26,19.19,40,0
    .goto Durotar,53.98,23.70,40,0
    >>击杀 |cRXP_ENEMY_尘风鹰身人|r，拾取 |cRXP_LOOT_被砍下的鹰身人的头|r
    .collect 206995,1 ---Severed Harpy Head (1)
    .mob 尘风暴徒
    .mob 尘风雷巫
    .mob 尘风抢劫者
    .mob 尘风鹰身人
    .train 403475,1
step
    #xprate <2.1
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷兹拉克|r
    .turnin 834 >>交任务 沙漠之风
    .target 雷兹拉克
step << Shaman
    #xprate <2.1
    #completewith next
    .goto Durotar,49.42,18.47,40,0
    .goto Durotar,51.35,16.76,40,0
    .goto Durotar,54.65,19.02,40,0
    .goto Durotar,55.86,28.31,40,0
    .subzone 371 >>前往 [尘风洞穴]
    >>|cRXP_WARN_向东绕过山丘到达洞穴. 请跟随地图上的航点箭头指引|r
step << Shaman
    #xprate <2.1
    #loop
    .goto Durotar,53.18,29.15,0
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    .goto Durotar,51.90,25.70,12,0
    >>击杀 |cRXP_ENEMY_火刃祭司|r, 搜刮 |cRXP_LOOT_试剂袋|r
    .complete 1525,2 --Reagent Pouch (1)
    .mob 火刃祭司
step << Mage
    #xprate <2.1
    #season 2
    #loop
    .goto Durotar,52.93,9.01,0
    .goto Durotar,54.96,9.69,30,0
    .goto Durotar,54.69,8.73,30,0
    .goto Durotar,53.78,9.14,30,0
    .goto Durotar,52.93,9.01,30,0
    >>在骷髅石洞内击杀 |cRXP_ENEMY_火刃兽人|r，拾取他们的 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN|r]
    .collect 203752,1 --Spell Notes: MILEGIN VALF (1)
    .mob 火刃狂热者
    .mob 火刃学徒
    .train 401768,1
    --Living Flame Rune
step << Warrior/Shaman
    #xprate >2.09
    #completewith next
    .goto The Barrens,62.26,19.38,40 >> 前往 [前沿哨所]
    .zoneskip The Barrens
step << Warrior
    #xprate >2.09
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_犹塞克|r
    .turnin 1498 >>交任务 防御之道
    .accept 1502 >>接任务：索恩格瑞姆·火眼
    .target 犹塞克
step
    #xprate >2.09
    #softcore
    #completewith CrossroadsPickups
    .goto The Barrens,50.72,32.61
    .deathskip >> 死亡并在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .subzoneskip 380
step
    #xprate >2.09
    #hardcore
    #completewith CrossroadsPickups
    .goto The Barrens,52.34,29.27,150 >> 前往十字路口 (贫瘠之地)
step
    #xprate >2.09
    #label CrossroadsPickups
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_索克|r
    .accept 871 >>接受任务 野猪人的袭击
    .accept 5041 >>接受任务 十字路口的补给品
    .target 索克
step
    #xprate >2.09
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_瑟格拉·黑棘|r
    .turnin 842 >>交任务 十字路口征兵
    .accept 844 >>接受任务 平原陆行鸟的威胁
    .target 瑟格拉·黑棘
step
    #xprate >2.09
    .goto The Barrens,52.62,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_扎尔夫|r
    .accept 6365 >>接受任务 送往奥格瑞玛的肉
    .target 扎尔夫
step
    #xprate >2.09
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r 交谈
    .home >> 将你的炉石设置为十字路口
    .target 旅店老板伯兰德·草风
    .bindlocation 380
    .subzoneskip 380,1
step
    #xprate >2.09
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_迪弗拉克|r
    .fp The Crossroads >> 获取十字路口飞行点
    .turnin 6365 >>交任务：送往奥格瑞玛的肉
    .accept 6384 >>接任务：飞往奥格瑞玛
    .target 迪弗拉克
step
    #xprate >2.09
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_迪弗拉克|r
    .fly Orgrimmar >>飞往奥格瑞玛
    .target 迪弗拉克
    .zoneskip Orgrimmar
    --Mage/Shaman dont need to go ORG 100% route
step
    #xprate >2.09
    .goto Orgrimmar,54.097,68.407
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板格雷什卡|r 对话
    .turnin 6384 >>交任务 飞往奥格瑞玛
    .accept 6385 >>接受任务 双足飞龙管理员多拉斯
    .target 旅店老板格雷什卡
step << Rogue
    .goto Orgrimmar,48.12,80.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_特拉克根|r|cRXP_BUY_交谈，购买|r |T135419:0|t[锋利的飞斧（燃烧的远征：锐利的飞斧）] |cRXP_BUY_（他有售）|r
    .collect 3135,200 << !tbc
    .collect 29008,1 << tbc
    .vendor >> 卖掉杂物
    .target 特拉克根
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #optional
    #completewith AdmiralTurnin
    +|cRXP_WARN_装备|r |T135421:0|t[锋利的飞斧（燃烧的远征：锐利的飞斧）]
    .use 3135 << !tbc
    .use 29008 << tbc
    .itemcount 3135,1 << !tbc
    .itemcount 29008,1 << tbc
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step
    #xprate >2.09
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 对话
    .turnin 6385 >> 交任务：双足飞龙管理员多拉斯
    .accept 6386 >> 接任务：返回十字路口
    .target 多拉斯
step << Warlock/Hunter/Rogue/Priest/Warrior
    #xprate <2.1
    #season 2 << Warrior
    #completewith AdmiralTurnin
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 进入奥格瑞玛
    .zoneskip Orgrimmar
step << Troll Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r 对话
    .turnin 5654 >>交任务 虚弱妖术
    .trainer >>学习职业技能
    .target 乌尔库
    .isOnQuest 5654
step << Troll Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r 对话
    .accept 5652 >> 接任务：虚弱妖术
    .turnin 5652 >>交任务 虚弱妖术
    .trainer >>学习职业技能
    .target 乌尔库
step << Rogue
    .goto Orgrimmar,42.75,53.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_瑟祖克|r
	.accept 1963 >> 接任务：碎手氏族 << Orc Rogue/Troll Rogue
    .target 瑟祖克
step << Rogue
    .goto Orgrimmar,45.64,55.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_卡雷斯|r|cRXP_BUY_交谈，购买一到两把|r |T135640:0|t[双刃弯刀] |cRXP_BUY_（他有售）|r
    .collect 2207,1 --Collect Jambiya (1)
    .money <0.2390
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
    .target 卡雷斯
step << Rogue
    #optional
    #completewith RazorTurnins2
    +|cRXP_WARN_装备|r |T135640:0|t[双刃弯刀]
    .use 2207
    .itemcount 2207,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
step << Rogue
    #season 2
    .goto Orgrimmar,55.87,44.89
    >>打开|cRXP_PICK_布满灰尘的箱子|r，拾取 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    >>|cRXP_WARN_精准符文位于暗巷区的楼上|r
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step << Rogue
    #season 2
    .train 400081 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_精准符文|r] |cRXP_WARN_学习|r |T135610:0|t[正中眉心]
    .use 204174
    .itemcount 204174,1
step << Warlock/Hunter/Rogue/Priest/Warrior
    #xprate <2.1
    #season 2 << Warrior
    #label AdmiralTurnin
    .goto Orgrimmar,32.28,35.80 << !tbc
    .goto Orgrimmar,34.40,36.60 << tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳兹格雷尔|r 交谈 << !tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃金|r 交谈 << tbc
    .turnin 831 >>交任务：将军的命令
    .target 纳兹格雷尔 << !tbc
    .target 沃金 << tbc
step
    #xprate >2.09
    #label AdmiralTurnin
    .goto Orgrimmar,32.28,35.80 << !tbc
    .goto Orgrimmar,34.40,36.60 << tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳兹格雷尔|r 交谈 << !tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃金|r 交谈 << tbc
    .turnin 831 >>交任务：将军的命令
    .target 纳兹格雷尔 << !tbc
    .target 沃金 << tbc
step << Warlock
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_萨尔|r
    .accept 5726 >>接受任务 隐藏的敌人
    .target 萨尔
step << Shaman/Hunter
    #season 2
    .goto Orgrimmar,38.923,38.398
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_佐尔·孤树|r
    .train 409580 >>|cRXP_WARN_购买并使用|r |T133739:0|t|cRXP_LOOT_[论述：雄狮之心]|r |cRXP_WARN_学习|r |T132185:0|t[雄狮之心] << Hunter
    .train 425336 >>|cRXP_WARN_购买并使用|r |T133747:0|t|cRXP_LOOT_[启示：萨满之怒]|r |cRXP_WARN_学习|r |T136088:0|t[萨满之怒] << Shaman
    .use 226401 << Hunter -- Treatise on the Heart of the Lion
    .use 226402 << Shaman -- Revelation of Shamanistic Rage
    .target 佐尔·孤树
    .xp <10,1
    .money <0.5
step << Warrior
    #season 2
    #completewith next
    .goto Orgrimmar,57.40,53.93,-1
    .goto Orgrimmar,58.05,51.40,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_扎姆沙|r 和 |cRXP_FRIENDLY_格鲁阿克|r
    +当 |cRXP_ENEMY_格鲁阿克|r 变为敌对时击杀他
    .target 扎姆沙
    .target 格鲁阿克
    .skipgossip
    --Gossipoption
step << Warrior
    #season 2
    .goto Orgrimmar,58.52,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_扎姆沙|r
    >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target 扎姆沙
    .train 425447,1
    .skipgossip
step << Warrior
    #season 2
    .train 425447 >>使用 |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .use 204716
    .itemcount 204716,1
step << Troll Warrior
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_哈纳什|r
    .train 227 >>学习使用 [法杖]
    .target 哈纳什
    .money <0.100
step << Troll Warrior
    .goto Orgrimmar,81.17,18.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_交谈，购买一根|r |T135154:0|t[短杖] |cRXP_BUY_（他有售）|r
    .collect 854,1,1502,1 --Collect Quarter Staff (1)
    .money <0.3022
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target 森度吉安
    .train 227,3
step << Troll Warrior
    #optional
    #completewith RazorTurnins2
    +|cRXP_WARN_装备|r |T135154:0|t[短杖]
    .use 854
    .itemcount 854,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .train 227,3
step << Hunter
    #completewith next
    .goto Orgrimmar,68.02,38.69,30 >> 前往荣誉谷
step << Hunter
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_奥玛克|r
    .turnin 6081 >>交任务 训练野兽
    .target 奥玛克
step << Hunter
    .goto Orgrimmar,66.34,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肖祖|r 交谈
    .train 24547 >>学习宠物技能
    .target 肖祖
step << Hunter
    #season 0,1
    #completewith RazorTurnins2
    +|cRXP_WARN_把|r |T132162:0|t[训练野兽]|cRXP_WARN_（在常规选项卡下）、|r |T132163:0|t[复活宠物]|cRXP_WARN_和|r |T132165:0|t[喂养宠物] |cRXP_WARN_放到动作条上|r
    >>|cRXP_WARN_宠物获得训练点数后，记得用以下技能训练宠物：|r |T132162:0|t[训练野兽]
step << Hunter
    #season 2
    #completewith End
    +|cRXP_WARN_把|r |T132162:0|t[训练野兽]|cRXP_WARN_（在常规选项卡下）、|r |T132163:0|t[复活宠物]|cRXP_WARN_和|r |T132165:0|t[喂养宠物] |cRXP_WARN_放到动作条上|r
    >>|cRXP_WARN_宠物获得训练点数后，记得用以下技能训练宠物：|r |T132162:0|t[训练野兽]
step << Hunter
    .goto Orgrimmar,81.17,18.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_交谈，购买一把|r |T135499:0|t[多层弯弓] |cRXP_BUY_（他有售）|r
    .collect 2507,1,835,1 --Collect Laminated Recurve Bow (1)
    .money <0.1751
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .target 森度吉安
step << Hunter
    #optional
    #completewith RazorTurnins2
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓] |cRXP_WARN_（达到11级时）|r
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .xp >11,1
step << Hunter
    #optional
    #completewith RazorTurnins2
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .xp <11,1
step << Warlock
    .goto Orgrimmar,48.246,45.281
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|r |cRXP_FRIENDLY_甘鲁尔·血眼|r
    .turnin 1506 >>交任务 甘鲁尔的召唤
    .accept 1501 >>接受任务 虚空中的生物
    .target 甘鲁尔·血眼
step << Warlock
    #softcore
    #completewith next
    .goto Orgrimmar,53.03,48.78
    .subzone 2437 >> 进入怒焰裂谷
step << Warlock
    #softcore
    .goto Durotar,47.05,17.58
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .isOnQuest 1501
step << Warlock
    #hardcore
    #completewith SkullRockWarlock
    .zone Durotar >> 离开奥格瑞玛
    .zoneskip Durotar
step << Warlock
    #label SkullRockWarlock
    .goto Durotar,54.95,9.61
    .subzone 817 >>前往骷髅石
    .isOnQuest 1501
step << Warlock
    #completewith VergaTablet
    >>如果 |cRXP_ENEMY_加祖兹|r 还在, 就击杀他. 击败后搜刮 |T134085:0|t[|cRXP_LOOT_燃影之眼|r]. 使用它来开启任务
    .collect 4903,1,832 --Collect Eye of Burning Shadow
    .accept 832 >>接受任务 燃影之眼
    .unitscan 加祖兹
step << Warlock
    #completewith next
    >>击杀 |cRXP_ENEMY_火刃兽人|r，拾取他们掉落的 |cRXP_LOOT_军官的徽章|r
    >>|cRXP_WARN_如果掉率不佳, 可跳过此步|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒
step << Warlock
    #label VergaTablet
    .goto Durotar,54.16,8.95,15,0
    .goto Durotar,51.62,9.76
    >>在洞穴深处打开|cRXP_PICK_火刃储藏箱|r，拾取|cRXP_LOOT_维尔加石板|r
    .complete 1501,1 --Tablet of Verga (1)
step << Warlock
    #softcore
    .goto Durotar,47.05,17.58
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .isQuestComplete 1501
step << Warlock
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 进入奥格瑞玛
    .zoneskip Orgrimmar
    .isQuestComplete 1501
step << Warlock
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_萨尔|r
    .turnin 5726 >>交任务 隐藏的敌人
    .accept 5727 >>接受任务 隐藏的敌人
    .target 萨尔
    .isQuestComplete 5726
step << Warlock
    #optional
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_萨尔|r
    .accept 5727 >>接受任务 隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5726
step << Warlock
    .goto Orgrimmar,48.246,45.281
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|r |cRXP_FRIENDLY_甘鲁尔·血眼|r
    .turnin 1501 >>交任务 虚空中的生物
    .accept 1504 >>接受任务 誓缚
    .target 甘鲁尔·血眼
step << Warlock
    .goto Orgrimmar,49.49,50.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_尼尔鲁·火刃|r
    .accept 832 >>接受任务 燃影之眼
    .turnin 832 >>交任务 燃影之眼
    .target 尼尔鲁·火刃
    .skipgossip
    .itemcount 4903,1
step << Warlock
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_尼尔鲁·火刃|r
    .complete 5727,1 --Gauge Neeru Fireblade's reaction to you being a member of the Burning Blade
    .skipgossip
    .target 尼尔鲁·火刃
    .isQuestTurnedIn 5726
step << Warlock
    #completewith next
    .cast 9221 >>|cRXP_WARN_使用|r |T134416:0|t[召唤符文] |cRXP_WARN_（站在召唤法阵中）|r
    .use 6284
step << Warlock
    .goto Orgrimmar,49.45,50.02
    >>击杀 |cRXP_ENEMY_召唤出的虚空行者|r
    .complete 1504,1 --Summoned Voidwalker (1)
    .mob 虚空行者
    .use 6284
step << Warlock
    .goto Orgrimmar,48.246,45.281
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|r |cRXP_FRIENDLY_甘鲁尔·血眼|r
    .turnin 1504 >>交任务 誓缚
    .target 甘鲁尔·血眼
step << Warlock
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_萨尔|r
    .turnin 5727 >>交任务 隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5726
step << Warlock
    .destroy 14544 >>|cRXP_WARN_你不再需要|r |T134417:0|t[军官的徽章] |cRXP_WARN_，可以将它销毁|r
step << Shaman/Mage/Hunter
    #xprate >2.09
    #completewith next
    .goto Durotar,45.54,12.14
    .zone Durotar >>离开奥格瑞玛
step << Hunter
    #xprate >2.09
    #completewith next
    #loop
    .goto Durotar,43.73,16.42,0
    .goto Durotar,43.73,16.42,50,0
    .goto Durotar,41.52,20.06,50,0
    .goto Durotar,38.43,17.65,50,0
    .cast 1515 >>驯服一只 |cRXP_ENEMY_毒尾蝎|r
    >>|cRXP_WARN_这会让你能够学习|r |T132140:0|t[爪击（等级 2）]
    .mob 毒尾蝎
    .train 16828,1 --Claw rank 2
step << Shaman
    #xprate >2.09
    #completewith next
    .goto Durotar,51.35,16.76,40,0
    .goto Durotar,54.65,19.02,40,0
    .goto Durotar,55.86,28.31,40,0
    .subzone 371 >>前往 [尘风洞穴]
    >>|cRXP_WARN_向东绕过山丘到达洞穴. 请跟随地图上的航点箭头指引|r
step << Shaman
    #xprate >2.09
    #loop
    .goto Durotar,53.18,29.15,0
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    .goto Durotar,51.90,25.70,12,0
    >>击杀 |cRXP_ENEMY_火刃祭司|r, 搜刮 |cRXP_LOOT_试剂袋|r
    .complete 1525,2 --Reagent Pouch (1)
    .mob 火刃祭司
step << Mage
    #xprate >2.09
    #season 2
    .goto Durotar,52.93,9.01,0
    .goto Durotar,54.96,9.69,30,0
    .goto Durotar,54.69,8.73,30,0
    .goto Durotar,53.78,9.14,30,0
    .goto Durotar,52.93,9.01,30,0
    >>在骷髅石洞内击杀 |cRXP_ENEMY_火刃兽人|r，拾取他们的 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：IULAOYIHTEN|r]
    .collect 203752,1 --Spell Notes: MILEGIN VALF (1)
    .mob 火刃狂热者
    .mob 火刃学徒
    .train 401768,1
    --Living Flame Rune
step << Mage
    #season 2
    #optional
    #completewith FingersOfFrostSupplies
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 进入奥格瑞玛，向试剂商购买理解魔符以解读笔记
    .zoneskip Orgrimmar
    .itemcount 203753,1
    .train 401765,1
    .money <0.075
step << Mage
    #season 2
    #optional
    #label FingersOfFrostSupplies
    .goto Orgrimmar,45.60,56.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍苏斯|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401765 >> 使用 [法术笔记：IGBHNHZNAI] 学习 [寒冰指]
    .use 203753
    .target 霍苏斯
    .itemcount 203753,1
    .train 401765,1
    .money <0.075
step << Mage
    #season 2
    #optional
    #completewith LivingFlameSupplies
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 进入奥格瑞玛，向试剂商购买理解魔符以解读笔记
    .zoneskip Orgrimmar
    .itemcount 203752,1
    .train 401768,1
    .money <0.075
step << Mage
    #season 2
    #optional
    #label LivingFlameSupplies
    .goto Orgrimmar,45.60,56.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍苏斯|r 交谈，购买一个 |T135933:0|t[理解魔符]
    .collect 211779,1
    .train 401768 >> 使用 [法术笔记：IULAOYIHTEN] 学习 [活体烈焰]
    .use 203752
    .target 霍苏斯
    .itemcount 203752,1
    .train 401768,1
    .money <0.075
step
    #xprate >2.09
    .hs >> 炉石返回十字路口
    .use 6948
    .subzoneskip 380
    .bindlocation 380,1
    .cooldown item,6948,>0
step
    #xprate >2.09
    .goto Orgrimmar,45.12,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_多拉斯|r
    .fly Crossroads >> 飞往十字路口
    .target 多拉斯
    .subzoneskip 380
    .cooldown item,6948,<0
step
    #xprate <2.1
    #completewith RazorTurnins2
    .hs >> 炉石返回剃刀岭
    .use 6948
    .subzoneskip 362
    .bindlocation 362,1
step
    #xprate <2.1
    .goto Durotar,51.51,41.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_旅店老板格罗斯克|r
    .vendor >> 卖掉杂物
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（他有售）|r << Mage/Warlock/Priest/Shaman
    >>|cRXP_BUY_购买|r |T133974:0|t[肉排] |cRXP_BUY_（他有售）|r << Rogue/Warrior
    .collect 1179,15,871,1 << Mage/Warlock/Priest/Shaman --Ice Cold Milk (15)
    .collect 2287,15,871,1 << Rogue/Warrior --Haunch of Meat (15)
    .target 旅店老板格罗斯克
    .money <0.0375
step << Warrior
    #xprate <2.1
    #season 2
    .goto Durotar,53.14,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瓦希|r 交谈
    >>交出收集到的|cRXP_LOOT_头颅|r，换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target 瓦希·裂骨者
    .train 403475,1
step << Warrior
    #xprate <2.1
    #season 2
    .use 204688 >>使用 |T134455:0|t[符文碎片] 制作 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step << Warrior
    #xprate <2.1
    #season 2
    .train 403475 >>使用 |T134419:0|t[|cRXP_FRIENDLY_毁灭打击符文|r]
    .use 204703
    .itemcount 204703,1
step
    #xprate <2.1
    #label RazorTurnins2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥戈尼尔|r 和 |cRXP_FRIENDLY_加索克|r交谈
    .turnin 806 >>交任务 黑暗风暴
    .target +奥戈尼尔·魂痕
    .goto Durotar,52.24,43.15
    .turnin 837 >>交任务 野猪人的进犯
    .target +加索克
    .goto Durotar,51.95,43.50
step << Rogue
    #xprate <2.1
    #season 2
    .goto Durotar,51.82,58.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行中的 |cRXP_FRIENDLY_巴索|r 交谈，交出巴索的便条，取得 |T134419:0|t[毁伤符文]
    .collect 203990,1
    .target 巴索
    .skipgossip
    .itemcount 207098,1
    .train 400094,1
step << Rogue
    #xprate <2.1
    #season 2
    .train 400094 >> 使用 |T134419:0|t[毁伤符文] 学习 |T132304:0|t[毁伤]
    .use 203990
    .itemcount 203990,1
step << Warrior
    #xprate <2.1
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塔绍尔·锯痕|r
    .train 6546 >> 学习职业技能
    .target 塔绍尔·锯痕
    .xp <12,1
step << Shaman
    #xprate <2.1
    .goto Durotar,54.42,42.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_斯瓦特|r
    .train 8050 >> 学习职业技能
    .target 斯瓦特
    .xp <12,1
step << Hunter
    #xprate <2.1
    #completewith next
    .goto Durotar,36.29,47.38,0
    .goto Durotar,36.29,52.09,0
    .goto Durotar,36.29,47.38,40,0
    +驯服一只 |cRXP_ENEMY_毒尾蝎|r
    >>|cRXP_WARN_这会让你能够学习|r |T132140:0|t[爪击（等级 2）]
    .mob 毒尾蝎
    .train 16828,1 --Claw rank 2
step
    #xprate <2.1
    #label FarWatchPost
    .goto The Barrens,62.26,19.38,40 >> 前往 [前沿哨所]
    .zoneskip The Barrens
step
    #xprate <2.1
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡加尔·战痕|r 交谈
    .turnin 840 >>交任务 部落的新兵
    .accept 842 >>接受任务 十字路口征兵
    .target 卡加尔·战痕
step << Warrior
    #xprate <2.1
    .goto The Barrens,61.4,21.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_犹塞克|r
    .turnin 1498 >>交任务 防御之道
    .accept 1502 >>接任务：索恩格瑞姆·火眼
    .target 犹塞克
step
    #optional
    #label End
]])
