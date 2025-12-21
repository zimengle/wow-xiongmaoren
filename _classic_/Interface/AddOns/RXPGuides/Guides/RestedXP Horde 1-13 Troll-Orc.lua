local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Horde
#version 1
#group RestedXP 部落 1-30
#defaultfor Orc/Troll
#name 1-6 杜隆塔尔
#displayname 1-6 杜隆塔尔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 6-10 杜隆塔尔
step << !Orc !Troll
    #completewith next
    +|cRXP_WARN_您选择的指南适用于兽人和巨魔. 请确保选择与您起始种族相同的初始区域|r
step
    .goto Durotar,43.33,68.61 << wotlk
    .goto Durotar,43.29,68.53 << tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔图克|r交谈
    .accept 4641 >>接任务: |cRXP_LOOT_起点|r
    .target Kaltunk
step << Warrior/Shaman tbc/Warlock tbc
    #completewith next
    +|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r. 掠夺它们, 直到你获得价值34铜的可出售物品(包括你的装备)|r << Warlock
    +|cRXP_WARN_击杀 |cRXP_ENEMY_杂斑野猪|r. 猎杀它们, 直到你获得价值10铜的可售物品(包括你的装备)|r << Warrior/Shaman
    .goto Durotar,43.85,71.73,50,0 << Warlock
    .goto Durotar,44.19,65.34,50,0 << Warrior/Shaman
    .mob Mottled Boar
    .money >0.01
step << Warlock tbc
    .goto Durotar,42.59,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁赞|r交谈
    .accept 1485 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .target Ruzan
step << Warrior/Shaman tbc
    .goto Durotar,43.49,67.35,30,0
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >>出售垃圾
    .target Duokna
    .money >0.01
step
    .goto Durotar,42.28,68.48,12,0 << Warlock/Shaman wotlk
    .goto Durotar,42.29,68.39,12,0 << Warrior/Shaman tbc
    .goto Durotar,42.06,68.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 4641 >>交任务: |cRXP_FRIENDLY_起点|r
    .accept 788 >>接任务: |cRXP_LOOT_小试身手|r
    .target Gornek
step << Warrior/Shaman tbc
    .goto Durotar,42.28,68.48,10,0
    .goto Durotar,42.89,69.44 << Warrior
    .goto Durotar,42.39,69.00 << Shaman tbc
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈 << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈 << Shaman tbc
    .train 6673 >>训练 |T132333:0|t[战斗怒吼] << Warrior
    .train 8017 >>训练 |T136086:0|t[图腾打击武器] << Shaman tbc
    .target Frang << Warrior
    .target Shikrik << Shaman tbc
step << Warlock tbc
    #completewith Nartok
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.65,68.52,12 >>前往|cRXP_FRIENDLY_纳托克|r
    .money <0.01
step << Warlock tbc
    #completewith next
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>前往赫劳格方向
    .money >0.01
step << Warlock tbc
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售垃圾
    .target Hraug
    .money >0.01
step << Warlock tbc
    #label Nartok
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 348 >>训练 |T135817:0|t[献祭]
    .target Nartok
step << !Warrior !Rogue
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r|T132794:0|t[清凉的泉水] |cRXP_BUY_从她处获得|r << !Hunter
    >>|cRXP_BUY_从她那里购买|r|T132382:0|t[劣质箭]|r << Hunter
    .collect 159,30,6394,1 << !Hunter tbc --Refreshing Spring Water (30)
    .collect 159,10,6394,1 << !Hunter wotlk --Refreshing Spring Water (10)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .target Duokna
    .money <0.015 << !Hunter tbc
    .money <0.0048 << !Hunter wotlk
    .money <0.0040 << Hunter
step << Warlock tbc
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r|T132794:0|t[清凉的泉水] |cRXP_BUY_从她处获得|r
    .collect 159,5,6394,1 --Refreshing Spring Water (5)
    .target Duokna
    .money <0.0024
step << Warlock tbc
    #completewith next
    .goto Durotar,43.57,67.28,25,0
    >>在前往燃烧之刃教团的路上击杀杂斑野猪
    >>|cRXP_WARN_尝试在到达那里之前先升到2级|r
    >>|cRXP_WARN_尽量不要使用你的|r|T132794:0|t[清凉的泉水]|cRXP_WARN_yet|r
    .complete 788,1 --Mottled Boar (10)
    .mob Mottled Boar
step << Warlock tbc
    .goto Durotar,45.30,56.42,100 >>前往燃烧之刃据点
    .isOnQuest 1485
step << Warlock tbc
#loop
	.line Durotar,43.87,58.42,44.53,58.62,45.18,58.42,45.83,58.59,45.79,57.43,46.46,57.57,47.19,57.12,46.21,56.69,46.28,56.11,45.65,56.90,45.35,56.32,44.77,56.87,44.58,56.10,44.27,56.59,43.85,55.52,43.87,58.42
	.goto Durotar,43.87,58.42,50,0
	.goto Durotar,44.53,58.62,50,0
	.goto Durotar,45.18,58.42,50,0
	.goto Durotar,45.83,58.59,50,0
	.goto Durotar,45.79,57.43,50,0
	.goto Durotar,46.46,57.57,50,0
	.goto Durotar,47.19,57.12,50,0
	.goto Durotar,46.21,56.69,50,0
	.goto Durotar,46.28,56.11,50,0
	.goto Durotar,45.65,56.90,50,0
	.goto Durotar,45.35,56.32,50,0
	.goto Durotar,44.77,56.87,50,0
	.goto Durotar,44.58,56.10,50,0
	.goto Durotar,44.27,56.59,50,0
	.goto Durotar,43.85,55.52,50,0
	.goto Durotar,43.87,58.42,50,0
    >>击杀 |cRXP_ENEMY_邪灵劣魔|r. 击败它们后可掉落 |cRXP_LOOT_邪灵劣魔的头颅|r
    .complete 1485,1 --Vile Familiar Head (6)
    .mob Vile Familiar
step
    #completewith Sarkoth
    .goto Durotar,43.57,67.28,25,0 << !Warlock/wotlk
    .goto Durotar,43.89,65.84,45,0 << !Warlock/wotlk
    >>击杀|cRXP_ENEMY_杂斑野猪|r
    .complete 788,1 --Mottled Boar (10)
    .mob Mottled Boar
step
    .goto Durotar,40.59,62.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳祖|r交谈
    .accept 790 >>接任务: |cRXP_LOOT_萨科斯|r
    .target Hana'zua
step
    #label Sarkoth
	.goto Durotar,40.88,66.41,40,0
	.goto Durotar,40.41,66.64,40,0
	.goto Durotar,40.43,67.36,40,0
	.goto Durotar,40.72,67.39,40,0
#loop
	.line Durotar,40.88,66.41,40.41,66.64,40.43,67.36,40.72,67.39,40.88,66.41
	.goto Durotar,40.88,66.41,20,0
	.goto Durotar,40.41,66.64,20,0
	.goto Durotar,40.43,67.36,20,0
	.goto Durotar,40.72,67.39,20,0
	.goto Durotar,40.88,66.41,20,0
    >>击杀|cRXP_ENEMY_萨科斯|r. 击败他后搜刮|cRXP_LOOT_萨科斯的裂皮爪|r
    .complete 790,1 --Sarkoth's Mangled Claw (1)
    .mob Sarkoth
step
    .goto Durotar,40.59,62.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳祖|r交谈
    .turnin 790 >>交任务: |cRXP_FRIENDLY_萨科斯|r
    .accept 804 >>接任务: |cRXP_LOOT_萨科斯|r
    .target Hana'zua
step
#loop
	.line Durotar,41.30,65.03,41.92,64.74,42.66,64.92,43.31,65.02,43.90,65.96,44.54,65.96,45.16,65.77,45.72,65.93,45.72,65.04,45.21,63.95,45.83,63.01,45.81,62.17,45.78,61.14,45.15,60.20,44.50,59.45,43.86,60.43,43.07,60.24,42.58,60.09,42.02,61.19,42.02,62.15,42.00,62.92,41.99,64.03,41.30,65.03
	.goto Durotar,41.30,65.03,50,0
	.goto Durotar,41.92,64.74,50,0
	.goto Durotar,42.66,64.92,50,0
	.goto Durotar,43.31,65.02,50,0
	.goto Durotar,43.90,65.96,50,0
	.goto Durotar,44.54,65.96,50,0
	.goto Durotar,45.16,65.77,50,0
	.goto Durotar,45.72,65.93,50,0
	.goto Durotar,45.72,65.04,50,0
	.goto Durotar,45.21,63.95,50,0
	.goto Durotar,45.83,63.01,50,0
	.goto Durotar,45.81,62.17,50,0
	.goto Durotar,45.78,61.14,50,0
	.goto Durotar,45.15,60.20,50,0
	.goto Durotar,44.50,59.45,50,0
	.goto Durotar,43.86,60.43,50,0
	.goto Durotar,43.07,60.24,50,0
	.goto Durotar,42.58,60.09,50,0
	.goto Durotar,42.02,61.19,50,0
	.goto Durotar,42.02,62.15,50,0
	.goto Durotar,42.00,62.92,50,0
	.goto Durotar,41.99,64.03,50,0
	.goto Durotar,41.30,65.03,50,0
    >>击杀|cRXP_ENEMY_杂斑野猪|r
    .complete 788,1 --Mottled Boar (10)
    .mob Mottled Boar
step << Warlock tbc
    #xprate <1.5
#loop
	.line Durotar,41.30,65.03,41.92,64.74,42.66,64.92,43.31,65.02,43.90,65.96,44.54,65.96,45.16,65.77,45.72,65.93,45.72,65.04,45.21,63.95,45.83,63.01,45.81,62.17,45.78,61.14,45.15,60.20,44.50,59.45,43.86,60.43,43.07,60.24,42.58,60.09,42.02,61.19,42.02,62.15,42.00,62.92,41.99,64.03,41.30,65.03
	.goto Durotar,41.30,65.03,50,0
	.goto Durotar,41.92,64.74,50,0
	.goto Durotar,42.66,64.92,50,0
	.goto Durotar,43.31,65.02,50,0
	.goto Durotar,43.90,65.96,50,0
	.goto Durotar,44.54,65.96,50,0
	.goto Durotar,45.16,65.77,50,0
	.goto Durotar,45.72,65.93,50,0
	.goto Durotar,45.72,65.04,50,0
	.goto Durotar,45.21,63.95,50,0
	.goto Durotar,45.83,63.01,50,0
	.goto Durotar,45.81,62.17,50,0
	.goto Durotar,45.78,61.14,50,0
	.goto Durotar,45.15,60.20,50,0
	.goto Durotar,44.50,59.45,50,0
	.goto Durotar,43.86,60.43,50,0
	.goto Durotar,43.07,60.24,50,0
	.goto Durotar,42.58,60.09,50,0
	.goto Durotar,42.02,61.19,50,0
	.goto Durotar,42.02,62.15,50,0
	.goto Durotar,42.00,62.92,50,0
	.goto Durotar,41.99,64.03,50,0
	.goto Durotar,41.30,65.03,50,0
    .xp 3+685 >>升级至685/1400经验值
    .mob Mottled Boar
step << Warlock tbc/wotlk
    #xprate 1.48-1.58
#loop
	.line Durotar,41.30,65.03,41.92,64.74,42.66,64.92,43.31,65.02,43.90,65.96,44.54,65.96,45.16,65.77,45.72,65.93,45.72,65.04,45.21,63.95,45.83,63.01,45.81,62.17,45.78,61.14,45.15,60.20,44.50,59.45,43.86,60.43,43.07,60.24,42.58,60.09,42.02,61.19,42.02,62.15,42.00,62.92,41.99,64.03,41.30,65.03
	.goto Durotar,41.30,65.03,50,0
	.goto Durotar,41.92,64.74,50,0
	.goto Durotar,42.66,64.92,50,0
	.goto Durotar,43.31,65.02,50,0
	.goto Durotar,43.90,65.96,50,0
	.goto Durotar,44.54,65.96,50,0
	.goto Durotar,45.16,65.77,50,0
	.goto Durotar,45.72,65.93,50,0
	.goto Durotar,45.72,65.04,50,0
	.goto Durotar,45.21,63.95,50,0
	.goto Durotar,45.83,63.01,50,0
	.goto Durotar,45.81,62.17,50,0
	.goto Durotar,45.78,61.14,50,0
	.goto Durotar,45.15,60.20,50,0
	.goto Durotar,44.50,59.45,50,0
	.goto Durotar,43.86,60.43,50,0
	.goto Durotar,43.07,60.24,50,0
	.goto Durotar,42.58,60.09,50,0
	.goto Durotar,42.02,61.19,50,0
	.goto Durotar,42.02,62.15,50,0
	.goto Durotar,42.00,62.92,50,0
	.goto Durotar,41.99,64.03,50,0
	.goto Durotar,41.30,65.03,50,0
    .xp 3+845 >>升级至845/1400经验值 << wotlk
    .xp 3+372 >>升级至372/1400经验值 << Warlock tbc
    .mob Mottled Boar
--Cutting Teeth gives 50 more xp in wotlk
step << wotlk
    #xprate 1.58-1.68
#loop
	.line Durotar,41.30,65.03,41.92,64.74,42.66,64.92,43.31,65.02,43.90,65.96,44.54,65.96,45.16,65.77,45.72,65.93,45.72,65.04,45.21,63.95,45.83,63.01,45.81,62.17,45.78,61.14,45.15,60.20,44.50,59.45,43.86,60.43,43.07,60.24,42.58,60.09,42.02,61.19,42.02,62.15,42.00,62.92,41.99,64.03,41.30,65.03
	.goto Durotar,41.30,65.03,50,0
	.goto Durotar,41.92,64.74,50,0
	.goto Durotar,42.66,64.92,50,0
	.goto Durotar,43.31,65.02,50,0
	.goto Durotar,43.90,65.96,50,0
	.goto Durotar,44.54,65.96,50,0
	.goto Durotar,45.16,65.77,50,0
	.goto Durotar,45.72,65.93,50,0
	.goto Durotar,45.72,65.04,50,0
	.goto Durotar,45.21,63.95,50,0
	.goto Durotar,45.83,63.01,50,0
	.goto Durotar,45.81,62.17,50,0
	.goto Durotar,45.78,61.14,50,0
	.goto Durotar,45.15,60.20,50,0
	.goto Durotar,44.50,59.45,50,0
	.goto Durotar,43.86,60.43,50,0
	.goto Durotar,43.07,60.24,50,0
	.goto Durotar,42.58,60.09,50,0
	.goto Durotar,42.02,61.19,50,0
	.goto Durotar,42.02,62.15,50,0
	.goto Durotar,42.00,62.92,50,0
	.goto Durotar,41.99,64.03,50,0
	.goto Durotar,41.30,65.03,50,0
    .xp 3+808 >>升级至808+/1400经验值
    .mob Mottled Boar
step << wotlk
    #xprate >1.6999
#loop
	.line Durotar,41.30,65.03,41.92,64.74,42.66,64.92,43.31,65.02,43.90,65.96,44.54,65.96,45.16,65.77,45.72,65.93,45.72,65.04,45.21,63.95,45.83,63.01,45.81,62.17,45.78,61.14,45.15,60.20,44.50,59.45,43.86,60.43,43.07,60.24,42.58,60.09,42.02,61.19,42.02,62.15,42.00,62.92,41.99,64.03,41.30,65.03
	.goto Durotar,41.30,65.03,50,0
	.goto Durotar,41.92,64.74,50,0
	.goto Durotar,42.66,64.92,50,0
	.goto Durotar,43.31,65.02,50,0
	.goto Durotar,43.90,65.96,50,0
	.goto Durotar,44.54,65.96,50,0
	.goto Durotar,45.16,65.77,50,0
	.goto Durotar,45.72,65.93,50,0
	.goto Durotar,45.72,65.04,50,0
	.goto Durotar,45.21,63.95,50,0
	.goto Durotar,45.83,63.01,50,0
	.goto Durotar,45.81,62.17,50,0
	.goto Durotar,45.78,61.14,50,0
	.goto Durotar,45.15,60.20,50,0
	.goto Durotar,44.50,59.45,50,0
	.goto Durotar,43.86,60.43,50,0
	.goto Durotar,43.07,60.24,50,0
	.goto Durotar,42.58,60.09,50,0
	.goto Durotar,42.02,61.19,50,0
	.goto Durotar,42.02,62.15,50,0
	.goto Durotar,42.00,62.92,50,0
	.goto Durotar,41.99,64.03,50,0
	.goto Durotar,41.30,65.03,50,0
    .xp 3+771 >>升级至771/1400经验值
    .mob Mottled Boar
step << !Warlock
    #xprate <1.5
#loop
	.line Durotar,41.30,65.03,41.92,64.74,42.66,64.92,43.31,65.02,43.90,65.96,44.54,65.96,45.16,65.77,45.72,65.93,45.72,65.04,45.21,63.95,45.83,63.01,45.81,62.17,45.78,61.14,45.15,60.20,44.50,59.45,43.86,60.43,43.07,60.24,42.58,60.09,42.02,61.19,42.02,62.15,42.00,62.92,41.99,64.03,41.30,65.03
	.goto Durotar,41.30,65.03,50,0
	.goto Durotar,41.92,64.74,50,0
	.goto Durotar,42.66,64.92,50,0
	.goto Durotar,43.31,65.02,50,0
	.goto Durotar,43.90,65.96,50,0
	.goto Durotar,44.54,65.96,50,0
	.goto Durotar,45.16,65.77,50,0
	.goto Durotar,45.72,65.93,50,0
	.goto Durotar,45.72,65.04,50,0
	.goto Durotar,45.21,63.95,50,0
	.goto Durotar,45.83,63.01,50,0
	.goto Durotar,45.81,62.17,50,0
	.goto Durotar,45.78,61.14,50,0
	.goto Durotar,45.15,60.20,50,0
	.goto Durotar,44.50,59.45,50,0
	.goto Durotar,43.86,60.43,50,0
	.goto Durotar,43.07,60.24,50,0
	.goto Durotar,42.58,60.09,50,0
	.goto Durotar,42.02,61.19,50,0
	.goto Durotar,42.02,62.15,50,0
	.goto Durotar,42.00,62.92,50,0
	.goto Durotar,41.99,64.03,50,0
	.goto Durotar,41.30,65.03,50,0
    .xp 2+520 >>升级至520+/900经验值 << wotlk
    .xp 2+570 >>升级到570级/900经验 << tbc
    .mob Mottled Boar
step << Warlock
    #xprate <1.5
    #completewith Duokna2 << wotlk
    #completewith Ruzan2 << tbc
	>>|cRXP_WARN_击杀|cRXP_ENEMY_杂斑野猪|r. 刷怪直到你获得价值95铜的可售物品. 你的装备也可以以13铜的价格出售|r
	.money >0.0095
    .mob Mottled Boar
step << Warlock
    #xprate >1.4999
    #completewith Duokna2 << wotlk
    #completewith Ruzan2 << tbc
	>>|cRXP_WARN_击杀 |cRXP_ENEMY_杂斑野猪|r. 刷怪直到你获得价值1银90铜的商人可售物品. 你的装备也可以以13铜的价格出售|r
	.money >0.0190
    .mob Mottled Boar
step << Rogue/Warlock wotlk
    #label Duokna2
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >>出售垃圾
    .target Duokna
step << !Rogue !Warrior
    #label Duokna2
    #xprate >1.4999
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_WARN_不要购买任何|r|T132794:0|t[清凉的泉水]|cRXP_WARN_yet|r << !Hunter !Shaman
    .vendor >>出售垃圾
    .target Duokna
    .money >0.1
step << Warlock tbc
    #label Ruzan2
    .goto Durotar,42.59,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁赞|r交谈
    .turnin 1485 >>交任务: |cRXP_FRIENDLY_邪灵劣魔|r
    .accept 1499 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .target Ruzan
step << Warlock tbc
    #completewith Gornek2
    .cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
step << Warlock tbc
	.goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 1499 >>交任务: |cRXP_FRIENDLY_邪灵劣魔|r
    .accept 794 >>接任务: |cRXP_LOOT_火刃奖章|r
    .target Zureetha Fargaze
step
    #label Gornek2
    .goto Durotar,42.28,68.48,12,0 << Warlock
    .goto Durotar,42.29,68.39,12,0 << !Warlock
    .goto Durotar,42.06,68.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 788 >>交任务: |cRXP_FRIENDLY_小试身手|r
    .accept 789 >>接任务: |cRXP_LOOT_工蝎的尾巴|r
    .accept 2383 >>接任务: |cRXP_LOOT_简易羊皮纸|r << Orc Warrior
    .accept 3065 >>接任务: |cRXP_LOOT_普通石板|r << Troll Warrior
    .accept 3082 >>接任务: |cRXP_LOOT_风蚀石板|r << Troll Hunter
    .accept 3083 >>接任务: |cRXP_LOOT_密文石板|r << Troll Rogue
    .accept 3084 >>接任务: |cRXP_LOOT_符文石板|r << Troll Shaman
    .accept 3085 >>接任务: |cRXP_LOOT_神圣石板|r << Troll Priest
    .accept 3086 >>接任务: |cRXP_LOOT_雕文石板|r << Troll Mage
    .accept 3087 >>接任务: |cRXP_LOOT_风蚀羊皮纸|r << Orc Hunter
    .accept 3088 >>接任务: |cRXP_LOOT_密文羊皮纸|r << Orc Rogue
    .accept 3089 >>接任务: |cRXP_LOOT_符文羊皮纸|r << Orc Shaman
    .accept 3090 >>接任务: |cRXP_LOOT_被污染的羊皮纸|r << Orc Warlock
    .turnin 804 >>交任务: |cRXP_FRIENDLY_萨科斯|r
    .target Gornek
step << Rogue
    #completewith Rwag
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.27,68.00,12 >>前往|cRXP_FRIENDLY_鲁瓦格|r
step << Rogue
    #xprate >1.4999
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .turnin 3083 >>交任务: |cRXP_FRIENDLY_密文石板|r << Troll Rogue
    .turnin 3088 >>交任务: |cRXP_FRIENDLY_密文羊皮纸|r << Orc Rogue
    .train 53 >>训练 |T132090:0|t[背刺]
    .money <0.04
    .target Rwag
step << Rogue
    #label Rwag
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .turnin 3083 >>交任务: |cRXP_FRIENDLY_密文石板|r << Troll Rogue
    .turnin 3088 >>交任务: |cRXP_FRIENDLY_密文羊皮纸|r << Orc Rogue
    .target Rwag
step << Warlock
    #completewith Nartok2
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.65,68.52,12 >>前往|cRXP_FRIENDLY_纳托克|r
    .money <0.01 << tbc
step << Warlock tbc
    #completewith next
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>前往赫劳格方向
    .money >0.01
step << Warlock tbc
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    .vendor >>出售垃圾
    .target Hraug
    .money >0.01
--95c for imp
step << Warlock tbc
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .turnin 3090 >>交任务: |cRXP_FRIENDLY_被污染的羊皮纸|r
    .train 172 >>训练 |T136118:0|t[腐蚀之触]
	.train 688 >>召唤小鬼训练 << wotlk
    .target Nartok
step << Warlock wotlk
    #xprate >1.4999
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .turnin 3090 >>交任务: |cRXP_FRIENDLY_被污染的羊皮纸|r
    .train 172 >>训练 |T136118:0|t[腐蚀之触]
	.train 688 >>训练 |T136218:0|t[召唤小鬼]
    .target Nartok
step << Warlock wotlk
    #xprate <1.5
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .turnin 3090 >>交任务: |cRXP_FRIENDLY_被污染的羊皮纸|r
	.train 688 >>训练 |T136218:0|t[召唤小鬼]
    .target Nartok
step << Warlock wotlk
    #completewith next
    .cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
step
    #sticky
    #label Galgar
    .goto Durotar,42.73,67.23,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .accept 4402 >>接任务: |cRXP_LOOT_戈加尔的清凉果|r
    .target Galgar
step
    #xprate <1.5
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r|T132794:0|t[清凉的泉水] |cRXP_BUY_从她处获得|r << !Rogue !Warrior !Hunter !Shaman
    >>|cRXP_BUY_从她那里购买|r|T132382:0|t[劣质箭]|r << Hunter
    .collect 159,15,6394,1 << !Rogue !Warrior !Hunter !Shaman tbc --Refreshing Spring Water (15)
    .collect 159,5,6394,1 << !Rogue !Warrior !Hunter !Shaman wotlk --Refreshing Spring Water (5)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >>出售垃圾
    .target Duokna
    .money >0.1 << Rogue/Warrior/Shaman
    .itemcount 159,<15 << !Rogue !Warrior !Hunter !Shaman tbc
    .itemcount 159,<5 << !Rogue !Warrior !Hunter !Shaman wotlk
    .itemcount 2512,<600 << Hunter
step
    #xprate >1.4999
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r|T132794:0|t[清凉的泉水] |cRXP_BUY_从她处获得|r << !Rogue !Warrior !Hunter !Shaman
    >>|cRXP_BUY_从她那里购买|r|T132382:0|t[劣质箭]|r << Hunter
    .collect 159,15,6394,1 << !Rogue !Warrior !Hunter !Shaman tbc --Refreshing Spring Water (15)
    .collect 159,5,6394,1 << !Rogue !Warrior !Hunter !Shaman wotlk --Refreshing Spring Water (5)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >>出售垃圾
    .target Duokna
    .money <0.0177 << Priest tbc/Mage tbc
    .money <0.0145 << Hunter
    .money <0.0129 << Priest wotlk/Mage wotlk
    .money <0.0072 << Warlock tbc
    .money <0.0024 << Warlock wotlk
    .money >0.1 << Rogue/Warrior/Shaman
    .itemcount 159,<15 << !Rogue !Warrior !Hunter !Shaman tbc
    .itemcount 159,<5 << !Rogue !Warrior !Hunter !Shaman tbc
    .itemcount 2512,<600 << Hunter
step << Hunter
    #xprate >1.4999
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132382:0|t[劣质箭]|r
    .collect 2512,400,6394,1 --Rough Arrow (400)
    .vendor >>出售垃圾
    .target Duokna
    .money <0.0115
    .itemcount 2512,<200
step << Hunter
    #xprate >1.4999
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132382:0|t[劣质箭]|r
    .collect 2512,200,6394,1 --Rough Arrow (200)
    .vendor >>出售垃圾
    .target Duokna
    .money <0.0105
    .itemcount 2512,<200
step << Priest
    #xprate >1.4999
    #requires Galgar
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
    .train 589 >>训练你的职业法术
    .turnin 3085 >>交任务: |cRXP_FRIENDLY_神圣石板|r
    .money <0.02
    .target Ken'jai
step << Priest
    #xprate >1.4999
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
    .train 1243 >>训练 |T135987:0|t[真言术:坚韧]
    .train 589 >>训练 |T136207:0|t[暗言术:痛]
    .turnin 3085 >>交任务: |cRXP_FRIENDLY_神圣石板|r
    .money <0.0105
    .target Ken'jai
step << Priest
    #xprate >1.4999
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
    .train 589 >>训练 |T136207:0|t[暗言术:痛]
    .turnin 3085 >>交任务: |cRXP_FRIENDLY_神圣石板|r
    .money <0.0095
    .target Ken'jai
step << skip
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
    .train 1243 >>训练 |T135987:0|t[真言术:坚韧]
    .turnin 3085 >>交任务: |cRXP_FRIENDLY_神圣石板|r
    .money >0.1
    .target Ken'jai
--VV stam is useless at the start
step << Priest
    #requires Galgar
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
    .turnin 3085 >>交任务: |cRXP_FRIENDLY_神圣石板|r
    .target Ken'jai
step << Shaman
    #xprate >1.4999
    #requires Galgar
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘|r交谈
    .turnin 3084 >>交任务: |cRXP_FRIENDLY_符文石板|r << Troll
    .turnin 3089 >>交任务: |cRXP_FRIENDLY_符文羊皮纸|r << Orc
    .train 8017 >>训练 |T136086:0|t[图腾打击武器] << wotlk
    .train 8042 >>训练 |T136026:0|t[地震术]
    .goto Durotar,42.39,69.00
    .accept 1516 >>接任务: |cRXP_LOOT_大地的召唤|r
    .goto Durotar,42.40,69.17
    .target Shikrik
    .target Canaga Earthcaller
step << Shaman
    #requires Galgar
    .goto Durotar,42.39,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .turnin 3084 >>交任务: |cRXP_FRIENDLY_符文石板|r << Troll
    .turnin 3089 >>交任务: |cRXP_FRIENDLY_符文羊皮纸|r << Orc
    .train 8017 >>训练 |T136086:0|t[图腾打击武器] << wotlk
    .target Shikrik
step << Mage
    #xprate >1.4999
    #requires Galgar
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛娅|r交谈
    .turnin 3086 >>交任务: |cRXP_FRIENDLY_雕文石板|r << Troll
    .train 1459 >>训练 |T135932:0|t[奥术智慧]
    .train 116 >>训练 |T135846:0|t[冰箭]
    .target Mai'ah
step << Mage
    #requires Galgar
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛娅|r交谈
    .turnin 3086 >>交任务: |cRXP_FRIENDLY_雕文石板|r << Troll
    .train 1459 >>训练 |T135932:0|t[奥术智慧]
    .target Mai'ah
step << !Warlock/wotlk
    #requires Galgar
	.goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .accept 792 >>接任务: |cRXP_LOOT_邪灵劣魔|r
    .target Zureetha Fargaze
step << Hunter
    #xprate >1.4999
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jen'shan|r交谈
    .turnin 3082 >>交任务: |cRXP_FRIENDLY_风蚀石板|r << Troll
    .turnin 3087 >>交任务: |cRXP_FRIENDLY_风蚀羊皮纸|r << Orc
    .train 1978 >>训练 |T132204:0|t[蛇毒之刺]
    .target Jen'shan
step << Hunter
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jen'shan|r交谈
    .turnin 3082 >>交任务: |cRXP_FRIENDLY_风蚀石板|r << Troll
    .turnin 3087 >>交任务: |cRXP_FRIENDLY_风蚀羊皮纸|r << Orc
    .target Jen'shan
step << Warrior
    #xprate >1.4999
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>交任务: |cRXP_FRIENDLY_简易羊皮纸|r << Orc
    .turnin 3065 >>交任务: |cRXP_FRIENDLY_普通石板|r << Troll
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Frang
    .money <0.0190
step << Warrior
    #xprate >1.4999
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>交任务: |cRXP_FRIENDLY_简易羊皮纸|r << Orc
    .turnin 3065 >>交任务: |cRXP_FRIENDLY_普通石板|r << Troll
    .train 100 >>训练 |T132337:0|t[冲锋]
    .target Frang
    .money <0.0095
step << Warrior
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .turnin 2383 >>交任务: |cRXP_FRIENDLY_简易羊皮纸|r << Orc
    .turnin 3065 >>交任务: |cRXP_FRIENDLY_普通石板|r << Troll
    .target Frang
step
    #requires Galgar << Warlock
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thazz'ril|r交谈
    .accept 5441 >>接任务: |cRXP_LOOT_懒惰的苦工|r
    .target Foreman Thazz'ril
step
    #completewith Sting
    >>拾取仙人掌附近的|cRXP_LOOT_仙人掌果|r
    .complete 4402,1 --Cactus Apple (10) Vanilla/TBC, (6) WOTLK
step
    #completewith Tails
    .goto Durotar,44.98,69.13,45,0
    .goto Durotar,45.64,65.70,45,0
    .goto Durotar,47.37,65.67,45,0
    >>使用 |T133486:0|t[硬铁棒] 对正在睡觉的|cRXP_FRIENDLY_懒惰的苦工|r施展攻击
    .complete 5441,1 --Peons Awoken (5)
    .target Lazy Peon
    .use 16114
step << !Warlock/wotlk
    #completewith Imps
    >>击杀|cRXP_ENEMY_蝎子|r. 击杀后掠夺其掉落的|cRXP_LOOT_工蝎的尾巴|r
    .complete 789,1 --Scorpid Worker Tail (10) Vanilla/TBC, (8) WOTLK
    .mob Scorpid Worker
step << !Warlock/wotlk
    #label Imps
#loop
	.line Durotar,43.87,58.42,44.53,58.62,45.18,58.42,45.83,58.59,45.79,57.43,46.46,57.57,47.19,57.12,46.21,56.69,46.28,56.11,45.65,56.90,45.35,56.32,44.77,56.87,44.58,56.10,44.27,56.59,43.85,55.52,43.87,58.42
	.goto Durotar,43.87,58.42,45,0
	.goto Durotar,44.53,58.62,45,0
	.goto Durotar,45.18,58.42,45,0
	.goto Durotar,45.83,58.59,45,0
	.goto Durotar,45.79,57.43,45,0
	.goto Durotar,46.46,57.57,45,0
	.goto Durotar,47.19,57.12,45,0
	.goto Durotar,46.21,56.69,45,0
	.goto Durotar,46.28,56.11,45,0
	.goto Durotar,45.65,56.90,45,0
	.goto Durotar,45.35,56.32,45,0
	.goto Durotar,44.77,56.87,45,0
	.goto Durotar,44.58,56.10,45,0
	.goto Durotar,44.27,56.59,45,0
	.goto Durotar,43.85,55.52,45,0
	.goto Durotar,43.87,58.42,45,0
    >>击杀|cRXP_ENEMY_邪灵劣魔|r
    .complete 792,1 --Vile Familiar (12) Vanilla/TBC, (8) WOTLK
    .mob Vile Familiar
step
    #label Tails
#loop
	.line Durotar,43.26,58.28,42.81,58.41,41.90,58.35,41.97,59.20,41.36,60.35,40.66,61.27,40.07,61.35,39.42,61.29,39.46,62.17,39.55,63.10,40.13,64.04,40.84,64.06,40.74,65.86,39.93,66.03,40.04,66.99,40.09,67.66,40.13,68.50,40.72,68.55,41.30,67.84,41.37,66.72,41.89,66.05,41.27,65.71,41.36,64.07,41.33,63.12,41.35,61.98,41.49,61.25,41.90,60.24,42.51,59.34,43.08,59.62,43.91,59.33,45.15,59.46,45.81,59.30,45.85,60.34,46.46,61.11,47.09,62.24,47.08,63.15,47.14,64.08,47.58,64.04,47.08,63.15,47.09,62.24,46.90,61.15,46.98,60.18,47.07,59.34,46.47,58.28,45.81,59.30,45.15,59.46,43.91,59.33,43.26,58.28
	.goto Durotar,43.26,58.28,45,0
	.goto Durotar,42.81,58.41,45,0
	.goto Durotar,41.90,58.35,45,0
	.goto Durotar,41.97,59.20,45,0
	.goto Durotar,41.36,60.35,45,0
	.goto Durotar,40.66,61.27,45,0
	.goto Durotar,40.07,61.35,45,0
	.goto Durotar,39.42,61.29,45,0
	.goto Durotar,39.46,62.17,45,0
	.goto Durotar,39.55,63.10,45,0
	.goto Durotar,40.13,64.04,45,0
	.goto Durotar,40.84,64.06,45,0
	.goto Durotar,40.74,65.86,45,0
	.goto Durotar,39.93,66.03,45,0
	.goto Durotar,40.04,66.99,45,0
	.goto Durotar,40.09,67.66,45,0
	.goto Durotar,40.13,68.50,45,0
	.goto Durotar,40.72,68.55,45,0
	.goto Durotar,41.30,67.84,45,0
	.goto Durotar,41.37,66.72,45,0
	.goto Durotar,41.89,66.05,45,0
	.goto Durotar,41.27,65.71,45,0
	.goto Durotar,41.36,64.07,45,0
	.goto Durotar,41.33,63.12,45,0
	.goto Durotar,41.35,61.98,45,0
	.goto Durotar,41.49,61.25,45,0
	.goto Durotar,41.90,60.24,45,0
	.goto Durotar,42.51,59.34,45,0
	.goto Durotar,43.08,59.62,45,0
	.goto Durotar,43.91,59.33,45,0
	.goto Durotar,45.15,59.46,45,0
	.goto Durotar,45.81,59.30,45,0
	.goto Durotar,45.85,60.34,45,0
	.goto Durotar,46.46,61.11,45,0
	.goto Durotar,47.09,62.24,45,0
	.goto Durotar,47.08,63.15,45,0
	.goto Durotar,47.14,64.08,45,0
	.goto Durotar,47.58,64.04,45,0
	.goto Durotar,47.08,63.15,45,0
	.goto Durotar,47.09,62.24,45,0
	.goto Durotar,46.90,61.15,45,0
	.goto Durotar,46.98,60.18,45,0
	.goto Durotar,47.07,59.34,45,0
	.goto Durotar,46.47,58.28,45,0
	.goto Durotar,45.81,59.30,45,0
	.goto Durotar,45.15,59.46,45,0
	.goto Durotar,43.91,59.33,45,0
	.goto Durotar,43.26,58.28,45,0
    >>击杀|cRXP_ENEMY_蝎子|r. 击杀后掠夺其掉落的|cRXP_LOOT_工蝎的尾巴|r
    .complete 789,1 --Scorpid Worker Tail (10) Vanilla/TBC, (8) WOTLK
    .mob Scorpid Worker
step
#loop
	.line Durotar,44.98,69.13,45.64,65.70,47.37,65.67,46.74,60.66,47.09,57.90,43.90,57.79,42.70,57.25,41.27,58.95,40.91,60.41,38.83,61.84,44.98,69.13
	.goto Durotar,44.98,69.13,40,0
	.goto Durotar,45.64,65.70,40,0
	.goto Durotar,47.37,65.67,40,0
	.goto Durotar,46.74,60.66,40,0
	.goto Durotar,47.09,57.90,40,0
	.goto Durotar,43.90,57.79,40,0
	.goto Durotar,42.70,57.25,40,0
	.goto Durotar,41.27,58.95,40,0
	.goto Durotar,40.91,60.41,40,0
	.goto Durotar,38.83,61.84,40,0
	.goto Durotar,44.98,69.13,40,0
    >>使用 |T133486:0|t[硬铁棒] 对正在睡觉的|cRXP_FRIENDLY_懒惰的苦工|r施展攻击
    .complete 5441,1 --Peons Awoken (5)
    .target Lazy Peon
    .use 16114
step
    #xprate <1.5
#loop
	.line Durotar,41.30,65.03,41.92,64.74,42.66,64.92,43.31,65.02,43.90,65.96,44.54,65.96,45.16,65.77,45.72,65.93,45.72,65.04,45.21,63.95,45.83,63.01,45.81,62.17,45.78,61.14,45.15,60.20,44.50,59.45,43.86,60.43,43.07,60.24,42.58,60.09,42.02,61.19,42.02,62.15,42.00,62.92,41.99,64.03,41.30,65.03
	.goto Durotar,41.30,65.03,50,0
	.goto Durotar,41.92,64.74,50,0
	.goto Durotar,42.66,64.92,50,0
	.goto Durotar,43.31,65.02,50,0
	.goto Durotar,43.90,65.96,50,0
	.goto Durotar,44.54,65.96,50,0
	.goto Durotar,45.16,65.77,50,0
	.goto Durotar,45.72,65.93,50,0
	.goto Durotar,45.72,65.04,50,0
	.goto Durotar,45.21,63.95,50,0
	.goto Durotar,45.83,63.01,50,0
	.goto Durotar,45.81,62.17,50,0
	.goto Durotar,45.78,61.14,50,0
	.goto Durotar,45.15,60.20,50,0
	.goto Durotar,44.50,59.45,50,0
	.goto Durotar,43.86,60.43,50,0
	.goto Durotar,43.07,60.24,50,0
	.goto Durotar,42.58,60.09,50,0
	.goto Durotar,42.02,61.19,50,0
	.goto Durotar,42.02,62.15,50,0
	.goto Durotar,42.00,62.92,50,0
	.goto Durotar,41.99,64.03,50,0
	.goto Durotar,41.30,65.03,50,0
    .xp 4 >>升级到4级
    .mob Mottled Boar
    .mob Scorpid Worker
    .mob Vile Familiar
step
    .goto Durotar,42.73,67.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .turnin 4402 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .target Galgar
    .isQuestComplete 4402
step
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    >>|cRXP_BUY_购买|r|T132794:0|t[清凉的泉水] |cRXP_BUY_从她处获得|r << !Rogue !Warrior !Hunter
    >>|cRXP_BUY_从她那里购买|r|T132382:0|t[劣质箭]|r << Hunter
    .collect 159,5,6394,1 << !Rogue !Warrior !Hunter --Refreshing Spring Water (5)
    .collect 2512,1000,6394,1 << Hunter --Rough Arrow (1000)
    .vendor >>出售垃圾
    .target Duokna
    .money >0.1 << Rogue/Warrior
    .itemcount 159,<5 << !Rogue !Warrior !Hunter !Shaman
    .itemcount 159,<2 << Shaman
    .itemcount 2512,<600 << Hunter
step
    #label Sting
    .goto Durotar,42.29,68.39,12,0
    .goto Durotar,42.06,68.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高内克|r交谈
    .turnin 789 >>交任务: |cRXP_FRIENDLY_工蝎的尾巴|r
    .target Gornek
step << Shaman
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘|r交谈
    .train 8042 >>训练 |T136026:0|t[地震术]
    .goto Durotar,42.39,69.00
    .accept 1516 >>接任务: |cRXP_LOOT_大地的召唤|r
    .goto Durotar,42.40,69.17
    .target Shikrik
    .target Canaga Earthcaller
step << Mage
    #xprate <1.5
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛娅|r交谈
    .train 116 >>训练 |T135846:0|t[冰箭]
    .target Mai'ah
step << Priest
    #xprate <1.5
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
    .train 589 >>训练你的职业法术
    .money <0.02
    .target Ken'jai
step << Priest
    #xprate <1.5
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
    .train 1243 >>训练 |T135987:0|t[真言术:坚韧]
    .train 589 >>训练 |T136207:0|t[暗言术:痛]
    .money <0.0105
    .target Ken'jai
step << Priest
    #xprate <1.5
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
    .train 589 >>训练 |T136207:0|t[暗言术:痛]
    .money <0.0095
    .target Ken'jai
step << !Warlock/wotlk
	.goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 792 >>交任务: |cRXP_FRIENDLY_邪灵劣魔|r
    .accept 794 >>接任务: |cRXP_LOOT_火刃奖章|r
    .target Zureetha Fargaze
step << Hunter
    #xprate <1.5
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jen'shan|r交谈
    .train 1978 >>训练 |T132204:0|t[蛇毒之刺]
    .target Jen'shan
 step << Warrior
    #xprate <1.5
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Frang
    .money <0.0190
step << Warrior
    #xprate <1.5
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 100 >>训练 |T132337:0|t[冲锋]
    .target Frang
    .money <0.0095
step
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thazz'ril|r交谈
    .turnin 5441 >>交任务: |cRXP_FRIENDLY_懒惰的苦工|r
    .accept 6394 >>接任务: |cRXP_LOOT_塔兹利尔的镐|r
    .target Foreman Thazz'ril
step
    #xprate <1.5
    #completewith next
    .xp 4+1720 >>升级至1720/2100点经验
    .mob Mottled Boar
    .mob Scorpid Worker
    .mob Vile Familiar
    .isOnQuest 4402
step
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
#loop
	.line Durotar,44.67,64.92,43.45,62.96,43.82,62.72,44.85,61.54,44.88,59.66,44.61,58.20,45.46,58.49,45.93,60.62,46.87,60.36,47.28,62.80,46.08,62.98,44.67,64.92
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
	.goto Durotar,44.67,64.92,25,0
    >>拾取仙人掌附近的|cRXP_LOOT_仙人掌果|r
    .complete 4402,1 --Cactus Apple (10) Vanilla/TBC, (6) WOTLK
step << !Warrior !Rogue !Shaman/wotlk
    #xprate <1.5
#loop
	.line Durotar,43.87,58.42,44.53,58.62,45.18,58.42,45.83,58.59,45.79,57.43,46.46,57.57,47.19,57.12,46.21,56.69,46.28,56.11,45.65,56.90,45.35,56.32,44.77,56.87,44.58,56.10,44.27,56.59,43.85,55.52,43.87,58.42
	.goto Durotar,43.87,58.42,45,0
	.goto Durotar,44.53,58.62,45,0
	.goto Durotar,45.18,58.42,45,0
	.goto Durotar,45.83,58.59,45,0
	.goto Durotar,45.79,57.43,45,0
	.goto Durotar,46.46,57.57,45,0
	.goto Durotar,47.19,57.12,45,0
	.goto Durotar,46.21,56.69,45,0
	.goto Durotar,46.28,56.11,45,0
	.goto Durotar,45.65,56.90,45,0
	.goto Durotar,45.35,56.32,45,0
	.goto Durotar,44.77,56.87,45,0
	.goto Durotar,44.58,56.10,45,0
	.goto Durotar,44.27,56.59,45,0
	.goto Durotar,43.85,55.52,45,0
	.goto Durotar,43.87,58.42,45,0
    .xp 4+1720 >>升级至1720/2100点经验
    .mob Vile Familiar
    .isOnQuest 4402
step << !Warrior !Rogue !Shaman/wotlk
    #xprate <1.5
#loop
	.line Durotar,43.87,58.42,44.53,58.62,45.18,58.42,45.83,58.59,45.79,57.43,46.46,57.57,47.19,57.12,46.21,56.69,46.28,56.11,45.65,56.90,45.35,56.32,44.77,56.87,44.58,56.10,44.27,56.59,43.85,55.52,43.87,58.42
	.goto Durotar,43.87,58.42,45,0
	.goto Durotar,44.53,58.62,45,0
	.goto Durotar,45.18,58.42,45,0
	.goto Durotar,45.83,58.59,45,0
	.goto Durotar,45.79,57.43,45,0
	.goto Durotar,46.46,57.57,45,0
	.goto Durotar,47.19,57.12,45,0
	.goto Durotar,46.21,56.69,45,0
	.goto Durotar,46.28,56.11,45,0
	.goto Durotar,45.65,56.90,45,0
	.goto Durotar,45.35,56.32,45,0
	.goto Durotar,44.77,56.87,45,0
	.goto Durotar,44.58,56.10,45,0
	.goto Durotar,44.27,56.59,45,0
	.goto Durotar,43.85,55.52,45,0
	.goto Durotar,43.87,58.42,45,0
    .xp 5 >>升级到5级
    .mob Vile Familiar
    .isQuestTurnedIn 4402
step
	#completewith Thazz
    #label Cave
    .goto Durotar,45.35,56.27,30 >>进入洞窟
    .isOnQuest 6394
step
	#completewith Thazz
    #requires Cave
    .goto Durotar,45.37,55.39,15,0
    .goto Durotar,44.43,54.51,15,0
    .goto Durotar,43.72,53.79,10 >>前往|cRXP_LOOT_塔兹利尔的镐|r
    .isOnQuest 6394
step << Shaman
    #completewith Yarrog
    #requires Cave
    >>击杀|cRXP_ENEMY_Felstalkers|r. 击败后搜刮出|cRXP_LOOT_Felstalker Hooves|r
    .complete 1516,1 --Felstalker Hoof (2)
    .mob Felstalker
step
    #label Thazz
    .goto Durotar,43.72,53.79
    >>战利品|cRXP_LOOT_塔兹里尔的镐|r靠墙放置
    .complete 6394,1 --Thazz'ril's Pick (1)
step
	#completewith next
    .goto Durotar,44.43,54.51,15,0
    .goto Durotar,44.77,53.33,15,0
    .goto Durotar,43.88,52.71,15,0
    .goto Durotar,43.39,52.07,15,0
    .goto Durotar,42.90,52.34,15,0
    .goto Durotar,42.70,52.99,35 >>前往|cRXP_ENEMY_亚罗格·刺影|r
step
    #label Yarrog
    .goto Durotar,42.70,52.99
    >>击杀|cRXP_ENEMY_亚罗格·刺影|r. 从他身上搜刮|cRXP_LOOT_火刃奖章|r
    .complete 794,1 --Burning Blade Medallion (1)
	.mob Yarrog Baneshadow
step << Shaman
#loop
	.line Durotar,42.70,52.99,42.97,51.14,43.56,52.05,43.74,52.65,44.13,52.85,44.82,52.51,44.83,53.40,44.78,54.57,45.14,55.02,45.51,55.23,45.14,55.02,44.51,55.03,44.21,54.12,43.92,54.30,43.87,55.22,43.46,55.56,43.05,55.24,42.38,54.22,42.53,53.48,43.27,53.82,42.70,52.99
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
	.goto Durotar,42.70,52.99,25,0
    >>击杀|cRXP_ENEMY_Felstalkers|r. 击败后搜刮出|cRXP_LOOT_Felstalker Hooves|r
    .complete 1516,1 --Felstalker Hoof (2)
    .mob Felstalker
step
    #xprate <1.5
#loop
	.line Durotar,42.70,52.99,42.97,51.14,43.56,52.05,43.74,52.65,44.13,52.85,44.82,52.51,44.83,53.40,44.78,54.57,45.14,55.02,45.51,55.23,45.14,55.02,44.51,55.03,44.21,54.12,43.92,54.30,43.87,55.22,43.46,55.56,43.05,55.24,42.38,54.22,42.53,53.48,43.27,53.82,42.70,52.99
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
	.goto Durotar,42.70,52.99,25,0
    .xp 5+1635 >>升级至1635+/2800经验值 << !Shaman
    .xp 5+645 >>升级至645/2800经验值 << Shaman
    .isQuestTurnedIn 4402
step
    #xprate <1.5
#loop
	.line Durotar,42.70,52.99,42.97,51.14,43.56,52.05,43.74,52.65,44.13,52.85,44.82,52.51,44.83,53.40,44.78,54.57,45.14,55.02,45.51,55.23,45.14,55.02,44.51,55.03,44.21,54.12,43.92,54.30,43.87,55.22,43.46,55.56,43.05,55.24,42.38,54.22,42.53,53.48,43.27,53.82,42.70,52.99
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
	.goto Durotar,42.70,52.99,25,0
    .xp 5+1255 >>升级至1255/2800经验值 << !Shaman
    .xp 5+265 >>升级至265级/2800经验值 << Shaman
    .isOnQuest 4402
step << skip --logout skip
	#completewith next
    .goto Durotar,44.70,52.47
    .goto Durotar,53.55,44.68,30 >>|cRXP_WARN_通过将角色 positioned 在岩石边缘, 直到看起来像是漂浮状态时, 执行登出跳过--即注销后重新登录|r
	.link https://www.youtube.com/watch?v=7vmnvdjbUnM >>点击这里
step
    .goto Durotar,51.95,43.50
    >>|cRXP_WARN_你可以从堡垒外或堡垒顶部与他交谈|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gar'thok|r交谈
    .accept 784 >>接任务: |cRXP_LOOT_背信弃义的人类|r
    .target Gar'thok
step
    #completewith next
    .goto Durotar,50.22,43.06,12,0
    .goto Durotar,50.09,42.97,8,0
    .goto Durotar,50.20,42.30,12,0
    .goto Durotar,49.96,40.96,12,0
    .goto Durotar,49.67,40.42,10 >>前往塔楼方向
step
    #completewith next
    .goto Durotar,49.75,40.38,6,0
    .goto Durotar,49.77,40.24,6,0
    .goto Durotar,49.69,40.21,6,0
    .goto Durotar,49.68,40.30,6,0
    .goto Durotar,49.78,40.34,6,0
    .goto Durotar,49.79,39.96,6,0
    .goto Durotar,49.60,40.04,8 >>登上塔楼, 前往弗尔
step
    .goto Durotar,49.89,40.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Furl|r交谈
    .accept 791 >>接任务: |cRXP_LOOT_新的背包|r
    .target Furl Scornbrow
step
    #completewith next
    .hs >>传送至试炼谷
step
    #xprate <1.5
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thazz'ril|r交谈
    .turnin 6394 >>交任务: |cRXP_FRIENDLY_塔兹利尔的镐|r
    .target Foreman Thazz'ril
step
    #xprate >1.4999
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thazz'ril|r交谈
    .turnin 6394 >>交任务: |cRXP_FRIENDLY_塔兹利尔的镐|r
    .target Foreman Thazz'ril
    .xp 5+1795,1 << !Shaman
    .xp 5+310,1 << Shaman
step
    .goto Durotar,42.73,67.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_戈加尔|r交谈
    .turnin 4402 >>交任务: |cRXP_FRIENDLY_戈加尔的清凉果|r
    .target Galgar
step
    .goto Durotar,42.59,67.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多克纳|r交谈
    .vendor >>出售垃圾
    .target Duokna
    .money >0.03
step
    .goto Durotar,42.85,69.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_祖雷萨|r交谈
    .turnin 794 >>交任务: |cRXP_FRIENDLY_火刃奖章|r
    .accept 805 >>接任务: |cRXP_LOOT_去森金村报到|r
    .target Zureetha Fargaze
step << Priest
    .goto Durotar,42.36,68.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯贾伊|r交谈
	.accept 5649 >>接任务: |cRXP_LOOT_部族的传统|r
	.train 591 >>训练 |T135924:0|t[惩戒]
    .train 17 >>训练 |T135940:0|t[真言术:盾]
    .target Ken'jai
step << Mage
    .goto Durotar,42.51,69.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛娅|r交谈
    .train 143 >>训练 |T135812:0|t[火球]
    .train 2136 >>训练 |T135807:0|t[火焰冲击]
    .target Mai'ah
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r和|cRXP_FRIENDLY_坎纳甘|r交谈
    .train 332 >>训练 |T136052:0|t[治疗波]
    .goto Durotar,42.39,69.00
    .turnin 1516 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
    .accept 1517 >>接任务: |cRXP_LOOT_大地的召唤|r
    .goto Durotar,42.40,69.17
    .target Shikrik
    .target Canaga Earthcaller
    .xp <6,1
step << Shaman
    .goto Durotar,42.40,69.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .turnin 1516 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
    .accept 1517 >>接任务: |cRXP_LOOT_大地的召唤|r
    .target Canaga Earthcaller
step << Hunter
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jen'shan|r交谈
    .train 1130 >>训练 |T132212:0|t[猎人印记]
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target Jen'shan
    .money <0.0190
step << Hunter
    .goto Durotar,42.84,69.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jen'shan|r交谈
    .train 3044 >>学习 |T132218:0|t[奥术射击]
    .target Jen'shan
step << Warrior
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 3126 >>训练 |T132269:0|t[招架]
    .train 6343 >>训练 |T136105:0|t[雷霆一击]
    .train 34428 >>训练 |T132342:0|t[胜利冲刺] << wotlk
    .target Frang
    .money <0.0285 << wotlk
    .money <0.0190 << tbc
step << Warrior
    .goto Durotar,42.89,69.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗朗恩|r交谈
    .train 3126 >>训练 |T132269:0|t[招架]
    .train 34428 >>训练 |T132342:0|t[胜利冲刺] << wotlk
    .target Frang
    .money <0.0190 << wotlk
    .money <0.0095 << tbc
step << Rogue
    #completewith Rwag2
    .goto Durotar,42.13,68.41,15,0
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.27,68.00,12 >>前往|cRXP_FRIENDLY_鲁瓦格|r
step << Rogue
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .train 1757 >>训练 |T136189:0|t[邪恶打击]
    .train 1776 >>训练 |T132155:0|t[割裂]
    .target Rwag
    .money <0.0190
step << Rogue
    .goto Durotar,41.27,68.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁瓦格|r交谈
    .train 1757 >>训练 |T136189:0|t[邪恶打击]
    .target Rwag
    .money <0.0095
step << Warlock wotlk
    #completewith Nartok3
    .goto Durotar,42.13,68.41,15,0
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.65,68.52,12 >>前往|cRXP_FRIENDLY_纳托克|r
step << Warlock tbc
    #completewith Hraug3
    .goto Durotar,42.13,68.41,15,0
    .goto Durotar,41.52,68.36,12,0
    .goto Durotar,41.24,68.16,12,0
    .goto Durotar,40.82,68.03,12,0
    .goto Durotar,40.56,68.44,12 >>前往赫劳格方向
step << Warlock tbc
    #label Hraug3
    .goto Durotar,40.56,68.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫劳格|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133738:0|t[血契法典]|r
    .collect 16321,1,817,1 --Grimoire of Blood Pact
    .vendor >>出售垃圾
    .target Hraug
    .money <0.0285
step << Warlock
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >>训练 |T136197:0|t[暗影箭]
    .train 1454 >>训练 |T136126:0|t[生命偷取]
    .target Nartok
    .money <0.0190
step << Warlock
    .goto Durotar,40.65,68.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳托克|r交谈
    .train 695 >>训练 |T136197:0|t[暗影箭]
    .target Nartok
    .money <0.0095
step << Warlock tbc
    #completewith Leave
    .train 20397 >>使用 |T133738:0|t[血契法典]
    .itemcount 16321,1
    .use 16321
step << Shaman
    #completewith CallOE1
    #label Shrine
    .goto Durotar,43.36,69.60,25,0
    .goto Durotar,43.18,70.93,25,0
    .goto Durotar,41.31,73.63,12,0
    .goto Durotar,40.82,74.37,8,0
    .goto Durotar,42.71,75.18,10,0
    .goto Durotar,43.57,75.51,15,0
    .goto Durotar,44.13,76.36,25 >>前往|cRXP_PICK_萨满圣地|r
    .isOnQuest 1517
step << Shaman
    #completewith next
    #requires Shrine
    .cast 8202 >>使用 |T134743:0|t[大地灵契]
    .use 6635
step << Shaman
    #label CallOE1
    .goto Durotar,44.03,76.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Manifestation|r交谈
    .turnin 1517 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
    .accept 1518 >>接任务: |cRXP_LOOT_大地的召唤|r
    .target Minor Manifestation of Earth
step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_坎纳甘·地鸣|r交谈
    .goto Durotar,42.40,69.17
    .turnin 1518 >>交任务: |cRXP_FRIENDLY_大地的召唤|r
    .target Canaga Earthcaller
step << Shaman
    .goto Durotar,42.39,69.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_史克里克|r交谈
    .train 332 >>训练 |T136052:0|t[治疗波]
    .target Shikrik
step
    #xprate >1.4999
    .goto Durotar,44.63,68.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thazz'ril|r交谈
    .turnin 6394 >>交任务: |cRXP_FRIENDLY_塔兹利尔的镐|r
    .target Foreman Thazz'ril
step
    #label Leave
    .goto Durotar,47.09,69.21,25,0
    .goto Durotar,49.02,69.13,20,0
    .goto Durotar,49.90,68.43,25 >>离开试炼谷
    .isOnQuest 805
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Horde
#name 6-10 杜隆塔尔
#displayname 6-10 杜隆塔尔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 部落 1-30
#next 10-13 杜隆塔尔 << Warrior/Shaman
#next 10-12 永歌森林 << !Warrior !Shaman

step
    .goto Durotar,52.06,68.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌克尔|r交谈
    .accept 2161 >>接任务: |cRXP_LOOT_苦工的重担|r
    .target Ukor
step
    .goto Durotar,54.3,73.3,15,0
    .goto Durotar,54.5,75.0,15,0
    .goto Durotar,54.1,76.6,15,0
    .goto Durotar,54.3,73.3,15,0
    .goto Durotar,54.5,75.0,15,0
    .goto Durotar,54.1,76.6
    >>与拉尔·普罗夫特苏克交谈. 他会在三个巡逻点之间来回巡逻
.target Lar Prowltusk
>>与|cRXP_FRIENDLY_拉尔·猎齿|r交谈
    .accept 786 >>接任务: |cRXP_LOOT_科卡尔半人马的进攻|r
    .unitscan Lar Prowltusk
step
    >>与小屋中的维尔林·弗昂交谈
.target Vel'rin Fang
>>与|cRXP_FRIENDLY_维林·利牙|r交谈
    .accept 817 >>接任务: |cRXP_LOOT_生活所需的虎皮|r
    .goto Durotar,56.0,73.9
    >>与池边的沃纳尔大师和加德林交谈
.target Master Vornal
>>与|cRXP_FRIENDLY_沃纳尔大师|r交谈
    .accept 818 >>接任务: |cRXP_LOOT_沃纳尔大师|r
    .goto Durotar,55.9,74.4
>>与|cRXP_FRIENDLY_加德林大师|r交谈
    .turnin 805 >>交任务: |cRXP_FRIENDLY_去森金村报到|r
    .goto Durotar,55.9,74.7
.target Master Gadrin
    .accept 808 >>接任务: |cRXP_LOOT_明希纳的颅骨|r
    .accept 826 >>接任务: |cRXP_LOOT_扎拉赞恩|r
    .accept 823 >>接任务: |cRXP_LOOT_向奥戈尼尔报告|r
step << Shaman
    .goto Durotar,56.5,73.1
    .vendor >>出售垃圾. 如果能凑够购买手杖(4s 80c)的钱, 就立刻出售；否则先离开, 等以后有钱了再回来
step << Shaman
    .goto Durotar,56.5,73.1
    .money <0.0480
    >>购买一根手杖并装备上
    .collect 2495,1 --Collect Walking Stick
step << Rogue
.goto Durotar,56.5,73.1
.vendor >>出售垃圾. 如果能凑够购买卷刃的剑(3s 82c)的钱. 如果暂时不够, 以后再来
step << Rogue
    .goto Durotar,56.5,73.1
    .money <0.0382
    >>购买一把卷刃的剑并装备上它
    .collect 2494,1 --Collect Stiletto
step << Orc Warrior
    .goto Durotar,56.5,73.1
.vendor >>出售垃圾. 如果能凑够购买双刃战斧(4金60银)的钱, 就立即出售；如果钱不够, 稍后再回来处理
step << Orc Warrior
    .goto Durotar,56.5,73.1
    .money <0.0460
    >>购买一把双刃战斧并装备上
    .collect 2491,1 --Collect Large Axe
step << Paladin
    .goto Durotar,56.5,73.1
.vendor >>出售垃圾. 如果能凑够购买步兵剑(5银9铜)的钱, 就立刻出售；若钱不够, 稍后再回来处理
step << Paladin
    .goto Durotar,56.5,73.1
    .money <0.0509
    >>购买一把步兵剑并装备上
    .collect 2488,1 --Collect Gladius
step << Hunter
    .goto Durotar,56.5,73.1
.vendor >>出售垃圾. 如果能凑够购买角木弯弓(2s 71c)的钱. 如果不够, 稍后再回来处理
step << Hunter
    .goto Durotar,56.5,73.1
    .money <0.0271
    >>购买一把角木弯弓并装备上
    .collect 2506,1 --Collect Hornwood Recurve Bow
step
#sticky
#completewith next
.goto Durotar,59.7,71.7,0
    .goto Durotar,57.6,77.9,0
    >>沿着海滩奔跑, 尽可能多地击杀海蟹和马鲛鱼, 收集黏液和眼睛. 此任务可稍后完成
    .complete 818,2 --Crawler Mucus (8)
    .complete 818,1 --Intact Makrura Eye (4)
step
    .goto Durotar,52.1,83.3,75 >>抵达海滩尽头
step
.goto Durotar,50.9,79.2,15 >>进入科卡尔营地
step
    #sticky
    #completewith Bonfire
    +如果科卡尼斯挡住了计划, 请在等级达到7级时将其击杀. 记得使用清凉果来获得+2耐力, 并使用之前获得的治疗药水
    .unitscan Warlord Kolkanis
step
    .goto Durotar,49.81,81.29
    >>在地面上帐篷里烧掉 |cRXP_PICK_Attack Plan|r
    .complete 786,1 --Attack Plan: Valley of Trials destroyed (1)
step
    >>在地上烧毁“作战计划”
    .goto Durotar,47.66,77.34
    .complete 786,2 --Attack Plan: Sen'jin Village destroyed (1)
step
    #label Bonfire
.goto Durotar,46.3,79.0
    .complete 786,3 --Attack Plan: Orgrimmar destroyed (1)
step
    #completewith bonfireskip
    .deathskip >>在篝火处死亡后, 会在灵魂医者处复活, 或跑回森金村
step << Shaman
    .goto Durotar,56.6,73.1
    .money <0.0480
    >>与门外楼梯下方的Traxexir交谈
    >>购买一根手杖并装备上
    .collect 2495,1 --Collect Walking Stick
step << Rogue
    .goto Durotar,56.5,73.1
    .money <0.0382
    >>与门外楼梯下方的Traxexir交谈
    >>购买一把卷刃的剑并装备上它
    .collect 2494,1 --Collect Stiletto
step << Orc Warrior
    .money <0.0460
    .goto Durotar,56.5,73.1
    >>与门外楼梯下方的Traxexir交谈
    >>购买一把双刃战斧并装备上
    .collect 2491,1 --Collect Large Axe
step << Paladin
    .goto Durotar,56.5,73.1
    .money <0.0509
    >>与门外楼梯下方的Traxexir交谈
    >>购买一把步兵剑并装备上
    .collect 2488,1 --Collect Gladius
step << Hunter
    .goto Durotar,56.5,73.1
    .money <0.0271
    >>购买一把角木弯弓并装备上
    .collect 2506,1 --Collect Hornwood Recurve Bow
step
    >>在掩体顶层内部
    .goto Durotar,51.9,43.5
.target Gar'Thok
>>与|cRXP_FRIENDLY_Gar'Thok|r交谈
    .accept 784 >>接任务: |cRXP_LOOT_背信弃义的人类|r
step
    #completewith next
    .goto Durotar,50.2,43.1,15 >>沿着这条路径往上走
step
    >>前往塔楼顶部, 与弗恩·凝眉交谈
.goto Durotar,49.9,40.3
.target Furl Scornbrow
>>与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .accept 791 >>接任务: |cRXP_LOOT_新的背包|r
step
    #sticky
    #label KulTiras
    .goto Durotar,59.2,58.3
>>击杀库尔提拉斯的怪物, 收集它们掉落的碎屑
    .complete 784,1 --Kul Tiras Sailor (10)
    .complete 784,2 --Kul Tiras Marine (8)
    .complete 791,1 --Canvas Scraps (8)
step
    #label bonfireskip
    .goto Durotar,59.7,58.3
    >>前往要塞顶层, 击杀本尼迪克上尉并搜刮他的钥匙——注意他使用盾牌猛击(可打断)
.complete 784,3 --Lieutenant Benedict (1)
.collect 4882,1 --Collect Benedict's Key (1)
step
.goto Durotar,59.8,57.8,8 >>往上走楼梯
step
.goto Durotar,59.9,57.5,8 >>往上走楼梯
step
>>打开宝箱. 从物品上接受任务
.goto Durotar,59.3,57.6
.collect 4881,1,830 --Collect Aged Envelope (1)
    .use 4881
.accept 830 >>接任务: |cRXP_LOOT_将军的命令|r
step
    .goto Durotar,58.4,57.2
.xp 7+2195 >>升级至2195/4500经验值
step
    #requires KulTiras
    #completewith next
.deathskip >>死亡后在灵魂医者处重生, 或跑回剃刀岭
step
    .goto Durotar,51.9,43.5
>>与|cRXP_FRIENDLY_Gar'Thok|r交谈
    .turnin 784 >>交任务: |cRXP_FRIENDLY_背信弃义的人类|r
.target Gar'Thok
    .accept 825 >>接任务: |cRXP_LOOT_海底沉船|r
    .turnin 830 >>交任务: |cRXP_FRIENDLY_将军的命令|r
    .accept 837 >>接任务: |cRXP_LOOT_野猪人的进犯|r
step
    .isOnQuest 823
    .goto Durotar,52.24,43.15
.target Orgnil Soulscar
>>与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
    .turnin 823 >>交任务: |cRXP_FRIENDLY_向奥戈尼尔报告|r
step << Shaman/Warrior
    .goto Durotar,52.24,43.15
>>与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
    .turnin 823 >>交任务: |cRXP_FRIENDLY_向奥戈尼尔报告|r
.target Orgnil Soulscar
    .accept 806 >>接任务: |cRXP_LOOT_黑暗风暴|r
step << !Shaman !Warrior
    #xprate <1.5
    .goto Durotar,52.24,43.15
.target Orgnil Soulscar
>>与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
    .turnin 823 >>交任务: |cRXP_FRIENDLY_向奥戈尼尔报告|r
step << Warlock/Shaman/Warrior
    #xprate <1.5
    .goto Durotar,51.9,43.5
.target Gar'Thok
>>与|cRXP_FRIENDLY_Gar'Thok|r交谈
.accept 831 >>接任务: |cRXP_LOOT_将军的命令|r
step
    #xprate <1.5
.goto Durotar,49.9,40.3
.target Furl Scornbrow
>>与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .turnin 791 >>交任务: |cRXP_FRIENDLY_新的背包|r
step
    >>与厨师托尔卡对话
    .goto Durotar,51.1,42.4
.target Cook Torka
>>与|cRXP_FRIENDLY_厨师托尔卡|r交谈
    .accept 815 >>接任务: |cRXP_LOOT_恐龙蛋大餐|r
step << !Shaman !Warrior
    #xprate <1.5
    .abandon 806 >>放弃黑暗风暴
step << Shaman
    #xprate <1.5
    .goto Durotar,52.0,40.5
    .money <0.0480
    >>购买一根手杖并装备上
    .collect 2495,1 --Collect Walking Stick
step << Rogue
    #xprate <1.5
    .goto Durotar,52.0,40.5
    .money <0.0382
    >>购买一把卷刃的剑并装备上它
    .collect 2494,1 --Collect Stiletto
step << Orc Warrior
    #xprate <1.5
    .goto Durotar,52.0,40.5
    .money <0.0460
    >>购买一把双刃战斧并装备上
    .collect 2491,1 --Collect Large Axe
step << Paladin
    #xprate <1.5
    .goto Durotar,52.0,40.5
    .money <0.0509
    >>购买一把步兵剑并装备上
    .collect 2488,1 --Collect Gladius
step << Hunter
    #xprate <1.5
    .goto Durotar,53.0,41.0
    .money <0.0271
    >>购买一把角木弯弓并装备上
    .collect 2506,1 --Collect Hornwood Recurve Bow
step << Warrior/Rogue
    #xprate <1.5
    .goto Durotar,52.0,40.7
    .money <0.0020
    .train 2020 >>学习锻造技能. 锻造可让你制作磨刀石(使武器伤害增加2点, 持续1小时). 如果你愿意, 可以跳过锻造和采矿
    .skill blacksmithing,1,1
step << Warrior/Rogue
    #xprate <1.5
.goto Durotar,51.8,40.9
    .money <0.0010
    .train 2580 >>学习采矿技能
    .cast 2580 >>在你的法术书中施放“寻找矿物”
step << Warrior/Rogue
    #xprate <1.5
    .goto Durotar,53.0,42.0
    .money <0.0077
.collect 2901,1 >>购买一把采矿镐, 留意矿脉进行开采, 以制作武器用的磨刀石
step << Shaman
    #xprate <1.5
    .goto Durotar,54.419,42.588
    .train 2484 >>施放地缚图腾
    .train 324 >>学习[闪电之盾]
    .train 8044 >>学习大地震击(等级2)
    .train 8018 >>学习石化武器(等级2)
step << Priest
    #xprate <1.5
    .goto Durotar,54.3,42.9
    .train 139 >>训练更新
    .train 2052 >>学习次级治疗术(等级2)
>>与|cRXP_FRIENDLY_泰金|r交谈
    .turnin 5649 >>接任务: |cRXP_LOOT_部族的传统|r
.target Tai'jin
    .accept 5648 >>接任务: |cRXP_LOOT_灵魂之衣|r
step << Priest
    .goto Durotar,53.1,46.5
    .cast 2052 >>对步兵科尔贾施放治疗术(等级2)
    .cast 1243 >>对步兵科贾施放真言术:坚韧(等级1)
    .complete 5648,1 --Heal and cast Fortify on Grunt Kor'ja
step << Priest
    .goto Durotar,54.3,42.9
.target Tai'jin
>>与|cRXP_FRIENDLY_泰金|r交谈
    .turnin 5648 >>接任务: |cRXP_LOOT_灵魂之衣|r
step << Warrior
.goto Durotar,54.190,42.468
    .train 284 >>学习英雄打击(等级2)
    .train 1715 >>训练腘绳肌
step << Hunter
    .goto Durotar,51.8,43.5
    .train 5116 >>训练震荡射击
step << Rogue
.goto Durotar,52.0,43.7
    .train 6760 >>学习刺骨(等级2)
    .train 5277 >>训练闪避
step << Warlock
    .goto Durotar,54.4,41.2
    .train 980 >>学习痛苦诅咒
    .train 5782 >>训练恐惧
step << Warrior/Rogue
    .goto Durotar,54.2,41.9
    .money <0.0095
    .train 3273 >>学习急救技能
step
    .goto Durotar,54.4,42.2
    .money <0.1184
.vendor >>从加尔克处购买一个6槽位的背包
step << Priest/Mage/Warlock/Shaman/Druid
    .goto Durotar,51.5,41.6
    >>与旅店老板交谈
.target Innkeeper Grosk
>>与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    .turnin 2161 >>交任务: |cRXP_FRIENDLY_苦工的重担|r
    .home >>将你的炉石设置为剃刀岭
    .vendor >>尽可能多地购买冰镇牛奶
step << Warrior/Rogue/Hunter
    .goto Durotar,51.5,41.6
    >>与旅店老板交谈
.target Innkeeper Grosk
>>与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    .turnin 2161 >>交任务: |cRXP_FRIENDLY_苦工的重担|r
    .home >>将你的炉石设置为剃刀岭
    .vendor >>尽可能多地购买肉排
step << Paladin
    .goto Durotar,51.5,41.6
    >>与旅店老板交谈
.target Innkeeper Grosk
>>与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    .turnin 2161 >>交任务: |cRXP_FRIENDLY_苦工的重担|r
    .home >>将你的炉石设置为剃刀岭
step << Warrior/Rogue/Paladin
    .goto Durotar,53.0,42.0
    .money <0.0077
.collect 2901,1 >>购买一把采矿镐. 留意矿脉, 采集矿石并通过锻造制作磨刀石, 用于强化你的武器
step << Paladin
    .goto Orgrimmar,49.1,94.7,20 >>进入奥格瑞玛
step << Paladin
    .goto Orgrimmar,32.272,35.794
    .trainer >>去训练你的职业法术
step << Paladin
    #completewith next
    .goto Durotar,59.2,58.3,15
    .hs >>炉石到剃刀岭
step
    #sticky
    #requires KulTiras
    #completewith Tools
    >>在这里击杀一些Makrura获取眼睛, 以及击杀海蟹获取粘液, 用于完成后续任务. 无需在此处完成全部内容
    .complete 818,1 --Intact Makrura Eye (4)
    .complete 818,2 --Crawler Mucus (8)
step
    #completewith next
    >>检查离岸边最近的船上的工具箱. 如果找不到, 再查看其他船只, 它们的位置可能有点难发现
    .goto Durotar,61.9,55.5,10 >>在水下的窗户里
    .goto Durotar,62.3,56.3,10 >>水下
    .goto Durotar,61.4,56.1,10 >>靠近岸边
step
    .goto Durotar,61.9,55.5,10,0
    .goto Durotar,62.3,56.3,10,0
    .goto Durotar,61.4,56.1,10,0
    .complete 825,1 --Gnomish Tools (3)
step
    #requires KulTiras
    #label Tools
    .goto Durotar,67.2,70.0,125 >>游到岛屿
step
    #sticky
    #completewith Fur
    >>击杀你所见的所有老虎, 以获取它们的虎皮
    .complete 817,1 --Durotar Tiger Fur (4)
step
    >>在这个岛的地面上拾取尾龙蛋. 它们通常由一只尾龙守护
    .goto Durotar,68.8,71.5
    .complete 815,1 --Taillasher Egg (3)
step
    #sticky
    #completewith Swim
    >>在这里杀死一些马库鲁拉(海蟹)来获取眼睛/爬虫类生物的粘液
    .complete 818,1 --Intact Makrura Eye (4)
    .complete 818,2 --Crawler Mucus (8)
step
    #label Swim
.goto Durotar,66.9,80.0,80 >>游到另一座岛屿
step
    #sticky
    #completewith Trolls
    >>击杀该区域的巨魔. 注意, 巫毒巨魔会治疗自己
    .complete 826,1 --Hexed Troll (8)
    .complete 826,2 --Voodoo Troll (8)
step << Shaman
    .goto Durotar,67.4,87.8
    >>击杀扎拉赞恩. 在他施放治疗波时使用大地震击. 拾取他的头颅
    .complete 826,3 --Zalazane's Head (1)
step << Rogue
    .goto Durotar,67.4,87.8
    >>击杀扎拉赞恩. 留着凿击, 等他施放治疗波时再使用. 抢走他的头颅
    .complete 826,3 --Zalazane's Head (1)
step << !Rogue !Shaman
    .goto Durotar,67.4,87.8
    >>击杀扎拉赞恩. 注意他能自我治疗(你可能需要一瓶治疗药水). 击杀后拾取他的头颅
    .complete 826,3 --Zalazane's Head (1)
step
    #label Trolls
.goto Durotar,67.4,87.8
    >>拾取地上的一个头骨
    .complete 808,1 --Minshina's Skull (1)
step
    #label Fur
>>击杀剩余的巨魔. 注意, 巫毒巨魔会治疗同伴
    .complete 826,1 --Hexed Troll (8)
    .complete 826,2 --Voodoo Troll (8)
step
>>完成收集剩余的虎皮
    .goto Durotar,64.7,88.5,30,0
    .goto Durotar,65.2,80.8,30,0
    .goto Durotar,59.9,83.6,30,0
    .goto Durotar,64.7,88.5,30,0
    .goto Durotar,65.2,80.8,30,0
    .goto Durotar,59.9,83.6,30,0
    .complete 817,1 --Durotar Tiger Fur (4)
step
     #completewith next
    .deathskip >>死亡后在灵魂医者处复活, 或跑回森金村
step
    >>从马库拉和海蟹处收集剩余物品
        .goto Durotar,59.7,71.7,50,0
    .goto Durotar,57.6,77.9,50,0
    .goto Durotar,59.7,71.7,50,0
    .goto Durotar,57.6,77.9,50,0
    .goto Durotar,59.7,71.7,50,0
    .goto Durotar,57.6,77.9,50,0
    .goto Durotar,59.7,71.7,50,0
    .goto Durotar,57.6,77.9
    .complete 818,1 --Intact Makrura Eye (4)
    .complete 818,2 --Crawler Mucus (8)
step << Mage
    >>进入帐篷内
.goto Durotar,56.3,75.1
    .train 205 >>学习冰霜箭(等级2)
.train 118 >>学习变形术
step
    >>返回森金村. 暂存微光徽记, 留待以后使用
.goto Durotar,55.9,74.7
.target Master Gadrin
>>与|cRXP_FRIENDLY_加德林大师|r交谈
    .turnin 808 >>交任务: |cRXP_FRIENDLY_明希纳的颅骨|r
    .turnin 826,1 >>交任务: |cRXP_FRIENDLY_扎拉赞恩|r << Warrior
    turnin 826 >>交任务: |cRXP_FRIENDLY_扎拉赞恩|r << !Warrior
step
    >>与沃纳尔大师和维尔林和拉尔·猎齿交谈
.target Master Vornal
>>与|cRXP_FRIENDLY_沃纳尔大师|r交谈
    .turnin 818 >>交任务: |cRXP_FRIENDLY_沃纳尔大师|r
    .goto Durotar,56.0,74.3
.target Vel'rin Fang
>>与|cRXP_FRIENDLY_维林·利牙|r交谈
    .turnin 817 >>交任务: |cRXP_FRIENDLY_生活所需的虎皮|r
    .goto Durotar,56.0,73.9
    .unitscan Lar Prowltusk
.target Lar Prowltusk
>>与|cRXP_FRIENDLY_拉尔·猎齿|r交谈
    .turnin 786 >>交任务: |cRXP_FRIENDLY_科卡尔半人马的进攻|r
    .goto Durotar,54.3,73.3
step
    #completewith next
    .goto Durotar,48.9,48.5
    .hs >>返回剃刀岭
step
    .goto Durotar,48.9,48.5
    >>杀死该区域的野猪人和斥候
    .complete 837,1 --Razormane Quilboar (4)
    .complete 837,2 --Razormane Scout (4)
step
    .goto Durotar,43.8,39.1
    >>击杀该区域内的尘跑者和战斗守卫. 尘跑者拥有“重生”(治疗)技能, 而战斗守卫则防御较高
    .complete 837,3 --Razormane Dustrunner (4)
    .complete 837,4 --Razormane Battleguard (4)
step
    .goto Durotar,43.8,39.1
    .xp 9+5175 >>升级至4550+/6500经验值
step
    .goto Durotar,51.9,43.5
    >>前往掩体
.target Gar'Thok
>>与|cRXP_FRIENDLY_Gar'Thok|r交谈
    .turnin 784 >>交任务: |cRXP_FRIENDLY_背信弃义的人类|r
    .turnin 830 >>交任务: |cRXP_FRIENDLY_将军的命令|r
    .turnin 837 >>交任务: |cRXP_FRIENDLY_野猪人的进犯|r
step << Hunter
    .xp <10,1
    .goto Durotar,51.8,43.5
.target Thotar
>>与|cRXP_FRIENDLY_索塔尔|r交谈
    .accept 6062 >>接任务: |cRXP_LOOT_驯服野兽|r
    .train 13165 >>训练鹰之守护
    .train 13549 >>训练毒蛇钉刺(等级2)
step << Warlock/Shaman/Warrior/Hunter
    #xprate >1.499
    .goto Durotar,51.9,43.5
.target Gar'Thok
>>与|cRXP_FRIENDLY_Gar'Thok|r交谈
.accept 831 >>接任务: |cRXP_LOOT_将军的命令|r
step
    >>与厨师托尔卡对话
    .goto Durotar,51.1,42.4
.target Cook Torka
>>与|cRXP_FRIENDLY_厨师托尔卡|r交谈
        .turnin 815 >>交任务: |cRXP_FRIENDLY_恐龙蛋大餐|r
step << Hunter
    .isOnQuest 6062
    .use 15917 >>在你的背包中使用驯兽棒对野猪进行驯服, 尽量在最大距离(30码)处操作
.goto Durotar,51.5,50.0
.complete 6062,1 --Tame a Dire Mottled Boar
step << !Shaman !Warrior
    .abandon 806 >>放弃黑暗风暴
step
    .goto Durotar,43.8,39.1
    .xp 10 >>升级至10级
step << Paladin
    #sticky
    #completewith next
    +如果你担心与永歌森林的竞争, 那么现在手动选择 10-13 杜隆塔尔→13-23 贫瘠之地
step << Shaman
    .goto Durotar,54.4,42.5
.target Swart
>>与|cRXP_FRIENDLY_斯瓦特|r交谈
    .accept 2983 >>接任务: |cRXP_LOOT_火焰的召唤|r
    .train 8075 >>训练大地之力图腾
    .train 8050 >>训练火焰冲击
step << Priest
    .goto Durotar,54.3,42.9
    .train 2053 >>学习初级治疗术(等级3)
    .train 8092 >>训练心灵爆裂
.train 594 >>学习暗言术:痛(等级2)
step << Orc Warrior/Troll Warrior/Undead Warrior
    .goto Durotar,54.190,42.468
.target Sorek
.target Tarshaw Jaggedscar
.target Krang Stonehoof
>>与|cRXP_FRIENDLY_克朗·石蹄|r交谈
-->>与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
-->>与|cRXP_FRIENDLY_索瑞克|r交谈
    .accept 1505 >>接任务: |cRXP_LOOT_老兵犹塞克|r
    .train 2687 >>训练血怒
    .train 6546 >>训练Rend(等级2)
step << Rogue
    .goto Durotar,52.0,43.7
    .train 2983 >>学习冲刺技能
    .train 674 >>训练双武器技能
    .train 6770 >>训练萨普
    .train 1784 >>潜行训练
step << Rogue
    .goto Durotar,56.5,73.1
    .money <0.0382
    .vendor >>购买另一把卷刃的剑并装备上
step << Warrior/Rogue/Paladin
.goto Durotar,54.2,41.9
    .money <0.0095
    .train 3273 >>学习急救技能
step << Warlock
    .goto Durotar,54.4,41.2
.target Ophek
>>与 |cRXP_FRIENDLY_奥菲克|r交谈
    .accept 1506 >>接任务: |cRXP_LOOT_甘鲁尔的召唤|r
step << Warlock
    .goto Durotar,54.4,41.2
    .train 1120 >>训练吸取灵魂
    .train 6201 >>学习制作治疗石
    .train 696 >>学习恶魔皮肤(等级2)
    .train 707 >>学习献祭(等级2)
step << Hunter
    .goto Durotar,51.8,43.5
.target Thotar
>>与|cRXP_FRIENDLY_索塔尔|r交谈
    .accept 6062 >>接任务: |cRXP_LOOT_驯服野兽|r
    .train 13165 >>训练鹰之守护
    .train 13549 >>训练毒蛇钉刺(等级2)
step << Hunter
    .goto Durotar,53.0,41.0
    .vendor >>购买并储备10级箭矢
step << Hunter
    .use 15917 >>在你的背包中使用驯兽棒对野猪进行驯服, 尽量在最大距离(30码)处操作
.goto Durotar,51.5,50.0
.complete 6062,1 --Tame a Dire Mottled Boar
    .unitscan Dire Mottled Boar
step << Hunter
    .goto Durotar,51.8,43.5
>>与|cRXP_FRIENDLY_索塔尔|r交谈
.turnin 6062 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Thotar
.accept 6083 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
    .use 15919 >>不要杀死你看到的硬甲蝎, 因为接下来需要驯服一只. 向北前往海滩, 驯服一只冲浪爬行者
.goto Durotar,59.3,27.6
.complete 6083,1 --Tame a Surf Crawler
    .unitscan Surf Crawler
step << Hunter
    >>返回剃刀岭
    .goto Durotar,51.8,43.5
>>与|cRXP_FRIENDLY_索塔尔|r交谈
.turnin 6083 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Thotar
.accept 6082 >>接任务: |cRXP_LOOT_驯服野兽|r
step << Hunter
    .use 15920 >>在物品栏中使用驯兽棒对一只蝎子进行驯服, 尽量在最大距离(30码)处操作
    .goto Durotar,59.3,27.6
    .complete 6082,1 --Tame an Armored Scorpid
    .unitscan Armored Scorpid
step << Hunter
    >>返回索塔尔
    .goto Durotar,51.8,43.5
>>与|cRXP_FRIENDLY_索塔尔|r交谈
    .turnin 6082 >>交任务: |cRXP_FRIENDLY_驯服野兽|r
.target Thotar
    .accept 6081 >>接任务: |cRXP_LOOT_训练野兽|r
step << Hunter
    >>沿着道路向北前进, 然后与雷兹拉克交谈
    .goto Durotar,46.4,22.9
.target Rezlak
>>与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .accept 834 >>接任务: |cRXP_LOOT_沙漠之风|r
step << Warlock/Hunter
    .goto Orgrimmar,49.0,94.2,20 >>进入奥格瑞玛
step << Hunter
    >>前往荣耀谷与奥马克·格里姆shot交谈
    .goto Orgrimmar,66.046,18.526
.target Ormak Grimshot
>>与 |cRXP_FRIENDLY_奥玛克·格里姆 shot|r 交谈
    .turnin 6081 >>交任务: |cRXP_FRIENDLY_训练野兽|r
step << Hunter tbc
    >>将“野兽训练”放在技能栏中. 记得稍后教你的宠物技能
.goto Orgrimmar,66.3,14.8
    .train 4195 >>训练强大的耐力
    .train 24547 >>学习天然护甲
step << Warlock
.goto Orgrimmar,48.246,45.281
>>与|cRXP_FRIENDLY_加恩鲁尔·血眼|r交谈
.turnin 1506 >>交任务: |cRXP_FRIENDLY_甘鲁尔的召唤|r
.target Gan'rul Bloodeye
.accept 1501 >>接任务: |cRXP_LOOT_虚空中的生物|r
step << Warlock/Hunter
    .goto Orgrimmar,34.340,36.328
.target Vol'jin
>>与|cRXP_FRIENDLY_Vol'jin|r交谈
    .turnin 831 >>交任务: |cRXP_FRIENDLY_将军的命令|r
step << Warlock
.goto Orgrimmar,31.62,37.82
.target Thrall
>>与|cRXP_FRIENDLY_萨尔|r谈话
.accept 5726 >>接任务: |cRXP_LOOT_隐藏的敌人|r
step << Warlock
    #sticky
    #completewith next
.goto Orgrimmar,36.0,37.7
>>取消你的恶魔皮肤增益效果. 跑到火盆上方, 使用生命分流技能自杀. 在奥格瑞玛外重生
step << Warlock/Hunter
.goto Orgrimmar,49.0,94.2,275 >>前往: |cRXP_PICK_杜隆塔尔|r
step << Warlock
.goto Durotar,55.0,9.7,25 >>进入骷髅石
step << Warlock
    #sticky
    #label Collars
>>击杀燃烧之刃成员, 直到掉落中尉徽章
    .complete 5726,1 --Lieutenant's Insignia (1)
step << Warlock
    #sticky
    #label Eye
    #completewith Skull
    .use 4945 >>另外, 你可以击杀Gazz'uz(14级术士)以获取任务物品. 务必使用之前获得的骷髅和任何拥有的药水, 或对虚空行者施用粘性胶水. 你可以利用“视野遮挡”(LoS)来规避他的暗影箭, 并恐惧他的宠物. 如果无法击杀他, 可尝试潜行绕过, 或死亡后在水中重生并绕过他
    .collect 4903,1,832 --Collect Eye of Burning Shadow
    .accept 832 >>接任务: |cRXP_LOOT_燃影之眼|r
    .unitscan Gazz'uz
step << Warlock
    .goto Durotar,53.6,8.5,10,0
    .goto Durotar,51.8,8.1,10,0
    .goto Durotar,51.6,9.8
    >>进入洞穴右侧路径, 继续沿洞穴前行, 抵达尽头后拾取宝箱
    .complete 1501,1 --Tablet of Verga (1)
step << Warlock
    #label Skull
    #completewith next
    .deathskip >>死亡后在灵魂医者处重生, 或跑往奥格瑞玛
step << Warlock
.goto Orgrimmar,49.0,94.2,20 >>进入奥格瑞玛
step << Warlock
.goto Orgrimmar,31.62,37.82
>>与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5726 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
.target Thrall
    .accept 5727 >>接任务: |cRXP_LOOT_隐藏的敌人|r
step << Warlock
    .goto Orgrimmar,48.246,45.281
>>与|cRXP_FRIENDLY_加恩鲁尔·血眼|r交谈
    .turnin 1501 >>交任务: |cRXP_FRIENDLY_虚空中的生物|r
.target Gan'rul Bloodeye
    .accept 1504 >>接任务: |cRXP_LOOT_誓缚|r
step << Warlock
    .isOnQuest 832
.goto Orgrimmar,49.473,50.589
.target Neeru Fireblade
>>与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 832 >>交任务: |cRXP_FRIENDLY_燃影之眼|r
step << Warlock
    >>与尼鲁交谈并完成他的对话选项
.goto Orgrimmar,49.473,50.589
    .skipgossip
    .complete 5727,1 --Gauge Neeru Fireblade's reaction to you being a member of the Burning Blade (1)
step << Warlock
    .goto Orgrimmar,49.5,50.0
    .use 7464>>使用召唤铭文召唤虚空行者并击杀它
    .complete 1504,1 --Summoned Voidwalker (1)
step << Warlock
    >>你现在可以召唤虚空行者了
.goto Orgrimmar,48.246,45.281
.target Gan'rul Bloodeye
>>与|cRXP_FRIENDLY_加恩鲁尔·血眼|r交谈
    .turnin 1504 >>交任务: |cRXP_FRIENDLY_誓缚|r
step << Warlock
.goto Orgrimmar,31.62,37.82
.target Thrall
>>与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5727 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
step << Warlock
    #sticky
    #completewith next
    .goto Orgrimmar,36.0,37.7
    >>取消你的恶魔皮肤增益效果. 跑到火盆上方, 使用生命分流技能自杀. 在奥格瑞玛外重生
step << Warlock
    .goto Orgrimmar,49.0,94.2,275 >>前往: |cRXP_PICK_杜隆塔尔|r
step << !Shaman !Warrior !Warlock !Hunter
    .goto Durotar,46.4,22.9
.target Rezlak
>>与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .accept 834 >>接任务: |cRXP_LOOT_沙漠之风|r
step << !Shaman !Warrior !Warlock
    >>搜刮地上的小袋子
.goto Durotar,51.7,27.7
    .complete 834,1 --Sack of Supplies (5)
step << !Shaman !Warrior !Warlock
    .goto Durotar,46.4,22.9
    >>返回雷兹拉克
>>与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 834 >>交任务: |cRXP_FRIENDLY_沙漠之风|r
.target Rezlak
    .accept 835 >>接任务: |cRXP_LOOT_保卫商路|r
step << !Shaman !Warrior !Warlock
    .goto Durotar,51.9,27.4,20 >>穿过这里的洞穴
step << !Shaman !Warrior !Warlock
    >>击杀该区域内的哈皮兽
    .goto Durotar,54.0,27.7,30,0
    .goto Durotar,51.3,23.5,30,0
    .goto Durotar,51.5,19.1,30,0
    .goto Durotar,54.0,27.7,30,0
    .goto Durotar,51.3,23.5,30,0
    .goto Durotar,51.5,19.1,30,0
    .complete 835,1 --Dustwind Savage (12)
    .complete 835,2 --Dustwind Storm Witch (8)
step << !Shaman !Warrior !Warlock
    #completewith next
    .deathskip >>死亡后在灵魂医者处重生, 或跑回雷兹拉克
step << !Shaman !Warrior !Warlock
    .goto Durotar,46.4,22.9
    >>返回雷兹拉克
.target Rezlak
>>与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 835,2 >>交任务: |cRXP_FRIENDLY_保卫商路|r << Hunter
    .turnin 835 >>交任务: |cRXP_FRIENDLY_保卫商路|r << !Hunter
step << Hunter tbc
    .goto Durotar,57.2,12.0
    .tame 3108 >>驯服一只硬壳海浪蟹(爪子等级为3)
step << !Shaman !Warrior
    #sticky
    #completewith next
+前往齐柏林飞艇塔. 乘坐齐柏林飞艇前往幽暗城
    .goto Durotar,50.8,13.8
step << !Shaman !Warrior
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step << !Shaman !Warrior
.goto Undercity,66.2,1.1,18 >>前往幽暗城
step << !Shaman !Warrior
.goto Undercity,62.0,11.3,18 >>往上走楼梯
step << !Shaman !Warrior
    .goto Undercity,54.63,11.28
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .zoneskip Eversong Woods
step << Paladin
    #completewith next
    .goto Silvermoon City,91.2,36.9
    .trainer >>去训练你的职业法术
]])

RXPGuides.RegisterGuide([[
#tbc
#wotlk
<< Horde
#name 10-13 杜隆塔尔
#displayname 10-13 杜隆塔尔 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 部落 1-30
#defaultfor Warrior !Tauren/Shaman !Tauren
#next 13-22 贫瘠之地
step
    .goto Durotar,50.8,43.6
.target Takrin Pathseeker
>>与|cRXP_FRIENDLY_塔克林·寻路者|r交谈
    .accept 840 >>接任务: |cRXP_LOOT_部落的新兵|r
step << Undead Warrior
    >>登上塔楼
.goto Durotar,49.9,40.3
.target Furl Scornbrow
>>与|cRXP_FRIENDLY_弗恩·凝眉|r交谈
    .accept 791 >>接任务: |cRXP_LOOT_新的背包|r
step << Undead Warrior
    .goto Durotar,52.0,40.7
    .money <0.0020
    .train 2020 >>学习锻造技能. 锻造可让你制作磨刀石(使武器伤害增加2点, 持续1小时). 如果你愿意, 可以跳过锻造和采矿
    .skill blacksmithing,1,1
step << Undead Warrior
    .goto Durotar,51.8,40.9
    .money <0.0010
    .train 2580 >>学习采矿技能
    .cast 2580 >>在你的法术书中施放“寻找矿物”
step << Undead Warrior
    .goto Durotar,53.0,42.0
    .money <0.0077
.collect 2901,1 >>购买一把采矿镐. 留意矿脉, 采集矿石并通过锻造制作磨刀石, 用于强化你的武器
step << Undead Warrior
    .goto Durotar,54.190,42.468
.target Sorek
.target Tarshaw Jaggedscar
.target Krang Stonehoof
>>与|cRXP_FRIENDLY_克朗·石蹄|r交谈
-->>与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
-->>与|cRXP_FRIENDLY_索瑞克|r交谈
    .accept 1505 >>接任务: |cRXP_LOOT_老兵犹塞克|r
step << Undead Warrior
>>掩体内部, 顶层
.goto Durotar,51.9,43.5
.target Gar'Thok
>>与|cRXP_FRIENDLY_Gar'Thok|r交谈
.accept 784 >>接任务: |cRXP_LOOT_背信弃义的人类|r
step << Undead Warrior
    #sticky
    #label KulTiras
>>击杀库尔提拉斯的怪物, 收集它们掉落的碎屑
    .complete 784,1 --Kul Tiras Sailor (10)
    .complete 784,2 --Kul Tiras Marine (8)
    .complete 791,1 --Canvas Scraps (8)
step << Undead Warrior
.goto Durotar,59.2,58.3,15 >>进入要塞
step << Undead Warrior
    .goto Durotar,59.7,58.3
    >>前往要塞顶层, 击杀本尼迪克上尉并搜刮他的钥匙——注意他使用盾牌猛击(可打断)
.complete 784,3 --Lieutenant Benedict (1)
.collect 4882,1 --Collect Benedict's Key (1)
step << Undead Warrior
.goto Durotar,59.8,57.8,8 >>往上走楼梯
step << Undead Warrior
.goto Durotar,59.9,57.5,8 >>往上走楼梯
step << Undead Warrior
>>打开宝箱. 从物品上接受任务
.goto Durotar,59.3,57.6
.collect 4881,1,830 --Collect Aged Envelope (1)
.accept 830 >>接任务: |cRXP_LOOT_将军的命令|r
step << Undead Warrior
    >>跑到森金那里
.goto Durotar,55.9,74.7
.target Master Gadrin
>>与|cRXP_FRIENDLY_加德林大师|r交谈
    .accept 808 >>接任务: |cRXP_LOOT_明希纳的颅骨|r
    .accept 826 >>接任务: |cRXP_LOOT_扎拉赞恩|r
    .accept 823 >>接任务: |cRXP_LOOT_向奥戈尼尔报告|r
step << Undead Warrior
    .goto Durotar,67.3,87.1,350 >>游到岛屿
step << Undead Warrior
    #sticky
    #completewith Trolls
    >>击杀该区域的巨魔. 注意, 巫毒巨魔会治疗自己
    .complete 826,1 --Hexed Troll (8)
    .complete 826,2 --Voodoo Troll (8)
step << Undead Warrior
    .goto Durotar,67.4,87.8
    >>击杀扎拉赞恩. 注意他能自我治疗(你可能需要一瓶治疗药水). 击杀后拾取他的头颅
    .complete 826,3 --Zalazane's Head (1)
step << Undead Warrior
    #label Trolls
.goto Durotar,67.4,87.8
    >>拾取地上的一个头骨
    .complete 808,1 --Minshina's Skull (1)
step << Undead Warrior
>>击杀剩余的巨魔. 注意, 巫毒巨魔会治疗同伴
    .complete 826,1 --Hexed Troll (8)
    .complete 826,2 --Voodoo Troll (8)
step << Undead Warrior
    #completewith next
    .deathskip >>死亡后在灵魂医者处复活, 或跑回森金村
step << Undead Warrior
    >>保存微光徽记, 留待以后使用
.goto Durotar,55.9,74.7
.target Master Gadrin
>>与|cRXP_FRIENDLY_加德林大师|r交谈
    .turnin 808 >>交任务: |cRXP_FRIENDLY_明希纳的颅骨|r
    .turnin 826 >>交任务: |cRXP_FRIENDLY_扎拉赞恩|r
step << Undead Warrior
    >>跑回剃刀岭
    .goto Durotar,52.24,43.15
>>与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
    .turnin 823 >>交任务: |cRXP_FRIENDLY_向奥戈尼尔报告|r
.target Orgnil Soulscar
    .accept 806 >>接任务: |cRXP_LOOT_黑暗风暴|r
step
    #xprate >1.499
    .goto Durotar,48.9,48.5
    >>杀死该区域的野猪人和斥候
    .complete 837,1 --Razormane Quilboar (4)
    .complete 837,2 --Razormane Scout (4)
step
    #xprate >1.499
    .goto Durotar,43.8,39.1
    >>击杀该区域内的尘跑者和战斗守卫. 尘跑者拥有“重生”(治疗)技能, 而战斗守卫则防御较高
    .complete 837,3 --Razormane Dustrunner (4)
    .complete 837,4 --Razormane Battleguard (4)
step
    .goto The Barrens,62.2,19.4
>>与|cRXP_FRIENDLY_卡加尔·战痕|r交谈
    .turnin 840 >>交任务: |cRXP_FRIENDLY_部落的新兵|r
.target Kargal Battlescar
    .accept 842 >>接任务: |cRXP_LOOT_十字路口征兵|r
step
    .goto The Barrens,62.2,19.4
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
step << Warrior
    .goto The Barrens,61.4,21.1
>>与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1505 >>交任务: |cRXP_FRIENDLY_老兵犹塞克|r
.target Uzzek
    .accept 1498 >>接任务: |cRXP_LOOT_防御之道|r
step << Orc Shaman/Troll Shaman
    .goto The Barrens,55.8,20.0
>>与|cRXP_FRIENDLY_卡纳尔·菲斯|r交谈
    .turnin 2983 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
.target Kranal Fiss
    .accept 1524 >>接任务: |cRXP_LOOT_火焰的召唤|r
step << !Tauren
#xprate <1.5
    .goto The Barrens,52.0,30.5,150 >>前往十字路口
step << Orc/Troll
#xprate <1.5
    .goto The Barrens,52.5,29.8
.target Zargh
>>与|cRXP_FRIENDLY_扎尔夫|r交谈
    .accept 6365 >>接任务: |cRXP_LOOT_送往奥格瑞玛的肉|r
step << !Tauren
#xprate <1.5
    .goto The Barrens,52.2,31.0
>>与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 842 >>交任务: |cRXP_FRIENDLY_十字路口征兵|r
.target Sergra Darkthorn
    .accept 844 >>接任务: |cRXP_LOOT_平原陆行鸟的威胁|r
step << !Tauren
#xprate <1.5
    .goto The Barrens,52.2,31.8
.target Tonga Runetotem
>>与|cRXP_FRIENDLY_图加·符文图腾|r谈话
    .accept 870 >>接任务: |cRXP_LOOT_遗忘之池|r
step << !Tauren
#xprate <1.5
    .goto The Barrens,51.9,30.3
.target Gazrog
>>与 |cRXP_FRIENDLY_加兹罗格|r交谈
    .accept 869 >>接任务: |cRXP_LOOT_偷钱的迅猛龙|r
step << !Tauren
#xprate <1.5
    #completewith next
    .goto The Barrens,52.3,32.0
    .vendor >>根据需要购买尽可能多的6槽背包
step << !Tauren
#xprate <1.5
    .goto The Barrens,51.5,30.8
.target Thork
>>与|cRXP_FRIENDLY_索克|r交谈
    .accept 871 >>接任务: |cRXP_LOOT_野猪人的袭击|r
    .accept 5041 >>接任务: |cRXP_LOOT_十字路口的补给品|r
step << !Tauren
#xprate <1.5
    .goto The Barrens,51.5,30.4
    .fp >>获取十字路口飞行路径
step << Orc/Troll
#xprate <1.5
    >>不要飞行前往奥格瑞玛
.goto The Barrens,51.5,30.3
>>与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .turnin 6365 >>交任务: |cRXP_FRIENDLY_送往奥格瑞玛的肉|r
.target Devrak
    .accept 6384 >>接任务: |cRXP_LOOT_飞往奥格瑞玛|r
step << !Tauren
#xprate <1.5
.goto The Barrens,51.5,30.1
.target Apothecary Helbrim
>>与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .accept 1492 >>接任务: |cRXP_LOOT_码头管理员迪兹维格|r
        .accept 848 >>接任务: |cRXP_LOOT_菌类孢子|r
step << !Tauren
#xprate <1.5
    #sticky
    #completewith next
    >>收集被遗忘之池周围的白色蘑菇. 尽量避开怪物
.complete 848,1 --Collect Fungal Spores (x4)
step << !Tauren
#xprate <1.5
>>潜入水下, 抵达气泡裂隙
.goto The Barrens,45.1,22.5
    .complete 870,1 --Explore the waters of the Forgotten Pools
step << !Tauren
#xprate <1.5
>>收集被遗忘之池周围的白色蘑菇. 尽量避开怪物
.goto The Barrens,45.2,23.3,40,0
.goto The Barrens,45.2,22.0,40,0
    .goto The Barrens,44.6,22.5,40,0
    .goto The Barrens,43.9,24.4,40,0
.complete 848,1 --Collect Fungal Spores (x4)
step << !Tauren tbc
#xprate <1.5
    #completewith next
    .deathskip >>死亡后在灵魂医者处复活, 或跑回十字路口
step << !Tauren
#xprate <1.5
    .goto The Barrens,51.5,30.1
    >>与赫尔布林交谈. 药剂师扎玛的任务是限时任务, 如果在提交前需要离开, 请及时退出游戏
>>与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .turnin 848 >>交任务: |cRXP_FRIENDLY_菌类孢子|r
.target Apothecary Helbrim
    .accept 853 >>接任务: |cRXP_LOOT_药剂师扎玛|r
    .timer 2700,Timer to reach Thunder Bluff
step << !Tauren
#xprate <1.5
    #completewith CampTaurajoFP
 +药剂师扎玛是一个限时任务, 如果在提交任务前需要离开, 请及时退出游戏
step << !Tauren
#xprate <1.5
    .goto The Barrens,52.2,31.8
>>与|cRXP_FRIENDLY_图加·符文图腾|r谈话
    .turnin 870 >>交任务: |cRXP_FRIENDLY_遗忘之池|r
.target Tonga Runetotem
    .accept 877 >>接任务: |cRXP_LOOT_死水绿洲|r
step << !Tauren
    #label CampTaurajoFP
#xprate <1.5
    >>沿着道路跑
.goto The Barrens,44.4,59.2
    .fp Camp Taurajo >>获取陶拉祖营地飞行路径
--X add the actual flight path name to each .fp command. MAKE SURE to check it on the flight map itself as it may differ from the name of the subzone
step << !Tauren
#xprate <1.5
    .line Mulgore,69.0,60.0,58.4,61.7,51.9,59.3
    .goto Mulgore,51.4,59.2,50,0
    .goto Mulgore,59.6,62.4,50,0
    .goto Mulgore,51.4,59.2,50,0
    .goto Mulgore,59.6,62.4,50,0
        .goto Mulgore,51.4,59.2
    >>任务发布者沿整条道路巡逻
    .unitscan Morin Cloudstalker
.target Morin Cloudstalker
>>与|cRXP_FRIENDLY_摩林·云行者|r交谈
    .accept 749 >>接任务: |cRXP_LOOT_不幸的商队|r
step << !Tauren
#xprate <1.5
    .goto Mulgore,48.2,53.4
.target Ahab Wheathoof
>>与|cRXP_FRIENDLY_阿哈布·麦蹄|r交谈
    .accept 11129 >>接任务: |cRXP_LOOT_凯雷失踪了！|r
step << !Tauren
#xprate <1.5
    .goto Mulgore,53.7,48.1
    >>穿过湖泊, 然后打开商队中间的宝箱
    .turnin 749 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 751 >>接任务: |cRXP_LOOT_不幸的商队|r
step << !Tauren
#xprate <1.5
    .goto Mulgore,55.5,55.8
    >>击杀一只平原陆行鸟, 获取鲜嫩的陆行鸟肉
    .collect 33009,1 --Collect Tender Strider Meat (1)
step << !Tauren
#xprate <1.5
    .line Mulgore,51.9,59.3,58.4,61.7,69.0,60.0
    .goto Mulgore,51.4,59.2,50,0
    .goto Mulgore,59.6,62.4,50,0
    .goto Mulgore,51.4,59.2,50,0
    .goto Mulgore,59.6,62.4,50,0
        .goto Mulgore,51.4,59.2
    .unitscan Morin Cloudstalker
.target Morin Cloudstalker
>>与|cRXP_FRIENDLY_摩林·云行者|r交谈
    .turnin 751 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
step << !Tauren
#xprate <1.5
    .goto Mulgore,47.3,56.9,30,0
    .goto Mulgore,49.4,63.9,30,0
    .goto Mulgore,50.2,60.2,30,0
    .goto Mulgore,46.8,59.6,30,0
    .use 33009 >>找到狂暴的凯雷. 他会在城镇中顺时针巡逻(因此请逆时针绕行). 走到他面前, 使用鲜嫩的陆行鸟肉
    .unitscan Kyle the Frenzied
.complete 11129,1 --Kyle Fed (1)
step << !Tauren
#xprate <1.5
    .goto Mulgore,48.3,53.3
.target Ahab Wheathoof
>>与|cRXP_FRIENDLY_阿哈布·麦蹄|r交谈
    .turnin 11129 >>交任务: |cRXP_FRIENDLY_凯雷失踪了！|r
step << !Tauren
#xprate <1.5
.goto Thunder Bluff,32.0,66.9,20 >>跑到电梯处, 乘坐它前往雷霆崖
step << !Tauren !Paladin
#xprate <1.5
    .goto Thunder Bluff,40.9,62.7
    .train 227 >>训练法杖 << !Shaman wotlk
    .train 199 >>学习2小时锤类武器技能
step << Paladin
#xprate <1.5
    .goto Thunder Bluff,40.9,62.7
    .train 199 >>学习2小时锤类武器技能
step << !Tauren
#xprate <1.5
.goto Thunder Bluff,45.6,52.0,15 >>登上塔楼
step << !Tauren
#xprate <1.5
    >>前往塔顶
.goto Thunder Bluff,46.8,49.9
    .fp >>获取雷霆崖飞行点
step << !Tauren
#xprate <1.5
.goto Thunder Bluff,29.6,29.7,15 >>跳入洞穴
step << !Tauren
#xprate <1.5
    .goto Thunder Bluff,23.0,21.1
.target Apothecary Zamah
>>与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >>交任务: |cRXP_FRIENDLY_药剂师扎玛|r
step << !Tauren
#xprate <1.5
    #completewith next
    .hs >>炉石到剃刀岭
step
    .goto Durotar,43.1,30.3
.target Misha Tor'kren
>>与|cRXP_FRIENDLY_米沙·托克伦|r交谈
    .accept 816 >>接任务: |cRXP_LOOT_丢失的孩子|r
step
    .goto Durotar,46.4,22.9
.target Rezlak
>>与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .accept 834 >>接任务: |cRXP_LOOT_沙漠之风|r
step
    >>搜刮地上的小袋子
.goto Durotar,51.7,27.7
    .complete 834,1 --Sack of Supplies (5)
step
    .goto Durotar,46.4,22.9
>>与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 834 >>交任务: |cRXP_FRIENDLY_沙漠之风|r
.target Rezlak
    .accept 835 >>接任务: |cRXP_LOOT_保卫商路|r
step << wotlk
    .goto Durotar,42.103,15.0161
.target Rhinag
>>与|cRXP_FRIENDLY_林纳格|r交谈
    .accept 812 >>接任务: |cRXP_LOOT_救命如救火|r
step << tbc
    .goto Durotar,41.54,18.59
    >>|cRXP_WARN_这将启动任务的45分钟计时器. 接下来的5分钟内请勿离开或退出游戏|r
    >>与|cRXP_FRIENDLY_林纳格|r交谈
    .accept 812 >>接任务: |cRXP_LOOT_救命如救火|r
    .target Rhinag
step
.goto Orgrimmar,49.0,94.2,20 >>进入奥格瑞玛
step << Orc/Troll
#xprate <1.5
    .goto Orgrimmar,54.2,68.6
>>与|cRXP_FRIENDLY_旅店老板格雷什卡|r交谈
    .turnin 6384 >>交任务: |cRXP_FRIENDLY_飞往奥格瑞玛|r
.target Innkeeper Gryshka
    .accept 6385 >>接任务: |cRXP_LOOT_双足飞龙管理员多拉斯|r
step << Orc/Troll
#xprate <1.5
    .goto Orgrimmar,45.120,63.889
     >>交任务, 但不要飞回十字路口
>>与|cRXP_FRIENDLY_多拉斯|r交谈
    .turnin 6385 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员多拉斯|r
.target Doras
    .accept 6386 >>接任务: |cRXP_LOOT_返回十字路口|r
step << Orc/Troll
    .goto Orgrimmar,34.340,36.328
    >>从飞行路径塔穿过桥梁
.target Vol'jin
>>与|cRXP_FRIENDLY_Vol'jin|r交谈
    .turnin 831 >>交任务: |cRXP_FRIENDLY_将军的命令|r
step
    .goto Orgrimmar,31.62,37.82
.target Thrall
>>与|cRXP_FRIENDLY_萨尔|r谈话
    .accept 5726 >>接任务: |cRXP_LOOT_隐藏的敌人|r
step << Paladin
    .goto Orgrimmar,32.272,35.794
    .trainer >>去训练你的职业法术
step
    .goto Orgrimmar,47.24,53.58
    >>进入暗影裂口
.target Kor'ghan
>>与|cRXP_FRIENDLY_Kor'ghan|r交谈
    .accept 813 >>接任务: |cRXP_LOOT_寻找解毒剂|r
step
    #completewith Fizzle
    .goto Orgrimmar,53.03,48.78
    .subzone 2437 >>进入怒焰裂谷
	.xp >11,1
--/dump C_Map.GetBestMapForUnit("player")
step
    #completewith Fizzle
    .deathskip >>在灵魂医者处死亡并重生
	.xp >11,1
--If player is 10 or lower
step
    #completewith next
    .goto Orgrimmar,49.0,94.2
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
	.xp <11,1
--If player is 11 or higher
step
    #label Fizzle
    >>击杀菲兹尔并搜刮他的利爪. 尝试清理周围营地的怪物, 以腾出空间
    .goto Durotar,41.9,26.0
    .complete 806,1 --Fizzle's Claw (1)
step << !Warrior
    #completewith next
.goto Durotar,39.2,32.3,30 >>离开雷霆岭
step << Warrior
    .goto Durotar,39.2,32.3
    >>击杀闪电蜥蜴, 获取烧焦的鳞片. 途中请跟随箭头指向出口的方向前进
    .complete 1498,1 --Singed Scale (5)
step << Warrior
    .isQuestComplete 1498
    #sticky
    #completewith next
.goto Durotar,39.2,32.3,30 >>离开雷霆岭
step
    #completewith kronsamu
    .complete 813,1 --Venomtail Poison Sac (4)
step
    #label kronsamu
>>开始击杀鳄鱼以获取护身符
    >>在向南前进时击杀他们. 接下来我们要完成你的图腾任务 << Troll Shaman/Orc Shaman
    .goto Durotar,35.2,27.5,60,0
    .goto Durotar,35.7,57.8,60,0
    .goto Durotar,35.2,27.5,60,0
    .goto Durotar,35.7,57.8
    .complete 816,1 --Kron's Amulet (1)
step << Troll Shaman/Orc Shaman
    #completewith shamancallfire
    .complete 813,1 --Venomtail Poison Sac (4)
step << Troll Shaman/Orc Shaman
    #label shamancallfire
.goto Durotar,36.6,58.0,15 >>沿着山路跑上山
step << Troll Shaman/Orc Shaman
    .goto Durotar,38.6,59.0
>>与|cRXP_FRIENDLY_泰尔夫·祖拉姆|r交谈
    .turnin 1524 >>交任务: |cRXP_FRIENDLY_火焰的召唤|r
.target Telf Joolam
    .accept 1525 >>接任务: |cRXP_LOOT_火焰的召唤|r
step
    #completewith next
    .deathskip >>死亡后在灵魂医者处重生, 或跑回剃刀岭
step
.goto Durotar,52.24,43.15
>>与|cRXP_FRIENDLY_奥戈尼尔·魂痕|r交谈
    .turnin 806 >>交任务: |cRXP_FRIENDLY_黑暗风暴|r
.target Orgnil Soulscar
    .accept 828 >>接任务: |cRXP_LOOT_玛高兹|r
step << Shaman
    #sticky
    #completewith next
    #level 12
    .trainer >>如果你打算和他人一起玩, 请先训练先祖之魂
step << Shaman
    #level 12
    .goto Durotar,54.3,42.4
    .train 547 >>学习治疗波(等级3)
    .train 1535 >>学习[火焰新星图腾]
step << Warrior
    #level 12
    .goto Durotar,54.3,42.4
    .train 5242 >>训练战斗怒吼(等级2)
    .train 7384 >>训练压制
step << !Warrior
    .goto Durotar,54.4,42.2
.vendor >>从加尔克处购买6格背包, 直到无法装备新背包为止
step
    #xprate >1.499
    .goto Durotar,51.9,43.5
.target Gar'Thok
>>与|cRXP_FRIENDLY_Gar'Thok|r交谈
    .turnin 837 >>交任务: |cRXP_FRIENDLY_野猪人的进犯|r
step
    >>离开剃刀岭, 向东前行, 然后一直向北走
    .goto Durotar,55.6,36.6,80,0
    .goto Durotar,56.4,20.1
>>与|cRXP_FRIENDLY_玛高兹|r交谈
    .turnin 828 >>交任务: |cRXP_FRIENDLY_玛高兹|r
.target Margoz
    .accept 827 >>接任务: |cRXP_LOOT_骷髅石|r
step
    #sticky
    #completewith next
    >>旅行途中击杀蝎子以获取毒囊
    .goto Durotar,55.7,15.7
    .complete 813,1 --Venomtail Poison Sac (4)
step
    #sticky
    #label Collars2
   .goto Durotar,51.8,10.0
>>在骷髅石击杀火刃氏族怪物, 以获取灼热项圈, 直至中尉徽章掉落
    .complete 827,1 --Searing Collar (6)
    .complete 5726,1 --Lieutenant's Insignia (1)
step << Orc Shaman/Troll Shaman/Orc Warrior/Troll Shaman/Troll Warrior
    .use 4945 >>击杀加兹乌兹以获取燃烧阴影之眼. 他可能出现在洞穴的多个区域. 使用之前保存的微光徽记, 对虚空行者施加黏性胶水以减少所受伤害, 并用治疗药水恢复生命值. 利用视野(LoS)躲避他的暗影箭. 如果这意味着杀死并拾取加兹乌兹, 请不要害怕死亡
.goto Durotar,51.8,10.0
.collect 4903,1,832 --Collect Eye of Burning Shadow
    .accept 832 >>接任务: |cRXP_LOOT_燃影之眼|r
    .unitscan Gazz'uz
step << Tauren Shaman/Tauren Warrior/Undead Warrior/Paladin
    .use 4945 >>击杀加兹乌兹以获取燃烧阴影之眼. 他可能出现在洞穴的多个区域. 如果有治疗药水, 请使用它们恢复生命值. 利用视线(LoS)躲避他的暗影箭. 如果这意味着击杀并拾取加兹乌兹, 不要害怕死亡
.goto Durotar,51.8,10.0
.collect 4903,1,832 --Collect Eye of Burning Shadow
    .accept 832 >>接任务: |cRXP_LOOT_燃影之眼|r
    .unitscan Gazz'uz
step
    #requires Collars2
    #sticky
    #completewith harpingme
    >>旅行途中击杀蝎子以获取毒囊
    .goto Durotar,55.7,15.7
    .complete 813,1 --Venomtail Poison Sac (4)
step
.goto Durotar,56.4,20.1
>>与|cRXP_FRIENDLY_玛高兹|r交谈
    .turnin 827 >>交任务: |cRXP_FRIENDLY_骷髅石|r
.target Margoz
    .accept 829 >>接任务: |cRXP_LOOT_尼尔鲁·火刃|r
step << Shaman
    .isOnQuest 1525
    .goto Durotar,56.3,28.0,60,0
    .goto Durotar,52.8,28.7,20 >>向南走, 然后进入此处洞穴, 位于鹰身女妖区域上方
step << Shaman
    >>击杀火刃祭司以获取试剂袋
.goto Durotar,52.5,26.7
    .complete 1525,2 --Reagent Pouch (1)
step << Shaman
    .isOnQuest 1525
    .goto Durotar,52.8,28.7,20 >>离开洞穴
step
    .goto Durotar,54.0,27.7,30,0
    .goto Durotar,51.3,23.5,30,0
    .goto Durotar,51.5,19.1,30,0
    .goto Durotar,54.0,27.7,30,0
    .goto Durotar,51.3,23.5,30,0
    .goto Durotar,51.5,19.1,30,0
    >>击杀该区域内的哈皮兽
    .complete 835,1 --Dustwind Savage (12)
    .complete 835,2 --Dustwind Storm Witch (8)
step
    #completewith next
    .deathskip >>死亡后在灵魂医者处重生, 或跑回雷兹拉克
step
    >>返回雷兹拉克
    .goto Durotar,46.4,22.9
.target Rezlak
>>与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 835 >>交任务: |cRXP_FRIENDLY_保卫商路|r
step
    >>击杀蝎子获取毒囊
    .goto Durotar,55.7,15.7
    .complete 813,1 --Venomtail Poison Sac (4)
step << Warrior/Rogue
	.goto Orgrimmar,81.2,19.0
	.collect 25873,1 >>从Zen'do'jian处购买一把破损的锋利飞刀
step
.goto Orgrimmar,31.62,37.82
>>与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5726 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
.target Thrall
    .accept 5727 >>接任务: |cRXP_LOOT_隐藏的敌人|r << Shaman
step
    .goto Orgrimmar,47.24,53.58
.target Kor'ghan
>>与|cRXP_FRIENDLY_Kor'ghan|r交谈
    .turnin 813 >>交任务: |cRXP_FRIENDLY_寻找解毒剂|r
step
    .goto Orgrimmar,49.473,50.589
>>与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 829 >>交任务: |cRXP_FRIENDLY_尼尔鲁·火刃|r
.target Neeru Fireblade
    .accept 809 >>接任务: |cRXP_LOOT_雅克塞罗斯|r
step
    .isOnQuest 832
    .goto Orgrimmar,49.473,50.589
.target Neeru Fireblade
>>与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 832 >>交任务: |cRXP_FRIENDLY_燃影之眼|r
step << Shaman
    .goto Orgrimmar,49.473,50.589
    >>与尼尔鲁·火刃交谈
    .complete 5727,1
    .skipgossip 3216,1
--If NPC has an active quest accept/turnin (available or unavailable) you must add NPCID,X (X being the TALK ONLY gossip, which is 1 99% of the time)
step
    #completewith LostBut
    .goto Orgrimmar,53.03,48.78
    .subzone 2437 >>进入怒焰裂谷
step
    #completewith LostBut
    .deathskip >>在灵魂医者处死亡并重生
step << tbc
    .goto Durotar,41.6,18.7
    >>即使显示“缺少前置条件”, 你仍然可以提交此任务
.target Rhinag
>>与|cRXP_FRIENDLY_林纳格|r交谈
    .turnin 812 >>交任务: |cRXP_FRIENDLY_救命如救火|r
step << wotlk
    .goto Durotar,42.103,15.0161
    >>即使显示“缺少前置条件”, 你仍然可以提交此任务
.target Rhinag
>>与|cRXP_FRIENDLY_林纳格|r交谈
    .turnin 812 >>交任务: |cRXP_FRIENDLY_救命如救火|r
step
    #label LostBut
    .goto Durotar,43.1,30.3
.target Misha Tor'kren
>>与|cRXP_FRIENDLY_米沙·托克伦|r交谈
    .turnin 816 >>交任务: |cRXP_FRIENDLY_丢失的孩子|r
step
    .goto The Barrens,62.3,20.1
>>与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
    .turnin 809 >>交任务: |cRXP_FRIENDLY_雅克塞罗斯|r
.target Ak'Zeloth
    .accept 924 >>接任务: |cRXP_LOOT_恶魔之种|r
step
    .goto The Barrens,62.3,20.0
    >>拾取阿克泽洛斯旁边的紫色石头. 该物品有30分钟的倒计时, 务必迅速处理
    .collect 4986,1
    .turnin 926 >>交任务: |cRXP_FRIENDLY_有瑕疵的能量石|r
step << Warrior
    .goto The Barrens,61.4,21.1
>>与|cRXP_FRIENDLY_犹塞克|r交谈
    .turnin 1498 >>交任务: |cRXP_FRIENDLY_防御之道|r
.target Uzzek
    .accept 1502 >>接任务: |cRXP_LOOT_索恩格瑞姆·火眼|r
]])
