RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 暗夜精灵起始区域
#name 2零售-联盟-暗夜精灵_暗影谷
#displayname Chapter 1 - Shadowglen
#next 3零售-联盟-暗夜精灵_泰达希尔
#defaultfor NightElf !DemonHunter !DK 

<< Alliance

step
    .goto 460,45.61,74.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊尔萨莱恩|r
    .accept 28713 >>接任务: |cRXP_LOOT_自然的平衡|r
	.target 伊尔塔莱恩
step
    .goto 460,42.44,76.29,20,0
    .goto 460,46.63,79.57,20,0
    .goto 460,50.63,76.87,20,0
    .goto 460,42.44,76.29
    >>杀死 |cRXP_ENEMY_Young 夜刃豹s。|r
    .complete 28713,1 --6/6 Young 夜刃豹 slain
	.mob Young 夜刃豹
step
    .goto 460,45.62,74.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊尔萨莱恩|r
    .turnin 28713 >>交任务: |cRXP_FRIENDLY_自然的平衡|r
    .accept 28714 >>接任务: |cRXP_WARN_腐化的魔苔|r
	.target 伊尔塔莱恩
step
    .goto 460,45.94,72.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_麦利萨尔·鹿盔|r
    .accept 28715 >>接任务: |cRXP_WARN_恶魔窃贼|r
	.target 梅利萨·鹿盔
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Grell|r、|cRXP_ENEMY_Grellkin|r 并掠夺他们的 |cRXP_LOOT_Fel Moss。|r
    .complete 28714,1 --6/6 Fel Moss
	.mob Grell
	.mob Grellkin
step
    .goto 460,36.66,79.84,15,0
    .goto 460,34.82,80.53,15,0
    .goto 460,31.70,74.85,15,0
    .goto 460,30.66,70.55,20,0
    .goto 460,36.66,79.84
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Melithar 的被盗包|r
    .complete 28715,1 --5/5 Melithar's Stolen Bags
step
    .goto 460,36.66,79.84,15,0
    .goto 460,34.82,80.53,15,0
    .goto 460,31.70,74.85,15,0
    .goto 460,30.66,70.55,20,0
    .goto 460,36.66,79.84
    >>杀死 |cRXP_ENEMY_Grell|r、|cRXP_ENEMY_Grellkin|r 并掠夺他们的 |cRXP_LOOT_Fel Moss。|r
    .complete 28714,1 --6/6 Fel Moss
	.mob Grell
	.mob Grellkin
step
    .goto 460,45.93,72.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_麦利萨尔·鹿盔|r
    .turnin 28715 >>交任务: |cRXP_FRIENDLY_恶魔窃贼|r
	.target 梅利萨·鹿盔
step
    .goto 460,46.28,73.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊尔萨莱恩|r
    .turnin 28714 >>交任务: |cRXP_FRIENDLY_腐化的魔苔|r
    .accept 28723 >>接任务: |cRXP_WARN_月神女祭司|r
	.target 伊尔塔莱恩
step
    .goto 460,42.49,50.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德塔莉亚·银林|r
    .turnin 28723 >>交任务: |cRXP_FRIENDLY_月神女祭司|r
    .accept 28724 >>接任务: |cRXP_LOOT_埃沃隆的解药|r
	.target Dentaria Silverglade
step
    .goto 460,41.87,49.37,5,0
    .goto 460,40.77,47.27,5,0
    .goto 460,39.54,52.27,5,0
    .goto 460,40.18,52.64,5,0
    .goto 460,40.80,53.32,5,0
    .goto 460,42.28,52.68,5,0
    .goto 460,43.60,51.83,5,0
    .goto 460,41.87,49.37
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击|cRXP_PICK_Moonpetal Lilies|r
    .complete 28724,1 -- 7/7 Moonpetal Lily
step
    .goto 460,42.49,50.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德塔莉亚·银林|r
    .turnin 28724 >>交任务: |cRXP_FRIENDLY_埃沃隆的解药|r
    .accept 28725 >>接任务: |cRXP_LOOT_森林守护者|r
	.target Dentaria Silverglade
step
	#completewith next
	.goto 58,44.87,88.5,5 >>进入 |cFFfa9602Cave|r 然后等待 |cRXP_FRIENDLY_Tarindrella|r 出现
step
    .goto 58,44.87,88.5
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔琳德拉|r
    .turnin 28725 >>交任务: |cRXP_FRIENDLY_森林守护者|r
    .accept 28726 >>接任务: |cRXP_WARN_树林蜘蛛的腐蚀|r
	.target Tarindrella
step
    .goto 58,39.44,34.72 <<Hunter
    .goto 58,41.27,33.22,10,0 <<!Hunter
    .goto 58,34.81,15.50,15,0 <<!Hunter
    .waypoint 58,46.33,41.34,-30,0
    >>杀死洞穴内的 |cRXP_ENEMY_Spiders|r |cFFfa9602。|r
    >>通过在航点位置使用脱离跨越间隙，你可以节省一些时间 <<Hunter
    >>确保你不会杀死|cRXP_ENEMY_Githyiss the Vile|r，因为你很快就需要他 << Hunter
    .complete 28726,1 --12/12 Webwood Spider slain
	.mob Webwood Spider
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔琳德拉|r
    .turnin 28726 >>交任务: |cRXP_FRIENDLY_树林蜘蛛的腐蚀|r
    .accept 28727 >>接任务: |cRXP_WARN_邪恶的触摸|r
	.target Tarindrella
step
    .goto 58,34.56,23.87,0 << !Hunter
    .goto 58,42.81,19.50,10,0 << !Hunter
    .goto 58,45.02,31.37
    >>杀死 |cRXP_ENEMY_邪恶的Githyiss。|r
    .complete 28727,1 --1/1 Githyiss the Vile slain
	.mob Githyiss the Vile
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔琳德拉|r
    .turnin 28727,1 >>交任务: |cRXP_FRIENDLY_邪恶的触摸|r
    .accept 28728 >>接任务: |cRXP_WARN_未来的征兆|r
	.target Tarindrella
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德塔莉亚·银林|r
    .goto 460,42.50,50.50
    .turnin 28728 >>交任务: |cRXP_FRIENDLY_未来的征兆|r
    .accept 28729 >>接任务: |cRXP_WARN_泰达希尔：艾泽拉斯之冠|r
	.target Dentaria Silverglade
step
    #completewith next
    +|cRXP_WARN_要启用任务物品的键绑定，请按照以下步骤操作：|r
    *[1] Press the |cRXP_WARN_Escape key.|r 
    *[2] Select |cRXP_WARN_Options.|r
    *[3] Navigate to |cRXP_WARN_Keybindings.|r
    *[4] Within |cRXP_WARN_Keybindings|r, find |cRXP_WARN_RestedXP Guides.|r
    *[5] Select and bind the |cRXP_WARN_Active Buttons.|r
step << Hunter
	#completewith next
    .goto 460,46.36,41.86,30,0
	.goto 460,51.93,37.12,60 >>对一只癞皮夜刃豹施放 |T132164:0|tTame Beast 来驯服它
	>>将 |T132161:0|tCall Pet 和 |T132179:0|tPet Utility 拖拽到你的动作栏上
	.target Mangy 夜刃豹
step
    .goto 460,50.13,34.49
    >>使用月亮井附近的 |T967530:0|t[水晶瓶] |cFFfa9602。|
    .use 5185
    .complete 28729,1 --1/1 Filled Crystal Phial
step
    .goto 460,42.49,50.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德塔莉亚·银林|r
    .turnin 28729 >>交任务: |cRXP_FRIENDLY_泰达希尔：艾泽拉斯之冠|r
    .accept 28730 >>接任务: |cRXP_WARN_珍贵的水|r
	.target Dentaria Silverglade
step
    .goto 460,41.85,63.54,15,0
    .goto 460,46.45,53.43,15,0
    .goto 460,44.44,56.47,15,0
    .goto 460,45.20,60.69,15,0
    .goto 460,48.01,58.75,15,0
    .goto 460,48.14,54.36,15,0
    .goto 460,47.16,55.95
    >>沿着树的斜坡走上去
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_特纳隆·雷拳|r
    .turnin 28730 >>交任务: |cRXP_FRIENDLY_珍贵的水|r
    .accept 28731 >>接任务: |cRXP_WARN_泰达希尔：传递信息|r
	.target Tenaron Stormgrip
step
    .goto 460,54.57,84.78
	>>从树上跳下来。你有减速效果，所以你不会死
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伯萨努斯|r
    .accept 2159 >>接任务: |cRXP_LOOT_多兰纳尔的货物|r
	.target Porthannius
]])

RXPGuides.RegisterGuide([[
#df
#version 2
#group RestedXP 起始区域
#groupweight 8
#subgroup 暗夜精灵起始区域
#displayname Chapter 2 - Teldrassil
#name 3零售-联盟-暗夜精灵_泰达希尔
#next RestedXP 联盟 10-60\\1A_艾尔文森林
#defaultfor NightElf !DemonHunter !DK

<< Alliance

step
    .goto 57,59.56,49.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赛恩·腐蹄|r
    .accept 488 >>接任务: |cRXP_LOOT_赛恩的要求|r
	.target Zenn Foulhoof
step
    #completewith next
    >>杀死 |cRXP_ENEMY_林网潜伏者s|r、|cRXP_ENEMY_夜刃豹s|r 和 |cRXP_ENEMY_鸮s|r 并掠夺它们的 |cRXP_LOOT_夜刃豹 Fangs|r、|cRXP_LOOT_鸮 Feathers|r 和 |cRXP_LOOT_ Webwood Spider Silks。|r
	>>|cRXP_WARN_您很快就会得到另一个机会来完成这项任务。|r
    .complete 488,1 --2/2 夜刃豹 Fang
    .complete 488,2 --2/2 鸮 Feather
    .complete 488,3 --2/2 Webwood Spider Silk
	.mob 夜刃豹 Fang
	.mob 鸮 Feather
	.mob Webwood Spider Silk
step
    .goto 57,55.56,49.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔隆凯·捷根|r
    .accept 2438 >>接任务: |cRXP_LOOT_翡翠摄梦符|r
	.target Tallonkai Swiftroot
step
    #completewith next
    .goto 57,55.48,50.43
    .fp >>获取 |cFFfa9602 多兰纳尔飞行路径。|r
	.target Fidelio
step
    .goto 57,55.70,51.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r
    .accept 475 >>接任务: |cRXP_LOOT_烦恼之风|r
	.target 阿瑟里达斯·熊皮
step
    .goto 57,55.37,52.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板凯达米尔|r
    .turnin 2159,1 >>交任务: |cRXP_FRIENDLY_多兰纳尔的货物|r
	.target Innkeeper Keldamyr
step
    #completewith next
    .goto 57,55.36,52.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板凯达米尔|r
    .home >>将你的炉石设为多兰纳尔
	.target Innkeeper Keldamyr
step
	#completewith next
    .goto 57,56.00,52.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊兰尼斯·影花|r
    .train 2366 >>训练 |T4620675:0|t草药学
	.skipgossip 47420,1,1,1
	.target Iranis Shadebloom
step
    .goto 57,56.00,52.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_伊兰尼斯·影花|r
    .train 2575 >>列车 |T4620679:0|tMining
	.skipgossip 47420,2,3,2
	.target Iranis Shadebloom
step
    .goto 57,55.82,53.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞萨斯·月怒|r
    .turnin 28731 >>交任务: |cRXP_FRIENDLY_泰达希尔：传递信息|r
    .accept 929 >>接任务: |cRXP_WARN_大地之冠|r
	.target Corithras Moonrage
step
    .goto 57,56.74,53.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈欧玛|r
    .accept 6344 >>接任务: |cRXP_WARN_尼莎·影歌|r
	.target Nyoma
step
    #completewith TeldrassilEmeraldDreamcatcher
    >>杀死 |cRXP_ENEMY_林网潜伏者s|r、|cRXP_ENEMY_夜刃豹s|r 和 |cRXP_ENEMY_鸮s|r 并掠夺它们的 |cRXP_LOOT_夜刃豹 Fangs|r、|cRXP_LOOT_鸮 Feathers|r 和 |cRXP_LOOT_ Webwood Spider Silks。|r
    .complete 488,1 --2/2 夜刃豹 Fang
    .complete 488,2 --2/2 鸮 Feather
    .complete 488,3 --2/2 Webwood Spider Silk
	.mob 夜刃豹 Fang
	.mob 鸮 Feather
	.mob Webwood Spider Silk	
step
    #completewith next
    +|cRXP_WARN_要启用任务物品的键绑定，请按照以下步骤操作：|r
    *[1] Press the |cRXP_WARN_Escape key.|r 
    *[2] Select |cRXP_WARN_Options.|r
    *[3] Navigate to |cRXP_WARN_Keybindings.|r
    *[4] Within |cRXP_WARN_Keybindings|r, find |cRXP_WARN_RestedXP Guides.|r
    *[5] Select and bind the |cRXP_WARN_Active Buttons.|r
step
    .goto 57,61.92,50.69
    >>使用月亮井旁边的 |T967530:0|t[翡翠瓶] |cFFfa9602。|r
    .complete 929,1 --1/1 Filled Jade Phial
    .use 5619
step
    #completewith next
    +检查房子里的宝箱|cFFfa9602。|r
step
    .goto 57,64.73,51.70,5,0
    .goto 57,64.90,51.61,5,0
    .goto 57,64.59,51.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_盖洛拉斯·塔文斯伦|r
    .turnin 475 >>交任务: |cRXP_FRIENDLY_烦恼之风|r
    .accept 476 >>接任务: |cRXP_LOOT_瘤背熊怪的堕落|r
	.target Gaerolas Talvethren
step
    #completewith next
    +检查 |cRXP_ENEMY_Uruson(罕见)|r 在房屋之间巡逻 |cFFfa9602。|r
	.unitscan Uruson
step
    #label TeldrassilEmeraldDreamcatcher
    .goto 57,66.10,52.10
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Tailonkai 的梳妆台。|r
    .complete 2438,1 --1/1 Emerald Dreamcatcher
step
    #completewith next
    .goto 57,64.51,50.46,20,0
    .deathskip >>死亡并重生|cFFfa9602在灵魂治疗师处。|r
step
    .goto 57,55.82,53.90
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_科瑞萨斯·月怒|r
    .turnin 929 >>交任务: |cRXP_FRIENDLY_大地之冠|r
	.target Corithras
step
    .goto 57,55.69,52.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿斯瑞达斯·熊皮|r
    .turnin 476 >>交任务: |cRXP_FRIENDLY_瘤背熊怪的堕落|r
	.target Athridas
step
    .goto 57,55.56,50.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔隆凯·捷根|r
    .turnin 2438 >>交任务: |cRXP_FRIENDLY_翡翠摄梦符|r
    .accept 2459 >>接任务: |cRXP_LOOT_噬梦者菲罗斯塔|r
	.target Tallonkai
step
    .isQuestComplete 488
    .goto 57,59.52,49.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赛恩·腐蹄|r
    .turnin 488 >>交任务: |cRXP_FRIENDLY_赛恩的要求|r
	.target Zenn Foulhoof
step
    .goto 57,57.48,48.54,40,0
    .goto 57,58.21,49.79,40,0
    .goto 57,58.23,52.16,40,0
    .goto 57,59.97,53.47,40,0
    .goto 57,61.28,51.69,40,0
    .goto 57,60.21,50.03,40,0
    .goto 57,57.48,48.54
    >>杀死 |cRXP_ENEMY_林网潜伏者s|r、|cRXP_ENEMY_夜刃豹s|r 和 |cRXP_ENEMY_鸮s|r 并掠夺它们的 |cRXP_LOOT_夜刃豹 Fangs|r、|cRXP_LOOT_鸮 Feathers|r 和 |cRXP_LOOT_ Webwood Spider Silks。|r
    .complete 488,1 --2/2 夜刃豹 Fang
    .complete 488,2 --2/2 鸮 Feather
    .complete 488,3 --2/2 Webwood Spider Silk
	.mob 夜刃豹 Fang
	.mob 鸮 Feather
	.mob Webwood Spider Silk
step
    #completewith Ferocitas
    +Check for the Treasure Chest |TInterface/cursor/crosshair/interact.blp:20|t |cFFfa9602near Ferocitas.|r
	.unitscan Ferocitas
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Gnarlpine Mystics。|r
    .complete 2459,1 --7/7 Gnarlpine Mystic slain
	.mob Gnarlpine Mystic
step
    #label Ferocitas
    .goto 57,67.26,46.83
    >>杀死 |cRXP_ENEMY_食梦者费罗西塔斯|r 并从他身上夺取 |cRXP_LOOT_塔隆凯的珠宝。|r
    .complete 2459,2 --1/1 Tallonkai's Jewel
	.mob Ferocitas the Dream Eater
step	
    .goto 57,66.88,46.87,40,0
    .goto 57,65.76,46.40,40,0
    .goto 57,65.75,44.83,40,0
    .goto 57,67.26,46.83
    >>杀死 |cRXP_ENEMY_Gnarlpine Mystics|r 
    >>|cRXP_WARN_几乎完成时生命值会降低。之后你将死亡。|r
    .complete 2459,1 --7/7 Gnarlpine Mystic slain
	.mob Gnarlpine Mystic
step
    #completewith next
    .goto 57,66.13,45.25,25,0
    .deathskip >>死亡并重生|cFFfa9602在灵魂治疗师处。|r
step
    .goto 57,55.55,49.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塔隆凯·捷根|r
    .turnin 2459 >>交任务: |cRXP_FRIENDLY_噬梦者菲罗斯塔|r
	.target Tallonkai Swiftroot
step
    .goto 57,55.72,50.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞拉尔·刃叶|r
    .accept 489 >>接任务: |cRXP_LOOT_寻求救赎！|r
	.target Syral Bladeleaf
step
    .goto 57,55.94,55.82,20,0
    .goto 57,55.30,56.98,20,0
    .goto 57,55.32,57.04,20,0
    .goto 57,54.22,53.89,20,0
    .goto 57,56.51,55.80,20,0
    .goto 57,57.18,55.55,20,0
    .goto 57,55.94,55.82
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Fel Cones。|r
    .complete 489,1 --3/3 Fel Cone
step
    .goto 57,55.47,50.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_菲德利奥|r
    .turnin 6344 >>交任务: |cRXP_FRIENDLY_尼莎·影歌|r
    .accept 6341 >>接任务: |cRXP_WARN_泰达希尔的渔业|r
	.target Fidelio
step
    #completewith next
    .goto 57,55.47,50.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_菲德利奥|r
    .fly Darnassus >>飞往达纳苏斯
	.target Fidelio
step
    .goto 89,36.10,53.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾奎恩妮|r
    >>|cRXP_WARN_避免走进紫色区域。|r
    .turnin 6341 >>交任务: |cRXP_FRIENDLY_泰达希尔的渔业|r
    .accept 6342 >>接任务: |cRXP_WARN_飞往奥伯丁|r
	.target Sister Aquinne
step
    .goto 89,36.59,47.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_利奥拉|r
    .turnin 6342 >>交任务: |cRXP_FRIENDLY_飞往奥伯丁|r
    .accept 6343 >>接任务: |cRXP_WARN_飞回泰达希尔|r
    .target Leora
step
    #completewith next
    .goto 89,36.48,50.08,10,0
    .goto 57,55.42,88.39
    >>走进|cFFfa9602紫色门户。|r
    .fp >>获取鲁瑟兰村飞行路线
step
	#completewith next
    .goto 57,55.42,88.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维斯派塔斯|r
    .fly Lor'danel >>飞往洛达内尔
	.target Vesprystus
step
    .goto 62,51.78,18.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德塔莉亚·银林|r
    .accept 13518 >>接任务: |cRXP_WARN_最后一波幸存者|r
	.target Dentaria Silverglade
step
    .goto 62,50.92,18.88
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_宁莉瑟|r 
    .vendor 43439 >>|cRXP_WARN_供应商和维修。|r
	.target Nyrisse
step
    .goto 62,50.22,19.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_游侠戈琳达·纳希恩|r
    .accept 13522 >>接任务: |cRXP_WARN_水的威胁|r
	.target Ranger Glynda Nal'Shea
step
    #completewith finalrescue
    >>杀死 |cRXP_ENEMY_Vile Spray。|r
    .complete 13522,1 --8/8 Vile Spray slain
	.mob Vile Spray
step
    .goto 62,45.02,18.17
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沃科尔|r
    .complete 13518,4 --1/1 Volcor rescued
	.target Volcor
step
    .goto 62,44.11,17.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_戈沙拉·夜语|r
    .complete 13518,2 --1/1 Gershala Nightwhisper rescued
	.target Gershala Nightwhisper
step
    .goto 62,44.58,19.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Whiteclaw.|r
    .complete 13518,1 --1/1 Cerellean Whiteclaw rescued
	.target Cerellean Whiteclaw
step
	#label finalrescue
    .goto 62,42.91,21.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_莎尔蒂|r
    .complete 13518,3 --1/1 Shaldyn rescued
	.target Shaldyn
step
    .goto 62,46.22,17.15,40,0
    .goto 62,44.85,17.07
    .goto 62,44.06,20.31
    .goto 62,42.91,21.51
    .goto 62,46.22,17.15
    >>杀死 |cRXP_ENEMY_Vile Spray。|r
    .complete 13522,1 --8/8 Vile Spray slain
	.target Vile Spray
step
    .goto 62,50.21,19.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_游侠戈琳达·纳希恩|r
    .turnin 13522 >>交任务: |cRXP_FRIENDLY_水的威胁|r
	.target Ranger Glynda Nal'Shea
step
    .goto 62,51.78,17.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_德塔莉亚·银林|r
    .turnin 13518 >>交任务: |cRXP_FRIENDLY_最后一波幸存者|r
	.target Dentaria Silverglade
step
    .goto 62,51.8,18.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞瑞蒂亚·橡语|r
    .accept 13520 >>接任务: |cRXP_WARN_海洋的恩赐|r
	.target Serendia
step
    .goto 62,51.14,19.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维兹班恩·曲针|r
    .accept 13521 >>接任务: |cRXP_WARN_传声盒413号|r
	.target Wizbang Cranktoggle
step
    #completewith next
    >>杀死 |cRXP_ENEMY_Corrupted Tide Crawlers|r 并掠夺他们的 |cRXP_LOOT_Corrupted Tide Crawler Flesh。|r
    .complete 13521,1 --4/4 Corrupted Tide Crawler Flesh
	.mob Corrupted Tide Crawler
step
    .goto 62,52.41,19.60,20,0
    .goto 62,52.50,16.62,20,0
    .goto 62,52.57,17.53,20,0
    .goto 62,53.18,18.53,20,0
    .goto 62,52.41,19.60
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Encrusted Clam Muscle。|r
    .complete 13520,1 --16/16 Encrusted Clam Muscle
step
    .goto 62,52.41,19.60,20,0
    .goto 62,52.50,16.62,20,0
    .goto 62,52.57,17.53,20,0
    .goto 62,53.18,18.53,20,0
    .goto 62,52.41,19.60
    >>杀死 |cRXP_ENEMY_Corrupted Tide Crawlers|r 并掠夺他们的 |cRXP_LOOT_Corrupted Tide Crawler Flesh。|r
    .complete 13521,1 --4/4 Corrupted Tide Crawler Flesh
	.mob Corrupted Tide Crawler
step
    .goto 62,53.24,19.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Buzzbox 413.|r
    .turnin 13521 >>交任务: |cRXP_FRIENDLY_传声盒413号|r
    .accept 13527 >>接任务: |cRXP_WARN_食性无常|r
step
    .goto 62,55.1,21.0
    >>|TInterface/cursor/crosshair/interact.blp:20|t与 |cRXP_ENEMY_Decomposing Thistle 熊 互动。|r
    .complete 13527,1 --1/1 Foul 熊 Carcass Sample
	.target Decomposing Thistle 熊
step
    .goto 62,51.17,19.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维兹班恩·曲针|r
    .turnin 13527 >>交任务: |cRXP_FRIENDLY_食性无常|r
    .accept 13528 >>接任务: |cRXP_WARN_传声盒723号|r
	.target Wizbang Cranktoggle
step
    .goto 62,52.96,25.46,40,0
    .goto 62,54.02,25.28,40,0
    .goto 62,55.73,23.95,40,0
    .goto 62,54.87,27.67,40,0
    .goto 62,52.96,25.46
    >>杀死 |cRXP_ENEMY_熊s|r 并掠夺他们的 |cRXP_LOOT_Corrupted Thistle 熊 Guts。|r
    .complete 13528,1 --6/6 Corrupted Thistle 熊 Guts
	.mob Corrupted Thistle 熊
	.mob Corrupted Thistle 熊 Matriarch
	.mob Thistle 熊 Cub
step
    .goto 62,54.17,29.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Buzzbox 723.|r
    .turnin 13528 >>交任务: |cRXP_FRIENDLY_传声盒723号|r
    .accept 13554 >>接任务: |cRXP_WARN_黑暗中的解药|r
step
    #label itall
    .goto 62,56.26,27.41,40,0
    .goto 62,56.78,30.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨纳瑞恩·绿树|r
    .accept 13529 >>接任务: |cRXP_WARN_腐化的源头|r
	.target Tharnariun
step
    #completewith next
	>>杀死 |cRXP_ENEMY_Vile Grells|r 和 |cRXP_ENEMY_Vile Corrupters|r 并从他们身上夺取 |cRXP_LOOT_Foul Ichor|r 和 |cRXP_LOOT_Corruptor's Master Key。|r
	>>|cRXP_WARN_在执行任务时检查 |cRXP_ENEMY_Licillin(Rare|r)。|r
    .complete 13554,1 --6/6 Foul Ichor
    .complete 13529,2 --8/8 Vile Grell slain	
	.collect 44927,1,13557	
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Corruptor 的主密钥。|r
    .accept 13557 >>接任务: |cRXP_WARN_幸运儿|r
    .use 44927 
	.mob Vile Grell
	.mob Vile Corruptor
	.unitscan Licillin
step
    .goto 62,57.51,32.31,15,0
    .goto 62,58.58,32.24,15,0
    .goto 62,58.13,32.84,15,0
    .goto 62,57.34,33.00,15,0
    .goto 62,57.17,32.12,15,0
    .goto 62,56.97,32.66,15,0
    .goto 62,56.58,33.64,15,0
    .goto 62,57.10,34.18
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击洞穴中的 |cRXP_PICK_Cages|r |cFFfa9602。|r
	.complete 13557,1
step
    .goto 62,58.41,33.08
    >>杀死洞穴内的 |cRXP_ENEMY_Zenn|r |cFFfa9602。|r
    >>|cRXP_WARN_检查他旁边的箱子。它可能不在那里。|r
    .complete 13529,1 --1/1 Zenn Foulhoof slain
	.mob Zenn Foulhoof
step
    .goto 62,57.51,32.31,30,0
    .goto 62,58.58,32.24,30,0
    .goto 62,58.13,32.84,30,0
    .goto 62,57.34,33.0,30,0
    .goto 62,57.17,32.12,30,0
    .goto 62,56.97,32.66,30,0
    .goto 62,56.58,33.64,30,0
    .goto 62,57.10,34.18
    >>杀死 |cRXP_ENEMY_Vile Grells|r 和 |cRXP_ENEMY_Vile Corrupters|r 并从他们身上夺取 |cRXP_LOOT_Foul Ichor|r 和 |cRXP_LOOT_Corruptor's Master Key。|r
    >>|cRXP_WARN_在执行任务时检查 |cRXP_ENEMY_Licillin(Rare|r)。|r
    .complete 13554,1 --6/6 Foul Ichor
    .complete 13529,2 --8/8 Vile Grell slain	
	.collect 44927,1,13557	
	>>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_Corruptor 的主密钥。|r
    .accept 13557 >>接任务: |cRXP_WARN_幸运儿|r	
	.mob Vile Grell
	.mob Vile Corrup
	.unitscan Licillin	
    .use 44927 
step
    .goto 62,56.79,33.52,20,0
    .goto 62,57.43,33.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击洞穴后面的 |cRXP_PICK_Disgusting Workbench|r |cFFfa9602。|r
    .accept 13831 >>接任务: |cRXP_WARN_令人不安的处方|r  
step
    #completewith next
    .deathskip >>死亡并重生 |cFFfa9602rat 灵魂治疗师。|
step
    #completewith next
    #requires itall
    .goto 62,51.13,19.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_萨纳瑞恩·绿树|r
    .turnin 13557 >>交任务: |cRXP_FRIENDLY_幸运儿|r
    .turnin 13831 >>交任务: |cRXP_FRIENDLY_幸运儿|r
    .turnin 13529 >>交任务: |cRXP_FRIENDLY_腐化的源头|r
	.target 萨纳利恩护树人
step
    .goto 62,51.14,19.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wizbang.|r
    .turnin 13554 >>交任务: |cRXP_FRIENDLY_黑暗中的解药|r
	.target Wizbang
step
    .goto 62,50.90,18.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_塞瑞蒂亚·橡语|r
    .turnin 13520 >>交任务: |cRXP_FRIENDLY_海洋的恩赐|r
	.target Serendia Oakwhisper
step
    #completewith next
    .hs >>壁炉 |cFFfa9602to Dolanaar。|r
step
    .goto 57,56.73,53.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_奈欧玛|r
    .turnin 6343 >>交任务: |cRXP_FRIENDLY_飞回泰达希尔|r
	.target Nyoma
step
    .goto 57,59.51,49.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_赛恩·腐蹄|r
    .turnin 489 >>交任务: |cRXP_FRIENDLY_寻求救赎！|r
	.target Zenn Foulhoof
step
	#completewith next
    .goto 57,55.49,50.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_菲德利奥|r
    .fly Darnassus >>飞往 |cFFfa9602达纳苏斯|r
	.target Fidelio
step
    #veteran
    .goto 89,56.58,60.73,10,0
    .goto 89,54.82,59.18
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r 你需要从拍卖行购买 |cRXP_WARN_特定物品才能充分利用此活动。|r 如有必要，|cRXP_WARN_你可以从其他角色转移金币进行这些购买。|r 但是，如果你发现自己买不起所有东西，|cRXP_WARN_前往暗月马戏团获得临时经验值提升并只购买部分物品仍然是值得的。|r
    >>|cRXP_WARN_建议用其他拥有至少10000金币的角色登录，用这个角色购买物品然后寄过来。|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to the |cRXP_FRIENDLY_Auctioneer.|r
    .collect 71715,1
    .collect 71638,1
    .collect 71637,1
    .collect 71636,1
    .collect 71635,1
    .collect 71952,1
    .collect 71951,1
    .collect 71953,1
    .collect 71716,1
    .target Auctioneer Tolon
    .target Auctioneer Golothas
    .target Auctioneer Cazarez
    .target Auctioneer Golothas
step
    #fresh
    #completewith DarkMoonFaire
    +暗月马戏团活动现已开启，|cRXP_WARN_保证让你免费获得额外等级并获得 10% 的临时经验值提升。|r
step
    #completewith next
    .link /run AbandonSkill(186); AbandonSkill(182);>>|cRXP_WARN_单击此文本即可接收一个将忘记您的职业的宏。|r
    .dmf
step
    #label DarkMoonFaire
    .goto 89,38.58,49.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .accept 7905 >>接任务: |cRXP_WARN_暗月马戏团|r
	.target Darkmoon Faire Mystic Mage
    .dmf
step 
    .goto 89,38.58,49.38
    +|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_暗月马戏团秘法师|r
    .skipgossip
    .zoneskip 37
    .dmf
	.target Darkmoon Faire Mystic Mage
step 
    #completewith next
    .goto 89,36.58,49.23,20 >>走进|cFFfa9602紫色区域|r 进行传送。
    .zoneskip 97
    .nodmf
step 
    .goto 57,52.28,89.47,5 >>|TInterface/cursor/crosshair/interact.blp:20|t单击 |cRXP_PICK_Exodar 门户。|r
    .zoneskip 97
    .nodmf
step 
    .goto 103,41.87,72.93,10 >>进入 |cFFfa9602埃索达城|r 并 |cFFfa9602走下螺旋楼梯。|r
    .goto 103,48.33,62.94,10 >>点击|cRXP_PICK_Stormwind 传送门|r
    .zoneskip 84
    .nodmf
step 
	.goto 84,62.81,71.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_英雄传令官|r
    .accept 46727 >>接任务: |cRXP_WARN_争霸艾泽拉斯：战争之潮|r
	.target Hero's Herald
    .nodmf
step 
    .nodmf
	.goto 84,63.76,73.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_雷纳多·加林纳|r
    .accept 332 >>接任务: |cRXP_WARN_酒店的广告|r
	.target Renato Gallina
step 
    .nodmf
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_勇敢的巴特利|r
    .goto 37,41.71,64.64
    .fp >>获取金郡飞行路线
	.target Bartlett the Brave
]])
