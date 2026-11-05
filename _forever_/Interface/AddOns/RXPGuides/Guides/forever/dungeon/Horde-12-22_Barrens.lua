local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#forever
<< Horde
#name 12-16 The Barrens
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
#subgroupdisplayname 1-22
--#groupid RXP-SRGCE-H1
#next 16-17 Ragefire Chasm
#displayname 14-16 贫瘠之地 << !Shaman !Hunter !Tauren
#displayname 15-16 贫瘠之地 << Paladin
#displayname 12-16 贫瘠之地
step << Tauren Shaman
    .goto 1411/1,-4648.55,271.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔克林|r 交谈
    .accept 840 >>接任务: 部落的新兵
    .target 塔克林·寻路者
step << Tauren Shaman
    #completewith next
    .goto 1411/1,-4834.14,418.07,30,0
    .goto 1411/1,-4754.3,796.66,20 >> 进入尘风洞穴
step << Tauren Shaman
    #loop
    .goto 1411/1,-4706.71,902.41,0
    .goto 1411/1,-4774.39,780.80,20,0
    .goto 1411/1,-4749.01,822.39,12,0
    .goto 1411/1,-4767.52,825.92,12,0
    .goto 1411/1,-4772.28,848.12,12,0
    .goto 1411/1,-4756.41,863.630,12,0
    .goto 1411/1,-4715.70,861.87,12,0
    .goto 1411/1,-4706.71,902.41,12,0
    >>击杀 |cRXP_ENEMY_火刃祭司|r，拾取 |cRXP_LOOT_试剂袋|r
    .complete 1525,2 --Reagent Pouch (1)
    .mob 火刃祭司
step << Tauren Shaman
    .goto 1413/1,-3687.11,303.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡加尔|r 交谈
    .turnin 840 >>交任务: 部落的新兵
    .accept 842 >>接任务: 十字路口征兵
    .target 卡加尔·战痕
step << Tauren Warrior
    #completewith next
    .goto 1413/1,-2902.79,-276.55,30,0
    .goto 1413/1,-3004.12,-298.17,30,0
    .goto 1413/1,-3110.52,-320.46,30 >>前往山顶
step << Tauren Warrior
    .goto 1413/1,-3176.39,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索恩格瑞姆|r 交谈
    .turnin 1502 >>交任务: 索恩格瑞姆·火眼
    .accept 1503 >>接任务: 锻造好的钢锭
    .target 索恩格瑞姆·火眼
step << Tauren Warrior
    .goto 1413/1,-2955.48,-188.04
    >>打开 |cRXP_PICK_被偷走的铁箱|r，拾取 |cRXP_LOOT_锻造好的钢锭|r
    .complete 1503,1 --Forged Steel Bars (1)
step << Tauren Warrior
    #completewith next
    .goto 1413/1,-2902.79,-276.55,30,0
    .goto 1413/1,-3004.12,-298.17,30,0
    .goto 1413/1,-3110.52,-320.46,30 >>前往山顶
step << Tauren Warrior
    .goto 1413/1,-3176.39,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索恩格瑞姆|r 交谈
    .turnin 1503 >>交任务: 锻造好的钢锭
    .target 索恩格瑞姆·火眼
step << !Tauren
    #softcore
    #completewith ThievesPickup
    .goto 1413/1,-2516.71,-590.71
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .xp >15,1
step << !Tauren
    #softcore
    #completewith ThievesPickup
    .subzone 380 >> 前往十字路口
    .xp <15,1
step << !Tauren
    #hardcore
    #completewith ThievesPickup
    .subzone 380 >> 前往十字路口
step << !Tauren
    #softcore
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加|r 交谈
    .accept 870 >>接任务: 遗忘之池
    .target 图加·符文图腾
step << Orc/Troll
    #hardcore
    .goto 1413/1,-2709.24,-403.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔夫|r 交谈
    .accept 6365 >>接任务: 送往奥格瑞玛的肉
    .target 扎尔夫
step << !Tauren
    .goto 1413/1,-2670.74,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉|r 交谈
    .turnin 842 >>交任务: 十字路口征兵 << !Druid
    .accept 844 >>接任务: 平原陆行鸟的威胁
    .target 瑟格拉·黑棘
    .isOnQuest 842
step << !Tauren
    .goto 1413/1,-2670.74,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉|r 交谈
    .accept 844 >>接任务: 平原陆行鸟的威胁
    .target 瑟格拉·黑棘
step << !Tauren
    #hardcore
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加|r 交谈
    .accept 870 >>接任务: 遗忘之池
    .target 图加·符文图腾
step << !Tauren
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 交谈
    .turnin 98024 >>交任务: 十字路口之旅 << Skyborne
    .accept 871 >>接任务: 野猪人的袭击
    .accept 5041 >>接任务: 十字路口的补给品
    .target 索克
    .maxlevel 15
step << Skyborne
    #optional
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 交谈
    .turnin 98024 >>交任务：十字路口之旅
    .target 索克
    .maxlevel 15
step << Orc/Troll
    #hardcore
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 交谈
    >>|cRXP_WARN_不要飞往奥格瑞玛！|r
    .turnin 6365 >>交任务: 送往奥格瑞玛的肉
    .accept 6384 >>接任务: 飞往奥格瑞玛
    .target 迪弗拉克
step << Undead/Skyborne
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 交谈
    .fp >> 开通十字路口的飞行路线
    .target 迪弗拉克
    .isQuestAvailable 1492
step << !Tauren
    .goto 1413/1,-2589.67,-424.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫布瑞姆|r 交谈
    .accept 1492 >>接任务: 码头管理员迪兹维格
    .accept 848 >>接任务: 菌类孢子
    .turnin 1358 >>交任务: 给赫布瑞姆的样本
    .target 药剂师赫布瑞姆
    .isOnQuest 1358
step << !Tauren
    .goto 1413/1,-2589.67,-424.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫布瑞姆|r 交谈
    .accept 1492 >>接任务: 码头管理员迪兹维格
    .accept 848 >>接任务: 菌类孢子
    .target 药剂师赫布瑞姆
step << Orc Hunter/Troll Hunter/Skyborne Hunter
    .goto 1413/1,-2556.23,-351.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r|cRXP_BUY_交谈，购买|r |T135499:0|t[多层弯弓]|cRXP_BUY_。|r
    .collect 2507,1,871,1 --Collect Laminated Recurve Bow (1)
    .money <0.1751
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .target 阿瑟罗克
step << Orc Hunter/Troll Hunter/Skyborne Hunter
    #optional
    #completewith DisruptTheAttacks
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
step << Tauren Hunter
    .goto 1413/1,-2556.23,-351.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r|cRXP_BUY_交谈，购买|r |T135613:0|t[猎人火枪]|cRXP_BUY_。|r
    .collect 2511,1,871,1 --Collect Hunter's Boomstick (1)
    .money <0.1324
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
    .target 阿瑟罗克
step << Tauren Hunter
    #optional
    #completewith DisruptTheAttacks
    +|cRXP_WARN_装备|r |T135613:0|t[猎人火枪]
    .use 2511
    .itemcount 2511,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
step << !Tauren
    #label ThievesPickup
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r 交谈
    .accept 869 >>接任务: 偷钱的迅猛龙
    .target 加兹罗格
step << !Tauren
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德|r 交谈
    .home >> 将炉石设在十字路口
    .target 旅店老板伯兰德·草风
    .bindlocation 380
    .isQuestAvailable 1492
step << Orc/Troll
    #softcore
    .goto 1413/1,-2709.24,-403.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔夫|r 交谈
    .accept 6365 >>接任务: 送往奥格瑞玛的肉
    .target 扎尔夫
step
    #optional
    #completewith DisruptTheAttacks
    >>击杀沿途的所有 |cRXP_ENEMY_迅猛龙|r，拾取 |cRXP_LOOT_迅猛龙的头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step
    #optional
    #completewith DisruptTheAttacks
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，拾取 |cRXP_LOOT_陆行鸟的喙|r
    .complete 844,1 --Plainstrider Beak (7)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
step << !Tauren !Undead !Skyborne
    #completewith DemonSeed
    #label DemonMountain
    .goto 1413/1,-2554.2,80.18,40,0
    .goto 1413/1,-2477.19,136.26,40,0
    .goto 1413/1,-2363.7,232.87,40,0
    .goto 1413/1,-2205.62,314.62,100 >> 前往山顶
    .isOnQuest 924
step << !Tauren !Undead !Skyborne
    #completewith next
    #requires DemonMountain
    .goto 1413/1,-2205.62,314.62,15 >> 进入鬼雾兽穴
    .isOnQuest 924
step << !Tauren !Undead !Skyborne
    #label DemonSeed
    .goto 1413/1,-2238.04,324.08
    >>右键点击 |cRXP_PICK_祭坛|r
    >>|cRXP_WARN_确保身上有|r |T134095:0|t[有瑕疵的能量石] |cRXP_WARN_（持续30分钟）|r
    .collect 4986,1,924 --Collect Flawed Power Stone
    .complete 924,1 --Destroy the Demon Seed (1)
    .isOnQuest 924
step << Orc Shaman/Troll Shaman/Tauren Shaman
    #sticky
    #label FireTar2
    .goto 1413/1,-2947.38,-92.1,50,0
    .goto 1413/1,-2869.35,-49.54,50,0
    .goto 1413/1,-2805.51,-111.02
    >>击杀 |cRXP_ENEMY_钢鬃寻水者|r 或 |cRXP_ENEMY_钢鬃织棘者|r，拾取 |cRXP_LOOT_火焰焦油|r
    .complete 1525,1 --Fire Tar (1)
    .mob 钢鬃寻水者
    .mob 钢鬃织棘者
step
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_钢鬃寻水者|r、|cRXP_ENEMY_钢鬃织棘者|r 和 |cRXP_ENEMY_钢鬃猎手|r
    .complete 871,1 --Razormane Water Seeker (8)
    .mob +钢鬃寻水者
    .complete 871,2 --Razormane Thornweaver (8)
    .mob +钢鬃织棘者
    .complete 871,3 --Razormane Hunter (3)
    .mob +钢鬃猎手
    .isOnQuest 871
step
    .goto 1413/1,-3021.35,-231.960
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，使用它接取任务
    >>|cRXP_WARN_如果这里没有酒桶，可以稍后来拿|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务: 老陈的空酒桶
    .isOnQuest 871
step
    #requires FireTar2 << Shaman
    #label DisruptTheAttacks
    #loop
	.goto 1413/1,-2811.59,-42.780,0
	.goto 1413/1,-2811.59,-42.780,50,0
	.goto 1413/1,-2875.43,-52.24,50,0
	.goto 1413/1,-2931.16,-89.40,50,0
	.goto 1413/1,-3001.08,-117.78,50,0
	.goto 1413/1,-3037.56,-164.390,50,0
	.goto 1413/1,-3034.52,-221.82,50,0
	.goto 1413/1,-2991.96,-239.39,50,0
	.goto 1413/1,-2899.75,-209.66,50,0
	.goto 1413/1,-2854.15,-151.56,50,0
	.goto 1413/1,-2799.43,-92.78,50,0
    >>击杀 |cRXP_ENEMY_钢鬃寻水者|r、|cRXP_ENEMY_钢鬃织棘者|r 和 |cRXP_ENEMY_钢鬃猎手|r
    .complete 871,1 --Razormane Water Seeker (8)
    .mob +钢鬃寻水者
    .complete 871,2 --Razormane Thornweaver (8)
    .mob +钢鬃织棘者
    .complete 871,3 --Razormane Hunter (3)
    .mob +钢鬃猎手
    .isOnQuest 871
step
    #completewith next
    >>击杀沿途的所有 |cRXP_ENEMY_迅猛龙|r，拾取 |cRXP_LOOT_迅猛龙的头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step
    #loop
    .goto 1413/1,-2819.70,-359.65,0
    .goto 1413/1,-2784.23,-163.04,80,0
    .goto 1413/1,-2771.06,-306.95,80,0
    .goto 1413/1,-2805.51,-386.00,80,0
    .goto 1413/1,-2738.63,-610.310,80,0
    .goto 1413/1,-2576.50,-610.98,80,0
    .goto 1413/1,-2494.42,-485.32,80,0
    .goto 1413/1,-2448.82,-398.84,80,0
    .goto 1413/1,-2537.99,-260.33,80,0
    .goto 1413/1,-2730.52,-273.17,80,0
    .goto 1413/1,-2819.70,-359.65,80,0
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，拾取 |cRXP_LOOT_陆行鸟的喙|r
    .complete 844,1 --Plainstrider Beak (7)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
step
    .goto 1413/1,-2670.74,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉|r 交谈
    .turnin 842 >>交任务: 十字路口征兵 << Tauren Shaman
    .turnin 844 >>交任务: 平原陆行鸟的威胁
    .accept 845 >>接任务: 斑马的威胁
    .target 瑟格拉·黑棘
    .isOnQuest 842 << Tauren Shaman
step << Tauren Shaman
    #optional
    .goto 1413/1,-2670.74,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉|r 交谈
    .turnin 844 >>交任务: 平原陆行鸟的威胁
    .accept 845 >>接任务: 斑马的威胁
    .target 瑟格拉·黑棘
step
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 交谈
    .turnin 871 >>交任务: 野猪人的袭击
    .accept 872 >>接任务: 野猪人的头目
    .target 索克
    .isQuestComplete 871
step
    #optional
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 交谈
    .accept 872 >>接任务: 野猪人的头目
    .target 索克
    .isQuestTurnedIn 871
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-2607.91,-475.180
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克|r 交谈
    >>|cRXP_WARN_他在塔顶|r
    .accept 867 >>接任务: 鹰身强盗
    .target 达索克·快刀
step << Orc/Troll
    #softcore
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 交谈
    >>|cRXP_WARN_不要飞往奥格瑞玛！|r
    .turnin 6365 >>交任务: 送往奥格瑞玛的肉
    .accept 6384 >>接任务: 飞往奥格瑞玛
    .target 迪弗拉克
step << Orc Hunter/Troll Hunter/Skyborne Hunter
    #optional
    .goto 1413/1,-2556.23,-351.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r|cRXP_BUY_交谈，购买|r |T135499:0|t[多层弯弓]|cRXP_BUY_。|r
    .collect 2507,1,871,1 --Collect Laminated Recurve Bow (1)
    .money <0.1751
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .target 阿瑟罗克
step << Tauren Hunter
    #optional
    .goto 1413/1,-2556.23,-351.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r|cRXP_BUY_交谈，购买|r |T135613:0|t[猎人火枪]|cRXP_BUY_。|r
    .collect 2511,1,871,1 --Collect Hunter's Boomstick (1)
    .money <0.1324
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
    .target 阿瑟罗克
step << Orc Warrior/Troll Warrior/Tauren Warrior/Skyborne Warrior
    #sticky
    #completewith KreenigSnarlsnout
    .goto 1413/1,-2697.08,-461.67,0
    .vendor >>|cRXP_WARN_查看|r |cRXP_FRIENDLY_里扎雷克斯|r |cRXP_WARN_是否在十字路口。他出售药水和|r |T133476:0|t[|cRXP_FRIENDLY_重型尖刺钉锤|r]|cRXP_WARN_，后者是限量商品|r
	.unitscan 里扎雷克斯
    .subzoneskip 380,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德|r 交谈
    .vendor >>补充食物和水 << !Rogue !Warrior
    .vendor >>补充食物 << Rogue/Warrior
    .target 旅店老板伯兰德·草风
    .isOnQuest 872,5041,845
step
    .goto 1413/1,-3021.35,-231.96,20,0
    .goto 1413/1,-3029.46,261.25
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，使用它接取任务
    >>|cRXP_WARN_如果酒桶不在，等待刷新|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务: 老陈的空酒桶
    .isOnQuest 872
step
    #optional
    #completewith KreenigSnarlsnout
    .goto 1413/1,-3127.75,-55.62,50,0
    .goto 1413/1,-3382.10,-54.27,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .isOnQuest 872
step
    #optional
    #completewith next
    >>拾取 |cRXP_PICK_十字路口补给品箱|r
    >>|cRXP_WARN_它有多个刷新位置|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .isOnQuest 872
step
    #label KreenigSnarlsnout
    .goto 1413/1,-3324.34,-217.09
    >>击杀 |cRXP_ENEMY_克里尼格·糟鼻|r，拾取 |cRXP_LOOT_克里尼格·糟鼻的獠牙|r
    .complete 872,3 --Kreenig Snarlsnout's Tusk (1)
    .mob 克里尼格·糟鼻
    .isOnQuest 872
step
    #optional
    #completewith next
    .goto 1413/1,-3127.75,-55.62,0
    .goto 1413/1,-3382.10,-54.27,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .isOnQuest 872
step
    #loop
    .goto 1413/1,-3292.92,-212.36,30,0
    .goto 1413/1,-3402.36,-48.19,30,0
    .goto 1413/1,-3292.92,-212.36,0
    .goto 1413/1,-3402.36,-48.19,0
    >>拾取 |cRXP_PICK_十字路口补给品箱|r
    >>|cRXP_WARN_它有多个刷新位置|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .isOnQuest 872
step
    #loop
	.goto 1413/1,-3345.62,-101.56,0
	.goto 1413/1,-3393.24,-102.24,50,0
	.goto 1413/1,-3419.59,-40.08,50,0
	.goto 1413/1,-3419.59,-0.89,50,0
	.goto 1413/1,-3361.83,-1.57,50,0
	.goto 1413/1,-3317.24,-7.65,50,0
	.goto 1413/1,-3237.19,-27.92,50,0
	.goto 1413/1,-3139.91,-46.16,50,0
	.goto 1413/1,-3126.74,-101.56,50,0
	.goto 1413/1,-3178.42,-107.64,50,0
	.goto 1413/1,-3205.78,-119.13,50,0
	.goto 1413/1,-3218.95,-81.97,50,0
	.goto 1413/1,-3278.74,-75.21,50,0
	.goto 1413/1,-3345.62,-101.56,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .isOnQuest 872
step << !Tauren !Undead !Skyborne
    #optional
    #completewith next
    >>击杀沿途的 |cRXP_ENEMY_斑马|r，拾取 |cRXP_LOOT_斑马蹄|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
    .isQuestComplete 924
step << !Tauren !Undead !Skyborne
    .goto 1413/1,-3694.2,256.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅克塞罗斯|r 交谈
    .turnin 924 >>交任务: 恶魔之种
    .target 雅克塞罗斯
    .isQuestComplete 924
step << Orc Shaman/Troll Shaman/Tauren Shaman
    #optional
    #completewith ShamanDurotar
    >>击杀沿途的所有 |cRXP_ENEMY_迅猛龙|r，拾取 |cRXP_LOOT_迅猛龙的头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step << Orc Shaman/Troll Shaman/Tauren Shaman
    #optional
    #completewith ShamanDurotar
    >>击杀沿途的 |cRXP_ENEMY_斑马|r，拾取 |cRXP_LOOT_斑马蹄|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
step << Orc Shaman/Troll Shaman/Tauren Shaman
    #completewith CallofFire3
    #label ShamanDurotar
    .goto 1411/1,-3905.13,-228.41
    .zone Durotar >> 前往杜隆塔尔
    .isOnQuest 1525
step << Orc Shaman/Troll Shaman/Tauren Shaman
    #requires ShamanDurotar
    #completewith next
    .goto 1411/1,-3905.13,-228.41,10,0
    .goto 1411/1,-3899.31,-241.45,8,0
    .goto 1411/1,-3899.31,-241.45,8,0
    .goto 1411/1,-3906.71,-270.71,8,0
    .goto 1411/1,-3910.94,-247.45,8,0
    .goto 1411/1,-3931.56,-240.75,8,0
    .goto 1411/1,-3964.35,-242.51,8,0
    .goto 1411/1,-3974.39,-228.76,8,0
    .goto 1411/1,-4020.92,-219.95,8,0
    .goto 1411/1,-4034.67,-232.64,8,0
    .goto 1411/1,-4033.08,-255.91,10 >> 沿着山路前往 |cRXP_FRIENDLY_泰尔夫|r 处
step << Orc Shaman/Troll Shaman/Tauren Shaman
    #label CallofFire3
    #requires ShamanDurotar
    .goto 1411/1,-3999.24,-268.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泰尔夫|r 交谈
    .turnin 1525 >>交任务: 火焰的召唤
    .accept 1526 >>接任务: 火焰的召唤
    .target 泰尔夫·祖拉姆
step << Orc Shaman/Troll Shaman/Tauren Shaman
    #completewith next
    .goto 1411/1,-3981.27,-256.61
    .cast 8898 >>|cRXP_WARN_使用|r |T134732:0|t[火焰灵契]
    .use 6636
step << Orc Shaman/Troll Shaman/Tauren Shaman
    .goto 1411/1,-4022.51,-243.92
    >>击杀 |cRXP_ENEMY_火焰之魂|r，拾取 |cRXP_LOOT_余烬|r
    .complete 1526,1 --Glowing Ember (1)
    .mob 火焰之魂
step << Orc Shaman/Troll Shaman/Tauren Shaman
    .goto 1411/1,-4022.51,-243.92
    >>点击地上的 |cRXP_PICK_火盆|r
    .turnin 1526 >>交任务: 火焰的召唤
    .accept 1527 >>接任务: 火焰的召唤
step << Orc Shaman/Troll Shaman/Tauren Shaman
    #optional
    #completewith FireEnd
    >>击杀沿途的所有 |cRXP_ENEMY_迅猛龙|r，拾取 |cRXP_LOOT_迅猛龙的头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step << Orc Shaman/Troll Shaman/Tauren Shaman
    #optional
    #completewith next
    >>击杀沿途的 |cRXP_ENEMY_斑马|r，拾取 |cRXP_LOOT_斑马蹄|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
step << Orc Shaman/Troll Shaman/Tauren Shaman
    #label FireEnd
    .goto 1413/1,-3037.56,264.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡纳尔|r 交谈
    .turnin 1527 >>交任务: 火焰的召唤
    .target 卡纳尔·菲斯
step << Orc Shaman/Troll Shaman/Tauren Shaman
    .goto 1413/1,-3029.46,261.25
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，使用它接取任务
    >>|cRXP_WARN_如果酒桶不在，等待刷新|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务: 老陈的空酒桶
step 
    #completewith RatchetEnter
    >>击杀 |cRXP_ENEMY_迅猛龙|r，拾取 |cRXP_LOOT_迅猛龙的头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞尖啸龙
step
    #optional
    #completewith next
    .goto 1413/1,-3851.27,-526.53,100,0
    >>击杀 |cRXP_ENEMY_快步斑马|r，拾取 |cRXP_LOOT_斑马蹄|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
    .isOnQuest 872
step
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_快步斑马|r，拾取 |cRXP_LOOT_斑马蹄|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
    .isNotOnQuest 872
step
    #label RatchetEnter
    .goto 1413/1,-3728.66,-835.29
    .subzone 392 >> 前往棘齿城
    .isOnQuest 845
step
    .goto 1413/1,-3767.800,-842.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尼克斯|r 交谈
    .accept 97253 >>接任务: 零零碎碎
    .target 卑鄙的维尼克斯
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 交谈
    .accept 887 >>接任务: 南海海盗
    .target 加兹鲁维
step
    #completewith next
    .goto 1413/1,-3770.20,-898.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 交谈
    .fp Ratchet >> 开通棘齿城的飞行路线
    .target 布拉高克
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 交谈并查看 |cRXP_FRIENDLY_通缉告示|r
    .accept 894 >>接任务: 什么什么平衡器
    .goto 1413/1,-3759.06,-902.18
    .accept 895 >>接任务: 通缉：巴隆·朗绍尔
    .goto 1413/1,-3719.54,-919.07
    .target 斯布特瓦夫
step << Undead Warrior/Skyborne Warrior
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T135353:0|t[普通长剑]|cRXP_BUY_。|r
    .collect 2024,1,895,1 --Collect Espadon (1)
    .money <0.6397
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Undead Warrior/Skyborne Warrior
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑] |cRXP_WARN_（达到16级后）|r
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp >16,1
step << Undead Warrior/Skyborne Warrior
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑]
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <16,1
step << Troll Warrior
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T135147:0|t[法师之杖]|cRXP_BUY_。|r
    .collect 2030,1,850,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Troll Warrior
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Orc Warrior
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T132394:0|t[芒刺斧]|cRXP_BUY_。|r
    .collect 2025,1,850,1 --Collect Bearded Axe (1)
    .money <0.5304
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Orc Warrior
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T132394:0|t[芒刺斧]
    .use 2025
    .itemcount 2025,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Tauren Warrior
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T133046:0|t[巨型石锤]|cRXP_BUY_。|r
    .collect 2026,1,850,1 --Collect Rock Hammer (1)
    .money <0.6286
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Tauren Warrior
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T133046:0|t[巨型石锤] |cRXP_WARN_（达到16级后）|r
    .use 2026
    .itemcount 2026,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp >16,1
step << Tauren Warrior
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T133046:0|t[巨型石锤]
    .use 2026
    .itemcount 2026,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <16,1
step << Shaman
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T135147:0|t[法师之杖]|cRXP_BUY_。|r
    .collect 2030,1,895,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Shaman
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Rogue
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T135343:0|t[战士阔剑]|cRXP_BUY_。|r
    .collect 2027,1,895,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 艾隆萨尔
step << Rogue
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
step << Rogue
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，再购买一把|r |T135343:0|t[战士阔剑] |cRXP_BUY_作为副手武器|r
    .collect 2027,2,895,1 --Collect Scimitar(1)
    .money <0.3815
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 艾隆萨尔
step << skip
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_将第二把|r |T135343:0|t[战士阔剑] |cRXP_WARN_装备到副手|r
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
step
    .goto 1413/1,-3687.11,-981.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德罗恩|r 交谈
    .turnin 819 >>交任务: 老陈的空酒桶
    .accept 821 >>接任务: 老陈的空酒桶
    .target 酿酒师德罗恩
    .isOnQuest 819
step
    #optional
    .goto 1413/1,-3687.11,-981.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德罗恩|r 交谈
    .accept 821 >>接任务: 老陈的空酒桶
    .target 酿酒师德罗恩
    .isQuestTurnedIn 819
step << Mage/Priest/Warlock/Shaman/Druid
    .goto 1413/1,-3664.82,-1050.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板维尔雷|r 交谈
    -->>|cRXP_BUY_Buy|r |T133918:0|t[Longjaw Mud Snappers] |cRXP_BUY_from him|r
    >>|cRXP_BUY_向他购买|r |T132796:0|t[果汁]|cRXP_BUY_。|r << Mage/Warlock/Priest/Shaman/Druid
    -->>|T133918:0|t[Longjaw Mud Snappers] |cRXP_WARN_are extremely cheap, buy as many as you want|r
    .vendor >> 出售杂物
    --.collect 4592,20,895,1 --Longjaw Mud Snapper (20)
    .collect 1205,10,895,1 << Mage/Warlock/Priest/Shaman/Druid --Melon Juice (10)
    .target 旅店老板维尔雷
    .isOnQuest 887
    .xp <15,1
step
    #optional
    #completewith BaronLongshore
    .destroy 5088 >> |cRXP_WARN_丢弃背包中的|r |T133735:0|t[控制台操作手册]|cRXP_WARN_，之后不再需要|r
step
    #optional
    #completewith BaronLongshore
    >>击杀 |cRXP_ENEMY_南海歹徒|r 和 |cRXP_ENEMY_南海炮兵|r
    .complete 887,1 --Southsea Brigand (12)
    .mob +南海歹徒
    .complete 887,2 --Southsea Cannoneer (6)
    .mob +南海炮兵
step << Orc Rogue/Troll Rogue
    #optional
	#completewith SouthSea
	>>击杀 |cRXP_ENEMY_塔赞|r，拾取 |cRXP_LOOT_塔赞的背包|r
    >>|cRXP_WARN_他在第一个营地刷新，并向山坡上巡逻|r
	.complete 1963,1 --Tazan's Satchel (1)
    .unitscan 塔赞
step
    #label BaronLongshore
    #loop
    .goto 1413/1,-3883.70,-1572.40,0
    .goto 1413/1,-3818.84,-1707.52,0
    .goto 1413/1,-3724.60,-1746.71,0
    .goto 1413/1,-3883.70,-1572.40,50,0
    .goto 1413/1,-3818.84,-1707.52,50,0
    .goto 1413/1,-3724.60,-1746.71,50,0
    >>击杀 |cRXP_ENEMY_巴隆·朗绍尔|r，拾取 |cRXP_LOOT_巴隆·朗绍尔的头颅|r
    >>|cRXP_WARN_他会出现在其中一个营地|r
    .complete 895,1 --Baron Longshore's Head (1)
    .unitscan 巴隆·朗绍尔
step
    #loop
    .goto 1413/1,-3885.72,-1569.690,0
    .goto 1413/1,-3902.95,-1366.33,50,0
    .goto 1413/1,-3823.91,-1512.94,50,0
    .goto 1413/1,-3885.72,-1569.690,50,0
    >>击杀 |cRXP_ENEMY_南海歹徒|r 和 |cRXP_ENEMY_南海炮兵|r
    .complete 887,1 --Southsea Brigand (12)
    .mob +南海歹徒
    .complete 887,2 --Southsea Cannoneer (6)
    .mob +南海炮兵
step
    #label SouthSea
    #loop
    .goto 1413/1,-3657.700,-1435.500,0
    .goto 1413/1,-3675.100,-1364.100,40,0
    .goto 1413/1,-3598.900,-1378.800,40,0
    .goto 1413/1,-3657.700,-1435.500,40,0
    .goto 1413/1,-3654.900,-1482.400,40,0
    .goto 1413/1,-3680.100,-1593.000,40,0
    .goto 1413/1,-3614.800,-1632.800,40,0
    .goto 1413/1,-3611.500,-1692.500,40,0
    >>拾取地上的 |cRXP_PICK_一把错综复杂的零件|r
    .complete 97253,1 --|5/5 Handful of Complicated Parts
    .isOnQuest 97253
step << Orc Rogue/Troll Rogue
    #loop
    .goto 1413/1,-3895.600,-1365.000,0
    .goto 1413/1,-3677.99,-1392.00,50,0
    .goto 1413/1,-3895.600,-1365.000,50,0
    .goto 1413/1,-3826.300,-1487.300,50,0
	>>击杀 |cRXP_ENEMY_塔赞|r，拾取 |cRXP_LOOT_塔赞的背包|r
    >>|cRXP_WARN_他在第一个营地刷新，并向山坡上巡逻|r
	.complete 1963,1 --Tazan's Satchel (1)
    .unitscan 塔赞
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 交谈
    .turnin 887 >>交任务: 南海海盗
    .turnin 895 >>交任务: 通缉：巴隆·朗绍尔
    .accept 890 >>接任务: 丢失的货物
    .target 加兹鲁维
step
    .goto 1413/1,-3767.800,-842.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尼克斯|r 交谈
    .turnin 97253 >>交任务: 零零碎碎
    .target 卑鄙的维尼克斯
    .isQuestComplete 97253
step
    .goto 1413/1,-3796.55,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪兹维格|r 交谈
    .turnin 1492 >>交任务: 码头管理员迪兹维格
    .turnin 890 >>交任务: 丢失的货物
    .accept 892 >>接任务: 丢失的货物
    .accept 896 >>接任务: 矿工的宝贝
    .target 码头管理员迪兹维格
step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 交谈
    .turnin 892 >>交任务: 丢失的货物
    .accept 888 >>接任务: 被窃的货物
    .target 加兹鲁维
step << Undead Warrior/Skyborne Warrior
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T135353:0|t[普通长剑]|cRXP_BUY_。|r
    .collect 2024,1,850,1 --Collect Espadon (1)
    .money <0.6397
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Undead Warrior/Skyborne Warrior
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑] |cRXP_WARN_（达到16级后）|r
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp >16,1
step << Undead Warrior/Skyborne Warrior
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑]
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <16,1
step << Troll Warrior
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T135147:0|t[法师之杖]|cRXP_BUY_。|r
    .collect 2030,1,850,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Troll Warrior
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Orc Warrior
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T132394:0|t[芒刺斧]|cRXP_BUY_。|r
    .collect 2025,1,850,1 --Collect Bearded Axe (1)
    .money <0.5304
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Orc Warrior
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T132394:0|t[芒刺斧]
    .use 2025
    .itemcount 2025,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Tauren Warrior
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T133046:0|t[巨型石锤]|cRXP_BUY_。|r
    .collect 2026,1,850,1 --Collect Rock Hammer (1)
    .money <0.6286
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Tauren Warrior
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T133046:0|t[巨型石锤] |cRXP_WARN_（达到16级后）|r
    .use 2026
    .itemcount 2026,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp >16,1
step << Tauren Warrior
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T133046:0|t[巨型石锤]
    .use 2026
    .itemcount 2026,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <16,1
step << Shaman
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T135147:0|t[法师之杖]|cRXP_BUY_。|r
    .collect 2030,1,850,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Shaman
    #optional
    #completewith XroadsTurnins3
    +|cRXP_WARN_装备|r |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Rogue
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，购买|r |T135343:0|t[战士阔剑]|cRXP_BUY_。|r
    .collect 2027,1,850,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 艾隆萨尔
step << Rogue
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
step << Rogue
    .goto 1413/1,-3684.07,-919.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈，再购买一把|r |T135343:0|t[战士阔剑] |cRXP_BUY_作为副手武器|r
    .collect 2027,2,850,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 艾隆萨尔
step << skip
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
step << !Tauren
    #label FlyToXroads1
    #completewith XroadsTurnins3
    .goto 1413/1,-3770.20,-898.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 交谈
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 380
    .isQuestComplete 845
step
    #optional
    #completewith next
    >>击杀沿途的所有 |cRXP_ENEMY_迅猛龙|r，拾取 |cRXP_LOOT_迅猛龙的头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step
    #loop
    .goto 1413/1,-2977.78,-942.71,0
    .goto 1413/1,-2274.52,-870.42,0
    .goto 1413/1,-2977.78,-942.71,80,0
    .goto 1413/1,-2832.87,-990.01,80,0
    .goto 1413/1,-2710.26,-959.6,80,0
    .goto 1413/1,-2392.07,-900.83,80,0
    .goto 1413/1,-2274.52,-870.42,80,0
    >>继续击杀 |cRXP_ENEMY_斑马|r，拾取 |cRXP_LOOT_斑马蹄|r 直到完成任务
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
step << Tauren Druid
    #completewith DruidTraining1
    .cast 18960 >>|cRXP_WARN_施放|r |T135758:0|t[传送：月光林地]
    .zoneskip Moonglade
step << Tauren Druid
    .goto 1450/1,-2593.82,7866.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .train 782 >> 学习职业技能
    .target 洛甘纳尔
    .bindlocation 1638,1
    .cooldown item,6948,>0
    .xp <14,1
    .xp >16,1
step << Tauren Druid
    #label DruidTraining1
    .goto 1450/1,-2593.82,7866.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r 交谈
    .train 8925 >> 学习职业技能
    .target 洛甘纳尔
    .bindlocation 1638,1
    .cooldown item,6948,>0
    .xp <16,1
step << Tauren
    #completewith FlyXroads2
    .hs >> 炉石返回雷霆崖
    .bindlocation 1638,1
    .zoneskip Thunder Bluff
    .cooldown item,6948,>0
    .use 6948
step << Tauren
    .goto Thunder Bluff,45.6,55.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安哈努|r 交谈
    .turnin 6362 >>交任务: 飞往雷霆崖
    .accept 6363 >>接任务: 双足飞龙管理员塔尔
    .target 安哈努
step << Tauren Shaman
    .goto 1456/1,269.92,-980.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_提戈尔|r 交谈
    .train 2645 >> 学习职业技能
    .target 提戈尔·逐星
    .xp <14,1
    .xp >16,1
step << Tauren Shaman
    #optional
    .goto 1456/1,269.92,-980.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_提戈尔|r 交谈
    .train 8498 >> 学习职业技能
    .target 提戈尔·逐星
    .xp <16,1
step << Tauren Hunter/Tauren Warrior
    #completewith HunterTraining1 << Tauren Hunter
    #completewith WarriorTraining1 << Tauren Warrior
    .goto 1456/1,-123.26,-1394.49,60 >> 前往猎人高地
step << Tauren Hunter
    #label HunterTraining1
    .goto 1456/1,-100.50,-1454.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌瑞克|r 交谈
    .train 13795 >> 学习职业技能
    .target 乌瑞克·雷角
    .xp <16,1
step << Tauren Hunter
    .goto 1456/1,-47.69,-1434.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫苏瓦|r 交谈
    .train 24556 >> 学习宠物技能
    .target 赫苏瓦·雷角
step << Tauren Warrior
    .goto 1456/1,-81.09,-1457.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托姆|r 交谈
    .train 1160 >>学习职业技能
    .target 托姆·狂暴图腾
    .xp <14,1
    .xp >16,1
step << Tauren Warrior
    #label WarriorTraining1
    .goto 1456/1,-81.09,-1457.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托姆|r 交谈
    .train 285 >>学习职业技能
    .target 托姆·狂暴图腾
    .xp <16,1
step << Tauren
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 交谈
    .turnin 6363 >>交任务: 双足飞龙管理员塔尔
    .accept 6364 >>接任务: 向加翰回复
    .target 塔尔
step << Tauren
    #label FlyXroads2
    #completewith HidesTurnIn
    .goto 1456/1,26.1,-1196.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 交谈
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .zoneskip The Barrens
step << Tauren
    .goto 1413/1,-2645.40,-406.94--c:The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德|r 交谈
    .home >>将炉石设在十字路口
    .target 旅店老板伯兰德·草风
    .bindlocation 380
    .isQuestAvailable 903,850,867,901
step
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 交谈
    .turnin 5041 >>交任务: 十字路口的补给品
    .turnin 872 >>交任务: 野猪人的头目
    .target 索克
    .isQuestTurnedIn 871
step
    #label XroadsTurnins3
    .goto 1413/1,-2669.72,-481.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉|r 交谈
    .turnin 845 >>交任务: 斑马的威胁
    .accept 903 >>接任务: 草原上的徘徊者
    .target 瑟格拉·黑棘
step << Tauren
    #label HidesTurnIn
    .goto 1413/1,-2566.36,-350.19--c:The Barrens,51.21,29.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加翰|r 交谈
    .turnin 6364 >>交任务: 向加翰回复
    .target 加翰·鹰翼
    .isOnQuest 6364
step << Troll Hunter/Orc Hunter
    .goto 1413/1,-2612.98,-411.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_巴尔格|r 交谈
    >>|cRXP_BUY_向他购买|r |T132382:0|t[锋利的箭]|cRXP_BUY_。|r
    .collect 2515,1200,850,1 << Hunter --Sharp Arrow (1200)
    .target 巴尔格
step << Tauren Hunter
    .goto 1413/1,-2612.98,-411.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_巴尔格|r 交谈
    >>|cRXP_BUY_向他购买|r |T132384:0|t[重弹丸]|cRXP_BUY_。|r
    .collect 2519,1000,850,1 << Hunter --Heavy Shot (1000)
    .target 巴尔格
step << Troll Hunter/Orc Hunter/Skyborne Hunter
    .goto 1413/1,-2556.23,-351.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r 交谈
    .vendor >> |cRXP_BUY_如果有货，向他购买|r |T135490:0|t[|cRXP_FRIENDLY_精良的长弓|r]|cRXP_BUY_，并补充箭矢|r
    >>|cRXP_WARN_如果没有货，就购买|r |T135490:0|t[强化弓] |cRXP_WARN_代替|r
    .collect 2515,1200,870,1 << Hunter --Sharp Arrow (1200)
    .target 阿瑟罗克
    .isOnQuest 903
step << Tauren Hunter
    .goto 1413/1,-2556.23,-351.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r|cRXP_BUY_交谈，购买|r |T135613:0|t[猎人火枪]|cRXP_BUY_。|r
    .collect 2511,1,871,1 --Collect Hunter's Boomstick (1)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
    .target 阿瑟罗克
step
    #optional
    #completewith RegtharDeathgate1
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，拾取 |cRXP_LOOT_平原陆行鸟的肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .isQuestTurnedIn 819
step
    #optional
    #completewith next
    >>击杀沿途的所有 |cRXP_ENEMY_迅猛龙|r，拾取 |cRXP_LOOT_迅猛龙的头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨|r 交谈
    .accept 850 >>接任务: 科卡尔首领
    .accept 855 >>接任务: 半人马护腕
    .target 雷戈萨·死门
step
    #optional
    #label RegtharDeathgate1
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨|r 交谈
    .accept 850 >>接任务: 科卡尔首领
    .target 雷戈萨·死门
step
    #optional
    #completewith KodobaneTurnin
    >>击杀 |cRXP_ENEMY_科卡尔牧民|r 和 |cRXP_ENEMY_科卡尔召雷师|r，拾取 |cRXP_LOOT_半人马护腕|r
    >>|cRXP_WARN_这个任务不必现在完成|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔牧民
    .mob 科卡尔召雷师
    .isOnQuest 855
step
    #optional
    #completewith Barak
    >>收集遗忘之池周围的 |cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_这个任务不必现在完成|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    .goto 1413/1,-1943.16,89.64
    >>潜入水下，游到 |cRXP_PICK_冒泡的裂隙|r 处
    .complete 870,1 --Explore the waters of the Forgotten Pools
step
    #label Barak
    .goto 1413/1,-1716.18,23.43
    >>击杀 |cRXP_ENEMY_巴拉克·科多班恩|r，拾取 |cRXP_LOOT_巴拉克的头颅|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_巴拉克·科多班恩|r 的近战伤害很高，还有一名 |cRXP_ENEMY_科卡尔牧民|r 护卫。他们会用网困住你并进行远程射击|r
    .complete 850,1 --Kodobane's Head (1)
    .mob 巴拉克·科多班恩
step
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨|r 交谈
    .turnin 850 >>交任务: 科卡尔首领
    .accept 851 >>接任务: 狂热的维罗戈
    .turnin 855 >>交任务: 半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855
step
    #label KodobaneTurnin
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨|r 交谈
    .turnin 850 >>交任务: 科卡尔首领
    .accept 851 >>接任务: 狂热的维罗戈
    .target 雷戈萨·死门
step
    #optional
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨|r 交谈
    .accept 851 >>接任务: 狂热的维罗戈
    .target 雷戈萨·死门
    .isQuestTurnedIn 850
step
    #optional
    #completewith HarpyTalons
    >>击杀沿途的所有 |cRXP_ENEMY_迅猛龙|r，拾取 |cRXP_LOOT_迅猛龙的头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step
    #loop
    .goto 1413/1,-1594.58,30.19,0
    .goto 1413/1,-1594.58,30.19,50,0
    .goto 1413/1,-1562.15,-29.94,50,0
    .goto 1413/1,-1483.11,66.67,50,0
    .goto 1413/1,-1531.75,180.85,50,0
    .goto 1413/1,-1462.84,214.63,50,0
    >>击杀 |cRXP_ENEMY_草原徘徊者|r，拾取 |cRXP_LOOT_徘徊者的爪子|r 和 |cRXP_LOOT_草原狮的獠牙|r
    .complete 903,1 --Prowler Claws (7)
    .complete 821,1 --Savannah Lion Tusk (5)
    .disablecheckbox
    .mob 草原徘徊者
    .isQuestTurnedIn 819
step
    #optional
    #loop
    .goto 1413/1,-1594.58,30.19,0
    .goto 1413/1,-1594.58,30.19,50,0
    .goto 1413/1,-1562.15,-29.94,50,0
    .goto 1413/1,-1483.11,66.67,50,0
    .goto 1413/1,-1531.75,180.85,50,0
    .goto 1413/1,-1462.84,214.63,50,0
    >>击杀 |cRXP_ENEMY_草原徘徊者|r，拾取 |cRXP_LOOT_徘徊者的爪子|r
    .complete 903,1 --Prowler Claws (7)
    .mob 草原徘徊者
    .isQuestAvailable 819
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #loop
    .goto 1413/1,-1616.87,611.90,0
    .goto 1413/1,-1583.43,322.73,60,0
    .goto 1413/1,-1513.51,380.84,60,0
    .goto 1413/1,-1526.68,477.450,60,0
    .goto 1413/1,-1555.06,545.69,60,0
    .goto 1413/1,-1553.03,615.95,60,0
    .goto 1413/1,-1616.87,611.90,60,0
    >>击杀 |cRXP_ENEMY_巫翼鹰身人|r 和 |cRXP_ENEMY_巫翼游荡者|r，拾取 |cRXP_LOOT_巫翼鹰身人的爪子|r
    .complete 867,1 --Witchwing Talon (8)
    .mob 巫翼鹰身人
    .mob 巫翼游荡者
step
    #optional
    #label HarpyTalons
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #completewith Samophlange
    +|cRXP_WARN_小心附近的|r |cRXP_ENEMY_赤鳞镰爪龙|r|cRXP_WARN_。它们最高18级，会施放|r |T132152:0|t[痛击]
    .xp >17,1
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #optional
    #completewith Samophlange
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，拾取 |cRXP_LOOT_平原陆行鸟的肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
    .isQuestTurnedIn 819
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-1812.500,790.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗朗恩|r 交谈
    .accept 95494 >>接任务: 受挫的自尊与狮皮
    .accept 95507 >>接任务: 弗朗恩的猎物
    .target 弗朗恩·凝血
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-1815.48,786.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗朗恩|r 交谈
    >>|cRXP_FRIENDLY_弗朗恩|r |cRXP_WARN_出售|r |T133476:0|t[|cRXP_FRIENDLY_重型尖刺钉锤|r]|cRXP_WARN_，这是限量商品|r << Tauren Warrior/Tauren Shaman/Druid
	.vendor	>> 出售杂物并修理装备
    .target 弗朗恩·凝血
    .isQuestAvailable 95494,95507
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #completewith next
    >>搜刮地上的 |cRXP_PICK_已触发的陷阱|r
    .complete 95507,1 --|8/8 Trapped Game
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #loop
    .goto 1413/1,-1848.200,486.900,0
    .goto 1413/1,-1848.200,486.900,50,0
    .goto 1413/1,-1937.500,480.000,50,0
    .goto 1413/1,-1983.100,579.700,50,0
    .goto 1413/1,-1960.600,653.700,50,0
    .goto 1413/1,-1871.600,653.700,50,0
    .goto 1413/1,-1729.700,592.400,50,0
    >>击杀 |cRXP_ENEMY_草原狮王|r，拾取 |cRXP_LOOT_草原狮的皮|r 和 |cRXP_LOOT_草原狮的獠牙|r
    >>|cRXP_WARN_如果抢怪的人太多，无法迅速完成任务，可以跳过此步|r
    .complete 95494,1 --|6/6 Savannah Lion Hide
    .complete 821,1 --Savannah Lion Tusk (5)
    .disablecheckbox
    .mob 草原狮王
    .isQuestTurnedIn 819
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #optional
    #loop
    .goto 1413/1,-1848.200,486.900,0
    .goto 1413/1,-1848.200,486.900,50,0
    .goto 1413/1,-1937.500,480.000,50,0
    .goto 1413/1,-1983.100,579.700,50,0
    .goto 1413/1,-1960.600,653.700,50,0
    .goto 1413/1,-1871.600,653.700,50,0
    .goto 1413/1,-1729.700,592.400,50,0
    >>击杀 |cRXP_ENEMY_草原狮王|r，拾取 |cRXP_LOOT_草原狮的皮|r
    >>|cRXP_WARN_如果抢怪的人太多，无法迅速完成任务，可以跳过此步|r
    .complete 95494,1 --|6/6 Savannah Lion Hide
    .mob 草原狮王
    .isQuestAvailable 819
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #loop
    .goto 1413/1,-1960.600,653.700,0
    .goto 1413/1,-1848.200,486.900,50,0
    .goto 1413/1,-1937.500,480.000,50,0
    .goto 1413/1,-1983.100,579.700,50,0
    .goto 1413/1,-1960.600,653.700,50,0
    .goto 1413/1,-1871.600,653.700,50,0
    .goto 1413/1,-1729.700,592.400,50,0
    >>搜刮地上的 |cRXP_PICK_已触发的陷阱|r
    .complete 95507,1 --|8/8 Trapped Game
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-1812.600,789.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗朗恩·凝血|r 交谈
    .turnin 95494 >>交任务: 受挫的自尊与狮皮
    .turnin 95507 >>交任务: 弗朗恩的猎物
    .accept 95495 >>接任务: 隐居的制皮匠
    .target 弗朗恩·凝血
    .isQuestComplete 95494
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #completewith next
    .goto 1413/1,-1778.100,684.200,25,0
    .goto 1413/1,-1741.700,721.400,25,0
    .goto 1413/1,-1643.900,786.000,25,0
    .goto 1413/1,-1605.300,818.300,20 >>上山
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-1635.400,838.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃尔顿|r 交谈
    .turnin 95495 >>交任务: 隐居的制皮匠
    .accept 95621 >>接任务: 谷中风波
    .target 沃尔顿
    .isQuestTurnedIn 95494
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-1611.500,549.000
    >>击杀 |cRXP_ENEMY_阿达摩尔下士|r
    >>|cRXP_WARN_小心！你可能同时引到2-3个敌人|r
    .complete 95621,1 --|1/1 Learn why the Kul Tirans are here
    .mob 阿达摩尔下士
    .isQuestTurnedIn 95494
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #completewith next
    .goto 1413/1,-1736.900,650.300,25,0
    .goto 1413/1,-1741.700,721.400,25,0
    .goto 1413/1,-1643.900,786.000,25,0
    .goto 1413/1,-1605.300,818.300,20 >>上山
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-1635.500,838.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃尔顿|r 交谈
    .turnin 95621 >>交任务: 谷中风波
    .accept 95508 >>接任务: 不速之客
    .timer 67,不速之客剧情
    .target 沃尔顿
    .isQuestTurnedIn 95494
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-1629.200,835.600
    >>到屋后等待剧情结束，避免同时引到所有敌人
    >>|cRXP_WARN_实际上无须帮助 |cRXP_FRIENDLY_沃尔顿|r，他会在|r |cRXP_FRIENDLY_弗朗恩·凝血|r 的帮助下存活
    .complete 95508,1 --|1/1 Assist Walton
    .mob 泰瑞·长饮
    .isQuestTurnedIn 95494
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-1635.400,838.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_沃尔顿|r 交谈
    .turnin 95508 >>交任务: 不速之客
    .target 沃尔顿
    .isQuestTurnedIn 95494
step
    #completewith EcheyakeePickup
    .hs >> 炉石返回十字路口
    .cooldown item,6948,>0
    .use 6948
    .bindlocation 380,1
    .subzoneskip 380
step
    #label FoodandWater2
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德|r 交谈
	.vendor >>|cRXP_BUY_出售杂物，然后按需补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物，然后按需补充食物|r << Rogue/Warrior
    .target 旅店老板伯兰德·草风
    .isQuestAvailable 901,881
step
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r 交谈
    .turnin 869 >>交任务: 偷钱的迅猛龙
    .accept 3281 >>接任务: 被偷走的银币
    .target 加兹罗格
    .isQuestComplete 869
step
    #optional
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r 交谈
    .accept 3281 >>接任务: 被偷走的银币
    .target 加兹罗格
    .isQuestTurnedIn 869
step
    .goto 1413/1,-2589.67,-424.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫布瑞姆|r 交谈
    .turnin 848 >> 交任务: 菌类孢子
    .target 药剂师赫布瑞姆
    .isQuestComplete 848
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-2607.91,-475.180
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克|r 交谈
    .turnin 867 >>交任务: 鹰身强盗
    --.accept 875 >>Accept Harpy Lieutenants
    .target 达索克·快刀
step
    .goto 1413/1,-2641.35,-521.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_曼科里克|r 交谈
    .accept 899 >>接任务: 复仇的怒火
    .accept 4921 >>接任务: 在战斗中失踪
    .target 曼科里克
step
    .goto 1413/1,-2672.76,-544.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加|r 交谈
    .turnin 870 >>交任务: 遗忘之池
    .accept 877 >>接任务: 死水绿洲
    .target 图加·符文图腾
step
    #label EcheyakeePickup
    .goto 1413/1,-2670.74,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉|r 交谈
    .turnin 903 >>交任务: 草原上的徘徊者
    .accept 881 >>接任务: 埃其亚基
    .target 瑟格拉·黑棘
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #completewith SamophlangeComplete
    >>击杀沿途的所有 |cRXP_ENEMY_迅猛龙|r，拾取 |cRXP_LOOT_迅猛龙的头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-3031.48,461.91
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，拾取 |cRXP_LOOT_埃其亚基的皮|r
    >>|cRXP_WARN_如果 |cRXP_ENEMY_埃其亚基|r 没有在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后出现，或者出现后没有抢到归属，跳过此步|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #optional
    .goto 1413/1,-2669.72,-481.94
    .abandon 881 >>|cRXP_WARN_如果 |cRXP_ENEMY_埃其亚基|r 没有在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后出现，或者出现后没有抢到归属，放弃埃其亚基任务，然后回城重新接取|r
    .itemcount 5100,<1 --Echeyakee's Hide (0)
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-2670.74,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉|r 交谈
    .accept 881 >>接任务: 埃其亚基
    .target 瑟格拉·黑棘
    .itemcount 5100,<1 --Echeyakee's Hide (0)
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-3031.48,461.91
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，拾取 |cRXP_LOOT_埃其亚基的皮|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327
step << Tauren/Hunter/Orc Shaman/Troll Shaman
	#label Samophlange
    .goto 1413/1,-2686.95,825.40
    >>点击 |cRXP_PICK_控制台|r
    .turnin 894 >>交任务: 什么什么平衡器
    .accept 900 >>接任务: 什么什么平衡器
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-2686.95,842.290
    >>点击 |cRXP_PICK_阀门|r
    >>|cRXP_WARN_小心！关闭阀门后会出现两名敌人|r
    .complete 900,1 --Shut off Main Control Valve (1)
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-2675.80,842.290
    >>点击 |cRXP_PICK_阀门|r
    >>|cRXP_WARN_关闭阀门后会出现一名敌人|r
    .complete 900,3 --Shut off Regulator Valve (1)
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-2679.86,830.80
    >>点击 |cRXP_PICK_阀门|r
    .complete 900,2 --Shut off Fuel Control Valve (1)
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-2686.95,825.40
    >>点击 |cRXP_PICK_控制台|r
    .turnin 900 >>交任务: 什么什么平衡器
    .accept 901 >>接任务: 什么什么平衡器
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-2731.54,909.850
    >>击杀建筑内的 |cRXP_ENEMY_工匠斯尼格斯|r，拾取 |cRXP_LOOT_控制台钥匙|r
    .complete 901,1 --Console Key (1)
    .mob 工匠斯尼格斯
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #label SamophlangeComplete
    .goto 1413/1,-2686.95,825.40
    >>点击 |cRXP_PICK_控制台|r
    .turnin 901 >>交任务: 什么什么平衡器
    .accept 902 >>接任务: 什么什么平衡器
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #loop
    .goto 1413/1,-2879.48,781.48,0
    .goto 1413/1,-2879.48,781.48,90,0
    .goto 1413/1,-2909.88,484.21,90,0
    .goto 1413/1,-2666.500,719.600,90,0
    .goto 1413/1,-2965.400,1009.100,90,0
    >>击杀 |cRXP_ENEMY_迅猛龙|r，拾取 |cRXP_LOOT_迅猛龙的头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
    .mob 赤鳞镰爪龙
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #optional
    .goto 1413/1,-3102.42,1105.78
    >>请在这里刷怪升到16级，接下来的3个任务相当困难
	.xp 16
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #label Ignition
    .goto 1413/1,-3104.44,1109.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_维兹克兰克的伐木机|r 交谈，它在淤泥沼泽
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r |cRXP_WARN_刷新时间很长。如果抢任务的人太多，可以考虑跳过|r
    .accept 858 >>接任务: 打火钥匙
    .target 维兹克兰克的伐木机
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #completewith next
    +|cRXP_WARN_如果|r |cRXP_ENEMY_工头葛瑞尔斯|r |cRXP_WARN_或|r |cRXP_ENEMY_淤泥兽|r |cRXP_WARN_在附近，务必小心。这些19级稀有怪很强|r
    .unitscan 工头葛瑞尔斯
    .unitscan 淤泥兽
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-3104.44,1040.25,20,0
    .goto 1413/1,-3086.20,1055.78,12,0
    .goto 1413/1,-3063.91,1049.70,12,0
    .goto 1413/1,-3056.82,1038.89,12,0
    .goto 1413/1,-3064.92,1034.16,12,0
    .goto 1413/1,-3086.20,1055.78
    >>击杀 |cRXP_ENEMY_鲁格维兹主管|r，拾取 |cRXP_LOOT_打火钥匙|r
    >>|cRXP_WARN_他会在平台上下巡逻|r
    .complete 858,1 --Ignition Key (1)
    .mob 鲁格维兹主管
    .isOnQuest 858
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1413/1,-3104.44,1109.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_维兹克兰克的伐木机|r 交谈
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r |cRXP_WARN_刷新时间很长。如果抢任务的人太多，可以考虑跳过|r
    >>|cRXP_WARN_这会开始护送任务，请确保自己满血|r
    .turnin 858 >>交任务: 打火钥匙
    .accept 863,1 >>接任务: 逃跑
    .target 维兹克兰克的伐木机
    .isQuestComplete 858
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #optional
    .goto 1413/1,-3104.44,1109.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_维兹克兰克的伐木机|r 交谈
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r |cRXP_WARN_刷新时间很长。如果抢任务的人太多，可以考虑跳过|r
    >>|cRXP_WARN_这会开始护送任务，请确保自己满血|r
    .accept 863,1 >>接任务: 逃跑
    .target 维兹克兰克的伐木机
    .isQuestTurnedIn 858
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #label Slugs
    .goto 1413/1,-3031.48,1088.21,30,0
    .goto 1413/1,-3002.10,1130.78
    >>|cRXP_WARN_两名|r |cRXP_ENEMY_风险投资公司雇佣兵|r |cRXP_WARN_会在伐木机登上高地时出现。击杀他们，然后等待最后的剧情结束|r
    .complete 863,1 --Escort Wizzlecrank out of the Venture Co. drill site (1)
    .mob 风险投资公司雇佣兵
    .mob 风险投资公司苦工
    .mob 监工格里比
    .isOnQuest 863
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，拾取 |cRXP_LOOT_平原陆行鸟的肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
    .isQuestTurnedIn 819
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #label CatsEye
    #loop
    .goto 1413/1,-3610.1,1313.2,0
    .goto 1413/1,-3605.03,1308.47,40,0
    .goto 1413/1,-3564.5,1367.25,40,0
    .goto 1413/1,-3622.26,1384.81,40,0
    .goto 1413/1,-3673.94,1374.68,40,0
    .goto 1413/1,-3653.67,1306.44,40,0
    .goto 1413/1,-3644.55,1249.69,40,0
    .goto 1413/1,-3603.0,1236.85,40,0
    .goto 1413/1,-3575.64,1271.31,40,0
    .goto 1413/1,-3610.1,1313.2,40,0
    >>击杀 |cRXP_ENEMY_风险投资公司执行者|r 和 |cRXP_ENEMY_风险投资公司监督|r，拾取 |cRXP_LOOT_猫眼翡翠|r
    >>|cRXP_WARN_击杀25+个敌人后仍未掉落，可以跳过此任务|r
    .complete 896,1 -- Cats Eye Emerald (1)
    .mob 风险投资公司执行者
    .mob 风险投资公司监督
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #ssf
    .goto 1413/1,-3610.1,1313.2,0
    .goto 1413/1,-3605.03,1308.47,40,0
    .goto 1413/1,-3564.5,1367.25,40,0
    .goto 1413/1,-3622.26,1384.81,40,0
    .goto 1413/1,-3673.94,1374.68,40,0
    .goto 1413/1,-3653.67,1306.44,40,0
    .goto 1413/1,-3644.55,1249.69,40,0
    .goto 1413/1,-3603.0,1236.85,40,0
    .goto 1413/1,-3575.64,1271.31,40,0
    .goto 1413/1,-3610.1,1313.2,40,0
    >>击杀 |cRXP_ENEMY_风险投资公司监督|r，拾取 |T132794:0|t[|cRXP_LOOT_灯油|r]
    .collect 814,5,103,1 --Flask of Oil (5)
    .dungeon DM
step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #ah
    .goto 1413/1,-3610.1,1313.2,0
    .goto 1413/1,-3605.03,1308.47,40,0
    .goto 1413/1,-3564.5,1367.25,40,0
    .goto 1413/1,-3622.26,1384.81,40,0
    .goto 1413/1,-3673.94,1374.68,40,0
    .goto 1413/1,-3653.67,1306.44,40,0
    .goto 1413/1,-3644.55,1249.69,40,0
    .goto 1413/1,-3603.0,1236.85,40,0
    .goto 1413/1,-3575.64,1271.31,40,0
    .goto 1413/1,-3610.1,1313.2,40,0
    >>击杀 |cRXP_ENEMY_风险投资公司监督|r，拾取 |T132794:0|t[|cRXP_LOOT_灯油|r]
    >>|cRXP_WARN_也可以改从拍卖行购买|r
    .collect 814,5,103,1 --Flask of Oil (5)
    .dungeon DM
step << skip
    .goto 1413/1,-3505.72,1358.46
    .goto 1454/1,-4242.34,1637.33,30 >>|cRXP_WARN_跳上木梁，登出后重新登录以使用登出跳跃。如果没有成功，就跑回奥格瑞玛|r
    .link https://www.youtube.com/watch?v=U7YfoaO-X8E&ab_channel=RestedXP >> |cRXP_WARN_点击这里查看示例|r
    .zoneskip Orgrimmar
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#subgroupdisplayname 1-22
#forever
<< Horde
#name 16-17 Ragefire Chasm
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
--#groupid RXP-SRGCE-H1
#next 17-18 Ruins of Lordaeron
#displayname 16-17 怒焰裂谷

step
    #sticky
    #completewith EnterRFC
    .subzone 2437 >> 现在开始寻找怒焰裂谷队伍

step
    #optional
    #completewith EnterRFC
    >>|cRXP_WARN_尽可能请队友分享下列任务|r
    >>|cRXP_WARN_如有需要，可请幽暗城的玩家分享任务|r
    .accept 5725 >> 接任务：毁灭之力

step
    #optional
    #completewith EnterRFC
    >>|cRXP_WARN_尽可能请队友分享下列任务|r
    >>|cRXP_WARN_如有需要，可请雷霆崖的玩家分享任务|r
    .accept 5722 >> 接任务：寻找背包
    .accept 5723 >> 接任务：试探敌人

step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #completewith EnterRFC
    .goto 1414/1,-3839.37,1644.65
    .zone Orgrimmar >>从西侧入口进入奥格瑞玛

step << !Tauren !Hunter !Shaman/Skyborne
    #completewith EnterRFC
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克

step
    #completewith next
    .skill firstaid,40 >> |cRXP_WARN_制作|r|T133685:0|t[亚麻绷带]|cRXP_WARN_，直到急救技能达到40或更高|r
    .skill firstaid,<1,1

step
    .goto 1454/1,-4160.01,1483.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_阿诺克|r交谈
    >>|cRXP_WARN_如果没有足够的|r|T132889:0|t[亚麻布]|cRXP_WARN_将急救技能练到40，则跳过此步骤|r
    .train 3276 >> 学习|T133688:0|t[厚亚麻绷带]
    .target 阿诺克
    .skill firstaid,<1,1

step
    #completewith next
    .skill firstaid,50 >> |cRXP_WARN_制作|r|T133688:0|t[厚亚麻绷带]|cRXP_WARN_，直到急救技能达到50或更高|r
    .skill firstaid,<1,1

step
    .goto 1454/1,-4160.01,1483.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_阿诺克|r交谈
    >>|cRXP_WARN_如果没有足够的|r|T132889:0|t[亚麻布]|cRXP_WARN_将急救技能练到50，则跳过此步骤|r
    .train 3274 >> 学习中级急救
    .target 阿诺克
    .skill firstaid,<40,1

step << !Tauren !Hunter !Shaman/Skyborne
    #completewith EnterRFC
    +|cRXP_WARN_一定要保留|r|T132794:0|t[|cRXP_LOOT_灯油|r]，不要卖掉
    .itemcount 814,5
    .dungeon DM

step << Priest
    #optional
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_乌尔库|r交谈
    .train 8102 >> 学习职业技能
    .target 乌尔库
    .xp <16,1
    .xp >18,1

step << Priest
    #optional
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_乌尔库|r交谈
    .train 970 >> 学习职业技能
    .target 乌尔库
    .xp <18,1

step << Mage
    .goto 1454/1,-4218.64,1473.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 2120 >> 学习职业技能
    .target 皮菲瑞多
    .xp <16,1
    .xp >18,1

step << Mage
    #optional
    .goto 1454/1,-4218.64,1473.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 3140 >> 学习职业技能
    .target 皮菲瑞多
    .xp <18,1

step << Orc/Troll
    .goto 1454/1,-4439.37,1633.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_格雷什卡|r交谈
    .turnin 6384 >>交任务：飞往奥格瑞玛
    .accept 6385 >>接任务：双足飞龙管理员多拉斯
    .target 旅店老板格雷什卡
    .isOnQuest 6384

step << Orc/Troll
    .goto 1454/1,-4313.46,1676.25--c:Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_多拉斯|r交谈
    .turnin 6385 >> 交任务：双足飞龙管理员多拉斯
    .accept 6386 >> 接任务：返回十字路口
    .target 多拉斯
    .isOnQuest 6385

step << Orc/Troll
    .goto 1454/1,-4313.46,1676.25--c:Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_多拉斯|r交谈
    .accept 6386 >> 接任务：返回十字路口
    .target 多拉斯
    .isQuestTurnedIn 6385

step << Tauren
    .goto 1454/1,-4313.60,1676.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
    >>|cRXP_WARN_不要乘坐任何航班！|r
    .fp Orgrimmar >> 获取奥格瑞玛飞行点
    .target 多拉斯
    .isQuestAvailable 4921

step << Warrior
    .goto 1454/1,-4801.42,1980.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 285 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <16,1
    .xp >18,1

step << Warrior
    #optional
    .goto 1454/1,-4801.42,1980.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 8198 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <18,1

step << Hunter
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 13795 >> 学习职业技能
    .target 奥玛克
    .xp <16,1
    .xp >18,1

step << Hunter
    #optional
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 2643 >> 学习职业技能
    .target 奥玛克
    .xp <18,1

step << Hunter
    .goto 1454/1,-4611.09,2135.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖祖|r交谈
    .train 24557 >> 学习宠物技能
    .target 肖祖
    .xp <18,1

step << Troll Hunter/Orc Hunter/Priest/Warlock
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
    .train 227 >>学习法杖
    .target 哈纳什
    .money <0.100

step << Tauren Hunter
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
    .train 264 >>学习弓
    .target 哈纳什

step << Warrior !Skyborne
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
    .train 197 >>学习双手斧
    .train 227 >>学习法杖
    .target 哈纳什
    .money <0.020

step << Warrior/Paladin/Shaman !Skyborne
    #optional
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
    .train 197 >>学习双手斧
    .target 哈纳什
    .money <0.010

step << Hunter
    .goto 1454/1,-4819.1,2099.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_交谈，购买一把|r|T135490:0|t[强化弓]|cRXP_BUY_。|r
    .collect 3026,1,3281,1 --Collect Reinforced Bow (1)
    .money <0.3588
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.4
    .target 森度吉安
    .train 264,3

step << Hunter
    #optional
    #completewith EnterRFC
    +|cRXP_WARN_装备|r|T135490:0|t[强化弓]
    .use 3026
    .itemcount 3026,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.4

step << Warrior
    .goto 1454/1,-4819.1,2099.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_交谈，购买一把|r|T135423:0|t[大型战斧]|cRXP_BUY_。|r
    .collect 926,1,3281,1 --Collect Battle Axe (1)
    .money <1.021
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .target 森度吉安
    .train 197,3

step << Warrior
    #optional
    #completewith EnterRFC
    +|cRXP_WARN_等你达到20级时，装备|r|T135423:0|t[大型战斧]|cRXP_WARN_。|r
    .use 926
    .itemcount 926,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp >20,1

step << Warrior
    #optional
    #completewith EnterRFC
    +|cRXP_WARN_装备|r|T135423:0|t[大型战斧]
    .use 926
    .itemcount 926,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1

step << Shaman
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8019 >> 学习职业技能
    .target 卡德里斯
    .xp <16,1
    .xp >18,1

step << Shaman
    #optional
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 913 >> 学习职业技能
    .target 卡德里斯
    .xp <18,1

step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .accept 5726 >>接任务：隐藏的敌人
    .target 萨尔

step
    #completewith next
    .goto 1454/1,-4367.46,1405.44,50,0
    .zone Durotar >>离开奥格瑞玛

step
    #completewith Gazzuz
    >>击杀 |cRXP_ENEMY_火刃兽人|r，拾取他们掉落的 |cRXP_LOOT_军官的徽章|r
    >> |cRXP_WARN_这是怒焰裂谷的前置任务，任务物品掉率较低。|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒

step
    #label Gazzuz
    .goto 1411/1,-4701.42,1455.83
    >>击杀|cRXP_ENEMY_加祖兹|r，拾取掉落的 |T134085:0|t[|cRXP_LOOT_燃影之眼|r]
    >>|cRXP_WARN_使用 |T134085:0|t[|cRXP_LOOT_燃影之眼|r]开启任务|r
    >> |cRXP_WARN_利用障碍物卡视野，躲避|cRXP_ENEMY_加祖兹|r的暗影箭。|r
    >>|cRXP_WARN_击杀|r|cRXP_ENEMY_加祖兹|r|cRXP_WARN_后，跑到洞穴内的水域躲避|r|cRXP_ENEMY_虚空行者|r
    >>|cRXP_WARN_小心，加祖兹很难对付；必要时可以跳过此任务|r
    .collect 4903,1,832,1 --Collect Eye of Burning Shadow
    .accept 832 >>接任务: 燃影之眼
    .use 4903
    .unitscan 加祖兹
    .isOnQuest 5726

step
    #loop
    .goto 1411/1,-4805.59,1495.67,0
    .goto 1411/1,-4855.82,1498.84,15,0
    .goto 1411/1,-4833.08,1494.96,15,0
    .goto 1411/1,-4805.59,1495.67,15,0
    .goto 1411/1,-4784.44,1535.85,15,0
    .goto 1411/1,-4750.60,1531.62,15,0
    .goto 1411/1,-4734.21,1505.54,15,0
    .goto 1411/1,-4693.49,1519.64,15,0
    .goto 1411/1,-4679.75,1501.31,15,0
    .goto 1411/1,-4684.50,1466.06,15,0
    .goto 1411/1,-4805.59,1495.67,15,0
    >>击杀 |cRXP_ENEMY_火刃兽人|r，拾取他们掉落的 |cRXP_LOOT_军官的徽章|r
    >> |cRXP_WARN_这是怒焰裂谷的前置任务，任务物品掉率较低。|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .mob 火刃狂热者
    .mob 火刃学徒

step
    #completewith next
    .goto 1454/1,-4367.46,1405.44,50,0
    .zone Orgrimmar >> 进入奥格瑞玛

step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5726 >> 交任务：隐藏的敌人
    .accept 5727 >> 接任务：隐藏的敌人
    .target 萨尔

step << Rogue
    .goto 1454/1,-4284.42,1771.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_申苏尔|r交谈
    .train 1804 >> 学习|T136058:0|t[开锁]
    .train 921 >> 学习|T133644:0|t[偷窃]
    .accept 2379 >> 接任务：赞杜沙
    .target 申苏尔

step << Orc Rogue/Troll Rogue
    .goto 1454/1,-4280.07,1772.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟祖克|r交谈
    .turnin 1963 >> 交任务：碎手氏族
    .accept 1858 >> 接任务：碎手氏族
    .target 瑟祖克

step << Rogue
    .goto 1454/1,-4279.79,1778.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赞杜沙|r交谈
    .turnin 2379 >>交任务：赞杜沙
    .accept 2382 >>接任务：棘齿城的维尼克斯
    .target 赞杜沙

step << Orc Rogue/Troll Rogue
    #optional
    #completewith next
    .goto 1454/1,-4271.1,1810.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔|r|cRXP_BUY_交谈，购买一套|r|T134065:0|t[潜行者工具]|cRXP_BUY_。|r
    .collect 5060,1,1858,1 --Collect Thieves' Tools (1)
    .target 雷库尔
    .money <0.15

step << Orc Rogue/Troll Rogue
    .goto 1454/1,-4280.07,1773.24
    >>|cRXP_WARN_使用|r|T136058:0|t[开锁]|cRXP_WARN_打开|r|T133626:0|t[塔赞的背包]
    .complete 1858,1 --Tazan's Logbook (1)
    .money <0.15

step << Orc Rogue/Troll Rogue
    .isQuestComplete 1858
    .goto 1454/1,-4280.07,1772.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟祖克|r交谈
    .turnin 1858 >>交任务：碎手氏族
    .target 瑟祖克

step << Orc Rogue/Troll Rogue
    .goto 1454/1,-4437.87,1637.33
    >>|cRXP_WARN_使用|r|T133644:0|t[偷窃]|cRXP_WARN_，目标是旅店内的|r|cRXP_ENEMY_加摩尔|r|cRXP_WARN_。用偷来的钥匙打开|r|T133626:0|t[塔赞的背包]
    .collect 7208,1,1858,1 --Tazan's Key
    .complete 1858,1 --Tazan's Logbook (1)
    .isOnQuest 1858

step << Orc Rogue/Troll Rogue
    .goto 1454/1,-4280.07,1772.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟祖克|r交谈
    .turnin 1858 >>交任务：碎手氏族
    .target 瑟祖克

step << Warlock
    .goto 1454/1,-4362.55,1834.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
    .train 1455 >> 学习职业技能
    .target 米尔科特
    .xp <16,1
    .xp >18,1

step << Warlock
    #optional
    .goto 1454/1,-4362.55,1834.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
    .train 1014 >> 学习职业技能
    .target 米尔科特
    .xp <18,1

step << Warlock
    .goto 1454/1,-4347.4,1836.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈，购买|T133738:0|t[魔典：牺牲]
    .collect 16351,1,896,1 --Grimoire of Sacrifice (Rank 1) (1)
    .target 库古尔
    .xp <16,1
    .xp >18,1

step << Warlock
    .goto 1454/1,-4347.4,1836.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈，购买|T133738:0|t[魔典：火焰箭（等级 3）]
    .collect 16316,1,896,1 --Grimoire of Firebolt (Rank 3) (1)
    .target 库古尔
    .xp <18,1

step
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .accept 5761 >>接任务：饥饿者塔拉加曼
    .target 尼尔鲁·火刃

step
    .goto 1454/1,-4374.75,1800.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_尼尔鲁·火刃|r
    .turnin 832 >>交任务: 燃影之眼
    .target 尼尔鲁·火刃
    .isOnQuest 832

step
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .complete 5727,1 --Gauge Neeru Fireblade's reaction to you being a member of the Burning Blade
    .skipgossip
    .target 尼尔鲁·火刃

step
    #label HiddenEnemiesPickup
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5727 >> 交任务：隐藏的敌人
    .accept 5728 >> 接任务：隐藏的敌人
    .target 萨尔

step
    #completewith EnterRFC
    .destroy 14544 >>|cRXP_WARN_摧毁|r|T134417:0|t[军官的徽章]|cRXP_WARN_，之后不再需要它|r

step
    #label EnterRFC
    .goto Orgrimmar,52.77,48.97
    .subzone 2437 >> 通过怒焰裂谷的副本传送门进入副本

step
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +怒焰穴居人
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +怒焰萨满祭司
    .isOnQuest 5723

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔|r交谈
    .turnin 5722 >> 交任务：寻找背包
    .accept 5724 >> 接任务：归还背包
    .target 玛尔·恐怖图腾
    .isOnQuest 5722

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔|r交谈
    .accept 5724 >> 接任务：归还背包
    .target 玛尔·恐怖图腾
    .isQuestTurnedIn 5722

step
    #label TroggsShamans
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +怒焰穴居人
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +怒焰萨满祭司
    .isOnQuest 5723

step
    #optional
    #requires TroggsShamans
    #completewith BazzalanandJergosh
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r，拾取|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob 燃刃信徒
    .mob 燃刃术士
    .isOnQuest 5725

step
    >>击杀|cRXP_ENEMY_饥饿者塔拉加曼|r，拾取他的|cRXP_LOOT_心脏|r
    .complete 5761,1 -- Taragaman the Hungerer's Heart
    .mob 饥饿者塔拉加曼
    .isOnQuest 5761

step
    #label BazzalanandJergosh
    >>击杀|cRXP_ENEMY_巴扎兰|r和|cRXP_ENEMY_祈求者耶戈什|r
    .complete 5728,1 --Bazzalan (1)
    .mob +巴扎兰
    .complete 5728,2 --Jergosh the Invoker (1)
    .mob +祈求者耶戈什
    .isOnQuest 5728

step
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r，拾取|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob 燃刃信徒
    .mob 燃刃术士
    .isOnQuest 5725

step
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5761 >>交任务：饥饿者塔拉加曼
    .target 尼尔鲁·火刃
    .isQuestComplete 5761

step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5728 >> 交任务：隐藏的敌人
    .accept 5729 >> 接任务：隐藏的敌人
    .target 萨尔
    .isQuestComplete 5728

step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .accept 5729 >> 接任务：隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5728

step
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5729 >> 交任务：隐藏的敌人
    .accept 5730 >> 接任务：隐藏的敌人
    .target 尼尔鲁·火刃
    .isQuestTurnedIn 5728

step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r交谈
    .turnin 5730 >> 交任务：隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5728
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#subgroupdisplayname 1-22
#forever
<< Horde
#name 17-18 Ruins of Lordaeron
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
--#groupid RXP-SRGCE-H1
#next 18-21 The Barrens
#displayname 17-18 洛丹伦废墟

step
    #sticky
    #completewith EnterRoL
    .subzone 16611 >> 现在开始寻找洛丹伦废墟副本队伍

step
    #completewith next
    .zone Durotar >> 离开奥格瑞玛
    .zoneskip Tirisfal Glades
    .zoneskip Undercity
    .zoneskip Silverpine Forest

step
    .goto 1411/1,-4648.55,1321.88,40 >>上飞艇塔
    .zone Tirisfal Glades >>乘坐飞艇前往提瑞斯法林地
    >>|cRXP_WARN_等待期间施放[造水术]|r << Mage
    .zoneskip Undercity
    .zoneskip Silverpine Forest

step
    #completewith next
    .subzone 159 >> 前往布瑞尔

step
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塞弗伦|r
    .turnin 440 >> 交任务：黛丽娅的戒指
    .accept 441 >> 接任务：拉林夫与幽暗城
    .target 执政官塞弗伦
    .isOnQuest 440

step
    #optional
    .goto Tirisfal Glades,61.26,50.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塞弗伦|r
    .accept 441 >> 接任务：拉林夫与幽暗城
    .target 执政官塞弗伦
    .isQuestTurnedIn 440

step
    .goto 1420/0,84.900,2023.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵克里斯托弗::251001|r交谈
    .accept 92422 >>接任务：拉斯玛尔之怒
    .target 亡灵卫兵克里斯托弗::251001

step
    #completewith UCPickups
    >>|cRXP_WARN_如果可以，请队友分享以下任务|r
    .accept 92401 >>接任务：惊恐的求援

step
    #completewith UCPickups
    .goto 1420/0,240.75,1877.57
    .zone Undercity >>前往幽暗城

step
    #completewith UCPickups
    .goto 1458/0,239.14,1749.54,35,0
    .goto 1458/0,255.64,1724.70,35,0
    .goto 1458/0,240.68,1706.97,10,0
    .goto 1458/0,241.06,1660.12,10,0
    .goto 1458/0,257.08,1623.38,10,0
    .goto 1458/0,244.51,1598.73,15,0
    .goto 1458/0,266.300,1567.200,20 >>乘坐升降梯下到幽暗城

step
    .goto Undercity,62.02,42.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉林夫·安迪恩|r交谈
    .turnin 441 >>交任务：拉林夫与幽暗城
    .accept 530 >>接任务：丈夫的复仇
    .target 拉林夫·安迪恩
    .isQuestTurnedIn 440

step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .goto 1458/0,266.300,1567.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔·加勒特::4551|r交谈
    .fp Undercity >>开启幽暗城的飞行点
    .target 迈克尔·加勒特::4551

step
    .goto 1458/0,344.000,1423.800,50,0
    .goto 1458/0,373.200,1362.100,50,0
    .goto 1458/0,428.400,1417.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨多雷·格雷夫::11835|r交谈
    .accept 95216 >>接任务：新的瘟疫
    .target 萨多雷·格雷夫::11835

step
    .goto 1458/0,415.400,1389.900,50,0
    .goto 1458/0,373.500,1362.200,50,0
    .goto 1458/0,341.400,1434.800,50,0
    .goto 1458/0,369.400,1467.800,50,0
    .goto 1458/0,427.900,1413.700,50,0
    .goto 1458/0,438.100,1352.900,50,0
    .goto 1458/0,396.100,1308.800,50,0
    .goto 1458/0,316.000,1304.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫宾·圣光之灾::266484|r交谈
    .accept 92421 >>接任务：圣光的正义
    .target 莫宾·圣光之灾::266484

step
    #label UCPickups
    .isQuestComplete 5725
    .goto 1458/0,334.02,1262.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯::2425|r交谈
    .turnin 5725 >>交任务：毁灭之力
    .target 瓦里玛萨斯::2425

step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .isQuestAvailable 92401
    .isNotOnQuest 92401
    .zoneskip Undercity,1
    .zoneskip Silverpine Forest
    .goto 1458/0,419.89,1627.54,50,0
    .goto 1458/0,428.52,1597.20,10,0
    .goto 1458/0,439.17,1626.06,10,0
    .goto 1458/0,476.78,1632.150,10,0
    .goto 1458/0,482.34,1660.63,10,0
    .goto 1458/0,539.33,1665.49,15,0
    .goto 1458/0,610.42,1684.44,35,0
    .goto 1458/0,663.19,1600.46,35,0
    .goto 1420/0,724.25,1682.66,50,0
    .zone Tirisfal Glades >>从幽暗城下水道离开

step << Tauren/Hunter/Orc Shaman/Troll Shaman
    .isQuestAvailable 92401
    .isNotOnQuest 92401
    .zoneskip Silverpine Forest
    .goto 1420/0,629.36,1553.42,50,0
    .goto 1421/0,1204.68,1290.07
    .zone Silverpine Forest >>前往银松森林

step << Tauren/Hunter/Orc Shaman/Troll Shaman
    #completewith AFrightenedRequest
    .isQuestAvailable 92401
    .isNotOnQuest 92401
    .subzoneskip 228
    .goto 1421/0,1204.68,1290.07,50,0
    .goto 1421/0,1359.66,864.19,50,0
    .goto 1421/0,1359.66,741.27,50,0
    .goto 1421/0,1365.12,607.15,100,0
    .goto 1421/0,1538.58,511.39
    .subzone 228 >>前往瑟伯切尔

step << !Tauren !Hunter !Shaman/Skyborne
    #completewith AFrightenedRequest
    .isQuestAvailable 92401
    .isNotOnQuest 92401
    .subzoneskip 228
    .goto 1458/0,266.300,1567.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔·加勒特::4551|r交谈
    .fly Sepulcher >>飞往瑟伯切尔
    .target 迈克尔·加勒特::4551

step
    #label AFrightenedRequest
    .goto 1421/0,1579.600,461.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔比莎·织心::250686|r交谈
    .accept 92401 >>接任务：惊恐的求援
    .target 塔比莎·织心::250686

step
    #completewith next
    .zoneskip Silverpine Forest,1
    .goto 1421/0,1533.96,474.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡洛斯·拉佐克::2226|r交谈
    .fly Undercity >>飞往幽暗城
    .target 卡洛斯·拉佐克::2226

step
    #label EnterRoL
    .goto 1458/0,188.400,1804.500
    .subzone 16611 >>进入洛丹伦废墟

step
    #completewith RuinsRathma
    .isOnQuest 92421
    >>击杀|cRXP_ENEMY_亡灵|r，拾取|T458717:0|t[|cRXP_LOOT_完好的肢体|r]
    >> |cRXP_WARN_务必清理地下城内的所有怪物，否则可能无法完成这个任务。|r
    .complete 92421,1 --Intact Limbs (25)
    .mob 骷髅::250618
    --.mob Cadaver::250621
    --.mob Ragged Ghoul::250622
    --.mob Mangled Cadaver::250623
    --.mob Skeletal Mage::250624
    --.mob Skeletal Soldier::250626
    --.mob Ghoul::250627
    --.mob Plague Ghoul::250630
    .mob 陨落狂战士::250656
    --.mob Living Monstrosity::250689
    .mob 血肉傀儡::255109
    .mob 堕落通灵师::255964

step
    #completewith RuinsLimbs
    .isQuestAvailable 95204
    .isNotOnQuest 95204
    >>拾取并使用|T4504543:0|t[|cRXP_LOOT_洛丹伦纹章|r]以开始任务
    >>|cRXP_WARN_它有5个可能的刷新位置|r
    .collect 275521,1,95204 --Crest of Lordaeron (1)
    .accept 95204 >>接任务：洛丹伦纹章
    .use 275521

step
    .isOnQuest 95216
    >>击杀|cRXP_ENEMY_枯牙::250483|r，拾取|T132108:0|t[|cRXP_LOOT_剧毒菌株|r]
    .complete 95216,1 --Highly Toxic Strain (1)
    .mob 枯牙::250483

step
    .isQuestAvailable 97288
    .isNotOnQuest 97288
    >>击杀|cRXP_ENEMY_男爵::250660|r，拾取并使用他的|T2492254:0|t[|cRXP_LOOT_憎恶头颅|r]以开始任务
    .collect 280438,1,97288 --Abominable Head (1)
    .accept 97288 >>接任务：无尽的折磨
    .use 280438
    .mob 男爵::250660

step
    #label RuinsRathma
    .isOnQuest 92422
    >>击杀|cRXP_ENEMY_拉斯玛尔::250657|r
    .complete 92422,1 --Rath'mael Slain (1)
    .mob 拉斯玛尔::250657
    .target 爱德华·织心::250842

step
    .isOnQuest 92401
    >>靠近|cRXP_FRIENDLY_爱德华·织心::250842|r的尸体，就在|cRXP_ENEMY_拉斯玛尔::250657|r附近
    .complete 92401,1
    .target 爱德华·织心::250842

step
    #label RuinsLimbs
    .isOnQuest 92421
    >>击杀|cRXP_ENEMY_亡灵|r，拾取|T458717:0|t[|cRXP_LOOT_完好的肢体|r]
    >> |cRXP_WARN_务必清理地下城内的所有怪物，否则可能无法完成这个任务。|r
    .complete 92421,1 --Intact Limbs (25)
    .mob 骷髅::250618
    --.mob Cadaver::250621
    --.mob Ragged Ghoul::250622
    --.mob Mangled Cadaver::250623
    --.mob Skeletal Mage::250624
    --.mob Skeletal Soldier::250626
    --.mob Ghoul::250627
    --.mob Plague Ghoul::250630
    .mob 陨落狂战士::250656
    --.mob Living Monstrosity::250689
    .mob 血肉傀儡::255109
    .mob 堕落通灵师::255964

step
    .isQuestAvailable 95204
    .isNotOnQuest 95204
    >>拾取并使用|T4504543:0|t[|cRXP_LOOT_洛丹伦纹章|r]以开始任务
    >>|cRXP_WARN_它有5个可能的刷新位置|r
    .collect 275521,1,95204 --Crest of Lordaeron (1)
    .accept 95204 >>接任务：洛丹伦纹章
    .use 275521

step
    .goto 1458/0,188.400,1804.500
    .zone Undercity >>离开洛丹伦废墟

step
    .isQuestComplete 92422
    .goto 1420/0,84.900,2023.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_亡灵卫兵克里斯托弗::251001|r交谈
    .turnin 92422 >>交任务：拉斯玛尔之怒
    .target 亡灵卫兵克里斯托弗::251001

step
    .goto 1420/0,240.75,1877.57
    .zone Undercity >>返回幽暗城

step
    .goto 1458/0,239.14,1749.54,35,0
    .goto 1458/0,255.64,1724.70,35,0
    .goto 1458/0,240.68,1706.97,10,0
    .goto 1458/0,241.06,1660.12,10,0
    .goto 1458/0,257.08,1623.38,10,0
    .goto 1458/0,244.51,1598.73,15,0
    .goto 1458/0,266.300,1567.200,20 >>乘坐升降梯下到幽暗城

step
    .goto 1458/0,241.700,1633.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔文·格瑞斯特::4554|r交谈
    >> |cRXP_WARN_她在贸易区巡逻。|r
    >>|cRXP_BUY_购买|r|T134522:0|t[|cRXP_LOOT_剧毒便帽|r]
    .collect 281246,1,97291,1 --Toxic Skullcap (1)
    .target 塔文·格瑞斯特::4554

step
    .isOnQuest 95204
    .goto 1458/0,172.100,1667.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥兰·斯内克威瑟::7825|r交谈
    .turnin 95204 >>交任务：洛丹伦纹章
    .target 奥兰·斯内克威瑟::7825

step
    .goto 1458/0,151.500,1550.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾泽基尔·格瑞乌斯::4585|r交谈
    >>|cRXP_BUY_购买|r|T134799:0|t[|cRXP_LOOT_苦楚精华|r]
    .collect 8923,1,97291,1 --Essence of Agony (1)
    .target 艾泽基尔·格瑞乌斯::4585

step
    .isQuestComplete 95216
    .goto 1458/0,344.000,1423.800,15,0
    .goto 1458/0,373.200,1362.100,15,0
    .goto 1458/0,428.400,1417.700
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨多雷·格雷夫::11835|r交谈
    .turnin 95216 >>交任务：新的瘟疫
    .target 萨多雷·格雷夫::11835

step
    .isOnQuest 97288
    .goto 1458/0,404.800,1434.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔::2055|r交谈
    .turnin 97288 >>交任务：无尽的折磨
    .accept 97289 >>接任务：无尽的折磨
    .target 大药剂师法拉尼尔::2055

step
    #optional
    .isQuestTurnedIn 97288
    .goto 1458/0,404.800,1434.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔::2055|r交谈
    .accept 97289 >>接任务：无尽的折磨
    .target 大药剂师法拉尼尔::2055

step
    .isOnQuest 97289
    .goto 1458/0,433.300,1482.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_未完成的憎恶::271613|r交谈
    .turnin 97289 >>交任务：无尽的折磨
    .accept 97290 >>接任务：无尽的折磨
    .target 未完成的憎恶::271613

step
    #optional
    .isQuestTurnedIn 97289
    .goto 1458/0,433.300,1482.600
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_未完成的憎恶::271613|r交谈
    .accept 97290 >>接任务：无尽的折磨
    .target 未完成的憎恶::271613

step
    .isOnQuest 97290
    .goto 1458/0,404.800,1434.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔::2055|r交谈
    .turnin 97290 >>交任务：无尽的折磨
    .accept 97291 >>接任务：无尽的折磨
    .target 大药剂师法拉尼尔::2055

step
    #optional
    .isQuestTurnedIn 97290
    .goto 1458/0,404.800,1434.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔::2055|r交谈
    .accept 97291 >>接任务：无尽的折磨
    .target 大药剂师法拉尼尔::2055

step
    .goto 1458/0,357.62,1529.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_看守者贝尔杜加|r交谈
    .accept 1013 >>接任务：乌尔之书
    .target 看守者贝尔杜加

step
    .goto 1458/0,356.700,1563.500
    >> |cRXP_WARN_在|cRXP_FRIENDLY_马尔萨·奥列斯塔|r身后的花盆中拾取|T134181:0|t[|cRXP_LOOT_水疱草|r]。|r
    .collect 281300,1,97291,1 --Blisterweed (1)
    .target 马尔萨·奥列斯塔

step
    .isOnQuest 97291
    .goto 1458/0,404.800,1434.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔::2055|r交谈
    .turnin 97291 >>交任务：无尽的折磨
    .accept 97292 >>接任务：无尽的折磨
    .target 大药剂师法拉尼尔::2055

step
    #optional
    .isQuestTurnedIn 97291
    .goto 1458/0,404.800,1434.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔::2055|r交谈
    .accept 97292 >>接任务：无尽的折磨
    .target 大药剂师法拉尼尔::2055

step
    .isOnQuest 97292
    .goto 1458/0,444.300,1421.500,10,0
    .goto 1458/0,455.400,1442.500,10,0
    .goto 1458/0,438.800,1468.700
    .use 281327 >>|cRXP_WARN_使用|r|T134837:0|t[|cRXP_LOOT_嘶嘶血清|r]，|cRXP_WARN_就在楼上虫子旁边|r
    .complete 97292,1

step
    .isQuestComplete 97292
    .goto 1458/0,404.800,1434.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大药剂师法拉尼尔::2055|r交谈
    .turnin 97292 >>交任务：无尽的折磨
    .target 大药剂师法拉尼尔::2055

step
    .isQuestComplete 92421
    .goto 1458/0,377.100,1461.700,15,0
    .goto 1458/0,431.500,1407.800,10,0
    .goto 1458/0,429.200,1340.400,10,0
    .goto 1458/0,368.600,1305.000,10,0
    .goto 1458/0,315.600,1304.800
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫宾·圣光之灾::266484|r交谈
    .turnin 92421 >>交任务：圣光的正义
    .target 莫宾·圣光之灾::266484

step << Rogue
    #completewith RuinsRogueTurnin
    #optional
    .isQuestComplete 92401
    .zoneskip Undercity,1
    .goto 1458/0,266.300,1567.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈克尔·加勒特::4551|r交谈
    .fly Sepulcher >>若已开启飞行点，飞往瑟伯切尔
    .target 迈克尔·加勒特::4551

step << Rogue
    #label RuinsRogueTurnin
    #optional
    .isQuestComplete 92401
    .goto 1421/0,1579.600,461.700
    >>|cRXP_WARN_只有需要升级副手装备时，才在此时交任务|r
    >>若无法乘坐航班，从下水道离开，沿路前往瑟伯切尔
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔比莎·织心::250686|r交谈
    .turnin 92401 >>交任务：惊恐的求援
    .target 塔比莎·织心::250686
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#subgroupdisplayname 1-22
#forever
<< Horde
#name 18-21 The Barrens
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
--#groupid RXP-SRGCE-H1
#next 21-22 Wailing Caverns
#displayname 18-21 贫瘠之地

step
    #completewith FoodandWater2
    .hs >> 炉石返回十字路口
    .use 6948
    .bindlocation 380,1
    .zoneskip The Barrens

step
    #label FoodandWater2
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r交谈
    .vendor >>|cRXP_BUY_出售杂物，并按需补充食物和饮水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物，并按需补充食物|r << Rogue/Warrior
    .target 旅店老板伯兰德·草风
    .isQuestAvailable 3281,865,905

step << !Tauren !Hunter !Shaman/Skyborne
    #completewith Ignition
    >>击杀沿途见到的所有|cRXP_ENEMY_迅猛龙|r，拾取它们掉落的|cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙

step << !Tauren !Hunter !Shaman/Skyborne
    .goto 1413/1,-3031.48,461.91
    >>使用|T134227:0|t[埃其亚基的号角]召唤|cRXP_ENEMY_埃其亚基|r
    >>击杀|cRXP_ENEMY_埃其亚基|r，拾取|cRXP_LOOT_埃其亚基的皮|r
    >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r|T134227:0|t[埃其亚基的号角]|cRXP_WARN_后未出现，或出现后你未抢到归属，请跳过此步|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327

step << !Tauren !Hunter !Shaman/Skyborne
    #optional
    .goto 1413/1,-2669.72,-481.94
    .abandon 881 >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r|T134227:0|t[埃其亚基的号角]|cRXP_WARN_后未出现，或出现后你未抢到归属，请放弃“埃其亚基”，返回城镇重新接取|r
    .itemcount 5100,<1 --Echeyakee's Hide (0)

step << !Tauren !Hunter !Shaman/Skyborne
    .goto 1413/1,-2670.74,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘
    .itemcount 5100,<1 --Echeyakee's Hide (0)

step << !Tauren !Hunter !Shaman/Skyborne
    .goto 1413/1,-3031.48,461.91
    >>使用|T134227:0|t[埃其亚基的号角]召唤|cRXP_ENEMY_埃其亚基|r
    >>击杀|cRXP_ENEMY_埃其亚基|r，拾取|cRXP_LOOT_埃其亚基的皮|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327

step << !Tauren !Hunter !Shaman/Skyborne
    #label Samophlange
    .goto 1413/1,-2686.95,825.40
    >>点击|cRXP_PICK_控制台|r
    .turnin 894 >>交任务：什么什么平衡器
    .accept 900 >>接任务：什么什么平衡器

step << !Tauren !Hunter !Shaman/Skyborne
    .goto 1413/1,-2686.95,842.290
    >>点击|cRXP_PICK_阀门|r
    >>|cRXP_WARN_小心！关闭阀门后会刷新两只怪物|r
    .complete 900,1 --Shut off Main Control Valve (1)

step << !Tauren !Hunter !Shaman/Skyborne
    .goto 1413/1,-2675.80,842.290
    >>点击|cRXP_PICK_阀门|r
    >>|cRXP_WARN_关闭阀门后会刷新一只怪物|r
    .complete 900,3 --Shut off Regulator Valve (1)

step << !Tauren !Hunter !Shaman/Skyborne
    .goto 1413/1,-2679.86,830.80
    >>点击|cRXP_PICK_阀门|r
    .complete 900,2 --Shut off Fuel Control Valve (1)

step << !Tauren !Hunter !Shaman/Skyborne
    .goto 1413/1,-2686.95,825.40
    >>点击|cRXP_PICK_控制台|r
    .turnin 900 >>交任务：什么什么平衡器
    .accept 901 >>接任务：什么什么平衡器

step << !Tauren !Hunter !Shaman/Skyborne
    .goto 1413/1,-2731.54,909.850
    >>击杀建筑内的|cRXP_ENEMY_工匠斯尼格斯|r，拾取他的|cRXP_LOOT_控制台钥匙|r
    .complete 901,1 --Console Key (1)
    .mob 工匠斯尼格斯

step << !Tauren !Hunter !Shaman/Skyborne
    #label SamophlangeComplete
    .goto 1413/1,-2686.95,825.40
    >>点击|cRXP_PICK_控制台|r
    .turnin 901 >>交任务：什么什么平衡器
    .accept 902 >>接任务：什么什么平衡器

step << !Tauren !Hunter !Shaman/Skyborne
    #label Ignition
    .goto 1413/1,-3104.44,1109.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹克兰克的伐木机|r（位于淤泥沼泽）交谈
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r|cRXP_WARN_刷新时间很长。如果抢任务的人很多，可以考虑跳过此任务|r
    .accept 858 >>接任务：打火钥匙
    .target 维兹克兰克的伐木机

step << !Tauren !Hunter !Shaman/Skyborne
    #completewith next
    +|cRXP_WARN_如果|r|cRXP_ENEMY_工头葛瑞尔斯|r|cRXP_WARN_或|r|cRXP_ENEMY_淤泥兽|r|cRXP_WARN_在场，请小心。它们都是强力的19级稀有怪物|r
    .unitscan 工头葛瑞尔斯
    .unitscan 淤泥兽

step << !Tauren !Hunter !Shaman/Skyborne
    .goto 1413/1,-3104.44,1040.25,20,0
    .goto 1413/1,-3086.20,1055.78,12,0
    .goto 1413/1,-3063.91,1049.70,12,0
    .goto 1413/1,-3056.82,1038.89,12,0
    .goto 1413/1,-3064.92,1034.16,12,0
    .goto 1413/1,-3086.20,1055.78
    >>击杀|cRXP_ENEMY_鲁格维兹主管|r，拾取他的|cRXP_LOOT_钥匙|r
    >>|cRXP_WARN_他会沿平台上下巡逻|r
    .complete 858,1 --Ignition Key (1)
    .mob 鲁格维兹主管
    .isOnQuest 858

step << !Tauren !Hunter !Shaman/Skyborne
    .goto 1413/1,-3104.44,1109.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹克兰克的伐木机|r交谈
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r|cRXP_WARN_刷新时间很长。如果抢任务的人很多，可以考虑跳过此任务|r
    >>|cRXP_WARN_此任务会启动护送。请确保生命值全满|r
    .turnin 858 >>交任务：打火钥匙
    .accept 863,1 >>接任务：逃跑
    .target 维兹克兰克的伐木机
    .isQuestComplete 858

step << !Tauren !Hunter !Shaman/Skyborne
    #optional
    .goto 1413/1,-3104.44,1109.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹克兰克的伐木机|r交谈
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r|cRXP_WARN_刷新时间很长。如果抢任务的人很多，可以考虑跳过此任务|r
    >>|cRXP_WARN_此任务会启动护送。请确保生命值全满|r
    .accept 863,1 >>接任务：逃跑
    .target 维兹克兰克的伐木机
    .isQuestTurnedIn 858

step << !Tauren !Hunter !Shaman/Skyborne
    #label Slugs
    .goto 1413/1,-3031.48,1088.21,30,0
    .goto 1413/1,-3002.10,1130.78
    >>|cRXP_WARN_两名|r|cRXP_ENEMY_风险投资公司雇佣兵|r|cRXP_WARN_会在伐木机走上高地时出现。击杀他们，然后等待护送终点的剧情结束|r
    .complete 863,1 --Escort Wizzlecrank out of the Venture Co. drill site (1)
    .mob 风险投资公司雇佣兵
    .mob 风险投资公司苦工
    .mob 监工格里比
    .isOnQuest 863

step << !Tauren !Hunter !Shaman/Skyborne
    #loop
    .goto 1413/1,-2879.48,781.48,0
    .goto 1413/1,-2879.48,781.48,90,0
    .goto 1413/1,-2909.88,484.21,90,0
    .goto 1413/1,-2666.500,719.600,90,0
    .goto 1413/1,-2965.400,1009.100,90,0
    >>击杀|cRXP_ENEMY_迅猛龙|r，拾取它们掉落的|cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
    .mob 赤鳞镰爪龙

step << !Tauren !Hunter !Shaman/Skyborne
    #optional
    #completewith RapHornsPickup
    .hs >> 炉石返回十字路口
    .use 6948
    .bindlocation 380,1
    .subzoneskip 380
    .cooldown item,6948,>0

step << !Tauren !Hunter !Shaman/Skyborne
    #completewith next
    .subzone 380 >>前往十字路口
    .cooldown item,6948,<0

step
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r交谈
    .turnin 869 >>交任务：偷钱的迅猛龙
    .accept 3281 >>接任务：被偷走的银币
    .target 加兹罗格

step
    .goto 1413/1,-2670.74,-482.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 881 >>交任务：埃其亚基
    .accept 905 >>接任务：狂暴的镰爪龙
    .target 瑟格拉·黑棘

step
    #optional
    #completewith RapHornsPickup
    .destroy 10327 >>|cRXP_WARN_摧毁|r|T134227:0|t[埃其亚基的号角]|cRXP_WARN_，后续不再需要|r

step << Hunter
    .goto 1413/1,-2612.98,-411.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_巴尔格|r交谈
    >>|cRXP_BUY_购买|r|T132382:0|t[锋利的箭]|cRXP_BUY_，向他补充弹药|r
    .collect 2515,1800,888,1 << Hunter --Sharp Arrow (1800)
    .target 巴尔格

step
    #completewith RapHornsPickup
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Ratchet >>飞往棘齿城
    .target 迪弗拉克
    .subzoneskip 392

step << Rogue
    .goto 1413/1,-3767.800,-842.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卑鄙的维尼克斯|r交谈
    .turnin 2382 >>交任务：棘齿城的维尼克斯
    .accept 2381 >>接任务：抢劫海盗
    .target 卑鄙的维尼克斯

step << Rogue
    .goto 1413/1,-3773.24,-841.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尼克斯的机械设备|r交谈
    >>|cRXP_WARN_领取一份|r|T134059:0|t[大饼干]|cRXP_WARN_和一套|r|T134065:0|t[潜行者工具]
    .collect 7970,1,888,1 --E.C.A.C. (1)
    .collect 5060,1,888,1 --Thieves' Tools (1)

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r和|cRXP_FRIENDLY_码头管理员迪兹维格|r交谈
    .turnin 902 >>交任务：什么什么平衡器
    .turnin 863 >> 交任务：逃跑
    .target +斯布特瓦夫
    .goto 1413/1,-3759.06,-902.18
    .turnin 896 >> 交任务：矿工的宝贝
    .target +码头管理员迪兹维格
    .goto 1413/1,-3796.55,-985.28
    .isQuestComplete 896
    .isQuestComplete 863

step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r和|cRXP_FRIENDLY_码头管理员迪兹维格|r交谈
    .turnin 902 >>交任务：什么什么平衡器
    .target +斯布特瓦夫
    .goto 1413/1,-3759.06,-902.18
    .turnin 896 >> 交任务：矿工的宝贝
    .target +码头管理员迪兹维格
    .goto 1413/1,-3796.55,-985.28
    .isQuestComplete 896

step
    #optional
    .goto 1413/1,-3759.06,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .turnin 863 >> 交任务：逃跑
    .target 斯布特瓦夫
    .isQuestComplete 863

step
    #label RapHornsPickup
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦伯克·米希瑞克斯|r交谈
    .accept 865 >>接任务：迅猛龙角
    .target 麦伯克·米希瑞克斯

step << skip
    .goto 1413/1,-3664.82,-1050.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板维尔雷|r交谈
    -->>|cRXP_BUY_Buy|r |T133918:0|t[Longjaw Mud Snappers] |cRXP_BUY_from him|r
    >>|cRXP_BUY_购买|r|T132796:0|t[果汁]|cRXP_BUY_，向他补充饮水|r << Mage/Warlock/Priest/Shaman/Druid
    -->>|T133918:0|t[Longjaw Mud Snappers] |cRXP_WARN_are extremely cheap, buy as many as you want|r
    .vendor >> 出售杂物
    --.collect 4592,20,888,1 --Longjaw Mud Snapper (20)
    .collect 1205,10,888,1 << Mage/Warlock/Priest/Shaman/Druid --Melon Juice (10)
    .target 旅店老板维尔雷

step << Rogue
    #completewith next
    .goto 1413/1,-3967.8,-1457.54
    +|cRXP_WARN_跳上船，进入第2层，将开锁技能练到至少70点|r

step << Rogue
    .goto 1413/1,-3958.68,-1457.54
    >>开锁技能达到70点后，进入船舱最底层，打开|cRXP_PICK_南海宝珠|r
    >>|cRXP_WARN_使用|r|T134059:0|t[大饼干]|cRXP_WARN_，目标为|r|cRXP_ENEMY_波利|r
    .complete 2381,1 --Southsea Treasure (1)
    .use 7970
    .mob 波利

step
    #label LeaveRatchet
    .goto 1413/1,-3819.86,-1714.95
    >>拾取地上的|cRXP_PICK_箱子|r
    .complete 888,2 --Telescopic Lens (1)

step
    .goto 1413/1,-3723.59,-1741.30
    >>拾取地上的|cRXP_PICK_箱子|r
    .complete 888,1 --Shipment of Boots (1)

step
    #optional
    #completewith TestSeeds
    >>击杀|cRXP_ENEMY_平原陆行鸟|r，拾取它们掉落的|cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
    .isQuestTurnedIn 819

step
    #optional
    #completewith TestSeeds
    >>击杀|cRXP_ENEMY_赤鳞镰爪龙|r，拾取它们掉落的|cRXP_LOOT_角|r和|cRXP_LOOT_羽毛|r
    >>|cRXP_WARN_小心，它们会施放|r|T132152:0|t[痛击]|cRXP_WARN_（每10秒获得2次额外攻击）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .collect 5165,3,905,3 --Sunscale Feather (3)
    .mob 赤鳞镰爪龙

step
    .goto 1413/1,-3192.60,-1919.67,60,0
    .goto 1413/1,-3258.47,-2027.09
    >>拾取地上的|cRXP_PICK_被偷走的银币|r
    .complete 3281,1 --Stolen Silver (1)

step
    #optional
    #completewith TestSeeds
    >>击杀绿洲周围的|cRXP_ENEMY_科卡尔半人马|r，拾取它们掉落的|cRXP_LOOT_护腕|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔战士
    .mob 科卡尔驯犬者
    .mob 科卡尔掠夺者
    .isOnQuest 855

step
    #optional
    #completewith Verog
    >>在死水绿洲周围采集|cRXP_LOOT_丰满的蘑菇|r
    .complete 848,1 --Collect Fungal Spores (x4)

step
    #label TestSeeds
    .goto 1413/1,-3012.23,-1275.80
    >>点击水下的|cRXP_PICK_冒泡的裂隙|r
    .complete 877,1 --Test the Dried Seeds (1)

step
    #optional
    #completewith next
    #loop
    .goto 1413/1,-3031.48,-1480.51,50,0
    .goto 1413/1,-3127.75,-1320.39,50,0
    .goto 1413/1,-3154.1,-1172.43,50,0
    .goto 1413/1,-2996.02,-1182.56,50,0
    .goto 1413/1,-2949.4,-1146.75,50,0
    .goto 1413/1,-2789.3,-1107.57,50,0
    .goto 1413/1,-2746.74,-1409.57,50,0
    .goto 1413/1,-2880.5,-1550.1,50,0
    >>击杀绿洲周围的|cRXP_ENEMY_科卡尔半人马|r，拾取它们掉落的|cRXP_LOOT_护腕|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔战士
    .mob 科卡尔驯犬者
    .mob 科卡尔掠夺者
    .isOnQuest 855

step
    #label Verog
    .goto 1413/1,-2742.68,-1208.23
    >>击杀|cRXP_ENEMY_狂热的维罗戈|r，拾取他的|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_每击杀一名|cRXP_ENEMY_科卡尔半人马|r，他都有几率刷新|r
    >>|cRXP_WARN_在人口较多的服务器或开服初期，最好守在他的刷新点等待|r
    .complete 851,1 --Verog's Head (1)
    .unitscan 狂热的维罗戈
    .isOnQuest 851

step
    #loop
    .goto 1413/1,-3023.38,-1234.58,0
    .goto 1413/1,-3023.38,-1234.58,30,0
    .goto 1413/1,-3000.07,-1208.23,30,0
    .goto 1413/1,-2959.54,-1196.75,30,0
    .goto 1413/1,-2953.46,-1241.34,30,0
    .goto 1413/1,-2977.78,-1304.17,30,0
    .goto 1413/1,-3029.46,-1324.44,30,0
    .goto 1413/1,-3066.95,-1311.61,30,0
    .goto 1413/1,-3059.86,-1264.31,30,0
    >>在死水绿洲周围采集|cRXP_LOOT_丰满的蘑菇|r
    .complete 848,1 --Collect Fungal Spores (x4)

step
    #optional
    #completewith LakotaMani1
    >>击杀|cRXP_ENEMY_平原陆行鸟|r，拾取它们掉落的|cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
    .isQuestTurnedIn 819

step
    .goto 1413/1,-2707.22,-1502.130
    >>点击|cRXP_PICK_蓝色迅猛龙巢穴|r。如果没有|cRXP_ENEMY_赤鳞镰爪龙|r掉落的|T132914:0|t[赤鳞迅猛龙的羽毛]，就继续击杀它们
    >>|cRXP_WARN_小心，它们会施放|r|T132152:0|t[痛击]|cRXP_WARN_（每10秒获得2次额外攻击）|r
    .complete 905,1 --Visit Blue Raptor Nest (1)
    .collect 5165,3,905,7,3
    .mob 赤鳞镰爪龙

step
    .goto 1413/1,-2692.02,-1533.89
    >>点击|cRXP_PICK_红色迅猛龙巢穴|r。如果没有|cRXP_ENEMY_赤鳞镰爪龙|r掉落的|T132914:0|t[赤鳞迅猛龙的羽毛]，就继续击杀它们
    >>|cRXP_WARN_小心，它们会施放|r|T132152:0|t[痛击]|cRXP_WARN_（每10秒获得2次额外攻击）|r
    .complete 905,3 --Visit Red Raptor Nest (1)
    .collect 5165,3,905,7,3
    .mob 赤鳞镰爪龙

step
    #label Nest
    .goto 1413/1,-2648.44,-1527.13
    >>点击|cRXP_PICK_黄色迅猛龙巢穴|r。如果没有|cRXP_ENEMY_赤鳞镰爪龙|r掉落的|T132914:0|t[赤鳞迅猛龙的羽毛]，就继续击杀它们
    >>|cRXP_WARN_小心，它们会施放|r|T132152:0|t[痛击]|cRXP_WARN_（每10秒获得2次额外攻击）|r
    .complete 905,2 --Visit Yellow Raptor Nest (1)
    .collect 5165,3,905,7,3
    .mob 赤鳞镰爪龙

step
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_赤鳞镰爪龙|r，拾取它们掉落的|cRXP_LOOT_角|r
    >>|cRXP_WARN_小心，它们会施放|r|T132152:0|t[痛击]|cRXP_WARN_（每10秒获得2次额外攻击）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob 赤鳞镰爪龙

step
    #label LostmyWife
    .goto 1413/1,-2375.86,-1787.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_血肉模糊的尸体|r交谈
    .complete 4921,1 --Find Mankrik's Wife (1)
    .target 血肉模糊的尸体
    .skipgossip

step
    #optional
    #completewith CampTArrive
    >>击杀|cRXP_ENEMY_雷角蜥蜴|r，拾取一个|cRXP_LOOT_雷霆蜥蜴的角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴
    .isQuestTurnedIn 819

step
    #label LakotaMani1
    #completewith CampTArrive
    .goto 1413/1,-1951.27,-1956.15,0
    .goto 1413/1,-2031.32,-1703.47,0
    .goto 1413/1,-2183.32,-1858.19,0
    .goto 1413/1,-2453.88,-1991.28,0
    >>击杀|cRXP_ENEMY_拉克塔曼尼|r，拾取|T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r]
    >>|cRXP_WARN_使用|T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r]接取任务|r
    >>|cRXP_WARN_他有4个刷新点，已在地图上标出|r
    >>|cRXP_WARN_如果找不到他或无法击杀，请跳过此步。之后可以回来再找|r
    .collect 5099,1,883 --Collect Hoof of Lakota'Mani
    .accept 883 >>接任务：拉克塔曼尼
    .use 5099
    .unitscan 拉克塔曼尼
    .xp <18,1

step
    #label CampTArrive
    #completewith next
    .goto 1413/1,-1960.39,-2333.83,120 >> 前往陶拉祖营地
    .subzoneskip 378

step
    #requires CampTArrive
    #label SetCampTaurajoHS
    .goto 1413/1,-1995.86,-2376.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
    .home >>将炉石设为陶拉祖营地
    .target 旅店老板比鲁拉
    .bindlocation 378
    .isQuestAvailable 1093

step
    .goto 1413/1,-1921.88,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 883 >>交任务：拉克塔曼尼
    .target 乔恩·星眼
    .isOnQuest 883

step
    .goto 1413/1,-1891.48,-2391.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_碎牙|r交谈
    .accept 878 >>接任务：野猪人的内战
    .target 碎牙

step
    #completewith Xroadsturnins2
    .goto 1413/1,-1881.35,-2384.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r交谈
    .fp Camp Taurajo >> 获取陶拉祖营地飞行点 << !Tauren
    .fly Crossroads >>飞往十字路口
    .target 欧姆萨·雷角
    .zoneskip The Barrens,1
    .subzoneskip 380

step
    .goto 1413/1,-2589.67,-424.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    .turnin 848 >> 交任务：菌类孢子
    .target 药剂师赫布瑞姆
    .isQuestComplete 848

step
    #label Xroadsturnins2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_曼科里克|r、|cRXP_FRIENDLY_图加·符文图腾|r、|cRXP_FRIENDLY_瑟格拉·黑棘|r和|cRXP_FRIENDLY_加兹罗格|r交谈
    .turnin 4921 >>交任务：在战斗中失踪
    .accept 95774 >>接任务：她的名字叫奥格拉
    .target +曼科里克
    .goto 1413/1,-2641.35,-521.12
    .turnin 877 >>交任务：死水绿洲
    .accept 880 >>接任务：变异的生物
    .target +图加·符文图腾
    .goto 1413/1,-2672.76,-544.77
    .turnin 905 >>交任务：狂暴的镰爪龙
    .accept 3261 >>接任务：乔恩·星眼
    .target +瑟格拉·黑棘
    .goto 1413/1,-2670.74,-482.61
    .turnin 3281 >>交任务：被偷走的银币
    .target +加兹罗格
    .goto 1413/1,-2639.32,-436.00

step
    #optional
    #completewith next
    .destroy 5165 >>|cRXP_WARN_摧毁剩余的|r|T132914:0|t[赤鳞迅猛龙的羽毛]|cRXP_WARN_，不再保留|r
    .itemcount 5165,1

step << Hunter
    .goto 1413/1,-2556.23,-351.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r|cRXP_BUY_交谈，购买|r |T134410:0|t[中型箭袋] |cRXP_BUY_。|r
    .collect 11362,1,896,1 --Medium Quiver (1)
    .collect 2515,2200,896,1 --Sharp Arrow (2200)
    .target 阿瑟罗克

step << Druid
    #completewith DruidTraining2
    .cast 18960 >>|cRXP_WARN_施放|r|T135758:0|t[传送：月光林地]
    .zoneskip Moonglade

step << Druid
    .goto 1450/1,-2593.82,7866.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 1430 >> 学习职业技能
    .target 洛甘纳尔
    .xp <18,1
    .xp >20,1
    .cooldown item,6948,>0

step << Druid
    #label DruidTraining2
    .goto 1450/1,-2593.82,7866.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 768 >> 学习职业技能
    .target 洛甘纳尔
    .xp <20,1
    .cooldown item,6948,>0

step
    #completewith JornSkyseerTurnin
    .hs >> 炉石返回陶拉祖营地
    .use 6948
    .bindlocation 378,1
    .subzoneskip 378
    .cooldown item,6948,>0

step
    #completewith JornSkyseerTurnin
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Camp Taurajo >> 飞往陶拉祖营地
    .subzoneskip 378
    .target 迪弗拉克
    .cooldown item,6948,<0

step
    .goto 1413/1,-1995.86,-2375.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
    .vendor >>|cRXP_BUY_出售杂物，并按需补充食物和饮水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物，并按需补充食物|r << Rogue/Warrior
    .target 旅店老板比鲁拉
    .isOnQuest 3261

step
    #label JornSkyseerTurnin
    .goto 1413/1,-1921.88,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 3261 >>交任务：乔恩·星眼
    .accept 882 >>接任务：伊沙姆哈尔
    .target 乔恩·星眼

step
    #completewith LakotaMani2
    >>击杀|cRXP_ENEMY_钢鬃掠夺者|r，拾取|cRXP_LOOT_奥格拉的饰物|r
    .complete 95774,1 --|4/4 Olgra's Adornments
    .mob 钢鬃掠夺者

step
    #completewith Adornments
    >>击杀|cRXP_ENEMY_雷角蜥蜴|r，拾取它们掉落的|cRXP_LOOT_角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴
    .isQuestTurnedIn 819

step
    #completewith Adornments
    >>击杀|cRXP_ENEMY_刺背野猪人|r，拾取它们掉落的|cRXP_LOOT_獠牙|r。保留获得的|T134128:0|t[|cRXP_LOOT_血岩碎片|r]
    .complete 878,1 --Kill Bristleback Water Seeker (x6)
    .mob +刺背寻水者
    .complete 878,2 --Kill Bristleback Thornweaver (x12)
    .mob +刺背织棘者
    .complete 878,3 --Kill Bristleback Geomancer (x12)
    .mob +刺背地卜师
    .complete 899,1 --Collect Bristleback Quilboar Tusk (x60)
    .mob +刺背寻水者
    .mob +刺背织棘者
    .mob +刺背地卜师

step
    #label LakotaMani2
    #loop
    .goto 1413/1,-1951.27,-1956.15,0
    .goto 1413/1,-2031.32,-1703.47,0
    .goto 1413/1,-2183.32,-1858.19,0
    .goto 1413/1,-2453.88,-1991.28,0
    .goto 1413/1,-1951.27,-1956.15,80,0
    .goto 1413/1,-2031.32,-1703.47,80,0
    .goto 1413/1,-2183.32,-1858.19,80,0
    .goto 1413/1,-2453.88,-1991.28,80,0
    >>击杀|cRXP_ENEMY_拉克塔曼尼|r，拾取|T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r]
    >>|cRXP_WARN_使用|T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r]接取任务|r
    >>|cRXP_WARN_他有4个刷新点，已在地图上标出|r
    >>|cRXP_WARN_如果找不到他，请跳过此步|r
    .collect 5099,1,883 --Collect Hoof of Lakota'Mani
    .accept 883 >>接任务：拉克塔曼尼
    .use 5099
    .unitscan 拉克塔曼尼

step
    #label Adornments
    #loop
    .goto 1413/1,-2241.200,-1988.500,0
    .goto 1413/1,-2241.200,-1988.500,50,0
    .goto 1413/1,-2346.200,-1788.600,50,0
    .goto 1413/1,-2458.300,-1824.400,50,0
    .goto 1413/1,-2381.000,-2061.000,50,0
    >>击杀|cRXP_ENEMY_钢鬃掠夺者|r，拾取|cRXP_LOOT_奥格拉的饰物|r
    .complete 95774,1 --|4/4 Olgra's Adornments
    .mob 钢鬃掠夺者

step
    #optional
    #completewith next
    >>击杀|cRXP_ENEMY_雷角蜥蜴|r，拾取它们掉落的|cRXP_LOOT_角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴
    .isQuestTurnedIn 819

step
    #loop
    .goto 1413/1,-2515.7,-2076.41,0
    .goto 1413/1,-2515.7,-2076.41,60,0
    .goto 1413/1,-2518.74,-2125.73,60,0
    .goto 1413/1,-2517.72,-2223.7,60,0
    .goto 1413/1,-2486.31,-2254.1,60,0
    .goto 1413/1,-2494.42,-2282.48,60,0
    .goto 1413/1,-2531.91,-2272.34,60,0
    .goto 1413/1,-2571.43,-2295.31,60,0
    .goto 1413/1,-2620.07,-2285.18,60,0
    .goto 1413/1,-2625.14,-2245.32,60,0
    .goto 1413/1,-2755.86,-2082.49,60,0
    .goto 1413/1,-2813.62,-2054.12,60,0
    .goto 1413/1,-2811.59,-2004.12,60,0
    .goto 1413/1,-2783.22,-1949.39,60,0
    .goto 1413/1,-2747.75,-1889.26,60,0
    .goto 1413/1,-2709.24,-1913.59,60,0
    .goto 1413/1,-2706.2,-1948.72,60,0
    .goto 1413/1,-2687.96,-1973.04,60,0
    .goto 1413/1,-2678.84,-2016.28,60,0
    .goto 1413/1,-2584.6,-2050.74,60,0
    >>击杀|cRXP_ENEMY_刺背野猪人|r，拾取它们掉落的|cRXP_LOOT_獠牙|r。保留获得的|T134128:0|t[|cRXP_LOOT_血岩碎片|r]
    .complete 878,1 --Kill Bristleback Water Seeker (x6)
    .mob +刺背寻水者
    .complete 878,2 --Kill Bristleback Thornweaver (x12)
    .mob +刺背织棘者
    .complete 878,3 --Kill Bristleback Geomancer (x12)
    .mob +刺背地卜师
    .complete 899,1 --Collect Bristleback Quilboar Tusk (x60)
    .mob +刺背寻水者
    .mob +刺背织棘者
    .mob +刺背地卜师

step << Warlock
    #loop
    .goto 1413/1,-2515.7,-2076.41,60,0
    .goto 1413/1,-2518.74,-2125.73,60,0
    .goto 1413/1,-2517.72,-2223.7,60,0
    .goto 1413/1,-2486.31,-2254.1,60,0
    .goto 1413/1,-2494.42,-2282.48,60,0
    .goto 1413/1,-2531.91,-2272.34,60,0
    .goto 1413/1,-2571.43,-2295.31,60,0
    .goto 1413/1,-2620.07,-2285.18,60,0
    .goto 1413/1,-2625.14,-2245.32,60,0
    .goto 1413/1,-2755.86,-2082.49,60,0
    .goto 1413/1,-2813.62,-2054.12,60,0
    .goto 1413/1,-2811.59,-2004.12,60,0
    .goto 1413/1,-2783.22,-1949.39,60,0
    .goto 1413/1,-2747.75,-1889.26,60,0
    .goto 1413/1,-2709.24,-1913.59,60,0
    .goto 1413/1,-2706.2,-1948.72,60,0
    .goto 1413/1,-2687.96,-1973.04,60,0
    .goto 1413/1,-2678.84,-2016.28,60,0
    .goto 1413/1,-2584.6,-2050.74,60,0
    .xp 19+9500 >> 刷怪至9500+/21300经验值

step
    #loop
    .goto 1413/1,-2532.92,-1965.61,0
    .goto 1413/1,-2532.92,-1965.61,50,0
    .goto 1413/1,-2449.83,-1953.45,50,0
    .goto 1413/1,-2377.88,-2018.31,50,0
    .goto 1413/1,-2397.14,-2108.84,50,0
    .goto 1413/1,-2345.46,-2187.21,50,0
    .goto 1413/1,-2415.38,-2179.78,50,0
    >>击杀|cRXP_ENEMY_雷角蜥蜴|r，拾取它们掉落的|cRXP_LOOT_角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴
    .isQuestTurnedIn 819

step
    #completewith next
    >>击杀|cRXP_ENEMY_赤鳞镰爪龙|r，拾取它们掉落的|cRXP_LOOT_角|r
    >>|cRXP_WARN_小心，它们会施放|r|T132152:0|t[痛击]|cRXP_WARN_（每10秒获得2次额外攻击）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob 赤鳞镰爪龙

step
    #loop
    .goto 1413/1,-2847.06,-1879.13,0
    .goto 1413/1,-2847.06,-1879.13,50,0
    .goto 1413/1,-2859.22,-1804.81,50,0
    .goto 1413/1,-2833.88,-1749.41,50,0
    .goto 1413/1,-2881.51,-1723.74,50,0
    .goto 1413/1,-2932.18,-1698.06,50,0
    .goto 1413/1,-2973.72,-1627.8,50,0
    >>继续击杀|cRXP_ENEMY_平原陆行鸟|r，拾取它们掉落的|cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .isQuestTurnedIn 819

step
    #loop
    .goto 1413/1,-3183.48,-2015.61,0
    .goto 1413/1,-2646.42,-1529.16,0
    .goto 1413/1,-3183.48,-2015.61,90,0
    .goto 1413/1,-2646.42,-1529.16,90,0
    >>继续击杀|cRXP_ENEMY_赤鳞镰爪龙|r，拾取它们掉落的|cRXP_LOOT_角|r
    >>|cRXP_WARN_小心，它们会施放|r|T132152:0|t[痛击]|cRXP_WARN_（每10秒获得2次额外攻击）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob 赤鳞镰爪龙

step
    #completewith next
    >>击杀任意|cRXP_ENEMY_斑马|r，拾取一份|cRXP_LOOT_新鲜的斑马肉|r
    .collect 10338,1 --Collect Fresh Zhevra Carcass
    .mob 冲锋斑马

step
    #loop
    .goto 1413/1,-3010.20,-1319.04,0
    .goto 1413/1,-3010.20,-1319.04,40,0
    .goto 1413/1,-2959.54,-1292.69,40,0
    .goto 1413/1,-2953.46,-1239.31,40,0
    .goto 1413/1,-2998.04,-1192.02,40,0
    .goto 1413/1,-3050.74,-1225.13,40,0
    .goto 1413/1,-3066.95,-1260.93,40,0
    .goto 1413/1,-3052.76,-1319.710,40,0
    >>击杀湖中和湖边的|cRXP_ENEMY_绿洲钳嘴龟|r，拾取它们掉落的|cRXP_LOOT_龟壳|r
    .complete 880,1 --Altered Snapjaw Shell (8)
    .mob 绿洲钳嘴龟

step
    #completewith next
    >>击杀任意|cRXP_ENEMY_斑马|r，拾取一份|cRXP_LOOT_新鲜的斑马肉|r
    .collect 10338,1 --Collect Fresh Zhevra Carcass
    .mob 冲锋斑马

step
    #label IshamuhalesFang
    .goto 1413/1,-3427.70,-436.67
    .use 10338 >>在枯树旁使用|T134368:0|t[|cRXP_LOOT_新鲜的斑马肉|r]召唤|cRXP_ENEMY_伊沙姆哈尔|r。击杀后拾取它的|cRXP_LOOT_牙齿|r
    >>|cRXP_WARN_这份肉只能保存30分钟！|r
    .complete 882,1 --Ishamuhale's Fang (1)
    .mob 伊沙姆哈尔

step
    #completewith BootyTurnin
    .subzone 392 >> 前往棘齿城

step << Rogue
    .goto 1413/1,-3767.800,-842.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卑鄙的维尼克斯|r交谈
    .turnin 2381 >>交任务：抢劫海盗 << Rogue
    .target 卑鄙的维尼克斯

step << Rogue
    #optional
    .goto 1413/1,-3767.800,-842.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卑鄙的维尼克斯|r交谈
    .turnin 2381 >>交任务：抢劫海盗
    .target 卑鄙的维尼克斯

step
    #label BootyTurnin
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 888 >>交任务：被窃的货物
    .target 加兹鲁维

step
    .goto 1413/1,-3720.300,-920.000
    >>点击|cRXP_PICK_通缉告示|r
    .accept 92706 >>接任务：通缉：布鲁兹
    .group << Rogue/Warrior

step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦伯克·米希瑞克斯|r交谈
    .turnin 865 >>交任务：迅猛龙角
    .accept 1491 >>接任务：智慧饮料
    .target 麦伯克·米希瑞克斯

step
    .goto 1413/1,-3687.11,-981.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_酿酒师德罗恩|r交谈
    .turnin 821 >>交任务：老陈的空酒桶
    .target 酿酒师德罗恩
    .isQuestComplete 821

step << Warrior
    .goto 1413/1,-3680.02,-982.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格拉利克斯|r交谈
    .vendor >>如果有货，向他购买|T134583:0|t[|cRXP_FRIENDLY_粗链短裤|r]
    .target 格拉利克斯
    .money <0.619
    .itemStat 7,ITEM_MOD_ARMOR_SHORT,<155
    .equip 7,4800
    .isQuestTurnedIn 865

step << Rogue/Hunter/Warrior/Shaman/Druid
    .goto 1413/1,-3675.96,-985.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维克斯宾德|r交谈
    .vendor >> 如果有货，向他购买|T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r]
    .target 维克斯宾德
    .money <0.3515
    .itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
    .equip 9,4794
    .isQuestTurnedIn 865

step << Warrior
    #optional
    #completewith FlytoXroads
    +|cRXP_WARN_装备|r|T134583:0|t[|cRXP_FRIENDLY_粗链短裤|r]
    .use 4800
    .itemcount 4800,1
    .itemStat 7,ITEM_MOD_ARMOR_SHORT,<155
    .isQuestTurnedIn 865
    .equip 7,4800

step << Rogue/Hunter/Warrior/Shaman/Druid
    #optional
    #completewith FlytoXroads
    +|cRXP_WARN_装备|r|T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r]
    .use 4794
    .itemcount 4794,1
    .itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
    .isQuestTurnedIn 865
    .xp <20,1
    .equip 9,4794

step
    #loop
    .goto 1413/1,-3911.900,-1049.200
    .goto 1413/1,-3951.600,-1093.500
    .goto 1413/1,-4012.800,-1081.800
    .goto 1413/1,-3973.000,-1028.700
    >>击杀棘齿城附近海中的|cRXP_PICK_布鲁兹|r（20级精英）
    >>|cRXP_WARN_这场战斗很困难！尽量组队完成|r << !Rogue !Warrior
    >>|cRXP_WARN_尝试将他风筝到棘齿城，让守卫协助战斗，但务必由你造成至少50%的伤害！|r
    .complete 92706,1 --Kill Bruuz
    .mob 布鲁兹
    .isOnQuest 92706
    .group << Rogue/Warrior

step
    .goto 1413/1,-3728.66,-835.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 92706 >>交任务：通缉：布鲁兹
    .target 加兹鲁维
    .group << Rogue/Warrior
    .isQuestComplete 92706

step
    .goto 1413/1,-3770.20,-928.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_起重机操作员比戈弗兹|r交谈
    .accept 959 >>接任务：港口的麻烦
    .target 起重机操作员比戈弗兹

step
    #label FlytoXroads
    #completewith XroadsHS2
    .goto 1413/1,-3770.20,-898.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >>飞往十字路口
    .target 布拉高克
    .subzoneskip 380

step << Hunter
    .goto 1413/1,-2595.75,-473.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r交谈
    .accept 6541 >>接任务：向卡德拉克报到
    .target 索克

step
    #label XroadsHS2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_曼科里克|r和|cRXP_FRIENDLY_图加·符文图腾|r交谈
    .turnin 899 >>交任务：复仇的怒火
    .turnin 95774 >>交任务：她的名字叫奥格拉
    .target +曼科里克
    .goto 1413/1,-2641.35,-521.12
    .turnin 880 >>交任务：变异的生物
    .accept 1489 >>接任务：哈缪尔·符文图腾
    .accept 3301 >>接任务：茉拉·符文图腾
    .target +图加·符文图腾
    .goto 1413/1,-2672.76,-544.77

step
    #optional
    #completewith IshamuhaleTurnin
    .destroy 5085 >>|cRXP_WARN_摧毁剩余的|r|T133721:0|t[刺背野猪人的獠牙]|cRXP_WARN_，不再保留|r
    .itemcount 5085,1

step
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r交谈
    .home >>将炉石设为十字路口
    .vendor >>|cRXP_BUY_出售杂物，并按需补充食物和饮水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物，并按需补充食物|r << Rogue/Warrior
    .target 旅店老板伯兰德·草风
    .dungeon DM

step
    .goto 1413/1,-2555.22,-387.350
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科兰|r交谈
    .accept 868 >> 接任务：蝎卵
    .target 科兰

step << Warlock
    #completewith next
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克

step << Warlock
    .goto 1454/1,-4357.36,1850.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_甘鲁尔·血眼|r交谈
    .trainer >> 学习职业技能
    .accept 1507 >>接任务：噬魂者
    .target 甘鲁尔·血眼

step << Warlock
    .goto 1454/1,-4347.4,1836.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈，购买|T133738:0|t[魔典：折磨（等级 2）]
    .collect 16346,1,1507,1 --Grimoire of Torment (Rank 2)
    .target 库古尔

step << Warlock
    .goto 1454/1,-4340.53,1839.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡祖尔|r交谈
    .turnin 1507 >>交任务：噬魂者
    .accept 1508 >>接任务：盲眼卡祖尔
    .target 卡祖尔

step << Warlock
    .goto 1454/1,-4299.99,1820.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_卡提斯|r|cRXP_BUY_交谈，购买|r |T135139:0|t[燃烧魔杖] |cRXP_BUY_。|r
    .collect 5210,1,1507,1 --Collect Burning Wand (1)
    .money <0.5808
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.4
    .target 卡提斯

step << Warlock
    .goto 1454/1,-4199.99,1717.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赞卡沙|r交谈
    .turnin 1508 >>交任务：盲眼卡祖尔
    .accept 1509 >>接任务：多格兰的消息
    .target 赞卡沙

step
    #completewith EnterDM
    .subzone 1581 >> 现在开始寻找死亡矿井队伍
    .dungeon DM

step
    #completewith ZepptoSTVforDM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克
    .dungeon DM

step << Shaman
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8052 >> 学习职业技能
    .target 卡德里斯
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Shaman
    #optional
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r交谈
    .train 2645 >> 学习职业技能
    .target 卡德里斯
    .xp <20,1
    .dungeon DM

step << Hunter
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥玛克|r交谈
    .train 14318 >>学习职业技能
    .target 奥玛克
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Hunter
    #optional
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥玛克|r交谈
    .train 14290 >>学习职业技能
    .target 奥玛克
    .xp <20,1
    .dungeon DM

step << Hunter
    .goto 1454/1,-4610.95,2135.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肖祖|r交谈
    .train 24494 >> 学习宠物技能
    .target 肖祖
    .xp <20,1
    .dungeon DM

step << Warrior
    .goto 1454/1,-4801.42,1980.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格雷兹·怒拳|r交谈
    .train 8198 >>学习职业技能
    .target 格雷兹·怒拳
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Warrior
    #optional
    .goto 1454/1,-4801.42,1980.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格雷兹·怒拳|r交谈
    .train 845 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <20,1
    .dungeon DM

step << Rogue
    .goto 1454/1,-4296.34,1762.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥莫克|r交谈
    .train 1943 >> 学习职业技能
    .target 奥莫克
    .xp <20,1
    .dungeon DM

step << Warlock
    .goto Orgrimmar,47.98,45.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泽弗洛斯特|r交谈
    .train 1014 >> 学习职业技能
    .target 泽弗洛斯特
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Warlock
    #optional
    .goto Orgrimmar,47.98,45.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泽弗洛斯特|r交谈
    .train 706 >> 学习职业技能
    .target 泽弗洛斯特
    .xp <20,1
    .dungeon DM

step << Mage
    .goto 1454/1,-4218.64,1473.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 3140 >> 学习职业技能
    .target 皮菲瑞多
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Mage
    #optional
    .goto 1454/1,-4218.64,1473.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 1953 >> 学习职业技能
    .target 皮菲瑞多
    .xp <20,1
    .dungeon DM

step << Priest
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r交谈
    .train 970 >> 学习职业技能
    .target 乌尔库
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Priest
    #optional
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r交谈
    .train 14914 >> 学习职业技能
    .target 乌尔库
    .xp <20,1
    .dungeon DM

step
    #ah
    .goto 1454/1,-4460.31,1685.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师萨苏恩|r交谈
    >>|cRXP_BUY_购买|r|T132794:0|t[灯油]|cRXP_BUY_，尽量从拍卖行购买|r
    .collect 814,5,103,1 --Flask of Oil (5)
    .target 拍卖师萨苏恩
    .dungeon DM

step
    #completewith next
    .zone Durotar >> 离开奥格瑞玛
    .zoneskip Durotar
    .dungeon DM

step
    #label ZepptoSTVforDM
    .goto 1411/1,-4648.55,1321.88,40 >>登上飞艇塔
    .zone Stranglethorn Vale >>乘飞艇前往荆棘谷
    .zoneskip Stranglethorn Vale
    .dungeon DM

step
    .goto 1434/0,273.91,-12406.71,40,0
    .goto 1434/0,492.15,-12499.03,40,0
    .goto 1434/0,759.53,-12494.77,60,0
    .goto 1434/0,1004.57,-12317.37,60,0
    .goto 1434/0,1178.78,-12166.78,60,0
    .goto 1434/0,1360.0,-11978.74,60,0
    .goto 1436/0,1578.87,-11699.5,60,0
    .goto 1436/0,1718.17,-11480.4,40,0
    .goto 1436/0,1966.32,-11407.13,200 >> 从格罗姆高营地向正西游入暗礁海，然后向北游往西部荒野
    >>|cRXP_WARN_远离岛屿。为安全起见，请沿路径点前进！|r
    .dungeon DM

step
    #completewith next
    .goto 1436/0,1966.32,-11407.13,40 >> 前往西部荒野灯塔
    .dungeon DM

step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 103 >> 接任务：长明的灯塔
    .target 葛瑞森船长
    .itemcount 814,5 -- Flask of Oil (5)
    .dungeon DM

step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r交谈
    .turnin 103 >> 交任务：长明的灯塔
    .itemcount 814,5 -- Flask of Oil (5)
    .target 葛瑞森船长
    .dungeon DM

step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 104 >> 接任务：海岸上的威胁
    .target 葛瑞森船长
    .dungeon DM

step
    .goto 1436/0,1811.62,-11358.37
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀|cRXP_ENEMY_老瞎眼|r，拾取他的|cRXP_LOOT_鳞片|r
    >>|cRXP_ENEMY_老瞎眼|r|cRXP_WARN_沿长滩来回巡逻。如果在长滩没有看到他，就在最南端的|cRXP_ENEMY_鱼人|r营地等待刷新|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan 老瞎眼
    .dungeon DM

step
    .goto 1436/0,1966.32,-11407.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r交谈
    .turnin 104 >> 交任务：海岸上的威胁
    .target 葛瑞森船长
    .dungeon DM

step
    #optional
    .abandon 103 >> 放弃任务：长明的灯塔
    .dungeon DM

step
    #label EnterDM
    .goto 1415/0,1596.2,-11768.97,8,0
    .goto 1415/0,1596.2,-11780.71,8,0
    .goto 1415/0,1606.76,-11797.13,8,0
    .goto 1415/0,1582.12,-11799.48,8,0
    .goto 1415/0,1596.2,-11813.56,15,0
    .goto 1415/0,1631.4,-11846.41,15,0
    .goto 1415/0,1649.0,-11898.04,15,0
    .goto 1415/0,1659.56,-11919.16,15,0
    .goto 1415/0,1698.28,-11891.0,15,0
    .goto 1415/0,1744.04,-11881.61
    .zone 291 >> 进入死亡矿井副本传送门
    .dungeon DM

step
    .hs >> 完成死亡矿井后，炉石返回贫瘠之地
    .zone The Barrens >> 抵达贫瘠之地
    .use 6948
    .dungeon DM

step
    #optional
    .goto 1413/1,-2645.40,-406.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r交谈
    .vendor >>|cRXP_BUY_出售杂物，并按需补充食物和饮水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物，并按需补充食物|r << Rogue/Warrior
    .target 旅店老板伯兰德·草风
    .subzoneskip 380,1
    .dungeon DM

step << Warlock
    #completewith TurninDogran
    .goto 1454/1,-4313.60,1676.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r交谈
    .fly Crossroads >> 飞往十字路口
    .zoneskip Orgrimmar,1
    .target 多拉斯

step << Warlock
    #label TurninDogran
    .goto 1413/1,-2639.32,-436.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r交谈
    .turnin 1509 >>交任务：多格兰的消息
    .accept 1510 >>接任务：多格兰的消息
    .target 加兹罗格

step
    .goto 1413/1,-2589.67,-424.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    >>|cRXP_FRIENDLY_药剂师赫布瑞姆|r|cRXP_WARN_会提供一个限时45分钟的任务|r
    .accept 853 >> 接任务：药剂师扎玛
    .target 药剂师赫布瑞姆
    .isQuestTurnedIn 848
    .isQuestAvailable 853

step
    #sticky
    #completewith ZamahTurnin
    +|cRXP_WARN_你正在做限时任务，请勿暂离。路线会在接取后20-30分钟交还任务|r
    .isOnQuest 853

step
    #completewith TribesTurnin
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Camp Taurajo >> 飞往陶拉祖营地
    .target 迪弗拉克

step
    .goto 1413/1,-2515.7,-2076.41
    >>击杀|cRXP_ENEMY_刺背野猪人|r，拾取一块|T134128:0|t[|cRXP_LOOT_血岩碎片|r]
    .collect 5075,1,5052,1 --Blood Shard (1)
    .mob 刺背寻水者
    .mob 刺背织棘者
    .mob 刺背地卜师

step
    #label TribesTurnin
    .goto 1413/1,-1891.48,-2391.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_碎牙|r交谈
    .turnin 878 >>交任务：野猪人的内战
    .accept 5052 >>接任务：阿迦玛甘的血岩碎片
    .turnin 5052 >>交任务：阿迦玛甘的血岩碎片
    .target 碎牙

step
    #completewith IshamuhaleTurnin
    .goto 1413/1,-1891.48,-2391.93,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_碎牙|r交谈
    +|cRXP_WARN_使用|r|T134128:0|t[|cRXP_LOOT_血岩碎片|r]|cRXP_WARN_换取增益效果。至少保留4块供后续使用|r << Tauren/Shaman/Orc Warrior/Troll Warrior
    +|cRXP_WARN_使用|r|T134128:0|t[|cRXP_LOOT_血岩碎片|r]|cRXP_WARN_换取增益效果。至少保留4块供后续使用|r << !Tauren !Shaman !Warrior/Undead
    +|cRXP_WARN_务必先关闭Questie、Leatrix Plus等插件的自动交还任务功能！|r
    .target 碎牙

step
    .goto 1413/1,-1921.88,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 882 >>交任务：伊沙姆哈尔
    .accept 907 >>接任务：被激怒的雷霆蜥蜴
    .turnin 883 >>交任务：拉克塔曼尼
    .target 乔恩·星眼
    .isOnQuest 883

step
    #label IshamuhaleTurnin
    .goto 1413/1,-1921.88,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 882 >>交任务：伊沙姆哈尔
    .accept 907 >>接任务：被激怒的雷霆蜥蜴
    .target 乔恩·星眼

step
    #completewith SleepingBag1
    >>击杀|cRXP_ENEMY_雷霆蜥蜴|r，拾取它们掉落的|cRXP_LOOT_血液|r
    .complete 907,1 --Thunder Lizard Blood (3)
    .mob 电角蜥蜴
    .mob 雷角蜥蜴

step
    #completewith LizardBlood
    .goto 1413/1,-1899.59,-2624.34,0
    .goto 1413/1,-2016.12,-2650.02,0
    .goto 1413/1,-2400.18,-2398.01,0
    .goto 1413/1,-2363.70,-2537.19,0
    >>击杀|cRXP_ENEMY_奥瓦坦卡|r，拾取|T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]
    >>|cRXP_WARN_使用|T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]接取任务|r
    >>|cRXP_WARN_他有4个刷新点，已在地图上标出|r
    .collect 5102,1,884,1 --Collect Owatanka's Tailspike
    .accept 884 >>接任务：奥瓦坦卡
    .use 5102
    .unitscan 奥瓦坦卡

step
    #label SleepingBag1
    .goto The Barrens,46.361,73.904
    >>点击地上的|cRXP_PICK_焦焚残骸|r
    .accept 79007 >> 接任务：……你所找到的纸条

step
    #label LizardBlood
    #loop
    .goto 1413/1,-1868.18,-2498.00,0
    .goto 1413/1,-1868.18,-2498.00,60,0
    .goto 1413/1,-1861.08,-2561.51,60,0
    .goto 1413/1,-1842.84,-2618.94,60,0
    .goto 1413/1,-1888.44,-2650.690,60,0
    .goto 1413/1,-2004.98,-2683.80,60,0
    .goto 1413/1,-2133.67,-2590.56,60,0
    .goto 1413/1,-2182.31,-2479.76,60,0
    .goto 1413/1,-2232.98,-2478.41,60,0
    .goto 1413/1,-2273.51,-2456.79,60,0
    .goto 1413/1,-2356.60,-2513.54,60,0
    .goto 1413/1,-2428.55,-2517.60,60,0
    .goto 1413/1,-2406.26,-2424.36,60,0
    .goto 1413/1,-2363.70,-2395.98,60,0
    .goto 1413/1,-2253.24,-2345.99,60,0
    >>击杀|cRXP_ENEMY_雷霆蜥蜴|r，拾取它们掉落的|cRXP_LOOT_血液|r
    .complete 907,1 --Thunder Lizard Blood (3)
    .mob 电角蜥蜴
    .mob 雷角蜥蜴

step
    .goto 1413/1,-1921.88,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 884 >>交任务：奥瓦坦卡
    .turnin 907 >>交任务：被激怒的雷霆蜥蜴
    .accept 913 >>接任务：雷鹰的嘶鸣
    .target 乔恩·星眼
    .isOnQuest 884

step
    #label Thunderhawk
    .goto 1413/1,-1921.88,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 907 >>交任务：被激怒的雷霆蜥蜴
    .accept 913 >>接任务：雷鹰的嘶鸣
    .target 乔恩·星眼

step
    #completewith next
    .goto 1413/1,-1899.59,-2624.34,0
    .goto 1413/1,-2016.12,-2650.02,0
    .goto 1413/1,-2400.18,-2398.01,0
    .goto 1413/1,-2363.70,-2537.19,0
    .goto 1413/1,-1899.59,-2624.34,80,0
    .goto 1413/1,-2016.12,-2650.02,80,0
    .goto 1413/1,-2363.70,-2537.19,80,0
    .goto 1413/1,-2400.18,-2398.01,80,0
    >>击杀|cRXP_ENEMY_奥瓦坦卡|r，拾取|T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]
    >>|cRXP_WARN_使用|T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]接取任务|r
    >>|cRXP_WARN_他有4个刷新点，已在地图上标出|r
    .collect 5102,1,884,1 --Collect Owatanka's Tailspike
    .accept 884 >>接任务：奥瓦坦卡
    .use 5102
    .unitscan 奥瓦坦卡

step
    #loop
    .goto 1413/1,-1919.86,-2652.04,0
    .goto 1413/1,-1919.86,-2652.04,60,0
    .goto 1413/1,-2096.18,-2531.11,60,0
    .goto 1413/1,-2341.4,-2352.74,60,0
    .goto 1413/1,-1982.68,-2217.62,60,0
    .goto 1413/1,-1775.96,-2235.86,60,0
    >>击杀一只|cRXP_ENEMY_雷鹰雏鸟|r或|cRXP_ENEMY_雷鹰破云者|r，拾取它掉落的|cRXP_LOOT_雷鹰的翅膀|r
    .complete 913,1 --Thunderhawk Wings (1)
    .mob 雷鹰雏鸟
    .mob 雷鹰破云者

step
    .goto 1413/1,-1921.88,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 884 >>交任务：奥瓦坦卡
    .turnin 913 >>交任务：雷鹰的嘶鸣
    .accept 874 >>接任务：玛伦·星眼
    .accept 6382 >>接任务：灰谷狩猎 << Hunter
    .target 乔恩·星眼
    .isOnQuest 884

step
    #label ThunderhawkTurnin
    .goto 1413/1,-1921.88,-2383.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 913 >>交任务：雷鹰的嘶鸣
    .accept 874 >>接任务：玛伦·星眼
    .accept 6382 >>接任务：灰谷狩猎 << Hunter
    .target 乔恩·星眼

step
    #optional
    .xp 20 >>刷怪升到20级

step << !Tauren !Skyborne
    .goto 1413/1,-1891.48,-2391.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_碎牙|r交谈
    .aura 16618 >> |cRXP_WARN_如果还剩10个|T134128:0|t[|cRXP_LOOT_血岩碎片|r]，就向|cRXP_FRIENDLY_碎牙|r换取|T136022:0|t[风之魂]。|r
    >>|cRXP_WARN_如果已有雷霆崖飞行点，请跳过此步|r
    .itemcount 5075,10
    .target 碎牙
    .train 2645,1 << Shaman --skip if ghost wolf trained
    .train 5118,1 << Hunter --skip if cheetah trained

step << !Tauren !Skyborne
    #completewith next
    .goto 1412/1,-1480.52,-2339.56,120,0
    .zone Mulgore >>前往莫高雷

step << !Tauren !Skyborne
    #completewith DeathDUPpickup
    .goto 1456/1,184.96,-1308.69
    .zone Thunder Bluff >>乘升降机进入雷霆崖
    >>|cRXP_WARN_如果已有雷霆崖飞行点，就飞过去|r

step << Tauren/Skyborne
    #completewith DeathDUPpickup
    .goto 1413/1,-1881.35,-2384.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r交谈
    .fly Thunder Bluff >>飞往雷霆崖
    .target 欧姆萨·雷角
    .zoneskip Thunder Bluff

step << Undead Warrior/Orc Warrior/Troll Warrior/Troll Shaman/Orc Shaman
    .goto 1456/1,89.46,-1286.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安塞瓦|r交谈
    .train 199 >>学习双手锤
    .train 227 >>学习法杖
    .target 安塞瓦

step << Troll Hunter/Orc Hunter/Undead Warrior/Warlock/Priest
    .goto 1456/1,89.46,-1286.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安塞瓦|r交谈
    .train 227 >>学习法杖
    .target 安塞瓦

step << Rogue !Skyborne
    .goto 1456/1,89.46,-1286.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_安塞瓦|r交谈
    .train 198 >>学习单手锤
    .target 安塞瓦

step << Rogue
    .goto 1456/1,110.13,-1299.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_库鲁克|r|cRXP_BUY_交谈，购买|r |T135423:0|t[致命的飞斧] |cRXP_BUY_。|r
    .collect 3137,1,6562,1 --Deadly Throwing Axe (200)
    .target 库鲁克

step << Rogue
    #optional
    .goto 1456/1,104.500,-1308.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴通·阴影图腾|r交谈
    >>|cRXP_WARN_他处于|r|T132320:0|t[潜行]状态
    .train 6761 >>学习职业技能
    .target 巴通·阴影图腾
    .xp <16,1
    .xp >20,1

step << Rogue
    .goto 1456/1,104.500,-1308.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巴通·阴影图腾|r交谈
    >>|cRXP_WARN_他处于|r|T132320:0|t[潜行]状态
    .train 1943 >>学习职业技能
    .target 巴通·阴影图腾
    .xp <20,1

step
    .goto 1456/1,24.85,-1252.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_彻斯姆|r交谈
    .bankdeposit 5075 >> 存入|T134128:0|t[血岩碎片]
    .bankdeposit 5059 >> 存入|T132938:0|t[掘地铲]
    .target 彻斯姆
    .isOnQuest 868

step
    #optional
    .goto 1456/1,24.85,-1252.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_彻斯姆|r交谈
    .bankdeposit 5075 >> 存入|T134128:0|t[血岩碎片]
    .target 彻斯姆
    .isNotOnQuest 868

step
    .goto 1456/1,38.32,-1300.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将炉石设为雷霆崖
    .target 旅店老板帕拉
    .bindlocation 1638
    .isQuestAvailable 6442
    .dungeon !WC

step << Hunter
    #completewith HunterTraining2
    .goto 1456/1,-123.26,-1394.49,60 >> 前往猎人高地

step << Hunter
    .goto 1456/1,-100.50,-1454.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌瑞克·雷角|r交谈
    .train 5118 >> 学习职业技能
    .target 乌瑞克·雷角
    .xp <20,1
    .xp >22,1

step << Hunter
    #label HunterTraining2
    #optional
    .goto 1456/1,-100.50,-1454.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌瑞克·雷角|r交谈
    .train 5118 >> 学习职业技能
    .target 乌瑞克·雷角
    .xp <22,1

step << Hunter
    .goto 1456/1,-47.69,-1434.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫苏瓦·雷角|r交谈
    .train 24494 >> 学习宠物技能
    .target 赫苏瓦·雷角

step << Warrior
    #completewith next
    .goto 1456/1,-123.26,-1394.49,60 >> 前往猎人高地

step << Warrior
    .goto 1456/1,-81.09,-1457.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托姆·狂暴图腾|r交谈
    .train 845 >>学习职业技能
    .accept 1823 >>接任务：和鲁迦交谈
    .target 托姆·狂暴图腾

step
    #completewith next
    .goto 1456/1,222.96,-1079.42,40,0
    .goto 1456/1,219.09,-1051.44,10 >> 前往灵魂高地，进入预见之池

step
    #sticky
    #completewith DeathDUPpickup
    .goto 1456/1,218.68,-1028.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克拉莉斯·弗斯特|r交谈
    .accept 264 >> 接任务：至死方休
    .target 克拉莉斯·弗斯特

step
    .goto 1456/1,278.48,-995.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >> 交任务：药剂师扎玛
    .accept 962 >> 接任务：毒蛇花
    .target 药剂师扎玛
    .isOnQuest 853

step
    #label ZamahTurnin
    #optional
    .goto 1456/1,278.48,-995.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师扎玛|r交谈
    .accept 962 >> 接任务：毒蛇花
    .target 药剂师扎玛

step << Priest
    .goto 1456/1,252.49,-956.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦尔斯·威尔什|r交谈
    .accept 5644 >> 接任务：噬灵瘟疫 << Undead Priest
    .accept 5642 >> 接任务：暗影守卫 << Troll Priest
    .trainer >> 学习职业技能
    .target 麦尔斯·威尔什

step << Mage
    .goto 1456/1,279.32,-950.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大法师山姆|r交谈
    .train 12051 >> 学习职业技能
    .target 大法师山姆
    .xp <20,1
    .xp >22,1

step << Mage
    #optional
    .goto 1456/1,279.32,-950.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大法师山姆|r交谈
    .train 2138 >> 学习职业技能
    .target 大法师山姆
    .xp <22,1

step << Paladin
    .goto 1456/1,253.900,-950.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_充满希望的阿洛丹|r交谈
    .train 1866 >>学习职业技能
    .target 充满希望的阿洛丹
    .xp <20,1
    .xp >22,1

step << Paladin
    #optional
    .goto 1456/1,253.900,-950.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_充满希望的阿洛丹|r交谈
    .train 1026 >>学习职业技能
    .target 充满希望的阿洛丹
    .xp <22,1

step
    #optional
    #label DeathDUPpickup

step << Shaman
    .goto 1456/1,269.92,-980.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_提戈尔·逐星|r |cRXP_WARN_（在外面）|r交谈
    .train 2645 >> 学习职业技能
    .target 提戈尔·逐星
    .xp <20,1
    .xp >22,1

step << Shaman
    #optional
    .goto 1456/1,269.92,-980.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_提戈尔·逐星|r |cRXP_WARN_（在外面）|r交谈
    .train 8498 >> 学习职业技能
    .target 提戈尔·逐星
    .xp <22,1

step << Shaman
    .goto Thunder Bluff,25.21,20.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尼斯·织火|r交谈
    .accept 1529 >>接任务：水之召唤
    .target 萨尼斯·织火
    .isQuestAvailable 1530
    .isNotOnQuest 1528,2985,2986

step
    #completewith next
    .skill firstaid,80 >> |cRXP_WARN_制作|r|T133688:0|t[厚亚麻绷带]|cRXP_WARN_，直到急救技能达到80点或更高|r
    .skill firstaid,<1,1

step
    .goto 1456/1,206.88,-997.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_潘德·缚石|r交谈
    >>|cRXP_WARN_如果没有足够的|r|T132889:0|t[亚麻布]|cRXP_WARN_将技能练到80点，请跳过此步|r
    .train 3277 >> 学习|T133684:0|t[绒线绷带]
    .train 7934 >> 学习|T134437:0|t[抗毒药剂] << Rogue
    .target 潘德·缚石
    .skill firstaid,<1,1

step << Rogue
    >>|cRXP_WARN_制作|r|T134437:0|t[抗毒药剂]|cRXP_WARN_，如果你获得了|r|T134339:0|t[小毒囊]
    >>|cRXP_WARN_保留它们供后续使用|r
    .collect 6452,1 --Anti Venom
    .itemcount 1475,1

step
    #completewith NaraWild
    .goto 1456/1,-212.71,-1065.010,80 >> 前往长者高地

step
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r交谈
    .turnin 5724 >> 交任务：归还背包
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .isOnQuest 5724
    .isQuestComplete 5723

step
    #optional
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r交谈
    .turnin 5724 >> 交任务：归还背包
    .target 拉哈罗
    .isOnQuest 5724

step
    #optional
    #label RFCTurninsTB1
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r交谈
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .isQuestComplete 5723

step
    .goto 1456/1,-303.83,-1048.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈
    .turnin 1489 >> 交任务：哈缪尔·符文图腾
    .accept 1490 >> 接任务：纳拉·蛮鬃
    .target 大德鲁伊哈缪尔·符文图腾

step
    .goto 1456/1,-272.93,-1069.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳拉·蛮鬃|r交谈
    .turnin 1490 >> 交任务：纳拉·蛮鬃
    .accept 914 >> 接任务：尖牙德鲁伊
    .target 纳拉·蛮鬃

step
    #label NaraWild
    .goto 1456/1,-272.93,-1069.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳拉·蛮鬃|r交谈
    .turnin 1490 >> 交任务：纳拉·蛮鬃
    .target 纳拉·蛮鬃

step << Druid
    .goto 1456/1,-281.59,-1039.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图拉克·符文图腾|r交谈
    .trainer >>学习职业技能
    .accept 27 >>接任务：必修的课程
    .accept 98340 >>接任务：巨豹之灵
    .target 图拉克·符文图腾

step << Druid
    #completewith next
    .cast 18960 >>|cRXP_WARN_施放|r|T135758:0|t[传送：月光林地]
    .zoneskip Moonglade

step << Druid
    .goto 1450/1,-2678.76,8019.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 27 >>交任务：必修的课程
    .accept 28 >>接任务：湖中试炼
    .turnin 98340 >>交任务：巨豹之灵
    .accept 98341 >>接任务：驭风巨豹之灵 << Skyborne
    .accept 98405 >>接任务：巨豹之灵 << !Skyborne
    .target 德迪利特·星焰

step << Druid
    #completewith next
    .goto 1450/1,-2634.67,7634.43
    .collect 15877,1,28,1 >>打开湖底的|cRXP_PICK_神殿灵珠容器|r，拾取|T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_抵达灵珠正上方后再潜入水中|r

step << Druid
    .goto 1450/1,-2221.48,7844.89
    .cast 19719 >> |cRXP_WARN_使用|r|T134125:0|t[神殿灵珠]|cRXP_WARN_，在雷姆洛斯神殿完成试炼|r
    .complete 28,1 -- Complete the Trial of the Lake
    .use 15877

step << Druid
    .goto 1450/1,-2224.25,7874.290
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔加里|r交谈
    .turnin 28 >> 交任务：湖中试炼
    .accept 30 >> 接任务：海狮试炼
    .target 塔加里

step << Druid !Skyborne
    .goto 1450/1,-2640.000,7338.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巨豹之灵|r交谈
    .turnin 98405 >>交任务：巨豹之灵
    .accept 98342 >>接任务：巨豹之灵
    .target 巨豹之灵

step << Druid Skyborne
    .goto 1450/1,-2352.700,7375.600,10,0
    .goto 1450/1,-2394.300,7361.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞利楠的化身::272054|r交谈
    .target 塞利楠的化身::272054
    .turnin 98341 >>交任务：驭风巨豹之灵
    .accept 98404 >>接任务：驭风巨豹之灵

step << Druid
    #completewith next
    .goto 1450/1,-3046.700,7534.400
    --aura 1309054?
    .subzone 2363 >> 前往怒风兽穴

step << Druid
    >>深入洞穴，过桥后在壁龛内寻找一座猎豹雕像，点击雕像旁的小球
    >>拾取|cRXP_LOOT_利爪圣物|r
    .goto 1450/1,-3117.400,7455.300
    .complete 98404,2 << Skyborne --|1/1 Relic of the Claw
    .complete 98342,2 << !Skyborne --|1/1 Relic of the Claw

step << Druid
    >>点击猎豹雕像旁的小球
    >>拾取|cRXP_LOOT_静影圣物|r
    .goto 1450/1,-3099.200,7485.700
    .complete 98404,3  << Skyborne --|1/1 Relic of the Silent Shadow
    .complete 98342,3  << !Skyborne --|1/1 Relic of the Silent Shadow

step << Druid
    >>点击猎豹雕像旁的小球
    >>拾取|cRXP_LOOT_尖牙圣物|r
    .goto 1450/1,-3054.100,7476.800
    .complete 98404,1  << Skyborne --|1/1 Relic of the Fang
    .complete 98342,1  << !Skyborne --|1/1 Relic of the Fang

step << Druid !Skyborne
    .goto 1450/1,-2640.000,7338.900
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巨豹之灵|r交谈
    .turnin 98342 >>交任务：巨豹之灵
    .accept 98739 >>接任务：巨豹之灵的祝福
    .target 巨豹之灵

step << Druid Skyborne
    .goto 1450/1,-2395.400,7361.400
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞利楠的化身::272054|r交谈
    .target 塞利楠的化身::272054
    .turnin 98404 >>交任务：驭风巨豹之灵
    .accept 98738 >>接任务：驭风巨豹之灵的祝福

step << Druid
    #completewith next
    .cast 18960 >>|cRXP_WARN_施放|r|T135758:0|t[传送：月光林地]
    .zoneskip Moonglade

step << Druid
    .goto 1450/1,-2678.200,8021.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德迪利特·星焰::11802|r交谈
    .turnin 98738 >>交任务：驭风巨豹之灵的祝福 << Skyborne
    .turnin 98739 >>交任务：巨豹之灵的祝福 << !Skyborne
    .accept 98362 >>接任务：前往雷霆崖
    .target 德迪利特·星焰::11802

step << Druid
    .hs >> 炉石返回雷霆崖
    .use 6948
    .cooldown item,6948,>0
    .bindlocation 1638,1
    .zoneskip Thunder Bluff

step << Druid
    #completewith next
    .goto 1450/1,-2403.61,7785.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑟恩·草风|r交谈
    .fly Thunder Bluff >> 飞往雷霆崖
    .target 布瑟恩·草风
    .zoneskip Thunder Bluff

step << Druid
    .goto 1456/1,-281.59,-1039.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图拉克·符文图腾|r交谈
    .turnin 98362 >>交任务：前往雷霆崖
    .target 图拉克·符文图腾

step << Rogue
    .goto 1456/1,-36.52,-1244.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_卡德·狂暴图腾|r|cRXP_BUY_交谈，购买|r |T135324:0|t[长剑] |cRXP_BUY_。|r
    .collect 923,1,493,1 --Collect Longsword (1)
    .money <0.8743
    .target 卡德·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1

step << Rogue
    #optional
    #completewith ThunderBluffGearEnd
    +|cRXP_WARN_装备|r|T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
    .xp <21,1

step << Warrior/Shaman
    #optional
    #completewith next
    #ah
    +|cRXP_FRIENDLY_如果拍卖行里的绿色武器更便宜，也可以购买|r

step << Warrior
    .goto 1456/1,-38.71,-1255.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_伊图·狂暴图腾|r|cRXP_BUY_交谈，购买|r |T135157:0|t[占卜法杖] |cRXP_BUY_。|r
    .collect 928,1,493,1 --Collect Long Staff (1)
    .money <0.9860
    .target 伊图·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2

step << Warrior
    #optional
    #completewith ThunderBluffGearEnd
    +|cRXP_WARN_装备|r|T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1

step << Shaman
    .goto 1456/1,-38.71,-1255.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_伊图·狂暴图腾|r|cRXP_BUY_交谈，购买|r |T135157:0|t[占卜法杖] |cRXP_BUY_。|r
    .collect 928,1,493,1 --Collect Long Staff (1)
    .money <0.9860
    .target 伊图·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2

step << Shaman
    #optional
    #completewith ThunderBluffGearEnd
    +|cRXP_WARN_装备|r|T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <21,1

step << Hunter
    .goto 1456/1,26.31,-1167.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_库纳·雷角|r|cRXP_BUY_交谈，购买|r |T135489:0|t[重型弯弓] |cRXP_BUY_。|r
    .collect 3027,1,493,1 --Collect Heavy Recurve Bow (1)
    .money <0.5643
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.1
    .target 库纳·雷角

step << Hunter
    #completewith ThunderBluffGearEnd
    #optional
    +|cRXP_WARN_装备|r|T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.1
    .xp <20,1

step << Hunter
    .goto 1456/1,26.31,-1167.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_库纳·雷角|r交谈
    >>|cRXP_BUY_购买|r|T132382:0|t[锋利的箭]|cRXP_BUY_，向她补充弹药|r
    .collect 2515,1600,493,1 << Hunter --Sharp Arrow (1600)
    .target 库纳·雷角

step
    #label ThunderBluffGearEnd
    #completewith next
    .goto 1456/1,26.1,-1196.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r交谈
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .zoneskip The Barrens

step
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 851 >>交任务：狂热的维罗戈
    .accept 852 >>接任务：赫兹鲁尔·血印
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #label Leaders
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 851 >>交任务：狂热的维罗戈
    .accept 852 >>接任务：赫兹鲁尔·血印
    .target 雷戈萨·死门

step << Warlock
    #label EnterSTM2
    #completewith DogranNews
    .zone Stonetalon Mountains >> 前往石爪山脉
    .zoneskip Stonetalon Mountains

step << Warlock
    #completewith DogranNews
    .goto 1442/1,-786.33,-294.97,60,0
    .goto 1442/1,-665.72,-280.97,40,0
    .goto 1442/1,-522.63,-294.32,40 >> 沿左侧小路向上走

step << Warlock
    #label DogranNews
    .goto 1442/1,-331.21,-181.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯兹格拉|r交谈
    .turnin 1510 >>交任务：多格兰的消息
    .accept 1511 >>接任务：肯兹格拉的伤药
    .target 肯兹格拉
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 无限 升级指南（含副本，部落）
#subgroupdisplayname 1-22
#forever
<< Horde
#name 21-22 Wailing Caverns
#next RestedXP Horde 22-30\22-24 Hillsbrad
#version 11
#group RestedXP Forever Dungeon Guide (H)
#subgroup Dungeon Guide 1-22
--#groupid RXP-SRGCE-H1
#displayname 21-22 哀嚎洞穴

step
    #sticky
    #completewith EnterWC
    .goto 1414/1,-2216.5,-742.43,30 >>现在可以开始寻找哀嚎洞穴队伍

step << Warlock
    #completewith EnterWC
    .zone The Barrens >>跑回贫瘠之地

step
    #completewith EnterWC
    .subzone 387 >> 前往甜水绿洲
    .isQuestTurnedIn 851

step
    #loop
    #label Hezrul
    .goto 1413/1,-2001.94,-965.69,0
    .goto 1413/1,-2001.94,-965.69,50,0
    .goto 1413/1,-2022.20,-945.42,50,0
    .goto 1413/1,-2016.12,-915.01,50,0
    .goto 1413/1,-2033.35,-894.74,50,0
    .goto 1413/1,-2031.32,-881.23,50,0
    .goto 1413/1,-2052.60,-877.18,50,0
    .goto 1413/1,-2057.67,-879.21,50,0
    .goto 1413/1,-2066.79,-877.85,50,0
    .goto 1413/1,-2085.03,-898.80,50,0
    .goto 1413/1,-2097.19,-908.26,50,0
    .goto 1413/1,-2102.26,-950.15,50,0
    .goto 1413/1,-2114.42,-981.22,50,0
    .goto 1413/1,-2167.11,-1021.09,50,0
    .goto 1413/1,-2187.38,-1040.68,50,0
    .goto 1413/1,-2261.35,-1060.95,50,0
    .goto 1413/1,-2281.62,-1061.62,50,0
    .goto 1413/1,-2301.88,-1056.89,50,0
    .goto 1413/1,-2295.80,-1087.30,50,0
    .goto 1413/1,-2299.86,-1125.13,50,0
    .goto 1413/1,-2268.44,-1145.40,50,0
    .goto 1413/1,-2247.16,-1145.40,50,0
    .goto 1413/1,-2226.90,-1166.35,50,0
    .goto 1413/1,-2189.40,-1179.86,50,0
    .goto 1413/1,-2174.20,-1198.78,50,0
    .goto 1413/1,-2162.04,-1200.80,50,0
    .goto 1413/1,-2124.55,-1228.50,50,0
    .goto 1413/1,-2095.16,-1220.40,50,0
    .goto 1413/1,-2065.78,-1208.91,50,0
    .goto 1413/1,-2041.46,-1167.70,50,0
    .goto 1413/1,-2024.23,-1179.18,50,0
    .goto 1413/1,-2047.54,-1156.21,50,0
    .goto 1413/1,-2046.52,-1135.94,50,0
    .goto 1413/1,-2009.03,-1127.84,50,0
    .goto 1413/1,-2001.94,-965.69,50,0
    >>找到并击杀|cRXP_ENEMY_赫兹鲁尔·血印|r，拾取掉落的|cRXP_LOOT_赫兹鲁尔的头颅|r
    >>|cRXP_ENEMY_赫兹鲁尔·血印|r|cRXP_WARN_在湖泊周围巡逻|r
    .complete 852,1 --Hezrul's Head
    .unitscan 赫兹鲁尔·血印
    .isQuestTurnedIn 851

step
    #completewith next
    .goto 1413/1,-2134.68,-764.35,0
    .goto 1413/1,-2134.68,-764.35,30,0
    .goto 1413/1,-2122.52,-734.62,20,0
    .goto 1414/1,-2061.94,-781.68,20,0
    .goto 1414/1,-2028.82,-828.29,10,0
    .goto 1414/1,-2021.46,-816.030,10 >>从哀嚎洞穴集合石处沿山路上山
    >>|cRXP_WARN_紧跟箭头，前往隐藏的洞穴|r

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    >>|cRXP_WARN_他们位于哀嚎洞穴入口上方|r
    .accept 1486 >> 接任务：变异皮革
    .target +纳尔帕克
    .goto 1414/1,-2036.18,-796.40
    .accept 1487 >> 接任务：清除变异者
    .target +厄布鲁
    .goto 1414/1,-2039.86,-801.31

step
    #completewith EnterWC
    +|cRXP_WARN_如果只打1次副本，建议分配好“毒蛇花”和“变异皮革”任务的收集物品|r
    >>|cRXP_WARN_副本里的|cRXP_PICK_毒蛇花|r和|cRXP_LOOT_变异皮革|r不够所有人完成任务|r
    .isOnQuest 962,1486

step
    #optional
    #completewith EnterWC
    >>拾取地面上的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_，在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962

step
    #completewith EnterWC
    >>拾取地面上的 |cRXP_PICK_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962

step
    #completewith EnterWC
    >>击杀沿途所有|cRXP_ENEMY_变异野兽|r，拾取它们掉落的|cRXP_LOOT_变异皮革|r
    >>|cRXP_WARN_如果只打1次副本，建议最多由3名玩家尝试完成此任务。副本里的|r|cRXP_LOOT_变异皮革|r|cRXP_WARN_不够所有人完成任务|r
    .complete 1486,1 --Deviate Hide (20)
    .isOnQuest 1486
    --Too many .mobs, would clutter target box

step
    #completewith EnterWC
    >>击杀|cRXP_ENEMY_软浆怪|r，拾取它们掉落的|cRXP_LOOT_哀嚎香精|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491

step
    #label MadMagg
    #loop
    .goto 1414/1,-2058.26,-749.79,0
    .goto 1414/1,-2003.06,-659.01,0
    .goto 1414/1,-2072.98,-698.27,0
    .goto 1414/1,-2124.50,-730.16,0
    .goto 1414/1,-2058.26,-749.79,30,0
    .goto 1414/1,-2003.06,-659.01,30,0
    .goto 1414/1,-2072.98,-698.27,30,0
    .goto 1414/1,-2124.50,-730.16,30,0
    >>击杀|cRXP_ENEMY_疯狂的马格利什|r，拾取他掉落的|cRXP_LOOT_99年波尔多陈酿|r
    >>|cRXP_WARN_他的刷新时间很长。如果找不到他，就跳过此步骤|r
    .complete 959,1 --99-Year-Old Port (1)
    .mob 疯狂的马格利什
    .isOnQuest 959

step
    #label EnterWC
    .goto 1414/1,-2028.82,-636.93,20,0
    .goto 1414/1,-2050.90,-585.41,20,0
    .goto 1414/1,-2168.66,-607.49,30,0
    .goto 1414/1,-2216.5,-742.43,30 >> 穿过传送门，进入哀嚎洞穴副本

step
    #optional
    #completewith GlowingShard
    >>拾取地面上的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打1次副本，建议最多由3名玩家尝试完成此任务。副本里的|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人完成任务|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_，在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962

step
    #optional
    #completewith GlowingShard
    >>拾取地面上的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打1次副本，建议最多由3名玩家尝试完成此任务。副本里的|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人完成任务|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962

step
    #optional
    #completewith GlowingShard
    >>击杀|cRXP_ENEMY_软浆怪|r，拾取它们掉落的|cRXP_LOOT_哀嚎香精|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491

step
    #completewith GlowingShard
    >>击杀 |cRXP_ENEMY_变异破坏者|r, |cRXP_ENEMY_剧毒飞蛇|r, |cRXP_ENEMY_变异蹒跚者|r 和 |cRXP_ENEMY_变异尖牙风蛇|r
    .complete 1487,1 --Deviate Ravager (7)
    .mob +变异破坏者
    .complete 1487,2 --Deviate Viper (7)
    .mob +剧毒飞蛇
    .complete 1487,3 --Deviate Shambler (7)
    .mob +变异蹒跚者
    .complete 1487,4 --Deviate Dreadfang (7)
    .mob +变异尖牙风蛇
    .complete 1486,1 --Deviate Hide (20)
    .isOnQuest 1487

step
    #label Gems
    >>击杀 |cRXP_ENEMY_考布莱恩|r、|cRXP_ENEMY_安娜科德拉|r、|cRXP_ENEMY_皮萨斯|r 和 |cRXP_ENEMY_瑟芬迪斯|r，搜刮 |cRXP_LOOT_宝石|r
    .complete 914,1 --Gem of Cobrahn (1)
    .mob +考布莱恩
    .complete 914,2 --Gem of Anacondra (1)
    .mob +安娜科德拉
    .complete 914,3 --Gem of Pythas (1)
    .mob +皮萨斯
    .complete 914,4 --Gem of Serpentis (1)
    .mob +瑟芬迪斯
    .isOnQuest 914

step
    #requires Gems
    #completewith next
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与哀嚎洞穴入口处的 |cRXP_FRIENDLY_纳拉雷克斯的信徒|r 交谈, 护送他安全抵达 |cRXP_FRIENDLY_纳拉雷克斯|r 处
    .target 纳拉雷克斯的信徒
    .skipgossip

step
    #label GlowingShard
    >>抵达 |cRXP_FRIENDLY_纳拉雷克斯|r 处后，会先遭到两波敌人攻击，最后由 |cRXP_ENEMY_吞噬者穆坦努斯|r 发起攻击
    >>击杀它，拾取 |T135229:0|t[|cRXP_LOOT_发光的碎片|r]，使用碎片开始任务
    .collect 10441,1 --Collect Glowing Shard (x1)
    .accept 6981 >> 接任务：发光的碎片
    .use 10441
    .mob 吞噬者穆坦努斯

step
    #optional
    #completewith DeviateRaptors
    >>击杀|cRXP_ENEMY_软浆怪|r，拾取它们掉落的|cRXP_LOOT_哀嚎香精|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491

step
    #optional
    #completewith Ectoplasms
    >>拾取地面上的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_，在小地图上显示草药位置|r
    >> |cRXP_WARN_击杀最终首领后，大部分|cRXP_PICK_毒蛇花|r应该已经刷新！|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962

step
    #optional
    #completewith Ectoplasms
    >>拾取地面上的 |cRXP_PICK_毒蛇花|r
    >> |cRXP_WARN_击杀最终首领后，大部分|cRXP_PICK_毒蛇花|r应该已经刷新！|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962

step
    #optional
    >> 击杀|cRXP_ENEMY_变异破坏者|r、|cRXP_ENEMY_剧毒飞蛇|r、|cRXP_ENEMY_变异蹒跚者|r和|cRXP_ENEMY_变异尖牙风蛇|r，拾取它们的|cRXP_ENEMY_兽皮|r。
    .complete 1487,1 --Deviate Ravager (7)
    .mob +变异破坏者
    .complete 1487,2 --Deviate Viper (7)
    .mob +剧毒飞蛇
    .complete 1487,3 --Deviate Shambler (7)
    .mob +变异蹒跚者
    .complete 1487,4 --Deviate Dreadfang (7)
    .mob +变异尖牙风蛇
    .complete 1486,1 --Deviate Hide (20)
    .disablecheckbox
    .isOnQuest 1487
    .isOnQuest 1486

step
    >>击杀 |cRXP_ENEMY_变异破坏者|r, |cRXP_ENEMY_剧毒飞蛇|r, |cRXP_ENEMY_变异蹒跚者|r 和 |cRXP_ENEMY_变异尖牙风蛇|r
    .complete 1487,1 --Deviate Ravager (7)
    .mob +变异破坏者
    .complete 1487,2 --Deviate Viper (7)
    .mob +剧毒飞蛇
    .complete 1487,3 --Deviate Shambler (7)
    .mob +变异蹒跚者
    .complete 1487,4 --Deviate Dreadfang (7)
    .mob +变异尖牙风蛇
    .isOnQuest 1487

step
    #label DeviateRaptors
    >>击杀 |cRXP_ENEMY_变异野兽|r，拾取它们掉落的 |cRXP_LOOT_变异皮革|r
    .complete 1486,1 --Deviate Hide (20)
    .mob 变异破坏者
    .mob 剧毒飞蛇
    .mob 变异蹒跚者
    .mob 变异尖牙风蛇
    .isOnQuest 1486

step
    #label Ectoplasms
    >>击杀|cRXP_ENEMY_软浆怪|r，拾取它们掉落的|cRXP_LOOT_哀嚎香精|r
    .complete 1491,1 --Wailing Essence (6)
    .mob 吞噬软浆怪
    .mob 大型软浆怪
    .mob 噩梦软浆怪
    .isOnQuest 1491

step
    #optional
    >>拾取地面上的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打1次副本，建议最多由3名玩家尝试完成此任务。副本里的|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人完成任务|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_，在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962

step
    >>拾取地面上的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打1次副本，建议最多由3名玩家尝试完成此任务。副本里的|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人完成任务|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962

step
    #completewith GShard
    .subzone 380 >>在哀嚎洞穴副本内离开队伍，1分钟后即可被传送至十字路口墓地
    .subzoneskip 392

step
    #completewith Cholaruk
    >>|cRXP_WARN_询问队友是否要做“噬灭者乔拉鲁克”任务|r（20级精英）
    .isQuestAvailable 97003

step
    .goto 1413/1,-2711.800,-350.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古尔阿克::267310|r交谈
    .accept 97003 >>接任务：噬灭者乔拉鲁克
    .target 古尔阿克::267310

step
    #completewith next
    .goto 1413/1,-3257.300,-113.100,15,0
    .goto 1413/1,-3217.100,-147.700,10,0
    .goto 1413/1,-3236.000,-178.100,10,0
    .goto 1413/1,-3259.700,-205.400,10,0
    .goto 1413/1,-3226.900,-237.900,10 >>前往洞穴深处，找到|cRXP_ENEMY_噬灭者乔拉鲁克|r

step
    #label Cholaruk
    .goto 1413/1,-3206.800,-220.200
    >>击杀|cRXP_ENEMY_噬灭者乔拉鲁克|r，拾取他掉落的|cRXP_LOOT_头颅|r
    .complete 97003,1 --Chol'aruk's Head (x1)
    .mob 乔拉鲁克::267307
    .isOnQuest 97003

step
    #completewith GShard
    .subzone 392 >>前往棘齿城
    .subzoneskip 1699,1 --Thorn Hill

step
    #completewith GShard
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Ratchet >> 飞往棘齿城
    .target 迪弗拉克
    .subzoneskip 392
    .subzoneskip 1699 --Thorn Hill

step
    .goto 1413/1,-3697.24,-929.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦伯克|r交谈
    .turnin 1491 >>交任务：智慧饮料
    .accept 1221 >> 接任务：蓝叶薯
    .target 麦伯克·米希瑞克斯
    .isQuestComplete 1491

step
    #optional
    .goto The Barrens,62.370,37.615
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦伯克|r交谈
    .accept 1221 >> 接任务：蓝叶薯
    .target 麦伯克·米希瑞克斯

step
    .goto 1413/1,-3770.20,-928.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比戈弗兹|r交谈
    .turnin 959 >> 交任务：港口的麻烦
    .target 起重机操作员比戈弗兹
    .isQuestComplete 959

step
    #label GShard
    .goto 1413/1,-3760.07,-902.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .complete 6981,1 --Speak with someone in Ratchet about the Glowing Shard
    .skipgossip
    .target 斯布特瓦夫
    .isOnQuest 6981

step << Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_水之先知伊斯伦|r 和 |cRXP_FRIENDLY_玛伦·星眼|r 交谈
    .turnin 1529 >>交任务：水之召唤
    .accept 1530 >>接任务：水之召唤
    .target +水之先知伊斯伦
    .goto The Barrens,65.83,43.78
    .turnin 874 >>交任务：玛伦·星眼
    .accept 873 >>接任务：依沙瓦克
    .target +玛伦·星眼
    .goto The Barrens,65.83,43.86
    .isOnQuest 1529

step << Shaman
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_水之先知伊斯伦|r 和 |cRXP_FRIENDLY_玛伦·星眼|r 交谈
    .turnin 1528 >>交任务：水之召唤
    .accept 1530 >>接任务：水之召唤
    .target +水之先知伊斯伦
    .goto The Barrens,65.83,43.78
    .turnin 874 >>交任务：玛伦·星眼
    .accept 873 >>接任务：依沙瓦克
    .target +玛伦·星眼
    .goto The Barrens,65.83,43.86
    .isOnQuest 1528

step << Shaman
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_水之先知伊斯伦|r 和 |cRXP_FRIENDLY_玛伦·星眼|r 交谈
    .accept 1530 >>接任务：水之召唤
    .target +水之先知伊斯伦
    .goto The Barrens,65.83,43.78
    .turnin 874 >>交任务：玛伦·星眼
    .accept 873 >>接任务：依沙瓦克
    .target +玛伦·星眼
    .goto The Barrens,65.83,43.86
    .isQuestTurnedIn 1529

step << Shaman
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_水之先知伊斯伦|r 和 |cRXP_FRIENDLY_玛伦·星眼|r 交谈
    .accept 1530 >>接任务：水之召唤
    .target +水之先知伊斯伦
    .goto The Barrens,65.83,43.78
    .turnin 874 >>交任务：玛伦·星眼
    .accept 873 >>接任务：依沙瓦克
    .target +玛伦·星眼
    .goto The Barrens,65.83,43.86
    .isQuestTurnedIn 1528

step
    #optional << Shaman
    .goto 1413/1,-4048.87,-1350.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛伦|r交谈
    .turnin 874 >>交任务：玛伦·星眼
    .accept 873 >>接任务：依沙瓦克
    .target 玛伦·星眼
    .isOnQuest 874

step
    #optional
    .goto 1413/1,-4048.87,-1350.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛伦|r交谈
    .accept 873 >>接任务：依沙瓦克
    .target 玛伦·星眼
    .isQuestTurnedIn 874

step
    #loop
    .goto 1413/1,-4031.64,-1537.94,0
    .goto 1413/1,-3937.4,-1789.27,0
    .goto 1413/1,-3821.88,-2004.8,0
    .goto 1413/1,-4041.78,-1446.73,50,0
    .goto 1413/1,-4031.64,-1537.94,50,0
    .goto 1413/1,-3937.4,-1789.27,50,0
    .goto 1413/1,-3821.88,-2004.8,50,0
    >>击杀|cRXP_ENEMY_依沙瓦克|r，拾取它掉落的|cRXP_LOOT_依沙瓦克的心脏|r
    >>|cRXP_WARN_它在海岸沿线有四个不同的刷新点|r
    .complete 873,1 --Heart of Isha Awak
    .unitscan 依沙瓦克
    .isQuestTurnedIn 874

step
    .goto 1413/1,-4048.87,-1350.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛伦|r交谈
    .turnin 873 >> 交任务：依沙瓦克
    .target 玛伦·星眼
    .isQuestComplete 873

step
    #completewith TopofWCturnins
    .goto 1413/1,-3770.20,-898.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 380

step
    .goto 1413/1,-2711.800,-350.500
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_古尔阿克::267310|r交谈
    .turnin 97003 >>交任务：噬灭者乔拉鲁克
    .target 古尔阿克::267310
    .isQuestComplete 97003

step
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨|r交谈
    .turnin 852 >>交任务：赫兹鲁尔·血印
    .target 雷戈萨·死门
    .isQuestComplete 852

step
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨|r交谈
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #completewith CounterattackTurnin2
    +|cRXP_WARN_下一个任务非常困难，建议组队。你可以风筝 |cRXP_ENEMY_督军克罗姆扎|r，利用任务给予者所在的建筑绕圈风筝|r

step
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨|r交谈
    .accept 4021 >>接任务：人马无双！
    .target 雷戈萨·死门
    --.timer 183,Warlord Krom'zar Spawn
    .isQuestTurnedIn 852
    --timer is random, generally somewhere between 120-210 seconds

step
    .goto 1413/1,-1884.39,-289.38
    >>击杀出现的|cRXP_ENEMY_督军克罗姆扎|r，拾取他掉在地上的|cRXP_PICK_旗帜|r
    >>|cRXP_WARN_小心！他是强力精英，至少有两只|r|cRXP_ENEMY_科卡尔|r|cRXP_WARN_怪物守卫|r
    >>|cRXP_WARN_他最长可能需要3分钟才会刷新|r
    .complete 4021,1 --Piece of Krom'zar's Banner (1)
    .unitscan 督军克罗姆扎
    .isQuestTurnedIn 852

step
    #label CounterattackTurnin2
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨|r交谈
    .turnin 4021 >>交任务：人马无双！
    .target 雷戈萨·死门
    .isQuestComplete 4021

step
    .goto 1413/1,-1972.55,-306.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨|r交谈
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #optional
    #completewith TopofWCturnins
    .abandon 855 >>放弃任务：半人马护腕

step
    #completewith next
    .goto 1413/1,-2493.40,-708.95,20,0
    .goto 1413/1,-2404.23,-721.11,20,0
    .goto 1413/1,-2356.60,-685.98,20,0
    .goto 1413/1,-2259.32,-602.20,50 >> 沿路上山

step
    .goto 1413/1,-2259.32,-602.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲拉|r交谈
    .turnin 6981 >> 交任务：发光的碎片
    .accept 3369 >> 接任务：在噩梦中
    .target 菲拉·古风
    .isOnQuest 6981

step
    .goto 1413/1,-2259.32,-602.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲拉|r交谈
    .accept 3369 >> 接任务：在噩梦中
    .target 菲拉·古风
    .isQuestTurnedIn 6981

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    >>|cRXP_WARN_他们位于哀嚎洞穴入口上方|r
    .turnin 1486 >> 交任务：变异皮革
    .target +纳尔帕克
    .goto 1414/1,-2036.18,-796.40
    .turnin 1487 >> 交任务：清除变异者
    .target +厄布鲁
    .goto 1414/1,-2039.86,-801.31
    .isQuestComplete 1487
    .isQuestComplete 1486

step
    #optional
    .goto 1414/1,-2039.86,-801.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄布鲁|r交谈
    >>|cRXP_WARN_他位于哀嚎洞穴入口上方|r
    .turnin 1487 >> 交任务：清除变异者
    .target 厄布鲁
    .isQuestComplete 1487

step
    #optional
    #label TopofWCturnins
    .goto 1414/1,-2036.18,-796.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r交谈
    >>|cRXP_WARN_他位于哀嚎洞穴入口上方|r
    .turnin 1486 >> 交任务：变异皮革
    .target 纳尔帕克
    .isQuestComplete 1486

step
    #completewith WCEnd
    .hs >> 使用炉石返回雷霆崖
    .bindlocation 1638,1
    .zoneskip Thunder Bluff
    .use 6948

step
    #completewith WCEnd
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往十字路口，与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Thunder Bluff >>乘航班前往雷霆崖
    .target 迪弗拉克
    .zoneskip Thunder Bluff

step
    .goto 1456/1,-272.93,-1069.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉|r交谈
    .turnin 914 >>交任务：尖牙德鲁伊
    .target 纳拉·蛮鬃
    .isQuestComplete 914

step
    .goto 1456/1,-303.83,-1048.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈缪尔|r交谈
    .turnin 3369 >> 交任务：在噩梦中
    .target 大德鲁伊哈缪尔·符文图腾
    .isOnQuest 3369

step
    #completewith next
    .goto 1456/1,219.09,-1051.44,10 >> 前往灵魂高地，进入预见之池
    .isQuestComplete 962

step
    #label WCEnd
    .goto 1456/1,276.6,-996.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 962 >>交任务：毒蛇花
    .target 药剂师扎玛
    .isQuestComplete 962

step << Paladin
    #optional
    .goto 1456/1,253.900,-950.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_充满希望的阿洛丹|r交谈
    .train 1866 >>学习职业技能
    .target 充满希望的阿洛丹
    .xp <20,1
    .xp >22,1

step << Paladin
    .goto 1456/1,253.900,-950.200
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_充满希望的阿洛丹|r交谈
    .train 1026 >>学习职业技能
    .target 充满希望的阿洛丹
    .xp <22,1

step
    #optional
    .abandon 1486 >>放弃任务：变异皮革

step
    #optional
    .abandon 1487 >>放弃任务：清除变异者

step
    #optional
    .abandon 1491 >>放弃任务：智慧饮料

step
    #optional
    .abandon 959 >>放弃任务：港口的麻烦

step
    #optional
    .abandon 914 >>放弃任务：尖牙德鲁伊

step
    #optional
    .abandon 962 >>放弃任务：毒蛇花

step << Warlock/Shaman
    .goto 1456/1,26.1,-1196.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .fly Camp Taurajo >>飞往陶拉祖营地
    .target 塔尔
    .zoneskip The Barrens

step << Warlock
    .goto 1413/1,-1898.58,-2391.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_劳格玛|r交谈
    .turnin 1511 >>交任务：肯兹格拉的伤药
    .accept 1515 >>接任务：多格兰之囚
    .target 步兵劳格玛

step << Warlock
    .goto 1413/1,-1765.83,-1622.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多格兰|r交谈
    .turnin 1515 >>交任务：多格兰之囚
    .accept 1512 >>接任务：爱的礼物
    .target 步兵多格兰

step << Shaman
    #completewith CallofWater2
    .goto 1413/1,-1776.98,-3617.51,60>> 向南前往 |cRXP_FRIENDLY_布瑞恩|r

step << Shaman
    #label CallofWater2
    .goto 1413/1,-1776.98,-3617.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞恩|r交谈
    .turnin 1530 >>交任务：水之召唤
    .accept 1535 >>接任务：水之召唤
    .target 布瑞恩

step << Warlock/Shaman
    #completewith next
    .subzone 378 >>返回陶拉祖营地

step << Warlock/Shaman
    .goto 1413/1,-1881.35,-2384.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧姆萨|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .target 欧姆萨·雷角
    .zoneskip Orgrimmar

step << !Warlock
    .goto 1456/1,26.1,-1196.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .target 塔尔
    .zoneskip Orgrimmar

step << Warlock
    .goto 1454/1,-4357.36,1850.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甘鲁尔|r交谈
    .turnin 1512 >>交任务：爱的礼物
    .accept 1513 >>接任务：誓缚
    .target 甘鲁尔·血眼

step << Warlock
    #completewith next
    .cast 9224 >>|cRXP_WARN_使用|r |T133290:0|t[多格兰的坠饰]|cRXP_WARN_（在召唤法阵中）|r
    .use 6626

step << Warlock
    .goto 1454/1,-4377.13,1804.77
    >>击杀|cRXP_ENEMY_被召唤的魅魔|r
    .complete 1513,1 --Kill Summoned Succubus (1)
    .mob 魅魔
    .use 6626

step << Warlock
    .goto 1454/1,-4357.36,1850.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甘鲁尔|r交谈
    .turnin 1513 >>交任务：誓缚
    .target 甘鲁尔·血眼

step << Warlock
    .goto 1454/1,-4362.55,1834.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
    .train 6202 >> 学习职业技能
    .target 米尔科特
    .xp <22,1
    .xp >24,1

step << Warlock
    #optional
    .goto 1454/1,-4362.55,1834.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
    .train 6223 >> 学习职业技能
    .target 米尔科特
    .xp <24,1

step << Rogue
    #completewith next
    .goto 1454/1,-4320.75,1750.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡雷斯|r|cRXP_BUY_交谈，购买一把|r|T135640:0|t[双刃弯刀]|cRXP_BUY_（如果你还没有匕首）|r
    .collect 2207,1 --Collect Jambiya (1)
    .target 卡雷斯

step << Rogue
    .goto 1454/1,-4284.42,1771.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_申苏尔|r交谈
    .train 921 >>学习 |T133644:0|t[搜索]
    .train 8676 >>学习 |T132282:0|t[伏击]
    .train 1943 >>学习 |T132302:0|t[割裂]
    .train 1856 >>学习 |T132331:0|t[消失]
    .train 1725 >>学习 |T132289:0|t[扰乱]
    .train 1785 >>学习 |T132320:0|t[潜行（等级 2）]
    .accept 2460 >>接任务：碎手军礼
    .target 申苏尔

step << Rogue
    .goto 1454/1,-4284.42,1771.28
    >>等|cRXP_FRIENDLY_申苏尔|r行完军礼后，选中他并输入 /Salute
    .complete 2460,1 --Shattered Salute Performed (1)
    .target 申苏尔

step << Rogue
    .goto 1454/1,-4284.42,1771.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_申苏尔|r交谈
    .turnin 2460 >>交任务：碎手军礼
    .accept 2458 >>接任务：卧底密探
    .target 申苏尔

step << Rogue
    .goto 1454/1,-4271.1,1810.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔|r|cRXP_BUY_交谈，并向他购买|r |T133849:0|t[蚀骨灰]|cRXP_BUY_、|r|T132793:0|t[空瓶]|cRXP_BUY_和|r|T134387:0|t[闪光粉]|cRXP_BUY_。|r
    .collect 2928,40,2479,1 --Collect Dust of Decay (40)
    .collect 3371,40,2479,1 --Collect Empty Vial (40)
    .collect 5140,20,2479,1 --Collect Flash Powder (20)
    .target 雷库尔

step << Priest/Warlock
    .goto 1454/1,-4299.99,1820.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡提斯|r|cRXP_BUY_交谈，并购买|r |T135139:0|t[燃烧魔杖]|cRXP_BUY_（由她出售）|r
    .collect 5210,1,1507,1 --Collect Burning Wand (1)
    .money <0.5808
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.4
    .target 卡提斯

step << Mage
    .goto 1454/1,-4218.64,1473.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 2138 >> 学习职业技能
    .target 皮菲瑞多
    .xp <22,1
    .xp >24,1

step << Mage
    #optional
    .goto 1454/1,-4218.64,1473.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 2121 >> 学习职业技能
    .target 皮菲瑞多
    .xp <24,1

step << Mage
    .goto 1454/1,-4222.85,1474.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索乌|r交谈，他位于小屋顶层
    .train 3567 >> 学习 |T135759:0|t[传送：奥格瑞玛]
    .target 索乌

step << Troll Priest
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔库|r交谈
    .turnin 5642 >> 交任务：暗影守卫
    .trainer >> 学习职业技能
    .target 乌尔库

step << Undead Priest
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔库|r交谈
    .train 8103 >> 学习职业技能
    .target 乌尔库
    .xp <22,1
    .xp >24,1

step << Undead Priest
    #optional
    .goto 1454/1,-4179.79,1452.580
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔库|r交谈
    .train 3747 >> 学习职业技能
    .target 乌尔库
    .xp <24,1

step << Rogue/Druid
    #completewith MissionProbable
    .goto 1454/1,-4048.36,1697.85,80,0
    .goto 1454/1,-3900.25,1681.48,30,0
    .goto 1454/1,-3933.49,1707.86,50 >> 从西侧出口进入贫瘠之地
    .zoneskip The Barrens

step << Rogue/Druid
    #completewith MissionProbable
    .goto 1413/1,-3216.92,1107.13,120 >> 前往淤泥沼泽

step << Druid
    .goto 1413/1,-3119.64,1050.38
    >>在水中拾取|cRXP_PICK_奇怪的锁箱|r，获得 |T133443:0|t[水兽敏捷坠饰]
    .collect 15883,1,31,1 --Half Pendant of Aquatic Agility (1)

step << Rogue
    #completewith next
    .goto 1413/1,-3021.35,1214.56
    +选中|cRXP_FRIENDLY_工头费苏勒|r，然后使用 |T134536:0|t[信号枪]两次，再输入 /Salute
    >>|cRXP_WARN_小心！在他变为友好之前不要靠近，否则他会攻击你|r
    .use 8051
    .target 工头费苏勒

step << Rogue
    .goto 1413/1,-2995.0,1236.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头费苏勒|r交谈
    .turnin 2458 >>交任务：卧底密探
    .accept 2478 >>接任务：基本不可能的任务
    .target 工头费苏勒

step << Rogue/Druid
    #optional
    #label MissionProbable

step << Rogue
    .goto 1413/1,-2930.15,1209.15
    >>使用 |T133644:0|t[搜索]从|cRXP_ENEMY_工头希里克斯|r身上偷取|cRXP_LOOT_希里克斯的塔楼钥匙|r
    .complete 2478,5 --Silixiz's Tower Key (1)
    .mob 工头希里克斯

step << Rogue
    #completewith roguetowerq
    +|cRXP_WARN_这里的每种怪物都会受到某些技能的额外伤害|r
    >>使用 |T132282:0|t[伏击]，目标选择 |cRXP_ENEMY_变异风险投资公司工人|r
    >>使用 |T132302:0|t[割裂]，目标选择 |cRXP_ENEMY_风险投资公司巡逻员|r
    >>使用|T132292:0|t[刺骨]攻击|cRXP_ENEMY_风险投资公司看守|r一次（积累1个连击点后施放）

step << Rogue
    #label roguetowerq
    .goto 1413/1,-2922.04,1224.69
    >>进入盗贼塔，击杀|cRXP_ENEMY_变异风险投资公司工人|r、|cRXP_ENEMY_风险投资公司巡逻员|r和|cRXP_ENEMY_风险投资公司看守|r
    .complete 2478,1 --Mutated Venture Co. Drone (2)
    .mob +变异风险投资公司工人
    .complete 2478,3 --Venture Co. Patroller (2)
    .mob +风险投资公司巡逻员
    .complete 2478,2 --Venture Co. Lookout (2)
    .mob +风险投资公司看守

step << Rogue
    .goto 1413/1,-2927.11,1236.18
    >>在塔顶找到|cRXP_ENEMY_加里维克斯|r，击杀他并拾取|cRXP_LOOT_加里维克斯的头颅|r
    >>|cRXP_WARN_使用|r |T132282:0|t[伏击]|cRXP_WARN_将他的生命值降至一半；然后用|r |T132155:0|t[凿击]|cRXP_WARN_争取时间恢复能量，并使用|r |T136205:0|t[闪避]
    >>|cRXP_WARN_记得使用药水和|r |T132819:0|t[菊花茶]|cRXP_WARN_（如有需要）|r
    .complete 2478,4 --Gallywix's Head (1)
    .mob 大工头普兹克·加里维克斯
    --VV Video?

step << Rogue
    .goto 1413/1,-2927.11,1236.18
    >>使用开锁技能打开|cRXP_PICK_加里维克斯的锁箱|r，并拾取|cRXP_LOOT_赞吉尔的改良药剂|r
    .complete 2478,6 --Cache of Zanzil's Altered Mixture (1)

step << skip --Rogue/Druid
    #hardcore
    #completewith next
    .goto 1413/1,-3591.86,1328.06,120 >>前往石矿洞

step << skip --Rogue/Druid
    #hardcore
    .goto 1413/1,-3505.72,1358.46
    .goto 1454/1,-4242.34,1637.33,30 >>|cRXP_WARN_跳上木梁，然后退出并重新登录，以使用登出跳过技巧。如果失败，就跑回奥格瑞玛|r
    .link https://www.youtube.com/watch?v=U7YfoaO-X8E&ab_channel=RestedXP >> |cRXP_WARN_点击查看示例|r
    .zoneskip Orgrimmar

step << Rogue/Druid
    #softcore
    #completewith next
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活

step << Rogue/Druid
    #softcore
    .goto 1413/1,-2595.75,-437.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克

step << Rogue/Druid
    #hardcore
    #completewith flytoORG
    .goto 1414/1,-3839.37,1644.65
    .zone Orgrimmar >>从西侧入口进入奥格瑞玛

step << Rogue
    .goto 1454/1,-4284.42,1771.28
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_申苏尔|r交谈
    .turnin 2478 >>交任务：基本不可能的任务
    .accept 2479 >>接任务：希诺特的帮助
    .target 申苏尔

step << Rogue
    .goto 1454/1,-4271.1,1810.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔|r|cRXP_BUY_交谈，并向他购买|r |T133849:0|t[蚀骨灰]|cRXP_BUY_和|r |T132793:0|t[空瓶]|cRXP_BUY_。|r
    .collect 2928,20,2479,1 --Collect Dust of Decay (20)
    .collect 3371,20,2479,1 --Collect Empty Vial (20)
    .target 雷库尔

step << Shaman
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8498 >> 学习职业技能
    .target 卡德里斯
    .xp <22,1
    .xp >24,1

step << Shaman
    #optional
    .goto 1454/1,-4225.09,1933.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 905 >> 学习职业技能
    .target 卡德里斯
    .xp <24,1

step << Troll Warrior/Undead Warrior/Tauren Warrior/Undead Paladin
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
    .train 197 >>学习双手斧
    .train 2567 >> 学习 [投掷] << !Paladin
    .target 哈纳什

step << Orc Warrior
    .goto 1454/1,-4824.00,2090.540
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
    .train 2567 >> 学习 [投掷]
    .target 哈纳什

step << Warrior
    .goto 1454/1,-4801.42,1980.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 6192 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <22,1
    .xp >24,1

step << Warrior
    #optional
    .goto 1454/1,-4801.42,1980.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 5308 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <24,1

step << Hunter
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 14323 >> 学习职业技能
    .target 奥玛克
    .xp <22,1
    .xp >24,1

step << Hunter
    #optional
    .goto 1454/1,-4607.02,2100.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 14262 >> 学习职业技能
    .target 奥玛克
    .xp <24,1

step << Hunter
    .goto 1454/1,-4611.09,2135.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖祖|r交谈
    .train 24558 >> 学习宠物技能
    .target 肖祖
    .xp <24,1

step << Rogue
    .goto 1454/1,-4355.53,1520.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_特拉克根|r|cRXP_BUY_交谈，向他购买|r|T135423:0|t[致命的飞斧]|cRXP_BUY_。|r
    .collect 3137,1,6544,1 --Deadly Throwing Axe (200)
    .target 特拉克根

step << Rogue
    >>|cRXP_WARN_如果有|r |T134437:0|t[抗毒药剂]，|cRXP_WARN_就用一瓶解除|r |T136230:0|t[赞吉尔之触]
    .itemcount 6452,1
    .use 6452
    .aura -9991

step << Rogue
    #optional
    .destroy 8051 >> |cRXP_WARN_从背包中删除|r |T134536:0|t[信号枪]|cRXP_WARN_，因为后续不再需要它|r
    .destroy 8066 >> |cRXP_WARN_从背包中删除|r |T134374:0|t[费苏勒的哨子]|cRXP_WARN_，因为后续不再需要它|r

step
    #optional
    #label flytoORG
]])
