local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 1-6 亡灵
#displayname 1-6 亡灵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 1-20
#defaultfor Undead
#next 6-13 亡灵族

step << !Undead
    #completewith next
    +|cRXP_WARN_您选择的指南适用于亡灵种族. 建议您选择与您初始起始区域相同的区域|r
step
    #completewith Zombies
	.destroy 6948 >>摧毁: |cRXP_ENEMY_炉石|r, 它在你的背包中. 不再需要它了
step
    #completewith next
    .goto Tirisfal Glades,30.04,72.78,8,0
    .goto Tirisfal Glades,30.27,72.78,8,0
    .goto Tirisfal Glades,30.22,71.65,10 >>跑出墓穴, 朝|cRXP_FRIENDLY_Mordo|r跑去
step
    .goto Tirisfal Glades,30.22,71.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mordo|r交谈
    .accept 363 >>接任务: |cRXP_LOOT_突然醒来|r
    .target Undertaker Mordo
step << Warrior/Warlock/Priest/Mage
    #completewith Vendor
    .goto Tirisfal Glades,30.70,69.28,0 << Warrior/Warlock
    .goto Tirisfal Glades,29.92,70.30,40,0
    .goto Tirisfal Glades,30.70,69.28,40,0
    .goto Tirisfal Glades,29.18,68.94,40,0 << Priest/Mage
    .goto Tirisfal Glades,29.10,67.66,40,0 << Priest/Mage
    .goto Tirisfal Glades,30.19,65.32,40,0 << Priest/Mage
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r. 掠夺它们, 直到你获得价值60铜的可出售物品(包括你的装备)|r << Mage
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r. 击败它们并拾取战利品, 直到你获得总价值50铜币的可出售物品(包括你的装备)|r << Priest
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r. 击败它们并搜刮战利品, 直到你获得总价值10铜币的可出售物品(包括你的装备)|r << Warrior/Warlock
    .mob Young Scavenger
    .mob Duskbat
    .money >0.01
step << Warrior/Priest/Mage
    #completewith Training1
    .goto Tirisfal Glades,32.22,65.64,8 >>进入建筑内部
step << Priest/Mage
    #label Vendor
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132794:0|t[清凉的泉水]|r
    .vendor >>出售垃圾
	.collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .target Joshua Kien
step << Warlock/Mage
    #sticky
    #label Piercing
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Venya|r和|cRXP_FRIENDLY_Sarvis|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈 << Mage
    .accept 1470 >>接任务: |cRXP_LOOT_控制小鬼|r << Warlock
    .goto Tirisfal Glades,30.98,66.41 << Warlock
    .target +Venya Marthand << Warlock
    .turnin 363 >>交任务: |cRXP_FRIENDLY_突然醒来|r
    .accept 364 >>接任务: |cRXP_LOOT_无脑的僵尸|r
    .target +Shadow Priest Sarvis
    .goto Tirisfal Glades,30.84,66.20
step << Warlock/Mage
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 376 >>接任务: |cRXP_LOOT_被诅咒者|r
    .goto Tirisfal Glades,30.86,66.05
    .target Novice Elreth
    .xp <2,1
step << Mage
    #requires Percing
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .train 1459 >>训练 |T135932:0|t[奥术智慧]
    .target Isabella
step << Warlock
    #label Vendor
    .goto Tirisfal Glades,30.81,66.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉|r交谈
    .vendor >>出售垃圾
    .target Kayla Smithe
    .money >0.1
step << Warlock
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .train 348 >>训练 |T135817:0|t[献祭]
    .target Maximillion
step << !Warlock !Mage
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈
    .turnin 363 >>交任务: |cRXP_FRIENDLY_突然醒来|r
    .accept 364 >>接任务: |cRXP_LOOT_无脑的僵尸|r
    .target Shadow Priest Sarvis
step << !Warlock !Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 376 >>接任务: |cRXP_LOOT_被诅咒者|r
    .goto Tirisfal Glades,30.86,66.05
    .target Novice Elreth
    .xp <2,1
step << Warrior
    #completewith next
    #label Vendor
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基巴德|r交谈
    .vendor >>出售垃圾
    .target Archibald Kava
    .money >0.1
step << Warrior
    #label Training1
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .train 6673 >>训练 |T132333:0|t[战斗怒吼]
    .target Dannal Stern
step << Warlock
    #requires Piercing
    #loop
    .goto Tirisfal Glades,31.82,61.48,0
    .goto Tirisfal Glades,31.82,61.48,30,0
    .goto Tirisfal Glades,31.11,60.71,30,0
    .goto Tirisfal Glades,32.07,60.17,30,0
    .goto Tirisfal Glades,32.26,59.21,30,0
    .goto Tirisfal Glades,33.28,59.53,30,0
    .goto Tirisfal Glades,33.66,60.76,30,0
    .goto Tirisfal Glades,33.94,61.81,30,0
    .goto Tirisfal Glades,34.21,63.05,30,0
    .goto Tirisfal Glades,33.01,63.01,30,0
    >>击杀|r|cRXP_ENEMY_断骨骷髅|r. 从他们身上搜刮|r|cRXP_LOOT_断骨骷髅的颅骨|r
    .complete 1470,1 --Rattlecage Skull (3)
    .mob Rattlecage Skeleton
step << Warlock
    #completewith next
    +|cRXP_WARN_击杀|cRXP_ENEMY_无脑的僵尸|r和|cRXP_ENEMY_丑陋的僵尸|r. 击败它们并拾取战利品, 直到获得总价值25铜币的可出售物品(包括你的装备)|r
    .mob Mindless Zombie
    .mob Wretched Zombie
    .money >0.0025
step << Warlock
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132794:0|t[清凉的泉水]|r
	.collect 159,5,383,1 --Collect Refreshing Spring Water (5)
    .target Joshua Kien
    .isOnQuest 1470
step << Warlock
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.98,66.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_温雅|r交谈
    .turnin 1470 >>交任务: |cRXP_FRIENDLY_控制小鬼|r
    .target Venya Marthand
step << Warlock
    #completewith next
    .cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
step
    #label Zombies
    #requires Piercing << Warlock/Mage
    #loop
	.goto Tirisfal Glades,31.72,63.98,0
	.goto Tirisfal Glades,31.72,63.98,40,0
	.goto Tirisfal Glades,30.69,63.88,40,0
	.goto Tirisfal Glades,30.90,62.20,40,0
	.goto Tirisfal Glades,30.73,61.66,40,0
	.goto Tirisfal Glades,31.14,61.41,40,0
	.goto Tirisfal Glades,31.80,61.83,40,0
	.goto Tirisfal Glades,32.85,63.02,40,0
	.goto Tirisfal Glades,32.90,63.54,40,0
	.goto Tirisfal Glades,33.41,63.06,40,0
	.goto Tirisfal Glades,33.75,62.86,40,0
	.goto Tirisfal Glades,33.51,63.82,40,0
	.goto Tirisfal Glades,33.55,64.57,40,0
	.goto Tirisfal Glades,33.29,64.96,40,0
    >>击杀|cRXP_ENEMY_无脑的僵尸|r和|cRXP_ENEMY_丑陋的僵尸|r
    .complete 364,1 --Kill Mindless Zombie (x8)
    .mob +Mindless Zombie
    .complete 364,2 --Kill Wretched Zombie (x8)
    .mob +Wretched Zombie
step << Mage/Warlock/Priest
    #completewith Vendor2
    +|cRXP_WARN_击杀|cRXP_ENEMY_无脑的僵尸|r 和|cRXP_ENEMY_丑陋的僵尸|r . 搜刮它们, 直到你获得价值33铜币的可出售物品(包括你的装备)|r
    .mob Mindless Zombie
    .mob Wretched Zombie
    .money >0.0033
step << Mage/Warlock/Priest
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132794:0|t[清凉的泉水]|r
    .collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .vendor >>出售垃圾
    .target Joshua Kien
    .isOnQuest 364
    .money <0.0050
    .itemcount 159,<10
 step << Mage/Warlock/Priest
    #label Vendor2
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132794:0|t[清凉的泉水]|r
    .collect 159,5,383,1 --Collect Refreshing Spring Water (5)
    .vendor >>出售垃圾
    .target Joshua Kien
    .isOnQuest 364
    .money >0.0050
    .itemcount 159,<5
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sarvis|r和|cRXP_FRIENDLY_Elreth|r交谈 << !Warlock !Mage !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sarvis|r和|cRXP_FRIENDLY_Elreth|r和|cRXP_FRIENDLY_马克希米林|r交谈 << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨维斯|r和|cRXP_FRIENDLY_埃尔雷思|r和|cRXP_FRIENDLY_伊莎贝拉|r交谈 << Mage
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sarvis|r和|cRXP_FRIENDLY_Elreth|r和|cRXP_FRIENDLY_Duesten|r交谈 << Priest
    .turnin 364 >>交任务: |cRXP_FRIENDLY_无脑的僵尸|r
    .accept 3095 >>接任务: |cRXP_LOOT_简易卷轴|r << Warrior
    .accept 3096 >>接任务: |cRXP_LOOT_密文卷轴|r << Rogue
    .accept 3097 >>接任务: |cRXP_LOOT_神圣卷轴|r << Priest
    .accept 3098 >>接任务: |cRXP_LOOT_雕文卷轴|r << Mage
    .accept 3099 >>接任务: |cRXP_LOOT_被污染的卷轴|r << Warlock
    .accept 3901 >>接任务: |cRXP_LOOT_断骨骷髅|r
    .target +Shadow Priest Sarvis
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .accept 376 >>接任务: |cRXP_LOOT_被诅咒者|r
    .target +Novice Elreth
    .goto Tirisfal Glades,30.86,66.05
    .turnin 3099 >>交任务: |cRXP_FRIENDLY_被污染的卷轴|r << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .target +Maximillion << Warlock
    .turnin 3098 >>交任务: |cRXP_FRIENDLY_雕文卷轴|r << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .target +Isabella << Mage
    .turnin 3097 >>交任务: |cRXP_FRIENDLY_神圣卷轴|r << Priest
    .target +Dark Cleric Duesten << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
step << Mage/Warlock/Priest
    .goto Tirisfal Glades,32.23,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132794:0|t[清凉的泉水]|r
    .collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .target Joshua Kien
    .isOnQuest 364
step
    #loop
    .goto Tirisfal Glades,34.32,56.79,0
    .goto Tirisfal Glades,29.21,66.68,40,0
    .goto Tirisfal Glades,29.48,65.70,40,0
    .goto Tirisfal Glades,29.60,64.04,40,0
    .goto Tirisfal Glades,29.67,63.39,40,0
    .goto Tirisfal Glades,30.09,61.51,40,0
    .goto Tirisfal Glades,30.97,59.66,40,0
    .goto Tirisfal Glades,31.61,58.57,40,0
    .goto Tirisfal Glades,32.07,57.74,40,0
    .goto Tirisfal Glades,32.85,58.35,40,0
    .goto Tirisfal Glades,34.32,56.79,40,0
    >>击杀 |cRXP_ENEMY_食腐狼幼崽|r和 |cRXP_ENEMY_蓬毛食腐狼|r. 从它们身上搜刮 |cRXP_LOOT_食腐狼的爪子|r
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r 和|cRXP_ENEMY_癞皮夜行蝙蝠|r . 击败它们后拾取其|cRXP_LOOT_夜行蝙蝠翼|r
    >>|cRXP_WARN_如果可能的话, 尽量避开|cRXP_ENEMY_癞皮夜行蝙蝠|r, 因为它们比|cRXP_ENEMY_夜行蝙蝠|r更难击杀|r
    .complete 376,1 --Collect Scavenger Paw (x6)
    .mob +Young Scavenger
    .mob +Ragged Scavenger
    .complete 376,2 --Collect Duskbat Wing (x6)
    .mob +Duskbat
    .mob +Mangy Duskbat
step
    #loop
    .goto Tirisfal Glades,31.82,61.48,0
    .goto Tirisfal Glades,31.82,61.48,30,0
    .goto Tirisfal Glades,31.11,60.71,30,0
    .goto Tirisfal Glades,32.07,60.17,30,0
    .goto Tirisfal Glades,32.26,59.21,30,0
    .goto Tirisfal Glades,33.28,59.53,30,0
    .goto Tirisfal Glades,33.66,60.76,30,0
    .goto Tirisfal Glades,33.94,61.81,30,0
    .goto Tirisfal Glades,34.21,63.05,30,0
    .goto Tirisfal Glades,33.01,63.01,30,0
    >>击杀|cRXP_ENEMY_断骨骷髅|r
    .complete 3901,1 --Kill Rattlecage Skeleton (12)
    .mob Rattlecage Skeleton
step
    #som--xpgate
    #loop
    .goto Tirisfal Glades,31.82,61.48,30,0
    .goto Tirisfal Glades,31.11,60.71,30,0
    .goto Tirisfal Glades,32.07,60.17,30,0
    .goto Tirisfal Glades,32.26,59.21,30,0
    .goto Tirisfal Glades,33.28,59.53,30,0
    .goto Tirisfal Glades,33.66,60.76,30,0
    .goto Tirisfal Glades,33.94,61.81,30,0
    .goto Tirisfal Glades,34.21,63.05,30,0
    .goto Tirisfal Glades,33.01,63.01,30,0
    .xp 3+480 >>升级至480+/1400经验 << Warrior/Rogue
    .xp 3+560 >>升级至560/1400经验 << !Warrior !Rogue
    .mob Mindless Zombie
    .mob Wretched Zombie
step
    #era
    #loop
    .goto Tirisfal Glades,31.82,61.48,30,0
    .goto Tirisfal Glades,31.11,60.71,30,0
    .goto Tirisfal Glades,32.07,60.17,30,0
    .goto Tirisfal Glades,32.26,59.21,30,0
    .goto Tirisfal Glades,33.28,59.53,30,0
    .goto Tirisfal Glades,33.66,60.76,30,0
    .goto Tirisfal Glades,33.94,61.81,30,0
    .goto Tirisfal Glades,34.21,63.05,30,0
    .goto Tirisfal Glades,33.01,63.01,30,0
    .xp 3+940 >>升级至940/1400经验值 << Warrior/Rogue
    .xp 3+980 >>升级至980+/1400经验 << !Warrior !Rogue
    .mob Mindless Zombie
    .mob Wretched Zombie
step << Mage/Warlock/Priest
    .goto Tirisfal Glades,32.25,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132794:0|t[清凉的泉水]|r
    >>|cRXP_WARN_不要低于1银币|r << Mage/Warlock/Priest
    .collect 159,15,380,1 --Collect Refreshing Spring Water (10)
    .target Joshua Kien
    .money >0.0075
    .isOnQuest 3901
    .itemcount 159,<20
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sarvis|r和|cRXP_FRIENDLY_Elreth|r交谈
    .turnin 3901 >>交任务: |cRXP_FRIENDLY_断骨骷髅|r
    .target +Shadow Priest Sarvis
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .turnin 376 >>交任务: |cRXP_FRIENDLY_被诅咒者|r
    .accept 6395 >>接任务: |cRXP_LOOT_玛拉的遗愿|r
    .target +Novice Elreth
    .goto Tirisfal Glades,30.86,66.05
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duesten|r交谈
    .train 589 >>训练你的职业法术
    .target Dark Cleric Duesten
    .money <0.021
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duesten|r交谈
    .train 2052 >>训练 |T135929:0|t[治疗术 等级2]
    .train 589 >>训练 |T136207:0|t[暗言术:痛]
    .target Dark Cleric Duesten
    .money <0.02
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duesten|r交谈
    .train 1243 >>训练 |T135987:0|t[真言术:坚韧]
    .train 589 >>训练 |T136207:0|t[暗言术:痛]
    .target Dark Cleric Duesten
    .money <0.011
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duesten|r交谈
    .train 589 >>训练 |T136207:0|t[暗言术:痛]
    .target Dark Cleric Duesten
    .money <0.01
step << Warlock
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .train 172 >>训练 |T136118:0|t[腐蚀之触]
    .target Maximillion
step << Mage
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .train 116 >>训练 |T135846:0|t[冰箭]
    .target Isabella
step
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Saltain|r和|cRXP_FRIENDLY_Arren|r交谈
    .accept 3902 >>接任务: |cRXP_LOOT_捡破烂|r
    .target +Deathguard Saltain
    .goto Tirisfal Glades,31.61,65.62
    .accept 380 >>接任务: |cRXP_LOOT_夜行蜘蛛洞穴|r
    .target +Executor Arren
    .goto Tirisfal Glades,32.15,66.01
step << Rogue/Warrior
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基巴德|r交谈
    .vendor >>出售垃圾
    .target Archibald Kava
    .money >0.1
    .isOnQuest 3095 << Warrior
    .isOnQuest 3096 << Rogue
step << Warrior
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Dannal Stern
    .money <0.02
 step << Warrior
    #label Training2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Dannal Stern
    .money <0.01
step << Rogue
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 3096 >>交任务: |cRXP_FRIENDLY_密文卷轴|r
    .train 53 >>训练 |T132090:0|t[背刺]
    .money <0.04
    .target David Trias
step << Rogue
    #label Training2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 3096 >>交任务: |cRXP_FRIENDLY_密文卷轴|r
    .target David Trias
step
    #loop
	.goto Tirisfal Glades,32.37,64.37,0
	.goto Tirisfal Glades,32.37,64.37,12,0
	.goto Tirisfal Glades,32.81,64.39,12,0
	.goto Tirisfal Glades,32.89,64.60,12,0
	.goto Tirisfal Glades,33.01,65.38,12,0
	.goto Tirisfal Glades,33.79,64.57,12,0
	.goto Tirisfal Glades,33.13,63.08,12,0
	.goto Tirisfal Glades,32.79,63.11,12,0
	.goto Tirisfal Glades,31.86,61.49,12,0
	.goto Tirisfal Glades,31.75,61.96,12,0
	.goto Tirisfal Glades,31.70,62.53,12,0
	.goto Tirisfal Glades,31.34,62.44,12,0
    >>打开地面上的|cRXP_PICK_物资箱|r, 搜刮出其中的|cRXP_LOOT_破烂装备|r
    .complete 3902,1 --Collect Scavenged Goods (x6)
step
    #loop
	.goto Tirisfal Glades,29.94,57.33,0
	.goto Tirisfal Glades,29.94,57.33,40,0
	.goto Tirisfal Glades,29.82,56.03,40,0
	.goto Tirisfal Glades,29.25,55.77,40,0
	.goto Tirisfal Glades,28.40,56.51,40,0
	.goto Tirisfal Glades,27.68,57.10,40,0
	.goto Tirisfal Glades,28.29,58.31,40,0
	.goto Tirisfal Glades,28.25,59.41,40,0
	.goto Tirisfal Glades,28.80,59.53,40,0
	.goto Tirisfal Glades,29.29,59.40,40,0
	.goto Tirisfal Glades,29.67,58.53,40,0
    >>击杀|cRXP_ENEMY_小夜行蜘蛛|r
    .complete 380,1,6 --Kill Young Night Web Spider (10)
    .mob Young Night Web Spider
step
    #loop
	.goto Tirisfal Glades,28.25,58.27,0
	.goto Tirisfal Glades,28.25,58.27,25,0
	.goto Tirisfal Glades,28.42,59.07,25,0
	.goto Tirisfal Glades,27.86,60.57,25,0
	.goto Tirisfal Glades,27.17,59.18,25,0
	.goto Tirisfal Glades,27.30,57.97,25,0
	.goto Tirisfal Glades,26.94,56.42,25,0
	.goto Tirisfal Glades,27.51,56.00,25,0
    >>击杀靠近洞穴入口的小夜行蜘蛛
    .complete 380,1 --Kill Young Night Web Spider (10)
    .mob Young Night Web Spider
step
    #completewith next
    .goto Tirisfal Glades,26.80,59.40,15,0
    .goto Tirisfal Glades,26.31,59.60,30 >>进入洞穴内部
step
    #loop
    .goto Tirisfal Glades,24.68,59.54,0
    .goto Tirisfal Glades,26.31,59.60,30,0
    .goto Tirisfal Glades,25.61,59.55,20,0
    .goto Tirisfal Glades,25.11,60.33,20,0
    .goto Tirisfal Glades,24.18,60.77,20,0
    .goto Tirisfal Glades,23.23,59.91,20,0
    .goto Tirisfal Glades,23.89,58.36,20,0
    .goto Tirisfal Glades,24.68,59.54,20,0
    >>击杀洞穴内的|cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob Night Web Spider
step << Warlock
    #softcore
    #completewith ScarletC
    .cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
step << skip
    #hardcore
    #completewith next
    >>|cRXP_WARN_通过从洞穴中的某个物体上跳下, 然后按下你的营地宏来执行跳跃登出跳过|r
    .link https://www.youtube.com/watch?v=AOAlX9B5aO0 >>|cRXP_WARN_点击此处查看攻略|r
    .link /camp >>|cRXP_WARN_点击此处获取宏|r
    >>|cRXP_WARN_要创建宏, 请在游戏中输入 /macro. 点击“新建”, 为其命名, 然后将 "/camp" 复制粘贴到框中. 将新宏拖动到你的动作条上|r
    .goto Tirisfal Glades,31.08,64.88,30 >>返回丧钟镇
step
    #label Scavenging
    .goto Tirisfal Glades,31.61,65.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Saltain|r交谈
    .turnin 3902 >>交任务: |cRXP_FRIENDLY_捡破烂|r
    .target Deathguard Saltain
step
    #sticky
    #label NightWebH
    .goto Tirisfal Glades,32.15,66.01,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arren|r交谈
    .turnin 380 >>交任务: |cRXP_FRIENDLY_夜行蜘蛛洞穴|r
    .accept 381 >>接任务: |cRXP_LOOT_血色十字军|r
    .target Executor Arren
step << Rogue/Warrior
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基巴德|r交谈
    .vendor >>出售垃圾
    .target Archibald Kava
    .isOnQuest 6395
step << Warlock/Mage/Priest
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132794:0|t[清凉的泉水]|r
	.collect 159,15,383,1 << Warlock/Mage/Priest --Collect Refreshing Spring Water (15)
    .vendor >>出售垃圾
    .target Joshua Kien
    .isOnQuest 6395
    .itemcount 159,<15
step
    #requires NightWebH
    #loop
	.goto Tirisfal Glades,36.13,68.74,0
	.goto Tirisfal Glades,36.13,68.74,40,0
	.goto Tirisfal Glades,36.46,69.49,40,0
	.goto Tirisfal Glades,36.85,70.02,40,0
	.goto Tirisfal Glades,37.42,69.58,40,0
	.goto Tirisfal Glades,38.05,69.79,40,0
	.goto Tirisfal Glades,37.91,69.22,40,0
	.goto Tirisfal Glades,38.03,68.77,40,0
	.goto Tirisfal Glades,38.49,68.28,40,0
	.goto Tirisfal Glades,38.72,67.07,40,0
	.goto Tirisfal Glades,38.59,66.25,40,0
	.goto Tirisfal Glades,38.65,65.07,40,0
	.goto Tirisfal Glades,37.62,65.36,40,0
	.goto Tirisfal Glades,36.93,65.38,40,0
	.goto Tirisfal Glades,36.51,65.42,40,0
	.goto Tirisfal Glades,36.85,66.59,40,0
	.goto Tirisfal Glades,37.45,67.95,40,0
	.goto Tirisfal Glades,36.93,68.16,40,0
    >>击杀|cRXP_ENEMY_Scarlet 血色信徒|r和|cRXP_ENEMY_Scarlet 皈依者|r. 击败他们后可获得其|cRXP_LOOT_Scarlet 血色十字军臂章|r
    >>|cRXP_WARN_先别杀迈文·考加尔|r
    >>|cRXP_WARN_如果可能的话, 尽量避开|cRXP_ENEMY_血色新兵|r, 因为他们拥有|r |T135843:0|t[霜冻护甲]|cRXP_WARN_(会减缓你的攻击速度)|r << Warrior/Rogue
    .complete 381,1 --Collect Scarlet Armband (12)
    .mob Scarlet Initiate
    .mob Scarlet Convert
step
    .goto Tirisfal Glades,36.69,61.67
    >>击杀|cRXP_ENEMY_Samuel|r. 击杀后搜刮其|cRXP_LOOT_Samuel's Remains|r
    .collect 16333,1,6395,1 --Collect Samuel's Remains
    .mob Samuel Fipps
step
    .goto Tirisfal Glades,31.17,65.08
	>>点击地面上的|cRXP_PICK_玛拉的坟墓|r
    .complete 6395,1 --Collect Samuel's Remains Buried (1)
 step << Warlock
    #softcore
	#completewith ScarletC
	.cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈 << !Priest
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Elreth|r和|cRXP_FRIENDLY_Duesten|r交谈 << Priest
    .turnin 6395 >>交任务: |cRXP_FRIENDLY_玛拉的遗愿|r
    .target +Novice Elreth
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.86,66.05
    .accept 5651 >>接任务: |cRXP_LOOT_黑暗的恩赐|r << Priest
    .target +Dark Cleric Duesten << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
step
    #sticky
    #label ScarletC
    .goto Tirisfal Glades,32.15,66.01,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arren|r交谈
    .turnin 381 >>交任务: |cRXP_FRIENDLY_血色十字军|r
    .accept 382 >>接任务: |cRXP_LOOT_十字军信使|r
    .target Executor Arren
step
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基巴德|r交谈
    .vendor >>出售垃圾
    .target Archibald Kava
step
    #requires ScarletC
    .goto Tirisfal Glades,36.50,68.82
    >>击杀|cRXP_ENEMY_Meven|r. 搜刮其身上的|cRXP_LOOT_血色十字军文件|r
    .complete 382,1 --Collect Scarlet Crusade Documents (1)
    .mob Meven Korgal
step
    .goto Tirisfal Glades,32.15,66.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arren|r交谈
    .turnin 382 >>交任务: |cRXP_FRIENDLY_十字军信使|r
    .accept 383 >>接任务: |cRXP_LOOT_重要情报|r
    .target Executor Arren
step
    #loop
    .goto Tirisfal Glades,34.08,59.51,50,0
    .goto Tirisfal Glades,35.34,56.55,50,0
    .goto Tirisfal Glades,36.83,56.85,50,0
    .goto Tirisfal Glades,37.76,59.38,50,0
    .goto Tirisfal Glades,37.51,62.99,50,0
	.goto Tirisfal Glades,36.13,68.74,50,0
	.goto Tirisfal Glades,36.46,69.49,50,0
	.goto Tirisfal Glades,36.85,70.02,50,0
	.goto Tirisfal Glades,37.42,69.58,50,0
	.goto Tirisfal Glades,38.05,69.79,50,0
	.goto Tirisfal Glades,37.91,69.22,50,0
	.goto Tirisfal Glades,38.03,68.77,50,0
	.goto Tirisfal Glades,38.49,68.28,50,0
	.goto Tirisfal Glades,38.72,67.07,50,0
	.goto Tirisfal Glades,38.59,66.25,50,0
	.goto Tirisfal Glades,38.65,65.07,50,0
	.goto Tirisfal Glades,37.62,65.36,50,0
	.goto Tirisfal Glades,36.93,65.38,50,0
	.goto Tirisfal Glades,36.51,65.42,50,0
	.goto Tirisfal Glades,36.85,66.59,50,0
	.goto Tirisfal Glades,37.45,67.95,50,0
	.goto Tirisfal Glades,36.93,68.16,50,0
	.goto Tirisfal Glades,36.13,68.74,50,0
    .xp 5+2350 >>升级至2350+/2800经验值
step
    .goto Tirisfal Glades,38.24,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔文|r交谈
    .accept 8 >>接任务: |cRXP_LOOT_潜行者的交易|r
    .target Calvin Montague

]])

RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 6-13 亡灵族
#displayname 6-13 亡灵族 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 1-20
#defaultfor Undead
#next 13-15 银松森林

step
    .goto Tirisfal Glades,40.91,54.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_西米尔|r交谈
    .accept 365 >>接任务: |cRXP_LOOT_悲伤之地|r
    .target Deathguard Simmer
step
    #loop
    .goto Tirisfal Glades,56.13,52.48,0
    .goto Tirisfal Glades,40.77,54.42,0
    .goto Tirisfal Glades,40.77,54.42,40,0
    .goto Tirisfal Glades,42.04,55.11,40,0
    .goto Tirisfal Glades,43.59,54.30,40,0
    .goto Tirisfal Glades,46.21,56.78,40,0
    .goto Tirisfal Glades,48.88,57.93,40,0
    .goto Tirisfal Glades,50.73,57.27,40,0
    .goto Tirisfal Glades,52.52,54.48,40,0
    .goto Tirisfal Glades,54.49,52.65,40,0
    .goto Tirisfal Glades,56.13,52.48,40,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_葛尔多|r. 他是个亡灵怪物, 常在通往布瑞尔的路上巡逻
    .accept 5481 >>接任务: |cRXP_LOOT_葛尔多的任务|r
    .target Gordo
    .unitscan Gordo
step << Priest/Warlock
    .goto Tirisfal Glades,52.59,55.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博文·布里斯博埃斯|r交谈
    .train 3908 >>学习 |T136249:0|t[裁缝]. 收集你的 |T132889:0|t[亚麻布], 这样你以后就能制作法杖了
    .target Bowen Brisboise
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r和|cRXP_FRIENDLY_Zygand|r交谈
    .accept 404 >>接任务: |cRXP_LOOT_腐烂的爪子|r
    .target +Deathguard Dillinger
    .goto Tirisfal Glades,58.20,51.45
    .turnin 383 >>交任务: |cRXP_FRIENDLY_重要情报|r
    .accept 427 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.59,51.77
step << Rogue
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人|r|cRXP_BUY_交谈, 从她那里购买|r|T135421:0|t[破损的增重飞斧]|r
    .collect 3131,200,786,1 --Weighted Throwing Axe (200)
    .target Mrs. Winters
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T135641:0|t[卷刃的剑] (4s 01c) 的钱. 如果不够, 稍后再回来处理
    .target Oliver Dwor
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Oliver|r|cRXP_BUY_交谈. 从他那里购买|r |T135641:0|t[卷刃的剑] |r
    .collect 2494,1,404,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith Claws
    +装备 |T135421:0|t[破损的增重飞斧]
    .use 3131
    .itemcount 3131,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Rogue
    #completewith Claws
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >>出售垃圾, 如果钱够买一把 |T135321:0|t[步兵剑](5银36铜), 就直接购买. 如果钱不够, 稍后再来
    .target Oliver Dwor
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈. 从他那里购买|r|T135321:0|t[步兵剑]|r
    .collect 2488,1,404,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #completewith Claws
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    .turnin 8 >>交任务: |cRXP_FRIENDLY_潜行者的交易|r
    .home >>将你的[炉石]设置为布瑞尔
    .target Innkeeper Renee
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
    .turnin 5651 >>交任务: |cRXP_FRIENDLY_黑暗的恩赐|r
    .accept 5650 >>接任务: |cRXP_LOOT_黑暗之衣|r
	.train 591 >>训练 |T135924:0|t[惩戒]
    .train 17 >>训练 |T135940:0|t[真言术:盾]
    .train 2052 >>训练 |T135929:0|t[治疗术 等级2]
    .target Dark Cleric Beryl
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 143 >>训练 |T135812:0|t[火球]
    .train 2136 >>训练 |T135807:0|t[火焰冲击]
    .target Cain Firesong
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 3127 >>训练 |T132269:0|t[招架]
    .target Austil de Mon
    .money <0.01
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 1757 >>训练 |T136189:0|t[邪恶打击]
    .target Marion Call
    .money <0.01
step << Warlock
    .goto Tirisfal Glades,61.56,52.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的 |cRXP_FRIENDLY_吉娜·朗恩|r 交谈
    >>|cRXP_BUY_从她那里购买|r|T133738:0|t[血契法典]|r
    .collect 16321,1,404,1 --Grimoire of Blood Pact
    .vendor >>出售垃圾
    .target Gina Lang
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 695 >>训练 |T136197:0|t[暗影箭]
    .train 1454 >>训练 |T136126:0|t[生命偷取]
    .target Rupert Boch
    .money <0.02
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 695 >>训练 |T136197:0|t[暗影箭]
    .target Rupert Boch
step << Warlock
    #completewith Claws
    .train 20397 >>使用 |T133738:0|t[血契法典]
    .itemcount 16321,1
    .use 16321
step << Priest/Warlock
    .goto Tirisfal Glades,61.76,51.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_范斯|r交谈
    .train 7411 >>学习 |T136244:0|t[附魔]. 这与 |T136249:0|t[裁缝] 一起, 将让你 later 制作法杖
    .target Vance Undergloom
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Priest
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r << Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_从她那里|r << Warlock
    .vendor >>出售垃圾
    .collect 1179,15,367,1 << Mage/Priest --Ice Cold Milk (15)
    .collect 4605,10,367,1 << Rogue/Warrior --Red-speckled Mushroom (10)
    .collect 1179,10,367,1 << Warlock --Ice Cold Milk (10)
    .collect 4605,5,367,1 << Warlock --Red-speckled Mushroom (5)
    .money <0.025 << Warrior/Rogue
    .money <0.0375 << Mage/Priest/Warlock
    .target Innkeeper Renee
 step
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Johaan|r交谈
    .accept 367 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target Apothecary Johaan
step << Priest
    .goto Tirisfal Glades,59.18,46.49
    >>对|cRXP_FRIENDLY_亡灵卫兵科尔|r施放 |T135929:0|t[治疗术] 和 |T135987:0|t[真言术:坚韧]
    >>|cRXP_WARN_你需要|r|T135929:0|t[治疗术(小)等级2]|cRXP_WARN_完成此任务|r
    .complete 5650,1 --Heal and fortify Deathguard Kel (1)
    .target Deathguard Kel
step
    #completewith Claws
    >>拾取地面上的|cRXP_PICK_阴暗草|r
    .complete 5481,1 --Gloom Weed (3)
step
    #completewith next
    >>击杀你见到的任何 |cRXP_ENEMY_衰老的黑暗犬|r. 从它们身上搜刮出 |cRXP_LOOT_血液|r
    .complete 367,1 --Darkhound Blood (5)
    .mob Decrepit Darkhound
step
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
    >>击杀|cRXP_ENEMY_腐烂的死者|r和|cRXP_ENEMY_破碎的尸体|r. 击败它们后搜刮出|cRXP_LOOT_利爪|r
    .complete 404,1 --Putrid Claw (7)
    .mob Rotting Dead
    .mob Ravaged Corpse
step
    #completewith next
    >>拾取地面上的|cRXP_PICK_阴暗草|r
    .complete 5481,1 --Gloom Weed (3)
step
    #loop
    .goto Tirisfal Glades,41.70,44.01,0
    .goto Tirisfal Glades,44.41,56.83,100,0
    .goto Tirisfal Glades,42.64,53.40,100,0
    .goto Tirisfal Glades,40.84,46.59,100,0
    .goto Tirisfal Glades,38.69,44.10,100,0
    .goto Tirisfal Glades,38.63,39.44,100,0
    .goto Tirisfal Glades,41.70,44.01,100,0
    >>击杀你见到的任何 |cRXP_ENEMY_衰老的黑暗犬|r. 从它们身上搜刮出 |cRXP_LOOT_血液|r
    >>|cRXP_WARN_避开|r|cRXP_ENEMY_被诅咒的黑暗犬|r|cRXP_WARN_. 它们等级较高|r
    .complete 367,1 --Darkhound Blood (5)
    .mob Decrepit Darkhound
step
    #loop
    .goto Tirisfal Glades,39.55,50.64,0
    .goto Tirisfal Glades,44.43,57.33,0
    .goto Tirisfal Glades,39.55,50.64,50,0
    .goto Tirisfal Glades,44.43,57.33,50,0
    >>完成拾取地面上的|cRXP_PICK_阴暗草|r
    .complete 5481,1 --Gloom Weed (3)
step << Priest/Warlock
    #sticky
    #label Linen
    #completewith HorrorsandSpirits
    >>|cRXP_WARN_开始收集 3 堆|r|T132889:0|t[亚麻布]|cRXP_WARN_. 稍后将用于制作你的法杖|r
    .collect 2589,60 --Linen Cloth (60)
step
    #loop
    .goto Tirisfal Glades,36.63,50.09,0
    .goto Tirisfal Glades,37.20,52.17,50,0
    .goto Tirisfal Glades,36.64,50.09,50,0
    .goto Tirisfal Glades,36.10,49.07,50,0
    .goto Tirisfal Glades,35.08,49.82,50,0
    .goto Tirisfal Glades,35.30,50.91,50,0
    .goto Tirisfal Glades,34.57,51.58,50,0
    .goto Tirisfal Glades,36.63,50.09,50,0
    >>在田野中找到的南瓜予以掠夺
    .complete 365,1 --Tirisfal Pumpkin (10)
step
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
    >>|cRXP_WARN_请注意, 它们在完成防御姿态动画后的8秒内, 格挡几率会提升50%|r << Rogue/Warrior
    .complete 427,1 --Scarlet Warrior (10)
    .mob Scarlet Warrior
step
    #completewith BrillTurnin1
    .hs >>传送回布瑞尔
    .use 6948
    .subzoneskip 159
    .cooldown item,6948,>0
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
    .turnin 5650 >>交任务: |cRXP_FRIENDLY_黑暗之衣|r
    .train 591 >>训练 |T135924:0|t[惩戒]
    .train 17 >>训练 |T135940:0|t[真言术:盾]
    .target Dark Cleric Beryl
step
    #label BrillTurnin1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zygand|r和|cRXP_FRIENDLY_Johaan|r和|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 427 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 370 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .turnin 367 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .turnin 365 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .accept 368 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .accept 407 >>接任务: |cRXP_LOOT_悲伤之地|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 404 >>交任务: |cRXP_FRIENDLY_腐烂的爪子|r
    .accept 426 >>接任务: |cRXP_LOOT_磨坊告急|r
    .target +Deathguard Dillinger
    .goto Tirisfal Glades,58.20,51.43
step
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Holland|r交谈, 他在墓地附近巡逻
    .turnin 5481 >>交任务: |cRXP_FRIENDLY_葛尔多的任务|r
    .accept 5482 >>接任务: |cRXP_LOOT_末日草|r
    .target Junior Apothecary Holland
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T135641:0|t[卷刃的剑] (4s 01c) 的钱. 如果不够, 稍后再回来处理
    .target Oliver Dwor
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Oliver|r|cRXP_BUY_交谈. 从他那里购买|r |T135641:0|t[卷刃的剑] |r
    .collect 2494,1,404,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith ZeptoDurotar
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >>出售垃圾, 如果钱够买一把 |T135321:0|t[步兵剑](5银36铜), 就直接购买. 如果钱不够, 稍后再来
    .target Oliver Dwor
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈. 从他那里购买|r|T135321:0|t[步兵剑]|r
    .collect 2488,1,404,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #completewith ZeptoDurotar
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Priest
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r << Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_从她那里|r << Warlock
    .vendor >>出售垃圾
    .collect 1179,20,818,1 << Mage/Priest --Ice Cold Milk (20)
    .collect 4605,10,818,1 << Rogue/Warrior/Warlock --Red-speckled Mushroom (10)
    .collect 1179,10,818,1 << Warlock --Ice Cold Milk (10)
    .money <0.025 << Rogue/Warrior
    .money <0.050 << Warlock/Mage/Priest
    .target Innkeeper Renee
step
    #label ZeptoDurotar
    .goto Tirisfal Glades,60.96,58.63,12,0
    .goto Tirisfal Glades,61.51,59.01,10,0
    .goto Tirisfal Glades,61.27,59.22,8,0
    .goto Tirisfal Glades,61.13,58.84,8,0
    .goto Tirisfal Glades,61.38,58.71,8,0
    .goto Tirisfal Glades,61.34,59.17,8,0
    .goto Tirisfal Glades,60.51,58.69,-1
    .goto Tirisfal Glades,60.94,46.35,-1
    >>登上齐柏林飞艇塔
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r , 乘坐飞艇前往。稍后你将回到提瑞斯法
    .zoneskip Durotar
step
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .accept 834 >>接任务: |cRXP_LOOT_沙漠之风|r
    .target Rezlak
step
    #completewith next
    .goto Durotar,47.40,22.57,60,0
    .goto Durotar,49.08,28.48,60,0
    .goto Durotar,52.19,33.49,120,0
    .goto Durotar,52.25,40.17,60 >>前往剃刀岭
step << Warrior/Rogue
    .goto Durotar,52.05,40.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜克|r交谈
    .train 2018 >>训练 |T136241:0|t[锻造]
    .target Dwukk
    .skill blacksmithing,1,1
step << Warrior/Rogue
    .goto Durotar,51.81,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁恩|r交谈
    .train 2575 >>训练 |T136248:0|t[采矿]
    >>|cRXP_WARN_这将使您能够找到|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_从矿点获取, 用于制作|r|T135248:0|t[磨砺石] |cRXP_WARN_(持续30分钟, 增加武器伤害+2)|r
    .target Krunn
step << Warrior/Rogue
    .goto Durotar,51.90,41.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃克|r交谈
    >>|cRXP_BUY_购买一个|r|T134708:0|t[矿工锄]|cRXP_BUY_从|r|cRXP_FRIENDLY_沃克|r
    .collect 2901,1,784,1 --Mining Pick (1)
    .target Wuark
step
    .goto Durotar,51.51,41.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    .home >>将你的炉石设置为剃刀岭
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Warlock/Priest/Shaman
    >>|cRXP_BUY_从他那里购买|r|T133974:0|t[肉排]|r << Rogue/Warrior
    .vendor >>出售垃圾
    .target Innkeeper Grosk
step
    >>|cRXP_WARN_你可以在掩体外部或顶部与|r|cRXP_FRIENDLY_Gar'thok|r|cRXP_WARN_交谈|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gar'thok|r和|cRXP_FRIENDLY_Torka|r交谈
    .accept 784 >>接任务: |cRXP_LOOT_背信弃义的人类|r
    .accept 837 >>接任务: |cRXP_LOOT_野猪人的进犯|r
    .target +Gar'thok
    .goto Durotar,51.95,43.50
    .accept 815 >>接任务: |cRXP_LOOT_恐龙蛋大餐|r
    .target +Cook Torka
    .goto Durotar,51.09,42.49
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
    #completewith TravelToTiragarde
    +|cRXP_WARN_采集|r|T136025:0|t[寻找矿物] |cRXP_WARN_并挖掘你发现的任何铜矿脉以获取|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_. 用它们制作|r|T135248:0|t[打磨石] |r
    .collect 2862,1,786,1
    .skill blacksmithing,<1,1
    .train 2575,3 --Mining Trained
step
    #completewith next
    .goto Durotar,52.06,68.30,50 >>前往森金村
step
    .goto Durotar,52.06,68.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌克尔|r交谈
    .accept 2161 >>接任务: |cRXP_LOOT_苦工的重担|r
    .target Ukor
step
    #loop
    .goto Durotar,54.20,73.36,0
    .goto Durotar,54.09,76.31,25,0
    .goto Durotar,54.52,74.83,25,0
    .goto Durotar,54.20,73.36,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lar|r谈话. 他正在附近巡逻
    .accept 786 >>接任务: |cRXP_LOOT_科卡尔半人马的进攻|r
    .target Lar Prowltusk
step
    #label SenjinPickups
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vel'rin|r和|rVornal|r和|rGadrin|r交谈
    .accept 817 >>接任务: |cRXP_LOOT_生活所需的虎皮|r
    .target +Vel'rin Fang
    .goto Durotar,55.95,73.93
    .accept 818 >>接任务: |cRXP_LOOT_沃纳尔大师|r
    .target +Master Vornal
    .goto Durotar,55.94,74.40
    .accept 808 >>接任务: |cRXP_LOOT_明希纳的颅骨|r
    .accept 826 >>接任务: |cRXP_LOOT_扎拉赞恩|r
    .accept 823 >>接任务: |cRXP_LOOT_向奥戈尼尔报告|r
    .target +Master Gadrin
    .goto Durotar,55.94,74.72
step << Rogue
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_K'waii|r|cRXP_BUY_交谈. 从她那里购买|r|T135421:0|t[破损的增重飞斧]|r
    .collect 3131,200,786,1 --Weighted Throwing Axe (200)
    .target K'waii
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Rogue
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T135641:0|t[卷刃的剑] (4s 01c) 的钱. 如果不够, 稍后再回来处理
    .target Trayexir
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈. 从他那里购买|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1,786,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T132401:0|t[双刃战斧] (4银84铜) 的钱. 如果暂时不够, 稍后再回来处理
    .target Trayexir
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈. 从他那里购买一把|r|T132401:0|t[大斧]|r
    .collect 2491,1,786,1 --Collect Large Axe (1)
    .money <0.0484
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T135421:0|t[小手斧](5银40铜)的钱. 如果暂时不够, 稍后再回来处理
    .target Trayexir
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈. 从他那里购买|r|T135421:0|t[小手斧]|r
    .collect 2490,1,786,1 --Collect Tomahawk (1)
    .money <0.0540
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    #completewith Bonfire
    +装备 |T135421:0|t[破损的增重飞斧]
    .use 3131
    .itemcount 3131,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Rogue
    #completewith Bonfire
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #completewith Bonfire
    +装备 |T132401:0|t[巨斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #completewith Bonfire
    +装备 |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Mage
    .goto Durotar,56.30,75.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Un'Thuwa|r交谈
    .train 143 >>训练 |T135812:0|t[火球]
    .train 2136 >>训练 |T135807:0|t[火焰冲击]
    .target Un'Thuwa
step
    #completewith next
    .goto Durotar,58.54,75.89,40,0
    .goto Durotar,57.73,77.91,40,0
    .goto Durotar,55.72,79.62,40,0
    .goto Durotar,54.23,82.26,40,0
    .goto Durotar,52.20,83.00,40,0 >>跑到海滩上, 击杀|r海蟹|r和|r马克拉拉斯|r. 从它们身上获取|r黏液|r和|r眼睛|r. 此步骤无需在此完成
    .complete 818,2,4 --Crawler Mucus (8)
    .mob +Pygmy Surf Crawler
    .mob +Surf Crawler
    .complete 818,1,2 --Intact Makrura Eye (4)
    .mob +Makrura Shellhide
    .mob +Makrura Clacker
step
    .goto Durotar,52.20,83.00,75 >>抵达海滩尽头
    .isOnQuest 818
step
    .goto Durotar,50.9,79.2,40 >>进入科卡尔营地
    .isOnQuest 786
step
    #sticky
    #completewith Bonfire
    +|cRXP_WARN_请注意, 如果|r|cRXP_ENEMY_Kolkanis|r|cRXP_WARN_出现, 他是一名9级稀有怪物. 如果你有|r|T134829:0|t[初级治疗药水]|cRXP_WARN_, 可能需要使用它|r
    .unitscan Warlord Kolkanis
step
    >>在帐篷内的地面上烧毁|cRXP_PICK_Attack Plan|r
    .goto Durotar,49.8,81.2
    .complete 786,1 --Attack Plan: Valley of Trials destroyed (1)
step
    >>在地上烧毁“作战计划”
    .goto Durotar,47.7,77.4
    .complete 786,2 --Attack Plan: Sen'jin Village destroyed (1)
step
    #label Bonfire
    >>在地上烧毁“作战计划”
    .goto Durotar,46.3,79.0
    .complete 786,3 --Attack Plan: Orgrimmar destroyed (1)
step
    #completewith next
    .goto Durotar,50.95,79.14,30 >>离开科卡尔营地
    .isQuestComplete 786
step
    #loop
    .goto Durotar,54.20,73.36,0
    .goto Durotar,54.09,76.31,25,0
    .goto Durotar,54.52,74.83,25,0
    .goto Durotar,54.20,73.36,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lar|r谈话. 他正在附近巡逻
    .turnin 786 >>交任务: |cRXP_FRIENDLY_科卡尔半人马的进攻|r
    .target Lar Prowltusk
step
    #optional
    .goto Durotar,55.95,74.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃纳尔|r 交谈
    .turnin 818 >>交任务: |cRXP_FRIENDLY_沃纳尔大师|r
    .target Master Vornal
    .isQuestComplete 818
step
    .goto Durotar,55.62,73.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海赞|r交谈
    .vendor 3933 >>出售你的垃圾物品
    .target Hai'zan
    .money >0.025 << Warrior/Rogue/Shaman
step << Warrior/Rogue/Shaman
    .goto Durotar,55.62,73.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海赞|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133974:0|t[肉排]|r
    .vendor >>出售垃圾
    .collect 2287,10,823,1 --Haunch of Meat (10)
    .money <0.025
    .target Hai'zan
step << skip --Warlock/Mage/Priest
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_K'waii交谈|r
    >>|cRXP_BUY_购买|r|T132794:0|t[清凉的泉水] |cRXP_BUY_从她那里|r -- 清凉的泉水 (20)
    .collect 159,20,784,1
    .target K'waii
    .money <0.010
step << skip --Warlock/Mage/Priest
    .goto Durotar,56.29,73.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_K'waii交谈|r
    >>|cRXP_BUY_购买|r|T132794:0|t[清凉的泉水] |cRXP_BUY_从她那里|r -- 清凉的泉水 (10)
    .collect 159,10,784,1
    .target K'waii
    .money <0.0050
step << Rogue
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T135641:0|t[卷刃的剑] (4s 01c) 的钱. 如果不够, 稍后再回来处理
    .target Trayexir
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈. 从他那里购买|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1,823,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T132401:0|t[双刃战斧] (4银84铜) 的钱. 如果暂时不够, 稍后再回来处理
    .target Trayexir
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈. 从他那里购买一把|r|T132401:0|t[大斧]|r
    .collect 2491,1,823,1 --Collect Large Axe (1)
    .money <0.0484
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T135421:0|t[小手斧](5银40铜)的钱. 如果暂时不够, 稍后再回来处理
    .target Trayexir
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    .goto Durotar,56.47,73.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_特莱耶克|r|cRXP_BUY_交谈. 从他那里购买|r|T135421:0|t[小手斧]|r
    .collect 2490,1,823,1 --Collect Tomahawk (1)
    .money <0.0540
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    #completewith TravelToTiragarde
    +装备 |T135421:0|t[破损的增重飞斧]
    .use 3131
    .itemcount 3131,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Rogue
    #completewith TravelToTiragarde
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #completewith TravelToTiragarde
    +装备 |T132401:0|t[巨斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #completewith TravelToTiragarde
    +装备 |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step
    #label TravelToTiragarde
    .goto Durotar,57.26,54.69,60,0
    .subzone 372 >>前往提拉加德堡垒
    .isOnQuest 784
step
    #sticky
    #completewith AgedEnvelope
    +|cRXP_WARN_请注意, 如果|r|cRXP_ENEMY_指挥官萨拉菲尔|r|cRXP_WARN_出现, 因为他是9级稀有敌人. 如果你有|r|T134829:0|t[初级治疗药水]|cRXP_WARN_, 可能需要使用它|r
    .unitscan Watch Commander Zalaphil
step
    #completewith Benedict
    #requires TravelToTiragarde
    .goto Durotar,59.81,58.22,8,0
    .goto Durotar,59.64,58.44,8,0
    .goto Durotar,59.55,57.89,8,0
    .goto Durotar,59.29,57.89,8 >>前往要塞二楼
step
    #completewith AgedEnvelope
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r和 |cRXP_ENEMY_库尔提拉斯水兵|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +Kul Tiras Sailor
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +Kul Tiras Marine
    .complete 791,1 --Canvas Scraps (8)
step
    #label Benedict
    .goto Durotar,59.75,58.27
    >>击杀|cRXP_ENEMY_本尼迪克上尉|r. 击败他后可获得他的|cRXP_LOOT_钥匙|r
    .complete 784,3 --Lieutenant Benedict (1)
    .collect 4882,1 --Collect Benedict's Key (1)
    .mob Lieutenant Benedict
step
    #label AgedEnvelope
    .goto Durotar,59.87,57.87,5,0
    .goto Durotar,59.83,57.58,5,0
    .goto Durotar,59.80,57.82,5,0
    .goto Durotar,59.94,57.82,5,0
    .goto Durotar,59.94,57.61,5,0
    .goto Durotar,59.27,57.65
    >>上楼并拾取|cRXP_PICK_本尼迪克的箱子|r, 获得一个 |T133471:0|t[|cRXP_LOOT_旧信封|r], 然后从该物品接受任务
    .collect 4881,1,830 --Collect Aged Envelope (1)
    .accept 830 >>接任务: |cRXP_LOOT_将军的命令|r
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
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r和 |cRXP_ENEMY_库尔提拉斯水兵|r. 击杀后搜刮他们的 |cRXP_LOOT_帆布脚料|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .complete 784,2 --Kul Tiras Marine (8)
    .complete 791,1 --Canvas Scraps (8)
    .mob Kul Tiras Sailor
    .mob Kul Tiras Marine
    .itemcount 4870,<8 --Canvas Scraps (<8)
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
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r和 |cRXP_ENEMY_库尔提拉斯水兵|r
    .complete 784,1 --Kul Tiras Sailor (10)
    .mob +Kul Tiras Sailor
    .complete 784,2 --Kul Tiras Marine (8)
    .mob +Kul Tiras Marine
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
    >>击杀 |cRXP_ENEMY_库尔提拉斯水手|r和 |cRXP_ENEMY_库尔提拉斯水兵|r. 击杀后搜刮他们的 |cRXP_LOOT_帆布脚料|r
    .complete 791,1 --Canvas Scraps (8)
    .mob Kul Tiras Sailor
    .mob Kul Tiras Marine
step << !Priest !Mage
    #loop
    .goto Durotar,59.02,50.24,50,0
    .goto Durotar,57.93,47.71,50,0
    .goto Durotar,59.20,44.30,50,0
    .goto Durotar,57.96,42.46,50,0
    .goto Durotar,56.47,43.45,50,0
    .goto Durotar,55.50,48.97,50,0
    .xp 7+2180 >>升级至2200+/4500经验值
step << Priest
    #loop
    .goto Durotar,59.02,50.24,50,0
    .goto Durotar,57.93,47.71,50,0
    .goto Durotar,59.20,44.30,50,0
    .goto Durotar,57.96,42.46,50,0
    .goto Durotar,56.47,43.45,50,0
    .goto Durotar,55.50,48.97,50,0
    .xp 7+1730 >>升级至1750/4500经验值
step
    #completewith next
    .goto Durotar,52.38,43.77,120 >>前往剃刀岭
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_奥尔尼尔|r和|cRXP_FRIENDLY_加尔托克|r和|cRXP_FRIENDLY_托卡|r交谈
    .turnin 823 >>交任务: |cRXP_FRIENDLY_向奥戈尼尔报告|r
    .accept 806 >>接任务: |cRXP_LOOT_黑暗风暴|r
    .target +Orgnil Soulscar
    .goto Durotar,52.24,43.15
    .turnin 784 >>交任务: |cRXP_FRIENDLY_背信弃义的人类|r
    .turnin 830 >>交任务: |cRXP_FRIENDLY_将军的命令|r
    .accept 825 >>接任务: |cRXP_LOOT_海底沉船|r
    .accept 831 >>接任务: |cRXP_LOOT_将军的命令|r
    .accept 837 >>接任务: |cRXP_LOOT_野猪人的进犯|r
    .target +Gar'Thok
    .goto Durotar,51.95,43.50
    .accept 815 >>接任务: |cRXP_LOOT_恐龙蛋大餐|r
    .target +Cook Torka
    .goto Durotar,51.09,42.49
    .group
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Orgnil|r和|cRXP_FRIENDLY_Gar'Thok|r和|cRXP_FRIENDLY_Torka|r交谈
    .turnin 823 >>交任务: |cRXP_FRIENDLY_向奥戈尼尔报告|r
    .target +Orgnil Soulscar
    .goto Durotar,52.24,43.15
    .turnin 784 >>交任务: |cRXP_FRIENDLY_背信弃义的人类|r
    .turnin 830 >>交任务: |cRXP_FRIENDLY_将军的命令|r
    .accept 825 >>接任务: |cRXP_LOOT_海底沉船|r
    .accept 831 >>接任务: |cRXP_LOOT_将军的命令|r
    .accept 837 >>接任务: |cRXP_LOOT_野猪人的进犯|r
    .target +Gar'Thok
    .goto Durotar,51.95,43.50
    .accept 815 >>接任务: |cRXP_LOOT_恐龙蛋大餐|r
    .target +Cook Torka
    .goto Durotar,51.09,42.49
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
    .turnin 791 >>交任务: |cRXP_FRIENDLY_新的背包|r
    .target Furl Scornbrow
step << Warrior/Rogue
    .goto Durotar,51.81,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克鲁恩|r交谈
    .train 2575 >>训练 |T136248:0|t[采矿]
    >>|cRXP_WARN_这将使您能够找到|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_从矿点获取, 用于制作|r|T135248:0|t[磨砺石] |cRXP_WARN_(持续30分钟, 增加武器伤害+2)|r
    .target Krunn
step << Warrior/Rogue
    .goto Durotar,51.90,41.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃克|r交谈
    >>|cRXP_BUY_购买一个|r|T134708:0|t[矿工锄]|cRXP_BUY_从|r|cRXP_FRIENDLY_沃克|r
    .collect 2901,1,818,1 --Mining Pick (1)
    .target Wuark
step << Warrior/Rogue
    .goto Durotar,52.05,40.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜克|r交谈
    .train 2018 >>训练 |T136241:0|t[锻造]
    .target Dwukk
    .skill blacksmithing,1,1
step << Rogue
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T135641:0|t[卷刃的剑] (4s 01c) 的钱. 如果不够, 稍后再回来处理
    .target Uhgar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈. 从他那里购买|r|T135641:0|t[卷刃的剑]|r
    .collect 2494,1,818,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T132401:0|t[双刃战斧] (4银84铜) 的钱. 如果暂时不够, 稍后再回来处理
    .target Uhgar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Orc Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈, 从他那里购买一把|r |T132401:0|t[大斧] |r
    .collect 2491,1,818,1 --Collect Large Axe (1)
    .money <0.0484
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤加尔|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T135421:0|t[小手斧](5银40铜)的钱. 如果暂时不够, 稍后再回来处理
    .target Uhgar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Troll Warrior
    .goto Durotar,52.02,40.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_尤加尔|r|cRXP_BUY_交谈. 从他那里购买|r|T135421:0|t[小手斧]|r
    .collect 2490,1,818,1 --Collect Tomahawk (1)
    .money <0.0540
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step << Rogue
    #completewith Toolboxes
    +装备 |T135421:0|t[破损的增重飞斧]
    .use 3131
    .itemcount 3131,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.9
step << Rogue
    #completewith Toolboxes
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Orc Warrior
    #completewith Toolboxes
    +装备 |T132401:0|t[巨斧]
    .use 2491
    .itemcount 2491,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.2
step << Troll Warrior
    #completewith Toolboxes
    +装备 |T135421:0|t[小手斧]
    .use 2490
    .itemcount 2490,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.8
step
    .goto Durotar,51.51,41.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_BUY_从他那里购买|r|T133974:0|t[肉排]|r << Rogue/Warrior
    >>|cRXP_WARN_为你的职业法术节省4银币！|r << Rogue/Warrior/Shaman/Warlock
    >>|cRXP_WARN_为你的职业法术节省2银币！|r << Priest
    .vendor >>出售垃圾
    .home >>将你的炉石设置为剃刀岭
    .turnin 2161 >>交任务: |cRXP_FRIENDLY_苦工的重担|r
    .target Innkeeper Grosk
    .train 6760,1 << Rogue
    .train 139,1 << Priest
    .train 980,1 << Warlock
    .train 8044,1 << Shaman
    .train 284,1 << Warrior
step << !Mage !Hunter !Druid
    #optional
    .goto Durotar,51.51,41.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_BUY_从他那里购买|r|T133974:0|t[肉排]|r << Rogue/Warrior
    .vendor >>出售垃圾
    .home >>将你的炉石设置为剃刀岭
    .turnin 2161 >>交任务: |cRXP_FRIENDLY_苦工的重担|r
    .target Innkeeper Grosk
    .train 6760,3 << Rogue
    .train 139,3 << Priest
    .train 980,3 << Warlock
    .train 8044,3 << Shaman
    .train 284,3 << Warrior
step << Warrior
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 284 >>训练你的职业法术
    .target Tarshaw Jaggedscar
step << Warlock
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dhugru|r交谈
    .train 980 >>训练你的职业法术
    .target Dhugru Gorelust
step << Warlock
    #completewith next
    .goto Durotar,54.70,41.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基萨|r交谈并购买|T133738:0|t[火球术 等级2]
    .collect 16302,1,818,1 --Grimoire of Firebolt (Rank 2) (1)
    .target Kitha
    .money <0.01
step << Warlock
    #completewith Tools
    .train 20270 >>使用 |T133738:0|t[火球术法典 等级2]
    .use 16302
step << Rogue
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 6760 >>训练你的职业法术
    .target Kaplak
step << Priest
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .train 139 >>训练你的职业法术
    .target Tai'jin
step
    .goto Durotar,54.17,41.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉乌克|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .money <0.01
    .target Rawrk
step
    .goto Durotar,54.39,42.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加尔克|r交谈
    >>|cRXP_BUY_从|r|cRXP_FRIENDLY_他那|cRXP_BUY_购买|r|T133634:0|t[棕色小袋]|r
    .collect 4496,1,818,1 --Small Brown Pouch (1)
    .target Jark
    .money <0.05
step
    #completewith next
    >>击杀|cRXP_ENEMY_小海浪蟹|r 和|cRXP_ENEMY_小海浪蟹|r , 击败它们后可获得其|cRXP_LOOT_黏液|r
    >>击杀|cRXP_ENEMY_巨钳龙虾人|r 和|cRXP_ENEMY_巨钳龙虾人|r. 击败它们后拾取其|cRXP_LOOT_眼睛|r
    .complete 818,2 --Crawler Mucus (8)
    .mob +Pygmy Surf Crawler
    .mob +Surf Crawler
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +Makrura Shellhide
    .mob +Makrura Clacker
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
    >>在船内及周围搜刮|cRXP_PICK_Gnomish 工具箱|r
    .complete 825,1 --Gnomish Tools (3)
step
    #completewith TaillasherEggs
    .goto Durotar,67.10,69.29,100 >>游到岛屿
step
    #completewith Fur
    >>击杀|cRXP_ENEMY_Tigers|r. 掠夺其|cRXP_LOOT_Fur|r. 此任务无需立即完成
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob Durotar Tiger
step
    #completewith next
    >>击杀|cRXP_ENEMY_小海浪蟹|r 和|cRXP_ENEMY_小海浪蟹|r , 击败它们后可获得其|cRXP_LOOT_黏液|r
    >>击杀|cRXP_ENEMY_巨钳龙虾人|r 和|cRXP_ENEMY_巨钳龙虾人|r. 击败它们后拾取其|cRXP_LOOT_眼睛|r
    .complete 818,2 --Crawler Mucus (8)
    .mob +Pygmy Surf Crawler
    .mob +Surf Crawler
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +Makrura Shellhide
    .mob +Makrura Clacker
step
    #label TaillasherEggs
    #loop
    .goto Durotar,67.04,71.40,0
    .goto Durotar,70.23,70.84,0
    .goto Durotar,67.74,69.86,40,0
    .goto Durotar,67.04,71.40,40,0
    .goto Durotar,67.66,73.86,40,0
    .goto Durotar,68.67,74.47,40,0
    .goto Durotar,69.76,74.69,40,0
    .goto Durotar,70.29,73.31,40,0
    .goto Durotar,70.23,70.84,40,0
    .goto Durotar,69.69,70.35,40,0
    .goto Durotar,69.21,69.69,40,0
    >>拾取地面上的|r鞭尾龙的蛋|cRXP_PICK_Taillasher|r
    >>|cRXP_WARN_它们通常由|r|cRXP_ENEMY_血爪鞭尾龙守卫|r
    .complete 815,1 --Taillasher Egg (3)
    .mob Bloodtalon Taillasher
step
    #completewith next
    >>击杀|cRXP_ENEMY_小海浪蟹|r 和|cRXP_ENEMY_小海浪蟹|r , 击败它们后可获得其|cRXP_LOOT_黏液|r
    >>击杀|cRXP_ENEMY_巨钳龙虾人|r 和|cRXP_ENEMY_巨钳龙虾人|r. 击败它们后拾取其|cRXP_LOOT_眼睛|r
    .complete 818,2 --Crawler Mucus (8)
    .mob +Pygmy Surf Crawler
    .mob +Surf Crawler
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +Makrura Shellhide
    .mob +Makrura Clacker
step
    .goto Durotar,66.94,84.41,150 >>游到主岛
step
    #completewith ZalazaneKill
    >>击杀|cRXP_ENEMY_妖术巨魔|r 和|cRXP_ENEMY_巫毒巨魔|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_巫毒巨魔|r|cRXP_WARN_会施放|r|T136052:0|t[治疗波]
    .complete 826,1 --Hexed Troll (8)
    .mob +Hexed Troll
    .complete 826,2 --Voodoo Troll (8)
    .mob +Voodoo Troll
step
    #completewith next
    >>击杀|cRXP_ENEMY_扎拉赞恩|r. 从他身上搜刮出他的|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_保留你的|r|T136026:0|t[地震术]|cRXP_WARN_在它施放|r|T136052:0|t[治疗波]时使用 << Shaman
    >>|cRXP_WARN_保留你的|r|T132155:0|t[致残]|cRXP_WARN_用于他在施放|r|T136052:0|t[治疗波]时 << Rogue
    >>|cRXP_WARN_小心！他可以施放|r|T136052:0|t[治疗波]|cRXP_WARN_. 如有需要, 请使用你的|r|T134829:0|t[药水]|r << !Shaman !Rogue
    .complete 826,3 --Zalazane's Head (1)
    .mob Zalazane
step
    #label MinshinasSkull
    .goto Durotar,67.4,87.8
    >>拾取地上的一个|cRXP_LOOT_Skulls|r
    .complete 808,1 --Minshina's Skull (1)
step
    #label ZalazaneKill
    .goto Durotar,67.4,87.8
    >>击杀|cRXP_ENEMY_扎拉赞恩|r. 从他身上搜刮出他的|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_保留你的|r|T136026:0|t[地震术]|cRXP_WARN_在它施放|r|T136052:0|t[治疗波]时使用 << Shaman
    >>|cRXP_WARN_保留你的|r|T132155:0|t[致残]|cRXP_WARN_用于他在施放|r|T136052:0|t[治疗波]时 << Rogue
    >>|cRXP_WARN_小心！他可以施放|r|T136052:0|t[治疗波]|cRXP_WARN_. 如有需要, 请使用你的|r|T134829:0|t[药水]|r << !Shaman !Rogue
    .complete 826,3 --Zalazane's Head (1)
    .mob Zalazane
step
    #completewith next
    >>击杀|cRXP_ENEMY_Tigers|r. 击败它们获取|cRXP_LOOT_Fur|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob Durotar Tiger
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
    >>击杀|cRXP_ENEMY_妖术巨魔|r 和|cRXP_ENEMY_巫毒巨魔|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_巫毒巨魔|r|cRXP_WARN_会施放|r|T136052:0|t[治疗波]
    .complete 826,1 --Hexed Troll (8)
    .mob +Hexed Troll
    .complete 826,2 --Voodoo Troll (8)
    .mob +Voodoo Troll
step
    #completewith next
    >>击杀|cRXP_ENEMY_小海浪蟹|r 和|cRXP_ENEMY_小海浪蟹|r , 击败它们后可获得其|cRXP_LOOT_黏液|r
    >>击杀|cRXP_ENEMY_巨钳龙虾人|r 和|cRXP_ENEMY_巨钳龙虾人|r. 击败它们后拾取其|cRXP_LOOT_眼睛|r
    .complete 818,2 --Crawler Mucus (8)
    .mob +Pygmy Surf Crawler
    .mob +Surf Crawler
    .complete 818,1 --Intact Makrura Eye (4)
    .mob +Makrura Shellhide
    .mob +Makrura Clacker
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
    >>击杀|cRXP_ENEMY_Tigers|r. 击败它们获取|cRXP_LOOT_Fur|r
    .complete 817,1 --Durotar Tiger Fur (4)
    .mob Durotar Tiger
step
    #loop
    .goto Durotar,59.64,73.84,0
    .goto Durotar,59.64,73.84,60,0
    .goto Durotar,58.11,77.30,60,0
    .goto Durotar,57.27,79.38,60,0
    .goto Durotar,55.66,80.47,60,0
    .goto Durotar,53.8,83.14,60,0
    >>击杀|cRXP_ENEMY_海蟹|r和|cRXP_ENEMY_Makruras|r. 击败它们后拾取其掉落的|cRXP_LOOT_粘液|r和|cRXP_LOOT_眼睛|r
    .complete 818,2 --Crawler Mucus (8)
    .complete 818,1 --Intact Makrura Eye (4)
    .mob Pygmy Surf Crawler
    .mob Makrura Shellhide
    .mob Makrura Clacker
step
    #completewith Zalazaneturnin
    .goto Durotar,56.06,74.72,150 >>前往森金村
step
    .goto Durotar,56.48,73.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特莱耶克|r交谈
    .vendor >>出售垃圾并修理. 你可以在小屋外与他交谈
    .target Trayexir
step << Mage
    .goto Durotar,56.3,75.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Un'Thuwa|r交谈
    .train 118 >>训练你的职业法术
    .target Un'Thuwa
step
    #label Zalazaneturnin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_和|cRXP_FRIENDLY_沃纳尔|r和|cRXP_FRIENDLY_维尔林|r交谈
    .turnin 808 >>交任务: |cRXP_FRIENDLY_明希纳的颅骨|r
    .turnin 826 >>交任务: |cRXP_FRIENDLY_扎拉赞恩|r
    .target +Master Gadrin
    .goto Durotar,55.95,74.73
    .turnin 818 >>交任务: |cRXP_FRIENDLY_沃纳尔大师|r
    .target +Master Vornal
    .goto Durotar,55.95,74.39
    .turnin 817 >>交任务: |cRXP_FRIENDLY_生活所需的虎皮|r
    .target +Vel'rin Fang
    .goto Durotar,55.95,73.93
step
    #completewith Stolensupplies
    +|cRXP_WARN_绑定你的|r|T133728:0|t[微光徽记]|cRXP_WARN_和|r|T134712:0|t[强力胶水]|cRXP_WARN_. 留着以备紧急情况使用|r
step
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
    .mob +Razormane Quilboar
    .complete 837,2 --Razormane Scout (4)
    .mob +Razormane Scout
step
    #completewith next
    .goto Durotar,51.12,42.46,150 >>前往剃刀岭
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Torka|r和|cRXP_FRIENDLY_Gar'Thok|r交谈
    .turnin 815 >>交任务: |cRXP_FRIENDLY_恐龙蛋大餐|r
    .target +Cook Torka
    .goto Durotar,51.12,42.46
    .turnin 825 >>交任务: |cRXP_FRIENDLY_海底沉船|r
    .target +Gar'Thok
    .goto Durotar,51.95,43.50
step
    .goto Durotar,54.17,41.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉乌克|r交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Rawrk
step << Warrior
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 6546 >>训练你的职业法术
    .target Tarshaw Jaggedscar
    .xp <10,1
step << Warlock
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dhugru|r交谈
    .train 1120 >>训练你的职业法术
    .target Dhugru Gorelust
    .xp <10,1
step << Warlock
    #completewith next
    .goto Durotar,54.70,41.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基萨|r交谈并购买|T133738:0|t[火球术 等级2]
    .collect 16302,1,837,1 --Grimoire of Firebolt (Rank 2) (1)
    .target Kitha
    .money <0.01
step << Warlock
    .train 20270 >>使用 |T133738:0|t[火球术法典 等级2]
    .use 16302
step << Rogue
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 674 >>训练你的职业法术
    .target Kaplak
    .xp <10,1
step << Priest
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .accept 5654 >>接任务: |cRXP_WARN_虚弱妖术|r << Troll
    .accept 5660 >>接任务: |cRXP_WARN_虚弱之触|r << Undead
    .trainer >>训练你的职业法术
    .target Tai'jin
    .xp <10,1
step
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林|r交谈
    .accept 840 >>接任务: |cRXP_LOOT_部落的新兵|r
    .target Takrin Pathseeker
    .xp <10,1
step
    #loop
    .goto Durotar,44.45,39.74,0
    .goto Durotar,44.45,39.74,50,0
    .goto Durotar,44.49,37.47,50,0
    .goto Durotar,43.30,37.32,50,0
    .goto Durotar,41.70,37.09,50,0
    .goto Durotar,41.64,38.27,50,0
    .goto Durotar,41.94,40.46,50,0
    .goto Durotar,43.30,40.40,50,0
    >>击杀|r钢鬃传令兵|r和|r钢鬃卫兵|r
    .complete 837,3 --Razormane Dustrunner (4)
    .mob +Razormane Dustrunner
    .complete 837,4 --Razormane Battleguard (4)
    .mob +Razormane Battleguard
step
    #label Stolensupplies
    #loop
    .goto Durotar,47.92,33.10,0
    .goto Durotar,47.34,33.38,30,0
    .goto Durotar,47.92,33.10,30,0
    .goto Durotar,49.11,33.11,30,0
    .goto Durotar,48.53,32.00,30,0
    .goto Durotar,47.36,30.98,30,0
    .goto Durotar,47.14,29.68,30,0
    .goto Durotar,46.49,34.67,30,0
    .goto Durotar,50.13,32.35,30,0
    .goto Durotar,49.78,28.26,30,0
    .goto Durotar,50.83,25.94,30,0
    .goto Durotar,49.68,24.38,30,0
    .goto Durotar,49.05,22.49,30,0
    >>从地上拾取被偷走的补给袋|r
    .complete 834,1 --Sack of Supplies (5)
    .isOnQuest 834
step
    #completewith next
    .goto Durotar,46.37,22.94,50 >>前往雷兹拉克
step
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .accept 834 >>接任务: |cRXP_LOOT_沙漠之风|r
    .target Rezlak
step
    #loop
    .goto Durotar,47.92,33.10,0
    .goto Durotar,47.34,33.38,30,0
    .goto Durotar,47.92,33.10,30,0
    .goto Durotar,49.11,33.11,30,0
    .goto Durotar,48.53,32.00,30,0
    .goto Durotar,47.36,30.98,30,0
    .goto Durotar,47.14,29.68,30,0
    .goto Durotar,46.49,34.67,30,0
    .goto Durotar,50.13,32.35,30,0
    .goto Durotar,49.78,28.26,30,0
    .goto Durotar,50.83,25.94,30,0
    .goto Durotar,49.68,24.38,30,0
    .goto Durotar,49.05,22.49,30,0
    >>从地上拾取被偷走的补给袋|r
    .complete 834,1 --Sack of Supplies (5)
step
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 834 >>交任务: |cRXP_FRIENDLY_沙漠之风|r
    .accept 835 >>接任务: |cRXP_LOOT_保卫商路|r
    .target Rezlak
step
    #completewith next
    .goto Durotar,53.41,27.81,15 >>穿越洞穴
    .solo
step
    #loop
    .goto Durotar,53.98,23.70,0
    .goto Durotar,54.02,27.23,40,0
    .goto Durotar,52.82,24.27,40,0
    .goto Durotar,51.85,23.95,40,0
    .goto Durotar,54.01,23.63,40,0
    .goto Durotar,52.13,20.77,40,0
    .goto Durotar,51.26,19.19,40,0
    .goto Durotar,53.98,23.70,40,0
    >>击杀|cRXP_ENEMY_尘风暴徒|r 和|cRXP_ENEMY_尘风暴巫师|r
    .complete 835,1 --Dustwind Savage (12)
    .mob +Dustwind Savage
    .complete 835,2 --Dustwind Storm Witch (8)
    .mob +Dustwind Storm Witch
    .solo
step << Troll Warrior/Undead Warrior
    #completewith next
    +|cRXP_WARN_选择|r|T135158:0|t[斑纹木杖]|cRXP_WARN_作为任务奖励并保存. 你将在奥格瑞玛获得法杖训练|r
    .solo
step
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 835 >>交任务: |cRXP_FRIENDLY_保卫商路|r
    .target Rezlak
    .solo
step
    #completewith next
    .goto Durotar,44.72,24.86,40,0
    .goto Durotar,42.28,25.45,30,0
    .goto Durotar,41.66,25.68,20 >>跳入雷霆岭 << !Hunter !Warlock
    .cast 2641 >>|cRXP_WARN_施放|r|T136095:0|t[解散宠物]|cRXP_WARN_然后跳入雷霆岭|r << Hunter
    +|cRXP_WARN_解散你的小鬼, 然后跳入雷霆岭|r << Warlock
    .group
step
    .goto Durotar,42.13,26.67
    >>击杀|cRXP_ENEMY_费索·暗雷|r并从他身上获取|cRXP_LOOT_克劳恩|r
    >>|cRXP_WARN_要非常小心. 在拉怪前, 先击杀巡逻的|r|cRXP_ENEMY_火刃狂热者|r|cRXP_WARN_和后面的|r|cRXP_ENEMY_闪电蜥蜴|r|r
    >>|cRXP_WARN_将他向后拉向|r|cRXP_ENEMY_闪电蜥蜴|r|cRXP_WARN_你刚刚击杀的目标. 否则你可能会拉到额外的燃烧之刃怪物|r
    >>|cRXP_WARN_先击杀小鬼. 当他施放|r|T132155:0|t[割裂]|cRXP_WARN_时使用|r|T136169:0|t[灵魂虹吸] << Rogue
    >>|cRXP_WARN_先击杀小鬼. 当他施放|r|T136026:0|t[地震术]|cRXP_WARN_时使用|r|T136169:0|t[灵魂虹吸] << Shaman
    >>|cRXP_WARN_你可以施放|r |T136071:0|t[变形术], |cRXP_WARN_目标: |r|cRXP_ENEMY_菲兹尔|r |cRXP_WARN_并先击杀|r |cRXP_ENEMY_小鬼|r |cRXP_WARN_first|r << Mage
    >>|cRXP_WARN_先杀掉小鬼|r << Warrior/Warlock/Priest
    >>|cRXP_WARN_使用|r|T134829:0|t[初级治疗药水]|cRXP_WARN_如果你有, 并且在需要时使用|r|T133728:0|t[微光徽记]|r << !Warlock
    >>|cRXP_WARN_使用|r|T134829:0|t[初级治疗药水]和|T133728:0|t[初级治疗石]|cRXP_WARN_(如果你有)以及你的|r|T133728:0|t[微光徽记]|cRXP_WARN_(如需时)|r << Warlock
    .complete 806,1 --Fizzle's Claw (1)
    .mob Fizzle Darkstorm
    .mob Imp Minion
    .mob Burning Blade Fanatic
    .mob Lightning Hide
    .group 2
    --VV Add video / description for Druid / tell priest/lock to fear if pulled back and area is clear?
step
    .hs >>炉石到剃刀岭
    .use 6948
    .cooldown item,6948,>0
    .subzoneskip 362
    .isQuestComplete 806
    .group
step
    .goto Durotar,51.51,41.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板格罗斯克|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Warlock/Priest/Shaman
    >>|cRXP_BUY_从他那里购买|r|T133974:0|t[肉排]|r << Rogue/Warrior
    .vendor >>出售垃圾
    .collect 1179,15,818,1 << Mage/Warlock/Priest/Shaman --Ice Cold Milk (15)
    .collect 2287,15,818,1 << Rogue/Warrior --Haunch of Meat (15)
    .target Innkeeper Grosk
    .money <0.0375
    .group
step
    .goto Durotar,52.24,43.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Orgnil|r 交谈
    .turnin 806 >>交任务: |cRXP_FRIENDLY_黑暗风暴|r
    .accept 828 >>接任务: |cRXP_LOOT_玛高兹|r
    .target Orgnil Soulscar
    .isQuestComplete 806
    .group
step
    .goto Durotar,52.24,43.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Orgnil|r 交谈
    .accept 828 >>接任务: |cRXP_LOOT_玛高兹|r
    .target Orgnil Soulscar
    .isQuestTurnedIn 806
    .group
step
    .goto Durotar,51.95,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gar'Thok|r交谈
    .turnin 837 >>交任务: |cRXP_FRIENDLY_野猪人的进犯|r
    .target Gar'Thok
    .group
step << Warrior
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 6546 >>训练你的职业法术
    .target Tarshaw Jaggedscar
    .group
step << Warlock
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dhugru|r交谈
    .train 1120 >>训练你的职业法术
    .target Dhugru Gorelust
    .group
step << Warlock
    .goto Durotar,54.70,41.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基萨|r交谈并购买|T133738:0|t[火球术 等级2]
    .collect 16302,1,818,1 --Grimoire of Firebolt (Rank 2) (1)
    .target Kitha
    .money <0.01
    .group
step << Rogue
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 674 >>训练你的职业法术
    .target Kaplak
    .group
step << Priest
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
    .train 8092 >>训练你的职业法术
    .target Tai'jin
    .group
step
    #completewith next
    .goto Durotar,55.40,36.73,80,0
    .goto Durotar,56.07,30.05,80,0
    .goto Durotar,56.41,20.04,50 >>前往|cRXP_FRIENDLY_玛高兹|r
    .isQuestTurnedIn 806
    .group
step
    #label MargozTurnIn
    .goto Durotar,56.41,20.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
    .turnin 828 >>交任务: |cRXP_FRIENDLY_玛高兹|r
    .accept 827 >>接任务: |cRXP_LOOT_骷髅石|r
    .target Margoz
    .isQuestTurnedIn 806
    .group
step
    #completewith next
    .goto Durotar,56.49,25.04,50,0
    .goto Durotar,56.11,27.94,50,0
    .goto Durotar,53.18,29.15,50 >>前往尘风洞
    .isQuestTurnedIn 806
    .group
step
    #label Collars1
    #loop
    .goto Durotar,52.70,27.97,0
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    >>击杀|cRXP_ENEMY_火刃暴徒|r和|cRXP_ENEMY_新手|r和|cRXP_ENEMY_教徒|r, 搜刮他们的|cRXP_LOOT_项圈|r
    .complete 827,1 --Searing Collar (6)
    .mob Burning Blade Thug
    .mob Burning Blade Neophyte
    .mob Burning Blade Cultist
    .isQuestTurnedIn 806
    .group
step
    #completewith next
    .goto Durotar,56.30,27.91,80,0
    .goto Durotar,56.41,20.04,50 >>前往|cRXP_FRIENDLY_玛高兹|r
    .isQuestTurnedIn 806
    .group
step
    .goto Durotar,56.41,20.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛高兹|r交谈
    .turnin 827 >>交任务: |cRXP_FRIENDLY_骷髅石|r
    .accept 829 >>接任务: |cRXP_LOOT_尼尔鲁·火刃|r
    .target Margoz
    .isQuestTurnedIn 806
    .group
step
    #completewith next
    .goto Durotar,53.41,27.81,15 >>穿越洞穴
    .group
step
    #loop
    .goto Durotar,53.98,23.70,0
    .goto Durotar,54.02,27.23,40,0
    .goto Durotar,52.82,24.27,40,0
    .goto Durotar,51.85,23.95,40,0
    .goto Durotar,54.01,23.63,40,0
    .goto Durotar,52.13,20.77,40,0
    .goto Durotar,51.26,19.19,40,0
    .goto Durotar,53.98,23.70,40,0
    >>击杀|cRXP_ENEMY_尘风暴徒|r 和|cRXP_ENEMY_尘风暴巫师|r
    >>|cRXP_WARN_这些怪物会逃跑. 小心不要重复拉怪|r
    .complete 835,1 --Dustwind Savage (12)
    .mob +Dustwind Savage
    .complete 835,2 --Dustwind Storm Witch (8)
    .mob +Dustwind Storm Witch
    .group
step << Troll Warrior/Undead Warrior
    #completewith next
    +|cRXP_WARN_选择|r|T135158:0|t[斑纹木杖]|cRXP_WARN_作为任务奖励并保存. 你将在奥格瑞玛获得法杖训练|r
    .group
step
    .goto Durotar,46.37,22.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷兹拉克|r交谈
    .turnin 835 >>交任务: |cRXP_FRIENDLY_保卫商路|r
    .target Rezlak
    .group
step
--    .loop
    .xp 10 >>升级至10级
    --VV Enter loop coords
step
    #completewith Admiralorders1
    .goto Orgrimmar,48.97,92.84,50 >>前往: |cRXP_PICK_奥格瑞玛|r
    .zoneskip Orgrimmar
step << Rogue
    .goto Orgrimmar,48.12,80.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Trak'gen|r|cRXP_BUY_交谈. 从他处购买|r|T135419:0|t[破损的锋利飞斧]|r
    .collect 3135,200,354,1 --Sharp Throwing Axe (200)
    .target Trak'gen
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #completewith ZeptoUC1
    +当你达到11级时装备 |T135421:0|t[破损的锋利飞斧]
    .use 3135
    .itemcount 3135,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Troll Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
    .turnin 5654 >>交任务: |cRXP_FRIENDLY_虚弱妖术|r
    .trainer >>训练你的职业法术
    .target Ur'kyo
    .isOnQuest 5654
step << Troll Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
    .turnin 5652 >>交任务: |cRXP_FRIENDLY_虚弱妖术|r
    .trainer >>训练你的职业法术
    .target Ur'kyo
step << Mage
    .goto Orgrimmar,38.33,85.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 122 >>训练你的职业法术
    .target Pephredo
step << Undead
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
    .fp Orgrimmar >>获取奥格瑞玛飞行点
    .target Doras
step
    #label Admiralorders1
    .goto Orgrimmar,32.29,35.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳兹格雷尔|r交谈
    .turnin 831 >>交任务: |cRXP_FRIENDLY_将军的命令|r
    .target Nazgrel
step << Rogue
    .goto Orgrimmar,42.75,53.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 交谈
	.accept 1963 >>接任务: |cRXP_LOOT_碎手氏族|r << Orc Rogue/Troll Rogue
    .target Therzok
step
    #label NeeruFireblade
    .goto Orgrimmar,49.49,50.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Neeru|r交谈
    .turnin 829 >>交任务: |cRXP_FRIENDLY_尼尔鲁·火刃|r
    .accept 809 >>接任务: |cRXP_LOOT_雅克塞罗斯|r
    .target Neeru Fireblade
    .isOnQuest 829
    .group
step << Warlock
    .goto Orgrimmar,48.59,46.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
    .train 1120 >>训练你的职业法术
    .target Mirket
step << Troll Warrior/Undead Warrior
    #completewith StaveTraining1
    .goto Orgrimmar,68.02,38.69,30 >>前往荣誉谷
step << Warrior
    .goto Orgrimmar,79.93,31.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 6546 >>训练你的职业法术
    .target Grezz Ragefist
step << Troll Warrior/Undead Warrior
    #label StaveTraining1
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
    .train 227 >>训练法杖
    .target Hanashi
step << Troll Warrior/Undead Warrior
    .goto Orgrimmar,81.17,18.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Zendo'jian|r|cRXP_BUY_交谈. 向他购买|r|T135154:0|t[短杖]|r
    .collect 854,1,398,1 --Collect Quarter Staff (1)
    .money <0.3022
    .target Zendo'jian
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.4
step << Troll Warrior/Undead Warrior
    #completewith ZeptoUC1
    +当你达到11级时装备|T135154:0|t[短杖]
    .use 854
    .itemcount 854,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.4
step << Orc Warrior
    .goto Orgrimmar,47.54,68.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌萨罗|r交谈
    .vendor >>出售垃圾. 如果能凑够足够的金钱购买 |T132395:0|t[大板斧](22银14铜)的钱. 如果暂时不够, 稍后再回来
    .target Urtharo
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.2
step << Orc Warrior
    .goto Orgrimmar,47.54,68.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_乌萨罗|r|cRXP_BUY_交谈. 从他那里购买|r|T132395:0|t[大板斧]|r
    .collect 1196,1,398,1 --Collect Tabar (1)
    .money <0.2214
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.2
step << Orc Warrior
    #completewith ZeptoUC1
    +装备 |T132395:0|t[大板斧]
    .use 1196
    .itemcount 1196,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.2
step
    #label LeaveOrg2
    #completewith ZeptoUC1
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .zoneskip Durotar
step
    #label ZeptoUC1
    .goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    >>等待时施放召唤水 << Mage
    .zoneskip Tirisfal Glades
step
    #completewith next
    .goto Tirisfal Glades,61.52,53.20,80 >>前往布瑞尔
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与客栈内的|r|cRXP_FRIENDLY_Coleman|r和|r|cRXP_FRIENDLY_Gretchen|r交谈
    >>|cRXP_FRIENDLY_格雷琴|r|cRXP_WARN_在二楼|r
    .accept 354 >>接任务: |cRXP_LOOT_阿加曼德家族|r
    .accept 362 >>接任务: |cRXP_LOOT_闹鬼的磨坊|r
    .target +Coleman Farthing
    .goto Tirisfal Glades,61.72,52.29
    .accept 375 >>接任务: |cRXP_LOOT_死亡之寒|r
    .target +Gretchen Dedmar
    .goto Tirisfal Glades,61.89,52.73
    .maxlevel 12
step << Warrior
    #optional
    .abandon 1505 >>放弃老兵犹塞克
    .isOnQuest 1505
step << Warrior
    #optional
    .abandon 1498 >>放弃防御之道
    .isOnQuest 1498
step << Warrior
    .goto Tirisfal Glades,61.85,52.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .accept 1818 >>接任务: |cRXP_LOOT_迪林格尔|r
    .target Austil de Mon << Warrior
    .isQuestAvailable 1498
step << Warlock
    .goto Tirisfal Glades,61.62,52.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内|cRXP_FRIENDLY_Ageron|r交谈
    .accept 1478 >>接任务: |cRXP_LOOT_哈加尔的召唤|r
    .target Ageron Kargal
step << Undead Rogue
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的人类|cRXP_FRIENDLY_Marion|r交谈
    .accept 1885 >>接任务: |cRXP_LOOT_米奈特·卡加德|r
    .target Marion Call
step << Mage
    .goto Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_Cain|r交谈
    .accept 1881 >>接任务: |cRXP_LOOT_安娜斯塔西娅|r
    .target Cain Firesong
step << !Mage
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Priest/Shaman
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r << Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_从她那里|r << Warlock
    .vendor >>出售垃圾
    .collect 1179,20,367,1 << Mage/Priest/Shaman --Ice Cold Milk (20)
    .collect 4605,20,367,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,367,1 << Warlock --Ice Cold Milk (15)
    .collect 4605,15,367,1 << Warlock --Red-speckled Mushroom (15)
    .money <0.075 << Warlock
    .money <0.05 << !Warlock
    .target Innkeeper Renee
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的|cRXP_FRIENDLY_亡灵卫兵伯吉斯|r和|cRXP_FRIENDLY_通缉告示|r和|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .accept 374 >>接任务: |cRXP_LOOT_死亡证明|r
    .target +Deathguard Burgess
    .goto Tirisfal Glades,60.93,52.01
    .accept 398 >>接任务: |cRXP_LOOT_悬赏：蛆眼|r
    .goto Tirisfal Glades,60.74,51.52
    .accept 358 >>接任务: |cRXP_LOOT_盗墓贼|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
    .maxlevel 11
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r和|cRXP_FRIENDLY_通缉告示|r交谈
    .accept 374 >>接任务: |cRXP_LOOT_死亡证明|r
    .target +Deathguard Burgess
    .goto Tirisfal Glades,60.93,52.01
    .accept 398 >>接任务: |cRXP_LOOT_悬赏：蛆眼|r
    .goto Tirisfal Glades,60.74,51.52
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 1818 >>交任务: |cRXP_FRIENDLY_迪林格尔|r
    .accept 1819 >>接任务: |cRXP_LOOT_切割者奥拉格|r
    .target Deathguard Dillinger
    .isQuestAvailable 1498
step << Warrior
    .goto Tirisfal Glades,59.16,48.51
    >>|cRXP_WARN_点击地面上的骷髅. 这将召唤|r|cRXP_ENEMY_Ulag. |r|cRXP_WARN_杀掉他|r
    .complete 1819,1 --Ulag the Cleaver (1)
    .mob Ulag the Cleaver
    .isQuestAvailable 1498
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 1819 >>交任务: |cRXP_FRIENDLY_切割者奥拉格|r
    .accept 1820 >>接任务: |cRXP_LOOT_库勒曼|r
    .target Deathguard Dillinger
    .isQuestAvailable 1498
step << Warlock/Mage/Priest
    #completewith next
    .goto Tirisfal Glades,61.80,65.06,20 >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
    .zoneskip Undercity
step << Warlock/Mage/Priest
    #completewith next
    .goto Undercity,66.09,20.06,35,0
    .goto Undercity,64.37,23.94,35,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
step << Warlock/Mage/Priest
    #optional
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
    .collect 3164,6,429,1 >>|cRXP_BUY_从拍卖行购买六|r|T134339:0|t[变色的狼心]|r
    .target Auctioneer Rhyker
    .zoneskip Undercity,1
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_Carendin|r交谈
    .turnin 1478 >>交任务: |cRXP_FRIENDLY_哈加尔的召唤|r
    .accept 1473 >>接任务: |cRXP_LOOT_虚空中的生物|r
step << Mage
    #optional
    .abandon 1883 >>放弃与安苏瓦交谈, 否则将无法接取后续任务
    .isOnQuest 1883
step << Mage
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1881 >>交任务: |cRXP_FRIENDLY_安娜斯塔西娅|r
    .accept 1882 >>接任务: |cRXP_LOOT_巴尼尔农场|r
    .target Anastasia Hartwell
step << Priest
    #optional
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r交谈
    .turnin 5660 >>交任务: |cRXP_FRIENDLY_虚弱之触|r
    .target Aelthalyste
    .isOnQuest 5660
step << Priest
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r交谈
    .accept 5658 >>接任务: |cRXP_WARN_虚弱之触|r
    .turnin 5658 >>交任务: |cRXP_FRIENDLY_虚弱之触|r
    .target Aelthalyste
step << Rogue
    #optional
    #completewith Swordtraining1
    .goto Tirisfal Glades,61.80,65.06,20 >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
    .zoneskip Undercity
    .money <0.3023
step << Rogue
    #optional
    #completewith Swordtraining1
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
    .money <0.3023
step << Undead Rogue
    #optional
    .goto Undercity,83.52,69.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .turnin 1885 >>交任务: |cRXP_FRIENDLY_米奈特·卡加德|r
    .accept 1886 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
    .money <0.3023
step << Rogue
    #optional
    #label Swordtraining1
    .goto Undercity,57.29,32.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与军事区的|r|cRXP_FRIENDLY_阿基巴德|r交谈
    .train 201 >>学习1小时剑术
    .target Archibald
    .money <0.3023
step << Rogue
    #optional
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_查尔斯|r|cRXP_BUY_在盗贼区交谈. 从他那里购买|r|T135346:0|t[斗士短剑]|r
    .collect 851,1,435,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Charles Seaton
step << Rogue
    #optional
    #completewith ScarletCrusade1
    +装备 |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Undead Rogue
    #optional
    #sticky
    #completewith UnluckyRogue
    >>|cRXP_WARN_如果你看到|r |cRXP_FRIENDLY_Astor|r|cRXP_WARN_, 与他交谈并击杀他. 搜刮其尸体获得信件. 他在布瑞尔与瑟伯切尔之间的道路上巡逻|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan Astor Hadren
    .isOnQuest 1886
step << Rogue
    #optional
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
    .collect 3164,6,429,1 >>|cRXP_BUY_从拍卖行购买六|r|T134339:0|t[变色的狼心]|r
    .target Auctioneer Rhyker
    .zoneskip Undercity,1
step << Warlock/Mage/Rogue/Priest
    .goto Undercity,47.25,39.12,50,0
    .goto Undercity,46.35,43.86,10,0
    .goto Undercity,45.24,39.35,10,0
    .goto Undercity,41.32,38.40,10,0
    .goto Undercity,40.74,33.95,10,0
    .goto Undercity,34.80,33.19,15,0
    .goto Undercity,27.39,30.23,35,0
    .goto Undercity,21.89,43.35,35,0
    .goto Tirisfal Glades,51.10,71.53,50,0
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
step << Warlock
    #completewith next
    .goto Tirisfal Glades,51.06,67.57
    >>loot|cRXP_PICK_派瑞恩的箱子|r以获得 |T133733:0|t[Egalin的法典]
    .complete 1473,1 --Egalin's Grimoire (1)
step
    #label ScarletCrusade1
    #loop
	.goto Tirisfal Glades,50.07,68.87,40,0
	.goto Tirisfal Glades,50.23,66.94,40,0
	.goto Tirisfal Glades,51.16,65.73,40,0
	.goto Tirisfal Glades,51.75,66.04,40,0
	.goto Tirisfal Glades,52.93,67.62,40,0
	.goto Tirisfal Glades,52.72,69.33,40,0
	.goto Tirisfal Glades,51.96,69.57,40,0
	.goto Tirisfal Glades,51.03,69.55,40,0
    >>击杀 |cRXP_ENEMY_派瑞恩队长|r和 |cRXP_ENEMY_血色狂热者|r和 |cRXP_ENEMY_血色传教士|r, 掠夺他们的 |cRXP_LOOT_血色十字军徽记之戒|r
    .complete 370,1 --Captain Perrine (1)
    .mob +Captain Perrine
    .complete 370,2 --Scarlet Zealot (3)
    .mob +Scarlet Zealot
    .complete 370,3 --Scarlet Missionary (3)
    .mob +Scarlet Missionary
    .complete 374,1 --Scarlet Insignia Ring (10)
    .disablecheckbox
step << Warlock
    .goto Tirisfal Glades,51.06,67.57
    >>搜刮地面上的派瑞恩的箱子, 获得|T133733:0|t[Egalin的法典]
    .complete 1473,1 --Egalin's Grimoire (1)
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
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_Carendin|r交谈
    .turnin 1473 >>交任务: |cRXP_FRIENDLY_虚空中的生物|r
    .accept 1471 >>接任务: |cRXP_LOOT_誓缚|r
    .target Carendin Halgar
step << Warlock
    #completewith next
    .cast 9221 >>在召唤法阵中使用 |T134416:0|t[召唤符文]
    .use 6284
step << Warlock
    .goto Undercity,86.64,27.10
    >>击杀召唤的虚空行者
    .complete 1471,1 --Kill Summoned Voidwalker (1)
    .mob Summoned Voidwalker
    .use 6284
step << Warlock
    .goto Undercity,85.04,25.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Carendin|r交谈
    .turnin 1471 >>交任务: |cRXP_FRIENDLY_誓缚|r
    .target Carendin Halgar
step << skip --Warlock
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过将角色 positioned 在最低楼梯的最高处, 直到看起来像是漂浮一样, 然后登出再重新登录, 来执行一次“登出跳过”操作|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >>|cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
step << Warlock
    #completewith next
    .goto Tirisfal Glades,61.92,64.85
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
step
    #completewith next
    >>击杀你看到的任何|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮它们的|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    .goto Tirisfal Glades,47.60,44.03,150 >>向西北方向前往阿加曼德磨坊
    .isOnQuest 362
step
    #completewith MillsOverun
    >>|T134939:0|t[|cRXP_LOOT_瑟曼的信|r]|cRXP_WARN_可能从这些怪物身上掉落. 如果掉落, 请接受任务|r
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >>接任务: |cRXP_LOOT_未寄出的信件|r
    .use 2839
step
    #completewith ThurmanGregor
    >>击杀|cRXP_ENEMY_Soldiers|r士兵 和|cRXP_ENEMY_Bonecasters|r骨巫师. 击杀后搜刮他们的|cRXP_LOOT_Ribs|r肋骨 和|cRXP_LOOT_Skulls|r头骨
    .complete 426,1 --Notched Rib (5)
    .mob +Rattlecage Soldier
    .mob +Cracked Skull Soldier
    .complete 426,2 --Blackened Skull (3)
    .mob +Darkeye Bonecaster
step
    #label KillDevlin
    .goto Tirisfal Glades,47.34,40.78
    >>击杀|cRXP_ENEMY_Devlin|r. 搜刮他的|cRXP_LOOT_Remains|r
    .complete 362,1 --Devlin's Remains (1)
    .mob Devlin Agamand
step
    .goto Tirisfal Glades,49.34,36.02
    >>击杀|cRXP_ENEMY_Nissa|r. 搜刮她的|cRXP_LOOT_Remains|r. 她可能在建筑物内
    .complete 354,2 --Nissa's Remains (1)
    .mob Nissa Agamand
step
    #label ThurmanGregor
    #loop
    .goto Tirisfal Glades,45.08,31.15,0
    .goto Tirisfal Glades,43.71,35.25,60,0
    .goto Tirisfal Glades,45.03,30.99,60,0
    .goto Tirisfal Glades,46.79,29.80,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,42.82,31.93,60,0
    .goto Tirisfal Glades,45.08,31.15,60,0
    >>击杀|cRXP_ENEMY_Thurman|r和|cRXP_ENEMY_格雷戈|r. 搜刮他们的|cRXP_LOOT_Remains|r. 他们会在附近巡逻
    .complete 354,3 --Thurman's Remains (1)
    .unitscan +Thurman Agamand
    .complete 354,1 --Gregor's Remains (1)
    .unitscan +Gregor Agamand
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
    >>击杀|cRXP_ENEMY_Soldiers|r士兵 和|cRXP_ENEMY_Bonecasters|r骨巫师. 击杀后搜刮他们的|cRXP_LOOT_Ribs|r肋骨 和|cRXP_LOOT_Skulls|r头骨
    .complete 426,1 --Notched Rib (5)
    .mob +Rattlecage Soldier
    .mob +Cracked Skull Soldier
    .complete 426,2 --Blackened Skull (3)
    .mob +Darkeye Bonecaster
step
    #requires MillsOverun
    #completewith MaggotEye
    .goto Tirisfal Glades,54.32,31.56,15,0
    .goto Tirisfal Glades,54.78,32.75,15,0
    .goto Tirisfal Glades,55.84,32.28,15,0
    .goto Tirisfal Glades,56.55,32.43,40,0
    .goto Tirisfal Glades,57.77,31.69,50 >>沿山坡下行
    >>|cRXP_WARN_小心点, 别摔得太狠. 为了安全, 请沿着路径点前进|r
step
    #requires MillsOverun
    #completewith next
    >>击杀 |cRXP_ENEMY_Gnolls|r 和 |cRXP_ENEMY_Mongrels|r, 掠夺他们的 |cRXP_LOOT_Ichor|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .mob Rot Hide Gnoll
    .mob Rot Hide Mongrel
    .isOnQuest 358
    .maxlevel 11
step
    #requires MillsOverun
    #label MaggotEye
    .goto Tirisfal Glades,58.66,30.77
    >>击杀|cRXP_ENEMY_蛆眼|r. 击败后搜刮他的|cRXP_LOOT_爪|r
    .complete 398,1 --Maggot Eye's Paw (1)
    .mob Maggot Eye
step
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
    >>击杀|r鱼人|cRXP_ENEMY_Murlocs|r. 击杀后搜刮他们的|r鱼鳞|cRXP_LOOT_Scales|r
    .complete 368,1 --Vile Fin Scale (5)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
step
    #completewith RotHideGnolls
    >>击杀你看到的任何|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮它们的|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #completewith next
    >>击杀|cRXP_ENEMY_Mongrels|r和|cRXP_ENEMY_盗墓贼|r. 击败它们后搜刮其掉落的|cRXP_LOOT_腐液|r`
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,1 --Rot Hide Graverobber (8)
    .complete 358,3 --Embalming Ichor (8)
    .mob Rot Hide Mongrel
    .mob Rot Hide Graverobber
    .isOnQuest 358
    .maxlevel 11
step
    #optional
    #loop
    .goto Tirisfal Glades,57.48,35.95,0
    .goto Tirisfal Glades,57.68,34.37,30,0
    .goto Tirisfal Glades,57.45,35.96,30,0
    .goto Tirisfal Glades,56.79,37.79,30,0
    .goto Tirisfal Glades,56.05,38.76,30,0
    .goto Tirisfal Glades,55.09,38.74,30,0
    .goto Tirisfal Glades,55.25,40.16,30,0
    .goto Tirisfal Glades,54.68,42.12,30,0
    .goto Tirisfal Glades,55.29,41.51,30,0
    .goto Tirisfal Glades,56.58,41.99,30,0
    .goto Tirisfal Glades,58.29,42.93,30,0
    .goto Tirisfal Glades,58.83,40.68,30,0
    .goto Tirisfal Glades,58.36,38.55,30,0
    .goto Tirisfal Glades,57.48,35.95,30,0
    >>拾取地面上的|cRXP_PICK_末日草|r. 它们出现在豺狼人区域的树木附近
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482
    .maxlevel 11
step
    #label RotHideGnolls
    #loop
    .goto Tirisfal Glades,55.24,42.54,0
    .goto Tirisfal Glades,56.31,39.67,40,0
    .goto Tirisfal Glades,54.71,41.19,40,0
    .goto Tirisfal Glades,53.90,43.93,40,0
    .goto Tirisfal Glades,55.24,42.54,40,0
    .goto Tirisfal Glades,56.43,43.92,40,0
    >>击杀|cRXP_ENEMY_Mongrels|r和|cRXP_ENEMY_盗墓贼|r. 击败它们后搜刮其掉落的|cRXP_LOOT_腐液|r`
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,1 --Rot Hide Graverobber (8)
    .complete 358,3 --Embalming Ichor (8)
    .mob Rot Hide Mongrel
    .mob Rot Hide Graverobber
    .isOnQuest 358
    .maxlevel 11
step
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Holland|r交谈, 他在墓地附近巡逻
    .turnin 5482 >>交任务: |cRXP_FRIENDLY_末日草|r
    .target Junior Apothecary Holland
    .isQuestComplete 5482
step
    #optional
    .abandon 5482 >>放弃末日草
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r和|cRXP_FRIENDLY_Johaan|r和|cRXP_FRIENDLY_Zygand|r和|cRXP_FRIENDLY_Sevren|r交谈
    .turnin 426 >>交任务: |cRXP_FRIENDLY_磨坊告急|r
    .target +Deathguard Dillinger
    .goto Tirisfal Glades,58.19,51.44
    .turnin 368 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 369 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 398 >>交任务: |cRXP_FRIENDLY_悬赏：蛆眼|r
    .turnin 370 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 371 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .turnin 358 >>交任务: |cRXP_FRIENDLY_盗墓贼|r
    .accept 359 >>接任务: |cRXP_LOOT_亡灵卫兵的职责|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
    .isQuestComplete 358
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r和|cRXP_FRIENDLY_Johaan|r和|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 426 >>交任务: |cRXP_FRIENDLY_磨坊告急|r
    .target +Deathguard Dillinger
    .goto Tirisfal Glades,58.19,51.44
    .turnin 368 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 369 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 398 >>交任务: |cRXP_FRIENDLY_悬赏：蛆眼|r
    .turnin 370 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 371 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
step
    #optional
    .abandon 358 >>放弃盗墓贼
step
    #completewith HorrorsandSpirits
    +|cRXP_WARN_绑定你的|r|T133849:0|t[沉睡之砂]|cRXP_WARN_. 请保留以备紧急情况使用|r
step
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从|r|cRXP_FRIENDLY_他那|cRXP_BUY_购买|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|rYvette|r和|rColeman|r和|rGretchen|r交谈
    >>|cRXP_FRIENDLY_格雷琴|r|cRXP_WARN_在二楼|r
    .turnin 361 >>交任务: |cRXP_FRIENDLY_未寄出的信件|r
    .target +Yvette Farthing
    .goto Tirisfal Glades,61.58,52.60
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .target +Coleman Farthing
    .goto Tirisfal Glades,61.72,52.29
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target +Gretchen Dedmar
    .goto Tirisfal Glades,61.89,52.73
    .isQuestComplete 375
    .isOnQuest 361
    .group
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与客栈内的|r|cRXP_FRIENDLY_Coleman|r和|r|cRXP_FRIENDLY_Gretchen|r交谈
    >>|cRXP_FRIENDLY_格雷琴|r|cRXP_WARN_在二楼|r
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .target +Coleman Farthing
    .goto Tirisfal Glades,61.72,52.29
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target +Gretchen Dedmar
    .goto Tirisfal Glades,61.89,52.73
    .isQuestComplete 375
    .group
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与客栈内的|cRXP_FRIENDLY_Yvette|r和|cRXP_FRIENDLY_Coleman|r交谈
    >>|cRXP_FRIENDLY_格雷琴|r|cRXP_WARN_在二楼|r
    .turnin 361 >>交任务: |cRXP_FRIENDLY_未寄出的信件|r
    .target +Yvette Farthing
    .goto Tirisfal Glades,61.58,52.60
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .target +Coleman Farthing
    .goto Tirisfal Glades,61.72,52.29
    .isOnQuest 361
    .group
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|r|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .goto Tirisfal Glades,61.72,52.29
    .target Coleman Farthing
    .group
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|rYvette|r和|rColeman|r和|rGretchen|r交谈
    >>|cRXP_FRIENDLY_格雷琴|r|cRXP_WARN_在二楼|r
    .turnin 361 >>交任务: |cRXP_FRIENDLY_未寄出的信件|r
    .target +Yvette Farthing
    .goto Tirisfal Glades,61.58,52.60
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .target +Coleman Farthing
    .goto Tirisfal Glades,61.72,52.29
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target +Gretchen Dedmar
    .goto Tirisfal Glades,61.89,52.73
    .isQuestComplete 375
    .isOnQuest 361
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与客栈内的|r|cRXP_FRIENDLY_Coleman|r和|r|cRXP_FRIENDLY_Gretchen|r交谈
    >>|cRXP_FRIENDLY_格雷琴|r|cRXP_WARN_在二楼|r
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .target +Coleman Farthing
    .goto Tirisfal Glades,61.72,52.29
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target +Gretchen Dedmar
    .goto Tirisfal Glades,61.89,52.73
    .isQuestComplete 375
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与客栈内的|cRXP_FRIENDLY_Yvette|r和|cRXP_FRIENDLY_Coleman|r交谈
    >>|cRXP_FRIENDLY_格雷琴|r|cRXP_WARN_在二楼|r
    .turnin 361 >>交任务: |cRXP_FRIENDLY_未寄出的信件|r
    .target +Yvette Farthing
    .goto Tirisfal Glades,61.58,52.60
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .target +Coleman Farthing
    .goto Tirisfal Glades,61.72,52.29
    .isOnQuest 361
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|r|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .goto Tirisfal Glades,61.72,52.29
    .target Coleman Farthing
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|r|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 1820 >>交任务: |cRXP_FRIENDLY_库勒曼|r
    .accept 1821 >>接任务: |cRXP_WARN_阿加曼德家传武器|r
    .group
    .isQuestTurnedIn 1819
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|r|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 1820 >>交任务: |cRXP_FRIENDLY_库勒曼|r
    .solo
    .isQuestTurnedIn 1819
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 588 >>训练 |T135926:0|t[内心之火]
    .target Dark Cleric Beryl
    .xp <12,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 145 >>训练 |T135812:0|t[火球术等级3]
    .target Cain Firesong
    .xp <12,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 7384 >>训练 |T132223:0|t[压制]
    .target Austil de Mon
    .xp <12,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 1766 >>训练 |T132219:0|t[踢]
    .target Marion Call
    .xp <12,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 755 >>训练 |T136168:0|t[生命汲取]
    .target Rupert Boch
    .xp <12,1
step << !Mage
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Priest
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r <<Warrior/Rogue
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_和|r|T134532:0|t[红斑蘑菇]|r << Warlock
    .vendor >>出售垃圾
    .collect 1179,20,356,1 << Mage/Priest --Ice Cold Milk (20)
    .collect 4605,20,356,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,356,1 << Warlock --Ice Cold Milk (15)
    .collect 4605,15,356,1 << Warlock --Red-speckled Mushroom (15)
    .money <0.050 << !Warlock
    .money <0.075 << Warlock
    .target Innkeeper Renee
step
    #label UnluckyRogue
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Linnea|r交谈
    .turnin 359 >>交任务: |cRXP_FRIENDLY_亡灵卫兵的职责|r
    .accept 360 >>接任务: |cRXP_LOOT_向塞弗伦回报|r
    .accept 356 >>接任务: |cRXP_LOOT_巡查后方|r
    .target Deathguard Linnea
    .isQuestTurnedIn 358
step
    #label UnluckyRogue
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Linnea|r交谈
    .accept 356 >>接任务: |cRXP_LOOT_巡查后方|r
    .target Deathguard Linnea
step
    #completewith HorrorsandSpirits
    >>击杀你看到的任何|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮它们的|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step << Mage
    #completewith next
    >>击杀|cRXP_ENEMY_可怕的血僵尸|r和|cRXP_ENEMY_游荡的幽灵|r
    .complete 356,1 --Bleeding Horror (8)
    .mob +Bleeding Horror
    .complete 356,2 --Wandering Spirit (8)
    .mob +Wandering Spirit
step << Mage
    .goto Tirisfal Glades,77.48,62.00
    >>拾取地面上任意一种植物以获得 |cRXP_PICK_Balnir Snapdragon|r
    .complete 1882,1 --Balnir Snapdragons (1)
step
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
    .mob +Bleeding Horror
    .complete 356,2 --Wandering Spirit (8)
    .mob +Wandering Spirit
step << Priest/Warlock
    #completewith Scarletrings
    >>|cRXP_WARN_收集 3 堆|r|T132889:0|t[亚麻布]|cRXP_WARN_, 用于制作你的初级魔杖. 这是在进入银松森林前获取足够数量的最后机会|r
    .collect 2589,60,435,1 --Linen Cloth (60)
    .mob Scarlet Friar
    .mob Scarlet Zealot
step
    #completewith next
    >>击杀 |cRXP_ENEMY_血色狂热者|r和 |cRXP_ENEMY_血色狂热者|r, 从他们身上搜刮 |cRXP_LOOT_血色十字军徽记之戒|r
    .complete 374,1 --Scarlet Insignia Ring (10)
    .isOnQuest 374
step
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
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_血色苦行修士|r|cRXP_WARN_会施放|r|T135929:0|t[治疗术]
    .complete 371,1 --Captain Vachon (1)
    .mob +Captain Vachon
    .complete 371,2 --Scarlet Friar (5)
    .mob +Scarlet Friar
    .isOnQuest 371
step
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
    >>击杀 |cRXP_ENEMY_血色狂热者|r和 |cRXP_ENEMY_血色狂热者|r, 从他们身上搜刮 |cRXP_LOOT_血色十字军徽记之戒|r
    .complete 374,1 --Scarlet Insignia Ring (10)
    .mob Scarlet Friar
    .mob Scarlet Zealot
    .isOnQuest 374
step << Priest/Warlock
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
    >>|cRXP_WARN_为你的法杖收集 3 堆|r|T132889:0|t[亚麻布]|cRXP_WARN_. 这是在前往银松森林之前获得足够数量的最后机会|r
    .collect 2589,60,435,1 --Linen Cloth (60)
    .mob Scarlet Friar
    .mob Scarlet Zealot
step
    #completewith next
    >>击杀你看到的任何|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮它们的|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
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
    >>击杀|cRXP_ENEMY_邪恶的夜行蜘蛛|r. 击败它们以获取|cRXP_LOOT_毒液|r
    .complete 369,1 --Vicious Night Web Spider Venom (4)
    .mob Vicious Night Web Spider
step
    #completewith LinneaTurnin
    .goto Tirisfal Glades,65.49,60.25,60 >>返回向|cRXP_FRIENDLY_Linnea|r旅行
step
    #completewith next
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r. 从它们身上搜刮 |cRXP_LOOT_皮毛|r
    >>|cRXP_WARN_如果你的运气不好, 可以跳过这个任务|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #label LinneaTurnin
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Linnea|r交谈
    .turnin 356 >>交任务: |cRXP_FRIENDLY_巡查后方|r
    .target Deathguard Linnea
step
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从|r|cRXP_FRIENDLY_他那|cRXP_BUY_购买|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r和|cRXP_FRIENDLY_Zygand|r和|cRXP_FRIENDLY_Sevren|r和|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 374 >>交任务: |cRXP_FRIENDLY_死亡证明|r
    .target +Deathguard Burgess
    .goto Tirisfal Glades,60.93,52.01
    .turnin 371 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .turnin 360 >>交任务: |cRXP_FRIENDLY_向塞弗伦回报|r
    .turnin 355 >>交任务: |cRXP_FRIENDLY_与塞弗伦交谈|r
    .accept 408 >>接任务: |cRXP_WARN_家族墓穴|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
    .turnin 369 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 445 >>接任务: |cRXP_LOOT_给银松森林送信|r
    .accept 492 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.39
    .isOnQuest 360
    .group
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r和|cRXP_FRIENDLY_Zygand|r和|cRXP_FRIENDLY_Sevren|r和|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 374 >>交任务: |cRXP_FRIENDLY_死亡证明|r
    .target +Deathguard Burgess
    .goto Tirisfal Glades,60.93,52.01
    .turnin 371 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .turnin 355 >>交任务: |cRXP_FRIENDLY_与塞弗伦交谈|r
    .accept 408 >>接任务: |cRXP_WARN_家族墓穴|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
    .turnin 369 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 445 >>接任务: |cRXP_LOOT_给银松森林送信|r
    .accept 492 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.39
    .group
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r和|cRXP_FRIENDLY_Zygand|r和|cRXP_FRIENDLY_Sevren|r和|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 374 >>交任务: |cRXP_FRIENDLY_死亡证明|r
    .target +Deathguard Burgess
    .goto Tirisfal Glades,60.93,52.01
    .turnin 371 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .turnin 360 >>交任务: |cRXP_FRIENDLY_向塞弗伦回报|r
    .turnin 355 >>交任务: |cRXP_FRIENDLY_与塞弗伦交谈|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
    .turnin 369 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 445 >>接任务: |cRXP_LOOT_给银松森林送信|r
    .accept 492 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.39
    .isOnQuest 360
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r和|cRXP_FRIENDLY_Zygand|r和|cRXP_FRIENDLY_Sevren|r和|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 374 >>交任务: |cRXP_FRIENDLY_死亡证明|r
    .target +Deathguard Burgess
    .goto Tirisfal Glades,60.93,52.01
    .turnin 371 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .turnin 355 >>交任务: |cRXP_FRIENDLY_与塞弗伦交谈|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
    .turnin 369 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 445 >>接任务: |cRXP_LOOT_给银松森林送信|r
    .accept 492 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.39
step
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t和楼上|cRXP_FRIENDLY_Gretchen|r谈话
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isOnQuest 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 588 >>训练 |T135926:0|t[内心之火]
    .target Dark Cleric Beryl
    .xp <12,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 145 >>训练 |T135812:0|t[火球术等级3]
    .target Cain Firesong
    .xp <12,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 7384 >>训练 |T132223:0|t[压制]
    .target Austil de Mon
    .xp <12,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 1766 >>训练 |T132219:0|t[踢]
    .target Marion Call
    .xp <12,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 755 >>训练 |T136168:0|t[生命汲取]
    .target Rupert Boch
    .xp <12,1
step
    .goto Tirisfal Glades,47.39,43.64,150,0
    .goto Tirisfal Glades,52.23,26.91,20,0
    .goto Tirisfal Glades,52.29,26.40,8 >>前往阿加曼德磨坊的墓穴
    .isOnQuest 408
    .group
step << Warrior
    #completewith CaptainDargol
    >>拾取地面上的|cRXP_PICK_阿加曼德武器架|r
    .complete 1821,1 --Agamand Family Axe (1)
    .complete 1821,2 --Agamand Family Dagger (1)
    .complete 1821,3 --Agamand Family Mace (1)
    .complete 1821,4 --Agamand Family Sword (1)
    .isOnQuest 1821
    .group 2
step
    #completewith next
    >>击杀|cRXP_ENEMY_哀嚎的鬼魂|r和|cRXP_ENEMY_腐烂的古尸|r
    >>|cRXP_WARN_小心！此墓穴中的怪物会动态刷新！|r
    .complete 408,1 --Wailing Ancestor (8)
    .mob +Wailing Ancestor
    .complete 408,2 --Rotting Ancestor (8)
    .mob +Rotting Ancestor
    .group 2
step
    #label CaptainDargol
    .goto Tirisfal Glades,52.53,26.78,8,0
    .goto Tirisfal Glades,52.08,26.81,8,0
    .goto Tirisfal Glades,52.03,26.43,8,0
    .goto Tirisfal Glades,52.81,26.36
    >>击杀 |cRXP_ENEMY_达高尔队长|r. 搜刮他的 |cRXP_LOOT_头骨|r. 他位于墓穴底部
    .complete 408,3 --Dargol's Skull (1)
    .mob Captain Dargol
    .isOnQuest 408
    .group 2
step << Warrior
    #completewith next
    >>拾取地面上的|cRXP_PICK_阿加曼德武器架|r
    .complete 1821,1 --Agamand Family Axe (1)
    .complete 1821,2 --Agamand Family Dagger (1)
    .complete 1821,3 --Agamand Family Mace (1)
    .complete 1821,4 --Agamand Family Sword (1)
    .isOnQuest 1821
    .group 2
step
    #loop
	.goto Tirisfal Glades,51.90,26.87,0
	.goto Tirisfal Glades,51.88,25.86,25,0
	.goto Tirisfal Glades,52.61,25.85,25,0
	.goto Tirisfal Glades,52.60,26.88,25,0
	.goto Tirisfal Glades,51.90,26.87,25,0
    >>击杀|cRXP_ENEMY_哀嚎的鬼魂|r和|cRXP_ENEMY_腐烂的古尸|r
    >>|cRXP_WARN_小心！此墓穴中的怪物会动态刷新！|r
    .complete 408,1 --Wailing Ancestor (8)
    .mob +Wailing Ancestor
    .complete 408,2 --Rotting Ancestor (8)
    .mob +Rotting Ancestor
    .isOnQuest 408
    .group 2
step << Warrior
    #loop
    .goto Tirisfal Glades,52.66,25.87,0
    .goto Tirisfal Glades,51.70,25.69,12,0
    .goto Tirisfal Glades,52.62,25.62,12,0
    .goto Tirisfal Glades,52.65,27.02,12,0
    .goto Tirisfal Glades,51.89,27.10,12,0
    .goto Tirisfal Glades,52.66,25.87,12,0
    >>拾取地面上的|cRXP_PICK_阿加曼德武器架|r
    .complete 1821,1 --Agamand Family Axe (1)
    .complete 1821,2 --Agamand Family Dagger (1)
    .complete 1821,3 --Agamand Family Mace (1)
    .complete 1821,4 --Agamand Family Sword (1)
    .isOnQuest 1821
    .group 2
step << skip
    .goto Tirisfal Glades,51.68,25.67
    .goto Tirisfal Glades,56.24,49.42,30 >>|cRXP_WARN_跳到其中一个武器架上, 通过登出再重新登录来实现登出跳过|r
    .link https://www.youtube.com/watch?v=bH_NYmWf8Lc&ab >>|cRXP_WARN_点击此处查看示例|r
    .isQuestComplete 408
    .group
step
    #completewith NewPlagueFinal
    .subzone 159 >>前往布瑞尔
    .isQuestComplete 408
    .group
step
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞弗伦|r交谈
    .turnin 408 >>交任务: |cRXP_FRIENDLY_家族墓穴|r
    .target Magistrate Sevren
    .isQuestComplete 408
    .group
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|r|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 1821 >>交任务: |cRXP_FRIENDLY_阿加曼德家传武器|r
    .turnin 1822 >>交任务: |cRXP_FRIENDLY_祖传武器|r
    .target Coleman Farthing
    .isQuestComplete 1821
    .group
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|r|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 1822 >>交任务: |cRXP_FRIENDLY_祖传武器|r
    .target Coleman Farthing
    .isQuestTurnedIn 1821
    .group
step
    #optional
    .goto Tirisfal Glades,61.97,51.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与客栈后方楼下的|cRXP_FRIENDLY_血色十字军俘虏|r交谈
    .turnin 407 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .target Captured Scarlet Zealot
    .isQuestTurnedIn 365
step
    #label NewPlagueFinal
    .goto Tirisfal Glades,61.94,51.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与客栈后方楼下的|cRXP_FRIENDLY_被俘虏的巡山人|r交谈
    .turnin 492 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .target Captured Mountaineer
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 588,1 >>训练 |T135926:0|t[内心之火]
    .target Dark Cleric Beryl
    .xp <12,1
    .xp >14,1
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 6074 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <14,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 145,1 >>训练 |T135812:0|t[火球术等级3]
    .target Cain Firesong
    .xp <12,1
    .xp >14,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 2137 >>训练你的职业法术
    .target Cain Firesong
    .xp <14,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 7384,1 >>训练 |T132223:0|t[压制]
    .target Austil de Mon
    .xp <12,1
    .xp >14,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 1160 >>训练你的职业法术
    .target Austil de Mon
    .xp <14,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 1766,1 >>训练 |T132219:0|t[踢]
    .target Marion Call
    .xp <12,1
    .xp >14,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 1758 >>训练你的职业法术
    .target Marion Call
    .xp <14,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 755,1 >>训练 |T136168:0|t[生命汲取]
    .target Rupert Boch
    .xp <12,1
    .xp >14,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 6222 >>训练你的职业法术
    .target Rupert Boch
    .xp <14,1
step << Mage
    #completewith next
    .goto Tirisfal Glades,61.80,65.06,20 >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
    .zoneskip Undercity
step << Mage
    #completewith next
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
step << Mage
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1882 >>交任务: |cRXP_FRIENDLY_巴尼尔农场|r
    .target Anastasia Hartwell
step << Undead Rogue
    #completewith Swordtraining2
    .goto Tirisfal Glades,61.80,65.06,20 >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Undead Rogue
    #completewith Swordtraining2
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << !Undead
    #completewith UCflightpath
    .goto Tirisfal Glades,61.80,65.06,20 >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
step << !Undead
    #completewith UCflightpath
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
step << !Undead
    #label UCflightpath
    .goto Undercity,63.25,48.56
    .fp Undercity >>获取幽暗城的飞行路径
    .target Michael Garrett
step << Undead Rogue
    .goto Undercity,83.52,69.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .turnin 1885 >>交任务: |cRXP_FRIENDLY_米奈特·卡加德|r
    .accept 1886 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
    .isOnQuest 1885
step << Rogue
    #label Swordtraining2
    .goto Undercity,57.29,32.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_阿基巴德|r在军事区交谈
    .train 201 >>学习1小时剑术
    .target Archibald
step << Rogue
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_查尔斯|r|cRXP_BUY_在盗贼区交谈. 从他那里购买|r|T135346:0|t[斗士短剑]|r
    .collect 851,1,435,1 --Collect Cutlass (1)
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Charles Seaton
step << Rogue
    #completewith Entersilverpine
    +装备 |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Undead Warrior
    #completewith Entersilverpine
    .goto Tirisfal Glades,61.80,65.06,20 >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
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
    .goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
    .money <0.3022
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Troll Warrior/Undead Warrior/Tauren Shaman/Troll Shaman/Orc Shaman
    .goto Undercity,58.82,32.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_贝尼雅|r|cRXP_BUY_交谈. 从他那里购买|r|T135154:0|t[短杖]|r
    .collect 854,1,435,1 --Collect Quarter Staff (1)
    .money <0.3022
    .target Benijah Fenner
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Troll Warrior/Undead Warrior/Tauren Shaman/Troll Shaman/Orc Shaman
    #completewith Entersilverpine
    +装备 |T135154:0|t[短杖]
    .use 854
    .itemcount 854,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step
    #optional
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
    .collect 3164,6,429,1 >>|cRXP_BUY_从拍卖行购买六|r|T134339:0|t[变色的狼心]|r
    .target Auctioneer Rhyker
    .zoneskip Undercity,1
step << Priest/Warlock
    .goto Undercity,62.47,61.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉文尼亚|r交谈
    .train 7411 >>训练 |T136244:0|t[附魔]
    .target Lavinia Crowe
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest/Warlock
    .goto Undercity,70.06,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克多|r交谈
    .train 3908 >>学习 |T136249:0|t[裁缝]
    .target Victor Ward
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest/Warlock
    .goto Undercity,70.76,30.67
    >>|cRXP_WARN_将你所有的|r|T132889:0|t[亚麻布]|cRXP_WARN_转化为|r|T132890:0|t[亚麻布卷]
    .collect 2996,30,435,1 --Bolt of Linen Cloth (30)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest/Warlock
    .goto Undercity,70.06,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克多|r交谈
    .train 7623 >>训练 |T132662:0|t[棕色亚麻长袍]
    .target Victor Ward
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest/Warlock
    .goto Undercity,70.57,30.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与米尔莉交谈|cRXP_FRIENDLY_Millie|r
    >>|cRXP_BUY_从她那里购买|r|T132891:0|t[粗线]|r
    .collect 2320,30,435,1 --Coarse Thread (30)
    .target Millie Gregorian
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest/Warlock
    >>|cRXP_WARN_制作尽可能多的|r|T132662:0|t[棕色亚麻长袍]|r
    .collect 6238,9,398,1 --Brown Linen Robe(9)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest/Warlock
    .goto Undercity,62.35,60.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Thaddeus|r|cRXP_BUY_交谈. 从他那里购买|r|T133942:0|t[铜棒] |cRXP_BUY_和|r|T135435:0|t[普通木柴] |r
    >>|cRXP_WARN_分解你制作的所有|r|T132662:0|t[棕色亚麻长袍]|cRXP_WARN_并制作一个|r|T135225:0|t[符文铜棒]
    >>|cRXP_WARN_如果你没有获得|r|T132867:0|t[次级魔法精华]|cRXP_WARN_, 请从|r|cRXP_FRIENDLY_萨德斯|r|cRXP_WARN_处购买(如果有的话). 否则, 请稍后再完成此步骤|r
    .collect 6218,1,435,1 --Runed Copper Rod (1)
    .collect 4470,1,435,1 --Simple Wood (1)
    .target Thaddeus Webb
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest/Warlock
    .goto Undercity,62.54,60.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛考布|r交谈
    .train 14293 >>训练 |T135139:0|t[次级魔法杖]
    .target Malcomb Wynn
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest/Warlock
    >>|cRXP_WARN_创建一个|r |T135139:0|t[次级魔法杖]
    >>|cRXP_WARN_如果你没有获得|r|T132867:0|t[次级魔法精华]|cRXP_WARN_, 请从|r|cRXP_FRIENDLY_萨德斯|r|cRXP_WARN_处购买(如果有的话). 否则, 请稍后再完成此步骤|r
    .collect 11287,1,435,1 --Lesser Magic Wand (1)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest/Warlock
    #completewith Entersilverpine
    +装备 |T135139:0|t[次级魔法杖]
    .use 11287
    .itemcount 11287,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step
    #optional
    .abandon 806 >>放弃黑暗风暴
    .isOnQuest 806
step
    #optional
    .abandon 408 >>放弃家族墓穴
    .isOnQuest 408
step << Warrior
    #optional
    .abandon 1821 >>放弃阿加曼德家传武器
    .isOnQuest 1821
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
    .goto Tirisfal Glades,51.10,71.53,50 >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
    .zoneskip Tirisfal Glades
step
    #label Entersilverpine
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
    .zoneskip Silverpine Forest

]])
