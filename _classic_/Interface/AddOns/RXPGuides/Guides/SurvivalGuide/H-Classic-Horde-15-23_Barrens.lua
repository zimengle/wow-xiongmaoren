local faction = UnitFactionGroup("player")
if faction == "Alliance" then return end

RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 15-19 贫瘠之地
#displayname 15-19 贫瘠之地 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 1-20
#next 19-23 石爪山/贫瘠之地/灰谷


step << !Tauren !Hunter !Shaman
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Gar'Thok|r交谈
    .turnin 837 >>交任务: |cRXP_FRIENDLY_野猪人的进犯|r
    .goto Durotar,51.95,43.50
    .target Gar'Thok
    .isQuestComplete 837
step << Priest
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
	.train 6074 >>训练你的职业法术
    .target Tai'jin
    .xp <14,1
    .xp >16,1
step << Priest
    #optional
    .goto Durotar,54.26,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泰金|r交谈
	.train 8102 >>训练你的职业法术
    .target Tai'jin
    .xp <16,1
step << Orc Warrior/Troll Warrior
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 1160 >>训练你的职业法术
    .target Tarshaw Jaggedscar
    .xp <14,1
    .xp >16,1
step << Orc Warrior/Troll Warrior
    #optional
    .goto Durotar,54.18,42.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔绍尔·锯痕|r交谈
    .train 285 >>训练你的职业法术
    .target Tarshaw Jaggedscar
    .xp <16,1
step << Rogue
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 1758 >>训练你的职业法术
    .target Kaplak
    .xp <14,1
    .xp >16,1
step << Rogue
    #optional
    .goto Durotar,51.98,43.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡普拉克|r交谈
    .train 6761 >>训练你的职业法术
    .target Kaplak
    .xp <16,1
step << Warlock
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dhugru|r交谈
    .train 6222 >>训练你的职业法术
    .target Dhugru Gorelust
    .xp <14,1
    .xp >16,1
step << Warlock
    .goto Durotar,54.70,41.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_基萨|r交谈并购买|T133738:0|t[献祭秘典]
    .collect 16351,1,842,1 --Grimoire of Sacrifice (Rank 1) (1)
    .target Kitha
    .xp <16,1
step << Warlock
    #optional
    .goto Durotar,54.37,41.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dhugru|r交谈
    .train 1455 >>训练你的职业法术
    .target Dhugru Gorelust
    .xp <16,1
step << !Tauren !Hunter !Shaman
    .goto Durotar,50.8,43.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔克林|r交谈
    .accept 840 >>接任务: |cRXP_LOOT_部落的新兵|r
    .target Takrin Pathseeker
    .isQuestAvailable 840
step
    #optional
    .abandon 480 >>放弃法师头领以避免任务日志问题, 稍后会再次接取
    .isOnQuest 480
step
    #completewith next
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .zoneskip The Barrens
step << !Tauren !Hunter !Shaman
    .goto The Barrens,62.27,19.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Kargal|r交谈
    .turnin 840 >>交任务: |cRXP_FRIENDLY_部落的新兵|r
    .accept 842 >>接任务: |cRXP_LOOT_十字路口征兵|r
    .target Kargal Battlescar
    .isOnQuest 840
step << !Tauren !Hunter !Shaman
    #label Akzeloth
    .goto The Barrens,62.34,20.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
    .turnin 809 >>交任务: |cRXP_FRIENDLY_雅克塞罗斯|r
    .accept 924 >>接任务: |cRXP_LOOT_恶魔之种|r
    .isOnQuest 809
    .target Ak'Zeloth
    .group
step << !Tauren !Hunter !Shaman
    .goto The Barrens,62.34,20.03
    >>|cRXP_WARN_掠夺|r|T134095:0|t[有瑕疵的能量石] |cRXP_WARN_旁边|r|cRXP_FRIENDLY_雅克塞罗斯|r|cRXP_WARN_. 此物品有30分钟倒计时, 请尽快获取|r
    .turnin 926 >>交任务: |cRXP_FRIENDLY_有瑕疵的能量石|r
    .isOnQuest 924
    .group
step << !Tauren !Hunter !Shaman
    #completewith next
    .goto The Barrens,52.34,29.27,150 >>前往十字路口
step << !Undead !Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔夫|r和|cRXP_FRIENDLY_加兹罗格|r和|cRXP_FRIENDLY_瑟格拉|r和|cRXP_FRIENDLY_通加|r和|cRXP_FRIENDLY_曼科里克|r和|cRXP_FRIENDLY_索克|r交谈
    .accept 6365 >>接任务: |cRXP_LOOT_送往奥格瑞玛的肉|r
    .target +Zargh
    .goto The Barrens,52.62,29.84
    .accept 869 >>接任务: |cRXP_LOOT_偷钱的迅猛龙|r
    .target +Gazrog
    .goto The Barrens,51.93,30.32
    .turnin 842 >>交任务: |cRXP_FRIENDLY_十字路口征兵|r
    .accept 844 >>接任务: |cRXP_LOOT_平原陆行鸟的威胁|r
    .target +Sergra Darkthorn
    .goto The Barrens,52.23,31.00
    .accept 870 >>接任务: |cRXP_LOOT_遗忘之池|r
    .target +Tonga Runetotem
    .goto The Barrens,52.26,31.94
    .accept 899 >>接任务: |cRXP_LOOT_复仇的怒火|r
    .accept 4921 >>接任务: |cRXP_LOOT_在战斗中失踪|r
    .target +Mankrik
    .goto The Barrens,52.00,31.60
    .accept 871 >>接任务: |cRXP_LOOT_野猪人的袭击|r
    .accept 5041 >>接任务: |cRXP_LOOT_十字路口的补给品|r
    .target +Thork
    .goto The Barrens,51.50,30.87
    .maxlevel 16
step << !Undead !Tauren
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔夫|r和|cRXP_FRIENDLY_加兹罗格|r和|cRXP_FRIENDLY_瑟格拉|r和|cRXP_FRIENDLY_通加|r和|cRXP_FRIENDLY_曼科里克|r交谈
    .accept 6365 >>接任务: |cRXP_LOOT_送往奥格瑞玛的肉|r
    .target +Zargh
    .goto The Barrens,52.62,29.84
    .accept 869 >>接任务: |cRXP_LOOT_偷钱的迅猛龙|r
    .target +Gazrog
    .goto The Barrens,51.93,30.32
    .turnin 842 >>交任务: |cRXP_FRIENDLY_十字路口征兵|r
    .accept 844 >>接任务: |cRXP_LOOT_平原陆行鸟的威胁|r
    .target +Sergra Darkthorn
    .goto The Barrens,52.23,31.00
    .accept 870 >>接任务: |cRXP_LOOT_遗忘之池|r
    .target +Tonga Runetotem
    .goto The Barrens,52.26,31.94
    .accept 899 >>接任务: |cRXP_LOOT_复仇的怒火|r
    .accept 4921 >>接任务: |cRXP_LOOT_在战斗中失踪|r
    .target +Mankrik
    .goto The Barrens,52.00,31.60
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹罗格|r和|cRXP_FRIENDLY_瑟格拉|r和|cRXP_FRIENDLY_汤加|r和|cRXP_FRIENDLY_曼科里克|r和|cRXP_FRIENDLY_索克|r谈话
    .accept 869 >>接任务: |cRXP_LOOT_偷钱的迅猛龙|r
    .target +Gazrog
    .goto The Barrens,51.93,30.32
    .turnin 842 >>交任务: |cRXP_FRIENDLY_十字路口征兵|r
    .accept 844 >>接任务: |cRXP_LOOT_平原陆行鸟的威胁|r
    .target +Sergra Darkthorn
    .goto The Barrens,52.23,31.00
    .accept 870 >>接任务: |cRXP_LOOT_遗忘之池|r
    .target +Tonga Runetotem
    .goto The Barrens,52.26,31.94
    .accept 899 >>接任务: |cRXP_LOOT_复仇的怒火|r
    .accept 4921 >>接任务: |cRXP_LOOT_在战斗中失踪|r
    .target +Mankrik
    .goto The Barrens,52.00,31.60
    .accept 871 >>接任务: |cRXP_LOOT_野猪人的袭击|r
    .accept 5041 >>接任务: |cRXP_LOOT_十字路口的补给品|r
    .target +Thork
    .goto The Barrens,51.50,30.87
    .maxlevel 16
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹罗格|r和|cRXP_FRIENDLY_瑟格拉|r和|cRXP_FRIENDLY_通加|r和|cRXP_FRIENDLY_曼科里克|r交谈
    .accept 869 >>接任务: |cRXP_LOOT_偷钱的迅猛龙|r
    .target +Gazrog
    .goto The Barrens,51.93,30.32
    .turnin 842 >>交任务: |cRXP_FRIENDLY_十字路口征兵|r
    .accept 844 >>接任务: |cRXP_LOOT_平原陆行鸟的威胁|r
    .target +Sergra Darkthorn
    .goto The Barrens,52.23,31.00
    .accept 870 >>接任务: |cRXP_LOOT_遗忘之池|r
    .target +Tonga Runetotem
    .goto The Barrens,52.26,31.94
    .accept 899 >>接任务: |cRXP_LOOT_复仇的怒火|r
    .accept 4921 >>接任务: |cRXP_LOOT_在战斗中失踪|r
    .target +Mankrik
    .goto The Barrens,52.00,31.60
step
    .goto The Barrens,51.62,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索克|r交谈
    >>|cRXP_WARN_他在塔顶|r
    .accept 867 >>接任务: |cRXP_LOOT_鹰身强盗|r
    .target Darsok Swiftdagger
step
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .turnin 6365 >>交任务: |cRXP_FRIENDLY_送往奥格瑞玛的肉|r << !Tauren !Undead
    .accept 6384 >>接任务: |cRXP_LOOT_飞往奥格瑞玛|r << !Tauren !Undead
    --.fp Crossroads >>获取十字路口飞行路径
    .zoneskip Orgrimmar
    .target Devrak
    .isOnQuest 6365
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    .accept 848 >>接任务: |cRXP_LOOT_菌类孢子|r
    .accept 1492 >>接任务: |cRXP_LOOT_码头管理员迪兹维格|r
	.turnin 1358 >>交任务: |cRXP_FRIENDLY_给赫布瑞姆的样本|r
    .target Apothecary Helbrim
step
    #completewith DemonSeed
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 从它们身上搜刮|cRXP_LOOT_尖喙|r
    .complete 844,1 --Plainstrider Beak (7)
    .mob Greater Plainstrider
    .mob Fleeting Plainstrider
step
    .group
    .goto The Barrens,51.09,22.68,40,0
    .goto The Barrens,50.33,21.85,40,0
    .goto The Barrens,49.21,20.42,40,0
    .goto The Barrens,47.58,19.38,100 >>前往山顶
    .isOnQuest 924
step
    .group
    #label DemonSeed
    .goto The Barrens,47.98,19.08
    >>右键单击|cRXP_PICK_Altar|r
    >>|cRXP_WARN_确保你身上有|r|T134095:0|t[有瑕疵的能量石]|cRXP_WARN_(持续30分钟)|r
    .collect 4986,1,924 --Collect Flawed Power Stone
    .complete 924,1 --Destroy the Demon Seed (1)
    .isOnQuest 924
step
    .group
    #completewith DisruptTheAttacks
    .goto The Barrens,47.58,19.38,40,0
    .goto The Barrens,49.21,20.42,40,0
    .goto The Barrens,50.33,21.85,40,0
    .goto The Barrens,51.09,22.68,100 >>沿着你来时的山路走下去
    .isOnQuest 924
step
    #completewith DisruptTheAttacks
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 从它们身上搜刮|cRXP_LOOT_尖喙|r
    .complete 844,1 --Plainstrider Beak (7)
    .mob Greater Plainstrider
    .mob Fleeting Plainstrider
step
    #completewith next
    >>击杀|cRXP_ENEMY_Water Seekers|r和|cRXP_ENEMY_Thornweavers|r和 |cRXP_ENEMY_猎人|r
    .complete 871,1 --Razormane Water Seeker (8)
    .mob +Razormane Water Seeker
    .complete 871,2 --Razormane Thornweaver (8)
    .mob +Razormane Thornweaver
    .complete 871,3 --Razormane Hunter (3)
    .mob +Razormane Hunter
    .isOnQuest 871
step
    .goto The Barrens,55.70,27.30
    .use 4926 >>从地上拾取老陈的空酒桶并开始任务. 如果该物品尚未出现, 稍后会自动获得
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
step << !Tauren !Hunter !Shaman
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
    >>击杀|cRXP_ENEMY_Water Seekers|r和|cRXP_ENEMY_Thornweavers|r和 |cRXP_ENEMY_猎人|r
    .complete 871,1 --Razormane Water Seeker (8)
    .mob +Razormane Water Seeker
    .complete 871,2 --Razormane Thornweaver (8)
    .mob +Razormane Thornweaver
    .complete 871,3 --Razormane Hunter (3)
    .mob +Razormane Hunter
    .isOnQuest 871
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
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 从它们身上搜刮|cRXP_LOOT_尖喙|r
    .complete 844,1 --Plainstrider Beak (7)
    .mob Greater Plainstrider
    .mob Fleeting Plainstrider
step
    .goto The Barrens,52.23,31.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 844 >>交任务: |cRXP_FRIENDLY_平原陆行鸟的威胁|r
    .accept 845 >>接任务: |cRXP_LOOT_斑马的威胁|r
    .target Sergra Darkthorn
step
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .turnin 871 >>交任务: |cRXP_FRIENDLY_野猪人的袭击|r
    .accept 872 >>接任务: |cRXP_LOOT_野猪人的头目|r
    .target Thork
    .isQuestComplete 871
step
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .accept 872 >>接任务: |cRXP_LOOT_野猪人的头目|r
    .target Thork
    .isQuestTurnedIn 871
step << !Tauren !Undead
    .goto The Barrens,52.62,29.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_扎尔夫|r交谈
    .turnin 6386 >>交任务: |cRXP_FRIENDLY_返回十字路口|r
    .target Zargh
    .isOnQuest 6386
step
    #sticky
    #completewith EnterRFC
    .subzone 2437 >>现在你应该找一个团队去怒焰裂谷
    .dungeon RFC
step
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板博兰德|r交谈
    .home >>将你的炉石设置为十字路口
    .target Innkeeper Boorand Plainswind
    .dungeon RFC
step << skip --!Tauren
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
    .zoneskip Stonetalon Mountains
    .dungeon RFC
step << skip --!Tauren
    #completewith next
    .goto Stonetalon Mountains,82.57,98.63,60,0
    .goto Stonetalon Mountains,80.10,98.20,40,0
    .goto Stonetalon Mountains,77.17,98.61,40 >>沿着左侧的路径向上前进
    .dungeon RFC
step << skip --!Tauren
    .goto Stonetalon Mountains,74.69,98.10
    .goto Thunder Bluff,56.65,18.96,30 >>|cRXP_WARN_跳上其中一个笼子, 通过登出再重新登录来实现登出跳过|r
    .link https://www.youtube.com/watch?v=cp2YI86AO4Y&ab >>|cRXP_WARN_点击此处查看示例|r
    .dungeon RFC
step << skip --!Tauren
    #completewith RFCPickups
    .goto Thunder Bluff,50.75,37.07,40 >>乘坐电梯前往雷霆崖
    .dungeon RFC
step << Tauren
    #completewith RFCPickups
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .dungeon RFC
step << !Tauren
    #completewith RFCPickups
    .goto Mulgore,68.68,60.34,120,0
    .zone Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    >>|cRXP_WARN_如果你有雷霆崖的飞行路径, 请直接飞往那里|r
    .dungeon RFC
step
    #completewith next
    .goto Thunder Bluff,69.88,30.90,80 >>前往长者高地
    .dungeon RFC
step
    #label RFCPickups
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉哈罗|r交谈
    .accept 5722 >>接任务: |cRXP_WARN_寻找背包|r
    .accept 5723 >>接任务: |cRXP_WARN_试探敌人|r
    .target Rahauro
    .dungeon RFC
step
    #completewith next
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .fp Thunder Bluff >>获取雷霆崖飞行路径 << !Tauren
    .fly Orgrimmar >>飞往奥格瑞玛
    .target Tal
    .dungeon RFC
step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .accept 5726 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .dungeon RFC
step
    .goto Durotar,53.08,9.19
    >>击杀骷髅石中的|cRXP_ENEMY_Burning Blade|r怪物, 直到掉落|cRXP_LOOT_Lieutenant's Insignia|r
    .complete 5726,1 --Lieutenant's Insignia (1)
    .dungeon RFC
step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5726 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5727 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .dungeon RFC
step
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .accept 5761 >>接任务: |cRXP_WARN_饥饿者塔拉加曼|r
    .target Neeru Fireblade
    .dungeon RFC
step
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .complete 5727,1 --Gauge Neeru Fireblade's reaction to you being a member of the Burning Blade
    .skipgossip
    .target Neeru Fireblade
    .dungeon RFC
step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5727 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5728 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .dungeon RFC
step
    #completewith EnterRFC
    .destroy 14544 >>|cRXP_WARN_摧毁: |cRXP_ENEMY_军官的徽章|r|r
    .dungeon RFC
step
    #label EnterRFC
    .goto Orgrimmar,52.77,48.97
    .subzone 2437 >>进入RFC副本传送门. 区域中
    .dungeon RFC
step
    #completewith next
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +Ragefire Trogg
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +Ragefire Shaman
    .isOnQuest 5723
    .dungeon RFC
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .turnin 5722 >>交任务: |cRXP_FRIENDLY_寻找背包|r
    .accept 5724 >>接任务: |cRXP_WARN_归还背包|r
    .target Maur Grimtotem
    .isOnQuest 5722
    .dungeon RFC
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Maur|r交谈
    .accept 5724 >>接任务: |cRXP_WARN_归还背包|r
    .target Maur Grimtotem
    .isQuestTurnedIn 5722
    .dungeon RFC
step
    #label TroggsShamans
    >>击杀|cRXP_ENEMY_怒焰穴居人|r和|cRXP_ENEMY_怒焰萨满祭司|r
    .complete 5723,1 --Ragefire Trogg (8)
    .mob +Ragefire Trogg
    .complete 5723,2 --Ragefire Shaman (8)
    .mob +Ragefire Shaman
    .isOnQuest 5723
    .dungeon RFC
step
    #requires TroggsShamans
    #completewith BazzalanandJergosh
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r. 击败他们后搜刮出|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob Searing Blade Cultist
    .mob Searing Blade Warlock
    .isOnQuest 5725
    .dungeon RFC
step
    >>击杀|cRXP_ENEMY_饥饿者塔拉加曼|r. 击败他后搜刮其|cRXP_LOOT_心脏|r
    .complete 5761,1 -- Taragaman the Hungerer's Heart
    .mob Taragaman the Hungerer
    .isOnQuest 5761
    .dungeon RFC
step
    #label BazzalanandJergosh
    >>击杀|cRXP_ENEMY_巴扎兰|r和|cRXP_ENEMY_祈求者耶戈什|r
    .complete 5728,1 --Bazzalan (1)
    .mob +Bazzalan
    .complete 5728,2 --Jergosh the Invoker (1)
    .mob +Jergosh the Invoker
    .isOnQuest 5728
    .dungeon RFC
step
    >>击杀|cRXP_ENEMY_燃刃信徒|r和|cRXP_ENEMY_燃刃术士|r. 击败他们后搜刮出|cRXP_LOOT_暗影法术研究|r和|cRXP_LOOT_扭曲虚空的魔法|r
    .complete 5725,1 --Spells of Shadow (1)
    .complete 5725,2 --	Incantations from the Nether (1)
    .mob Searing Blade Cultist
    .mob Searing Blade Warlock
    .isOnQuest 5725
    .dungeon RFC
step
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5761 >>交任务: |cRXP_FRIENDLY_饥饿者塔拉加曼|r
    .target Neeru Fireblade
    .isQuestComplete 5761
    .dungeon RFC
step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5728 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5729 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .isQuestComplete 5728
    .dungeon RFC
step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .accept 5729 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Thrall
    .isQuestTurnedIn 5728
    .dungeon RFC
step
    .goto Orgrimmar,49.6,50.4
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔鲁·火刃|r交谈
    .turnin 5729 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .accept 5730 >>接任务: |cRXP_LOOT_隐藏的敌人|r
    .target Neeru Fireblade
    .dungeon RFC
    .isQuestTurnedIn 5728
step
    .goto Orgrimmar,31.74,37.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨尔|r谈话
    .turnin 5730 >>交任务: |cRXP_FRIENDLY_隐藏的敌人|r
    .target Thrall
    .isQuestTurnedIn 5728
    .dungeon RFC
step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .zoneskip Durotar
    .dungeon RFC
step
    .goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
    .isQuestComplete 5725
    .dungeon RFC
step
    #completewith Varimathras
    .goto Tirisfal Glades,61.80,65.06,20,0
    .zone Undercity >>前往: |cRXP_PICK_幽暗城|r
    .zoneskip Undercity
    .dungeon RFC
step
    #completewith next
    .goto Undercity,66.09,20.06,20,0
    .goto Undercity,64.37,23.94,20,0
    .goto Undercity,65.93,26.71,10,0
    .goto Undercity,65.89,34.03,10,0
    .goto Undercity,64.22,39.77,10,0
    .goto Undercity,65.53,43.62,15 >>乘坐升降梯前往幽暗城
    .goto Undercity,56.2,96.2
    .dungeon RFC
step
    #label Varimathras
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瓦里玛萨斯|r交谈
    .turnin 5725 >>交任务: |cRXP_FRIENDLY_毁灭之力|r
    .target Varimathras
    .isQuestComplete 5725
    .dungeon RFC
step
    #completewith next
    .hs >>传送至十字路口
    .use 6948
    .dungeon RFC
step
    #completewith FinalRFCTurnin
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Devrak
    .zoneskip Thunder Bluff
    .dungeon RFC
step
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉哈罗|r交谈
    .turnin 5724 >>交任务: |cRXP_FRIENDLY_归还背包|r
    .turnin 5723 >>交任务: |cRXP_FRIENDLY_试探敌人|r
    .target Rahauro
    .dungeon RFC
    .isOnQuest 5724
    .isQuestComplete 5723
step
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉哈罗|r交谈
    .turnin 5724 >>交任务: |cRXP_FRIENDLY_归还背包|r
    .target Rahauro
    .dungeon RFC
    .isOnQuest 5724
step
    #label FinalRFCTurnin
    .goto Thunder Bluff,70.4,29.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉哈罗|r交谈
    .turnin 5723 >>交任务: |cRXP_FRIENDLY_试探敌人|r
    .target Rahauro
    .dungeon RFC
    .isQuestComplete 5723
step
    #completewith RatchetArrive
    .hs >>传送至十字路口
    .cooldown item,6948,>0
    .use 6948
    .dungeon RFC
    .zoneskip Thunder Bluff,1
step
    #completewith RatchetArrive
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .fly Crossroads >>飞往十字路口
    .target Tal
    .cooldown item,6948,<0
    .zoneskip The Barrens
    .dungeon RFC
step
    #optional
    .abandon 5723 >>放弃试探敌人
    .isOnQuest 5723
    .dungeon RFC
step
    #optional
    .abandon 5725 >>Abandon 交任务: |cRXP_FRIENDLY_毁灭之力|r
    .isOnQuest 5725
    .dungeon RFC
step
    #optional
    .abandon 5728 >>放弃隐藏的敌人
    .isOnQuest 5728
    .dungeon RFC
step
    #optional
    .abandon 5761 >>放弃击杀饥饿者塔拉加曼
    .isOnQuest 5761
    .dungeon RFC
step
    .goto The Barrens,55.70,27.30,20,0
    .goto The Barrens,55.78,20.00
    .use 4926 >>从地上拾取|cRXP_PICK_老陈的空酒桶|r并开始任务
    .collect 4926,1,819 --Collect Chen's Empty Keg
    .accept 819 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
step
    #completewith KreenigSnarlsnout
    .goto The Barrens,56.75,24.69,50,0
    .goto The Barrens,59.26,24.67,50,0
    >>击杀钢鬃地卜师和钢鬃防御者
    .complete 872,1 --Razormane Geomancer (8)
    .mob +Razormane Geomancer
    .complete 872,2 --Razormane Defender (8)
    .mob +Razormane Defender
    .isOnQuest 872
step
    #completewith next
    >>拾取|cRXP_PICK_十字路口的补给箱|r. 它有多个刷新位置
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .isOnQuest 5041
step
    #label KreenigSnarlsnout
    .goto The Barrens,58.69,27.08
    >>击杀|cRXP_ENEMY_克里尼格·糟鼻|r. 掠夺他的|cRXP_LOOT_牙齿|r
    .complete 872,3 --Kreenig Snarlsnout's Tusk (1)
    .mob Kreenig Snarlsnout
    .isOnQuest 872
step
    #optional
    #completewith next
    .goto The Barrens,56.75,24.69,0
    .goto The Barrens,59.26,24.67,0
    >>击杀钢鬃地卜师和钢鬃防御者
    .complete 872,1 --Razormane Geomancer (8)
    .mob +Razormane Geomancer
    .complete 872,2 --Razormane Defender (8)
    .mob +Razormane Defender
    .isOnQuest 872
step
    .goto The Barrens,58.38,27.01,30,0
    .goto The Barrens,59.46,24.58
    >>拾取|cRXP_PICK_十字路口的补给箱|r. 它有多个刷新位置
    .complete 5041,1 --Crossroads' Supply Crates (1)
    .isOnQuest 5041
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
    >>击杀钢鬃地卜师和钢鬃防御者
    .complete 872,1 --Razormane Geomancer (8)
    .mob +Razormane Geomancer
    .complete 872,2 --Razormane Defender (8)
    .mob +Razormane Defender
    .isOnQuest 872
step
    #completewith next
    >>击杀你看到的任何 |cRXP_ENEMY_Zhevra|r. 搜刮他们的 |cRXP_LOOT_Hooves|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob Zhevra Runner
step
    .group
    .goto The Barrens,62.34,20.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雅克塞罗斯|r交谈
    .turnin 924 >>交任务: |cRXP_FRIENDLY_恶魔之种|r
    .target Ak'Zeloth
    .isQuestComplete 924
step
    #completewith next
    >>击杀你看到的任何 |cRXP_ENEMY_Zhevra|r. 搜刮他们的 |cRXP_LOOT_Hooves|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob Zhevra Runner
step
    .goto The Barrens,63.08,36.56,120 >>前往棘齿城
    .subzoneskip 392,1
step
    #label RatchetArrive
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .accept 887 >>接任务: |cRXP_LOOT_南海海盗|r
    .target Gazlowe
step
    #completewith next
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fp Ratchet >>获取棘齿城的飞行点
    .target Bragok
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r和|cRXP_FRIENDLY_通缉令|r交谈
    .accept 894 >>接任务: |cRXP_LOOT_什么什么平衡器|r
    .goto The Barrens,62.98,37.22
    .accept 895 >>接任务: |cRXP_LOOT_通缉：巴隆·朗绍尔|r
    .goto The Barrens,62.59,37.47
    .target Sputtervalve
step << Troll Warrior/Undead Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买|r|T135147:0|t[法师之杖] |r
    .collect 2030,1,895,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target Ironzar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Troll Warrior/Undead Warrior
    #completewith BarenLongshore
    +装备 |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Orc Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买|r|T132394:0|t[芒刺斧] |r
    .collect 2025,1,895,1 --Collect Bearded Axe (1)
    .money <0.5304
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Orc Warrior
    #completewith BarenLongshore
    +装备 |T132394:0|t[芒刺斧]
    .use 2025
    .itemcount 2025,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Tauren Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买|r|T133046:0|t[巨型石锤] |r
    .collect 2026,1,895,1 --Collect Rock Hammer (1)
    .money <0.6286
    .target Ironzar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Tauren Warrior
    #completewith BarenLongshore
    +当你达到16级时装备 |T133046:0|t[巨型石锤]
    .use 2026
    .itemcount 2026,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Shaman
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买|r|T135147:0|t[法师之杖] |r
    .collect 2030,1,895,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target Ironzar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Shaman
    #completewith BarenLongshore
    +装备 |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Rogue
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买|r|T135343:0|t[战士阔剑]|r
    .collect 2027,1,895,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target Ironzar
step << Rogue
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买一把|r|T135343:0|t[战士阔剑] |cRXP_BUY_作为你的副手武器|r
    .collect 2027,2,895,1 --Collect Scimitar(1)
    .money <0.3815
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target Ironzar
step
    .goto The Barrens,62.27,38.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Drohn|r交谈
    .turnin 819 >>交任务: |cRXP_FRIENDLY_老陈的空酒桶|r
    .accept 821 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
    .target Brewmaster Drohn
step
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板维尔雷|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133918:0|t[长嘴泥鳅]|r
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_WARN_它们非常便宜, 想买多少就买多少|r
    .vendor >>出售垃圾
    .collect 4592,40,895,1 --Longjaw Mud Snapper (40)
    .collect 1205,20,895,1 << Mage/Warlock/Priest/Shaman/Druid --Melon Juice (20)
    .home >>将你的[炉石]设置为棘齿城
    .target Innkeeper Wiley
step
    #completewith BaronLongshore
    .destroy 5088 >>|cRXP_WARN_摧毁: |cRXP_ENEMY_控制台操作手册|r, 它在你的背包中. 不再需要它了|r
step
    #completewith BaronLongshore
    >>击杀|cRXP_ENEMY_南海歹徒|r 和|cRXP_ENEMY_南海炮兵|r
    .complete 887,1 --Southsea Brigand (12)
    .mob +Southsea Brigand
    .complete 887,2 --Southsea Cannoneer (6)
    .mob +Southsea Cannoneer
step << Orc Rogue/Troll Rogue
	#completewith next
	>>击杀|cRXP_ENEMY_塔赞|r. 搜刮他的|cRXP_LOOT_皮袋|r. 他会在山脊上来回巡逻
	.complete 1963,1 --Tazan's Satchel (1)
    .unitscan Tazan
step
    #label BaronLongshore
    #loop
    .goto The Barrens,64.21,47.14,0
    .goto The Barrens,63.57,49.14,0
    .goto The Barrens,62.64,49.72,0
    .goto The Barrens,64.21,47.14,50,0
    .goto The Barrens,63.57,49.14,50,0
    .goto The Barrens,62.64,49.72,50,0
    >>击杀|cRXP_ENEMY_巴隆·朗绍尔|r. 搜刮他的|cRXP_LOOT_头颅|r. 他出现在其中一个营地中
    .complete 895,1 --Baron Longshore's Head (1)
    .unitscan Baron Longshore
step << Orc Rogue/Troll Rogue
	#completewith next
	>>击杀|cRXP_ENEMY_塔赞|r. 搜刮他的|cRXP_LOOT_皮袋|r. 他会在山脊上来回巡逻
	.complete 1963,1 --Tazan's Satchel (1)
    .unitscan Tazan
step
    #loop
    .goto The Barrens,64.23,47.10,0
    .goto The Barrens,64.40,44.09,50,0
    .goto The Barrens,63.62,46.26,50,0
    .goto The Barrens,64.23,47.10,50,0
    >>击杀|cRXP_ENEMY_南海歹徒|r 和|cRXP_ENEMY_南海炮兵|r
    .complete 887,1 --Southsea Brigand (12)
    .mob +Southsea Brigand
    .complete 887,2 --Southsea Cannoneer (6)
    .mob +Southsea Cannoneer
step << Orc Rogue/Troll Rogue
    .goto The Barrens,63.70,44.32,50,0
    .goto The Barrens,62.70,44.07,50,0
    .goto The Barrens,62.18,44.47
    >>击杀|cRXP_ENEMY_塔赞|r. 搜刮他的|cRXP_LOOT_皮袋|r. 他会在山脊上来回巡逻
	.complete 1963,1 --Tazan's Satchel (1)
    .unitscan Tazan
step
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 887 >>交任务: |cRXP_FRIENDLY_南海海盗|r
    .turnin 895 >>交任务: |cRXP_FRIENDLY_通缉：巴隆·朗绍尔|r
    .accept 890 >>接任务: |cRXP_LOOT_丢失的货物|r
    .target Gazlowe
step
    .goto The Barrens,63.35,38.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dizzywig|r交谈
    .turnin 1492 >>交任务: |cRXP_FRIENDLY_码头管理员迪兹维格|r
    .turnin 890 >>交任务: |cRXP_FRIENDLY_丢失的货物|r
    .accept 892 >>接任务: |cRXP_LOOT_丢失的货物|r
    .accept 896 >>接任务: |cRXP_LOOT_矿工的宝贝|r
    .target Wharfmaster Dizzywig
step
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 892 >>交任务: |cRXP_FRIENDLY_丢失的货物|r
    .accept 888 >>接任务: |cRXP_LOOT_被窃的货物|r
    .target Gazlowe
step << Troll Warrior/Undead Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买|r|T135147:0|t[法师之杖] |r
    .collect 2030,1,850,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target Ironzar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Troll Warrior/Undead Warrior
    #completewith FlyToXroads1
    +装备 |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Orc Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买|r|T132394:0|t[芒刺斧] |r
    .collect 2025,1,850,1 --Collect Bearded Axe (1)
    .money <0.5304
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Orc Warrior
    #completewith FlyToXroads1
    +装备 |T132394:0|t[芒刺斧]
    .use 2025
    .itemcount 2025,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Tauren Warrior
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买|r|T133046:0|t[巨型石锤] |r
    .collect 2026,1,850,1 --Collect Rock Hammer (1)
    .money <0.6286
    .target Ironzar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Tauren Warrior
    #completewith FlyToXroads1
    +当你达到16级时装备 |T133046:0|t[巨型石锤]
    .use 2026
    .itemcount 2026,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step << Shaman
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买|r|T135147:0|t[法师之杖] |r
    .collect 2030,1,850,1 --Collect Gnarled Staff (1)
    .money <0.5544
    .target Ironzar
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Shaman
    #completewith FlyToXroads1
    +装备 |T135147:0|t[法师之杖]
    .use 2030
    .itemcount 2030,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.9
step << Rogue
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买|r|T135343:0|t[战士阔剑]|r
    .collect 2027,1,850,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target Ironzar
step << Rogue
    .goto The Barrens,62.24,37.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_艾隆萨尔|r|cRXP_BUY_交谈. 从他那里购买一把第二|r|T135343:0|t[战士阔剑] |cRXP_BUY_作为你的副手武器|r
    .collect 2027,2,850,1 --Collect Scimitar (1)
    .money <0.3815
    .itemStat 17,QUALITY,<7
    .itemStat 17,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<8.6
    .target Ironzar
step
    #label FlyToXroads1
    #completewith XroadsTurnins3
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >>飞往十字路口
    .target Bragok
    .isQuestComplete 845
step
    #completewith next
    >>杀死你看到的每一只|r迅猛龙|r. 从它们身上搜刮|r头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob Sunscale Lashtail
    .mob Sunscale Screecher
step
    #loop
    .goto The Barrens,55.27,37.82,0
    .goto The Barrens,48.33,36.75,0
    .goto The Barrens,55.27,37.82,80,0
    .goto The Barrens,53.84,38.52,80,0
    .goto The Barrens,52.63,38.07,80,0
    .goto The Barrens,49.49,37.20,80,0
    .goto The Barrens,48.33,36.75,80,0
    >>消灭|cRXP_ENEMY_Zhevras|r. 击杀后搜刮其掉落的|cRXP_LOOT_Hooves|r
    .complete 845,1 --Zhevra Hooves (4)
    .mob Zhevra Runner
step
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .turnin 5041 >>交任务: |cRXP_FRIENDLY_十字路口的补给品|r
    .turnin 872 >>交任务: |cRXP_FRIENDLY_野猪人的头目|r
    .target Thork
    .isQuestComplete 872
    .isQuestComplete 5041
step
    #optional
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .turnin 5041 >>交任务: |cRXP_FRIENDLY_十字路口的补给品|r
    .target Thork
    .isQuestComplete 5041
step
    #optional
    .goto The Barrens,51.50,30.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索克|r交谈
    .turnin 872 >>交任务: |cRXP_FRIENDLY_野猪人的头目|r
    .target Thork
    .isQuestComplete 872
step
    #label XroadsTurnins3
    .goto The Barrens,52.23,31.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .turnin 845 >>交任务: |cRXP_FRIENDLY_斑马的威胁|r
    .accept 903 >>接任务: |cRXP_LOOT_草原上的徘徊者|r
    .target Sergra Darkthorn
step << Hunter
    .goto The Barrens,51.67,29.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_巴尔格交谈|r
    .collect 2515,1200,870,1 << Hunter --Sharp Arrow (1200)
    .target Barg
step
    #completewith RegtharDeathgate1
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 击杀后搜刮其|cRXP_LOOT_Kidneys|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob Greater Plainstrider
    .mob Fleeting Plainstrider
step
    #completewith next
    >>杀死你看到的每一只|r迅猛龙|r. 从它们身上搜刮|r头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob Sunscale Lashtail
    .mob Sunscale Screecher
step
    #label RegtharDeathgate1
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .accept 850 >>接任务: |cRXP_LOOT_科卡尔首领|r
    .accept 855 >>接任务: |cRXP_LOOT_半人马护腕|r
    .target Regthar Deathgate
step
    #completewith Leaders
    >>击杀|cRXP_ENEMY_科卡尔牧民|r和|cRXP_ENEMY_科卡尔召雷师|r. 击败他们后搜刮其掉落的|cRXP_LOOT_护腕|r
    >>|cRXP_WARN_此任务无需立即完成|r
    .complete 855,1 --Centaur Bracers (15)
    .mob Kolkar Wrangler
    .mob Kolkar Stormer
step
    #completewith next
    >>在遗忘之池周围收集|cRXP_LOOT_丰满的蘑菇|r
    >>|cRXP_WARN_此任务无需立即完成|r
    .complete 848,1 --Collect Fungal Spores (x4)
step
    .goto The Barrens,45.06,22.54
    >>潜入水下至|cRXP_PICK_Bubble Fissure|r
    .complete 870,1 --Explore the waters of the Forgotten Pools
step
    .goto The Barrens,42.82,23.52
    >>击杀|cRXP_ENEMY_巴拉克·科多班恩|r. 击败他后搜刮他的|cRXP_LOOT_头|r
    >>|cRXP_WARN_小心！他的近战攻击会造成大量伤害, 而且他受到|r|cRXP_ENEMY_科卡尔牧民|r|cRXP_WARN_的保护. 他们可以用网缠住你, 并从远程距离向你射击|r
    .complete 850,1 --Kodobane's Head (1)
    .mob Barak Kodobane
step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 850 >>交任务: |cRXP_FRIENDLY_科卡尔首领|r
    .accept 851 >>接任务: |cRXP_LOOT_狂热的维罗戈|r
    .turnin 855 >>交任务: |cRXP_FRIENDLY_半人马护腕|r
    .target Regthar Deathgate
    .isQuestComplete 855
step
    #label Leaders
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 850 >>交任务: |cRXP_FRIENDLY_科卡尔首领|r
    .accept 851 >>接任务: |cRXP_LOOT_狂热的维罗戈|r
    .target Regthar Deathgate
step
    #completewith next
    >>杀死你看到的每一只|r迅猛龙|r. 从它们身上搜刮|r头颅|r
    >>|cRXP_WARN_此任务无需立即完成|r
    .complete 869,1 --Raptor Head (12)
    .mob Sunscale Lashtail
    .mob Sunscale Screecher
step
    #loop
    .goto The Barrens,41.62,23.42,0
    .goto The Barrens,41.62,23.42,50,0
    .goto The Barrens,41.30,24.31,50,0
    .goto The Barrens,40.52,22.88,50,0
    .goto The Barrens,41.00,21.19,50,0
    .goto The Barrens,40.32,20.69,50,0
    >>击杀 |cRXP_ENEMY_草原徘徊者|r. 击败他们后, 收集其掉落的 |cRXP_LOOT_爪子|r和 |cRXP_LOOT_牙齿|r
    .complete 903,1 --Prowler Claws (7)
    .complete 821,1 --Savannah Lion Tusk (5)
    .mob Savannah Prowler
step
    #loop
    .goto The Barrens,41.84,14.81,0
    .goto The Barrens,41.51,19.09,60,0
    .goto The Barrens,40.82,18.23,60,0
    .goto The Barrens,40.95,16.80,60,0
    .goto The Barrens,41.23,15.79,60,0
    .goto The Barrens,41.21,14.75,60,0
    .goto The Barrens,41.84,14.81,60,0
    >>击杀|cRXP_ENEMY_Witching Harpies|r和|cRXP_ENEMY_Witching Roguefeathers|r, 搜刮它们掉落的|cRXP_LOOT_Talons|r
    .complete 867,1 --Witchwing Talon (8)
    .mob Witchwing Harpy
    .mob Witchwing Roguefeather
step
    #completewith Samophlange
    +|cRXP_WARN_注意该区域的|r|cRXP_ENEMY_赤鳞镰爪龙|r|cRXP_WARN_. 它们等级高达18级, 且每|r|T132152:0|t[冲锋]|cRXP_WARN_(每10秒触发2次额外攻击)|r
step
    #sticky
    #completewith Samophlange
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 击杀后搜刮其|cRXP_LOOT_Kidneys|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob Greater Plainstrider
    .mob Fleeting Plainstrider
    .mob Ornery Plainstrider
step
    .goto The Barrens,43.80,12.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Vrang|r交谈
	.vendor	>>出售垃圾并修理
    .target Vrang Wildgore
step
	#label Samophlange
    .goto The Barrens,52.40,11.65
    >>点击|cRXP_PICK_控制台|r
    .turnin 894 >>交任务: |cRXP_FRIENDLY_什么什么平衡器|r
    .accept 900 >>接任务: |cRXP_LOOT_什么什么平衡器|r
step
    .goto The Barrens,52.33,11.57
    >>点击|cRXP_PICK_Valve|r
    >>|cRXP_WARN_小心！关闭阀门后会刷新两个怪物|r
    .complete 900,2 --Shut off Fuel Control Valve (1)
step
    .goto The Barrens,52.29,11.40
    >>点击|cRXP_PICK_Valve|r
    >>|cRXP_WARN_关闭阀门后, 会刷新一个怪物|r
    .complete 900,3 --Shut off Regulator Valve (1)
step
    .goto The Barrens,52.40,11.40
    >>点击|cRXP_PICK_Valve|r
    .complete 900,1 --Shut off Main Control Valve (1)
step
    .goto The Barrens,52.40,11.65
    >>点击|cRXP_PICK_控制台|r
    .turnin 900 >>交任务: |cRXP_FRIENDLY_什么什么平衡器|r
    .accept 901 >>接任务: |cRXP_LOOT_什么什么平衡器|r
step
    .goto The Barrens,52.84,10.40
    >>击杀建筑内的工匠斯尼格斯. 搜刮他的控制台钥匙
    .complete 901,1 --Console Key (1)
    .mob Tinkerer Sniggles
step
    .goto The Barrens,52.40,11.65
    >>点击|cRXP_PICK_控制台|r
    .turnin 901 >>交任务: |cRXP_FRIENDLY_什么什么平衡器|r
    .accept 902 >>接任务: |cRXP_LOOT_什么什么平衡器|r
step << Druid
    #completewith DruidTraining1
    .cast 18960 >>施放 |T135758:0|t[传送:月光林地]
    .zoneskip Moonglade
step << Druid
    #optional
    .goto Moonglade,52.53,40.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 5211 >>训练你的职业法术
    .target Loganaar
    .xp <16,1
    .xp >18,1
step << Druid
    #label DruidTraining1
    .goto Moonglade,52.53,40.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 1430 >>训练你的职业法术
    .target Loganaar
    .xp <18,1
step
    #completewith next
    .hs >>传送回棘齿城
    .use 6948
step
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板维尔雷|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133918:0|t[长嘴泥鳅]|r
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_WARN_它们非常便宜, 想买多少就买多少|r
    .vendor >>出售垃圾
    .collect 4592,40,896,1 --Longjaw Mud Snapper (40)
    .collect 1205,40,896,1 << Mage/Warlock/Priest/Shaman/Druid --Melon Juice (40)
    .target Innkeeper Wiley
step
    .goto The Barrens,62.98,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .turnin 902 >>交任务: |cRXP_FRIENDLY_什么什么平衡器|r
    .accept 3921 >>接任务: |cRXP_LOOT_维妮·布特巴克|r
    .accept 1483 >>接任务: |cRXP_LOOT_菲兹克斯|r
    .target Sputtervalve
step
    #completewith Crossroadsturnins2
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >>飞往十字路口
    .target Bragok
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    .turnin 848 >>交任务: |cRXP_FRIENDLY_菌类孢子|r
    .target Apothecary Helbrim
    .isQuestComplete 848
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Darsok|r和|cRXP_FRIENDLY_Tonga|r和|cRXP_FRIENDLY_Sergra|r和|cRXP_FRIENDLY_加兹罗格|r交谈
    .turnin 867 >>交任务: |cRXP_FRIENDLY_鹰身强盗|r
    .accept 875 >>接任务: |cRXP_LOOT_鹰身人首领|r
    .target +Darsok Swiftdagger
    .goto The Barrens,51.62,30.90
    .turnin 870 >>交任务: |cRXP_FRIENDLY_遗忘之池|r
    .accept 877 >>接任务: |cRXP_LOOT_死水绿洲|r
    .target +Tonga Runetotem
    .goto The Barrens,52.26,31.93
    .turnin 903 >>交任务: |cRXP_FRIENDLY_草原上的徘徊者|r
    .accept 881 >>接任务: |cRXP_LOOT_埃其亚基|r
    .target +Sergra Darkthorn
    .goto The Barrens,52.24,31.01
    .turnin 869 >>交任务: |cRXP_FRIENDLY_偷钱的迅猛龙|r
    .accept 3281 >>接任务: |cRXP_LOOT_被偷走的银币|r
    .target +Gazrog
    .goto The Barrens,51.93,30.32
    .isQuestComplete 869
step
    #label Crossroadsturnins2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r和|cRXP_FRIENDLY_Darsok|r和|cRXP_FRIENDLY_Tonga|r和|cRXP_FRIENDLY_Sergra|r交谈
    .turnin 867 >>交任务: |cRXP_FRIENDLY_鹰身强盗|r
    .accept 875 >>接任务: |cRXP_LOOT_鹰身人首领|r
    .target +Darsok Swiftdagger
    .goto The Barrens,51.62,30.90
    .turnin 870 >>交任务: |cRXP_FRIENDLY_遗忘之池|r
    .accept 877 >>接任务: |cRXP_LOOT_死水绿洲|r
    .target +Tonga Runetotem
    .goto The Barrens,52.26,31.93
    .turnin 903 >>交任务: |cRXP_FRIENDLY_草原上的徘徊者|r
    .accept 881 >>接任务: |cRXP_LOOT_埃其亚基|r
    .target +Sergra Darkthorn
    .goto The Barrens,52.24,31.01
step << Hunter
    .goto The Barrens,51.11,29.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_阿瑟罗克|r|cRXP_BUY_交谈. 从他那里购买|r|T134410:0|t[中型箭袋]|r
    .collect 11362,1,896,1 --Medium Quiver (1)
    .collect 2515,1800,896,1 --Sharp Arrow (1800)
    .target Uthrok
step
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板博兰德|r交谈
    .home >>将你的炉石设置为十字路口
    .target Innkeeper Boorand Plainswind
step
    #completewith CatsEye
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target Devrak
step << !Tauren !Undead
    .goto Orgrimmar,54.097,68.407
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Gryshka|r交谈
    .turnin 6384 >>交任务: |cRXP_FRIENDLY_飞往奥格瑞玛|r
    .accept 6385 >>接任务: |cRXP_LOOT_双足飞龙管理员多拉斯|r
    .target Innkeeper Gryshka
    .isOnQuest 6384
step << !Tauren !Undead
    .goto Orgrimmar,45.120,63.889
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_多拉斯|r交谈
    .turnin 6385 >>交任务: |cRXP_FRIENDLY_双足飞龙管理员多拉斯|r
    .accept 6386 >>接任务: |cRXP_LOOT_返回十字路口|r
    .target Doras
    .isOnQuest 6385
step << Shaman
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8019 >>训练你的职业法术
    .target Kardris Dreamseeker
    .xp <16,1
    .xp >18,1
step << Shaman
    #optional
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 913 >>训练你的职业法术
    .target Kardris Dreamseeker
    .xp <18,1
step
    .goto Orgrimmar,38.94,38.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Zor|r交谈
    .accept 1061 >>接任务: |cRXP_LOOT_石爪之灵|r
    .target Zor Lonetree
step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_申苏尔|r交谈
    .train 1804 >>训练 |T136058:0|t[撬锁]
    .train 921 >>训练 |T133644:0|t[扒窃]
    .accept 2379 >>接任务: |cRXP_LOOT_赞杜沙|r
    .target Shenthul
step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 交谈
    .turnin 1963 >>交任务: |cRXP_FRIENDLY_碎手氏族|r
    .accept 1858 >>接任务: |cRXP_LOOT_碎手氏族|r
    .target Therzok
step << Rogue
    .goto Orgrimmar,42.72,52.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赞杜沙|r交谈
    .turnin 2379 >>交任务: |cRXP_FRIENDLY_赞杜沙|r
    .accept 2382 >>接任务: |cRXP_LOOT_棘齿城的维尼克斯|r
    .target Zando'zan
step << Orc Rogue/Troll Rogue
    #completewith next
    .goto Orgrimmar,42.10,49.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔|r|cRXP_BUY_交谈. 从他那里购买|r|T134065:0|t[盗贼工具]|r
    .collect 5060,1,1858,1 --Collect Thieves' Tools (1)
    .target Rekkul
    .money <0.15
step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.52
    >>|cRXP_WARN_使用|r|T136058:0|t[撬锁]|cRXP_WARN_来打开|r|T133626:0|t[塔赞的背包]
    .complete 1858,1 --Tazan's Logbook (1)
    .money <0.15
step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 交谈
    .turnin 1858 >>交任务: |cRXP_FRIENDLY_碎手氏族|r
    .target Therzok
step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,53.99,68.05
    >>|cRXP_WARN_使用|r|T133644:0|t[扒窃]|cRXP_WARN_对|r|cRXP_ENEMY_加摩尔|r|cRXP_WARN_在旅店. 用他的钥匙打开|r|T133626:0|t[塔赞的背包]
	.collect 7208,1,1858,1 --Tazan's Key
	.complete 1858,1 --Tazan's Logbook (1)
    .isOnQuest 1858
step << Orc Rogue/Troll Rogue
    .goto Orgrimmar,42.74,53.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑟祖克|r 交谈
    .turnin 1858 >>交任务: |cRXP_FRIENDLY_碎手氏族|r
    .target Therzok
step << Warlock
    .goto Orgrimmar,48.62,46.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
    .train 1455 >>训练你的职业法术
    .target Mirket
    .xp <16,1
    .xp >18,1
step << Warlock
    #optional
    .goto Orgrimmar,48.62,46.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔科特|r交谈
    .train 1014 >>训练你的职业法术
    .target Mirket
    .xp <18,1
step << Warlock
    .goto Orgrimmar,47.54,46.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库古尔|r交谈并购买|T133738:0|t[献祭法典]
    .collect 16351,1,896,1 --Grimoire of Sacrifice (Rank 1) (1)
    .target Kurgul
    .xp <16,1
    .xp >18,1
step << Warlock
    .goto Orgrimmar,47.54,46.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Kurgul|r交谈并购买 |T133738:0|t[魔典：火焰箭(等级 3)]
    .collect 16316,1,896,1 --Grimoire of Firebolt (Rank 3) (Rank 1) (1)
    .target Kurgul
    .xp <18,1
step << Warrior
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 285 >>训练你的职业法术
    .target Grezz Ragefist
    .xp <16,1
    .xp >18,1
step << Warrior
    #optional
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 8198 >>训练你的职业法术
    .target Grezz Ragefist
    .xp <18,1
step << Hunter
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 13795 >>训练你的职业法术
    .target Ormak Grimshot
    .xp <16,1
    .xp >18,1
step << Hunter
    #optional
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 2643 >>训练你的职业法术
    .target Ormak Grimshot
    .xp <18,1
step << Hunter
    .goto Orgrimmar,66.34,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
    .train 24557 >>训练你的宠物法术
    .target Xao'tsu
step << Hunter
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
    .train 227 >>训练法杖
    .target Hanashi
step << Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
    .train 8102 >>训练你的职业法术
    .target Ur'kyo
    .xp <16,1
    .xp >18,1
step << Priest
    #optional
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
    .train 970 >>训练你的职业法术
    .target Ur'kyo
    .xp <18,1
step << Mage
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 2120 >>训练你的职业法术
    .target Pephredo
    .xp <16,1
    .xp >18,1
step << Mage
    #optional
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 3140 >>训练你的职业法术
    .target Pephredo
    .xp <18,1
step
    #completewith next
    .skill firstaid,40 >>制作|T133685:0|t[亚麻绷带], 直到你的技能达到40或更高
    .skill firstaid,<1,1
step
    .goto Orgrimmar,34.18,84.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_阿诺克|r交谈
    .train 3276 >>训练 |T133688:0|t[厚亚麻绷带]
    .target Arnok
    .skill firstaid,<1,1
step
    #completewith next
    .skill firstaid,50 >>制作 |T133688:0|t[厚亚麻绷带], 直到你的技能达到50或更高
    .skill firstaid,<1,1
step
    .goto Orgrimmar,34.18,84.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_阿诺克|r交谈
    .train 3274 >>火车急救员 急救
    .target Arnok
    .skill firstaid,<1,1
step
    .goto Orgrimmar,26.22,61.58,80,0
    .goto Orgrimmar,15.66,63.33,30,0
    .goto Orgrimmar,18.03,60.51,50 >>前往: |cRXP_PICK_贫瘠之地|r
    .zoneskip The Barrens
    .isOnQuest 896
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
    >>击杀|cRXP_ENEMY_风险投资公司执行者|r 和|cRXP_ENEMY_风险投资公司监督|r . 击杀后掠夺他们, 获得|cRXP_LOOT_猫眼翡翠|r
    >>|cRXP_WARN_避免进入矿井. 怪物容易被双拉, 且逃生空间极小|r
    .complete 896,1 -- Cats Eye Emerald (1)
    .mob Venture Co. Enforcer
    .mob Venture Co. Overseer
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
    >>击杀|cRXP_ENEMY_风险投资公司监督|r. 掠夺他们获取|T132794:0|t[|cRXP_LOOT_灯油|r ]
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
    >>击杀|cRXP_ENEMY_风险投资公司监督|r. 掠夺他们获取|T132794:0|t[|cRXP_LOOT_灯油|r ]
    >>|cRXP_WARN_你也可以从拍卖行购买它们|r
    .collect 814,5,103,1 --Flask of Oil (5)
    .dungeon DM
step
    #completewith Wenikee
    >>杀死你看到的每一只|r迅猛龙|r. 从它们身上搜刮|r头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob Sunscale Lashtail
    .mob Sunscale Screecher
    .mob Sunscale Scytheclaw
step
    #completewith next
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 击杀后搜刮其|cRXP_LOOT_Kidneys|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob Ornery Plainstrider
step
    #label Wenikee
    .goto The Barrens,49.05,11.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维妮·布特巴克|r交谈
    .turnin 3921 >>交任务: |cRXP_FRIENDLY_维妮·布特巴克|r
    .accept 3922 >>接任务: |cRXP_WARN_高强度齿轮|r
    .target Wenikee Boltbucket
step
    #sticky
    #completewith Slugs
    >>从污泥文周围地面上拾取|cRXP_PICK_工具篮|r
    .complete 3922,1 --Nugget Slugs (15)
step
    .goto The Barrens,56.52,7.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Wizzlecrank的碎裂者|r交谈, 地点在淤泥深渊
    .accept 858 >>接任务: |cRXP_LOOT_打火钥匙|r
    .target Wizzlecrank's Shredder
step
    #completewith next
    +|cRXP_WARN_请注意, |r|cRXP_ENEMY_工头葛瑞尔斯|r|cRXP_WARN_或|r|cRXP_ENEMY_淤泥兽|r|cRXP_WARN_出现了. 它们是强大的19级稀有怪物|r
    .unitscan Foreman Grills
    .unitscan Sludge Beast
step
    .goto The Barrens,56.52,8.47,20,0
    .goto The Barrens,56.34,8.24,12,0
    .goto The Barrens,56.12,8.33,12,0
    .goto The Barrens,56.05,8.49,12,0
    .goto The Barrens,56.13,8.56,12,0
    .goto The Barrens,56.34,8.24
    >>击杀|cRXP_ENEMY_鲁格维兹主管|r. 击败他后拾取他的|cRXP_LOOT_Key|r. 他会在平台上来回巡逻
    .complete 858,1 --Ignition Key (1)
    .mob Supervisor Lugwizzle
step
    .goto The Barrens,56.52,7.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Wizzlecrank的碎纸机|r交谈
    >>|cRXP_WARN_这将开始护送任务. 确保你的生命值已满|r
    .turnin 858 >>交任务: |cRXP_FRIENDLY_打火钥匙|r
    .accept 863,1 >>接任务: |cRXP_LOOT_梅贝尔的隐形水|r
    .target Wizzlecrank's Shredder
step
    #label Slugs
    .goto The Barrens,55.80,7.76,30,0
    .goto The Barrens,55.51,7.13
    >>|cRXP_WARN_两名|r|cRXP_ENEMY_冒险公司雇佣兵|r|cRXP_WARN_将在粉碎机移动到高处时出现. 击杀他们后, 等待其在最后触发的RP事件|r
    .complete 863,1 --Escort Wizzlecrank out of the Venture Co. drill site (1)
    .mob Venture Co. Mercenary
    .mob Venture Co. Drudger
    .mob Overseer Glibby
step
    #loop
	.goto The Barrens,55.69,6.94,0
	.goto The Barrens,55.50,7.98,25,0
	.goto The Barrens,55.60,8.85,25,0
	.goto The Barrens,56.04,9.79,25,0
	.goto The Barrens,56.68,8.82,25,0
	.goto The Barrens,57.17,9.08,25,0
	.goto The Barrens,57.61,8.41,25,0
	.goto The Barrens,57.31,7.20,25,0
	.goto The Barrens,56.72,6.92,25,0
	.goto The Barrens,56.17,6.80,25,0
	.goto The Barrens,55.69,6.94,25,0
    >>从污泥文周围地面上拾取|cRXP_PICK_工具篮|r
    .complete 3922,1 --Nugget Slugs (15)
step
	#completewith NuggetSlugsTurnIn
	+|cRXP_WARN_如果你拥有超过 15 个|cRXP_LOOT_高强度齿轮|r|cRXP_WARN_, 请将多余物品的堆栈拆分(按住 Shift 键点击), 然后删除它们|r
step
    #sticky
    #completewith NuggetSlugsTurnIn
    >>杀死你看到的每一只|r迅猛龙|r. 从它们身上搜刮|r头颅|r
    .complete 869,1 --Raptor Head (12)
    .mob Sunscale Lashtail
    .mob Sunscale Screecher
    .mob Sunscale Scytheclaw
step
    #sticky
    #completewith NuggetSlugsTurnIn
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 击杀后搜刮其|cRXP_LOOT_Kidneys|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob Greater Plainstrider
    .mob Fleeting Plainstrider
    .mob Ornery Plainstrider
step
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤|cRXP_ENEMY_埃其亚基|r
    >>击杀|cRXP_ENEMY_埃其亚基|r. 击败后搜刮其掉落的|cRXP_LOOT_埃其亚基的皮毛|r
    >>|cRXP_WARN_如果使用【埃其亚基的号角】后, |cRXP_ENEMY_埃其亚基|r未生成, 或生成时你未获得标记, 请跳过此步骤|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob Echeyakee
    .use 10327
step
    .goto The Barrens,52.23,31.00
    .abandon 881 >>|cRXP_WARN_如果使用[埃其亚基的号角]后, |cRXP_ENEMY_Echeyakee|r未刷新, 或者已刷新但你未获得标记, 请放弃任务, 然后返回城镇并重新接受|r
    .itemcount 5100,<1 --Echeyakee's Hide (0)
step
    .goto The Barrens,52.24,31.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑟格拉·黑棘|r交谈
    .accept 881 >>接任务: |cRXP_LOOT_埃其亚基|r
    .target Sergra Darkthorn
    .itemcount 5100,<1 --Echeyakee's Hide (0)
step
    .goto The Barrens,55.80,17.03
    >>使用 |T134227:0|t[埃其亚基的号角] 召唤|cRXP_ENEMY_埃其亚基|r
    >>击杀|cRXP_ENEMY_埃其亚基|r. 击败后搜刮其掉落的|cRXP_LOOT_埃其亚基的皮毛|r
    .complete 881,1 --Echeyakee's Hide (1)
    .mob Echeyakee
    .use 10327
step
    #label NuggetSlugsTurnIn
    .goto The Barrens,49.05,11.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维妮·布特巴克|r交谈
    .turnin 3922 >>交任务: |cRXP_FRIENDLY_高强度齿轮|r
    .accept 3923 >>接任务: |cRXP_WARN_雷里·格里斯高布|r
    .target Wenikee Boltbucket
step
    #loop
    .goto The Barrens,47.81,14.18,0
    .goto The Barrens,47.81,14.18,50,0
    .goto The Barrens,45.78,14.74,50,0
    .goto The Barrens,44.60,15.04,50,0
    >>击杀|r迅猛龙|cRXP_ENEMY_Raptors|r. 击败它们后搜刮其|r迅猛龙头|cRXP_LOOT_Heads|r
    >>|cRXP_WARN_当他们施放|r|T132152:0|t[横扫]|cRXP_WARN_(每10秒触发2次额外攻击)时要小心|r    
    .complete 869,1 --Raptor Head (12)
    .mob Sunscale Lashtail
    .mob Sunscale Screecher
    .mob Sunscale Scytheclaw
step
    #loop
	.goto The Barrens,40.15,15.98,0
	.goto The Barrens,40.28,15.49,50,0
	.goto The Barrens,39.50,14.68,50,0
	.goto The Barrens,39.47,13.24,50,0
	.goto The Barrens,38.94,12.80,50,0
	.goto The Barrens,38.18,12.56,50,0
	.goto The Barrens,37.96,13.52,50,0
	.goto The Barrens,38.62,13.95,50,0
	.goto The Barrens,38.18,14.62,50,0
	.goto The Barrens,38.14,15.59,50,0
	.goto The Barrens,37.29,15.68,50,0
	.goto The Barrens,37.24,16.26,50,0
	.goto The Barrens,37.67,16.34,50,0
	.goto The Barrens,38.35,17.08,50,0
	.goto The Barrens,38.83,17.71,50,0
	.goto The Barrens,39.37,17.21,50,0
	.goto The Barrens,39.87,16.66,50,0
	.goto The Barrens,40.15,15.98,50,0
    >>击杀|cRXP_ENEMY_巫翼杀戮者|r. 从他们身上搜刮|cRXP_LOOT_戒指|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_巫翼杀戮者|r|cRXP_WARN_可施放. 保持生命值高于20%|r
    >>|cRXP_WARN_小心|r|cRXP_ENEMY_巫翼伏击者|r|cRXP_WARN_. 他们处于潜行状态, 并在该区域巡逻|r
    .complete 875,1 --Harpy Lieutenant Ring (6)
    .mob Witchwing Slayer
    .mob Witchwing Ambusher
step
    #completewith FoodandWater1
    .hs >>传送至十字路口
    .use 6948
    .cooldown item,6948,>0
    .subzoneskip 380
step
    #completewith FoodandWater1
    .goto The Barrens,52.09,30.43,120 >>前往十字路口. 你也可以刷怪, 直到你的|T134414:0|t[炉石]恢复
    .cooldown item,6948,<0
    .subzoneskip 380
step
    #completewith next
    +|cRXP_WARN_请确保你不要出售你的|r|T132794:0|t[|cRXP_LOOT_灯油|r]！
    .itemcount 814,5
    .dungeon DM
step
    #label FoodandWater1
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板博兰德|r交谈
	.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
    .target Innkeeper Boorand Plainswind
step << !Tauren !Undead
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹罗格|r和|cRXP_FRIENDLY_扎尔夫|r和|cRXP_FRIENDLY_瑟格拉|r和|cRXP_FRIENDLY_达索克|r交谈
    .turnin 869 >>交任务: |cRXP_FRIENDLY_偷钱的迅猛龙|r
    .accept 3281 >>接任务: |cRXP_LOOT_被偷走的银币|r
    .target +Gazrog
    .goto The Barrens,51.93,30.32
    .turnin 6386 >>交任务: |cRXP_FRIENDLY_返回十字路口|r
    .target +Zargh
    .goto The Barrens,52.62,29.84
    .turnin 881 >>交任务: |cRXP_FRIENDLY_埃其亚基|r
    .accept 905 >>接任务: |cRXP_LOOT_狂暴的镰爪龙|r
    .target +Sergra Darkthorn
    .goto The Barrens,52.23,31.00
    .turnin 875 >>交任务: |cRXP_FRIENDLY_鹰身人首领|r
    .accept 876 >>接任务: |cRXP_LOOT_塞瑞娜·血羽|r
    .target +Darsok Swiftdagger
    .goto The Barrens,51.62,30.90
    .isOnQuest 6386
step
    #label EcheyakeeTurnin
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹罗格|r和|cRXP_FRIENDLY_瑟格拉|r和|cRXP_FRIENDLY_达索克|r交谈
    .turnin 869 >>交任务: |cRXP_FRIENDLY_偷钱的迅猛龙|r
    .accept 3281 >>接任务: |cRXP_LOOT_被偷走的银币|r
    .target +Gazrog
    .goto The Barrens,51.93,30.32
    .turnin 881 >>交任务: |cRXP_FRIENDLY_埃其亚基|r
    .accept 905 >>接任务: |cRXP_LOOT_狂暴的镰爪龙|r
    .target +Sergra Darkthorn
    .goto The Barrens,52.23,31.00
    .turnin 875 >>交任务: |cRXP_FRIENDLY_鹰身人首领|r
    .accept 876 >>接任务: |cRXP_LOOT_塞瑞娜·血羽|r
    .target +Darsok Swiftdagger
    .goto The Barrens,51.62,30.90
step
    #completewith TheEscapeTurnIn
    .destroy 10327 >>|cRXP_WARN_摧毁: |cRXP_ENEMY_埃其亚基的号角|r|r
step << Hunter
    .goto The Barrens,51.67,29.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_巴尔格交谈|r
    .collect 2515,1800,888,1 << Hunter --Sharp Arrow (1800)
    .target Barg
step
    #completewith TheEscapeTurnIn
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Ratchet >>飞往棘齿城
    .target Devrak
step << Rogue
    .goto The Barrens,63.07,36.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wrenix|r交谈
    .turnin 2382 >>交任务: |cRXP_FRIENDLY_棘齿城的维尼克斯|r
    .accept 2381 >>接任务: |cRXP_LOOT_抢劫海盗|r
    .target Wrenix the Wretched
step << Rogue
    .goto The Barrens,63.12,36.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wrenix的吉兹莫特罗尼克装置|r交谈
    >>|cRXP_WARN_获得一个|r|T134059:0|t[大饼干] |cRXP_WARN_和一个|r|T134065:0|t[盗贼工具]
    .collect 7970,1,888,1 --E.C.A.C. (1)
    .collect 5060,1,888,1 --Thieves' Tools (1)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r和|cRXP_FRIENDLY_码头管理员迪兹维格|r交谈
    .turnin 863 >>交任务: |cRXP_FRIENDLY_梅贝尔的隐形水|r
    .accept 1483 >>接任务: |cRXP_LOOT_菲兹克斯|r
    .target +Sputtervalve
    .goto The Barrens,62.98,37.22
    .turnin 896 >>交任务: |cRXP_FRIENDLY_矿工的宝贝|r
    .target +Wharfmaster Dizzywig
    .goto The Barrens,63.35,38.45
    .isQuestComplete 896
step
    #label TheEscapeTurnIn
    .goto The Barrens,62.98,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .turnin 863 >>交任务: |cRXP_FRIENDLY_梅贝尔的隐形水|r
    .accept 1483 >>接任务: |cRXP_LOOT_菲兹克斯|r
    .target Sputtervalve
step
    .goto The Barrens,62.37,37.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mebok|r交谈
    .accept 865 >>接任务: |cRXP_LOOT_迅猛龙角|r
    .accept 1069 >>接任务: |cRXP_LOOT_深苔蜘蛛的卵|r
    .target Mebok Mizzyrix
step
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板维尔雷|r交谈
    >>|cRXP_BUY_从他那里购买|r|T133918:0|t[长嘴泥鳅]|r
    >>|cRXP_BUY_从他那里购买|r|T132796:0|t[果汁]|r << Mage/Warlock/Priest/Shaman/Druid
    >>|cRXP_WARN_它们非常便宜, 想买多少就买多少|r
    .vendor >>出售垃圾
    .collect 4592,40,888,1 --Longjaw Mud Snapper (40)
    .collect 1205,20,888,1 << Mage/Warlock/Priest/Shaman/Druid --Melon Juice (20)
    .target Innkeeper Wiley
step << Rogue
	#completewith next
    .goto The Barrens,65.04,45.44
    +|cRXP_WARN_跳上船, 前往二楼, 将开锁技能提升至至少70点|r
step << Rogue
    .goto The Barrens,64.95,45.44
    >>一旦你的开锁技能达到70级, 前往船的底层并打开|cRXP_PICK_南海宝珠|r
    >>|cRXP_WARN_使用|r|T134059:0|t[大饼干], |cRXP_WARN_目标: |r|cRXP_ENEMY_波利|r
    .complete 2381,1 --Southsea Treasure (1)
    .use 7970
    .mob Polly
step
    .goto The Barrens,63.58,49.25
    >>拾取地面上的|cRXP_PICK_箱子|r
    .complete 888,2 --Telescopic Lens (1)
step
    .goto The Barrens,62.63,49.64
    >>拾取地面上的|cRXP_PICK_箱子|r
    .complete 888,1 --Shipment of Boots (1)
step
    #completewith TestSeeds
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 击杀后搜刮其|cRXP_LOOT_Kidneys|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob Greater Plainstrider
    .mob Fleeting Plainstrider
    .mob Ornery Plainstrider
step
    #completewith TestSeeds
    >>击杀你见到的任何|cRXP_ENEMY_赤鳞镰爪龙|r. 击杀后搜刮其掉落的|cRXP_LOOT_Horns|r和|cRXP_LOOT_Feathers|r
    >>|cRXP_WARN_当他们施放|r|T132152:0|t[横扫]|cRXP_WARN_(每10秒触发2次额外攻击)时要小心|r    
    .complete 865,1 --Intact Raptor Horn (5)
    .collect 5165,3,905,3 --Sunscale Feather (3)
    .mob Sunscale Scytheclaw
step
    .goto The Barrens,57.39,52.28,60,0
    .goto The Barrens,58.04,53.87
    >>掠夺|cRXP_PICK_被偷走的银币|r
    .complete 3281,1 --Stolen Silver (1)
step
    #completewith Verog
    >>收集死水绿洲周围的丰满的蘑菇
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #label TestSeeds
    .goto The Barrens,55.61,42.75
    >>潜入湖中央的水下, 然后点击|cRXP_PICK_Bubble Fissure|r
    .complete 877,1 --Test the Dried Seeds (1)
step
    #completewith next
    .goto The Barrens,52.95,41.75,0
    >>击杀|cRXP_ENEMY_Verog|r. 击败他后搜刮其|cRXP_LOOT_Head|r
    >>|cRXP_WARN_每次|r|cRXP_ENEMY_Centaur|r|cRXP_WARN_ 被击杀时, 他都有机会出现|r
    .complete 851,1 --Verog's Head (1)
    .mob Verog the Dervish
    .isOnQuest 851
step
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
    >>在绿洲周围击杀|cRXP_ENEMY_Centaurs|c半人马. 击败它们可获得其掉落的|cRXP_LOOT_Bracers|c护腕
    .complete 855,1 --Centaur Bracers (15)
    .mob Kolkar Bloodcharger
    .mob Kolkar Pack runner
    .mob Kolkar Marauder
    .isOnQuest 851
step
    #label Verog
    #loop
    .goto The Barrens,56.75,43.41,0
    .goto The Barrens,55.80,45.78,50,0
    .goto The Barrens,56.75,43.41,50,0
    .goto The Barrens,57.01,41.22,50,0
    .goto The Barrens,55.45,41.37,50,0
    .goto The Barrens,54.99,40.84,50,0
    .goto The Barrens,53.41,40.26,50,0
    .goto The Barrens,52.99,44.73,50,0
    .goto The Barrens,54.31,46.81,50,0
    >>在绿洲周围击杀|cRXP_ENEMY_Centaurs|r. 一旦|cRXP_ENEMY_Verog|r出现, 杀死他并搜刮他的|cRXP_LOOT_Head|r
    >>|cRXP_ENEMY_Verog|r|cRXP_WARN_每次|r|cRXP_ENEMY_半人马|r|cRXP_WARN_被击杀时都有一定几率出现|r
    .complete 851,1 --Verog's Head (1)
    .mob Verog the Dervish
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
    >>收集死水绿洲周围的丰满的蘑菇
    .complete 848,1 --Collect Fungal Spores (x4)
step
    #completewith LizardHorn
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 击杀后搜刮其|cRXP_LOOT_Kidneys|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob Greater Plainstrider
    .mob Fleeting Plainstrider
    .mob Ornery Plainstrider
step
    .goto The Barrens,52.60,46.10
    >>点击蓝色迅猛龙巢穴. 如果还没有|T132914:0|t[赤鳞迅猛龙的羽毛], 请击杀更多赤鳞镰爪龙
    >>|cRXP_WARN_当他们施放|r|T132152:0|t[横扫]|cRXP_WARN_(每10秒触发2次额外攻击)时要小心|r  
    .complete 905,1 --Visit Blue Raptor Nest (1)
    .mob Sunscale Scytheclaw
step
    .goto The Barrens,52.45,46.57
    >>点击红色迅猛龙巢穴. 如果还没有|T132914:0|t[赤鳞迅猛龙的羽毛], 请击杀更多|r|cRXP_ENEMY_赤鳞镰爪龙|r
    >>|cRXP_WARN_当他们施放|r|T132152:0|t[横扫]|cRXP_WARN_(每10秒触发2次额外攻击)时要小心|r  
    .complete 905,3 --Visit Red Raptor Nest (1)
    .mob Sunscale Scytheclaw
step
    #label Nest
    .goto The Barrens,52.02,46.47
    >>点击黄色迅猛龙巢穴. 若你没有 |T132914:0|t[赤鳞迅猛龙的羽毛], 请击杀更多|cRXP_ENEMY_Sunscale Scytheclaws|r(赤鳞镰爪龙)
    >>|cRXP_WARN_当他们施放|r|T132152:0|t[横扫]|cRXP_WARN_(每10秒触发2次额外攻击)时要小心|r  
    .complete 905,2 --Visit Yellow Raptor Nest (1)
    .mob Sunscale Scytheclaw
step
    #loop
    .goto The Barrens,57.3,53.7,0
    .goto The Barrens,52.0,46.5,0
    .goto The Barrens,57.3,53.7,90,0
    .goto The Barrens,52.0,46.5,90,0
    >>击杀赤鳞镰爪龙. 从它们身上搜刮犄角
    .complete 865,1 --Intact Raptor Horn (5)
    .mob Sunscale Scytheclaw
step
    #label LostmyWife
    .goto The Barrens,49.33,50.33
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mankrik的妻子|r交谈
    .complete 4921,1 --Find Mankrik's Wife (1)
    .target Beaten Corpse
step
    #label LizardHorn
    #completewith SetCampTaurajoHS
    >>击杀|r|cRXP_ENEMY_风暴烈酒|r. 击败他们后可获得|r|cRXP_LOOT_号角|r. 此任务无需立即完成
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob Stormsnout
step
    #completewith next
    .goto The Barrens,45.23,58.41,120 >>前往陶拉霍营地
step
    #label SetCampTaurajoHS
    .goto The Barrens,45.58,59.04
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
    .home >>将你的炉石设置为陶拉祖营地
    .target Innkeeper Byula
step
    .goto The Barrens,44.55,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
    .accept 878 >>接任务: |cRXP_LOOT_野猪人的内战|r
    .target Mangletooth
step
    #completewith Xroadsturnins2
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
    .fp Camp Taurajo >>获取陶拉日营地的飞行路径 << !Tauren
    .fly Crossroads >>飞往十字路口
    .target Omusa Thunderhorn
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    .turnin 848 >>交任务: |cRXP_FRIENDLY_菌类孢子|r
    .target Apothecary Helbrim
    .isQuestComplete 848
step
    #label Xroadsturnins2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_曼科里克|r和|cRXP_FRIENDLY_东加|r和|cRXP_FRIENDLY_瑟格拉|r和|cRXP_FRIENDLY_加兹罗格|r谈话
    .turnin 4921 >>交任务: |cRXP_FRIENDLY_在战斗中失踪|r
    .target +Mankrik
    .goto The Barrens,52.00,31.60
    .turnin 877 >>交任务: |cRXP_FRIENDLY_死水绿洲|r
    .accept 880 >>接任务: |cRXP_LOOT_变异的生物|r
    .target +Tonga Runetotem
    .goto The Barrens,52.26,31.93
    .turnin 905 >>交任务: |cRXP_FRIENDLY_狂暴的镰爪龙|r
    .accept 3261 >>接任务: |cRXP_LOOT_乔恩·星眼|r
    .target +Sergra Darkthorn
    .goto The Barrens,52.24,31.01
    .turnin 3281 >>交任务: |cRXP_FRIENDLY_被偷走的银币|r
    .target +Gazrog
    .goto The Barrens,51.93,30.32
step
    .destroy 5165 >>摧毁: |cRXP_ENEMY_赤鳞迅猛龙的羽毛|r
    .itemcount 5165,1
step << Hunter
    .goto The Barrens,51.67,29.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_巴尔格交谈|r
    .collect 2515,1800,888,1 << Hunter --Sharp Arrow (1800)
    .target Barg
step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 855 >>交任务: |cRXP_FRIENDLY_半人马护腕|r
    .target Regthar Deathgate
    .isQuestComplete 855
step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 851 >>交任务: |cRXP_FRIENDLY_狂热的维罗戈|r
    .accept 852 >>接任务: |cRXP_LOOT_赫兹鲁尔·血印|r
    .target Regthar Deathgate
    .isQuestComplete 851
step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .accept 852 >>接任务: |cRXP_LOOT_赫兹鲁尔·血印|r
    .target Regthar Deathgate
    .isQuestTurnedIn 851
step
    #completewith next
    .goto The Barrens,35.26,27.88,100 >>前往: |cRXP_PICK_石爪山脉|r
    .zoneskip Stonetalon Mountains
step
    #map Stonetalon Mountains
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Seereth|r和|cRXP_FRIENDLY_Makaba|r交谈
    .turnin 1061 >>交任务: |cRXP_FRIENDLY_石爪之灵|r
    .accept 1062 >>接任务: |cRXP_LOOT_地精侵略者|r
    .target +Seereth Stonebreak
    .goto The Barrens,35.26,27.88
    .accept 6548 >>接任务: |cRXP_LOOT_为我的村庄复仇|r
    .target +Makaba Flathoof
    .goto The Barrens,35.19,27.79

]])

RXPGuides.RegisterGuide([[
#hardcore
#classic
<< Horde
#name 19-23 石爪山/贫瘠之地/灰谷
#displayname 19-23 石爪山/贫瘠之地/灰谷 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#version 1
#group RestedXP 生存指南 (部落)
#subgroup RXP生存指南 1-20
#next 23-25 希尔斯布莱德

step
    #optional
    #completewith next
    >>放弃向卡德拉克报到, 以避免任务日志出现问题. 稍后会再次接取该任务
    .abandon 6541 >>放弃向卡德拉克报到
    .isOnQuest 6541
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
    >>击杀该区域内的|r恐怖图腾恶徒|r和|r恐怖图腾雇佣兵|r
    .complete 6548,1 --Kill Grimtotem Ruffian (x8)
    .mob +Grimtotem Ruffian
    .complete 6548,2 --Kill Grimtotem Mercenary (x6)
    .mob +Grimtotem Mercenary
step
    #map Stonetalon Mountains
    .goto The Barrens,35.19,27.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛卡巴·扁蹄|r交谈
    .turnin 6548 >>交任务: |cRXP_FRIENDLY_为我的村庄复仇|r
    .accept 6629 >>接任务: |cRXP_LOOT_杀死格鲁迪格·暗云|r
    .target Makaba Flathoof
step
    #completewith next
    .goto Stonetalon Mountains,75.89,87.49,30 >>沿着小路前往篝火处
step
    .goto Stonetalon Mountains,73.65,86.13
    >>击杀格鲁迪格·暗云和恐怖图腾蛮兵
    >>|cRXP_WARN_确保在进入任务前杀死所有六个|r |cRXP_ENEMY_恐怖图腾蛮兵|r |r
    .complete 6629,1 --Kill Grundig Darkcloud (x1)
    .mob +Grundig Darkcloud
    .complete 6629,2 --Kill Grimtotem Brute (x6)
    .mob +Grimtotem Brute
step
    .goto Stonetalon Mountains,73.48,85.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯娅|r交谈
    .accept 6523,1 >>接任务: |cRXP_LOOT_保护卡雅|r
    .target Kaya Flathoof
step
    .goto Stonetalon Mountains,71.82,86.79,40,0
    .goto Stonetalon Mountains,71.83,89.79,40,0
    .goto Stonetalon Mountains,76.73,90.85
    >>护送|cRXP_FRIENDLY_Kaya|r并始终靠近她
    >>|cRXP_WARN_小心！当你到达阿帕拉热营地的篝火旁时, 会出现三个|r|cRXP_ENEMY_枯骨图腾|r|cRXP_WARN_敌人|r
    .complete 6523,1 --Kaya Escorted to Camp Aparaje
    .target Kaya Flathoof
step
    .goto Stonetalon Mountains,71.25,95.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xen'Zilla|r交谈
    .accept 6461 >>接任务: |cRXP_LOOT_盗窃的蜘蛛|r
    .target Xen'Zilla
step
    #completewith InDeepTrouble
    .goto Stonetalon Mountains,68.59,88.34,80,0
    .goto Stonetalon Mountains,64.95,83.88,80,0
    .goto Stonetalon Mountains,61.47,81.51,80,0
    .goto Stonetalon Mountains,60.36,76.28,80,0
    .goto Stonetalon Mountains,59.04,73.01,80,0
    .goto Stonetalon Mountains,60.83,71.84,80,0
    >>杀死你见到的每一个|cRXP_ENEMY_深苔爬行者|r
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob Deepmoss Creeper
step
    #completewith InDeepTrouble
    .goto Stonetalon Mountains,49.38,61.68,50 >>前往烈日石居
step
    #completewith next
    .goto Stonetalon Mountains,49.38,61.68,20,0
    .goto Stonetalon Mountains,48.92,62.71,30,0
    .goto Stonetalon Mountains,48.11,63.88,30,0
    .goto Stonetalon Mountains,47.21,64.05,30 >>沿着左侧的路径跑上去
    .group
step
    #label InDeepTrouble
    .goto Stonetalon Mountains,47.21,64.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mor'Rogal|r交谈
    .accept 6421 >>接任务: |cRXP_WARN_滚岩峡谷|r
    .target Mor'Rogal
    .group
step
    .goto Stonetalon Mountains,47.47,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板杰卡|r交谈
    >>|cRXP_WARN_不要设置你的[炉石]！|r
	.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
    .target Innkeeper Jayka
step
    .goto Stonetalon Mountains,47.61,61.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_基达|r交谈
    .vendor >>|cRXP_BUY_从她那里购买|r|T134831:0|t[治疗药水]|cRXP_BUY_(如果价格合适)|r << !Warrior
    .vendor >>|cRXP_BUY_从她那里购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134413:0|t[活根草]|cRXP_BUY_(如果有的话)|r << Warrior
    .target Jeeda
step
    .goto Stonetalon Mountains,45.13,59.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨尔姆|r交谈
    .fp Sun Rock Retreat >>获取烈日石居的飞行点路线
    .target Tharm
step
    #completewith next
    .goto Stonetalon Mountains,58.99,62.60,100 >>前往狂风峭壁
step
    .goto Stonetalon Mountains,58.99,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_其兹|r交谈
    .turnin 1483 >>交任务: |cRXP_FRIENDLY_菲兹克斯|r
    .accept 1093 >>接任务: |cRXP_LOOT_超级收割机6000|r
    .target Ziz Fizziks
step
    #completewith next
    >>击杀|cRXP_ENEMY_深苔毒蜘蛛|r
    .complete 6461,2 --Kill Deepmoss Venomspitter (x7)
    .mob Deepmoss Venomspitter
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
    >>拾取树附近的|cRXP_PICK_蜘蛛卵|r
    >>|cRXP_WARN_小心！|r|cRXP_ENEMY_深苔幼蛛|r|cRXP_WARN_有几率召唤出一只等级为22的|r|cRXP_ENEMY_深苔雌蜘蛛|r|r
    .complete 1069,1 --Collect Deepmoss Egg (x15)
step
    #loop
	.goto Stonetalon Mountains,60.25,63.21,0
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
    .complete 6461,2 --Kill Deepmoss Venomspitter (x7)
    .mob Deepmoss Venomspitter
step << Troll Warrior/Undead Warrior
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈. 从他那里购买|r|T135157:0|t[占卜法杖] |r
    .collect 928,1,899,1 --Collect Long Staff (1)
    .money <0.9860
    .target Veenix
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
step << Troll Warrior/Undead Warrior
    #completewith BluePrints
    +装备 |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1
step << Orc Warrior
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈. 从他那里购买|r|T135423:0|t[大型战斧]|r
    .collect 926,1,899,1 --Collect Battle Axe (1)
    .money <0.9784
    .target Veenix
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.3
step << Orc Warrior
    #completewith BluePrints
    +装备 |T135423:0|t[大型战斧]
    .use 926
    .itemcount 926,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.3
    .xp <20,1
step << Tauren Warrior
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈. 从他那里购买|r|T133044:0|t[牢固的木槌]|r
    .collect 924,1,899,1 --Collect Maul (1)
    .money <1.0972
    .target Veenix
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0
step << Tauren Warrior
    #completewith BluePrints
    +装备 |T133044:0|t[牢固的木槌]
    .use 924
    .itemcount 924,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0
    .xp <21,1
step << Shaman
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈. 从他那里购买|r|T135157:0|t[占卜法杖] |r
    .collect 928,1,899,1 --Collect Long Staff (1)
    .money <0.9860
    .target Veenix
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
step << Shaman
    #completewith BluePrints
    +装备 |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
    .xp <20,1
step << Rogue
    .goto Stonetalon Mountains,58.22,51.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_维尼克斯|r|cRXP_BUY_交谈, 从他那里购买一把|r|T135324:0|t[长剑] |r
    .collect 923,1,899,1 --Collect Longsword (1)
    .money <0.8743
    .target Veenix
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
step << Rogue
    #completewith BluePrints
    +装备 |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
    .xp <21,1
step
    #completewith next
    >>击杀|cRXP_ENEMY_风险投资公司樵夫|r
    .complete 1062,1 --Kill Venture Co. Logger (x15)
    .mob Venture Co. Logger
step
    #label BluePrints
    #loop
    .goto Stonetalon Mountains,62.8,53.7,0
    .goto Stonetalon Mountains,62.8,53.7,100,0
    .goto Stonetalon Mountains,61.7,51.5,100,0
    .goto Stonetalon Mountains,66.8,45.3,100,0
    .goto Stonetalon Mountains,71.7,49.9,100,0
    .goto Stonetalon Mountains,74.3,54.7,100,0
    >>击杀|cRXP_ENEMY_风险投资公司操作员|r. 击杀后掠夺他们的|cRXP_LOOT_蓝图|r
    .complete 1093,1 --Collect Super Reaper 6000 Blueprints (x1)
    .mob Venture Co. Operator
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
    .mob Venture Co. Logger
step
	#completewith next
	+|cRXP_WARN_摧毁: |cRXP_ENEMY_深苔蜘蛛的卵|r|r
step
    .goto Stonetalon Mountains,58.99,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_其兹|r交谈
    .turnin 1093 >>交任务: |cRXP_FRIENDLY_超级收割机6000|r
    .accept 1094 >>接任务: |cRXP_LOOT_新的指示|r
    .target Ziz Fizziks
step
    #loop
    .goto Stonetalon Mountains,68.59,88.34,0
    .goto Stonetalon Mountains,60.83,71.84,80,0
    .goto Stonetalon Mountains,59.04,73.01,80,0
    .goto Stonetalon Mountains,60.36,76.28,80,0
    .goto Stonetalon Mountains,61.47,81.51,80,0
    .goto Stonetalon Mountains,64.95,83.88,80,0
    .goto Stonetalon Mountains,68.59,88.34,80,0
    >>完成击杀|cRXP_ENEMY_深苔爬行者|r
    .complete 6461,1 --Kill Deepmoss Creeper (x10)
    .mob Deepmoss Creeper
step << Druid
    #completewith DruidTraining2
    .cast 18960 >>施放 |T135758:0|t[传送:月光林地]
    .zoneskip Moonglade
step << Druid
    #optional
    .goto Moonglade,52.53,40.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 1430 >>训练你的职业法术
    .target Loganaar
    .xp <18,1
    .xp >20,1
step << Druid
    #label DruidTraining2
    .goto Moonglade,52.53,40.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛甘纳尔|r交谈
    .train 768 >>训练你的职业法术
    .target Loganaar
    .xp <20,1
step
    #completewith next
    .hs >>传送至陶拉祖营地
    .use 6948
step
    .goto The Barrens,45.58,59.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板比鲁拉|r交谈
	.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
    .target Innkeeper Byula
step
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 3261 >>交任务: |cRXP_FRIENDLY_乔恩·星眼|r
    .accept 882 >>接任务: |cRXP_LOOT_伊沙姆哈尔|r
    .target Jorn Skyseer
step
	#completewith LakotaMani
    >>击杀|cRXP_ENEMY_风暴烈酒|r. 击败后搜刮出|cRXP_LOOT_Horn|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob Stormsnout
step
    #completewith next
    >>击杀大量|cRXP_ENEMY_Bristleback Quillboars|r. 击杀后掠夺它们的|cRXP_LOOT_Tusks|r. 保存你获得的 |T134128:0|t[|cRXP_LOOT_血岩碎片|r]
	.complete 878,1 --Kill Bristleback Water Seeker (x6)
    .mob +Bristleback Water Seeker
    .complete 878,2 --Kill Bristleback Thornweaver (x12)
    .mob +Bristleback Thornweaver
    .complete 878,3 --Kill Bristleback Geomancer (x12)
    .mob +Bristleback Geomancer
    .complete 899,1 --Collect Bristleback Quilboar Tusk (x60)
    .mob +Bristleback Water Seeker
    .mob +Bristleback Thornweaver
    .mob +Bristleback Geomancer
step
    #label LakotaMani
    #loop
    .goto The Barrens,45.14,52.82,0
    .goto The Barrens,45.93,49.08,0
    .goto The Barrens,47.43,51.37,0
    .goto The Barrens,50.10,53.34,0
    .goto The Barrens,45.14,52.82,80,0
    .goto The Barrens,45.93,49.08,80,0
    .goto The Barrens,47.43,51.37,80,0
    .goto The Barrens,50.10,53.34,80,0
	>>击杀|cRXP_ENEMY_拉克塔曼尼|r. 击败他后搜刮出 |T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r]
    >>|cRXP_WARN_使用 |T132318:0|t[|cRXP_LOOT_拉克塔曼尼的蹄子|r ] 开始任务|r
    >>|cRXP_WARN_他有4个刷新点(地图上已标记)|r
    >>|cRXP_WARN_如果找不到他, 可以跳过此步骤|r
	.collect 5099,1,883,1 --Collect Hoof of Lakota'Mani
	.accept 883 >>接任务: |cRXP_LOOT_拉克塔曼尼|r
    .use 5099
    .unitscan Lakota'mani
step
    #completewith next
    >>击杀|cRXP_ENEMY_风暴烈酒|r. 击败后搜刮出|cRXP_LOOT_Horn|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob Stormsnout
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
    >>击杀大量|cRXP_ENEMY_Bristleback Quillboars|r. 击杀后掠夺它们的|cRXP_LOOT_Tusks|r. 保存你获得的 |T134128:0|t[|cRXP_LOOT_血岩碎片|r]
	.complete 878,1 --Kill Bristleback Water Seeker (x6)
    .mob +Bristleback Water Seeker
    .complete 878,2 --Kill Bristleback Thornweaver (x12)
    .mob +Bristleback Thornweaver
    .complete 878,3 --Kill Bristleback Geomancer (x12)
    .mob +Bristleback Geomancer
    .complete 899,1 --Collect Bristleback Quilboar Tusk (x60)
    .mob +Bristleback Water Seeker
    .mob +Bristleback Thornweaver
    .mob +Bristleback Geomancer
step
    #loop
    .goto The Barrens,50.88,52.96,0
    .goto The Barrens,50.88,52.96,50,0
    .goto The Barrens,50.06,52.78,50,0
    .goto The Barrens,49.35,53.74,50,0
    .goto The Barrens,49.54,55.08,50,0
    .goto The Barrens,49.03,56.24,50,0
    .goto The Barrens,49.72,56.13,50,0
    >>击杀|cRXP_ENEMY_风暴烈酒|r. 击败后搜刮出|cRXP_LOOT_Horn|r
    .complete 821,3 --Thunder Lizard Horn (1)
    .mob Stormsnout
step
    #loop
    .goto The Barrens,53.98,51.68,0
    .goto The Barrens,53.98,51.68,50,0
    .goto The Barrens,54.10,50.58,50,0
    .goto The Barrens,53.85,49.76,50,0
    .goto The Barrens,54.32,49.38,50,0
    .goto The Barrens,54.82,49.00,50,0
    .goto The Barrens,55.23,47.96,50,0
    >>击杀|cRXP_ENEMY_平原陆行鸟|r. 击杀后可掠夺其|cRXP_LOOT_肾脏|r
    .complete 821,2 --Plainstrider Kidney (5)
    .mob Greater Plainstrider
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
    >>击杀湖中及周边的|cRXP_ENEMY_绿洲钳嘴龟|r, 搜刮它们掉落的|cRXP_LOOT_Shells|r
    .complete 880,1 --Altered Snapjaw Shell (8)
    .mob Oasis Snapjaw
step
    #completewith next
    >>击杀任意|cRXP_ENEMY_Zhevra|r. 击败后拾取其尸体, 获得|cRXP_LOOT_新鲜的斑马肉|r
	.collect 10338,1 --Collect Fresh Zhevra Carcass
    .mob Zhevra Charger
step
    .goto The Barrens,59.71,30.33
    .use 10338 >>在枯树处使用 |T134368:0|t[|cRXP_LOOT_新鲜的斑马肉|r] 召唤 |cRXP_ENEMY_伊沙姆哈尔|r. 击杀并掠夺他, 获得他的 |cRXP_LOOT_利牙|r
    >>|cRXP_WARN_尸体仅持续30分钟！|r
    .complete 882,1 --Ishamuhale's Fang (1)
    .mob Ishamuhale
step
    #completewith BootyTurnin
    .goto The Barrens,63.00,36.42,100 >>前往棘齿城
step << Rogue
    .goto The Barrens,63.07,36.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Wrenix|r交谈
    .turnin 2381 >>交任务: |cRXP_FRIENDLY_抢劫海盗|r
    .target Wrenix the Wretched
step
    #label BootyTurnin
    .goto The Barrens,62.68,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_加兹鲁维|r交谈
    .turnin 888 >>交任务: |cRXP_FRIENDLY_被窃的货物|r
    .target Gazlowe
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r和|cRXP_FRIENDLY_Mebok|r和|cRXP_FRIENDLY_Drohn|r交谈
    .turnin 1094 >>交任务: |cRXP_FRIENDLY_新的指示|r
    .accept 1095 >>接任务: |cRXP_LOOT_新的指示|r
    .target +Sputtervalve
    .goto The Barrens,62.98,37.22
    .turnin 865 >>交任务: |cRXP_FRIENDLY_迅猛龙角|r
    .turnin 1069 >>交任务: |cRXP_FRIENDLY_深苔蜘蛛的卵|r
    .accept 1491 >>接任务: |cRXP_LOOT_智慧饮料|r
    .target +Mebok Mizzyrix
    .goto The Barrens,62.37,37.62
    .turnin 821 >>交任务: |cRXP_FRIENDLY_老陈的空酒桶|r
    .accept 822 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
    .target +Brewmaster Drohn
    .goto The Barrens,62.27,38.39
    .dungeon WC
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r和|cRXP_FRIENDLY_Mebok|r和|cRXP_FRIENDLY_Drohn|r交谈
    .turnin 1094 >>交任务: |cRXP_FRIENDLY_新的指示|r
    .accept 1095 >>接任务: |cRXP_LOOT_新的指示|r
    .target +Sputtervalve
    .goto The Barrens,62.98,37.22
    .turnin 865 >>交任务: |cRXP_FRIENDLY_迅猛龙角|r
    .turnin 1069 >>交任务: |cRXP_FRIENDLY_深苔蜘蛛的卵|r
    .target +Mebok Mizzyrix
    .goto The Barrens,62.37,37.62
    .turnin 821 >>交任务: |cRXP_FRIENDLY_老陈的空酒桶|r
    .accept 822 >>接任务: |cRXP_LOOT_老陈的空酒桶|r
    .target +Brewmaster Drohn
    .goto The Barrens,62.27,38.39
step << Warrior
    .goto The Barrens,62.20,38.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格拉利克斯|r交谈
    .vendor >>如果有的话, 向他购买 |T134583:0|t[|cRXP_FRIENDLY_粗链短裤|r]
    .target Grazlix
    .money <0.619
    .itemStat 7,ITEM_MOD_ARMOR_SHORT,<155
    .equip 7,4800
step << Rogue/Hunter/Warrior/Shaman/Druid
    .goto The Barrens,62.16,38.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维克斯宾德|r交谈
    .vendor >>如果他有 |T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r], 就向他购买
    .target Vexspindle
    .money <0.3515
    .itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
    .equip 9,4794
step
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板维尔雷|r交谈
    .home >>将你的[炉石]设置为棘齿城
    .target Innkeeper Wiley
    .dungeon WC
step << Warrior
    #completewith FlytoXroads
    +装备 |T134583:0|t[|cRXP_FRIENDLY_粗链短裤|r]
    .use 4800
    .itemcount 4800,1
    .itemStat 7,ITEM_MOD_ARMOR_SHORT,<155
    .equip 7,4800
step << Rogue/Hunter/Warrior/Shaman/Druid
    #completewith FlytoXroads
    +装备 |T132603:0|t[|cRXP_FRIENDLY_野狼护腕|r]
    .use 4794
    .itemcount 4794,1
    .itemStat 9,ITEM_MOD_ARMOR_SHORT,<37
    .equip 9,4794
step
    .goto The Barrens,63.09,37.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bigglefuzz|r交谈
    .accept 959 >>接任务: |cRXP_LOOT_港口的麻烦|r
    .target Crane Operator Bigglefuzz
    .dungeon WC
step
    #label FlytoXroads
    #completewith XroadsHS2
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >>飞往十字路口
    .target Bragok
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_曼科里克|r和|cRXP_FRIENDLY_东加|r交谈
    .turnin 899 >>交任务: |cRXP_FRIENDLY_复仇的怒火|r
    .target +Mankrik
    .goto The Barrens,51.95,31.58
    .turnin 880 >>交任务: |cRXP_FRIENDLY_变异的生物|r
    .accept 1489 >>接任务: |cRXP_LOOT_哈缪尔·符文图腾|r
    .accept 3301 >>接任务: |cRXP_LOOT_茉拉·符文图腾|r
    .target +Tonga Runetotem
    .goto The Barrens,52.26,31.93
step
    .destroy 5085 >>摧毁: |cRXP_ENEMY_刺背野猪人的獠牙|r
    .itemcount 5085,1
step
    #label XroadsHS2
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板博兰德|r交谈
    .home >>将你的炉石设置为十字路口
	.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
    .target Innkeeper Boorand Plainswind
    .dungeon !WC
step << Shaman
    #completewith next
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target Devrak
step << Shaman
    .goto Orgrimmar,37.96,37.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔恩·火结|r交谈
	.accept 1528 >>接任务: |cRXP_LOOT_水之召唤|r
    .target Searn Firewarder
step << Shaman
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 2645 >>训练你的职业法术
    .target Kardris Dreamseeker
step << Warlock
    #completewith next
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target Devrak
step << Warlock
    .goto Orgrimmar,48.25,45.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Gan'rul|r 交谈
    .trainer >>训练你的职业法术
    .accept 1507 >>接任务: |cRXP_LOOT_噬魂者|r
    .target Gan'rul Bloodeye
step << Warlock
    .goto Orgrimmar,47.54,46.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Kurgul|r交谈并购买 |T133738:0|t[魔典：折磨(等级 2)]
    .collect 16346,1,1507,1 --Grimoire of Torment (Rank 2)
    .target Kurgul
step << Warlock
    .goto Orgrimmar,47.05,46.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡祖尔|r交谈
    .turnin 1507 >>交任务: |cRXP_FRIENDLY_噬魂者|r
    .accept 1508 >>接任务: |cRXP_LOOT_盲眼卡祖尔|r
    .target Cazul
step << Warlock
    .goto Orgrimmar,44.16,48.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡提斯|r|cRXP_BUY_交谈. 从她那里购买|r|T135139:0|t[燃烧魔杖]|r
    .collect 5210,1,1507,1 --Collect Burning Wand (1)
    .money <0.5808
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.4
    .target Katis
step << Warlock
    .goto Orgrimmar,37.03,59.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赞卡沙|r交谈
    .turnin 1508 >>交任务: |cRXP_FRIENDLY_盲眼卡祖尔|r
    .accept 1509 >>接任务: |cRXP_LOOT_多格兰的消息|r
    .target Zankaja
step
    #completewith EnterDM
    .subzone 1581 >>现在你应该寻找一个团队前往死亡矿井
    .dungeon DM
step
    #completewith ZepptoSTVforDM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .zoneskip Orgrimmar
    .target Devrak
    .dungeon DM
step << Shaman
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8052 >>训练你的职业法术
    .target Kardris Dreamseeker
    .xp <18,1
    .xp >20,1
    .dungeon DM
step << Shaman
    #optional
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 2645 >>训练你的职业法术
    .target Kardris Dreamseeker
    .xp <20,1
    .dungeon DM
step << Hunter
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
	.train 14318 >>训练你的职业法术
    .target Ormak Grimshot
    .xp <18,1
    .xp >20,1
    .dungeon DM
step << Hunter
    #optional
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
	.train 14290 >>训练你的职业法术
    .target Ormak Grimshot
    .xp <20,1
    .dungeon DM
step << Hunter
    .goto Orgrimmar,66.33,14.83
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
	.train 5118 >>训练你的宠物法术
	.target Xao'tsu
    .xp <20,1
    .dungeon DM
step << Warrior
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
	.train 8198 >>训练你的职业法术
    .target Grezz Ragefist
    .xp <18,1
    .xp >20,1
    .dungeon DM
step << Warrior
    #optional
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 845 >>训练你的职业法术
    .target Grezz Ragefist
    .xp <20,1
    .dungeon DM
step << Rogue
    .goto Orgrimmar,43.90,54.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥莫克|r交谈
    .train 1943 >>训练你的职业法术
    .target Ormok
    .xp <20,1
    .dungeon DM
step << Warlock
    .goto Undercity,48.47,45.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽弗洛斯特|r交谈
    .train 1014 >>训练你的职业法术
	.target Zevrost
    .xp <18,1
    .xp >20,1
    .dungeon DM
step << Warlock
    #optional
    .goto Undercity,48.47,45.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_泽弗洛斯特|r交谈
    .train 706 >>训练你的职业法术
	.target Zevrost
    .xp <20,1
    .dungeon DM
step << Mage
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 3140 >>训练你的职业法术
    .target Pephredo
    .xp <18,1
    .xp >20,1
    .dungeon DM
step << Mage
    #optional
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 1953 >>训练你的职业法术
    .target Pephredo
    .xp <20,1
    .dungeon DM
step << Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
    .train 970 >>训练你的职业法术
    .target Ur'kyo
    .xp <18,1
    .xp >20,1
    .dungeon DM
step << Priest
    #optional
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
    .train 14914 >>训练你的职业法术
    .target Ur'kyo
    .xp <20,1
    .dungeon DM
step
    #ah
    .goto Orgrimmar,55.59,62.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Thathung|r交谈
    >>|cRXP_BUY_购买|r|T132794:0|t[灯油]|cRXP_BUY_从拍卖行购买(如果可能的话)|r
    .collect 814,5,103,1 --Flask of Oil (5)
	.target Auctioneer Thathung
    .dungeon DM
step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .zoneskip Durotar
    .dungeon DM
step
    #label ZepptoSTVforDM
    .goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
    .zone Stranglethorn Vale >>前往: |cRXP_PICK_荆棘谷|r
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
    .goto Westfall,30.01,86.02,200 >>从格罗姆高直接向西游到邪恶礁滩, 然后向北游向西部荒野
    >>|cRXP_WARN_远离该岛. 沿指引点前进以确保安全！|r
    .dungeon DM
step
    #completewith next
    .goto Westfall,30.01,86.02,40 >>前往西部荒野灯塔
    .dungeon DM
step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 103 >>接任务: |cRXP_WARN_长明的灯塔|r
    .target Captain Grayson
    .itemcount 814,5 -- Flask of Oil (5)
    .dungeon DM
step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .turnin 103 >>交任务: |cRXP_FRIENDLY_长明的灯塔|r
    .itemcount 814,5 -- Flask of Oil (5)
    .target Captain Grayson
    .dungeon DM
step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .accept 104 >>接任务: |cRXP_WARN_海岸上的威胁|r
    .target Captain Grayson
    .dungeon DM
step
    .goto Westfall,34.43,83.93
    .line Westfall,34.43,83.93,34.43,83.93,33.88,83.32,33.08,82.86,32.56,82.71,32.08,82.49,31.91,82.36,31.55,81.88,30.86,81.42,30.63,81.16,30.33,80.81,30.02,80.11,29.68,79.22,29.32,78.19,29.29,77.60,29.27,77.31,29.18,76.26,29.07,75.29,28.95,74.14,28.85,73.29,28.79,72.48,28.37,71.94,27.84,71.29,27.44,70.25,27.29,69.47,27.13,68.65,27.09,67.57,27.07,67.01,26.74,66.09,27.07,67.01,27.09,67.57,27.13,68.65,27.29,69.47,27.44,70.25,27.84,71.29,28.37,71.94,28.79,72.48,28.85,73.29,28.95,74.14,29.07,75.29,29.18,76.26,29.27,77.31,29.29,77.60,29.32,78.19,29.68,79.22,30.02,80.11,30.33,80.81,30.63,81.16,30.86,81.42,31.55,81.88,31.91,82.36,32.08,82.49,32.56,82.71,33.08,82.86,33.88,83.32,34.43,83.93
    >>击杀|cRXP_ENEMY_老瞎眼|r. 击败他后搜刮其掉落的|cRXP_LOOT_Scale|r
    >>|cRXP_ENEMY_老瞎眼|r|cRXP_WARN_在长岸一带巡逻. 如果你在长岸没看到他, 就等他刷新到最南边的|cRXP_ENEMY_鱼人|r营地|r
    .complete 104,1 -- Scale of Old Murk-Eye (1)
    .unitscan Old Murk-Eye
    .dungeon DM
step
    .goto Westfall,30.01,86.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_葛瑞森船长|r交谈
    .turnin 104 >>交任务: |cRXP_FRIENDLY_海岸上的威胁|r
    .target Captain Grayson
    .dungeon DM
step
    #optional
    .abandon 103 >>放弃长明的灯塔
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
    .zone 291 >>进入死亡矿井副本传送门. 区域中
    .dungeon DM
step
    .hs >>完成死亡矿井后返回贫瘠之地
    .zone The Barrens >>前往: |cRXP_PICK_贫瘠之地|r
    .use 6948
    .dungeon DM
step
    #optional
    .goto The Barrens,62.05,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板维尔雷|r交谈
	.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
    .target Innkeeper Wiley
    .subzoneskip 392,1
    .dungeon WC
step
    #optional
    .goto The Barrens,51.99,29.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板博兰德|r交谈
	.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
    .target Innkeeper Boorand Plainswind
    .subzoneskip 380,1
    .dungeon DM
step << Warlock
    #completewith TurninDogran
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >>飞往十字路口
    .target Bragok
    .subzoneskip 392,1
    .dungeon WC
step << Warlock
    #completewith TurninDogran
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
	.fly Crossroads >>飞往十字路口
    .zoneskip Orgrimmar,1
    .target Doras
step << Warlock
    #label TurninDogran
    .goto The Barrens,51.93,30.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_加兹罗格|r交谈
    .turnin 1509 >>交任务: |cRXP_FRIENDLY_多格兰的消息|r
    .accept 1510 >>接任务: |cRXP_LOOT_多格兰的消息|r
    .target Gazrog
step << Shaman
    #completewith CallofWater01
    .goto Orgrimmar,45.13,63.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_多拉斯|r交谈
    .fly Ratchet >>飞往棘齿城
    .target Doras
    .zoneskip Orgrimmar,1
step << Shaman
    #optional
    #completewith CallofWater01
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Ratchet >>飞往棘齿城
    .target Bragok
    .subzoneskip 392,1
    .dungeon DM
step << Shaman
    #label CallofWater01
    .goto The Barrens,65.83,43.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_水之先知伊斯伦|r交谈
    .turnin 1528 >>交任务: |cRXP_FRIENDLY_水之召唤|r
    .accept 1530 >>接任务: |cRXP_LOOT_水之召唤|r
    .target Islen Waterseer
step << Shaman
    #completewith next
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >>飞往十字路口
    .target Bragok
step << !Shaman
    #completewith next
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >>飞往十字路口
    .target Bragok
    .subzoneskip 392,1
step
    .goto The Barrens,51.44,30.15
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Helbrim|r交谈
    >>|cRXP_FRIENDLY_Helbrim|r|cRXP_WARN_开启一个45分钟限时任务|r
    .accept 853 >>接任务: |cRXP_LOOT_药剂师扎玛|r
    .target Apothecary Helbrim
    .isQuestTurnedIn 848
    .isQuestAvailable 853
step
    #sticky
    #completewith ZamahTurnin
    +|cRXP_WARN_你正在进行限时任务, 请不要离开. 任务将在领取后20至30分钟自动失败|r
    .isOnQuest 853
step << !Warlock !Shaman
    #completewith TribesTurnin
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Camp Taurajo >>飞往陶拉霍营地
    .target Bragok
    .subzoneskip 392,1
    .dungeon WC
step << Shaman
    #completewith TribesTurnin
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Camp Taurajo >>飞往陶拉霍营地
    .target Bragok
step << !Shaman
    #completewith TribesTurnin
    .goto The Barrens,51.50,30.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪弗拉克|r交谈
    .fly Camp Taurajo >>飞往陶拉霍营地
    .target Devrak
    .subzoneskip 380,1
step
    .goto The Barrens,44.55,59.27
    >>击杀|cRXP_ENEMY_Bristleback Quillboars|r. 击败它们有几率掉落 |T134128:0|t[|cRXP_LOOT_血岩碎片|r]
    .collect 5075 --Blood Shard (1)
    .mob Bristleback Water Seeker
    .mob Bristleback Thornweaver
    .mob Bristleback Geomancer
step
    #label TribesTurnin
    .goto The Barrens,44.55,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
    .turnin 878 >>交任务: |cRXP_FRIENDLY_野猪人的内战|r
    .accept 5052 >>接任务: |cRXP_LOOT_阿迦玛甘的血岩碎片|r
    .turnin 5052 >>交任务: |cRXP_FRIENDLY_阿迦玛甘的血岩碎片|r
    .target Mangletooth
    .addquestitem 5075,5052
step
    #optional
    #completewith Thunderhawk
    .goto The Barrens,44.55,59.27,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
    +|cRXP_WARN_使用你的|r|T134128:0|t[|cRXP_LOOT_血岩碎片|r]|cRXP_WARN_来获取增益效果. 至少保存4个以备后用|r
    +|cRXP_WARN_请确保关闭 Questie 或 Leatrix Plus 等插件的自动完成功能！|r
    .target Mangletooth
step
    #label IshamuhaleTurnin
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 882 >>交任务: |cRXP_FRIENDLY_伊沙姆哈尔|r
    .accept 907 >>接任务: |cRXP_LOOT_被激怒的雷霆蜥蜴|r
    .target Jorn Skyseer
step
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .accept 883 >>接任务: |cRXP_LOOT_拉克塔曼尼|r
    .turnin 883 >>交任务: |cRXP_FRIENDLY_拉克塔曼尼|r
    .target Jorn Skyseer
    .itemcount 5099,1
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
    >>击杀|cRXP_ENEMY_雷霆蜥蜴|r. 击败它们后搜刮其|cRXP_LOOT_鲜血|r
    .complete 907,1 --Thunder Lizard Blood (3)
    .mob Thunderhead
    .mob Stormsnout
step
    #label Thunderhawk
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jorn|r交谈
    .turnin 907 >>交任务: |cRXP_FRIENDLY_被激怒的雷霆蜥蜴|r
    .accept 913 >>接任务: |cRXP_LOOT_雷鹰的嘶鸣|r
    .target Jorn Skyseer
step << Shaman
    #completewith CallofWater2
    .goto The Barrens,43.42,77.41,60>>向南前往|cRXP_FRIENDLY_布瑞恩|r
step << Shaman
    #completewith next
    >>击杀一只|cRXP_ENEMY_Thunderhawk|r. 击败后搜刮其|cRXP_LOOT_Wings|r
    .complete 913,1 --Thunderhawk Wings (1)
    .mob Thunderhawk Hatchling
    .mob Thunderhawk Cloudscraper
    .mob Greater Thunderhawk
step << Shaman
    #label CallofWater2
    .goto The Barrens,43.42,77.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞恩|r交谈
    .turnin 1530 >>交任务: |cRXP_FRIENDLY_水之召唤|r
    .accept 1535 >>接任务: |cRXP_LOOT_水之召唤|r
    .target Brine
step << Shaman
    .goto The Barrens,44.22,76.75
    .use 7766 >>在布林小屋下方的水坑里灌满你的|T132825:0|[空的棕色水囊]
    .complete 1535,1 --Filled Brown Waterskin (1)
step << Shaman
    .goto The Barrens,43.42,77.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞恩|r交谈
    .turnin 1535 >>交任务: |cRXP_FRIENDLY_水之召唤|r
    .accept 1536 >>接任务: |cRXP_LOOT_水之召唤|r
    .target Brine
step << Shaman
    #completewith ThunderhawkTurnin
    .goto The Barrens,44.85,59.14,200 >>返回陶拉祖营地
step
    #loop
    .goto The Barrens,44.83,63.12,0
    .goto The Barrens,44.83,63.12,60,0
    .goto The Barrens,46.57,61.33,60,0
    .goto The Barrens,48.99,58.69,60,0
    .goto The Barrens,45.45,56.69,60,0
    .goto The Barrens,43.41,56.96,60,0
    >>击杀一只|cRXP_ENEMY_Thunderhawk|r. 击败后搜刮其|cRXP_LOOT_Wings|r
    .complete 913,1 --Thunderhawk Wings (1)
    .mob Thunderhawk Hatchling
    .mob Thunderhawk Cloudscraper
step
    #label ThunderhawkTurnin
    .goto The Barrens,44.85,59.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔恩·星眼|r交谈
    .turnin 913 >>交任务: |cRXP_FRIENDLY_雷鹰的嘶鸣|r
    .accept 874 >>接任务: |cRXP_LOOT_玛伦·星眼|r
    .target Jorn Skyseer
step << !Tauren
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_碎牙|r交谈
    .aura 16618 >>|cRXP_WARN_If you have 10|r |T134128:0|t[|cRXP_LOOT_Blood Shards|r |cRXP_WARN_left, use them to obtain|r |T136022:0|t[接任务: |cRXP_WARN_风之魂|r] |cRXP_WARN_from|r |cRXP_FRIENDLY_Mangletooth|r
    >>|cRXP_WARN_如果已有雷霆崖的飞行路径, 请跳过此步骤|r
    .itemcount 5075,10
    .target Mangletooth
step << !Tauren
    #completewith next
    .goto Mulgore,68.68,60.34,120,0
    .zone Mulgore >>前往: |cRXP_PICK_莫高雷|r
step << !Tauren
    #completewith DeathDUPpickup
    .goto Thunder Bluff,31.78,65.92
    .zone Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    >>|cRXP_WARN_如果你有雷霆崖的飞行路径, 请直接飞往那里|r
step << Tauren
    #completewith DeathDUPpickup
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Omusa Thunderhorn
step << Undead Warrior/Orc Warrior/Troll Warrior
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 199 >>训练双手锤
    .train 227 >>训练法杖
    .target Ansekhwa
step << Troll Hunter/Orc Hunter/Undead Warrior/Warlock/Priest
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 227 >>训练法杖
    .target Ansekhwa
step << Rogue
    .goto Thunder Bluff,40.93,62.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安塞瓦|r交谈
    .train 198 >>训练锤类武器
    .target Ansekhwa
step << Rogue
    .goto Thunder Bluff,38.95,64.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_库鲁克|r|cRXP_BUY_交谈. 从他那里购买|r|T135423:0|t[破损的致命飞斧]|r
    .collect 3137,200,6544,1 --Deadly Throwing Axe (200)
    .target Kuruk
step
    .goto Thunder Bluff,47.12,57.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_彻斯姆|r交谈
    .bankdeposit 5075 >>存入你的 |T134128:0|t[血岩碎片]
    .target Chesmu
step
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将你的炉石设置为雷霆崖
    .target Innkeeper Pala
    .dungeon !WC
step
    #completewith next
    .goto Thunder Bluff,28.14,32.97,40,0
    .goto Thunder Bluff,28.51,28.95,10 >>前往灵魂高地, 进入幻视之池
step
    #sticky
    #completewith DeathDUPpickup
    .goto Thunder Bluff,28.55,25.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉丽丝|r交谈
    .accept 264 >>接任务: |cRXP_WARN_至死方休|r
    .target Clarice Foster
    .dungeon !WC
step
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >>交任务: |cRXP_FRIENDLY_药剂师扎玛|r
    .accept 962 >>接任务: |cRXP_LOOT_毒蛇花|r
    .target Apothecary Zamah
    .isOnQuest 853
    .dungeon WC
step
    #optional
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .accept 962 >>接任务: |cRXP_LOOT_毒蛇花|r
    .target Apothecary Zamah
    .dungeon WC
step
    #optional
    #label ZamahTurnin
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 853 >>交任务: |cRXP_FRIENDLY_药剂师扎玛|r
    .target Apothecary Zamah
    .isOnQuest 853
step << Priest
    .goto Thunder Bluff,25.31,15.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迈尔斯|r交谈
    .accept 5644 >>接任务: |cRXP_LOOT_噬灵瘟疫|r << Undead Priest
    .accept 5642 >>接任务: |cRXP_WARN_暗影守卫|r << Troll Priest
    .trainer >>训练你的职业法术
    .target Miles Welsh
step << Mage
    .goto Thunder Bluff,22.74,14.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shymm|r交谈
    .train 12051 >>训练你的职业法术
    .target Archmage Shymm
    .xp <20,1
    .xp >22,1
step << Mage
    #optional
    .goto Thunder Bluff,22.74,14.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shymm|r交谈
    .train 2138 >>训练你的职业法术
    .target Archmage Shymm
    .xp <22,1
step
    #optional
    #label DeathDUPpickup
step << Shaman
    .goto Thunder Bluff,23.64,18.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
    .train 2645 >>训练你的职业法术
    .target Tigor Skychaser
    .xp <20,1
    .xp >22,1
step << Shaman
    #optional
    .goto Thunder Bluff,23.64,18.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_提戈尔·逐星|r交谈
    .train 8498 >>训练你的职业法术
    .target Tigor Skychaser
    .xp <22,1
step
    #completewith next
    .skill firstaid,80 >>|cRXP_WARN_创建|r|T133688:0|t[厚亚麻绷带]|cRXP_WARN_直到你的技能达到80级或更高|r
    .skill firstaid,<1,1
step
    .goto Thunder Bluff,29.68,21.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Pand|r交谈
    >>|cRXP_WARN_如果未达到足够的|r|T132889:0|t[亚麻布]|cRXP_WARN_技能等级, 请跳过此步骤|r
    .train 3277 >>训练 |T133684:0|t[绒线绷带]
    .train 7934 >>训练 |T134437:0|t[抗毒药剂] << Rogue
    .target Pand Stonebinder
    .skill firstaid,<1,1
step << Rogue
    >>|cRXP_WARN_创建|r |T134437:0|t[抗毒药剂] |cRXP_WARN_如果你发现任何|r |T134339:0|t[小毒囊]
    >>|cRXP_WARN_稍后再保存它们|r
    .collect 6452,1 --Anti Venom
    .itemcount 1475,1
step
    #completewith next
    .goto Thunder Bluff,69.88,30.90,80 >>前往长者高地
step
    .goto Thunder Bluff,78.61,28.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈穆尔|r交谈
    .turnin 1489 >>交任务: |cRXP_FRIENDLY_哈缪尔·符文图腾|r
    .accept 1490 >>接任务: |cRXP_LOOT_纳拉·蛮鬃|r
    .target Arch Druid Hamuul Runetotem
step
    .goto Thunder Bluff,75.65,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与纳拉(|cRXP_FRIENDLY_Nara|r)交谈
    .turnin 1490 >>交任务: |cRXP_FRIENDLY_纳拉·蛮鬃|r
    .accept 914 >>接任务: |cRXP_WARN_尖牙德鲁伊|r
    .target Nara Wildmane
    .dungeon WC
step
    .goto Thunder Bluff,75.65,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与纳拉(|cRXP_FRIENDLY_Nara|r)交谈
    .turnin 1490 >>交任务: |cRXP_FRIENDLY_纳拉·蛮鬃|r
    .target Nara Wildmane
step << Druid
    .goto Thunder Bluff,76.48,27.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Turak|r交谈
    .trainer >>训练你的职业法术
    .accept 27 >>接任务: |cRXP_LOOT_必修的课程|r
    .target Turak Runetotem
step << Druid
    #completewith next
    .cast 18960 >>施放 |T135758:0|t[传送:月光林地]
    .zoneskip Moonglade
step << Druid
    .goto Moonglade,56.21,30.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dendrite|r交谈
    .turnin 27 >>交任务: |cRXP_FRIENDLY_必修的课程|r
    .accept 28 >>接任务: |cRXP_LOOT_湖中试炼|r
    .target Dendrite Starblaze
step << Druid
    #completewith next
    .goto Moonglade,54.30,55.68
    .collect 15877,1,28,1 >>在湖底拾取|cRXP_PICK_神殿灵珠容器|r, 获得一个 |T134125:0|t[神殿灵珠]
    >>|cRXP_WARN_在抵达宝珠正上方之前, 切勿下潜入水|r
step << Druid
    .goto Moonglade,36.40,42.01
    .cast 19719 >>在雷姆洛斯神殿使用 |T134125:0|t[神殿灵珠]
    .complete 28,1 -- Complete the Trial of the Lake
    .use 15877
step << Druid
    .goto Moonglade,36.52,40.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔加里|r交谈
    .turnin 28 >>交任务: |cRXP_FRIENDLY_湖中试炼|r
    .accept 30 >>接任务: |cRXP_LOOT_海狮试炼|r
    .target Tajarri
step << Druid
    #completewith FlyXroads2
    .hs >>炉石传送至雷霆崖
    .use 6948
    .cooldown item,6948,>0
    .dungeon !WC
step << Druid
    #completewith FlyXroads2
    .goto Moonglade,44.29,45.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑟恩·草风|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Bunthen Plainswind
    .dungeon WC
step << Druid
    #completewith FlyXroads2
    .goto Moonglade,44.29,45.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑟恩·草风|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Bunthen Plainswind
    .cooldown item,6948,<0
    .dungeon !WC
step << Hunter
    #completewith HunterTraining2
    .goto Thunder Bluff,61.31,78.25,60 >>前往猎人高地
step << Hunter
    .goto Thunder Bluff,59.13,86.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
    .train 5118 >>训练你的职业法术
    .target Urek Thunderhorn
    .xp <20,1
    .xp >22,1
step << Hunter
    #label HunterTraining2
    #optional
    .goto Thunder Bluff,59.13,86.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌瑞克|r交谈
    .train 5118 >>训练你的职业法术
    .target Urek Thunderhorn
    .xp <22,1
step << Hunter
    .goto Thunder Bluff,54.07,84.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hesuwa|r交谈
    .train 24494 >>训练你的宠物法术
    .target Hesuwa Thunderhorn
step << Warrior
    #completewith next
    .goto Thunder Bluff,61.31,78.25,60 >>前往猎人高地
step << Warrior
    .goto Thunder Bluff,57.27,87.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔姆交谈|cRXP_FRIENDLY_TORM|r
    .train 845 >>训练你的职业法术
    .accept 1823 >>接任务: |cRXP_LOOT_和鲁迦交谈|r
    .target Torm Ragetotem
step << Rogue
    .goto Thunder Bluff,53.00,56.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kard|r|cRXP_BUY_交谈. 从他那里购买一把|r|T135324:0|t[长剑]|r
    .collect 923,1,493,1 --Collect Longsword (1)
    .money <0.8743
    .target Kard Ragetotem
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
step << Rogue
    #completewith KayaLives
    +装备 |T135324:0|t[长剑]
    .use 923
    .itemcount 923,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.1
    .xp <21,1
step << Warrior/Shaman
    #completewith next
    #ah
    +|cRXP_FRIENDLY_如果更便宜, 你可以从拍卖行购买一把绿色武器替代|r
step << Warrior
    .goto Thunder Bluff,53.21,58.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Etu|r|cRXP_BUY_交谈. 从他那里购买|r|T135157:0|t[占卜法杖]|r
    .collect 928,1,493,1 --Collect Long Staff (1)
    .money <0.9860
    .target Etu Ragetotem
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
step << Warrior
    #completewith KayaLives
    +装备 |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
step << Shaman
    .goto Thunder Bluff,53.21,58.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Etu|r|cRXP_BUY_交谈. 从他那里购买|r|T135157:0|t[占卜法杖]|r
    .collect 928,1,493,1 --Collect Long Staff (1)
    .money <0.9860
    .target Etu Ragetotem
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
step << Shaman
    #completewith KayaLives
    +装备 |T135157:0|t[占卜法杖]
    .use 928
    .itemcount 928,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<15.2
step << Shaman
    #season 2
    .goto Thunder Bluff,53.21,58.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Etu|r|cRXP_BUY_交谈. 从他那里购买|r|T133476:0|t[尖刺流星锤]|r
    .collect 925,1,493,1 --Collect Flail (1)
    .money <0.7797
    .target Etu Ragetotem
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Shaman
    #season 2
    #completewith KayaLives
    +装备 |T133476:0|t[尖刺流星锤]
    .use 925
    .itemcount 925,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<11.8
step << Hunter
    .goto Thunder Bluff,46.98,45.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kuna|r|cRXP_BUY_交谈. 从她那里购买|r|T135489:0|t[重型弯弓]|r
    .collect 3027,1,493,1 --Collect Heavy Recurve Bow (1)
    .money <0.5643
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.1
    .target Kuna Thunderhorn
step << Hunter
    #completewith KayaLives
    +装备 |T135489:0|t[重型弯弓]
    .use 3027
    .itemcount 3027,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.1
step << Hunter
    .goto Thunder Bluff,46.98,45.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Kuna交谈|r
    >>|cRXP_BUY_从她那里购买|r|T132382:0|t[锋利的箭]|r
    .collect 2515,1600,493,1 << Hunter --Sharp Arrow (1600)
    .target Kuna Thunderhorn
step
    #sticky
    #completewith EnterWC
    .subzone 718 >>现在你应该找一个队伍去哀嚎洞穴
    .dungeon WC
step
    #label FlyXroads2
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .fly Crossroads >>飞往十字路口
    .target Tal
    .zoneskip The Barrens
step
    #completewith next
    .goto The Barrens,45.66,40.34,120 >>前往茂密水泉绿洲
    .isQuestTurnedIn 851
step
    #loop
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
    >>找到并击杀赫兹鲁尔·血印, 他在湖边巡逻. 击败他后可获得他的头颅
    .complete 852,1 --Hezrul's Head
    .unitscan Hezrul Bloodmark
    .isQuestTurnedIn 851
step
    .goto The Barrens,46.15,36.93,100 >>前往哀嚎洞穴
    .isOnQuest 914
    .dungeon WC
step
    #completewith next
    .goto The Barrens,46.95,35.18,0
    .goto The Barrens,46.95,35.18,30,0
    .goto The Barrens,46.83,34.74,20,0
    .goto Kalimdor,51.98,55.36,20,0
    .goto Kalimdor,51.89,55.55,10,0
    .goto Kalimdor,51.87,55.50,10 >>前往哀嚎洞穴附近的山丘, 到达会面石处
    >>|cRXP_WARN_请仔细跟随箭头, 抵达隐藏的洞穴|r
    .dungeon WC
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    >>|cRXP_WARN_它们位于哀嚎洞穴入口上方|r
    .accept 1486 >>接任务: |cRXP_LOOT_变异皮革|r
    .target +Nalpak
    .goto Kalimdor,51.91,55.42
    .accept 1487 >>接任务: |cRXP_WARN_清除变异者|r
    .goto Kalimdor,51.92,55.44
    .target +Ebru
    .dungeon WC
step
    #completewith EnterWC
    >>拾取地面上的|cRXP_LOOT_毒蛇花|r
    >>|cRXP_WARN_如果您只进行1次任务, 建议最多3名玩家尝试完成此任务. 因为|r|cRXP_LOOT_毒蛇花|r|cRXP_WARN_资源不足以满足所有人需求|r|r
    .complete 962,1 --Serpentbloom (10)
    .isOnQuest 962
    .dungeon WC
step
    #completewith EnterWC
    >>杀死你看到的所有|cRXP_ENEMY_Deviate Beasts|r, 击杀后掠夺它们的|cRXP_LOOT_Hides|r
    >>|cRXP_WARN_建议如果您只进行1次任务, 最多由3名玩家尝试完成. 因为|r|cRXP_LOOT_Hides|r|cRXP_WARN_资源不足以满足所有人需求|r
    .complete 1486,1 --Deviate Hide (20)
    .dungeon WC
    .isOnQuest 1486
    --Too many .mobs, would clutter target box
step
    #completewith EnterWC
    >>击杀|cRXP_ENEMY_Ectoplasms|r. 击败它们以获取其|cRXP_LOOT_Essence|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC
step
    #loop
    .goto Kalimdor,52.15,55.15,0
    .goto Kalimdor,51.90,55.43,30,0
    .goto Kalimdor,51.97,55.23,30,0
    .goto Kalimdor,51.82,54.86,30,0
    .goto Kalimdor,52.01,55.02,30,0
    .goto Kalimdor,52.15,55.15,30,0
    >>击杀|cRXP_ENEMY_疯狂的马格利什|r. 击败他后搜刮物品, 获得|cRXP_LOOT_99年波尔多陈酿|r
    .complete 959,1 --99-Year-Old Port (1)
    .mob Mad Magglish
    .isOnQuest 959
    .dungeon WC
step
    #label EnterWC
    .goto Kalimdor,51.89,54.77,20,0
    .goto Kalimdor,51.95,54.56,20,0
    .goto Kalimdor,52.27,54.65,30,0
    .goto Kalimdor,52.40,55.20,30 >>进入WC副本传送门. 进入区域
    .dungeon WC
step
    #completewith GlowingShard
    >>拾取地面上的|cRXP_LOOT_毒蛇花|r
    >>|cRXP_WARN_如果您只进行1次任务, 建议最多3名玩家尝试完成此任务. 因为|r|cRXP_LOOT_毒蛇花|r|cRXP_WARN_资源不足以满足所有人需求|r|r
    .complete 962,1 --Serpentbloom (10)
    .isOnQuest 962
    .dungeon WC
step
    #completewith GlowingShard
    >>击杀|cRXP_ENEMY_Ectoplasms|r. 击败它们以获取其|cRXP_LOOT_Essence|r
    >>|cRXP_WARN_建议如果您只进行1次任务, 最多由3名玩家尝试完成. 因为|r|cRXP_LOOT_Hides|r|cRXP_WARN_资源不足以满足所有人需求|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC
step
    #completewith GlowingShard
    >>击杀 |cRXP_ENEMY_变异破坏者|r和|cRXP_ENEMY_毒蛇|r和|cRXP_ENEMY_行尸走肉|r和 |cRXP_ENEMY_厄运巨齿兽|r
    .complete 1487,1 --Deviate Ravager (7)
    .mob +Deviate Ravager
    .complete 1487,2 --Deviate Viper (7)
    .mob +Deviate Viper
    .complete 1487,3 --Deviate Shambler (7)
    .mob +Deviate Shambler
    .complete 1487,4 --Deviate Dreadfang (7)
    .mob +Deviate Dreadfang
    .complete 1486,1 --Deviate Hide (20)
    .isOnQuest 1487
    .dungeon WC
step
    #label Gems
    >>击杀|cRXP_ENEMY_考布莱恩|r和|cRXP_ENEMY_安娜科德拉|r和|cRXP_ENEMY_皮萨斯|r和|cRXP_ENEMY_瑟芬迪斯|r, 从他们身上搜刮|cRXP_LOOT_宝石|r
    .complete 914,1 --Gem of Cobrahn (1)
    .mob +Lord Cobrahn
    .complete 914,2 --Gem of Anacondra (1)
    .mob +Lady Anacondra
    .complete 914,3 --Gem of Pythas (1)
    .mob +Lord Pythas
    .complete 914,4 --Gem of Serpentis (1)
    .mob +Lord Serpentis
    .isOnQuest 914
    .dungeon WC
    .dungeon WC
step
    #requires Gems
    #completewith next
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t与哀嚎洞穴入口处的|cRXP_FRIENDLY_纳拉雷克斯信徒|r交谈. 护送他安全抵达纳拉雷克斯处
    .target Disciple of Naralex
    .skipgossip
    .dungeon WC
step
    #label GlowingShard
    >>一旦你到达|cRXP_FRIENDLY_纳拉雷克斯|r, 将先后遭遇两波敌人攻击, 最终面对|cRXP_ENEMY_吞噬者穆坦努斯|r的袭击
    >>Kill him and loot him for the |T135229:0|t[|cRXP_LOOT_交任务: |cRXP_FRIENDLY_发光的碎片|r|r]
    .collect 10441,1,6981,1 --Collect 交任务: |cRXP_FRIENDLY_发光的碎片|r (x1)
    .mob Mutanus the Devourer
    .dungeon WC
step
    #completewith DeviateRaptors
    >>击杀|cRXP_ENEMY_Ectoplasms|r. 击败它们以获取其|cRXP_LOOT_Essence|r
    .complete 1491,1 --Wailing Essence (6)
    .isOnQuest 1491
    .dungeon WC
step
    #completewith DeviateRaptors
    >>拾取地面上的|cRXP_LOOT_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .isOnQuest 962
    .dungeon WC
step
    >>击杀 |cRXP_ENEMY_变异破坏者|r和|cRXP_ENEMY_毒蛇|r和|cRXP_ENEMY_行尸走肉|r和 |cRXP_ENEMY_厄运巨齿兽|r
    .complete 1487,1 --Deviate Ravager (7)
    .mob +Deviate Ravager
    .complete 1487,2 --Deviate Viper (7)
    .mob +Deviate Viper
    .complete 1487,3 --Deviate Shambler (7)
    .mob +Deviate Shambler
    .complete 1487,4 --Deviate Dreadfang (7)
    .mob +Deviate Dreadfang
    .complete 1486,1 --Deviate Hide (20)
    .isOnQuest 1487
    .isOnQuest 1486
    .dungeon WC
 step
    >>击杀 |cRXP_ENEMY_变异破坏者|r和|cRXP_ENEMY_毒蛇|r和|cRXP_ENEMY_行尸走肉|r和 |cRXP_ENEMY_厄运巨齿兽|r
    .complete 1487,1 --Deviate Ravager (7)
    .mob +Deviate Ravager
    .complete 1487,2 --Deviate Viper (7)
    .mob +Deviate Viper
    .complete 1487,3 --Deviate Shambler (7)
    .mob +Deviate Shambler
    .complete 1487,4 --Deviate Dreadfang (7)
    .mob +Deviate Dreadfang
    .isOnQuest 1487
    .dungeon WC
step
    #label DeviateRaptors
    >>击杀|cRXP_ENEMY_Deviate Raptors|r
    .complete 1486,1 --Deviate Hide (20)
    .mob Deviate Ravager
    .mob Deviate Viper
    .mob Deviate Shambler
    .mob Deviate Dreadfang
    .isOnQuest 1486
    .dungeon WC
step
    #completewith next
    >>拾取地面上的|cRXP_LOOT_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .isOnQuest 962
    .dungeon WC
step
    >>击杀|cRXP_ENEMY_Ectoplasms|r. 击败它们以获取其|cRXP_LOOT_Essence|r
    .complete 1491,1 --Wailing Essence (6)
    .mob Devouring Ectoplasm
    .mob Evolving Ectoplasm
    .mob Nightmare Ectoplasm
    .isOnQuest 1491
    .dungeon WC
step
    >>拾取地面上的|cRXP_LOOT_毒蛇花|r
    .complete 962,1 --Serpentbloom (10)
    .isOnQuest 962
    .dungeon WC
step
    #completewith GlowingShardRP
    .hs >>传送回棘齿城
    .use 6948
    .dungeon WC
step
    .goto The Barrens,63.09,37.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bigglefuzz|r交谈
    .turnin 959 >>交任务: |cRXP_FRIENDLY_港口的麻烦|r
    .target Crane Operator Bigglefuzz
    .isQuestComplete 959
    .dungeon WC
step
    .goto The Barrens,62.37,37.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mebok|r交谈
    .turnin 1491 >>交任务: |cRXP_FRIENDLY_智慧饮料|r
    .target Mebok Mizzyrix
    .isQuestComplete 1491
    .dungeon WC
step
    .use 10441 >>Use the |T135229:0|t[|cRXP_LOOT_交任务: |cRXP_FRIENDLY_发光的碎片|r|r] to accept the quest
    .accept 6981 >>接任务: |cRXP_WARN_发光的碎片|r
    .itemcount 10441,1
    .dungeon WC
step
    #label GlowingShardRP
    .goto The Barrens,62.99,37.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯布特瓦夫|r交谈
    .complete 6981,1 --Speak with someone in Ratchet about the 交任务: |cRXP_FRIENDLY_发光的碎片|r
    .skipgossip
    .target Sputtervalve
    .isOnQuest 6981
    .dungeon WC
step
    .goto The Barrens,63.09,37.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布拉高克|r交谈
    .fly Crossroads >>飞往十字路口
    .target Bragok
    .isOnQuest 6981
    .dungeon WC
step
    #completewith next
    .goto The Barrens,50.49,34.36,20,0
    .goto The Barrens,49.61,34.54,20,0
    .goto The Barrens,49.14,34.02,20,0
    .goto The Barrens,48.18,32.78,50 >>向上攀登山顶
    .dungeon WC
step
    .goto The Barrens,48.18,32.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Falla|r交谈
    .turnin 6981 >>交任务: |cRXP_FRIENDLY_发光的碎片|r
    .accept 3369 >>接任务: |cRXP_WARN_在噩梦中|r
    .target Falla Sagewind
    .isOnQuest 6981
    .dungeon WC
step
    .goto The Barrens,48.18,32.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Falla|r交谈
    .accept 3369 >>接任务: |cRXP_WARN_在噩梦中|r
    .target Falla Sagewind
    .isQuestTurnedIn 6981
    .dungeon WC
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳尔帕克|r和|cRXP_FRIENDLY_厄布鲁|r交谈
    >>|cRXP_WARN_它们位于哀嚎洞穴入口上方|r
    .turnin 1486 >>交任务: |cRXP_FRIENDLY_变异皮革|r
    .target +Nalpak
    .goto Kalimdor,51.91,55.42
    .turnin 1487 >>交任务: |cRXP_FRIENDLY_清除变异者|r
    .target +Ebru
    .goto Kalimdor,51.92,55.44
    .isQuestComplete 1487
    .isQuestComplete 1486
    .dungeon WC
step
    .goto Kalimdor,51.92,55.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄布鲁|r交谈
    >>|cRXP_WARN_他位于哀嚎洞穴入口上方|r
    .turnin 1487 >>交任务: |cRXP_FRIENDLY_清除变异者|r
    .target Ebru
    .isQuestComplete 1487
    .dungeon WC
step
    .goto Kalimdor,51.91,55.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与纳尔帕克(|cRXP_FRIENDLY_Nalpak|)交谈|
    >>|cRXP_WARN_他位于哀嚎洞穴入口上方|r
    .turnin 1486 >>交任务: |cRXP_FRIENDLY_变异皮革|r
    .target Nalpak
    .isQuestComplete 1486
    .dungeon WC
step
    #completewith next
    .goto The Barrens,44.45,59.16,100 >>向南前往陶拉乔营地
    .dungeon WC
step
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Omusa Thunderhorn
    .dungeon WC
step
    .goto Thunder Bluff,75.65,31.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与纳拉(|cRXP_FRIENDLY_Nara|r)交谈
    .turnin 914 >>交任务: |cRXP_FRIENDLY_尖牙德鲁伊|r
    .target Nara Wildmane
    .isQuestComplete 914
    .dungeon WC
step
    .goto Thunder Bluff,78.61,28.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈穆尔|r交谈
    .turnin 3369 >>交任务: |cRXP_FRIENDLY_在噩梦中|r
    .target Arch Druid Hamuul Runetotem
    .isOnQuest 3369
    .dungeon WC
step
    .goto Thunder Bluff,23.0,21.0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 962 >>交任务: |cRXP_FRIENDLY_毒蛇花|r
    .target Apothecary Zamah
    .isQuestComplete 962
    .dungeon WC
step
    .goto Thunder Bluff,28.55,25.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉丽丝|r交谈
    .accept 264 >>接任务: |cRXP_WARN_至死方休|r
    .target Clarice Foster
    .dungeon WC
step
    .goto Thunder Bluff,45.83,64.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板帕拉|r交谈
    .home >>将你的炉石设置为雷霆崖
    .target Innkeeper Pala
    .dungeon WC
step
    #completewith SerenaKill
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .fly Crossroads >>飞往十字路口
    .target Tal
    .zoneskip Thunder Bluff,1
    .dungeon WC
step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 852 >>交任务: |cRXP_FRIENDLY_赫兹鲁尔·血印|r
    .target Regthar Deathgate
    .isQuestComplete 852
step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 855 >>交任务: |cRXP_FRIENDLY_半人马护腕|r
    .target Regthar Deathgate
    .isQuestComplete 855
step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .accept 4021 >>接任务: |cRXP_LOOT_人马无双！|r
    --.timer 183,Warlord Krom'zar Spawn
    .target Regthar Deathgate
    .isQuestTurnedIn 852
    .group
    --timer is random, generally somewhere between 120-210 seconds
step
    .goto The Barrens,44.48,28.15
    >>击杀出现的|cRXP_ENEMY_Warlord Krom'zar|r, 拾取他掉落的|cRXP_PICK_Banner|r
    >>|cRXP_WARN_小心！他是一名强大的精英, 至少由|r |cRXP_ENEMY_Kolkar|r |cRXP_WARN_mobs两名守卫看护|r
    >>|cRXP_WARN_他最多需要3分钟才会出现|r
    .complete 4021,1 --Piece of Krom'zar's Banner (1)
    .unitscan Warlord Krom'zar
    .group 3
    .isQuestTurnedIn 852
step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 4021 >>交任务: |cRXP_FRIENDLY_人马无双！|r
    .target Regthar Deathgate
    .isQuestComplete 4021
    .group
step
    .goto The Barrens,45.35,28.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷戈萨·死门|r交谈
    .turnin 855 >>交任务: |cRXP_FRIENDLY_半人马护腕|r
    .target Regthar Deathgate
    .isQuestComplete 855
    .group
step
    #optional
    >>如果你尚未完成, 请放弃半人马护腕
    .abandon 855 >>放弃半人马护腕
    .isOnQuest 855
step
    #label SerenaKill
    .goto The Barrens,39.16,12.16
    >>击杀|cRXP_ENEMY_塞瑞娜·血羽|r. 击败她后掠夺她的|cRXP_LOOT_头|r
    .complete 876,1 --Serena's Head (1)
    .mob Serena Bloodfeather
step
    #completewith next
    .goto The Barrens,52.09,30.43,120 >>前往十字路口
step
    #label ApothecaryPickup
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_科兰|r和|cRXP_FRIENDLY_科兰|r交谈
    .turnin 876 >>交任务: |cRXP_FRIENDLY_塞瑞娜·血羽|r
    .accept 1060 >>接任务: |cRXP_LOOT_写给金吉尔的信|r
    .target +Darsok Swiftdagger
    .goto The Barrens,51.62,30.90
    .accept 868 >>接任务: |cRXP_LOOT_蝎卵|r
    .target +Korran
    .goto The Barrens,51.10,29.60
step
    #completewith next
    .zone Stonetalon Mountains >>前往: |cRXP_PICK_石爪山脉|r
    .zoneskip Stonetalon Mountains
step
    #map Stonetalon Mountains
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Seereth|r和|cRXP_FRIENDLY_Makaba|r交谈
    .turnin 1062 >>交任务: |cRXP_FRIENDLY_地精侵略者|r
    .timer 4,Goblin Invaders RP
    .accept 1063 >>接任务: |cRXP_LOOT_长者|r
    .accept 1068 >>接任务: |cRXP_LOOT_伐木机|r
    .target +Seereth Stonebreak
    .goto The Barrens,35.26,27.88
    .turnin 6629 >>交任务: |cRXP_FRIENDLY_杀死格鲁迪格·暗云|r
    .turnin 6523 >>交任务: |cRXP_FRIENDLY_保护卡雅|r
    .accept 6401 >>接任务: |cRXP_LOOT_卡雅还活着|r
    .target +Makaba Flathoof
    .goto The Barrens,35.19,27.79
step
    #completewith next
    .goto Stonetalon Mountains,82.57,98.63,60,0
    .goto Stonetalon Mountains,80.10,98.20,40,0
    .goto Stonetalon Mountains,77.17,98.61,40 >>沿着左侧的路径向上前进
step
    .goto Stonetalon Mountains,74.54,97.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Jin'Zil|r交谈
    .turnin 1060 >>交任务: |cRXP_FRIENDLY_写给金吉尔的信|r
    .accept 1058 >>接任务: |cRXP_LOOT_金吉尔的森林魔法|r
    .target Witch Doctor Jin'Zil
step << Warlock
    .goto Stonetalon Mountains,73.25,95.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Ken'zigla|r交谈
    .turnin 1510 >>交任务: |cRXP_FRIENDLY_多格兰的消息|r
    .accept 1511 >>接任务: |cRXP_LOOT_肯兹格拉的伤药|r
    .target Ken'zigla
step
    .goto Stonetalon Mountains,71.25,95.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xen'Zilla|r交谈
    .turnin 6461 >>交任务: |cRXP_FRIENDLY_盗窃的蜘蛛|r
    .target Xen'Zilla
step << skip
    .goto Stonetalon Mountains,74.69,98.10
    .goto Thunder Bluff,56.65,18.96,30 >>|cRXP_WARN_跳上其中一个笼子, 通过登出再重新登录来实现登出跳过|r
    .link https://www.youtube.com/watch?v=cp2YI86AO4Y&ab >>|cRXP_WARN_点击此处查看示例|r
    .solo
step
    #completewith next
    .goto Stonetalon Mountains,67.41,87.92,60,0
    .goto Stonetalon Mountains,65.93,89.87,40,0
    .goto Stonetalon Mountains,63.66,93.80,40,0
    .goto Stonetalon Mountains,61.75,93.06,40 >>前往滚岩峡谷并进入北部洞穴
    .group
step
    .goto Stonetalon Mountains,60.16,90.92,30,0
    .goto Stonetalon Mountains,58.44,89.90
    >>攻击|cRXP_PICK_共鸣水晶|r, 并深入洞穴足够远以调查该区域
    >>|cRXP_WARN_小心！这些怪物比看起来更难对付, 很容易被双倍拉仇恨. |r|cRXP_ENEMY_高戈护石者|r|cRXP_WARN_施法|r|T136026:0|t[大地震击]|cRXP_WARN_会造成大量伤害！|r
    .complete 6421,1 --Investigate Cave in Boulderslide Ravine
    .complete 6421,2 --Resonity Crystal (x10)
    .isOnQuest 6421
    .group
step << skip
    #completewith next
    .goto Stonetalon Mountains,64.62,93.86,25,0
    .goto Stonetalon Mountains,64.80,95.27,20,0
    .goto Stonetalon Mountains,64.32,95.84,15 >>进入滚岩峡谷南部的洞穴
    .group
step << skip
    .goto Stonetalon Mountains,64.28,96.60
    .goto Thunder Bluff,56.65,18.96,30 >>|cRXP_WARN_跳过右侧的岩石. 通过调整角色位置, 使其看起来像是漂浮状态, 然后执行登出跳过(Logout Skip), 即退出游戏再重新登录|r
    .link https://www.youtube.com/watch?v=j_DRDkqWeuE&ab >>|cRXP_WARN_点击此处查看示例|r
    .group
step
    #completewith next
    .subzone 460 >>前往烈日石居
step
    #label KayaLives
    .goto Stonetalon Mountains,47.46,58.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔姆拉|r交谈
    .turnin 6401 >>交任务: |cRXP_FRIENDLY_卡雅还活着|r
    .target Tammra Windfield
step
    .goto Stonetalon Mountains,47.47,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板杰卡|r交谈
    >>|cRXP_WARN_不要设置你的[炉石]！|r
	.vendor >>|cRXP_BUY_卖掉垃圾物品, 然后在必要时补充食物和水|r << !Rogue !Warrior
    .vendor >>|cRXP_BUY_卖掉垃圾物品, 必要时补充食物|r << Rogue/Warrior
    .target Innkeeper Jayka
step
    .goto Stonetalon Mountains,47.61,61.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在旅馆二楼与|cRXP_FRIENDLY_基达|r交谈
    .vendor >>|cRXP_BUY_从她那里购买|r|T134831:0|t[治疗药水]|cRXP_BUY_(如果价格合适)|r << !Warrior
    .vendor >>|cRXP_BUY_从她那里购买|r|T134831:0|t[治疗药水]|cRXP_BUY_和|r|T134413:0|t[活根草]|cRXP_BUY_(如果有的话)|r << Warrior
    .target Jeeda
step
    #completewith InDeepTrouble2
    .goto Stonetalon Mountains,49.38,61.68,30,0
    .goto Stonetalon Mountains,48.92,62.71,30,0
    .goto Stonetalon Mountains,48.11,63.88,30,0
    .goto Stonetalon Mountains,47.21,64.05,30 >>沿着右侧的路径跑上去
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏纳曼|r和|cRXP_FRIENDLY_Mor'Rogal|r交谈
    .accept 6562 >>接任务: |cRXP_LOOT_帮助耶努萨克雷|r
    .accept 6393 >>接任务: |cRXP_LOOT_元素战争|r
    .target +Tsunaman
    .goto Stonetalon Mountains,47.36,64.25
    .turnin 6421 >>交任务: |cRXP_FRIENDLY_滚岩峡谷|r
    .accept 6481 >>接任务: |cRXP_WARN_土灵的觉醒|r
    .target +Mor'Rogal
    .goto Stonetalon Mountains,47.21,64.05
    .isQuestComplete 6421
    .group
step
    .goto Stonetalon Mountains,47.21,64.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mor'Rogal|r交谈
    .accept 6481 >>接任务: |cRXP_WARN_土灵的觉醒|r
    .target Mor'Rogal
    .isQuestTurnedIn 6421
    .group
step
    #label InDeepTrouble2
    .goto Stonetalon Mountains,47.36,64.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_苏纳曼|r交谈
    .accept 6562 >>接任务: |cRXP_LOOT_帮助耶努萨克雷|r
    .accept 6393 >>接任务: |cRXP_LOOT_元素战争|r
    .target Tsunaman
step
    .goto Stonetalon Mountains,59.08,75.70
    >>点击|cRXP_FRIENDLY_通缉告示|r
    .accept 6284 >>接任务: |cRXP_LOOT_贝瑟莱斯|r
    .group
step
    .goto Stonetalon Mountains,51.89,73.81,50,0
    .goto Stonetalon Mountains,52.46,71.67
    >>击杀|cRXP_ENEMY_贝瑟莱斯|r. 击败后掠夺她的|cRXP_LOOT_利牙|r
    >>|cRXP_WARN_在拉她之前先清空周围区域. 小心, 她会用蛛网困住你10秒！|r
    .complete 6284,1 --Collect Besseleth's Fang (x1)
	.unitscan Besseleth
    .group 3
step
    #completewith next
    .goto Stonetalon Mountains,67.41,87.92,60,0
    .goto Stonetalon Mountains,65.93,89.87,40,0
    .goto Stonetalon Mountains,63.66,93.80,40,0
    .goto Stonetalon Mountains,61.75,93.06,40 >>前往滚岩峡谷并进入北部洞穴
    .group
    .isOnQuest 6481
step
    .goto Stonetalon Mountains,59.50,90.40,40,0
    .goto Stonetalon Mountains,57.65,89.52
    >>点击|cRXP_PICK_共鸣桶|r召唤|cRXP_ENEMY_高戈罗克|r, 当他出现时将其击杀
    .complete 6481,1 --Goggeroc slain (1)
    .mob Goggeroc
    .group 2
    .isOnQuest 6481
step << skip
    .goto Stonetalon Mountains,58.24,89.81
    .goto Stonetalon Mountains,57.57,61.99,30 >>|cRXP_WARN_跳到黄色蘑菇上. 跳跃至空中时, 同时登出再重新登录, 完成“登出跳过”. 若失败, 请跑回烈日石居|r
    .link https://www.youtube.com/watch?v=DGsL3FX9_TE&ab >>|cRXP_WARN_点击此处查看示例|r
    .group
    .isQuestComplete 6481
    --VV Jump logout required for it to work, remove if it doesn't work on new servers
step
    #completewith EarthenAriseTurnin
    .goto Stonetalon Mountains,49.38,61.68,50 >>前往烈日石居
    .group
    .isQuestComplete 6481
step
    #completewith next
    .goto Stonetalon Mountains,49.38,61.68,20,0
    .goto Stonetalon Mountains,48.92,62.71,30,0
    .goto Stonetalon Mountains,48.11,63.88,30,0
    .goto Stonetalon Mountains,47.21,64.05,30 >>沿着左侧的路径跑上去
    .group
    .isQuestComplete 6481
step
    #label EarthenAriseTurnin
    .goto Stonetalon Mountains,47.21,64.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Mor'Rogal|r交谈
    .turnin 6481 >>交任务: |cRXP_FRIENDLY_土灵的觉醒|r
    .target Mor'Rogal
    .isQuestComplete 6481
    .group
step
    .goto Stonetalon Mountains,47.20,61.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马格兰|r交谈
	.turnin 6284 >>交任务: |cRXP_FRIENDLY_贝瑟莱斯|r
    .target Maggran Earthbinder
	.isQuestComplete 6284
    .group
step
    #completewith next
    .goto Stonetalon Mountains,58.99,62.60,100 >>前往狂风峭壁
step
    .goto Stonetalon Mountains,58.99,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_其兹|r交谈
    .turnin 1095 >>交任务: |cRXP_FRIENDLY_新的指示|r
    .target Ziz Fizziks
step
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
    >>击杀|cRXP_ENEMY_XT:9|r. 它在河的南岸巡逻
    >>|cRXP_WARN_这个任务无需立即完成|r
    .complete 1068,2 --XT:9 (1)
    .unitscan XT:9
step
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
    >>击杀|cRXP_ENEMY_XT:4|r. 它在河的北岸巡逻
    >>|cRXP_WARN_这个任务无需立即完成|r
    .complete 1068,1 --XT:4 (1)
    .unitscan XT:4
step
    #completewith next
    .subzone 2160 >>进入风切矿井
    .group
step
    .goto Stonetalon Mountains,71.87,60.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_匹兹尼克|r交谈
    .accept 1090 >>接任务: |cRXP_WARN_格雷苏的要求|r
    .target Piznik
    .group 3
step
    .goto Stonetalon Mountains,71.77,60.19
    >>保护|cRXP_FRIENDLY_匹兹尼克|r免受来袭的|cRXP_ENEMY_风剪歹徒|r伤害
    .complete 1090,1 --Keep Piznik safe while he mines the mysterious ore
    .mob Windshear Vermin
    .group 3
step
    .goto Stonetalon Mountains,71.87,60.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_匹兹尼克|r交谈
    .turnin 1090 >>交任务: |cRXP_FRIENDLY_格雷苏的要求|r
    .accept 1092 >>接任务: |cRXP_WARN_格雷苏的要求|r
    .target Piznik
    .group
step << skip
    .goto Stonetalon Mountains,71.83,60.34
    .goto Stonetalon Mountains,57.57,61.99,30 >>|cRXP_WARN_跳上木制转轮. 通过退出并重新登录来跳过登出|r
    .link https://www.youtube.com/watch?v=8s1SRza7qFg&ab_channel=RestedXP >>|cRXP_WARN_点击此处查看示例|r
    .group
step
    .goto Stonetalon Mountains,58.99,62.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_其兹|r交谈
    .turnin 1092 >>交任务: |cRXP_FRIENDLY_格雷苏的要求|r
    .target Ziz Fizziks
    .isQuestTurnedIn 1090
    .group
step
    #completewith next
    .goto Stonetalon Mountains,78.29,42.51,30 >>进入塔隆迪普小径
step << skip
    .goto Stonetalon Mountains,78.89,41.24
    .goto Ashenvale,40.40,53.06,30 >>|cRXP_WARN_跳到你右侧的白色石头上. 通过登出再重新登录来跳过登出|r
    .link https://www.youtube.com/watch?v=h2s4ZjFBLtg&ab_channel=RestedXP >>|cRXP_WARN_点击此处查看示例|r
    .zoneskip Ashenvale
step
	#completewith ZoramFP
    .goto Ashenvale,39.45,55.29,50,0
    .goto Ashenvale,36.47,57.15,50,0
    .goto Ashenvale,34.56,54.13,30,0
    .goto Ashenvale,32.14,52.12,60,0
    .goto Ashenvale,28.64,48.10,50,0
    .goto Ashenvale,26.34,45.44,50,0
    .goto Ashenvale,25.40,39.00,70,0
    .goto Ashenvale,11.96,34.28,80 >>前往佐拉姆加哨站
    >>|cRXP_WARN_确保途中避开阿斯特兰纳守卫. 沿路径点前进以保证安全|r
    .unitscan Astranaar Sentinel
step
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
    .xp 21 >>刷到21级
step
    #label ZoramFP
    .goto Ashenvale,12.20,33.80
    .fp Zoram'gar Outpost >>获取佐拉姆加哨站的飞行路径
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu|r和|cRXP_FRIENDLY_Karang|r和|cRXP_FRIENDLY_米苏瓦|r和|cRXP_FRIENDLY_玛鲁凯|r交谈
    .turnin 6562 >>交任务: |cRXP_FRIENDLY_帮助耶努萨克雷|r
    .accept 6563 >>接任务: |cRXP_LOOT_阿库麦尔水晶|r
    .target +Je'neu Sancrea
    .goto Ashenvale,11.56,34.29
    .accept 216 >>接任务: |cRXP_LOOT_蓟皮熊怪的麻烦|r
    .target +Karang Amakkar
    .goto Ashenvale,11.90,34.53
    .accept 6462 >>接任务: |cRXP_LOOT_巨魔符咒|r
    .target +Mitsuwa
    .goto Ashenvale,11.65,34.85
    .accept 6442 >>接任务: |cRXP_LOOT_佐拉姆海岸的纳迦|r
    .target +Marukai
    .goto Ashenvale,11.69,34.90
    .group
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu|r和|cRXP_FRIENDLY_Karang|r和|cRXP_FRIENDLY_米苏瓦|r和|cRXP_FRIENDLY_玛鲁凯|r交谈
    .turnin 6562 >>交任务: |cRXP_FRIENDLY_帮助耶努萨克雷|r
    .target +Je'neu Sancrea
    .goto Ashenvale,11.56,34.29
    .accept 216 >>接任务: |cRXP_LOOT_蓟皮熊怪的麻烦|r
    .target +Karang Amakkar
    .goto Ashenvale,11.90,34.53
    .accept 6462 >>接任务: |cRXP_LOOT_巨魔符咒|r
    .target +Mitsuwa
    .goto Ashenvale,11.65,34.85
    .accept 6442 >>接任务: |cRXP_LOOT_佐拉姆海岸的纳迦|r
    .target +Marukai
    .goto Ashenvale,11.69,34.90
step
    .goto Ashenvale,12.06,34.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_穆格拉什|r交谈
    >>|cRXP_WARN_这将开启一个护送任务. 请小心, 因为难度较高|r
    .accept 6641,1 >>接任务: |cRXP_LOOT_鞭笞者沃尔沙|r
    .target Muglash
    .group 2
step
    .goto Ashenvale,9.63,27.63
    >>到达目的地后, 点击 |cRXP_PICK_火盆|r
    >>|cRXP_WARN_将会有|r |cRXP_ENEMY_Naga|r |cRXP_WARN_一波波敌人出现. 一旦|r |cRXP_ENEMY_Vorsha|r |cRXP_WARN_现身, 请小心, 他伤害极高|r
    >>|cRXP_WARN_你可以先让|r|cRXP_FRIENDLY_穆格拉什|r|cRXP_WARN_在与他战斗前吸引一些仇恨|r
    .complete 6641,1 --Defeat Vorsha the Lasher
    .mob Vorsha the Lasher
    .group 2
step
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
    >>击杀 |cRXP_ENEMY_Wraithtail Nagas|r. 击杀后掠夺其 |cRXP_LOOT_Heads|r
    .complete 6442,1 --Wraithtail Head (20)
    .mob Wrathtail Razortail
    .mob Wrathtail Wave Rider
    .mob Wrathtail Sorceress
    .mob Wrathtail Sea Witch
    .mob Wrathtail Priestess
    .mob Wrathtail Myrmidon
    .mob Lady Vespia
step
    .goto Kalimdor,43.89,35.23,100 >>前往黑暗深渊入口
    .isOnQuest 6563
    .group
step
    #completewith next
    >>从墙上拾取|cRXP_PICK_阿库麦尔蓝宝石|r
    .complete 6563,1 --Sapphire of Aku'Mai (20)
    .group 4
step
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
    >>击杀黑潮海潮女祭司. 从她们身上搜刮出一个潮湿的便笺, 并使用它来开启任务
    .collect 16790,1,6564 --Collect Damp Note (1)
    .accept 6564 >>接任务: |cRXP_LOOT_上古之神的仆从|r
    .mob Blackfathom Tide Priestess
    .use 16790
    .group 4
step
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
    >>从墙上拾取|cRXP_PICK_阿库麦尔蓝宝石|r
    .complete 6563,1 --Sapphire of Aku'Mai (20)
    .group 4
step
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
    .xp 23 >>升级至23级
step
    .goto Ashenvale,11.56,34.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .turnin 6563 >>交任务: |cRXP_FRIENDLY_阿库麦尔水晶|r
    .turnin 6564 >>交任务: |cRXP_FRIENDLY_上古之神的仆从|r
    .target Je'neu Sancrea
    .group
    .isQuestComplete 6563
    .isQuestComplete 6564
step
    .goto Ashenvale,11.56,34.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .turnin 6563 >>交任务: |cRXP_FRIENDLY_阿库麦尔水晶|r
    .target Je'neu Sancrea
    .group
    .isQuestComplete 6563
step
    .goto Ashenvale,11.56,34.29
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Je'neu Sancrea|r交谈
    .turnin 6564 >>交任务: |cRXP_FRIENDLY_上古之神的仆从|r
    .target Je'neu Sancrea
    .group
    .isQuestComplete 6564
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战歌信使|r和|cRXP_FRIENDLY_玛鲁凯|r交谈
    .turnin 6641 >>交任务: |cRXP_FRIENDLY_鞭笞者沃尔沙|r
    .target +Warsong Runner
    .goto Ashenvale,12.22,34.21
    .turnin 6442 >>交任务: |cRXP_FRIENDLY_佐拉姆海岸的纳迦|r
    .target +Marukai
    .goto Ashenvale,11.69,34.90
    .isQuestComplete 6641
    .group
step
    .goto Ashenvale,11.69,34.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛鲁凯|r交谈
    .turnin 6442 >>交任务: |cRXP_FRIENDLY_佐拉姆海岸的纳迦|r
    .target Marukai
step
    .goto Ashenvale,11.90,34.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡拉恩|r交谈
    .accept 216 >>接任务: |cRXP_LOOT_蓟皮熊怪的麻烦|r
    .target Karang Amakkar
step
    #completewith flytoORG
    .hs >>炉石传送至雷霆崖
    .use 6948
    .cooldown item,6948,>0
step
    .goto Thunder Bluff,47.12,57.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_彻斯姆|r交谈
    .bankdeposit 5059 >>存入你的 |T132938:0|t[掘地铲]
    .target Chesmu
step
    #completewith flytoORG
    .goto Ashenvale,12.24,33.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_安德鲁克|r交谈
    .fly Thunder Bluff >>前往: |cRXP_PICK_雷霆崖|r
    .target Andruk
    .cooldown item,6948,<0
step
    #completewith next
    .goto Thunder Bluff,69.88,30.90,80 >>前往长者高地
step
    .goto Thunder Bluff,69.88,30.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格萨|r交谈
    >>|cRXP_WARN_等待RP结束|r
    .turnin 1063 >>交任务: |cRXP_FRIENDLY_长者|r
    .timer 6,The Elder Crone RP
    .accept 1064 >>接任务: |cRXP_LOOT_被遗忘者的援助|r
    .target Magatha Grimtotem
step
    .goto Thunder Bluff,22.82,20.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_药剂师扎玛|r交谈
    .turnin 1064 >>交任务: |cRXP_FRIENDLY_被遗忘者的援助|r
    .accept 1065 >>接任务: |cRXP_LOOT_塔伦米尔之旅|r
    .target Apothecary Zamah
step << Warlock
    #completewith flytoORG
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .fly Camp Taurajo >>飞往陶拉霍营地
    .target Tal
step << !Warlock
    .goto Thunder Bluff,47.00,49.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔尔交谈|cRXP_FRIENDLY_Tal|r
    .fly Orgrimmar >>飞往奥格瑞玛
    .target Tal
step << Warlock
    .goto The Barrens,44.62,59.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Logmar|r交谈
    .turnin 1511 >>交任务: |cRXP_FRIENDLY_肯兹格拉的伤药|r
    .accept 1515 >>接任务: |cRXP_LOOT_多格兰之囚|r
    .target Grunt Logma
step << Warlock
    .goto The Barrens,43.31,47.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Dogran|r交谈
    .turnin 1515 >>交任务: |cRXP_FRIENDLY_多格兰之囚|r
    .accept 1512 >>接任务: |cRXP_LOOT_爱的礼物|r
    .target Grunt Dogran
step << Warlock
    .goto The Barrens,44.45,59.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥穆萨|r交谈
    .fly Orgrimmar >>飞往奥格瑞玛
    .target Omusa Thunderhorn
    .zoneskip The Barrens,1
step
    #optional
    #label flytoORG
step << Warlock
    .goto Orgrimmar,48.25,45.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Gan'rul|r 交谈
    .trainer >>训练你的职业法术
    .turnin 1512 >>交任务: |cRXP_FRIENDLY_爱的礼物|r
    .accept 1513 >>接任务: |cRXP_LOOT_誓缚|r
    .target Gan'rul Bloodeye
step << Warlock
    #completewith next
    .cast 9224 >>在召唤法阵使用 |T133290:0|t[多格兰的吊坠]
    .use 6626
step << Warlock
    .goto Orgrimmar,49.66,50.15
    >>击杀召唤的魅魔|r
    .complete 1513,1 --Kill Summoned Succubus (1)
    .mob Summoned Succubus
    .use 6626
step << Warlock
    .goto Orgrimmar,48.25,45.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_Gan'rul|r 交谈
    .turnin 1513 >>交任务: |cRXP_FRIENDLY_誓缚|r
    .target Gan'rul Bloodeye
step << Rogue
    #completewith next
    .goto Orgrimmar,45.64,55.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r |cRXP_FRIENDLY_卡雷斯|r|cRXP_BUY_交谈. 如果你没有匕首, 可以向他购买|r |T135640:0|t[双刃弯刀] |r
    .collect 2207,1 --Collect Jambiya (1)
    .target Kareth
step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_申苏尔|r交谈
    .train 921 >>训练 |T133644:0|t[扒窃]
    .train 8676 >>训练 |T132282:0|t[伏击]
    .train 1943 >>训练 |T132302:0|t[割裂]
    .train 1856 >>训练 |T132331:0|t[潜行]
    .train 1725 >>火车 |T132289:0|t[分散注意力]
    .train 1785 >>训练 |T132320:0|t[潜行等级 2]
    .accept 2460 >>接任务: |cRXP_LOOT_碎手军礼|r
    .target Shenthul
step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>在|cRXP_FRIENDLY_申苏尔|r敬礼后, 以他为目标并输入 /Salute
    .complete 2460,1 --Shattered Salute Performed (1)
    .target Shenthul
step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_申苏尔|r交谈
    .turnin 2460 >>交任务: |cRXP_FRIENDLY_碎手军礼|r
    .accept 2458 >>接任务: |cRXP_LOOT_卧底密探|r
    .target Shenthul
step << Rogue
    .goto Orgrimmar,42.10,49.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔|r|cRXP_BUY_交谈. 从他那里购买|r|T134387:0|t[闪光粉末]|r
    .collect 2928,20,2479,1 --Collect Dust of Decay (20)
    .collect 3371,20,2479,1 --Collect Empty Vial (20)
    .collect 5140,20,2479,1 --Collect Flash Powder (20)
    .target Rekkul
step
    .goto Orgrimmar,76.50,24.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Rilli|r交谈
    .turnin 3923 >>交任务: |cRXP_FRIENDLY_雷里·格里斯高布|r
    .accept 3924 >>接任务: |cRXP_WARN_主动式负载平衡器说明书|r
    .target Rilli Greasygob
step << Priest/Warlock
    .goto Orgrimmar,44.16,48.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_卡提斯|r|cRXP_BUY_交谈. 从她那里购买|r|T135139:0|t[燃烧魔杖]|r
    .collect 5210,1,1507,1 --Collect Burning Wand (1)
    .money <0.5808
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.4
    .target Katis
step << Mage
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 2138 >>训练你的职业法术
    .target Pephredo
    .xp <22,1
    .xp >24,1
step << Mage
    #optional
    .goto Orgrimmar,38.36,85.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_皮菲瑞多|r交谈
    .train 2121 >>训练你的职业法术
    .target Pephredo
    .xp <24,1
step << Mage
    .goto Orgrimmar,38.66,85.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与小屋顶部的|r |cRXP_FRIENDLY_索乌|r 交谈
    .train 3567 >>坐火车 |T135759:0|t[传送:奥格瑞玛]
    .target Thuul
step << Troll Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
    .turnin 5642 >>交任务: |cRXP_FRIENDLY_暗影守卫|r
    .trainer >>训练你的职业法术
    .target Ur'kyo
step << Undead Priest
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
    .train 8103 >>训练你的职业法术
    .target Ur'kyo
    .xp <22,1
    .xp >24,1
step << Undead Priest
    #optional
    .goto Orgrimmar,35.59,87.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_Ur'kyo|r交谈
    .train 3747 >>训练你的职业法术
    .target Ur'kyo
    .xp <24,1
step << Rogue/Druid
    #completewith MissionProbable
    .goto Orgrimmar,26.22,61.58,80,0
    .goto Orgrimmar,15.66,63.33,30,0
    .goto Orgrimmar,18.03,60.51,50 >>前往: |cRXP_PICK_贫瘠之地|r
    .zoneskip The Barrens
step << Rogue/Druid
    #completewith MissionProbable
    .goto The Barrens,57.63,7.48,120 >>前往污泥之屋
step << Druid
    .goto The Barrens,56.67,8.32
    >>在水中拾取|cRXP_PICK_奇怪的保险箱|r, 获得|T133443:0 |t[水兽敏捷坠饰]
    .collect 15883,1,3924,1 --Half Pendant of Aquatic Agility (1)
step << Rogue
    #completewith next
    .goto The Barrens,55.70,5.89
    +瞄准目标|cRXP_FRIENDLY_工头费苏勒|r, 然后使用你的 |T134536:0|t[信号枪] 两次, 并输入 /Salute
    >>|cRXP_WARN_小心！在他变得友好之前千万不要靠近他, 否则他会攻击你！|r
    .use 8051
    .target Taskmaster Fizzule
step << Rogue
    .goto The Barrens,55.44,5.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|r|cRXP_FRIENDLY_工头费苏勒|r交谈
    .turnin 2458 >>交任务: |cRXP_FRIENDLY_卧底密探|r
    .accept 2478 >>接任务: |cRXP_WARN_基本不可能的任务|r
    .target Taskmaster Fizzule
step << Rogue/Druid
    #optional
    #label MissionProbable
step << Rogue
    .goto The Barrens,54.80,5.97
    >>对|cRXP_ENEMY_工头希里克斯|r使用 |T133644:0|t[扒窃], 以获取他的|cRXP_LOOT_塔楼钥匙|r
    .complete 2478,5 --Silixiz's Tower Key (1)
    .mob Foreman Silixiz
step << Rogue
    #completewith roguetowerq
    +|cRXP_WARN_这里的每个怪物对某些技能的伤害会增加|r
    >>使用 |T132282:0|t[伏击] 对付|cRXP_ENEMY_变异风险投资公司工人|r
    >>对|cRXP_ENEMY_风险投资公司巡逻员|r 使用 |T132302:0|t[割裂]
    >>对|cRXP_ENEMY_风险投资公司看守|r使用 |T132292:0|t[刺骨] 一次(消耗1点连击点数)
step << Rogue
    #label roguetowerq
    .goto The Barrens,54.72,5.74
    >>进入潜行者塔楼并击杀|cRXP_ENEMY_Drones|r和|cRXP_ENEMY_Patrollers|r和|cRXP_ENEMY_Lookouts|r
    .complete 2478,1 --Mutated Venture Co. Drone (2)
    .mob +Mutated Venture Co. Drone
    .complete 2478,3 --Venture Co. Patroller (2)
    .mob +Venture Co. Patroller
    .complete 2478,2 --Venture Co. Lookout (2)
    .mob +Venture Co. Lookout
step << Rogue
    .goto The Barrens,54.77,5.57
    >>在塔顶你会找到|cRXP_ENEMY_Gallywix|r. 击败他可获得他的|cRXP_LOOT_Head|r
    >>|cRXP_WARN_使用|r|T132282:0|t[伏击]|cRXP_WARN_将他的生命值降至一半. 使用|r|T132155:0|t[割裂]|cRXP_WARN_恢复能量后继续使用|r|T136205:0|t[闪避]
	>>|cRXP_WARN_记得适时使用药水和|r|T132819:0|t[菊花茶] |cRXP_WARN_若需要|r
    .complete 2478,4 --Gallywix's Head (1)
    .mob Grand Foreman Puzik Gallywix
    --VV Video?
step << Rogue
    .goto The Barrens,54.77,5.57
    >>使用你的撬锁技能打开|cRXP_PICK_加里维克斯的保险箱|r并搜刮其中的|cRXP_LOOT_混合物|r
    .complete 2478,6 --Cache of Zanzil's Altered Mixture (1)
step << Rogue/Druid
    #completewith SamophlangePages
    .goto The Barrens,61.33,4.21,120 >>前往 Boulder Lode 矿场
step << !Rogue/Druid
    .goto Orgrimmar,26.22,61.58,80,0
    .goto Orgrimmar,15.66,63.33,30,0
    .goto Orgrimmar,18.03,60.51,50 >>前往: |cRXP_PICK_贫瘠之地|r
    .zoneskip The Barrens
    .isOnQuest 3924
step
    #completewith next
    >>击杀|cRXP_ENEMY_风险投资公司执行者|r 和|cRXP_ENEMY_风险投资公司监督|r . 从他们身上搜刮|cRXP_LOOT_主动式负载平衡器说明书正文|r
    .collect 11148,5 --Samophlange Manual Page (5)
    .mob Venture Co. Enforcer
    .mob Venture Co. Overseer
step
    #label SamophlangePages
    .goto The Barrens,60.90,3.84,20,0
    .goto The Barrens,59.99,4.13
    >>击杀矿井后方的|cRXP_ENEMY_考博普拉格|r. 从他身上搜刮出|cRXP_LOOT_主动式负载平衡器说明书封面|r
    .collect 11147,1 --Samophlange Manual Cover (1)
    .mob Boss Copperplug
    .mob Venture Co. Enforcer
    .mob Venture Co. Overseer
step
    #label SamophlangePages2
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
    >>击杀|cRXP_ENEMY_风险投资公司执行者|r 和|cRXP_ENEMY_风险投资公司监督|r . 从他们身上搜刮|cRXP_LOOT_主动式负载平衡器说明书正文|r
    .collect 11148,5 --Samophlange Manual Page (5)
    .mob Venture Co. Enforcer
    .mob Venture Co. Overseer
step
    #requires SamophlangePages
    #requires SamophlangePages2
    >>点击 |T133735:0|t[主动式负载平衡器说明书封面] 以制作|cRXP_LOOT_Manual|r
    .complete 3924,1 -- Samophlange Manual
    .use 6626
step << skip
    .goto The Barrens,60.00,4.09
    .goto Orgrimmar,40.05,68.05,30 >>|cRXP_WARN_跳上帐篷. 通过登出再重新登录来执行“登出跳过”. 如果失败, 跑回奥格瑞玛|r
    .link https://www.youtube.com/watch?v=cOxspH4RcI8&ab >>|cRXP_WARN_点击此处查看示例|r
step << Rogue
    .goto Orgrimmar,43.05,53.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_申苏尔|r交谈
    .turnin 2478 >>交任务: |cRXP_FRIENDLY_基本不可能的任务|r
    .accept 2479 >>接任务: |cRXP_LOOT_希诺特的帮助|r
    .target Shenthul
step << Rogue
    .goto Orgrimmar,42.10,49.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_雷库尔|r|cRXP_BUY_交谈. 从他那里购买|r|T133849:0|t[腐朽之尘]|cRXP_BUY_和|r|T132793:0|t[空瓶]|r
    .collect 2928,20,2479,1 --Collect Dust of Decay (20)
    .collect 3371,20,2479,1 --Collect Empty Vial (20)
    .target Rekkul
step << Shaman
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 8498 >>训练你的职业法术
    .target Kardris Dreamseeker
    .xp <22,1
    .xp >24,1
step << Shaman
    #optional
    .goto Orgrimmar,38.82,36.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卡德里斯|r交谈
    .train 905 >>训练你的职业法术
    .target Kardris Dreamseeker
    .xp <24,1
step
    .goto Orgrimmar,76.50,24.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|RXP_FRIENDLY_Rilli|r交谈
    .turnin 3924 >>交任务: |cRXP_FRIENDLY_主动式负载平衡器说明书|r
    .target Rilli Greasygob
step << Troll Warrior/Undead Warrior/Tauren Warrior
    .goto Orgrimmar,81.52,19.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈纳什|r交谈
    .train 197 >>训练双手斧
    .target Hanashi
step << Warrior
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 6192 >>训练你的职业法术
    .target Grezz Ragefist
    .xp <22,1
    .xp >24,1
step << Warrior
    #optional
    .goto Orgrimmar,79.91,31.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格雷兹|r交谈
    .train 5308 >>训练你的职业法术
    .target Grezz Ragefist
    .xp <24,1
step << Hunter
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 14323 >>训练你的职业法术
    .target Ormak Grimshot
    .xp <22,1
    .xp >24,1
step << Hunter
    #optional
    .goto Orgrimmar,66.05,18.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥玛克|r交谈
    .train 14262 >>训练你的职业法术
    .target Ormak Grimshot
    .xp <24,1
step << Hunter
    .goto Orgrimmar,66.34,14.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Xao'tsu|r交谈
    .train 24558 >>训练你的宠物法术
    .target Xao'tsu
    .xp <24,1
step << Rogue
    .goto Orgrimmar,48.12,80.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t|cRXP_BUY_与|r|cRXP_FRIENDLY_Trak'gen|r|cRXP_BUY_交谈. 从他那里购买|r|T135423:0|t[破损的致命飞斧]|r
    .collect 3137,200,6544,1 --Deadly Throwing Axe (200)
    .target Trak'gen
step
    #optional
    .abandon 6421 >>放弃滚岩峡谷
    .isOnQuest 6421
step
    #optional
    .abandon 4021 >>放弃人马无双！
    .isOnQuest 4021
step
    #optional
    .abandon 6481 >>放弃土灵的觉醒
    .isOnQuest 6481
step
    #optional
    .abandon 6284 >>克服贝瑟莱斯
    .isOnQuest 6284
step
    #optional
    .abandon 6641 >>放弃鞭笞者沃尔沙
    .isOnQuest 6641
step
    #optional
    .abandon 6563 >>放弃阿库麦尔水晶
    .isOnQuest 6563
step
    #optional
    .abandon 1486 >>放弃变异皮革
    .isOnQuest 1486
    .dungeon WC
step
    #optional
    .abandon 1487 >>清除变异者
    .isOnQuest 1487
    .dungeon WC
step
    #optional
    .abandon 1491 >>放弃智慧饮料
    .isOnQuest 1491
    .dungeon WC
step
    #optional
    .abandon 959 >>放弃港口的麻烦
    .isOnQuest 959
    .dungeon WC
step
    #optional
    .abandon 914 >>放弃尖牙德鲁伊领袖
    .isOnQuest 914
    .dungeon WC
step
    #optional
    .abandon 962 >>放弃毒蛇花
    .isOnQuest 962
    .dungeon WC
step
    #completewith next
    .zone Durotar >>前往: |cRXP_PICK_杜隆塔尔|r
    .zoneskip Durotar
step
    .goto Durotar,50.8,13.8,40 >>登上齐柏林飞艇塔
    .zone Tirisfal Glades >>前往: |cRXP_PICK_提瑞斯法林地|r
    .zoneskip Tirisfal Glades
    .zoneskip Undercity

]])

