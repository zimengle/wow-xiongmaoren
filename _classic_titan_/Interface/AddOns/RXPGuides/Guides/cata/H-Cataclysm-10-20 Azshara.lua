local _,addon = ...
if addon.game ~= "CATA" or addon.player.faction ~= 'Horde' then return end

RXPGuides.RegisterGuide([[
#cata
<< Horde
#name 10-22 艾萨拉
#displayname 11-22 Azshara << Goblin
#next 22-27 灰谷
#version 1
--#group RXP 大灾变 (H)
#group RXP 大灾变 1-80（H）
#sub重量 10000

step << Rogue/Warlock/Mage
    #completewith next
    .goto 1454,45.81,66.88,40 >>前往暗影裂隙
step << Priest/Paladin
    #completewith next
    .goto 1454,49.88,75.54,30 >>进入格罗玛什要塞
step << Shaman/Druid
    #completewith next
    .goto 1454,44.84,75.46,40,0
    .goto 1454,41.53,60.64,40 >>前往智慧谷
step << Rogue
    .goto 1454,44.65,61.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈达尔|r
    .train 61922 >>训练你的职业法术
    .target Gordul
step << Rogue
    .goto 1454,29.60,50.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷库尔|r
    >>|cRXP_BUY_从他那里购买|r |T132273:0|t[速效毒药] |cRXP_BUY_|r
    .collect 6947,20,14129,1 --Instant Poison (20)
    .target Rekkul
step << Shaman
    .goto 1454,44.64,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎伊·云歌|r
    .train 3599 >>训练你的职业法术
    .target Sahi Cloudsinger
    .xp <10,1
step << Druid
    .goto 1454,44.79,51.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎乌拉·白叶|r
    .train 5215 >>训练你的职业法术
    .target Shalla Whiteleaf
    .xp <10,1
step << Mage
    .goto 1454,48.45,62.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛鲁德|r
    .train 5505 >>训练你的职业法术
    .target Marud
    .xp <10,1
step << Priest
    .goto 1454,49.17,70.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_提耶利斯|r
    .train 8092 >>训练你的职业法术
    .target Tyelis
    .xp <10,1
step << Warlock
    .goto 1454,54.49,39.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米尔科特|r
    .train 1120 >>训练你的职业法术
    .target Mirket
    .xp <10,1
step << Paladin
    .goto 1454,49.27,71.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_派雷亚诺|r
    .train 82242 >>训练你的职业法术
    .target Master Pyreanor
    .xp <10,1
step
    #completewith next
    .goto 1454,59.59,50.63,40,0
    .goto 1454,65.39,49.14,40 >>前往荣誉谷
step << !Goblin
    .goto 1454,66.433,49.292
    >>点击 |cRXP_PICK_Warchief 的命令板|r
    .accept 28496 >>接任务: |cRXP_WARN_酋长的命令：艾萨拉！|r
    .isQuestAvailable 28496
step << !Warrior !Paladin !Rogue !Hunter !Shaman
    #completewith next
    .goto 1454,66.84,50.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_基罗|r
    .vendor >>供应商和维修
    .target Kiro
step << Warrior
    .goto 1454,73.71,45.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_罗纳卡达|r
    .train 71 >>训练你的职业法术
    .target Blademaster Ronakada
    .xp <10,1
step << Warrior/Paladin
    .goto 1454,76.38,37.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考鲁|r
    .vendor >>出售武器并进行修理。如果武器能给你足够的钱购买 |T133477:0|t[巨型狼牙棒] (24 秒)，就卖掉它 << Orc/Troll
    .vendor >>出售武器并进行修理。如果武器能给你足够的钱购买 |T133477:0|t[巨型狼牙棒] (25s 34c)，就卖掉它 << Tauren
    .vendor >>出售武器并进行修理。如果武器能给你足够的钱购买 |T133477:0|t[巨型狼牙棒] (26s 67c)，就卖掉它 << Undead/BloodElf
    .vendor >>出售武器并进行修理。如果武器能给你足够的钱购买 |T133477:0|t[巨型狼牙棒] (21s 34c)，就卖掉它 << Goblin
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.9
    .target Koru
step << Warrior/Paladin
    .goto 1454,76.38,37.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_考鲁|r
    >>|cRXP_BUY_从他那里购买|r|T133477:0|t[巨型狼牙棒] |cRXP_BUY_|r
    .collect 1197,1,14129,1 --Collect Giant Mace (1)
    .money <0.2400 << Orc/Troll
    .money <0.2534 << Tauren
    .money <0.2667 << Undead/BloodElf
    .money <0.2134 << Goblin
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.9
    .target Koru
step << Shaman
    .goto 1454,76.12,37.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索玛|r
    >>|cRXP_WARN_如果您没有选择增强专业化，请跳过此步骤！|r
    .vendor >>出售武器并进行修理。如果武器能给你足够的钱购买 |T132938:0|t[右手指关节铜套] (19s 17c) 和 |T132938:0|t[左手指关节铜套] [19s 24c]，就卖掉它 << Orc/Troll
    .vendor >>出售武器并进行修理。如果武器能给你足够的钱购买 |T132938:0|t[右手指关节铜套] (20s 24c) 和 |T132938:0|t[左手指关节铜套] [20s 31c]，就卖掉它 << Tauren
    .vendor >>出售武器并进行修理。如果武器能给你足够的钱购买 |T132938:0|t[右手指关节铜套] (17s 4c) 和 |T132938:0|t[左手指关节铜套] [17s 10c]，就卖掉它 << Goblin
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
    .target Shoma
step << Shaman
    .goto 1454,76.12,37.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索玛|r
    >>|cRXP_BUY_从他那里购买|r |T132938:0|t[右手指关节铜套] |cRXP_BUY_和|r |T132938:0|t[左手指关节铜套] |cRXP_BUY_|r
    >>|cRXP_WARN_如果您没有选择增强专业化，请跳过此步骤！|r
    .collect 15905,1,14129,1 --Collect Right-Handed Brass Knuckles (1)
    .collect 15906,1,14129,1 --Collect Left-Handed Brass Knuckles (1)
    .money <0.3841 << Orc/Troll
    .money <0.4045 << Tauren
    .money <0.3450 << Goblin
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
    .target Shoma
step << Hunter
    .goto 1454,75.08,36.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_森度吉安|r
    .vendor >>出售武器并进行维修。如果武器能给你带来足够的钱购买 |T135489:0|t[层压反曲弓] (15s 76c)，就卖掉它 << Orc/Troll
    .vendor >>出售武器并进行修理。如果武器能给你足够的钱购买 |T135489:0|t[层压反曲弓] (16s 64c)，就卖掉它 << Tauren
    .vendor >>出售武器并进行修理。如果武器能给你足够的钱购买 |T135489:0|t[层压反曲弓] (17s 52c)，就卖掉它 << Undead/BloodElf
    .vendor >>出售武器并进行维修。如果武器能给你足够的钱购买 |T135489:0|t[层压反曲弓] (14s 2c)，就卖掉它 << Goblin
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
    .target Zendo'jian
    .xp <11,1
step << Hunter
    .goto 1454,75.08,36.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_森度吉安|r
    >>|cRXP_BUY_从他那里购买 a|r |T135489:0|t[层压反曲弓] |cRXP_BUY_|r
    .collect 2507,1,14129,1 --Laminated Recurve Bow (1)
    .money <0.1576 << Orc/Troll
    .money <0.1664 << Tauren
    .money <0.1752 << Undead/BloodElf
    .money <0.1402 << Goblin
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
    .target Zendo'jian
step << Rogue
    .goto 1454,76.12,37.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索玛|r
    .vendor >>供应商废品和维修。如果你的武器能给你足够的钱购买 |T135346:0|t[弯刀]，就卖掉它，如果你有足够的钱，就买两把（每把 18 先令 20 美分） << Orc/Troll
    .vendor >>供应商废品和维修。如果你的武器能给你足够的钱购买 |T135346:0|t[Cutlass]，就卖掉它，如果你有足够的钱，就买两把（每把 20 先令 23 美分） << Undead/BloodElf
    .vendor >>供应商废品和维修。如果你的武器能给你足够的钱购买 |T135346:0|t[Cutlass]，就卖掉它，如果你有足够的钱，就买两把（每把 16 先令 18 美分） << Goblin
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
    .target Shoma
step << Rogue
    .goto 1454,76.12,37.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索玛|r
    >>|cRXP_BUY_从他那里买一两件|r |T135346:0|t[Cutlass] |cRXP_BUY_|r
    .collect 851,1,14129,1 --Cutlass (1)
    .money <0.1820 << Orc/Troll
    .money <0.2023 << Undead/BloodElf
    .money <0.1618 << Goblin
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
    .target Shoma
step << Warrior/Paladin
    #optional
    #completewith RunawayShredder
    +装备 |T133477:0|t[巨型钉头锤]
    .use 1197
    .itemcount 1197,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.9
step << Shaman
    #optional
    #completewith RunawayShredder
    #label Knuckles
    +装备 |T132938:0|t[右手指虎]
    .use 15905
    .itemcount 15905,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step << Shaman
    #optional
    #completewith RunawayShredder
    #label Knuckles
    +装备 |T132938:0|t[左手指关节铜套]
    .use 15906
    .itemcount 15906,1
    .itemStat 17,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step << Hunter
    #optional
    #completewith RunawayShredder
    +装备 |T135489:0|t[层压反曲弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
    .xp <11,1
step << Hunter
    #optional
    #completewith RunawayShredder
    +当你达到 11 级时装备 |T135489:0|t[层压反曲弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
    .xp >11,1
step << Rogue
    #optional
    #completewith RunawayShredder
    +装备 |T135346:0|t[弯刀]
    .use 851
    .itemcount 851,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.7
step << Hunter
    .goto 1454,63.87,32.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥玛克|r
    .train 1978 >>训练你的职业法术
    .target Ormak Grimshot
    .xp <10,1
step
    #completewith RunawayShredder
    .goto 1454,75.39,4.15,0
    .zone Azshara >>前往: |cRXP_PICK_艾萨拉|r
step
    #optional
    .goto 76,26.81,76.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格图·血拳|r
    .turnin 25648 >>交任务: |cRXP_FRIENDLY_杜隆塔尔之外|r
    .accept 14118 >>接任务: |cRXP_WARN_军餐鹿肉|r
    .accept 14117 >>接任务: |cRXP_WARN_灰谷之眼|r
    .target Ag'tor Bloodfist
    .isOnQuest 25648
step
    .goto 76,26.81,76.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格图·血拳|r
    .accept 14118 >>接任务: |cRXP_WARN_军餐鹿肉|r
    .accept 14117 >>接任务: |cRXP_WARN_灰谷之眼|r
    .target Ag'tor Bloodfist
step
    #optional
    .goto 76,27.00,77.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_劳工队长格拉比特|r
    .turnin 25275 >>交任务: |cRXP_FRIENDLY_向劳工队长报道|r
    .accept 14129 >>接任务: |cRXP_WARN_逃跑的伐木机！|r
    .target Labor Captain Grabbit
    .isOnQuest 25275
step
    #optional
    .goto 76,27.00,77.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_劳工队长格拉比特|r
    .turnin 28496 >>交任务: |cRXP_FRIENDLY_酋长的命令：艾萨拉！|r
    .accept 14129 >>接任务: |cRXP_WARN_逃跑的伐木机！|r
    .target Labor Captain Grabbit
    .isOnQuest 28496
step
    #label RunawayShredder
    .goto 76,27.00,77.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_劳工队长格拉比特|r
    .accept 14129 >>接任务: |cRXP_WARN_逃跑的伐木机！|r
    .target Labor Captain Grabbit
step
    #completewith DefendtheGates
    >>杀死 |cRXP_ENEMY_Talrendis Scouts|r。他们处于潜行状态
    >>杀死 |cRXP_ENEMY_Weakened Mosshoof Stags|r。掠夺它们的 |cRXP_LOOT_Slab of Venison|r
    >>|cRXP_ENEMY_塔伦迪斯侦察兵|r |cRXP_WARN_可以在你杀戮时袭击你|r |cRXP_ENEMY_虚弱的苔蹄雄鹿|r
    .complete 14117,1 --Talrendis Scout (8)
    .complete 14118,1 --Slab of Venison (15)
    .mob Talrendis Scout
    .mob Weakened Mosshoof Stag
step
    .goto 76,27.47,73.55,60,0
    .goto 76,28.55,72.22,60,0
    .goto 76,29.89,71.73
    >>攻击 |cRXP_ENEMY_Runaway Shredder|r。一旦它变为友军，就骑上它
    .complete 14129,1 --Runaway Shredder Captured (1)
    .mob Runaway Shredder
step
    .goto 76,27.33,76.17
    .turnin 14129 >>交任务: |cRXP_FRIENDLY_逃跑的伐木机！|r
    .accept 14134 >>接任务: |cRXP_WARN_队长的木料|r
step
    #loop
    .goto 1447/1,-4994.10010,2593.60010,0
    .waypoint 1447/1,-4941.39990,2669.00000,30,0
    .waypoint 1447/1,-4994.10010,2593.60010,30,0
    .waypoint 1447/1,-5032.80029,2625.69995,30,0
    .waypoint 1447/1,-5063.00000,2662.30005,30,0
    >>使用 |T135437:0|t[采集木材]|r 在 |cRXP_PICK_Azshara 木材堆|r 收集 |cRXP_LOOT_木材|r
    .complete 14134,1 --Azshara Lumber (6)
step
    .turnin 14134 >>交任务: |cRXP_FRIENDLY_队长的木料|r
    .accept 14135 >>接任务: |cRXP_WARN_树上的敌人|r
step
    #loop
    .goto 1447/1,-5007.70020,2719.19995,0
    .waypoint 1447/1,-5007.70020,2719.19995,30,0
    .waypoint 1447/1,-5013.30029,2780.50000,30,0
    .waypoint 1447/1,-5084.10010,2787.19995,30,0
    .waypoint 1447/1,-5088.00000,2726.50000,30,0
    >>|cRXP_WARN_使用|r |T134427:0|t[Buzzsaw]|r |cRXP_WARN_at|r |cRXP_FRIENDLY_Azshara Saplings|r |cRXP_WARN_制造|r |cRXP_ENEMY_Talrendis 狙击手|r |cRXP_WARN_攻击你|r
    >>|cRXP_WARN_使用|r |T134427:0|t[Buzzsaw]|r |cRXP_WARN_和|r |T132330:0|t[Fling Blade]|r |cRXP_WARN_杀死|r |cRXP_ENEMY_Talrendis 狙击手|r
    -->>|cRXP_WARN_确保你的|r |T134427:0|t[Buzzsaw]|r |cRXP_WARN_hits 击中树的核心|r
    .complete 14135,1 --Talrendis Sniper (9)
    .mob Talrendis Sniper
    .target Azshara Sapling
step
    #label DefendtheGates
    .turnin 14135 >>交任务: |cRXP_FRIENDLY_树上的敌人|r
    .accept 14146 >>接任务: |cRXP_WARN_防守大门！|r
step
    #completewith next
    .goto 76,27.00,76.76,50 >>返回奥格瑞玛后门
step
    .goto 76,27.017,76.728
    >>|cRXP_WARN_使用你的|r |T134427:0|t[Buzzsaw]|r|cRXP_WARN_、|r |T132330:0|t[Fling Blade|r |cRXP_WARN_和|r |T133716:0|t[Grenade Launcher|r |cRXP_WARN_杀死|r |cRXP_ENEMY_Talrendis Raiders|r
    >>|cRXP_WARN_如果您丢失了 Shredder，请安装|r |cRXP_FRIENDLY_Backup Shredder|r |cRXP_WARN_instead|r
    .complete 14146,1 --Talrendis Raider (20)
    .mob Talrendis Raider
    .target Backup Shredder
step
    .turnin 14146 >>交任务: |cRXP_FRIENDLY_防守大门！|r
    .accept 14155 >>接任务: |cRXP_WARN_砍大树|r
step
    .goto 76,21.506,75.870
    >>杀死西边的|cRXP_ENEMY_Talrendis Ancient|r
    >>|cRXP_WARN_如果您丢失了 Shredder，请安装|r |cRXP_FRIENDLY_Backup Shredder|r |cRXP_WARN_instead|r
    .complete 14155,1 --Talrendis Ancient (1)
    .unitscan Talrendis Ancient
    .target Backup Shredder
step
    #loop
    .goto 76,21.966,74.436,0
    .goto 76,30.679,74.065,0
    .waypoint 76,21.966,74.436,60,0
    .waypoint 76,23.589,74.546,60,0
    .waypoint 76,25.579,74.477,60,0
    .waypoint 76,27.129,74.676,60,0
    .waypoint 76,29.138,74.328,60,0
    .waypoint 76,30.679,74.065,60,0
    >>杀死 |cRXP_ENEMY_Talrendis Scouts|r。他们处于潜行状态
    >>杀死 |cRXP_ENEMY_Weakened Mosshoof Stags|r。掠夺它们的 |cRXP_LOOT_Slab of Venison|r
    >>|cRXP_ENEMY_塔伦迪斯侦察兵|r |cRXP_WARN_可以在你杀戮时袭击你|r |cRXP_ENEMY_虚弱的苔蹄雄鹿|r
    .complete 14117,1 --Talrendis Scout (8)
    .complete 14118,1 --Slab of Venison (15)
    .disablecheckbox
    .unitscan Talrendis Scout
    .mob Weakened Mosshoof Stag
step
    #completewith ArborcideTurnin
    >>如果你掠夺了 |T133464:0|t[侦察兵的命令]，请使用该物品接受任务
    .collect 47039,1,14127 --Scout's Orders (1)
    .accept 14127 >>接任务: |cRXP_WARN_上层精灵归来？|r
    .use 47039
    .itemcount 47039,1
step
    #completewith ArborcideTurnin
    >>杀死 |cRXP_ENEMY_Weakened Mosshoof Stags|r。掠夺它们的 |cRXP_LOOT_Slab of Venison|r
    >>|cRXP_WARN_如果此时尚未完成，请跳过此步骤|r
    .complete 14118,1 --Slab of Venison (15)
    .mob Weakened Mosshoof Stag
step
    #optional
    .goto 76,26.83,76.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格图·血拳|r
    .turnin 14117 >>交任务: |cRXP_FRIENDLY_灰谷之眼|r
    .turnin 14118 >>交任务: |cRXP_FRIENDLY_军餐鹿肉|r
    .turnin 14127 >>交任务: |cRXP_FRIENDLY_上层精灵归来？|r
    .target Ag'tor Bloodfist
    .isQuestComplete 14118
    .isOnQuest 14127
step
    #optional
    .goto 76,26.83,76.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格图·血拳|r
    .turnin 14117 >>交任务: |cRXP_FRIENDLY_灰谷之眼|r
    .turnin 14127 >>交任务: |cRXP_FRIENDLY_上层精灵归来？|r
    .target Ag'tor Bloodfist
    .isOnQuest 14127
step
    #optional
    .goto 76,26.83,76.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格图·血拳|r
    .turnin 14117 >>交任务: |cRXP_FRIENDLY_灰谷之眼|r
    .turnin 14118 >>交任务: |cRXP_FRIENDLY_军餐鹿肉|r
    .target Ag'tor Bloodfist
    .isQuestComplete 14118
step
    .goto 76,26.83,76.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格图·血拳|r
    .turnin 14117 >>交任务: |cRXP_FRIENDLY_灰谷之眼|r
    .target Ag'tor Bloodfist
step
    #label ArborcideTurnin
    .goto 76,27.00,77.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_劳工队长格拉比特|r
    .turnin 14155 >>交任务: |cRXP_FRIENDLY_砍大树|r
    .accept 14162 >>接任务: |cRXP_WARN_向霍扎克汇报|r
    .target Labor Captain Grabbit
step
    #optional
    .goto 76,26.83,76.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格图·血拳|r
    .turnin 14118 >>交任务: |cRXP_FRIENDLY_军餐鹿肉|r
    .target Ag'tor Bloodfist
    .isQuestComplete 14118
step
    #optional
    .goto 76,26.83,76.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格图·血拳|r
    .turnin 14127 >>交任务: |cRXP_FRIENDLY_上层精灵归来？|r
    .target Ag'tor Bloodfist
    .isOnQuest 14127
step
    #optional
    .goto 76,26.83,76.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿格图·血拳|r
    .accept 14128 >>接任务: |cRXP_WARN_上层精灵归来？|r
    .target Ag'tor Bloodfist
    .isQuestTurnedIn 14127
step
    #completewith Horzak1
    #optional
    .abandon 14118 >>放弃鹿肉，为部队提供
step
    #completewith Horzak1
    .subzone 4830 >>前往奥格瑞玛火箭车交易所
step
    .goto Azshara,29.67,66.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅琳妮·碎天者|r
    .turnin 14128 >>交任务: |cRXP_FRIENDLY_上层精灵归来？|r
    .target Malynea Skyreaver
    .isOnQuest 14128
step
    .goto 76,29.12,66.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fisk|r
    .accept 14197 >>接任务: |cRXP_WARN_达成指标|r
    .target Foreman Fisk
step
    #label Horzak1
    .goto 76,29.15,66.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍扎克·齐格尼伯|r
    .turnin 14162 >>交任务: |cRXP_FRIENDLY_向霍扎克汇报|r
    .accept 14161 >>接任务: |cRXP_WARN_灭除蜥蜴|r
    .accept 14165 >>接任务: |cRXP_WARN_冷若岩石|r
    .target Horzak Zignibble
step
    #completewith next
    .subzone 4744 >>向西前往 Mountainfoot 露天矿场
step
    #loop
    .goto 76,25.976,68.758,0
    .goto 76,25.533,69.045,0
    .goto 76,25.096,69.901,0
    .waypoint 76,25.976,68.758,30,0
    .waypoint 76,25.533,69.045,30,0
    .waypoint 76,25.096,69.901,30,0
    .aura 67032 >>拿起一个 |cRXP_FRIENDLY_Mountainfoot Miner|r
    .target Mountainfoot Miner
    .isOnQuest 14165
step
    .goto 76,29.075,66.418
	>>将 |cRXP_FRIENDLY_Mountainfoot Miner|r 带回奥格瑞玛火箭车交易所
    >>|cRXP_WARN_当你执行此操作时，你无法骑乘或变形！|r
    .complete 14165,1 --Stonified Miner Delivered
    .target Mountainfoot Miner
step
    .goto 76,29.15,66.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍扎克·齐格尼伯|r
    .turnin 14165 >>交任务: |cRXP_FRIENDLY_冷若岩石|r
    .accept 14190 >>接任务: |cRXP_WARN_完美的棱镜|r
    .target Horzak Zignibble
step
    #completewith GreyBasilisks
    >>在地面上掠夺 |cRXP_PICK_铁锭|r 和 |cRXP_PICK_铁库存|r 以获得 |cRXP_LOOT_Mountainfoot Iron|r
    .complete 14197,1 --Mountainfoot Iron (20)
step
    #completewith Refleshify
    >>杀死 |cRXP_ENEMY_Greystone Basilisks|r
    .complete 14161,1 --Greystone Basilisk (10)
    .mob Greystone Basilisk
step
    .goto 76,21.91,69.37
    >>杀死 |cRXP_ENEMY_Talrendis Saboteurs|r。掠夺他们以获得 |cRXP_LOOT_Crystal Pendant|r
    .complete 14190,1 --Crystal Pendant (1)
    .mob Talrendis Saboteur
step
    .goto 76,20.26,70.40
    >>点击 |cRXP_PICK_Headquarters Radio|r
    .turnin 14190 >>交任务: |cRXP_FRIENDLY_完美的棱镜|r
    .accept 14192 >>接任务: |cRXP_WARN_棱镜的粉碎|r
step
    .goto 76,20.03,69.97
    >>点击|cRXP_PICK_武器柜|r
    .turnin 14192 >>交任务: |cRXP_FRIENDLY_棱镜的粉碎|r
    .accept 14194 >>接任务: |cRXP_WARN_重塑血肉|r
step
    #label Refleshify
    #loop
    .goto 76,24.869,69.998,0
    .waypoint 76,22.454,69.462,20,0
    .waypoint 76,22.948,69.353,20,0
    .waypoint 76,23.338,71.559,20,0
    .waypoint 76,24.442,69.803,20,0
    .waypoint 76,24.869,69.998,20,0
    .waypoint 76,24.877,71.476,20,0
    .waypoint 76,24.633,72.520,20,0
    .waypoint 76,26.635,70.113,20,0
    .waypoint 76,25.517,69.028,20,0
    .waypoint 76,24.911,68.008,20,0
    .waypoint 76,23.005,68.003,20,0
    .use 48104 >>|cRXP_WARN_使用|r |T249182:0|t[The Refleshifier] |cRXP_WARN_on|r |cRXP_FRIENDLY_Mountainfoot Miners|r
    .complete 14194,1 --Mountainfoot Miner Destoned (8)
    .target Mountainfoot Miner
step
    #label GreyBasilisks
    #loop
    .goto 76,24.459,70.185,0
    .waypoint 76,24.459,70.185,40,0
    .waypoint 76,26.214,70.118,40,0
    .waypoint 76,24.683,68.383,40,0
    .waypoint 76,22.607,69.349,40,0
    >>杀死 |cRXP_ENEMY_Greystone Basilisks|r
    .complete 14161,1 --Greystone Basilisk (10)
    .mob Greystone Basilisk
step
    #loop
    .goto 76,22.683,68.753,0
    .waypoint 76,21.973,69.859,30,0
    .waypoint 76,22.683,68.753,30,0
    .waypoint 76,24.608,70.578,30,0
    .waypoint 76,25.493,69.020,30,0
    .waypoint 76,25.367,68.128,30,0
    .waypoint 76,22.933,67.848,30,0
    >>在地面上掠夺 |cRXP_PICK_铁锭|r 和 |cRXP_PICK_铁库存|r 以获得 |cRXP_LOOT_Mountainfoot Iron|r
    .complete 14197,1 --Mountainfoot Iron (20)
step
    #completewith next
    .subzone 4830 >>前往奥格瑞玛火箭车交易所
step
    .goto 76,29.12,66.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Fisk|r
    .turnin 14197 >>交任务: |cRXP_FRIENDLY_达成指标|r
    .target Foreman Fisk
step
    .goto 76,29.15,66.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍扎克·齐格尼伯|r
    .turnin 14161 >>交任务: |cRXP_FRIENDLY_灭除蜥蜴|r
    .turnin 14194 >>交任务: |cRXP_FRIENDLY_重塑血肉|r
    .target Horzak Zignibble
step
    .goto 76,29.53,66.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_列兵沃塞斯特|r
    .accept 14468 >>接任务: |cRXP_WARN_天降美差|r
    .target Private Worcester
step
    #completewith next
    .subzone 1233 >>向北前往绝望岭
step
    .goto 76,29.45,57.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_指挥官莫洛托夫|r
    .turnin 14468 >>交任务: |cRXP_FRIENDLY_天降美差|r
    .accept 14469 >>接任务: |cRXP_WARN_接过同志的包|r
    .target Commander Molotov
step
    .goto 76,29.38,57.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格利克斯·格林德罗克|r
    .accept 14470 >>接任务: |cRXP_WARN_军事突破|r
    .target Glix Grindlock
step
    .goto 76,29.11,57.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xiz|r
    .accept 14471 >>接任务: |cRXP_WARN_一级准备|r
    .target Xiz "The Eye" Salvoblast
step
    #completewith next
    >>在地面上掠夺 |cRXP_FRIENDLY_Dead Soldiers|r 可获得 |cRXP_LOOT_Military Supplies|r
    >>|cRXP_WARN_小心|r |cFFEB144CLand 地雷|r|cRXP_WARN_。如果踩到地雷，你会被弹飞出去。|r
    .complete 14469,1 --Military Supplies (12)
    .target Dead Soldier
    .target Sergeant Dynamo
step
    >>杀死 |cRXP_ENEMY_Warlord Krellian|r。掠夺他以获得 |cRXP_LOOT_SFG|r
    .complete 14470,1 --Warlord Krellian (1)
    .goto 76,27.562,52.010
    .complete 14470,2 --SFG (1)
    .goto 76,27.693,51.903
    .mob Warlord Krellian
step
    #loop
    .goto 76,29.619,53.022,0
    .waypoint 76,28.259,53.135,20,0
    .waypoint 76,28.735,52.656,20,0
    .waypoint 76,29.212,52.368,20,0
    .waypoint 76,29.619,53.022,20,0
    .waypoint 76,29.508,54.180,20,0
    .waypoint 76,29.166,54.338,20,0
    .waypoint 76,28.623,54.670,20,0
    >>在地面上掠夺 |cRXP_FRIENDLY_Dead Soldiers|r 可获得 |cRXP_LOOT_Military Supplies|r
    >>|cRXP_WARN_小心|r |cFFEB144CLand 地雷|r|cRXP_WARN_。如果踩到地雷，你会被弹飞出去。|r
    .complete 14469,1 --Military Supplies (12)
    .target Dead Soldier
    .target Sergeant Dynamo
step
    .goto 76,29.38,57.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格利克斯·格林德罗克|r
    .turnin 14470 >>交任务: |cRXP_FRIENDLY_军事突破|r
    .target Glix Grindlock
step
    .goto 76,29.45,57.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_指挥官莫洛托夫|r
    .turnin 14469 >>交任务: |cRXP_FRIENDLY_接过同志的包|r
    .target Commander Molotov
step
    .goto 76,31.12,57.59
    .vehicle >>安装 |cRXP_FRIENDLY_Bilgewater Mortar|r
    .target Bilgewater Mortar
    .isOnQuest 14471
step
    .goto 76,31.12,57.59
    >>|cRXP_WARN_使用|r |T252172:0|t[迫击炮弹] |cRXP_WARN_杀死|r |cRXP_ENEMY_Spitelash攻击者|r
    .complete 14471,1 --Spitelash Attackers blown to bits (60)
step
    .goto 76,29.11,57.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Xiz|r
    .turnin 14471 >>交任务: |cRXP_FRIENDLY_一级准备|r
    .target Xiz "The Eye" Salvoblast
step
    .goto 76,29.37,57.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格利克斯·格林德罗克|r
    .accept 14472 >>接任务: |cRXP_WARN_正中面门！|r
    .target Glix Grindlock
step
    .goto 76,31.61,60.49
    .use 49700 >>|cRXP_WARN_使用你的|r |T133032:0|t[SFG] |cRXP_WARN_杀死|r |cRXP_ENEMY_被奴役的阿考罗克之子|r
    .complete 14472,1 --Enslaved Son of Arkkoroc (1)
    .mob Enslaved Son of Arkkoroc
step
    .goto 76,29.37,57.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格利克斯·格林德罗克|r
    .turnin 14472 >>交任务: |cRXP_FRIENDLY_正中面门！|r
    .target Glix Grindlock
step
    .goto 76,29.45,57.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_指挥官莫洛托夫|r
    .accept 24452 >>接任务: |cRXP_WARN_收益性考察|r
    .target Commander Molotov
step
    .goto 76,31.924,50.964
    >>前往埃德拉斯废墟的中心
    .use 49701 >>|cRXP_WARN_使用你的|r |T133866:0|t[隐形力场发生器] |cRXP_WARN_来变得隐形|r
    .complete 24452,1 --Heart of Arkkoroc identified
step
    .goto 76,29.45,57.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_指挥官莫洛托夫|r
    .turnin 24452 >>交任务: |cRXP_FRIENDLY_收益性考察|r
    .accept 24453 >>接任务: |cRXP_WARN_私聊|r
    .target Commander Molotov
step
    #completewith next
    .subzone 4830 >>前往奥格瑞玛火箭车交易所
step
    .goto 76,29.53,66.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_列兵沃塞斯特|r
    .turnin 24453 >>交任务: |cRXP_FRIENDLY_私聊|r
    .target Private Worcester
step
    .goto 1447/1,-5012.00000,2915.30005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_喀斯特·克拉伯尼克|r
    .accept 14202 >>接任务: |cRXP_WARN_调查湖畔|r
    .target Custer Clubnik
step
    .goto 76,29.67,66.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅琳妮·碎天者|r
    .accept 14201 >>接任务: |cRXP_WARN_一沙一世界|r
    .target Malynea Skyreaver
step
    #completewith next
    >>从地面上掠夺 |cRXP_PICK_Ancient Debril Piles|r 以获得 |cRXP_LOOT_Recovered Artifacts|r
    .complete 14201,1 --Recovered Artifacts (5)
step
    >>保护 |cRXP_FRIENDLY_Goblin Surveyor Jr. Grade|r 免受 |cRXP_ENEMY_Shades of Hate|r 的侵袭，因为她正在标记勘测
    .use 48655 >>|cRXP_WARN_使用你的|r |T133015:0|t[测量员信标] |cRXP_WARN_召唤一个新的|r |cRXP_FRIENDLY_地精测量员|r |cRXP_WARN_如果需要|r
    .complete 14202,2 --Survey North Marker (1)
    .goto 76,34.69,71.58
    .complete 14202,3 --Survey East Marker (1)
    .goto 1447/1,-5434.39990,2637.10010
    .complete 14202,1 --Survey West Marker (1)
    .goto 76,34.263,76.616
    .target Goblin Surveyor Jr. Grade
    .mob Shade of Hate
step
    #loop
    .goto 1447/1,-5316.60010,2747.90015,0
    .waypoint 1447/1,-5316.60010,2747.90015,40,0
    .waypoint 1447/1,-5409.30029,2716.69995,40,0
    .waypoint 1447/1,-5457.70020,2650.60010,40,0
    .waypoint 1447/1,-5385.00000,2562.80005,40,0
    .waypoint 1447/1,-5335.39990,2535.40015,40,0
    .waypoint 1447/1,-5274.00000,2535.90015,40,0
    .waypoint 1447/1,-5221.60010,2638.00000,40,0
    >>从地面上掠夺 |cRXP_PICK_Ancient Debril Piles|r 以获得 |cRXP_LOOT_Recovered Artifacts|r
    .complete 14201,1 --Recovered Artifacts (5)
step
    .goto 1447/1,-5012.00000,2915.30005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_喀斯特·克拉伯尼克|r
    .turnin 14202 >>交任务: |cRXP_FRIENDLY_调查湖畔|r
    .accept 14209 >>接任务: |cRXP_WARN_黏糊糊的发动机|r
    .target Custer Clubnik
step
    .goto 76,29.68,66.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅琳妮·碎天者|r
    .turnin 14201 >>交任务: |cRXP_FRIENDLY_一沙一世界|r
    --.accept 14215 >>接任务: |cRXP_WARN_亡者的回忆|r
    .target Malynea Skyreaver
    --could skip 14215 and follow-up
step
    .goto 76,30.14,67.25
    >>点击 |cRXP_FRIENDLY_Clubnik 的推土机|r
    >>杀死出现的 |cRXP_ENEMY_Ectoplasm|r。拾取其 |cRXP_LOOT_Sample|r
    .complete 14209,1 --Ectosplatter Sample (1)
    .target Clubnik's Dozer
    .mob Ectoplasmic Exhaust
step
    .goto 1447/1,-5012.00000,2915.30005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_喀斯特·克拉伯尼克|r
    .turnin 14209 >>交任务: |cRXP_FRIENDLY_黏糊糊的发动机|r
    .accept 14423 >>接任务: |cRXP_WARN_推土驱魔术|r
    .target Custer Clubnik
step
    .goto 76,30.08,67.27
    .cast 68007 >>|cRXP_WARN_使用|r |T135619:0|t[祝福信号枪] |cRXP_WARN_near|r |cRXP_FRIENDLY_Clubnik 的推土机|r
    .timer 34,Dozercism RP
    >>一旦 |cRXP_ENEMY_Clubnik 的推土机|r 变得具有敌意，就攻击它
    .complete 14423,1 --Clubnik's Dozer Exorcised (1)
    .use 49350
    .target Clubnik's Dozer
    .isOnQuest 14423
step
    .goto 1447/1,-5012.00000,2915.30005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_喀斯特·克拉伯尼克|r
    .turnin 14423 >>交任务: |cRXP_FRIENDLY_推土驱魔术|r
    .accept 14424 >>接任务: |cRXP_WARN_再来点科学|r
    .target Custer Clubnik

    --next 2 quests not mandatory to continue in zone, could skip

step << skip
    .goto 1447/1,-5381.60010,2720.60010
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡莱莎的灵魂|r
    .aura 67704 >>|cRXP_WARN_让她给你|r |T136223:0|t[死者的回忆]|cRXP_WARN_buff|r
    .skipgossip
    .target Spirit of Kalytha
    .isOnQuest 14215
step << skip
    .goto 76,37.515,74.507
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师瑟维恩|r
    .complete 14215,1 --Kalytha's Secret Learned (1)
    .skipgossip
    .target Archmage Selwyn
step << skip
    .turnin 14215 >>交任务: |cRXP_FRIENDLY_亡者的回忆|r
    .accept 14216 >>接任务: |cRXP_WARN_萨希恩之石的传说|r
step << skip
    .goto 76,35.57,75.31
    >>拾取湖底的 |cRXP_PICK_Ancient Stone Cask|r 以获得 |cRXP_LOOT_Sarcen Stone|r
    .complete 14216,1 --Sarcen Stone (1)
step << skip
    .goto 76,29.68,66.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_梅琳妮·碎天者|r
    .turnin 14216 >>交任务: |cRXP_FRIENDLY_萨希恩之石的传说|r
    .target Malynea Skyreaver

    --Travel to next area here

step
    #completewith next
    .goto 1447/1,-4993.50000,2936.90015,5,0
    .goto 1447/1,-4998.70020,2947.10010,3 >>乘坐电梯到达平台
step
    .goto Azshara,29.49,66.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_锈水火箭管理员|r
    .gossipoption 112430 >>乘坐火箭前往南部火箭终点站
    .timer 41,Southern Rocketway Terminus
    .target Bilgewater Rocket-jockey
    .isOnQuest 14424
step
    .goto 76,50.411,74.293
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .turnin 14424 >>交任务: |cRXP_FRIENDLY_再来点科学|r
    .accept 14308 >>接任务: |cRXP_WARN_科学发火了|r
    .target Assistant Greely
step
    .goto 76,52.22,74.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_掷弹兵队长斯莫科斯|r
    .accept 14258 >>接任务: |cRXP_WARN_炮轰纳迦|r
    .target Bombardier Captain Smooks
step
    #completewith GoblinFires
    >>从地面拾取 |cRXP_PICK_Goblin Mortar Shells|r
    .complete 14258,1 --Goblin Mortar Shell (5)
step
    #completewith NineVisit1
    .use 49132 >>|cRXP_WARN_瞄准你的|r |T133037:0|t[Fireliminator X-21] |cRXP_WARN_at 火焰和|r |cRXP_FRIENDLY_Research Interns|r
    .complete 14308,1 --Lab Fires Extinguished (8)
    .complete 14308,2 --Research Interns Rescued (6)
    .target Research Intern
step
    .goto 76,45.07,75.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特维斯特克·乐钳|r
    .accept 14322 >>接任务: |cRXP_WARN_悲剧的科学！悲剧！|r
    .target Twistex Happytongs
step
    #label NineVisit1
    .goto 76,42.25,76.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_九号实验品|r
    .accept 14408 >>接任务: |cRXP_WARN_九号实验品的计划|r
    .target Subject Nine
step
    #label GoblinFires
    #loop
    .goto 76,44.122,76.798,0
    .waypoint 76,44.122,76.798,30,0
    .waypoint 76,43.906,74.755,30,0
    .waypoint 76,43.465,75.872,30,0
    .use 49132 >>|cRXP_WARN_瞄准你的|r |T133037:0|t[Fireliminator X-21] |cRXP_WARN_at 火焰和|r |cRXP_FRIENDLY_Research Interns|r
    >>|cRXP_WARN_小心|r |cRXP_ENEMY_Subject Four|r|cRXP_WARN_（红色猛禽）。他可以一击毙命|r
    .complete 14308,1 --Lab Fires Extinguished (8)
    .complete 14308,2 --Research Interns Rescued (6)
    .target Research Intern
    .unitscan Subject Four
step
    .goto 76,43.82,77.39
    >>点击 |cRXP_PICK_Secret Lab Squawkbox|r
    .turnin 14308 >>交任务: |cRXP_FRIENDLY_科学发火了|r
    .accept 14310 >>接任务: |cRXP_WARN_总结段错误：卸除核心|r
step
    .goto 76,43.818,77.301,10,0
    .goto 76,43.983,76.263,12,0
    .goto 76,44.108,75.642,12,0
    .goto 76,45.267,75.668,20,0
    .goto 76,46.571,75.710,20,0
    .goto 76,47.874,75.147,20,0
    .goto 76,49.490,74.495
    >>点击|cRXP_PICK_Reactor 控制台|r 开始护送
    >>护送车子回到南部火箭交易所
    .use 49132 >>|cRXP_WARN_瞄准|r |T133037:0|t[Fireliminator X-21] |cRXP_WARN_对着|r |cRXP_FRIENDLY_Hulking Labgoblin|r |cRXP_WARN_每当他着火的时候|r
    .complete 14310,1 --Azsharite Core Delivered (1)
    .target Hulking Labgoblin
step
    .goto 76,50.42,74.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .turnin 14310 >>交任务: |cRXP_FRIENDLY_总结段错误：卸除核心|r
    .accept 14370 >>接任务: |cRXP_WARN_神秘的艾萨莱特水晶|r
    .accept 14371 >>接任务: |cRXP_WARN_巨型茶点|r
    .target Assistant Greely
step
    .goto 76,45.97,76.08
    >>点击 |cRXP_PICK_Door Buzzer|r
    >>杀死出现的 |cRXP_ENEMY_Mutant Goblin|r。掠夺他的 |cRXP_LOOT_Rocket Plans|r
    .complete 14408,1 --戒指 Door Buzzer (1)
    .complete 14408,2 --Secret Rocket Plans (1)
    .mob Mutant Goblin
    .skipgossip
    --VV Gossipoption
step
    #completewith next
    >>杀死 |cRXP_ENEMY_雾翼崖居者s|r。掠夺他们的 |cRXP_LOOT_Carcasses|r
    >>杀死 |cRXP_ENEMY_静电角鹰兽s|r
    .complete 14371,1 --Mutilated Mistwing Carcass (8)
    .mob +雾翼崖居者
    .complete 14322,1 --静电角鹰兽 (8)
    .mob +静电角鹰兽
step
    #loop
    .goto 76,46.586,71.044,0
    .goto 76,42.053,70.833,0
    .goto 76,41.660,77.979,0
    .goto 76,44.681,81.500,0
    .waypoint 76,46.586,71.044,40,0
    .waypoint 76,43.917,70.036,40,0
    .waypoint 76,43.212,68.401,40,0
    .waypoint 76,42.053,70.833,40,0
    .waypoint 76,41.660,77.979,40,0
    .waypoint 76,43.022,81.757,40,0
    .waypoint 76,44.681,81.500,40,0
    >>从地面上掠夺 |cRXP_PICK_Azsharite Formations|r 以获得 |cRXP_LOOT_Azsharite Samples|r
    .complete 14370,1 --Azsharite Sample (5)
step
    #loop
    .goto 76,44.908,79.037,0
    .waypoint 76,45.723,72.688,60,0
    .waypoint 76,45.068,77.881,60,0
    .waypoint 76,44.908,79.037,60,0
    >>杀死 |cRXP_ENEMY_雾翼崖居者s|r。掠夺他们的 |cRXP_LOOT_Carcasses|r
    >>杀死 |cRXP_ENEMY_静电角鹰兽s|r
    .complete 14371,1 --Mutilated Mistwing Carcass (8)
    .mob +雾翼崖居者
    .complete 14322,1 --静电角鹰兽 (8)
    .mob +静电角鹰兽
step
    .goto 76,42.25,76.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_九号实验品|r
    .turnin 14408 >>交任务: |cRXP_FRIENDLY_九号实验品的计划|r
    .accept 14422 >>接任务: |cRXP_WARN_飞向外太空的迅猛龙|r
    .target Subject Nine
step
    .goto 76,44.06,75.09
    .aura 69704,5+ >>在秘密实验室中打开 5 个 |cRXP_PICK_标本笼|r
    .isOnQuest 14422
step
    .goto 76,42.25,76.08
    >>返回 |cRXP_FRIENDLY_主题九|r
    .complete 14422,1 --Experimental Raptor Delivered (5)
step
    .goto 76,42.25,76.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_九号实验品|r
    .turnin 14422 >>交任务: |cRXP_FRIENDLY_飞向外太空的迅猛龙|r
    .target Subject Nine
step
    .goto 76,45.06,75.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特维斯特克·乐钳|r
    .turnin 14322 >>交任务: |cRXP_FRIENDLY_悲剧的科学！悲剧！|r
    .target Twistex Happytongs
step
    .goto 76,50.41,74.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .turnin 14370 >>交任务: |cRXP_FRIENDLY_神秘的艾萨莱特水晶|r
    .turnin 14371 >>交任务: |cRXP_FRIENDLY_巨型茶点|r
    .accept 14377 >>接任务: |cRXP_WARN_亲近巨人|r
    .target Assistant Greely
step
    .goto 1447/1,-6005.39990,2603.50000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格蒙刚|r
    .complete 14377,1 --Secret of Azsharite Discovered (1)
    .skipgossip
    .target Gormungan
step
    .goto 76,50.41,74.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .turnin 14377 >>交任务: |cRXP_FRIENDLY_亲近巨人|r
    .accept 14385 >>接任务: |cRXP_WARN_艾萨莱特水晶实验一号|r
    .target Assistant Greely
step
    .goto 76,50.53,74.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍巴特·钩锤|r
    .accept 14383 >>接任务: |cRXP_WARN_废墟海岸的邪恶侏儒|r
    .target Hobart Grapplehammer
step
    #completewith next
    .subzone 1256 >>前往废墟之地
step
    #completewith next
    >>杀死 |cRXP_ENEMY_网络枪侏儒s|r、|cRXP_ENEMY_Zapper Gnomes|r 和 |cRXP_ENEMY_Bingham Gadgetspring|r
    .complete 14383,1 --Bingham Gadgetspring (1)
    .mob +*宾汉姆·加吉特斯普林
    .complete 14383,2 --网络枪侏儒 (4)
    .mob +网络枪侏儒
    .complete 14383,3 --Zapper Gnome (6)
    .mob +Zapper Gnome
step
    .goto 76,39.89,84.76
    >>掠夺 |cRXP_LOOT_巨型泻药|r
    >>|cRXP_WARN_乘坐电梯到达|r |cRXP_ENEMY_Bingham Gadgetspring|r |cRXP_WARN_所在的建筑物上层|r
    .complete 14385,2 --Giant-Sized Laxative (1)
step
    #loop
    .goto 76,40.921,84.919,0
    .waypoint 76,40.921,84.919,40,0
    .waypoint 76,42.938,85.531,40,0
    .waypoint 76,40.990,83.634,40,0
    .waypoint 76,42.123,83.416,40,0
    .waypoint 76,43.943,82.385,40,0
    >>完成杀死 |cRXP_ENEMY_网络枪侏儒s|r、|cRXP_ENEMY_Zapper Gnomes|r 和 |cRXP_ENEMY_Bingham Gadgetspring|r
    .complete 14383,1 --Bingham Gadgetspring (1)
    .mob +*宾汉姆·加吉特斯普林
    .complete 14383,2 --网络枪侏儒 (4)
    .mob +网络枪侏儒
    .complete 14383,3 --Zapper Gnome (6)
    .mob +Zapper Gnome
step
    .goto 1447/1,-6005.39990,2603.50000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格蒙刚|r
    .complete 14385,1 --Try to Feed Gormungan (1)
    .skipgossip
    .target Gormungan
step
    .goto 76,50.41,74.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .turnin 14385 >>交任务: |cRXP_FRIENDLY_艾萨莱特水晶实验一号|r
    .accept 14388 >>接任务: |cRXP_WARN_艾萨莱特水晶实验二号|r
    .target Assistant Greely
 step
    .goto 76,50.41,74.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .aura 68710 >>缩小成老鼠
    .skipgossipid 111824
    .isOnQuest 14388
    .target Assistant Greely
step
    .goto 76,50.313,74.422
    .vehicle >>安装 |cRXP_FRIENDLY_Rocketway Rat|r
    .target Rocketway Rat
    .isOnQuest 14388
step
    .goto 1447/1,-6005.39990,2603.50000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格蒙刚|r
    >>|cRXP_WARN_使用|r |T132328:0|t[Scurry] |cRXP_WARN_来增加你的移动速度|r
    .complete 14388,1 --Gormungan Scared (1)
    .skipgossip
    .target Gormungan
step
    #loop
    .goto 76,46.532,75.907,0
    .goto 76,43.494,75.449,0
    .waypoint 76,46.532,75.907,20,0
    .waypoint 76,46.070,76.435,20,0
    .waypoint 76,44.095,76.145,20,0
    .waypoint 76,44.205,77.003,20,0
    .waypoint 76,43.494,75.449,20,0
    .waypoint 76,43.825,75.554,20,0
    .waypoint 76,43.536,74.743,20,0
    >>完成从地面搜刮 |cRXP_PICK_Goblin Mortar Shells|r
    .complete 14258,1 --Goblin Mortar Shell (5)
step
    .goto 76,50.41,74.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_助手格瑞里|r
    .turnin 14388 >>交任务: |cRXP_FRIENDLY_艾萨莱特水晶实验二号|r
    .target Assistant Greely
step
    .goto 76,50.53,74.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍巴特·钩锤|r
    .turnin 14383 >>交任务: |cRXP_FRIENDLY_废墟海岸的邪恶侏儒|r
    .accept 24458 >>接任务: |cRXP_WARN_整装待发|r
    .target Hobart Grapplehammer
step
    .goto 76,52.21,74.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_掷弹兵队长斯莫科斯|r
    .turnin 14258 >>交任务: |cRXP_FRIENDLY_炮轰纳迦|r
    .target Bombardier Captain Smooks
step
    #xprate <1.2
    .goto 76,50.68,75.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托尔格|r
    .accept 14262 >>接任务: |cRXP_WARN_刮鳞破肠|r
    .accept 14267 >>接任务: |cRXP_WARN_调查海洋祭坛|r
    .target Torg Twocrush
    .maxlevel 15
step
    #xprate <1.2
    #completewith 按键toneShard
    .goto 1447/1,-6378.30029,2577.10010
    .subzone 4826 >>前往风暴崖
    .isOnQuest 14262
step
    #xprate <1.2
    #completewith 按键toneShard
    >>杀死 |cRXP_ENEMY_怨鞭风暴之怒|r 和 |cRXP_ENEMY_怨鞭海啸者s|r
    .complete 14262,1 --怨鞭风暴之怒 (6)
    .mob +怨鞭风暴之怒
    .complete 14262,2 --怨鞭海啸者 (6)
    .mob +怨鞭海啸者
    .isOnQuest 14262
step
    #xprate <1.2
    .goto 76,58.98,71.85
    >>点击|cRXP_PICK_Naga Power Stone|r
    .turnin 14267 >>交任务: |cRXP_FRIENDLY_调查海洋祭坛|r
    .accept 14270 >>接任务: |cRXP_WARN_钥石碎片|r
    .isOnQuest 14262
step
    #xprate <1.2
    .goto 76,57.51,70.96
    >>拾取地面上的 |cRXP_LOOT_按键tone Shard|r
    .complete 14270,1 --按键tone Shard (1)
    .isOnQuest 14262
step
    #xprate <1.2
    #label 按键toneShard
    .goto 76,58.98,71.85
    >>点击|cRXP_PICK_Naga Power Stone|r
    .turnin 14270 >>交任务: |cRXP_FRIENDLY_钥石碎片|r
    .accept 14271 >>接任务: |cRXP_WARN_向图卡斯汇报|r
    .isOnQuest 14262
step
    #xprate <1.2
    #loop
    .goto 76,61.858,77.871,0
    .waypoint 76,58.019,76.688,50,0
    .waypoint 76,59.851,77.431,50,0
    .waypoint 76,61.858,77.871,50,0
    .waypoint 76,63.084,82.431,50,0
    >>杀死 |cRXP_ENEMY_怨鞭风暴之怒|r 和 |cRXP_ENEMY_怨鞭海啸者s|r
    .complete 14262,1 --怨鞭风暴之怒 (6)
    .mob +怨鞭风暴之怒
    .complete 14262,2 --怨鞭海啸者 (6)
    .mob +怨鞭海啸者
    .isOnQuest 14262
step
    #xprate <1.2
    .goto 76,50.68,75.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托格·图卡斯|r
    .turnin 14262 >>交任务: |cRXP_FRIENDLY_刮鳞破肠|r
    .turnin 14271 >>交任务: |cRXP_FRIENDLY_向图卡斯汇报|r
    .accept 14295 >>接任务: |cRXP_WARN_海的姐妹|r
    .target Torg Twocrush
    .isQuestComplete 14262
step
    #xprate <1.2
    .goto 76,50.68,75.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托格·图卡斯|r
    .turnin 14271 >>交任务: |cRXP_FRIENDLY_向图卡斯汇报|r
    .accept 14295 >>接任务: |cRXP_WARN_海的姐妹|r
    .target Torg Twocrush
    .isQuestComplete 14271
step
    #xprate <1.2
    .goto 76,50.68,75.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托格·图卡斯|r
    .turnin 14271 >>交任务: |cRXP_FRIENDLY_向图卡斯汇报|r
    .accept 14295 >>接任务: |cRXP_WARN_海的姐妹|r
    .target Torg Twocrush
    .isQuestTurnedIn 14271
step
    #xprate <1.2
    .goto 76,63.15,75.87
    >>杀死 |cRXP_ENEMY_Lady Silisthra|r
    >>|cRXP_WARN_点击|r |cRXP_FRIENDLY_Silisthra 的能量石|r |cRXP_WARN_在平台顶部削弱她|r
    .complete 14295,1 --Lady Silisthra (1)
    .mob Lady Silisthra
    .isQuestTurnedIn 14271
step
    #xprate <1.2
    .goto 76,63.63,79.42
    >>杀死|cRXP_ENEMY_Lady Vesthra|r
    >>|cRXP_WARN_点击|r |cRXP_FRIENDLY_Vesthra 的能量石|r |cRXP_WARN_在平台顶部削弱她|r
    .complete 14295,2 --Lady Vesthra (1)
    .mob Lady Vesthra
    .isQuestTurnedIn 14271
step
    #xprate <1.2
    .goto 76,50.67,75.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托格·图卡斯|r
    .turnin 14295 >>交任务: |cRXP_FRIENDLY_海的姐妹|r
    .target Torg Twocrush
    .isQuestTurnedIn 14271
step
    .goto 76,51.492,74.285
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“天旋地转”费利兹|r
    .gossipoption 111876 >>搭乘飞机前往比尔吉沃特港
    .timer 59,A Hello to Arms RP
    .target Friz Groundspin
    .isOnQuest 24458
step << Shaman
    .goto 76,56.671,49.531
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_麦克斯·雪崩|r
    .trainer >>训练你的职业法术
    .target Maxx Avalanche
step << Mage
    .goto 76,56.919,49.598
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“点火器”菲兹|r
    .trainer >>训练你的职业法术
    .target Fizz Lighter
step << Warlock
    .goto 76,56.708,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾沃·邪指|r
    .trainer >>训练你的职业法术
    .target Evol Fingers
step << Priest
    .goto 76,56.852,50.279
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_修女金筛|r
    .trainer >>训练你的职业法术
    .target Sister Goldskimmer
step
    .goto 76,56.978,50.093
    >>点击建筑内的 |cRXP_PICK_Wrenchmen 招聘海报|r
    .accept 14478 >>接任务: |cRXP_WARN_鱼肚行动|r
step
    .goto 1447/1,-6519.00000,3529.80005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里米·油指|r
    .home >>将炉石设为比尔吉沃特港
    .target Grimy Greasefingers
step << Rogue
    .goto 76,56.884,50.575
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stinky Shapshiv|r
    .trainer >>训练你的职业法术
    .target Stinky Shapshiv
step << Hunter
    .goto 76,56.914,50.709
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴姆·重磅炸弹|r
    .trainer >>训练你的职业法术
    .target Bamm Megabomb
step << Warrior
    .goto 76,57.167,50.105
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_全能战士NX-01型|r, 他在楼上
    .trainer >>训练你的职业法术
    .target Warrior-Matic NX-01

    --VV Confirm if there are no Druid/Pala trainers in Bilgewater

step
    .goto 76,59.33,50.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_提莫|r
    .accept 14407 >>接任务: |cRXP_WARN_艾萨拉的蓝龙|r
    .target Teemo
step
    .goto 76,60.56,51.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布利尼克·菲兹福斯|r
    .turnin 24458 >>交任务: |cRXP_FRIENDLY_整装待发|r
    .target Bleenik Fizzlefuse
step
    .goto 76,60.64,50.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_指挥官莫洛托夫|r
    .turnin 14478 >>交任务: |cRXP_FRIENDLY_鱼肚行动|r
    .accept 24455 >>接任务: |cRXP_WARN_快速部署|r
    .target Commander Molotov
step
    .goto 76,58.10,52.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德索图小队长|r
    .turnin 24455 >>交任务: |cRXP_FRIENDLY_快速部署|r
    .accept 14479 >>接任务: |cRXP_WARN_人手多的是|r
    .target Captain Desoto
step
    .goto 76,57.891,52.246
    .vehicle >>安装 |cRXP_FRIENDLY_Rocket|r
    .timer 38,There Are Many Like It RP
    .target Surface to Other Surface Transport
    .isOnQuest 14479
step
    .goto 76,39.14,51.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉克卡斯|r
    .accept 24437 >>接任务: |cRXP_WARN_先到先得|r
    .target Ruckus
step
    .goto 76,41.50,53.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德雷克斯中尉|r
    .turnin 14479 >>交任务: |cRXP_FRIENDLY_人手多的是|r
    .accept 24435 >>接任务: |cRXP_WARN_扫尾|r
    .target Lieutenant Drex
step
    .goto 76,41.37,53.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫特军曹|r
    .accept 24436 >>接任务: |cRXP_WARN_天使降临|r
    .target Sergeant Hort
step
    #completewith NorthernVista
    >>杀死 |cRXP_ENEMY_Spitelash Naga|r 和 |cRXP_ENEMY_Spitelash Siren|r
    .complete 24435,1 --Defending Naga (12)
    .mob Spitelash Naga
    .mob Spitelash Siren
step
    #completewith KillNagas
    .use 49679 >>|cRXP_WARN_使用你的|r |T135619:0|t[神圣信号枪] |cRXP_WARN_on|r |cRXP_FRIENDLY_受伤士兵|r
    .complete 24436,1 --Wounded Soldier rescued (8)
    .target Wounded Soldier
step
    .goto 76,43.86,59.95
    .use 49685 >>|cRXP_WARN_使用|r |T132485:0|t[领土主张旗帜]|cRXP_WARN_at 南塔|r
    .complete 24437,1 --Southern Pagoda claimed (1)
step
    .goto 76,43.60,43.43
    .use 49685 >>|cRXP_WARN_使用|r |T132485:0|t[领土主张旗帜]|cRXP_WARN_at the Big ol' Tower|r
    .complete 24437,2 --Big ol' Tower claimed (1)
step
    #label NorthernVista
    .goto 76,45.46,38.52
    .use 49685 >>|cRXP_WARN_使用|r |T1324855:0|t[领土主张旗帜]|cRXP_WARN_at 北方远景|r
    .complete 24437,3 --Northern Vista claimed (1)
step
    #label KillNagas
    #loop
    .goto 76,40.901,51.711,0
    .waypoint 76,42.234,43.478,60,0
    .waypoint 76,40.500,47.338,60,0
    .waypoint 76,40.901,51.711,60,0
    .waypoint 76,42.469,56.429,60,0
    .waypoint 76,42.583,60.598,60,0
    >>杀死 |cRXP_ENEMY_Spitelash Naga|r 和 |cRXP_ENEMY_Spitelash Siren|r
    .complete 24435,1 --Defending Naga (12)
    .mob Spitelash Naga
    .mob Spitelash Siren
step
    #loop
    .goto 76,41.538,47.075,0
    .waypoint 76,42.063,42.177,30,0
    .waypoint 76,41.636,43.947,30,0
    .waypoint 76,41.538,47.075,30,0
    .waypoint 76,40.529,49.245,30,0
    .waypoint 76,39.905,51.764,30,0
    .waypoint 76,39.729,53.869,30,0
    .waypoint 76,42.040,50.686,30,0
    .waypoint 76,43.193,52.463,30,0
    .waypoint 76,42.736,60.005,30,0
    .use 49679 >>|cRXP_WARN_使用你的|r |T135619:0|t[神圣信号枪] |cRXP_WARN_on|r |cRXP_FRIENDLY_受伤士兵|r
    .complete 24436,1 --Wounded Soldier rescued (8)
    .target Wounded Soldier
step
    .goto 76,41.387,53.931
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赫特军曹|r
    .turnin 24436 >>交任务: |cRXP_FRIENDLY_天使降临|r
    .target Sergeant Hort
step
    .goto 76,41.499,53.650
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德雷克斯中尉|r
    .turnin 24435 >>交任务: |cRXP_FRIENDLY_扫尾|r
    .accept 24448 >>接任务: |cRXP_WARN_战地提拔|r
    .target Lieutenant Drex
step
    .goto 76,39.133,51.769
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉克卡斯|r
    .turnin 24437 >>交任务: |cRXP_FRIENDLY_先到先得|r
    .target Ruckus
step
    .goto 76,34.317,44.910
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托克队长|r
    .turnin 24448 >>交任务: |cRXP_FRIENDLY_战地提拔|r
    .accept 14487 >>接任务: |cRXP_WARN_仍在跳动的心|r
    .target Captain Tork
step
    .goto 76,34.450,44.766
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_泽尔克斯中士|r
    .accept 14480 >>接任务: |cRXP_WARN_灭绝|r
    .accept 14484 >>接任务: |cRXP_WARN_七寸|r
    .accept 14485 >>接任务: |cRXP_WARN_还少个钟摆|r
    .target Sergeant Zelks
step
    .goto 76,34.53,44.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托拉·哈罗崔克|r
    .accept 14486 >>接任务: |cRXP_WARN_货物买办|r
    .target Tora Halotrix
step
    #sticky
    #completewith SpitelashNagas
    .cast 69310 >>|cRXP_WARN_使用|r |T134286:0|t[Gob Squad Flare] |cRXP_WARN_召唤|r |cRXP_FRIENDLY_Goblins|r |cRXP_WARN_来协助你完成接下来的任务|r
    .use 49629
step
    #completewith LordKassarus
    >>摧毁 |cRXP_PICK_Spitelash 符文石|r
    >>|cRXP_FRIENDLY_修补匠|r |cRXP_WARN_将在符文石上放置炸药。保护他免受来袭的|r |cRXP_ENEMY_Spitelash Naga|r
    .complete 14485,1 --Spitelash Runestones destroyed (3)
step
    #completewith Runestones
    >>战利品 |cRXP_LOOT_Highborne Tablets|r 在地面上
    .complete 14486,1 --Highborne Tablet (12)
step
    #completewith HighborneTablets
    >>杀死 |cRXP_ENEMY_Spitelash 战斗大师|r 和 |cRXP_ENEMY_Spitelash 女巫|r
    .complete 14480,1 --Spitelash Naga (30)
    .mob Spitelash Battlemaster
    .mob Spitelash Enchantress
step
    .goto 76,31.877,50.086
    >>拾取地面上的 |cRXP_LOOT_Heart of Arkkoroc|r
    .complete 14487,1 --|1/1 Heart of Arkkoroc
    .use 49629
step
    #label LordKassarus
    .goto 76,35.993,49.836
    >>杀死 |cRXP_ENEMY_Kassarus 领主|r
    .complete 14484,1 --Lord Kassarus (1)
    .mob Lord Kassarus
    .use 49629
step
    #label Runestones
    #loop
    .goto 76,34.045,51.533,0
    .goto 76,36.039,47.628,0
    .waypoint 76,30.477,48.782,20,0
    .waypoint 76,32.307,52.460,20,0
    .waypoint 76,34.045,51.533,20,0
    .waypoint 76,34.335,48.192,20,0
    .waypoint 76,36.039,47.628,20,0
    >>摧毁 |cRXP_PICK_Spitelash 符文石|r
    >>|cRXP_FRIENDLY_修补匠|r |cRXP_WARN_将在符文石上放置炸药。保护他免受来袭的|r |cRXP_ENEMY_Spitelash Naga|r
    .complete 14485,1 --Spitelash Runestones destroyed (3)
    .use 49629
step
    #label HighborneTablets
    #loop
    .goto 76,30.114,49.084,0
    .waypoint 76,33.666,47.151,20,0
    .waypoint 76,32.448,48.661,20,0
    .waypoint 76,31.121,48.792,20,0
    .waypoint 76,30.274,48.555,20,0
    .waypoint 76,30.114,49.084,20,0
    .waypoint 76,30.293,50.517,20,0
    .waypoint 76,30.179,51.323,20,0
    .waypoint 76,31.410,52.117,20,0
    .waypoint 76,31.982,51.393,20,0
    .waypoint 76,32.188,53.156,20,0
    .waypoint 76,33.390,51.737,20,0
    .waypoint 76,34.262,49.631,20,0
    .waypoint 76,34.745,47.102,20,0
    >>战利品 |cRXP_LOOT_Highborne Tablets|r 在地面上
    .complete 14486,1 --Highborne Tablet (12)
    .use 49629
step
    #label SpitelashNagas
    #loop
    .goto 76,30.159,49.817,0
    .waypoint 76,32.789,46.635,60,0
    .waypoint 76,30.596,47.761,60,0
    .waypoint 76,30.159,49.817,60,0
    .waypoint 76,32.387,53.496,60,0
    .waypoint 76,34.325,51.617,60,0
    .waypoint 76,33.899,46.811,60,0
    >>杀死 |cRXP_ENEMY_Spitelash 战斗大师|r 和 |cRXP_ENEMY_Spitelash 女巫|r
    .complete 14480,1 --Spitelash Naga (30)
    .mob Spitelash Battlemaster
    .mob Spitelash Enchantress
    .use 49629
step
    .goto 76,34.464,44.727
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_泽尔克斯中士|r
    .turnin 14480 >>交任务: |cRXP_FRIENDLY_灭绝|r
    .turnin 14484 >>交任务: |cRXP_FRIENDLY_七寸|r
    .turnin 14485 >>交任务: |cRXP_FRIENDLY_还少个钟摆|r
    .target Sergeant Zelks
step
    .goto 76,34.53,44.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托拉·哈罗崔克|r
    .turnin 14486 >>交任务: |cRXP_FRIENDLY_货物买办|r
    .target Tora Halotrix
step
    .goto 76,34.307,44.905
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_托克队长|r
    .turnin 14487 >>交任务: |cRXP_FRIENDLY_仍在跳动的心|r
    .accept 24449 >>接任务: |cRXP_WARN_离岸|r
    .target Captain Tork
step
    .goto 76,34.513,44.512
    .vehicle >>安装 |cRXP_FRIENDLY_军用旋翼机|r
    .timer 32,Shore Leave RP
    .target Military Gyrocopter
    .isOnQuest 24449
step
    .goto 76,60.61,50.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_狂人大叔|r
    .turnin 24449 >>交任务: |cRXP_FRIENDLY_离岸|r
    .target Uncle Bedlam
step
    .maxlevel 18,NorthAzsharaSkip
    .goto 76,55.49,52.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡雷|r
    .turnin 14407 >>交任务: |cRXP_FRIENDLY_艾萨拉的蓝龙|r
    .accept 14130 >>接任务: |cRXP_WARN_各色朋友|r
    .target Kalec
step
    #completewith next
    .goto 76,70.36,36.25,60 >>前往 |cRXP_FRIENDLY_Ergll|r
    >>|cRXP_WARN_接下来的 5 分钟，您可以在水上行走|r
step
    .goto 76,70.36,36.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厄格尔罗|r
    .turnin 14130 >>交任务: |cRXP_FRIENDLY_各色朋友|r
    .accept 14131 >>接任务: |cRXP_WARN_先提提神|r
    .accept 14132 >>接任务: |cRXP_WARN_没礼貌！|r
    .accept 14323 >>接任务: |cRXP_WARN_吸水|r
    .target Ergll
step
    #completewith VileSplashers
    >>在地面上搜寻 |cRXP_PICK_Kawphi 植物|r 获得 |cRXP_LOOT_Kawphi 豆|r
    .complete 14131,1 --Kawphi Bean (10)
step
    #completewith VileSplashers
    >>杀死|cRXP_ENEMY_Makrinni Scrabblers|r
    .complete 14132,1 --Ruins of Arkkoran Makrinni (10)
    .mob Makrinni Scrabbler
step
    #label VileSplashers
    #loop
    .goto 76,75.914,35.559,0
    .goto 76,82.174,40.080,0
    .waypoint 76,75.914,35.559,50,0
    .waypoint 76,77.838,36.335,50,0
    .waypoint 76,80.072,37.683,50,0
    .waypoint 76,82.174,40.080,50,0
    .waypoint 76,79.225,40.686,50,0
    .waypoint 76,76.552,39.047,50,0
    .waypoint 76,75.496,36.880,50,0
    >>杀死 |cRXP_ENEMY_Vile Splashes|r。掠夺他们的 |cRXP_LOOT_Simmering Water Droplets|r
    >>|cRXP_ENEMY_邪恶飞溅|r |cRXP_WARN_靠近时立即死亡|r
    .complete 14323,1 --Simmering Water Droplet (20)
    .mob Vile Splash
step
    #label ObsorbentTurnin
    .turnin 14323 >>交任务: |cRXP_FRIENDLY_吸水|r
    --.accept 14324 >>接任务: |cRXP_WARN_好多热水|r
step
    .goto 76,81.40,30.84
    .use 49176 >>|cRXP_WARN_使用|r |T135231:0|t[充血的艾萨莉海绵] |cRXP_WARN_at the|r |cRXP_PICK_Stone of the Scalding Water lords|r
    >>杀死出现的 |cRXP_ENEMY_Scalding Water Lord|r。拾取其 |cRXP_LOOT_Globe of Boiling Water|r
    .complete 14324,1 --Globe of Boiling Water (1)
    .isOnQuest 14324
step
    #completewith next
    >>杀死|cRXP_ENEMY_Makrinni Scrabblers|r
    .complete 14132,1 --Ruins of Arkkoran Makrinni (10)
    .mob Makrinni Scrabbler
step
    #label KawphiBeans
    #loop
    .goto 76,70.927,35.021,0
    .goto 76,71.424,29.350,0
    .waypoint 76,70.927,35.021,25,0
    .waypoint 76,71.801,34.789,25,0
    .waypoint 76,70.604,32.345,25,0
    .waypoint 76,70.559,28.732,25,0
    .waypoint 76,71.424,29.350,25,0
    .waypoint 76,72.477,29.047,25,0
    >>在地面上搜寻 |cRXP_PICK_Kawphi 植物|r 获得 |cRXP_LOOT_Kawphi 豆|r
    .complete 14131,1 --Kawphi Bean (10)
step
    #loop
    .goto 76,72.885,36.368,0
    .goto 76,70.218,30.672,0
    .waypoint 76,74.209,32.190,60,0
    .waypoint 76,72.885,36.368,60,0
    .waypoint 76,70.218,30.672,60,0
    >>杀死|cRXP_ENEMY_Makrinni Scrabblers|r
    .complete 14132,1 --Ruins of Arkkoran Makrinni (10)
    .mob Makrinni Scrabbler
step
    .goto 76,70.36,36.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厄格尔罗|r
    .turnin 14131 >>交任务: |cRXP_FRIENDLY_先提提神|r
    .turnin 14132 >>交任务: |cRXP_FRIENDLY_没礼貌！|r
    .turnin 14324 >>交任务: |cRXP_FRIENDLY_好多热水|r
    .accept 14345 >>接任务: |cRXP_WARN_被淘汰者|r
    .target Ergll
    .isQuestComplete 14324
step
    #optional
    .goto 76,70.36,36.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厄格尔罗|r
    .turnin 14131 >>交任务: |cRXP_FRIENDLY_先提提神|r
    .turnin 14132 >>交任务: |cRXP_FRIENDLY_没礼貌！|r
    .accept 14324 >>接任务: |cRXP_WARN_好多热水|r
    .target Ergll
step
    #optional
    .goto 76,81.40,30.84
    .use 49176 >>|cRXP_WARN_使用|r |T135231:0|t[充血的艾萨莉海绵] |cRXP_WARN_at the|r |cRXP_PICK_Stone of the Scalding Water lords|r
    >>杀死出现的 |cRXP_ENEMY_Scalding Water Lord|r。拾取其 |cRXP_LOOT_Globe of Boiling Water|r
    .complete 14324,1 --Globe of Boiling Water (1)
step
    #optional
    .goto 76,70.36,36.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厄格尔罗|r
    .turnin 14324 >>交任务: |cRXP_FRIENDLY_好多热水|r
    .accept 14345 >>接任务: |cRXP_WARN_被淘汰者|r
    .timer 198,Turtle Ride
    .target Ergll
step << skip
    .goto 76,70.36,36.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厄格尔罗|r
    .vehicle >>乘坐乌龟车前往北部火箭交换站
    .timer 198,Turtle Ride
    .target Ergll
    .skipgossip
    .isOnQuest 14345
step
    #completewith next
    .goto 76,42.71,25.15,80 >>等到你到达北方火箭交易所
    >>|cRXP_WARN_如果这没有自动发生，请与|r |cRXP_FRIENDLY_Ergll|r |cRXP_WARN_again 交谈以骑上乌龟|r
    .skipgossip
step
    .goto 76,42.71,25.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索纳塔·火舞|r
    .turnin 14345 >>交任务: |cRXP_FRIENDLY_被淘汰者|r
    .accept 14340 >>接任务: |cRXP_WARN_打扮整齐|r
    .target Sorata Firespinner
step 
    #xprate <1.2
    .goto 76,42.61,23.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安多瑞尔·誓日|r
    .accept 14428 >>接任务: |cRXP_WARN_珀风的手记|r
    .target Andorel Sunsworn
step
    #xprate <1.2
    .goto 76,42.41,23.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈格鲁姆·血拳|r
    .accept 14431 >>接任务: |cRXP_WARN_黑喉裂谷|r
    .target Haggrum Bloodfist
step
    #xprate <1.2
    #loop
    .goto 76,37.967,28.403,0
    .waypoint 76,38.478,26.428,40,0
    .waypoint 76,37.967,28.403,40,0
    .waypoint 76,37.935,31.246,40,0
    .waypoint 76,37.212,34.089,40,0
    >>杀死 |cRXP_ENEMY_Talrendis 生物学家|r。掠夺他们以获得 |cRXP_LOOT_Blackmaw 情报|r
    .complete 14431,2 --Blackmaw Intelligence (1)
    .complete 14431,1 --Talrendis Biologist (8)
    .mob Talrendis Biologist
step
    #xprate <1.2
    .goto 76,42.408,23.605
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈格鲁姆·血拳|r
    .turnin 14431 >>交任务: |cRXP_FRIENDLY_黑喉裂谷|r
    .accept 14432 >>接任务: |cRXP_WARN_苦酒|r
    .accept 14433 >>接任务: |cRXP_WARN_另类的外交|r
    .target Haggrum Bloodfist
step
    #xprate <1.2
    .goto 76,49.75,28.44
    >>杀死 |cRXP_ENEMY_Lorekeeper Amberwind|r。掠夺她以获取 |cRXP_LOOT_Amberwind 的日记|r
    .complete 14428,1 --Amberwind's Journal (1)
    .mob Lorekeeper Amberwind
step
    #xprate <1.2
    .goto 76,49.53,28.78
    >>点击|cRXP_PICK_Upper Scrying Stone|r
    .turnin 14428 >>交任务: |cRXP_FRIENDLY_珀风的手记|r
    .accept 14429 >>接任务: |cRXP_WARN_奥术解构|r
step
    #xprate <1.2
    #loop
    .goto 76,52.303,27.112,0
    .goto 76,49.663,28.456,0
    .waypoint 76,50.329,27.556,40,0
    .waypoint 76,52.303,27.112,40,0
    .waypoint 76,51.685,25.068,40,0
    .waypoint 76,49.041,25.544,40,0
    .waypoint 76,49.291,27.335,40,0
    .waypoint 76,49.663,28.456,40,0
    >>杀死 |cRXP_ENEMY_Apprentice Investigators|r 和 |cRXP_ENEMY_Apprentice Illuminators|r。掠夺他们的 |cRXP_LOOT_Attuned Runestones|r
    .complete 14429,1 --Attuned Runestone (10)
    .mob Apprentice Investigator
    .mob Apprentice Illuminator
step
    #xprate <1.2
    .goto 76,53.02,29.01
    >>点击|cRXP_PICK_Lower Scrying Stone|r
    .turnin 14429 >>交任务: |cRXP_FRIENDLY_奥术解构|r
    .accept 14430 >>接任务: |cRXP_WARN_构造体黑客|r
step
    #xprate <1.2
    .goto 76,52.998,29.974
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥术构造体|r
    .complete 14430,1 --Arcane Construct Hacked (1)
    .target Arcane Construct
    .skipgossip
step
    .goto 76,47.241,20.861
    >>前往 |cRXP_FRIENDLY_大法师 Xylem 的图像|r
    .use 49201 >>|cRXP_WARN_使用你的|r |T133131:0|t[肮脏的巫师帽]
    .complete 14340,1 --Approach Archmage Xylem while wearing your Wizard Hat (1)
    .target Image of Archmage Xylem
step
    .goto 76,47.23,20.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师克希雷姆的影像|r
    .turnin 14340 >>交任务: |cRXP_FRIENDLY_打扮整齐|r
    .target Image of Archmage Xylem
step
    .goto 76,47.30,21.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨库尔·铁颅|r
    .accept 14250 >>接任务: |cRXP_WARN_可再生资源|r
    .target Tharkul Ironskull
step
    .goto 76,47.17,21.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威尔·罗伯索尼克|r
    .accept 14249 >>接任务: |cRXP_WARN_剪羽毛|r
    .target Will Robotronic
step
    .goto 76,47.01,21.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夸尔拉·破笛|r
    .accept 14263 >>接任务: |cRXP_WARN_浪费百里香|r
    .target Quarla Whistlebreak
step
    #completewith BalboaBlow
    >>战利品 |cRXP_LOOT_Living Ire Thyme|r 在地面上
    >>|cRXP_WARN_掠夺它们将为你带来|r |T135791:0|t[Living Ire] |cRXP_WARN_buff，持续 60 秒（+20% 造成和承受的伤害，最多叠加 5 次）|r
    .complete 14263,1 --Living Ire Thyme (8)
step
    #completewith IreThymes
    >>杀死 |cRXP_ENEMY_Thunderhead Hippogryphs|r。掠夺它们的 |cRXP_LOOT_Pristine Thunderhead Feather|r
    .complete 14249,1 --Pristine Thunderhead Feather (80)
    .mob Thunderhead Hippogryph
step
    #label BalboaBlow
    #loop
    .goto 76,53.267,20.867,0
    .goto 76,49.613,19.691,0
    .goto 76,46.529,15.659,0
    .waypoint 76,48.135,17.807,30,0
    .waypoint 76,49.613,19.691,30,0
    .waypoint 76,51.276,20.168,30,0
    .waypoint 76,53.267,20.867,30,0
    .waypoint 76,46.529,15.659,30,0
    .use 49038 >>|cRXP_WARN_将 |r |T135735:0|t[奥术冲锋] |cRXP_WARN_放在 |r |cRXP_ENEMY_Balboa|r |cRXP_WARN_前面，让他冲进去|r
    >>在爆炸后拾取地面上的 |cRXP_LOOT_Animate Basalt|r
    .complete 14250,1 --Animate Basalt (5)
    .unitscan Balboa
step
    #label IreThymes
    #loop
    .goto 76,52.188,19.077,0
    .goto 76,43.846,16.439,0
    .waypoint 76,50.142,16.603,25,0
    .waypoint 76,52.188,19.077,25,0
    .waypoint 76,52.920,22.025,25,0
    .waypoint 76,51.062,23.085,25,0
    .waypoint 76,50.191,23.321,25,0
    .waypoint 76,49.742,22.168,25,0
    .waypoint 76,49.866,18.267,25,0
    .waypoint 76,45.346,16.768,25,0
    .waypoint 76,43.846,16.439,25,0
    .waypoint 76,44.866,15.379,25,0
    .waypoint 76,45.688,13.923,25,0
    .waypoint 76,47.154,13.987,25,0
    >>战利品 |cRXP_LOOT_Living Ire Thyme|r 在地面上
    >>|cRXP_WARN_掠夺它们将为你带来|r |T135791:0|t[Living Ire] |cRXP_WARN_buff，持续 60 秒（+20% 造成和承受的伤害，最多叠加 5 次）|r
    .complete 14263,1 --Living Ire Thyme (8)
step
    #loop
    .goto 76,47.293,15.109,0
    .waypoint 76,49.885,15.595,70,0
    .waypoint 76,51.383,18.945,70,0
    .waypoint 76,49.879,21.922,70,0
    .waypoint 76,47.293,15.109,70,0
    .waypoint 76,42.318,18.466,70,0
    >>杀死 |cRXP_ENEMY_Thunderhead Hippogryphs|r。掠夺它们的 |cRXP_LOOT_Pristine Thunderhead Feather|r
    .complete 14249,1 --Pristine Thunderhead Feather (80)
    .mob Thunderhead Hippogryph
step
    .goto 76,47.01,21.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夸尔拉·破笛|r
    .turnin 14263 >>交任务: |cRXP_FRIENDLY_浪费百里香|r
    .target Quarla Whistlebreak
step
    .goto 76,47.17,21.06
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威尔·罗伯索尼克|r
    .turnin 14249 >>交任务: |cRXP_FRIENDLY_剪羽毛|r
    .target Will Robotronic
step
    .goto 76,47.30,21.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨库尔·铁颅|r
    .turnin 14250 >>交任务: |cRXP_FRIENDLY_可再生资源|r
    .target Tharkul Ironskull
step
    .goto 76,47.24,21.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特蕾莎·塔叶|r
    .accept 14230 >>接任务: |cRXP_WARN_体力劳动|r
    .target Teresa Spireleaf
step
    .goto 76,47.24,20.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师克希雷姆的影像|r
    .accept 14226 >>接任务: |cRXP_WARN_脚下的麻烦|r
    .target Image of Archmage Xylem
step
    #completewith next
    >>杀死 |cRXP_ENEMY_变形蟑螂|r
    >>|cRXP_WARN_让你的|r |cRXP_FRIENDLY_个人奥术助理|r |cRXP_WARN_cast|r |T294474:0|t[变形昆虫] |cRXP_WARN_on|r |cRXP_ENEMY_Legashi Satyr|r|cRXP_WARN_,|r |cRXP_ENEMY_Legashi Rogues|r |cRXP_WARN_and|r |cRXP_ENEMY_Legashi Hellcallers|r
    .complete 14226,1 --Polymorphed Cockroach (12)
    .mob Legashi Satyr
    .mob Legashi Rogue
    .mob Legashi Hellcaller
step
    #loop
    .goto 76,54.474,24.603,0
    .waypoint 76,55.608,23.916,20,0
    .waypoint 76,55.295,25.216,20,0
    .waypoint 76,54.929,24.217,20,0
    .waypoint 76,54.474,24.603,20,0
    >>拾取地面上的 |cRXP_PICK_Stolen Manual|r 以获得 |cRXP_LOOT_Abjurer's Manual|r
    >>|cRXP_WARN_该区域有多个|r |cRXP_PICK_被盗手册|r |cRXP_WARN_。|r |cRXP_FRIENDLY_GREEN|r |cRXP_WARN_看起来包含|r |cRXP_LOOT_Abjurer's Manual|r
    .complete 14230,1 --Abjurer's Manual (1)
step
    #loop
    .goto 76,54.524,24.092,0
    .waypoint 76,54.524,24.092,40,0
    .waypoint 76,56.003,24.962,40,0
    .waypoint 76,52.415,22.519,40,0
    >>杀死 |cRXP_ENEMY_变形蟑螂|r
    >>|cRXP_WARN_让你的|r |cRXP_FRIENDLY_个人奥术助理|r |cRXP_WARN_cast|r |T294474:0|t[变形昆虫] |cRXP_WARN_on|r |cRXP_ENEMY_Legashi Satyr|r|cRXP_WARN_,|r |cRXP_ENEMY_Legashi Rogues|r |cRXP_WARN_and|r |cRXP_ENEMY_Legashi Hellcallers|r
    .complete 14226,1 --Polymorphed Cockroach (12)
    .mob Legashi Satyr
    .mob Legashi Rogue
    .mob Legashi Hellcaller
step
    #completewith next
    .goto 76,47.098,20.551,30 >>返回 |cRXP_FRIENDLY_Archmage Xylem 的|r 营地
    >>|cRXP_WARN_让你的|r |cRXP_FRIENDLY_个人奥术助手|r |cRXP_WARN_cast|r |T135750:0|t[返回营地]
step
    .goto 76,47.24,21.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特蕾莎·塔叶|r
    .turnin 14230 >>交任务: |cRXP_FRIENDLY_体力劳动|r
    .target Teresa Spireleaf
step
    .goto 76,47.23,20.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师克希雷姆的影像|r
    .turnin 14226 >>交任务: |cRXP_FRIENDLY_脚下的麻烦|r
    .accept 14413 >>接任务: |cRXP_WARN_学习之巅|r
    .timer 30,The Pinnacle of Learning RP
    .target Image of Archmage Xylem
step
    .goto 76,55.71,14.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师克希雷姆的影像|r
    .turnin 14413 >>交任务: |cRXP_FRIENDLY_学习之巅|r
    .accept 14296 >>接任务: |cRXP_WARN_当心脚下|r
    .target Image of Archmage Xylem
step
    #sticky
    #completewith WatchYourStepComplete
    .goto 76,55.375,14.957,0
    +|cRXP_WARN_继续移动，避免被撞下山！如果你真的掉下去了，就游向|r |cRXP_FRIENDLY_大法师 Xylem 的图片|r |cRXP_WARN_再试一次|r
    .target Image of Archmage Xylem
    .isOnQuest 14296
    --VV Need video for this quest
step
    .goto 76,55.740,14.745
    .aura 68613 >>单击第一个|cRXP_PICK_Energy Conduit|r
    .isOnQuest 14296
step
    .goto 76,56.211,14.735,5,0
    .goto 76,56.887,14.333
    .aura 68613,2+ >>单击第二个|cRXP_PICK_Energy Conduit|r
    >>|cRXP_WARN_移至白色圆圈向上移动|r
    .isOnQuest 14296
step
    .goto 76,56.999,14.143,5,0
    .goto 76,57.570,12.867,5,0
    .goto 76,57.569,11.662
    .aura 68613,3+ >>单击第三个|cRXP_PICK_Energy Conduit|r
    >>|cRXP_WARN_移至白色圆圈向上移动|r
    .isOnQuest 14296
step
    .goto 76,57.386,11.252,5,0
    .goto 76,56.332,10.492,5,0
    .goto 76,55.486,10.606
    .aura 68613,4+ >>点击第四个|cRXP_PICK_Energy Conduit|r
    >>|cRXP_WARN_移至白色圆圈向上移动|r
    .isOnQuest 14296
step
    .goto 76,55.306,10.833,5,0
    .goto 76,55.038,12.596,5,0
    .goto 76,55.548,13.104,5,0
    .goto 76,56.295,13.520
    .aura 68613,5+ >>单击第五个 |cRXP_PICK_Energy Conduit|r
    >>|cRXP_WARN_移至白色圆圈向上移动|r
    .isOnQuest 14296
step
    .goto 76,56.450,13.291,5,0
    .goto 76,56.859,11.766,5,0
    .goto 76,56.173,11.077
    .aura 68613,6+>>单击第六个|cRXP_PICK_Energy Conduit|r
    >>|cRXP_WARN_移至白色圆圈向上移动|r
    .isOnQuest 14296
step
    .goto 76,55.992,11.256,5,0
    .goto 76,55.873,11.860
    >>|cRXP_WARN_移至白色圆圈向上移动|r
    .complete 14296,1 --Arcane Trial Completed (1)
    .isOnQuest 14296
step
    #label WatchYourStepComplete
    .goto 76,55.95,12.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师克希雷姆的影像|r
    .turnin 14296 >>交任务: |cRXP_FRIENDLY_当心脚下|r
    .accept 24478 >>接任务: |cRXP_WARN_冰霜试炼|r
    .accept 14300 >>接任务: |cRXP_WARN_火焰试炼|r
    .accept 24479 >>接任务: |cRXP_WARN_暗影试炼|r
    .target Image of Archmage Xylem
step
    #completewith next
    .goto 76,56.049,11.926
    .goto 76,62.104,21.217,20 >>点击地面上的 |cRXP_PICK_Frost Portal Zone|r，然后点击传送门
step
    #label FrostTrial
    #loop
    .goto 76,62.041,20.249,8,0
    .goto 76,62.168,19.956,8,0
    .goto 76,62.025,19.774,8,0
    .goto 76,61.633,20.002,8,0
    .goto 76,61.487,20.195,8,0
    .goto 76,61.228,20.548,8,0
    .goto 76,61.446,20.978,8,0
    .goto 76,61.665,20.874,8,0
    .goto 76,61.879,20.912,8,0
    .goto 76,62.116,20.756,8,0
    >>跑过漂浮的小冰云，收集 20 叠 |T252270:0|t[冰之精华]
    >>|cRXP_WARN_避开旋转的冰冲击和地面上的蓝色圆圈。每次受到打击时，你都会失去一层|r |T252270:0|t[冰精华] |cRXP_WARN_when|r
    .complete 24478,1 --Frost Trial Completed (1)
step
    #completewith FireTrial
    .goto 76,62.082,21.121
    .goto 76,56.173,12.079,20 >>进入门户
step
    #completewith next
    .goto 76,56.082,11.942
    .goto 76,32.886,23.395,20 >>点击地面上的 |cRXP_PICK_Fire Portal Zone|r，然后点击门户
step
    #label FireTrial
    .goto 76,33.339,23.524
    >>从一个圆圈移动到另一个圆圈并避开火焰，收集 10 叠 |T252268:0|t[火舞]
    >>|cRXP_WARN_最简单的方法是模仿|r |cRXP_FRIENDLY_Darwin 的|r |cRXP_WARN_movements|r
    .complete 14300,1 --Fire Trial Completed (1)
    .target Darwin
step
    #completewith ShadowTrial
    .goto 76,32.896,23.392
    .goto 76,56.173,12.079,20 >>进入门户
step
    #completewith ShadowTrial
    .goto 76,56.119,11.959
    .goto 76,31.183,26.715,20 >>点击地面上的 |cRXP_PICK_Shadow Portal Zone|r，然后点击门户
step
    #completewith next
    .goto 76,30.792,27.281
    .aura 69863 >>点击 |cRXP_PICK_Purple Stone|r 开始试用
step
    #label ShadowTrial
    .goto 76,30.930,27.875
    >>将 |cRXP_ENEMY_Weeping Souls|r 风筝到地面上的紫色圆圈上，收集 20 叠 |T252272:0|t[暗影诱饵]
    >>|cRXP_WARN_避免被|r |cRXP_ENEMY_Weeping Souls|r|cRXP_WARN_击中。当他们攻击你时，你会失去叠加效果|r
    .complete 24479,1 --Shadow Trial Completed (1)
    .mob Weeping Soul
step
    #completewith next
    .goto 76,31.172,26.719
    .goto 76,56.173,12.079,20 >>点击门户
step
    .goto 76,55.95,12.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师克希雷姆的影像|r
    .turnin 24478 >>交任务: |cRXP_FRIENDLY_冰霜试炼|r
    .turnin 14300 >>交任务: |cRXP_FRIENDLY_火焰试炼|r
    .turnin 24479 >>交任务: |cRXP_FRIENDLY_暗影试炼|r
    .accept 14299 >>接任务: |cRXP_WARN_克希雷姆疯人院|r
    .target Image of Archmage Xylem
step
    .goto 76,55.95,12.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_大法师克希雷姆的影像|r
    .gossipoption 111896 >>要求他打开通往他塔的入口
    .target Image of Archmage Xylem
    .isOnQuest 14299
step
    #completewith next
    .goto 76,56.162,12.079
    .goto 76,22.462,43.582,20 >>点击门户
step
    .goto 76,25.59,37.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乔安娜|r
    .turnin 14299 >>交任务: |cRXP_FRIENDLY_克希雷姆疯人院|r
    .accept 14389 >>接任务: |cRXP_WARN_难道不是很明显吗？|r
    .target Joanna
step
    #completewith next
    .goto 76,25.720,37.969
    .goto 76,27.773,40.970,20 >>点击门户
step
    .goto 76,27.798,40.448
    >>查找 |cRXP_FRIENDLY_Anara|r 和 |cRXP_FRIENDLY_Azuregos|r
    .complete 14389,1 --Find Anara, and hopefully, Azuregos
    .target Anara
    .target Spirit of Azuregos
step
    .turnin 14389 >>交任务: |cRXP_FRIENDLY_难道不是很明显吗？|r
    .accept 14390 >>接任务: |cRXP_WARN_好事多磨|r
step
    .goto 76,27.79,39.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾索雷葛斯|r
    .complete 14390,1 --Convince Azuregos to meet with Kalecgos
    .target Spirit of Azuregos
    .skipgossip 36436,1
step
    .turnin 14390 >>交任务: |cRXP_FRIENDLY_好事多磨|r
    .accept 14391 >>接任务: |cRXP_WARN_扭转局面|r
step
    .goto 76,27.617,39.602
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安娜拉|r
    .gossipoption 111889 >>回归生活
    .target Anara
    .isOnQuest 14391
step
    #xprate <1.2
    #completewith MeetingAgenda
    >>杀死 |cRXP_ENEMY_Talrendis 大使|r。掠夺他们以获得 |cRXP_LOOT_大使长袍|r
    .complete 14433,2 --Ambassador's Robes (1)
    .mob Talrendis Ambassador
step
    #xprate <1.2
    #completewith AmbRobes
    >>战利品 |cRXP_LOOT_Briaroot Brew|r 在地面上
    >>|cRXP_ENEMY_黑喉木喉|r |cRXP_WARN_也可以掉落|r |cRXP_LOOT_Briaroot Brew|r
    .complete 14432,1 --Briaroot Brew (10)
    .mob Blackmaw Pathfinder
    .mob Blackmaw Warrior
    .mob Blackmaw Shaman
step
    #xprate <1.2
    #label MeetingAgenda
    .goto 76,29.813,38.566
    >>拾取地面上的 |cRXP_PICK_重要文件|r 以获取 |cRXP_LOOT_Blackmaw 会议议程|r
    .complete 14433,1 --Blackmaw Meeting Agenda (1)
step
    #xprate <1.2
    #label AmbRobes
    #loop
    .goto 76,30.564,37.729,0
    .waypoint 76,29.965,38.504,40,0
    .waypoint 76,30.564,37.729,40,0
    .waypoint 76,31.261,34.060,40,0
    .waypoint 76,32.123,32.756,40,0
    >>杀死 |cRXP_ENEMY_Talrendis 大使|r。掠夺他们以获得 |cRXP_LOOT_大使长袍|r
    .complete 14433,2 --Ambassador's Robes (1)
    .mob Talrendis Ambassador
step
    #xprate <1.2
    #loop
    .goto 76,30.365,37.578,0
    .waypoint 76,29.926,38.784,30,0
    .waypoint 76,30.365,37.578,30,0
    .waypoint 76,31.393,36.065,30,0
    .waypoint 76,31.073,34.994,30,0
    .waypoint 76,31.171,33.729,30,0
    >>战利品 |cRXP_LOOT_Briaroot Brew|r 在地面上
    >>|cRXP_ENEMY_黑喉木喉|r |cRXP_WARN_也可以掉落|r |cRXP_LOOT_Briaroot Brew|r
    .complete 14432,1 --Briaroot Brew (10)
    .mob Blackmaw Pathfinder
    .mob Blackmaw Warrior
    .mob Blackmaw Shaman
step
    #xprate <1.2
    #completewith Diplomatic
    .subzone 4825 >>前往北方火箭交易所
step
    #xprate <1.2
    #optional
    .goto 76,42.402,23.602
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈格鲁姆·血拳|r
    .turnin 14432 >>交任务: |cRXP_FRIENDLY_苦酒|r
    .turnin 14433 >>交任务: |cRXP_FRIENDLY_另类的外交|r
    .accept 14435 >>接任务: |cRXP_WARN_黑喉离间计|r
    .target Haggrum Bloodfist
    .maxlevel 20
step
    #xprate <1.2
    #label Diplomatic
    .goto 76,42.402,23.602
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈格鲁姆·血拳|r
    .turnin 14432 >>交任务: |cRXP_FRIENDLY_苦酒|r
    .turnin 14433 >>交任务: |cRXP_FRIENDLY_另类的外交|r
    .target Haggrum Bloodfist
step
    #xprate <1.2
    #optional
    .goto 76,42.614,23.709
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安多瑞尔·誓日|r
    .turnin 14430 >>交任务: |cRXP_FRIENDLY_构造体黑客|r
    .target Andorel Sunsworn
step
    #xprate <1.2
    #optional
    .goto 76,42.435,23.696
    .aura 69054 >>|cRXP_WARN_使用你的|r |T132671:0|t[大使伪装] |cRXP_WARN_at|r |cRXP_PICK_Haggrum的烟熏坑|r
    .use 49368
    .isOnQuest 14435
step
    #xprate <1.2
    #optional
    .goto 76,42.614,23.709
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安多瑞尔·誓日|r
    .gossipoption 111853 >>传送至黑喉要塞
    .target Andorel Sunsworn
    .isOnQuest 14435
step
    #xprate <1.2
    #optional
    .goto 76,30.986,29.992
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安多瑞尔·誓日|r
    .complete 14435,1 --Negotiations Sabotaged (1)
    .target Ungarl
    .skipgossip 36618,2,1,1
    .isOnQuest 14435
step
    #xprate <1.2
    #optional
    .goto 76,31.046,29.258,12,0
    .goto 76,31.889,30.192,12,0
    .goto 76,32.188,31.228,12,0
    .goto 76,32.755,32.247
    >>杀死 |cRXP_ENEMY_Blackmaw 战士|r 和 |cRXP_ENEMY_Blackmaw 萨满|r 并杀出黑喉要塞
    .complete 14435,2 --Blackmaw Warrior (4)
    .complete 14435,3 --Blackmaw Shaman (4)
    .mob Blackmaw Warrior
    .mob Blackmaw Shaman
    .isOnQuest 14435
step
    #xprate <1.2
    #optional
    #completewith next
    .goto 76,32.755,32.247,12 >>退出黑喉要塞
    .subzoneskip 1216,1
    .isOnQuest 14435
step
    #xprate <1.2
    #optional
    .goto 76,42.402,23.602
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈格鲁姆·血拳|r
    .turnin 14435 >>交任务: |cRXP_FRIENDLY_黑喉离间计|r
    .target Haggrum Bloodfist
    .isOnQuest 14435
step
    #xprate <1.2
    #completewith next
    .goto 1447/1,-5711.20020,4488.30029,5,0
    .goto 1447/1,-5718.10010,4477.89990,3 >>乘坐电梯到达平台
step
    #xprate <1.2
    .goto 76,42.526,24.562
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_锈水火箭管理员|r
    .gossipoption 112443 >>乘坐火箭前往北火箭终点站
    .timer 51,Northern Rocketway Terminus
    .target Bilgewater Rocket-jockey
    .isOnQuest 14391
step
    #xprate >1.19
    #completewith next
    .goto 76,25.93,49.64,7 >>前往 Rocketway 平台顶部
step
    #xprate >1.19
    .goto 76,25.93,49.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_锈水火箭管理员|r
    .gossipoption 112442 >>乘坐火箭前往北火箭终点站
    .timer 83,Northern Rocketway Terminus 
    .target Bilgewater Rocket-jockey
    .isOnQuest 14391
step
    .goto Azshara,66.50,21.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布利兹·爆裂弹|r
    .fp >>获得苦涩到达飞行路线
    .target Blitz Blastospazz
step
    .goto 76,66.551,20.368
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡雷|r
    .turnin 14391 >>交任务: |cRXP_FRIENDLY_扭转局面|r
    .accept 24467 >>接任务: |cRXP_WARN_黑色的末日|r
    .target Kalec
step
    .goto 76,66.338,20.249
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杰里科斯·熔光|r
    .accept 14297 >>接任务: |cRXP_WARN_提前解放|r
    .target Jellix Fuselighter
step
    .goto 76,66.540,19.590
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_芬诺·布拉斯诺金|r
    .accept 14261 >>接任务: |cRXP_WARN_冰冰冷|r
    .target Feno Blastnoggin
step
    #completewith FadeToBlack
    >>杀死 |cRXP_ENEMY_Twilight Dragon Hunters|r、|cRXP_ENEMY_Twilight Desecrators|r 和 |cRXP_ENEMY_Sable Drakonids|r。掠夺他们的 |T134245:0|t[|cRXP_LOOT_Ironwrought 按键|r]
    >>使用 |T134245:0|t[铁铸钥匙] 打开 |cRXP_PICK_暮光牢笼|r
    .complete 14297,1 --Bilgewater Laborer rescued (4)
    .mob Twilight Dragon Hunter
    .mob Twilight Desecrator
    .mob Sable Drakonid
step
    #completewith LaborerRescue
    .use 49596 >>使用你的 |T133146:0|t[Cryomatic 16] 对 |cRXP_ENEMY_Sable Dragons|r
    >>|cRXP_WARN_这会立即杀死它们|r
    .complete 14261,1 --Sable Drake (8)
    .mob Sable Drake
step
    .goto 76,71.627,16.433
    >>杀死 |cRXP_ENEMY_暮光领主卡特拉娜|r
    >>|cRXP_WARN_忽略|r |cRXP_ENEMY_Malicion|r|cRXP_WARN_。他将被|r |cRXP_FRIENDLY_Kalecgos|r |cRXP_WARN_afterwards 杀死|r
    .complete 24467,1 --|1/1 Twilight Lord Katrana slain
    .complete 24467,2 --|1/1 Malicion slain
    .mob Twilight Lord Katrana
step
    #label FadeToBlack
    .goto 76,71.81,16.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡雷苟斯|r
    .turnin 24467 >>交任务: |cRXP_FRIENDLY_黑色的末日|r
    .target Kalecgos
step
    #label LaborerRescue
    #loop
    .goto 76,66.305,13.159,0
    .waypoint 76,69.095,16.926,40,0
    .waypoint 76,67.738,15.850,40,0
    .waypoint 76,66.305,13.159,40,0
    .waypoint 76,64.272,14.953,40,0
    .waypoint 76,64.953,16.437,40,0
    .waypoint 76,65.883,17.840,40,0
    >>杀死 |cRXP_ENEMY_Twilight Dragon Hunters|r、|cRXP_ENEMY_Twilight Desecrators|r 和 |cRXP_ENEMY_Sable Drakonids|r。掠夺他们的 |T134245:0|t[|cRXP_LOOT_Ironwrought 按键|r]
    >>使用 |T134245:0|t[铁铸钥匙] 打开 |cRXP_PICK_暮光牢笼|r
    .complete 14297,1 --Bilgewater Laborer rescued (4)
    .mob Twilight Dragon Hunter
    .mob Twilight Desecrator
    .mob Sable Drakonid
step
    #loop
    .goto 76,69.901,16.655,0
    .waypoint 76,69.901,16.655,40,0
    .waypoint 76,67.157,14.734,40,0
    .waypoint 76,65.900,16.034,40,0
    .waypoint 76,69.595,19.144,40,0
    .use 49596 >>使用你的 |T133146:0|t[Cryomatic 16] 对 |cRXP_ENEMY_Sable Dragons|r
    >>|cRXP_WARN_这会立即杀死它们|r
    .complete 14261,1 --Sable Drake (8)
    .mob Sable Drake
step
    .goto 76,66.541,19.604
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_芬诺·布拉斯诺金|r
    .turnin 14261 >>交任务: |cRXP_FRIENDLY_冰冰冷|r
    .target Feno Blastnoggin
step
    .goto 76,66.338,20.260
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杰里科斯·熔光|r
    .turnin 14297 >>交任务: |cRXP_FRIENDLY_提前解放|r
    .target Jellix Fuselighter
step
    .goto 76,67.042,20.595
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾索雷葛斯|r
    .accept 14392 >>接任务: |cRXP_WARN_再见吾爱，还有米诺鱼|r
    .target Azuregos
step << Druid
    #completewith DruidTraining1
    .cast 18960 >>施放 |T135758:0|t[传送：月光林地]
    .zoneskip Moonglade
step << Druid
    #label DruidTraining1
    .goto 1450/1,-2593.69995,7867.39990
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_洛甘纳尔|r
    .trainer >>训练你的职业法术
    .target Loganaar
step
    #completewith next
    .hs >>赫尔斯到比尔吉沃特港
    .use 6948
    .subzoneskip 4821
step << Shaman
    .goto 76,56.671,49.531
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Max Avalanche|r
    .trainer >>训练你的职业法术
    .target Max Avalanche
step << Mage
    .goto 76,56.919,49.598
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_“点火器”菲兹|r
    .trainer >>训练你的职业法术
    .target Fizz Lighter
step << Warlock
    .goto 76,56.708,49.283
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾沃·邪指|r
    .trainer >>训练你的职业法术
    .target Evol Fingers
step << Priest
    .goto 76,56.852,50.279
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_修女金筛|r
    .trainer >>训练你的职业法术
    .target Sister Goldskimmer
step << Rogue
    .goto 76,56.884,50.575
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Stinky Shapshiv|r
    .trainer >>训练你的职业法术
    .target Stinky Shapshiv
step << Hunter
    .goto 76,56.914,50.709
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_巴姆·重磅炸弹|r
    .trainer >>训练你的职业法术
    .target Bamm Megabomb
step << Warrior
    .goto 76,57.167,50.105
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_全能战士NX-01型|r, 他在楼上
    .trainer >>训练你的职业法术
    .target Warrior-Matic NX-01
step
    .goto 76,53.264,49.955
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索纳塔·火舞|r
    .turnin 14392 >>交任务: |cRXP_FRIENDLY_再见吾爱，还有米诺鱼|r
    .target Sorata Firespinner
step
    .goto 76,52.977,49.761
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格罗恩|r
    .accept 24497 >>接任务: |cRXP_WARN_再次空降|r
    .target Gurlorn
step
    .goto 76,60.479,52.205
    .vehicle >>骑上 |cRXP_FRIENDLY_Wings of Steel|r
    .timer 130,Airborne Again RP
    .target Wings of Steel
    .isOnQuest 24497
    --VV No need for this if flight path is available automatically
step
    #completewith next
    +|cRXP_WARN_到达后移除|r |T135992:0|t[降落伞] |cRXP_WARN_buff，以免飞入河中|r
step
    .goto 76,13.999,64.836
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡乌格|r
    .turnin 24497 >>交任务: |cRXP_FRIENDLY_再次空降|r
    .accept 14462 >>接任务: |cRXP_WARN_我的头呢？|r
    .accept 24433 >>接任务: |cRXP_WARN_让他们心惧胆寒|r
    .target Chawg
    .isOnQuest 24497
step
    #optional
    #label NorthAzsharaSkip
step
    #completewith next
    .goto Azshara,52.92,49.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克隆姆|r
    .fly Southern Rocketway >>飞往南部火箭终点站
    .target Kroum
    .subzoneskip 1237
step
    #completewith next
    .goto Azshara,50.78,74.52,5,0
    .goto Azshara,50.70,74.22,3 >>乘坐电梯到达平台
step
    .goto Azshara,50.70,74.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_锈水火箭管理员|r
    .gossipoption 112434 >>乘坐火箭前往南部火箭终点站
    .timer 35,Southern Rocketway Terminus
    .target Bilgewater Rocket-jockey
    .subzoneskip 1237
    .isQuestAvailable 14392
step
    #completewith next
    .subzone 1237 >>前往瓦洛莫克
    .isQuestAvailable 14392
step
    .goto 76,13.999,64.836
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡乌格|r
    .accept 14462 >>接任务: |cRXP_WARN_我的头呢？|r
    .accept 24433 >>接任务: |cRXP_WARN_让他们心惧胆寒|r
    .target Chawg
step
    .goto 76,13.854,64.479
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安多瑞尔·誓日|r
    .accept 24434 >>接任务: |cRXP_WARN_特种天兵|r
    .target Andorel Sunsworn
step
    .goto 76,14.346,65.018
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克隆姆|r
    .accept 14475 >>接任务: |cRXP_WARN_落地！|r
    .target Kroum
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Talrendis 哨兵|r、|cRXP_ENEMY_Talrendis 防御者|r 和 |cRXP_ENEMY_Talrendis 博学者|r
    .complete 24433,2 --塔伦迪斯哨兵 (6)
    .mob +塔伦迪斯哨兵
    .complete 24433,1 --塔伦迪斯防御者 (12)
    .mob +塔伦迪斯防御者
    .complete 24434,1 --塔伦迪斯博学者 (5)
    .mob +塔伦迪斯博学者
step
    .goto 76,14.453,75.567
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_掷弹兵队长斯莫科斯|r
    .target Bombardier Captain Smooks
    .turnin 14475 >>交任务: |cRXP_FRIENDLY_落地！|r
    .accept 14476 >>接任务: |cRXP_WARN_遥控引爆|r
step
    .goto 76,15.02,74.28
    >>点击地面上的 |cRXP_PICK_Detonator Charge 1|r
    .complete 14476,1 --Detonator Charge 1 Armed (1)
step
    .goto 76,15.47,73.72
    >>点击地面上的 |cRXP_PICK_Detonator Charge 2|r
    .complete 14476,2 --Detonator Charge 2 Armed (1)
step
    .goto 76,15.57,74.47
    >>点击地面上的 |cRXP_PICK_Detonator Charge 3|r
    .complete 14476,3 --Detonator Charge 3 Armed (1)
step
    .goto 76,14.459,75.569
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_掷弹兵队长斯莫科斯|r
    .turnin 14476 >>交任务: |cRXP_FRIENDLY_遥控引爆|r
    .accept 14477 >>接任务: |cRXP_WARN_摁开关！|r
    .target Bombardier Captain Smooks
step
    .goto 76,14.408,75.734
    >>点击 |cRXP_PICK_Goblin Detonator|r
    .complete 14477,1 --Detonate the Explosives
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Talrendis 哨兵|r、|cRXP_ENEMY_Talrendis 防御者|r 和 |cRXP_ENEMY_Talrendis 博学者|r
    .complete 24433,2 --塔伦迪斯哨兵 (6)
    .mob +塔伦迪斯哨兵
    .complete 24433,1 --塔伦迪斯防御者 (12)
    .mob +塔伦迪斯防御者
    .complete 24434,1 --塔伦迪斯博学者 (5)
    .mob +塔伦迪斯博学者
step
    .goto 76,12.517,67.451
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_史莉琪·剃刀|r
    .turnin 14462 >>交任务: |cRXP_FRIENDLY_我的头呢？|r
    .accept 14464 >>接任务: |cRXP_WARN_一闪必杀|r
    .target Slinky Sharpshiv
step
    #completewith next
    .goto 76,12.517,67.451
    +|cRXP_WARN_和 Slinky 一起爬上塔|r
    .target Slinky Sharpshiv
step
    .goto 76,12.01,68.06
    >>杀死 |cRXP_ENEMY_Captain Grunwald|r。夺取他的 |cRXP_LOOT_Head|r
    .complete 14464,1 --Grunwald's Head (1)
    .mob Captain Grunwald
step
    #loop
    .goto 76,10.899,70.438,0
    .goto 76,11.481,71.991,0
    .waypoint 76,10.899,70.438,50,0
    .waypoint 76,11.481,71.991,50,0
    .waypoint 76,10.320,73.798,50,0
    .waypoint 76,9.448,71.859,50,0
    >>杀死 |cRXP_ENEMY_Talrendis 哨兵|r、|cRXP_ENEMY_Talrendis 防御者|r 和 |cRXP_ENEMY_Talrendis 博学者|r
    .complete 24433,2 --塔伦迪斯哨兵 (6)
    .mob +塔伦迪斯哨兵
    .complete 24433,1 --塔伦迪斯防御者 (12)
    .mob +塔伦迪斯防御者
    .complete 24434,1 --塔伦迪斯博学者 (5)
    .mob +塔伦迪斯博学者
step
    .goto 76,10.56,69.85
    >>点击|cRXP_PICK_博学者召唤石|r
    .turnin 24434 >>交任务: |cRXP_FRIENDLY_特种天兵|r
    .target Lorekeeper's Summoning Stone
step
    #completewith next
    .goto 76,10.56,69.85
    >>点击|cRXP_PICK_博学者召唤石|r
    .gossipoption 111875 >>传送回瓦洛莫克
    .target Lorekeeper's Summoning Stone
step
    .goto 76,14.350,65.023
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克隆姆|r
    .turnin 14477 >>交任务: |cRXP_FRIENDLY_摁开关！|r
    .target Kroum
step
    .goto 76,14.471,65.725
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_初级掷弹兵海克尔|r
    .accept 24430 >>接任务: |cRXP_WARN_遮天蔽日|r
    .target Jr. Bombardier Hackel
step
    .goto 76,14.455,65.770
    .vehicle >>骑上 |cRXP_FRIENDLY_Grounded Wind Rider|r
    .target Grounded Wind Rider
    .isOnQuest 24430
step
    #completewith next
    >>|cRXP_WARN_使用|r |T133709:0|t[投掷炸弹] |cRXP_WARN_摧毁|r |cRXP_ENEMY_塔伦迪斯投剑者|r
    .complete 24430,1 --Talrendis Glaive Thrower (6)
    .mob Talrendis Glaive Thrower
step
    .goto 76,9.239,72.539
    >>|cRXP_WARN_使用|r |T133709:0|t[投掷炸弹] |cRXP_WARN_摧毁|r |cRXP_ENEMY_指挥中心|r
    .complete 24430,2 --Command Center Bombed (1)
step
    #loop
    .goto 76,12.374,72.832,0
    .goto 76,12.825,70.135,0
    .goto 76,11.672,67.149,0
    .goto 76,9.737,69.693,0
    .waypoint 76,12.374,72.832,40,0
    .waypoint 76,12.825,70.135,40,0
    .waypoint 76,11.672,67.149,40,0
    .waypoint 76,9.737,69.693,40,0
    >>|cRXP_WARN_使用|r |T133709:0|t[投掷炸弹] |cRXP_WARN_摧毁|r |cRXP_ENEMY_塔伦迪斯投剑者|r
    .complete 24430,1 --Talrendis Glaive Thrower (6)
    .mob Talrendis Glaive Thrower
step
    #completewith next
    .goto 76,14.471,65.721,50 >>飞回 |cRXP_FRIENDLY_Jr. Bombardier Hackel|r
step
    .goto 76,14.471,65.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_初级掷弹兵海克尔|r
    .turnin 24430 >>交任务: |cRXP_FRIENDLY_遮天蔽日|r
    .target Jr. Bombardier Hackel
step
    .goto 76,13.999,64.836
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡乌格|r
    .turnin 24433 >>交任务: |cRXP_FRIENDLY_让他们心惧胆寒|r
    .turnin 14464 >>交任务: |cRXP_FRIENDLY_一闪必杀|r
    .accept 24439 >>接任务: |cRXP_WARN_征服艾萨拉|r
    .target Chawg
step
    .goto 76,9.15,72.82
    >>杀死建筑物二楼的 |cRXP_ENEMY_Commander Jarrodenus|r
    .complete 24439,1 --The Head of Jarrodenus (1)
    .mob Commander Jarrodenus
step
    #completewith next
    .goto 76,10.56,69.85
    >>点击|cRXP_PICK_博学者召唤石|r
    .gossipoption 111875 >>传送回瓦洛莫克
    .target Lorekeeper's Summoning Stone
step
    .goto 76,13.999,64.836
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡乌格|r
    .turnin 24439 >>交任务: |cRXP_FRIENDLY_征服艾萨拉|r
    .target Chawg
step
    .goto 76,14.345,65.025
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克隆姆|r
    .accept 24463 >>接任务: |cRXP_WARN_探查灰谷|r
    .target Kroum
step
    #completewith next << !Warlock !Paladin
    #completewith FelsteedTraining << Warlock
    #completewith WarhorseTraining << Paladin
    .goto 76,14.346,65.018
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克隆姆|r
    .fly Orgrimmar >>飞往奥格瑞玛
    .target Kroum
step
    .goto 1454/1,-4356.80029,1799.59998
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛奇萨|r
    .train 33388 >>训练学徒骑行
    .target Maztha
    .xp <20,1
    .train 33391,1 --Journeyman Riding
    .train 34090,1 --Expert Riding
    .train 34091,1 --Artisan Riding
    .train 90265,1 --Master Riding
step << Orc !Warlock
    .goto 1454/1,-4569.50000,2095.10010
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奥古纳罗|r
	.vendor >>|cRXP_BUY_如果你的收藏中还没有坐骑，请从他那里购买 a|r |T132224:0|t[Wolf] |cRXP_BUY_|r
	.target Ogunaro Wolfrunner
	.mountcount 75-150,<1
    .xp <20,1
step << Goblin !Warlock
    .goto 1454/1,-4132.89990,1483.09998
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡尔·万金|r
	.vendor >>|cRXP_BUY_如果你的收藏中还没有坐骑，请从他那里购买 a|r |T134237:0|t[Trike] |cRXP_BUY_|r
	.target Kall Worthaton
	.mountcount 75-150,<1
    .xp <20,1
step << !Orc !Goblin !Warlock !Paladin
    .goto 1454/1,-4439.39990,1573.30005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板格雷什卡|r
    .home >>将炉石设为奥格瑞玛
    .target Gryshka
	.mountcount 75-150,<1
step << Troll !Warlock
    #completewith next
    .goto 1454/1,-4370.00000,1799.90002
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_多拉斯|r
    .fly Sen'Jin Village >>飞往森金村
    .target Doras
    .subzoneskip 367
step << Troll !Warlock
    .goto 1411/1,-4882.50000,-857.90002
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_祖尼尔|r
	.vendor >>|cRXP_BUY_如果你的收藏中还没有坐骑，请从他那里购买 a|r |T132253:0|t[猛禽] |cRXP_BUY_|r
	.target Zjolnir
	.mountcount 75-150,<1
    .xp <20,1
step << Undead/BloodElf !Warlock
    .goto 1454/1,-4390.80029,1840.09998
    #completewith next << Undead
    #completewith SilvermoonPort << BloodElf
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Undercity
step << Undead !Warlock
    .goto 1420/0,235.70000,2277.60010
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_撒迦利亚·普斯特|r
	.vendor >>|cRXP_BUY_如果你的收藏中还没有坐骑，就从他那里购买一|r |T132264:0|t[骷髅马] |cRXP_BUY_|r
	.target Zachariah Post
	.mountcount 75-150,<1
    .xp <20,1
step << BloodElf !Warlock
    #completewith SilvermoonPort
    .goto 18,66.21,1.16,20,0
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
step << BloodElf !Warlock
    #label SilvermoonPort
    .goto 1420/0,269.10001,1804.59998,15,0
    .goto 1420/0,346.60001,1806.00000
    .zone Silvermoon City >>前往: |cRXP_PICK_银月城|r
    .mountcount 75,<1
step << BloodElf !Warlock
    #completewith next
    .goto 110,72.396,85.242,12,0
    .goto 1941/0,-4877.20020,7012.10059,15,0
    .zone Eversong Woods >>前往: |cRXP_PICK_永歌森林|r
step << BloodElf !Warlock
    .goto 1941/0,-5096.30029,6844.10059
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维奈丝特拉|r
	.vendor >>|cRXP_BUY_如果你的收藏中还没有坐骑，请从她那里购买 a|r |T132227:0|t[Hawkstrider] |cRXP_BUY_|r
	.target Winaestra
	.mountcount 75-150,<1
    .xp <20,1
step << Tauren !Paladin
    #completewith next
    .goto 1454/1,-4370.00000,1799.90002
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_多拉斯|r
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Doras
    .zoneskip Thunder Bluff
    .zoneskip Mulgore
step << Tauren !Paladin
    #completewith next
    .goto 1456/1,183.30000,-1314.09998,20 >>乘坐电梯离开雷霆崖
    .zoneskip Mulgore
step << Tauren !Paladin
    .goto 1412/1,-392.20001,-2280.00000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哈布·爪蹄|r
	.vendor >>|cRXP_BUY_如果你还没有坐骑，请从她那里购买 a|r |T132243:0|t[科多兽] |cRXP_BUY_|r
	.target Harb Clawhoof
	.mountcount 75-150,<1
    .xp <20,1
step << Warlock
    #label FelsteedTraining
    .goto 1454,54.49,39.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米尔科特|r
    .train 5784 >>列车 |T136103:0|t[费尔斯蒂德]
    .target Mirket
    .mountcount 75-150,<1
step << Paladin
    #label WarhorseTraining
    .goto 1454/1,-4292.50000,1863.70007
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Atohmo|r
    .train 34769 >>训练 |T136103:0|t[召唤战马] << BloodElf
    .train 69820 >>训练 |T132245:0|t[召唤烈日行者科多兽] << Tauren
    .target Sunwalker Atohmo
    .mountcount 75-150,<1
step << !Orc !Goblin !Warlock !Paladin
    #completewith FlyValormok
    .hs >>炉石到奥格瑞玛
    .use 6948
    .zoneskip Azshara
    .zoneskip Orgrimmar
    .zoneskip Ashenvale
step << Warrior/Paladin
    .goto 1454,75.08,36.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_森度吉安|r
    >>|cRXP_BUY_从他那里购买a|r |T135423:0|t[战斧] |cRXP_BUY_|r
    .collect 926,1,24463,1 --Battle Axe (1)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .target Zendo'jian
    .zoneskip Orgrimmar,1
step << Shaman
    .goto 1454,76.12,37.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索玛|r
    >>|cRXP_BUY_从他那里购买|r |T132941:0|t[右手爪] |cRXP_BUY_和|r |T132941:0|t[左手爪] |cRXP_BUY_|r
    >>|cRXP_WARN_如果您没有选择增强专业化，请跳过此步骤！|r
    .collect 15903,1,24463,1 --Collect Right-Handed Claw (1)
    .collect 15907,1,24463,1 --Collect Left-Handed Claw (1)
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.6
    .target Shoma
    .zoneskip Orgrimmar,1
step << Rogue
    .goto 1454,76.12,37.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索玛|r
    >>|cRXP_BUY_从他那里买一把|r |T135419:0|t[长剑] |cRXP_BUY_。当你达到 21 级时装备它|r
    >>|cRXP_WARN_如果你有刺杀或敏锐专长，请购买 a|r |T135342:0|t[Kris] |cRXP_WARN_instead|r
    .collect 923,1,24463,1 --Longsword (1)
    .target Shoma
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
    .xp >21,1
    .zoneskip Orgrimmar,1
step << Rogue
    .goto 1454,76.12,37.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索玛|r
    >>|cRXP_BUY_从他那里购买一把|r |T135419:0|t[长剑] |cRXP_BUY_|r
    >>|cRXP_WARN_如果你有刺杀或敏锐专长，请购买 a|r |T135342:0|t[Kris] |cRXP_WARN_instead|r
    .collect 923,1,24463,1 --Longsword (1)
    .target Shoma
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
    .xp <21,1
    .zoneskip Orgrimmar,1
step << Warrior/Paladin
    #optional
    #optional
    #completewith AzsharaEnd
    +|cRXP_WARN_装备|r |T135423:0|t[战斧]
    .use 926
    .itemcount 926,1
    .itemStat 16,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
step << Shaman
    #optional
    #completewith AzsharaEnd
    #label Knuckles
    +装备 |T132941:0|t[右手爪]
    .use 15903
    .itemcount 15903,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.6
step << Shaman
    #optional
    #completewith AzsharaEnd
    #label Knuckles
    +装备 |T132938:0|t[左手爪]
    .use 15907
    .itemcount 15907,1
    .itemStat 17,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.6
step << Rogue
    #optional
    #completewith AzsharaEnd
    +|cRXP_WARN_装备|r |T135419:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
    .xp <21,1
step << Rogue
    #optional
    #completewith AzsharaEnd
    +|cRXP_WARN_装备|r |T135342:0|t[克里斯]
    .use 2209
    .itemcount 2209,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.9

step
    #label FlyValormok
    .goto 1454/1,-4370.00000,1799.90002
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_多拉斯|r
    .fly Valormok >>飞往瓦洛莫克
    .target Doras
    .zoneskip Azshara
    .zoneskip Ashenvale
step
    #completewith next
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r
step
    .goto 63,94.410,46.819
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库格·血滴|r
    .turnin 24463 >>交任务: |cRXP_FRIENDLY_探查灰谷|r
    .accept 13866 >>接任务: |cRXP_WARN_到农场去！|r
    .target Kulg Gorespatter
step
    #label AzsharaEnd
    .goto 63,94.410,46.819
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库格·血滴|r
    .gossipoption 111683 >>飞往莫尔珊城墙
    .target Kulg Gorespatter
    .isOnQuest 13866
step
    #optional
    .abandon 14407 >>抛弃艾萨拉蓝调
    ]])