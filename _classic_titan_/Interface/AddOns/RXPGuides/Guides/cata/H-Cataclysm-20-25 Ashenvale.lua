local _,addon = ...
if addon.game ~= "CATA" or addon.player.faction ~= 'Horde' then return end

RXPGuides.RegisterGuide([[
#cata
<< Horde
#name 22-27 灰谷
#next 27-31 北荆棘谷
#version 1
--#group RXP 大灾变 (H)
#group RXP 大灾变 1-80（H）
#sub重量 10000

step
    .goto 1413/1,-2251.30005,1236.80005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    .turnin 13866 >>交任务: |cRXP_FRIENDLY_到农场去！|r
    .accept 13612 >>接任务: |cRXP_WARN_莫尔杉的防御|r
    .accept 13618 >>接任务: |cRXP_WARN_找到高拉特！|r
    .target Kadrak
    .isOnQuest 13866
step
    .goto 1413/1,-2251.30005,1236.80005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    .turnin 28493 >>交任务: |cRXP_FRIENDLY_酋长的命令：灰谷！|r
    .accept 13612 >>接任务: |cRXP_WARN_莫尔杉的防御|r
    .accept 13618 >>接任务: |cRXP_WARN_找到高拉特！|r
    .target Kadrak
    .isOnQuest 28493
step
    .goto 1413/1,-2251.30005,1236.80005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    .accept 13612 >>接任务: |cRXP_WARN_莫尔杉的防御|r
    .accept 13618 >>接任务: |cRXP_WARN_找到高拉特！|r
    .target Kadrak
step
    .goto 10,42.27,15.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图伦|r
    .accept 13615 >>接任务: |cRXP_WARN_箭壶见底|r
    .target Truun
step
    .goto 10,42.43,15.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_迪娜·半月|r
    .accept 13613 >>接任务: |cRXP_WARN_救治伤兵|r
    .target Dinah Halfmoon
step
    .goto 10,41.99,15.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gort|r
    .fp The Mor'shan Rampart >>获取 Mor'shan Rampart 飞行路径
    .target Gort Goreflight
step
    #completewith FindGorat
    >>杀死 |cRXP_ENEMY_灰谷散兵s|r 和 |cRXP_ENEMY_Ashenvale Bowmen|r
    .complete 13612,1 --5/5 灰谷散兵s Slain
    .mob +灰谷散兵
    .complete 13612,2 --5/5 Ashenvale Bowmen Slain
    .mob +灰谷弓箭手
step
    #completewith Skirmishers
    .use 45001 >>|cRXP_WARN_使用|r |T133690:0|t[药膏] |cRXP_WARN_on|r |cRXP_FRIENDLY_受伤的莫尔珊防御者|r
    .complete 13613,1 --5/5 Wounded Mor'shan Defenders Rescued
    .target Wounded Mor'shan Defender
step
    #completewith MorshanDefenders
    >>从地面拾取 |cRXP_PICK_Arrows|r
    .complete 13615,1 --10/10 Serviceable Arrow
step
    #label FindGorat
    .goto 63,64.19,84.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高拉特|r
    .turnin 13618 >>交任务: |cRXP_FRIENDLY_找到高拉特！|r
    .accept 13619 >>接任务: |cRXP_WARN_最后的报告|r
    .target Gorat
step
    #label Skirmishers
    #loop
    .goto 63,68.816,82.328,0
    .waypoint 63,66.454,85.871,50,0
    .waypoint 63,70.033,85.211,50,0
    .waypoint 63,68.816,82.328,50,0
    .waypoint 63,67.731,82.870,50,0
    .waypoint 63,66.784,84.708,50,0
    >>杀死 |cRXP_ENEMY_灰谷散兵s|r 和 |cRXP_ENEMY_Ashenvale Bowmen|r
    .complete 13612,1 --5/5 灰谷散兵s Slain
    .mob +灰谷散兵
    .complete 13612,2 --5/5 Ashenvale Bowmen Slain
    .mob +灰谷弓箭手
step
    #label MorshanDefenders
    #loop
    .goto 63,66.934,86.130,0
    .waypoint 63,65.370,85.300,20,0
    .waypoint 63,66.934,86.130,20,0
    .waypoint 63,66.813,84.329,20,0
    .waypoint 63,67.587,83.172,20,0
    .waypoint 63,69.001,83.160,20,0
    .waypoint 63,68.994,86.080,20,0
    .waypoint 10,40.760,12.633,20,0
    .waypoint 63,65.280,86.817,20,0
    .use 45001 >>对 |cRXP_FRIENDLY_受伤的 Mor'shan Defenders|r 使用 |T133690:0|t[药膏]
    .complete 13613,1 --5/5 Wounded Mor'shan Defenders Rescued
    .target Wounded Mor'shan Defender
step
    #loop
    .goto 1440/1,-2057.00000,1391.50000,15,0
    .waypoint 1440/1,-2057.00000,1391.50000,15,0
    .waypoint 1440/1,-2082.40015,1365.00000,15,0
    .waypoint 1440/1,-2105.19995,1352.90002,15,0
    .waypoint 1440/1,-2154.69995,1411.90002,15,0
    .waypoint 1440/1,-2240.50000,1383.09998,15,0
    .waypoint 1440/1,-2280.10010,1393.00000,15,0
    .waypoint 1440/1,-2315.60010,1391.40002,15,0
    .waypoint 1440/1,-2341.69995,1376.00000,15,0
    .waypoint 1440/1,-2344.50000,1410.59998,15,0
    >>从地面拾取 |cRXP_PICK_Arrows|r
    .complete 13615,1 --10/10 Serviceable Arrow
step
    .goto 1413/1,-2251.30005,1236.80005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    .turnin 13612 >>交任务: |cRXP_FRIENDLY_莫尔杉的防御|r
    .turnin 13619 >>交任务: |cRXP_FRIENDLY_最后的报告|r
    .accept 13620 >>接任务: |cRXP_WARN_去找迪娜，立刻出发！|r
    .target Kadrak
step
    .goto 10,42.25,15.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图伦|r
    .turnin 13615 >>交任务: |cRXP_FRIENDLY_箭壶见底|r
    .target Truun
step
    .goto 10,42.43,15.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_迪娜·半月|r
    .turnin 13620 >>交任务: |cRXP_FRIENDLY_去找迪娜，立刻出发！|r
    .turnin 13613 >>交任务: |cRXP_FRIENDLY_救治伤兵|r
    .accept 13621 >>接任务: |cRXP_WARN_高拉特的复仇|r
    .target Dinah Halfmoon
step
    #completewith next
    .goto 63,64.16,84.50
    .cast 62772 >>|cRXP_WARN_使用|r |T134719:0|t[戈拉特的浸染之血] |cRXP_WARN_on|r |cRXP_FRIENDLY_Gorat|r
    .timer 103,Gorat's Vengeance RP
    .use 45023
step
    .goto 63,65.72,82.20
    >>跟随 |cRXP_FRIENDLY_Gorat 的精神|r 并在 |cRXP_ENEMY_Captain Elendilad|r 出现时杀死他
    .complete 13621,1 --1/1 Captain Elendilad slain
    .mob Captain Elendilad
    .target Gorat
    .target Spirit of Gorat
    .use 45023
step
    .goto 1413/1,-2251.30005,1236.80005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    .turnin 13621 >>交任务: |cRXP_FRIENDLY_高拉特的复仇|r
    .target Kadrak
step
    .goto 10,42.26,15.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_图伦|r
    .accept 13628 >>接任务: |cRXP_WARN_有木头没有？|r
    .target Truun
step
    .goto 1413/1,-2251.30005,1236.80005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    >>从他那里获得 |cRXP_LOOT_Kadrak's Reins|r
    .collect 45051,1,13628,1 --Kadrak's Reins (1)
    .target Kadrak
    .skipgossip
step
    .goto 10,42.84,16.15
    >>坐骑 |cRXP_FRIENDLY_Brutusk|r
    .complete 13628,1 --1/1 Brutusk mounted
    .timer 39,Got Wood? RP
    .target Brutusk
    --VV Timer
step
    .goto 63,72.93,80.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈尔卡|r
    .turnin 13628 >>交任务: |cRXP_FRIENDLY_有木头没有？|r
    .accept 13640 >>接任务: |cRXP_WARN_资材管理|r
    .target Gorka
step
    #loop
    .goto 1440/1,-2385.00000,1520.30005,0
    .goto 1440/1,-2437.60010,1554.80005,30,0
    .goto 1440/1,-2417.50000,1496.09998,30,0
    .goto 1440/1,-2385.00000,1520.30005,30,0
    .goto 1440/1,-2373.19995,1467.50000,30,0
    .goto 1440/1,-2383.90015,1405.90002,30,0
    .goto 1440/1,-2323.00000,1496.50000,30,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Demoralized Peons|r
    >>|cRXP_WARN_跟随他们并保护他们免受|r |cRXP_ENEMY_Ashenvale Stalkers|r |cRXP_WARN_的伤害，因为他们开始砍伐木材。拾取地面上出现的|r |cRXP_LOOT_新砍伐的木材|r |cRXP_WARN_|r
    .complete 13640,1 --5/5 Freshly Cut Wood
    .skipgossip
    .target Demoralized Peon
    .mob Ashenvale Stalker
step
    .goto 63,72.93,80.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈尔卡|r
    .turnin 13640 >>交任务: |cRXP_FRIENDLY_资材管理|r
    .accept 13651 >>接任务: |cRXP_WARN_需要加点油|r
    .target Gorka
step
    #completewith next
    >>如果他醒了，就杀死 |cRXP_ENEMY_Sharptalon|r。从他身上搜刮 |T136063:0|t[|cRXP_LOOT_Sharptalon's Claw|r] 并使用它开始任务
    .collect 16305,1,2 --Sharptalon's Claw (1)
    .accept 2 >>接任务: |cRXP_LOOT_沙普塔隆的爪子|r
    .unitscan Sharptalon
    .use 16305
    .maxlevel 24
step
    #loop
    .goto 1440/1,-2566.90015,1799.70007,0
    .waypoint 1440/1,-2514.19995,1700.09998,50,0
    .waypoint 1440/1,-2566.90015,1799.70007,50,0
    .waypoint 1440/1,-2615.00000,1843.20007,50,0
    .waypoint 1440/1,-2497.90015,1864.70007,50,0
    .waypoint 1440/1,-2522.19995,1952.50000,50,0
    .waypoint 1440/1,-2606.50000,1940.30005,50,0
    .waypoint 1440/1,-2615.00000,1855.50000,50,0
    >>杀死 |cRXP_ENEMY_Rotting Slime|r。掠夺他们的 |cRXP_LOOT_Natural Oil|r
    .complete 13651,1 --5/5 Natural Oil
    .mob Rotting Slime
step
    .goto 63,72.93,80.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈尔卡|r
    .turnin 13651 >>交任务: |cRXP_FRIENDLY_需要加点油|r
    .accept 13653 >>接任务: |cRXP_WARN_碎木的危机|r
    .target Gorka
step
    .goto 63,72.93,80.44
    .gossipoption 111661 >>对话: |cRXP_FRIENDLY_戈尔卡|r
    .timer 79,Crisis at Splintertree RP
    .target Gorka
    .isOnQuest 13653
step
    .goto 63,72.93,80.44
    >>与 |cRXP_FRIENDLY_Gorka|r 一起返回莫尔珊城墙
    >>|cRXP_WARN_确保你没有被骑乘！|r
    .complete 13653,1 --1/1 Gorka accompanied to Mor'shan Ramparts
    .target Gorka
    .skipgossip
    --VV Timer
step
    .goto 10,42.71,14.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    .turnin 13653 >>交任务: |cRXP_FRIENDLY_碎木的危机|r
    .target Kadrak
    .accept 13712 >>接任务: |cRXP_WARN_雷霆救兵！|r
    --VV Timer
step
    .goto 10,42.71,14.95
    .gossipoption 111656 >>对话: |cRXP_FRIENDLY_卡德拉克|r
    .timer 110,To the Rescue! RP
    >>|cRXP_WARN_此任务可能有错误！如果是这种情况，请跳过此步骤|r
    .target Kadrak
    .isOnQuest 13712
step
    .goto 63,73.59,62.19
    >>抵达斯普林特树岗哨
    >>|cRXP_WARN_此任务可能有错误！如果是这种情况，请跳过此步骤|r
    .complete 13712,1 --1/1 Splintertree Post Siege Broken
step
    .goto 63,73.61,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    .turnin 13712 >>交任务: |cRXP_FRIENDLY_雷霆救兵！|r
    .accept 13803 >>接任务: |cRXP_WARN_弱者的血|r
    .target Kadrak
    .isQuestComplete 13712
step
    #optional
    .goto 63,73.61,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    .accept 13803 >>接任务: |cRXP_WARN_弱者的血|r
    .target Kadrak
    .isQuestTurnedIn 13712
step
    #completewith next
    .subzone 431 >>前往斯普林特里岗哨
    .isQuestAvailable 13712
step
    .goto 63,73.19,61.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乌尔格拉|r
    .fp >>获取 Splintertree Post 飞行路径
    .target Vhulgra
step
    .goto 63,73.56,60.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库莱比|r
    .accept 6503 >>接任务: |cRXP_LOOT_灰谷先驱者|r
    .target Kuray'bin
    .isQuestTurnedIn 13712
step
    .goto 63,74.00,60.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板凯利斯克|r
    .home >>将你的炉石设置为Splintertree Post
    .target Innkeeper Kaylisk
    .isQuestTurnedIn 13712
step
    .goto 63,73.19,60.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦鲁莎|r
    .accept 26448 >>接任务: |cRXP_WARN_消灭军团|r
    .target Valusha
    .isQuestTurnedIn 13712
step
    .goto 63,72.20,57.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜莱克|r
    .turnin 13803 >>交任务: |cRXP_FRIENDLY_弱者的血|r
    .accept 13805 >>接任务: |cRXP_WARN_刺穿他们的心！|r
    .target Durak
    .isQuestTurnedIn 13712
step
    .goto 63,73.83,62.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_皮克希尔|r
    .accept 13801 >>接任务: |cRXP_WARN_死精灵上路|r
    .target Pixel
    .isQuestTurnedIn 13712
step
    .goto 63,73.34,62.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎木攻城车|r
    .accept 13730 >>接任务: |cRXP_WARN_邪火烧身|r
    .target Splintertree Demolisher
    .isQuestTurnedIn 13712
step
    #completewith FelFires
    >>杀死邪火岭的|cRXP_ENEMY_Demons|r
    .complete 26448,1 --15/15 Demons Slain
    .mob Mannaroc Lasher
    .mob Roaming Felguard
    .mob Searing Infernal
step
    #completewith KillDemons
    >>|cRXP_ENEMY_Demons|r 中的一个可能会掉落 |T134943:0|t[|cRXP_LOOT_Diabolical Plans|r]。使用它来开始任务
    .collect 23798,1,26447 --Diabolical Plans (1)
    .accept 26447 >>接任务: |cRXP_WARN_恶魔的计划|r
    .isQuestTurnedIn 13712
step
    #label FelFires
    #loop
    .goto 63,81.928,66.385,0
    .waypoint 63,83.797,70.490,30,0
    .waypoint 63,84.297,67.684,30,0
    .waypoint 63,83.339,66.328,30,0
    .waypoint 63,82.818,66.955,30,0
    .waypoint 63,81.928,66.385,30,0
    .waypoint 63,81.788,65.245,30,0
    .waypoint 63,80.768,64.565,30,0
    .waypoint 63,80.654,67.347,30,0
    .waypoint 63,81.829,69.984,30,0
    .use 45478 >>|cRXP_WARN_使用|r |T237030:0|t[强化罐] |cRXP_WARN_on 绿色火焰|r
    .complete 13730,1 --7/7 Fel Fires Siphoned
    .isQuestTurnedIn 13712
step
    #label KillDemons
    .goto 63,81.928,66.385,0
    .waypoint 63,83.797,70.490,50,0
    .waypoint 63,84.297,67.684,50,0
    .waypoint 63,83.339,66.328,50,0
    .waypoint 63,82.818,66.955,50,0
    .waypoint 63,81.928,66.385,50,0
    .waypoint 63,81.788,65.245,50,0
    .waypoint 63,80.768,64.565,50,0
    .waypoint 63,80.654,67.347,50,0
    .waypoint 63,81.829,69.984,50,0
    >>杀死邪火岭的|cRXP_ENEMY_Demons|r
    .complete 26448,1 --15/15 Demons Slain
    .mob Mannaroc Lasher
    .mob Roaming Felguard
    .mob Searing Infernal
    .isQuestTurnedIn 13712
step
    #completewith DorDanilDen
    >>杀死 |cRXP_ENEMY_Sharptalon|r。从他身上搜刮 |T136063:0|t[|cRXP_LOOT_Sharptalon's Claw|r] 并使用它开始任务
    .collect 16305,1,2 --Sharptalon's Claw (1)
    .accept 2 >>接任务: |cRXP_LOOT_沙普塔隆的爪子|r
    .unitscan Sharptalon
    .use 16305
    .maxlevel 24
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Ashenvale Outrunners|r
    >>|cRXP_WARN_它们潜伏在树丛附近|r
    .complete 6503,1 --9/9 Ashenvale Outrunners Killed
    .unitscan Ashenvale Outrunner
step
    #label DorDanilDen
    .goto 63,75.66,75.32,20 >>进入 Dor'Danil Barrow Den
    .isQuestTurnedIn 13712
    .isOnQuest 13805
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Severed Keepers|r 和 |cRXP_ENEMY_Severed Druids|r
    .complete 13801,1 --15/15 Night Elf Ghosts Slain
    .mob Severed Druid
    .mob Severed Keeper
step
    .goto 63,75.52,74.20
    .use 45683 >>|cRXP_WARN_使用|r |T134840:0|t[卡多雷的污染之血] |cRXP_WARN_位于洞穴中心|r
    .complete 13805,1 --1/1 Forest Heart Corrupted
    .isQuestTurnedIn 13712
step
    #loop
    .goto 63,76.929,74.847,0
    .waypoint 63,75.394,75.203,15,0
    .waypoint 63,75.842,76.211,15,0
    .waypoint 63,76.208,75.300,15,0
    .waypoint 63,76.929,74.847,15,0
    .waypoint 63,77.356,75.219,15,0
    .waypoint 63,77.359,75.949,15,0
    .waypoint 63,76.722,75.943,15,0
    .waypoint 63,77.401,74.644,15,0
    >>完成击杀 |cRXP_ENEMY_Severed Keepers|r 和 |cRXP_ENEMY_Severed Druids|r
    .complete 13801,1 --15/15 Night Elf Ghosts Slain
    .mob Severed Druid
    .mob Severed Keeper
    .isQuestTurnedIn 13712
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Sharptalon|r。从他身上搜刮 |T136063:0|t[|cRXP_LOOT_Sharptalon's Claw|r] 并使用它开始任务
    .collect 16305,1,2 --Sharptalon's Claw (1)
    .accept 2 >>接任务: |cRXP_LOOT_沙普塔隆的爪子|r
    .unitscan Sharptalon
    .use 16305
    .maxlevel 24
step
    #loop
    .goto 63,74.504,72.562,0
    .waypoint 63,74.504,72.562,30,0
    .waypoint 63,71.936,73.893,30,0
    .waypoint 63,71.127,73.817,30,0
    .waypoint 63,71.392,72.955,30,0
    .waypoint 63,71.921,70.364,30,0
    .waypoint 63,72.913,70.286,30,0
    .waypoint 63,73.638,70.814,30,0
    .waypoint 63,74.243,69.532,30,0
    .waypoint 63,75.577,70.316,30,0
    .waypoint 63,74.493,72.447,30,0
    >>完成击杀 |cRXP_ENEMY_Ashenvale Outrunners|r
    >>|cRXP_WARN_它们潜伏在树丛附近|r
    .complete 6503,1 --9/9 Ashenvale Outrunners Killed
    .unitscan Ashenvale Outrunner
    .isQuestTurnedIn 13712
step
    #loop
    .goto 1440/1,-2557.50000,1751.50000,0
    .waypoint 1440/1,-2525.19995,1684.30005,40,0
    .waypoint 1440/1,-2557.50000,1751.50000,40,0
    .waypoint 1440/1,-2578.90015,1805.80005,40,0
    .waypoint 1440/1,-2494.19995,1868.70007,40,0
    .waypoint 1440/1,-2416.10010,1835.40002,40,0
    .waypoint 1440/1,-2387.90015,1787.09998,40,0
    .waypoint 1440/1,-2480.90015,1737.70007,40,0
    >>杀死 |cRXP_ENEMY_Sharptalon|r。从他身上搜刮 |T136063:0|t[|cRXP_LOOT_Sharptalon's Claw|r] 并使用它开始任务
    .collect 16305,1,2 --Sharptalon's Claw (1)
    .accept 2 >>接任务: |cRXP_LOOT_沙普塔隆的爪子|r
    .unitscan Sharptalon
    .use 16305
    .isQuestTurnedIn 13712
    .maxlevel 24
step << skip
    #completewith next
    .hs >>Hearth 至 Splintertree Post
    .use 6948
    .subzoneskip 431
    --Need hearth cd for zoram strand
step
    .goto 63,73.87,62.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_皮克希尔|r
    .turnin 13801 >>交任务: |cRXP_FRIENDLY_死精灵上路|r
    .target Pixel
    .isQuestTurnedIn 13712
step
    .goto 63,73.61,62.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    .turnin 13805 >>交任务: |cRXP_FRIENDLY_刺穿他们的心！|r
    --.accept 13808 >>接任务: |cRXP_WARN_不可能是真的任务|r
    .accept 13848 >>接任务: |cRXP_WARN_凶讯使者|r
    .target Kadrak
    .isQuestTurnedIn 13712
step
    #questguide
    .goto 63,73.61,62.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡德拉克|r
    .turnin 13805 >>交任务: |cRXP_FRIENDLY_刺穿他们的心！|r
    .accept 13808 >>接任务: |cRXP_WARN_不可能是真的任务|r
    .accept 13848 >>接任务: |cRXP_WARN_凶讯使者|r
    .target Kadrak
    .isQuestTurnedIn 13712
step
    .goto 63,73.32,62.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎木攻城车|r
    .turnin 13730 >>交任务: |cRXP_FRIENDLY_邪火烧身|r
    --.accept 13751 >>接任务: |cRXP_WARN_谁都别告诉！|r
    .target Splintertree Demolisher
    .isQuestTurnedIn 13712
step
    #questguide
    .goto 63,73.32,62.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎木攻城车|r
    .turnin 13730 >>交任务: |cRXP_FRIENDLY_邪火烧身|r
    .accept 13751 >>接任务: |cRXP_WARN_谁都别告诉！|r
    .target Splintertree Demolisher
    .isQuestTurnedIn 13712
step
    .goto 63,73.56,60.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_库莱比|r
    .turnin 6503 >>交任务: |cRXP_FRIENDLY_灰谷先驱者|r
    .target Kuray'bin
    .isQuestTurnedIn 13712
step
    .goto 63,73.16,60.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦鲁莎|r
    .turnin 26448 >>交任务: |cRXP_FRIENDLY_消灭军团|r
    .turnin 26447 >>交任务: |cRXP_FRIENDLY_恶魔的计划|r
    --.accept 26449 >>接任务: |cRXP_WARN_绝不再会了！|r
    .target Valusha
    .isOnQuest 26447
step
    .goto 63,73.16,60.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦鲁莎|r
    .turnin 26448 >>交任务: |cRXP_FRIENDLY_消灭军团|r
    .target Valusha
    .isQuestTurnedIn 13712
--step
    --.goto 63,73.16,60.10
    -->>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦鲁莎|r
    --.accept 26449 >>接任务: |cRXP_WARN_绝不再会了！|r
    --.target Valusha
    --.isQuestTurnedIn 26447
    --Not worth doing

    --Could go straight to Zoram Strand from here. The 13751 chain is bad xp/hr (13751/13797/13798/13841/13842)

step
    #questguide
    .goto 63,72.20,57.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜莱克|r
    .turnin 13751 >>交任务: |cRXP_FRIENDLY_谁都别告诉！|r
    .accept 13797 >>接任务: |cRXP_WARN_肮脏的种子|r
    .target Durak
step
    #questguide
    .goto 63,72.62,58.34
    >>掠夺 |cRXP_PICK_新鲜碎石|r 散布于洞穴各处，以换取 |cRXP_LOOT_矿石块|r
    .complete 13797,1 --10/10 Chunk of Ore
step
    #questguide
    .goto 63,72.20,57.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜莱克|r
    .turnin 13797 >>交任务: |cRXP_FRIENDLY_肮脏的种子|r
    .accept 13798 >>接任务: |cRXP_WARN_毁灭之雨|r
    .target Durak
step
    #questguide
    .goto 63,74.09,62.92
    .use 45598 >>|cRXP_WARN_爬上塔并瞄准|r |T134569:0|t[Accursed Ore] |cRXP_WARN_at|r |cRXP_ENEMY_Raging Ancients|r |cRXP_WARN_and|r |cRXP_ENEMY_Attacking Elves|r
    .complete 13798,2 --5/5 Raging Ancients Slain
    .complete 13798,1 --30/30 Attacking Elves Slain
    .mob Raging Ancients
    .mob Ashenvale Assailant
    .mob 灰谷弓箭手
    --VV Dogshit quest, item has 15sec cd and must be used like 10+ 次。但任务奖励不错
step
    #questguide
    .goto 63,72.18,57.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜莱克|r
    .turnin 13798 >>交任务: |cRXP_FRIENDLY_毁灭之雨|r
    .target Durak
step
    #questguide
    .goto 63,73.34,62.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎木攻城车|r
    .accept 13841 >>接任务: |cRXP_WARN_难辞其咎|r
    .target Splintertree Demolisher
    .isQuestTurnedIn 13798
step
    #questguide
    .goto 63,82.55,53.63
    .use 45710 >>|cRXP_WARN_使用你的|r |T133639:0|t[秘密信号粉]|cRXP_WARN_at 阴燃火盆|r
    .complete 13808,1 --1/1 Smoldering Brazier lit
step
    #questguide
    .goto 63,82.54,53.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科罗克|r
    .turnin 13808 >>交任务: |cRXP_FRIENDLY_不可能是真的任务|r
    .accept 13815 >>接任务: |cRXP_WARN_伐木|r
    .accept 13865 >>接任务: |cRXP_WARN_脏活|r
    .target Krokk
step
    #questguide
    #completewith ChopSomeTrees
    >>杀死 |cRXP_ENEMY_Ashenvale 侦察兵|r
    .complete 13865,4 --12/12 Ashenvale Scouts defeated
    .mob Ashenvale Scout
step
    #questguide
    #completewith next
    .use 45807 >>|cRXP_WARN_使用你的|r |T132399:0|t[碎木斧] |cRXP_WARN_砍倒|r |cRXP_FRIENDLY_灰谷橡树|r
    .complete 13815,1 --6/6 Ashenvale Oaks Chopped Down
    .target Ashenvale Oak
step
    #questguide
    >>杀死 |cRXP_ENEMY_Endolar|r、|cRXP_ENEMY_Arminon|r 和 |cRXP_ENEMY_Dorinar|r
    .goto 63,85.46,56.04
    .complete 13865,1 --1/1 Protector Endolar slain
    .goto 63,85.74,57.97
    .complete 13865,3 --1/1 Protector Arminon slain
    .goto 63,85.36,60.68
    .complete 13865,2 --1/1 Protector Dorinar slain
    .mob Protector Endolar
    .mob Protector Arminon
    .mob Protector Dorinar
step
    #questguide
    #label ChopSomeTrees
    .goto 63,86.51,54.67
    .use 45807 >>|cRXP_WARN_使用你的|r |T132399:0|t[碎木斧] |cRXP_WARN_砍倒|r |cRXP_FRIENDLY_灰谷橡树|r
    .complete 13815,1 --6/6 Ashenvale Oaks Chopped Down
    .target Ashenvale Oak
step
    #questguide
    .goto 63,85.53,56.74
    >>完成击杀|cRXP_ENEMY_Ashenvale Scouts|r
    .complete 13865,4 --12/12 Ashenvale Scouts defeated
    .mob Ashenvale Scout

    --Quest below (26449) not worth, too much travel

step
    #questguide
    #completewith next
    .subzone 435 >>前往恶魔瀑布峡谷
step
    #questguide
    .goto 63,89.75,76.72
    >>杀死 |cRXP_ENEMY_Gorgannon|r。夺取他的 |cRXP_LOOT_Blade|r
    .complete 26449,1 --1/1 Gorgannon's Flaming Blade
    .mob Gorgannon
    .isQuestTurnedIn 26447
step
    #questguide
    .goto 63,78.46,83.89
    >>杀死 |cRXP_ENEMY_Diathorus the Seeker|r。掠夺他的 |cRXP_LOOT_Spear|r。
    >>|cRXP_WARN_他位于进入洞穴后遇到的第一座桥对面|r
    .complete 26449,2 --1/1 Seeker's Fel Spear
    .mob Diathorus the Seeker
    .isQuestTurnedIn 26447
step
    #questguide
    .goto 63,82.54,53.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科罗克|r
    .use 45710 >>|cRXP_WARN_使用你的|r |T133639:0|t[秘密信号粉] |cRXP_WARN_at 阴燃火盆召唤|r |cRXP_FRIENDLY_Krokk|r
    .turnin 13815 >>交任务: |cRXP_FRIENDLY_伐木|r
    .turnin 13865 >>交任务: |cRXP_FRIENDLY_脏活|r
    .accept 13870 >>接任务: |cRXP_WARN_尽善尽美|r
    .target Krokk
step
    #questguide
    .goto 63,90.94,58.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_监工古尔萨克|r
    .turnin 13870 >>交任务: |cRXP_FRIENDLY_尽善尽美|r
    .accept 13871 >>接任务: |cRXP_WARN_保安！|r
    .target Overseer Gorthak
step
    #questguide
    .goto 63,89.97,59.10
    >>跑出去然后左转。杀死跳到你身上的 |cRXP_ENEMY_Assassin|r
    .complete 13871,1 --1/1 Kaldorei Assassin's Head
    .unitscan Kaldorei Assassin
step
    #questguide
    .goto 63,90.94,58.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_监工古尔萨克|r
    .turnin 13871 >>交任务: |cRXP_FRIENDLY_保安！|r
    .target Overseer Gorthak
step
    #questguide
    .goto 63,90.75,58.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_守护者曼纳林|r
    .accept 13873 >>接任务: |cRXP_WARN_茜拉尔的遗愿|r
    .target Guardian Menerin
step
    #questguide
    .goto 63,89.60,48.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_守护者古塔尔|r
    .turnin 13873 >>交任务: |cRXP_FRIENDLY_茜拉尔的遗愿|r
    .accept 13875 >>接任务: |cRXP_WARN_古塔尔的请求|r
    .target Guardian Gurtar
step
    #label Bloodcups
    #questguide
    .goto 63,73.29,60.22
    >>从地面拾取 |cRXP_PICK_Thorned Bloodcups|r
    >>|cRXP_WARN_在通往 Splintertree Post 的路上可以找到很多|r
    .collect 46315,8,13875,1 --Thorned Bloodcup (8)
step
    #questguide
    #requires Bloodcups
    .use 46316 >>使用 |T134892:0|t[Orc-Hair Braid] 制作 |cRXP_LOOT_Bloodcup Braid|r
    .complete 13875,1 --1/1 Bloodcup Braid
step
    #questguide
    .goto 63,73.34,62.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_碎木攻城车|r
    .turnin 13875 >>交任务: |cRXP_FRIENDLY_古塔尔的请求|r
    .target Splintertree Demolisher
step
    #questguide
    .goto 63,73.15,60.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_瓦鲁莎|r
    .turnin 26449 >>交任务: |cRXP_FRIENDLY_绝不再会了！|r
    .target Valusha
    .isQuestComplete 26447
step
    #questguide
    .goto 63,73.74,61.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_洛克·奥卡尔|r
    .accept 13806 >>接任务: |cRXP_WARN_恶魔使命|r
    .target Locke 好的arr
    .isQuestTurnedIn 26449
step
    #questguide
    .goto 63,73.86,62.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_皮克希尔|r
    .accept 6441 >>接任务: |cRXP_LOOT_萨特之角|r
    .target Pixel
    .isQuestTurnedIn 26449
step
    #questguide
    #completewith next
    .subzone 430 >>向北前往萨提纳尔
    .isQuestTurnedIn 26449
step
    #questguide
    #completewith next
    >>杀死 |cRXP_ENEMY_Satyrs|r。掠夺他们的 |cRXP_LOOT_Horns|r
    .complete 6441,1 --16/16 Satyr Horns
    .mob Bleakheart Hellcaller
    .mob Bleakheart Satyr
    .mob Bleakheart Trickster
    .mob Bleakheart Shadowstalker
    .isQuestTurnedIn 26449
step
    #questguide
    .goto 63,79.48,50.21
    >>|TInterface/GossipFrame/HealerGossipIcon:0|t点击紫色|cRXP_FRIENDLY_Ritual Gems|r
    .complete 13806,1 --12/12 Demon Portals Interrupted
    .isQuestTurnedIn 26449
step
    #questguide
    .goto 63,81.69,49.40
    >>杀死 |cRXP_ENEMY_Satyrs|r。掠夺他们的 |cRXP_LOOT_Horns|r
    .complete 6441,1 --16/16 Satyr Horns
    .mob Bleakheart Hellcaller
    .mob Bleakheart Satyr
    .mob Bleakheart Trickster
    .mob Bleakheart Shadowstalker
    .isQuestTurnedIn 26449
step
    #questguide
    .goto 63,73.87,62.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_皮克希尔|r
    .turnin 6441 >>交任务: |cRXP_FRIENDLY_萨特之角|r
    .target Pixel
step
    #questguide
    .goto 63,73.78,61.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_洛克·奥卡尔|r
    .turnin 13806 >>交任务: |cRXP_FRIENDLY_恶魔使命|r
    .target Locke 好的arr
    .isQuestTurnedIn 26449
step
    #xprate >1.19
    .maxlevel 24,AshenvaleEnd
    .goto 63,73.19,61.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乌尔格拉|r
    .gossipoption 111682 >>飞往佐拉姆海岸
    .timer 165, Zoram Strand, Ashenvale
    .target Vhulgra
    .subzoneskip 414
    .isQuestTurnedIn 13712
step
    #xprate <1.2
    .maxlevel 25,AshenvaleEnd
    .goto 63,73.19,61.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乌尔格拉|r
    .gossipoption 111682 >>飞往佐拉姆海岸
    .timer 165, Zoram Strand, Ashenvale
    .target Vhulgra
    .subzoneskip 414
    .isQuestTurnedIn 13712
step
    #completewith next
    .subzone 2897 >>前往佐拉姆加前哨站 
    .isQuestAvailable 13712
step
    .goto 63,11.16,34.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安德鲁克|r
    .fp >>获取佐拉姆加前哨站飞行路径
    .target Andruk
step
    .goto 63,12.11,33.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_指挥官恐牙|r
    .turnin 13848 >>交任务: |cRXP_FRIENDLY_凶讯使者|r
    .accept 13890 >>接任务: |cRXP_WARN_别让火灭了|r
    --.accept 26894 >>接任务: |cRXP_WARN_黑暗深渊|r
    .target Commander Grimfang
    --26894 BFD dungeon quest
step
    .goto 63,11.64,35.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达格鲁·怒锤|r
    .accept 13883 >>接任务: |cRXP_WARN_破船一艘|r
    .accept 26890 >>接任务: |cRXP_LOOT_阿库麦尔水晶|r
    .target Dagrun Ragehammer
step
    .goto 63,12.66,35.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛鲁凯|r
    .accept 6442 >>接任务: |cRXP_LOOT_佐拉姆海岸的纳迦|r
    .target Marukai
step
    .goto 63,12.99,34.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板杜拉斯|r
    .home >>将你的炉石设为佐拉姆加前哨站
    .target Innkeeper Duras
step
    .goto 63,12.77,34.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_穆格拉什|r
    >>|cRXP_WARN_这将启动护送任务。请小心，因为它很难|r
    .accept 6641 >>接任务: |cRXP_LOOT_鞭笞者沃尔沙|r
    .target Muglash
step
    #completewith LitLightHouse
    >>杀死 |cRXP_ENEMY_Wrathtail Nagas|r。掠夺他们的 |cRXP_LOOT_Heads|r
    .complete 6442,1 --20/20 Wrathtail Head
    .mob Wrathtail Waverider
    .mob Wrathtail Sorceress
step
    .goto 63,9.66,27.64
    >>跟随 |cRXP_FRIENDLY_Muglash|r。到达那里后点击 |cRXP_PICK_Naga Brazier|r
    >>|cRXP_WARN_将会有|r |cRXP_ENEMY_Naga|r |cRXP_WARN_一波波出现。一旦|r |cRXP_ENEMY_Vorsha|r |cRXP_WARN_出现，请小心，他会猛烈攻击|r
    .complete 6641,1 --Defeat Vorsha the Lasher
    .mob Vorsha the Lasher
step
    #completewith next
    >>从海底抢夺 |cRXP_LOOT_Sunken Scrap Metal|r
    .complete 13883,1 --10/10 Sunken Scrap Metal
step
    #loop
    .goto 1440/1,1237.40002,3394.30005,0
    .waypoint 1440/1,1159.70007,3451.69995,50,0
    .waypoint 1440/1,1237.40002,3394.30005,50,0
    .waypoint 1440/1,1316.80005,3368.30005,50,0
    .waypoint 1440/1,1395.90002,3382.90015,50,0
    >>杀死 |cRXP_ENEMY_Mystlash Hydras|r。掠夺他们的 |cRXP_LOOT_Blubber|r
    .collect 46365,10,13890,1 --Mystlash Hydra Blubber (10)
    .mob Mystlash Hydra
step
    #loop
    .goto 1440/1,1372.59998,3405.80005,0
    .waypoint 1440/1,1372.59998,3405.80005,40,0
    .waypoint 1440/1,1201.90002,3394.40015,40,0
    .waypoint 1440/1,1350.70007,3329.19995,40,0
    >>完成从海底掠夺 |cRXP_LOOT_Sunken Scrap Metal|r
    .complete 13883,1 --10/10 Sunken Scrap Metal
step
    #completewith next
    .goto 63,11.69,35.36,30 >>前往佐拉姆加前哨的熔炉
step
    .goto 63,11.69,35.36
    .use 46365 >>|cRXP_WARN_使用|r |T237338:0|t[Mystlash Hydra Blubber] |cRXP_WARN_制作|r |cRXP_LOOT_Mystlash Hydra Oil|r
    >>|cRXP_WARN_你需要前往佐拉姆加前哨的熔炉才能完成此操作|r
    .collect 46366,1,13890,1 --Mystlash Hydra Oil (1)
step
    .goto 63,11.57,35.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达格鲁·怒锤|r
    .turnin 13883 >>交任务: |cRXP_FRIENDLY_破船一艘|r
    .target Dagrun Ragehammer
step
    #label LitLightHouse
    .goto 63,6.74,28.97
    >>前往灯塔顶层并点燃火
    .complete 13890,1 --1/1 Lighthouse Fire Lit
step
    #loop
    .goto 1440/1,954.29999,3590.19995,0
    .waypoint 1440/1,1234.80005,3533.40015,50,0
    .waypoint 1440/1,1061.30005,3553.60010,50,0
    .waypoint 1440/1,954.29999,3590.19995,50,0
    .waypoint 1440/1,889.79999,3661.40015,50,0
    .waypoint 1440/1,814.90002,3866.40015,50,0
    >>杀死 |cRXP_ENEMY_Wrathtail Nagas|r。掠夺他们的 |cRXP_LOOT_Heads|r
    .complete 6442,1 --20/20 Wrathtail Head
    .mob Wrathtail Waverider
    .mob Wrathtail Sorceress
step
    .goto 63,12.11,33.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_指挥官恐牙|r
    .turnin 13890 >>交任务: |cRXP_FRIENDLY_别让火灭了|r
    .accept 13920 >>接任务: |cRXP_WARN_你走之前……|r
    .target Commander Grimfang
step
    .goto 63,12.46,35.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_战歌信使|r
    .turnin 6641 >>交任务: |cRXP_FRIENDLY_鞭笞者沃尔沙|r
    .target Warsong Runner
step
    .goto 63,12.66,35.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛鲁凯|r
    .turnin 6442 >>交任务: |cRXP_FRIENDLY_佐拉姆海岸的纳迦|r
    .accept 13901 >>接任务: |cRXP_WARN_绝望深渊|r
    .target Marukai
step
    #loop
    .goto 1440/1,394.10001,3549.50000,0
    .waypoint 1440/1,682.60004,3480.60010,50,0
    .waypoint 1440/1,584.60004,3343.60010,50,0
    .waypoint 1440/1,394.10001,3549.50000,50,0
    .waypoint 1440/1,558.50000,3604.00000,50,0
    .waypoint 1440/1,661.20001,3772.90015,50,0
    .waypoint 1440/1,643.00000,3932.40015,50,0
    >>杀死 |cRXP_ENEMY_Wild Bucks|r。掠夺他们的 |cRXP_LOOT_Steak|r
    .complete 13920,1 --5/5 Venison Steak
    .mob Wild Buck
step
    #completewith next
    .goto 63,14.20,13.85,30 >>跳入黑暗深渊
    .subzoneskip 5517
step
    #completewith next
    >>从墙壁上拾取 |cRXP_PICK_Aku'Mai 的蓝宝石|r
    .complete 26890,1 --20/20 Sapphire of Aku'Mai
step
    #loop
    .goto 1414/1,902.00000,4265.50000,0
    .waypoint 1414/1,940.70001,4170.10010,20,0
    .waypoint 1414/1,902.00000,4265.50000,20,0
    .waypoint 1414/1,898.00000,4319.10010,20,0
    .waypoint 1414/1,821.90002,4252.50000,20,0
    .waypoint 1414/1,742.60004,4223.00000,20,0
    >>杀死 |cRXP_ENEMY_Blackfathom 潮汐女祭司|r
    .complete 13901,1 --6/6 Blackfathom Tide Priestesses slain
    .mob Blackfathom Tide Priestess
step
    #loop
    .goto 1414/1,902.00000,4265.50000,0
    .waypoint 1414/1,940.70001,4170.10010,20,0
    .waypoint 1414/1,902.00000,4265.50000,20,0
    .waypoint 1414/1,898.00000,4319.10010,20,0
    .waypoint 1414/1,821.90002,4252.50000,20,0
    .waypoint 1414/1,742.60004,4223.00000,20,0
    >>完成从墙壁上掠夺 |cRXP_PICK_Aku'Mai 的蓝宝石|r
    .complete 26890,1 --20/20 Sapphire of Aku'Mai
step
    #completewith next
    .hs >>赫尔斯到佐拉姆海岸
    .use 6948
    .subzoneskip 2897
step
    .goto 63,12.11,33.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_指挥官恐牙|r
    .turnin 13920 >>交任务: |cRXP_FRIENDLY_你走之前……|r
    .accept 13923 >>接任务: |cRXP_WARN_到地狱咆哮岗哨去|r
    .target Commander Grimfang
step
    .goto 63,12.66,35.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛鲁凯|r
    .turnin 13901 >>交任务: |cRXP_FRIENDLY_绝望深渊|r
    .target Marukai
step
    .goto 63,11.57,35.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达格鲁·怒锤|r
    .turnin 26890 >>交任务: |cRXP_FRIENDLY_阿库麦尔水晶|r
    .target Dagrun Ragehammer
step
    .goto 63,11.16,34.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_安德鲁克|r
    .gossipoption 111691 >>飞往地狱咆哮的哨站
    .target Andruk
step
    .goto 63,38.08,42.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨拉卡|r
    .fp >>获取地狱咆哮哨站飞行路线
    .target Thraka
step
    .goto 63,38.60,42.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板林卡莎|r
    .home >>将炉石设置为地狱咆哮的守望
    .target Innkeeper Linkasa
step
    .goto 63,38.01,42.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高戈斯上尉|r
    >>|cRXP_WARN_他在周围巡逻|r
    .turnin 13923 >>交任务: |cRXP_FRIENDLY_到地狱咆哮岗哨去|r
    .accept 13936 >>接任务: |cRXP_WARN_愚蠢的特维德|r
    .target Captain Goggath
step
    .goto 63,37.77,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡拉恩·阿玛卡|r
    .accept 216 >>接任务: |cRXP_LOOT_蓟皮熊怪的麻烦|r
    .target Karang Amakkar
step
    .goto 63,37.98,43.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特维德|r
    .turnin 13936 >>交任务: |cRXP_FRIENDLY_愚蠢的特维德|r
    .accept 13942 >>接任务: |cRXP_WARN_给我们把炸弹弄好|r
    .target Tweedle
step
    .goto 63,38.00,42.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高戈斯上尉|r
    >>|cRXP_WARN_他在周围巡逻|r
    .accept 13943 >>接任务: |cRXP_WARN_喘息的空间|r
    .target Captain Goggath
step
    .goto 63,38.89,42.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米苏瓦|r
    .accept 6462 >>接任务: |cRXP_LOOT_巨魔符咒|r
    .target Mitsuwa
step
    #loop
    .goto 1440/1,-360.50000,2929.60010,0
    .waypoint 1440/1,-298.20001,2929.19995,35,0
    .waypoint 1440/1,-360.50000,2929.60010,35,0
    .waypoint 1440/1,-433.80002,2897.00000,35,0
    .waypoint 1440/1,-571.00000,2871.19995,35,0
    .waypoint 1440/1,-592.50000,2821.19995,35,0
    >>杀死 |cRXP_ENEMY_Astranaar 军官|r 和 |cRXP_ENEMY_Astranaar 散兵|r
    >>从地面拾取 |cRXP_PICK_Moon-Kissed Clay|r
    .complete 13943,2 --3/3 阿斯特兰纳军官s slain
    .mob +阿斯特兰纳军官
    .complete 13943,1 --10/10 阿斯特兰纳散兵s slain
    .mob +阿斯特兰纳散兵
    .complete 13942,1 --10/10 Moon-Kissed Clay
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Thistlefur Furbolgs|r
    .complete 216,1 --15/15 Thistlefur Village Furbolgs killed
    .mob Thistlefur Pathfinder
    .mob Thistlefur Shaman
    .mob Thistlefur Avenger
step
    #completewith next
    .goto 63,38.37,30.59,40 >>进入蓟皮堡
step
    #loop
    .goto 1440/1,-627.70001,3394.69995,0
    .waypoint 1440/1,-605.60004,3401.69995,15,0
    .waypoint 1440/1,-627.70001,3394.69995,15,0
    .waypoint 1440/1,-631.79999,3349.30005,15,0
    .waypoint 1440/1,-574.70001,3385.60010,15,0
    .waypoint 1440/1,-676.70001,3314.19995,15,0
    .waypoint 1440/1,-683.60004,3359.00000,15,0
	>>掠夺地面上的 |cRXP_PICK_Troll Chests|r 以获得 |cRXP_LOOT_Troll Charms|r
	.complete 6462,1 --Collect Troll Charm (x8)
step
    .goto 63,41.49,34.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ruul|r in the back of the cave. 这将开始护送
    .accept 6482 >>接任务: |cRXP_LOOT_鲁尔的自由|r
    .target Ruul Snowhoof
step
    .goto 63,40.68,33.21,20,0
    .goto 63,40.29,32.25,20,0
    .goto 63,39.41,31.00,20,0
    .goto 63,38.28,30.68,20,0
    .goto 63,37.39,32.74,30,0
    .goto 63,37.30,34.49,30,0
    .goto 63,38.73,36.86,50,0
    .goto 63,38.35,38.55
    >>护送 |cRXP_FRIENDLY_Ruul|r 离开蓟皮村
    >>|cFFFCDC00小心！ 3|r |cRXP_ENEMY_Thistlefurs|r |cFFFCDC00会在你走到洞穴一半时出现，而另一个 3 会在 Thistlefur Village 大门外出现|r
    .complete 6482,1 --Escort Ruul from the Thistlefurs
    .target Ruul Snowhoof
step
    .goto 63,39.45,36.62
    >>完成杀死|cRXP_ENEMY_Thistlefur Furbolgs|r
    .complete 216,1 --15/15 Thistlefur Village Furbolgs killed
    .mob Thistlefur Pathfinder
    .mob Thistlefur Shaman
    .mob Thistlefur Avenger
step
    .goto 63,38.00,42.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高戈斯上尉|r
    >>|cRXP_WARN_他在周围巡逻|r
    .turnin 13943 >>交任务: |cRXP_FRIENDLY_喘息的空间|r
    .target Captain Goggath
step
    .goto 63,37.77,43.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卡拉恩·阿玛卡|r
    .turnin 216 >>交任务: |cRXP_FRIENDLY_蓟皮熊怪的麻烦|r
    .target Karang Amakkar
step
    .goto 63,37.98,43.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特维德|r
    .turnin 13942 >>交任务: |cRXP_FRIENDLY_给我们把炸弹弄好|r
    .accept 13944 >>接任务: |cRXP_WARN_小个子，大脾气|r
    .target Tweedle
step
    .goto 63,38.89,42.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米苏瓦|r
    .turnin 6462 >>交任务: |cRXP_FRIENDLY_巨魔符咒|r
    .target Mitsuwa
step
    .goto 63,38.47,44.22
    .use 46701 >>|cRXP_WARN_使用|r |T133711:0|t[Tweedle 的简易爆炸装置] |cRXP_WARN_at 破损的马车|r
    .complete 13944,1 --1/1 Broken Wagon exploded
step
    .goto 63,38.00,42.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高戈斯上尉|r
    >>|cRXP_WARN_他在周围巡逻|r
    .turnin 13944 >>交任务: |cRXP_FRIENDLY_小个子，大脾气|r
    .accept 13947 >>接任务: |cRXP_WARN_轰炸阿斯特兰纳！|r
    .target Captain Goggath
step
    .goto 63,38.08,42.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨拉卡|r
    .gossipoption 111697 >>乘坐风之骑士轰炸阿斯特兰纳
    .target Thraka
    .isOnQuest 13947
step
    .goto 63,36.24,51.03
    >>对 |cRXP_ENEMY_Astranaar 哨兵|r 和 |cRXP_ENEMY_Astranaar 投掷者|r 使用 |T133711:0|t[投掷爆炸物]
    .complete 13947,1 --20/20 阿斯特兰纳哨兵s slain
    .mob +阿斯特兰纳哨兵
    .complete 13947,2 --10/10 阿斯特兰纳投掷者s destroyed
    .mob +阿斯特兰纳投掷者
step
    #completewith next
    +|cRXP_WARN_使用|r |T136011:0|t[返回基地！] |cRXP_WARN_飞回地狱咆哮的哨站|r
step
    .goto 63,37.99,42.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高戈斯上尉|r
    >>|cRXP_WARN_他在周围巡逻|r
    .turnin 13947 >>交任务: |cRXP_FRIENDLY_轰炸阿斯特兰纳！|r
    .accept 13958 >>接任务: |cRXP_WARN_情况危急！|r
    .target Captain Goggath
step
    .goto 63,37.98,43.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特维德|r
    .accept 13974 >>接任务: |cRXP_WARN_特维德的小包裹|r
    .target Tweedle
step
    #questguide
    .goto 63,38.79,43.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布萝克|r
    .accept 13879 >>接任务: |cRXP_WARN_雷鸣峰|r
    .target Broyk
step
    #questguide
    #completewith next
    .goto 63,52.08,56.50,50 >>前往雷霆峰
step
    #questguide
    .goto 63,52.08,56.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯提克瓦|r
    .turnin 13879 >>交任务: |cRXP_FRIENDLY_雷鸣峰|r
    .target Stikwad
step
    #questguide
    .goto 63,52.08,56.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿克塔努斯|r
    .accept 13884 >>接任务: |cRXP_WARN_把火灭了|r
    .target Arctanus
step
    #questguide
    .goto 63,52.31,56.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岩核|r
    .accept 13880 >>接任务: |cRXP_WARN_热岩浆|r
    .target Core
step
    #questguide
    #completewith LavaRagers
    .goto 63,52.08,56.71,0
    +|cRXP_WARN_如果你丢失了|r |cRXP_FRIENDLY_Freezing Surger|r|cRXP_WARN_，请再次与|r |cRXP_FRIENDLY_Arctanus|r |cRXP_WARN_交谈以获取另一个|r
    .skipgossipid 111688
    .target Arctanus
step
    #questguide
    #completewith next
    >>杀死 |cRXP_ENEMY_Lava Ragers|r
    .complete 13884,1 --10/10 Lava Rager slain
    .mob Lava Rager
step
    #questguide
    #loop
    .goto 1440/1,-1165.50000,2678.50000,0
    .waypoint 1440/1,-1189.80005,2600.30005,30,0
    .waypoint 1440/1,-1165.50000,2678.50000,30,0
    .waypoint 1440/1,-1048.50000,2761.10010,30,0
    .waypoint 1440/1,-1122.09998,2828.30005,30,0
    .waypoint 1440/1,-1247.30005,2860.00000,30,0
    .waypoint 1440/1,-1300.80005,2733.19995,30,0
    .waypoint 1440/1,-1323.30005,2631.60010,30,0
    .use 46352 >>|cRXP_WARN_使用|r |T237588:0|t[大地的礼物] |cRXP_WARN_on|r |cRXP_PICK_熔岩裂缝|r
    .complete 13880,1 --8/8 Lava fissures filled
step
    #questguide
    #label LavaRagers
    #loop
    .goto 1440/1,-1165.50000,2678.50000,0
    .waypoint 1440/1,-1189.80005,2600.30005,50,0
    .waypoint 1440/1,-1165.50000,2678.50000,50,0
    .waypoint 1440/1,-1048.50000,2761.10010,50,0
    .waypoint 1440/1,-1122.09998,2828.30005,50,0
    .waypoint 1440/1,-1247.30005,2860.00000,50,0
    .waypoint 1440/1,-1300.80005,2733.19995,50,0
    .waypoint 1440/1,-1323.30005,2631.60010,50,0
    >>完成击杀|cRXP_ENEMY_Lava Ragers|r
    .complete 13884,1 --10/10 Lava Rager slain
    .mob Lava Rager
step
    #questguide
    .goto 63,52.08,56.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿克塔努斯|r
    .turnin 13884 >>交任务: |cRXP_FRIENDLY_把火灭了|r
    .target Arctanus
step
    #questguide
    .goto 63,52.32,56.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_岩核|r
    .turnin 13880 >>交任务: |cRXP_FRIENDLY_热岩浆|r
    .target Core
step
    #questguide
    .goto 63,52.34,56.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_气旋|r
    .accept 13888 >>接任务: |cRXP_WARN_漩涡|r
    .target The Vortex
step
    #questguide
    .goto 63,52.34,56.79
    .gossipoption 111689 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_气旋|r, |cRXP_ENEMY_元素勋爵玛格玛萨|r
    .target The Vortex
step
    #questguide
    .goto 63,49.19,39.86
    >>杀死 |cRXP_ENEMY_Lord Magmathar|r
    >>|cRXP_WARN_使用|r |T252174:0|t[天空闪电] |cRXP_WARN_and|r |T236154:0|t[漩涡复仇] |cRXP_WARN_on 冷却|r
    >>|cRXP_WARN_使用|r |T135833:0|t[熄灭火焰] |cRXP_WARN_当受到|r |T135817:0|t[贵族献祭]
    .complete 13888,1 --1/1 Lord Magmathar slain
    .mob Lord Magmathar
step
    #questguide
    .goto 63,52.09,56.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯提克瓦|r
    .turnin 13888 >>交任务: |cRXP_FRIENDLY_漩涡|r
    .target Stikwad
step
    #completewith SilverwindPickups
    .goto 63,49.96,67.25,100 >>前往银风避难所
step
    .goto 63,49.79,65.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞娜尼·雷心|r
    .turnin 2 >>交任务: |cRXP_FRIENDLY_沙普塔隆的爪子|r
    .accept 13967 >>接任务: |cRXP_WARN_消减牧群的……数量？|r
    .target Senani Thunderheart
    .isOnQuest 2
step
    #optional
    .goto 63,49.79,65.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞娜尼·雷心|r
    .accept 13967 >>接任务: |cRXP_WARN_消减牧群的……数量？|r
    .target Senani Thunderheart
step
    .goto 63,49.29,65.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_驯风者舒舍克|r
    .fp >>获取银风避难所飞行路线
    .target Wind Tamer Shoshok
step
    .goto 63,49.96,67.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗洛兹|r
    .turnin 13974 >>交任务: |cRXP_FRIENDLY_特维德的小包裹|r
    .target Flooz
step
    .goto 63,50.14,67.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔坎上尉|r
    .accept 25 >>接任务: |cRXP_WARN_石爪山的困境|r
    .target Captain Tarkan
step
    .goto 63,49.98,67.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗洛兹|r
    .accept 13977 >>接任务: |cRXP_WARN_大规模生产|r
    .target Flooz
step
    #label SilverwindPickups
    .goto 1440/1,-1225.90002,2092.80005,0
    .goto 1440/1,-1152.09998,2093.80005,0
    .goto 1440/1,-1225.90002,2092.80005,5,0
    .goto 1440/1,-1152.09998,2093.80005,5,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_克罗姆拉|r
    .accept 26416 >>接任务: |cRXP_WARN_那么，来丛林吧|r
    .target Cromula
step << skip
    .goto 63,49.88,65.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_血卫士阿尔多·石雨|r
    .accept 25945 >>接任务: |cRXP_WARN_我们来是做一件，也许是两件事的……|r
    .target Blood Guard Aldo Rockrain
    --Stonetalon Breadcrumb
step
    #loop
    .goto 1440/1,-1432.70007,2296.40015,0
    .waypoint 1440/1,-1405.90002,2233.69995,50,0
    .waypoint 1440/1,-1432.70007,2296.40015,50,0
    .waypoint 1440/1,-1569.30005,2259.90015,50,0
    .waypoint 1440/1,-1581.09998,2184.90015,50,0
    .waypoint 1440/1,-1530.30005,2218.90015,50,0
    >>杀死 |cRXP_ENEMY_Furbolgs|r。掠夺他们的 |cRXP_LOOT_Ears|r
    .complete 13967,1 --15/15 Furbolg Ear
    .mob Foulweald Totemic
    .mob Foulweald Warrior
    .mob Foulweald Pathfinder
step
    .goto 63,49.74,65.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞娜尼·雷心|r
    .turnin 13967 >>交任务: |cRXP_FRIENDLY_消减牧群的……数量？|r
    .accept 6621 >>接任务: |cRXP_WARN_污林熊怪之王|r
    .target Senani Thunderheart
step
    #optional
    .goto 63,49.74,65.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞娜尼·雷心|r
    .turnin 2 >>交任务: |cRXP_FRIENDLY_沙普塔隆的爪子|r
    .turnin 13967 >>交任务: |cRXP_FRIENDLY_消减牧群的……数量？|r
    .accept 6621 >>接任务: |cRXP_WARN_污林熊怪之王|r
    .target Senani Thunderheart
    .isOnQuest 2
step
    .goto 63,49.74,65.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞娜尼·雷心|r
    .turnin 13967 >>交任务: |cRXP_FRIENDLY_消减牧群的……数量？|r
    .accept 6621 >>接任务: |cRXP_WARN_污林熊怪之王|r
    .target Senani Thunderheart
step
    .goto 63,56.37,63.54
    .use 16972 >>|cRXP_WARN_使用|r |T237588:0|t[大地的礼物] |cRXP_WARN_在图腾丘上保护它免受|r |cRXP_ENEMY_熊怪的侵袭|r
    >>一旦 |cRXP_ENEMY_Chief Murgut|r 出现，就将其击杀。从 |cRXP_PICK_Basket|r 中拾取 |cRXP_LOOT_Murgut's Totem|r
    .complete 6621,1 --1/1 Murgut's Totem
    .mob Chief Murgut
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Water 元素|r
    .complete 25,1 --12/12 Befouled Water Elemental slain
    .mob Befouled Water Elemental
step
    .goto 1440/1,-1079.70007,1994.20007
    >>杀死 |cRXP_ENEMY_Tideress|r。从她身上搜刮 |T136222:0|t[|cRXP_LOOT_Befouled Water Globe|r]。使用它来开始任务
    .complete 25,2 --1/1 Tideress slain
    .collect 16408,1,1918 --Collect Befouled Water Globe (x1)
    .accept 1918 >>接任务: |cRXP_LOOT_被污染的水元素|r
    .mob Tideress
step
    #loop
    .goto 1440/1,-978.50000,2019.70007,0
    .waypoint 1440/1,-973.10004,1947.70007,50,0
    .waypoint 1440/1,-978.50000,2019.70007,50,0
    .waypoint 1440/1,-1233.80005,2025.00000,50,0
    .waypoint 1440/1,-1177.59998,1928.59998,50,0
    >>完成杀死 |cRXP_ENEMY_Water 元素|r
    .complete 25,1 --12/12 Befouled Water Elemental slain
    .mob Befouled Water Elemental
step
    .goto 63,46.16,63.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头金科斯|r
    .turnin 13977 >>交任务: |cRXP_FRIENDLY_大规模生产|r
    .accept 13980 >>接任务: |cRXP_WARN_他们在那儿！|r
    .accept 13983 >>接任务: |cRXP_WARN_自掘坟墓|r
    .target Foreman Jinx
step
    #completewith KillAssassins
    >>杀死 |cRXP_ENEMY_Ursangous|r。从他身上搜刮 |T132941:0|t[|cRXP_LOOT_Ursangous's Paw|r] 并使用它开始任务
    >>|cRXP_WARN_他稍微巡视了一下|r
    .collect 16303,1,23 --Collect Ursangous's Paw (x1)
    .accept 23 >>接任务: |cRXP_LOOT_乌萨苟斯的爪子|r
    .unitscan Ursangous
    .use 16303
step
    #completewith next
    >>杀死|cRXP_ENEMY_Ashenvale 刺客|r
    .use 46776 >>|cRXP_WARN_他们隐身了！使用|r |T133023:0|t[Jinx's Goggles] |cRXP_WARN_来检测他们|r
    .complete 13980,1 --12/12 Ashenvale Assassin slain
    .unitscan Ashenvale Assassin
step
    #loop
    .goto 1440/1,-715.10004,1985.59998,0
    .waypoint 1440/1,-846.40002,1993.70007,40,0
    .waypoint 1440/1,-779.10004,1977.80005,40,0
    .waypoint 1440/1,-715.10004,1985.59998,40,0
    .waypoint 1440/1,-545.20001,2052.00000,40,0
    .waypoint 1440/1,-448.70001,2060.90015,40,0
    .waypoint 1440/1,-589.79999,2194.10010,40,0
    .waypoint 1440/1,-628.10004,2297.69995,40,0
    >>从地面拾取 |cRXP_PICK_青铜齿轮|r、|cRXP_PICK_锁定螺栓|r 和 |cRXP_PICK_铜镀层|r
    .complete 13983,1 --3/3 Bronze Cog
    .complete 13983,3 --5/5 Locking Bolt
    .complete 13983,2 --3/3 Copper Plating
step
    #label KillAssassins
    #loop
    .goto 1440/1,-715.10004,1985.59998,0
    .waypoint 1440/1,-846.40002,1993.70007,40,0
    .waypoint 1440/1,-779.10004,1977.80005,40,0
    .waypoint 1440/1,-715.10004,1985.59998,40,0
    .waypoint 1440/1,-545.20001,2052.00000,40,0
    .waypoint 1440/1,-448.70001,2060.90015,40,0
    .waypoint 1440/1,-685.79999,2128.40015,40,0
    .waypoint 1440/1,-726.40002,2037.50000,40,0
    >>完成击杀|cRXP_ENEMY_Ashenvale Assassins|r
    .use 46776 >>|cRXP_WARN_他们隐身了！使用|r |T133023:0|t[Jinx's Goggles] |cRXP_WARN_来检测他们|r
    .complete 13980,1 --12/12 Ashenvale Assassin slain
    .unitscan Ashenvale Assassin
step
    #loop
    .goto 1440/1,-597.40002,2149.40015,0
    .waypoint 1440/1,-585.00000,2234.40015,30,0
    .waypoint 1440/1,-597.40002,2149.40015,30,0
    .waypoint 1440/1,-653.40002,2121.30005,30,0
    .waypoint 1440/1,-693.90002,2149.00000,30,0
    >>杀死 |cRXP_ENEMY_Ursangous|r。从他身上搜刮 |T132941:0|t[|cRXP_LOOT_Ursangous's Paw|r] 并使用它开始任务
    >>|cRXP_WARN_他稍微巡视了一下|r
    .collect 16303,1,23 --Collect Ursangous's Paw (x1)
    .accept 23 >>接任务: |cRXP_LOOT_乌萨苟斯的爪子|r
    .unitscan Ursangous
    .use 16303
step
    .goto 63,46.16,63.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头金科斯|r
    .turnin 13980 >>交任务: |cRXP_FRIENDLY_他们在那儿！|r
    .turnin 13983 >>交任务: |cRXP_FRIENDLY_自掘坟墓|r
    .target Foreman Jinx
step
    .goto 63,49.75,65.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞娜尼·雷心|r
    .turnin 6621 >>交任务: |cRXP_FRIENDLY_污林熊怪之王|r
    .target Senani Thunderheart
step
    .goto 63,50.13,67.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔坎上尉|r
    .turnin 25 >>交任务: |cRXP_FRIENDLY_石爪山的困境|r
    .turnin 23 >>交任务: |cRXP_FRIENDLY_乌萨苟斯的爪子|r
    .target Captain Tarkan
step
    #completewith next
    .goto 63,60.65,52.69,100 >>前往 Raynewood Retreat
step
    .goto 63,60.65,52.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨格|r
    .turnin 13958 >>交任务: |cRXP_FRIENDLY_情况危急！|r
    .accept 13962 >>接任务: |cRXP_WARN_僵局|r
    .target Thagg
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Shadumbra|r。从她身上夺取 |T132225:0|t[|cRXP_LOOT_Shadumbra 的头颅|r] 并使用它开始任务
    >>|cRXP_ENEMY_Shadumbra|r 稍微巡逻一下
    .collect 16304,1,24 --Collect Shadumbra's Head
	.accept 24 >>接任务: |cRXP_LOOT_萨杜布拉的头颅|r
	.unitscan Shadumbra
    .use 16304
step
    .goto 63,62.04,51.41
    >>杀死位于建筑顶层的 |cRXP_ENEMY_Keeper Ordanus|r
    .complete 13962,1 --1/1 Keeper Ordanus slain
    .mob Keeper Ordanus
step
    #loop
    .goto 1440/1,-1825.50000,2708.69995,0
    .waypoint 1440/1,-1867.09998,2752.19995,30,0
    .waypoint 1440/1,-1825.50000,2708.69995,30,0
    .waypoint 1440/1,-1857.90002,2660.80005,30,0
    >>杀死 |cRXP_ENEMY_Shadumbra|r。从她身上夺取 |T132225:0|t[|cRXP_LOOT_Shadumbra 的头颅|r] 并使用它开始任务
    >>|cRXP_ENEMY_Shadumbra|r 在建筑物周围巡逻
    .collect 16304,1,24 --Collect Shadumbra's Head
	.accept 24 >>接任务: |cRXP_LOOT_萨杜布拉的头颅|r
	.unitscan Shadumbra
    .use 16304
step
    .goto 63,60.67,52.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨格|r
    .turnin 13962 >>交任务: |cRXP_FRIENDLY_僵局|r
    .target Thagg
step
    #completewith FlytoSP
    .hs >>炉石到地狱咆哮的守望
    .use 6948
    .subzoneskip 4691
    .cooldown item,6948,>0,1
step
    #completewith FlytoSP
    .subzone 4691 >>前往地狱咆哮的哨站
    .cooldown item,6948,<0
step
    .goto 63,38.56,42.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高戈斯上尉|r
    >>|cRXP_WARN_他在周围巡逻|r
    .turnin 24 >>交任务: |cRXP_FRIENDLY_萨杜布拉的头颅|r
    .target Captain Goggath
    .isOnQuest 24
step
    #label FlytoSP
    #completewith next
    .goto 63,38.08,42.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨拉卡|r
    .fly Splintertree Post >>飞往斯普林特树岗哨
    .target Thraka
step
    .goto 63,74.12,60.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雅玛·雪蹄|r
    .turnin 6482 >>交任务: |cRXP_FRIENDLY_鲁尔的自由|r
    .target Yama Snowhoof
step
    .goto 63,74.19,60.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马斯托克·维尔西斯|r
    .accept 1918 >>接任务: |cRXP_LOOT_被污染的水元素|r
    .turnin 1918 >>交任务: |cRXP_FRIENDLY_被污染的水元素|r
    .target Mastok Wrilehiss
    .itemcount 16408,1
step
    #optional
    #label AshenvaleEnd
step
    #optional
    #sticky
    .abandon 2 >>放弃 Sharptalon's Claw，因为它不会再被交出
step
    .goto 63,73.18,61.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乌尔格拉|r
    .fly Orgrimmar >>飞往奥格瑞玛
    .target Vhulgra
    .zoneskip Orgrimmar
step << Rogue/Warlock
    #completewith next
    .goto 1454,45.81,66.88,40 >>前往暗影裂隙
step << Shaman/Druid/Paladin/Warrior/Hunter/Priest
    #completewith next
    .goto 1454/1,-4291.89990,1876.70007,50 >>前往智慧谷
step << Rogue
    .goto 1454,44.65,61.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈达尔|r
    .trainer >>训练你的职业法术
    .target Gordul
step << Rogue
    .goto 1454,29.60,50.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷库尔|r
    .vendor >>|cRXP_BUY_囤货|r |T132273:0|t[毒药]
    .target Rekkul
step << Shaman
    .goto 1454/1,-4282.60010,1884.09998
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎伊·云歌|r
    .trainer >>训练你的职业法术
    .target Sahi Cloudsinger
step << Druid
    .goto 1454/1,-4285.10010,1889.09998
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎乌拉·白叶|r
    .trainer >>训练你的职业法术
    .target Shalla Whiteleaf
step << Mage
    .goto 1454/1,-4125.10010,1690.59998
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_尤塞尔奈|r
    .trainer >>训练你的职业法术
    .target Uthel'nay
step << Mage
    .goto 1454/1,-4128.89990,1692.09998
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_观星者吉拉吉|r
    .train 3567 >>火车 |T135759:0|t[传送：奥格瑞玛]
    .train 3563 >>火车 |T135766:0|t[传送：幽暗城]
    .train 3566 >>火车 |T135765:0|t[传送：雷霆崖]
    .train 32272 >>火车 |T135761:0|t[传送：银月城]
    .target Zirazi the Star-Gazer
    .xp <24,1
step << Mage
    .goto 1454/1,-4382.50000,1673.30005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_霍苏斯|r
    .collect 17031,20 >>|cRXP_BUY_从他那里购买一堆|r|T134419:0|t[传送符文]|cRXP_BUY_|r
    .target Horthus
step << Priest
    .goto 1454/1,-4297.60010,1863.30005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_先知利瓦萨|r
    .trainer >>训练你的职业法术
    .target Seer Liwatha
step << Warlock
    .goto 1454,54.49,39.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米尔科特|r
    .trainer >>训练你的职业法术
    .target Mirket
step << Paladin
    .goto 1454/1,-4292.50000,1863.70007
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Atohmo|r
    .trainer >>训练你的职业法术
    .target Sunwalker Atohmo
step << Hunter
    .goto 1454/1,-4281.00000,1872.50000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_诺希·平原行者|r
    .trainer >>训练你的职业法术
    .target Nohi Plainswalker
step << Warrior
    .goto 1454/1,-4284.00000,1867.80005
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Nahu|r
    .trainer >>训练你的职业法术
    .target Nahu Ragehoof


    --Next section is flying back only for final Ashenvale quest, not worth xp wise. Nice bow reward for hunters though..

step
    #questguide
    .goto 85,49.21,72.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊崔格|r
    .turnin 13841 >>交任务: |cRXP_FRIENDLY_难辞其咎|r
    .accept 13842 >>接任务: |cRXP_WARN_将功赎罪|r
    .target Eitrigg
    .isQuestTurnedIn 13798
step
    #questguide
    .goto 85,53.62,78.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板格雷什卡|r
    .home >>将你的炉石设为奥格瑞玛
    .target Innkeeper Gryshka
    .isQuestTurnedIn 13841
step
    #questguide
    .goto 85,49.64,59.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_多拉斯|r
    .fly Splintertree Post >>飞往斯普林特树岗哨
    .target Doras
    .zoneskip Ashenvale
    .isQuestTurnedIn 13841
step
    #questguide
    .goto 63,72.20,57.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜莱克|r
    .complete 13842,1 --1/1 Durak Persuaded
    .skipgossip
    .target Durak
    .isQuestTurnedIn 13841
step
    #questguide
    .goto 63,72.22,56.76
    >>跟随 |cRXP_ENEMY_Durak|r 直到他变得具有敌意，然后杀死他
    .complete 13842,2 --1/1 Durak slain
    .mob Durak
    .isQuestTurnedIn 13841
step
    #questguide
    .hs >>炉石到奥格瑞玛
    .use 6948
    .cooldown item,6948,>2
    .zoneskip Orgrimmar
    .isQuestTurnedIn 13841
step
    #questguide
    .goto 63,73.18,61.58
    .fly Orgrimmar >>飞往奥格瑞玛
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_乌尔格拉|r
    .target Vhulgra
    .cooldown item,6948,<0
    .zoneskip Orgrimmar
    .isQuestTurnedIn 13841
step
    #questguide
    .goto 85,49.20,72.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊崔格|r
    .turnin 13842 >>交任务: |cRXP_FRIENDLY_将功赎罪|r
    .target Eitrigg
    .isQuestTurnedIn 13841
step
    .goto 85,51.31,56.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_博特|r
    .turnin 26416 >>交任务: |cRXP_FRIENDLY_那么，来丛林吧|r
    .accept 26417 >>接任务: |cRXP_WARN_北荆棘谷：覆灭的帝国|r
    .target Bort
    .isOnQuest 26416
    --STV breadcrumb quest
step
    #optional
    .goto 85,51.31,56.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_博特|r
    .accept 26417 >>接任务: |cRXP_WARN_北荆棘谷：覆灭的帝国|r
    .target Bort
    .isQuestTurnedIn 26416
    ]])