local _,addon = ...
if addon.gameVersion < 40000 or addon.player.faction == 'Alliance' then return end

RXPGuides.RegisterGuide([[
#cata
#mop
<< Horde
#name 1-6 莫高雷
#displayname 1-6 莫高雷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 6-10 莫高雷
#version 1
--#group RXP 大地的裂变 (部落) << cata

#defaultfor Tauren
#group RXP 大地的裂变 1-80 (部落) << cata
#group RestedXP 熊猫人之谜 1-60 (部落) << mop
#subweight 10000

step << !Tauren
    #completewith next
    +|cRXP_WARN_您已选择适用于牛头人的指南. 由于该区域存在仅限牛头人的种族任务, 我们不建议您在此区域进行任务. 建议您选择与您起始时相同的起始区域|r
step
    .goto 7,45.15,75.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍克温|r交谈
    .accept 14449 >>接任务: |cRXP_WARN_第一步|r
    .target Chief Hawkwind
step
    .goto 7,48.95,78.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 14449 >>交任务: |cRXP_FRIENDLY_第一步|r
    .accept 14452 >>接任务: |cRXP_LOOT_力量仪祭|r
    .target Grull Hawkwind
step
    .goto 7,49.20,78.98,30,0
    .goto 7,49.56,78.24,30,0
    .goto 7,49.33,77.59,30,0
    .goto 7,50.23,78.31,30,0
    .goto 7,50.92,78.32,30,0
    .goto 7,50.31,77.25,30,0
    .goto 7,49.56,78.24
    >>击杀|cRXP_ENEMY_刺背野猪人|r
    .complete 14452,1 --Bristleback Invaders (6)
    .mob Bristleback Invader
step
    .goto 7,48.95,78.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 14452 >>交任务: |cRXP_FRIENDLY_力量仪祭|r
    .accept 24852 >>接任务: |cRXP_WARN_被囚禁的部族|r
    .target Grull Hawkwind
step
    .goto 7,52.06,80.48,30,0
    .goto 7,52.15,79.93,30,0
    .goto 7,52.06,78.28,30,0
    .goto 7,52.17,77.75,30,0
    .goto 7,52.21,76.72,30,0
    .goto 7,52.57,74.81,30,0
    .goto 7,50.89,82.37,30,0
    .goto 7,50.67,83.12,30,0
    .goto 7,52.06,80.48
    >>点击|cRXP_PICK_Cages|r解救被俘的勇士|cRXP_FRIENDLY_Captured Braves|r
    .complete 24852,1 --Braves Freed (4)
    .target Captured Brave
step
    .goto 7,48.95,78.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格鲁尔|r交谈
    .turnin 24852 >>交任务: |cRXP_FRIENDLY_被囚禁的部族|r
    .accept 14458 >>接任务: |cRXP_WARN_去找阿达娜|r
    .target Grull Hawkwind
step
    .goto 7,46.18,82.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿达娜·雷角|r交谈
    .turnin 14458 >>交任务: |cRXP_FRIENDLY_去找阿达娜|r
    .accept 14455 >>接任务: |cRXP_WARN_阻止号角手|r
    .accept 14456 >>接任务: |cRXP_WARN_勇气仪祭|r
    .target Adana Thunderhorn
step
    #loop
    .goto 7,46.72,87.92,0
    .goto 7,47.05,87.38,30,0
    .goto 7,46.72,87.92,30,0
    .goto 7,46.45,88.75,30,0
    .goto 7,47.33,89.49,30,0
    .goto 7,47.90,89.03,30,0
    .goto 7,47.90,88.05,30,0
    >>击杀|cRXP_ENEMY_刺背枪匪|r. 从他们身上搜刮|cRXP_LOOT_步枪|r
    >>击杀|cRXP_ENEMY_刺背号角手|r
    .complete 14456,1 --Stolen Rifle (7)
    .mob +Bristleback Gun Thiefs
    .complete 14455,1 --Bristleback Thorncaller (7)
    .mob +Bristleback Thorncaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Adana|r和|cRXP_FRIENDLY_Rohaku|r交谈
    .turnin 14456 >>交任务: |cRXP_FRIENDLY_勇气仪祭|r
    .turnin 14455 >>交任务: |cRXP_FRIENDLY_阻止号角手|r
    .accept 14459 >>接任务: |cRXP_LOOT_斗猪|r
    .accept 14461 >>接任务: |cRXP_WARN_邪恶的食粮|r
    .goto 7,46.18,82.61
    .accept 31165 >>接受任务：手写便笺 << Monk
    .accept 3092 >>接任务: |cRXP_WARN_风化便笺|r << Hunter
    .accept 3091 >>接任务: |cRXP_LOOT_简易便笺|r << Warrior
    .accept 27015 >>接任务: |cRXP_WARN_神圣的信件|r << Paladin
    .accept 3094 >>接任务: |cRXP_LOOT_绿色便笺|r << Druid
    .accept 3093 >>接任务: |cRXP_LOOT_符文便笺|r << Shaman
    .accept 27014 >>接任务: |cRXP_WARN_圣洁的信件|r << Priest
    .goto 7,46.15,82.32
    .target Adana Thunderhorn
    .target Rohaku Stonehoof
step
    #completewith ThirdTrough
    >>击杀|cRXP_ENEMY_重甲斗猪|r
    .complete 14459,1 --Armored Battleboar (10)
    .mob Armored Battleboar
step
    .goto 7,44.70,87.82
    >>|cRXP_WARN_使用|r|T135432:0|t[阿达纳的火炬]|cRXP_WARN_next 到第一个水槽旁|r
    .complete 14461,1 --First Trough (1)
    .use 49539
step
    .goto 7,44.32,88.71
    >>|cRXP_WARN_使用|r|T135432:0|t[阿达纳的火炬]|cRXP_WARN_在第二个水槽旁边|r
    .complete 14461,2 --Second Trough (1)
    .use 49539
step
    #label ThirdTrough
    .goto 1412/1,-265.00000,-3405.80005
    >>|cRXP_WARN_使用|r|T135432:0|t[阿达纳的火炬]|cRXP_WARN_在第三个水槽旁边|r
    .complete 14461,3 --Third Trough (1)
    .use 49539
step
#loop
	.line 7,45.73,88.52,44.76,89.60,44.23,88.74,44.22,87.98,44.72,87.69,45.20,87.83,45.73,88
	.goto 7,45.73,88.52,30,0
	.goto 7,44.76,89.60,30,0
	.goto 7,44.23,88.74,30,0
	.goto 7,44.22,87.98,30,0
	.goto 7,44.72,87.69,30,0
	.goto 7,45.20,87.83,30,0
	.goto 7,45.73,88.00,30,0
    >>击杀|cRXP_ENEMY_重甲斗猪|r
    .complete 14459,1 --Armored Battleboar (10)
    .mob Armored Battleboar
step
    .goto 7,46.18,82.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿达娜·雷角|r交谈
    .turnin 14459 >>交任务: |cRXP_FRIENDLY_斗猪|r
    .turnin 14461 >>交任务: |cRXP_FRIENDLY_邪恶的食粮|r
    .accept 14460 >>接任务: |cRXP_WARN_荣誉仪祭|r
    .target Adana Thunderhorn
step
    .goto 7,41.08,81.42
    >>击杀|cRXP_ENEMY_尖啸·刺鬃酋长|r, 击败他后可获得|cRXP_LOOT_鬃毛|r
    .complete 14460,1 --Mane of Thornmantle (1)
    .mob Chief Squealer Thornmantle
step
    #completewith next
    .hs >>传送至纳拉其营地
    .cooldown item,6948,>0
step
    .goto 7,45.17,75.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍克温|r交谈
    .turnin 14460 >>交任务: |cRXP_FRIENDLY_荣誉仪祭|r
    .accept 24861 >>接任务: |cRXP_WARN_最后的仪式，最初的仪式|r
    .target Chief Hawkwind
step
    .goto 7,45.11,75.39
    >>|cRXP_WARN_使用|r|T132813:0|t[水罐]
    .complete 24861,1 --Offering Placed (1)
    .use 50465
step
    .goto 7,45.17,75.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍克温|r交谈
    .turnin 24861 >>交任务: |cRXP_FRIENDLY_最后的仪式，最初的仪式|r
    .accept 23733 >>接任务: |cRXP_LOOT_大地之母仪祭|r
    .target Chief Hawkwind
step << Monk
    .goto 462/1,-260.800,-2910.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烁雨|r交谈
    .turnin 31165 >>上交手写便笺
    .accept 31166 >>接任务: |cRXP_WARN_猛虎掌|r
    .target Shoyu
step << Hunter
    .goto 7,45.28,75.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .turnin 3092 >>交任务: |cRXP_FRIENDLY_风化便笺|r
    .accept 27021 >>接任务: |cRXP_WARN_猎人之路|r
    .train 56641 >>训练 |T132213:0|t[稳固射击] << Cata
    .target Lanka Farshot
step << Warrior
    .goto 7,44.99,75.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 3091 >>交任务: |cRXP_FRIENDLY_简易便笺|r
    .accept 27020 >>接任务: |cRXP_WARN_第一课|r
    .train 100 >>训练 |T132337:0|t[冲锋] << Cata
    .target Harutt Thunderhorn
step << Paladin
    .goto 7,44.96,75.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者赫拉库|r交谈
    .turnin 27015 >>交任务: |cRXP_FRIENDLY_神圣的信件|r
    .accept 27023 >>接任务: |cRXP_WARN_烈日行者之路|r
    .train 20271 >>训练 |T135959:0|t[裁决] << Cata
    .train 20154 >>训练 |T135960:0|t[正义之印] << Cata
    .target Sunwalker Helaku
step << Druid cata
    .goto 7,45.22,75.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .turnin 3094 >>交任务: |cRXP_FRIENDLY_绿色便笺|r
    .accept 27067 >>接任务: |cRXP_WARN_回春之触|r
    .train 774 >>训练 |T136081:0|t[复苏] << Cata
    .target Gart Mistrunner
step << Druid !cata
    .goto 7,45.22,75.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .turnin 3094 >>交任务: |cRXP_FRIENDLY_绿色便笺|r
    .accept 27067 >>接任务: |cRXP_WARN_回春之触|r
    .target Gart Mistrunner
step << Shaman
    .goto 7,45.09,75.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .turnin 3093 >>交任务: |cRXP_FRIENDLY_符文便笺|r
    .accept 27027 >>接任务: |cRXP_WARN_根源打击|r
    .train 73899 >>训练 |T460956:0|t[根源打击] << Cata
    .target Meela Dawnstrider
step << Priest cata
    .goto 7,44.99,75.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ravenfeather|r交谈
    .turnin 27014 >>交任务: |cRXP_FRIENDLY_圣洁的信件|r
    .accept 27066 >>接任务: |cRXP_WARN_快速治疗|r
    .train 2061 >>训练 |T135907:0|t[治疗之光] << Cata
    .target Seer Ravenfeather
step << Priest !cata
    .goto 7,44.99,75.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ravenfeather|r交谈
    .turnin 27014 >>交任务: |cRXP_FRIENDLY_圣洁的信件|r
    .accept 27066 >>接任务: |cRXP_WARN_护井者索兰尼亚|r
    .target Seer Ravenfeather
step << Monk
    .goto 7,45.43,75.39
	>>施放|T606551:0|t[猛虎掌]于|cRXP_ENEMY_训练假人|r
    .complete 31166,2 --|Practice Tiger Palm: 1/1
	.mob Training Dummy
step << Hunter
    .goto 7,45.43,75.39
	>>对|cRXP_ENEMY_训练假人|r施放|T132213:0|t[稳固射击]
	.complete 27021,2 << !Cata --Steady Shot (x3)
	.complete 27021,1 << Cata --Steady Shot (x3)
	.mob Training Dummy
step << Warrior
    .goto 7,45.43,75.39
	>>对|cRXP_ENEMY_训练假人|r施放|T132337:0|t[冲锋]
	.complete 27020,2 << !Cata --Cast Charge (x3)
	.complete 27020,1 << Cata --Cast Charge (x3)
	.mob Training Dummy
step << Paladin cata
    .goto 7,45.43,75.39
	>>对训练假人施放 |T135959:0|t[审判]
	.complete 27023,1 --Cast Judgement (x3)
	.mob Training Dummy
step << Paladin !cata
    .goto 7,45.43,75.39
	>>施放 |T135961:0|t[指挥之印], 然后攻击一个|cRXP_ENEMY_训练假人|r
	.complete 27023,2
    .mob Training Dummy
step << Druid cata
    .goto 7,45.65,75.35
	>>对|cRXP_FRIENDLY_受伤的卫兵|r 施放 |T136081:0|t[复苏]
	.complete 27067,1 << Cata --Cast Rejuvenation (x1)
	.target Wounded Brave
step << Druid !cata
    .goto 7,45.43,75.39
	>>施放|T136096:0|t[月火术]于|cRXP_ENEMY_训练假人|r
	.complete 27067,2 --Cast Moonfire
	.mob Training Dummy
step << Shaman
    .goto 7,45.43,75.39
	>>对 |cRXP_ENEMY_训练假人|r施放 |T460956:0|t[根源打击]
	.complete 27027,2 << !Cata --Cast Primal Strike (x3)
	.complete 27027,1 << Cata --Cast Primal Strike (x3)
	.mob Training Dummy
step << Priest
    .goto 7,45.65,75.35
	>>对一名受伤的卫兵施放 |T135907:0|t[治疗之光]
	.complete 27066,2 << !Cata --Cast Flash Heal (x5)
	.complete 27066,1 << Cata --Cast Flash Heal (x5)
	.target Wounded Brave
step << Monk
    .goto 462/1,-261.100,-2910.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烁雨|r交谈
    .turnin 31166 >>交任务: |cRXP_FRIENDLY_猛虎掌|r
    .target Shoyu
step << Hunter
    .goto 7,45.28,75.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰卡·远箭|r交谈
    .turnin 27021 >>交任务: |cRXP_FRIENDLY_猎人之路|r
    .target Lanka Farshot
step << Warrior
    .goto 7,44.99,75.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈鲁特·雷角|r交谈
    .turnin 27020 >>交任务: |cRXP_FRIENDLY_第一课|r
    .target Harutt Thunderhorn
step << Paladin
    .goto 7,44.96,75.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_烈日行者赫拉库|r交谈
    .turnin 27023 >>交任务: |cRXP_FRIENDLY_烈日行者之路|r
    .target Sunwalker Helaku
step << Druid cata
    .goto 7,45.22,75.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .turnin 27067 >>交任务: |cRXP_FRIENDLY_回春之触|r
    .target Gart Mistrunner
step << Druid !cata
    .goto 7,45.22,75.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gart|r交谈
    .turnin 27067 >>交任务: |cRXP_FRIENDLY_回春之触|r
    .target Gart Mistrunner
step << Shaman
    .goto 7,45.09,75.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅拉|r交谈
    .turnin 27027 >>交任务: |cRXP_FRIENDLY_根源打击|r
    .target Meela Dawnstrider
step << Priest cata
    .goto 7,44.99,75.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ravenfeather|r交谈
    .turnin 27066 >>交任务: |cRXP_FRIENDLY_快速治疗|r
    .target Seer Ravenfeather
step << Priest !cata
    .goto 7,44.99,75.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ravenfeather|r交谈
    .turnin 27066 >>交任务: |cRXP_FRIENDLY_护井者索兰尼亚|r
    .target Seer Ravenfeather
step
    #completewith next
    .goto 1412/1,-114.60000,-2976.90015,12,0
    .goto 1412/1,-48.40000,-2907.10010,12,0
    .goto 1412/1,7.20000,-2900.60010,12,0
    .goto 1412/1,-42.80000,-2933.50000,30 >>沿着小路前往山顶
step
    .goto 1412/1,-42.80000,-2933.50000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dyami|r交谈
    .turnin 23733 >>交任务: |cRXP_FRIENDLY_大地之母仪祭|r
    .accept 24215 >>接任务: |cRXP_WARN_风之仪式|r
    .target Dyami Windsoar
step
    #completewith next
    .goto 7,41.27,75.22,15,0
    .goto 7,41.36,74.10,15,0
    .deathskip >>跟随箭头指示跳下山. 死亡后会在|r灵魂医者|r处复活
step
    .goto 7,48.35,53.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ahab|r交谈
    .accept 11129 >>接任务: |cRXP_LOOT_凯雷失踪了！|r
    .target Ahab Wheathoof
    ]])

RXPGuides.RegisterGuide([[
#cata
#mop
<< Horde
#name 6-10 莫高雷
#displayname 6-10 莫高雷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 10-22 艾萨拉
#version 1
--#group RXP 大地的裂变 (部落) << cata

#defaultfor Tauren
#group RXP 大地的裂变 1-80 (部落) << cata
#group RestedXP 熊猫人之谜 1-60 (部落) << mop
#subweight 10000


step
    .goto 7,48.35,53.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ahab|r交谈
    .accept 11129 >>接任务: |cRXP_LOOT_凯雷失踪了！|r
    .target Ahab Wheathoof
step << Hunter Cata
    .goto 7,47.94,55.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 2973 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <6,1
step
    .goto 7,47.15,56.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .accept 26188 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target Maur Raincaller
    .xp <6,1
step << Tauren
    .goto 7,46.06,58.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦尔戈|r交谈
    .accept 6361 >>接任务: |cRXP_LOOT_一捆兽皮|r
    .vendor >>出售垃圾并修理 << Paladin/Priest
    .target Varg Windwhisper
step << Warrior/Shaman/Paladin
    .goto 7,45.91,58.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T133053:0|t[木槌棒] (6银66铜) 的钱. 如果暂时不够, 稍后再回来
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior/Shaman/Paladin
    .goto 7,45.91,58.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈|cRXP_BUY_
    >>|cRXP_BUY_从他那里购买|r|T133053:0|t[木槌棒] |cRXP_BUY_|r
    .collect 2493,1,14438,1 --Collect Wooden Mallet (1)
    .money <0.0665
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto 7,45.75,57.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯纳·鹰眼|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T135611:0|t[精制短枪](3银93铜). 如果暂时不够, 稍后再回来处理
    .target Kennah Hawkseye
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto 7,45.75,57.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah|r|cRXP_BUY_交谈|r
    >>|cRXP_BUY_从他那里购买|r|T135611:0|t[精制短枪] |cRXP_BUY_|r
    .collect 2509,1,14438,1 --Ornate Blunderbuss (1)
    .target Kennah Hawkseye
    .money <0.0360
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior/Shaman/Paladin
    #completewith PalemaneGnolls
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #completewith PalemaneGnolls
    +装备 |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Tauren
    .goto 7,47.44,58.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克|r交谈
    .turnin 6361 >>交任务: |cRXP_FRIENDLY_一捆兽皮|r
    .accept 6362 >>接任务: |cRXP_LOOT_飞往雷霆崖|r
    .target Tak
step
    .goto 1412/1,-347.39999,-2365.30005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    .vendor >>|cRXP_BUY_最多购买20|r|T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r|T133968:0|t[刚出炉的面包] << !Warrior !Hunter
    .vendor >>|cRXP_BUY_最多购买20个|r |T133968:0|t[刚出炉的面包] << Warrior/Hunter
    .target Innkeeper Kauth
step
    .goto 1412/1,-392.89999,-2333.50000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ahmo|r交谈
    .turnin 24215 >>交任务: |cRXP_FRIENDLY_风之仪式|r
    .accept 14438 >>接任务: |cRXP_LOOT_土地之争|r
    .target Ahmo Thunderhorn
step
    .goto 7,48.77,58.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .accept 761 >>接任务: |cRXP_LOOT_猎捕猛鹫|r
    .target Harken Windtotem
step << Shaman Cata
    .goto 7,48.47,58.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈(|cRXP_FRIENDLY_Tarl|r)
    .train 8042 >>训练你的职业法术
    .target Tarl Cloudsong
step << Priest Cata
    .goto 7,48.76,58.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alsoomse|r交谈
    .train 589 >>训练你的职业法术
    .target Seer Alsoomse
step << Druid Cata
    .goto 7,48.56,59.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 8921 >>训练你的职业法术
    .target Gennia Runetotem
step << Paladin Cata
    .goto 7,48.78,58.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Iopi|r交谈
    .train 465 >>训练你的职业法术
    .target Sunwalker Iopi
step
    .goto 7,48.62,59.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .accept 20440 >>接任务: |cRXP_LOOT_毒水|r
    .target Mull Thunderhorn
step << Warrior Cata
    .goto 7,49.55,59.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 34428 >>训练你的职业法术
    .target Krang Stonehoof
step
    #completewith WCleansing1
    >>击杀|cRXP_ENEMY_猛鹫|r. 掠夺其|cRXP_LOOT_羽毛|r`
    >>|cRXP_WARN_这个任务无需立即完成|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Swoop
    .mob Wiry Swoop
step
    #completewith next
    >>击杀|cRXP_ENEMY_狼|r. 掠夺其|cRXP_LOOT_爪子|r`
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 掠夺它们以获取|cRXP_LOOT_爪子|r和 |T134343:0|t[|cRXP_LOOT_鲜嫩的陆行鸟肉|r]
    .complete 20440,1 --Prairie Wolf Paw (6)
    .complete 20440,2 --Plainstrider Talon (4)
    .collect 33009,1,11129,1 --Tender Strider Meat (1)
    .mob Prairie Wolf
    .mob Adult Plainstrider
step
    #label PalemaneGnolls
#loop
	.line 7,47.96,69.82,47.20,70.68,47.71,71.57,48.37,71.84,48.83,72.00,49.84,70.48,49.24,70.24,48.87,69.80,47.96,69.82
	.goto 7,47.96,69.82,30,0
	.goto 7,47.20,70.68,30,0
	.goto 7,47.71,71.57,30,0
	.goto 7,48.37,71.84,30,0
	.goto 7,48.83,72.00,30,0
	.goto 7,49.84,70.48,30,0
	.goto 7,49.24,70.24,30,0
	.goto 7,48.87,69.80,30,0
	.goto 7,47.96,69.82,30,0
#loop
	.line 7,51.94,69.95,52.07,70.98,52.52,71.73,52.92,72.36,53.62,72.44,53.84,72.04,54.25,72.15,55.07,72.12,55.52,71.26,55.22,70.65,54.55,70.22,53.92,70.07,53.15,69.85,52.58,70.17,51.94,69
	.goto 7,51.94,69.95,30,0
	.goto 7,52.07,70.98,30,0
	.goto 7,52.52,71.73,30,0
	.goto 7,52.92,72.36,30,0
	.goto 7,53.62,72.44,30,0
	.goto 7,53.84,72.04,30,0
	.goto 7,54.25,72.15,30,0
	.goto 7,55.07,72.12,30,0
	.goto 7,55.52,71.26,30,0
	.goto 7,55.22,70.65,30,0
	.goto 7,54.55,70.22,30,0
	.goto 7,53.92,70.07,30,0
	.goto 7,53.15,69.85,30,0
	.goto 7,52.58,70.17,30,0
	.goto 7,51.94,69.00,30,0
    >>击杀|cRXP_ENEMY_白鬃剥皮工|r和|cRXP_ENEMY_白鬃偷猎者|r和|cRXP_ENEMY_白鬃制革工|r
    .complete 14438,1 --Palemane Gnolls (15)
    .mob Palemane Skinner
    .mob Palemane Poacher
    .mob Palemane Tanner
step
    #loop
    .goto 7,48.25,67.61,0
    .goto 7,50.61,68.08,40,0
    .goto 7,50.23,66.00,40,0
    .goto 7,51.06,64.06,40,0
    .goto 7,52.38,63.49,40,0
    .goto 7,52.98,62.11,40,0
    .goto 7,54.02,61.22,40,0
    .goto 7,55.23,62.26,40,0
    .goto 7,56.63,62.25,40,0
    .goto 7,56.75,64.83,40,0
    .goto 7,56.06,67.30,40,0
    .goto 7,48.25,67.61,40,0
    >>击杀|cRXP_ENEMY_狼|r. 掠夺其|cRXP_LOOT_爪子|r`
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 掠夺它们以获取|cRXP_LOOT_爪子|r和 |T134343:0|t[|cRXP_LOOT_鲜嫩的陆行鸟肉|r]
    .complete 20440,1 --Prairie Wolf Paw (6)
    .complete 20440,2 --Plainstrider Talon (4)
    .collect 33009,1,11129,1 --Tender Strider Meat (1)
    .mob Prairie Wolf
    .mob Adult Plainstrider
step
    #completewith AcceptDangers
    .goto 1412/1,-354.10001,-2318.40015,0
    .goto 1412/1,-488.20001,-2347.90015,0
    .use 33009>>找到|cRXP_FRIENDLY_凯雷|r. 使用|T134343:0|t[|cRXP_LOOT_鲜嫩的陆行鸟肉|r]喂他
    >>|cRXP_WARN_他在血蹄村周围转圈奔跑|r
    .complete 11129,1 --1/1 Kyle fed
    .unitscan Kyle the Frenzied
step
    #label WCleansing1
    .goto 7,48.62,59.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 20440 >>交任务: |cRXP_FRIENDLY_毒水|r
    .accept 24440 >>接任务: |cRXP_LOOT_净化冰蹄之井|r
    .target Mull Thunderhorn
step
    .goto 7,48.77,58.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target Harken Windtotem
    .isQuestComplete 761
step
    .goto 1412/1,-392.89999,-2333.50000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ahmo|r交谈
    .turnin 14438 >>交任务: |cRXP_FRIENDLY_土地之争|r
    .accept 14491 >>接任务: |cRXP_WARN_不休的大地|r
    .accept 24459 >>接任务: |cRXP_WARN_摩林·云行者|r
    .target Maur Raincaller
step
    .goto 7,47.15,56.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .accept 26188 >>接任务: |cRXP_LOOT_马兹拉纳其|r
    .target Maur Raincaller
step << Hunter Cata
    .goto 7,47.94,55.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 2973 >>训练你的职业法术
    .target Yaw Sharpmane
step << Warrior/Shaman/Paladin
    .goto 7,45.91,58.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mahnott|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T133053:0|t[木槌棒] (6银65铜) 的钱. 如果不够, 稍后再来
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior/Shaman/Paladin
    .goto 7,45.91,58.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Mahnott|r|cRXP_BUY_交谈. 向他购买|r|T133053:0|t[木槌棒] |cRXP_BUY_
    .collect 2493,1,24440,1 --Collect Wooden Mallet (1)
    .money <0.0665
    .target Mahnott Roughwound
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto 7,45.75,57.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯纳·鹰眼|r交谈
    .vendor >>出售垃圾. 如果能凑够购买一把 |T135611:0|t[精制短枪](3银93铜). 如果暂时不够, 稍后再回来处理
    .target Kennah Hawkseye
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    .goto 7,45.75,57.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kennah|r|cRXP_BUY_交谈. 从他处购买|r|T135611:0|t[精制短枪] |cRXP_BUY_
    .collect 2509,1,24440,1 --Ornate Blunderbuss (1)
    .target Kennah Hawkseye
    .money <0.0360
    .itemStat 18,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Warrior/Shaman/Paladin
    #completewith WinterhoofWell
    +装备 |T133053:0|t[木槌棒]
    .use 2493
    .itemcount 2493,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << Hunter
    #completewith WinterhoofWell
    +装备 |T135611:0|t[精制短枪]
    .use 2509
    .itemcount 2509,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step
    #label AcceptDangers
    .goto 1412/1,-384.80002,-2397.00000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁尔|r交谈
    .accept 743 >>接任务: |cRXP_LOOT_风怒鹰身人|r
    .target Ruul Eagletalon
step
    #completewith next
    >>击杀|cRXP_ENEMY_猛鹫|r. 掠夺其|cRXP_LOOT_羽毛|r`
    >>|cRXP_WARN_这个任务无需立即完成|r
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Swoop
    .mob Wiry Swoop
step
    #label WinterhoofWell
    .goto 7,53.46,65.34
    >>|cRXP_WARN_使用|r|T135139:0|t[冰蹄之井净化图腾] |cRXP_WARN_靠近井边|r
    .use 5411
    .complete 24440,1 --Well Cleansed (1)
step
    #completewith next
    .goto 1412/1,-354.10001,-2318.40015,0
    .goto 1412/1,-488.20001,-2347.90015,0
    .use 33009>>找到|cRXP_FRIENDLY_凯雷|r. 使用|T134343:0|t[|cRXP_LOOT_鲜嫩的陆行鸟肉|r]喂他
    >>|cRXP_WARN_他在血蹄村周围转圈奔跑|r
    .complete 11129,1 --1/1 Kyle fed
    .unitscan Kyle the Frenzied
step
    .goto 7,48.62,59.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 24440 >>交任务: |cRXP_FRIENDLY_净化冰蹄之井|r
    .accept 24441 >>接任务: |cRXP_LOOT_雷角图腾|r
    .target Mull Thunderhorn
step << Warrior Cata
    .goto 7,49.55,59.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 84939 >>训练你的职业法术
    .target Krang Stonehoof
    .xp <7,1
step << Shaman Cata
    .goto 7,48.47,58.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈(|cRXP_FRIENDLY_Tarl|r)
    .train 324 >>训练你的职业法术
    .target Tarl Cloudsong
    .xp <8,1
step << Priest Cata
    .goto 7,48.76,58.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alsoomse|r交谈
    .train 588 >>训练你的职业法术
    .target Seer Alsoomse
    .xp <8,1
step << Druid Cata
    .goto 7,48.56,59.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 768 >>训练你的职业法术
    .target Gennia Runetotem
    .xp <8,1
step << Paladin Cata
    .goto 7,48.78,58.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Iopi|r交谈
    .train 635 >>训练你的职业法术
    .target Sunwalker Iopi
    .xp <7,1
step
    .goto 1412/1,-347.39999,-2365.30005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板考乌斯|r交谈
    .vendor >>|cRXP_BUY_最多购买20|r|T132815:0|t[冰镇牛奶] |cRXP_BUY_和|r|T133968:0|t[刚出炉的面包] << !Warrior !Hunter
    .vendor >>|cRXP_BUY_最多购买20个|r |T133968:0|t[刚出炉的面包] << Warrior/Hunter
    .itemcount 1179,<20 << !Warrior !Hunter
    .itemcount 4541,<20
    .target Innkeeper Kauth
step << Hunter Cata
    .goto 7,47.94,55.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 5116 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <8,1
step
    .goto 7,57.06,60.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    .turnin 24459 >>交任务: |cRXP_FRIENDLY_摩林·云行者|r
    .accept 749 >>接任务: |cRXP_LOOT_不幸的商队|r
    .target Morin Cloudstalker
step
    #completewith VentureCoCave
    >>击杀|cRXP_ENEMY_草原捕食者|r. 击杀后掠夺其|cRXP_LOOT_利爪|r
    >>击杀|cRXP_ENEMY_平原狮|r. 击杀后掠夺它们的|cRXP_LOOT_利爪|r和一个|cRXP_LOOT_平原狮的腿骨|r
    .complete 24441,1 --Stalker Claws (6)
    .complete 24441,2 --Cougar Claws (6)
    .complete 26188,1 --Flatland Cougar Femur (1)
    .mob Flatland Cougar
    .mob Prairie Stalkers
step
    #completewith VentureCoCave
    >>击杀|cRXP_ENEMY_猛鹫|r. 掠夺其|cRXP_LOOT_羽毛|r`
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Swoop
    .mob Wiry Swoop
step
    .goto 7,53.52,48.29
    >>点击|cRXP_PICK_密封的补给箱|r
    .turnin 749 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 751 >>接任务: |cRXP_LOOT_不幸的商队|r
step
    .goto 7,57.06,60.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    .turnin 751 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
    .accept 26179 >>接任务: |cRXP_LOOT_风险投资公司|r
    .accept 26180 >>接任务: |cRXP_LOOT_菲兹普罗克主管|r
    .target Morin Cloudstalker
step
    #label VentureCoCave
    #completewith FizsprocketKill
    .goto 7,60.86,47.47,10 >>进入洞窟
step
    #completewith FizsprocketKill
    >>击杀|cRXP_ENEMY_风险投资公司工人|r
    .complete 26179,1 --Venture Co. Worker (7)
    .mob Venture Co. Worker
step
    #label FizsprocketKill
    .goto 7,61.21,46.29
    >>击杀|cRXP_ENEMY_Fizsprocket|r. 击败他后搜刮出他的|cRXP_LOOT_Clipboard|r
    .complete 26180,1 --Fizsprocket's Clipboard (1)
    .mob Supervisor Fizsprocket
step
    #loop
    .goto 7,59.30,48.85,0
    .goto 7,62.21,45.13,20,0
    .goto 7,61.81,44.74,20,0
    .goto 7,61.29,43.64,20,0
    .goto 7,60.73,48.13,40,0
    .goto 7,60.47,49.63,40,0
    .goto 7,59.30,48.85,40,0
    >>击杀|cRXP_ENEMY_风险投资公司工人|r
    .complete 26179,1 --Venture Co. Worker (7)
    .mob Venture Co. Worker
step
    #completewith FizsprocketTurnin
    >>击杀|cRXP_ENEMY_草原捕食者|r. 击杀后掠夺其|cRXP_LOOT_利爪|r
    >>击杀|cRXP_ENEMY_平原狮|r. 击杀后掠夺它们的|cRXP_LOOT_利爪|r和一个|cRXP_LOOT_平原狮的腿骨|r
    .complete 24441,1 --Stalker Claws (6)
    .complete 24441,2 --Cougar Claws (6)
    .complete 26188,1 --Flatland Cougar Femur (1)
    .mob Flatland Cougar
    .mob Prairie Stalkers
step
    #completewith FizsprocketTurnin
    >>击杀|cRXP_ENEMY_猛鹫|r. 掠夺其|cRXP_LOOT_羽毛|r`
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Swoop
    .mob Wiry Swoop
step
    #label FizsprocketTurnin
    .goto 7,57.06,60.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩林·云行者|r交谈
    .turnin 26179 >>交任务: |cRXP_FRIENDLY_风险投资公司|r
    .turnin 26180 >>交任务: |cRXP_FRIENDLY_菲兹普罗克主管|r
    .target Morin Cloudstalker
step
    #completewith next
    >>击杀|cRXP_ENEMY_猛鹫|r. 掠夺其|cRXP_LOOT_羽毛|r`
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Swoop
    .mob Wiry Swoop
step
    #loop
    .goto 7,56.14,57.59,0
    .goto 7,57.94,60.08,40,0
    .goto 7,58.60,58.93,40,0
    .goto 7,59.73,57.46,40,0
    .goto 7,60.31,56.44,40,0
    .goto 7,61.03,55.56,40,0
    .goto 7,59.21,54.50,40,0
    .goto 7,58.44,53.38,40,0
    .goto 7,57.87,50.87,40,0
    .goto 7,57.23,50.07,40,0
    .goto 7,56.00,51.41,40,0
    .goto 7,55.66,53.73,40,0
    .goto 7,55.60,55.55,40,0
    .goto 7,56.14,57.59,40,0
    >>击杀|cRXP_ENEMY_草原捕食者|r. 击败它们后搜刮其|cRXP_LOOT_爪子|r
    >>击杀|cRXP_ENEMY_平原狮|r. 击败它们后拾取其|cRXP_LOOT_爪子|r和一块|cRXP_LOOT_Femur|r
    .complete 24441,1 --Stalker Claws (6)
    .complete 24441,2 --Cougar Claws (6)
    .complete 26188,1 --Flatland Cougar Femur (1)
    .mob Flatland Cougar
    .mob Prairie Stalkers
step
    #loop
    .goto 7,54.70,67.69,0
    .goto 7,54.11,62.03,40,0
    .goto 7,51.77,66.37,40,0
    .goto 7,51.06,67.33,40,0
    .goto 7,50.01,68.11,40,0
    .goto 7,54.70,67.69,40,0
    >>击杀|cRXP_ENEMY_猛鹫|r. 掠夺其|cRXP_LOOT_羽毛|r`
    .complete 761,1 --Trophy Swoop Quill (8)
    .mob Swoop
    .mob Wiry Swoop
step
    #xprate <1.2
    #completewith ThunderHornTotem
    .goto 1412/1,-354.10001,-2318.40015,0
    .goto 1412/1,-488.20001,-2347.90015,0
    .use 33009>>找到|cRXP_FRIENDLY_凯雷|r. 使用|T134343:0|t[|cRXP_LOOT_鲜嫩的陆行鸟肉|r]喂他
    >>|cRXP_WARN_他在血蹄村周围转圈奔跑|r
    .complete 11129,1 --1/1 Kyle fed
    .unitscan Kyle the Frenzied
step
    #xprate >1.19
    #completewith FlyTB
    .goto 1412/1,-354.10001,-2318.40015,0
    .goto 1412/1,-488.20001,-2347.90015,0
    .use 33009>>找到|cRXP_FRIENDLY_凯雷|r. 使用|T134343:0|t[|cRXP_LOOT_鲜嫩的陆行鸟肉|r]喂他
    >>|cRXP_WARN_他在血蹄村周围转圈奔跑|r
    .complete 11129,1 --1/1 Kyle fed
    .unitscan Kyle the Frenzied
step
    #label ThunderHornTurnin
    .goto 7,48.60,59.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 24441 >>交任务: |cRXP_FRIENDLY_雷角图腾|r
    .accept 24456 >>接任务: |cRXP_LOOT_净化雷角之井|r
    .target Mull Thunderhorn
step
    .goto 7,48.77,58.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈肯·风之图腾|r交谈
    .turnin 761 >>交任务: |cRXP_FRIENDLY_猎捕猛鹫|r
    .target Harken Windtotem
step << Warrior Cata
    .goto 7,49.55,59.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 84939 >>训练你的职业法术
    .target Krang Stonehoof
step << Shaman Cata
    .goto 7,48.47,58.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈(|cRXP_FRIENDLY_Tarl|r)
    .train 324 >>训练你的职业法术
    .target Tarl Cloudsong
step << Priest Cata
    .goto 7,48.76,58.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alsoomse|r交谈
    .train 588 >>训练你的职业法术
    .target Seer Alsoomse
step << Druid Cata
    .goto 7,48.56,59.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 768 >>训练你的职业法术
    .target Gennia Runetotem
step << Paladin Cata
    .goto 7,48.78,58.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Iopi|r交谈
    .train 635 >>训练你的职业法术
    .target Sunwalker Iopi
step
    .goto 7,47.16,56.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .turnin 26188 >>交任务: |cRXP_FRIENDLY_马兹拉纳其|r
    .target Maur Raincaller
step << Hunter Cata
    .goto 7,47.94,55.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 5116 >>训练你的职业法术
    .target Yaw Sharpmane
step
    #xprate <1.2
    #label ThunderHornTotem
    .goto 7,44.805,45.597
    .use 5415 >>|cRXP_WARN_使用|r|T135139:0|t[雷角之井净化图腾] |cRXP_WARN_在井旁|r
    .complete 24456,1 --Well Cleansed (1)
step
    #xprate >1.19
    #label FlyTB
    #completewith next
    .goto 7,47.44,58.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Tak
step << Tauren
    #xprate >1.19
    .goto 88,45.77,55.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安哈努|r 交谈
    .turnin 6362 >>交任务: |cRXP_FRIENDLY_飞往雷霆崖|r
    .accept 6363 >>接任务: |cRXP_LOOT_双足飞龙管理员塔尔|r
    .target Ahanu
step << Tauren
    #xprate >1.19
    .goto 88,47.05,49.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .turnin 6363 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员塔尔|r
    .accept 6364 >>接任务: |cRXP_WARN_向加翰回复|r
    .target Tal
step << skip
    #xprate >1.19
    .goto 88,45.822,64.762
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将你的[炉石]设置为雷霆崖
    .target Innkeeper Pala
step
    #optional
    .maxlevel 9,MulgoreEnd
step
    #xprate >1.19
    #completewith next
    .goto 1456/1,183.30000,-1314.09998,20 >>乘坐电梯离开雷霆崖
    .zoneskip Mulgore
step
    #loop
    .goto 7,35.869,42.670,0
    .waypoint 7,36.260,44.783,40,0
    .waypoint 7,35.869,42.670,40,0
    .waypoint 7,34.946,40.825,40,0
    .waypoint 7,33.934,41.928,40,0
    .waypoint 7,32.540,41.483,40,0
    .waypoint 7,33.616,43.231,40,0
    >>击杀|cRXP_ENEMY_Windfury 风怒女巫|r和|cRXP_ENEMY_Windfury 哈比妖|r. 击败它们后搜刮其|cRXP_LOOT_利爪|r
    .complete 743,1 --Windfury Talon (8)
    .mob Windfury Wind Witches
    .mob Windfury Harpies
step
    #loop
    .goto 1412/1,416.10001,-1917.40002,0
    .goto 1412/1,377.89999,-1940.70007,20,0
    .goto 1412/1,416.10001,-1917.40002,20,0
    .goto 1412/1,447.89999,-1953.59998,20,0
    .goto 1412/1,414.30002,-1983.80005,20,0
    >>使用 |T133841:0|t[宁静大地之鼓] 对 |cRXP_ENEMY_激动的大地之魂|r
    >>|cRXP_WARN_如果他们反抗并攻击你, 就击杀他们|r
    .complete 14491,1 --Spirits Calmed (6)
    .use 49647
    .mob Agitated Earth Spirit
step
    #xprate >1.19
    .goto 7,44.805,45.597
    .use 5415 >>|cRXP_WARN_使用|r|T135139:0|t[雷角之井净化图腾] |cRXP_WARN_在井旁|r
    .complete 24456,1 --Well Cleansed (1)
step
    #completewith DangerTurnin
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #loop
    .goto 1412/1,-354.10001,-2318.40015,0
    .goto 1412/1,-488.20001,-2347.90015,0
    .waypoint 1412/1,-368.10001,-2296.19995,30,0
    .waypoint 1412/1,-354.10001,-2318.40015,30,0
    .waypoint 1412/1,-378.39999,-2339.10010,30,0
    .waypoint 1412/1,-406.39999,-2348.90015,30,0
    .waypoint 1412/1,-437.50000,-2394.40015,30,0
    .waypoint 1412/1,-444.80002,-2440.80005,30,0
    .waypoint 1412/1,-483.70001,-2458.30005,30,0
    .waypoint 1412/1,-455.30002,-2395.69995,30,0
    .waypoint 1412/1,-488.20001,-2347.90015,30,0
    .waypoint 1412/1,-487.00000,-2295.30005,30,0
    .waypoint 1412/1,-452.50000,-2256.69995,30,0
    .waypoint 1412/1,-421.60001,-2256.00000,30,0
    .waypoint 1412/1,-377.10001,-2257.30005,30,0
    .waypoint 1412/1,-368.80002,-2275.90015,30,0
    .use 33009>>找到|cRXP_FRIENDLY_凯雷|r. 使用|T134343:0|t[|cRXP_LOOT_鲜嫩的陆行鸟肉|r]喂他
    >>|cRXP_WARN_他在血蹄村周围转圈奔跑|r
    .complete 11129,1 --1/1 Kyle fed
    .unitscan Kyle the Frenzied
step
    .goto 7,48.34,53.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ahab|r交谈
    .turnin 11129 >>交任务: |cRXP_FRIENDLY_凯雷失踪了！|r
    .target Ahab Wheathoof
step << Tauren
    #xprate >1.19
    .goto 7,46.06,58.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦尔戈|r交谈
    .turnin 6364 >>交任务: |cRXP_FRIENDLY_向加翰回复|r
    .target Varg Windwhisper
step
    .goto 7,47.66,59.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ahmo|r交谈
    .turnin 14491 >>交任务: |cRXP_FRIENDLY_不休的大地|r
    .target Ahmo Thunderhorn
step
    #label DangerTurnin
    .goto 7,47.51,61.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁尔|r交谈
    .turnin 743 >>交任务: |cRXP_FRIENDLY_风怒鹰身人|r
    .target Ruul Eagletalon
step
    #xprate <1.2
    .goto 7,48.60,59.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 24456 >>交任务: |cRXP_FRIENDLY_净化雷角之井|r
    .accept 24457 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .target Mull Thunderhorn
step
    #xprate >1.19
    .goto 7,48.60,59.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mull|r交谈
    .turnin 24456 >>交任务: |cRXP_FRIENDLY_净化雷角之井|r
    .target Mull Thunderhorn
step << Hunter Cata
    .goto 7,47.94,55.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅文·刺鬃|r交谈
    .train 1978 >>训练你的职业法术
    .target Yaw Sharpmane
    .xp <10,1
step << Warrior Cata
    .goto 7,49.55,59.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克朗·石蹄|r交谈
    .train 71 >>训练你的职业法术
    .target Krang Stonehoof
    .xp <10,1
step << Shaman Cata
    .goto 7,48.47,58.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈(|cRXP_FRIENDLY_Tarl|r)
    .train 3599 >>训练你的职业法术
    .target Tarl Cloudsong
    .xp <10,1
step << Priest Cata
    .goto 7,48.76,58.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Alsoomse|r交谈
    .train 8092 >>训练你的职业法术
    .target Seer Alsoomse
    .xp <10,1
step << Druid Cata
    .goto 7,48.56,59.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_根妮亚|r交谈
    .train 5215 >>训练你的职业法术
    .target Gennia Runetotem
    .xp <10,1
step << Paladin Cata
    .goto 7,48.78,58.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Iopi|r交谈
    .train 82242 >>训练你的职业法术
    .target Sunwalker Iopi
    .xp <10,1
step
    #xprate <1.2
    .goto 7,47.889,57.097
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zarlman|r交谈
    .turnin 24457 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .accept 20441 >>接任务: |cRXP_LOOT_幻象仪祭|r
    .target Zarlman Two-Moons
step
    #xprate <1.2
    .goto 7,47.850,56.961
    .use 49651 >>|cRXP_WARN_使用|r|T134712:0|t[视像之水] |cRXP_WARN_在部落篝火处|r
    .complete 20441,1 --Water of Vision consumed (1x)
    .timer 86,Rite of Vision RP
step
    #xprate <1.2
    #completewith next.
    .subzone 4835 >>等到你到达阳光营地时再做决定
step
    #xprate <1.2
    .goto 7,49.370,17.324
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹纳|r交谈
    .turnin 20441 >>交任务: |cRXP_FRIENDLY_幻象仪祭|r
    .accept 24523 >>接任务: |cRXP_LOOT_蛮鬃图腾|r
    .target Una Wildmane
step
    #xprate <1.2
    .goto 7,49.523,17.088
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者诺拉·暴雨图腾|r交谈
    .accept 833 >>接任务: |cRXP_LOOT_神圣的墓地|r
    .accept 773 >>接任务: |cRXP_LOOT_智慧仪祭|r
    .target Lorekeeper Raintotem
step
    #xprate <1.2
    .goto 7,49.685,17.241
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯克恩|r交谈
    .accept 861 >>接任务: |cRXP_LOOT_猎人之道|r
    .target Skorn Whitecloud
step
    #xprate <1.2
    .goto 7,49.586,17.587
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .accept 744 >>接任务: |cRXP_LOOT_准备典礼|r
    .target Eyahn Eagletalon
step
    #xprate <1.2
    #completewith RedRocks
    >>击杀|cRXP_ENEMY_草原狼前锋|r. 掠夺其|cRXP_LOOT_牙齿|r
    >>击杀|cRXP_ENEMY_平原徘徊者|r. 从他们身上搜刮|cRXP_LOOT_爪子|r
    .complete 24523,1 --Prairie Alpha Tooth (x4)
    .mob +Prairie Wolf Alpha
    .complete 861,1 --Flatland Prowler Claw (x4)
    .mob +Flatland Prowler
step
    #xprate <1.2
    #loop
    .goto 7,52.476,8.126,0
    .waypoint 7,54.950,13.407,0
    .waypoint 7,51.782,11.187,50,0
    .waypoint 7,52.476,8.126,50,0
    .waypoint 7,53.252,12.366,50,0
    .waypoint 7,54.950,13.407,50,0
    .waypoint 7,55.939,16.542,50,0
    >>击杀|cRXP_ENEMY_风怒女巫|r和|cRXP_ENEMY_风怒女族长|r. 掠夺她们以获取|cRXP_LOOT_羽毛|r
    .complete 744,1 --Azure Feather (x6)
    .mob +Windfury Sorceress
    .complete 744,2 --Bronze Feather (x6)
    .mob +Windfury Matriarch
step
    #xprate <1.2
    #label RedRocks
    .goto 7,60.828,22.737
    .subzone 225 >>前往红岩
    .isOnQuest 833
step
    #xprate <1.2
    #completewith next
    >>击杀|cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper Slain (x8)
    .mob Bristleback Interloper
step
    #xprate <1.2
    .goto 7,60.787,22.684
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安哈努|r 交谈
    .turnin 773 >>交任务: |cRXP_FRIENDLY_智慧仪祭|r
    .target Ancestral Spirit
step
    #xprate <1.2
    #loop
    .goto 7,60.374,21.638,0
    .waypoint 7,61.344,24.848,50,0
    .waypoint 7,59.935,24.400,50,0
    .waypoint 7,59.122,22.210,50,0
    .waypoint 7,60.374,21.638,50,0
    >>击杀|cRXP_ENEMY_刺背干涉者|r
    .complete 833,1 --Bristleback Interloper Slain (x8)
    .mob Bristleback Interloper
step
    #xprate <1.2
    #loop
    .goto 7,54.646,24.065,0
    .goto 7,46.777,18.984,0
    .waypoint 7,56.422,25.128,80,0
    .waypoint 7,54.646,24.065,80,0
    .waypoint 7,51.223,24.232,80,0
    .waypoint 7,49.326,21.378,80,0
    .waypoint 7,46.777,18.984,80,0
    .waypoint 7,47.051,13.915,80,0
    .waypoint 7,48.849,13.184,80,0
    >>击杀|cRXP_ENEMY_草原狼前锋|r. 掠夺其|cRXP_LOOT_牙齿|r
    >>击杀|cRXP_ENEMY_平原徘徊者|r. 从他们身上搜刮|cRXP_LOOT_爪子|r
    .complete 24523,1 --Prairie Alpha Tooth (x4)
    .mob +Prairie Wolf Alpha
    .complete 861,1 --Flatland Prowler Claw (x4)
    .mob +Flatland Prowler
step
    #xprate <1.2
    .goto 7,49.370,17.324
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹纳|r交谈
    .turnin 24523 >>交任务: |cRXP_FRIENDLY_蛮鬃图腾|r
    .accept 24524 >>接任务: |cRXP_LOOT_净化蛮鬃之井|r
    .target Una Wildmane
step
    #xprate <1.2
    .goto 7,49.523,17.088
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博学者诺拉·暴雨图腾|r交谈
    .turnin 833 >>交任务: |cRXP_FRIENDLY_神圣的墓地|r
    .target Lorekeeper Raintotem
step
    #xprate <1.2
    .goto 7,49.685,17.241
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯克恩|r交谈
    .turnin 861 >>交任务: |cRXP_FRIENDLY_猎人之道|r
    .target Skorn Whitecloud
step
    #xprate <1.2
    .goto 7,49.586,17.587
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊恩·鹰爪|r交谈
    .turnin 744 >>交任务: |cRXP_FRIENDLY_准备典礼|r
    .target Eyahn Eagletalon
step
    #xprate <1.2
    .goto 7,43.204,16.050
    .use 5416 >>|cRXP_WARN_使用|r|T135139:0|t[蛮鬃之井净化图腾] |cRXP_WARN_, 放置在井旁|r
    .complete 24524,1 --Well Cleansed (1)
step
    #xprate <1.2
    .goto 7,49.370,17.324
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_犹纳|r交谈
    .turnin 24524 >>交任务: |cRXP_FRIENDLY_净化蛮鬃之井|r
    .accept 24550 >>接任务: |cRXP_LOOT_雷霆崖之旅|r
    .target Una Wildmane
step
    #xprate <1.2
    #completewith next
    .deathskip >>死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活
step
    #xprate <1.2
    #completewith next
    .goto 88,54.766,26.571,15,0
    .goto 88,50.038,34.337,20 >>乘坐电梯进入雷霆崖
step
    #xprate <1.2
    .goto 88,60.330,51.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r交谈
    .turnin 24550 >>交任务: |cRXP_FRIENDLY_雷霆崖之旅|r
    .accept 24540 >>接任务: |cRXP_WARN_战争之舞|r
    .target Baine Bloodhoof
step << Tauren
    #xprate <1.2
    .goto 88,45.77,55.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安哈努|r 交谈
    .turnin 6362 >>交任务: |cRXP_FRIENDLY_飞往雷霆崖|r
    .accept 6363 >>接任务: |cRXP_LOOT_双足飞龙管理员塔尔|r
    .target Ahanu
step
    #xprate <1.2
    .goto 88,45.822,64.762
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将你的[炉石]设置为雷霆崖
    .target Innkeeper Pala
    .isQuestAvailable 24540
step
    #xprate <1.2
    #completewith next
    .goto 88,51.937,26.573,15,0
    .goto 7,37.883,13.834,50 >>乘坐北升降梯返回莫高雷
    .zoneskip Mulgore
step
    #xprate <1.2
    .goto 7,36.975,11.910
    >>攻击|cRXP_ENEMY_奥尔诺·恐怖图腾|r
    >>|cRXP_WARN_一旦他的生命值达到90%, 任务就会完成|r
    .complete 24540,1 --Orno Grimtotem Defeated (1x)
    .mob Orno Grimtotem
step
    #xprate <1.2
    #completewith next
    .hs >>炉石传送至雷霆崖
    .use 6948
    .zoneskip Thunder Bluff
step
    #xprate <1.2
    .goto 88,60.330,51.693
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Baine|r交谈
    .turnin 24540 >>交任务: |cRXP_FRIENDLY_战争之舞|r
    .accept 26397 >>接任务: |cRXP_WARN_与大地母亲同行|r
    .target Baine Bloodhoof
step << Tauren
    #xprate <1.2
    .goto 88,47.05,49.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .turnin 6363 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员塔尔|r
    .target Tal
    .zoneskip Orgrimmar
step
    #optional
    #label MulgoreEnd
step << !Tauren
    .goto 88,47.05,49.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .fly Orgrimmar >>飞往奥格瑞玛
    .target Tal
    .zoneskip Thunder Bluff,1
step << Tauren
    .goto 88,47.05,49.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .gossipoption 111516 >>飞往奥格瑞玛
    .target Tal
    .zoneskip Thunder Bluff,1
step
    .goto 7,47.44,58.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .target Tak
    .zoneskip Mulgore,1
step
    #optional
    .abandon 743 >>放弃风怒鹰身人的危险
step
    #optional
    .abandon 14491 >>放弃不休的大地
step
    #optional
    .abandon 24456 >>放弃净化雷角之井
step
    #optional
    .abandon 11129 >>放弃任务:凯雷失踪了！
step
    #optional
    .abandon 6364 >>放弃向加翰回复
step
    #xprate <1.2
    #completewith next
    .goto 85,49.886,75.613,8 >>进入格罗玛什大厅
step
    #xprate <1.2
    .goto 1454/1,-4343.10010,1669.20007
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加尔鲁什·地狱咆哮|r交谈
    .turnin 26397 >>交任务: |cRXP_FRIENDLY_与大地母亲同行|r
    .target Garrosh Hellscream
    .isOnQuest 26397
    ]])
