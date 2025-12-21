local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
#xprate <1.99
<< Horde
#version 11
#group RestedXP 联盟 1-22
#defaultfor Undead
#name 1-6 提瑞斯法林地
#displayname 1-6 提瑞斯法林地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 6-11 提瑞斯法林地

step << !Undead
    #completewith next
    +|cRXP_WARN_您选择的指南适用于亡灵种族. 建议您选择与您初始起始区域相同的区域|r
step << !Undead Mage
    #season 2
    #completewith next
    +在探索季中, 作为法师你不应该在种族起始区域之外开始游戏, 因为你将无法在这里获得你的第一个符文(|T133816:0|t[雕纹手套 - 寒冰之枪])
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
    #season 2
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
    .accept 77672 >>接受失落的符文 << Warlock
    .target +Maximillion << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .turnin 3098 >>交任务: |cRXP_FRIENDLY_雕文卷轴|r << Mage
    .accept 77671 >>接受法术研究 << Mage
    .target +Isabella << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .turnin 3097 >>交任务: |cRXP_FRIENDLY_神圣卷轴|r << Priest
    .target +Dark Cleric Duesten << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
step
    #season 0
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
step << Priest
    #season 2
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duesten|r交谈
    .turnin 77670 >>交还《亡灵冥想》
    .target Dark Cleric Duesten
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
    #optional
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
    #optional
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
    .vendor >>出售垃圾
    .target Joshua Kien
    .money >0.1
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
    #xprate <1.5
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵萨尔坦|r和|r执行官阿伦|r交谈
    .accept 3902 >>接任务: |cRXP_LOOT_捡破烂|r
    .goto Tirisfal Glades,31.61,65.62
    .target +Deathguard Saltain
    .accept 380 >>接任务: |cRXP_LOOT_夜行蜘蛛洞穴|r
    .goto Tirisfal Glades,32.15,66.01
    .target +Executor Arren
step
    #xprate >1.49
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官阿伦|r交谈
    .accept 380 >>接任务: |cRXP_LOOT_夜行蜘蛛洞穴|r
    .goto Tirisfal Glades,32.15,66.01
    .target Executor Arren
step << Rogue/Warrior
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基巴德|r交谈
    .vendor >>出售垃圾
    .target Archibald Kava
    .money >0.1
    .isOnQuest 3095 << Warrior
    .isOnQuest 3096 << Rogue
step << Warrior
    #season 2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .accept 77668 >>接受失落的符文
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Dannal Stern
    .money <0.02
 step << Warrior
    #season 2
    #label Training2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .accept 77668 >>接受失落的符文
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Dannal Stern
    .money <0.01
step << Warrior
    #season 0
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Dannal Stern
    .money <0.02
 step << Warrior
    #season 0
    #label Training2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Dannal Stern
    .money <0.01
step << Rogue
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 3096 >>交任务: |cRXP_FRIENDLY_密文卷轴|r
    .accept 77669 >>接受血色符文
    .train 53 >>训练 |T132090:0|t[背刺]
    .money <0.04
    .target David Trias
step << Rogue
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 3096 >>交任务: |cRXP_FRIENDLY_密文卷轴|r
    .accept 77669 >>接受血色符文
    .target David Trias
step << Rogue
    #season 0
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 3096 >>交任务: |cRXP_FRIENDLY_密文卷轴|r
    .train 53 >>训练 |T132090:0|t[背刺]
    .money <0.04
    .target David Trias
step << Rogue
    #season 0
    #label Training2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 3096 >>交任务: |cRXP_FRIENDLY_密文卷轴|r
    .target David Trias
step
    #xprate >1.49
    #optional
    #completewith NightWebStart
    .abandon 3902 >>放弃捡破烂任务 丧钟之谷
step
    #xprate <1.5
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
    #label NightWebStart
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
step << Warlock
    #season 2
    #completewith RuneofHaunting
    >>击杀洞穴内的|cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob Night Web Spider
step << Warrior
    #season 2
    #completewith RuneofVictoryRush
    >>击杀洞穴内的|cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob Night Web Spider
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
step
    #xprate <1.5
    #softcore
    #completewith Scavenging
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step
    #xprate >1.49
    #softcore
    #completewith NightWebH
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step << Warlock
    #softcore
    #completewith ScarletC
    .cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
step << skip
    #hardcore
    #completewith next
    .goto 1420,26.027,60.607,-1
    .goto 1420,24.508,59.360,-1
    .goto 1420,23.572,59.239,-1
    .goto Tirisfal Glades,31.08,64.88,30 >>|cRXP_WARN_在洞穴内执行登出跳过, 方法是跳到碎纸机和井口或卡在墙上的木板上, 然后登出并重新登录|r
    >>|cRXP_WARN_或者跑回丧钟镇|r
step
    #xprate <1.5
    #label Scavenging
    .goto Tirisfal Glades,31.61,65.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Saltain|r交谈
    .turnin 3902 >>交任务: |cRXP_FRIENDLY_捡破烂|r
    .target Deathguard Saltain
step << Warlock
    #season 2
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .turnin 77672 >>交还失落的符文
    .target Maximillion
step
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
step << Warrior
    #season 2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 77668 >>交还失落的符文
    .target Dannal Stern
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
    #softcore
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
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
step << Mage
    #season 2
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .turnin 77671 >>提交法术研究
    .target Isabella
    .isQuestComplete 77671
step
    #sticky
    #label ScarletC
    .goto Tirisfal Glades,32.15,66.01,0,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arren|r交谈
    .turnin 381 >>交任务: |cRXP_FRIENDLY_血色十字军|r
    .accept 382 >>接任务: |cRXP_LOOT_十字军信使|r
    .target Executor Arren
step << Rogue
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 77669 >>交还血色符文
    .target David Trias
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
#classic
#xprate <1.99
<< Horde
#name 6-11 提瑞斯法林地
#displayname 6-11 提瑞斯法林地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 11
#group RestedXP 联盟 1-22
#defaultfor Undead
#next 12-14 银松森林；12-17 贫瘠之地

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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛尔多|r交谈
    >>|cRXP_WARN_他是一个在通往布瑞尔的路上巡逻的憎恶怪物|r
    .accept 5481 >>接任务: |cRXP_LOOT_葛尔多的任务|r
    .unitscan Gordo
step << Priest
    .goto Tirisfal Glades,52.59,55.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博文·布里斯博埃斯|r交谈
    .train 3908 >>学习 |T136249:0|t[裁缝]. 收集你的 |T132889:0|t[亚麻布], 这样你以后就能制作法杖了
    .target Bowen Brisboise
step
    #softcore
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处重生, 或前往布瑞尔
    .target Spirit Healer
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
step
    #xprate >1.49
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    >>|cRXP_FRIENDLY_Gretchen|r|cRXP_WARN_在旅店二楼|r
    .accept 375 >>接任务: |cRXP_LOOT_死亡之寒|r
    .target Gretchen Dedmar
    .xp <7,1
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
    #season 0
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 1757 >>训练 |T136189:0|t[邪恶打击]
    .target Marion Call
    .money <0.01
step << Rogue
    #season 2
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 1757 >>训练 |T136189:0|t[邪恶打击]
    .train 921 >>训练 |T133644:0|t[扒窃]
    .target Marion Call
    .money <0.02
step << Rogue
    #optional
    #season 2
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 921 >>训练 |T133644:0|t[扒窃]
    .target Marion Call
    .money >0.02
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
    .train 20397 >>|cRXP_WARN_使用|r|T133738:0|t[血契法典]
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
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r <<Warrior/Rogue
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
    >>|cRXP_WARN_你需要学会低级治疗术(等级2)才能完成此任务|r
    .complete 5650,1 --Heal and fortify Deathguard Kel (1)
    .target Deathguard Kel
step
    #completewith Claws
    >>拾取地面上的|cRXP_LOOT_阴暗草|r
    .complete 5481,1 --Gloom Weed (3)
step
    #completewith GloomWeed
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
    #label GloomWeed
    #loop
    .goto Tirisfal Glades,39.55,50.64,0
    .goto Tirisfal Glades,44.43,57.33,0
    .goto Tirisfal Glades,39.55,50.64,50,0
    .goto Tirisfal Glades,44.43,57.33,50,0
    >>完成拾取地面上的|cRXP_LOOT_阴暗草|r
    .complete 5481,1 --Gloom Weed (3)
step << Warrior
    #optional
    #season 2
    #xprate >1.49
    #completewith DBlood
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
    .isOnQuest 375
step
    #optional
    #xprate >1.49
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .isOnQuest 375
step
    #xprate >1.49
    #label DBlood
    #loop
    .goto Tirisfal Glades,43.97,57.27,0
    .goto Tirisfal Glades,40.57,47.23,0
    .goto Tirisfal Glades,48.03,53.43,80,0
    .goto Tirisfal Glades,43.97,57.27,80,0
    .goto Tirisfal Glades,41.01,55.94,60,0
    .goto Tirisfal Glades,40.57,47.23,60,0
    .goto Tirisfal Glades,40.89,42.77,60,0
    .goto Tirisfal Glades,39.12,39.85,60,0
    >>击杀|cRXP_ENEMY_Darkhounds|r. 击败它们以获取其|cRXP_LOOT_Blood|r
    .complete 367,1 --Darkhound Blood (5)
    .mob Decrepit Darkhound
    .mob Cursed Darkhound
step << Priest
    #ah
    #completewith FinishRings
    >>|cRXP_WARN_开始收集 3 堆|r|T132889:0|t[亚麻布]|cRXP_WARN_. 这将用于制作|r|T135139:0|t[次级魔法杖]|cRXP_WARN_稍后|r
    >>|cRXP_WARN_如果你不想这么做, 或者更希望稍后从拍卖行购买, 请跳过此步骤|r
    .collect 2589,60 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #ssf
    #completewith FinishRings
    >>|cRXP_WARN_开始收集 3 堆|r|T132889:0|t[亚麻布]|cRXP_WARN_. 这将用于制作|r|T135139:0|t[次级魔法杖]|cRXP_WARN_稍后|r
    .collect 2589,60 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Rogue
    #season 2
    #completewith next
    >>使用 |T133644:0|t[盗贼技能:扒窃] 并击杀 |cRXP_ENEMY_提瑞斯法农夫|r和 |cRXP_ENEMY_提瑞斯法雇农|r. 从他们身上搜刮出 |T134327:0|t[|cRXP_LOOT_左上角地图碎片|r]
    .collect 208036,1 --Top-Left Map Piece (1)
    .mob Tirisfal Farmer
    .mob Tirisfal Farmhand
    .train 400095,1
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
step << Rogue
    #season 2
    #loop
    .goto Tirisfal Glades,36.63,50.09,0
    .goto Tirisfal Glades,37.20,52.17,50,0
    .goto Tirisfal Glades,36.64,50.09,50,0
    .goto Tirisfal Glades,36.10,49.07,50,0
    .goto Tirisfal Glades,35.08,49.82,50,0
    .goto Tirisfal Glades,35.30,50.91,50,0
    .goto Tirisfal Glades,34.57,51.58,50,0
    .goto Tirisfal Glades,36.63,50.09,50,0
    >>使用 |T133644:0|t[盗贼技能:扒窃] 并击杀 |cRXP_ENEMY_提瑞斯法农夫|r和 |cRXP_ENEMY_提瑞斯法雇农|r. 从他们身上搜刮出 |T134327:0|t[|cRXP_LOOT_左上角地图碎片|r]
    .collect 208036,1 --Top-Left Map Piece (1)
    .mob Tirisfal Farmer
    .mob Tirisfal Farmhand
    .train 400095,1
step << Rogue/Mage/Priest
    #season 2
    #completewith next
    >>使用|T133644:0|t[劫掠]技能并击杀|cRXP_ENEMY_血色战士|r. 击杀后搜刮出|T134327:0|t[|cRXP_LOOT_右上角地图碎片|r] << Rogue
    >>击杀|cRXP_ENEMY_血色战士|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_法术注释:MILEGIN VALF|r] << Mage
    >>击杀|cRXP_ENEMY_血色战士|r. 击杀后搜刮出 |T135975:0|t[|cRXP_FRIENDLY_被亵渎的堡垒预言|r] << Priest
    >>|cRXP_WARN_提瑞斯法林地的任意血色人类生物都有可能掉落地图碎片|r << Rogue
    >>|cRXP_WARN_提瑞斯法的任意血色人类生物都有可能掉落法术笔记|r << Mage
    >>|cRXP_WARN_提瑞斯法的任何血色人类生物都有可能掉落预言|r << Priest
    .collect 208035,1 << Rogue --Top-Right Map Piece (1)
    .collect 203752,1 << Mage --Spell Notes: MILEGIN VALF (1)
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel (1)
    .mob Scarlet Warrior
    .train 400095,1 << Rogue
    .train 401768,1 << Mage
    .train 402852,1 << Priest
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
step << Rogue/Mage/Priest
    #season 2
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
    >>使用|T133644:0|t[劫掠]技能并击杀|cRXP_ENEMY_血色战士|r. 击杀后搜刮出|T134327:0|t[|cRXP_LOOT_右上角地图碎片|r] << Rogue
    >>击杀|cRXP_ENEMY_血色战士|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_法术注释:MILEGIN VALF|r] << Mage
    >>击杀|cRXP_ENEMY_血色战士|r. 击杀后搜刮出 |T135975:0|t[|cRXP_FRIENDLY_被亵渎的堡垒预言|r] << Priest
    >>|cRXP_WARN_提瑞斯法林地的任意血色人类生物都有可能掉落地图碎片|r << Rogue
    >>|cRXP_WARN_提瑞斯法的任意血色人类生物都有可能掉落法术笔记|r << Mage
    >>|cRXP_WARN_提瑞斯法的任何血色人类生物都有可能掉落预言|r << Priest
    .collect 208035,1 << Rogue --Top-Right Map Piece (1)
    .collect 203752,1 << Mage --Spell Notes: MILEGIN VALF (1)
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel (1)
    .mob Scarlet Warrior
    .train 400095,1 << Rogue
    .train 401768,1 << Mage
    .train 402852,1 << Priest
step << Mage
    #season 2
    .collect 211779,1 >>你需要从|cRXP_FRIENDLY_试剂商|r处获得一个|T135933:0|t[理解之魅]才能使用该物品
    .train 401768 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术备注:米尔金·瓦尔夫|r]|cRXP_WARN_学习|r|T135820:0|t[炽焰]
    .use 203752
    .itemcount 203752,1
step << Mage/Priest
    #season 2
    .goto Tirisfal Glades,25.6,48.2
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: RING SEFF OSTROF|r] << Mage
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出物品:|T136222:0|t[|cRXP_FRIENDLY_黑暗意图的记忆|r] << Priest
    >>|cRXP_WARN_这是一个7级精英, 不容易击杀. 如果太难, 现在可以跳过他|r
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 205940,1 << Priest --Memory of Dark Purpose (1)
    .mob Gillgar
    .train 401765,1 << Mage
    .train 425216,1 << Priest
step << Mage
    #season 2
    .collect 211779,1 >>你需要从|cRXP_FRIENDLY_试剂商|r处获得一个|T135933:0|t[理解之魅]才能使用该物品
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_ 法术说明:RING SEFF OSTROF|r] |cRXP_WARN_来学习|r |T236227:0|t[冰霜之指]
    .use 203753
    .itemcount 203753,1
step
    #hardcore
    #completewith BrillTurnin1
    .hs >>传送回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,>0,1
step
    #hardcore
    #completewith BrillTurnin1
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,<0
step
    #softcore
    #completewith BrillTurnin1
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处重生
step
    #softcore
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Holland|r交谈, 他在墓地附近巡逻
    .turnin 5481 >>交任务: |cRXP_FRIENDLY_葛尔多的任务|r
    .accept 5482 >>接任务: |cRXP_LOOT_末日草|r
    .target Junior Apothecary Holland
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r和|cRXP_FRIENDLY_Johaan|r和|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 404 >>交任务: |cRXP_FRIENDLY_腐烂的爪子|r
    .accept 426 >>接任务: |cRXP_LOOT_磨坊告急|r
    .target +Deathguard Dillinger
    .goto Tirisfal Glades,58.20,51.43
    .turnin 367 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .turnin 365 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .accept 368 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .accept 407 >>接任务: |cRXP_LOOT_悲伤之地|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 427 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 370 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .isQuestComplete 367
step
    #label BrillTurnin1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r和|cRXP_FRIENDLY_Johaan|r和|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 404 >>交任务: |cRXP_FRIENDLY_腐烂的爪子|r
    .accept 426 >>接任务: |cRXP_LOOT_磨坊告急|r
    .target +Deathguard Dillinger
    .goto Tirisfal Glades,58.20,51.43
    .turnin 365 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .accept 407 >>接任务: |cRXP_LOOT_悲伤之地|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 427 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 370 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
 step
    #xprate >1.49
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate >1.49
    .goto Tirisfal Glades,61.97,51.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店后方楼下被俘虏的血色十字军俘虏交谈|cRXP_FRIENDLY_血色十字军俘虏|r
    .turnin 407 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .target Captured Scarlet Zealot
step
    #xprate >1.49
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
    .turnin 5650 >>交任务: |cRXP_FRIENDLY_黑暗之衣|r
    .train 591 >>训练 |T135924:0|t[惩戒]
    .train 17 >>训练 |T135940:0|t[真言术:盾]
    .target Dark Cleric Beryl
step
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    >>|cRXP_FRIENDLY_Gretchen|r|cRXP_WARN_在旅店二楼|r
    .accept 375 >>接任务: |cRXP_LOOT_死亡之寒|r
    .target Gretchen Dedmar
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 139 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <8,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 205 >>训练你的职业法术
    .target Cain Firesong
    .xp <8,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 284 >>训练你的职业法术
    .target Austil de Mon
    .xp <8,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 6760 >>训练你的职业法术
    .target Marion Call
    .xp <8,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 980 >>训练你的职业法术
    .target Rupert Boch
    .xp <8,1
step << Rogue/Warrior
    .goto Tirisfal Glades,61.81,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_妮拉|r交谈
    >>|cRXP_WARN_试着在等待期间(比如等齐柏林飞艇时)完成这些任务|r
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Nurse Neela
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
    .collect 2494,1,367,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith NewPlague1
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
    .collect 2488,1,367,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #completewith NewPlague1
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step
    #hardcore
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Holland|r交谈, 他在墓地附近巡逻
    .turnin 5481 >>交任务: |cRXP_FRIENDLY_葛尔多的任务|r
    .accept 5482 >>接任务: |cRXP_LOOT_末日草|r
    .target Junior Apothecary Holland
step << Warrior
    #season 2
    #xprate <1.5
    #completewith DuskbatTrophy1
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #xprate <1.5
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #xprate <1.5
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    >>击杀 |cRXP_ENEMY_Darkhounds|r. 击败它们获取 |cRXP_LOOT_Blood|r
    .complete 367,1 --Darkhound Blood (5)
    .mob Decrepit Darkhound
step << Rogue/Warrior
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .xp >7+3960,1
step << Rogue/Warrior
    #xprate <1.5
    #optional
    #label DuskbatTrophy1
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .xp 7+3260 >>升级至3260/4500
--XX 700 (375)+540(367)
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .xp >7+3690,1
step
    #xprate >1.49
    #label DuskbatTrophy1
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .xp 7+2640 >>升级至2640/4500
--XX 700 (375)+540(367)
step
    #xprate <1.5
    #hardcore
    #completewith NewPlague1
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
step
    #xprate <1.5
    #softcore
    #completewith NewPlague1
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #label NewPlague1
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 367 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 368 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target Apothecary Johaan
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
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step << Priest
    #xprate <1.5
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 139 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <8,1
step << Mage
    #xprate <1.5
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 205 >>训练你的职业法术
    .target Cain Firesong
    .xp <8,1
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 284 >>训练你的职业法术
    .target Austil de Mon
    .xp <8,1
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 6760 >>训练你的职业法术
    .target Marion Call
    .xp <8,1
step << Warlock
    #xprate <1.5
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 980 >>训练你的职业法术
    .target Rupe
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T135641:0|t[卷刃的剑] (4s 01c) 的钱. 如果不够, 稍后再回来处理
    .target Oliver Dwor
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Oliver|r|cRXP_BUY_交谈. 从他那里购买|r |T135641:0|t[卷刃的剑] |r
    .collect 2494,1,398,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.5
    #completewith Doomweed
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >>出售垃圾, 如果钱够买一把 |T135321:0|t[步兵剑](5银36铜), 就直接购买. 如果钱不够, 稍后再来
    .target Oliver Dwor
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈. 从他那里购买|r|T135321:0|t[步兵剑]|r
    .collect 2488,1,398,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #xprate <1.5
    #completewith Doomweed
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Rogue
    #season 2
    #completewith MaggotEye
    >>使用[窃取]并击杀腐皮豺狼人. 掠夺他们以获得 [|cRXP_LOOT_左下角地图碎片|r]
    .collect 208038,1 --Bottom-Left Map Piece (1)
    .mob Rot Hide Mongrel
    .mob Rote Hide Gnoll
    .mob Rot Hide Graverobber
    .train 400095,1
step << Warrior
    #season 2
    #completewith MaggotEye
    >>击杀任意类型的|cRXP_ENEMY_Rote Hide Gnoll|r, 击败后拾取其掉落的|cRXP_LOOT_Severed Gnoll Head|r
    .collect 204478,1 --Severed Gnoll Head (1)
    .mob Rot Hide Mongrel
    .mob Rote Hide Gnoll
    .mob Rot Hide Graverobber
    .train 403475,1
step
    #completewith next
    >>拾取地面上的|cRXP_LOOT_末日草|r
    >>|cRXP_WARN_它们出现在豺狼人地区靠近树木的地方|r
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482
step
    #loop
    .goto Tirisfal Glades,55.24,42.54,0
    .goto Tirisfal Glades,56.31,39.67,40,0
    .goto Tirisfal Glades,54.71,41.19,40,0
    .goto Tirisfal Glades,53.90,43.93,40,0
    .goto Tirisfal Glades,55.24,42.54,40,0
    .goto Tirisfal Glades,56.43,43.92,40,0
    >>击杀|cRXP_ENEMY_腐皮盗墓贼|r. 从他们身上搜刮|cRXP_LOOT_秽液|r
    .complete 358,1 --Rot Hide Graverobber (8)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob Rot Hide Graverobber
step
    #completewith next
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r. 击败他们后搜刮其掉落的|cRXP_LOOT_Ichor|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob Rot Hide Mongrel
step
    #label Doomweed
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
    >>拾取地面上的|cRXP_LOOT_末日草|r
    >>|cRXP_WARN_它们出现在豺狼人地区靠近树木的地方|r
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482
step << Mage
    #season 2
    #optional
    #completewith MaggotEye
    .goto Tirisfal Glades,59.84,33.17,0
    .goto Tirisfal Glades,58.38,35.28,0
    .goto Tirisfal Glades,60.09,37.01,0
    >>对|cRXP_ENEMY_Odd Melons|r施放 |T136071:0|t[变形术]
    >>拾取地面上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob Odd Melon
    .train 415942,1
    .train 118,3
step
    #completewith MaggotEye
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r. 击败他们后搜刮其掉落的|cRXP_LOOT_Ichor|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob Rot Hide Mongrel
step
    #label MaggotEye
    .goto Tirisfal Glades,58.66,30.77
    >>击杀|cRXP_ENEMY_蛆眼|r. 击败后搜刮他的|cRXP_LOOT_爪|r
    .complete 398,1 --Maggot Eye's Paw (1)
    .mob Maggot Eye
step
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r. 击败他们后搜刮其掉落的|cRXP_LOOT_Ichor|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob Rot Hide Mongrel
step
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀|cRXP_ENEMY_腐皮豺狼人|r. 击杀后搜刮其掉落的|cRXP_LOOT_污秽之液|r
    .complete 358,3 --Embalming Ichor (8)
    .mob Rot Hide Mongrel
    .mob Rote Hide Gnoll
    .mob Rot Hide Graverobber
step << Rogue
    #season 2
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>使用[窃取]并击杀腐皮豺狼人. 掠夺他们以获得 [|cRXP_LOOT_左下角地图碎片|r]
    .collect 208038,1 --Bottom-Left Map Piece (1)
    .mob Rot Hide Mongrel
    .mob Rot Hide Graverobber
    .mob Rot Hide Gnoll
    .train 400095,1
step << Warrior
    #season 2
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀任意类型的|cRXP_ENEMY_Rote Hide Gnoll|r, 击败后拾取其掉落的|cRXP_LOOT_Severed Gnoll Head|r
    .collect 204478,1 --Severed Gnoll Head (1)
    .mob Rot Hide Mongrel
    .mob Rote Hide Gnoll
    .mob Rot Hide Graverobber
    .train 403475,1
step << Warrior
    #season 2
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
    >>击杀|cRXP_ENEMY_Vile Vin Murlocs|r. 击败后可获得他们的|cRXP_LOOT_Scales|r和|cRXP_LOOT_Severed Murloc Head|r
    .complete 368,1 --Vile Fin Scale (5)
    .collect 204477,1 --Severed Murloc Head (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 403475,1
step << Rogue
    #season 2
    #completewith MurlocVins
    >>使用 |T133644:0|t[扒窃]并击杀|cRXP_ENEMY_邪鳍鱼人|r, 以获得 |T134241:0|t[|cRXP_LOOT_沉船宝箱钥匙|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .train 400081,1
step << Rogue
    #season 2
    #completewith RuneofPrecision
    >>施放 |T133644:0|t[扒窃] 并击杀|cRXP_ENEMY_Vile Vin Murlocs|r. 掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_右下角地图碎片|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .train 400095,1
step
    #label MurlocVins
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
    >>击杀|cRXP_ENEMY_Vile Vin Murlocs|r. 击败他们后搜刮其|cRXP_LOOT_Scales|r
    .complete 368,1 --Vile Fin Scale (5)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
step << Rogue
    #season 2
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
    >>使用 |T133644:0|t[扒窃]并击杀|cRXP_ENEMY_邪鳍鱼人|r, 以获得 |T134241:0|t[|cRXP_LOOT_沉船宝箱钥匙|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 400081,1
step << Rogue
    #season 2
    .goto Tirisfal Glades,66.66,24.41
    >>掠夺|cRXP_PICK_沉船宝箱|r以获得 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step << Rogue
    #season 2
    #label RuneofPrecision
    .train 400081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_来训练|r|T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
step << Rogue
    #season 2
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
    >>施放 |T133644:0|t[扒窃] 并击杀|cRXP_ENEMY_Vile Vin Murlocs|r. 掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_右下角地图碎片|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 400095,1
step << Rogue
    #season 2
    .use 208036 >>|cRXP_WARN_使用|r|T134327:0|t[|cRXP_LOOT_地图碎片|r]|cRXP_WARN_合成|r|T134269:0|t[|cRXP_LOOT_提瑞斯法藏宝图|r]
    .collect 208034,1 --Tirisfal Treasure Map (1)
    .train 400095,1
step
    #hardcore
    #completewith Brill3
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
step
    #softcore
    #completewith Brill3
    .goto Tirisfal Glades,64.50,29.41
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    >>|cRXP_WARN_确保你死亡的位置在(或位于)前往箭头的西边|r
step << skip
    #label DoomedWeed
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Holland|r交谈, 他在墓地附近巡逻
    .turnin 5482 >>交任务: |cRXP_FRIENDLY_末日草|r
    .target Junior Apothecary Holland
step << Rogue
    #season 2
    .goto Tirisfal Glades,52.89,54.03
    .use 208034 >>|cRXP_WARN_使用|r |T134269:0|t[|cRXP_LOOT_提瑞斯法藏宝图|r] |cRXP_WARN_桥下|r
    >>拾取生成的|cRXP_PICK_Buried Treasure|r宝箱, 该宝箱会掉落 |T134419:0|t[|cRXP_FRIENDLY_Rune of Quick Draw|r]
    .collect 203991,1 --Rune of Quick Draw (1s)
    .train 400095,1
step << Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_迅捷拔枪符文|r]|cRXP_WARN_来训练|r|T134536:0|t[迅捷拔枪]
    .use 203991
    .itemcount 203991,1
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r和|cRXP_FRIENDLY_齐甘德|r和|cRXP_FRIENDLY_-塞弗伦|r交谈
    .turnin 368 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 369 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 398 >>交任务: |cRXP_FRIENDLY_悬赏：蛆眼|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .turnin 358 >>交任务: |cRXP_FRIENDLY_盗墓贼|r
    .accept 405 >>接任务: |cRXP_LOOT_流浪的巫妖|r
    .accept 359 >>接任务: |cRXP_LOOT_亡灵卫兵的职责|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
step
    #xprate >1.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r和|cRXP_FRIENDLY_齐甘德|r和|cRXP_FRIENDLY_-塞弗伦|r交谈
    .turnin 368 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 369 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 398 >>交任务: |cRXP_FRIENDLY_悬赏：蛆眼|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .turnin 358 >>交任务: |cRXP_FRIENDLY_盗墓贼|r
    .accept 405 >>接任务: |cRXP_LOOT_流浪的巫妖|r << Mage/Warlock
    .accept 359 >>接任务: |cRXP_LOOT_亡灵卫兵的职责|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
step
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔曼|r交谈
    .accept 354 >>接任务: |cRXP_LOOT_阿加曼德家族|r
    .accept 362 >>接任务: |cRXP_LOOT_闹鬼的磨坊|r
    .target Coleman Farthing
step << !Mage !Warlock
    #xprate >1.49
    #optional
    #completewith AgamandStart
    .abandon 405 >>放弃流浪的巫妖
step
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 139 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <8,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 205 >>训练你的职业法术
    .target Cain Firesong
    .xp <8,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 284 >>训练你的职业法术
    .target Austil de Mon
    .xp <8,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 6760 >>训练你的职业法术
    .target Marion Call
    .xp <8,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 980 >>训练你的职业法术
    .target Rupert Boch
    .xp <8,1
step << Rogue/Warrior
    .goto Tirisfal Glades,61.81,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_妮拉|r交谈
    >>|cRXP_WARN_试着在等待期间(比如等齐柏林飞艇时)完成这些任务|r
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Nurse Neela
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
    .collect 2494,1,354,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith MillsOverun
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
    .collect 2488,1,354,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #completewith MillsOverun
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Priest
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_从她那里|r << Warlock
    .vendor >>出售垃圾
    .collect 1179,20,426,1 << Mage/Priest --Ice Cold Milk (20)
    .collect 4605,20,426,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,10,426,1 << Warlock --Ice Cold Milk (10)
    .collect 4605,10,426,1 << Warlock --Red-speckled Mushroom (10)
    .money <0.025 << Warrior/Rogue
    .money <0.0375 << Mage/Priest/Warlock
    .target Innkeeper Renee
step << Rogue/Warrior
    #softcore
    .goto Tirisfal Glades,60.31,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莉莎·考伦|r交谈
    .vendor >>修复你的武器
    .target Eliza Callen
step << Warrior
    #season 2
    #completewith AgamandStart
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #loop
    .goto Tirisfal Glades,41.09,47.59,0
    .goto Tirisfal Glades,51.31,50.01,60,0
    .goto Tirisfal Glades,46.01,51.59,60,0
    .goto Tirisfal Glades,41.09,47.59,60,0
    .goto Tirisfal Glades,41.45,41.62,60,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #label AgamandStart
    .goto Tirisfal Glades,47.60,44.03,100,0
    .goto Tirisfal Glades,47.37,43.71
    .subzone 157 >>前往阿加曼德磨坊(向北/西方向)
    .isOnQuest 362
step
    #completewith ThurmanGregor
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
    #label MillsOverun
    #loop
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
    #xprate <1.5
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    >>击杀|cRXP_ENEMY_Soldiers|r和|cRXP_ENEMY_Bonecasters|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_LOOT_瑟曼的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >>接任务: |cRXP_LOOT_未寄出的信件|r
    .use 2839
    .mob Rattlecage Soldier
    .mob Darkeye Bonecaster
    .mob Cracked Skull Soldier
    .xp >9+3620,1
    .isOnQuest 375
--XX 880(426)+480(361, 可选)+880(354)+420(362)+700(375, 可选)
step
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    >>击杀|cRXP_ENEMY_Soldiers|r和|cRXP_ENEMY_Bonecasters|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_LOOT_瑟曼的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >>接任务: |cRXP_LOOT_未寄出的信件|r
    .use 2839
    .mob Rattlecage Soldier
    .mob Darkeye Bonecaster
    .mob Cracked Skull Soldier
    .xp >9+4320,1
    .isQuestTurnedIn 375
--XX 880(426)+480(361, 可选)+880(354)+420(362)+700(375, 可选)
step
    #xprate >1.49
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    >>击杀|cRXP_ENEMY_Soldiers|r和|cRXP_ENEMY_Bonecasters|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_LOOT_瑟曼的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >>接任务: |cRXP_LOOT_未寄出的信件|r
    .use 2839
    .mob Rattlecage Soldier
    .mob Darkeye Bonecaster
    .mob Cracked Skull Soldier
    .xp >9+2180,1
    .isOnQuest 375
--XX 880(426)+480(361, 可选)+880(354)+420(362)+700(375, 可选)
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    >>击杀|cRXP_ENEMY_Soldiers|r和|cRXP_ENEMY_Bonecasters|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_LOOT_瑟曼的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >>接任务: |cRXP_LOOT_未寄出的信件|r
    .use 2839
    .mob Rattlecage Soldier
    .mob Darkeye Bonecaster
    .mob Cracked Skull Soldier
    .xp >9+3230,1
    .isQuestTurnedIn 375
--XX 880(426)+480(361, 可选)+880(354)+420(362)+700(375, 可选)
step
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+3620 >>升级至3620+/6500经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isOnQuest 375
step
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+4320 >>升级至4320+/6500经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isQuestTurnedIn 375
step
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+3840 >>升级至3840+/6500经验值
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isQuestTurnedIn 375
step
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+3140 >>升级至3140/6500经验值
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isOnQuest 375
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+2180 >>升级至2180+/6500经验
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isOnQuest 375
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+3230 >>升级至3230+/6500经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isQuestTurnedIn 375
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+2510 >>升级至2510/6500经验值
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isQuestTurnedIn 375
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .xp 9+1460 >>升级至1460/6500经验
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isOnQuest 375
step << Mage/Priest
    #season 2
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: RING SEFF OSTROF|r] << Mage
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出物品:|T136222:0|t[|cRXP_FRIENDLY_黑暗意图的记忆|r] << Priest
    >>|cRXP_WARN_这是一个7级精英, 不容易击杀. 如果太难, 现在可以跳过他|r
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 205940,1 << Priest --Memory of Dark Purpose (1)
    .mob Gillgar
    .train 401765,1 << Mage
    .train 425216,1 << Priest
step << Mage
    #season 2
    .collect 211779,1 >>你需要从|cRXP_FRIENDLY_试剂商|r处获得一个|T135933:0|t[理解之魅]才能使用该物品
    .train 401765 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_ 法术说明:RING SEFF OSTROF|r]|cRXP_WARN_来学习|r|T236227:0|t[冰霜之指]
    .use 203753
    .itemcount 203753,1
step
    #hardcore
    #completewith FoodandWater2
    .subzone 159 >>返回布瑞尔
step
    #softcore
    #completewith FoodandWater2
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    .goto Tirisfal Glades,58.20,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 426 >>交任务: |cRXP_FRIENDLY_磨坊告急|r
    .target Deathguard Dillinger
step
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊维特|r和|cRXP_FRIENDLY_科尔曼|r交谈
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
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .target Coleman Farthing
step
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.trainer >>训练你的职业法术
    .target Dark Cleric Beryl
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
    .trainer >>训练你的职业法术
    .accept 1818 >>接任务: |cRXP_LOOT_迪林格尔|r
    .target Austil de Mon << Warrior
    .isQuestAvailable 1498
step << Warlock
    .goto Tirisfal Glades,61.62,52.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内|cRXP_FRIENDLY_Ageron|r交谈
    .accept 1478 >>接任务: |cRXP_LOOT_哈加尔的召唤|r
    .target Ageron Kargal
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 707 >>训练你的职业法术
    .target Rupert Boch
step << Rogue
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的人类|cRXP_FRIENDLY_Marion|r交谈
    .trainer >>训练你的职业法术
    .accept 1885 >>接任务: |cRXP_LOOT_米奈特·卡加德|r
    .target Marion Call
step << Mage
    .goto Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_Cain|r交谈
    .accept 1881 >>接任务: |cRXP_LOOT_安娜斯塔西娅|r
    .target Cain Firesong
step
    #label FoodandWater2
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Priest/Shaman
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_从她那里|r << Warlock
    .vendor >>出售垃圾
    .collect 1179,20,370,1 << Mage/Priest/Shaman --Ice Cold Milk (20)
    .collect 4605,20,370,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,370,1 << Warlock --Ice Cold Milk (15)
    .collect 4605,15,370,1 << Warlock --Red-speckled Mushroom (15)
    .money <0.075 << Warlock
    .money <0.05 << !Warlock
    .target Innkeeper Renee
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
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 1819 >>交任务: |cRXP_FRIENDLY_切割者奥拉格|r
    .accept 1820 >>接任务: |cRXP_LOOT_库勒曼|r
    .target Deathguard Dillinger
step << Warlock
    #completewith next
    .goto Tirisfal Glades,61.80,65.06,20 >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
step << Warlock
    #completewith next
    .goto Undercity,66.09,20.06,35,0
    .goto Undercity,64.37,23.94,35,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
step << Warlock
    #xprate <1.5
    .goto Undercity,67.74,37.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺曼|r交谈
    .home >>将你的[炉石]设置为幽暗城
    .target Innkeeper Norman
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_Carendin|r交谈
    .turnin 1478 >>交任务: |cRXP_FRIENDLY_哈加尔的召唤|r
    .accept 1473 >>接任务: |cRXP_LOOT_虚空中的生物|r
step << Warlock
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
step << Rogue
    #season 2
    #completewith ScarletCrusade1
    >>对|cRXP_ENEMY_派瑞恩队长|r 使用 |T133644:0|t[扒窃], 可获得 |T133385:0|t[|cRXP_LOOT_猩红副官指环|r ]
    .collect 208085,1 --Scarlet Lieutenant Signet Ring (1)
    .mob Captain Perrine
    .train 400094,1
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
step << Rogue
    #season 2
    .goto Tirisfal Glades,51.17,67.81
    >>对|cRXP_ENEMY_派瑞恩队长|r 使用 |T133644:0|t[扒窃], 可获得 |T133385:0|t[|cRXP_LOOT_猩红副官指环|r ]
    .collect 208085,1 --Scarlet Lieutenant Signet Ring (1)
    .mob Captain Perrine
    .train 400094,1
step << Warlock
    .goto Tirisfal Glades,51.06,67.57
    >>搜刮地面上的派瑞恩的箱子, 获得|T133733:0|t[Egalin的法典]
    .complete 1473,1 --Egalin's Grimoire (1)
step
    #xprate <1.5
    #completewith UCHome
    .goto Undercity,16.51,42.76,35,0
    .goto Undercity,22.98,39.76,35,0
    .goto Undercity,24.93,32.54,35,0
    .goto Undercity,34.78,33.24,10,0
    .goto Undercity,40.83,34.08,10,0
    .goto Undercity,41.35,38.40,10,0
    .goto Undercity,45.25,39.20,10,0
    .goto Undercity,45.67,43.60,10,0
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
step
    #xprate >1.49
    #ah << Priest
    #completewith LogoutSkip1
    .goto Undercity,16.51,42.76,35,0
    .goto Undercity,22.98,39.76,35,0
    .goto Undercity,24.93,32.54,35,0
    .goto Undercity,34.78,33.24,10,0
    .goto Undercity,40.83,34.08,10,0
    .goto Undercity,41.35,38.40,10,0
    .goto Undercity,45.25,39.20,10,0
    .goto Undercity,45.67,43.60,10,0
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
--XX Priest skips on 1.5x unless they go for a Wand. No reason to go Undercity if skipping Lich quest and not setting hearth
step << Rogue
    .goto Undercity,57.29,32.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与军事区的|r|cRXP_FRIENDLY_阿基巴德|r交谈
    .train 201 >>学习1小时剑术
    .target Archibald
step << Warrior/Rogue
    .goto Undercity,56.06,37.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗姆|r交谈
    .train 2575 >>训练 |T136248:0|t[采矿]
    >>|cRXP_WARN_这将使您能够找到|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_从矿点获取, 用于制作|r|T135248:0|t[磨砺石] |cRXP_WARN_(持续30分钟, 增加武器伤害+2)|r
    .target Brom Killian
step << Warrior/Rogue
    .goto Undercity,56.72,36.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与莎拉(|cRXP_FRIENDLY_Sarah|r)交谈
    >>|cRXP_BUY_从|r|cRXP_FRIENDLY_Sarah|cRXP_BUY_购买|r|T134708:0|t[矿工锄]|r
    .collect 2901,1,371,1 --Mining Pick (1)
    .target Sarah Killian
    .train 2575,3 --Mining Trained
 step << Warrior/Rogue
    .goto Undercity,60.17,29.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴兹尔·弗莱伊|r交谈
    .train 2018 >>训练 |T136241:0|t[锻造]
    .target Basil Frye
    .train 2575,3 --Mining Trained
step
    #xprate >1.49
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
    >>|cRXP_BUY_从拍卖行购买 6|r|T134339:0|t[变色的狼心]|r
    >>|cRXP_BUY_从拍卖行购买|r|T135139:0|t[次级魔法杖] |r << Priest
    >>|cRXP_BUY_如果你愿意, 可以从拍卖行购买|r|T135139:0|t[次级魔法杖]|r << Mage/Warlock
    >>|cRXP_WARN_如果你这样做并且之前已经收集了|r|T132889:0|t[亚麻布]|cRXP_WARN_, 你可以将你的|r|T132889:0|t[亚麻布]|cRXP_WARN_在拍卖行出售|r << Priest
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    .collect 3164,6,429,1 --Discolored Worg Heart (6)
    .collect 11287,1,435,1 << Priest/Mage/Warlock --Lesser Magic Wand (1)
    .target Auctioneer Rhyker
    .itemStat 18,QUALITY,<7 << Priest/Mage/Warlock
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3 << Priest/Mage/Warlock
--XX Intentional for priests on 1.5x xp to only do this if they don't have a lesser magic wand
step << !Priest
    #xprate >1.49
    #ah
    #optional
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
    >>|cRXP_BUY_从拍卖行购买 6|r|T134339:0|t[变色的狼心]|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    .collect 3164,6,429,1 --Discolored Worg Heart (6)
    .target Auctioneer Rhyker
step << !Warlock
    #xprate <1.5
    #label UCHome
    .goto Undercity,67.74,37.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺曼|r交谈
    .home >>将你的[炉石]设置为幽暗城
    .target Innkeeper Norman
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_Carendin|r交谈
    .turnin 1473 >>交任务: |cRXP_FRIENDLY_虚空中的生物|r
    .accept 1471 >>接任务: |cRXP_LOOT_誓缚|r
    .target Carendin Halgar
step << Warlock
    #completewith next
    .cast 9221 >>|cRXP_WARN_使用|r|T134416:0|t[召唤符文]|cRXP_WARN_在召唤法阵|r
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
step << Warrior
    #ssf
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135350:0|t[优质重剑]|r
    .collect 1198,1,371,1 --Collect Claymore (1)
    .money <0.2676
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Charles Seaton
step << Warrior
    #ah
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135350:0|t[优质重剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 1198,1,371,1 --Collect Claymore (1)
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Charles Seaton
step << Warrior
    #optional
    #completewith LogoutSkip1
    +装备 |T135350:0|t[优质重剑]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Rogue
    #ssf
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    .collect 851,1,371,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Charles Seaton
step << Rogue
    #ah
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 851,1,371,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Charles Seaton
step << Rogue
    #optional
    #completewith LogoutSkip1
    +装备 |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    .goto Undercity,77.50,49.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_纳撒尼尔·斯蒂恩维克|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135425:0|t[锐利投掷匕首]|r
    .collect 3107,200,371,1 --Keen Throwing Knife (200)
    .target Nathaniel Steenwick
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_记得在等级达到11级时装备|r|T135425:0|t[锐利投掷匕首]|r
    .use 3107
    .itemcount 3107,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp >11,1
step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << Rogue
    .goto Undercity,83.52,69.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .turnin 1885 >>交任务: |cRXP_FRIENDLY_米奈特·卡加德|r
    .accept 1886 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
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
step
    #xprate <1.5
    .goto Undercity,84.06,17.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_Bethor|r交谈
    .turnin 405 >>交任务: |cRXP_FRIENDLY_流浪的巫妖|r
    .accept 357 >>接任务: |cRXP_LOOT_巫妖的身份|r
    .target Bethor Iceshard
step << Mage/Warlock
    #xprate >1.49
    .goto Undercity,84.06,17.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_Bethor|r交谈
    .turnin 405 >>交任务: |cRXP_FRIENDLY_流浪的巫妖|r
    .target Bethor Iceshard
step
    #optional
    #label LogoutSkip1
step << skip
    #xprate <1.5 << !Mage !Warlock
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过将角色 positioned 在最低楼梯的最高处, 直到看起来像是漂浮一样, 然后登出再重新登录, 来执行一次“登出跳过”操作|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >>|cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
step << skip -- !Mage !Warlock
    #xprate >1.49
    #ah << Priest
    .goto Undercity,61.10,54.11 << Priest
    .goto Undercity,78.03,50.36 << Warrior
    .goto Undercity,82.75,65.23 << Rogue
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到桶堆顶部来执行“登出跳过”, 然后注销并重新登录|r << Priest/Warrior
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到肉车的升级机顶部来执行登出跳过, 然后退出并重新登录|r << Rogue
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1     
step
    #xprate <1.5 << Priest
    #completewith AtWarS
    .goto Tirisfal Glades,61.92,64.85
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
step << Undead Rogue
    #sticky
    #completewith UnluckyRogue
    >>|cRXP_WARN_如果你看到|r |cRXP_FRIENDLY_Astor|r|cRXP_WARN_, 与他交谈并击杀他. 搜刮其尸体获得信件. 他在布瑞尔与瑟伯切尔之间的道路上巡逻|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan Astor Hadren
    .isOnQuest 1886
step << Mage/Warlock
    #xprate >1.49
    #completewith AtWarS
    #optional
    .abandon 357 >>放弃巫妖的身份
step
    #optional
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r交谈
    .turnin 374 >>交任务: |cRXP_FRIENDLY_死亡证明|r
    .target Deathguard Burgess
    .isQuestComplete 374
step
    #label AtWarS
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 370 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 371 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target Executor Zygand
step << Rogue
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    .use 208085 >>|cRXP_WARN_使用|r|T133385:0|t[|cRXP_LOOT_猩红中尉徽章戒指|r]|cRXP_WARN_来制作|r|T134328:0|t[|cRXP_LOOT_ forged Scarlet Memorandum|r]
    .collect 208086,1 --Forged Scarlet Memorandum (1)
    .train 400094,1
step << Rogue
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加米尔·诺瑞|r交谈以获得|T134419:0|t[|cRXP_FRIENDLY_残肢符文|r]
    .collect 203990,1 --Rune of Mutilation (1)
    .target Jamie Nore
    .skipgossip
    .train 400094,1
step << Rogue
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]|cRXP_WARN_来训练|r|T132304:0|t[撕裂]
    .use 203990
    .itemcount 203990,1
step
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人交谈|r
    >>|cRXP_BUY_从|r|cRXP_FRIENDLY_他那|cRXP_BUY_购买|r|T133634:0|t[棕色小袋]|r
    .collect 4496,1,356,1 --Small Brown Pouch (1)
    .target Mrs. Winters
    .money <0.05
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 1820 >>交任务: |cRXP_FRIENDLY_库勒曼|r
    .target Coleman Farthing
step << Warrior
    #season 2
    #completewith UnluckyRogue
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #label UnluckyRogue
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Linnea|r交谈
    .turnin 359 >>交任务: |cRXP_FRIENDLY_亡灵卫兵的职责|r
    .accept 360 >>接任务: |cRXP_LOOT_向塞弗伦回报|r
    .accept 356 >>接任务: |cRXP_LOOT_巡查后方|r
    .target Deathguard Linnea
step << Warrior
    #season 2
    #completewith ArriveBalnir
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #completewith ArriveBalnir
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #label ArriveBalnir
    .goto Tirisfal Glades,76.51,61.77
    .subzone 165 >>前往巴尔尼尔农庄
    .isOnQuest 356
step << Mage
    #season 2
    #completewith HorrorsandSpirits
    >>对|cRXP_ENEMY_Odd Melons|r施放 |T136071:0|t[变形术]
    >>拾取地面上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob Odd Melon
    .train 415942,1
    .train 118,3
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
step << Mage
    #season 2
    #loop
    .goto Tirisfal Glades,76.51,61.77,0
    .goto Tirisfal Glades,75.12,61.49,20,0
    .goto Tirisfal Glades,76.51,61.77,20,0
    .goto Tirisfal Glades,76.04,59.31,20,0
    >>对|cRXP_ENEMY_Odd Melons|r施放 |T136071:0|t[变形术]
    >>拾取地面上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob Odd Melon
    .train 415942,1
    .train 118,3
step << Mage
    #season 2
    >>|cRXP_WARN_使用|r|T134332:0|t|cRXP_LOOT_[药剂师笔记]|r|cRXP_WARN_制作|r|T134332:0|t|cRXP_LOOT_[法术笔记:启迪]|r
    .collect 203749,1 --Spell Notes: Enlightenment (1)
    .use 208183 --Apothecary Notes
    .train 415942,1
    .itemcount 208183,6
step << Mage
    #season 2
    .train 415942 >>|cRXP_WARN_使用|r|T134332:0|t|cRXP_LOOT_[法术说明:启蒙]|r|cRXP_WARN_来学习|r|T133815:0|t[雕刻宝箱 - 启蒙]
    .use 203749
    .itemcount 203749,1 --Spell Notes: Enlightenment (1)
step
    #sticky
    #label Friars
    #loop
    #optional
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
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
    >>击杀 |cRXP_ENEMY_血色苦行修士|r 和 |cRXP_ENEMY_血色狂热者|r , 从他们身上搜刮 |cRXP_LOOT_血色十字军徽记之戒|r
    .complete 371,2 --Scarlet Friar (5)
    .complete 374,1 --Scarlet Insignia Ring (10)
    .disablecheckbox
    .mob Scarlet Friar
    .mob Scarlet Zealot
    .isOnQuest 374
step
    #loop
    #sticky
    #requires Friars
    #label Friars2
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
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
    >>击杀|cRXP_ENEMY_血色苦行修士|r
    .complete 371,2 --Scarlet Friar (5)
    .mob Scarlet Friar
    .isQuestTurnedIn 374
step
    .goto Tirisfal Glades,78.82,56.14
    >>击杀塔内的瓦松队长
    .complete 371,1 --Captain Vachon (1)
    .mob Captain Vachon
step
    #xprate >1.49
    #requires Friars2
    #loop
    #label FinishRings
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
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
    >>击杀 |cRXP_ENEMY_血色苦行修士|r 和 |cRXP_ENEMY_血色狂热者|r , 从他们身上搜刮 |cRXP_LOOT_血色十字军徽记之戒|r
    .complete 374,1 --Scarlet Insignia Ring (10)
    .mob Scarlet Friar
    .mob Scarlet Zealot
    .isOnQuest 374
step << Priest
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
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
    >>|cRXP_WARN_收集 3 堆|r|T132889:0|t[亚麻布]|cRXP_WARN_, 用于制作你的初级魔杖. 这是在进入银松森林前获取足够数量的最后机会|r
    .collect 2589,60,435,1 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Warrior
    #season 2
    #completewith ViciousVenom
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #completewith ViciousVenom
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #label ViciousVenom
    #requires Friars2
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
step << Warrior
    #season 2
    #xprate >1.49
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #xprate >1.49
    #loop
    .goto Tirisfal Glades,83.59,43.84,0
    .goto Tirisfal Glades,72.33,33.01,0
    .goto Tirisfal Glades,83.59,43.84,70,0
    .goto Tirisfal Glades,80.77,46.40,70,0
    .goto Tirisfal Glades,75.86,46.02,70,0
    .goto Tirisfal Glades,73.10,40.71,70,0
    .goto Tirisfal Glades,72.33,33.01,70,0
    .goto Tirisfal Glades,68.69,34.33,70,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step << Warrior
    #season 2
    #xprate >1.49
    #loop
    .goto Tirisfal Glades,83.59,43.84,0
    .goto Tirisfal Glades,72.33,33.01,0
    .goto Tirisfal Glades,83.59,43.84,70,0
    .goto Tirisfal Glades,80.77,46.40,70,0
    .goto Tirisfal Glades,75.86,46.02,70,0
    .goto Tirisfal Glades,73.10,40.71,70,0
    .goto Tirisfal Glades,72.33,33.01,70,0
    .goto Tirisfal Glades,68.69,34.33,70,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #xprate >1.49
    .xp 11+2950 >>升级至2950+/8800经验
    .isOnQuest 374
    .isOnQuest 375
--XX 220 (369)+840 (371)+390 (360)+90 (355)+160 (407)+875 (492) = 2575 -> 3860
--XX +625(374 OPT)+ 700(375 OPT)= 3900 → 5850
--XX +625(374 可选)= 3200 → 4800
--XX +700(375 优选)= 3275 → 4910
step
    #xprate >1.49
    #optional
    .xp 11+3890 >>升级至3890+/8800经验值
    .isQuestTurnedIn 374
    .isOnQuest 375
step
    #xprate >1.49
    #optional
    .xp 11+4000 >>升级至4000+/8800经验值
    .isOnQuest 374
    .isQuestTurnedIn 375
step
    #xprate >1.49
    #optional
    .xp 11+4940 >>升级至4940+/8800经验
    .isQuestTurnedIn 374
    .isQuestTurnedIn 375
step
    #xprate >1.49
    #completewith ANewPlagueFinal
    .hs >>传送回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,>0,1
step
    #xprate >1.49
    #completewith ANewPlagueFinal
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,<0
step
    #xprate <1.5
    .goto Tirisfal Glades,67.97,42.09
    >>在布莱特沃特湖的岛上搜寻|cRXP_PICK_冈瑟尔的书籍|r, 以获得|cRXP_LOOT_巫妖的法术书|r
    .complete 357,1 --The Lich's Spellbook (1)
step
    #xprate <1.5
    #hardcore
    #completewith ANewPlagueFinal
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
step
    #xprate <1.5
    #softcore
    #completewith ANewPlagueFinal
    .goto Tirisfal Glades,66.60,44.95
    .deathskip >>在较小的岛上死亡, 并在|cRXP_FRIENDLY_灵魂医者|r处重生
step
    .goto Tirisfal Glades,59.45,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 369 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 492 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .accept 445 >>接任务: |cRXP_LOOT_给银松森林送信|r
    .target Apothecary Johaan
step << skip
    #phase 3-6
    .goto Tirisfal Glades,59.45,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 369 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 492 >>接任务: |cRXP_LOOT_新的瘟疫|r
    --.accept 445 >>接任务: |cRXP_LOOT_给银松森林送信|r
    .target Apothecary Johaan
step
    #xprate <1.5
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 371 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 372 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target Executor Zygand
step
    #xprate >1.49
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 371 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .target Executor Zygand
step
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞弗伦|r交谈
    .turnin 360 >>交任务: |cRXP_FRIENDLY_向塞弗伦回报|r
    .turnin 355 >>交任务: |cRXP_FRIENDLY_与塞弗伦交谈|r
    .target Magistrate Sevren
step
    #xprate >1.49
    #optional
    #completewith ANewPlagueFinal
    .abandon 372 >>与血色十字军的战争
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r交谈
    .turnin 374 >>交任务: |cRXP_FRIENDLY_死亡证明|r
    .target Deathguard Burgess
    .isQuestComplete 374
step
    #xprate >1.49
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r交谈
    .turnin 374 >>交任务: |cRXP_FRIENDLY_死亡证明|r
    .target Deathguard Burgess
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate >1.49
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .isQuestAvailable 375
step
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人交谈|r
    >>|cRXP_BUY_从|r|cRXP_FRIENDLY_他那|cRXP_BUY_购买|r|T133634:0|t[棕色小袋]|r
    .collect 4496,1,356,1 --Small Brown Pouch (1)
    .target Mrs. Winters
    .money <0.05
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step
    #xprate >1.49
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
	.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
    .target Innkeeper Renee
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.73,51.91
    .gossipoption 110750 >>与|cRXP_FRIENDLY_本尼|r交谈
    .target Penny Hawkins
    .train 425447,1
step
    #label ANewPlagueFinal
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店后方楼下的|cRXP_FRIENDLY_血色十字军俘虏|r和|cRXP_FRIENDLY_被俘虏的巡山人|r谈话
    .turnin 407 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .goto Tirisfal Glades,61.97,51.29
    .target +Captured Scarlet Zealot
    .turnin 492 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .goto Tirisfal Glades,61.94,51.40
    .target +Captured Mountaineer
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.72,51.72
    .gossipoption 109084 >>与|cRXP_FRIENDLY_Blueheart|r(在旅店楼下)交谈
    .target Blueheart
    .train 425447,1
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.72,51.91
    >>击杀|cRXP_ENEMY_Blueheart|r, 然后与楼上的|cRXP_FRIENDLY_本尼|r交谈
    .gossipoption 110751 >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target Netali
    .mob Blueheart
    .train 425447,1
    .skipgossip
step << Warrior
    #season 2
    .train 425447 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狂怒突袭符文|r]
    .use 204716
    .itemcount 204716,1

--XX Start of <1.5x section (undercity hs)


step
    #xprate <1.5
    #completewith UndercityLS2
    .hs >>传送至幽暗城
    .cooldown item,6948,>0,1
step
    #xprate <1.5
    #completewith UndercityLS2
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .cooldown item,6948,<0
step
    #xprate <1.5
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
    .collect 3164,6,429,1 >>|cRXP_BUY_从拍卖行购买六|r|T134339:0|t[变色的狼心]|r
    .target Auctioneer Rhyker
step << Mage
    #xprate <1.5
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1882 >>交任务: |cRXP_FRIENDLY_巴尼尔农场|r
    .target Anastasia Hartwell
step
    #optional << Rogue
    #xprate <1.5
    .goto Undercity,84.06,17.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bethor|r交谈
    .turnin 357 >>交任务: |cRXP_FRIENDLY_巫妖的身份|r
    .accept 366 >>接任务: |cRXP_LOOT_归还书籍|r
    .target Bethor Iceshard
    .isQuestComplete 1886 << Rogue
step << Rogue
    #ssf
    #xprate <1.5
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    .collect 851,1,372,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Charles Seaton
step << Rogue
    #ah
    #xprate <1.5
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 851,1,372,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Charles Seaton
step << Rogue
    #xprate <1.5
    #completewith CaptainMelrache
    +装备 |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Warrior
    #ssf
    #xprate <1.5
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135350:0|t[优质重剑]|r
    .collect 1198,1,372,1 --Collect Claymore (1)
    .money <0.2950
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Charles Seaton
step << Warrior
    #ah
    #xprate <1.5
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135350:0|t[优质重剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 1198,1,372,1 --Collect Claymore (1)
    .money <0.2950
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Charles Seaton
step << Warrior
    #xprate <1.5
    #completewith CaptainMelrache
    +装备 |T135350:0|t[优质重剑]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Rogue
    #xprate <1.5
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .turnin 1886 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .target Mennet Carkad
    .isQuestComplete 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .accept 1898 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
    .isQuestTurnedIn 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,54.84,76.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆|r交谈
    .turnin 1898 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .accept 1899 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Andron Gant
    .isQuestTurnedIn 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,55.43,76.87
    >>战利品|cRXP_PICK_安德隆的书架|r 在|cRXP_FRIENDLY_安德隆|r 背后
    .complete 1899,1 --Andron's Ledger (1)
    .isQuestTurnedIn 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,83.53,69.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .turnin 1899 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .accept 1978 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
    .isQuestTurnedIn 1886
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,58.86,78.76,40,0
    .goto Tirisfal Glades,59.75,84.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
    .turnin 1978 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .target Varimathras
    .isQuestTurnedIn 1886
step << skip --Rogue
    #xprate <1.5
    #optional
    .goto Undercity,55.22,90.88
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过将角色 positioned 在圆圈边缘, 直到看起来像是漂浮状态, 然后登出再登录, 完成一次注销跳过|r
	.link https://www.youtube.com/watch?v=jj85AXyF1XE >>|cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .isQuestTurnedIn 1886
step << Rogue
    #xprate <1.5
    .goto Undercity,84.06,17.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bethor|r交谈
    .turnin 357 >>交任务: |cRXP_FRIENDLY_巫妖的身份|r
    .accept 366 >>接任务: |cRXP_LOOT_归还书籍|r
    .target Bethor Iceshard
    .isOnQuest 1886
step << skip
    #xprate <1.5
    #label UndercityLS2
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过将角色 positioned 在最低楼梯的最高处, 直到看起来像是漂浮一样, 然后登出再重新登录, 来执行一次“登出跳过”操作|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >>|cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1
    .isOnQuest 1886 << Rogue
step
    #xprate <1.5
    #completewith next
    .goto Tirisfal Glades,61.92,64.85
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
step
    #xprate <1.5
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Linnea|r交谈
    .turnin 356 >>交任务: |cRXP_FRIENDLY_巡查后方|r
    .target Deathguard Linnea
step
    #xprate <1.5
    #label CaptainMelrache
    .goto Tirisfal Glades,79.52,25.14
    >>击杀塔中的麦拉其队长及其血色保镖, 掠夺他们的血色十字军徽记之戒
    >>|cRXP_WARN_途中刷怪|r << Warrior/Mage
    .complete 372,1 --Captain Melrache (1)
    .mob +Captain Melrache
    .complete 372,2 --Scarlet Bodyguard (2)
    .mob +Scarlet Bodyguard
    .complete 374,1 --Scarlet Insignia Ring (10)
    .disablecheckbox
step
    #xprate <1.5
    #label FinishRings
    #loop
    .goto Tirisfal Glades,79.04,28.54,0
    .goto Tirisfal Glades,79.36,26.21,40,0
    .goto Tirisfal Glades,79.04,28.54,40,0
    .goto Tirisfal Glades,78.92,31.42,40,0
    .goto Tirisfal Glades,77.89,35.49,40,0
    .goto Tirisfal Glades,78.65,36.09,40,0
    >>完成收集|cRXP_LOOT_血色十字军徽记之戒|r
    .complete 374,1 --Scarlet Insignia Ring (10)
step << Priest
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,79.04,28.54,0
    .goto Tirisfal Glades,79.36,26.21,40,0
    .goto Tirisfal Glades,79.04,28.54,40,0
    .goto Tirisfal Glades,78.92,31.42,40,0
    .goto Tirisfal Glades,77.89,35.49,40,0
    .goto Tirisfal Glades,78.65,36.09,40,0
    >>|cRXP_WARN_收集 3 堆|r|T132889:0|t[亚麻布]|cRXP_WARN_, 用于制作你的初级魔杖. 这是在进入银松森林前获取足够数量的最后机会|r
    .collect 2589,60,435,1 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Warrior
    #xprate <1.5
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #xprate <1.5
    #loop
    .goto Tirisfal Glades,72.15,33.17,0
    .goto Tirisfal Glades,73.78,32.71,50,0
    .goto Tirisfal Glades,72.15,33.17,50,0
    .goto Tirisfal Glades,70.13,34.46,50,0
    .goto Tirisfal Glades,67.29,34.92,50,0
    .goto Tirisfal Glades,66.71,37.87,50,0
    .goto Tirisfal Glades,73.78,32.71,50,0
    >>击杀 |cRXP_ENEMY_夜行蝙蝠|r. 从它们身上搜刮 |cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step << Warrior
    #xprate <1.5
    #season 2
    #loop
    .goto Tirisfal Glades,72.15,33.17,0
    .goto Tirisfal Glades,73.78,32.71,50,0
    .goto Tirisfal Glades,72.15,33.17,50,0
    .goto Tirisfal Glades,70.13,34.46,50,0
    .goto Tirisfal Glades,67.29,34.92,50,0
    .goto Tirisfal Glades,66.71,37.87,50,0
    .goto Tirisfal Glades,73.78,32.71,50,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #xprate <1.5
    .goto Tirisfal Glades,68.19,41.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gunther|r交谈
    .turnin 366 >>交任务: |cRXP_FRIENDLY_归还书籍|r
    .accept 409 >>接任务: |cRXP_LOOT_证明忠诚|r
    .target Gunther Arcanus
step
    #xprate <1.5
    #optional
    #label CandleBeckoning
    #completewith Nefara
    .goto Tirisfal Glades,68.16,42.01
    >>打开地面上的|cRXP_PICK_蜡烛箱|r, 拾取其中的|cRXP_LOOT_诱灵蜡烛|r
    .collect 3080,1,409,1 --Collect Candle of Beckoning (1)
    .isOnQuest 409
step
    #xprate <1.5
    #optional
    #requires CandleBeckoning
    #completewith next
    .goto Tirisfal Glades,66.64,44.89
    +点击|cRXP_PICK_莉莉丝的餐桌|r以召唤|cRXP_ENEMY_奈法拉|r
    .isOnQuest 409
step
    #xprate <1.5
    #label Nefara
    .goto Tirisfal Glades,66.70,45.05
    >>击杀|cRXP_ENEMY_Nefara|r
    .complete 409,1 --Lillith Nefara (1)
    .target Lillith Nefara
step
    #xprate <1.5
    .goto Tirisfal Glades,68.20,41.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gunther|r交谈
    .turnin 409 >>交任务: |cRXP_FRIENDLY_证明忠诚|r
    .accept 411 >>接任务: |cRXP_LOOT_巫妖归顺|r
    .target Gunther Arcanus
step
    #xprate <1.5
    .xp 11+4900 >>升级至4900+/8800经验值
    .isOnQuest 374
    .isOnQuest 375
--XX 220 (369)+840 (371)+390 (360)+90 (355)+160 (407)+875 (492) = 2575
--XX +625(374 OPT)+ 700(375 OPT)= 3900
--XX +625(374 选择)= 3200
--XX +700(375 选择)= 3275
--XX moved xpgate to after turnin so people don't turn in whilst grinding
step
    #xprate <1.5
    #optional
    .xp 11+5525 >>升级至5525+/8800经验值
    .isQuestTurnedIn 374
    .isOnQuest 375
step
    #xprate <1.5
    #optional
    .xp 11+5600 >>升级至5600+/8800经验值
    .isOnQuest 374
    .isQuestTurnedIn 375
step
    #xprate <1.5
    #optional
    .xp 11+6225 >>升级至6225+/8800经验值
    .isQuestTurnedIn 374
    .isQuestTurnedIn 375
step
    #xprate <1.5
    #hardcore
    #completewith CrusadewarWon
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
step
    #xprate <1.5
    #softcore
    #completewith CrusadewarWon
    .goto Tirisfal Glades,64.40,42.65
    .deathskip >>向西游泳, 被怪物杀死后在|cRXP_FRIENDLY_灵魂医者|r处重生
step
    #xprate <1.5
    #label CrusadewarWon
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 372 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .target Executor Zygand
step
    #xprate <1.5
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r交谈
    .turnin 374 >>交任务: |cRXP_FRIENDLY_死亡证明|r
    .target Deathguard Burgess
step
    #xprate <1.5
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .isQuestAvailable 375
step
    #xprate <1.5
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar

    --XX End of <1.5x section



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
step << Rogue
    #completewith Entersilverpine
    >>|cRXP_WARN_如果你看到|r |cRXP_FRIENDLY_Astor|r|cRXP_WARN_, 与他交谈并击杀他. 搜刮其尸体获得信件. 他在布瑞尔与瑟伯切尔之间的道路上巡逻|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan Astor Hadren
step
    #xprate >1.49
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Linnea|r交谈
    .turnin 356 >>交任务: |cRXP_FRIENDLY_巡查后方|r
    .target Deathguard Linnea

--XX Optional Undercity Section Start: If Priest needs wand, Rogue/Warrior needs vendor wep



step << Priest/Rogue/Warrior
    #optional
    #completewith LesserMagicWand << Priest
    #completewith RogueCutlass << Rogue
    #completewith WarriorClaymore << Warrior
    .goto Tirisfal Glades,61.80,65.06,20 >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
step << Priest/Rogue/Warrior
    #optional
    #completewith LesserMagicWand << Priest
    #completewith RogueCutlass << Rogue
    #completewith WarriorClaymore << Warrior
    .goto Undercity,66.09,20.06,35,0
    .goto Undercity,64.37,23.94,35,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
step << Priest
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
    >>|cRXP_BUY_从拍卖行购买|r|T135139:0|t[次级魔法杖] |r
    >>|cRXP_WARN_如果你这样做并且之前已经收集了|r|T132889:0|t[亚麻布]|cRXP_WARN_, 你可以将你的|r|T132889:0|t[亚麻布]|cRXP_WARN_在拍卖行出售|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    .collect 11287,1,435,1 --Lesser Magic Wand (1)
    .target Auctioneer Rhyker
    .itemStat 18,QUALITY,<7 << Priest/Mage/Warlock
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3 << Priest/Mage/Warlock
--XX Intentional for priests on 1.5x xp to only do this if they don't have a lesser magic wand
step << Rogue
    #ssf
    #optional
    #label RogueCutlass
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在贸易区与|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    .collect 851,1,435,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Louis Warren
step << Rogue
    #ah
    #optional
    #label RogueCutlass
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在贸易区与|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 851,1,435,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Louis Warren
step << Rogue
    #optional
    #completewith Entersilverpine
    +装备 |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Warrior
    #ssf
    #optional
    #label WarriorClaymore
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在贸易区与|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135350:0|t[优质重剑]|r
    .collect 1198,1,435,1 --Collect Claymore (1)
    .money <0.2950
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Louis Warren
step << Warrior
    #ah
    #optional
    #label WarriorClaymore
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在贸易区与|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135350:0|t[优质重剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 1198,1,435,1 --Collect Claymore (1)
    .money <0.2950
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Louis Warren
step << Warrior
    #optional
    #completewith Entersilverpine
    +装备 |T135350:0|t[优质重剑]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << skip --Warrior/Rogue
    #xprate >1.49
    #season 0,1 << Warrior
    #optional
    #label LogoutSkip3
    .goto Undercity,61.10,54.11
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到桶堆顶部来执行“登出跳过”, 然后注销并重新登录|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1 
    .itemcount 7231,<1 << Rogue --Astor's Letter of Introduction (0)
step << Warrior
    #season 2
    #completewith next
    #optional
    .goto 1458,54.383,73.014,50,0
    .goto 1458,52.837,77.725,20,0
    .goto 1458,52.275,79.254,15,0
    .goto 1458,51.279,79.923,15,0
    .goto 1458,49.693,78.903,15,0
    .goto 1458,47.951,76.171,15,0
    .goto Undercity,48.03,70.30,12 >>前往炼金房的|cRXP_FRIENDLY_Dorac|r
    .train 403475,1
step << Warrior
    #season 2
    .goto Undercity,48.03,70.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幽暗城的|cRXP_FRIENDLY_多拉克·格雷夫斯|r交谈
    >>上交你收集到的|cRXP_LOOT_Heads|r, 换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target Dorac Graves
    .train 403475,1
    .zoneskip Undercity,1
step << Warrior
    #season 2
    #optional
    .use 204688 >>|cRXP_WARN_使用|r|T134455:0|t[符文碎片]|cRXP_WARN_制作|r|T134419:0|t[|cRXP_FRIENDLY_ 毁灭符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
    .zoneskip Undercity,1
step << Warrior
    #season 2
    .train 403475 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .use 204703
    .itemcount 204703,1
    .zoneskip Undercity,1
step << skip --Warrior
    #xprate >1.49
    #season 2
    .goto 1458,48.906,70.156
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到尸巫腹部上方来执行“登出跳过”, 然后退出并重新登录|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1
step << Priest
    #optional
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r交谈
    .turnin 5658 >>交任务: |cRXP_FRIENDLY_虚弱之触|r
    .target Aelthalyste
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
    .train 2652,1 --Touch of Weakness not trained
step << Rogue/Warrior/Priest
    #xprate <1.5
    #optional
    .goto Undercity,84.06,17.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bethor|r交谈
    .turnin 411 >>交任务: |cRXP_FRIENDLY_巫妖归顺|r
    .target Bethor Iceshard
    .zoneskip Undercity,1
step << skip --Rogue/Warrior
    #xprate <1.5
    #optional
    #label UndercityLS3
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过将角色 positioned 在最低楼梯的最高处, 直到看起来像是漂浮一样, 然后登出再重新登录, 来执行一次“登出跳过”操作|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >>|cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1
    .itemcount 7231,<1 << Rogue --Astor's Letter of Introduction (0)
--XX Priests only go Undercity if they need to make/buy a Lesser Magic Wand (still midway through the steps of doing so)
--XX If rogues haven't killed Astor yet, they logout skip early before doing Rogue quest turnins
step << Priest
    #optional
    .goto Undercity,70.06,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克多|r交谈
    .train 3908 >>学习 |T136249:0|t[裁缝]
    .target Victor Ward
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,70.76,30.67
    >>|cRXP_WARN_将你所有的|r|T132889:0|t[亚麻布]|cRXP_WARN_转化为|r|T132890:0|t[亚麻布卷]
    .collect 2996,30,435,1 --Bolt of Linen Cloth (30)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,70.06,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克多|r交谈
    .train 7623 >>训练 |T132662:0|t[棕色亚麻长袍]
    .target Victor Ward
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,70.57,30.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与米尔莉交谈|cRXP_FRIENDLY_Millie|r
    >>|cRXP_BUY_从她那里购买|r|T132891:0|t[粗线]|r
    .collect 2320,30,435,1 --Coarse Thread (30)
    .target Millie Gregorian
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    >>|cRXP_WARN_制作尽可能多的|r|T132662:0|t[棕色亚麻长袍]|r
    .collect 6238,9,398,1 --Brown Linen Robe(9)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,62.47,61.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉文尼亚|r交谈
    .train 7411 >>训练 |T136244:0|t[附魔]
    .target Lavinia Crowe
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,62.35,60.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Thaddeus|r|cRXP_BUY_交谈. 从他那里购买|r|T133942:0|t[铜棒] |cRXP_BUY_和|r|T135435:0|t[普通木柴] |r
    >>|cRXP_WARN_分解你制作的所有|r|T132662:0|t[棕色亚麻长袍]|cRXP_WARN_并制作一个|r|T135225:0|t[符文铜棒]
    >>|cRXP_WARN_如果你没有获得|r|T132867:0|t[次级魔法精华]|cRXP_WARN_, 请从|r|cRXP_FRIENDLY_萨德斯|r|cRXP_WARN_处购买(如果有的话). 否则, 请稍后再完成此步骤|r
    .collect 6218,1,435,1 --Runed Copper Rod (1)
    .collect 4470,1,435,1 --Simple Wood (1)
    .target Thaddeus Webb
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    .goto Undercity,62.54,60.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛考布|r交谈
    .train 14293 >>训练 |T135139:0|t[次级魔法杖]
    .target Malcomb Wynn
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    #label LesserMagicWand
    >>|cRXP_WARN_创建一个|r |T135139:0|t[次级魔法杖]
    >>|cRXP_WARN_如果你没有获得|r|T132867:0|t[次级魔法精华]|cRXP_WARN_, 请从|r|cRXP_FRIENDLY_萨德斯|r|cRXP_WARN_处购买(如果有的话). 否则, 请稍后再完成此步骤|r
    .collect 11287,1,435,1 --Lesser Magic Wand (1)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #optional
    #completewith Entersilverpine
    +装备 |T135139:0|t[次级魔法杖]
    .use 11287
    .itemcount 11287,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << skip --Priest
    #optional
    #label UndercityLS3
    .goto 1458,61.990,62.272
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到桶堆顶部来执行“登出跳过”, 然后注销并重新登录|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1
step << Rogue
    #optional
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .turnin 1886 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .target Mennet Carkad
    .isQuestComplete 1886
    .zoneskip Undercity,1
step << Rogue
    #optional
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .accept 1898 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
    .isQuestTurnedIn 1886
step << Rogue
    #optional
    .goto Undercity,54.84,76.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆|r交谈
    .turnin 1898 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .accept 1899 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Andron Gant
    .isQuestTurnedIn 1886
step << Rogue
    #optional
    .goto Undercity,55.43,76.87
    >>战利品|cRXP_PICK_安德隆的书架|r 在|cRXP_FRIENDLY_安德隆|r 背后
    .complete 1899,1 --Andron's Ledger (1)
    .isQuestTurnedIn 1886
step << Rogue
    #optional
    .goto Undercity,83.53,69.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .turnin 1899 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .accept 1978 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
    .isQuestTurnedIn 1886
step << Rogue
    #optional
    .goto Tirisfal Glades,58.86,78.76,40,0
    .goto Tirisfal Glades,59.75,84.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
    .turnin 1978 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .target Varimathras
    .isQuestTurnedIn 1886
step << skip --Rogue
    #optional
    .goto Undercity,55.22,90.88
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_将你的角色放置在圆圈边缘, 直到看起来像是漂浮着. 通过注销并重新登录来执行“Logout Skip”(注销跳过)操作|r
	.link https://www.youtube.com/watch?v=jj85AXyF1XE >>|cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .isQuestTurnedIn 1886
    .zoneskip Undercity,1
step << Rogue
    #optional
    #completewith Entersilverpine
    .goto Tirisfal Glades,61.92,64.85
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
    .isQuestTurnedIn 1886
step << Rogue/Warrior/Priest
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
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
    .isQuestAvailable 1978

--XX Optional Undercity Section End: If Priest needs wand, Rogue/Warrior needs vendor wep

step
    #label Entersilverpine
    .goto Tirisfal Glades,53.20,75.82
    .zone Silverpine Forest >>前往: |cRXP_PICK_银松森林|r
    .zoneskip Silverpine Forest
]])

RXPGuides.RegisterGuide([[
#group RestedXP 联盟 1-22
#xprate <1.99
<< Horde
#version 11
#defaultfor Undead/Troll Rogue/Orc Rogue/Orc Warlock/Troll Mage/Troll Priest
#classic
#era/som--h
#name 12-14 银松森林
#displayname 12-14 银松森林 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 12-17 贫瘠之地


step << Undead Warrior
    #season 2
    #sticky
    #optional
    #completewith RuneOfDevastateUndead
    +不要删除你的|cRXP_LOOT_Severed Heads|r. 稍后会将其上交以换取 |T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .itemcount 204477,1
    .train 403475,1
step << Undead Rogue
    #sticky
    #completewith RotHideCluesTurnIn
    >>|cRXP_WARN_如果你看到|r |cRXP_FRIENDLY_Astor|r|cRXP_WARN_, 与他交谈并击杀他. 搜刮其尸体获得信件. 他在布瑞尔与瑟伯切尔之间的道路上巡逻|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan Astor Hadren
step
    #label WorgHearts
    #completewith next
    >>在前往|cRXP_FRIENDLY_Erland|r的途中, 击杀|cRXP_ENEMY_座狼|r, 搜刮它们的|cRXP_LOOT_心脏|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .mob Worg
    .mob Mottled Worg
    .unitscan Gorefang
step
    .goto Silverpine Forest,56.18,9.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵哨兵埃兰德|r交谈以开始护送任务
    >>|cRXP_WARN_开始此任务前, 请确保生命值和法力值已满|r
    .accept 435,1 >>接任务: |cRXP_LOOT_护送埃兰德|r
    .target Deathstalker Erland
step
    #completewith next
    >>击杀|cRXP_ENEMY_座狼|r. 从它们身上搜刮|cRXP_LOOT_Heart|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .mob Worg
    .mob Mottled Worg
    .unitscan Gorefang
step
    .goto Silverpine Forest,56.25,10.27,30,0
    .goto Silverpine Forest,56.25,11.43,30,0
    .goto Silverpine Forest,56.17,12.62,30,0
    .goto Silverpine Forest,53.46,13.45
    >>护送|cRXP_FRIENDLY_Erland|r安全抵达|cRXP_FRIENDLY_兰妮·尤瑞克|r
    >>|cRXP_ENEMY_座狼|r|cRXP_WARN_可能会相互堆叠, 只要有机会就及时进食和饮水|r
    .complete 435,1 --Erland must reach Rane Yorick (1)
    .mob Worg
step
    .goto Silverpine Forest,53.46,13.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .turnin 435 >>交任务: |cRXP_FRIENDLY_护送埃兰德|r
    .accept 429 >>接任务: |cRXP_LOOT_荒野之心|r
    .accept 449 >>接任务: |cRXP_LOOT_亡灵哨兵的报告|r
    .target Rane Yorick
step
    #loop
    .goto Silverpine Forest,57.72,10.07,0
    .goto Silverpine Forest,55.96,16.18,50,0
    .goto Silverpine Forest,58.37,15.56,50,0
    .goto Silverpine Forest,59.40,13.58,50,0
    .goto Silverpine Forest,60.11,10.51,50,0
    .goto Silverpine Forest,57.72,10.07,50,0
    >>击杀|cRXP_ENEMY_座狼|r. 从它们身上搜刮|cRXP_LOOT_Heart|r
    .collect 3164,6,429,1 --Collect Discolored Worg Heart (x6)
    .mob Worg
    .mob Mottled Worg
    .unitscan Gorefang
step
    #softcore
    #completewith ProveyourWorth
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #hardcore
    #completewith next
    .goto Silverpine Forest,49.77,28.66,50,0
    .goto Silverpine Forest,49.77,33.05,50,0
    .goto Silverpine Forest,49.64,37.84,100,0
    .goto Silverpine Forest,45.51,41.26,100 >>前往瑟伯切尔
step
    #label ProveyourWorth
    .goto Silverpine Forest,44.20,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达拉尔交谈|cRXP_FRIENDLY_Dalar|r
    .accept 421 >>接任务: |cRXP_LOOT_证明你的价值|r
    .target Dalar Dawnweaver
step << !Mage !Priest
    .goto Silverpine Forest,44.05,39.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格乌恩|r 交谈
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r
    .vendor >>出售垃圾
    .collect 4605,20,421,1 --Red-speckled Mushroom (20)
    .target Gwyn Farrow
    .money <0.05
step
    .goto Silverpine Forest,43.98,39.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Edwin|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Warlock/Priest/Shaman/Druid
    .vendor >>|cRXP_BUY_购买|r|T134830:0|t[次级治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
    .collect 1179,20,421,1 << Mage/Warlock/Priest/Shaman/Druid --Ice Cold Milk (20)
    .vendor >>出售垃圾
    .target Edwin Harly
    .money <0.05 << Mage/Warlock/Priest/Shaman/Druid
step << Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Allister|r和|cRXP_FRIENDLY_Podrig|r交谈
    .accept 477 >>接任务: |cRXP_LOOT_越境|r
    .target +Shadow Priest Allister
    .goto Silverpine Forest,43.98,40.93
    .accept 6321 >>接任务: |cRXP_LOOT_瑟伯切尔的补给|r
    .target +Deathguard Podrig
    .goto Silverpine Forest,43.43,41.67
step
    #label BorderCrossings
    .goto Silverpine Forest,43.98,40.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾利斯特|r交谈
    .accept 477 >>接任务: |cRXP_LOOT_越境|r
    .target Shadow Priest Allister
step
    #completewith next
    .goto Silverpine Forest,43.09,41.33,8,0
    .goto Silverpine Forest,42.75,41.30,8,0
    .goto Silverpine Forest,42.76,40.90,8,0
    .goto Silverpine Forest,43.43,40.87,2 >>进入墓穴
step
    .goto Silverpine Forest,43.43,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与墓穴中的|cRXP_FRIENDLY_Hadrec|r交谈
    .turnin 449 >>交任务: |cRXP_FRIENDLY_亡灵哨兵的报告|r
    .accept 3221 >>接任务: |cRXP_LOOT_与伦弗利尔会面|r
    .accept 437 >>接任务: |cRXP_LOOT_亡者农场|r
    .target High Executor Hadrec
step
    .goto Silverpine Forest,42.79,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师伦弗利尔|r交谈
    .turnin 429 >>交任务: |cRXP_FRIENDLY_荒野之心|r
    .turnin 445 >>交任务: |cRXP_FRIENDLY_给银松森林送信|r
    .turnin 3221 >>交任务: |cRXP_FRIENDLY_与伦弗利尔会面|r
    .accept 1359 >>接任务: |cRXP_LOOT_给金格的货物|r
    .accept 447 >>接任务: |cRXP_LOOT_致命的配方|r
    .accept 430 >>接任务: |cRXP_LOOT_回到奎恩身旁|r
    .target Apothecary Renferrel
    .addquestitem 3164,429
step
    #loop
    .goto Silverpine Forest,49.12,36.72,0
    .goto Silverpine Forest,50.32,39.22,50,0
    .goto Silverpine Forest,51.86,41.56,50,0
    .goto Silverpine Forest,51.53,43.06,50,0
    .goto Silverpine Forest,51.62,44.85,50,0
    .goto Silverpine Forest,51.80,46.60,50,0
    .goto Silverpine Forest,50.83,47.74,50,0
    .goto Silverpine Forest,49.12,36.72,50,0
    >>击杀|cRXP_ENEMY_月怒白头狼人|r
    .complete 421,1 --Moonrage Whitescalp (5)
    .mob Moonrage Whitescalp
    .unitscan Son of Arugal
step
    .goto Silverpine Forest,44.20,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达拉尔交谈|cRXP_FRIENDLY_Dalar|r
    .target Dalar Dawnweaver
    .turnin 421 >>交任务: |cRXP_FRIENDLY_证明你的价值|r
    .accept 422 >>接任务: |cRXP_LOOT_阿鲁高的愚行|r
step
    #completewith Remedy
    .goto Silverpine Forest,52.74,27.70,80 >>前往瓦尔甘的田野
step
    #label Remedy
    .goto Silverpine Forest,52.74,27.70,8,0
    .goto Silverpine Forest,53.13,27.92,8,0
    .goto Silverpine Forest,52.94,27.88,8,0
    .goto Silverpine Forest,52.83,28.56
    >>进入房屋, 前往二楼. 拾取地面上的|cRXP_PICK_达斯奇法典|r
    .complete 422,1 --Remedy of Arugal (1)
step
    #completewith next
    .goto Silverpine Forest,53.39,13.32,80,0
    .subzone 239 >>前往伊瓦尔牧场
step
    #label QuinnYorick
    .goto Silverpine Forest,53.39,13.32,8,0
    .goto Silverpine Forest,53.08,13.11,8,0
    .goto Silverpine Forest,53.27,13.16,8,0
    .goto Silverpine Forest,53.43,12.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在房子的二楼与|cRXP_FRIENDLY_奎恩·尤瑞克|r交谈
    .turnin 430 >>交任务: |cRXP_FRIENDLY_回到奎恩身旁|r
    .target Quinn Yorick
step
    .goto Silverpine Forest,53.46,13.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈, 她在外面
    .accept 425 >>接任务: |cRXP_LOOT_邪恶的伊瓦|r
    .target Rane Yorick
step
    .goto Silverpine Forest,52.01,14.02,6,0
    .goto Silverpine Forest,51.89,13.82,6,0
    .goto Silverpine Forest,51.54,13.91
    >>击杀|cRXP_ENEMY_邪恶的伊瓦|r. 击败他后搜刮他的|cRXP_LOOT_头|r
    >>|cRXP_WARN_伊瓦尔由两名|r|cRXP_ENEMY_鸦爪奴隶|r|cRXP_WARN_藏在谷仓内保护. 当他向前巡逻时, 你可以单刷拉住其中一名|r
    >>|cRXP_WARN_他们对恐惧效果免疫！|r << Priest/Warlock
    .complete 425,1 --Ivar's Head (1)
    .target Ivar the Foul
    .mob Ravenclaw Slave
step
    .goto Silverpine Forest,53.46,13.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰妮·尤瑞克|r交谈
    .turnin 425 >>交任务: |cRXP_FRIENDLY_邪恶的伊瓦|r
    .target Rane Yorick
step
    #completewith ArugalTurnin
    +|cRXP_WARN_小心！该区域可能有|r|cRXP_ENEMY_阿鲁高之子|r|cRXP_WARN_！这是一名25级精英怪物, 请远离他！|r
    .unitscan Son of Arugal
step
    #completewith Nightlash
    >>击杀|cRXP_ENEMY_Bears|r. 搜刮他们的|cRXP_LOOT_Hearts|r
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob Ferocious Grizzled Bear
    .mob Giant Grizzled Bear
    .unitscan Old VIcejaw
step
    #label Nightlash
    .goto Silverpine Forest,45.44,21.01
    >>击杀死亡之地周围的罗西德狗头人, 直到奈塔拉什出现. 击杀她并掠夺其精华
    >>|cRXP_WARN_他们对恐惧效果免疫！|r << Priest/Warlock
    .complete 437,1 --Enter the Dead Fields (1)
    .complete 437,2 --Essence of Nightlash (1)
    .unitscan Nightlash
    .mob Rot Hide Gladerunner
    .mob Rot Hide Mystic
step
    #completewith KillianVendor
    >>击杀|cRXP_ENEMY_Bears|r. 搜刮他们的|cRXP_LOOT_Hearts|r
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob Ferocious Grizzled Bear
    .mob Giant Grizzled Bear
    .unitscan Old VIcejaw
    .unitscan Son of Arugal
step
    #completewith next
    >>击杀|cRXP_ENEMY_蜘蛛|r. 击杀后搜刮其|cRXP_LOOT_血|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯·暗影纺者|r|cRXP_WARN_因为她几乎无法被击败！|r << !Mage !Warlock
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_, 虽然难度较高但并非不可能. 她拥有一个130点伤害的护盾(冷却时间15秒), 以及一个110点伤害的瞬发冲击技能|r << Mage/Warlock
    .complete 447,2 --Skittering Blood (6)
    .mob Moss Stalker
    .unitscan Krethis Shadowspinner
    .unitscan Son of Arugal
step
    #label KillianVendor
    .goto Silverpine Forest,33.00,17.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Killian|r交谈
    .vendor >>出售垃圾
    .target Killian Sanatha
step
    #loop
	.goto Silverpine Forest,36.33,14.20,0
	.goto Silverpine Forest,37.25,15.99,50,0
	.goto Silverpine Forest,35.67,16.01,50,0
	.goto Silverpine Forest,34.96,16.34,50,0
	.goto Silverpine Forest,33.99,17.24,50,0
	.goto Silverpine Forest,34.14,15.26,50,0
	.goto Silverpine Forest,35.06,14.50,50,0
	.goto Silverpine Forest,35.85,13.83,50,0
	.goto Silverpine Forest,36.33,14.20,50,0
    >>击杀|cRXP_ENEMY_蜘蛛|r. 击杀后搜刮其|cRXP_LOOT_血|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯·暗影纺者|r|cRXP_WARN_因为她几乎无法被击败！|r << !Mage !Warlock
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_克雷希斯|r|cRXP_WARN_, 虽然难度较高但并非不可能. 她拥有一个130点伤害的护盾(冷却时间15秒), 以及一个110点伤害的瞬发冲击技能|r << Mage/Warlock
    .complete 447,2 --Skittering Blood (6)
    .mob Moss Stalker
    .unitscan Krethis Shadowspi
step
    #loop
    .goto Silverpine Forest,41.60,21.65,0
    .goto Silverpine Forest,41.37,19.64,50,0
    .goto Silverpine Forest,41.60,21.65,50,0
    .goto Silverpine Forest,42.36,23.77,50,0
    .goto Silverpine Forest,44.67,24.84,50,0
    .goto Silverpine Forest,46.08,26.62,50,0
    >>击杀|cRXP_ENEMY_Bears|r. 击败它们以获取其|cRXP_LOOT_Hearts|r
    .complete 447,1 --Grizzled Bear Heart (6)
    .mob Ferocious Grizzled Bear
    .mob Giant Grizzled Bear
    .unitscan Old VIcejaw
    .unitscan Son of Arugal
step
    #softcore
    #completewith ArugalTurnin
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #hardcore
    #completewith next
    .goto Silverpine Forest,45.51,41.26,100,0
    .subzone 228 >>返回瑟伯切尔
step
    #xprate <1.5
    .goto Silverpine Forest,44.20,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达拉尔交谈|cRXP_FRIENDLY_Dalar|r
    .turnin 422 >>交任务: |cRXP_FRIENDLY_阿鲁高的愚行|r
    .accept 423 >>接任务: |cRXP_LOOT_阿鲁高的愚行|r
    .target Dalar Dawnweaver
step
    #xprate >1.49
    .goto Silverpine Forest,44.20,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与达拉尔交谈|cRXP_FRIENDLY_Dalar|r
    .turnin 422 >>交任务: |cRXP_FRIENDLY_阿鲁高的愚行|r
    .target Dalar Dawnweaver
step
    #optional
    #label ArugalTurnin
step
    #completewith next
    .goto Silverpine Forest,43.09,41.33,8,0
    .goto Silverpine Forest,42.75,41.30,8,0
    .goto Silverpine Forest,42.76,40.90,8,0
    .goto Silverpine Forest,43.43,40.87,2 >>进入墓穴
step
    .goto Silverpine Forest,43.43,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与墓穴中的|cRXP_FRIENDLY_Hadrec|r交谈
    .turnin 437 >>交任务: |cRXP_FRIENDLY_亡者农场|r
    .accept 438 >>接任务: |cRXP_LOOT_破旧渡口|r
    .target High Executor Hadrec
step << !Mage !Priest
    .goto Silverpine Forest,44.05,39.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格乌恩|r 交谈
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r
    .vendor >>出售垃圾
    .collect 4605,20,423,1 --Red-speckled Mushroom (20)
    .target Gwyn Farrow
step
    .goto Silverpine Forest,43.98,39.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Edwin|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132815:0|t[冰镇牛奶]|r << Warlock/Priest/Shaman/Druid
    .vendor >>|cRXP_BUY_购买|r|T134830:0|t[次级治疗药水]|cRXP_BUY_从他那里, 如果有的话|r
    .collect 1179,20,423,1 << Warlock/Priest/Shaman/Druid --Ice Cold Milk (20)
    .target Edwin Harly
step << Warlock/Mage/Priest
    .goto Silverpine Forest,44.80,39.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德莉亚|r交谈
    .vendor >>如果它在, 从她那里购买|T132491:0|t[|cRXP_FRIENDLY_Wise Man's Belt|r]
    .target Andrea Boynton
    .money <0.1400
step << Rogue
    .goto Silverpine Forest,44.61,39.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亚历山德勒|r交谈
    .vendor >>购买 |T132539:0|t[|cRXP_FRIENDLY_轻便靴|r], 如果它在售
    .target Alexandre Lefevre
    .money <0.2633
step << Warlock/Mage/Priest
    #completewith Shackles
    +装备 |T132491:0|t[|cRXP_FRIENDLY_智者腰带|r]
    .use 4786
    .itemcount 4786,1
    .xp <15,1
    .equip 6,4786
step << Rogue
    #completewith Shackles
    +装备 |T132539:0|t[|cRXP_FRIENDLY_轻便靴|r]
    .use 4788
    .itemcount 4788,1
    .xp <15,1
    .equip 8,4788
step
    #label DecrepitFerry
    .goto Silverpine Forest,58.39,34.79
    >>点击码头边的|cRXP_PICK_Boat|r
    .turnin 438 >>交任务: |cRXP_FRIENDLY_破旧渡口|r
    .accept 439 >>接任务: |cRXP_LOOT_线索|r
step
    #xprate <1.5
    #loop
    .goto Silverpine Forest,56.06,45.75,0
    .goto Silverpine Forest,56.06,45.75,40,0
    .goto Silverpine Forest,55.45,49.18,40,0
    .goto Silverpine Forest,56.80,45.86,40,0
    >>击杀|cRXP_ENEMY_月怒暴食者|r和|cRXP_ENEMY_月怒魔魂狼人|r, 从他们身上搜刮|cRXP_LOOT_链条|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_月怒魔魂狼人|r|cRXP_WARN_狂暴_当它们血量低于25%时. 血量低时请迅速击杀|r
    .complete 423,1 --Glutton Shackle (6)
    .mob +Moonrage Glutton
    .complete 423,2 --Darksoul Shackle (3)
    .mob +Moonrage Darksoul
step << Mage
    #season 2
    #completewith BorderCrossings
    >>击杀|cRXP_ENEMY_达拉然学徒|r. 击败他们后搜刮出|cRXP_LOOT_|T134939:0|t[|cRXP_FRIENDLY_法术笔记:天启龙王|r]|r
    .train 401767,1
    .collect 208754,1 --Spell Notes: TENGI RONEERA (1)
    .mob Dalaran Apprentice
step
    #hardcore
    .goto Silverpine Forest,49.89,60.33
    >>点击营地中的|cRXP_PICK_箱子|r
    >>|cRXP_WARN_当心！这些怪物在低生命值时会施放|r|T135846:0|t[冰霜新星]|cRXP_WARN_并逃跑. 将它们拉回, 逐个击杀, 直到你可以安全地点击箱子|r
    .turnin 477 >>交任务: |cRXP_FRIENDLY_越境|r
    .accept 478 >>接任务: |cRXP_LOOT_地图与符记|r
    .mob Dalaran Apprentice
step
    #label BorderCrossings
    #softcore
    .goto Silverpine Forest,49.89,60.33
    >>点击营地中的|cRXP_PICK_箱子|r
    >>|cRXP_WARN_小心, 这些怪物会施放|r|T135846:0|t[冰霜箭]|r
    .turnin 477 >>交任务: |cRXP_FRIENDLY_越境|r
    .accept 478 >>接任务: |cRXP_LOOT_地图与符记|r
    .mob Dalaran Apprentice
step << Mage
    #season 2
    #loop
    .goto Silverpine Forest,49.89,60.33,0
    .goto Silverpine Forest,52.6,56.6,20,0
    .goto Silverpine Forest,56.6,62.8,20,0
    .goto Silverpine Forest,55.6,72.8,20,0
    .goto Silverpine Forest,51.6,71.0,20,0
    .goto Silverpine Forest,50.8,61.6,20,0
    >>击杀|cRXP_ENEMY_达拉然学徒|r. 击败他们后搜刮出|cRXP_LOOT_|T134939:0|t[|cRXP_FRIENDLY_法术笔记:天启龙王|r]|r
    .train 401767,1
    .collect 208754,1 --Spell Notes: TENGI RONEERA (1)
    .mob Dalaran Apprentice
step << Mage
    #season 2
    .collect 211779,1 >>你需要从|cRXP_FRIENDLY_试剂商|r处获得一个|T135933:0|t[理解之魅]才能使用该物品
    .train 401767 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_ 法术笔记:天界罗妮娅|r]|cRXP_WARN_来学习|r|T132871:0|t[再生]
    .use 208754
    .itemcount 211779,1
step << Rogue
    #season 2
    .goto Silverpine Forest,45.25,68.06,20,0
    .goto Silverpine Forest,45.26,67.21
    >>在影牙城堡入口旁搜刮生锈的箱子, 获得[斩击符文]
    >>|cRXP_WARN_使用|r|T132307:0|t[冲刺]|cRXP_WARN_然后从桥上跳向宝箱|r
    .collect 208772,1 --Rune of Saber Slash (1)
    .train 424984,1
step << Rogue
    #season 2
    .train 424984 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_斩击符文|r]|cRXP_WARN_来训练|r|T132375:0|t[斩击]
    .use 208772
    .itemcount 208772,1
step
    #completewith next
    #hardcore
    .goto Silverpine Forest,45.51,41.26,100 >>返回瑟伯切尔
step
    #softcore
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Allister|r和|cRXP_FRIENDLY_Dalar|r交谈
    .turnin 478 >>交任务: |cRXP_FRIENDLY_地图与符记|r
    .accept 481 >>接任务: |cRXP_LOOT_达拉尔的推理|r
    .target +Shadow Priest Allister
    .goto Silverpine Forest,43.98,40.93
    .turnin 423 >>交任务: |cRXP_FRIENDLY_阿鲁高的愚行|r
    .turnin 481 >>交任务: |cRXP_FRIENDLY_达拉尔的推理|r
    .accept 482 >>接任务: |cRXP_LOOT_达拉然的意图|r
    .target +Dalar Dawnweaver
    .goto Silverpine Forest,44.20,39.73
step
    #xprate >1.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Allister|r和|cRXP_FRIENDLY_Dalar|r交谈
    .turnin 478 >>交任务: |cRXP_FRIENDLY_地图与符记|r
    .accept 481 >>接任务: |cRXP_LOOT_达拉尔的推理|r
    .target +Shadow Priest Allister
    .goto Silverpine Forest,43.98,40.93
    .turnin 481 >>交任务: |cRXP_FRIENDLY_达拉尔的推理|r
    .accept 482 >>接任务: |cRXP_LOOT_达拉然的意图|r
    .target +Dalar Dawnweaver
    .goto Silverpine Forest,44.20,39.73
step
    .goto Silverpine Forest,43.98,40.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾利斯特|r交谈
    .turnin 482 >>交任务: |cRXP_FRIENDLY_达拉然的意图|r
    .target Shadow Priest Allister
step
    #completewith next
    .goto Silverpine Forest,43.09,41.33,8,0
    .goto Silverpine Forest,42.75,41.30,8,0
    .goto Silverpine Forest,42.76,40.90,8,0
    .goto Silverpine Forest,43.43,40.87,2 >>进入墓穴
step
    #label RotHideCluesTurnIn
    .goto Silverpine Forest,43.43,40.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与墓穴中的|cRXP_FRIENDLY_Hadrec|r交谈
    .turnin 439 >>交任务: |cRXP_FRIENDLY_线索|r
    .target High Executor Hadrec
step
    #xprate <1.5 << Undead
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与卡拉斯交谈(|cRXP_FRIENDLY_Karos|r)
    .turnin 6321 >>交任务: |cRXP_FRIENDLY_瑟伯切尔的补给|r << Undead
    .accept 6323 >>接任务: |cRXP_LOOT_飞往幽暗城|r << Undead
    .fp Sepulcher >>获取墓穴的飞行路径 << !Undead
    .fly Undercity >>飞往幽暗城 << !Undead
    .target Karos Razok
step << Undead
    #xprate >1.49
    .goto Silverpine Forest,45.62,42.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与卡拉斯交谈(|cRXP_FRIENDLY_Karos|r)
    .turnin 6321 >>交任务: |cRXP_FRIENDLY_瑟伯切尔的补给|r
    .accept 6323 >>接任务: |cRXP_LOOT_飞往幽暗城|r
    .fly Undercity >>飞往幽暗城
    .target Karos Razok
step << Undead
    #xprate <1.5
    .hs >>传送到幽暗城
    .use 6948
    .zoneskip Undercity





    --XX Start of Undercity clown fiesta section





step << Undead
    .goto Undercity,61.48,41.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gordon|r交谈
    .turnin 6323 >>交任务: |cRXP_FRIENDLY_飞往幽暗城|r
    .accept 6322 >>接任务: |cRXP_LOOT_迈克尔·加勒特|r
    .target Gordon Wendham
step << Rogue
    #ssf
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在贸易区与|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135343:0|t[战士阔剑]|r
    .collect 2027,1,809,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target Louis Warren
step << Rogue
    #ah
    .goto Undercity,61.15,40.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在贸易区与|cRXP_FRIENDLY_刘易斯·瓦伦|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135343:0|t[战士阔剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 2027,1,809,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target Louis Warren
step << Rogue
    #optional
    #completewith Conscript
    +装备 |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
step << Undead
    .goto Undercity,63.27,48.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .turnin 6322 >>交任务: |cRXP_FRIENDLY_迈克尔·加勒特|r
    .target Michael Garrett
step << Undead Warrior
    #xprate <1.5
    #optional
    .goto Undercity,47.41,17.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴尔图斯·弗勒|r交谈
    .train 285 >>训练你的职业法术
    .target Baltus Fowler
    .dungeon RFC
    .xp <16,1
--XX 16+ 仅适用于英勇打击, 亡灵种族只有在其他种族于别处训练更有效时才会使用. RFC因此战士拥有16个法术用于RFC
step << Undead Rogue/Undead Warrior
    #xprate <1.5
    .goto Undercity,84.06,17.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bethor|r交谈
    .turnin 411 >>交任务: |cRXP_FRIENDLY_巫妖归顺|r
    .target Bethor Iceshard
    .isQuestComplete 411
step << Rogue/Warrior
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|r |cRXP_FRIENDLY_Mary|r 交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Mary Edras
step << Rogue/Warrior
    #optional
    .goto Undercity,73.19,55.17
    .skill firstaid,40 >>制作 |T133685:0|t[亚麻绷带], 直到你的技能达到40或更高
    .itemcount 2589,1 --Linen Cloth (1+)
step << Rogue/Warrior
    #optional
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|r |cRXP_FRIENDLY_Mary|r 交谈
    .train 3276 >>训练 |T133688:0|t[厚亚麻绷带]
    .target Mary Edras
    .skill firstaid,<40,1
step << Rogue/Warrior
    #optional
    .goto Undercity,73.19,55.17
    .skill firstaid,50 >>制作 |T133688:0|t[厚亚麻绷带], 直到你的技能达到50或更高
    .itemcount 2589,2 --Linen Cloth (2+)
step << Rogue/Warrior
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|r |cRXP_FRIENDLY_Mary|r 交谈
    .train 3274 >>火车急救员 急救
    .target Mary Edras
    .skill firstaid,<50,1
step << Undead Rogue
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .turnin 1886 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .accept 1898 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
    .isQuestComplete 1886
step << Undead Rogue
    .goto Undercity,83.52,69.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .accept 1898 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
    .isQuestTurnedIn 1886
step << Undead Rogue
    #optional
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
    .train 1758 >>训练你的职业法术
    .target Carolyn Ward
    .xp <14,1
    .xp >16,1
    .isOnQuest 1898 << Undead
--XX Only train if you were directed here for class quest as an Undead
step << Undead Rogue
    #optional
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
    .train 6761 >>训练你的职业法术
    .target Carolyn Ward
    .xp <16,1
    .isOnQuest 1898 << Undead
step << Undead Rogue
    #xprate <1.5
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
    .train 1758 >>训练你的职业法术
    .target Carolyn Ward
    .xp <14,1
    .xp >16,1
    .dungeon RFC
--XX Force train if hs not in Brill as an undead ONLY + 你想完成RFC任务. 可选内容为故意省略
--XX This whole section of training across 3 different areas, 2 different xp rates and RFC is solidly in the top 10 worst experiences of my life and im still not 100% happy with it xd
step << Undead Rogue
    #optional
    #xprate <1.5
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
    .train 6761 >>训练你的职业法术
    .target Carolyn Ward
    .xp <16,1
    .dungeon RFC
step << Undead Rogue
    .goto Undercity,54.84,76.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德隆|r交谈
    .turnin 1898 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .accept 1899 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Andron Gant
    .isQuestTurnedIn 1886
step << Undead Rogue
    .goto Undercity,55.43,76.87
    >>战利品|cRXP_PICK_安德隆的书架|r 在|cRXP_FRIENDLY_安德隆|r 背后
    .complete 1899,1 --Andron's Ledger (1)
    .isQuestTurnedIn 1886
step
    #completewith next
    #optional
    .goto 1458,54.383,73.014,50,0 << !Undead/!Rogue
    .goto 1458,52.837,77.725,20,0
    .goto 1458,52.275,79.254,15,0
    .goto 1458,51.279,79.923,15,0
    .goto 1458,49.693,78.903,15,0
    .goto 1458,47.951,76.171,15,0
    .goto Undercity,48.84,69.25,12 >>前往炼金房的|cRXP_FRIENDLY_Faranell|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与炼金房中的|cRXP_FRIENDLY_大药剂师法拉尼尔|r和|cRXP_FRIENDLY_药剂师金格|r交谈
    .turnin 447 >>交任务: |cRXP_FRIENDLY_致命的配方|r
    .target +Master Apothecary Faranell
    .goto Undercity,48.84,69.25
    .turnin 1359 >>交任务: |cRXP_FRIENDLY_给金格的货物|r
    .accept 1358 >>接任务: |cRXP_LOOT_给赫布瑞姆的样本|r
    .target +Apothecary Zinge
    .goto Undercity,50.16,67.97
step << Undead Warrior
    #season 2
    #label RuneOfDevastateUndead
    .goto Undercity,48.03,70.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幽暗城中的|cRXP_FRIENDLY_Dorac|r交谈
    >>上交你收集到的|cRXP_LOOT_Heads|r, 换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target Dorac Graves
    .train 403475,1
step << Undead Warrior
    #season 2
    .use 204688 >>|cRXP_WARN_使用|r|T134455:0|t[符文碎片]|cRXP_WARN_制作|r|T134419:0|t[|cRXP_FRIENDLY_ 毁灭符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step << Undead Warrior
    #season 2
    .train 403475 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .use 204703
    .itemcount 204703,1
step << skip --Undead Rogue/Undead Warrior
    #xprate <1.5
    #optional
    .goto 1458,48.906,70.156
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到尸巫腹部上方来执行“登出跳过”, 然后退出并重新登录|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1
    .isQuestTurnedIn 1886 << Rogue
step << Undead Rogue
    .goto Undercity,83.53,69.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .turnin 1899 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .accept 1978 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
    .isQuestTurnedIn 1886
step << Undead Rogue
    #xprate <1.5
    #optional
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
    .train 1758 >>训练你的职业法术
    .target Carolyn Ward
    .xp <14,1
    .xp >16,1
    .dungeon RFC
--XX Force train if hs not in Brill as an undead ONLY + 你想做RFC. 如果之前完成了可选任务, 就重复做一遍
step << Undead Rogue
    #xprate <1.5
    #optional
    .goto Undercity,83.86,72.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡罗琳|r交谈
    .train 6761 >>训练你的职业法术
    .target Carolyn Ward
    .xp <16,1
    .dungeon RFC
step << Undead Rogue
    .goto Tirisfal Glades,58.86,78.76,40,0
    .goto Tirisfal Glades,59.75,84.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
    .turnin 1978 >>交任务: |cRXP_FRIENDLY_亡灵哨兵|r
    .target Varimathras
    .isQuestTurnedIn 1886
step << skip --Undead Rogue
    #xprate <1.5
    #optional
    .goto Undercity,55.22,90.88
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_将你的角色放置在圆圈边缘, 直到看起来像是漂浮着. 通过注销并重新登录来执行“Logout Skip”(注销跳过)操作|r
	.link https://www.youtube.com/watch?v=jj85AXyF1XE >>|cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1
    .isQuestTurnedIn 1886
step << !Rogue !Warrior
    #optional
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|r |cRXP_FRIENDLY_Mary|r 交谈
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Mary Edras
step << !Rogue !Warrior
    #optional
    .goto Undercity,73.19,55.17
    .skill firstaid,40 >>制作 |T133685:0|t[亚麻绷带], 直到你的技能达到40或更高
    .itemcount 2589,1 --Linen Cloth (1+)
step << !Rogue !Warrior
    #optional
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|r |cRXP_FRIENDLY_Mary|r 交谈
    .train 3276 >>训练 |T133688:0|t[厚亚麻绷带]
    .target Mary Edras
    .skill firstaid,<40,1
step << !Rogue !Warrior
    #optional
    .goto Undercity,73.19,55.17
    .skill firstaid,50 >>制作 |T133688:0|t[厚亚麻绷带], 直到你的技能达到50或更高
    .itemcount 2589,2 --Linen Cloth (2+)
step << !Rogue !Warrior
    #optional
    .goto Undercity,73.19,55.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与盗贼区的|r |cRXP_FRIENDLY_Mary|r 交谈
    .train 3274 >>火车急救员 急救
    .target Mary Edras
    .skill firstaid,<50,1
step << Undead !Rogue !Warrior
    #xprate <1.5
    .goto Undercity,84.06,17.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bethor|r交谈
    .turnin 411 >>交任务: |cRXP_FRIENDLY_巫妖归顺|r
    .target Bethor Iceshard
    .isQuestComplete 411
step << Undead Mage
    #xprate >1.49
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1882 >>交任务: |cRXP_FRIENDLY_巴尼尔农场|r
    .train 2137 >>训练你的职业法术
    .target Anastasia Hartwell
    .xp <14,1
    .xp >16,1
step << Undead Mage
    #xprate >1.49
    #optional
    .goto Undercity,85.14,10.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1882 >>交任务: |cRXP_FRIENDLY_巴尼尔农场|r
    .train 2120 >>训练你的职业法术
    .target Anastasia Hartwell
    .xp <16,1
step << Mage
    #xprate <1.5 << Undead
    .goto Undercity,85.14,10.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .train 2137 >>训练你的职业法术
    .target Anastasia Hartwell
    .xp <14,1
    .xp >16,1
--XX no dungeon RFC due to close proximity
step << Mage
    #xprate <1.5 << Undead
    #optional
    .goto Undercity,85.14,10.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .train 2120 >>训练你的职业法术
    .target Anastasia Hartwell
    .xp <16,1
step << Undead Warlock
    #xprate <1.5
    .goto Undercity,88.93,15.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
    .train 6222 >>训练你的职业法术
    .target Richard Kerwin
    .xp <14,1
    .xp >16,1
--XX no dungeon RFC due to close proximity
step << Undead Warlock
    #xprate <1.5
    #optional
    .goto Undercity,88.93,15.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Richard|r交谈
    .train 1455 >>训练你的职业法术
    .target Richard Kerwin
    .xp <16,1
step << Priest/Mage/Warlock
    #ssf
    .goto Undercity,69.54,26.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_赞恩·布拉德弗|r交谈
    >>|cRXP_BUY_从他那里购买一把|r|T135468:0|t[烟尘魔杖]|r
    .collect 5208,1 --Smoldering Wand (1)
    .money <0.3515
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
	.target Zane Bradford
step << Priest/Mage/Warlock
    #ah
    .goto Undercity,69.54,26.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_赞恩·布拉德弗|r交谈
    >>|cRXP_BUY_从他那里购买一把|r|T135468:0|t[烟尘魔杖]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 5208,1 --Smoldering Wand (1)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
	.target Zane Bradford
step << Priest/Mage/Warlock
    #optional
    #completewith Conscript
    +装备 |T135468:0|t[烟尘魔杖] |cRXP_WARN_当你达到15级时|r
    .use 5208
    .itemcount 5208,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp >15,1
step << Priest/Mage/Warlock
    #optional
    #completewith Conscript
    +装备 |T135468:0|t[烟尘魔杖]
    .use 5208
    .itemcount 5208,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .xp <15,1
step << Undead Priest
    #xprate <1.5
    #sticky
    #label TouchOW
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r交谈
    .turnin 5658 >>交任务: |cRXP_FRIENDLY_虚弱之触|r
    .target Aelthalyste
    .train 2652,1 --Touch of Weakness not trained
    .dungeon RFC
step << !Undead Priest
    #xprate <1.5
    #sticky
    #label TouchOW
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r交谈
    .turnin 5660 >>交任务: |cRXP_FRIENDLY_虚弱之触|r
    .target Aelthalyste
    .train 2652,1 --Touch of Weakness not trained
    .dungeon RFC
    .isOnQuest 5660
--XX Not going out of the way for this outside of this edge case to train for RFC, waste of a gcd
step << Undead Priest
    #xprate <1.5
    .goto Undercity,47.56,18.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉扎鲁斯|r交谈
	.train 6074 >>训练你的职业法术
    .target Father Lazarus
    .xp <14,1
    .xp >16,1
    .dungeon RFC
step << Undead Priest
    #xprate <1.5
    #optional
    .goto Undercity,47.56,18.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉扎鲁斯|r交谈
	.train 8102 >>训练你的职业法术
    .target Father Lazarus
    .xp <16,1
    .dungeon RFC
step << Undead Rogue
    #optional
    #completewith Conscript
    >>放弃亡灵哨兵, 已经没有机会再做了
    .abandon 1886 >>放弃亡灵哨兵
    .isOnQuest 1886
step << skip --Undead !Rogue !Warrior
    #xprate <1.5
    #requires TouchOW << Undead Priest
    .goto Undercity,56.89,16.77 << Priest
    .goto Undercity,69.46,25.85 << Mage/Warlock
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到肉车的升级机顶部来执行登出跳过, 然后退出并重新登录|r << Priest
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到桶堆顶部来执行“登出跳过”, 然后注销并重新登录|r << Mage/Warlock
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1
    .dungeon RFC
step << skip --Undead !Rogue !Warrior
    #xprate <1.5
    .goto Undercity,69.46,25.85 << Priest/Mage/Warlock
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到桶堆顶部来执行“登出跳过”, 然后注销并重新登录|r << Priest/Mage/Warlock
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >>|cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1
    .dungeon !RFC



--XX End of Undercity clown fiesta section





--XX Start of 1.5x Brill Train section





step << Undead
    #xprate >1.49
    #completewith ZeptoDurotar
    .hs >>传送回布瑞尔
    .zoneskip Undercity,1
step << Undead Rogue
    #xprate >1.49
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的人类|cRXP_FRIENDLY_Marion|r交谈
    .train 1758 >>训练你的职业法术
    .target Marion Call
    .xp <14,1
    .xp >16,1
step << Undead Rogue
    #xprate >1.49
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的人类|cRXP_FRIENDLY_Marion|r交谈
    .train 6761 >>训练你的职业法术
    .target Marion Call
    .xp <16,1
step << Undead Priest
    #xprate >1.49
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 8122 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <14,1
    .xp >16,1
step << Undead Priest
    #xprate >1.49
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 8102 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <16,1
step << skip --Undead Mage
    #xprate >1.49
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 1460 >>训练你的职业法术
    .target Cain Firesong
    .xp <14,1
    .xp >16,1
step << skip --Undead Mage
    #xprate >1.49
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 2120 >>训练你的职业法术
    .target Cain Firesong
    .xp <16,1
step << Undead Warrior
    #xprate >1.49
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 285 >>训练你的职业法术
    .target Austil de Mon
    .xp <16,1
step << Undead Warlock
    #xprate >1.49
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 6222 >>训练你的职业法术
    .target Rupert Boch
    .xp <14,1
    .xp >16,1
step << Undead Warlock
    #xprate >1.49
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 1455 >>训练你的职业法术
    .target Rupert Boch
    .xp <16,1





--XX End of 1.5x Brill Train section





step << Undead
    #sticky
    #completewith EnterRFC
    .subzone 2437 >>现在你应该找一个团队去怒焰裂谷
    .dungeon RFC
step << Undead
    #completewith next
    .goto Tirisfal Glades,61.92,64.85,50,0
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
step << Undead
    #label ZeptoDurotar
    .goto Tirisfal Glades,60.96,58.63,12,0
    .goto Tirisfal Glades,61.51,59.01,10,0
    .goto Tirisfal Glades,61.27,59.22,8,0
    .goto Tirisfal Glades,61.13,58.84,8,0
    .goto Tirisfal Glades,61.38,58.71,8,0
    .goto Tirisfal Glades,61.34,59.17,8,0
    .goto Tirisfal Glades,60.51,58.69,-1
    .goto Tirisfal Glades,60.94,46.35,-1
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    >>等待时制作磨刀石/绷带 << Warrior/Rogue
    >>等待时召唤食物/水 << Mage
    .zoneskip Durotar
step << Undead
    #completewith HiddenEnemiesPickup
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .dungeon RFC
step << Undead
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
    >>|cRXP_WARN_不要飞行到任何地方！|r
    .fp Orgrimmar >>获取奥格瑞玛飞行点
    .target Doras
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .accept 5726 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .dungeon RFC
step << Undead
    .goto Durotar,53.08,9.19,0
    >>击杀骷髅石中的|cRXP_ENEMY_Burning Blade|r怪物, 直到掉落|cRXP_LOOT_Lieutenant's Insignia|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5726 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5727 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .accept 5761 >>接任务: |cRXP_WARN_饥饿者塔拉加曼|r
    .target Neeru Fireblade
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .complete 5727,1 --Gauge Neeru Fireblade's reaction to you being a member of the Burning Blade
    .skipgossip
    .target Neeru Fireblade
    .dungeon RFC
step << Undead
    #label HiddenEnemiesPickup
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5727 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5728 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .dungeon RFC
step << Undead
    #completewith EnterRFC
    .destroy 14544 >>|cRXP_WARN_摧毁: |cRXP_ENEMY_军官的徽章|r|r
step << Undead
    #label EnterRFC
    .goto Orgrimmar,52.77,48.97
    .subzone 2437 >>进入RFC副本传送门. 区域中
    .dungeon RFC
step << Undead
    >>|cRXP_WARN_如果可能的话, 请队伍成员共享以下任务|r
    .accept 5722 >>接任务: |cRXP_WARN_寻找背包|r
    .accept 5723 >>接任务: |cRXP_WARN_试探敌人|r
    .disablecheckbox
    .dungeon RFC
step << Undead
    #completewith next
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +Ragefire Trogg
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +Ragefire Shaman
    .isOnQuest 5723
    .dungeon RFC
step << Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .turnin 5722 >>交任务: |cRXP_FRIENDLY_寻找背包|r
    .accept 5724 >>接任务: |cRXP_WARN_归还背包|r
    .target Maur Grimtotem
    .isOnQuest 5722
    .dungeon RFC
step << Undead
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .accept 5724 >>接任务: |cRXP_WARN_归还背包|r
    .target Maur Grimtotem
    .isQuestTurnedIn 5722
    .dungeon RFC
step << Undead
    #label TroggsShamans
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +Ragefire Trogg
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +Ragefire Shaman
    .isOnQuest 5723
    .dungeon RFC
step << Undead
    #requires TroggsShamans
    #completewith BazzalanandJergosh
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r. 击败他们后搜刮出|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob Searing Blade Cultist
    .mob Searing Blade Warlock
    .isOnQuest 5725
    .dungeon RFC
step << Undead
    >>击杀|cRXP_ENEMY_饥饿者塔拉加曼|r. 击败他后搜刮其|cRXP_LOOT_心脏|r
    .complete 5761,1 -- Taragaman the Hungerer's Heart
    .mob Taragaman the Hungerer
    .isOnQuest 5761
    .dungeon RFC
step << Undead
    #label BazzalanandJergosh
    >>击杀|cRXP_ENEMY_巴扎兰|r和|cRXP_ENEMY_祈求者耶戈什|r
    .complete 5728,1 --Bazzalan (1)
    .mob +Bazzalan
    .complete 5728,2 --Jergosh the Invoker (1)
    .mob +Jergosh the Invoker
    .isOnQuest 5728
    .dungeon RFC
step << Undead
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r. 击败他们后搜刮出|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob Searing Blade Cultist
    .mob Searing Blade Warlock
    .isOnQuest 5725
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5761 >>交任务: |cRXP_FRIENDLY_饥饿者塔拉加曼|r
    .target Neeru Fireblade
    .isQuestComplete 5761
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5728 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5729 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .isQuestComplete 5728
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .accept 5729 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .isQuestTurnedIn 5728
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5729 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5730 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Neeru Fireblade
    .dungeon RFC
    .isQuestTurnedIn 5728
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5730 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .target Thrall
    .isQuestTurnedIn 5728
    .dungeon RFC
step << Undead
    #completewith Conscript
    .subzone 362 >>前往剃刀岭
step << !Undead
    .hs >>炉石到剃刀岭
    .use 6948
    .zoneskip Durotar
step << Rogue
    #optional << Undead
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 1758 >>训练你的职业法术
    .target Kaplak
    .xp <14,1
    .xp >16,1
step << Rogue
    #optional << Undead
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 6761 >>训练你的职业法术
    .target Kaplak
    .xp <16,1
step << Priest
    #optional << Undead
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
	.train 8122 >>训练你的职业法术
    .target Tai'jin
    .xp <14,1
    .xp >16,1
step << Priest
    #optional << Undead
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
	.train 8102 >>训练你的职业法术
    .target Tai'jin
    .xp <16,1
step << Warrior
    #optional << Undead
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 285 >>训练你的职业法术
    .target Tarshaw Jaggedscar
    .xp <16,1
step << Warlock
    #optional << Undead
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dhugru|r交谈
    .train 6222 >>训练你的职业法术
    .target Dhugru Gorelust
    .xp <14,1
    .xp >16,1
step << Warlock
    #optional << Undead
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dhugru|r交谈
    .train 1455 >>训练你的职业法术
    .target Dhugru Gorelust
    .xp <16,1
step << !Undead
    #xprate >1.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Orgnil|r和|cRXP_FRIENDLY_Gar'Thok|r交谈
    .turnin 806 >>交任务: |cRXP_FRIENDLY_黑暗风暴|r
    .goto Durotar,52.24,43.15
    .turnin 837 >>交任务: |cRXP_FRIENDLY_野猪人的进犯|r
    .goto Durotar,51.95,43.50
    .target Orgnil Soulscar
    .target Gar'Thok
step
    #label Conscript
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林|r交谈
    .accept 840 >>接任务: |cRXP_LOOT_部落的新兵|r
    .target Takrin Pathseeker
step
    #completewith next
    .subzone 379 >>前往远望哨所
step
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kargal|r交谈
    .turnin 840 >>交任务: |cRXP_FRIENDLY_部落的新兵|r
    .accept 842 >>接任务: |cRXP_LOOT_十字路口征兵|r
    .target Kargal Battlescar
step << !Undead
    #xprate <1.5
    .goto The Barrens,62.34,20.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
    .turnin 809 >>交任务: |cRXP_FRIENDLY_雅克塞罗斯|r
    .accept 924 >>接任务: |cRXP_LOOT_恶魔之种|r
    .target Ak'Zeloth
    .isQuestTurnedIn 829
step << !Undead
    .goto The Barrens,62.34,20.03
    >>|cRXP_WARN_掠夺|r|T134095:0|t[有瑕疵的能量石] |cRXP_WARN_旁边|r|cRXP_FRIENDLY_雅克塞罗斯|r|cRXP_WARN_. 此物品有30分钟倒计时, 请尽快获取|r
    .turnin 926 >>交任务: |cRXP_FRIENDLY_有瑕疵的能量石|r
    .isOnQuest 924
step << Mage
    +如果你计划通过范围攻击(AoE)升级, 请手动选择荒芜之地的AoE攻略. 否则, 请完成此步骤
]])


local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#classic
<< Horde
#xprate >1.99
#version 1
#group RestedXP 联盟 1-22
#defaultfor Undead
#name 1-7 提瑞斯法林地
#displayname 1-7 提瑞斯法林地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 7-13 提瑞斯法林地

step << !Undead
    #completewith next
    +|cRXP_WARN_您选择的指南适用于亡灵种族. 建议您选择与您初始起始区域相同的区域|r
step << !Undead Mage
    #season 2
    #completewith next
    +在探索季中, 作为法师你不应该在种族起始区域之外开始游戏, 因为你将无法在这里获得你的第一个符文(|T133816:0|t[雕纹手套 - 寒冰之枪])
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
    #xprate <2.1
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
step << Warrior/Warlock/Priest/Mage
    #season 0
    #xprate >2.09
    #completewith Vendor
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r. 掠夺它们, 直到你获得价值60铜的可出售物品(包括你的装备)|r << Mage
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r. 击败它们并拾取战利品, 直到你获得总价值50铜币的可出售物品(包括你的装备)|r << Priest
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r. 击败它们并搜刮战利品, 直到你获得总价值10铜币的可出售物品(包括你的装备)|r << Warrior/Warlock
    .mob Young Scavenger
    .mob Duskbat
    .money >0.01
step
    #season 2
    #xprate >2.09
    #completewith Vendor
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r. 击败它们并拾取战利品, 直到你获得总价值28铜的可售物品(包括你的装备)|r << Rogue/Priest/Warlock
    +|cRXP_WARN_击杀|cRXP_ENEMY_食腐狼幼崽|r和|cRXP_ENEMY_夜行蝙蝠|r. 击败它们并搜刮掉落, 直到获得总价值15铜的可售物品(包括你的装备)|r << Warrior/Mage
    .mob Young Scavenger
    .mob Duskbat
    .money >0.01
step
    #xprate >2.09
    #loop
    .goto Tirisfal Glades,29.18,68.94,40,0,0
    .goto Tirisfal Glades,29.92,70.30,40,0
    .goto Tirisfal Glades,30.70,69.28,40,0
    .goto Tirisfal Glades,29.18,68.94,40,0
    .goto Tirisfal Glades,29.10,67.66,40,0
    .goto Tirisfal Glades,30.19,65.32,40,0
    .xp 2 >>升级到2级
    .mob Young Scavenger
    .mob Duskbat
    .money >0.01
step
    #season 2
    .goto Tirisfal Glades,31.36,66.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    >>|cRXP_BUY_出售垃圾并获得|r|T134419:0|t[|cRXP_FRIENDLY_胜利冲锋符文|r]|cRXP_BUY_和|r|T134419:0|t[|cRXP_FRIENDLY_狂暴冲锋符文|r] << Warrior
    >>|cRXP_BUY_出售垃圾并购买所有关键的范围伤害符文|r << Mage
    >>|cRXP_BUY_出售垃圾并购买以下所有符文:|r << Hunter/Warlock/Rogue/Priest
    .collect 204806,1 << Warrior --Rune of Victory Rush
    .collect 204716,1 << Warrior --Rune of Frenzied Assault
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
    >>寒冰之枪只有在后续交任务时才有用 << Mage
    >>|cRXP_WARN_稍后您将获得剩余的符文|r
    .target Rune Broker
    .skipgossip
step
    #season 2
    .train 403470 >>使用|T134419:0|t[|cRXP_FRIENDLY_胜利之符|r]来训练|T132342:0|t[胜利冲锋]<< Warrior
    .train 415936 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 活体炸弹|r]来训练|T236220:0|t[活体炸弹] << Mage
    .train 401759 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Burnout|r]来训练|T236207:0|t[Burnout] << Mage
    .train 440858 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 冰霜宝珠|r]来训练|T135851:0|t[冰霜宝珠] << Mage
    .train 401760 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: 寒冰之枪|r]来训练|T135844:0|t[寒冰之枪] << Mage
    .train 401768 >>使用|T134939:0|t[|cRXP_FRIENDLY_Spell Notes: Living Flame|r]来训练|T135820:0|t[Living Flame] << Mage
    .train 416009 >>使用|T134419:0|t[|cRXP_FRIENDLY_战术符文|r]来训练|T136150:0|t[恶魔战术] << Warlock
    .train 425476 >>使用 |T134419:0|t[|cRXP_FRIENDLY_ 契约符文|r] 来训练 |T237562:0|t[恶魔契约] << Warlock
    .train 416015 >>使用 |T134419:0|t[|cRXP_FRIENDLY_灼烧符文|r] 来训练 |T135789:0|t[灼烧] << Warlock
    .train 403919 >>使用|T134419:0|t[|cRXP_FRIENDLY_ 噩梦符文|r]来训练 |T236298:0|t[诅咒之魂] << Warlock
    .train 403619 >>使用 |T133733:0|t[邪恶护甲典籍] 来学习 |T136156:0|t[邪恶护甲]|cRXP_WARN_请将其作为你的主要护甲法术|r << Warlock
    .train 402852 >>使用 |T135975:0|t[|cRXP_FRIENDLY_亵渎要塞的预言|r] 来训练 |T237570:0|t[人造人] << Priest
    .train 425447 >>使用|T134419:0|t[|cRXP_FRIENDLY_狂暴冲击符文|r]来训练|T236317:0|t[狂暴冲击] << Warrior
    .train 400101 >>使用 |T134419:0|t[|cRXP_FRIENDLY_ 阴影步符文|r] 来训练 |T132303:0|t[阴影步] << Rogue
    .train 432301 >>使用|T134419:0|t[|cRXP_FRIENDLY_卑鄙行径符文|r]来训练|T236285:0|t[不公平优势] << Rogue
    .train 400105 >>使用|T134419:0|t[|cRXP_FRIENDLY_暗影之击符文|r]来训练|T132323:0|t[暗影之击] << Rogue
    .train 424984 >>使用|T134419:0|t[|cRXP_FRIENDLY_萨伯尔斩符文|r]来训练|T132375:0|t[萨伯尔斩] << Rogue
    .train 415922 >>使用|T134419:0|t[|cRXP_FRIENDLY_ 海盗符文|r]来训练|T134538:0|t[火枪] << Rogue
    .train 431663 >>使用|T135791:0|t[心灵顿悟]来训练|T136181:0|t[心灵尖刺] << Priest
    .train 425216 >>使用|T136222:0|t[|cRXP_FRIENDLY_黑暗记忆|r]来训练|T237514:0|t[虚空瘟疫] << Priest
    .train 402862 >>使用|T136222:0|t[|cRXP_FRIENDLY_侍僧的回忆|r]来训练|T237545:0|t[忏悔] << Priest
    .train 402849 >>使用|T135975:0|t[|cRXP_FRIENDLY_国王之死的预言|r]来训练|T136149:0|t[暗影之言:死亡] << Priest
    .use 205947 << Priest --Prophecy of a Desecrated Citadel
    .use 212552 << Priest --Psychosophic Epiphany
    .use 205940 << Priest --Memory of a Dark Purpose
    .use 205951 << Priest --Memory of a Troubled Acolyte
    .use 205932 << Priest --Prophecy of a King's Demise
    .use 204716 << Warrior --Rune of Frenzied Assault
    .use 203746 << Mage --Spell Notes: Living Flame
    .use 209852 << Hunter --Rune of Kill Command
    .use 226401 << Hunter --Treatise on the Heart of the Lion
    .use 208799 << Mage --Spell Notes: Living Bomb
    .use 203748 << Mage --Spell Notes: Burnout
    .use 225690 << Mage --Spell Notes: Frozen Orb
    .use 203746 << Mage --Spell Notes: Living Flame
    .use 203745 << Mage --Spell Notes: Ice Lance
    .use 204716 << Warrior --Rune of Frenzied Assault
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
    #optional
    #sticky
    .aura 403619 >>|cRXP_WARN_ 请务必记得激活你的|r|T136156:0|t[邪能护甲]
step << Warrior
    #season 0
    #completewith Training1
    .goto Tirisfal Glades,32.22,65.64,8 >>进入建筑内部
step << Priest/Mage
    #season 0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132794:0|t[清凉的泉水]|r
    .vendor >>出售垃圾
	.collect 159,10,383,1 --Collect Refreshing Spring Water (10)
    .target Joshua Kien
step << Priest
    .goto Tirisfal Glades,31.11,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duesten|r交谈
    .accept 77670 >>接受对不死之境的冥想
    .turnin 77670 >>提交冥想之于不死
    .target Dark Cleric Duesten
step
    #optional
    #label Vendor
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
    #xprate <2.1
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 376 >>接任务: |cRXP_LOOT_被诅咒者|r
    .goto Tirisfal Glades,30.86,66.05
    .target Novice Elreth
    .xp <2,1
step << Warlock/Mage
    #xprate >2.09
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 376 >>接任务: |cRXP_LOOT_被诅咒者|r
    .goto Tirisfal Glades,30.86,66.05
    .target Novice Elreth
step << Warlock
    #season 2
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .accept 77672 >>接受失落的符文
    .turnin 77672 >>交还失落的符文
    .target Maximillion
step << Mage
    #requires Percing
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .train 1459 >>训练 |T135932:0|t[奥术智慧]
    .accept 77671 >>接受法术研究
    .turnin 77671 >>提交法术研究
    .target Isabella
step << Mage
    #season 2
    #optional
    .equip 10,711 >>|cRXP_WARN_装备|r|T132961:0|t[破布手套]
    .use 711
    .engrave 10 >>|cRXP_WARN_在你的|r手套上刻印|r|T236220:0|t[活体炸弹]
    .engrave 7 >>|cRXP_WARN_在你的裤子上刻下|r|T135820:0|t[活焰]
    .engrave 5 >>|cRXP_WARN_在你的胸膛上刻下|r|T236207:0|t[燃尽]
step << Mage
    #season 2
    #optional
    #sticky
    .engrave 15 >>留意任何披风掉落. 一旦获得, 用|T135851:0|t[冰霜宝珠]对其进行附魔
    >>|cRXP_WARN_这个法术极其强大|r
step << Warlock
    #season 0
    #label Vendor
    .goto Tirisfal Glades,30.81,66.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉|r交谈
    .vendor >>出售垃圾
    .target Kayla Smithe
    .money >0.1
step << Warlock
    #season 0
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
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 376 >>接任务: |cRXP_LOOT_被诅咒者|r
    .goto Tirisfal Glades,30.86,66.05
    .target Novice Elreth
    .xp <2,1
step << !Warlock !Mage
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 376 >>接任务: |cRXP_LOOT_被诅咒者|r
    .goto Tirisfal Glades,30.86,66.05
    .target Novice Elreth
step << Rogue/Priest/Warlock
    #season 2
    .goto Tirisfal Glades,32.41,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基巴德|r交谈
    >>|cRXP_BUY_购买一个|r|T132513:0|t[破布腰带] |cRXP_BUY_从他那里刻印符文|r << Rogue/Priest
    >>|cRXP_BUY_购买|r|T132606:0|t[破布护腕]|cRXP_BUY_从他那里购买以刻印符文|r << Warlock
    .collect 3596,1 << Warlock --Tattered Cloth Bracers 
    .collect 3595,1 << Rogue/Priest --Tattered Cloth Belt
    .target Archibald Kava
step << Warlock
    #season 2
    .equip 10,711 >>|cRXP_WARN_装备|r|T132961:0|t[破布手套]
    .equip 9,3596 >>|cRXP_ENEMY_装备|r|T132606:0|t[破布护腕]
    .use 711
    .use 3596
    .engrave 10 >>|cRXP_WARN_在你的手套上刻印|r|T236298:0|t[幽灵]
    .engrave 9 >>|cRXP_WARN_将|r|T135789:0|t[灼烧]刻印到你的护腕上
    .engrave 7 >>|cRXP_WARN_在你的裤子上刻下|r|T237562:0|t[恶魔契约]
    .engrave 5 >>|cRXP_WARN_在你的胸膛上刻下|r|T136150:0|t[恶魔战术]
step << Priest
    #season 2
    .equip 10,711 >>|cRXP_WARN_装备|r|T132961:0|t[破布手套]
    .equip 6,3595 >>|cRXP_WARN_装备|r |T132513:0|t[破布腰带]
    .use 711
    .use 3595
    .engrave 6 >>在你的腰带上刻上|T136181:0|t[心灵尖刺]
    .engrave 10 >>在你的手套上刻印「暗影之言:死」|T136149:0|t
    .engrave 7 >>在你的裤子上刻上|T237570:0|t[人造人] 
step << Priest
    #season 2
    #optional
    #sticky
    >>|cRXP_WARN_装备它们并刻印|r |T237514:0|t[虚空瘟疫]|r
    .engrave 8 >>在你的|T132539:0|t[靴子]上镌刻|T237514:0|t[虚空瘟疫]
step << Rogue
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .accept 77669 >>接受血色符文
    .turnin 77669 >>交还血色符文
    .target David Trias
step << Rogue
    #season 2
    #optional
    .equip 10 >>装备 |T132952:0|t[破损的皮手套]
    .equip 6,3595 >>|cRXP_WARN_装备|r |T132513:0|t[破布腰带]
    .engrave 10 >>在你的手套上刻上|T132375:0|t[Saber Slash]
    .engrave 6 >>在你的腰带上刻上|T132303:0|t[影步]
    .use 2125 --Cracked Leather Gloves
    .use 3595 --Tattered Cloth Belt
step << Rogue
    #season 2
    #sticky
    #optional
    >>|cRXP_WARN_请注意任何|r披风/护腕|r|cRXP_WARN_掉落的物品|r|cRXP_WARN_. 装备它们并刻上相应的符文|r
    .engrave 15 >>在你的斗篷上刻上霰弹枪
    .engrave 9 >>在你的|T133830:0|t[护腕]上刻上|T236285:0|t[不公平优势]
step << Warrior
    #season 0
    #completewith next
    #label Vendor
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基巴德|r交谈
    .vendor >>出售垃圾
    .target Archibald Kava
    .money >0.1
step << Warrior
    #season 0
    #label Training1
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .train 6673 >>训练 |T132333:0|t[战斗怒吼]
    .target Dannal Stern
step << Warrior
    #season 2
    #label Training1
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .train 6673 >>训练 |T132333:0|t[战斗怒吼]
    .accept 77668 >>接受失落的符文
    .turnin 77668 >>交还失落的符文
    .target Dannal Stern
step << Warrior
    #season 2
    .equip 10 >>装备 |T132938:0|t[无光泽的链甲手套]
    .engrave 10 >>在你的手套上刻上[胜利冲刺]|T132342:0|t
    .engrave 7 >>在你的裤子上刻上|T236317:0|t[狂暴突袭]
    >>|cRXP_WARN_你很快就会通过任务获得一把双手剑|r
    .use 2385 -- Tarnished Chain Gloves
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
    #xprate >2.09
    #completewith next
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
    #xprate <2.1
    #completewith Vendor2
    +|cRXP_WARN_击杀|cRXP_ENEMY_无脑的僵尸|r 和|cRXP_ENEMY_丑陋的僵尸|r . 搜刮它们, 直到你获得价值33铜币的可出售物品(包括你的装备)|r
    .mob Mindless Zombie
    .mob Wretched Zombie
    .money >0.0033
step << Mage/Warlock/Priest
    #xprate <2.1
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
    #xprate <2.1
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
    #xprate <2.1
    #season 2
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
    .target +Maximillion << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .turnin 3098 >>交任务: |cRXP_FRIENDLY_雕文卷轴|r << Mage
    .target +Isabella << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .turnin 3097 >>交任务: |cRXP_FRIENDLY_神圣卷轴|r << Priest
    .target +Dark Cleric Duesten << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
step
    #xprate <2.1
    #season 0
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
    #xprate <2.1
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
    #xprate <2.1
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
step << Mage/Warlock/Priest
    #xprate <2.1
    .goto Tirisfal Glades,32.25,65.59,8,0
    .goto Tirisfal Glades,32.29,65.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_从他那里购买|r|T132794:0|t[清凉的泉水]|r
    >>|cRXP_WARN_不要低于1银币|r << Mage/Warlock/Priest
    .vendor >>出售垃圾
    .target Joshua Kien
    .money >0.1
    .isOnQuest 3901
    .itemcount 159,<20
step
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sarvis|r和|cRXP_FRIENDLY_Elreth|r交谈
    .turnin 3901 >>交任务: |cRXP_FRIENDLY_断骨骷髅|r
    .target +Shadow Priest Sarvis
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .turnin 376 >>交任务: |cRXP_FRIENDLY_被诅咒者|r
    .accept 6395 >>接任务: |cRXP_LOOT_玛拉的遗愿|r
    .target +Novice Elreth
    .goto Tirisfal Glades,30.86,66.05
step << Mage/Warlock/Priest
    #xprate >2.09
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
    #xprate >2.09
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
    #xprate >2.09
    #season 2
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
    .target +Shadow Priest Sarvis
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .turnin 376 >>交任务: |cRXP_FRIENDLY_被诅咒者|r
    .accept 6395 >>接任务: |cRXP_LOOT_玛拉的遗愿|r
    .target +Novice Elreth
    .goto Tirisfal Glades,30.86,66.05
    .turnin 3099 >>交任务: |cRXP_FRIENDLY_被污染的卷轴|r << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .target +Maximillion << Warlock
    .turnin 3098 >>交任务: |cRXP_FRIENDLY_雕文卷轴|r << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .target +Isabella << Mage
    .turnin 3097 >>交任务: |cRXP_FRIENDLY_神圣卷轴|r << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
    .target +Dark Cleric Duesten << Priest
step
    #xprate >2.09
    #season 0
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
    .target +Shadow Priest Sarvis
    .goto Tirisfal Glades,31.35,66.21,10,0
    .goto Tirisfal Glades,30.84,66.20
    .turnin 376 >>交任务: |cRXP_FRIENDLY_被诅咒者|r
    .accept 6395 >>接任务: |cRXP_LOOT_玛拉的遗愿|r
    .target +Novice Elreth
    .goto Tirisfal Glades,30.86,66.05
    .turnin 3099 >>交任务: |cRXP_FRIENDLY_被污染的卷轴|r << Warlock
    .goto Tirisfal Glades,30.91,66.34 << Warlock
    .target +Maximillion << Warlock
    .turnin 3098 >>交任务: |cRXP_FRIENDLY_雕文卷轴|r << Mage
    .goto Tirisfal Glades,30.94,66.06 << Mage
    .target +Isabella << Mage
    .turnin 3097 >>交任务: |cRXP_FRIENDLY_神圣卷轴|r << Priest
    .goto Tirisfal Glades,31.11,66.02 << Priest
    .target +Dark Cleric Duesten << Priest
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
    #season 0
    .goto Tirisfal Glades,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .train 172 >>训练 |T136118:0|t[腐蚀之触]
    .target Maximillion
step << Mage
    #season 0
    .goto Tirisfal Glades,30.94,66.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .train 116 >>训练 |T135846:0|t[冰箭]
    .target Isabella
step
    #xprate <1.5
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵萨尔坦|r和|r执行官阿伦|r交谈
    .accept 3902 >>接任务: |cRXP_LOOT_捡破烂|r
    .goto Tirisfal Glades,31.61,65.62
    .target +Deathguard Saltain
    .accept 380 >>接任务: |cRXP_LOOT_夜行蜘蛛洞穴|r
    .goto Tirisfal Glades,32.15,66.01
    .target +Executor Arren
step
    #xprate >1.49
    .goto Tirisfal Glades,31.35,66.21,10,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_执行官阿伦|r交谈
    .accept 380 >>接任务: |cRXP_LOOT_夜行蜘蛛洞穴|r
    .goto Tirisfal Glades,32.15,66.01
    .target Executor Arren
step << Rogue/Warrior
    .goto Tirisfal Glades,32.42,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿基巴德|r交谈
    .vendor >>出售垃圾
    .target Archibald Kava
    .money >0.1
    .isOnQuest 3095 << Warrior
    .isOnQuest 3096 << Rogue
step << Warrior
    #season 2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Dannal Stern
    .money <0.02
 step << Warrior
    #season 2
    #label Training2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Dannal Stern
    .money <0.01
step << Warrior
    #season 0
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .train 100 >>训练 |T132337:0|t[冲锋]
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Dannal Stern
    .money <0.02
 step << Warrior
    #season 0
    #label Training2
    .goto Tirisfal Glades,32.68,65.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .train 772 >>训练 |T132155:0|t[撕裂]
    .target Dannal Stern
    .money <0.01
step << Rogue
    #season 2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 3096 >>交任务: |cRXP_FRIENDLY_密文卷轴|r
    .target David Trias
step << Rogue
    #season 0
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 3096 >>交任务: |cRXP_FRIENDLY_密文卷轴|r
    .train 53 >>训练 |T132090:0|t[背刺]
    .money <0.04
    .target David Trias
step << Rogue
    #season 0
    #label Training2
    .goto Tirisfal Glades,32.53,65.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 3096 >>交任务: |cRXP_FRIENDLY_密文卷轴|r
    .target David Trias
step
    #xprate >1.49
    #optional
    #completewith NightWebStart
    .abandon 3902 >>放弃捡破烂任务 丧钟之谷
step
    #xprate <1.5
    #loop
	.goto Tirisfal Glades,32.37,64.37,
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
    #label NightWebStart
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
step << Warlock
    #season 2
    #completewith RuneofHaunting
    >>击杀洞穴内的|cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob Night Web Spider
step << Warrior
    #season 2
    #completewith RuneofVictoryRush
    >>击杀洞穴内的|cRXP_ENEMY_夜行蜘蛛|r
	.complete 380,2 --Kill Night Web Spider (x8)
    .mob Night Web Spider
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
step
    #xprate <1.5
    #softcore
    #completewith Scavenging
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step
    #xprate >1.49
    #softcore
    #completewith NightWebH
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
step << Warlock
    #softcore
    #completewith ScarletC
    .cast 688 >>|cRXP_WARN_Cast|r|T136218:0|t[召唤地狱火]
step << skip
    #hardcore
    #completewith next
    .goto 1420,26.027,60.607,-1
    .goto 1420,24.508,59.360,-1
    .goto 1420,23.572,59.239,-1
    .goto Tirisfal Glades,31.08,64.88,30 >>|cRXP_WARN_在洞穴内执行登出跳过, 方法是跳到碎纸机和井口或卡在墙上的木板上, 然后登出并重新登录|r
    >>|cRXP_WARN_或者跑回丧钟镇|r
step
    #xprate <1.5
    #label Scavenging
    .goto Tirisfal Glades,31.61,65.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Saltain|r交谈
    .turnin 3902 >>交任务: |cRXP_FRIENDLY_捡破烂|r
    .target Deathguard Saltain
step
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
    #softcore
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    .target Spirit Healer
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
    #season 2
    .goto Tirisfal Glades,31.36,66.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_符文经纪人|cRXP_FRIENDLY_符文经纪人|r交谈
    >>|cRXP_WARN_确保不要将可以装备的物品卖给商人|r
    .vendor >>|cRXP_BUY_从商人那里购买所有你需要的|T134419:0|t|cRXP_WARN_[符文]|r|r
    .target Rune Broker
    .skipgossip
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
    .xp 5+1900 >>升级至1900+/2800经验值
step
    .goto Tirisfal Glades,38.24,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡尔文|r交谈
    .accept 8 >>接任务: |cRXP_LOOT_潜行者的交易|r
    .target Calvin Montague

]])

RXPGuides.RegisterGuide([[
#classic
#xprate >1.99
<< Horde
#name 7-13 提瑞斯法林地
#displayname 7-13 提瑞斯法林地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 联盟 1-22
#defaultfor Undead
#next 13-20 贫瘠之地

step
    .goto Tirisfal Glades,40.91,54.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_西米尔|r交谈
    .accept 365 >>接任务: |cRXP_LOOT_悲伤之地|r
    .target Deathguard Simmer
step << skip
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛尔多|r交谈
    >>|cRXP_WARN_他是一个在通往布瑞尔的路上巡逻的憎恶怪物|r
    .accept 5481 >>接任务: |cRXP_LOOT_葛尔多的任务|r
    .unitscan Gordo
step << Priest
    .goto Tirisfal Glades,52.59,55.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博文·布里斯博埃斯|r交谈
    .train 3908 >>学习 |T136249:0|t[裁缝]. 收集你的 |T132889:0|t[亚麻布], 这样你以后就能制作法杖了
    .target Bowen Brisboise
step
    #softcore
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处重生, 或前往布瑞尔
    .target Spirit Healer
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
step
    #xprate >1.49
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    >>|cRXP_FRIENDLY_Gretchen|r|cRXP_WARN_在旅店二楼|r
    .accept 375 >>接任务: |cRXP_LOOT_死亡之寒|r
    .target Gretchen Dedmar
    .xp <7,1
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
    #season 0
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 1757 >>训练 |T136189:0|t[邪恶打击]
    .target Marion Call
    .money <0.01
step << Rogue
    #season 2
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 1757 >>训练 |T136189:0|t[邪恶打击]
    .train 921 >>训练 |T133644:0|t[扒窃]
    .target Marion Call
    .money <0.02
step << Rogue
    #optional
    #season 2
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 921 >>训练 |T133644:0|t[扒窃]
    .target Marion Call
    .money >0.02
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
    .train 20397 >>|cRXP_WARN_使用|r|T133738:0|t[血契法典]
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
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r <<Warrior/Rogue
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
    >>|cRXP_WARN_你需要学会低级治疗术(等级2)才能完成此任务|r
    .complete 5650,1 --Heal and fortify Deathguard Kel (1)
    .target Deathguard Kel
step << skip
    #completewith Claws
    >>拾取地面上的|cRXP_LOOT_阴暗草|r
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
step << skip
    #label GloomWeed
    #loop
    .goto Tirisfal Glades,39.55,50.64,0
    .goto Tirisfal Glades,44.43,57.33,0
    .goto Tirisfal Glades,39.55,50.64,50,0
    .goto Tirisfal Glades,44.43,57.33,50,0
    >>完成拾取地面上的|cRXP_LOOT_阴暗草|r
    .complete 5481,1 --Gloom Weed (3)
step << Warrior
    #optional
    #season 2
    #xprate >1.49
    #completewith DBlood
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
    .isOnQuest 375
step
    #optional
    #xprate >1.49
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .isOnQuest 375
step
    #xprate >1.49
    #label DBlood
    #loop
    .goto Tirisfal Glades,43.97,57.27,0
    .goto Tirisfal Glades,40.57,47.23,0
    .goto Tirisfal Glades,48.03,53.43,80,0
    .goto Tirisfal Glades,43.97,57.27,80,0
    .goto Tirisfal Glades,41.01,55.94,60,0
    .goto Tirisfal Glades,40.57,47.23,60,0
    .goto Tirisfal Glades,40.89,42.77,60,0
    .goto Tirisfal Glades,39.12,39.85,60,0
    >>击杀|cRXP_ENEMY_Darkhounds|r. 击败它们以获取其|cRXP_LOOT_Blood|r
    .complete 367,1 --Darkhound Blood (5)
    .mob Decrepit Darkhound
    .mob Cursed Darkhound
step << Priest
    #ah
    #completewith FinishRings
    >>|cRXP_WARN_开始收集 3 堆|r|T132889:0|t[亚麻布]|cRXP_WARN_. 这将用于制作|r|T135139:0|t[次级魔法杖]|cRXP_WARN_稍后|r
    >>|cRXP_WARN_如果你不想这么做, 或者更希望稍后从拍卖行购买, 请跳过此步骤|r
    .collect 2589,60 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Priest
    #ssf
    #completewith FinishRings
    >>|cRXP_WARN_开始收集 3 堆|r|T132889:0|t[亚麻布]|cRXP_WARN_. 这将用于制作|r|T135139:0|t[次级魔法杖]|cRXP_WARN_稍后|r
    .collect 2589,60 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step << Rogue
    #season 2
    #completewith next
    >>使用 |T133644:0|t[盗贼技能:扒窃] 并击杀 |cRXP_ENEMY_提瑞斯法农夫|r和 |cRXP_ENEMY_提瑞斯法雇农|r. 从他们身上搜刮出 |T134327:0|t[|cRXP_LOOT_左上角地图碎片|r]
    .collect 208036,1 --Top-Left Map Piece (1)
    .mob Tirisfal Farmer
    .mob Tirisfal Farmhand
    .train 400095,1
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
step << Rogue
    #season 2
    #loop
    .goto Tirisfal Glades,36.63,50.09,0
    .goto Tirisfal Glades,37.20,52.17,50,0
    .goto Tirisfal Glades,36.64,50.09,50,0
    .goto Tirisfal Glades,36.10,49.07,50,0
    .goto Tirisfal Glades,35.08,49.82,50,0
    .goto Tirisfal Glades,35.30,50.91,50,0
    .goto Tirisfal Glades,34.57,51.58,50,0
    .goto Tirisfal Glades,36.63,50.09,50,0
    >>使用 |T133644:0|t[盗贼技能:扒窃] 并击杀 |cRXP_ENEMY_提瑞斯法农夫|r和 |cRXP_ENEMY_提瑞斯法雇农|r. 从他们身上搜刮出 |T134327:0|t[|cRXP_LOOT_左上角地图碎片|r]
    .collect 208036,1 --Top-Left Map Piece (1)
    .mob Tirisfal Farmer
    .mob Tirisfal Farmhand
    .train 400095,1
step << Rogue/Mage/Priest
    #season 2
    #completewith next
    >>使用|T133644:0|t[劫掠]技能并击杀|cRXP_ENEMY_血色战士|r. 击杀后搜刮出|T134327:0|t[|cRXP_LOOT_右上角地图碎片|r] << Rogue
    >>击杀|cRXP_ENEMY_血色战士|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_法术注释:MILEGIN VALF|r] << Mage
    >>击杀|cRXP_ENEMY_血色战士|r. 击杀后搜刮出 |T135975:0|t[|cRXP_FRIENDLY_被亵渎的堡垒预言|r] << Priest
    >>|cRXP_WARN_提瑞斯法林地的任意血色人类生物都有可能掉落地图碎片|r << Rogue
    >>|cRXP_WARN_提瑞斯法的任意血色人类生物都有可能掉落法术笔记|r << Mage
    >>|cRXP_WARN_提瑞斯法的任何血色人类生物都有可能掉落预言|r << Priest
    .collect 208035,1 << Rogue --Top-Right Map Piece (1)
    .collect 203752,1 << Mage --Spell Notes: MILEGIN VALF (1)
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel (1)
    .mob Scarlet Warrior
    .train 400095,1 << Rogue
    .train 401768,1 << Mage
    .train 402852,1 << Priest
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
step << Rogue/Mage/Priest
    #season 2
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
    >>使用|T133644:0|t[劫掠]技能并击杀|cRXP_ENEMY_血色战士|r. 击杀后搜刮出|T134327:0|t[|cRXP_LOOT_右上角地图碎片|r] << Rogue
    >>击杀|cRXP_ENEMY_血色战士|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_法术注释:MILEGIN VALF|r] << Mage
    >>击杀|cRXP_ENEMY_血色战士|r. 击杀后搜刮出 |T135975:0|t[|cRXP_FRIENDLY_被亵渎的堡垒预言|r] << Priest
    |T134419:0|t[|cRXP_FRIENDLY_Rune of Devastate|r]
    >>|cRXP_WARN_提瑞斯法林地的任意血色人类生物都有可能掉落地图碎片|r << Rogue
    >>|cRXP_WARN_提瑞斯法的任意血色人类生物都有可能掉落法术笔记|r << Mage
    >>|cRXP_WARN_提瑞斯法的任何血色人类生物都有可能掉落预言|r << Priest
    .collect 208035,1 << Rogue --Top-Right Map Piece (1)
    .collect 203752,1 << Mage --Spell Notes: MILEGIN VALF (1)
    .collect 205947,1 << Priest --Prophecy of a Desecrated Citadel (1)
    .mob Scarlet Warrior
    .train 400095,1 << Rogue
    .train 401768,1 << Mage
    .train 402852,1 << Priest
step << Mage
    #season 2
    .collect 211779,1 >>你需要从|cRXP_FRIENDLY_试剂商|r处获得一个|T135933:0|t[理解之魅]才能使用该物品
    .train 401768 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术备注:米尔金·瓦尔夫|r]|cRXP_WARN_学习|r|T135820:0|t[炽焰]
    .use 203752
    .itemcount 203752,1
step << Mage/Priest
    #season 2
    .goto Tirisfal Glades,25.6,48.2
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: RING SEFF OSTROF|r] << Mage
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出物品:|T136222:0|t[|cRXP_FRIENDLY_黑暗意图的记忆|r] << Priest
    >>|cRXP_WARN_这是一个7级精英, 不容易击杀. 如果太难, 现在可以跳过他|r
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 205940,1 << Priest --Memory of Dark Purpose (1)
    .mob Gillgar
    .train 401765,1 << Mage
    .train 425216,1 << Priest
step << Mage
    #season 2
    .collect 211779,1 >>你需要从|cRXP_FRIENDLY_试剂商|r处获得一个|T135933:0|t[理解之魅]才能使用该物品
    .train 401765 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_ 法术说明:RING SEFF OSTROF|r] |cRXP_WARN_来学习|r |T236227:0|t[冰霜之指]
    .use 203753
    .itemcount 203753,1
step
    #hardcore
    #completewith BrillTurnin1
    .hs >>传送回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,>0,1
step
    #hardcore
    #completewith BrillTurnin1
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,<0
step
    #softcore
    #completewith BrillTurnin1
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处重生
step << skip
    #softcore
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Holland|r交谈, 他在墓地附近巡逻
    .turnin 5481 >>交任务: |cRXP_FRIENDLY_葛尔多的任务|r
    .accept 5482 >>接任务: |cRXP_LOOT_末日草|r
    .target Junior Apothecary Holland
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r和|cRXP_FRIENDLY_Johaan|r和|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 404 >>交任务: |cRXP_FRIENDLY_腐烂的爪子|r
    .accept 426 >>接任务: |cRXP_LOOT_磨坊告急|r
    .target +Deathguard Dillinger
    .goto Tirisfal Glades,58.20,51.43
    .turnin 367 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .turnin 365 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .accept 368 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .accept 407 >>接任务: |cRXP_LOOT_悲伤之地|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 427 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 370 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .isQuestComplete 367
step
    #label BrillTurnin1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r和|cRXP_FRIENDLY_Johaan|r和|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 404 >>交任务: |cRXP_FRIENDLY_腐烂的爪子|r
    .accept 426 >>接任务: |cRXP_LOOT_磨坊告急|r
    .target +Deathguard Dillinger
    .goto Tirisfal Glades,58.20,51.43
    .turnin 365 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .accept 407 >>接任务: |cRXP_LOOT_悲伤之地|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 427 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 370 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
step
    #xprate >1.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的|cRXP_FRIENDLY_亡灵卫兵伯吉斯|r和|cRXP_FRIENDLY_通缉告示|r和|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .accept 374 >>接任务: |cRXP_LOOT_死亡证明|r
    .target +Deathguard Burgess
    .goto Tirisfal Glades,60.93,52.01
    .accept 398 >>接任务: |cRXP_LOOT_悬赏：蛆眼|r
    .goto Tirisfal Glades,60.74,51.52
    .accept 358 >>接任务: |cRXP_LOOT_盗墓贼|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
 step
    #xprate >1.49
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate >1.49
    .goto Tirisfal Glades,61.97,51.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店后方楼下被俘虏的血色十字军俘虏交谈|cRXP_FRIENDLY_血色十字军俘虏|r
    .turnin 407 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .target Captured Scarlet Zealot
step
    #xprate >1.49
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
    .turnin 5650 >>交任务: |cRXP_FRIENDLY_黑暗之衣|r
    .train 591 >>训练 |T135924:0|t[惩戒]
    .train 17 >>训练 |T135940:0|t[真言术:盾]
    .target Dark Cleric Beryl
step
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    >>|cRXP_FRIENDLY_Gretchen|r|cRXP_WARN_在旅店二楼|r
    .accept 375 >>接任务: |cRXP_LOOT_死亡之寒|r
    .target Gretchen Dedmar
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 139 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <8,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 205 >>训练你的职业法术
    .target Cain Firesong
    .xp <8,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 284 >>训练你的职业法术
    .target Austil de Mon
    .xp <8,1
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 6760 >>训练你的职业法术
    .target Marion Call
    .xp <8,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 980 >>训练你的职业法术
    .target Rupert Boch
    .xp <8,1
step << Rogue/Warrior
    .goto Tirisfal Glades,61.81,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_妮拉|r交谈
    >>|cRXP_WARN_试着在等待期间(比如等齐柏林飞艇时)完成这些任务|r
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Nurse Neela
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
    .collect 2494,1,367,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith NewPlague1
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
    .collect 2488,1,367,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #completewith NewPlague1
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << skip
    #hardcore
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Holland|r交谈, 他在墓地附近巡逻
    .turnin 5481 >>交任务: |cRXP_FRIENDLY_葛尔多的任务|r
    .accept 5482 >>接任务: |cRXP_LOOT_末日草|r
    .target Junior Apothecary Holland
step << Warrior
    #season 2
    #xprate <1.5
    #completewith DuskbatTrophy1
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #xprate <1.5
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #xprate <1.5
    #loop
    .goto Tirisfal Glades,58.20,58.15,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    >>击杀 |cRXP_ENEMY_Darkhounds|r. 击败它们获取 |cRXP_LOOT_Blood|r
    .complete 367,1 --Darkhound Blood (5)
    .mob Decrepit Darkhound
step << Rogue/Warrior
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .xp >7+3960,1
step << Rogue/Warrior
    #xprate <1.5
    #optional
    #label DuskbatTrophy1
    #loop
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .xp 7+3260 >>升级至3260/4500
--XX 700 (375)+540(367)
step
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .xp >7+3690,1
step
    #xprate >1.49
    #optional
    #label DuskbatTrophy1
    .goto Tirisfal Glades,56.45,62.62,0
    .goto Tirisfal Glades,58.20,58.15,50,0
    .goto Tirisfal Glades,57.98,61.66,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .goto Tirisfal Glades,54.73,64.28,50,0
    .goto Tirisfal Glades,52.84,62.26,50,0
    .goto Tirisfal Glades,50.52,61.21,50,0
    .goto Tirisfal Glades,47.88,60.87,50,0
    .goto Tirisfal Glades,46.09,59.70,50,0
    .goto Tirisfal Glades,43.49,61.81,50,0
    .goto Tirisfal Glades,56.45,62.62,50,0
    .xp 7+2640 >>升级至2640/4500
--XX 700 (375)+540(367)
step
    #xprate <1.5
    #hardcore
    #completewith NewPlague1
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
step
    #xprate <1.5
    #softcore
    #completewith NewPlague1
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #label NewPlague1
    #optional
    .goto Tirisfal Glades,59.45,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 367 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 368 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target Apothecary Johaan
step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的|cRXP_FRIENDLY_亡灵卫兵伯吉斯|r和|cRXP_FRIENDLY_通缉告示|r和|cRXP_FRIENDLY_执政官塞弗伦|r交谈
    .accept 374 >>接任务: |cRXP_LOOT_死亡证明|r
    .target +Deathguard Burgess
    .goto Tirisfal Glades,60.93,52.01
    .accept 398 >>接任务: |cRXP_LOOT_悬赏：蛆眼|r
    .goto Tirisfal Glades,60.74,51.52
    .accept 358 >>接任务: |cRXP_LOOT_盗墓贼|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step << Priest
    #xprate <1.5
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 139 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <8,1
step << Mage
    #xprate <1.5
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 205 >>训练你的职业法术
    .target Cain Firesong
    .xp <8,1
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 284 >>训练你的职业法术
    .target Austil de Mon
    .xp <8,1
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 6760 >>训练你的职业法术
    .target Marion Call
    .xp <8,1
step << Warlock
    #xprate <1.5
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 980 >>训练你的职业法术
    .target Rupe
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >>出售垃圾, 如果能凑够买一把 |T135641:0|t[卷刃的剑] (4s 01c) 的钱. 如果不够, 稍后再回来处理
    .target Oliver Dwor
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_Oliver|r|cRXP_BUY_交谈. 从他那里购买|r |T135641:0|t[卷刃的剑] |r
    .collect 2494,1,398,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #xprate <1.5
    #completewith Doomweed
    +装备 |T135641:0|t[卷刃的剑]
    .use 2494
    .itemcount 2494,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥利弗|r交谈
    .vendor >>出售垃圾, 如果钱够买一把 |T135321:0|t[步兵剑](5银36铜), 就直接购买. 如果钱不够, 稍后再来
    .target Oliver Dwor
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #xprate <1.5
    .goto Tirisfal Glades,60.12,53.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_奥利弗|r|cRXP_BUY_交谈. 从他那里购买|r|T135321:0|t[步兵剑]|r
    .collect 2488,1,398,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #xprate <1.5
    #completewith Doomweed
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Rogue
    #season 2
    #completewith MaggotEye
    >>使用[窃取]并击杀腐皮豺狼人. 掠夺他们以获得 [|cRXP_LOOT_左下角地图碎片|r]
    .collect 208038,1 --Bottom-Left Map Piece (1)
    .mob Rot Hide Mongrel
    .mob Rote Hide Gnoll
    .mob Rot Hide Graverobber
    .train 400095,1
step << Warrior
    #season 2
    #completewith MaggotEye
    >>击杀任意类型的|cRXP_ENEMY_Rote Hide Gnoll|r, 击败后拾取其掉落的|cRXP_LOOT_Severed Gnoll Head|r
    .collect 204478,1 --Severed Gnoll Head (1)
    .mob Rot Hide Mongrel
    .mob Rote Hide Gnoll
    .mob Rot Hide Graverobber
    .train 403475,1
step << skip
    #completewith next
    >>拾取地面上的|cRXP_LOOT_末日草|r
    >>|cRXP_WARN_它们出现在豺狼人地区靠近树木的地方|r
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482
step
    #loop
    .goto Tirisfal Glades,55.24,42.54,0
    .goto Tirisfal Glades,56.31,39.67,40,0
    .goto Tirisfal Glades,54.71,41.19,40,0
    .goto Tirisfal Glades,53.90,43.93,40,0
    .goto Tirisfal Glades,55.24,42.54,40,0
    .goto Tirisfal Glades,56.43,43.92,40,0
    >>击杀|cRXP_ENEMY_腐皮盗墓贼|r. 从他们身上搜刮|cRXP_LOOT_秽液|r
    .complete 358,1 --Rot Hide Graverobber (8)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob Rot Hide Graverobber
step
    #completewith next
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r. 击败他们后搜刮其掉落的|cRXP_LOOT_Ichor|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob Rot Hide Mongrel
step << skip
    #label Doomweed
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
    >>拾取地面上的|cRXP_LOOT_末日草|r
    >>|cRXP_WARN_它们出现在豺狼人地区靠近树木的地方|r
    .complete 5482,1 --Doom Weed (10)
    .isOnQuest 5482
step
    #optional
    #label Doomweed
step << Mage
    #season 2
    #optional
    #completewith MaggotEye
    .goto Tirisfal Glades,59.84,33.17,0
    .goto Tirisfal Glades,58.38,35.28,0
    .goto Tirisfal Glades,60.09,37.01,0
    >>对|cRXP_ENEMY_Odd Melons|r施放 |T136071:0|t[变形术]
    >>拾取地面上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob Odd Melon
    .train 415942,1
    .train 118,3
step
    #completewith MaggotEye
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r. 击败他们后搜刮其掉落的|cRXP_LOOT_Ichor|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob Rot Hide Mongrel
step
    #label MaggotEye
    .goto Tirisfal Glades,58.66,30.77
    >>击杀|cRXP_ENEMY_蛆眼|r. 击败后搜刮他的|cRXP_LOOT_爪|r
    .complete 398,1 --Maggot Eye's Paw (1)
    .mob Maggot Eye
step
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀|cRXP_ENEMY_混血腐皮豺狼人|r. 击败他们后搜刮其掉落的|cRXP_LOOT_Ichor|r
    .complete 358,2 --Rot Hide Mongrel (5)
    .complete 358,3 --Embalming Ichor (8)
    .disablecheckbox
    .mob Rot Hide Mongrel
step
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀|cRXP_ENEMY_腐皮豺狼人|r. 击杀后搜刮其掉落的|cRXP_LOOT_污秽之液|r
    .complete 358,3 --Embalming Ichor (8)
    .mob Rot Hide Mongrel
    .mob Rote Hide Gnoll
    .mob Rot Hide Graverobber
step << Rogue
    #season 2
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>使用[窃取]并击杀腐皮豺狼人. 掠夺他们以获得 [|cRXP_LOOT_左下角地图碎片|r]
    .collect 208038,1 --Bottom-Left Map Piece (1)
    .mob Rot Hide Mongrel
    .mob Rot Hide Graverobber
    .mob Rot Hide Gnoll
    .train 400095,1
step << Warrior
    #season 2
    #loop
    .goto Tirisfal Glades,59.77,32.37,0
    .goto Tirisfal Glades,58.71,35.47,50,0
    .goto Tirisfal Glades,59.77,32.37,50,0
    .goto Tirisfal Glades,58.25,31.28,50,0
    .goto Tirisfal Glades,60.08,37.88,50,0
    >>击杀任意类型的|cRXP_ENEMY_Rote Hide Gnoll|r, 击败后拾取其掉落的|cRXP_LOOT_Severed Gnoll Head|r
    .collect 204478,1 --Severed Gnoll Head (1)
    .mob Rot Hide Mongrel
    .mob Rote Hide Gnoll
    .mob Rot Hide Graverobber
    .train 403475,1
step << Mage
    #xprate >2.09
    #season 2
    #loop
    .goto Tirisfal Glades,59.84,33.17,0
    .goto Tirisfal Glades,58.38,35.28,0
    .goto Tirisfal Glades,60.09,37.01,0
    .goto Tirisfal Glades,59.84,33.17,40,0
    .goto Tirisfal Glades,58.38,35.28,40,0
    .goto Tirisfal Glades,60.09,37.01,40,0
    >>对|cRXP_ENEMY_Odd Melons|r施放 |T136071:0|t[变形术]
    >>拾取地面上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob Odd Melon
    .train 415942,1
    .train 118,3
step << Mage
    #xprate >2.09
    #season 2
    >>|cRXP_WARN_使用|r|T134332:0|t|cRXP_LOOT_[药剂师笔记]|r|cRXP_WARN_制作|r|T134332:0|t|cRXP_LOOT_[法术笔记:启迪]|r
    .collect 203749,1 --Spell Notes: Enlightenment (1)
    .use 208183 --Apothecary Notes
    .train 415942,1
    .itemcount 208183,6
step << Mage
    #xprate >2.09
    #season 2
    .train 415942 >>|cRXP_WARN_使用|r|T134332:0|t|cRXP_LOOT_[法术说明:启蒙]|r|cRXP_WARN_来学习|r|T133815:0|t[雕刻宝箱 - 启蒙]
    .use 203749
    .itemcount 203749,1 --Spell Notes: Enlightenment (1)
step << Warrior
    #season 2
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
    >>击杀|cRXP_ENEMY_Vile Vin Murlocs|r. 击败后可获得他们的|cRXP_LOOT_Scales|r和|cRXP_LOOT_Severed Murloc Head|r
    .complete 368,1 --Vile Fin Scale (5)
    .collect 204477,1 --Severed Murloc Head (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 403475,1
step << Rogue
    #season 2
    #completewith MurlocVins
    >>使用 |T133644:0|t[扒窃]并击杀|cRXP_ENEMY_邪鳍鱼人|r, 以获得 |T134241:0|t[|cRXP_LOOT_沉船宝箱钥匙|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .train 400081,1
step << Rogue
    #season 2
    #completewith RuneofPrecision
    >>施放 |T133644:0|t[扒窃] 并击杀|cRXP_ENEMY_Vile Vin Murlocs|r. 掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_右下角地图碎片|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .train 400095,1
step
    #label MurlocVins
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
    >>击杀|cRXP_ENEMY_Vile Vin Murlocs|r. 击败他们后搜刮其|cRXP_LOOT_Scales|r
    .complete 368,1 --Vile Fin Scale (5)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
step << Rogue
    #season 2
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
    >>使用 |T133644:0|t[扒窃]并击杀|cRXP_ENEMY_邪鳍鱼人|r, 以获得 |T134241:0|t[|cRXP_LOOT_沉船宝箱钥匙|r]
    .collect 208007,1 --Shipwreck Cache Key (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 400081,1
step << Rogue
    #season 2
    .goto Tirisfal Glades,66.66,24.41
    >>掠夺|cRXP_PICK_沉船宝箱|r以获得 |T134419:0|t[|cRXP_FRIENDLY_精准符文|r]
    .collect 204174,1 --Rune of Precision (1)
    .train 400081,1
step << Rogue
    #season 2
    #label RuneofPrecision
    .train 400081 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_精准符文|r]|cRXP_WARN_来训练|r|T135610:0|t[双眼之间]
    .use 204174
    .itemcount 204174,1
step << Rogue
    #season 2
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
    >>施放 |T133644:0|t[扒窃] 并击杀|cRXP_ENEMY_Vile Vin Murlocs|r. 掠夺他们以获得 |T134327:0|t[|cRXP_LOOT_右下角地图碎片|r]
    .collect 208037,1 --Bottom-Right Map Piece (1)
    .mob Vile Fin Puddlejumper
    .mob Vile Fin Minor Oracle
    .mob Vile Fin Muckdweller
    .train 400095,1
step << Rogue
    #season 2
    .use 208036 >>|cRXP_WARN_使用|r|T134327:0|t[|cRXP_LOOT_地图碎片|r]|cRXP_WARN_合成|r|T134269:0|t[|cRXP_LOOT_提瑞斯法藏宝图|r]
    .collect 208034,1 --Tirisfal Treasure Map (1)
    .train 400095,1
step
    #hardcore
    #completewith DoomedWeed
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
step
    #softcore
    #completewith DoomedWeed
    .goto Tirisfal Glades,64.50,29.41
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
    >>|cRXP_WARN_确保你死亡的位置在(或位于)前往箭头的西边|r
step << skip
    #label DoomedWeed
    #loop
    .goto Tirisfal Glades,57.71,48.96,0
    .goto Tirisfal Glades,58.29,49.80,30,0
    .goto Tirisfal Glades,57.71,48.96,30,0
    .goto Tirisfal Glades,59.26,46.73,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Holland|r交谈, 他在墓地附近巡逻
    .turnin 5482 >>交任务: |cRXP_FRIENDLY_末日草|r
    .target Junior Apothecary Holland
step << Rogue
    #season 2
    .goto Tirisfal Glades,52.89,54.03
    .use 208034 >>|cRXP_WARN_使用|r |T134269:0|t[|cRXP_LOOT_提瑞斯法藏宝图|r] |cRXP_WARN_桥下|r
    >>拾取生成的|cRXP_PICK_Buried Treasure|r宝箱, 该宝箱会掉落 |T134419:0|t[|cRXP_FRIENDLY_Rune of Quick Draw|r]
    .collect 203991,1 --Rune of Quick Draw (1s)
    .train 400095,1
step << Rogue
    #season 2
    .train 400095 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_迅捷拔枪符文|r]|cRXP_WARN_来训练|r|T134536:0|t[迅捷拔枪]
    .use 203991
    .itemcount 203991,1
step
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r和|cRXP_FRIENDLY_齐甘德|r和|cRXP_FRIENDLY_-塞弗伦|r交谈
    .turnin 368 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 369 >>接任务: |cRXP_LOOT_新的瘟疫|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 398 >>交任务: |cRXP_FRIENDLY_悬赏：蛆眼|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .turnin 358 >>交任务: |cRXP_FRIENDLY_盗墓贼|r
    .accept 405 >>接任务: |cRXP_LOOT_流浪的巫妖|r << Warlock
    .accept 359 >>接任务: |cRXP_LOOT_亡灵卫兵的职责|r
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
step
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔汉|r和|cRXP_FRIENDLY_齐甘德|r和|cRXP_FRIENDLY_-塞弗伦|r交谈
    .turnin 368 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .target +Apothecary Johaan
    .goto Tirisfal Glades,59.45,52.40
    .turnin 398 >>交任务: |cRXP_FRIENDLY_悬赏：蛆眼|r
    .target +Executor Zygand
    .goto Tirisfal Glades,60.58,51.77
    .turnin 358 >>交任务: |cRXP_FRIENDLY_盗墓贼|r
    .accept 405 >>接任务: |cRXP_LOOT_流浪的巫妖|r << Warlock
    .target +Magistrate Sevren
    .goto Tirisfal Glades,61.26,50.84
step
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔曼|r交谈
    .accept 354 >>接任务: |cRXP_LOOT_阿加曼德家族|r
    .accept 362 >>接任务: |cRXP_LOOT_闹鬼的磨坊|r
    .target Coleman Farthing
step << !Warlock
    #xprate >1.49
    #optional
    #completewith AgamandStart
    .abandon 405 >>放弃流浪的巫妖
step
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 139 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <8,1
    .xp >10,1
step << Priest
    #optional
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 8092 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <10,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 205 >>训练你的职业法术
    .target Cain Firesong
    .xp <8,1
    .xp >10,1
step << Mage
    #optional
    .goto Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cain|r交谈
    --.accept 1881 >>接任务: |cRXP_LOOT_安娜斯塔西娅|r
    .train 122 >>训练你的职业法术
    .target Cain Firesong
    .xp <10,1
step << Warrior
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 284 >>训练你的职业法术
    .target Austil de Mon
    .xp <8,1
    .xp >10,1
step << Warrior
    #optional
    .abandon 1505 >>放弃老兵犹塞克
    .isOnQuest 1505
step << Warrior
    #optional
    .abandon 1498 >>放弃防御之道
    .isOnQuest 1498
step << Warrior
    #optional
    .goto Tirisfal Glades,61.85,52.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .trainer >>训练你的职业法术
    .accept 1818 >>接任务: |cRXP_LOOT_迪林格尔|r
    .target Austil de Mon
    .xp <10,1
    .isQuestAvailable 1498
step << Rogue
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 6760 >>训练你的职业法术
    .target Marion Call
    .xp <8,1
    .xp >10,1
step << Rogue
    #optional
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Marion|r交谈
    .train 674 >>训练你的职业法术
    --.accept 1885 >>接任务: |cRXP_LOOT_米奈特·卡加德|r
    .target Marion Call
    .xp <10,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|Rupert|cRXP_FRIENDLY_Rupert|r交谈
    .train 980 >>训练你的职业法术
    .target Rupert Boch
    .xp <8,1
    .xp >10,1
step << Warlock
    #optional
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 707 >>训练你的职业法术
    .target Rupert Boch
    .xp <10,1
step << Warlock
    #optional
    .goto Tirisfal Glades,61.62,52.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_埃格隆|r交谈
    .accept 1478 >>接任务: |cRXP_LOOT_哈加尔的召唤|r
    .target Ageron Kargal
    .xp <10,1
step << Warlock
    #xprate >2.09
    .goto Tirisfal Glades,61.62,52.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_埃格隆|r交谈
    .accept 1478 >>接任务: |cRXP_LOOT_哈加尔的召唤|r
    .target Ageron Kargal
step << Rogue/Warrior
    .goto Tirisfal Glades,61.81,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_妮拉|r交谈
    >>|cRXP_WARN_试着在等待期间(比如等齐柏林飞艇时)完成这些任务|r
    .train 3273 >>训练 |T135966:0|t[急救]
    .target Nurse Neela
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
    .collect 2494,1,354,1 --Collect Stiletto (1)
    .money <0.0401
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.3
step << Rogue
    #completewith MillsOverun
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
    .collect 2488,1,354,1 --Collect Gladius (1)
    .money <0.0536
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step << Warrior
    #completewith MillsOverun
    +装备 |T135321:0|t[步兵剑]
    .use 2488
    .itemcount 2488,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<3.7
step
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Priest
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_从她那里|r << Warlock
    .vendor >>出售垃圾
    .collect 1179,20,426,1 << Mage/Priest --Ice Cold Milk (20)
    .collect 4605,20,426,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,10,426,1 << Warlock --Ice Cold Milk (10)
    .collect 4605,10,426,1 << Warlock --Red-speckled Mushroom (10)
    .money <0.025 << Warrior/Rogue
    .money <0.0375 << Mage/Priest/Warlock
    .target Innkeeper Renee
step << Rogue/Warrior
    #softcore
    .goto Tirisfal Glades,60.31,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莉莎·考伦|r交谈
    .vendor >>修复你的武器
    .target Eliza Callen
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 1818 >>交任务: |cRXP_FRIENDLY_迪林格尔|r
    .accept 1819 >>接任务: |cRXP_LOOT_切割者奥拉格|r
    .target Deathguard Dillinger
    .isOnQuest 1818
step << Warrior
    #optional
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .accept 1819 >>接任务: |cRXP_LOOT_切割者奥拉格|r
    .target Deathguard Dillinger
    .isQuestTurnedIn 1818
step << Warrior
    .goto Tirisfal Glades,59.16,48.51
    >>|cRXP_WARN_点击地面上的骷髅. 这将召唤|r|cRXP_ENEMY_Ulag. |r|cRXP_WARN_杀掉他|r
    .complete 1819,1 --Ulag the Cleaver (1)
    .mob Ulag the Cleaver
    .isQuestTurnedIn 1818
step << Warrior
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 1819 >>交任务: |cRXP_FRIENDLY_切割者奥拉格|r
    .accept 1820 >>接任务: |cRXP_LOOT_库勒曼|r
    .target Deathguard Dillinger
    .isQuestTurnedIn 1818
step
    #optional
    #label Brill3
    --150% route does Agamand Mills after UC

step << Warrior
    #xprate <2.1
    #season 2
    #completewith AgamandStart
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step
    #xprate <2.1
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #xprate <2.1
    #label AgamandStart
    .goto Tirisfal Glades,47.60,44.03,100,0
    .goto Tirisfal Glades,47.37,43.71
    .subzone 157 >>前往阿加曼德磨坊(向北/西方向)
    .isOnQuest 362
step
    #xprate <2.1
    #completewith ThurmanGregor
    >>|T134939:0|t[|cRXP_LOOT_瑟曼的信|r]|cRXP_WARN_可能从这些怪物身上掉落. 如果掉落, 请接受任务|r
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >>接任务: |cRXP_LOOT_未寄出的信件|r
    .use 2839
step
    #xprate <2.1
    #completewith ThurmanGregor
    #label MillsOverun
    >>击杀|cRXP_ENEMY_Soldiers|r士兵 和|cRXP_ENEMY_Bonecasters|r骨巫师. 击杀后搜刮他们的|cRXP_LOOT_Ribs|r肋骨 和|cRXP_LOOT_Skulls|r头骨
    .complete 426,1 --Notched Rib (5)
    .mob +Rattlecage Soldier
    .mob +Cracked Skull Soldier
    .complete 426,2 --Blackened Skull (3)
    .mob +Darkeye Bonecaster
step
    #xprate <2.1
    #label KillDevlin
    .goto Tirisfal Glades,47.34,40.78
    >>击杀|cRXP_ENEMY_Devlin|r. 搜刮他的|cRXP_LOOT_Remains|r
    .complete 362,1 --Devlin's Remains (1)
    .mob Devlin Agamand
step
    #xprate <2.1
    .goto Tirisfal Glades,49.34,36.02
    >>击杀|cRXP_ENEMY_Nissa|r. 搜刮她的|cRXP_LOOT_Remains|r. 她可能在建筑物内
    .complete 354,2 --Nissa's Remains (1)
    .mob Nissa Agamand
step
    #xprate <2.1
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
    #xprate <2.1
    #loop
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
step << skip
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    >>击杀|cRXP_ENEMY_Soldiers|r和|cRXP_ENEMY_Bonecasters|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_LOOT_瑟曼的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >>接任务: |cRXP_LOOT_未寄出的信件|r
    .use 2839
    .mob Rattlecage Soldier
    .mob Darkeye Bonecaster
    .mob Cracked Skull Soldier
    .xp >9+4320,1
    .isQuestTurnedIn 375
--XX 880(426)+480(361, 可选)+880(354)+420(362)+700(375, 可选)
step << skip
    #xprate >1.49
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    >>击杀|cRXP_ENEMY_Soldiers|r和|cRXP_ENEMY_Bonecasters|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_LOOT_瑟曼的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >>接任务: |cRXP_LOOT_未寄出的信件|r
    .use 2839
    .mob Rattlecage Soldier
    .mob Darkeye Bonecaster
    .mob Cracked Skull Soldier
    .xp >9+2180,1
    .isOnQuest 375
--XX 880(426)+480(361, 可选)+880(354)+420(362)+700(375, 可选)
step << skip
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    >>击杀|cRXP_ENEMY_Soldiers|r和|cRXP_ENEMY_Bonecasters|r. 击败他们后搜刮出 |T134939:0|t[|cRXP_LOOT_瑟曼的信|r]
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >>接任务: |cRXP_LOOT_未寄出的信件|r
    .use 2839
    .mob Rattlecage Soldier
    .mob Darkeye Bonecaster
    .mob Cracked Skull Soldier
    .xp >9+3230,1
    .isQuestTurnedIn 375
--XX 880(426)+480(361, 可选)+880(354)+420(362)+700(375, 可选)
step << skip
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+3620 >>升级至3620+/6500经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isOnQuest 375
step << skip
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+4320 >>升级至4320+/6500经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isQuestTurnedIn 375
step << skip
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+3840 >>升级至3840+/6500经验值
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isQuestTurnedIn 375
step << skip
    #xprate <1.5
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+3140 >>升级至3140/6500经验值
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isOnQuest 375
step << skip
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+2180 >>升级至2180+/6500经验
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isOnQuest 375
step << skip
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+3230 >>升级至3230+/6500经验值
    .itemcount 2839,<1 --A Letter to Yvette (0)
    .isQuestTurnedIn 375
step << skip
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+2510 >>升级至2510/6500经验值
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isQuestTurnedIn 375
step << skip
    #xprate >1.49
    #optional
    #loop
    .goto Tirisfal Glades,46.03,30.25,0
    .goto Tirisfal Glades,48.15,34.64,60,0
    .goto Tirisfal Glades,47.65,31.65,60,0
    .goto Tirisfal Glades,46.03,30.25,60,0
    .goto Tirisfal Glades,44.44,30.84,60,0
    .goto Tirisfal Glades,44.10,34.67,60,0
    .goto Tirisfal Glades,46.80,35.10,60,0
    .xp 9+1460 >>升级至1460/6500经验
    .itemcount 2839,1 --A Letter to Yvette (1)
    .isOnQuest 375
step << Mage/Priest
    #xprate <2.1
    #season 2
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: RING SEFF OSTROF|r] << Mage
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出物品:|T136222:0|t[|cRXP_FRIENDLY_黑暗意图的记忆|r] << Priest
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 205940,1 << Priest --Memory of Dark Purpose (1)
    .mob Gillgar
    .train 401765,1 << Mage
    .train 425216,1 << Priest
step << Mage
    #xprate <2.1
    #season 2
    .collect 211779,1 >>你需要从|cRXP_FRIENDLY_试剂商|r处获得一个|T135933:0|t[理解之魅]才能使用该物品
    .train 401765 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_ 法术说明:RING SEFF OSTROF|r]|cRXP_WARN_来学习|r|T236227:0|t[冰霜之指]
    .use 203753
    .itemcount 203753,1
step << skip
    #xprate <1.5
    #hardcore
    #completewith FoodandWater2
    .hs >>传送回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,>0,1
step << skip
    #xprate <1.5
    #hardcore
    #completewith FoodandWater2
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,<0
step
    #xprate <2.1
    #hardcore
    #completewith FoodandWater2
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
step
    #xprate <2.1
    #softcore
    #completewith FoodandWater2
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #xprate <2.1
    .goto Tirisfal Glades,58.20,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 426 >>交任务: |cRXP_FRIENDLY_磨坊告急|r
    .target Deathguard Dillinger
step
    #xprate <2.1
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊维特|r和|cRXP_FRIENDLY_科尔曼|r交谈
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
    #xprate <2.1
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .turnin 1820 >>交任务: |cRXP_FRIENDLY_库勒曼|r << Warrior
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .target Coleman Farthing
    .isQuestTurnedIn 1819 << Warrior
step << Warrior
    #xprate <2.1
    #optional
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .accept 355 >>接任务: |cRXP_LOOT_与塞弗伦交谈|r
    .target Coleman Farthing
step
    #xprate <2.1
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step << Priest
    #xprate <2.1
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.trainer >>训练你的职业法术
    .target Dark Cleric Beryl
step << Warrior
    #xprate <2.1
    #optional
    .abandon 1505 >>放弃老兵犹塞克
    .isOnQuest 1505
step << Warrior
    #xprate <2.1
    #optional
    .abandon 1498 >>放弃防御之道
    .isOnQuest 1498
step << Warrior
    #xprate <2.1
    .goto Tirisfal Glades,61.85,52.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 2687 >>训练你的职业法术
    .accept 1818 >>接任务: |cRXP_LOOT_迪林格尔|r
    .target Austil de Mon << Warrior
    .xp >12,1
step << Warrior
    #xprate <2.1
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 7384 >>训练 |T132223:0|t[压制]
    .accept 1818 >>接任务: |cRXP_LOOT_迪林格尔|r
    .target Austil de Mon
    .xp <12,1
step << Warlock
    #xprate <2.1
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 707 >>训练你的职业法术
    .target Rupert Boch
    .xp <10,1
    .xp >12,1
step << Warlock
    #xprate <2.1
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 755 >>训练你的职业法术
    .target Rupert Boch
    .xp <12,1
step << Warlock
    #xprate <2.1
    .goto Tirisfal Glades,61.62,52.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内|cRXP_FRIENDLY_Ageron|r交谈
    .accept 1478 >>接任务: |cRXP_LOOT_哈加尔的召唤|r
    .target Ageron Kargal
step << Rogue
    #xprate <2.1
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Marion|r交谈
    .train 674 >>训练你的职业法术
    --.accept 1885 >>接任务: |cRXP_LOOT_米奈特·卡加德|r
    .target Marion Call
    .xp <10,1
    .xp >12,1
step << Rogue
    #xprate <2.1
    #optional
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Marion|r交谈
    .train 1766 >>训练你的职业法术
    --.accept 1885 >>接任务: |cRXP_LOOT_米奈特·卡加德|r
    .target Marion Call
    .xp <12,1
step << Mage
    #xprate <2.1
    .goto Tirisfal Glades,61.96,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的|cRXP_FRIENDLY_Cain|r交谈
    .accept 1881 >>接任务: |cRXP_LOOT_安娜斯塔西娅|r
    .target Cain Firesong
step
    #xprate <2.1
    #label FoodandWater2
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Priest/Shaman
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_从她那里|r << Warlock
    .vendor >>出售垃圾
    .collect 1179,20,370,1 << Mage/Priest/Shaman --Ice Cold Milk (20)
    .collect 4605,20,370,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,370,1 << Warlock --Ice Cold Milk (15)
    .collect 4605,15,370,1 << Warlock --Red-speckled Mushroom (15)
    .money <0.075 << Warlock
    .money <0.05 << !Warlock
    .target Innkeeper Renee
step << Warrior
    #xprate <2.1
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 1818 >>交任务: |cRXP_FRIENDLY_迪林格尔|r
    .accept 1819 >>接任务: |cRXP_LOOT_切割者奥拉格|r
    .target Deathguard Dillinger
step << Warrior
    #xprate <2.1
    .goto Tirisfal Glades,59.16,48.51
    >>|cRXP_WARN_点击地面上的骷髅. 这将召唤|r|cRXP_ENEMY_Ulag. |r|cRXP_WARN_杀掉他|r
    .complete 1819,1 --Ulag the Cleaver (1)
    .mob Ulag the Cleaver
step << Warrior
    #xprate <2.1
    .goto Tirisfal Glades,58.19,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 1819 >>交任务: |cRXP_FRIENDLY_切割者奥拉格|r
    .accept 1820 >>接任务: |cRXP_LOOT_库勒曼|r
    .target Deathguard Dillinger
step << Warlock
    #completewith next
    .goto Tirisfal Glades,61.80,65.06,20 >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
    .zoneskip Undercity
step << Warlock
    #completewith next
    .goto Undercity,66.09,20.06,35,0
    .goto Undercity,64.37,23.94,35,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_Carendin|r交谈
    .turnin 1478 >>交任务: |cRXP_FRIENDLY_哈加尔的召唤|r
    .accept 1473 >>接任务: |cRXP_LOOT_虚空中的生物|r
step << Warlock
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
step << Warrior
    #season 2
    #loop
    .goto Tirisfal Glades,55.14,62.01,0
    .goto Tirisfal Glades,56.90,58.25,60,0
    .goto Tirisfal Glades,55.14,62.01,60,0
    .goto Tirisfal Glades,52.36,62.93,60,0
    .goto Tirisfal Glades,48.94,63.72,60,0
    .goto Tirisfal Glades,45.17,62.11,60,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮出|cRXP_LOOT_ severed 蝙蝠头|r
    .collect 207975,1 --Severed Bat Head (1)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
    .train 403475,1
step << Rogue
    #season 2
    #completewith ScarletCrusade1
    >>对|cRXP_ENEMY_派瑞恩队长|r 使用 |T133644:0|t[扒窃], 可获得 |T133385:0|t[|cRXP_LOOT_猩红副官指环|r ]
    .collect 208085,1 --Scarlet Lieutenant Signet Ring (1)
    .mob Captain Perrine
    .train 400094,1
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
step << Rogue
    #season 2
    .goto Tirisfal Glades,51.17,67.81
    >>对|cRXP_ENEMY_派瑞恩队长|r 使用 |T133644:0|t[扒窃], 可获得 |T133385:0|t[|cRXP_LOOT_猩红副官指环|r ]
    .collect 208085,1 --Scarlet Lieutenant Signet Ring (1)
    .mob Captain Perrine
    .train 400094,1
step << Warlock
    .goto Tirisfal Glades,51.06,67.57
    >>搜刮地面上的派瑞恩的箱子, 获得|T133733:0|t[Egalin的法典]
    .complete 1473,1 --Egalin's Grimoire (1)
step
    #xprate <1.5
    #completewith UCHome
    .goto Undercity,16.51,42.76,35,0
    .goto Undercity,22.98,39.76,35,0
    .goto Undercity,24.93,32.54,35,0
    .goto Undercity,34.78,33.24,10,0
    .goto Undercity,40.83,34.08,10,0
    .goto Undercity,41.35,38.40,10,0
    .goto Undercity,45.25,39.20,10,0
    .goto Undercity,45.67,43.60,10,0
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
step << !Mage
    #xprate >1.49
    #completewith LogoutSkip1
    .goto Undercity,16.51,42.76,35,0
    .goto Undercity,22.98,39.76,35,0
    .goto Undercity,24.93,32.54,35,0
    .goto Undercity,34.78,33.24,10,0
    .goto Undercity,40.83,34.08,10,0
    .goto Undercity,41.35,38.40,10,0
    .goto Undercity,45.25,39.20,10,0
    .goto Undercity,45.67,43.60,10,0
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
step << Priest
    .goto Undercity,48.98,18.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾萨莱斯特|r交谈
    .turnin 5658 >>交任务: |cRXP_FRIENDLY_虚弱之触|r
    .target Aelthalyste
    .train 2652,1 --Touch of Weakness not trained
step << Rogue
    .goto Undercity,57.29,32.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与军事区的|r|cRXP_FRIENDLY_阿基巴德|r交谈
    .train 201 >>学习1小时剑术
    .target Archibald
step << Warrior/Rogue
    .goto Undercity,56.06,37.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布罗姆|r交谈
    .train 2575 >>训练 |T136248:0|t[采矿]
    >>|cRXP_WARN_这将使您能够找到|r|T135232:0|t|cRXP_LOOT_[劣质的石头]|r|cRXP_WARN_从矿点获取, 用于制作|r|T135248:0|t[磨砺石] |cRXP_WARN_(持续30分钟, 增加武器伤害+2)|r
    .target Brom Killian
step << Warrior/Rogue
    .goto Undercity,56.72,36.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与莎拉(|cRXP_FRIENDLY_Sarah|r)交谈
    >>|cRXP_BUY_从|r|cRXP_FRIENDLY_Sarah|cRXP_BUY_购买|r|T134708:0|t[矿工锄]|r
    .collect 2901,1,371,1 --Mining Pick (1)
    .target Sarah Killian
    .train 2575,3 --Mining Trained
 step << Warrior/Rogue
    .goto Undercity,60.17,29.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴兹尔·弗莱伊|r交谈
    .train 2018 >>训练 |T136241:0|t[锻造]
    .target Basil Frye
    .train 2575,3 --Mining Trained
step << Warrior
    #season 2
    .goto Undercity,48.03,70.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与幽暗城的|cRXP_FRIENDLY_多拉克·格雷夫斯|r交谈
    >>上交你收集到的|cRXP_LOOT_Heads|r, 换取 |T134455:0|t[符文碎片]
    .collect 204688,1 --Monster Hunter's First Rune Fragment (1)
    .collect 204689,1 --Monster Hunter's Second Rune Fragment (1)
    .collect 204690,1 --Monster Hunter's Third Rune Fragment (1)
    .target Dorac Graves
    .train 403475,1
step << Warrior
    #season 2
    #optional
    .use 204688 >>|cRXP_WARN_使用|r|T134455:0|t[符文碎片]|cRXP_WARN_制作|r|T134419:0|t[|cRXP_FRIENDLY_ 毁灭符文|r]
    .collect 204703,1 --Rune of Devastate (1)
    .train 403475,1
step << Warrior
    #season 2
    .train 403475 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_毁灭符文|r]
    .use 204703
    .itemcount 204703,1
step << !Mage
    #xprate >1.49
    #ah
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
    >>|cRXP_BUY_从拍卖行购买|r|T135139:0|t[次级魔法杖] |r << Priest
    >>|cRXP_BUY_如果你愿意, 可以从拍卖行购买|r|T135139:0|t[次级魔法杖]|r << Mage/Warlock
    >>|cRXP_WARN_如果你这样做并且之前已经收集了|r|T132889:0|t[亚麻布]|cRXP_WARN_, 你可以将你的|r|T132889:0|t[亚麻布]|cRXP_WARN_在拍卖行出售|r << Priest
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    .collect 11287,1,435,1 << Priest/Mage/Warlock --Lesser Magic Wand (1)
    .target Auctioneer Rhyker
    .itemStat 18,QUALITY,<7 << Priest/Mage/Warlock
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3 << Priest/Mage/Warlock
--XX Intentional for priests on 1.5x xp to only do this if they don't have a lesser magic wand
step << skip
    #xprate >1.49
    #ah
    #optional
    .goto Undercity,64.20,49.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与拍卖师雷克尔交谈|cRXP_FRIENDLY_Auctioneer Rhyker|r
    >>|cRXP_BUY_从拍卖行购买 6|r|T134339:0|t[变色的狼心]|r
    >>|cRXP_WARN_如果你不想或无法完成此步骤, 请跳过|r
    .collect 3164,6,429,1 --Discolored Worg Heart (6)
    .target Auctioneer Rhyker
step << !Warlock
    #xprate <1.5
    .goto Undercity,67.74,37.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺曼|r交谈
    .home >>将你的[炉石]设置为幽暗城
    .target Innkeeper Norman
step
    #optional
    #label UCHome
step << Warlock
    .goto Undercity,85.07,25.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_Carendin|r交谈
    .turnin 1473 >>交任务: |cRXP_FRIENDLY_虚空中的生物|r
    .accept 1471 >>接任务: |cRXP_LOOT_誓缚|r
    .target Carendin Halgar
step << Warlock
    #completewith next
    .cast 9221 >>|cRXP_WARN_使用|r|T134416:0|t[召唤符文]|cRXP_WARN_在召唤法阵|r
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
step << Warrior
    #ssf
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135350:0|t[优质重剑]|r
    .collect 1198,1,371,1 --Collect Claymore (1)
    .money <0.2676
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Charles Seaton
step << Warrior
    #ah
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135350:0|t[优质重剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 1198,1,371,1 --Collect Claymore (1)
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
    .target Charles Seaton
step << Warrior
    #optional
    #completewith LogoutSkip1
    +装备 |T135350:0|t[优质重剑]
    .use 1198
    .itemcount 1198,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.0
step << Rogue
    #season 0
    #ssf
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    .collect 851,1,371,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Charles Seaton
step << Rogue
    #season 0
    #ah
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    >>|cRXP_BUY_从他那里购买|r|T135346:0|t[斗士短剑]|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .collect 851,1,371,1 --Collect Cutlass (1)
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Charles Seaton
step << Rogue
    #season 2
    #ssf
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    .vendor >>|cRXP_BUY_购买 a|r|T135346:0|t[斗士短剑]|cRXP_BUY_或 a|r|T35640:0|t[双刃弯刀]|cRXP_BUY_从他那里|r
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Charles Seaton
step << Rogue
    #season 2
    #ah
    .goto Undercity,77.08,49.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_查尔斯·希顿|r谈话
    .vendor >>|cRXP_BUY_购买 a|r|T135346:0|t[斗士短剑]|cRXP_BUY_或 a|r|T35640:0|t[双刃弯刀]|cRXP_BUY_从他那里|r
    >>|cRXP_WARN_或者, 去拍卖行看看有没有更优或更便宜的物品|r
    .money <0.2023
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
    .target Charles Seaton
step << Rogue
    #optional
    #completewith LogoutSkip1
    +装备 |T135346:0|t[斗士短剑]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.8
step << Rogue
    #season 2
    #optional
    #completewith LogoutSkip1
    +装备|T135640:0|t[双刃弯刀]
    .use 2207
    .itemcount 2207,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
step << Rogue
    .goto Undercity,77.50,49.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_纳撒尼尔·斯蒂恩维克|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135425:0|t[锐利投掷匕首]|r
    .collect 3107,200,371,1 --Keen Throwing Knife (200)
    .target Nathaniel Steenwick
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    .goto Undercity,77.50,49.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与潜行者街区的|cRXP_FRIENDLY_纳撒尼尔·斯蒂恩维克|r交谈
    >>|cRXP_BUY_从他那里购买|r|T135425:0|t[锐利投掷匕首]|r
    .collect 3107,200,371,1 --Keen Throwing Knife (200)
    .target Nathaniel Steenwick
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_记得在等级达到11级时装备|r|T135425:0|t[锐利投掷匕首]|r
    .use 3107
    .itemcount 3107,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp >11,1
step << Rogue
    #optional
    #completewith LogoutSkip1
    +|cRXP_WARN_装备|r|T135425:0|t[锐利投掷匕首]
    .use 3107
    .itemcount 3107,1
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.3
    .xp <11,1
step << skip
    --Rogue class q
    .goto Undercity,83.52,69.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mennet|r交谈
    .turnin 1885 >>交任务: |cRXP_FRIENDLY_米奈特·卡加德|r
    .accept 1886 >>接任务: |cRXP_LOOT_亡灵哨兵|r
    .target Mennet Carkad
step << skip
    #optional
    .abandon 1883 >>放弃与安苏瓦交谈, 否则将无法接取后续任务
    .isOnQuest 1883
step << skip
    .goto Undercity,85.12,10.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与魔法区的|cRXP_FRIENDLY_安娜斯塔西娅|r交谈
    .turnin 1881 >>交任务: |cRXP_FRIENDLY_安娜斯塔西娅|r
    .accept 1882 >>接任务: |cRXP_LOOT_巴尼尔农场|r
    .target Anastasia Hartwell
step
    #xprate <1.5
    .goto Undercity,84.06,17.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_Bethor|r交谈
    .turnin 405 >>交任务: |cRXP_FRIENDLY_流浪的巫妖|r
    .accept 357 >>接任务: |cRXP_LOOT_巫妖的身份|r
    .target Bethor Iceshard
step << Warlock
    #xprate >1.49
    .goto Undercity,84.06,17.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在魔法区与|cRXP_FRIENDLY_Bethor|r交谈
    .turnin 405 >>交任务: |cRXP_FRIENDLY_流浪的巫妖|r
    .target Bethor Iceshard
step << skip --Warlock
    #xprate <2.1
    .goto Undercity,84.86,20.34
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过将角色 positioned 在最低楼梯的最高处, 直到看起来像是漂浮一样, 然后登出再重新登录, 来执行一次“登出跳过”操作|r
    .link https://www.youtube.com/watch?v=-Bi95bCN8dM >>|cRXP_WARN_点击此处查看示例|r
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
step << skip --!Mage !Warlock
    #xprate <2.1
    .goto Undercity,61.10,54.11 << Priest
    .goto Undercity,78.03,50.36 << Warrior
    .goto Undercity,82.75,65.23 << Rogue
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到桶堆顶部来执行“登出跳过”, 然后注销并重新登录|r << Priest/Warrior
    .goto Undercity,67.90,15.28,30 >>|cRXP_WARN_通过跳到肉车的升级机顶部来执行登出跳过, 然后退出并重新登录|r << Rogue
    >>|cRXP_WARN_如果你无法完成此任务, 就正常从幽暗城跑出去吧|r
    .zoneskip Undercity,1
step
    #optional
    #label LogoutSkip1
step
    #xprate <2.1
    #completewith AtWarS
    .goto Tirisfal Glades,61.92,64.85
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
step << skip
    #sticky
    #completewith UnluckyRogue
    >>|cRXP_WARN_如果你看到|r |cRXP_FRIENDLY_Astor|r|cRXP_WARN_, 与他交谈并击杀他. 搜刮其尸体获得信件. 他在布瑞尔与瑟伯切尔之间的道路上巡逻|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan Astor Hadren
    .isOnQuest 1886
step << Mage/Warlock
    #xprate >1.49
    #completewith AtWarS
    #optional
    .abandon 357 >>放弃巫妖的身份
step << Mage
    #xprate <2.1
    #label AtWarS
    #softcore
    #completewith AtWarS
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #completewith AgamandStart
    #xprate >2.09
    .hs >>传送回布瑞尔
step
    #optional
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r交谈
    .turnin 374 >>交任务: |cRXP_FRIENDLY_死亡证明|r
    .target Deathguard Burgess
    .isQuestComplete 374
step
    #xprate <2.1
    #label AtWarS
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 370 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 371 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target Executor Zygand
step
    #xprate >2.09
    #label AtWarS
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 370 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .target Executor Zygand
step << Rogue
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    .use 208085 >>|cRXP_WARN_使用|r|T133385:0|t[|cRXP_LOOT_猩红中尉徽章戒指|r]|cRXP_WARN_来制作|r|T134328:0|t[|cRXP_LOOT_ forged Scarlet Memorandum|r]
    .collect 208086,1 --Forged Scarlet Memorandum (1)
    .train 400094,1
step << Rogue
    #season 2
    .goto Tirisfal Glades,60.73,50.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加米尔·诺瑞|r交谈, 从她那里获得|T134419:0|t[|cRXP_FRIENDLY_残肢符文|r]
    .collect 203990,1 --Rune of Mutilation (1)
    .target Jamie Nore
    .skipgossip
    .train 400094,1
step << Rogue
    #season 2
    .train 400094 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_撕裂符文|r]|cRXP_WARN_来训练|r|T132304:0|t[撕裂]
    .use 203990
    .itemcount 203990,1
step
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人交谈|r
    >>|cRXP_BUY_从|r|cRXP_FRIENDLY_他那|cRXP_BUY_购买|r|T133634:0|t[棕色小袋]|r
    .collect 4496,1,356,1 --Small Brown Pouch (1)
    .target Mrs. Winters
    .money <0.05
step << Warrior
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 1820 >>交任务: |cRXP_FRIENDLY_库勒曼|r
    .target Coleman Farthing

    --150% route Agamand Mills here

step
    #xprate >2.09
    #label AgamandStart
    .goto Tirisfal Glades,47.60,44.03,100,0
    .goto Tirisfal Glades,47.37,43.71
    .subzone 157 >>前往阿加曼德磨坊(向北/西方向)
    .isOnQuest 362
step
    #xprate >2.09
    #completewith ThurmanGregor
    >>|T134939:0|t[|cRXP_LOOT_瑟曼的信|r]|cRXP_WARN_可能从这些怪物身上掉落. 如果掉落, 请接受任务|r
    .collect 2839,1,361 --Collect A Letter to Yvette (1)
    .accept 361 >>接任务: |cRXP_LOOT_未寄出的信件|r
    .use 2839
step
    #xprate >2.09
    #completewith ThurmanGregor
    #label MillsOverun
    >>击杀|cRXP_ENEMY_Soldiers|r士兵 和|cRXP_ENEMY_Bonecasters|r骨巫师. 击杀后搜刮他们的|cRXP_LOOT_Ribs|r肋骨 和|cRXP_LOOT_Skulls|r头骨
    .complete 426,1 --Notched Rib (5)
    .mob +Rattlecage Soldier
    .mob +Cracked Skull Soldier
    .complete 426,2 --Blackened Skull (3)
    .mob +Darkeye Bonecaster
step
    #xprate >2.09
    #label KillDevlin
    .goto Tirisfal Glades,47.34,40.78
    >>击杀|cRXP_ENEMY_Devlin|r. 搜刮他的|cRXP_LOOT_Remains|r
    .complete 362,1 --Devlin's Remains (1)
    .mob Devlin Agamand
step
    #xprate >2.09
    .goto Tirisfal Glades,49.34,36.02
    >>击杀|cRXP_ENEMY_Nissa|r. 搜刮她的|cRXP_LOOT_Remains|r. 她可能在建筑物内
    .complete 354,2 --Nissa's Remains (1)
    .mob Nissa Agamand
step
    #xprate >2.09
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
    #xprate >2.09
    #loop
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
step << Mage/Priest
    #xprate >2.09
    #season 2
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出 |T134939:0|t[|cRXP_FRIENDLY_Spell Notes: RING SEFF OSTROF|r] << Mage
    >>击杀|cRXP_ENEMY_Gillgar|r. 击败他后搜刮出物品:|T136222:0|t[|cRXP_FRIENDLY_黑暗意图的记忆|r] << Priest
    .collect 203753,1 << Mage --Spell Notes: RING SEFF OSTROF (1)
    .collect 205940,1 << Priest --Memory of Dark Purpose (1)
    .mob Gillgar
    .train 401765,1 << Mage
    .train 425216,1 << Priest
step << Mage
    #xprate >2.09
    #season 2
    .collect 211779,1 >>你需要从|cRXP_FRIENDLY_试剂商|r处获得一个|T135933:0|t[理解之魅]才能使用该物品
    .train 401765 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_ 法术说明:RING SEFF OSTROF|r]|cRXP_WARN_来学习|r|T236227:0|t[冰霜之指]
    .use 203753
    .itemcount 211779,1
step
    #xprate >2.09
    #hardcore
    #completewith FoodandWater2
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
step
    #xprate >2.09
    #softcore
    #completewith FoodandWater2
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #xprate >2.09
    .goto Tirisfal Glades,58.20,51.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dillinger|r交谈
    .turnin 426 >>交任务: |cRXP_FRIENDLY_磨坊告急|r
    .target Deathguard Dillinger
step
    #xprate >2.09
    #optional
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊维特|r和|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 361 >>交任务: |cRXP_FRIENDLY_未寄出的信件|r
    .target +Yvette Farthing
    .goto Tirisfal Glades,61.58,52.60
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .target +Coleman Farthing
    .goto Tirisfal Glades,61.72,52.29
    .isOnQuest 361
step
    #xprate >2.09
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .turnin 1820 >>交任务: |cRXP_FRIENDLY_库勒曼|r << Warrior
    .target Coleman Farthing
    .isQuestTurnedIn 1819 << Warrior
step << Warrior
    #xprate >2.09
    #optional
    .goto Tirisfal Glades,61.72,52.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科尔曼|r交谈
    .turnin 354 >>交任务: |cRXP_FRIENDLY_阿加曼德家族|r
    .turnin 362 >>交任务: |cRXP_FRIENDLY_闹鬼的磨坊|r
    .target Coleman Farthing
step
    #xprate >2.09
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step << Priest
    #xprate >2.09
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.trainer >>训练你的职业法术
    .target Dark Cleric Beryl
step << Warrior
    #xprate >2.09
    .goto Tirisfal Glades,61.85,52.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 2687 >>训练你的职业法术
    .target Austil de Mon
    .xp >12,1
step << Warrior
    #xprate >2.09
    .goto Tirisfal Glades,61.85,52.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Austil|r交谈
    .train 7384 >>训练 |T132223:0|t[压制]
    .target Austil de Mon
    .xp <12,1
step << Warlock
    #xprate >2.09
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 707 >>训练你的职业法术
    .target Rupert Boch
    .xp <10,1
    .xp >12,1
step << Warlock
    #xprate >2.09
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 755 >>训练你的职业法术
    .target Rupert Boch
    .xp <12,1
step << Rogue
    #xprate >2.09
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Marion|r交谈
    .train 674 >>训练你的职业法术
    --.accept 1885 >>接任务: |cRXP_LOOT_米奈特·卡加德|r
    .target Marion Call
    .xp <10,1
    .xp >12,1
step << Rogue
    #xprate >2.09
    #optional
    .goto Tirisfal Glades,61.75,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Marion|r交谈
    .train 1766 >>训练你的职业法术
    --.accept 1885 >>接任务: |cRXP_LOOT_米奈特·卡加德|r
    .target Marion Call
    .xp <12,1
step
    #xprate >2.09
    #label FoodandWater2
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    >>|cRXP_BUY_从她那里购买|r|T132815:0|t[冰镇牛奶]|r << Mage/Priest/Shaman
    >>|cRXP_BUY_购买|r|T134532:0|t[红斑蘑菇]|cRXP_BUY_从她那里购买|r <<Warrior/Rogue
    >>|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r |T134532:0|t[红斑蘑菇] |cRXP_BUY_从她那里|r << Warlock
    .vendor >>出售垃圾
    .collect 1179,20,370,1 << Mage/Priest/Shaman --Ice Cold Milk (20)
    .collect 4605,20,370,1 << Rogue/Warrior --Red-speckled Mushroom (20)
    .collect 1179,15,370,1 << Warlock --Ice Cold Milk (15)
    .collect 4605,15,370,1 << Warlock --Red-speckled Mushroom (15)
    .money <0.075 << Warlock
    .money <0.05 << !Warlock
    .target Innkeeper Renee
step
    #xprate <2.1
    #completewith next
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #xprate <2.1
    #label UnluckyRogue
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Linnea|r交谈
    .turnin 359 >>交任务: |cRXP_FRIENDLY_亡灵卫兵的职责|r
    .accept 360 >>接任务: |cRXP_LOOT_向塞弗伦回报|r
    .accept 356 >>接任务: |cRXP_LOOT_巡查后方|r
    .target Deathguard Linnea
step
    #xprate <2.1
    #completewith ArriveBalnir
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #xprate <2.1
    #label ArriveBalnir
    .goto Tirisfal Glades,76.51,61.77
    .subzone 165 >>前往巴尔尼尔农庄
    .isOnQuest 356
step << Mage
    #xprate <2.1
    #season 2
    #completewith HorrorsandSpirits
    >>对|cRXP_ENEMY_Odd Melons|r施放 |T136071:0|t[变形术]
    >>拾取地面上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob Odd Melon
    .train 415942,1
    .train 118,3
step << skip
    #completewith next
    >>击杀|cRXP_ENEMY_可怕的血僵尸|r和|cRXP_ENEMY_游荡的幽灵|r
    .complete 356,1 --Bleeding Horror (8)
    .mob +Bleeding Horror
    .complete 356,2 --Wandering Spirit (8)
    .mob +Wandering Spirit
step << skip
    .goto Tirisfal Glades,77.48,62.00
    >>拾取地面上任意一种植物以获得 |cRXP_PICK_Balnir Snapdragon|r
    .complete 1882,1 --Balnir Snapdragons (1)
step
    #xprate <2.1
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
    .mob +Bleeding Horror
    .complete 356,2 --Wandering Spirit (8)
    .mob +Wandering Spirit
step << Mage
    #xprate <2.1
    #season 2
    #loop
    .goto Tirisfal Glades,76.51,61.77,0
    .goto Tirisfal Glades,75.12,61.49,20,0
    .goto Tirisfal Glades,76.51,61.77,20,0
    .goto Tirisfal Glades,76.04,59.31,20,0
    >>对|cRXP_ENEMY_Odd Melons|r施放 |T136071:0|t[变形术]
    >>拾取地面上的 |T134332:0|t|cRXP_LOOT_[药剂师笔记]|r
    .collect 208183,6 --Apothecary Notes (6)
    .mob Odd Melon
    .train 415942,1
    .train 118,3
step << Mage
    #xprate <2.1
    #season 2
    >>|cRXP_WARN_使用|r|T134332:0|t|cRXP_LOOT_[药剂师笔记]|r|cRXP_WARN_制作|r|T134332:0|t|cRXP_LOOT_[法术笔记:启迪]|r
    .collect 203749,1 --Spell Notes: Enlightenment (1)
    .use 208183 --Apothecary Notes
    .train 415942,1
    .itemcount 208183,6
step << Mage
    #xprate <2.1
    #season 2
    .train 415942 >>|cRXP_WARN_使用|r|T134332:0|t|cRXP_LOOT_[法术说明:启蒙]|r|cRXP_WARN_来学习|r|T133815:0|t[雕刻宝箱 - 启蒙]
    .use 203749
    .itemcount 203749,1 --Spell Notes: Enlightenment (1)
step
    #xprate <2.1
    #sticky
    #label Friars
    #loop
    #optional
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
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
    >>击杀 |cRXP_ENEMY_血色苦行修士|r 和 |cRXP_ENEMY_血色狂热者|r , 从他们身上搜刮 |cRXP_LOOT_血色十字军徽记之戒|r
    .complete 371,2 --Scarlet Friar (5)
    .complete 374,1 --Scarlet Insignia Ring (10)
    .disablecheckbox
    .mob Scarlet Friar
    .mob Scarlet Zealot
    .isOnQuest 374
step
    #xprate <2.1
    #loop
    #sticky
    #requires Friars
    #label Friars2
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
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
    >>击杀|cRXP_ENEMY_血色苦行修士|r
    .complete 371,2 --Scarlet Friar (5)
    .mob Scarlet Friar
    .isQuestTurnedIn 374
step
    #xprate <2.1
    .goto Tirisfal Glades,78.82,56.14
    >>击杀塔内的瓦松队长
    .complete 371,1 --Captain Vachon (1)
    .mob Captain Vachon
step
    #xprate <2.1
    #requires Friars2
    #loop
    #label FinishRings
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
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
    >>击杀 |cRXP_ENEMY_血色苦行修士|r 和 |cRXP_ENEMY_血色狂热者|r , 从他们身上搜刮 |cRXP_LOOT_血色十字军徽记之戒|r
    .complete 374,1 --Scarlet Insignia Ring (10)
    .mob Scarlet Friar
    .mob Scarlet Zealot
    .isOnQuest 374
step << skip
    #xprate <2.1
    #optional
    #loop
    .goto Tirisfal Glades,80.95,57.21,0
    .goto Tirisfal Glades,77.14,54.92,0
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
    >>|cRXP_WARN_收集 3 堆|r|T132889:0|t[亚麻布]|cRXP_WARN_, 用于制作你的初级魔杖. 这是在进入银松森林前获取足够数量的最后机会|r
    .collect 2589,60,435,1 --Linen Cloth (60)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.3
step
    #xprate <2.1
    #completewith ViciousVenom
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step
    #xprate <2.1
    #label ViciousVenom
    #loop
    #requires Friars2
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
    #xprate <2.1
    #loop
    .goto Tirisfal Glades,83.59,43.84,0
    .goto Tirisfal Glades,72.33,33.01,0
    .goto Tirisfal Glades,83.59,43.84,70,0
    .goto Tirisfal Glades,80.77,46.40,70,0
    .goto Tirisfal Glades,75.86,46.02,70,0
    .goto Tirisfal Glades,73.10,40.71,70,0
    .goto Tirisfal Glades,72.33,33.01,70,0
    .goto Tirisfal Glades,68.69,34.33,70,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击败它们后搜刮其|cRXP_LOOT_皮毛|r
    .complete 375,1 --Duskbat Pelt (5)
    .mob Greater Duskbat
    .mob Vampiric Duskbat
step << skip
    #xprate >1.49
    .xp 11+2950 >>升级至2950+/8800经验
    .isOnQuest 374
    .isOnQuest 375
--XX 220 (369)+840 (371)+390 (360)+90 (355)+160 (407)+875 (492) = 2575 -> 3860
--XX +625(374 OPT)+ 700(375 OPT)= 3900 → 5850
--XX +625(374 可选)= 3200 → 4800
--XX +700(375 优选)= 3275 → 4910
step << skip
    #xprate >1.49
    #optional
    .xp 11+3890 >>升级至3890+/8800经验值
    .isQuestTurnedIn 374
    .isOnQuest 375
step << skip
    #xprate >1.49
    #optional
    .xp 11+4000 >>升级至4000+/8800经验值
    .isOnQuest 374
    .isQuestTurnedIn 375
step << skip
    #xprate >1.49
    #optional
    .xp 11+4940 >>升级至4940+/8800经验
    .isQuestTurnedIn 374
    .isQuestTurnedIn 375
step
    #xprate <2.1
    #completewith ANewPlagueFinal
    .hs >>传送回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,>0,1
step
    #xprate <2.1
    #completewith ANewPlagueFinal
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
    .cooldown item,6948,<0
step
    #xprate <1.5
    .goto Tirisfal Glades,67.97,42.09
    >>在布莱特沃特湖的岛上搜寻|cRXP_PICK_冈瑟尔的书籍|r, 以获得|cRXP_LOOT_巫妖的法术书|r
    .complete 357,1 --The Lich's Spellbook (1)
step
    #xprate <1.5
    #hardcore
    #completewith ANewPlagueFinal
    .subzone 159 >>返回布瑞尔
    .subzoneskip 159
step
    #xprate <1.5
    #softcore
    #completewith ANewPlagueFinal
    .goto Tirisfal Glades,66.60,44.95
    .deathskip >>在较小的岛上死亡, 并在|cRXP_FRIENDLY_灵魂医者|r处重生
step
    #xprate <2.1
    .goto Tirisfal Glades,59.45,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 369 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 492 >>接任务: |cRXP_LOOT_新的瘟疫|r
    --.accept 445 >>接任务: |cRXP_LOOT_给银松森林送信|r
    .target Apothecary Johaan
step << skip
    #phase 3-6
    .goto Tirisfal Glades,59.45,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 369 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .accept 492 >>接任务: |cRXP_LOOT_新的瘟疫|r
    --.accept 445 >>接任务: |cRXP_LOOT_给银松森林送信|r
    .target Apothecary Johaan
step
    #xprate <1.5
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 371 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .accept 372 >>接任务: |cRXP_LOOT_与血色十字军的战争|r
    .target Executor Zygand
step
    #optional
    #xprate <2.1
    .goto Tirisfal Glades,60.58,51.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zygand|r交谈
    .turnin 371 >>交任务: |cRXP_FRIENDLY_与血色十字军的战争|r
    .target Executor Zygand
step
    #xprate <2.1
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞弗伦|r交谈
    .turnin 360 >>交任务: |cRXP_FRIENDLY_向塞弗伦回报|r
    .turnin 355 >>交任务: |cRXP_FRIENDLY_与塞弗伦交谈|r
    .target Magistrate Sevren
step
    #xprate >1.49
    #optional
    #completewith ANewPlagueFinal
    .abandon 372 >>与血色十字军的战争
step
    #xprate <2.1
    #optional
    .goto Tirisfal Glades,60.93,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Burgess|r交谈
    .turnin 374 >>交任务: |cRXP_FRIENDLY_死亡证明|r
    .target Deathguard Burgess
    .isQuestComplete 374
step
    #xprate <2.1
    .goto Tirisfal Glades,61.03,52.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿比盖尔|r交谈
    >>|cRXP_BUY_从她那里购买 a|r|T132891:0|t[粗线]|r
    .complete 375,2 --Coarse Thread (1)
    .target Abigail Shiel
    .itemcount 2876,5 --Duskbat Pelt (5)
    .isQuestAvailable 375
step
    #xprate <2.1
    .goto Tirisfal Glades,61.15,52.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_温特斯夫人交谈|r
    >>|cRXP_BUY_从|r|cRXP_FRIENDLY_他那|cRXP_BUY_购买|r|T133634:0|t[棕色小袋]|r
    .collect 4496,1,356,1 --Small Brown Pouch (1)
    .target Mrs. Winters
    .money <0.05
step
    #xprate <1.5
    #optional
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
    .isQuestComplete 375
step
    #xprate <2.1
    .goto Tirisfal Glades,61.89,52.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gretchen|r交谈
    .turnin 375 >>交任务: |cRXP_FRIENDLY_死亡之寒|r
    .target Gretchen Dedmar
step
    #xprate <2.1
    .goto Tirisfal Glades,61.71,52.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
	.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
    .target Innkeeper Renee
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.73,51.91
    .gossipoption 110750 >>与|cRXP_FRIENDLY_本尼|r交谈
    .target Penny Hawkins
    .train 425447,1
step
    #xprate <1.5
    #label ANewPlagueFinal
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店后方楼下的|cRXP_FRIENDLY_血色十字军俘虏|r和|cRXP_FRIENDLY_被俘虏的巡山人|r谈话
    .turnin 407 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .goto Tirisfal Glades,61.97,51.29
    .target +Captured Scarlet Zealot
    .turnin 492 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .goto Tirisfal Glades,61.94,51.40
    .target +Captured Mountaineer
step
    #xprate <2.1
    .goto Tirisfal Glades,61.94,51.40
    #label ANewPlagueFinal
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与客栈后方楼下的|cRXP_FRIENDLY_被俘虏的巡山人|r交谈
    .turnin 492 >>交任务: |cRXP_FRIENDLY_新的瘟疫|r
    .target +Captured Mountaineer
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.72,51.72
    .gossipoption 109084 >>与|cRXP_FRIENDLY_Blueheart|r(在旅店楼下)交谈
    .target Blueheart
    .train 425447,1
step << Warrior
    #season 2
    .goto Tirisfal Glades,61.72,51.91
    >>击杀|cRXP_ENEMY_Blueheart|r, 然后与楼上的|cRXP_FRIENDLY_本尼|r交谈
    .gossipoption 110751 >>从她那里获得 |T134419:0|t[|cRXP_FRIENDLY_狂暴突袭符文|r]
    .collect 204716,1 --Rune of Frenzied Assault (1)
    .target Netali
    .mob Blueheart
    .train 425447,1
    .skipgossip
step << Warrior
    #season 2
    .train 425447 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_狂怒突袭符文|r]
    .use 204716
    .itemcount 204716,1
step << Priest
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 588 >>训练 |T135926:0|t[内心之火]
    .target Dark Cleric Beryl
    .xp <12,1
    .xp >14,1
step << Priest
    #optional
    .goto Tirisfal Glades,61.57,52.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Beryl|r交谈
	.train 6074 >>训练你的职业法术
    .target Dark Cleric Beryl
    .xp <14,1
step << Mage
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 145 >>训练 |T135812:0|t[火球术等级3]
    .target Cain Firesong
    .xp <12,1
    .xp >14,1
step << Mage
    #optional
    .goto Tirisfal Glades,61.97,52.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Cain|r交谈
    .train 1449 >>训练你的职业法术
    .target Cain Firesong
    .xp <12,1
    .xp >14,1
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
    .xp >14,1
step << Rogue
    #optional
    .goto Tirisfal Glades,61.75,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与二楼的|cRXP_FRIENDLY_Marion|r交谈
    .train 1758 >>训练你的职业法术
    .target Marion Call
    .xp <14,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 755 >>训练 |T136168:0|t[生命汲取]
    .target Rupert Boch
    .xp <12,1
    .xp >14,1
step << Warlock
    .goto Tirisfal Glades,61.59,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Rupert|r交谈
    .train 6222 >>训练你的职业法术
    .target Rupert Boch
    .xp <14,1
step << skip
    #completewith Entersilverpine
    >>|cRXP_WARN_如果你看到|r |cRXP_FRIENDLY_Astor|r|cRXP_WARN_, 与他交谈并击杀他. 搜刮其尸体获得信件. 他在布瑞尔与瑟伯切尔之间的道路上巡逻|r
    .complete 1886,1 --Astor's Letter of Introduction (1)
    .unitscan Astor Hadren
step
    #xprate <2.1
    .goto Tirisfal Glades,65.49,60.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Linnea|r交谈
    .turnin 356 >>交任务: |cRXP_FRIENDLY_巡查后方|r
    .target Deathguard Linnea
step << Undead
    #sticky
    #completewith EnterRFC
    .subzone 2437 >>现在你应该找一个团队去怒焰裂谷
    .dungeon RFC
step
    #optional
    #completewith ZeptoDurotar
    .abandon 374 >>放弃死亡证明
step
    #optional
    #completewith ZeptoDurotar
    .abandon 375 >>舍弃死亡之寒
step << Undead
    #label ZeptoDurotar
    .goto Tirisfal Glades,60.96,58.63,12,0
    .goto Tirisfal Glades,61.51,59.01,10,0
    .goto Tirisfal Glades,61.27,59.22,8,0
    .goto Tirisfal Glades,61.13,58.84,8,0
    .goto Tirisfal Glades,61.38,58.71,8,0
    .goto Tirisfal Glades,61.34,59.17,8,0
    .goto Tirisfal Glades,60.51,58.69,-1
    .goto Tirisfal Glades,60.94,46.35,-1
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    >>等待时制作磨刀石/绷带 << Warrior/Rogue
    >>等待时召唤食物/水 << Mage
    .zoneskip Durotar
step << Undead
    #completewith HiddenEnemiesPickup
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
    .dungeon RFC
step << Undead
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
    >>|cRXP_WARN_不要飞行到任何地方！|r
    .fp Orgrimmar >>获取奥格瑞玛飞行点
    .target Doras
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .accept 5726 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .dungeon RFC
step << Undead
    .goto Durotar,53.08,9.19,0
    >>击杀骷髅石中的|cRXP_ENEMY_Burning Blade|r怪物, 直到掉落|cRXP_LOOT_Lieutenant's Insignia|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5726 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5727 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .accept 5761 >>接任务: |cRXP_WARN_饥饿者塔拉加曼|r
    .target Neeru Fireblade
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .complete 5727,1 --Gauge Neeru Fireblade's reaction to you being a member of the Burning Blade
    .skipgossip
    .target Neeru Fireblade
    .dungeon RFC
step << Undead
    #label HiddenEnemiesPickup
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5727 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5728 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .dungeon RFC
step << Undead
    #completewith EnterRFC
    .destroy 14544 >>|cRXP_WARN_摧毁: |cRXP_ENEMY_军官的徽章|r|r
step << Undead
    #label EnterRFC
    .goto Orgrimmar,52.77,48.97
    .subzone 2437 >>进入RFC副本传送门. 区域中
    .dungeon RFC
step << Undead
    >>|cRXP_WARN_如果可能的话, 请队伍成员共享以下任务|r
    .accept 5722 >>接任务: |cRXP_WARN_寻找背包|r
    .accept 5723 >>接任务: |cRXP_WARN_试探敌人|r
    .disablecheckbox
    .dungeon RFC
step << Undead
    #completewith next
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +Ragefire Trogg
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +Ragefire Shaman
    .isOnQuest 5723
    .dungeon RFC
step << Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .turnin 5722 >>交任务: |cRXP_FRIENDLY_寻找背包|r
    .accept 5724 >>接任务: |cRXP_WARN_归还背包|r
    .target Maur Grimtotem
    .isOnQuest 5722
    .dungeon RFC
step << Undead
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .accept 5724 >>接任务: |cRXP_WARN_归还背包|r
    .target Maur Grimtotem
    .isQuestTurnedIn 5722
    .dungeon RFC
step << Undead
    #label TroggsShamans
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +Ragefire Trogg
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +Ragefire Shaman
    .isOnQuest 5723
    .dungeon RFC
step << Undead
    #requires TroggsShamans
    #completewith BazzalanandJergosh
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r. 击败他们后搜刮出|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob Searing Blade Cultist
    .mob Searing Blade Warlock
    .isOnQuest 5725
    .dungeon RFC
step << Undead
    >>击杀|cRXP_ENEMY_饥饿者塔拉加曼|r. 击败他后搜刮其|cRXP_LOOT_心脏|r
    .complete 5761,1 -- Taragaman the Hungerer's Heart
    .mob Taragaman the Hungerer
    .isOnQuest 5761
    .dungeon RFC
step << Undead
    #label BazzalanandJergosh
    >>击杀|cRXP_ENEMY_巴扎兰|r和|cRXP_ENEMY_祈求者耶戈什|r
    .complete 5728,1 --Bazzalan (1)
    .mob +Bazzalan
    .complete 5728,2 --Jergosh the Invoker (1)
    .mob +Jergosh the Invoker
    .isOnQuest 5728
    .dungeon RFC
step << Undead
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r. 击败他们后搜刮出|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob Searing Blade Cultist
    .mob Searing Blade Warlock
    .isOnQuest 5725
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5761 >>交任务: |cRXP_FRIENDLY_饥饿者塔拉加曼|r
    .target Neeru Fireblade
    .isQuestComplete 5761
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5728 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5729 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .isQuestComplete 5728
    .dungeon RFC
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .accept 5729 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .isQuestTurnedIn 5728
    .dungeon RFC
step << Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5729 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5730 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Neeru Fireblade
    .dungeon RFC
    .isQuestTurnedIn 5728
step << Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5730 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .target Thrall
    .isQuestTurnedIn 5728
    .dungeon RFC
step << Undead
    #completewith Conscript
    .subzone 362 >>前往剃刀岭
step << !Undead
    .hs >>炉石到剃刀岭
    .use 6948
    .zoneskip Durotar
step << Rogue
    #optional << Undead
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 1758 >>训练你的职业法术
    .target Kaplak
    .xp <14,1
    .xp >16,1
step << Rogue
    #optional << Undead
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 6761 >>训练你的职业法术
    .target Kaplak
    .xp <16,1
step << Priest
    #optional << Undead
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
	.train 8122 >>训练你的职业法术
    .target Tai'jin
    .xp <14,1
    .xp >16,1
step << Priest
    #optional << Undead
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
	.train 8102 >>训练你的职业法术
    .target Tai'jin
    .xp <16,1
step << Warrior
    #optional << Undead
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 285 >>训练你的职业法术
    .target Tarshaw Jaggedscar
    .xp <16,1
step << Warlock
    #optional << Undead
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dhugru|r交谈
    .train 6222 >>训练你的职业法术
    .target Dhugru Gorelust
    .xp <14,1
    .xp >16,1
step << Warlock
    #optional << Undead
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dhugru|r交谈
    .train 1455 >>训练你的职业法术
    .target Dhugru Gorelust
    .xp <16,1
step
    #label Conscript
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林|r交谈
    .accept 840 >>接任务: |cRXP_LOOT_部落的新兵|r
    .target Takrin Pathseeker
step
    #completewith next
    .subzone 379 >>前往远望哨所
step
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kargal|r交谈
    .turnin 840 >>交任务: |cRXP_FRIENDLY_部落的新兵|r
    .accept 842 >>接任务: |cRXP_LOOT_十字路口征兵|r
    .target Kargal Battlescar

]])
