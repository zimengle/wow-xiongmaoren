local _,addon = ...
if addon.gameVersion < 40000 or addon.player.faction == 'Alliance' then return end

RXPGuides.RegisterGuide([[
#cata
#mop
<< Horde
#name 1-6 提瑞斯法林地
#displayname 1-6 提瑞斯法林地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 6-10 永歌森林
#version 1
--#group RXP 大地的裂变 (部落) << cata

#defaultfor Undead
#group RXP 大地的裂变 1-80 (部落) << cata
#group RestedXP 熊猫人之谜 1-60 (部落) << mop
#subweight 10000

step << !Undead
    #completewith next
    +|cRXP_WARN_您选择的指南适用于亡灵种族. 建议您选择与您初始起始区域相同的区域|r
step
    .goto 18,29.36,70.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿加莎|r交谈
    .accept 24959 >>接任务: |cRXP_WARN_从墓穴中醒来|r
    .target Agatha
step
    .goto 18,30.07,71.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mordo|r交谈
    .turnin 24959 >>交任务: |cRXP_FRIENDLY_从墓穴中醒来|r
    .accept 28608 >>接任务: |cRXP_WARN_灰影墓穴|r
    .target Undertaker Mordo
step
    #completewith next
    .goto 18,30.33,72.31,8,0
    .goto 18,30.28,72.78,5,0
    .goto 18,30.04,72.78,5,0
    .goto 18,29.94,72.45,5 >>进入暗影坟墓
step
    .goto 18,29.67,71.98
    >>拾取桌上的|cRXP_LOOT_缝尸麻线|r和 |cRXP_LOOT_粘稠的防腐剂|r
    .complete 28608,2 --Corpse-Stitching Twine (1)
    .complete 28608,1 --Thick Embalming Fluid (1)
step
    #completewith next
    .goto 18,29.94,72.45,5,0
    .goto 18,30.04,72.78,5,0
    .goto 18,30.28,72.78,5,0
    .goto 18,30.33,72.31,8,0 >>离开墓地
step
    .goto 18,30.07,71.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mordo|r交谈
    .turnin 28608 >>交任务: |cRXP_FRIENDLY_灰影墓穴|r
    .accept 26799 >>接任务: |cRXP_WARN_不可拯救的死者|r
    .target Undertaker Mordo
step
    .goto 18,30.66,71.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Caice|r交谈
    .accept 24960 >>接任务: |cRXP_WARN_苏醒|r
    .target Caretaker Caice
step
    #completewith ValdredMoray
    >>击杀|cRXP_ENEMY_无脑的僵尸|r
    .complete 26799,1 --6/6 Mindless Zombie slain
    .mob Mindless Zombie
step
    .goto 1420/0,1640.59998,1753.80005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Redpath|r交谈
    .complete 24960,2 --1/1 Speak with Marshal Redpath
    .skipgossip
    .target Marshal Redpath
step
    .goto 18,30.24,69.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安|r交谈
    .complete 24960,1 --1/1 Speak with Lilian Voss
    .skipgossip
    .target Lilian Voss
step
    #label ValdredMoray
    .goto 1420/0,1704.70007,1740.20007
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Valdred|r交谈
    .complete 24960,3 --1/1 Speak with Valdred Moray
    .skipgossip
    .target Valdred Moray
step
    #loop
    .goto 18,30.39,69.59,0
    .waypoint 18,30.81,69.74,30,0
    .waypoint 18,30.42,70.07,30,0
    .waypoint 18,29.76,69.98,30,0
    .waypoint 18,29.27,70.03,30,0
    .waypoint 18,29.50,71.75,30,0
    .waypoint 18,30.39,69.59,30,0
    >>击杀|cRXP_ENEMY_无脑的僵尸|r
    .complete 26799,1 --6/6 Mindless Zombie slain
    .mob Mindless Zombie
step
    .goto 18,30.07,71.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mordo|r交谈
    .turnin 26799 >>交任务: |cRXP_FRIENDLY_不可拯救的死者|r
    .target Undertaker Mordo
step
    .goto 18,30.66,71.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Caice|r交谈
    .turnin 24960 >>交任务: |cRXP_FRIENDLY_苏醒|r
    .accept 25089 >>接任务: |cRXP_WARN_走出墓穴|r
    .target Caretaker Caice
step
    #completewith next
    .goto 18,31.38,66.23,8 >>>>进入教堂
step
    .goto 18,30.83,66.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈
    .accept 26801 >>接任务: |cRXP_WARN_境内的天灾|r
    .target Shadow Priest Sarvis
step
    .goto 18,31.62,65.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Saltain|r交谈
    .turnin 25089 >>交任务: |cRXP_FRIENDLY_走出墓穴|r
    .accept 26800 >>接任务: |cRXP_WARN_清扫战场|r
    .target Deathguard Saltain
step
    #completewith next
    >>击杀|cRXP_ENEMY_断骨骷髅|r和|cRXP_ENEMY_丑陋尸鬼|r
    .complete 26801,1 --8/8 Deathknell Scourge slain
    .mob Rattlecage Skeleton
    .mob Wretches Ghoul
step
    #loop
    .goto 18,31.03,63.10,0
    .waypoint 18,31.79,64.38,20,0
    .waypoint 18,31.25,64.05,20,0
    .waypoint 18,31.97,61.99,20,0
    .waypoint 18,33.11,63.07,20,0
    .waypoint 18,33.34,63.87,20,0
    .waypoint 18,33.32,64.56,20,0
    .waypoint 18,32.87,64.62,20,0
    .waypoint 18,31.97,61.99,20,0
    >>点击地面上的|cRXP_ENEMY_血色十字军尸体|r
    .complete 26800,1 --6/6 Scarlet Corpses gathered
    .mob Scarlet Corpse
step
    #loop
    .goto 18,31.24,63.43,0
    .waypoint 18,31.64,63.93,30,0
    .waypoint 18,32.18,63.21,30,0
    .waypoint 18,32.29,61.30,30,0
    .waypoint 18,31.26,61.24,30,0
    .waypoint 18,30.95,62.35,30,0
    .waypoint 18,31.24,63.43,30,0
    >>击杀|cRXP_ENEMY_断骨骷髅|r和|cRXP_ENEMY_丑陋尸鬼|r
    .complete 26801,1 --8/8 Deathknell Scourge slain
    .mob Rattlecage Skeleton
    .mob Wretches Ghoul
step
    .goto 18,31.62,65.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Saltain|r交谈
    .turnin 26800 >>交任务: |cRXP_FRIENDLY_清扫战场|r
    .target Deathguard Saltain
step
    #completewith next
    .goto 18,31.38,66.23,8 >>>>进入教堂
step
    .goto 18,30.83,66.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈
    .turnin 26801 >>交任务: |cRXP_FRIENDLY_境内的天灾|r
    .accept 31146 >>接任务: |cRXP_WARN_潦草的卷轴|r << Monk
    .accept 3096 >>接任务: |cRXP_LOOT_密文卷轴|r << Rogue
    .accept 3095 >>接任务: |cRXP_LOOT_简易卷轴|r << Warrior
    .accept 24962 >>接任务: |cRXP_WARN_字迹模糊的卷轴|r << Hunter
    .accept 3098 >>接任务: |cRXP_LOOT_雕文卷轴|r << Mage
    .accept 3097 >>接任务: |cRXP_LOOT_神圣卷轴|r << Priest
    .accept 3099 >>接任务: |cRXP_LOOT_被污染的卷轴|r << Warlock
    .target Shadow Priest Sarvis
step
    .goto 1420/0,1638.70007,1847.70007
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .accept 24961 >>接任务: |cRXP_WARN_墓中的真相|r
    .target Novice Elreth
step << Mage
    .goto 18,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .turnin 3098 >>交任务: |cRXP_FRIENDLY_雕文卷轴|r
    .accept 24965 >>接任务: |cRXP_WARN_魔法训练|r
    .train 5143 >>训练 |T136096:0|t[奥术飞弹] << Cata
    .target Isabella
step << Hunter
    .goto 18,31.45,65.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_猎手哈维尔|r交谈
    .turnin 24962 >>交任务: |cRXP_FRIENDLY_字迹模糊的卷轴|r
    .accept 24964 >>接任务: |cRXP_WARN_狩猎的兴奋|r
    .train 56641 >>训练 |T132213:0|t[稳固射击] << Cata
    .target Xavier the Huntsman
step << Priest
    .goto 18,31.10,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duesten|r交谈
    .turnin 3097 >>交任务: |cRXP_FRIENDLY_神圣卷轴|r
    .accept 24966 >>接任务: |cRXP_WARN_光与影|r
    .train 2061 >>训练 |T135907:0|t[治疗之光] << Cata
    .target Dark Cleric Duesten
step << Warlock
    .goto 18,30.92,66.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .turnin 3099 >>交任务: |cRXP_FRIENDLY_被污染的卷轴|r
    .accept 24968 >>接任务: |cRXP_WARN_黑暗的魔法|r
    .train 348 >>训练 |T135817:0|t[献祭] << Cata
    .target Maximillion
step << Mage cata
    .goto 18,31.64,66.91
	>>对|cRXP_ENEMY_训练假人|r施放|T136096:0|t[奥术飞弹]
	.complete 24965,1 --Cast Arcane Missiles (x3)
	.mob Training Dummy
step << Mage !cata
    .goto 18,31.64,66.91
	>>施放 |T135848:0|t[Frost Nova] 在|cRXP_ENEMY_训练假人|r上
	.complete 24965,2 --Cast Frost Nova
	.mob Training Dummy
step << Priest cata
    .goto 18,31.20,66.02
	>>对一名|cRXP_FRIENDLY_受伤的亡灵卫兵|r施放[快速治疗]
	.complete 24966,1 --Cast Flash Heal (x5)
	.target Wounded Deathguard
step << Priest !cata
    .goto 18,31.64,66.91
	>>施放 |T136207:0|t[暗影之痛]于 |cRXP_ENEMY_训练假人|r 上
	.complete 24966,2 --Cast Shadow Word: Pain
	.mob Training Dummy
step << Warlock
    .goto 18,31.64,66.91
	>>对|cRXP_ENEMY_训练假人|r施放|T135817:0|t[灼烧]
	.complete 24968,2 << !Cata --Cast Immolate (x3)
	.complete 24968,1 << Cata --Cast Immolate (x3)
	.mob Training Dummy
step
    #completewith next
    .goto 18,32.40,65.56,8 >>进入房屋
step
    .goto 18,32.69,65.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安|r交谈
    >>|cRXP_WARN_她可能在楼上. 不要等待RP|r
    .complete 24961,1 --1/1 Show Lilian her reflection
    .timer 9,The Truth of the Grave RP
    .skipgossip
    .target Lilian Voss
step << Monk
    .goto 465/0,1567.900,1857.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁胆海胃丁绿衫|r交谈
    .turnin 31146 >>交任务: |cRXP_FRIENDLY_潦草的卷轴|r
    .accept 31147 >>接任务: |cRXP_WARN_猛虎掌|r
    .target Ting, Strong of Stomach
step << Rogue
    .goto 18,32.53,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 3096 >>交任务: |cRXP_FRIENDLY_密文卷轴|r
    .accept 24967 >>接任务: |cRXP_WARN_刺杀！|r
    .train 2098 >>训练 |T132292:0|t[刺骨] << Cata
    .target David Trias
step << Warrior
    .goto 18,32.67,65.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 3095 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .accept 24969 >>接任务: |cRXP_WARN_冲锋陷阵|r
    .train 100 >>训练 |T132337:0|t[冲锋] << Cata
    .target Dannal Stern
step << Monk
    .goto 18,31.64,66.91
	>>施放|T606551:0|t[猛虎掌]于|cRXP_ENEMY_训练假人|r
    .complete 31147,2 --|Practice Tiger Palm: 1/1
	.mob Training Dummy
step << Rogue
    .goto 18,31.64,66.91
	>>对训练假人施放 |T132292:0|t[刺骨]
	.complete 24967,2 << !Cata --Cast Eviscerate (x3)
	.complete 24967,1 << Cata --Cast Eviscerate (x3)
	.mob Training Dummy
step << Warrior
    .goto 18,31.64,66.91
    >>对|cRXP_ENEMY_训练假人|r施放|T132337:0|t[冲锋]
	.complete 24969,2 << !Cata --Cast Charge (x3)
	.complete 24969,1 << Cata --Cast Charge (x3)
	.mob Training Dummy
step << Hunter
    .goto 18,31.64,66.91
	>>对|cRXP_ENEMY_训练假人|r施放|T132213:0|t[稳固射击]
	.complete 24964,2 << !Cata --Steady Shot (x3)
	.complete 24964,1 << Cata --Steady Shot (x3)
	.mob Training Dummy
step << Monk
    .goto 465/0,1568.100,1857.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁胆海胃丁绿衫|r交谈
    .turnin 31147 >>交任务: |cRXP_FRIENDLY_猛虎掌|r
    .target Ting, Strong of Stomach
step << Rogue
    .goto 18,32.53,65.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_David|r交谈
    .turnin 24967 >>交任务: |cRXP_FRIENDLY_刺杀！|r
    .target David Trias
step << Warrior
    .goto 18,32.67,65.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹纳尔|r交谈
    .turnin 24969 >>交任务: |cRXP_FRIENDLY_简易卷轴|r
    .target Dannal Stern
step << Hunter
    .goto 18,31.45,65.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_猎手哈维尔|r交谈
    .turnin 24964 >>交任务: |cRXP_FRIENDLY_狩猎的兴奋|r
    .target Xavier the Huntsman
step
    #completewith next
    .goto 18,31.38,66.23,8 >>>>进入教堂
step
    .goto 18,30.86,66.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_新兵艾尔雷斯|r交谈
    .turnin 24961 >>交任务: |cRXP_FRIENDLY_墓中的真相|r
    .accept 28672 >>接任务: |cRXP_WARN_战场上的执行官|r
    .target Novice Elreth
step << Mage
    .goto 18,30.91,66.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊莎贝拉|r交谈
    .turnin 24965 >>交任务: |cRXP_FRIENDLY_魔法训练|r
    .target Isabella
step << Priest
    .goto 18,31.10,66.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Duesten|r交谈
    .turnin 24966 >>交任务: |cRXP_FRIENDLY_光与影|r
    .target Dark Cleric Duesten
step << Warlock
    .goto 18,30.92,66.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克希米林|r交谈
    .turnin 24968 >>交任务: |cRXP_FRIENDLY_黑暗的魔法|r
    .target Maximillion
step
    .goto 18,32.97,61.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arren|r交谈
    .turnin 28672 >>交任务: |cRXP_FRIENDLY_战场上的执行官|r
    .accept 26802 >>接任务: |cRXP_LOOT_被诅咒者|r
    .target Executor Arren
step
    #loop
    .goto 18,32.00,57.83,0
    .waypoint 18,31.47,58.41,40,0
    .waypoint 18,32.00,57.83,40,0
    .waypoint 18,31.54,56.21,40,0
    .waypoint 18,32.39,56.15,40,0
    .waypoint 18,33.70,57.30,40,0
    .waypoint 18,35.11,56.22,40,0
    .waypoint 18,35.69,58.25,40,0
    .waypoint 18,34.92,59.39,40,0
    .waypoint 18,34.92,59.39,40,0
    .waypoint 18,34.19,59.64,40,0
    .waypoint 18,32.90,58.08,40,0
    >>击杀|cRXP_ENEMY_夜行蝙蝠|r. 击杀后搜刮它们的|cRXP_LOOT_翅膀|r
    >>击杀|cRXP_ENEMY_Wolves|r. 击杀后搜刮其|cRXP_LOOT_Paws|r
    .complete 26802,2 --4/4 Duskbat Wing
    .mob +Duskbat
    .mob +Mangy Duskbat
    .complete 26802,1 --4/4 Scavenger Paw
    .mob +Young Scavenger
    .mob +Ragged Scavenger
step
    .goto 18,32.97,61.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arren|r交谈
    .turnin 26802 >>交任务: |cRXP_FRIENDLY_被诅咒者|r
    .accept 24973 >>接任务: |cRXP_LOOT_夜行蜘蛛洞穴|r
    .target Executor Arren
step
    #completewith NWSpiders
    .subzone 155 >>前往夜之网洞穴
step
    #completewith next
    >>击杀|cRXP_ENEMY_小夜行蜘蛛|r|cRXP_WARN_矿井外|r
    .complete 24973,1 --8/8 Young Night Web Spider slain
    .mob Young Night Web Spider
step
    #label NWSpiders
    #loop
    .goto 18,25.43,59.80,0
    .waypoint 18,26.83,59.39,8,0
    .waypoint 18,26.01,59.65,8,0
    .waypoint 18,25.43,59.80,8,0
    .waypoint 18,25.04,60.35,8,0
    .waypoint 18,24.15,60.82,8,0
    .waypoint 18,23.23,60.06,8,0
    .waypoint 18,23.68,58.52,8,0
    >>击杀|cRXP_ENEMY_夜行蜘蛛|r|cRXP_WARN_在矿井内|r
    .complete 24973,2 --5/5 Night Web Spider slain
    .mob Night Web Spider
step
    #loop
    .goto 18,29.44,58.33,0
    .waypoint 18,27.47,59.05,40,0
    .waypoint 18,28.13,57.32,40,0
    .waypoint 18,29.77,56.26,40,0
    .waypoint 18,29.44,58.33,40,0
    .waypoint 18,28.63,59.20,40,0
    >>击杀矿井外的小夜行蜘蛛
    .complete 24973,1 --8/8 Young Night Web Spider slain
    .mob Young Night Web Spider
step
    .goto 18,32.97,61.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arren|r交谈
    .turnin 24973 >>交任务: |cRXP_FRIENDLY_夜行蜘蛛洞穴|r
    .accept 24970 >>接任务: |cRXP_WARN_跟僵尸一样烂|r
    .target Executor Arren
step
    .goto 18,35.76,62.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达内尔|r交谈
    .turnin 24970 >>交任务: |cRXP_FRIENDLY_跟僵尸一样烂|r
    .accept 24971 >>接任务: |cRXP_WARN_袭击腐脑营地|r
    .target Darnell
step
    #completewith next
    >>击杀|cRXP_ENEMY_腐脑魔导师|r和|cRXP_ENEMY_腐脑狂战士|r
    .complete 24971,2 --8/8 Rotbrain undead slain
    .mob Rotbrain Magus
    .mob Rotbrain Berserker
step
    .goto 18,36.50,68.82
    >>击杀|cRXP_ENEMY_治安官雷德帕斯|r
    .complete 24971,1 --1/1 Marshal Redpath slain
    .mob Marshal Redpath
step
    #loop
    .goto 18,37.07,67.02,0
    .waypoint 18,37.57,68.77,40,0
    .waypoint 18,38.07,67.55,40,0
    .waypoint 18,37.07,67.02,40,0
    .waypoint 18,35.94,68.27,40,0
    >>击杀|cRXP_ENEMY_腐脑魔导师|r和|cRXP_ENEMY_腐脑狂战士|r
    .complete 24971,2 --8/8 Rotbrain undead slain
    .mob Rotbrain Magus
    .mob Rotbrain Berserkers
step
    #completewith next
    .subzone 154 >>前往丧钟镇
step
    .goto 18,30.83,66.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_暗影牧师萨维斯|r交谈
    .turnin 24971 >>交任务: |cRXP_FRIENDLY_袭击腐脑营地|r
    .accept 24972 >>接任务: |cRXP_LOOT_重要情报|r
    .target Shadow Priest Sarvis
step
    #completewith next
    .goto 18,38.09,56.48,20,0
    .goto 18,38.41,55.69,20,0
    .goto 18,38.78,55.57,20 >>离开丧钟镇
step
    #completewith next
    .subzone 4916 >>前往卡尔斯顿庄园
step
    #xprate <1.2
    .goto 18,44.75,53.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_西米尔|r交谈
    .turnin 24972 >>交任务: |cRXP_FRIENDLY_重要情报|r
    .accept 24978 >>接任务: |cRXP_WARN_收割收割者|r
    .target Deathguard Simmer
step
    #xprate >1.19
    .goto 18,44.75,53.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_西米尔|r交谈
    .turnin 24972 >>交任务: |cRXP_FRIENDLY_重要情报|r
    .target Deathguard Simmer
step
    #xprate <1.2
    .goto 18,44.61,53.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Johaan|r交谈
    .accept 24975 >>接任务: |cRXP_LOOT_悲伤之地|r
    .target Apothecary Johaan
step
    #xprate <1.2
    #completewith next
    .goto 18,44.49,53.85,3,0
    .goto 18,44.63,53.75,3 >>上楼
step
    #xprate <1.2
    .goto 18,44.75,53.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞德里克|r交谈
    .accept 24974 >>接任务: |cRXP_WARN_从未如此孤单|r
    .target Sedrick Calston
step << Hunter Cata
    .goto 18,44.97,53.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_外面的Darna|r交谈
    .train 2973 >>训练你的职业法术
    .target Darna Woad
    .xp <6,1
step << Warrior Cata
    .goto 18,45.03,53.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_卡尔拉|r交谈
    .train 34428 >>训练你的职业法术
    .target Karla Fain
    .xp <5,1
step << Mage Cata
    .goto 18,44.78,53.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|r|cRXP_FRIENDLY_Larah|r交谈
    .train 2136 >>训练你的职业法术
    .target Larah Firesong
    .xp <5,1
step << Priest Cata
    .goto 18,44.78,53.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_Claressa|r交谈
    .train 589 >>训练你的职业法术
    .target Dark Cleric Claressa
    .xp <5,1
step << Warlock Cata
    .goto 18,44.73,53.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_Maressa|r交谈
    .train 87389 >>训练你的职业法术
    .target Maressa Milner
    .xp <5,1
step
    #xprate <1.2
    #completewith next
    >>击杀|cRXP_ENEMY_提瑞斯法农夫|r
    .complete 24978,1 --10/10 Tirisfal Farmer slain
    .mob Tirisfal Farmer
step
    #xprate <1.2
    #loop
    .goto 18,41.12,51.69,0
    .goto 18,35.25,50.90,0
    .waypoint 18,41.12,51.69,30,0
    .waypoint 18,39.67,51.55,30,0
    .waypoint 18,36.95,51.78,30,0
    .waypoint 18,35.25,50.90,30,0
    .waypoint 18,36.88,49.70,30,0
    >>拾取地面上的|cRXP_LOOT_提瑞斯法南瓜|r
    .complete 24975,1 --10/10 Tirisfal Pumpkin
step
    #xprate <1.2
    #loop
    .goto 18,41.12,51.69,0
    .goto 18,35.25,50.90,0
    .waypoint 18,41.12,51.69,30,0
    .waypoint 18,39.67,51.55,30,0
    .waypoint 18,36.95,51.78,30,0
    .waypoint 18,35.25,50.90,30,0
    .waypoint 18,36.88,49.70,30,0
    >>击杀|cRXP_ENEMY_提瑞斯法农夫|r
    .complete 24978,1 --10/10 Tirisfal Farmer slain
    .mob Tirisfal Farmer
step
    #xprate <1.2
    .goto 18,34.37,43.68,40,0
    .goto 18,35.90,42.92,40,0
    .goto 18,36.66,40.40,40,0
    .goto 18,35.91,43.85
    .use 52059 >>攻击一个|cRXP_ENEMY_邪鳍鱼人|r, 直到它开始逃跑, 然后使用你的 |T133802:0|t[鱼人拴绳] 捕获它
    .complete 24974,1 --1/1 Vile Fin captured
    .mob File Vin Puddlejumper
    .mob File Vin Minor Oracle
step
    #xprate <1.2
    #completewith next
    .subzone 4916 >>前往卡尔斯顿庄园
step
    #xprate <1.2
    .goto 18,44.75,53.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_西米尔|r交谈
    .turnin 24978 >>交任务: |cRXP_FRIENDLY_收割收割者|r
    .target Deathguard Simmer
step
    #xprate <1.2
    .goto 18,44.61,53.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Johaan|r交谈
    .turnin 24975 >>交任务: |cRXP_FRIENDLY_悲伤之地|r
    .target Apothecary Johaan
step
    #xprate <1.2
    #completewith MurlocDelivery
    .goto 18,44.49,53.85,3,0
    .goto 18,44.63,53.75,3 >>上楼
step
    #xprate <1.2
    .goto 18,44.75,53.65
    >>交付|cRXP_FRIENDLY_鱼人|r
    .complete 24974,2 --1/1 Vile Fin returned
    .target Sedrick Calston
step
    #xprate <1.2
    #label MurlocDelivery
    .goto 18,44.75,53.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞德里克|r交谈
    .turnin 24974 >>交任务: |cRXP_FRIENDLY_从未如此孤单|r
    .target Sedrick Calston
step
    #xprate <1.2
    #completewith next
    .goto 18,44.49,53.86,5,0
    .goto 18,44.75,53.65 >>上楼归还|cRXP_FRIENDLY_鱼人|r
    .complete 24974,2 --1/1 Vile Fin returned
step
    #xprate <1.2
    .goto 18,44.75,53.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞德里克|r交谈
    .turnin 24974 >>交任务: |cRXP_FRIENDLY_从未如此孤单|r
    .target Sedrick Calston
step << Hunter Cata
    #xprate <1.2
    .goto 18,44.97,53.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_外面的Darna|r交谈
    .train 2973 >>训练你的职业法术
    .target Darna Woad
    .xp <6,1
step << Warrior Cata
    #xprate <1.2
    .goto 18,45.03,53.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_卡尔拉|r交谈
    .train 34428 >>训练你的职业法术
    .target Karla Fain
    .xp <5,1
step << Mage Cata
    #xprate <1.2
    .goto 18,44.78,53.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|r|cRXP_FRIENDLY_Larah|r交谈
    .train 2136 >>训练你的职业法术
    .target Larah Firesong
    .xp <5,1
step << Priest Cata
    #xprate <1.2
    .goto 18,44.78,53.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_Claressa|r交谈
    .train 589 >>训练你的职业法术
    .target Dark Cleric Claressa
    .xp <5,1
step << Warlock Cata
    #xprate <1.2
    .goto 18,44.73,53.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_Maressa|r交谈
    .train 87389 >>训练你的职业法术
    .target Maressa Milner
    .xp <5,1
step
    #completewith next
    .goto 18,45.86,48.38,40,0
    .goto 18,46.61,47.42,40,0
    .goto 18,47.75,47.67
    .deathskip >>尽可能多地拉怪到|r灵魂医者|r处死亡并重生, 或者前往布瑞尔
step << Undead
    .goto 18,60.13,52.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫里斯|r交谈
    .accept 6321 >>接任务: |cRXP_WARN_瑟伯切尔的补给|r
    .target Deathguard Morris
step
    .goto 18,60.87,51.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板瑞尼|cRXP_FRIENDLY_旅店老板瑞尼|r交谈
    .home >>将你的[炉石]设置为布瑞尔
    .target Innkeeper Renee
    .isQuestAvailable 6323
step << Undead
    .goto 18,58.84,51.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Anette|r交谈
    .turnin 6321 >>交任务: |cRXP_FRIENDLY_向博迪瑞格回报|r
    .accept 6323 >>接任务: |cRXP_LOOT_飞往幽暗城|r
    .target Anette Williams
step
    .goto 18,58.84,51.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Anette|r交谈
    .fly Undercity >>飞往幽暗城
    .target Anette Williams
step << Undead
    .goto 90,61.49,41.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gordon|r交谈
    .turnin 6323 >>交任务: |cRXP_FRIENDLY_飞往幽暗城|r
    .accept 6322 >>接任务: |cRXP_LOOT_迈克尔·加勒特|r
    .target Gordon Wendham
step << Undead
    .goto 90,63.28,48.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦克尔|r交谈
    .turnin 6322 >>交任务: |cRXP_FRIENDLY_迈克尔·加勒特|r
    .accept 6324 >>接任务: |cRXP_WARN_向博迪瑞格回报|r
    .target Michael Garrett
step << Undead
    #completewith SilvermoonPort
    .goto 90,59.98,47.60,10,0
    .goto 90,59.16,44.02,8,0
    .goto 90,65.87,43.99,15 >>乘坐电梯前往楼上
step << !Undead
    #completewith SilvermoonPort
    .goto 18,66.21,1.16,20,0
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step
    #label SilvermoonPort
    .goto 1420/0,269.10001,1804.59998,15,0
    .goto 1420/0,346.60001,1806.00000
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
step
    .goto 110,72.396,85.242,12,0
    .goto 1941/0,-4877.20020,7012.10059
    .zone Eversong Woods >>前往: |cRXP_PICK_永歌森林|r
step
    .goto Eversong Woods,50.331,50.770
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_游侠杰拉|r交谈
    .accept 8475 >>接任务: |cRXP_LOOT_死亡之痕|r
    .target Ranger Jaela
    ]])
