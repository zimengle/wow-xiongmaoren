RXPGuides.RegisterGuide([[
#version 9
#cata
#mop
#wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 59-61 地狱火半岛
#displayname 58-61 地狱火半岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << !tbc !wotlk
#displayname 59-61 地狱火半岛 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 9
#next 61-63 赞加沼泽
step << tbc
#xprate <1.5
#completewith honorhold
+当你在外域做任务时, 尽量多完成团队任务. 如果你跳过了精英任务或地下城任务, 那么在66级完成刀锋山之后, 可能需要再刷大约三分之一级的经验来补上进度
step << tbc
#completwith next
.goto Stormwind City,66.28,62.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
.fly Nethergarde Keep >>飞往内瑟高德要塞
.zoneskip Blasted Lands
.target Dungar Longdrink
step << !TBC
#completewith next
.goto Stormwind City,48.99,87.36
.zone Blasted Lands >>前往: |cRXP_PICK_诅咒之地|r
step << tbc/wotlk
.goto Blasted Lands,66.57,18.95,20,0
.goto Blasted Lands,67.57,19.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔内的|cRXP_FRIENDLY_奥达兰大使|r交谈
.accept 2783 >>接任务: |cRXP_LOOT_争论|r
.zoneskip Hellfire Peninsula
.target Ambassador Ardalan
step
.goto Blasted Lands,59.401,14.877
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与底层的|cRXP_FRIENDLY_波尼·海斯坦|r交谈
>>|cRXP_BUY_购买|r|T132791:0|t[|cRXP_LOOT_守望堡烈酒|r]
.collect 23848,1,9563,1 
.target Bernie Heisten
step << tbc/wotlk
.goto Swamp of Sorrows,34.28,66.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与悲伤沼泽边境上的|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.turnin 2783 >>交任务: |cRXP_FRIENDLY_争论|r
.accept 2801 >>接任务: |cRXP_LOOT_悲伤的故事|r
.complete 2801,1 
.skipgossip 7572,1
.zoneskip Hellfire Peninsula
.target Fallen Hero of the Horde
step << tbc/wotlk
.goto Swamp of Sorrows,34.28,66.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与悲伤沼泽边境上的|cRXP_FRIENDLY_部落英雄的灵魂|r交谈
.turnin 2801 >>交任务: |cRXP_FRIENDLY_悲伤的故事|r
.zoneskip Hellfire Peninsula
.target Fallen Hero of the Horde
step
#optional
.goto Blasted Lands,58.33,55.90 << tbc/wotlk
.goto 1419/0,-3196.90015,-11815.10059 << !tbc !wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守望堡指挥官雷索恩·奈瑟维|r在黑暗之门外交谈
.turnin -64038 >>交任务: |cRXP_FRIENDLY_黑暗之门|r
.accept 10119 >>接任务: |cRXP_LOOT_跨越黑暗之门|r
.isOnQuest 64038
.target Watch Commander Relthorn Netherwane
step
.goto Blasted Lands,58.33,55.90 << tbc/wotlk
.goto 1419/0,-3196.90015,-11815.10059 << !tbc !wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守望堡指挥官雷索恩·奈瑟维|r在黑暗之门外交谈
.accept 10119 >>接任务: |cRXP_LOOT_跨越黑暗之门|r
.target Watch Commander Relthorn Netherwane
step
#completewith next
.goto Blasted Lands,55.024,54.221
.zone Hellfire Peninsula >>前往: |cRXP_PICK_地狱火半岛|r
step
.goto Hellfire Peninsula,87.32,50.75
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官杜隆|r交谈
.turnin 10119 >>交任务: |cRXP_FRIENDLY_跨越黑暗之门|r
.accept 10288 >>接任务: |cRXP_LOOT_抵达外域|r
.target Commander Duron
step
.goto Hellfire Peninsula,87.36,52.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿米什·蛮锤|r交谈
.turnin 10288 >>交任务: |cRXP_FRIENDLY_抵达外域|r
.accept 10140 >>接任务: |cRXP_LOOT_荣耀堡之旅|r
.target Amish Wildhammer
step
#completewith next
.goto Hellfire Peninsula,87.36,52.42
.gossip 18931,0 >>与|cRXP_FRIENDLY_阿米什·蛮锤|r交谈, 前往荣耀堡
.skipgossip 18931,1
.target Amish Wildhammer
step
.goto Hellfire Peninsula,54.47,62.80,20,0
.goto Hellfire Peninsula,54.84,62.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊斯多尔元帅|r交谈
.turnin 10140 >>交任务: |cRXP_FRIENDLY_荣耀堡之旅|r
.accept 10254 >>接任务: |cRXP_LOOT_指挥官达纳斯|r
.target Marshal Isildor
step
#completewith next
.goto Hellfire Peninsula,54.81,63.61,15,0
.goto Hellfire Peninsula,54.67,63.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊斯多尔元帅|r交谈
.vendor >>|cRXP_BUY_如果你想获得后续任务的装备奖励, 可以向|cRXP_FRIENDLY_马库斯·斯卡兰|r购买一些宝石|r
.target Markus Scylan
step
#completewith HonorHS
.goto Hellfire Peninsula,54.22,63.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希德·利巴迪|r交谈
.home >>将你的炉石设置为荣耀堡
>>如果需要, 购买一些新的食物和水 << !Warrior !Rogue !DK
>>如果需要, 购买一些新食物 << Warrior/Rogue/DK
.target Sid Limbardi
step
.goto Hellfire Peninsula,56.37,65.99,20,0
.goto Hellfire Peninsula,56.61,66.77,14,0
.goto Hellfire Peninsula,56.64,66.70
>>进入要塞, 前往顶层
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_远征军指挥官达纳斯·托尔贝恩|r交谈
.turnin 10254 >>交任务: |cRXP_FRIENDLY_指挥官达纳斯|r
.accept 10160 >>接任务: |cRXP_LOOT_知己知彼|r
.accept 10141 >>接任务: |cRXP_LOOT_重生的军团|r
.target Force Commander Danath Trollbane
step
>>前往塔楼
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达姆菲|r和|cRXP_FRIENDLY_阿玛迪|r交谈
.accept 10055 >>接任务: |cRXP_LOOT_回收材料|r
.goto Hellfire Peninsula,51.30,60.35,20,0
.goto Hellfire Peninsula,51.19,59.99,20,0
.goto Hellfire Peninsula,50.99,60.51
.target +Dumphry
.turnin 10160 >>交任务: |cRXP_FRIENDLY_知己知彼|r
.accept 10482 >>接任务: |cRXP_LOOT_邪兽人清理者|r
.goto Hellfire Peninsula,50.91,60.19
.target +Lieutenant Amadi
step
#loop
.goto Hellfire Peninsula,54.53,54.12,50,0
.goto Hellfire Peninsula,54.23,52.51,50,0
.goto Hellfire Peninsula,55.53,53.32,50,0
.goto Hellfire Peninsula,57.07,53.05,50,0
.goto Hellfire Peninsula,57.62,51.67,50,0
.goto Hellfire Peninsula,58.55,52.43,50,0
.goto Hellfire Peninsula,59.54,51.80,50,0
.goto Hellfire Peninsula,62.09,50.91,50,0
.goto Hellfire Peninsula,54.53,54.12,50,0
.goto Hellfire Peninsula,54.53,54.12,0
>>击杀|cRXP_ENEMY_嚼骨者|r
>>拾取地面上的|cRXP_PICK_Metal|r和|cRXP_PICK_Wood|r材料
>>|cRXP_WARN_避免|r|cRXP_ENEMY_塔加尔·断背者|r|cRXP_WARN_这是一个等级61的精英怪, 会在该区域巡逻|r
.complete 10482,1 
.mob +Bonechewer Mutant
.mob +Bonechewer Raider
.mob +Bonechewer Peon
.mob +Bonechewer Scavenger
.mob +Bonechewer Evoker
.mob +Bonechewer Orc
.complete 10055,1 
.complete 10055,2 
.unitscan Tagar Spinebreaker
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达姆菲|r和|cRXP_FRIENDLY_阿玛迪|r交谈
.turnin 10055 >>交任务: |cRXP_FRIENDLY_回收材料|r
.accept 10078 >>接任务: |cRXP_LOOT_烧毁掷刀车|r
.goto Hellfire Peninsula,51.30,60.35,20,0
.goto Hellfire Peninsula,51.19,59.99,20,0
.goto Hellfire Peninsula,50.99,60.51
.target +Dumphry
.turnin 10482 >>交任务: |cRXP_FRIENDLY_邪兽人清理者|r
.accept 10483 >>接任务: |cRXP_LOOT_邪恶的咒语|r
.goto Hellfire Peninsula,50.91,60.19
.target +Lieutenant Amadi
step
>>前往东补给车队
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃图姆斯中士|r交谈
.goto Hellfire Peninsula,61.74,60.67,15,0
.goto Hellfire Peninsula,61.69,60.90
.turnin 10141 >>交任务: |cRXP_FRIENDLY_重生的军团|r
.accept 10142 >>接任务: |cRXP_LOOT_苦痛之路|r
.target Sergeant Altumus
step
#loop
.line Hellfire Peninsula,65.83,59.06,67.03,58.91,69.16,59.36,69.64,57.71,68.15,56.25,67.55,54.60,66.82,56.63,65.55,55.62,65.83,59.06
.goto Hellfire Peninsula,65.83,59.06,50,0
.goto Hellfire Peninsula,67.03,58.91,50,0
.goto Hellfire Peninsula,69.16,59.36,50,0
.goto Hellfire Peninsula,69.64,57.71,50,0
.goto Hellfire Peninsula,68.15,56.25,50,0
.goto Hellfire Peninsula,67.55,54.60,50,0
.goto Hellfire Peninsula,66.82,56.63,50,0
.goto Hellfire Peninsula,65.55,55.62,50,0
.goto Hellfire Peninsula,65.83,59.06,50,0
>>击杀|cRXP_ENEMY_恐惧召唤者|r和|cRXP_ENEMY_唤火小鬼|r和|cRXP_ENEMY_艾萨拉,塔伦迪斯营地|r
.complete 10142,1 
.mob +Dreadcaller
.complete 10142,2 
.mob +Flamewaker Imp
.complete 10142,3 
.mob +Infernal Warbringer
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃图姆斯中士|r交谈
.goto Hellfire Peninsula,61.74,60.67,15,0
.goto Hellfire Peninsula,61.69,60.90
.turnin 10142 >>交任务: |cRXP_FRIENDLY_苦痛之路|r
.accept 10143 >>接任务: |cRXP_LOOT_远征军岗哨|r
.target Sergeant Altumus
step
.goto Hellfire Peninsula,67.88,66.92,50,0
.goto Hellfire Peninsula,70.53,68.13,50,0
.goto Hellfire Peninsula,70.79,71.38
>>击杀|cRXP_ENEMY_Bleeding Hollow Orcs|r. 击败后可从其身上搜刮出|cRXP_LOOT_Talisman|r
.complete 10483,1 
.mob Bleeding Hollow Dark Shaman
.mob Bleeding Hollow Grunt
.mob Bleeding Hollow Necrolyte
.mob Bleeding Hollow Tormentor
.mob Bleeding Hollow Peon
step
.goto 1944/530,1875.7,-702.8
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃隆雷下士|r交谈
.target Corporal Ironridge
.turnin 10483 >>交任务: |cRXP_FRIENDLY_邪恶的咒语|r
.accept 10484 >>接任务: |cRXP_LOOT_被诅咒的护符|r
step
#label HonorHS
>>前往远征军岗哨
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_前线指挥官金斯顿|r和|cRXP_FRIENDLY_飞行中队长达比尔'埃|r交谈
.turnin 10143 >>交任务: |cRXP_FRIENDLY_远征军岗哨|r
.accept 10144 >>接任务: |cRXP_LOOT_阻断援军|r
.goto Hellfire Peninsula,71.34,62.76
.target +Forward Commander Kingston
.accept 10895 >>接任务: |cRXP_LOOT_燃烧吧，塞斯高！|r
.goto Hellfire Peninsula,71.41,62.48
.target +Wing Commander Dabir'ee
step
.goto Hellfire Peninsula,71.57,59.63,50,0
.goto Hellfire Peninsula,73.12,59.90,50,0
.goto Hellfire Peninsula,73.23,58.36
>>击杀|cRXP_ENEMY_Demons|r. 击杀后搜刮他们的|cRXP_LOOT_Rune Stones|r
.collect 28513,4,10144,1 
.mob Subjugator Shi'aziv
.mob Fel Handler
.mob Wrathguard
.mob Doomwhisperer
.mob Netherhound
step
.goto Hellfire Peninsula,72.73,58.94
>>点击|cRXP_PICK_凯勒兹传送门|r以扰乱它
.complete 10144,2 
step << skip
.goto Hellfire Peninsula,71.80,52.87,50,0
.goto Hellfire Peninsula,70.83,55.36,50,0
.goto Hellfire Peninsula,72.05,55.28,50,0
.goto Hellfire Peninsula,71.57,59.63,50,0
.goto Hellfire Peninsula,73.12,59.90,50,0
.goto Hellfire Peninsula,73.23,58.36
>>击杀|cRXP_ENEMY_Demons|r. 击杀后搜刮他们的|cRXP_LOOT_Rune Stones|r
.collect 28513,4 
.isOnQuest 10144
.mob Subjugator Shi'aziv
.mob Fel Handler
.mob Wrathguard
.mob Doomwhisperer
.mob Netherhound

step
.goto Hellfire Peninsula,71.49,55.17
>>击杀|cRXP_ENEMY_Demons|r. 从他们身上搜刮|cRXP_LOOT_Rune Stones|r. 然后点击|cRXP_PICK_格雷姆传送门|r以破坏它
.collect 28513,4,10144,1,-1 
.complete 10144,1 
.mob Subjugator Shi'aziv
.mob Fel Handler
.mob Wrathguard
.mob Doomwhisperer
.mob Netherhound
step
#label Disrupt
.goto Hellfire Peninsula,71.34,62.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_前线指挥官金斯顿|r交谈
.turnin 10144 >>交任务: |cRXP_FRIENDLY_阻断援军|r
.accept 10146 >>接任务: |cRXP_LOOT_任务：穆尔凯斯和沙德拉兹之门|r
.target Forward Commander Kingston
step
#completewith next
.goto Hellfire Peninsula,71.41,62.48
.fly >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行指挥官达比尔|r交谈以开始轰炸行动
.skipgossip 19409,1
.timer 102,Mission: Gateways Flight
.target Wing Commander Dabir'ee
step
.use 28038 >>|cRXP_WARN_在飞行过程中使用|r|T133712:0|t[爆盐PU-36炸弹虚空模组], |cRXP_WARN_目标: |r|cRXP_PICK_沙德拉兹之门|r和 |cRXP_PICK_穆尔凯斯之门|r|r
.complete 10146,2 
.goto Hellfire Peninsula,77.73,51.80,-1
.complete 10146,1 
.goto Hellfire Peninsula,78.00,47.24,-1
step
.goto Hellfire Peninsula,71.34,62.76
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_前线指挥官金斯顿|r交谈
.turnin 10146 >>交任务: |cRXP_FRIENDLY_任务：穆尔凯斯和沙德拉兹之门|r
.accept 10340 >>接任务: |cRXP_LOOT_破碎岗哨|r
.target Forward Commander Kingston
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_Bleeding Hollow Orcs|r. 掠夺他们的|cRXP_LOOT_Talismans|r
.complete 10484,1 
.mob Bleeding Hollow Dark Shaman
.mob Bleeding Hollow Grunt
.mob Bleeding Hollow Necrolyte
.mob Bleeding Hollow Tormentor
.mob Bleeding Hollow Peon
.mob Worg Master Kruush
step
.use 31739 >>|cRXP_WARN_使用|r|T132622:0|t[烟雾信标]|cRXP_WARN_在四座塔上|r
.complete 10895,3 
.goto Hellfire Peninsula,70.05,69.11
.complete 10895,4 
.goto Hellfire Peninsula,70.86,71.35
.complete 10895,2 
.goto Hellfire Peninsula,66.45,76.47
.complete 10895,1 
.goto Hellfire Peninsula,67.95,66.87
step
#loop
.line Hellfire Peninsula,68.13,69.69,69.16,69.29,70.05,69.12,70.85,71.32,68.88,72.50,69.44,75.37,69.10,76.55,68.58,75.71,66.44,76.44,68.13,69.69
.goto Hellfire Peninsula,68.13,69.69,50,0
.goto Hellfire Peninsula,69.16,69.29,50,0
.goto Hellfire Peninsula,70.05,69.12,50,0
.goto Hellfire Peninsula,70.85,71.32,50,0
.goto Hellfire Peninsula,68.88,72.50,50,0
.goto Hellfire Peninsula,69.44,75.37,50,0
.goto Hellfire Peninsula,69.10,76.55,50,0
.goto Hellfire Peninsula,68.58,75.71,50,0
.goto Hellfire Peninsula,66.44,76.44,50,0
.goto Hellfire Peninsula,68.13,69.69,50,0
>>击杀|cRXP_ENEMY_Bleeding Hollow Orcs|r. 掠夺他们的|cRXP_LOOT_Talismans|r
.complete 10484,1 
.mob Bleeding Hollow Dark Shaman
.mob Bleeding Hollow Grunt
.mob Bleeding Hollow Necrolyte
.mob Bleeding Hollow Tormentor
.mob Bleeding Hollow Peon
.mob Worg Master Kruush
step
.goto Hellfire Peninsula,70.97,63.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃隆雷下士|r交谈
.turnin 10484 >>交任务: |cRXP_FRIENDLY_被诅咒的护符|r
.accept 10485 >>接任务: |cRXP_LOOT_血环督军|r
.target Corporal Ironridge
step
.goto Hellfire Peninsula,71.41,62.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_翼指挥官达比尔·达比尔|r交谈
.turnin 10895 >>交任务: |cRXP_FRIENDLY_燃烧吧，塞斯高！|r
.target Wing Commander Dabir'ee
step
.goto Hellfire Peninsula,69.65,76.48,15,0
.goto Hellfire Peninsula,70.47,76.15,15,0
.goto Hellfire Peninsula,70.08,77.08
>>进入要塞
>>击杀|r|cRXP_ENEMY_督军摩尔肯|r. 从他身上搜刮|r|cRXP_LOOT_护甲|r
.complete 10485,1 
.mob Warlord Morkh
step
.goto Hellfire Peninsula,70.97,63.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃隆雷下士|r交谈
.turnin 10485 >>交任务: |cRXP_FRIENDLY_血环督军|r
.accept 10903 >>接任务: |cRXP_LOOT_返回荣耀堡|r
.target Corporal Ironridge
step
#completewith next
.goto Hellfire Peninsula,71.41,62.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_翼指挥官达比尔·达比尔|r交谈
.gossip 19409,0 >>飞往破碎岗哨
.skipgossip 19409,1
.timer 56,Shatter Point Flight
.target Wing Commander Dabir'ee
step
.goto Hellfire Peninsula,78.42,34.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁恩托格·蛮锤|cRXP_FRIENDLY_鲁恩托格·蛮锤|r交谈
.target Runetog Wildhammer
.turnin 10340 >>交任务: |cRXP_FRIENDLY_破碎岗哨|r
.accept 10344 >>接任务: |cRXP_LOOT_空军指挥官格莱芬加尔|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军指挥官格莱芬加尔|r交谈
.goto Hellfire Peninsula,79.34,33.86
.turnin 10344 >>交任务: |cRXP_FRIENDLY_空军指挥官格莱芬加尔|r
.accept 10163 >>接任务: |cRXP_LOOT_任务：地狱岩床|r
.target Wing Commander Gryphongar
step
#completewith next
.goto Hellfire Peninsula,78.25,34.45
.gossip 20235,0 >>与|cRXP_FRIENDLY_狮鹫骑士维比洛|r交谈, 前往深渊魔栖息地. 如果第一次飞行后未清理所有敌人, 请再次与她对话
.timer 154,Mission: The Abyssal Shelf Flight
.skipgossip 20235,1
.target Gryphoneer Windbellow
step
.goto Hellfire Peninsula,72.21,23.78,-1
.goto Hellfire Peninsula,72.60,19.99,-1
.goto Hellfire Peninsula,73.04,15.18,-1
.goto Hellfire Peninsula,72.69,11.19,-1
.use 28132 >>|cRXP_WARN_在飞行过程中, 对|cRXP_ENEMY_Gan'arg Peons|r和|cRXP_ENEMY_Mo'arg Overseers|r和|cRXP_ENEMY_Fel Cannons|r使用|r|T133709:0|t[52区特制炸弹]|r
.complete 10163,1 
.mob +Gan'arg Peon
.complete 10163,2 
.mob +Mo'arg Overseer
.complete 10163,3 
.mob +Fel Cannon
step
.goto Hellfire Peninsula,79.34,33.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空军指挥官格莱芬加尔|r交谈
.turnin 10163 >>交任务: |cRXP_FRIENDLY_任务：地狱岩床|r
.accept 10382 >>接任务: |cRXP_LOOT_奔赴前线|r
.target Wing Commander Gryphongar
step
#completewith next
.goto Hellfire Peninsula,78.25,34.45
.gossip 20235,0 >>与|cRXP_FRIENDLY_狮鹫骑士维比洛|r交谈, 以飞往荣誉点
.skipgossip 20235,1
.timer 40,Honor Point Flight
.target Gryphoneer Windbellow
step
.goto Hellfire Peninsula,68.29,28.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴洛克元帅|r交谈
.turnin 10382 >>交任务: |cRXP_FRIENDLY_奔赴前线|r
.accept 10394 >>接任务: |cRXP_LOOT_铸魔营地：暴虐|r
.target Field Marshal Brock
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_加纳尔仆从|r
.complete 10394,1 
.mob Gan'arg Servant
step
#loop
.goto Hellfire Peninsula,65.55,32.56,40,0
.goto Hellfire Peninsula,65.06,31.45,40,0
.goto Hellfire Peninsula,64.53,32.48,40,0
.goto Hellfire Peninsula,64.14,31.94,40,0
.goto Hellfire Peninsula,64.16,30.67,40,0
.goto Hellfire Peninsula,65.42,29.81,40,0
.goto Hellfire Peninsula,66.06,31.33,40,0
.goto Hellfire Peninsula,65.55,32.56,40,0
.line Hellfire Peninsula,65.55,32.56,65.06,31.45,64.53,32.48,64.14,31.94,64.16,30.67,65.42,29.81,66.06,31.33,65.55,32.56
>>击杀|cRXP_ENEMY_剃刀电锯|r
>>|cRXP_ENEMY_剃刀电锯|r|cRXP_WARN_巡逻队沿营地逆时针方向巡逻|r
.complete 10394,2 
.unitscan Razorsaw
step
#loop
.goto Hellfire Peninsula,63.50,31.00,50,0
.goto Hellfire Peninsula,64.32,33.31,50,0
.goto Hellfire Peninsula,65.88,32.45,50,0
.goto Hellfire Peninsula,66.09,30.07,50,0
.goto Hellfire Peninsula,59.62,32.39,50,0
.goto Hellfire Peninsula,58.07,32.87,50,0
.goto Hellfire Peninsula,58.07,32.87,0
>>击杀|cRXP_ENEMY_加纳尔仆从|r
.complete 10394,1 
.mob Gan'arg Servant
step
.goto Hellfire Peninsula,68.29,28.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴洛克元帅|r交谈
.turnin 10394 >>交任务: |cRXP_FRIENDLY_铸魔营地：暴虐|r
.accept 10396 >>接任务: |cRXP_LOOT_我的敌人的敌人......|r
.target Field Marshal Brock
step
#loop
.goto Hellfire Peninsula,66.57,32.01,50,0
.goto Hellfire Peninsula,65.48,33.49,50,0
.goto Hellfire Peninsula,64.53,33.17,50,0
.goto Hellfire Peninsula,64.10,33.47,50,0
.goto Hellfire Peninsula,63.40,32.49,50,0
.goto Hellfire Peninsula,63.51,31.06,50,0
.goto Hellfire Peninsula,63.51,31.06,0
>>击杀|cRXP_ENEMY_邪能火炮I型|r
.complete 10396,1 
.mob Fel Cannon MKI
step
.goto Hellfire Peninsula,68.29,28.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴洛克元帅|r交谈
.turnin 10396 >>交任务: |cRXP_FRIENDLY_我的敌人的敌人......|r
.accept 10397 >>接任务: |cRXP_LOOT_登陆场：歼灭|r
.target Field Marshal Brock
step
.goto Hellfire Peninsula,53.09,26.46
>>击杀|cRXP_ENEMY_Arix'Amal|r. 击败他后搜刮出|cRXP_LOOT_燃烧军团传送门钥匙|r和 |T133473:0|t[|cRXP_LOOT_燃烧军团信件|r]
.use 29588 >>|cRXP_WARN_使用|r|T133473:0|t[|cRXP_LOOT_燃烧军团信件|r]|cRXP_WARN_来开始任务|r
.complete 10397,1 
.complete 10397,3 
.collect 29588,1,10395 
.accept 10395 >>接任务: |cRXP_LOOT_邪恶的信件|r
.unitscan Warbringer Arix'Amal
step
.goto Hellfire Peninsula,53.04,27.71
>>点击门内的|cRXP_PICK_铸魔营地：传送门雕文|r
.complete 10397,2 
step
.goto Hellfire Peninsula,68.29,28.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴洛克元帅|r交谈
.turnin 10397 >>交任务: |cRXP_FRIENDLY_登陆场：歼灭|r
.target Field Marshal Brock
step
#completewith next
.goto Hellfire Peninsula,68.65,28.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_狮鹫骑士利弗比尔|r交谈
.fly Shatter >>飞往破碎岗哨
.cooldown item,6948,<0
.skipgossip
.timer 31,Shatter Point Flight
.target Gryphoneer Leafbeard
step
.goto Hellfire Peninsula,78.19,34.34,5 >>返回破碎岗哨
.isOnQuest 10395
.cooldown item,6948,<0
step
#completewith next
.goto Hellfire Peninsula,78.42,34.90
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁恩托格·蛮锤|cRXP_FRIENDLY_鲁恩托格·蛮锤|r交谈
.fly Honor Hold >>飞往荣耀堡
.cooldown item,6948,<0
.target Runetog Wildhammer
step
#completewith next
.hs >>传送至荣耀堡
.cooldown item,6948,>2
step
.goto 1944/530,2736.60010,-708.29999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛格尔·戴维迪库斯神父|r交谈
.target Father Malgor Devidicus
.accept 10058 >>接任务: |cRXP_LOOT_古老的礼物|r
step
.goto Hellfire Peninsula,54.27,63.17,8,0
.goto Hellfire Peninsula,54.32,63.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_助手克拉图|r交谈
.turnin 10903 >>交任务: |cRXP_FRIENDLY_返回荣耀堡|r
.accept 10909 >>接任务: |cRXP_LOOT_邪灵|r
.accept 10916 >>接任务: |cRXP_LOOT_挖掘念珠|r
.target Assistant Klatu
step
.goto Hellfire Peninsula,54.63,63.71
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店二楼的|cRXP_FRIENDLY_哈玛|r交谈
>>|cRXP_BUY_购买 a|r|T132906:0|t[丝线]|cRXP_BUY_. 你可能需要用它来推进后续任务|r
.collect 4291,1,10916,1 
.isOnQuest 10916
.target Hama

step
.goto Hellfire Peninsula,56.37,65.99,20,0
.goto Hellfire Peninsula,56.61,66.77,14,0
.goto Hellfire Peninsula,56.70,66.52
>>进入要塞, 前往顶层
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_位面占卜者克雷夫|r交谈
.target Warp-Scryer Kryv
.turnin 10395 >>交任务: |cRXP_FRIENDLY_邪恶的信件|r
.accept 10399 >>接任务: |cRXP_LOOT_黑暗之心|r
.accept 10047 >>接任务: |cRXP_LOOT_荣耀之路|r
step
.goto Hellfire Peninsula,56.64,66.70
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_远征军指挥官达纳斯·托尔贝恩|r交谈
.target Force Commander Danath Trollbane
.accept 10400 >>接任务: |cRXP_LOOT_霸王|r
step
#completewith treat
#label Beads1
.goto Hellfire Peninsula,54.16,63.32,3,0
.goto Hellfire Peninsula,54.16,63.32,0
>>在旅店外的|cRXP_PICK_土堆|r中搜刮, 以获得|cRXP_LOOT_念珠|r
>>|cRXP_WARN_|cRXP_PICK_土堆|r会在服务器重启时消失, 如果你运气不好, 就得给|cRXP_FRIENDLY_菲菲|r一点奖励|r
.complete 10916,1 
step
#completewith Beads1
#label DTreat
>>|cRXP_WARN_如果|cRXP_PICK_土堆|r不存在:|r
>>|cRXP_BUY_从|cRXP_FRIENDLY_委任官翠希·普罗维尔|cRXP_BUY_购买|r |T132165:0|t[菲菲的狗粮]|r
.goto Hellfire Peninsula,56.33,62.84
.collect 31799,1,10916,1 
.isOnQuest 10916
.target Warrant Officer Tracy Proudwell
step
#completewith next
#label treat
#requires DTreat
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲菲|r交谈
.goto Hellfire Peninsula,56.39,62.90
.turnin 10919 >>交任务: |cRXP_FRIENDLY_菲菲的狗粮|r
.timer 120,Fei Fei RP
.isOnQuest 10916
.target Fei Fei
step << skip
#completewith next
.goto Hellfire Peninsula,50.87,60.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_荣耀堡卫兵维斯洛|r交谈. 你可以在等待|cRXP_FRIENDLY_菲菲|r时进行此操作
.accept 10050 >>接任务: |cRXP_LOOT_阴魂不散|r
.target Honor Guard Wesilow
step
#completewith next
#requires DTreat
.goto Hellfire Peninsula,54.16,63.32,0
>>几分钟后, |cRXP_FRIENDLY_菲菲|r会挖出含有|cRXP_LOOT_念珠|r的|cRXP_PICK_土堆|r
>>|cRXP_WARN_你无需等待任务完全完成, 稍后会回来继续这个任务|r
.complete 10916,1 
.isOnQuest 10916
.target Fei Fei
step
.goto Hellfire Peninsula,50.87,60.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_荣耀堡卫兵维斯洛|r交谈
.accept 10050 >>接任务: |cRXP_LOOT_阴魂不散|r
.target Honor Guard Wesilow
step
.goto Hellfire Peninsula,52.02,62.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头比格姆斯|r交谈
.accept 9355 >>接任务: |cRXP_LOOT_聪明人的工作|r
.accept 10079 >>接任务: |cRXP_LOOT_乱糟糟的矿洞|r
.target Foreman Biggums
step
.goto Hellfire Peninsula,52.38,62.35,20,0
.goto Hellfire Peninsula,54.17,64.51,15,0
.goto Hellfire Peninsula,56.17,62.31
>>击杀矿井内的|cRXP_ENEMY_Gan'arg 工兵|r
.complete 10079,1 
.mob Gan'arg Sapper
step
.goto Hellfire Peninsula,52.02,62.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头比格姆斯|r交谈
.turnin 10079 >>交任务: |cRXP_FRIENDLY_乱糟糟的矿洞|r
.accept 10099 >>接任务: |cRXP_LOOT_主谋|r
.target Foreman Biggums
step
.goto Hellfire Peninsula,52.38,62.35,20,0
.goto Hellfire Peninsula,54.17,64.51,15,0
.goto Hellfire Peninsula,56.28,61.30
>>击杀矿井尽头的|cRXP_ENEMY_Z'kral|r
.complete 10099,1 
.mob Z'kral
step
.goto Hellfire Peninsula,52.02,62.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头比格姆斯|r交谈
.turnin 10099 >>交任务: |cRXP_FRIENDLY_主谋|r
.target Foreman Biggums
step
#loop
.line Hellfire Peninsula,51.42,63.90,48.95,64.85,47.09,63.73,45.95,65.21,47.26,65.97,48.19,66.40,48.28,68.19,49.73,67.25,51.42,63.90
.goto Hellfire Peninsula,51.42,63.90,55,0
.goto Hellfire Peninsula,48.95,64.85,55,0
.goto Hellfire Peninsula,47.09,63.73,55,0
.goto Hellfire Peninsula,45.95,65.21,55,0
.goto Hellfire Peninsula,47.26,65.97,55,0
.goto Hellfire Peninsula,48.19,66.40,55,0
.goto Hellfire Peninsula,48.28,68.19,55,0
.goto Hellfire Peninsula,49.73,67.25,55,0
.goto Hellfire Peninsula,51.42,63.90,55,0
.use 23338 >>击杀|cRXP_ENEMY_潜行的地壳穿刺者|r, 方法是碾过移动的岩石. 击败后可获得 |T133651:0|t[|cRXP_LOOT_被腐蚀的皮箱|r]
>>|cRXP_WARN_使用|r|T133651:0|t[|cRXP_LOOT_被腐蚀的皮箱|r]|cRXP_WARN_来开始任务|r
.complete 9355,1 
.collect 23338,1,9373,1 
.accept 9373 >>接任务: |cRXP_LOOT_遗失的信件|r
.mob Marauding Crust Burster
step
#questguide << !tbc
#xprate <1.5 << tbc
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加希|r和|cRXP_FRIENDLY_“尖嗓子”斯克里·拉克希德|r交谈
.accept 9349 >>接任务: |cRXP_LOOT_掠食者的卵|r
.target +Legassi
.goto Hellfire Peninsula,49.24,74.83
.accept 10161 >>接任务: |cRXP_LOOT_以防万一......|r
.target +"Screaming" Screed Luckheed
.goto Hellfire Peninsula,49.15,74.87
step
#xprate >1.499 << TBC
.goto Hellfire Peninsula,49.24,74.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加希|r交谈
.accept 9349 >>接任务: |cRXP_LOOT_掠食者的卵|r

.target Legassi
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_不屈的步兵|r和|cRXP_ENEMY_巫师的阴魂|r和|cRXP_ENEMY_骑士的阴魂|r
.complete 10050,1 
.mob +Unyielding Footman
.complete 10050,2 
.mob +Unyielding Sorcerer
.complete 10050,3 
.mob +Unyielding Knight
step
.goto Hellfire Peninsula,54.96,86.82
>>拾取地面上的「圣光的秘密」书籍
.complete 10058,1 
step
>>击杀|cRXP_ENEMY_不屈的步兵|r和|cRXP_ENEMY_巫师的阴魂|r和|cRXP_ENEMY_骑士的阴魂|r
.complete 10050,1 
.goto Hellfire Peninsula,58.50,79.42,50,0
.goto Hellfire Peninsula,58.54,77.36,50,0
.goto Hellfire Peninsula,57.70,75.28,50,0
.goto Hellfire Peninsula,56.70,74.36,50,0
.goto Hellfire Peninsula,55.59,79.20
.mob +Unyielding Footman
.complete 10050,2 
.goto Hellfire Peninsula,55.89,79.86,50,0
.goto Hellfire Peninsula,55.47,81.52,50,0
.goto Hellfire Peninsula,54.45,81.43,50,0
.goto Hellfire Peninsula,54.21,79.08,50,0
.goto Hellfire Peninsula,55.11,79.59
.mob +Unyielding Sorcerer
.complete 10050,3 
.goto Hellfire Peninsula,56.44,77.81,50,0
.goto Hellfire Peninsula,54.57,78.22,50,0
.goto Hellfire Peninsula,53.58,85.16,50,0
.goto Hellfire Peninsula,55.25,85.59
.mob +Unyielding Knight
step
.goto Hellfire Peninsula,41.83,85.16,50,0
.goto Hellfire Peninsula,40.37,87.33,50,0
.goto Hellfire Peninsula,38.42,88.82,50,0
.goto Hellfire Peninsula,36.72,88.50,50,0
.goto Hellfire Peninsula,36.88,91.36,50,0
.goto Hellfire Peninsula,32.54,93.32
>>击杀|cRXP_ENEMY_Razorfang 刃齿掠食者|r. 击败它们, 搜刮出|cRXP_LOOT_掠食者的卵|r
>>你也可以在地面上找到|cRXP_LOOT_掠食者的卵|r
.complete 9349,1 
.mob Razorfang Ravager
step << tbc/wotlk
#completewith next
.goto Shattrath City,64.05,41.12
>>前往: |cRXP_PICK_沙塔斯城|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努特拉尔|r交谈
.fp Shattrath >>获取沙塔斯飞行路径
.target Nutral
step << Mage (tbc/wotlk)
#completewith next
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << (Warlock/Shaman/Paladin) (tbc/wotlk)
.goto Shattrath City,55.7,36.9
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << (Warlock/Shaman/Paladin/Mage) (tbc/wotlk)
.goto StormwindClassic,25.3,78.7 << Warlock
.goto StormwindClassic,38.6,32.8 << Paladin
.goto StormwindClassic,61.9,84.0 << Shaman
.goto StormwindClassic,39.6,79.6 << Mage
.trainer >>训练你的职业法术
.target Ursula Deline << Warlock
.target Demisette Cloyce << Warlock
.target Sandahl << Warlock
.target Arthur the Faithful << Paladin
.target Katherine the Pure << Paladin
.target Lord Grayson Shadowbreaker << Paladin
.target Farseer Umbrua << Shaman
.target Elsharin << Mage
.target Jennea Cannon << Mage
step << Mage (tbc/wotlk)
#completewith next
.zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
.isOnQuest 4986
step << (Warrior/Hunter/Rogue/Priest/Druid) (tbc/wotlk)
#completewith next
.goto Shattrath City,55.2,36.5
.zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << (Warrior/Hunter/Rogue/Priest) (tbc/wotlk)
.goto Darnassus,39.0,83.2 << Priest
.goto Darnassus,40.6,9.2 << Hunter
.goto Darnassus,31.5,17.4 << Rogue
.goto Darnassus,58.75,35.16 << Warrior
.trainer >>训练你的职业法术
.target Jandria << Priest
.target Jocaste << Hunter
.target Anishar << Rogue
.target Erion Shadewhisper << Rogue
.target Syurna << Rogue
.target Arias'ta Bladesinger << Warrior
step << (Warrior/Hunter/Rogue/Priest/Druid/Mage) (tbc/wotlk)
.turnin 4986 >>交任务: |cRXP_FRIENDLY_雕文橡木枝|r
.goto Darnassus,35.2,8.1
.isOnQuest 4986
.target Mathrengyl Bearwalker
step << (NightElf/Draenei) (tbc/wotlk)
#optional
#completewith next
.goto Darnassus,29.10,41.22,15,0
.goto Teldrassil,55.93,89.74,30 >>穿过紫色传送门前往泰达希尔
step << (NightElf/Draenei) (tbc/wotlk)
.goto Teldrassil,55.50,92.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾瑞拉斯·琥珀|r交谈
.turnin 978 >>交任务: |cRXP_FRIENDLY_月光羽毛|r
.isOnQuest 978
.target Erelas Ambersky
step << Druid
>>前往: |cRXP_PICK_月光林地|r
.goto Moonglade,52.4,40.6
.trainer 12042 >>训练你的职业法术
.target Loganaar << Druid
step
#completewith next
.hs >>返回荣耀堡
.cooldown item,6948,>2
step
.goto Hellfire Peninsula,54.29,63.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛格尔·戴维迪库斯神父|r交谈
.turnin 10058 >>交任务: |cRXP_FRIENDLY_古老的礼物|r
.target Father Malgor Devidicus
step
.goto 1944/530,2910.0,-595.8
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_荣耀堡卫兵维斯洛|r交谈
.target Honor Guard Wesilow
.turnin 10050 >>交任务: |cRXP_FRIENDLY_阴魂不散|r
.accept 10057 >>接任务: |cRXP_LOOT_寻找首领|r
step
.goto 1944/530,2854.7,-669.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头比格姆斯|r交谈
.target Foreman Biggums
.turnin 9355 >>交任务: |cRXP_FRIENDLY_聪明人的工作|r
step
.goto Hellfire Peninsula,44.82,75.34
.use 31772 >>|cRXP_WARN_使用|r|T134423:0|t[学者的圣物]
>>击杀被[学者的圣物]标记的碎手狂战士
>>击杀随后出现的 |cRXP_ENEMY_邪灵|r
.complete 10909,1 
.mob Shattered Hand Berserker
.mob Fel Spirit
step
.goto Hellfire Peninsula,49.24,74.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加希|r交谈
.turnin 9349 >>交任务: |cRXP_FRIENDLY_掠食者的卵|r
.accept 9361 >>接任务: |cRXP_LOOT_地狱野猪，另一种白肉|r
.target Legassi
step
#optional
#questguide << !tbc
#xprate <1.5 << tbc
#completewith BuzWing
>>拾取地面上的飞艇碎片|r
.complete 10161,1 
step
#loop
.line Hellfire Peninsula,46.10,71.85,45.11,71.84,45.39,70.17,46.89,68.32,50.01,64.14,52.83,70.37,46.10,71.85
.goto Hellfire Peninsula,46.10,71.85,55,0
.goto Hellfire Peninsula,45.11,71.84,55,0
.goto Hellfire Peninsula,45.39,70.17,55,0
.goto Hellfire Peninsula,46.89,68.32,55,0
.goto Hellfire Peninsula,50.01,64.14,55,0
.goto Hellfire Peninsula,52.83,70.37,55,0
.goto Hellfire Peninsula,46.10,71.85,55,0
>>击杀|cRXP_ENEMY_疯狂的地狱野猪|r. 掠夺其|cRXP_LOOT_污染的肉|r
.use 23268 >>|cRXP_WARN_使用|r|T134720:0|t[净化药剂] |cRXP_WARN_将 |cRXP_LOOT_污染肉|r转化为|r|cRXP_LOOT_纯净的地狱野猪肉|r|r
.collect 23270,8,9361,1,-1
.complete 9361,1 
.mob Deranged Helboar
step
.goto Hellfire Peninsula,49.24,74.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加希|r交谈
.turnin 9361 >>交任务: |cRXP_FRIENDLY_地狱野猪，另一种白肉|r
.accept 9356 >>接任务: |cRXP_LOOT_万无一失|r
.target Legassi
step
>>击杀|cRXP_ENEMY_大法师辛托尔|r和|cRXP_ENEMY_指挥官萨尔沃斯|r
.complete 10057,1 
.mob +Arch Mage Xintor
.goto Hellfire Peninsula,53.67,81.10
.complete 10057,2 
.mob +Lieutenant Commander Thalvos
.goto Hellfire Peninsula,54.75,83.71
step
#label BuzWing
#loop
.line Hellfire Peninsula,57.50,72.75,58.66,69.95,62.44,69.12,64.18,66.08,65.00,64.65,65.95,62.08,62.47,65.22,61.12,66.85,57.71,69.65,57.50,72.75
.goto Hellfire Peninsula,57.50,72.75,55,0
.goto Hellfire Peninsula,58.66,69.95,55,0
.goto Hellfire Peninsula,62.44,69.12,55,0
.goto Hellfire Peninsula,64.18,66.08,55,0
.goto Hellfire Peninsula,65.00,64.65,55,0
.goto Hellfire Peninsula,65.95,62.08,55,0
.goto Hellfire Peninsula,62.47,65.22,55,0
.goto Hellfire Peninsula,61.12,66.85,55,0
.goto Hellfire Peninsula,57.71,69.65,55,0
.goto Hellfire Peninsula,57.50,72.75,55,0
>>击杀|cRXP_ENEMY_啄骨秃鹰|r. 击败它们后搜刮其|cRXP_LOOT_翅膀|r
.complete 9356,1 
.mob Bonestripper Buzzard
step
#questguide << !tbc
#xprate <1.5 << tbc
#loop
.line Hellfire Peninsula,57.50,72.75,58.66,69.95,62.44,69.12,64.18,66.08,65.00,64.65,65.95,62.08,62.47,65.22,61.12,66.85,57.71,69.65,57.50,72.75
.goto Hellfire Peninsula,57.50,72.75,55,0
.goto Hellfire Peninsula,58.66,69.95,55,0
.goto Hellfire Peninsula,62.44,69.12,55,0
.goto Hellfire Peninsula,64.18,66.08,55,0
.goto Hellfire Peninsula,65.00,64.65,55,0
.goto Hellfire Peninsula,65.95,62.08,55,0
.goto Hellfire Peninsula,62.47,65.22,55,0
.goto Hellfire Peninsula,61.12,66.85,55,0
.goto Hellfire Peninsula,57.71,69.65,55,0
.goto Hellfire Peninsula,57.50,72.75,55,0
>>拾取地面上的飞艇碎片
.complete 10161,1 
step << Shaman
#completewith prayerbeads1
.hs >>传送至荣耀堡
step
.goto Hellfire Peninsula,54.16,63.32
>>在旅店外的|cRXP_PICK_土堆|r中搜刮, 以获得|cRXP_LOOT_念珠|r
>>|cRXP_WARN_|cRXP_PICK_土堆|r会在服务器重启时消失, 如果你运气不好, 就得给|cRXP_FRIENDLY_菲菲|r一点奖励|r
.complete 10916,1 
step
#label prayerbeads1
.goto Hellfire Peninsula,54.27,63.17,8,0
.goto Hellfire Peninsula,54.32,63.65
>>返回荣耀堡. 前往旅店二楼
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_助手克拉图|r交谈
.turnin 10909 >>交任务: |cRXP_FRIENDLY_邪灵|r
.turnin 10916 >>交任务: |cRXP_FRIENDLY_挖掘念珠|r
.accept 10935 >>接任务: |cRXP_LOOT_尤勒斯的驱魔仪式|r
.target Assistant Klatu
step
#completewith next
.goto 1944/530,2754.11,-707.211
.gossip 22431,0 >>在卧室与 |cRXP_FRIENDLY_学者巴拉达|r交谈以开始驱魔仪式
.skipgossip 22431,1
.target Anchorite Barada
.timer 215,Colonel Jules RP
step
.goto 1944/530,2754.36,-710.211
.use 31828 >>|cRXP_WARN_使用|r |T133290:0|t[仪祭念珠] |cRXP_WARN_可立即击杀生成的幽灵|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尤勒斯上校|r交谈, 等RP结束后
.complete 10935,1 
.skipgossip 22431,1
.skipgossip 22432,1
.target Colonel Jules
step
.goto Hellfire Peninsula,54.32,63.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_助手克拉图|r交谈
.turnin 10935 >>交任务: |cRXP_FRIENDLY_尤勒斯的驱魔仪式|r
.accept 10936 >>接任务: |cRXP_LOOT_托尔贝恩在找你|r
.target Assistant Klatu
step
.goto 1944/530,2736.10010,-707.29999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希德·利巴迪|r交谈
.target Sid Limbardi
.accept 9558 >>接任务: |cRXP_LOOT_长须兄弟|r
step
.goto Hellfire Peninsula,56.37,65.99,20,0
.goto Hellfire Peninsula,56.61,66.77,14,0
>>进入要塞, 前往顶层
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_远征军指挥官达纳斯·托尔贝恩|r交谈
.turnin 10936 >>交任务: |cRXP_FRIENDLY_托尔贝恩在找你|r
.accept 10937 >>接任务: |cRXP_LOOT_教官祖罗克|r
.goto Hellfire Peninsula,56.64,66.70
.target Force Commander Danath Trollbane
step
.goto Hellfire Peninsula,50.87,60.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_荣耀堡卫兵维斯洛|r交谈
.turnin 10057 >>交任务: |cRXP_FRIENDLY_寻找首领|r
.target Honor Guard Wesilow
step
.goto Hellfire Peninsula,48.07,56.17
>>击杀|cRXP_ENEMY_教官祖罗克|r
>>|cRXP_WARN_用宠物将他从坑里拉出来, 然后风筝他回到荣耀堡, 让守卫协助你|r << (tbc/wotlk) (Hunter/Warlock/DK)
>>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r << tbc
.complete 10937,1 
.isOnQuest 10937
.mob Drillmaster Zurok
step
.goto Hellfire Peninsula,49.63,52.08,50,0
.goto Hellfire Peninsula,52.70,50.73,50,0
.goto Hellfire Peninsula,63.42,49.34,50,0
.goto Hellfire Peninsula,52.70,50.73
>>点击路径上被践踏的骷髅尸体|cRXP_PICK_Trampled Skeleton|r
.complete 10047,1 
step
.use 26002 >>|cRXP_WARN_使用|r|T135432:0|t[燃烧的火把] |cRXP_WARN_在投石车上|r
.complete 10078,1 
.goto Hellfire Peninsula,58.50,47.64,-1
.complete 10078,2 
.goto Hellfire Peninsula,55.70,47.48,-1
.complete 10078,3 
.goto Hellfire Peninsula,53.55,48.24,-1
.complete 10078,4 
.goto Hellfire Peninsula,52.64,48.01,-1
step
.goto Hellfire Peninsula,51.37,30.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与萨尔玛矿洞外的|cRXP_FRIENDLY_工头拉泽克拉兹|r交谈
.accept 10236 >>接任务: |cRXP_LOOT_外域这烂地方！|r
.target Foreman Razelcraz
step
.goto Hellfire Peninsula,49.02,37.63,50,0
.goto Hellfire Peninsula,47.98,37.39,50,0
.goto Hellfire Peninsula,48.41,40.86,50,0
.goto Hellfire Peninsula,47.28,42.34,50,0
.goto Hellfire Peninsula,47.17,43.74,50,0
.goto Hellfire Peninsula,48.85,35.37,50,0
.goto Hellfire Peninsula,47.28,42.34
>>拾取地面上的|cRXP_PICK_切割机零件|r盒子
.complete 10236,1 
step
.goto Hellfire Peninsula,51.37,30.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头拉泽克拉兹|r交谈
.turnin 10236 >>交任务: |cRXP_FRIENDLY_外域这烂地方！|r
.accept 10238 >>接任务: |cRXP_LOOT_如何为地精效力|r
.target Foreman Razelcraz
step
>>免费释放笼中的曼尼和莫恩和雅克
.complete 10238,1 
.target +Manni
.goto Hellfire Peninsula,45.12,41.11
.complete 10238,2 
.target +Moh
.goto Hellfire Peninsula,46.42,45.18
.complete 10238,3 
.target +Jakk
.goto Hellfire Peninsula,47.50,46.63
step
#questguide << !tbc
.goto Hellfire Peninsula,51.37,30.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头拉泽克拉兹|r交谈
.turnin 10238 >>交任务: |cRXP_FRIENDLY_如何为地精效力|r
.accept 10629 >>接任务: |cRXP_LOOT_肮脏的工作|r
.target Foreman Razelcraz
step
#questguide << !tbc
.goto Hellfire Peninsula,51.37,30.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头拉泽克拉兹|r交谈
.turnin 10238 >>交任务: |cRXP_FRIENDLY_如何为地精效力|r
.accept 10629 >>接任务: |cRXP_LOOT_肮脏的工作|r
.target Foreman Razelcraz
step
#questguide << !tbc
.goto Hellfire Peninsula,51.37,30.52
#completewith next
.cast 37690 >>|cRXP_WARN_使用|r|T133942:0|t[地狱犬哨] |cRXP_WARN_在 |cRXP_FRIENDLY_工头拉泽克拉兹|r身旁时, 召唤一只|r|cRXP_FRIENDLY_地狱巨犬|r|r
.use 30803
step
#questguide << !tbc
.goto Hellfire Peninsula,50.7,28.9
>>击杀|cRXP_ENEMY_疯狂的地狱野猪|r. 在击败|cRXP_FRIENDLY_Felhound的RP|r后, 拾取其掉落的|cRXP_LOOT_Droppings|r, 以获得|cRXP_PICK_伐木机钥匙|r
.complete 10629,1 
.use 30803
.mob Deranged Helboar
step
#questguide << !tbc
.goto Hellfire Peninsula,51.37,30.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头拉泽克拉兹|r交谈
.turnin 10629 >>交任务: |cRXP_FRIENDLY_肮脏的工作|r
.accept 10630 >>接任务: |cRXP_LOOT_萨尔玛的地下|r
.target Foreman Razelcraz
step
#questguide << !tbc
.goto Hellfire Peninsula,51.72,31.68,20,0
.goto Hellfire Peninsula,52.57,30.59,20,0
.goto Hellfire Peninsula,54.39,31.57
>>击杀萨尔玛矿洞后方的|cRXP_ENEMY_Urga'zz|r
.complete 10630,1 
.mob Urga'zz
step
#questguide << !tbc
.goto Hellfire Peninsula,51.37,30.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头拉泽克拉兹|r交谈
.turnin 10630 >>交任务: |cRXP_FRIENDLY_萨尔玛的地下|r
.target Foreman Razelcraz
step
#completewith next
.goto Hellfire Peninsula,51.37,30.52,80 >>沿着路径前往塔哈玛特神殿
.skill riding,225,1
step
#sticky
#label dpredators
.goto 1944/530,4335.4,70.7,0
#loop
.waypoint Hellfire Peninsula,23.36,41.29,50,0
.waypoint Hellfire Peninsula,23.32,39.88,50,0
.waypoint Hellfire Peninsula,23.36,38.59,50,0
.waypoint Hellfire Peninsula,23.36,37.45,50,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斥候瓦努拉|r交谈, 她会在中央坡道上来回巡逻
.target Scout Vanura
.accept 9398 >>接任务: |cRXP_LOOT_致命的猎手|r
step
.goto 1944/530,4350.0,90.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者欧巴迪|r交谈
.target Anchorite Obadei
.accept 9390 >>接任务: |cRXP_LOOT_寻找瑟丹|r
step
.goto 1944/530,4347.2,92.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊坎|r交谈
.target Ikan
.accept 9399 >>接任务: |cRXP_LOOT_残忍的监工|r
.accept 9490 >>接任务: |cRXP_LOOT_剥石者的女王|r
step
#requires dpredators
#completewith Telhamat
.goto Hellfire Peninsula,23.35,36.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥菲拉·风怒|r交谈
.home >>将你的[炉石]设置为塔哈玛特神殿
.target Caregiver Ophera Windfury
step
#requires dpredators
#optional
.xp <61,1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔萨娜|r和|cRXP_FRIENDLY_智者阿曼恩|r交谈
.accept 9383 >>接任务: |cRXP_LOOT_艰巨的计划|r
.goto Hellfire Peninsula,23.21,36.66
.target +Elsaana
.accept 10443 >>接任务: |cRXP_LOOT_帮助塞纳里奥哨站|r
.goto Hellfire Peninsula,23.42,36.55
.accept 9426 >>接任务: |cRXP_LOOT_阿苟纳之池|r
.goto Hellfire Peninsula,23.42,36.55
.target Amaan the Wise
step
.goto Hellfire Peninsula,23.42,36.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者阿曼恩|r交谈
.target Amaan the Wise
.accept 9426 >>接任务: |cRXP_LOOT_阿苟纳之池|r
step
#completewith next
.goto Hellfire Peninsula,25.19,37.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古玛|r交谈
.fp Temple of Telhamat >>获取塔哈玛特神殿的飞行路径
.target Kuma
step << Mage/DK wotlk
.goto Hellfire Peninsula,24.40,38.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃德辛|r交谈
>>从他那里购买20个传送符文 |T134419:0|t << Mage
.collect 17031,20 << Mage 
>>从他那里购买 60 |T133849:0|t尸尘 << DK
.collect 37201,60 << DK 
.target Vodesiin
step
.goto Hellfire Peninsula,26.89,37.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Sedai的尸体|r交谈
.turnin 9390 >>交任务: |cRXP_FRIENDLY_寻找瑟丹|r
.accept 9423 >>接任务: |cRXP_LOOT_返回欧巴迪身边|r
.target Sedai's Corpse
step
#label Telhamat
>>返回塔哈玛特神殿
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_学者欧巴迪|r 和 |cRXP_FRIENDLY_玛库鲁|r 交谈
.turnin 9423 >>交任务: |cRXP_FRIENDLY_返回欧巴迪身边|r
.target +Anchorite Obadei
.goto Hellfire Peninsula,23.00,40.37
.accept 9424 >>接任务: |cRXP_LOOT_玛库鲁的复仇|r
.target +Makuru
.goto Hellfire Peninsula,23.14,40.16
step
#completewith next
.goto Hellfire Peninsula,31.99,33.13,50 >>沿着通往玛格汉台地的山路跑上去
.skill riding,225,1
step
#loop
.line Hellfire Peninsula,34.10,32.54,33.30,29.46,36.22,27.59,36.22,30.25,36.54,33.98,36.14,35.53,34.10,32.54
.goto Hellfire Peninsula,34.10,32.54,45,0
.goto Hellfire Peninsula,33.30,29.46,45,0
.goto Hellfire Peninsula,36.22,27.59,45,0
.goto Hellfire Peninsula,36.22,30.25,45,0
.goto Hellfire Peninsula,36.54,33.98,45,0
.goto Hellfire Peninsula,36.14,35.53,45,0
.goto Hellfire Peninsula,34.10,32.54,45,0
>>击杀|cRXP_ENEMY_Debilitated Mag'har Grunts|r和|cRXP_ENEMY_Mag'har Grunts|r, 搜刮他们的|cRXP_LOOT_Beads|r
.complete 9424,1 
.mob Debilitated Mag'har Grunt
.mob Mag'har Grunt
step
.goto Hellfire Peninsula,43.81,31.56
>>击杀残酷的阿拉修斯
>>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r << tbc/wotlk
>>|cRXP_WARN_这个任务非常值得完成, 因为它会奖励一件能长期使用的饰品|r << tbc/wotlk
.complete 10400,1 
.isOnQuest 10400
.mob Arazzius the Cruel
step
#loop
.line Hellfire Peninsula,44.25,29.53,42.30,30.09,39.77,27.81,38.94,29.46,38.92,31.26,39.79,34.29,38.87,35.98,39.31,38.57,38.39,41.37,39.87,41.62,40.48,37.90,41.20,32.65,44.25,29.53
.goto Hellfire Peninsula,44.25,29.53,45,0
.goto Hellfire Peninsula,42.30,30.09,45,0
.goto Hellfire Peninsula,39.77,27.81,45,0
.goto Hellfire Peninsula,38.94,29.46,45,0
.goto Hellfire Peninsula,38.92,31.26,45,0
.goto Hellfire Peninsula,39.79,34.29,45,0
.goto Hellfire Peninsula,38.87,35.98,45,0
.goto Hellfire Peninsula,39.31,38.57,45,0
.goto Hellfire Peninsula,38.39,41.37,45,0
.goto Hellfire Peninsula,39.87,41.62,45,0
.goto Hellfire Peninsula,40.48,37.90,45,0
.goto Hellfire Peninsula,41.20,32.65,45,0
.goto Hellfire Peninsula,44.25,29.53,45,0
>>击杀|cRXP_ENEMY_恐惧魔|r 和|cRXP_ENEMY_起泡的腐泥怪|r
.complete 9426,2 
.mob +Blistering Rot
.complete 10399,1 
.mob +Terrorfiend
step << !tbc
.goto Hellfire Peninsula,51.37,30.52
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头拉泽克拉兹|r交谈
.turnin 10238 >>交任务: |cRXP_FRIENDLY_如何为地精效力|r
.target Foreman Razelcraz
step
#completewith next
.hs >>传送至塔哈玛特神殿
.cooldown item,6948,>2
step
.goto 1944/530,4341.30029,97.1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛库鲁|r交谈
.target Makuru
.turnin 9424 >>交任务: |cRXP_FRIENDLY_玛库鲁的复仇|r
.timer 22,Makuru's Vengeance RP
step
.goto 1944/530,4349.9,92.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者欧巴迪|r交谈, 你必须等待RP序列结束
.target Anchorite Obadei
.accept 9543 >>接任务: |cRXP_LOOT_救赎|r
step
.goto 1944/530,4330.0,220.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者阿曼恩|r交谈
.target Amaan the Wise
.turnin 9543 >>交任务: |cRXP_FRIENDLY_救赎|r
.accept 9430 >>接任务: |cRXP_LOOT_沙纳尔圣物|r
.turnin 9426 >>交任务: |cRXP_FRIENDLY_阿苟纳之池|r
.accept 9427 >>接任务: |cRXP_LOOT_净化水体|r
step
#completewith next
.goto Hellfire Peninsula,40.14,30.78
.cast 29297 >>|cRXP_WARN_使用|r|T134861:0|t[净化水瓶] |cRXP_WARN_来召唤|r|cRXP_ENEMY_阿苟尼斯|r
step
.goto Hellfire Peninsula,40.14,30.78
>>击杀|cRXP_ENEMY_阿苟尼斯|r
.use 23361
.complete 9427,1 
.mob Aggonis
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_石镰突击者|r 和|cRXP_ENEMY_石镰幼崽|r
.complete 9398,1 
.mob +Stonescythe Alpha
.complete 9398,2 
.mob +Stonescythe Whelp
step
.goto Hellfire Peninsula,33.94,63.93,30,0
.goto Hellfire Peninsula,33.34,65.16
>>击杀|cRXP_ENEMY_凶猛的黑色利爪|r. 搜刮他的|cRXP_LOOT_爪子|r
>>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r << tbc
.complete 9490,1 
.isOnQuest 9490
.mob Blacktalon the Savage
step
.goto Hellfire Peninsula,34.74,60.88,50,0
.goto Hellfire Peninsula,32.20,58.92,50,0
.goto Hellfire Peninsula,28.31,66.50
>>击杀|cRXP_ENEMY_石镰突击者|r 和|cRXP_ENEMY_石镰幼崽|r
.complete 9398,1 
.mob +Stonescythe Alpha
.complete 9398,2 
.mob +Stonescythe Whelp
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷尼·长须|r和|cRXP_FRIENDLY_米伦·长须|r交谈
.turnin 9558 >>交任务: |cRXP_FRIENDLY_长须兄弟|r
.accept 9417 >>接任务: |cRXP_LOOT_鸦人的威胁|r
.accept 9385 >>接任务: |cRXP_LOOT_钢牙掠食者|r
.target +Gremni Longbeard
.goto Hellfire Peninsula,23.89,72.17
.accept 9563 >>接任务: |cRXP_LOOT_米伦的信任|r
.turnin 9563 >>交任务: |cRXP_FRIENDLY_米伦的信任|r
.target +Mirren Longbeard
.goto Hellfire Peninsula,23.97,72.35
.itemcount 23848,1
step
.goto Hellfire Peninsula,23.97,72.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米伦·长须|r交谈
.accept 9420 >>接任务: |cRXP_LOOT_绝世好帽|r
.isQuestTurnedIn 9563
.target Mirren Longbeard
step
#optional
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷尼·长须|r交谈
.turnin 9558 >>交任务: |cRXP_FRIENDLY_长须兄弟|r
.accept 9417 >>接任务: |cRXP_LOOT_鸦人的威胁|r
.accept 9385 >>接任务: |cRXP_LOOT_钢牙掠食者|r
.goto Hellfire Peninsula,23.89,72.17
.target Gremni Longbeard
step
#loop
.line Hellfire Peninsula,21.71,70.55,22.68,67.28,24.03,65.47,22.24,60.51,21.57,63.11,21.45,66.57,21.71,70.55
.goto Hellfire Peninsula,21.71,70.55,50,0
.goto Hellfire Peninsula,22.68,67.28,50,0
.goto Hellfire Peninsula,24.03,65.47,50,0
.goto Hellfire Peninsula,22.24,60.51,50,0
.goto Hellfire Peninsula,21.57,63.11,50,0
.goto Hellfire Peninsula,21.45,66.57,50,0
.goto Hellfire Peninsula,21.71,70.55,50,0
>>击杀 |cRXP_ENEMY_钢牙掠食者|r << tbc/wotlk
>>击杀|cRXP_ENEMY_钢牙掠食者|r 和|cRXP_ENEMY_钢牙飞掠者|r << !tbc !wotlk
.complete 9385,1 
.mob Quillfang Ravager
.mob Quillfang Skitterer << !tbc !wotlk
step
#optional
#completewith Kaliri
>>击杀|cRXP_ENEMY_Haal'eshi 风行者|r和|cRXP_ENEMY_Haal'eshi 爪牙卫士|r
.complete 9417,1 
.mob +Haal'eshi Windwalker
.complete 9417,2 
.mob +Haal'eshi Talonguard
step
#optional
#completewith AvruuO
>>击杀 |cRXP_ENEMY_卡利鸟女王|r和|cRXP_ENEMY_卡利鸟飞扑者|r和|cRXP_ENEMY_雄性小卡利鸟|r和 |cRXP_ENEMY_雌性小卡利鸟|r, 从它们身上获取 |cRXP_LOOT_羽毛|r
>>|cRXP_WARN_点击巢穴以生成|cRXP_ENEMY_雄性小卡利鸟|r和 |cRXP_ENEMY_雌性小卡利鸟|r|r
.complete 9420,1 
.isOnQuest 9420
.mob Kaliri Matriarch
.mob Kaliri Swooper
.mob Male Kaliri Hatchling
.mob Female Kaliri Hatchling
step
.goto Hellfire Peninsula,25.67,75.13,30,0
.goto Hellfire Peninsula,25.72,76.44
.use 23580 >>击杀|cRXP_ENEMY_Avruu|r. 击败他后拾取 |T134124:0|t[|cRXP_LOOT_亚维鲁的宝珠|r]
>>|cRXP_WARN_使用|r|T134124:0|t[|cRXP_LOOT_亚维鲁的宝珠|r]|cRXP_WARN_来开始任务|r
.collect 23580,1,9418,1 
.accept 9418 >>接任务: |cRXP_LOOT_亚维鲁的宝珠|r
.unitscan Avruu
step
#label AvruuO
.goto Hellfire Peninsula,28.93,81.46
>>点击|cRXP_PICK_哈尔什祭坛|r召唤|cRXP_FRIENDLY_埃拉纳斯|r

>>击败埃拉纳斯之后
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃拉纳斯|r交谈
.turnin 9418 >>交任务: |cRXP_FRIENDLY_亚维鲁的宝珠|r
.mob Aeranas
.skipgossip
step
#label Kaliri
.goto Hellfire Peninsula,27.55,77.86,30,0
.goto Hellfire Peninsula,25.79,76.61,30,0
.goto Hellfire Peninsula,25.79,74.95,30,0
.goto Hellfire Peninsula,26.38,74.25,30,0
.goto Hellfire Peninsula,25.11,76.08,30,0
.goto Hellfire Peninsula,24.69,76.47
>>击杀 |cRXP_ENEMY_卡利鸟女王|r和|cRXP_ENEMY_卡利鸟飞扑者|r和|cRXP_ENEMY_雄性小卡利鸟|r和 |cRXP_ENEMY_雌性小卡利鸟|r, 从它们身上获取 |cRXP_LOOT_羽毛|r
>>|cRXP_WARN_点击巢穴以生成|cRXP_ENEMY_雄性小卡利鸟|r和 |cRXP_ENEMY_雌性小卡利鸟|r|r
.complete 9420,1 
.isOnQuest 9420
.mob Kaliri Matriarch
.mob Kaliri Swooper
.mob Male Kaliri Hatchling
.mob Female Kaliri Hatchling
step
.goto Hellfire Peninsula,25.97,78.32,50,0
.goto Hellfire Peninsula,26.14,72.23
>>击杀|cRXP_ENEMY_Haal'eshi 风行者|r和|cRXP_ENEMY_Haal'eshi 爪牙卫士|r
.complete 9417,1 
.mob +Haal'eshi Windwalker
.complete 9417,2 
.mob +Haal'eshi Talonguard
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷尼·长须|r和|cRXP_FRIENDLY_米伦·长须|r交谈
.turnin 9420 >>交任务: |cRXP_FRIENDLY_绝世好帽|r
.target +Mirren Longbeard
.goto Hellfire Peninsula,23.97,72.35
.turnin 9417 >>交任务: |cRXP_FRIENDLY_鸦人的威胁|r
.turnin 9385 >>交任务: |cRXP_FRIENDLY_钢牙掠食者|r
.goto Hellfire Peninsula,23.89,72.17
.isQuestComplete 9420
.target Gremni Longbeard
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷尼·长须|r交谈
.turnin 9417 >>交任务: |cRXP_FRIENDLY_鸦人的威胁|r
.turnin 9385 >>交任务: |cRXP_FRIENDLY_钢牙掠食者|r
.goto Hellfire Peninsula,23.89,72.17
.target Gremni Longbeard
step
#optional
#completewith Arzeth
>>击杀|cRXP_ENEMY_伊利达雷监工|r
>>拾取地面上的|rXP_PICK遗物|c
.complete 9399,1 
.complete 9430,1 
.mob Illidari Taskmaster
step
.goto Hellfire Peninsula,15.59,58.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_召火者阿库鲁|r
.accept 10403 >>接任务: |cRXP_LOOT_纳拉杜|r
.target Akoru the Firecaller
step
.goto Hellfire Peninsula,16.27,65.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉杜|r交谈
.turnin 10403 >>交任务: |cRXP_FRIENDLY_纳拉杜|r
.accept 10367 >>接任务: |cRXP_LOOT_叛徒|r
.target Naladu
step
.goto Hellfire Peninsula,14.34,63.50
>>打开|cRXP_PICK_金属保险箱|r, 搜刮出|cRXP_LOOT_Sha'naar钥匙|r
.complete 10367,1 
step
.goto Hellfire Peninsula,16.27,65.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉杜|r交谈
.turnin 10367 >>交任务: |cRXP_FRIENDLY_叛徒|r
.accept 10368 >>接任务: |cRXP_LOOT_残冠长者|r
.target Naladu
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与废墟中的被俘虏的|cRXP_FRIENDLY_Broken|r交谈
.complete 10368,1 
.target +Morod the Windstirrer
.goto Hellfire Peninsula,13.13,61.04
.complete 10368,3 
.target +Aylaan the Waterwaker
.goto Hellfire Peninsula,13.01,58.42
.complete 10368,2 
.goto Hellfire Peninsula,15.59,58.74
.target +Akoru the Firecaller
.skipgossip
step
.goto Hellfire Peninsula,16.27,65.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉杜|r交谈
.turnin 10368 >>交任务: |cRXP_FRIENDLY_残冠长者|r
.accept 10369 >>接任务: |cRXP_LOOT_阿尔泽斯之死|r
.target Naladu
step
.goto Hellfire Peninsula,14.29,62.38,50,0
.goto Hellfire Peninsula,14.35,56.99
>>|cRXP_WARN_使用|r|T135225:0|t[残冠长者法杖] |cRXP_WARN_削弱|r|cRXP_ENEMY_无情的阿尔泽斯|r
.use 29513 >>击杀|cRXP_ENEMY_Arzeth|r, 他会在中央路径周围巡逻
.complete 10369,1 
.mob Arzeth the Merciless
.mob Arzeth the Powerless
step
#label Arzeth
.goto Hellfire Peninsula,16.27,65.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉杜|r交谈
.turnin 10369 >>交任务: |cRXP_FRIENDLY_阿尔泽斯之死|r
.target Naladu
step
#loop
.line Hellfire Peninsula,14.90,64.00,14.60,63.10,13.33,62.20,13.06,61.70,13.66,60.65,12.16,57.78,13.30,58.39,13.67,57.49,15.69,57.72,14.54,59.47,14.90,64.00
.goto Hellfire Peninsula,14.90,64.00,50,0
.goto Hellfire Peninsula,14.60,63.10,50,0
.goto Hellfire Peninsula,13.33,62.20,50,0
.goto Hellfire Peninsula,13.06,61.70,50,0
.goto Hellfire Peninsula,13.66,60.65,50,0
.goto Hellfire Peninsula,12.16,57.78,50,0
.goto Hellfire Peninsula,13.30,58.39,50,0
.goto Hellfire Peninsula,13.67,57.49,50,0
.goto Hellfire Peninsula,15.69,57.72,50,0
.goto Hellfire Peninsula,14.54,59.47,50,0
.goto Hellfire Peninsula,14.90,64.00,50,0
>>击杀|cRXP_ENEMY_伊利达雷监工|r
>>拾取地面上的|rXP_PICK遗物|c
.complete 9399,1 
.mob +Illidari Taskmaster
.complete 9430,1 
step
>>前往塞纳里奥哨站
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿米希尔·迷雾行者|r和|cRXP_FRIENDLY_玛霍拉姆·硬蹄|r和|cRXP_FRIENDLY_塞安·红鬃|r和|cRXP_FRIENDLY_Tola'thion|r交谈
.accept 9912 >>接任务: |cRXP_LOOT_塞纳里奥远征队|r
.target +Amythiel Mistwalker
.goto Hellfire Peninsula,16.04,52.15
.accept 10159 >>接任务: |cRXP_LOOT_扫清棘牙岭！|r
.target +Mahuram Stouthoof
.goto Hellfire Peninsula,15.65,52.15
.turnin -10443 >>交任务: |cRXP_FRIENDLY_帮助塞纳里奥哨站|r
.turnin -9373 >>交任务: |cRXP_FRIENDLY_遗失的信件|r
.accept 9372 >>接任务: |cRXP_LOOT_恶魔的玷污|r
.target +Thiah Redmane
.goto Hellfire Peninsula,15.70,52.08
.accept 10132 >>接任务: |cRXP_LOOT_巨人的威胁|r
.target +Tola'thion
.goto Hellfire Peninsula,15.62,52.04
step
#optional
#completewith next
.goto Hellfire Peninsula,15.0,45.7,0
.use 29476 >>击杀一只|cRXP_ENEMY_暴怒的巨人|r. 击败后拾取其掉落的 |T134081:0|t[|cRXP_LOOT_火红水晶碎片|r]
>>|cRXP_WARN_使用|r|T134081:0|t[|cRXP_LOOT_火红水晶碎片|r]|cRXP_WARN_开始任务|r
>>|cRXP_WARN_如有需要, 请为他们组队. 如果无法组队或无需使用全部冷却技能即可单刷, 请跳过此步骤|r << tbc/wotlk
.collect 29476,1,10134,1 
.accept 10134 >>接任务: |cRXP_LOOT_火红水晶中的线索|r
.mob Raging Colossus
step
.goto Hellfire Peninsula,14.38,44.64,50,0
.goto Hellfire Peninsula,17.96,40.76
>>击杀|cRXP_ENEMY_Raging Colossuses|r
>>|cRXP_WARN_如有需要, 请为他们组队. 如果无法组队或无需使用全部冷却技能即可单刷, 请跳过此步骤|r << tbc/wotlk
.complete 10132,1 
.mob Raging Colossus
step
.goto Hellfire Peninsula,14.38,44.64,50,0
.goto Hellfire Peninsula,17.96,40.76
.use 29476 >>击杀一只|cRXP_ENEMY_暴怒的巨人|r. 击败后拾取其掉落的 |T134081:0|t[|cRXP_LOOT_火红水晶碎片|r]
>>|cRXP_WARN_使用|r|T134081:0|t[|cRXP_LOOT_火红水晶碎片|r]|cRXP_WARN_开始任务|r
>>|cRXP_WARN_如有需要, 请为他们组队. 如果无法组队或无需使用全部冷却技能即可单刷, 请跳过此步骤|r << tbc/wotlk
.collect 29476,1,10134,1 
.accept 10134 >>接任务: |cRXP_LOOT_火红水晶中的线索|r
.mob Raging Colossus
step << Shaman
#completewith next
.hs >>传送至塔哈玛特神殿
.cooldown item,6948,>2
step << Shaman
.goto 1944/530,4331.10010,220.70000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者阿曼恩|r交谈
.target Amaan the Wise
.turnin 9427 >>交任务: |cRXP_FRIENDLY_净化水体|r
.turnin 9430 >>交任务: |cRXP_FRIENDLY_沙纳尔圣物|r
.accept 9545 >>接任务: |cRXP_LOOT_先知的圣物|r
step << Shaman
.goto 1944/530,4341.30029,217.60001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔萨娜|r交谈
.target Elsaana
.accept 9383 >>接任务: |cRXP_LOOT_艰巨的计划|r
step
#label dpred2
#sticky
.goto 1944/530,4333.4,179.6,0
#loop
.waypoint Hellfire Peninsula,23.36,41.29,50,0
.waypoint Hellfire Peninsula,23.32,39.88,50,0
.waypoint Hellfire Peninsula,23.36,38.59,50,0
.waypoint Hellfire Peninsula,23.36,37.45,50,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斥候瓦努拉|r交谈, 她会在中央坡道上来回巡逻
.target Scout Vanura
.turnin 9398 >>交任务: |cRXP_FRIENDLY_致命的猎手|r
step
.goto 1944/530,4346.8,94.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊坎|r交谈
.target Ikan
.turnin 9399 >>交任务: |cRXP_FRIENDLY_残忍的监工|r
.turnin 9490 >>交任务: |cRXP_FRIENDLY_剥石者的女王|r
.isQuestComplete 9490
step
#optional
.goto 1944/530,4346.8,94.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊坎|r交谈
.target Ikan
.turnin 9399 >>交任务: |cRXP_FRIENDLY_残忍的监工|r
step << !Shaman
.goto 1944/530,4331.10010,220.70000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者阿曼恩|r交谈
.target Amaan the Wise
.turnin 9427 >>交任务: |cRXP_FRIENDLY_净化水体|r
.turnin 9430 >>交任务: |cRXP_FRIENDLY_沙纳尔圣物|r
.accept 9545 >>接任务: |cRXP_LOOT_先知的圣物|r
step << !Shaman
.goto 1944/530,4341.30029,217.60001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾尔萨娜|r交谈
.target Elsaana
.accept 9383 >>接任务: |cRXP_LOOT_艰巨的计划|r
step
#requires dpred2
#completewith next
.goto Hellfire Peninsula,25.19,37.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古玛|r交谈
.fly Honor Hold >>飞往荣耀堡
.target Kuma
step
#requires dpred2
>>返回荣誉堡. 进入要塞, 前往顶层
.goto Hellfire Peninsula,56.37,65.99,20,0
.goto Hellfire Peninsula,56.61,66.77,14,0
.goto 1944/530,2615.0,-810.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_位面占卜者克雷夫|r交谈
.target Warp-Scryer Kryv
.turnin 10047 >>交任务: |cRXP_FRIENDLY_荣耀之路|r
.accept 10093 >>接任务: |cRXP_LOOT_塔哈玛特神殿|r
.turnin 10399 >>交任务: |cRXP_FRIENDLY_黑暗之心|r
step
#sticky
#label overlord
.goto 1944/530,2615.30005,-812.70001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_远征军指挥官达纳斯·托尔贝恩|r交谈
.target Force Commander Danath Trollbane
.turnin 10400 >>交任务: |cRXP_FRIENDLY_霸王|r
.isQuestComplete 10400
step
.goto 1944/530,2615.30005,-812.70001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_远征军指挥官达纳斯·托尔贝恩|r交谈
.target Force Commander Danath Trollbane
.isQuestComplete 10937
.turnin 10937 >>交任务: |cRXP_FRIENDLY_教官祖罗克|r
step
#requires overlord
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达姆菲|r交谈
.goto Hellfire Peninsula,51.30,60.35,20,0
.goto Hellfire Peninsula,51.19,59.99,20,0
.goto Hellfire Peninsula,50.99,60.51
.turnin 10078 >>交任务: |cRXP_FRIENDLY_烧毁掷刀车|r
.target Dumphry
step
#questguide << !tbc
#xprate <1.5 << TBC
>>返回飞艇坠毁点
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加希|r和|cRXP_FRIENDLY_“尖嗓子”斯克里·拉克希德|r交谈
.turnin 9356 >>交任务: |cRXP_FRIENDLY_万无一失|r
.target +Legassi
.goto Hellfire Peninsula,49.24,74.83
.turnin 10161 >>交任务: |cRXP_FRIENDLY_以防万一......|r
.accept 9351 >>接任务: |cRXP_LOOT_疯狂的虚空行者|r
.goto Hellfire Peninsula,49.15,74.87
.target +"Screaming" Screed Luckheed
step
#xprate >1.499 << TBC
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷加希|r交谈
.turnin 9356 >>交任务: |cRXP_FRIENDLY_万无一失|r
.goto Hellfire Peninsula,49.24,74.83
.target Legassi
step
#questguide << !tbc
#xprate <1.5 << tbc
#completewith next
#optional
>>击杀|cRXP_ENEMY_游荡的虚空行者|r和|cRXP_ENEMY_失控的虚空行者|r. 从它们身上搜刮|cRXP_LOOT_精华|r
.complete 9351,1 
.mob Uncontrolled Voidwalker
.mob Rogue Voidwalker
step
.goto Hellfire Peninsula,50.07,83.29,50,0
.goto Hellfire Peninsula,46.25,83.22
.use 23417 >>|cRXP_WARN_对|r|cRXP_ENEMY_失控的虚空行者|r|cRXP_WARN_造成伤害, 使其生命值降至20%或更低, 然后对其使用|r|T132878:0|t[净化水晶] |r
.complete 9383,1 
.mob Uncontrolled Voidwalker
step
#questguide << !tbc
#xprate <1.5 << tbc
#loop
.line Hellfire Peninsula,46.32,81.97,45.65,84.23,47.81,84.70,50.15,83.32,51.18,82.56,50.45,81.79,48.50,81.74,46.32,81.97
.goto Hellfire Peninsula,46.32,81.97,50,0
.goto Hellfire Peninsula,45.65,84.23,50,0
.goto Hellfire Peninsula,47.81,84.70,50,0
.goto Hellfire Peninsula,50.15,83.32,50,0
.goto Hellfire Peninsula,51.18,82.56,50,0
.goto Hellfire Peninsula,50.45,81.79,50,0
.goto Hellfire Peninsula,48.50,81.74,50,0
.goto Hellfire Peninsula,46.32,81.97,50,0
>>击杀|cRXP_ENEMY_游荡的虚空行者|r和|cRXP_ENEMY_失控的虚空行者|r. 从它们身上搜刮|cRXP_LOOT_精华|r
.complete 9351,1 
.mob Uncontrolled Voidwalker
.mob Rogue Voidwalker
step
#questguide << !tbc
#xprate <1.5 << tbc
.goto Hellfire Peninsula,49.15,74.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“尖嗓子”斯克里·拉克希德|r交谈
.turnin 9351 >>交任务: |cRXP_FRIENDLY_疯狂的虚空行者|r
.target "Screaming" Screed Luckheed
step
#completewith Temple
.hs >>传送至塔哈玛特神殿
.cooldown item,6948,>2
step
#completewith next
.goto Hellfire Peninsula,54.68,62.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行大师克莉尔·比特修|r交谈
.fly Temple of Telhamat >>飞往塔哈玛特神殿
.cooldown item,6948,<0
.target Flightmaster Krill Bitterhue
step
#label Temple
>>返回塔哈玛特神殿
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者阿曼恩和艾尔萨娜|r交谈
.turnin 10093 >>交任务: |cRXP_FRIENDLY_塔哈玛特神殿|r
.goto Hellfire Peninsula,23.42,36.55
.target +Amaan the Wise
.turnin 9383 >>交任务: |cRXP_FRIENDLY_艰巨的计划|r
.goto Hellfire Peninsula,23.21,36.66
.target +Elsaana
step
.goto Hellfire Peninsula,26.89,37.44
.cast 30489 >>|cRXP_WARN_使用|r|T134907:0|t[先知遗物], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_ 塞达的尸体|r. 请勿等待RP|r

.timer 21,The Seer's Relic RP
.use 23645
.isOnQuest 9545
.target Sedai's Corpse
step
.goto Hellfire Peninsula,23.42,36.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者阿曼恩|r交谈
.turnin 9545 >>交任务: |cRXP_FRIENDLY_先知的圣物|r
.target Amaan the Wise
step
.goto Hellfire Peninsula,24.99,51.58,60,0
.goto Hellfire Peninsula,23.73,57.53,60,0
.goto Hellfire Peninsula,17.33,53.85
>>击杀|cRXP_ENEMY_笨拙的地狱野猪|r. 击杀后获取其|cRXP_LOOT_鲜血样本|r
.complete 9372,1 
.mob Hulking Helboar
step
#sticky
#label Thiah
>>返回塞纳里奥哨站
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞安·红鬃|r交谈
.turnin 9372 >>交任务: |cRXP_FRIENDLY_恶魔的玷污|r
.accept 10255 >>接任务: |cRXP_LOOT_测试解毒剂|r
.goto Hellfire Peninsula,15.70,52.08
.target Thiah Redmane
step
#optional
#completewith next
.goto Hellfire Peninsula,15.62,52.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tola'thion|r交谈
.turnin 10132 >>交任务: |cRXP_FRIENDLY_巨人的威胁|r
.isQuestComplete 10132
.target Tola'thion
step
.goto Hellfire Peninsula,15.62,52.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tola'thion|r交谈
.turnin 10134 >>交任务: |cRXP_FRIENDLY_火红水晶中的线索|r
.isOnQuest 10134
.target Tola'thion
step
.goto Hellfire Peninsula,15.62,52.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tola'thion|r交谈
.accept 10349 >>接任务: |cRXP_LOOT_缚地者|r
.isQuestTurnedIn 10134
.target Tola'thion
step
.goto Hellfire Peninsula,15.62,52.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tola'thion|r交谈
.turnin 10132 >>交任务: |cRXP_FRIENDLY_巨人的威胁|r
.isQuestComplete 10132
.target Tola'thion
step
#requires Thiah
.goto Hellfire Peninsula,15.97,51.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_缚地者加兰蒂娅·夜风|r交谈
.turnin 10349 >>交任务: |cRXP_FRIENDLY_缚地者|r
.accept 10351 >>接任务: |cRXP_LOOT_自然的治愈|r
.isQuestTurnedIn 10134
.target Earthbinder Galandria Nightbreeze
step
.goto Hellfire Peninsula,18.40,52.73,60,0
.goto Hellfire Peninsula,22.17,56.14
.use 23337 >>|cRXP_WARN_|cRXP_WARN_请选中|r |cRXP_ENEMY_笨拙的地狱野猪|r并使用|r|T134801:0|t[塞纳里奥解毒剂]将其转化为|cRXP_ENEMY_恐怖獠牙|r|r
>>击杀|cRXP_ENEMY_恐怖獠牙|r
.complete 10255,1 
.mob Dreadtusk
.mob Hulking Helboar
step
#completewith next
.goto Hellfire Peninsula,13.63,39.10
.cast 35413 >>|cRXP_WARN_引导|r|T133944:0|t[新生之种]|cRXP_WARN_站在绿色圆圈上以召唤|r|cRXP_ENEMY_葛利安索恩|r
.timer 49,Goliathon Summon RP
step
.goto Hellfire Peninsula,13.52,39.70
>>击杀|cRXP_ENEMY_葛利安索恩|r
>>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r << tbc/wotlk
.use 29478 >>|cRXP_WARN_小心, 因为|cRXP_ENEMY_葛利安索恩|r有巨大的(60码)击退效果|r
.complete 10351,1 
.isQuestTurnedIn 10134
.mob Goliathon
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_缚地者加兰蒂娅·夜风|r和|cRXP_FRIENDLY_塞安·红鬃|r交谈
.turnin 10351 >>交任务: |cRXP_FRIENDLY_自然的治愈|r
.goto Hellfire Peninsula,15.97,51.57
.turnin 10255 >>交任务: |cRXP_FRIENDLY_测试解毒剂|r
.goto Hellfire Peninsula,15.70,52.08
.isQuestComplete 10351
.target Earthbinder Galandria Nightbreeze
.target Thiah Redmane
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞安·红鬃|r交谈
.turnin 10255 >>交任务: |cRXP_FRIENDLY_测试解毒剂|r
.goto Hellfire Peninsula,15.70,52.08
.target Thiah Redmane
step
#optional
#sticky
>>如果无法完成精英任务, 请放弃它们
.abandon 10132 >>放弃巨人的威胁
step
#optional
#sticky
>>如果无法完成精英任务, 请放弃它们
.abandon 10351 >>放弃自然的治愈
step
.goto Hellfire Peninsula,12.15,46.50,50,0
.goto Hellfire Peninsula,9.13,49.47,50,0
.goto Hellfire Peninsula,11.60,55.18,50,0
.goto Hellfire Peninsula,7.41,49.74,50,0
.goto Hellfire Peninsula,5.37,51.43,50,0
.goto Hellfire Peninsula,9.13,49.47
>>击杀|cRXP_ENEMY_棘牙喷毒者|r和|cRXP_ENEMY_棘牙掠食者|r
.complete 10159,2 
.mob +Thornfang Venomspitter
.complete 10159,1 
.mob +Thornfang Ravager
]])
RXPGuides.RegisterGuide([[
#version 9
#cata
#mop
#wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 61-63 赞加沼泽
#displayname 61-64 赞加沼泽 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << !tbc !wotlk
#displayname 61-63 赞加沼泽 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 9
#next 63-65 泰罗卡森林；65-67 刀锋山 << tbc/wotlk
#next 64-66 纳格兰；65-67 刀锋山 << !tbc !wotlk

step
.goto Zangarmarsh,82.81,64.85
.zone Zangarmarsh >>前往: |cRXP_PICK_赞加沼泽|r
step
#completewith next
>>|cRXP_WARN_以下是赞加沼泽中掉落的和完成任务所需的物品清单. 请记住这些物品, 并在它们掉落时保存下来. 您总共需要:|r
.collect 24291,6,9743,1 
.collect 24245,10,9808,1 
.collect 24401,10,9802,1 
.collect 24449,6,9806,1 
step
.goto 1946/530,5434.70020,-216.70000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊卡因|r交谈
.target Ikeyen
.accept 9747 >>接任务: |cRXP_LOOT_暗泽部族|r
step
.goto 1946/530,5440.10010,-219.50000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lauranna Thar'well|r交谈
.target Lauranna Thar'well
.accept 9802 >>接任务: |cRXP_LOOT_赞加沼泽的植物|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_通缉告示|r和|cRXP_FRIENDLY_监护者哈穆特|r交谈
.accept 9817 >>接任务: |cRXP_LOOT_血鳞纳迦的领袖|r
.accept 9730 >>接任务: |cRXP_LOOT_暗潮纳迦的首领|r
.goto Zangarmarsh,79.08,64.88
.accept 9728 >>接任务: |cRXP_LOOT_热情的欢迎|r
.goto Zangarmarsh,79.09,65.27
.target Warden Hamoot
step
#label RefugeHS
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱森·月火|r和|cRXP_FRIENDLY_伊谢尔·风歌|r交谈
.accept 9895 >>接任务: |cRXP_LOOT_崩溃的平衡|r
.goto Zangarmarsh,78.53,63.15,-1
.target +Lethyn Moonfire
.turnin 9912 >>交任务: |cRXP_FRIENDLY_塞纳里奥远征队|r
.accept 9716 >>接任务: |cRXP_LOOT_暗泽湖的异常|r
.goto Zangarmarsh,78.40,62.02,-1
.target +Ysiel Windsinger
step
#optional << tbc
.goto Zangarmarsh,67.83,51.46
>>前往泰雷多尔
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒙希|r交谈
.fp Telredor >>获取泰雷多尔飞行路径
.skill riding,<225,1
.target Munci
step
#completewith Telredor
.goto Zangarmarsh,70.24,49.27,20 >>搭乘电梯前往泰雷多尔
.skill riding,225,1
step
#sticky
#label deadmire1
.groundgoto 1946/530,6039.70020,258.50000,0,0
.flygoto 1946/530,6039.70020,258.50000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官伊达尔|r交谈
.target Vindicator Idaar
.accept 9782 >>接任务: |cRXP_LOOT_死亡泥潭|r
step
.goto 1946/530,6034.80029,283.10001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘探员柯纳尔|r交谈
.target Prospector Conall
.accept 9901 >>接任务: |cRXP_LOOT_未竟的事业|r
step
.goto 1946/530,6044.70020,283.70001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者安霍尔|r交谈
.target Anchorite Ahuurn
.accept 9786 >>接任务: |cRXP_LOOT_博哈姆废墟|r
step
.goto 1946/530,6033.30029,298.89999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁埃姆|r交谈
.target Ruam
.accept 9777 >>接任务: |cRXP_LOOT_灿烂的孢子|r
step
#label Telredor
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海尔伦|r交谈
.accept 9781 >>接任务: |cRXP_LOOT_不堪重负|r
.goto 1946/530,6065.60010,328.70001
.target +Haalrun
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺兰妮|r交谈
.accept 9791 >>接任务: |cRXP_LOOT_沼牙的威胁|r
.goto 1946/530,6074.80029,331.30002
.target +Noraani
step
#completewith Sporewing
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护者阿比达尔|r交谈
.goto Zangarmarsh,67.14,49.03
.home 3644>>将你的炉石设置为泰雷多尔
.target Caregiver Abidaar
step
#optional << !tbc
.goto Zangarmarsh,67.83,51.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒙希|r交谈
.fp Telredor >>获取泰雷多尔飞行路径
.skill riding,225,1
.target Munci
step
#requires deadmire1
step
#optional
#completewith Rippers
>>击杀|cRXP_ENEMY_沼泽阔步者|r和|cRXP_ENEMY_孢子蝠|r. 击败它们后拾取其|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Fen Strider
.mob *Marsh Walker
.mob *Sporebat
.mob *Greater Sporebat
step
#optional
#completewith Sporewing
>>击杀|cRXP_ENEMY_沼牙撕裂者|r
.complete 9791,1 
.mob Marshfang Ripper
step
#loop
.line Zangarmarsh,68.81,47.75,68.03,48.34,66.01,46.49,65.86,47.37,64.74,49.34,66.46,52.07,70.99,53.95,70.74,50.20,71.57,45.46,68.81,47.75
.goto Zangarmarsh,68.81,47.75,45,0
.goto Zangarmarsh,68.03,48.34,45,0
.goto Zangarmarsh,66.01,46.49,45,0
.goto Zangarmarsh,65.86,47.37,45,0
.goto Zangarmarsh,64.74,49.34,45,0
.goto Zangarmarsh,66.46,52.07,45,0
.goto Zangarmarsh,70.99,53.95,45,0
.goto Zangarmarsh,70.74,50.20,45,0
.goto Zangarmarsh,71.57,45.46,45,0
.goto Zangarmarsh,68.81,47.75,45,0
>>拾取地面上的|cRXP_PICK_灿烂的孢子|r
.complete 9777,1 
step
#label Sporewing
.goto Zangarmarsh,76.80,45.97,60,0
.goto Zangarmarsh,77.29,45.84,60,0
.goto Zangarmarsh,77.76,45.39,60,0
.goto Zangarmarsh,78.64,45.49,60,0
.goto Zangarmarsh,78.83,46.82,60,0
.goto Zangarmarsh,79.79,47.25,60,0
.goto Zangarmarsh,79.79,47.25,0
.line Zangarmarsh,76.80,45.97,77.29,45.84,77.76,45.39,78.64,45.49,78.83,46.82,79.79,47.25
>>击杀|cRXP_ENEMY_孢子之翼|r
>>|cRXP_ENEMY_孢子之翼|r|cRXP_WARN_巡逻路径已标记在你的地图上|r
.complete 9901,1 
.unitscan Sporewing
step
.goto Zangarmarsh,83.82,43.29,-1
.goto Zangarmarsh,80.67,43.45,-1
.goto Zangarmarsh,79.95,42.06,-1
>>拾取地面上的|cRXP_PICK_死亡泥潭土壤|r
.complete 9782,1 
step
#label Rippers
#loop
.line Zangarmarsh,71.61,44.61,76.33,45.27,77.92,46.48,79.79,49.98,84.36,47.15,85.19,47.91,85.42,49.75,84.98,51.50,83.16,52.43,77.63,54.34,76.78,56.41,74.54,54.83,72.82,51.77,71.61,44.61
.goto Zangarmarsh,71.61,44.61,50,0
.goto Zangarmarsh,76.33,45.27,50,0
.goto Zangarmarsh,77.92,46.48,50,0
.goto Zangarmarsh,79.79,49.98,50,0
.goto Zangarmarsh,84.36,47.15,50,0
.goto Zangarmarsh,85.19,47.91,50,0
.goto Zangarmarsh,85.42,49.75,50,0
.goto Zangarmarsh,84.98,51.50,50,0
.goto Zangarmarsh,83.16,52.43,50,0
.goto Zangarmarsh,77.63,54.34,50,0
.goto Zangarmarsh,76.78,56.41,50,0
.goto Zangarmarsh,74.54,54.83,50,0
.goto Zangarmarsh,72.82,51.77,50,0
.goto Zangarmarsh,71.61,44.61,50,0
>>击杀|cRXP_ENEMY_沼牙撕裂者|r
.complete 9791,1 
.mob Marshfang Ripper
step
#completewith next
.hs >>传送至泰雷多尔
.cooldown item,6948,>2

step
.goto 1946/530,6074.10010,329.80002
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺兰妮|r交谈
.target Noraani
.turnin 9791 >>交任务: |cRXP_FRIENDLY_沼牙的威胁|r
.accept 9780 >>接任务: |cRXP_LOOT_电鳗鱼片|r
step
.goto 1946/530,6027.70020,302.20001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁埃姆|r交谈
.target Ruam
.turnin 9777 >>交任务: |cRXP_FRIENDLY_灿烂的孢子|r
step
.goto 1946/530,6030.89990,280.10001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘探员柯纳尔|r交谈
.target Prospector Conall
.turnin 9901 >>交任务: |cRXP_FRIENDLY_未竟的事业|r
.accept 9896 >>接任务: |cRXP_LOOT_黑钉之刺|r
step
.goto 1946/530,6038.20020,257.20001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官伊达尔|r交谈
.target Vindicator Idaar
.turnin 9782 >>交任务: |cRXP_FRIENDLY_死亡泥潭|r
.accept 9783 >>接任务: |cRXP_LOOT_异样的干旱|r
step
#optional
#completewith boglash
>>击杀|cRXP_ENEMY_沼泽阔步者|r和|cRXP_ENEMY_孢子蝠|r. 击败它们后拾取其|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Fen Strider
.mob *Marsh Walker
.mob *Sporebat
.mob *Greater Sporebat
step
#optional
#label Basidium
#completewith next
>>击杀|cRXP_ENEMY_枯萎的巨人|r. 从他们身上搜取 |T134001:0|t[|cRXP_LOOT_枯萎的孢芽|r]
>>|cRXP_WARN_这是一个稀有掉落, 不必特意去抢|r << !tbc
.collect 24483,1,9827 
.mob Withered Giant
step
#label Giants
#loop
.line Zangarmarsh,82.12,44.97,79.44,42.62,77.86,35.41,80.99,31.26,84.94,36.18,85.96,42.24,82.12,44.97
.goto Zangarmarsh,82.12,44.97,60,0
.goto Zangarmarsh,79.44,42.62,60,0
.goto Zangarmarsh,77.86,35.41,60,0
.goto Zangarmarsh,80.99,31.26,60,0
.goto Zangarmarsh,84.94,36.18,60,0
.goto Zangarmarsh,85.96,42.24,60,0
.goto Zangarmarsh,82.12,44.97,60,0
>>击杀|r枯萎的巨人|r, 拾取|r沼泽领主的卷须|r, 以完成后续任务
.collect 24291,6,9743,1,1 
.complete 9783,1 
.mob Withered Giant
step
#questguide << !tbc
#label BasidiumX
#loop
.line Zangarmarsh,82.12,44.97,79.44,42.62,77.86,35.41,80.99,31.26,84.94,36.18,85.96,42.24,82.12,44.97
.goto Zangarmarsh,82.12,44.97,60,0
.goto Zangarmarsh,79.44,42.62,60,0
.goto Zangarmarsh,77.86,35.41,60,0
.goto Zangarmarsh,80.99,31.26,60,0
.goto Zangarmarsh,84.94,36.18,60,0
.goto Zangarmarsh,85.96,42.24,60,0
.goto Zangarmarsh,82.12,44.97,60,0
.use 24483 >>击杀|cRXP_ENEMY_枯萎的巨人|r. 从他们身上搜取 |T134001:0|t[|cRXP_LOOT_枯萎的孢芽|r]
.collect 24291,6,9743,1,1 
.collect 24483,1,9827 
.mob Withered Giant
step
#sticky
#optional
.use 24483>>|cRXP_WARN_使用|r|T134001:0|t[|cRXP_LOOT_枯萎的孢芽|r]|cRXP_WARN_来开始任务|r
.itemcount 24483,1
.accept 9827 >>接任务: |cRXP_LOOT_枯萎的孢芽|r
step << !Warlock
#completewith eels
#optional
.cast 22807 >>|cRXP_WARN_使用|r|T134716:0|t[水下呼吸药水]
.use 25539
.itemcount 25539,1
step
#label Scales
#completewith lakeEnd
>>击杀|cRXP_ENEMY_泥潭多头蛇|r
.complete 9781,1 
.mob Mire Hydra
step
#label eels
#loop
.line Zangarmarsh,73.89,61.37,75.28,63.48,76.32,66.48,76.78,71.37,76.74,75.66,76.76,79.11,74.88,81.27,73.91,79.38,71.94,81.30,73.44,76.43,73.94,72.76,72.92,69.75,73.98,67.64,72.26,66.54,71.63,62.34,73.89,61.37
.goto Zangarmarsh,73.89,61.37,50,0
.goto Zangarmarsh,75.28,63.48,50,0
.goto Zangarmarsh,76.32,66.48,50,0
.goto Zangarmarsh,76.78,71.37,50,0
.goto Zangarmarsh,76.74,75.66,50,0
.goto Zangarmarsh,76.76,79.11,50,0
.goto Zangarmarsh,74.88,81.27,50,0
.goto Zangarmarsh,73.91,79.38,50,0
.goto Zangarmarsh,71.94,81.30,50,0
.goto Zangarmarsh,73.44,76.43,50,0
.goto Zangarmarsh,73.94,72.76,50,0
.goto Zangarmarsh,72.92,69.75,50,0
.goto Zangarmarsh,73.98,67.64,50,0
.goto Zangarmarsh,72.26,66.54,50,0
.goto Zangarmarsh,71.63,62.34,50,0
.goto Zangarmarsh,73.89,61.37,50,0
.use 25539 >>击杀|cRXP_ENEMY_暗泽鳗鱼|r. 从它们身上搜刮|cRXP_LOOT_鱼片|r
.complete 9780,1 
.mob Umbrafen Eel
step
.goto Zangarmarsh,70.57,80.28
>>前往水泵附近
.complete 9716,1 
step
#label lakeEnd
.goto Zangarmarsh,85.29,90.93,160 >>前往暗泽村
.isOnQuest 9747
.subzoneskip 3641
step
#completewith Kataru2
>>击杀|cRXP_ENEMY_暗泽神谕者|r和|cRXP_ENEMY_暗泽先知|r和|cRXP_ENEMY_暗泽巫医|r
.complete 9747,2 
.mob +Umbrafen Oracle
.complete 9747,3 
.mob +Umbrafen Seer
.complete 9747,4 
.mob +Umbrafen Witchdoctor
step
#label Kataru2
.groundgoto Zangarmarsh,84.99,90.27,20,0
.goto Zangarmarsh,85.29,90.93
>>击杀塔顶的卡塔鲁
.complete 9747,1 
.unitscan Kataru
step
#loop
.line Zangarmarsh,83.52,89.16,83.76,88.09,85.50,88.89,84.45,86.16,85.14,82.69,85.71,81.14,85.10,81.08,83.64,81.11,83.60,79.54,83.07,81.06,83.72,82.93,83.38,84.68,82.37,84.73,83.52,89.16
.goto Zangarmarsh,83.52,89.16,50,0
.goto Zangarmarsh,83.76,88.09,50,0
.goto Zangarmarsh,85.50,88.89,50,0
.goto Zangarmarsh,84.45,86.16,50,0
.goto Zangarmarsh,85.14,82.69,50,0
.goto Zangarmarsh,85.71,81.14,50,0
.goto Zangarmarsh,85.10,81.08,50,0
.goto Zangarmarsh,83.64,81.11,50,0
.goto Zangarmarsh,83.60,79.54,50,0
.goto Zangarmarsh,83.07,81.06,50,0
.goto Zangarmarsh,83.72,82.93,50,0
.goto Zangarmarsh,83.38,84.68,50,0
.goto Zangarmarsh,82.37,84.73,50,0
.goto Zangarmarsh,83.52,89.16,50,0
>>击杀|cRXP_ENEMY_暗泽神谕者|r和|cRXP_ENEMY_暗泽先知|r和|cRXP_ENEMY_暗泽巫医|r
.complete 9747,2 
.mob +Umbrafen Oracle
.complete 9747,3 
.mob +Umbrafen Seer
.complete 9747,4 
.mob +Umbrafen Witchdoctor
step
.goto Zangarmarsh,83.38,85.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯拉·长鬃|r交谈
*|cRXP_WARN_You may need to wait for |cRXP_FRIENDLY_Kayra Longmane|r to respawn|r
.accept 9752 >>接任务: |cRXP_LOOT_逃离暗泽村|r
.target Kayra Longmane
step
#optional
#completewith next
.goto Zangarmarsh,83.89,78.58,100,0
.goto Zangarmarsh,82.63,77.98,80,0
.goto Zangarmarsh,81.72,75.58,60,0
.goto Zangarmarsh,82.11,73.88,60,0
.goto Zangarmarsh,81.73,72.94,60,0
.goto Zangarmarsh,81.75,72.20
.line Zangarmarsh,83.89,78.58,82.63,77.98,81.72,75.58,82.11,73.88,81.73,72.94,81.75,72.20
>>击杀|cRXP_ENEMY_沼泽之鞭|r, 可借助|cRXP_FRIENDLY_凯拉·长鬃|r的协助
>>|cRXP_WARN_如果需要, 为他找一个队伍. 如果你无法组队或选择单刷, 可跳过此步骤|r << tbc
.complete 9895,1 
.unitscan Boglash
.target Kayra Longmane
step
.goto Zangarmarsh,79.83,71.17
>>护送|cRXP_FRIENDLY_凯拉·长鬃|r. 她可以治疗并协助你在战斗中
.complete 9752,1 
.target Kayra Longmane
step
.goto Zangarmarsh,83.89,78.58,60,0
.goto Zangarmarsh,82.63,77.98,60,0
.goto Zangarmarsh,81.72,75.58,60,0
.goto Zangarmarsh,82.11,73.88,60,0
.goto Zangarmarsh,81.73,72.94,60,0
.goto Zangarmarsh,81.75,72.20
.line Zangarmarsh,83.89,78.58,82.63,77.98,81.72,75.58,82.11,73.88,81.73,72.94,81.75,72.20
>>击杀|cRXP_ENEMY_沼泽之鞭|r
>>|cRXP_WARN_如果需要, 为他找一个队伍. 如果你无法组队或选择单刷, 可跳过此步骤|r << tbc
.complete 9895,1 
.unitscan Boglash
step
#label boglash
>>击杀赞加沼泽的任意怪物
.collect 24401,10,9802,1 
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊卡因|r交谈
.target Ikeyen
.goto Zangarmarsh,80.39,64.15
.turnin 9747 >>交任务: |cRXP_FRIENDLY_暗泽部族|r
.accept 9788 >>接任务: |cRXP_LOOT_阴冷之地|r
step
.goto Zangarmarsh,80.32,64.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lauranna Thar'well|r交谈
.target Lauranna Thar'well
.turnin 9802 >>交任务: |cRXP_FRIENDLY_赞加沼泽的植物|r
.accept 10096 >>接任务: |cRXP_LOOT_拯救孢子人|r
step
#sticky
#label blessing1a
.goto 1946/530,5434.60010,-233.50000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_唤风者塔鲁·黑蹄|r交谈
.target Windcaller Blackhoof
.accept 9785 >>接任务: |cRXP_LOOT_古树的祝福|r
.reputation 942,friendly,<0,1
step
.goto 1946/530,5434.60010,-233.50000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_唤风者塔鲁·黑蹄|r交谈
.target Windcaller Blackhoof
.accept 9894 >>接任务: |cRXP_LOOT_保护观察者|r
step
#requires blessing1a
.goto 1946/530,5525.50000,-182.30000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱森·月火|r交谈
.target Lethyn Moonfire
.turnin 9895 >>交任务: |cRXP_FRIENDLY_崩溃的平衡|r
step
.goto 1946/530,5533.39990,-145.20000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊谢尔·风歌|r交谈
.target Ysiel Windsinger
.turnin 9752 >>交任务: |cRXP_FRIENDLY_逃离暗泽村|r
.isQuestComplete 9752
step
#label CenarionPost2
.goto 1946/530,5533.39990,-145.20000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊谢尔·风歌|r交谈
.target Ysiel Windsinger
.turnin 9716 >>交任务: |cRXP_FRIENDLY_暗泽湖的异常|r
.accept 9718 >>接任务: |cRXP_LOOT_乌鸦的飞翔|r
step
.goto Zangarmarsh,78.40,62.02
>>|cRXP_WARN_使用|r|T134911:0|t[风暴乌鸦护符]
.complete 9718,1 
.cast 31606
.timer 155,As the Crow Flies RP
.use 25465
step
.goto Zangarmarsh,78.40,62.02
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊谢尔·风歌|r交谈
.turnin 9718 >>交任务: |cRXP_FRIENDLY_乌鸦的飞翔|r
.accept 9720 >>接任务: |cRXP_LOOT_恢复平衡|r
.target Ysiel Windsinger
step
#optional
#completewith Klaq
>>击杀|cRXP_ENEMY_沼泽阔步者|r和|cRXP_ENEMY_孢子蝠|r. 击败它们后拾取其|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Fen Strider
.mob *Marsh Walker
.mob *Sporebat
.mob *Greater Sporebat
.subzoneskip 3652
step
#sticky
#label q10096
#loop
.goto Zangarmarsh,74.44,92.06,0
.goto Zangarmarsh,72.39,93.82,0
.waypoint Zangarmarsh,74.44,92.06,50,0
.waypoint Zangarmarsh,72.39,93.82,50,0
>>击杀洞穴内的|cRXP_ENEMY_沼泽掘泥者|r 和|cRXP_ENEMY_沼泽潜伏者|r, 搜刮他们掉落的|cRXP_LOOT_植物部件|r
.complete 10096,1 
.mob +Marsh Dredger
.complete 10096,2 
.mob +Marsh Lurker
step
#label Klaq
.goto Zangarmarsh,74.44,92.06,60,0
.goto Zangarmarsh,72.39,93.82
>>进入funggor洞穴, 跳入洞穴中央
>>击杀|cRXP_ENEMY_克拉其大王|r
.complete 9894,1 
.unitscan Lord Klaq
step
#label Ikeyen
.goto Zangarmarsh,72.94,96.60,20,0
.goto Zangarmarsh,70.53,97.91
>>在洞穴后方拾取|cRXP_PICK_伊卡因的物品|r
.complete 9788,1 
step
#requires q10096
step
#optional
#completewith Blacksting
>>击杀|cRXP_ENEMY_沼泽阔步者|r和|cRXP_ENEMY_孢子蝠|r. 击败它们后拾取其|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Fen Strider
.mob *Marsh Walker
.mob *Sporebat
.mob *Greater Sporebat
step
#completewith hydra1end
>>击杀|cRXP_ENEMY_Darkcrest Nagas|r. 掠夺他们的|cRXP_LOOT_Claws|r
.complete 9728,1 
.mob *Darkcrest Siren
.mob *Darkcrest Slaver
.mob *Darkcrest Sorceress
.mob *Darkcrest Taskmaster
.subzoneskip 3642
step
#completewith Lagoon
.use 24330 >>在湖泊控制台使用 |T136074:0|t[铁藤种子] 后, 击杀刷新的|cRXP_ENEMY_蒸汽泵监工|r. 击败他们可获得其掉落的 |T134944:0|t[|cRXP_LOOT_抽水泵结构图|r]
.collect 24330,1,9731 
.mob Steam Pump Overseer
step
.goto Zangarmarsh,70.60,80.29
.use 24355 >>|cRXP_WARN_使用|r|T136074:0|t[铁藤种子]|cRXP_WARN_Lake 控制|r
.complete 9720,1 
step
#label Rajah
.goto Zangarmarsh,65.10,68.67
>>击杀|cRXP_ENEMY_哈格哈兹王子|r
>>|cRXP_WARN_如果需要, 为他找一个队伍. 如果你无法组队或选择单刷, 可跳过此步骤|r << tbc/wotlk
.complete 9730,1 
.unitscan Rajah Haghazed
step
#label Lagoon
.goto Zangarmarsh,63.11,64.09
>>|cRXP_WARN_使用|r|T136074:0|t[铁藤种子]|cRXP_WARN_Lake 控制|r
.complete 9720,4 
.use 24355
step
.goto Zangarmarsh,63.11,64.09
.use 24355 >>|cRXP_WARN_继续使用|r|T136074:0|t[铁藤种子] |cRXP_WARN_在湖边控制点生成并击杀|r|cRXP_ENEMY_蒸汽泵监工|r. 击败他们可获得其掉落的|r|T134944:0|t[|cRXP_LOOT_抽水泵结构图|r]
>>农场|cRXP_LOOT_纳迦爪子|r, 同时等待种子冷却完毕
.collect 24330,1,9731 
step
#sticky
.use 24330 >>|cRXP_WARN_点击|r|T134944:0|t[|cRXP_LOOT_抽水泵结构图|r]|cRXP_WARN_以开始任务|r
.accept 9731 >>接任务: |cRXP_LOOT_抽水泵结构图|r
.mob Steam Pump Overseer
.itemcount 24330,1
step
#label hydra1end
.goto Zangarmarsh,53.79,66.14
>>击杀|cRXP_ENEMY_泥潭多头蛇|r
.complete 9781,1 
.mob Mire Hydra
step
#label Blacksting
.goto Zangarmarsh,49.80,59.44
>>击杀|cRXP_ENEMY_黑钉|r. 击败他后搜刮其掉落的|cRXP_LOOT_蛰刺|r
.complete 9896,1 
.mob Blacksting
step
.goto Zangarmarsh,44.13,68.91
>>进入博哈姆废墟
>>|cRXP_WARN_你不用拉精英怪！|r
.complete 9786,1 
step
.goto Zangarmarsh,50.39,40.92
>>前往湖中央, 然后潜入水中, 朝排水口方向游去
.complete 9731,1 
step
#optional
#completewith next
>>在赞加沼泽各地搜刮地面上的|cRXP_PICK_橙色蘑菇|r
.collect 24245,10,9808,1 
step
#completewith next
.goto Zangarmarsh,41.28,29.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈卢|r交谈
.fp Orebor Harborage >>获取奥雷柏尔营地的飞行路径
.target Halu
step << !Shaman
#completewith next
.goto Zangarmarsh,41.28,29.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈卢|r交谈
.fly Telredor >>飞往泰雷多尔
.target Halu
step << Shaman
#completewith next
.hs >>传送至泰雷多尔
step << !Shaman
.goto 1946/530,6040.00000,257.10001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官伊达尔|r交谈
.target Vindicator Idaar
.turnin 9783 >>交任务: |cRXP_FRIENDLY_异样的干旱|r
.accept 9793 >>接任务: |cRXP_LOOT_图雷姆的命运|r << tbc/wotlk
step << !Shaman
.goto 1946/530,6044.89990,278.89999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者安霍尔|r交谈
.target Anchorite Ahuurn
.turnin 9786 >>交任务: |cRXP_FRIENDLY_博哈姆废墟|r
.accept 9787 >>接任务: |cRXP_LOOT_蛮沼雕像|r
.accept 9776 >>接任务: |cRXP_LOOT_奥雷柏尔营地|r
step << !Shaman
.goto 1946/530,6030.89990,283.60001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘探员柯纳尔|r交谈
.target Prospector Conall
.turnin 9896 >>交任务: |cRXP_FRIENDLY_黑钉之刺|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺兰妮|r交谈
.turnin 9780 >>交任务: |cRXP_FRIENDLY_电鳗鱼片|r
.target +Noraani
.goto 1946/530,6075.50000,329.39999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海尔伦|r交谈
.turnin 9781 >>交任务: |cRXP_FRIENDLY_不堪重负|r
.accept 9790 >>接任务: |cRXP_LOOT_透明的虫翼|r
.goto 1946/530,6065.70020,327.50000
.target +Haalrun
step
.goto Zangarmarsh,68.62,48.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_鲁埃姆|r交谈
.target Ruam
.turnin 9827 >>交任务: |cRXP_FRIENDLY_枯萎的孢芽|r
.isOnQuest 9827
step << Shaman
.goto 1946/530,6030.89990,283.60001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_勘探员柯纳尔|r交谈
.target Prospector Conall
.turnin 9896 >>交任务: |cRXP_FRIENDLY_黑钉之刺|r
step << Shaman
.goto 1946/530,6044.89990,278.89999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者安霍尔|r交谈
.target Anchorite Ahuurn
.turnin 9786 >>交任务: |cRXP_FRIENDLY_博哈姆废墟|r
.accept 9787 >>接任务: |cRXP_LOOT_蛮沼雕像|r
.accept 9776 >>接任务: |cRXP_LOOT_奥雷柏尔营地|r
step << Shaman
.goto 1946/530,6040.00000,257.10001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官伊达尔|r交谈
.target Vindicator Idaar
.turnin 9783 >>交任务: |cRXP_FRIENDLY_异样的干旱|r
.accept 9793 >>接任务: |cRXP_LOOT_图雷姆的命运|r << tbc/wotlk
step << !tbc
.goto 1946/530,5534.89990,-142.30000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊谢尔·风歌|r交谈
.target Ysiel Windsinger
.turnin 9731 >>交任务: |cRXP_FRIENDLY_抽水泵结构图|r
.accept 9724 >>接任务: |cRXP_LOOT_通知塞纳里奥议会|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lauranna Thar'well|r交谈
.turnin 9802 >>交任务: |cRXP_FRIENDLY_赞加沼泽的植物|r
.turnin 10096 >>交任务: |cRXP_FRIENDLY_拯救孢子人|r
.goto 1946/530,5438.20020,-215.70000
.target +Lauranna Thar'well
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊卡因|r交谈
.turnin 9788 >>交任务: |cRXP_FRIENDLY_阴冷之地|r
.goto 1946/530,5434.70020,-215.40001
.target +Ikeyen
step
.goto 1946/530,5438.20020,-215.70000
.dailyturnin 9784>>与|cRXP_FRIENDLY_Lauranna Thar'well|r交谈
.disablecheckbox
+上交所有|T133940:0|t[未鉴定的植物部件]
.itemcount 24401,10
.reputation 942,honored,0,1
.target Lauranna Thar'well
step
.goto 1946/530,5434.10010,-234.00000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_唤风者塔鲁·黑蹄|r交谈
.target Windcaller Blackhoof
.turnin 9894 >>交任务: |cRXP_FRIENDLY_保护观察者|r
.accept 9785 >>接任务: |cRXP_LOOT_古树的祝福|r
step
#sticky
#label ashyen
.goto Zangarmarsh,81.11,63.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃西恩|r交谈
.complete 9785,1 
.skipgossip
.target Ashyen
step
#loop
.goto Zangarmarsh,81.11,64.37,40,0
.goto Zangarmarsh,79.57,64.48,40,0
.goto Zangarmarsh,78.25,63.88,40,0
.goto Zangarmarsh,78.24,65.82,40,0
.goto Zangarmarsh,78.71,66.49,40,0
.goto Zangarmarsh,78.96,67.44,40,0
.line Zangarmarsh,78.96,67.44,78.71,66.49,78.24,65.82,78.25,63.88,79.57,64.48,81.11,64.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克勒斯|r交谈
>>|cRXP_FRIENDLY_克勒斯|r|cRXP_WARN_巡逻略有异常|r
.complete 9785,2 
.skipgossip
.unitscan Keleth
step
#requires ashyen
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_唤风者塔鲁·黑蹄|r交谈
.turnin 9785 >>交任务: |cRXP_FRIENDLY_古树的祝福|r
.goto Zangarmarsh,80.37,64.73
.target Windcaller Blackhoof
step
#sticky
#label hamoot1a
.goto Zangarmarsh,79.09,65.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔楼中的|r监护者哈穆特|r交谈
.turnin 9728 >>交任务: |cRXP_FRIENDLY_热情的欢迎|r
.isQuestComplete 9728
.target Warden Hamoot
step
#sticky
#label hamoot2a
.goto Zangarmarsh,79.09,65.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔楼中的|r监护者哈穆特|r交谈
.turnin 9817 >>交任务: |cRXP_FRIENDLY_血鳞纳迦的领袖|r
.isQuestComplete 9817
.target Warden Hamoot
step
.goto Zangarmarsh,79.09,65.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔楼中的|r监护者哈穆特|r交谈
.turnin 9730 >>交任务: |cRXP_FRIENDLY_暗潮纳迦的首领|r
.isQuestComplete 9730
.target Warden Hamoot
step
#requires hamoot1a
step
#requires hamoot2a
.goto Zangarmarsh,78.53,63.15
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱森·月火|r交谈
.accept 9697 >>接任务: |cRXP_LOOT_观察者莉萨奥|r
.accept 9957 >>接任务: |cRXP_LOOT_塞纳里奥树林出事了？|r << tbc/wotlk
.target Lethyn Moonfire
step << tbc
.goto 1946/530,5534.89990,-142.30000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊谢尔·风歌|r交谈
.target Ysiel Windsinger
.turnin 9731 >>交任务: |cRXP_FRIENDLY_抽水泵结构图|r
.accept 9724 >>接任务: |cRXP_LOOT_通知塞纳里奥议会|r
step
>>前往塞纳里奥哨站
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛霍拉姆·硬蹄|r和|cRXP_FRIENDLY_阿米希尔·迷雾行者|r交谈
.turnin -10159 >>交任务: |cRXP_FRIENDLY_扫清棘牙岭！|r
.goto Hellfire Peninsula,15.65,52.15
.turnin 9724 >>交任务: |cRXP_FRIENDLY_通知塞纳里奥议会|r
.accept 9732 >>接任务: |cRXP_LOOT_返回沼泽|r
.goto Hellfire Peninsula,16.04,52.15
.target Mahuram Stouthoof
.target Amythiel Mistwalker
step << Shaman (tbc/wotlk)
#completewith next
.hs >>传送至泰雷多尔
.skill riding,225,1
step << tbc/wotlk
#completewith Adal
.goto Hellfire Peninsula,25.19,37.23 << !Shaman
.goto Zangarmarsh,67.83,51.46 << Shaman
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古玛|r交谈 << !Shaman
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒙希|r交谈 << Shaman
.fly Shattrath >>飞往沙塔斯城
.skill riding,225,1
.target Kuma << !Shaman
.target Munci << Shaman
step << tbc/wotlk
#completewith Adal
.goto Shattrath City,59.66,41.45
.zone Shattrath City >>前往: |cRXP_PICK_沙塔斯城|r
.skill riding,<225,1
step << tbc/wotlk
#label Adal
.goto 1955/530,5362.10010,-1832.90002
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_憔悴的志愿兵|r交谈
.target Haggard War Veteran
.accept 10210 >>接任务: |cRXP_LOOT_阿达尔|r
step << tbc/wotlk
.goto 1955/530,5426.70020,-1862.70007
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿达尔|r交谈
.target A'dal
.turnin 10210 >>交任务: |cRXP_FRIENDLY_阿达尔|r
step << tbc/wotlk
.goto 1955/530,5421.80029,-1859.00000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khadgar's Servant|r交谈
.target Khadgar
.accept 10211 >>接任务: |cRXP_LOOT_圣光之城|r
.timer 462,City of Light RP
step << tbc/wotlk
#completewith next
#xprate <1.5
>>跟随|cRXP_FRIENDLY_Khadgar's Servant|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞瑟|r交谈
.accept 10037 >>接任务: |cRXP_LOOT_宁可去钓鱼|r
.target +Seth
.goto Shattrath City,63.94,15.52
.goto Shattrath City,52.54,21.03
.target Khadgar's Servant
step << tbc/wotlk
.goto Shattrath City,50.36,42.87
>>跟随|cRXP_FRIENDLY_卡德加的仆人|r << wotlk
>>和|cRXP_FRIENDLY_G'eras|r一起前往二楼, 等待角色扮演(RP)结束. 如果在此期间有其他玩家的|cRXP_FRIENDLY_Khadgar's Servant|r出现, 你可以将其设为目标, 它会自动为你完成任务. 如果任务失败, 请放弃当前任务, 重新从|cRXP_FRIENDLY_Khadgar's Servant|r处领取任务, 然后跟随它移动 << tbc
.complete 10211,1 
.target Khadgar's Servant
step << Mage (tbc/wotlk)
.goto Shattrath City,58.77,47.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾欧莉娅|r交谈
.train 35715 >>传送点:沙塔斯和传送门:沙塔斯
.target Iorioa
step << tbc/wotlk
.goto Shattrath City,54.74,44.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khadgar's Servant|r交谈
.turnin 10211 >>交任务: |cRXP_FRIENDLY_圣光之城|r
.target Khadgar
step << tbc/wotlk
.goto Shattrath City,54.74,44.32
.turninmultiple 10551,10552>>与|cRXP_FRIENDLY_卡德加的仆从|r交谈. 向奥尔多或斯克利尔宣誓效忠
*If you do not see Aldor or Scryer specific quest steps after this, type "/reload" into your ingame chat box
.target Khadgar
.isQuestAvailable 10551
.isQuestAvailable 10552
step << tbc/wotlk
#scryer
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khadgar's Servant|r交谈
.goto Shattrath City,54.74,44.32
.accept 10553 >>接任务: |cRXP_LOOT_先知沃雷塔尔|r
.target Khadgar
step << tbc/wotlk
#aldor
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khadgar's Servant|r交谈
.goto Shattrath City,54.74,44.32
.accept 10554 >>接任务: |cRXP_LOOT_伊沙娜|r
.target Khadgar
step << (Warlock/Shaman/Paladin/Mage) (tbc/wotlk)
#completewith next
.goto Shattrath City,55.7,36.9 << !Mage
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r << !Mage
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r << Mage
step << (Warlock/Shaman/Paladin/Mage) (tbc/wotlk)
.goto StormwindClassic,25.3,78.7 << Warlock
.goto StormwindClassic,38.6,32.8 << Paladin
.goto StormwindClassic,61.9,84.0 << Shaman
.goto StormwindClassic,39.6,79.6 << Mage
.trainer >>训练你的职业法术
.target Ursula Deline << Warlock
.target Demisette Cloyce << Warlock
.target Sandahl << Warlock
.target Arthur the Faithful << Paladin
.target Katherine the Pure << Paladin
.target Lord Grayson Shadowbreaker << Paladin
.target Farseer Umbrua << Shaman
.target Elsharin << Mage
.target Jennea Cannon << Mage
step << (Warrior/Hunter/Rogue/Priest) (tbc/wotlk)
#completewith next
.goto Shattrath City,55.2,36.5
.zone Darnassus >>前往: |cRXP_PICK_达纳苏斯|r
step << (Warrior/Hunter/Rogue/Priest) (tbc/wotlk)
.goto Darnassus,39.0,83.2 << Priest
.goto Darnassus,40.6,9.2 << Hunter
.goto Darnassus,31.5,17.4 << Rogue
.goto Darnassus,58.75,35.16 << Warrior
.trainer >>训练你的职业法术
.target Jandria << Priest
.target Jocaste << Hunter
.target Anishar << Rogue
.target Erion Shadewhisper << Rogue
.target Syurna << Rogue
.target Arias'ta Bladesinger << Warrior

step << Druid (tbc/wotlk)
>>前往: |cRXP_PICK_月光林地|r
.goto Moonglade,52.4,40.6
.trainer 12042 >>训练你的职业法术
.target Loganaar << Druid
step << DK (tbc/wotlk)
#completewith next
.cast 50977 >>施放死亡之门
.zoneskip Eastern Plaguelands
step << DK (tbc/wotlk)
.goto Eastern Plaguelands,80.3,48.0
>>前往: |cRXP_PICK_东瘟疫之地|r
.trainer >>在阿彻鲁斯向|cRXP_FRIENDLY_Amal'thazad|r训练你的职业法术
.target Amal'thazad
step
#completewith Vial
.hs >>传送至泰雷多尔

step
#completewith next
.goto Zangarmarsh,67.83,51.46
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蒙希|r交谈
.fly Orebor Harborage >>飞往奥雷柏尔营地
.skill riding,300,1
.target Munci
step
.goto 1946/530,7400.70020,973.50000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪莫斯·丹尼斯|r交谈
.target Timothy Daniels
.accept 9848 >>接任务: |cRXP_LOOT_匕潭的秘密|r
step
.goto 1946/530,7376.20020,1019.90002
>>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_FRIENDLY_通缉告示|r
.accept 10116 >>接任务: |cRXP_LOOT_通缉：穆玛基酋长|r
step
.goto 1946/530,7367.70020,1022.60004
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊库提|r交谈
.target Ikuti
.accept 9835 >>接任务: |cRXP_LOOT_安葛洛什的威胁|r
.accept 10115 >>接任务: |cRXP_LOOT_匕潭的威胁|r
.turnin 9776 >>交任务: |cRXP_FRIENDLY_奥雷柏尔营地|r
step
#optional
#completewith Vial
>>击杀|cRXP_ENEMY_大型孢子蝠|r 和|cRXP_ENEMY_泥沼游荡者|r , 击败它们后可获得|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Greater Sporebat
.mob *Marsh Walker
.subzoneskip 3640
step
#optional
#completewith Vial
>>在赞加沼泽各地搜刮地面上的|cRXP_PICK_橙色蘑菇|r
.collect 24245,10,9808,1 
step
#optional
#completewith Mummaki
>>击杀|cRXP_ENEMY_匕潭刺客|r 和|cRXP_ENEMY_匕潭泥居者|r
.complete 10115,1 
.mob +Daggerfen Assassin
.complete 10115,2 
.mob +Daggerfen Muckdweller
step
#label Vial
.goto Zangarmarsh,26.40,22.85
>>拾取地面上的小|cRXP_PICK_匕潭毒药瓶|r
.complete 9848,2 
step
#label Mummaki
>>击杀塔顶的穆玛基酋长. 搜刮他的图腾
>>在顶层靠近|cRXP_ENEMY_Mummaki|r的位置拾取|cRXP_PICK_匕潭毒药手册|r书籍
.complete 10116,1 
.goto Zangarmarsh,23.77,26.74,-1
.complete 9848,1 
.goto Zangarmarsh,24.40,27.00,-1
.unitscan Chieftain Mummaki
step
#optional
#completewith Oreboring
>>击杀|cRXP_ENEMY_大型孢子蝠|r 和|cRXP_ENEMY_泥沼游荡者|r , 击败它们后可获得|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Greater Sporebat
.mob *Marsh Walker
step
#loop
.line Zangarmarsh,24.58,26.44,25.83,27.17,27.06,25.42,28.18,23.79,28.50,22.23,26.24,22.36,26.31,20.43,25.00,20.56,24.87,22.28,22.89,21.07,22.24,22.32,24.22,24.50,25.74,24.95,24.58,26.44
.goto Zangarmarsh,24.58,26.44,50,0
.goto Zangarmarsh,25.83,27.17,50,0
.goto Zangarmarsh,27.06,25.42,50,0
.goto Zangarmarsh,28.18,23.79,50,0
.goto Zangarmarsh,28.50,22.23,50,0
.goto Zangarmarsh,26.24,22.36,50,0
.goto Zangarmarsh,26.31,20.43,50,0
.goto Zangarmarsh,25.00,20.56,50,0
.goto Zangarmarsh,24.87,22.28,50,0
.goto Zangarmarsh,22.89,21.07,50,0
.goto Zangarmarsh,22.24,22.32,50,0
.goto Zangarmarsh,24.22,24.50,50,0
.goto Zangarmarsh,25.74,24.95,50,0
.goto Zangarmarsh,24.58,26.44,50,0
>>击杀|cRXP_ENEMY_匕潭刺客|r 和|cRXP_ENEMY_匕潭泥居者|r
.complete 10115,1 
.mob +Daggerfen Assassin
.complete 10115,2 
.mob +Daggerfen Muckdweller
step
#optional
#completewith Oreboring
>>在赞加沼泽各处地面上拾取|cRXP_PICK_亮顶蘑菇|r
.collect 24245,10,9808,1 
step
#loop
.line Zangarmarsh,28.90,27.88,29.29,26.89,30.66,26.89,32.03,27.30,33.20,28.97,35.19,26.85,37.09,26.88,38.88,28.22,37.80,28.63,36.08,29.61,36.41,32.55,36.40,33.65,35.11,34.53,34.27,33.37,34.45,31.45,33.94,30.16,32.44,32.76,31.67,30.44,29.97,30.13,28.90,27.88
.goto Zangarmarsh,28.90,27.88,50,0
.goto Zangarmarsh,29.29,26.89,50,0
.goto Zangarmarsh,30.66,26.89,50,0
.goto Zangarmarsh,32.03,27.30,50,0
.goto Zangarmarsh,33.20,28.97,50,0
.goto Zangarmarsh,35.19,26.85,50,0
.goto Zangarmarsh,37.09,26.88,50,0
.goto Zangarmarsh,38.88,28.22,50,0
.goto Zangarmarsh,37.80,28.63,50,0
.goto Zangarmarsh,36.08,29.61,50,0
.goto Zangarmarsh,36.41,32.55,50,0
.goto Zangarmarsh,36.40,33.65,50,0
.goto Zangarmarsh,35.11,34.53,50,0
.goto Zangarmarsh,34.27,33.37,50,0
.goto Zangarmarsh,34.45,31.45,50,0
.goto Zangarmarsh,33.94,30.16,50,0
.goto Zangarmarsh,32.44,32.76,50,0
.goto Zangarmarsh,31.67,30.44,50,0
.goto Zangarmarsh,29.97,30.13,50,0
.goto Zangarmarsh,28.90,27.88,50,0
>>击杀|cRXP_ENEMY_Ango'rosh 萨满祭司|r和|cRXP_ENEMY_食人魔|r
.complete 9835,1 
.mob +Ango'rosh Shaman
.complete 9835,2 
.mob +Ango'rosh Ogre
step
#label Oreboring
.goto Zangarmarsh,41.94,27.19
>>返回奥雷柏尔营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊库提|r交谈
.turnin 9835 >>交任务: |cRXP_FRIENDLY_安葛洛什的威胁|r
.accept 9839 >>接任务: |cRXP_LOOT_戈尔费斯大王|r
.turnin 10115 >>交任务: |cRXP_FRIENDLY_匕潭的威胁|r
.turnin 10116 >>交任务: |cRXP_FRIENDLY_通缉：穆玛基酋长|r
.target Ikuti
step
#completewith Sporelings
.goto Zangarmarsh,41.85,26.22
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店老板克尔普交谈|cRXP_FRIENDLY_旅店老板克尔普|r
.home >>将你的炉石设置为奥雷柏尔营地
.target Innkeeper Kerp
step
.goto 1946/530,7382.50000,1019.0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克图|r交谈
.target Maktu
.accept 9834 >>接任务: |cRXP_LOOT_天然的护甲|r
step
.goto 1946/530,7401.50000,976.40002
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪莫斯·丹尼斯|r交谈
.target Timothy Daniels
.turnin 9848 >>交任务: |cRXP_FRIENDLY_匕潭的秘密|r
step
.goto 1946/530,7421.0,976.29999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普尔鲁|r交谈
.target Puluu
.accept 9830 >>接任务: |cRXP_LOOT_沼泽中的毒液|r
.accept 9833 >>接任务: |cRXP_LOOT_通讯路线|r
.accept 9902 >>接任务: |cRXP_LOOT_沼光湖的恐怖|r
step
#optional
#completewith Sporelings
>>在赞加沼泽各处地面上拾取|cRXP_PICK_亮顶蘑菇|r
.collect 24245,10,9808,1 
step
#optional
#completewith Sporelings
>>击杀|cRXP_ENEMY_大型孢子蝠|r 和|cRXP_ENEMY_泥沼游荡者|r , 击败它们后可获得|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Greater Sporebat
.mob *Marsh Walker
step
#optional
#completewith Sporelings
>>击杀|cRXP_ENEMY_沼牙切割者|r
.complete 9833,1 
.mob Marshfang Slicer
step
#label Leesa1
.goto Zangarmarsh,23.32,66.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_观察者莉萨奥|r交谈
.turnin 9697 >>交任务: |cRXP_FRIENDLY_观察者莉萨奥|r
.accept 9701 >>接任务: |cRXP_LOOT_观察孢子人|r
.target Watcher Leesa'oh
step
#label Sporelings
.goto Zangarmarsh,19.03,62.34,50,0
.goto Zangarmarsh,19.19,64.60
.line Zangarmarsh,19.03,62.34,19.19,64.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法恩森|r交谈. 他会在附近巡逻
.accept 9739 >>接任务: |cRXP_LOOT_孢子人的困境|r
.accept 9743 >>接任务: |cRXP_LOOT_天敌|r
.target Fahssn
step
#optional
#completewith Tendrils
>>在地面上收集|cRXP_PICK_Sacs|r(它们看起来像气球)
.complete 9739,1 
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_沼泽领主|r. 击败他们后搜刮出|cRXP_LOOT_触须|r
.complete 9743,1 
.mob Starving Fungal Giant
.mob Starving Bog Lord
.mob Bog Lord
step
.goto Zangarmarsh,14.95,59.88
>>前往产卵峡谷附近
.complete 9701,1 
step
#label Tendrils
#loop
.line Zangarmarsh,13.76,57.97,10.51,60.28,10.53,62.68,13.24,63.84,17.35,63.48,17.46,57.13,13.76,57.97
.goto Zangarmarsh,13.76,57.97,60,0
.goto Zangarmarsh,10.51,60.28,60,0
.goto Zangarmarsh,10.53,62.68,60,0
.goto Zangarmarsh,13.24,63.84,60,0
.goto Zangarmarsh,17.35,63.48,60,0
.goto Zangarmarsh,17.46,57.13,60,0
.goto Zangarmarsh,13.76,57.97,60,0
>>击杀|cRXP_ENEMY_沼泽领主|r. 击败他们后搜刮出|cRXP_LOOT_触须|r
.complete 9743,1 
.mob Starving Fungal Giant
.mob Starving Bog Lord
.mob Bog Lord
step
#loop
.line Zangarmarsh,13.76,57.97,10.51,60.28,10.53,62.68,13.24,63.84,17.35,63.48,17.46,57.13,13.76,57.97
.goto Zangarmarsh,13.76,57.97,60,0
.goto Zangarmarsh,10.51,60.28,60,0
.goto Zangarmarsh,10.53,62.68,60,0
.goto Zangarmarsh,13.24,63.84,60,0
.goto Zangarmarsh,17.35,63.48,60,0
.goto Zangarmarsh,17.46,57.13,60,0
.goto Zangarmarsh,13.76,57.97,60,0
>>在地面上收集|cRXP_PICK_Sacs|r(它们看起来像气球)
.complete 9739,1 
step
#optional
#completewith Idols
>>在赞加沼泽各处地面上拾取|cRXP_PICK_亮顶蘑菇|r
.collect 24245,10,9808,1 
step
#optional
#completewith Ungula
>>击杀|cRXP_ENEMY_沼牙切割者|r
.complete 9833,1 
.mob Marshfang Slicer
step
.goto Zangarmarsh,19.03,62.34,50,0
.goto Zangarmarsh,19.19,64.60
.line Zangarmarsh,19.03,62.34,19.19,64.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法恩森|r交谈. 他会在附近巡逻
.turnin 9739 >>交任务: |cRXP_FRIENDLY_孢子人的困境|r
.turnin 9743 >>交任务: |cRXP_FRIENDLY_天敌|r
.target Fahssn
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_大型孢子蝠|r 和|cRXP_ENEMY_泥沼游荡者|r , 击败它们后可获得|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Greater Sporebat
.mob *Marsh Walker
step
#label Lessa2
.goto Zangarmarsh,23.32,66.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_观察者莉萨奥|r交谈
.turnin 9701 >>交任务: |cRXP_FRIENDLY_观察孢子人|r
.accept 9702 >>接任务: |cRXP_LOOT_狼吞虎咽|r
.target Watcher Leesa'oh
step
#label Nutriment
#loop
.line Zangarmarsh,26.31,62.73,27.31,66.10,28.34,63.77,29.80,65.23,31.36,67.21,32.31,65.48,33.59,65.76,32.31,65.48,30.89,63.10,31.89,60.49,29.28,59.50,29.10,62.48,26.31,62.73
.goto Zangarmarsh,26.31,62.73,60,0
.goto Zangarmarsh,27.31,66.10,60,0
.goto Zangarmarsh,28.34,63.77,60,0
.goto Zangarmarsh,29.80,65.23,60,0
.goto Zangarmarsh,31.36,67.21,60,0
.goto Zangarmarsh,32.31,65.48,60,0
.goto Zangarmarsh,33.59,65.76,60,0
.goto Zangarmarsh,32.31,65.48,60,0
.goto Zangarmarsh,30.89,63.10,60,0
.goto Zangarmarsh,31.89,60.49,60,0
.goto Zangarmarsh,29.28,59.50,60,0
.goto Zangarmarsh,29.10,62.48,60,0
.goto Zangarmarsh,26.31,62.73,60,0
>>拾取地面上的|cRXP_PICK_丢弃的食物|r (小蘑菇)
.complete 9702,1 
step << !tbc
.goto Zangarmarsh,32.86,59.52
.use 25459 >>杀死 |cRXP_ENEMY_"Count" Ungula|r。搜刮他的 |cRXP_LOOT_Mandible|r。点击背包中的 |T135592:0|t["Count" Ungula's Mandible]
.collect 25459,1,9911 
.accept 9911 >>接任务: |cRXP_LOOT_沼泽中的伯爵|r
.unitscan "Count" Ungula
step << tbc
#loop
.line Zangarmarsh,26.31,62.73,27.31,66.10,28.34,63.77,29.80,65.23,31.36,67.21,32.31,65.48,33.59,65.76,32.31,65.48,30.89,63.10,31.89,60.49,29.28,59.50,29.10,62.48,26.31,62.73
.goto Zangarmarsh,26.31,62.73,60,0
.goto Zangarmarsh,27.31,66.10,60,0
.goto Zangarmarsh,28.34,63.77,60,0
.goto Zangarmarsh,29.80,65.23,60,0
.goto Zangarmarsh,31.36,67.21,60,0
.goto Zangarmarsh,32.31,65.48,60,0
.goto Zangarmarsh,33.59,65.76,60,0
.goto Zangarmarsh,32.31,65.48,60,0
.goto Zangarmarsh,30.89,63.10,60,0
.goto Zangarmarsh,31.89,60.49,60,0
.goto Zangarmarsh,29.28,59.50,60,0
.goto Zangarmarsh,29.10,62.48,60,0
.goto Zangarmarsh,26.31,62.73,60,0
>>击杀|cRXP_ENEMY_沼泽领主|r. 击败他们后搜刮出|cRXP_LOOT_触须|r
.collect 24291,6 
.reputation 970,neutral,0,1
.mob Starving Fungal Giant
.mob Starving Bog Lord
.mob Bog Lord
step
#loop
.line Zangarmarsh,26.31,62.73,27.31,66.10,28.34,63.77,29.80,65.23,31.36,67.21,32.31,65.48,33.59,65.76,32.31,65.48,30.89,63.10,31.89,60.49,29.28,59.50,29.10,62.48,26.31,62.73
.goto Zangarmarsh,26.31,62.73,60,0
.goto Zangarmarsh,27.31,66.10,60,0
.goto Zangarmarsh,28.34,63.77,60,0
.goto Zangarmarsh,29.80,65.23,60,0
.goto Zangarmarsh,31.36,67.21,60,0
.goto Zangarmarsh,32.31,65.48,60,0
.goto Zangarmarsh,33.59,65.76,60,0
.goto Zangarmarsh,32.31,65.48,60,0
.goto Zangarmarsh,30.89,63.10,60,0
.goto Zangarmarsh,31.89,60.49,60,0
.goto Zangarmarsh,29.28,59.50,60,0
.goto Zangarmarsh,29.10,62.48,60,0
.goto Zangarmarsh,26.31,62.73,60,0
.reputation 970,neutral,0 >>刷怪|cRXP_ENEMY_沼泽领主|r, 直到你与孢子村达到|cRXP_WARN_Neutral|r
.mob Starving Fungal Giant
.mob Starving Bog Lord
.mob Bog Lord
step << !tbc
.goto Zangarmarsh,19.03,62.34,50,0
.goto Zangarmarsh,19.19,64.60
.line Zangarmarsh,19.03,62.34,19.19,64.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法恩森|r交谈. 他会在附近巡逻
.accept 9919 >>接任务: |cRXP_LOOT_孢子村|r
.mob Starving Fungal Giant
.mob Starving Bog Lord
.mob Bog Lord
step
#questguide << !tbc
.goto Zangarmarsh,23.32,66.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lessa'oh|r交谈
.turnin 9702 >>交任务: |cRXP_FRIENDLY_狼吞虎咽|r
.accept 9708 >>接任务: |cRXP_LOOT_熟悉的蘑菇|r
.target Watcher Leesa'oh
step << tbc
#label Ungula
.goto Zangarmarsh,32.86,59.52
.use 25459 >>杀死 |cRXP_ENEMY_"Count" Ungula|r。搜刮他的 |cRXP_LOOT_Mandible|r。点击背包中的 |T135592:0|t["Count" Ungula's Mandible]
.collect 25459,1,9911 
.accept 9911 >>接任务: |cRXP_LOOT_沼泽中的伯爵|r
.unitscan "Count" Ungula
step << !tbc
#label Ungula
.goto Zangarmarsh,23.32,66.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lessa'oh|r交谈
.turnin 9911 >>交任务: |cRXP_FRIENDLY_沼泽中的伯爵|r
.turnin 9702 >>交任务: |cRXP_FRIENDLY_狼吞虎咽|r
.target Watcher Leesa'oh
step
#optional
#completewith Idols
>>击杀|cRXP_ENEMY_沼泽阔步者|r和|cRXP_ENEMY_大型孢子蝠|r. 击败它们后拾取其掉落的|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Greater Sporebat
.mob *Fen Strider
.mob *Marsh Walker
.mob *Sporebat
step
#loop
.line Zangarmarsh,32.12,59.16,32.87,60.25,34.12,62.12,35.08,63.37,37.14,62.08,39.08,63.53,38.99,59.32,36.85,56.26,34.96,59.53,33.60,57.06,32.12,59.16
.goto Zangarmarsh,32.12,59.16,50,0
.goto Zangarmarsh,32.87,60.25,50,0
.goto Zangarmarsh,34.12,62.12,50,0
.goto Zangarmarsh,35.08,63.37,50,0
.goto Zangarmarsh,37.14,62.08,50,0
.goto Zangarmarsh,39.08,63.53,50,0
.goto Zangarmarsh,38.99,59.32,50,0
.goto Zangarmarsh,36.85,56.26,50,0
.goto Zangarmarsh,34.96,59.53,50,0
.goto Zangarmarsh,33.60,57.06,50,0
.goto Zangarmarsh,32.12,59.16,50,0
>>击杀|cRXP_ENEMY_沼牙切割者|r
.complete 9833,1 
.mob Marshfang Slicer
step
#label Idols
.goto Zangarmarsh,46.09,57.76,20,0
.goto Zangarmarsh,46.17,59.79,20,0
.goto Zangarmarsh,45.93,60.71,20,0
.goto Zangarmarsh,46.25,60.96,20,0
.goto Zangarmarsh,47.46,61.77,20,0
.goto Zangarmarsh,49.09,61.27,20,0
.goto Zangarmarsh,49.24,60.72,20,0
.goto Zangarmarsh,49.70,61.09,20,0
.goto Zangarmarsh,48.19,63.81,20,0
.goto Zangarmarsh,47.90,64.20,20,0
.goto Zangarmarsh,48.59,64.71,20,0
.goto Zangarmarsh,43.24,62.40
>>拾取地面上的小石像|cRXP_PICK_Idols|r
.complete 9787,1 
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_沼泽阔步者|r和|cRXP_ENEMY_孢子蝠|r. 击败它们后拾取其|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Greater Sporebat
.mob *Fen Strider
.mob *Marsh Walker
.mob *Sporebat
.subzoneskip 3653
step << !Warlock
#completewith next
.cast 22807 >>使用背包中的 |T134716:0|t[水下呼吸药水]
.use 25539
step
#loop
.line Zangarmarsh,48.35,45.31,49.52,44.88,50.82,45.18,51.57,44.16,51.35,42.51,52.25,43.34,52.99,42.77,53.30,41.79,52.45,41.36,52.67,39.01,50.99,37.35,50.26,36.26,48.89,38.04,48.07,39.03,48.73,40.09,47.66,40.78,47.74,41.81,49.00,42.23,48.35,45.31
.goto Zangarmarsh,48.35,45.31,50,0
.goto Zangarmarsh,49.52,44.88,50,0
.goto Zangarmarsh,50.82,45.18,50,0
.goto Zangarmarsh,51.57,44.16,50,0
.goto Zangarmarsh,51.35,42.51,50,0
.goto Zangarmarsh,52.25,43.34,50,0
.goto Zangarmarsh,52.99,42.77,50,0
.goto Zangarmarsh,53.30,41.79,50,0
.goto Zangarmarsh,52.45,41.36,50,0
.goto Zangarmarsh,52.67,39.01,50,0
.goto Zangarmarsh,50.99,37.35,50,0
.goto Zangarmarsh,50.26,36.26,50,0
.goto Zangarmarsh,48.89,38.04,50,0
.goto Zangarmarsh,48.07,39.03,50,0
.goto Zangarmarsh,48.73,40.09,50,0
.goto Zangarmarsh,47.66,40.78,50,0
.goto Zangarmarsh,47.74,41.81,50,0
.goto Zangarmarsh,49.00,42.23,50,0
.goto Zangarmarsh,48.35,45.31,50,0
>>在水下击杀|cRXP_ENEMY_泥爪毁坏者|r, 掠夺它们的|cRXP_LOOT_皮毛|r
.complete 9834,1 
.mob Fenclaw Thrasher
step << Shaman
#completewith next
.hs >>炉石传送至奥雷柏尔营地
step
#optional
#completewith Orebor1
>>击杀|cRXP_ENEMY_大型孢子蝠|r. 击败它们获取|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob *Greater Sporebat
.mob *Marsh Walker
step
#optional
#completewith FSpores
>>在赞加沼泽各处地面上拾取|cRXP_PICK_亮顶蘑菇|r
.collect 24245,10,9808,1 
step
.goto 1946/530,7383.70020,1020.29999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克图|r交谈
.target Maktu
.turnin 9834 >>交任务: |cRXP_FRIENDLY_天然的护甲|r
.accept 9905 >>接任务: |cRXP_LOOT_玛克图的复仇|r
step
.goto 1946/530,7422.10010,974.29999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普尔鲁|r交谈
.target Puluu
.turnin 9833 >>交任务: |cRXP_FRIENDLY_通讯路线|r
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_水光针刺者|r. 击败后搜刮他们的|cRXP_LOOT_翅膀|r
.complete 9790,1 
.mob Bogflare Needler
step
.goto Zangarmarsh,42.24,41.40
>>击杀|cRXP_ENEMY_穆拉格什|r
.complete 9905,1 
.unitscan Mragesh
step
#questguide << !tbc
#loop
.line Zangarmarsh,28.90,27.88,29.29,26.89,30.66,26.89,32.03,27.30,33.20,28.97,35.19,26.85,37.09,26.88,38.88,28.22,37.80,28.63,36.08,29.61,36.41,32.55,36.40,33.65,35.11,34.53,34.27,33.37,34.45,31.45,33.94,30.16,32.44,32.76,31.67,30.44,29.97,30.13,28.90,27.88
.goto Zangarmarsh,28.90,27.88,50,0
.goto Zangarmarsh,29.29,26.89,50,0
.goto Zangarmarsh,30.66,26.89,50,0
.goto Zangarmarsh,32.03,27.30,50,0
.goto Zangarmarsh,33.20,28.97,50,0
.goto Zangarmarsh,35.19,26.85,50,0
.goto Zangarmarsh,37.09,26.88,50,0
.goto Zangarmarsh,38.88,28.22,50,0
.goto Zangarmarsh,37.80,28.63,50,0
.goto Zangarmarsh,36.08,29.61,50,0
.goto Zangarmarsh,36.41,32.55,50,0
.goto Zangarmarsh,36.40,33.65,50,0
.goto Zangarmarsh,35.11,34.53,50,0
.goto Zangarmarsh,34.27,33.37,50,0
.goto Zangarmarsh,34.45,31.45,50,0
.goto Zangarmarsh,33.94,30.16,50,0
.goto Zangarmarsh,32.44,32.76,50,0
.goto Zangarmarsh,31.67,30.44,50,0
.goto Zangarmarsh,29.97,30.13,50,0
.goto Zangarmarsh,28.90,27.88,50,0
>>击杀|cRXP_ENEMY_Ango'rosh 食人魔|r和|cRXP_ENEMY_Ango'rosh 哨卫|r和|cRXP_ENEMY_Ango'rosh 萨满|r, 搜刮他们的|cRXP_LOOT_Mushrooms|蘑菇|r
.complete 9708,1 
.mob Ango'rosh Ogre
.mob Ango'rosh Sentry
.mob Ango'rosh Shaman
.mob Boss Grog'ak
step
#optional
#completewith MarshControls
>>击杀|cRXP_ENEMY_沼光抽血者|r. 击败后掠夺其掉落的|cRXP_LOOT_毒液|r和|cRXP_LOOT_翅膀|r
.complete 9830,1 
.complete 9790,1 
.mob Marshlight Bleeder
step
#questguide << !tbc
.goto Zangarmarsh,23.32,66.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lessa'oh|r交谈
.turnin 9708 >>交任务: |cRXP_FRIENDLY_熟悉的蘑菇|r
.accept 9709 >>接任务: |cRXP_LOOT_偷回蘑菇|r
.turnin 9911 >>交任务: |cRXP_FRIENDLY_沼泽中的伯爵|r
.target Watcher Leesa'oh
step
#label Orebor1
step << tbc
#optional
#completewith next
>>击杀|cRXP_ENEMY_大型孢子蝠|r 和|cRXP_ENEMY_泥沼游荡者|r , 击败它们后可获得|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob Greater Sporebat
.mob Marsh Walker
step << tbc
#label Sporeggar
.goto Zangarmarsh,19.03,62.34,60,0
.goto Zangarmarsh,19.19,64.60
.line Zangarmarsh,19.03,62.34,19.19,64.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法恩森|r交谈. 他会在附近巡逻
.accept 9919 >>接任务: |cRXP_LOOT_孢子村|r
.turnin 9744 >>交任务: |cRXP_FRIENDLY_更多卷须！|r
.target Fahssn
step
#label FSpores
#loop
.line Zangarmarsh,20.87,66.51,21.59,60.30,22.02,58.36,20.27,57.74,18.36,55.46,21.05,52.64,25.47,57.26,20.87,66.51
.goto Zangarmarsh,20.87,66.51,50,0
.goto Zangarmarsh,21.59,60.30,50,0
.goto Zangarmarsh,22.02,58.36,50,0
.goto Zangarmarsh,20.27,57.74,50,0
.goto Zangarmarsh,18.36,55.46,50,0
.goto Zangarmarsh,21.05,52.64,50,0
.goto Zangarmarsh,25.47,57.26,50,0
.goto Zangarmarsh,20.87,66.51,50,0
>>击杀|cRXP_ENEMY_大型孢子蝠|r 和|cRXP_ENEMY_泥沼游荡者|r , 击败它们后可获得|cRXP_LOOT_成熟的孢子|r
.collect 24449,6,9806,1 
.mob Greater Sporebat
.mob Marsh Walker
step
#loop
.line Zangarmarsh,19.40,64.97,22.18,63.38,32.63,54.20,27.28,52.55,27.74,47.76,21.27,54.58,19.70,51.18,19.40,64.97
.goto Zangarmarsh,19.40,64.97,50,0
.goto Zangarmarsh,22.18,63.38,50,0
.goto Zangarmarsh,32.63,54.20,50,0
.goto Zangarmarsh,27.28,52.55,50,0
.goto Zangarmarsh,27.74,47.76,50,0
.goto Zangarmarsh,21.27,54.58,50,0
.goto Zangarmarsh,19.70,51.18,50,0
.goto Zangarmarsh,19.40,64.97,50,0
>>在赞加沼泽各处地面上拾取|cRXP_PICK_亮顶蘑菇|r
.collect 24245,10,9808,1 
step
.goto 1946/530,8487.50000,191.90001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Msshi'fn|r交谈
.target Msshi'fn
.turnin 9919 >>交任务: |cRXP_FRIENDLY_孢子村|r
.accept 9808 >>接任务: |cRXP_LOOT_亮顶蘑菇|r
.turnin 9808 >>交任务: |cRXP_FRIENDLY_亮顶蘑菇|r
step
.goto 1946/530,8511.79980,278.50000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格沙弗|r交谈
.target Gshaff
.accept 9806 >>接任务: |cRXP_LOOT_成熟的孢子|r
.turnin 9806 >>交任务: |cRXP_FRIENDLY_成熟的孢子|r
step
#questguide << !tbc
.goto Zangarmarsh,15.58,60.02
.reputation 970,friendly >>刷怪|cRXP_ENEMY_沼泽领主|r直到声望达到|cRXP_FRIENDLY_友善|r
.mob Starving Fungal Giant
.mob Starving Bog Lord
.mob Bog Lord
step
#questguide << !tbc
>>与|cRXP_FRIENDLY_Gzhun'tt|r交谈
.accept 9726 >>接任务: |cRXP_LOOT_既然我们是朋友......|r
.goto Zangarmarsh,19.54,50.04
.target Gzhun'tt
step
.goto Zangarmarsh,22.34,45.89
>>击杀岛上的|cRXP_ENEMY_Terroclaw|r
.complete 9902,1 
.unitscan Terrorclaw
step
#optional
#completewith Bloodscale
>>击杀|cRXP_ENEMY_血鳞驱奴者|r 和|cRXP_ENEMY_血鳞女巫|r . 掠夺他们的|cRXP_LOOT_利爪|r
.complete 9728,1 
.mob Bloodscale Enchantress
.mob Bloodscale Slavedriver
step
#questguide << !tbc
#optional
#completewith next
>>击杀|cRXP_ENEMY_Bloodscale 血鳞驱奴者|r和|cRXP_ENEMY_Bloodscale 血鳞女巫|r
.complete 9726,1 
.mob +Bloodscale Slavedriver
.complete 9726,2 
.mob +Bloodscale Enchantress
.isOnQuest 9726
step
#label MarshControls
.goto Zangarmarsh,25.41,42.86
.use 24355 >>|cRXP_WARN_使用|r|T136074:0|t[铁藤种子], |cRXP_WARN_目标: |r湖泊控制|r
.complete 9720,2 
step
#questguide << !tbc
#loop
.line Zangarmarsh,24.93,41.85,26.13,40.93,25.79,39.22,24.82,38.46,24.94,36.37,26.38,35.80,28.29,36.89,29.06,38.57,28.49,40.87,28.02,41.90,29.07,44.08,27.72,44.48,26.80,43.70,26.68,46.24,25.85,47.27,25.18,43.82,24.93,41.85
.goto Zangarmarsh,24.93,41.85,50,0
.goto Zangarmarsh,26.13,40.93,50,0
.goto Zangarmarsh,25.79,39.22,50,0
.goto Zangarmarsh,24.82,38.46,50,0
.goto Zangarmarsh,24.94,36.37,50,0
.goto Zangarmarsh,26.38,35.80,50,0
.goto Zangarmarsh,28.29,36.89,50,0
.goto Zangarmarsh,29.06,38.57,50,0
.goto Zangarmarsh,28.49,40.87,50,0
.goto Zangarmarsh,28.02,41.90,50,0
.goto Zangarmarsh,29.07,44.08,50,0
.goto Zangarmarsh,27.72,44.48,50,0
.goto Zangarmarsh,26.80,43.70,50,0
.goto Zangarmarsh,26.68,46.24,50,0
.goto Zangarmarsh,25.85,47.27,50,0
.goto Zangarmarsh,25.18,43.82,50,0
.goto Zangarmarsh,24.93,41.85,50,0
>>击杀|cRXP_ENEMY_Bloodscale 血鳞驱奴者|r和|cRXP_ENEMY_Bloodscale 血鳞女巫|r
.complete 9726,1 
.mob +Bloodscale Slavedriver
.complete 9726,2 
.mob +Bloodscale Enchantress
.isOnQuest 9726
step
#label Bloodscale
step
#optional
#completewith Gorefist
.goto Zangarmarsh,27.73,32.32,60,0
.goto Zangarmarsh,25.87,33.28,60,0
.goto Zangarmarsh,25.71,31.64,60,0
.goto Zangarmarsh,24.78,29.79,60,0
.goto Zangarmarsh,24.27,31.62,60,0
.goto Zangarmarsh,22.83,31.15,60,0
.goto Zangarmarsh,21.23,32.21,60,0
.goto Zangarmarsh,20.51,31.27,60,0
.goto Zangarmarsh,18.84,35.49,60,0
>>击杀|cRXP_ENEMY_沼光抽血者|r. 击败后掠夺其掉落的|cRXP_LOOT_毒液|r和|cRXP_LOOT_翅膀|r
.complete 9830,1 
.complete 9790,1 
.mob Marshlight Bleeder
.subzoneskip 3651
step
#completewith Gorefist
.goto Zangarmarsh,17.08,13.10,40 >>跨过蘑菇桥
.skill riding,225,1
step
#sticky
#label Gorefist
.goto Zangarmarsh,18.40,7.79
>>杀死建筑内的|cRXP_ENEMY_Gorefist|r
.complete 9839,1 
.unitscan Overlord Gorefist
step
#questguide << !tbc
#loop
.goto Zangarmarsh,16.64,7.63,50,0
.goto Zangarmarsh,17.13,4.07,50,0
.goto Zangarmarsh,19.14,4.08,50,0
.goto Zangarmarsh,21.02,4.08,50,0
.goto Zangarmarsh,20.93,8.05,50,0
.goto Zangarmarsh,17.28,9.84,50,0
.goto Zangarmarsh,19.93,6.70,50,0
.goto Zangarmarsh,19.14,4.08,50,0
.goto Zangarmarsh,16.64,7.63,50,0
.goto Zangarmarsh,17.13,4.07,50,0
.goto Zangarmarsh,19.14,4.08,50,0
.goto Zangarmarsh,21.02,4.08,50,0
.goto Zangarmarsh,20.93,8.05,50,0
.goto Zangarmarsh,17.28,9.84,50,0
.goto Zangarmarsh,19.93,6.70,50,0
.goto Zangarmarsh,19.14,4.08,0
>>击杀|cRXP_ENEMY_Ango'rosh Maulers|r. 掠夺他们以获取|cRXP_LOOT_Boxes of Mushrooms|r
>>你也可以在地面上拾取|cRXP_LOOT_Boxes of Mushrooms|r
.complete 9839,2 
.disablecheckbox
.complete 9709,1 
.mob Ango'rosh Mauler
step
#loop
.goto Zangarmarsh,16.64,7.63,50,0
.goto Zangarmarsh,17.13,4.07,50,0
.goto Zangarmarsh,19.14,4.08,50,0
.goto Zangarmarsh,21.02,4.08,50,0
.goto Zangarmarsh,20.93,8.05,50,0
.goto Zangarmarsh,17.28,9.84,50,0
.goto Zangarmarsh,19.93,6.70,50,0
.goto Zangarmarsh,19.14,4.08,50,0
.goto Zangarmarsh,16.64,7.63,50,0
.goto Zangarmarsh,17.13,4.07,50,0
.goto Zangarmarsh,19.14,4.08,50,0
.goto Zangarmarsh,21.02,4.08,50,0
.goto Zangarmarsh,20.93,8.05,50,0
.goto Zangarmarsh,17.28,9.84,50,0
.goto Zangarmarsh,19.93,6.70,50,0
.goto Zangarmarsh,19.14,4.08,0
>>击杀|cRXP_ENEMY_Ango'rosh Maulers|r
.complete 9839,2 
.mob Ango'rosh Mauler
step
#requires Gorefist
.goto Zangarmarsh,27.73,32.32,60,0
.goto Zangarmarsh,25.87,33.28,60,0
.goto Zangarmarsh,25.71,31.64,60,0
.goto Zangarmarsh,24.78,29.79,60,0
.goto Zangarmarsh,24.27,31.62,60,0
.goto Zangarmarsh,22.83,31.15,60,0
.goto Zangarmarsh,21.23,32.21,60,0
.goto Zangarmarsh,20.51,31.27,60,0
.goto Zangarmarsh,18.84,35.49,60,0
.goto Zangarmarsh,16.37,37.32,60,0
.goto Zangarmarsh,15.49,40.37,60,0
.goto Zangarmarsh,15.15,45.80,60,0
.goto Zangarmarsh,16.70,45.10,60,0
.goto Zangarmarsh,19.25,46.80
>>击杀|cRXP_ENEMY_沼光抽血者|r 和|cRXP_ENEMY_沼光钉刺者|r . 击败它们后搜刮其掉落的|cRXP_LOOT_毒液|r 和|cRXP_LOOT_翅膀|r
.complete 9830,1 
.complete 9790,1 
.mob Marshlight Bleeder
.mob Fenglow Stinger
step
#questguide << !tbc
.goto Zangarmarsh,19.54,50.04
>>返回孢子村
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gzhun'tt|r交谈
.turnin 9726 >>交任务: |cRXP_FRIENDLY_既然我们是朋友......|r
.target Gzhun'tt
step
#questguide << !tbc
.goto Zangarmarsh,23.32,66.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lessa'oh|r交谈
.turnin 9709 >>交任务: |cRXP_FRIENDLY_偷回蘑菇|r
.target Watcher Leesa'oh
step
#xprate <1.5 << !Shaman
#completewith next
.hs >>炉石传送至奥雷柏尔营地
step
.goto 1946/530,7364.00000,1023.79999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊库提|r交谈
.target Ikuti
.turnin 9839 >>交任务: |cRXP_FRIENDLY_戈尔费斯大王|r
step
.goto 1946/530,7383.10010,1019.50000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克图|r交谈
.target Maktu
.turnin 9905 >>交任务: |cRXP_FRIENDLY_玛克图的复仇|r
step
.goto 1946/530,7419.39990,976.70001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普尔鲁|r交谈
.target Puluu
.turnin 9830 >>交任务: |cRXP_FRIENDLY_沼泽中的毒液|r
.turnin 9902 >>交任务: |cRXP_FRIENDLY_沼光湖的恐怖|r
step
#completewith next
.goto Zangarmarsh,41.28,29.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈卢|r交谈
.fly Telredor >>飞往泰雷多尔
.target Halu
step
#questguide << !tbc
>>返回泰雷多尔
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者安霍尔|r 和|cRXP_FRIENDLY_海尔伦|r 交谈
.turnin 9787 >>交任务: |cRXP_FRIENDLY_蛮沼雕像|r
.goto Zangarmarsh,68.20,49.37
.accept 9801 >>接任务: |cRXP_LOOT_收集材料|r
.turnin 9790 >>交任务: |cRXP_FRIENDLY_透明的虫翼|r
.goto Zangarmarsh,68.81,48.91
.target Anchorite Ahuurn
.target Haalrun
step
#sticky
#label idols1
.goto 1946/530,6045.39990,279.89999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者安霍尔|r交谈
.target Anchorite Ahuurn
.turnin 9787 >>交任务: |cRXP_FRIENDLY_蛮沼雕像|r
step
#questguide << !tbc
.goto 1946/530,6045.39990,279.89999
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者安霍尔|r交谈
.target Anchorite Ahuurn
.accept 9801 >>接任务: |cRXP_LOOT_收集材料|r
step
#requires idols1
.goto 1946/530,6066.80029,328.60001
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_海尔伦|r交谈
.target Haalrun
.turnin 9790 >>交任务: |cRXP_FRIENDLY_透明的虫翼|r
step
#questguide << !tbc
#completewith NagaC
>>击杀|cRXP_ENEMY_沼泽阔步者|r. 击杀后搜刮其掉落的|cRXP_LOOT_触须|r
>>击杀|cRXP_ENEMY_孢子蝠|r. 击杀后搜刮其|cRXP_LOOT_眼睛|r
.complete 9801,2 
.mob +Fen Strider
.complete 9801,1 
.mob +Young Sporebat
.mob +Greater Sporebat
.mob +Sporebat
step
#optional
#completewith Rajis
>>击杀|cRXP_ENEMY_血鳞监工|r 和|cRXP_ENEMY_血鳞召潮者|r . 击败它们后拾取其|cRXP_LOOT_爪子|r
.complete 9728,1 
.mob Bloodscale Overseer
.mob Bloodscale Wavecaller
step
.goto Zangarmarsh,61.97,40.84
.use 24355 >>|cRXP_WARN_使用|r|T136074:0|t[铁藤种子], |cRXP_WARN_目标: |r湖泊控制|r
.complete 9720,3 
step
#label Rajis
.goto Zangarmarsh,65.15,40.91
>>击杀|cRXP_ENEMY_弗亚希王女|r
>>|cRXP_WARN_如有需要, 请为她组队. 若无法组队或选择单刷, 可跳过此步骤|r << tbc/wotlk
>>|cRXP_WARN_尝试将她的法术引导至视线范围内. 远离她施放的|r|T135833:0|t[冰冻之环]|r << tbc/wotlk
.complete 9817,1 
.isOnQuest 9817
.mob Rajis Fyashe
step
#label NagaC
#loop
.line Zangarmarsh,62.09,38.27,63.29,37.85,64.54,40.10,65.71,39.87,66.39,41.25,63.82,43.15,63.34,44.22,63.15,41.53,61.93,40.26,62.09,38.27
.goto Zangarmarsh,62.09,38.27,55,0
.goto Zangarmarsh,63.29,37.85,55,0
.goto Zangarmarsh,64.54,40.10,55,0
.goto Zangarmarsh,65.71,39.87,55,0
.goto Zangarmarsh,66.39,41.25,55,0
.goto Zangarmarsh,63.82,43.15,55,0
.goto Zangarmarsh,63.34,44.22,55,0
.goto Zangarmarsh,63.15,41.53,55,0
.goto Zangarmarsh,61.93,40.26,55,0
.goto Zangarmarsh,62.09,38.27,55,0
>>击杀|cRXP_ENEMY_血鳞监工|r 和|cRXP_ENEMY_血鳞召潮者|r . 击败它们后拾取其|cRXP_LOOT_爪子|r
.complete 9728,1 
.mob Bloodscale Overseer
.mob Bloodscale Wavecaller
step
#questguide << !tbc
#completewith next
.goto Zangarmarsh,68.48,43.46,60,0
.goto Zangarmarsh,72.01,43.27,60,0
.goto Zangarmarsh,74.14,40.66,60,0
.goto Zangarmarsh,74.75,41.17,60,0
.goto Zangarmarsh,74.61,46.52,60,0
.goto Zangarmarsh,75.22,48.26,60,0
.goto Zangarmarsh,73.70,48.35,60,0
.goto Zangarmarsh,73.50,50.21,60,0
.goto Zangarmarsh,76.75,55.29,60,0
.goto Zangarmarsh,73.96,56.23,60,0
.goto Zangarmarsh,71.85,55.12,60,0
.goto Zangarmarsh,68.41,57.39,60,0
.goto Zangarmarsh,69.72,59.22,60,0
>>击杀|cRXP_ENEMY_孢子蝠|r. 击杀后搜刮其|cRXP_LOOT_眼睛|r
>>击杀|cRXP_ENEMY_沼泽阔步者|r. 击杀后搜刮其掉落的|cRXP_LOOT_触须|r
.complete 9801,1 
.mob +Young Sporebat
.mob +Greater Sporebat
.mob +Sporebat
.complete 9801,2 
.unitscan +Fen Strider
step
.goto Zangarmarsh,78.40,62.02
>>返回至塞纳里奥庇护所
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊谢尔·风歌|r交谈
.turnin 9720 >>交任务: |cRXP_FRIENDLY_恢复平衡|r
.turnin 9732 >>交任务: |cRXP_FRIENDLY_返回沼泽|r
.target Ysiel Windsinger
step
.goto Zangarmarsh,79.09,65.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔楼上的|cRXP_FRIENDLY_监护者哈穆特|r交谈
.turnin 9728 >>交任务: |cRXP_FRIENDLY_热情的欢迎|r
.turnin 9817 >>交任务: |cRXP_FRIENDLY_血鳞纳迦的领袖|r
.isQuestComplete 9817
.target Warden Hamoot
step
#optional
.goto Zangarmarsh,79.09,65.27
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔楼上的|cRXP_FRIENDLY_监护者哈穆特|r交谈
.turnin 9728 >>交任务: |cRXP_FRIENDLY_热情的欢迎|r
.target Warden Hamoot
step
#questguide << !tbc
.goto Zangarmarsh,80.66,69.19,60,0
.goto Zangarmarsh,81.79,72.99,60,0
.goto Zangarmarsh,78.58,82.28,60,0
.goto Zangarmarsh,76.14,84.24,60,0
.goto Zangarmarsh,73.71,87.66,60,0
.goto Zangarmarsh,79.51,87.69,60,0
.goto Zangarmarsh,80.66,69.19,60,0
.goto Zangarmarsh,81.79,72.99,60,0
.goto Zangarmarsh,78.58,82.28,60,0
.goto Zangarmarsh,76.14,84.24,60,0
.goto Zangarmarsh,73.71,87.66,60,0
.goto Zangarmarsh,79.51,87.69
>>击杀|cRXP_ENEMY_孢子蝠|r. 击杀后搜刮其|cRXP_LOOT_眼睛|r
>>击杀|cRXP_ENEMY_沼泽阔步者|r. 击杀后搜刮其掉落的|cRXP_LOOT_触须|r
.complete 9801,1 
.mob +Young Sporebat
.mob +Greater Sporebat
.mob +Sporebat
.complete 9801,2 
.unitscan +Fen Strider
step << !tbc !wotlk
.goto 1955/530,5362.10010,-1832.90002
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_憔悴的志愿兵|r交谈
.target Haggard War Veteran
.accept 10210 >>接任务: |cRXP_LOOT_阿达尔|r
step << !tbc !wotlk
.goto 1955/530,5426.70020,-1862.70007
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿达尔|r交谈
.target A'dal
.turnin 10210 >>交任务: |cRXP_FRIENDLY_阿达尔|r
step << !tbc !wotlk
.goto 1955/530,5421.80029,-1859.00000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khadgar's Servant|r交谈
.target Khadgar
.accept 10211 >>接任务: |cRXP_LOOT_圣光之城|r
.timer 462,City of Light RP
step << !tbc !wotlk
.goto Shattrath City,50.36,42.87
>>跟随|cRXP_FRIENDLY_卡德加的仆人|r << wotlk
>>和|cRXP_FRIENDLY_G'eras|r一起前往二楼, 等待角色扮演(RP)结束. 如果在此期间有其他玩家的|cRXP_FRIENDLY_Khadgar's Servant|r出现, 你可以将其设为目标, 它会自动为你完成任务. 如果任务失败, 请放弃当前任务, 重新从|cRXP_FRIENDLY_Khadgar's Servant|r处领取任务, 然后跟随它移动 << tbc
.complete 10211,1 
.target Khadgar's Servant
step << Mage !tbc !wotlk
.goto Shattrath City,58.77,47.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾欧莉娅|r交谈
.train 35715 >>传送点:沙塔斯和传送门:沙塔斯
.target Iorioa
step << !tbc !wotlk
.goto Shattrath City,54.74,44.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khadgar's Servant|r交谈
.turnin 10211 >>交任务: |cRXP_FRIENDLY_圣光之城|r
.target Khadgar
step << !tbc !wotlk
.goto Shattrath City,54.74,44.32
.accept 10551 >>接任务: |cRXP_WARN_为奥尔多效力|r
.turnin 10551>>与|cRXP_FRIENDLY_卡德加|r交谈. Pledge your 接任务: |cRXP_WARN_为奥尔多效力|r
.target Khadgar
step << !tbc !wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khadgar's Servant|r交谈
.goto Shattrath City,54.74,44.32
.accept 10554 >>接任务: |cRXP_LOOT_伊沙娜|r
.target Khadgar
step << !tbc !wotlk
#xprate >1.499
.goto 1955/530,5821.60010,-1732.9
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊沙娜|r交谈
.target Ishanah
.turnin 10554 >>交任务: |cRXP_FRIENDLY_伊沙娜|r
step
#xprate >1.499
.hs >>炉石传送至奥雷柏尔营地
.cooldown item,6948,>0
]])
RXPGuides.RegisterGuide([[
#version 9
#cata
#mop
#wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 64-66 纳格兰
#displayname 64-66 纳格兰 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#defaultfor !wotlk
#version 9
#next 65-67 刀锋山
#xprate <1.5 << tbc/wotlk
step << !tbc !wotlk
.goto 1955/530,5362.10010,-1832.90002
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_憔悴的志愿兵|r交谈
.target Haggard War Veteran
.accept 10210 >>接任务: |cRXP_LOOT_阿达尔|r
step << !tbc !wotlk
.goto 1955/530,5426.70020,-1862.70007
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿达尔|r交谈
.target A'dal
.turnin 10210 >>交任务: |cRXP_FRIENDLY_阿达尔|r
step << !tbc !wotlk
.goto 1955/530,5421.80029,-1859.00000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khadgar's Servant|r交谈
.target Khadgar
.accept 10211 >>接任务: |cRXP_LOOT_圣光之城|r
.timer 462,City of Light RP
step << !tbc !wotlk
.goto Shattrath City,50.36,42.87
>>跟随|cRXP_FRIENDLY_卡德加的仆人|r << wotlk
>>和|cRXP_FRIENDLY_G'eras|r一起前往二楼, 等待角色扮演(RP)结束. 如果在此期间有其他玩家的|cRXP_FRIENDLY_Khadgar's Servant|r出现, 你可以将其设为目标, 它会自动为你完成任务. 如果任务失败, 请放弃当前任务, 重新从|cRXP_FRIENDLY_Khadgar's Servant|r处领取任务, 然后跟随它移动 << tbc
.complete 10211,1 
.target Khadgar's Servant
step << Mage !tbc !wotlk
.goto Shattrath City,58.77,47.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾欧莉娅|r交谈
.train 35715 >>传送点:沙塔斯和传送门:沙塔斯
.target Iorioa
step << !tbc !wotlk
.goto Shattrath City,54.74,44.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khadgar's Servant|r交谈
.turnin 10211 >>交任务: |cRXP_FRIENDLY_圣光之城|r
.target Khadgar
step << !tbc !wotlk
.goto Shattrath City,54.74,44.32
.accept 10551 >>接任务: |cRXP_WARN_为奥尔多效力|r
.turnin 10551>>与|cRXP_FRIENDLY_卡德加|r交谈. Pledge your 接任务: |cRXP_WARN_为奥尔多效力|r
.target Khadgar
step << !tbc !wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khadgar's Servant|r交谈
.goto Shattrath City,54.74,44.32
.accept 10554 >>接任务: |cRXP_LOOT_伊沙娜|r
.target Khadgar
step << Rogue !tbc !wotlk
.goto 1955/530,5357.10010,-1880.09998
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ifram|r交谈
.trainer >>训练你的职业法术
.target Windstalker Ifram
step << Shaman !tbc !wotlk
.goto 1955/530,5367.80029,-1890.09998
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢克纳尔|r交谈
.trainer >>训练你的职业法术
.target Luknar
step << Warlock !tbc !wotlk
.goto 1955/530,5371.10010,-1892.59998
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恶魔召唤者古洛图|r交谈
.trainer >>训练你的职业法术
.target Fel-Caller Guloto
step << Mage !tbc !wotlk
.goto 1955/530,5412.70020,-1792.70007
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉鲁希|r交谈
.trainer >>训练你的职业法术
.target Raluhi
step << Priest !tbc !wotlk
.goto 1955/530,5409.20020,-1789.70007
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔哈|r交谈
.trainer >>训练你的职业法术
.target Salha
step << Paladin !tbc !wotlk
.goto 1955/530,5402.50000,-1796.59998
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧尔多|r交谈
.trainer >>训练你的职业法术
.target Ordo
step << Warrior !tbc !wotlk
.goto 1955/530,5399.89990,-1798.59998
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉图|r交谈
.trainer >>训练你的职业法术
.target Bratu
step << Hunter !tbc !wotlk
.goto 1955/530,5403.10010,-1800.59998
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊尔瓦|r交谈
.trainer >>训练你的职业法术
.target Irva
step << !tbc !wotlk
.goto 1955/530,5821.60010,-1732.9
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊沙娜|r交谈
.target Ishanah
.turnin 10554 >>交任务: |cRXP_FRIENDLY_伊沙娜|r
step
#aldor
.goto Shattrath City,21.62,50.35,30,0
.goto Nagrand,78.23,54.62
.zone Nagrand >>前往: |cRXP_PICK_纳格兰|r
.skill riding,<225,1
step
#scryer
.goto Shattrath City,21.62,50.35,30,0
.goto Nagrand,78.23,54.62
.zone Nagrand >>前往: |cRXP_PICK_纳格兰|r
>>确保避开在该区域游荡的|r奥尔多守备官|r, 如果他们与你交战, 你会被传送出奥尔多高地. 你可以通过将鼠标悬停在他们身上来识别他们
.skill riding,<225,1
.target Aldor Vindicator
step << !tbc
#completewith Wazat
.goto Nagrand,61.6,67.0
.zone Nagrand >>前往: |cRXP_PICK_纳格兰|r
.skill riding,225,1
step
#completewith next
>>击杀|cRXP_ENEMY_野生雷象|r. 击杀后搜刮它们的|cRXP_LOOT_象牙|r
.collect 25463,3,9914,1 
.mob Wild Elekk
step
#label Wazat
.goto Nagrand,61.70,67.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦萨特|r交谈
.accept 10109 >>接任务: |cRXP_LOOT_我想要这些鸟蛋！|r
.target Wazat
step
#optional
.goto Nagrand,55.05,70.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手彬图克|r交谈
.accept 9917 >>接任务: |cRXP_LOOT_是我眼花了？|r
.reputation 978,neutral,0,1
.target Huntress Bintook
step
#optional
.goto Nagrand,62.89,73.28,40,0
.goto Nagrand,62.74,71.49
>>击杀|cRXP_ENEMY_石拳食人魔|r. 击杀后搜刮他们的|cRXP_LOOT_图纸|r
.complete 9917,1 
.mob Boulderfist Hunter
.reputation 978,neutral,0,1
step
#optional
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手彬图克|r交谈
.goto Nagrand,55.05,70.54
.turnin 9917 >>交任务: |cRXP_FRIENDLY_是我眼花了？|r
.accept 9918 >>接任务: |cRXP_LOOT_这是我的地盘！|r
.reputation 978,neutral,0,1
.target Huntress Bintook
step
#optional
.goto Nagrand,62.74,71.48
>>对|cRXP_ENEMY_拉普|r造成伤害, 使其生命值降至30%或以下
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉普|r交谈
.skipgossip
.complete 9918,1 
.target Lump
.reputation 978,neutral,0,1
step
#optional
.goto Nagrand,55.05,70.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手彬图克|r交谈
.turnin 9918 >>交任务: |cRXP_FRIENDLY_这是我的地盘！|r
.target Huntress Bintook
.isQuestComplete 9918
step
.goto 1951/530,7253.600,-2557.800
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手彬图克|r交谈
.target Huntress Bintook
.accept 9917 >>接任务: |cRXP_LOOT_是我眼花了？|r
step
.goto 1951/530,7259.100,-2551.100
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_"猎枪"琼斯|r
.target "Shotgun" Jones
.accept 10113 >>接任务: |cRXP_LOOT_奈辛瓦里狩猎队|r
step
.goto 1951/530,7229.100,-2492.000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素师犹基|r交谈
.target Elementalist Ioki
.accept 9869 >>接任务: |cRXP_LOOT_元素王座|r
step
.goto 1951/530,7273.300,-2567.000
>>点击|cRXP_FRIENDLY_塔拉布告牌|r
.accept 9936 >>接任务: |cRXP_LOOT_通缉：巫婆吉塞尔达|r
.accept 9940 >>接任务: |cRXP_LOOT_通缉：顾问佐尔布|r
step
.goto 1951/530,7286.100,-2613.300
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与先知欧图布交谈|cRXP_FRIENDLY_Otonbu|r
.target Otonbu the Sage
.accept 9874 >>接任务: |cRXP_LOOT_阻止污染|r
step
.goto 1951/530,7287.600,-2623.400
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者Poli'lukluk|r交谈
.target Poli'lukluk the Wiser
.accept 9878 >>接任务: |cRXP_LOOT_解决问题|r
step
#completewith BPlans
.goto Nagrand,54.21,76.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看护者伊塞尔|r交谈
.home >>将你的[炉石]设置为塔拉
.target Caregiver Isel
step
.goto Nagrand,54.17,75.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼顶阳台上的|cRXP_FRIENDLY_菲尔古|r交谈
.fp Telaar >>获取塔拉的飞行点
.target Furgu
step
#optional
#completewith Staghoofs
.use 24504 >>击杀灰尘咆哮者. 搜刮他们掉落的元素气体和呼嚎之风. 点击背包中的[呼嚎之风]
.complete 10109,1 
.collect 24504,1,9861 
.accept 9861 >>接任务: |cRXP_LOOT_呼嚎之风|r
.mob Dust Howler
step
#label BPlans
.goto Nagrand,62.89,73.28,40,0
.goto Nagrand,62.74,71.49
>>击杀|cRXP_ENEMY_石拳食人魔|r. 击杀后搜刮他们的|cRXP_LOOT_图纸|r
.complete 9917,1 
.mob Boulderfist Hunter
step
#completewith Throne1
>>击杀|cRXP_ENEMY_野生雷象|r. 击杀后搜刮它们的|cRXP_LOOT_象牙|r
.collect 25463,3,9914,1 
.mob Wild Elekk
step
#sticky
#hidewindow
#label saved1a
#completewith Safari1
.subzone 3673 >>1
step
#requires saved1a
#completewith Safari1
>>有时|cRXP_ENEMY_Gankly|r可能会出现在萨法里地区. 这是一个罕见的事件
>>击杀|cRXP_ENEMY_Gankly|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉丝蒂·德米萨|r交谈
.accept 9897 >>接任务: |cRXP_LOOT_我得救了！|r
.goto Nagrand,71.42,40.60,0
.unitscan Gankly Rottenfist
.target Kristen Dipswitch
step
#label Safari1
>>前往奈辛瓦里狩猎队营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙多·菲茨·法斯特里德|r和|cRXP_FRIENDLY_哈罗德·兰恩|r和|cRXP_FRIENDLY_赫米特·奈辛瓦里|r交谈
.turnin 10113 >>交任务: |cRXP_FRIENDLY_奈辛瓦里狩猎队|r
.accept 9854 >>接任务: |cRXP_LOOT_狩猎风鹏|r
.goto Nagrand,71.57,40.52,-1
.target +Shado 'Fitz' Farstrider
.accept 9857 >>接任务: |cRXP_LOOT_狩猎塔布羊|r
.goto Nagrand,71.38,40.62,-1
.target +Harold Lane
.accept 9789 >>接任务: |cRXP_LOOT_狩猎裂蹄牛|r
.goto Nagrand,71.52,40.82,-1
.target +Hemet Nesingwary
step
#optional
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈罗德·兰恩|r交谈
.turnin 9897 >>交任务: |cRXP_FRIENDLY_我得救了！|r
.target Harold Lane
.goto Nagrand,71.38,40.62
.isOnQuest 9897
step
#completewith Throne1
.goto Nagrand,70.22,38.37,60,0
.goto Nagrand,68.58,40.18,60,0
.goto Nagrand,62.42,35.46,60,0
>>击杀|cRXP_ENEMY_风鹏|r
.complete 9854,1 
.mob Windroc
.subzoneskip 3614
.subzoneskip 3615
step
#label Throne1
.goto 1951/530,6945.300,-793.900
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与cRXP_FRIENDLY_元素师温塔格|r交谈|
.target Elementalist Untrag
.accept 9818 >>接任务: |cRXP_LOOT_地下的滋扰|r
step
.goto 1951/530,6936.700,-783.600
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素法师洛阿普|r交谈
.target Elementalist Lo'ap
.accept 9800 >>接任务: |cRXP_LOOT_稀有的豆子|r
.accept 9815 >>接任务: |cRXP_LOOT_潜水|r
step
.goto 1951/530,6944.600,-773.100
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素师沙尔瓦克|r交谈
.target Elementalist Sharvak
.turnin 9869 >>交任务: |cRXP_FRIENDLY_元素王座|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素师莫格|r交谈
.turnin 9861 >>交任务: |cRXP_FRIENDLY_呼嚎之风|r
.accept 9862 >>接任务: |cRXP_LOOT_暗血腐蚀者|r
.goto Nagrand,60.50,22.37
.isOnQuest 9861
.target Elementalist Morgh
step
#optional
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素师莫格|r交谈
.accept 9862 >>接任务: |cRXP_LOOT_暗血腐蚀者|r
.goto Nagrand,60.50,22.37
.isQuestTurnedIn 9861
.target Elementalist Morgh
step
#loop
.goto Nagrand,62.19,22.60,50,0
.goto Nagrand,61.99,22.09,50,0
.goto Nagrand,61.28,22.24,50,0
.goto Nagrand,60.88,21.39,50,0
.goto Nagrand,60.38,20.88,50,0
.goto Nagrand,59.87,21.32,50,0
.goto Nagrand,59.58,22.48,50,0
.goto Nagrand,60.08,24.41,50,0
.goto Nagrand,60.57,25.04,50,0
.goto Nagrand,61.15,24.92,50,0
.goto Nagrand,61.72,24.54,50,0
.line Nagrand,62.19,22.60,61.99,22.09,61.28,22.24,60.88,21.39,60.38,20.88,59.87,21.32,59.58,22.48,60.08,24.41,60.57,25.04,61.15,24.92,61.72,24.54,62.19,22.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在元素王座顺时针巡逻的|cRXP_FRIENDLY_戈达乌|r交谈
.turnin 9818 >>交任务: |cRXP_FRIENDLY_地下的滋扰|r
.accept 9819 >>接任务: |cRXP_LOOT_被折磨的地灵|r
.unitscan Gordawg
step
#optional
#completewith Throne2
>>击杀|cRXP_ENEMY_野生雷象|r. 击杀后搜刮它们的|cRXP_LOOT_象牙|r
.collect 25463,3,9914,1 
.mob Wild Elekk
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_被折磨的地灵|r, 通常出现在小山丘附近或山脚处
.complete 9819,1 
.mob Tortured Earth Spirit
step
#loop
.goto Nagrand,62.64,48.31,60,0
.goto Nagrand,62.42,35.46,60,0
.goto Nagrand,68.58,40.18,60,0
.goto Nagrand,70.22,38.37,60,0
.goto Nagrand,62.64,48.31,0
.goto Nagrand,62.42,35.46,0
.goto Nagrand,68.58,40.18,0
.goto Nagrand,70.22,38.37,0
>>击杀|cRXP_ENEMY_风鹏|r
.complete 9854,1 
.mob Windroc
step
#optional
#completewith next
.goto Nagrand,62.42,35.46,60,0
.goto Nagrand,66.64,38.34,60,0
>>击杀|cRXP_ENEMY_塔布雄羊|r和|cRXP_ENEMY_裂蹄牛|r
.complete 9857,1 
.mob +Talbuk Stag
.complete 9789,1 
.mob +Clefthoof
step
#loop
.goto Nagrand,65.00,51.32,60,0
.goto Nagrand,61.94,54.94,60,0
.goto Nagrand,65.00,51.32,0
.goto Nagrand,61.94,54.94,0
>>击杀|cRXP_ENEMY_被折磨的地灵|r
.complete 9819,1 
.mob Tortured Earth Spirit
step
#label Staghoofs
#loop
.line Nagrand,57.61,60.98,59.50,58.79,61.32,62.32,70.43,56.50,65.39,63.76,71.13,62.77,70.44,72.05,66.97,75.29,66.01,67.94,57.61,60.98
.goto Nagrand,57.61,60.98,60,0
.goto Nagrand,59.50,58.79,60,0
.goto Nagrand,61.32,62.32,60,0
.goto Nagrand,70.43,56.50,60,0
.goto Nagrand,65.39,63.76,60,0
.goto Nagrand,71.13,62.77,60,0
.goto Nagrand,70.44,72.05,60,0
.goto Nagrand,66.97,75.29,60,0
.goto Nagrand,66.01,67.94,60,0
.goto Nagrand,57.61,60.98,60,0
>>击杀|cRXP_ENEMY_塔布雄羊|r和|cRXP_ENEMY_裂蹄牛|r
.complete 9857,1 
.mob +Talbuk Stag
.complete 9789,1 
.mob +Clefthoof
step
.goto Nagrand,66.11,62.07,60,0
.goto Nagrand,68.76,63.70,60,0
.goto Nagrand,67.52,65.69,60,0
.goto Nagrand,66.10,72.83,60,0
.goto Nagrand,67.50,74.48,60,0
.goto Nagrand,60.33,63.82,60,0
.goto Nagrand,60.85,61.08,60,0
.goto Nagrand,62.41,59.43,60,0
.goto Nagrand,66.11,62.07,60,0
.goto Nagrand,68.76,63.70,60,0
.goto Nagrand,67.52,65.69,60,0
.goto Nagrand,66.10,72.83,60,0
.goto Nagrand,67.50,74.48,60,0
.goto Nagrand,60.33,63.82,60,0
.goto Nagrand,60.85,61.08,60,0
.goto Nagrand,62.41,59.43
.use 24504 >>击杀灰尘咆哮者. 搜刮他们掉落的元素气体和呼嚎之风. 点击背包中的[呼嚎之风]
.complete 10109,1 
.collect 24504,1,9861 
.accept 9861 >>接任务: |cRXP_LOOT_呼嚎之风|r
.unitscan Dust Howler
step
#sticky
#hidewindow
#label saved2a
#completewith Safari1
.subzone 3673 >>1
step
#requires saved2a
#completewith Safari2
>>有时|cRXP_ENEMY_Gankly|r可能会出现在萨法里地区. 这是一个罕见的事件
>>击杀|cRXP_ENEMY_Gankly|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉丝蒂·德米萨|r交谈
.accept 9897 >>接任务: |cRXP_LOOT_我得救了！|r
.goto Nagrand,71.42,40.60,0
.unitscan Gankly Rottenfist
.target Kristen Dipswitch
step
#label Safari2
>>返回至狩猎场
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙多·菲兹·法斯特里德|r和|cRXP_FRIENDLY_赫米特·奈辛瓦里|r和|cRXP_FRIENDLY_哈罗德·兰恩|r交谈
.turnin 9854 >>交任务: |cRXP_FRIENDLY_狩猎风鹏|r
.accept 9855 >>接任务: |cRXP_LOOT_狩猎风鹏|r
.target +Shado 'Fitz' Farstrider
.goto Nagrand,71.57,40.52
.turnin 9789 >>交任务: |cRXP_FRIENDLY_狩猎裂蹄牛|r
.accept 9850 >>接任务: |cRXP_LOOT_狩猎裂蹄牛|r
.target +Hemet Nesingwary
.goto Nagrand,71.52,40.82
.turnin 9857 >>交任务: |cRXP_FRIENDLY_狩猎塔布羊|r
.accept 9858 >>接任务: |cRXP_LOOT_狩猎塔布羊|r
.target +Harold Lane
.goto Nagrand,71.38,40.62
step
#optional
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈罗德·兰恩|r交谈
.turnin 9897 >>交任务: |cRXP_FRIENDLY_我得救了！|r
.target Harold Lane
.goto Nagrand,71.38,40.62
.isOnQuest 9897
step
#label Throne2
.goto Nagrand,62.19,22.60,50,0
.goto Nagrand,61.99,22.09,50,0
.goto Nagrand,61.28,22.24,50,0
.goto Nagrand,60.88,21.39,50,0
.goto Nagrand,60.38,20.88,50,0
.goto Nagrand,59.87,21.32,50,0
.goto Nagrand,59.58,22.48,50,0
.goto Nagrand,60.08,24.41,50,0
.goto Nagrand,60.57,25.04,50,0
.goto Nagrand,61.15,24.92,50,0
.goto Nagrand,61.72,24.54
.line Nagrand,62.19,22.60,61.99,22.09,61.28,22.24,60.88,21.39,60.38,20.88,59.87,21.32,59.58,22.48,60.08,24.41,60.57,25.04,61.15,24.92,61.72,24.54,62.19,22.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在元素王座顺时针巡逻的|cRXP_FRIENDLY_戈达乌|r交谈
.turnin 9819 >>交任务: |cRXP_FRIENDLY_被折磨的地灵|r
.accept 9821 >>接任务: |cRXP_LOOT_吞食诅咒|r
.unitscan Gordawg
step
#completewith Caracoli
.destroy 24475 >>摧毁: |cRXP_ENEMY_戈达乌的足印|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素师莫格|r交谈
.turnin 9861 >>交任务: |cRXP_FRIENDLY_呼嚎之风|r
.accept 9862 >>接任务: |cRXP_LOOT_暗血腐蚀者|r
.goto Nagrand,60.50,22.37
.isOnQuest 9861
.target Elementalist Morgh
step
#optional
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素师莫格|r交谈
.accept 9862 >>接任务: |cRXP_LOOT_暗血腐蚀者|r
.goto Nagrand,60.50,22.37
.isQuestTurnedIn 9861
.target Elementalist Morgh
step
#optional
#completewith Gordawg3
>>击杀|cRXP_ENEMY_野生雷象|r. 击杀后搜刮它们的|cRXP_LOOT_象牙|r
.collect 25463,3,9914,1 
.mob Wild Elekk
step
#completewith Dung
#optional
>>击杀|cRXP_ENEMY_裂蹄公牛|r和|cRXP_ENEMY_塔布羊食棘者|r
.complete 9850,1,20 
.mob +Clefthoof Bull
.complete 9858,1 
.mob +Talbuk Thorngrazer
step
#completewith eccore
>>拾取地面上的|cRXP_PICK_挖出来的卡拉果|r腐化卡拉果粪便
.complete 9800,1 
step
#label eccore
#loop
.goto Nagrand,56.76,18.16,60,0
.goto Nagrand,55.16,20.27,60,0
.goto Nagrand,51.36,19.50,60,0
.goto Nagrand,48.73,18.92,60,0
.goto Nagrand,56.76,18.16,60,0
.goto Nagrand,55.16,20.27,60,0
.goto Nagrand,51.36,19.50,60,0
.goto Nagrand,48.73,18.92,60,0

.goto Nagrand,56.76,18.16,0
.goto Nagrand,55.16,20.27,0
.goto Nagrand,51.36,19.50,0
.goto Nagrand,48.73,18.92,0
.goto Nagrand,56.76,18.16,0
.goto Nagrand,55.16,20.27,0
.goto Nagrand,51.36,19.50,0
.goto Nagrand,48.73,18.92,0
>>击杀|cRXP_ENEMY_被激怒的碾压者|r. 从他们身上搜刮|cRXP_LOOT_岩核|r
.complete 9821,1 
.mob Enraged Crusher
step
#label Dung
#loop
.line Nagrand,53.23,28.38,53.12,25.86,54.63,23.85,57.92,23.11,57.71,20.88,55.71,20.76,52.57,22.34,50.79,19.94,51.26,24.12,51.50,26.70,50.31,27.35,48.83,27.92,46.77,28.29,47.42,33.33,53.23,28.38
.goto Nagrand,53.23,28.38,60,0
.goto Nagrand,53.12,25.86,60,0
.goto Nagrand,54.63,23.85,60,0
.goto Nagrand,57.92,23.11,60,0
.goto Nagrand,57.71,20.88,60,0
.goto Nagrand,55.71,20.76,60,0
.goto Nagrand,52.57,22.34,60,0
.goto Nagrand,50.79,19.94,60,0
.goto Nagrand,51.26,24.12,60,0
.goto Nagrand,51.50,26.70,60,0
.goto Nagrand,50.31,27.35,60,0
.goto Nagrand,48.83,27.92,60,0
.goto Nagrand,46.77,28.29,60,0
.goto Nagrand,47.42,33.33,60,0
.goto Nagrand,53.23,28.38,60,0
>>拾取地面上的|cRXP_PICK_挖出来的卡拉果|r腐化卡拉果粪便
.complete 9800,1 
step
.goto Nagrand,60.81,22.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素法师洛阿普|r交谈
.turnin 9800 >>交任务: |cRXP_FRIENDLY_稀有的豆子|r
.accept 9804 >>接任务: |cRXP_LOOT_天歌湖的元素|r
.target Elementalist Lo'ap
step
.goto Nagrand,62.19,22.60,50,0
.goto Nagrand,61.99,22.09,50,0
.goto Nagrand,61.28,22.24,50,0
.goto Nagrand,60.88,21.39,50,0
.goto Nagrand,60.38,20.88,50,0
.goto Nagrand,59.87,21.32,50,0
.goto Nagrand,59.58,22.48,50,0
.goto Nagrand,60.08,24.41,50,0
.goto Nagrand,60.57,25.04,50,0
.goto Nagrand,61.15,24.92,50,0
.goto Nagrand,61.72,24.54
.line Nagrand,62.19,22.60,61.99,22.09,61.28,22.24,60.88,21.39,60.38,20.88,59.87,21.32,59.58,22.48,60.08,24.41,60.57,25.04,61.15,24.92,61.72,24.54,62.19,22.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在元素王座顺时针巡逻的|cRXP_FRIENDLY_戈达乌|r交谈
.turnin 9821 >>交任务: |cRXP_FRIENDLY_吞食诅咒|r
.unitscan Gordawg
.isQuestComplete 9821
step
#questguide << !tbc
#label Gordawg3
.goto Nagrand,62.19,22.60,50,0
.goto Nagrand,61.99,22.09,50,0
.goto Nagrand,61.28,22.24,50,0
.goto Nagrand,60.88,21.39,50,0
.goto Nagrand,60.38,20.88,50,0
.goto Nagrand,59.87,21.32,50,0
.goto Nagrand,59.58,22.48,50,0
.goto Nagrand,60.08,24.41,50,0
.goto Nagrand,60.57,25.04,50,0
.goto Nagrand,61.15,24.92,50,0
.goto Nagrand,61.72,24.54
.line Nagrand,62.19,22.60,61.99,22.09,61.28,22.24,60.88,21.39,60.38,20.88,59.87,21.32,59.58,22.48,60.08,24.41,60.57,25.04,61.15,24.92,61.72,24.54,62.19,22.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在元素王座顺时针巡逻的|cRXP_FRIENDLY_戈达乌|r交谈
.accept 9849 >>接任务: |cRXP_LOOT_打碎外壳|r
.unitscan Gordawg
.isQuestTurnedIn 9821
step << !Warlock
#completewith next
.cast 31920 >>使用背包中的|T133999:0|t[纳格兰草莓]
.use 24421
step
.goto Nagrand,61.62,29.65,60,0
.goto Nagrand,60.41,27.38,60,0
.goto Nagrand,59.40,27.55,60,0
.goto Nagrand,54.80,25.90,60,0
.goto Nagrand,61.62,29.65,60,0
.goto Nagrand,60.41,27.38,60,0
.goto Nagrand,59.40,27.55,60,0
.goto Nagrand,54.80,25.90
.use 24421 >>击杀 |cRXP_ENEMY_湖水之魂|r
.complete 9804,1 
.mob Lake Spirit
step
.goto Nagrand,60.81,22.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素法师洛阿普|r交谈
.turnin 9804 >>交任务: |cRXP_FRIENDLY_天歌湖的元素|r
.accept 9805 >>接任务: |cRXP_LOOT_伊森拉图斯的祝福|r
.target Elementalist Lo'ap
step
#optional
#completewith Telaar2
>>击杀|cRXP_ENEMY_野生雷象|r. 击杀后搜刮它们的|cRXP_LOOT_象牙|r
.collect 25463,3,9914,1 
.mob Wild Elekk
step
#optional
#completewith ThorngrazersEnd
>>击杀|cRXP_ENEMY_裂蹄公牛|r
.complete 9850,1 
.mob Clefthoof Bull
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_塔布羊食棘者|r
.complete 9858,1 
.mob Talbuk Thorngrazer
step
.goto Nagrand,47.37,34.95,60,0
.goto Nagrand,46.08,33.41,60,0
.goto Nagrand,42.95,30.75,60,0
.goto Nagrand,41.16,26.99,60,0
.goto Nagrand,40.03,26.17,60,0
.goto Nagrand,38.03,27.55,60,0
.goto Nagrand,36.34,26.96,60,0
.goto Nagrand,35.40,25.60,60,0
.goto Nagrand,34.49,21.76,60,0
.goto Nagrand,33.78,20.12,60,0
.goto Nagrand,40.03,26.17
.line Nagrand,47.37,34.95,46.08,33.41,42.95,30.75,41.16,26.99,40.03,26.17,38.03,27.55,36.34,26.96,35.40,25.60,34.49,21.76,33.78,20.12
.use 24559 >>击杀暗血入侵者. 从他们身上搜刮暗血入侵计划. 在背包中点击物品[暗血入侵计划]
.collect 24559,1,9871 
.accept 9871 >>接任务: |cRXP_LOOT_暗血入侵者|r
.unitscan Murkblood Invader
step
#label ThorngrazersEnd
#loop
.line Nagrand,53.23,28.38,53.12,25.86,54.63,23.85,57.92,23.11,57.71,20.88,55.71,20.76,52.57,22.34,50.79,19.94,51.26,24.12,51.50,26.70,50.31,27.35,48.83,27.92,46.77,28.29,47.42,33.33,53.23,28.38
.goto Nagrand,53.23,28.38,60,0
.goto Nagrand,53.12,25.86,60,0
.goto Nagrand,54.63,23.85,60,0
.goto Nagrand,57.92,23.11,60,0
.goto Nagrand,57.71,20.88,60,0
.goto Nagrand,55.71,20.76,60,0
.goto Nagrand,52.57,22.34,60,0
.goto Nagrand,50.79,19.94,60,0
.goto Nagrand,51.26,24.12,60,0
.goto Nagrand,51.50,26.70,60,0
.goto Nagrand,50.31,27.35,60,0
.goto Nagrand,48.83,27.92,60,0
.goto Nagrand,46.77,28.29,60,0
.goto Nagrand,47.42,33.33,60,0
.goto Nagrand,53.23,28.38,60,0
>>击杀|cRXP_ENEMY_塔布羊食棘者|r
.complete 9858,1 
.mob Talbuk Thorngrazer
step
#loop
.line Nagrand,50.79,27.99,48.31,31.88,47.13,39.34,48.66,40.86,51.65,39.18,50.33,35.67,50.95,31.54,52.50,29.87,50.79,27.99
.goto Nagrand,50.79,27.99,60,0
.goto Nagrand,48.31,31.88,60,0
.goto Nagrand,47.13,39.34,60,0
.goto Nagrand,48.66,40.86,60,0
.goto Nagrand,51.65,39.18,60,0
.goto Nagrand,50.33,35.67,60,0
.goto Nagrand,50.95,31.54,60,0
.goto Nagrand,52.50,29.87,60,0
.goto Nagrand,50.79,27.99,60,0
>>击杀|cRXP_ENEMY_裂蹄公牛|r
.complete 9850,1 
.mob Clefthoof Bull
step
.goto Nagrand,41.18,44.33
>>如果联盟控制着哈兰, 前往哈兰
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kartos|r交谈
*If the Horde or nobody is controlling Halaa, skip this step
.accept 10076 >>接任务: |cRXP_LOOT_沃舒古水晶尘|r
.turnin 10076 >>交任务: |cRXP_FRIENDLY_沃舒古水晶尘|r
.itemcount 26043,20 
.target Chief Researcher Kartos
step
#questguide << !tbc
#optional
#completewith next
>>击杀|cRXP_ENEMY_饥饿的风鹏|r
.complete 9855,1 
.mob Ravenous Windroc
step
#questguide << !tbc
.goto Nagrand,51.82,56.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑底层的|cRXP_FRIENDLY_博学者尼特林|r交谈
.turnin 10251 >>交任务: |cRXP_FRIENDLY_主人的伟大设计？|r
.accept 10252 >>接任务: |cRXP_LOOT_亡者的视界|r
.isQuestTurnedIn 10231
.target Nitrin the Learned
step
#loop
.line Nagrand,49.47,58.46,51.83,61.23,50.08,63.89,49.10,61.11,47.43,60.82,43.08,56.34,43.82,54.76,47.43,60.82,49.47,58.46
.goto Nagrand,49.47,58.46,60,0
.goto Nagrand,51.83,61.23,60,0
.goto Nagrand,50.08,63.89,60,0
.goto Nagrand,49.10,61.11,60,0
.goto Nagrand,47.43,60.82,60,0
.goto Nagrand,43.08,56.34,60,0
.goto Nagrand,43.82,54.76,60,0
.goto Nagrand,47.43,60.82,60,0
.goto Nagrand,49.47,58.46,60,0
>>击杀|cRXP_ENEMY_饥饿的风鹏|r
.complete 9855,1 
.mob Ravenous Windroc
step
.goto Nagrand,29.1,56.9
.use 24559 >>击杀暗血入侵者. 从他们身上搜刮暗血入侵计划. 在背包中点击物品[暗血入侵计划]
.collect 24559,1,9871 
.accept 9871 >>接任务: |cRXP_LOOT_暗血入侵者|r
.unitscan Murkblood Invader
step << !Shaman
.goto Nagrand,51.11,69.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_星界财团招募员|r交谈
.accept 9913 >>接任务: |cRXP_LOOT_星界财团需要你！|r
.target Consortium Recruiter
step << Shaman
#completewith next
.hs >>传送至塔拉尔
.cooldown item,6948,>2
step
#label Telaar2
.goto 1951/530,7231.500,-2489.900
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿雷克隆|r交谈
.target Arechron
.turnin 9871 >>交任务: |cRXP_FRIENDLY_暗血入侵者|r
.accept 9873 >>接任务: |cRXP_LOOT_奥托尔，我的老朋友......|r
step
.goto 1951/530,7255.800,-2556.300
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手彬图克|r交谈
.target Huntress Bintook
.turnin 9917 >>交任务: |cRXP_FRIENDLY_是我眼花了？|r
.accept 9918 >>接任务: |cRXP_LOOT_这是我的地盘！|r
step
.goto Nagrand,62.74,71.48
>>对|cRXP_ENEMY_拉普|r造成伤害, 使其生命值降至30%或以下
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉普|r交谈
.skipgossip
.complete 9918,1 
.target Lump
step
.goto 1951/530,7252.400,-2556.900
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手彬图克|r交谈
.target Huntress Bintook
.turnin 9918 >>交任务: |cRXP_FRIENDLY_这是我的地盘！|r
.accept 9920 >>接任务: |cRXP_LOOT_击碎者姆摩尔|r
step
.goto 1951/530,7278.300,-2618.100
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_击碎者姆摩尔|r交谈
.target Mo'mor the Breaker
.turnin 9920 >>交任务: |cRXP_FRIENDLY_击碎者姆摩尔|r
.accept 9921 >>接任务: |cRXP_LOOT_火刃废墟|r
step
.goto Nagrand,61.68,67.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦萨特|r交谈
.turnin 10109 >>交任务: |cRXP_FRIENDLY_我想要这些鸟蛋！|r
.accept 10111 >>接任务: |cRXP_LOOT_给我鸟蛋！|r
.target Wazat
step
#completewith next
.goto Nagrand,61.82,68.84,30 >>使用瓦萨特旁边的Jump-A-Tron 4000获得Slowfall减缓坠落效果. 骑上坐骑后, 向南跑至悬崖处, 跃向有鸟巢的那棵树
.skill riding,225,1
step
.goto Nagrand,61.33,66.98
>>点击树上鸟巢中的蛋. 拾取蛋后, 将出现一只|cRXP_ENEMY_Windroc Matriach|r
.complete 10111,1 
.cast 3365
.timer 37,Bring Me The Egg! RP
step
>>击杀|cRXP_ENEMY_Windroc Matriach|r
>>将它风筝回塔拉, 让守卫帮你击杀. 记住, 你需要对任意一名守卫造成主要伤害才能获得击杀奖励, 否则你将不得不再次召唤|cRXP_ENEMY_Matriach|r. 击杀后拾取它的|cRXP_LOOT_Talon|r. 这个任务难度较高, 建议组队完成；若无法组队或无法单刷, 可跳过此步骤 <<tbc/wotlk
*|cRXP_WARN_The Matriarch IS slowable|r << tbc/wotlk
.goto Nagrand,61.57,66.52,0
.goto Nagrand,57.09,70.21
.complete 10111,2 
.unitscan Windroc Matriarch
step
.goto Nagrand,61.68,67.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦萨特|r交谈
.turnin 10111 >>交任务: |cRXP_FRIENDLY_给我鸟蛋！|r
.target Wazat
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_野生雷象|r. 击杀后搜刮它们的|cRXP_LOOT_象牙|r
.collect 25463,3,9914,1 
.mob Wild Elekk
step
#completewith CorkiC
>>击杀|cRXP_ENEMY_石拳食人魔|r
.complete 9921,1 

.complete 9921,2 

step
.goto Nagrand,72.53,70.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考尔奇|r交谈
.accept 9923 >>接任务: |cRXP_LOOT_救命啊！|r
.target Corki
step
#loop
.line Nagrand,72.24,70.14,73.43,71.66,74.64,71.55,73.99,70.78,72.45,67.91,72.24,70.14,72.45,67.91,75.82,68.49,75.56,64.67,76.17,62.47,78.16,58.99,76.17,62.47,73.67,62.37,74.25,64.80,75.82,68.49,72.45,67.91
.goto Nagrand,72.24,70.14,50,0
.goto Nagrand,73.43,71.66,50,0
.goto Nagrand,74.64,71.55,50,0
.goto Nagrand,73.99,70.78,50,0
.goto Nagrand,72.45,67.91,50,0
.goto Nagrand,72.24,70.14,50,0
.goto Nagrand,72.45,67.91,50,0
.goto Nagrand,75.82,68.49,50,0
.goto Nagrand,75.56,64.67,50,0
.goto Nagrand,76.17,62.47,50,0
.goto Nagrand,78.16,58.99,50,0
.goto Nagrand,76.17,62.47,50,0
.goto Nagrand,73.67,62.37,50,0
.goto Nagrand,74.25,64.80,50,0
.goto Nagrand,75.82,68.49,50,0
.goto Nagrand,72.45,67.91,50,0
>>击杀|cRXP_ENEMY_Boulderfist 石拳食人魔|r. 击败他们后搜刮|cRXP_LOOT_石拳钥匙|r
.collect 25490,1,9923,1 
.mob Boulderfist Crusher
.mob Boulderfist Mystic
step
#label CorkiC
.goto Nagrand,72.53,70.74
>>点击|cRXP_FRIENDLY_Corki's|r笼子
.complete 9923,1 
.target Corki
step
#loop
.line Nagrand,72.24,70.14,73.43,71.66,74.64,71.55,73.99,70.78,72.45,67.91,72.24,70.14,72.45,67.91,75.82,68.49,75.56,64.67,76.17,62.47,78.16,58.99,76.17,62.47,73.67,62.37,74.25,64.80,75.82,68.49,72.45,67.91
.goto Nagrand,72.24,70.14,50,0
.goto Nagrand,73.43,71.66,50,0
.goto Nagrand,74.64,71.55,50,0
.goto Nagrand,73.99,70.78,50,0
.goto Nagrand,72.45,67.91,50,0
.goto Nagrand,72.24,70.14,50,0
.goto Nagrand,72.45,67.91,50,0
.goto Nagrand,75.82,68.49,50,0
.goto Nagrand,75.56,64.67,50,0
.goto Nagrand,76.17,62.47,50,0
.goto Nagrand,78.16,58.99,50,0
.goto Nagrand,76.17,62.47,50,0
.goto Nagrand,73.67,62.37,50,0
.goto Nagrand,74.25,64.80,50,0
.goto Nagrand,75.82,68.49,50,0
.goto Nagrand,72.45,67.91,50,0
>>击杀|cRXP_ENEMY_石拳食人魔|r
.complete 9921,1 
.mob +Boulderfist Crusher
.complete 9921,2 
.mob +Boulderfist Mystic
step
#optional
#completewith Throne3
>>击杀|cRXP_ENEMY_野生雷象|r. 击杀后搜刮它们的|cRXP_LOOT_象牙|r
.collect 25463,3,9914,1 
.mob Wild Elekk
step
.use 24467 >>在风茅村的棚屋上使用背包中的 |T134813:0|t[活火]
.complete 9805,4 
.goto Nagrand,72.74,54.68
.complete 9805,3 
.goto Nagrand,71.22,53.24
.complete 9805,2 
.goto Nagrand,70.75,51.11
.complete 9805,1 
.goto Nagrand,72.38,50.39
step
#label Saved3
#completewith Safari3
>>有时|cRXP_ENEMY_Gankly|r可能会出现在萨法里地区. 这是一个罕见的事件
>>击杀|cRXP_ENEMY_Gankly|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉丝蒂·德米萨|r交谈
.accept 9897 >>接任务: |cRXP_LOOT_我得救了！|r
.goto Nagrand,71.42,40.60,0
.unitscan Gankly Rottenfist
.target Kristen Dipswitch
step
#requires Saved3
#completewith next
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈罗德·兰恩|r交谈
.turnin 9897 >>交任务: |cRXP_FRIENDLY_我得救了！|r
.goto Nagrand,71.38,40.62
.target Harold Lane
step
#label Safari3
>>返回奈辛瓦里的营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈罗德·兰恩|r和|cRXP_FRIENDLY_赫米特·奈辛瓦里|r和 |cRXP_FRIENDLY_Shado 'Fitz' Farstrider|r交谈
.turnin 9858 >>交任务: |cRXP_FRIENDLY_狩猎塔布羊|r
.accept 9859 >>接任务: |cRXP_LOOT_狩猎塔布羊|r
.target +Harold Lane
.goto Nagrand,71.38,40.62
.turnin 9850 >>交任务: |cRXP_FRIENDLY_狩猎裂蹄牛|r
.accept 9851 >>接任务: |cRXP_LOOT_狩猎裂蹄牛|r
.target +Hemet Nesingwary
.goto Nagrand,71.52,40.82
.turnin 9855 >>交任务: |cRXP_FRIENDLY_狩猎风鹏|r
.accept 9856 >>接任务: |cRXP_LOOT_狩猎风鹏|r
.goto Nagrand,71.57,40.52
.target +Shado 'Fitz' Farstrider
step
#questguide << !tbc
.goto Nagrand,62.19,22.60,50,0
.goto Nagrand,61.99,22.09,50,0
.goto Nagrand,61.28,22.24,50,0
.goto Nagrand,60.88,21.39,50,0
.goto Nagrand,60.38,20.88,50,0
.goto Nagrand,59.87,21.32,50,0
.goto Nagrand,59.58,22.48,50,0
.goto Nagrand,60.08,24.41,50,0
.goto Nagrand,60.57,25.04,50,0
.goto Nagrand,61.15,24.92,50,0
.goto Nagrand,61.72,24.54
.line Nagrand,62.19,22.60,61.99,22.09,61.28,22.24,60.88,21.39,60.38,20.88,59.87,21.32,59.58,22.48,60.08,24.41,60.57,25.04,61.15,24.92,61.72,24.54,62.19,22.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在元素王座顺时针巡逻的|cRXP_FRIENDLY_戈达乌|r交谈
.turnin 9821 >>交任务: |cRXP_FRIENDLY_吞食诅咒|r
.accept 9849 >>接任务: |cRXP_LOOT_打碎外壳|r
.unitscan Gordawg
step << !tbc
.goto Nagrand,62.19,22.60,50,0
.goto Nagrand,61.99,22.09,50,0
.goto Nagrand,61.28,22.24,50,0
.goto Nagrand,60.88,21.39,50,0
.goto Nagrand,60.38,20.88,50,0
.goto Nagrand,59.87,21.32,50,0
.goto Nagrand,59.58,22.48,50,0
.goto Nagrand,60.08,24.41,50,0
.goto Nagrand,60.57,25.04,50,0
.goto Nagrand,61.15,24.92,50,0
.goto Nagrand,61.72,24.54
.line Nagrand,62.19,22.60,61.99,22.09,61.28,22.24,60.88,21.39,60.38,20.88,59.87,21.32,59.58,22.48,60.08,24.41,60.57,25.04,61.15,24.92,61.72,24.54,62.19,22.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在元素王座顺时针巡逻的|cRXP_FRIENDLY_戈达乌|r交谈
.turnin 9821 >>交任务: |cRXP_FRIENDLY_吞食诅咒|r
.unitscan Gordawg
step
#label Throne3
.goto Nagrand,60.81,22.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素法师洛阿普|r交谈
.turnin 9805 >>交任务: |cRXP_FRIENDLY_伊森拉图斯的祝福|r
.accept 9810 >>接任务: |cRXP_LOOT_污染的灵魂|r
.target Elementalist Lo'ap
step
#completewith Telaar3
.hs >>传送至塔拉尔
step
#sticky
#label caravan1
.waypoint Nagrand,53.69,68.70,40,0
.waypoint Nagrand,54.01,69.11,40,0
.waypoint Nagrand,54.33,70.32,40,0
.waypoint Nagrand,54.75,70.41,40,0
.waypoint Nagrand,54.97,70.91,40,0
.waypoint Nagrand,55.30,71.42,40,0
.waypoint Nagrand,55.70,72.60,40,0
.waypoint Nagrand,55.61,73.18,40,0
.waypoint Nagrand,54.71,73.30,40,0
.waypoint Nagrand,54.53,73.66,40,0
.waypoint Nagrand,54.53,72.64,40,0
.waypoint Nagrand,54.30,72.28,40,0
.waypoint Nagrand,53.71,72.24,40,0
.waypoint Nagrand,53.52,71.94,40,0
.waypoint Nagrand,53.82,71.30,40,0
.waypoint Nagrand,53.42,70.82,40,0
.waypoint Nagrand,52.93,70.80,40,0
.waypoint Nagrand,53.16,70.24,40,0
.waypoint Nagrand,53.56,70.43,40,0
.waypoint Nagrand,54.10,69.56,40,0
.waypoint Nagrand,54.03,69.16,40,0
.waypoint Nagrand,53.69,68.70,40,0
.line Nagrand,53.69,68.70,54.03,69.16,54.10,69.56,53.56,70.43,53.16,70.24,52.93,70.80,53.42,70.82,53.82,71.30,53.52,71.94,53.71,72.24,54.30,72.28,54.53,72.64,54.53,73.66,54.71,73.30,55.61,73.18,55.70,72.60,55.30,71.42,54.97,70.91,54.75,70.41,54.33,70.32,54.01,69.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手琪玛|r交谈. 她会在塔拉周围逆时针巡逻
.accept 9956 >>接任务: |cRXP_LOOT_不幸的商队|r
.accept 9982 >>接任务: |cRXP_LOOT_他叫奥图里斯......|r
.unitscan Huntress Kima
.xp <66,1
step
#label kima2
#optional
#requires caravan1
#sticky
.waypoint Nagrand,53.69,68.70,40,0
.waypoint Nagrand,54.01,69.11,40,0
.waypoint Nagrand,54.33,70.32,40,0
.waypoint Nagrand,54.75,70.41,40,0
.waypoint Nagrand,54.97,70.91,40,0
.waypoint Nagrand,55.30,71.42,40,0
.waypoint Nagrand,55.70,72.60,40,0
.waypoint Nagrand,55.61,73.18,40,0
.waypoint Nagrand,54.71,73.30,40,0
.waypoint Nagrand,54.53,73.66,40,0
.waypoint Nagrand,54.53,72.64,40,0
.waypoint Nagrand,54.30,72.28,40,0
.waypoint Nagrand,53.71,72.24,40,0
.waypoint Nagrand,53.52,71.94,40,0
.waypoint Nagrand,53.82,71.30,40,0
.waypoint Nagrand,53.42,70.82,40,0
.waypoint Nagrand,52.93,70.80,40,0
.waypoint Nagrand,53.16,70.24,40,0
.waypoint Nagrand,53.56,70.43,40,0
.waypoint Nagrand,54.10,69.56,40,0
.waypoint Nagrand,54.03,69.16,40,0
.waypoint Nagrand,53.69,68.70,40,0
.line Nagrand,53.69,68.70,54.03,69.16,54.10,69.56,53.56,70.43,53.16,70.24,52.93,70.80,53.42,70.82,53.82,71.30,53.52,71.94,53.71,72.24,54.30,72.28,54.53,72.64,54.53,73.66,54.71,73.30,55.61,73.18,55.70,72.60,55.30,71.42,54.97,70.91,54.75,70.41,54.33,70.32,54.01,69.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手琪玛|r交谈. 她会在塔拉周围逆时针巡逻
.accept 9956 >>接任务: |cRXP_LOOT_不幸的商队|r
.unitscan Huntress Kima
step
#label Telaar3
.goto 1951/530,7278.200,-2618.400
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_击碎者姆摩尔|r交谈
.target Mo'mor the Breaker
.turnin 9921 >>交任务: |cRXP_FRIENDLY_火刃废墟|r
.accept 9922 >>接任务: |cRXP_LOOT_纳格兰的峡谷|r
step
.goto 1951/530,7231.100,-2489.500
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿雷克隆|r交谈
.target Arechron
.turnin 9923 >>交任务: |cRXP_FRIENDLY_救命啊！|r
.accept 9924 >>接任务: |cRXP_LOOT_考尔奇又走丢了！|r
step
#requires kima2
.goto Nagrand,51.11,69.77
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_星界财团招募员|r交谈
.accept 9913 >>接任务: |cRXP_LOOT_星界财团需要你！|r
.target Consortium Recruiter
step
#optional
#completewith Corki2
.goto Nagrand,40.0,30.0,0
.goto Nagrand,50.0,56.0,0
>>击杀|cRXP_ENEMY_石拳战士|r和|cRXP_ENEMY_法师|r
.complete 9922,1 
.mob +Boulderfist Warrior
.complete 9922,2 
.mob +Boulderfist Mage
step
#optional
#completewith next
>>击杀|r石拳战士|r和|r法师|r, 从他们身上掠夺|r裂隙之钥|r
.collect 25509,1,9924,1 
.mob Boulderfist Warrior
.mob Boulderfist Mage
step
#loop
.goto Nagrand,44.87,49.83,60,0
.goto Nagrand,40.15,46.19,60,0
.goto Nagrand,39.99,37.46,60,0
.goto Nagrand,42.11,37.80,60,0
.goto Nagrand,45.28,42.85,60,0
.goto Nagrand,45.28,42.85,0
>>击杀|cRXP_ENEMY_泥泞爪牙|r. 从它们身上搜刮|cRXP_LOOT_核心|r
.complete 9815,1 
.mob Muck Spawn
step
#loop
.goto Nagrand,41.33,32.64,50,0
.goto Nagrand,41.59,34.86,50,0
.goto Nagrand,40.49,33.98,50,0
.goto Nagrand,40.74,31.28,20,0
.goto Nagrand,39.42,30.73,20,0
.goto Nagrand,39.61,28.98,20,0
.goto Nagrand,39.36,27.61,20,0
.goto Nagrand,40.16,29.45,20,0
.goto Nagrand,41.33,32.64,50,0
.goto Nagrand,41.59,34.86,50,0
.goto Nagrand,40.49,33.98,50,0
.goto Nagrand,40.74,31.28,20,0
.goto Nagrand,39.42,30.73,20,0
.goto Nagrand,39.61,28.98,20,0
.goto Nagrand,39.36,27.61,20,0
.goto Nagrand,40.16,29.45,20,0
.goto Nagrand,40.16,29.45,0
>>击杀|r石拳战士|r和|r法师|r, 从他们身上掠夺|r裂隙之钥|r
.collect 25509,1,9924,1 
.mob Boulderfist Warrior
.mob Boulderfist Mage
step
#label Corki2
.goto Nagrand,39.25,27.43
>>点击洞穴内的|cRXP_FRIENDLY_Corki's|r笼子
.complete 9924,1 
.target Corki
step
#loop
.goto Nagrand,41.33,32.64,50,0
.goto Nagrand,41.59,34.86,50,0
.goto Nagrand,40.49,33.98,50,0
.goto Nagrand,40.74,31.28,20,0
.goto Nagrand,39.42,30.73,20,0
.goto Nagrand,39.61,28.98,20,0
.goto Nagrand,39.36,27.61,20,0
.goto Nagrand,40.16,29.45,20,0
.goto Nagrand,41.33,32.64,50,0
.goto Nagrand,41.59,34.86,50,0
.goto Nagrand,40.49,33.98,50,0
.goto Nagrand,40.74,31.28,20,0
.goto Nagrand,39.42,30.73,20,0
.goto Nagrand,39.61,28.98,20,0
.goto Nagrand,39.36,27.61,20,0
.goto Nagrand,40.16,29.45,20,0
.goto Nagrand,40.16,29.45,0
>>击杀|cRXP_ENEMY_石拳战士|r和|cRXP_ENEMY_法师|r
.complete 9922,1 
.mob +Boulderfist Warrior
.complete 9922,2 
.mob +Boulderfist Mage
step
#questguide << !tbc
#optional
#completewith Beaks
.goto Nagrand,35.2,61.2,0
>>击杀|cRXP_ENEMY_老迈的裂蹄牛|r. 击杀后搜刮它们的|cRXP_LOOT_兽脂|r
.complete 10252,3 
.isOnQuest 10252
.mob Aged Clefthoof
step
#questguide << !tbc
#optional
#completewith next
>>击杀|cRXP_ENEMY_大型风鹏|r. 击败它们获取其|cRXP_LOOT_尖喙|r
.complete 10252,2 
.isOnQuest 10252
.mob Greater Windroc
step
#loop
.line Nagrand,32.66,24.25,33.01,20.84,34.16,20.04,35.46,19.31,36.93,20.77,35.87,23.93,33.32,27.93,31.32,30.74,32.95,28.13,32.66,26.83,32.66,24.25
.goto Nagrand,32.66,26.83,60,0
.goto Nagrand,32.95,28.13,60,0
.goto Nagrand,31.32,30.74,60,0
.goto Nagrand,33.32,27.93,60,0
.goto Nagrand,35.87,23.93,60,0
.goto Nagrand,36.93,20.77,60,0
.goto Nagrand,35.46,19.31,60,0
.goto Nagrand,34.16,20.04,60,0
.goto Nagrand,33.01,20.84,60,0
.goto Nagrand,32.66,24.25,60,0
>>击杀|cRXP_ENEMY_裂肠者|r. 搜刮他的|cRXP_LOOT_眼睛|r. 他沿顺时针方向巡逻, 有时位置过高难以拉怪. 移动速度极快
>>这个任务难度较高. 如有需要, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤<< tbc/wotlk
.complete 9856,1 
.unitscan Gutripper
step
#questguide << !tbc
#label Beaks
#loop
.line Nagrand,35.97,29.37,35.71,18.67,32.69,22.30,33.39,26.11,30.88,32.97
.goto Nagrand,35.97,29.37,55,0
.goto Nagrand,35.71,18.67,55,0
.goto Nagrand,32.69,22.30,55,0
.goto Nagrand,33.39,26.11,55,0
.goto Nagrand,30.88,32.97,55,0
>>击杀|cRXP_ENEMY_大型风鹏|r. 击败它们获取其|cRXP_LOOT_尖喙|r
.complete 10252,2 
.isOnQuest 10252
.mob Greater Windroc
step
#optional
#completewith Murkblood
.use 24560 >>在村民尸体上使用背包中的 |T135432:0|t[魔油火炬]
.complete 9874,1 
.target Sunspring Villager
step
#optional
#completewith StayCaptive
.goto Nagrand,33.2,46.6,0
>>击杀|cRXP_ENEMY_Murkblood Putrefiers|r和|cRXP_ENEMY_Scavengers|r和|cRXP_ENEMY_Raiders|r
.complete 9862,1 
.mob +Murkblood Putrifier
.complete 9878,1 
.mob +Murkblood Scavenger
.complete 9878,2 
.mob +Murkblood Raider
step
.goto Nagrand,30.83,42.36
>>击杀|cRXP_ENEMY_暗血酋长奥托尔|r
.complete 9873,1 
.mob Ortor of Murkblood
step
.goto Nagrand,33.19,42.30
>>清除小屋周围的全部敌人, 确保生命值和法力值已满后再与里面的|cRXP_FRIENDLY_库雷尼俘虏|r交谈 << !Rogue !Warrior !DK
>>清除小屋周围的全部怪物, 并确保自身血量已满, 再与里面的|cRXP_FRIENDLY_库雷尼俘虏|r交谈 << Rogue/Warrior/DK
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库雷尼俘虏|r交谈
.accept 9879 >>接任务: |cRXP_LOOT_卡达什图腾|r
.target Kurenai Captive
step
#label StayCaptive
.goto Nagrand,32.37,40.04,50,0
.goto Nagrand,31.57,38.77
>>护送库雷尼俘虏. 在道路岔路口附近准备好应对伏击的技能冷却时间
.complete 9879,1 
.target Kurenai Captive
step
#label Murkblood
>>击杀|cRXP_ENEMY_Murkblood Putrefiers|r和|cRXP_ENEMY_Scavengers|r和|cRXP_ENEMY_Raiders|r
.complete 9862,1 
.mob +Murkblood Putrifier
.goto Nagrand,31.49,46.91,50,0
.goto Nagrand,32.98,46.84,50,0
.goto Nagrand,33.98,47.50,50,0
.goto Nagrand,34.28,45.97,50,0
.goto Nagrand,33.49,43.25,50,0
.goto Nagrand,32.24,43.46
.complete 9878,2 
.mob +Murkblood Raider
.goto Nagrand,31.48,42.47,50,0
.goto Nagrand,31.14,43.33,50,0
.goto Nagrand,32.10,46.26,50,0
.goto Nagrand,32.77,45.08,50,0
.goto Nagrand,33.31,42.50,50,0
.goto Nagrand,32.24,43.46
.complete 9878,1 
.mob +Murkblood Scavenger
.goto Nagrand,32.20,45.33,50,0
.goto Nagrand,33.31,44.25,50,0
.goto Nagrand,32.84,42.59,50,0
.goto Nagrand,33.23,40.93,50,0
.goto Nagrand,31.58,39.66,50,0
.goto Nagrand,30.66,41.29,50,0
.goto Nagrand,31.14,41.52,50,0
.goto Nagrand,32.24,43.46
step
#optional
#completewith Surgers
.goto Nagrand,33.17,48.36,50,0
.use 24560 >>在村民尸体上使用背包中的 |T135432:0|t[魔油火炬]
.complete 9874,1 
.target Sunspring Villager
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_湖水涌动者|r << !Mage
>>击杀|cRXP_ENEMY_湖水涌动者|r. 小心, 他们对冰霜伤害免疫 << Mage
.complete 9810,2 
.mob Lake Surger
step
>>击杀|cRXP_ENEMY_Watoosun的污染精华|r
.complete 9810,1 
.goto Nagrand,33.03,50.86
.mob Watoosun's Polluted Essence
step
#label Surgers
.goto Nagrand,30.98,50.56,60,0
.goto Nagrand,33.23,48.87,60,0
.goto Nagrand,35.17,46.01,60,0
.goto Nagrand,36.91,46.72,60,0
.goto Nagrand,33.26,54.42,60,0
.goto Nagrand,30.98,50.56
>>击杀|cRXP_ENEMY_湖水涌动者|r << !Mage
>>击杀|cRXP_ENEMY_湖水涌动者|r. 小心, 他们对冰霜伤害免疫 << Mage
.complete 9810,2 
.mob Lake Surger
step
.goto Nagrand,33.17,48.36,50,0
.goto Nagrand,34.52,47.21,50,0
.goto Nagrand,34.96,46.15
.use 24560 >>在村民尸体上使用背包中的 |T135432:0|t[魔油火炬]
.complete 9874,1 
.target Sunspring Villager
step
#optional
#completewith next
.line Nagrand,26.34,51.07,25.93,53.93,25.27,51.74,24.45,50.91,23.69,49.61,24.47,49.04,23.93,48.94,24.36,46.98,23.77,44.47,25.33,41.39,25.72,40.82,26.35,39.23,28.22,38.16,28.35,37.22,28.12,35.92,29.35,34.24,30.07,34.90,30.64,35.79,30.65,37.70,28.90,38.17,28.49,39.43,27.84,42.01,27.25,45.30,26.91,46.66,26.65,48.17,26.34,51.07
>>击杀|cRXP_ENEMY_Bach'lor|r. 搜刮他的|cRXP_LOOT_Hoof|r. 他沿逆时针方向巡逻
>>这个任务难度较高. 如有需要, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤<< tbc/wotlk
.complete 9859,1 
.unitscan Bach'lor
step
.goto Nagrand,27.33,43.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手琪玛|r交谈
.turnin 9982 >>交任务: |cRXP_FRIENDLY_他叫奥图里斯......|r
.isOnQuest 9982
.target Altruis the Sufferer
step
#questguide << tbc/wotlk
.goto Nagrand,27.33,43.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与受难者奥图里斯交谈|cRXP_FRIENDLY_Altruis the Sufferer|r
.accept 9991 >>接任务: |cRXP_LOOT_侦查大地|r
.timer 135,Surveying the Land RP
.target Altruis the Sufferer
.xp <66,1
step
#questguide << tbc/wotlk
.goto Nagrand,27.33,43.09
>>等待飞行结束
.turnin 9991 >>交任务: |cRXP_FRIENDLY_侦查大地|r
.accept 9999 >>接任务: |cRXP_WARN_争取时间|r
.target Altruis the Sufferer
.xp <66,1
step
#questguide << tbc/wotlk
#loop
.goto 1951/530,8987.400,-1346.100,60,0
.goto 1951/530,8975.500,-1357.300,60,0
.goto 1951/530,8853.800,-1347.800,60,0
.goto 1951/530,8987.400,-1346.100,0
.goto 1951/530,8975.500,-1357.300,0
.goto 1951/530,8853.800,-1347.800,0
>>击杀|cRXP_ENEMY_Gan'arg Tinkerer|r和|cRXP_ENEMY_Mo'arg Engineer|r和|cRXP_ENEMY_恶魔卫士军团士兵|r
.complete 9999,3 
.mob +Gan'arg Tinkerer
.complete 9999,2 
.mob +Mo'arg Engineer
.complete 9999,1 
.mob +Felguard Legionnaire
.xp <66,1
step
#questguide << tbc/wotlk
.goto 1951/530,8785.601,-1543.900
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与受难者奥图里斯交谈|cRXP_FRIENDLY_Altruis the Sufferer|r
.target Altruis the Sufferer
.turnin 9999 >>交任务: |cRXP_FRIENDLY_争取时间|r
.accept 10001 >>接任务: |cRXP_WARN_主规划师|r
.xp <66,1
step
#questguide << tbc/wotlk
.goto 1951/530,8990.500,-1234.000
>>击杀|cRXP_ENEMY_主规划师|r并掠夺他的|cRXP_LOOT_蓝图|r
.complete 10001,1 
.xp <66,1
.mob Mo'arg Master Planner
step
#questguide << tbc/wotlk
.goto 1951/530,8785.500,-1545.900
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与受难者奥图里斯交谈|cRXP_FRIENDLY_Altruis the Sufferer|r
.target Altruis the Sufferer
.turnin 10001 >>交任务: |cRXP_FRIENDLY_主规划师|r
.xp <66,1
step
#questguide << !tbc
#optional
#completewith Banthar
.goto Nagrand,35.2,61.2,0
>>击杀|cRXP_ENEMY_老迈的裂蹄牛|r. 击杀后搜刮它们的|cRXP_LOOT_兽脂|r
.complete 10252,3 
.isOnQuest 10252
.mob Aged Clefthoof
step
#questguide << !tbc
#optional
#completewith next
.goto Nagrand,24.37,41.81,0
>>击杀一只|cRXP_ENEMY_荆棘谷, 北荆棘谷|r. 击败后搜刮其|cRXP_LOOT_Eyeball|r
.complete 10252,1 
.isOnQuest 10252
.unitscan Mountain Gronn
step
#label Bachlor
#loop
.goto Nagrand,26.34,51.07,60,0
.goto Nagrand,25.93,53.93,60,0
.goto Nagrand,25.27,51.74,60,0
.goto Nagrand,24.45,50.91,60,0
.goto Nagrand,23.69,49.61,60,0
.goto Nagrand,24.47,49.04,60,0
.goto Nagrand,23.93,48.94,60,0
.goto Nagrand,24.36,46.98,60,0
.goto Nagrand,23.77,44.47,60,0
.goto Nagrand,25.33,41.39,60,0
.goto Nagrand,25.72,40.82,60,0
.goto Nagrand,26.35,39.23,60,0
.goto Nagrand,28.22,38.16,60,0
.goto Nagrand,28.35,37.22,60,0
.goto Nagrand,28.12,35.92,60,0
.goto Nagrand,29.35,34.24,60,0
.goto Nagrand,30.07,34.90,60,0
.goto Nagrand,30.64,35.79,60,0
.goto Nagrand,30.65,37.70,60,0
.goto Nagrand,28.90,38.17,60,0
.goto Nagrand,28.49,39.43,60,0
.goto Nagrand,27.84,42.01,60,0
.goto Nagrand,27.25,45.30,60,0
.goto Nagrand,26.91,46.66,60,0
.goto Nagrand,26.65,48.17,60,0
.line Nagrand,26.34,51.07,25.93,53.93,25.27,51.74,24.45,50.91,23.69,49.61,24.47,49.04,23.93,48.94,24.36,46.98,23.77,44.47,25.33,41.39,25.72,40.82,26.35,39.23,28.22,38.16,28.35,37.22,28.12,35.92,29.35,34.24,30.07,34.90,30.64,35.79,30.65,37.70,28.90,38.17,28.49,39.43,27.84,42.01,27.25,45.30,26.91,46.66,26.65,48.17,26.34,51.07
>>击杀|cRXP_ENEMY_Bach'lor|r. 搜刮他的|cRXP_LOOT_Hoof|r. 他沿逆时针方向巡逻
>>这个任务难度较高. 如有需要, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤<<tbc/wotlk
.complete 9859,1 
.unitscan Bach'lor
step
#questguide << !tbc
.goto Nagrand,24.37,41.81
>>击杀一只|cRXP_ENEMY_荆棘谷, 北荆棘谷|r. 击败后搜刮其|cRXP_LOOT_Eyeball|r
.complete 10252,1 
.isOnQuest 10252
.unitscan Mountain Gronn
step
.goto 1951/530,8540.400,-2049.800
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙德雷克|r交谈
.target Shadrek
.accept 9914 >>接任务: |cRXP_LOOT_象牙生意|r
.turnin 9914 >>交任务: |cRXP_FRIENDLY_象牙生意|r
.itemcount 25463,3
step
.goto 1951/530,8562.300,-2085.900
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰赫|r交谈
.target Gezhe
.turnin 9913 >>交任务: |cRXP_FRIENDLY_星界财团需要你！|r
.accept 9882 >>接任务: |cRXP_LOOT_偷盗贼的东西......能算偷么？|r
step
.goto 1951/530,8594.900,-2099.600
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟利德|r交谈
.target Zerid
.accept 9900 >>接任务: |cRXP_LOOT_加瓦克希|r
.accept 9925 >>接任务: |cRXP_LOOT_安全问题|r
step
#optional
#completewith Voidspawns
>>击杀|cRXP_ENEMY_野生雷象|r. 击杀后搜刮它们的|cRXP_LOOT_象牙|r
.collect 25463,3,9914,1 
.unitscan Wild Elekk
step
#optional
#completewith Gava
>>击杀|cRXP_ENEMY_Raiders|r. 搜刮他们的|cRXP_LOOT_Crystals|r. 这些|cRXP_LOOT_Crystals|r也可在地面找到
>>击杀|cRXP_ENEMY_空灵爪牙|r
.complete 9882,1 
.mob +Vir'aani Raider
.complete 9925,1 
.mob +Voidspawn
step
#questguide << !tbc
.goto Nagrand,25.84,73.34,60,0
.goto Nagrand,27.73,74.09,60,0
.goto Nagrand,28.36,78.70,60,0
.goto Nagrand,32.07,81.44,60,0
.goto Nagrand,40.34,84.18
.use 24501 >>使用 |T135242:0|t[戈尔达格的巨石] 对 |cRXP_ENEMY_破碎奔行者|r施放, 召唤出 |cRXP_ENEMY_古洛克的爪牙|r. 击杀这些召唤物. 你可以在移动时使用 |T135242:0|t巨石
.complete 9849,1 
.mob Shattered Rumbler
.mob Minion of Gurok
step
#label Gava
.goto Nagrand,42.39,73.49,50,0
.goto Nagrand,43.65,74.59,50,0
.goto Nagrand,43.47,72.86,50,0
.goto Nagrand,42.45,72.32,50,0
.goto Nagrand,41.53,71.33
>>击杀|cRXP_ENEMY_加瓦克希|r. 他会在小悬崖与稍偏北的水晶之间巡逻
.complete 9900,1 
.unitscan Gava'xi
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_空灵爪牙|r
.complete 9925,1 
.mob Voidspawn
step
#loop
.goto Nagrand,41.61,70.68,50,0
.goto Nagrand,36.88,66.96,50,0
.goto Nagrand,34.53,62.93,60,0
.goto Nagrand,30.53,76.12,60,0
.goto Nagrand,41.61,70.68,0
.goto Nagrand,36.88,66.96,0
.goto Nagrand,34.53,62.93,0
.goto Nagrand,30.53,76.12,0
>>击杀|cRXP_ENEMY_Raiders|r. 搜刮他们的|cRXP_LOOT_Crystals|r. 这些|cRXP_LOOT_Crystals|r也可在地面找到
.complete 9882,1 
.mob Vir'aani Raider
step
#label Voidspawns
#loop
.line Nagrand,30.51,66.79,32.23,69.85,31.75,74.99,36.51,77.38,38.03,79.58,40.19,77.22,37.87,76.04,39.87,72.76,39.35,67.61,41.46,62.82,37.64,66.21,34.90,65.37,32.91,67.36,30.51,66.79
.goto Nagrand,30.51,66.79,60,0
.goto Nagrand,32.23,69.85,60,0
.goto Nagrand,31.75,74.99,60,0
.goto Nagrand,36.51,77.38,60,0
.goto Nagrand,38.03,79.58,60,0
.goto Nagrand,40.19,77.22,60,0
.goto Nagrand,37.87,76.04,60,0
.goto Nagrand,39.87,72.76,60,0
.goto Nagrand,39.35,67.61,60,0
.goto Nagrand,41.46,62.82,60,0
.goto Nagrand,37.64,66.21,60,0
.goto Nagrand,34.90,65.37,60,0
.goto Nagrand,32.91,67.36,60,0
.goto Nagrand,30.51,66.79,60,0
>>击杀|cRXP_ENEMY_空灵爪牙|r
.complete 9925,1 
.mob Voidspawn
step
#optional
#completewith AerisL
>>击杀|cRXP_ENEMY_班塔尔|r. 搜刮他的|cRXP_LOOT_Horn|r. 他会在附近巡逻
>>这个任务难度较高. 如有需要, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤<<tbc/wotlk
.complete 9851,1 
.unitscan Banthar
step
#loop
.line Nagrand,44.13,76.74,35.70,58.91,29.60,61.89,33.11,77.90,44.13,76.74
.goto Nagrand,44.13,76.74,60,0
.goto Nagrand,35.70,58.91,60,0
.goto Nagrand,29.60,61.89,60,0
.goto Nagrand,33.11,77.90,60,0
.goto Nagrand,44.13,76.74,60,0
>>击杀|cRXP_ENEMY_野生雷象|r. 击杀后搜刮它们的|cRXP_LOOT_象牙|r
>>|cRXP_WARN_好斗的雷象不会掉落它们！|r
.collect 25463,3,9914,1 
.unitscan Wild Elekk
step
#label AerisL
.goto 1951/530,8595.000,-2100.100
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟利德|r交谈
.target Zerid
.turnin 9900 >>交任务: |cRXP_FRIENDLY_加瓦克希|r
.turnin 9925 >>交任务: |cRXP_FRIENDLY_安全问题|r
step
.goto 1951/530,8563.800,-2086.600
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰赫|r交谈
.target Gezhe
.turnin 9882 >>交任务: |cRXP_FRIENDLY_偷盗贼的东西......能算偷么？|r
step
.goto Nagrand,31.77,56.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙德雷克|r交谈
.accept 9914 >>接任务: |cRXP_LOOT_象牙生意|r
.turnin 9914 >>交任务: |cRXP_FRIENDLY_象牙生意|r
.target Shadrek
step
#loop
.line Nagrand,30.88,63.61,32.53,61.08,33.99,60.44,36.31,58.76,37.39,58.63,38.67,59.52,40.46,60.74,44.52,61.64,46.20,63.09,46.71,66.40,46.31,67.69,45.46,68.24,43.63,68.35,43.05,67.77,42.75,66.72,42.56,64.36,41.98,62.64,40.82,61.30,38.67,59.52
.goto Nagrand,30.88,63.61,50,0
.goto Nagrand,32.53,61.08,50,0
.goto Nagrand,33.99,60.44,50,0
.goto Nagrand,36.31,58.76,50,0
.goto Nagrand,37.39,58.63,50,0
.goto Nagrand,38.67,59.52,50,0
.goto Nagrand,40.46,60.74,50,0
.goto Nagrand,44.52,61.64,50,0
.goto Nagrand,46.20,63.09,50,0
.goto Nagrand,46.71,66.40,50,0
.goto Nagrand,46.31,67.69,50,0
.goto Nagrand,45.46,68.24,50,0
.goto Nagrand,43.63,68.35,50,0
.goto Nagrand,43.05,67.77,50,0
.goto Nagrand,42.75,66.72,50,0
.goto Nagrand,42.56,64.36,50,0
.goto Nagrand,41.98,62.64,50,0
.goto Nagrand,40.82,61.30,50,0
.goto Nagrand,38.67,59.52,50,0
>>击杀|cRXP_ENEMY_班塔尔|r. 搜刮他的|cRXP_LOOT_Horn|r. 他会在附近巡逻
>>这个任务难度较高. 如有需要, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤<<tbc/wotlk
.complete 9851,1 
.unitscan Banthar
step
#questguide << !tbc
#loop
.line Nagrand,30.88,63.61,32.53,61.08,33.99,60.44,36.31,58.76,37.39,58.63,38.67,59.52,40.46,60.74,44.52,61.64,46.20,63.09,46.71,66.40,46.31,67.69,45.46,68.24,43.63,68.35,43.05,67.77,42.75,66.72,42.56,64.36,41.98,62.64,40.82,61.30,38.67,59.52
.goto Nagrand,30.88,63.61,50,0
.goto Nagrand,32.53,61.08,50,0
.goto Nagrand,33.99,60.44,50,0
.goto Nagrand,36.31,58.76,50,0
.goto Nagrand,37.39,58.63,50,0
.goto Nagrand,38.67,59.52,50,0
.goto Nagrand,40.46,60.74,50,0
.goto Nagrand,44.52,61.64,50,0
.goto Nagrand,46.20,63.09,50,0
.goto Nagrand,46.71,66.40,50,0
.goto Nagrand,46.31,67.69,50,0
.goto Nagrand,45.46,68.24,50,0
.goto Nagrand,43.63,68.35,50,0
.goto Nagrand,43.05,67.77,50,0
.goto Nagrand,42.75,66.72,50,0
.goto Nagrand,42.56,64.36,50,0
.goto Nagrand,41.98,62.64,50,0
.goto Nagrand,40.82,61.30,50,0
.goto Nagrand,38.67,59.52,50,0
>>击杀|cRXP_ENEMY_老迈的裂蹄牛|r. 击杀后搜刮它们的|cRXP_LOOT_兽脂|r
.complete 10252,3 
.isOnQuest 10252
.unitscan Aged Clefthoof
step
#questguide << !tbc
.goto Nagrand,51.82,56.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑底层的|cRXP_FRIENDLY_博学者尼特林|r交谈
.turnin 10252 >>交任务: |cRXP_FRIENDLY_亡者的视界|r
.isQuestComplete 10252
.target Nitrin the Learned
step
#questguide << !tbc
#sticky
#optional
.abandon 10252 >>抛弃亡者的视界
step << Shaman
#completewith next
.hs >>传送至塔拉尔
step
#sticky
#label problem
.goto 1951/530,7286.700,-2622.700
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_智者Poli'lukluk|r交谈
.target Poli'lukluk the Wiser
.turnin 9878 >>交任务: |cRXP_FRIENDLY_解决问题|r
step
.goto 1951/530,7278.000,-2618.700
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与击碎者姆摩尔交谈
.turnin 9922 >>交任务: |cRXP_FRIENDLY_纳格兰的峡谷|r
.accept 10108 >>接任务: |cRXP_LOOT_外交手段|r
.target Mo'mor the Breaker
step
.goto 1951/530,7286.000,-2612.700
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与先知欧图布交谈|cRXP_FRIENDLY_Otonbu|r
.target Otonbu the Sage
.turnin 9874 >>交任务: |cRXP_FRIENDLY_阻止污染|r
step
#requires problem
.goto 1951/530,7270.600,-2568.500
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守卫莫伊布夫·吉尔|r交谈
.target Warden Moi'bff Jill
.accept 10476 >>接任务: |cRXP_LOOT_强悍的敌人|r
.turnin 10476 >>交任务: |cRXP_FRIENDLY_强悍的敌人|r
.itemcount 25433,10 
step
.goto 1951/530,7231.500,-2489.600
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿雷克隆|r交谈
.target Arechron
.turnin 9873 >>交任务: |cRXP_FRIENDLY_奥托尔，我的老朋友......|r
.turnin 9924 >>交任务: |cRXP_FRIENDLY_考尔奇又走丢了！|r
.turnin 9879 >>交任务: |cRXP_FRIENDLY_卡达什图腾|r
.accept 9954 >>接任务: |cRXP_LOOT_考尔奇的赎金|r
step
.goto Nagrand,73.81,62.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰特瑞索·火刃|r交谈
.complete 10108,1 
.skipgossip 18261,1
.target Lantresor of the Blade
step
.goto Nagrand,73.81,62.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰特瑞索·火刃|r交谈
.turnin 10108 >>交任务: |cRXP_FRIENDLY_外交手段|r
.accept 9928 >>接任务: |cRXP_LOOT_欺诈所需的军备|r
.accept 9927 >>接任务: |cRXP_LOOT_无情的计谋|r
.target Lantresor of the Blade
step
#optional
#aldor
#completewith ksf1
>>击杀|cRXP_ENEMY_Kil'sorrow|r兽人. 搜刮他们的|cRXP_LOOT_基尔加丹印记|r, 保留以备后续任务使用
.collect 29425,10,10325,1 
step
#optional
#completewith next
.goto Nagrand,70.51,79.79,0
.use 25552 >>击杀|r|cRXP_ENEMY_兽人|r. 在他们的尸体上使用背包中的|T132484:0|t[战槌食人魔军旗]
>>搜刮地面上的|cRXP_PICK_木箱|r
.complete 9936,2 
.complete 9927,1 
.complete 9928,1 
.mob Kil'sorrow Spellbinder
.mob Kil'sorrow Cultist
.mob Kil'sorrow Deathsworn
.mob Kil'sorrow Invader
.mob Kil'sorrow Ritualist
.mob Kil'sorrow Agent
step
.goto Nagrand,70.98,81.48,30,0
.goto Nagrand,71.16,82.36
>>击杀要塞内的|cRXP_ENEMY_Giselda|r
.complete 9936,1 
.unitscan Giselda the Crone
step
#label ksf1
#loop
.line Nagrand,71.70,80.65,72.14,82.16,71.70,79.25,70.26,79.11,69.46,79.66,68.34,82.79,69.64,81.65,70.83,80.61,71.70,80.65
.goto Nagrand,71.70,80.65,40,0
.goto Nagrand,72.14,82.16,40,0
.goto Nagrand,71.70,79.25,40,0
.goto Nagrand,70.26,79.11,40,0
.goto Nagrand,69.46,79.66,40,0
.goto Nagrand,68.34,82.79,40,0
.goto Nagrand,69.64,81.65,40,0
.goto Nagrand,70.83,80.61,40,0
.goto Nagrand,71.70,80.65,40,0
.goto Nagrand,71.70,80.65,40,0
.goto Nagrand,72.14,82.16,40,0
.goto Nagrand,71.70,79.25,40,0
.goto Nagrand,70.26,79.11,40,0
.goto Nagrand,69.46,79.66,40,0
.goto Nagrand,68.34,82.79,40,0
.goto Nagrand,69.64,81.65,40,0
.goto Nagrand,70.83,80.61,40,0
.goto Nagrand,71.70,80.65,40,0
.goto Nagrand,72.14,82.16,40,0
.goto Nagrand,71.70,79.25,40,0
.goto Nagrand,70.26,79.11,40,0
.goto Nagrand,69.46,79.66,40,0
.goto Nagrand,68.34,82.79,40,0
.goto Nagrand,69.64,81.65,40,0
.goto Nagrand,70.83,80.61,40,0
.use 25552 >>击杀|r|cRXP_ENEMY_兽人|r. 在他们的尸体上使用背包中的|T132484:0|t[战槌食人魔军旗]
>>搜刮地上的木箱
.complete 9936,2 
.complete 9927,1 
.complete 9928,1 
.mob Kil'sorrow Spellbinder
.mob Kil'sorrow Cultist
.mob Kil'sorrow Deathsworn
.mob Kil'sorrow Invader
.mob Kil'sorrow Ritualist
.mob Kil'sorrow Agent
step
#aldor
#loop
.line Nagrand,71.70,80.65,72.14,82.16,71.70,79.25,70.26,79.11,69.46,79.66,68.34,82.79,69.64,81.65,70.83,80.61,71.70,80.65
.goto Nagrand,71.70,80.65,40,0
.goto Nagrand,72.14,82.16,40,0
.goto Nagrand,71.70,79.25,40,0
.goto Nagrand,70.26,79.11,40,0
.goto Nagrand,69.46,79.66,40,0
.goto Nagrand,68.34,82.79,40,0
.goto Nagrand,69.64,81.65,40,0
.goto Nagrand,70.83,80.61,40,0
.goto Nagrand,71.70,80.65,40,0
.goto Nagrand,71.70,80.65,40,0
.goto Nagrand,72.14,82.16,40,0
.goto Nagrand,71.70,79.25,40,0
.goto Nagrand,70.26,79.11,40,0
.goto Nagrand,69.46,79.66,40,0
.goto Nagrand,68.34,82.79,40,0
.goto Nagrand,69.64,81.65,40,0
.goto Nagrand,70.83,80.61,40,0
.goto Nagrand,71.70,80.65,40,0
.goto Nagrand,72.14,82.16,40,0
.goto Nagrand,71.70,79.25,40,0
.goto Nagrand,70.26,79.11,40,0
.goto Nagrand,69.46,79.66,40,0
.goto Nagrand,68.34,82.79,40,0
.goto Nagrand,69.64,81.65,40,0
.goto Nagrand,70.83,80.61,40,0
>>击杀|cRXP_ENEMY_Kil'sorrow|r兽人. 搜刮他们的|cRXP_LOOT_基尔加丹印记|r, 保留以备后续任务使用
.collect 29425,10,10325,1 
.mob Kil'sorrow Spellbinder
.mob Kil'sorrow Cultist
.mob Kil'sorrow Deathsworn
.mob Kil'sorrow Invader
.mob Kil'sorrow Ritualist
.mob Kil'sorrow Agent
step
.goto Nagrand,73.81,62.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰特瑞索·火刃|r交谈
.turnin 9928 >>交任务: |cRXP_FRIENDLY_欺诈所需的军备|r
.turnin 9927 >>交任务: |cRXP_FRIENDLY_无情的计谋|r
.accept 9931 >>接任务: |cRXP_LOOT_以牙还牙|r
.accept 9932 >>接任务: |cRXP_LOOT_尸证|r
.target Lantresor of the Blade
step
#sticky
#hidewindow
#label saved4a
#completewith Safari4
.subzone 3673 >>1
step
#requires saved4a
#label Saved4
#completewith Safari4
>>有时|cRXP_ENEMY_Gankly|r可能会出现在萨法里地区. 这是一个罕见的事件
>>击杀|cRXP_ENEMY_Gankly|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉丝蒂·德米萨|r交谈
.accept 9897 >>接任务: |cRXP_LOOT_我得救了！|r
.goto Nagrand,71.42,40.60,0
.unitscan Gankly Rottenfist
.target Kristen Dipswitch
step
#requires Saved4
#completewith Safari4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈罗德·兰恩|r交谈
.turnin 9897 >>交任务: |cRXP_FRIENDLY_我得救了！|r
.goto Nagrand,71.38,40.62
.target Harold Lane
step
#sticky
#label talbuk3
.goto 1951/530,6350.300,-1455.900
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈罗德·兰恩|r交谈
.target Harold Lane
.turnin 9859 >>交任务: |cRXP_FRIENDLY_狩猎塔布羊|r
.isQuestComplete 9859
step
#sticky
#label windroc3
.goto 1951/530,6342.000,-1451.800
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shado 'Fitz' Farstrider|r交谈
.target Shado 'Fitz' Farstrider
.turnin 9856 >>交任务: |cRXP_FRIENDLY_狩猎风鹏|r
.isQuestComplete 9856
step
.goto 1951/530,6343.300,-1461.000
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫米特·奈辛瓦里|r交谈
.target Hemet Nesingwary
.turnin 9851 >>交任务: |cRXP_FRIENDLY_狩猎裂蹄牛|r
.isQuestComplete 9851
step
#requires windroc3
step
#requires talbuk3
#label Safari4
.goto Nagrand,71.52,40.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫米特·奈辛瓦里|r交谈
.accept 9852 >>接任务: |cRXP_LOOT_终极挑战|r
.isQuestTurnedIn 9856
.isQuestTurnedIn 9859
.isQuestTurnedIn 9851
.target Hemet Nesingwary
step
#optional
#questguide << !tbc
#completewith next
.line Nagrand,62.19,22.60,61.99,22.09,61.28,22.24,60.88,21.39,60.38,20.88,59.87,21.32,59.58,22.48,60.08,24.41,60.57,25.04,61.15,24.92,61.72,24.54,62.19,22.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在元素王座顺时针巡逻的|cRXP_FRIENDLY_戈达乌|r交谈
.turnin 9849 >>交任务: |cRXP_FRIENDLY_打碎外壳|r
.isQuestComplete 9849


.unitscan Gordawg
step
.goto 1951/530,6937.200,-782.800
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素法师洛阿普|r交谈
.target Elementalist Lo'ap
.turnin 9810 >>交任务: |cRXP_FRIENDLY_污染的灵魂|r
.turnin 9815 >>交任务: |cRXP_FRIENDLY_潜水|r
step
.goto 1951/530,6952.800,-782.200
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_元素师莫格|r交谈
.target Elementalist Morgh
.turnin 9862 >>交任务: |cRXP_FRIENDLY_暗血腐蚀者|r
step
#questguide << !tbc
.goto Nagrand,62.19,22.60,50,0
.goto Nagrand,61.99,22.09,50,0
.goto Nagrand,61.28,22.24,50,0
.goto Nagrand,60.88,21.39,50,0
.goto Nagrand,60.38,20.88,50,0
.goto Nagrand,59.87,21.32,50,0
.goto Nagrand,59.58,22.48,50,0
.goto Nagrand,60.08,24.41,50,0
.goto Nagrand,60.57,25.04,50,0
.goto Nagrand,61.15,24.92,50,0
.goto Nagrand,61.72,24.54
.line Nagrand,62.19,22.60,61.99,22.09,61.28,22.24,60.88,21.39,60.38,20.88,59.87,21.32,59.58,22.48,60.08,24.41,60.57,25.04,61.15,24.92,61.72,24.54,62.19,22.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在元素王座顺时针巡逻的|cRXP_FRIENDLY_戈达乌|r交谈
.turnin 9849 >>交任务: |cRXP_FRIENDLY_打碎外壳|r

.unitscan Gordawg
step
#optional
#completewith Zorbo
.use 25555 >>击杀|cRXP_ENEMY_Orcs|r. 使用背包中的 |T132484:0|t[暗影议会军旗] 在他们的尸体上
.complete 9940,2 
.mob +Warmaul Shaman
.complete 9940,3 
.complete 9931,1 
.mob +Warmaul Reaver
step
#completewith next
.goto Nagrand,46.57,24.40
.cast 32408 >>在火葬柴堆处使用背包中的 |T133680:0|t[潮湿的毛毯]. 击杀任何正在被|cRXP_FRIENDLY_破坏者|r攻击的敌对食人魔
.timer 62,Body of Evidence RP
.use 25658 

step
.goto Nagrand,46.57,24.40
>>击杀食人魔直到目标完成
.complete 9932,1 
step
#label Zorbo
.goto Nagrand,46.21,18.79,30,0
.goto Nagrand,46.49,18.18
>>击杀|cRXP_ENEMY_Zorbo|r
.complete 9940,1 
.mob Zorbo the Advisor
step
.goto Nagrand,49.22,21.66,50,0
.goto Nagrand,48.24,23.60,50,0
.goto Nagrand,46.59,24.43,50,0
.goto Nagrand,45.44,22.01,50,0
.goto Nagrand,43.65,21.51,50,0
.goto Nagrand,42.54,22.55
.use 25555 >>击杀|cRXP_ENEMY_Orcs|r. 使用背包中的 |T132484:0|t[暗影议会军旗] 在他们的尸体上
.complete 9940,2 
.mob +Warmaul Shaman
.complete 9940,3 
.complete 9931,1 
.mob +Warmaul Reaver
step
.goto Nagrand,42.77,20.73
>>寻找一支完成“鲜血竞技场”任务线的队伍. 该任务线包含6个精英任务, 能快速获得大量经验值, 并奖励一件可使用到70级的武器. 只有当你的队伍已准备就绪且与你处于相同任务进度时才接受此任务(此任务线自动接受功能已禁用). 如果找不到合适的队伍, 请跳过此步骤
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古尔戈索克|r交谈
.accept 9962,1 >>接任务: |cRXP_WARN_鲜血竞技场：断蹄|r
.target Gurgthock
step
.goto Nagrand,43.66,20.37
>>在血之环中击杀断蹄
.complete 9962,1 
.isOnQuest 9962
.mob Brokentoe
step
.goto Nagrand,42.77,20.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨魔仆从伍迪|r交谈
.turnin 9962 >>交任务: |cRXP_FRIENDLY_鲜血竞技场：断蹄|r
.isQuestComplete 9962
.target Wodin the Troll-Servant
step
.goto Nagrand,42.77,20.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古尔戈索克|r交谈
.accept 9967,1 >>接任务: |cRXP_WARN_鲜血竞技场：蓝色兄弟|r
.isQuestTurnedIn 9962
.target Gurgthock
step
.goto Nagrand,43.66,20.37
>>击杀血色擂台中的|cRXP_ENEMY_Blue Brothers|r
.complete 9967,1 
.isOnQuest 9967
.mob Murkblood Twin
step
.goto Nagrand,42.77,20.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨魔仆从伍迪|r交谈
.turnin 9967 >>交任务: |cRXP_FRIENDLY_鲜血竞技场：蓝色兄弟|r
.isQuestComplete 9967
.target Wodin the Troll-Servant
step
.goto Nagrand,42.77,20.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古尔戈索克|r交谈
.accept 9970,1 >>接任务: |cRXP_WARN_鲜血竞技场：裂石之王洛卡达尔|r
.isQuestTurnedIn 9967
.target Gurgthock
step
.goto Nagrand,43.66,20.37
>>在血之环中击杀裂石之王洛卡达尔
.complete 9970,1 
.isOnQuest 9970
.mob Rokdar the Sundered Lord
step
.goto Nagrand,42.77,20.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨魔仆从伍迪|r交谈
.turnin 9970 >>交任务: |cRXP_FRIENDLY_鲜血竞技场：裂石之王洛卡达尔|r
.isQuestComplete 9970
.target Wodin the Troll-Servant
step
.goto Nagrand,42.77,20.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古尔戈索克|r交谈
.accept 9972,1 >>接任务: |cRXP_WARN_鲜血竞技场：瑟克拉加斯|r
.isQuestTurnedIn 9970
.target Gurgthock
step
.goto Nagrand,43.66,20.37
>>在血之环中击杀|cRXP_ENEMY_Skra'gath|r
.complete 9972,1 
.isOnQuest 9972
.mob Skra'gath
step
.goto Nagrand,42.77,20.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨魔仆从伍迪|r交谈
.turnin 9972 >>交任务: |cRXP_FRIENDLY_鲜血竞技场：瑟克拉加斯|r
.isQuestComplete 9972
.target Wodin the Troll-Servant
step
.goto Nagrand,42.77,20.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古尔戈索克|r交谈
.accept 9973,1 >>接任务: |cRXP_WARN_鲜血竞技场：战槌勇士|r
.isQuestTurnedIn 9972
.target Gurgthock
step
.goto Nagrand,43.66,20.37
>>在血之擂台上击杀|cRXP_ENEMY_战槌勇士|r
.complete 9973,1 
.isOnQuest 9973
.mob Warmaul Champion
step
.goto Nagrand,42.77,20.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨魔仆从伍迪|r交谈
.turnin 9973 >>交任务: |cRXP_FRIENDLY_鲜血竞技场：战槌勇士|r
.isQuestComplete 9973
.target Wodin the Troll-Servant
step
.goto Nagrand,42.77,20.73
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古尔戈索克|r交谈
.accept 9977,1 >>接任务: |cRXP_WARN_鲜血竞技场：终极挑战|r
.isQuestTurnedIn 9973
.target Gurgthock
step
.goto Nagrand,43.43,20.57
>>在血之环中击杀穆戈尔(两次)
.complete 9977,1 
.isOnQuest 9977
.mob Mogor
step
.goto Nagrand,42.77,20.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巨魔仆从伍迪|r交谈
.turnin 9977 >>交任务: |cRXP_FRIENDLY_鲜血竞技场：终极挑战|r
.isQuestComplete 9977
.target Wodin the Troll-Servant
step
#completewith Corki4
.goto Nagrand,26.50,22.70,0
>>在洞穴内及洞穴外的地面上, 搜刮|cRXP_PICK_Supply Crates|r
.complete 9956,1 
step
#completewith SupplyC
>>击杀|cRXP_ENEMY_Ogres|r. 击杀后搜刮他们的|cRXP_LOOT_Warbeads|r
.collect 25433,10,10476,1 
.mob Warmaul Brute
.mob Warmaul Warlock
step
#optional
#completewith next
.goto Nagrand,28.69,30.85,40,0
.goto Nagrand,25.93,28.93,40,0
.goto Nagrand,24.57,24.66,40 >>沿着小路登上山顶
.skill riding,225,1
step
#label Corki4
.goto Nagrand,29.54,26.06
>>进入山顶南部的食人魔洞穴
>>|cRXP_FRIENDLY_考尔奇|r被一名|cRXP_WARN_食人魔精英|r——|cRXP_ENEMY_Bufferlo|r守卫. 你无需击杀|cRXP_ENEMY_Bufferlo|r, 只需与|cRXP_FRIENDLY_考尔奇|r交谈后迅速撤离即可<<tbc/wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考尔奇|r交谈
.turnin 9954 >>交任务: |cRXP_FRIENDLY_考尔奇的赎金|r
.target Corki
step
#questguide << tbc/wotlk
.goto Nagrand,29.54,26.06
>>进入山顶南部的食人魔洞穴
>>|cRXP_FRIENDLY_考尔奇|r被一名|cRXP_WARN_食人魔精英|r——|cRXP_ENEMY_Bufferlo|r守卫. 你无需击杀|cRXP_ENEMY_Bufferlo|r, 只需与|cRXP_FRIENDLY_考尔奇|r交谈后迅速撤离即可<<tbc/wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_考尔奇|r交谈
.accept 9955 >>接任务: |cRXP_LOOT_掠夺者考瓦尔|r
.target Corki
step
#questguide << tbc/wotlk
#completewith next
.flygoto Nagrand,27.55,11.22,45 >>飞到洞穴后方的入口
step
#questguide << tbc/wotlk
.goto Nagrand,25.38,15.31,30,0
.goto Nagrand,26.23,15.61,30,0
.goto Nagrand,25.91,13.72
>>击杀掠夺者考瓦尔. 从他身上搜刮他的钥匙. 此任务难度较高. 如需帮助, 请组队完成. 若无法组队或选择单人挑战, 可跳过此步骤
.collect 25648,1,9955,1 
.mob Cho'war the Pillager
step
#questguide << tbc/wotlk
#label Corki4
.goto Nagrand,29.54,26.06
>>前往山顶南部的食人魔洞穴. 点击|cRXP_FRIENDLY_Corki's|r的笼子
>>|cRXP_FRIENDLY_考尔奇|r被一名|cRXP_WARN_Elite 食人魔|r, |cRXP_ENEMY_Bufferlo|r守卫. 你必须杀死或引开他, 才能打开笼子 << tbc/wotlk
.complete 9955,1 
step
#label SupplyC
#loop
.groundgoto Nagrand,28.96,31.19,60,0
.groundgoto Nagrand,28.09,29.94,60,0
.goto Nagrand,24.71,30.48,50,0
.goto Nagrand,23.63,31.77,30,0
.goto Nagrand,23.14,29.32,50,0
.goto Nagrand,23.43,28.29,50,0
.goto Nagrand,24.67,27.54,50,0
.groundgoto Nagrand,26.42,29.74,40,0
.groundgoto Nagrand,24.60,24.92,40,0
.goto Nagrand,25.64,24.47,30,0
.goto Nagrand,27.24,23.87,30,0
.goto Nagrand,29.21,25.74,30,0
.goto Nagrand,25.81,20.33,50,0
.goto Nagrand,27.64,18.92,50,0
.groundgoto Nagrand,28.96,31.19,60,0
.groundgoto Nagrand,28.09,29.94,60,0
.goto Nagrand,24.71,30.48,50,0
.goto Nagrand,23.63,31.77,30,0
.goto Nagrand,23.14,29.32,50,0
.goto Nagrand,23.43,28.29,50,0
.goto Nagrand,24.67,27.54,50,0
.groundgoto Nagrand,26.42,29.74,40,0
.groundgoto Nagrand,24.60,24.92,40,0
.goto Nagrand,25.64,24.47,30,0
.goto Nagrand,27.24,23.87,30,0
.goto Nagrand,29.21,25.74,30,0
.goto Nagrand,25.81,20.33,50,0
.goto Nagrand,27.64,18.92,0
>>在洞穴内及洞穴外的地面上, 搜刮|cRXP_PICK_Supply Crates|r
.complete 9956,1 
step
#loop
.groundgoto Nagrand,28.96,31.19,60,0
.groundgoto Nagrand,28.09,29.94,60,0
.goto Nagrand,24.71,30.48,50,0
.goto Nagrand,23.63,31.77,30,0
.goto Nagrand,23.14,29.32,50,0
.goto Nagrand,23.43,28.29,50,0
.goto Nagrand,24.67,27.54,50,0
.groundgoto Nagrand,26.42,29.74,40,0
.groundgoto Nagrand,24.60,24.92,40,0
.goto Nagrand,25.64,24.47,30,0
.goto Nagrand,27.24,23.87,30,0
.goto Nagrand,29.21,25.74,30,0
.goto Nagrand,25.81,20.33,50,0
.goto Nagrand,27.64,18.92,50,0
.groundgoto Nagrand,28.96,31.19,60,0
.groundgoto Nagrand,28.09,29.94,60,0
.goto Nagrand,24.71,30.48,50,0
.goto Nagrand,23.63,31.77,30,0
.goto Nagrand,23.14,29.32,50,0
.goto Nagrand,23.43,28.29,50,0
.goto Nagrand,24.67,27.54,50,0
.groundgoto Nagrand,26.42,29.74,40,0
.groundgoto Nagrand,24.60,24.92,40,0
.goto Nagrand,25.64,24.47,30,0
.goto Nagrand,27.24,23.87,30,0
.goto Nagrand,29.21,25.74,30,0
.goto Nagrand,25.81,20.33,50,0
.goto Nagrand,27.64,18.92,0
>>击杀|cRXP_ENEMY_Ogres|r. 击杀后搜刮他们的|cRXP_LOOT_Warbeads|r
.collect 25433,10,10476,1 
.mob Warmaul Brute
.mob Warmaul Warlock
step
#completewith next
.hs >>传送至塔拉尔
step
#sticky
#label HuntKima
.goto Nagrand,53.69,68.70,40,0
.goto Nagrand,54.01,69.11,40,0
.goto Nagrand,54.33,70.32,40,0
.goto Nagrand,54.75,70.41,40,0
.goto Nagrand,54.97,70.91,40,0
.goto Nagrand,55.30,71.42,40,0
.goto Nagrand,55.70,72.60,40,0
.goto Nagrand,55.61,73.18,40,0
.goto Nagrand,54.71,73.30,40,0
.goto Nagrand,54.53,73.66,40,0
.goto Nagrand,54.53,72.64,40,0
.goto Nagrand,54.30,72.28,40,0
.goto Nagrand,53.71,72.24,40,0
.goto Nagrand,53.52,71.94,40,0
.goto Nagrand,53.82,71.30,40,0
.goto Nagrand,53.42,70.82,40,0
.goto Nagrand,52.93,70.80,40,0
.goto Nagrand,53.16,70.24,40,0
.goto Nagrand,53.56,70.43,40,0
.goto Nagrand,54.10,69.56,40,0
.goto Nagrand,54.03,69.16,40,0
.goto Nagrand,53.69,68.70,40,0
.line Nagrand,53.69,68.70,54.03,69.16,54.10,69.56,53.56,70.43,53.16,70.24,52.93,70.80,53.42,70.82,53.82,71.30,53.52,71.94,53.71,72.24,54.30,72.28,54.53,72.64,54.53,73.66,54.71,73.30,55.61,73.18,55.70,72.60,55.30,71.42,54.97,70.91,54.75,70.41,54.33,70.32,54.01,69.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_女猎手琪玛|r交谈. 她会在塔拉周围逆时针巡逻
.turnin 9956 >>交任务: |cRXP_FRIENDLY_不幸的商队|r
.unitscan Huntress Kima
step
.goto 1951/530,7270.600,-2568.500
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守卫莫伊布夫·吉尔|r交谈
.target Warden Moi'bff Jill
.accept 10476 >>接任务: |cRXP_LOOT_强悍的敌人|r
.turnin 10476 >>交任务: |cRXP_FRIENDLY_强悍的敌人|r
.turnin 9936 >>交任务: |cRXP_FRIENDLY_通缉：巫婆吉塞尔达|r
.turnin 9940 >>交任务: |cRXP_FRIENDLY_通缉：顾问佐尔布|r
.accept 9938 >>接任务: |cRXP_LOOT_通缉：饥饿者杜恩|r << !tbc !wotlk
step
#optional << tbc/wotlk
#requires HuntKima
.goto 1951/530,7230.800,-2489.700
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿雷克隆|r交谈
.target Arechron
.turnin 9955 >>交任务: |cRXP_FRIENDLY_掠夺者考瓦尔|r
.isQuestComplete 9955
step
>>击杀|cRXP_ENEMY_塔丝克|r. 击败她后搜刮她的|cRXP_LOOT_心脏|r
>>如果需要, 你可以用风筝把她引回塔拉. 她无法被减速, 但移动速度仅约为110%. 这个任务难度较高, 建议组队完成. 如果找不到队伍或打算单刷, 请跳过此步骤<<tbc/wotlk
.goto Nagrand,44.50,65.24
.complete 9852,1 
.isOnQuest 9852
.mob Tusker
step << !tbc !wotlk
#loop
.goto Nagrand,46.6,61.4,60,0
.goto Nagrand,43.6,75.8,60,0
.goto Nagrand,34.4,78.0,60,0
.goto Nagrand,30.2,62.0,60,0
.goto Nagrand,40,60,90,0
.goto Nagrand,46.6,61.4,0
.goto Nagrand,43.6,75.8,0
.goto Nagrand,34.4,78.0,0
.goto Nagrand,30.2,62.0,0
.goto Nagrand,40,60,0
>>击杀饥饿者杜恩, 他会在沃舒古附近巡逻
.complete 9938,1 
.mob Durn the Hungerer
step << Mage
#completewith next
.zone Shattrath City >>前往: |cRXP_PICK_沙塔斯城|r
.skill riding,<225,1
step
.goto Nagrand,73.81,62.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_兰特瑞索·火刃|r交谈
.turnin 9931 >>交任务: |cRXP_FRIENDLY_以牙还牙|r
.turnin 9932 >>交任务: |cRXP_FRIENDLY_尸证|r
.accept 9933 >>接任务: |cRXP_LOOT_回到塔拉|r
.target Lantresor of the Blade
step
#completewith next
.hs >>传送至塔拉尔
.cooldown item,6948,>2
step << !tbc !wotlk
.goto 1951/530,7270.600,-2569.500
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守卫莫伊布夫·吉尔|r交谈
.target Warden Moi'bff Jill
.turnin 9938 >>交任务: |cRXP_FRIENDLY_通缉：饥饿者杜恩|r
step
.goto Nagrand,55.48,68.70
>>返回塔拉尔
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿雷克隆|r交谈
.turnin 9933 >>交任务: |cRXP_FRIENDLY_回到塔拉|r
.target Arechron
step
#label Saved5
#completewith Safari5
>>有时|cRXP_ENEMY_Gankly|r可能会出现在萨法里地区. 这是一个罕见的事件
>>击杀|cRXP_ENEMY_Gankly|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉丝蒂·德米萨|r交谈
.accept 9897 >>接任务: |cRXP_LOOT_我得救了！|r
.goto Nagrand,71.42,40.60,0
.unitscan Gankly Rottenfist
.target Kristen Dipswitch
step
#requires Saved5
#completewith next
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈罗德·兰恩|r交谈
.turnin 9897 >>交任务: |cRXP_FRIENDLY_我得救了！|r
.goto Nagrand,71.38,40.62
.target Harold Lane
step
#label Safari5
.goto Nagrand,71.52,40.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫米特·奈辛瓦里|r交谈
.turnin 9852 >>交任务: |cRXP_FRIENDLY_终极挑战|r
.isQuestComplete 9852
.target Hemet Nesingwary
step
#aldor
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_圣光护卫者阿德因|r交谈
.goto Shattrath City,30.72,34.63
.accept 10325 >>接任务: |cRXP_LOOT_基尔加丹印记|r
.turnin 10325 >>交任务: |cRXP_FRIENDLY_基尔加丹印记|r
.target Adyen the Lightwarden
.itemcount 29425,10
]])
RXPGuides.RegisterGuide([[
#version 9
#cata
#mop
#wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 65-67 刀锋山
#displayname 65-67 刀锋山 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 9

#next 67-69 虚空风暴 << TBC
#next 67-67 刀锋山任务交还 << !TBC
step << !tbc !wotlk
#xprate >1.59
#optional
.maxlevel 67,endOfTheGuide
step
#completewith next
.goto Shattrath City,64.05,41.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努特拉尔|r交谈
.fly Telredor >>飞往泰雷多尔
.zoneskip Nagrand
.zoneskip Zangarmarsh
.skill riding,300,1
.target Nutral
step
#questguide << !tbc
.goto Zangarmarsh,68.3,49.4
>>返回泰雷多尔
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者安霍尔|r交谈
.turnin 9801 >>交任务: |cRXP_FRIENDLY_收集材料|r
.isQuestComplete 9801
.target Anchorite Ahuurn
step
#optional
#completewith Moonwhisper
.goto Shattrath City,64.05,41.12,-1
.goto Zangarmarsh,67.83,51.46,-1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努特拉尔|r或|cRXP_FRIENDLY_蒙希|r交谈
>>|cRXP_WARN_箭头会指引你前往最近的飞行大师|r
.fly Orebor Harborage >>飞往奥雷柏尔营地
.skill riding,300,1
.target Nutral
.target Munci
step
.goto Zangarmarsh,41.21,28.68
>>前往奥雷柏尔营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪莫斯·丹尼斯|r交谈
.accept 9794 >>接任务: |cRXP_LOOT_禁止拆阅|r
.maxlevel 66,bemend	<< !tbc
.target Timothy Daniels
step
#label Moonwhisper
.goto Blade's Edge Mountains,32.20,91.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与隧道入口外的|cRXP_FRIENDLY_哨兵蔻妮·月语|r交谈
.accept 10927 >>接任务: |cRXP_LOOT_消灭洞穴蛛|r
.maxlevel 66,bemend	<< !tbc
.target Sentinel Moonwhisper
step
.goto Blade's Edge Mountains,34.61,88.05,40,0
.goto Blade's Edge Mountains,35.00,85.60,40,0
.goto Blade's Edge Mountains,36.83,83.44,40,0
.goto Blade's Edge Mountains,37.20,81.01
>>击杀 |cRXP_ENEMY_洞穴蛛|r
>>|cRXP_WARN_你可以在洞穴内骑乘坐骑|r
.complete 10927,1 
.isOnQuest 10927
.mob Cavern Crawler
step
>>前往希尔瓦纳尔
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基亚隆·夜刃|r和|cRXP_FRIENDLY_莉娜·月泉|r和|cRXP_FRIENDLY_通缉告示|r和|cRXP_FRIENDLY_指挥官萨卡斯·天影|r谈话
.turnin 9794 >>交任务: |cRXP_FRIENDLY_禁止拆阅|r
.goto Blade's Edge Mountains,35.97,67.76,30,0
.goto Blade's Edge Mountains,36.61,67.34
.target +Kialon Nightblade
.accept 10455 >>接任务: |cRXP_LOOT_危险的荒野|r
.goto Blade's Edge Mountains,36.21,67.13
.target +Rina Moonspring
.accept 10690 >>接任务: |cRXP_LOOT_兽穴之母|r
.goto Blade's Edge Mountains,36.61,67.29
.accept 10502 >>接任务: |cRXP_LOOT_血槌食人魔|r
.turnin 10927 >>交任务: |cRXP_FRIENDLY_消灭洞穴蛛|r
.goto Blade's Edge Mountains,36.28,66.24
.target +Commander Skyshadow
.maxlevel 66,bemend	<< !tbc
step
#completewith Lashh
.goto Blade's Edge Mountains,35.80,63.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板肖恩妮丝|r交谈
.home >>将你的[炉石]设置为希尔瓦纳
.maxlevel 66,bemend	<< !tbc
.target Innkeeper Shaunessy
step
.goto Blade's Edge Mountains,37.82,61.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_埃莫伦·叶影|r 交谈
.fp Sylvanaar >>获取希尔瓦纳的飞行路径
.maxlevel 66,bemend	<< !tbc
.target Amerun Leafshade
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与内部的|cRXP_FRIENDLY_伯格瑞姆·硬锤|r和|cRXP_FRIENDLY_布隆薇·硬锤|r交谈, 以及外部的|cRXP_FRIENDLY_达兰妮尔|r交谈
.accept 10511 >>接任务: |cRXP_LOOT_奇怪的美酒|r
.goto Blade's Edge Mountains,37.40,64.66
.target +Borgrim Stouthammer
.accept 10510 >>接任务: |cRXP_LOOT_进入德拉诺晶矿|r
.goto Blade's Edge Mountains,37.41,65.05
.target +Bronwyn Stouthammer
.accept 10555 >>接任务: |cRXP_LOOT_诡异的魔法|r
.goto Blade's Edge Mountains,37.07,65.62
.target +Daranelle
.maxlevel 66,bemend	<< !tbc
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_Grovestalker Lynxes|r
.complete 10455,1 
.isOnQuest 10455
.mob Grovestalker Lynx
step
#label Lashh
.goto Blade's Edge Mountains,35.75,73.61,40,0
.goto Blade's Edge Mountains,34.23,75.61,40,0
.goto Blade's Edge Mountains,34.92,78.78,40,0
.goto Blade's Edge Mountains,35.72,75.07,40,0
.goto Blade's Edge Mountains,34.31,77.40
>>击杀|cRXP_ENEMY_Lashh'an|r. 击杀后搜刮他们的|cRXP_LOOT_Feathers|r
.complete 10555,1 
.isOnQuest 10555
.mob Lashh'an Matriarch
.mob Lashh'an Talonite
.mob Lashh'an Windwalker
.mob Lashh'an Windwalker
step
.goto Blade's Edge Mountains,34.31,77.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树平台上的|cRXP_FRIENDLY_Tome|r交谈
.turnin 10555 >>交任务: |cRXP_FRIENDLY_诡异的魔法|r
.accept 10556 >>接任务: |cRXP_LOOT_潦草的字迹|r
.maxlevel 66,bemend	<< !tbc
step << !tbc !wotlk
#xprate >1.59
#optional
.maxlevel 67,endOfTheGuide
step
.goto Blade's Edge Mountains,35.23,77.31
.cast 36904 >>|cRXP_WARN_在召唤圈使用|r|T132926:0|t[一把羽毛]|r
.use 30530
.isOnQuest 10556
step
.goto Blade's Edge Mountains,35.23,77.31,0
.goto Blade's Edge Mountains,36.94,79.00,50,0
.goto Blade's Edge Mountains,38.17,79.10,50,0
.goto Blade's Edge Mountains,37.94,73.50,50,0
.goto Blade's Edge Mountains,39.44,71.43,50,0
.goto Blade's Edge Mountains,41.51,67.91,50,0
.goto Blade's Edge Mountains,39.59,67.21,50,0
.goto Blade's Edge Mountains,37.84,71.74,50,0
.goto Blade's Edge Mountains,35.44,71.09
>>|cRXP_WARN_使用|r|T132926:0|t[一把羽毛]|cRXP_WARN_后, 一只|cRXP_FRIENDLY_小鸟伙伴|r会跟随你|r
>>|cRXP_WARN_请注意, 如果你骑着坐骑跑开, |cRXP_FRIENDLY_Bird|r无法跟上你|r
>>击杀|cRXP_ENEMY_Grovestalker Lynxes|r
.complete 10455,1 
.isOnQuest 10455
.use 30530
.mob Grovestalker Lynx
.target Kaliri Totem
step
>>护送|cRXP_FRIENDLY_Bird|r返回希尔瓦娜
>>|cRXP_WARN_请注意, 如果你骑着坐骑跑开, |cRXP_FRIENDLY_Bird|r无法跟上你|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达兰妮尔|r和|cRXP_FRIENDLY_莉娜·月泉|r交谈
.turnin 10556 >>交任务: |cRXP_FRIENDLY_潦草的字迹|r
.goto Blade's Edge Mountains,37.07,65.62
.target +Daranelle
.turnin 10455 >>交任务: |cRXP_FRIENDLY_危险的荒野|r
.accept 10456 >>接任务: |cRXP_LOOT_徘徊的恶狼|r
.goto Blade's Edge Mountains,36.21,67.13
.target +Rina Moonspring
.use 30530
.target Kaliri Totem
.maxlevel 66,bemend	<< !tbc
step
#optional
#completewith next
.goto Blade's Edge Mountains,41.81,65.64,50,0
.goto Blade's Edge Mountains,48.40,65.00,50 >>穿过桥到达锯齿山脊
.skill riding,225,1
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_Thunderlord Dire Wolves|r. 掠夺它们以获得|cRXP_LOOT_Tails|r
.complete 10456,1 
.isOnQuest 10456
.mob Thunderlord Dire Wolf
step
.goto Blade's Edge Mountains,51.62,74.97
>>击杀|cRXP_ENEMY_雷玛|r
.complete 10690,1 
.isOnQuest 10690
.mob Rema
step
#loop
.line Blade's Edge Mountains,51.93,73.59,51.99,72.57,52.51,71.54,52.53,69.57,55.12,68.14,54.67,65.56,52.94,67.62,51.69,66.58,50.94,65.14,50.61,60.12,49.31,62.79,50.28,67.75,49.33,69.22,50.32,70.41,51.93,73.59
.goto Blade's Edge Mountains,51.93,73.59,50,0
.goto Blade's Edge Mountains,51.99,72.57,50,0
.goto Blade's Edge Mountains,52.51,71.54,50,0
.goto Blade's Edge Mountains,52.53,69.57,50,0
.goto Blade's Edge Mountains,55.12,68.14,50,0
.goto Blade's Edge Mountains,54.67,65.56,50,0
.goto Blade's Edge Mountains,52.94,67.62,50,0
.goto Blade's Edge Mountains,51.69,66.58,50,0
.goto Blade's Edge Mountains,50.94,65.14,50,0
.goto Blade's Edge Mountains,50.61,60.12,50,0
.goto Blade's Edge Mountains,49.31,62.79,50,0
.goto Blade's Edge Mountains,50.28,67.75,50,0
.goto Blade's Edge Mountains,49.33,69.22,50,0
.goto Blade's Edge Mountains,50.32,70.41,50,0
.goto Blade's Edge Mountains,51.93,73.59,50,0
>>击杀|cRXP_ENEMY_Thunderlord Dire Wolves|r. 掠夺它们以获得|cRXP_LOOT_Tails|r
.complete 10456,1 
.isOnQuest 10456
.mob Thunderlord Dire Wolf
step
#optional
#completewith next
.goto Blade's Edge Mountains,56.09,72.09,50,0
.goto Blade's Edge Mountains,56.81,70.12,50,0
.goto Blade's Edge Mountains,57.72,70.31,50 >>沿着小路前往托什雷的基地
.skill riding,225,1
step
.goto Blade's Edge Mountains,61.16,70.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里普·派兹拉姆|r交谈
.fp Toshley's Station >>获取托什雷的基地的飞行路径
.target Rip Pedalslam
step
#completewith SylHS
.hs >>炉石到希尔瓦娜斯
.cooldown item,6948,>2
step
#optional
#completewith next
.goto Blade's Edge Mountains,61.16,70.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里普·派兹拉姆|r交谈
.fly Sylvanaar >>飞往希尔瓦纳
.cooldown item,6948,<0
.target Rip Pedalslam
step
#label SylHS
>>返回希尔瓦纳
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官萨卡斯·天影|r和|cRXP_FRIENDLY_莉娜·月泉|r交谈
.turnin 10690 >>交任务: |cRXP_FRIENDLY_兽穴之母|r
.goto Blade's Edge Mountains,36.28,66.24
.target +Commander Skyshadow
.turnin 10456 >>交任务: |cRXP_FRIENDLY_徘徊的恶狼|r
.accept 10457 >>接任务: |cRXP_LOOT_自我保护|r
.goto Blade's Edge Mountains,36.21,67.13
.target +Rina Moonspring
.maxlevel 66,bemend	<< !tbc
step
#loop
.line Blade's Edge Mountains,36.43,69.86,36.44,71.16,35.95,71.95,37.26,72.60,37.73,73.94,38.27,72.71,38.85,73.59,39.01.71.93,40.24,70.33,39.85,69.00,38.21,69.06,36.43,69.86
.goto Blade's Edge Mountains,36.43,69.86,30,0
.goto Blade's Edge Mountains,36.44,71.16,30,0
.goto Blade's Edge Mountains,35.95,71.95,30,0
.goto Blade's Edge Mountains,37.26,72.60,30,0
.goto Blade's Edge Mountains,37.73,73.94,30,0
.goto Blade's Edge Mountains,38.27,72.71,30,0
.goto Blade's Edge Mountains,38.85,73.59,30,0
.goto Blade's Edge Mountains,70.33,40.24,30,0
.goto Blade's Edge Mountains,69.00,39.85,30,0
.goto Blade's Edge Mountains,69.06,38.21,30,0
.goto Blade's Edge Mountains,69.86,36.43,30,0
>>点击地面上的|cRXP_PICK_活木林树苗|r
.complete 10457,1 
.isOnQuest 10457
step
>>返回希尔瓦纳
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉娜·月泉|r交谈
.turnin 10457 >>交任务: |cRXP_FRIENDLY_自我保护|r
.accept 10506 >>接任务: |cRXP_LOOT_严峻的形势|r
.goto Blade's Edge Mountains,36.21,67.13
.maxlevel 66,bemend	<< !tbc
.target Rina Moonspring
step
#optional
#completewith MineC
>>击杀|cRXP_ENEMY_Bloodmaul 食人魔|r. 击杀|cRXP_ENEMY_Bloodmaul 酿酒师|r, 搜刮他们的|cRXP_LOOT_Bloodmaul 烈酒|r
>>打开 |cRXP_PICK_血槌酒桶|r. 将其击破以获取 |cRXP_LOOT_血槌烈酒|r
.use 30251 >>|cRXP_WARN_使用|r|T133852:0|t[莉娜的削弱粉末], |cRXP_WARN_目标: |r|cRXP_ENEMY_血牙狼|r
.complete 10502,1 
.complete 10511,1 
.complete 10506,1 
.mob +Bloodmaul Dire Wolf
.isOnQuest 10502
.isOnQuest 10506
.isOnQuest 10511
.mob Bloodmaul Skirmisher
.mob Bloodmaul Geomancer
.mob Bloodmaul Lookout
.mob Bloodmaul Brewmaster
.mob Bloodmaul Shaman
.mob Bloodmaul Brute
.mob Bloodmaul Drudger
step
#completewith next
.goto Blade's Edge Mountains,42.48,83.51,40 >>进入矿坑
step
#label MineC
.goto Blade's Edge Mountains,42.38,84.54,30,0
.goto Blade's Edge Mountains,41.15,85.56,30,0
.goto Blade's Edge Mountains,40.59,83.58,30,0
.goto Blade's Edge Mountains,39.73,83.35,30,0
.goto Blade's Edge Mountains,39.45,85.72,30,0
.goto Blade's Edge Mountains,40.09,85.42
>>击杀 |cRXP_ENEMY_血槌苦力|r. 击败他们后搜刮出 |cRXP_LOOT_德莱尼水晶|r
>>|cRXP_WARN_|r |cRXP_LOOT_德莱尼水晶|r|cRXP_WARN_也可在矿井中拾取|r
.complete 10510,1 
.isOnQuest 10510
.mob Bloodmaul Drudger
step
#loop
.line Blade's Edge Mountains,46.38,76.02,47.76,74.83,46.81,79.64,45.90,77.84,44.37,82.35,43.36,81.29,41.88,83.17,42.07,79.05,43.73,77.33,42.78,73.28,46.38,76.02
.goto Blade's Edge Mountains,46.38,76.02,55,0
.goto Blade's Edge Mountains,47.76,74.83,55,0
.goto Blade's Edge Mountains,46.81,79.64,55,0
.goto Blade's Edge Mountains,45.90,77.84,55,0
.goto Blade's Edge Mountains,44.37,82.35,55,0
.goto Blade's Edge Mountains,43.36,81.29,55,0
.goto Blade's Edge Mountains,41.88,83.17,55,0
.goto Blade's Edge Mountains,42.07,79.05,55,0
.goto Blade's Edge Mountains,43.73,77.33,55,0
.goto Blade's Edge Mountains,42.78,73.28,55,0
.goto Blade's Edge Mountains,46.38,76.02,55,0
>>击杀|cRXP_ENEMY_Bloodmaul 食人魔|r. 击杀|cRXP_ENEMY_Bloodmaul 酿酒师|r, 搜刮他们的|cRXP_LOOT_Bloodmaul 烈酒|r
>>打开 |cRXP_PICK_血槌酒桶|r. 将其击破以获取 |cRXP_LOOT_血槌烈酒|r
.use 30251 >>|cRXP_WARN_使用|r|T133852:0|t[莉娜的削弱粉末], |cRXP_WARN_目标: |r|cRXP_ENEMY_血牙狼|r
.complete 10502,1 
.complete 10511,1 
.complete 10506,1 
.mob +Bloodmaul Dire Wolf
.isOnQuest 10502
.isOnQuest 10506
.isOnQuest 10511
.mob Bloodmaul Skirmisher
.mob Bloodmaul Geomancer
.mob Bloodmaul Lookout
.mob Bloodmaul Brewmaster
.mob Bloodmaul Shaman
.mob Bloodmaul Brute
.mob Bloodmaul Drudger
step
#completewith next
.hs >>炉石到希尔瓦娜斯
.cooldown item,6948,>2
step
>>返回希尔瓦纳
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉娜·月泉|r和|cRXP_FRIENDLY_指挥官萨卡斯·天影|r和|cRXP_FRIENDLY_布隆薇·硬锤|r和|cRXP_FRIENDLY_伯格瑞姆·硬锤|r交谈
.turnin 10506 >>交任务: |cRXP_FRIENDLY_严峻的形势|r
.goto Blade's Edge Mountains,36.21,67.13
.target +Rina Moonspring
.turnin 10502 >>交任务: |cRXP_FRIENDLY_血槌食人魔|r
.accept 10504 >>接任务: |cRXP_LOOT_刀塔食人魔|r
.goto Blade's Edge Mountains,36.28,66.24
.target +Commander Skyshadow
.turnin 10510 >>交任务: |cRXP_FRIENDLY_进入德拉诺晶矿|r
.goto Blade's Edge Mountains,37.41,65.05
.target +Bronwyn Stouthammer
.turnin 10511 >>交任务: |cRXP_FRIENDLY_奇怪的美酒|r
.accept 10512 >>接任务: |cRXP_LOOT_灌醉刀塔食人魔|r
.goto Blade's Edge Mountains,37.40,64.66
.target +Borgrim Stouthammer
.maxlevel 66,bemend	<< !tbc
step << !tbc !wotlk
#xprate >1.59
#optional
.maxlevel 67,endOfTheGuide
step
#optional
#completewith BladeDrunk
>>击杀|cRXP_ENEMY_Bladespire 食人魔|r
.complete 10504,1 
.isOnQuest 10504
.mob Bladespire Shaman
.mob Bladespire Cook
.mob Bladespire Champion
.mob Bladespire Sober Defender
.mob Bladespire Brute
step
#optional
.goto Blade's Edge Mountains,44.01,51.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官乌里恩|r交谈
>>|cRXP_WARN_你可以小心地从希尔瓦纳的北侧跳下, 到达她那里|r
.accept 10516 >>接任务: |cRXP_LOOT_守备官的困境|r
.skill riding,225,1
.maxlevel 66,bemend	<< !tbc
.target Vindicator Vuuleen
step
.goto Blade's Edge Mountains,44.01,51.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官乌里恩|r交谈
.accept 10516 >>接任务: |cRXP_LOOT_守备官的困境|r
.skill riding,<225,1
.maxlevel 66,bemend	<< !tbc
.target Vindicator Vuuleen
step
.goto Blade's Edge Mountains,38.77,52.61
>>|cRXP_WARN_杀死门边最近的两个食人魔|r|r
>>|cRXP_WARN_使用|r|T132621:0|t[蛮力破敌桶]|cRXP_WARN_引诱|cRXP_ENEMY_德罗加姆|r远离精英守卫|r
>>击杀 |cRXP_ENEMY_德罗加姆|r. 击败他后搜刮出 |cRXP_LOOT_刀刃|r
.complete 10516,1 
.use 30353
.isOnQuest 10516
.mob Bladespire Shaman
.mob Bladespire Brute
.unitscan Droggam
step
.goto Blade's Edge Mountains,42.46,58.96
>>|cRXP_WARN_杀死门口最近的三个食人魔|r|r
>>|cRXP_WARN_使用|r|T132621:0|t[蛮力桶]|cRXP_WARN_引诱|cRXP_ENEMY_玛戈多格|r远离精英守卫|r
>>击杀|cRXP_ENEMY_玛戈多格|r. 击败他后搜刮出|cRXP_LOOT_盾牌|r
.complete 10516,2 
.use 30353
.isOnQuest 10516
.mob Bladespire Shaman
.mob Bladespire Brute
.unitscan Mugdorg
step
.goto Blade's Edge Mountains,44.01,51.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官乌里恩|r交谈
.turnin 10516 >>交任务: |cRXP_FRIENDLY_守备官的困境|r
.accept 10517 >>接任务: |cRXP_LOOT_高尔迪姆，你完蛋了......|r
.maxlevel 66,bemend	<< !tbc
.target Vindicator Vuuleen
step
.goto Blade's Edge Mountains,39.38,49.06
>>|cRXP_WARN_杀死门口最近的三个食人魔|r|r
>>|cRXP_WARN_使用|r|T132621:0|t[蛮力破敌桶]|cRXP_WARN_引诱|cRXP_ENEMY_Gorr'Dim|r远离精英守卫|r
>>击杀|cRXP_ENEMY_Gorr'Dim|r. 击败他后搜刮出|cRXP_LOOT_Shield|r
.complete 10517,1 
.use 30353
.isOnQuest 10517
.mob Bladespire Shaman
.mob Bladespire Brute
.unitscan Gorr'Dim
step
.goto Blade's Edge Mountains,44.01,51.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官乌里恩|r交谈
.turnin 10517 >>交任务: |cRXP_FRIENDLY_高尔迪姆，你完蛋了......|r
.accept 10518 >>接任务: |cRXP_LOOT_插旗子|r
.maxlevel 66,bemend	<< !tbc
.target Vindicator Vuuleen
step
.goto Blade's Edge Mountains,41.29,46.72
>>击杀|cRXP_ENEMY_刀塔勇士|r, 从他身上搜刮|cRXP_LOOT_标志|r
.complete 10518,1 
.isOnQuest 10518
.mob Bladespire Champion
step
#label BladeDrunk
#loop
.line Blade's Edge Mountains,43.48,46.85,41.40,46.63,39.81,49.22,38.90,52.64,38.44,56.05,38.99,57.99,40.23,58.34,42.32,58.35,42.57,54.37,42.11,52.30,47.50,52.35,49.61,50.17,42.91,48.97,43.48,46.85
.goto Blade's Edge Mountains,43.48,46.85,60,0
.goto Blade's Edge Mountains,41.40,46.63,60,0
.goto Blade's Edge Mountains,39.81,49.22,60,0
.goto Blade's Edge Mountains,38.90,52.64,60,0
.goto Blade's Edge Mountains,38.44,56.05,60,0
.goto Blade's Edge Mountains,38.99,57.99,60,0
.goto Blade's Edge Mountains,40.23,58.34,60,0
.goto Blade's Edge Mountains,42.32,58.35,60,0
.goto Blade's Edge Mountains,42.57,54.37,60,0
.goto Blade's Edge Mountains,42.11,52.30,60,0
.goto Blade's Edge Mountains,47.50,52.35,60,0
.goto Blade's Edge Mountains,49.61,50.17,60,0
.goto Blade's Edge Mountains,42.91,48.97,60,0
.goto Blade's Edge Mountains,43.48,46.85,60,0
>>|cRXP_WARN_使用|r|T132621:0|t[蛮力桶]|cRXP_WARN_near|cRXP_ENEMY_食人魔|r让他们喝醉|r
.complete 10512,1 
.use 30353
.isOnQuest 10512
.mob Bladespire Shaman
.mob Bladespire Cook
.mob Bladespire Champion
.mob Bladespire Sober Defender
.mob Bladespire Brute
step
#loop
.line Blade's Edge Mountains,43.48,46.85,41.40,46.63,39.81,49.22,38.90,52.64,38.44,56.05,38.99,57.99,40.23,58.34,42.32,58.35,42.57,54.37,42.11,52.30,47.50,52.35,49.61,50.17,42.91,48.97,43.48,46.85
.goto Blade's Edge Mountains,43.48,46.85,60,0
.goto Blade's Edge Mountains,41.40,46.63,60,0
.goto Blade's Edge Mountains,39.81,49.22,60,0
.goto Blade's Edge Mountains,38.90,52.64,60,0
.goto Blade's Edge Mountains,38.44,56.05,60,0
.goto Blade's Edge Mountains,38.99,57.99,60,0
.goto Blade's Edge Mountains,40.23,58.34,60,0
.goto Blade's Edge Mountains,42.32,58.35,60,0
.goto Blade's Edge Mountains,42.57,54.37,60,0
.goto Blade's Edge Mountains,42.11,52.30,60,0
.goto Blade's Edge Mountains,47.50,52.35,60,0
.goto Blade's Edge Mountains,49.61,50.17,60,0
.goto Blade's Edge Mountains,42.91,48.97,60,0
.goto Blade's Edge Mountains,43.48,46.85,60,0
>>击杀|cRXP_ENEMY_Bladespire 食人魔|r
.complete 10504,1 
.isOnQuest 10504
.mob Bladespire Shaman
.mob Bladespire Cook
.mob Bladespire Champion
.mob Bladespire Sober Defender
.mob Bladespire Brute
step
.goto Blade's Edge Mountains,46.66,74.82
>>|cRXP_WARN_使用塔顶的|r|T132484:0|t[刀锋堡垒旗帜]|cRXP_WARN_来启动事件. 你将需要应对3波敌人, 每波3只|r
>>|cRXP_WARN_使用斜坡尽头的|r|T132621:0|t[蛮力桶]|cRXP_WARN_将它们拆解, 每次只处理1或2个|cRXP_ENEMY_食人魔|r|r
>>|cRXP_WARN_请注意, |cRXP_ENEMY_Gurn|r会在几秒后进入狂怒状态, 攻击速度提升300%, 持续6秒, 但最后会眩晕他3秒. 如果需要, 可以跳下塔楼进行治疗|r
.complete 10518,2 
.use 30416 
.use 30353
.isOnQuest 10518
.mob Gurn Grubnosh
step
#completewith next
.hs >>炉石到希尔瓦娜斯
.cooldown item,6948,>2
step
>>返回希尔瓦纳
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官萨卡斯·天影|r和|cRXP_FRIENDLY_伯格瑞姆·硬锤|r交谈
.turnin 10504 >>交任务: |cRXP_FRIENDLY_刀塔食人魔|r
.turnin 10518 >>交任务: |cRXP_FRIENDLY_插旗子|r
.accept 10580 >>接任务: |cRXP_LOOT_侏儒都去哪里了？|r
.goto Blade's Edge Mountains,36.28,66.24
.target +Commander Skyshadow
.turnin 10512 >>交任务: |cRXP_FRIENDLY_灌醉刀塔食人魔|r
.goto Blade's Edge Mountains,37.40,64.66
.target +Borgrim Stouthammer
.maxlevel 66,bemend	<< !tbc
step << !tbc !wotlk
#xprate >1.59
#optional
.maxlevel 67,endOfTheGuide
step
#completewith Tally
.goto Blade's Edge Mountains,37.82,61.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_埃莫伦·叶影|r 交谈
.fly Toshley's Station >>飞往托什雷的基地
.skill riding,300,1
.target Amerun Leafshade
step
#completewith TestTally
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在巡逻站台的|cRXP_FRIENDLY_拉沙克·铁墙|r交谈
.accept 10632 >>接任务: |cRXP_LOOT_锋利的牙齿|r
.maxlevel 66,bemend << !tbc
.target Razak Ironsides
step
#label Tally
>>前往托什雷的基地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_测量者尼克维克|r和|cRXP_FRIENDLY_塔利·萨普纳波|r交谈
.accept 10608 >>接任务: |cRXP_LOOT_水晶剥石者的麻烦|r
.goto Blade's Edge Mountains,60.22,68.94
.target +Nickwinkle the Metro-Gnome
.accept 10557 >>接任务: |cRXP_LOOT_试飞：风动电容器|r
.goto Blade's Edge Mountains,60.28,68.39
.target +Tally Zapnabber
.maxlevel 66,bemend << !tbc
step
.goto Blade's Edge Mountains,60.175,68.794
.gossipoption 92114 >>与|cRXP_FRIENDLY_拉雷·萨普纳波|r交谈
.timer 48,Test Flight RP
.skipgossip
.isOnQuest 10557
.target Rally Zapnabber
step
#label TestTally
>>等待RP结束
.complete 10557,1 
.isOnQuest 10557
step
.goto Blade's Edge Mountains,55.11,72.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|R-3D0|r交谈
.turnin 10580 >>交任务: |cRXP_FRIENDLY_侏儒都去哪里了？|r
.accept 10581 >>接任务: |cRXP_LOOT_废话连篇|r
.maxlevel 66,bemend << !tbc
.target R-3D0
step
#completewith next
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在巡逻站台的|cRXP_FRIENDLY_拉沙克·铁墙|r交谈
.accept 10632 >>接任务: |cRXP_LOOT_锋利的牙齿|r
.maxlevel 66,bemend << !tbc
.target Razak Ironsides
step
>>返回托什雷的基地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托什雷|r和|cRXP_FRIENDLY_塔利·萨普纳波|r和|cRXP_FRIENDLY_菲兹特·表针|r交谈
.turnin 10581 >>交任务: |cRXP_FRIENDLY_废话连篇|r
.accept 10584 >>接任务: |cRXP_LOOT_能量转换器|r
.goto Blade's Edge Mountains,60.53,68.97
.target +Toshley
.turnin 10557 >>交任务: |cRXP_FRIENDLY_试飞：风动电容器|r
.accept 10710 >>接任务: |cRXP_LOOT_试飞：晶歌山脉|r
.goto Blade's Edge Mountains,60.28,68.39
.target +Tally Zapnabber
.accept 10609 >>接任务: |cRXP_LOOT_先有龙还是先有蛋？|r
.goto Blade's Edge Mountains,60.98,68.11
.target +Fizit "Doc" Clocktock
.maxlevel 66,bemend << !tbc
step
#completewith ToshStation
.goto Blade's Edge Mountains,60.98,68.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹特·表针|r交谈
.home >>将你的[炉石]设置为托什雷的基地
.target Fizit "Doc" Clocktock
step
.use 30540 >>|cRXP_WARN_Use|r|T134939:0|t[塔利的豁免书]
.collect 30539,1,10710,1 
.isOnQuest 10710
step
#requires ToshleyHS
#loop
.line Blade's Edge Mountains,57.94,60.39,58.24,59.08,58.54,57.48,57.74,57.20,57.51,55.84,58.14,55.17,56.95,55.01,56.45,59.74,57.94,60.39
.goto Blade's Edge Mountains,57.94,60.39,30,0
.goto Blade's Edge Mountains,58.24,59.08,30,0
.goto Blade's Edge Mountains,58.54,57.48,30,0
.goto Blade's Edge Mountains,57.74,57.20,30,0
.goto Blade's Edge Mountains,57.51,55.84,30,0
.goto Blade's Edge Mountains,58.14,55.17,30,0
.goto Blade's Edge Mountains,56.95,55.01,30,0
.goto Blade's Edge Mountains,56.45,59.74,30,0
.goto Blade's Edge Mountains,57.94,60.39,30,0
.use 30656 >>|cRXP_WARN_点击|r|cRXP_WARN_能量转化器|r |cRXP_WARN_以召唤|r |cRXP_ENEMY_电荷元素|r|r
>>|cRXP_WARN_使用|r|T132488:0|t[电磁收集器] |cRXP_WARN_作用于|r|cRXP_ENEMY_电荷元素|r, 使其变为|r|cRXP_ENEMY_被捕获的电荷元素|r|r
>>击杀被捕获的电荷元素
.complete 10584,1 
.isOnQuest 10584
.mob Electromental
.mob Encased Electromental
step
#optional
#completewith next
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在巡逻站台的|cRXP_FRIENDLY_拉沙克·铁墙|r交谈
.accept 10632 >>接任务: |cRXP_LOOT_锋利的牙齿|r
.maxlevel 66,bemend << !tbc
.target Razak Ironsides
step
#label ToshStation
>>返回托什雷的基地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托什雷|r和|cRXP_FRIENDLY_晕乎乎的迪娜|r交谈
.turnin 10584 >>交任务: |cRXP_FRIENDLY_能量转换器|r
.goto Blade's Edge Mountains,60.53,68.97
.target +Toshley
.accept 10620 >>接任务: |cRXP_LOOT_山脊上的危险|r
.goto Blade's Edge Mountains,60.40,68.75
.target +Dizzy Dina
.maxlevel 66,bemend << !tbc
step
#loop
.goto Blade's Edge Mountains,59.99,69.32,30,0
.goto Blade's Edge Mountains,60.28,68.98,30,0
.goto Blade's Edge Mountains,60.11,68.37,30,0
.goto Blade's Edge Mountains,59.81,68.29,30,0
.goto Blade's Edge Mountains,60.03,67.79,30,0
.goto Blade's Edge Mountains,60.31,68.23,30,0
.goto Blade's Edge Mountains,60.42,67.91,30,0
.goto Blade's Edge Mountains,60.54,68.76,30,0
.goto Blade's Edge Mountains,60.44,69.37,30,0
.line Blade's Edge Mountains,59.99,69.32,60.28,68.98,60.11,68.37,59.81,68.29,60.03,67.79,60.31,68.23,60.42,67.91,60.54,68.76,60.44,69.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在巡逻站台的|cRXP_FRIENDLY_拉沙克·铁墙|r交谈
.accept 10632 >>接任务: |cRXP_LOOT_锋利的牙齿|r
.unitscan Razak Ironsides
.maxlevel 66,bemend << !tbc
step
#completewith next
.goto Blade's Edge Mountains,60.175,68.794
.gossip 21461,1 >>与|cRXP_FRIENDLY_拉雷·萨普纳波|r交谈
.timer 30,Test Flight RP
.isOnQuest 10710
step
>>等待RP结束
.goto Blade's Edge Mountains,60.175,68.794
.complete 10710,1 
.skipgossip 21461,1
.isOnQuest 10710
.target Rally Zapnabber
step
.goto Blade's Edge Mountains,67.71,72.74,50,0
.goto Blade's Edge Mountains,68.61,70.81,50,0
.goto Blade's Edge Mountains,69.40,66.26,50,0
.goto Blade's Edge Mountains,68.47,64.72,50,0
.goto Blade's Edge Mountains,66.98,63.63,50,0
.goto Blade's Edge Mountains,67.05,58.87,50,0
.goto Blade's Edge Mountains,67.90,49.98,50,0
.goto Blade's Edge Mountains,64.44,51.45,50,0
.goto Blade's Edge Mountains,62.32,52.92,50,0
.goto Blade's Edge Mountains,65.52,55.81
>>击杀|cRXP_ENEMY_山脊捕猎者|r. |cRXP_WARN_他们处于潜行状态, 请注意潜行音效|r
>>击杀|cRXP_ENEMY_Daggermaws|r. 击败它们后搜刮其|cRXP_LOOT_Teeth|r
.complete 10632,1 
.mob +Daggermaw Lashtail
.complete 10620,1 
.mob +Ridgespine Stalker
.isOnQuest 10620
.isOnQuest 10632
step
#completewith next
.hs >>传送至托什雷的基地
.cooldown item,6948,>2
step
#optional
#completewith next
>>点击|cRXP_PICK_虚空龙卵|r以召唤出|cRXP_ENEMY_虚空龙崽|r
>>|cRXP_WARN_使用|r|T133869:0|t[时间定相调节器] |cRXP_WARN_对生成的 |cRXP_ENEMY_虚空龙崽|r进行转化, 使其变为|r|cRXP_ENEMY_虚空幼龙|r
>>|cRXP_WARN_你可以对同一个|cRXP_ENEMY_虚空幼龙|r多次使用|r|T133869:0|t[时间定相调节器]|cRXP_WARN_, 以将其转换为其他类型|r
.complete 10609,1 
.mob +Proto-Nether Drake
.complete 10609,2 
.mob +Adolescent Nether Drake
.complete 10609,3 
.mob +Mature Nether Drake
.use 30742
.isOnQuest 10609
step
#loop
.line Blade's Edge Mountains,67.28,75.42,68.41,76.83,67.75,76.85,66.11,77.96,65.14,78.62,64.55,77.86,62.33,79.30,61.64,79.15,59.69,79.16,59.65,78.19,60.16,75.98,61.24,75.24,62.18,76.39,62.56,76.54,63.56,77.26,64.49,75.34,65.35,76.09,65.54,75.34,66.42,74.79,67.28,75.42
.goto Blade's Edge Mountains,67.28,75.42,40,0
.goto Blade's Edge Mountains,68.41,76.83,40,0
.goto Blade's Edge Mountains,67.75,76.85,40,0
.goto Blade's Edge Mountains,66.11,77.96,40,0
.goto Blade's Edge Mountains,65.14,78.62,40,0
.goto Blade's Edge Mountains,64.55,77.86,40,0
.goto Blade's Edge Mountains,62.33,79.30,40,0
.goto Blade's Edge Mountains,61.64,79.15,40,0
.goto Blade's Edge Mountains,59.69,79.16,40,0
.goto Blade's Edge Mountains,59.65,78.19,40,0
.goto Blade's Edge Mountains,60.16,75.98,40,0
.goto Blade's Edge Mountains,61.24,75.24,40,0
.goto Blade's Edge Mountains,62.18,76.39,40,0
.goto Blade's Edge Mountains,62.56,76.54,40,0
.goto Blade's Edge Mountains,63.56,77.26,40,0
.goto Blade's Edge Mountains,64.49,75.34,40,0
.goto Blade's Edge Mountains,65.35,76.09,40,0
.goto Blade's Edge Mountains,65.54,75.34,40,0
.goto Blade's Edge Mountains,66.42,74.79,40,0
.goto Blade's Edge Mountains,67.28,75.42,40,0
>>击杀|cRXP_ENEMY_水晶剥石者|r
.complete 10608,1 
.isOnQuest 10608
.mob Crystal Flayer
step
#loop
.line Blade's Edge Mountains,67.28,75.42,68.41,76.83,67.75,76.85,66.11,77.96,65.14,78.62,64.55,77.86,62.33,79.30,61.64,79.15,59.69,79.16,59.65,78.19,60.16,75.98,61.24,75.24,62.18,76.39,62.56,76.54,63.56,77.26,64.49,75.34,65.35,76.09,65.54,75.34,66.42,74.79,67.28,75.42
.goto Blade's Edge Mountains,67.28,75.42,40,0
.goto Blade's Edge Mountains,68.41,76.83,40,0
.goto Blade's Edge Mountains,67.75,76.85,40,0
.goto Blade's Edge Mountains,66.11,77.96,40,0
.goto Blade's Edge Mountains,65.14,78.62,40,0
.goto Blade's Edge Mountains,64.55,77.86,40,0
.goto Blade's Edge Mountains,62.33,79.30,40,0
.goto Blade's Edge Mountains,61.64,79.15,40,0
.goto Blade's Edge Mountains,59.69,79.16,40,0
.goto Blade's Edge Mountains,59.65,78.19,40,0
.goto Blade's Edge Mountains,60.16,75.98,40,0
.goto Blade's Edge Mountains,61.24,75.24,40,0
.goto Blade's Edge Mountains,62.18,76.39,40,0
.goto Blade's Edge Mountains,62.56,76.54,40,0
.goto Blade's Edge Mountains,63.56,77.26,40,0
.goto Blade's Edge Mountains,64.49,75.34,40,0
.goto Blade's Edge Mountains,65.35,76.09,40,0
.goto Blade's Edge Mountains,65.54,75.34,40,0
.goto Blade's Edge Mountains,66.42,74.79,40,0
.goto Blade's Edge Mountains,67.28,75.42,40,0
>>点击|cRXP_PICK_虚空龙卵|r以召唤出|cRXP_ENEMY_虚空龙崽|r
>>|cRXP_WARN_使用|r|T133869:0|t[时间定相调节器] |cRXP_WARN_对生成的 |cRXP_ENEMY_虚空龙崽|r进行转化, 使其变为|r|cRXP_ENEMY_虚空幼龙|r
>>|cRXP_WARN_你可以对同一个|cRXP_ENEMY_虚空幼龙|r多次使用|r|T133869:0|t[时间定相调节器]|cRXP_WARN_, 以将其转换为其他类型|r
.use 30742
.isOnQuest 10609
.complete 10609,1 
.mob +Proto-Nether Drake
.complete 10609,2 
.mob +Adolescent Nether Drake
.complete 10609,3 
.mob +Mature Nether Drake
step
#completewith CrystalClear
.goto Blade's Edge Mountains,59.99,69.32,30,0
.goto Blade's Edge Mountains,60.28,68.98,30,0
.goto Blade's Edge Mountains,60.11,68.37,30,0
.goto Blade's Edge Mountains,59.81,68.29,30,0
.goto Blade's Edge Mountains,60.03,67.79,30,0
.goto Blade's Edge Mountains,60.31,68.23,30,0
.goto Blade's Edge Mountains,60.42,67.91,30,0
.goto Blade's Edge Mountains,60.54,68.76,30,0
.goto Blade's Edge Mountains,60.44,69.37
.line Blade's Edge Mountains,59.99,69.32,60.28,68.98,60.11,68.37,59.81,68.29,60.03,67.79,60.31,68.23,60.42,67.91,60.54,68.76,60.44,69.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在巡逻站台的|cRXP_FRIENDLY_拉沙克·铁墙|r交谈
.turnin 10632 >>交任务: |cRXP_FRIENDLY_锋利的牙齿|r
.unitscan Razak Ironsides
.maxlevel 66,bemend << !tbc
step
#questguide
>>返回托什雷的基地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_测量者尼克维克|r和|cRXP_FRIENDLY_晕乎乎的迪娜|r交谈
.turnin 10608 >>交任务: |cRXP_FRIENDLY_水晶剥石者的麻烦|r
.accept 10594 >>接任务: |cRXP_LOOT_测量振荡频率|r
.goto Blade's Edge Mountains,60.22,68.94
.target +Nickwinkle the Metro-Gnome
.turnin 10620 >>交任务: |cRXP_FRIENDLY_山脊上的危险|r
.accept 10671 >>接任务: |cRXP_LOOT_不仅仅是一磅肉|r
.goto Blade's Edge Mountains,60.40,68.75
.target +Dizzy Dina
.maxlevel 66,bemend << !tbc
step << !tbc !wotlk
#xprate >1.59
#optional
.maxlevel 67,endOfTheGuide
step
#label CrystalClear
>>返回托什雷的基地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_测量者尼克维克|r和|cRXP_FRIENDLY_晕乎乎的迪娜|r交谈
.turnin 10608 >>交任务: |cRXP_FRIENDLY_水晶剥石者的麻烦|r
.accept 10594 >>接任务: |cRXP_LOOT_测量振荡频率|r
.goto Blade's Edge Mountains,60.22,68.94
.target +Nickwinkle the Metro-Gnome
.turnin 10620 >>交任务: |cRXP_FRIENDLY_山脊上的危险|r

.goto Blade's Edge Mountains,60.40,68.75
.target +Dizzy Dina
.maxlevel 66,bemend << !tbc
step
.goto Blade's Edge Mountains,59.99,69.32,30,0
.goto Blade's Edge Mountains,60.28,68.98,30,0
.goto Blade's Edge Mountains,60.11,68.37,30,0
.goto Blade's Edge Mountains,59.81,68.29,30,0
.goto Blade's Edge Mountains,60.03,67.79,30,0
.goto Blade's Edge Mountains,60.31,68.23,30,0
.goto Blade's Edge Mountains,60.42,67.91,30,0
.goto Blade's Edge Mountains,60.54,68.76,30,0
.goto Blade's Edge Mountains,60.44,69.37
.line Blade's Edge Mountains,59.99,69.32,60.28,68.98,60.11,68.37,59.81,68.29,60.03,67.79,60.31,68.23,60.42,67.91,60.54,68.76,60.44,69.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在巡逻站台的|cRXP_FRIENDLY_拉沙克·铁墙|r交谈
.turnin 10632 >>交任务: |cRXP_FRIENDLY_锋利的牙齿|r
.unitscan Razak Ironsides
.maxlevel 66,bemend << !tbc
step
.goto Blade's Edge Mountains,60.21,74.83
>>|cRXP_WARN_使用|r|T132995:0|t[振荡频率扫描器] |cRXP_WARN_将探测杆插入地面. 你需要将它们摆放成一个正五边形, 每根杆之间相距40码. 放置完5根探测杆后, 请站在五边形的中心位置|r
.complete 10594,1 
.use 30701
.isOnQuest 10594
step
#questguide
>>返回托什雷的基地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_,|cRXP_FRIENDLY_拉沙克·铁墙|r和|cRXP_FRIENDLY_塔利·萨普纳波|r和|cRXP_FRIENDLY_菲兹特·表针|r交谈
Talk to Nickwinkle, Tally, and Fizit
.turnin 10594 >>交任务: |cRXP_FRIENDLY_测量振荡频率|r
.goto Blade's Edge Mountains,60.22,68.94
.target +Nickwinkle the Metro-Gnome
.turnin 10710 >>交任务: |cRXP_FRIENDLY_试飞：晶歌山脉|r
.accept 10711 >>接任务: |cRXP_LOOT_试飞：拉扎安码头|r
.goto Blade's Edge Mountains,60.28,68.39
.target +Tally Zapnabber
.turnin 10609 >>交任务: |cRXP_FRIENDLY_先有龙还是先有蛋？|r
.goto Blade's Edge Mountains,60.98,68.11
.target +Fizit "Doc" Clocktock
.maxlevel 66,bemend << !tbc
step
>>返回托什雷的基地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_测量者尼克维克|r和|cRXP_FRIENDLY_塔利·萨普纳波|r和|cRXP_FRIENDLY_菲兹特·表针|r交谈
.turnin 10594 >>交任务: |cRXP_FRIENDLY_测量振荡频率|r
.goto Blade's Edge Mountains,60.22,68.94
.target +Nickwinkle the Metro-Gnome
.turnin 10710 >>交任务: |cRXP_FRIENDLY_试飞：晶歌山脉|r

.goto Blade's Edge Mountains,60.28,68.39
.target +Tally Zapnabber
.turnin 10609 >>交任务: |cRXP_FRIENDLY_先有龙还是先有蛋？|r
.goto Blade's Edge Mountains,60.98,68.11
.target +Fizit "Doc" Clocktock
.maxlevel 66,bemend << !tbc
step
#questguide
.goto Blade's Edge Mountains,60.175,68.794
.gossipoption 92112 >>与|cRXP_FRIENDLY_拉雷·萨普纳波|r交谈
.timer 40,Test Flight RP
.skipgossip
.isOnQuest 10711
.target Rally Zapnabber
step
#questguide
.complete 10711,1 
.goto Blade's Edge Mountains,66.98,48.90,300 >>等待RP结束
.isOnQuest 10711
step
#questguide
.goto Blade's Edge Mountains,67.2,43.6
>>击杀|cRXP_ENEMY_恶魔血肉兽|r. 击败它们获取|cRXP_LOOT_血肉|r
.complete 10671,1 
.isOnQuest 10671
.target Fiendling Flesh Beast
step
>>前往常青林
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_坦莫|r和|cRXP_FRIENDLY_护树者查恩|r交谈
.accept 10567 >>接任务: |cRXP_LOOT_制造坠饰|r
.goto Blade's Edge Mountains,62.16,39.11
.target +Timeon
.accept 10682 >>接任务: |cRXP_LOOT_该谈判了......|r
.goto Blade's Edge Mountains,61.97,39.47
.target +Tree Warden Chawn
.maxlevel 66,bemend << !tbc
step
.goto Blade's Edge Mountains,61.68,39.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲恩·叶影|r交谈
.fp Evergrove >>获取常青林的飞行点
.target Fhyn Leafshadow
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古树莫斯伍德|r和|cRXP_FRIENDLY_指挥官海弗斯·石墙|r和|cRXP_FRIENDLY_法维瑟中尉|r和|cRXP_FRIENDLY_法拉蒂拉|r交谈
.accept 10770 >>接任务: |cRXP_LOOT_灰烬中的小鬼|r
.accept 10771 >>接任务: |cRXP_LOOT_灰烬中的新生|r
.goto Blade's Edge Mountains,61.25,38.46
.target +Mosswood the Ancient
.accept 10795 >>接任务: |cRXP_LOOT_多古克|r
.goto Blade's Edge Mountains,61.98,37.98
.target +Commander Haephus Stonewall
.accept 10796 >>接任务: |cRXP_LOOT_踏平血槌营地！|r
.goto Blade's Edge Mountains,61.98,37.94
.target +Lieutenant Fairweather
.accept 10753 >>接任务: |cRXP_LOOT_清理荒野|r
.goto Blade's Edge Mountains,62.56,38.23
.target +Faradrella
.maxlevel 66,bemend << !tbc
step << !tbc !wotlk
#xprate >1.59
#optional
.maxlevel 67,endOfTheGuide
step
#completewith Damaged
.goto Blade's Edge Mountains,62.86,38.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板埃蕾尔娅|r交谈
.home >>将你的炉石设置为常青林
.maxlevel 66,bemend << !tbc
.target Innkeeper Aelerya
step
#completewith next
.goto Blade's Edge Mountains,65.43,39.76,40,0
.goto Blade's Edge Mountains,66.89,38.38,40 >>沿着山路跑上山
.skill riding,225,1
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_魔誓鳞翼风蛇|r和|cRXP_ENEMY_匕首巨鳄|r
.complete 10753,1 
.mob +Felsworn Scalewing
.complete 10753,2 
.mob +Felsworn Daggermaw
.isOnQuest 10753
step
#label Damaged
.goto Blade's Edge Mountains,69.23,37.45,60,0
.goto Blade's Edge Mountains,68.66,33.30,60,0
.goto Blade's Edge Mountains,71.75,32.63,60,0
.goto Blade's Edge Mountains,70.98,27.92
.use 31384 >>击杀|cRXP_ENEMY_邪能腐蚀者|r. 击败他们后可获得其掉落的物品:|T133133:0|t[|cRXP_LOOT_损坏的面具|r]
>>|cRXP_WARN_使用|r|T133133:0|t[|cRXP_LOOT_损坏的面具|r]|cRXP_WARN_来开始任务|r
.complete 10753,3 
.collect 31384,1,10810,1 
.accept 10810 >>接任务: |cRXP_LOOT_损坏的面具|r
.unitscan Fel Corrupter
.isOnQuest 10753
step
#loop
.line Blade's Edge Mountains,68.77,34.63,68.31,30.34,70.65,30.50,70.91,26.73,73.67,26.67,73.39,30.11,71.84,34.87,68.77,34.63
.goto Blade's Edge Mountains,68.77,34.63,60,0
.goto Blade's Edge Mountains,68.31,30.34,60,0
.goto Blade's Edge Mountains,70.65,30.50,60,0
.goto Blade's Edge Mountains,70.91,26.73,60,0
.goto Blade's Edge Mountains,73.67,26.67,60,0
.goto Blade's Edge Mountains,73.39,30.11,60,0
.goto Blade's Edge Mountains,71.84,34.87,60,0
.goto Blade's Edge Mountains,68.77,34.63,60,0
>>击杀|cRXP_ENEMY_魔誓鳞翼风蛇|r和|cRXP_ENEMY_匕首巨鳄|r
.complete 10753,1 
.mob +Felsworn Scalewing
.complete 10753,2 
.mob +Felsworn Daggermaw
.isOnQuest 10753
step
#completewith next
>>击杀|cRXP_ENEMY_灼烧小鬼|r
.complete 10770,1 
.isOnQuest 10770
.mob Scorch Imp
step
.use 31300 >>|cRXP_WARN_使用|r|T134059:0|t[铁根种子]|cRXP_WARN_在|r|cRXP_PICK_火山土壤的区域上|r
.complete 10771,1 
.goto Blade's Edge Mountains,71.66,22.38
.complete 10771,2 
.goto Blade's Edge Mountains,71.61,20.31
.complete 10771,3 
.goto Blade's Edge Mountains,71.59,18.50
.isOnQuest 10771
step
#loop
.line Blade's Edge Mountains,70.65,18.63,70.63,20.56,70.65,22.68,71.06,23.80,71.92,24.64,72.31,22.97,71.71,21.21,73.06,20.10,73.44,18.06,70.65,18.63
.goto Blade's Edge Mountains,70.65,18.63,50,0
.goto Blade's Edge Mountains,70.63,20.56,50,0
.goto Blade's Edge Mountains,70.65,22.68,50,0
.goto Blade's Edge Mountains,71.06,23.80,50,0
.goto Blade's Edge Mountains,71.92,24.64,50,0
.goto Blade's Edge Mountains,72.31,22.97,50,0
.goto Blade's Edge Mountains,71.71,21.21,50,0
.goto Blade's Edge Mountains,73.06,20.10,50,0
.goto Blade's Edge Mountains,73.44,18.06,50,0
.goto Blade's Edge Mountains,70.65,18.63,50,0
>>击杀|cRXP_ENEMY_灼烧小鬼|r
.complete 10770,1 
.isOnQuest 10770
.mob Scorch Imp
step
#completewith next
.hs >>传送至常青林
.cooldown item,6948,>2
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法拉蒂拉|r和|cRXP_FRIENDLY_古树莫斯伍德|r和|cRXP_FRIENDLY_奥马利·扎普纳伯|r交谈
.turnin 10753 >>交任务: |cRXP_FRIENDLY_清理荒野|r
.goto Blade's Edge Mountains,62.56,38.23
.target +Faradrella
.turnin 10770 >>交任务: |cRXP_FRIENDLY_灰烬中的小鬼|r
.turnin 10771 >>交任务: |cRXP_FRIENDLY_灰烬中的新生|r
.goto Blade's Edge Mountains,61.25,38.46
.target +Mosswood the Ancient
.turnin 10810 >>交任务: |cRXP_FRIENDLY_损坏的面具|r
.accept 10812 >>接任务: |cRXP_LOOT_神秘的面具|r
.goto Blade's Edge Mountains,62.66,40.38
.target +O'Mally Zapnabber
.maxlevel 66,bemend << !tbc
step
.goto Blade's Edge Mountains,62.53,39.91,40,0
.goto Blade's Edge Mountains,62.00,40.21,40,0
.goto Blade's Edge Mountains,61.45,39.73,40,0
.goto Blade's Edge Mountains,61.28,38.77,40,0
.goto Blade's Edge Mountains,62.20,38.15,40,0
.goto Blade's Edge Mountains,62.69,39.13
.line Blade's Edge Mountains,62.53,39.91,62.00,40.21,61.45,39.73,61.28,38.77,62.20,38.15,62.69,39.13,62.53,39.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_荒野之王安塔里恩|r, 他正以逆时针方向在城镇周围巡逻
.turnin 10812 >>交任务: |cRXP_FRIENDLY_神秘的面具|r
.accept 10819 >>接任务: |cRXP_LOOT_魔誓防毒面具|r
.maxlevel 66,bemend << !tbc
.target Wildlord Antelarion
step
#completewith next
.equip 1,10819 >>|cRXP_WARN_装备|r|T133133:0|t[魔誓防毒面具]|cRXP_WARN_才能与|r|cRXP_FRIENDLY_军团联络器交谈|r
.use 10819
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与携带|cRXP_FRIENDLY_Legion Communicator|r的军团联络器交谈, 并确保你已装备|T133133:0|t[魔誓防毒面具]
.goto Blade's Edge Mountains,73.27,40.03
.turnin 10819 >>交任务: |cRXP_FRIENDLY_魔誓防毒面具|r
.accept 10820 >>接任务: |cRXP_LOOT_欺骗敌人|r
.use 31366
.maxlevel 66,bemend << !tbc
step
#loop
.line Blade's Edge Mountains,74.28,38.54,75.39,39.66,74.93,40.17,75.30,41.73,74.22,42.56,73.77,41.02,74.28,38.54
.goto Blade's Edge Mountains,74.28,38.54,40,0
.goto Blade's Edge Mountains,75.39,39.66,40,0
.goto Blade's Edge Mountains,74.93,40.17,40,0
.goto Blade's Edge Mountains,75.30,41.73,40,0
.goto Blade's Edge Mountains,74.22,42.56,40,0
.goto Blade's Edge Mountains,73.77,41.02,40,0
.goto Blade's Edge Mountains,74.28,38.54,40,0
>>|cRXP_WARN_重新装备你的普通头盔|r
>>击杀|cRXP_ENEMY_末日熔炉随从|r和|cRXP_ENEMY_工程师|r
.complete 10820,1 
.mob +Doomforge Attendant
.complete 10820,2 
.mob +Doomforge Engineer
.isOnQuest 10820
step
#completewith next
.equip 1,10819 >>|cRXP_WARN_装备|r|T133133:0|t[魔誓防毒面具]|cRXP_WARN_才能与|r|cRXP_FRIENDLY_军团联络器交谈|r
.use 10819
step
.goto Blade's Edge Mountains,73.27,40.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与携带|cRXP_FRIENDLY_Legion Communicator|r的军团联络器交谈, 并确保你已装备|T133133:0|t[魔誓防毒面具]
.turnin 10820 >>交任务: |cRXP_FRIENDLY_欺骗敌人|r
.accept 10821 >>接任务: |cRXP_LOOT_你玩完了！|r
.maxlevel 66,bemend << !tbc

step
#loop
.line Blade's Edge Mountains,73.63,39.14,72.82,40.35,72.90,40.76,72.92,41.50,72.90,41.96,73.36,42.46,73.39,43.64,74.38,41.90,74.01,38.52,73.63,39.14
.goto Blade's Edge Mountains,73.63,39.14,40,0
.goto Blade's Edge Mountains,72.82,40.35,40,0
.goto Blade's Edge Mountains,72.90,40.76,40,0
.goto Blade's Edge Mountains,72.92,41.50,40,0
.goto Blade's Edge Mountains,72.90,41.96,40,0
.goto Blade's Edge Mountains,73.36,42.46,40,0
.goto Blade's Edge Mountains,73.39,43.64,40,0
.goto Blade's Edge Mountains,74.38,41.90,40,0
.goto Blade's Edge Mountains,74.01,38.52,40,0
.goto Blade's Edge Mountains,73.63,39.14,40,0
>>击杀|cRXP_ENEMY_怒火卫士|r. 击败他们后搜刮出|cRXP_LOOT_怒火营地钥匙|r
>>|cRXP_WARN_不要点击任何|cRXP_WARN_Obelisks|r旗帜|r
.collect 31536,5,10821,1 
.isOnQuest 10821
.mob Anger Guard
step
#completewith Doomcryer
#label FirstO
.goto Blade's Edge Mountains,73.53,43.51
.cast 38746 >>点击|cRXP_PICK_First 方尖碑|r
>>|cRXP_WARN_*如果无法点击, 请跳过此步骤*|r
.isOnQuest 10821
step
#completewith Doomcryer
#requires FirstO
#label SecondO
.goto Blade's Edge Mountains,73.82,41.03
.cast 38746 >>点击|cRXP_PICK_Second Obelisk|r
>>|cRXP_WARN_*如果无法点击, 请跳过此步骤*|r
.isOnQuest 10821
step
#completewith Doomcryer
#requires SecondO
#label ThirdO
.goto Blade's Edge Mountains,73.94,39.89
.cast 38746 >>点击|cRXP_PICK_Third Obelisk|r
>>|cRXP_WARN_*如果无法点击, 请跳过此步骤*|r
.isOnQuest 10821
step
#completewith Doomcryer
#requires ThirdO
#label FourthO
.goto Blade's Edge Mountains,75.45,40.52
.cast 38746 >>点击|cRXP_PICK_Fourth Obelisk|r
>>|cRXP_WARN_*如果无法点击, 请跳过此步骤*|r
.isOnQuest 10821
step
#completewith Doomcryer
#requires FourthO
.goto Blade's Edge Mountains,75.33,41.74
.cast 38746 >>点击|cRXP_PICK_第五方尖碑|r
>>|cRXP_WARN_*如果无法点击, 请跳过此步骤*|r
.timer 30,Doomcryer Spawn
.isOnQuest 10821
step
#label Doomcryer
.goto Blade's Edge Mountains,74.32,42.52
>>点击营地周围的五座方尖碑召唤厄运传令者
>>击杀|cRXP_ENEMY_厄运传令者|r
>>|cRXP_ENEMY_厄运传令者|r |cRXP_WARN_ 可能受到多种群体控制技能的影响, 例如减速和恐惧|r
>>|cRXP_WARN_这个任务难度较高. 如需协助, 可为她组队. 若无法组队或选择单刷, 请跳过此步骤|r
.complete 10821,1 
.isOnQuest 10821
.mob Doomcryer
step
#completewith Nuaar
.hs >>传送至常青林
.cooldown item,6948,>2
step
.goto Blade's Edge Mountains,62.53,39.91,40,0
.goto Blade's Edge Mountains,62.00,40.21,40,0
.goto Blade's Edge Mountains,61.45,39.73,40,0
.goto Blade's Edge Mountains,61.28,38.77,40,0
.goto Blade's Edge Mountains,62.20,38.15,40,0
.goto Blade's Edge Mountains,62.69,39.13
.line Blade's Edge Mountains,62.53,39.91,62.00,40.21,61.45,39.73,61.28,38.77,62.20,38.15,62.69,39.13,62.53,39.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_荒野之王安塔里恩|r, 他正以逆时针方向在城镇周围巡逻
.turnin 10821 >>交任务: |cRXP_FRIENDLY_你玩完了！|r
.isQuestComplete 10821
.maxlevel 66,bemend << !tbc
.target Wildlord Antelarion
step
.goto Blade's Edge Mountains,62.53,39.91,40,0
.goto Blade's Edge Mountains,62.00,40.21,40,0
.goto Blade's Edge Mountains,61.45,39.73,40,0
.goto Blade's Edge Mountains,61.28,38.77,40,0
.goto Blade's Edge Mountains,62.20,38.15,40,0
.goto Blade's Edge Mountains,62.69,39.13
.line Blade's Edge Mountains,62.53,39.91,62.00,40.21,61.45,39.73,61.28,38.77,62.20,38.15,62.69,39.13,62.53,39.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_荒野之王安塔里恩|r, 他正以逆时针方向在城镇周围巡逻
.accept 10910 >>接任务: |cRXP_LOOT_死亡之门|r
.isQuestTurnedIn 10821
.maxlevel 66,bemend << !tbc
.target Wildlord Antelarion
step
#label Nuaar
.line Blade's Edge Mountains,62.82,25.94,63.12,27.41,63.34,27.87,63.28,28.37,62.73,28.77,62.45,29.31,62.37,29.65,62.44,31.66,62.11,33.34,61.80,34.00,61.43,34.10,60.61,33.98,60.12,34.47,60.01,34.80,60.08,35.15,59.90,35.72,59.60,36.07,59.11,36.21,58.96,36.61,58.65,36.91,58.18,36.96,57.90,37.34,57.84,37.81,59.13,39.47,59.90,40.27,60.51,40.90,61.50,42.02,61.78,42.41,62.62,43.95,62.97,45.05,63.06,46.38
63.06,46.38
.goto Blade's Edge Mountains,63.06,46.38,60,0
.goto Blade's Edge Mountains,62.97,45.05,60,0
.goto Blade's Edge Mountains,62.62,43.95,60,0
.goto Blade's Edge Mountains,61.78,42.41,60,0
.goto Blade's Edge Mountains,61.50,42.02,60,0
.goto Blade's Edge Mountains,60.51,40.90,60,0
.goto Blade's Edge Mountains,59.90,40.27,60,0
.goto Blade's Edge Mountains,59.13,39.47,60,0
.goto Blade's Edge Mountains,57.84,37.81,60,0
.goto Blade's Edge Mountains,57.90,37.34,60,0
.goto Blade's Edge Mountains,58.18,36.96,60,0
.goto Blade's Edge Mountains,58.65,36.91,60,0
.goto Blade's Edge Mountains,58.96,36.61,60,0
.goto Blade's Edge Mountains,59.11,36.21,60,0
.goto Blade's Edge Mountains,59.60,36.07,60,0
.goto Blade's Edge Mountains,59.90,35.72,60,0
.goto Blade's Edge Mountains,60.08,35.15,60,0
.goto Blade's Edge Mountains,60.01,34.80,60,0
.goto Blade's Edge Mountains,60.12,34.47,60,0
.goto Blade's Edge Mountains,60.61,33.98,60,0
.goto Blade's Edge Mountains,61.80,34.00,60,0
.goto Blade's Edge Mountains,62.11,33.34,60,0
.goto Blade's Edge Mountains,62.44,31.66,60,0
.goto Blade's Edge Mountains,62.37,29.65,60,0
.goto Blade's Edge Mountains,62.45,29.31,60,0
.goto Blade's Edge Mountains,62.73,28.77,60,0
.goto Blade's Edge Mountains,63.28,28.37,60,0
.goto Blade's Edge Mountains,63.34,27.87,60,0
.goto Blade's Edge Mountains,63.12,27.41,60,0
.goto Blade's Edge Mountains,62.82,25.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头努埃尔|r交谈
>>|cRXP_FRIENDLY_工头努埃尔|r|cRXP_WARN_巡逻卢安荒野的蛇族营地|r
.complete 10682,1 
.unitscan Overseer Nuaar
.skipgossip
.isOnQuest 10682
step
>>返回常青林
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护树者查恩|r和|cRXP_FRIENDLY_萨米亚·因克林|r交谈
.turnin 10682 >>交任务: |cRXP_FRIENDLY_该谈判了......|r
.accept 10713 >>接任务: |cRXP_LOOT_......谈判不成就动手！|r
.goto Blade's Edge Mountains,61.97,39.47
.target +Tree Warden Chawn
.accept 10717 >>接任务: |cRXP_LOOT_偷猎|r
.goto Blade's Edge Mountains,61.94,39.45
.target +Samia Inkling
.maxlevel 66,bemend << !tbc
step
#completewith next
#loop
.line Blade's Edge Mountains,63.61,34.11,65.32,34.83,65.52,31.59,65.32,29.29,63.99,31.39,63.61,34.11
.goto Blade's Edge Mountains,63.61,34.11,50,0
.goto Blade's Edge Mountains,65.32,34.83,50,0
.goto Blade's Edge Mountains,65.52,31.59,50,0
.goto Blade's Edge Mountains,65.32,29.29,50,0
.goto Blade's Edge Mountains,63.99,31.39,50,0
.goto Blade's Edge Mountains,63.61,34.11,50,0
>>击杀|cRXP_ENEMY_Ruuan'ok|r. 搜刮他们的|cRXP_LOOT_Claws|r
.collect 30704,6,10567,1 
.isOnQuest 10567
.mob Ruuan'ok Cloudgazer
.mob Ruuan'ok Skyfury
.mob Ruuan'ok Ravenguard
.mob Ruuan'ok Matriarch
step
.goto Blade's Edge Mountains,64.48,33.09
.use 30704 >>|cRXP_WARN_使用绿色圆圈内的|r|T134295:0|t[鲁安诺克利爪]|cRXP_WARN_召唤|r|cRXP_ENEMY_乌鸦预言者|r
>>击杀|r|cRXP_ENEMY_乌鸦预言者|r. 从他身上搜刮出|r|cRXP_LOOT_吊坠|r
.cast 37426
.timer 8,Creating the Pendant RP
.complete 10567,1 
.isOnQuest 10567
.mob Harbinger of the Raven
step
#optional
#completewith next
>>击杀拜龙教伐木工和拜龙教偷猎者. 击败他们后搜刮出|T134942:0|t[|cRXP_LOOT_会议记录|r]
.use 31120 >>|cRXP_WARN_使用|r|T134942:0|t[|cRXP_LOOT_会议记录|r]|cRXP_WARN_来开始任务|r
.collect 31120,1,10719,1 
.accept 10719 >>接任务: |cRXP_LOOT_你拿到记录了吗？|r
.isOnQuest 10713
step
#loop
.line Blade's Edge Mountains,59.62,38.72,57.43,39.14,57.71,37.76,59.10,36.09,59.93,35.16,60.82,33.54,62.10,32.35,61.78,27.86,62.89,25.82,63.56,27.91,62.10,32.35,61.55,34.48,60.09,36.97,59.62,38.72
.goto Blade's Edge Mountains,59.62,38.72,50,0
.goto Blade's Edge Mountains,57.43,39.14,50,0
.goto Blade's Edge Mountains,57.71,37.76,50,0
.goto Blade's Edge Mountains,59.10,36.09,50,0
.goto Blade's Edge Mountains,59.93,35.16,50,0
.goto Blade's Edge Mountains,60.82,33.54,50,0
.goto Blade's Edge Mountains,62.10,32.35,50,0
.goto Blade's Edge Mountains,61.78,27.86,50,0
.goto Blade's Edge Mountains,62.89,25.82,50,0
.goto Blade's Edge Mountains,63.56,27.91,50,0
.goto Blade's Edge Mountains,62.10,32.35,50,0
.goto Blade's Edge Mountains,61.55,34.48,50,0
.goto Blade's Edge Mountains,60.09,36.97,50,0
.goto Blade's Edge Mountains,59.62,38.72,50,0
>>击杀拜龙教偷猎者和拜龙教伐木工. 从拜龙教偷猎者身上搜刮他们的网
.complete 10717,1 
.mob +Wyrmcult Poacher
.mob +Wyrmcult Hewer
.complete 10713,1 
.mob +Wyrmcult Hewer
.isOnQuest 10713
step
#loop
.line Blade's Edge Mountains,59.62,38.72,57.43,39.14,57.71,37.76,59.10,36.09,59.93,35.16,60.82,33.54,62.10,32.35,61.78,27.86,62.89,25.82,63.56,27.91,62.10,32.35,61.55,34.48,60.09,36.97,59.62,38.72
.goto Blade's Edge Mountains,59.62,38.72,50,0
.goto Blade's Edge Mountains,57.43,39.14,50,0
.goto Blade's Edge Mountains,57.71,37.76,50,0
.goto Blade's Edge Mountains,59.10,36.09,50,0
.goto Blade's Edge Mountains,59.93,35.16,50,0
.goto Blade's Edge Mountains,60.82,33.54,50,0
.goto Blade's Edge Mountains,62.10,32.35,50,0
.goto Blade's Edge Mountains,61.78,27.86,50,0
.goto Blade's Edge Mountains,62.89,25.82,50,0
.goto Blade's Edge Mountains,63.56,27.91,50,0
.goto Blade's Edge Mountains,62.10,32.35,50,0
.goto Blade's Edge Mountains,61.55,34.48,50,0
.goto Blade's Edge Mountains,60.09,36.97,50,0
.goto Blade's Edge Mountains,59.62,38.72,50,0
>>击杀拜龙教伐木工和拜龙教偷猎者. 击败他们后搜刮出|T134942:0|t[|cRXP_LOOT_会议记录|r]
.use 31120 >>|cRXP_WARN_使用|r|T134942:0|t[|cRXP_LOOT_会议记录|r]|cRXP_WARN_来开始任务|r
.collect 31120,1,10719,1 
.accept 10719 >>接任务: |cRXP_LOOT_你拿到记录了吗？|r
.isOnQuest 10713
.mob Wyrmcult Hewer
.mob Wyrmcult Poacher
step
#optional
#completewith next
>>击杀血槌粗暴者和血槌术士
.complete 10796,1 
.mob +Bloodmaul Mauler
.complete 10796,2 
.mob +Bloodmaul Warlock
.isOnQuest 10796
step
.goto Blade's Edge Mountains,54.80,24.71,30,0
.goto Blade's Edge Mountains,55.15,24.05
>>|cRXP_WARN_上楼|r
.use 31363 >>击杀|cRXP_ENEMY_多古克|r. 击败他后搜刮出 |T134451:0|t[|cRXP_LOOT_戈隆的信物|r]
>>|cRXP_WARN_使用|r|T134451:0|t[|cRXP_LOOT_戈隆的信物|r]|cRXP_WARN_来开始任务|r
.complete 10795,1 
.collect 31363,1,10797,1 
.accept 10797 >>接任务: |cRXP_LOOT_戈隆的信物|r
.isOnQuest 10796
.mob Dorgok
step
#loop
.line Blade's Edge Mountains,57.05,27.86,55.30,27.11,55.18,24.26,56.40,22.11,57.70,24.45,56.91,25.87,57.93,29.95,54.68,33.92,57.05,27.86
.goto Blade's Edge Mountains,57.05,27.86,50,0
.goto Blade's Edge Mountains,55.30,27.11,50,0
.goto Blade's Edge Mountains,55.18,24.26,50,0
.goto Blade's Edge Mountains,56.40,22.11,50,0
.goto Blade's Edge Mountains,57.70,24.45,50,0
.goto Blade's Edge Mountains,56.91,25.87,50,0
.goto Blade's Edge Mountains,57.93,29.95,50,0
.goto Blade's Edge Mountains,54.68,33.92,50,0
.goto Blade's Edge Mountains,57.05,27.86,50,0
>>击杀血槌粗暴者和血槌术士
.complete 10796,1 
.mob +Bloodmaul Mauler
.complete 10796,2 
.mob +Bloodmaul Warlock
.isOnQuest 10796
step
#completewith Evergrove2
.goto Blade's Edge Mountains,59.12,32.12,40,0
.goto Blade's Edge Mountains,60.38,28.77,40,0
.goto Blade's Edge Mountains,61.54,29.73,40 >>骑乘沿山路前行
.cooldown item,6948,<0
.skill riding,225,1
step
#optional
#completewith next
.hs >>传送至常青林
.cooldown item,6948,>2
step
#label Evergrove2
>>返回常青林
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法维瑟中尉|r和|cRXP_FRIENDLY_指挥官海弗斯·石墙|r和|cRXP_FRIENDLY_坦莫|r和|cRXP_FRIENDLY_护树者查恩|r及|cRXP_FRIENDLY_萨米亚·因克林|r交谈
.turnin 10796 >>交任务: |cRXP_FRIENDLY_踏平血槌营地！|r
.goto Blade's Edge Mountains,61.98,37.94
.target +Lieutenant Fairweather
.turnin 10795 >>交任务: |cRXP_FRIENDLY_多古克|r
.turnin 10797 >>交任务: |cRXP_FRIENDLY_戈隆的信物|r
.accept 10798 >>接任务: |cRXP_LOOT_拜访男爵|r
.goto Blade's Edge Mountains,61.98,37.98
.target +Commander Haephus Stonewall
.turnin 10567 >>交任务: |cRXP_FRIENDLY_制造坠饰|r
.accept 10607 >>接任务: |cRXP_LOOT_乌鸦之神的低语|r
.goto Blade's Edge Mountains,62.16,39.11
.target +Timeon
.turnin 10713 >>交任务: |cRXP_FRIENDLY_......谈判不成就动手！|r
.turnin 10719 >>交任务: |cRXP_FRIENDLY_你拿到记录了吗？|r
.accept 10894 >>接任务: |cRXP_LOOT_龙颅观察者|r
.goto Blade's Edge Mountains,61.97,39.47
.target +Tree Warden Chawn
.turnin 10717 >>交任务: |cRXP_FRIENDLY_偷猎|r
.accept 10747 >>接任务: |cRXP_LOOT_拜龙教的龙崽|r
.goto Blade's Edge Mountains,61.94,39.45
.target +Samia Inkling
.maxlevel 66,bemend << !tbc
step
.goto Blade's Edge Mountains,53.25,41.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨博迈恩男爵|r交谈
.turnin 10798 >>交任务: |cRXP_FRIENDLY_拜访男爵|r
.accept 10799 >>接任务: |cRXP_LOOT_进入沸土峡谷|r
.maxlevel 66,bemend << !tbc
.target Baron Sablemane
step
#loop
.line Blade's Edge Mountains,51.18,37.94,48.99,41.05,49.28,44.96,47.16,45.03,45.19,47.89,44.82,44.78,47.03,43.18,48.99,41.05
.goto Blade's Edge Mountains,51.18,37.94,50,0
.goto Blade's Edge Mountains,48.99,41.05,50,0
.goto Blade's Edge Mountains,49.28,44.96,50,0
.goto Blade's Edge Mountains,47.16,45.03,50,0
.goto Blade's Edge Mountains,45.19,47.89,50,0
.goto Blade's Edge Mountains,44.82,44.78,50,0
.goto Blade's Edge Mountains,47.03,43.18,50,0
.goto Blade's Edge Mountains,48.99,41.05,50,0
>>击杀|cRXP_ENEMY_硬壳穿地虫幼体|r和|cRXP_ENEMY_大型硬壳穿地虫|r, 从它们身上获取|cRXP_LOOT_毒腺|r
.complete 10799,1 
.isOnQuest 10799
.mob Greater Crust Burster
.mob Young Crust Burster
step
.goto Blade's Edge Mountains,53.25,41.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨博迈恩男爵|r交谈
.turnin 10799 >>交任务: |cRXP_FRIENDLY_进入沸土峡谷|r
.accept 10800 >>接任务: |cRXP_LOOT_晚安，戈隆|r
.maxlevel 66,bemend << !tbc
.target Baron Sablemane
step
#completewith next
.cast 38510 >>|cRXP_WARN_使用|r|T132858:0|t[萨博曼的安眠粉], |cRXP_WARN_目标: |r|cRXP_ENEMY_格鲁洛克|r
.use 31403
.isOnQuest 10800
.target Grulloc
step
.goto Blade's Edge Mountains,60.90,47.77
>>|cRXP_WARN_如果|r|T132858:0|t[安眠粉]|cRXP_WARN_抗性, 则将其用在|r|cRXP_ENEMY_格鲁洛克|r|cRXP_WARN_上|r. 拾取|cRXP_LOOT_袋子|r, 它就在|cRXP_ENEMY_格鲁洛克|r旁边|r
.complete 10800,1 
.use 31403
.isOnQuest 10800
.target Grulloc
step
.goto Blade's Edge Mountains,53.25,41.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨博迈恩男爵|r交谈
.turnin 10800 >>交任务: |cRXP_FRIENDLY_晚安，戈隆|r
.accept 10801 >>接任务: |cRXP_LOOT_这是个陷阱！|r
.maxlevel 66,bemend << !tbc
.target Baron Sablemane
step << !Shaman
#completewith Evergrove3
.goto Blade's Edge Mountains,58.64,46.20,40,0
.goto Blade's Edge Mountains,59.95,44.60,40,0
.goto Blade's Edge Mountains,58.50,43.70,40,0
.goto Blade's Edge Mountains,59.40,42.14,40 >>骑乘沿山路前行
.cooldown item,6948,<0
.skill riding,225,1
step << Shaman
#completewith next
.hs >>传送至常青林
.cooldown item,6948,>2
step
#label Evergrove3
>>返回常青林
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官海弗斯·石墙|r和|cRXP_FRIENDLY_法维瑟中尉|r交谈
.turnin 10801 >>交任务: |cRXP_FRIENDLY_这是个陷阱！|r
.accept 10802 >>接任务: |cRXP_LOOT_食龙者高格鲁姆|r
.goto Blade's Edge Mountains,61.98,37.98
.target +Commander Haephus Stonewall
.accept 10803 >>接任务: |cRXP_LOOT_砾石营地的食人魔|r
.goto Blade's Edge Mountains,61.98,37.94
.target +Lieutenant Fairweather
.maxlevel 66,bemend << !tbc
step
#completewith Evergrove3
.goto Blade's Edge Mountains,55.90,39.76,60,0
.goto Blade's Edge Mountains,59.40,42.14,40 >>过桥
.skill riding,225,1
step
.goto Blade's Edge Mountains,50.35,36.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与桥上的|cRXP_FRIENDLY_观察者希德·月影|r交谈
.turnin 10894 >>交任务: |cRXP_FRIENDLY_龙颅观察者|r
.accept 10893 >>接任务: |cRXP_LOOT_德莱卡·长尾|r
.maxlevel 66,bemend << !tbc
.target Watcher Moonshade
step
>>击杀隧道内的德莱卡·长尾
.goto Blade's Edge Mountains,46.03,32.93,40,0
.goto Blade's Edge Mountains,45.81,32.90,40,0
.goto Blade's Edge Mountains,44.78,32.07
.complete 10893,1 
.unitscan Draaca Longtail
.isOnQuest 10893
step
.goto Blade's Edge Mountains,49.92,35.92,20,0
.goto Blade's Edge Mountains,50.35,36.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_观察者希德·月影|r交谈
.turnin 10893 >>交任务: |cRXP_FRIENDLY_德莱卡·长尾|r
.accept 10722 >>接任务: |cRXP_LOOT_黑翼集会所|r
.maxlevel 66,bemend << !tbc
.target Watcher Moonshade
step
#optional
#completewith Prophecy
>>击杀|cRXP_ENEMY_Grishna|r. 击败后可掠夺获得 |T136210:0|t[|cRXP_LOOT_格里施纳宝珠|r]
.use 31489 >>|cRXP_WARN_使用|r|T136210:0|t[|cRXP_LOOT_格里施纳宝珠|r]|cRXP_WARN_来开始任务|r
.collect 31489,1,10825,1 
.accept 10825 >>接任务: |cRXP_LOOT_神秘的宝珠|r
.isOnQuest 10607
.mob Grishna Falconwing
.mob Grishna Harbinger
.mob Grishna Matriarch
.mob Grishna Scorncrow
step
#optional
#completewith Prophecy
+击杀|cRXP_ENEMY_Grishna|r
>>|cRXP_WARN_当他们死亡时站在身旁, 有机会获得|r|T132188:0|t[理解乌鸦语]|cRXP_WARN_buff, 这是接收|r|cRXP_PICK_预言所必需的|r
.aura 37642
.aura 37466
.isOnQuest 10607
.mob Grishna Falconwing
.mob Grishna Harbinger
.mob Grishna Matriarch
.mob Grishna Scorncrow
step
>>|cRXP_WARN_前往格里施纳的|cRXP_PICK_Prophecies|r领取任务物品|r
.complete 10607,4 
.goto Blade's Edge Mountains,40.18,23.02
.complete 10607,3 
.goto Blade's Edge Mountains,40.67,18.63
.isOnQuest 10607
step
#completewith next
.goto Blade's Edge Mountains,40.61,17.46,20,0
.goto Blade's Edge Mountains,39.92,16.42,20,0
.goto Blade's Edge Mountains,39.02,17.25,20 >>|cRXP_WARN_前往西侧的树台. 过桥后, 点击|r|cRXP_PICK_Prophecy|r
.skill riding,225,1
step
>>|cRXP_WARN_前往树平台上的预言石|r
.complete 10607,1 
.goto Blade's Edge Mountains,39.02,17.25
.isOnQuest 10607
step
#completewith next
.goto Blade's Edge Mountains,41.08,18.18,20,0
.goto Blade's Edge Mountains,42.35,19.18,20,0
.goto Blade's Edge Mountains,42.47,21.63,20 >>|cRXP_WARN_前往东侧的树平台. 过桥, 下一层, 然后点击|r|cRXP_PICK_Prophecy|r
.skill riding,225,1
step
#label Prophecy
>>|cRXP_WARN_前往树平台底层的预言石|cRXP_PICK_Prophecy|r|r
.goto Blade's Edge Mountains,42.47,21.63
.complete 10607,2 
.isOnQuest 10607
step
#loop
.line Blade's Edge Mountains,42.30,24.63,41.37,20.69,39.96,22.83,38.41,20.01,39.33,17.50,40.80,17.74,42.15,18.55,42.73,21.32,42.30,24.63
.goto Blade's Edge Mountains,42.30,24.63,60,0
.goto Blade's Edge Mountains,41.37,20.69,60,0
.goto Blade's Edge Mountains,39.96,22.83,60,0
.goto Blade's Edge Mountains,38.41,20.01,60,0
.goto Blade's Edge Mountains,39.33,17.50,60,0
.goto Blade's Edge Mountains,40.80,17.74,60,0
.goto Blade's Edge Mountains,42.15,18.55,60,0
.goto Blade's Edge Mountains,42.73,21.32,60,0
.goto Blade's Edge Mountains,42.30,24.63,60,0
>>击杀|cRXP_ENEMY_Grishna|r. 击败后可掠夺获得 |T136210:0|t[|cRXP_LOOT_格里施纳宝珠|r]
.use 31489 >>|cRXP_WARN_使用|r|T136210:0|t[|cRXP_LOOT_格里施纳宝珠|r]|cRXP_WARN_来开始任务|r
.collect 31489,1,10825,1 
.accept 10825 >>接任务: |cRXP_LOOT_神秘的宝珠|r
.isOnQuest 10607
.mob Grishna Falconwing
.mob Grishna Harbinger
.mob Grishna Matriarch
.mob Grishna Scorncrow
step
#optional
#completewith Plant
>>击杀|cRXP_ENEMY_砾石营地暴徒|r和|cRXP_ENEMY_砾石营地萨满|r
.complete 10803,1 
.mob +Boulder'mok Brute
.complete 10803,2 
.mob +Boulder'mok Shaman
.isOnQuest 10803
step
#loop
.line Blade's Edge Mountains,31.88,21.40,31.59,22.91,30.89,24.19,29.49,23.96,30.41,22.68,30.38,21.06,31.19,19.79,31.88,21.40
.goto Blade's Edge Mountains,31.88,21.40,60,0
.goto Blade's Edge Mountains,31.59,22.91,60,0
.goto Blade's Edge Mountains,30.89,24.19,60,0
.goto Blade's Edge Mountains,29.49,23.96,60,0
.goto Blade's Edge Mountains,30.41,22.68,60,0
.goto Blade's Edge Mountains,30.38,21.06,60,0
.goto Blade's Edge Mountains,31.19,19.79,60,0
.goto Blade's Edge Mountains,31.88,21.40,60,0
>>击杀|cRXP_ENEMY_砾石营地食人魔|r. 从他们身上搜刮|cRXP_LOOT_图腾|r
.collect 31754,3,10802,1 
.isOnQuest 10802
.mob Boulder'mok Chieftain
.mob Boulder'mok Brute
.mob Boulder'mok Shaman
step
#completewith next
.goto Blade's Edge Mountains,30.58,22.18
.cast 39264 >>|cRXP_WARN_点击|cRXP_PICK_高格鲁姆祭坛|r开始角色扮演|r
.timer 12,Gorgrom RP
.isOnQuest 10802
step
#label Plant
.goto Blade's Edge Mountains,30.64,22.13
.use 31754 >>|cRXP_WARN_等待短暂的RP|r
>>|cRXP_WARN_当|cRXP_ENEMY_Gorgrom|r死亡时, 对他使用|r |T132352:0|t[可怕的图腾]|cRXP_WARN_3次|r
.complete 10802,1 
.isOnQuest 10802
.mob Gorgrom the Dragon-Eater
step
#loop
.line Blade's Edge Mountains,31.88,21.40,31.59,22.91,30.89,24.19,29.49,23.96,30.41,22.68,30.38,21.06,31.19,19.79,31.88,21.40
.goto Blade's Edge Mountains,31.88,21.40,60,0
.goto Blade's Edge Mountains,31.59,22.91,60,0
.goto Blade's Edge Mountains,30.89,24.19,60,0
.goto Blade's Edge Mountains,29.49,23.96,60,0
.goto Blade's Edge Mountains,30.41,22.68,60,0
.goto Blade's Edge Mountains,30.38,21.06,60,0
.goto Blade's Edge Mountains,31.19,19.79,60,0
.goto Blade's Edge Mountains,31.88,21.40,60,0
>>击杀|cRXP_ENEMY_砾石营地暴徒|r和|cRXP_ENEMY_砾石营地萨满|r
.complete 10803,1 
.mob +Boulder'mok Brute
.complete 10803,2 
.mob +Boulder'mok Shaman
.isOnQuest 10803
step
#loop
.line Blade's Edge Mountains,30.77,31.59,31.05,33.60,33.35,32.28,33.10,30.99,30.77,31.59
.goto Blade's Edge Mountains,30.77,31.59,50,0
.goto Blade's Edge Mountains,31.05,33.60,50,0
.goto Blade's Edge Mountains,33.35,32.28,50,0
.goto Blade's Edge Mountains,33.10,30.99,50,0
.goto Blade's Edge Mountains,30.77,31.59,50,0
>>击杀|cRXP_ENEMY_Wyrmcult|r. 掠夺其|cRXP_LOOT_衣物碎片|r
.collect 31121,3,10747,1 
.isOnQuest 10722
.mob Wyrmcult Acolyte
.mob Wyrmcult Blessed
.mob Wyrmcult Zealot
.mob Wyrmcult Scout
step
#completewith Scraps
.goto Blade's Edge Mountains,32.04,33.87,20 >>进入黑翼集会所
step
#optional
#completewith Kolphis
>>|cRXP_WARN_使用|r|T134325:0|t[黑色龙崽之网], |cRXP_WARN_目标: |r|cRXP_ENEMY_拜龙教黑色龙崽|r
>>|cRXP_WARN_你可以踩踏洞穴中的蛋来召唤更多|r|cRXP_ENEMY_拜龙教黑色龙崽|r
.complete 10747,1 
.use 31129
.isOnQuest 10747
.mob Wyrmcult Blackwhelp
step
#label Scraps
.goto Blade's Edge Mountains,32.25,34.77,30,0
.goto Blade's Edge Mountains,33.90,34.36,30,0
.goto Blade's Edge Mountains,31.55,36.03,40,0
.goto Blade's Edge Mountains,31.85,37.27,30,0
.goto Blade's Edge Mountains,32.25,34.77,30,0
.goto Blade's Edge Mountains,33.90,34.36,30,0
.goto Blade's Edge Mountains,31.55,36.03,40,0
.goto Blade's Edge Mountains,31.85,37.27,30,0
>>击杀|cRXP_ENEMY_Wyrmcult|r. 掠夺其|cRXP_LOOT_衣物碎片|r
>>|cRXP_WARN_如果需要, 你可以到外面获取更多|r
.collect 31121,5,10747,1 
.isOnQuest 10722
.mob Wyrmcult Acolyte
.mob Wyrmcult Blessed
.mob Wyrmcult Zealot
.mob Wyrmcult Scout
step
.use 31121 >>|cRXP_WARN_使用|r|T132911:0|t[衣物碎片] |cRXP_WARN_制作|r|T132760:0|t[工头伪装服]
.collect 31122,1,10747,1 
.isOnQuest 10722
step
.cast 38157 >>|cRXP_WARN_使用|r|T132760:0|t[工头伪装服]
.use 31122
.isOnQuest 10722
step
#label Kolphis
.goto Blade's Edge Mountains,32.66,37.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在洞穴尽头伪装后, 与|cRXP_FRIENDLY_库尔菲斯·暗鳞|r交谈
>>|cRXP_WARN_请注意, 伪装效果仅持续3分钟|r
.complete 10722,1 
.use 31122
.skipgossip
.isOnQuest 10722
.target Kolphis Darkscale
step
.goto Blade's Edge Mountains,33.62,37.14,30,0
.goto Blade's Edge Mountains,33.64,35.63,30,0
.goto Blade's Edge Mountains,33.92,34.33,30,0
.goto Blade's Edge Mountains,31.41,36.29,30,0
.goto Blade's Edge Mountains,33.62,37.14,30,0
.goto Blade's Edge Mountains,33.64,35.63,30,0
.goto Blade's Edge Mountains,33.92,34.33,30,0
.goto Blade's Edge Mountains,31.41,36.29
>>|cRXP_WARN_使用|r|T134325:0|t[黑色龙崽之网], |cRXP_WARN_目标: |r|cRXP_ENEMY_拜龙教黑色龙崽|r
>>|cRXP_WARN_你可以在不伪装的情况下踩踏洞穴中的蛋, 以生成更多|r|cRXP_ENEMY_黑色龙崽|r
.complete 10747,1 
.use 31129
.isOnQuest 10747
.mob Wyrmcult Blackwhelp
step
#completewith next
.hs >>传送至常青林
step
#questguide
>>返回常青林
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法维瑟中尉|r和|cRXP_FRIENDLY_指挥官海弗斯·石墙|r和|cRXP_FRIENDLY_坦莫|r和|cRXP_FRIENDLY_护树者查恩|r及|cRXP_FRIENDLY_萨米亚·因克林|r交谈
.turnin 10803 >>交任务: |cRXP_FRIENDLY_砾石营地的食人魔|r
.goto Blade's Edge Mountains,61.98,37.94
.target +Lieutenant Fairweather
.turnin 10802 >>交任务: |cRXP_FRIENDLY_食龙者高格鲁姆|r
.accept 10818 >>接任务: |cRXP_LOOT_萨博迈恩男爵的邀请|r
.goto Blade's Edge Mountains,61.98,37.98
.target +Commander Haephus Stonewall
.turnin 10607 >>交任务: |cRXP_FRIENDLY_乌鸦之神的低语|r
.goto Blade's Edge Mountains,62.16,39.11
.target +Timeon
.turnin 10722 >>交任务: |cRXP_FRIENDLY_黑翼集会所|r
.turnin 10825 >>交任务: |cRXP_FRIENDLY_神秘的宝珠|r
.accept 10748 >>接任务: |cRXP_LOOT_玛克纳尔必须死！|r
.accept 10829 >>接任务: |cRXP_LOOT_通知特维布尔|r
.goto Blade's Edge Mountains,61.97,39.47
.target +Tree Warden Chawn
.turnin 10747 >>交任务: |cRXP_FRIENDLY_拜龙教的龙崽|r
.goto Blade's Edge Mountains,61.94,39.45
.target +Samia Inkling
.maxlevel 66,bemend << !tbc
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法维瑟中尉|r和|cRXP_FRIENDLY_指挥官海弗斯·石墙|r和|cRXP_FRIENDLY_坦莫|r和|cRXP_FRIENDLY_护树者查恩|r及|cRXP_FRIENDLY_萨米亚·因克林|r交谈
.turnin 10803 >>交任务: |cRXP_FRIENDLY_砾石营地的食人魔|r
.goto Blade's Edge Mountains,61.98,37.94
.target +Lieutenant Fairweather
.turnin 10802 >>交任务: |cRXP_FRIENDLY_食龙者高格鲁姆|r

.goto Blade's Edge Mountains,61.98,37.98
.target +Commander Haephus Stonewall
.turnin 10607 >>交任务: |cRXP_FRIENDLY_乌鸦之神的低语|r
.goto Blade's Edge Mountains,62.16,39.11
.target +Timeon
.turnin 10722 >>交任务: |cRXP_FRIENDLY_黑翼集会所|r
.turnin 10825 >>交任务: |cRXP_FRIENDLY_神秘的宝珠|r


.goto Blade's Edge Mountains,61.97,39.47
.target +Tree Warden Chawn
.turnin 10747 >>交任务: |cRXP_FRIENDLY_拜龙教的龙崽|r
.goto Blade's Edge Mountains,61.94,39.45
.target +Samia Inkling
.maxlevel 66,bemend << !tbc
step
#completewith Signal
.goto Blade's Edge Mountains,61.68,39.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲恩·叶影|r交谈
.fly Toshley >>飞往托什雷的基地
.skill riding,300,1
.isQuestTurnedIn 10821
.target Fhyn Leafshadow
step
#questguide
>>前往托什雷的基地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔利·萨普纳波|r和|cRXP_FRIENDLY_晕乎乎的迪娜|r交谈
.turnin 10711 >>交任务: |cRXP_FRIENDLY_试飞：拉扎安码头|r
.goto Blade's Edge Mountains,60.28,68.39
.turnin 10671 >>交任务: |cRXP_FRIENDLY_不仅仅是一磅肉|r
.goto Blade's Edge Mountains,60.40,68.75
.maxlevel 66,bemend << !tbc
.target Tally Zapnabber
.target Dizzy Dina
step
#optional
#completewith Signal
.goto Blade's Edge Mountains,64.31,70.67
>>|cRXP_WARN_小心从托什雷的基地以东跳下, 抵达死亡之门|r
.cast 38782 >>|cRXP_WARN_使用|r|T135815:0|t[德鲁伊信号弹]|cRXP_WARN_在死亡之门召唤一名|cRXP_FRIENDLY_常青林德鲁伊|r|r
.timer 18,Druid Signal RP
.skill riding,225,1
.isOnQuest 10910
step
#completewith next
.goto Blade's Edge Mountains,64.31,70.67
.cast 38782 >>|cRXP_WARN_使用|r|T135815:0|t[德鲁伊信号弹]|cRXP_WARN_在死亡之门召唤一名|cRXP_FRIENDLY_常青林德鲁伊|r|r
.timer 18,Druid Signal RP
.skill riding,<225,1
.isOnQuest 10910
step
#label Signal
.goto Blade's Edge Mountains,64.31,70.67
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_常青林德鲁伊|r交谈
.turnin 10910 >>交任务: |cRXP_FRIENDLY_死亡之门|r
.accept 10904 >>接任务: |cRXP_LOOT_收集邪能炮弹|r
.use 31763
.isQuestTurnedIn 10821
.maxlevel 66,bemend << !tbc
.target Evergrove Druid
step
#loop
.line Blade's Edge Mountains,63.79,70.87,63.76,68.70,63.08,66.67,62.35,61.39,61.57,59.57,63.39,59.88,63.07,63.93,64.96,67.57,63.79,70.87
.goto Blade's Edge Mountains,63.79,70.87,45,0
.goto Blade's Edge Mountains,63.76,68.70,45,0
.goto Blade's Edge Mountains,63.08,66.67,45,0
.goto Blade's Edge Mountains,62.35,61.39,45,0
.goto Blade's Edge Mountains,61.57,59.57,45,0
.goto Blade's Edge Mountains,63.39,59.88,45,0
.goto Blade's Edge Mountains,63.07,63.93,45,0
.goto Blade's Edge Mountains,64.96,67.57,45,0
.goto Blade's Edge Mountains,63.79,70.87,45,0
>>击杀|cRXP_ENEMY_Deathforge|r和|cRXP_ENEMY_Death Demons|r, 掠夺他们的|cRXP_LOOT_炮弹|r
.complete 10904,1 
.isOnQuest 10904
.mob Death's Might
.mob Death's Watch
.mob Deathforge Over-Smith
.mob Deathforge Technician
step
#completewith next
.goto Blade's Edge Mountains,64.81,68.32,-1
.goto Blade's Edge Mountains,61.96,60.29,-1
.cast 38782 >>|cRXP_WARN_使用|r|T135815:0|t[德鲁伊信号弹]|cRXP_WARN_在死亡之门召唤一名|cRXP_FRIENDLY_常青林德鲁伊|r|r
.timer 18,Druid Signal RP
.isOnQuest 10904
step
.goto Blade's Edge Mountains,64.81,68.32,-1
.goto Blade's Edge Mountains,61.96,60.29,-1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_常青林德鲁伊|r交谈
.turnin 10904 >>交任务: |cRXP_FRIENDLY_收集邪能炮弹|r
.accept 10911 >>接任务: |cRXP_LOOT_开火！|r
.isQuestTurnedIn 10821
.maxlevel 66,bemend << !tbc
.target Evergrove Druid
step
>>|cRXP_WARN_使用|r|T136030:0|t[自然能量炮弹] |cRXP_WARN_来控制一个|r|cRXP_ENEMY_魔能炮|r
>>|cRXP_WARN_施放|r|T135803:0|t[曲速门上的炮台] (1)|cRXP_WARN_在防守的同时摧毁|cRXP_ENEMY_曲速门|r|r
.complete 10911,1 
.goto Blade's Edge Mountains,64.81,68.32,-1
.complete 10911,2 
.goto Blade's Edge Mountains,61.96,60.29,-1
.isOnQuest 10911
.isQuestTurnedIn 10821
.use 31807
step
#completewith next
.goto Blade's Edge Mountains,62.50,60.17
.cast 38782 >>|cRXP_WARN_使用|r|T135815:0|t[德鲁伊信号弹]|cRXP_WARN_在死亡之门召唤一名|cRXP_FRIENDLY_常青林德鲁伊|r|r
.timer 18,Druid Signal RP
.isOnQuest 10911
step
.goto Blade's Edge Mountains,62.50,60.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_常青林德鲁伊|r交谈
.turnin 10911 >>交任务: |cRXP_FRIENDLY_开火！|r
.accept 10912 >>接任务: |cRXP_LOOT_犬王|r
.isQuestTurnedIn 10821
.maxlevel 66,bemend << !tbc
.target Evergrove Druid
step
.goto Blade's Edge Mountains,63.62,59.11
.use 31809 >>|cRXP_WARN_使用|r|T133749:0|t[常青林魔杖] |cRXP_WARN_召唤 |cRXP_FRIENDLY_常青林古树|r. 他们将帮助你对抗|r|cRXP_ENEMY_犬王拜尔蒙|r
>>击杀|cRXP_ENEMY_犬王拜尔蒙|r
>>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r <<tbc/wotlk
.complete 10912,1 
.use 31809
.isQuestTurnedIn 10821
.isOnQuest 10912
.mob Baelmon the Hound-Master
step
#completewith HoundMaster
.goto Blade's Edge Mountains,61.15,70.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_里普·派兹拉姆|r交谈
.fly Evergrove >>飞往常青林
.cooldown item,6948,<0
.skill riding,225,1
.isQuestTurnedIn 10821
.target Rip Pedalslam
step
#optional
#completewith next
.hs >>传送至常青林
.cooldown item,6948,>2
.isQuestTurnedIn 10821
step
#label HoundMaster
.goto Blade's Edge Mountains,62.53,39.91,40,0
.goto Blade's Edge Mountains,62.00,40.21,40,0
.goto Blade's Edge Mountains,61.45,39.73,40,0
.goto Blade's Edge Mountains,61.28,38.77,40,0
.goto Blade's Edge Mountains,62.20,38.15,40,0
.goto Blade's Edge Mountains,62.69,39.13
.line Blade's Edge Mountains,62.53,39.91,62.00,40.21,61.45,39.73,61.28,38.77,62.20,38.15,62.69,39.13,62.53,39.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_荒野之王安塔里恩|r, 他正以逆时针方向在城镇周围巡逻
.turnin 10912 >>交任务: |cRXP_FRIENDLY_犬王|r
.isQuestComplete 10912
.maxlevel 66,bemend << !tbc
.target Wildlord Antelarion
step
.abandon 10912 >>放弃犬王
step << skip
.goto Blade's Edge Mountains,60.3,68.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔利·萨普纳波|r交谈
.accept 10712 >>接任务: |cRXP_LOOT_试飞：卢安荒野|r
.target Tally Zapnabber
step << skip
.goto Blade's Edge Mountains,60.2,68.8
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔利·萨普纳波|r交谈, 即可传送至鲁安·韦尔德
.complete 10712,1 
>>重要提示:在飞行过程中使用背包中的物品
.complete 10712,2 
.target Tally Zapnabber
step << skip
.goto Blade's Edge Mountains,62.7,40.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_O'Mally Zapnabber|r交谈
.turnin 10712 >>交任务: |cRXP_FRIENDLY_试飞：卢安荒野|r
.target O'Mally Zapnabber
step
#questguide
#label Treebole
.goto Blade's Edge Mountains,37.1,22.2
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特维布尔|r交谈
.turnin 10829 >>交任务: |cRXP_FRIENDLY_通知特维布尔|r
.accept 10830 >>接任务: |cRXP_LOOT_树人的驱魔|r
.maxlevel 66,bemend << !tbc
.target Treebole
step
#questguide
#completewith leafbeardE
.goto Blade's Edge Mountains,34.3,19.8
.goto Blade's Edge Mountains,40.3,23.0,0
.goto Blade's Edge Mountains,40.0,22.8,0
.goto Blade's Edge Mountains,40.2,20.6,0
.goto Blade's Edge Mountains,39.3,17.4,0
.goto Blade's Edge Mountains,41.3,21.9,0
>>击杀|r|cRXP_ENEMY_恶鸦|r. 从它们身上搜刮|r|cRXP_LOOT_翎羽|r
>>拾取地面上的格里施纳鸦人宝珠
.collect 31495,5 
.collect 31517,5 
.maxlevel 66,bemend << !tbc
.mob Dire Raven
step
#questguide
#label leafbeardE
.goto Blade's Edge Mountains,34.3,19.8
>>|cRXP_WARN_使用|r|T136210:0|t[格里施纳鸦人宝珠]|cRXP_WARN_和|r|T132915:0|t[恐怖绒毛]|cRXP_WARN_制作一个|r|T132920:0|t[驱魔羽毛]
>>|cRXP_WARN_将它们用在|r |cRXP_ENEMY_乌鸦林的叶须族身上|r
>>|cRXP_WARN_在你杀死|cRXP_ENEMY_柯柯的灵魂|r后, |cRXP_ENEMY_乌鸦林叶须族|r将变为友善|r
.use 31518
.use 31495
.complete 10830,1 
.maxlevel 66,bemend << !tbc
.mob Raven's Wood Leafbeard
.mob Koi-Koi Spirit
step
#questguide
.goto Blade's Edge Mountains,37.1,22.2
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_特维布尔|r交谈
.turnin 10830 >>交任务: |cRXP_FRIENDLY_树人的驱魔|r
.maxlevel 66,bemend << !tbc
.target Treebole
step
#questguide
.goto Blade's Edge Mountains,33.7,35.9
>>跑到黑翼集会所的后面
>>击杀|cRXP_ENEMY_灰烬之喉玛克纳尔|r
.complete 10748,1 
.maxlevel 66,bemend << !tbc
.mob Maxnar the Ashmaw
step
#questguide
.goto Blade's Edge Mountains,62.0,39.5
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与护树者查恩交谈|cRXP_FRIENDLY_护树者查恩|r
.turnin 10748 >>交任务: |cRXP_FRIENDLY_玛克纳尔必须死！|r
.maxlevel 66,bemend << !tbc
.target Tree Warden Chawn
step
#label bemend
step << !tbc !wotlk
#xprate >1.59
#optional
#label endOfTheGuide
]])
RXPGuides.RegisterGuide([[
#version 9
#cata
#mop
#wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 67-68 虚空风暴
#version 9
#displayname 67-69 虚空风暴 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << !tbc !wotlk
#displayname 67-68 虚空风暴 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 69-70 影月谷(奥尔多) << TBC
#next RestedXP 熊猫人之谜 60-80 (联盟)\68-71 怒嚎峡湾；RestedXP 熊猫人之谜 60-80 (联盟)\71-73 北风苔原 << !TBC
#xprate <1.6 << !tbc !wotlk
step
#include RXPGuides\67-68 虚空风暴
]])
RXPGuides.RegisterGuide([[
#version 9
#cata
#mop
#wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 67-67 刀锋山任务交还
#displayname 67-67 刀锋山任务交还 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 9
#next 67-68 奈瑟风暴；71-73 北风苔原
#defaultfor !tbc
step
+由于你当前等级已达67级(或更高), 且已完成刀锋山的所有当前任务目标, 向导将先完成所有剩余任务, 再送你前往虚空风暴
*Click the box here to begin this process
.isQuestAvailable 10912
.xp 67,1

step
#optional
#completewith HoundMaster
.goto Shattrath City,64.05,41.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努特拉尔|r交谈
.fly Telredor >>飞往泰雷多尔
.zoneskip Nagrand
.zoneskip Zangarmarsh
.skill riding,300,1
.target Nutral
step
#questguide << !tbc
.goto Zangarmarsh,68.3, 49.4
>>返回泰雷多尔
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_学者安霍尔|r交谈
.turnin 9801 >>交任务: |cRXP_FRIENDLY_收集材料|r
.isQuestComplete 9801
.target Anchorite Ahuurn
step
#optional
#completewith HoundMaster
.goto Shattrath City,64.05,41.12,-1
.goto Zangarmarsh,67.83,51.46,-1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_努特拉尔|r或|cRXP_FRIENDLY_蒙希|r交谈
>>|cRXP_WARN_箭头会指引你前往最近的飞行大师|r
.fly Orebor Harborage >>飞往奥雷柏尔营地
.skill riding,300,1
.target Nutral
.target Munci
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基亚隆·夜刃|r交谈
.turnin 9794 >>交任务: |cRXP_FRIENDLY_禁止拆阅|r
.goto Blade's Edge Mountains,35.97,67.76,30,0
.goto Blade's Edge Mountains,36.61,67.34
.isQuestComplete 9794
.target Kialon Nightblade
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官萨卡斯·天影|r交谈
.turnin 10927 >>交任务: |cRXP_FRIENDLY_消灭洞穴蛛|r
.goto Blade's Edge Mountains,36.28,66.24
.isQuestComplete 10927
.target Commander Skyshadow
step
.goto Blade's Edge Mountains,34.31,77.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与树平台上的|cRXP_FRIENDLY_Tome|r交谈
.turnin 10555 >>交任务: |cRXP_FRIENDLY_诡异的魔法|r
.isQuestComplete 10555
step
#completewith next
.goto Blade's Edge Mountains,35.23,77.31
.cast 36904 >>在召唤圈中使用背包里的|T132926:0|t[一把羽毛]
.use 30530
.isOnQuest 10556
step
.goto Blade's Edge Mountains,37.07,65.62
>>使用 |T132926:0|t羽毛后, 一只|cRXP_FRIENDLY_小型鸟类伙伴|r将跟随在你身边
>>|cRXP_WARN_请注意|r, 如果你骑着坐骑跑开, |cRXP_FRIENDLY_鸟|r将无法跟上你
>>护送|cRXP_FRIENDLY_Bird|r返回|cRXP_FRIENDLY_达兰妮尔|r
.complete 10556,1 
.isOnQuest 10556
.target Daranelle
step
#label Scratches
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达兰妮尔|r交谈
.turnin 10556 >>交任务: |cRXP_FRIENDLY_潦草的字迹|r
.goto Blade's Edge Mountains,37.07,65.62
.isQuestComplete 10556
.target Daranelle
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉娜·月泉|r交谈
.turnin 10455 >>交任务: |cRXP_FRIENDLY_危险的荒野|r
.goto Blade's Edge Mountains,36.21,67.13
.isQuestComplete 10455
.target Rina Moonspring
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官萨卡斯·天影|r交谈
.turnin 10690 >>交任务: |cRXP_FRIENDLY_兽穴之母|r
.goto Blade's Edge Mountains,36.28,66.24
.isQuestComplete 10690
.target Commander Skyshadow
step
#label SylHS
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉娜·月泉|r交谈
.turnin 10456 >>交任务: |cRXP_FRIENDLY_徘徊的恶狼|r
.goto Blade's Edge Mountains,36.21,67.13
.isQuestComplete 10456
.target Rina Moonspring
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉娜·月泉|r交谈
.turnin 10457 >>交任务: |cRXP_FRIENDLY_自我保护|r
.isQuestComplete 10457
.target Rina Moonspring
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉娜·月泉|r交谈
.turnin 10506 >>交任务: |cRXP_FRIENDLY_严峻的形势|r
.goto Blade's Edge Mountains,36.21,67.13
.isQuestComplete 10506
.target Rina Moonspring
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官萨卡斯·天影|r交谈
.turnin 10502 >>交任务: |cRXP_FRIENDLY_血槌食人魔|r
.goto Blade's Edge Mountains,36.28,66.24
.isQuestComplete 10502
.target Commander Skyshadow
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布隆薇·硬锤|r交谈
.turnin 10510 >>交任务: |cRXP_FRIENDLY_进入德拉诺晶矿|r
.goto Blade's Edge Mountains,37.41,65.05
.isQuestComplete 10510
.target Bronwyn Stouthammer
step
#label Borgrim2
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯格瑞姆·硬锤|r交谈
.turnin 10511 >>交任务: |cRXP_FRIENDLY_奇怪的美酒|r
.goto Blade's Edge Mountains,37.40,64.66
.isQuestComplete 10511
.target Borgrim Stouthammer
step
.goto Blade's Edge Mountains,44.01,51.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官乌里恩|r交谈
.turnin 10516 >>交任务: |cRXP_FRIENDLY_守备官的困境|r
.accept 10517 >>接任务: |cRXP_LOOT_高尔迪姆，你完蛋了......|r
.isQuestComplete 10516
.target Vindicator Vuuleen
step
.goto Blade's Edge Mountains,44.01,51.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官乌里恩|r交谈
.accept 10517 >>接任务: |cRXP_LOOT_高尔迪姆，你完蛋了......|r
.isQuestTurnedIn 10516
.target Vindicator Vuuleen
step
.goto Blade's Edge Mountains,39.38,49.06
>>击杀离门最近的两个食人魔, 然后使用背包中的[蛮力桶]引开戈尔迪姆, 使其远离精英守卫. 随后击杀他
.complete 10517,1 
.isOnQuest 10517
.mob Bladespire Shaman
.mob Bladespire Brute
.mob Gorr'Dim
step
.goto Blade's Edge Mountains,44.01,51.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守备官乌里恩|r交谈
.turnin 10517 >>交任务: |cRXP_FRIENDLY_高尔迪姆，你完蛋了......|r
.isQuestComplete 10517
.target Vindicator Vuuleen
step
#completewith BorgrimT
.hs >>炉石到希尔瓦娜斯
.cooldown item,6948,>2
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官萨卡斯·天影|r交谈
.turnin 10504 >>交任务: |cRXP_FRIENDLY_刀塔食人魔|r
.goto Blade's Edge Mountains,36.28,66.24
.isQuestComplete 10504
.target Commander Skyshadow
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官萨卡斯·天影|r交谈
.turnin 10518 >>交任务: |cRXP_FRIENDLY_插旗子|r
.goto Blade's Edge Mountains,36.28,66.24
.isQuestComplete 10518
.target Commander Skyshadow
step
#label BorgrimT
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伯格瑞姆·硬锤|r交谈
.turnin 10512 >>交任务: |cRXP_FRIENDLY_灌醉刀塔食人魔|r
.goto Blade's Edge Mountains,37.40,64.66
.isQuestComplete 10512
.target Borgrim Stouthammer
step
.goto Blade's Edge Mountains,55.11,72.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|R-3D0|r交谈
.turnin 10580 >>交任务: |cRXP_FRIENDLY_侏儒都去哪里了？|r
.accept 10581 >>接任务: |cRXP_LOOT_废话连篇|r
.isQuestComplete 10580
.target R-3D0
step
.goto Blade's Edge Mountains,55.11,72.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|R-3D0|r交谈
.accept 10581 >>接任务: |cRXP_LOOT_废话连篇|r
.isQuestTurnedIn 10580
.target R-3D0
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托什雷|r交谈
.turnin 10581 >>交任务: |cRXP_FRIENDLY_废话连篇|r
.goto Blade's Edge Mountains,60.53,68.97
.isQuestComplete 10581
.target Toshley
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔利·萨普纳波|r交谈
.turnin 10557 >>交任务: |cRXP_FRIENDLY_试飞：风动电容器|r
.goto Blade's Edge Mountains,60.28,68.39
.isQuestComplete 10557
.target Tally Zapnabber
step
#label ToshStation
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托什雷|r交谈
.turnin 10584 >>交任务: |cRXP_FRIENDLY_能量转换器|r
.goto Blade's Edge Mountains,60.53,68.97
.isQuestComplete 10584
.target Toshley
step
#completewith CrystalClear
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在巡逻站台的|cRXP_FRIENDLY_拉沙克·铁墙|r交谈
.turnin 10632 >>交任务: |cRXP_FRIENDLY_锋利的牙齿|r
.isQuestComplete 10632
.target Razak Ironsides
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_测量者尼克维克|r谈话
.turnin 10608 >>交任务: |cRXP_FRIENDLY_水晶剥石者的麻烦|r
.goto Blade's Edge Mountains,60.22,68.94
.isQuestComplete 10608
.target Nickwinkle the Metro-Gnome
step
#label CrystalClear
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_晕乎乎的迪娜|r交谈
.turnin 10620 >>交任务: |cRXP_FRIENDLY_山脊上的危险|r
.goto Blade's Edge Mountains,60.40,68.75
.isQuestComplete 10620
.target Dizzy Dina
step
.goto Blade's Edge Mountains,59.99,69.32,30,0
.goto Blade's Edge Mountains,60.28,68.98,30,0
.goto Blade's Edge Mountains,60.11,68.37,30,0
.goto Blade's Edge Mountains,59.81,68.29,30,0
.goto Blade's Edge Mountains,60.03,67.79,30,0
.goto Blade's Edge Mountains,60.31,68.23,30,0
.goto Blade's Edge Mountains,60.42,67.91,30,0
.goto Blade's Edge Mountains,60.54,68.76,30,0
.goto Blade's Edge Mountains,60.44,69.37
.line Blade's Edge Mountains,59.99,69.32,60.28,68.98,60.11,68.37,59.81,68.29,60.03,67.79,60.31,68.23,60.42,67.91,60.54,68.76,60.44,69.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与正在巡逻站台的|cRXP_FRIENDLY_拉沙克·铁墙|r交谈
.turnin 10632 >>交任务: |cRXP_FRIENDLY_锋利的牙齿|r
.isQuestComplete 10632
.target Razak Ironsides
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_测量者尼克维克|r谈话
.turnin 10594 >>交任务: |cRXP_FRIENDLY_测量振荡频率|r
.goto Blade's Edge Mountains,60.22,68.94
.isQuestComplete 10594
.target Nickwinkle the Metro-Gnome
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔利·萨普纳波|r交谈
.turnin 10710 >>交任务: |cRXP_FRIENDLY_试飞：晶歌山脉|r
.goto Blade's Edge Mountains,60.28,68.39
.isQuestComplete 10710
.target Tally Zapnabber
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹特·表针|r交谈
.turnin 10609 >>交任务: |cRXP_FRIENDLY_先有龙还是先有蛋？|r
.goto Blade's Edge Mountains,60.98,68.11
.isQuestComplete 10609
.target Fizit "Doc" Clocktock
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法拉蒂拉|r交谈
.turnin 10753 >>交任务: |cRXP_FRIENDLY_清理荒野|r
.goto Blade's Edge Mountains,62.56,38.23
.isQuestComplete 10753
.target Faradrella
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古树莫斯伍德|r交谈
.turnin 10770 >>交任务: |cRXP_FRIENDLY_灰烬中的小鬼|r
.goto Blade's Edge Mountains,61.25,38.46
.isQuestComplete 10770
.target Mosswood the Ancient
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古树莫斯伍德|r交谈
.turnin 10771 >>交任务: |cRXP_FRIENDLY_灰烬中的新生|r
.goto Blade's Edge Mountains,61.25,38.46
.isQuestComplete 10771
.target Mosswood the Ancient
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_O'Mally Zapnabber|r交谈
.turnin 10810 >>交任务: |cRXP_FRIENDLY_损坏的面具|r
.accept 10812 >>接任务: |cRXP_LOOT_神秘的面具|r
.goto Blade's Edge Mountains,62.66,40.38
.isQuestComplete 10810
.target O'Mally Zapnabber
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_O'Mally Zapnabber|r交谈
.accept 10812 >>接任务: |cRXP_LOOT_神秘的面具|r
.goto Blade's Edge Mountains,62.66,40.38
.isQuestTurnedIn 10810
.target O'Mally Zapnabber
step
.goto Blade's Edge Mountains,62.53,39.91,40,0
.goto Blade's Edge Mountains,62.00,40.21,40,0
.goto Blade's Edge Mountains,61.45,39.73,40,0
.goto Blade's Edge Mountains,61.28,38.77,40,0
.goto Blade's Edge Mountains,62.20,38.15,40,0
.goto Blade's Edge Mountains,62.69,39.13
.line Blade's Edge Mountains,62.53,39.91,62.00,40.21,61.45,39.73,61.28,38.77,62.20,38.15,62.69,39.13,62.53,39.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_荒野之王安塔里恩|r, 他正以逆时针方向在城镇周围巡逻
.turnin 10812 >>交任务: |cRXP_FRIENDLY_神秘的面具|r
.isQuestComplete 10812
.target Wildlord Antelarion
step
.goto Blade's Edge Mountains,62.53,39.91,40,0
.goto Blade's Edge Mountains,62.00,40.21,40,0
.goto Blade's Edge Mountains,61.45,39.73,40,0
.goto Blade's Edge Mountains,61.28,38.77,40,0
.goto Blade's Edge Mountains,62.20,38.15,40,0
.goto Blade's Edge Mountains,62.69,39.13
.line Blade's Edge Mountains,62.53,39.91,62.00,40.21,61.45,39.73,61.28,38.77,62.20,38.15,62.69,39.13,62.53,39.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_荒野之王安塔里恩|r, 他正以逆时针方向在城镇周围巡逻
.accept 10819 >>接任务: |cRXP_LOOT_魔誓防毒面具|r
.isQuestTurnedIn 10812
.target Wildlord Antelarion
step
#completewith next
.cast 38448 >>在你的背包中装备 |T133133:0|t[魔誓防毒面具], 以便能够与 |cRXP_FRIENDLY_军团联络器|r交谈

step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与携带|cRXP_FRIENDLY_Legion Communicator|r的军团联络器交谈, 并确保你已装备|T133133:0|t[魔誓防毒面具]
.goto Blade's Edge Mountains,73.27,40.03
.turnin 10819 >>交任务: |cRXP_FRIENDLY_魔誓防毒面具|r
.isQuestComplete 10819

step
#completewith next
.cast 38448 >>在你的背包中装备 |T133133:0|t[魔誓防毒面具], 以便能够与 |cRXP_FRIENDLY_军团联络器|r交谈

step
.goto Blade's Edge Mountains,73.27,40.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与携带|cRXP_FRIENDLY_Legion Communicator|r的军团联络器交谈, 并确保你已装备|T133133:0|t[魔誓防毒面具]
.turnin 10820 >>交任务: |cRXP_FRIENDLY_欺骗敌人|r
.isQuestComplete 10820

step
#completewith Nuaar
.hs >>传送至常青林
.cooldown item,6948,>2
step
.goto Blade's Edge Mountains,62.53,39.91,40,0
.goto Blade's Edge Mountains,62.00,40.21,40,0
.goto Blade's Edge Mountains,61.45,39.73,40,0
.goto Blade's Edge Mountains,61.28,38.77,40,0
.goto Blade's Edge Mountains,62.20,38.15,40,0
.goto Blade's Edge Mountains,62.69,39.13
.line Blade's Edge Mountains,62.53,39.91,62.00,40.21,61.45,39.73,61.28,38.77,62.20,38.15,62.69,39.13,62.53,39.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_荒野之王安塔里恩|r, 他正以逆时针方向在城镇周围巡逻
.turnin 10821 >>交任务: |cRXP_FRIENDLY_你玩完了！|r
.isQuestComplete 10821
.target Wildlord Antelarion
step
#label Nuaar
.line Blade's Edge Mountains,62.82,25.94,63.12,27.41,63.34,27.87,63.28,28.37,62.73,28.77,62.45,29.31,62.37,29.65,62.44,31.66,62.11,33.34,61.80,34.00,61.43,34.10,60.61,33.98,60.12,34.47,60.01,34.80,60.08,35.15,59.90,35.72,59.60,36.07,59.11,36.21,58.96,36.61,58.65,36.91,58.18,36.96,57.90,37.34,57.84,37.81,59.13,39.47,59.90,40.27,60.51,40.90,61.50,42.02,61.78,42.41,62.62,43.95,62.97,45.05,63.06,46.38
63.06,46.38
.goto Blade's Edge Mountains,63.06,46.38,60,0
.goto Blade's Edge Mountains,62.97,45.05,60,0
.goto Blade's Edge Mountains,62.62,43.95,60,0
.goto Blade's Edge Mountains,61.78,42.41,60,0
.goto Blade's Edge Mountains,61.50,42.02,60,0
.goto Blade's Edge Mountains,60.51,40.90,60,0
.goto Blade's Edge Mountains,59.90,40.27,60,0
.goto Blade's Edge Mountains,59.13,39.47,60,0
.goto Blade's Edge Mountains,57.84,37.81,60,0
.goto Blade's Edge Mountains,57.90,37.34,60,0
.goto Blade's Edge Mountains,58.18,36.96,60,0
.goto Blade's Edge Mountains,58.65,36.91,60,0
.goto Blade's Edge Mountains,58.96,36.61,60,0
.goto Blade's Edge Mountains,59.11,36.21,60,0
.goto Blade's Edge Mountains,59.60,36.07,60,0
.goto Blade's Edge Mountains,59.90,35.72,60,0
.goto Blade's Edge Mountains,60.08,35.15,60,0
.goto Blade's Edge Mountains,60.01,34.80,60,0
.goto Blade's Edge Mountains,60.12,34.47,60,0
.goto Blade's Edge Mountains,60.61,33.98,60,0
.goto Blade's Edge Mountains,61.80,34.00,60,0
.goto Blade's Edge Mountains,62.11,33.34,60,0
.goto Blade's Edge Mountains,62.44,31.66,60,0
.goto Blade's Edge Mountains,62.37,29.65,60,0
.goto Blade's Edge Mountains,62.45,29.31,60,0
.goto Blade's Edge Mountains,62.73,28.77,60,0
.goto Blade's Edge Mountains,63.28,28.37,60,0
.goto Blade's Edge Mountains,63.34,27.87,60,0
.goto Blade's Edge Mountains,63.12,27.41,60,0
.goto Blade's Edge Mountains,62.82,25.94
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头努埃尔|r交谈
>>他巡逻卢安荒野的蛇教营地
.complete 10682,1 
.unitscan Overseer Nuaar
.skipgossip
.isOnQuest 10682
step
>>返回艾弗格罗夫. 与查恩交谈
.turnin 10682 >>交任务: |cRXP_FRIENDLY_该谈判了......|r
.goto Blade's Edge Mountains,61.97,39.47
.isQuestComplete 10682
.target Tree Warden Chawn
step
>>返回常青林
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官海弗斯·石墙|r交谈
.turnin 10795 >>交任务: |cRXP_FRIENDLY_多古克|r
.goto Blade's Edge Mountains,61.98,37.98
.isQuestComplete 10795
.target Commander Haephus Stonewall
step
>>返回常青林
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官海弗斯·石墙|r交谈
.turnin 10797 >>交任务: |cRXP_FRIENDLY_戈隆的信物|r
.goto Blade's Edge Mountains,61.98,37.98
.isQuestComplete 10797
.target Commander Haephus Stonewall
step
>>返回常青林
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法维瑟中尉|r交谈
.turnin 10796 >>交任务: |cRXP_FRIENDLY_踏平血槌营地！|r
.goto Blade's Edge Mountains,61.98,37.94
.isQuestComplete 10796
.target Lieutenant Fairweather
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_坦莫|r交谈
.turnin 10567 >>交任务: |cRXP_FRIENDLY_制造坠饰|r
.goto Blade's Edge Mountains,62.16,39.11
.isQuestComplete 10567
.target Timeon
step
.goto Blade's Edge Mountains,61.97,39.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护树者查恩|r和|cRXP_FRIENDLY_萨米亚·因克林|r交谈
.turnin 10713 >>交任务: |cRXP_FRIENDLY_......谈判不成就动手！|r
.isQuestComplete 10713
.target Tree Warden Chawn
step
.goto Blade's Edge Mountains,61.97,39.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与护树者查恩交谈|cRXP_FRIENDLY_护树者查恩|r
.turnin 10719 >>交任务: |cRXP_FRIENDLY_你拿到记录了吗？|r
.target Tree Warden Chawn
.isQuestComplete 10719
step
.goto Blade's Edge Mountains,61.94,39.45
.turnin 10717 >>交任务: |cRXP_FRIENDLY_偷猎|r
.isQuestComplete 10717
.target Samia Inkling
step
.goto Blade's Edge Mountains,53.25,41.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨博迈恩男爵|r交谈
.turnin 10798 >>交任务: |cRXP_FRIENDLY_拜访男爵|r
.isQuestComplete 10798
.target Baron Sablemane
step
.goto Blade's Edge Mountains,53.25,41.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨博迈恩男爵|r交谈
.turnin 10799 >>交任务: |cRXP_FRIENDLY_进入沸土峡谷|r
.isQuestComplete 10799
.target Baron Sablemane
step
.goto Blade's Edge Mountains,53.25,41.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨博迈恩男爵|r交谈
.turnin 10800 >>交任务: |cRXP_FRIENDLY_晚安，戈隆|r
.isQuestComplete 10800
.target Baron Sablemane
step
#label Evergrove3
>>返回常青林
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官海弗斯·石墙|r交谈
.turnin 10801 >>交任务: |cRXP_FRIENDLY_这是个陷阱！|r
.goto Blade's Edge Mountains,61.98,37.98
.isQuestComplete 10801
.target Commander Haephus Stonewall
step
.goto Blade's Edge Mountains,50.35,36.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与桥上的|cRXP_FRIENDLY_观察者希德·月影|r交谈
.turnin 10894 >>交任务: |cRXP_FRIENDLY_龙颅观察者|r
.isQuestComplete 10894
.target Watcher Moonshade
step
.goto Blade's Edge Mountains,50.35,36.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与桥上的|cRXP_FRIENDLY_观察者希德·月影|r交谈
.accept 10893 >>接任务: |cRXP_LOOT_德莱卡·长尾|r
.isQuestTurnedIn 10894
.target Watcher Moonshade
step
>>击杀隧道内的|cRXP_ENEMY_Draaca|r
.goto Blade's Edge Mountains,46.03,32.93,40,0
.goto Blade's Edge Mountains,45.81,32.90,40,0
.goto Blade's Edge Mountains,44.78,32.07
.complete 10893,1 
.unitscan Draaca Longtail
.isOnQuest 10893
step
.goto Blade's Edge Mountains,49.92,35.92,20,0
.goto Blade's Edge Mountains,50.35,36.01
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_观察者希德·月影|r交谈
.turnin 10893 >>交任务: |cRXP_FRIENDLY_德莱卡·长尾|r
.isQuestComplete 10893
.target Watcher Moonshade
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法维瑟中尉|r交谈
.turnin 10803 >>交任务: |cRXP_FRIENDLY_砾石营地的食人魔|r
.goto Blade's Edge Mountains,61.98,37.94
.isQuestComplete 10803
.target Lieutenant Fairweather
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官海弗斯·石墙|r交谈
.turnin 10802 >>交任务: |cRXP_FRIENDLY_食龙者高格鲁姆|r
.goto Blade's Edge Mountains,61.98,37.98
.isQuestComplete 10802
.target Commander Haephus Stonewall
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_坦莫|r交谈
.turnin 10607 >>交任务: |cRXP_FRIENDLY_乌鸦之神的低语|r
.goto Blade's Edge Mountains,62.16,39.11
.isQuestComplete 10607
.target Timeon
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与护树者查恩交谈|cRXP_FRIENDLY_护树者查恩|r
.turnin 10722 >>交任务: |cRXP_FRIENDLY_黑翼集会所|r
.goto Blade's Edge Mountains,61.97,39.47
.isQuestComplete 10722
.target Tree Warden Chawn
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与护树者查恩交谈|cRXP_FRIENDLY_护树者查恩|r
.turnin 10825 >>交任务: |cRXP_FRIENDLY_神秘的宝珠|r
.goto Blade's Edge Mountains,61.97,39.47
.isQuestComplete 10825
.target Tree Warden Chawn
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨米亚·因克林|r交谈
.turnin 10747 >>交任务: |cRXP_FRIENDLY_拜龙教的龙崽|r
.goto Blade's Edge Mountains,61.94,39.45
.isQuestComplete 10747
.target Samia Inkling
step
#completewith next
.goto Blade's Edge Mountains,64.81,68.32,-1
.goto Blade's Edge Mountains,61.96,60.29,-1
.cast 38782 >>使用背包中的 |T135815:0|t[德鲁伊信号弹] 召唤一名|cRXP_FRIENDLY_常青林德鲁伊|r
.timer 18,Druid Signal RP
.isQuestComplete 10904
step
.goto Blade's Edge Mountains,64.81,68.32,-1
.goto Blade's Edge Mountains,61.96,60.29,-1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_常青林德鲁伊|r交谈
.turnin 10904 >>交任务: |cRXP_FRIENDLY_收集邪能炮弹|r
.isQuestComplete 10904
.target Evergrove Druid
step
#completewith next
.goto Blade's Edge Mountains,62.50,60.17
.cast 38782 >>使用背包中的 |T135815:0|t[德鲁伊信号弹] 召唤一名|cRXP_FRIENDLY_常青林德鲁伊|r
.timer 18,Druid Signal RP
.isOnQuest 10911
step
.goto Blade's Edge Mountains,62.50,60.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_常青林德鲁伊|r交谈
.turnin 10911 >>交任务: |cRXP_FRIENDLY_开火！|r
.accept 10912 >>接任务: |cRXP_LOOT_犬王|r
.isQuestTurnedIn 10821
.target Evergrove Druid
step
#completewith next
.goto Blade's Edge Mountains,63.62,59.11
.use 31809 >>使用背包中的 |T133749:0|t[常青林魔杖] 召唤|cRXP_FRIENDLY_常青林先祖|r, 他们将协助你对抗|cRXP_ENEMY_贝阿尔蒙|r
>>击杀|cRXP_ENEMY_Baelmon|r
.isOnQuest 10912
.mob Baelmon the Hound-Master
step
.goto Blade's Edge Mountains,63.62,59.11
>>击杀|cRXP_ENEMY_犬王拜尔蒙|r. 此任务难度较高, 建议组队完成. 若无法组队或选择单刷, 可跳过此步骤
.complete 10912,1 
.use 31809
.isQuestTurnedIn 10821
.isOnQuest 10912
.target Baelmon the Hound-Master
step
#label HoundMaster
.goto Blade's Edge Mountains,62.53,39.91,40,0
.goto Blade's Edge Mountains,62.00,40.21,40,0
.goto Blade's Edge Mountains,61.45,39.73,40,0
.goto Blade's Edge Mountains,61.28,38.77,40,0
.goto Blade's Edge Mountains,62.20,38.15,40,0
.goto Blade's Edge Mountains,62.69,39.13
.line Blade's Edge Mountains,62.53,39.91,62.00,40.21,61.45,39.73,61.28,38.77,62.20,38.15,62.69,39.13,62.53,39.91
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话|cRXP_FRIENDLY_荒野之王安塔里恩|r, 他正以逆时针方向在城镇周围巡逻
.turnin 10912 >>交任务: |cRXP_FRIENDLY_犬王|r
.isQuestComplete 10912
.target Wildlord Antelarion
step
.abandon 10912 >>放弃犬王
step << !tbc !wotlk !Mage
#xprate >1.59
#completewith next
.zone Shattrath City >>前往: |cRXP_PICK_沙塔斯城|r
step << !tbc !wotlk
#xprate >1.59
.goto Shattrath City,57.217,48.257
.zone 84 >>前往: |cRXP_PICK_暴风城|r City << !Mage
.zone 84 >>前往: |cRXP_PICK_暴风城|r << Mage
]])
RXPGuides.RegisterGuide([[
#version 9
#cata
#mop
#wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 71-73 北风苔原
#version 9
#displayname 69-73 北风苔原 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << !wotlk
#displayname 71-73 北风苔原 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r << wotlk
#next 72-74 龙骨荒野；73-75 灰熊丘陵 << wotlk
#next 73-74 龙骨荒野；77-78 索拉查盆地 << !wotlk
step
.goto 1453/0,1407.6,-8291.2 << !wotlk
.goto StormwindNew,43.5,52.7,70,0 << wotlk
.goto StormwindNew,18.47,26.49 << wotlk
>>前往暴风城港口
.zone BoreanTundra >>乘船前往北风苔原 << !wotlk
.zone BoreanTundra >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丽莎|r谈话, 请求她传送你前往无畏要塞 << wotlk
.skipgossip << wotlk
.target Leesha Tannerby << wotlk
step
#completewith enlist
.goto BoreanTundra,58.97,68.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师托马斯|r交谈
.fp Valiance Keep >>获取无畏要塞的飞行路径
.target Tomas Riverwell
step
#completewith Hawthorn5
.groundgoto BoreanTundra,58.5,68.3,15,0
.goto BoreanTundra,58.29,68.05
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内|cRXP_FRIENDLY_詹姆斯|r交谈
.home >>将你的炉石设置为无畏要塞
>>|cRXP_BUY_如果需要, 购买新的食物或水|r
.target James Deacon
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_征募官布莱瑟|r和|cRXP_FRIENDLY_罗里克·玛克雷尔|r交谈
.accept 11672 >>接任务: |cRXP_LOOT_应征入伍|r
.goto BoreanTundra,57.85,67.60
.accept 13088 >>接任务: |cRXP_LOOT_诺森德的厨师|r
.goto BoreanTundra,57.93,71.54
.skill cooking,<350,1
.target Recruitment Officer Blythe
.target Rollick MacKreel
step
#label enlist
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_征募官布莱瑟|r交谈
.accept 11672 >>接任务: |cRXP_LOOT_应征入伍|r
.goto BoreanTundra,57.85,67.60
.target Recruitment Officer Blythe
step
#optional
#completewith next
.goto BoreanTundra,57.1,71.8,15,0
.goto BoreanTundra,57.2,72.3,15,0
.goto BoreanTundra,56.67,72.64,10 >>进入要塞
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿洛斯将军|r交谈
.turnin 11672 >>交任务: |cRXP_FRIENDLY_应征入伍|r
.accept 11727 >>接任务: |cRXP_LOOT_英雄的时代|r
.goto BoreanTundra,56.67,72.64
.target General Arlos
step
#completewith next
.goto BoreanTundra,56.87,71.29,20 >>离开要塞
step
.goto 114/571,5321.100,2223.300
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈默希尔中士|r交谈
.target Sergeant Hammerhill
.turnin 11727 >>交任务: |cRXP_FRIENDLY_英雄的时代|r
.accept 11797 >>接任务: |cRXP_LOOT_虫临城下|r
step
.goto 114/571,5400.100,2248.800
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_医师哈索恩|r交谈
.target Medic Hawthorn
.accept 11789 >>接任务: |cRXP_LOOT_急需帮助的士兵|r
step
.goto BoreanTundra,53.5,69.1,70,0
.goto BoreanTundra,53.1,72.8,60,0
.goto BoreanTundra,52.29,70.53,60,0
.goto BoreanTundra,53.90,67.07,60,0
.goto BoreanTundra,54.85,65.09
>>击杀 |cRXP_ENEMY_地穴爬行者|r
.complete 11797,1 
.mob Crypt Crawler
step
.goto BoreanTundra,56.36,69.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈默希尔|r交谈
.turnin 11797 >>交任务: |cRXP_FRIENDLY_虫临城下|r
.accept 11889 >>接任务: |cRXP_LOOT_空中的虫子|r
.target Sergeant Hammerhill
step
.goto BoreanTundra,54.8,70.2,40,0
.goto BoreanTundra,54.83,71.43,40,0
.goto BoreanTundra,54.8,70.2
.use 35278 >>|cRXP_WARN_使用|r|T134325:0|t[强化捕网]|cRXP_WARN_来击落飞行的|r|cRXP_ENEMY_天灾烈焰蛛|r
>>击杀|cRXP_ENEMY_天灾烈焰蛛|r
.complete 11889,1 
.mob Scourged Flamespitter
step
.goto BoreanTundra,56.36,69.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈默希尔|r交谈
.turnin 11889 >>交任务: |cRXP_FRIENDLY_空中的虫子|r
.accept 11897 >>接任务: |cRXP_LOOT_炸毁虫孔|r
.target Sergeant Hammerhill
step
#completewith next
.goto BoreanTundra,56.96,68.75,10 >>前往“风暴破坏者”. 前往下层
step
>>打开|cRXP_PICK_急救补给品|r, 从中拾取|cRXP_LOOT_抗毒药剂|r
>>点击|cRXP_PICK_诅咒教徒神龛|r
.complete 11789,1 
.goto BoreanTundra,57.50,69.27
.accept 11920 >>接任务: |cRXP_LOOT_隐藏的诅咒教徒|r
.goto BoreanTundra,57.56,69.13
step
#completewith next
.goto BoreanTundra,56.96,68.75,10 >>前往海军上将坎特蕾布莉和海军上将坎特蕾布莉
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_左撇子|r船长和|r海军上将坎特蕾布莉|r交谈
.turnin 11920 >>交任务: |cRXP_FRIENDLY_隐藏的诅咒教徒|r
.goto BoreanTundra,57.83,69.20
.target +Captain "Lefty" Lugsail
.accept 11791 >>接任务: |cRXP_LOOT_通知阿洛斯|r
.target +Admiral Cantlebree
.goto BoreanTundra,57.79,69.19
step
#completewith next
.goto BoreanTundra,57.1,71.8,15,0
.goto BoreanTundra,57.2,72.3,15,0
.goto BoreanTundra,56.67,72.64,10 >>进入要塞
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿洛斯|r和|cRXP_FRIENDLY_塔尔伯特|r和|cRXP_FRIENDLY_薇伦|r交谈
.turnin 11791 >>交任务: |cRXP_FRIENDLY_通知阿洛斯|r
.goto BoreanTundra,56.67,72.64
.target +General Arlos
.accept 12141 >>接任务: |cRXP_LOOT_外交任务|r
.goto BoreanTundra,56.72,72.62
.target +Counselor Talbot
.accept 11792 >>接任务: |cRXP_LOOT_圣光的敌人|r
.target +Harbinger Vurenn
.goto BoreanTundra,56.60,72.46
step
#completewith next
.goto BoreanTundra,56.87,71.29,20 >>离开要塞
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍桑|r交谈
.turnin 11789 >>交任务: |cRXP_FRIENDLY_急需帮助的士兵|r
.goto BoreanTundra,55.00,68.91
.target Medic Hawthorn
step
.goto BoreanTundra,54.08,63.73,-1
.goto BoreanTundra,54.77,63.08,-1
.use 35704 >>|cRXP_WARN_使用|r|T133713:0|t[火焰炸弹] |cRXP_WARN_于|r|cRXP_PICK_北方陷坑|r
.complete 11897,2 
step
#loop
.line BoreanTundra,54.04,62.42,53.84,60.33,55.25,63.43,54.04,62.42
.goto BoreanTundra,54.04,62.42,40,0
.goto BoreanTundra,53.84,60.33,40,0
.goto BoreanTundra,55.25,63.43,40,0
.goto BoreanTundra,54.04,62.42,40,0
>>击杀|cRXP_ENEMY_诅咒教徒通灵师|r. 从他们身上搜刮|cRXP_LOOT_密信|r
.complete 11792,1 
.mob Cultist Necrolyte
step
.goto BoreanTundra,50.46,71.38,-1
.goto BoreanTundra,50.88,72.29,-1
.use 35704 >>|cRXP_WARN_使用|r|T133713:0|t[火焰炸弹]|cRXP_WARN_在|r|cRXP_PICK_南侧陷坑|r
.complete 11897,1 
step
.goto BoreanTundra,47.13,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁克|r交谈
.turnin 12141 >>交任务: |cRXP_FRIENDLY_外交任务|r
.accept 11613 >>接任务: |cRXP_LOOT_卡鲁克的誓言|r
.target Karuk
step
#completewith Karuk2
#label CTPrisoner2
.goto BoreanTundra,44.10,77.90,50,0
>>击杀被围困的|cRXP_ENEMY_Skadir Longboatsmen|r和 |cRXP_ENEMY_Riplash Myrmidon|r, 他们正包围着 |cRXP_FRIENDLY_被俘虏的海象人|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪菲亚囚徒|r交谈
>>|cRXP_WARN_如果|cRXP_FRIENDLY_迪菲亚囚徒|r不存在, 请忽略此内容|r
.accept 12471 >>接任务: |cRXP_LOOT_残忍的科瓦迪尔|r
.unitscan Captured Tuskarr Prisoner
step
#loop
.goto BoreanTundra,44.08,78.16,50,0
.goto BoreanTundra,46.02,79.49,50,0
.goto BoreanTundra,46.80,80.74,50,0
.goto BoreanTundra,48.40,79.83,50,0
.goto BoreanTundra,50.33,78.08,50,0
.goto BoreanTundra,48.22,76.00,50,0
.goto BoreanTundra,47.69,77.59,50,0
.goto BoreanTundra,44.08,78.16,50,0
.goto BoreanTundra,46.02,79.49,50,0
.goto BoreanTundra,46.80,80.74,50,0
.goto BoreanTundra,48.40,79.83,50,0
.goto BoreanTundra,50.33,78.08,50,0
.goto BoreanTundra,48.22,76.00,50,0
.goto BoreanTundra,47.69,77.59,0
>>击杀|cRXP_ENEMY_斯卡迪尔长艇船员|r和|cRXP_ENEMY_斯卡迪尔袭击者|r
.complete 11613,2 
.mob +Skadir Longboatsman
.complete 11613,1 
.mob +Skadir Raider
step
#optional
#completewith end
#requires CTPrisoner2
#label Cruelty2
.goto BoreanTundra,47.13,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁克|r交谈
.turnin 12471 >>交任务: |cRXP_FRIENDLY_残忍的科瓦迪尔|r
.isOnQuest 12471
.target Karuk
step
#label Karuk2
.goto BoreanTundra,47.13,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁克|r交谈
.turnin 11613 >>交任务: |cRXP_FRIENDLY_卡鲁克的誓言|r
.accept 11619 >>接任务: |cRXP_LOOT_残忍的贾梅尔|r
.target Karuk
step
#optional
#requires Cruelty2
#completewith next
.groundgoto BoreanTundra,46.3,78.8,20,0
.goto BoreanTundra,46.42,78.23,15 >>前往洞穴
step
.goto BoreanTundra,46.42,78.23
>>在洞穴内杀死残忍的贾梅尔
.complete 11619,1 
.mob Gamel the Cruel
step
#optional
#completewith Karuk3
#label CTPrisoner3
.goto BoreanTundra,44.10,77.90,50,0
>>击杀被围困的|cRXP_ENEMY_Skadir Longboatsmen|r和 |cRXP_ENEMY_Riplash Myrmidon|r, 他们正包围着 |cRXP_FRIENDLY_被俘虏的海象人|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪菲亚囚徒|r交谈
>>|cRXP_WARN_如果|cRXP_FRIENDLY_迪菲亚囚徒|r不存在, 请忽略此内容|r
.accept 12471 >>接任务: |cRXP_LOOT_残忍的科瓦迪尔|r
.unitscan Captured Tuskarr Prisoner
step
#optional
#completewith end
#requires CTPrisoner3
#label Cruelty3
.goto BoreanTundra,47.13,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁克|r交谈
.turnin 12471 >>交任务: |cRXP_FRIENDLY_残忍的科瓦迪尔|r
.isOnQuest 12471
.target Karuk
step
#label Karuk3
.goto BoreanTundra,47.13,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁克|r交谈
.turnin 11619 >>交任务: |cRXP_FRIENDLY_残忍的贾梅尔|r
.accept 11620 >>接任务: |cRXP_LOOT_父亲的话|r
.target Karuk
step
#optional
#completewith Veehja
#label CTPrisoner4
.goto BoreanTundra,44.10,77.90,50,0
>>击杀被围困的|cRXP_ENEMY_Skadir Longboatsmen|r和 |cRXP_ENEMY_Riplash Myrmidon|r, 他们正包围着 |cRXP_FRIENDLY_被俘虏的海象人|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪菲亚囚徒|r交谈
>>|cRXP_WARN_如果|cRXP_FRIENDLY_迪菲亚囚徒|r不存在, 请忽略此内容|r
.accept 12471 >>接任务: |cRXP_LOOT_残忍的科瓦迪尔|r
.unitscan Captured Tuskarr Prisoner
step
#optional
#completewith end
#requires CTPrisoner4
.goto BoreanTundra,47.13,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁克|r交谈
.turnin 12471 >>交任务: |cRXP_FRIENDLY_残忍的科瓦迪尔|r
.isOnQuest 12471
.target Karuk
step << wotlk
.goto BoreanTundra,43.60,80.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维赫亚|r交谈 << DK
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维赫亚|r交谈. 只有当你拥有足够的[|cRXP_WARN_鱼油|r]时, 才接受此任务 << Shaman
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维赫亚|r交谈. 只有当你拥有多个 |T134794:0|t[|cRXP_WARN_水上行走药剂|r], 或与一名 |T135771:0|t|cFFC41E3A死亡骑士|r组队时, 才接受此任务 << !Shaman !DK
.turnin 11620 >>交任务: |cRXP_FRIENDLY_父亲的话|r
.accept 11625 >>接任务: |cRXP_LOOT_纳兹亚的三叉戟|r
.itemcount 17058,5 << Shaman
.itemcount 8827,5 << !Shaman !DK
.skill coldweatherflying,1,1
.target Veehja
step
#label Veehja2
.goto BoreanTundra,43.60,80.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维赫亚|r交谈
.turnin 11620 >>交任务: |cRXP_FRIENDLY_父亲的话|r
.accept 11625 >>接任务: |cRXP_LOOT_纳兹亚的三叉戟|r
.skill coldweatherflying,<1,1
.target Veehja
step
#label Veehja
.goto BoreanTundra,43.60,80.53
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维赫亚|r交谈
.turnin 11620 >>交任务: |cRXP_FRIENDLY_父亲的话|r
.target Veehja
step
#requires Veehja2
#completewith next
.groundgoto BoreanTundra,53.7,91.1,40,0
.goto BoreanTundra,54.85,88.78,100 >>前往裂鞭废墟
.isOnQuest 11625
step

.goto BoreanTundra,55.03,88.51
>>击杀|cRXP_ENEMY_拉格纳·德拉卡伦|r. 抢夺他的|cRXP_LOOT_三叉戟|r
.complete 11625,1 
.isOnQuest 11625
.mob Ragnar Drakkarlund
step
.goto BoreanTundra,43.63,80.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维赫亚|r交谈
.turnin 11625 >>交任务: |cRXP_FRIENDLY_纳兹亚的三叉戟|r
.isQuestComplete 11625
.target Veehja
step
.goto BoreanTundra,43.63,80.57
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维赫亚|r交谈
.accept 11626 >>接任务: |cRXP_LOOT_使者|r
.isQuestTurnedIn 11625
.target Veehja
step
.goto BoreanTundra,51.90,88.46
.use 35850 >>|cRXP_WARN_使用|r|T135127:0|t[纳兹亚的三叉戟]|cRXP_WARN_对水下的|cRXP_ENEMY_利维洛斯|r造成大量伤害|r
>>击杀|cRXP_ENEMY_利维洛斯|r
.complete 11626,1 
.isQuestTurnedIn 11625
.mob Leviroth
step
#completewith Karuk5
#label CTPrisoner5
.goto BoreanTundra,44.10,77.90,50,0
>>击杀被围困的|cRXP_ENEMY_Skadir Longboatsmen|r和 |cRXP_ENEMY_Riplash Myrmidon|r, 他们正包围着 |cRXP_FRIENDLY_被俘虏的海象人|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪菲亚囚徒|r交谈
>>|cRXP_WARN_如果|cRXP_FRIENDLY_迪菲亚囚徒|r不存在, 请忽略此内容|r
.accept 12471 >>接任务: |cRXP_LOOT_残忍的科瓦迪尔|r
.unitscan Captured Tuskarr Prisoner
.mob Skadir Longboatsman
.isQuestTurnedIn 11625
step
#completewith end
#requires CTPrisoner5
.goto BoreanTundra,47.13,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁克|r交谈
.turnin 12471 >>交任务: |cRXP_FRIENDLY_残忍的科瓦迪尔|r
.isOnQuest 12471
.target Karuk
step
#label Karuk5
.goto BoreanTundra,47.13,75.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡鲁克|r交谈
.turnin 11626 >>交任务: |cRXP_FRIENDLY_使者|r
.isQuestTurnedIn 11625
.target Karuk
step
#completewith Oculus
.hs >>传送至无畏要塞
step
#completewith Oculus
.goto BoreanTundra,57.1,71.8,15,0
.goto BoreanTundra,57.2,72.3,15,0
.goto BoreanTundra,56.67,72.64,10 >>进入要塞
step
#optional
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_Vurenn|r和|cRXP_FRIENDLY_Rollick|r和|cRXP_FRIENDLY_Hammerhill|r和|cRXP_FRIENDLY_Mark|r和|cRXP_FRIENDLY_Skyhopper|r交谈
.turnin 11792 >>交任务: |cRXP_FRIENDLY_圣光的敌人|r
.accept 11793 >>接任务: |cRXP_LOOT_继续调查|r
.goto BoreanTundra,56.60,72.46
.turnin 13088 >>交任务: |cRXP_FRIENDLY_诺森德的厨师|r
.goto BoreanTundra,57.93,71.54
.turnin 11897 >>交任务: |cRXP_FRIENDLY_炸毁虫孔|r
.accept 11928 >>接任务: |cRXP_LOOT_致远郡|r
.goto BoreanTundra,56.36,69.58
.accept 11927 >>接任务: |cRXP_LOOT_坊间的传言|r
.goto BoreanTundra,56.77,69.51
.accept 11707 >>接任务: |cRXP_LOOT_迫在眉睫|r
.goto BoreanTundra,58.84,68.72
.isQuestComplete 13088
.skill cooking,<350,1
.target Sergeant Hammerhill
.target Harbinger Vurenn
.target Rollick MacKreel
.target Mark Hanes
.target Airman Skyhopper
step
.goto 114/571,5305.900,2112.700
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_先驱者乌尔雷|r交谈
.target Harbinger Vurenn
.turnin 11792 >>交任务: |cRXP_FRIENDLY_圣光的敌人|r
.accept 11793 >>接任务: |cRXP_LOOT_继续调查|r
step
.goto 114/571,5321.000,2223.200
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈默希尔中士|r交谈
.target Sergeant Hammerhill
.turnin 11897 >>交任务: |cRXP_FRIENDLY_炸毁虫孔|r
.accept 11928 >>接任务: |cRXP_LOOT_致远郡|r
step
.goto 114/571,5296.800,2225.700
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克·汉斯|r交谈
.target Mark Hanes
.accept 11927 >>接任务: |cRXP_LOOT_坊间的传言|r
step
.goto 114/571,5179.900,2255.900
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_飞行员斯凯霍布尔|r交谈
.target Airman Skyhopper
.accept 11707 >>接任务: |cRXP_LOOT_迫在眉睫|r
step
.goto BoreanTundra,58.5,68.3,15,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的 |cRXP_FRIENDLY_米吉|r 交谈, 然后是 |cRXP_FRIENDLY_莉蕾萨|r 和 |cRXP_FRIENDLY_雅拉|r
.accept 11575 >>接任务: |cRXP_LOOT_千钧一发|r
.goto BoreanTundra,58.41,67.79
.target +Midge
.turnin 11927 >>交任务: |cRXP_FRIENDLY_坊间的传言|r
.accept 11599 >>接任务: |cRXP_LOOT_萨萨里安，我的哥哥|r
.goto BoreanTundra,58.4,67.6,15,0
.goto BoreanTundra,58.75,68.36
.target +Leryssa
.turnin 11793 >>交任务: |cRXP_FRIENDLY_继续调查|r
.accept 11794 >>接任务: |cRXP_LOOT_猎杀行动|r
.target +Vindicator Yaala
.goto BoreanTundra,58.55,67.29
step
#label Oculus
.use 35125 >>|cRXP_WARN_使用|r|T134335:0|t[驱魔师的透镜] |cRXP_WARN_为自己施加|r|T135895:0|t[正义之视]
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店中的|cRXP_ENEMY_“咸鱼”约翰·索普|r和码头上的|cRXP_ENEMY_汤姆·海格尔|r以及城堡下方监狱里的|cRXP_ENEMY_守卫米切尔|r交谈后杀死他们
.complete 11794,3 
.goto BoreanTundra,58.57,67.13
.mob +"Salty" John Thorpe
.complete 11794,1 
.goto BoreanTundra,59.26,68.19
.mob +Tom Hegger
.complete 11794,2 
.goto BoreanTundra,56.9,72.2,12,0
.goto BoreanTundra,56.72,71.83
.mob +Guard Mitchells
.skipgossip 25248,2
.skipgossip 25827,1
.skipgossip 25828,1
.skipgossip
.timer 13,The Hunt is On RP
step
#completewith next
.goto BoreanTundra,58.21,62.82,70 >>前往致远郡
step
.goto BoreanTundra,58.21,62.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gerald|r交谈
.turnin 11928 >>交任务: |cRXP_FRIENDLY_致远郡|r
.accept 11901 >>接任务: |cRXP_LOOT_军队？什么军队？|r
.target Gerald Green
step
#completewith next
.goto BoreanTundra,56.7,57.2,40 >>进入致远郡矿洞
step
.goto BoreanTundra,56.81,55.56
>>点击地面上的|cRXP_PICK_天灾谷物|r
.turnin 11901 >>交任务: |cRXP_FRIENDLY_军队？什么军队？|r
.accept 11902 >>接任务: |cRXP_LOOT_致命的谷物|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰拉德|r和|cRXP_FRIENDLY_耶利米|r和|cRXP_FRIENDLY_温迪|r交谈
.turnin 11902 >>交任务: |cRXP_FRIENDLY_致命的谷物|r
.accept 11903 >>接任务: |cRXP_LOOT_战斗的时刻|r
.goto BoreanTundra,58.21,62.82
.target +Gerald Green
.accept 11908 >>接任务: |cRXP_LOOT_参考资料|r
.target +Jeremiah Hawning
.goto BoreanTundra,58.19,62.98
.accept 11913 >>接任务: |cRXP_LOOT_万无一失|r
.target +Wendy Darren
.goto BoreanTundra,58.28,62.77
step
#completewith next
.use 35491 >>|cRXP_WARN_使用|r|T135432:0|t[温迪的火炬]|cRXP_WARN_来点燃|r|cRXP_PICK_致远郡谷物|r
>>击杀|cRXP_ENEMY_天灾食腐者|r
.complete 11913,1 
.complete 11903,1 
.mob +Plagued Scavenger
step
.goto BoreanTundra,55.75,58.32
>>掠夺农田和工厂与车间, 它看起来像是一本红皮书, 就在着火的房子里
.complete 11908,1 
step
#loop
.line BoreanTundra,56.84,61.57,55.59,62.11,54.56,60.67,55.89,60.80,55.32,59.32,55.81,57.69,56.83,58.39,56.84,61.57
.goto BoreanTundra,56.84,61.57,50,0
.goto BoreanTundra,55.59,62.11,50,0
.goto BoreanTundra,54.56,60.67,50,0
.goto BoreanTundra,55.89,60.80,50,0
.goto BoreanTundra,55.32,59.32,50,0
.goto BoreanTundra,55.81,57.69,50,0
.goto BoreanTundra,56.83,58.39,50,0
.goto BoreanTundra,56.84,61.57,50,0
.use 35491 >>|cRXP_WARN_使用|r|T135432:0|t[温迪的火炬]|cRXP_WARN_来点燃|r|cRXP_PICK_致远郡谷物|r
>>击杀|cRXP_ENEMY_天灾食腐者|r
.complete 11913,1 
.complete 11903,1 
.mob +Plagued Scavenger
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wendy|r和|cRXP_FRIENDLY_Gerald|r和|cRXP_FRIENDLY_Jeremiah|r交谈
.turnin 11913 >>交任务: |cRXP_FRIENDLY_万无一失|r
.target +Wendy Darren
.goto BoreanTundra,58.28,62.77,-1
.turnin 11903 >>交任务: |cRXP_FRIENDLY_战斗的时刻|r
.accept 11904 >>接任务: |cRXP_LOOT_劳动的果实|r
.goto BoreanTundra,58.21,62.82,-1
.target +Gerald Green
.turnin 11908 >>交任务: |cRXP_FRIENDLY_参考资料|r
.accept 12035 >>接任务: |cRXP_LOOT_重新装配|r
.target +Jeremiah Hawning
.goto BoreanTundra,58.19,62.98,-1
step
.goto BoreanTundra,58.30,61.20,40,0
.goto BoreanTundra,56.52,62.19,40,0
.goto BoreanTundra,58.30,61.20
.use 35943 >>击杀|cRXP_ENEMY_收割采集者|r. |cRXP_WARN_使用|r|T134520:0|t[耶利米的工具]|cRXP_WARN_在他们尸体上|r
.complete 12035,1 
.mob Harvest Collector
step
#completewith next
.goto BoreanTundra,56.7,57.2,40 >>进入致远郡矿洞
step
.goto BoreanTundra,56.04,55.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_William的|r尸体对话
.turnin 11599 >>交任务: |cRXP_FRIENDLY_萨萨里安，我的哥哥|r
.accept 11600 >>接任务: |cRXP_LOOT_威廉·奥雷顿之死|r
.target William Allerton
step
.goto BoreanTundra,57.99,53.54
>>击杀|cRXP_ENEMY_亚克布上尉|r. 从他身上搜刮|cRXP_LOOT_矿石车钥匙|r
.collect 35705,1,11904,1 
.unitscan Captain Jacobs
step
.goto BoreanTundra,57.18,54.65
>>点击位于|cRXP_FRIENDLY_矿石车|r旁边的|cRXP_PICK_矿车的锁|r杠杆
.complete 11904,1 
step
#completewith next
.goto BoreanTundra,56.7,57.2,40,0
.goto BoreanTundra,58.21,62.82,80 >>前往|cRXP_FRIENDLY_Gerald|r和|cRXP_FRIENDLY_Jeremiah|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gerald|r和|cRXP_FRIENDLY_Jeremiah|r交谈
.turnin 11904 >>交任务: |cRXP_FRIENDLY_劳动的果实|r
.accept 11962 >>接任务: |cRXP_LOOT_最后一批矿石|r
.target +Gerald Green
.goto BoreanTundra,58.21,62.82
.turnin 12035 >>交任务: |cRXP_FRIENDLY_重新装配|r
.goto BoreanTundra,58.19,62.98
.target +Jeremiah Hawning
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_喜妲|r交谈
.turnin 11962 >>交任务: |cRXP_FRIENDLY_最后一批矿石|r
.accept 11963 >>接任务: |cRXP_LOOT_给致远郡的武器|r
.goto BoreanTundra,57.32,66.64
.target Hilda Stoneforge
step
.goto BoreanTundra,58.75,68.42
>>|cRXP_WARN_跳上手推车, 然后跃至窗户底部的 ledge|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉蕾萨|r交谈
.turnin 11600 >>交任务: |cRXP_FRIENDLY_威廉·奥雷顿之死|r
.accept 11601 >>接任务: |cRXP_LOOT_柳暗花明|r
.target Leryssa
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹姆斯|r交谈, 然后去楼上找|cRXP_FRIENDLY_Yaala|r
.turnin 11601 >>交任务: |cRXP_FRIENDLY_柳暗花明|r
.accept 11603 >>接任务: |cRXP_LOOT_酒中的真相|r
.target +James Deacon
.goto BoreanTundra,58.29,68.05
.turnin 11794 >>交任务: |cRXP_FRIENDLY_猎杀行动|r
.target +Vindicator Yaala
.goto BoreanTundra,58.55,67.29
step
.goto BoreanTundra,58.21,62.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gerald|r交谈
.turnin 11963 >>交任务: |cRXP_FRIENDLY_给致远郡的武器|r
.accept 11965 >>接任务: |cRXP_LOOT_集结的钟声！|r
.target Gerald Green
step
#completewith next
.goto BoreanTundra,57.32,59.39,30 >>进入致远郡钟楼
step
.goto BoreanTundra,57.32,59.39
>>|cRXP_WARN_稍微跑上台阶|r
>>点击悬挂在天花板上的钟绳
.complete 11965,1 
step
.goto BoreanTundra,58.21,62.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gerald|r交谈
.turnin 11965 >>交任务: |cRXP_FRIENDLY_集结的钟声！|r
.target Gerald Green
step << !wotlk
#completewith next
.goto BoreanTundra,50.07,30.72,80 >>前往冷石采掘场
step << !wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊塔鲁克|r和|cRXP_FRIENDLY_阿特卡诺克|r交谈(|cRXP_WARN_石头|r)
.accept 11612 >>接任务: |cRXP_LOOT_夺回采掘场|r
.goto BoreanTundra,54.29,36.09
.accept 11605 >>接任务: |cRXP_LOOT_海象人的先祖|r
.goto BoreanTundra,54.63,35.88
.target Etaruk
step << !wotlk
#completewith next
.goto BoreanTundra,54.1,34.5,0,0
.goto BoreanTundra,52.0,30.6,0
.goto BoreanTundra,50.9,33.4,0
>>击杀 |cRXP_ENEMY_Beryl 蓝玉财宝猎人|r
.complete 11612,1 
.mob Beryl Treasure Hunter
step << !wotlk
>>点击地面上的标记:|cRXP_PICK_"Elder Kesuk"|r和|cRXP_PICK_"Elder Takret"|r 和 |cRXP_PICK_"Elder Sagani"|r
.complete 11605,1 
.goto BoreanTundra,50.86,32.43
.complete 11605,3 
.goto BoreanTundra,52.31,31.13
.complete 11605,2 
.goto BoreanTundra,52.81,34.02
step << !wotlk
.goto BoreanTundra,54.1,34.5,70,0
.goto BoreanTundra,52.0,30.6,70,0
.goto BoreanTundra,50.9,33.4,70,0
.goto BoreanTundra,54.1,34.5
>>击杀 |cRXP_ENEMY_Beryl 蓝玉财宝猎人|r
.complete 11612,1 
.mob Beryl Treasure Hunter
step << !wotlk
.goto BoreanTundra,54.63,35.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Atkanok|r 交谈
.turnin 11605 >>交任务: |cRXP_FRIENDLY_海象人的先祖|r
.accept 11607 >>接任务: |cRXP_LOOT_失落的灵魂|r
step << !wotlk
.goto BoreanTundra,54.29,36.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊塔鲁克|r交谈
.turnin 11612 >>交任务: |cRXP_FRIENDLY_夺回采掘场|r
.accept 11617 >>接任务: |cRXP_LOOT_别让他们逃了！|r
.target Etaruk
step << !wotlk
#label cores
#completewith coresEnd
.waypoint BoreanTundra,51.7,31.6,15,0
.waypoint BoreanTundra,52.3,31.0,40,0
.waypoint BoreanTundra,51.0,32.3,40,0
.goto BoreanTundra,51.7,31.6,0,0
>>击杀|cRXP_ENEMY_蓝玉猎犬|r. 击杀后搜刮其掉落的 |T134337:0|t[|cRXP_LOOT_恶毒岩核|r]
.use 34711 >>|cRXP_WARN_使用|r|T134337:0|t[|cRXP_LOOT_恶毒岩核|r], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_卡斯卡拉工匠|r和|r|cRXP_FRIENDLY_卡斯卡拉萨满祭司|r
.collect 34711,6,11607,0x3,-1 
.complete 11607,1 
.complete 11607,2 
.mob Beryl Hound
step << !wotlk
.goto BoreanTundra,52.6,35.5
>>击杀|cRXP_ENEMY_蓝玉回收者|r. 掠夺他们以获得 |T133717:0|t[|cRXP_LOOT_侏儒手雷|r]
>>|cRXP_WARN_站在悬崖边缘|r
.use 34772 >>|cRXP_WARN_使用|r|T133717:0|t[|cRXP_LOOT_侏儒手雷|r] |cRXP_WARN_摧毁|r|cRXP_PICK_东部平台|r
.collect 34772,3,11617,0x7,-1 
.complete 11617,1 
.mob Beryl Reclaimer
step << !wotlk
.goto BoreanTundra,50.3,34.1
>>击杀|cRXP_ENEMY_蓝玉回收者|r. 掠夺他们以获得 |T133717:0|t[|cRXP_LOOT_侏儒手雷|r]
>>|cRXP_WARN_站在悬崖边缘|r
.use 34772 >>|cRXP_WARN_使用|r|T133717:0|t[|cRXP_LOOT_侏儒手雷|r]|cRXP_WARN_摧毁|r|cRXP_PICK_西部平台|r
.collect 34772,3,11617,0x7,-1 
.complete 11617,3 
.mob Beryl Reclaimer
step << !wotlk
#label North
.goto BoreanTundra,52.6,32.4
>>击杀|cRXP_ENEMY_蓝玉回收者|r. 掠夺他们以获得 |T133717:0|t[|cRXP_LOOT_侏儒手雷|r]
>>|cRXP_WARN_站在|r|cRXP_PICK_北部平台正下方|r
.use 34772 >>|cRXP_WARN_使用|r|T133717:0|t[|cRXP_LOOT_侏儒手雷|r]|cRXP_WARN_摧毁|r|cRXP_PICK_北部平台|r
.collect 34772,3,11617,0x7,-1 
.complete 11617,2 
.mob Beryl Reclaimer
step << !wotlk
#requires cores
#label coresEnd
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊塔鲁克|r和|cRXP_FRIENDLY_伊塔鲁克|r交谈
.turnin 11607 >>交任务: |cRXP_FRIENDLY_失落的灵魂|r
.accept 11609 >>接任务: |cRXP_LOOT_寻找古器|r
.goto BoreanTundra,54.63,35.88
.turnin 11617 >>交任务: |cRXP_FRIENDLY_别让他们逃了！|r
.accept 11623 >>接任务: |cRXP_LOOT_拜访馆长|r
.goto BoreanTundra,54.29,36.09
.target Etaruk
step << !wotlk
#completewith next
.goto BoreanTundra,51.2,36.5,50,0
.goto BoreanTundra,52.9,32.6,0
>>拾取地面上的|cRXP_LOOT_海象人仪式道具|r
>>|cRXP_WARN_它们看起来像白蓝色的香炉或铁砧|r
.complete 11609,1 
step << !wotlk
.goto BoreanTundra,50.1,32.6
>>击杀|cRXP_ENEMY_馆长因萨维斯|r
.complete 11623,1 
.mob Curator Insivius
step << !wotlk
.goto BoreanTundra,52.9,32.6,70,0
.goto BoreanTundra,53.9,35.0,70,0
.goto BoreanTundra,50.9,33.2
>>拾取地面上的|cRXP_LOOT_海象人仪式道具|r
>>|cRXP_WARN_它们看起来像白蓝色的香炉或铁砧|r
.complete 11609,1 
step << !wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊塔鲁克|r和|cRXP_FRIENDLY_伊塔鲁克|r交谈
.turnin 11609 >>交任务: |cRXP_FRIENDLY_寻找古器|r
.accept 11610 >>接任务: |cRXP_LOOT_先祖的回归|r
.goto BoreanTundra,54.63,35.88
.turnin 11623 >>交任务: |cRXP_FRIENDLY_拜访馆长|r
.goto BoreanTundra,54.29,36.09
.target Etaruk
step << !wotlk
.use 34715 >>|cRXP_WARN_使用|r|T134378:0|t[海象人仪式道具]|cRXP_WARN_放置在|cRXP_PICK_"老萨加尼"|r和|cRXP_PICK_"老塔克雷特"|r和|cRXP_PICK_"老凯苏克"|r的标记附近|r
>>|cRXP_WARN_请勿等待剧情任务|r
.complete 11610,2 
.goto BoreanTundra,52.81,34.04
.complete 11610,3 
.goto BoreanTundra,52.32,31.15
.complete 11610,1 
.goto BoreanTundra,50.85,32.40
step << !wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Atkanok|r 交谈
.turnin 11610 >>交任务: |cRXP_FRIENDLY_先祖的回归|r
.goto BoreanTundra,54.63,35.88
step
#completewith next
.goto BoreanTundra,57.05,44.32,120 >>前往仁德会营地
step
.goto BoreanTundra,57.05,44.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊拉索留斯|r交谈
.accept 11864 >>接任务: |cRXP_WARN_决战奈辛瓦里|r
.turnin 11864 >>交任务: |cRXP_FRIENDLY_决战奈辛瓦里|r
.accept 11866 >>接任务: |cRXP_LOOT_敌人的耳环|r
.accept 11876 >>接任务: |cRXP_LOOT_帮助弱小|r
.target Arch Druid Lathorius
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与在雕像周围巡逻的|cRXP_FRIENDLY_Killinger|r和|cRXP_FRIENDLY_扎扎|r和|cRXP_FRIENDLY_Cenius|r交谈
.accept 11865 >>接任务: |cRXP_LOOT_死不足惜|r
.goto BoreanTundra,56.79,44.04
.target +Zaza
.accept 11869 >>接任务: |cRXP_LOOT_欢乐的蚌壳|r
.goto BoreanTundra,57.33,44.08
.target +Hierophant Cenius
.accept 11884 >>接任务: |cRXP_LOOT_尼达尔，犀牛之王……|r
.goto BoreanTundra,57.17,43.59,7,0
.goto BoreanTundra,57.33,44.08,7,0
.goto BoreanTundra,57.05,44.32,7,0
.goto BoreanTundra,56.79,44.04
.target +Killinger the Den Watcher
step
#completewith LastTrap
.goto BoreanTundra,55.9,47.4,0
>>击杀|cRXP_ENEMY_利欲熏心的偷猎者|r. 击杀他们后搜刮其|cRXP_LOOT_耳朵|r
.complete 11866,1 
.mob Loot Crazed Poacher
.mob Loot Crazed Diver
step
#label LastTrap
#loop
.goto BoreanTundra,56.2,46.1,60,0
.goto BoreanTundra,57.7,46.4,60,0
.goto BoreanTundra,57.9,48.7,60,0
.goto BoreanTundra,56.5,50.2,60,0
.goto BoreanTundra,57.6,52.1,60,0
.goto BoreanTundra,57.6,52.1,0
>>|cRXP_WARN_使用|r|T134263:0|t[一堆人造皮毛] |cRXP_WARN_放置在|r|cRXP_PICK_驯鹿陷阱|r上的 |cRXP_WARN_地面上|r
.use 35127 >>|cRXP_WARN_请勿等待剧情任务|r
.complete 11865,1
.isOnQuest 11865
step
#loop
.goto BoreanTundra,51.7,47.0,70,0
.goto BoreanTundra,52.3,44.8,70,0
.goto BoreanTundra,52.9,43.0,70,0
.goto BoreanTundra,50.0,44.1,70,0
.goto BoreanTundra,50.0,44.1,0
>>击杀|cRXP_ENEMY_Loot 利欲熏心的潜水员|r. 击杀他们, 获取他们的|cRXP_LOOT_Ears|r
>>|cRXP_WARN_现在不必特意去收集所有|cRXP_LOOT_Ears|r. 稍后你会收集到更多|r
.complete 11869,1 
.collect 35188,15,11866,1,1 
.mob Loot Crazed Diver
step
#optional
#completewith next
>>击杀|cRXP_ENEMY_长毛犀牛首领|r和|cRXP_ENEMY_雄性长毛犀牛|r和|cRXP_ENEMY_长毛犀牛幼崽|r, 从它们身上获取|cRXP_LOOT_冰冷的肉|r
.complete 13088,1 
.isOnQuest 13088
.mob Wooly Rhino Matriarch
.mob Wooly Rhino Calf
.mob Wooly Rhino Bull
step
#loop
.goto BoreanTundra,48.6,40.0,50,0
.goto BoreanTundra,44.9,45.7,50,0
.goto BoreanTundra,46.7,45.6,50,0
.goto BoreanTundra,48.6,40.0,50,0
.goto BoreanTundra,44.9,45.7,0
.goto BoreanTundra,48.6,40.0,0
>>杀死|cRXP_ENEMY_“犀牛之王”尼达尔|r和|cRXP_ENEMY_“午餐盒”|r. 请先击杀|cRXP_ENEMY_“午餐盒”|r
.complete 11884,2 
.complete 11884,1 
.unitscan Nedar, Lord of Rhinos
.mob "Lunchbox"
step
.goto BoreanTundra,48.6,40.0,50,0
.goto BoreanTundra,44.9,45.7,50,0
.goto BoreanTundra,46.7,45.6,50,0
.goto BoreanTundra,44.9,45.7,0
.goto BoreanTundra,48.6,40.0
>>击杀|cRXP_ENEMY_长毛犀牛首领|r和|cRXP_ENEMY_雄性长毛犀牛|r和|cRXP_ENEMY_长毛犀牛幼崽|r, 从它们身上获取|cRXP_LOOT_冰冷的肉|r
.complete 13088,1 
.isOnQuest 13088
.mob Wooly Rhino Matriarch
.mob Wooly Rhino Calf
.mob Wooly Rhino Bull
step
#completewith next
.goto BoreanTundra,45.33,34.62,100 >>前往琥珀崖
step
#sticky
#label ALFP
.goto BoreanTundra,45.33,34.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏雷斯塔兹|r交谈
.fp Amber Ledge >>获取琥珀崖的飞行点
.target Surristrasz
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donathan|r和|cRXP_FRIENDLY_Garren|r交谈
.turnin 11575 >>交任务: |cRXP_FRIENDLY_千钧一发|r
.accept 11587 >>接任务: |cRXP_LOOT_越狱|r
.goto BoreanTundra,45.26,33.35
.target +Librarian Donathan
.accept 11576 >>接任务: |cRXP_LOOT_监视裂谷：悬崖异常|r
.goto BoreanTundra,44.98,33.38
.target +Librarian Garren
step
#requires ALFP
#completewith next
.goto BoreanTundra,54.29,36.09,100 >>前往冷石采掘场
step << wotlk

>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊塔鲁克|r和|cRXP_FRIENDLY_阿特卡诺克|r交谈(|cRXP_WARN_石头|r)
.accept 11612 >>接任务: |cRXP_LOOT_夺回采掘场|r
.goto BoreanTundra,54.29,36.09
.accept 11605 >>接任务: |cRXP_LOOT_海象人的先祖|r
.goto BoreanTundra,54.63,35.88
.target Etaruk
step
.goto BoreanTundra,55.5,41.1,60,0
.goto BoreanTundra,55.3,38.4,60,0
.goto BoreanTundra,57.6,38.4,60,0
.goto BoreanTundra,59.5,31.3,60,0
.goto BoreanTundra,55.4,27.7,60,0
.goto BoreanTundra,53.3,28.0,60,0
.goto BoreanTundra,56.8,37.7
.use 35228 >>|cRXP_WARN_使用|r|T133539:0|t[陷阱破坏锤] |cRXP_WARN_来解救|r|cRXP_FRIENDLY_被困的猛犸象幼崽|r
>>|cRXP_WARN_请勿等待剧情任务|r
.complete 11876,1,7 
.target Trapped Mammoth Calf
step
.goto BoreanTundra,55.5,41.1,60,0
.goto BoreanTundra,55.3,38.4,60,0
.goto BoreanTundra,57.6,38.4,60,0
.goto BoreanTundra,59.5,31.3,60,0
.goto BoreanTundra,55.4,27.7,60,0
.goto BoreanTundra,53.3,28.0,60,0
.goto BoreanTundra,56.8,37.7
.cast 46201 >>|cRXP_WARN_使用|r|T133539:0|t[陷阱破坏锤] |cRXP_WARN_来解救|r|cRXP_FRIENDLY_被困的猛犸象幼崽|r
>>|cRXP_WARN_请勿等待剧情任务|r
.use 35228
.isOnQuest 11876
.target Trapped Mammoth Calf
step
>>|cRXP_WARN_如果你带有 |T132311:0|t[动物血液] 的负面效果, 请跳入水中清除该效果, 或等待其自然消失后再进入营地, 否则守卫会对你发起攻击|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Killinger|r和|cRXP_FRIENDLY_Cenius|r和|cRXP_FRIENDLY_Lathorius|r和|cRXP_FRIENDLY_扎扎|r谈话
.turnin 11869 >>交任务: |cRXP_FRIENDLY_欢乐的蚌壳|r
.accept 11870 >>接任务: |cRXP_LOOT_遗弃海岸|r
.goto BoreanTundra,57.33,44.08
.turnin 11876 >>交任务: |cRXP_FRIENDLY_帮助弱小|r
.goto BoreanTundra,57.05,44.32
.turnin 11865 >>交任务: |cRXP_FRIENDLY_死不足惜|r
.accept 11868 >>接任务: |cRXP_LOOT_驯鹿杀手之死|r
.goto BoreanTundra,56.79,44.04
.target +Zaza
.turnin 11884 >>交任务: |cRXP_FRIENDLY_尼达尔，犀牛之王……|r
.goto BoreanTundra,57.17,43.59,20,0
.goto BoreanTundra,57.33,44.08,15,0
.goto BoreanTundra,57.05,44.32,15,0
.goto BoreanTundra,56.79,44.04
.target +Killinger the Den Watcher
.target Hierophant Cenius
.target Arch Druid Lathorius
step
.goto BoreanTundra,57.2,56.5
>>击杀|cRXP_ENEMY_Karen "我不驯鹿" 屠杀者|r
.complete 11868,1 
.mob Karen "I Don't Caribou" the Culler
step
.goto BoreanTundra,57.80,55.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉安德拉|r交谈
.turnin 11870 >>交任务: |cRXP_FRIENDLY_遗弃海岸|r
.accept 11871 >>接任务: |cRXP_LOOT_不可容忍|r
.target Hierophant Liandra
step
#completewith Liandra
.goto BoreanTundra,60.8,63.1,0
>>击杀|cRXP_ENEMY_北海暴徒|r 和|cRXP_ENEMY_北海雇佣兵|r , 搜刮他们的|cRXP_LOOT_耳朵|r
.complete 11866,1 
.mob Northsea Mercenary
.mob Northsea Thug
step
.goto BoreanTundra,59.2,55.6,50,0
.goto BoreanTundra,58.6,58.3,50,0
.goto BoreanTundra,60.3,58.0,50,0
.goto BoreanTundra,59.7,60.5,50,0
.goto BoreanTundra,60.0,64.1,50,0
.goto BoreanTundra,61.8,63.5
>>拾取地面上的|cRXP_LOOT_Shipments of Animal Parts|r
.complete 11871,1 
step
#label Liandra
.goto BoreanTundra,57.80,55.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉安德拉|r交谈
.turnin 11871 >>交任务: |cRXP_FRIENDLY_不可容忍|r
.accept 11872 >>接任务: |cRXP_LOOT_罪恶的蛤蜊主宰……|r
.target Hierophant Liandra
step
.goto BoreanTundra,59.2,55.6,50,0
.goto BoreanTundra,58.6,58.3,50,0
.goto BoreanTundra,60.3,58.0,50,0
.goto BoreanTundra,59.7,60.5,50,0
.goto BoreanTundra,60.0,64.1,50,0
.goto BoreanTundra,61.8,63.5
>>击杀|cRXP_ENEMY_北海暴徒|r 和|cRXP_ENEMY_北海雇佣兵|r , 搜刮他们的|cRXP_LOOT_耳朵|r
.complete 11866,1 
.mob Northsea Mercenary
.mob Northsea Thug
step
#sticky
#label wine
.goto BoreanTundra,61.90,65.67
>>打开水下的|cRXP_PICK_酒箱|r. 从中获取|cRXP_LOOT_库尔提拉斯美酒|r
.complete 11603,1 
step
.goto BoreanTundra,61.0,66.5,30,0
.goto BoreanTundra,62.5,66.2
>>杀死水下的蛤蜊主宰老K
.complete 11872,1 
.unitscan Clam Master K
step
#requires wine
#completewith next
.goto BoreanTundra,58.5,68.2,100 >>前往无畏要塞
step

.goto BoreanTundra,58.53,68.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Colburn|r交谈
.turnin 11603 >>交任务: |cRXP_FRIENDLY_酒中的真相|r
.accept 11604 >>接任务: |cRXP_LOOT_逃兵|r
.target Old Man Colburn

step
.goto BoreanTundra,57.93,71.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗里克·玛克雷尔|r交谈
.turnin 13088 >>交任务: |cRXP_FRIENDLY_诺森德的厨师|r
.isQuestComplete 13088
.skill cooking,<350,1
.target Rollick MacKreel
step
#completewith next
.goto BoreanTundra,56.9,72.2,10 >>前往无畏要塞监狱
step
.goto BoreanTundra,56.68,71.44
>>跑下楼梯前往监狱
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Brau|r交谈
.turnin 11604 >>交任务: |cRXP_FRIENDLY_逃兵|r
.accept 11932 >>接任务: |cRXP_LOOT_懦夫和蠢货|r
.target Private Brau
step
#completewith next
.goto BoreanTundra,56.9,72.2,10,0
.goto BoreanTundra,58.97,68.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师托马斯|r交谈
.fly Amber Ledge >>飞往琥珀崖
.target Tomas Riverwell
step
>>击杀|cRXP_ENEMY_蓝玉法师猎手|r. 击败他们后可获得|T134242:0|t[|cRXP_LOOT_蓝玉监牢钥匙|r ]
>>|cRXP_WARN_使用|r|T134242:0|t[|cRXP_LOOT_蓝玉监牢钥匙|r] |cRXP_WARN_在|r|cRXP_PICK_奥术牢笼 上|r
>>|cRXP_WARN_继续打开|cRXP_PICK_奥术牢笼|r, 直到你成功解救出一名|cRXP_FRIENDLY_奥术囚犯|r|r
.collect 34688,1,11587,0x1,-1 
#loop
.line BoreanTundra,42.60,36.75,40.43,39.16,41.78,42.53,42.60,36.75
.goto BoreanTundra,42.60,36.75,20,0
.goto BoreanTundra,40.43,39.16,20,0
.goto BoreanTundra,41.78,42.53,20,0
.goto BoreanTundra,42.60,36.75,20,0
.complete 11587,1 
.goto BoreanTundra,42.60,36.75,40,0
.goto BoreanTundra,40.43,39.16,40,0
.goto BoreanTundra,41.78,42.53
.mob Beryl Mage Hunter
step
#completewith next
.groundgoto BoreanTundra,45.03,37.97,60,0
.goto BoreanTundra,45.26,33.35,50 >>前往|cRXP_FRIENDLY_Donathan|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donathan|r交谈
.turnin 11587 >>交任务: |cRXP_FRIENDLY_越狱|r
.accept 11590 >>接任务: |cRXP_LOOT_调查|r
.goto BoreanTundra,45.26,33.35
.target Librarian Donathan
step
.goto BoreanTundra,43.2,36.6,60,0
.goto BoreanTundra,41.6,37.4
.use 34691 >>|cRXP_WARN_对|cRXP_ENEMY_蓝玉巫师|r造成50%或更低的伤害. 切勿击杀|r |cRXP_ENEMY_蓝玉巫师|r|r
>>|cRXP_WARN_引导|r|T133273:0|t[奥术镣铐] |cRXP_WARN_在削弱后捕捉|r|cRXP_ENEMY_蓝玉巫师|r
.complete 11590,1 
.mob Beryl Sorcerer
step
#completewith next
.groundgoto BoreanTundra,45.03,37.97,60,0
.goto BoreanTundra,45.26,33.35,50 >>前往|cRXP_FRIENDLY_Donathan|r
>>|cRXP_WARN_你可以忽略 |cRXP_ENEMY_蓝玉巫师|r. 它会继续跟随你|r
step
.goto BoreanTundra,45.26,33.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Donathan|r交谈
.turnin 11590 >>交任务: |cRXP_FRIENDLY_调查|r
.accept 11646 >>接任务: |cRXP_LOOT_苔原上的审讯|r
.target Librarian Donathan
step
#completewith next
.goto BoreanTundra,46.60,32.94,40 >>进入法师塔. 跑到一楼
step
.goto BoreanTundra,46.32,32.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Normantis|r交谈
.turnin 11646 >>交任务: |cRXP_FRIENDLY_苔原上的审讯|r
.accept 11648 >>接任务: |cRXP_LOOT_说服的艺术|r
.target Librarian Normantis
step
.goto BoreanTundra,46.33,32.92
.use 34811 >>|cRXP_WARN_对旁边的|cRXP_ENEMY_被封印的蓝玉巫师|r使用|r |T135470:0|t[催眠魔杖]|cRXP_WARN_攻击, 直到任务目标完成|r
.complete 11648,1 
.mob Imprisoned Beryl Sorcerer
step
.goto BoreanTundra,46.32,32.84
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Normantis|r交谈
.turnin 11648 >>交任务: |cRXP_FRIENDLY_说服的艺术|r
.accept 11663 >>接任务: |cRXP_LOOT_分享情报|r
.target Librarian Normantis
step
.goto BoreanTundra,45.26,33.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_Donathan|r交谈
.turnin 11663 >>交任务: |cRXP_FRIENDLY_分享情报|r
.accept 11671 >>接任务: |cRXP_LOOT_与时间赛跑|r
.target Librarian Donathan
step
#completewith next
.goto BoreanTundra,41.30,41.79,70,0
.goto BoreanTundra,39.85,42.18,50,0 << !Shaman !DK
.goto BoreanTundra,38.46,43.37,50,0 << !Shaman !DK
.goto BoreanTundra,35.15,43.52,50,0 << !Shaman !DK
.goto BoreanTundra,34.44,42.35,50 >>前往西部裂谷
>>|cRXP_WARN_施放 |T135863:0|t[水上行走] 以穿越水域|r << Shaman
>>|cRXP_WARN_施放 |T237528:0|t[冰霜之路]以跨越水面|r << DK
.skill coldweatherflying,1,1
step
.goto BoreanTundra,34.44,42.35
.use 34669 >>|cRXP_WARN_使用|r|T133015:0|t[奥术测量器] |cRXP_WARN_在 |cRXP_PICK_Cleftcliff 异常点|r on the ground|r
.complete 11576,1 
.skill coldweatherflying,1,1
step
#completewith next
.goto BoreanTundra,34.44,42.35,100 >>前往西部裂谷
.skill coldweatherflying,<1,1
step
.goto BoreanTundra,34.44,42.35
.use 34669 >>|cRXP_WARN_使用|r|T133015:0|t[奥术测量器] |cRXP_WARN_在 |cRXP_PICK_Cleftcliff 异常点|r on the ground|r
.complete 11576,1 
.skill coldweatherflying,<1,1
step
#completewith next
.goto BoreanTundra,35.15,43.52,40,0 << !Shaman !DK
.goto BoreanTundra,38.46,43.37,50,0 << !Shaman !DK
.goto BoreanTundra,39.85,42.18,50,0 << !Shaman !DK
.goto BoreanTundra,41.30,41.79,70,0
.goto BoreanTundra,41.80,39.16,100 >>返回蓝玉营地
>>|cRXP_WARN_施放 |T135863:0|t[水上行走] 以穿越水域|r << Shaman
>>|cRXP_WARN_施放 |T237528:0|t[冰霜之路]以跨越水面|r << DK
.skill coldweatherflying,1,1
step
#completewith next
.cast 45780 >>|cRXP_WARN_使用|r|T133709:0|t[蓝玉护盾炸药] |cRXP_WARN_来禁用 |cRXP_ENEMY_审判者萨兰德的|r护盾|r
.use 34897
.skill coldweatherflying,1,1
step
.goto BoreanTundra,41.80,39.16
.use 34897 >>击杀|cRXP_ENEMY_审讯者莎尔兰德|r. 击败她后, 拾取地上掉落的|cRXP_PICK_莎尔兰德的箱子|r, 从中获得|cRXP_LOOT_损坏的钥匙|r
.complete 11671,1 
.mob Inquisitor Salrand
.skill coldweatherflying,1,1
step
#completewith next
.goto BoreanTundra,41.80,39.16,100 >>前往蓝玉营地
.skill coldweatherflying,<1,1
step
#completewith next
.cast 45780 >>|cRXP_WARN_使用|r|T133709:0|t[蓝玉护盾炸药] |cRXP_WARN_来禁用 |cRXP_ENEMY_审判者萨兰德的|r护盾|r
.use 34897
.skill coldweatherflying,<1,1
step
.goto BoreanTundra,41.80,39.16
.use 34897 >>击杀|cRXP_ENEMY_审讯者莎尔兰德|r. 击败她后, 拾取地上掉落的|cRXP_PICK_莎尔兰德的箱子|r, 从中获得|cRXP_LOOT_损坏的钥匙|r
.complete 11671,1 
.mob Inquisitor Salrand
.skill coldweatherflying,<1,1
step
#completewith next
.groundgoto BoreanTundra,45.03,37.97,60,0
.goto BoreanTundra,45.26,33.35,60 >>前往琥珀崖
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Garren|r和|cRXP_FRIENDLY_Donathan|r和|cRXP_FRIENDLY_苏雷斯塔兹|r交谈
.turnin 11576 >>交任务: |cRXP_FRIENDLY_监视裂谷：悬崖异常|r
.accept 11582 >>接任务: |cRXP_LOOT_监视裂谷：峭壁断层|r
.goto BoreanTundra,44.98,33.38
.turnin 11671 >>交任务: |cRXP_FRIENDLY_与时间赛跑|r
.accept 11679 >>接任务: |cRXP_LOOT_重铸钥匙|r
.goto BoreanTundra,45.26,33.35
.turnin 11679 >>交任务: |cRXP_FRIENDLY_重铸钥匙|r
.accept 11680 >>接任务: |cRXP_LOOT_准备飞翔|r
.goto BoreanTundra,45.33,34.62
.target Librarian Donathan
.target Librarian Garren
.target Surristrasz
step
.goto BoreanTundra,46.38,37.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Anzim|r交谈
.turnin 11680 >>交任务: |cRXP_FRIENDLY_准备飞翔|r
.accept 11681 >>接任务: |cRXP_LOOT_营救艾瓦诺尔|r
.timer 53,Rescuing Evanor RP
.target Warmage Anzim
step
.goto BoreanTundra,43.01,43.86,-1
.goto BoreanTundra,46.37,32.39,-1
>>|cRXP_WARN_等待飞行和角色扮演(RP)结束. 当所有角色扮演完成后, 你将被传送到任务提交地点|r
>>|cRXP_WARN_如果活动尚未开始, 请放弃“营救艾瓦诺尔”任务并重新接受|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃瓦诺尔|r交谈
.turnin 11681 >>交任务: |cRXP_FRIENDLY_营救艾瓦诺尔|r
.accept 11682 >>接任务: |cRXP_LOOT_苏雷斯塔兹|r
.target Archmage Evanor
step
.goto BoreanTundra,43.83,29.41
>>|cRXP_WARN_小心沿山路下行, 或跳入山下的水中|r
.use 34669 >>|cRXP_WARN_使用|r|T133015:0|t[奥术测量器] |cRXP_WARN_在海底的 |cRXP_PICK_Sundered Chasm|r|r
.complete 11582,1 
.skill coldweatherflying,1,1
step
.goto BoreanTundra,43.83,29.41
>>|cRXP_WARN_飞入下方的水中|r
.use 34669 >>|cRXP_WARN_使用|r|T133015:0|t[奥术测量器] |cRXP_WARN_在海底的 |cRXP_PICK_Sundered Chasm|r|r
.complete 11582,1 
.skill coldweatherflying,<1,1
step << wotlk
#completewith next
.groundgoto BoreanTundra,45.5,31.2,20,0
.groundgoto BoreanTundra,47.12,29.16,20,0
.goto BoreanTundra,50.07,30.72,80 >>前往冷石采掘场
step << wotlk
#completewith next
.goto BoreanTundra,54.1,34.5,0,0
.goto BoreanTundra,52.0,30.6,0
.goto BoreanTundra,50.9,33.4,0
>>击杀 |cRXP_ENEMY_Beryl 蓝玉财宝猎人|r
.complete 11612,1 
.mob Beryl Treasure Hunter
step << wotlk
>>点击地面上的标记:|cRXP_PICK_"Elder Kesuk"|r和|cRXP_PICK_"Elder Takret"|r 和 |cRXP_PICK_"Elder Sagani"|r
.complete 11605,1 
.goto BoreanTundra,50.86,32.43
.complete 11605,3 
.goto BoreanTundra,52.31,31.13
.complete 11605,2 
.goto BoreanTundra,52.81,34.02
step << wotlk
.goto BoreanTundra,54.1,34.5,70,0
.goto BoreanTundra,52.0,30.6,70,0
.goto BoreanTundra,50.9,33.4,70,0
.goto BoreanTundra,54.1,34.5
>>击杀 |cRXP_ENEMY_Beryl 蓝玉财宝猎人|r
.complete 11612,1 
.mob Beryl Treasure Hunter
step << wotlk
.goto BoreanTundra,54.63,35.88
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Atkanok|r 交谈
.turnin 11605 >>交任务: |cRXP_FRIENDLY_海象人的先祖|r
.accept 11607 >>接任务: |cRXP_LOOT_失落的灵魂|r
step << wotlk
.goto BoreanTundra,54.29,36.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊塔鲁克|r交谈
.turnin 11612 >>交任务: |cRXP_FRIENDLY_夺回采掘场|r
.accept 11617 >>接任务: |cRXP_LOOT_别让他们逃了！|r
.target Etaruk
step << wotlk
#label cores
#completewith coresEnd
.waypoint BoreanTundra,51.7,31.6,15,0
.waypoint BoreanTundra,52.3,31.0,40,0
.waypoint BoreanTundra,51.0,32.3,40,0
.goto BoreanTundra,51.7,31.6,0,0
>>击杀|cRXP_ENEMY_蓝玉猎犬|r. 击杀后搜刮其掉落的 |T134337:0|t[|cRXP_LOOT_恶毒岩核|r]
.use 34711 >>|cRXP_WARN_使用|r|T134337:0|t[|cRXP_LOOT_恶毒岩核|r], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_卡斯卡拉工匠|r和|r|cRXP_FRIENDLY_卡斯卡拉萨满祭司|r
.collect 34711,6,11607,0x3,-1 
.complete 11607,1 
.complete 11607,2 
.mob Beryl Hound
step << wotlk
.goto BoreanTundra,52.6,35.5
>>击杀|cRXP_ENEMY_蓝玉回收者|r. 掠夺他们以获得 |T133717:0|t[|cRXP_LOOT_侏儒手雷|r]
>>|cRXP_WARN_站在悬崖边缘|r
.use 34772 >>|cRXP_WARN_使用|r|T133717:0|t[|cRXP_LOOT_侏儒手雷|r] |cRXP_WARN_摧毁|r|cRXP_PICK_东部平台|r
.collect 34772,3,11617,0x7,-1 
.complete 11617,1 
.mob Beryl Reclaimer
step << wotlk
.goto BoreanTundra,50.3,34.1
>>击杀|cRXP_ENEMY_蓝玉回收者|r. 掠夺他们以获得 |T133717:0|t[|cRXP_LOOT_侏儒手雷|r]
>>|cRXP_WARN_站在悬崖边缘|r
.use 34772 >>|cRXP_WARN_使用|r|T133717:0|t[|cRXP_LOOT_侏儒手雷|r]|cRXP_WARN_摧毁|r|cRXP_PICK_西部平台|r
.collect 34772,3,11617,0x7,-1 
.complete 11617,3 
.mob Beryl Reclaimer
step << wotlk
#label North
.goto BoreanTundra,52.6,32.4
>>击杀|cRXP_ENEMY_蓝玉回收者|r. 掠夺他们以获得 |T133717:0|t[|cRXP_LOOT_侏儒手雷|r]
>>|cRXP_WARN_站在|r|cRXP_PICK_北部平台正下方|r
.use 34772 >>|cRXP_WARN_使用|r|T133717:0|t[|cRXP_LOOT_侏儒手雷|r]|cRXP_WARN_摧毁|r|cRXP_PICK_北部平台|r
.collect 34772,3,11617,0x7,-1 
.complete 11617,2 
.mob Beryl Reclaimer
step << wotlk
#requires cores
#label coresEnd
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊塔鲁克|r和|cRXP_FRIENDLY_伊塔鲁克|r交谈
.turnin 11607 >>交任务: |cRXP_FRIENDLY_失落的灵魂|r
.accept 11609 >>接任务: |cRXP_LOOT_寻找古器|r
.goto BoreanTundra,54.63,35.88
.turnin 11617 >>交任务: |cRXP_FRIENDLY_别让他们逃了！|r
.accept 11623 >>接任务: |cRXP_LOOT_拜访馆长|r
.goto BoreanTundra,54.29,36.09
.target Etaruk
step << wotlk
#completewith next
.goto BoreanTundra,51.2,36.5,50,0
.goto BoreanTundra,52.9,32.6,0
>>拾取地面上的|cRXP_LOOT_海象人仪式道具|r
>>|cRXP_WARN_它们看起来像白蓝色的香炉或铁砧|r
.complete 11609,1 
step << wotlk
.goto BoreanTundra,50.1,32.6
>>击杀|cRXP_ENEMY_馆长因萨维斯|r
.complete 11623,1 
.mob Curator Insivius
step << wotlk
.goto BoreanTundra,52.9,32.6,70,0
.goto BoreanTundra,53.9,35.0,70,0
.goto BoreanTundra,50.9,33.2
>>拾取地面上的|cRXP_LOOT_海象人仪式道具|r
>>|cRXP_WARN_它们看起来像白蓝色的香炉或铁砧|r
.complete 11609,1 
step << wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊塔鲁克|r和|cRXP_FRIENDLY_伊塔鲁克|r交谈
.turnin 11609 >>交任务: |cRXP_FRIENDLY_寻找古器|r
.accept 11610 >>接任务: |cRXP_LOOT_先祖的回归|r
.goto BoreanTundra,54.63,35.88
.turnin 11623 >>交任务: |cRXP_FRIENDLY_拜访馆长|r
.goto BoreanTundra,54.29,36.09
.target Etaruk
step << wotlk
.use 34715 >>|cRXP_WARN_使用|r|T134378:0|t[海象人仪式道具]|cRXP_WARN_放置在|cRXP_PICK_"老萨加尼"|r和|cRXP_PICK_"老塔克雷特"|r和|cRXP_PICK_"老凯苏克"|r的标记附近|r
>>|cRXP_WARN_请勿等待剧情任务|r
.complete 11610,2 
.goto BoreanTundra,52.81,34.04
.complete 11610,3 
.goto BoreanTundra,52.32,31.15
.complete 11610,1 
.goto BoreanTundra,50.85,32.40
step << wotlk
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Atkanok|r 交谈
.turnin 11610 >>交任务: |cRXP_FRIENDLY_先祖的回归|r
.goto BoreanTundra,54.63,35.88
step
#completewith next
.goto BoreanTundra,57.05,44.32,120 >>前往仁德会营地
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎扎|r和|cRXP_FRIENDLY_拉索留斯|r和|cRXP_FRIENDLY_塞妮丝|r谈话
.turnin 11868 >>交任务: |cRXP_FRIENDLY_驯鹿杀手之死|r
.goto BoreanTundra,56.80,44.04
.turnin 11866 >>交任务: |cRXP_FRIENDLY_敌人的耳环|r
.accept 11878 >>接任务: |cRXP_LOOT_库诺克的智慧|r
.goto BoreanTundra,57.05,44.32
.turnin 11872 >>交任务: |cRXP_FRIENDLY_罪恶的蛤蜊主宰……|r
.goto BoreanTundra,57.33,44.08
.target Hierophant Cenius
.target Zaza
.target Arch Druid Lathorius
step << skip
.goto BoreanTundra,57.0,44.3,0
.goto BoreanTundra,59.25,30.83
>>护送|cRXP_FRIENDLY_猛犸幼崽|r向北至|cRXP_FRIENDLY_Khu'Nok|r. |cRXP_WARN_请勿超出渲染范围(100码), 否则幼崽会消失|r
>>|cRXP_WARN_如果小牛消失, 请放弃并重新从|r|cRXP_FRIENDLY_Lathorius处接取任务|r
.complete 11878,1 
.target Khu'nok the Behemoth
.target Arch Druid Lathorius
step
#completewith next
.goto BoreanTundra,59.43,30.38,80 >>前往|cRXP_FRIENDLY_Khu'nok|r
step
.goto BoreanTundra,59.43,30.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Khu'nok|r交谈
.turnin 11878 >>交任务: |cRXP_FRIENDLY_库诺克的智慧|r
.accept 11879 >>接任务: |cRXP_LOOT_猛犸毁灭者卡奥|r
.target Khu'nok the Behemoth
step
#completewith next
.goto BoreanTundra,53.7,24.4
.vehicle >>点击一只|cRXP_FRIENDLY_雄性长毛猛犸象|r以骑乘它
.unitscan Wooly Mammoth Bull
step
.goto BoreanTundra,53.84,24.08
>>接近|cRXP_ENEMY_猛犸毁灭者卡奥|r后与其战斗
>>|cRXP_WARN_施放|r|T132337:0|t[猛犸冲锋] (2)|cRXP_WARN_造成伤害并击晕3秒|r
>>|cRXP_WARN_施放|r |T132255:0|t[猛犸践踏] (1) |cRXP_WARN_在近战范围内造成大量伤害|r
>>|cRXP_WARN_或者, 如果你的伤害很高, 可以在下马时更快地击杀|cRXP_ENEMY_猛犸毁灭者卡奥|r|r
>>击杀|cRXP_ENEMY_猛犸毁灭者卡奥|r. 从|cRXP_FRIENDLY_雄性长毛猛犸象|r上下来. 在地面上拾取|cRXP_LOOT_卡奥的战戟|r
.complete 11879,1 
.mob Kaw the Mammoth Destroyer
step
#completewith next
.goto BoreanTundra,56.56,20.07,100 >>前往菲兹兰克机场
step
.goto BoreanTundra,56.56,20.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_暴风城|r
.fp Fizzcrank >>获取菲兹兰克机场飞行路线
.target Kara Thricestar
step
#completewith next
.goto BoreanTundra,57.05,44.32,120 >>前往仁德会营地
step
.goto BoreanTundra,57.05,44.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱索里乌斯|r交谈
.turnin 11879 >>交任务: |cRXP_FRIENDLY_猛犸毁灭者卡奥|r
.accept 11892 >>接任务: |cRXP_LOOT_刺杀哈罗德·兰恩|r
.target Arch Druid Lathorius
step
.goto BoreanTundra,49.90,41.50
.use 35293 >>击杀|cRXP_ENEMY_哈罗德·兰恩|r
>>|cRXP_WARN_使用|r|T134229:0|t[塞纳里奥号角] |cRXP_WARN_召唤 |cRXP_FRIENDLY_狂奔的猛犸象|r, 这将对 |cRXP_ENEMY_哈罗德·兰恩|r造成大量伤害. 请远离他放置的任何陷阱
>>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r << wotlk
.complete 11892,1 
.unitscan Harold Lane
.isOnQuest 11892
step
.goto BoreanTundra,57.05,44.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱索里乌斯|r交谈
.turnin 11892 >>交任务: |cRXP_FRIENDLY_刺杀哈罗德·兰恩|r
.isQuestComplete 11892
.target Arch Druid Lathorius
step
#sticky
#label AbandonAss
.goto BoreanTundra,63.8,46.1
.abandon 11892 >>放弃刺杀哈罗德·兰恩
step
#completewith next
.goto BoreanTundra,63.80,46.12,80 >>前往卡斯卡拉
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿泰卡|r和|cRXP_FRIENDLY_乌泰克|r交谈
.turnin 11932 >>交任务: |cRXP_FRIENDLY_懦夫和蠢货|r
.accept 12086 >>接任务: |cRXP_LOOT_卡库特之子|r
.accept 11949 >>接任务: |cRXP_LOOT_战斗到底！|r
.goto BoreanTundra,63.80,46.12
.daily 11945 >>接任务: |cRXP_LOOT_做最坏的打算|r
.goto BoreanTundra,63.95,45.72
.target Ataika
.target Utaik
step
#requires AbandonAss
#completewith Raiders
.goto BoreanTundra,66.2,45.9,0
.goto BoreanTundra,63.7,52.2,0
>>掠夺地面上的|cRXP_LOOT_卡斯卡拉补给品|r
.complete 11945,1 
.isOnQuest 11945
step << !DK
#requires AbandonAss
.goto BoreanTundra,67.3,47.7,60,0
.goto BoreanTundra,63.61,53.93
>>击杀|cRXP_ENEMY_Kvaldir 克瓦迪尔劫掠者|r
.complete 11949,1 
.skill coldweatherflying,1,1
.mob Kvaldir Raider
step
#requires AbandonAss
#label Raiders
.goto BoreanTundra,67.3,47.7,60,0
.goto BoreanTundra,63.61,53.93,60,0
.goto BoreanTundra,66.38,55.90,60,0
.goto BoreanTundra,67.96,56.69
>>击杀|cRXP_ENEMY_Kvaldir 克瓦迪尔劫掠者|r
.complete 11949,1 
.skill coldweatherflying,<1,1 << !DK
.mob Kvaldir Raider
step
.goto BoreanTundra,67.3,47.7,60,0
.goto BoreanTundra,63.61,53.93,60,0
.goto BoreanTundra,66.38,55.90,60,0
.goto BoreanTundra,67.96,56.69
>>掠夺地面上的|cRXP_LOOT_卡斯卡拉补给品|r
.complete 11945,1 
.isOnQuest 11945
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿泰卡|r和|cRXP_FRIENDLY_乌泰克|r交谈
.turnin 11949 >>交任务: |cRXP_FRIENDLY_战斗到底！|r
.accept 11950 >>接任务: |cRXP_LOOT_穆希特的智慧|r
.goto BoreanTundra,63.80,46.12
.turnin 11945 >>交任务: |cRXP_FRIENDLY_做最坏的打算|r
.goto BoreanTundra,63.95,45.72
.isOnQuest 11945
.target Ataika
.target Utaik
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿泰卡|r交谈
.turnin 11949 >>交任务: |cRXP_FRIENDLY_战斗到底！|r
.accept 11950 >>接任务: |cRXP_LOOT_穆希特的智慧|r
.goto BoreanTundra,63.80,46.12
.target Ataika
step
#completewith next
.goto BoreanTundra,67.21,54.86,100 >>前往|cRXP_FRIENDLY_Muahit|r
step
.goto BoreanTundra,67.21,54.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Muahit|r交谈
.turnin 11950 >>交任务: |cRXP_FRIENDLY_穆希特的智慧|r
.accept 11961 >>接任务: |cRXP_LOOT_神灵的眷顾|r
.target Elder Muahit
step
.goto BoreanTundra,67.65,50.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与水下的|cRXP_FRIENDLY_Iruk的|r尸体交谈
.complete 11961,1 
.skipgossip
.target Iruk
step
.goto BoreanTundra,67.21,54.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Muahit|r交谈
.turnin 11961 >>交任务: |cRXP_FRIENDLY_神灵的眷顾|r
.accept 11968 >>接任务: |cRXP_LOOT_情势扭转|r
.target Elder Muahit
step
.goto BoreanTundra,67.41,56.87
>>击杀 |cRXP_ENEMY_可怕的赫迦尔|r
>>|cRXP_WARN_如果他的血量低于50%, 你第一次可能无法获得任务奖励|r
.complete 11968,1 
.unitscan Heigarr the Horrible
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Muahit|r和|cRXP_FRIENDLY_霍塔瓦|r交谈
.turnin 11968 >>交任务: |cRXP_FRIENDLY_情势扭转|r
.goto BoreanTundra,67.21,54.86
.accept 12117 >>接任务: |cRXP_LOOT_前往莫亚基港口|r
.goto BoreanTundra,67.27,54.86
.target Elder Muahit
.target Hotawa
step << skip
.goto BoreanTundra,78.5,51.5
>>前往乌努比
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bilko|r交谈
.fp Unu'pe >>获取乌努比的飞行点
.target Bilko Driftspark
step
#completewith next
.goto BoreanTundra,82.01,46.42,100 >>前往死亡营地
step
.goto BoreanTundra,82.01,46.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Venn|r交谈
.turnin 12086 >>交任务: |cRXP_FRIENDLY_卡库特之子|r
.accept 11944 >>接任务: |cRXP_LOOT_我们被包围了！|r
.target Corporal Venn
step
#level 71
.goto BoreanTundra,82.17,46.40
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Casey|r交谈
.accept 12157 >>接任务: |cRXP_LOOT_失踪的信使|r
.target Private Casey
step
.goto BoreanTundra,81.46,43.80,50,0
.goto BoreanTundra,82.78,43.69,50,0
.goto BoreanTundra,83.24,40.40,50,0
.goto BoreanTundra,81.46,43.80
>>击杀|cRXP_ENEMY_通灵塔防御者|r
.complete 11944,1 
.mob Ziggurat Defender
step
.goto BoreanTundra,82.01,46.42
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Venn|r交谈
.turnin 11944 >>交任务: |cRXP_FRIENDLY_我们被包围了！|r
.accept 12088 >>接任务: |cRXP_LOOT_死亡骑士萨萨里安|r
.target Corporal Venn
step
#completewith next
.goto BoreanTundra,84.7,41.0,30 >>前往通灵塔内与萨萨里安会合
step
.goto BoreanTundra,84.80,41.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨萨里安|r交谈
.turnin 12088 >>交任务: |cRXP_FRIENDLY_死亡骑士萨萨里安|r
.accept 11956 >>接任务: |cRXP_LOOT_寻找护命匣|r
.target Thassarian
step
.goto BoreanTundra,85.40,33.34
>>点击水下的|cRXP_PICK_冰冻的护命匣|r来召唤|cRXP_ENEMY_护命匣卫士|r
>>击杀|cRXP_ENEMY_护命匣卫士|r, 搜刮出|cRXP_LOOT_Tanathal's Phylactery|r
.complete 11956,1 
.mob Phylactery Guardian
step
.goto BoreanTundra,84.80,41.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨萨里安|r交谈
.turnin 11956 >>交任务: |cRXP_FRIENDLY_寻找护命匣|r
.accept 11938 >>接任务: |cRXP_LOOT_争取时间|r
.target Thassarian
step
.goto BoreanTundra,84.42,32.06,60,0
.goto BoreanTundra,83.35,30.70,60,0
.goto BoreanTundra,85.28,28.18,60,0
.goto BoreanTundra,86.85,28.94,60,0
.goto BoreanTundra,88.14,27.45,60,0
.goto BoreanTundra,84.49,24.31,60,0
.goto BoreanTundra,85.7,27.3
.use 35944 >>击杀|cRXP_ENEMY_En'kilah|r
>>|cRXP_WARN_使用|r|T133730:0|t[鲁瑞德的遗骨]|cRXP_WARN_召唤|cRXP_FRIENDLY_鲁瑞德|r来协助你击杀|r|cRXP_ENEMY_恩基拉|r
.complete 11938,1 
.mob En'kilah Necromancer
.mob En'kilah Abomination
.mob En'kilah Crypt Fiend
.mob En'kilah Gargoyle
.mob En'kilah Ghoul
.mob En'kilah Necrolord
step
.goto BoreanTundra,84.80,41.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨萨里安|r交谈
.turnin 11938 >>交任务: |cRXP_FRIENDLY_争取时间|r
.accept 11942 >>接任务: |cRXP_LOOT_通行之语|r
.target Thassarian
step
#completewith next
.groundgoto BoreanTundra,85.0,28.9,70,0
.goto BoreanTundra,88.59,28.30,40 >>前往恩其拉的苦痛尖塔
step
.goto BoreanTundra,89.38,28.86
>>击杀|cRXP_ENEMY_神秘的蛛网|r 以解救|cRXP_ENEMY_高阶祭司塔雷坎|r
>>击杀|cRXP_ENEMY_高阶祭司塔雷坎|r. 击败他后搜刮其掉落的|cRXP_LOOT_卷轴|r
.complete 11942,3 
.mob High Priest Talet-Kha
.mob Mystical Webbing

step
#completewith next
.groundgoto BoreanTundra,87.7,22.0,40,0
.goto BoreanTundra,88.68,21.72,25 >>前往恩其拉的鲜血尖塔. 从侧门进入
step
.goto BoreanTundra,88.05,20.94
>>击杀|cRXP_ENEMY_高阶祭司安多拉斯|r. 击败他后搜刮其掉落的|cRXP_LOOT_卷轴|r
.complete 11942,1 
.mob High Priest Andorath
step
#completewith next
.goto BoreanTundra,84.2,21.8,40 >>前往凋零尖塔
step
.goto BoreanTundra,83.9,20.5
>>击杀|cRXP_ENEMY_恩基拉亡灵巫师|r以解救|cRXP_ENEMY_高阶祭司纳菲塞特|r
>>击杀|cRXP_ENEMY_高阶祭司纳菲塞特|r. 击败他后搜刮出他的|cRXP_LOOT_卷轴|r
.complete 11942,2 
.mob High Priest Naferset
.mob En'kilah Necromancer
step
.goto BoreanTundra,84.80,41.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨萨里安|r交谈
.turnin 11942 >>交任务: |cRXP_FRIENDLY_通行之语|r
.accept 12019 >>接任务: |cRXP_LOOT_最后的义务|r
.target Thassarian
step
#optional << !wotlk
#completewith lastrites
.goto BoreanTundra,86.5,28.7,15 >>|cRXP_WARN_乘坐传送器前往天空中的金字形神塔|r
.goto BoreanTundra,86.7,30.2,8 >>|cRXP_WARN_使用第一个传送器后, 前往你首次进入时位于绿色圆圈正上方的第二个(蓝色)传送器|r
.isOnQuest 12019
.noflyable
step
#optional << wotlk
.goto BoreanTundra,86.64,31.38
.subzone 4128>>飞到漂浮在空中的金字形神塔的屋顶上
.flyable << wotlk
step
#completewith next
#label lastrites
.goto BoreanTundra,86.64,31.38
.gossipoption 93099 >>与|cRXP_FRIENDLY_萨萨里安|r交谈以开始角色扮演
.timer 142,Last Rites RP
.skipgossip
.target Thassarian
.isOnQuest 12019
step
>>击杀|cRXP_ENEMY_瓦拉纳王子|r
>>|cRXP_WARN_在你开始造成伤害之前, 先让|r萨萨里安|r吸引住|r瓦拉纳王子|r的注意力几秒钟|r
>>|cRXP_WARN_当心|r|T136157:0|t[灵魂反弹]
>>|cRXP_WARN_此减益效果|cRXP_ENEMY_瓦拉纳王子|r适用于你, 会在6秒内反射你造成的100%伤害. 在此期间请停止攻击. 如果你对|cRXP_ENEMY_瓦拉纳王子|r施加了持续伤害(DoT), 这些伤害也会被反射|r
>>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r << wotlk
.complete 12019,1 
.goto BoreanTundra,86.7,30.2
.mob Prince Valanar
step << wotlk

.goto BoreanTundra,86.80,30.58
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与位于高塔顶端的|cRXP_FRIENDLY_萨萨里安|r交谈
.turnin 12019 >>交任务: |cRXP_FRIENDLY_最后的义务|r
.target Thassarian
step << !wotlk
.goto 114/571,3683.900,3297.400
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨萨里安|r交谈
.target Thassarian
.turnin 12019 >>交任务: |cRXP_FRIENDLY_最后的义务|r
step
#completewith next
.goto BoreanTundra,86.96,28.93,12,0
.goto BoreanTundra,86.96,28.93,10 >>|cRXP_WARN_使用传送器前往地面|r
.noflyable
step
#completewith next
.groundgoto BoreanTundra,85.15,28.46,50,0
.goto Dragonblight,29.15,55.32,150 >>前往龙骨荒野的群星之墓
.noflyable
step
.goto Dragonblight,29.15,55.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕蕾娜·银云|r交谈
.fp Stars' Rest >>获取群星之墓的飞行路径
.target Palena Silvercloud
step
.goto Dragonblight,28.83,56.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_信使兰森|r交谈
>>|cRXP_WARN_不要接受下一个任务|r
.turnin 12157 >>交任务: |cRXP_FRIENDLY_失踪的信使|r
.isOnQuest 12157
.target Courier Lanson
step
#completewith GarrenM
.hs >>传送至无畏要塞
step
#completewith GarrenM
.goto BoreanTundra,44.98,33.38,100 >>前往琥珀崖
.flyable
.skill riding,<300,1
step
#completewith GarrenM
.goto BoreanTundra,58.97,68.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师托马斯|r交谈
.fly Amber Ledge >>飞往琥珀崖
.skill riding,300,1
.target Tomas Riverwell
step
#label GarrenM
.goto BoreanTundra,44.98,33.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加伦|r交谈
.turnin 11582 >>交任务: |cRXP_FRIENDLY_监视裂谷：峭壁断层|r
.accept 12728 >>接任务: |cRXP_LOOT_监视裂谷：冬鳞洞穴|r
.target Librarian Garren
step 
.goto BoreanTundra,45.33,34.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏雷斯塔兹|r交谈
>>|cRXP_WARN_这将带你飞往寒冷之地. 此次飞行耗时1分2秒|r
.turnin 11682 >>交任务: |cRXP_FRIENDLY_苏雷斯塔兹|r
.accept 11733 >>接任务: |cRXP_LOOT_飞越裂谷|r
.timer 62,Coldarra flight
.target Surristrasz
step
#completewith next
.goto BoreanTundra,45.33,34.62
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏雷斯塔兹|r交谈
.fly Coldarra >>飞往寒冷之地考达拉
.target Surristrasz
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝林德|r和|cRXP_FRIENDLY_莱洛拉斯|r和|cRXP_FRIENDLY_塞尔拉|r交谈
.turnin 11733 >>交任务: |cRXP_FRIENDLY_飞越裂谷|r
.accept 11900 >>接任务: |cRXP_LOOT_监测数据|r
.accept 11910 >>接任务: |cRXP_LOOT_古树的秘密|r
.goto BoreanTundra,32.94,34.40
.accept 11918 >>接任务: |cRXP_LOOT_基本的训练|r
.goto BoreanTundra,33.32,34.54
.accept 11912 >>接任务: |cRXP_LOOT_冰冷的草莓|r
.goto BoreanTundra,33.49,34.38
.target Archmage Berinand
.target Raelorasz
.target Librarian Serrah
step
#sticky
#completewith Weaver1
>>击杀|cRXP_ENEMY_考达拉织法者|r
>>打开|cRXP_PICK_冰莓灌木|r. 击杀它们获取|cRXP_LOOT_冰莓果|r
.complete 11918,1 
.complete 11912,1 
.mob Coldarra Spellweaver
step
.goto BoreanTundra,32.69,27.79,70,0
.goto BoreanTundra,33.45,25.68,70,0
.goto BoreanTundra,33.73,29.97,70,0
.goto BoreanTundra,31.54,28.28,70,0
.goto BoreanTundra,34.79,26.95
.use 35648 >>击杀|cRXP_ENEMY_考达拉缚法者|r. 击败他们后可获得 |T134923:0|t[|cRXP_LOOT_闪耀的碎片|r ]
>>|cRXP_WARN_使用 |T134923:0|t[|cRXP_LOOT_闪耀的碎片|r] 开始任务|r
.collect 35648,1,11941,1 
.accept 11941 >>接任务: |cRXP_LOOT_奇怪……|r
.mob Coldarra Spellbinder
step
.goto BoreanTundra,33.31,34.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱洛拉斯|r交谈
.turnin 11941 >>交任务: |cRXP_FRIENDLY_奇怪……|r
.accept 11943 >>接任务: |cRXP_LOOT_牢笼|r
.target Raelorasz
step
#completewith splinters
>>击杀|cRXP_ENEMY_冰川古树|r和|cRXP_ENEMY_魔缚古树|r. 击败它们后拾取其掉落的|cRXP_LOOT_断片|r
.complete 11910,1 
.complete 11910,2 
.mob Glacial Ancient
.mob Magic-bound Ancient
step
.goto BoreanTundra,28.81,34.91,-1
.goto BoreanTundra,28.25,35.04,-1
>>点击地面上的|cRXP_PICK_考达拉地质监测仪|r
.complete 11900,2 
step
.goto BoreanTundra,24.14,29.60
>>击杀|r|cRXP_ENEMY_战争使者戈德拉克|r. 从他身上搜刮|r|cRXP_LOOT_能量核心|r
.complete 11943,1 
.mob Warbringer Goredrak
step
.goto BoreanTundra,22.36,24.21,-1
.goto BoreanTundra,22.62,23.42,-1
>>点击地面上的|cRXP_PICK_考达拉地质监测仪|r
.complete 11900,4 
step
.goto BoreanTundra,27.32,20.41
>>击杀|cRXP_ENEMY_塞鲁利恩将军|r. 击败他后搜刮出|cRXP_LOOT_牢笼外壳|r
.complete 11943,2 
.mob General Cerulean
step
#label Weaver1
.goto BoreanTundra,31.25,20.18,-1
.goto BoreanTundra,31.72,20.57,-1
>>点击地面上的|cRXP_PICK_考达拉地质监测仪|r
.complete 11900,3 
step
#sticky
#label berries2
#loop
.goto BoreanTundra,33.7,23.1,100,0
.goto BoreanTundra,34.3,31.2,100,0
.goto BoreanTundra,24.4,35.2,100,0
.goto BoreanTundra,21.5,26.9,100,0
.goto BoreanTundra,21.5,26.9,0
.goto BoreanTundra,24.4,35.2,0
.goto BoreanTundra,34.3,31.2,0
.goto BoreanTundra,33.7,23.1,0
>>击杀|cRXP_ENEMY_考达拉织法者|r
.complete 11918,1 
.mob Coldarra Spellweaver
step
#loop
.goto BoreanTundra,33.7,23.1,100,0
.goto BoreanTundra,34.3,31.2,100,0
.goto BoreanTundra,24.4,35.2,100,0
.goto BoreanTundra,21.5,26.9,100,0
.goto BoreanTundra,21.5,26.9,0
.goto BoreanTundra,24.4,35.2,0
.goto BoreanTundra,34.3,31.2,0
.goto BoreanTundra,33.7,23.1,0
>>打开|cRXP_PICK_冰莓灌木|r. 击杀它们获取|cRXP_LOOT_冰莓果|r
.complete 11912,1 
step
#completewith next
.goto BoreanTundra,33.49,34.38,100 >>前往特拉努斯
step
#requires berries2
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱洛拉斯|r和|cRXP_FRIENDLY_Serrah|r交谈
.turnin 11912 >>交任务: |cRXP_FRIENDLY_冰冷的草莓|r
.accept 11914 >>接任务: |cRXP_LOOT_保持隐蔽|r
.goto BoreanTundra,33.49,34.38
.turnin 11918 >>交任务: |cRXP_FRIENDLY_基本的训练|r
.accept 11936 >>接任务: |cRXP_LOOT_蓝龙的卵|r
.turnin 11943 >>交任务: |cRXP_FRIENDLY_牢笼|r
.goto BoreanTundra,33.32,34.54
.target Raelorasz
.target Librarian Serrah
step
.use 35671 >>|cRXP_WARN_使用|r|T133836:0|t[强化过的奥术牢笼] |cRXP_WARN_来召唤|r|cRXP_FRIENDLY_克莉斯塔萨|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉斯塔萨|r交谈
.accept 11946 >>接任务: |cRXP_LOOT_克莉斯塔萨|r
.turnin 11946 >>交任务: |cRXP_FRIENDLY_克莉斯塔萨|r
.accept 11951 >>接任务: |cRXP_LOOT_诱饵|r
.target Keristrasza
step
#completewith next
#loop
.line BoreanTundra,28.69,30.93,30.12,28.57,29.84,24.39,27.68,22.32,25.25,24.59,25.39,28.67
.goto BoreanTundra,28.69,30.93,40,0
.goto BoreanTundra,30.12,28.57,40,0
.goto BoreanTundra,29.84,24.39,40,0
.goto BoreanTundra,27.68,22.32,40,0
.goto BoreanTundra,25.25,24.59,40,0
.goto BoreanTundra,25.39,28.67,40,0
>>打开|cRXP_PICK_晶化法力|r. 拾取它们以获得|cRXP_LOOT_法力水晶碎片|r
.complete 11951,1 
step
.goto BoreanTundra,29.5,30.81,90,0
.goto BoreanTundra,28.7,33.6,70,0
.goto BoreanTundra,27.5,31.3,70,0
.goto BoreanTundra,24.9,31.2,70,0
.goto BoreanTundra,25.2,24.2
>>击杀|cRXP_ENEMY_考达拉龙人|r. 击败他们后搜刮出 |T132394:0|t[|cRXP_LOOT_冰霜战斧|r]
.collect 35586,5,11936,1 
.mob Coldarra Wyrmkin
step
#loop
.line BoreanTundra,28.69,30.93,30.12,28.57,29.84,24.39,27.68,22.32,25.25,24.59,25.39,28.67
.goto BoreanTundra,28.69,30.93,40,0
.goto BoreanTundra,30.12,28.57,40,0
.goto BoreanTundra,29.84,24.39,40,0
.goto BoreanTundra,27.68,22.32,40,0
.goto BoreanTundra,25.25,24.59,40,0
.goto BoreanTundra,25.39,28.67,40,0
>>打开|cRXP_PICK_晶化法力|r. 拾取它们以获得|cRXP_LOOT_法力水晶碎片|r
.complete 11951,1 
step
#sticky
#label reading
.goto BoreanTundra,28.31,28.46
>>点击地面上的|cRXP_PICK_考达拉地质监测仪|r
.complete 11900,1 
step
#label splinters
.goto BoreanTundra,29.3,27.4,50,0
.goto BoreanTundra,28.2,24.4,50,0
.goto BoreanTundra,26.2,25.4,50,0
.goto BoreanTundra,26.04,27.72,50,0
.goto BoreanTundra,28.31,28.46,50,0
.goto BoreanTundra,29.3,27.4,50,0
.goto BoreanTundra,28.2,24.4,50,0
.goto BoreanTundra,26.2,25.4,50,0
.goto BoreanTundra,26.04,27.72,50,0
.goto BoreanTundra,28.31,28.46
>>击杀|cRXP_ENEMY_奥术浮蛇|r. 从它们身上搜刮|cRXP_LOOT_精华|r
>>|cRXP_WARN_使用|r|T132394:0|t[|cRXP_LOOT_冰霜战斧|r]|cRXP_WARN_在|r|cRXP_PICK_蓝龙卵|r
.collect 35586,5,11936,1,-1 
.complete 11936,1 
.complete 11914,1 
.mob Arcane Serpent
step
#requires reading
.goto BoreanTundra,30.1,23.4,70,0
.goto BoreanTundra,32.6,28.2,70,0
.goto BoreanTundra,28.0,33.5,70,0
.goto BoreanTundra,25.0,30.6,70,0
.goto BoreanTundra,25.5,35.6
>>击杀|cRXP_ENEMY_冰川古树|r和|cRXP_ENEMY_魔缚古树|r. 击败它们后拾取其掉落的|cRXP_LOOT_断片|r
.complete 11910,1 
.complete 11910,2 
.mob Glacial Ancient
.mob Magic-bound Ancient
step
.use 35671 >>|cRXP_WARN_使用|r|T133836:0|t[强化过的奥术牢笼] |cRXP_WARN_来召唤|r|cRXP_FRIENDLY_克莉斯塔萨|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉斯塔萨|r交谈
>>|cRXP_WARN_如果你弄丢了它, 去找|cRXP_FRIENDLY_莱洛拉斯|r重新领取一个|r
.turnin 11951 >>交任务: |cRXP_FRIENDLY_诱饵|r
.accept 11957 >>接任务: |cRXP_LOOT_莎拉苟萨的末日|r
.target Keristrasza
.target Raelorasz
step
.gossipoption 93094 >>与|cRXP_FRIENDLY_克莉斯塔萨|r对话, 传送至考达拉平台
.skipgossip
.target Keristrasza
.use 35671
.isOnQuest 11957
step
#completewith next
.goto BoreanTundra,21.30,22.44
.cast 46793 >>|cRXP_WARN_使用|r |T132866:0|t[奥术能量源] |cRXP_WARN_召唤|r |cRXP_ENEMY_莎拉苟萨|r
.timer 21,Saragosa's End RP
.use 35690
step
>>击杀|cRXP_ENEMY_莎拉苟萨|r. 从她身上搜刮|cRXP_LOOT_Corpse|r
.complete 11957,1 
.goto BoreanTundra,22.07,22.65
.use 35690
.skipgossip
.mob Saragosa
step
.use 35671 >>|cRXP_WARN_使用|r|T133836:0|t[强化过的奥术牢笼] |cRXP_WARN_来召唤|r|cRXP_FRIENDLY_克莉斯塔萨|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉斯塔萨|r交谈
.turnin 11957 >>交任务: |cRXP_FRIENDLY_莎拉苟萨的末日|r
.accept 11967 >>接任务: |cRXP_LOOT_集结红龙|r
.goto BoreanTundra,21.57,22.55
.cooldown item,35671,>30
.target Keristrasza
step
#questguide
.goto BoreanTundra,21.6,22.5,0
>>|cRXP_WARN_不要骑乘返回Transitus|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉斯塔萨|r谈话, 传送回特拉诺斯
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉|r和|cRXP_FRIENDLY_莱洛拉斯|r和|cRXP_FRIENDLY_贝林纳德|r交谈
.turnin 11914 >>交任务: |cRXP_FRIENDLY_保持隐蔽|r
.goto BoreanTundra,33.49,34.38
.turnin 11967 >>交任务: |cRXP_FRIENDLY_集结红龙|r
.turnin 11936 >>交任务: |cRXP_FRIENDLY_蓝龙的卵|r
.accept 11969 >>接任务: |cRXP_LOOT_触动陷阱|r
.accept 11919 >>接任务: |cRXP_LOOT_猎龙|r
.goto BoreanTundra,33.32,34.54
.turnin 11900 >>交任务: |cRXP_FRIENDLY_监测数据|r
.turnin 11910 >>交任务: |cRXP_FRIENDLY_古树的秘密|r
.goto BoreanTundra,32.94,34.40
.skipgossip
.isOnQuest 11967
.target Keristrasza
.target Archmage Berinand
.target Raelorasz
.target Librarian Serrah
step
#questguide
.goto BoreanTundra,21.6,22.5,0
>>飞回特拉努斯
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉|r和|cRXP_FRIENDLY_莱洛拉斯|r和|cRXP_FRIENDLY_贝林纳德|r交谈
.turnin 11914 >>交任务: |cRXP_FRIENDLY_保持隐蔽|r
.goto BoreanTundra,33.49,34.38
.turnin 11936 >>交任务: |cRXP_FRIENDLY_蓝龙的卵|r
.accept 11919 >>接任务: |cRXP_LOOT_猎龙|r
.goto BoreanTundra,33.32,34.54
.turnin 11900 >>交任务: |cRXP_FRIENDLY_监测数据|r
.turnin 11910 >>交任务: |cRXP_FRIENDLY_古树的秘密|r
.goto BoreanTundra,32.94,34.40
.skipgossip
.target Archmage Berinand
.target Raelorasz
.target Librarian Serrah
step
#optional
.goto BoreanTundra,21.6,22.5,0
>>|cRXP_WARN_不要骑乘返回Transitus|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉斯塔萨|r谈话, 传送回特拉诺斯
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉|r和|cRXP_FRIENDLY_莱洛拉斯|r和|cRXP_FRIENDLY_贝林纳德|r交谈
.turnin 11914 >>交任务: |cRXP_FRIENDLY_保持隐蔽|r
.goto BoreanTundra,33.49,34.38
.turnin 11967 >>交任务: |cRXP_FRIENDLY_集结红龙|r
.turnin 11936 >>交任务: |cRXP_FRIENDLY_蓝龙的卵|r
.goto BoreanTundra,33.32,34.54
.turnin 11900 >>交任务: |cRXP_FRIENDLY_监测数据|r
.turnin 11910 >>交任务: |cRXP_FRIENDLY_古树的秘密|r
.goto BoreanTundra,32.94,34.40
.skipgossip
.noflyable
.target Keristrasza
.target Archmage Berinand
.target Raelorasz
.target Librarian Serrah
step
>>返回永生之盾
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞拉|r和|cRXP_FRIENDLY_莱洛拉斯|r和|cRXP_FRIENDLY_贝林纳德|r交谈
.turnin 11914 >>交任务: |cRXP_FRIENDLY_保持隐蔽|r
.goto BoreanTundra,33.49,34.38
.turnin 11936 >>交任务: |cRXP_FRIENDLY_蓝龙的卵|r
.goto BoreanTundra,33.32,34.54
.turnin 11900 >>交任务: |cRXP_FRIENDLY_监测数据|r
.turnin 11910 >>交任务: |cRXP_FRIENDLY_古树的秘密|r
.goto BoreanTundra,32.94,34.40
.target Archmage Berinand
.target Raelorasz
.target Librarian Serrah
step
.goto BoreanTundra,21.57,22.55
.use 35671 >>|cRXP_WARN_使用|r|T133836:0|t[强化过的奥术牢笼] |cRXP_WARN_来召唤|r|cRXP_FRIENDLY_克莉斯塔萨|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克莉斯塔萨|r交谈
.turnin 11957 >>交任务: |cRXP_FRIENDLY_莎拉苟萨的末日|r
.accept 11967 >>接任务: |cRXP_LOOT_集结红龙|r
.target Keristrasza
step
#questguide
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱洛拉斯|r交谈
.turnin 11967 >>交任务: |cRXP_FRIENDLY_集结红龙|r
.accept 11969 >>接任务: |cRXP_LOOT_触动陷阱|r
.goto BoreanTundra,33.32,34.54
.target Raelorasz
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱洛拉斯|r交谈
.turnin 11967 >>交任务: |cRXP_FRIENDLY_集结红龙|r
.goto BoreanTundra,33.32,34.54
.skill coldweatherflying,<1,1
.target Raelorasz

step
#questguide
.goto BoreanTundra,25.34,21.82
.cast 62272 >>|cRXP_WARN_使用|r|T132862:0|t[拉洛拉斯的火花]|cRXP_WARN_|r紧邻|r|cRXP_PICK_信号火焰|r|r
.timer 195,Springing the Trap RP
>>|cRXP_WARN_等待RP结束|r
.use 44950
.complete 11969,1 
.isOnQuest 11969
step
#questguide
#completewith next
+|cRXP_WARN_下马|cRXP_FRIENDLY_克莉斯塔萨|r, 然后施放 |T135992:0|t[缓降]|r << Mage
+|cRXP_WARN_下马克莉斯塔萨, 然后在靠近地面时施放 [浮空术]|r << Priest
+|cRXP_WARN_下马克莉斯塔萨, 然后在接近地面时施放 |T135896:0|t[圣盾术] 或 |T135964:0|t[保护之手]|r << Paladin
.itemcount 17056,1 << Mage/Priest
step
#questguide
#completewith next
.goto BoreanTundra,21.91,30.45
.use 35506 >>|cRXP_WARN_寻找一只在考达拉西北边缘飞行的|cRXP_ENEMY_魔枢雏龙|r|r
.cast 46607 >>|cRXP_WARN_使用|r|T135134:0|t[雷洛拉斯之矛] |cRXP_WARN_对 |cRXP_ENEMY_魔枢雏龙|r进行攻击以捕捉|r
>>|cRXP_WARN_请勿杀死|r|cRXP_ENEMY_魔枢雏龙|r
.unitscan Nexus Drake Hatchling
.isOnQuest 11919
step
#questguide
.goto BoreanTundra,33.28,34.47
>>将|cRXP_FRIENDLY_魔枢雏龙|r带回特兰西图斯的|cRXP_FRIENDLY_莱洛拉斯|r处
>>|cRXP_WARN_|r |cRXP_FRIENDLY_魔枢雏龙|r将与你的移动速度保持一致|r
.complete 11919,1 
.target Raelorasz
.isOnQuest 11919
step
#questguide
.goto BoreanTundra,33.32,34.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱洛拉斯|r交谈
.turnin 11919 >>交任务: |cRXP_FRIENDLY_猎龙|r
.turnin 11969 >>交任务: |cRXP_FRIENDLY_触动陷阱|r
.accept 11931 >>接任务: |cRXP_LOOT_破译密码|r
.daily 11940 >>接任务: |cRXP_LOOT_猎龙|r
.target Raelorasz
step
#questguide
#completewith next
.goto BoreanTundra,32.72,27.88,0
>>击杀|r考达拉缚法者|r. 从他们身上搜取|r闪烁的符文|r
.complete 11931,1 
.mob Coldarra Spellbinder
step
#questguide
.goto BoreanTundra,32.72,27.88
>>击杀|cRXP_ENEMY_审讯者卡勒拉斯|r. 击败他后搜刮|cRXP_LOOT_碧蓝书典|r
.complete 11931,2 
.mob Inquisitor Caleras
step
#questguide
.goto BoreanTundra,21.91,30.45
.use 35506 >>|cRXP_WARN_寻找一只在考达拉西北边缘飞行的|cRXP_ENEMY_魔枢雏龙|r|r
.cast 46607 >>|cRXP_WARN_使用|r|T135134:0|t[雷洛拉斯之矛] |cRXP_WARN_对 |cRXP_ENEMY_魔枢雏龙|r进行攻击以捕捉|r
>>|cRXP_WARN_请勿杀死|r|cRXP_ENEMY_魔枢雏龙|r
.unitscan Nexus Drake Hatchling
.isOnQuest 11940
step
#questguide
.goto BoreanTundra,32.69,27.79,70,0
.goto BoreanTundra,33.45,25.68,70,0
.goto BoreanTundra,33.73,29.97,70,0
.goto BoreanTundra,31.54,28.28,70,0
.goto BoreanTundra,34.79,26.95
>>击杀|r考达拉缚法者|r. 从他们身上搜取|r闪烁的符文|r
.complete 11931,1 
.mob Coldarra Spellbinder
step
#questguide
.goto BoreanTundra,33.28,34.47
>>将|cRXP_FRIENDLY_魔枢雏龙|r带回特兰西图斯的|cRXP_FRIENDLY_莱洛拉斯|r处
>>|cRXP_WARN_|r |cRXP_FRIENDLY_魔枢雏龙|r将与你的移动速度保持一致|r
.complete 11940,1 
.target Raelorasz
.isOnQuest 11940
step
#questguide
.goto BoreanTundra,33.32,34.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱洛拉斯|r交谈
.turnin 11931 >>交任务: |cRXP_FRIENDLY_破译密码|r
.turnin -11940 >>交任务: |cRXP_FRIENDLY_猎龙|r
.target Raelorasz

step
#completewith next
.goto BoreanTundra,33.13,34.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Adami|r交谈
.fly Fizzcrank >>飞往菲兹兰克机场
.target Warmage Adami
step
#completewith ED
.goto BoreanTundra,57.12,18.72
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_查莉|r交谈
.home >>将你的炉石设置为菲兹兰克机场
.target "Charlie" Northtop
step
.goto BoreanTundra,56.98,18.71
>>|cRXP_WARN_乘电梯前往|r|cRXP_FRIENDLY_菲兹兰克|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹兰克|r交谈
.turnin 11707 >>交任务: |cRXP_FRIENDLY_迫在眉睫|r
.accept 11708 >>接任务: |cRXP_LOOT_机械侏儒|r
.target Fizzcrank Fullthrottle
step
#completewith next
.goto BoreanTundra,56.98,18.71
.gossipoption 93233 >>与|cRXP_FRIENDLY_菲兹兰克|r交谈
.skipgossip 25590,1,1,2,2,2,2,2,2,2
.isOnQuest 11708
.target Fizzcrank Fullthrottle
step
.goto BoreanTundra,56.98,18.71
>>与|cRXP_FRIENDLY_菲兹兰克|r交谈, 聆听他的故事
.isOnQuest 11708
.complete 11708,1 
.target Fizzcrank Fullthrottle
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jinky|r和|cRXP_FRIENDLY_Mordle|r和|cRXP_FRIENDLY_Crafty|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11708 >>交任务: |cRXP_FRIENDLY_机械侏儒|r
.accept 11712 >>接任务: |cRXP_LOOT_物质转换注射器|r
.goto BoreanTundra,57.44,18.73
.accept 11704 >>接任务: |cRXP_LOOT_国王姆嘎姆嘎|r
.accept 11710 >>接任务: |cRXP_LOOT_转换器怎么了？|r
.goto BoreanTundra,57.52,18.62
.accept 11645 >>接任务: |cRXP_LOOT_恶心的雪地狗头人！|r
.goto BoreanTundra,57.51,18.72,30,0
.goto BoreanTundra,58.2,18.3
.target Jinky Twizzlefixxit
.target Mordle Cogspinner
.target Crafty Wobblesprocket
step
#questguide << !Druid !Shaman !Druid
#completewith Bonker
.goto BoreanTundra,57.3,13.1,0
.goto BoreanTundra,56.2,12.1,0
.goto BoreanTundra,55.0,13.1,0
.goto BoreanTundra,53.1,13.9,0
>>战利品|cRXP_LOOT_机灵鬼的物品|r掉落在地面上
.complete 11645,1 

step
#questguide << !Druid !Shaman !Druid
#completewith CStuff
.goto BoreanTundra,53.8,13.8,30 >>进入犸格莫斯洞穴
step
#questguide << !Druid !Shaman !Druid
.goto BoreanTundra,53.8,13.8,40,0
.goto BoreanTundra,55.57,12.58
>>下降到|cRXP_FRIENDLY_Bonker|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与博克(|cRXP_FRIENDLY_Bonker|r)交谈
.accept 11673 >>接任务: |cRXP_LOOT_带我出去！|r
.target Bonker Togglevolt
step
#questguide << !Druid !Shaman !Druid
.goto BoreanTundra,53.8,13.8
>>|cRXP_WARN_护送|cRXP_FRIENDLY_Bonker|r出现在犸格莫斯洞穴之外|r
.complete 11673,1 
step
#label CStuff
.goto BoreanTundra,54.9,15.7,50,0
.goto BoreanTundra,57.3,13.1,50,0
.goto BoreanTundra,56.2,12.1,50,0
.goto BoreanTundra,55.0,13.1,50,0
.goto BoreanTundra,53.1,13.9
>>战利品|cRXP_LOOT_机灵鬼的物品|r掉落在地面上
.complete 11645,1 
.target Bonker Togglevolt
step
.goto BoreanTundra,57.1,19.0,20,0
.goto BoreanTundra,57.0,18.7
>>|cRXP_WARN_乘电梯前往|r|cRXP_FRIENDLY_菲兹兰克|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹兰克|r交谈
.turnin 11673 >>交任务: |cRXP_FRIENDLY_带我出去！|r
.isQuestComplete 11673
.target Fizzcrank Fullthrottle
step
.goto BoreanTundra,57.51,18.72,30,0
.goto BoreanTundra,58.2,18.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11645 >>交任务: |cRXP_FRIENDLY_恶心的雪地狗头人！|r
.accept 11650 >>接任务: |cRXP_LOOT_还要一些东西……|r
.itemcount 39682,1 
.target Crafty Wobblesprocket
step
.goto BoreanTundra,57.51,18.72,30,0
.goto BoreanTundra,58.2,18.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11645 >>交任务: |cRXP_FRIENDLY_恶心的雪地狗头人！|r
.target Crafty Wobblesprocket
step
#sticky
#label screwdriver1
.goto BoreanTundra,61.6,15.0,0
.goto BoreanTundra,59.4,17.6,0
.goto BoreanTundra,58.2,23.4,0
.goto BoreanTundra,63.5,22.4,0
.goto BoreanTundra,64.5,18.2,0
.use 34984 >>击杀|cRXP_ENEMY_防御坦克66D型|r和|cRXP_ENEMY_清除机器人004-A8型|r和|cRXP_ENEMY_警戒机器人57-K型|r. 从他们身上搜刮出 |T134429:0|t[|cRXP_LOOT_超声波螺丝刀|r]
>>|cRXP_WARN_使用 |T134429:0|t[|cRXP_LOOT_超声波螺丝刀|r] 开始任务|r
.collect 34984,1,11729,1
.accept 11729 >>接任务: |cRXP_LOOT_超声波螺丝刀|r
.mob Sentry-bot 57-K
.mob Scavenge-bot 004-A8
.mob Defendo-tank 66D


step
.goto BoreanTundra,61.7,20.9,70,0
.goto BoreanTundra,65.2,17.9,70,0
.goto BoreanTundra,64.2,23.2
.use 34973 >>击杀|cRXP_ENEMY_菲兹兰克机械侏儒|r. |cRXP_WARN_在他们的尸体上使用|r |T136093:0 |t[物质转换注射器]|cRXP_WARN_|r
>>拾取地面上的|cRXP_LOOT_菲兹兰克备用零件|r
.complete 11712,1 
.complete 11710,1 
.mob Fizzcrank Mechagnome
step
#requires screwdriver1
#questguide
.goto BoreanTundra,61.6,15.0,70,0
.goto BoreanTundra,59.4,17.6,70,0
.goto BoreanTundra,58.2,23.4,70,0
.goto BoreanTundra,63.5,22.4,70,0
.goto BoreanTundra,64.5,18.2
.use 34984 >>击杀|cRXP_ENEMY_防御坦克66D型|r和|cRXP_ENEMY_清除机器人004-A8型|r和|cRXP_ENEMY_警戒机器人57-K型|r. 从他们身上搜刮出 |T134429:0|t[|cRXP_LOOT_超声波螺丝刀|r]
>>|cRXP_WARN_使用 |T134429:0|t[|cRXP_LOOT_超声波螺丝刀|r] 开始任务|r
.collect 34984,1,11729,1
.accept 11729 >>接任务: |cRXP_LOOT_超声波螺丝刀|r
.mob Sentry-bot 57-K
.mob Scavenge-bot 004-A8
.mob Defendo-tank 66D


step
#questguide
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r和|cRXP_FRIENDLY_Mordle|r和|cRXP_FRIENDLY_Jinky|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11729 >>交任务: |cRXP_FRIENDLY_超声波螺丝刀|r
.accept 11730 >>接任务: |cRXP_LOOT_主与仆|r
.goto BoreanTundra,57.51,18.72,30,0
.goto BoreanTundra,58.2,18.3
.turnin 11710 >>交任务: |cRXP_FRIENDLY_转换器怎么了？|r
.accept 11692 >>接任务: |cRXP_LOOT_寻找比希|r
.goto BoreanTundra,57.52,18.62
.turnin 11712 >>交任务: |cRXP_FRIENDLY_物质转换注射器|r
.accept 11788 >>接任务: |cRXP_LOOT_左膀右臂|r
.goto BoreanTundra,57.44,18.73
.target Jinky Twizzlefixxit
.target Mordle Cogspinner
.target Crafty Wobblesprocket
step
#requires screwdriver1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r和|cRXP_FRIENDLY_Mordle|r和|cRXP_FRIENDLY_Jinky|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11729 >>交任务: |cRXP_FRIENDLY_超声波螺丝刀|r

.goto BoreanTundra,57.51,18.72,30,0
.goto BoreanTundra,58.2,18.3
.turnin 11710 >>交任务: |cRXP_FRIENDLY_转换器怎么了？|r
.accept 11692 >>接任务: |cRXP_LOOT_寻找比希|r
.goto BoreanTundra,57.52,18.62
.turnin 11712 >>交任务: |cRXP_FRIENDLY_物质转换注射器|r
.accept 11788 >>接任务: |cRXP_LOOT_左膀右臂|r
.goto BoreanTundra,57.44,18.73
.target Jinky Twizzlefixxit
.target Mordle Cogspinner
.target Crafty Wobblesprocket
step
#questguide
#completewith ED
.use 35116 >>击杀|cRXP_ENEMY_防御坦克66D型|r和|cRXP_ENEMY_清除机器人004-A8型|r和|cRXP_ENEMY_警戒机器人57-K型|r. |cRXP_WARN_使用_|T134429:0|t[|cRXP_LOOT_超声波螺丝刀|r ]|cRXP_WARN_从它们的尸体上获取_|r
.complete 11730,1 
.mob Sentry-bot 57-K
.mob Scavenge-bot 004-A8
.mob Defendo-tank 66D


step
.goto BoreanTundra,60.24,20.39
>>点击|cRXP_PICK_西部哨站阀门|r以召唤|cRXP_ENEMY_托奇|r
>>击杀|cRXP_ENEMY_托奇|r
.complete 11788,1 
.mob Twonky
step
.goto BoreanTundra,63.68,22.50
>>点击|cRXP_PICK_中部哨站阀门|r召唤|cRXP_ENEMY_麦克斯·布拉斯托|r
>>击杀|cRXP_ENEMY_麦克斯·布拉斯托|r
.complete 11788,3 
.mob Max Blasto
step
.goto BoreanTundra,64.40,23.14
>>战利品|cRXP_LOOT_机灵鬼的工具|r在地面上
.complete 11650,1 
.itemcount 39682,1 
.isOnQuest 11650
step
#label ED
.goto BoreanTundra,65.41,17.51
>>点击 |cRXP_PICK_北部哨站阀门|r 以召唤 |cRXP_ENEMY_ED-210|r
>>击杀|cRXP_ENEMY_ED-210|r
.complete 11788,2 
.mob ED-210
step
#questguide
.goto BoreanTundra,61.0,17.0,70,0
.goto BoreanTundra,58.5,20.8,70,0
.goto BoreanTundra,63.1,21.7
.use 35116 >>击杀|cRXP_ENEMY_防御坦克66D型|r和|cRXP_ENEMY_清除机器人004-A8型|r和|cRXP_ENEMY_警戒机器人57-K型|r
>>|cRXP_WARN_使用|r|T134429:0|t[|cRXP_LOOT_超声波螺丝刀|r]|cRXP_WARN_在他们的尸体上|r
.complete 11730,1 
.mob Sentry-bot 57-K
.mob Scavenge-bot 004-A8
.mob Defendo-tank 66D


step
#completewith next
.goto BoreanTundra,73.42,18.78,100 >>前往塔尔拉玛斯附近与|cRXP_FRIENDLY_Bixie|r会合
step
.goto BoreanTundra,73.42,18.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bixie|r交谈
.turnin 11692 >>交任务: |cRXP_FRIENDLY_寻找比希|r
.accept 11693 >>接任务: |cRXP_LOOT_好极了……天灾猛犸人！|r
.target Bixie Wrenchshanker
step
.goto BoreanTundra,82.0,29.3,70,0
.goto BoreanTundra,71.8,15.6,70,0
.goto BoreanTundra,82.0,29.3,70,0
.goto BoreanTundra,71.8,15.6
>>击杀|cRXP_ENEMY_天灾猛犸人|r
.complete 11693,1 
.mob Plagued Magnataur
step
.goto BoreanTundra,73.42,18.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bixie|r交谈
.turnin 11693 >>交任务: |cRXP_FRIENDLY_好极了……天灾猛犸人！|r
.accept 11694 >>接任务: |cRXP_LOOT_山洞中的瘟疫|r
.target Bixie Wrenchshanker
step
#completewith next
.goto BoreanTundra,74.77,14.10,70 >>进入死亡之巢
step
.goto BoreanTundra,74.77,14.10
.use 34915 >>|cRXP_WARN_使用|r|T133590:0|t[比克西的抑制粉] |cRXP_WARN_在|r|cRXP_PICK_亡者之穴天灾之锅上|r
.complete 11694,1 
step
.goto BoreanTundra,73.42,18.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bixie|r交谈
.turnin 11694 >>交任务: |cRXP_FRIENDLY_山洞中的瘟疫|r
.accept 11697 >>接任务: |cRXP_LOOT_丁奇跑进浮空城了！|r
.accept 11698 >>接任务: |cRXP_LOOT_顺便清理天灾士兵|r
.target Bixie Wrenchshanker
step
#completewith Tinky
.goto BoreanTundra,69.3,14.1,0
>>击杀|cRXP_ENEMY_塔尔拉玛斯 亡灵|r
.complete 11698,1 
.mob Cult Plaguebringer
.mob Doctor Razorgrin
.mob Lich-Lord Chillwinter
.mob Talramas Abomination
.mob Bone Warrior
.mob Festering Ghoul
step
#completewith next
.goto BoreanTundra,68.7,15.3,60 >>前往塔尔拉玛斯, 寻找里面的|cRXP_FRIENDLY_Tinky|r
step
.goto BoreanTundra,68.7,15.3,70,0
.goto BoreanTundra,69.89,14.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tinky|r交谈
.turnin 11697 >>交任务: |cRXP_FRIENDLY_丁奇跑进浮空城了！|r
.accept 11699 >>接任务: |cRXP_LOOT_我被困在笼子里了……|r
.target Tinky Wickwhistle
step
#completewith Gyroscope
.goto BoreanTundra,68.97,14.76,0
>>击杀|cRXP_ENEMY_生疮的食尸鬼|r. 击杀后搜刮其掉落的|cRXP_LOOT_水晶|r
.complete 11699,1 
.mob Festering Ghoul
step
.groundgoto BoreanTundra,68.7,15.3,40,0
.groundgoto BoreanTundra,68.1,11.6,60,0
.groundgoto BoreanTundra,69.4,11.4,40,0
.groundgoto BoreanTundra,69.08,13.26,30,0
.goto BoreanTundra,69.64,13.88
>>|cRXP_WARN_从外部前往塔尔拉玛斯山顶|r
>>击杀|cRXP_ENEMY_巫妖领主基尔温特|r. 击败他后可获得|cRXP_LOOT_天灾石|r
.complete 11699,3 
.mob Lich-Lord Chillwinter
step
#label Gyroscope
.goto BoreanTundra,69.88,13.33
>>|cRXP_WARN_跳入中央坑洞|r
>>击杀|cRXP_ENEMY_拉佐格林博士|r. 击败后搜刮出|cRXP_LOOT_飞行陀螺仪|r
.complete 11699,2 
.mob Doctor Razorgrin
step
.goto BoreanTundra,71.2,15.0,70,0
.goto BoreanTundra,68.2,16.9,70,0
.goto BoreanTundra,67.2,12.5,70,0
.goto BoreanTundra,69.7,13.8
>>击杀|cRXP_ENEMY_生疮的食尸鬼|r. 击杀后搜刮其掉落的|cRXP_LOOT_水晶|r
.complete 11699,1 
.mob Festering Ghoul
step
#label Tinky
.goto BoreanTundra,69.89,14.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tinky|r交谈
.turnin 11699 >>交任务: |cRXP_FRIENDLY_我被困在笼子里了……|r
.accept 11700 >>接任务: |cRXP_LOOT_通知比希|r
.target Tinky Wickwhistle
step
.goto BoreanTundra,71.2,15.0,70,0
.goto BoreanTundra,68.2,16.9,70,0
.goto BoreanTundra,67.2,12.5,70,0
.goto BoreanTundra,69.7,13.8
>>击杀|cRXP_ENEMY_塔尔拉玛斯 亡灵|r
.complete 11698,1 
.mob Cult Plaguebringer
.mob Doctor Razorgrin
.mob Lich-Lord Chillwinter
.mob Talramas Abomination
.mob Bone Warrior
.mob Festering Ghoul
step
.goto BoreanTundra,73.42,18.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bixie|r交谈
.turnin 11698 >>交任务: |cRXP_FRIENDLY_顺便清理天灾士兵|r
.turnin 11700 >>交任务: |cRXP_FRIENDLY_通知比希|r
.accept 11701 >>接任务: |cRXP_LOOT_返回机场|r
.target Bixie Wrenchshanker
step << Druid wotlk
#completewith DruidTrain
.cast 18960 >>传送术:月光林地
.zoneskip Moonglade
.xp <71,1
step << Druid wotlk
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48442 >>训练你的职业法术
.xp <71,1
.target Loganaar
step << Druid wotlk
#label DruidTrain
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48464 >>训练你的职业法术
.xp <72,1
.target Loganaar
step << DK wotlk
#completewith next
.cast 50977 >>施放死亡之门
.zoneskip Eastern Plaguelands
.xp <72,1
step << DK wotlk
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49940 >>训练你的职业法术
.xp <72,1
.target Amal'thazad
step << Mage wotlk
#completewith MageTrain
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
.xp <71,1
step << Mage wotlk
.goto StormwindNew,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 43023 >>训练你的职业法术
.xp <71,1
.target Elsharin
.target Jennea Cannon
step << Mage wotlk
#label MageTrain
.goto StormwindNew,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42930 >>训练你的职业法术
.xp <72,1
.target Elsharin
.target Jennea Cannon
step
#completewith next
.hs >>传送至菲兹兰克机场
step
.goto BoreanTundra,56.95,18.75
>>|cRXP_WARN_乘电梯前往|r|cRXP_FRIENDLY_菲兹兰克|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹兰克|r交谈
.turnin 11701 >>交任务: |cRXP_FRIENDLY_返回机场|r
.accept 11725 >>接任务: |cRXP_LOOT_寻找“尾旋”|r
.target Fizzcrank Fullthrottle
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11729 >>交任务: |cRXP_FRIENDLY_超声波螺丝刀|r
.goto BoreanTundra,57.51,18.72,30,0
.goto BoreanTundra,58.2,18.3
.isOnQuest 11729
.target Crafty Wobblesprocket
step
#questguide
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11730 >>交任务: |cRXP_FRIENDLY_主与仆|r
.goto BoreanTundra,57.51,18.72,30,0
.goto BoreanTundra,58.2,18.3
.target Crafty Wobblesprocket
step
.goto BoreanTundra,65.25,28.78
>>点击|cRXP_PICK_南部哨站阀门|r召唤|cRXP_ENEMY_研磨者|r
>>击杀|cRXP_ENEMY_研磨者|r
.complete 11788,4 
.mob The Grinder
step
#completewith next
.goto BoreanTundra,61.68,35.79,130 >>前往滚烫熔池
step
#label Iggy
.goto BoreanTundra,61.68,35.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊基|r交谈
.turnin 11725 >>交任务: |cRXP_FRIENDLY_寻找“尾旋”|r
.accept 11726 >>接任务: |cRXP_LOOT_一点辣椒|r
.target Iggy "Tailspin" Cogtoggle
step
.goto BoreanTundra,64.9,41.2,70,0
.goto BoreanTundra,67.1,40.6,70,0
.goto BoreanTundra,68.7,42.2
>>击杀|cRXP_ENEMY_鼓眼鳄鱼人|r和|cRXP_ENEMY_蒸汽鳄鱼人|r和|cRXP_ENEMY_游荡鳄鱼人|r. 掠夺他们以获取|cRXP_LOOT_袋子|r
.complete 11726,1 
.mob Gorloc Gibberer
.mob Gorloc Steam Belcher
.mob Gorloc Waddler
step
#completewith next
.goto BoreanTundra,81.5,42.5,100 >>前往冰冻平原
.isOnQuest 11650
step
.goto BoreanTundra,81.5,42.5
>>击杀|cRXP_ENEMY_洛克纳尔|r. 击败后搜刮他的|cRXP_LOOT_沙砾|r
.complete 11650,3 
.itemcount 39682,1 
.isOnQuest 11650
.mob Rocknar
step
.goto BoreanTundra,61.68,35.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊基|r交谈
.turnin 11726 >>交任务: |cRXP_FRIENDLY_一点辣椒|r
.accept 11728 >>接任务: |cRXP_LOOT_狼的排泄物|r
.target Iggy "Tailspin" Cogtoggle
step
.goto BoreanTundra,60.95,32.94
.use 35121 >>|cRXP_WARN_使用|r|T134045:0|t[狼饵], |cRXP_WARN_目标: |r|cRXP_ENEMY_ 油污狼|r. |cRXP_WARN_等待它们的技能冷却时间|r
>>打开|cRXP_PICK_狼的粪便|r, 从中拾取|cRXP_LOOT_微缩胶片|r
.complete 11728,1 
.mob Oil-stained Wolf
step
.goto BoreanTundra,61.68,35.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊基|r交谈
.turnin 11728 >>交任务: |cRXP_FRIENDLY_狼的排泄物|r
.accept 11795 >>接任务: |cRXP_LOOT_紧急情况守则：第8章，第2节，第3段|r
.target Iggy "Tailspin" Cogtoggle
step
.goto BoreanTundra,62.94,35.81,40,0
.goto BoreanTundra,61.53,38.76,40,0
.goto BoreanTundra,60.56,38.44,40,0
.goto BoreanTundra,60.67,35.80,40,0
.goto BoreanTundra,61.35,33.82,40,0
.goto BoreanTundra,62.79,32.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与死者交谈 |cRXP_FRIENDLY_菲兹兰克侦察机飞行员|r. 搜刮他们的 |cRXP_LOOT_飞行员徽章|r
.complete 11795,1 
.skipgossip
.target Fizzcrank Recon Pilot
step
.goto BoreanTundra,61.68,35.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊基|r交谈
.turnin 11795 >>交任务: |cRXP_FRIENDLY_紧急情况守则：第8章，第2节，第3段|r
.accept 11796 >>接任务: |cRXP_LOOT_紧急情况守则：第8章，第2节，第4段|r
.target Iggy "Tailspin" Cogtoggle
step
.use 35224 >>|cRXP_WARN_使用|r|T135488:0|t[紧急火炬]|cRXP_WARN_在|r|cRXP_PICK_飞行器残骸上|r
.complete 11796,3 
.goto BoreanTundra,60.85,33.63
.complete 11796,2 
.goto BoreanTundra,61.07,40.01
.complete 11796,1 
.goto BoreanTundra,63.40,36.95
step
#label Iggy2
.goto BoreanTundra,61.68,35.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊基|r交谈
.turnin 11796 >>交任务: |cRXP_FRIENDLY_紧急情况守则：第8章，第2节，第4段|r
.accept 11873 >>接任务: |cRXP_LOOT_通知菲兹兰克|r
.target Iggy "Tailspin" Cogtoggle
step << Shaman
#completewith next
.hs >>传送至菲兹兰克机场
step << Shaman
.goto BoreanTundra,57.01,18.68
>>|cRXP_WARN_乘电梯前往|r|cRXP_FRIENDLY_菲兹兰克|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹兰克|r交谈
.turnin 11873 >>交任务: |cRXP_FRIENDLY_通知菲兹兰克|r
.target Fizzcrank Fullthrottle
step << !Shaman
#completewith next
.goto BoreanTundra,57.46,18.79,100 >>前往菲兹兰克机场
step
.goto BoreanTundra,57.46,18.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jinky|r交谈
.turnin 11788 >>交任务: |cRXP_FRIENDLY_左膀右臂|r
.accept 11798 >>接任务: |cRXP_LOOT_机甲专家麦卡佐德|r
.target Jinky Wingnut
step
#completewith next
.goto BoreanTundra,57.1,19.0,20,0
.goto BoreanTundra,57.0,18.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.accept 11653 >>接任务: |cRXP_LOOT_大块头|r
.target Crafty Wobblesprocket
step
.goto BoreanTundra,57.1,19.0,20,0
.goto BoreanTundra,57.0,18.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11650 >>交任务: |cRXP_FRIENDLY_还要一些东西……|r
.isQuestComplete 11650
.target Crafty Wobblesprocket
step
#completewith next
.goto BoreanTundra,54.2,13.1,60 >>进入犸格莫斯洞穴
.isOnQuest 11653
step
.goto BoreanTundra,54.2,13.1,70,0
.goto BoreanTundra,55.1,12.0
.use 34812 >>|cRXP_WARN_使用|r|T133037:0|t[Crafty's Shortening Blaster]|cRXP_WARN_对 |cRXP_ENEMY_玛格莫斯碾压者|r和|r|cRXP_ENEMY_玛格莫斯雷加的伴侣|r|r
.complete 11653,1 
.isQuestTurnedIn 11650
.mob Magmoth Crusher
.mob Mate of Magmothregar
step
.goto BoreanTundra,57.1,19.0,20,0
.goto BoreanTundra,57.0,18.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11653 >>交任务: |cRXP_FRIENDLY_大块头|r
.accept 11658 >>接任务: |cRXP_LOOT_B计划|r
.isQuestTurnedIn 11650
.target Crafty Wobblesprocket
step << !Shaman
.goto BoreanTundra,57.01,18.68
>>|cRXP_WARN_乘电梯前往|r|cRXP_FRIENDLY_菲兹兰克|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹兰克|r交谈
.turnin 11873 >>交任务: |cRXP_FRIENDLY_通知菲兹兰克|r
.target Fizzcrank Fullthrottle
step
#completewith next
.goto BoreanTundra,49.3,21.4,0
.goto BoreanTundra,50.4,24.7,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_车队卫兵的尸体|r和|r车队工人的尸体|r交谈. 从他们身上搜刮出|r装束|r`
.complete 11658,1 
.skipgossip
.isQuestTurnedIn 11650
.mob Dead Caravan Guard
.mob Dead Caravan Worker
step
.goto BoreanTundra,49.59,26.68
>>拾取地面上的|cRXP_LOOT_战歌旗帜|r
.complete 11658,2 
.isQuestTurnedIn 11650
step
.goto BoreanTundra,49.3,21.4,70,0
.goto BoreanTundra,50.4,24.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_车队卫兵的尸体|r和|r车队工人的尸体|r交谈. 从他们身上搜刮出|r装束|r`
.complete 11658,1 
.skipgossip
.isQuestTurnedIn 11650
.mob Dead Caravan Guard
.mob Dead Caravan Worker
step
#completewith next
.goto BoreanTundra,57.06,20.12,100 >>前往菲兹兰克机场
.isQuestTurnedIn 11650
step
.goto BoreanTundra,57.06,20.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿布尼|r交谈
.accept 11713 >>接任务: |cRXP_LOOT_侦查虫孔|r
.target Abner Fizzletorque
step
.goto BoreanTundra,57.1,19.0,20,0
.goto BoreanTundra,57.0,18.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11658 >>交任务: |cRXP_FRIENDLY_B计划|r
.accept 11670 >>接任务: |cRXP_LOOT_是兽人干的！真的！|r
.isQuestTurnedIn 11650
.target Crafty Wobblesprocket
step 
#completewith next
.goto BoreanTundra,54.2,13.3
.use 34871 >>|cRXP_WARN_开启|r |T133647:0|t[巧匠的包裹] |cRXP_WARN_用于获得|r |T132485:0|t[|cRXP_LOOT_战歌旗帜|r] |cRXP_WARN_和|r |T134475:0|t[|cRXP_LOOT_战歌兽人伪装包|r]
.isQuestTurnedIn 11650
.collect 34869,1,11670,1 
.collect 34870,1,11670,1 
step
.goto BoreanTundra,54.2,13.3,40,0
.goto BoreanTundra,55.6,12.1
.use 34870 >>|cRXP_WARN_使用|r|T134475:0|t[|cRXP_LOOT_战歌兽人伪装包|r]|cRXP_WARN_在犸格莫斯洞穴|r
.complete 11670,2 
.isQuestTurnedIn 11650
step
.goto BoreanTundra,55.6,12.1
.use 34869 >>击杀|cRXP_ENEMY_玛格莫斯雷加|r, 地点在玛格莫斯. |cRXP_WARN_在其尸体上使用|r |T132485:0|t[|cRXP_LOOT_战歌旗帜|r]
.complete 11670,1 
.isQuestTurnedIn 11650
.mob Magmothregar
step
#questguide
.goto BoreanTundra,55.6,12.6
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与博克(|cRXP_FRIENDLY_Bonker|r)交谈
.accept 11673 >>接任务: |cRXP_LOOT_带我出去！|r
.isQuestTurnedIn 11650
.target Bonker Togglevolt
step
#questguide
.goto BoreanTundra,53.8,13.8
>>护送|cRXP_FRIENDLY_Bonker|r到洞穴外
.complete 11673,1 
.isQuestTurnedIn 11650
.target Bonker Togglevolt
step
#completewith next
.goto BoreanTundra,64.43,23.40,100 >>前往菲兹兰克泵站
.isOnQuest 11798
step
#completewith next
.groundgoto BoreanTundra,65.62,22.95,20,0
.groundgoto BoreanTundra,64.87,24.14,15,0
.groundgoto BoreanTundra,64.71,22.93,15,0
.goto BoreanTundra,64.53,23.42
>>|cRXP_WARN_进入顶层的小屋|r
.cast 3365 >>点击桌上的|cRXP_PICK_机甲专家的手册|r以召唤|cRXP_ENEMY_机械萨多|r
.timer 51,The Gearmaster RP
.isOnQuest 11798
step
.goto BoreanTundra,64.54,23.26
|cRXP_WARN_等待他的怒气值|r
>>击杀|cRXP_ENEMY_Mechazod|r. 击败他后拾取他的|cRXP_LOOT_Head|r
.complete 11798,1 
.complete 11798,2 
.mob Gearmaster Mechazod
step
#completewith next
.goto BoreanTundra,66.25,32.13,100 >>前往喷泉之地
step
#label Sinkhole
.use 34920 >>|cRXP_WARN_使用|r|T134269:0|t[喷泉平原地图]|cRXP_WARN_当站在|r|cRXP_PICK_陷坑边缘时|r
.complete 11713,3 
.goto BoreanTundra,66.25,32.13
.complete 11713,2 
.goto BoreanTundra,69.51,32.80
.complete 11713,1 
.goto BoreanTundra,70.24,36.36
step << Druid wotlk
#completewith DruidTrain2
.cast 18960 >>传送术:月光林地
.zoneskip Moonglade
.xp <71,1
.cooldown item,6948,>2
step << Druid wotlk
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48442 >>训练你的职业法术
.xp <71,1
.cooldown item,6948,>2
.target Loganaar
step << Druid wotlk
#label DruidTrain2
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48464 >>训练你的职业法术
.xp <72,1
.cooldown item,6948,>2
.target Loganaar
step << DK wotlk
#completewith DKTraining3
.cast 50977 >>施放死亡之门
.zoneskip Eastern Plaguelands
.xp <72,1
.cooldown item,6948,>2
step << DK wotlk
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49940 >>训练你的职业法术
.xp <72,1
.cooldown item,6948,>2
.target Amal'thazad
step << DK wotlk
#label DKTraining3
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49904 >>训练你的职业法术
.xp <73,1
.cooldown item,6948,>2
.target Amal'thazad
step << Mage wotlk
#completewith MageTrain2
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
.xp <71,1
.cooldown item,6948,>2
step << Mage wotlk
.goto StormwindNew,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 43023 >>训练你的职业法术
.xp <71,1
.cooldown item,6948,>2
.target Elsharin
.target Jennea Cannon
step << Mage wotlk
#label MageTrain2
.goto StormwindNew,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42930 >>训练你的职业法术
.xp <72,1
.cooldown item,6948,>2
.target Elsharin
.target Jennea Cannon
step
#completewith GearM
.hs >>传送至菲兹兰克机场
.cooldown item,6948,>2
step
.goto BoreanTundra,57.04,18.60
>>|cRXP_WARN_乘电梯前往|r|cRXP_FRIENDLY_菲兹兰克|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹兰克|r交谈
.turnin 11798 >>交任务: |cRXP_FRIENDLY_机甲专家麦卡佐德|r
.isQuestTurnedIn 11673
.target Fizzcrank Fullthrottle
step
#label GearM
.goto BoreanTundra,57.04,18.60
>>|cRXP_WARN_乘电梯前往|r|cRXP_FRIENDLY_菲兹兰克|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹兰克|r交谈
.turnin 11798 >>交任务: |cRXP_FRIENDLY_机甲专家麦卡佐德|r
.turnin 11673 >>交任务: |cRXP_FRIENDLY_带我出去！|r
.target Fizzcrank Fullthrottle
step
#questguide << !wotlk
.goto BoreanTundra,57.08,20.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿布尼|r交谈
.turnin 11713 >>交任务: |cRXP_FRIENDLY_侦查虫孔|r
.accept 11715 >>接任务: |cRXP_LOOT_石油资源|r
.target Abner Fizzletorque
step << !wotlk
.goto BoreanTundra,57.08,20.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿布尼|r交谈
.turnin 11713 >>交任务: |cRXP_FRIENDLY_侦查虫孔|r
.target Abner Fizzletorque
step
.goto BoreanTundra,57.1,19.0,20,0
.goto BoreanTundra,57.0,18.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Crafty|r交谈
>>|cRXP_FRIENDLY_狡猾|r|cRXP_WARN_巡逻外围|r
.turnin 11670 >>交任务: |cRXP_FRIENDLY_是兽人干的！真的！|r
.isQuestComplete 11670
.target Crafty Wobblesprocket
step
#questguide << !wotlk
.goto BoreanTundra,56.8,26.2,70,0
.goto BoreanTundra,62.4,29.4,70,0
.goto BoreanTundra,61.8,36.0
.use 34975 >>|cRXP_WARN_使用|r|T132997:0|t[移动采油器], |cRXP_WARN_目标: |r|cRXP_PICK_油矿|r在地面上|r
.complete 11715,1 
step
#completewith next
.goto BoreanTundra,43.50,13.97,120 >>前往冬鳞避难所
step
.goto BoreanTundra,43.50,13.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_国王姆嘎姆嘎|r交谈
.accept 11571 >>接任务: |cRXP_LOOT_学习沟通|r
.turnin 11704 >>交任务: |cRXP_FRIENDLY_国王姆嘎姆嘎|r
.target King Mrgl-Mrgl
step
.goto BoreanTundra,43.0,18.1,60,0
.goto BoreanTundra,42.5,15.4
.use 34598 >>在水下击杀斯卡德尔. 使用 [国王的空海螺](图标:|T134431:0|t)在其尸体上
>>|cRXP_ENEMY_斯卡德尔|r |cRXP_WARN_在海底巡逻|r
.complete 11571,1 
.unitscan Scalder
step
.goto BoreanTundra,43.50,13.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_国王姆嘎姆嘎|r交谈
.turnin 11571 >>交任务: |cRXP_FRIENDLY_学习沟通|r
.accept 11559 >>接任务: |cRXP_LOOT_冬鳞鱼人的贸易|r
.target King Mrgl-Mrgl
step
.goto BoreanTundra,40.5,15.8,70,0
.goto BoreanTundra,41.6,18.9
>>击杀|r冬鳞智者|r和|r冬鳞巡滩者|r和|r冬鳞战士|r, 掠夺他们的|r冬鳞蚌壳|r
>>|cRXP_WARN_或者|r搜刮地面上的|cRXP_LOOT_冬鳞蚌壳|r
>>|cRXP_WARN_它们通常出现在鱼人小屋附近, 但可能很难被发现|r
.complete 11559,1 
.mob Winterfin Oracle
.mob Winterfin Shorestriker
.mob Winterfin Warrior
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_呀噜咕噜|r,|cRXP_FRIENDLY_国王姆嘎姆嘎|r和|cRXP_FRIENDLY_吧咕姆咕|r交谈
.turnin 11559 >>交任务: |cRXP_FRIENDLY_冬鳞鱼人的贸易|r
.goto BoreanTundra,43.04,13.82
.accept 11560 >>接任务: |cRXP_LOOT_救救蝌蚪！|r
.goto BoreanTundra,43.50,13.97
.accept 11561 >>接任务: |cRXP_LOOT_就是他们！|r
.goto BoreanTundra,42.82,13.65
.target Brglmurgl
.target Ahlurglgr
.target King Mrgl-Mrgl
step
#completewith next
.goto BoreanTundra,41.0,15.6,0
.goto BoreanTundra,41.3,19.0,0
.goto BoreanTundra,39.2,18.3,0
.goto BoreanTundra,37.6,15.9,0
>>击杀|cRXP_ENEMY_冬鳞智者|r和|cRXP_ENEMY_冬鳞巡滩者|r和|cRXP_ENEMY_冬鳞战士|r
>>|cRXP_WARN_不要优先处理此项|r
.complete 11561,1 
.mob Winterfin Oracle
.mob Winterfin Shorestriker
.mob Winterfin Warrior
step
#sticky
#label tadpoles
.goto BoreanTundra,41.0,15.6,40,0
.goto BoreanTundra,41.3,19.0,40,0
.goto BoreanTundra,39.2,18.3,40,0
.goto BoreanTundra,37.6,15.9,40,0
.goto BoreanTundra,41.0,15.6,40,0
.goto BoreanTundra,41.3,19.0,40,0
.goto BoreanTundra,40.04,19.80,40,0
.goto BoreanTundra,39.2,18.3,40,0
.goto BoreanTundra,37.6,15.9
>>点击|cRXP_PICK_Cages|r拯救|cRXP_FRIENDLY_冬鳞蝌蚪|r
>>|cRXP_WARN_你可能需要进入冬鳞洞穴才能获得更多信息|r
.complete 11560,1 
.target Winterfin Tadpole
step
.goto BoreanTundra,40.04,19.80
.use 34669 >>|cRXP_WARN_在冬鳞洞穴入口处使用|r|T133015:0|t[奥术测量器] |r
.complete 12728,1 
step
#completewith end
#requires tadpoles
#label Murloc2
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吧咕姆咕|r交谈
.turnin 11561 >>交任务: |cRXP_FRIENDLY_就是他们！|r
.goto BoreanTundra,42.82,13.65,0,0
.isQuestComplete 11561
.target Brglmurgl
step
#requires tadpoles
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_国王姆嘎姆嘎|r交谈
.turnin 11560 >>交任务: |cRXP_FRIENDLY_救救蝌蚪！|r
.accept 11562 >>接任务: |cRXP_LOOT_我被敲竹杠了！|r
.goto BoreanTundra,43.50,13.97
.target King Mrgl-Mrgl
step
#requires Murloc2
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_姆姆咕咕|r和|cRXP_FRIENDLY_巴姆咕噜姆|r交谈
.turnin 11562 >>交任务: |cRXP_FRIENDLY_我被敲竹杠了！|r
.accept 11563 >>接任务: |cRXP_LOOT_咕噜咕噜呜啦哇啦！|r
.goto BoreanTundra,41.98,12.77
.accept 11564 >>接任务: |cRXP_LOOT_美味炖鲸肉|r
.goto BoreanTundra,42.03,13.16
.target Mrmrglmr
.target Brglmurgl
step
#completewith next
.goto BoreanTundra,38.0,9.5,0
.goto BoreanTundra,36.4,8.8,0
.goto BoreanTundra,37.4,6.3,0
.goto BoreanTundra,39.3,8.3,0
>>击杀|cRXP_ENEMY_幽光海湾逆戟鲸|r. 从它们身上搜刮|cRXP_LOOT_blubbers|r
.complete 11564,1 
.mob Glimmer Bay Orca
step
.goto BoreanTundra,38.0,9.5,70,0
.goto BoreanTundra,36.4,8.8,70,0
.goto BoreanTundra,37.4,6.3,70,0
.goto BoreanTundra,39.3,8.3
>>击杀|cRXP_ENEMY_咕拉咕拉|r. 击败他后搜刮出他的|cRXP_LOOT_头颅|r. |cRXP_WARN_他沿着北部的两座冰山逆时针巡逻|r
.complete 11563,1 
.unitscan Glrggl
step
.goto BoreanTundra,40.1,12.2,70,0
.goto BoreanTundra,39.3,6.7,70,0
.goto BoreanTundra,36.0,8.1
>>击杀|cRXP_ENEMY_幽光海湾逆戟鲸|r. 从它们身上搜刮|cRXP_LOOT_blubbers|r
.complete 11564,1 
.mob Glimmer Bay Orca
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_姆姆咕咕|r和|cRXP_FRIENDLY_屠夫布咕布噜|r 和 |cRXP_FRIENDLY_国王姆嘎姆嘎|r 交谈
.turnin 11563 >>交任务: |cRXP_FRIENDLY_咕噜咕噜呜啦哇啦！|r
.accept 11565 >>接任务: |cRXP_LOOT_备用的鱼人服|r
.goto BoreanTundra,41.98,12.77
.turnin 11564 >>交任务: |cRXP_FRIENDLY_美味炖鲸肉|r
.goto BoreanTundra,42.03,13.16
.turnin 11565 >>交任务: |cRXP_FRIENDLY_备用的鱼人服|r
.accept 11566 >>接任务: |cRXP_LOOT_决不投降！|r
.goto BoreanTundra,43.50,13.97
.target King Mrgl-Mrgl
.target Mrmrglmr
.target Cleaver Bmurglbrm
step
#completewith next
.goto BoreanTundra,37.84,23.23,165 >>进入冬鳞洞穴
step
#completewith Lurgglbr
.goto BoreanTundra,41.0,15.6,0
.goto BoreanTundra,41.3,19.0,0
.goto BoreanTundra,39.2,18.3,0
.goto BoreanTundra,37.6,15.9,0
>>击杀|cRXP_ENEMY_冬鳞智者|r和|cRXP_ENEMY_冬鳞巡滩者|r和|cRXP_ENEMY_冬鳞战士|r
>>|cRXP_WARN_不要优先处理此项|r
.complete 11561,1 
.mob Winterfin Oracle
.mob Winterfin Shorestriker
.mob Winterfin Warrior
step
.goto BoreanTundra,37.84,23.23
>>|cRXP_WARN_进入冬鳞洞穴后, 请靠左侧前进|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_咕啦咕啦|r交谈
>>|cRXP_WARN_请勿与|r|cRXP_FRIENDLY_噜呱吧呱|r|cRXP_WARN_yet交谈|r
.accept 11569 >>接任务: |cRXP_LOOT_钥匙管理者呜啦咕噜|r
.target Glrglrglr
step
.goto BoreanTundra,38.0,22.2,12,0
.goto BoreanTundra,39.0,22.7,30,0
.goto BoreanTundra,39.8,22.5,30,0
.goto BoreanTundra,39.3,23.7
>>|cRXP_WARN_跑下下方的斜坡|r
>>击杀|cRXP_ENEMY_钥匙管理者呜啦咕噜|r. 击败他后搜刮其掉落的|cRXP_LOOT_钥匙|r
.complete 11569,1 
.unitscan Keymaster Urmgrgl
step
#completewith next
.goto BoreanTundra,37.0,21.8,40,0
.goto BoreanTundra,36.9,24.0,40 >>前往冬鳞洞穴尽头
step
.goto BoreanTundra,37.55,27.53
>>击杀 |cRXP_ENEMY_克拉西姆斯|r. 击败他后获取他的 |cRXP_LOOT_爪子|r
.complete 11566,1 
.mob Claximus
step
#completewith next
.goto BoreanTundra,36.80,23.22,40,0
.goto BoreanTundra,37.87,21.52,25,0
.goto BoreanTundra,37.84,23.23,30 >>前往入口附近咕啦咕啦的方向
step
.goto BoreanTundra,37.84,23.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_咕啦咕啦|r交谈
.turnin 11569 >>交任务: |cRXP_FRIENDLY_钥匙管理者呜啦咕噜|r
.target Glrglrglr
step
#questguide
.goto BoreanTundra,37.72,23.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_噜呱吧呱|r交谈
.accept 11570 >>接任务: |cRXP_LOOT_逃离冬鳞洞穴|r
.target Lurgglbr
step
#questguide
#label Lurgglbr
.goto BoreanTundra,39.9,19.8,40,0
.goto BoreanTundra,39.6,18.1,40,0
.goto BoreanTundra,41.36,16.32
>>护送|cRXP_FRIENDLY_噜呱吧呱|r. |cRXP_WARN_尝试击杀他原本会遇到的|cRXP_ENEMY_鱼人|r, 以免他停下来攻击而浪费时间|r
.complete 11570,1 
.target Lurgglbr
step
.goto BoreanTundra,41.0,15.6,70,0
.goto BoreanTundra,41.3,19.0,70,0
.goto BoreanTundra,39.2,18.3,70,0
.goto BoreanTundra,37.6,15.9
>>击杀|cRXP_ENEMY_冬鳞智者|r和|cRXP_ENEMY_冬鳞巡滩者|r和|cRXP_ENEMY_冬鳞战士|r
.complete 11561,1 
.mob Winterfin Oracle
.mob Winterfin Shorestriker
.mob Winterfin Warrior
step
.goto BoreanTundra,42.82,13.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吧咕姆咕|r交谈
.turnin 11561 >>交任务: |cRXP_FRIENDLY_就是他们！|r
.target Brglmurgl
step
#label Murliver
.goto BoreanTundra,43.04,13.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_呀噜咕噜|r交谈
.vendor >>尽可能多地购买 |T134800:0|t[鲨肝油]
.itemcount 34597,2
.isQuestTurnedIn 11559
.target Ahlurglgr
step
#questguide
.goto BoreanTundra,43.50,13.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_国王姆嘎姆嘎|r交谈
.turnin 11566 >>交任务: |cRXP_FRIENDLY_决不投降！|r
.turnin 11570 >>交任务: |cRXP_FRIENDLY_逃离冬鳞洞穴|r
.target King Mrgl-Mrgl
step
.goto BoreanTundra,43.50,13.97
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_国王姆嘎姆嘎|r交谈
.turnin 11566 >>交任务: |cRXP_FRIENDLY_决不投降！|r
.target King Mrgl-Mrgl
step << Druid wotlk
#requires Murliver
#completewith DruidTrain3
.cast 18960 >>传送术:月光林地
.zoneskip Moonglade
.xp <71,1
.cooldown item,6948,>2
step << Druid wotlk
#requires Murliver
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48442 >>训练你的职业法术
.xp <71,1
.cooldown item,6948,>2
.target Loganaar
step << Druid wotlk
#requires Murliver
#label DruidTrain3
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48464 >>训练你的职业法术
.xp <72,1
.cooldown item,6948,>2
.target Loganaar
step << DK wotlk
#requires Murliver
#completewith next
.cast 50977 >>施放死亡之门
.zoneskip Eastern Plaguelands
.xp <72,1
.cooldown item,6948,>2
step << DK wotlk
#requires Murliver
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49940 >>训练你的职业法术
.xp <72,1
.cooldown item,6948,>2
.target Amal'thazad
step << Mage wotlk
#requires Murliver
#completewith MageTrain3
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
.xp <71,1
.cooldown item,6948,>2
step << Mage wotlk
#requires Murliver
.goto StormwindNew,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 43023 >>训练你的职业法术
.xp <71,1
.cooldown item,6948,>2
.target Elsharin
.target Jennea Cannon
step << Mage wotlk
#requires Murliver
#label MageTrain3
.goto StormwindNew,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42930 >>训练你的职业法术
.xp <72,1
.cooldown item,6948,>2
.target Elsharin
.target Jennea Cannon
step << (Shaman/DK/Mage/Druid) wotlk
#completewith next
.hs >>传送至菲兹兰克机场
.cooldown item,6948,>2
step << (!Shaman !DK !Mage !Druid) wotlk
#completewith next
.goto BoreanTundra,57.02,20.12,150 >>前往菲兹兰克机场
step
#questguide << !wotlk
.goto BoreanTundra,57.02,20.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿布尼|r交谈
.turnin 11715 >>交任务: |cRXP_FRIENDLY_石油资源|r
.accept 11718 >>接任务: |cRXP_LOOT_猛犸的毛皮|r
.target Abner Fizzletorque
step
#questguide << !wotlk
.goto BoreanTundra,53.55,21.34,70,0
.goto BoreanTundra,53.6,31.2,70,0
.goto BoreanTundra,52.9,40.5,70,0
.goto BoreanTundra,53.55,21.34
>>击杀|cRXP_ENEMY_长毛猛犸象|r和|cRXP_ENEMY_雄性长毛猛犸象|r和|cRXP_ENEMY_长毛猛犸象幼崽|r, 击败它们后可获得|cRXP_LOOT_皮毛|r
.complete 11718,1 
.mob Mammoth Calf
.mob Wooly Mammoth
.mob Wooly Mammoth Bull
step
#completewith next
.groundgoto BoreanTundra,48.4,36.4,50,0
.goto BoreanTundra,44.98,33.38,50 >>前往琥珀崖
step
.goto BoreanTundra,44.98,33.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加伦|r交谈
.turnin 12728 >>交任务: |cRXP_FRIENDLY_监视裂谷：冬鳞洞穴|r
.target Librarian Garren
step
#questguide << !wotlk
#completewith next
.goto BoreanTundra,45.33,34.54
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏雷斯塔兹|r交谈
.fly Fizzcrank >>飞往菲兹兰克机场
.target Surristrasz
step
#questguide << !wotlk
.goto BoreanTundra,57.05,20.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿布尼|r交谈
.turnin 11718 >>交任务: |cRXP_FRIENDLY_猛犸的毛皮|r
.accept 11723 >>接任务: |cRXP_LOOT_天摇地动！|r
.target Abner Fizzletorque
step
#questguide << !wotlk
#completewith next
.goto BoreanTundra,70.20,36.40,120 >>前往喷泉之地
.isOnQuest 11723
step
#questguide << !wotlk
#completewith next
.goto BoreanTundra,70.20,36.40
.cast 46017 >>|cRXP_WARN_使用|r|T133015:0|t[地震器5000型控制台] |cRXP_WARN_紧邻 |cRXP_PICK_陷坑|r旁, 以召唤|r|cRXP_ENEMY_克里卡希斯|r|r
.use 34981
.timer 36,Deploy the Shake-n-Quake! RP
step
#questguide << !wotlk
.goto BoreanTundra,69.78,36.46
>>|cRXP_WARN_等待RP刷新|r
>>击杀|cRXP_ENEMY_克里卡希斯|r
.complete 11723,1 
.complete 11723,2 
.use 34981
.mob Lord Kryxix
step
#questguide << !wotlk
#completewith next
.goto BoreanTundra,57.09,20.07,150 >>前往菲兹兰克机场
step
#questguide << !wotlk
#label end
.goto BoreanTundra,57.09,20.07
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿布尼|r交谈
.turnin 11723 >>交任务: |cRXP_FRIENDLY_天摇地动！|r
.target Abner Fizzletorque
step << (Shaman/Warlock/Paladin/Hunter/Rogue/Warrior) wotlk
#completewith next
.goto BoreanTundra,56.56,20.07
.zone Stormwind City >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_暴风城|r
.fly Valiance Keep >>飞往勇者要塞. 或者支付 |T626001:0|t|cFF3FC7EB法师|r 的传送费用前往暴风城
.zoneskip Elwynn Forest
.zoneskip Stormwind City
.target Kara Thricestar
step << (Shaman/Warlock/Paladin/Hunter/Rogue/Warrior) wotlk
#completewith ShamanTrain << Shaman
#completewith next << !Shaman
.goto BoreanTundra,59.70,69.26
.zone Stormwind City >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_暴风城|r, 与|cRXP_FRIENDLY_尼尔诺·铜线|r 交谈
.zoneskip Elwynn Forest
.skipgossip
.target Nelno Copperbeam
step << Shaman wotlk
.goto StormwindNew,67.52,89.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Umbrua|r交谈
.train 58801 >>训练你的职业法术
.xp <71,1
.target Farseer Umbrua
step << Shaman wotlk
#label ShamanTrain
.goto StormwindNew,67.52,89.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Umbrua|r交谈
.train 49237 >>训练你的职业法术
.xp <73,1
.target Farseer Umbrua
step << Warlock wotlk
.goto StormwindNew,42.26,81.77,20,0
.goto StormwindNew,40.64,84.94,15,0
.goto StormwindNew,39.88,84.19
>>进入已宰的羔羊酒馆并下楼
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_ 乌苏拉|r和|cRXP_FRIENDLY_ 德米塞特|r或 |cRXP_FRIENDLY_ 山达尔|r交谈
.train 47812 >>训练你的职业法术
.xp <71,1
.target Ursula Deline
.target Demisette Cloyce
.target Sandahl
step << Paladin wotlk
.goto StormwindNew,52.9,50.9,20,0
.goto StormwindNew,49.8,48.5,20,0
.goto StormwindNew,49.60,49.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arthur|r或|cRXP_FRIENDLY_Katherine|r交谈
.train 54428 >>训练你的职业法术
.xp <71,1
.target Arthur the Faithful
.target Katherine the Pure
step << Hunter wotlk
.goto StormwindNew,67.3,37.1,15,0
.goto StormwindNew,67.35,36.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
.train 49051 >>训练你的职业法术
.xp <71,1
.target Einris Brightspear
step << Rogue wotlk
.goto StormwindNew,77.42,65.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Osborne|r交谈
.train 48667 >>训练你的职业法术
.xp <73,1
.target Osborne the Night Man
step << Warrior wotlk
.goto StormwindNew,78.31,63.53,15,0
.goto StormwindNew,81.66,59.50,15,0
.goto StormwindNew,80.56,59.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
.train 47470 >>训练你的职业法术
.xp <73,1
.target Wu Shen
.target Ilsa Corbin
step << (Shaman/Warlock/Paladin/Hunter/Rogue/Warrior) wotlk
#completewith next
.hs >>传送至菲兹兰克机场
.zoneskip BoreanTundra
step
#completewith next
.goto BoreanTundra,45.33,34.54,-1
.goto BoreanTundra,56.57,20.08,-1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡拉·芒星|r或|cRXP_FRIENDLY_苏雷斯塔兹|r交谈
.fly Stars >>飞往群星之墓
.target Surristrasz
.target Kara Thricestar
step
.goto Dragonblight,12.16,55.22
.zone Dragonblight >>前往: |cRXP_PICK_龙骨荒野|r
step << !wotlk
#xprate >1.59
.goto Dragonblight,29.00,55.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderator|r交谈
.turnin -12107 >>交任务: |cRXP_FRIENDLY_魔网能量线的终端|r
.accept 12794 >>接任务: |cRXP_LOOT_魔法王国达拉然|r
.target Image of Archmage Modera
step << !wotlk
#xprate >1.59
.goto Dragonblight,29.00,55.45
.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
.skipgossip
.xp <74,1
.isOnQuest 12794
.target Image of Archmage Modera
step << !wotlk
#xprate >1.59
.abandon 12794 >>放弃魔法王国达拉然
step << wotlk
#xprate >1.499
.goto Dragonblight,28.84,56.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_信使兰森|r交谈
.accept 12171 >>接任务: |cRXP_LOOT_叛徒的名单|r
.target Courier Lanson
step << wotlk
#xprate >1.499
.goto Dragonblight,29.16,55.37
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕蕾娜·银云|r交谈
>>|cRXP_WARN_接受此任务将使你飞往东部龙骨荒野|r
.turnin 12171 >>交任务: |cRXP_FRIENDLY_叛徒的名单|r
.accept 12174 >>接任务: |cRXP_LOOT_高级指挥官哈尔弗·维姆班恩|r
.timer 88,Westguard Keep Flight
.target Palena Silvercloud
step << wotlk
#xprate >1.499
.goto Dragonblight,77.08,49.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗尼·威尔斯|r交谈
.fp Wintergarde Keep >>获取暮冬城飞行路径
.target Rodney Wells
step << wotlk
#xprate >1.499
.goto Dragonblight,78.59,48.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·蛇刃|r交谈
.turnin 12174 >>交任务: |cRXP_FRIENDLY_高级指挥官哈尔弗·维姆班恩|r
.target High Commander Halford Wyrmbane
step << wotlk
#xprate >1.499
.xp <73,1
#label Hills
.goto Dragonblight,77.13,50.13
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Urik|r交谈
>>|cRXP_WARN_接受此任务将传送你前往灰熊丘陵|r
.accept 12511 >>接任务: |cRXP_LOOT_丘陵援兵|r
.timer 150,飞往琥珀松木营地
.target Gryphon Commander Urik
step << wotlk
#xprate >1.499
.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
]])
RXPGuides.RegisterGuide([[
#cata
#mop
#wotlk
#xprate <1.5 << wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 72-74 龙骨荒野
#displayname 73-74 龙骨荒野 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 9
#next 73-75 灰熊丘陵
#xprate <1.5 << wotlk
#questguide << !wotlk
step
#label pt1start
#completewith DBStart
.goto Dragonblight,29.18,55.32,200 >>前往群星之墓
step
.goto Dragonblight,29.18,55.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕蕾娜·银云|r交谈
.fp Stars' Rest >>获取群星之墓的飞行路径
.target Palena Silvercloud
step
#label DBStart
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Modera|r和|cRXP_FRIENDLY_Jodi|r交谈
.accept 12000 >>接任务: |cRXP_LOOT_寻找线索|r
.goto Dragonblight,29.00,55.45
.accept 12166 >>接任务: |cRXP_LOOT_艾露恩的火油|r
.goto Dragonblight,29.18,55.65
.target Image of Archmage Modera
.target Warden Jodi Moonsong
step
.goto Dragonblight,28.83,56.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_信使兰森|r交谈
>>|cRXP_WARN_不要接受下一个任务|r
.turnin 12157 >>交任务: |cRXP_FRIENDLY_失踪的信使|r
.isOnQuest 12157
.target Courier Lanson
step
#completewith Trader
.goto Dragonblight,28.89,56.09
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_诺哈因|r交谈
.home >>将你的炉石设置为群星之墓
.target Naohain
step
.goto Dragonblight,31.9,45.9,70,0
.goto Dragonblight,28.8,51.5,70,0
.goto Dragonblight,23.8,50.0,70,0
.goto Dragonblight,28.8,51.5,70,0
.goto Dragonblight,31.9,45.9
.use 36956 >>击杀 |cRXP_ENEMY_天灾麋鹿|r和 |cRXP_ENEMY_疯狂熊怪|r. |cRXP_WARN_在它们的尸体上使用|r |T135777:0|t[艾露恩的火油] |cRXP_WARN_|r
.complete 12166,1 
.mob +Blighted Elk
.complete 12166,2 
.mob +Rabid Grizzly
step
#completewith next
.goto Dragonblight,24.19,60.06,100 >>前往眠月花园
step
#sticky
#label moonshadow
.goto Dragonblight,24.19,60.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟尼安·月影|r交谈
.accept 12006 >>接任务: |cRXP_LOOT_上层精灵的愤怒|r
.target Ethenial Moonshadow
step
.goto Dragonblight,22.7,58.1,70,0
.goto Dragonblight,23.3,61.3,70,0
.goto Dragonblight,25.9,58.7,70,0
.goto Dragonblight,22.75,57.36,70,0
.goto Dragonblight,21.62,54.84,70,0
.goto Dragonblight,24.72,54.84,70,0
.goto Dragonblight,22.7,58.1
.use 35792 >>击杀|cRXP_FRIENDLY_死亡的法师猎手|r 获取其 |T133641:0|t[|cRXP_LOOT_法师猎手的个人物品|r ]
>>打开他们的 |T133641:0|t[|cRXP_LOOT_法师猎人的个人物品|r], 直到获得|cRXP_PICK_眠月花园计划书|r
.complete 12000,1 
.target Dead Mage Hunter
step
#requires moonshadow
#completewith next
.goto Dragonblight,29.00,55.45,100 >>前往群星之墓
step
.goto Dragonblight,29.00,55.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderator|r交谈
.turnin 12000 >>交任务: |cRXP_FRIENDLY_寻找线索|r
.accept 12004 >>接任务: |cRXP_LOOT_阻碍协议|r
.target Image of Archmage Modera
step
.goto Dragonblight,29.18,55.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jodi|r交谈
.turnin 12166 >>交任务: |cRXP_FRIENDLY_艾露恩的火油|r
.accept 12167 >>接任务: |cRXP_LOOT_消灭教徒|r
.target Warden Jodi Moonsong
step
#completewith next
.groundgoto Dragonblight,28.2,45.9,50,0
.groundgoto Dragonblight,27.7,45.6,40,0
.goto Dragonblight,25.96,45.19,60 >>前往冰雾村
step
.goto Dragonblight,23.7,46.1,50,0
.goto Dragonblight,26.7,42.8,50,0
.goto Dragonblight,26.1,42.7,30,0
.goto Dragonblight,26.1,44.1,40,0
.goto Dragonblight,23.8,44.2,40,0
.goto Dragonblight,25.7,38.1,40,0
.goto Dragonblight,25.48,41.66
.use 36958 >>击杀|cRXP_ENEMY_Anub'ar Cultists|r. 掠夺他们以获得|cRXP_LOOT_Cultist Suits|r和 |T133330:0|t[|cRXP_LOOT_扎古斯的礼物|r]
>>|cRXP_WARN_使用 |T133330:0|t[|cRXP_LOOT_扎古斯的礼物|r] 开始任务|r
.complete 12167,1 
.collect 36958,1,12168
.accept 12168 >>接任务: |cRXP_LOOT_扎古斯的礼物|r
.mob Anub'ar Cultist
step
#completewith next
.goto Dragonblight,29.18,55.65,100 >>前往群星之墓
step
.goto Dragonblight,29.18,55.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jodi|r交谈
.turnin 12167 >>交任务: |cRXP_FRIENDLY_消灭教徒|r
.turnin 12168 >>交任务: |cRXP_FRIENDLY_扎古斯的礼物|r
.accept 12169 >>接任务: |cRXP_LOOT_高阶教徒|r
.target Warden Jodi Moonsong
step
#completewith next
.goto Dragonblight,26.15,49.48,15 >>坠入纳尔苏深渊
step
.goto Dragonblight,28.85,49.72
>>击杀纳尔苏深渊中的高阶教徒扎古斯|r
.complete 12169,1 
.mob High Cultist Zangus
step
#completewith Trader
.hs >>传送至群星之墓
.cooldown item,6948,>2
step
#completewith Trader
.goto Dragonblight,26.9,49.5,30,0
.goto Dragonblight,26.7,48.7,15,0
.goto Dragonblight,26.3,49.0,25 >>离开纳尔苏深渊
.cooldown item,6948,<0
step << skip
.goto Dragonblight,29.18,55.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jodi|r交谈
.turnin 12169 >>交任务: |cRXP_FRIENDLY_高阶教徒|r
.target Warden Jodi Moonsong
step
#completewith moonrest
>>击杀|cRXP_ENEMY_湍流之针巫师|r和|cRXP_ENEMY_眠月魔犬|r和|cRXP_ENEMY_魔法焦点巫师|r和|cRXP_ENEMY_龙骨荒野法师猎手|r
.complete 12006,1 
.mob Surge Needle Sorcerer
.mob Moonrest Stalker
.mob Focus Wizard
.mob Dragonblight Mage Hunter
step
#label Trader
.goto Dragonblight,18.39,58.89
>>击杀|cRXP_ENEMY_Wind Trader Mu'Fah|r. 击杀后搜刮他的|cRXP_LOOT_Remains|r
.complete 12004,1 
.mob Wind Trader Mu'fah
step
.goto Dragonblight,19.46,58.03
.use 36742 >>击杀|cRXP_ENEMY_古拉莫什|r. 击败他后拾取其掉落的|cRXP_LOOT_蛇鳞|r和 |T134889:0|t[|cRXP_LOOT_古拉莫什的奇怪装置|r]
>>|cRXP_WARN_使用 |T134889:0|t[|cRXP_LOOT_Goramosh的奇怪装置|r] 开始任务|r
.complete 12004,2 
.collect 36742,1,12055 
.accept 12055 >>接任务: |cRXP_LOOT_奇怪的设备|r
.mob Goramosh
step
#completewith next
.goto Dragonblight,29.00,55.45,100 >>前往群星之墓
step
#label moonrest
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Modera|r和|cRXP_FRIENDLY_Jodi|r交谈
.turnin 12004 >>交任务: |cRXP_FRIENDLY_阻碍协议|r
.turnin 12055 >>交任务: |cRXP_FRIENDLY_奇怪的设备|r
.accept 12060 >>接任务: |cRXP_LOOT_投影和计划|r
.goto Dragonblight,29.00,55.45
.turnin 12169 >>交任务: |cRXP_FRIENDLY_高阶教徒|r
.goto Dragonblight,29.18,55.65
.target Image of Archmage Modera
.target Warden Jodi Moonsong
step
#completewith next
.goto Dragonblight,25.4,56.2,60 >>前往眠月花园
step
#completewith Observe
>>击杀|cRXP_ENEMY_湍流之针巫师|r和|cRXP_ENEMY_眠月魔犬|r和|cRXP_ENEMY_魔法焦点巫师|r和|cRXP_ENEMY_龙骨荒野法师猎手|r
.complete 12006,1 
.mob Surge Needle Sorcerer
.mob Moonrest Stalker
.mob Focus Wizard
.mob Dragonblight Mage Hunter
step
.goto Dragonblight,25.4,56.2,-1
.cast 47097 >>|cRXP_WARN_使用|r|T134889:0|t[湍流之针传送器]|cRXP_WARN_传送到湍流之针|r
.goto Dragonblight,19.59,59.77,-1
.use 36747
.isOnQuest 12060
step
#label Observe
.goto Dragonblight,19.79,59.82
>>|cRXP_WARN_稍微向平台中心移动以完成任务目标|r
.complete 12060,1 
.use 36747
step
#completewith Atrocity
.cast 47097 >>|cRXP_WARN_使用|r|T134889:0|t[湍流之针传送器]|cRXP_WARN_传送到下方|r
.use 36747
step
.goto Dragonblight,20.96,55.17,70,0
.goto Dragonblight,21.73,60.34,70,0
.goto Dragonblight,19.80,61.84,70,0
.goto Dragonblight,17.54,58.47,70,0
.goto Dragonblight,20.96,55.17,70,0
.goto Dragonblight,21.73,60.34,70,0
.goto Dragonblight,19.36,62.30
>>击杀|cRXP_ENEMY_湍流之针巫师|r和|cRXP_ENEMY_眠月魔犬|r和|cRXP_ENEMY_魔法焦点巫师|r和|cRXP_ENEMY_龙骨荒野法师猎手|r
.complete 12006,1 
.mob Surge Needle Sorcerer
.mob Moonrest Stalker
.mob Focus Wizard
.mob Dragonblight Mage Hunter
step
#label Atrocity
.goto Dragonblight,24.19,60.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟尼安·月影|r交谈
.turnin 12006 >>交任务: |cRXP_FRIENDLY_上层精灵的愤怒|r
.accept 12013 >>接任务: |cRXP_LOOT_阿坎尼姆斯的终结|r
.target Ethenial Moonshadow
step
.groundgoto Dragonblight,20.63,60.86,30,0
.goto Dragonblight,20.03,59.74
>>击杀|cRXP_ENEMY_阿坎尼姆斯|r
.complete 12013,1 
.mob Arcanimus
step
.goto Dragonblight,24.19,60.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊瑟尼安·月影|r交谈
.turnin 12013 >>交任务: |cRXP_FRIENDLY_阿坎尼姆斯的终结|r
.target Ethenial Moonshadow
step
#completewith next
.goto Dragonblight,29.00,55.45,100 >>前往群星之墓
step
.goto Dragonblight,29.00,55.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderator|r交谈
.turnin 12060 >>交任务: |cRXP_FRIENDLY_投影和计划|r
.accept 12065 >>接任务: |cRXP_LOOT_海岸上的魔法焦点|r
.target Image of Archmage Modera
step
.goto Dragonblight,26.32,64.85
.use 36756 >>击杀|cRXP_ENEMY_魔法上尉艾米·马林|r, 掠夺她的|cRXP_LOOT_戒指|r和|T133469:0|t[|cRXP_LOOT_马林上尉的信|r]
>>|cRXP_WARN_使用 |T133469:0|t[|cRXP_LOOT_狩猎暴掠龙 Malin的信|r] 开始任务|r
.collect 36751,1,12065,1
.collect 36756,1,12067
.accept 12067 >>接任务: |cRXP_LOOT_一封家书|r
.mob Captain Emmy Malin
step
.goto Dragonblight,26.54,65.08
.use 36751 >>|cRXP_WARN_使用|r|T133377:0|t[魔网能量焦点控制指环] |cRXP_WARN_在|r|cRXP_PICK_魔网能量线焦点上|r
>>|cRXP_WARN_一旦施法完成, 你就可以开始上马了|r
.complete 12065,1 
step
#completewith next
.groundgoto Dragonblight,25.09,60.98,50,0
.goto Dragonblight,29.00,55.45,100 >>前往群星之墓
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Modera|r和|cRXP_FRIENDLY_Saia|r交谈
.turnin 12065 >>交任务: |cRXP_FRIENDLY_海岸上的魔法焦点|r
.accept 12083 >>接任务: |cRXP_LOOT_森林上空|r
.goto Dragonblight,29.00,55.45
.turnin 12067 >>交任务: |cRXP_FRIENDLY_一封家书|r
.goto Dragonblight,29.04,55.42
.target Image of Archmage Modera
.target Commander Saia Azuresteel
step
.goto Dragonblight,28.73,57.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨蕾德亚娜|r交谈
.accept 12092 >>接任务: |cRXP_LOOT_强化古树|r
.target Sarendryana
step
.goto Dragonblight,33.8,60.2,70,0
.goto Dragonblight,36.2,61.7,70,0
.goto Dragonblight,30.6,66.7,70,0
.goto Dragonblight,34.3,68.3,70,0
.goto Dragonblight,29.8,71.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_林地行者|r交谈, 以获得他们的|T134882:0|t[|cRXP_LOOT_行者的吠叫声|r]
>>击杀|cRXP_ENEMY_Woodland Walkers|r, 如果他们转为敌对状态. 从他们身上搜刮出 |T134882:0|t[|cRXP_LOOT_Barks of the Walkers|r]
.use 36786 >>|cRXP_WARN_使用|r|T134882:0|t[|cRXP_LOOT_行者之吠|r], |cRXP_WARN_目标: |r|cRXP_FRIENDLY_罗萨洛尔古树|r
.collect 36786,3,12092,1,-1 
.complete 12092,1 
.skipgossip
.mob Woodlands Walker
.target Lothalor Ancient
step
#completewith next
.goto Dragonblight,33.1,71.5,60,0
.goto Dragonblight,32.4,72.7,60,0
.goto Dragonblight,31.5,72.0,60,0
.goto Dragonblight,31.9,70.4
>>击杀|cRXP_ENEMY_Lieutenant Ta'zinni|r, 搜刮其尸体获得 |T133312:0|t[|cRXP_LOOT_魔网能量焦点控制护符|r]
>>|cRXP_ENEMY_塔齐尼中尉|r|cRXP_WARN_巡逻罗萨洛尔森林|r
.collect 36779,1,12083,1 
.unitscan Lieutenant Ta'zinni
step
.goto Dragonblight,32.2,71.4
.use 36779 >>|cRXP_WARN_使用|r|T133312:0|t[|cRXP_LOOT_魔网能量线焦点控制护符|r] |cRXP_WARN_在|r|cRXP_PICK_魔网能量线焦点上|r
>>|cRXP_WARN_一旦施法完成, 你就可以开始上马了|r
.complete 12083,1 
step
#completewith next
.goto Dragonblight,28.73,57.10,100 >>前往群星之墓
step
.goto Dragonblight,28.73,57.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨蕾德亚娜|r交谈
.turnin 12092 >>交任务: |cRXP_FRIENDLY_强化古树|r
.target Sarendryana
step
.goto Dragonblight,29.00,55.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderator|r交谈
.turnin 12083 >>交任务: |cRXP_FRIENDLY_森林上空|r
.accept 12098 >>接任务: |cRXP_LOOT_搜索因度雷村|r
.target Image of Archmage Modera
step
#completewith next
.goto Dragonblight,40.25,66.85,70 >>前往因度雷湖
step
.goto Dragonblight,40.25,66.85
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与水下的|cRXP_FRIENDLY_法师指挥官伊文斯塔尸体|r交谈
.turnin 12098 >>交任务: |cRXP_FRIENDLY_搜索因度雷村|r
.accept 12107 >>接任务: |cRXP_LOOT_魔网能量线的终端|r
.target Mage-Commander Evenstar
step
.goto Dragonblight,39.79,67.03
.use 36815 >>|cRXP_WARN_在水下使用|r|T133442:0|t[|cRXP_LOOT_魔网能量线焦点控制饰品|r]|cRXP_WARN_在|cRXP_PICK_魔网能量线焦点|r处|r
.complete 12107,1 
step
#completewith Konani
.goto Dragonblight,48.52,74.39,100 >>前往莫亚基港口
.skill coldweatherflying,<1,1
step
#completewith next
.goto Dragonblight,48.52,74.39,100 >>前往莫亚基港口
>>|cRXP_WARN_接近莫亚基港口时, 下悬崖要小心|r
.skill coldweatherflying,1,1
step
#completewith Konani
#label MoaFP
.goto Dragonblight,48.52,74.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cid|r交谈
.fp Moa'ki >>获取莫亚基港口的飞行路径
.target Cid Flounderfix
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mau'i|r和|cRXP_FRIENDLY_Ko'nani|r交谈
.daily 11960 >>接任务: |cRXP_LOOT_未来的种子|r
.goto Dragonblight,48.25,74.35
.accept 11958 >>接任务: |cRXP_LOOT_不要浪费|r
.turnin 12117 >>交任务: |cRXP_FRIENDLY_前往莫亚基港口|r
.goto Dragonblight,48.00,74.87
.isOnQuest 12117
.target Trapper Mau'i
.target Elder Ko'nani
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mau'i|r和|cRXP_FRIENDLY_Ko'nani|r交谈
.daily 11960 >>接任务: |cRXP_LOOT_未来的种子|r
.goto Dragonblight,48.25,74.35
.accept 11958 >>接任务: |cRXP_LOOT_不要浪费|r
.turnin 12118 >>交任务: |cRXP_FRIENDLY_前往莫亚基港口|r
.goto Dragonblight,48.00,74.87
.isOnQuest 12118
.target Trapper Mau'i
.target Elder Ko'nani

step
#label Konani
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mau'i|r和|cRXP_FRIENDLY_Ko'nani|r交谈
.daily 11960 >>接任务: |cRXP_LOOT_未来的种子|r
.goto Dragonblight,48.25,74.35
.accept 11958 >>接任务: |cRXP_LOOT_不要浪费|r
.goto Dragonblight,48.00,74.87
.target Trapper Mau'i
.target Elder Ko'nani

step
#completewith next
.goto Dragonblight,52.92,65.64,20 >>前往碧蓝巨龙圣地
step
.goto Dragonblight,52.92,65.64
>>观察碧蓝巨龙圣地
.complete 12107,2 
step
#requires MoaFP
#loop
.line Dragonblight,49.07,63.26,47.35,64.41,47.33,61.52,44.89,61.37,45.24,63.72,43.85,68.47,42.64,71.91,44.57,71.43,46.01,68.68,47.33,64.45,49.07,63.26
.goto Dragonblight,49.07,63.26,55,0
.goto Dragonblight,47.35,64.41,55,0
.goto Dragonblight,47.33,61.52,55,0
.goto Dragonblight,44.89,61.37,55,0
.goto Dragonblight,45.24,63.72,55,0
.goto Dragonblight,43.85,68.47,55,0
.goto Dragonblight,42.64,71.91,55,0
.goto Dragonblight,44.57,71.43,55,0
.goto Dragonblight,46.01,68.68,55,0
.goto Dragonblight,47.33,64.45,55,0
.goto Dragonblight,49.07,63.26,55,0
>>击杀|cRXP_ENEMY_飘雪林地雌性狼獾人|r和|cRXP_ENEMY_飘雪林地掠夺者|r和|cRXP_ENEMY_飘雪林地萨满|r和|cRXP_ENEMY_飘雪林地狼人|r. 搜刮他们的|cRXP_LOOT_物品|r
>>战利品 |cRXP_LOOT_飘雪林地幼崽|r. |cRXP_WARN_不要杀死它们|r
.complete 11958,1 
.complete 11960,1 
.isOnQuest 11960
.target Snowfall Glade Den Mother
.target Snowfall Glade Reaver
.target Snowfall Glade Shaman
.target Snowfall Glade Wolvar
.target Snowfall Glade Pup
step
#requires MoaFP
#loop
.line Dragonblight,49.07,63.26,47.35,64.41,47.33,61.52,44.89,61.37,45.24,63.72,43.85,68.47,42.64,71.91,44.57,71.43,46.01,68.68,47.33,64.45,49.07,63.26
.goto Dragonblight,49.07,63.26,55,0
.goto Dragonblight,47.35,64.41,55,0
.goto Dragonblight,47.33,61.52,55,0
.goto Dragonblight,44.89,61.37,55,0
.goto Dragonblight,45.24,63.72,55,0
.goto Dragonblight,43.85,68.47,55,0
.goto Dragonblight,42.64,71.91,55,0
.goto Dragonblight,44.57,71.43,55,0
.goto Dragonblight,46.01,68.68,55,0
.goto Dragonblight,47.33,64.45,55,0
.goto Dragonblight,49.07,63.26,55,0
>>击杀|cRXP_ENEMY_飘雪林地雌性狼獾人|r和|cRXP_ENEMY_飘雪林地掠夺者|r和|cRXP_ENEMY_飘雪林地萨满|r和|cRXP_ENEMY_飘雪林地狼人|r. 搜刮他们的|cRXP_LOOT_物品|r
.complete 11958,1 
.target Snowfall Glade Den Mother
.target Snowfall Glade Reaver
.target Snowfall Glade Shaman
.target Snowfall Glade Wolvar
step
#completewith next
.goto Dragonblight,48.25,74.35,100 >>前往莫亚基港口
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mau'i|r和|cRXP_FRIENDLY_Ko'nani|r交谈
.turnin 11960 >>交任务: |cRXP_FRIENDLY_未来的种子|r
.goto Dragonblight,48.25,74.35
.turnin 11958 >>交任务: |cRXP_FRIENDLY_不要浪费|r
.accept 11959 >>接任务: |cRXP_LOOT_消灭洛根|r
.goto Dragonblight,48.00,74.87
.target Trapper Mau'i
.target Elder Ko'nani
step
.use 35688 >>击杀|cRXP_ENEMY_洛根|r. 击败他后搜刮 |T136168:0|t[|cRXP_LOOT_洛根的血|r]
>>|cRXP_WARN_使用|r|T136168:0|t[|cRXP_LOOT_洛根的血|r]
.collect 35688,1,11959,1 
.goto Dragonblight,46.34,59.13
.complete 11959,1 
.goto Dragonblight,48.03,74.82
.unitscan Loguhn
step
#completewith next
.goto Dragonblight,48.00,74.87,100 >>前往莫亚基港口
step
.goto Dragonblight,48.00,74.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ko'nani|r交谈
.turnin 11959 >>交任务: |cRXP_FRIENDLY_消灭洛根|r
.target Elder Ko'nani
step
#questguide << !wotlk
.goto Dragonblight,48.00,76.15,20,0
.goto Dragonblight,47.69,76.64
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tua'kea|r交谈
.accept 12009 >>接任务: |cRXP_LOOT_图尔凯的螃蟹陷阱|r
.target Tua'kea
step
.goto Dragonblight,49.15,75.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Toalu'u|r交谈
.accept 12028 >>接任务: |cRXP_LOOT_灵魂视界|r
.target Toalu'u the Mystic
step
.goto Dragonblight,48.94,75.75
.use 35907 >>|cRXP_WARN_使用|r|T132859:0|t[图阿鲁的灵魂熏香] |cRXP_WARN_靠近|r|cRXP_PICK_图阿鲁的火盆|r
>>|cRXP_WARN_等待RP结束|r
.cast 47190
.timer 160,Spiritual Insight RP
.complete 12028,1 
step
.goto Dragonblight,49.15,75.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Toalu'u|r交谈
.turnin 12028 >>交任务: |cRXP_FRIENDLY_灵魂视界|r
.accept 12030 >>接任务: |cRXP_LOOT_长者玛纳洛|r
.target Toalu'u the Mystic
step
#completewith Kili
.cast 48359 >>|cRXP_WARN_Use|r|T132822:0|t[塔乌凯亚的呼吸囊]
.use 37265
.itemcount 37265,1
step
#completewith next
.use 38351 >>|cRXP_WARN_使用 |T134800:0|t[鲨肝油]|cRXP_WARN_来提高你的游泳速度|r
.itemcount 38351,1
.isQuestTurnedIn 11559
step
#questguide << !wotlk
#completewith Kili
.goto Dragonblight,46.5,76.2,0
>>在海底掠夺|cRXP_LOOT_图尔凯的螃蟹陷阱|r
.complete 12009,1 
step
.goto Dragonblight,47.72,79.99
>>点击海底的|cRXP_PICK_被破坏的螃蟹陷阱|r
.accept 12011 >>接任务: |cRXP_LOOT_大麻烦的征兆|r
step
.goto Dragonblight,47.7,76.6,20,0
.goto Dragonblight,47.99,76.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tua'kea|r交谈
.turnin 12011 >>交任务: |cRXP_FRIENDLY_大麻烦的征兆|r
.accept 12016 >>接任务: |cRXP_LOOT_诱饵|r
.target Tua'kea
step << !Shaman !DK wotlk
#completewith next
.use 38351 >>|cRXP_WARN_使用 |T134800:0|t[鲨肝油]|cRXP_WARN_来提高你的游泳速度|r
.itemcount 38351,1
.isQuestTurnedIn 11559
step
#label Kili
.goto Dragonblight,43.9,82.7,60,0
.goto Dragonblight,42.00,79.86
>>击杀|cRXP_ENEMY_Kili'ua|r. 击败后搜刮他的|cRXP_LOOT_Pincers|r
.complete 12016,1 
.unitscan Kili'ua
step << wotlk
#completewith next
.use 38351 >>|cRXP_WARN_使用 |T134800:0|t[鲨肝油]|cRXP_WARN_来提高你的游泳速度|r
.itemcount 38351,1
.isQuestTurnedIn 11559
step
#questguide << !wotlk
#loop
.line Dragonblight,44.59,80.85,45.88,81.77,46.31,80.21,45.33,79.80,44.60,79.57,45.53,78.37,46.03,78.29,46.15,76.58,46.66,75.83,46.61,77.50,47.15,78.65,48.33,78.85,45.88,81.77
.goto Dragonblight,44.59,80.85,45,0
.goto Dragonblight,45.88,81.77,45,0
.goto Dragonblight,46.31,80.21,45,0
.goto Dragonblight,45.33,79.80,45,0
.goto Dragonblight,44.60,79.57,45,0
.goto Dragonblight,45.53,78.37,45,0
.goto Dragonblight,46.03,78.29,45,0
.goto Dragonblight,46.15,76.58,45,0
.goto Dragonblight,46.66,75.83,45,0
.goto Dragonblight,46.61,77.50,45,0
.goto Dragonblight,47.15,78.65,45,0
.goto Dragonblight,48.33,78.85,45,0
.goto Dragonblight,45.88,81.77,45,0
.use 37265 >>在海底掠夺|cRXP_LOOT_图尔凯的螃蟹陷阱|r
.complete 12009,1 
step
#questguide << !wotlk
.goto Dragonblight,47.7,76.6,20,0
.goto Dragonblight,47.99,76.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tua'kea|r交谈
.turnin 12009 >>交任务: |cRXP_FRIENDLY_图尔凯的螃蟹陷阱|r
.turnin 12016 >>交任务: |cRXP_FRIENDLY_诱饵|r
.accept 12017 >>接任务: |cRXP_LOOT_鱼钩上的肉|r
.target Tua'kea
step << !wotlk
.goto Dragonblight,47.7,76.6,20,0
.goto Dragonblight,47.99,76.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tua'kea|r交谈
.turnin 12016 >>交任务: |cRXP_FRIENDLY_诱饵|r
.accept 12017 >>接任务: |cRXP_LOOT_鱼钩上的肉|r
.target Tua'kea
step
.goto Dragonblight,46.74,78.18
.use 35838 >>|cRXP_WARN_使用|r|T134036:0|t[图格瓦尔的诱饵], |cRXP_WARN_目标: |r|cRXP_PICK_图阿凯亚的鱼钩|r在水下召唤|r|cRXP_ENEMY_图格瓦尔|r
>>击杀|cRXP_ENEMY_Tu'u'gwar|r
.cast 47159
.timer 35,Meat on the Hook RP
.complete 12017,1 
.mob Tu'u'gwar
step
.goto Dragonblight,47.99,76.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tua'kea|r交谈
.turnin 12017 >>交任务: |cRXP_FRIENDLY_鱼钩上的肉|r
.target Tua'kea
step
#completewith next
.groundgoto Dragonblight,48.5,67.8,50,0
.goto Dragonblight,36.63,64.96,50 >>前往北方的因杜雷村
step
.goto Dragonblight,36.63,64.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_长者玛纳洛|r交谈. |cRXP_WARN_途中不要杀死任何|cRXP_ENEMY_印杜雷|r|r
.turnin 12030 >>交任务: |cRXP_FRIENDLY_长者玛纳洛|r
.accept 12031 >>接任务: |cRXP_LOOT_解脱和安息|r
.target Elder Mana'loa
step
.goto Dragonblight,36.5,65.5,50,0
.goto Dragonblight,37.0,70.8,50,0
.goto Dragonblight,42.1,71.1,50,0
.goto Dragonblight,41.4,63.7
>>击杀|cRXP_ENEMY_Indu'le Mystics|r和|cRXP_ENEMY_Indu'le Warriors|r和|cRXP_ENEMY_Indu'le Fishermen|r
.complete 12031,1 
.mob Indu'le Mystic
.mob Indu'le Warrior
.mob Indu'le Fisherman
step
#questguide << !wotlk
.goto Dragonblight,36.63,64.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_长者玛纳洛|r交谈
.turnin 12031 >>交任务: |cRXP_FRIENDLY_解脱和安息|r
.accept 12032 >>接任务: |cRXP_LOOT_海洋女神|r
.target Elder Mana'loa
step << !wotlk
.goto Dragonblight,36.63,64.96
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_长者玛纳洛|r交谈
.turnin 12031 >>交任务: |cRXP_FRIENDLY_解脱和安息|r
.target Elder Mana'loa
step
#questguide << !wotlk
#completewith next
.groundgoto Dragonblight,34.5,80.1,40,0
.groundgoto Dragonblight,35.1,82.5,40,0
.goto Dragonblight,33.91,83.22,40 >>前往海洋之巅
step
#questguide << !wotlk
.waypoint Dragonblight,34.11,84.76,-47098,wpbuff,UNIT_AURA
.goto Dragonblight,33.96,83.49
>>点击|cRXP_PICK_深海珍珠|r
>>|cRXP_WARN_等待RP结束|r
>>|cRXP_WARN_一旦你获得|r|T135895:0|t[奥恰诺亚的强制]|cRXP_WARN_buff, 跳入水中以|r|cRXP_FRIENDLY_Oacha'noa|r
.cast 3365
.timer 40,Oach'a'noa RP
.complete 12032,1 
.target Oacha'noa
step << Druid wotlk
#completewith DruidTrain1
.cast 18960 >>传送术:月光林地
.zoneskip Moonglade
.xp <72,1
step << Druid wotlk
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48464 >>训练你的职业法术
.xp <72,1
.target Loganaar
step << Druid wotlk
#label DruidTrain1
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 53307 >>训练你的职业法术
.xp <74,1
.target Loganaar
step << DK wotlk
#completewith DKTrain1
.cast 50977 >>施放死亡之门
.zoneskip Eastern Plaguelands
.xp <72,1
step << DK wotlk
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49940 >>训练你的职业法术
.xp <72,1
.target Amal'thazad
step << DK wotlk
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49904 >>训练你的职业法术
.xp <73,1
.target Amal'thazad
step << DK wotlk
#label DKTrain1
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49929 >>训练你的职业法术
.xp <74,1
.target Amal'thazad
step << Mage wotlk
#completewith MageTrain1
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
.xp <72,1
step << Mage wotlk
.goto Stormwind City,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42930 >>训练你的职业法术
.xp <72,1
.target Elsharin
.target Jennea Cannon
step << Mage wotlk
.goto Stormwind City,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 43019 >>训练你的职业法术
.xp <73,1
.target Elsharin
.target Jennea Cannon
step << Mage wotlk
#label MageTrain1
.goto Stormwind City,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42939 >>训练你的职业法术
.xp <74,1
.target Elsharin
.target Jennea Cannon
step
#label pt1end
#completewith next
.hs >>传送至群星之墓
step
.goto Dragonblight,29.00,55.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderator|r交谈
.turnin 12107 >>交任务: |cRXP_FRIENDLY_魔网能量线的终端|r
.accept 12119 >>接任务: |cRXP_LOOT_拜见巨龙女王|r
.target Image of Archmage Modera
step
#label pt2start
.goto Dragonblight,28.84,56.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_信使兰森|r交谈
.accept 12171 >>接任务: |cRXP_LOOT_叛徒的名单|r
.target Courier Lanson
step
.goto Dragonblight,29.18,55.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_帕蕾娜·银云|r交谈
.turnin 12171 >>交任务: |cRXP_FRIENDLY_叛徒的名单|r
.accept 12174 >>接任务: |cRXP_LOOT_高级指挥官哈尔弗·维姆班恩|r
.timer 88,Westguard Keep Flight
>>|cRXP_WARN_接受此任务将使你飞往东部龙骨荒野|r
.target Palena Silvercloud
step
#completewith next
.goto Dragonblight,77.08,49.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗尼·威尔斯|r交谈
.fp Wintergarde Keep>>获取暮冬城飞行路径
.target Rodney Wells
step
.goto Dragonblight,78.59,48.18
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·蛇刃|r交谈
.turnin 12174 >>交任务: |cRXP_FRIENDLY_高级指挥官哈尔弗·维姆班恩|r
.accept 12235 >>接任务: |cRXP_LOOT_纳克萨玛斯与暮冬城的陷落|r
.target High Commander Halford Wyrmbane
step
.goto Dragonblight,77.10,50.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Urik|r交谈
.turnin 12235 >>交任务: |cRXP_FRIENDLY_纳克萨玛斯与暮冬城的陷落|r
.accept 12237 >>接任务: |cRXP_LOOT_拯救暮冬城平民|r
.target Gryphon Commander Urik
step
#completewith next
.goto Dragonblight,77.13,49.78
.vehicle 27258 >>|cRXP_WARN_使用|r|T132161:0|t[暮冬城狮鹫哨] |cRXP_WARN_来骑乘|r|cRXP_FRIENDLY_狮鹫|r
.use 37287
step
.waypoint Dragonblight,86.38,50.91,0,rescue,VEHICLE_PASSENGERS_CHANGED,VEHICLE_UPDATE
>>|cRXP_WARN_飞往腐臭平原|r
>>|cRXP_WARN_施放|r|T134148:0|t[营救村民] (1)|cRXP_WARN_去拾取|cRXP_FRIENDLY_无助的村民|r. 你每次只能拾取一个|r
>>|cRXP_WARN_投掷|r|T134149:0|t[交付村民] (2)|cRXP_WARN_将他们交给|r|cRXP_FRIENDLY_Urik|r
>>|cRXP_WARN_施放|r|T132172:0|t[翱翔] (3)|cRXP_WARN_冷却中, 飞行速度更快|r
.complete 12237,1 
.goto Dragonblight,77.13,49.78
.use 37287
.target Helpless Wintergarde Villager
step
.goto Dragonblight,77.10,50.12
>>|cRXP_WARN_下坐骑狮鹫|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Urik|r交谈
.turnin 12237 >>交任务: |cRXP_FRIENDLY_拯救暮冬城平民|r
.accept 12251 >>接任务: |cRXP_LOOT_向高级指挥官复命|r
.target Gryphon Commander Urik
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Halford Wyrmbane|r和|cRXP_FRIENDLY_Windstryke|r交谈
.turnin 12251 >>交任务: |cRXP_FRIENDLY_向高级指挥官复命|r
.accept 12253 >>接任务: |cRXP_LOOT_拯救暮冬城的平民|r
.accept 12275 >>接任务: |cRXP_LOOT_破坏专家斯林奇|r
.goto Dragonblight,78.47,48.28
.accept 12258 >>接任务: |cRXP_LOOT_亡者的命运|r
.goto Dragonblight,78.64,48.18
.target High Commander Halford Wyrmbane
.target Commander Lynore Windstryke
step
.goto Dragonblight,79.15,47.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幻象师瑟里格|r交谈
.accept 12282 >>接任务: |cRXP_LOOT_往日的烙印|r
.target Zelig the Visionary
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Quarterflash|r和|cRXP_FRIENDLY_Von Zeldig|r交谈
.turnin 12275 >>交任务: |cRXP_FRIENDLY_破坏专家斯林奇|r
.accept 12276 >>接任务: |cRXP_LOOT_寻找斯林奇|r
.accept 12272 >>接任务: |cRXP_LOOT_流血的矿石|r
.goto Dragonblight,77.84,50.29
.accept 12269 >>接任务: |cRXP_LOOT_我们的矿洞？休想！|r
.goto Dragonblight,77.80,50.34
.target Siege Engineer Quarterflash
.target Highlord Leoric Von Zeldig
step
#completewith chief
.goto Dragonblight,77.47,51.41,10,0
.goto Dragonblight,77.41,51.84,10,0
.goto Dragonblight,77.47,51.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊露希亚·卢恩|r交谈
.home >>将你的[炉石]设置为暮冬城
.target Illusia Lune
step
.goto Dragonblight,77.34,51.43
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击|cRXP_FRIENDLY_通缉告示|r
.accept 12438 >>接任务: |cRXP_LOOT_悬赏：克留格·碎誓者|r
.accept 12441 >>接任务: |cRXP_LOOT_通缉：高阶萨满祭司德金·血爪|r
.accept 12442 >>接任务: |cRXP_LOOT_悬赏：先锋军指挥官尤斯图斯|r
step
#completewith next
.groundgoto Dragonblight,78.84,48.23,50,0
.goto Dragonblight,79.6,50.5,15 >>进入议政厅
step
#label orb
#sticky
.goto Dragonblight,79.6,50.5,10,0
.goto Dragonblight,78.86,50.88
>>|cRXP_WARN_前往议政厅, 沿楼梯向上前进|r
>>拾取二楼的|cRXP_LOOT_占卜宝珠|r
.complete 12282,1 
step
.goto Dragonblight,78.98,51.61,60,0
.goto Dragonblight,79.83,51.69,60,0
.goto Dragonblight,80.89,51.51,60,0
.goto Dragonblight,80.70,48.22,60,0
.goto Dragonblight,79.89,52.17
>>击杀围绕在被困的暮冬城平民周围的复仇的恶鬼
.complete 12258,1 
.complete 12253,1 
.mob Vengeful Geist
step
#completewith next
.goto Dragonblight,80.21,44.87,15 >>前往冬泉矿井, 从下方的矿井通道进入
step
#sticky
#label mine
.goto Dragonblight,78.9,42.1,0,0
>>击杀|r复活的暮冬城矿工|cRXP_ENEMY_. 从他们身上搜刮|r|cRXP_LOOT_卡牌|r
>>|cRXP_ENEMY_冬泉守卫者|r|cRXP_WARN_不要丢弃它们|r
>>拾取地面上的奇怪的矿石
.complete 12269,1 
.complete 12272,1 
.mob Risen Wintergarde Miner
step
.goto Dragonblight,81.53,42.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Slinkin|r的尸体对话
.turnin 12276 >>交任务: |cRXP_FRIENDLY_寻找斯林奇|r
.accept 12277 >>接任务: |cRXP_LOOT_阻绝邪恶|r
.target Slinkin the Demo-gnome
step
.goto Dragonblight,80.74,41.31
>>拾取地面上的 |T133717:0|t[|cRXP_LOOT_暮冬矿洞炸弹|r]
.collect 37465,1,12277,1
step
.goto Dragonblight,80.14,45.35
.cast 48741 >>|cRXP_WARN_在下层矿井入口处使用|r|T133717:0|t[|cRXP_LOOT_暮冬矿洞炸弹|r]|r

.use 37465
.isOnQuest 12277
step
.goto Dragonblight,80.42,44.95
.cast 48741 >>|cRXP_WARN_在矿井上层入口处使用|r|T133717:0|t[|cRXP_LOOT_暮冬矿洞炸弹|r]|r

.use 37465
.isOnQuest 12277
step
.groundgoto Dragonblight,81.54,48.75,50,0
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Halford|r和|cRXP_FRIENDLY_Windstryke|r交谈
.turnin 12253 >>交任务: |cRXP_FRIENDLY_拯救暮冬城的平民|r
.accept 12309 >>接任务: |cRXP_LOOT_找到杜尔库！|r
.goto Dragonblight,78.58,48.20
.turnin 12258 >>交任务: |cRXP_FRIENDLY_亡者的命运|r
.goto Dragonblight,78.64,48.18
.target High Commander Halford Wyrmbane
.target Commander Lynore Windstryke
step
.goto Dragonblight,79.15,47.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幻象师瑟里格|r交谈
.turnin 12282 >>交任务: |cRXP_FRIENDLY_往日的烙印|r
.accept 12287 >>接任务: |cRXP_LOOT_欧瑞克·图哈特|r
.target Zelig the Visionary
step
.goto Dragonblight,77.81,50.29
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Quarterflash|r和|cRXP_FRIENDLY_Von Zeldig|r交谈
.turnin 12272 >>交任务: |cRXP_FRIENDLY_流血的矿石|r
.turnin 12277 >>交任务: |cRXP_FRIENDLY_阻绝邪恶|r
.accept 12281 >>接任务: |cRXP_LOOT_天灾战争机器的奥秘|r
.goto Dragonblight,77.84,50.29
.turnin 12269 >>交任务: |cRXP_FRIENDLY_我们的矿洞？休想！|r
.goto Dragonblight,77.80,50.34
.target Siege Engineer Quarterflash
.target Highlord Leoric Von Zeldig
step
.goto Dragonblight,78.54,48.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与半兽人|cRXP_FRIENDLY_Halford|r交谈
.turnin 12281 >>交任务: |cRXP_FRIENDLY_天灾战争机器的奥秘|r
.target High Commander Halford Wyrmbane
step
#completewith next
.goto Dragonblight,79.06,53.21,50 >>前往位于暮冬地穴的 |cRXP_FRIENDLY_Durkon|r
step
.goto Dragonblight,79.06,53.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Durkon|r交谈
.turnin 12309 >>交任务: |cRXP_FRIENDLY_找到杜尔库！|r
.accept 12311 >>接任务: |cRXP_LOOT_贵族的陵墓|r
.target Cavalier Durkon
step
.goto Dragonblight,78.62,52.28
>>|cRXP_WARN_进入暮冬地穴|r
>>击杀通灵领主阿玛里恩
>>点击地面上的|cRXP_PICK_血之魔典|r
.complete 12311,1 
.accept 12312 >>接任务: |cRXP_LOOT_天灾的秘密|r
.mob Necrolord Amarion
step
#label pt2end
.goto Dragonblight,79.06,53.21
>>|cRXP_WARN_退出暮冬地穴|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Durkon|r交谈
.turnin 12311 >>交任务: |cRXP_FRIENDLY_贵族的陵墓|r
.turnin 12312 >>交任务: |cRXP_FRIENDLY_天灾的秘密|r
.accept 12319 >>接任务: |cRXP_LOOT_血之魔典|r
.target Cavalier Durkon
step
.goto Dragonblight,78.56,48.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与半兽人|cRXP_FRIENDLY_Halford|r交谈
.turnin 12319 >>交任务: |cRXP_FRIENDLY_血之魔典|r
.accept 12320 >>接任务: |cRXP_LOOT_破译魔典|r
.target High Commander Halford Wyrmbane
step
#completewith next
.groundgoto Dragonblight,78.2,46.7,40,0
.goto Dragonblight,76.81,47.51,40 >>前往要塞
step
.goto Dragonblight,76.81,47.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官Eligor|r交谈
.accept 12464 >>接任务: |cRXP_LOOT_我的老对手|r
.target Commander Eligor Dawnbringer
step
.goto Dragonblight,76.99,47.92,12,0
.goto Dragonblight,76.82,47.52
>>|cRXP_WARN_进入地下室的监狱|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hallard|r交谈
.turnin 12320 >>交任务: |cRXP_FRIENDLY_破译魔典|r
.accept 12321 >>接任务: |cRXP_LOOT_正义的审判|r
.timer 184,A Righteous Sermon RP
.target Inquisitor Hallard
step
.goto Dragonblight,78.2,47.2
>>|cRXP_WARN_离开要塞|r
>>|cRXP_WARN_等待箭头指向的位置, 同时|cRXP_FRIENDLY_审讯员哈尔拉德|r发表他的正义布道|r
>>|cRXP_WARN_如果你走得太远导致任务失败, 请返回重新领取任务|r
>>|cRXP_WARN_他需要2分55秒. 这段时间你可以休息一下|r
.complete 12321,1 
step
.goto Dragonblight,78.48,48.35
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与半兽人|cRXP_FRIENDLY_Halford|r交谈
.turnin 12321 >>交任务: |cRXP_FRIENDLY_正义的审判|r
.accept 12325 >>接任务: |cRXP_LOOT_进入敌占区|r
.target High Commander Halford Wyrmbane
step
#completewith next
.goto Dragonblight,77.20,49.54,-1
.goto Dragonblight,89.68,46.36,-1
.vehicle >>骑乘|cRXP_FRIENDLY_暮冬城狮鹫|r飞往索尔森的岗哨
.timer 40,Into Hostile Territory RP
.target Wintergarde Gryphon
.skill coldweatherflying,1,1
step
.goto Dragonblight,89.68,46.36
>>|cRXP_WARN_等待飞往索尔森的岗哨的航班|r
>>|cRXP_WARN_当你接近地面时, 点击|r|T135992:0|t[降落伞]|cRXP_WARN_buff|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Foehammer|r交谈
.turnin 12325 >>交任务: |cRXP_FRIENDLY_进入敌占区|r
.accept 12326 >>接任务: |cRXP_LOOT_蒸汽坦克行动|r
.target Duke August Foehammer
.skill coldweatherflying,1,1
step
.goto Dragonblight,89.68,46.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Foehammer|r交谈
.turnin 12325 >>交任务: |cRXP_FRIENDLY_进入敌占区|r
.accept 12326 >>接任务: |cRXP_LOOT_蒸汽坦克行动|r
.target Duke August Foehammer
step
.goto Dragonblight,90.1,52.7
>>击杀|cRXP_ENEMY_克留格·碎誓者|r
>>|cRXP_WARN_这个任务非常困难. 如果需要, 请为他组队. 如果你无法找到队伍或选择单刷, 请跳过此步骤|r
.complete 12438,1 
.mob Kreug Oathbreaker
step
#completewith next
.goto Dragonblight,89.8,46.8,10,0
.goto Dragonblight,89.7,45.6
.vehicle 27587 >>进入一辆|cRXP_FRIENDLY_联盟蒸汽坦克|r
.target Alliance Steam Tank
step
>>|cRXP_WARN_施放|r|T135836:0|t[冰炮] (1)|cRXP_WARN_和|r|T135834:0|t[冰封牢狱] (2)|cRXP_WARN_以击杀|r|cRXP_ENEMY_天灾军团|r
>>|cRXP_WARN_施放|r|T134165:0|t【丢弃侏儒】(3)|cRXP_WARN_当靠近|cRXP_ENEMY_天灾战车|r时可对其发动破坏. 你每次只能破坏一辆|cRXP_ENEMY_天灾战车|r|r
>>|cRXP_WARN_如果|cRXP_FRIENDLY_侏儒|r停止破坏|cRXP_ENEMY_天灾战车|r, 返回|cRXP_FRIENDLY_Foehammer|r并获得一辆新的|cRXP_FRIENDLY_坦克|r|r
.goto Dragonblight,87.25,50.97
.complete 12326,1 
.cast 49109
.timer 15,Plague Wagon Sabotage RP
.mob Plague Wagon
step
#completewith next
.goto Dragonblight,85.60,49.90,20 >>前往暮冬陵园
>>|cRXP_WARN_留在|r|cRXP_FRIENDLY_联盟蒸汽坦克|r
step
.goto Dragonblight,85.60,49.90
>>|cRXP_WARN_施法|r|T135942:0|t[运送士兵] (4) |cRXP_WARN_在暮冬陵园入口处|r
.complete 12326,2 
step
#completewith next
.goto Dragonblight,86.18,50.26,12 >>进入暮冬陵园
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与陵墓内的|cRXP_FRIENDLY_Ambo|r和|cRXP_FRIENDLY_Yord|r交谈
.turnin 12326 >>交任务: |cRXP_FRIENDLY_蒸汽坦克行动|r
.accept 12455 >>接任务: |cRXP_LOOT_随风散落|r
.goto Dragonblight,85.94,50.87
.accept 12462 >>接任务: |cRXP_LOOT_深入陵园|r
.goto Dragonblight,85.86,51.03
.target Ambo Cash
.target Yord "Calamity" Icebeard
step
#completewith next
.goto Dragonblight,86.16,50.18,12 >>离开暮冬陵园
step
.goto Dragonblight,83.3,46.4,70,0
.goto Dragonblight,83.4,51.0,70,0
.goto Dragonblight,89.1,53.0,70,0
.goto Dragonblight,83.4,51.0
>>打开|cRXP_PICK_暮冬军需品箱|r. 搜刮其中的|cRXP_LOOT_暮冬军需品|r
.complete 12455,1 
step
#completewith next
.goto Dragonblight,85.60,49.90,15,0
.goto Dragonblight,86.18,50.26,12 >>进入暮冬陵园
step
.goto Dragonblight,85.94,50.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与阿姆博交谈(|cRXP_FRIENDLY_Ambo|r)
.turnin 12455 >>交任务: |cRXP_FRIENDLY_随风散落|r
.accept 12457 >>接任务: |cRXP_LOOT_重机枪与你|r
.target Ambo Cash
step
.goto Dragonblight,86.24,51.06
#completewith next
.vehicle >>进入 |cRXP_FRIENDLY_Chain Gun|r
step
.goto Dragonblight,86.24,51.06
>>|cRXP_WARN_施放|r|T132351:0|t[呼叫受伤士兵] (2) |cRXP_WARN_让一名 |cRXP_FRIENDLY_受伤的士兵|r跑向安全区域|r
>>|cRXP_WARN_使用|r|T136186:0|t[第七军团机枪] (1) |cRXP_WARN_击杀正在攻击|r|cRXP_FRIENDLY_士兵的|r|cRXP_ENEMY_亡灵|r
.complete 12457,1 
step
>>|cRXP_WARN_退出|r|cRXP_FRIENDLY_链式机枪|r
.goto Dragonblight,85.94,50.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与阿姆博交谈(|cRXP_FRIENDLY_Ambo|r)
.turnin 12457 >>交任务: |cRXP_FRIENDLY_重机枪与你|r
.accept 12463 >>接任务: |cRXP_LOOT_找到普兰比尔德！|r
.target Ambo Cash
step
.goto Dragonblight,85.7,51.7,12,0
>>|cRXP_WARN_继续深入墓穴|r
>>击杀通灵领主霍鲁斯和通灵领主霍鲁斯
>>击杀|cRXP_ENEMY_纳克萨玛斯天灾|r
.complete 12462,2 
.mob +Necrolord X'avius
.goto Dragonblight,84.35,51.01
.complete 12462,1 
.mob +Necrolord Horus
.complete 12462,3 
.goto Dragonblight,86.69,52.91
.mob Tattered Abomination
.mob Scourge Technician
.mob Leprous Servant
.mob Naxxramas Dreadguard
.mob Naxxramas Shade
.mob Dreadbone Construct
.mob Wailing Soul
step
.goto Dragonblight,85.86,51.03
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“灾星”尤尔德·冰须|r交谈
.turnin 12462 >>交任务: |cRXP_FRIENDLY_深入陵园|r
.target Yord "Calamity" Icebeard
step
.goto Dragonblight,84.17,54.68
>>|cRXP_WARN_前往陵墓后方的地下室, 从右后角的小隧道进入|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普兰比尔德|r的尸体对话
.turnin 12463 >>交任务: |cRXP_FRIENDLY_找到普兰比尔德！|r
.accept 12465 >>接任务: |cRXP_LOOT_普兰比尔德的日记|r
.target Plunderbeard
step
.goto Dragonblight,84.0,56.1,20,0
.goto Dragonblight,83.4,55.1,20,0
.goto Dragonblight,82.2,54.0
>>|cRXP_WARN_继续前行, 直到隧道尽头|r
>>击杀|cRXP_ENEMY_恐骨构造体|r和|cRXP_ENEMY_哀嚎的灵魂|r, 击败后搜刮出它们的|cRXP_LOOT_日记书页|r
.complete 12465,1 
.complete 12465,2 
.complete 12465,3 
.complete 12465,4 
.mob Dreadbone Construct
.mob Wailing Soul
step
.goto Dragonblight,80.9,51.9,20,0
.goto Dragonblight,81.55,50.70,20 >>|cRXP_WARN_继续穿过陵墓, 从另一端出口离开|r
.isOnQuest 12465
step
#completewith next
.goto Dragonblight,85.60,49.90,15,0
.goto Dragonblight,86.18,50.26,12 >>进入暮冬陵园
step
.goto Dragonblight,85.94,50.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与陵墓中的|cRXP_FRIENDLY_Ambo|r交谈
.turnin 12465 >>交任务: |cRXP_FRIENDLY_普兰比尔德的日记|r
.accept 12466 >>接任务: |cRXP_LOOT_追击冰雪风暴：第七军团前线|r
.target Ambo Cash
step
#completewith next
.goto Dragonblight,86.16,50.18,12,0
.goto Dragonblight,85.73,49.99,12 >>离开暮冬陵园
step
.goto Dragonblight,87.17,57.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥里克|r交谈
.turnin 12287 >>交任务: |cRXP_FRIENDLY_欧瑞克·图哈特|r
.accept 12290 >>接任务: |cRXP_LOOT_黑暗草|r
.target Orik Trueheart
step
#label chief
#sticky
.goto Dragonblight,90.67,72.89
>>击杀|cRXP_ENEMY_高阶萨满祭司德金·血爪|r
>>|cRXP_WARN_这个任务非常困难. 如果需要, 请为他组队. 如果你无法找到队伍或选择单刷, 请跳过此步骤|r
>>|cRXP_WARN_施放|r|T136075:0|t[净化]|cRXP_WARN_当目标拥有嗜血时|r << Shaman
>>|cRXP_WARN_施放|r |T135894:0|t[驱散魔法] |cRXP_WARN_当目标拥有嗜血时|r << Priest
.complete 12441,1 
.mob High Shaman Bloodpaw
step
.goto Dragonblight,89.2,65.4,70,0
.goto Dragonblight,90.2,74.6,70,0
.goto Dragonblight,89.28,65.60,70,0
.goto Dragonblight,90.22,72.24
>>拾取地面上的|cRXP_LOOT_黑暗草|r
.complete 12290,1 
step
#requires chief
.goto Dragonblight,87.17,57.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥里克|r交谈
.turnin 12290 >>交任务: |cRXP_FRIENDLY_黑暗草|r
.accept 12291 >>接任务: |cRXP_LOOT_被遗忘的故事|r
.target Orik Trueheart
step
#completewith next
.goto Dragonblight,87.1,67.3,100 >>前往遗忘海岸
step
>>|cRXP_WARN_使用|r|T134711:0|t[黑暗草药剂] |cRXP_WARN_在遗忘海岸|r
.use 37570 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_被遗忘的农夫|r和|cRXP_FRIENDLY_被遗忘的火枪手|r和|cRXP_FRIENDLY_被遗忘的骑士|r和|cRXP_FRIENDLY_被遗忘的步兵|r
.complete 12291,1 
.goto Dragonblight,87.1,67.3
.complete 12291,2 
.goto Dragonblight,86.2,67.5
.complete 12291,3 
.goto Dragonblight,86.6,68.6,50,0
.goto Dragonblight,85.1,69.7
.complete 12291,4 
.goto Dragonblight,85.2,68.5
.skipgossip
.target Forgotten Peasant
.target Forgotten Rifleman
.target Forgotten Knight
.target Forgotten Footman
step
.goto Dragonblight,87.17,57.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥里克|r交谈
.turnin 12291 >>交任务: |cRXP_FRIENDLY_被遗忘的故事|r
.accept 12301 >>接任务: |cRXP_LOOT_真相会让我们解脱|r
.target Orik Trueheart
step
#completewith next
.goto Dragonblight,86.80,66.19,100 >>前往遗忘海岸
step
.goto Dragonblight,86.80,66.19
.use 37577 >>|cRXP_WARN_使用|r|T134334:0|t[欧瑞克的水晶球]|cRXP_WARN_当站在蓝色的|cRXP_PICK_被遗忘废墟|r旁边时|r
>>|cRXP_WARN_等待RP结束|r
.cast 48866
.timer 129,The Truth Shall Set Us Free RP
.complete 12301,1 
step
.goto Dragonblight,87.17,57.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥里克|r交谈
.turnin 12301 >>交任务: |cRXP_FRIENDLY_真相会让我们解脱|r
.accept 12305 >>接任务: |cRXP_LOOT_离别的思绪|r
.target Orik Trueheart
step << Shaman
#completewith next
.hs >>传送至暮冬城
.cooldown item,6948,>2
step << !Shaman
#completewith next
.goto Dragonblight,79.15,47.17,100 >>前往暮冬城
step
.goto Dragonblight,79.15,47.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幻象师瑟里格|r交谈
.turnin 12305 >>交任务: |cRXP_FRIENDLY_离别的思绪|r
.accept 12475 >>接任务: |cRXP_LOOT_隐藏的秘密|r
.target Zelig the Visionary
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Halford|r和|cRXP_FRIENDLY_Windstryke|r交谈
.accept 12477 >>接任务: |cRXP_LOOT_救赎之路|r
.goto Dragonblight,78.58,48.20
.accept 12476 >>接任务: |cRXP_LOOT_血色十字军归来？|r
.goto Dragonblight,78.64,48.18
.target High Commander Halford Wyrmbane
.target Commander Lynore Windstryke
step
#completewith Iustus
.goto Dragonblight,84.7,37.1,0,0
>>击杀|cRXP_ENEMY_先锋军士兵|r和|cRXP_ENEMY_先锋军斥候|r和|cRXP_ENEMY_先锋军石工|r. 击败他们后搜刮出|cRXP_LOOT_救赎之路|r
.complete 12476,1 
.complete 12477,1 
.mob Onslaught Infantry
.mob Onslaught Scout
.mob Onslaught Mason
.mob Onslaught Commander Iustus
.mob Scarlet Highlord Daion
step
.goto Dragonblight,87.57,38.13
>>拾取桌子上的|cRXP_PICK_先锋军地图|r
.complete 12475,1 
step
#label Iustus
.goto Dragonblight,87.4,38.1
>>|cRXP_WARN_沿着塔楼向上攀爬|r
>>击杀|cRXP_ENEMY_Commander Iustus|r
>>|cRXP_WARN_这个任务非常困难. 如果需要, 请为他组队. 如果你无法找到队伍或选择单刷, 请跳过此步骤|r
.complete 12442,1 
.mob Onslaught Commander Iustus
step
#label scarlet
.goto Dragonblight,87.39,35.30,70,0
.goto Dragonblight,84.58,37.12,70,0
.goto Dragonblight,84.21,40.99,70,0
.goto Dragonblight,86.37,40.31,70,0
.goto Dragonblight,87.85,40.92
>>击杀|cRXP_ENEMY_先锋军士兵|r和|cRXP_ENEMY_先锋军斥候|r和|cRXP_ENEMY_先锋军石工|r. 击败他们后搜刮出|cRXP_LOOT_救赎之路|r
.complete 12476,1 
.complete 12477,1 
.mob Onslaught Infantry
.mob Onslaught Scout
.mob Onslaught Mason
.mob Onslaught Commander Iustus
.mob Scarlet Highlord Daion
step << Shaman
#completewith next
.hs >>传送至暮冬城
.cooldown item,6948,>2
step << !Shaman
#requires scarlet
#completewith next
.goto Dragonblight,79.15,47.17,100 >>前往暮冬城
step
.goto Dragonblight,79.15,47.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与暮冬城中的|cRXP_FRIENDLY_Zelig|r交谈
.turnin 12475 >>交任务: |cRXP_FRIENDLY_隐藏的秘密|r
.accept 12478 >>接任务: |cRXP_LOOT_霜之哀伤洞穴|r
.target Zelig the Visionary
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Halford|r和|cRXP_FRIENDLY_Windstryke|r交谈
.turnin 12477 >>交任务: |cRXP_FRIENDLY_救赎之路|r
.goto Dragonblight,78.58,48.20
.turnin 12476 >>交任务: |cRXP_FRIENDLY_血色十字军归来？|r
.goto Dragonblight,78.64,48.18
.target High Commander Halford Wyrmbane
.target Commander Lynore Windstryke
step
.goto Dragonblight,77.80,50.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽尔迪格公爵|r交谈
.turnin 12438 >>交任务: |cRXP_FRIENDLY_悬赏：克留格·碎誓者|r
.turnin 12441 >>交任务: |cRXP_FRIENDLY_通缉：高阶萨满祭司德金·血爪|r
.turnin 12442 >>交任务: |cRXP_FRIENDLY_悬赏：先锋军指挥官尤斯图斯|r
.isQuestComplete 12438
.isQuestComplete 12441
.isQuestComplete 12442
.target Highlord Leoric Von Zeldig
step
.goto Dragonblight,77.80,50.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽尔迪格公爵|r交谈
.turnin 12438 >>交任务: |cRXP_FRIENDLY_悬赏：克留格·碎誓者|r
.turnin 12441 >>交任务: |cRXP_FRIENDLY_通缉：高阶萨满祭司德金·血爪|r
.isQuestComplete 12438
.isQuestComplete 12441
.target Highlord Leoric Von Zeldig
step
.goto Dragonblight,77.80,50.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽尔迪格公爵|r交谈
.turnin 12438 >>交任务: |cRXP_FRIENDLY_悬赏：克留格·碎誓者|r
.turnin 12442 >>交任务: |cRXP_FRIENDLY_悬赏：先锋军指挥官尤斯图斯|r
.isQuestComplete 12438
.isQuestComplete 12442
.target Highlord Leoric Von Zeldig
step
.goto Dragonblight,77.80,50.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽尔迪格公爵|r交谈
.turnin 12441 >>交任务: |cRXP_FRIENDLY_通缉：高阶萨满祭司德金·血爪|r
.turnin 12442 >>交任务: |cRXP_FRIENDLY_悬赏：先锋军指挥官尤斯图斯|r
.isQuestComplete 12441
.isQuestComplete 12442
.target Highlord Leoric Von Zeldig
step
.goto Dragonblight,77.80,50.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽尔迪格公爵|r交谈
.turnin 12438 >>交任务: |cRXP_FRIENDLY_悬赏：克留格·碎誓者|r
.isQuestComplete 12438
.target Highlord Leoric Von Zeldig
step
.goto Dragonblight,77.80,50.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽尔迪格公爵|r交谈
.turnin 12441 >>交任务: |cRXP_FRIENDLY_通缉：高阶萨满祭司德金·血爪|r
.isQuestComplete 12441
.target Highlord Leoric Von Zeldig
step
.goto Dragonblight,77.80,50.34
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽尔迪格公爵|r交谈
.turnin 12442 >>交任务: |cRXP_FRIENDLY_悬赏：先锋军指挥官尤斯图斯|r
.isQuestComplete 12442
.target Highlord Leoric Von Zeldig
step
#completewith Audience
>>放弃你无法完成的精英任务
.abandon 12438 >>悬赏：克留格·碎誓者
.abandon 12441 >>通缉：高阶萨满祭司德金·血爪
.abandon 12442 >>通缉：猛攻指挥官尤斯图斯
step
#completewith Audience
.goto Dragonblight,74.8,51.6,50,0
.goto Dragonblight,60.36,51.59,100 >>Travel to Wyrmrest Temple
step
.goto Dragonblight,60.32,51.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奈瑟斯塔兹|r交谈
.fp Wyrmrest >>获取龙眠神殿飞行路径
.target Nethestrasz
step
#label Audience
.goto Dragonblight,57.91,54.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔里奥斯塔兹|r交谈
.turnin 12119 >>交任务: |cRXP_FRIENDLY_拜见巨龙女王|r
.accept 12766 >>接任务: |cRXP_LOOT_与你们的大使相谈|r
.target Tariolstrasz
step
#completewith next
.goto Dragonblight,57.91,54.17
.gossipoption 93560 >>与|cRXP_FRIENDLY_塔里奥斯塔兹|r交谈, 以飞往龙眠神殿顶端
.timer 19,Flight to top of Wyrmrest Temple
.skill coldweatherflying,1,1
.target Tariolstrasz
step
>>|cRXP_WARN_龙眠神殿之巅|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊萨里奥斯|r和|cRXP_FRIENDLY_克罗米|r和|cRXP_FRIENDLY_纳莉丝|r交谈
.accept 12458 >>接任务: |cRXP_LOOT_鞭笞者的种子|r
.goto Dragonblight,59.60,54.47
.accept 12470 >>接任务: |cRXP_LOOT_永恒之龙的秘密|r
.goto Dragonblight,60.00,54.51
.accept 12447 >>接任务: |cRXP_LOOT_黑曜石巨龙圣地|r
.goto Dragonblight,60.07,54.20
.target Nalice
.target Chromie
.target Lord Itharius
step
#completewith next
.goto Dragonblight,59.51,53.33
.gossipoption 93074 >>与 |cRXP_FRIENDLY_托拉斯塔萨|r交谈, 前往龙眠神殿底部飞行
.timer 19,Flight to bottom of Wyrmrest Temple
.skill coldweatherflying,1,1
.target Torastrasza
step
#completewith next
.groundgoto Dragonblight,69.87,45.71,30,0
.goto Dragonblight,71.1,39.5,100 >>前往青铜巨龙圣地
step
.goto Dragonblight,71.1,39.5
>>|cRXP_WARN_使用|r|T133018:0|t[永恒沙漏]|cRXP_WARN_. 保护它免受即将到来的浪潮攻击|r
.cast 49890
.timer 175,Hourglass of Eternity
.complete 12470,1 
.use 37923
.mob Infinite Assailant
.mob Infinite Destroyer
.mob Infinite Chrono-Magus
step
#completewith next
.goto Dragonblight,64.74,27.93,100 >>前往第七军团前线
step
.goto Dragonblight,64.74,27.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Tyralion|r交谈
.turnin 12466 >>交任务: |cRXP_FRIENDLY_追击冰雪风暴：第七军团前线|r
.accept 12467 >>接任务: |cRXP_LOOT_追击冰雪风暴：塞尔赞的护命匣|r
.target Legion Commander Tyralion
step
.goto Dragonblight,64.61,27.45
.gossipoption 93435 >>与|cRXP_FRIENDLY_“龙饵”|r交谈, 以引诱|cRXP_ENEMY_冰雪风暴|r降落
.skipgossip
.timer 45,Chasing Icestorm: Thel'zan's Phylactery RP
.isOnQuest 12467
.target "Wyrmbait"
step
#label Pest
.goto Dragonblight,64.60,27.46,8,0
.goto Dragonblight,64.47,26.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜埃尼|r交谈
.accept 12142 >>接任务: |cRXP_LOOT_害虫控制|r
.target Duane
step
.goto Dragonblight,63.8,27.5
>>|cRXP_WARN_等待|cRXP_ENEMY_冰雪风暴|r被鱼叉命中|r
>>击杀|cRXP_ENEMY_冰雪风暴|r. 拾取掉落在地上的|cRXP_LOOT_亡灵法器|r
.complete 12467,1 
.mob Icestorm
step
#requires Pest
.goto Dragonblight,70.20,32.71,0
.goto Dragonblight,70.20,32.71,60,0
.goto Dragonblight,65.30,42.60,60,0
.goto Dragonblight,70.20,32.71,60,0
.goto Dragonblight,65.30,42.60
>>击杀|cRXP_ENEMY_Snowplain 冰原狂战士|r和|cRXP_ENEMY_Snowplain 冰原徒工|r和|cRXP_ENEMY_Snowplain 冰原萨满祭司|r
>>击杀|cRXP_ENEMY_猛犸人族长|r和|cRXP_ENEMY_猛犸人幼体|r和|cRXP_ENEMY_猛犸人突击者|r
.complete 12142,1 
.complete 12142,2 
.mob Snowplain Zealot
.mob Snowplain Shaman
.mob Snowplain Disciple
.mob Magnataur Patriarch
.mob Magnataur Youngling
.mob Magnataur Alpha
step
#completewith next
.goto Dragonblight,64.74,27.93,100 >>前往第七军团前线
step
.goto Dragonblight,64.47,26.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜埃尼|r交谈
.turnin 12142 >>交任务: |cRXP_FRIENDLY_害虫控制|r
.accept 12143 >>接任务: |cRXP_LOOT_峡谷追击|r
.target Duane
step
#label Chilltusk
.goto Dragonblight,72.0,27.5,60,0
.goto Dragonblight,72.41,28.86
>>击杀|cRXP_ENEMY_寒齿|r. 击败他后搜刮出他的 |T134229:0|t[|cRXP_LOOT_精美的战斗号角|r]
>>|cRXP_WARN_使用 |T134229:0|t[|cRXP_LOOT_精美的战斗号角|r] 开始任务|r
>>|cRXP_ENEMY_寒齿|r|cRXP_WARN_峡谷内的巡逻|r
.complete 12143,1 
.collect 36855,1,12146
.accept 12146 >>接任务: |cRXP_LOOT_奇怪的符号|r
.use 36855
.unitscan Chilltusk
step
.goto Dragonblight,71.1,39.5
>>前往青铜巨龙圣地
>>|cRXP_WARN_使用|r|T133018:0|t[永恒沙漏]|cRXP_WARN_. 保护它免受即将到来的浪潮攻击|r
.cast 49890
.timer 175,Hourglass of Eternity
.complete 12470,1 
.use 37923
.mob Infinite Assailant
.mob Infinite Destroyer
.mob Infinite Chrono-Magus
step
#completewith next
.goto Dragonblight,74.3,23.6,60 >>前往霜之哀伤洞穴
step
.goto Dragonblight,74.3,23.6,50,0
.goto Dragonblight,75.08,20.21
.use 37933 >>|cRXP_WARN_使用|r|T134334:0|t[泽利格的占卜宝珠]|cRXP_WARN_在|r|cRXP_PICK_霜之哀伤祭坛|r
>>|cRXP_WARN_等待RP结束|r
.cast 49817
.timer 110,Frostmourne Cavern RP
.complete 12478,1 
step << Druid wotlk
#completewith DruidTrain2
.cast 18960 >>传送术:月光林地
.zoneskip Moonglade
.xp <72,1
step << Druid wotlk
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48464 >>训练你的职业法术
.xp <72,1
.target Loganaar
step << Druid wotlk
#label DruidTrain2
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 53307 >>训练你的职业法术
.xp <74,1
.target Loganaar
step << DK wotlk
#completewith DKTrain2
.cast 50977 >>施放死亡之门
.zoneskip Eastern Plaguelands
.xp <72,1
step << DK wotlk
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49940 >>训练你的职业法术
.xp <72,1
.target Amal'thazad
step << DK wotlk
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49904 >>训练你的职业法术
.xp <73,1
.target Amal'thazad
step << DK wotlk
#label DKTrain2
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49929 >>训练你的职业法术
.xp <74,1
.target Amal'thazad
step << Mage wotlk
#completewith MageTrain2
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
.xp <72,1
step << Mage wotlk
.goto Stormwind City,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42930 >>训练你的职业法术
.xp <72,1
.target Elsharin
.target Jennea Cannon
step << Mage wotlk
.goto Stormwind City,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 43019 >>训练你的职业法术
.xp <73,1
.target Elsharin
.target Jennea Cannon
step << Mage wotlk
#label MageTrain2
.goto Stormwind City,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42939 >>训练你的职业法术
.xp <74,1
.target Elsharin
.target Jennea Cannon
step
#completewith next
.hs >>传送至暮冬城
step
.goto Dragonblight,78.55,48.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与半兽人|cRXP_FRIENDLY_Halford|r交谈
.turnin 12467 >>交任务: |cRXP_FRIENDLY_追击冰雪风暴：塞尔赞的护命匣|r
.accept 12472 >>接任务: |cRXP_LOOT_终结|r
.target High Commander Halford Wyrmbane
step
.goto Dragonblight,79.15,47.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_幻象师瑟里格|r交谈
.turnin 12478 >>交任务: |cRXP_FRIENDLY_霜之哀伤洞穴|r
.target Zelig the Visionary
step
#completewith next
.goto Dragonblight,81.9,50.7,20 >>进入暮冬陵园
step
.goto Dragonblight,81.19,50.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与陵墓内的|cRXP_FRIENDLY_Yorik|r交谈
.turnin 12472 >>交任务: |cRXP_FRIENDLY_终结|r
.accept 12473 >>接任务: |cRXP_LOOT_结束和开始|r
.timer 115,Thel'zan Summon RP
.target Legion Commander Yorik
step
.goto Dragonblight,80.98,50.63
>>|cRXP_WARN_等待RP结束|r
>>击杀|cRXP_ENEMY_暮光使者泰尔扎恩|r
>>|cRXP_ENEMY_暮色之剑塞尔赞|r |cRXP_WARN_伤害极高, 请让 |cRXP_FRIENDLY_第七军团|r的坦克拉住他|r
.complete 12473,1 
.mob Thel'zan the Duskbringer
step
#completewith next
.goto Dragonblight,82.06,50.73,20 >>离开暮冬陵园
step
.goto Dragonblight,78.58,48.23
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与半兽人|cRXP_FRIENDLY_Halford|r交谈
.turnin 12473 >>交任务: |cRXP_FRIENDLY_结束和开始|r
.accept 12474 >>接任务: |cRXP_LOOT_前往弗塔根要塞！|r
.target High Commander Halford Wyrmbane
step
#completewith DWard
.goto Dragonblight,77.01,49.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗尼·威尔斯|r交谈
.fly Wyrmrest >>飞往龙眠神殿
.skill coldweatherflying,1,1
.skill riding,300,1
.target Rodney Wells
step
#completewith next
.goto Dragonblight,59.80,54.24,200 >>Travel to Wyrmrest Temple
step
#completewith DWard
.goto Dragonblight,59.80,54.24
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德米斯塔兹|r交谈
>>|cRXP_FRIENDLY_德米斯塔兹|r|cRXP_WARN_位于神殿的底层|r
.home >>将你的炉石设置为龙眠神殿
.target Demestrasz
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Lauriel|r和|cRXP_FRIENDLY_奥拉斯塔萨|r交谈
>>|cRXP_FRIENDLY_劳里尔|r|cRXP_WARN_和|cRXP_FRIENDLY_奥拉斯塔萨|r位于神殿的底层|r
.turnin 12766 >>交任务: |cRXP_FRIENDLY_与你们的大使相谈|r
.accept 12460 >>接任务: |cRXP_LOOT_前往红玉巨龙圣地|r
.goto Dragonblight,60.00,55.09
.turnin 12146 >>交任务: |cRXP_FRIENDLY_奇怪的符号|r
.accept 12148 >>接任务: |cRXP_LOOT_独一无二|r
.goto Dragonblight,60.02,55.20
.target Lauriel Trueblade
.target Aurastrasza
step
.goto Dragonblight,53.7,60.0,60,0
.goto Dragonblight,50.8,59.1,60,0
.goto Dragonblight,49.1,57.8,60,0
.goto Dragonblight,53.7,60.0
>>击杀|cRXP_ENEMY_裂骨者|r. 击败后搜刮他的|cRXP_LOOT_Horn|r
>>|cRXP_WARN_当他开始施放[Bone Crack](骨裂)时, 通过走开避开他的|r|T136105:0|t[骨裂]|r
>>|cRXP_ENEMY_裂骨者|r|cRXP_WARN_巡逻略有异常|r
.complete 12148,1 
.unitscan Bonesunder
step
#completewith next
.goto Dragonblight,52.21,50.04,60 >>前往|cRXP_FRIENDLY_塞雷斯塔兹|r
step
.goto Dragonblight,52.21,50.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞雷斯塔兹|r交谈
.turnin 12460 >>交任务: |cRXP_FRIENDLY_前往红玉巨龙圣地|r
.accept 12416 >>接任务: |cRXP_LOOT_白热化的战斗|r
.target Ceristrasz
step
.goto Dragonblight,50.34,52.20,-1
.goto Dragonblight,52.34,46.66,-1
>>击杀|cRXP_ENEMY_进攻的冰冷食尸鬼|r和|cRXP_ENEMY_进攻的冰冷恶鬼|r和一只|cRXP_ENEMY_进攻的冰冷憎恶|r
>>|cRXP_WARN_怪物会一波接一波地出现, 它们可能在任务NPC的南边或北边刷新, 请留意聊天信息|r
>>|cRXP_FRIENDLY_伊斯坎达尔上尉|r|cRXP_WARN_将告知敌人来袭的方向. 如果你迷路了, 可以跟着他走|r
.complete 12416,1 
.complete 12416,2 
.complete 12416,3 
.mob Frigid Ghoul Attacker
.mob Frigid Geist Attacker
.mob Frigid Abomination Attacker
.target Captain Iskandar
step
.goto Dragonblight,52.21,50.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞雷斯塔兹|r交谈
.turnin 12416 >>交任务: |cRXP_FRIENDLY_白热化的战斗|r
.accept 12417 >>接任务: |cRXP_LOOT_重归尘土|r
.target Ceristrasz
step
.goto Dragonblight,48.7,48.9,60,0
.goto Dragonblight,47.5,47.6,60,0
.goto Dragonblight,49.2,45.0,80,0
.goto Dragonblight,45.5,47.2,80,0
.goto Dragonblight,46.1,52.6,80,0
.goto Dragonblight,49.3,49.7
>>在地面上拾取 |T133944:0|t[|cRXP_LOOT_红玉橡果|r]. |cRXP_WARN_它们看起来像小块红色水晶|r
.use 37727 >>|cRXP_WARN_使用|r|T133944:0|t[|cRXP_LOOT_红玉橡果|r] |cRXP_WARN_在|r|cRXP_FRIENDLY_红玉看守者|c的尸体上|r
.collect 37727,6,12417,1,-1 
.complete 12417,1 
.target Ruby Keeper
step
.goto Dragonblight,52.21,50.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞雷斯塔兹|r交谈
.turnin 12417 >>交任务: |cRXP_FRIENDLY_重归尘土|r
.accept 12418 >>接任务: |cRXP_LOOT_烈焰之地|r
.target Ceristrasz
step
#completewith next
.goto Dragonblight,48.2,50.2,0
.goto Dragonblight,48.4,48.2,0
.goto Dragonblight,47.0,47.5,0
.goto Dragonblight,46.6,49.9,0
>>击杀|cRXP_ENEMY_冰冷通灵师|r
.complete 12418,1 
.mob Frigid Necromancer
step
.goto Dragonblight,47.89,49.64,30,0
.goto Dragonblight,47.64,48.97
>>|cRXP_WARN_进入巨树树干|r
>>击杀 |cRXP_ENEMY_达莉亚|r. 搜刮她的尸体, 获得 |T133302:0|t[|cRXP_LOOT_红玉胸针|r]
>>|cRXP_WARN_使用 |T133302:0|t[|cRXP_LOOT_红玉胸针|r] 开始任务|r
.complete 12418,2 
.collect 37833,1,12419
.accept 12419 >>接任务: |cRXP_LOOT_红玉巨龙圣地的命运|r
.use 37833
.mob Dahlia Suntouch
step
.goto Dragonblight,48.2,50.2,60,0
.goto Dragonblight,48.4,48.2,60,0
.goto Dragonblight,47.0,47.5,60,0
.goto Dragonblight,46.6,49.9
>>击杀|cRXP_ENEMY_冰冷通灵师|r
.complete 12418,1 
.mob Frigid Necromancer
step
.goto Dragonblight,52.21,50.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞雷斯塔兹|r交谈
.turnin 12418 >>交任务: |cRXP_FRIENDLY_烈焰之地|r
.accept 12768 >>接任务: |cRXP_LOOT_龙眠神殿的执事|r
.target Ceristrasz
step
#completewith next
.goto Dragonblight,37.1,31.8,45 >>前往奈萨里奥之喉
step
.goto Dragonblight,35.21,30.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟里纳尔|r交谈
.turnin 12447 >>交任务: |cRXP_FRIENDLY_黑曜石巨龙圣地|r
.accept 12261 >>接任务: |cRXP_LOOT_无路可逃|r
.accept 12262 >>接任务: |cRXP_LOOT_驱逐天灾|r
.target Serinar
step
#completewith next
.goto Dragonblight,37.1,31.8,45 >>离开奈萨里奥之喉
step
#completewith next
.goto Dragonblight,39.13,31.87,0
>>击杀|cRXP_ENEMY_燃烧深渊通灵侍僧|r 和|cRXP_ENEMY_冒烟的骷髅|r
.complete 12262,1 
.complete 12262,2 
.mob Burning Depths Necrolyte
.mob Smoldering Skeleton
step
#label DWard
.goto Dragonblight,41.4,31.9
>>|cRXP_WARN_使用|r|T135824:0|t[毁灭结界]. |cRXP_WARN_保护它, 抵御即将到来的波浪|r
.complete 12261,1 
.cast 48711
.timer 80,Destructive Ward RP
.use 37445
step
.goto Dragonblight,39.52,31.21,70,0
.goto Dragonblight,37.87,33.74,70,0
.goto Dragonblight,40.00,32.18,70,0
.goto Dragonblight,37.16,31.75
>>击杀|cRXP_ENEMY_燃烧深渊通灵侍僧|r 和|cRXP_ENEMY_冒烟的骷髅|r
.complete 12262,1 
.complete 12262,2 
.mob Burning Depths Necrolyte
.mob Smoldering Skeleton
step
#completewith next
.goto Dragonblight,37.1,31.8,45 >>前往奈萨里奥之喉的瑟里纳尔处
step
.goto Dragonblight,35.21,30.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟里纳尔|r交谈
.turnin 12261 >>交任务: |cRXP_FRIENDLY_无路可逃|r
.turnin 12262 >>交任务: |cRXP_FRIENDLY_驱逐天灾|r
.accept 12263 >>接任务: |cRXP_LOOT_敌人的意图|r
.target Serinar
step << wotlk !Gnome/!Female
#completewith next
+|cRXP_WARN_在你刚进入洞穴时, 从|r“|cRXP_WARN_出口路线|r”|cRXP_WARN_一侧跳上去. 每次成功跳跃可节省45秒|r
.link https://www.youtube.com/watch?v=xYKP3ECePVw >>|cRXP_WARN_点击这里|r
step
.goto Dragonblight,34.9,32.0,30,0
.goto Dragonblight,34.2,31.4,30,0
.goto Dragonblight,32.2,31.4,30,0
.goto Dragonblight,31.68,30.96
>>|cRXP_WARN_深入奈萨里奥之喉, 近距离观察|cRXP_ENEMY_腐烂者洛森|r. 请穿越熔岩区域, 而非通过中心地带, 以避开怪物战斗|r
.complete 12263,1 
step
.goto Dragonblight,35.21,30.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟里纳尔|r交谈
.turnin 12263 >>交任务: |cRXP_FRIENDLY_敌人的意图|r
.accept 12264 >>接任务: |cRXP_LOOT_扫荡诅咒教派|r
.accept 12265 >>接任务: |cRXP_LOOT_污染的能量|r
.target Serinar
step << wotlk !Gnome/!Female
#completewith next
+|cRXP_WARN_在你刚进入洞穴时, 从|r“|cRXP_WARN_出口路线|r”|cRXP_WARN_一侧跳上去. 每次成功跳跃可节省45秒|r
.link https://www.youtube.com/watch?v=xYKP3ECePVw >>|cRXP_WARN_点击这里|r
step
.goto Dragonblight,32.8,30.5,50,0
.goto Dragonblight,33.7,28.7,50,0
.goto Dragonblight,31.9,28.1,50,0
.goto Dragonblight,30.7,29.0,50,0
.goto Dragonblight,31.8,30.6,50,0
.goto Dragonblight,34.1,26.2
>>击杀|cRXP_ENEMY_燃烧深渊通灵师|r和|cRXP_ENEMY_冒烟的构造体|r和|cRXP_ENEMY_冒烟的恶鬼|r
>>点击地面上的|cRXP_PICK_通灵符文|r
.complete 12264,1 
.complete 12264,2 
.complete 12264,3 
.complete 12265,1 
.mob Burning Depths Necromancer
.mob Smoldering Construct
.mob Smoldering Geist
step
.goto Dragonblight,35.21,30.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟里纳尔|r交谈
.turnin 12264 >>交任务: |cRXP_FRIENDLY_扫荡诅咒教派|r
.turnin 12265 >>交任务: |cRXP_FRIENDLY_污染的能量|r
.accept 12267 >>接任务: |cRXP_LOOT_奈萨里奥的烈焰|r
.target Serinar
step << wotlk !Gnome/!Female
#completewith next
+|cRXP_WARN_在你刚进入洞穴时, 从|r“|cRXP_WARN_出口路线|r”|cRXP_WARN_一侧跳上去. 每次成功跳跃可节省45秒|r
.link https://www.youtube.com/watch?v=xYKP3ECePVw >>|cRXP_WARN_点击这里|r
step
.goto Dragonblight,34.9,32.0,30,0
.goto Dragonblight,34.2,31.4,30,0
.goto Dragonblight,32.2,31.4,30,0
>>|cRXP_WARN_使用|r|T134807:0|t[奈萨里奥的烈焰] |cRXP_WARN_附近|r|cRXP_ENEMY_腐烂者洛森|r
>>击杀|cRXP_ENEMY_腐烂者洛森|r
.complete 12267,1 
.goto Dragonblight,31.9,31.3
.complete 12267,2 
.goto Dragonblight,31.43,31.01
.use 37539
.mob Rothin the Decaying
step
.goto Dragonblight,35.21,30.04
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟里纳尔|r交谈
.turnin 12267 >>交任务: |cRXP_FRIENDLY_奈萨里奥的烈焰|r
.accept 12266 >>接任务: |cRXP_LOOT_毁灭的故事|r
.target Serinar
step << wotlk
#completewith next
.goto Dragonblight,35.13,31.65
.goto Dragonblight,42.26,29.65,50 >>|cRXP_WARN_跳到手掌最粗的手指上. 退出游戏, 然后重新登录|r
.link https://www.youtube.com/watch?v=0r54ZZ1o0W8 >>|cRXP_WARN_点击这里|r
step
.goto Dragonblight,39.51,25.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德瑞克|r交谈
.fp Fordragon Hold >>获取弗塔根要塞飞行点
.target Derek Rammel
step
.goto Dragonblight,37.81,23.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博瓦尔|r交谈
.turnin 12474 >>交任务: |cRXP_FRIENDLY_前往弗塔根要塞！|r
.accept 12495 >>接任务: |cRXP_LOOT_巨龙女王的指引|r
.target Highlord Bolvar Fordragon
step
#completewith next
.hs >>炉石传送至龙眠神殿
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥拉斯塔萨|r和|cRXP_FRIENDLY_塔里奥斯塔兹|r交谈
>>|cRXP_FRIENDLY_奥拉斯塔萨|r|cRXP_WARN_和|cRXP_FRIENDLY_塔里奥斯塔兹|r位于神殿的地面层|r
.turnin 12148 >>交任务: |cRXP_FRIENDLY_独一无二|r
.accept 12149 >>接任务: |cRXP_LOOT_强大的猛犸人|r
.goto Dragonblight,60.02,55.20
.turnin 12768 >>交任务: |cRXP_FRIENDLY_龙眠神殿的执事|r
.accept 12123 >>接任务: |cRXP_LOOT_通知女王|r
.goto Dragonblight,57.91,54.17
.target Aurastrasza
.target Tariolstrasz
step
#completewith next
.goto Dragonblight,57.91,54.17
.gossipoption 93560 >>与|cRXP_FRIENDLY_塔里奥斯塔兹|r交谈, 以飞往龙眠神殿顶端
.timer 19,Flight to top of Wyrmrest Temple
.skill coldweatherflying,1,1
.target Tariolstrasz
step
>>|cRXP_WARN_龙眠神殿之巅|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳莉丝|cRXP_FRIENDLY_和|r克罗米|cRXP_FRIENDLY_和|r阿莱克丝塔萨|cRXP_FRIENDLY_交谈
.turnin 12266 >>交任务: |cRXP_FRIENDLY_毁灭的故事|r
.goto Dragonblight,60.06,54.18
.turnin 12470 >>交任务: |cRXP_FRIENDLY_永恒之龙的秘密|r

.goto Dragonblight,59.99,54.50
.turnin 12495 >>交任务: |cRXP_FRIENDLY_巨龙女王的指引|r
.accept 12497 >>接任务: |cRXP_LOOT_迦拉克隆与天灾军团|r
.turnin 12123 >>交任务: |cRXP_FRIENDLY_通知女王|r
.accept 12435 >>接任务: |cRXP_LOOT_向德弗雷斯塔兹领主报到|r
.goto Dragonblight,59.83,54.66
.turnin 12419 >>交任务: |cRXP_FRIENDLY_红玉巨龙圣地的命运|r
.goto Dragonblight,59.79,54.70
.target Nalice
.target Chromie
.target Alexstrasza the Life-Binder
step
.goto Dragonblight,59.51,53.33
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与龙眠神殿顶端的|cRXP_FRIENDLY_托拉斯塔萨|r交谈
.turnin 12497 >>交任务: |cRXP_FRIENDLY_迦拉克隆与天灾军团|r
.accept 12498 >>接任务: |cRXP_LOOT_红龙之翼|r
.target Torastrasza
step
#completewith Bloodfeast
+|cRXP_WARN_使用|r|T134124:0|t[巨龙女王的红玉信标]|cRXP_WARN_从当前位置出发, 前往龙骨荒野的中心区域|r
.use 38302
.skill coldweatherflying,1,1
step
#sticky
#label lashers
.goto Dragonblight,64.87,73.49,0,0
>>击杀|cRXP_ENEMY_翡翠鞭笞者|r. 击败他们以获取其|cRXP_LOOT_种子|r
.complete 12458,1 
.mob Emerald Lasher
step
.goto Dragonblight,63.7,76.0,60,0
.goto Dragonblight,62.5,74.5,60,0
.goto Dragonblight,62.8,72.1,60,0
.goto Dragonblight,64.9,72.3,60,0
.goto Dragonblight,64.7,76.4,60,0
.goto Dragonblight,62.8,72.1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护园者尼瑟拉|r交谈
>>|cRXP_FRIENDLY_尼舍拉|r|cRXP_WARN_巡逻道路|r
.accept 12454 >>接任务: |cRXP_LOOT_生命的循环|r
.unitscan Nishera the Garden Keeper
step
.goto Dragonblight,64.4,71.5,70,0
.goto Dragonblight,65.4,75.4,70,0
.goto Dragonblight,62.2,75.4
>>击杀|cRXP_ENEMY_翡翠天爪枭|r
.complete 12454,1 
.mob Emerald Skytalon
step
.goto Dragonblight,63.7,76.0,60,0
.goto Dragonblight,62.5,74.5,60,0
.goto Dragonblight,62.8,72.1,60,0
.goto Dragonblight,64.9,72.3,60,0
.goto Dragonblight,64.7,76.4,60,0
.goto Dragonblight,62.8,72.1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护园者尼瑟拉|r交谈
>>|cRXP_FRIENDLY_尼舍拉|r|cRXP_WARN_巡逻道路|r
.turnin 12454 >>交任务: |cRXP_FRIENDLY_生命的循环|r
.accept 12456 >>接任务: |cRXP_LOOT_奥雷托斯的羽毛|r
.unitscan Nishera the Garden Keeper
step
.goto Dragonblight,64.7,77.0
.use 37881 >>|cRXP_WARN_使用|r|T136087:0|t[天爪枭的绒毛] |cRXP_WARN_击倒 |cRXP_ENEMY_翠羽守护者奥雷托斯|r, 他正栖息在你前方的山丘上|r
>>击杀|cRXP_ENEMY_翠羽守护者奥雷托斯|r. 击败后拾取其掉落的|cRXP_LOOT_羽翎|r
>>|cRXP_WARN_这个任务非常困难. 如有需要, 请组队完成. 如果无法找到队伍或选择单人挑战, 可跳过此步骤|r
.complete 12456,1 
.mob Alystros the Verdant Keeper
step
.goto Dragonblight,63.7,76.0,60,0
.goto Dragonblight,62.5,74.5,60,0
.goto Dragonblight,62.8,72.1,60,0
.goto Dragonblight,64.9,72.3,60,0
.goto Dragonblight,64.7,76.4,60,0
.goto Dragonblight,62.8,72.1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_护园者尼瑟拉|r交谈
>>|cRXP_FRIENDLY_尼舍拉|r|cRXP_WARN_巡逻道路|r
.turnin 12456 >>交任务: |cRXP_FRIENDLY_奥雷托斯的羽毛|r
.unitscan Nishera the Garden Keeper
.isQuestComplete 12456
step
.abandon 12456 >>放弃奥雷托斯的羽毛
step
#requires lashers
#completewith next
.groundgoto Dragonblight,66.42,73.52,30,0
.groundgoto Dragonblight,68.40,67.76,30,0
.goto Dragonblight,65.92,70.48,55 >>离开翡翠巨龙圣地
step
#label Bloodfeast
.goto Dragonblight,65.92,70.48,20,0
.goto Dragonblight,67.40,70.74,20,0
.goto Dragonblight,65.92,70.48
>>击杀|cRXP_ENEMY_食血者|r
.complete 12149,2 
.unitscan Bloodfeast
step
#completewith Abbendis
.vehicle >>|cRXP_WARN_使用|r |T134124:0|t[巨龙女王的红玉信标] |cRXP_WARN_直接飞往阿本迪斯礼拜堂, 避免与|r |cRXP_ENEMY_冲锋队战斗|r
.use 38302
.skill coldweatherflying,1,1
step
#completewith next
.goto Dragonblight,70.90,75.98,35 >>前往新壁炉谷教堂
.skill coldweatherflying,<1,1
step
#label Abbendis
.goto Dragonblight,71.08,77.84
>>击杀|cRXP_ENEMY_阿比迪斯将军|r
>>|cRXP_WARN_这个任务非常困难. 如果需要, 请为她组队. 如果你无法组队或独自完成此任务, 请跳过此步骤|r
.complete 12464,1 
.mob High General Abbendis
step
#completewith next
.goto Dragonblight,66.0,51.5,80 >>前往龙骨荒野中央的黎明之镜
.skill coldweatherflying,<1,1
step
.goto Dragonblight,66.0,51.5,70,0
.goto Dragonblight,67.9,50.1,70,0
.goto Dragonblight,69.2,51.4
>>击杀|cRXP_ENEMY_破冰者|r
>>|cRXP_WARN_当他开始施放[脉动碎片]时, 请远离以躲避|r|T135851:0|t|r
>>|cRXP_ENEMY_破冰者|r|cRXP_WARN_在冰封湖面的北侧巡逻|r
.complete 12149,1 
.unitscan Iceshatter
.skill coldweatherflying,<1,1
step
#completewith next
.goto Dragonblight,68.85,72.52,25,0
.goto Dragonblight,69.09,71.68,15,0
.goto Dragonblight,68.70,71.34
.cast 50426 >>通过墙上的缺口离开新壁炉谷
.vehicle >>|cRXP_WARN_直接前往该航点, 然后使用|r|T134124:0|t[巨龙女王的红玉信标]|cRXP_WARN_骑乘|r
.use 38302
.skill coldweatherflying,1,1
step
.goto Dragonblight,66.0,51.5,70,0
.goto Dragonblight,67.9,50.1,70,0
.goto Dragonblight,69.2,51.4
>>|cRXP_WARN_到达|cRXP_ENEMY_破冰者|r后, 从|cRXP_FRIENDLY_龙眠征服者|r上下马|r
>>击杀|cRXP_ENEMY_破冰者|r
>>|cRXP_WARN_当他开始施放[脉动碎片]时, 请远离以躲避|r|T135851:0|t|r
>>|cRXP_ENEMY_破冰者|r|cRXP_WARN_在冰封湖面的北侧巡逻|r
.complete 12149,1 
.unitscan Iceshatter
.skill coldweatherflying,1,1
step
#completewith Shredder
+|cRXP_WARN_从这一点起, 你可以持续使用|r|T134124:0|t[巨龙女王的红玉信标]|cRXP_WARN_飞越龙骨荒野的中心|r
.use 38302
.skill coldweatherflying,1,1
step << skip
.goto Dragonblight,71.1,39.5
>>前往青铜龙神殿. 使用背包中的永恒沙漏, 然后保护它抵御来袭的波次攻击. 目标将在2分55秒后完成
>>由于某种原因, 此任务的机制与前一个不同, 因此你无法像以前那样投机取巧或跳过它
.complete 13343,1 
.use 44450
step
.goto Dragonblight,68.3,43.1,70,0
.goto Dragonblight,67.5,39.5,70,0
.goto Dragonblight,68.6,36.4
>>击杀|cRXP_ENEMY_德拉古尔|r
>>|cRXP_ENEMY_德拉古尔|r|cRXP_WARN_巡逻略有异常|r
.complete 12149,3 
.unitscan Drakegore
step
#completewith next
.hs >>炉石传送至龙眠神殿
.cooldown item,6948,>2
step << skip
>>返回寺庙顶端
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克罗米|r交谈
.turnin 13343 >>交任务: |cRXP_FRIENDLY_永恒之龙的秘密，再来一次|r
.goto Dragonblight,59.99,54.50
.target Chromie
step
.goto Dragonblight,60.02,55.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥拉斯塔萨|r交谈
>>|cRXP_FRIENDLY_奥拉斯塔萨|r|cRXP_WARN_位于神殿的地面层|r
.turnin 12149 >>交任务: |cRXP_FRIENDLY_强大的猛犸人|r
.accept 12150 >>接任务: |cRXP_LOOT_隐居的铭语师|r
.target Aurastrasza
step
.goto Dragonblight,73.27,50.55
>>攻击|cRXP_ENEMY_德雷格玛尔·符印|r. |cRXP_WARN_当生命值降至20%时, 他将投降|r
>>|cRXP_WARN_远离|r|T135826:0|t[爆炸符文]|cRXP_WARN_他放置在你脚下的物品. 它们会在4秒后爆炸, 造成大量火焰伤害|r
>>|cRXP_WARN_这个任务非常困难. 如果需要, 请为他组队. 如果你无法找到队伍或选择单刷, 请跳过此步骤|r
.complete 12150,1 
.mob Dregmar Runebrand
step
#completewith next
.goto Dragonblight,64.47,26.36,100 >>前往第七军团前线
step
.goto Dragonblight,64.47,26.36
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜埃尼|r交谈
.turnin 12143 >>交任务: |cRXP_FRIENDLY_峡谷追击|r
.target Duane
step << skip
#sticky
.goto Dragonblight,58.02,39.16,0,0
>>在龙之荒原寻找一只飞行的冰霜巨龙, 然后使用[自然之怒的种子]对其造成伤害并击杀. 如果你难以拉怪, 可使用[巨龙女王的红玉信标]召唤飞行坐骑
.complete 12459,1 
.use 37887
.use 38302
.isOnQuest 12459
.unitscan Reanimated Frost Wyrm
.mob Weakened Reanimated Frost Wyrm
step << skip
#questguide
.goto Dragonblight,48.44,24.12
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_地面上的地精尸体|r交谈
.accept 12469 >>接任务: |cRXP_LOOT_退回发件人|r
.target Nozzlerust Supply Runner
step
#completewith NozzleP
.goto Dragonblight,54.46,23.60,100 >>前往诺兹拉斯哨站
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔弗|r和|cRXP_FRIENDLY_希弗里克斯|r和|cRXP_FRIENDLY_辛克|r交谈
>>|cRXP_FRIENDLY_纳尔弗|r|cRXP_WARN_巡逻略有变化|r
.accept 12043 >>接任务: |cRXP_LOOT_诺兹拉斯的防御|r
.goto Dragonblight,54.46,23.60
.accept 12045 >>接任务: |cRXP_LOOT_刨冰|r
.goto Dragonblight,54.70,23.25
.turnin 12469 >>交任务: |cRXP_FRIENDLY_退回发件人|r
.accept 12044 >>接任务: |cRXP_LOOT_囤积矿石|r
.goto Dragonblight,55.02,23.42
.isOnQuest 12469
.target Narf
.target Zivlix
.target Xink
step
#label NozzleP
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔弗|r和|cRXP_FRIENDLY_希弗里克斯|r和|cRXP_FRIENDLY_辛克|r交谈
>>|cRXP_FRIENDLY_纳尔弗|r|cRXP_WARN_巡逻略有变化|r
.accept 12043 >>接任务: |cRXP_LOOT_诺兹拉斯的防御|r
.goto Dragonblight,54.46,23.60
.accept 12045 >>接任务: |cRXP_LOOT_刨冰|r
.goto Dragonblight,54.70,23.25
.accept 12044 >>接任务: |cRXP_LOOT_囤积矿石|r
.goto Dragonblight,55.02,23.42
.target Narf
.target Zivlix
.target Xink
step
.goto Dragonblight,53.6,20.3,70,0
.goto Dragonblight,57.3,16.8,70,0
.goto Dragonblight,55.0,18.8,70,0
.goto Dragonblight,47.2,18.6
>>击杀|cRXP_ENEMY_水晶冰雪元素|r. 击败它们以获得其掉落的|cRXP_LOOT_碎裂晶簇|r
.complete 12045,1 
.mob Crystalline Ice Elemental
step
#completewith next
.goto Dragonblight,54.46,31.18,100 >>前往巨龙废土
step
.goto Dragonblight,54.46,31.18
>>|cRXP_WARN_使用|r|T134124:0|t[巨龙女王的红玉信标] |cRXP_WARN_并骑乘|r|cRXP_FRIENDLY_龙眠征服者|r
>>|cRXP_WARN_施放|r|T135808:0|t[吞噬火球] (2)|cRXP_WARN_击杀|r|cRXP_ENEMY_闪电使者西亚斯|r
>>下马后击杀通灵主宰安提沃克. 拾取他掉落于地上的安提沃克的镰刀
.complete 12498,2 
.use 38302
.mob Thiassi the Lightning Bringer
.mob Grand Necrolord Antiok
step
.goto Dragonblight,55.78,34.34
>>|cRXP_WARN_使用|r|T134124:0|t[巨龙女王的红玉信标] |cRXP_WARN_再次骑乘 |cRXP_FRIENDLY_龙眠征服者|r|r
>>|cRXP_WARN_施放|r|T135808:0|t[吞噬火球] (2)|cRXP_WARN_击杀|r|cRXP_ENEMY_废土挖掘者|r
>>|cRXP_WARN_施放|r|T132278:0|t[吞噬食尸鬼] (3) |cRXP_WARN_当处于|r|cRXP_ENEMY_废土挖掘者|r|cRXP_WARN_的近战范围内时, 恢复生命值和法力值|r
.complete 12498,1 
.use 38302
.mob Wastes Scavenger
step
.goto Dragonblight,56.22,27.17,60,0
.goto Dragonblight,59.04,31.16,60,0
.goto Dragonblight,59.26,31.84,60,0
.goto Dragonblight,56.22,27.17,60,0
.goto Dragonblight,59.04,31.16,60,0
.goto Dragonblight,59.26,31.84
>>|cRXP_WARN_下马|r|cRXP_FRIENDLY_龙眠征服者|r
>>击杀一名|cRXP_ENEMY_废土工头|r和|cRXP_ENEMY_废土挖掘者|r
>>掠夺地面上的|cRXP_LOOT_合金矿石|r
.complete 12043,1 
.complete 12043,2 
.complete 12044,1 
.mob Wastes Taskmaster
.mob Wastes Digger
step
#completewith next
.goto Dragonblight,55.0,23.9,100 >>前往诺兹拉斯哨站
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔弗|r和|cRXP_FRIENDLY_希弗里克斯|r和|cRXP_FRIENDLY_辛克|r交谈
>>|cRXP_FRIENDLY_纳尔弗|r|cRXP_WARN_巡逻略有变化|r
.turnin 12043 >>交任务: |cRXP_FRIENDLY_诺兹拉斯的防御|r
.goto Dragonblight,55.0,23.9,20,0
.goto Dragonblight,54.50,23.70
.turnin 12045 >>交任务: |cRXP_FRIENDLY_刨冰|r
.accept 12046 >>接任务: |cRXP_LOOT_柔软的包装|r
.goto Dragonblight,54.70,23.25
.turnin 12044 >>交任务: |cRXP_FRIENDLY_囤积矿石|r
.goto Dragonblight,55.02,23.42
.target Narf
.target Zivlix
.target Xink
step
.goto Dragonblight,53.9,26.2,70,0
.goto Dragonblight,51.1,26.3,70,0
.goto Dragonblight,51.1,24.0,70,0
.goto Dragonblight,53.9,26.2
>>击杀|cRXP_ENEMY_掘洞冰虫|r和|cRXP_ENEMY_龙骨秃鹫|r, 搜刮它们的|cRXP_LOOT_皮毛|r
.complete 12046,1 
.mob Dragonbone Condor
.mob Jormungar Tunneler
step
#completewith next
.goto Dragonblight,54.70,23.25,100 >>前往诺兹拉斯哨站
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希弗里克斯|r和|cRXP_FRIENDLY_辛克|r交谈
.turnin 12046 >>交任务: |cRXP_FRIENDLY_柔软的包装|r
.accept 12047 >>接任务: |cRXP_LOOT_不会融化的东西|r
.goto Dragonblight,54.70,23.25
.accept 12049 >>接任务: |cRXP_LOOT_难以下咽|r
.goto Dragonblight,55.02,23.42
.target Zivlix
.target Xink
step
#sticky
#label bonechunks
.goto Dragonblight,57.3,24.1,70,0
.goto Dragonblight,59.6,26.0,70,0
.goto Dragonblight,60.7,28.1,70,0
.goto Dragonblight,62.9,29.3,70,0
.goto Dragonblight,53.0,25.7,70,0
.goto Dragonblight,51.3,26.5,70,0
.goto Dragonblight,57.3,24.1,70,0
.goto Dragonblight,59.6,26.0,70,0
.goto Dragonblight,60.7,28.1
>>拾取地面上的|cRXP_LOOT_破碎的骨片|r
>>|cRXP_WARN_它们出现在巨龙废土的巨大龙骨附近|r
.complete 12047,1 
step
.goto Dragonblight,58.4,23.2
>>|cRXP_WARN_攻击一个|cRXP_ENEMY_巨大的冰虫|r至80%血量以削弱它. 当成功削弱后, 屏幕上会弹出一条黄色提示：“巨大的冰虫摇摇欲坠……”|r
>>|cRXP_WARN_使用|r|T133715:0|t[高能炸药] |cRXP_WARN_对被削弱的 |cRXP_ENEMY_巨大的冰虫|r进行轰炸, 将其炸毁|r
>>击杀后拾取地面上的|cRXP_LOOT_烧焦的冰虫肉|r
.use 36732
.complete 12049,1 
.mob Hulking Jormungar
step
#requires bonechunks
#completewith next
.goto Dragonblight,54.70,23.25,100 >>前往诺兹拉斯哨站
step
#label Shredder
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希弗里克斯|r和|r|cRXP_FRIENDLY_辛克|r和|r|cRXP_FRIENDLY_纳尔弗|r交谈
>>|cRXP_FRIENDLY_纳尔弗|r|cRXP_WARN_巡逻略有变化|r
.turnin 12047 >>交任务: |cRXP_FRIENDLY_不会融化的东西|r
.goto Dragonblight,54.70,23.25
.turnin 12049 >>交任务: |cRXP_FRIENDLY_难以下咽|r
.accept 12050 >>接任务: |cRXP_LOOT_抢木材|r
.goto Dragonblight,55.02,23.42
.accept 12052 >>接任务: |cRXP_LOOT_该死的鹰身人！|r
.goto Dragonblight,55.0,23.9,20,0
.goto Dragonblight,54.50,23.70
.target Narf
.target Zivlix
.target Xink
step
#label harpies
>>|cRXP_WARN_使用|r|T133015:0|t[Xink的粉碎机控制装置]|cRXP_WARN_来控制|r|cRXP_FRIENDLY_Xink的粉碎机|r
>>|cRXP_WARN_施放|r|T132407:0|t[扭曲之刃] (1)|cRXP_WARN_和|r|T134427:0|t[发射锯刃] (2)|cRXP_WARN_击杀|cRXP_ENEMY_寒风妖精|r和|r|cRXP_ENEMY_冷风女王|r|r
>>|cRXP_WARN_施放|r|T136222:0|t[疾跑] (3)|cRXP_WARN_提高移动速度|r
>>|cRXP_WARN_使用|r|T135769:0|t[紧急修理工具包] (4)|cRXP_WARN_进行治疗|r|cRXP_FRIENDLY_Xink的粉碎机|r
>>|cRXP_WARN_施放|r|T135437:0|t[采集木材] (6) |cRXP_WARN_在 |cRXP_PICK_冷风树木|r以采集|r|cRXP_LOOT_冷风木材|r|r
>>|cRXP_WARN_你也可以在不在|cRXP_FRIENDLY_Xink's Shredder|r 内时击杀|cRXP_ENEMY_Coldwind Harpies|r|r
.complete 12052,1 
.goto Dragonblight,45.8,12.5,70,0
.goto Dragonblight,44.6,7.8,70,0
.goto Dragonblight,46.6,10.5
.complete 12052,2 
.goto Dragonblight,47.3,18.6,70,0
.goto Dragonblight,52.8,19.1
.complete 12050,1 
.goto Dragonblight,47.3,18.6,70,0
.goto Dragonblight,52.8,19.1
.use 36734
.use 38302
.unitscan Mistress of the Coldwind
.mob Coldwind Waste Huntress
.mob Coldwind Witch
step
#completewith StiffN
+|cRXP_WARN_从这一点起, 你可以持续使用|r|T134124:0|t[巨龙女王的红玉信标]|cRXP_WARN_飞越龙骨荒野的中心|r
.use 38302
.skill coldweatherflying,1,1
step
#requires harpies
#completewith next
.goto Dragonblight,55.02,23.42,100 >>前往诺兹拉斯哨站
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛克|r和|cRXP_FRIENDLY_纳尔弗|r交谈
>>|cRXP_FRIENDLY_纳尔弗|r|cRXP_WARN_巡逻略有变化|r
.turnin 12050 >>交任务: |cRXP_FRIENDLY_抢木材|r
.goto Dragonblight,55.02,23.42
.turnin 12052 >>交任务: |cRXP_FRIENDLY_该死的鹰身人！|r
.accept 12112 >>接任务: |cRXP_LOOT_艰难的沟通|r
.goto Dragonblight,55.0,23.9,20,0
.goto Dragonblight,54.50,23.70
.target Narf
.target Xink
step
#completewith next
.goto Dragonblight,59.40,18.19,100 >>前往水晶裂痕
>>|cRXP_WARN_沿峡谷向下前进|r
step
#label StiffN
.goto Dragonblight,59.40,18.19
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佐特|r交谈
.turnin 12112 >>交任务: |cRXP_FRIENDLY_艰难的沟通|r
.accept 12075 >>接任务: |cRXP_LOOT_采集样本|r
.target Zort
step
#completewith next
.goto Dragonblight,59.8,15.5,60,0
.goto Dragonblight,57.3,12.4,60,0
.goto Dragonblight,56.13,11.90,60 >>进入冰心洞穴
step
.goto Dragonblight,56.13,11.90
>>击杀|r|cRXP_FRIENDLY_受伤的晶化冰雪巨人|r|以获得|r|cRXP_LOOT_岩石躯体样本|r
.complete 12075,1 
.target Ravaged Crystalline Ice Giant
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佐特|r交谈
.goto Dragonblight,59.40,18.19
.turnin 12075 >>交任务: |cRXP_FRIENDLY_采集样本|r
.accept 12076 >>接任务: |cRXP_LOOT_恶心的生意|r
.target Zort
step
.goto Dragonblight,58.97,17.82
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ko'char|r交谈
.accept 12079 >>接任务: |cRXP_LOOT_践踏大地|r
.target Ko'char the Unbreakable
step
.goto Dragonblight,60.24,16.51
>>|cRXP_WARN_激怒|cRXP_ENEMY_Ice Heart Jormungar|r. 坦克住它们, 直到你受到其|r|T136007:0|t[腐蚀唾液]|cRXP_WARN_debuff影响|r
>>|cRXP_WARN_获得|r|T136007:0|t[腐蚀唾液]|cRXP_WARN_debuff后, 使用|r|T134436:0|t[佐特的刮刀]|cRXP_WARN_收集它, 重复两次|r
.complete 12076,1 
.use 36775
.mob Ice Heart Jormungar Spawn
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佐特|r交谈, 再与|cRXP_FRIENDLY_Ko'char|r交谈, 最后再次与|cRXP_FRIENDLY_佐特|r交谈
.turnin 12076 >>交任务: |cRXP_FRIENDLY_恶心的生意|r
.accept 12077 >>接任务: |cRXP_LOOT_主动示好|r
.goto Dragonblight,59.40,18.19
.turnin 12077 >>交任务: |cRXP_FRIENDLY_主动示好|r
.accept 12080 >>接任务: |cRXP_LOOT_冰虫之母|r
.goto Dragonblight,58.97,17.82
.accept 12078 >>接任务: |cRXP_LOOT_抓虫子|r
.goto Dragonblight,59.40,18.19
.target Zort
.target Ko'char the Unbreakable
step
#completewith next
.goto Dragonblight,59.8,15.5,60,0
.goto Dragonblight,57.18,12.17,100 >>进入冰心洞穴
step
#completewith next
.goto Dragonblight,53.8,11.4,60,0
.goto Dragonblight,52.7,17.3,60 >>前往洞穴尽头的|cRXP_ENEMY_钻雪虫|r
step
#sticky
#label JormungarCave
.goto Crystalsong Forest,31.97,75.86,0,0
>>击杀 |cRXP_ENEMY_冷心冰虫喂食者|r
>>|cRXP_WARN_使用|r|T132762:0|t[坚固的箱子]|cRXP_WARN_于|r|cRXP_ENEMY_冷心冰虫幼体|r以捕捉它们. |r捕获后, 在地面上拾取|cRXP_LOOT_被抓获的冰虫幼体|r
.complete 12079,1 
.complete 12078,1 
.use 36771
.mob Ice Heart Jormungar Feeder
.mob Ice Heart Jormungar Spawn
step
.goto Dragonblight,50.68,17.79
>>|cRXP_WARN_使用|r|T134873:0|t[佐特的防护药剂]|cRXP_WARN_以保护自己免受|r|T136007:0|t[腐蚀性唾液]伤害
>>击杀|cRXP_ENEMY_钻雪虫|r
>>|cRXP_WARN_这个任务非常困难. 如果需要, 请为他组队. 如果你无法找到队伍或选择单刷, 请跳过此步骤|r
.complete 12080,1 
.mob Rattlebore
.use 36770
step << wotlk
#requires JormungarCave
#completewith next
.goto Dragonblight,49.86,16.61,-1
.goto Dragonblight,46.39,21.56,-1
>>|cRXP_WARN_跳到其中一块|cRXP_PICK_Large Blue Rocks|r上. 退出游戏, 然后重新登录|r
.vehicle >>|cRXP_WARN_再次使用|r|T134124:0|t[巨龙女王的红玉信标] |cRXP_WARN_骑乘 |cRXP_FRIENDLY_龙眠征服者|r, 飞往 |cRXP_FRIENDLY_佐特|r和|r|cRXP_FRIENDLY_科查|r|r
.link https://www.youtube.com/watch?v=oRQQMuodz4A >>|cRXP_WARN_点击这里|r
.use 38302
step
#requires JormungarCave
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_佐特|r和|cRXP_FRIENDLY_Ko'char|r交谈
.turnin 12078 >>交任务: |cRXP_FRIENDLY_抓虫子|r
.goto Dragonblight,59.40,18.19
.turnin 12079 >>交任务: |cRXP_FRIENDLY_践踏大地|r
.turnin -12080 >>交任务: |cRXP_FRIENDLY_冰虫之母|r
.goto Dragonblight,58.97,17.82
.target Zort
.target Ko'char the Unbreakable
step
#sticky
#label RBWorm
.abandon 12080 >>放弃冰虫之母
step << Druid
#completewith DruidTrain3
.cast 18960 >>传送术:月光林地
.zoneskip Moonglade
.xp <74,1
step << Druid
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 53307 >>训练你的职业法术
.xp <74,1
.target Loganaar
step << Druid
#label DruidTrain3
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48440 >>训练你的职业法术
.xp <75,1
.target Loganaar
step << DK
#completewith DKTrain3
.cast 50977 >>施放死亡之门
.zoneskip Eastern Plaguelands
.xp <73,1
step << DK
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49904 >>训练你的职业法术
.xp <73,1
.target Amal'thazad
step << DK
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49929 >>训练你的职业法术
.xp <74,1
.target Amal'thazad
step << DK
#label DKTrain3
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49923 >>训练你的职业法术
.xp <75,1
.target Amal'thazad
step << Druid/DK
#completewith Runemaster
.hs >>炉石传送至龙眠神殿
.cooldown item,6948,>2
step
#completewith Runemaster
.goto Dragonblight,60.02,55.20,100 >>Travel to Wyrmrest Temple
step
#completewith wings
+|cRXP_WARN_从现在起, 你可以使用背包中的|r|T134124:0|t[巨龙女王的红玉信标]|cRXP_WARN_召唤飞行坐骑, 穿越龙骨荒野中央区域|r
.use 38302
.skill coldweatherflying,1,1
step
#label Runemaster
.goto Dragonblight,60.02,55.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥拉斯塔萨|r交谈
>>|cRXP_FRIENDLY_奥拉斯塔萨|r|cRXP_WARN_位于神殿的地面层|r
.turnin 12150 >>交任务: |cRXP_FRIENDLY_隐居的铭语师|r
.accept 12151 >>接任务: |cRXP_LOOT_暴虐的酋长|r
.target Aurastrasza
step
#completewith next
.goto Dragonblight,57.2,76.0,100 >>前往碧蓝巨龙圣地以南
step
#requires RBWorm
.goto Dragonblight,57.2,76.0
>>|cRXP_WARN_使用|r|T134229:0|t[精美战斗号角]|cRXP_WARN_召唤|r|cRXP_ENEMY_雷霆使者格罗姆塔尔|r
>>击杀|r|cRXP_ENEMY_Grom'thar the Thunderbringer|r. 从他身上搜刮其|r|cRXP_LOOT_Head|r
>>|cRXP_WARN_这个任务非常困难. 如果需要, 请为他组队. 如果你无法找到队伍或选择单刷, 请跳过此步骤|r
.complete 12151,1 
.use 36864
.mob Grom'thar the Thunderbringer
step
#completewith next
.goto Dragonblight,60.02,55.20,100 >>Travel to Wyrmrest Temple
step
.goto Dragonblight,60.02,55.20
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥拉斯塔萨|r交谈
>>|cRXP_FRIENDLY_奥拉斯塔萨|r|cRXP_WARN_位于神殿的地面层|r
.turnin 12151 >>交任务: |cRXP_FRIENDLY_暴虐的酋长|r
.target Aurastrasza
step
#label wings
.use 38302 >>|cRXP_WARN_使用|r|T134124:0|t[巨龙女王的红玉信标] |cRXP_WARN_再次骑乘 |cRXP_FRIENDLY_龙眠征服者|r, 飞到龙眠神殿顶端|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿莱克丝塔萨|r和|cRXP_FRIENDLY_伊萨里奥斯|r交谈
.turnin 12498 >>交任务: |cRXP_FRIENDLY_红龙之翼|r
.accept 12499 >>接任务: |cRXP_LOOT_返回安加萨|r
.goto Dragonblight,59.83,54.66
.turnin 12458 >>交任务: |cRXP_FRIENDLY_鞭笞者的种子|r

.goto Dragonblight,59.60,54.46
.target Alexstrasza the Life-Binder
.target Lord Itharius
step
#completewith next
.goto Dragonblight,59.51,53.33
.gossipoption 93073 >>与 |cRXP_FRIENDLY_托拉斯塔萨|r 交谈, 前往神庙的中层
.timer 25,Flight to Devrestrasz
.skill coldweatherflying,1,1
.isOnQuest 12435
.target Torastrasza
step
.goto Dragonblight,59.24,54.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德雷斯特拉兹|r交谈
>>|cRXP_FRIENDLY_德弗雷斯塔斯|r|cRXP_WARN_位于神殿的中层|r
.turnin 12435 >>交任务: |cRXP_FRIENDLY_向德弗雷斯塔兹领主报到|r
.daily 12372 >>接任务: |cRXP_LOOT_保卫龙眠神殿|r
.target Lord Devrestrasz
step
.goto Dragonblight,58.35,55.22,-1
.goto Dragonblight,58.28,53.73,-1
>>|cRXP_WARN_在与龙眠神殿防御者交谈前请先下马|r
.gossipoption 93574 >>骑乘龙眠神殿防御者
>>|cRXP_FRIENDLY_龙眠神殿防御者|r|cRXP_WARN_位于神殿中层|r
.isOnQuest 12372
.target Wyrmrest Defender
step
#completewith next
>>|cRXP_WARN_施放|r|T135789:0|t[ destabilize 碧蓝巨龙圣地 ] (5)|cRXP_WARN_在碧蓝巨龙圣地的靠近地面的|cRXP_PICK_天空中|r|r
.complete 12372,3 
.goto Dragonblight,55.34,66.20
.isOnQuest 12372
step
>>|cRXP_WARN_施放|r|T135812:0|t[烈焰吐息] (1)|cRXP_WARN_和|r|T135817:0|t[献祭] (2)|cRXP_WARN_击杀|cRXP_ENEMY_碧蓝巨龙|r和|r|cRXP_ENEMY_碧蓝幼龙|r|r
>>|cRXP_WARN_施放|r|T135953:0|t[治疗之触] (3)|cRXP_WARN_为你的|r|cRXP_FRIENDLY_龙眠神殿防御者治疗|r|r
>>|cRXP_WARN_施放|r|T135788:0|t[疾速] (4)|cRXP_WARN_冷却中, 移动速度提升|r
>>|cRXP_WARN_确保在怪物死亡时你与其距离不超过100码, 否则将无法获得任务奖励|r
.complete 12372,1 
.goto Dragonblight,55.2,54.3,100,0
.goto Dragonblight,61.4,61.1,100,0
.goto Dragonblight,55.2,66.7
.complete 12372,2 
.goto Dragonblight,55.2,54.3,100,0
.goto Dragonblight,61.4,61.1,100,0
.goto Dragonblight,55.2,66.7
.isOnQuest 12372
.mob Azure Dragon
.mob Azure Drake
.skipgossip
step
>>|cRXP_WARN_施放|r|T135789:0|t[ destabilize 碧蓝巨龙圣地 ] (5)|cRXP_WARN_在碧蓝巨龙圣地的靠近地面的|cRXP_PICK_天空中|r|r
.complete 12372,3 
.goto Dragonblight,55.34,66.20
.isOnQuest 12372
step
>>|cRXP_WARN_施放|r|T135812:0|t[烈焰吐息] (1)|cRXP_WARN_和|r|T135817:0|t[献祭] (2)|cRXP_WARN_击杀|cRXP_ENEMY_碧蓝巨龙|r和|r|cRXP_ENEMY_碧蓝幼龙|r|r
>>|cRXP_WARN_施放|r|T135953:0|t[治疗之触] (3)|cRXP_WARN_为你的|r|cRXP_FRIENDLY_龙眠神殿防御者治疗|r|r
>>|cRXP_WARN_施放|r|T135788:0|t[疾速] (4)|cRXP_WARN_冷却中, 移动速度提升|r
>>|cRXP_WARN_确保在怪物死亡时你与其距离不超过100码, 否则将无法获得任务奖励|r
.complete 12372,1 
.goto Dragonblight,55.2,54.3,100,0
.goto Dragonblight,61.4,61.1,100,0
.goto Dragonblight,55.2,66.7
.complete 12372,2 
.goto Dragonblight,55.2,54.3,100,0
.goto Dragonblight,61.4,61.1,100,0
.goto Dragonblight,55.2,66.7
.isOnQuest 12372
.mob Azure Dragon
.mob Azure Drake
step
#completewith next
.goto Dragonblight,49.15,75.65,100 >>|cRXP_WARN_飞往莫亚基港口的|r|cRXP_FRIENDLY_龙眠神殿防御者|r
>>|cRXP_WARN_施放|r|T135788:0|t[炽热迅捷] (4)|cRXP_WARN_如果可用|r
.isOnQuest 12372
step
.goto Dragonblight,49.15,75.65
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Toalu'u|r交谈
.turnin 12032 >>交任务: |cRXP_FRIENDLY_海洋女神|r
.isQuestComplete 12032
.target Toalu'u the Mystic
step
#completewith next
.goto Dragonblight,48.52,74.39
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Cid|r交谈
.fly Wyrmrest Temple >>飞往龙眠神殿
.target Cid Flounderfix
.skill coldweatherflying,1,1
.skill riding,300,1
step
#completewith DWT
.goto Dragonblight,57.91,54.17
.gossipoption 93559 >>与|cRXP_FRIENDLY_塔里奥斯塔兹|r交谈, 以飞往神庙的中层
.timer 16,Flight to Devrestrasz
.skill coldweatherflying,1,1
.isOnQuest 12372
.target Tariolstrasz
step
#completewith next
.goto Dragonblight,59.24,54.32,200 >>Travel to Wyrmrest Temple
.skill coldweatherflying,<1,1
step
#label DWT
.goto Dragonblight,59.24,54.32
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德雷斯特拉兹|r交谈
>>|cRXP_FRIENDLY_德弗雷斯塔斯|r|cRXP_WARN_位于神殿的中层|r
.turnin 12372 >>交任务: |cRXP_FRIENDLY_保卫龙眠神殿|r
.isOnQuest 12372
.target Lord Devrestrasz
step
#completewith Angrathar
.goto Dragonblight,60.32,51.55
>>|cRXP_WARN_跳到飞行管理员处. 施放|r|T135896:0|t[神圣之盾]|cRXP_WARN_或|r|T135964:0|t[守护之手]|cRXP_WARN_以免因坠落伤害而死亡|r << Paladin
>>|cRXP_WARN_下到飞行管理员那里. 小心别因摔落伤害而死亡|r << !Paladin
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奈瑟斯塔兹|r交谈
.fly Fordragon >>飞往弗塔根要塞
.target Nethestrasz
.skill coldweatherflying,1,1
step
#completewith next
.goto Dragonblight,37.81,23.41,100 >>前往弗塔根要塞
.skill coldweatherflying,<1,1
step
#label Angrathar
.groundgoto Dragonblight,37.0,25.1,30,0
.goto Dragonblight,37.81,23.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_博瓦尔|r交谈
>>|cRXP_WARN_如果你不想观看过场动画, 请准备好按 Esc 键|r
.turnin 12499 >>交任务: |cRXP_FRIENDLY_返回安加萨|r
.target Highlord Bolvar Fordragon
step << !Druid !DK
.goto Dragonblight,38.42,19.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿莱克丝塔萨|r交谈
.accept 13347 >>接任务: |cRXP_LOOT_浴火重生|r
.target Alexstrasza the Life-Binder
step << !Druid !DK
.goto Dragonblight,38.01,19.64
>>拾取地面上的|cRXP_PICK_弗塔根之盾|r
.complete 13347,1 
step << Mage
.goto Dragonblight,37.77,23.43
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r, 远离|cRXP_FRIENDLY_阿莱克丝塔萨|r 会失去 |T237543:0|t[宁静] 增益。传送至暴风城
step << Mage
.goto Stormwind City,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 43019 >>训练你的职业法术
.xp <73,1
.target Elsharin
.target Jennea Cannon
step << Mage
.goto Stormwind City,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42939 >>训练你的职业法术
.xp <74,1
.target Elsharin
.target Jennea Cannon
step << Mage
.goto Stormwind City,49.55,85.81
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42955 >>训练你的职业法术
.xp <75,1
.target Elsharin
.target Jennea Cannon
step << !Druid !DK !Mage
#completewith next
.goto Dragonblight,39.51,25.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德瑞克|r交谈
.fly Valiance Keep >>飞往勇者要塞. 或者支付 |T626001:0|t|cFF3FC7EB法师|r 的传送费用前往暴风城
.zoneskip Stormwind City
.zoneskip Elwynn Forest
.xp >73,1
.skill coldweatherflying,1,1
.target Derek Rammel
step << !DK !Druid !Mage
.goto BoreanTundra,59.70,69.26
.zone Stormwind City >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_暴风城|r, 与|cRXP_FRIENDLY_尼尔诺·铜线|r 交谈
.zoneskip Elwynn Forest
.skipgossip
.xp >73,1
.skill coldweatherflying,1,1
.target Nelno Copperbeam
step << !Druid !DK !Mage
#completewith Modera
.goto Dragonblight,39.51,25.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德瑞克|r交谈
.fly Stars' Rest >>飞往星之憩所. 或者支付 |T626001:0|t|cFF3FC7EB法师|r的费用, 使用传送门前往暴风城
.zoneskip Stormwind City
.zoneskip Elwynn Forest
.zoneskip Dalaran
.xp <74,1
.skill coldweatherflying,1,1
.target Derek Rammel
step << !Druid !DK !Mage
.goto Dragonblight,29.00,55.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderator|r交谈
.accept 12794 >>接任务: |cRXP_LOOT_魔法王国达拉然|r
.zoneskip Elwynn Forest
.zoneskip Stormwind City
.zoneskip Dalaran
.xp <74,1
.skill coldweatherflying,1,1
.target Image of Archmage Modera
step << !DK !Druid !Mage
#label Modera
.goto Dragonblight,29.00,55.45
.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
.zoneskip Stormwind City
.skipgossip
.xp <74,1
.skill coldweatherflying,1,1
.isOnQuest 12794
.target Image of Archmage Modera
step << !DK !Druid !Mage
.abandon 12794 >>放弃魔法王国达拉然. |cRXP_WARN_请勿提交此任务|r
step << !DK !Druid !Mage
.goto Dalaran,40.10,62.78,150 >>前往: |cRXP_PICK_达拉然|r
.zoneskip Stormwind City
.skill coldweatherflying,<1,1
.isOnQuest 13347
step << !DK !Druid !Mage
.goto Dalaran,40.2,56.3,50,0
.goto Dalaran,40.10,62.78
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
.skill coldweatherflying,<1,1
.zoneskip Stormwind City
.isOnQuest 13347
step << !DK !Druid !Mage
.goto Dalaran,40.2,56.3,50,0
.goto Dalaran,40.10,62.78
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
.xp <74,1
.skill coldweatherflying,1,1
.zoneskip Stormwind City
.isOnQuest 13347
step << Shaman
.goto StormwindNew,67.52,89.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Umbrua|r交谈
.train 49237 >>训练你的职业法术
.xp <73,1
.target Farseer Umbrua
step << Shaman
.goto StormwindNew,67.52,89.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Umbrua|r交谈
.train 49270 >>训练你的职业法术
.xp <74,1
.target Farseer Umbrua
step << Shaman
.goto StormwindNew,67.52,89.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Umbrua|r交谈
.train 49280 >>训练你的职业法术
.xp <75,1
.target Farseer Umbrua
step << Warlock
.goto StormwindNew,42.26,81.77,20,0
.goto StormwindNew,40.64,84.94,15,0
.goto StormwindNew,39.88,84.19
>>进入已宰的羔羊酒馆并下楼
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_ 乌苏拉|r和|cRXP_FRIENDLY_ 德米塞特|r或 |cRXP_FRIENDLY_ 山达尔|r交谈
.train 47892 >>训练你的职业法术
.xp <74,1
.target Ursula Deline
.target Demisette Cloyce
.target Sandahl
step << Paladin/Priest
#completewith PaPrTraining1
.goto StormwindNew,52.9,50.9,20 >>进入暴风城大教堂
step << Paladin
.goto StormwindNew,49.8,48.5,20,0
.goto StormwindNew,49.60,49.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arthur|r或|cRXP_FRIENDLY_Katherine|r交谈
.train 48931 >>训练你的职业法术
.xp <73,1
.target Arthur the Faithful
.target Katherine the Pure
step << Paladin
.goto StormwindNew,49.8,48.5,20,0
.goto StormwindNew,49.60,49.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arthur|r或|cRXP_FRIENDLY_Katherine|r交谈
.train 48805 >>训练你的职业法术
.xp <74,1
.target Arthur the Faithful
.target Katherine the Pure
step << Paladin
#label PaPrTraining1
.goto StormwindNew,49.8,48.5,20,0
.goto StormwindNew,49.60,49.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arthur|r或|cRXP_FRIENDLY_Katherine|r交谈
.train 48818 >>训练你的职业法术
.xp <75,1
.target Arthur the Faithful
.target Katherine the Pure
step << Priest
.goto StormwindNew,49.51,45.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
.train 48126 >>训练你的职业法术
.xp <74,1
.target Brother Joshua
step << Priest
#label PaPrTraining1
.goto StormwindNew,49.51,45.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
.train 48124 >>训练你的职业法术
.xp <75,1
.target Brother Joshua
step << Hunter
.goto StormwindNew,67.3,37.1,15,0
.goto StormwindNew,67.35,36.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
.train 49044 >>训练你的职业法术
.xp <73,1
.target Einris Brightspear
step << Hunter
.goto StormwindNew,67.3,37.1,15,0
.goto StormwindNew,67.35,36.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
.train 61846 >>训练你的职业法术
.xp <74,1
.target Einris Brightspear
step << Hunter
.goto StormwindNew,67.3,37.1,15,0
.goto StormwindNew,67.35,36.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
.train 61005 >>训练你的职业法术
.xp <75,1
.target Einris Brightspear
step << Rogue
.goto StormwindNew,77.42,65.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Osborne|r交谈
.train 48667 >>训练你的职业法术
.xp <73,1
.target Osborne the Night Man
step << Warrior
.goto StormwindNew,78.31,63.53,15,0
.goto StormwindNew,81.66,59.50,15,0
.goto StormwindNew,80.56,59.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
.train 47470 >>训练你的职业法术
.xp <73,1
.target Wu Shen
.target Ilsa Corbin
step << Warrior
.goto StormwindNew,78.31,63.53,15,0
.goto StormwindNew,81.66,59.50,15,0
.goto StormwindNew,80.56,59.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
.train 55694 >>训练你的职业法术
.xp <75,1
.target Wu Shen
.target Ilsa Corbin
step << !Druid !DK
#completewith next
.goto StormwindNew,73.69,45.98,20 >>前往: |cRXP_PICK_暴风城|r Keep
step << !Druid !DK
.goto StormwindNew,80.01,38.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Varian|r交谈
.turnin 13347 >>交任务: |cRXP_FRIENDLY_浴火重生|r
.accept 13369 >>接任务: |cRXP_LOOT_造化弄人|r
.target King Varian Wrynn
step << !Druid !DK
#completewith next
.goto StormwindNew,80.06,38.63
.gossipoption 94297 >>与|cRXP_FRIENDLY_Jaina|r交谈. 她将开启通往奥格瑞玛的传送门
.timer 12,Jaina Portal to Orgrimmar
.isOnQuest 13369
.target Lady Jaina Proudmoore
step << !Druid !DK
#completewith next
.goto StormwindNew,80.08,38.90
.zone Orgrimmar >>前往: |cRXP_PICK_奥格瑞玛|r
step << !Druid !DK
.goto Orgrimmar,32.5,37.7
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
.turnin 13369 >>交任务: |cRXP_FRIENDLY_造化弄人|r
.accept 13370 >>接任务: |cRXP_LOOT_政变|r
.target Thrall
step << !Druid !DK
#completewith Varian
.goto Orgrimmar,33.22,37.69
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
step << !Druid !DK
#questguide
.goto StormwindNew,80.01,38.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Varian|r交谈
.turnin 13370 >>交任务: |cRXP_FRIENDLY_政变|r
.accept 13371 >>接任务: |cRXP_LOOT_杀戮时刻|r
.target King Varian Wrynn
step << !Druid !DK
#label Varian
.goto StormwindNew,80.01,38.44
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Varian|r交谈
>>|cRXP_WARN_跳过幽暗城之战的后续任务. 强烈建议跳过, 因为其每小时经验收益极低|r
.turnin 13370 >>交任务: |cRXP_FRIENDLY_政变|r
.target King Varian Wrynn
step << skip
#questguide
#completewith next
.goto Stormwind City,80.5,39.4
.zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
step << skip
#questguide
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提瑞斯法的布罗尔|r交谈
.turnin 13371 >>交任务: |cRXP_FRIENDLY_杀戮时刻|r
.target Broll Bearmantle
step << Shaman
.goto StormwindNew,67.52,89.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Umbrua|r交谈
.train 49237 >>训练你的职业法术
.xp <73,1
.target Farseer Umbrua
step << Shaman
.goto StormwindNew,67.52,89.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Umbrua|r交谈
.train 49270 >>训练你的职业法术
.xp <74,1
.target Farseer Umbrua
step << Shaman
.goto StormwindNew,67.52,89.41
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Umbrua|r交谈
.train 49280 >>训练你的职业法术
.xp <75,1
.target Farseer Umbrua
step << Warlock
.goto StormwindNew,42.26,81.77,20,0
.goto StormwindNew,40.64,84.94,15,0
.goto StormwindNew,39.88,84.19
>>进入已宰的羔羊酒馆并下楼
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_ 乌苏拉|r和|cRXP_FRIENDLY_ 德米塞特|r或 |cRXP_FRIENDLY_ 山达尔|r交谈
.train 47892 >>训练你的职业法术
.xp <74,1
.target Ursula Deline
.target Demisette Cloyce
.target Sandahl
step << Paladin/Priest
#completewith PaPrTraining2
.goto StormwindNew,52.9,50.9,20 >>进入暴风城大教堂
step << Paladin
.goto StormwindNew,49.8,48.5,20,0
.goto StormwindNew,49.60,49.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arthur|r或|cRXP_FRIENDLY_Katherine|r交谈
.train 48931 >>训练你的职业法术
.xp <73,1
.target Arthur the Faithful
.target Katherine the Pure
step << Paladin
.goto StormwindNew,49.8,48.5,20,0
.goto StormwindNew,49.60,49.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arthur|r或|cRXP_FRIENDLY_Katherine|r交谈
.train 48805 >>训练你的职业法术
.xp <74,1
.target Arthur the Faithful
.target Katherine the Pure
step << Paladin
#label PaPrTraining
.goto StormwindNew,49.8,48.5,20,0
.goto StormwindNew,49.60,49.83
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Arthur|r或|cRXP_FRIENDLY_Katherine|r交谈
.train 48818 >>训练你的职业法术
.xp <75,1
.target Arthur the Faithful
.target Katherine the Pure
step << Priest
.goto StormwindNew,49.51,45.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
.train 48126 >>训练你的职业法术
.xp <74,1
.target Brother Joshua
step << Priest
#label PaPrTraining2
.goto StormwindNew,49.51,45.21
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
.train 48124 >>训练你的职业法术
.xp <75,1
.target Brother Joshua
step << Hunter
.goto StormwindNew,67.3,37.1,15,0
.goto StormwindNew,67.35,36.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
.train 49044 >>训练你的职业法术
.xp <73,1
.target Einris Brightspear
step << Hunter
.goto StormwindNew,67.3,37.1,15,0
.goto StormwindNew,67.35,36.25
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
.train 61846 >>训练你的职业法术
.xp <74,1
.target Einris Brightspear
step << Hunter
.goto StormwindNew,67.3,37.1,15,0
.goto StormwindNew,67.35,36.25
.train 61005 >>训练你的职业法术
.xp <75,1
step << Rogue
.goto StormwindNew,77.42,65.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Osborne|r交谈
.train 48667 >>训练你的职业法术
.xp <73,1
.target Osborne the Night Man
step << Warrior
.goto StormwindNew,78.31,63.53,15,0
.goto StormwindNew,81.66,59.50,15,0
.goto StormwindNew,80.56,59.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
.train 47470 >>训练你的职业法术
.xp <73,1
.target Wu Shen
.target Ilsa Corbin
step << Warrior
.goto StormwindNew,78.31,63.53,15,0
.goto StormwindNew,81.66,59.50,15,0
.goto StormwindNew,80.56,59.87
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wu|r或|cRXP_FRIENDLY_Ilsa|r交谈
.train 55694 >>训练你的职业法术
.xp <75,1
.target Wu Shen
.target Ilsa Corbin
step << !DK !Druid
#completewith Hills
.hs >>炉石传送至龙眠神殿
step << !DK !Druid
#completewith Hills
.goto Dragonblight,60.32,51.55
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奈瑟斯塔兹|r交谈
.fly Wintergarde Keep >>飞往暮冬城
.target Nethestrasz
step << DK/Druid
#completewith Hills
.goto Dragonblight,39.51,25.93
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德瑞克|r交谈
.fly Wintergarde Keep >>飞往暮冬城
.target Derek Rammel
step
#label end
.groundgoto Dragonblight,78.2,46.7,40,0
.goto Dragonblight,76.81,47.51
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃利戈尔|r交谈
.turnin 12464 >>交任务: |cRXP_FRIENDLY_我的老对手|r
.target Commander Eligor Dawnbringer
.isQuestComplete 12464
step
.abandon 12464 >>放弃我的老对手
step
.goto Dragonblight,25.61,51.30,0
#loop
.line Dragonblight,87.90,41.21,87.00,42.19,86.45,40.12,85.51,41.24,83.78,41.98,84.14,40.72,84.49,37.06,87.64,35.43,87.90,41.21
.goto Dragonblight,87.90,41.21,50,0
.goto Dragonblight,87.00,42.19,50,0
.goto Dragonblight,86.45,40.12,50,0
.goto Dragonblight,85.51,41.24,50,0
.goto Dragonblight,83.78,41.98,50,0
.goto Dragonblight,84.14,40.72,50,0
.goto Dragonblight,84.49,37.06,50,0
.goto Dragonblight,87.64,35.43,50,0
.goto Dragonblight,87.90,41.21,50,0
.xp 73 >>将 |cRXP_ENEMY_血色冲击|r 升级到 73 级。或者做|cRXP_WARN_长者努尔根|r及其任务
.mob Onslaught Bloodhound
.mob Onslaught Infantry
.mob Onslaught Mason
step
#label Hills
.goto Dragonblight,77.10,50.12
>>|cRXP_WARN_这将带你飞往灰熊丘陵|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Urik|r交谈
.accept 12511 >>接任务: |cRXP_LOOT_丘陵援兵|r
.timer 150,飞往琥珀松木营地
.target Gryphon Commander Urik
step
.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
]])
RXPGuides.RegisterGuide([[
#cata
#mop
#wotlk
#speedrunguide
#xprate >1.49 << wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 73-74 龙骨荒野
#displayname 73-74 龙骨荒野 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 9
#next 74-75 灰熊丘陵
#xprate <1.6 << !wotlk

#include 72-74 龙骨荒野@pt1start-pt1end
step
.goto Dragonblight,29.00,55.45
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Moderator|r交谈
.turnin 12107 >>交任务: |cRXP_FRIENDLY_魔网能量线的终端|r
>>|cRXP_WARN_跳过后续任务|r
.target Image of Archmage Modera
step

#include 72-74 龙骨荒野@pt2start-pt2end
step
.goto Dragonblight,87.17,57.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥里克|r交谈
.turnin 12287 >>交任务: |cRXP_FRIENDLY_欧瑞克·图哈特|r
.accept 12290 >>接任务: |cRXP_LOOT_黑暗草|r
.target Orik Trueheart
step
#label chief
#sticky
.goto Dragonblight,90.67,72.89
>>击杀|cRXP_ENEMY_高阶萨满祭司德金·血爪|r
>>|cRXP_WARN_这个任务非常困难. 如果需要, 请为他组队. 如果你无法找到队伍或选择单刷, 请跳过此步骤|r << wotlk
>>|cRXP_WARN_施放|r|T136075:0|t[净化]|cRXP_WARN_当目标拥有嗜血时|r << Shaman wotlk
>>|cRXP_WARN_施放|r |T135894:0|t[驱散魔法] |cRXP_WARN_当目标拥有嗜血时|r << Priest wotlk
.complete 12441,1 
.mob High Shaman Bloodpaw
step
.goto Dragonblight,89.2,65.4,70,0
.goto Dragonblight,90.2,74.6,70,0
.goto Dragonblight,89.28,65.60,70,0
.goto Dragonblight,90.22,72.24
>>拾取地面上的|cRXP_LOOT_黑暗草|r
.complete 12290,1 
step
#requires chief
.goto Dragonblight,87.17,57.49
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥里克|r交谈
.turnin 12290 >>交任务: |cRXP_FRIENDLY_黑暗草|r
step << !wotlk
.goto Dragonblight,90.1,52.7
>>击杀|cRXP_ENEMY_克留格·碎誓者|r
.complete 12438,1 
.mob Kreug Oathbreaker
step
.goto Dragonblight,87.4,38.1
>>|cRXP_WARN_沿着塔楼向上攀爬|r
>>击杀|cRXP_ENEMY_Commander Iustus|r
>>|cRXP_WARN_这个任务非常困难. 如果需要, 请为他组队. 如果你无法找到队伍或选择单刷, 请跳过此步骤|r << wotlk
.complete 12442,1 
.mob Onslaught Commander Iustus
step
.goto 115/571,-780.500,3772.300
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高级指挥官哈尔弗·维姆班恩|r交谈
.target High Commander Halford Wyrmbane
.turnin 12319 >>交任务: |cRXP_FRIENDLY_血之魔典|r
>>|cRXP_WARN_跳过后续任务|r
step
.goto 115/571,-736.100,3692.600
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_李奥瑞克·冯·泽尔迪格公爵|r交谈
.target Highlord Leoric Von Zeldig
.turnin 12438 >>交任务: |cRXP_FRIENDLY_悬赏：克留格·碎誓者|r << !wotlk
.turnin 12441 >>交任务: |cRXP_FRIENDLY_通缉：高阶萨满祭司德金·血爪|r
.turnin 12442 >>交任务: |cRXP_FRIENDLY_悬赏：先锋军指挥官尤斯图斯|r
step
#optional
.maxlevel 75,GotoSholazar
step
.goto Dragonblight,77.10,50.12
>>|cRXP_WARN_这将带你飞往灰熊丘陵|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Urik|r交谈
.accept 12511 >>接任务: |cRXP_LOOT_丘陵援兵|r
.timer 150,飞往琥珀松木营地
.target Gryphon Commander Urik
step
.zone Grizzly Hills >>前往: |cRXP_PICK_灰熊丘陵|r
step
#label GotoSholazar
#optional
.goto Dragonblight,78.908,45.337
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_不稳定的瓦斯|r交谈
.accept 12794 >>接任务: |cRXP_LOOT_魔法王国达拉然|r
.target Vas the Unstable
.zoneskip Dragonblight,1
.xp <76,1
step
#optional
.goto Dragonblight,78.908,45.337
.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
.skipgossip 27158,1
.target Vas the Unstable
.zoneskip Dragonblight,1
.xp <76,1
]])
RXPGuides.RegisterGuide([[
#cata
#mop
#wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 73-75 灰熊丘陵
#displayname 74-75 灰熊丘陵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 9
#next 75-77 祖达克
#xprate <1.5 << wotlk
#questguide << !wotlk
step
#label pt1start
.goto Grizzly Hills,31.80,59.55
>>进入小屋后, 立即点击左侧的|cRXP_PICK_Basket|r(|cRXP_WARN_不在楼上|r)
.accept 12225 >>接任务: |cRXP_LOOT_美味的琥珀种子！|r
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与小屋内的|cRXP_FRIENDLY_Anderhol|r和|cRXP_FRIENDLY_Dumont|r交谈
.turnin 12225 >>交任务: |cRXP_FRIENDLY_美味的琥珀种子！|r
.accept 12226 >>接任务: |cRXP_LOOT_种子穿肠过……|r
.accept 12212 >>接任务: |cRXP_LOOT_补充食物|r
.accept 12215 >>接任务: |cRXP_LOOT_你死我活！|r
.goto Grizzly Hills,32.10,59.97
.turnin 12511 >>交任务: |cRXP_FRIENDLY_丘陵援兵|r
.accept 12292 >>接任务: |cRXP_LOOT_当地人的支持|r
.goto Grizzly Hills,31.83,60.16
.isOnQuest 12511
.target Master Woodsman Anderhol
.target Lieutenant Dumont
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与小屋内的|cRXP_FRIENDLY_Anderhol|r和|cRXP_FRIENDLY_Dumont|r交谈
.turnin 12225 >>交任务: |cRXP_FRIENDLY_美味的琥珀种子！|r
.accept 12226 >>接任务: |cRXP_LOOT_种子穿肠过……|r
.accept 12212 >>接任务: |cRXP_LOOT_补充食物|r
.accept 12215 >>接任务: |cRXP_LOOT_你死我活！|r
.goto Grizzly Hills,32.10,59.97
.accept 12292 >>接任务: |cRXP_LOOT_当地人的支持|r
.goto Grizzly Hills,31.83,60.16
.target Master Woodsman Anderhol
.target Lieutenant Dumont
step
#completewith Cedar
.goto Grizzly Hills,31.96,60.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennifer|r交谈
.home >>将你的[炉石]设置为琥珀松木营地
>>|cRXP_BUY_如需, 请购买食物或饮水|r
.target Jennifer Bell
step
.goto Grizzly Hills,31.31,59.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦娜|r交谈
.fp Amberpine Lodge >>获取琥珀松木营地的飞行点
.target Vana Grey
step
.goto Grizzly Hills,29.01,55.09,60,0
.goto Grizzly Hills,29.56,59.02
>>在河边掠夺|cRXP_PICK_Plants|r
.complete 12226,1 
step
#pvp
.goto Grizzly Hills,29.91,59.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Carter|r交谈
>>|cRXP_WARN_此任务|r(|cRXP_WARN_并将其保留在任务日志中|r)|cRXP_WARN_会标记你为PVP|r. |cRXP_WARN_如需可跳过|r
.accept 12444 >>接任务: |cRXP_LOOT_黑水伐木场的战斗|r
.target Scout Captain Carter
step
#pvp
.goto Grizzly Hills,28.42,60.96,60,0
.goto Grizzly Hills,27.57,64.80,60,0
.goto Grizzly Hills,27.67,68.24
>>击杀黑河中的|r征服堡掠夺者|r(或|r部落玩家|r)
.complete 12444,1 
.isOnQuest 12444
.mob Conquest Hold Raider
step
#completewith next
>>击杀|cRXP_ENEMY_Stags|r. 搜刮它们的|cRXP_LOOT_Venison|r
.complete 12212,1 
.mob Tallhorn Stag
step
.goto Grizzly Hills,26.05,67.22,60,0
.goto Grizzly Hills,24.70,67.38,60,0
.goto Grizzly Hills,25.19,70.50,60,0
.goto Grizzly Hills,24.01,71.68,60,0
.goto Grizzly Hills,19.95,73.83,60,0
.goto Grizzly Hills,26.05,67.22
>>击杀|cRXP_ENEMY_灰雾捕猎者|r
.complete 12215,1 
.mob Graymist Hunter
step
.goto Grizzly Hills,23.10,71.92,60,0
.goto Grizzly Hills,21.32,73.82,60,0
.goto Grizzly Hills,20.65,71.32,60,0
.goto Grizzly Hills,17.42,71.30,60,0
.goto Grizzly Hills,14.37,69.89,60,0
.goto Grizzly Hills,12.74,72.29,60,0
.goto Grizzly Hills,11.17,69.22,60,0
.goto Grizzly Hills,12.97,65.10,60,0
.goto Grizzly Hills,17.77,66.23,60,0
.goto Grizzly Hills,23.10,71.92
>>击杀|cRXP_ENEMY_Stags|r. 搜刮它们的|cRXP_LOOT_Venison|r
.complete 12212,1 
.mob Tallhorn Stag
step
#label Cedar
.goto Grizzly Hills,15.87,65.27
>>进入有守卫的建筑, 拾取|cRXP_PICK_chest|r
.complete 12292,1 
step
#completewith next
.hs >>传送至琥珀松木营地
.cooldown item,6948,>2
step
>>返回琥珀松木营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dumont|r和|cRXP_FRIENDLY_Anderhol|r交谈
.turnin 12292 >>交任务: |cRXP_FRIENDLY_当地人的支持|r
.accept 12293 >>接任务: |cRXP_LOOT_完成交易|r
.goto Grizzly Hills,31.83,60.16
.turnin 12212 >>交任务: |cRXP_FRIENDLY_补充食物|r
.accept 12216 >>接任务: |cRXP_LOOT_猎熊！|r
.turnin 12226 >>交任务: |cRXP_FRIENDLY_种子穿肠过……|r
.accept 12227 >>接任务: |cRXP_LOOT_尽你的职责|r
.turnin 12215 >>交任务: |cRXP_FRIENDLY_你死我活！|r
.accept 12217 >>接任务: |cRXP_LOOT_鹰的眼睛|r
.goto Grizzly Hills,32.10,59.97
.target Lieutenant Dumont
.target Master Woodsman Anderhol
step
.goto Grizzly Hills,32.22,58.89
>>使用位于|cRXP_PICK_琥珀松木厕所|r外的物品
.complete 12227,1 
.skipgossip
step
#completewith next
.goto Grizzly Hills,32.0,47.1,0
>>杀死你看到的白肩鹰|r
.complete 12217,1 
.mob Imperial Eagle
step
.goto Grizzly Hills,34.77,55.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与建筑内的|cRXP_FRIENDLY_伊凡|r交谈
.turnin 12293 >>交任务: |cRXP_FRIENDLY_完成交易|r
.accept 12294 >>接任务: |cRXP_LOOT_暂时的协议|r
.target Ivan
step
.goto Grizzly Hills,34.68,51.30,60,0
.goto Grizzly Hills,31.21,49.57,60,0
.goto Grizzly Hills,32.53,47.63
>>杀死你看到的白肩鹰|r
.complete 12217,1 
.mob Imperial Eagle
step
.goto Grizzly Hills,30.41,45.04,60,0
.goto Grizzly Hills,29.41,52.57,60,0
.goto Grizzly Hills,28.73,58.30
>>击杀|cRXP_ENEMY_灰鬃熊|r. 击败它们后搜刮出|cRXP_LOOT_熊掌|r
.complete 12216,1 
.mob Grizzly Bear
step
#pvp
.goto Grizzly Hills,29.91,59.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Carter|r交谈
.turnin 12444 >>交任务: |cRXP_FRIENDLY_黑水伐木场的战斗|r
.isQuestComplete 12444
.target Scout Captain Carter
step
.abandon 12444 >>放弃黑水伐木场的战斗
step
>>返回琥珀松木营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与外面的|cRXP_FRIENDLY_Dumont|r和|cRXP_FRIENDLY_Anderhol|r和|cRXP_FRIENDLY_Drake|r交谈
.turnin 12294 >>交任务: |cRXP_FRIENDLY_暂时的协议|r
.accept 12295 >>接任务: |cRXP_LOOT_外交活动|r
.accept 12210 >>接任务: |cRXP_LOOT_狩猎巨魔的季节！|r
.goto Grizzly Hills,31.83,60.16
.turnin 12217 >>交任务: |cRXP_FRIENDLY_鹰的眼睛|r
.turnin 12216 >>交任务: |cRXP_FRIENDLY_猎熊！|r
.turnin 12227 >>交任务: |cRXP_FRIENDLY_尽你的职责|r
.goto Grizzly Hills,32.10,59.97
.accept 12222 >>接任务: |cRXP_LOOT_缚焰者的秘密|r
.accept 12223 >>接任务: |cRXP_LOOT_削弱邪兽人|r
.goto Grizzly Hills,32.42,59.94
.target Lieutenant Dumont
.target Master Woodsman Anderhol
.target Woodsman Drake
step
#sticky
#label Talismans
.goto Grizzly Hills,30.2,77.3,0,0
>>击杀 |cRXP_ENEMY_掠龙缚焰者|r. 击败后可掠夺他们的 |cRXP_LOOT_护身符|r
.complete 12222,1 
.mob Dragonflayer Flamebinder
step
.goto Grizzly Hills,31.61,78.70,60,0
.goto Grizzly Hills,31.51,80.42,60,0
.goto Grizzly Hills,28.23,75.89,60,0
.goto Grizzly Hills,27.82,72.09
>>击杀|cRXP_ENEMY_掠龙侍卫|r
.complete 12223,1 
.mob Dragonflayer Huscarl
step << Shaman
#requires Talismans
#completewith next
.hs >>传送至琥珀松木营地
.cooldown item,6948,>2
step
#requires Talismans
.goto Grizzly Hills,32.42,59.94
>>骑马返回琥珀松木营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Drake|r交谈
.turnin 12222 >>交任务: |cRXP_FRIENDLY_缚焰者的秘密|r
.turnin 12223 >>交任务: |cRXP_FRIENDLY_削弱邪兽人|r
.accept 12255 >>接任务: |cRXP_LOOT_沃德伦的领主|r
.target Woodsman Drake
step << wotlk
#pvp
>>骑乘前往风险湾
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴布芬克|r和|cRXP_FRIENDLY_弗里曼|r和|cRXP_FRIENDLY_斯图尔特|r和|cRXP_FRIENDLY_杜内恩|r交谈
>>|cRXP_WARN_此任务|r(|cRXP_WARN_并将其保留在任务日志中|r)|cRXP_WARN_会标记你为PVP|r. |cRXP_WARN_如需可跳过|r
.accept 12443 >>接任务: |cRXP_LOOT_寻找溶解剂|r
.goto Grizzly Hills,23.02,80.16
.accept 12314 >>接任务: |cRXP_LOOT_除掉佐娜船长！|r
.goto Grizzly Hills,22.11,81.28
.accept 12316 >>接任务: |cRXP_LOOT_夺取港口！|r
.goto Grizzly Hills,22.07,81.30
.accept 12323 >>接任务: |cRXP_LOOT_把他们熏出来！|r
.goto Grizzly Hills,21.98,80.72
.target Barblefink
.target Baron Freeman
.target Lieutenant Stuart
.target Sergeant Downey
step << wotlk
#completewith Zorna
#pvp
.goto Grizzly Hills,18.1,79.5,40,0
.goto Grizzly Hills,16.4,76.5,40,0
.goto Grizzly Hills,14.5,76.4,0
.use 37621 >>在建筑物内的|cRXP_ENEMY_风险投资公司游荡者|r身上使用背包里的|T133717:0 |t[烟雾炸弹]. |cRXP_WARN_你可以将他们拉到一起, 以便更好地堆叠, 提高炸弹效果|r
.complete 12323,1 
.isOnQuest 12323
.mob Venture Co. Straggler
step << wotlk
#completewith Smoke
#pvp
.goto Grizzly Hills,15.4,76.6,0
>>在风险湾击杀|cRXP_ENEMY_征服堡狂战士|r (或|cRXP_ENEMY_部落玩家|r )
.complete 12316,1 
.isOnQuest 12316
.mob Conquest Hold Berserker
step << skip
#pvp
#questguide
>>检查风险湾是由联盟还是部落控制. 如果是部落控制, 跳过此步骤
>>|cRXP_WARN_此任务|r(|cRXP_WARN_并将其保留在任务日志中|r)|cRXP_WARN_会标记你为PVP|r. |cRXP_WARN_如需可跳过|r
.goto Grizzly Hills,14.8,86.6
.accept 12437 >>接任务: |cRXP_LOOT_红色鱼雷|r
step << skip
#pvp
#questguide
.goto Grizzly Hills,16.0,81.1,20,0
.goto Grizzly Hills,16.4,80.4
>>进入Venture.Co飞船, 前往底层船尾区域, 拾取元素115. 请注意, 该物品持续时间为3分钟
.collect 37664,1 
.isOnQuest 12437

step << skip
#pvp
#questguide
#completewith next
.goto Grizzly Hills,13.7,89.1
.vehicle >>前往探险湾码头. 进入火箭推进弹头
.isOnQuest 12437
step << skip
#pvp
#questguide
.goto Grizzly Hills,9.6,79.0
>>你通过调整相机朝向来控制火箭的移动方向. 驾驶它驶入战歌木材船. 如果火箭撞上冰山或陆地, 将会爆炸, 你需要重新获取115号元素, 并从头开始跑回起点
.complete 12437,1 
.isOnQuest 12437
step << skip
#pvp
#questguide
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t游回通货湾码头. 与豪瑟交谈
.goto Grizzly Hills,14.8,86.6
.turnin 12437 >>交任务: |cRXP_FRIENDLY_红色鱼雷|r
.isQuestComplete 12437
step << wotlk
#pvp
#label Zorna
.goto Grizzly Hills,13.36,80.19
>>在码头击杀 |cRXP_ENEMY_佐娜船长|r. |cRXP_WARN_请使用所有技能冷却时间|r. |cRXP_WARN_如果你无法击杀她|r, |cRXP_WARN_请跳过此步骤|r
.complete 12314,1 
.isOnQuest 12314
.mob Captain Zorna
step << wotlk
#pvp
#label Smoke
.goto Grizzly Hills,14.5,76.4,40,0
.goto Grizzly Hills,16.4,76.5,40,0
.goto Grizzly Hills,18.1,79.5
.use 37621 >>在建筑物内的|cRXP_ENEMY_风险投资公司游荡者|r身上使用背包里的|T133717:0 |t[烟雾炸弹]. |cRXP_WARN_你可以将他们拉到一起, 以便更好地堆叠, 提高炸弹效果|r
.complete 12323,1 
.isOnQuest 12323
.mob Venture Co. Straggler
step << wotlk
#pvp
.goto Grizzly Hills,11.57,79.32,60,0
.goto Grizzly Hills,15.14,78.52,60,0
.goto Grizzly Hills,14.84,76.47
>>在风险湾击杀|cRXP_ENEMY_征服堡狂战士|r (或|cRXP_ENEMY_部落玩家|r )
.complete 12316,1 
.isOnQuest 12316
.mob Conquest Hold Berserker
step << wotlk
#pvp
.goto Grizzly Hills,16.0,81.1,20,0
.goto Grizzly Hills,16.36,80.26
>>进入通天集团的船
>>|cRXP_WARN_前往船体底部后方, 拾取|r|cRXP_PICK_115号元素|r. |cRXP_WARN_请注意, 它有3分钟的持续时间|r
.complete 12443,1 
.isOnQuest 12443
step << wotlk
#pvp
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜内恩中士|r交谈
.goto Grizzly Hills,21.98,80.72
.turnin 12323 >>交任务: |cRXP_FRIENDLY_把他们熏出来！|r
.isQuestComplete 12323
.target Sergeant Downey
step << wotlk
#completewith end
#label CZorna
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯图尔特|r交谈
.goto Grizzly Hills,22.07,81.30
.turnin 12316 >>交任务: |cRXP_FRIENDLY_夺取港口！|r
.isQuestComplete 12316
.target Lieutenant Stuart
step << wotlk
#pvp
.goto Grizzly Hills,22.11,81.28
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗里曼|r交谈
.turnin 12314 >>交任务: |cRXP_FRIENDLY_除掉佐娜船长！|r
.isQuestComplete 12314
.target Baron Freeman
step << wotlk
#pvp
#requires CZorna
.goto Grizzly Hills,23.02,80.16
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴布芬克|r交谈
.turnin 12443 >>交任务: |cRXP_FRIENDLY_寻找溶解剂|r
.isQuestComplete 12443
.target Barblefink
step << wotlk
#completewith Sacrifices
>>放弃你无法完成的PVP任务
.abandon 12314 >>放弃除掉佐娜船长！
.abandon 12316 >>放弃并夺取港口！
.abandon 12443 >>放弃寻找溶解剂
.abandon 12323 >>放弃“把他们熏出来！”任务
step
#completewith next
.goto Grizzly Hills,26.59,77.85
.vehicle >>在沃德伦骑乘烈焰使者
.skipgossip
.target Flamebringer
step
#label pt1end
.goto Grizzly Hills,27.6,72.9
>>击杀|cRXP_ENEMY_Torvald|r
>>使用 |T134316:0|t"翼击" (2) 与 |T135830:0|t"熔火之怒" (3) 进行连击. 当其他技能处于冷却时, 频繁施放 |T135805:0|t"烈焰吐息" (1)
>>|cRXP_WARN_如果你有一个非常强大的角色, 可以在|r|cRXP_ENEMY_Torvald|r|cRXP_WARN_平台边缘下马, 然后正常击杀他|r
.complete 12255,1 
.mob Thane Torvald Eriksson
step
.goto Grizzly Hills,16.19,47.60
>>乘坐|cRXP_FRIENDLY_烈焰使者|r前往岩石之泉, 然后骑乘你的坐骑
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨米尔|r交谈
.turnin 12210 >>交任务: |cRXP_FRIENDLY_狩猎巨魔的季节！|r
.accept 11984 >>接任务: |cRXP_LOOT_抓巨魔|r
.target Samir
step
.goto Grizzly Hills,16.37,48.26,10,0
.goto Grizzly Hills,15.0,60.4
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往格拉尼特泉, 与|cRXP_FRIENDLY_巴德|r对话, 请他跟随你. 将他从可能袭击他的|r座狼|r救下
.use 35736 >>使用|cRXP_FRIENDLY_Budd's|r|T132310:0|t“标记巨魔”技能攻击一个|cRXP_ENEMY_冰巨魔|r(|cRXP_WARN_该技能在你的宠物栏中|r). 然后, 使用你背包中的 |T132599:0|t[赏金猎人的笼子] 对准|cRXP_ENEMY_冰巨魔|r
.complete 11984,1 
.skipgossip
.target Budd
.mob Drakkari Shaman
.mob Drakkari Warrior
step
>>返回岩石之泉
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与笼中的|cRXP_FRIENDLY_萨米尔|r和|cRXP_FRIENDLY_达库鲁|r交谈
.turnin 11984 >>交任务: |cRXP_FRIENDLY_抓巨魔|r
.goto Grizzly Hills,16.19,47.60
.accept 11989 >>接任务: |cRXP_LOOT_停战？|r
.goto Grizzly Hills,16.43,47.77
.target Samir
.target Drakuru
step
#completewith next
.goto Grizzly Hills,16.54,47.76
.cast 50141 >>从达库鲁右侧原木中取出卡住的|cRXP_PICK_Knife|r. 使用|T135650:0|t[钝刻刀]
.collect 38083,1,11989,1 
.use 38083
step
.use 38083 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t再次与|cRXP_FRIENDLY_达库鲁|r交谈
.complete 11989,1 
.turnin 11989 >>交任务: |cRXP_FRIENDLY_停战？|r
.accept 11990 >>接任务: |cRXP_LOOT_幻象之瓶|r
.goto Grizzly Hills,16.43,47.77
.skipgossip
.target Drakuru
step
.goto Grizzly Hills,15.96,47.79
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃门纳|r交谈, 从她处购买一个 |T132379:0|t灌魔之瓶
.complete 11990,1 

.target Ameenah
step
.goto Grizzly Hills,16.7,43.4,70,0
.goto Grizzly Hills,12.6,41.4
>>采集地面上的小型|cRXP_PICK_Bruiseweed-esque|r植物
.complete 11990,2 
step
.goto Grizzly Hills,15.30,40.08
>>在水下拾取|cRXP_PICK_水草叶|r
.complete 11990,3 
step
.goto Grizzly Hills,16.43,47.77
>>返回岩石之泉
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达库鲁|r交谈
.turnin 11990 >>交任务: |cRXP_FRIENDLY_幻象之瓶|r
.accept 11991 >>接任务: |cRXP_LOOT_解读象形文字|r
.target Drakuru
step
.accept 12484 >>接任务: |cRXP_LOOT_清理天灾|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普雷蒙|r交谈, 然后搜刮他身旁地上的一个|cRXP_PICK_天灾巨魔木乃伊|r
.goto Grizzly Hills,15.73,46.69
.collect 38149,1,12484,1 
.goto Grizzly Hills,15.84,46.72,-1
.goto Grizzly Hills,15.70,46.85,-1
.target Prigmon
step
.use 38149 >>使用背包中的 |T133798:0|t[天灾巨魔木乃伊] 投入火中
.complete 12484,1 
.goto Grizzly Hills,16.84,48.33
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克|r交谈. |cRXP_WARN_等待剧情事件结束|r
.turnin 12484 >>交任务: |cRXP_FRIENDLY_清理天灾|r
.accept 12029 >>接任务: |cRXP_LOOT_净化天灾巨魔|r
.goto Grizzly Hills,16.67,48.30
.target Mack Fearsen
step
.goto Grizzly Hills,15.73,46.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普雷蒙|r交谈
.accept 12483 >>接任务: |cRXP_LOOT_蘑菇汤！|r
.target Prigmon
step
#completewith IEyes
#label FrozenMojo
.goto Grizzly Hills,13.7,58.1,70,0
.goto Grizzly Hills,14.2,62.3,70,0
.goto Grizzly Hills,10.9,62.4,70,0
.goto Grizzly Hills,11.7,59.3,70,0
.goto Grizzly Hills,13.7,58.1,70,0
.goto Grizzly Hills,14.2,62.3,70,0
.goto Grizzly Hills,10.9,62.4,70,0
.goto Grizzly Hills,11.7,59.3
>>击杀该区域的|r冰巨魔|r. 击败它们后可获得|r冰冻魔精|r
.collect 35799,5 
.mob Drakkari Shaman
.mob Drakkari Warrior
step
#completewith next
>>击杀该区域的冰蛇. 从它们身上搜刮眼睛
.goto Grizzly Hills,13.7,58.1,70,0
.goto Grizzly Hills,14.2,62.3,70,0
.goto Grizzly Hills,10.9,62.4,70,0
.goto Grizzly Hills,11.7,59.3
.complete 12483,1 
.mob Ice Serpent
step
.goto Grizzly Hills,10.70,64.19,60,0
.goto Grizzly Hills,11.1,59.3
>>拾取地面上的|cRXP_PICK_冻蘑菇|r
.complete 12483,2 
step
#label IEyes
>>击杀该区域的冰蛇. 从它们身上搜刮眼睛
.goto Grizzly Hills,13.7,58.1,70,0
.goto Grizzly Hills,14.2,62.3,70,0
.goto Grizzly Hills,10.9,62.4,70,0
.goto Grizzly Hills,11.7,59.3,70,0
.goto Grizzly Hills,13.7,58.1,70,0
.goto Grizzly Hills,14.2,62.3,70,0
.goto Grizzly Hills,10.9,62.4,70,0
.goto Grizzly Hills,11.7,59.3
.complete 12483,1 
.mob Ice Serpent
step
#completewith end
#label FrozenMojo3
.goto Grizzly Hills,13.7,58.1,70,0
.goto Grizzly Hills,14.2,62.3,70,0
.goto Grizzly Hills,10.9,62.4,70,0
.goto Grizzly Hills,11.7,59.3,70,0
.goto Grizzly Hills,13.7,58.1,70,0
.goto Grizzly Hills,14.2,62.3,70,0
.goto Grizzly Hills,10.9,62.4,70,0
.goto Grizzly Hills,11.7,59.3
>>击杀该区域的|r冰巨魔|r. 击败它们后可获得|r冰冻魔精|r
.collect 35799,5 
.mob Drakkari Shaman
.mob Drakkari Warrior
step
#requires FrozenMojo3
.goto Grizzly Hills,13.24,60.87
>>在达克辛废墟的破损建筑顶部使用|T134812:0|t[达库鲁药剂], 召唤 |cRXP_FRIENDLY_达库鲁|r
.use 35797 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达库鲁|r交谈
.turnin 11991 >>交任务: |cRXP_FRIENDLY_解读象形文字|r
.accept 12007 >>接任务: |cRXP_LOOT_必要的牺牲|r
.target Drakuru
step
#completewith next
.goto Grizzly Hills,16.8,37.0,0
.goto Grizzly Hills,13.6,38.7,0
.goto Grizzly Hills,12.6,36.9,0
.goto Grizzly Hills,13.8,34.8,0
.goto Grizzly Hills,17.1,34.4,0
>>掠夺散落在塞布哈拉克各地的|cRXP_PICK_小型绿色植物|r
.complete 12483,3 
step
#completewith end
#label ZimBom
.goto Grizzly Hills,14.50,38.01
>>击杀|cRXP_ENEMY_Warlord Zim'Bo|r. 击败他后搜刮他的|cRXP_LOOT_Mojo|r
.collect 35836,1 
.mob Warlord Zim'bo
step
#requires ZimBom
.goto Grizzly Hills,16.0,28.7
.use 35908 >>使用背包中的 |T132798:0|t[麦克的黑烈酒], 并连续投掷到该区域的亡灵巨魔身上
>>|T132798:0|t格罗格|cRXP_WARN_要求你至少从30码外投掷|r, 但可以在战斗中使用 << !Mage !Hunter !Warlock
>>|T132798:0|t格罗格|cRXP_WARN_要求你从至少 30 码外投掷|r. 尽可能多地聚集怪物, |T135848:0|t冰霜新星|r击中它们, 然后从远处使用 |T132798:0|t格罗格|r << Mage
>>|T132798:0|t投掷物|cRXP_WARN_要求你从至少30码外投掷|r. 先用宠物聚集尽可能多的怪物, 然后从远处对它们使用 |T132798:0|t投掷物 << Hunter/Warlock
.complete 12029,1 
step
#completewith Sacrifices
.goto Grizzly Hills,16.8,37.0,0
.goto Grizzly Hills,13.6,38.7,0
.goto Grizzly Hills,12.6,36.9,0
.goto Grizzly Hills,13.8,34.8,0
.goto Grizzly Hills,17.1,34.4,0
>>掠夺散落在塞布哈拉克各地的|cRXP_PICK_小型绿色植物|r
.complete 12483,3 
step
.goto Grizzly Hills,17.96,36.48
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与位于泽巴哈拉顶部的|cRXP_FRIENDLY_雕像|r交谈, 从它身上拾取|cRXP_LOOT_预言者之眼|r
.complete 12007,1 
.skipgossip
step
#label Sacrifices
.goto Grizzly Hills,17.42,36.36
>>在楼梯顶端使用 |T134812:0|t[德拉库鲁的药剂]
.use 35797 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达库鲁|r交谈
.turnin 12007 >>交任务: |cRXP_FRIENDLY_必要的牺牲|r
.accept 12042 >>接任务: |cRXP_LOOT_古树精华宝石|r
.target Drakuru
step
.goto Grizzly Hills,17.1,34.4,70,0
.goto Grizzly Hills,16.8,37.0,70,0
.goto Grizzly Hills,13.6,38.7,70,0
.goto Grizzly Hills,12.6,36.9,70,0
.goto Grizzly Hills,13.8,34.8
>>掠夺散落在塞布哈拉克各地的|cRXP_PICK_小型绿色植物|r
.complete 12483,3 
step
>>返回岩石之泉
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普雷蒙|r和|cRXP_FRIENDLY_马克|r交谈
.turnin 12483 >>交任务: |cRXP_FRIENDLY_蘑菇汤！|r
.accept 12190 >>接任务: |cRXP_LOOT_跟我的小朋友打招呼|r
.goto Grizzly Hills,15.73,46.69
.turnin 12029 >>交任务: |cRXP_FRIENDLY_净化天灾巨魔|r


.goto Grizzly Hills,16.67,48.30
.target Prigmon
.target Mack Fearsen
step
#label pt2start
>>前往银溪镇
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公爵|r和|cRXP_FRIENDLY_瑟尔基|r和|cRXP_FRIENDLY_卡娅|r交谈
.turnin 12295 >>交任务: |cRXP_FRIENDLY_外交活动|r
.goto Grizzly Hills,26.41,35.70
.accept 12299 >>接任务: |cRXP_LOOT_北边的敌人|r
.goto Grizzly Hills,26.48,35.78
.accept 12307 >>接任务: |cRXP_LOOT_破狼草|r
.goto Grizzly Hills,25.61,33.30
.target Envoy Ducal
.target Sergei
.target Katja
step
#completewith next
.goto Grizzly Hills,23.9,37.7,0
.goto Grizzly Hills,24.4,29.7,0
.goto Grizzly Hills,22.5,30.7,0
>>点击地面上的|cRXP_PICK_Roots|r
.complete 12307,1 
step
.goto Grizzly Hills,24.05,31.18,60,0
.goto Grizzly Hills,23.90,36.26
>>击杀该区域内的征服堡劫掠者
.complete 12299,1 
.mob Conquest Hold Marauder
step
.goto Grizzly Hills,24.22,37.23,60,0
.goto Grizzly Hills,28.29,38.63,60,0
.goto Grizzly Hills,30.09,34.83
>>点击地面上的|cRXP_PICK_Roots|r
.complete 12307,1 
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡娅|r和|cRXP_FRIENDLY_瑟尔基|r交谈
.turnin 12307 >>交任务: |cRXP_FRIENDLY_破狼草|r
.goto Grizzly Hills,25.61,33.30
.turnin 12299 >>交任务: |cRXP_FRIENDLY_北边的敌人|r
.accept 12300 >>接任务: |cRXP_LOOT_勇气的试炼|r
.goto Grizzly Hills,26.48,35.78
.target Sergei
.target Katja
step
#label pt2end
.goto Grizzly Hills,21.93,29.92
>>杀死围绕着|cRXP_FRIENDLY_被囚禁的猎户|r的|cRXP_ENEMY_兽人|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_陷阱猎人|r交谈
.complete 12300,1 
.turnin 12300 >>交任务: |cRXP_FRIENDLY_勇气的试炼|r
.accept 12302 >>接任务: |cRXP_LOOT_萨莎的警告|r
.target Captured Trapper
.mob Conquest Hold Marauder
step << skip
.goto Grizzly Hills,19.4,27.7
.use 35908 >>使用背包中的Mack's Dark Grog, 持续向该区域的亡灵巨魔投掷
.complete 12038,1 
step
.goto Grizzly Hills,26.46,31.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与笼中的|cRXP_FRIENDLY_囚犯|r交谈
.turnin 12302 >>交任务: |cRXP_FRIENDLY_萨莎的警告|r
.accept 12308 >>接任务: |cRXP_LOOT_逃离银溪镇|r
.target Caged Prisoner
step
#completewith next
.goto Grizzly Hills,26.25,31.10
.vehicle >>跟随 |cRXP_FRIENDLY_联盟探子|r前往马匹处. 当 |cRXP_FRIENDLY_Ducal's Horse|r出现时, 骑上它
.target Freed Alliance Scout
.target Ducal's Horse
step
.goto Grizzly Hills,32.50,59.04
>>使用 |T132120:0|t“疾驰”(2)在冷却完毕时使用. 当怪物靠近时, 使用 |T136105:0|t“践踏”(3). 使用 |T135809:0|t“燃烧之油”(1)击杀追击你的|cRXP_ENEMY_Worgen|r狼人
.complete 12308,1 
.mob Silverbrook Worgen
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Drake|r和|cRXP_FRIENDLY_Dumont|r交谈
.turnin 12255 >>交任务: |cRXP_FRIENDLY_沃德伦的领主|r
.goto Grizzly Hills,32.42,59.94
.turnin 12308 >>交任务: |cRXP_FRIENDLY_逃离银溪镇|r
.accept 12310 >>接任务: |cRXP_LOOT_快速反应|r
.goto Grizzly Hills,31.83,60.16
.target Woodsman Drake
.target Lieutenant Dumont
step
#sticky
#label SilverbrookH
.goto Grizzly Hills,35.6,68.1,0,0
>>击杀该区域的银溪镇猎人
.complete 12310,1 
.mob Silverbrook Hunter
step
.goto Grizzly Hills,36.26,67.85
>>前往林边哨站
.use 36940 >>击杀|cRXP_ENEMY_弗拉德克|r. 搜刮他的|cRXP_LOOT_日记|r. 在背包中点击|T133741:0|t[米克哈尔的日记]
.complete 12310,2 
.collect 36940,1,12105,1 
.accept 12105 >>接任务: |cRXP_LOOT_坠入黑暗|r
.mob Vladek
step
#requires SilverbrookH
>>返回琥珀松木营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dumont|r和|cRXP_FRIENDLY_Thayreen|r交谈
.turnin 12105 >>交任务: |cRXP_FRIENDLY_坠入黑暗|r
.accept 12109 >>接任务: |cRXP_LOOT_再次向格里安·斯托曼报到|r
.turnin 12310 >>交任务: |cRXP_FRIENDLY_快速反应|r
.goto Grizzly Hills,31.83,60.16
.accept 12219 >>接任务: |cRXP_LOOT_倒下的世界之树|r
.accept 12220 >>接任务: |cRXP_LOOT_黑暗的影响|r
.goto Grizzly Hills,31.16,59.47
.target Lieutenant Dumont
.target Hierophant Thayreen
step << skip
.goto Grizzly Hills,16.7,48.3
>>骑乘前往岩石之泉
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马克|r交谈
.turnin 12038 >>交任务: |cRXP_FRIENDLY_净化天灾巨魔|r
.target Mack Fearsen
step
#completewith Tears
.goto Grizzly Hills,27.1,46.0,0
.goto Grizzly Hills,34.6,50.1,0
.goto Grizzly Hills,38.9,49.3,0
>>击杀沃达希尔各处的|cRXP_ENEMY_软泥怪|r, 从它们身上搜刮|cRXP_LOOT_软泥怪样本|r
.complete 12219,1 
.mob Entropic Ooze
step
.goto Grizzly Hills,28.6,45.0,25,0
.goto Grizzly Hills,30.19,43.93
.use 37173 >>进入树洞, 向下深入其中, 在尽头使用背包里的 |T134125:0|t[地卜师之球]
.complete 12220,3 
step
#label Tears
.goto Grizzly Hills,33.2,48.3,25,0
.goto Grizzly Hills,32.34,46.16
>>离开沃达希尔之泪的那棵树
.use 37173 >>进入树洞, 向下深入其中, 在尽头使用背包里的 |T134125:0|t[地卜师之球]
.complete 12220,2 
step
.goto Grizzly Hills,38.29,49.86,60,0
.goto Grizzly Hills,39.17,51.82,60,0
.goto Grizzly Hills,41.15,50.21,60,0
.goto Grizzly Hills,38.97,48.15
>>离开沃达希尔之臂上的那棵树
>>击杀沃达希尔各处的|cRXP_ENEMY_软泥怪|r, 从它们身上搜刮|cRXP_LOOT_软泥怪样本|r
.complete 12219,1 
.mob Entropic Ooze
step
.goto Grizzly Hills,40.8,52.1,25,0
.goto Grizzly Hills,41.16,54.27
.use 37173 >>进入树洞, 向下深入其中, 在尽头使用背包里的 |T134125:0|t[地卜师之球]
.complete 12220,1 
step
#completewith next
.goto Grizzly Hills,40.93,54.90
.goto Grizzly Hills,33.75,56.64,70 >>|cRXP_WARN_跳到蘑菇上|r. |cRXP_WARN_注销|r, |cRXP_WARN_然后重新登录|r
.link https://www.youtube.com/watch?v=f_RtIujejaI >>点击此处查看攻略
step
.goto Grizzly Hills,31.16,59.47
>>返回琥珀松木营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thayreen|r交谈
.turnin 12219 >>交任务: |cRXP_FRIENDLY_倒下的世界之树|r
.turnin 12220 >>交任务: |cRXP_FRIENDLY_黑暗的影响|r
.accept 12246 >>接任务: |cRXP_LOOT_可能的关联|r
.accept 12247 >>接任务: |cRXP_LOOT_乌索克的孩子|r
.target Hierophant Thayreen
step
#completewith next
.goto Grizzly Hills,53.1,55.4,0
>>击杀该区域的|cRXP_ENEMY_熊怪|r. 击杀后搜刮他们的|cRXP_LOOT_鲜血|r
.complete 12246,1 
.mob Frostpaw Warrior
.mob Frostpaw Shaman
step
.goto Grizzly Hills,48.37,58.40,30,0
.goto Grizzly Hills,48.07,58.86
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在怒牙神殿的洞穴中与|cRXP_FRIENDLY_奥索恩|r交谈
.complete 12247,1 
.skipgossip
.target Orsonn
step
#completewith next
.goto Grizzly Hills,53.1,55.4,60,0
.goto Grizzly Hills,66.4,59.3,0
>>击杀该区域的|cRXP_ENEMY_熊怪|r. 击杀后搜刮他们的|cRXP_LOOT_鲜血|r
>>|cRXP_WARN_你将稍后获得剩余的|r|cRXP_LOOT_鲜血|r|cRXP_WARN_later|r
.complete 12246,1 
.mob Frostpaw Warrior
.mob Frostpaw Shaman
step
.goto Grizzly Hills,66.79,61.86,30,0
.goto Grizzly Hills,66.89,62.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在心之血神殿的洞穴中与 |cRXP_FRIENDLY_科蒂安|r交谈
.complete 12247,2 
.skipgossip
.target Kodian
step
.goto Grizzly Hills,66.5,53.5
>>击杀该区域的|cRXP_ENEMY_熊怪|r. 击杀后搜刮他们的|cRXP_LOOT_鲜血|r
.complete 12246,1 
.mob Redfang Elder
.mob Redfang Hunter
step << Druid
#completewith DruidTrain1
.cast 18960 >>传送术:月光林地
.zoneskip Moonglade
.xp <74,1
step << Druid
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 53307 >>训练你的职业法术
.xp <74,1
.target Loganaar
step << Druid
#label DruidTrain1
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48440 >>训练你的职业法术
.xp <75,1
.target Loganaar
step << DK
#completewith DKTrain1
.cast 50977 >>施放死亡之门
.zoneskip Eastern Plaguelands
.xp <74,1
step << DK
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49929 >>训练你的职业法术
.xp <74,1
.target Amal'thazad
step << DK
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49923 >>训练你的职业法术
.xp <75,1
.target Amal'thazad
step << DK
#label DKTrain1
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49894 >>训练你的职业法术
.xp <76,1
.target Amal'thazad
step << Mage
#completewith MageTrain1
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
.xp <74,1
step << Mage
.goto Stormwind City,49.55,85.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42939 >>训练你的职业法术
.xp <74,1
.target Elsharin
.target Jennea Cannon
step << Mage
.goto Stormwind City,49.55,85.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42955 >>训练你的职业法术
.xp <75,1
.target Elsharin
.target Jennea Cannon
step << Mage
#label MageTrain1
.goto Stormwind City,49.55,85.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42920 >>训练你的职业法术
.xp <76,1
.target Elsharin
.target Jennea Cannon
step
#completewith next
.hs >>传送至琥珀松木营地
step
.goto Grizzly Hills,31.16,59.47
>>返回琥珀松木营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thayreen|r交谈
.turnin 12246 >>交任务: |cRXP_FRIENDLY_可能的关联|r
.turnin 12247 >>交任务: |cRXP_FRIENDLY_乌索克的孩子|r
.accept 12248 >>接任务: |cRXP_LOOT_沃达希尔的树苗|r
.accept 12250 >>接任务: |cRXP_LOOT_沃达希尔的种子|r
.target Hierophant Thayreen
step
#completewith next
.goto Grizzly Hills,52.6,46.1,0
.goto Grizzly Hills,54.1,41.8,0
.goto Grizzly Hills,52.9,38.1,0
>>掠夺|cRXP_PICK_Seeds|r主要发生在沃达希尔之外, 但也会在内部获得
.complete 12250,1 
step
.goto Grizzly Hills,50.5,46.0,45,0
.goto Grizzly Hills,50.7,42.9
.use 37306 >>进入沃达希尔. |cRXP_WARN_跳到树底|r, 然后在底部使用|T135432:0|t[翠绿火炬]
.complete 12248,1 
step
.goto Grizzly Hills,52.6,46.1,60,0
.goto Grizzly Hills,54.1,41.8,60,0
.goto Grizzly Hills,52.9,38.1
>>离开沃德拉希尔
>>掠夺|cRXP_PICK_Seeds|r主要发生在沃达希尔之外, 但也会在内部获得
.complete 12250,1 
step
#questguide
#completewith next
.hs >>传送至琥珀松木营地
.cooldown item,6948,>2
step
#questguide
.goto Grizzly Hills,31.16,59.47
>>返回琥珀松木营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thayreen|r交谈
.turnin 12248 >>交任务: |cRXP_FRIENDLY_沃达希尔的树苗|r
.turnin 12250 >>交任务: |cRXP_FRIENDLY_沃达希尔的种子|r
.accept 12249 >>接任务: |cRXP_LOOT_乌索克，巨熊之神|r
.target Hierophant Thayreen
step
#questguide
#pvp
>>前往蓝天伐木场
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈茨曼|r和|cRXP_FRIENDLY_塞尼普斯|r和|cRXP_FRIENDLY_皮普斯维克|r和|cRXP_FRIENDLY_蕾安娜|r谈话
>>|cRXP_WARN_此任务|r(|cRXP_WARN_并将其保留在任务日志中|r)|cRXP_WARN_会标记你为PVP|r. |cRXP_WARN_如需可跳过|r
.accept 12289 >>接任务: |cRXP_LOOT_乘胜追击|r
.goto Grizzly Hills,39.36,43.87
.accept 12244 >>接任务: |cRXP_LOOT_翻修伐木机|r
.goto Grizzly Hills,39.54,43.57
.accept 12268 >>接任务: |cRXP_LOOT_伐木机零件|r
.goto Grizzly Hills,39.64,43.38
.accept 12296 >>接任务: |cRXP_LOOT_生存或是死亡|r
.goto Grizzly Hills,40.47,42.66
.target Sergeant Hartsman
.target Synipus
.target Pipthwack
.target Rheanna
step
#questguide
#pvp
#completewith Dudes
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1
>>拾取你在该区域看到的|cRXP_PICK_Cogs|r和|cRXP_PICK_Sprockets|r和|cRXP_PICK_Springs|r
.complete 12268,1 
.complete 12268,2 
.complete 12268,3 
.isOnQuest 12268
step
#questguide
#pvp
#completewith Infantry
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1
>>击杀该区域内的受伤的散兵(或部落玩家)
.complete 12289,1 
.isOnQuest 12289
.mob Wounded Skirmisher
step
#questguide
#pvp
#completewith Engineer
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,39.6,43.5,0
>>进入一个|cRXP_FRIENDLY_瘫痪的伐木机|r. 使用 |T136106:0|t“超频”(3) 以提升移动速度
>>将其带回|r皮普斯维克|cRXP_FRIENDLY_, 并使用|T134248:0|t“碎纸机投递”(4)
.complete 12244,1 
.isOnQuest 12244
.target Broken-down Shredder
.target Pipthwack
step
#questguide
#pvp
#label Infantry
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1
.use 37576 >>使用背包中的 |T133686:0|t[恢复绷带] 对准 |cRXP_FRIENDLY_受伤的西部荒野步兵|r. |cRXP_WARN_请注意|r. |cRXP_WARN_此任务物品冷却时间较长|r
.complete 12296,1 
.isOnQuest 12296
.target Wounded Westfall Infantry
step
#questguide
#pvp
#label Dudes
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1
>>击杀该区域内的受伤的散兵(或部落玩家)
.complete 12289,1 
.isOnQuest 12289
.mob Wounded Skirmisher
step
#questguide
#pvp
#label Engineer
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1
>>拾取你在该区域看到的|cRXP_PICK_Cogs|r和|cRXP_PICK_Sprockets|r和|cRXP_PICK_Springs|r
.complete 12268,1 
.complete 12268,2 
.complete 12268,3 
.isOnQuest 12268
step
#questguide
#pvp
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,39.6,43.5
>>进入一个|cRXP_FRIENDLY_瘫痪的伐木机|r. 使用 |T136106:0|t“超频”(3) 以提升移动速度
>>将其带回|r皮普斯维克|cRXP_FRIENDLY_, 并使用|T134248:0|t“碎纸机投递”(4)
.complete 12244,1 
.isOnQuest 12244
.target Broken-down Shredder
.target Pipthwack
step
#questguide
#pvp
#label PiecesP
#completewith end
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮普斯维克|r交谈
.turnin 12268 >>交任务: |cRXP_FRIENDLY_伐木机零件|r
.goto Grizzly Hills,39.64,43.38,-1
.isQuestComplete 12268
.target Pipthwack
step
#questguide
#pvp
#label ShredderR
#completewith end
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尼普斯|r交谈
.turnin 12244 >>交任务: |cRXP_FRIENDLY_翻修伐木机|r
.goto Grizzly Hills,39.54,43.57,-1
.isQuestComplete 12244
.target Synipus
step
#questguide
#pvp
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈斯曼中士|r交谈
.turnin 12289 >>交任务: |cRXP_FRIENDLY_乘胜追击|r
.goto Grizzly Hills,39.36,43.87,-1
.isQuestComplete 12289
.target Sergeant Hartsman
step
#questguide
#pvp
#requires ShredderR
step
#questguide
#pvp
#requires PiecesP
.goto Grizzly Hills,40.47,42.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蕾安娜|r交谈
.turnin 12296 >>交任务: |cRXP_FRIENDLY_生存或是死亡|r
.isQuestComplete 12296
.target Rheanna
step
#questguide
#completewith end
>>放弃你无法完成的PVP任务
.abandon 12268 >>放弃伐木机零件
.abandon 12244 >>放弃翻修伐木机
.abandon 12289 >>放弃乘胜追击
.abandon 12296 >>放弃生存或是死亡
step
#questguide
.goto Grizzly Hills,38.1,32.0,30,0
.goto Grizzly Hills,36.95,32.36
>>|cRXP_WARN_前往蓝天伐木场北侧水域中的塔楼|r
>>进入顶部的小房间, 拾取地面上的|cRXP_PICK_gem|r宝石
.turnin 12042 >>交任务: |cRXP_FRIENDLY_古树精华宝石|r
.accept 12802 >>接任务: |cRXP_LOOT_尽在掌控|r
step
#questguide
#completewith end
#label DesperateMojo
.goto Grizzly Hills,43.41,28.26,60,0
.goto Grizzly Hills,44.89,30.56,60,0
.goto Grizzly Hills,46.76,28.20,60,0
.goto Grizzly Hills,44.87,25.77
>>击杀该区域的|cRXP_ENEMY_达卡莱巨魔|r, 搜刮他们的|cRXP_LOOT_魔汁|r
>>|cRXP_ENEMY_达卡莱巫医|r|cRXP_WARN_不要丢弃它|r
.collect 36743,5 
.mob Drakkari Defender
.mob Injured Drakkari Refugee
step
#questguide
#requires DesperateMojo
.goto Grizzly Hills,45.00,28.36
>>在火盆处使用 |T134812:0|t[德拉库鲁的药剂]
.use 35797 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达库鲁|r交谈
.turnin 12802 >>交任务: |cRXP_FRIENDLY_尽在掌控|r
.accept 12068 >>接任务: |cRXP_LOOT_灰尘之声|r
.target Drakuru
step
#questguide
.goto Grizzly Hills,49.20,34.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_艾米莉|r(在室内). 这将触发护送任务
.accept 12027 >>接任务: |cRXP_LOOT_小毛球的冒险|r

.target Emily
step
#questguide
.goto Grizzly Hills,52.4,34.3,50,0
.goto Grizzly Hills,53.81,33.34
>>护送|cRXP_FRIENDLY_艾米莉|r
.complete 12027,1 
.target Emily
step
#questguide
#Level 74
>>前往月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珀西|r和|cRXP_FRIENDLY_沃尔特|r和|cRXP_FRIENDLY_格里安|r交谈
.accept 12414 >>接任务: |cRXP_LOOT_顺手牵马|r
.goto Grizzly Hills,59.09,26.61
.turnin 12027 >>交任务: |cRXP_FRIENDLY_小毛球的冒险|r
.goto Grizzly Hills,59.08,26.48
.turnin 12109 >>交任务: |cRXP_FRIENDLY_再次向格里安·斯托曼报到|r
.accept 12158 >>接任务: |cRXP_LOOT_空石矿洞|r
.accept 11998 >>接任务: |cRXP_LOOT_灵活的手段|r
.accept 12770 >>接任务: |cRXP_LOOT_资源调配|r
.goto Grizzly Hills,59.42,26.00
.isQuestComplete 12027
.target Squire Percy
.target Squire Walter
.target Captain Gryan Stoutmantle
step
#questguide
>>前往月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珀西|r和|cRXP_FRIENDLY_沃尔特|r和|cRXP_FRIENDLY_格里安|r交谈
.accept 12414 >>接任务: |cRXP_LOOT_顺手牵马|r
.goto Grizzly Hills,59.09,26.61
.turnin 12027 >>交任务: |cRXP_FRIENDLY_小毛球的冒险|r
.goto Grizzly Hills,59.08,26.48
.turnin 12109 >>交任务: |cRXP_FRIENDLY_再次向格里安·斯托曼报到|r
.accept 12158 >>接任务: |cRXP_LOOT_空石矿洞|r
.accept 11998 >>接任务: |cRXP_LOOT_灵活的手段|r
.goto Grizzly Hills,59.42,26.00
.isQuestComplete 12027
.target Squire Percy
.target Squire Walter
.target Captain Gryan Stoutmantle
step
#questguide
#Level 74
>>前往月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Percy|r和|cRXP_FRIENDLY_Gryan|r交谈
.accept 12414 >>接任务: |cRXP_LOOT_顺手牵马|r
.goto Grizzly Hills,59.09,26.61
.turnin 12109 >>交任务: |cRXP_FRIENDLY_再次向格里安·斯托曼报到|r
.accept 12158 >>接任务: |cRXP_LOOT_空石矿洞|r
.accept 11998 >>接任务: |cRXP_LOOT_灵活的手段|r
.accept 12770 >>接任务: |cRXP_LOOT_资源调配|r
.goto Grizzly Hills,59.42,26.00
.target Squire Percy
.target Captain Gryan Stoutmantle
step
#questguide
>>前往月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Percy|r和|cRXP_FRIENDLY_Gryan|r交谈
.accept 12414 >>接任务: |cRXP_LOOT_顺手牵马|r
.goto Grizzly Hills,59.09,26.61
.turnin 12109 >>交任务: |cRXP_FRIENDLY_再次向格里安·斯托曼报到|r
.accept 12158 >>接任务: |cRXP_LOOT_空石矿洞|r
.accept 11998 >>接任务: |cRXP_LOOT_灵活的手段|r
.goto Grizzly Hills,59.42,26.00
.target Squire Percy
.target Captain Gryan Stoutmantle
step
#Level 74
>>前往月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安|r交谈
.turnin 12109 >>交任务: |cRXP_FRIENDLY_再次向格里安·斯托曼报到|r
.accept 12158 >>接任务: |cRXP_LOOT_空石矿洞|r
.accept 11998 >>接任务: |cRXP_LOOT_灵活的手段|r
.accept 12770 >>接任务: |cRXP_LOOT_资源调配|r
.goto Grizzly Hills,59.42,26.00
.target Captain Gryan Stoutmantle
step
>>前往月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安|r交谈
.turnin 12109 >>交任务: |cRXP_FRIENDLY_再次向格里安·斯托曼报到|r
.accept 12158 >>接任务: |cRXP_LOOT_空石矿洞|r
.accept 11998 >>接任务: |cRXP_LOOT_灵活的手段|r
.goto Grizzly Hills,59.42,26.00
.target Captain Gryan Stoutmantle
step
#completewith UMiners
.goto Grizzly Hills,59.56,26.30
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_McCarty|r交谈
.home >>将你的炉石设置为月溪旅营地
.target Quartermaster McCarty
step
.goto Grizzly Hills,59.89,26.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨缪尔|r交谈
.fp Westfall Brigade Encampment >>获取月溪旅营地的飞行点
.target Samuel Clearbook
step
#questguide
.goto Grizzly Hills,61.9,32.1,80,0
.goto Grizzly Hills,59.1,26.6,30,0
.goto Grizzly Hills,61.9,32.1,80,0
.goto Grizzly Hills,59.1,26.6,30,0
.goto Grizzly Hills,61.9,32.1,80,0
.goto Grizzly Hills,59.1,26.6,30,0
.goto Grizzly Hills,61.9,32.1,80,0
.goto Grizzly Hills,59.1,26.6,30,0
.goto Grizzly Hills,61.9,32.1,80,0
.goto Grizzly Hills,59.1,26.6,30,0
.goto Grizzly Hills,61.9,32.1
.use 37707 >>每归还一只|cRXP_FRIENDLY_Mustang|r, 就从该区域各处拾取一个|cRXP_PICK_野生胡萝卜|r
.use 37708 >>装备 |T132932:0|t[棍子], 然后用它驯服一只|cRXP_FRIENDLY_高地野马|r— 骑着它返回西部荒野桥营地的|cRXP_FRIENDLY_侍从皮尔斯|r处, 再使用 |T132226:0|t“交出缰绳”(1). |cRXP_WARN_骑乘时无法拾取胡萝卜|r
.complete 12414,1 
.target Highland Mustang
.target Squire Percy

step
#questguide
.goto Grizzly Hills,59.09,26.61
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_侍从皮尔斯|r交谈
.turnin 12414 >>交任务: |cRXP_FRIENDLY_顺手牵马|r
.target Squire Percy
step
#questguide
#completewith next
.goto Grizzly Hills,51.65,26.79,40,0
.goto Grizzly Hills,51.70,25.75,40,0
.goto Grizzly Hills,50.61,24.29,40 >>沿着道路向上前往|cRXP_FRIENDLY_图尔·怒爪|r
step
#questguide
.goto Grizzly Hills,52.62,24.06,10,0
.goto Grizzly Hills,52.62,24.06,0
.goto Grizzly Hills,52.07,18.06
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图尔·怒爪|r交谈
>>选择你在击杀|cRXP_ENEMY_乌索克|r时希望他扮演的角色:|cRXP_WARN_Bear = 坦克|r, |cRXP_WARN_Subdue = 输出|r, |cRXP_WARN_Healer = 治疗|r
>>跟随他前往|cRXP_ENEMY_乌索克|r. 击杀|cRXP_ENEMY_乌索克|r以及召唤出的|cRXP_ENEMY_血|r
>>对|cRXP_ENEMY_乌索克|r的尸体使用 |T133849:0|t[净化过的沃达希尔的灰烬]
>>|cRXP_WARN_这个任务难度较高. 如需协助, 请为他组队. 若无法组队或选择单刷, 可跳过此步骤|r
.use 37307
.complete 12249,1 
.mob Ursoc
.mob Blood of the Old God
.isOnQuest 12249
step
.goto Grizzly Hills,55.13,23.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空石矿洞内的派特洛夫|r交谈
.turnin 12158 >>交任务: |cRXP_FRIENDLY_空石矿洞|r
.accept 12159 >>接任务: |cRXP_LOOT_无法安息的灵魂|r
.target Petrov
step
#label UMiners
.goto Grizzly Hills,54.0,22.8,70,0
.goto Grizzly Hills,53.3,19.8
.use 37932 >>击杀|cRXP_ENEMY_亡灵矿工|r. 使用背包中的 |T134249:0|t[矿工灯笼] 对其尸体使用, 以安息亡灵
.complete 12159,1 
.mob Undead Miner
step
.goto Grizzly Hills,55.13,23.38
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_空石矿洞内的派特洛夫|r交谈
.turnin 12159 >>交任务: |cRXP_FRIENDLY_无法安息的灵魂|r
.accept 12160 >>接任务: |cRXP_LOOT_往日的名字|r
.target Petrov
step
>>返回月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gryan|r和|cRXP_FRIENDLY_Arun|r交谈
.turnin 12160 >>交任务: |cRXP_FRIENDLY_往日的名字|r
.goto Grizzly Hills,59.42,26.00
.accept 12161 >>接任务: |cRXP_LOOT_盲眼卢娜|r
.goto Grizzly Hills,59.17,26.18
.target Captain Gryan Stoutmantle
.target Private Arun
step
.goto Grizzly Hills,44.04,47.94
>>前往卢娜的营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_盲眼卢娜|r交谈
.turnin 12161 >>交任务: |cRXP_FRIENDLY_盲眼卢娜|r
.accept 12328 >>接任务: |cRXP_LOOT_卢娜的要求|r
.target Ruuna the Blind
step
#pvp
>>前往蓝天伐木场
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈茨曼|r和|cRXP_FRIENDLY_塞尼普斯|r和|cRXP_FRIENDLY_皮普斯维克|r和|cRXP_FRIENDLY_蕾安娜|r谈话
>>|cRXP_WARN_此任务|r(|cRXP_WARN_并将其保留在任务日志中|r)|cRXP_WARN_会标记你为PVP|r. |cRXP_WARN_如需可跳过|r
.accept 12289 >>接任务: |cRXP_LOOT_乘胜追击|r
.goto Grizzly Hills,39.36,43.87
.accept 12244 >>接任务: |cRXP_LOOT_翻修伐木机|r
.goto Grizzly Hills,39.54,43.57
.accept 12268 >>接任务: |cRXP_LOOT_伐木机零件|r
.goto Grizzly Hills,39.64,43.38
.accept 12296 >>接任务: |cRXP_LOOT_生存或是死亡|r
.goto Grizzly Hills,40.47,42.66
.target Sergeant Hartsman
.target Synipus
.target Pipthwack
.target Rheanna
step
#pvp
#completewith Dudes
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1
>>拾取你在该区域看到的|cRXP_PICK_Cogs|r和|cRXP_PICK_Sprockets|r和|cRXP_PICK_Springs|r
.complete 12268,1 
.complete 12268,2 
.complete 12268,3 
.isOnQuest 12268
step
#pvp
#completewith Infantry
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1
>>击杀该区域内的受伤的散兵(或部落玩家)
.complete 12289,1 
.isOnQuest 12289
.mob Wounded Skirmisher
step
#pvp
#completewith Engineer
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,39.6,43.5,0
>>进入一个|cRXP_FRIENDLY_瘫痪的伐木机|r. 使用 |T136106:0|t“超频”(3) 以提升移动速度
>>将其带回|r皮普斯维克|cRXP_FRIENDLY_, 并使用|T134248:0|t“碎纸机投递”(4)
.complete 12244,1 
.isOnQuest 12244
.target Broken-down Shredder
.target Pipthwack
step
#pvp
#label Infantry
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1
.use 37576 >>使用背包中的 |T133686:0|t[恢复绷带] 对准 |cRXP_FRIENDLY_受伤的西部荒野步兵|r. |cRXP_WARN_请注意|r. |cRXP_WARN_此任务物品冷却时间较长|r
.complete 12296,1 
.isOnQuest 12296
.target Wounded Westfall Infantry
step
#pvp
#label Dudes
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1
>>击杀该区域内的受伤的散兵(或部落玩家)
.complete 12289,1 
.isOnQuest 12289
.mob Wounded Skirmisher
step
#pvp
#label Engineer
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1
>>拾取你在该区域看到的|cRXP_PICK_Cogs|r和|cRXP_PICK_Sprockets|r和|cRXP_PICK_Springs|r
.complete 12268,1 
.complete 12268,2 
.complete 12268,3 
.isOnQuest 12268
step
#pvp
.goto Grizzly Hills,33.8,40.9,70,0
.goto Grizzly Hills,35.7,38.1,70,0
.goto Grizzly Hills,39.6,43.5
>>进入一个|cRXP_FRIENDLY_瘫痪的伐木机|r. 使用 |T136106:0|t“超频”(3) 以提升移动速度
>>将其带回|r皮普斯维克|cRXP_FRIENDLY_, 并使用|T134248:0|t“碎纸机投递”(4)
.complete 12244,1 
.isOnQuest 12244
.target Broken-down Shredder
.target Pipthwack
step
#pvp
#label PiecesP
#completewith end
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮普斯维克|r交谈
.turnin 12268 >>交任务: |cRXP_FRIENDLY_伐木机零件|r
.goto Grizzly Hills,39.64,43.38,-1
.isQuestComplete 12268
.target Pipthwack
step
#pvp
#label ShredderR
#completewith end
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞尼普斯|r交谈
.turnin 12244 >>交任务: |cRXP_FRIENDLY_翻修伐木机|r
.goto Grizzly Hills,39.54,43.57,-1
.isQuestComplete 12244
.target Synipus
step
#pvp
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈斯曼中士|r交谈
.turnin 12289 >>交任务: |cRXP_FRIENDLY_乘胜追击|r
.goto Grizzly Hills,39.36,43.87,-1
.isQuestComplete 12289
.target Sergeant Hartsman
step
#pvp
#requires ShredderR
step
#pvp
#requires PiecesP
.goto Grizzly Hills,40.47,42.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蕾安娜|r交谈
.turnin 12296 >>交任务: |cRXP_FRIENDLY_生存或是死亡|r
.isQuestComplete 12296
.target Rheanna
step
#completewith end
>>放弃你无法完成的PVP任务
.abandon 12268 >>放弃伐木机零件
.abandon 12244 >>放弃翻修伐木机
.abandon 12289 >>放弃乘胜追击
.abandon 12296 >>放弃生存或是死亡
step
.goto Grizzly Hills,38.1,32.0,30,0
.goto Grizzly Hills,36.95,32.36
>>|cRXP_WARN_前往蓝天伐木场北侧水域中的塔楼|r
>>进入顶部的小房间, 拾取地面上的|cRXP_PICK_gem|r宝石
.turnin 12042 >>交任务: |cRXP_FRIENDLY_古树精华宝石|r
.accept 12802 >>接任务: |cRXP_LOOT_尽在掌控|r
step
#completewith end
#label DesperateMojo2
.goto Grizzly Hills,43.41,28.26,60,0
.goto Grizzly Hills,44.89,30.56,60,0
.goto Grizzly Hills,46.76,28.20,60,0
.goto Grizzly Hills,44.87,25.77
>>击杀该区域的|cRXP_ENEMY_达卡莱巨魔|r, 搜刮他们的|cRXP_LOOT_魔汁|r
>>|cRXP_ENEMY_达卡莱巫医|r|cRXP_WARN_不要丢弃它|r
.collect 36743,5 
.mob Drakkari Defender
.mob Injured Drakkari Refugee
step
#requires DesperateMojo2
.goto Grizzly Hills,45.00,28.36
>>在火盆处使用 |T134812:0|t[德拉库鲁的药剂]
.use 35797 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达库鲁|r交谈
.turnin 12802 >>交任务: |cRXP_FRIENDLY_尽在掌控|r
.accept 12068 >>接任务: |cRXP_LOOT_灰尘之声|r
.target Drakuru
step
.goto Grizzly Hills,52.1,29.7,70,0
.goto Grizzly Hills,46.5,40.8
>>击杀|cRXP_ENEMY_食蕨蛾|r. 击杀后可从它们身上获取|cRXP_LOOT_粉尘|r
.complete 12328,1 
.mob Fern Feeder Moth
step
.goto Grizzly Hills,44.04,47.94
>>前往卢娜的营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_盲眼卢娜|r交谈
.turnin 12328 >>交任务: |cRXP_FRIENDLY_卢娜的要求|r
.accept 12327 >>接任务: |cRXP_LOOT_梦游体验|r
.target Ruuna the Blind
step
.goto Grizzly Hills,44.09,47.86
.use 37661 >>在鲁娜面前的水晶球处使用 |T134810:0|t[幻境药水]. |cRXP_WARN_等待角色扮演事件|r
.cast 49097
.timer 15,Out of Body Experience RP
.complete 12327,1 
step
.goto Grizzly Hills,44.04,47.94
>>点击移除 |T135876:0|t“灵魂出窍体验”增益
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_盲眼卢娜|r交谈
.turnin 12327 >>交任务: |cRXP_FRIENDLY_梦游体验|r
.accept 12329 >>接任务: |cRXP_LOOT_命运与巧合|r
.target Ruuna the Blind
step
.goto Grizzly Hills,57.52,41.26
>>前往白松商栈
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨莎|r交谈
.turnin 12329 >>交任务: |cRXP_FRIENDLY_命运与巧合|r
.accept 12134 >>接任务: |cRXP_LOOT_萨莎的狩猎|r
.accept 12330 >>接任务: |cRXP_LOOT_阿纳托雷|r
.target Sasha
step
.goto Grizzly Hills,61.46,42.89,60,0
.goto Grizzly Hills,62.40,41.46
>>击杀该区域的冬至村猎人. 如需, 可将他们引诱至建筑物内(因其为远程单位).|cRXP_WARN_切勿击杀|r |cRXP_ENEMY_塔特亚娜|r
.complete 12134,1 
.mob Solstice Hunter
step
#completewith next
.goto Grizzly Hills,62.19,42.39
.vehicle >>在你的背包中使用 |T135660:0|t[麻醉飞镖], 对准|cRXP_ENEMY_塔特亚娜|r或|cRXP_ENEMY_马|r
.timer 36,Tatjana Horse RP
>>骑上塔季扬娜的马, 返回萨莎处
.use 37665
.mob Tatjana
.mob Tatjana's Horse
step
.goto Grizzly Hills,57.78,41.66
.use 37665 >>骑上塔季扬娜的马, 返回萨莎处
.complete 12330,1 
step
.goto Grizzly Hills,57.52,41.26
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨莎|r交谈
.turnin 12134 >>交任务: |cRXP_FRIENDLY_萨莎的狩猎|r
.turnin 12330 >>交任务: |cRXP_FRIENDLY_阿纳托雷|r
.accept 12411 >>接任务: |cRXP_LOOT_姐姐的誓言|r
.target Sasha
step
#questguide
.goto Grizzly Hills,65.7,43.3,25,0
.goto Grizzly Hills,64.80,43.41
>>进入暗嚎兽穴(|cRXP_WARN_村庄下方的洞穴|r)
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与笼中的|cRXP_FRIENDLY_安娅|r对话, 然后在萨莎跑进洞穴时与她交谈
.turnin 12411 >>交任务: |cRXP_FRIENDLY_姐姐的誓言|r
.goto Grizzly Hills,64.80,43.41
.accept 12164 >>接任务: |cRXP_LOOT_狼人的末日|r
.goto Grizzly Hills,64.94,43.43
.target Anya
.target Sasha
step
.goto Grizzly Hills,65.7,43.3,25,0
.goto Grizzly Hills,64.80,43.41
>>进入暗嚎兽穴(|cRXP_WARN_村庄下方的洞穴|r)
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与笼中的|cRXP_FRIENDLY_安娅|r交谈
.turnin 12411 >>交任务: |cRXP_FRIENDLY_姐姐的誓言|r
.target Anya
step
.goto Grizzly Hills,69.10,40.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_休·格兰斯|r交谈
>>购买 |T132621:0|t狂吼好朗姆酒
.accept 12279 >>接任务: |cRXP_LOOT_熊的美食|r

.complete 11998,1 
.target Hugh Glass
step
#completewith next
.hs >>回到月溪旅营地
.cooldown item,6948,>2
step
.goto Grizzly Hills,59.80,27.57
>>返回月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Brugar|r交谈
.turnin 11998 >>交任务: |cRXP_FRIENDLY_灵活的手段|r
.accept 12002 >>接任务: |cRXP_LOOT_战斗中的兄弟|r
.target Brugar Stoneshear
step
#completewith JournalX
.goto Grizzly Hills,63.3,22.9,0
.goto Grizzly Hills,65.9,23.6,0
>>击杀该区域内的|cRXP_ENEMY_符文作战魔像|r
.complete 12002,1 
.mob Runic Battle Golem
step
.goto Grizzly Hills,63.68,23.14
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_倒下的土灵战士|r尸体交谈
.accept 11981 >>接任务: |cRXP_LOOT_找到库伦！|r
.target Fallen Earthen Warrior
step
#label JournalX
.goto Grizzly Hills,64.29,19.76
>>拾取地面上的|cRXP_PICK_journal|r
.accept 11986 >>接任务: |cRXP_LOOT_破损的日记|r
step
#completewith Golem
#label Pages
.goto Grizzly Hills,64.2,21.7,0
>>从索尔莫丹各地散落的卷轴中拾取|cRXP_PICK_8 遗失的日记书页|r
.collect 35737,8,11986,1 
step
#completewith Golem
#label Journal
#requires Pages
.goto Grizzly Hills,64.2,21.7,0
.use 35739 >>通过点击物品栏中的 |T133743:0|t[不完整的日记], 合并遗失的日记书页
.complete 11986,1 
step
#label Golem
.goto Grizzly Hills,63.3,22.9,60,0
.goto Grizzly Hills,65.9,23.6
>>击杀该区域内的|cRXP_ENEMY_符文作战魔像|r
.complete 12002,1 
.mob Runic Battle Golem
step
#completewith next
#label MJPage
#loop
.line Grizzly Hills,64.19,20.00,62.95,22.18,63.39,26.41,65.02,26.37,65.90,22.87,64.19,20.00
.goto Grizzly Hills,64.19,20.00,45,0
.goto Grizzly Hills,62.95,22.18,45,0
.goto Grizzly Hills,63.39,26.41,45,0
.goto Grizzly Hills,65.02,26.37,45,0
.goto Grizzly Hills,65.90,22.87,45,0
.goto Grizzly Hills,64.19,20.00,45,0
>>从索尔莫丹各地散落的卷轴中拾取|cRXP_PICK_8 遗失的日记书页|r
.collect 35737,8,11986,1 
step
#completewith next
.goto Grizzly Hills,59.80,27.57,0,0
.use 35739 >>通过点击物品栏中的 |T133743:0|t[不完整的日记], 合并遗失的日记书页
.complete 11986,1 
step
#requires MJPage
>>返回月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Torthen|r和|cRXP_FRIENDLY_Brugar|r交谈
.turnin 11986 >>交任务: |cRXP_FRIENDLY_破损的日记|r
.accept 11988 >>接任务: |cRXP_LOOT_符文钥石|r
.goto Grizzly Hills,59.76,27.44
.turnin 12002 >>交任务: |cRXP_FRIENDLY_战斗中的兄弟|r
.accept 12003 >>接任务: |cRXP_LOOT_寻找隧道|r
.goto Grizzly Hills,59.80,27.57
.target Torthen Deepdig
.target Brugar Stoneshear
step
#completewith next
.goto Grizzly Hills,65.1,19.4,0
.goto Grizzly Hills,66.0,17.0,0
.goto Grizzly Hills,68.6,15.3,0
>>击杀该区域的|cRXP_ENEMY_符文矮人|r, 击败他们以获取|cRXP_LOOT_钥匙之石碎片|r
.complete 11988,1 
.mob Iron Rune-Shaper
.mob Rune Reaver
step
#label EastB
>>|cRXP_WARN_深入索尔莫丹的建筑内部|r
.complete 12003,3 
.goto Grizzly Hills,63.37,28.60
.complete 12003,2 
.goto Grizzly Hills,66.79,24.57
.complete 12003,1 
.goto Grizzly Hills,62.64,20.67
step
.goto Grizzly Hills,65.1,19.4,70,0
.goto Grizzly Hills,66.0,17.0,70,0
.goto Grizzly Hills,68.6,15.3
>>击杀该区域的|cRXP_ENEMY_符文矮人|r, 击败他们以获取|cRXP_LOOT_钥匙之石碎片|r
.complete 11988,1 
.mob Iron Rune-Shaper
.mob Rune Reaver
step
>>返回月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Torthen|r和|cRXP_FRIENDLY_Brugar|r交谈
.turnin 11988 >>交任务: |cRXP_FRIENDLY_符文钥石|r
.accept 11993 >>接任务: |cRXP_LOOT_符文中的预言|r
.goto Grizzly Hills,59.76,27.44
.turnin 12003 >>交任务: |cRXP_FRIENDLY_寻找隧道|r
.accept 12010 >>接任务: |cRXP_LOOT_奥尔隆德的命运|r
.goto Grizzly Hills,59.80,27.57
.target Torthen Deepdig
.target Brugar Stoneshear
step
.groundgoto Grizzly Hills,61.5,18.3,100,0
.goto Grizzly Hills,65.77,17.78
>>前往山顶|cRXP_WARN_ABOVE|r索尔莫丹
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库伦|r交谈
.turnin 11981 >>交任务: |cRXP_FRIENDLY_找到库伦！|r
.accept 11982 >>接任务: |cRXP_LOOT_巨石横飞|r
.target Kurun
step
.goto Grizzly Hills,65.34,13.06,20,0
.goto Grizzly Hills,67.43,12.42,20,0
>>收集地面上的发光巨石|r
.collect 35734,5,11982,1,-1 
.use 35734 >>将 |T132384:0|t[巨石] 投掷到下方的|cRXP_ENEMY_铁矮人|r身上 5 次(|cRXP_WARN_它可能是同一个|r|cRXP_ENEMY_矮人|r). 如需更多, 可继续收集|cRXP_PICK_巨石|r
.complete 11982,1 
.goto Grizzly Hills,67.76,14.89
.mob Iron Rune-Shaper
.mob Rune Reaver
step
.goto Grizzly Hills,65.77,17.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库伦|r交谈
.turnin 11982 >>交任务: |cRXP_FRIENDLY_巨石横飞|r
.accept 12070 >>接任务: |cRXP_LOOT_鼓舞士气|r
.target Kurun
step
.goto Grizzly Hills,67.37,10.52,60,0
.goto Grizzly Hills,70.41,8.54,60,0
.goto Grizzly Hills,69.99,3.76
.use 36764 >>前往一个|cRXP_FRIENDLY_灰熊丘陵巨人|r, 使用背包中的 |T133451:0|t[大地碎片] 对其施放. 击杀随之生成的|cRXP_ENEMY_铁符文复仇者|r
.complete 12070,1 
.complete 12070,2 
.target Grizzly Hills Giant
.mob Iron Rune Avenger
step
.goto Grizzly Hills,65.77,17.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库伦|r交谈
.turnin 12070 >>交任务: |cRXP_FRIENDLY_鼓舞士气|r
.accept 11985 >>接任务: |cRXP_LOOT_攻破防线|r
.target Kurun
step
.goto Grizzly Hills,67.50,15.27
>>|cRXP_WARN_小心跳入索尔莫丹|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与尸体交谈:|cRXP_FRIENDLY_勘查员奥尔隆德|r
.turnin 12010 >>交任务: |cRXP_FRIENDLY_奥尔隆德的命运|r
.accept 12014 >>接任务: |cRXP_LOOT_坚如磐石？|r
.target Surveyor Orlond
step
#completewith next
.goto Grizzly Hills,67.5,15.5,0
>>击杀水中的|cRXP_ENEMY_Threshadons|r, 搜刮它们以获得|cRXP_LOOT_便携式测震仪|r
.complete 12014,2 
.mob Subterranean Thresher
step
>>|cRXP_WARN_点击墙上的字母阅读预言|r
.complete 11993,3 
.goto Grizzly Hills,68.52,16.21
.complete 11993,1 
.goto Grizzly Hills,68.99,14.43
step
#completewith end
#label Secondpr
.goto Grizzly Hills,70.18,14.68,0,0
>>|cRXP_WARN_点击墙上的字母阅读预言|r
.complete 11993,2 
step
.goto Grizzly Hills,70.0,14.0,20,0
.goto Grizzly Hills,67.5,15.5
>>击杀水中的|cRXP_ENEMY_Threshadons|r, 搜刮它们以获得|cRXP_LOOT_便携式测震仪|r
.complete 12014,2 
.mob Subterranean Thresher
step
#completewith end
#label Argrum
.goto Grizzly Hills,70.21,12.93,0,0
>>击杀|cRXP_ENEMY_铁领主阿格鲁姆|r
.complete 11985,1 
.mob Iron Thane Argrum
step
.goto Grizzly Hills,70.61,13.38
.use 35837 >>将背包中携带的 |T133870:0|t[便携式测震仪] 放置在桥边. 放置后, 拾取|cRXP_PICK_Stability Profile|r
.complete 12014,1 
step
#requires Argrum
.groundgoto Grizzly Hills,65.1,19.5,40,0
.groundgoto Grizzly Hills,60.9,19.8,70,0
.goto Grizzly Hills,65.77,17.78
>>离开索尔莫丹
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库伦|r交谈
.turnin 11985 >>交任务: |cRXP_FRIENDLY_攻破防线|r
.accept 12081 >>接任务: |cRXP_LOOT_加弗洛克|r
.target Kurun
step
#completewith Prophecies
.hs >>传送至月溪旅营地
.cooldown item,6948,>2
step
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安|r交谈
.goto Grizzly Hills,59.42,26.00
.accept 12770 >>接任务: |cRXP_LOOT_资源调配|r
.target Captain Gryan Stoutmantle
step
#label Prophecies
>>返回月溪旅营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Torthen|r和|cRXP_FRIENDLY_Brugar|r交谈
.turnin 11993 >>交任务: |cRXP_FRIENDLY_符文中的预言|r
.goto Grizzly Hills,59.76,27.44
.turnin 12014 >>交任务: |cRXP_FRIENDLY_坚如磐石？|r
.accept 12128 >>接任务: |cRXP_LOOT_找到莱加尔|r
.goto Grizzly Hills,59.80,27.57
.target Torthen Deepdig
.target Brugar Stoneshear
step
>>前往哈考尔营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈考尔|r和|cRXP_FRIENDLY_克拉斯|r交谈
.turnin 12190 >>交任务: |cRXP_FRIENDLY_跟我的小朋友打招呼|r
.accept 12113 >>接任务: |cRXP_LOOT_等肉下锅|r
.accept 12114 >>接任务: |cRXP_LOOT_心灵的创伤|r
.goto Grizzly Hills,73.77,34.02
.accept 12116 >>接任务: |cRXP_LOOT_孤胆英雄……|r
.goto Grizzly Hills,73.91,34.12
.target Harkor
.target Kraz
step
#completewith Gavrock12
.goto Grizzly Hills,72.5,33.1,0
.goto Grizzly Hills,65.8,33.3,0
.goto Grizzly Hills,68.8,32.9,0
.goto Grizzly Hills,75.8,39.2,0
>>击杀该区域的|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_觅食的灰狼|r. 击败它们后可获得|cRXP_LOOT_牛排|r和|cRXP_LOOT_肉|r
.complete 12113,1 
.complete 12113,2 
.mob Longhoof Grazer
.mob Duskhowl Prowler
step
#completewith next
.cast 43308 >>使用“寻鱼术”追踪北地鲑鱼群
.spellmissing 43308
step
#completewith next
.goto Grizzly Hills,81.1,36.3,0
.use 37542 >>在背包中使用 |T134325:0|t[渔网] 捕捞北地鲑鱼鱼群
.complete 12279,1 
step
#label Gavrock12
.goto Grizzly Hills,79.76,33.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与岛上的 |cRXP_FRIENDLY_加弗洛克|r 交谈
.turnin 12081 >>交任务: |cRXP_FRIENDLY_加弗洛克|r
.accept 12093 >>接任务: |cRXP_LOOT_压制符文|r
.target Gavrock
step
#questguide
>>前往血月岛, 击杀塞拉斯和瓦拉姆
.complete 12164,2 
.goto Grizzly Hills,85.94,27.91
.complete 12164,1 
.goto Grizzly Hills,84.91,23.31
.isOnQuest 12164
.mob Selas
.mob Varlam

step
#questguide
.groundgoto Grizzly Hills,86.34,23.88,40,0
.groundgoto Grizzly Hills,86.5,26.8,20,0
.goto Grizzly Hills,86.96,26.50
>>沿着小路向上走, 然后绕到城堡一侧. 击杀|cRXP_ENEMY_污血之喉|r
.complete 12164,3 
.unitscan Goremaw
step
#questguide
.groundgoto Grizzly Hills,86.82,25.85,15,0
.goto Grizzly Hills,87.65,26.48
>>进入影牙城堡. 前往顶层, 然后击杀|r阿鲁高|c
.complete 12164,4 
.mob Shade of Arugal
step
#completewith CJars
.goto Grizzly Hills,72.5,33.1,0
.goto Grizzly Hills,65.8,33.3,0
.goto Grizzly Hills,68.8,32.9,0
.goto Grizzly Hills,75.8,39.2,0
>>击杀该区域的|cRXP_ENEMY_觅食的灰狼|r和|cRXP_ENEMY_觅食的灰狼|r. 击败它们后可获得|cRXP_LOOT_牛排|r和|cRXP_LOOT_肉|r
.complete 12113,1 
.complete 12113,2 
.mob Longhoof Grazer
.mob Duskhowl Prowler
step
#completewith next
.goto Grizzly Hills,81.1,36.3,0
.use 37542 >>在背包中使用 |T134325:0|t[渔网] 捕捞北地鲑鱼鱼群
.complete 12279,1 
step
.goto Grizzly Hills,75.03,37.18
>>杀死紫色圆圈附近的铁符文织魔者. 当工头洛克里出现时, 将其击杀
.complete 12093,3 
.mob Iron Rune-Weaver
.mob Overseer Lochli
step
.goto Grizzly Hills,71.85,34.26
>>杀死紫色圆圈周围的铁符文织魔者. 当工头库尔甘出现时, 将其击杀
.complete 12093,2 
.mob Iron Rune-Weaver
.mob Overseer Korgan
step
.goto Grizzly Hills,67.52,29.46
>>击杀紫色圆圈附近的铁符文织魔者. 当工头多瓦尔出现时将其击杀
.complete 12093,1 
.mob Iron Rune-Weaver
.mob Overseer Durval
step
.goto Grizzly Hills,78.79,43.70
>>杀死紫色圆圈附近的铁符文织魔者. 当工头布隆诺出现时, 将其击杀
.complete 12093,4 
.mob Iron Rune-Weaver
.mob Overseer Brunon
step
#completewith Stones3
.goto Grizzly Hills,81.1,36.3,0
.use 37542 >>在背包中使用 |T134325:0|t[渔网] 捕捞北地鲑鱼鱼群
.complete 12279,1 
step
.goto Grizzly Hills,79.76,33.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加弗洛克|r交谈
.turnin 12093 >>交任务: |cRXP_FRIENDLY_压制符文|r
.accept 12094 >>接任务: |cRXP_LOOT_潜在的能量|r
.target Gavrock
step
#label Stones3
.use 36787 >>使用 |T134562:0|t[加弗洛克碎片] 对苍松岭周围发光的蓝色石头进行作用
.complete 12094,1 
.goto Grizzly Hills,71.25,39.73
step
.use 36787 >>使用 |T134562:0|t[加弗洛克碎片] 对苍松岭周围发光的蓝色石头进行作用
.complete 12094,3 
.goto Grizzly Hills,74.08,44.23
step
#completewith Gavrock4
.goto Grizzly Hills,81.1,36.3,0
.use 37542 >>在背包中使用 |T134325:0|t[渔网] 捕捞北地鲑鱼鱼群
.complete 12279,1 
step
.use 36787 >>使用 |T134562:0|t[加弗洛克碎片] 对苍松岭周围发光的蓝色石头进行作用
.complete 12094,2 
.goto Grizzly Hills,78.88,39.97
step
#label Gavrock4
.goto Grizzly Hills,79.76,33.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加弗洛克|r交谈
.turnin 12094 >>交任务: |cRXP_FRIENDLY_潜在的能量|r
.accept 12099 >>接任务: |cRXP_LOOT_终获解救|r
.target Gavrock
step
.goto Grizzly Hills,75.48,34.51,60,0
.goto Grizzly Hills,77.85,37.64,60,0
.goto Grizzly Hills,80.04,38.56,60,0
.goto Grizzly Hills,81.59,37.94,60,0
.goto Grizzly Hills,81.35,45.70,60,0
.goto Grizzly Hills,75.48,34.51
.use 37542 >>在背包中使用 |T134325:0|t[渔网] 捕捞北地鲑鱼鱼群
.complete 12279,1 
step
.goto Grizzly Hills,76.1,41.4,70,0
.goto Grizzly Hills,66.4,29.7
.use 36796 >>在你的背包中使用 |T134397:0|t[加夫洛克的符文破碎者] 对准|cRXP_ENEMY_符文巨人|r. |cRXP_WARN_如果失败且巨人仍处于敌对状态|r, |cRXP_WARN_请再次使用|r(|cRXP_WARN_直到它变为|r|cRXP_FRIENDLY_友好|r). |cRXP_WARN_在等待物品冷却期间, 请击杀怪物或完成其他任务|r
.complete 12099,1 
.mob Runed Giant
step
.goto Grizzly Hills,69.10,40.10
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_休·格兰斯|r交谈
.turnin 12279 >>交任务: |cRXP_FRIENDLY_熊的美食|r
.target Hugh Glass
step
#questguide
.goto Grizzly Hills,57.5,41.3
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨莎|r交谈
.turnin 12164 >>交任务: |cRXP_FRIENDLY_狼人的末日|r
.isQuestComplete 12164
.target Sasha
step
#completewith next
.abandon 12164 >>放弃狼人的末日
step
.goto Grizzly Hills,79.76,33.60
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加弗洛克|r交谈
.turnin 12099 >>交任务: |cRXP_FRIENDLY_终获解救|r
.target Gavrock
step
#completewith next
.goto Grizzly Hills,73.0,24.6,0
.goto Grizzly Hills,72.6,26.8,0
.goto Grizzly Hills,70.1,26.7,0
.goto Grizzly Hills,70.2,23.5,0
>>击杀该区域内的|cRXP_ENEMY_达卡莱先知|r 和|cRXP_ENEMY_守护者|r , 搜刮他们的|cRXP_LOOT_魔能|r
.complete 12114,1 
.complete 12114,2 
.collect 36758,5,12120,1 
.mob Drakkari Oracle
.mob Drakkari Protector
step
#label CJars
.goto Grizzly Hills,71.4,22.9,30,0
.goto Grizzly Hills,71.2,21.4,30,0
.goto Grizzly Hills,70.7,19.1
>>进入德拉基尔金遗迹
>>在充满幽灵的房间里拾取|cRXP_PICK_达卡莱之罐|r. |cRXP_WARN_尽量一次性拾取所有罐子, 以免激怒超过1个幽灵|r
.complete 12116,1 
step
.goto Grizzly Hills,69.49,17.47
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话:|cRXP_FRIENDLY_哈里森·琼斯|r, 然后开始护送任务
.accept 12082 >>接任务: |cRXP_LOOT_喔——哒！！|r
.timer 107,Campfire Room Closes
.target Harrison Jones
step
.goto Grizzly Hills,69.37,18.23
>>|cRXP_WARN_在篝火房关闭前, 迅速掠夺笼子所在房间内的|r|cRXP_PICK_德拉卡里石板|r|r
.complete 12068,1 
step
#completewith next
.goto Grizzly Hills,73.0,24.6,0
.goto Grizzly Hills,72.6,26.8,0
.goto Grizzly Hills,70.1,26.7,0
.goto Grizzly Hills,70.2,23.5,0
>>击杀该区域内的|cRXP_ENEMY_达卡莱先知|r 和|cRXP_ENEMY_守护者|r , 搜刮他们的|cRXP_LOOT_魔能|r
.complete 12114,1 
.complete 12114,2 
.collect 36758,5,12120,1 
.mob Drakkari Oracle
.mob Drakkari Protector
step
#label Harrison
.goto Grizzly Hills,70.5,17.7,25,0
.goto Grizzly Hills,73.52,24.02
>>|cRXP_WARN_请待在篝火房间以应对|r|cRXP_ENEMY_蛇|r事件. 优先击杀小怪, 同时让|r|cRXP_FRIENDLY_Harrison|r对|r|cRXP_ENEMY_蛇|r建立仇恨. 小怪清理完毕后, 再击杀|r|cRXP_ENEMY_蛇|r(|cRXP_WARN_如果你实力足够强大, 也可直接击杀|r|cRXP_ENEMY_蛇|r)
>>|cRXP_WARN_跟随|r|cRXP_FRIENDLY_哈里森|r|cRXP_WARN_离开废墟|r
.complete 12082,1 
.target Harrison Jones
.mob Tecahuna
step
.goto Grizzly Hills,73.0,24.6,70,0
.goto Grizzly Hills,72.6,26.8,70,0
.goto Grizzly Hills,70.1,26.7,70,0
.goto Grizzly Hills,73.0,24.6,70,0
.goto Grizzly Hills,72.6,26.8,70,0
.goto Grizzly Hills,70.1,26.7,70,0
.goto Grizzly Hills,70.2,23.5
>>击杀该区域内的|cRXP_ENEMY_达卡莱先知|r 和|cRXP_ENEMY_守护者|r , 搜刮他们的|cRXP_LOOT_魔能|r
.complete 12114,1 
.complete 12114,2 
.collect 36758,5,12120,1 
.mob Drakkari Oracle
.mob Drakkari Protector
step
#completewith next
.goto Grizzly Hills,68.8,32.9,0
.goto Grizzly Hills,75.8,39.2,0
>>击杀该区域的|cRXP_ENEMY_Shovelhorns|r. 从他们身上搜刮出|cRXP_LOOT_牛排|r
.complete 12113,2 
.mob Longhoof Grazer
step
.goto Grizzly Hills,72.5,33.1,60,0
.goto Grizzly Hills,65.8,33.3
>>击杀该区域内的|cRXP_ENEMY_觅食的灰狼|r. 搜刮他们的|cRXP_LOOT_肉|r
.complete 12113,1 
.mob Duskhowl Prowler
step
.goto Grizzly Hills,68.84,32.96,60,0
.goto Grizzly Hills,77.90,43.10,60,0
.goto Grizzly Hills,78.40,39.37,60,0
.goto Grizzly Hills,69.64,38.64
>>击杀该区域的|cRXP_ENEMY_Shovelhorns|r. 从他们身上搜刮出|cRXP_LOOT_牛排|r
.complete 12113,2 
.mob Longhoof Grazer
step
>>返回哈考尔营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈考尔|r和|cRXP_FRIENDLY_克拉斯|r交谈
.turnin 12113 >>交任务: |cRXP_FRIENDLY_等肉下锅|r
.turnin 12082 >>交任务: |cRXP_FRIENDLY_喔——哒！！|r
.turnin 12114 >>交任务: |cRXP_FRIENDLY_心灵的创伤|r
.goto Grizzly Hills,73.77,34.02,-1
.turnin 12116 >>交任务: |cRXP_FRIENDLY_孤胆英雄……|r
.accept 12120 >>接任务: |cRXP_LOOT_达卡古尔之槌|r
.goto Grizzly Hills,73.91,34.12,-1
.target Harkor
.target Kraz
step
.goto Grizzly Hills,71.54,29.78,50,0
.goto Grizzly Hills,73.69,29.72
.line Grizzly Hills,71.54,29.78,,73.69,29.72
>>击杀|cRXP_ENEMY_Drak'aguul|r. 击败他后可拾取他的|cRXP_LOOT_Mallet|r
.complete 12120,1 
.unitscan Drak'aguul
step
.goto Grizzly Hills,73.91,34.12
>>返回哈考尔营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉斯|r交谈
.turnin 12120 >>交任务: |cRXP_FRIENDLY_达卡古尔之槌|r
.accept 12121 >>接任务: |cRXP_LOOT_死后相见|r
.target Kraz
step
.goto Grizzly Hills,71.74,26.20
>>前往火盆(|cRXP_WARN_NOT 不是被三个锣包围的火堆|r). 使用 |T134812:0|t[德拉库鲁斯药剂]
.use 35797 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达库鲁|r交谈
.turnin 12068 >>交任务: |cRXP_FRIENDLY_灰尘之声|r

.target Drakuru
step
.goto Grizzly Hills,71.41,24.55
.use 36834 >>前往德拉基恩废墟的三座铜锣处. 使用背包中的 |T133474:0|t[充能的德拉基恩战锤]
.cast 47701
.timer 13,See You on the Other Side RP
.complete 12121,1 
step
.goto Grizzly Hills,71.4,22.9,30,0
.goto Grizzly Hills,71.2,21.4,30,0
.goto Grizzly Hills,69.41,19.48
>>进入达基尔金废墟(|cRXP_WARN_你可以在幽灵形态下施放法术|r)
>>进入你护送|cRXP_FRIENDLY_Harrison|r离开的那个房间之前的主室
.use 36834 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gan'jo|r交谈. (|cRXP_WARN_如果意外丢失了|r |T132094:0|t“彼岸”|cRXP_WARN_buff|r, 请再次使用铜锣)
.link /console ffxDeath 0 >>如果因鬼影效果看不清, 请复制粘贴此命令(点击这里), 然后输入 /reload
.turnin 12121 >>交任务: |cRXP_FRIENDLY_死后相见|r
.accept 12137 >>接任务: |cRXP_LOOT_冷静一下，伙计|r
.target Gan'jo
step
.goto Grizzly Hills,69.36,19.57
>>在迷你喷泉状结构内拾取|cRXP_PICK_green箱子|r
.complete 12137,1 
step
.goto Grizzly Hills,69.41,19.48,9,0
.goto Grizzly Hills,71.4,19.9
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t再次与|cRXP_FRIENDLY_Gan'jo|r交谈. |cRXP_WARN_请他将你送回生者世界|r
.use 36859 >>在你获得罐子的房间中, 对|cRXP_ENEMY_远古德拉卡里斯|r使用 |T133850:0|t[永恒休眠之雪], 然后拾取它们跑来的|cRXP_PICK_木乃伊|r
.complete 12137,2 
.skipgossip
.target Gan'jo
.mob Ancient Drakkari Soothsayer
.mob Ancient Drakkari Warmonger
step
.goto Grizzly Hills,73.91,34.12
>>返回哈考尔营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉斯|r交谈
.turnin 12137 >>交任务: |cRXP_FRIENDLY_冷静一下，伙计|r
.accept 12152 >>接任务: |cRXP_LOOT_金亚拉克的末日|r
.target Kraz
step
#completewith end
#label SacreD
.goto Grizzly Hills,71.4,22.9,30,0
.goto Grizzly Hills,71.2,21.4,30,0
.goto Grizzly Hills,71.25,19.66
>>进入达基尔金废墟
>>拾取房间东北墙上的|cRXP_PICK_水果碗|r
.collect 36870,1 
step
#requires SacreD
#completewith next
.goto Grizzly Hills,71.4,22.9,30,0
.goto Grizzly Hills,71.41,24.55
.use 36873 >>使用你背包中的 |T132123:0|t[达卡莱灵魂之尘], 制作出 |T134056:0|t灌注能量的达卡莱供品
.collect 37063,1 
step
#requires SacreD
.goto Grizzly Hills,71.41,24.55
.use 37063 >>回到达基尔金废墟外的三座铜锣处, 使用 |T134056:0|t[灌注能量的达卡莱供品]
.complete 12152,1 
step
.goto Grizzly Hills,73.91,34.12
>>返回哈考尔营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉斯|r交谈
.turnin 12152 >>交任务: |cRXP_FRIENDLY_金亚拉克的末日|r
.target Kraz
step
>>前往勘探员哨站
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kilian|r和|cRXP_FRIENDLY_Raegar|r交谈
.turnin 12128 >>交任务: |cRXP_FRIENDLY_找到莱加尔|r
.accept 12129 >>接任务: |cRXP_LOOT_完美的计划|r
.goto Grizzly Hills,77.09,48.64
.accept 12180 >>接任务: |cRXP_LOOT_被俘虏的勘探员|r
.goto Grizzly Hills,76.97,48.44
.target Mountaineer Kilian
.target Raegar Breakbrow
step
#completewith Varana
#label Blueprints
.goto Grizzly Hills,81.5,60.3,0
.goto Grizzly Hills,76.3,62.9,0
.goto Grizzly Hills,75.0,57.0,0
>>击杀该区域的铁符文铸造师. 掠夺他们以获取机械傀儡蓝图
.collect 36849,1,12129,1 
.collect 36850,1,12129,1 
.collect 36851,1,12129,1 
.mob Iron Rune-Smith
step
#completewith next
#requires Blueprints
.use 36849 >>点击背包中的任意一个 |T134331:0|t[作战魔像蓝图碎片], 将其合成完整的 |T134332:0|t作战魔像蓝图
.complete 12129,1 
step
#label Varana
>>击杀|cRXP_ENEMY_Overseers|r和|cRXP_ENEMY_作战傀儡|r和|cRXP_ENEMY_Sentries|r. 从他们身上搜刮|cRXP_LOOT_丹厄古尔牢笼钥匙|r
>>使用|cRXP_LOOT_钥匙|r解救被关在建筑笼子里的|cRXP_FRIENDLY_勘探员甘恩|r, 以及在外面的|cRXP_FRIENDLY_勘探员托尔根|r和|cRXP_FRIENDLY_勘探员瓦拉纳|r
.collect 37013,3,12180,7,-1 
.complete 12180,1 
.goto Grizzly Hills,76.46,55.43
.complete 12180,2 
.goto Grizzly Hills,76.35,58.53
.complete 12180,3 
.goto Grizzly Hills,76.06,61.07
.mob Iron Rune Overseer
.mob Runic Lightning Gunner
.mob Runic War Golem
.mob Lightning Sentry
.target Prospector Gann
.target Prospector Torgan
.target Prospector Varana
step
.goto Grizzly Hills,76.68,63.62,30,0
.goto Grizzly Hills,76.77,58.73,30,0
.goto Grizzly Hills,75.19,57.22,30,0
.goto Grizzly Hills,76.56,55.09
>>击杀该区域的铁符文铸造师. 掠夺他们以获取机械傀儡蓝图
.collect 36849,1,12129,1 
.collect 36850,1,12129,1 
.collect 36851,1,12129,1 
.mob Iron Rune-Smith
step
.goto Grizzly Hills,77.09,48.64
.use 36849 >>点击背包中的任意一个 |T134331:0|t[作战魔像蓝图碎片], 将其合成完整的 |T134332:0|t作战魔像蓝图
.complete 12129,1 
step
>>前往勘探员哨站
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Raegar|r和|cRXP_FRIENDLY_Kilian|r交谈
.turnin 12129 >>交任务: |cRXP_FRIENDLY_完美的计划|r
.accept 12130 >>接任务: |cRXP_LOOT_抢夺零件|r
.goto Grizzly Hills,77.09,48.64
.turnin 12180 >>交任务: |cRXP_FRIENDLY_被俘虏的勘探员|r
.accept 12183 >>接任务: |cRXP_LOOT_搜集制服|r
.goto Grizzly Hills,76.97,48.44
.target Raegar Breakbrow
.target Mountaineer Kilian
step
#completewith next
.goto Grizzly Hills,76.2,62.8,0
>>拾取|cRXP_PICK_作战魔像零件|r, 这些零件主要散落在丹厄古尔主楼的中层和顶层. |cRXP_WARN_请勿下楼|r
.complete 12130,1 
step
.goto Grizzly Hills,75.99,57.88,30,0
.goto Grizzly Hills,77.81,59.06,30,0
.goto Grizzly Hills,79.13,59.52
>>击杀一名|cRXP_ENEMY_铁符文监工|r. 搜刮他的|cRXP_LOOT_制服|r
.complete 12183,1 
.mob Iron Rune Overseer
step
.goto Grizzly Hills,75.77,57.02,40,0
.goto Grizzly Hills,75.49,58.20,40,0
.goto Grizzly Hills,73.56,60.02,40,0
.goto Grizzly Hills,76.18,62.77,30,0
.goto Grizzly Hills,77.07,62.52,30,0
.goto Grizzly Hills,75.90,63.94,30,0
.goto Grizzly Hills,75.99,57.88
>>拾取|cRXP_PICK_作战魔像零件|r, 这些零件主要散落在丹厄古尔主楼的中层和顶层. |cRXP_WARN_请勿下楼|r
.complete 12130,1 
step
>>返回勘探员哨站
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Raegar|r和|cRXP_FRIENDLY_Kilian|r交谈
.turnin 12130 >>交任务: |cRXP_FRIENDLY_抢夺零件|r
.accept 12131 >>接任务: |cRXP_LOOT_我们有能源|r
.goto Grizzly Hills,77.09,48.64
.turnin 12183 >>交任务: |cRXP_FRIENDLY_搜集制服|r
.accept 12184 >>接任务: |cRXP_LOOT_拍摄照片|r
.goto Grizzly Hills,76.97,48.44
.target Raegar Breakbrow
.target Mountaineer Kilian
step
#completewith next
.goto Grizzly Hills,76.2,62.8,0
.use 37045 >>在杜恩阿戈尔击杀钢铁矮人. 使用背包中的[基利安的相机]对他们的尸体进行检查
.complete 12184,1 
.mob Iron Rune Overseer
.mob Iron Rune-Smith
.mob Runic Lightning Gunner
step
>>进入任意一座建筑内
>>击杀|r符文铸造师杜拉尔|r和|r符文铸造师卡尔索恩|r, 从他们身上搜刮|r能量核心|r
.complete 12131,1 
.goto Grizzly Hills,74.89,56.91,-1
.complete 12131,2 
.goto Grizzly Hills,76.83,59.35,-1
.mob Rune-Smith Durar
.mob Rune-Smith Kathorn
step
.goto Grizzly Hills,76.52,55.06,30,0
.goto Grizzly Hills,76.68,63.61
.use 37045 >>在杜恩阿戈尔击杀钢铁矮人. 使用背包中的[基利安的相机]对他们的尸体进行检查
.complete 12184,1 
.mob Iron Rune Overseer
.mob Iron Rune-Smith
.mob Runic Lightning Gunner
step
>>返回勘探员哨站
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Raegar|r和|cRXP_FRIENDLY_Kilian|r交谈
.turnin 12131 >>交任务: |cRXP_FRIENDLY_我们有能源|r
.accept 12138 >>接任务: |cRXP_LOOT_……我们没有能源|r
.goto Grizzly Hills,77.09,48.64
.turnin 12184 >>交任务: |cRXP_FRIENDLY_拍摄照片|r
.accept 12185 >>接任务: |cRXP_LOOT_笑脸面对洛肯！|r
.goto Grizzly Hills,76.97,48.44
.target Raegar Breakbrow
.target Mountaineer Kilian
step
.goto Grizzly Hills,75.55,50.72,60,0
.goto Grizzly Hills,73.21,51.94,60,0
.goto Grizzly Hills,73.30,57.38
.use 36936 >>使用背包中的 |T133015:0|t[魔像控制器]. 先用|cRXP_FRIENDLY_能量枯竭的作战魔像|r击杀|cRXP_ENEMY_雷霆哨卫|r(距离在|cRXP_WARN_30码或以内|r), 然后等待它(|cRXP_WARN_再次|r, 距离在|cRXP_WARN_30码或以内|r)收集|cRXP_PICK_哨卫的充能|r
>>要小心, 因为|cRXP_ENEMY_雷霆哨兵|r对自然属性免疫 << Shaman/Druid
.complete 12138,1 
.mob Lightning Sentry
step
#completewith next
.cast 48064 >>骑上坐骑, 然后在背包中使用 |T133665:0|t[监工伪装包]
step
.groundgoto Grizzly Hills,78.20,59.20,60,0
.goto Grizzly Hills,81.60,60.34
.cast 3365 >>|cRXP_WARN_伪装时请勿施放任何法术|r. 骑乘前往最东边的建筑并点击|cRXP_PICK_洛肯的底座|r. |cRXP_WARN_请勿等待剧情事件结束|r
.timer 24,Message from Loken RP

.use 37071
step
>>返回勘探员哨站
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Raegar|r和|cRXP_FRIENDLY_Kilian|r交谈
.turnin 12138 >>交任务: |cRXP_FRIENDLY_……我们没有能源|r
.accept 12153 >>接任务: |cRXP_LOOT_铁领主和他的保镖|r
.accept 12154 >>接任务: |cRXP_LOOT_停电|r
.goto Grizzly Hills,77.09,48.64
.turnin 12185 >>交任务: |cRXP_FRIENDLY_笑脸面对洛肯！|r
.goto Grizzly Hills,76.97,48.44
.target Raegar Breakbrow
.target Mountaineer Kilian
step
#completewith next
.goto Grizzly Hills,75.95,63.28
.vehicle >>前往顶层建筑, 乘电梯下到底层. 使用 |T133015:0|t[魔像控制器]
.use 36865
step
>>使用 |T136099:0|t“EMP”(2)移除|cRXP_ENEMY_Furyhammer|r的无敌状态并击晕|cRXP_ENEMY_铁砧|r. 持续施放 |T136049:0|t“充能猛击”(1), 并右键攻击以击杀|cRXP_ENEMY_Furyhammer|r
.complete 12153,1 
.goto Grizzly Hills,76.36,63.72
.use 36865
.mob Iron Thane Furyhammer
step
>>|cRXP_WARN_离开地精傀儡|r
.use 36935 >>在你的背包中使用 |T133715:0|t[雷加的炸药], 放置于底层中央以摧毁能量核心
.complete 12154,1 
.goto Grizzly Hills,76.46,63.25
.use 36865
step
.goto Grizzly Hills,77.09,48.64
>>返回勘探员哨站
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱加尔·断眉|r交谈
.turnin 12153 >>交任务: |cRXP_FRIENDLY_铁领主和他的保镖|r
.turnin 12154 >>交任务: |cRXP_FRIENDLY_停电|r
.target Raegar Breakbrow
step << Druid
#completewith DruidTrain2
.cast 18960 >>传送术:月光林地
.zoneskip Moonglade
.xp <75,1
step << Druid
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48440 >>训练你的职业法术
.xp <75,1
.target Loganaar
step << Druid
#label DruidTrain2
.goto Moonglade,52.53,40.57
>>前往月光林地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
.train 48443 >>训练你的职业法术
.xp <77,1
.target Loganaar
step << DK
#completewith DKTrain2
.cast 50977 >>施放死亡之门
.zoneskip Eastern Plaguelands
.xp <75,1
step << DK
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49923 >>训练你的职业法术
.xp <75,1
.target Amal'thazad
step << DK
#label DKTrain2
.goto Eastern Plaguelands,80.30,48.01
>>前往: |cRXP_PICK_东瘟疫之地|r
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛尔萨扎德|r交谈
.train 49894 >>训练你的职业法术
.xp <76,1
.target Amal'thazad
step << Mage
#completewith MageTrain2
.zone Stormwind City >>前往: |cRXP_PICK_暴风城|r
.xp <75,1
step << Mage
.goto Stormwind City,49.55,85.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42955 >>训练你的职业法术
.xp <75,1
.target Elsharin
.target Jennea Cannon
step << Mage
.goto Stormwind City,49.55,85.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42920 >>训练你的职业法术
.xp <76,1
.target Elsharin
.target Jennea Cannon
step << Mage
#label MageTrain2
.goto Stormwind City,49.55,85.80
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jennea|r交谈
.train 42985 >>训练你的职业法术
.xp <77,1
.target Elsharin
.target Jennea Cannon
step << Shaman/Druid/DK/Mage
#completewith next
.hs >>传送至月溪旅营地
step
#completewith next
.goto Grizzly Hills,59.89,26.69
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨缪尔|r交谈
.fly Amberpine Lodge >>飞往琥珀松木营地
.noflyable Grizzly Hills,300
.target Samuel Clearbook
step
#questguide
.goto Grizzly Hills,31.16,59.47
>>返回琥珀松木营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thayreen|r交谈
.turnin 12248 >>交任务: |cRXP_FRIENDLY_沃达希尔的树苗|r
.turnin 12250 >>交任务: |cRXP_FRIENDLY_沃达希尔的种子|r
.turnin 12249 >>交任务: |cRXP_FRIENDLY_乌索克，巨熊之神|r
.isQuestComplete 12249
.target Hierophant Thayreen
step
#label end
.goto Grizzly Hills,31.16,59.47
>>返回琥珀松木营地
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thayreen|r交谈
.turnin 12248 >>交任务: |cRXP_FRIENDLY_沃达希尔的树苗|r
.turnin 12250 >>交任务: |cRXP_FRIENDLY_沃达希尔的种子|r
.target Hierophant Thayreen
step << DK/Mage/Druid
.goto Grizzly Hills,31.31,59.11
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦娜|r交谈
.fly Westfall Brigade >>飞往月溪旅营地
.target Vana Grey
step << !DK !Mage !Druid
#completewith next
.goto Grizzly Hills,32.00,59.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_达拉然|r
.target Magistrix Haelenai
.accept 12794 >>接任务: |cRXP_LOOT_魔法王国达拉然|r
.zoneskip Stormwind City
.zoneskip Dalaran
.target Magistrix Haelenai
step << !DK !Mage !Druid
.goto Grizzly Hills,32.00,59.78
.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
.target Magistrix Haelenai
.zoneskip Stormwind City
.skipgossip
step << !DK !Druid !Mage
.abandon 12794 >>放弃魔法王国达拉然. |cRXP_WARN_请勿提交此任务|r
step << Rogue/Warlock/Priest/Paladin
#completewith next
.goto Dalaran,38.65,59.33,15,0
.goto Dalaran,39.48,63.98
.zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
step << Rogue/Warlock
#completewith next
.goto Ironforge,40.10,12.16,30,0
.goto Ironforge,52.92,12.82,10,0 << Rogue
.goto Ironforge,50.20,7.46,10 >>进入建筑内部 << Warlock
.goto Ironforge,51.88,14.30,10 >>进入建筑内部 << Rogue
step << Warlock
.goto Ironforge,50.35,5.66
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞尔索恩|r交谈
.target Briarthorn
.train 47813 >>训练你的职业法术
.xp <77,1
step << Rogue
.goto Ironforge,51.50,15.33
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_芬斯维克|r交谈
.target Fenthwick
.train 48637 >>训练你的职业法术
.xp <76,1
step << Priest
.goto Ironforge,24.40,9.17
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布莱纳·火崖|r交谈
.target Braenna Flintcrag
.train 48124 >>训练你的职业法术
.xp <75,1
step << Paladin
.goto Ironforge,24.55,4.47,-1
.goto Ironforge,23.11,6.13,-1
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝尔杜克·凝眉|r或|cRXP_FRIENDLY_布兰度尔·铁锤|r交谈
.target Beldruk Doombrow
.target Brandur Ironhammer
.train 48818 >>训练你的职业法术
.xp <75,1
step << Shaman/Hunter/Warrior
#completewith next
.goto Dalaran,38.65,59.33,15,0
.goto Dalaran,38.21,66.36
.zone The Exodar >>前往: |cRXP_PICK_埃索达|r
step << Shaman
#completewith ShamanTraining2
.goto The Exodar,35.15,48.76,20,0
.goto The Exodar,34.96,43.68,20 >>前往|cRXP_FRIENDLY_古尔拉格|r
step << Shaman
.goto The Exodar,24.27,39.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古尔拉格|r交谈
.target Gurrag
.train 49280 >>训练你的职业法术
.xp 75,1
step << Shaman
#label ShamanTraining2
.goto The Exodar,24.27,39.68
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古尔拉格|r交谈
.target Gurrag
.train 58803 >>训练你的职业法术
.xp 75,1
step << Hunter/Warrior
#completewith next
.goto The Exodar,46.17,72.79,20,0
.goto The Exodar,49.21,74.94,20,0
.goto The Exodar,53.74,85.39,30,0 << Warrior
.goto The Exodar,53.74,85.39,30 >>前往|cRXP_FRIENDLY_德雷米斯|r << Hunter
.goto The Exodar,50.87,80.83,15,0 << Warrior
.goto The Exodar,54.07,78.05,15 >>前往|cRXP_FRIENDLY_贝霍玛特|r << Warrior
step << Hunter
.goto The Exodar,47.07,86.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德雷米斯|r交谈
.target Deremiis
.train 61005 >>训练你的职业法术
.xp <75,1
step << Hunter
.goto The Exodar,47.07,86.92
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德雷米斯|r交谈
.target Deremiis
.train 53338 >>训练你的职业法术
.xp <76,1
step << Warrior
.goto The Exodar,55.58,82.31
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贝霍玛特|r交谈
.target Behomat
.train 55694 >>训练你的职业法术
.xp <75,1
step << !DK !Druid !Mage
#completewith ZulDrak
.hs >>传送至月溪旅营地
step
.goto Grizzly Hills,59.42,26.00
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安|r交谈
.accept 12770 >>接任务: |cRXP_LOOT_资源调配|r
.target Captain Gryan Stoutmantle
step
#label ZulDrak
.goto Grizzly Hills,59.89,26.69
.zone Zul'Drak >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_祖达克|r
.skipgossip 26876,2
.target Samuel Clearbook
]])
RXPGuides.RegisterGuide([[
#cata
#mop
#wotlk
#speedrunguide
#xprate >1.49 << wotlk
#group RestedXP 熊猫人之谜 60-80 (联盟)
<< Alliance
#name 74-75 灰熊丘陵
#displayname 74-75 灰熊丘陵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 9
#next 75-76 祖达克
#xprate <1.6 << !wotlk
step
#optional
.maxlevel 75,GotoSholazar
step
#include 73-75 灰熊丘陵@pt1start-pt1end
step
.goto 116/571,-2812.200,3418.200
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伐木工德拉克|r交谈
.target Woodsman Drake
.turnin 12255 >>交任务: |cRXP_FRIENDLY_沃德伦的领主|r
step
#optional
.maxlevel 75,GotoSholazar
step
#include 73-75 灰熊丘陵@pt2start-pt2end
step
.goto Grizzly Hills,26.46,31.74
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与笼中的|cRXP_FRIENDLY_囚犯|r交谈
.turnin 12302 >>交任务: |cRXP_FRIENDLY_萨莎的警告|r
>>|cRXP_WARN_跳过后续任务|r
.target Caged Prisoner
step
#optional
.maxlevel 75,GotoSholazar
step
.goto ZulDrak,32.18,74.39
.zone ZulDrak >>前往西北方向的祖达克
step
#optional
#label GotoSholazar
step
#completewith next
.goto Grizzly Hills,32.00,59.78
>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往: |cRXP_PICK_达拉然|r
.target Magistrix Haelenai
.accept 12794 >>接任务: |cRXP_LOOT_魔法王国达拉然|r
.zoneskip Grizzly Hills,1
.xp <76,1
step
.goto Grizzly Hills,32.00,59.78
.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
.target Magistrix Haelenai
.skipgossip
.zoneskip Grizzly Hills,1
.xp <76,1
]])
