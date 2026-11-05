local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#classic
#tbc
#xprate <1.99
<< Horde
#name 12-17 The Barrens
#version 11
#group RestedXP Horde 1-22
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupid RXP-SRGCE-H1
#next 17-22 Stonetalon/Barrens/Ashenvale
#displayname 14-18 贫瘠之地 << Undead/Troll Rogue/Orc Rogue/Orc Warlock/Troll Mage/Troll Priest
#displayname 12-17 贫瘠之地
step << Tauren Shaman
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔克林·寻路者|r 交谈
    .accept 840 >>接任务：部落的新兵
    .target 塔克林·寻路者
step << Tauren Shaman
    #completewith next
    .goto Durotar,54.31,39.44,30,0
    .goto Durotar,52.8,28.7,20 >> 进入尘风洞窟
step << Tauren Shaman
    #loop
    .goto Durotar,51.90,25.70,0
    .goto Durotar,53.18,29.15,20,0
    .goto Durotar,52.70,27.97,12,0
    .goto Durotar,53.05,27.87,12,0
    .goto Durotar,53.14,27.24,12,0
    .goto Durotar,52.84,26.80,12,0
    .goto Durotar,52.07,26.85,12,0
    .goto Durotar,51.90,25.70,12,0
    >>击杀 |cRXP_ENEMY_火刃祭司|r，拾取 |cRXP_LOOT_试剂袋|r
    .complete 1525,2 --Reagent Pouch (1)
    .mob 火刃祭司
step << Tauren Shaman
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡加尔·战痕|r 交谈
    .turnin 840 >>交任务：部落的新兵
    .accept 842 >>接任务：十字路口征兵
    .target 卡加尔·战痕
step << Warrior !Undead
    #xprate <1.5
    #completewith next
    .goto The Barrens,54.53,27.96,30,0
    .goto The Barrens,55.53,28.28,30,0
    .goto The Barrens,56.58,28.61,30 >>前往山顶
step << Warrior !Undead
    #xprate <1.5
    .goto The Barrens,57.23,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索恩格瑞姆·火眼|r 对话
    .turnin 1502 >>交任务：索恩格瑞姆·火眼
    .accept 1503 >>接任务：锻造好的钢锭
    .target 索恩格瑞姆·火眼
step << Warrior !Undead
    #xprate <1.5
    .goto The Barrens,55.05,26.65
    >>打开 |cRXP_PICK_被盗的铁箱|r，拾取其中的 |cRXP_LOOT_锻造好的钢锭|r
    .complete 1503,1 --Forged Steel Bars (1)
step << Warrior !Undead
    #xprate <1.5
    #completewith next
    .goto The Barrens,54.53,27.96,30,0
    .goto The Barrens,55.53,28.28,30,0
    .goto The Barrens,56.58,28.61,30 >>前往山顶
step << Warrior !Undead
    #xprate <1.5
    .goto The Barrens,57.23,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索恩格瑞姆·火眼|r 对话
    .turnin 1503 >>交任务：锻造好的钢锭
    .target 索恩格瑞姆·火眼
step << !Shaman !Warrior/Undead
    #softcore
    #completewith ThievesPickup
    .goto The Barrens,50.72,32.61
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
step << !Shaman !Warrior/Undead
    #hardcore
    #completewith ThievesPickup
    .subzone 380 >> 前往十字路口
step << !Shaman !Warrior/Undead
    #softcore
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .accept 870 >>接任务：遗忘之池
    .target 图加·符文图腾
step << Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #hardcore
    .goto The Barrens,52.62,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔夫|r 对话
    .accept 6365 >>接任务：送往奥格瑞玛的肉
    .target 扎尔夫
step << !Shaman !Warrior/Undead
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 842 >>交任务：十字路口征兵 << !Druid
    .accept 844 >>接任务：平原陆行鸟的威胁
    .target 瑟格拉·黑棘
    .isOnQuest 842
step << !Shaman !Warrior/Undead
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .accept 844 >>接任务：平原陆行鸟的威胁
    .target 瑟格拉·黑棘
step << !Shaman !Warrior/Undead
    #hardcore
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .accept 870 >>接任务：遗忘之池
    .target 图加·符文图腾
step << !Shaman !Warrior/Undead
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 对话
    .accept 871 >>接任务：野猪人的袭击
    .accept 5041 >>接任务：十字路口的补给品
    .target 索克
step << Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #hardcore
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    >>|cRXP_WARN_不要飞往奥格瑞玛！|r
    .fp The Crossroads >> 开通十字路口飞行点
    .turnin 6365 >>交任务：送往奥格瑞玛的肉
    .accept 6384 >>接任务：飞往奥格瑞玛
    .target 迪弗拉克
step << Undead
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fp The Crossroads >> 开通十字路口飞行点
    .target 迪弗拉克
    .isQuestAvailable 1492
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .accept 1492 >>接任务：码头管理员迪兹维格
    .accept 848 >>接任务：菌类孢子
    .turnin 1358 >>交任务：给赫布瑞姆的样本 << Undead/Rogue/Mage/Priest/Warlock
    .target 药剂师赫布瑞姆
    .isQuestAvailable 848
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .accept 1492 >>接任务：码头管理员迪兹维格
    .turnin 1358 >>交任务：给赫布瑞姆的样本 << Undead/Rogue/Mage/Priest/Warlock
    .target 药剂师赫布瑞姆
step << Orc Hunter/Troll Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并向他购买一把|r |T135499:0|t[多层弯弓] |cRXP_BUY_。|r
    .collect 2507,1,871,1 --Collect Laminated Recurve Bow (1)
    .money <0.1751
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .target 阿瑟罗克
step << Orc Hunter/Troll Hunter
    #optional
    #completewith DisruptTheAttacks
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
step << Tauren Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并向他购买|r |T135613:0|t[猎人火枪] |cRXP_BUY_。|r
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
step << !Shaman !Warrior/Undead
    #label ThievesPickup
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r 对话
    .accept 869 >>接任务：偷钱的迅猛龙
    .target 加兹罗格
step << !Tauren !Shaman !Warrior/Undead
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r 对话
    .home >> 将炉石绑定在十字路口
    .target 旅店老板伯兰德·草风
    .bindlocation 380
    .isQuestAvailable 1492
step << Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #softcore
    .goto The Barrens,52.62,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔夫|r 对话
    .accept 6365 >>接任务：送往奥格瑞玛的肉
    .target 扎尔夫
step
    #optional
    #completewith DisruptTheAttacks
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_尖喙|r
    .complete 844,1 --Plainstrider Beak (7)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
step << !Tauren !Undead
    #xprate <1.5 << !Hunter
    #completewith next
    #label DemonMountain
    .goto The Barrens,51.09,22.68,40,0
    .goto The Barrens,50.33,21.85,40,0
    .goto The Barrens,49.21,20.42,40,0
    .goto The Barrens,47.65,19.21,100 >> 前往山顶
    .isOnQuest 924
step << !Tauren !Undead
    #xprate <1.5 << !Hunter
    #completewith next
    #requires DemonMountain
    .goto The Barrens,47.65,19.21,15 >> 进入鬼雾兽穴
    .isOnQuest 924
step << !Tauren !Undead
    #xprate <1.5 << !Hunter
    #label DemonSeed
    .goto The Barrens,47.97,19.07
    >>右键点击 |cRXP_PICK_祭坛|r
    >>|cRXP_WARN_确保身上有|r |T134095:0|t[有瑕疵的能量石] |cRXP_WARN_（持续时间为30分钟）|r
    .collect 4986,1,924 --Collect Flawed Power Stone
    .complete 924,1 --Destroy the Demon Seed (1)
    .isOnQuest 924
step << skip
    #xprate <1.5 << !Hunter
    #completewith DisruptTheAttacks
    .goto The Barrens,47.58,19.38,40,0
    .goto The Barrens,49.21,20.42,40,0
    .goto The Barrens,50.33,21.85,40,0
    .goto The Barrens,51.09,22.68,100 >> 从原路下山
    .isQuestComplete 924
--XX !Tauren !Undead
step << Shaman
    #sticky
    #label FireTar2
    .goto The Barrens,54.97,25.23,50,0
    .goto The Barrens,54.2,24.60,50,0
    .goto The Barrens,53.57,25.51
    >>击杀一只 |cRXP_ENEMY_钢鬃寻水者|r 或 |cRXP_ENEMY_钢鬃织棘者|r，并拾取掉落的 |cRXP_LOOT_火焰焦油|r
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
step
    .goto The Barrens,55.70,27.30
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，并用它开始任务。如果尚未刷新，稍后再来拾取
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶
step
    #requires FireTar2 << Shaman
    #label DisruptTheAttacks
    #loop
	.goto The Barrens,53.63,24.50,0
	.goto The Barrens,53.63,24.50,50,0
	.goto The Barrens,54.26,24.64,50,0
	.goto The Barrens,54.81,25.19,50,0
	.goto The Barrens,55.50,25.61,50,0
	.goto The Barrens,55.86,26.30,50,0
	.goto The Barrens,55.83,27.15,50,0
	.goto The Barrens,55.41,27.41,50,0
	.goto The Barrens,54.50,26.97,50,0
	.goto The Barrens,54.05,26.11,50,0
	.goto The Barrens,53.51,25.24,50,0
    >>击杀 |cRXP_ENEMY_钢鬃寻水者|r、|cRXP_ENEMY_钢鬃织棘者|r 和 |cRXP_ENEMY_钢鬃猎手|r
    .complete 871,1 --Razormane Water Seeker (8)
    .mob +钢鬃寻水者
    .complete 871,2 --Razormane Thornweaver (8)
    .mob +钢鬃织棘者
    .complete 871,3 --Razormane Hunter (3)
    .mob +钢鬃猎手
step << Warrior !Undead
    #xprate >1.49
    #completewith next
    .goto The Barrens,54.53,27.96,30,0
    .goto The Barrens,55.53,28.28,30,0
    .goto The Barrens,56.58,28.61,30 >>前往山顶
step << Warrior !Undead
    #xprate >1.49
    .goto The Barrens,57.23,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索恩格瑞姆·火眼|r 对话
    .turnin 1502 >>交任务：索恩格瑞姆·火眼
    .accept 1503 >>接任务：锻造好的钢锭
    .target 索恩格瑞姆·火眼
step << Warrior !Undead
    #xprate >1.49
    .goto The Barrens,55.05,26.65
    >>打开 |cRXP_PICK_被盗的铁箱|r，拾取其中的 |cRXP_LOOT_锻造好的钢锭|r
    .complete 1503,1 --Forged Steel Bars (1)
step << Warrior !Undead
    #xprate >1.49
    #completewith next
    .goto The Barrens,54.53,27.96,30,0
    .goto The Barrens,55.53,28.28,30,0
    .goto The Barrens,56.58,28.61,30 >>前往山顶
step << Warrior !Undead
    #xprate >1.49
    .goto The Barrens,57.23,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索恩格瑞姆·火眼|r 对话
    .turnin 1503 >>交任务：锻造好的钢锭
    .target 索恩格瑞姆·火眼
step << !Undead !Tauren
    #sticky
    #completewith EnterRFC
    .subzone 2437 >> 现在应开始寻找怒焰裂谷队伍
    .dungeon RFC
step
    #completewith next
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step
    #loop
    .goto The Barrens,53.71,29.19,0
    .goto The Barrens,53.36,26.28,80,0
    .goto The Barrens,53.23,28.41,80,0
    .goto The Barrens,53.57,29.58,80,0
    .goto The Barrens,52.91,32.90,80,0
    .goto The Barrens,51.31,32.91,80,0
    .goto The Barrens,50.50,31.05,80,0
    .goto The Barrens,50.05,29.77,80,0
    .goto The Barrens,50.93,27.72,80,0
    .goto The Barrens,52.83,27.91,80,0
    .goto The Barrens,53.71,29.19,80,0
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_尖喙|r
    .complete 844,1 --Plainstrider Beak (7)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
step << Shaman Troll/Shaman Orc/Warrior Orc/Warrior Troll
    .goto The Barrens,52.62,29.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔夫|r 对话
    .turnin 6386 >> 交任务：返回十字路口
    .target 扎尔夫
    .isOnQuest 6386
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 和 |cRXP_FRIENDLY_索克|r 交谈
    .turnin 842 >>交任务：十字路口征兵 << Tauren Shaman
    .turnin 844 >>交任务：平原陆行鸟的威胁
    .accept 845 >>接任务：斑马的威胁
    .target +瑟格拉·黑棘
    .goto The Barrens,52.24,31.01
    .turnin 871 >>交任务：野猪人的袭击
    .accept 872 >>接任务：野猪人的头目
    .target +索克
    .goto The Barrens,51.50,30.87
step
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    >>|cRXP_WARN_他在塔顶|r
    .accept 867 >>接任务：鹰身强盗
    .target 达索克·快刀
step << Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #softcore
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .turnin 6365 >>交任务：送往奥格瑞玛的肉
    .accept 6384 >>接任务：飞往奥格瑞玛
    .target 迪弗拉克
step << Orc Hunter/Troll Hunter
    #optional
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并向他购买一把|r |T135499:0|t[多层弯弓] |cRXP_BUY_。|r
    .collect 2507,1,871,1 --Collect Laminated Recurve Bow (1)
    .money <0.1751
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .target 阿瑟罗克
step << Tauren Hunter
    #optional
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并向他购买|r |T135613:0|t[猎人火枪] |cRXP_BUY_。|r
    .collect 2511,1,871,1 --Collect Hunter's Boomstick (1)
    .money <0.1324
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
    .target 阿瑟罗克
step << Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r 对话
    .home >> 将炉石绑定在十字路口
    .target 旅店老板伯兰德·草风
    .bindlocation 380
    .isQuestAvailable 1492
step << Orc Warrior/Troll Warrior/Tauren Warrior
    #sticky
    #completewith KreenigSnarlsnout
    .goto The Barrens,52.5,30.7,0
    .vendor >>|cRXP_WARN_查看|r |cRXP_FRIENDLY_里扎雷克斯|r |cRXP_WARN_是否在十字路口；他出售药水和|r |T133476:0|t[|cRXP_FRIENDLY_重型尖刺钉锤|r] |cRXP_WARN_，这件物品库存有限|r
	.unitscan 里扎雷克斯
    .subzoneskip 380,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << !Undead !Tauren
    #completewith HiddenEnemiesPickup
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克
    .dungeon RFC
step << Tauren
    .goto The Barrens,55.70,27.30,20,0
    .goto The Barrens,55.78,20.00
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，并用它开始任务。如果尚未刷新，稍后再来拾取
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶
    .dungeon RFC
step << Tauren
    #optional
    #completewith KreenigSnarlsnout1
    .goto The Barrens,56.75,24.69,50,0
    .goto The Barrens,59.26,24.67,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .dungeon RFC
step << Tauren
    #optional
    #completewith next
    >>拾取 |cRXP_PICK_十字路口的补给箱|r
    >>|cRXP_WARN_补给箱有多个刷新位置|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .dungeon RFC
step << Tauren
    #label KreenigSnarlsnout1
    .goto The Barrens,58.69,27.08
    >>击杀 |cRXP_ENEMY_克里尼格·糟鼻|r，并拾取他的 |cRXP_LOOT_獠牙|r
    .complete 872,3 --Kreenig Snarlsnout's Tusk (1)
    .mob 克里尼格·糟鼻
    .dungeon RFC
step << Tauren
    #optional
    #completewith next
    .goto The Barrens,56.75,24.69,50,0
    .goto The Barrens,59.26,24.67,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .dungeon RFC
step << Tauren
    .goto The Barrens,58.38,27.01,30,0
    .goto The Barrens,59.46,24.58
    >>拾取 |cRXP_PICK_十字路口的补给箱|r
    >>|cRXP_WARN_补给箱有多个刷新位置|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .dungeon RFC
step << Tauren
    #loop
	.goto The Barrens,58.90,25.37,0
	.goto The Barrens,59.37,25.38,50,0
	.goto The Barrens,59.63,24.46,50,0
	.goto The Barrens,59.63,23.88,50,0
	.goto The Barrens,59.06,23.89,50,0
	.goto The Barrens,58.62,23.98,50,0
	.goto The Barrens,57.83,24.28,50,0
	.goto The Barrens,56.87,24.55,50,0
	.goto The Barrens,56.74,25.37,50,0
	.goto The Barrens,57.25,25.46,50,0
	.goto The Barrens,57.52,25.63,50,0
	.goto The Barrens,57.65,25.08,50,0
	.goto The Barrens,58.24,24.98,50,0
	.goto The Barrens,58.90,25.37,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .dungeon RFC
step << Tauren
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_斑马|r，并拾取它们的 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
    .dungeon RFC
step << Tauren Shaman
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
    .goto Durotar,39.16,58.56,10 >> 沿山路向上前往 |cRXP_FRIENDLY_泰尔夫|r
    .dungeon RFC
step << Tauren Shaman
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泰尔夫·祖拉姆|r 对话
    .turnin 1525 >>交任务：火焰的召唤
    .accept 1526 >>接任务：火焰的召唤
    .target 泰尔夫·祖拉姆
    .dungeon RFC
step << Tauren Shaman
    #completewith next
    .goto Durotar,38.18,58.58
    .cast 8898 >>|cRXP_WARN_使用|r |T134732:0|t[火焰灵契]
    .use 6636
    .dungeon RFC
step << Tauren Shaman
    .goto Durotar,38.96,58.22
    >>击杀 |cRXP_ENEMY_火焰之魂|r，并拾取掉落的 |cRXP_LOOT_余烬|r
    .complete 1526,1 --Glowing Ember (1)
    .mob 火焰之魂
    .dungeon RFC
step << Tauren Shaman
    .goto Durotar,38.96,58.22
    >>点击地上的 |cRXP_PICK_火盆|r
    .turnin 1526 >>交任务：火焰的召唤
    .accept 1527 >>接任务：火焰的召唤
    .dungeon RFC
step << Tauren Shaman
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡纳尔·菲斯|r 对话
    .turnin 1527 >>交任务：火焰的召唤
    .target 卡纳尔·菲斯
    .dungeon RFC
step << Tauren Shaman
    .goto The Barrens,55.78,20.00
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，接受任务
    >>|cRXP_WARN_如果没有刷新，就等待它重新出现|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶
    .dungeon RFC
step << Tauren
    #sticky
    #completewith EnterRFC
    .subzone 2437 >> 现在应开始寻找怒焰裂谷队伍
    .dungeon RFC
step << Tauren
    #completewith HiddenEnemiesPickup
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 前往奥格瑞玛
    .dungeon RFC
step << Tauren
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
    >>|cRXP_WARN_不要飞往任何地方！|r
    .fp Orgrimmar >> 开通奥格瑞玛飞行点
    .target 多拉斯
    .isQuestAvailable 5728
    .dungeon RFC
step << !Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .accept 5726 >>接任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC
step << !Undead
    .goto Durotar,53.08,9.19,0
    >>在骷髅石击杀 |cRXP_ENEMY_火刃氏族|r 的成员，直到掉落 |cRXP_LOOT_军官的徽章|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .dungeon RFC
step << !Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .turnin 5726 >> 交任务：隐藏的敌人
    .accept 5727 >> 接任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC
step << !Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔鲁·火刃|r 对话
    .accept 5761 >>接任务：饥饿者塔拉加曼
    .target 尼尔鲁·火刃
    .dungeon RFC
step << !Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔鲁·火刃|r 对话
    .complete 5727,1 --Gauge Neeru Fireblade's reaction to you being a member of the Burning Blade
    .skipgossip
    .target 尼尔鲁·火刃
    .dungeon RFC
step << !Undead
    #label HiddenEnemiesPickup
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .turnin 5727 >> 交任务：隐藏的敌人
    .accept 5728 >> 接任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC
step << !Undead
    #completewith EnterRFC
    .destroy 14544 >>|cRXP_WARN_从背包中删除|r |T134417:0|t[军官的徽章] |cRXP_WARN_，因为之后不再需要|r
step << !Undead
    #label EnterRFC
    .goto Orgrimmar,52.77,48.97
    .subzone 2437 >> 穿过怒焰裂谷副本入口，进入副本
    .dungeon RFC
step << !Undead
    >>|cRXP_WARN_如果可以，请队友共享以下任务|r
    .accept 5722 >> 接任务：寻找背包
    .accept 5723 >> 接任务：试探敌人
    .dungeon RFC
step << !Undead
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_怒焰穴居人|r 和 |cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +怒焰穴居人
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +怒焰萨满祭司
    .isOnQuest 5723
    .dungeon RFC
step << !Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛尔|r 交谈
    .turnin 5722 >> 交任务：寻找背包
    .accept 5724 >> 接任务：归还背包
    .target 玛尔·恐怖图腾
    .isOnQuest 5722
    .dungeon RFC
step << !Undead
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛尔|r 交谈
    .accept 5724 >> 接任务：归还背包
    .target 玛尔·恐怖图腾
    .isQuestTurnedIn 5722
    .dungeon RFC
step << !Undead
    #label TroggsShamans
    >>击杀 |cRXP_ENEMY_怒焰穴居人|r 和 |cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +怒焰穴居人
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +怒焰萨满祭司
    .isOnQuest 5723
    .dungeon RFC
step << !Undead
    #optional
    #requires TroggsShamans
    #completewith BazzalanandJergosh
    >>击杀 |cRXP_ENEMY_燃刃信徒|r 和 |cRXP_ENEMY_燃刃术士|r，并拾取 |cRXP_LOOT_暗影法术研究|r 与 |cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob 燃刃信徒
    .mob 燃刃术士
    .isOnQuest 5725
    .dungeon RFC
step << !Undead
    >>击杀 |cRXP_ENEMY_饥饿者塔拉加曼|r，并拾取他的 |cRXP_LOOT_心脏|r
    .complete 5761,1 -- Taragaman the Hungerer's Heart
    .mob 饥饿者塔拉加曼
    .isOnQuest 5761
    .dungeon RFC
step << !Undead
    #label BazzalanandJergosh
    >>击杀 |cRXP_ENEMY_巴扎兰|r 和 |cRXP_ENEMY_祈求者耶戈什|r
    .complete 5728,1 --Bazzalan (1)
    .mob +巴扎兰
    .complete 5728,2 --Jergosh the Invoker (1)
    .mob +祈求者耶戈什
    .isOnQuest 5728
    .dungeon RFC
step << !Undead
    >>击杀 |cRXP_ENEMY_燃刃信徒|r 和 |cRXP_ENEMY_燃刃术士|r，并拾取 |cRXP_LOOT_暗影法术研究|r 与 |cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob 燃刃信徒
    .mob 燃刃术士
    .isOnQuest 5725
    .dungeon RFC
step << !Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔鲁·火刃|r 对话
    .turnin 5761 >>交任务：饥饿者塔拉加曼
    .target 尼尔鲁·火刃
    .isQuestComplete 5761
    .dungeon RFC
step << !Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .turnin 5728 >> 交任务：隐藏的敌人
    .accept 5729 >> 接任务：隐藏的敌人
    .target 萨尔
    .isQuestComplete 5728
    .dungeon RFC
step << !Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .accept 5729 >> 接任务：隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5728
    .dungeon RFC
step << !Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔鲁·火刃|r 对话
    .turnin 5729 >> 交任务：隐藏的敌人
    .accept 5730 >> 接任务：隐藏的敌人
    .target 尼尔鲁·火刃
    .dungeon RFC
    .isQuestTurnedIn 5728
step << !Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .turnin 5730 >> 交任务：隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5728
    .dungeon RFC
step << Tauren
    #completewith RFCTurninsTB1
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
    .fly Thunder Bluff >>飞往雷霆崖
    .target 多拉斯
    .zoneskip Orgrimmar,1
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC
step << !Tauren
    #completewith KreenigSnarlsnout
    .hs >> 使用炉石返回十字路口
    .use 6948
    .zoneskip The Barrens
    .bindlocation 380,1
    .subzoneskip 380
    .dungeon RFC
step << Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    #completewith RFCTurninsTB1
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Thunder Bluff >>飞往雷霆崖
    .target 迪弗拉克
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC
    .zoneskip Thunder Bluff
    --not worth to turn in 5723/5724 w/o TB flight path
step << skip
    #completewith RFCTurninsTB1
    .goto Mulgore,68.68,60.34,120,0
    .zone Thunder Bluff >>向南前往陶拉祖营地，再进入莫高雷，并从那里前往雷霆崖
    >>|cRXP_WARN_如果已解锁雷霆崖的飞行点，可以直接飞过去|r
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC
step << skip
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨|r 交谈
    .fp Camp Taurajo >> 开通陶拉祖营地飞行点 << !Tauren
    .target 欧姆萨·雷角
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723
step << Tauren/Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    #completewith RFCTurninsTB1
    .goto Thunder Bluff,69.88,30.90,80 >> 前往长者高地
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC
step << Tauren/Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5724 >> 交任务：归还背包
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC
step << Tauren/Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5724 >> 交任务：归还背包
    .target 拉哈罗
    .isOnQuest 5724
    .dungeon RFC
step << Tauren/Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    #label RFCTurninsTB1
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .isQuestComplete 5723
    .dungeon RFC
step << skip
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 对话
    .fp Thunder Bluff >> 开通雷霆崖飞行点
    .target 塔尔
    .zoneskip Thunder Bluff,1
    .dungeon RFC
step
    #completewith KreenigSnarlsnout
    .hs >> 使用炉石返回十字路口
    .use 6948
    .zoneskip Thunder Bluff,1
    .cooldown item,6948,>0
    .dungeon RFC
step
    #completewith KreenigSnarlsnout
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 对话
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .zoneskip Thunder Bluff,1
    .cooldown item,6948,<0
    .dungeon RFC
step
    .goto The Barrens,55.70,27.30,20,0
    .goto The Barrens,55.78,20.00
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，接受任务
    >>|cRXP_WARN_如果没有刷新，就等待它重新出现|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶
step
    #optional
    #completewith KreenigSnarlsnout
    .goto The Barrens,56.75,24.69,50,0
    .goto The Barrens,59.26,24.67,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
step
    #optional
    #completewith next
    >>拾取 |cRXP_PICK_十字路口的补给箱|r
    >>|cRXP_WARN_补给箱有多个刷新位置|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
step
    #label KreenigSnarlsnout
    .goto The Barrens,58.69,27.08
    >>击杀 |cRXP_ENEMY_克里尼格·糟鼻|r，并拾取他的 |cRXP_LOOT_獠牙|r
    .complete 872,3 --Kreenig Snarlsnout's Tusk (1)
    .mob 克里尼格·糟鼻
step << Warlock
    #season 2
    .train 403932,1
    >>|cRXP_WARN_前往荆棘祭坛|r。施放 |T136126:0|t[生命分流]，直到生命值降到极低。然后对宠物施放 |T136168:0|t[生命通道]，让自己死亡并获得 |T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    *|cRXP_WARN_死亡后你会立即复活|r
    .goto The Barrens,58.2,26.7
    .cast 1454
    .cast 755
    .collect 208750,1
step << Warlock
    #season 2
    .use 208750
    .itemcount 208750,1
    .train 403932 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_引导符文|r] |cRXP_WARN_学习|r |T136168:0|t[引导大师]
step
    #optional
    #completewith next
    .goto The Barrens,56.75,24.69,0
    .goto The Barrens,59.26,24.67,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
step
    #loop
    .goto The Barrens,58.38,27.01,30,0
    .goto The Barrens,59.46,24.58,30,0
    .goto The Barrens,58.38,27.01,0
    .goto The Barrens,59.46,24.58,0
    >>拾取 |cRXP_PICK_十字路口的补给箱|r
    >>|cRXP_WARN_补给箱有多个刷新位置|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
step
    #loop
	.goto The Barrens,58.90,25.37,0
	.goto The Barrens,59.37,25.38,50,0
	.goto The Barrens,59.63,24.46,50,0
	.goto The Barrens,59.63,23.88,50,0
	.goto The Barrens,59.06,23.89,50,0
	.goto The Barrens,58.62,23.98,50,0
	.goto The Barrens,57.83,24.28,50,0
	.goto The Barrens,56.87,24.55,50,0
	.goto The Barrens,56.74,25.37,50,0
	.goto The Barrens,57.25,25.46,50,0
	.goto The Barrens,57.52,25.63,50,0
	.goto The Barrens,57.65,25.08,50,0
	.goto The Barrens,58.24,24.98,50,0
	.goto The Barrens,58.90,25.37,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
step << !Tauren !Undead
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_斑马|r，并拾取它们的 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
    .isQuestComplete 924
step << !Tauren !Undead
    #xprate <1.5 << !Hunter
    .goto The Barrens,62.34,20.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅克塞罗斯|r 对话
    .turnin 924 >>交任务：恶魔之种
    .target 雅克塞罗斯
    .isQuestComplete 924
step << Shaman
    #optional
    #completewith ShamanDurotar
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step << Shaman
    #optional
    #completewith ShamanDurotar
    >>击杀 |cRXP_ENEMY_斑马|r，并拾取它们的 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
step << Shaman
    #completewith CallofFire3
    #label ShamanDurotar
    .goto Durotar,36.74,57.78
    .zone Durotar >> 前往杜隆塔尔
    .isOnQuest 1525
step << Shaman
    #requires ShamanDurotar
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
    .goto Durotar,39.16,58.56,10 >> 沿山路向上前往 |cRXP_FRIENDLY_泰尔夫|r
step << Shaman
    #label CallofFire3
    #requires ShamanDurotar
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泰尔夫·祖拉姆|r 对话
    .turnin 1525 >>交任务：火焰的召唤
    .accept 1526 >>接任务：火焰的召唤
    .target 泰尔夫·祖拉姆
step << Shaman
    #completewith next
    .goto Durotar,38.18,58.58
    .cast 8898 >>|cRXP_WARN_使用|r |T134732:0|t[火焰灵契]
    .use 6636
step << Shaman
    .goto Durotar,38.96,58.22
    >>击杀 |cRXP_ENEMY_火焰之魂|r，并拾取掉落的 |cRXP_LOOT_余烬|r
    .complete 1526,1 --Glowing Ember (1)
    .mob 火焰之魂
step << Shaman
    .goto Durotar,38.96,58.22
    >>点击地上的 |cRXP_PICK_火盆|r
    .turnin 1526 >>交任务：火焰的召唤
    .accept 1527 >>接任务：火焰的召唤
step << Shaman
    #optional
    #completewith FireEnd
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step << Shaman
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_斑马|r，并拾取它们的 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
    .dungeon RFC
step << Shaman
    #label FireEnd
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡纳尔·菲斯|r 对话
    .turnin 1527 >>交任务：火焰的召唤
    .target 卡纳尔·菲斯
step << Shaman
    .goto The Barrens,55.78,20.00
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，接受任务
    >>|cRXP_WARN_如果没有刷新，就等待它重新出现|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶
step << skip
    #completewith RatchetEnter
    >>击杀 |cRXP_ENEMY_赤鳞尖啸龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞尖啸龙
--XX Need to add goto about halfway down since they only spawn up north, would be too messy to add it
step
    #optional
    #completewith next
    .goto The Barrens,63.89,31.66,100,0
    >>击杀 |cRXP_ENEMY_快步斑马|r，并拾取 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
step
    #label RatchetEnter
    .goto The Barrens,62.68,36.23
    .subzone 392 >> 前往棘齿城
    .isOnQuest 845
step
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 对话
    .accept 887 >>接任务：南海海盗
    .target 加兹鲁维
step
    #completewith next
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 交谈
    .fp Ratchet >> 开通棘齿城飞行点
    .target 布拉高克
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 对话，并点击 |cRXP_FRIENDLY_通缉布告|r
    .accept 894 >>接任务：什么什么平衡器
    .goto The Barrens,62.98,37.22
    .accept 895 >>接任务：通缉：巴隆·朗绍尔
    .goto The Barrens,62.59,37.47
    .target 斯布特瓦夫
step << Undead Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135353:0|t[普通长剑] |cRXP_BUY_。|r
    .collect 2024,1,895,1 --Collect Espadon (1)
    .money <0.6397
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Undead Warrior
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑] |cRXP_WARN_（达到16级时）|r
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp >16,1
step << Undead Warrior
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑]
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <16,1
step << Troll Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135147:0|t[法师之杖] |cRXP_BUY_。|r
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
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T132394:0|t[芒刺斧] |cRXP_BUY_。|r
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
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T133046:0|t[巨型石锤] |cRXP_BUY_。|r
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
    #season 0
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135147:0|t[法师之杖] |cRXP_BUY_。|r
    .collect 2030,1,895,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Shaman
    #season 0
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Shaman
    #season 2
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T133052:0|t[重型钉锤] |cRXP_BUY_。|r
    .collect 2028,1,895,1 --Collect Hammer (1)
    .money <0.5065
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
step << Shaman
    #season 2
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T133052:0|t[重型钉锤]
    .use 2028
    .itemcount 2028,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
step << Rogue
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135343:0|t[战士阔剑] |cRXP_BUY_。|r
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
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他再购买一把副手用的|r |T135343:0|t[战士阔剑] |cRXP_BUY_。|r
    .collect 2027,2,895,1 --Collect Scimitar(1)
    .money <0.3815
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 艾隆萨尔
step << skip
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备第二把|r |T135343:0|t[战士阔剑] |cRXP_WARN_（在副手）|r
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
step
    .goto The Barrens,62.27,38.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德罗恩|r 对话
    .turnin 819 >>交任务：老陈的空酒桶
    .accept 821 >>接任务：老陈的空酒桶
    .target 酿酒师德罗恩
step
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板维尔雷|r 交谈
    >>|cRXP_BUY_向他购买|r |T133918:0|t[长嘴泥鳅] |cRXP_BUY_。|r
    >>|cRXP_BUY_向他购买|r |T132796:0|t[果汁] |cRXP_BUY_。|r << Mage/Warlock/Priest/Shaman/Druid
    >>|T133918:0|t[长嘴泥鳅] |cRXP_WARN_非常便宜，可以按需购买任意数量|r
    .vendor >> 出售杂物
    .collect 4592,20,895,1 --Longjaw Mud Snapper (20)
    .collect 1205,10,895,1 << Mage/Warlock/Priest/Shaman/Druid --Melon Juice (10)
    .target 旅店老板维尔雷
    .isOnQuest 887
step
    #completewith BaronLongshore
    .destroy 5088 >> |cRXP_WARN_从背包中删除|r |T133735:0|t[控制台操作手册] |cRXP_WARN_，因为后续不再需要|r
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
	>>击杀 |cRXP_ENEMY_塔赞|r，并从他身上拾取 |cRXP_LOOT_背包|r
    >>|cRXP_WARN_他会沿着山坡上下巡逻|r
	.complete 1963,1 --Tazan's Satchel (1)
    .unitscan 塔赞
step
    #label BaronLongshore
    #loop
    .goto The Barrens,64.21,47.14,0
    .goto The Barrens,63.57,49.14,0
    .goto The Barrens,62.64,49.72,0
    .goto The Barrens,64.21,47.14,50,0
    .goto The Barrens,63.57,49.14,50,0
    .goto The Barrens,62.64,49.72,50,0
    >>击杀 |cRXP_ENEMY_巴隆·朗绍尔|r，并拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_他会出现在其中一个营地|r
    .complete 895,1 --Baron Longshore's Head (1)
    .unitscan 巴隆·朗绍尔
step
    #label SouthSea
    #loop
    .goto The Barrens,64.23,47.10,0
    .goto The Barrens,64.40,44.09,50,0
    .goto The Barrens,63.62,46.26,50,0
    .goto The Barrens,64.23,47.10,50,0
    >>击杀 |cRXP_ENEMY_南海歹徒|r 和 |cRXP_ENEMY_南海炮兵|r
    .complete 887,1 --Southsea Brigand (12)
    .mob +南海歹徒
    .complete 887,2 --Southsea Cannoneer (6)
    .mob +南海炮兵
step << Orc Rogue/Troll Rogue
    .goto The Barrens,63.70,44.32,50,0
    .goto The Barrens,62.70,44.07,50,0
    .goto The Barrens,62.18,44.47
	>>击杀 |cRXP_ENEMY_塔赞|r，并从他身上拾取 |cRXP_LOOT_背包|r
    >>|cRXP_WARN_他会沿着山坡上下巡逻|r
	.complete 1963,1 --Tazan's Satchel (1)
    .unitscan 塔赞
step
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 对话
    .turnin 887 >>交任务：南海海盗
    .turnin 895 >>交任务：通缉：巴隆·朗绍尔
    .accept 890 >>接任务：丢失的货物
    .target 加兹鲁维
step
    .goto The Barrens,63.35,38.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪兹维格|r 对话
    .turnin 1492 >>交任务：码头管理员迪兹维格
    .turnin 890 >>交任务：丢失的货物
    .accept 892 >>接任务：丢失的货物
    .accept 896 >>接任务：矿工的宝贝
    .target 码头管理员迪兹维格
step
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 对话
    .turnin 892 >>交任务：丢失的货物
    .accept 888 >>接任务：被窃的货物
    .target 加兹鲁维
step << Undead Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135353:0|t[普通长剑] |cRXP_BUY_。|r
    .collect 2024,1,850,1 --Collect Espadon (1)
    .money <0.6397
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Undead Warrior
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑] |cRXP_WARN_（达到16级时）|r
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp >16,1
step << Undead Warrior
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑]
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <16,1
step << Troll Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135147:0|t[法师之杖] |cRXP_BUY_。|r
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
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T132394:0|t[芒刺斧] |cRXP_BUY_。|r
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
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T133046:0|t[巨型石锤] |cRXP_BUY_。|r
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
    #season 0
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135147:0|t[法师之杖] |cRXP_BUY_。|r
    .collect 2030,1,850,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Shaman
    #season 0
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Shaman
    #season 2
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T133052:0|t[重型钉锤] |cRXP_BUY_。|r
    .collect 2028,1,850,1 --Collect Hammer (1)
    .money <0.5065
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
step << Shaman
    #season 2
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T133052:0|t[重型钉锤]
    .use 2028
    .itemcount 2028,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5
step << Rogue
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135343:0|t[战士阔剑] |cRXP_BUY_。|r
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
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他再购买一把副手用的|r |T135343:0|t[战士阔剑] |cRXP_BUY_。|r
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
    --Enter completewith label
step
    #label FlyToXroads1
    #completewith XroadsTurnins3
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 交谈
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 380
    .isQuestComplete 845
step
    #completewith next
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step
    #loop
    .goto The Barrens,55.27,37.82,0
    .goto The Barrens,48.33,36.75,0
    .goto The Barrens,55.27,37.82,80,0
    .goto The Barrens,53.84,38.52,80,0
    .goto The Barrens,52.63,38.07,80,0
    .goto The Barrens,49.49,37.20,80,0
    .goto The Barrens,48.33,36.75,80,0
    >>完成击杀 |cRXP_ENEMY_斑马|r，并拾取它们的 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
step
    #label XroadsTurnins3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 和 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 5041 >>交任务：十字路口的补给品
    .turnin 872 >>交任务：野猪人的头目
    .target +索克
    .goto The Barrens,51.50,30.87
    .turnin 845 >>交任务：斑马的威胁
    .accept 903 >>接任务：草原上的徘徊者
    .target +瑟格拉·黑棘
    .goto The Barrens,52.23,31.00
step << Troll Hunter/Orc Hunter
    .goto The Barrens,51.67,29.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_巴尔格|r 对话
    >>|cRXP_BUY_向他购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_。|r
    .collect 2515,1200,850,1 << Hunter --Sharp Arrow (1200)
    .target 巴尔格
step << Tauren Hunter
    .goto The Barrens,51.67,29.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_巴尔格|r 对话
    >>|cRXP_BUY_向他购买|r |T132384:0|t[重弹丸] |cRXP_BUY_。|r
    .collect 2519,1000,850,1 << Hunter --Heavy Shot (1000)
    .target 巴尔格
step << Troll Hunter/Orc Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r 交谈
    .vendor >> |cRXP_BUY_如果有货，向他购买一把|r |T135490:0|t[|cRXP_FRIENDLY_精良的长弓|r] |cRXP_BUY_并补充箭矢|r
    >>|cRXP_WARN_如果没货，改买一把|r |T135490:0|t[强化弓] |cRXP_WARN_作为替代|r
    .collect 2515,1200,870,1 << Hunter --Sharp Arrow (1200)
    .target 阿瑟罗克
    .isOnQuest 903
step << Tauren Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并向他购买|r |T135613:0|t[猎人火枪] |cRXP_BUY_。|r
    .collect 2511,1,870,1 --Collect Hunter's Boomstick (1)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
    .target 阿瑟罗克
step
    #optional
    #completewith RegtharDeathgate1
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
step
    #optional
    #completewith next
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 850 >>接任务：科卡尔首领
    .accept 855 >>接任务：半人马护腕
    .target 雷戈萨·死门
step
    #xprate >1.49
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 850 >>接任务：科卡尔首领
    .target 雷戈萨·死门
step
    #optional
    #label RegtharDeathgate1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 850 >>接任务：科卡尔首领
    .target 雷戈萨·死门
step
    #optional
    #xprate <1.5
    #completewith KodobaneTurnin
    >>击杀 |cRXP_ENEMY_科卡尔牧民|r 和 |cRXP_ENEMY_科卡尔召雷师|r，并拾取 |cRXP_LOOT_半人马护腕|r
    >>|cRXP_WARN_这项任务不必现在完成|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔牧民
    .mob 科卡尔召雷师
    .isOnQuest 855
step
    #optional
    #completewith Barak
    >>在遗忘之池周围收集 |cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_这项任务不必现在完成|r
    .complete 848,1 --Collect Fungal Spores (x4)
step << Druid
    #season 2
    .goto The Barrens,44.73,22.18
    >>拾取地上的 |cRXP_PICK_被遗弃的钳嘴龟巢（Abandoned Snapjaw Nest）|r，取得 |T294479:0|t[|cRXP_LOOT_被抛弃的钳嘴龟的蛋|r]
    .collect 208682,1 --Abandoned Snapjaw Egg (1)
    .train 416049,1
step
    .goto The Barrens,45.06,22.54
    >>潜入水下，前往 |cRXP_PICK_冒泡的裂隙|r
    .complete 870,1 --Explore the waters of the Forgotten Pools
step
    #label Barak
    .goto The Barrens,42.82,23.52
    >>击杀 |cRXP_ENEMY_巴拉克·科多班恩|r，并拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_巴拉克·科多班恩|r的近战攻击伤害很高，身边还有一名|cRXP_ENEMY_科卡尔牧民|r护卫。他们会用网束缚你，并从远处射击|r
    .complete 850,1 --Kodobane's Head (1)
    .mob 巴拉克·科多班恩
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 850 >>交任务：科卡尔首领
    .accept 851 >>接任务：狂热的维罗戈
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855
step
    #xprate <1.5
    #label KodobaneTurnin
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 850 >>交任务：科卡尔首领
    .accept 851 >>接任务：狂热的维罗戈
    .target 雷戈萨·死门
step
    #xprate <1.5
    #optional
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 851 >>接任务：狂热的维罗戈
    .target 雷戈萨·死门
    .isQuestTurnedIn 850
step
    #optional
    #completewith next
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_这项任务不必现在完成|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
step
    #loop
    .goto The Barrens,41.62,23.42,0
    .goto The Barrens,41.62,23.42,50,0
    .goto The Barrens,41.30,24.31,50,0
    .goto The Barrens,40.52,22.88,50,0
    .goto The Barrens,41.00,21.19,50,0
    .goto The Barrens,40.32,20.69,50,0
    >>击杀 |cRXP_ENEMY_草原徘徊者|r，并拾取它们的 |cRXP_LOOT_爪子|r 和 |cRXP_LOOT_獠牙|r
    .complete 903,1 --Prowler Claws (7)
    .complete 821,1 --Savannah Lion Tusk (5)
    .mob 草原徘徊者
step
    #loop
    .goto The Barrens,41.84,14.81,0
    .goto The Barrens,41.51,19.09,60,0
    .goto The Barrens,40.82,18.23,60,0
    .goto The Barrens,40.95,16.80,60,0
    .goto The Barrens,41.23,15.79,60,0
    .goto The Barrens,41.21,14.75,60,0
    .goto The Barrens,41.84,14.81,60,0
    >>击杀 |cRXP_ENEMY_巫翼鹰身人|r 和 |cRXP_ENEMY_巫翼游荡者|r，并拾取它们的 |cRXP_LOOT_利爪|r
    .complete 867,1 --Witchwing Talon (8)
    .mob 巫翼鹰身人
    .mob 巫翼游荡者
    --RFC turnin section below no longer possible due to TB logout skip no longer workng
step << skip --!Tauren
    #completewith next
    .zone Stonetalon Mountains >> 前往石爪山脉
    .zoneskip Stonetalon Mountains
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723
step << skip --!Tauren
    #optional
    #completewith next
    .goto Stonetalon Mountains,82.57,98.63,60,0
    .goto Stonetalon Mountains,80.10,98.20,40,0
    .goto Stonetalon Mountains,77.17,98.61,40 >> 沿着左侧小路向上走
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723
step << skip --!Tauren
    .goto Stonetalon Mountains,74.69,98.10
    .goto Thunder Bluff,56.65,18.96,30 >>|cRXP_WARN_跳到其中一个笼子上，退出并重新登录，利用登出跳跃|r
    .link https://www.youtube.com/watch?v=cp2YI86AO4Y&ab >> |cRXP_WARN_点击这里查看示例|r
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723
step << skip --!Tauren
    #completewith RFCTurninsTBDisabled
    .goto Thunder Bluff,50.75,37.07,40 >> 乘坐升降机前往雷霆崖
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC
step << skip --!Tauren
    #completewith next
    .goto Thunder Bluff,69.88,30.90,80 >> 前往长者高地
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC
step << skip --!Tauren
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5724 >> 交任务：归还背包
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723
step << skip --!Tauren
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5724 >> 交任务：归还背包
    .target 拉哈罗
    .dungeon RFC
    .isOnQuest 5724
step << skip --!Tauren
    #label RFCTurninsTBDisabled
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .dungeon RFC
    .isQuestComplete 5723
step << skip --!Tauren
    #completewith Samophlange
    .hs >> 使用炉石返回十字路口
    .cooldown item,6948,>0
    .use 6948
    .dungeon RFC
step << skip --!Tauren
    #completewith Samophlange
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 对话
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .cooldown item,6948,<0
    .zoneskip The Barrens
    .dungeon RFC
step
    #optional
    .abandon 5723 >> 放弃任务：试探敌人
    .dungeon RFC
step
    #optional
    .abandon 5725 >> 放弃任务：毁灭之力
    .dungeon RFC
step
    #optional
    .abandon 5728 >> 放弃任务：隐藏的敌人
    .dungeon RFC
step
    #optional
    .abandon 5761 >> 放弃任务：饥饿者塔拉加曼
    .dungeon RFC
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .turnin 848 >> 交任务：菌类孢子
    .target 药剂师赫布瑞姆
    .isQuestComplete 848
    .dungeon RFC
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <1.5
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    .turnin 867 >>交任务：鹰身强盗
    .accept 875 >>接任务：鹰身人首领
    .target 达索克·快刀
    .dungeon RFC
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate >1.49
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    .turnin 867 >>交任务：鹰身强盗
    .target 达索克·快刀
    .dungeon RFC
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .turnin 870 >> 交任务：遗忘之池
    .accept 877 >> 接任务：死水绿洲
    .target 图加·符文图腾
    .dungeon RFC
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 903 >>交任务：草原上的徘徊者
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘
    .dungeon RFC
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，并拾取他的 |cRXP_LOOT_埃其亚基的皮|r
    >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后没有出现，或出现后你没有取得击杀归属，请跳过此步骤|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327
    .dungeon RFC
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    .goto The Barrens,52.23,31.00
    .abandon 881 >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后没有出现，或出现后你没有取得击杀归属，请放弃埃其亚基任务，然后回到城镇重新接受|r
    .itemcount 5100,<1 --Echeyakee's Hide (0)
    .dungeon RFC
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘
    .itemcount 5100,<1 --Echeyakee's Hide (0)
    .dungeon RFC
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，并拾取他的 |cRXP_LOOT_埃其亚基的皮|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327
    .dungeon RFC
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #completewith Samophlange
    +|cRXP_WARN_小心该区域的|r |cRXP_ENEMY_赤鳞镰爪龙|r |cRXP_WARN_。它们最高18级，还会使用|r |T132152:0|t[痛击]
    .dungeon RFC
    .xp >17,1
step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #completewith Samophlange
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
    .dungeon RFC
step
    #completewith Samophlange
    +|cRXP_WARN_小心该区域的|r |cRXP_ENEMY_赤鳞镰爪龙|r |cRXP_WARN_。它们最高18级，还会使用|r |T132152:0|t[痛击]
    --.dungeon !RFC
    .xp >17,1
step
    #optional
    #completewith Samophlange
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
    --.dungeon !RFC
step
    .goto The Barrens,43.80,12.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗朗恩|r 交谈
    >>|cRXP_FRIENDLY_弗朗恩|r |cRXP_WARN_出售|r |T133476:0|t[|cRXP_FRIENDLY_重型尖刺钉锤|r] |cRXP_WARN_，该物品限量供应|r << Orc Warrior/Troll Warrior/Tauren Warrior
	.vendor	>> 出售杂物并修理装备
    .target 弗朗恩·凝血
    --.dungeon !RFC
step
	#label Samophlange
    .goto The Barrens,52.40,11.65
    >>点击 |cRXP_PICK_控制台|r
    .turnin 894 >>交任务：什么什么平衡器
    .accept 900 >>接任务：什么什么平衡器
step
    .goto The Barrens,52.33,11.57
    >>点击 |cRXP_PICK_阀门|r
    >>|cRXP_WARN_小心！关闭阀门后会刷新两只怪物|r
    .complete 900,2 --Shut off Fuel Control Valve (1)
step
    .goto The Barrens,52.29,11.40
    >>点击 |cRXP_PICK_阀门|r
    >>|cRXP_WARN_关闭阀门后会刷新一只怪物|r
    .complete 900,3 --Shut off Regulator Valve (1)
step
    .goto The Barrens,52.40,11.40
    >>点击 |cRXP_PICK_阀门|r
    .complete 900,1 --Shut off Main Control Valve (1)
step
    .goto The Barrens,52.40,11.65
    >>点击 |cRXP_PICK_控制台|r
    .turnin 900 >>交任务：什么什么平衡器
    .accept 901 >>接任务：什么什么平衡器
step
    .goto The Barrens,52.84,10.40
    >>在建筑内击杀 |cRXP_ENEMY_工匠斯尼格斯|r，并拾取他的 |cRXP_LOOT_控制台钥匙|r
    .complete 901,1 --Console Key (1)
    .mob 工匠斯尼格斯
step
    .goto The Barrens,52.40,11.65
    >>点击 |cRXP_PICK_控制台|r
    .turnin 901 >>交任务：什么什么平衡器
    .accept 902 >>接任务：什么什么平衡器
step
    #optional
    #completewith Ignition
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
step
    #loop
    .goto The Barrens,54.3,12.3,0
    .goto The Barrens,54.3,12.3,90,0
    .goto The Barrens,54.6,16.7,90,0
    .goto The Barrens,42.6,15.1,90,0
    >>击杀 |cRXP_ENEMY_迅猛龙|r，并拾取它们的 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
    .mob 赤鳞镰爪龙
step
    #optional
    .goto The Barrens,56.5,7.5
    >>在这里刷怪升到16级很重要，因为接下来的3个任务都相当困难
	.xp 16
step
    #label Ignition
    .goto The Barrens,56.52,7.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹克兰克的伐木机|r 交谈，它位于淤泥沼泽
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r |cRXP_WARN_刷新时间较长；如果竞争激烈，可以考虑跳过这项任务|r
    .accept 858 >>接任务：打火钥匙
    .target 维兹克兰克的伐木机
step
    #completewith next
    +|cRXP_WARN_小心！如果|r |cRXP_ENEMY_工头葛瑞尔斯|r |cRXP_WARN_或|r |cRXP_ENEMY_淤泥兽|r |cRXP_WARN_在场，它们是19级的强力稀有怪|r
    .unitscan 工头葛瑞尔斯
    .unitscan 淤泥兽
step
    .goto The Barrens,56.52,8.47,20,0
    .goto The Barrens,56.34,8.24,12,0
    .goto The Barrens,56.12,8.33,12,0
    .goto The Barrens,56.05,8.49,12,0
    .goto The Barrens,56.13,8.56,12,0
    .goto The Barrens,56.34,8.24
    >>击杀 |cRXP_ENEMY_鲁格维兹主管|r，并拾取他的 |cRXP_LOOT_钥匙|r
    >>|cRXP_WARN_他会在平台上来回巡逻|r
    .complete 858,1 --Ignition Key (1)
    .mob 鲁格维兹主管
    .isOnQuest 858
step
    .goto The Barrens,56.52,7.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹克兰克的伐木机|r 交谈
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r |cRXP_WARN_刷新时间较长；如果竞争激烈，可以考虑跳过这项任务|r
    >>|cRXP_WARN_这会开始护送任务；出发前确保生命值全满|r
    .turnin 858 >>交任务：打火钥匙
    .accept 863,1 >>接任务：逃跑
    .target 维兹克兰克的伐木机
    .isQuestComplete 858
step
    #optional
    .goto The Barrens,56.52,7.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹克兰克的伐木机|r 交谈
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r |cRXP_WARN_刷新时间较长；如果竞争激烈，可以考虑跳过这项任务|r
    >>|cRXP_WARN_这会开始护送任务；出发前确保生命值全满|r
    .accept 863,1 >>接任务：逃跑
    .target 维兹克兰克的伐木机
    .isQuestTurnedIn 858
step
    #label Slugs
    .goto The Barrens,55.80,7.76,30,0
    .goto The Barrens,55.51,7.13
    >>|cRXP_WARN_伐木机到达高处时会刷新两名|r |cRXP_ENEMY_风险投资公司雇佣兵|r |cRXP_WARN_。击杀他们，然后等待终点处的剧情事件|r
    .complete 863,1 --Escort Wizzlecrank out of the Venture Co. drill site (1)
    .mob 风险投资公司雇佣兵
    .mob 风险投资公司苦工
    .mob 监工格里比
    .isOnQuest 863
step
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
step
    #label CatsEye
    #loop
    .goto The Barrens,61.51,4.43,0
    .goto The Barrens,61.46,4.50,40,0
    .goto The Barrens,61.06,3.63,40,0
    .goto The Barrens,61.63,3.37,40,0
    .goto The Barrens,62.14,3.52,40,0
    .goto The Barrens,61.94,4.53,40,0
    .goto The Barrens,61.85,5.37,40,0
    .goto The Barrens,61.44,5.56,40,0
    .goto The Barrens,61.17,5.05,40,0
    .goto The Barrens,61.51,4.43,40,0
    >>击杀 |cRXP_ENEMY_风险投资公司执行者|r 和 |cRXP_ENEMY_风险投资公司监督|r，并拾取掉落的 |cRXP_LOOT_猫眼翡翠|r
    >>|cRXP_WARN_如果击杀25只以上仍未掉落，可以跳过这项任务|r
    .complete 896,1 -- Cats Eye Emerald (1)
    .mob 风险投资公司执行者
    .mob 风险投资公司监督
step
    #ssf
    .goto The Barrens,61.51,4.43,0
    .goto The Barrens,61.46,4.50,40,0
    .goto The Barrens,61.06,3.63,40,0
    .goto The Barrens,61.63,3.37,40,0
    .goto The Barrens,62.14,3.52,40,0
    .goto The Barrens,61.94,4.53,40,0
    .goto The Barrens,61.85,5.37,40,0
    .goto The Barrens,61.44,5.56,40,0
    .goto The Barrens,61.17,5.05,40,0
    .goto The Barrens,61.51,4.43,40,0
    >>击杀 |cRXP_ENEMY_风险投资公司监督|r，并拾取他们的 |T132794:0|t[|cRXP_LOOT_灯油|r]
    .collect 814,5,103,1 --Flask of Oil (5)
    .dungeon DM
step
    #ah
    .goto The Barrens,61.51,4.43,0
    .goto The Barrens,61.46,4.50,40,0
    .goto The Barrens,61.06,3.63,40,0
    .goto The Barrens,61.63,3.37,40,0
    .goto The Barrens,62.14,3.52,40,0
    .goto The Barrens,61.94,4.53,40,0
    .goto The Barrens,61.85,5.37,40,0
    .goto The Barrens,61.44,5.56,40,0
    .goto The Barrens,61.17,5.05,40,0
    .goto The Barrens,61.51,4.43,40,0
    >>击杀 |cRXP_ENEMY_风险投资公司监督|r，并拾取他们的 |T132794:0|t[|cRXP_LOOT_灯油|r]
    >>|cRXP_WARN_也可以改从拍卖行购买|r
    .collect 814,5,103,1 --Flask of Oil (5)
    .dungeon DM
step << skip
    .goto The Barrens,60.48,3.76
    .goto Orgrimmar,40.05,68.05,30 >>|cRXP_WARN_跳到木梁上，退出并重新登录，利用登出跳跃。如果没有成功，就跑回奥格瑞玛|r
    .link https://www.youtube.com/watch?v=U7YfoaO-X8E&ab_channel=RestedXP >> |cRXP_WARN_点击这里查看示例|r
    .zoneskip Orgrimmar
step
    #completewith SpiritsPickup
    .goto Kalimdor,56.81,45.47
    .zone Orgrimmar >>从奥格瑞玛西侧入口进入
step
    #completewith next
    .skill firstaid,40 >> |cRXP_WARN_制作|r |T133685:0|t[亚麻绷带] |cRXP_WARN_，直到急救技能达到40或更高|r
    .skill firstaid,<1,1
step
    .goto Orgrimmar,34.18,84.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿诺克|r 交谈
    >>|cRXP_WARN_如果没有足够的|r |T132889:0|t[亚麻布] |cRXP_WARN_将技能提升到40，请跳过此步骤|r
    .train 3276 >> 学习|T133688:0|t[厚亚麻绷带]
    .target 阿诺克
    .skill firstaid,<1,1
step
    #completewith next
    .skill firstaid,50 >> |cRXP_WARN_制作|r |T133688:0|t[厚亚麻绷带] |cRXP_WARN_，直到技能达到50或更高|r
    .skill firstaid,<1,1
step
    .goto Orgrimmar,34.18,84.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿诺克|r 交谈
    >>|cRXP_WARN_如果没有足够的|r |T132889:0|t[亚麻布] |cRXP_WARN_将技能提升到50，请跳过此步骤|r
    .train 3274 >> 学习中级急救
    .target 阿诺克
    .skill firstaid,<40,1
step
    #completewith SpiritsPickup
    +|cRXP_WARN_不要出售|r |T132794:0|t[|cRXP_LOOT_灯油|r]
    .itemcount 814,5
    .dungeon DM
step << Priest
    #optional
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_乌尔库|r 交谈
    .train 8102 >> 学习职业技能
    .target 乌尔库
    .xp <16,1
    .xp >18,1
step << Priest
    #optional
    #season 2
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_乌尔库|r 交谈
    .train 527 >> 学习|T135894:0|t[驱散魔法]
    >>|cRXP_WARN_之后获取符文时需要|r |T135894:0|t[驱散魔法] |cRXP_WARN_。|r
    .target 乌尔库
    .xp <18,1
step << Priest
    #optional
    #season 0
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_乌尔库|r 交谈
    .train 970 >> 学习职业技能
    .target 乌尔库
    .xp <18,1
step << Mage
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_皮菲瑞多|r 交谈
    .train 2120 >> 学习职业技能
    .target 皮菲瑞多
    .xp <16,1
    .xp >18,1
step << Mage
    #optional
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_皮菲瑞多|r 交谈
    .train 3140 >> 学习职业技能
    .target 皮菲瑞多
    .xp <18,1
step << !Tauren !Undead !Shaman !Warrior
    .goto Orgrimmar,54.097,68.407
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_格雷什卡|r 交谈
    .turnin 6384 >>交任务：飞往奥格瑞玛
    .accept 6385 >>接任务：双足飞龙管理员多拉斯
    .target 旅店老板格雷什卡
    .isOnQuest 6384
step << !Tauren !Undead !Shaman !Warrior
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_多拉斯|r 交谈
    .turnin 6385 >> 交任务：双足飞龙管理员多拉斯
    .accept 6386 >> 接任务：返回十字路口
    .target 多拉斯
    .isOnQuest 6385
step << !Tauren !Undead !Shaman !Warrior
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_多拉斯|r 交谈
    .accept 6386 >> 接任务：返回十字路口
    .target 多拉斯
    .isQuestTurnedIn 6385
step << Tauren/Undead
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
    >>|cRXP_WARN_不要飞往任何地方！|r
    .fp Orgrimmar >> 开通奥格瑞玛飞行点
    .target 多拉斯
    .isQuestAvailable 4921
step << Shaman
    #season 2
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
    >>|cRXP_WARN_务必学会|r |T136075:0|t[净化术] |cRXP_WARN_，之后获取符文时会用到|r
    .train 8019 >> 学习职业技能
    .target 卡德里斯
    .xp <16,1
    .xp >18,1
step << Shaman
    #optional
    #season 2
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
    >>|cRXP_WARN_务必学会|r |T136075:0|t[净化术] |cRXP_WARN_，之后获取符文时会用到|r
    .train 913 >> 学习职业技能
    .target 卡德里斯
    .xp <18,1
step << Shaman
    #season 0
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
    .train 8019 >> 学习职业技能
    .target 卡德里斯
    .xp <16,1
    .xp >18,1
step << Shaman
    #optional
    #season 0
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
    .train 913 >> 学习职业技能
    .target 卡德里斯
    .xp <18,1
step
    .goto Orgrimmar,38.94,38.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_佐尔|r 对话
    .accept 1061 >>接任务：石爪之灵
    .target 佐尔·孤树
step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_申苏尔|r 交谈
    .train 1804 >> 学习|T136058:0|t[开锁]
    .train 921 >> 学习|T133644:0|t[搜索]
    .accept 2379 >> 接任务：赞杜沙
    .target 申苏尔
step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 对话
    .turnin 1963 >> 交任务：碎手氏族
    .accept 1858 >> 接任务：碎手氏族
    .target 瑟祖克
step << Rogue
    .goto Orgrimmar,42.72,52.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赞杜沙|r 对话
    .turnin 2379 >>交任务：赞杜沙
    .accept 2382 >>接任务：棘齿城的维尼克斯
    .target 赞杜沙
step << Orc Rogue/Troll Rogue
    #optional
    #completewith next
    .goto Orgrimmar,42.10,49.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_雷库尔|r|cRXP_BUY_对话，并向他购买|r |T134065:0|t[潜行者工具] |cRXP_BUY_。|r
    .collect 5060,1,1858,1 --Collect Thieves' Tools (1)
    .target 雷库尔
    .money <0.15
step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.52
    >>|cRXP_WARN_使用|r |T136058:0|t[开锁] |cRXP_WARN_打开|r |T133626:0|t[塔赞的背包]
    .complete 1858,1 --Tazan's Logbook (1)
    .money <0.15
step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 对话
    .turnin 1858 >>交任务：碎手氏族
    .target 瑟祖克
step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,53.99,68.05
    >>|cRXP_WARN_使用|r |T133644:0|t[搜索] |cRXP_WARN_，目标为旅店内的|r |cRXP_ENEMY_加摩尔|r |cRXP_WARN_。用他的钥匙打开|r |T133626:0|t[塔赞的背包]
	.collect 7208,1,1858,1 --Tazan's Key
	.complete 1858,1 --Tazan's Logbook (1)
    .isOnQuest 1858
step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 对话
    .turnin 1858 >>交任务：碎手氏族
    .target 瑟祖克
step << Warlock
    .goto Orgrimmar,48.62,46.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米尔科特|r 交谈
    .train 1455 >> 学习职业技能
    .target 米尔科特
    .xp <16,1
    .xp >18,1
step << Warlock
    #optional
    .goto Orgrimmar,48.62,46.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米尔科特|r 交谈
    .train 1014 >> 学习职业技能
    .target 米尔科特
    .xp <18,1
step << Warlock
    .goto Orgrimmar,47.54,46.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_库古尔|r 交谈并购买 |T133738:0|t[魔典：牺牲]
    .collect 16351,1,896,1 --Grimoire of Sacrifice (Rank 1) (1)
    .target 库古尔
    .xp <16,1
    .xp >18,1
step << Warlock
    .goto Orgrimmar,47.54,46.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_库古尔|r 对话，并购买 |T133738:0|t[魔典：火焰箭（等级 3）]
    .collect 16316,1,896,1 --Grimoire of Firebolt (Rank 3) (1)
    .target 库古尔
    .xp <18,1
step << Warrior
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格雷兹|r 交谈
    .train 285 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <16,1
    .xp >18,1
step << Warrior
    #optional
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格雷兹|r 交谈
    .train 8198 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <18,1
step << Hunter
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥玛克|r 交谈
    .train 13795 >> 学习职业技能
    .target 奥玛克
    .xp <16,1
    .xp >18,1
step << Hunter
    #optional
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥玛克|r 交谈
    .train 2643 >> 学习职业技能
    .target 奥玛克
    .xp <18,1
step << Hunter
    .goto Orgrimmar,66.34,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肖祖|r 交谈
    .train 24557 >> 学习宠物技能
    .target 肖祖
    .xp <18,1
step << Troll Hunter/Orc Hunter/Priest
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈纳什|r 对话
    .train 227 >>学习法杖技能
    .target 哈纳什
    .money <0.100
step << Tauren Hunter
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈纳什|r 对话
    .train 264 >>学习弓技能
    .target 哈纳什
step << Troll Warrior/Tauren Warrior/Undead Warrior
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈纳什|r 对话
    .train 197 >>学习双手斧技能
    .train 227 >>学习法杖技能
    .target 哈纳什
step << Hunter
    .goto Orgrimmar,81.17,18.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_对话，并向他购买|r |T135490:0|t[强化弓] |cRXP_BUY_。|r
    .collect 3026,1,3281,1 --Collect Reinforced Bow (1)
    .money <0.3588
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.4
    .target 森度吉安
    .train 264,3
step << Hunter
    #optional
    #completewith FoodandWater2
    +|cRXP_WARN_装备|r |T135490:0|t[强化弓]
    .use 3026
    .itemcount 3026,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.4
step << Warrior
    .goto Orgrimmar,81.17,18.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_对话，并向他购买|r |T135423:0|t[大型战斧] |cRXP_BUY_。|r
    .collect 926,1,3281,1 --Collect Battle Axe (1)
    .money <1.021
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .target 森度吉安
    .train 197,3
step << Warrior
    #optional
    #completewith FoodandWater2
    +|cRXP_WARN_装备|r |T135423:0|t[大型战斧] |cRXP_WARN_（达到20级时）|r
    .use 926
    .itemcount 926,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp >20,1
step << Warrior
    #optional
    #completewith FoodandWater2
    +|cRXP_WARN_装备|r |T135423:0|t[大型战斧]
    .use 926
    .itemcount 926,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1
step << Druid/Mage
    #season 2
    #ah
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师萨苏恩|r 对话
    >>|cRXP_BUY_如果可能，从拍卖行购买|r |T134237:0|t[科卡尔宝箱钥匙] |cRXP_BUY_。|r
    >>|cRXP_WARN_你需要用它获取|r |T132942:0|t[|cRXP_FRIENDLY_野性神像|r] |cRXP_WARN_以学习|r |T236167:0|t[野蛮咆哮] << Druid
    >>|cRXP_WARN_你需要用它获取|r |T134939:0|t|cRXP_FRIENDLY_[法术笔记：NIZHGAES]|r |cRXP_WARN_以学习|r |T132869:0|t[再生] << Mage
    .collect 5020,1 --Kolkar Booty Key (1)
	.target 拍卖师萨苏恩
    .itemcount 208689,<1,1 << Druid
    .train 407988,1 << Druid
    .train 401767,1 << Mage
step
    #optional
    #label SpiritsPickup
step
    #completewith FoodandWater2
    .hs >> 使用炉石返回十字路口
    .cooldown item,6948,>0
    .use 6948
    .bindlocation 380,1
    .subzoneskip 380
step
    #completewith FoodandWater2
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r |cRXP_FRIENDLY_多拉斯|r 交谈
    .fly Crossroads >>飞往十字路口
    .target 多拉斯
    .cooldown item,6948,<0
    .subzoneskip 380
step
    #label FoodandWater2
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r 对话
	.vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .target 旅店老板伯兰德·草风
    .isQuestAvailable 3281
step
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r 对话
    .turnin 869 >>交任务：偷钱的迅猛龙
    .accept 3281 >>接任务：被偷走的银币
    .target 加兹罗格
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .turnin 848 >> 交任务：菌类孢子
    .target 药剂师赫布瑞姆
    .isQuestComplete 848
step
    #xprate <1.5
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    .turnin 867 >>交任务：鹰身强盗
    .accept 875 >>接任务：鹰身人首领
    .target 达索克·快刀
step
    #xprate >1.49
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    .turnin 867 >>交任务：鹰身强盗
    .target 达索克·快刀
step
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .turnin 870 >>交任务：遗忘之池
    .accept 877 >>接任务：死水绿洲
    .target 图加·符文图腾
step
    #label EcheyakeePickup
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 903 >>交任务：草原上的徘徊者
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘
step << !Tauren !Undead !Warrior !Shaman
    .goto The Barrens,52.62,29.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔夫|r 对话
    .turnin 6386 >> 交任务：返回十字路口
    .target 扎尔夫
    .isOnQuest 6386
step
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，并拾取他的 |cRXP_LOOT_埃其亚基的皮|r
    >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后没有出现，或出现后你没有取得击杀归属，请跳过此步骤|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327
step
    #optional
    .goto The Barrens,52.23,31.00
    .abandon 881 >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后没有出现，或出现后你没有取得击杀归属，请放弃埃其亚基任务，然后回到城镇重新接受|r
    .itemcount 5100,<1 --Echeyakee's Hide (0)
step
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘
    .itemcount 5100,<1 --Echeyakee's Hide (0)
step
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，并拾取他的 |cRXP_LOOT_埃其亚基的皮|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327
step
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 881 >>交任务：埃其亚基
    .accept 905 >>接任务：狂暴的镰爪龙
    .target 瑟格拉·黑棘
step
    #completewith RapHornsPickup
    .destroy 10327 >>|cRXP_WARN_摧毁|r |T134227:0|t[埃其亚基的号角] |cRXP_WARN_，因为之后不再需要它|r
step << Warrior
    #season 2
    .goto The Barrens,52.27,31.08
    .aura 420667 >>点击 |cRXP_PICK_部落战旗|r
    .train 403489,1
step
    .goto The Barrens,51.95,31.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_曼科里克|r 对话
    .accept 899 >>接任务：复仇的怒火
    .accept 4921 >>接任务：在战斗中失踪
    .target 曼科里克
step << Hunter
    .goto The Barrens,51.67,29.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_巴尔格|r 对话
    >>|cRXP_BUY_向他购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_。|r
    .collect 2515,1800,888,1 << Hunter --Sharp Arrow (1800)
    .target 巴尔格
step
    #completewith RapHornsPickup
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Ratchet >>飞往棘齿城
    .target 迪弗拉克
    .subzoneskip 392
step << Rogue
    .goto The Barrens,63.07,36.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卑鄙的维尼克斯|r 对话
    .turnin 2382 >>交任务：棘齿城的维尼克斯
    .accept 2381 >>接任务：抢劫海盗
    .target 卑鄙的维尼克斯
step << Rogue
    .goto The Barrens,63.12,36.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尼克斯的机械设备|r 对话
    >>|cRXP_WARN_获取一个|r |T134059:0|t[大饼干] |cRXP_WARN_和一套|r |T134065:0|t[潜行者工具]
    .collect 7970,1,888,1 --E.C.A.C. (1)
    .collect 5060,1,888,1 --Thieves' Tools (1)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 和 |cRXP_FRIENDLY_码头管理员迪兹维格|r 交谈
    .turnin 902 >>交任务：什么什么平衡器
    .turnin 863 >> 交任务：逃跑
    .accept 3921 >> 接任务：维妮·布特巴克 << Hunter
    .accept 1483 >> 接任务：菲兹克斯
    .target +斯布特瓦夫
    .goto The Barrens,62.98,37.22
    .turnin 896 >> 交任务：矿工的宝贝
    .target +码头管理员迪兹维格
    .goto The Barrens,63.35,38.45
    .isQuestComplete 896
    .isQuestComplete 863
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 和 |cRXP_FRIENDLY_码头管理员迪兹维格|r 交谈
    .turnin 902 >>交任务：什么什么平衡器
    .accept 3921 >> 接任务：维妮·布特巴克 << Hunter
    .accept 1483 >> 接任务：菲兹克斯
    .target +斯布特瓦夫
    .goto The Barrens,62.98,37.22
    .turnin 896 >> 交任务：矿工的宝贝
    .target +码头管理员迪兹维格
    .goto The Barrens,63.35,38.45
    .isQuestComplete 896
step
    #optional
    .goto The Barrens,62.98,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 对话
    .turnin 863 >> 交任务：逃跑
    .accept 1483 >> 接任务：菲兹克斯
    .target 斯布特瓦夫
    .isQuestComplete 863
step
    #optional
    .goto The Barrens,62.98,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 对话
    .accept 1483 >> 接任务：菲兹克斯
    .target 斯布特瓦夫
step
    #label RapHornsPickup
    .goto The Barrens,62.37,37.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦伯克·米希瑞克斯|r 对话
    .accept 865 >>接任务：迅猛龙角
    .accept 1069 >>接任务：深苔蜘蛛的卵
    .target 麦伯克·米希瑞克斯
step << Warrior
    #season 2
    .goto The Barrens,62.77,38.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基尔克斯|r 对话
    >>|cRXP_BUY_向他购买|r |T135129:0|t[猎鱼叉] |cRXP_BUY_。|r
    .collect 208773,1 --Fishing Harpoon (1)
    .target 基尔克斯
    .train 425443,1 << Warrior
step << Warrior
    #season 2
    .goto The Barrens,64.51,39.32
    .use 208773 >>使用 |T135129:0|t[猎鱼叉] 攻击 |cRXP_ENEMY_布鲁兹|r，然后击杀它并拾取 |T134419:0|t[|cRXP_FRIENDLY_迅捷打击符文|r] << Warrior
    >>|cRXP_WARN_它会在水中的沉船周围巡逻|r
    .collect 208778,1 << Warrior --Rune of Quick Strike (1)
    .unitscan 布鲁兹
    .train 425443,1 << Warrior
step << Warrior
    #season 2
    .train 425443 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_迅捷打击符文|r] |cRXP_WARN_学习|r |T132394:0|t[迅捷打击]
    .use 208778
    .itemcount 208778,1
step
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板维尔雷|r 交谈
    >>|cRXP_BUY_向他购买|r |T133918:0|t[长嘴泥鳅] |cRXP_BUY_。|r
    >>|cRXP_BUY_向他购买|r |T132796:0|t[果汁] |cRXP_BUY_。|r << Mage/Warlock/Priest/Shaman/Druid
    >>|T133918:0|t[长嘴泥鳅] |cRXP_WARN_非常便宜，可以按需购买任意数量|r
    .vendor >> 出售杂物
    .collect 4592,20,888,1 --Longjaw Mud Snapper (20)
    .collect 1205,10,888,1 << Mage/Warlock/Priest/Shaman/Druid --Melon Juice (10)
    .target 旅店老板维尔雷
step << Rogue
	#completewith next
    .goto The Barrens,65.04,45.44
    +|cRXP_WARN_跳上船，下到第2层，将开锁技能提升到至少70|r
step << Rogue
    .goto The Barrens,64.95,45.44
    >>开锁技能达到70后，前往船只最底层并打开 |cRXP_PICK_南海宝珠|r
    >>|cRXP_WARN_使用|r |T134059:0|t[大饼干] |cRXP_WARN_，目标为|r |cRXP_ENEMY_波利|r
    .complete 2381,1 --Southsea Treasure (1)
    .use 7970
    .mob 波利
step
    #label LeaveRatchet
    .goto The Barrens,63.58,49.25
    >>拾取地上的 |cRXP_PICK_箱子|r
    .complete 888,2 --Telescopic Lens (1)
step
    .goto The Barrens,62.63,49.64
    >>拾取地上的 |cRXP_PICK_箱子|r
    .complete 888,1 --Shipment of Boots (1)
step << Warrior
    #season 2
    #completewith next
    .subzone 385 >>前往北方城堡
step << Warrior
    #season 2
    .goto The Barrens,62.55,56.31
    >>点击 |cRXP_PICK_联盟战旗|r
    >>击杀出现的 |cRXP_ENEMY_Lieutenant Stonebrew|r，拾取他的 |T134419:0|t[|cRXP_FRIENDLY_无尽怒气符文|r]
    .collect 208741,1 --Rune of Endless Rage (1)
    .mob Lieutenant Stonebrew
    .train 403489,1
step << Warrior
    #season 2
    .train 403489 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_无尽怒气符文|r] |cRXP_WARN_学习|r |T132347:0|t[无尽怒气]
    .use 208741
    .itemcount 208741,1
step
    #optional
    #completewith TestSeeds
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
step
    #optional
    #completewith TestSeeds
    >>击杀 |cRXP_ENEMY_赤鳞镰爪龙|r，并拾取它们的 |cRXP_LOOT_角|r 和 |cRXP_LOOT_羽毛|r
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .collect 5165,3,905,3 --Sunscale Feather (3)
    .mob 赤鳞镰爪龙
step
    .goto The Barrens,57.39,52.28,60,0
    .goto The Barrens,58.04,53.87
    >>拾取地上的 |cRXP_PICK_被偷走的银币|r
    .complete 3281,1 --Stolen Silver (1)
step
    #optional
    #xprate <1.5
    #completewith Verog
    >>在死水绿洲周围收集 |cRXP_LOOT_丰满的蘑菇|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #optional
    #xprate >1.49
    #completewith next
    >>在死水绿洲周围收集 |cRXP_LOOT_丰满的蘑菇|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #label TestSeeds
    .goto The Barrens,55.61,42.75
    >>在水下点击 |cRXP_PICK_冒泡的裂隙|r
    .complete 877,1 --Test the Dried Seeds (1)
step << Druid/Mage
    #optional
    #season 2
    #completewith Verog
    >>击杀 |cRXP_ENEMY_科卡尔|r，并拾取 |T134237:0|t[|cRXP_LOOT_科卡尔宝箱钥匙|r]
    .collect 5020,1 --Kolkar Booty Key (1)
    .mob 科卡尔牧民
    .mob 科卡尔召雷师
    .train 407988,1 << Druid
    .train 401767,1 << Mage
step
    #optional
    #xprate <1.5
    #completewith next
    #loop
    .goto The Barrens,55.80,45.78,50,0
    .goto The Barrens,56.75,43.41,50,0
    .goto The Barrens,57.01,41.22,50,0
    .goto The Barrens,55.45,41.37,50,0
    .goto The Barrens,54.99,40.84,50,0
    .goto The Barrens,53.41,40.26,50,0
    .goto The Barrens,52.99,44.73,50,0
    .goto The Barrens,54.31,46.81,50,0
    >>击杀绿洲周围的 |cRXP_ENEMY_科卡尔|r，并拾取它们掉落的 |cRXP_LOOT_护腕|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔战士
    .mob 科卡尔驯犬者
    .mob 科卡尔掠夺者
    .isOnQuest 851
step
    #xprate <1.5
    #label Verog
    .goto The Barrens,52.95,41.75
    >>击杀 |cRXP_ENEMY_狂热的维罗戈|r，并拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_每击杀一个|cRXP_ENEMY_科卡尔|r，他都有几率刷新|r
    >>|cRXP_WARN_在人口较多的服务器或新服开放初期，最好直接蹲守他的刷新点|r
    .complete 851,1 --Verog's Head (1)
    .unitscan 狂热的维罗戈
    .isOnQuest 851
step << Druid/Mage
    #season 2
    #loop
    .goto The Barrens,55.80,45.78,0
    .goto The Barrens,55.80,45.78,50,0
    .goto The Barrens,56.75,43.41,50,0
    .goto The Barrens,57.01,41.22,50,0
    .goto The Barrens,55.45,41.37,50,0
    .goto The Barrens,54.99,40.84,50,0
    .goto The Barrens,53.41,40.26,50,0
    .goto The Barrens,52.99,44.73,50,0
    .goto The Barrens,54.31,46.81,50,0
    >>击杀 |cRXP_ENEMY_科卡尔|r，并拾取 |T134237:0|t[|cRXP_LOOT_科卡尔宝箱钥匙|r]
    .collect 5020,1 --Kolkar Booty Key (1)
    .mob 科卡尔牧民
    .mob 科卡尔召雷师
    .itemcount 208689,<1,1 << Druid
    .train 407988,1 << Druid
    .train 401767,1 << Mage
step << Druid/Mage
    #season 2
    .goto The Barrens,52.7,41.8
    >>打开一个 |cRXP_PICK_科卡尔的战利品|r 宝箱，获取 |T132942:0|t[|cRXP_FRIENDLY_野性神像|r] << Druid
    >>打开一个 |cRXP_PICK_科卡尔的战利品|r 宝箱，获取 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：NIZHGAES|r] << Mage
    .collect 5020,1 --Kolkar Booty Key (1)
    .collect 208689,1 << Druid --Ferocious Idol (1)
    .collect 208754,1 << Mage --Spell Notes: TENGI RONEERA (1)
    .itemcount 208689,<1,1 << Druid
    .train 407988,1 << Druid
    .train 401767,1 << Mage
step << Druid
    #season 2
    #completewith Nest
    .equip 18,208689 >> |cRXP_WARN_装备|r |T132942:0|t[|cRXP_FRIENDLY_野性神像|r] |cRXP_WARN_，前提是已经学会|r |T132115:0|t[猎豹形态]
    .use 208689
    .itemcount 208689,1
    .train 407988,1 << Druid
    .train 401767,1 << Mage
step << Druid
    #season 2
    #completewith Nest
    .train 407988 >>|cRXP_WARN_对人形生物造成20次来自|r |T132152:0|t[撕扯] |cRXP_WARN_或|r |T132122:0|t[扫击] |cRXP_WARN_的流血伤害，然后再次使用|r |T132942:0|t[|cRXP_FRIENDLY_野性神像|r] |cRXP_WARN_学习|r |T236167:0|t[野蛮咆哮]
    .use 208689
    .itemcount 208689,1
step << Mage
    #season 2
    .train 401767 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：NIZHGAES|r] |cRXP_WARN_学习|r |T132869:0|t[再生]
    .use 208754
    .itemcount 208754,1 --Spell Notes: TENGI RONEERA (1)
step
    #loop
    .goto The Barrens,55.72,42.14,0
    .goto The Barrens,55.72,42.14,30,0
    .goto The Barrens,55.49,41.75,30,0
    .goto The Barrens,55.09,41.58,30,0
    .goto The Barrens,55.03,42.24,30,0
    .goto The Barrens,55.27,43.17,30,0
    .goto The Barrens,55.78,43.47,30,0
    .goto The Barrens,56.15,43.28,30,0
    .goto The Barrens,56.08,42.58,30,0
    >>在死水绿洲周围收集 |cRXP_LOOT_丰满的蘑菇|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #optional
    #completewith LakotaMani1
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
step
    .goto The Barrens,52.60,46.10
    >>点击 |cRXP_PICK_蓝色迅猛龙巢穴|r。如果没有 |cRXP_ENEMY_赤鳞镰爪龙|r 掉落的 |T132914:0|t[赤鳞迅猛龙的羽毛]，就再击杀一些
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 905,1 --Visit Blue Raptor Nest (1)
    .collect 5165,3,905,7,3
    .mob 赤鳞镰爪龙
step
    .goto The Barrens,52.45,46.57
    >>点击 |cRXP_PICK_红色迅猛龙巢穴|r。如果没有 |cRXP_ENEMY_赤鳞镰爪龙|r 掉落的 |T132914:0|t[赤鳞迅猛龙的羽毛]，就再击杀一些
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 905,3 --Visit Red Raptor Nest (1)
    .collect 5165,3,905,7,3
    .mob 赤鳞镰爪龙
step
    #label Nest
    .goto The Barrens,52.02,46.47
    >>点击 |cRXP_PICK_黄色迅猛龙巢穴|r。如果没有 |cRXP_ENEMY_赤鳞镰爪龙|r 掉落的 |T132914:0|t[赤鳞迅猛龙的羽毛]，就再击杀一些
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 905,2 --Visit Yellow Raptor Nest (1)
    .collect 5165,3,905,7,3
    .mob 赤鳞镰爪龙
step
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_赤鳞镰爪龙|r，并拾取它们掉落的 |cRXP_LOOT_角|r
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob 赤鳞镰爪龙
step
    #label LostmyWife
    .goto The Barrens,49.33,50.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t调查 |cRXP_FRIENDLY_血肉模糊的尸体|r
    .complete 4921,1 --Find Mankrik's Wife (1)
    .target 血肉模糊的尸体
    .skipgossip
step
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_雷角蜥蜴|r，并拾取 |cRXP_LOOT_雷霆蜥蜴的角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴
step
    #label LakotaMani1
    #completewith CampTArrive
    .goto The Barrens,45.14,52.82,0
    .goto The Barrens,45.93,49.08,0
    .goto The Barrens,47.43,51.37,0
    .goto The Barrens,50.10,53.34,0
	>>击杀 |cRXP_ENEMY_拉克塔曼尼|r，并拾取 |T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r]
    >>|cRXP_WARN_使用 |T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r] 接受任务|r
    >>|cRXP_WARN_它有4个刷新点（地图上已标记）|r
    >>|cRXP_WARN_如果找不到它，请跳过此步骤|r
	.collect 5099,1,883 --Collect Hoof of Lakota'Mani
	.accept 883 >>接任务：拉克塔曼尼
    .use 5099
    .unitscan 拉克塔曼尼
step
    #optional
    #completewith CampTArrive
    >>击杀 |cRXP_ENEMY_雷角蜥蜴|r，并拾取 |cRXP_LOOT_雷霆蜥蜴的角|r；这项任务不必现在完成
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴
step << Hunter
    #season 2
    #completewith next
    +|cRXP_WARN_你需要先学会|r |T135813:0|t[献祭陷阱] |cRXP_WARN_或其他任意陷阱，才能获得此符文|r
step << Hunter
    #season 2
    #loop
    .goto The Barrens,43.12,57.37,0
    .goto The Barrens,44.60,55.51,40,0
    .goto The Barrens,44.05,56.20,40,0
    .goto The Barrens,43.12,57.37,40,0
    .line The Barrens,44.60,55.51,44.60,55.51,43.12,57.37
    >>将 |T135813:0|t[献祭陷阱] 放在 |cRXP_ENEMY_巡游中的猎豹|r 的巡逻路线上，以移除它的Buff
    >>击杀它，并拾取 |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r]
    .collect 208701,1 --Rune of Beast Mastery (1)
    .mob 巡游中的猎豹
    .train 410110,1
step << Hunter
    #season 2
    .train 410110 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r] |cRXP_WARN_学习|r |T132270:0|t[野兽控制]
    .use 208701
    .itemcount 208701,1
step
    #label CampTArrive
    #completewith next
    .goto The Barrens,45.23,58.41,120 >> 前往陶拉祖营地
    .subzoneskip 378
step
    #requires CampTArrive
    #label SetCampTaurajoHS
    .goto The Barrens,45.58,59.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比鲁拉|r 对话
    .home >>将炉石绑定在陶拉祖营地
    .target 旅店老板比鲁拉
    .bindlocation 378
    .isQuestAvailable 1093
step
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r 对话
    .turnin 883 >>交任务：拉克塔曼尼
    .target 乔恩·星眼
    .isOnQuest 883
step
    .goto The Barrens,44.55,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_碎牙|r 对话
    .accept 878 >>接任务：野猪人的内战
    .target 碎牙
step
    #optional
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨|r 交谈
    .fp Camp Taurajo >> 开通陶拉祖营地飞行点 << !Tauren
    .target 欧姆萨·雷角
    .isOnQuest 5724
    .dungeon RFC
step
    #optional
    #completewith RFCTurninsTB2
    .goto Mulgore,68.68,60.34,120,0
    .zone Mulgore >>进入莫高雷
    .dungeon RFC
step
    #optional
    #completewith RFCTurninsTB2
    .goto Thunder Bluff,31.78,65.92
    .zone Thunder Bluff >>乘升降机进入雷霆崖
    >>|cRXP_WARN_如果已解锁雷霆崖的飞行点，可以直接飞过去|r
    .dungeon RFC
step
    #optional
    #completewith RFCTurninsTB2
    .goto Thunder Bluff,69.88,30.90,80 >> 前往长者高地
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC
step
    #optional
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5724 >> 交任务：归还背包
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC
step
    #optional
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5724 >> 交任务：归还背包
    .target 拉哈罗
    .isOnQuest 5724
    .dungeon RFC
step
    #optional
    #label RFCTurninsTB2
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .isQuestComplete 5723
    .dungeon RFC
step
    #optional
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 对话
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .zoneskip Thunder Bluff,1
    .dungeon RFC
step
    #completewith Xroadsturnins2
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨|r 交谈
    .fp Camp Taurajo >> 开通陶拉祖营地飞行点 << !Tauren
    .fly Crossroads >>飞往十字路口
    .target 欧姆萨·雷角
    .zoneskip The Barrens,1
    .subzoneskip 380
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .turnin 848 >> 交任务：菌类孢子
    .target 药剂师赫布瑞姆
    .isQuestComplete 848
step
    #label Xroadsturnins2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_曼科里克|r、|cRXP_FRIENDLY_图加·符文图腾|r、|cRXP_FRIENDLY_瑟格拉·黑棘|r 和 |cRXP_FRIENDLY_加兹罗格|r 对话
    .turnin 4921 >>交任务：在战斗中失踪
    .target +曼科里克
    .goto The Barrens,51.95,31.58
    .turnin 877 >>交任务：死水绿洲
    .accept 880 >>接任务：变异的生物
    .target +图加·符文图腾
    .goto The Barrens,52.26,31.93
    .turnin 905 >>交任务：狂暴的镰爪龙
    .accept 3261 >>接任务：乔恩·星眼
    .target +瑟格拉·黑棘
    .goto The Barrens,52.24,31.01
    .turnin 3281 >>交任务：被偷走的银币
    .target +加兹罗格
    .goto The Barrens,51.93,30.32
step
    .destroy 5165 >>|cRXP_WARN_摧毁|r |T132914:0|t[赤鳞迅猛龙的羽毛] |cRXP_WARN_（背包中剩余的全部）|r
    .itemcount 5165,1
step << Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并从他那里购买|r |T134410:0|t[中型箭袋] |cRXP_BUY_。|r
    .collect 11362,1,1062,1 --Medium Quiver (1)
    .collect 2515,2200,1062,1 --Sharp Arrow (2200)
    .target 阿瑟罗克
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 851 >>交任务：狂热的维罗戈
    .accept 852 >>接任务：赫兹鲁尔·血印
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855
step
    #xprate <1.5
    #label Leaders
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 851 >>交任务：狂热的维罗戈
    .accept 852 >>接任务：赫兹鲁尔·血印
    .target 雷戈萨·死门
step
    #xprate >1.49
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 850 >>交任务：科卡尔首领
    .target 雷戈萨·死门
step
    #xprate <1.5
    #completewith Hezrul
    .subzone 387 >> 前往甜水绿洲
    .isQuestTurnedIn 851
step
    #optional
    #xprate <1.5
    #completewith Hezrul
    >>寻找 |cRXP_ENEMY_赫兹鲁尔·血印|r 时，击杀 |cRXP_ENEMY_绿洲钳嘴龟|r，并拾取它们的 |cRXP_LOOT_龟壳|r
    .complete 880,1 --Altered Snapjaw Shell (8)
    .mob 绿洲钳嘴龟
step
    #optional
    #xprate <1.5
    #completewith next
    >>击杀绿洲周围的 |cRXP_ENEMY_科卡尔|r，并拾取它们掉落的 |cRXP_LOOT_护腕|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔战士
    .mob 科卡尔驯犬者
    .mob 科卡尔掠夺者
    .isOnQuest 855
step
    #xprate <1.5
    #loop
    #label Hezrul
    .goto The Barrens,45.64,38.16,0
    .goto The Barrens,45.64,38.16,50,0
    .goto The Barrens,45.84,37.86,50,0
    .goto The Barrens,45.78,37.41,50,0
    .goto The Barrens,45.95,37.11,50,0
    .goto The Barrens,45.93,36.91,50,0
    .goto The Barrens,46.14,36.85,50,0
    .goto The Barrens,46.19,36.88,50,0
    .goto The Barrens,46.28,36.86,50,0
    .goto The Barrens,46.46,37.17,50,0
    .goto The Barrens,46.58,37.31,50,0
    .goto The Barrens,46.63,37.93,50,0
    .goto The Barrens,46.75,38.39,50,0
    .goto The Barrens,47.27,38.98,50,0
    .goto The Barrens,47.47,39.27,50,0
    .goto The Barrens,48.20,39.57,50,0
    .goto The Barrens,48.40,39.58,50,0
    .goto The Barrens,48.60,39.51,50,0
    .goto The Barrens,48.54,39.96,50,0
    .goto The Barrens,48.58,40.52,50,0
    .goto The Barrens,48.27,40.82,50,0
    .goto The Barrens,48.06,40.82,50,0
    .goto The Barrens,47.86,41.13,50,0
    .goto The Barrens,47.49,41.33,50,0
    .goto The Barrens,47.34,41.61,50,0
    .goto The Barrens,47.22,41.64,50,0
    .goto The Barrens,46.85,42.05,50,0
    .goto The Barrens,46.56,41.93,50,0
    .goto The Barrens,46.27,41.76,50,0
    .goto The Barrens,46.03,41.15,50,0
    .goto The Barrens,45.86,41.32,50,0
    .goto The Barrens,46.09,40.98,50,0
    .goto The Barrens,46.08,40.68,50,0
    .goto The Barrens,45.71,40.56,50,0
    .goto The Barrens,45.64,38.16,50,0
    >>找到并击杀 |cRXP_ENEMY_赫兹鲁尔·血印|r，拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_ENEMY_赫兹鲁尔|r |cRXP_WARN_会在湖边巡逻|r
    .complete 852,1 --Hezrul's Head
    .unitscan 赫兹鲁尔·血印
    .isQuestTurnedIn 851
step
    #xprate <1.5
    .goto The Barrens,45.64,38.16,0
    .goto The Barrens,45.64,38.16,50,0
    .goto The Barrens,45.84,37.86,50,0
    .goto The Barrens,45.78,37.41,50,0
    .goto The Barrens,45.95,37.11,50,0
    .goto The Barrens,45.93,36.91,50,0
    .goto The Barrens,46.14,36.85,50,0
    .goto The Barrens,46.19,36.88,50,0
    .goto The Barrens,46.28,36.86,50,0
    .goto The Barrens,46.46,37.17,50,0
    .goto The Barrens,46.58,37.31,50,0
    .goto The Barrens,46.63,37.93,50,0
    .goto The Barrens,46.75,38.39,50,0
    .goto The Barrens,47.27,38.98,50,0
    .goto The Barrens,47.47,39.27,50,0
    .goto The Barrens,48.20,39.57,50,0
    .goto The Barrens,48.40,39.58,50,0
    .goto The Barrens,48.60,39.51,50,0
    .goto The Barrens,48.54,39.96,50,0
    .goto The Barrens,48.58,40.52,50,0
    .goto The Barrens,48.27,40.82,50,0
    .goto The Barrens,48.06,40.82,50,0
    .goto The Barrens,47.86,41.13,50,0
    .goto The Barrens,47.49,41.33,50,0
    .goto The Barrens,47.34,41.61,50,0
    .goto The Barrens,47.22,41.64,50,0
    .goto The Barrens,46.85,42.05,50,0
    .goto The Barrens,46.56,41.93,50,0
    .goto The Barrens,46.27,41.76,50,0
    .goto The Barrens,46.03,41.15,50,0
    .goto The Barrens,45.86,41.32,50,0
    .goto The Barrens,46.09,40.98,50,0
    .goto The Barrens,46.08,40.68,50,0
    .goto The Barrens,45.71,40.56,50,0
    .goto The Barrens,45.64,38.16,50,0
    >>击杀绿洲周围的 |cRXP_ENEMY_科卡尔|r，并拾取它们掉落的 |cRXP_LOOT_护腕|r
    >>|cRXP_WARN_如果目前掉落不多，可以跳过此任务|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔战士
    .mob 科卡尔驯犬者
    .mob 科卡尔掠夺者
    .itemcount 5030,5 --Centaur Bracers (5)
    .isOnQuest 855
step << Druid
    #season 2
    .goto The Barrens,48.32,40.25
    >>打开地上的 |cRXP_PICK_空荡荡的钳嘴龟的巢|r，获取 |T134419:0|t[|cRXP_FRIENDLY_割伤符文|r]
    .collect 208687,1 --Unbalanced Idol (1)
    .train 416049,1
step << Druid
    #season 2
    .train 416049 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_割伤符文|r] |cRXP_WARN_学习|r |T132131:0|t[割伤]
    .use 208687 --Rune of Lacerate (1)
    .itemcount 208687,1
step
    #optional
    #xprate <1.5
    #completewith CounterattackComplete
    .abandon 855 >> 放弃半人马护腕任务，因为之前拾取的数量不够，继续完成不划算
    .itemcount 5030,<5 --Centaur Bracers (5)
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 852 >>交任务：赫兹鲁尔·血印
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 852
    .isQuestComplete 855
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 852 >>交任务：赫兹鲁尔·血印
    .target 雷戈萨·死门
    .isQuestComplete 852
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855
step
    #xprate <1.5
    #completewith CounterattackComplete
    +|cRXP_WARN_下一个任务难度很高，建议组队。你可以利用任务发布者所在的建筑，绕圈风筝督军克罗姆扎|r
    +|cRXP_WARN_如果无法完成此任务，就跳过它；之后等级更高时还有机会再做|r
    .isQuestTurnedIn 852
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 4021 >>接任务：人马无双！
    .target 雷戈萨·死门
    --.timer 183,Warlord Krom'zar Spawn
    .isQuestTurnedIn 852
    --timer is random, generally somewhere between 120-210 seconds
step
    #xprate <1.5
    #label CounterattackComplete
    .goto The Barrens,44.48,28.15
    >>督军克罗姆扎出现后，击杀 |cRXP_ENEMY_督军克罗姆扎|r，并拾取他掉在地上的 |cRXP_PICK_旗帜|r
    >>|cRXP_WARN_小心！他是强力精英，身边至少有两名|r |cRXP_ENEMY_科卡尔|r |cRXP_WARN_护卫|r
    >>|cRXP_WARN_他最多可能需要3分钟才会刷新|r
    .complete 4021,1 --Piece of Krom'zar's Banner (1)
    .unitscan 督军克罗姆扎
    .isOnQuest 4021
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 4021 >>交任务：人马无双！
    .target 雷戈萨·死门
    .isQuestComplete 4021
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 4021 >>交任务：人马无双！
    .target 雷戈萨·死门
    .isQuestComplete 4021
step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855
step
    #optional
    #xprate <1.5
    #completewith StonetalonPickups
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
step
    #xprate <1.5
    #loop
    .goto The Barrens,40.28,15.49,0
    .goto The Barrens,40.28,15.49,40,0
    .goto The Barrens,39.50,14.68,40,0
    .goto The Barrens,39.47,13.24,40,0
    .goto The Barrens,38.94,12.80,40,0
    .goto The Barrens,38.18,12.56,40,0
    .goto The Barrens,37.96,13.52,40,0
    .goto The Barrens,38.62,13.95,40,0
    .goto The Barrens,38.18,14.62,40,0
    .goto The Barrens,38.14,15.59,40,0
    .goto The Barrens,37.29,15.68,40,0
    .goto The Barrens,37.24,16.26,40,0
    .goto The Barrens,37.67,16.34,40,0
    .goto The Barrens,38.35,17.08,40,0
    .goto The Barrens,38.83,17.71,40,0
    .goto The Barrens,39.37,17.21,40,0
    .goto The Barrens,39.87,16.66,40,0
    .goto The Barrens,40.15,15.98,40,0
    >>击杀 |cRXP_ENEMY_巫翼杀戮者|r，并拾取它们的 |cRXP_LOOT_指环|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_巫翼杀戮者|r 会施放|r |T135358:0|t[斩杀] |cRXP_WARN_（当你的生命值低于20%时会造成大量伤害）；|cRXP_ENEMY_巫翼伏击者|r 处于|r |T132320:0|t[潜行] |cRXP_WARN_状态，并在附近巡逻|r
    >>|cRXP_WARN_小心|r |cRXP_ENEMY_巫翼伏击者|r|cRXP_WARN_。它们处于潜行状态，并在该区域巡逻|r
    .complete 875,1 --Harpy Lieutenant Ring (6)
    .mob 巫翼杀戮者
    .mob 巫翼伏击者
    .isOnQuest 875
step
    #completewith next
    .goto The Barrens,35.26,27.88,30 >> 前往 |cRXP_FRIENDLY_希雷斯·碎石|r 处
    .zoneskip Stonetalon Mountains
step
    #map Stonetalon Mountains
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希雷斯|r 和 |cRXP_FRIENDLY_玛卡巴|r 交谈
    .turnin 1061 >> 交任务：石爪之灵
    .accept 1062 >> 接任务：地精侵略者
    .target +希雷斯·碎石
    .goto The Barrens,35.26,27.88
    .accept 6548 >> 接任务：为我的村庄复仇
    .target +玛卡巴·扁蹄
    .goto The Barrens,35.19,27.79
    .maxlevel 20 << !Druid
step
    #optional
    #map Stonetalon Mountains
    #label StonetalonPickups
    .goto The Barrens,35.26,27.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希雷斯|r 交谈
    .turnin 1061 >> 交任务：石爪之灵
    .accept 1062 >> 接任务：地精侵略者
    .target 希雷斯·碎石
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupweight 500
#classic
#tbc
#xprate <1.99
<< Horde
#name 17-22 Stonetalon/Barrens/Ashenvale
#version 11
#group RestedXP Horde 1-22
#groupid RXP-SRGCE-H1
#next RestedXP Horde 22-30\22-24 Hillsbrad
#displayname 18-22 石爪山脉/贫瘠之地/灰谷 << Undead/Troll Rogue/Orc Rogue/Orc Warlock/Troll Mage/Troll Priest
#displayname 17-22 石爪山脉/贫瘠之地/灰谷

step << Druid
    #season 2
    #completewith next
    >>击杀|cRXP_ENEMY_恐怖图腾牛头人|r，拾取 |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .collect 210534,1 -- Idol of the Wild (1)
    .train 410021,1

step
    #loop
    .goto Stonetalon Mountains,80.62,89.99,0
    .goto Stonetalon Mountains,80.62,89.99,40,0
    .goto Stonetalon Mountains,79.79,88.75,40,0
    .goto Stonetalon Mountains,81.19,87.56,40,0
    .goto Stonetalon Mountains,81.70,86.44,40,0
    .goto Stonetalon Mountains,82.26,86.10,40,0
    .goto Stonetalon Mountains,82.55,85.22,40,0
    .goto Stonetalon Mountains,83.64,85.02,40,0
    .goto Stonetalon Mountains,84.20,85.20,40,0
    .goto Stonetalon Mountains,83.80,86.38,40,0
    .goto Stonetalon Mountains,83.25,87.23,40,0
    .goto Stonetalon Mountains,82.33,89.73,40,0
    .goto Stonetalon Mountains,82.33,90.43,40,0
    .goto Stonetalon Mountains,81.34,90.78,40,0
    >>击杀该区域的|cRXP_ENEMY_恐怖图腾恶徒|r和|cRXP_ENEMY_恐怖图腾佣兵|r
    .complete 6548,1 --Kill Grimtotem Ruffian (x8)
    .mob +恐怖图腾恶徒
    .complete 6548,2 --Kill Grimtotem Mercenary (x6)
    .mob +恐怖图腾佣兵
    .isOnQuest 6548

step << Druid
    #season 2
    #loop
    .goto Stonetalon Mountains,80.62,89.99,0
    .goto Stonetalon Mountains,80.62,89.99,40,0
    .goto Stonetalon Mountains,79.79,88.75,40,0
    .goto Stonetalon Mountains,81.19,87.56,40,0
    .goto Stonetalon Mountains,81.70,86.44,40,0
    .goto Stonetalon Mountains,82.26,86.10,40,0
    .goto Stonetalon Mountains,82.55,85.22,40,0
    .goto Stonetalon Mountains,83.64,85.02,40,0
    .goto Stonetalon Mountains,84.20,85.20,40,0
    .goto Stonetalon Mountains,83.80,86.38,40,0
    .goto Stonetalon Mountains,83.25,87.23,40,0
    .goto Stonetalon Mountains,82.33,89.73,40,0
    .goto Stonetalon Mountains,82.33,90.43,40,0
    .goto Stonetalon Mountains,81.34,90.78,40,0
    >>击杀|cRXP_ENEMY_恐怖图腾|r，拾取 |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .collect 210534,1 -- Idol of the Wild (1)
    .mob 恐怖图腾佣兵
    .mob 恐怖图腾蛮兵
    .mob 恐怖图腾巫师
    .mob 恐怖图腾恶徒
    .train 410021,1

step << Druid
    #season 2
    #completewith AvengeVillageTurnin
    .equip 18,210534 >> |cRXP_WARN_装备|r |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .use 210534
    .itemcount 210534,1
    .train 410021,1

step << Druid
    #season 2
    #completewith next
    >>|cRXP_WARN_对10只不同的友方野兽施放|r |T136085:0|t[愈合]|cRXP_WARN_或|r |T136041:0|t[治疗之触]|cRXP_WARN_，例如猎人宠物、熊形态德鲁伊或幽灵狼形态萨满|r
    .train 410021 >> |cRXP_WARN_使用|r |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]|cRXP_WARN_学习|r |T132143:0|t[狂野打击]
    .itemcount 210534,1

step
    #map Stonetalon Mountains
    .goto The Barrens,35.19,27.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .turnin 6548 >> 交任务：为我的村庄复仇
    .accept 6629 >> 接任务：杀死格鲁迪格·暗云
    .target 玛卡巴·扁蹄
    .isQuestComplete 6548

step
    #optional
    #label AvengeVillageTurnin
    #map Stonetalon Mountains
    .goto The Barrens,35.19,27.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .accept 6629 >> 接任务：杀死格鲁迪格·暗云
    .target 玛卡巴·扁蹄
    .isQuestTurnedIn 6548

step
    #completewith next
    .goto Stonetalon Mountains,75.89,87.49,30 >>沿着小路去篝火处
    .isQuestTurnedIn 6548

step
    .goto Stonetalon Mountains,73.65,86.13
    >>击杀|cRXP_ENEMY_格鲁迪格·暗云|r和|cRXP_ENEMY_恐怖图腾蛮兵|r
    >>|cRXP_WARN_务必击杀全部六名|r|cRXP_ENEMY_恐怖图腾蛮兵|r|cRXP_WARN_，再开始里面的任务|r
    .complete 6629,1 --Kill Grundig Darkcloud (x1)
    .mob +格鲁迪格·暗云
    .complete 6629,2 --Kill Grimtotem Brute (x6)
    .mob +恐怖图腾蛮兵
    .isQuestTurnedIn 6548

step
    .goto Stonetalon Mountains,73.48,85.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡雅|r交谈
    .accept 6523,1 >> 接任务：保护卡雅
    .target 卡雅·扁蹄
    .isQuestTurnedIn 6548

step
    .goto Stonetalon Mountains,71.82,86.79,40,0
    .goto Stonetalon Mountains,71.83,89.79,40,0
    .goto Stonetalon Mountains,76.73,90.85
    >>护送|cRXP_FRIENDLY_卡雅·扁蹄|r，并始终待在她身边
    >>|cRXP_WARN_小心！三名|r|cRXP_ENEMY_恐怖图腾|r|cRXP_WARN_会在你抵达阿帕拉耶营地的篝火时刷新|r
    .complete 6523,1 --Kaya Escorted to Camp Aparaje
    .target 卡雅·扁蹄
    .isQuestTurnedIn 6548

step
    .goto Stonetalon Mountains,71.25,95.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛吉拉|r交谈
    .accept 6461 >> 接任务：盗窃的蜘蛛
    .target 辛吉拉

step << Priest/Mage/Warlock
    #completewith next
    .goto Stonetalon Mountains,68.59,88.34,100,0
    .goto Stonetalon Mountains,64.95,83.88,100,0
    .goto Stonetalon Mountains,61.47,81.51,100,0
    >>击杀你见到的所有|cRXP_ENEMY_深苔爬行者|r
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob 深苔爬行者
    .group 0 << Priest/Mage

step << Warlock/Priest/Mage
    .goto Stonetalon Mountains,59.08,75.70
    >>点击|cRXP_PICK_通缉告示|r
    .accept 6284 >>接任务：贝瑟莱斯
    .group << Priest/Mage

step << Warlock/Priest/Mage
    #completewith Besseleth1
    >>击杀|cRXP_ENEMY_深苔毒蜘蛛|r和|cRXP_ENEMY_深苔爬行者|r
    .complete 6461,2 --Kill Deepmoss Venomspitter (x7)
    .mob +深苔毒蜘蛛
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob +深苔爬行者
    .group 0 << Priest/Mage

step << Warlock/Priest/Mage
    #completewith next
    >>在树附近拾取|cRXP_PICK_深苔蜘蛛的卵|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_深苔幼蛛|r|cRXP_WARN_有几率召唤一只22级的|r|cRXP_ENEMY_深苔雌蜘蛛|r
    .complete 1069,1 --Collect Deepmoss Egg (x15)
    .group 0 << Priest/Mage

step << Warlock/Priest/Mage
    #label Besseleth1
    #loop
    .goto Stonetalon Mountains,54.80,71.95,0
    .goto Stonetalon Mountains,51.89,73.81,50,0
    .goto Stonetalon Mountains,52.46,71.67,50,0
    .goto Stonetalon Mountains,54.80,71.95,50,0
    >>击杀|cRXP_ENEMY_贝瑟莱斯|r，拾取掉落的|cRXP_LOOT_贝瑟莱斯的牙齿|r
    >>|cRXP_WARN_清理|r|cRXP_ENEMY_贝瑟莱斯|r|cRXP_WARN_周围的敌人。小心她会用蛛网缠住你；持续施放恐惧控制她，同时用持续伤害技能输出|r << Warlock
    >>|cRXP_WARN_这是可选任务。无法完成时可以先跳过，之后再回来尝试|r << Warlock
    .complete 6284,1 --Collect Besseleth's Fang (x1)
    .unitscan 贝瑟莱斯
    .group 2 << Priest/Mage

step << Warlock/Priest/Mage
    .goto Stonetalon Mountains,54.99,76.03
    >>击杀|cRXP_ENEMY_深苔爬行者|r
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob 深苔爬行者
    .group 0 << Priest/Mage

step << !Warlock
    .goto Stonetalon Mountains,67.38,86.99,80,0
    .goto Stonetalon Mountains,61.44,81.74,80,0
    .goto Stonetalon Mountains,58.44,75.90,40,0
    .goto Stonetalon Mountains,54.99,76.03
    >>击杀|cRXP_ENEMY_深苔爬行者|r
    >>|cRXP_WARN_保留|r |T134339:0|t[小毒囊]|cRXP_WARN_（你拾取到的全部）|r << Rogue
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob 深苔爬行者

step
    #completewith next
    .goto Stonetalon Mountains,51.40,61.14,50,0
    .goto Stonetalon Mountains,49.96,61.04
    .subzone 460 >>前往烈日石居（石爪山脉）

step
    .goto Stonetalon Mountains,47.47,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板杰卡|r交谈
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .target 旅店老板杰卡
    .isQuestAvailable 1093

step
    .goto Stonetalon Mountains,47.61,61.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_基达|r交谈
    .vendor >> |cRXP_BUY_如有出售，请向她购买|r |T134831:0|t[治疗药水]|cRXP_BUY_。|r << !Warrior
    .vendor >> |cRXP_BUY_如有出售，请向她购买|r |T134831:0|t[治疗药水]|cRXP_BUY_和|r |T134413:0|t[活根草]|cRXP_BUY_。|r << Warrior
    .target 基达
    .isQuestAvailable 1093

step
    .goto Stonetalon Mountains,47.20,61.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马格兰|r交谈
    .turnin 6284 >> 交任务：贝瑟莱斯
    .target 马格兰
    .isQuestComplete 6284

step
    #label SRRFP
    .goto Stonetalon Mountains,45.13,59.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔姆|r交谈
    .fp Sun Rock Retreat >> 获取烈日石居飞行点
    .target 萨尔姆
    .subzoneskip 460,1

step
    #completewith next
    .goto Stonetalon Mountains,58.99,62.60,15 >> 前往|cRXP_FRIENDLY_菲兹克斯|r

step
    .goto Stonetalon Mountains,58.99,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹克斯|r交谈
    .turnin 1483 >> 交任务：菲兹克斯
    .accept 1093 >> 接任务：超级收割机6000
    .target 菲兹克斯

step
    #completewith Windshear
    >>在树附近拾取|cRXP_PICK_深苔蜘蛛的卵|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_深苔幼蛛|r|cRXP_WARN_有几率召唤一只22级的|r|cRXP_ENEMY_深苔雌蜘蛛|r
    .complete 1069,1 --Collect Deepmoss Egg (x15)

step
    #loop
    .goto Stonetalon Mountains,59.25,61.55,0
    .goto Stonetalon Mountains,59.25,61.55,50,0
    .goto Stonetalon Mountains,60.37,60.10,50,0
    .goto Stonetalon Mountains,61.34,59.15,50,0
    .goto Stonetalon Mountains,61.15,57.85,50,0
    .goto Stonetalon Mountains,61.41,56.77,50,0
    .goto Stonetalon Mountains,62.21,58.55,50,0
    .goto Stonetalon Mountains,63.12,60.02,50,0
    .goto Stonetalon Mountains,64.69,60.03,50,0
    .goto Stonetalon Mountains,62.76,61.69,50,0
    .goto Stonetalon Mountains,62.50,62.92,50,0
    .goto Stonetalon Mountains,62.48,64.15,50,0
    .goto Stonetalon Mountains,61.85,66.07,50,0
    .goto Stonetalon Mountains,60.71,66.12,50,0
    .goto Stonetalon Mountains,60.96,63.99,50,0
    .goto Stonetalon Mountains,60.25,63.21,50,0
    >>击杀|cRXP_ENEMY_深苔毒蜘蛛|r
    >>|cRXP_WARN_保留|r |T134339:0|t[小毒囊]|cRXP_WARN_（你拾取到的全部）|r << Rogue
    .complete 6461,2 --Kill Deepmoss Venomspitter (x7)
    .mob 深苔毒蜘蛛

step << Troll Warrior/Orc Warrior/Tauren Warrior
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈，并向他购买|r |T135157:0|t[占卜法杖]|cRXP_BUY_。|r
    .collect 928,1,899,1 --Collect Long Staff (1)
    .money <0.9860
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2

step << Troll Warrior/Orc Warrior/Tauren Warrior
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1

step << Undead Warrior
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维尼克斯|r交谈
    .vendor >>|cRXP_BUY_购买|r |T135329:0|t[刽子手之剑]|cRXP_BUY_。|r
    >>|cRXP_WARN_如果没有出售，就改买|r |T135280:0|t[微光重剑]|cRXP_WARN_。|r
    .money <1.5024
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8

step << Undead Warrior
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135329:0|t[刽子手之剑]
    .use 4818
    .itemcount 4818,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .xp <19,1

step << Undead Warrior
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.8
    .xp <21,1

step << Shaman
    #season 0
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈，并向他购买|r |T135157:0|t[占卜法杖]|cRXP_BUY_。|r
    .collect 928,1,899,1 --Collect Long Staff (1)
    .money <0.9860
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2

step << Shaman
    #season 0
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1

step << Shaman
    #season 2
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈，并向他购买|r |T133476:0|t[尖刺流星锤]|cRXP_BUY_。|r
    .collect 925,1,899,1 --Collect Flail (1)
    .money <0.7797
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8

step << Shaman
    #season 2
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T133476:0|t[尖刺流星锤]
    .use 925
    .itemcount 925,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
    .xp <20,1

step << Rogue
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈，并向他购买|r |T135324:0|t[长剑]|cRXP_BUY_。|r
    .collect 923,1,899,1 --Collect Longsword (1)
    .money <0.8743
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1

step << Rogue
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
    .xp <21,1

step
    #label Windshear
    .subzone 461 >> 前往狂风峭壁
    .isOnQuest 1093

step
    #completewith next
    >>击杀|cRXP_ENEMY_风险投资公司樵夫|r
    .complete 1062,1 --Kill Venture Co. Logger (x15)
    .mob 风险投资公司樵夫

step
    #label BluePrints
    #loop
    .goto Stonetalon Mountains,62.8,53.7,0
    .goto Stonetalon Mountains,62.8,53.7,100,0
    .goto Stonetalon Mountains,61.7,51.5,100,0
    .goto Stonetalon Mountains,66.8,45.3,100,0
    .goto Stonetalon Mountains,71.7,49.9,100,0
    .goto Stonetalon Mountains,74.3,54.7,100,0
    >>击杀|cRXP_ENEMY_风险投资公司操作员|r，拾取掉落的|cRXP_LOOT_蓝图|r
    .complete 1093,1 --Collect Super Reaper 6000 Blueprints (x1)
    .mob 风险投资公司操作员

step
    #loop
    .goto Stonetalon Mountains,61.50,55.12,0
    .goto Stonetalon Mountains,61.50,55.12,50,0
    .goto Stonetalon Mountains,60.48,55.10,50,0
    .goto Stonetalon Mountains,59.80,53.69,50,0
    .goto Stonetalon Mountains,59.53,52.52,50,0
    .goto Stonetalon Mountains,60.80,51.23,50,0
    .goto Stonetalon Mountains,62.06,54.39,50,0
    .goto Stonetalon Mountains,62.63,55.35,50,0
    .goto Stonetalon Mountains,63.63,54.42,50,0
    .goto Stonetalon Mountains,65.42,54.15,50,0
    .goto Stonetalon Mountains,66.83,54.92,50,0
    .goto Stonetalon Mountains,68.64,54.03,50,0
    .goto Stonetalon Mountains,69.86,53.53,50,0
    .goto Stonetalon Mountains,70.34,56.41,50,0
    .goto Stonetalon Mountains,67.90,56.96,50,0
    .goto Stonetalon Mountains,66.25,56.64,50,0
    .goto Stonetalon Mountains,65.29,57.14,50,0
    .goto Stonetalon Mountains,64.27,57.63,50,0
    >>击杀|cRXP_ENEMY_风险投资公司樵夫|r
    .complete 1062,1 --Kill Venture Co. Logger (x15)
    .mob 风险投资公司樵夫

step
    #loop
    .goto Stonetalon Mountains,61.41,56.77,0
    .goto Stonetalon Mountains,59.25,61.55,30,0
    .goto Stonetalon Mountains,60.37,60.10,30,0
    .goto Stonetalon Mountains,61.34,59.15,30,0
    .goto Stonetalon Mountains,61.15,57.85,30,0
    .goto Stonetalon Mountains,61.41,56.77,30,0
    .goto Stonetalon Mountains,62.21,58.55,30,0
    .goto Stonetalon Mountains,63.12,60.02,30,0
    .goto Stonetalon Mountains,64.69,60.03,30,0
    .goto Stonetalon Mountains,62.76,61.69,30,0
    .goto Stonetalon Mountains,62.50,62.92,30,0
    .goto Stonetalon Mountains,62.48,64.15,30,0
    .goto Stonetalon Mountains,61.85,66.07,30,0
    .goto Stonetalon Mountains,60.71,66.12,30,0
    .goto Stonetalon Mountains,60.96,63.99,30,0
    .goto Stonetalon Mountains,60.25,63.21,30,0
    >>在树附近拾取|cRXP_PICK_深苔蜘蛛的卵|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_深苔幼蛛|r|cRXP_WARN_有几率召唤一只22级的|r|cRXP_ENEMY_深苔雌蜘蛛|r
    .complete 1069,1 --Collect Deepmoss Egg (x15)

step
    #optional
    #completewith next
    +|cRXP_WARN_如果有超过15个|cRXP_LOOT_深苔蜘蛛的卵|r|cRXP_WARN_，按住Shift并点击，将多余的卵分成一组，再摧毁它们|r

step
    .goto Stonetalon Mountains,58.99,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹克斯|r交谈
    .turnin 1093 >> 交任务：超级收割机6000
    .accept 1094 >> 接任务：新的指示
    .target 菲兹克斯

step
    #loop
    .goto Stonetalon Mountains,59.04,73.01,0
    .goto Stonetalon Mountains,60.83,71.84,80,0
    .goto Stonetalon Mountains,59.04,73.01,80,0
    .goto Stonetalon Mountains,60.36,76.28,80,0
    .goto Stonetalon Mountains,61.47,81.51,80,0
    .goto Stonetalon Mountains,64.95,83.88,80,0
    .goto Stonetalon Mountains,68.59,88.34,80,0
    .goto Stonetalon Mountains,59.04,73.01,80,0
    >>继续击杀|cRXP_ENEMY_深苔爬行者|r
    >>|cRXP_WARN_保留|r |T134339:0|t[小毒囊]|cRXP_WARN_（你拾取到的全部）|r << Rogue
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob 深苔爬行者

step << Druid
    #completewith DruidTraining2
    .cast 18960 >>|cRXP_WARN_施放|r |T135758:0|t[传送：月光林地]
    .zoneskip Moonglade

step << Druid
    .goto Moonglade,52.53,40.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 1430 >> 学习职业技能
    .target 洛甘纳尔
    .xp <18,1
    .xp >20,1

step << Druid
    #label DruidTraining2
    .goto Moonglade,52.53,40.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 768 >> 学习职业技能
    .target 洛甘纳尔
    .xp <20,1

step
    #completewith JornSkyseerTurnin
    .hs >> 使用炉石返回陶拉祖营地
    .use 6948
    .bindlocation 378,1
    .subzoneskip 378

step
    .goto The Barrens,45.58,59.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比鲁拉|r交谈
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .target 旅店老板比鲁拉
    .isOnQuest 3261

step
    #label JornSkyseerTurnin
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 3261 >>交任务：乔恩·星眼
    .accept 882 >>接任务：伊沙姆哈尔
    .target 乔恩·星眼

step
    #completewith LakotaMani2
    >>击杀|cRXP_ENEMY_雷角蜥蜴|r，拾取|cRXP_LOOT_角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴

step
    #completewith next
    >>击杀|cRXP_ENEMY_刺背野猪人|r，拾取掉落的|cRXP_LOOT_獠牙|r。保留拾取到的 |T134128:0|t[|cRXP_LOOT_血岩碎片|r]
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
    .goto The Barrens,45.14,52.82,0
    .goto The Barrens,45.93,49.08,0
    .goto The Barrens,47.43,51.37,0
    .goto The Barrens,50.10,53.34,0
    .goto The Barrens,45.14,52.82,80,0
    .goto The Barrens,45.93,49.08,80,0
    .goto The Barrens,47.43,51.37,80,0
    .goto The Barrens,50.10,53.34,80,0
    >>击杀|cRXP_ENEMY_拉克塔曼尼|r，拾取 |T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r]
    >>|cRXP_WARN_使用|T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r]开始任务|r
    >>|cRXP_WARN_他有4个刷新点（已在地图上标记）|r
    >>|cRXP_WARN_如果找不到他就跳过此步|r
    .collect 5099,1,883 --Collect Hoof of Lakota'Mani
    .accept 883 >>接任务：拉克塔曼尼
    .use 5099
    .unitscan 拉克塔曼尼

step
    #completewith next
    >>击杀|cRXP_ENEMY_雷角蜥蜴|r，拾取|cRXP_LOOT_角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴

step
    #loop
    .goto The Barrens,50.71,54.60,0
    .goto The Barrens,50.71,54.60,60,0
    .goto The Barrens,50.74,55.33,60,0
    .goto The Barrens,50.73,56.78,60,0
    .goto The Barrens,50.42,57.23,60,0
    .goto The Barrens,50.50,57.65,60,0
    .goto The Barrens,50.87,57.50,60,0
    .goto The Barrens,51.26,57.84,60,0
    .goto The Barrens,51.74,57.69,60,0
    .goto The Barrens,51.79,57.10,60,0
    .goto The Barrens,53.08,54.69,60,0
    .goto The Barrens,53.65,54.27,60,0
    .goto The Barrens,53.63,53.53,60,0
    .goto The Barrens,53.35,52.72,60,0
    .goto The Barrens,53.00,51.83,60,0
    .goto The Barrens,52.62,52.19,60,0
    .goto The Barrens,52.59,52.71,60,0
    .goto The Barrens,52.41,53.07,60,0
    .goto The Barrens,52.32,53.71,60,0
    .goto The Barrens,51.39,54.22,60,0
    >>击杀|cRXP_ENEMY_刺背野猪人|r，拾取掉落的|cRXP_LOOT_獠牙|r。保留拾取到的 |T134128:0|t[|cRXP_LOOT_血岩碎片|r]
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

step << Warlock/Shaman
    #loop
    .goto The Barrens,50.71,54.60,60,0
    .goto The Barrens,50.74,55.33,60,0
    .goto The Barrens,50.73,56.78,60,0
    .goto The Barrens,50.42,57.23,60,0
    .goto The Barrens,50.50,57.65,60,0
    .goto The Barrens,50.87,57.50,60,0
    .goto The Barrens,51.26,57.84,60,0
    .goto The Barrens,51.74,57.69,60,0
    .goto The Barrens,51.79,57.10,60,0
    .goto The Barrens,53.08,54.69,60,0
    .goto The Barrens,53.65,54.27,60,0
    .goto The Barrens,53.63,53.53,60,0
    .goto The Barrens,53.35,52.72,60,0
    .goto The Barrens,53.00,51.83,60,0
    .goto The Barrens,52.62,52.19,60,0
    .goto The Barrens,52.59,52.71,60,0
    .goto The Barrens,52.41,53.07,60,0
    .goto The Barrens,52.32,53.71,60,0
    .goto The Barrens,51.39,54.22,60,0
    .xp 19+11000 >> 刷怪至 11000+/21300 经验值
    --VV 1.5x Add 1.5x grind step

step
    #loop
    .goto The Barrens,50.88,52.96,0
    .goto The Barrens,50.88,52.96,50,0
    .goto The Barrens,50.06,52.78,50,0
    .goto The Barrens,49.35,53.74,50,0
    .goto The Barrens,49.54,55.08,50,0
    .goto The Barrens,49.03,56.24,50,0
    .goto The Barrens,49.72,56.13,50,0
    >>击杀|cRXP_ENEMY_雷角蜥蜴|r，拾取|cRXP_LOOT_角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴

step
    #completewith next
    >>击杀|cRXP_ENEMY_赤鳞镰爪龙|r，拾取掉落的|cRXP_LOOT_完整的迅猛龙角|r
    >>|cRXP_WARN_小心，它们会施放|r|T132152:0|t[痛击]|cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob 赤鳞镰爪龙

step
    #loop
    .goto The Barrens,53.98,51.68,0
    .goto The Barrens,53.98,51.68,50,0
    .goto The Barrens,54.10,50.58,50,0
    .goto The Barrens,53.85,49.76,50,0
    .goto The Barrens,54.32,49.38,50,0
    .goto The Barrens,54.82,49.00,50,0
    .goto The Barrens,55.23,47.96,50,0
    >>继续击杀|cRXP_ENEMY_平原陆行鸟|r，并拾取|cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟

step
    #loop
    .goto The Barrens,57.3,53.7,0
    .goto The Barrens,52.0,46.5,0
    .goto The Barrens,57.3,53.7,90,0
    .goto The Barrens,52.0,46.5,90,0
    >>继续击杀|cRXP_ENEMY_赤鳞镰爪龙|r，拾取掉落的|cRXP_LOOT_角|r
    >>|cRXP_WARN_小心，它们会施放|r|T132152:0|t[痛击]|cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob 赤鳞镰爪龙

step
    #completewith next
    >>击杀任意|cRXP_ENEMY_斑马|r，拾取|cRXP_LOOT_新鲜的斑马肉|r
    .collect 10338,1 --Collect Fresh Zhevra Carcass
    .mob 冲锋斑马

step
    #loop
    .goto The Barrens,55.59,43.39,0
    .goto The Barrens,55.59,43.39,40,0
    .goto The Barrens,55.09,43.00,40,0
    .goto The Barrens,55.03,42.21,40,0
    .goto The Barrens,55.47,41.51,40,0
    .goto The Barrens,55.99,42.00,40,0
    .goto The Barrens,56.15,42.53,40,0
    .goto The Barrens,56.01,43.40,40,0
    >>击杀湖中及周围的|cRXP_ENEMY_绿洲钳嘴龟|r，拾取掉落的|cRXP_LOOT_龟壳|r
    .complete 880,1 --Altered Snapjaw Shell (8)
    .mob 绿洲钳嘴龟

step << Shaman/Priest
    #season 2
    #loop
    .goto The Barrens,55.77,34.01,40,0 --Spawn 1
    .goto The Barrens,55.83,34.21,40,0
    .goto The Barrens,54.81,35.95,40,0 --Spawn 2
    .goto The Barrens,54.96,35.72,40,0
    .goto The Barrens,57.47,36.03,40,0 --Spawn 3
    .goto The Barrens,57.56,35.78,40,0
    .goto The Barrens,57.46,35.70,40,0
    .goto The Barrens,57.59,38.36,40,0 --Spawn 4
    .goto The Barrens,57.49,38.65,40,0
    .goto The Barrens,58.82,37.67,40,0 --Spawn 5
    .goto The Barrens,58.92,37.53,40,0
    .goto The Barrens,58.94,37.73,40,0
    >>施放|T136075:0|t[净化术]，目标为|cRXP_ENEMY_沙漠魅影|r，将其击杀并拾取|T134419:0|t|cRXP_LOOT_[地之符文]|r << Shaman
    >>施放|T135894:0|t[驱散魔法]，目标为|cRXP_ENEMY_沙漠魅影|r，将其击杀并拾取|T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言|r] << Priest
    .collect 208758,1 << Shaman --Earthen Rune (1)
    .collect 205932,1 << Priest-- Prophecy of a King's Demise (1)
    .unitscan 沙漠魅影
    .train 410107,1 << Shaman
    .train 402849,1 << Priest
    .train 370,3 << Shaman --Purge
    .train 527,3 << Priest --Dispel Magic
    --XX Respawns after 85s-170s

step
    #completewith next
    >>击杀任意|cRXP_ENEMY_斑马|r，拾取|cRXP_LOOT_新鲜的斑马肉|r
    .collect 10338,1 --Collect Fresh Zhevra Carcass
    .mob 冲锋斑马

step
    #label IshamuhalesFang
    .goto The Barrens,59.71,30.33
    .use 10338 >>在枯树处使用 |T134368:0|t[|cRXP_LOOT_新鲜的斑马肉|r]召唤|cRXP_ENEMY_伊沙姆哈尔|r，击杀它并拾取|cRXP_LOOT_尖牙|r
    >>|cRXP_WARN_斑马肉的有效期只有30分钟！|r
    .complete 882,1 --Ishamuhale's Fang (1)
    .mob 伊沙姆哈尔

step
    #completewith BootyTurnin
    .subzone 392 >> 前往棘齿城

step << Rogue
    .goto The Barrens,63.07,36.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卑鄙的维尼克斯|r交谈
    .turnin 2381 >>交任务：抢劫海盗
    .target 卑鄙的维尼克斯

step
    #label BootyTurnin
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 888 >>交任务：被窃的货物
    .target 加兹鲁维

step
    #sticky
    #completewith FlytoXroads
    #season 2
    .goto The Barrens,61.8,39.4
    >>|cRXP_WARN_如果有多余的|cRXP_LOOT_3金币|r，可以购买符文，出售者是|r|cRXP_FRIENDLY_格里兹比|r|cRXP_WARN_（位于棘齿城旅店）。自行判断是否买得起，以及符文是否适合你的职业；也可以稍后再来购买|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里兹比|r交谈
    .use 210822 << Priest
    .use 210820 << Paladin
    .use 210654 << Mage
    .use 210818 << Hunter
    .use 210817 << Druid
    .use 210825 << Warrior
    .use 210824 << Warlock
    .use 210653 << Rogue
    .use 210823 << Shaman
    .train 415995 >>|cRXP_WARN_购买并使用|r |T135791:0|t[|cRXP_FRIENDLY_祥和顿悟|r]|cRXP_WARN_学习|r |T237549:0|t[妙手回春] << Priest
    .train 410010 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_牺牲符文|r]|cRXP_WARN_学习|r |T134596:0|t[铭刻裤子 - 牺牲之手] << Paladin
    .train 401761 >>|cRXP_WARN_购买并使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：时光倒转|r]|cRXP_WARN_学习|r |T237538:0|t[时光倒转] << Mage
    .train 410122 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_独来独往符文|r]|cRXP_WARN_学习|r |T132266:0|t[独来独往] << Hunter
    .train 416042 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_优胜劣汰符文|r]|cRXP_WARN_学习|r |T132126:0|t[优胜劣汰] << Druid
    .train 425445 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_战神符文|r]|cRXP_WARN_学习|r |T236319:0|t[战神] << Warrior
    .train 425476 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_契约符文|r]|cRXP_WARN_学习|r |T237562:0|t[恶魔契约] << Warlock
    .train 424990 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_左右开弓符文|r]|cRXP_WARN_学习|r |T237531:0|t[左右开弓] << Rogue
    .train 410096 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_双武器专精符文|r]|cRXP_WARN_学习|r |T132686:0|t[铭刻胸甲 - 双武器专精] << Shaman
    .target 格里兹比
    .train 415995,1 << Priest
    .train 410010,1 << Paladin
    .train 401761,1 << Mage
    .train 410122,1 << Hunter
    .train 416042,1 << Druid
    .train 425445,1 << Warrior
    .train 425476,1 << Warlock
    .train 424990,1 << Rogue
    .train 410096,1 << Shaman
    .money <3.0

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r、|cRXP_FRIENDLY_麦伯克·米希瑞克斯|r和|cRXP_FRIENDLY_酿酒师德罗恩|r交谈
    .turnin 1094 >>交任务：新的指示
    .accept 1095 >>接任务：新的指示
    .target +斯布特瓦夫
    .goto The Barrens,62.98,37.22
    .turnin 865 >>交任务：迅猛龙角
    .turnin 1069 >>交任务：深苔蜘蛛的卵
    .accept 1491 >>接任务：智慧饮料
    .target +麦伯克·米希瑞克斯
    .goto The Barrens,62.37,37.62
    .turnin 821 >>交任务：老陈的空酒桶
    .target +酿酒师德罗恩
    .goto The Barrens,62.27,38.39
    .dungeon WC

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r、|cRXP_FRIENDLY_麦伯克·米希瑞克斯|r和|cRXP_FRIENDLY_酿酒师德罗恩|r交谈
    .turnin 1094 >>交任务：新的指示
    .accept 1095 >>接任务：新的指示
    .target +斯布特瓦夫
    .goto The Barrens,62.98,37.22
    .turnin 865 >>交任务：迅猛龙角
    .turnin 1069 >>交任务：深苔蜘蛛的卵
    .target +麦伯克·米希瑞克斯
    .goto The Barrens,62.37,37.62
    .turnin 821 >>交任务：老陈的空酒桶
    .target +酿酒师德罗恩
    .goto The Barrens,62.27,38.39

step << Warrior
    .goto The Barrens,62.20,38.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格拉利克斯|r交谈
    .vendor >>购买|T134583:0|t[|cRXP_FRIENDLY_粗链短裤|r]（他有货时购买）
    .target 格拉利克斯
    .money <0.619
    .itemStat 7,ITEM_MOD_ARMOR_SHORT,<155
    .equip 7,4800
    .isQuestTurnedIn 865

step << Rogue/Hunter/Warrior/Shaman/Druid
    .goto The Barrens,62.16,38.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克斯宾德|r交谈
    .vendor >> 购买|T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r]（他有货时购买）
    .target 维克斯宾德
    .money <0.3515
    .itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
    .equip 9,4794
    .isQuestTurnedIn 865

step << Warrior
    #optional
    #completewith FlytoXroads
    +|cRXP_WARN_装备|r |T134583:0|t[|cRXP_FRIENDLY_粗链短裤|r]
    .use 4800
    .itemcount 4800,1
    .itemStat 7,ITEM_MOD_ARMOR_SHORT,<155
    .isQuestTurnedIn 865
    .equip 7,4800

step << Rogue/Hunter/Warrior/Shaman/Druid
    #optional
    #completewith FlytoXroads
    +|cRXP_WARN_装备|r |T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r]
    .use 4794
    .itemcount 4794,1
    .itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
    .isQuestTurnedIn 865
    .xp <20,1
    .equip 9,4794

step
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板维尔雷|r交谈
    .home >>将炉石设置在棘齿城
    .target 旅店老板维尔雷
    .dungeon WC
    .bindlocation 392
    .isQuestTurnedIn 865

step
    .goto The Barrens,63.09,37.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_起重机操作员比戈弗兹|r交谈
    .accept 959 >>接任务：港口的麻烦
    .target 起重机操作员比戈弗兹
    .dungeon WC

step
    #label FlytoXroads
    #completewith XroadsHS2
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >>飞往十字路口
    .target 布拉高克
    .subzoneskip 380

step << Hunter
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .accept 6541 >>接任务：向卡德拉克报到
    .target 索克

step
    #xprate <1.5
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索克·快刀|r交谈
    >>|cRXP_WARN_他在塔顶|r
    .turnin 875 >>交任务：鹰身人首领
    .accept 876 >>接任务：塞瑞娜·血羽
    .target 达索克·快刀
    .isQuestComplete 875

step
    #xprate <1.5
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索克·快刀|r交谈
    >>|cRXP_WARN_他在塔顶|r
    .accept 876 >>接任务：塞瑞娜·血羽
    .target 达索克·快刀
    .isQuestTurnedIn 875

step
    #label XroadsHS2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_曼科里克|r和|cRXP_FRIENDLY_图加·符文图腾|r交谈
    .turnin 899 >>交任务：复仇的怒火
    .target +曼科里克
    .goto The Barrens,51.95,31.58
    .turnin 880 >>交任务：变异的生物
    .accept 1489 >>接任务：哈缪尔·符文图腾
    .accept 3301 >>接任务：茉拉·符文图腾
    .target +图加·符文图腾
    .goto The Barrens,52.26,31.93

step
    .destroy 5085 >>|cRXP_WARN_摧毁剩余的|r|T133721:0|t[刺背野猪人的獠牙]|cRXP_WARN_（背包中剩余的全部）|r
    .itemcount 5085,1

step
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板伯兰德·草风|r交谈
    .home >>将炉石设置在十字路口
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .target 旅店老板伯兰德·草风
    .dungeon !WC
    .dungeon DM

step
    .goto The Barrens,51.10,29.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科兰|r交谈
    .accept 868 >> 接任务：蝎卵
    .target 科兰

step << Shaman
    #completewith next
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克

step << Shaman
    .goto Orgrimmar,37.96,37.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔恩·火结|r交谈
    .accept 1528 >> 接任务：水之召唤
    .target 希尔恩·火结

step << Shaman
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 2645 >> 学习职业技能
    .target 卡德里斯

step << Warlock
    #completewith next
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克

step << Warlock
    .goto Orgrimmar,48.25,45.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甘鲁尔·血眼|r交谈
    .trainer >> 学习职业技能
    .accept 1507 >>接任务：噬魂者
    .target 甘鲁尔·血眼

step << Warlock
    .goto Orgrimmar,47.54,46.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈，并购买 |T133738:0|t[魔典：折磨（等级 2）]
    .collect 16346,1,493,1 --Grimoire of Torment (Rank 2)
    .target 库古尔

step << Warlock
    .goto Orgrimmar,47.05,46.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡祖尔|r交谈
    .turnin 1507 >>交任务：噬魂者
    .accept 1508 >>接任务：盲眼卡祖尔
    .target 卡祖尔

step << Warlock
    .goto Orgrimmar,44.16,48.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡提斯|r|cRXP_BUY_交谈，并向她购买|r |T135139:0|t[燃烧魔杖]|cRXP_BUY_。|r
    .collect 5210,1,493,1 --Collect Burning Wand (1)
    .money <0.5808
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.4
    .target 卡提斯

step << Warlock
    .goto Orgrimmar,37.03,59.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赞卡沙|r交谈
    .turnin 1508 >>交任务：盲眼卡祖尔
    .accept 1509 >>接任务：多格兰的消息
    .target 赞卡沙

step
    #completewith EnterDM
    .subzone 1581 >> 现在可以开始寻找前往死亡矿井的队伍
    .dungeon DM

step
    #completewith ZepptoSTVforDM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克
    .dungeon DM

step << Shaman
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8052 >> 学习职业技能
    .target 卡德里斯
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Shaman
    #optional
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 2645 >> 学习职业技能
    .target 卡德里斯
    .xp <20,1
    .dungeon DM

step << Hunter
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 14318 >>学习职业技能
    .target 奥玛克
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Hunter
    #optional
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 14290 >>学习职业技能
    .target 奥玛克
    .xp <20,1
    .dungeon DM

step << Hunter
    .goto Orgrimmar,66.33,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖祖|r交谈
    .train 14917 >>学习宠物技能
    .target 肖祖
    .xp <20,1
    .dungeon DM

step << Warrior
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹·怒拳|r交谈
    .train 8198 >>学习职业技能
    .target 格雷兹·怒拳
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Warrior
    #optional
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹·怒拳|r交谈
    .train 845 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <20,1
    .dungeon DM

step << Rogue
    .goto Orgrimmar,43.90,54.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
    .train 1943 >> 学习职业技能
    .target 奥莫克
    .xp <20,1
    .dungeon DM

step << Warlock
    .goto Orgrimmar,47.98,45.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽弗洛斯特|r交谈
    .train 1014 >> 学习职业技能
    .target 泽弗洛斯特
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Warlock
    #optional
    .goto Orgrimmar,47.98,45.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽弗洛斯特|r交谈
    .train 706 >> 学习职业技能
    .target 泽弗洛斯特
    .xp <20,1
    .dungeon DM

step << Mage
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 3140 >> 学习职业技能
    .target 皮菲瑞多
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Mage
    #optional
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 1953 >> 学习职业技能
    .target 皮菲瑞多
    .xp <20,1
    .dungeon DM

step << Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔库|r交谈
    .train 970 >> 学习职业技能
    .target 乌尔库
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Priest
    #optional
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔库|r交谈
    .train 14914 >> 学习职业技能
    .target 乌尔库
    .xp <20,1
    .dungeon DM

step
    #ah
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨苏恩|r交谈
    >>|cRXP_BUY_如有可能，请从拍卖行购买|r |T132794:0|t[灯油]|cRXP_BUY_。|r
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
    .goto Durotar,50.8,13.8,40 >>登上飞艇塔
    .zone Stranglethorn Vale >>乘坐飞艇前往荆棘谷
    .zoneskip Stranglethorn Vale
    .dungeon DM

step
    .goto Stranglethorn Vale,30.51,29.10,40,0
    .goto Stranglethorn Vale,27.09,31.27,40,0
    .goto Stranglethorn Vale,22.90,31.17,60,0
    .goto Stranglethorn Vale,19.06,27.00,60,0
    .goto Stranglethorn Vale,16.33,23.46,60,0
    .goto Stranglethorn Vale,13.49,19.04,60,0
    .goto Westfall,41.08,98.55,60,0
    .goto Westfall,37.10,89.16,40,0
    .goto Westfall,30.01,86.02,200 >> 从格罗姆高营地径直向西游到暗礁海，再向北游往西部荒野
    >>|cRXP_WARN_避开岛屿，沿路径点前进以确保安全|r
    .dungeon DM

step
    #completewith next
    .goto Westfall,30.01,86.02,40 >> 前往西部荒野灯塔
    .dungeon DM

step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 103 >> 接任务：长明的灯塔
    .target 葛瑞森船长
    .itemcount 814,5 -- Flask of Oil (5)
    .dungeon DM

step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .turnin 103 >> 交任务：长明的灯塔
    .itemcount 814,5 -- Flask of Oil (5)
    .target 葛瑞森船长
    .dungeon DM

step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 104 >> 接任务：海岸上的威胁
    .target 葛瑞森船长
    .dungeon DM

step
    .goto Westfall,34.43,83.93
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀|cRXP_ENEMY_老瞎眼|r，获取|cRXP_LOOT_鳞片|r
    >>|cRXP_ENEMY_老瞎眼|r|cRXP_WARN_沿长滩来回巡逻。如果沿岸没有找到他，就在最南端的|cRXP_ENEMY_鱼人|r营地等他刷新|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan 老瞎眼
    .dungeon DM

step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .turnin 104 >> 交任务：海岸上的威胁
    .target 葛瑞森船长
    .dungeon DM

step
    #optional
    .abandon 103 >> 放弃任务：长明的灯塔
    .dungeon DM

step
    #label EnterDM
    .goto Eastern Kingdoms,40.92,81.97,8,0
    .goto Eastern Kingdoms,40.92,82.02,8,0
    .goto Eastern Kingdoms,40.89,82.09,8,0
    .goto Eastern Kingdoms,40.96,82.10,8,0
    .goto Eastern Kingdoms,40.92,82.16,15,0
    .goto Eastern Kingdoms,40.82,82.30,15,0
    .goto Eastern Kingdoms,40.77,82.52,15,0
    .goto Eastern Kingdoms,40.74,82.61,15,0
    .goto Eastern Kingdoms,40.63,82.49,15,0
    .goto Eastern Kingdoms,40.50,82.45
    .zone 291 >> 从死亡矿井副本入口进入副本
    .dungeon DM

step
    .hs >> 完成死亡矿井后，使用炉石返回贫瘠之地
    .zone The Barrens >> 抵达贫瘠之地
    .use 6948
    .dungeon DM

step
    #optional
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板维尔雷|r交谈
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .target 旅店老板维尔雷
    .subzoneskip 392,1
    .dungeon WC

step
    #optional
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板伯兰德·草风|r交谈
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .target 旅店老板伯兰德·草风
    .subzoneskip 380,1
    .dungeon DM

step << Warlock
    #completewith TurninDogran
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 392,1
    .dungeon WC

step << Warlock
    #completewith TurninDogran
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
    .fly Crossroads >> 飞往十字路口
    .zoneskip Orgrimmar,1
    .target 多拉斯

step << Warlock
    #label TurninDogran
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹罗格|r交谈
    .turnin 1509 >>交任务：多格兰的消息
    .accept 1510 >>接任务：多格兰的消息
    .target 加兹罗格

step << Shaman
    #completewith CallofWater01
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
    .fly Ratchet >> 飞往棘齿城
    .target 多拉斯
    .zoneskip Orgrimmar,1

step << Shaman
    #label CallofWater01
    .goto The Barrens,65.83,43.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水之先知伊斯伦|r交谈
    .turnin 1528 >>交任务：水之召唤
    .accept 1530 >>接任务：水之召唤
    .target 水之先知伊斯伦

step << !Warlock !Shaman
    #completewith next
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 392,1
    .dungeon WC

step << Shaman
    #completewith next
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 380

step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师赫布瑞姆|r交谈
    >>|cRXP_FRIENDLY_药剂师赫布瑞姆|r|cRXP_WARN_会开启一个45分钟的限时任务|r
    .accept 853 >> 接任务：药剂师扎玛
    .target 药剂师赫布瑞姆
    .isQuestTurnedIn 848
    .isQuestAvailable 853

step
    #sticky
    #completewith ZamahTurnin
    +|cRXP_WARN_这是限时任务，请勿挂机；按路线预计会在接取后20–30分钟交付|r
    .isOnQuest 853

step << !Warlock !Shaman
    #completewith TribesTurnin
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Camp Taurajo >> 飞往陶拉祖营地
    .target 布拉高克
    .subzoneskip 392,1
    .dungeon WC

step << Shaman
    #completewith TribesTurnin
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Camp Taurajo >> 飞往陶拉祖营地
    .target 布拉高克
    .subzoneskip 380

step
    #completewith TribesTurnin
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Camp Taurajo >> 飞往陶拉祖营地
    .target 迪弗拉克
    .subzoneskip 380,1

step
    .goto The Barrens,44.55,59.27
    >>击杀|cRXP_ENEMY_刺背野猪人|r，拾取|T134128:0|t[|cRXP_LOOT_血岩碎片|r]
    .collect 5075,1,5052,1 --Blood Shard (1)
    .mob 刺背寻水者
    .mob 刺背织棘者
    .mob 刺背地卜师

step
    #label TribesTurnin
    .goto The Barrens,44.55,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
    .turnin 878 >>交任务：野猪人的内战
    .accept 5052 >>接任务：阿迦玛甘的血岩碎片
    .turnin 5052 >>交任务：阿迦玛甘的血岩碎片
    .target 碎牙

step
    #completewith IshamuhaleTurnin
    .goto The Barrens,44.55,59.27,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
    +|cRXP_WARN_使用|r |T134128:0|t[|cRXP_LOOT_血岩碎片|r]|cRXP_WARN_兑换增益效果；至少保留4个备用|r << Tauren/Shaman/Orc Warrior/Troll Warrior
    +|cRXP_WARN_使用|r |T134128:0|t[|cRXP_LOOT_血岩碎片|r]|cRXP_WARN_兑换增益效果；至少保留4个备用|r << !Tauren !Shaman !Warrior/Undead
    +|cRXP_WARN_务必关闭 Questie 或 Leatrix Plus 等插件的自动交接任务功能|r
    .target 碎牙

step
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 882 >>交任务：伊沙姆哈尔
    .accept 907 >>接任务：被激怒的雷霆蜥蜴
    .turnin 883 >>交任务：拉克塔曼尼
    .target 乔恩·星眼
    .isOnQuest 883

step
    #label IshamuhaleTurnin
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 882 >>交任务：伊沙姆哈尔
    .accept 907 >>接任务：被激怒的雷霆蜥蜴
    .target 乔恩·星眼

step
    #completewith next
    .goto The Barrens,44.63,62.71,0
    .goto The Barrens,45.78,63.09,0
    .goto The Barrens,49.57,59.36,0
    .goto The Barrens,49.21,61.42,0
    .goto The Barrens,44.63,62.71,80,0
    .goto The Barrens,45.78,63.09,80,0
    .goto The Barrens,49.21,61.42,80,0
    .goto The Barrens,49.57,59.36,80,0
    >>击杀|cRXP_ENEMY_奥瓦坦卡|r，拾取 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]
    >>|cRXP_WARN_使用|T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]开始任务|r
    >>|cRXP_WARN_他有4个刷新点（已在地图上标记）|r
    .collect 5102,1,884,1 --Collect Owatanka's Tailspike
    .accept 884 >>接任务：奥瓦坦卡
    .use 5102
    .unitscan 奥瓦坦卡

step
    #loop
    .goto The Barrens,44.32,60.84,0
    .goto The Barrens,44.32,60.84,60,0
    .goto The Barrens,44.25,61.78,60,0
    .goto The Barrens,44.07,62.63,60,0
    .goto The Barrens,44.52,63.10,60,0
    .goto The Barrens,45.67,63.59,60,0
    .goto The Barrens,46.94,62.21,60,0
    .goto The Barrens,47.42,60.57,60,0
    .goto The Barrens,47.92,60.55,60,0
    .goto The Barrens,48.32,60.23,60,0
    .goto The Barrens,49.14,61.07,60,0
    .goto The Barrens,49.85,61.13,60,0
    .goto The Barrens,49.63,59.75,60,0
    .goto The Barrens,49.21,59.33,60,0
    .goto The Barrens,48.12,58.59,60,0
    >>击杀|cRXP_ENEMY_雷霆蜥蜴|r，拾取掉落的|cRXP_LOOT_血液|r
    .complete 907,1 --Thunder Lizard Blood (3)
    .mob 电角蜥蜴
    .mob 雷角蜥蜴

step
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 884 >>交任务：奥瓦坦卡
    .turnin 907 >>交任务：被激怒的雷霆蜥蜴
    .accept 913 >>接任务：雷鹰的嘶鸣
    .target 乔恩·星眼
    .isOnQuest 884

step
    #label Thunderhawk
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 907 >>交任务：被激怒的雷霆蜥蜴
    .accept 913 >>接任务：雷鹰的嘶鸣
    .target 乔恩·星眼

step << Shaman
    #completewith CallofWater2
    .goto The Barrens,44.63,62.71,0
    .goto The Barrens,45.78,63.09,0
    .goto The Barrens,49.57,59.36,0
    .goto The Barrens,49.21,61.42,0
    .goto The Barrens,44.63,62.71,80,0
    .goto The Barrens,45.78,63.09,80,0
    .goto The Barrens,49.21,61.42,80,0
    .goto The Barrens,49.57,59.36,80,0
    >>击杀|cRXP_ENEMY_奥瓦坦卡|r，拾取 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]
    >>|cRXP_WARN_使用|T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]开始任务|r
    >>|cRXP_WARN_他有4个刷新点（已在地图上标记）|r
    .collect 5102,1,884,1 --Collect Owatanka's Tailspike
    .accept 884 >>接任务：奥瓦坦卡
    .use 5102
    .unitscan 奥瓦坦卡

step << Shaman
    #completewith CallofWater2
    .goto The Barrens,43.42,77.41,60>> 向南前往|cRXP_FRIENDLY_布瑞恩|r

step << Shaman
    #completewith next
    >>击杀一只|cRXP_ENEMY_雷鹰|r，拾取掉落的|cRXP_LOOT_翅膀|r
    .complete 913,1 --Thunderhawk Wings (1)
    .mob 雷鹰雏鸟
    .mob 雷鹰破云者
    .mob 巨型雷鹰

step << Shaman
    #label CallofWater2
    .goto The Barrens,43.42,77.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞恩|r交谈
    .turnin 1530 >>交任务：水之召唤
    .accept 1535 >>接任务：水之召唤
    .target 布瑞恩

step << Shaman
    .goto The Barrens,44.22,76.75
    .use 7766 >> |cRXP_WARN_装满|r |T132825:0|t[空的棕色水囊]|cRXP_WARN_，地点是布瑞恩小屋下方的水坑|r
    .complete 1535,1 --Filled Brown Waterskin (1)

step << Shaman
    .goto The Barrens,43.42,77.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞恩|r交谈
    .turnin 1535 >>交任务：水之召唤
    .accept 1536 >>接任务：水之召唤
    .target 布瑞恩

step << Shaman
    #completewith ThunderhawkTurnin
    .subzone 378 >>返回陶拉祖营地

step
    #completewith next
    .goto The Barrens,44.63,62.71,0
    .goto The Barrens,45.78,63.09,0
    .goto The Barrens,49.57,59.36,0
    .goto The Barrens,49.21,61.42,0
    .goto The Barrens,44.63,62.71,80,0
    .goto The Barrens,45.78,63.09,80,0
    .goto The Barrens,49.21,61.42,80,0
    .goto The Barrens,49.57,59.36,80,0
    >>击杀|cRXP_ENEMY_奥瓦坦卡|r，拾取 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]
    >>|cRXP_WARN_使用|T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]开始任务|r
    >>|cRXP_WARN_他有4个刷新点（已在地图上标记）|r
    .collect 5102,1,884,1 --Collect Owatanka's Tailspike
    .accept 884 >>接任务：奥瓦坦卡
    .use 5102
    .unitscan 奥瓦坦卡

step
    #loop
    .goto The Barrens,44.83,63.12,0
    .goto The Barrens,44.83,63.12,60,0
    .goto The Barrens,46.57,61.33,60,0
    .goto The Barrens,48.99,58.69,60,0
    .goto The Barrens,45.45,56.69,60,0
    .goto The Barrens,43.41,56.96,60,0
    >>击杀一只|cRXP_ENEMY_雷鹰雏鸟|r或|cRXP_ENEMY_雷鹰破云者|r，拾取它掉落的|cRXP_LOOT_雷鹰的翅膀|r
    .complete 913,1 --Thunderhawk Wings (1)
    .mob 雷鹰雏鸟
    .mob 雷鹰破云者

step
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 884 >>交任务：奥瓦坦卡
    .turnin 913 >>交任务：雷鹰的嘶鸣
    .accept 874 >>接任务：玛伦·星眼
    .accept 6382 >>接任务：灰谷狩猎 << Hunter
    .target 乔恩·星眼
    .isOnQuest 884

step
    #label ThunderhawkTurnin
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 913 >>交任务：雷鹰的嘶鸣
    .accept 874 >>接任务：玛伦·星眼
    .accept 6382 >>接任务：灰谷狩猎 << Hunter
    .target 乔恩·星眼

step << !Tauren !Shaman !Warrior/Undead
    .goto The Barrens,44.55,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
    .aura 16618 >> |cRXP_WARN_如果还剩10个|T134128:0|t[|cRXP_LOOT_血岩碎片|r]，就向|cRXP_FRIENDLY_碎牙|r换取|T136022:0|t[风之魂]。|r
    >>|cRXP_WARN_如果已经解锁雷霆崖飞行点，请跳过此步骤|r
    .itemcount 5075,10
    .target 碎牙

step << !Tauren !Shaman !Warrior/Undead
    #completewith next
    .goto Mulgore,68.68,60.34,120,0
    .zone Mulgore >>前往莫高雷

step << !Tauren !Shaman !Warrior/Undead
    #completewith DeathDUPpickup
    .goto Thunder Bluff,31.78,65.92
    .zone Thunder Bluff >>乘电梯进入雷霆崖
    >>|cRXP_WARN_如果已解锁雷霆崖飞行点，可以直接飞过去|r

step << Tauren/Shaman/Orc Warrior/Troll Warrior
    #completewith DeathDUPpickup
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧姆萨·雷角|r交谈
    .fly Thunder Bluff >>飞往雷霆崖
    .target 欧姆萨·雷角
    .zoneskip Thunder Bluff

step << Undead Warrior/Orc Warrior/Troll Warrior
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 199 >>学习双手锤
    .train 227 >>学习法杖
    .target 安塞瓦

step << Troll Hunter/Orc Hunter/Undead Warrior/Warlock/Priest
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 227 >>学习法杖
    .target 安塞瓦

step << Rogue
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 198 >>学习锤类武器
    .target 安塞瓦

step << Rogue
    .goto Thunder Bluff,38.95,64.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_库鲁克|r|cRXP_BUY_交谈，并向他购买|r |T135423:0|t[致命的飞斧]|cRXP_BUY_。|r
    .collect 3137,200,6562,1 --Deadly Throwing Axe (200)
    .target 库鲁克

step
    .goto Thunder Bluff,47.12,57.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_彻斯姆|r交谈
    .bankdeposit 5075 >> 存放 |T134128:0|t[血岩碎片]
    .bankdeposit 5059 >> 存放 |T132938:0|t[掘地铲]
    .target 彻斯姆
    .isOnQuest 868

step
    #optional
    .goto Thunder Bluff,47.12,57.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_彻斯姆|r交谈
    .bankdeposit 5075 >> 存放 |T134128:0|t[血岩碎片]
    .target 彻斯姆
    .isNotOnQuest 868

step
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将炉石设置在雷霆崖
    .target 旅店老板帕拉
    .bindlocation 1638
    .isQuestAvailable 6442
    .dungeon !WC

step
    #completewith next
    .goto Thunder Bluff,28.14,32.97,40,0
    .goto Thunder Bluff,28.51,28.95,10 >> 前往灵魂高地，再进入预见之池

step
    #sticky
    #completewith DeathDUPpickup
    .goto Thunder Bluff,28.55,25.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉莉斯·弗斯特|r交谈
    .accept 264 >> 接任务：至死方休
    .target 克拉莉斯·弗斯特

step
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >> 交任务：药剂师扎玛
    .accept 962 >> 接任务：毒蛇花
    .target 药剂师扎玛
    .isOnQuest 853
    .dungeon WC

step
    #optional
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .accept 962 >> 接任务：毒蛇花
    .target 药剂师扎玛
    .dungeon WC

step
    #optional
    #label ZamahTurnin
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >> 交任务：药剂师扎玛
    .target 药剂师扎玛
    .isOnQuest 853

step << Priest
    .goto Thunder Bluff,25.31,15.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦尔斯·威尔什|r交谈
    .accept 5644 >> 接任务：噬灵瘟疫 << Undead Priest
    .accept 5642 >> 接任务：暗影守卫 << Troll Priest
    .trainer >> 学习职业技能
    .target 麦尔斯·威尔什

step << Mage
    .goto Thunder Bluff,22.74,14.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师山姆|r交谈
    .train 12051 >> 学习职业技能
    .target 大法师山姆
    .xp <20,1
    .xp >22,1

step << Mage
    #optional
    .goto Thunder Bluff,22.74,14.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大法师山姆|r交谈
    .train 2138 >> 学习职业技能
    .target 大法师山姆
    .xp <22,1

step
    #optional
    #label DeathDUPpickup

step << Shaman
    .goto Thunder Bluff,23.64,18.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
    .train 2645 >> 学习职业技能
    .target 提戈尔·逐星
    .xp <20,1
    .xp >22,1

step << Shaman
    #optional
    .goto Thunder Bluff,23.64,18.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
    .train 8498 >> 学习职业技能
    .target 提戈尔·逐星
    .xp <22,1

step
    #completewith next
    .skill firstaid,80 >> |cRXP_WARN_制作|r |T133688:0|t[厚亚麻绷带]|cRXP_WARN_，直到技能达到80点或更高|r
    .skill firstaid,<1,1

step
    .goto Thunder Bluff,29.68,21.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_潘德·缚石|r交谈
    >>|cRXP_WARN_如果没有足够的|r |T132889:0|t[亚麻布]|cRXP_WARN_将急救技能提升到80点，请跳过此步骤|r
    .train 3277 >> 学习 |T133684:0|t[绒线绷带]
    .train 7934 >> 学习 |T134437:0|t[抗毒药剂] << Rogue
    .target 潘德·缚石
    .skill firstaid,<1,1

step << Rogue
    >>|cRXP_WARN_制作|r|T134437:0|t[抗毒药剂]|cRXP_WARN_（如果拾取到了|r|T134339:0|t[小毒囊]）
    >>|cRXP_WARN_把制作好的抗毒药剂留着以后使用|r
    .collect 6452,1 --Anti Venom
    .itemcount 1475,1

step
    #completewith next
    .goto Thunder Bluff,69.88,30.90,80 >> 前往长者高地

step
    .goto Thunder Bluff,78.61,28.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈
    .turnin 1489 >> 交任务：哈缪尔·符文图腾
    .accept 1490 >> 接任务：纳拉·蛮鬃
    .target 大德鲁伊哈缪尔·符文图腾

step
    .goto Thunder Bluff,75.65,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉·蛮鬃|r交谈
    .turnin 1490 >> 交任务：纳拉·蛮鬃
    .accept 914 >> 接任务：尖牙德鲁伊
    .target 纳拉·蛮鬃
    .dungeon WC

step
    .goto Thunder Bluff,75.65,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉·蛮鬃|r交谈
    .turnin 1490 >> 交任务：纳拉·蛮鬃
    .target 纳拉·蛮鬃

step << Druid
    .goto Thunder Bluff,76.48,27.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_图拉克|r交谈
    .trainer >> 学习职业技能
    .accept 27 >> 接任务：必修的课程
    .target 图拉克·符文图腾

step << Druid
    #completewith next
    .cast 18960 >>|cRXP_WARN_施放|r |T135758:0|t[传送：月光林地]
    .zoneskip Moonglade

step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德迪利特·星焰|r交谈
    .turnin 27 >> 交任务：必修的课程
    .accept 28 >> 接任务：湖中试炼
    .target 德迪利特·星焰

step << Druid
    #completewith next
    .goto Moonglade,54.30,55.68
    .collect 15877,1,28,1 >>在湖底拾取|cRXP_PICK_神殿灵珠容器|r，获得 |T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_在到达神殿灵珠正上方之前不要下潜|r

step << Druid
    .goto Moonglade,36.40,42.01
    .cast 19719 >> |cRXP_WARN_使用|r |T134125:0|t[神殿灵珠]|cRXP_WARN_（在雷姆洛斯神殿）|r
    .complete 28,1 -- Complete the Trial of the Lake
    .use 15877

step << Druid
    .goto Moonglade,36.52,40.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔加里|r交谈
    .turnin 28 >> 交任务：湖中试炼
    .accept 30 >> 接任务：海狮试炼
    .target 塔加里

step << Druid
    .hs >> 使用炉石返回雷霆崖
    .use 6948
    .cooldown item,6948,>0
    .bindlocation 1638,1
    .zoneskip Thunder Bluff
    .dungeon !WC

step << Druid
    #completewith next
    .goto Moonglade,44.29,45.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑟恩·草风|r交谈
    .fly Thunder Bluff >> 飞往雷霆崖
    .target 布瑟恩·草风
    .zoneskip Thunder Bluff
    .dungeon WC

step << Druid
    #completewith next
    .goto Moonglade,44.29,45.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑟恩·草风|r交谈
    .fly Thunder Bluff >> 飞往雷霆崖
    .target 布瑟恩·草风
    .zoneskip Thunder Bluff
    .cooldown item,6948,<0
    .dungeon !WC

step << Hunter
    #completewith HunterTraining2
    .goto Thunder Bluff,61.31,78.25,60 >> 前往猎人高地

step << Hunter
    .goto Thunder Bluff,59.13,86.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克·雷角|r交谈
    .train 5118 >> 学习职业技能
    .target 乌瑞克·雷角
    .xp <20,1
    .xp >22,1

step << Hunter
    #label HunterTraining2
    #optional
    .goto Thunder Bluff,59.13,86.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克·雷角|r交谈
    .train 3043 >> 学习职业技能
    .target 乌瑞克·雷角
    .xp <22,1

step << Hunter
    .goto Thunder Bluff,54.07,84.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赫苏瓦·雷角|r交谈
    .train 24494 >> 学习宠物技能
    .target 赫苏瓦·雷角

step << Warrior
    #completewith next
    .goto Thunder Bluff,61.31,78.25,60 >> 前往猎人高地

step << Warrior
    .goto Thunder Bluff,57.27,87.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托姆·狂暴图腾|r交谈
    .train 845 >>学习职业技能
    .accept 1823 >>接任务：和鲁迦交谈
    .target 托姆·狂暴图腾

step << Rogue
    .goto Thunder Bluff,53.00,56.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡德·狂暴图腾|r|cRXP_BUY_交谈，并向他购买|r |T135324:0|t[长剑]|cRXP_BUY_。|r
    .collect 923,1,493,1 --Collect Longsword (1)
    .money <0.8743
    .target 卡德·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1

step << Rogue
    #optional
    #completewith KayaLives
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
    .xp <21,1

step << Warrior/Shaman
    #optional
    #completewith next
    #ah
    +|cRXP_FRIENDLY_如果拍卖行的绿色武器更便宜，也可以改买一把|r

step << Warrior
    .goto Thunder Bluff,53.21,58.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_伊图·狂暴图腾|r|cRXP_BUY_交谈，并向他购买|r |T135157:0|t[占卜法杖]|cRXP_BUY_。|r
    .collect 928,1,493,1 --Collect Long Staff (1)
    .money <0.9860
    .target 伊图·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2

step << Warrior
    #optional
    #completewith KayaLives
    +|cRXP_WARN_装备|r |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1

step << Shaman
    #season 0
    .goto Thunder Bluff,53.21,58.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_伊图·狂暴图腾|r|cRXP_BUY_交谈，并向他购买|r |T135157:0|t[占卜法杖]|cRXP_BUY_。|r
    .collect 928,1,493,1 --Collect Long Staff (1)
    .money <0.9860
    .target 伊图·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2

step << Shaman
    #season 0
    #optional
    #completewith KayaLives
    +|cRXP_WARN_装备|r |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1

step << Shaman
    #season 2
    .goto Thunder Bluff,53.21,58.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_伊图·狂暴图腾|r|cRXP_BUY_交谈，并向他购买|r |T133476:0|t[尖刺流星锤]|cRXP_BUY_。|r
    .collect 925,1,493,1 --Collect Flail (1)
    .money <0.7797
    .target 伊图·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8

step << Shaman
    #season 2
    #optional
    #completewith KayaLives
    +|cRXP_WARN_装备|r |T133476:0|t[尖刺流星锤]
    .use 925
    .itemcount 925,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
    .xp <20,1

step << Hunter
    .goto Thunder Bluff,46.98,45.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_库纳·雷角|r|cRXP_BUY_交谈，并向她购买|r |T135489:0|t[重型弯弓]|cRXP_BUY_。|r
    .collect 3027,1,493,1 --Collect Heavy Recurve Bow (1)
    .money <0.5643
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.1
    .target 库纳·雷角

step << Hunter
    #completewith KayaLives
    #optional
    +|cRXP_WARN_装备|r |T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.1
    .xp <20,1

step << Hunter
    .goto Thunder Bluff,46.98,45.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_库纳·雷角|r交谈
    >>|cRXP_BUY_购买|r|T132382:0|t[锋利的箭]|cRXP_BUY_（向她购买）|r
    .collect 2515,1600,493,1 << Hunter --Sharp Arrow (1600)
    .target 库纳·雷角
    --WC

step
    #completewith next
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .zoneskip The Barrens
    .dungeon WC

step
    #sticky
    #completewith EnterWC
    +现在可以开始寻找前往哀嚎洞穴的队伍
    >>刷|cRXP_ENEMY_野猪人|r|cRXP_WARN_同时组建哀嚎洞穴队伍|r
    .dungeon WC

step
    .goto The Barrens,46.15,36.93,100 >> 前往哀嚎洞穴
    .isOnQuest 914
    .dungeon WC

step
    #completewith next
    .goto The Barrens,46.95,35.18,0
    .goto The Barrens,46.95,35.18,30,0
    .goto The Barrens,46.83,34.74,20,0
    .goto Kalimdor,51.98,55.36,20,0
    .goto Kalimdor,51.89,55.55,10,0
    .goto Kalimdor,51.87,55.50,10 >>从哀嚎洞穴集合石处跑上山
    >>|cRXP_WARN_紧跟箭头前进，到达隐藏洞穴|r
    .dungeon WC

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    >>|cRXP_WARN_他们位于哀嚎洞穴入口上方|r
    .accept 1486 >> 接任务：变异皮革
    .target +纳尔帕克
    .goto Kalimdor,51.91,55.42
    .accept 1487 >> 接任务：清除变异者
    .target +厄布鲁
    .goto Kalimdor,51.92,55.44
    .dungeon WC

step
    #optional
    #hardcore
    #completewith EnterWC
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打算跑1趟副本，建议最多3名玩家尝试完成此任务，因为|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人采集|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药]|cRXP_WARN_即可在小地图上显示它们|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #hardcore
    #completewith EnterWC
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打算跑1趟副本，建议最多3名玩家尝试完成此任务，因为|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人采集|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    #completewith EnterWC
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药]|cRXP_WARN_即可在小地图上显示它们|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #softcore
    #completewith EnterWC
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #hardcore
    #completewith EnterWC
    >>击杀你遇到的所有|cRXP_ENEMY_变异野兽|r，拾取掉落的|cRXP_LOOT_兽皮|r
    >>|cRXP_WARN_如果只打算跑1趟副本，建议最多3名玩家尝试完成此任务，因为|r|cRXP_LOOT_兽皮|r|cRXP_WARN_不够所有人分|r
    .complete 1486,1 --Deviate Hide (20)
    .dungeon WC
    .isOnQuest 1486
    --Too many .mobs, would clutter target box

step
    #softcore
    #completewith EnterWC
    >>击杀你遇到的所有|cRXP_ENEMY_变异野兽|r，拾取掉落的|cRXP_LOOT_兽皮|r
    .complete 1486,1 --Deviate Hide (20)
    .dungeon WC
    .isOnQuest 1486
    --Too many .mobs, would clutter target box

step
    #completewith EnterWC
    >>击杀|cRXP_ENEMY_软浆怪|r，拾取掉落的|cRXP_LOOT_精华|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC

step
    #label MadMagg
    #loop
    .goto Kalimdor,51.97,55.23,0
    .goto Kalimdor,51.82,54.86,0
    .goto Kalimdor,52.01,55.02,0
    .goto Kalimdor,52.15,55.15,0
    .goto Kalimdor,51.97,55.23,30,0
    .goto Kalimdor,51.82,54.86,30,0
    .goto Kalimdor,52.01,55.02,30,0
    .goto Kalimdor,52.15,55.15,30,0
    >>击杀|cRXP_ENEMY_疯狂的马格利什|r，拾取掉落的 |cRXP_LOOT_99年波尔多陈酿|r
    >>|cRXP_WARN_他的刷新时间很长；如果找不到他，请跳过此步骤|r
    .complete 959,1 --99-Year-Old Port (1)
    .mob 疯狂的马格利什
    .isOnQuest 959
    .dungeon WC

step
    #label EnterWC
    .goto Kalimdor,51.89,54.77,20,0
    .goto Kalimdor,51.95,54.56,20,0
    .goto Kalimdor,52.27,54.65,30,0
    .goto Kalimdor,52.40,55.20,30 >> 从哀嚎洞穴副本入口进入副本
    .dungeon WC

step
    #optional
    #hardcore
    #completewith GlowingShard
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打算跑1趟副本，建议最多3名玩家尝试完成此任务，因为|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人采集|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药]|cRXP_WARN_即可在小地图上显示它们|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #hardcore
    #completewith GlowingShard
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打算跑1趟副本，建议最多3名玩家尝试完成此任务，因为|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人采集|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    #completewith GlowingShard
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药]|cRXP_WARN_即可在小地图上显示它们|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    #completewith GlowingShard
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #hardcore
    #completewith GlowingShard
    >>击杀|cRXP_ENEMY_软浆怪|r，拾取掉落的|cRXP_LOOT_精华|r
    >>|cRXP_WARN_如果只打算跑1趟副本，建议最多3名玩家尝试完成此任务，因为|r|cRXP_LOOT_精华|r|cRXP_WARN_不够所有人分|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC

step
    #optional
    #softcore
    #completewith GlowingShard
    >>击杀|cRXP_ENEMY_软浆怪|r，拾取掉落的|cRXP_LOOT_精华|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC

step
    #completewith GlowingShard
    >>击杀|cRXP_ENEMY_变异破坏者|r、|cRXP_ENEMY_剧毒飞蛇|r、|cRXP_ENEMY_变异蹒跚者|r和|cRXP_ENEMY_变异尖牙风蛇|r
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
    .dungeon WC

step
    #label Gems
    >>击杀|cRXP_ENEMY_考布莱恩|r、|cRXP_ENEMY_安娜科德拉|r、|cRXP_ENEMY_皮萨斯|r和|cRXP_ENEMY_瑟芬迪斯|r，拾取掉落的|cRXP_LOOT_宝石|r
    .complete 914,1 --Gem of Cobrahn (1)
    .mob +考布莱恩
    .complete 914,2 --Gem of Anacondra (1)
    .mob +安娜科德拉
    .complete 914,3 --Gem of Pythas (1)
    .mob +皮萨斯
    .complete 914,4 --Gem of Serpentis (1)
    .mob +瑟芬迪斯
    .isOnQuest 914
    .dungeon WC

step
    #requires Gems
    #completewith next
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t在哀嚎洞穴入口与|cRXP_FRIENDLY_纳拉雷克斯的信徒|r交谈，并护送他安全抵达|cRXP_FRIENDLY_纳拉雷克斯|r处
    .target 纳拉雷克斯的信徒
    .skipgossip
    .dungeon WC

step
    #label GlowingShard
    >>到达|cRXP_FRIENDLY_纳拉雷克斯|r后，会先遭到两波敌人攻击，最后面对|cRXP_ENEMY_吞噬者穆坦努斯|r
    >>击杀他并拾取 |T135229:0|t[|cRXP_LOOT_发光的碎片|r]，使用该物品开始任务
    .collect 10441,1 --Collect Glowing Shard (x1)
    .accept 6981 >> 接任务：发光的碎片
    .use 10441
    .mob 吞噬者穆坦努斯
    .dungeon WC

step
    #optional
    #completewith DeviateRaptors
    >>击杀|cRXP_ENEMY_软浆怪|r，拾取掉落的|cRXP_LOOT_精华|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC

step
    #optional
    #hardcore
    #completewith Ectoplasms
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打算跑1趟副本，建议最多3名玩家尝试完成此任务，因为|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人采集|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药]|cRXP_WARN_即可在小地图上显示它们|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #hardcore
    #completewith Ectoplasms
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打算跑1趟副本，建议最多3名玩家尝试完成此任务，因为|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人采集|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    #completewith Ectoplasms
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药]|cRXP_WARN_即可在小地图上显示它们|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    #completewith Ectoplasms
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

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
    .dungeon WC

step
    >>击杀|cRXP_ENEMY_变异破坏者|r、|cRXP_ENEMY_剧毒飞蛇|r、|cRXP_ENEMY_变异蹒跚者|r和|cRXP_ENEMY_变异尖牙风蛇|r
    .complete 1487,1 --Deviate Ravager (7)
    .mob +变异破坏者
    .complete 1487,2 --Deviate Viper (7)
    .mob +剧毒飞蛇
    .complete 1487,3 --Deviate Shambler (7)
    .mob +变异蹒跚者
    .complete 1487,4 --Deviate Dreadfang (7)
    .mob +变异尖牙风蛇
    .isOnQuest 1487
    .dungeon WC

step
    #label DeviateRaptors
    >>击杀|cRXP_ENEMY_变异野兽|r，拾取掉落的|cRXP_LOOT_兽皮|r
    .complete 1486,1 --Deviate Hide (20)
    .mob 变异破坏者
    .mob 剧毒飞蛇
    .mob 变异蹒跚者
    .mob 变异尖牙风蛇
    .isOnQuest 1486
    .dungeon WC

step
    #label Ectoplasms
    >>击杀|cRXP_ENEMY_软浆怪|r，拾取掉落的|cRXP_LOOT_精华|r
    .complete 1491,1 --Wailing Essence (6)
    .mob 吞噬软浆怪
    .mob 大型软浆怪
    .mob 噩梦软浆怪
    .isOnQuest 1491
    .dungeon WC

step
    #optional
    #hardcore
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打算跑1趟副本，建议最多3名玩家尝试完成此任务，因为|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人采集|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药]|cRXP_WARN_即可在小地图上显示它们|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #hardcore
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_如果只打算跑1趟副本，建议最多3名玩家尝试完成此任务，因为|r|cRXP_PICK_毒蛇花|r|cRXP_WARN_不够所有人采集|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药]|cRXP_WARN_即可在小地图上显示它们|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #softcore
    >>拾取地面上的|cRXP_PICK_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #completewith GShard
    .hs >> 使用炉石返回棘齿城
    .bindlocation 392,1
    .subzoneskip 392
    .use 6948
    .dungeon WC

step
    .goto The Barrens,62.37,37.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦伯克·米希瑞克斯|r交谈
    .turnin 1491 >>交任务：智慧饮料
    .target 麦伯克·米希瑞克斯
    .isQuestComplete 1491
    .dungeon WC

step
    .goto The Barrens,63.09,37.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_起重机操作员比戈弗兹|r交谈
    .turnin 959 >> 交任务：港口的麻烦
    .target 起重机操作员比戈弗兹
    .isQuestComplete 959
    .dungeon WC

step
    #label GShard
    .goto The Barrens,62.99,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .complete 6981,1 --Speak with someone in Ratchet about the Glowing Shard
    .skipgossip
    .target 斯布特瓦夫
    .isOnQuest 6981
    .dungeon WC

step
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 380
    .isOnQuest 6981
    .dungeon WC

step
    #completewith next
    .goto The Barrens,50.49,34.36,20,0
    .goto The Barrens,49.61,34.54,20,0
    .goto The Barrens,49.14,34.02,20,0
    .goto The Barrens,48.18,32.78,50 >> 沿山路向上前进
    .dungeon WC

step
    .goto The Barrens,48.18,32.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲拉·古风|r交谈
    .turnin 6981 >> 交任务：发光的碎片
    .accept 3369 >> 接任务：在噩梦中
    .target 菲拉·古风
    .isOnQuest 6981
    .dungeon WC

step
    .goto The Barrens,48.18,32.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲拉·古风|r交谈
    .accept 3369 >> 接任务：在噩梦中
    .target 菲拉·古风
    .isQuestTurnedIn 6981
    .dungeon WC

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    >>|cRXP_WARN_他们位于哀嚎洞穴入口上方|r
    .turnin 1486 >> 交任务：变异皮革
    .target +纳尔帕克
    .goto Kalimdor,51.91,55.42
    .turnin 1487 >> 交任务：清除变异者
    .target +厄布鲁
    .goto Kalimdor,51.92,55.44
    .isQuestComplete 1487
    .isQuestComplete 1486
    .dungeon WC

step
    .goto Kalimdor,51.92,55.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄布鲁|r交谈
    >>|cRXP_WARN_他位于哀嚎洞穴入口上方|r
    .turnin 1487 >> 交任务：清除变异者
    .target 厄布鲁
    .isQuestComplete 1487
    .dungeon WC

step
    .goto Kalimdor,51.91,55.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r交谈
    >>|cRXP_WARN_他位于哀嚎洞穴入口上方|r
    .turnin 1486 >> 交任务：变异皮革
    .target 纳尔帕克
    .isQuestComplete 1486
    .dungeon WC

step
    #completewith WCEnd
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Thunder Bluff >>飞往雷霆崖
    .target 迪弗拉克
    .zoneskip Thunder Bluff
    .dungeon WC

step << skip
    #completewith next
    .subzone 378 >> 向南前往陶拉祖营地
    .dungeon WC

step << skip
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧姆萨·雷角|r交谈
    .fly Thunder Bluff >>飞往雷霆崖
    .target 欧姆萨·雷角
    .dungeon WC

step
    .goto Thunder Bluff,75.65,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳拉·蛮鬃|r交谈
    .turnin 914 >>交任务：尖牙德鲁伊
    .target 纳拉·蛮鬃
    .isQuestComplete 914
    .dungeon WC

step
    .goto Thunder Bluff,78.61,28.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_大德鲁伊哈缪尔·符文图腾|r交谈
    .turnin 3369 >> 交任务：在噩梦中
    .target 大德鲁伊哈缪尔·符文图腾
    .isOnQuest 3369
    .dungeon WC

step
    #completewith next
    .goto Thunder Bluff,28.51,28.95,10 >> 前往灵魂高地，再进入预见之池
    .isQuestComplete 962
    .dungeon WC

step
    .goto Thunder Bluff,23.0,21.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 962 >>交任务：毒蛇花
    .target 药剂师扎玛
    .isQuestComplete 962
    .dungeon WC

step
    #label WCEnd
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将炉石设置在雷霆崖
    .target 旅店老板帕拉
    .bindlocation 1638
    .isQuestAvailable 6442
    .dungeon WC

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

step
    #xprate <1.5
    #completewith Serena
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .subzoneskip 380
    .isQuestTurnedIn 852 << !Hunter

step
    #xprate >1.49
    #completewith CounterattackTurnin2
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .fly Crossroads >>飞往十字路口
    .subzoneskip 380
    .target 塔尔
    .isQuestTurnedIn 852 << !Hunter

step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 852 >>交任务：赫兹鲁尔·血印
    .target 雷戈萨·死门
    .isQuestComplete 852

step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #xprate <1.5
    #optional
    #completewith Serena
    .abandon 855 >>放弃任务：半人马护腕

step
    #completewith CounterattackTurnin2
    +|cRXP_WARN_下一个任务很难，建议组队。可以风筝|cRXP_ENEMY_督军克罗姆扎|r，绕着任务给予者所在的建筑移动|r

step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .accept 4021 >>接任务：人马无双！
    .target 雷戈萨·死门
    --.timer 183,Warlord Krom'zar Spawn
    .isQuestTurnedIn 852
    --timer is random, generally somewhere between 120-210 seconds

step
    .goto The Barrens,44.48,28.15
    >>击杀出现的|cRXP_ENEMY_督军克罗姆扎|r，拾取他掉在地上的|cRXP_PICK_旗帜|r
    >>|cRXP_WARN_小心！他是强力精英，至少有两只|r|cRXP_ENEMY_科卡尔|r|cRXP_WARN_怪物守卫|r
    >>|cRXP_WARN_他最长可能需要3分钟才会刷新|r
    .complete 4021,1 --Piece of Krom'zar's Banner (1)
    .unitscan 督军克罗姆扎
    .isQuestTurnedIn 852

step
    #label CounterattackTurnin2
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 4021 >>交任务：人马无双！
    .target 雷戈萨·死门
    .isQuestComplete 4021

step
    #xprate <1.5
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #xprate <1.5
    #label Serena
    .goto The Barrens,39.16,12.16
    >>击杀|cRXP_ENEMY_塞瑞娜·血羽|r，拾取掉落的|cRXP_LOOT_头颅|r
    .complete 876,1 --Serena's Head (1)
    .mob 塞瑞娜·血羽
    .isQuestTurnedIn 875

step << Hunter
    .goto The Barrens,49.05,11.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维妮·布特巴克|r交谈
    .turnin 3921 >> 交任务：维妮·布特巴克
    .target 维妮·布特巴克
    .isOnQuest 3921

step << Hunter
    .goto The Barrens,48.12,5.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德拉克|r交谈
    .turnin 6541 >> 交任务：向卡德拉克报到
    .target 卡德拉克

step << Hunter
    .goto Ashenvale,68.34,75.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托雷克|r交谈，开始护送任务
    >>|cRXP_FRIENDLY_托雷克|r|cRXP_WARN_每5分钟刷新一次|r
    .accept 6544 >> 接任务：托雷克的突袭
    .target 托雷克

step << Hunter
    .goto Ashenvale,66.08,74.50,60,0
    .goto Ashenvale,65.07,75.36,20,0
    .goto Ashenvale,64.28,75.33,10,0
    .goto Ashenvale,64.81,75.34
    >>跟随|cRXP_FRIENDLY_托雷克|r
    >>让|cRXP_FRIENDLY_托雷克|r和他的|cRXP_FRIENDLY_碎木掠夺者|r承受|cRXP_ENEMY_银翼战士|r与|cRXP_ENEMY_银翼哨兵|r的攻击
    >>|cRXP_WARN_清理完建筑后，跑向阳台。遇到|cRXP_ENEMY_杜瑞尔·月火|r时，先让|cRXP_FRIENDLY_托雷克|r和他的|cRXP_FRIENDLY_碎木掠夺者|r吸引仇恨，再开始输出|r
    .complete 6544,1 --Take Silverwing Outpost
    .mob 银翼战士
    .mob 银翼哨兵
    .unitscan 杜瑞尔·月火

step << Hunter
    .goto Ashenvale,73.04,62.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_埃尔托格·怒齿|r交谈
    .turnin 6544 >> 交任务：托雷克的突袭
    .target 埃尔托格·怒齿
    .isQuestComplete 6544

step << Hunter
    .goto Ashenvale,73.78,61.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞娜尼·雷心|r交谈
    .turnin 6382 >> 交任务：灰谷狩猎
    .turnin 6383 >> 交任务：灰谷狩猎
    .target 塞娜尼·雷心

step << Hunter
    .goto Ashenvale,73.18,61.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔格拉|r交谈
    .fp Splintertree Post >> 获取碎木岗哨的飞行点
    .target 乌尔格拉

step << Hunter
    #completewith EnterSTM2
    .goto Ashenvale,73.18,61.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔格拉|r交谈
    .fly Crossroads >> 飞往十字路口
    .target 乌尔格拉
    .zoneskip The Barrens

step << !Hunter
    #xprate <1.5
    #softcore
    #completewith next
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活

step << !Hunter
    #xprate <1.5
    #hardcore
    #completewith next
    .subzone 380 >>前往十字路口

step
    #xprate <1.5
    .goto The Barrens,51.62,30.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索克·快刀|r交谈
    .turnin 876 >> 交任务：塞瑞娜·血羽
    .accept 1060 >> 接任务：写给金吉尔的信
    .target 达索克·快刀
    .isQuestComplete 876

step
    #xprate <1.5
    #optional
    .goto The Barrens,51.62,30.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索克·快刀|r交谈
    .accept 1060 >> 接任务：写给金吉尔的信
    .target 达索克·快刀
    .isQuestTurnedIn 876

step
    .goto The Barrens,51.10,29.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科兰|r交谈
    .accept 868 >> 接任务：蝎卵
    .target 科兰

step
    #label EnterSTM2
    #completewith STMturnins1
    .zone Stonetalon Mountains >> 前往石爪山脉
    .zoneskip Stonetalon Mountains

step
    #map Stonetalon Mountains
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希雷斯·碎石|r和|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .turnin 1062 >>交任务：地精侵略者
    .timer 4,地精侵略者剧情
    .accept 1063 >>接任务：长者
    .accept 1068 >>接任务：伐木机
    .target +希雷斯·碎石
    .goto The Barrens,35.26,27.88
    .turnin 6629 >>交任务：杀死格鲁迪格·暗云
    .turnin 6523 >>交任务：保护卡雅
    .accept 6401 >>接任务：卡雅还活着
    .target +玛卡巴·扁蹄
    .goto The Barrens,35.19,27.79
    .isQuestComplete 6629
    .isQuestComplete 6523

step
    #optional
    #map Stonetalon Mountains
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希雷斯·碎石|r和|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .turnin 1062 >>交任务：地精侵略者
    .timer 4,地精侵略者剧情
    .accept 1063 >>接任务：长者
    .accept 1068 >>接任务：伐木机
    .target +希雷斯·碎石
    .goto The Barrens,35.26,27.88
    .turnin 6629 >>交任务：杀死格鲁迪格·暗云
    .target +玛卡巴·扁蹄
    .goto The Barrens,35.19,27.79
    .isQuestComplete 6629

step
    #optional
    #map Stonetalon Mountains
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希雷斯·碎石|r和|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .turnin 1062 >>交任务：地精侵略者
    .timer 4,地精侵略者剧情
    .accept 1063 >>接任务：长者
    .accept 1068 >>接任务：伐木机
    .target +希雷斯·碎石
    .goto The Barrens,35.26,27.88
    .turnin 6523 >>交任务：保护卡雅
    .accept 6401 >>接任务：卡雅还活着
    .target +玛卡巴·扁蹄
    .goto The Barrens,35.19,27.79
    .isQuestComplete 6523

step
    #label STMturnins1
    #optional
    #map Stonetalon Mountains
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希雷斯·碎石|r交谈
    .turnin 1062 >>交任务：地精侵略者
    .timer 4,地精侵略者剧情
    .accept 1063 >>接任务：长者
    .accept 1068 >>接任务：伐木机
    .goto The Barrens,35.26,27.88
    .target 希雷斯·碎石

step
    #completewith BloodFeedersTI
    .goto Stonetalon Mountains,82.57,98.63,60,0
    .goto Stonetalon Mountains,80.10,98.20,40,0
    .goto Stonetalon Mountains,77.17,98.61,40 >> 沿着左侧小路向上走

step
    .goto Stonetalon Mountains,74.54,97.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_金吉尔|r交谈
    .turnin 1060 >> 交任务：写给金吉尔的信
    .accept 1058 >> 接任务：金吉尔的森林魔法
    .target 巫医金吉尔
    .isQuestTurnedIn 876

step
    .goto Stonetalon Mountains,74.54,97.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_金吉尔|r交谈
    .accept 1058 >> 接任务：金吉尔的森林魔法
    .target 巫医金吉尔

step << Warlock
    .goto Stonetalon Mountains,73.25,95.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肯兹格拉|r交谈
    .turnin 1510 >>交任务：多格兰的消息
    .accept 1511 >>接任务：肯兹格拉的伤药
    .target 肯兹格拉

step
    #label BloodFeedersTI
    .goto Stonetalon Mountains,71.25,95.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_辛吉拉|r交谈
    .turnin 6461 >>交任务：盗窃的蜘蛛
    .target 辛吉拉

step << skip
    .goto Stonetalon Mountains,74.69,98.10
    .goto Thunder Bluff,56.65,18.96,30 >>|cRXP_WARN_跳到其中一个笼子上，然后退出并重新登录，以使用登出跳过技巧|r
    .link https://www.youtube.com/watch?v=cp2YI86AO4Y&ab >> |cRXP_WARN_点击查看示例|r

step << skip
    #completewith ElderCroneTurnin
    .goto Thunder Bluff,54.18,27.01,20,0
    .goto Thunder Bluff,50.75,37.07,40 >> 乘坐升降机前往雷霆崖

step << Hunter
    .goto Stonetalon Mountains,59.08,75.70
    >>点击|cRXP_PICK_通缉告示|r
    .accept 6284 >>接任务：贝瑟莱斯

step << Hunter
    #loop
    .goto Stonetalon Mountains,54.80,71.95,0
    .goto Stonetalon Mountains,51.89,73.81,50,0
    .goto Stonetalon Mountains,52.46,71.67,50,0
    .goto Stonetalon Mountains,54.80,71.95,50,0
    >>击杀|cRXP_ENEMY_贝瑟莱斯|r，拾取掉落的|cRXP_LOOT_贝瑟莱斯的牙齿|r
    >>|cRXP_WARN_清除|r|cRXP_ENEMY_贝瑟莱斯|r|cRXP_WARN_周围的敌人。小心，她会用蛛网缠住你|r
    >>|cRXP_WARN_此任务为可选任务；如果无法完成，可以跳过|r
    .complete 6284,1 --Collect Besseleth's Fang (x1)
    .unitscan 贝瑟莱斯

step
    #completewith KayaLives
    .subzone 460 >>前往烈日石居（石爪山脉）

step
    .goto Stonetalon Mountains,47.20,61.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马格兰|r交谈
    .turnin 6284 >> 交任务：贝瑟莱斯
    .target 马格兰
    .isQuestComplete 6284

step
    #label KayaLives
    .goto Stonetalon Mountains,47.46,58.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔姆拉|r交谈
    .turnin 6401 >>交任务：卡雅还活着
    .target 塔姆拉·荒原
    .isQuestTurnedIn 6523

step
    .goto Stonetalon Mountains,47.47,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板杰卡|r交谈
    >>|cRXP_WARN_不要设置你的|r |T134414:0|t[炉石]
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .vendor >> 出售杂物
    .target 旅店老板杰卡
    .isOnQuest 1095

step
    .goto Stonetalon Mountains,47.52,62.38,5,0
    .goto Stonetalon Mountains,47.61,61.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_基达|r交谈
    .vendor 4083 >> |cRXP_BUY_如有出售，请向她购买|r |T134831:0|t[治疗药水]|cRXP_BUY_。|r << !Warrior
    .vendor 4083 >> |cRXP_BUY_如有出售，请向她购买|r |T134831:0|t[治疗药水]|cRXP_BUY_和|r |T134413:0|t[活根草]|cRXP_BUY_。|r << Warrior
    .target 基达
    .isOnQuest 1095

step
    #xprate <1.5
    #completewith next
    .goto Stonetalon Mountains,49.38,61.68,30,0
    .goto Stonetalon Mountains,48.92,62.71,30,0
    .goto Stonetalon Mountains,48.11,63.88,30,0
    .goto Stonetalon Mountains,47.21,64.05,30 >> 沿右侧小路向上跑

step
    #xprate <1.5
    #label Tsunaman1
    .goto Stonetalon Mountains,47.36,64.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏纳曼|r交谈
    .accept 6562 >>接任务：帮助耶努萨克雷
    .accept 6393 >>接任务：元素战争
    .target 苏纳曼

step
    .goto Stonetalon Mountains,58.99,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹克斯|r交谈
    .turnin 1095 >>交任务：新的指示
    .target 菲兹克斯

step
    #xprate <1.5
    #loop
    .line Stonetalon Mountains,70.82,55.25,70.52,56.22,69.76,56.70,68.52,56.04,67.77,55.97,66.94,56.25,66.41,56.31,65.74,57.20,65.14,57.02,64.37,56.47,63.72,56.80,62.99,56.25,62.32,56.11,61.58,55.10,61.10,54.68,60.98,54.06,59.81,53.51,59.66,52.14,60.33,51.68
    .goto Stonetalon Mountains,61.03,52.32,50,0
    .goto Stonetalon Mountains,60.33,51.68,50,0
    .goto Stonetalon Mountains,59.66,52.14,50,0
    .goto Stonetalon Mountains,59.81,53.51,50,0
    .goto Stonetalon Mountains,60.98,54.06,50,0
    .goto Stonetalon Mountains,61.10,54.68,50,0
    .goto Stonetalon Mountains,61.58,55.10,50,0
    .goto Stonetalon Mountains,62.32,56.11,50,0
    .goto Stonetalon Mountains,62.99,56.25,50,0
    .goto Stonetalon Mountains,63.72,56.80,50,0
    .goto Stonetalon Mountains,64.37,56.47,50,0
    .goto Stonetalon Mountains,65.14,57.02,50,0
    .goto Stonetalon Mountains,65.74,57.20,50,0
    .goto Stonetalon Mountains,66.41,56.31,50,0
    .goto Stonetalon Mountains,66.94,56.25,50,0
    .goto Stonetalon Mountains,67.77,55.97,50,0
    .goto Stonetalon Mountains,68.52,56.04,50,0
    .goto Stonetalon Mountains,69.76,56.70,50,0
    .goto Stonetalon Mountains,70.52,56.22,50,0
    .goto Stonetalon Mountains,70.82,55.25,50,0
    .goto Stonetalon Mountains,59.66,52.14,0
    >>击杀 |cRXP_ENEMY_XT:9|r，它在河南岸巡逻
    >>|cRXP_WARN_如果找不到，请跳过此步骤|r
    .complete 1068,2 --XT:9 (1)
    .unitscan XT:9

step
    #xprate <1.5
    #loop
    .line Stonetalon Mountains,67.18,46.87,66.53,46.95,65.72,45.09,63.73,45.02,63.72,45.92,63.43,46.57,64.43,46.13,64.72,46.63,64.82,47.72,65.11,48.31,65.98,48.67,66.24,49.65,66.65,49.58,66.88,48.95,68.41,49.58,69.45,46.56,70.22,48.62,70.95,48.49,71.41,45.54,71.25,43.45
    .goto Stonetalon Mountains,67.18,46.87,50,0
    .goto Stonetalon Mountains,66.53,46.95,50,0
    .goto Stonetalon Mountains,65.72,45.09,50,0
    .goto Stonetalon Mountains,63.73,45.02,50,0
    .goto Stonetalon Mountains,63.72,45.92,50,0
    .goto Stonetalon Mountains,63.43,46.57,50,0
    .goto Stonetalon Mountains,64.43,46.13,50,0
    .goto Stonetalon Mountains,64.72,46.63,50,0
    .goto Stonetalon Mountains,64.82,47.72,50,0
    .goto Stonetalon Mountains,65.11,48.31,50,0
    .goto Stonetalon Mountains,65.98,48.67,50,0
    .goto Stonetalon Mountains,66.24,49.65,50,0
    .goto Stonetalon Mountains,66.65,49.58,50,0
    .goto Stonetalon Mountains,66.88,48.95,50,0
    .goto Stonetalon Mountains,68.41,49.58,50,0
    .goto Stonetalon Mountains,69.45,46.56,50,0
    .goto Stonetalon Mountains,70.22,48.62,50,0
    .goto Stonetalon Mountains,70.95,48.49,50,0
    .goto Stonetalon Mountains,71.41,45.54,50,0
    .goto Stonetalon Mountains,71.25,43.45,50,0
    .goto Stonetalon Mountains,64.82,47.23,50,0
    .goto Stonetalon Mountains,64.82,47.23,0
    >>击杀 |cRXP_ENEMY_XT:4|r，它在河北岸巡逻
    >>|cRXP_WARN_如果找不到，请跳过此步骤|r
    .complete 1068,1 --XT:4 (1)
    .unitscan XT:4

step
    #xprate <1.5
    #completewith next
    .goto Stonetalon Mountains,73.78,59.52
    .subzone 2160 >> 进入狂风矿洞
    .group

step
    #xprate <1.5
    .goto Stonetalon Mountains,71.87,60.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_匹兹尼克|r交谈
    >>|cRXP_WARN_这项任务持续5分钟，期间会按固定时间刷新3波狗头人：|r
    >>|cRXP_WARN_第一波在15秒后出现（3只狗头人）；第二波在2分15秒后出现（4只狗头人：2名施法者、2名近战）；第三波在3分20秒后出现（4只狗头人）。任务目标会在5分钟后完成|r
    .accept 1090 >> 接任务：格雷苏的要求
    .target 匹兹尼克
    .group 2

step
    #xprate <1.5
    .goto Stonetalon Mountains,71.77,60.19
    >>保护|cRXP_FRIENDLY_匹兹尼克|r，抵御来袭的|cRXP_ENEMY_风剪歹徒|r
    >>|cRXP_WARN_第一波在15秒后出现（3只狗头人）；第二波在2分15秒后出现（4只狗头人：2名施法者、2名近战）；第三波在3分20秒后出现（4只狗头人）。任务目标会在5分钟后完成|r
    .complete 1090,1 --Keep Piznik safe while he mines the mysterious ore
    .mob 风剪歹徒
    .group 2

step
    #xprate <1.5
    .goto Stonetalon Mountains,71.87,60.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_匹兹尼克|r交谈
    .turnin 1090 >> 交任务：格雷苏的要求
    .accept 1092 >> 接任务：格雷苏的要求
    .target 匹兹尼克
    .group

step << skip
    #xprate <1.5
    .goto Stonetalon Mountains,71.83,60.34
    .goto Stonetalon Mountains,57.57,61.99,30 >>|cRXP_WARN_跳上木制转轮，然后退出并重新登录，以使用登出跳过技巧|r
    .link https://www.youtube.com/watch?v=8s1SRza7qFg&ab_channel=RestedXP >> |cRXP_WARN_点击查看示例|r
    .group

step
    #xprate <1.5
    .goto Stonetalon Mountains,58.99,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲兹克斯|r交谈
    .turnin 1092 >> 交任务：格雷苏的要求
    .target 菲兹克斯
    .isQuestTurnedIn 1090
    .group

step
    #xprate <1.5
    #loop
    .line Stonetalon Mountains,70.82,55.25,70.52,56.22,69.76,56.70,68.52,56.04,67.77,55.97,66.94,56.25,66.41,56.31,65.74,57.20,65.14,57.02,64.37,56.47,63.72,56.80,62.99,56.25,62.32,56.11,61.58,55.10,61.10,54.68,60.98,54.06,59.81,53.51,59.66,52.14,60.33,51.68
    .goto Stonetalon Mountains,61.03,52.32,50,0
    .goto Stonetalon Mountains,60.33,51.68,50,0
    .goto Stonetalon Mountains,59.66,52.14,50,0
    .goto Stonetalon Mountains,59.81,53.51,50,0
    .goto Stonetalon Mountains,60.98,54.06,50,0
    .goto Stonetalon Mountains,61.10,54.68,50,0
    .goto Stonetalon Mountains,61.58,55.10,50,0
    .goto Stonetalon Mountains,62.32,56.11,50,0
    .goto Stonetalon Mountains,62.99,56.25,50,0
    .goto Stonetalon Mountains,63.72,56.80,50,0
    .goto Stonetalon Mountains,64.37,56.47,50,0
    .goto Stonetalon Mountains,65.14,57.02,50,0
    .goto Stonetalon Mountains,65.74,57.20,50,0
    .goto Stonetalon Mountains,66.41,56.31,50,0
    .goto Stonetalon Mountains,66.94,56.25,50,0
    .goto Stonetalon Mountains,67.77,55.97,50,0
    .goto Stonetalon Mountains,68.52,56.04,50,0
    .goto Stonetalon Mountains,69.76,56.70,50,0
    .goto Stonetalon Mountains,70.52,56.22,50,0
    .goto Stonetalon Mountains,70.82,55.25,50,0
    .goto Stonetalon Mountains,59.66,52.14,0
    >>击杀 |cRXP_ENEMY_XT:9|r，它在河南岸巡逻
    >>|cRXP_WARN_如果找不到，请跳过此步骤|r
    .complete 1068,2 --XT:9 (1)
    .unitscan XT:9
    .isQuestTurnedIn 1092
    .group 0

step
    #xprate <1.5
    #loop
    .line Stonetalon Mountains,67.18,46.87,66.53,46.95,65.72,45.09,63.73,45.02,63.72,45.92,63.43,46.57,64.43,46.13,64.72,46.63,64.82,47.72,65.11,48.31,65.98,48.67,66.24,49.65,66.65,49.58,66.88,48.95,68.41,49.58,69.45,46.56,70.22,48.62,70.95,48.49,71.41,45.54,71.25,43.45
    .goto Stonetalon Mountains,67.18,46.87,50,0
    .goto Stonetalon Mountains,66.53,46.95,50,0
    .goto Stonetalon Mountains,65.72,45.09,50,0
    .goto Stonetalon Mountains,63.73,45.02,50,0
    .goto Stonetalon Mountains,63.72,45.92,50,0
    .goto Stonetalon Mountains,63.43,46.57,50,0
    .goto Stonetalon Mountains,64.43,46.13,50,0
    .goto Stonetalon Mountains,64.72,46.63,50,0
    .goto Stonetalon Mountains,64.82,47.72,50,0
    .goto Stonetalon Mountains,65.11,48.31,50,0
    .goto Stonetalon Mountains,65.98,48.67,50,0
    .goto Stonetalon Mountains,66.24,49.65,50,0
    .goto Stonetalon Mountains,66.65,49.58,50,0
    .goto Stonetalon Mountains,66.88,48.95,50,0
    .goto Stonetalon Mountains,68.41,49.58,50,0
    .goto Stonetalon Mountains,69.45,46.56,50,0
    .goto Stonetalon Mountains,70.22,48.62,50,0
    .goto Stonetalon Mountains,70.95,48.49,50,0
    .goto Stonetalon Mountains,71.41,45.54,50,0
    .goto Stonetalon Mountains,71.25,43.45,50,0
    .goto Stonetalon Mountains,64.82,47.23,50,0
    .goto Stonetalon Mountains,64.82,47.23,0
    >>击杀 |cRXP_ENEMY_XT:4|r，它在河北岸巡逻
    >>|cRXP_WARN_如果找不到，请跳过此步骤|r
    .complete 1068,1 --XT:4 (1)
    .unitscan XT:4
    .isQuestTurnedIn 1092
    .group 0

step
    #xprate <1.5
    #completewith next
    .goto Stonetalon Mountains,78.29,42.51,30 >> 进入石爪小径

step << skip
    #xprate <1.5
    .goto Stonetalon Mountains,78.89,41.24
    .goto Ashenvale,40.40,53.06,30 >>|cRXP_WARN_跳上右侧的白色石头，然后退出并重新登录，以使用登出跳过技巧|r
    .link https://www.youtube.com/watch?v=h2s4ZjFBLtg&ab_channel=RestedXP >> |cRXP_WARN_点击查看示例|r
    .zoneskip Ashenvale

step
    #xprate <1.5
    #completewith ZoramFP
    .goto Ashenvale,34.14,53.61,50,0
    .goto Ashenvale,18.43,32.94,50,0
    .goto Ashenvale,11.96,34.28,80 >>前往佐拉姆加前哨站
    >>|cRXP_WARN_途中务必避开阿斯特兰纳守卫；为确保安全，请跟随路线指示|r
    .unitscan 阿斯特兰纳哨兵

step
    #xprate <1.5
    #optional
    #loop
    .goto Ashenvale,10.86,26.99,50,0
    .goto Ashenvale,11.23,25.73,50,0
    .goto Ashenvale,11.83,25.75,50,0
    .goto Ashenvale,12.51,24.09,50,0
    .goto Ashenvale,14.18,24.03,50,0
    .goto Ashenvale,14.85,23.08,50,0
    .goto Ashenvale,14.13,20.77,50,0
    .goto Ashenvale,14.73,19.56,50,0
    .goto Ashenvale,14.59,17.90,50,0
    .goto Ashenvale,13.38,16.39,50,0
    .goto Ashenvale,13.62,14.48,50,0
    .goto Ashenvale,14.15,15.31,50,0
    .goto Ashenvale,15.88,15.42,50,0
    .goto Ashenvale,15.40,16.96,50,0
    .goto Ashenvale,15.22,18.81,50,0
    .goto Ashenvale,15.33,20.78,50,0
    .goto Ashenvale,15.33,22.51,50,0
    .goto Ashenvale,15.32,24.90,50,0
    .goto Ashenvale,14.76,25.52,50,0
    .goto Ashenvale,14.62,26.49,50,0
    .goto Ashenvale,14.52,28.25,50,0
    .goto Ashenvale,13.55,29.36,50,0
    .goto Ashenvale,12.41,29.15,50,0
    .goto Ashenvale,11.22,31.04,50,0
    .goto Ashenvale,10.38,29.60,50,0
    .goto Ashenvale,11.01,28.57,50,0
    .xp 21 >> 刷怪升到21级

step
    #xprate <1.5
    #label ZoramFP
    .goto Ashenvale,12.24,33.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德鲁克|r交谈
    .fp Zoram'gar Outpost >> 获取佐拉姆加前哨站的飞行点
    .target 安德鲁克
    .isQuestAvailable 6442

step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶努萨克雷|r、|cRXP_FRIENDLY_卡拉恩·阿玛卡|r、|cRXP_FRIENDLY_米苏瓦|r和|cRXP_FRIENDLY_玛鲁凯|r交谈
    .turnin 6562 >> 交任务：帮助耶努萨克雷
    .target +耶努萨克雷
    .goto Ashenvale,11.56,34.29
    .accept 216 >> 接任务：蓟皮熊怪的麻烦
    .target +卡拉恩·阿玛卡
    .goto Ashenvale,11.90,34.53
    .accept 6462 >> 接任务：巨魔符咒
    .target +米苏瓦
    .goto Ashenvale,11.65,34.85
    .accept 6442 >> 接任务：佐拉姆海岸的纳迦
    .target +玛鲁凯
    .goto Ashenvale,11.69,34.90

step
    #xprate <1.5
    .goto Ashenvale,12.06,34.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆格拉什|r交谈
    >>|cRXP_WARN_这一步会开始护送任务，难度较高，请做好准备|r
    .accept 6641,1 >> 接任务：鞭笞者沃尔沙
    .target 穆格拉什

step
    #xprate <1.5
    #completewith next
    >>击杀|cRXP_ENEMY_怒尾纳迦|r，并拾取掉落的|cRXP_LOOT_头颅|r
    .complete 6442,1 --Wrathtail Head (20)
    .mob 怒尾纳迦
    .mob 怒尾御浪者
    .mob 怒尾巫师
    .mob 怒尾海巫
    .mob 怒尾女祭司
    .mob 怒尾侍从
    .mob 薇丝比娅

step
    #xprate <1.5
    .goto Ashenvale,9.63,27.63
    >>到达后点击|cRXP_PICK_火盆|r
    >>|cRXP_WARN_会有一波波的|r|cRXP_ENEMY_纳迦|r|cRXP_WARN_刷新。|r一旦|cRXP_ENEMY_沃尔沙|r|cRXP_WARN_出现，要小心；他的攻击非常高|r
    >>|cRXP_WARN_战斗前可以先让|r|cRXP_FRIENDLY_穆格拉什|r|cRXP_WARN_吸引一部分敌人的仇恨|r
    .complete 6641,1 --Defeat Vorsha the Lasher
    .mob 鞭笞者沃尔沙

step << Priest
    #xprate <1.5
    #season 0,1
    #sticky
    #completewith EnterBFD
    .subzone 2797,2 >> 如果想获得更好的魔杖（墓碑节杖），现在就组队去打黑暗深渊。也可以等到26–28级、身在灰谷时再去
    .dungeon BFD

step
    #xprate <1.5
    #loop
    .goto Ashenvale,11.01,28.57,0
    .goto Ashenvale,10.86,26.99,50,0
    .goto Ashenvale,11.23,25.73,50,0
    .goto Ashenvale,11.83,25.75,50,0
    .goto Ashenvale,12.51,24.09,50,0
    .goto Ashenvale,14.18,24.03,50,0
    .goto Ashenvale,14.85,23.08,50,0
    .goto Ashenvale,14.13,20.77,50,0
    .goto Ashenvale,14.73,19.56,50,0
    .goto Ashenvale,14.59,17.90,50,0
    .goto Ashenvale,13.38,16.39,50,0
    .goto Ashenvale,13.62,14.48,50,0
    .goto Ashenvale,14.15,15.31,50,0
    .goto Ashenvale,15.88,15.42,50,0
    .goto Ashenvale,15.40,16.96,50,0
    .goto Ashenvale,15.22,18.81,50,0
    .goto Ashenvale,15.33,20.78,50,0
    .goto Ashenvale,15.33,22.51,50,0
    .goto Ashenvale,15.32,24.90,50,0
    .goto Ashenvale,14.76,25.52,50,0
    .goto Ashenvale,14.62,26.49,50,0
    .goto Ashenvale,14.52,28.25,50,0
    .goto Ashenvale,13.55,29.36,50,0
    .goto Ashenvale,12.41,29.15,50,0
    .goto Ashenvale,11.22,31.04,50,0
    .goto Ashenvale,10.38,29.60,50,0
    .goto Ashenvale,11.01,28.57,50,0
    >>击杀|cRXP_ENEMY_怒尾纳迦|r，并拾取掉落的|cRXP_LOOT_头颅|r
    .complete 6442,1 --Wrathtail Head (20)
    .mob 怒尾纳迦
    .mob 怒尾御浪者
    .mob 怒尾巫师
    .mob 怒尾海巫
    .mob 怒尾女祭司
    .mob 怒尾侍从
    .mob 薇丝比娅

step
    #xprate <1.5
    #loop
    .goto Ashenvale,10.86,26.99,50,0
    .goto Ashenvale,11.23,25.73,50,0
    .goto Ashenvale,11.83,25.75,50,0
    .goto Ashenvale,12.51,24.09,50,0
    .goto Ashenvale,14.18,24.03,50,0
    .goto Ashenvale,14.85,23.08,50,0
    .goto Ashenvale,14.13,20.77,50,0
    .goto Ashenvale,14.73,19.56,50,0
    .goto Ashenvale,14.59,17.90,50,0
    .goto Ashenvale,13.38,16.39,50,0
    .goto Ashenvale,13.62,14.48,50,0
    .goto Ashenvale,14.15,15.31,50,0
    .goto Ashenvale,15.88,15.42,50,0
    .goto Ashenvale,15.40,16.96,50,0
    .goto Ashenvale,15.22,18.81,50,0
    .goto Ashenvale,15.33,20.78,50,0
    .goto Ashenvale,15.33,22.51,50,0
    .goto Ashenvale,15.32,24.90,50,0
    .goto Ashenvale,14.76,25.52,50,0
    .goto Ashenvale,14.62,26.49,50,0
    .goto Ashenvale,14.52,28.25,50,0
    .goto Ashenvale,13.55,29.36,50,0
    .goto Ashenvale,12.41,29.15,50,0
    .goto Ashenvale,11.22,31.04,50,0
    .goto Ashenvale,10.38,29.60,50,0
    .goto Ashenvale,11.01,28.57,50,0
    .xp 21+21450 >> 刷怪至当前经验达到21450+/25200
    .dungeon !BFD << Priest

step
    #xprate <1.5
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战歌信使|r和|cRXP_FRIENDLY_玛鲁凯|r交谈
    .turnin 6641 >> 交任务：鞭笞者沃尔沙
    .target +战歌信使
    .goto Ashenvale,12.22,34.21
    .turnin 6442 >> 交任务：佐拉姆海岸的纳迦
    .target +玛鲁凯
    .goto Ashenvale,11.69,34.90

step << Priest
    #xprate <1.5
    #season 0,1
    .goto Ashenvale,11.56,34.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶努萨克雷|r交谈
    .accept 6563 >> 接任务：阿库麦尔水晶
    .accept 6921 >> 接任务：废墟之间
    .accept 6565 >> 接任务：上古之神的仆从
    .target 耶努萨克雷
    .dungeon BFD
    .isQuestTurnedIn 6564

step << Priest
    #xprate <1.5
    #season 0,1
    .goto Ashenvale,11.56,34.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶努萨克雷|r交谈
    .accept 6563 >> 接任务：阿库麦尔水晶
    .accept 6921 >> 接任务：废墟之间
    .target 耶努萨克雷
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    .goto Kalimdor,43.89,35.23,100 >> 前往黑暗深渊副本入口
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    #completewith next
    >>从墙上拾取|cRXP_LOOT_阿库麦尔蓝宝石|r
    .complete 6563,1 --Sapphire of Aku'Mai (20)
    .dungeon BFD
    .isOnQuest 6563

step << Priest
    #xprate <1.5
    #season 0,1
    #loop
    .goto Kalimdor,43.94,34.86,0
    .goto Kalimdor,43.81,35.16,20,0
    .goto Kalimdor,43.94,34.86,20,0
    .goto Kalimdor,43.90,34.59,20,0
    .goto Kalimdor,44.00,34.57,20,0
    .goto Kalimdor,44.16,34.85,20,0
    .goto Kalimdor,44.35,34.97,20,0
    .goto Kalimdor,44.53,34.86,20,0
    .goto Kalimdor,43.94,34.86,20,0
    >>击杀|cRXP_ENEMY_黑暗深渊海潮祭司|r，并拾取掉落的 |T134332:0|t[|cRXP_LOOT_潮湿的便笺|r]，使用便笺接取任务
    .collect 16790,1,6564 --Collect Damp Note (1)
    .accept 6564 >> 接任务：上古之神的仆从
    .mob 黑暗深渊海潮祭司
    .use 16790
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    #loop
    .goto Kalimdor,44.34,35.11,0
    .goto Kalimdor,44.53,34.86,20,0
    .goto Kalimdor,44.35,34.97,20,0
    .goto Kalimdor,44.16,34.85,20,0
    .goto Kalimdor,44.00,34.57,20,0
    .goto Kalimdor,43.90,34.59,20,0
    .goto Kalimdor,43.94,34.86,20,0
    .goto Kalimdor,43.81,35.16,20,0
    .goto Kalimdor,44.34,35.11,20,0
    >>从墙上拾取|cRXP_LOOT_阿库麦尔蓝宝石|r
    .complete 6563,1 --Sapphire of Aku'Mai (20)
    .dungeon BFD
    .isOnQuest 6563

step << Priest
    #xprate <1.5
    #season 0,1
    #label EnterBFD
    .goto Kalimdor,44.36,34.86
    .subzone 2797,2 >> 从黑暗深渊副本入口进入副本
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_银月守卫塞尔瑞德|r交谈
    .accept 6561 >>接任务：黑暗深渊中的邪恶
    .target 银月守卫塞尔瑞德
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    >>击杀|cRXP_ENEMY_洛古斯·杰特|r
    .complete 6565,1 --Lorgus Jett slain (1)
    .mob 洛古斯·杰特
    .isOnQuest 6565
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    #completewith next
    >>在水底拾取|cRXP_PICK_深渊之石|r，以获得|cRXP_LOOT_深渊之核|r
    >>|cRXP_WARN_拾取后会召唤|r|cRXP_ENEMY_阿奎尼斯男爵|r
    .complete 6921,1 --Fathom Core (1)
    .isOnQuest 6921
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    >>击杀|cRXP_ENEMY_阿奎尼斯男爵|r，并拾取掉落的 |T136222:0|t[|cRXP_LOOT_奇怪的水球|r]；使用它接任务
    .collect 16782,1,6922 --Strange Water Globe (1)
    .accept 6922 >>接任务：阿奎尼斯男爵
    .mob 阿奎尼斯男爵
    .use 16782
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    >>在水底拾取|cRXP_PICK_深渊之石|r，以获得|cRXP_LOOT_深渊之核|r
    .complete 6921,1 --Fathom Core (1)
    .isOnQuest 6921
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    >>击杀|cRXP_ENEMY_梦游者克尔里斯|r，并拾取掉落的|cRXP_LOOT_头颅|r
    .complete 6561,1 --Head of Kelris (1)
    .mob 梦游者克尔里斯
    .isOnQuest 6561
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    .hs >> 使用炉石返回雷霆崖
    .bindlocation 1638,1
    .zoneskip Thunder Bluff
    .use 6948
    >>|cRXP_WARN_如果愿意，可以先击杀|r|cRXP_ENEMY_阿库麦尔|r|cRXP_WARN_；它是副本的最终首领|r
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    .goto Thunder Bluff,71.04,34.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_巴珊娜|r交谈
    .turnin 6561 >>交任务：黑暗深渊中的邪恶
    .target 巴珊娜·符文图腾
    .isQuestComplete 6561
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .fly Zoram'gar >> 飞往佐拉姆加前哨站
    .target 塔尔
    .zoneskip Ashenvale
    .dungeon BFD

step << Priest
    #xprate <1.5
    #season 0,1
    .goto Ashenvale,11.56,34.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶努萨克雷|r交谈
    .turnin 6564 >>交任务：上古之神的仆从
    .target 耶努萨克雷
    .dungeon BFD
    .isOnQuest 6564

step << Priest
    #xprate <1.5
    #season 0,1
    .goto Ashenvale,11.56,34.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶努萨克雷|r交谈
    .turnin 6565 >>交任务：上古之神的仆从
    .target 耶努萨克雷
    .dungeon BFD
    .isQuestComplete 6565

step << Priest
    #xprate <1.5
    #season 0,1
    .goto Ashenvale,11.56,34.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶努萨克雷|r交谈
    .turnin 6563 >>交任务：阿库麦尔水晶
    .target 耶努萨克雷
    .dungeon BFD
    .isQuestComplete 6563

step << Priest
    #xprate <1.5
    #season 0,1
    .goto Ashenvale,11.56,34.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶努萨克雷|r交谈
    .turnin 6921 >>交任务：废墟之间
    .target 耶努萨克雷
    .dungeon BFD
    .isQuestComplete 6921

step << Priest
    #xprate <1.5
    #season 0,1
    .goto Ashenvale,11.56,34.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_耶努萨克雷|r交谈
    .turnin 6922 >>交任务：阿奎尼斯男爵
    .target 耶努萨克雷
    .dungeon BFD
    .isQuestComplete 6922

step
    #xprate <1.5
    .goto Ashenvale,11.90,34.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡拉恩·阿玛卡|r交谈
    .accept 216 >> 接任务：蓟皮熊怪的麻烦
    .target 卡拉恩·阿玛卡

step
    #xprate >1.49
    #completewith JourneytoTM
    .goto Stonetalon Mountains,45.13,59.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔姆|r交谈
    .fly Thunder Bluff >>飞往雷霆崖
    .target 萨尔姆
    .zoneskip Thunder Bluff
    .cooldown item,6948,<0

step
    #xprate <1.5
    #completewith JourneytoTM
    .goto Ashenvale,12.24,33.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德鲁克|r交谈
    .fly Thunder Bluff >> 飞往雷霆崖
    .zoneskip Thunder Bluff
    .target 安德鲁克
    .cooldown item,6948,<0

step
    #completewith JourneytoTM
    .hs >> 使用炉石返回雷霆崖
    .use 6948
    .zoneskip Thunder Bluff
    .bindlocation 1638,1
    .cooldown item,6948,>0

step
    #completewith next
    .goto Thunder Bluff,69.88,30.90,80 >> 前往长者高地

step
    #label ElderCroneTurnin
    .goto Thunder Bluff,69.88,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛加萨·野性图腾|r交谈
    >>|cRXP_WARN_等待剧情结束|r
    .turnin 1063 >> 交任务：长者
    .timer 6,长者剧情
    .accept 1064 >> 接任务：被遗忘者的援助
    .target 玛加萨·野性图腾

step
    #label JourneytoTM
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 1064 >> 交任务：被遗忘者的援助
    .accept 1065 >> 接任务：塔伦米尔之旅
    .target 药剂师扎玛

step << Warlock
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .fly Camp Taurajo >>飞往陶拉祖营地
    .target 塔尔
    .zoneskip Thunder Bluff,1

step << !Warlock
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔尔|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .target 塔尔
    .zoneskip Thunder Bluff,1

step << Warlock
    #optional
    .goto Ashenvale,12.24,33.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德鲁克|r交谈
    .fly Camp Taurajo >>飞往陶拉祖营地
    .target 安德鲁克
    .zoneskip Ashenvale,1

step << !Warlock
    #optional
    .goto Ashenvale,12.24,33.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德鲁克|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .target 安德鲁克
    .zoneskip Ashenvale,1

step << Warlock
    .goto The Barrens,44.62,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_步兵劳格玛|r交谈
    .turnin 1511 >>交任务：肯兹格拉的伤药
    .accept 1515 >>接任务：多格兰之囚
    .target 步兵劳格玛

step << Warlock
    .goto The Barrens,43.31,47.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多格兰|r交谈
    .turnin 1515 >>交任务：多格兰之囚
    .accept 1512 >>接任务：爱的礼物
    .target 步兵多格兰

step << Warlock
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_欧姆萨·雷角|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .target 欧姆萨·雷角
    .zoneskip The Barrens,1

step << Warlock
    .goto Orgrimmar,48.25,45.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甘鲁尔·血眼|r交谈
    .turnin 1512 >>交任务：爱的礼物
    .accept 1513 >>接任务：誓缚
    .target 甘鲁尔·血眼

step << Warlock
    #completewith next
    .cast 9224 >>|cRXP_WARN_使用|r |T133290:0|t[多格兰的坠饰]|cRXP_WARN_（在召唤法阵中）|r
    .use 6626

step << Warlock
    .goto Orgrimmar,49.66,50.15
    >>击杀|cRXP_ENEMY_魅魔|r
    .complete 1513,1 --Kill Summoned Succubus (1)
    .mob 魅魔
    .use 6626

step << Warlock
    .goto Orgrimmar,48.25,45.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_甘鲁尔·血眼|r交谈
    .turnin 1513 >>交任务：誓缚
    .target 甘鲁尔·血眼

step << Warlock
    .goto Orgrimmar,48.62,46.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
    .train 6202 >> 学习职业技能
    .target 米尔科特
    .xp <22,1
    .xp >24,1

step << Warlock
    #optional
    .goto Orgrimmar,48.62,46.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
    .train 6223 >> 学习职业技能
    .target 米尔科特
    .xp <24,1

step << Rogue
    #completewith next
    .goto Orgrimmar,45.64,55.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡雷斯|r|cRXP_BUY_交谈；如果没有匕首，就向他购买|r |T135640:0|t[双刃弯刀]|cRXP_BUY_。|r
    .collect 2207,1 --Collect Jambiya (1)
    .target 卡雷斯

step << Rogue
    .goto Orgrimmar,43.05,53.73
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
    .goto Orgrimmar,43.05,53.73
    >>等|cRXP_FRIENDLY_申苏尔|r行完军礼后，选中他并输入 /Salute
    .complete 2460,1 --Shattered Salute Performed (1)
    .target 申苏尔

step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_申苏尔|r交谈
    .turnin 2460 >>交任务：碎手军礼
    .accept 2458 >>接任务：卧底密探
    .target 申苏尔

step << Rogue
    .goto Orgrimmar,42.10,49.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔|r|cRXP_BUY_交谈，并向他购买|r |T133849:0|t[蚀骨灰]|cRXP_BUY_、|r |T132793:0|t[空瓶]|cRXP_BUY_和|r |T134387:0|t[闪光粉]|cRXP_BUY_。|r
    .collect 2928,40,2479,1 --Collect Dust of Decay (40)
    .collect 3371,40,2479,1 --Collect Empty Vial (40)
    .collect 5140,20,2479,1 --Collect Flash Powder (20)
    .target 雷库尔

step << Priest/Warlock
    .goto Orgrimmar,44.16,48.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡提斯|r|cRXP_BUY_交谈，并向她购买|r |T135139:0|t[燃烧魔杖]|cRXP_BUY_。|r
    .collect 5210,1,493,1 --Collect Burning Wand (1)
    .money <0.5808
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.4
    .target 卡提斯

step << Mage
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 2138 >> 学习职业技能
    .target 皮菲瑞多
    .xp <22,1
    .xp >24,1

step << Mage
    #optional
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 2121 >> 学习职业技能
    .target 皮菲瑞多
    .xp <24,1

step << Mage
    .goto Orgrimmar,38.66,85.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索乌|r交谈，他在小屋顶部
    .train 3567 >> 学习 |T135759:0|t[传送：奥格瑞玛]
    .target 索乌

step << Troll Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔库|r交谈
    .turnin 5642 >> 交任务：暗影守卫
    .trainer >> 学习职业技能
    .target 乌尔库

step << Undead Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔库|r交谈
    .train 8103 >> 学习职业技能
    .target 乌尔库
    .xp <22,1
    .xp >24,1

step << Undead Priest
    #optional
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌尔库|r交谈
    .train 3747 >> 学习职业技能
    .target 乌尔库
    .xp <24,1

step << Rogue/Druid
    #completewith MissionProbable
    .goto Orgrimmar,26.22,61.58,80,0
    .goto Orgrimmar,15.66,63.33,30,0
    .goto Orgrimmar,18.03,60.51,50 >> 从西侧出口进入贫瘠之地
    .zoneskip The Barrens

step << Rogue/Druid
    #completewith MissionProbable
    .goto The Barrens,57.63,7.48,120 >> 前往淤泥沼泽

step << Druid
    .goto The Barrens,56.67,8.32
    >>在水中拾取|cRXP_PICK_奇怪的保险箱|r，获得 |T133443:0|t[水兽敏捷坠饰]
    .collect 15883,1,31,1 --Half Pendant of Aquatic Agility (1)

step << Rogue
    #completewith next
    .goto The Barrens,55.70,5.89
    +选中|cRXP_FRIENDLY_工头费苏勒|r，然后使用 |T134536:0|t[信号枪]两次，再输入 /Salute
    >>|cRXP_WARN_小心！在他变为友好之前不要靠近，否则他会攻击你|r
    .use 8051
    .target 工头费苏勒

step << Rogue
    .goto The Barrens,55.44,5.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头费苏勒|r交谈
    .turnin 2458 >>交任务：卧底密探
    .accept 2478 >>接任务：基本不可能的任务
    .target 工头费苏勒

step << Rogue/Druid
    #optional
    #label MissionProbable

step << Rogue
    .goto The Barrens,54.80,5.97
    >>施放|T133644:0|t[搜索]，目标为|cRXP_ENEMY_工头希里克斯|r，偷取他的|cRXP_LOOT_塔楼钥匙|r
    .complete 2478,5 --Silixiz's Tower Key (1)
    .mob 工头希里克斯

step << Rogue
    #completewith roguetowerq
    +|cRXP_WARN_这里的每种怪物都会受到某些技能的额外伤害|r
    >>使用|T132282:0|t[伏击]攻击|cRXP_ENEMY_变异风险投资公司工人|r
    >>使用|T132302:0|t[割裂]攻击|cRXP_ENEMY_风险投资公司巡逻员|r
    >>对目标施放一次|T132292:0|t[刺骨]（1个连击点），目标为|cRXP_ENEMY_风险投资公司看守|r

step << Rogue
    #label roguetowerq
    .goto The Barrens,54.72,5.74
    >>进入盗贼塔，击杀|cRXP_ENEMY_变异风险投资公司工人|r、|cRXP_ENEMY_风险投资公司巡逻员|r和|cRXP_ENEMY_风险投资公司看守|r
    .complete 2478,1 --Mutated Venture Co. Drone (2)
    .mob +变异风险投资公司工人
    .complete 2478,3 --Venture Co. Patroller (2)
    .mob +风险投资公司巡逻员
    .complete 2478,2 --Venture Co. Lookout (2)
    .mob +风险投资公司看守

step << Rogue
    .goto The Barrens,54.77,5.57
    >>在塔顶找到|cRXP_ENEMY_加里维克斯|r，击杀他并拾取|cRXP_LOOT_头颅|r
    >>|cRXP_WARN_使用|r |T132282:0|t[伏击]|cRXP_WARN_将他的生命值降至一半；然后用|r |T132155:0|t[凿击]|cRXP_WARN_恢复能量，并使用|r |T136205:0|t[闪避]
    >>|cRXP_WARN_记得使用药水和|r |T132819:0|t[菊花茶]|cRXP_WARN_（必要时）|r
    .complete 2478,4 --Gallywix's Head (1)
    .mob 大工头普兹克·加里维克斯
    --VV Video?

step << Rogue
    .goto The Barrens,54.77,5.57
    >>使用开锁技能打开|cRXP_PICK_加里维克斯的保险箱|r，并拾取|cRXP_LOOT_混合物|r
    .complete 2478,6 --Cache of Zanzil's Altered Mixture (1)

step << skip --Rogue/Druid
    #hardcore
    #completewith next
    .goto The Barrens,61.33,4.21,120 >>前往石矿洞

step << skip --Rogue/Druid
    #hardcore
    .goto The Barrens,60.48,3.76
    .goto Orgrimmar,40.05,68.05,30 >>|cRXP_WARN_跳上木梁，然后退出并重新登录，以使用登出跳过技巧。如果失败，就跑回奥格瑞玛|r
    .link https://www.youtube.com/watch?v=U7YfoaO-X8E&ab_channel=RestedXP >> |cRXP_WARN_点击查看示例|r
    .zoneskip Orgrimmar

step << Rogue/Druid
    #softcore
    #completewith next
    .deathskip >> 死亡后在|cRXP_FRIENDLY_灵魂医者|r处复活

step << Rogue/Druid
    #softcore
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克

step << Rogue/Druid
    #hardcore
    #completewith flytoORG
    .goto Kalimdor,56.81,45.47
    .zone Orgrimmar >>从西侧入口进入奥格瑞玛

step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_申苏尔|r交谈
    .turnin 2478 >>交任务：基本不可能的任务
    .accept 2479 >>接任务：希诺特的帮助
    .target 申苏尔

step << Rogue
    .goto Orgrimmar,42.10,49.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔|r|cRXP_BUY_交谈，并向他购买|r |T133849:0|t[蚀骨灰]|cRXP_BUY_和|r |T132793:0|t[空瓶]|cRXP_BUY_。|r
    .collect 2928,20,2479,1 --Collect Dust of Decay (20)
    .collect 3371,20,2479,1 --Collect Empty Vial (20)
    .target 雷库尔

step << Shaman
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8498 >> 学习职业技能
    .target 卡德里斯
    .xp <22,1
    .xp >24,1

step << Shaman
    #optional
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 905 >> 学习职业技能
    .target 卡德里斯
    .xp <24,1

step << Troll Warrior/Undead Warrior/Tauren Warrior
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
    .train 197 >>学习双手斧
    .target 哈纳什

step << Warrior
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹·怒拳|r交谈
    .train 6192 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <22,1
    .xp >24,1

step << Warrior
    #optional
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹·怒拳|r交谈
    .train 5308 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <24,1

step << Hunter
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 14323 >> 学习职业技能
    .target 奥玛克
    .xp <22,1
    .xp >24,1

step << Hunter
    #optional
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 14262 >> 学习职业技能
    .target 奥玛克
    .xp <24,1

step << Hunter
    .goto Orgrimmar,66.34,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖祖|r交谈
    .train 24558 >> 学习宠物技能
    .target 肖祖
    .xp <24,1

step << Rogue
    .goto Orgrimmar,48.12,80.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_特拉克根|r|cRXP_BUY_交谈，并向他购买|r |T135423:0|t[致命的飞斧]|cRXP_BUY_。|r
    .collect 3137,200,6544,1 --Deadly Throwing Axe (200)
    .target 特拉克根

step << Rogue
    >>|cRXP_WARN_如果有|r |T134437:0|t[抗毒药剂]，|cRXP_WARN_就用一瓶解除|r |T136230:0|t[赞吉尔之触]
    .itemcount 6452,1
    .use 6452
    .aura -9991

step << Rogue
    .destroy 8051 >> |cRXP_WARN_从背包中删除|r |T134536:0|t[信号枪]|cRXP_WARN_，因为后续不再需要它|r
    .destroy 8066 >> |cRXP_WARN_从背包中删除|r |T134374:0|t[费苏勒的哨子]|cRXP_WARN_，因为后续不再需要它|r

step
    #optional
    #label flytoORG

step
    #optional
    .abandon 6421 >>放弃任务：滚岩峡谷

step
    #optional
    .abandon 4021 >>放弃任务：人马无双！

step
    #optional
    .abandon 6481 >>放弃任务：土灵的觉醒

step
    #optional
    .abandon 6284 >>放弃任务：贝瑟莱斯

step
    #optional
    .abandon 6641 >>放弃任务：鞭笞者沃尔沙

step
    #optional
    .abandon 6563 >>放弃任务：阿库麦尔水晶
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupweight 500
#classic
#tbc
<< Horde
#xprate >1.99
#name 13-20 The Barrens
#version 1
#group RestedXP Horde 1-22
#groupid RXP-SRGCE-H1
#next 20-24 Stonetalon/Barrens
#displayname 13-20 贫瘠之地

step << !Tauren
    #xprate <2.1 << !Undead
    #softcore
    #completewith ThievesPickup
    .goto The Barrens,50.72,32.61
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活
    .subzoneskip 380

step << !Tauren
    #xprate <2.1 << !Undead
    #hardcore
    #completewith ThievesPickup
    .goto The Barrens,52.34,29.27,150 >> 前往十字路口
    .subzoneskip 380

step << !Tauren
    #softcore
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .accept 870 >>接任务：遗忘之池
    .target 图加·符文图腾

step << !Undead !Tauren
    #xprate <2.1
    #hardcore
    .goto The Barrens,52.62,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔夫|r 对话
    .accept 6365 >>接任务：送往奥格瑞玛的肉
    .target 扎尔夫

step << !Tauren
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 842 >>交任务：十字路口征兵
    .accept 844 >>接任务：平原陆行鸟的威胁
    .target 瑟格拉·黑棘
    .isOnQuest 842

step << !Tauren
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .accept 844 >>接任务：平原陆行鸟的威胁
    .target 瑟格拉·黑棘

step << !Tauren
    #hardcore
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .accept 870 >>接任务：遗忘之池
    .target 图加·符文图腾

step << !Tauren
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 对话
    .accept 871 >>接任务：野猪人的袭击
    .accept 5041 >>接任务：十字路口的补给品
    .target 索克
    .maxlevel 15

step << !Undead !Tauren
    #xprate <2.1
    #hardcore
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    >>|cRXP_WARN_不要飞往奥格瑞玛！|r
    .fp The Crossroads >> 开通十字路口飞行点
    .turnin 6365 >>交任务：送往奥格瑞玛的肉
    .accept 6384 >>接任务：飞往奥格瑞玛
    .target 迪弗拉克

step << Undead
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fp The Crossroads >> 开通十字路口飞行点
    .target 迪弗拉克
    .isQuestAvailable 1492

step << !Tauren
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .accept 1492 >>接任务：码头管理员迪兹维格
    .accept 848 >>接任务：菌类孢子
    .target 药剂师赫布瑞姆
    .isQuestAvailable 848

step << !Tauren
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .accept 1492 >>接任务：码头管理员迪兹维格
    .target 药剂师赫布瑞姆

step << Orc Hunter/Troll Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并向他购买一把|r |T135499:0|t[多层弯弓] |cRXP_BUY_。|r
    .collect 2507,1,871,1 --Collect Laminated Recurve Bow (1)
    .money <0.1751
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .target 阿瑟罗克
    .xp >15,1

step << Orc Hunter/Troll Hunter
    #optional
    #completewith DisruptTheAttacks
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .xp >15,1

step << Troll Hunter/Orc Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_阿瑟罗克|r 交谈
    .vendor >> |cRXP_BUY_如果有货，向他购买一把|r |T135490:0|t[|cRXP_FRIENDLY_精良的长弓|r] |cRXP_BUY_并补充箭矢|r
    >>|cRXP_WARN_如果没货，改买一把|r |T135490:0|t[强化弓] |cRXP_WARN_作为替代|r
    .collect 2515,1200,870,1 << Hunter --Sharp Arrow (1200)
    .target 阿瑟罗克
    .xp <16,1

step << Orc Warrior
    .goto The Barrens,51.23,29.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_纳加尔·死眼|r |cRXP_BUY_对话，并向他购买|r |T132395:0|t[大板斧] |cRXP_BUY_。|r
    .collect 1196,1,871,1 --Collect Tabar (1)
    .money <0.2214
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.2
    .target 纳加尔·死眼

step << Orc Warrior
    #optional
    #completewith DisruptTheAttacks
    +|cRXP_WARN_装备|r |T132395:0|t[大板斧]
    .use 1196
    .itemcount 1196,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.2

step << Troll Rogue/Orc Rogue
    #season 2
    .goto The Barrens,51.23,29.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_纳加尔·死眼|r |cRXP_BUY_对话，并向他购买一到两把|r |T135640:0|t[双刃弯刀] |cRXP_BUY_。|r
    .collect 2207,1,871,1 --Collect Jambiya (1)
    .money <0.2390
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
    .target 纳加尔·死眼

step << Troll Rogue/Orc Rogue
    #season 2
    #optional
    #completewith DisruptTheAttacks
    +|cRXP_WARN_装备|r |T135640:0|t[双刃弯刀]
    .use 2207
    .itemcount 2207,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1

step << Orc Shaman/Troll Shaman
    #xprate <2.1
    .goto The Barrens,51.23,29.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_纳加尔·死眼|r |cRXP_BUY_对话，并向他购买|r |T133490:0|t[锤] |cRXP_BUY_。|r
    .collect 852,1,871,1 --Collect Mace (1)
    .money <0.1739
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.2
    .target 纳加尔·死眼

step << Orc Shaman/Troll Shaman
    #xprate <2.1
    #optional
    #completewith DisruptTheAttacks
    +|cRXP_WARN_装备|r |T133490:0|t[锤]
    .use 852
    .itemcount 852,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.2

step << Shaman
    #xprate >2.09
    .goto The Barrens,51.23,29.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_纳加尔·死眼|r |cRXP_BUY_对话，并向他购买|r |T133490:0|t[锤] |cRXP_BUY_。|r
    .collect 852,1,871,1 --Collect Mace (1)
    .money <0.1739
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.2
    .target 纳加尔·死眼

step << Shaman
    #xprate >2.09
    #optional
    #completewith DisruptTheAttacks
    +|cRXP_WARN_装备|r |T133490:0|t[锤]
    .use 852
    .itemcount 852,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.2

step << !Tauren
    #label ThievesPickup
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r 对话
    .accept 869 >>接任务：偷钱的迅猛龙
    .target 加兹罗格

step << !Tauren
    #xprate <2.1
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r 对话
    .home >> 将炉石绑定在十字路口
    .target 旅店老板伯兰德·草风
    .bindlocation 380
    .isQuestAvailable 1492

step << Undead
    #xprate >2.09
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r 对话
    .home >> 将炉石绑定在十字路口
    .target 旅店老板伯兰德·草风
    .bindlocation 380
    .isQuestAvailable 1492

step << !Undead !Tauren
    #xprate >2.09
    .goto The Barrens,52.62,29.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔夫|r 对话
    .turnin 6386 >> 交任务：返回十字路口
    .target 扎尔夫

step << !Undead !Tauren
    #xprate <2.1
    #softcore
    .goto The Barrens,52.62,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔夫|r 对话
    .accept 6365 >>接任务：送往奥格瑞玛的肉
    .target 扎尔夫

step << Warlock
    #season 2
    #sticky
    #completewith BarrensEnd
    #label ExplorerImp
    >>在做任务时，对怪物施放 |T136163:0|t|cRXP_FRIENDLY_[吸取灵魂]|r，直到获得 |T133257:0|t|cRXP_LOOT_探险之魂|r。|cRXP_WARN_使用它学习如何召唤|r |T236294:0|t|cRXP_FRIENDLY_[探险小鬼]|r
    .train 445459 >>|cRXP_WARN_使用|r |T133257:0|t|cRXP_LOOT_探险之魂|r |cRXP_WARN_学习如何召唤|r |T236294:0|t[|cRXP_FRIENDLY_探险小鬼|r]
    .train 445459,1 --Skips if you already have Explorer Imp
    .train 1120,3 --Skips if you don't have drain soul
    .use 221978

step << Warlock/Mage
    #season 2
    #requires ExplorerImp << Warlock
    #sticky
    #completewith BarrensEnd
    #label FelPortalRune
    >>你所在的区域有 |cRXP_FRIENDLY_邪能传送门|r。发现传送门后，召唤 |T236294:0|t[|cRXP_FRIENDLY_探险小鬼|r]，并在旁边与它交谈，派它去探险。10–20 分钟后，它会带回战利品，也有几率带回 |T134419:0|t[|cRXP_FRIENDLY_恶魔卫士符文|r] << Warlock
    >>你所在的区域有 |cRXP_FRIENDLY_邪能传送门|r。发现传送门后，使用 |T134945:0|t[|cRXP_LOOT_空间修复卷轴|r]将其关闭，即可获得 |T134939:0|t[|cRXP_FRIENDLY_法术笔记：怨火之箭|r] << Mage
    >>|cRXP_WARN_留意传送门，直到获得符文|r
    .collect 221499,1 << Warlock --rune of the felguard
    .collect 223147,1 << Mage --Spell Notes: Balefire Bolt
    .itemcount 220792,1 << Mage --Scroll of Spatial Mending
    .use 223148 << Warlock --Otherworldy Treasure
    .use 220792 << Mage
    .train 429311,1 << Mage
    .train 431756,1 << Warlock
    .train 1120,3 << Warlock --Skips if you don't have drain soul
    .unitscan 邪能裂片
    .unitscan 邪能崩口
    .unitscan 邪能裂痕
    .unitscan 邪能之疤
    .unitscan 邪能裂隙

step << Warlock/Mage
    #season 2
    #requires FelPortalRune
    #sticky
    #completewith BarrensEnd
    .itemcount 221499,1 << Warlock --Rune of the Felguard
    .itemcount 223147,1 << Mage --Spell Notes: Balefire Bolt
    .train 431756 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恶魔卫士符文|r] |cRXP_WARN_学习|r |T136216:0|t[召唤恶魔卫士] << Warlock
    .train 429311 >> |cRXP_WARN_使用|T134939:0|t[|cRXP_FRIENDLY_法术笔记：怨火之箭|r]学习|T135809:0|t[怨火之箭]。|r << Mage
    .use 221499 << Warlock
    .use 223147 << Mage

step
    #completewith DisruptTheAttacks
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_尖喙|r
    .complete 844,1 --Plainstrider Beak (7)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟

step << !Tauren !Undead
    #xprate <1.5
    #completewith next
    #label DemonMountain
    .goto The Barrens,51.09,22.68,40,0
    .goto The Barrens,50.33,21.85,40,0
    .goto The Barrens,49.21,20.42,40,0
    .goto The Barrens,47.65,19.21,100 >> 前往山顶
    .isOnQuest 924

step << !Tauren !Undead
    #xprate <1.5
    #completewith next
    #requires DemonMountain
    .goto The Barrens,47.65,19.21,15 >> 进入鬼雾兽穴
    .isOnQuest 924

step << !Tauren !Undead
    #xprate <1.5
    #label DemonSeed
    .goto The Barrens,47.97,19.07
    >>右键点击 |cRXP_PICK_祭坛|r
    >>|cRXP_WARN_确保身上有|r |T134095:0|t[有瑕疵的能量石] |cRXP_WARN_（持续时间为30分钟）|r
    .collect 4986,1,924 --Collect Flawed Power Stone
    .complete 924,1 --Destroy the Demon Seed (1)
    .isOnQuest 924

step << skip
    #xprate <1.5
    #completewith DisruptTheAttacks
    .goto The Barrens,47.58,19.38,40,0
    .goto The Barrens,49.21,20.42,40,0
    .goto The Barrens,50.33,21.85,40,0
    .goto The Barrens,51.09,22.68,100 >> 从原路下山
    .isQuestComplete 924
    --XX !Tauren !Undead

step << Shaman
    #sticky
    #label FireTar1
    .goto The Barrens,54.97,25.23,50,0
    .goto The Barrens,54.2,24.60,50,0
    .goto The Barrens,53.57,25.51
    >>击杀一只 |cRXP_ENEMY_钢鬃寻水者|r 或 |cRXP_ENEMY_钢鬃织棘者|r，并拾取掉落的 |cRXP_LOOT_火焰焦油|r
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
    .maxlevel 15

step
    .goto The Barrens,55.70,27.30
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，接受任务
    >>|cRXP_WARN_如果没有刷新，可以之后再拿|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶
    .maxlevel 15

step
    #requires FireTar1 << Shaman
    #label DisruptTheAttacks
    #loop
    .goto The Barrens,53.63,24.50,25,0
    .goto The Barrens,54.26,24.64,25,0
    .goto The Barrens,54.81,25.19,25,0
    .goto The Barrens,55.50,25.61,25,0
    .goto The Barrens,55.86,26.30,25,0
    .goto The Barrens,55.83,27.15,25,0
    .goto The Barrens,55.41,27.41,25,0
    .goto The Barrens,54.50,26.97,25,0
    .goto The Barrens,54.05,26.11,25,0
    .goto The Barrens,53.51,25.24,25,0
    .goto The Barrens,53.63,24.50,25,0
    >>击杀 |cRXP_ENEMY_钢鬃寻水者|r、|cRXP_ENEMY_钢鬃织棘者|r 和 |cRXP_ENEMY_钢鬃猎手|r
    .complete 871,1 --Razormane Water Seeker (8)
    .mob +钢鬃寻水者
    .complete 871,2 --Razormane Thornweaver (8)
    .mob +钢鬃织棘者
    .complete 871,3 --Razormane Hunter (3)
    .mob +钢鬃猎手
    .maxlevel 15

step << Warrior !Undead
    #completewith next
    .goto The Barrens,54.53,27.96,30,0
    .goto The Barrens,55.53,28.28,30,0
    .goto The Barrens,56.58,28.61,30 >>前往山顶

step << Warrior !Undead
    .goto The Barrens,57.23,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索恩格瑞姆·火眼|r 对话
    .turnin 1502 >>交任务：索恩格瑞姆·火眼
    .accept 1503 >>接任务：锻造好的钢锭
    .target 索恩格瑞姆·火眼

step << Warrior !Undead
    .goto The Barrens,55.05,26.65
    >>打开 |cRXP_PICK_被盗的铁箱|r，拾取其中的 |cRXP_LOOT_锻造好的钢锭|r
    .complete 1503,1 --Forged Steel Bars (1)

step << Warrior !Undead
    #completewith next
    .goto The Barrens,54.53,27.96,30,0
    .goto The Barrens,55.53,28.28,30,0
    .goto The Barrens,56.58,28.61,30 >>前往山顶

step << Warrior !Undead
    .goto The Barrens,57.23,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索恩格瑞姆·火眼|r 对话
    .turnin 1503 >>交任务：锻造好的钢锭
    .target 索恩格瑞姆·火眼

step << !Undead !Tauren
    #sticky
    #completewith EnterRFC
    .subzone 2437 >> 现在应开始寻找怒焰裂谷队伍
    .dungeon RFC

step
    #optional
    #completewith next
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙

step
    #label PlainstriderBeaks
    #loop
    .goto The Barrens,53.71,29.19,0
    .goto The Barrens,53.36,26.28,80,0
    .goto The Barrens,53.23,28.41,80,0
    .goto The Barrens,53.57,29.58,80,0
    .goto The Barrens,52.91,32.90,80,0
    .goto The Barrens,51.31,32.91,80,0
    .goto The Barrens,50.50,31.05,80,0
    .goto The Barrens,50.05,29.77,80,0
    .goto The Barrens,50.93,27.72,80,0
    .goto The Barrens,52.83,27.91,80,0
    .goto The Barrens,53.71,29.19,80,0
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_尖喙|r
    .complete 844,1 --Plainstrider Beak (7)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟

step << Tauren Warrior
    #sticky
    #completewith KreenigSnarlsnout
    .goto The Barrens,52.5,30.7,0
    .vendor >>|cRXP_WARN_查看|r |cRXP_FRIENDLY_里扎雷克斯|r |cRXP_WARN_是否在十字路口；他出售药水和|r |T133476:0|t[|cRXP_FRIENDLY_重型尖刺钉锤|r] |cRXP_WARN_，这件物品库存有限|r
    .unitscan 里扎雷克斯
    .subzoneskip 380,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5

step
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 842 >>交任务：十字路口征兵 << Tauren Shaman
    .turnin 844 >>交任务：平原陆行鸟的威胁
    .accept 845 >>接任务：斑马的威胁
    .target 瑟格拉·黑棘

step
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 对话
    .turnin 871 >>交任务：野猪人的袭击
    .accept 872 >>接任务：野猪人的头目
    .target 索克
    .isQuestComplete 871

step
    #optional
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 对话
    .accept 872 >>接任务：野猪人的头目
    .target 索克
    .isQuestTurnedIn 871

step
    #xprate <2.1
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    >>|cRXP_WARN_他在塔顶|r
    .accept 867 >>接任务：鹰身强盗
    .target 达索克·快刀

step << !Tauren !Undead
    #softcore
    #xprate <2.1
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .turnin 6365 >>交任务：送往奥格瑞玛的肉
    .accept 6384 >>接任务：飞往奥格瑞玛
    .target 迪弗拉克

step << Orc Hunter/Troll Hunter
    #optional
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并向他购买一把|r |T135499:0|t[多层弯弓] |cRXP_BUY_。|r
    .collect 2507,1,872,1 --Collect Laminated Recurve Bow (1)
    .money <0.1751
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .target 阿瑟罗克
    .xp >15,1

step << Orc Hunter/Troll Hunter
    #optional
    #completewith KreenigSnarlsnout
    +|cRXP_WARN_装备|r |T135499:0|t[多层弯弓]
    .use 2507
    .itemcount 2507,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<5.7
    .xp >15,1

step << Troll Hunter/Orc Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_阿瑟罗克|r 交谈
    .vendor >> |cRXP_BUY_如果有货，向他购买一把|r |T135490:0|t[|cRXP_FRIENDLY_精良的长弓|r] |cRXP_BUY_并补充箭矢|r
    >>|cRXP_WARN_如果没货，改买一把|r |T135490:0|t[强化弓] |cRXP_WARN_作为替代|r
    .collect 2515,1200,870,1 << Hunter --Sharp Arrow (1200)
    .target 阿瑟罗克
    .xp <16,1

step << Tauren Hunter
    #optional
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并向他购买|r |T135613:0|t[猎人火枪] |cRXP_BUY_。|r
    .collect 2511,1,872,1 --Collect Hunter's Boomstick (1)
    .money <0.1324
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
    .target 阿瑟罗克

step << Tauren Hunter
    #optional
    #completewith KreenigSnarlsnout
    +|cRXP_WARN_装备|r |T135613:0|t[猎人火枪]
    .use 2511
    .itemcount 2511,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9

step << Orc Warrior
    #optional
    .goto The Barrens,51.23,29.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_纳加尔·死眼|r |cRXP_BUY_对话，并向他购买|r |T132395:0|t[大板斧] |cRXP_BUY_。|r
    .collect 1196,1,872,1 --Collect Tabar (1)
    .money <0.2214
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.2
    .target 纳加尔·死眼

step << Orc Warrior
    #optional
    #completewith KreenigSnarlsnout
    +|cRXP_WARN_装备|r |T132395:0|t[大板斧]
    .use 1196
    .itemcount 1196,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.2

step << Troll Rogue/Orc Rogue
    #optional
    #season 2
    .goto The Barrens,51.23,29.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_纳加尔·死眼|r |cRXP_BUY_对话，并向他购买一到两把|r |T135640:0|t[双刃弯刀] |cRXP_BUY_。|r
    .collect 2207,1,872,1 --Collect Jambiya (1)
    .money <0.2390
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1
    .target 纳加尔·死眼

step << Troll Rogue/Orc Rogue
    #optional
    #season 2
    #completewith KreenigSnarlsnout
    +|cRXP_WARN_装备|r |T135640:0|t[双刃弯刀]
    .use 2207
    .itemcount 2207,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.1

step << Orc Shaman/Troll Shaman
    #xprate <2.1
    #optional
    .goto The Barrens,51.23,29.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_纳加尔·死眼|r |cRXP_BUY_对话，并向他购买|r |T133490:0|t[锤] |cRXP_BUY_。|r
    .collect 852,1,872,1 --Collect Mace (1)
    .money <0.1739
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.2
    .target 纳加尔·死眼

step << Orc Shaman/Troll Shaman
    #xprate <2.1
    #optional
    #completewith KreenigSnarlsnout
    +|cRXP_WARN_装备|r |T133490:0|t[锤]
    .use 852
    .itemcount 852,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.2

step << Shaman
    #xprate >2.09
    #optional
    .goto The Barrens,51.23,29.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_纳加尔·死眼|r |cRXP_BUY_对话，并向他购买|r |T133490:0|t[锤] |cRXP_BUY_。|r
    .collect 852,1,872,1 --Collect Mace (1)
    .money <0.1739
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.2
    .target 纳加尔·死眼

step << Shaman
    #xprate >2.09
    #optional
    #completewith KreenigSnarlsnout
    +|cRXP_WARN_装备|r |T133490:0|t[锤]
    .use 852
    .itemcount 852,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<6.2

step << !Undead !Tauren
    #completewith HiddenEnemiesPickup
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克
    .dungeon RFC

step << Tauren
    .goto The Barrens,55.70,27.30,20,0
    .goto The Barrens,55.78,20.00
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，并用它开始任务。如果尚未刷新，稍后再来拾取
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶
    .dungeon RFC

step << Tauren
    #completewith KreenigSnarlsnout1
    .goto The Barrens,56.75,24.69,50,0
    .goto The Barrens,59.26,24.67,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .dungeon RFC
    .isOnQuest 872

step << Tauren
    #completewith next
    >>拾取 |cRXP_PICK_十字路口的补给箱|r
    >>|cRXP_WARN_补给箱有多个刷新位置|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .dungeon RFC
    .isOnQuest 872

step << Tauren
    #label KreenigSnarlsnout1
    .goto The Barrens,58.69,27.08
    >>击杀 |cRXP_ENEMY_克里尼格·糟鼻|r，并拾取他的 |cRXP_LOOT_獠牙|r
    .complete 872,3 --Kreenig Snarlsnout's Tusk (1)
    .mob 克里尼格·糟鼻
    .dungeon RFC
    .isOnQuest 872

step << Tauren
    #optional
    #completewith next
    .goto The Barrens,56.75,24.69,50,0
    .goto The Barrens,59.26,24.67,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .dungeon RFC
    .isOnQuest 872

step << Tauren
    .goto The Barrens,58.38,27.01,30,0
    .goto The Barrens,59.46,24.58
    >>拾取 |cRXP_PICK_十字路口的补给箱|r
    >>|cRXP_WARN_补给箱有多个刷新位置|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .dungeon RFC
    .isOnQuest 872

step << Tauren
    #loop
    .goto The Barrens,58.90,25.37,0
    .goto The Barrens,59.37,25.38,50,0
    .goto The Barrens,59.63,24.46,50,0
    .goto The Barrens,59.63,23.88,50,0
    .goto The Barrens,59.06,23.89,50,0
    .goto The Barrens,58.62,23.98,50,0
    .goto The Barrens,57.83,24.28,50,0
    .goto The Barrens,56.87,24.55,50,0
    .goto The Barrens,56.74,25.37,50,0
    .goto The Barrens,57.25,25.46,50,0
    .goto The Barrens,57.52,25.63,50,0
    .goto The Barrens,57.65,25.08,50,0
    .goto The Barrens,58.24,24.98,50,0
    .goto The Barrens,58.90,25.37,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .dungeon RFC
    .isOnQuest 872

step << Tauren
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_斑马|r，并拾取它们的 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
    .dungeon RFC

step << Tauren Shaman
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
    .goto Durotar,39.16,58.56,10 >> 沿山路向上前往 |cRXP_FRIENDLY_泰尔夫|r
    .dungeon RFC

step << Tauren Shaman
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泰尔夫·祖拉姆|r 对话
    .turnin 1525 >>交任务：火焰的召唤
    .accept 1526 >>接任务：火焰的召唤
    .target 泰尔夫·祖拉姆
    .dungeon RFC

step << Tauren Shaman
    #completewith next
    .goto Durotar,38.18,58.58
    .cast 8898 >>|cRXP_WARN_使用|r |T134732:0|t[火焰灵契]
    .use 6636
    .dungeon RFC

step << Tauren Shaman
    .goto Durotar,38.96,58.22
    >>击杀 |cRXP_ENEMY_火焰之魂|r，并拾取掉落的 |cRXP_LOOT_余烬|r
    .complete 1526,1 --Glowing Ember (1)
    .mob 火焰之魂
    .dungeon RFC

step << Tauren Shaman
    .goto Durotar,38.96,58.22
    >>点击地上的 |cRXP_PICK_火盆|r
    .turnin 1526 >>交任务：火焰的召唤
    .accept 1527 >>接任务：火焰的召唤
    .dungeon RFC

step << Tauren Shaman
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡纳尔·菲斯|r 对话
    .turnin 1527 >>交任务：火焰的召唤
    .target 卡纳尔·菲斯
    .dungeon RFC

step << Tauren Shaman
    .goto The Barrens,55.78,20.00
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，并用它开始任务。若未刷新，请等待它重新出现
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶
    .dungeon RFC

step << Tauren
    #sticky
    #completewith EnterRFC
    .subzone 2437 >> 现在应开始寻找怒焰裂谷队伍
    .dungeon RFC

step << Tauren
    #completewith HiddenEnemiesPickup
    .goto Orgrimmar,48.97,92.84,50,0
    .zone Orgrimmar >> 前往奥格瑞玛
    .dungeon RFC

step << Tauren
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
    >>|cRXP_WARN_不要飞往任何地方！|r
    .fp Orgrimmar >> 开通奥格瑞玛飞行点
    .target 多拉斯
    .isQuestAvailable 5728
    .dungeon RFC

step << !Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .accept 5726 >>接任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC

step << !Undead
    .goto Durotar,53.08,9.19,0
    >>在骷髅石击杀 |cRXP_ENEMY_火刃氏族|r 的成员，直到掉落 |cRXP_LOOT_军官的徽章|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .dungeon RFC

step << !Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .turnin 5726 >> 交任务：隐藏的敌人
    .accept 5727 >> 接任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC

step << !Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔鲁·火刃|r 对话
    .accept 5761 >>接任务：饥饿者塔拉加曼
    .target 尼尔鲁·火刃
    .dungeon RFC

step << !Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔鲁·火刃|r 对话
    .complete 5727,1 --Gauge Neeru Fireblade's reaction to you being a member of the Burning Blade
    .skipgossip
    .target 尼尔鲁·火刃
    .dungeon RFC

step << !Undead
    #label HiddenEnemiesPickup
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .turnin 5727 >> 交任务：隐藏的敌人
    .accept 5728 >> 接任务：隐藏的敌人
    .target 萨尔
    .dungeon RFC

step << !Undead
    #completewith EnterRFC
    .destroy 14544 >>|cRXP_WARN_从背包中删除|r |T134417:0|t[军官的徽章] |cRXP_WARN_，因为之后不再需要|r

step << !Undead
    #label EnterRFC
    .goto Orgrimmar,52.77,48.97
    .subzone 2437 >> 穿过怒焰裂谷副本入口，进入副本
    .dungeon RFC

step << !Undead
    >>|cRXP_WARN_如果可以，请队友共享以下任务|r
    .accept 5722 >> 接任务：寻找背包
    .accept 5723 >> 接任务：试探敌人
    .dungeon RFC

step << !Undead
    #optional
    #completewith next
    >>击杀 |cRXP_ENEMY_怒焰穴居人|r 和 |cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +怒焰穴居人
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +怒焰萨满祭司
    .isOnQuest 5723
    .dungeon RFC

step << !Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛尔|r 交谈
    .turnin 5722 >> 交任务：寻找背包
    .accept 5724 >> 接任务：归还背包
    .target 玛尔·恐怖图腾
    .isOnQuest 5722
    .dungeon RFC

step << !Undead
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛尔|r 交谈
    .accept 5724 >> 接任务：归还背包
    .target 玛尔·恐怖图腾
    .isQuestTurnedIn 5722
    .dungeon RFC

step << !Undead
    #label TroggsShamans
    >>击杀 |cRXP_ENEMY_怒焰穴居人|r 和 |cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +怒焰穴居人
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +怒焰萨满祭司
    .isOnQuest 5723
    .dungeon RFC

step << !Undead
    #optional
    #requires TroggsShamans
    #completewith BazzalanandJergosh
    >>击杀 |cRXP_ENEMY_燃刃信徒|r 和 |cRXP_ENEMY_燃刃术士|r，并拾取 |cRXP_LOOT_暗影法术研究|r 与 |cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob 燃刃信徒
    .mob 燃刃术士
    .isOnQuest 5725
    .dungeon RFC

step << !Undead
    >>击杀 |cRXP_ENEMY_饥饿者塔拉加曼|r，并拾取他的 |cRXP_LOOT_心脏|r
    .complete 5761,1 -- Taragaman the Hungerer's Heart
    .mob 饥饿者塔拉加曼
    .isOnQuest 5761
    .dungeon RFC

step << !Undead
    #label BazzalanandJergosh
    >>击杀 |cRXP_ENEMY_巴扎兰|r 和 |cRXP_ENEMY_祈求者耶戈什|r
    .complete 5728,1 --Bazzalan (1)
    .mob +巴扎兰
    .complete 5728,2 --Jergosh the Invoker (1)
    .mob +祈求者耶戈什
    .isOnQuest 5728
    .dungeon RFC

step << !Undead
    >>击杀 |cRXP_ENEMY_燃刃信徒|r 和 |cRXP_ENEMY_燃刃术士|r，并拾取 |cRXP_LOOT_暗影法术研究|r 与 |cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob 燃刃信徒
    .mob 燃刃术士
    .isOnQuest 5725
    .dungeon RFC

step << !Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔鲁·火刃|r 对话
    .turnin 5761 >>交任务：饥饿者塔拉加曼
    .target 尼尔鲁·火刃
    .isQuestComplete 5761
    .dungeon RFC

step << !Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .turnin 5728 >> 交任务：隐藏的敌人
    .accept 5729 >> 接任务：隐藏的敌人
    .target 萨尔
    .isQuestComplete 5728
    .dungeon RFC

step << !Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .accept 5729 >> 接任务：隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5728
    .dungeon RFC

step << !Undead
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_尼尔鲁·火刃|r 对话
    .turnin 5729 >> 交任务：隐藏的敌人
    .accept 5730 >> 接任务：隐藏的敌人
    .target 尼尔鲁·火刃
    .dungeon RFC
    .isQuestTurnedIn 5728

step << !Undead
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔|r 对话
    .turnin 5730 >> 交任务：隐藏的敌人
    .target 萨尔
    .isQuestTurnedIn 5728
    .dungeon RFC

step << Tauren
    #completewith RFCTurninsTB1
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
    .fly Thunder Bluff >>飞往雷霆崖
    .target 多拉斯
    .zoneskip Orgrimmar,1
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC

step << !Tauren
    #completewith KreenigSnarlsnout
    .hs >> 使用炉石返回十字路口
    .use 6948
    .bindlocation 380,1
    .zoneskip The Barrens
    .dungeon RFC

step << Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    #completewith RFCTurninsTB1
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Thunder Bluff >>飞往雷霆崖
    .target 迪弗拉克
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC
    .zoneskip Thunder Bluff
    --not worth to turn in 5723/5724 w/o TB flight path

step << skip
    #completewith RFCTurninsTB1
    .goto Mulgore,68.68,60.34,120,0
    .zone Thunder Bluff >>向南前往陶拉祖营地，再进入莫高雷，并从那里前往雷霆崖
    >>|cRXP_WARN_如果已解锁雷霆崖的飞行点，可以直接飞过去|r
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC

step << skip
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨|r 交谈
    .fp Camp Taurajo >> 开通陶拉祖营地飞行点 << !Tauren
    .target 欧姆萨·雷角
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723

step << Tauren/Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    #completewith RFCTurninsTB1
    .goto Thunder Bluff,69.88,30.90,80 >> 前往长者高地
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC

step << Tauren/Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5724 >> 交任务：归还背包
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC

step << Tauren/Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5724 >> 交任务：归还背包
    .target 拉哈罗
    .isOnQuest 5724
    .zoneskip Thunder Bluff,1
    .dungeon RFC

step << Tauren/Orc Warrior/Troll Warrior/Orc Shaman/Troll Shaman
    #label RFCTurninsTB1
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .isQuestComplete 5723
    .zoneskip Thunder Bluff,1
    .dungeon RFC

step << skip
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 对话
    .fp Thunder Bluff >> 开通雷霆崖飞行点
    .target 塔尔
    .zoneskip Thunder Bluff,1
    .dungeon RFC

step
    #completewith KreenigSnarlsnout
    .hs >> 使用炉石返回十字路口
    .use 6948
    .zoneskip Thunder Bluff,1
    .bindlocation 380,1
    .cooldown item,6948,>0
    .dungeon RFC

step
    #optional
    #completewith KreenigSnarlsnout
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 对话
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .zoneskip Thunder Bluff,1
    .cooldown item,6948,<0
    .dungeon RFC

step
    .goto The Barrens,55.70,27.30,20,0
    .goto The Barrens,55.78,20.00
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，接受任务
    >>|cRXP_WARN_如果没有刷新，就等待它重新出现|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶

step
    #optional
    #completewith KreenigSnarlsnout
    .goto The Barrens,56.75,24.69,50,0
    .goto The Barrens,59.26,24.67,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .isOnQuest 872

step
    #completewith next
    >>拾取 |cRXP_PICK_十字路口的补给箱|r
    >>|cRXP_WARN_补给箱有多个刷新位置|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .isOnQuest 872

step
    #label KreenigSnarlsnout
    .goto The Barrens,58.69,27.08
    >>击杀 |cRXP_ENEMY_克里尼格·糟鼻|r，并拾取他的 |cRXP_LOOT_獠牙|r
    .complete 872,3 --Kreenig Snarlsnout's Tusk (1)
    .mob 克里尼格·糟鼻
    .isOnQuest 872

step << Warlock
    #season 2
    .train 403932,1
    >>|cRXP_WARN_前往荆棘祭坛|r。施放 |T136126:0|t[生命分流]，直到生命值降到极低。然后对宠物施放 |T136168:0|t[生命通道]，让自己死亡并获得 |T134419:0|t[|cRXP_FRIENDLY_引导符文|r]
    *|cRXP_WARN_死亡后你会立即复活|r
    .goto The Barrens,58.2,26.7
    .cast 1454
    .cast 755
    .collect 208750,1
    .isOnQuest 872

step << Warlock
    #season 2
    .use 208750
    .itemcount 208750,1
    .train 403932 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_引导符文|r] |cRXP_WARN_学习|r |T136168:0|t[引导大师]
    .isOnQuest 872

step
    #completewith next
    .goto The Barrens,56.75,24.69,50,0
    .goto The Barrens,59.26,24.67,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .isOnQuest 872

step
    .goto The Barrens,58.38,27.01,30,0
    .goto The Barrens,59.46,24.58
    >>拾取 |cRXP_PICK_十字路口的补给箱|r
    >>|cRXP_WARN_补给箱有多个刷新位置|r
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .isOnQuest 872

step
    #loop
    .goto The Barrens,58.90,25.37,0
    .goto The Barrens,59.37,25.38,50,0
    .goto The Barrens,59.63,24.46,50,0
    .goto The Barrens,59.63,23.88,50,0
    .goto The Barrens,59.06,23.89,50,0
    .goto The Barrens,58.62,23.98,50,0
    .goto The Barrens,57.83,24.28,50,0
    .goto The Barrens,56.87,24.55,50,0
    .goto The Barrens,56.74,25.37,50,0
    .goto The Barrens,57.25,25.46,50,0
    .goto The Barrens,57.52,25.63,50,0
    .goto The Barrens,57.65,25.08,50,0
    .goto The Barrens,58.24,24.98,50,0
    .goto The Barrens,58.90,25.37,50,0
    >>击杀 |cRXP_ENEMY_钢鬃地卜师|r 和 |cRXP_ENEMY_钢鬃防御者|r
    .complete 872,1 --Razormane Geomancer (8)
    .mob +钢鬃地卜师
    .complete 872,2 --Razormane Defender (8)
    .mob +钢鬃防御者
    .isOnQuest 872

step << !Tauren !Undead
    #completewith next
    >>击杀 |cRXP_ENEMY_斑马|r，并拾取它们的 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
    .isQuestComplete 924

step << !Tauren !Undead
    #xprate <1.5
    .goto The Barrens,62.34,20.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雅克塞罗斯|r 对话
    .turnin 924 >>交任务：恶魔之种
    .target 雅克塞罗斯
    .isQuestComplete 924

step << Shaman
    #completewith ShamanDurotar
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙

step << Shaman
    #completewith ShamanDurotar
    >>击杀 |cRXP_ENEMY_斑马|r，并拾取它们的 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马

step << Shaman
    #completewith CallofFire3
    #label ShamanDurotar
    .goto Durotar,36.74,57.78
    .zone Durotar >> 前往杜隆塔尔
    .isOnQuest 1525

step << Shaman
    #requires ShamanDurotar
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
    .goto Durotar,39.16,58.56,10 >> 沿山路向上前往 |cRXP_FRIENDLY_泰尔夫|r

step << Shaman
    #label CallofFire3
    #requires ShamanDurotar
    .goto Durotar,38.52,58.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泰尔夫·祖拉姆|r 对话
    .turnin 1525 >>交任务：火焰的召唤
    .accept 1526 >>接任务：火焰的召唤
    .target 泰尔夫·祖拉姆

step << Shaman
    #completewith next
    .goto Durotar,38.18,58.58
    .cast 8898 >>|cRXP_WARN_使用|r |T134732:0|t[火焰灵契]
    .use 6636

step << Shaman
    .goto Durotar,38.96,58.22
    >>击杀 |cRXP_ENEMY_火焰之魂|r，并拾取掉落的 |cRXP_LOOT_余烬|r
    .complete 1526,1 --Glowing Ember (1)
    .mob 火焰之魂

step << Shaman
    .goto Durotar,38.96,58.22
    >>点击地上的 |cRXP_PICK_火盆|r
    .turnin 1526 >>交任务：火焰的召唤
    .accept 1527 >>接任务：火焰的召唤

step << Shaman
    #completewith FireEnd
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙

step << Shaman
    #completewith next
    >>击杀 |cRXP_ENEMY_斑马|r，并拾取它们的 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马
    .dungeon RFC

step << Shaman
    #label FireEnd
    .goto The Barrens,55.86,19.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡纳尔·菲斯|r 对话
    .turnin 1527 >>交任务：火焰的召唤
    .target 卡纳尔·菲斯

step << Shaman
    .goto The Barrens,55.78,20.00
    .use 4926 >> 拾取地上的 |cRXP_PICK_老陈的空酒桶|r，接受任务
    >>|cRXP_WARN_如果没有刷新，就等待它重新出现|r
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >> 接任务：老陈的空酒桶

step << skip
    #completewith RatchetEnter
    >>击杀 |cRXP_ENEMY_赤鳞尖啸龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞尖啸龙
    --XX Need to add goto about halfway down since they only spawn up north, would be too messy to add it

step
    #completewith next
    .goto The Barrens,63.89,31.66,100,0
    >>击杀 |cRXP_ENEMY_快步斑马|r，并拾取 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马

step
    #label RatchetEnter
    .goto The Barrens,62.68,36.23
    .subzone 392 >> 前往棘齿城
    .isOnQuest 845

step
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 对话
    .accept 887 >>接任务：南海海盗
    .target 加兹鲁维
    .maxlevel 16

step
    #completewith next
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 交谈
    .fp Ratchet >> 开通棘齿城飞行点
    .target 布拉高克

step
    .goto The Barrens,62.98,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 对话
    .accept 894 >>接任务：什么什么平衡器
    .target 斯布特瓦夫
    .maxlevel 16

step
    .goto The Barrens,62.59,37.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t查看 |cRXP_PICK_通缉布告|r
    .accept 895 >>接任务：通缉：巴隆·朗绍尔
    .maxlevel 16

step << Undead Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135353:0|t[普通长剑] |cRXP_BUY_。|r
    .collect 2024,1,895,1 --Collect Espadon (1)
    .money <0.6397
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5

step << Undead Warrior
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑] |cRXP_WARN_（达到16级时）|r
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp >16,1

step << Undead Warrior
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑]
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <16,1

step << Troll Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135147:0|t[法师之杖] |cRXP_BUY_。|r
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
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T132394:0|t[芒刺斧] |cRXP_BUY_。|r
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
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T133046:0|t[巨型石锤] |cRXP_BUY_。|r
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
    #season 0
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135147:0|t[法师之杖] |cRXP_BUY_。|r
    .collect 2030,1,895,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9

step << Shaman
    #season 0
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9

step << Shaman
    #season 2
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T133052:0|t[重型钉锤] |cRXP_BUY_。|r
    .collect 2028,1,895,1 --Collect Hammer (1)
    .money <0.5065
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5

step << Shaman
    #season 2
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T133052:0|t[重型钉锤]
    .use 2028
    .itemcount 2028,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5

step << Rogue
    #season 0
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135343:0|t[战士阔剑] |cRXP_BUY_。|r
    .collect 2027,1,895,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 艾隆萨尔

step << Rogue
    #season 0
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6

step << Rogue
    #season 0
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他再购买一把副手用的|r |T135343:0|t[战士阔剑] |cRXP_BUY_。|r
    .collect 2027,2,895,1 --Collect Scimitar(1)
    .money <0.3815
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 艾隆萨尔

step << skip
    #season 0
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备第二把|r |T135343:0|t[战士阔剑] |cRXP_WARN_（在副手）|r
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6

step << Rogue
    #season 2
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买一到两把|r |T135302:0|t[三角短剑] |cRXP_BUY_。|r
    .collect 2208,1,895,1 --Collect Poniard (1)
    .money <0.3842
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.4
    .target 艾隆萨尔

step << Rogue
    #season 2
    #optional
    #completewith BaronLongshore
    +|cRXP_WARN_装备|r |T135302:0|t[三角短剑]
    .use 2208
    .itemcount 2208,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.4

step
    .goto The Barrens,62.27,38.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_德罗恩|r 对话
    .turnin 819 >>交任务：老陈的空酒桶
    .accept 821 >>接任务：老陈的空酒桶
    .target 酿酒师德罗恩

step
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板维尔雷|r 交谈
    >>|cRXP_BUY_向他购买|r |T133918:0|t[长嘴泥鳅] |cRXP_BUY_。|r
    >>|cRXP_BUY_向他购买|r |T132796:0|t[果汁] |cRXP_BUY_。|r << Mage/Warlock/Priest/Shaman/Druid
    >>|T133918:0|t[长嘴泥鳅] |cRXP_WARN_非常便宜，可以按需购买任意数量|r
    .vendor >> 出售杂物
    .collect 4592,20,895,1 --Longjaw Mud Snapper (20)
    .collect 1205,10,895,1 << Mage/Warlock/Priest/Shaman/Druid --Melon Juice (10)
    .target 旅店老板维尔雷
    .isOnQuest 887

step
    #completewith BaronLongshore
    .destroy 5088 >> |cRXP_WARN_从背包中删除|r |T133735:0|t[控制台操作手册] |cRXP_WARN_，因为后续不再需要|r

step
    #completewith BaronLongshore
    >>击杀 |cRXP_ENEMY_南海歹徒|r 和 |cRXP_ENEMY_南海炮兵|r
    .complete 887,1 --Southsea Brigand (12)
    .mob +南海歹徒
    .complete 887,2 --Southsea Cannoneer (6)
    .mob +南海炮兵

step << Orc Rogue/Troll Rogue
    #completewith Southsea
    >>击杀 |cRXP_ENEMY_塔赞|r，并从他身上拾取 |cRXP_LOOT_背包|r
    >>|cRXP_WARN_他会沿着山坡上下巡逻|r
    .complete 1963,1 --Tazan's Satchel (1)
    .unitscan 塔赞

step
    #label BaronLongshore
    #loop
    .goto The Barrens,64.21,47.14,0
    .goto The Barrens,63.57,49.14,0
    .goto The Barrens,62.64,49.72,0
    .goto The Barrens,64.21,47.14,50,0
    .goto The Barrens,63.57,49.14,50,0
    .goto The Barrens,62.64,49.72,50,0
    >>击杀 |cRXP_ENEMY_巴隆·朗绍尔|r，并拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_他会出现在其中一个营地|r
    .complete 895,1 --Baron Longshore's Head (1)
    .unitscan 巴隆·朗绍尔
    .isOnQuest 895

step
    #label Southsea
    #loop
    .goto The Barrens,64.23,47.10,0
    .goto The Barrens,64.40,44.09,50,0
    .goto The Barrens,63.62,46.26,50,0
    .goto The Barrens,64.23,47.10,50,0
    >>击杀 |cRXP_ENEMY_南海歹徒|r 和 |cRXP_ENEMY_南海炮兵|r
    .complete 887,1 --Southsea Brigand (12)
    .mob +南海歹徒
    .complete 887,2 --Southsea Cannoneer (6)
    .mob +南海炮兵
    .isOnQuest 887

step << Orc Rogue/Troll Rogue
    .goto The Barrens,63.70,44.32,50,0
    .goto The Barrens,62.70,44.07,50,0
    .goto The Barrens,62.18,44.47
    >>击杀 |cRXP_ENEMY_塔赞|r，并从他身上拾取 |cRXP_LOOT_背包|r
    >>|cRXP_WARN_他会沿着山坡上下巡逻|r
    .complete 1963,1 --Tazan's Satchel (1)
    .unitscan 塔赞
    .isOnQuest 1963
    .maxlevel 16

step
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 对话
    .turnin 887 >>交任务：南海海盗
    .turnin 895 >>交任务：通缉：巴隆·朗绍尔
    .accept 890 >>接任务：丢失的货物
    .target 加兹鲁维
    .isOnQuest 887,895

step
    #optional
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 对话
    .accept 890 >>接任务：丢失的货物
    .target 加兹鲁维
    .isQuestTurnedIn 887

step
    .goto The Barrens,63.35,38.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪兹维格|r 对话
    .turnin 1492 >>交任务：码头管理员迪兹维格
    .turnin 890 >>交任务：丢失的货物
    .accept 892 >>接任务：丢失的货物
    .accept 896 >>接任务：矿工的宝贝
    .target 码头管理员迪兹维格
    .isQuestTurnedIn 887

step
    .goto The Barrens,63.35,38.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪兹维格|r 对话
    .turnin 1492 >>交任务：码头管理员迪兹维格
    .accept 896 >>接任务：矿工的宝贝
    .target 码头管理员迪兹维格

step
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 对话
    .turnin 892 >>交任务：丢失的货物
    .accept 888 >>接任务：被窃的货物
    .target 加兹鲁维
    .isQuestTurnedIn 887

step << Undead Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135353:0|t[普通长剑] |cRXP_BUY_。|r
    .collect 2024,1,850,1 --Collect Espadon (1)
    .money <0.6397
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5

step << Undead Warrior
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑] |cRXP_WARN_（达到16级时）|r
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp >16,1

step << Undead Warrior
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135353:0|t[普通长剑]
    .use 2024
    .itemcount 2024,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
    .xp <16,1

step << Troll Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135147:0|t[法师之杖] |cRXP_BUY_。|r
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
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T132394:0|t[芒刺斧] |cRXP_BUY_。|r
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
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T133046:0|t[巨型石锤] |cRXP_BUY_。|r
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
    #season 0
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135147:0|t[法师之杖] |cRXP_BUY_。|r
    .collect 2030,1,850,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9

step << Shaman
    #season 0
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9

step << Shaman
    #season 2
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T133052:0|t[重型钉锤] |cRXP_BUY_。|r
    .collect 2028,1,850,1 --Collect Hammer (1)
    .money <0.5065
    .target 艾隆萨尔
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5

step << Shaman
    #season 2
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T133052:0|t[重型钉锤]
    .use 2028
    .itemcount 2028,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.5

step << Rogue
    #season 0
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买|r |T135343:0|t[战士阔剑] |cRXP_BUY_。|r
    .collect 2027,1,850,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 艾隆萨尔

step << Rogue
    #season 0
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6

step << Rogue
    #season 0
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他再购买一把副手用的|r |T135343:0|t[战士阔剑] |cRXP_BUY_。|r
    .collect 2027,2,850,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target 艾隆萨尔

step << Rogue
    #season 0
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135343:0|t[战士阔剑]
    .use 2027
    .itemcount 2027,1
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6

step << Rogue
    #season 2
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_艾隆萨尔|r |cRXP_BUY_对话，并向他购买一到两把|r |T135302:0|t[三角短剑] |cRXP_BUY_。|r
    .collect 2208,1,850,1 --Collect Poniard (1)
    .money <0.3842
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.4
    .target 艾隆萨尔

step << Rogue
    #season 2
    #optional
    #completewith FlyToXroads1
    +|cRXP_WARN_装备|r |T135302:0|t[三角短剑]
    .use 2208
    .itemcount 2208,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.4

step
    #label FlyToXroads1
    #completewith XroadsTurnins3
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 交谈
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 380
    .isQuestComplete 845

step
    #completewith next
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙

step
    #loop
    .goto The Barrens,55.27,37.82,0
    .goto The Barrens,48.33,36.75,0
    .goto The Barrens,55.27,37.82,80,0
    .goto The Barrens,53.84,38.52,80,0
    .goto The Barrens,52.63,38.07,80,0
    .goto The Barrens,49.49,37.20,80,0
    .goto The Barrens,48.33,36.75,80,0
    >>完成击杀 |cRXP_ENEMY_斑马|r，并拾取它们的 |cRXP_LOOT_蹄子|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob 快步斑马

step
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 对话
    .turnin 5041 >>交任务：十字路口的补给品
    .turnin 872 >>交任务：野猪人的头目
    .target 索克
    .isQuestComplete 5041
    .isQuestComplete 872

step
    #optional
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 对话
    .turnin 872 >>交任务：野猪人的头目
    .target 索克
    .isQuestComplete 872

step
    #optional
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 对话
    .turnin 5041 >>交任务：十字路口的补给品
    .target 索克
    .isQuestComplete 5041

step
    #optional
    #completewith RegtharDeathgate1
    .abandon 871 >>放弃任务：野猪人的袭击
    .abandon 5041 >>放弃任务：十字路口的补给品

step
    #label XroadsTurnins3
    .goto The Barrens,52.23,31.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 845 >>交任务：斑马的威胁
    .accept 903 >>接任务：草原上的徘徊者
    .target 瑟格拉·黑棘

step << skip
    .goto The Barrens,51.67,29.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_巴尔格|r 对话
    >>|cRXP_BUY_向他购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_。|r
    .collect 2515,1200,850,1 << Hunter --Sharp Arrow (1200)
    .target 巴尔格

step << Tauren Hunter
    .goto The Barrens,51.67,29.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_巴尔格|r 对话
    >>|cRXP_BUY_向他购买|r |T132384:0|t[重弹丸] |cRXP_BUY_。|r
    .collect 2519,1000,850,1 << Hunter --Heavy Shot (1000)
    .target 巴尔格

step << Troll Hunter/Orc Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_阿瑟罗克|r 交谈
    .vendor >> |cRXP_BUY_如果有货，向他购买一把|r |T135490:0|t[|cRXP_FRIENDLY_精良的长弓|r] |cRXP_BUY_并补充箭矢|r
    >>|cRXP_WARN_如果没货，改买一把|r |T135490:0|t[强化弓] |cRXP_WARN_作为替代|r
    .collect 2515,1200,870,1 << Hunter --Sharp Arrow (1200)
    .target 阿瑟罗克

step << Tauren Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并向他购买|r |T135613:0|t[猎人火枪] |cRXP_BUY_。|r
    .collect 2511,1,870,1 --Collect Hunter's Boomstick (1)
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<4.9
    .target 阿瑟罗克

step
    #completewith RegtharDeathgate1
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .maxlevel 16

step
    #completewith next
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 850 >>接任务：科卡尔首领
    .accept 855 >>接任务：半人马护腕
    .target 雷戈萨·死门

step
    #xprate >2.09
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 850 >>接任务：科卡尔首领
    .target 雷戈萨·死门

step
    #optional
    #label RegtharDeathgate1

step
    #xprate <2.1
    #completewith KodobaneTurnin
    >>击杀 |cRXP_ENEMY_科卡尔牧民|r 和 |cRXP_ENEMY_科卡尔召雷师|r，并拾取 |cRXP_LOOT_半人马护腕|r
    >>|cRXP_WARN_这项任务不必现在完成|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔牧民
    .mob 科卡尔召雷师
    .isOnQuest 855

step
    #completewith Barak
    >>在遗忘之池周围收集 |cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_这项任务不必现在完成|r
    .complete 848,1 --Collect Fungal Spores (x4)

step << Druid
    #season 2
    .goto The Barrens,44.73,22.18
    >>拾取地上的 |cRXP_PICK_被遗弃的钳嘴龟巢（Abandoned Snapjaw Nest）|r，取得 |T294479:0|t[|cRXP_LOOT_被抛弃的钳嘴龟的蛋|r]
    .collect 208682,1 --Abandoned Snapjaw Egg (1)
    .train 416049,1

step
    .goto The Barrens,45.06,22.54
    >>潜入水下，前往 |cRXP_PICK_冒泡的裂隙|r
    .complete 870,1 --Explore the waters of the Forgotten Pools

step
    #label Barak
    .goto The Barrens,42.82,23.52
    >>击杀 |cRXP_ENEMY_巴拉克·科多班恩|r，并拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_巴拉克·科多班恩|r的近战攻击伤害很高，身边还有一名|cRXP_ENEMY_科卡尔牧民|r护卫。他们会用网束缚你，并从远处射击|r
    .complete 850,1 --Kodobane's Head (1)
    .mob 巴拉克·科多班恩

step
    #completewith KodobaneTurnin
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙

step
    #xprate >2.09
    #loop
    .goto The Barrens,41.62,23.42,0
    .goto The Barrens,41.62,23.42,50,0
    .goto The Barrens,41.30,24.31,50,0
    .goto The Barrens,40.52,22.88,50,0
    .goto The Barrens,41.00,21.19,50,0
    .goto The Barrens,40.32,20.69,50,0
    >>击杀 |cRXP_ENEMY_草原徘徊者|r，并拾取它们的 |cRXP_LOOT_爪子|r 和 |cRXP_LOOT_獠牙|r
    .complete 903,1 --Prowler Claws (7)
    .complete 821,1 --Savannah Lion Tusk (5)
    .mob 草原徘徊者

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 850 >>交任务：科卡尔首领
    .accept 851 >>接任务：狂热的维罗戈
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #xprate <2.1
    #label KodobaneTurnin
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 850 >>交任务：科卡尔首领
    .accept 851 >>接任务：狂热的维罗戈
    .target 雷戈萨·死门

step
    #xprate <2.1
    #optional
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 851 >>接任务：狂热的维罗戈
    .target 雷戈萨·死门
    .isQuestTurnedIn 850

step
    #optional
    #xprate >2.09
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 850 >>交任务：科卡尔首领
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #xprate >2.09
    #label KodobaneTurnin
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 850 >>交任务：科卡尔首领
    .target 雷戈萨·死门

step
    #completewith next
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_这项任务不必现在完成|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙

step
    #loop
    .goto The Barrens,41.62,23.42,0
    .goto The Barrens,41.62,23.42,50,0
    .goto The Barrens,41.30,24.31,50,0
    .goto The Barrens,40.52,22.88,50,0
    .goto The Barrens,41.00,21.19,50,0
    .goto The Barrens,40.32,20.69,50,0
    >>击杀 |cRXP_ENEMY_草原徘徊者|r，并拾取它们的 |cRXP_LOOT_爪子|r 和 |cRXP_LOOT_獠牙|r
    .complete 903,1 --Prowler Claws (7)
    .complete 821,1 --Savannah Lion Tusk (5)
    .mob 草原徘徊者

step
    #xprate <2.1
    #loop
    .goto The Barrens,41.84,14.81,0
    .goto The Barrens,41.51,19.09,60,0
    .goto The Barrens,40.82,18.23,60,0
    .goto The Barrens,40.95,16.80,60,0
    .goto The Barrens,41.23,15.79,60,0
    .goto The Barrens,41.21,14.75,60,0
    .goto The Barrens,41.84,14.81,60,0
    >>击杀 |cRXP_ENEMY_巫翼鹰身人|r 和 |cRXP_ENEMY_巫翼游荡者|r，并拾取它们的 |cRXP_LOOT_利爪|r
    .complete 867,1 --Witchwing Talon (8)
    .mob 巫翼鹰身人
    .mob 巫翼游荡者

step << skip --!Tauren
    #completewith next
    .zone Stonetalon Mountains >> 前往石爪山脉
    .zoneskip Stonetalon Mountains
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723

step << skip --!Tauren
    #completewith next
    .goto Stonetalon Mountains,82.57,98.63,60,0
    .goto Stonetalon Mountains,80.10,98.20,40,0
    .goto Stonetalon Mountains,77.17,98.61,40 >> 沿着左侧小路向上走
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723

step << skip --!Tauren
    .goto Stonetalon Mountains,74.69,98.10
    .goto Thunder Bluff,56.65,18.96,30 >>|cRXP_WARN_跳到其中一个笼子上，退出并重新登录，利用登出跳跃|r
    .link https://www.youtube.com/watch?v=cp2YI86AO4Y&ab >> |cRXP_WARN_点击这里查看示例|r
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723

step << skip --!Tauren
    #completewith RFCTurninsTBDisabled
    .goto Thunder Bluff,50.75,37.07,40 >> 乘坐升降机前往雷霆崖
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC

step << skip --!Tauren
    #completewith next
    .goto Thunder Bluff,69.88,30.90,80 >> 前往长者高地
    .isOnQuest 5724
    .isQuestComplete 5723
    .dungeon RFC

step << skip --!Tauren
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5724 >> 交任务：归还背包
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723

step << skip --!Tauren
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5724 >> 交任务：归还背包
    .target 拉哈罗
    .dungeon RFC
    .isOnQuest 5724

step << skip --!Tauren
    #label RFCTurninsTBDisabled
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拉哈罗|r 交谈
    .turnin 5723 >> 交任务：试探敌人
    .target 拉哈罗
    .dungeon RFC
    .isQuestComplete 5723

step << skip --!Tauren
    #completewith Samophlange
    .hs >> 使用炉石返回十字路口
    .cooldown item,6948,>0
    .use 6948
    .dungeon RFC

step << skip --!Tauren
    #completewith Samophlange
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔尔|r 对话
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .cooldown item,6948,<0
    .zoneskip The Barrens
    .dungeon RFC

step
    #optional
    .abandon 5723 >> 放弃任务：试探敌人
    .dungeon RFC

step
    #optional
    .abandon 5725 >> 放弃任务：毁灭之力
    .dungeon RFC

step
    #optional
    .abandon 5728 >> 放弃任务：隐藏的敌人
    .dungeon RFC

step
    #optional
    .abandon 5761 >> 放弃任务：饥饿者塔拉加曼
    .dungeon RFC

step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <2.1
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .turnin 848 >> 交任务：菌类孢子
    .target 药剂师赫布瑞姆
    .isQuestComplete 848
    .dungeon RFC

step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <2.1
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    .turnin 867 >>交任务：鹰身强盗
    .accept 875 >>接任务：鹰身人首领
    .target 达索克·快刀
    .dungeon RFC

step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <2.1
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .turnin 870 >> 交任务：遗忘之池
    .accept 877 >> 接任务：死水绿洲
    .target 图加·符文图腾
    .dungeon RFC

step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <2.1
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 903 >>交任务：草原上的徘徊者
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘
    .dungeon RFC

step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <2.1
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，并拾取他的 |cRXP_LOOT_埃其亚基的皮|r
    >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后没有出现，或出现后你没有取得击杀归属，请跳过此步骤|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327
    .dungeon RFC

step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <2.1
    .goto The Barrens,52.23,31.00
    .abandon 881 >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后没有出现，或出现后你没有取得击杀归属，请放弃埃其亚基任务，然后回到城镇重新接受|r
    .itemcount 5100,<1 --Echeyakee's Hide (0)
    .dungeon RFC

step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <2.1
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘
    .itemcount 5100,<1 --Echeyakee's Hide (0)
    .dungeon RFC

step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <2.1
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，并拾取他的 |cRXP_LOOT_埃其亚基的皮|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327
    .dungeon RFC

step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <2.1
    #completewith Samophlange
    +|cRXP_WARN_小心该区域的|r |cRXP_ENEMY_赤鳞镰爪龙|r |cRXP_WARN_。它们最高18级，还会使用|r |T132152:0|t[痛击]
    .dungeon RFC
    .xp >17,1

step << skip --!Tauren Orc !Warrior !Shaman/Troll !Warrior !Shaman
    #xprate <2.1
    #completewith Samophlange
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
    .dungeon RFC

step
    #xprate <2.1
    #completewith Samophlange
    +|cRXP_WARN_小心该区域的|r |cRXP_ENEMY_赤鳞镰爪龙|r |cRXP_WARN_。它们最高18级，还会使用|r |T132152:0|t[痛击]
    --.dungeon !RFC
    .xp >17,1

step
    #xprate >2.09
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .turnin 848 >> 交任务：菌类孢子
    .target 药剂师赫布瑞姆
    .isQuestComplete 848

step
    #xprate >2.09
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .turnin 870 >> 交任务：遗忘之池
    .accept 877 >> 接任务：死水绿洲
    .target 图加·符文图腾

step
    #xprate >2.09
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 903 >>交任务：草原上的徘徊者
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘

step
    #xprate >2.09
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，并拾取他的 |cRXP_LOOT_埃其亚基的皮|r
    >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后没有出现，或出现后你没有取得击杀归属，请跳过此步骤|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327

step
    #xprate >2.09
    #optional
    .goto The Barrens,52.23,31.00
    .abandon 881 >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后没有出现，或出现后你没有取得击杀归属，请放弃埃其亚基任务，然后回到城镇重新接受|r
    .itemcount 5100,<1 --Echeyakee's Hide (0)

step
    #xprate >2.09
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘
    .itemcount 5100,<1 --Echeyakee's Hide (0)

step
    #optional
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 881 >>交任务：埃其亚基
    .accept 905 >>接任务：狂暴的镰爪龙
    .target 瑟格拉·黑棘
    .xp <20,1

step
    #optional
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克
    .xp <20,1

step
    #optional
    .maxlevel 19,NorthBarrensSkip

step
    #xprate <2.1
    #completewith Samophlange
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟
    --.dungeon !RFC

step
    #xprate >2.09
    #completewith Samophlange
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟

step
    #xprate <2.1
    .goto The Barrens,43.80,12.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_弗朗恩|r 交谈
    >>|cRXP_FRIENDLY_弗朗恩|r |cRXP_WARN_出售|r |T133476:0|t[|cRXP_FRIENDLY_重型尖刺钉锤|r] |cRXP_WARN_，该物品限量供应|r << Orc Warrior/Troll Warrior/Tauren Warrior
    .vendor	>> 出售杂物并修理装备
    .target 弗朗恩·凝血
    --.dungeon !RFC

step
    #xprate >2.09
    #completewith next
    >>击杀你看到的每一只 |cRXP_ENEMY_迅猛龙|r，并拾取 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙

step
    #label Samophlange
    .goto The Barrens,52.40,11.65
    >>点击 |cRXP_PICK_控制台|r
    .turnin 894 >>交任务：什么什么平衡器
    .accept 900 >>接任务：什么什么平衡器

step
    .goto The Barrens,52.33,11.57
    >>点击 |cRXP_PICK_阀门|r
    >>|cRXP_WARN_小心！关闭阀门后会刷新两只怪物|r
    .complete 900,2 --Shut off Fuel Control Valve (1)
    .isOnQuest 900

step
    .goto The Barrens,52.29,11.40
    >>点击 |cRXP_PICK_阀门|r
    >>|cRXP_WARN_关闭阀门后会刷新一只怪物|r
    .complete 900,3 --Shut off Regulator Valve (1)
    .isOnQuest 900

step
    .goto The Barrens,52.40,11.40
    >>点击 |cRXP_PICK_阀门|r
    .complete 900,1 --Shut off Main Control Valve (1)
    .isOnQuest 900

step
    .goto The Barrens,52.40,11.65
    >>点击 |cRXP_PICK_控制台|r
    .turnin 900 >>交任务：什么什么平衡器
    .accept 901 >>接任务：什么什么平衡器
    .isQuestComplete 900

step
    #optional
    .goto The Barrens,52.40,11.65
    >>点击 |cRXP_PICK_控制台|r
    .accept 901 >>接任务：什么什么平衡器
    .isQuestTurnedIn 900

step
    .goto The Barrens,52.84,10.40
    >>在建筑内击杀 |cRXP_ENEMY_工匠斯尼格斯|r，并拾取他的 |cRXP_LOOT_控制台钥匙|r
    .complete 901,1 --Console Key (1)
    .mob 工匠斯尼格斯
    .isQuestTurnedIn 900

step
    .goto The Barrens,52.40,11.65
    >>点击 |cRXP_PICK_控制台|r
    .turnin 901 >>交任务：什么什么平衡器
    .accept 902 >>接任务：什么什么平衡器
    .isQuestTurnedIn 900

step
    #completewith Ignition
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟

step
    #loop
    .goto The Barrens,54.3,12.3,0
    .goto The Barrens,54.3,12.3,90,0
    .goto The Barrens,54.6,16.7,90,0
    .goto The Barrens,42.6,15.1,90,0
    >>击杀 |cRXP_ENEMY_迅猛龙|r，并拾取它们的 |cRXP_LOOT_头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob 赤鳞鞭尾龙
    .mob 赤鳞尖啸龙
    .mob 赤鳞镰爪龙

step
    #optional
    .goto The Barrens,56.5,7.5
    .xp 16>> 刷怪升到16级

step
    #label Ignition
    .goto The Barrens,56.52,7.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹克兰克的伐木机|r 交谈（位于淤泥沼泽）
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r |cRXP_WARN_刷新时间较长；如果竞争激烈，可以考虑跳过这项任务|r
    .accept 858 >>接任务：打火钥匙
    .target 维兹克兰克的伐木机

step
    #completewith next
    +|cRXP_WARN_小心！如果|r |cRXP_ENEMY_工头葛瑞尔斯|r |cRXP_WARN_或|r |cRXP_ENEMY_淤泥兽|r |cRXP_WARN_在场，它们是19级的强力稀有怪|r
    .unitscan 工头葛瑞尔斯
    .unitscan 淤泥兽

step
    .goto The Barrens,56.52,8.47,20,0
    .goto The Barrens,56.34,8.24,12,0
    .goto The Barrens,56.12,8.33,12,0
    .goto The Barrens,56.05,8.49,12,0
    .goto The Barrens,56.13,8.56,12,0
    .goto The Barrens,56.34,8.24
    >>击杀 |cRXP_ENEMY_鲁格维兹主管|r，并拾取他的 |cRXP_LOOT_钥匙|r
    >>|cRXP_WARN_他会在平台上来回巡逻|r
    .complete 858,1 --Ignition Key (1)
    .mob 鲁格维兹主管
    .isOnQuest 858

step
    .goto The Barrens,56.52,7.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹克兰克的伐木机|r 交谈
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r |cRXP_WARN_刷新时间较长；如果竞争激烈，可以考虑跳过这项任务|r
    >>|cRXP_WARN_这会开始护送任务；出发前确保生命值全满|r
    .turnin 858 >>交任务：打火钥匙
    .accept 863,1 >>接任务：逃跑
    .target 维兹克兰克的伐木机
    .isQuestComplete 858

step
    #optional
    .goto The Barrens,56.52,7.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维兹克兰克的伐木机|r 交谈
    >>|cRXP_FRIENDLY_维兹克兰克的伐木机|r |cRXP_WARN_刷新时间较长；如果竞争激烈，可以考虑跳过这项任务|r
    >>|cRXP_WARN_这会开始护送任务；出发前确保生命值全满|r
    .accept 863,1 >>接任务：逃跑
    .target 维兹克兰克的伐木机
    .isQuestTurnedIn 858

step
    #label Slugs
    .goto The Barrens,55.80,7.76,30,0
    .goto The Barrens,55.51,7.13
    >>|cRXP_WARN_伐木机到达高处时会刷新两名|r |cRXP_ENEMY_风险投资公司雇佣兵|r |cRXP_WARN_。击杀他们，然后等待终点处的剧情事件|r
    .complete 863,1 --Escort Wizzlecrank out of the Venture Co. drill site (1)
    .mob 风险投资公司雇佣兵
    .mob 风险投资公司苦工
    .mob 监工格里比
    .isOnQuest 863

step
    #completewith next
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟

step
    #label CatsEye
    #loop
    .goto The Barrens,61.51,4.43,0
    .goto The Barrens,61.46,4.50,40,0
    .goto The Barrens,61.06,3.63,40,0
    .goto The Barrens,61.63,3.37,40,0
    .goto The Barrens,62.14,3.52,40,0
    .goto The Barrens,61.94,4.53,40,0
    .goto The Barrens,61.85,5.37,40,0
    .goto The Barrens,61.44,5.56,40,0
    .goto The Barrens,61.17,5.05,40,0
    .goto The Barrens,61.51,4.43,40,0
    >>击杀 |cRXP_ENEMY_风险投资公司执行者|r 和 |cRXP_ENEMY_风险投资公司监督|r，并拾取掉落的 |cRXP_LOOT_猫眼翡翠|r
    >>|cRXP_WARN_如果击杀25只以上仍未掉落，可以跳过这项任务|r
    .complete 896,1 -- Cats Eye Emerald (1)
    .mob 风险投资公司执行者
    .mob 风险投资公司监督

step
    #ssf
    #loop
    .goto The Barrens,61.51,4.43,0
    .goto The Barrens,61.46,4.50,40,0
    .goto The Barrens,61.06,3.63,40,0
    .goto The Barrens,61.63,3.37,40,0
    .goto The Barrens,62.14,3.52,40,0
    .goto The Barrens,61.94,4.53,40,0
    .goto The Barrens,61.85,5.37,40,0
    .goto The Barrens,61.44,5.56,40,0
    .goto The Barrens,61.17,5.05,40,0
    .goto The Barrens,61.51,4.43,40,0
    >>击杀 |cRXP_ENEMY_风险投资公司监督|r，并拾取他们的 |T132794:0|t[|cRXP_LOOT_灯油|r]
    .collect 814,5,103,1 --Flask of Oil (5)
    .dungeon DM

step
    #ah
    #loop
    .goto The Barrens,61.51,4.43,0
    .goto The Barrens,61.46,4.50,40,0
    .goto The Barrens,61.06,3.63,40,0
    .goto The Barrens,61.63,3.37,40,0
    .goto The Barrens,62.14,3.52,40,0
    .goto The Barrens,61.94,4.53,40,0
    .goto The Barrens,61.85,5.37,40,0
    .goto The Barrens,61.44,5.56,40,0
    .goto The Barrens,61.17,5.05,40,0
    .goto The Barrens,61.51,4.43,40,0
    >>击杀 |cRXP_ENEMY_风险投资公司监督|r，并拾取他们的 |T132794:0|t[|cRXP_LOOT_灯油|r]
    >>|cRXP_WARN_也可以改从拍卖行购买|r
    .collect 814,5,103,1 --Flask of Oil (5)
    .dungeon DM

step << skip
    .goto The Barrens,60.48,3.76
    .goto Orgrimmar,40.05,68.05,30 >>|cRXP_WARN_跳到木梁上，退出并重新登录，利用登出跳跃。如果没有成功，就跑回奥格瑞玛|r
    .link https://www.youtube.com/watch?v=U7YfoaO-X8E&ab_channel=RestedXP >> |cRXP_WARN_点击这里查看示例|r
    .zoneskip Orgrimmar

step
    #completewith SpiritsPickup
    .goto Kalimdor,56.81,45.47
    .zone Orgrimmar >>从奥格瑞玛西侧入口进入

step
    #optional
    #label NorthBarrensSkip

step
    #completewith next
    .skill firstaid,40 >> |cRXP_WARN_制作|r |T133685:0|t[亚麻绷带] |cRXP_WARN_，直到急救技能达到40或更高|r
    .skill firstaid,<1,1

step
    .goto Orgrimmar,34.18,84.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿诺克|r 交谈
    >>|cRXP_WARN_如果没有足够的|r |T132889:0|t[亚麻布] |cRXP_WARN_将技能提升到40，请跳过此步骤|r
    .train 3276 >> 学习|T133688:0|t[厚亚麻绷带]
    .target 阿诺克
    .skill firstaid,<1,1

step
    #completewith next
    .skill firstaid,50 >> |cRXP_WARN_制作|r |T133688:0|t[厚亚麻绷带] |cRXP_WARN_，直到技能达到50或更高|r
    .skill firstaid,<1,1

step
    .goto Orgrimmar,34.18,84.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_阿诺克|r 交谈
    >>|cRXP_WARN_如果没有足够的|r |T132889:0|t[亚麻布] |cRXP_WARN_将技能提升到50，请跳过此步骤|r
    .train 3274 >> 学习中级急救
    .target 阿诺克
    .skill firstaid,<40,1

step
    #completewith next
    +|cRXP_WARN_确保不要卖掉你的|r |T132794:0|t[|cRXP_LOOT_灯油|r]
    .itemcount 814,5
    .dungeon DM

step << Priest
    #optional
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r 交谈
    .train 8102 >> 学习职业技能
    .target 乌尔库
    .xp <16,1
    .xp >18,1

step << Priest
    #optional
    #season 2
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r 交谈
    .train 527 >> 学习|T135894:0|t[驱散魔法]
    >>|cRXP_WARN_之后获取符文时需要|r |T135894:0|t[驱散魔法] |cRXP_WARN_。|r
    .target 乌尔库
    .xp <18,1

step << Priest
    #optional
    #season 0
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r 交谈
    .train 970 >> 学习职业技能
    .target 乌尔库
    .xp <18,1

step << Mage
    #optional
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_皮菲瑞多|r 交谈
    .train 3140 >> 学习职业技能
    .target 皮菲瑞多
    .xp <18,1

step << !Tauren !Undead
    #xprate <2.1
    .goto Orgrimmar,54.097,68.407
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格雷什卡|r 交谈
    .turnin 6384 >>交任务：飞往奥格瑞玛
    .accept 6385 >>接任务：双足飞龙管理员多拉斯
    .target 旅店老板格雷什卡
    .isOnQuest 6384

step << !Tauren !Undead
    #xprate <2.1
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
    .turnin 6385 >> 交任务：双足飞龙管理员多拉斯
    .accept 6386 >> 接任务：返回十字路口
    .target 多拉斯
    .isOnQuest 6385

step << !Tauren !Undead
    #xprate <2.1
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
    .accept 6386 >> 接任务：返回十字路口
    .target 多拉斯
    .isQuestTurnedIn 6385

step << Tauren/Undead
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
    >>|cRXP_WARN_不要飞往任何地方！|r
    .fp Orgrimmar >> 开通奥格瑞玛飞行点
    .target 多拉斯
    .isQuestAvailable 4921

step << Shaman
    #season 2
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
    >>|cRXP_WARN_务必学会|r |T136075:0|t[净化术] |cRXP_WARN_，之后获取符文时会用到|r
    .train 8019 >> 学习职业技能
    .target 卡德里斯
    .xp <16,1
    .xp >18,1

step << Shaman
    #optional
    #season 2
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
    >>|cRXP_WARN_务必学会|r |T136075:0|t[净化术] |cRXP_WARN_，之后获取符文时会用到|r
    .train 913 >> 学习职业技能
    .target 卡德里斯
    .xp <18,1

step << Shaman
    #season 0
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
    .train 8019 >> 学习职业技能
    .target 卡德里斯
    .xp <16,1
    .xp >18,1

step << Shaman
    #optional
    #season 0
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 交谈
    .train 913 >> 学习职业技能
    .target 卡德里斯
    .xp <18,1

step
    #xprate <2.1
    .goto Orgrimmar,38.94,38.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_佐尔|r 对话
    .accept 1061 >>接任务：石爪之灵
    .target 佐尔·孤树

step << Shaman/Hunter
    #season 2
    .goto Orgrimmar,38.923,38.398
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_佐尔·孤树|r 对话
    .train 409580 >>|cRXP_WARN_购买并使用|r |T133739:0|t|cRXP_LOOT_[论述：雄狮之心]|r |cRXP_WARN_来学习|r |T132185:0|t[雄狮之心] << Hunter
    .train 425336 >>|cRXP_WARN_购买并使用|r |T133747:0|t|cRXP_LOOT_[启示：萨满之怒]|r |cRXP_WARN_来学习|r |T136088:0|t[萨满之怒] << Shaman
    .use 226401 << Hunter -- Treatise on the Heart of the Lion
    .use 226402 << Shaman -- Revelation of Shamanistic Rage
    .target 佐尔·孤树
    .money <0.5

step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_申苏尔|r 交谈
    .train 1804 >> 学习|T136058:0|t[开锁]
    .train 921 >> 学习|T133644:0|t[搜索]
    .accept 2379 >> 接任务：赞杜沙
    .target 申苏尔

step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 对话
    .turnin 1963 >> 交任务：碎手氏族
    .accept 1858 >> 接任务：碎手氏族
    .target 瑟祖克
    .isQuestComplete 1963

step << Orc Rogue/Troll Rogue
    #optional
    .goto Orgrimmar,42.74,53.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 对话
    .accept 1858 >> 接任务：碎手氏族
    .target 瑟祖克
    .isQuestTurnedIn 1963

step << Rogue
    .goto Orgrimmar,42.72,52.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赞杜沙|r 对话
    .turnin 2379 >>交任务：赞杜沙
    .accept 2382 >>接任务：棘齿城的维尼克斯
    .target 赞杜沙

step << Orc Rogue/Troll Rogue
    #completewith next
    .goto Orgrimmar,42.10,49.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_雷库尔|r|cRXP_BUY_对话，并向他购买|r |T134065:0|t[潜行者工具] |cRXP_BUY_。|r
    .collect 5060,1,1858,1 --Collect Thieves' Tools (1)
    .target 雷库尔
    .money <0.15
    .isQuestTurnedIn 1963

step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.52
    >>|cRXP_WARN_使用|r |T136058:0|t[开锁] |cRXP_WARN_打开|r |T133626:0|t[塔赞的背包]
    .complete 1858,1 --Tazan's Logbook (1)
    .itemcount 5060,1
    .isQuestTurnedIn 1963

step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,53.99,68.05
    >>|cRXP_WARN_使用|r |T133644:0|t[搜索] |cRXP_WARN_，目标为旅店内的|r |cRXP_ENEMY_加摩尔|r |cRXP_WARN_。用他的钥匙打开|r |T133626:0|t[塔赞的背包]
    .collect 7208,1,1858,1 --Tazan's Key
    .complete 1858,1 --Tazan's Logbook (1)
    .isQuestTurnedIn 1963

step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 对话
    .turnin 1858 >>交任务：碎手氏族
    .target 瑟祖克
    .isQuestTurnedIn 1963

step << Rogue
    .goto Orgrimmar,45.64,55.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_卡雷斯|r|cRXP_BUY_对话，并向他购买一到两把|r |T135342:0|t[波刃短剑] |cRXP_BUY_。|r
    .collect 2209,1,3281,1 --Collect Kris (1)
    .money <0.7115
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.8
    .target 卡雷斯

step << Orc Rogue/Troll Rogue
    #optional
    #completewith FoodandWater2
    .abandon 1963 >> 放弃任务：碎手氏族

step << Rogue
    #optional
    #completewith FoodandWater2
    +|cRXP_WARN_装备|r |T135342:0|t[波刃短剑]
    .use 2209
    .itemcount 2209,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.8
    .xp <19,1

step << Rogue
    #optional
    #completewith FoodandWater2
    +|cRXP_WARN_达到19级后，装备|r |T135342:0|t[波刃短剑]
    .use 2209
    .itemcount 2209,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.8
    .xp >19,1

step << Warlock
    .goto Orgrimmar,48.62,46.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米尔科特|r 交谈
    .train 1455 >> 学习职业技能
    .target 米尔科特
    .xp <16,1
    .xp >18,1

step << Warlock
    #optional
    .goto Orgrimmar,48.62,46.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_米尔科特|r 交谈
    .train 1014 >> 学习职业技能
    .target 米尔科特
    .xp <18,1

step << Warlock
    .goto Orgrimmar,47.54,46.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_库古尔|r 交谈并购买 |T133738:0|t[魔典：牺牲]
    .collect 16351,1,3281,1 --Grimoire of Sacrifice (Rank 1) (1)
    .target 库古尔
    .xp <16,1
    .xp >18,1

step << Warlock
    .goto Orgrimmar,47.54,46.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_库古尔|r 对话，并购买 |T133738:0|t[魔典：火焰箭（等级 3）]
    .collect 16316,1,3281,1 --Grimoire of Firebolt (Rank 3) (1)
    .target 库古尔
    .xp <18,1

step << Warrior
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格雷兹|r 交谈
    .train 285 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <16,1
    .xp >18,1

step << Warrior
    #optional
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格雷兹|r 交谈
    .train 8198 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <18,1

step << Hunter
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥玛克|r 交谈
    .train 13795 >> 学习职业技能
    .target 奥玛克
    .xp <16,1
    .xp >18,1

step << Hunter
    #optional
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥玛克|r 交谈
    .train 2643 >> 学习职业技能
    .target 奥玛克
    .xp <18,1

step << Hunter
    .goto Orgrimmar,66.34,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肖祖|r 交谈
    .train 24557 >> 学习宠物技能
    .target 肖祖
    .xp <18,1

step << Troll Hunter/Orc Hunter/Priest
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈纳什|r 对话
    .train 227 >>学习法杖技能
    .target 哈纳什
    .money <0.100

step << Tauren Hunter
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈纳什|r 对话
    .train 264 >>学习弓技能
    .target 哈纳什

step << Tauren Warrior/Undead Warrior
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈纳什|r 对话
    .train 197 >>学习双手斧技能
    .train 227 >>学习法杖技能
    .target 哈纳什

step << Hunter
    .goto Orgrimmar,81.17,18.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_对话，并向他购买|r |T135490:0|t[强化弓] |cRXP_BUY_。|r
    .collect 3026,1,3281,1 --Collect Reinforced Bow (1)
    .money <0.3588
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.4
    .target 森度吉安
    .train 264,3

step << Hunter
    #optional
    #completewith FoodandWater2
    +|cRXP_WARN_装备|r |T135490:0|t[强化弓]
    .use 3026
    .itemcount 3026,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.4

step << Warrior
    .goto Orgrimmar,81.17,18.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_森度吉安|r|cRXP_BUY_对话，并向他购买|r |T135423:0|t[大型战斧] |cRXP_BUY_。|r
    .collect 926,1,3281,1 --Collect Battle Axe (1)
    .money <1.021
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .target 森度吉安
    .train 197,3

step << Warrior
    #optional
    #completewith FoodandWater2
    +|cRXP_WARN_装备|r |T135423:0|t[大型战斧] |cRXP_WARN_（达到20级时）|r
    .use 926
    .itemcount 926,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp >20,1

step << Warrior
    #optional
    #completewith FoodandWater2
    +|cRXP_WARN_装备|r |T135423:0|t[大型战斧]
    .use 926
    .itemcount 926,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1

step << Druid
    #season 2
    #ah
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拍卖师萨苏恩|r 对话
    >>|cRXP_BUY_如果可能，从拍卖行购买|r |T134237:0|t[科卡尔宝箱钥匙] |cRXP_BUY_。|r
    >>|cRXP_WARN_你需要这个物品来获得|r |T132942:0|t[|cRXP_FRIENDLY_野性神像|r] |cRXP_WARN_，以学习|r |T236167:0|t[野蛮咆哮] << Druid
    .collect 5020,1 --Kolkar Booty Key (1)
    .target 拍卖师萨苏恩
    .itemcount 208689,<1,1 << Druid
    .train 407988,1 << Druid

step
    #optional
    #label SpiritsPickup

step
    #completewith FoodandWater2
    .hs >> 使用炉石返回十字路口
    .cooldown item,6948,>0
    .use 6948
    .bindlocation 380,1
    .subzoneskip 380

step
    #completewith FoodandWater2
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 交谈
    .fly Crossroads >>飞往十字路口
    .target 多拉斯
    .cooldown item,6948,<0
    .subzoneskip 380

step
    #label FoodandWater2
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r 对话
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .target 旅店老板伯兰德·草风
    .isQuestAvailable 3281

step
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r 对话
    .turnin 869 >>交任务：偷钱的迅猛龙
    .accept 3281 >>接任务：被偷走的银币
    .target 加兹罗格

step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .turnin 848 >> 交任务：菌类孢子
    .target 药剂师赫布瑞姆
    .isQuestComplete 848

step
    #xprate <2.1
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    .turnin 867 >>交任务：鹰身强盗
    .accept 875 >>接任务：鹰身人首领
    .target 达索克·快刀

step
    .goto The Barrens,52.26,31.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .turnin 870 >> 交任务：遗忘之池
    .accept 877 >> 接任务：死水绿洲
    .target 图加·符文图腾

step
    #label EcheyakeePickup
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 903 >>交任务：草原上的徘徊者
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘

step << !Tauren !Undead
    #xprate <2.1
    .goto The Barrens,52.62,29.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔夫|r 对话
    .turnin 6386 >> 交任务：返回十字路口
    .target 扎尔夫
    .isOnQuest 6386

step
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，并拾取他的 |cRXP_LOOT_埃其亚基的皮|r
    >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后没有出现，或出现后你没有取得击杀归属，请跳过此步骤|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327

step
    #optional
    .goto The Barrens,52.23,31.00
    .abandon 881 >>|cRXP_WARN_如果|cRXP_ENEMY_埃其亚基|r在使用|r |T134227:0|t[埃其亚基的号角]|cRXP_WARN_后没有出现，或出现后你没有取得击杀归属，请放弃埃其亚基任务，然后回到城镇重新接受|r
    .itemcount 5100,<1 --Echeyakee's Hide (0)

step
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .accept 881 >>接任务：埃其亚基
    .target 瑟格拉·黑棘
    .itemcount 5100,<1 --Echeyakee's Hide (0)

step
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤 |cRXP_ENEMY_埃其亚基|r
    >>击杀 |cRXP_ENEMY_埃其亚基|r，并拾取他的 |cRXP_LOOT_埃其亚基的皮|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob 埃其亚基
    .use 10327

step
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟格拉·黑棘|r 对话
    .turnin 881 >>交任务：埃其亚基
    .accept 905 >>接任务：狂暴的镰爪龙
    .target 瑟格拉·黑棘

step
    #completewith RapHornsPickup
    .destroy 10327 >>|cRXP_WARN_摧毁|r |T134227:0|t[埃其亚基的号角] |cRXP_WARN_，因为之后不再需要它|r

step << Warrior
    #season 2
    .goto The Barrens,52.27,31.08
    .aura 420667 >>点击 |cRXP_PICK_部落战旗|r
    .train 403489,1

step
    .goto The Barrens,51.95,31.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_曼科里克|r 对话
    .accept 899 >>接任务：复仇的怒火
    .accept 4921 >>接任务：在战斗中失踪
    .target 曼科里克

step << Hunter
    .goto The Barrens,51.67,29.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_巴尔格|r 对话
    >>|cRXP_BUY_向他购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_。|r
    .collect 2515,1800,888,1 << Hunter --Sharp Arrow (1800)
    .target 巴尔格

step
    #completewith RapHornsPickup
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Ratchet >>飞往棘齿城
    .target 迪弗拉克
    .subzoneskip 392

step << Rogue
    .goto The Barrens,63.07,36.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卑鄙的维尼克斯|r 对话
    .turnin 2382 >>交任务：棘齿城的维尼克斯
    .accept 2381 >>接任务：抢劫海盗
    .target 卑鄙的维尼克斯

step << Rogue
    .goto The Barrens,63.12,36.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尼克斯的机械设备|r 对话
    >>|cRXP_WARN_获取一个|r |T134059:0|t[大饼干] |cRXP_WARN_和一套|r |T134065:0|t[潜行者工具]
    .collect 7970,1,888,1 --E.C.A.C. (1)
    .collect 5060,1,888,1 --Thieves' Tools (1)

step
    .goto The Barrens,62.98,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 对话
    .turnin 902 >>交任务：什么什么平衡器
    .turnin 863 >>交任务：逃跑
    .target 斯布特瓦夫
    .isQuestComplete 863
    .isOnQuest 902

step
    #optional
    .goto The Barrens,62.98,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 对话
    .turnin 902 >>交任务：什么什么平衡器
    .target 斯布特瓦夫
    .isOnQuest 902

step
    #optional
    .goto The Barrens,62.98,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 对话
    .turnin 863 >>交任务：逃跑
    .target 斯布特瓦夫
    .isQuestComplete 863

step
    #xprate <2.1
    .goto The Barrens,62.98,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 对话
    .accept 3921 >>接任务：维妮·布特巴克 << Hunter
    .accept 1483 >>接任务：菲兹克斯
    .target 斯布特瓦夫
    .isQuestTurnedIn 902 << Hunter

step
    .goto The Barrens,63.35,38.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪兹维格|r 对话
    .turnin 896 >>交任务：矿工的宝贝
    .target 码头管理员迪兹维格
    .isQuestComplete 896

step
    #xprate <2.1
    #label RapHornsPickup
    .goto The Barrens,62.37,37.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦伯克·米希瑞克斯|r 对话
    .accept 865 >>接任务：迅猛龙角
    .accept 1069 >>接任务：深苔蜘蛛的卵
    .target 麦伯克·米希瑞克斯

step
    #xprate >2.09
    #label RapHornsPickup
    .goto The Barrens,62.37,37.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦伯克·米希瑞克斯|r 对话
    .accept 865 >>接任务：迅猛龙角
    .target 麦伯克·米希瑞克斯

step << Warrior
    #season 2
    .goto The Barrens,62.77,38.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_基尔克斯|r 对话
    >>|cRXP_BUY_向他购买|r |T135129:0|t[猎鱼叉] |cRXP_BUY_。|r
    .collect 208773,1 --Fishing Harpoon (1)
    .target 基尔克斯
    .train 425443,1 << Warrior

step << Warrior
    #season 2
    .goto The Barrens,64.51,39.32
    .use 208773 >>使用 |T135129:0|t[猎鱼叉] 攻击 |cRXP_ENEMY_布鲁兹|r，然后击杀它并拾取 |T134419:0|t[|cRXP_FRIENDLY_迅捷打击符文|r] << Warrior
    >>|cRXP_WARN_它会在水中的沉船周围巡逻|r
    .collect 208778,1 << Warrior --Rune of Quick Strike (1)
    .unitscan 布鲁兹
    .train 425443,1 << Warrior

step << Warrior
    #season 2
    .train 425443 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_迅捷打击符文|r] |cRXP_WARN_学习|r |T132394:0|t[迅捷打击]
    .use 208778
    .itemcount 208778,1

step
    #sticky
    #completewith LeaveRatchet
    #season 2
    .goto The Barrens,61.8,39.4
    >>|cRXP_WARN_如果你有多余的|cRXP_LOOT_3金|r，可以向|r |cRXP_FRIENDLY_格里兹比|r |cRXP_WARN_购买符文；他在棘齿城旅店里。自行判断能否负担，以及符文是否适合你的职业。之后也可以再来购买|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的 |cRXP_FRIENDLY_格里兹比|r 对话
    .use 210822 << Priest
    .use 210820 << Paladin
    .use 210654 << Mage
    .use 210818 << Hunter
    .use 210817 << Druid
    .use 210825 << Warrior
    .use 210824 << Warlock
    .use 210653 << Rogue
    .use 210823 << Shaman
    .train 415995 >>|cRXP_WARN_购买并使用|r |T135791:0|t[|cRXP_FRIENDLY_祥和顿悟|r] |cRXP_WARN_来学习|r |T237549:0|t[妙手回春] << Priest
    .train 410010 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_牺牲符文|r] |cRXP_WARN_来学习|r |T134596:0|t[铭刻裤子 - 牺牲之手] << Paladin
    .train 401761 >>|cRXP_WARN_购买并使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：时光倒转|r] |cRXP_WARN_来学习|r |T237538:0|t[时光倒转] << Mage
    .train 410122 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_独来独往符文|r] |cRXP_WARN_来学习|r |T132266:0|t[独来独往] << Hunter
    .train 416042 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_优胜劣汰符文|r] |cRXP_WARN_来学习|r |T132126:0|t[优胜劣汰] << Druid
    .train 425445 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_战神符文|r] |cRXP_WARN_来学习|r |T236319:0|t[战神] << Warrior
    .train 425476 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_契约符文|r] |cRXP_WARN_来学习|r |T237562:0|t[恶魔契约] << Warlock
    .train 424990 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_左右开弓符文|r] |cRXP_WARN_来学习|r |T237531:0|t[左右开弓] << Rogue
    .train 410096 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_双武器专精符文|r] |cRXP_WARN_来学习|r |T132686:0|t[铭刻胸甲 - 双武器专精] << Shaman
    .target 格里兹比
    .train 415995,1 << Priest
    .train 410010,1 << Paladin
    .train 401761,1 << Mage
    .train 410122,1 << Hunter
    .train 416042,1 << Druid
    .train 425445,1 << Warrior
    .train 425476,1 << Warlock
    .train 424990,1 << Rogue
    .train 410096,1 << Shaman
    .money <3.0

step
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板维尔雷|r 交谈
    >>|cRXP_BUY_向他购买|r |T133918:0|t[长嘴泥鳅] |cRXP_BUY_。|r
    >>|cRXP_BUY_向他购买|r |T132796:0|t[果汁] |cRXP_BUY_。|r << Mage/Warlock/Priest/Shaman/Druid
    >>|T133918:0|t[长嘴泥鳅] |cRXP_WARN_非常便宜，可以按需购买任意数量|r
    .vendor >> 出售杂物
    .collect 4592,20,888,1 --Longjaw Mud Snapper (20)
    .collect 1205,10,888,1 << Mage/Warlock/Priest/Shaman/Druid --Melon Juice (10)
    .target 旅店老板维尔雷

step << Rogue
    #season 0
    #completewith SSTreasure
    .goto The Barrens,65.04,45.44
    +|cRXP_WARN_跳上船，下到第2层，将开锁技能提升到至少70|r

step << Rogue
    #season 2
    #completewith SSTreasure
    .goto The Barrens,65.04,45.44
    +|cRXP_WARN_跳上船，下到第2层，将开锁技能提升到至少70|r
    .train 424984,3 --Saber slash rune already learned, no need to get 80 LP

step << Rogue
    #season 2
    #completewith SSTreasure
    .goto The Barrens,65.04,45.44
    +|cRXP_WARN_跳上船，下到第2层，将开锁技能提升到至少80|r
    .train 424984,1 --Saber slash rune not learned yet, need to get 80 LP

step << Rogue
    #label SSTreasure
    .goto The Barrens,64.95,45.44
    >>开锁技能达到70后，前往船只最底层并打开 |cRXP_PICK_南海宝珠|r
    >>|cRXP_WARN_使用|r |T134059:0|t[大饼干] |cRXP_WARN_，目标为|r |cRXP_ENEMY_波利|r
    .complete 2381,1 --Southsea Treasure (1)
    .use 7970
    .mob 波利

step
    #label LeaveRatchet
    .goto The Barrens,63.58,49.25
    >>拾取地上的 |cRXP_PICK_箱子|r
    .complete 888,2 --Telescopic Lens (1)
    .isOnQuest 888

step
    .goto The Barrens,62.63,49.64
    >>拾取地上的 |cRXP_PICK_箱子|r
    .complete 888,1 --Shipment of Boots (1)
    .isOnQuest 888

step << Warrior/Rogue
    #season 2
    #completewith EndlessRageRune << Warrior
    #completewith SaberSlashRune << Rogue
    .subzone 385 >>前往北方城堡

step << Warrior
    #season 2
    .goto The Barrens,62.55,56.31
    >>点击 |cRXP_PICK_联盟战旗|r
    >>击杀刷新的 |cRXP_ENEMY_Lieutenant Stonebrew|r，并拾取他的 |T134419:0|t[|cRXP_FRIENDLY_无尽怒气符文|r]
    .collect 208741,1 --Rune of Endless Rage (1)
    .mob Lieutenant Stonebrew
    .train 403489,1

step << Warrior
    #season 2
    #label EndlessRageRune
    .train 403489 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_无尽怒气符文|r] |cRXP_WARN_学习|r |T132347:0|t[无尽怒气]
    .use 208741
    .itemcount 208741,1

step << Rogue
    #season 2
    .goto The Barrens,62.31,54.22
    >>拾取马厩顶部的 |cRXP_PICK_马夫的箱子|r，获得 |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r]
    >>|cRXP_WARN_沿山坡向上跑，跳到城堡墙顶，再从那里跳到马厩屋顶|r
    .collect 208772,1 --Rune of Saber Slash (1)
    .train 424984,1

step << Rogue
    #season 2
    #label SaberSlashRune
    .train 424984 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_军刀猛刺符文|r] |cRXP_WARN_学习|r |T132375:0|t[军刀猛刺]
    .use 208772
    .itemcount 208772,1

step
    #completewith TestSeeds
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟

step
    #completewith TestSeeds
    >>击杀 |cRXP_ENEMY_赤鳞镰爪龙|r，并拾取它们的 |cRXP_LOOT_角|r 和 |cRXP_LOOT_羽毛|r
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .collect 5165,3,905,3 --Sunscale Feather (3)
    .mob 赤鳞镰爪龙

step
    .goto The Barrens,57.39,52.28,60,0
    .goto The Barrens,58.04,53.87
    >>拾取地上的 |cRXP_PICK_被偷走的银币|r
    .complete 3281,1 --Stolen Silver (1)

step
    #completewith Verog
    >>在死水绿洲周围收集 |cRXP_LOOT_丰满的蘑菇|r
    .complete 848,1 --Collect Fungal Spores (x4)

step
    #label TestSeeds
    .goto The Barrens,55.61,42.75
    >>在水下点击 |cRXP_PICK_冒泡的裂隙|r
    .complete 877,1 --Test the Dried Seeds (1)

step << Druid
    #xprate <2.1
    #season 2
    #completewith Verog
    >>击杀 |cRXP_ENEMY_科卡尔|r，并拾取 |T134237:0|t[|cRXP_LOOT_科卡尔宝箱钥匙|r]
    .collect 5020,1 --Kolkar Booty Key (1)
    .mob 科卡尔驯犬者
    .mob 科卡尔掠夺者
    .train 407988,1

step
    #xprate <2.1
    #completewith next
    #loop
    .goto The Barrens,55.80,45.78,50,0
    .goto The Barrens,56.75,43.41,50,0
    .goto The Barrens,57.01,41.22,50,0
    .goto The Barrens,55.45,41.37,50,0
    .goto The Barrens,54.99,40.84,50,0
    .goto The Barrens,53.41,40.26,50,0
    .goto The Barrens,52.99,44.73,50,0
    .goto The Barrens,54.31,46.81,50,0
    .goto The Barrens,55.80,45.78,50,0
    >>击杀绿洲周围的 |cRXP_ENEMY_科卡尔|r，并拾取它们掉落的 |cRXP_LOOT_护腕|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔战士
    .mob 科卡尔驯犬者
    .mob 科卡尔掠夺者
    .isOnQuest 851

step
    #xprate <2.1
    .goto The Barrens,52.95,41.75
    >>击杀 |cRXP_ENEMY_狂热的维罗戈|r，并拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_每击杀一个|cRXP_ENEMY_科卡尔|r，他都有几率刷新|r
    >>|cRXP_WARN_在人口较多的服务器或新服开放初期，最好直接蹲守他的刷新点|r
    .complete 851,1 --Verog's Head (1)
    .unitscan 狂热的维罗戈
    .isOnQuest 851

step
    #optional
    #label Verog

step << Druid
    #season 2
    #loop
    .goto The Barrens,55.80,45.78,0
    .goto The Barrens,55.80,45.78,50,0
    .goto The Barrens,56.75,43.41,50,0
    .goto The Barrens,57.01,41.22,50,0
    .goto The Barrens,55.45,41.37,50,0
    .goto The Barrens,54.99,40.84,50,0
    .goto The Barrens,53.41,40.26,50,0
    .goto The Barrens,52.99,44.73,50,0
    .goto The Barrens,54.31,46.81,50,0
    >>击杀 |cRXP_ENEMY_科卡尔|r，并拾取 |T134237:0|t[|cRXP_LOOT_科卡尔宝箱钥匙|r]
    .collect 5020,1 --Kolkar Booty Key (1)
    .mob 科卡尔战士
    .mob 科卡尔驯犬者
    .mob 科卡尔掠夺者
    .itemcount 208689,<1,1
    .train 407988,1

step << Druid
    #season 2
    .goto The Barrens,52.7,41.8
    >>打开一个 |cRXP_PICK_科卡尔的战利品|r 宝箱，获取 |T132942:0|t[|cRXP_FRIENDLY_野性神像|r]
    .collect 5020,1 --Kolkar Booty Key (1)
    .collect 208689,1 --Ferocious Idol (1)
    .itemcount 208689,<1,1
    .train 407988,1

step << Druid
    #season 2
    #completewith Nest
    .equip 18,208689 >> |cRXP_WARN_装备|r |T132942:0|t[|cRXP_FRIENDLY_野性神像|r] |cRXP_WARN_，前提是已经学会|r |T132115:0|t[猎豹形态]
    .use 208689
    .itemcount 208689,1
    .train 407988,1

step << Druid
    #season 2
    #completewith Nest
    .train 407988 >>|cRXP_WARN_对人形生物造成20次来自|r |T132152:0|t[撕扯] |cRXP_WARN_或|r |T132122:0|t[扫击] |cRXP_WARN_的流血伤害，然后再次使用|r |T132942:0|t[|cRXP_FRIENDLY_野性神像|r] |cRXP_WARN_学习|r |T236167:0|t[野蛮咆哮]
    .use 208689
    .itemcount 208689,1

step
    #loop
    .goto The Barrens,55.72,42.14,0
    .goto The Barrens,55.72,42.14,30,0
    .goto The Barrens,55.49,41.75,30,0
    .goto The Barrens,55.09,41.58,30,0
    .goto The Barrens,55.03,42.24,30,0
    .goto The Barrens,55.27,43.17,30,0
    .goto The Barrens,55.78,43.47,30,0
    .goto The Barrens,56.15,43.28,30,0
    .goto The Barrens,56.08,42.58,30,0
    .goto The Barrens,55.72,42.14,30,0
    >>在死水绿洲周围收集 |cRXP_LOOT_丰满的蘑菇|r
    .complete 848,1 --Collect Fungal Spores (x4)

step
    #completewith LakotaMani1
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟

step
    .goto The Barrens,52.60,46.10
    >>点击 |cRXP_PICK_蓝色迅猛龙巢穴|r。如果没有 |cRXP_ENEMY_赤鳞镰爪龙|r 掉落的 |T132914:0|t[赤鳞迅猛龙的羽毛]，就再击杀一些
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 905,1 --Visit Blue Raptor Nest (1)
    .collect 5165,3,905,7,3
    .mob 赤鳞镰爪龙

step
    .goto The Barrens,52.45,46.57
    >>点击 |cRXP_PICK_红色迅猛龙巢穴|r。如果没有 |cRXP_ENEMY_赤鳞镰爪龙|r 掉落的 |T132914:0|t[赤鳞迅猛龙的羽毛]，就再击杀一些
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 905,3 --Visit Red Raptor Nest (1)
    .collect 5165,3,905,7,3
    .mob 赤鳞镰爪龙

step
    #label Nest
    .goto The Barrens,52.02,46.47
    >>点击 |cRXP_PICK_黄色迅猛龙巢穴|r。如果没有 |cRXP_ENEMY_赤鳞镰爪龙|r 掉落的 |T132914:0|t[赤鳞迅猛龙的羽毛]，就再击杀一些
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 905,2 --Visit Yellow Raptor Nest (1)
    .collect 5165,3,905,7,3
    .mob 赤鳞镰爪龙

step
    #completewith next
    >>击杀 |cRXP_ENEMY_赤鳞镰爪龙|r，并拾取它们掉落的 |cRXP_LOOT_角|r
    >>|cRXP_WARN_小心，它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒蓄积2次额外攻击）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob 赤鳞镰爪龙

step
    #label LostmyWife
    .goto The Barrens,49.33,50.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t调查 |cRXP_FRIENDLY_血肉模糊的尸体|r
    .complete 4921,1 --Find Mankrik's Wife (1)
    .target 血肉模糊的尸体
    .skipgossip

step
    #completewith next
    >>击杀 |cRXP_ENEMY_雷角蜥蜴|r，并拾取 |cRXP_LOOT_雷霆蜥蜴的角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴

step
    #label LakotaMani1
    #completewith CampTArrive
    .goto The Barrens,45.14,52.82,0
    .goto The Barrens,45.93,49.08,0
    .goto The Barrens,47.43,51.37,0
    .goto The Barrens,50.10,53.34,0
    >>击杀 |cRXP_ENEMY_拉克塔曼尼|r，并拾取 |T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r]
    >>|cRXP_WARN_使用 |T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r] 接受任务|r
    >>|cRXP_WARN_它有4个刷新点（地图上已标记）|r
    >>|cRXP_WARN_如果找不到它，请跳过此步骤|r
    .collect 5099,1,883 --Collect Hoof of Lakota'Mani
    .accept 883 >>接任务：拉克塔曼尼
    .use 5099
    .unitscan 拉克塔曼尼

step
    #completewith CampTArrive
    >>击杀 |cRXP_ENEMY_雷角蜥蜴|r，并拾取 |cRXP_LOOT_雷霆蜥蜴的角|r；这项任务不必现在完成
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴

step << Hunter
    #season 2
    #completewith next
    +|cRXP_WARN_你需要先学会|r |T135813:0|t[献祭陷阱] |cRXP_WARN_或其他任意陷阱，才能获得此符文|r

step << Hunter
    #season 2
    #loop
    .goto The Barrens,43.12,57.37,0
    .goto The Barrens,44.60,55.51,40,0
    .goto The Barrens,44.05,56.20,40,0
    .goto The Barrens,43.12,57.37,40,0
    .line The Barrens,44.60,55.51,44.60,55.51,43.12,57.37
    >>将 |T135813:0|t[献祭陷阱] 放在 |cRXP_ENEMY_巡游中的猎豹|r 的巡逻路线上，以移除它的增益效果
    >>击杀它，并拾取 |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r]
    .collect 208701,1 --Rune of Beast Mastery (1)
    .mob 巡游中的猎豹
    .train 410110,1

step << Hunter
    #season 2
    .train 410110 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_野兽控制符文|r] |cRXP_WARN_学习|r |T132270:0|t[野兽控制]
    .use 208701
    .itemcount 208701,1

step
    #label CampTArrive
    #completewith next
    .goto The Barrens,45.23,58.41,120 >> 前往陶拉祖营地
    .subzoneskip 378

step
    #requires CampTArrive
    #label SetCampTaurajoHS
    .goto The Barrens,45.58,59.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比鲁拉|r 对话
    .home >>将炉石绑定在陶拉祖营地
    .target 旅店老板比鲁拉
    .bindlocation 378
    .isQuestAvailable 1093

step
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r 对话
    .turnin 883 >>交任务：拉克塔曼尼
    .target 乔恩·星眼
    .isOnQuest 883

step
    .goto The Barrens,44.55,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_碎牙|r 对话
    .accept 878 >>接任务：野猪人的内战
    .target 碎牙

step
    #completewith Xroadsturnins2
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨|r 交谈
    .fp Camp Taurajo >> 开通陶拉祖营地飞行点 << !Tauren
    .fly Crossroads >>飞往十字路口
    .target 欧姆萨·雷角
    .subzoneskip 380

step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师赫布瑞姆|r 对话
    .turnin 848 >> 交任务：菌类孢子
    .target 药剂师赫布瑞姆
    .isQuestComplete 848

step
    #label Xroadsturnins2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_曼科里克|r、|cRXP_FRIENDLY_图加·符文图腾|r、|cRXP_FRIENDLY_瑟格拉·黑棘|r 和 |cRXP_FRIENDLY_加兹罗格|r 对话
    .turnin 4921 >>交任务：在战斗中失踪
    .target +曼科里克
    .goto The Barrens,51.95,31.58
    .turnin 877 >>交任务：死水绿洲
    .accept 880 >>接任务：变异的生物
    .target +图加·符文图腾
    .goto The Barrens,52.26,31.93
    .turnin 905 >>交任务：狂暴的镰爪龙
    .accept 3261 >>接任务：乔恩·星眼
    .target +瑟格拉·黑棘
    .goto The Barrens,52.24,31.01
    .turnin 3281 >>交任务：被偷走的银币
    .goto The Barrens,51.93,30.32
    .target +加兹罗格

step
    .destroy 5165 >>|cRXP_WARN_摧毁你身上剩余的|r |T132914:0|t[赤鳞迅猛龙的羽毛] |cRXP_WARN_。|r
    .itemcount 5165,1

step << Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_阿瑟罗克|r |cRXP_BUY_对话，并从他那里购买|r |T134410:0|t[中型箭袋] |cRXP_BUY_。|r
    .collect 11362,1,899,1 --Medium Quiver (1)
    .collect 2515,2200,899,1 --Sharp Arrow (2200)
    .target 阿瑟罗克
    --Warlock skips Herog/Counterattack below for 150% route. Will do it later otwt Stonetalon for class q into logout skip to TB

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 851 >>交任务：狂热的维罗戈
    .accept 852 >>接任务：赫兹鲁尔·血印
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 851 >>交任务：狂热的维罗戈
    .accept 852 >>接任务：赫兹鲁尔·血印
    .target 雷戈萨·死门
    .isQuestComplete 851

step
    #optional
    #label Leaders
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 852 >>接任务：赫兹鲁尔·血印
    .target 雷戈萨·死门
    .isQuestTurnedIn 851

step
    #xprate <2.1
    #completewith Hezrul
    .subzone 387 >> 前往甜水绿洲
    .isQuestTurnedIn 851

step
    #xprate <2.1
    #completewith Hezrul
    >>寻找 |cRXP_ENEMY_赫兹鲁尔·血印|r 时，击杀 |cRXP_ENEMY_绿洲钳嘴龟|r，并拾取它们的 |cRXP_LOOT_龟壳|r
    .complete 880,1 --Altered Snapjaw Shell (8)
    .mob 绿洲钳嘴龟

step
    #xprate <2.1
    #completewith next
    >>击杀绿洲周围的 |cRXP_ENEMY_科卡尔|r，并拾取它们掉落的 |cRXP_LOOT_护腕|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔战士
    .mob 科卡尔驯犬者
    .mob 科卡尔掠夺者
    .isOnQuest 855

step
    #xprate <2.1
    #loop
    #label Hezrul
    .goto The Barrens,45.64,38.16,0
    .goto The Barrens,45.64,38.16,50,0
    .goto The Barrens,45.84,37.86,50,0
    .goto The Barrens,45.78,37.41,50,0
    .goto The Barrens,45.95,37.11,50,0
    .goto The Barrens,45.93,36.91,50,0
    .goto The Barrens,46.14,36.85,50,0
    .goto The Barrens,46.19,36.88,50,0
    .goto The Barrens,46.28,36.86,50,0
    .goto The Barrens,46.46,37.17,50,0
    .goto The Barrens,46.58,37.31,50,0
    .goto The Barrens,46.63,37.93,50,0
    .goto The Barrens,46.75,38.39,50,0
    .goto The Barrens,47.27,38.98,50,0
    .goto The Barrens,47.47,39.27,50,0
    .goto The Barrens,48.20,39.57,50,0
    .goto The Barrens,48.40,39.58,50,0
    .goto The Barrens,48.60,39.51,50,0
    .goto The Barrens,48.54,39.96,50,0
    .goto The Barrens,48.58,40.52,50,0
    .goto The Barrens,48.27,40.82,50,0
    .goto The Barrens,48.06,40.82,50,0
    .goto The Barrens,47.86,41.13,50,0
    .goto The Barrens,47.49,41.33,50,0
    .goto The Barrens,47.34,41.61,50,0
    .goto The Barrens,47.22,41.64,50,0
    .goto The Barrens,46.85,42.05,50,0
    .goto The Barrens,46.56,41.93,50,0
    .goto The Barrens,46.27,41.76,50,0
    .goto The Barrens,46.03,41.15,50,0
    .goto The Barrens,45.86,41.32,50,0
    .goto The Barrens,46.09,40.98,50,0
    .goto The Barrens,46.08,40.68,50,0
    .goto The Barrens,45.71,40.56,50,0
    >>找到并击杀 |cRXP_ENEMY_赫兹鲁尔·血印|r，拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_ENEMY_赫兹鲁尔|r |cRXP_WARN_会在湖边巡逻|r
    .complete 852,1 --Hezrul's Head
    .unitscan 赫兹鲁尔·血印
    .isQuestTurnedIn 851

step
    #xprate <2.1
    .goto The Barrens,45.64,38.16,0
    .goto The Barrens,45.64,38.16,50,0
    .goto The Barrens,45.84,37.86,50,0
    .goto The Barrens,45.78,37.41,50,0
    .goto The Barrens,45.95,37.11,50,0
    .goto The Barrens,45.93,36.91,50,0
    .goto The Barrens,46.14,36.85,50,0
    .goto The Barrens,46.19,36.88,50,0
    .goto The Barrens,46.28,36.86,50,0
    .goto The Barrens,46.46,37.17,50,0
    .goto The Barrens,46.58,37.31,50,0
    .goto The Barrens,46.63,37.93,50,0
    .goto The Barrens,46.75,38.39,50,0
    .goto The Barrens,47.27,38.98,50,0
    .goto The Barrens,47.47,39.27,50,0
    .goto The Barrens,48.20,39.57,50,0
    .goto The Barrens,48.40,39.58,50,0
    .goto The Barrens,48.60,39.51,50,0
    .goto The Barrens,48.54,39.96,50,0
    .goto The Barrens,48.58,40.52,50,0
    .goto The Barrens,48.27,40.82,50,0
    .goto The Barrens,48.06,40.82,50,0
    .goto The Barrens,47.86,41.13,50,0
    .goto The Barrens,47.49,41.33,50,0
    .goto The Barrens,47.34,41.61,50,0
    .goto The Barrens,47.22,41.64,50,0
    .goto The Barrens,46.85,42.05,50,0
    .goto The Barrens,46.56,41.93,50,0
    .goto The Barrens,46.27,41.76,50,0
    .goto The Barrens,46.03,41.15,50,0
    .goto The Barrens,45.86,41.32,50,0
    .goto The Barrens,46.09,40.98,50,0
    .goto The Barrens,46.08,40.68,50,0
    .goto The Barrens,45.71,40.56,50,0
    >>击杀绿洲周围的 |cRXP_ENEMY_科卡尔|r，并拾取它们掉落的 |cRXP_LOOT_护腕|r
    >>|cRXP_WARN_如果目前掉落不多，可以跳过此任务|r
    .complete 855,1 --Centaur Bracers (15)
    .mob 科卡尔战士
    .mob 科卡尔驯犬者
    .mob 科卡尔掠夺者
    .itemcount 5030,5 --Centaur Bracers (5)
    .isOnQuest 855

step << Druid
    #season 2
    .goto The Barrens,48.32,40.25
    >>打开地上的 |cRXP_PICK_空荡荡的钳嘴龟的巢|r，获取 |T134419:0|t[|cRXP_FRIENDLY_割伤符文|r]
    .collect 208687,1 --Unbalanced Idol (1)
    .train 416049,1

step << Druid
    #season 2
    .train 416049 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_割伤符文|r] |cRXP_WARN_学习|r |T132131:0|t[割伤]
    .use 208687 --Rune of Lacerate (1)
    .itemcount 208687,1

step
    #xprate <2.1
    #optional
    #completewith CounterattackComplete
    .abandon 855 >> 放弃半人马护腕任务，因为之前拾取的数量不够，继续完成不划算
    .itemcount 5030,<5 --Centaur Bracers (5)

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 852 >>交任务：赫兹鲁尔·血印
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 852
    .isQuestComplete 855

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 852 >>交任务：赫兹鲁尔·血印
    .target 雷戈萨·死门
    .isQuestComplete 852

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #xprate <2.1
    #completewith CounterattackComplete
    +|cRXP_WARN_下一个任务难度很高，建议组队。你可以利用任务发布者所在的建筑，绕圈风筝督军克罗姆扎|r
    +|cRXP_WARN_如果无法完成此任务，就跳过它；之后等级更高时还有机会再做|r
    .isQuestTurnedIn 852

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 4021 >>接任务：人马无双！
    .target 雷戈萨·死门
    --.timer 183,Warlord Krom'zar Spawn
    .isQuestTurnedIn 852
    --timer is random, generally somewhere between 120-210 seconds

step
    #xprate <2.1
    #label CounterattackComplete
    .goto The Barrens,44.48,28.15
    >>督军克罗姆扎出现后，击杀 |cRXP_ENEMY_督军克罗姆扎|r，并拾取他掉在地上的 |cRXP_PICK_旗帜|r
    >>|cRXP_WARN_小心！他是强力精英，身边至少有两名|r |cRXP_ENEMY_科卡尔|r |cRXP_WARN_护卫|r
    >>|cRXP_WARN_他最多可能需要3分钟才会刷新|r
    .complete 4021,1 --Piece of Krom'zar's Banner (1)
    .unitscan 督军克罗姆扎
    .isOnQuest 4021

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 4021 >>交任务：人马无双！
    .target 雷戈萨·死门
    .isQuestComplete 4021

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 4021 >>交任务：人马无双！
    .target 雷戈萨·死门
    .isQuestComplete 4021

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #xprate <2.1
    #completewith StonetalonPickups
    >>击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟
    .mob 敏捷的平原陆行鸟
    .mob 暴躁的平原陆行鸟

step
    #xprate <2.1
    #loop
    .goto The Barrens,40.28,15.49,0
    .goto The Barrens,40.28,15.49,40,0
    .goto The Barrens,39.50,14.68,40,0
    .goto The Barrens,39.47,13.24,40,0
    .goto The Barrens,38.94,12.80,40,0
    .goto The Barrens,38.18,12.56,40,0
    .goto The Barrens,37.96,13.52,40,0
    .goto The Barrens,38.62,13.95,40,0
    .goto The Barrens,38.18,14.62,40,0
    .goto The Barrens,38.14,15.59,40,0
    .goto The Barrens,37.29,15.68,40,0
    .goto The Barrens,37.24,16.26,40,0
    .goto The Barrens,37.67,16.34,40,0
    .goto The Barrens,38.35,17.08,40,0
    .goto The Barrens,38.83,17.71,40,0
    .goto The Barrens,39.37,17.21,40,0
    .goto The Barrens,39.87,16.66,40,0
    .goto The Barrens,40.15,15.98,40,0
    >>击杀 |cRXP_ENEMY_巫翼杀戮者|r，并拾取它们的 |cRXP_LOOT_指环|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_巫翼杀戮者|r 会施放|r |T135358:0|t[斩杀] |cRXP_WARN_（当你的生命值低于20%时会造成大量伤害）；|cRXP_ENEMY_巫翼伏击者|r 处于|r |T132320:0|t[潜行] |cRXP_WARN_状态，并在附近巡逻|r
    >>|cRXP_WARN_小心|r |cRXP_ENEMY_巫翼伏击者|r|cRXP_WARN_。它们处于潜行状态，并在该区域巡逻|r
    .complete 875,1 --Harpy Lieutenant Ring (6)
    .mob 巫翼杀戮者
    .mob 巫翼伏击者
    .isOnQuest 875

step
    #xprate <2.1
    #completewith next
    .goto The Barrens,35.26,27.88,30 >> 前往 |cRXP_FRIENDLY_希雷斯·碎石|r 处
    .zoneskip Stonetalon Mountains

step
    #xprate <2.1
    #map Stonetalon Mountains
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希雷斯|r 和 |cRXP_FRIENDLY_玛卡巴|r 交谈
    .turnin 1061 >> 交任务：石爪之灵
    .accept 1062 >> 接任务：地精侵略者
    .target +希雷斯·碎石
    .goto The Barrens,35.26,27.88
    .accept 6548 >> 接任务：为我的村庄复仇
    .target +玛卡巴·扁蹄
    .goto The Barrens,35.19,27.79
    .maxlevel 20

step
    #xprate <2.1
    #map Stonetalon Mountains
    #label StonetalonPickups
    .goto The Barrens,35.26,27.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希雷斯|r 交谈
    .turnin 1061 >> 交任务：石爪之灵
    .accept 1062 >> 接任务：地精侵略者
    .target 希雷斯·碎石

step
    #optional
    #label BarrensEnd
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 经典旧世 1-60（部落）
#subgroupdisplayname 1-22 << tbc
#subgroupdisplayname 1-22
#groupweight 500
#classic
#tbc
#xprate >1.99
<< Horde
#name 20-24 Stonetalon/Barrens
#version 1
#group RestedXP Horde 1-22
#groupid RXP-SRGCE-H1
#next 24-26 Southern Barrens << !Rogue !Shaman
#next 23-24 Hillsbrad Class Quests << Rogue/Shaman
#displayname 20-24 石爪山脉/贫瘠之地

step << Druid
    #xprate <2.1
    #season 2
    #completewith next
    >>击杀 |cRXP_ENEMY_恐怖图腾牛头人|r，并拾取 |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .collect 210534,1 -- Idol of the Wild (1)
    .train 410021,1

step
    #xprate <2.1
    #optional
    #loop
    .goto Stonetalon Mountains,80.62,89.99,0
    .goto Stonetalon Mountains,80.62,89.99,40,0
    .goto Stonetalon Mountains,79.79,88.75,40,0
    .goto Stonetalon Mountains,81.19,87.56,40,0
    .goto Stonetalon Mountains,81.70,86.44,40,0
    .goto Stonetalon Mountains,82.26,86.10,40,0
    .goto Stonetalon Mountains,82.55,85.22,40,0
    .goto Stonetalon Mountains,83.64,85.02,40,0
    .goto Stonetalon Mountains,84.20,85.20,40,0
    .goto Stonetalon Mountains,83.80,86.38,40,0
    .goto Stonetalon Mountains,83.25,87.23,40,0
    .goto Stonetalon Mountains,82.33,89.73,40,0
    .goto Stonetalon Mountains,82.33,90.43,40,0
    .goto Stonetalon Mountains,81.34,90.78,40,0
    >>击杀该区域的 |cRXP_ENEMY_恐怖图腾恶徒|r 和 |cRXP_ENEMY_恐怖图腾佣兵|r
    .complete 6548,1 --Kill Grimtotem Ruffian (x8)
    .complete 6548,2 --Kill Grimtotem Mercenary (x6)
    .mob 恐怖图腾恶徒
    .mob 恐怖图腾佣兵
    .isOnQuest 6548

step << Druid
    #xprate <2.1
    #season 2
    #loop
    .goto Stonetalon Mountains,80.62,89.99,0
    .goto Stonetalon Mountains,80.62,89.99,40,0
    .goto Stonetalon Mountains,79.79,88.75,40,0
    .goto Stonetalon Mountains,81.19,87.56,40,0
    .goto Stonetalon Mountains,81.70,86.44,40,0
    .goto Stonetalon Mountains,82.26,86.10,40,0
    .goto Stonetalon Mountains,82.55,85.22,40,0
    .goto Stonetalon Mountains,83.64,85.02,40,0
    .goto Stonetalon Mountains,84.20,85.20,40,0
    .goto Stonetalon Mountains,83.80,86.38,40,0
    .goto Stonetalon Mountains,83.25,87.23,40,0
    .goto Stonetalon Mountains,82.33,89.73,40,0
    .goto Stonetalon Mountains,82.33,90.43,40,0
    .goto Stonetalon Mountains,81.34,90.78,40,0
    >>击杀 |cRXP_ENEMY_恐怖图腾|r，并拾取 |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .collect 210534,1 -- Idol of the Wild (1)
    .mob 恐怖图腾佣兵
    .mob 恐怖图腾蛮兵
    .mob 恐怖图腾巫师
    .mob 恐怖图腾恶徒
    .train 410021,1

step << Druid
    #xprate <2.1
    #season 2
    #completewith BloodFeedersPickup
    .equip 18,210534 >> |cRXP_WARN_装备|r |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r]
    .use 210534
    .itemcount 210534,1
    .train 410021,1

step << Druid
    #xprate <2.1
    #season 2
    #completewith BloodFeedersPickup
    >>|cRXP_WARN_施放|r |T136085:0|t[愈合] |cRXP_WARN_或|r |T136041:0|t[治疗之触] |cRXP_WARN_，治疗10个不同的友方野兽，例如猎人宠物、熊形态的德鲁伊或幽魂之狼形态的萨满祭司|r
    .train 410021 >> |cRXP_WARN_使用|r |T134233:0|t[|cRXP_FRIENDLY_蛮荒神像|r] |cRXP_WARN_学习|r |T132143:0|t[狂野打击]
    .itemcount 210534,1

step
    #xprate <2.1
    #optional
    #map Stonetalon Mountains
    .goto The Barrens,35.19,27.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛卡巴·扁蹄|r 对话
    .turnin 6548 >> 交任务：为我的村庄复仇
    .accept 6629 >> 接任务：杀死格鲁迪格·暗云
    .target 玛卡巴·扁蹄
    .isQuestComplete 6548

step
    #xprate <2.1
    #optional
    #label AvengeVillageTurnin
    #map Stonetalon Mountains
    .goto The Barrens,35.19,27.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛卡巴·扁蹄|r 对话
    .accept 6629 >> 接任务：杀死格鲁迪格·暗云
    .target 玛卡巴·扁蹄
    .isQuestTurnedIn 6548

step
    #xprate <2.1
    #optional
    #completewith next
    .goto Stonetalon Mountains,75.89,87.49,30 >>沿着小路向上前往篝火处
    .isQuestTurnedIn 6548

step
    #xprate <2.1
    #optional
    .goto Stonetalon Mountains,73.65,86.13
    >>击杀 |cRXP_ENEMY_格鲁迪格·暗云|r 和 |cRXP_ENEMY_恐怖图腾蛮兵|r
    >>|cRXP_WARN_务必击杀全部六名|r |cRXP_ENEMY_恐怖图腾蛮兵|r |cRXP_WARN_，再开始屋内的任务|r
    .complete 6629,1 --Kill Grundig Darkcloud (x1)
    .mob +格鲁迪格·暗云
    .complete 6629,2 --Kill Grimtotem Brute (x6)
    .mob +恐怖图腾蛮兵
    .isQuestTurnedIn 6548

step
    #xprate <2.1
    #optional
    .goto Stonetalon Mountains,73.48,85.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡雅·扁蹄|r 对话
    .accept 6523,1 >> 接任务：保护卡雅
    .target 卡雅·扁蹄
    .isQuestTurnedIn 6548

step
    #xprate <2.1
    #optional
    .goto Stonetalon Mountains,71.82,86.79,40,0
    .goto Stonetalon Mountains,71.83,89.79,40,0
    .goto Stonetalon Mountains,76.73,90.85
    >>护送 |cRXP_FRIENDLY_卡雅|r，并始终跟紧她
    >>|cRXP_WARN_小心！三名|r |cRXP_ENEMY_恐怖图腾|r |cRXP_WARN_会在你到达阿帕拉耶营地的篝火时出现|r
    .complete 6523,1 --Kaya Escorted to Camp Aparaje
    .target 卡雅·扁蹄
    .isQuestTurnedIn 6548

step
    #xprate <2.1
    #optional
    #map Stonetalon Mountains
    .goto The Barrens,35.19,27.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛卡巴·扁蹄|r 对话
    .turnin 6629 >>交任务：杀死格鲁迪格·暗云
    .turnin 6523 >>交任务：保护卡雅
    .accept 6401 >>接任务：卡雅还活着
    .target 玛卡巴·扁蹄
    .isQuestComplete 6523
    .isQuestComplete 6629

step
    #xprate <2.1
    #optional
    #map Stonetalon Mountains
    .goto The Barrens,35.19,27.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛卡巴·扁蹄|r 对话
    .turnin 6523 >>交任务：保护卡雅
    .accept 6401 >>接任务：卡雅还活着
    .target 玛卡巴·扁蹄
    .isQuestComplete 6523

step
    #xprate <2.1
    #optional
    #map Stonetalon Mountains
    .goto The Barrens,35.19,27.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛卡巴·扁蹄|r 对话
    .turnin 6629 >>交任务：杀死格鲁迪格·暗云
    .target 玛卡巴·扁蹄
    .isQuestComplete 6629

step
    #xprate <2.1
    #optional
    #map Stonetalon Mountains
    .goto The Barrens,35.19,27.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛卡巴·扁蹄|r 对话
    .accept 6401 >>接任务：卡雅还活着
    .target 玛卡巴·扁蹄
    .isQuestTurnedIn 6523

step
    #xprate <2.1
    #completewith next
    .goto Stonetalon Mountains,82.57,98.63,60,0
    .goto Stonetalon Mountains,80.10,98.20,40,0
    .goto Stonetalon Mountains,77.17,98.61,40 >> 沿着左侧小路向上走

step
    #xprate <2.1
    #label BloodFeedersPickup
    .goto Stonetalon Mountains,71.25,95.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛吉拉|r 对话
    .accept 6461 >> 接任务：盗窃的蜘蛛
    .target 辛吉拉

step
    #xprate <2.1
    #completewith next
    .goto Stonetalon Mountains,68.59,88.34,100,0
    .goto Stonetalon Mountains,64.95,83.88,100,0
    .goto Stonetalon Mountains,61.47,81.51,100,0
    >>击杀你看到的每只 |cRXP_ENEMY_深苔爬行者|r
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob 深苔爬行者

step
    #xprate <2.1
    .goto Stonetalon Mountains,59.08,75.70
    >>点击|cRXP_PICK_通缉告示|r
    .accept 6284 >>接任务：贝瑟莱斯

step
    #xprate <2.1
    #completewith Besseleth1
    >>击杀 |cRXP_ENEMY_深苔毒蜘蛛|r 和 |cRXP_ENEMY_深苔爬行者|r
    .complete 6461,2 --Kill Deepmoss Venomspitter (x7)
    .mob +深苔毒蜘蛛
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob +深苔爬行者

step
    #xprate <2.1
    #completewith next
    >>拾取树附近的 |cRXP_PICK_蜘蛛卵|r
    >>|cRXP_WARN_小心！|r |cRXP_ENEMY_深苔幼蛛|r |cRXP_WARN_有几率召唤一只22级的|r |cRXP_ENEMY_深苔雌蜘蛛|r
    .complete 1069,1 --Collect Deepmoss Egg (x15)
    .group 0 << Priest/Mage

step
    #xprate <2.1
    #label Besseleth1
    #loop
    .goto Stonetalon Mountains,54.80,71.95,0
    .goto Stonetalon Mountains,51.89,73.81,50,0
    .goto Stonetalon Mountains,52.46,71.67,50,0
    .goto Stonetalon Mountains,54.80,71.95,50,0
    >>击杀 |cRXP_ENEMY_贝瑟莱斯|r，并拾取她的 |cRXP_LOOT_獠牙|r
    >>|cRXP_WARN_清理|r |cRXP_ENEMY_贝瑟莱斯|r|cRXP_WARN_周围的区域。小心，她会用蛛网缠住你；持续施放恐惧控制她，同时用持续伤害技能输出|r << Warlock
    >>|cRXP_WARN_此任务难度较高，必要时可以跳过|r
    .complete 6284,1 --Collect Besseleth's Fang (x1)
    .unitscan 贝瑟莱斯

step
    #xprate <2.1
    .goto Stonetalon Mountains,67.38,86.99,80,0
    .goto Stonetalon Mountains,61.44,81.74,80,0
    .goto Stonetalon Mountains,58.44,75.90,40,0
    .goto Stonetalon Mountains,54.99,76.03
    >>击杀 |cRXP_ENEMY_深苔爬行者|r
    >>|cRXP_WARN_保留你拾取到的所有|r |T134339:0|t[小毒囊] |cRXP_WARN_。|r << Rogue
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob 深苔爬行者

step
    #xprate <2.1
    #completewith next
    .goto Stonetalon Mountains,51.40,61.14,50,0
    .goto Stonetalon Mountains,49.96,61.04
    .subzone 460 >>前往烈日石居

step
    #xprate <2.1
    .goto Stonetalon Mountains,47.47,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板杰卡|r 对话
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .target 旅店老板杰卡
    .isOnQuest 1483

step
    #xprate <2.1
    .goto Stonetalon Mountains,47.61,61.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅店二楼与 |cRXP_FRIENDLY_基达|r 对话
    .vendor >> |cRXP_BUY_购买|r |T134831:0|t[治疗药水] |cRXP_BUY_，前提是她有货|r << !Warrior
    .vendor >> |cRXP_BUY_购买|r |T134831:0|t[治疗药水] |cRXP_BUY_和|r |T134413:0|t[活根草] |cRXP_BUY_，前提是她有货|r << Warrior
    .target 基达
    .isOnQuest 1483

step
    #xprate <2.1
    #label KayaLives
    .goto Stonetalon Mountains,47.46,58.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔姆拉|r 对话
    .turnin 6401 >>交任务：卡雅还活着
    .target 塔姆拉·荒原
    .isQuestTurnedIn 6523

step
    #xprate <2.1
    .goto Stonetalon Mountains,47.20,61.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马格兰|r 对话
    .turnin 6284 >> 交任务：贝瑟莱斯
    .target 马格兰
    .isQuestComplete 6284

step
    #xprate <2.1
    #label SRRFP
    .goto Stonetalon Mountains,45.13,59.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔姆|r 对话
    .fp Sun Rock Retreat >> 获取烈日石居的飞行点
    .target 萨尔姆
    .subzoneskip 460,1

step
    #xprate <2.1
    #completewith next
    .goto Stonetalon Mountains,58.99,62.60,15 >> 前往 |cRXP_FRIENDLY_菲兹克斯|r 处

step
    #xprate <2.1
    .goto Stonetalon Mountains,58.99,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲兹克斯|r 对话
    .turnin 1483 >> 交任务：菲兹克斯
    .accept 1093 >> 接任务：超级收割机6000
    .target 菲兹克斯

step
    #xprate <2.1
    #completewith Windshear
    >>拾取树附近的 |cRXP_PICK_蜘蛛卵|r
    >>|cRXP_WARN_小心！|r |cRXP_ENEMY_深苔幼蛛|r |cRXP_WARN_有几率召唤一只22级的|r |cRXP_ENEMY_深苔雌蜘蛛|r
    .complete 1069,1 --Collect Deepmoss Egg (x15)

step
    #xprate <2.1
    #loop
    .goto Stonetalon Mountains,59.25,61.55,0
    .goto Stonetalon Mountains,59.25,61.55,50,0
    .goto Stonetalon Mountains,60.37,60.10,50,0
    .goto Stonetalon Mountains,61.34,59.15,50,0
    .goto Stonetalon Mountains,61.15,57.85,50,0
    .goto Stonetalon Mountains,61.41,56.77,50,0
    .goto Stonetalon Mountains,62.21,58.55,50,0
    .goto Stonetalon Mountains,63.12,60.02,50,0
    .goto Stonetalon Mountains,64.69,60.03,50,0
    .goto Stonetalon Mountains,62.76,61.69,50,0
    .goto Stonetalon Mountains,62.50,62.92,50,0
    .goto Stonetalon Mountains,62.48,64.15,50,0
    .goto Stonetalon Mountains,61.85,66.07,50,0
    .goto Stonetalon Mountains,60.71,66.12,50,0
    .goto Stonetalon Mountains,60.96,63.99,50,0
    .goto Stonetalon Mountains,60.25,63.21,50,0
    >>击杀 |cRXP_ENEMY_深苔毒蜘蛛|r
    >>|cRXP_WARN_保留你拾取到的所有|r |T134339:0|t[小毒囊] |cRXP_WARN_。|r << Rogue
    .complete 6461,2 --Kill Deepmoss Venomspitter (x7)
    .mob 深苔毒蜘蛛

step << Troll Warrior/Orc Warrior/Tauren Warrior
    #xprate <2.1
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈，并向他购买|r |T135157:0|t[占卜法杖] |cRXP_BUY_。|r
    .collect 928,1,899,1 --Collect Long Staff (1)
    .money <0.9860
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.1

step << Troll Warrior/Orc Warrior/Tauren Warrior
    #xprate <2.1
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.1
    .xp <20,1

step << Undead Warrior
    #xprate <2.1
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维尼克斯|r 对话
    .vendor >>|cRXP_BUY_向他购买|r |T135329:0|t[刽子手之剑] |cRXP_BUY_。|r
    >>|cRXP_WARN_如果没有出售，就购买|r |T135280:0|t[微光重剑] |cRXP_WARN_作为替代|r
    .money <1.5024
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.1

step << Undead Warrior
    #xprate <2.1
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135329:0|t[刽子手之剑]
    .use 4818
    .itemcount 4818,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.1

step << Undead Warrior
    #xprate <2.1
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135280:0|t[微光重剑]
    .use 922
    .itemcount 922,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.1
    .xp <21,1

step << Shaman
    #xprate <2.1
    #season 0
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈，并向他购买|r |T135157:0|t[占卜法杖] |cRXP_BUY_。|r
    .collect 928,1,899,1 --Collect Long Staff (1)
    .money <0.9860
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2

step << Shaman
    #xprate <2.1
    #season 0
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1

step << Shaman
    #xprate <2.1
    #season 2
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈，并向他购买|r |T133476:0|t[尖刺流星锤] |cRXP_BUY_。|r
    .collect 925,1,899,1 --Collect Flail (1)
    .money <0.7797
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8

step << Shaman
    #xprate <2.1
    #season 2
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T133476:0|t[尖刺流星锤]
    .use 925
    .itemcount 925,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
    .xp <20,1

step << Rogue
    #xprate <2.1
    #season 0
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_对话，并向他购买|r |T135324:0|t[长剑] |cRXP_BUY_。|r
    .collect 923,1,899,1 --Collect Longsword (1)
    .money <0.8743
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1

step << Rogue
    #xprate <2.1
    #season 0
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
    .xp <21,1

step << Rogue
    #xprate <2.1
    #season 2
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_对话，并向他购买一到两把|r |T135342:0|t[波刃短剑] |cRXP_BUY_。|r
    .collect 2209,1,899,1 --Collect Kris (1)
    .money <0.7115
    .target 维尼克斯
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.8

step << Rogue
    #xprate <2.1
    #season 2
    #optional
    #completewith BluePrints
    +|cRXP_WARN_装备|r |T135342:0|t[波刃短剑]
    .use 2209
    .itemcount 2209,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.8
    .xp <19,1

step
    #xprate <2.1
    #label Windshear
    .subzone 461 >> 前往狂风峭壁
    .isOnQuest 1093

step
    #xprate <2.1
    #completewith next
    >>击杀 |cRXP_ENEMY_风险投资公司樵夫|r
    .complete 1062,1 --Kill Venture Co. Logger (x15)
    .mob 风险投资公司樵夫

step
    #xprate <2.1
    #label BluePrints
    #loop
    .goto Stonetalon Mountains,62.8,53.7,0
    .goto Stonetalon Mountains,62.8,53.7,100,0
    .goto Stonetalon Mountains,61.7,51.5,100,0
    .goto Stonetalon Mountains,66.8,45.3,100,0
    .goto Stonetalon Mountains,71.7,49.9,100,0
    .goto Stonetalon Mountains,74.3,54.7,100,0
    >>击杀 |cRXP_ENEMY_风险投资公司操作员|r，并拾取他们的 |cRXP_LOOT_蓝图|r
    .complete 1093,1 --Collect Super Reaper 6000 Blueprints (x1)
    .mob 风险投资公司操作员

step
    #xprate <2.1
    #loop
    .goto Stonetalon Mountains,61.50,55.12,0
    .goto Stonetalon Mountains,61.50,55.12,50,0
    .goto Stonetalon Mountains,60.48,55.10,50,0
    .goto Stonetalon Mountains,59.80,53.69,50,0
    .goto Stonetalon Mountains,59.53,52.52,50,0
    .goto Stonetalon Mountains,60.80,51.23,50,0
    .goto Stonetalon Mountains,62.06,54.39,50,0
    .goto Stonetalon Mountains,62.63,55.35,50,0
    .goto Stonetalon Mountains,63.63,54.42,50,0
    .goto Stonetalon Mountains,65.42,54.15,50,0
    .goto Stonetalon Mountains,66.83,54.92,50,0
    .goto Stonetalon Mountains,68.64,54.03,50,0
    .goto Stonetalon Mountains,69.86,53.53,50,0
    .goto Stonetalon Mountains,70.34,56.41,50,0
    .goto Stonetalon Mountains,67.90,56.96,50,0
    .goto Stonetalon Mountains,66.25,56.64,50,0
    .goto Stonetalon Mountains,65.29,57.14,50,0
    .goto Stonetalon Mountains,64.27,57.63,50,0
    >>击杀 |cRXP_ENEMY_风险投资公司樵夫|r
    .complete 1062,1 --Kill Venture Co. Logger (x15)
    .mob 风险投资公司樵夫

step
    #xprate <2.1
    #loop
    .goto Stonetalon Mountains,61.41,56.77,0
    .goto Stonetalon Mountains,59.25,61.55,30,0
    .goto Stonetalon Mountains,60.37,60.10,30,0
    .goto Stonetalon Mountains,61.34,59.15,30,0
    .goto Stonetalon Mountains,61.15,57.85,30,0
    .goto Stonetalon Mountains,61.41,56.77,30,0
    .goto Stonetalon Mountains,62.21,58.55,30,0
    .goto Stonetalon Mountains,63.12,60.02,30,0
    .goto Stonetalon Mountains,64.69,60.03,30,0
    .goto Stonetalon Mountains,62.76,61.69,30,0
    .goto Stonetalon Mountains,62.50,62.92,30,0
    .goto Stonetalon Mountains,62.48,64.15,30,0
    .goto Stonetalon Mountains,61.85,66.07,30,0
    .goto Stonetalon Mountains,60.71,66.12,30,0
    .goto Stonetalon Mountains,60.96,63.99,30,0
    .goto Stonetalon Mountains,60.25,63.21,30,0
    >>拾取树附近的 |cRXP_PICK_蜘蛛卵|r
    >>|cRXP_WARN_小心！|r |cRXP_ENEMY_深苔幼蛛|r |cRXP_WARN_有几率召唤一只22级的|r |cRXP_ENEMY_深苔雌蜘蛛|r
    .complete 1069,1 --Collect Deepmoss Egg (x15)

step
    #optional
    #xprate <2.1
    #completewith next
    +|cRXP_WARN_如果你有超过15个|cRXP_LOOT_深苔蜘蛛的卵|r|cRXP_WARN_，将多余的卵拆成单独一堆（按住shift点击），然后删除|r

step
    #xprate <2.1
    .goto Stonetalon Mountains,58.99,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲兹克斯|r 对话
    .turnin 1093 >> 交任务：超级收割机6000
    .accept 1094 >> 接任务：新的指示
    .target 菲兹克斯

step
    #xprate <2.1
    #loop
    .goto Stonetalon Mountains,59.04,73.01,0
    .goto Stonetalon Mountains,60.83,71.84,80,0
    .goto Stonetalon Mountains,59.04,73.01,80,0
    .goto Stonetalon Mountains,60.36,76.28,80,0
    .goto Stonetalon Mountains,61.47,81.51,80,0
    .goto Stonetalon Mountains,64.95,83.88,80,0
    .goto Stonetalon Mountains,68.59,88.34,80,0
    >>继续击杀 |cRXP_ENEMY_深苔爬行者|r
    >>|cRXP_WARN_保留你拾取到的所有|r |T134339:0|t[小毒囊] |cRXP_WARN_。|r << Rogue
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob 深苔爬行者

step << Druid
    #completewith DruidTraining2
    .cast 18960 >>|cRXP_WARN_施放|r |T135758:0|t[传送：月光林地]
    .zoneskip Moonglade

step << Druid
    #optional
    .goto Moonglade,52.53,40.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 1430 >> 学习职业技能
    .target 洛甘纳尔
    .xp <18,1
    .xp >20,1

step << Druid
    #optional
    .goto Moonglade,52.53,40.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 768 >> 学习职业技能
    .target 洛甘纳尔
    .xp <20,1
    .xp >22,1

step << Druid
    #label DruidTraining2
    .goto Moonglade,52.53,40.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 1075 >> 学习职业技能
    .target 洛甘纳尔
    .xp <22,1

step
    #completewith JornSkyseerTurnin << !Druid
    .hs >> 炉石回陶拉祖营地 << !Druid
    .hs >> 炉石回陶拉祖营地。如果炉石还在冷却，请等冷却结束后再使用。 << Druid
    .use 6948
    .cooldown item,6948,>0 << !Druid
    .bindlocation 378,1
    .subzoneskip 378

step
    #completewith next
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Camp Taurajo >> 飞往陶拉祖营地
    .target 迪弗拉克
    .subzoneskip 380,1
    .cooldown item,6948,<0

step
    #label JornSkyseerTurnin
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r 对话
    .turnin 3261 >>交任务：乔恩·星眼
    .accept 882 >>接任务：伊沙姆哈尔
    .target 乔恩·星眼

step << Warlock
    #season 2
    #sticky
    #completewith BarrensEnd
    #label ExplorerImp
    >>在做任务时，对怪物施放 |T136163:0|t|cRXP_FRIENDLY_[吸取灵魂]|r，直到获得 |T133257:0|t|cRXP_LOOT_探险之魂|r。|cRXP_WARN_使用它学习如何召唤|r |T236294:0|t|cRXP_FRIENDLY_[探险小鬼]|r
    .train 445459 >>|cRXP_WARN_使用|r |T133257:0|t|cRXP_LOOT_探险之魂|r |cRXP_WARN_学习如何召唤|r |T236294:0|t[|cRXP_FRIENDLY_探险小鬼|r]
    .train 445459,1 --Skips if you already have Explorer Imp
    .train 1120,3 --Skips if you don't have drain soul
    .use 221978

step << Warlock/Mage
    #season 2
    #requires ExplorerImp << Warlock
    #sticky
    #completewith BarrensEnd
    #label FelPortalRune
    >>你所在的区域会出现|cRXP_FRIENDLY_邪能传送门|r。发现传送门后，在它旁边召唤|T236294:0|t[|cRXP_FRIENDLY_探险小鬼|r]并与它交谈，派它去探险。10至20分钟后，它会带着战利品返回，并有几率带回|T134419:0|t[|cRXP_FRIENDLY_恶魔卫士符文|r] << Warlock
    >>你所在的区域会出现|cRXP_FRIENDLY_邪能传送门|r。发现传送门后，使用|T134945:0|t[|cRXP_LOOT_空间修复卷轴|r]将其关闭，即可获得|T134939:0|t[|cRXP_FRIENDLY_法术笔记：怨火之箭|r] << Mage
    >>|cRXP_WARN_留意传送门，直到获得符文|r
    .collect 221499,1 << Warlock --rune of the felguard
    .collect 223147,1 << Mage --Spell Notes: Balefire Bolt
    .itemcount 220792,1 << Mage --Scroll of Spatial Mending
    .use 223148 << Warlock --Otherworldy Treasure
    .use 220792 << Mage
    .train 429311,1 << Mage
    .train 431756,1 << Warlock
    .train 1120,3 << Warlock --Skips if you don't have drain soul
    .unitscan 邪能裂片
    .unitscan 邪能崩口
    .unitscan 邪能裂痕
    .unitscan 邪能之疤
    .unitscan 邪能裂隙

step << Warlock/Mage
    #season 2
    #requires FelPortalRune
    #sticky
    #completewith BarrensEnd
    .itemcount 221499,1 << Warlock --Rune of the Felguard
    .itemcount 223147,1 << Mage --Spell Notes: Balefire Bolt
    .train 431756 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_恶魔卫士符文|r] |cRXP_WARN_学习|r |T136216:0|t[召唤恶魔卫士] << Warlock
    .train 429311 >> |cRXP_WARN_使用|T134939:0|t[|cRXP_FRIENDLY_法术笔记：怨火之箭|r]学习|T135809:0|t[怨火之箭]。|r << Mage
    .use 221499 << Warlock
    .use 223147 << Mage

step
    #completewith LakotaMani2
    >>击杀 |cRXP_ENEMY_雷角蜥蜴|r，并拾取它们的 |cRXP_LOOT_角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴

step
    #completewith next
    >>击杀 |cRXP_ENEMY_刺背野猪人|r，拾取它们的 |cRXP_LOOT_獠牙|r，并保留获得的 |T134128:0|t[|cRXP_LOOT_血岩碎片|r]
    .complete 878,1 --Kill Bristleback Water Seeker (x6)
    .mob +刺背寻水者
    .complete 878,2 --Kill Bristleback Thornweaver (x12)
    .mob +刺背织棘者
    .complete 878,3 --Kill Bristleback Geomancer (x12)
    .mob +刺背地卜师
    .complete 899,1 --Collect Bristleback Quilboar Tusk (x60)

step
    #label LakotaMani2
    #loop
    .goto The Barrens,45.14,52.82,0
    .goto The Barrens,45.93,49.08,0
    .goto The Barrens,47.43,51.37,0
    .goto The Barrens,50.10,53.34,0
    .goto The Barrens,45.14,52.82,80,0
    .goto The Barrens,45.93,49.08,80,0
    .goto The Barrens,47.43,51.37,80,0
    .goto The Barrens,50.10,53.34,80,0
    >>击杀 |cRXP_ENEMY_拉克塔曼尼|r，并拾取 |T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r]
    >>|cRXP_WARN_使用 |T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r] 接取任务|r
    >>|cRXP_WARN_它有4个刷新点（地图上已标记）|r
    >>|cRXP_WARN_如果找不到它，请跳过此步骤|r
    .collect 5099,1,883 --Collect Hoof of Lakota'Mani
    .accept 883 >>接任务：拉克塔曼尼
    .use 5099
    .unitscan 拉克塔曼尼

step
    #completewith next
    >>击杀 |cRXP_ENEMY_雷角蜥蜴|r，并拾取它们的 |cRXP_LOOT_角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴

step
    #loop
    .goto The Barrens,50.71,54.60,0
    .goto The Barrens,50.71,54.60,60,0
    .goto The Barrens,50.74,55.33,60,0
    .goto The Barrens,50.73,56.78,60,0
    .goto The Barrens,50.42,57.23,60,0
    .goto The Barrens,50.50,57.65,60,0
    .goto The Barrens,50.87,57.50,60,0
    .goto The Barrens,51.26,57.84,60,0
    .goto The Barrens,51.74,57.69,60,0
    .goto The Barrens,51.79,57.10,60,0
    .goto The Barrens,53.08,54.69,60,0
    .goto The Barrens,53.65,54.27,60,0
    .goto The Barrens,53.63,53.53,60,0
    .goto The Barrens,53.35,52.72,60,0
    .goto The Barrens,53.00,51.83,60,0
    .goto The Barrens,52.62,52.19,60,0
    .goto The Barrens,52.59,52.71,60,0
    .goto The Barrens,52.41,53.07,60,0
    .goto The Barrens,52.32,53.71,60,0
    .goto The Barrens,51.39,54.22,60,0
    >>击杀 |cRXP_ENEMY_刺背野猪人|r，拾取它们的 |cRXP_LOOT_獠牙|r，并保留获得的 |T134128:0|t[|cRXP_LOOT_血岩碎片|r]
    .complete 878,1 --Kill Bristleback Water Seeker (x6)
    .mob +刺背寻水者
    .complete 878,2 --Kill Bristleback Thornweaver (x12)
    .mob +刺背织棘者
    .complete 878,3 --Kill Bristleback Geomancer (x12)
    .mob +刺背地卜师
    .complete 899,1 --Collect Bristleback Quilboar Tusk (x60)

step << Warlock/Shaman
    #optional
    #loop
    .goto The Barrens,50.71,54.60,60,0
    .goto The Barrens,50.74,55.33,60,0
    .goto The Barrens,50.73,56.78,60,0
    .goto The Barrens,50.42,57.23,60,0
    .goto The Barrens,50.50,57.65,60,0
    .goto The Barrens,50.87,57.50,60,0
    .goto The Barrens,51.26,57.84,60,0
    .goto The Barrens,51.74,57.69,60,0
    .goto The Barrens,51.79,57.10,60,0
    .goto The Barrens,53.08,54.69,60,0
    .goto The Barrens,53.65,54.27,60,0
    .goto The Barrens,53.63,53.53,60,0
    .goto The Barrens,53.35,52.72,60,0
    .goto The Barrens,53.00,51.83,60,0
    .goto The Barrens,52.62,52.19,60,0
    .goto The Barrens,52.59,52.71,60,0
    .goto The Barrens,52.41,53.07,60,0
    .goto The Barrens,52.32,53.71,60,0
    .goto The Barrens,51.39,54.22,60,0
    .xp 19 >> 刷怪升到19级

step
    #loop
    .goto The Barrens,50.88,52.96,0
    .goto The Barrens,50.88,52.96,50,0
    .goto The Barrens,50.06,52.78,50,0
    .goto The Barrens,49.35,53.74,50,0
    .goto The Barrens,49.54,55.08,50,0
    .goto The Barrens,49.03,56.24,50,0
    .goto The Barrens,49.72,56.13,50,0
    >>击杀 |cRXP_ENEMY_雷角蜥蜴|r，并拾取它们的 |cRXP_LOOT_角|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob 雷角蜥蜴

step
    #completewith next
    >>击杀 |cRXP_ENEMY_赤鳞镰爪龙|r，并拾取它们的 |cRXP_LOOT_角|r
    >>|cRXP_WARN_小心它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（蓄积2次额外攻击，间隔为10秒）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob 赤鳞镰爪龙

step
    #loop
    .goto The Barrens,53.98,51.68,0
    .goto The Barrens,53.98,51.68,50,0
    .goto The Barrens,54.10,50.58,50,0
    .goto The Barrens,53.85,49.76,50,0
    .goto The Barrens,54.32,49.38,50,0
    .goto The Barrens,54.82,49.00,50,0
    .goto The Barrens,55.23,47.96,50,0
    >>继续击杀 |cRXP_ENEMY_平原陆行鸟|r，并拾取它们的 |cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob 巨型平原陆行鸟

step
    #loop
    .goto The Barrens,57.3,53.7,0
    .goto The Barrens,52.0,46.5,0
    .goto The Barrens,57.3,53.7,90,0
    .goto The Barrens,52.0,46.5,90,0
    >>继续击杀 |cRXP_ENEMY_赤鳞镰爪龙|r，并拾取它们的 |cRXP_LOOT_角|r
    >>|cRXP_WARN_小心它们会施放|r |T132152:0|t[痛击] |cRXP_WARN_（蓄积2次额外攻击，间隔为10秒）|r
    .complete 865,1 --Intact Raptor Horn (5)
    .mob 赤鳞镰爪龙

step
    #completewith next
    >>击杀任意 |cRXP_ENEMY_斑马|r，并拾取 |cRXP_LOOT_新鲜的斑马肉|r
    .collect 10338,1 --Collect Fresh Zhevra Carcass
    .mob 冲锋斑马

step
    #loop
    .goto The Barrens,55.59,43.39,0
    .goto The Barrens,55.59,43.39,40,0
    .goto The Barrens,55.09,43.00,40,0
    .goto The Barrens,55.03,42.21,40,0
    .goto The Barrens,55.47,41.51,40,0
    .goto The Barrens,55.99,42.00,40,0
    .goto The Barrens,56.15,42.53,40,0
    .goto The Barrens,56.01,43.40,40,0
    >>在湖中及周边击杀 |cRXP_ENEMY_绿洲钳嘴龟|r，并拾取它们的 |cRXP_LOOT_龟壳|r
    .complete 880,1 --Altered Snapjaw Shell (8)
    .mob 绿洲钳嘴龟

step << Shaman/Priest
    #season 2
    #loop
    .goto The Barrens,55.77,34.01,40,0 --Spawn 1
    .goto The Barrens,55.83,34.21,40,0
    .goto The Barrens,54.81,35.95,40,0 --Spawn 2
    .goto The Barrens,54.96,35.72,40,0
    .goto The Barrens,57.47,36.03,40,0 --Spawn 3
    .goto The Barrens,57.56,35.78,40,0
    .goto The Barrens,57.46,35.70,40,0
    .goto The Barrens,57.59,38.36,40,0 --Spawn 4
    .goto The Barrens,57.49,38.65,40,0
    .goto The Barrens,58.82,37.67,40,0 --Spawn 5
    .goto The Barrens,58.92,37.53,40,0
    .goto The Barrens,58.94,37.73,40,0
    >>施放 |T136075:0|t[净化术]，消灭|cRXP_ENEMY_沙漠魅影|r，并拾取 |T134419:0|t|cRXP_LOOT_[地之符文]|r << Shaman
    >>施放 |T135894:0|t[驱散魔法]，消灭|cRXP_ENEMY_沙漠魅影|r，并拾取 |T135975:0|t[|cRXP_FRIENDLY_帝王消陨的预言|r] << Priest
    .collect 208758,1 << Shaman --Earthen Rune (1)
    .collect 205932,1 << Priest-- Prophecy of a King's Demise (1)
    .unitscan 沙漠魅影
    .train 410107,1 << Shaman
    .train 402849,1 << Priest
    .train 370,3 << Shaman --Purge
    .train 527,3 << Priest --Dispel Magic
    --XX Respawns after 85s-170s

step
    #completewith next
    >>击杀任意 |cRXP_ENEMY_斑马|r，并拾取 |cRXP_LOOT_新鲜的斑马肉|r
    .collect 10338,1 --Collect Fresh Zhevra Carcass
    .mob 冲锋斑马

step
    #label IshamuhalesFang
    .goto The Barrens,59.71,30.33
    .use 10338 >>在枯树处使用 |T134368:0|t[|cRXP_LOOT_新鲜的斑马肉|r] 召唤 |cRXP_ENEMY_伊沙姆哈尔|r。击杀他，并拾取他的 |cRXP_LOOT_獠牙|r
    >>|cRXP_WARN_新鲜的斑马肉只有30分钟时限！|r
    .complete 882,1 --Ishamuhale's Fang (1)
    .mob 伊沙姆哈尔

step
    #completewith FlytoXroads
    .goto The Barrens,63.07,36.31 << Rogue
    .goto The Barrens,62.68,36.23 << !Rogue
    .subzone 392 >> 前往棘齿城

step << Rogue
    .goto The Barrens,63.07,36.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卑鄙的维尼克斯|r 对话
    .turnin 2381 >>交任务：抢劫海盗
    .target 卑鄙的维尼克斯

step
    #label BootyTurnin
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹鲁维|r 对话
    .turnin 888 >>交任务：被窃的货物
    .target 加兹鲁维
    .isQuestComplete 888

step
    #sticky
    #completewith FlytoXroads
    #season 2
    .goto The Barrens,61.8,39.4
    >>|cRXP_WARN_如果你有|cRXP_LOOT_3金币|r可供支配，可以向|r |cRXP_FRIENDLY_格里兹比|r |cRXP_WARN_购买符文。他在棘齿城旅店内；自行判断是否买得起，以及符文是否对你的职业有用。也可以以后再买|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旅店内的 |cRXP_FRIENDLY_格里兹比|r 对话
    .use 210822 << Priest
    .use 210820 << Paladin
    .use 210654 << Mage
    .use 210818 << Hunter
    .use 210817 << Druid
    .use 210825 << Warrior
    .use 210824 << Warlock
    .use 210653 << Rogue
    .use 210823 << Shaman
    .train 415995 >>|cRXP_WARN_购买并使用|r |T135791:0|t[|cRXP_FRIENDLY_祥和顿悟|r] |cRXP_WARN_学习|r |T237549:0|t[妙手回春] << Priest
    .train 410010 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_牺牲符文|r] |cRXP_WARN_学习|r |T134596:0|t[铭刻裤子 - 牺牲之手] << Paladin
    .train 401761 >>|cRXP_WARN_购买并使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：时光倒转|r] |cRXP_WARN_学习|r |T237538:0|t[时光倒转] << Mage
    .train 410122 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_独来独往符文|r] |cRXP_WARN_学习|r |T132266:0|t[独来独往] << Hunter
    .train 416042 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_优胜劣汰符文|r] |cRXP_WARN_学习|r |T132126:0|t[优胜劣汰] << Druid
    .train 425445 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_战神符文|r] |cRXP_WARN_学习|r |T236319:0|t[战神] << Warrior
    .train 425476 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_契约符文|r] |cRXP_WARN_学习|r |T237562:0|t[恶魔契约] << Warlock
    .train 424990 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_左右开弓符文|r] |cRXP_WARN_学习|r |T237531:0|t[左右开弓] << Rogue
    .train 410096 >>|cRXP_WARN_购买并使用|r |T134419:0|t[|cRXP_FRIENDLY_双武器专精符文|r] |cRXP_WARN_学习|r |T132686:0|t[铭刻胸甲 - 双武器专精] << Shaman
    .target 格里兹比
    .train 415995,1 << Priest
    .train 410010,1 << Paladin
    .train 401761,1 << Mage
    .train 410122,1 << Hunter
    .train 416042,1 << Druid
    .train 425445,1 << Warrior
    .train 425476,1 << Warlock
    .train 424990,1 << Rogue
    .train 410096,1 << Shaman
    .money <3.0

step
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r、|cRXP_FRIENDLY_麦伯克·米希瑞克斯|r 和 |cRXP_FRIENDLY_酿酒师德罗恩|r 对话
    .turnin 1094 >>交任务：新的指示
    --.accept 1095 >>Accept Further Instructions
    .target +斯布特瓦夫
    .goto The Barrens,62.98,37.22
    .turnin 865 >>交任务：迅猛龙角
    .turnin 1069 >>交任务：深苔蜘蛛的卵
    .accept 1491 >>接任务：智慧饮料
    .target +麦伯克·米希瑞克斯
    .goto The Barrens,62.37,37.62
    .turnin 821 >>交任务：老陈的空酒桶
    .target +酿酒师德罗恩
    .goto The Barrens,62.27,38.39
    .dungeon WC

step
    #xprate <2.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r、|cRXP_FRIENDLY_麦伯克·米希瑞克斯|r 和 |cRXP_FRIENDLY_酿酒师德罗恩|r 对话
    .turnin 1094 >>交任务：新的指示
    --.accept 1095 >>Accept Further Instructions
    .target +斯布特瓦夫
    .goto The Barrens,62.98,37.22
    .turnin 865 >>交任务：迅猛龙角
    .turnin 1069 >>交任务：深苔蜘蛛的卵
    .target +麦伯克·米希瑞克斯
    .goto The Barrens,62.37,37.62
    .turnin 821 >>交任务：老陈的空酒桶
    .target +酿酒师德罗恩
    .goto The Barrens,62.27,38.39

step
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦伯克·米希瑞克斯|r 和 |cRXP_FRIENDLY_酿酒师德罗恩|r 对话
    .turnin 865 >>交任务：迅猛龙角
    .accept 1491 >>接任务：智慧饮料
    .target +麦伯克·米希瑞克斯
    .goto The Barrens,62.37,37.62
    .turnin 821 >>交任务：老陈的空酒桶
    .target +酿酒师德罗恩
    .goto The Barrens,62.27,38.39
    .dungeon WC

step
    #xprate >2.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦伯克·米希瑞克斯|r 和 |cRXP_FRIENDLY_酿酒师德罗恩|r 对话
    .turnin 865 >>交任务：迅猛龙角
    .target +麦伯克·米希瑞克斯
    .goto The Barrens,62.37,37.62
    .turnin 821 >>交任务：老陈的空酒桶
    .target +酿酒师德罗恩
    .goto The Barrens,62.27,38.39

step << Warrior
    .goto The Barrens,62.20,38.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格拉利克斯|r 对话
    .vendor >>如有货，向他购买 |T134583:0|t[|cRXP_FRIENDLY_粗链短裤|r]
    .target 格拉利克斯
    .money <0.619
    .itemStat 7,ITEM_MOD_ARMOR_SHORT,<155
    .isQuestTurnedIn 865
    .equip 7,4800

step << Rogue/Hunter/Warrior/Shaman/Druid
    .goto The Barrens,62.16,38.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维克斯宾德|r 对话
    .vendor >> 如有货，向他购买 |T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r]
    .target 维克斯宾德
    .money <0.3515
    .itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
    .isQuestTurnedIn 865
    .equip 9,4794

step << Warrior
    #optional
    #completewith FlytoXroads
    +|cRXP_WARN_装备|r |T134583:0|t[|cRXP_FRIENDLY_粗链短裤|r]
    .use 4800
    .itemcount 4800,1
    .itemStat 7,ITEM_MOD_ARMOR_SHORT,<155
    .isQuestTurnedIn 865
    .equip 7,4800

step << Rogue/Hunter/Warrior/Shaman/Druid
    #optional
    #completewith FlytoXroads
    +|cRXP_WARN_装备|r |T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r]
    .use 4794
    .itemcount 4794,1
    .itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
    .isQuestTurnedIn 865
    .xp <20,1
    .equip 9,4794

step
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板维尔雷|r 对话
    .home >>将炉石绑定在棘齿城
    .target 旅店老板维尔雷
    .dungeon WC
    .bindlocation 392
    .isQuestTurnedIn 865

step
    .goto The Barrens,63.09,37.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比戈弗兹|r交谈
    .accept 959 >> 接任务：港口的麻烦
    .target 起重机操作员比戈弗兹
    .dungeon WC

step
    #label FlytoXroads
    #completewith XroadsHS2
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 对话
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 380

step << Hunter
    #xprate <2.1
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索克|r 对话
    .accept 6541 >>接任务：向卡德拉克报到
    .target 索克

step
    #xprate <2.1
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    >>|cRXP_WARN_他在塔顶|r
    .turnin 875 >>交任务：鹰身人首领
    .accept 876 >>接任务：塞瑞娜·血羽
    .target 达索克·快刀
    .isQuestComplete 875

step
    #xprate <2.1
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    >>|cRXP_WARN_他在塔顶|r
    .accept 876 >>接任务：塞瑞娜·血羽
    .target 达索克·快刀
    .isQuestTurnedIn 875

step
    #label XroadsHS2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_曼科里克|r 和 |cRXP_FRIENDLY_图加·符文图腾|r 对话
    .turnin 899 >>交任务：复仇的怒火
    .target +曼科里克
    .goto The Barrens,51.95,31.58
    .turnin 880 >>交任务：变异的生物
    .accept 1489 >>接任务：哈缪尔·符文图腾
    .accept 3301 >>接任务：茉拉·符文图腾 << Shaman/Rogue
    .target +图加·符文图腾
    .goto The Barrens,52.26,31.93

step
    .goto The Barrens,51.10,29.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科兰|r 对话
    .accept 868 >> 接任务：蝎卵
    .target 科兰

step
    .destroy 5085 >>|cRXP_WARN_摧毁你可能还留着的|r |T133721:0|t[刺背野猪人的獠牙] |cRXP_WARN_。|r
    .itemcount 5085,1

step << Shaman
    #completewith next
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克

step << Shaman
    .goto Orgrimmar,37.96,37.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希尔恩·火结|r 对话
    .accept 1528 >> 接任务：水之召唤
    .target 希尔恩·火结

step << Shaman
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 对话
    .train 2645 >> 学习职业技能
    .target 卡德里斯

step << Warlock
    #completewith next
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克

step << Warlock
    .goto Orgrimmar,48.25,45.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_甘鲁尔·血眼|r 对话
    .trainer >>学习职业技能
    .accept 1507 >>接任务：噬魂者
    .target 甘鲁尔·血眼

step << Warlock
    .goto Orgrimmar,47.54,46.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_库古尔|r 对话，并购买 |T133738:0|t[魔典：折磨（等级 2）]
    .collect 16346,1,493,1 --Grimoire of Torment (Rank 2)
    .target 库古尔

step << Warlock
    .goto Orgrimmar,47.05,46.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡祖尔|r 对话
    .turnin 1507 >>交任务：噬魂者
    .accept 1508 >>接任务：盲眼卡祖尔
    .target 卡祖尔

step << Warlock
    .goto Orgrimmar,44.16,48.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_卡提斯|r|cRXP_BUY_对话，并向她购买|r |T135139:0|t[燃烧魔杖] |cRXP_BUY_。|r
    .collect 5210,1,493,1 --Collect Burning Wand (1)
    .money <0.5808
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.4
    .target 卡提斯

step << Warlock
    .goto Orgrimmar,37.03,59.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赞卡沙|r 对话
    .turnin 1508 >>交任务：盲眼卡祖尔
    .accept 1509 >>接任务：多格兰的消息
    .target 赞卡沙

step
    #completewith EnterDM
    .subzone 1581 >> 现在应该开始找队伍去死亡矿井了
    .dungeon DM

step
    #completewith ZepptoSTVforDM
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克
    .dungeon DM

step << Shaman
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 对话
    .train 8052 >> 学习职业技能
    .target 卡德里斯
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Shaman
    #optional
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 对话
    .train 2645 >> 学习职业技能
    .target 卡德里斯
    .xp <20,1
    .dungeon DM

step << Hunter
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥玛克|r 对话
    .train 14318 >>学习职业技能
    .target 奥玛克
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Hunter
    #optional
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥玛克|r 对话
    .train 14290 >>学习职业技能
    .target 奥玛克
    .xp <20,1
    .dungeon DM

step << Hunter
    .goto Orgrimmar,66.33,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肖祖|r 对话
    .train 14917 >>学习宠物技能
    .target 肖祖
    .xp <20,1
    .dungeon DM

step << Warrior
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格雷兹·怒拳|r 对话
    .train 8198 >>学习职业技能
    .target 格雷兹·怒拳
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Warrior
    #optional
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格雷兹·怒拳|r 对话
    .train 845 >> 学习职业技能
    .target 格雷兹·怒拳
    .xp <20,1
    .dungeon DM

step << Rogue
    .goto Orgrimmar,43.90,54.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_奥莫克|r 对话
    .train 1943 >> 学习职业技能
    .target 奥莫克
    .xp <20,1
    .dungeon DM

step << Warlock
    .goto Orgrimmar,47.98,45.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泽弗洛斯特|r 对话
    .train 1014 >> 学习职业技能
    .target 泽弗洛斯特
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Warlock
    #optional
    .goto Orgrimmar,47.98,45.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_泽弗洛斯特|r 对话
    .train 706 >> 学习职业技能
    .target 泽弗洛斯特
    .xp <20,1
    .dungeon DM

step << Mage
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 3140 >> 学习职业技能
    .target 皮菲瑞多
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Mage
    #optional
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 1953 >> 学习职业技能
    .target 皮菲瑞多
    .xp <20,1
    .dungeon DM

step << Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r交谈
    .train 970 >> 学习职业技能
    .target 乌尔库
    .xp <18,1
    .xp >20,1
    .dungeon DM

step << Priest
    #optional
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔库|r交谈
    .train 14914 >> 学习职业技能
    .target 乌尔库
    .xp <20,1
    .dungeon DM
    --VV Adjust to 20-22 level range

step
    #ah
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨苏恩|r 对话
    >>|cRXP_BUY_从拍卖行购买|r |T132794:0|t[灯油] |cRXP_BUY_（若有货）|r
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
    .goto Durotar,50.8,13.8,40 >>前往飞艇塔顶
    .zone Stranglethorn Vale >>乘坐飞艇前往荆棘谷
    .zoneskip Stranglethorn Vale
    .dungeon DM

step
    .goto Stranglethorn Vale,30.51,29.10,40,0
    .goto Stranglethorn Vale,27.09,31.27,40,0
    .goto Stranglethorn Vale,22.90,31.17,60,0
    .goto Stranglethorn Vale,19.06,27.00,60,0
    .goto Stranglethorn Vale,16.33,23.46,60,0
    .goto Stranglethorn Vale,13.49,19.04,60,0
    .goto Westfall,41.08,98.55,60,0
    .goto Westfall,37.10,89.16,40,0
    .goto Westfall,30.01,86.02,200 >> 从格罗姆高营地直接向西游入暗礁海，再向北游往西部荒野
    >>|cRXP_WARN_远离该岛，沿路径点前进以确保安全！|r
    .dungeon DM

step
    #completewith next
    .goto Westfall,30.01,86.02,40 >> 前往西部荒野灯塔
    .dungeon DM

step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r 对话
    .accept 104 >> 接任务：海岸上的威胁
    .accept 103 >> 接任务：长明的灯塔
    .target 葛瑞森船长
    .dungeon DM

step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r 对话
    .turnin 103 >> 交任务：长明的灯塔
    .itemcount 814,5 -- Flask of Oil (5)
    .target 葛瑞森船长
    .dungeon DM

step
    .goto Westfall,34.43,83.93
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀 |cRXP_ENEMY_老瞎眼|r，并拾取他的 |cRXP_LOOT_鳞片|r
    >>|cRXP_ENEMY_老瞎眼|r |cRXP_WARN_沿长滩来回巡逻。如果沿长滩找不到他，就在最南端的|cRXP_ENEMY_鱼人|r营地等待他刷新|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan 老瞎眼
    .dungeon DM

step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_葛瑞森船长|r 对话
    .turnin 104 >> 交任务：海岸上的威胁
    .target 葛瑞森船长
    .dungeon DM

step
    #optional
    .abandon 103 >> 放弃任务：长明的灯塔
    .dungeon DM

step
    #label EnterDM
    .goto Eastern Kingdoms,40.92,81.97,8,0
    .goto Eastern Kingdoms,40.92,82.02,8,0
    .goto Eastern Kingdoms,40.89,82.04,8,0
    .goto Eastern Kingdoms,40.96,82.10,8,0
    .goto Eastern Kingdoms,40.92,82.16,15,0
    .goto Eastern Kingdoms,40.82,82.30,15,0
    .goto Eastern Kingdoms,40.77,82.52,15,0
    .goto Eastern Kingdoms,40.74,82.61,15,0
    .goto Eastern Kingdoms,40.63,82.49,15,0
    .goto Eastern Kingdoms,40.50,82.45
    .zone 291 >> 进入死亡矿井副本传送门，然后进入副本
    .dungeon DM

step
    .hs >> 完成死亡矿井后开炉石回到贫瘠之地
    .zone The Barrens >> 抵达贫瘠之地
    .use 6948
    .dungeon DM

step
    #optional
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板维尔雷|r 对话
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .target 旅店老板维尔雷
    .subzoneskip 392,1
    .dungeon WC

step
    #optional
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板伯兰德·草风|r 对话
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_出售杂物；如有需要，再补充食物|r << Rogue/Warrior
    .target 旅店老板伯兰德·草风
    .subzoneskip 380,1
    .dungeon DM

step << Warlock
    #completewith TurninDogran
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 对话
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 392,1
    .dungeon WC

step << Warlock
    #completewith TurninDogran
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 对话
    .fly Crossroads >> 飞往十字路口
    .zoneskip Orgrimmar,1
    .target 多拉斯

step << Warlock
    #label TurninDogran
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r 对话
    .turnin 1509 >>交任务：多格兰的消息
    .accept 1510 >>接任务：多格兰的消息
    .target 加兹罗格

step << Shaman
    #completewith CallofWater01
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_多拉斯|r 对话
    .fly Ratchet >> 飞往棘齿城
    .target 多拉斯
    .zoneskip Orgrimmar,1

step << Shaman
    #label CallofWater01
    .goto The Barrens,65.83,43.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_水之先知伊斯伦|r 对话
    .turnin 1528 >>交任务：水之召唤
    .accept 1530 >>接任务：水之召唤
    .target 水之先知伊斯伦

step << !Warlock !Shaman
    #completewith next
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 对话
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 392,1
    .dungeon WC

step << Shaman
    #completewith next
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 对话
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .subzoneskip 380

step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫布瑞姆|r 对话
    >>|cRXP_FRIENDLY_赫布瑞姆|r |cRXP_WARN_会开启一个45分钟的限时任务|r
    .accept 853 >> 接任务：药剂师扎玛
    .target 药剂师赫布瑞姆
    .isQuestTurnedIn 848
    .isQuestAvailable 853

step
    #sticky
    #completewith ZamahTurnin
    +|cRXP_WARN_这是限时任务，请勿挂机。按路线预计会在接取后 20–30 分钟交付|r
    .isOnQuest 853

step << !Warlock !Shaman
    #completewith TribesTurnin
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 对话
    .fly Camp Taurajo >> 飞往陶拉祖营地
    .target 布拉高克
    .subzoneskip 392,1
    .dungeon WC

step << Shaman
    #completewith TribesTurnin
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 对话
    .fly Camp Taurajo >> 飞往陶拉祖营地
    .target 布拉高克
    .subzoneskip 380

step
    #xprate <2.1 << Warlock
    #completewith TribesTurnin
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Camp Taurajo >> 飞往陶拉祖营地
    .target 迪弗拉克
    .subzoneskip 380,1
    --Warlock Class Q section

step << Warlock
    #xprate >2.09
    #label EnterSTMWL
    #completewith KenZiglaWL
    .zone Stonetalon Mountains >> 前往石爪山脉
    .zoneskip Stonetalon Mountains

step << Warlock
    #xprate >2.09
    #completewith next
    .goto Stonetalon Mountains,82.57,98.63,60,0
    .goto Stonetalon Mountains,80.10,98.20,40,0
    .goto Stonetalon Mountains,77.17,98.61,40 >> 沿着左侧小路向上走

step << Warlock
    #xprate >2.09
    #label KenZiglaWL
    .goto Stonetalon Mountains,73.25,95.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯兹格拉|r 对话
    .turnin 1510 >>交任务：多格兰的消息
    .accept 1511 >>接任务：肯兹格拉的伤药
    .target 肯兹格拉

step << Warlock
    #xprate >2.09
    #completewith next
    .hs >>炉石回陶拉祖营地
    .subzoneskip 378
    .bindlocation 378,1
    .cooldown item,6948,>0
    .dungeon !WC

step << Warlock
    #xprate >2.09
    #completewith next
    .subzone 378 >>前往陶拉祖营地

step << Warlock
    #xprate >2.09
    .goto The Barrens,44.62,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_步兵劳格玛|r 对话
    .turnin 1511 >>交任务：肯兹格拉的伤药
    .accept 1515 >>接任务：多格兰之囚
    .target 步兵劳格玛

step
    .goto The Barrens,44.55,59.27
    >>击杀 |cRXP_ENEMY_刺背野猪人|r，并拾取 |T134128:0|t[|cRXP_LOOT_血岩碎片|r]
    .collect 5075,1,5052,1 --Blood Shard (1)
    .mob 刺背寻水者
    .mob 刺背织棘者
    .mob 刺背地卜师

step
    #label TribesTurnin
    .goto The Barrens,44.55,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_碎牙|r 对话
    .turnin 878 >>交任务：野猪人的内战
    .accept 5052 >>接任务：阿迦玛甘的血岩碎片
    .turnin 5052 >>交任务：阿迦玛甘的血岩碎片
    .target 碎牙
    .addquestitem 5075,5052

step
    #optional
    #completewith IshamuhaleTurnin
    .goto The Barrens,44.55,59.27,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_碎牙|r 对话
    +|cRXP_WARN_使用|r |T134128:0|t[|cRXP_LOOT_血岩碎片|r] |cRXP_WARN_兑换增益效果，至少留4个备用|r
    +|cRXP_WARN_务必关闭 Questie 或 Leatrix Plus 等插件的自动完成任务功能！|r
    .target 碎牙

step
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r 对话
    .turnin 882 >>交任务：伊沙姆哈尔
    .accept 907 >>接任务：被激怒的雷霆蜥蜴
    .turnin 883 >>交任务：拉克塔曼尼
    .target 乔恩·星眼
    .isOnQuest 883

step
    #label IshamuhaleTurnin
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r 对话
    .turnin 882 >>交任务：伊沙姆哈尔
    .accept 907 >>接任务：被激怒的雷霆蜥蜴
    .target 乔恩·星眼

step << Warlock
    #xprate >2.09
    .goto The Barrens,43.31,47.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_步兵多格兰|r 对话
    .turnin 1515 >>交任务：多格兰之囚
    .accept 1512 >>接任务：爱的礼物
    .target 步兵多格兰

step
    #completewith next
    .goto The Barrens,44.63,62.71,0
    .goto The Barrens,45.78,63.09,0
    .goto The Barrens,49.57,59.36,0
    .goto The Barrens,49.21,61.42,0
    .goto The Barrens,44.63,62.71,80,0
    .goto The Barrens,45.78,63.09,80,0
    .goto The Barrens,49.21,61.42,80,0
    .goto The Barrens,49.57,59.36,80,0
    >>击杀 |cRXP_ENEMY_奥瓦坦卡|r，并拾取 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]
    >>|cRXP_WARN_使用 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r] 接取任务|r
    >>|cRXP_WARN_它有4个刷新点（地图上已标记）|r
    .collect 5102,1,884,1 --Collect Owatanka's Tailspike
    .accept 884 >>接任务：奥瓦坦卡
    .use 5102
    .unitscan 奥瓦坦卡

step
    #loop
    .goto The Barrens,44.32,60.84,0
    .goto The Barrens,44.32,60.84,60,0
    .goto The Barrens,44.25,61.78,60,0
    .goto The Barrens,44.07,62.63,60,0
    .goto The Barrens,44.52,63.10,60,0
    .goto The Barrens,45.67,63.59,60,0
    .goto The Barrens,46.94,62.21,60,0
    .goto The Barrens,47.42,60.57,60,0
    .goto The Barrens,47.92,60.55,60,0
    .goto The Barrens,48.32,60.23,60,0
    .goto The Barrens,49.14,61.07,60,0
    .goto The Barrens,49.85,61.13,60,0
    .goto The Barrens,49.63,59.75,60,0
    .goto The Barrens,49.21,59.33,60,0
    .goto The Barrens,48.12,58.59,60,0
    >>击杀 |cRXP_ENEMY_雷霆蜥蜴|r，并拾取它们的 |cRXP_LOOT_血液|r
    .complete 907,1 --Thunder Lizard Blood (3)
    .mob 电角蜥蜴
    .mob 雷角蜥蜴

step
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r 对话
    .turnin 884 >>交任务：奥瓦坦卡
    .turnin 907 >>交任务：被激怒的雷霆蜥蜴
    .accept 913 >>接任务：雷鹰的嘶鸣
    .accept 6382 >>接任务：灰谷狩猎 << Hunter
    .target 乔恩·星眼
    .isOnQuest 884

step
    #label Thunderhawk
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r 对话
    .turnin 907 >>交任务：被激怒的雷霆蜥蜴
    .accept 913 >>接任务：雷鹰的嘶鸣
    .accept 6382 >>接任务：灰谷狩猎 << Hunter
    .target 乔恩·星眼

step << Shaman
    #completewith CallofWater2
    .goto The Barrens,44.63,62.71,0
    .goto The Barrens,45.78,63.09,0
    .goto The Barrens,49.57,59.36,0
    .goto The Barrens,49.21,61.42,0
    .goto The Barrens,44.63,62.71,80,0
    .goto The Barrens,45.78,63.09,80,0
    .goto The Barrens,49.21,61.42,80,0
    .goto The Barrens,49.57,59.36,80,0
    >>击杀 |cRXP_ENEMY_奥瓦坦卡|r，并拾取 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]
    >>|cRXP_WARN_使用 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r] 接取任务|r
    >>|cRXP_WARN_它有4个刷新点（地图上已标记）|r
    .collect 5102,1,884,1 --Collect Owatanka's Tailspike
    .accept 884 >>接任务：奥瓦坦卡
    .use 5102
    .unitscan 奥瓦坦卡

step << Shaman
    #completewith CallofWater2
    .goto The Barrens,43.42,77.41,60>> 向南前往 |cRXP_FRIENDLY_布瑞恩|r 处

step << Shaman
    #completewith next
    >>击杀一只 |cRXP_ENEMY_雷鹰|r，并拾取它的 |cRXP_LOOT_翅膀|r
    .complete 913,1 --Thunderhawk Wings (1)
    .mob 雷鹰雏鸟
    .mob 雷鹰破云者
    .mob 巨型雷鹰

step << Shaman
    #label CallofWater2
    .goto The Barrens,43.42,77.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑞恩|r 对话
    .turnin 1530 >>交任务：水之召唤
    .accept 1535 >>接任务：水之召唤
    .target 布瑞恩

step << Shaman
    .goto The Barrens,44.22,76.75
    .use 7766 >> |cRXP_WARN_装满|r |T132825:0|t[空的棕色水囊] |cRXP_WARN_，水坑位于布瑞恩小屋下方|r
    .complete 1535,1 --Filled Brown Waterskin (1)

step << Shaman
    .goto The Barrens,43.42,77.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布瑞恩|r 对话
    .turnin 1535 >>交任务：水之召唤
    .accept 1536 >>接任务：水之召唤
    .target 布瑞恩

step << Shaman
    #completewith ThunderhawkTurnin
    .subzone 378 >>返回陶拉祖营地

step << Shaman
    #completewith next
    .goto The Barrens,44.63,62.71,0
    .goto The Barrens,45.78,63.09,0
    .goto The Barrens,49.57,59.36,0
    .goto The Barrens,49.21,61.42,0
    .goto The Barrens,44.63,62.71,80,0
    .goto The Barrens,45.78,63.09,80,0
    .goto The Barrens,49.21,61.42,80,0
    .goto The Barrens,49.57,59.36,80,0
    >>击杀 |cRXP_ENEMY_奥瓦坦卡|r，并拾取 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]
    >>|cRXP_WARN_使用 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r] 接取任务|r
    >>|cRXP_WARN_它有4个刷新点（地图上已标记）|r
    .collect 5102,1,884,1 --Collect Owatanka's Tailspike
    .accept 884 >>接任务：奥瓦坦卡
    .use 5102
    .unitscan 奥瓦坦卡

step << Shaman
    #completewith next
    >>击杀 |cRXP_ENEMY_奥瓦坦卡|r，并拾取 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r]
    >>|cRXP_WARN_使用 |T133723:0|t[|cRXP_LOOT_奥瓦坦卡的尾刺|r] 接取任务|r
    >>|cRXP_WARN_它有4个刷新点（地图上已标记）|r
    >>|cRXP_WARN_如果现在找不到他，可以暂时跳过此步骤|r
    .collect 5102,1,884,1 --Collect Owatanka's Tailspike
    .accept 884 >>接任务：奥瓦坦卡
    .use 5102
    .unitscan 奥瓦坦卡

step
    #loop
    .goto The Barrens,44.83,63.12,0
    .goto The Barrens,44.83,63.12,60,0
    .goto The Barrens,46.57,61.33,60,0
    .goto The Barrens,48.99,58.69,60,0
    .goto The Barrens,45.45,56.69,60,0
    .goto The Barrens,43.41,56.96,60,0
    >>击杀一只 |cRXP_ENEMY_雷鹰雏鸟|r 或 |cRXP_ENEMY_雷鹰破云者|r，并拾取 |cRXP_LOOT_雷鹰的翅膀|r
    .complete 913,1 --Thunderhawk Wings (1)
    .mob 雷鹰雏鸟
    .mob 雷鹰破云者

step
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r 对话
    .turnin 884 >>交任务：奥瓦坦卡
    .turnin 913 >>交任务：雷鹰的嘶鸣
    .accept 874 >>接任务：玛伦·星眼
    .target 乔恩·星眼
    .isOnQuest 884

step
    #label ThunderhawkTurnin
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乔恩·星眼|r 对话
    .turnin 913 >>交任务：雷鹰的嘶鸣
    .accept 874 >>接任务：玛伦·星眼
    .target 乔恩·星眼

step << !Tauren
    .goto The Barrens,44.55,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_碎牙|r 对话
    .aura 16618 >> |cRXP_WARN_如果还剩10个|T134128:0|t[|cRXP_LOOT_血岩碎片|r]，就向|cRXP_FRIENDLY_碎牙|r换取|T136022:0|t[风之魂]。|r
    >>|cRXP_WARN_若已有雷霆崖飞行路径可跳过此步骤|r
    .itemcount 5075,10
    .target 碎牙

step << !Tauren
    #completewith next
    .goto Mulgore,68.68,60.34,120,0
    .zone Mulgore >>前往莫高雷

step << !Tauren
    #completewith DeathDUPpickup
    .goto Thunder Bluff,31.78,65.92
    .zone Thunder Bluff >>乘坐升降机进入雷霆崖
    >>|cRXP_WARN_若已有雷霆崖飞行路径, 直接飞往即可|r

step << Tauren
    #completewith DeathDUPpickup
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 对话
    .fly Thunder Bluff >>飞往雷霆崖
    .target 欧姆萨·雷角

step << Undead Warrior/Orc Warrior/Troll Warrior
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_安塞瓦|r
    .train 199 >>学习双手锤
    .train 227 >>学习法杖
    .target 安塞瓦

step << Troll Hunter/Orc Hunter/Undead Warrior/Warlock/Priest
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_安塞瓦|r
    .train 227 >>学习法杖
    .target 安塞瓦

step << Rogue
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_安塞瓦|r
    .train 198 >>学习锤类武器
    .target 安塞瓦

step << Rogue
    .goto Thunder Bluff,38.95,64.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_库鲁克|r |cRXP_BUY_对话，并向他购买|r |T135423:0|t[致命的飞斧] |cRXP_BUY_。|r
    .collect 3137,200,6544,1 --Deadly Throwing Axe (200)
    .target 库鲁克

step
    #completewith next
    .goto Thunder Bluff,28.14,32.97,40,0
    .goto Thunder Bluff,28.51,28.95,10 >> 前往灵魂高地并进入预见之池

step << Rogue/Shaman
    #sticky
    #completewith DeathDUPpickup
    .goto Thunder Bluff,28.55,25.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_克拉莉斯·弗斯特|r 对话
    .accept 264 >> 接任务：至死方休
    .target 克拉莉斯·弗斯特

step
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师扎玛|r 对话
    .turnin 853 >> 交任务：药剂师扎玛
    .accept 962 >> 接任务：毒蛇花
    .target 药剂师扎玛
    .isOnQuest 853
    .dungeon WC

step
    #optional
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师扎玛|r 对话
    .accept 962 >> 接任务：毒蛇花
    .target 药剂师扎玛
    .dungeon WC

step
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师扎玛|r 对话
    .turnin 853 >> 交任务：药剂师扎玛
    .target 药剂师扎玛
    .isOnQuest 853

step
    #optional
    #label ZamahTurnin

step << Priest
    .goto Thunder Bluff,25.31,15.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦尔斯·威尔什|r 对话
    --.accept 5644 >> Accept Devouring Plague << Undead Priest
    .accept 5642 >> 接任务：暗影守卫 << Troll Priest
    .trainer >> 学习职业技能
    .target 麦尔斯·威尔什

step << Mage
    #optional
    .goto Thunder Bluff,22.74,14.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大法师山姆|r 对话
    .train 12051 >> 学习职业技能
    .target 大法师山姆
    .xp <20,1
    .xp >22,1

step << Mage
    #optional
    .goto Thunder Bluff,22.74,14.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大法师山姆|r 对话
    .train 2138 >> 学习职业技能
    .target 大法师山姆
    .xp <22,1
    .xp >24,1

step << Mage
    .goto Thunder Bluff,22.74,14.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大法师山姆|r 对话
    .train 2121 >> 学习职业技能
    .target 大法师山姆
    .xp <24,1

step
    #optional
    #label DeathDUPpickup

step << Shaman
    #optional
    .goto Thunder Bluff,23.64,18.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_提戈尔·逐星|r 对话
    .train 2645 >> 学习职业技能
    .target 提戈尔·逐星
    .xp <20,1
    .xp >22,1

step << Shaman
    #optional
    .goto Thunder Bluff,23.64,18.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_提戈尔·逐星|r 对话
    .train 8498 >> 学习职业技能
    .target 提戈尔·逐星
    .xp <22,1
    .xp >24,1

step << Shaman
    #optional
    .goto Thunder Bluff,23.64,18.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_提戈尔·逐星|r 对话
    .train 8046 >> 学习职业技能
    .target 提戈尔·逐星
    .xp <24,1

step
    #xprate <2.1 << Warlock
    #completewith next
    .skill firstaid,80 >> |cRXP_WARN_制作|r |T133688:0|t[厚亚麻绷带] |cRXP_WARN_，直到急救技能达到80或更高|r
    .skill firstaid,<1,1

step
    #xprate <2.1 << Warlock
    #label FirstAid2
    .goto Thunder Bluff,29.68,21.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_潘德·缚石|r交谈
    >>|cRXP_WARN_如果没有足够的|r |T132889:0|t[亚麻布] |cRXP_WARN_将急救技能提升到80，请跳过此步骤|r
    .train 3277 >> 学习 |T133684:0|t[绒线绷带]
    .train 7934 >> 学习 |T134437:0|t[抗毒药剂] << Rogue
    .target 潘德·缚石
    .skill firstaid,<1,1

step << Rogue
    >>|cRXP_WARN_制作|r |T134437:0|t[抗毒药剂] |cRXP_WARN_，如果你找到过|r |T134339:0|t[小毒囊]
    >>|cRXP_WARN_留着备用|r
    .collect 6452,1 --Anti Venom
    .itemcount 1475,1

step
    #completewith next
    .goto Thunder Bluff,69.88,30.90,80 >> 前往长者高地

step
    .goto Thunder Bluff,78.61,28.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈缪尔·符文图腾|r 对话
    .turnin 1489 >> 交任务：哈缪尔·符文图腾
    .accept 1490 >> 接任务：纳拉·蛮鬃
    .target 大德鲁伊哈缪尔·符文图腾

step
    .goto Thunder Bluff,75.65,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳拉·蛮鬃|r 对话
    .turnin 1490 >> 交任务：纳拉·蛮鬃
    .accept 914 >> 接任务：尖牙德鲁伊
    .target 纳拉·蛮鬃
    .dungeon WC

step
    .goto Thunder Bluff,75.65,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳拉·蛮鬃|r 对话
    .turnin 1490 >> 交任务：纳拉·蛮鬃
    .target 纳拉·蛮鬃

step << Druid
    .goto Thunder Bluff,76.48,27.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_图拉克·符文图腾|r 对话
    .trainer >> 学习职业技能
    .target 图拉克·符文图腾

step
    #label SacredFlame
    .goto Thunder Bluff,54.96,51.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赞金·石蹄|r 对话
    .accept 1195 >> 接任务：神圣之火
    .target 赞金·石蹄

step << Hunter
    #completewith HunterTraining2
    .goto Thunder Bluff,61.31,78.25,60 >> 前往猎人高地

step << Hunter
    #optional
    .goto Thunder Bluff,59.13,86.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌瑞克·雷角|r 对话
    .train 5118 >> 学习职业技能
    .target 乌瑞克·雷角
    .xp <20,1
    .xp >22,1

step << Hunter
    #optional
    .goto Thunder Bluff,59.13,86.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌瑞克·雷角|r 对话
    .train 3043 >> 学习职业技能
    .target 乌瑞克·雷角
    .xp <22,1
    .xp >24,1

step << Hunter
    #label HunterTraining2
    #optional
    .goto Thunder Bluff,59.13,86.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌瑞克·雷角|r 对话
    .train 19885 >> 学习 |T132320:0|t[追踪隐藏生物]
    .target 乌瑞克·雷角
    .xp <24,1

step << Hunter
    .goto Thunder Bluff,54.07,84.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_赫苏瓦·雷角|r 对话
    .train 24494 >> 学习宠物技能
    .target 赫苏瓦·雷角

step << Warrior
    #completewith next
    .goto Thunder Bluff,61.31,78.25,60 >> 前往猎人高地

step << Warrior
    .goto Thunder Bluff,57.27,87.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托姆·狂暴图腾|r 对话
    .train 845 >> 学习职业技能
    .accept 1823 >>接任务：和鲁迦交谈
    .target 托姆·狂暴图腾

step << Rogue
    #season 0
    .goto Thunder Bluff,53.00,56.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_卡德·狂暴图腾|r |cRXP_BUY_对话，并从他那里购买|r |T135324:0|t[长剑] |cRXP_BUY_。|r
    .collect 923,1,493,1 --Collect Longsword (1)
    .money <0.8743
    .target 卡德·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1

step << Rogue
    #season 0
    #optional
    #completewith FlyOrgSR
    +|cRXP_WARN_装备|r |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
    .xp <21,1

step << Rogue
    #season 2
    .goto Thunder Bluff,53.00,56.63
    >> |Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_卡德|r|cRXP_BUY_交谈，并向他购买一到两把|r |T135342:0|t[波刃短剑] |cRXP_BUY_（向他购买）|r
    .collect 2209,1,493,1 --Collect Kris (1)
    .money <0.7115
    .target 卡德·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.9

step << Rogue
    #season 2
    #optional
    #completewith FlyOrgSR
    +|cRXP_WARN_装备|r |T135342:0|t[波刃短剑]
    .use 2209
    .itemcount 2209,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.9
    .xp <19,1

step << Warrior/Shaman
    #completewith next
    #ah
    +|cRXP_FRIENDLY_如果更便宜, 可从拍卖行购买绿色武器替代|r

step << Warrior
    .goto Thunder Bluff,53.21,58.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_伊图·狂暴图腾|r |cRXP_BUY_对话，并向他购买|r |T135157:0|t[占卜法杖] |cRXP_BUY_。|r
    .collect 928,1,493,1 --Collect Long Staff (1)
    .money <0.9860
    .target 伊图·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2

step << Warrior
    #optional
    #completewith ThunderBluffShoppingEnd
    +|cRXP_WARN_装备|r |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1

step << Shaman
    #season 0
    .goto Thunder Bluff,53.21,58.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_伊图·狂暴图腾|r |cRXP_BUY_对话，并向他购买|r |T135157:0|t[占卜法杖] |cRXP_BUY_。|r
    .collect 928,1,493,1 --Collect Long Staff (1)
    .money <0.9860
    .target 伊图·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2

step << Shaman
    #season 0
    #optional
    #completewith ThunderBluffShoppingEnd
    +|cRXP_WARN_装备|r |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1

step << Shaman
    #season 2
    .goto Thunder Bluff,53.21,58.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_伊图·狂暴图腾|r |cRXP_BUY_对话，并向他购买|r |T133476:0|t[尖刺流星锤] |cRXP_BUY_。|r
    .collect 925,1,493,1 --Collect Flail (1)
    .money <0.7797
    .target 伊图·狂暴图腾
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8

step << Shaman
    #season 2
    #optional
    #completewith ThunderBluffShoppingEnd
    +|cRXP_WARN_装备|r |T133476:0|t[尖刺流星锤]
    .use 925
    .itemcount 925,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
    .xp <20,1

step << Hunter
    .goto Thunder Bluff,46.98,45.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_库纳·雷角|r |cRXP_BUY_对话，并从她那里购买|r |T135489:0|t[重型弯弓] |cRXP_BUY_。|r
    .collect 3027,1,493,1 --Collect Heavy Recurve Bow (1)
    .money <0.5643
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.1
    .target 库纳·雷角

step << Hunter
    #optional
    #completewith ThunderBluffShoppingEnd
    +|cRXP_WARN_装备|r |T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.1
    .xp <20,1

step << Hunter
    .goto Thunder Bluff,46.98,45.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_库纳·雷角|r交谈
    >>|cRXP_BUY_向她购买|r |T132382:0|t[锋利的箭] |cRXP_BUY_。|r
    .collect 2515,1600,493,1 << Hunter --Sharp Arrow (1600)
    .target 库纳·雷角

step
    #optional
    #label ThunderBluffShoppingEnd

step
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将炉石设置在雷霆崖
    .target 旅店老板帕拉
    .bindlocation 1638
    .dungeon !WC

step
    #completewith next
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塔尔|r
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .zoneskip The Barrens
    .dungeon WC

step
    #sticky
    #completewith EnterWC
    .subzone 718 >> 现在应该开始寻找前往哀嚎洞穴的队伍
    >>寻找哀嚎洞穴队伍期间，击杀 |cRXP_ENEMY_野猪人|r
    .dungeon WC

step
    .goto The Barrens,46.15,36.93,100 >> 前往哀嚎洞穴
    .isOnQuest 914
    .dungeon WC

step
    #completewith next
    .goto The Barrens,46.95,35.18,0
    .goto The Barrens,46.95,35.18,30,0
    .goto The Barrens,46.83,34.74,20,0
    .goto Kalimdor,51.98,55.36,20,0
    .goto Kalimdor,51.89,55.55,10,0
    .goto Kalimdor,51.87,55.50,10 >>前往哀嚎洞穴集合石旁的山上
    >>|cRXP_WARN_仔细跟随箭头前往隐藏洞穴|r
    .dungeon WC

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳尔帕克|r 和 |cRXP_FRIENDLY_厄布鲁|r 对话
    >>|cRXP_WARN_他们位于哀嚎洞穴入口上方|r
    .accept 1486 >> 接任务：变异皮革
    .target +纳尔帕克
    .goto Kalimdor,51.91,55.42
    .accept 1487 >> 接任务：清除变异者
    .target +厄布鲁
    .goto Kalimdor,51.92,55.44
    .dungeon WC

step
    #optional
    #hardcore
    #completewith EnterWC
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_建议最多3名玩家尝试完成此任务（如果只打1次）；没有足够的|r |cRXP_PICK_毒蛇花|r |cRXP_WARN_供所有人使用|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_以便在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #hardcore
    #completewith EnterWC
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_建议最多3名玩家尝试完成此任务（如果只打1次）；没有足够的|r |cRXP_PICK_毒蛇花|r |cRXP_WARN_供所有人使用|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    #completewith EnterWC
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_以便在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #softcore
    #completewith EnterWC
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #hardcore
    #completewith EnterWC
    >>击杀沿途看到的 |cRXP_ENEMY_变异野兽|r，并拾取它们的 |cRXP_LOOT_兽皮|r
    >>|cRXP_WARN_建议最多3名玩家尝试完成此任务（如果只打1次）；没有足够的|r |cRXP_LOOT_兽皮|r |cRXP_WARN_供所有人使用|r
    .complete 1486,1 --Deviate Hide (20)
    .dungeon WC
    .isOnQuest 1486
    --Too many .mobs, would clutter target box

step
    #softcore
    #completewith EnterWC
    >>击杀沿途看到的 |cRXP_ENEMY_变异野兽|r，并拾取它们的 |cRXP_LOOT_兽皮|r
    .complete 1486,1 --Deviate Hide (20)
    .dungeon WC
    .isOnQuest 1486
    --Too many .mobs, would clutter target box

step
    #completewith EnterWC
    >>击杀 |cRXP_ENEMY_软浆怪|r，并拾取它们的 |cRXP_LOOT_哀嚎香精|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC

step
    #label MadMagg
    #loop
    .goto Kalimdor,51.97,55.23,0
    .goto Kalimdor,51.82,54.86,0
    .goto Kalimdor,52.01,55.02,0
    .goto Kalimdor,52.15,55.15,0
    .goto Kalimdor,51.97,55.23,30,0
    .goto Kalimdor,51.82,54.86,30,0
    .goto Kalimdor,52.01,55.02,30,0
    .goto Kalimdor,52.15,55.15,30,0
    >>击杀 |cRXP_ENEMY_疯狂的马格利什|r，并拾取他的 |cRXP_LOOT_99年波尔多陈酿|r
    >>|cRXP_WARN_他的刷新时间较长。如果找不到他，请跳过此步骤|r
    .complete 959,1 --99-Year-Old Port (1)
    .mob 疯狂的马格利什
    .isOnQuest 959
    .dungeon WC

step
    #label EnterWC
    .goto Kalimdor,51.89,54.77,20,0
    .goto Kalimdor,51.95,54.56,20,0
    .goto Kalimdor,52.27,54.65,30,0
    .goto Kalimdor,52.40,55.20,30 >> 进入哀嚎洞穴副本传送门，然后进入副本
    .dungeon WC

step
    #optional
    #hardcore
    #completewith GlowingShard
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_建议最多3名玩家尝试完成此任务（如果只打1次）；没有足够的|r |cRXP_PICK_毒蛇花|r |cRXP_WARN_供所有人使用|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_以便在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #hardcore
    #completewith GlowingShard
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_建议最多3名玩家尝试完成此任务（如果只打1次）；没有足够的|r |cRXP_PICK_毒蛇花|r |cRXP_WARN_供所有人使用|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    #completewith GlowingShard
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_以便在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    #completewith GlowingShard
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #hardcore
    #completewith GlowingShard
    >>击杀 |cRXP_ENEMY_软浆怪|r，并拾取它们的 |cRXP_LOOT_哀嚎香精|r
    >>|cRXP_WARN_建议最多3名玩家尝试完成此任务（如果只打1次）；没有足够的|r |cRXP_LOOT_哀嚎香精|r |cRXP_WARN_供所有人使用|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC

step
    #optional
    #softcore
    #completewith GlowingShard
    >>击杀 |cRXP_ENEMY_软浆怪|r，并拾取它们的 |cRXP_LOOT_哀嚎香精|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC

step
    #completewith GlowingShard
    >>击杀 |cRXP_ENEMY_变异破坏者|r、|cRXP_ENEMY_剧毒飞蛇|r、|cRXP_ENEMY_变异蹒跚者|r 和 |cRXP_ENEMY_变异尖牙风蛇|r
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
    .dungeon WC

step
    #label Gems
    >>击杀 |cRXP_ENEMY_考布莱恩|r、|cRXP_ENEMY_安娜科德拉|r、|cRXP_ENEMY_皮萨斯|r 和 |cRXP_ENEMY_瑟芬迪斯|r，并拾取他们掉落的 |cRXP_LOOT_宝石|r
    .complete 914,1 --Gem of Cobrahn (1)
    .mob +考布莱恩
    .complete 914,2 --Gem of Anacondra (1)
    .mob +安娜科德拉
    .complete 914,3 --Gem of Pythas (1)
    .mob +皮萨斯
    .complete 914,4 --Gem of Serpentis (1)
    .mob +瑟芬迪斯
    .isOnQuest 914
    .dungeon WC

step
    #requires Gems
    #completewith next
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与哀嚎洞穴入口处的 |cRXP_FRIENDLY_纳拉雷克斯的信徒|r 对话，并将他安全护送至 |cRXP_FRIENDLY_纳拉雷克斯|r 处
    .target 纳拉雷克斯的信徒
    .skipgossip
    .dungeon WC

step
    #label GlowingShard
    >>到达|cRXP_FRIENDLY_纳拉雷克斯|r处后，你会遭到两波敌人袭击，最后出现|cRXP_ENEMY_吞噬者穆坦努斯|r
    >>击杀他并拾取 |T135229:0|t[|cRXP_LOOT_发光的碎片|r]，使用它接取任务
    .collect 10441,1 --Collect Glowing Shard (x1)
    .accept 6981 >> 接任务：发光的碎片
    .use 10441
    .mob 吞噬者穆坦努斯
    .dungeon WC

step
    #optional
    #completewith DeviateRaptors
    >>击杀 |cRXP_ENEMY_软浆怪|r，并拾取它们的 |cRXP_LOOT_哀嚎香精|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC

step
    #optional
    #hardcore
    #completewith Ectoplasms
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_建议最多3名玩家尝试完成此任务（如果只打1次）；没有足够的|r |cRXP_PICK_毒蛇花|r |cRXP_WARN_供所有人使用|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_以便在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #hardcore
    #completewith Ectoplasms
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_建议最多3名玩家尝试完成此任务（如果只打1次）；没有足够的|r |cRXP_PICK_毒蛇花|r |cRXP_WARN_供所有人使用|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    #completewith Ectoplasms
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_以便在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    #completewith Ectoplasms
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

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
    .dungeon WC

step
    >>击杀 |cRXP_ENEMY_变异破坏者|r、|cRXP_ENEMY_剧毒飞蛇|r、|cRXP_ENEMY_变异蹒跚者|r 和 |cRXP_ENEMY_变异尖牙风蛇|r
    .complete 1487,1 --Deviate Ravager (7)
    .mob +变异破坏者
    .complete 1487,2 --Deviate Viper (7)
    .mob +剧毒飞蛇
    .complete 1487,3 --Deviate Shambler (7)
    .mob +变异蹒跚者
    .complete 1487,4 --Deviate Dreadfang (7)
    .mob +变异尖牙风蛇
    .isOnQuest 1487
    .dungeon WC

step
    #label DeviateRaptors
    >>击杀|cRXP_ENEMY_变异野兽|r，并拾取它们的|cRXP_LOOT_兽皮|r
    .complete 1486,1 --Deviate Hide (20)
    .mob 变异破坏者
    .mob 剧毒飞蛇
    .mob 变异蹒跚者
    .mob 变异尖牙风蛇
    .isOnQuest 1486
    .dungeon WC

step
    #label Ectoplasms
    >>击杀 |cRXP_ENEMY_软浆怪|r，并拾取它们的 |cRXP_LOOT_哀嚎香精|r
    .complete 1491,1 --Wailing Essence (6)
    .mob 吞噬软浆怪
    .mob 大型软浆怪
    .mob 噩梦软浆怪
    .isOnQuest 1491
    .dungeon WC

step
    #optional
    #hardcore
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_建议最多3名玩家尝试完成此任务（如果只打1次）；没有足够的|r |cRXP_PICK_毒蛇花|r |cRXP_WARN_供所有人使用|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_以便在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #hardcore
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_建议最多3名玩家尝试完成此任务（如果只打1次）；没有足够的|r |cRXP_PICK_毒蛇花|r |cRXP_WARN_供所有人使用|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    >>|cRXP_WARN_施放|r |T133939:0|t[寻找草药] |cRXP_WARN_以便在小地图上显示草药位置|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,<1,1
    .isOnQuest 962
    .dungeon WC

step
    #optional
    #softcore
    >>拾取地面的 |cRXP_PICK_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .skill herbalism,1,1
    .isOnQuest 962
    .dungeon WC

step
    #completewith GShard
    .hs >> 炉石返回棘齿城
    .use 6948
    .dungeon WC

step
    .goto The Barrens,62.37,37.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦伯克·米希瑞克斯|r 对话
    .turnin 1491 >>交任务：智慧饮料
    .target 麦伯克·米希瑞克斯
    .isQuestComplete 1491
    .dungeon WC

step
    .goto The Barrens,63.09,37.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比戈弗兹|r交谈
    .turnin 959 >> 交任务：港口的麻烦
    .target 起重机操作员比戈弗兹
    .isQuestComplete 959
    .dungeon WC

step
    #label GShard
    .goto The Barrens,62.99,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯布特瓦夫|r 对话
    .complete 6981,1 --Speak with someone in Ratchet about the Glowing Shard
    .skipgossip
    .target 斯布特瓦夫
    .isOnQuest 6981
    .dungeon WC

step
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_布拉高克|r 对话
    .fly Crossroads >> 飞往十字路口
    .target 布拉高克
    .isOnQuest 6981
    .dungeon WC

step
    #completewith next
    .goto The Barrens,50.49,34.36,20,0
    .goto The Barrens,49.61,34.54,20,0
    .goto The Barrens,49.14,34.02,20,0
    .goto The Barrens,48.18,32.78,50 >> 沿山路向上前进
    .dungeon WC

step
    .goto The Barrens,48.18,32.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲拉·古风|r 对话
    .turnin 6981 >> 交任务：发光的碎片
    .accept 3369 >> 接任务：在噩梦中
    .target 菲拉·古风
    .isOnQuest 6981
    .dungeon WC

step
    .goto The Barrens,48.18,32.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_菲拉·古风|r 对话
    .accept 3369 >> 接任务：在噩梦中
    .target 菲拉·古风
    .isQuestTurnedIn 6981
    .dungeon WC

step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳尔帕克|r 和 |cRXP_FRIENDLY_厄布鲁|r 对话
    >>|cRXP_WARN_他们位于哀嚎洞穴入口上方|r
    .turnin 1486 >> 交任务：变异皮革
    .target +纳尔帕克
    .goto Kalimdor,51.91,55.42
    .turnin 1487 >> 交任务：清除变异者
    .target +厄布鲁
    .goto Kalimdor,51.92,55.44
    .isQuestComplete 1487
    .isQuestComplete 1486
    .dungeon WC

step
    .goto Kalimdor,51.92,55.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_厄布鲁|r 对话
    >>|cRXP_WARN_他位于哀嚎洞穴入口上方|r
    .turnin 1487 >> 交任务：清除变异者
    .target 厄布鲁
    .isQuestComplete 1487
    .dungeon WC

step
    .goto Kalimdor,51.91,55.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳尔帕克|r 对话
    >>|cRXP_WARN_他位于哀嚎洞穴入口上方|r
    .turnin 1486 >> 交任务：变异皮革
    .target 纳尔帕克
    .isQuestComplete 1486
    .dungeon WC

step
    #completewith WCEnd
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Thunder Bluff >>飞往雷霆崖
    .target 迪弗拉克
    .zoneskip Thunder Bluff
    .dungeon WC

step << skip
    #completewith next
    .goto The Barrens,44.45,59.16,100 >> 向南前往陶拉祖营地
    .subzoneskip 378
    .dungeon WC

step << skip
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 对话
    .fly Thunder Bluff >>飞往雷霆崖
    .target 欧姆萨·雷角
    .dungeon WC

step
    .goto Thunder Bluff,75.65,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳拉·蛮鬃|r 对话
    .turnin 914 >>交任务：尖牙德鲁伊
    .target 纳拉·蛮鬃
    .isQuestComplete 914
    .dungeon WC

step
    .goto Thunder Bluff,78.61,28.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈缪尔·符文图腾|r 对话
    .turnin 3369 >> 交任务：在噩梦中
    .target 大德鲁伊哈缪尔·符文图腾
    .isOnQuest 3369
    .dungeon WC

step
    #completewith next
    .goto Thunder Bluff,28.51,28.95,10 >> 前往灵魂高地并进入预见之池
    .isQuestComplete 962
    .dungeon WC

step
    #label WCEnd
    .goto Thunder Bluff,23.0,21.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师扎玛|r 对话
    .turnin 962 >>交任务：毒蛇花
    .target 药剂师扎玛
    .isQuestComplete 962
    .dungeon WC

step
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将炉石设置在雷霆崖
    .target 旅店老板帕拉
    .bindlocation 1638
    .dungeon WC

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

step
    #xprate <2.1
    #completewith Serena
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塔尔|r
    .fly Crossroads >>飞往十字路口
    .target 塔尔
    .subzoneskip 380

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 852 >>交任务：赫兹鲁尔·血印
    .target 雷戈萨·死门
    .isQuestComplete 852

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #xprate <2.1
    #completewith CounterattackTurnin2
    +|cRXP_WARN_接下来的任务非常难，建议组队。可以利用任务给予者所在的建筑绕圈风筝督军克罗姆扎|r

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 4021 >>接任务：人马无双！
    .target 雷戈萨·死门
    --.timer 183,Warlord Krom'zar Spawn
    .isQuestTurnedIn 852
    --timer is random, generally somewhere between 120-210 seconds

step
    #xprate <2.1
    .goto The Barrens,44.48,28.15
    >>督军克罗姆扎出现后，击杀 |cRXP_ENEMY_督军克罗姆扎|r，并拾取他掉在地上的 |cRXP_PICK_旗帜|r
    >>|cRXP_WARN_小心！他是强力精英，身边至少有两名|r |cRXP_ENEMY_科卡尔|r |cRXP_WARN_敌人|r
    >>|cRXP_WARN_他最多可能需要3分钟才会刷新|r
    .complete 4021,1 --Piece of Krom'zar's Banner (1)
    .unitscan 督军克罗姆扎
    .isQuestTurnedIn 852

step
    #xprate <2.1
    #label CounterattackTurnin2
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 4021 >>交任务：人马无双！
    .target 雷戈萨·死门
    .isQuestComplete 4021

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 855 >>交任务：半人马护腕
    .target 雷戈萨·死门
    .isQuestComplete 855

step
    #xprate <2.1
    #optional
    #completewith Serena
    .abandon 855 >>放弃任务：半人马护腕

step
    #xprate <2.1
    #label Serena
    .goto The Barrens,39.16,12.16
    >>击杀 |cRXP_ENEMY_塞瑞娜·血羽|r，并拾取她的 |cRXP_LOOT_头颅|r
    .complete 876,1 --Serena's Head (1)
    .mob 塞瑞娜·血羽
    .isQuestTurnedIn 875

step << Hunter
    #xprate <2.1
    .goto The Barrens,49.05,11.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维妮·布特巴克|r 对话
    .turnin 3921 >> 交任务：维妮·布特巴克
    .target 维妮·布特巴克
    .isOnQuest 3921

step << Hunter
    #xprate <2.1
    .goto The Barrens,48.12,5.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德拉克|r 对话
    .turnin 6541 >> 交任务：向卡德拉克报到
    .target 卡德拉克

step << Hunter
    #xprate <2.1
    .goto Ashenvale,68.34,75.30
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托雷克|r 对话以开始护送任务
    >>|cRXP_FRIENDLY_托雷克|r |cRXP_WARN_的刷新时间为5分钟|r
    .accept 6544 >> 接任务：托雷克的突袭
    .target 托雷克

step << Hunter
    #xprate <2.1
    .goto Ashenvale,66.08,74.50,60,0
    .goto Ashenvale,65.07,75.36,20,0
    .goto Ashenvale,64.28,75.33,10,0
    .goto Ashenvale,64.81,75.34
    >>跟随|cRXP_FRIENDLY_托雷克|r
    >>让 |cRXP_FRIENDLY_托雷克|r 和他的 |cRXP_FRIENDLY_碎木掠夺者|r 承受 |cRXP_ENEMY_银翼战士|r 与 |cRXP_ENEMY_银翼哨兵|r 的攻击
    >>|cRXP_WARN_清理建筑后跑向阳台。|cRXP_ENEMY_杜瑞尔·月火|r出现时，让|cRXP_FRIENDLY_托雷克|r和他的|cRXP_FRIENDLY_碎木掠夺者|r先建立仇恨，再开始造成伤害|r
    .complete 6544,1 --Take Silverwing Outpost
    .mob 银翼战士
    .mob 银翼哨兵
    .unitscan 杜瑞尔·月火

step << Hunter
    #xprate <2.1
    .goto Ashenvale,73.04,62.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_埃尔托格·怒齿|r 对话
    .turnin 6544 >> 交任务：托雷克的突袭
    .target 埃尔托格·怒齿
    .isQuestComplete 6544

step << Hunter
    #xprate <2.1
    .goto Ashenvale,73.78,61.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塞娜尼·雷心|r 对话
    .turnin 6382 >> 交任务：灰谷狩猎
    .turnin 6383 >> 交任务：灰谷狩猎
    .target 塞娜尼·雷心

step << Hunter
    #xprate <2.1
    .goto Ashenvale,73.18,61.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔格拉|r 对话
    .fp Splintertree Post >> 获取碎木岗哨的飞行点
    .target 乌尔格拉

step << Hunter
    #xprate <2.1
    #completewith EnterSTM2
    .goto Ashenvale,73.18,61.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_乌尔格拉|r 对话
    .fly Crossroads >> 飞往十字路口
    .target 乌尔格拉
    .zoneskip The Barrens

step << !Hunter
    #xprate <2.1
    #softcore
    #completewith next
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活

step << !Hunter
    #xprate <2.1
    #hardcore
    #completewith next
    .subzone 380 >>前往十字路口

step
    #xprate <2.1
    .goto The Barrens,51.62,30.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    .turnin 876 >> 交任务：塞瑞娜·血羽
    .accept 1060 >> 接任务：写给金吉尔的信
    .target 达索克·快刀
    .isQuestComplete 876

step
    #xprate <2.1
    #optional
    .goto The Barrens,51.62,30.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_达索克·快刀|r 对话
    .accept 1060 >> 接任务：写给金吉尔的信
    .target 达索克·快刀
    .isQuestTurnedIn 876

step
    .goto The Barrens,51.10,29.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_科兰|r 对话
    .accept 868 >> 接任务：蝎卵
    .target 科兰

step
    #xprate <2.1
    #completewith CounterattackTurnin3
    +|cRXP_WARN_接下来的任务非常难，建议组队。可以利用任务给予者所在的建筑绕圈风筝督军克罗姆扎|r

step
    #xprate <2.1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .accept 4021 >>接任务：人马无双！
    .target 雷戈萨·死门
    --.timer 183,Warlord Krom'zar Spawn
    .isQuestTurnedIn 852
    --timer is random, generally somewhere between 120-210 seconds

step
    #xprate <2.1
    .goto The Barrens,44.48,28.15
    >>督军克罗姆扎出现后，击杀 |cRXP_ENEMY_督军克罗姆扎|r，并拾取他掉在地上的 |cRXP_PICK_旗帜|r
    >>|cRXP_WARN_小心！他是强力精英，身边至少有两名|r |cRXP_ENEMY_科卡尔|r |cRXP_WARN_敌人|r
    >>|cRXP_WARN_他最多可能需要3分钟才会刷新|r
    .complete 4021,1 --Piece of Krom'zar's Banner (1)
    .unitscan 督军克罗姆扎
    .isQuestTurnedIn 852

step
    #xprate <2.1
    #label CounterattackTurnin3
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷戈萨·死门|r 对话
    .turnin 4021 >>交任务：人马无双！
    .target 雷戈萨·死门
    .isQuestComplete 4021

step
    #xprate <2.1
    #label EnterSTM2
    #completewith STMturnins1
    .zone Stonetalon Mountains >> 前往石爪山脉
    .zoneskip Stonetalon Mountains

step
    #xprate <2.1
    #label STMturnins1
    #map Stonetalon Mountains
    .goto The Barrens,35.26,27.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_希雷斯·碎石|r 对话
    .turnin 1062 >>交任务：地精侵略者
    .timer 4,地精侵略者剧情
    .accept 1063 >>接任务：长者
    --.accept 1068 >> Accept Shredding Machines
    .target 希雷斯·碎石

step
    #xprate <2.1
    #completewith next
    .goto Stonetalon Mountains,82.57,98.63,60,0
    .goto Stonetalon Mountains,80.10,98.20,40,0
    .goto Stonetalon Mountains,77.17,98.61,40 >> 沿着左侧小路向上走

step
    #xprate <2.1
    .goto Stonetalon Mountains,74.54,97.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_巫医金吉尔|r 对话
    .turnin 1060 >> 交任务：写给金吉尔的信
    --.accept 1058 >> Accept Jin'Zils Forest Magic
    .target 巫医金吉尔
    .isQuestTurnedIn 876

step << Warlock
    #xprate <2.1
    .goto Stonetalon Mountains,73.25,95.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_肯兹格拉|r 对话
    .turnin 1510 >>交任务：多格兰的消息
    .accept 1511 >>接任务：肯兹格拉的伤药
    .target 肯兹格拉

step
    #xprate <2.1
    .goto Stonetalon Mountains,71.25,95.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_辛吉拉|r 对话
    .turnin 6461 >>交任务：盗窃的蜘蛛
    .target 辛吉拉

step << skip
    #xprate <2.1
    .goto Stonetalon Mountains,74.69,98.10
    .goto Thunder Bluff,56.65,18.96,30 >>|cRXP_WARN_跳上其中一个笼子，然后退出并重新登录以使用登出跳过技巧|r
    .link https://www.youtube.com/watch?v=cp2YI86AO4Y&ab >> |cRXP_WARN_点击这里查看示例|r

step << skip
    #xprate <2.1 << !Warlock
    #completewith ElderCroneTurnin
    .goto Thunder Bluff,54.18,27.01,20,0
    .goto Thunder Bluff,50.75,37.07,40 >> 乘坐升降机进入雷霆崖

step
    #xprate <2.1
    #completewith ElderCroneTurnin
    .cooldown item,6948,>0
    .hs >>炉石回雷霆崖
    .bindlocation 1638,1
    .zoneskip Thunder Bluff
    .use 6948

step
    #xprate <2.1
    #completewith ElderCroneTurnin
    .goto Stonetalon Mountains,45.13,59.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔姆|r交谈
    .fly Thunder Bluff >>飞往雷霆崖
    .target 萨尔姆
    .zoneskip Thunder Bluff
    .cooldown item,6948,<0

step
    #xprate <2.1
    #completewith next
    .goto Thunder Bluff,69.88,30.90,80 >> 前往长者高地

step
    #xprate <2.1
    #label ElderCroneTurnin
    .goto Thunder Bluff,69.88,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_玛加萨·野性图腾|r 对话
    >>|cRXP_WARN_等待剧情结束|r
    .turnin 1063 >> 交任务：长者
    .timer 6,长者剧情
    .accept 1064 >> 接任务：被遗忘者的援助
    .target 玛加萨·野性图腾

step
    #xprate <2.1
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_药剂师扎玛|r 对话
    .turnin 1064 >> 交任务：被遗忘者的援助
    .accept 1065 >> 接任务：塔伦米尔之旅 << Rogue/Shaman
    .target 药剂师扎玛

step << !Shaman !Rogue
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塔尔|r
    .fly Camp Taurajo >>飞往陶拉祖营地
    .target 塔尔
    .subzoneskip 378

step << Warlock
    #xprate <2.1
    .goto The Barrens,44.62,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_步兵劳格玛|r 对话
    .turnin 1511 >>交任务：肯兹格拉的伤药
    .accept 1515 >>接任务：多格兰之囚
    .target 步兵劳格玛

step << Warlock
    #xprate <2.1
    .goto The Barrens,43.31,47.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_步兵多格兰|r 对话
    .turnin 1515 >>交任务：多格兰之囚
    .accept 1512 >>接任务：爱的礼物
    .target 步兵多格兰

step << Shaman/Rogue
    #label FlyOrgSR
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_塔尔|r
    .fly Orgrimmar >>飞往奥格瑞玛
    .target 塔尔
    .zoneskip Thunder Bluff,1

step << Shaman
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_欧姆萨·雷角|r 对话
    .fly Orgrimmar >>飞往奥格瑞玛
    .target 欧姆萨·雷角
    .zoneskip The Barrens,1

step << Shaman
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 对话
    .train 8498 >> 学习职业技能
    .target 卡德里斯
    .xp <22,1
    .xp >24,1

step << Shaman
    #optional
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_卡德里斯|r 对话
    .train 905 >> 学习职业技能
    .target 卡德里斯
    .xp <24,1

step << Rogue
    #completewith next
    .goto Orgrimmar,45.64,55.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_卡雷斯|r |cRXP_BUY_对话；如果你没有匕首，可以向他购买|r |T135640:0|t[双刃弯刀] |cRXP_BUY_。|r
    .collect 2207,1 --Collect Jambiya (1)
    .target 卡雷斯

step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_申苏尔|r 对话
    .train 921 >> 学习 |T133644:0|t[搜索]
    .train 8676 >> 学习 |T132282:0|t[伏击]
    .train 1943 >> 学习 |T132302:0|t[割裂]
    .train 1856 >> 学习 |T132331:0|t[消失]
    .train 1725 >> 学习 |T132289:0|t[扰乱]
    .train 1785 >> 学习 |T132320:0|t[潜行（等级 2）]
    .accept 2460 >>接任务：碎手军礼
    .target 申苏尔

step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|cRXP_FRIENDLY_申苏尔|r 行完军礼后，选中他并输入 /Salute
    .complete 2460,1 --Shattered Salute Performed (1)
    .target 申苏尔

step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_申苏尔|r 对话
    .turnin 2460 >>交任务：碎手军礼
    .accept 2458 >>接任务：卧底密探
    .target 申苏尔

step << Rogue
    .goto Orgrimmar,42.10,49.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_雷库尔|r |cRXP_BUY_对话，并向他购买|r |T133849:0|t[蚀骨灰]|cRXP_BUY_、|r |T132793:0|t[空瓶]|cRXP_BUY_和|r |T134387:0|t[闪光粉] |cRXP_BUY_。|r
    .collect 2928,40,2479,1 --Collect Dust of Decay (40)
    .collect 3371,40,2479,1 --Collect Empty Vial (40)
    .collect 5140,20,2479,1 --Collect Flash Powder (20)
    .target 雷库尔

step << Rogue
    #completewith MissionProbable
    .goto Orgrimmar,26.22,61.58,80,0
    .goto Orgrimmar,15.66,63.33,30,0
    .goto Orgrimmar,18.03,60.51,50 >> 从西侧出口进入贫瘠之地
    .zoneskip The Barrens

step << Rogue
    #completewith MissionProbable
    .goto The Barrens,57.63,7.48,120 >> 前往淤泥沼泽

step << Rogue
    #completewith next
    .goto The Barrens,55.70,5.89
    +选中 |cRXP_FRIENDLY_工头费苏勒|r，然后使用 |T134536:0|t[信号枪]两次并输入 /Salute
    >>|cRXP_WARN_小心！在他变为友好之前不要靠近，否则他会攻击你|r
    .use 8051
    .target 工头费苏勒

step << Rogue
    #label MissionProbable
    .goto The Barrens,55.44,5.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_工头费苏勒|r交谈
    .turnin 2458 >>交任务：卧底密探
    .accept 2478 >>接任务：基本不可能的任务
    .target 工头费苏勒

step << Rogue
    .goto The Barrens,54.80,5.97
    >>使用 |T133644:0|t[搜索]，从|cRXP_ENEMY_工头希里克斯|r身上偷取|cRXP_LOOT_塔楼钥匙|r
    .complete 2478,5 --Silixiz's Tower Key (1)
    .mob 工头希里克斯

step << Rogue
    #completewith roguetowerq
    +|cRXP_WARN_这里的每种敌人都会受到特定技能的额外伤害|r
    >>使用 |T132282:0|t[伏击] 攻击|cRXP_ENEMY_变异风险投资公司工人|r
    >>使用 |T132302:0|t[割裂] 攻击|cRXP_ENEMY_风险投资公司巡逻员|r
    >>使用 |T132292:0|t[刺骨] 攻击|cRXP_ENEMY_风险投资公司看守|r一次（1个连击点）

step << Rogue
    #label roguetowerq
    .goto The Barrens,54.72,5.74
    >>进入盗贼塔，击杀 |cRXP_ENEMY_变异风险投资公司工人|r、|cRXP_ENEMY_风险投资公司巡逻员|r 和 |cRXP_ENEMY_风险投资公司看守|r
    .complete 2478,1 --Mutated Venture Co. Drone (2)
    .mob +变异风险投资公司工人
    .complete 2478,3 --Venture Co. Patroller (2)
    .mob +风险投资公司巡逻员
    .complete 2478,2 --Venture Co. Lookout (2)
    .mob +风险投资公司看守

step << Rogue
    .goto The Barrens,54.77,5.57
    >>在塔顶找到 |cRXP_ENEMY_加里维克斯|r，并拾取他的 |cRXP_LOOT_头颅|r
    >>|cRXP_WARN_使用|r |T132282:0|t[伏击] |cRXP_WARN_将他的生命值降至一半。使用|r |T132155:0|t[凿击] |cRXP_WARN_恢复能量，再使用|r |T136205:0|t[闪避]
    >>|cRXP_WARN_必要时记得使用药水和|r |T132819:0|t[菊花茶]
    .complete 2478,4 --Gallywix's Head (1)
    .mob 大工头普兹克·加里维克斯
    --VV Video?

step << Rogue
    .goto The Barrens,54.77,5.57
    >>使用开锁技能打开 |cRXP_PICK_加里维克斯的保险箱|r，并拾取 |cRXP_LOOT_混合物|r
    .complete 2478,6 --Cache of Zanzil's Altered Mixture (1)

step << skip --Rogue/Druid
    #hardcore
    #completewith next
    .goto The Barrens,61.33,4.21,120 >>前往石矿洞

step << skip --Rogue
    #hardcore
    .goto The Barrens,60.48,3.76
    .goto Orgrimmar,40.05,68.05,30 >>|cRXP_WARN_跳上木梁，然后退出并重新登录以使用登出跳过技巧。如果失败，就跑回奥格瑞玛|r
    .link https://www.youtube.com/watch?v=U7YfoaO-X8E&ab_channel=RestedXP >> |cRXP_WARN_点击这里查看示例|r
    .zoneskip Orgrimmar

step << Rogue
    #softcore
    #completewith next
    .deathskip >> 死亡后在 |cRXP_FRIENDLY_灵魂医者|r 处复活

step << Rogue
    #softcore
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_迪弗拉克|r 对话
    .fly Orgrimmar >> 飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target 迪弗拉克

step << Rogue
    #hardcore
    .goto Kalimdor,56.81,45.47
    .zone Orgrimmar >>从西侧入口进入奥格瑞玛
    .isQuestComplete 2478

step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_申苏尔|r 对话
    .turnin 2478 >>交任务：基本不可能的任务
    .accept 2479 >>接任务：希诺特的帮助
    .target 申苏尔

step << Rogue
    .goto Orgrimmar,42.10,49.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与 |cRXP_FRIENDLY_雷库尔|r |cRXP_BUY_对话，并向他购买|r |T133849:0|t[蚀骨灰] |cRXP_BUY_和|r |T132793:0|t[空瓶] |cRXP_BUY_。|r
    .collect 2928,20,2479,1 --Collect Dust of Decay (20)
    .collect 3371,20,2479,1 --Collect Empty Vial (20)
    .target 雷库尔

step << Rogue
    >>|cRXP_WARN_如果你有|r |T134437:0|t[抗毒药剂] |cRXP_WARN_，就使用一瓶解除|r |T136230:0|t[赞吉尔之触]
    .itemcount 6452,1
    .use 6452
    .aura -9991

step << Rogue
    .destroy 8051 >> |cRXP_WARN_摧毁背包中的|r |T134536:0|t[信号枪] |cRXP_WARN_，这件物品已不再需要|r
    .destroy 8066 >> |cRXP_WARN_摧毁背包中的|r |T134374:0|t[费苏勒的哨子] |cRXP_WARN_，这件物品已不再需要|r

step
    #optional
    .abandon 6421 >>放弃任务：滚岩峡谷

step
    #optional
    .abandon 4021 >>放弃任务：人马无双！

step
    #optional
    .abandon 6481 >>放弃任务：土灵的觉醒

step
    #optional
    .abandon 6284 >>放弃任务：贝瑟莱斯

step
    #optional
    .abandon 6641 >>放弃任务：鞭笞者沃尔沙

step
    #optional
    .abandon 6563 >>放弃任务：阿库麦尔水晶

step
    #optional
    #label BarrensEnd
]])
