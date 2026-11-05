RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP <争霸艾泽拉斯>战争战役
#group权重 4
#name 1) 艾泽拉斯之心
#displayname 第 1 章 - 艾泽拉斯之心
#next 2) 沃顿据点
<< Alliance
step
    .goto 1161,75.06,14.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_土灵守护者|r
    .accept 53028 >>接任务: |cRXP_WARN_垂死的世界|r
    .target 土灵守护者
step
    .goto 1161,67.08,23.58,5,0
    .goto 1161,69.09,25.08,30,0
    .goto 1161,69.65,15.92
    .isOnQuest 53028
    .zone 81 >>通过传送门前往希利苏斯
step
    .goto 81,42.22,44.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_麦格尼·铜须|r
    .turnin 53028 >>交任务: |cRXP_FRIENDLY_垂死的世界|r
    .accept 51211 >>接任务: |cRXP_WARN_艾泽拉斯之心|r
    .target 麦格尼·铜须
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_泰坦传送装置|r
    .goto 81,43.16,44.51
    .complete 51211,1 --1/1 Use device in Silithus  to travel to Chamber of the Heart
step
    .goto 1021,50.17,53.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_麦格尼·铜须|r
    >>|cRXP_WARN_按键盘上的 ESC 键跳过过场动画|r
    .complete 51211,3 --1/1 Speak to Magni within the Chamber of Heart
    .skipgossip 136907,1
    .target 麦格尼·铜须
step
    .goto 1021,50.17,53.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_麦格尼·铜须|r
    .turnin 51211 >>交任务: |cRXP_FRIENDLY_艾泽拉斯之心|r
    .target 麦格尼·铜须
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP <争霸艾泽拉斯>战争战役
#name 2) 沃顿据点
#displayname 第 2 章 - 沃顿据点
#next 3) 纳兹米尔据点
<<Alliance
step
    .zoneskip 1021,1
    .goto 1021,50.02,30.69
    .zone 81 >>使用泰坦传送装置
step
    .zoneskip 81,1
    .goto 81,41.49,44.85
    .zone 1163 >>通过传送门前往提拉加德
step
    .isQuestAvailable 51569
    .goto 1161,69.27,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 51569 >>接任务: |cRXP_WARN_赞达拉战役|r
    .target Halford Wyrmbane
step
    .isQuestAvailable 51571
    .isQuestTurnedIn 51569
    .goto 1161,69.26,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 51961 >>接任务: |cRXP_WARN_继续作战|r
    .target Halford Wyrmbane
step
    .isQuestAvailable 51571
    .isQuestTurnedIn 51961
    .goto 1161,69.28,27.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 52443 >>接任务: |cRXP_WARN_最后的据点|r
    .target Halford Wyrmbane
step
    .goto 1161,69.36,26.93
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉战役桌|r 选择 |cRXP_WARN_沃顿|r, 点击小地图下方弹出提示提交任务
    >>|cRXP_WARN_如果不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51572 >>接任务: |cRXP_WARN_据点：沃顿|r
    .turnin 51572 >>交任务: |cRXP_FRIENDLY_据点：沃顿|r
step
    .goto 1161,69.26,26.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51569 >>交任务: |cRXP_FRIENDLY_赞达拉战役|r
    .accept 51283 >>接任务: |cRXP_WARN_起程西行|r
    .target Halford Wyrmbane
step
    .isOnQuest 51283
    .goto 1161,67.95,26.71
    .gossipoption 48162 >>对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .target 杰塔瑞斯将军
step
    .goto 864,32.91,34.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51283 >>交任务: |cRXP_FRIENDLY_起程西行|r
    .accept 51170 >>接任务: |cRXP_WARN_冲啊！|r
    .target Halford Wyrmbane
step
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_绳子|r
    >>|cRXP_WARN_若不小心掉落, 船旁有梯子可以爬回来|r
    .goto 864,32.99,34.87
    .complete 51170,1 --1/1 Landing craft boarded
    .timer 20.5, Boat RP
step
    >>|cRXP_ENEMY_击杀塞斯拉克|r
    .goto 864,36.94,33.05,30,0
    .goto 864,37.5,33.27,30,0
    .goto 864,38.1,34.45,30,0
    .goto 864,39.11,35.56,15,0
#loop
	.line 864,36.94,33.05,37.5,33.27,38.1,34.45,37.69,35.66,36.91,34.85
	.goto 864,36.94,33.05,30,0
	.goto 864,37.50,33.27,30,0
	.goto 864,38.10,34.45,30,0
	.goto 864,37.69,35.66,30,0
	.goto 864,36.91,34.85,30,0
    .complete 51170,2 --15/15 Sethrak forces slain
    .mob 塞瑟rak Raider
    .mob 塞瑟rak Mender
    .mob Krolusk Warcrawler
    .mob 塞瑟rak Battle Rider
step
    .goto 864,39.65,35.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军士艾米|r交谈
    .turnin 51170 >>交任务: |cRXP_FRIENDLY_冲啊！|r
    .accept 51229 >>接任务: |cRXP_WARN_建立滩头基地|r
    .target Sergeant Ermey
step
    .goto 864,37.55,35.32
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_联盟旗帜|r
    .complete 51229,1 --1/1 Plant the Alliance Banner
step
    .goto 864,37.72,35.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51229 >>交任务: |cRXP_FRIENDLY_建立滩头基地|r
    .accept 51349 >>接任务: |cRXP_WARN_为了信义|r
    .target Halford Wyrmbane
step
    .goto 864,38.96,42.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军士艾米|r交谈
    .turnin 51349 >>交任务: |cRXP_FRIENDLY_为了信义|r
    .accept 51350 >>接任务: |cRXP_WARN_意外援助|r
    .accept 51351 >>接任务: |cRXP_WARN_剧毒倒刺|r
    .target Sergeant Ermey
step
    #completewith Saltspine Barb
    >>击杀 |cRXP_ENEMY_盐脊克洛鲁斯|r 并拾取 |T132274:0|t|cRXP_LOOT_倒钩|r
    .complete 51351,1 --8/8 Saltspine Barb
step
    .goto 864,39.6,42.84
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_刺梨|r
    .complete 51350,1,1 --8/8 Prickly Pear Root
step
    .goto 864,40.28,42.88
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_刺梨|r
    .complete 51350,1,2 --8/8 Prickly Pear Root
step
    .goto 864,40.51,41.92
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_刺梨|r
    .complete 51350,1,3 --8/8 Prickly Pear Root
step
    .goto 864,40.9,41.71
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_刺梨|r
    .complete 51350,1,4 --8/8 Prickly Pear Root
step
    .goto 864,41.46,42.04
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_刺梨|r
    .complete 51350,1,5 --8/8 Prickly Pear Root
step
    .goto 864,41.68,41.49
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_刺梨|r
    .complete 51350,1,6 --8/8 Prickly Pear Root
step
    .goto 864,41.64,40.04
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_刺梨|r
    .complete 51350,1,7 --8/8 Prickly Pear Root
step
    .goto 864,40.9,40.57
    #label Saltspine Barb
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_刺梨|r
    .complete 51350,1,8 --8/8 Prickly Pear Root
step
#loop
	.line 864,40.2,40.58,39.6,42.03,40.96,42.31,41.95,41.24
	.goto 864,40.20,40.58,15,0
	.goto 864,39.60,42.03,15,0
	.goto 864,40.96,42.31,15,0
	.goto 864,41.95,41.24,15,0
    >>击杀 |cRXP_ENEMY_盐脊克洛鲁斯|r 并拾取 |T132274:0|t|cRXP_LOOT_倒钩|r
    .complete 51351,1 --8/8 Saltspine Barb
step
    .goto 864,38.95,42.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军士艾米|r交谈
    .turnin 51350 >>交任务: |cRXP_FRIENDLY_意外援助|r
    .turnin 51351 >>交任务: |cRXP_FRIENDLY_剧毒倒刺|r
    .accept 51366 >>接任务: |cRXP_WARN_使用解毒剂|r
    .target Sergeant Ermey
step
    #title Interact with |cRXP_FRIENDLY_Vorrik|r
    >>与 |cRXP_FRIENDLY_沃里克|r 互动
    .goto 864,38.96,42.98
    .use 160045
    .complete 51366,1 --1/1 Antidote Salve applied
    .target Vorrik
    .timer 4, Vorrik RP
step
    .goto 864,38.96,42.98
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃瑞克|r交谈
    .turnin 51366 >>交任务: |cRXP_FRIENDLY_使用解毒剂|r
    .accept 51369 >>接任务: |cRXP_WARN_异乡异友|r
    .target Vorrik
    .timer 6,Pterrordax RP
step
    #title Interact |cRXP_FRIENDLY_Pterrordax|r
    .goto 864,39.08,43.06
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    >>与 |cRXP_FRIENDLY_驯服的翼手龙|r 互动
    .complete 51369,1 --1/1 Pterrordax mounted
    .timer 55,Pterrordax Flight
step
    .goto 864,27.24,54.15
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 51369,2 --1/1 Fly to the Sanctuary of the Devoted
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃瑞克|r和|cRXP_FRIENDLY_军士艾米|r交谈
    .turnin 51369 >>交任务: |cRXP_FRIENDLY_异乡异友|r
    .accept 51391 >>接任务: |cRXP_WARN_蛇口拔牙|r
    .accept 51394 >>接任务: |cRXP_WARN_突破重围|r
    .goto 864,27.23,53.94
    .accept 51389 >>接任务: |cRXP_WARN_挣脱束缚|r
    .goto 864,27.18,53.91
    .target Vorrik
    .target Sergeant Ermey
step
    #completewith Spires
    >>击杀 |cRXP_ENEMY_无信者|r
    .complete 51391,1 --12/12 Faithless slain
    .mob Faithless Warden
    .mob Faithless Skycaller
    .mob Faithless Ravager
    .mob Faithless Agressor
step
    #title Spire
    .goto 864,29.08,54.95
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_尖塔|r
    .complete 51394,3,1 --2/2 Spires shattered
step
    #title Banner
    .goto 864,29.37,54.00
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_旗帜|r
    .complete 51394,1,1 --4/4 Banners burned
step
    #title Cannon
    .goto 864,29.49,53.83
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火炮|r
    .complete 51394,2,1 --4/4 Cannons crushed
step
    #title Cannon
    .goto 864,29.64,53.67
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火炮|r
    .complete 51394,2,2 --4/4 Cannons crushed
step
    #title Cage
    .goto 864,30.08,53.66
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_笼子|r 救出 |cRXP_FRIENDLY_詹姆斯列兵|r
    .complete 51389,1 --1/1 Private James rescued
step
    #title Banner
    .goto 864,29.75,53.04
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_旗帜|r
    .complete 51394,1,2 --4/4 Banners burned
step
    #title Banner
    .goto 864,29.74,52.09
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_旗帜|r
    .complete 51394,1,3 --4/4 Banners burned
step
    #title Cannon
    .goto 864,29.67,51.53
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火炮|r
    .complete 51394,2,3 --4/4 Cannons crushed
step
    #title Cannon
    .goto 864,29.53,51.34
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火炮|r
    .complete 51394,2,4 --4/4 Cannons crushed
step
    #title Banner
    .goto 864,29.42,51.17
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_旗帜|r
    .complete 51394,1,4 --4/4 Banners burned
step
    #label Spires
    #title Spire
    .goto 864,28.89,51.46
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_尖塔|r
    .complete 51394,3,2 --2/2 Spires shattered
step
#loop
	.line 864,28.97,54.75,30.43,54.54,30.01,51.35,29.02,51.91
	.goto 864,28.97,54.75,30,0
	.goto 864,30.43,54.54,30,0
	.goto 864,30.01,51.35,30,0
	.goto 864,29.02,51.91,30,0
    >>击杀 |cRXP_ENEMY_无信者|r
    .complete 51391,1 --12/12 Faithless slain
    .mob Faithless Warden
    .mob Faithless Skycaller
    .mob Faithless Ravager
    .mob Faithless Agressor
step
    #completewith next
    .goto 864,27.22,51.39,10 >>进入 |cFFfa9602金字塔|r 一楼
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与金字塔内的|cRXP_FRIENDLY_詹姆斯列兵|r和|cRXP_FRIENDLY_沃瑞克|r交谈
    .turnin 51389 >>交任务: |cRXP_FRIENDLY_挣脱束缚|r
    .goto 864,27.56,52.61
    .turnin 51391 >>交任务: |cRXP_FRIENDLY_蛇口拔牙|r
    .turnin 51394 >>交任务: |cRXP_FRIENDLY_突破重围|r
    .accept 51395 >>接任务: |cRXP_WARN_守护者的钥匙|r
    .goto 864,27.62,52.57
    .target Vorrik
    .target Private James
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_詹姆斯列兵|r交谈
    .goto 864,27.56,52.61
    .skipgossip
    .complete 51395,1 --1/1 Speak to Private James
    .timer 92,Follow Vorrik RP
    .target Private James
step
    .goto 864,26.54,51.97,10,0
    .goto 864,26.72,52.58,10,0
    .goto 864,27.11,52.57
    >>沿箭头前进
    >>|cRXP_WARN_等待 |cRXP_FRIENDLY_沃里克|r 到来, 计时器归零后任务完成|r
    .complete 51395,2 --1/1 Follow Vorrik
step
    .goto 864,27.11,52.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沃瑞克|r交谈
    .turnin 51395 >>交任务: |cRXP_FRIENDLY_守护者的钥匙|r
    .target Vorrik
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军士艾米|r交谈
    .goto 864,27.02,52.50
    .accept 51402 >>接任务: |cRXP_WARN_战况报告|r
    .target Sergeant Ermey
step
    .goto 864,26.69,52.56,10,0
    .goto 864,37.71,35.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51402 >>交任务: |cRXP_FRIENDLY_战况报告|r
    .target Halford Wyrmbane
step
    .goto 864,37.47,35.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .turnin 52008 >>交任务: |cRXP_FRIENDLY_勇士：魔导师乌布里克|r
    .target Magister Umbric
step
    .goto 864,37.71,35.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 51969 >>接任务: |cRXP_WARN_返回伯拉勒斯|r
    .target Halford Wyrmbane
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .goto 864,34.91,33.76
    .skipgossip 135681,1
    .complete 51969,1 --Speak to Jes-Tereth
    .target 杰塔瑞斯将军
step
    .goto 1161,69.26,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51969,3 >>交任务: |cRXP_FRIENDLY_返回伯拉勒斯|r
    .target Halford Wyrmbane
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP <争霸艾泽拉斯>战争战役
#name 3) 纳兹米尔据点
#displayname 第 3 章 - 纳兹米尔据点
#next 4) 岛屿远征
<< Alliance
step
    .isQuestAvailable 51571
    .isQuestAvailable 51569
    .goto 1161,69.27,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 51569 >>接任务: |cRXP_WARN_赞达拉战役|r
    .target Halford Wyrmbane
step
    .isQuestAvailable 51571
    .isQuestTurnedIn 51569
    .goto 1161,69.26,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 51961 >>接任务: |cRXP_WARN_继续作战|r
    .target Halford Wyrmbane
step
    .isQuestAvailable 51571
    .isQuestTurnedIn 51961
    .goto 1161,69.28,27.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 52443 >>接任务: |cRXP_WARN_最后的据点|r
    .target Halford Wyrmbane
step
    .isQuestAvailable 51571
    .isOnQuest 51569
    .goto 1161,69.38,26.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉战役桌|r 选择 |cRXP_WARN_纳兹米尔|r, 点击小地图下方弹出提示提交任务
    >>|cRXP_WARN_如果不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51571 >>接任务: |cRXP_WARN_据点：纳兹米尔|r
    .turnin 51571 >>交任务: |cRXP_FRIENDLY_据点：纳兹米尔|r
step
    .isQuestAvailable 51571
    .isOnQuest 51961
    .goto 1161,69.38,26.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉战役桌|r 选择 |cRXP_WARN_纳兹米尔|r, 点击小地图下方弹出提示提交任务
    >>|cRXP_WARN_如果不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51571 >>接任务: |cRXP_WARN_据点：纳兹米尔|r
    .turnin 51571 >>交任务: |cRXP_FRIENDLY_据点：纳兹米尔|r
step
    .isQuestAvailable 51571
    .isOnQuest 52443
    .goto 1161,69.38,26.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉战役桌|r 选择 |cRXP_WARN_纳兹米尔|r, 点击小地图下方弹出提示提交任务
    >>|cRXP_WARN_如果不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51571 >>接任务: |cRXP_WARN_据点：纳兹米尔|r
    .turnin 51571 >>交任务: |cRXP_FRIENDLY_据点：纳兹米尔|r
step
    .isOnQuest 52443
    .goto 1161,69.27,26.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52443 >>交任务: |cRXP_FRIENDLY_最后的据点|r
    .target Halford Wyrmbane
step
    .isOnQuest 51961
    .goto 1161,69.27,26.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51961 >>交任务: |cRXP_FRIENDLY_继续作战|r
    .accept 51088 >>接任务: |cRXP_WARN_黑暗之心|r
    .target Halford Wyrmbane
step
    .isOnQuest 51689
    .goto 1161,69.26,26.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51569 >>交任务: |cRXP_FRIENDLY_赞达拉战役|r
    .accept 51283 >>接任务: |cRXP_WARN_起程西行|r
    .target Halford Wyrmbane
step
    #completewith next
    .goto 1161,67.95,26.69
    .gossipoption 48164 >>对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .timer 83,Travel to Fort Victory RP
    .target 杰塔瑞斯将军
step
    .goto 863,61.45,39.92
    >>|cRXP_WARN_等待船只到达, 计时器归零后任务完成|r
    .complete 51088,2 --Travel to Fort Victory
step
    .goto 863,62.03,41.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布莱恩·铜须|r
    .turnin 51088 >>交任务: |cRXP_FRIENDLY_黑暗之心|r
    .accept 51129 >>接任务: |cRXP_WARN_可疑的祭品|r
    .target 布莱恩·铜须
step
    #title 与 |cRXP_FRIENDLY_蝙蝠|r 互动
    .goto 863,62.11,42.51
    >>与 |cRXP_FRIENDLY_蝙蝠|r 互动
    .complete 51129,1 --1/1 Bat flown to Zalamar
    .timer 60,Bat Flight RP
    .target Zalamar Messenger Bat
step
    .goto 863,31.16,46.71
    >>|cRXP_WARN_等待蝙蝠到达, 计时器归零后任务完成|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布莱恩·铜须|r
    .turnin 51129 >>交任务: |cRXP_FRIENDLY_可疑的祭品|r
    .accept 51167 >>接任务: |cRXP_WARN_希里克之血|r
    .accept 51150 >>接任务: |cRXP_WARN_向逝者致敬|r
    .target 布莱恩·铜须
step
    #title |cRXP_FRIENDLY_Soldier 1|r
    .goto 863,31.11,46.74
    >>与 |cRXP_FRIENDLY_士兵|r 互动
    .complete 51150,1,1 --7/7 Dog Tag recovered
step
    #title |cRXP_FRIENDLY_Soldier 2|r
    .goto 863,31.10,47.22
    >>与 |cRXP_FRIENDLY_士兵|r 互动
    .complete 51150,1,2 --7/7 Dog Tag recovered
step
    #title |cRXP_FRIENDLY_Soldier 3|r
    .goto 863,31.42,47.6
    >>与 |cRXP_FRIENDLY_士兵|r 互动
    .complete 51150,1,3 --7/7 Dog Tag recovered
step
    #title |cRXP_FRIENDLY_Soldier 4|r
    .goto 863,31.75,47.14
    >>与 |cRXP_FRIENDLY_士兵|r 互动
    .complete 51150,1,4 --7/7 Dog Tag recovered
step
    #title |cRXP_FRIENDLY_Soldier 5|r
    .goto 863,30.72,45.84
    >>与 |cRXP_FRIENDLY_士兵|r 互动
    .complete 51150,1,5 --7/7 Dog Tag recovered
step
    #title |cRXP_FRIENDLY_Soldier 6|r
    .goto 863,30.58,46.18
    >>与 |cRXP_FRIENDLY_士兵|r 互动
    .complete 51150,1,6 --7/7 Dog Tag recovered
step
    #title |cRXP_FRIENDLY_Soldier 7|r
    .goto 863,29.64,46.05
    >>与 |cRXP_FRIENDLY_士兵|r 互动
    .complete 51150,1,7 --7/7 Dog Tag recovered
step
    .goto 863,29.22,46.52
    >>击杀 |cRXP_ENEMY_鲜血女巫帕卡拉|r
    .complete 51167,1 --1/1 Blood Witch Pakkala slain
    .mob 鲜血 Witch Pakkala
step
    .goto 863,31.16,46.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布莱恩·铜须|r
    .turnin 51167 >>交任务: |cRXP_FRIENDLY_希里克之血|r
    .turnin 51150 >>交任务: |cRXP_FRIENDLY_向逝者致敬|r
    .accept 51168 >>接任务: |cRXP_WARN_扎拉玛狂热者|r
    .target 布莱恩·铜须
step
    .goto 863,31.52,46.14,10,0
    .goto 863,31.82,45.6,10,0
    .goto 863,32.3,46.15,10,0
    .goto 863,32.12,47.34,10,0
    .goto 863,31.69,48.19,10,0
#loop
	.line 863,31.52,46.14,31.82,45.6,32.3,46.15,32.12,47.34,31.69,48.19
	.goto 863,31.52,46.14,15,0
	.goto 863,31.82,45.60,15,0
	.goto 863,32.30,46.15,15,0
	.goto 863,32.12,47.34,15,0
	.goto 863,31.69,48.19,15,0
    >>击杀 |cRXP_ENEMY_扎拉马尔狂热者|r
    .complete 51168,1 --10/10 Zalamar Zealot slain
    .mob Zalamar Zealot
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旁边的 |cRXP_FRIENDLY_布莱恩·铜须|r 交谈
    .turnin 51168 >>交任务: |cRXP_FRIENDLY_扎拉玛狂热者|r
    .accept 51169 >>接任务: |cRXP_WARN_坠落之洞的飞行|r
    .target 布莱恩·铜须
step
    #title Interact with the Bat
    .goto 863,31.14,47.99
    >>与 |cRXP_FRIENDLY_蝙蝠|r 互动
    .complete 51169,1 --1/1 Bat flown to Fort Victory
    .timer 63,Bat Flight RP
    .target Zalamar Messenger Bat
step
    .goto 863,62.03,41.60
    >>|cRXP_WARN_等待蝙蝠到达, 计时器归零后任务完成|r
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布莱恩·铜须|r
    .turnin 51169 >>交任务: |cRXP_FRIENDLY_坠落之洞的飞行|r
    .accept 51281 >>接任务: |cRXP_WARN_祖纳兹曼|r
    .target 布莱恩·铜须
step
    .goto 863,49.97,50.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布莱恩·铜须|r
    .turnin 51281 >>交任务: |cRXP_FRIENDLY_祖纳兹曼|r
    .accept 51279 >>接任务: |cRXP_WARN_纳兹曼尼教徒|r
    .accept 51280 >>接任务: |cRXP_WARN_戈霍恩供品|r
    .target 布莱恩·铜须
step
    #completewith offering
    >>击杀 |cRXP_ENEMY_纳兹曼尼巨魔|r
    .complete 51279,1 --15/15 Nazmani troll slain
    .mob Nazmani Warrior
    .mob 萨安guine Disciple
    .mob Nazmani Drudge
    .mob Nazmani Ritualist
step
    .goto 863,48.03,52.03
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cFFfa9602帐篷|r 内的 |cRXP_PICK_花瓶|r
    .complete 51280,1,1 --8/8 Offering to G'huun destroyed
step
    .goto 863,47.92,52.38
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cFFfa9602帐篷|r 内的 |cRXP_PICK_花瓶|r
    .complete 51280,1,2 --8/8 Offering to G'huun destroyed
step
    .goto 863,47.77,52.11,5,0
    .goto 863,47.46,52.78
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cFFfa9602帐篷|r 内的 |cRXP_PICK_花瓶|r
    .complete 51280,1,3 --8/8 Offering to G'huun destroyed
step
    .goto 863,47.25,52.91
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cFFfa9602帐篷|r 内的 |cRXP_PICK_花瓶|r
    .complete 51280,1,4 --8/8 Offering to G'huun destroyed
step
    .goto 863,46.99,52.09
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cFFfa9602帐篷|r 内的 |cRXP_PICK_花瓶|r
    .complete 51280,1,5 --8/8 Offering to G'huun destroyed
step
    .goto 863,46.31,50.56
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击开放世界中的 |cRXP_PICK_花瓶|r
    .complete 51280,1,6 --8/8 Offering to G'huun destroyed
step
    .goto 863,45.6,51.44
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击开放世界中的 |cRXP_PICK_花瓶|r
    .complete 51280,1,7 --8/8 Offering to G'huun destroyed
step
    #label offering
    .goto 863,46.17,52.43
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击开放世界中的 |cRXP_PICK_花瓶|r
    .complete 51280,1,8 --8/8 Offering to G'huun destroyed
step
#loop
	.line 863,46.17,52.43,48.65,52.43,45.50,59.64,45.8,53.58,47.33,51.20
	.goto 863,46.17,52.43,30,0
	.goto 863,48.65,52.43,30,0
	.goto 863,45.50,59.64,30,0
	.goto 863,45.80,53.58,30,0
	.goto 863,47.33,51.20,30,0
    >>击杀 |cRXP_ENEMY_纳兹曼尼巨魔|r
    .complete 51279,1 --15/15 Nazmani troll slain
    .mob Nazmani Warrior
    .mob 萨安guine Disciple
    .mob Nazmani Drudge
    .mob Nazmani Ritualist
step
    .goto 863,45.71,57.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布莱恩·铜须|r
    .turnin 51279 >>交任务: |cRXP_FRIENDLY_纳兹曼尼教徒|r
    .turnin 51280 >>交任务: |cRXP_FRIENDLY_戈霍恩供品|r
    .accept 51282 >>接任务: |cRXP_WARN_康拉德队长|r
    .target 布莱恩·铜须
step
    .goto 863,44.98,57.64,5,0
    .goto 863,45.00,57.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在|cFFfa9602帐篷|r内与|cRXP_FRIENDLY_康拉德上尉|r交谈
    .turnin 51282 >>交任务: |cRXP_FRIENDLY_康拉德队长|r
    .accept 51177 >>接任务: |cRXP_WARN_恶魔的教训|r
    .timer 63,Follow Captain Conrad RP
    .target Captain Conrad
step
    .goto 863,45.70,59.73
    >>跟随 |cRXP_FRIENDLY_康拉德队长|r
    .complete 51177,1 --1/1 Follow Captain Conrad
    .timer 8, Captain Conrad RP
    .target Captain Conrad
step
    >>击杀 |cRXP_ENEMY_康拉德队长|r
    .complete 51177,2 --1/1 Captain Conrad slain
    .mob Captain Conrad
step
    .goto 863,62.03,41.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布莱恩·铜须|r
    .turnin 51177 >>交任务: |cRXP_FRIENDLY_恶魔的教训|r
    .target 布莱恩·铜须
step
    .goto 863,61.79,41.32
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_约翰·J·基沙恩|r
    .turnin 52013 >>交任务: |cRXP_FRIENDLY_勇士：约翰·J·基沙恩|r
    .target 约翰·J·基沙恩
step
    .goto 863,62.03,41.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布莱恩·铜须|r
    .accept 51967 >>接任务: |cRXP_WARN_返回伯拉勒斯|r
    .target 布莱恩·铜须
step
    .goto 863,62.06,40.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德莎·风淹|r交谈
    .skipgossip
    .complete 51967,1 --Speak to Desha Stormwallow
    .target Desha Stormwallow
step
    .goto 1161,69.27,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51967 >>交任务: |cRXP_FRIENDLY_返回伯拉勒斯|r
    .target Halford Wyrmbane
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP <争霸艾泽拉斯>战争战役
#name 4) 岛屿远征
#displayname 第 4 章 - 海岛探险
#next 5) 祖达萨据点
<< Alliance
step
    .isQuestAvailable 51994
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .goto 1161,69.27,27.01
    .accept 51903 >>接任务: |cRXP_WARN_海岛探险|r
    .target Halford Wyrmbane
step
    .goto 1161,66.87,33.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗林·费尔温德|r交谈
    .turnin 51903 >>交任务: |cRXP_FRIENDLY_海岛探险|r
    .accept 51904 >>接任务: |cRXP_WARN_海岛探险|r
    .target Flynn Fairwind
step
    .goto 1161,66.86,33.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗林·费尔温德|r交谈
    .complete 51904,1 --1/1 Speak with Flynn Fairwind
    .skipgossip 1
    .target Flynn Fairwind
step
    .isOnQuest 51904
    #sticky
    #label AllianceIslandExpedition
    >>完成岛屿远征场景
    >>|cRXP_WARN_若处于战斗中, 击杀敌人以脱战|r
    .complete 51904,2 --1/1 Explore the Uncharted Island
step
    .isOnQuest 51904
    #title Go to Crystal 1
    .goto 1022,79.25,63.92
    >>|cRXP_WARN_沿箭头前进|r
    .scenario 3838,1 --1/1 Investigate the Azerite
step
    .isOnQuest 51904
    #title Mine Crystal 1
    .goto 1022,79.25,63.92
    >>挖掘 |cRXP_PICK_艾泽里特水晶|r
    .scenario 3839,1,1 --1/3 Mine Azerite Crystals
step
    .isOnQuest 51904
    #title Mine Crystal 2
    .goto 1022,75.62,55.55
    >>挖掘 |cRXP_PICK_艾泽里特水晶|r
    .scenario 3839,1,2 --2/3 Mine Azerite Crystals
step
    .isOnQuest 51904
    #title Mine Crystal 3
    .goto 1022,77.56,50.15
    >>挖掘 |cRXP_PICK_艾泽里特水晶|r
    .scenario 3839,1,3 --3/3 Mine Azerite Crystals
step
    .isOnQuest 51904
    #title Azerite Source 2
    .goto 1022,67.19,33.93
    >>|cRXP_WARN_沿箭头前进|r
    .scenario 3840,1 --1/1 Investigate the second source of Azerite
    .mob Encrusted Kingscuttler
step
    .isOnQuest 51904
    #title Kill |cRXP_ENEMY_Crab|r
    .goto 1022,64.84,28.35
    >>击杀 |cRXP_ENEMY_结壳王蟹|r
    .scenario 3841,1 --1/1 Kil the Encrusted Kingscuttler
    .mob Encrusted Kingscuttler
step
    .isOnQuest 51904
    #title Azerite source 3
    .goto 1022,44.96,46.08
    >>|cRXP_WARN_沿箭头前进|r
    .scenario 3842,1 --1/1 Investigate the third source of Azerite
    .mob Kunzen Leafeater
step
    .isOnQuest 51904
    >>Kill |cRXP_ENEMY_Akakakoo|r and |TInterface/cursor/crosshair/interact.blp:20|tclick |cRXP_PICK_Pouches/Sacks of Azerite|r
    .goto 1022,28.63,60.76,15,0
    .goto 1022,31.75,58.73,15,0
    .goto 1022,28.8,55.96,15,0
    .scenario 3843,1 --500/500 Take the Azerite from the Kunzen hozen tribe.
    .mob Kunzen Leafeater
    .mob Akakaboo
    .mob Kunzen Hozen
step
    .isOnQuest 51904
    .goto 1022,75.74,73.72
    >>跑回 |cFFfa9602船|r
    >>|cRXP_WARN_可按 ESC 跳过接下来的过场动画|r
    .scenario 3844,1 --1/1 Escape from Uncharted Isle before the Horde arrive.
step
    --x(shiek) insert hidden quest here
    .isOnQuest 51904
    #requires AllianceIslandExpedition
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗林|r交谈
    .goto 1161,66.86,33.24
    .turnin 51904 >>交任务: |cRXP_FRIENDLY_海岛探险|r
    .target Flynn Fairwind
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP <争霸艾泽拉斯>战争战役
#name 5) 祖达萨据点
#displayname 第 5 章 - 祖达萨据点
#next 6) 联合库尔提拉斯
<< Alliance
step
    .isQuestAvailable 51308
    .isQuestAvailable 51569
    .goto 1161,69.27,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 51569 >>接任务: |cRXP_WARN_赞达拉战役|r
step
    .isQuestAvailable 51308
    .isQuestTurnedIn 51569
    .goto 1161,69.26,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 51961 >>接任务: |cRXP_WARN_继续作战|r
    .target Halford Wyrmbane
step
    .isQuestAvailable 51308
    .isQuestTurnedIn 51961
    .goto 1161,69.28,27.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 52443 >>接任务: |cRXP_WARN_最后的据点|r
    .target Halford Wyrmbane
step
    .isQuestAvailable 51308
    .isOnQuest 52443
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉战役桌|r 选择 |cRXP_WARN_祖达扎尔|r, 点击小地图下方弹出提示提交任务
    .accept 51570 >>接任务: |cRXP_WARN_据点：祖达萨|r
    .turnin 51570 >>交任务: |cRXP_FRIENDLY_据点：祖达萨|r
    .goto 1161,69.39,26.98
    .turnin 52443 >>交任务: |cRXP_FRIENDLY_最后的据点|r
    .goto 1161,69.27,26.98
    .target Halford Wyrmbane
    .timer 45,Halford Speech RP
step
    .isQuestAvailable 51308
    .isOnQuest 51961
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉战役桌|r 选择 |cRXP_WARN_祖达扎尔|r, 点击小地图下方弹出提示提交任务
    .goto 1161,69.39,26.98
    .turnin 51961 >>交任务: |cRXP_FRIENDLY_继续作战|r
    .goto 1161,69.27,26.98
    .target Halford Wyrmbane
    .timer 45,Halford Speech RP
step
    .isQuestAvailable 51308
    .isOnQuest 51569
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉战役桌|r 选择 |cRXP_WARN_祖达扎尔|r, 点击小地图下方弹出提示提交任务
    .accept 51570 >>接任务: |cRXP_WARN_据点：祖达萨|r
    .turnin 51570 >>交任务: |cRXP_FRIENDLY_据点：祖达萨|r
    .goto 1161,69.39,26.98
    .turnin 51569 >>交任务: |cRXP_FRIENDLY_赞达拉战役|r
    .goto 1161,69.27,26.98
    .target Halford Wyrmbane
    .timer 45,Halford Speech RP
step
    .isOnQuest 51569
    .goto 1161,69.27,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51569 >>交任务: |cRXP_FRIENDLY_赞达拉战役|r
step
    .isOnQuest 51961
    .goto 1161,69.26,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51961 >>交任务: |cRXP_FRIENDLY_继续作战|r
    .target Halford Wyrmbane
step
    .isOnQuest 52443
    .goto 1161,69.28,27.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52443 >>交任务: |cRXP_FRIENDLY_最后的据点|r
    .target Halford Wyrmbane
step
    #completewith Brigadier Thom
    .goto 1161,69.27,26.98
    .gossipoption 49384 >>与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .timer 44, Halford Wyrmbane RP
    .complete 51308,1 --1/1 Listen to Halford Wyrmbane's battle plan
    .target Halford Wyrmbane
step
    #completewith Brigadier Thom
    .goto 1161,67.96,26.66
    .gossipoption 48168 >>对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .target 杰塔瑞斯将军
step
    #label Brigadier Thom
    .goto 862,77.54,54.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_准将汤姆|r交谈
    .turnin 51308 >>交任务: |cRXP_FRIENDLY_祖达萨据点|r
    .accept 51201 >>接任务: |cRXP_WARN_巨魔的故事|r
    .target Brigadier Thom
step
    .goto 862,77.51,54.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_被俘虏的赞达拉巨魔|r交谈
    >>|cRXP_WARN_可按 ESC 跳过接下来的过场动画|r
    .skipgossip 1
    .complete 51201,1 --1/1 Speak with Captured Zandalari Troll
    .target Captured Zandalari Troll
step
    .goto 862,77.54,54.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_准将汤姆|r交谈
    .turnin 51201 >>交任务: |cRXP_FRIENDLY_巨魔的故事|r
    .accept 51190 >>接任务: |cRXP_WARN_暂时得救|r
    .accept 51544 >>接任务: |cRXP_WARN_拆卸火炮|r
    .target Brigadier Thom
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲奥蕾娅医师|r和|cRXP_FRIENDLY_德格多德|r交谈
    .accept 51191 >>接任务: |cRXP_WARN_全部救出|r
    .goto 862,77.13,55.54
    .accept 51192 >>接任务: |cRXP_WARN_配额匮乏|r
    .accept 51193 >>接任务: |cRXP_WARN_那是我的|r
    .goto 862,77.13,55.59
    .target Degdod
    .target Medic Feorea
step
    #completewith ZandalariForsakens
    >>击杀 |cRXP_ENEMY_赞达拉人|r 和 |cRXP_ENEMY_被遗忘者|r
    .complete 51190,2 --8/8 Zandalari slain
    .complete 51190,1 --8/8 Forsaken slain
    .mob Zandalari Quickblade
    .mob Forsaken Deathguard
    .mob Zandalari Axe Thrower
    .mob Bleak Conjurer
step
    .goto 862,78.46,52.01
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_箱子|r
    .complete 51192,1,1 --8/8 Bundle of Supplies
step
    .goto 862,78.51,51.95
    >>与 |cRXP_FRIENDLY_受伤的船员|r 互动
    .complete 51191,1,1 --8/8 Injured Sailor Healed
    .use 160433
    .target Injured Shipwrecked Sailor
step
    .goto 862,78.55,53.05
    >>与 |cRXP_FRIENDLY_受伤的船员|r 互动
    .complete 51191,1,2 --8/8 Injured Sailor Healed
    .use 160433
    .target Injured Shipwrecked Sailor
step
    .goto 862,79.00,53.96
    >>与 |cRXP_FRIENDLY_受伤的船员|r 互动
    .complete 51191,1,3 --8/8 Injured Sailor Healed
    .use 160433
    .target Injured Shipwrecked Sailor
step
    .goto 862,79.71,53.63
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_箱子|r
    .complete 51192,1,2 --8/8 Bundle of Supplies
step
    .goto 862,79.52,55.02
    >>与 |cRXP_FRIENDLY_受伤的船员|r 互动
    .complete 51191,1,4 --8/8 Injured Sailor Healed
    .use 160433
    .target Injured Shipwrecked Sailor
step
    .goto 862,80.14,55.02
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_箱子|r
    .complete 51192,1,3 --8/8 Bundle of Supplies
step
    .goto 862,80.19,55.26
    >>与 |cRXP_FRIENDLY_受伤的船员|r 互动
    .complete 51191,1,5 --8/8 Injured Sailor Healed
    .use 160433
    .target Injured Shipwrecked Sailor
step
    .goto 862,80.96,54.31
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_箱子|r
    .complete 51192,1,4 --8/8 Bundle of Supplies
step
    .goto 862,80.90,53.69
    >>与 |cRXP_FRIENDLY_受伤的船员|r 互动
    .complete 51191,1,5 --8/8 Injured Sailor Healed
    .use 160433
    .target Injured Shipwrecked Sailor
step
    .goto 862,80.90,53.69
    >>与 |cRXP_FRIENDLY_受伤的船员|r 互动
    .complete 51191,1,6 --8/8 Injured Sailor Healed
    .use 160433
    .target Injured Shipwrecked Sailor
step
    .goto 862,80.81,53.27
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_箱子|r
    .complete 51192,1,5 --8/8 Bundle of Supplies
step
    .goto 862,80.93,53.44
    >>与 |cRXP_FRIENDLY_受伤的船员|r 互动
    .complete 51191,1,7 --8/8 Injured Sailor Healed
    .use 160433
    .target Injured Shipwrecked Sailor
step
    .goto 862,80.89,53.39
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_箱子|r
    .complete 51192,1,6 --8/8 Bundle of Supplies
step
    .goto 862,81.09,53.86
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_箱子|r
    .complete 51192,1,7 --8/8 Bundle of Supplies
step
    .goto 862,81.47,53.84
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击地面上的 |cRXP_PICK_箱子|r
    .complete 51192,1,8 --8/8 Bundle of Supplies
step
    .goto 862,81.52,53.78
    >>与 |cRXP_FRIENDLY_受伤的船员|r 互动
    .complete 51191,1,8 --8/8 Injured Sailor Healed
    .use 160433
    .target Injured Shipwrecked Sailor
step
    .goto 862,83.35,54.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火炮|r
    .complete 51544,1,1 --3/3 Cannons destroyed
step
    .goto 862,83.34,54.4
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火炮|r
    .complete 51544,1,2 --3/3 Cannons destroyed
step
    .goto 862,83.34,54.21
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火炮|r
    .complete 51544,1,3 --3/3 Cannons destroyed
step
    #label ZandalariForsakens
    .goto 862,81.94,51.43
    >>击杀 |cRXP_ENEMY_艾伦·霍金斯少校|r 并拾取 |T133041:0|t|cRXP_LOOT_重型钉锤|r
    |cRXP_WARN_Kill the remaining Zandalari and Forsakens|r
    .complete 51193,1 --1/1 Degdod's Hammer
step
#loop
	.line 862,80.71,52.64;79.85,53.56,80.82,55.67,82.23,54.63
	.goto 862,80.71,80.82,15,0
	.goto 862,53.56,82.23,15,0
    >>击杀 |cRXP_ENEMY_赞达拉人|r 和 |cRXP_ENEMY_被遗忘者|r
    .complete 51190,2 --8/8 Zandalari slain
    .complete 51190,1 --8/8 Forsaken slain
    .mob Zandalari Quickblade
    .mob Forsaken Deathguard
    .mob Zandalari Axe Thrower
    .mob Bleak Conjurer
step
    .goto 862,77.54,54.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_准将汤姆|r交谈
    .turnin 51190 >>交任务: |cRXP_FRIENDLY_暂时得救|r
    .turnin 51544 >>交任务: |cRXP_FRIENDLY_拆卸火炮|r
    .target Brigadier Thom
step
    .goto 862,77.12,55.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲奥蕾娅医师|r交谈
    .turnin 51191 >>交任务: |cRXP_FRIENDLY_全部救出|r
    .target Medic Feorea
step
    .goto 862,77.13,55.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_德格多德|r交谈
    .turnin 51192 >>交任务: |cRXP_FRIENDLY_配额匮乏|r
    .turnin 51193 >>交任务: |cRXP_FRIENDLY_那是我的|r
    .target Degdod
step
    .goto 862,77.50,55.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯尔希·钢烁|r
    .accept 51418 >>接任务: |cRXP_WARN_希巴拉|r
    .target 凯尔希·钢烁
step
    .goto 862,80.35,55.41
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_船只|r
    .complete 51418,1 --1/1 Take rowboat to Xibala
    .timer 128,Travel to Xibala RP
step
    .goto 862,40.74,70.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁砧督军图尔加登|r交谈
    .turnin 51418 >>交任务: |cRXP_FRIENDLY_希巴拉|r
    .accept 51331 >>接任务: |cRXP_WARN_内藏玄机|r
    .accept 51309 >>接任务: |cRXP_WARN_拉格纳罗斯之石|r
    .target Anvil-Thane Thurgaden
step
    .goto 862,39.56,72.78
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿渣|r
    .complete 51309,1,1 --9/9 Firelands Slag
step
    .goto 862,39.62,72.86
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿渣|r
    .complete 51309,1,2 --9/9 Firelands Slag
step
    .goto 862,39.57,73.13
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_鼹鼠机|r
    .complete 51331,1,1 --4/4 Dark Iron Mole Machine
step
    .goto 862,39.63,73.45
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿渣|r
    .complete 51309,1,3 --9/9 Firelands Slag
step
    .goto 862,39.63,73.52
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿渣|r
    .complete 51309,1,4 --9/9 Firelands Slag
step
    .goto 862,39.58,73.61
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿渣|r
    .complete 51309,1,5 --9/9 Firelands Slag
step
    .goto 862,39.37,73.7
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_鼹鼠机|r
    .complete 51331,1,2 --4/4 Dark Iron Mole Machine
step
    .goto 862,39.15,73.86
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿渣|r
    .complete 51309,1,6 --9/9 Firelands Slag
step
    .goto 862,39.11,73.82
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿渣|r
    .complete 51309,1,7 --9/9 Firelands Slag
step
    .goto 862,39.05,73.79
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿渣|r
    .complete 51309,1,8 --9/9 Firelands Slag
step
    .goto 862,39.12,73.67
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿渣|r
    .complete 51309,1,9 --9/9 Firelands Slag
step
    .goto 862,39.1,72.98
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_鼹鼠机|r
    .complete 51331,1,3 --4/4 Dark Iron Mole Machine
step
    .goto 862,39.03,72.35
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_鼹鼠机|r
    .complete 51331,1,4 --4/4 Dark Iron Mole Machine
step
    .goto 862,40.74,70.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁砧督军图尔加登|r交谈
    .turnin 51331 >>交任务: |cRXP_FRIENDLY_内藏玄机|r
    .turnin 51309 >>交任务: |cRXP_FRIENDLY_拉格纳罗斯之石|r
    .accept 51359 >>接任务: |cRXP_WARN_火焰之地碎片|r
    .target Anvil-Thane Thurgaden
step
    .goto 862,40.65,70.88
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_不稳定的熔岩|r
    .complete 51359,1 --Magma Elemental stabilized
    .use 160058
    .target 不稳定的熔岩
step
    .goto 862,32.92,69.69
    >>有效击杀地精: |T135808:0|t(2) 可用时优先使用, 冷却时切换为 |T525023:0|t(1)
    .complete 51359,2 --200/200 Bilgewater Goblin slain
step
    #completewith next
    +按下技能 |T236372:0|t[驱散熔岩元素]
step
    .goto 862,40.74,70.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁砧督军图尔加登|r交谈
    .turnin 51359 >>交任务: |cRXP_FRIENDLY_火焰之地碎片|r
    .target Anvil-Thane Thurgaden
step
    .goto 862,40.77,70.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯尔希·钢烁|r
    .turnin 52003 >>交任务: |cRXP_FRIENDLY_勇士：凯尔希·钢烁|r
    .accept 51968 >>接任务: |cRXP_WARN_返回伯拉勒斯|r
    .target 凯尔希·钢烁
step
    .goto 862,40.46,71.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达莉亚|r交谈
    .complete 51968,1 --Speak to Daria Smithson
    .skipgossip 1
    .target 达尔ia Smithson
step
    .goto 1161,69.29,26.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 51968 >>交任务: |cRXP_FRIENDLY_返回伯拉勒斯|r
    .target Halford Wyrmbane
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP <争霸艾泽拉斯>战争战役
#name 6) 联合库尔提拉斯
#displayname 第 6 章 - 统一库尔提拉斯
#next 7) 准备开战
<< Alliance
step
    .isOnQuest 51918
    >>完成 |cRXP_WARN_提拉加德海湾的普罗德莫尔海军总部|r\|cRXP_WARN_风暴之歌谷的风暴之醒|r 和 |cRXP_WARN_德鲁斯特瓦尔的炽焰议会|r 任务
    .complete 51918,1 -- Proudmoore Admiralty (Friendly)
    .complete 51918,2 -- Storm's Wake (Friendly)
    .complete 51918,3 -- Order of Embers (Friendly)
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP <争霸艾泽拉斯>战争战役
#name 7) 准备开战
#displayname 第 7 章 - 战鼓震天
#next 8) 复仇之潮
<< Alliance
step
    .goto 1161,69.28,26.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 52026 >>接任务: |cRXP_WARN_海外暗杀|r
    .target Halford Wyrmbane
step
    .isOnQuest 52026
    .goto 1161,67.95,26.71
    .gossipoption 48163 >>对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .target 杰塔瑞斯将军
step
    .goto 864,37.71,35.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52026 >>交任务: |cRXP_FRIENDLY_海外暗杀|r
    .accept 52027 >>接任务: |cRXP_WARN_沃顿计划|r
    .target Halford Wyrmbane
step
    .isOnQuest 52027
    .goto 864,37.71,35.95
    .gossipoption 48912 >>与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .timer 34, Halford Wyrmbane RP
    .target Halford Wyrmbane
step
    .goto 864,37.71,35.95
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52027,1 --1/1 Discuss Halford's strategy
step
    .isOnQuest 52027
    .goto 864,37.76,35.92
    .gossipoption 48913 >>对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .timer 6,Shandris RP
    .target 珊蒂斯·羽月
step
    .goto 864,37.76,35.92
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52027,2 --1/1 Discuss Shandris's strategy
step
    .goto 864,37.70,35.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52027 >>交任务: |cRXP_FRIENDLY_沃顿计划|r
    .accept 52028 >>接任务: |cRXP_WARN_搜查沙漠|r
    .target Halford Wyrmbane
step
    .goto 864,41.06,47.64
    >>|cRXP_WARN_沿箭头前进|r
    .complete 52028,1 --1/1 Search for Horde activity
    .timer 5, Shandris RP
step
    .goto 864,41.06,47.64,5,0
    .goto 864,40.75,47.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52028 >>交任务: |cRXP_FRIENDLY_搜查沙漠|r
    .accept 52029 >>接任务: |cRXP_WARN_脏活累活|r
    .target 珊蒂斯·羽月
step
    .goto 864,41.09,48.75
    >>击杀 |cRXP_ENEMY_纳兹拉拉|r, 拾取 |T1505954:0|t|cRXP_LOOT_圣物令|r
    .complete 52029,1 --1/1 Reliquary Orders
    .mob Nazlara
step
    .goto 864,40.70,47.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52029 >>交任务: |cRXP_FRIENDLY_脏活累活|r
    .accept 52030 >>接任务: |cRXP_WARN_继续搜查|r
    .target Halford Wyrmbane
step
    .goto 864,45.11,58.91
    >>|cRXP_WARN_沿箭头前进|r
    .complete 52030,1 --1/1 Search for more Reliquary operatives
step
    .goto 864,44.99,58.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52030 >>交任务: |cRXP_FRIENDLY_继续搜查|r
    .accept 52031 >>接任务: |cRXP_WARN_遗物学会典范|r
    .target 珊蒂斯·羽月
step
    .goto 864,45.25,60.61
    >>击杀 |cRXP_ENEMY_伊莉萨·面纱之歌|r 并拾取 |T237388:0|t|cRXP_LOOT_[遗物地图: 沃丹]|r
    .complete 52031,1 --1/1 Reliquary Map: Vol'dun
    .mob 伊莱sa Veilsong
step
    .goto 864,44.96,58.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52031 >>交任务: |cRXP_FRIENDLY_遗物学会典范|r
    .accept 52032 >>接任务: |cRXP_WARN_搜查不止|r
    .target Halford Wyrmbane
step
    .goto 864,41.08,72.38
    >>|cRXP_WARN_沿箭头前进|r
    .complete 52032,1 --1/1 Find the Exiles' Enclave
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_哈尔福德·维尔班|r\|cRXP_FRIENDLY_珊蒂斯·羽月|r 和 |cRXP_FRIENDLY_爆破专家佐伊德弗斯|r 交谈
    .turnin 52032 >>交任务: |cRXP_FRIENDLY_搜查不止|r
    .accept 52035 >>接任务: |cRXP_WARN_即兴求生|r
    .goto 864,41.08,72.62
    .accept 52034 >>接任务: |cRXP_WARN_给赞达拉的讯息|r
    .goto 864,41.12,72.57
    .accept 52036 >>接任务: |cRXP_WARN_这儿有羊驼|r
    .goto 864,41.14,72.41
    .target Halford Wyrmbane
    .target 珊蒂斯·羽月
    .target Explosioneer Zoidfuse
step
    .goto 864,40.65,72.51,5,0
    .goto 864,41.08,72.62
    >>与 |cRXP_ENEMY_走失的羊驼|r 互动, 将其带回 |cRXP_FRIENDLY_爆破专家佐伊德弗斯|r 处
    .complete 52036,1 --1/1 Bring a Lost Alpaca back to Explosioneer Zoidfuse
    .use 161633
    .mob Lost Alpaca
    .target Explosioneer Zoidfuse
step
    .goto 864,41.08,72.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52036 >>交任务: |cRXP_FRIENDLY_这儿有羊驼|r
    .target Halford Wyrmbane
step
    #completewith jug
    >>击杀 |cRXP_ENEMY_赞达拉流亡者|r
    .complete 52034,1 --12/12 Zandalari Exile slain
    --x shiek review: better logic here
    .mob Zandalari Exile
step
    .isOnQuest 52035
    .goto 864,40.9,74.26
    .cast 6478 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉水壶|r
step
    .isOnQuest 52035
    .goto 864,40.86,74.19
    .cast 6478 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉沙瓜|r
step
    .isOnQuest 52035
    .goto 864,40.58,74.27
    .cast 6478 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉水壶|r
step
    .isOnQuest 52035
    .goto 864,40.74,74.75,5,0
    .goto 864,40.55,74.73
    .cast 6478 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉沙瓜|r
step
    .isOnQuest 52035
    .goto 864,40.3,75.17
    .cast 6478 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉沙瓜|r
step
    .isOnQuest 52035
    .goto 864,40.23,75.46
    .cast 6478 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉水壶|r
step
    .isOnQuest 52035
    .goto 864,40.04,75.57,5,0
    .goto 864,40.4,75.51,5,0
    .goto 864,40.66,75.53,5,0
    .goto 864,40.43,75.27,5,0
    .goto 864,40.23,75.36,5,0
    .cast 6478 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉沙瓜|r 或 |cRXP_PICK_赞达拉水壶|r
step
    .isOnQuest 52035
    .goto 864,40.04,75.57,5,0
    .goto 864,40.4,75.51,5,0
    .goto 864,40.66,75.53,5,0
    .goto 864,40.43,75.27,5,0
    .goto 864,40.23,75.36,5,0
    .cast 6478 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉沙瓜|r 或 |cRXP_PICK_赞达拉水壶|r
step
    .isOnQuest 52035
    .goto 864,40.66,75.53,5,0
    .goto 864,40.42,75.28,5,0
    .goto 864,40.25,75.35,5,0
    .cast 6478 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉水壶|r
step
    #label jug
    .isOnQuest 52035
    .goto 864,40.42,75.28,5,0
    .goto 864,40.25,75.35,5,0
    .cast 6478 >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_赞达拉水壶|r
    >>|cRXP_WARN_任务已完成则手动跳过此步骤|r
step
#loop
	.line 864,40.02,76.13,40.73,76.73,41.12,76.11,41.12,73.76
	.goto 864,40.02,76.13,15,0
	.goto 864,40.73,76.73,15,0
	.goto 864,41.12,76.11,15,0
	.goto 864,41.12,73.76,15,0
    >>击杀 |cRXP_ENEMY_赞达拉流亡者|r
    .complete 52034,1 --12/12 Zandalari Exile slain
    .mob Zandalari Exile
step
    .goto 864,41.1,72.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52034 >>交任务: |cRXP_FRIENDLY_给赞达拉的讯息|r
    .target 珊蒂斯·羽月
step
    .goto 864,41.08,72.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52035 >>交任务: |cRXP_FRIENDLY_即兴求生|r
    .target Halford Wyrmbane
step
    .goto 864,41.08,72.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 52038 >>接任务: |cRXP_WARN_兵分两路|r
    .target Halford Wyrmbane
step
    .goto 864,29.93,78.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52038 >>交任务: |cRXP_FRIENDLY_兵分两路|r
    .accept 52039 >>接任务: |cRXP_WARN_延期死亡|r
    .accept 52040 >>接任务: |cRXP_WARN_万箭齐发|r
    .target 珊蒂斯·羽月
step
    .goto 864,29.56,77.1
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_遥控死亡炸弹|r
    .complete 52039,1,1 --8/8 Remote-Detonation Deathbomb buried
step
    .goto 864,29.01,76.43
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_遥控死亡炸弹|r
    .complete 52039,1,2 --8/8 Remote-Detonation Deathbomb buried
step
    .goto 864,28.84,75.79
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_遥控死亡炸弹|r
    .complete 52039,1,3 --8/8 Remote-Detonation Deathbomb buried
step
    .goto 864,28.7,75.62
    >>击杀 |cRXP_ENEMY_阿尔莱瑟尔·日观者|r
    .complete 52040,1 --1/1 Arlethal Sunwatcher slain
    .mob Arlethal Sunwatcher
step
    .goto 864,28.69,75.53
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_遥控死亡炸弹|r
    .complete 52039,1,4 --8/8 Remote-Detonation Deathbomb buried
step
    .goto 864,28.56,75.8
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_遥控死亡炸弹|r
    .complete 52039,1,5 --8/8 Remote-Detonation Deathbomb buried
step
    .goto 864,28.19,76.13
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_遥控死亡炸弹|r
    .complete 52039,1,6 --8/8 Remote-Detonation Deathbomb buried
step
    .goto 864,28.68,76.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_遥控死亡炸弹|r
    .complete 52039,1,7 --8/8 Remote-Detonation Deathbomb buried
step
    .goto 864,28.91,77.28
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_遥控死亡炸弹|r
    .complete 52039,1,8 --8/8 Remote-Detonation Deathbomb buried
step
    .goto 864,29.93,78.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52039 >>交任务: |cRXP_FRIENDLY_延期死亡|r
    .turnin 52040 >>交任务: |cRXP_FRIENDLY_万箭齐发|r
    .accept 52041 >>接任务: |cRXP_WARN_向维姆班恩汇报|r
    .target 珊蒂斯·羽月
step
    .goto 864,39.65,83.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52041 >>交任务: |cRXP_FRIENDLY_向维姆班恩汇报|r
    .accept 52042 >>接任务: |cRXP_WARN_大爆炸|r
    .target Halford Wyrmbane
step
    .isOnQuest 52042
    .goto 864,39.79,83.82
    .gossipoption 48925 >>与|cRXP_FRIENDLY_爆破专家泽德弗斯|r交谈
    .timer 96, Vol'dun Explosion Protocol
    .target Explosioneer Zoidfuse
step
    >>|cRXP_WARN_连续使用 |T133015:0|t(1)\|T132995:0|t(2) 和 |T237290:0|t(3)|r
    >>|cFFEB144C完成任务后将播放一段无法跳过的过场动画|r
    .complete 52042,1 --1/1 Initiate the Vol'dun Explosion Protocol
step
    .goto 864,39.64,83.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52042 >>交任务: |cRXP_FRIENDLY_大爆炸|r
    .accept 52146 >>接任务: |cRXP_WARN_血之沙|r
    .target Halford Wyrmbane
step
    .goto 864,38.69,83.01
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_第七军团望远镜|r
    >>|cRXP_WARN_按 Esc 键跳过过场动画|r
    .complete 52146,2 --1/1 Wait for Kelsey Steelspark to Talk
    .complete 52146,1 --1/1 Wait for Guzbert Gizmoflank to Talk
step
    .goto 864,39.65,83.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52146 >>交任务: |cRXP_FRIENDLY_血之沙|r
    .accept 53069 >>接任务: |cRXP_WARN_行动代号：血箭|r
    .target Halford Wyrmbane
step
    #completewith next
    .cooldown item,6948,>0,1
    .hs >>将炉石设为博拉勒斯
step
    .goto 864,39.65,83.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52146 >>交任务: |cRXP_FRIENDLY_血之沙|r
    .accept 53069 >>接任务: |cRXP_WARN_行动代号：血箭|r
    .target Halford Wyrmbane
step
    .goto 1161,69.28,26.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 53069 >>交任务: |cRXP_FRIENDLY_行动代号：血箭|r
    .accept 52147 >>接任务: |cRXP_WARN_削弱部落|r
    .target Halford Wyrmbane
step
    .isOnQuest 52147
    .goto 1161,67.95,26.71
    .gossipoption 48165 >>对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .target 杰塔瑞斯将军
step
    .goto 863,61.98,41.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52147 >>交任务: |cRXP_FRIENDLY_削弱部落|r
    .accept 52150 >>接任务: |cRXP_WARN_杀死一名黑暗游侠|r
    .target 珊蒂斯·羽月
step
    .isOnQuest 52150
    .goto 863,61.98,41.25
    .gossipoption 48904 >>对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .timer 32, Shandris RP
    .target 珊蒂斯·羽月
step
    #completewith next
    .goto 863,62.34,41.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塞莉娜·暮鸦|r交谈
    .fp >>获取 [胜利堡] 飞行点
    .target Selina Duskraven
step
    .goto 863,61.98,41.25
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52150,1 --1/1 Shandris's plan explained
step
    .goto 863,61.97,41.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52150 >>交任务: |cRXP_FRIENDLY_杀死一名黑暗游侠|r
    .accept 52156 >>接任务: |cRXP_WARN_受难的始祖龟|r
    .target 珊蒂斯·羽月
step
    .goto 863,61.78,41.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_布莱恩·铜须|r
    .accept 52158 >>接任务: |cRXP_WARN_野蛮狩猎|r
    .target 布莱恩·铜须
step
    #completewith Tortollan
    >>击杀 |cRXP_ENEMY_血爬虫|r\|cRXP_ENEMY_洛阿沟拾荒者|r 和 |cRXP_ENEMY_爬虫骑士|r
    .complete 52158,1 --15/15 Blood trolls and allies slain
    .mob 鲜血 Crawgs
    .mob Loa-Gutter Scavengers
    .mob Crawg Riders
step
    .goto 863,58.91,28.52
    >>与 |cRXP_FRIENDLY_被囚的托尔托尔人|r 互动
    .complete 52156,1,1 --6/6 Tortollan captive rescued
    .target 托尔托拉n Captive
step
    .goto 863,59.58,27.77
    >>与 |cRXP_FRIENDLY_被囚的托尔托尔人|r 互动
    .complete 52156,1,2 --6/6 Tortollan captive rescued
    .target 托尔托拉n Captive
step
    .goto 863,60.87,27.47
    >>与 |cRXP_FRIENDLY_被囚的托尔托尔人|r 互动
    .complete 52156,1,3 --6/6 Tortollan captive rescued
    .target 托尔托拉n Captive
step
    .goto 863,61.73,26.24
    >>与 |cRXP_FRIENDLY_被囚的托尔托尔人|r 互动
    .complete 52156,1,4 --6/6 Tortollan captive rescued
    .target 托尔托拉n Captive
step
    .goto 863,61.62,25.06
    >>与 |cRXP_FRIENDLY_被囚的托尔托尔人|r 互动
    .complete 52156,1,5 --6/6 Tortollan captive rescued
    .target 托尔托拉n Captive
step
    #label Tortollan
    .goto 863,59.76,25.16
    >>与 |cRXP_FRIENDLY_被囚的托尔托尔人|r 互动
    .complete 52156,1,6 --6/6 Tortollan captive rescued
    .target 托尔托拉n Captive
step
#loop
	.line 863,60.76,26.64,61.98,27.78,63.06,26.52,62.95,24.34
	.goto 863,60.76,26.64,15,0
	.goto 863,61.98,27.78,15,0
	.goto 863,63.06,26.52,15,0
	.goto 863,62.95,24.34,15,0
    >>击杀 |cRXP_ENEMY_鲜血克劳格|r\|cRXP_ENEMY_洛阿食腐者|r 和 |cRXP_ENEMY_克劳格骑手|r
    .complete 52158,1 --15/15 Blood trolls and allies slain
    .mob 鲜血 Crawgs
    .mob Loa-Gutter Scavengers
    .mob Crawg Riders
step
    .isOnQuest 52156
    .goto 863,51.27,21.8
    .gossipoption 49091 >>与|cRXP_FRIENDLY_获救的陆行龟人|r交谈
    .timer 43, Tortollan
    .target Rescued Tortollan
step
    .goto 863,51.27,21.89
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_约翰·J·基沙恩|r
    .turnin 52158 >>交任务: |cRXP_FRIENDLY_野蛮狩猎|r
    .target 约翰·J·基沙恩
step
    #completewith next
    .goto 863,50.81,20.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_约瑟夫·雷德菲尔德|r交谈
    .fp >>获取 [雷德菲尔德的观星台] 飞行点
    .target 乔斯ph Redfield
step
    .goto 863,51.27,21.8
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52156,2 --1/1 Speak to the rescued tortollan in Redfield's Watch
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊蒂斯·羽月|r 和 |cRXP_FRIENDLY_约翰·J·基沙恩|r 交谈
    .turnin 52156 >>交任务: |cRXP_FRIENDLY_受难的始祖龟|r
    .accept 52170 >>接任务: |cRXP_WARN_终结艾蕾尔|r
    .goto 863,51.34,21.86
    .accept 52171 >>接任务: |cRXP_WARN_唯一选项：火|r
    .accept 52172 >>接任务: |cRXP_WARN_就不该来这儿|r
    .goto 863,51.27,21.89
    .target 珊蒂斯·羽月
    .target 约翰·J·基沙恩
step
    #completewith Armory supplies
    >>击杀 |cRXP_ENEMY_部落士兵|r
    .complete 52172,1 --12/12 Horde soldiers slain
    .mob 达尔kspear Hunter
    .mob 部落战争使者
    .mob 部落萨满祭司
step
    .goto 863,41.26,27.56
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_食物储备|r
    .complete 52171,3 --1/1 Food cache destroyed
step
    .goto 863,39.93,28.52
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_邦萨姆迪供品|r
    .complete 52171,1 --1/1 Bwonsamdi offerings destroyed
step
    .goto 863,37.67,28.86
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_医药用品|r
    .complete 52171,2 --1/1 Medicinal supplies destroyed
step
    .goto 863,35.90,29.28
    >>击杀 |cRXP_ENEMY_游侠队长艾蕾尔|r 并拾取 |T237446:0|t|cRXP_LOOT_[部落信函]|r
    .complete 52170,1 --1/1 Horde Missive
    .mob 游侠 Captain Areie
step
    #label Armory supplies
    .goto 863,37.87,32.31
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_军械库物资|r
    .complete 52171,4 --1/1 Armory supplies destroyed
step
    #completewith
    >>击杀 |cRXP_ENEMY_部落士兵|r
    .complete 52172,1 --12/12 Horde soldiers slain
    .mob 达尔kspear Hunter
    .mob 部落战争使者
    .mob 部落萨满祭司
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_约翰·J·基沙恩|r 和 |cRXP_FRIENDLY_珊蒂斯·羽月|r 交谈
    .turnin 52171 >>交任务: |cRXP_FRIENDLY_唯一选项：火|r
    .turnin 52172 >>交任务: |cRXP_FRIENDLY_就不该来这儿|r
    .goto 863,51.28,21.90
    .turnin 52170 >>交任务: |cRXP_FRIENDLY_终结艾蕾尔|r
    .accept 52208 >>接任务: |cRXP_WARN_首脑会晤|r
    .goto 863,51.34,21.87
    .target 约翰·J·基沙恩
    .target 珊蒂斯·羽月
step
    .goto 863,42.13,39.73
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .skipgossip 140519,1
    .complete 52208,1 --1/1 Speak with Shandris Feathermoon
    .target 珊蒂斯·羽月
step
    .isOnQuest 52208
    .goto 863,40.56,43.76,10 >>在 |cFFfa9602部落营地|r 附近使用 |T236875:0|t[隐形药水]
    .use 163196
step
    .isOnQuest 52208
    .goto 863,40.02,43.77,10 >>靠近 |cRXP_ENEMY_塔兰吉公主|r 和 |cRXP_ENEMY_罗坎|r
    >>|cRXP_WARN_若尚未使用, 在 |cFFfa9602部落营地|r 附近使用 |T236875:0|t[隐形药水]|r
    .timer 66, Horde Meeting RP
step
    .isOnQuest 52208
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52208,2 --1/1 Listen on Horde Meeting
step
    .goto 863,42.14,39.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52208 >>交任务: |cRXP_FRIENDLY_首脑会晤|r
    .accept 52219 >>接任务: |cRXP_WARN_任务目标：鲜血王子德利文|r
    .target 珊蒂斯·羽月
step
    .isOnQuest 52219
    .goto 863,20.14,60.75
    .gossipoption 48851 >>对话 |cRXP_FRIENDLY_约翰·J·基沙恩|r
    .timer 20, Blood Prince RP
    .target 约翰·J·基沙恩
step
    .goto 863,20.34,60.80,10,0
    .goto 863,20.62,60.74
    >>将 |cRXP_ENEMY_鲜血王子德雷文|r 血量降至 60% 以下
    .complete 52219,2 --1/1 Kill Blood Prince Dreven and cohorts
    .mob 鲜血 Prince Dreven
    .mob 鲜血 Marquis
    .mob 鲜血 Marquess
step
    .goto 863,61.97,41.24
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52219 >>交任务: |cRXP_FRIENDLY_任务目标：鲜血王子德利文|r
    .target 珊蒂斯·羽月
step
    #completewith next
    .goto 863,62.06,40.08
    .gossipoption 48827 >>与|cRXP_FRIENDLY_德莎·风淹|r交谈
    .target Desha Stormwallow
step
    .goto 1161,69.29,26.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .accept 52154 >>接任务: |cRXP_WARN_下一个目标|r
    .timer 50, Debate RP
step
    .goto 1161,69.29,26.98
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52154,1 --1/1 Debate resolved
step
    .goto 1161,69.29,26.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52154 >>交任务: |cRXP_FRIENDLY_下一个目标|r
    .target Halford Wyrmbane
step
    .goto 1161,69.32,26.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .accept 52173 >>接任务: |cRXP_WARN_虚空精灵准备就绪|r
    .target Magister Umbric
step
    .isOnQuest 52173
    .goto 1161,67.93,26.69
    .gossipoption 48167 >>对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .complete 52173,1 --1/1 Speak with Jes-Tereth to sail to Zuldazar (Optional)
    .target 杰塔瑞斯将军
step
    .goto 862,40.69,70.82
    >>|cRXP_WARN_沿箭头前进|r
    .complete 52173,2 --1/1 Meet Magister Umbric in Xibala
step
    .goto 862,40.59,70.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .turnin 52173 >>交任务: |cRXP_FRIENDLY_虚空精灵准备就绪|r
    .accept 52205 >>接任务: |cRXP_WARN_锈水矿脉的末日|r
    .accept 52204 >>接任务: |cRXP_WARN_虚空对策|r
    .accept 52203 >>接任务: |cRXP_WARN_搜寻踪迹|r
    .target Magister Umbric
step
    #completewith gryphon
    .isWorldQuestAvailable 862,52250
    +|cFFEB144C忽略世界任务, 它不影响解锁同盟种族的进度|r
step
    #completewith Orders
    >>击杀 |cRXP_ENEMY_地精|r
    .complete 52205,1 --12/12 Bilgewater goblin slain
    .mob Bilgewater Hauler
    .mob Bilgewater Boomer
    .mob Bilgewater Driller
step
    #completewith Orders
    >>Kill |cRXP_ENEMY_Bilgewater Fracker|r or |TInterface/cursor/crosshair/interact.blp:20|tClick them.
    .complete 52204,1 --4/4 Bilgewater Fracker destroyed
    .use 161422
    .mob Bilgewater Fracker
step
    #label Orders
    .goto 862,38.69,72.21,25,0
    .goto 862,36.74,71.47,25,0
    .goto 862,35.29,66.65
    >>击杀 |cRXP_ENEMY_老大爆嘴|r, 拾取 |T134328:0|t|cRXP_LOOT_加里维克斯的命令|r
    .complete 52203,1 --1/1 Orders from Gallywix
    .mob Boss Blastmouth
step
    #completewith next
    >>击杀 |cRXP_ENEMY_地精|r
    .complete 52205,1 --12/12 Bilgewater goblin slain
    .mob Bilgewater Hauler
    .mob Bilgewater Boomer
    .mob Bilgewater Driller
step
#loop
	.line 862,34.9,69.06,34.52,70.6,33.88,71.61,36.89,71.35,35.8,72.14
	.goto 862,34.90,69.06,25,0
	.goto 862,34.52,70.60,25,0
	.goto 862,33.88,71.61,25,0
	.goto 862,36.89,71.35,25,0
	.goto 862,35.80,72.14,25,0
    >>Kill |cRXP_ENEMY_Bilgewater Fracker|r or |TInterface/cursor/crosshair/interact.blp:20|tClick them.
    .complete 52204,1 --4/4 Bilgewater Fracker destroyed
    .use 161422
    .mob Bilgewater Fracker
step
#loop
	.line 862,34.9,69.06,34.52,70.6,33.88,71.61,36.89,71.35,35.8,72.14
	.goto 862,34.90,69.06,25,0
	.goto 862,34.52,70.60,25,0
	.goto 862,33.88,71.61,25,0
	.goto 862,36.89,71.35,25,0
	.goto 862,35.80,72.14,25,0
    >>击杀 |cRXP_ENEMY_地精|r
    .complete 52205,1 --12/12 Bilgewater goblin slain
    .mob Bilgewater Hauler
    .mob Bilgewater Boomer
    .mob Bilgewater Driller
step
    #label gryphon
    .goto 862,40.59,70.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .turnin 52205 >>交任务: |cRXP_FRIENDLY_锈水矿脉的末日|r
    .turnin 52204 >>交任务: |cRXP_FRIENDLY_虚空对策|r
    .turnin 52203 >>交任务: |cRXP_FRIENDLY_搜寻踪迹|r
    .accept 52241 >>接任务: |cRXP_WARN_贪婪地精的天堂|r
    .timer 8, Void Portal RP
    .target Magister Umbric
step
    .goto 862,40.55,70.64
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_虚空传送门|r
    .complete 52241,1 --1/1 Use Void Portal in Xibala (Optional)
    .complete 52241,2 --1/1 Meet Umbric in Atal'Dazar
step
    .goto 862,40.33,39.72
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .turnin 52241 >>交任务: |cRXP_FRIENDLY_贪婪地精的天堂|r
    .accept 52247 >>接任务: |cRXP_WARN_追踪加里维克斯|r
    .target Magister Umbric
step
    .goto 862,40.38,43.28
    >>|cRXP_WARN_沿箭头前进|r
    >>|cRXP_WARN_不要走隧道|r
    .complete 52247,1 --1/1 Gallywix found
step
    .goto 862,40.41,44.31
    >>|cRXP_WARN_沿箭头前进|r
    .complete 52247,2 --1/1 Gallywix's Personal Teleporter used
step
    .goto 76,21.63,52.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与附近的|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .turnin 52247 >>交任务: |cRXP_FRIENDLY_追踪加里维克斯|r
    .accept 52259 >>接任务: |cRXP_WARN_此愁难消|r
    .target Magister Umbric
step
    .goto 76,21,60.14
    >>击杀 |cRXP_ENEMY_欢愉宫殿访客|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_派对道具|r
    .complete 52259,1 --Crash Gallywix's Party (100%)
    .mob Pleasure Palace Golfer
    .mob Pleasure Palace Caddie
    .mob Pleasure Palace VIP
step
    .goto 76,21.39,58.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与附近的|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .turnin 52259 >>交任务: |cRXP_FRIENDLY_此愁难消|r
    .accept 52260 >>接任务: |cRXP_WARN_道尽途穷|r
    .target Magister Umbric
step
    .goto 76,21.07,60.56
    >>击杀 |cRXP_ENEMY_贸易大王加里维克斯|r
    .complete 52260,1 --1/1 Trade Prince Gallywix slain
    .mob 贸易大王加里维克斯
step
    .goto 76,21.07,60.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与附近的|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .turnin 52260 >>交任务: |cRXP_FRIENDLY_道尽途穷|r
    .accept 52261 >>接任务: |cRXP_WARN_加里维克斯跑了|r
    .timer 8, Void Portal RP
    .target Magister Umbric
step
    .isOnQuest 52261
    .goto 76,21.07,60.69
    .zone Boralus >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_虚空传送门|r
step
    .goto 1161,69.28,27.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52261 >>交任务: |cRXP_FRIENDLY_加里维克斯跑了|r
    .target Halford Wyrmbane
step
    .goto 1161,69.28,27.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52261 >>交任务: |cRXP_FRIENDLY_加里维克斯跑了|r
    .accept 52308 >>接任务: |cRXP_WARN_被拦截的命令|r
    .target Halford Wyrmbane
    .timer 37, Halford RP
step
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52308,1 --1/1 Listen to Halford's report
step
    .goto 1161,69.28,27.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52308 >>交任务: |cRXP_FRIENDLY_被拦截的命令|r
    .target Halford Wyrmbane
step
    .goto 1161,69.29,27.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .accept 52489 >>接任务: |cRXP_WARN_猎杀鲜血王子德利文|r
    .target 珊蒂斯·羽月
step
    .goto 1161,69.76,27.58
    >>与 |cRXP_FRIENDLY_疾翼|r 互动
    .complete 52489,1 --1/1 Mount Swiftwing
    .timer 57.5, Swiftwing RP
    .target Swiftwing
step
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52489,2 --1/1 Locate Horde ships
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与附近的 |cRXP_FRIENDLY_珊蒂斯·羽月|r 交谈
    .turnin 52489 >>交任务: |cRXP_FRIENDLY_猎杀鲜血王子德利文|r
    .target 珊蒂斯·羽月
step
    #completewith warning
    |cFFd0342cIf you fall off the boat at any time and can't get back up, it's recommended to swim between the two boats. Your |cRXP_WARN_[Extra Action Button]|r will be available, allowing |cRXP_FRIENDLY_Falstad Wildhammer|r to pick you up.|r
step
    .goto 1156,38.42,45.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旁边的 |cRXP_FRIENDLY_珊蒂斯·羽月|r 交谈
    .accept 52490 >>接任务: |cRXP_WARN_深入敌船|r
    .timer 13, Falstad RP
    .target 珊蒂斯·羽月
step
    .goto 1156,36.65,52.24
    >>使用 (1) |T1126431:0|t 命令 |cRXP_FRIENDLY_弗斯塔德·蛮锤|r 将你送到 |cFFfa9602亡魂之嚎|r 附近
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_梯子|r
    .complete 52490,1 --1/1 Climb in the Banshee's Wail gunport
step
    #completewith next
    >>击杀 |cRXP_ENEMY_水手|r
    .complete 52490,2 --10/10 Sailors on the Banshee's Wail slain
    .mob 女妖's Wail Deckhand
step
    .goto 1156,36.92,52.45
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_女妖的哀号炮|r
    .accept 52491 >>接任务: |cRXP_WARN_舷侧乱象|r
step
    #completewith Fired
    >>击杀 |cRXP_ENEMY_水手|r
    .complete 52490,2 --10/10 Sailors on the Banshee's Wail slain
    .mob 女妖's Wail Deckhand
step
    .goto 1156,36.97,52.01
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_充能的阿兹尔石炮弹|r
    .complete 52491,1 --1/1 Azerite-Infused Cannonballs
    .mob 女妖's Wail Swabby
step
    .goto 1156,36.82,52.85
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_阿兹尔石强化火药|r
    .complete 52491,2 --1/1 Azerite-Infused Gunpowder
    .mob 女妖's Wail Swabby
step
    .goto 1156,36.62,53.32
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_女妖的哀号火炬|r
    .complete 52491,3 --1/1 Banshee's Wail Torch
    .mob 女妖's Wail Swabby
step
    .goto 1156,36.76,52.95
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_女妖的哀嚎炮|r
    .complete 52491,4,1 --3/3 Cannons fired
    .mob 女妖's Wail Swabby
step
    .goto 1156,36.83,52.7
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_女妖的哀嚎炮|r
    .complete 52491,4,2 --3/3 Cannons fired
    .mob 女妖's Wail Swabby
step
    .goto 1156,36.92,52.47
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_女妖的哀嚎炮|r
    .complete 52491,4,3 --3/3 Cannons fired
    .mob 女妖's Wail Swabby
step
    #label Fired
    .goto 1156,36.46,53.57,5,0
    .goto 1156,36.62,53
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_部落的战利箱|r
    .complete 52490,3 --1/1 Battlechest of the Horde opened
    .timer 34, Nathanos RP
step
    .goto 1156,42.26,47.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旁边的 |cRXP_FRIENDLY_弗斯塔德·蛮锤|r 交谈
    .turnin 52490 >>交任务: |cRXP_FRIENDLY_深入敌船|r
    .target 弗斯塔德·蛮锤
step
    .goto 1156,42.32,47.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与旁边的 |cRXP_FRIENDLY_弗斯塔德·蛮锤|r 交谈
    .turnin 52491 >>交任务: |cRXP_FRIENDLY_舷侧乱象|r
    .accept 52492 >>接任务: |cRXP_WARN_蛮锤的专长|r
    .target 弗斯塔德·蛮锤
step
    .goto 1156,43.10,49.53
    >>使用 |T132222:0|t(1) 开始进攻!
    .complete 52492,1 --1/1 Order Falstad to start the attack
step
    #completewith Deck
    >>用 (1) |T132314:0|t 造成伤害, 用 (2) |T136051:0|t 治疗自己. |cRXP_WARN_治疗期间无法使用 (1)|r
    .complete 52492,3 --15/15 Horde rowboats destroyed
    .complete 52492,2 --60/60 Horde sailors slain
step
    .goto 1156,41.62,56.18
    >>使用 |T132314:0|t(1)点燃船帆
    .complete 52492,5 --1/1 The Crimson Squall sails burned
step
    #label Deck
    .goto 1156,36.71,52.8
    >>使用 |T132314:0|t(1)烧毁甲板
    .complete 52492,4 --1/1 The Crimson Squall deck burned
step
    >>用 (1) |T132314:0|t 攻击附近的 |cRXP_ENEMY_船只|r 和 |cRXP_ENEMY_水手|r, 用 (2) |T136051:0|t 治疗自己. |cRXP_WARN_治疗期间无法使用 (1)|r
    .complete 52492,3 --15/15 Horde rowboats destroyed
    .complete 52492,2 --60/60 Horde sailors slain
step
    .goto 1156,41.75,57.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52492 >>交任务: |cRXP_FRIENDLY_蛮锤的专长|r
    .accept 52493 >>接任务: |cRXP_WARN_违背自然的船员|r
    .accept 52494 >>接任务: |cRXP_WARN_邪人邪晶|r
    .turnin 53131 >>交任务: |cRXP_FRIENDLY_诸王之眠|r
    .target 珊蒂斯·羽月
step
    #completewith San
    >>击杀遇到的所有 |cRXP_ENEMY_士兵|r
    .complete 52493,1 --12/12 Kill Horde on The Crimson Squall
    .mob 萨安'layn Neophyte
    .mob Crimson Squall Deck Hand
step
    .goto 1156,41.74,56.6
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_圣莱恩水晶|r
    .complete 52494,1,1 --5/5 San'layn Crystals destroyed
step
    .goto 1156,41.71,56.35,5,0
    .goto 1156,41.47,56.23
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_圣莱恩水晶|r
    .complete 52494,1,2 --5/5 San'layn Crystals destroyed
step
    .goto 1156,41.47,55.89,5,0
    .goto 1156,41.61,55.58
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_圣莱恩水晶|r
    .complete 52494,1,3 --5/5 San'layn Crystals destroyed
step
    .goto 1156,41.72,56.08
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_圣莱恩水晶|r
    .complete 52494,1,4 --5/5 San'layn Crystals destroyed
step
    #label San
    .goto 1156,41.46,55.66
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_FRIENDLY_圣莱恩水晶|r
    .complete 52494,1,5 --5/5 San'layn Crystals destroyed
step
    .goto 1156,41.53,56.55,5,0
    .goto 1156,41.7,56.33,5,0
    .goto 1156,41.63,55.67,5,0
    .goto 1156,41.49,55.87,5,0
    .goto 1156,41.7,55.67,5,0
    .goto 1156,41.49,55.88
    >>击杀 |cRXP_ENEMY_士兵|r
    .complete 52493,1 --12/12 Kill Horde on The Crimson Squall
    .mob 萨安'layn Neophyte
    .mob Crimson Squall Deck Hand
step
    .goto 1156,41.65,55.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52493 >>交任务: |cRXP_FRIENDLY_违背自然的船员|r
    .turnin 52494 >>交任务: |cRXP_FRIENDLY_邪人邪晶|r
    .accept 52495 >>接任务: |cRXP_WARN_终结萨莱因的威胁|r
    .timer 9.5, Opening the Door RP
    .target 珊蒂斯·羽月
step
    #completewith next
    .goto 1156,41.54,55.57,5,0
    .goto 1156,41.47,55.87,5,0
    .goto 1156,41.62,56.92,5,0
    .goto 1156,41.68,56.75,5,0
    .goto 1156,41.69,56.63,5 >>血王子德雷文剧情演出
    .timer 12, 血王子德雷文剧情演出
step
    .goto 1156,41.58,55.67
    >>击杀 |cRXP_ENEMY_鲜血王子德雷文|r
    .complete 52495,1 --1/1 Blood Prince Dreven slain
    .mob 鲜血 Prince Dreven
step
    .goto 1156,41.39,55.87,5,0
    .goto 1156,40.55,55.8
    >>跳过窗户, |cRXP_WARN_[额外行动按钮]|r 可用后立即按下
    .complete 52495,2 --1/1 Escape the ship and signal Falstad
    .timer 18, Falstad RP
step
    .goto 1156,38.56,48.62
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52495 >>交任务: |cRXP_FRIENDLY_终结萨莱因的威胁|r
    .target 珊蒂斯·羽月
step
    .goto 1156,38.13,48.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .accept 52496 >>接任务: |cRXP_WARN_利落的逃脱|r
    .target 珊蒂斯·羽月
step
    .isOnQuest 52496
    .zone Boralus >>使用 |T135764:0|t[返回博拉勒斯]
    .use 276830
step
    .goto 1161,69.28,26.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52496 >>交任务: |cRXP_FRIENDLY_利落的逃脱|r
    .accept 52473 >>接任务: |cRXP_WARN_消灭舰队|r
    .target Halford Wyrmbane
step
    .isOnQuest 52473
    .goto 1161,67.95,26.71
    .gossipoption 48166 >>对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .target 杰塔瑞斯将军
step
    .goto 862,40.77,70.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52473 >>交任务: |cRXP_FRIENDLY_消灭舰队|r
    .accept 52282 >>接任务: |cRXP_WARN_沉舸之法|r
step
    .isOnQuest 52282
    .goto 862,40.77,70.85
    .gossipoption 48931 >>与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .timer 63, Plan discussed
    .target Halford Wyrmbane
step
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52282,1 --1/1 Plan discussed
step
    .goto 862,40.77,70.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52282 >>交任务: |cRXP_FRIENDLY_沉舸之法|r
    .target Halford Wyrmbane
step
    .goto 862,40.8,70.9
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .accept 52281 >>接任务: |cRXP_WARN_迅翼的掩护|r
    .target Magister Umbric
step
    .isOnQuest 52281
    .goto 862,57.68,87.50
    .vehicle >>与 |cRXP_FRIENDLY_疾翼|r 互动
    .timer 95, Swiftwing Ride
step
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52281,1 --1/1 Ride Swiftwing to Isle of Fangs
step
    .goto 862,57.64,87.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯尔希·钢烁|r
    .turnin 52281 >>交任务: |cRXP_FRIENDLY_迅翼的掩护|r
    .accept 52284 >>接任务: |cRXP_WARN_舰船日志|r
    .target 凯尔希·钢烁
step
    .goto 862,57.64,87.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_约翰·J·基沙恩|r
    .accept 52283 >>接任务: |cRXP_WARN_破坏帕库之息号|r
    .target 约翰·J·基沙恩
step
    #completewith Remote
    >>击杀 |cRXP_ENEMY_雷之敌人|r 并拾取 |T237020:0|t|cRXP_LOOT_海军记录|r
    .complete 52284,1 --6/6 Naval Records
    .mob Zulian Crewman
    .mob Lei-zhi Oppressor
step
    .goto 862,54.11,84.72,10,0
    .goto 862,53.09,85.49,10,0
    .goto 862,51.94,86.88
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击遥控引爆死亡炸弹
    .complete 52283,1,1 --4/4 Remote-detonation deathbomb planted
step
    .goto 862,51.55,86.76
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击遥控引爆死亡炸弹
    .complete 52283,1,2 --4/4 Remote-detonation deathbomb planted
step
    .goto 862,51.52,86.96
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击遥控引爆死亡炸弹
    .complete 52283,1,3 --4/4 Remote-detonation deathbomb planted
step
    #label Remote
    .goto 862,51.91,87.45
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击遥控引爆死亡炸弹
    .complete 52283,1,4 --4/4 Remote-detonation deathbomb planted
step
    .goto 862,52.45,87.56,10,0
    .goto 862,54.16,84.83
    >>击杀 |cRXP_ENEMY_雷之敌人|r 并拾取 |T237020:0|t|cRXP_LOOT_海军记录|r
    .complete 52284,1 --6/6 Naval Records
    --x .mob
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_约翰·J·基沙恩|r 和 |cRXP_FRIENDLY_凯尔希·钢烁|r 交谈
    .turnin 52283 >>交任务: |cRXP_FRIENDLY_破坏帕库之息号|r
    .goto 862,57.64,87.55
    .turnin 52284 >>交任务: |cRXP_FRIENDLY_舰船日志|r
    .accept 52285 >>接任务: |cRXP_WARN_放大的小型潜水艇|r
    .goto 862,57.64,87.59
    .target 约翰·J·基沙恩
    .target 凯尔希·钢烁
step
    .isOnQuest 52285
    .goto 862,57.41,85.9
    .vehicle >>点击 |cRXP_FRIENDLY_潜艇|r
    .timer 54, Submarine RP
step
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52285,1 --1/1 Crossed Bay of Kings in the Enlarged Miniaturized Submarine
step
    .goto 862,48.89,68.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .turnin 52285 >>交任务: |cRXP_FRIENDLY_放大的小型潜水艇|r
    .accept 52290 >>接任务: |cRXP_WARN_敌人的敌人是伪装|r
    .target 珊蒂斯·羽月
step
    .isOnQuest 52290
    .goto 862,48.91,68.59
    .gossipoption 49422 >>与|cRXP_FRIENDLY_乌姆布里克大师|r交谈
    .timer 12, Disguise RP
    .target Magister Umbric
step
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52290,1 --1/1 Blood troll disguise complete
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊蒂斯·羽月|r 和 |cRXP_FRIENDLY_乌姆布里克导师|r 交谈
    .turnin 52290 >>交任务: |cRXP_FRIENDLY_敌人的敌人是伪装|r
    .accept 52286 >>接任务: |cRXP_WARN_眼皮底下就是炸弹|r
    .accept 52287 >>接任务: |cRXP_WARN_情报禁制|r
    .goto 862,48.89,68.57
    .accept 52288 >>接任务: |cRXP_WARN_虚空度假|r
    .goto 862,48.90,68.59
    .target Magister Umbric
    .target 珊蒂斯·羽月
step
    .goto 862,48.08,66.76
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_ENEMY_部落使者|r
    >>|cRXP_WARN_可以使用 [额外动作按钮] 潜行|r
    .complete 52288,1,1 --6/6 Horde emissaries thrown in void rift
    .use 162450
    .mob Horde Emissary
step
    .goto 862,47.54,66.86
    >>击杀 |cRXP_ENEMY_间谍大师风暴角|r
    .complete 52287,1 --1/1 Spymaster Stormhorn slain
    .mob Spymaster Stormhorn
step
    .goto 862,46.89,63.41
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_ENEMY_部落使者|r
    >>|cRXP_WARN_可使用 |cRXP_WARN_额外动作按钮|r 进入潜行|r
    .complete 52288,1,2 --6/6 Horde emissaries thrown in void rift
    .use 162450
    .mob Horde Emissary
step
    .goto 862,45.84,62.12
    >>击杀 |cFFfa9602建筑内|r 的 |cRXP_ENEMY_间谍长官血嚎|r
    .complete 52287,2 --1/1 Spymaster Bloodsnarl slain
    .mob Spymaster Bloodsnarl
step
    .goto 862,46.08,62.13,5,0
    .goto 862,45.93,62.33
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_ENEMY_部落使者|r
    >>|cRXP_WARN_可使用 |cRXP_WARN_额外动作按钮|r 进入潜行|r
    .complete 52288,1,3 --6/6 Horde emissaries thrown in void rift
    .use 162450
    .mob Horde Emissary
step
    .goto 862,46.34,59.98
    >>击杀 |cFFfa9602建筑内|r 的 |cRXP_ENEMY_间谍长官胆汁散播者|r
    .complete 52287,3 --1/1 Spymaster Bilespreader slain
    .mob Spymaster Bilespreader
step
    .goto 862,46.34,60.26,5,0
    .goto 862,48.05,63.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_ENEMY_部落使者|r
    >>|cRXP_WARN_可使用 |cRXP_WARN_额外动作按钮|r 进入潜行|r
    .complete 52288,1,4 --6/6 Horde emissaries thrown in void rift
    .use 162450
    .mob Horde Emissary
step
    .goto 862,48.98,64.74
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_ENEMY_部落使者|r
    >>|cRXP_WARN_可使用 |cRXP_WARN_额外动作按钮|r 进入潜行|r
    .complete 52288,1,5 --6/6 Horde emissaries thrown in void rift
    .use 162450
    .mob Horde Emissary
step
    .goto 862,49.74,64.68
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_ENEMY_部落使者|r
    >>|cRXP_WARN_可使用 |cRXP_WARN_额外动作按钮|r 进入潜行|r
    .complete 52288,1,6 --6/6 Horde emissaries thrown in void rift
    .use 162450
    .mob Horde Emissary
step
    .goto 862,49.95,65.03
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cFFfa9602船|r 附近 |cFFfa9602水下|r 的 |cRXP_PICK_炸弹|r
    .complete 52286,1,1 --3/3 Remote-detonation deathbomb planted
step
    .goto 862,50.64,65.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cFFfa9602船|r 附近 |cFFfa9602水下|r 的 |cRXP_PICK_炸弹|r
    .complete 52286,1,2 --3/3 Remote-detonation deathbomb planted
step
    .goto 862,50.32,65.82
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cFFfa9602船|r 附近 |cFFfa9602水下|r 的 |cRXP_PICK_炸弹|r
    .complete 52286,1,3 --3/3 Remote-detonation deathbomb planted
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_珊蒂斯·羽月|r 和 |cRXP_FRIENDLY_乌姆布里克导师|r 交谈
    .turnin 52288 >>交任务: |cRXP_FRIENDLY_虚空度假|r
    .goto 862,48.91,68.59
    .turnin 52286 >>交任务: |cRXP_FRIENDLY_眼皮底下就是炸弹|r
    .turnin 52287 >>交任务: |cRXP_FRIENDLY_情报禁制|r
    .accept 52289 >>接任务: |cRXP_WARN_胜券在握|r
    .goto 862,48.90,68.59
    .target 珊蒂斯·羽月
    .target Magister Umbric
step
    .goto 862,40.47,71.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52289 >>交任务: |cRXP_FRIENDLY_胜券在握|r
    .accept 52291 >>接任务: |cRXP_WARN_胜券曾在握|r
    .target Halford Wyrmbane
step
    .isOnQuest 52291
    .goto 862,40.52,71.34
    .vehicle >>与 |cRXP_FRIENDLY_疾翼|r 互动
    .timer 70, Ride Swiftwing to Gral's Call
    .target Swiftwing
step
    .goto 862,35.10,77.32
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52291,1 --1/1 Ride Swiftwing to Gral's Call
step
    .goto 862,35.14,77.31
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 52291 >>交任务: |cRXP_FRIENDLY_胜券曾在握|r
    .accept 52788 >>接任务: |cRXP_WARN_不留活口|r
    .target Halford Wyrmbane
step
    .goto 862,34.74,76.85,10,0
    .goto 862,34.96,77.01,10,0
    .goto 862,34.46,76.51,10,0
    .goto 862,34.33,75.87,10,0
    .goto 862,34.98,77.03
    >>击杀 |cRXP_ENEMY_赞达拉敌人|r
    >>|cRXP_WARN_沿箭头前进|r
    .complete 52788,1 --10/10 Zandalari slain
    .mob Zandalari Hexxer
    .mob Zandalari Honorguard
step
    .goto 862,35.04,76.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈尔福德·龙刃|r交谈, 就在你旁边
    .turnin 52788 >>交任务: |cRXP_FRIENDLY_不留活口|r
    .accept 52789 >>接任务: |cRXP_WARN_刺杀顾问|r
    .target Halford Wyrmbane
step
    .goto 862,34.74,76.85,10,0
    .goto 862,34.96,77.01,10,0
    .goto 862,34.46,76.51,10,0
    .goto 862,34.33,75.87,10,0
    .goto 862,34.98,77.03
    >>在 |cFFfa9602船|r 内击杀 |cRXP_ENEMY_顾问科扬|r
    .complete 52789,1 --1/1 Advisor Ko'jan slain
    .mob Advisor Ko'jan
step
    .goto 862,34.98,76.97
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈尔福德·龙刃|r交谈, 就在你旁边
    .turnin 52789 >>交任务: |cRXP_FRIENDLY_刺杀顾问|r
    .accept 52790 >>接任务: |cRXP_WARN_终结杀戮|r
    .target Halford Wyrmbane
step
    .goto 862,34.33,75.88,10,0
    .goto 862,34.96,76.99,10,0
    .goto 862,34.91,76.69,10,0
    .goto 862,34.92,76.68
    >>|cRXP_WARN_沿箭头前进|r
    .complete 52790,1 --Travel to Gral's Call upper deck
step
    .isOnQuest 52790
    .goto 862,34.83,76.32
    .gossipoption 49425 >>对话 |cRXP_FRIENDLY_珊蒂斯·羽月|r
    .timer 58, Assess situation RP.
    .target 珊蒂斯·羽月
step
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 52790,2 --1/1 Assess situation with Shandris Feathermoon
step
    .goto 862,34.84,76.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    >>|cRXP_WARN_按 Esc 跳过过场动画|r
    .complete 52790,3 --1/1 Tell Halford to blow up the ship
    .skipgossip
    .target Halford Wyrmbane
step
    .isOnQuest 52790
    .goto 862,40.46,71.03
    .gossipoption 49161 >>与|cRXP_FRIENDLY_达莉亚·史密森|r交谈
    .target 达尔ia Smithson
step
    .isOnQuest 52790
    .goto 1161,70.55,17.18,5,0
    .goto 1161,70.1,16.8,5,0
    .goto 84,85.92,31.57
    .zone 84 >>点击 |cRXP_PICK_暴风城传送门|r
step
    .goto 84,49.34,86.77,5,0
    .goto 84,48.84,86.78,5,0
    .goto 84,49.34,87.03,5,0
    .goto 84,85.92,31.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_安度因·乌瑞恩国王|r
    .turnin 52790 >>交任务: |cRXP_FRIENDLY_终结杀戮|r
    .target 安度因·乌瑞恩国王
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group RestedXP <争霸艾泽拉斯>战争战役
#name 8) 复仇之潮
#displayname 第 8 章 - 复仇之潮
<< Alliance
step
    .goto 1161,70.72,27.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    .accept 53986 >>接任务: |cRXP_WARN_风暴前的平静|r
    .target 马迪亚斯·肖尔
step
    .isOnQuest 53986
    .goto 1161,66.98,15.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔安·韦伯|r交谈
    .fly Proudmoore Keep >>飞往普罗德摩尔要塞
    .target Joan Weber
step
    .goto 895,67.26,36.22
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .complete 53986,1 --1/1 Take the report to Jaina
    .skipgossip 145580,1
    .timer 73, Jaina RP
    .target 吉安娜·普罗德摩尔
step
    .goto 895,67,36.24
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 53986,2 --1/1 Wait a moment
step
    .goto 895,66.99,36.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 53986 >>交任务: |cRXP_FRIENDLY_风暴前的平静|r
    .accept 53888 >>接任务: |cRXP_WARN_前往尖角码头|r
    .target 吉安娜·普罗德摩尔
step
    .goto 1161,63.32,54.94
    >>|cRXP_WARN_沿箭头前进|r
    .complete 53888,1 --1/1 Meet Jaina at the canal by Crosswind Commons
step
    .isOnQuest 53888
    .goto 1161,63.73,52.95
    .vehicle >>点击 |cRXP_PICK_船|r
    .timer 120, Boat to Anglepoint Wharf
step
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 53888,2 --1/1 Take Boat to Anglepoint Wharf
step
    .goto 895,42.17,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 53888 >>交任务: |cRXP_FRIENDLY_前往尖角码头|r
    .accept 53896 >>接任务: |cRXP_WARN_坚守阵地|r
    .target 吉安娜·普罗德摩尔
step
    .goto 895,42.17,29.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .complete 53896,1 --1/1 Speak with Jaina Proudmoore
    .skipgossip 145580,1
    .target 吉安娜·普罗德摩尔
step
    .goto 895,42.44,29.63
    >>击杀连续的敌方波次, 最后一波击杀 |cRXP_ENEMY_赞达·霜歌|r
    .complete 53896,2 --1/1 Jaina Proudmoore Protected
    .mob Invading Berserker
    .mob Invading Spirit-mender
    .mob Invading Warrior
    .mob Zanda Frostsong
step
    .goto 895,42.13,29.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 53896 >>交任务: |cRXP_FRIENDLY_坚守阵地|r
    .accept 53909 >>接任务: |cRXP_WARN_友军之围|r
    .accept 53910 >>接任务: |cRXP_WARN_击退部落！|r
    .target 吉安娜·普罗德摩尔
step
    .goto 895,42.14,29.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔莉亚·福特拉贡|r交谈
    .accept 54519 >>接任务: |cRXP_WARN_救援巡逻队|r
    .target Taelia Fordragon
step
    .goto 895,42.17,29.78
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥克里·扳手|r交谈
    .accept 54518 >>接任务: |cRXP_WARN_消灭飞艇|r
    .target Okri Putterwrench
    .timer 30, Okri Putterwrench RP
step
    #completewith Emma
#loop
	.line 895,43.39,27.88,42.99,27.00,42.35,26.56,41.84,27.37
	.goto 895,43.39,27.88,15,0
	.goto 895,42.99,27.00,15,0
	.goto 895,42.35,26.56,15,0
	.goto 895,41.84,27.37,15,0
    >>击杀 |cRXP_ENEMY_入侵的萨满|r 和 |cRXP_ENEMY_入侵的狂战士|r
    .complete 53910,1 --Defeat Axe Throwers and Berserkers (100%)
    .mob Invading Shaman
    .mob Invading Berserker
step
    .goto 895,41.84,27.37
    >>与 |cRXP_FRIENDLY_艾玛·斯威特温德|r 互动
    .complete 54519,2 --1/1 Emma Swiftwind found
    .goto 895,41.84,27.39
    .target Emma Swiftwind
step
    .goto 895,42.35,26.56
    >>与 |cRXP_FRIENDLY_爱德华·纳什|r 互动
    .complete 54519,4 --1/1 Edward Nash found
    .target 爱德华 Nash
step
    .goto 895,41.69,29.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥克里·扳手|r交谈
    .complete 54518,1 --1/1 Get a Jury-Rigged Hand Cannon from Okri
    .skipgossip 145632,1
step
    .goto 895,41.68,29.71
    >>在冰山上使用 |cRXP_WARN_额外动作按钮|r
    .complete 54518,2 --1/1 Test the Jury-Rigged Hand Cannon
    .mob Horde Bombardier
step
    .goto 895,42.99,28.24
    >>使用 |cRXP_WARN_[额外动作按钮]|r 摧毁 |cRXP_ENEMY_部落飞艇|r
    .complete 54518,3,1 --4/4 Horde Bombardier slain
    .mob Horde Bombardier
step
    .goto 895,43.39,27.88
    >>与 |cRXP_FRIENDLY_卡特·激流|r 互动
    .complete 54519,1 --1/1 Carter Riptide found
    .target 货车er Riptide
step
    .goto 895,43.14,27.32
    >>使用 |cRXP_WARN_[额外动作按钮]|r 摧毁 |cRXP_ENEMY_部落飞艇|r
    .complete 54518,3,2 --4/4 Horde Bombardier slain
    .mob Horde Bombardier
step
    .goto 895,42.99,27.00
    >>与 |cRXP_FRIENDLY_塔玛拉·巴里|r 互动
    .complete 54519,3 --1/1 Tamara Barrie found
    .target 达玛尔a Barrie
step
    .goto 895,43.01,26.54
    >>使用 |cRXP_WARN_[额外动作按钮]|r 摧毁 |cRXP_ENEMY_部落飞艇|r
    .complete 54518,3,3 --4/4 Horde Bombardier slain
    .mob Horde Bombardier
step
    #label Emma
    .goto 895,42.58,26.95
    >>使用 |cRXP_WARN_[额外动作按钮]|r 摧毁 |cRXP_ENEMY_部落飞艇|r
    .complete 54518,3,4 --4/4 Horde Bombardier slain
    .mob Horde Bombardier
step
    .goto 895,41.54,27.08,20,0
#loop
	.line 895,43.39,27.88,42.99,27.00,42.35,26.56,41.84,27.37
	.goto 895,43.39,27.88,15,0
	.goto 895,42.99,27.00,15,0
	.goto 895,42.35,26.56,15,0
	.goto 895,41.84,27.37,15,0
    >>击杀 |cRXP_ENEMY_入侵的萨满|r 和 |cRXP_ENEMY_入侵的狂战士|r
    .complete 53910,1 --Defeat Axe Throwers and Berserkers (100%)
    .mob Invading Shaman
    .mob Invading Berserker
step
    .goto 895,41.53,27.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥克里·扳手|r交谈
    .turnin 54518 >>交任务: |cRXP_FRIENDLY_消灭飞艇|r
    .target Okri Putterwrench
step
    .goto 895,41.52,27.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗莎琳·麦迪逊|r交谈
    .turnin 53909 >>交任务: |cRXP_FRIENDLY_友军之围|r
    .turnin 53910 >>交任务: |cRXP_FRIENDLY_击退部落！|r
    .turnin 54519 >>交任务: |cRXP_FRIENDLY_救援巡逻队|r
    .accept 53916 >>接任务: |cRXP_WARN_风舷利刃|r
    .target 洛莎line Madison
step
    .goto 895,41.94,27.31
   >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_舷外武器|r
    .complete 53916,1,1 --10/10 Outrigger Weapon recovered
step
    .goto 895,42.1,27.25
   >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_舷外武器|r
    .complete 53916,1,2 --10/10 Outrigger Weapon recovered
step
    .goto 895,42.24,27.38
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_舷外武器|r
    .complete 53916,1,3 --10/10 Outrigger Weapon recovered
step
    .goto 895,42.53,27.31
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_舷外武器|r
    .complete 53916,1,4 --10/10 Outrigger Weapon recovered
step
    .goto 895,42.71,27.43
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_舷外武器|r
    .complete 53916,1,5 --10/10 Outrigger Weapon recovered
step
    .goto 895,42.77,26.39
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_舷外武器|r
    .complete 53916,1,6 --10/10 Outrigger Weapon recovered
step
    .goto 895,42.59,26.67
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_舷外武器|r
    .complete 53916,1,7 --10/10 Outrigger Weapon recovered
step
    .goto 895,42.39,26.55
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_舷外武器|r
    .complete 53916,1,8 --10/10 Outrigger Weapon recovered
step
    .goto 895,42.2,26.76
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_舷外武器|r
    .complete 53916,1,9 --10/10 Outrigger Weapon recovered
step
    .goto 895,42.08,26.8
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_舷外武器|r
    .complete 53916,1,10 --10/10 Outrigger Weapon recovered
step
    .goto 895,41.51,27.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_罗莎琳·麦迪逊|r交谈
    .turnin 53916 >>交任务: |cRXP_FRIENDLY_风舷利刃|r
    .accept 53978 >>接任务: |cRXP_WARN_火药妙计|r
    .accept 54787 >>接任务: |cRXP_WARN_遮掩面具|r
    .target 洛莎line Madison
step
    .goto 895,41.53,27.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥克里·扳手|r交谈
    .accept 54559 >>接任务: |cRXP_WARN_解救缅栀！|r
    .target Okri Putterwrench
step
    #completewith Mask
    >>击杀 |cRXP_ENEMY_入侵的凋零专家|r 并拾取 |T133145:0|t|cRXP_LOOT_凋零专家面具|r
    .complete 54787,1 --4/4 Blight Specialist Mask collected
    .mob Invading Blight Specialist
step
    .goto 895,40.46,26.84
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火药桶|r
    .complete 53978,1,1 --6/6 Gunpowder Keg Collected
step
    .goto 895,40.22,26.31
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_铁球铁链|r
    .complete 54559,2,1 --2/2 Plumeria's Chains released
step
    .goto 895,40.23,26.15
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_铁球铁链|r
    .complete 54559,2,2 --2/2 Plumeria's Chains released
step
    .goto 895,40.17,26.22
    >>击杀 |cRXP_ENEMY_毛里齐奥·死亡狂热|r
    .complete 54559,1 --1/1 Maurizio Deaththrill slain
    .mob Maurizio Deaththrill
step
    .goto 895,40.31,26.39
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火药桶|r
    .complete 53978,1,2 --6/6 Gunpowder Keg Collected
step
    .goto 895,39.89,26.28
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火药桶|r
    .complete 53978,1,3 --6/6 Gunpowder Keg Collected
step
    .goto 895,39.53,26.75
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火药桶|r
    .complete 53978,1,4 --6/6 Gunpowder Keg Collected
step
    .goto 895,39.11,25.3
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火药桶|r
    .complete 53978,1,5 --6/6 Gunpowder Keg Collected
step
    #label Mask
    .goto 895,38.43,25.65
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_火药桶|r
    .complete 53978,1,6 --6/6 Gunpowder Keg Collected
step
#loop
	.line 895,37.50,24.89,38.43,25.65,39.11,25.3,39.53,26.75,39.89,26.28,40.31,26.39,40.46,26.84
	.goto 895,37.50,24.89,20,0
	.goto 895,38.43,25.65,20,0
	.goto 895,39.11,25.30,20,0
	.goto 895,39.53,26.75,20,0
	.goto 895,39.89,26.28,20,0
	.goto 895,40.31,26.39,20,0
	.goto 895,40.46,26.84,20,0
    >>击杀 |cRXP_ENEMY_入侵的凋零专家|r 并拾取 |T133145:0|t|cRXP_LOOT_凋零专家面具|r
    .complete 54787,1 --4/4 Blight Specialist Mask collected
    .mob Invading Blight Specialist
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_奥克里·扳手|r和|cRXP_FRIENDLY_罗莎琳·马迪森|r交谈
    .turnin 54559 >>交任务: |cRXP_FRIENDLY_解救缅栀！|r
    .goto 895,37.48,24.99
    .turnin 54787 >>交任务: |cRXP_FRIENDLY_遮掩面具|r
    .turnin 53978 >>交任务: |cRXP_FRIENDLY_火药妙计|r
    .accept 53919 >>接任务: |cRXP_WARN_火炮响起|r
    .goto 895,37.50,24.89
    .target Okri Putterwrench
    .target 洛莎line Madison
step
    .goto 895,37.46,24.97
    .isOnQuest 53919
    .vehicle >>点击 |cRXP_PICK_支座炮|r
step
    >>使用 |T252185:0|t(1)击毁 |cRXP_ENEMY_摩托艇|r
    .complete 53919,1 --10/10 Horde Motorboats Sunk
step
    .goto 895,37.40,24.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .complete 53919,2 --1/1 Speak with Jaina
    .skipgossip 145580,1
    .target 吉安娜·普罗德摩尔
step
    .goto 895,37.40,24.95
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 53919 >>交任务: |cRXP_FRIENDLY_火炮响起|r
    .accept 53936 >>接任务: |cRXP_WARN_阻止地精工兵|r
    .target 吉安娜·普罗德摩尔
step
    .goto 895,36.47,28.37
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_大型艾泽里特炸弹|r
    .complete 53936,2,4 --40/40 Large Azerite Bomb
step
    .goto 895,36.15,29.86
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_大型艾泽里特炸弹|r
    .complete 53936,2,8 --40/40 Large Azerite Bomb
step
    .goto 895,35.98,30.17
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_大型艾泽里特炸弹|r
    .complete 53936,2,12 --40/40 Large Azerite Bomb
step
    .goto 895,35.65,30.18
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_大型艾泽里特炸弹|r
    .complete 53936,2,16 --40/40 Large Azerite Bomb
step
    .goto 895,35.56,30.27
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_大型艾泽里特炸弹|r
    .complete 53936,2,20 --40/40 Large Azerite Bomb
step
    .goto 895,35.46,30.77
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_大型艾泽里特炸弹|r
    .complete 53936,2,24 --40/40 Large Azerite Bomb
step
    .goto 895,35.19,30.92
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_大型艾泽里特炸弹|r
    .complete 53936,2,28 --40/40 Large Azerite Bomb
step
    .goto 895,34.96,30.97
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_大型艾泽里特炸弹|r
    .complete 53936,2,32 --40/40 Large Azerite Bomb
step
    .goto 895,34.76,30.73
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_大型艾泽里特炸弹|r
    .complete 53936,2,36 --40/40 Large Azerite Bomb
step
    .goto 895,34.47,31.08
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_大型艾泽里特炸弹|r
    .complete 53936,2,40 --40/40 Large Azerite Bomb
step
    .goto 895,34.45,29.95
    >>击杀 |cRXP_ENEMY_内比克·超级燃料|r
    .complete 53936,1 --1/1 内布ik Megafuel slain
    .mob 内布ik Megafuel
step
    .goto 895,35.81,28.05
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_奥术传送信标|r
    .complete 53936,3 --1/1 Use Arcane Teleport Beacon
step
    .goto 895,36.25,29.81
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 53936 >>交任务: |cRXP_FRIENDLY_阻止地精工兵|r
    .accept 54703 >>接任务: |cRXP_WARN_特快专递|r
    .target 吉安娜·普罗德摩尔
step
    .isOnQuest 54703
    .goto 895,36.3,29.76
    .vehicle >>点击 |cRXP_PICK_鱼叉|r
step
    >>|T1911518:0|t(1)击毁 3 艘敌方舰船
    >>|cFFd0342c前方将播放不可跳过的过场动画|r
    .complete 54703,1 --3/3 Ships marked
step
    .goto 895,36.42,30.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 54703 >>交任务: |cRXP_FRIENDLY_特快专递|r
    .accept 53887 >>接任务: |cRXP_WARN_烽火连绵|r
    .target 吉安娜·普罗德摩尔
step
    .isOnQuest 53887
    .goto 895,42.48,23.02
    .cooldown item,6948,<1,1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达金|r交谈
    .fly Tradewinds Market >>飞往贸易风集市
    .target Dagin
step
    .isOnQuest 53887
    .cooldown item,6948,>0,1
    .hs >>将炉石设为博拉勒斯
step
    .goto 1161,69.27,27.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 53887 >>交任务: |cRXP_FRIENDLY_烽火连绵|r
    .accept 54192 >>接任务: |cRXP_WARN_敏感情报|r
    .target Halford Wyrmbane
step
    .isOnQuest 54192
    .goto 1161,67.95,26.71
    .gossipoption 48166 >>对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .target 杰塔瑞斯将军
step
    .goto 862,41.08,70.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯尔希·钢烁|r
    .turnin 54192 >>交任务: |cRXP_FRIENDLY_敏感情报|r
    .accept 54193 >>接任务: |cRXP_WARN_这是个大发现！|r
step
    .isOnQuest 54193
    .goto 862,41.1,70.61
    .gossipoption 50536 >>与|cRXP_FRIENDLY_梅格斯|r交谈
    .timer 24, Megs Dialogue
    .target Megs
step
    .goto 862,41.08,70.65
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 54193,1 --1/1 Listen to Megs and Morton's plan
step
    .goto 862,41.08,70.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯尔希·钢烁|r
    .turnin 54193 >>交任务: |cRXP_FRIENDLY_这是个大发现！|r
    .target 凯尔希·钢烁
step
    .goto 862,41.1,70.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅格斯|r交谈
    .accept 54194 >>接任务: |cRXP_WARN_“大”力出奇迹|r
    .target Megs
step
    .goto 862,41.22,70.51
    >>与 |cRXP_FRIENDLY_库尔提拉斯母鸡|r 互动
    .complete 54194,1 --1/1 Embiggifier tested
    .mob Kul Tiran Clucker
step
    >>击杀 |cRXP_ENEMY_库尔提拉斯母鸡|r
    .complete 54194,2 --1/1 Kul Tiran Clucker slain
    .mob Kul Tiran Clucker
step
    .goto 862,41.10,70.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅格斯|r交谈
    .turnin 54194 >>交任务: |cRXP_FRIENDLY_“大”力出奇迹|r
    .accept 54195 >>接任务: |cRXP_WARN_智慧野兽|r
    .target Megs
step
    .goto 862,48.21,55.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格隆|r交谈
    .turnin 54195 >>交任务: |cRXP_FRIENDLY_智慧野兽|r
    .accept 54196 >>接任务: |cRXP_WARN_别无选择|r
    .accept 54197 >>接任务: |cRXP_WARN_达卡尼的自由|r
    .target Grong
step
    #completewith Da'kani Highbrow
    >>击杀 |cRXP_ENEMY_比尔吉沃特偷猎者|r
    .complete 54196,1 --12/12 Bilgewater Poacher slain
step
    .goto 862,48.81,55.15
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_笼子|r
    .complete 54197,1,1 --8/8 Da'kani Highbrow freed
step
    .goto 862,49.06,54.81
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_笼子|r
    .complete 54197,1,2 --8/8 Da'kani Highbrow freed
step
    .goto 862,49.62,54.11
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_笼子|r
    .complete 54197,1,3 --8/8 Da'kani Highbrow freed
step
    .goto 862,49.53,54.03
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_笼子|r
    .complete 54197,1,4 --8/8 Da'kani Highbrow freed
step
    .goto 862,49.22,53.49
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_笼子|r
    .complete 54197,1,5 --8/8 Da'kani Highbrow freed
step
    .goto 862,48.6,53.91
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_笼子|r
    .complete 54197,1,6 --8/8 Da'kani Highbrow freed
step
    .goto 862,48.07,53.95
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_笼子|r
    .complete 54197,1,7 --8/8 Da'kani Highbrow freed
step
    .goto 862,48.09,53.13
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_笼子|r
    .complete 54197,1,8 --8/8 Da'kani Highbrow freed
step
#loop
	.line 862,48.06,52.3,48.14,51.29,47.7,52.07,47.09,52.12
	.goto 862,48.06,52.30,15,0
	.goto 862,48.14,51.29,15,0
	.goto 862,47.70,52.07,15,0
	.goto 862,47.09,52.12,15,0
    >>击杀 |cRXP_ENEMY_比尔吉沃特偷猎者|r
    .complete 54196,1 --12/12 Bilgewater Poacher slain
    .mob Bilgewater Poacher
step
    .goto 862,48.84,53.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格隆|r交谈
    .turnin 54197 >>交任务: |cRXP_FRIENDLY_达卡尼的自由|r
    .turnin 54196 >>交任务: |cRXP_FRIENDLY_别无选择|r
    .accept 54198 >>接任务: |cRXP_WARN_苦乐参半的告别|r
    .target Grong
step
    .goto 862,46.80,50.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格隆|r交谈
    .turnin 54198 >>交任务: |cRXP_FRIENDLY_苦乐参半的告别|r
    .accept 54199 >>接任务: |cRXP_WARN_多数人的需求|r
step
    .goto 862,46.8,50.5
    .isOnQuest 54199
    .vehicle >>与 |cRXP_FRIENDLY_格隆|r 互动
    .timer 109, Grong RP
step
    .goto 862,41.21,70.54
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 54199,1 --1/1 Accompany Grong to Xibala
step
    .goto 862,41.07,70.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫顿·科格斯沃德|r交谈
    .turnin 54199 >>交任务: |cRXP_FRIENDLY_多数人的需求|r
    .accept 54200 >>接任务: |cRXP_WARN_从基础开始|r
step
    .goto 862,41.07,70.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫顿·科格斯沃德|r交谈
    .complete 54200,1 --1/1 Speak to Morton Cogswalt
step
    .goto 862,41.90,73.61
    >>|cRXP_WARN_沿箭头前进|r
    >>使用 |T463836:0|t(1)跳跃一段距离
    .complete 54200,2 --1/1 Reach the marker
step
    .goto 862,42.37,72.97
    >>使用 |T589118:0|t(4) 对话 |cRXP_FRIENDLY_Grong|r
    .complete 54200,3 --1/1 Speak to Grong
step
    .goto 862,42.37,72.97
    >>使用 |T463836:0|t(1)跳跃一段距离
    >>使用 |T1058933:0|t(2)对周围造成伤害
    >>使用 |T236164:0|t(3)对前方造成伤害
    >>击杀 |cRXP_ENEMY_希巴拉暴掠龙|r
    .complete 54200,4 --1/1 Xibalan Ravasaur slain
step
    .isOnQuest 54200
    .exitvehicle >>|cRXP_WARN_按动作条上的 [退出] 按钮下马格隆|r
    *|cRXP_WARN_或者, 可以使用这个宏;|r
    .link /leavevehicle>>点击此处获取宏命令
    *|cRXP_WARN_建议保存此宏以备后用|r
step
    .goto 862,41.07,70.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫顿·科格斯沃德|r交谈
    .turnin 54200 >>交任务: |cRXP_FRIENDLY_从基础开始|r
    .accept 54201 >>接任务: |cRXP_WARN_量身订做|r
    .target 莫特on Cogswald
step
    .goto 862,41.1,70.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅格斯|r交谈
    .accept 54202 >>接任务: |cRXP_WARN_校准核心|r
    .target Megs
step
    #completewith crates
    >>|cRXP_WARN_比尔吉沃特压裂机可能无法正常工作|r
    >>击杀 |cRXP_ENEMY_胆汁水敌人|r, 点击以校准
    .complete 54202,1 --10/10 Embiggifier Core calibrated
    .mob Bilgewater Fracker
    .mob Bilgewater Driller
    .mob Bilgewater Boomer
step
    .goto 862,36.42,70.44
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿石箱|r
    >>|cRXP_WARN_不要拾取 |cRXP_PICK_艾泽里特浸染的矿石|r|r
    .complete 54201,1,3 --12/12 Azerite Infused Ore
step
    .goto 862,35.52,69.95
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿石箱|r
    >>|cRXP_WARN_不要拾取 |cRXP_PICK_艾泽里特浸染的矿石|r|r
    .complete 54201,1,6 --12/12 Azerite Infused Ore
step
    .goto 862,35.35,69.51
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿石箱|r
    >>|cRXP_WARN_不要拾取 |cRXP_PICK_艾泽里特浸染的矿石|r|r
    .complete 54201,1,9 --12/12 Azerite Infused Ore
step
    #label crates
    .goto 862,35.64,71.15
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_矿石箱|r
    >>|cRXP_WARN_不要拾取 |cRXP_PICK_艾泽里特浸染的矿石|r|r
    .complete 54201,1,12 --12/12 Azerite Infused Ore
step
#loop
	.line 862,35.33,72.67,34.45,71.86,33.65,70.29,34.74,69.39
	.goto 862,35.33,72.67,20,0
	.goto 862,34.45,71.86,20,0
	.goto 862,33.65,70.29,20,0
	.goto 862,34.74,69.39,20,0
    >>|cRXP_WARN_比尔吉沃特压裂机可能无法正常工作|r
    >>击杀 |cRXP_ENEMY_胆汁水敌人|r, 点击以校准
    .complete 54202,1 --10/10 Embiggifier Core calibrated
    .mob Bilgewater Fracker
    .mob Bilgewater Driller
    .mob Bilgewater Boomer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莫顿·科格斯沃德|r和|cRXP_FRIENDLY_梅格斯|r交谈
    .turnin 54201 >>交任务: |cRXP_FRIENDLY_量身订做|r
    .goto 862,41.07,70.62
    .turnin 54202 >>交任务: |cRXP_FRIENDLY_校准核心|r
    .accept 54203 >>接任务: |cRXP_WARN_巨化|r
step
    .goto 862,41.1,70.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅格斯|r交谈
    .complete 54203,1 --1/1 Speak to Megs
    .skipgossip 147148,1
step
    .goto 862,41.88,73.65
    >>使用 |T133015:0|t(5)将格隆变大
    .complete 54203,5 --1/1 Embiggify Grong
step
    .goto 862,41.88,73.65
    >>使用 |T463836:0|t(1)跳跃一段距离
    .complete 54203,3 --1/1 Reach the marker
step
    .goto 862,41.1,70.61
    >>使用 |T589118:0|t(4) 对话 |cRXP_FRIENDLY_Grong|r
    .complete 54203,4 --1/1 Speak to Grong
step
    .goto 862,41.1,70.61
    >>使用 |T133015:0|t(5)将格隆变大
    .complete 54203,5 --1/1 Embiggify Grong
step
    .isOnQuest 54203
    .goto 862,41.1,70.61
    .exitvehicle >>|cRXP_WARN_按动作条上的 [退出] 按钮下马格隆|r
    *|cRXP_WARN_或者, 可以使用这个宏;|r
    .link /leavevehicle>>点击此处获取宏命令
    *|cRXP_WARN_建议保存此宏以备后用|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅格斯|r交谈
    .turnin 54203 >>交任务: |cRXP_FRIENDLY_巨化|r
    .accept 54204 >>接任务: |cRXP_WARN_神殿的毁灭|r
    .target Megs
step
    .goto 862,41.19,70.72
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_虚空传送门|r
    .complete 54204,1 --1/1 Umbric's portal used
step
#loop
	.line 862,49.76,41.46,50.05,43.08,49.1,43.03,49.79,40.57
	.goto 862,49.76,41.46,15,0
	.goto 862,50.05,43.08,15,0
	.goto 862,49.10,43.03,15,0
	.goto 862,49.79,40.57,15,0
    >>使用 |T463836:0|t(1)跳跃一段距离并造成伤害
    >>使用 |T1058933:0|t(2)对周围造成伤害
    >>使用 |T236164:0|t(3)对前方造成伤害
    .complete 54204,2 --Temple forces destroyed (100%)
step
    .goto 862,41.14,70.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯尔希·钢烁|r
    .turnin 54204 >>交任务: |cRXP_FRIENDLY_神殿的毁灭|r
    .accept 54205 >>接任务: |cRXP_WARN_做个好梦|r
    .target 凯尔希·钢烁
step
    .goto 862,41.15,70.68
    >>与 |cRXP_FRIENDLY_格隆|r 互动
    .complete 54205,1 --1/1 Grong tranquilized
step
    .goto 862,41.15,70.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_凯尔希·钢烁|r
    .turnin 54205 >>交任务: |cRXP_FRIENDLY_做个好梦|r
    .accept 54206 >>接任务: |cRXP_WARN_沉睡的特工|r
    .target 凯尔希·钢烁
step
    .isOnQuest 54206
    .goto 862,40.46,71.02
    .gossipoption 49161 >>与|cRXP_FRIENDLY_达莉亚|r交谈
    .target 达尔ia Smithson
step
    .goto 1161,69.25,27.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 54206 >>交任务: |cRXP_FRIENDLY_沉睡的特工|r
    .accept 54171 >>接任务: |cRXP_WARN_深渊节杖|r
    .target Halford Wyrmbane
step
    .isOnQuest 54171
    .goto 1161,67.95,26.71
    .gossipoption 48166 >>对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .target 杰塔瑞斯将军
step
    .goto 862,40.59,70.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 54171 >>交任务: |cRXP_FRIENDLY_深渊节杖|r
    .accept 54169 >>接任务: |cRXP_WARN_劫掠珍宝间|r
    .target 吉安娜·普罗德摩尔
step
    .isOnQuest 54169
    .goto 862,40.59,70.70
    .gossipoption 50525 >>与 [吉安娜·普罗德摩尔] 交谈
    .timer , Jaina Dialogue
    .target 吉安娜·普罗德摩尔
step
    .goto 862,40.61,70.7
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 54169,1 --1/1 Speak with Jaina Proudmoore
step
    .isOnQuest 54169
    .goto 862,40.61,70.7
    .zone 1348 >>点击 |cRXP_PICK_入口传送门|r
    .timer 20, Golem activation RP
step
    #completewith Zepter
    .isOnQuest 54169
    >>|cRXP_WARN_完成剧情场景|r
    .complete 54169,2 --1/1 Retrieve the Abyssal Scepter from the Zandalari Treasury.
    .mob Treasury Protector
step
    .isOnQuest 54169
    .goto 1348,24.36,81.55
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    >>击杀 |cRXP_ENEMY_宝库守护者|r
    .scenario 4021,1 --Golem Destroyed
    .mob Treasury Protector
step
    .isOnQuest 54169
    .goto 1348,28.23,82.44
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_控制开关|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_安全门|r
    .scenario 4022,1,1 -- Trap 1
    .mob 拜尔ful Guardian Spirit
step
    .isOnQuest 54169
    .goto 1348,33.23,82.44
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_控制开关|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_安全门|r
    .scenario 4022,1,2 -- Trap 2
    .mob 拜尔ful Guardian Spirit
step
    .isOnQuest 54169
    .goto 1348,37.38,79.57
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_控制开关|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_安全门|r
    .scenario 4022,1,3 -- Trap 3
step
    .isOnQuest 54169
    .goto 1348,41.97,81.01
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_安全门|r
    >>沿箭头前进
    .scenario 4022,1,4 -- End of the hall reached
step
    .isOnQuest 54169
    .goto 1348,41.23,74.68,10,0
    .goto 1348,41.19,68.22,10,0
    .goto 1348,42.06,61.09
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_安全门|r
    >>击杀 |cRXP_ENEMY_宝库守护者|r
    .scenario 4023,1 -- central chamber reached.
    .mob Treasury Protector
    .mob Mighty Guardian Spirit
    .mob Furious Guardian Spirit
step
    .isOnQuest 54169
    .goto 1348,42.09,77.44
    >>|cRXP_WARN_沿箭头前进|r
    .scenario 4024,1 -- Return to outer hallway
    .mob Treasury Protector
    .mob Mighty Guardian Spirit
    .mob Furious Guardian Spirit
step
    .isOnQuest 54169
    .goto 1348,42.24,85.52
    >>击杀 |cRXP_ENEMY_宝库哨兵|r
    .scenario 4046,1 -- Treasury Sentinel defeated.
    .mob Treasury Sentinel
step
    .isOnQuest 54169
    .goto 1348,46.5,82.3,15,0
    .goto 1348,50.43,82.44
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_控制开关|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_安全门|r
    .scenario 4048,1,1 -- Trap 1
    .mob 拜尔ful Guardian Spirit
step
    .isOnQuest 54169
    .goto 1348,55.55,82.43
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_控制开关|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_安全门|r
    .scenario 4048,1,2 -- Trap 2
step
    .isOnQuest 54169
    .goto 1348,59.59,82.48
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_控制开关|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_安全门|r
    .scenario 4048,1,3 -- Trap 3
step
    .isOnQuest 54169
    .goto 1348,60.94,78.15
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_控制开关|r
    >>击杀 |cRXP_ENEMY_灵魂|r
    .scenario 4051,1 -- Spirits
    .mob Furious Guardian Spirit
    .mob 拜尔ful Guardian Spirit
step
    .isOnQuest 54169
    .goto 1348,60.95,58.58
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_控制开关|r
    >>|cRXP_WARN_别被光束击中, 会一击必杀. 漩涡也危险但不会秒杀|r
    >>|cRXP_WARN_穿过迷雾, 尝试切换到俯视角使迷雾消失, 从而看清光束的位置|r
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_安全门|r
    .scenario 4052,1 -- Gauntlet
step
    .goto 1348,62.02,52.37
    .isOnQuest 54169
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_安全门|r
    .gossipoption 50747 >>对话 |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    .timer 45, Protect Shaw
    .target 马迪亚斯·肖尔
step
    .isOnQuest 54169
    .goto 1348,61.94,51.65
    >>击杀连续的敌人波次, 最后一波击杀 |cRXP_ENEMY_金库守卫|r
    .scenario 4055,1 -- Protect Shaw
    .mob Treasury Protector
    .mob 拜尔ful Guardian Spirit
    .mob Mighty Guardian Spirit
    .mob Treasury Defender
step
    .isOnQuest 54169
    .goto 1348,61.99,52.39
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    >>|cRXP_WARN_按 Esc 键跳过过场动画|r
    .skipgossip 1
    .scenario 4056,2 -- End
    .target 马迪亚斯·肖尔
step
    .goto 862,40.56,70.70
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 54169 >>交任务: |cRXP_FRIENDLY_劫掠珍宝间|r
    .accept 54510 >>接任务: |cRXP_WARN_恶作剧完成|r
step
    .isOnQuest 54510
    .goto 862,40.46,71.02
    .gossipoption 49161 >>与|cRXP_FRIENDLY_达莉亚|r交谈
    .target 达尔ia Smithson
step
    .goto 1161,69.24,26.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 54510,3 >>交任务: |cRXP_FRIENDLY_恶作剧完成|r
    .accept 54302 >>接任务: |cRXP_WARN_祖达萨沦陷|r
    .target Halford Wyrmbane
step
    .isOnQuest 54302
    .goto 1161,66.97,14.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔安·韦伯|r交谈
    .fly Proudmoore Keep >>飞往普罗德摩尔要塞
    .target Joan Weber
step
    .goto 1161,39.20,77.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    .complete 54302,1 --1/1 Speak with Mathias Shaw near Proudmoore Keep
    .skipgossip 1
    .target 马迪亚斯·肖尔
step
    .goto 1161,38.98,77.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 54302 >>交任务: |cRXP_FRIENDLY_祖达萨沦陷|r
    .target Halford Wyrmbane
step
    .goto 1161,38.97,76.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_刀锋大师泰拉蒙|r交谈
    .accept 54303 >>接任务: |cRXP_WARN_进军纳兹米尔|r
    .target Blademaster Telaamon
step
    .isOnQuest 54303
    .goto 1161,47.75,65.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杰西卡·克拉克|r交谈
    .fly Tradewinds Market >>飞往贸易风集市
    .target Jessica Clarke
step
    .isOnQuest 54303
    .goto 1161,67.95,26.71
    .gossipoption 48165 >>对话 |cRXP_FRIENDLY_杰塔瑞斯将军|r
    .target 杰塔瑞斯将军
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_吉安娜·普罗德摩尔女士|r 和 |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r 交谈
    .turnin 54303 >>交任务: |cRXP_FRIENDLY_进军纳兹米尔|r
    .accept 54310 >>接任务: |cRXP_WARN_肃清村庄|r
    .goto 863,31.03,29.49
    .accept 54404 >>接任务: |cRXP_WARN_黑铁钻探机|r
    .goto 863,30.96,29.45
    .target 吉安娜·普罗德摩尔
    .target 马迪亚斯·肖尔
step
    #completewith Mole Machine
    >>击杀 |cRXP_ENEMY_鲜血巨魔|r
    .complete 54310,1 --12/12 Defeat blood trolls within Zalamar
    .mob Warspawn Rider
    .mob Zalamar Warrior
    .mob Zalamar Bloodsinger
    .mob Obedient Drudge
step
    .goto 863,32.57,44.53
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_鼹鼠机器|r
    .complete 54404,1,1 --3/3 Mole machines signalled
step
    .goto 863,30.77,48.32
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_鼹鼠机器|r
    .complete 54404,1,2 --3/3 Mole machines signalled
step
    #label Mole Machine
    .goto 863,32.87,47.5
    >>|TInterface/cursor/crosshair/interact.blp:20|t点击 |cRXP_PICK_鼹鼠机器|r
    .complete 54404,1,3 --3/3 Mole machines signalled
step
#loop
	.line 863,33.89,48.39,34.27,47.04,32.24,46.33,32.06,44.15
	.goto 863,33.89,48.39,15,0
	.goto 863,34.27,47.04,15,0
	.goto 863,32.24,46.33,15,0
	.goto 863,32.06,44.15,15,0
    >>击杀 |cRXP_ENEMY_鲜血巨魔|r
    .complete 54310,1 --12/12 Defeat blood trolls within Zalamar
    .mob Warspawn Rider
    .mob Zalamar Warrior
    .mob Zalamar Bloodsinger
    .mob Obedient Drudge
step
    .goto 863,33.36,45.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_刀锋大师泰拉蒙|r交谈
    .turnin 54310 >>交任务: |cRXP_FRIENDLY_肃清村庄|r
    .turnin 54404 >>交任务: |cRXP_FRIENDLY_黑铁钻探机|r
    .accept 54312 >>接任务: |cRXP_WARN_战场迷雾|r
    .target Blademaster Telaamon
step
    .isOnQuest 54312
    .goto 863,33.15,46.22,5,0
    .goto 863,33.67,47.71
    .gossipoption 50606 >>与|cRXP_FRIENDLY_兄弟派克|r交谈
    .target 布罗特her Pike
    .timer 13, Brother Pike RP
step
    >>|cRXP_WARN_等待短暂剧情, 计时器归零后自动完成|r
    .complete 54312,1 --1/1 Have Brother Pike use the Abyssal Scepter
step
    .goto 863,33.65,47.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 54312 >>交任务: |cRXP_FRIENDLY_战场迷雾|r
    .accept 54407 >>接任务: |cRXP_WARN_沼泽潜行|r
    .target 吉安娜·普罗德摩尔
step
    .goto 863,35.77,68.25
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 54407 >>交任务: |cRXP_FRIENDLY_沼泽潜行|r
    .accept 54412 >>接任务: |cRXP_WARN_水淹祖尔加|r
    .target 吉安娜·普罗德摩尔
step
    .goto 863,35.77,68.08
    >>与 |cRXP_FRIENDLY_杰娜的水元素|r 互动
    .complete 54412,1 --1/1 Command Jaina's Water Elemental
    .timer 44, Water Elemental RP
step
    .goto 863,39.66,76.92,10,0
    .goto 863,40.22,77.33,10,0
    .goto 863,41.13,77.61,10,0
    .goto 863,41.5,78.65
    >>使用 |T132298:0|t(1)对前方敌人造成伤害
    >>使用 |T893777:0|t(2)对周围敌人造成伤害
    >>使用 |T512902:0|t(3)对指定区域造成伤害
    >>|cRXP_WARN_持续使用 |T132298:0|t(1) 和 |T893777:0|t(2), 保持 |T512902:0|t(3) 冷却循环|r
    .complete 54412,2 --50/50 Enemies slain in Zul'jan ruins
    .timer 10, ELemental RP
step
    .goto 863,44.24,78.87
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .turnin 54412 >>交任务: |cRXP_FRIENDLY_水淹祖尔加|r
    .accept 54417 >>接任务: |cRXP_WARN_展现实力|r
    .target 吉安娜·普罗德摩尔
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r 和 |cRXP_FRIENDLY_刀锋大师特拉莫恩|r 交谈
    .accept 54421 >>接任务: |cRXP_WARN_驯服敌人的野兽|r
    .goto 863,44.2,78.62
    .accept 54418 >>接任务: |cRXP_WARN_死亡机械|r
    .goto 863,44.28,78.55
    .target 马迪亚斯·肖尔
    .target Blademaster Telaamon
step
    #completewith beast
    >>击杀 |cRXP_ENEMY_赞达拉|r
    .complete 54417,1 --12/12 Zandalari slain
    .mob Zandalari Witch Doctor
    .mob Zandalari Prelate
step
    .goto 863,45.38,72.51
    >>击杀 |cRXP_ENEMY_A.M.O.D.|r
    .complete 54418,1 --1/1 A.M.O.D. slain
    .mob A.M.O.D.
    .mob 沙砾
step
    .goto 863,46.64,76.31
    >>与 |cRXP_ENEMY_休息的战斗兽|r 互动
    .complete 54421,1,1 --3/3 Resting Battlebeast tamed
    .mob Resting Battlebeast
step
    .goto 863,48.85,76.49
    >>与 |cRXP_ENEMY_休息的战斗兽|r 互动
    .complete 54421,1,2 --3/3 Resting Battlebeast tamed
    .mob Resting Battlebeast
step
    #label beast
    .goto 863,47.31,79.84
    >>与 |cRXP_ENEMY_休息的战斗兽|r 互动
    .complete 54421,1,3 --3/3 Resting Battlebeast tamed
    .mob Resting Battlebeast
step
#loop
	.line 863,48.76,79.98,48.79,76.91,46.79,76.32,45.97,78.32
	.goto 863,48.76,79.98,20,0
	.goto 863,48.79,76.91,20,0
	.goto 863,46.79,76.32,20,0
	.goto 863,45.97,78.32,20,0
    >>击杀 |cRXP_ENEMY_赞达拉|r
    .complete 54417,1 --12/12 Zandalari slain
    .mob Zandalari Witch Doctor
    .mob Zandalari Prelate
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_剑圣特拉蒙|r\|cRXP_FRIENDLY_马修斯·肖大师|r 和 |cRXP_FRIENDLY_吉安娜·普罗德摩尔|r 交谈
    .turnin 54418 >>交任务: |cRXP_FRIENDLY_死亡机械|r
    .goto 863,50.37,84.17
    .turnin 54421 >>交任务: |cRXP_FRIENDLY_驯服敌人的野兽|r
    .goto 863,50.43,84.09
    .turnin 54417 >>交任务: |cRXP_FRIENDLY_展现实力|r
    .accept 54441 >>接任务: |cRXP_WARN_拿下鲜血关口|r
    .goto 863,50.45,84.24
    .target Blademaster Telaamon
    .target 吉安娜·普罗德摩尔
    .target 马迪亚斯·肖尔
step
    .goto 863,50.43,84.82
    >>与 |cRXP_FRIENDLY_受控野兽|r 互动
    .complete 54441,1 --1/1 Ride controlled battlebeast
step
    .goto 862,57.76,20.42
    >>在指定区域内冷却好后使用 (1) |T132226:0|t, 配合 (2) |T252174:0|t 对敌人造成雷击
    .complete 54441,2 --Blood Gates cleared (100%)
step
    .exitvehicle >>|cRXP_WARN_按动作条上的 [退出] 按钮解除骑乘 |cRXP_FRIENDLY_受控野兽|r|r
    *|cRXP_WARN_或者, 可以使用这个宏;|r
    .link /leavevehicle>>点击此处获取宏命令
    *|cRXP_WARN_建议保存此宏以备后用|r
step
    .goto 863,50.45,84.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    .turnin 54441 >>交任务: |cRXP_FRIENDLY_拿下鲜血关口|r
    .target 马迪亚斯·肖尔
step
    .goto 863,50.37,84.18
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 [吉安娜·普罗德摩尔] 交谈
    .accept 54459 >>接任务: |cRXP_WARN_与圣光同行之人|r
    .target 吉安娜·普罗德摩尔
step
    .isOnQuest 54459
    .goto 863,50.38,84.08
    .zone Boralus >>点击 |cRXP_PICK_博拉勒斯|r
step
    .goto 1161,69.27,27.03
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哈福德·屠龙者|r交谈
    .turnin 54459 >>交任务: |cRXP_FRIENDLY_与圣光同行之人|r
    .target Halford Wyrmbane
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#group权重 4
#name 01) 艾泽拉斯之心
#displayname 第 1 章 - 艾泽拉斯之心
#next 02) 战役: 提拉加德据点
<< Horde
step
    .goto 1165,50.38,41.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_土灵守护者|r
    .accept 53028 >>接任务: |cRXP_WARN_垂死的世界|r
    .target 土灵守护者
step
    .isOnQuest 53028
    #completewith next
    .zone 81 >>通过传送门前往希利苏斯
step
    .goto 81,42.22,44.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_麦格尼·铜须|r
    .turnin 53028 >>交任务: |cRXP_FRIENDLY_垂死的世界|r
    .accept 51211 >>接任务: |cRXP_WARN_艾泽拉斯之心|r
    .target 麦格尼·铜须
step
    >>点击 |cRXP_PICK_泰坦传送器|r
    .goto 81,43.16,44.51
    .complete 51211,1 --1/1 Use device in Silithus  to travel to Chamber of the Heart
step
    .goto 1021,50.17,53.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_麦格尼·铜须|r 交谈. 按 ESC 跳过过场动画
    .complete 51211,3 --1/1 Speak to Magni within the Chamber of Heart
    .skipgossip 136907,1
    .target 麦格尼·铜须
step
    .goto 1021,50.17,53.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_麦格尼·铜须|r
    .turnin 51211 >>交任务: |cRXP_FRIENDLY_艾泽拉斯之心|r
    .target 麦格尼·铜须
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 02) 战役: 提拉加德据点
#displayname 第 2 章 - 提拉加德据点
#next 03) 战役: 德鲁斯瓦据点
<< Horde
step
    .zoneskip 1021,1
    .goto 1021,50.02,30.69
    .zone 81 >>使用泰坦传送装置
step
    .zoneskip 81,1
    .goto 81,41.61,45.20
    .zone 1163 >>通过传送门前往祖达萨
step
    .goto 1164,40.28,71.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与大印内的 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 交谈
    .accept 52749 >>接任务: |cRXP_WARN_阵营战役|r
    .target 纳萨诺斯·凋零者
step
    .isOnQuest 52749
    #completewith next
    .goto 1165,49.91,41.48,18 >>离开大封印
step
    .noflyable 862
    .isOnQuest 52749
    #completewith next
    .goto 1165,51.92,41.22
    .fly Port of Zandalar >>飞往赞达拉港口
step
    .noflyable 862
    .isOnQuest 52749
    #completewith next
    .goto 1165,52.42,84.91
    .home >>将炉石设为灵魂与你同在
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在船上对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .groundgoto 1165,50.26,99.98,10,0
    .goto 862,58.44,62.67
    .turnin 52749 >>交任务: |cRXP_FRIENDLY_阵营战役|r
    .target 纳萨诺斯·凋零者
step
    .isQuestAvailable 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .accept 51803 >>接任务: |cRXP_WARN_库尔提拉斯战役|r
    .target 纳萨诺斯·凋零者
step
    .isQuestAvailable 51801 
    .isQuestTurnedIn 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .accept 51979 >>接任务: |cRXP_WARN_继续作战|r
    .target 纳萨诺斯·凋零者
step
    .isQuestAvailable 51801 
    .isQuestTurnedIn 51979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .accept 52444 >>接任务: |cRXP_WARN_最后的据点|r
    .target 纳萨诺斯·凋零者
step
    >>与库尔提拉斯战役桌互动 |cRXP_WARN_并选择提拉加德海峡|r, 点击小地图下方弹出提示提交任务
    >>|cRXP_WARN_如果不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51800 >>接任务: |cRXP_WARN_据点：提拉加德海峡|r
    .turnin 51800 >>交任务: |cRXP_FRIENDLY_据点：提拉加德海峡|r
    .complete 51803,2 --1/1 Choose a foothold
    .goto 862,58.44,62.62
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 51803 >>交任务: |cRXP_FRIENDLY_库尔提拉斯战役|r
    .accept 51421 >>接任务: |cRXP_WARN_坐船前行|r
    .target 纳萨诺斯·凋零者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔特赛尔|r交谈
    .complete 51421,1 --1/1 Speak with Tattersail to sail to Tiragarde Sound
    .goto 862,58.46,62.99
    .skipgossip
    .target Dread-Admiral Tattersail
step
    .goto 895,89.33,53.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_影猎人Ty'jin|r
    .turnin 51421 >>交任务: |cRXP_FRIENDLY_坐船前行|r
    .accept 51435 >>接任务: |cRXP_WARN_另类海盗|r
    .target 暗影猎手塔金
step
    .goto 895,89.46,53.67
    >>拾取地面上的 |cRXP_PICK_海盗服饰|r
    .complete 51435,1 --1/1 Pirate Garb acquired
step
    .goto 895,89.33,53.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_影猎人Ty'jin|r
    .turnin 51435 >>交任务: |cRXP_FRIENDLY_另类海盗|r
    .accept 51436 >>接任务: |cRXP_WARN_与海盗打交道|r
    .target 暗影猎手塔金
step
    #completewith next
    .goto 895,89.33,53.36
    .vehicle >>点击地面上的 |cRXP_PICK_绳索|r
    .timer 14,Parleyin' Wit Pirates RP
step
    .goto 895,88.22,51.17
    >>等待剧情演出结束
    .complete 51436,1 --1/1 Use the Mala's Fortune Rope
step
    .goto 895,88.21,51.11,-1
    .goto 895,87.31,49.99,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_暗影猎手提金|r 交谈, 跟随他
    .complete 51436,2 --1/1 Walk with Ty'jin
    .skipgossip
    .timer 65, Ty'jin Walk RP
    .target 暗影猎手塔金
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大副奥因斯|r 和 |cRXP_FRIENDLY_暗影猎人泰金|r 交谈
    .turnin 51436 >>交任务: |cRXP_FRIENDLY_与海盗打交道|r
    .accept 51437 >>接任务: |cRXP_WARN_混合烈酒|r
    .goto 895,87.31,49.99
    .accept 51439 >>接任务: |cRXP_WARN_收集炮弹|r
    .goto 895,87.28,50.01
    .target First Mate Owings
    .target 暗影猎手塔金
step
    #completewith KegGrog
    >>击杀 |cRXP_ENEMY_雾帆炮手|r, 拾取其 |cRXP_LOOT_炮弹|r
    .complete 51439,1 --3/3 Fogsail Cannonball
    .mob Fogsail Cannoneer
step
    #title Keg spiked 1/6
    .goto 895,87.20,50.36
    >>点击 |cRXP_PICK_格罗格酒桶|r 下毒
    .complete 51437,1,1 --1/6 Keg of Grog spiked
step
    #title Keg spiked 2/6
    .goto 895,87.53,50.96
    >>点击 |cRXP_PICK_格罗格酒桶|r 下毒
    .complete 51437,1,2 --2/6 Keg of Grog spiked
step
    #title Keg spiked 3/6
    .goto 895,87.73,51.59
    >>点击 |cRXP_PICK_格罗格酒桶|r 下毒
    .complete 51437,1,3 --3/6 Keg of Grog spiked
step
    #title Keg spiked 4/6
    .goto 895,87.82,50.92
    >>点击 |cRXP_PICK_格罗格酒桶|r 下毒
    .complete 51437,1,4 --4/6 Keg of Grog spiked
step
    #title Keg spiked 5/6
    .goto 895,88.01,50.76
    >>点击 |cRXP_PICK_格罗格酒桶|r 下毒
    .complete 51437,1,5 --5/6 Keg of Grog spiked
step
    #label KegGrog
    #title Keg spiked 6/6
    .goto 895,88.27,50.74
    >>点击 |cRXP_PICK_格罗格酒桶|r 下毒
    .complete 51437,1 --6/6 Keg of Grog spiked
step
    .goto 895,88.51,49.46,26,0
    .goto 895,87.16,49.58,26,0
    .goto 895,87.47,50.84,26,0
    .goto 895,87.76,50.49,26,0
    .goto 895,87.11,51.90,26,0
    .goto 895,87.30,52.93,26,0
#loop
	.line 895,88.51,49.46,87.16,49.58,87.47,50.84,87.76,50.49,87.11,51.90,87.30,52.93,
	.goto 895,88.51,49.46,25,0
	.goto 895,87.16,49.58,25,0
	.goto 895,87.47,50.84,25,0
	.goto 895,87.76,50.49,25,0
	.goto 895,87.11,51.90,25,0
	.goto 895,87.30,52.93,25,0
    >>击杀 |cRXP_ENEMY_雾帆炮手|r, 拾取其 |cRXP_LOOT_炮弹|r
    .complete 51439,1 --3/3 Fogsail Cannonball
    .mob Fogsail Cannoneer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_暗影猎人泰金|r 和 |cRXP_FRIENDLY_大副奥因斯|r 交谈
    .turnin 51439 >>交任务: |cRXP_FRIENDLY_收集炮弹|r
    .goto 895,87.28,50.01
    .turnin 51437 >>交任务: |cRXP_FRIENDLY_混合烈酒|r
    .accept 51440 >>接任务: |cRXP_WARN_改变方向|r
    .goto 895,87.31,49.99
    .accept 51441 >>接任务: |cRXP_WARN_轰炸信号|r
    .goto 895,87.28,50.01
    .target 暗影猎手塔金
    .target First Mate Owings
step
    #sticky
    #label FogRowboat
    >>对水中的船只使用 |T252185:0|t[地精制造的手炮]
    .complete 51441,1,2 --3/3 Fogsail Rowboat sunk
    .use 160405
step
    .goto 895,87.47,49.98,10,0
    .goto 895,87.43,49.73,20,0
    .goto 895,87.29,49.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_领航员斯温克|r交谈.等待他的剧情结束,然后击杀他
    .complete 51440,3 --1/1 Navigator Swink ordered
    .skipgossip
    .timer 13,Swink RP
    .mob 领航员 Swink
step
    #requires FogRowboat
    #completewith KillianMbappe
    >>对水中的船只使用 |T252185:0|t[地精制造的手炮]
    .complete 51441,1 --3/3 Fogsail Rowboat sunk
    .use 160405
step
    #requires FogRowboat
    .goto 895,87.83,50.41,8,0
    .goto 895,87.85,50.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_舵手塔琳|r交谈.等待她的剧情结束,然后击杀她
    .complete 51440,1 --1/1 Boatswain Taryn ordered
    .skipgossip
    .mob Boatswain Taryn
step
    #label KillianMbappe
    .goto 895,87.00,52.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官基利安|r交谈
    .complete 51440,2 --1/1 Quartermaster Killian ordered
    .skipgossip
    .target Quartermaster Killian
step
    .goto 895,87.21,49.25
    >>对水中的船只使用 |T252185:0|t[地精制造的手炮]
    .complete 51441,1 --3/3 Fogsail Rowboat sunk
    .use 160405
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_暗影猎人泰金|r 和 |cRXP_FRIENDLY_大副奥因斯|r 交谈
    .turnin 51441 >>交任务: |cRXP_FRIENDLY_轰炸信号|r
    .goto 895,87.28,50.01
    .turnin 51440 >>交任务: |cRXP_FRIENDLY_改变方向|r
    .accept 51442 >>接任务: |cRXP_WARN_现在我是船长了|r
    .goto 895,87.31,49.99
    .target 暗影猎手塔金
    .target First Mate Owings
step
    .goto 895,86.92,53.16
    >>击杀洞穴内的 |cRXP_ENEMY_雷尼克|r
    .complete 51442,1 --1/1 Captain Rhenik slain
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_大副奥因斯|r 和 |cRXP_FRIENDLY_暗影猎人泰金|r 交谈
    >>与欧文斯和泰金交谈
    .turnin 51442 >>交任务: |cRXP_FRIENDLY_现在我是船长了|r
    .goto 895,87.31,49.99
    .accept 51438 >>接任务: |cRXP_WARN_标记领地|r
    .goto 895,87.28,50.01
    .target First Mate Owings
    .target 暗影猎手塔金
step
    .goto 895,87.47,50.41
    >>点击 |cRXP_PICK_旗帜|r 放置. 按 ESC 跳过过场动画
    .complete 51438,1 --1/1 Horde Banner planted
step
    .goto 895,87.28,50.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_影猎人Ty'jin|r
    .turnin 51438 >>交任务: |cRXP_FRIENDLY_标记领地|r
    .turnin 51975 >>交任务: |cRXP_FRIENDLY_勇士：暗影猎手塔金|r
    .accept 51984 >>接任务: |cRXP_WARN_回到祖达萨|r
    .target 暗影猎手塔金
step
    .goto 895,87.84,51.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t出去, 与 |cRXP_FRIENDLY_埃鲁尔·黎明溪|r 交谈
    .complete 51984,1 --Speak to Erul Dawnbrook
    .skipgossip
    .target Erul Dawnbrook
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 51984 >>交任务: |cRXP_FRIENDLY_回到祖达萨|r
    .target 纳萨诺斯·凋零者
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 03) 战役: 德鲁斯瓦据点
#displayname 第 3 章 - 德鲁斯瓦据点
#next 04) 战役: 岛屿远征
<< Horde
step
    .isQuestAvailable 51801 
    .isQuestAvailable 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .accept 51803 >>接任务: |cRXP_WARN_库尔提拉斯战役|r
    .target 纳萨诺斯·凋零者
step
    .isQuestAvailable 51801 
    .isQuestTurnedIn 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .accept 51979 >>接任务: |cRXP_WARN_继续作战|r
    .target 纳萨诺斯·凋零者
step
    .isQuestAvailable 51801 
    .isQuestTurnedIn 51979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .accept 52444 >>接任务: |cRXP_WARN_最后的据点|r
    .target 纳萨诺斯·凋零者
step
    .isQuestAvailable 51801 
    .isOnQuest 51979
    >>与库尔提拉斯战役桌互动 |cRXP_WARN_并选择德鲁斯特瓦尔|r, 点击小地图下方弹出提示提交任务
    >>|cRXP_WARN_如果不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51801 >>接任务: |cRXP_WARN_据点：德鲁斯瓦|r
    .turnin 51801 >>交任务: |cRXP_FRIENDLY_据点：德鲁斯瓦|r
    .complete 51979,1 --1/1 Choose a foothold
    .goto 862,58.44,62.62
step
    .isQuestAvailable 51801 
    .isOnQuest 51803
    >>与库尔提拉斯战役桌互动 |cRXP_WARN_并选择德鲁斯特瓦尔|r, 点击小地图下方弹出提示提交任务
    >>|cRXP_WARN_如果不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51801 >>接任务: |cRXP_WARN_据点：德鲁斯瓦|r
    .turnin 51801 >>交任务: |cRXP_FRIENDLY_据点：德鲁斯瓦|r
    .complete 51803,2 --1/1 Choose a foothold
    .goto 862,58.44,62.62
step
    .isQuestAvailable 51801 
    .isOnQuest 52444
    >>与库尔提拉斯战役桌互动 |cRXP_WARN_并选择德鲁斯特瓦尔|r, 点击小地图下方弹出提示提交任务
    >>|cRXP_WARN_如果不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51801 >>接任务: |cRXP_WARN_据点：德鲁斯瓦|r
    .turnin 51801 >>交任务: |cRXP_FRIENDLY_据点：德鲁斯瓦|r
    .complete 52444,1 --1/1 Choose a foothold
    .goto 862,58.44,62.62
step
    .isOnQuest 52444
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .turnin 52444 >>交任务: |cRXP_FRIENDLY_最后的据点|r
    .accept 51332 >>接任务: |cRXP_WARN_跨越大洋的旅途|r
    .target 纳萨诺斯·凋零者
step
    .isOnQuest 51979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .turnin 51979 >>交任务: |cRXP_FRIENDLY_继续作战|r
    .accept 51332 >>接任务: |cRXP_WARN_跨越大洋的旅途|r
    .target 纳萨诺斯·凋零者
step
    .isOnQuest 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .turnin 51803 >>交任务: |cRXP_FRIENDLY_库尔提拉斯战役|r
    .accept 51332 >>接任务: |cRXP_WARN_跨越大洋的旅途|r
    .target 纳萨诺斯·凋零者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入船舱. 对话 |cRXP_FRIENDLY_贸易大王加里维克斯|r
    .goto 862,58.50,62.36,8,0
    .goto 862,58.45,62.64
    .turnin 51332 >>交任务: |cRXP_FRIENDLY_跨越大洋的旅途|r
    .accept 51340 >>接任务: |cRXP_WARN_德鲁斯瓦呀！|r
    .target 贸易大王加里维克斯
step
    #completewith next
    .goto 862,58.39,62.26,10,0
    .goto 862,58.55,62.72
    .gossipoption 49250 >>上楼, 与 |cRXP_FRIENDLY_伊崔格|r 交谈
step
    .goto 862,58.55,62.72
    .skipgossip 2
    .complete 51340,1 --1/1 Speak with Eitrigg
    .target 伊崔格
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔特赛尔|r交谈
    .complete 51340,2 --1/1 Speak with Tattersail to sail to 德鲁斯瓦
    .goto 862,58.46,62.99
    .skipgossip 1
    .target Dread-Admiral Tattersail
step
    #completewith ZandalariTrollProfitandReconnaissanceA
    .noflyable 896
    .goto 896,19.14,43.31
    .fp >>获取 [Anyport] 飞行点
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_伊崔格|r
    .goto 896,20.78,43.85
    .turnin 51340 >>交任务: |cRXP_FRIENDLY_德鲁斯瓦呀！|r
    .accept 51224 >>接任务: |cRXP_WARN_利益与勘察|r
    .target 伊崔格
step
    .isOnQuest 51224
    .vehicle 137090 >>骑上 |cRXP_FRIENDLY_加里维克斯的战争三轮车|r
    .goto 896,20.73,43.75
    .target Gallywix's War Trike
step
    #label ZandalariTrollProfitandReconnaissanceA
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赞达拉矿工|r交谈.等待剧情发展
    .goto 896,21.09,44.85,10,0
    .goto 896,20.37,47.28,15,0
    .goto 896,22.28,46.32
    .complete 51224,1 --1/1 Board Gallywix's trike and search for a goblin scout
    .target Bilgewater Azerite Drudge
step
    .isOnQuest 51224
    .vehicle 137090 >>骑上 |cRXP_FRIENDLY_加里维克斯的战争三轮车|r
    .goto 896,22.28,46.32
    .target Gallywix's War Trike
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赞达拉矿工|r交谈.等待剧情发展
    .goto 896,25.47,46.31
    .complete 51224,2 --1/1 Search deeper into the woods
    .target Bilgewater Azerite Drudge
step
    .isOnQuest 51224
    .vehicle 137090 >>骑上 |cRXP_FRIENDLY_加里维克斯的战争三轮车|r
    .goto 896,25.47,46.31
    .target Gallywix's War Trike
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_赞达拉矿工|r交谈.等待剧情发展
    .goto 896,29.52,54.84
    .complete 51224,3 --1/1 Find another goblin scout
    .target Bilgewater Azerite Drudge
step
    .isOnQuest 51224
    .vehicle 137090 >>骑上 |cRXP_FRIENDLY_加里维克斯的战争三轮车|r
    .goto 896,29.52,54.84
    .target Gallywix's War Trike
step
    >>跟随箭头前往航点位置
    .goto 896,32.09,54.48
    .complete 51224,4 --1/1 Find the final goblin scout
step
    .goto 896,32.32,54.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 对话 |cRXP_FRIENDLY_伊崔格|r
    .turnin 51224 >>交任务: |cRXP_FRIENDLY_利益与勘察|r
    .accept 51231 >>接任务: |cRXP_WARN_巫术恐惧症|r
    .target 伊崔格
step
    >>击杀正在出现的 |cRXP_ENEMY_女巫|r 和 |cRXP_ENEMY_红天姐妹|r
    .goto 896,32.32,54.57
    .complete 51231,1 --1/1 Protect Eitrigg and Gallywix
    .mob Sister Readweather
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊崔格|r 和 |cRXP_FRIENDLY_贸易大王加里维克斯|r 交谈
    .turnin 51231 >>交任务: |cRXP_FRIENDLY_巫术恐惧症|r
    .goto 896,32.32,54.57
    .accept 51233 >>接任务: |cRXP_WARN_我希望山上没有女巫|r
    .goto 896,32.35,54.59
    .target 伊崔格
    .target 贸易大王加里维克斯
step
    .isOnQuest 51233
    .vehicle 137090 >>骑上 |cRXP_FRIENDLY_加里维克斯的战争三轮车|r
    .goto 896,32.33,54.73
    .target Gallywix's War Trike
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_霍巴特·钩锤|r
    .goto 896,28.93,46.48,15,0
    .goto 896,28.21,44.45,15,0
    .goto 896,33.58,37.87
    .skipgossip
    .complete 51233,1 --1/1 Drive Eitrigg and Gallywix to the mountains
    .target 霍巴特·钩锤
step
    >>跟随箭头登上山顶
    .goto 896,37.22,34.78,30,0
    .goto 896,37.68,31.08,30,0
    .goto 896,37.31,27.86
    .complete 51233,2 --1/1 Bring Eitrigg and Gallywix to Krazzlefrazz Outpost
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待剧情结束, 与 |cRXP_FRIENDLY_伊崔格|r 和 |cRXP_FRIENDLY_霍巴特·钩锤|r 交谈
    .turnin 51233 >>交任务: |cRXP_FRIENDLY_我希望山上没有女巫|r
    .goto 896,37.23,27.19
    .accept 51234 >>接任务: |cRXP_WARN_卡兹弗拉兹岗哨|r
    .goto 896,36.90,27.11
    .target 伊崔格
    .target 霍巴特·钩锤
step
    >>拾取 |cRXP_PICK_凯安特激光放大器|r, 使用 [额外行动按钮]
    .goto 896,36.80,26.37
    .complete 51234,1 --1/1 Supply Hut constructed
step
    >>点击 |cRXP_PICK_爆炸按钮|r
    .goto 896,36.74,25.13
    .complete 51234,2 --1/1 Engineering Works constructed
step
    >>点击 |cRXP_PICK_起爆器|r
    .goto 896,37.75,24.62
    .complete 51234,3 --1/1 Fishing Hut constructed
step
    >>点击 |cRXP_PICK_虫洞|r, 击杀 |cRXP_ENEMY_跨维度憎恶|r, 然后再次点击 |cRXP_PICK_虫洞|r
    .goto 896,37.62,25.50
    .complete 51234,4 --1/1 Inn constructed
    .skipgossip
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贸易大王加里维克斯|r 和 |cRXP_FRIENDLY_霍巴特·钩锤|r 交谈
    >>可按 ESC 跳过接下来的过场动画
    .turnin 51234 >>交任务: |cRXP_FRIENDLY_卡兹弗拉兹岗哨|r
    .goto 896,37.18,27.20
    .turnin 51987 >>交任务: |cRXP_FRIENDLY_勇士：霍巴特·钩锤|r
    .goto 896,36.90,27.11
    .accept 51985 >>接任务: |cRXP_WARN_回到祖达萨|r
    .goto 896,37.18,27.19
    .target 贸易大王加里维克斯
    .target 霍巴特·钩锤
step
    #completewith next
    .isOnQuest 51985
    .noflyable 896
    .goto 896,37.38,24.03
    .fp >>获取 [Krazzlefrazz前哨] 飞行点
    .fly Anyport >>飞往任意港口
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旋鳍者|r交谈
    .goto 896,20.60,43.34
    .skipgossip
    .complete 51985,1 --Speak to Swellthrasher in Anyport
    .target Swellthrasher
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 51985 >>交任务: |cRXP_FRIENDLY_回到祖达萨|r
    .target 纳萨诺斯·凋零者
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 04) 战役: 岛屿远征
#displayname 第 4 章 - 海岛探险
#next 05) 战役: 风暴之歌山谷据点
<< Horde
step
    .isQuestAvailable 51994
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .accept 51870 >>接任务: |cRXP_WARN_海岛探险|r
    .target 纳萨诺斯·凋零者
step
    .isQuestAvailable 51994
    .goto 1165,44.48,95.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷佐昆队长|r交谈
    .turnin 51870 >>交任务: |cRXP_FRIENDLY_海岛探险|r
    .accept 51888 >>接任务: |cRXP_WARN_海岛探险|r
    .target Captain Rez'okun
step
    .isQuestAvailable 51994
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷佐昆队长|r交谈
    .goto 1165,44.48,95.46
    .complete 51888,1 --1/1 Speak with Captain Rez'okun
    .skipgossip 123000,1
    .target Captain Rez'okun
step
    .isOnQuest 51888
    #sticky
    #label ZandalariTrollIslandExpedition
    >>完成岛屿远征场景
    .complete 51888,2 --1/1 Explore the Uncharted Island
step
    .isOnQuest 51888
    >>跟随箭头前往航点位置
    .goto 1022,79.23,63.90
    .scenario 3838,1 --1/1 Investigate the Azerite
step
    .isOnQuest 51888
    #title Crystal mined 1/3
    >>挖掘 |cRXP_PICK_艾泽里特水晶|r
    .goto 1022,79.23,63.90
    .scenario 3839,1,1 --1/3 Mine Azerite Crystals
step
    .isOnQuest 51888
    #title Crystal mined 2/3
    >>挖掘 |cRXP_PICK_艾泽里特水晶|r
    .goto 1022,75.50,55.76
    .scenario 3839,1,2 --2/3 Mine Azerite Crystals
step
    .isOnQuest 51888
    #title Crystal mined 3/3
    >>挖掘 |cRXP_PICK_艾泽里特水晶|r
    .goto 1022,77.46,50.15
    .scenario 3839,1 --3/3 Mine Azerite Crystals
step
    .isOnQuest 51888
    >>跟随箭头前往航点位置
    .goto 1022,62.41,26.06
    .scenario 3840,1 --1/1 Investigate the second source of Azerite
step
    .isOnQuest 51888
    >>击杀 |cRXP_ENEMY_结壳王蟹|r
    .goto 1022,62.41,26.06
    .scenario 3841,1 --1/1 Kil the Encrusted Kingscuttler
    .target Encrusted Kingscuttler
step
    .isOnQuest 51888
    >>跟随箭头前往航点位置
    .goto 1022,43.77,47.77
    .scenario 3842,1 --1/1 Investigate the third source of Azerite
step
    .isOnQuest 51888
    >>击杀 |cRXP_ENEMY_阿卡卡库|r 或拾取 |cRXP_PICK_艾泽里特袋|r
    .goto 1022,29.49,58.76,15,0
    .goto 1022,36.36,68.65,15,0
    .goto 1022,40.33,52.26,15,0
    .goto 1022,29.49,58.76
    .scenario 3843,1 --500/500 Take the Azerite from the Kunzen hozen tribe.
    .mob Akakakoo
    .mob Kunzen Hozen
    .mob 昆森猎手
    .mob Kunzen Leafeater
step
    .isOnQuest 51888
    >>跑回船上, 可按 ESC 跳过过场动画
    .goto 1022,77.39,73.61
    .scenario 3844,1 --1/1 Escape from Uncharted Isle before the Horde arrive.
step
    .isQuestAvailable 51994
    .isOnQuest 51888
    #requires ZandalariTrollIslandExpedition
    .goto 1165,44.48,95.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷佐昆队长|r交谈
    .turnin 51888 >>交任务: |cRXP_FRIENDLY_海岛探险|r
    .target Captain Rez'okun
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 05) 战役: 风暴之歌山谷据点
#displayname 第 5 章 - 斯托颂谷地据点
#next 06) 战役: 统一赞达拉
<< Horde
step
    .isQuestAvailable 51802 
    .isQuestAvailable 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .accept 51803 >>接任务: |cRXP_WARN_库尔提拉斯战役|r
    .target 纳萨诺斯·凋零者
step
    .isQuestAvailable 51802 
    .isQuestTurnedIn 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .accept 51979 >>接任务: |cRXP_WARN_继续作战|r
    .target 纳萨诺斯·凋零者
step
    .isQuestAvailable 51802 
    .isQuestTurnedIn 51979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .accept 52444 >>接任务: |cRXP_WARN_最后的据点|r
    .target 纳萨诺斯·凋零者
step
    .isQuestAvailable 51802 
    .isOnQuest 52444
    >>与库尔提拉斯战役桌互动 |cRXP_WARN_并选择风暴之歌谷|r, 点击小地图下方弹出提示提交任务
    .accept 51802 >>接任务: |cRXP_WARN_据点：斯托颂谷地|r
    .turnin 51802 >>交任务: |cRXP_FRIENDLY_据点：斯托颂谷地|r
    .complete 52444,1 --1/1 Review final foothold
    .goto 862,58.44,62.62
    .turnin 51979 >>交任务: |cRXP_FRIENDLY_最后的据点|r
    .goto 862,58.44,62.67
step
    .isQuestAvailable 51802 
    .isOnQuest 51979
    >>与库尔提拉斯战役桌互动 |cRXP_WARN_并选择风暴之歌谷|r, 点击小地图下方弹出提示提交任务
    .accept 51802 >>接任务: |cRXP_WARN_据点：斯托颂谷地|r
    .turnin 51802 >>交任务: |cRXP_FRIENDLY_据点：斯托颂谷地|r
    .complete 51979,1 --1/1 Choose a foothold
    .goto 862,58.44,62.62
    .turnin 51979 >>交任务: |cRXP_FRIENDLY_继续作战|r
    .goto 862,58.44,62.67
step
    .isQuestAvailable 51802 
    .isOnQuest 51803
    >>与库尔提拉斯战役桌互动 |cRXP_WARN_并选择风暴之歌谷|r, 点击小地图下方弹出提示提交任务
    .accept 51802 >>接任务: |cRXP_WARN_据点：斯托颂谷地|r
    .turnin 51802 >>交任务: |cRXP_FRIENDLY_据点：斯托颂谷地|r
    .complete 51803,2 --1/1 Choose a foothold
    .goto 862,58.44,62.62
    .turnin 51803 >>交任务: |cRXP_FRIENDLY_库尔提拉斯战役|r
    .goto 862,58.44,62.67
step
    .isOnQuest 52444
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .turnin 52444 >>交任务: |cRXP_FRIENDLY_最后的据点|r
    .accept 51526 >>接任务: |cRXP_WARN_督军的召唤|r
    .target 纳萨诺斯·凋零者
step
    .isOnQuest 51979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .turnin 51979 >>交任务: |cRXP_FRIENDLY_继续作战|r
    .accept 51526 >>接任务: |cRXP_WARN_督军的召唤|r
    .target 纳萨诺斯·凋零者
step
    .isOnQuest 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .turnin 51803 >>交任务: |cRXP_FRIENDLY_库尔提拉斯战役|r
    .accept 51526 >>接任务: |cRXP_WARN_督军的召唤|r
    .target 纳萨诺斯·凋零者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_高阶督军克鲁姆什|r
    .turnin 51526 >>交任务: |cRXP_FRIENDLY_督军的召唤|r
    .accept 51532 >>接任务: |cRXP_WARN_迅捷出击|r
    .goto 862,58.54,62.49
    .target 高阶督军克鲁姆什
step
    .groundgoto 862,58.38,62.77,8,0
    .goto 862,58.46,62.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔特赛尔|r交谈
    .complete 51532,1 --1/1 Speak with Tattersail to sail to Stormsong Valley
    .skipgossip 1
    .target Dread-Admiral Tattersail
step
    .goto 942,51.11,21.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_高阶督军克鲁姆什|r
    .turnin 51532 >>交任务: |cRXP_FRIENDLY_迅捷出击|r
    .accept 51643 >>接任务: |cRXP_WARN_钢铁之墙|r
    .target 高阶督军克鲁姆什
step
    #completewith next
    .goto 942,51.50,20.76,12,0
    .goto 942,51.18,21.12
    >>下到船舱, 操作火炮
    .complete 51643,1 --1/1 Cannon manned
step
    >>对库尔提拉斯部队使用 |T236179:0|t[炮击] (1)
    .complete 51643,2 --40/40 Kul Tiran forces slain
step
    .goto 942,51.53,20.75,10,0
    .goto 942,51.10,20.81,10,0
    .goto 942,51.11,21.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回上方. 对话 |cRXP_FRIENDLY_高阶督军克鲁姆什|r
    .turnin 51643 >>交任务: |cRXP_FRIENDLY_钢铁之墙|r
    .accept 51536 >>接任务: |cRXP_WARN_狩猎开始|r
    .target 高阶督军克鲁姆什
step
    #completewith next
    .noflyable 942
    .goto 942,51.00,21.26
    >>点击地面上的绳圈, 搭乘登陆艇前往码头
    .complete 51536,1 --1/1 Landing Craft Boarded (1)
	.timer 12,Landing Craft RP
step
    .goto 942,50.88,26.59,30,0
    .goto 942,50.38,26.19
    >>从 |cRXP_FRIENDLY_韦洛|r 身上拔出鱼叉
    .complete 51536,2 --1/1 Seawatch Point investigated
    .timer 28,On the Hunt RP
    .skipgossip
    .target Huelo
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 对话 |cRXP_FRIENDLY_雷克萨|r
    .goto 942,50.40,26.17
    .turnin 51536 >>交任务: |cRXP_FRIENDLY_狩猎开始|r
    .accept 51587 >>接任务: |cRXP_WARN_前进！|r
    .target 雷克萨
step
    .goto 942,52.04,29.97
    .complete 51587,1 --1/1 Travel with Rexxar
step
    #completewith next
    .goto 942,52.32,29.57,30,0
    .goto 942,52.10,29.96,30 >>前往山顶
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_百夫长加贺暖石|r 和 |cRXP_FRIENDLY_雷克萨|r 交谈
    .turnin 51587 >>交任务: |cRXP_FRIENDLY_前进！|r
    .accept 51691 >>接任务: |cRXP_WARN_小命还算值钱|r
    .accept 51675 >>接任务: |cRXP_WARN_绝命猎杀|r
    .goto 942,51.65,29.83
    .accept 51674 >>接任务: |cRXP_WARN_扑灭大火|r
    .goto 942,51.68,29.89
    .target Centurion Kaga Warmstone
    .target 雷克萨
step
    #completewith Barricade
    >>击杀 |cRXP_ENEMY_风暴之潮步兵|r 和 |cRXP_ENEMY_潮汐术士|r
    >>击杀 |cRXP_ENEMY_潮圣者|r 获取 |T433449:0|t[|cRXP_LOOT_暗影魔杖|r], 对火焰使用, 每次可处理 2 个
    .complete 51675,2 --8/8 Storm's Wake Footman slain
    .collect 160565,4,51674,0x1,-1 --Fading Umbral Wand (4)
    .complete 51674,1 --4/4 Flames doused
    .use 160565
    .mob Storm's Wake Tidesage
    .mob Storm's Wake Footmen
step
    #sticky
    #label Ara
    .goto 942,51.73,33.53
    >>击杀 |cRXP_ENEMY_阿拉队长|r
    .complete 51675,1 --1/1 Captain Ara slain
    .mob Capatin Ara
step
    #label Barricade
    .goto 942,51.83,33.58
    .cast 272499 >>摧毁 |cRXP_ENEMY_阿拉队长|r 身后的 |cRXP_PICK_路障|r
    .isOnQuest 51691
step
    #requires Ara
#loop
	.line 942,51.90,32.68,51.80,32.36,51.30,31.63,50.63,30.88,50.23,30.99,50.05,31.76,50.06,32.19,49.72,32.95,49.87,33.13,50.64,33.54,51.06,33.04,51.90,32.68
	.goto 942,51.90,32.68,30,0
	.goto 942,51.80,32.36,30,0
	.goto 942,51.30,31.63,30,0
	.goto 942,50.63,30.88,30,0
	.goto 942,50.23,30.99,30,0
	.goto 942,50.05,31.76,30,0
	.goto 942,50.06,32.19,30,0
	.goto 942,49.72,32.95,30,0
	.goto 942,49.87,33.13,30,0
	.goto 942,50.64,33.54,30,0
	.goto 942,51.06,33.04,30,0
	.goto 942,51.90,32.68,30,0
    >>击杀 |cRXP_ENEMY_风暴之潮步兵|r 和 |cRXP_ENEMY_潮汐术士|r
    >>击杀 |cRXP_ENEMY_潮圣者|r 获取 |T433449:0|t[|cRXP_LOOT_暗影魔杖|r], 对火焰使用, 每次可处理 2 个
    >>点击 |cRXP_FRIENDLY_受惊的苦工|r 解救他们
    .complete 51675,2 --8/8 Storm's Wake Footman slain
    .collect 160565,4,51674,0x1,-1 --Fading Umbral Wand (4)
    .complete 51674,1 --4/4 Flames doused
    .complete 51691,1 --6/6 Frightened Peon rescued
    .use 160565
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与小桥对面的 |cRXP_FRIENDLY_百夫长加贺暖石|r 和 |cRXP_FRIENDLY_雷克萨|r 交谈
    .turnin 51675 >>交任务: |cRXP_FRIENDLY_绝命猎杀|r
    .turnin 51691 >>交任务: |cRXP_FRIENDLY_小命还算值钱|r
    .goto 942,49.19,34.21
    .turnin 51674 >>交任务: |cRXP_FRIENDLY_扑灭大火|r
    .accept 51696 >>接任务: |cRXP_WARN_夺回我们的东西|r
    .goto 942,49.24,34.26
    .target Centurion Kaga Warmstone
    .target 雷克萨
step
    .goto 942,49.61,34.79
    >>爬上高塔, 点击 |cRXP_PICK_战争号角|r 鸣响. 按 ESC 跳过过场动画
    .complete 51696,1 --1/1 Warhorn of the Hold sounded
step
    .goto 942,52.13,33.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷克萨|r
    .turnin 51696 >>交任务: |cRXP_FRIENDLY_夺回我们的东西|r
    .accept 51753 >>接任务: |cRXP_WARN_勇士：雷克萨|r
    .turnin 51753 >>交任务: |cRXP_FRIENDLY_勇士：雷克萨|r
    .accept 51986 >>接任务: |cRXP_WARN_回到祖达萨|r
    .target 雷克萨
step
    .goto 942,51.43,33.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t出去. 对话 |cRXP_FRIENDLY_Muka Stormbreaker|r
    .complete 51986,1 --Speak to Muka Stormbreaker
    .skipgossip 2
    .target Muka Stormbreaker
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 51986 >>交任务: |cRXP_FRIENDLY_回到祖达萨|r
    .target 纳萨诺斯·凋零者
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 06) 战役: 统一赞达拉
#displayname 第 6 章 - 赞达拉众志成城
#next 07) 战役: 准备就绪
<< Horde
step
    .isQuestAvailable 52451
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .daily 52451,51916 >>接任务: |cRXP_WARN_赞达拉众志成城|r
    .target 纳萨诺斯·凋零者
step
    .isOnQuest 52451
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 52451 >>交任务: |cRXP_FRIENDLY_赞达拉众志成城|r
    .accept 51589 >>接任务: |cRXP_WARN_征服库尔提拉斯|r
    .goto 862,58.44,62.67
    .target 纳萨诺斯·凋零者
step
    .isOnQuest 51916
    .isQuestComplete 51916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 51916 >>交任务: |cRXP_FRIENDLY_赞达拉众志成城|r
    .goto 862,58.44,62.67
    .target 纳萨诺斯·凋零者
step
    .isOnQuest 51916
    >>在 |cRXP_WARN_祖达萨|r 完成赞达拉帝国任务, 在 |cRXP_WARN_纳兹米尔|r 完成塔兰吉远征队任务, 在 |cRXP_WARN_沃顿|r 完成沃顿奈任务
    .complete 51916,1 -- Zandalari Empire (Friendly)
    .complete 51916,2 -- Talanji's Expedition (Friendly)
    .complete 51916,3 -- Voldunai (Friendly)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 51916 >>交任务: |cRXP_FRIENDLY_赞达拉众志成城|r
    .goto 862,58.44,62.67
    .target 纳萨诺斯·凋零者
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 07) 战役: 准备就绪
#displayname 第 7 章 - 战鼓震天
#next 08) 战役: 复仇之潮
<< Horde
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往祖达萨. 对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .accept 51589 >>接任务: |cRXP_WARN_征服库尔提拉斯|r
    .target 纳萨诺斯·凋零者
step
    .goto 862,58.46,62.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔特赛尔|r交谈
    .complete 51589,1 --1/1 Speak with Tattersail to sail to Tiragarde Sound
    .goto 862,58.46,62.99
    .skipgossip 135690,1
    .target Dread-Admiral Tattersail
step
    #completewith ZandalariTrollIntotheHeartofTiragarde
    .isOnQuest 51589
    .noflyable 895
    .goto 895,87.27,50.66
    .fp >>获取 [掠夺港] 飞行点
step
    .goto 895,87.37,50.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 51589 >>交任务: |cRXP_FRIENDLY_征服库尔提拉斯|r
    .accept 51590 >>接任务: |cRXP_WARN_进入提拉加德之心|r
    .target 纳萨诺斯·凋零者
step
    #label ZandalariTrollIntotheHeartofTiragarde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t沿着路径前进, 然后对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .groundgoto 895,87.59,51.03,13,0
    .groundgoto 895,87.00,51.78,13,0
    .groundgoto 895,83.53,49.96,32,0
    .groundgoto 895,70.54,49.03,25,0
    .goto 895,71.19,50.91
    .turnin 51590 >>交任务: |cRXP_FRIENDLY_进入提拉加德之心|r
    .accept 51591 >>接任务: |cRXP_WARN_占山为王|r
    .target 纳萨诺斯·凋零者
step
    >>击杀 |cRXP_ENEMY_暴徒伐木工|r 和 |cRXP_ENEMY_暴徒打手|r
    .complete 51591,1 --10/10 Roughneck slain
    .goto 895,71.99,51.91
    .mob Roughneck Logger
    .mob Roughneck Goon
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 和 |cRXP_FRIENDLY_莉莉安·沃斯|r 交谈
    .turnin 51591 >>交任务: |cRXP_FRIENDLY_占山为王|r
    .accept 51592 >>接任务: |cRXP_WARN_我们就不客气了|r
    .goto 895,72.02,51.85
    .accept 51593 >>接任务: |cRXP_WARN_调查桥港|r
    .goto 895,72.05,51.77
    .target 纳萨诺斯·凋零者
    .target 莉莉安·沃斯
step
    #completewith ZandalariTrollBridgeportInvestigation
    >>拾取 |cRXP_PICK_箱子|r\|cRXP_PICK_锁链|r 和 |cRXP_PICK_螺栓|r
    .complete 51592,1 --7/7 Length of Chain
    .complete 51592,2 --7/7 Sail Canvas
step
    >>跑进圆圈, 按 ESC 跳过过场动画
    >>|cRXP_WARN_避开精英怪|r
    .goto 895,75.31,51.13
    .complete 51593,3 --1/1 Investigate the outdoor workshop
step
    >>跑进圆圈, 按 ESC 跳过过场动画
    >>|cRXP_WARN_避开精英怪|r
    .groundgoto 895,74.58,50.41,10,0
    .groundgoto 895,74.70,50.32,8,0
    .groundgoto 895,74.44,50.15,8,0
    .goto 895,74.62,49.68
    .complete 51593,1 --1/1 Investigate the harbor terrace
step
    #label ZandalariTrollBridgeportInvestigation
    >>跑进圆圈, 按 ESC 跳过过场动画
    .groundgoto 895,73.51,47.16,20,0
    .goto 895,73.46,48.24
    .complete 51593,2 --1/1 Investigate the watchpost cabin
step
    >>拾取 |cRXP_PICK_箱子|r\|cRXP_PICK_锁链|r 和 |cRXP_PICK_螺栓|r
    .goto 895,75.31,51.13,20,0
    .goto 895,74.62,49.68,20,0
    .goto 895,75.31,51.13,20,0
    .goto 895,75.13,50.57
    .complete 51592,1 --7/7 Length of Chain
    .complete 51592,2 --7/7 Sail Canvas
step
    .groundgoto 895,71.75,48.95,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 和 |cRXP_FRIENDLY_莉莉安·沃斯|r 交谈
    .turnin 51592 >>交任务: |cRXP_FRIENDLY_我们就不客气了|r
    .goto 895,72.02,51.85
    .turnin 51593 >>交任务: |cRXP_FRIENDLY_调查桥港|r
    .accept 51594 >>接任务: |cRXP_WARN_铸造厂里的炸药|r
    .goto 895,72.05,51.77
    .target 纳萨诺斯·凋零者
    .target 莉莉安·沃斯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_莉莉安·沃斯|r
    .goto 895,77.50,49.93
    .turnin 51594 >>交任务: |cRXP_FRIENDLY_铸造厂里的炸药|r
    .accept 51595 >>接任务: |cRXP_WARN_爆炸性|r
    .target 莉莉安·沃斯
step
    >>在 |cRXP_PICK_阿什凡板条箱堆|r 旁使用 [额外动作按钮]
    .goto 895,77.69,49.79
    .complete 51595,1 --1/1 Test bomb explosiveness
step
    .goto 895,77.50,49.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_莉莉安·沃斯|r
    .turnin 51595 >>交任务: |cRXP_FRIENDLY_爆炸性|r
    .accept 51596 >>接任务: |cRXP_WARN_获取弹药|r
    .accept 51597 >>接任务: |cRXP_WARN_火药研究|r
    .accept 51598 >>接任务: |cRXP_WARN_一点混乱|r
    .target 莉莉安·沃斯
step
    #completewith ZandalariTrollGunpowderResearch
    >>击杀 |cRXP_ENEMY_工人|r 并拾取 |cRXP_PICK_火药箱|r
    .complete 51598,1 --15/15 Ashvane workers slain
    .complete 51596,1 --8/8 Ashvane Explosives
    .mob Foundry Worker
    .mob Company Watchman
    .mob Company Enforcer
step
    >>击杀 |cRXP_ENEMY_监工威廉姆斯|r, 拾取 |cRXP_LOOT_火药制造指南|r
    .goto 895,79.36,47.24,20,0
    .goto 895,79.09,46.97
    .complete 51597,2 --1/1 Gunpowder Manufacturing Guide
    .mob Taskmaster Williams
step
    #label ZandalariTrollGunpowderResearch
    >>击杀 |cRXP_ENEMY_铸造大师法辛|r, 拾取 |cRXP_LOOT_阿什维恩炸药配方|r
    .groundgoto 895,81.73,46.54,25,0
    .goto 895,82.18,48.61
    .complete 51597,1 --1/1 Ashvane Explosives Formula
    .mob Forgemaster Farthing
step
    >>击杀 |cRXP_ENEMY_工人|r 并拾取 |cRXP_PICK_火药箱|r
    .complete 51598,1 --15/15 Ashvane workers slain
    .complete 51596,1 --8/8 Ashvane Explosives
    .goto 895,81.81,49.59,20,0
    .goto 895,80.95,49.30,20,0
    .goto 895,79.55,50.17,35,0
#loop
	.line 895,79.22,48.34,80.08,47.09,82.18,48.61,81.81,49.59,80.95,49.30,79.55,50.17
	.goto 895,79.22,48.34,30,0
	.goto 895,80.08,47.09,30,0
	.goto 895,82.18,48.61,30,0
	.goto 895,81.81,49.59,30,0
	.goto 895,80.95,49.30,30,0
	.goto 895,79.55,50.17,30,0
    .mob Foundry Worker
    .mob Company Watchman
    .mob Company Enforcer
step
    .goto 895,77.50,49.93
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_莉莉安·沃斯|r
    .turnin 51596 >>交任务: |cRXP_FRIENDLY_获取弹药|r
    .turnin 51597 >>交任务: |cRXP_FRIENDLY_火药研究|r
    .turnin 51598 >>交任务: |cRXP_FRIENDLY_一点混乱|r
    .accept 51599 >>接任务: |cRXP_WARN_死亡陷阱|r
    .target 莉莉安·沃斯
step
    >>放置 |cRXP_PICK_箱子|r
    .goto 895,74.23,52.94
    .complete 51599,1 --8/8 Gunpowder Crate placed
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_莉莉安·沃斯|r
    .groundgoto 895,76.82,50.51,25,0
    .goto 895,77.00,49.19
    .turnin 51599 >>交任务: |cRXP_FRIENDLY_死亡陷阱|r
    .accept 51601 >>接任务: |cRXP_WARN_桥港之旅|r
    .target 莉莉安·沃斯
step
    #completewith next
    .goto 895,76.99,49.23
    .vehicle 138552 >>骑上 |cRXP_FRIENDLY_被盗的马|r
step
    >>跟随箭头骑乘前进, 穿过足够的 |cRXP_ENEMY_守卫|r 和 |cRXP_ENEMY_阿玛莉亚·斯通队长|r
    >>按 ESC 键跳过即将播放的过场动画
    .goto 895,75.72,48.87,10,0
    .goto 895,75.55,48.53,10,0
    .goto 895,74.90,50.05,10,0
    .goto 895,75.62,49.90,10,0
    .goto 895,75.81,51.46,20,0
    .goto 895,74.33,53.34
    .complete 51601,1 --10/10 Ride past Bridgeport Guards
    .complete 51601,2 --1/1 Ride past Captain Amalia Stone
    .complete 51601,3 --Complete the Bridgeport Ride (100%)
step
    .goto 895,72.02,51.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 51601 >>交任务: |cRXP_FRIENDLY_桥港之旅|r
    .target 纳萨诺斯·凋零者
step
    #completewith next
    .zoneskip 862
    .noflyable 895
    .goto 895,72.18,51.91
    .fly Plunder Harbor >>飞往掠夺港
step
    #completewith next
    .zoneskip 862
    .goto 895,87.84,51.18
    .gossipoption 48794 >>与|cRXP_FRIENDLY_埃鲁尔·晨溪|r交谈
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin -53065 >>交任务: |cRXP_FRIENDLY_行动代号：掘墓人|r
    .accept 51784 >>接任务: |cRXP_WARN_墓园漫步|r
    .target 纳萨诺斯·凋零者
step
    .isOnQuest 51784
    .goto 862,58.46,62.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔特赛尔|r交谈
    .gossipoption 48342
    .complete 51784,1 --1/1 Speak with Tattersail to sail to 德鲁斯瓦 (Optional)
    .target Dread-Admiral Tattersail
step
    #completewith next
    .isOnQuest 51784
    .noflyable 896
    .goto 896,19.69,43.74,10,0
    .goto 896,19.32,43.93,10,0
    .goto 896,19.19,43.33,10,0
    .goto 896,19.15,43.31
    .fly Krazzlefrazz Outpost >>爬上塔楼, 飞往克拉兹弗拉兹前哨站
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 和 |cRXP_FRIENDLY_莉莉安·沃斯|r 交谈
    .groundgoto 896,38.13,34.38,30,0
    .groundgoto 896,45.23,34.79,50,0
    .groundgoto 896,48.38,32.14,30,0
    .turnin 51784 >>交任务: |cRXP_FRIENDLY_墓园漫步|r
    .accept 51785 >>接任务: |cRXP_WARN_查看墓志铭|r
    .accept 51786 >>接任务: |cRXP_WARN_无法安息|r
    .goto 896,61.37,51.09
    .accept 51787 >>接任务: |cRXP_WARN_我们悲惨的生命|r
    .goto 896,61.32,51.03
    .target 纳萨诺斯·凋零者
    .target 莉莉安·沃斯
step
    #completewith ZandalariTrollExaminingtheEpitaphs
    >>击杀 |cRXP_ENEMY_怒灵|r
    .complete 51786,1 --8/8 Enraged Spirit slain
    .mob 被激怒的灵魂
step
    #title Gravebloom 1/10
    >>拾取 |cRXP_PICK_墓地花|r
    .goto 896,61.16,48.82
    .complete 51787,1,1 --1/10 Gravebloom
step
    #title Geave Plague read 1/4
    >>阅读 |cRXP_PICK_墓碑铭文|r
    .goto 896,61.11,48.88
    .complete 51785,1,1 --1/4 Grave Plaque
step
    #title Geave Plague read 2/4
    >>阅读 |cRXP_PICK_墓碑铭文|r
    .goto 896,61.91,47.86
    .complete 51785,1,2 --2/4 Grave Plaque
step
    #title Gravebloom 2/10
    >>拾取 |cRXP_PICK_墓地花|r
    .goto 896,61.97,47.71
    .complete 51787,1,2 --2/10 Gravebloom
step
    #title Gravebloom 3/10
    >>拾取 |cRXP_PICK_墓地花|r
    .goto 896,61.29,47.64
    .complete 51787,1,3 --3/10 Gravebloom
step
    #title Gravebloom 4/10
    >>拾取 |cRXP_PICK_墓地花|r
    .goto 896,61.06,47.44
    .complete 51787,1,4 --4/10 Gravebloom
step
    #title Gravebloom 5/10
    >>拾取 |cRXP_PICK_墓地花|r
    .goto 896,60.92,47.07
    .complete 51787,1,5 --5/10 Gravebloom
step
    #title Gravebloom 6/10
    >>拾取 |cRXP_PICK_墓地花|r
    .goto 896,60.49,45.71
    .complete 51787,1,6 --6/10 Gravebloom
step
    #title Gravebloom 7/10
    >>拾取 |cRXP_PICK_墓地花|r
    .goto 896,60.31,44.90
    .complete 51787,1,7 --7/10 Gravebloom
step
    #title Geave Plague read 3/4
    >>阅读 |cRXP_PICK_墓碑铭文|r
    .goto 896,60.31,44.95
    .complete 51785,1,3 --3/4 Grave Plaque
step
    #title Gravebloom 8/10
    >>拾取 |cRXP_PICK_墓地花|r
    .goto 896,60.22,45.98
    .complete 51787,1,8 --8/10 Gravebloom
step
    #title Gravebloom 9/10
    >>拾取 |cRXP_PICK_墓地花|r
    .goto 896,60.00,46.33
    .complete 51787,1,9 --9/10 Gravebloom
step
    #title Geave Plague read 4/4
    >>阅读 |cRXP_PICK_墓碑铭文|r
    .goto 896,59.54,47.31
    .complete 51785,1 --4/4 Grave Plaque
step
    #label ZandalariTrollExaminingtheEpitaphs
    #title Gravebloom 10/10
    >>拾取 |cRXP_PICK_墓地花|r
    .goto 896,60.26,47.16
    .complete 51787,1 --10/10 Gravebloom
step
    >>击杀 |cRXP_ENEMY_怒灵|r
#loop
	.line 896,61.11,48.88,61.91,47.86,60.31,44.95,59.54,47.31
	.goto 896,61.11,48.88,30,0
	.goto 896,61.91,47.86,30,0
	.goto 896,60.31,44.95,30,0
	.goto 896,59.54,47.31,30,0
    .complete 51786,1 --8/8 Enraged Spirit slain
    .mob 被激怒的灵魂
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莉莉安·沃斯|r 和 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 交谈 
    .turnin 51787 >>交任务: |cRXP_FRIENDLY_我们悲惨的生命|r
    .goto 896,61.32,51.03
    .turnin 51785 >>交任务: |cRXP_FRIENDLY_查看墓志铭|r
    .turnin 51786 >>交任务: |cRXP_FRIENDLY_无法安息|r
    .accept 51788 >>接任务: |cRXP_WARN_守墓人|r
    .goto 896,61.37,51.09
    .target 莉莉安·沃斯
    .target 纳萨诺斯·凋零者
step
    >>击杀 |cRXP_ENEMY_布鲁图斯·桑顿|r, 拾取 |cRXP_LOOT_瓦伦丁的钥匙|r
    .goto 896,59.24,49.26
    .complete 51788,1 --1/1 Valentine's Key
    .mob 布鲁图斯 Thronton
step
    .goto 896,61.37,51.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 
    .turnin 51788 >>交任务: |cRXP_FRIENDLY_守墓人|r
    .accept 51789 >>接任务: |cRXP_WARN_瓦伦丁元帅的记忆|r
    .target 纳萨诺斯·凋零者
step
    >>打开 |cRXP_PICK_陵墓之门|r
    .goto 896,61.11,48.88
    .complete 51789,1 --1/1 Crypt Door opened
step
    >>击杀刷新的 |cRXP_ENEMY_怪物|r 和 |cRXP_ENEMY_元帅M·瓦伦丁的回声|r
    .goto 896,61.12,48.75
    .complete 51789,2 --1/1 Echo of Marshal M. Valentine slain
    .mob Echo of Marshal M. Valentine
step
    >>等待剧情结束, 从墓穴内地上拾取 |cRXP_PICK_瓦伦丁的日志|r
    .goto 896,61.11,48.99
    .complete 51789,3 --1/1 Crypt searched
    .complete 51789,4 --1/1 Valentine's location uncovered
    .complete 51789,5 --1/1 Valentine's Log
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 
    .goto 896,61.18,48.74
    .turnin 51789 >>交任务: |cRXP_FRIENDLY_瓦伦丁元帅的记忆|r
    .target 纳萨诺斯·凋零者
step << Mage
    .isQuestAvailable 51797
    .flyable 1165,300
    .zoneskip 85
    .cast 3567>>使用传送:奥格瑞玛
step
    .isQuestAvailable 51797
    .flyable 1165,300
    .zoneskip 85
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协同披风
step
    .isQuestAvailable 51797
    .flyable 1165,300
    .zoneskip 896,1
    .itemcount 140192,1
    .cooldown item,140192,>0,1
    .zone 627 >>使用达拉然炉石
step
    .isQuestAvailable 51797
    .flyable 1165,300
    .zoneskip 627,1
    .goto 627,55.27,23.97
    .zone 85 >>使用传送门前往奥格瑞玛
step
    .isQuestAvailable 51797
    .flyable 1165,300
    .zoneskip 85,1
    .goto 85,53.42,90.44,10,0
    .goto 85,58.55,91.31
    .zone 1163 >>通过传送门前往祖达萨
step
    #completewith next
    .isQuestAvailable 51797
    .zoneskip 896,1
    .noflyable 896
    .groundgoto 896,48.38,32.14,30,0
    .groundgoto 896,45.23,34.79,50,0
    .groundgoto 896,38.13,34.38,30,0
    .goto 896,37.37,24.04
    .fly Anyport >>飞往任意港口
step
    .isQuestAvailable 51797
    .zoneskip 896,1
    .noflyable 896
    .goto 896,20.60,43.34
    .gossipoption 48793 >>与斯威尔瑟拉斯交谈
step
    #completewith next
    .flyable 1165,300
    .zoneskip 1163,1
    .isQuestAvailable 51797
    .goto 1165,49.91,41.48,18 >>离开大封印
step
    .noflyable 862
    .zoneskip 862
    .isQuestAvailable 51797
    #completewith next
    .goto 1165,51.92,41.22
    .fly Port of Zandalar >>飞往赞达拉港口
step
    .zoneskip 1165
    .noflyable 1165
    .isQuestAvailable 51797
    .hs >>使用炉石传送到灵魂与你同在
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 
    .goto 862,58.44,62.68
    .accept 51797 >>接任务: |cRXP_WARN_追踪海潮贤者|r
    .target 纳萨诺斯·凋零者
step
    .goto 862,58.46,62.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔特赛尔|r交谈
    .complete 51797,1 --1/1 Speak with Tattersail to sail to Stormsong Valley
    .goto 862,58.46,62.99
    .skipgossip 135690,1
    .target Dread-Admiral Tattersail
step
    #completewith next
    .goto 942,51.79,33.56,10 >>进入大厅
step
    .goto 942,52.12,33.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷克萨|r
    .turnin 51797 >>交任务: |cRXP_FRIENDLY_追踪海潮贤者|r
    .accept 51798 >>接任务: |cRXP_WARN_不计代价|r
    .target 雷克萨
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷克萨|r 交谈, 等待剧情结束
    .goto 942,59.30,30.18
    .complete 51798,1 --1/1 Help Rexxar locate a tidesage
    .skipgossip 1
    .target 雷克萨
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯·泽林|r交谈.等待剧情触发
    .goto 942,62.64,31.87
    .complete 51798,2 --1/1 Tidesage located
    .skipgossip 1
    .timer 55,Tidesage RP
    .target 托马斯 Zelling
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莉莉安·沃斯|r\|cRXP_FRIENDLY_托马斯·泽林|r 和 |cRXP_FRIENDLY_雷克萨|r 交谈
    .turnin 51798 >>交任务: |cRXP_FRIENDLY_不计代价|r
    .accept 51805 >>接任务: |cRXP_WARN_传播恐惧|r
    .goto 942,62.65,31.94
    .accept 51818 >>接任务: |cRXP_WARN_指挥官和队长|r
    .goto 942,62.64,31.87
    .accept 51819 >>接任务: |cRXP_WARN_溃敌之兵|r
    .goto 942,62.68,31.82
    .target 莉莉安·沃斯
    .target 托马斯 Zelling
    .target 雷克萨
step
    #completewith ZandalariTrollCommanderandCaptain
    >>在 |cRXP_ENEMY_库尔提拉斯工人|r 附近使用 |T134229:0|t[瓦尔基里号角]
    >>击杀 |cRXP_ENEMY_库尔提拉斯|r 和 |cRXP_ENEMY_联盟|r 部队
    .complete 51805,1 --20/20 Civilians terrorized
    .complete 51819,1 --10/10 Alliance and Kul Tiran forces slain
    .use 160901
step
    >>击杀 |cRXP_ENEMY_指挥官奥古斯丁|r, 拾取 |cRXP_LOOT_禁忌魔法之书|r
    .groundgoto 942,61.69,36.40,15,0
    .groundgoto 942,60.02,38.04,15,0
    .goto 942,58.24,35.52
    .complete 51818,2 --1/1 Book of Forbidden Magics
    .mob Commander Augustine
step
    #label ZandalariTrollCommanderandCaptain
    >>击杀 |cRXP_ENEMY_马利亚船长|r
    .goto 942,62.68,39.55
    .complete 51818,1 --1/1 Captain Malia slain
    .mob Captain Malia
step
    >>在 |cRXP_ENEMY_库尔提拉斯工人|r 附近使用 |T134229:0|t[瓦尔基里号角]
    >>击杀 |cRXP_ENEMY_库尔提拉斯|r 和 |cRXP_ENEMY_联盟|r 部队
    .goto 942,60.94,42.63,25,0
    .goto 942,60.24,42.75,20,0
    .goto 942,59.36,41.81,20,0
    .goto 942,60.19,40.83,20,0
    .goto 942,59.53,39.39,20,0
#loop
	.line 942,62.68,39.55,60.94,42.63,60.24,42.75,59.36,41.81,60.19,40.83,59.53,39.39
	.goto 942,62.68,39.55,25,0
	.goto 942,60.94,42.63,25,0
	.goto 942,60.24,42.75,25,0
	.goto 942,59.36,41.81,25,0
	.goto 942,60.19,40.83,25,0
	.goto 942,59.53,39.39,25,0
    .complete 51805,1 --20/20 Civilians terrorized
    .complete 51819,1 --10/10 Alliance and Kul Tiran forces slain
    .use 160901
step
    .groundgoto 942,62.00,32.02,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莉莉安·沃斯|r\|cRXP_FRIENDLY_雷克萨|r 和 |cRXP_FRIENDLY_托马斯·泽林|r 交谈
    .turnin 51805 >>交任务: |cRXP_FRIENDLY_传播恐惧|r
    .goto 942,62.65,31.95
    .turnin 51819 >>交任务: |cRXP_FRIENDLY_溃敌之兵|r
    .goto 942,62.68,31.81
    .turnin 51818 >>交任务: |cRXP_FRIENDLY_指挥官和队长|r
    .accept 51830 >>接任务: |cRXP_WARN_泽林的潜力|r
    .goto 942,62.64,31.88
    .target 莉莉安·沃斯
    .target 雷克萨
    .target 托马斯 Zelling
step
    >>击杀 |cRXP_ENEMY_潮汐术士|r\|cRXP_ENEMY_潮缚者|r\|cRXP_ENEMY_复生猎犬|r\|cRXP_ENEMY_溺亡者|r 或 |cRXP_ENEMY_被蔑视的达格鲁斯|r 以填满进度条
    .groundgoto 942,64.90,38.78,25,0
    .goto 942,65.85,41.71,20,0
    .goto 942,67.95,40.38,20,0
    .goto 942,67.70,42.11,20,0
    .goto 942,65.90,42.96,20,0
    .goto 942,66.17,44.80,20,0
#loop
	.line 942,65.85,41.71,67.95,40.38,67.70,42.11,65.90,42.96,66.17,44.80
	.goto 942,65.85,41.71,25,0
	.goto 942,67.95,40.38,25,0
	.goto 942,67.70,42.11,25,0
	.goto 942,65.90,42.96,25,0
	.goto 942,66.17,44.80,25,0
    .complete 51830,1 --1/1 Void Font filled within Port Fogtide
    .mob Tidebound Corsair
    .mob Frothing Tideblood
    .mob Tidesage Seacaller
    .mob Dagrus the Scorned
step
    >>使用 [额外动作按钮]
    .goto 942,66.61,42.20
    .complete 51830,2 --1/1 Empowered essence activated within Port Fogtide
step
    .groundgoto 942,62.00,32.02,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待剧情结束, 跑上山与 |cRXP_FRIENDLY_托马斯·泽林|r 和 |cRXP_FRIENDLY_莉莉安·沃斯|r 交谈
    .turnin 51830 >>交任务: |cRXP_FRIENDLY_泽林的潜力|r
    .goto 942,62.64,31.88
    .accept 51837 >>接任务: |cRXP_WARN_顺其自然|r
    .goto 942,62.64,31.95
    .target 托马斯 Zelling
    .target 莉莉安·沃斯
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯·泽林|r交谈.等待剧情发展
    .goto 942,62.64,31.88
    .skipgossip
    .timer 66,Thomas Zelling RP
    .complete 51837,1 --1/1 Thomas Zelling spoken to
step
    .goto 942,62.65,31.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_莉莉安·沃斯|r
    .turnin 51837 >>交任务: |cRXP_FRIENDLY_顺其自然|r
    .accept 52122 >>接任务: |cRXP_WARN_被遗忘者|r
    .target 莉莉安·沃斯
step
    .goto 942,59.93,30.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莉莉安·沃斯|r 交谈, 等待剧情结束
    .complete 52122,1 --1/1 Thomas Zelling found
    .skipgossip
    .timer 58,Thomas Zelling RP
    .target 莉莉安·沃斯
step
    .zoneskip 942,1
    #completewith next
    .goto 942,51.43,33.74
    .gossipoption 48826 >>与穆卡·风暴破坏者交谈
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 52122 >>交任务: |cRXP_FRIENDLY_被遗忘者|r
    .accept 52764 >>接任务: |cRXP_WARN_前往与世隔绝之地|r
    .target 纳萨诺斯·凋零者
step
    .goto 862,58.46,62.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔特赛尔|r交谈
    .complete 52764,1 --1/1 Speak with Tattersail to sail to the Great Sea
    .goto 862,58.46,62.99
    .skipgossip 135690,1
    .target Dread-Admiral Tattersail
step
    .goto 1157,40.28,67.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 52764 >>交任务: |cRXP_FRIENDLY_前往与世隔绝之地|r
    .accept 52765 >>接任务: |cRXP_WARN_纵身深潜|r
    .target 纳萨诺斯·凋零者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_霍巴特·钩锤|r 交谈, 等待抵达海底
    .goto 1157,41.62,67.63
    .complete 52765,1 --1/1 Speak with Hobart to dive into the Great Sea
    .complete 52765,2 --1/1 Reach the ocean floor
    .skipgossip 1
    .target 霍巴特·钩锤
step
    >>使用 [额外动作按钮] 两次来开启和关闭头灯
    .goto 1157,41.40,68.24
    .complete 52765,3 --1/1 Test your headlamp
step
    >>点击小地图下方的弹出窗口或任务日志中的任务
    .goto 1157,41.40,68.24
    .turnin 52765 >>交任务: |cRXP_FRIENDLY_纵身深潜|r
    .accept 52766 >>接任务: |cRXP_WARN_海底沉船|r
step
    #completewith ZandalariTrollGrabandGo
    +长时间开启头灯可能导致死亡, 仅在确实需要时使用
step
    >>沿箭头前进, 避免拉怪
    .goto 1157,47.17,67.93
    .complete 52766,1 --1/1 Find the shipwreck
step
    >>点击小地图下方的弹出窗口或任务日志中的任务
    .goto 1157,47.17,67.93
    .turnin 52766 >>交任务: |cRXP_FRIENDLY_海底沉船|r
    .accept 52767 >>接任务: |cRXP_WARN_检查狗牌|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_溺亡水手|r交谈
    .goto 1157,48.63,70.79
    .complete 52767,1 --1/1 Find the ship's captain
    .target Drowned Sailor
step
    >>点击小地图下方的弹出窗口或任务日志中的任务
    .goto 1157,48.63,70.79
    .turnin 52767 >>交任务: |cRXP_FRIENDLY_检查狗牌|r
    .accept 52768 >>接任务: |cRXP_WARN_沉没的墓地|r
step
    >>沿箭头前进, 避免拉怪
    .goto 1157,55.87,51.20
    .complete 52768,1 --1/1 Find another shipwreck
step
    .goto 1157,55.87,51.20
    >>点击小地图下方的弹出窗口或任务日志中的任务
    .turnin 52768 >>交任务: |cRXP_FRIENDLY_沉没的墓地|r
    .accept 52769 >>接任务: |cRXP_WARN_船长们|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与帆上方的|cRXP_FRIENDLY_溺亡水手|r交谈
    .goto 1157,54.52,49.65
    .complete 52769,1 --1/1 Identify the first sea captain
    .target Drowned Sailor
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_溺亡水手|r交谈
    .goto 1157,56.46,45.03
    .complete 52769,2 --1/1 Identify the second sea captain
    .target Drowned Sailor
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上方稍高处的|cRXP_FRIENDLY_溺亡水手|r交谈
    .goto 1157,66.50,42.30
    .complete 52769,3 --1/1 Identify the third sea captain
    .target Drowned Sailor
step
    .goto 1157,66.50,42.35
    >>点击小地图或任务日志中的弹出提示. 若未弹出则击杀附近怪物
    .turnin 52769 >>交任务: |cRXP_FRIENDLY_船长们|r
    .accept 52770 >>接任务: |cRXP_WARN_萤光闪烁|r
step
    >>击杀 |cRXP_ENEMY_发光淤泥食者|r\|cRXP_ENEMY_深海果冻|r\|cRXP_ENEMY_海底碎壳蟹|r 和 |cRXP_ENEMY_幽光斥候|r
    .complete 52770,1 --10/10 Bioluminescent creature slain
    .goto 1157,64.57,45.60,20,0
    .goto 1157,66.85,51.33,20,0
    .goto 1157,60.98,41.36,25,0
    .goto 1157,59.47,47.72,25,0
    .goto 1157,55.24,61.90,25,0
#loop
	.line 1157,64.57,45.60,66.85,51.33,60.98,41.36,59.47,47.72,55.24,61.90
	.goto 1157,64.57,45.60,25,0
	.goto 1157,66.85,51.33,25,0
	.goto 1157,60.98,41.36,25,0
	.goto 1157,59.47,47.72,25,0
	.goto 1157,55.24,61.90,25,0
    .mob Luminescent Siltfeeder
    .mob Deep Ocean Jelly
    .mob Seafloor Shambleclaw
    .mob Underlight Scout
step
    .goto 1157,67.03,56.26
    >>点击小地图下方的弹出窗口或任务日志中的任务
    .turnin 52770 >>交任务: |cRXP_FRIENDLY_萤光闪烁|r
    .accept 52772 >>接任务: |cRXP_WARN_海底礁石|r
step
    >>跟随箭头指引
    .goto 1157,67.03,56.26
    .complete 52772,1 --1/1 Find the shipwreck on the ledge
step
    .goto 1157,67.03,56.26
    >>点击小地图下方的弹出窗口或任务日志中的任务
    .turnin 52772 >>交任务: |cRXP_FRIENDLY_海底礁石|r
    .accept 52773 >>接任务: |cRXP_WARN_水底的龙|r
step
    >>击杀 |cRXP_ENEMY_达尼斯特拉兹|r
    .goto 1157,68.26,55.54
    .complete 52773,1 --1/1 Daenistrasz slain
    .mob Daenistrasz
step
    .goto 1157,68.26,55.54
    >>点击小地图下方的弹出窗口或任务日志中的任务
    .turnin 52773 >>交任务: |cRXP_FRIENDLY_水底的龙|r
    .accept 52774 >>接任务: |cRXP_WARN_拿了就走|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_溺亡水手|r交谈
    .goto 1157,68.25,55.60
    .complete 52774,1 --1/1 Gather Marshal M. Valentine's body
    .skipgossip
    .target Drowned Sailor
step
    #label ZandalariTrollGrabandGo
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_溺亡水手|r交谈
    .goto 1157,68.73,55.96
    .complete 52774,2 --1/1 Gather the other sailor's body
    .skipgossip
    .target Drowned Sailor
step
    #completewith next
    +打开头灯, 等待死亡
    .goto 1157,68.73,55.96,10,0
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跳下去. 对话 |cRXP_FRIENDLY_莉莉安·沃斯|r
    .goto 1157,41.56,66.50
    .turnin 53121 >>交任务: |cRXP_FRIENDLY_围攻伯拉勒斯|r
    .target 莉莉安·沃斯
step
    .goto 1157,42.08,66.24,8,0
    .goto 1157,40.12,68.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入船内. 对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 52774 >>交任务: |cRXP_FRIENDLY_拿了就走|r
    .accept 52978 >>接任务: |cRXP_WARN_王子随行|r
    .target 纳萨诺斯·凋零者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t回到上方. 对话 |cRXP_FRIENDLY_Tattersail|r
    .goto 1157,42.08,66.24,8,0
    .goto 1157,39.91,68.31
    .complete 52978,1 --1/1 Speak with Dread-Admiral Tattersail to return
    .skipgossip 1
    .target Tattersail
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 52978 >>交任务: |cRXP_FRIENDLY_王子随行|r
    .accept 52183 >>接任务: |cRXP_WARN_计划已备|r
    .target 纳萨诺斯·凋零者
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 交谈, 等待剧情结束
    .gossipoption 48861
    .timer 30,Nathanos RP
    .complete 52183,1 --1/1 Listen to Nathanos' plan
    .target 纳萨诺斯·凋零者
step
    .goto 862,58.46,62.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔特赛尔|r交谈
    .complete 52183,2 --1/1 Speak with Tattersail to sail to Tiragarde Sound
    .goto 862,58.46,62.99
    .skipgossip 135690,1
    .target Dread-Admiral Tattersail
step
    .groundgoto 895,87.54,51.52,20,0
    .groundgoto 895,87.20,52.18,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 和 |cRXP_FRIENDLY_阿玛莉亚·斯通队长|r 交谈
    .turnin 52183 >>交任务: |cRXP_FRIENDLY_计划已备|r
    .accept 52186 >>接任务: |cRXP_WARN_大批守卫|r
    .goto 895,86.91,53.15
    .accept 52187 >>接任务: |cRXP_WARN_老同事|r
    .goto 895,86.96,53.12
    .target 纳萨诺斯·凋零者
    .target Captain Amalia Stone
step
    .isOnQuest 52187
    #completewith next
    .goto 895,87.23,52.72
    .gossipoption 48830 >>对话 |cRXP_FRIENDLY_霍巴特·钩锤|r
step
    #completewith ZandalariTrollOldColleagues
    >>击杀 |cRXP_ENEMY_普罗德摩尔守卫|r
    .complete 52186,1 --12/12 Proudmoore Guard slain
    .mob Proudmoore Guard
step
    >>击杀 |cRXP_ENEMY_加斯特罗德队长|r
    .goto 895,91.46,48.44,10,0
    .goto 895,91.40,47.94
    .complete 52187,1 --1/1 Captain Gastrod slain
    .mob Captain Gastrod
step
    #completewith next
    .goto 895,91.85,48.84,12,0
    .goto 895,91.75,48.43,8,0
    .goto 895,92.02,49.44,5,0
    .goto 895,92.24,49.22,10 >>进入船体内部
step
    >>进入船舱, 击杀 |cRXP_ENEMY_卫队指挥官特朗克萨尔|r
    .goto 895,92.06,49.66
    .complete 52187,2 --1/1 Guard-Commander Trunksal slain
    .mob Guard-Commander Trunksal
step
    #completewith next
    .goto 895,92.24,49.22,8,0
    .goto 895,92.02,49.44,8,0
    .goto 895,91.90,48.66,8,0
    .goto 895,91.75,48.43,8 >>返回上层
step
    #completewith next
    .goto 895,92.20,49.86
    .gossipoption 48789 >>对话 |cRXP_FRIENDLY_霍巴特·钩锤|r
step
    #label ZandalariTrollOldColleagues
    >>击杀 |cRXP_ENEMY_舵手米莉亚|r
    .groundgoto 895,92.09,51.70,12,0
    .goto 895,92.28,51.12
    .complete 52187,3 --1/1 Helmsman Miria slain
    .mob Helmsman Miria
step
    >>击杀船上的 |cRXP_ENEMY_普罗德摩尔守卫|r
    .complete 52186,1 --12/12 Proudmoore Guard slain
    .goto 895,92.08,51.44
    .mob Proudmoore Guard
step
    .isQuestComplete 52186
    #completewith next
    .noflyable 895
    .goto 895,91.59,52.16
    .gossipoption 48790 >>对话 |cRXP_FRIENDLY_霍巴特·钩锤|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_阿玛莉亚·斯通上尉|r交谈
    .turnin 52187 >>交任务: |cRXP_FRIENDLY_老同事|r
    .goto 895,86.96,53.12
    .turnin 52186 >>交任务: |cRXP_FRIENDLY_大批守卫|r
    .accept 52185 >>接任务: |cRXP_WARN_恰到好处的传送门|r
    .goto 895,86.91,53.15
    .target Captain Amalia Stone
step
    >>通过传送门前往伯拉勒斯
    .goto 895,86.94,52.46
    .complete 52185,1 --1/1 Portal to Boralus taken
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯·泽林|r交谈
    .goto 1161,71.19,84.79
    .turnin 52185 >>交任务: |cRXP_FRIENDLY_恰到好处的传送门|r
    .accept 52184 >>接任务: |cRXP_WARN_仪式圣物|r
    .accept 52188 >>接任务: |cRXP_WARN_海贤教诲|r
    .accept 52189 >>接任务: |cRXP_WARN_赔上灵魂|r
    .target 托马斯 Zelling
step
    #title 离开地窖
    #completewith next
    .goto 1161,70.47,86.07,8,0
    .goto 1161,70.02,85.34,8 >>离开地窖
step
    #completewith ZandalariTrollTidesageTeachings
    >>击杀 |cRXP_ENEMY_潮汐术士档案师|r
    .complete 52189,1 --8/8 Tidesages slain
step
    #title Tome 1/5
    >>从架子上拾取 |cRXP_PICK_典籍|r
    .goto 1161,69.82,83.82
    .complete 52188,1,1 --1/5 Tome of Tidesage Research
step
    >>击杀 |cRXP_ENEMY_档案管理员梅迪拉|r, 拾取 |cRXP_LOOT_指南针|r
    .goto 1161,67.69,81.66
    .complete 52184,1 --1/1 Compass of Clarity
step
    #title Tome 2/5
    >>从架子上拾取 |cRXP_PICK_典籍|r
    .goto 1161,67.82,82.15
    .complete 52188,1,2 --2/5 Tome of Tidesage Research
step
    #title Tome 3/5
    >>从架子上拾取 |cRXP_PICK_典籍|r
    .goto 1161,67.55,81.21
    .complete 52188,1,3 --3/5 Tome of Tidesage Research
step
    >>击杀 |cRXP_ENEMY_马林修士|r, 拾取 |cRXP_LOOT_珍奇物品|r
    .groundgoto 1161,68.75,81.89,15,0
    .groundgoto 1161,67.43,80.01,15,0
    .groundgoto 1161,65.99,82.05,15,0
    .goto 1161,64.01,80.10
    .complete 52184,2 --1/1 Curio of the Depths
step
    #title Tome 4/5
    >>从架子上拾取 |cRXP_PICK_典籍|r
    .goto 1161,63.86,79.35
    .complete 52188,1,4 --4/5 Tome of Tidesage Research
step
    >>击杀潮破者周围的 3 名 |cRXP_ENEMY_潮圣者召唤师|r, 击杀 |cRXP_ENEMY_解放的潮破者|r, 拾取 |cRXP_LOOT_钥匙|r
    .groundgoto 1161,63.63,82.78,15,0
    .goto 1161,59.60,86.54
    .complete 52184,3 --1/1 Key of the Sea
step
    #label ZandalariTrollTidesageTeachings
    #title Tome 5/5
    >>从架子上拾取 |cRXP_PICK_典籍|r
    .goto 1161,60.56,85.11
    .complete 52188,1 --5/5 Tome of Tidesage Research
step
    >>击杀 |cRXP_ENEMY_潮汐术士档案师|r
    .goto 1161,60.67,81.82,20,0
    .goto 1161,63.74,78.69,20,0
    .goto 1161,66.15,84.98,20,0
    .goto 1161,69.83,84.81,20,0
    .goto 1161,67.10,75.56,20,0
    .goto 1161,62.55,76.37,20,0
    .goto 1161,59.60,86.54,20,0
#loop
	.line 1161,60.67,81.82,66.15,84.98,67.10,75.56,59.60,86.54
	.goto 1161,60.67,81.82,25,0
	.goto 1161,66.15,84.98,25,0
	.goto 1161,67.10,75.56,25,0
	.goto 1161,59.60,86.54,25,0
    .complete 52189,1 --8/8 Tidesages slain
    .mob Tidesage Archivist
    .mob Tidesage Summoner
step
    #title 离开地窖
    #completewith next
    .goto 1161,70.30,85.73,8 >>进入地窖
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯·泽林|r交谈
    .goto 1161,71.19,84.78
    .turnin 52184 >>交任务: |cRXP_FRIENDLY_仪式圣物|r
    .turnin 52188 >>交任务: |cRXP_FRIENDLY_海贤教诲|r
    .turnin 52189 >>交任务: |cRXP_FRIENDLY_赔上灵魂|r
    .accept 52190 >>接任务: |cRXP_WARN_占据优势|r
    .target 托马斯 Zelling
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯·泽林|r交谈
    .goto 1161,71.19,84.78
    .skipgossip 1
    .complete 52190,1 --1/1 交谈 Zelling
    .target 托马斯 Zelling
step
    #title 离开地窖
    #completewith next
    .goto 1161,70.47,86.07,8,0
    .goto 1161,70.02,85.34,8 >>离开地窖
step
    #title 进入房屋
    #completewith next
    .goto 1161,70.74,82.25,8 >>进入房屋
step
    #title 前往地下室
    #completewith next
    .goto 1161,71.57,82.63,6,0
    .goto 1161,71.37,81.51,7 >>前往地下室
step
    >>放置 |cRXP_PICK_海洋之钥|r
    .goto 1161,71.15,82.59
    .complete 52190,2 --1/1 Begin the ritual
step
    >>保护 |cRXP_FRIENDLY_托马斯·泽林|r
    .goto 1161,71.15,82.24
    .complete 52190,3 --Zelling protected (100%)
    .mob Crawling Monstrosity
    .mob K'thir Guardian
step
    >>拾取 |cRXP_PICK_深渊节杖|r
    .goto 1161,71.14,82.63
    .complete 52190,4 --1/1 Abyssal Scepter
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯·泽林|r交谈
    .goto 1161,71.14,82.63
    .turnin 52190 >>交任务: |cRXP_FRIENDLY_占据优势|r
    .accept 52990 >>接任务: |cRXP_WARN_回到港口|r
    .target 托马斯 Zelling
step
    #title 离开地下室和房屋
    #completewith next
    .goto 1161,71.68,81.67,5,0
    .goto 1161,71.67,82.70,5,0
    .goto 1161,70.62,82.25,5 >>离开地下室和房屋
step
    #title 离开地窖
    #completewith next
    .goto 1161,70.30,85.73,8,0
    .goto 1161,71.10,85.30,6 >>进入地窖
step
    >>通过传送门前往掠夺港
    .goto 1161,70.87,84.32
    .complete 52990,1 --1/1 Portal to Plunder Harbor taken
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 895,86.91,53.14
    .turnin 52990 >>交任务: |cRXP_FRIENDLY_回到港口|r
    .accept 52191 >>接任务: |cRXP_WARN_人质劫持|r
    .target 纳萨诺斯·凋零者
step
    >>等待剧情演出
    .goto 895,87.21,52.12
    .complete 52191,1 --1/1 Walk with Nathanos
step
    >>击杀 |cRXP_ENEMY_卡达林将军|r
    .goto 895,87.50,52.29
    .complete 52191,2 --1/1 General Cadarin slain
    .mob General Cadarin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .groundgoto 895,87.20,52.18,10,0
    .goto 895,86.91,53.15
    .turnin 52191 >>交任务: |cRXP_FRIENDLY_人质劫持|r
    .accept 52192 >>接任务: |cRXP_WARN_潮汐助力|r
    .target 纳萨诺斯·凋零者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 895,86.91,53.15
    .skipgossip
    .complete 52192,1 --1/1 Speak with Nathanos
    .target 纳萨诺斯·凋零者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .goto 862,58.44,62.67
    .turnin 52192 >>交任务: |cRXP_FRIENDLY_潮汐助力|r
    .accept 53003 >>接任务: |cRXP_WARN_仇恨循环|r
    .target 纳萨诺斯·凋零者
step << Mage
    .isOnQuest 53003
    .zoneskip 1164
    .cast 3567>>使用传送:奥格瑞玛
step
    .isOnQuest 53003
    .zoneskip 1164
    .itemcount 65274,1
    .cooldown item,65274,>0,1
    .cast 89158>>使用协同披风
step
    .isOnQuest 53003
    .zoneskip 1164
    .itemcount 140192,1
    .cooldown item,140192,>0,1
    .zone 627 >>使用达拉然炉石
step
    .isOnQuest 53003
    .zoneskip 627,1
    .goto 627,55.27,23.97
    .zone 85 >>使用传送门前往奥格瑞玛
step
    #completewith next
    .isOnQuest 53003
    .zoneskip 85
    .noflyable 1165
    .goto 1165,50.62,84.87,20,0
    .goto 1165,52.10,90.14
    .fly The Great Seal >>飞往大封印
step
    #completewith next
    .isOnQuest 53003
    .zoneskip 85
    .goto 1165,49.95,42.16,15 >>进入大封印
step
    #completewith next
    .isOnQuest 53003
    .zoneskip 85
    .goto 1163,73.94,69.92
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与格罗玛什要塞内的 |cRXP_FRIENDLY_希尔瓦娜斯·风行者女士|r 交谈
    .goto 85,53.20,90.46,10,0
    .goto 85,49.83,75.38,10,0
    .goto 85,48.33,71.16
    .turnin 53003 >>交任务: |cRXP_FRIENDLY_仇恨循环|r
    .target 希尔瓦娜斯·风行者
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 08) 战役: 复仇之潮
#displayname 第 8 章 - 复仇之潮
<< Horde
step
    .noflyable 864
    #completewith ZandalariTrollOurWarContinues
    .goto 85,48.33,71.16
    .hs >>使用炉石传送到灵魂与你同在
step
    .zoneskip 1165
    #completewith ZandalariTrollOurWarContinues
    #title 通过传送门前往祖达萨
    .goto 85,53.42,90.44,10,0
    .goto 85,58.55,91.31
    .zone 1163 >>通过传送门前往祖达萨
step
    #label ZandalariTrollOurWarContinues
    .goto 862,58.43,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在船上对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .accept 53851 >>接任务: |cRXP_WARN_战火连绵|r
    .target 纳萨诺斯·凋零者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_希尔瓦娜斯·风行者|r
    .goto 862,58.44,62.56
    .skipgossip
    .complete 53851,1 --1/1 Speak with Sylvanas Windrunner
    .target 希尔瓦娜斯·风行者
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 53851 >>交任务: |cRXP_FRIENDLY_战火连绵|r
    .accept 53852 >>接任务: |cRXP_WARN_切断艾泽里特补给|r
    .target 纳萨诺斯·凋零者
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔特赛尔|r交谈
    .complete 53852,1 --1/1 Speak with Tattersail to sail to Tiragarde Sound
    .goto 862,58.46,62.99
    .skipgossip 1
    .target Dread-Admiral Tattersail
step
    #completewith next
    .noflyable 895
    .goto 895,87.27,50.66
    .fly Timberfell Outpost >>飞往橡木荒野前哨站
step
    .groundgoto 895,51.10,21.56,25,0
    .groundgoto 895,49.03,19.69,20,0
    .groundgoto 895,38.22,20.23,20,0
    .goto 895,47.52,21.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷克萨|r
    .turnin 53852 >>交任务: |cRXP_FRIENDLY_切断艾泽里特补给|r
    .accept 53856 >>接任务: |cRXP_WARN_部落的愤怒|r
    .target 雷克萨
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷克萨|r
    .goto 895,47.52,21.76
    .skipgossip 145422,1
    .complete 53856,1 --1/1 Horde army deployed
    .target 雷克萨
step
    .groundgoto 895,47.04,22.41,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷克萨|r 和 |cRXP_FRIENDLY_托马斯·泽林|r 交谈
    .turnin 53856 >>交任务: |cRXP_FRIENDLY_部落的愤怒|r
    .accept 53879 >>接任务: |cRXP_WARN_肃清庄园|r
    .accept 53880 >>接任务: |cRXP_WARN_艾泽里特战争机器|r
    .goto 895,48.92,24.99
    .target 雷克萨
    .target 托马斯 Zelling
step
    #completewith ZandalariTrollMachinesofWarAndAzerite
    >>击杀 |cRXP_ENEMY_光铸者|r 和 |cRXP_ENEMY_联盟部队|r
    .complete 53879,1 --Estate defenders disrupted (100%)
step
    #title Azerite Bomb Cluster 1/4
    >>拾取 |cRXP_PICK_艾泽里特炸弹|r
    .goto 895,49.33,25.58
    .complete 53880,1,1 --1/4 Azerite Bomb Cluster
step
    #title Azerite Bomb Cluster 2/4
    >>拾取 |cRXP_PICK_艾泽里特炸弹|r
    .goto 895,49.76,25.33
    .complete 53880,1,2 --2/4 Azerite Bomb Cluster
step
    #title Azerite Rifle 1/3
    >>拾取 |cRXP_PICK_艾泽里特武器宝箱|r
    .goto 895,49.96,25.86
    .complete 53880,2,1 --1/3 Azerite Rifle
step
    #title Azerite Bomb Cluster 3/4
    >>拾取 |cRXP_PICK_艾泽里特炸弹|r
    .goto 895,49.62,26.19
    .complete 53880,1,3 --3/4 Azerite Bomb Cluster
step
    #title Azerite Rifle 2/3
    >>拾取 |cRXP_PICK_艾泽里特武器宝箱|r
    .goto 895,49.83,26.72
    .complete 53880,2,2 --2/3 Azerite Rifle
step
    #title Azerite Bomb Cluster 4/4
    >>拾取 |cRXP_PICK_艾泽里特炸弹|r
    .goto 895,50.64,26.57
    .complete 53880,1 --4/4 Azerite Bomb Cluster
step
    #label ZandalariTrollMachinesofWarAndAzerite
    #title Azerite Rifle 3/3
    >>拾取 |cRXP_PICK_艾泽里特武器宝箱|r
    .goto 895,50.86,26.00
    .complete 53880,2 --3/3 Azerite Rifle
step
    >>击杀 |cRXP_ENEMY_光铸者|r 和 |cRXP_ENEMY_联盟部队|r
    .goto 895,51.60,25.90,25,0
    .goto 895,51.65,28.24,25,0
    .goto 895,49.76,27.49,25,0
    .goto 895,50.06,24.70,25,0
#loop
	.line 895,51.60,25.90,51.65,28.24,49.76,27.49,50.06,24.70
	.goto 895,51.60,25.90,28,0
	.goto 895,51.65,28.24,28,0
	.goto 895,49.76,27.49,28,0
	.goto 895,50.06,24.70,28,0
    .complete 53879,1 --Estate defenders disrupted (100%)
step
    .goto 895,51.24,26.56
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷克萨|r 和 |cRXP_FRIENDLY_托马斯·泽林|r 交谈
    .turnin 53879 >>交任务: |cRXP_FRIENDLY_肃清庄园|r
    .turnin 53880 >>交任务: |cRXP_FRIENDLY_艾泽里特战争机器|r
    .accept 53913 >>接任务: |cRXP_WARN_荣耀之战|r
    .target 雷克萨
    .target 托马斯 Zelling
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷克萨|r 交谈, 按 ESC 跳过过场动画
    .goto 895,51.24,26.56
    .skipgossip 146462,1
    .complete 53913,1 --1/1 Speak with Rexxar to face Lieutenant Cole
    .target 雷克萨
step
    >>击杀 |cRXP_ENEMY_艾泽里特坦克|r 和 |cRXP_ENEMY_科尔中尉|r
    .goto 895,50.95,26.91
    .complete 53913,2 --1/1 Lieutenant Cole slain
    .mob Azerite Tank
    .mob Lieutenant Cole
step
    .goto 895,50.95,26.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷克萨|r
    .turnin 53913 >>交任务: |cRXP_FRIENDLY_荣耀之战|r
    .accept 53912 >>接任务: |cRXP_WARN_狩猎永不停歇|r
    .target 雷克萨
step
    >>跟随箭头指引
    .goto 895,52.86,30.46
    .complete 53912,1 --Approach Norwington manor
step
    .goto 895,53.02,30.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷克萨|r 交谈, 按 ESC 跳过过场动画
    .turnin 53912 >>交任务: |cRXP_FRIENDLY_狩猎永不停歇|r
    .accept 53973 >>接任务: |cRXP_WARN_出击迎敌|r
    .target 雷克萨
step
    >>骑乘 |cRXP_FRIENDLY_旋翼机|r
    .goto 895,53.04,30.33
    .complete 53973,1 --1/1 Goblin gyrocopter boarded
step
    >>冷却好后使用 (2) |T463515:0|t[艾泽里特轰炸], 否则持续使用 (1) |T2065561:0|t[艾泽里特大炮]
    .goto 895,53.04,30.33
    .complete 53973,2 --Alliance army defeated (100%)
step
    .goto 895,47.41,21.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_雷克萨|r
    .turnin 53973 >>交任务: |cRXP_FRIENDLY_出击迎敌|r
    .accept 53981 >>接任务: |cRXP_WARN_旗开得胜|r
    .target 雷克萨
step
    #completewith next
    .noflyable 895
    .goto 895,41.19,23.53,25,0
    .goto 895,41.49,22.26,12,0
    .goto 895,39.29,16.56,18,0
    .goto 895,39.60,17.84,11,0
    .goto 895,39.68,18.54
    .fly Plunder Harbor >>飞往掠夺港
step
    #completewith next
    .goto 895,87.84,51.18
    .gossipoption 48794 >>与|cRXP_FRIENDLY_埃鲁尔·晨溪|r交谈以返回祖尔达萨
step
    .goto 862,58.44,62.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 53981 >>交任务: |cRXP_FRIENDLY_旗开得胜|r
    .accept 53941 >>接任务: |cRXP_WARN_地精机甲|r
    .target 纳萨诺斯·凋零者
step
    .groundgoto 1165,44.45,81.72,20,0
    .groundgoto 1165,50.92,56.26,30,0
    .groundgoto 1165,47.46,59.69,15,0
    .groundgoto 1165,45.50,60.06,15,0
    .groundgoto 1165,45.50,61.78,15,0
    .groundgoto 1165,41.00,72.33,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_贸易大王加里维克斯|r 和 |cRXP_FRIENDLY_帕奇|r 交谈
    .turnin 53941 >>交任务: |cRXP_FRIENDLY_地精机甲|r
    .accept 54123 >>接任务: |cRXP_WARN_它应该在我的机甲里！|r
    .goto 862,36.32,72.03
    .accept 54124 >>接任务: |cRXP_WARN_别吃官司|r
    .goto 862,36.25,72.02
    .target 贸易大王加里维克斯
    .target 补丁
step
    #completewith ZandalariTrollsAvoidingLawsuits
    >>使用 |T134519:0|t[艾泽里特真空器] 吸走 |cRXP_ENEMY_艾泽里特淤泥|r
    .use 166309
    .complete 54123,1 --Azerite pack fueled (100%)
    .mob Azerite Muck
step
    #title Worker healed 1/6
    >>点击或使用治疗法术治疗 |cRXP_FRIENDLY_无保险的地精工人|r
    .goto 862,35.48,70.84
    .complete 54124,1,1 --1/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    #title Worker healed 2/6
    >>点击或使用治疗法术治疗 |cRXP_FRIENDLY_无保险的地精工人|r
    .goto 862,35.16,71.30
    .complete 54124,1,2 --2/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    #title Worker healed 3/6
    >>点击或使用治疗法术治疗 |cRXP_FRIENDLY_无保险的地精工人|r
    .goto 862,35.19,71.99
    .complete 54124,1,3 --3/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    #title Worker healed 4/6
    >>点击或使用治疗法术治疗 |cRXP_FRIENDLY_无保险的地精工人|r
    .goto 862,34.69,71.74
    .complete 54124,1,4 --4/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    #title Worker healed 5/6
    >>点击或使用治疗法术治疗 |cRXP_FRIENDLY_无保险的地精工人|r
    .goto 862,34.94,71.00
    .complete 54124,1,5 --5/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    #label ZandalariTrollsAvoidingLawsuits
    #title Worker healed 6/6
    >>点击或使用治疗法术治疗 |cRXP_FRIENDLY_无保险的地精工人|r
    .goto 862,34.98,70.03
    .complete 54124,1 --6/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    >>使用 |T134519:0|t[艾泽里特真空器] 吸走 |cRXP_ENEMY_艾泽里特淤泥|r
    .use 166309
    .goto 862,35.60,69.40,25,0
    .goto 862,32.82,70.35,25,0
    .goto 862,35.08,71.80,25,0
#loop
	.line 862,35.60,69.40,32.82,70.35,35.08,71.80
	.goto 862,35.60,69.40,25,0
	.goto 862,32.82,70.35,25,0
	.goto 862,35.08,71.80,25,0
    .complete 54123,1 --Azerite pack fueled (100%)
    .mob Azerite Muck
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_帕奇|r 和 |cRXP_FRIENDLY_贸易大王加里维克斯|r 交谈
    .turnin 54124 >>交任务: |cRXP_FRIENDLY_别吃官司|r
    .goto 862,36.25,72.02
    .turnin 54123 >>交任务: |cRXP_FRIENDLY_它应该在我的机甲里！|r
    .accept 53942 >>接任务: |cRXP_WARN_毁天灭地之无敌机甲|r
    .goto 862,36.31,72.02
    .target 补丁
    .target 贸易大王加里维克斯
step
    #completewith next
    .goto 862,36.29,72.13
    .vehicle 145754 >>骑乘 G.M.O.D.
step
    >>等待剧情演出
    .complete 53942,1 --1/1 Fly the G.M.O.D to 德鲁斯瓦
step
    >>冷却好后使用 (2) |T236171:0|t[艾泽里特践踏], 否则使用 (1) |T252185:0|t[艾泽里特爆破] 击杀怪物
    .goto 896,37.37,24.59,15,0
    .goto 896,37.13,27.57,20,0
    .goto 896,37.62,29.45,20,0
#loop
	.line 896,37.37,24.59,37.13,27.57,37.62,29.45
	.goto 896,37.37,24.59,20,0
	.goto 896,37.13,27.57,20,0
	.goto 896,37.62,29.45,20,0
    .complete 53942,2 --30/30 Eliminate mechs within Krazzlefrazz Outpost
step
    >>冷却好后使用 (2) |T236171:0|t[艾泽里特践踏], 否则使用 (1) |T252185:0|t[艾泽里特爆破] 击杀怪物
    .goto 896,37.64,32.50,25,0
    .goto 896,36.37,36.59,25,0
    .goto 896,38.99,35.51,25,0
    .goto 896,40.30,37.86,25,0
#loop
	.line 896,37.64,32.50,36.37,36.59,38.99,35.51,40.30,37.86
	.goto 896,37.64,32.50,25,0
	.goto 896,36.37,36.59,25,0
	.goto 896,38.99,35.51,25,0
	.goto 896,40.30,37.86,25,0
    .complete 53942,3 --50/50 Repel mech army within Arom's Crossing
step
    >>在当前位置使用 |T237290:0|t[大红按钮] (3)
    .goto 896,35.30,35.80
    .complete 53942,4 --1/1 Big red button pushed
step
    .goto 896,37.16,25.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_克拉兹莱弗拉兹教授|r交谈
    .turnin 53942 >>交任务: |cRXP_FRIENDLY_毁天灭地之无敌机甲|r
    .target Professor Krazzlefrazz
step
    .goto 896,37.30,26.00
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_G.M.O.D|r交谈
    .accept 54128 >>接任务: |cRXP_WARN_必要的防范措施|r
    .complete 54128,1 --1/1 G.M.O.D reviewed
    .turnin 54128 >>交任务: |cRXP_FRIENDLY_必要的防范措施|r
    .accept 54004 >>接任务: |cRXP_WARN_测试样例#1；机甲对战梅卡托克|r
    .skipgossip 145816,1
    .target G.M.O.D
step
    #completewith next
    .goto 896,37.30,26.00
    .vehicle 146062 >>骑乘 G.M.O.D.
step
    >>等待剧情结束, 有机会时使用 |T237290:0|t[大红按钮] (1)
    .goto 896,75.97,56.01
    .complete 54004,1 --1/1 Ride G.M.O.D to face Mekkatorque
step
    .goto 895,54.60,64.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_贸易大王加里维克斯|r
    .turnin 54004 >>交任务: |cRXP_FRIENDLY_测试样例#1；机甲对战梅卡托克|r
    .accept 54007 >>接任务: |cRXP_WARN_保险措施|r
    .target 贸易大王加里维克斯
step
    >>与 |cRXP_FRIENDLY_G.M.O.D|r 互动 3 次
    .goto 895,54.63,64.42
    .complete 54007,1 --1/1 Call for roadside assistance
    .complete 54007,2 --1/1 Try calling roadside assistance again
    .complete 54007,3 --1/1 Keep pushing buttons until something happens
step
    .goto 895,54.60,64.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_贸易大王加里维克斯|r
    .turnin 54007 >>交任务: |cRXP_FRIENDLY_保险措施|r
    .accept 54009 >>接任务: |cRXP_WARN_地精战事|r
    .accept 54008 >>接任务: |cRXP_WARN_保险续费|r
    .target 贸易大王加里维克斯
step
    #completewith ZandalariTrollMekkatorquesBattlePlans
    >>击杀 |cRXP_ENEMY_侏儒技师|r 和 |cRXP_ENEMY_维吉尔山海军陆战队员|r
    .complete 54009,1 --15/15 Alliance and Kul Tiran forces slain
    .mob Vigil Hill Marine
    .mob 侏儒技师
step
    #completewith ZandalariTrollInsuranceRenewal
    >>击杀联盟部队, 拾取联盟作战计划并使用它接取任务
    .accept 54022 >>接任务: |cRXP_WARN_梅卡托克的作战计划|r
step
    >>打开笼子
    .goto 895,56.21,64.50
    .complete 54008,1 --1/1 Fizzle rescued
step
    >>打开笼子
    .goto 895,57.08,62.87
    .complete 54008,3 --1/1 Scowler Scampy rescued
step
    #label ZandalariTrollInsuranceRenewal
    >>打开笼子
    .goto 895,58.28,60.66
    .complete 54008,2 --1/1 Puggi Blasthops rescued
step
    >>击杀联盟部队, 拾取联盟作战计划并使用它接取任务
    .goto 895,58.96,61.93,20,0
    .goto 895,56.85,59.63,25,0
    .goto 895,55.81,60.55,35,0
    .goto 895,56.16,63.98,25,0
    .goto 895,57.13,63.10,25,0
#loop
	.line 895,58.96,61.93,56.85,59.63,55.81,60.55,56.16,63.98,57.13,63.10
	.goto 895,58.96,61.93,25,0
	.goto 895,56.85,59.63,25,0
	.goto 895,55.81,60.55,25,0
	.goto 895,56.16,63.98,25,0
	.goto 895,57.13,63.10,25,0
    .accept 54022 >>接任务: |cRXP_WARN_梅卡托克的作战计划|r
step
    #label ZandalariTrollMekkatorquesBattlePlans
    >>在帐篷内拾取 |cRXP_PICK_梅卡托克的作战计划|r
    .goto 895,59.12,61.80
    .complete 54022,1 --1/1 Mekkatorque's Battle Plans
step
    >>击杀 |cRXP_ENEMY_侏儒技师|r 和 |cRXP_ENEMY_维吉尔山海军陆战队员|r
    .goto 895,58.96,61.93,20,0
    .goto 895,56.85,59.63,25,0
    .goto 895,55.81,60.55,35,0
    .goto 895,56.16,63.98,25,0
    .goto 895,57.13,63.10,25,0
#loop
	.line 895,58.96,61.93,56.85,59.63,55.81,60.55,56.16,63.98,57.13,63.10
	.goto 895,58.96,61.93,25,0
	.goto 895,56.85,59.63,25,0
	.goto 895,55.81,60.55,25,0
	.goto 895,56.16,63.98,25,0
	.goto 895,57.13,63.10,25,0
    .complete 54009,1 --15/15 Alliance and Kul Tiran forces slain
    .mob Vigil Hill Marine
    .mob 侏儒技师
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_贸易大王加里维克斯|r
    .goto 895,54.60,64.58
    .turnin 54008 >>交任务: |cRXP_FRIENDLY_保险续费|r
    .turnin 54009 >>交任务: |cRXP_FRIENDLY_地精战事|r
    .turnin 54022 >>交任务: |cRXP_FRIENDLY_梅卡托克的作战计划|r
    .accept 54028 >>接任务: |cRXP_WARN_机甲对飞艇|r
    .target 贸易大王加里维克斯
step
    >>骑乘 |cRXP_FRIENDLY_G.M.O.D|r
    .goto 895,54.61,64.65
    .complete 54028,1 --1/1 Board G.M.O.D
    .timer 34,Flight RP
step
    >>等待剧情结束, |T2032581:0|t[艾泽里特大炮] (1) 可用时瞄准飞船
    .goto 895,54.61,64.65
    .complete 54028,2 --Wreck the Alliance Airship (100%)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_G.M.O.D|r交谈
    .goto 895,68.05,84.11
    .skipgossip
    .complete 54028,3 --1/1 Speak with Gallywix to sound the SOS
    .target G.M.O.D
step    
    >>击败 |cRXP_ENEMY_大工匠梅卡托克|r, 击杀 |cRXP_ENEMY_超磁发生器|r
    .goto 895,67.84,84.28
    .complete 54028,4 --1/1 Confront Mekkatorque
    .timer 30, Flight RP
    .mob 大工匠梅卡托克
    .mob Ultra Magnetizer
step
    .goto 895,87.63,53.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 对话 |cRXP_FRIENDLY_G.M.O.D|r
    .turnin 54028 >>交任务: |cRXP_FRIENDLY_机甲对飞艇|r
    .accept 54094 >>接任务: |cRXP_WARN_地精成功学|r
    .target G.M.O.D
step
    #completewith next
    .goto 895,87.84,51.18
    .gossipoption 48794 >>与|cRXP_FRIENDLY_埃鲁尔·晨溪|r交谈以返回祖尔达萨
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 54094 >>交任务: |cRXP_FRIENDLY_地精成功学|r
    .accept 54121 >>接任务: |cRXP_WARN_救出艾什凡|r
    .target 纳萨诺斯·凋零者
step
    #completewith next
    .goto 862,58.46,62.99
    .skipgossip 1
    .zone 895 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔特萨尔|r 交谈, 乘船前往提拉加德海峡
    .target Dread-Admiral Tattersail
step
    .groundgoto 895,87.04,51.89,20,0
    .groundgoto 895,85.28,51.76,20,0
    .groundgoto 895,84.75,51.65,14,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cFF00FF2N奥术师瓦尔特罗伊|r 和 |cFF00FF2N雷克萨|r 交谈
    .turnin 54121 >>交任务: |cRXP_FRIENDLY_救出艾什凡|r
    .accept 54175 >>接任务: |cRXP_WARN_观察敌人|r
    .accept 54176 >>接任务: |cRXP_WARN_统一制服|r
    .goto 895,82.94,49.54
    .accept 54177 >>接任务: |cRXP_WARN_扰乱计划|r
    .goto 895,83.00,49.65
    .target 奥术师瓦尔特洛伊
    .target 雷克萨
step
    #completewith ZandalariTrollFaceYourEnemy
    >>击杀 |cRXP_ENEMY_普罗德摩尔|r 部队, 拾取其战利品
    .complete 54176,1 --12/12 Proudmoore Equipment
    .mob Proudmoore Sentry
    .mob Proudmoore Infantry
    .mob Proudmoore Defender
step
    >>对 |cRXP_ENEMY_奥利·橡木人|r 使用 |T135144:0|t[维萨拉碎片]
    .goto 895,81.54,48.44
    .use 165702
    .complete 54175,3 --1/1 Ollie Oakman sent
    .mob 翱骊 Oakman
step
    #title Volatile Azerite 1/8
    >>拾取不稳定的艾泽里特武器
    .goto 895,81.55,48.62
    .complete 54177,1,1 --1/8 Volatile Azerite
step
    #title Volatile Azerite 2/8
    >>拾取不稳定的艾泽里特武器
    .goto 895,81.55,49.20
    .complete 54177,1,2 --2/8 Volatile Azerite
step
    #title Volatile Azerite 3/8
    >>拾取不稳定的艾泽里特武器
    .goto 895,81.16,49.37
    .complete 54177,1,3 --3/8 Volatile Azerite
step
    #title Volatile Azerite 4/8
    >>拾取不稳定的艾泽里特武器
    .goto 895,80.79,49.52
    .complete 54177,1,4 --4/8 Volatile Azerite
step
    #title Volatile Azerite 5/8
    >>拾取不稳定的艾泽里特武器
    .goto 895,79.49,49.58
    .complete 54177,1,5 --5/8 Volatile Azerite
step
    >>对 |cRXP_ENEMY_德鲁西拉·白刃|r 使用 |T135144:0|t[维萨拉碎片]
    .goto 895,79.31,49.57
    .use 165702
    .complete 54175,1 --1/1 Drusilla Whiteblade sent
    .mob Drusilla Whiteblade
step
    #title Volatile Azerite 6/8
    >>拾取不稳定的艾泽里特武器
    .goto 895,79.16,49.24
    .complete 54177,1,6 --6/8 Volatile Azerite
step
    #title Volatile Azerite 7/8
    >>拾取不稳定的艾泽里特武器
    .goto 895,79.19,49.06
    .complete 54177,1,7 --7/8 Volatile Azerite
step
    #title Volatile Azerite 8/8
    >>拾取不稳定的艾泽里特武器
    .goto 895,79.24,47.35
    .complete 54177,1 --8/8 Volatile Azerite
step
    >>击杀 |cRXP_ENEMY_塞拉菲娜船长|r, 拾取其 |cRXP_LOOT_外套|r
    .goto 895,79.10,46.97
    .complete 54176,2 --1/1 Captain's Overcoat
    .mob Captain Serafina
step
    #label ZandalariTrollFaceYourEnemy
    >>对 |cRXP_ENEMY_罗西·沃克|r 使用 |T135144:0|t[维萨拉碎片]
    .goto 895,80.47,45.95
    .use 165702
    .complete 54175,2 --1/1 Rosie Walker sent
    .mob Rosie Walker
step
    >>击杀 |cRXP_ENEMY_普罗德摩尔|r 部队, 拾取其战利品
    .goto 895,81.54,48.44,25,0
    .goto 895,79.31,49.57,25,0
    .goto 895,80.47,45.95,25,0
#loop
	.line 895,81.54,48.44,79.31,49.57,80.47,45.95
	.goto 895,81.54,48.44,25,0
	.goto 895,79.31,49.57,25,0
	.goto 895,80.47,45.95,25,0
    .complete 54176,1 --12/12 Proudmoore Equipment
    .mob Proudmoore Sentry
    .mob Proudmoore Infantry
    .mob Proudmoore Defender
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cFF00FF2N雷克萨|r 和 |cFF00FF2N奥术师瓦尔特罗斯|r 交谈
    .turnin 54177 >>交任务: |cRXP_FRIENDLY_扰乱计划|r
    .goto 895,83.00,49.65
    .turnin 54176 >>交任务: |cRXP_FRIENDLY_统一制服|r
    .turnin 54175 >>交任务: |cRXP_FRIENDLY_观察敌人|r
    .accept 54178 >>接任务: |cRXP_WARN_搭便车|r
    .goto 895,82.95,49.53
    .target 奥术师瓦尔特洛伊
    .target 雷克萨
step
    .groundgoto 895,84.78,51.67,15,0
    .goto 895,88.20,50.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 54178 >>交任务: |cRXP_FRIENDLY_搭便车|r
    .accept 54179 >>接任务: |cRXP_WARN_穿过前门|r
    .target 纳萨诺斯·凋零者
step
    #completewith ZandalariTrollsEscapefromTolDagor
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r 交谈, 完成场景任务
    .goto 895,88.20,50.75,0,0
    .skipgossip 1
    .complete 54179,1 --1/1 Scenario "Escape from Tol Dagor" completed
    .target 纳萨诺斯·凋零者
step
    .isOnQuest 54179
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守卫阿米卡尔|r交谈.等待剧情发展
    .goto 1349,32.01,66.37,20,0
    .goto 1349,38.94,70.67
    .skipgossip
    .timer 34,Warden Amical RP
    .scenario 4033,1
    .target Warden Amical
step
    .isOnQuest 54179
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_普罗德摩尔保卫者|r或|cRXP_FRIENDLY_普罗德摩尔哨兵|r交谈
    .goto 1351,50.17,84.14
    .skipgossip
    .scenario 4035,1
    .target Proudmoore Defender
    .target Proudmoore Sentry
step
    .isOnQuest 54179
    >>从桌上拾取 |cRXP_PICK_万能钥匙|r
    .goto 1351,50.66,84.43
    .scenario 4035,2
step
    .isOnQuest 54179
    >>等待短暂剧情结束, 打开牢房门
    .goto 1351,47.08,74.90,10,0
    .goto 1351,57.80,58.21
    .scenario 4036,1
step
    .isOnQuest 54179
    #title Prisoner freed 2/10
    >>打开牢房门
    .goto 1351,54.02,66.55
    .scenario 4037,1,2 --2/10 Ashvane Prisoner freed
step
    .isOnQuest 54179
    #title Prisoner freed 4/10
    >>打开牢房门
    .goto 1351,52.23,70.67
    .scenario 4037,1,4 --4/10 Ashvane Prisoner freed
step
    .isOnQuest 54179
    #title Prisoner freed 5/10
    >>打开牢房门
    .goto 1351,50.40,74.96
    .scenario 4037,1,5 --5/10 Ashvane Prisoner freed
step
    .isOnQuest 54179
    #title Prisoner freed 7/10
    >>打开牢房门
    .goto 1351,35.37,58.81
    .scenario 4037,1,7 --7/10 Ashvane Prisoner freed
step
    .isOnQuest 54179
    #title Prisoner freed 8/10
    >>打开牢房门
    .goto 1351,37.24,54.57
    .scenario 4037,1,8 --8/10 Ashvane Prisoner freed
step
    .isOnQuest 54179
    #title Prisoner freed 9/10
    >>打开牢房门
    .goto 1351,41.01,46.23
    .scenario 4037,1,9 --9/10 Ashvane Prisoner freed
step
    .isOnQuest 54179
    #title Prisoner freed 10/10
    >>打开牢房门
    .goto 1351,42.92,41.94
    .scenario 4037,1 --10/10 Ashvane Prisoner freed
step
    .isOnQuest 54179
    #completewith next
    .goto 1350,50.75,17.71,10,0
    .goto 1350,66.86,35.18,10,0
    .goto 1350,61.45,42.82,8,0
    .goto 1350,50.24,36.71,10 >>往下走
step
    .isOnQuest 54179
    #title Explosives set 1/4
    >>放置 |cRXP_PICK_不稳定的艾泽里特武器|r
    .goto 1350,32.94,71.59
    .scenario 4047,1,1 --1/4 Set explosives in the drain
step
    .isOnQuest 54179
    #title Explosives set 2/4
    >>放置 |cRXP_PICK_不稳定的艾泽里特武器|r
    .goto 1350,46.20,86.12
    .scenario 4047,1,2 --2/4 Set explosives in the drain
step
    .isOnQuest 54179
    #title Explosives set 3/4
    >>放置 |cRXP_PICK_不稳定的艾泽里特武器|r
    .goto 1350,59.69,61.12
    .scenario 4047,1,3 --3/4 Set explosives in the drain
step
    .isOnQuest 54179
    #title Explosives set 4/4
    >>放置 |cRXP_PICK_不稳定的艾泽里特武器|r
    .goto 1350,63.92,44.53
    .scenario 4047,1 --4/4 Set explosives in the drain
step
    .isOnQuest 54179
    >>离开下水道
    .goto 1349,51.45,47.96
    .scenario 4047,2
step
    .isOnQuest 54179
    >>击杀 |cRXP_ENEMY_典狱长阿米卡尔|r
    .goto 1349,54.70,54.80
    .scenario 4038,1 --1/1 Kill Warden Amical
    .mob Warden Amical
step
    #label ZandalariTrollsEscapefromTolDagor
    .isOnQuest 54179
    >>跟随箭头前往船只位置
    .scenario 4045,1 --1/1 Get to the Ship
    .goto 1349,50.74,72.13
step
    #completewith next
    .goto 895,87.84,51.18
    .gossipoption 48794 >>与|cRXP_FRIENDLY_埃鲁尔·晨溪|r交谈以返回祖尔达萨
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_纳萨诺斯·凋零者|r
    .turnin 54179 >>交任务: |cRXP_FRIENDLY_穿过前门|r
    .accept 54139 >>接任务: |cRXP_WARN_战争降临|r
    .target 纳萨诺斯·凋零者
step
    #completewith next
    .noflyable 1165
    .goto 1165,50.32,99.92,10,0
    .goto 1165,50.59,85.57,15,0
    .goto 1165,52.09,90.13
    .fly The Great Seal >>飞往大封印
step
    #completewith next
    .goto 1165,49.95,42.28,10 >>进入大封印
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉斯塔哈大王|r交谈
    .goto 1164,39.94,70.17
    .complete 54139,1 --1/1 Speak with 拉斯塔哈大王
    .skipgossip
    .target 拉斯塔哈大王
step
    .goto 1164,41.26,66.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .turnin 54139 >>交任务: |cRXP_FRIENDLY_战争降临|r
    .accept 54140 >>接任务: |cRXP_WARN_赞达拉大军|r
    .target 公主 Talanji
step
    #completewith next
    .goto 1165,49.95,42.28,10 >>离开大封印
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷佐昆队长|r交谈.按"ESC"键跳过接下来的过场动画
    .goto 1165,49.09,41.29
    .complete 54140,1 --1/1 Speak with Captain Rez'okun to mobilize the fleet
    .skipgossip 1
    .target Captain Rez'okun
step
    #completewith next
    .noflyable 1165
    .goto 1165,48.51,38.03,12,0
    .goto 1165,45.26,37.07,20,0
    .goto 1165,42.85,27.88,20,0
    .goto 1165,39.19,26.72,20 >>跳下金字塔
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉克拉将军|r交谈
    .goto 862,52.95,40.16
    .skipgossip 1
    .complete 54140,2 --1/1 Speak with General Rakera to mobilize the army
    .target General Rakera
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉尔洛克索大领主|r交谈
    .groundgoto 1165,39.26,26.76,20,0
    .groundgoto 1165,45.38,23.82,15,0
    .goto 1165,52.82,11.86
    .complete 54140,3 --1/1 Speak with Hexlord Raal to mobilize aerial forces
    .skipgossip 1
    .target Hexlord Raal
step
    #completewith next
    .noflyable 1165
    .goto 1165,52.96,11.67
    .vehicle 149509>>骑上 |cRXP_FRIENDLY_翼王阿塔|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r和|cRXP_FRIENDLY_拉克拉将军|r交谈
    .turnin 54140 >>交任务: |cRXP_FRIENDLY_赞达拉大军|r
    .accept 54157 >>接任务: |cRXP_WARN_一个都不能少|r
    .goto 862,57.95,21.26
    .accept 54156 >>接任务: |cRXP_WARN_鲜血之路|r
    .goto 862,57.95,21.31
    .target 公主 Talanji
    .target General Rakera
step
    #completewith next
    >>击杀 |cRXP_ENEMY_第七军团|r 部队
    .complete 54156,1 --15/15 Alliance forces slain
    .mob 第七军团水兵
    .mob 第七军团火枪手
step
    >>削弱 |cRXP_ENEMY_刀锋大师特拉莫恩|r 以解救洛坎
    .goto 862,59.07,18.46
    .complete 54157,1 --1/1 Rokhan rescued
    .mob Blademaster Telaamon
step
    >>击杀 |cRXP_ENEMY_第七军团|r 部队
    .goto 862,58.91,20.89,25,0
    .goto 862,56.85,20.47,35,0
    .goto 862,58.03,18.83,25,0
#loop
	.line 862,58.91,20.89,56.85,20.47,58.03,18.83,58.91,20.89
	.goto 862,58.91,20.89,30,0
	.goto 862,56.85,20.47,30,0
	.goto 862,58.03,18.83,30,0
	.goto 862,58.91,20.89,30,0
    .complete 54156,1 --15/15 Alliance forces slain
    .mob 第七军团水兵
    .mob 第七军团火枪手
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r和|cRXP_FRIENDLY_拉克拉将军|r交谈
    .turnin 54157 >>交任务: |cRXP_FRIENDLY_无人掉队|r
    .goto 862,57.95,21.26
    .turnin 54156 >>交任务: |cRXP_FRIENDLY_血色之路|r
    .accept 54207 >>接任务: |cRXP_WARN_重夺岗哨|r
    .goto 862,57.96,21.31
    .target 公主 Talanji
    .target General Rakera
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_妖术领主拉尔|r 和 |cRXP_FRIENDLY_帕奇|r 交谈
    .turnin 54207 >>交任务: |cRXP_FRIENDLY_夺回前哨站|r
    .goto 863,50.27,78.47
    .accept 54211 >>接任务: |cRXP_WARN_地精小队大营救|r
    .accept 54212 >>接任务: |cRXP_WARN_重建灭世空战机甲|r
    .goto 863,50.30,78.42
    .target Hexlord Raal
    .target 补丁
step
    #completewith ZandalariTrollPuttingtheGobinGobSquad
    >>击杀 |cRXP_ENEMY_吉尔尼斯伏击者|r 和 |cRXP_ENEMY_暗夜精灵哨兵|r, 拾取 |cRXP_LOOT_A.F.M.O.D. 零件|r
    .complete 54212,1 --10/10 A.F.M.O.D. Part
    .mob 吉尔nean Ambusher
    .mob 暗夜精灵哨兵
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_钟摆|r
    .goto 863,49.46,79.75
    .complete 54211,1 --1/1 Ticker found
    .target 钟摆
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_蝾螈|r
    .goto 863,48.26,78.99
    .complete 54211,2 --1/1 Newt found
    .target 蝾螈
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_伏特|r
    .goto 863,47.94,76.93
    .complete 54211,4 --1/1 Volt found
    .target 伏特
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_沙砾|r
    .goto 863,47.94,76.93
    .complete 54211,3 --1/1 Grit found
    .target 沙砾
step
    >>击杀 |cRXP_ENEMY_吉尔尼斯伏击者|r 和 |cRXP_ENEMY_暗夜精灵哨兵|r, 拾取 |cRXP_LOOT_A.F.M.O.D. 零件|r
    .goto 863,45.68,77.56,25,0
    .goto 863,46.61,80.39,25,0
    .goto 863,49.34,80.99,25,0
    .goto 863,49.00,76.49,25,0
    .goto 863,47.50,77.98,25,0
#loop
	.line 863,45.68,77.56,46.61,80.39,49.34,80.99,49.00,76.49,47.50,77.98
	.goto 863,45.68,77.56,25,0
	.goto 863,46.61,80.39,25,0
	.goto 863,49.34,80.99,25,0
	.goto 863,49.00,76.49,25,0
	.goto 863,47.50,77.98,25,0
    .complete 54212,1 --10/10 A.F.M.O.D. Part
    .mob 吉尔nean Ambusher
    .mob 暗夜精灵哨兵
step
    .goto 863,50.30,78.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_Patch|r
    .turnin 54211 >>交任务: |cRXP_FRIENDLY_地精小队大营救|r
    .turnin 54212 >>交任务: |cRXP_FRIENDLY_重建灭世空战机甲|r
    .accept 54213 >>接任务: |cRXP_WARN_它活了！|r
    .target 补丁
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .goto 863,50.36,78.46
    .skipgossip 1
    .timer 13,Talanji RP
    .complete 54213,1 --1/1 Speak with Talanji to power up the A.F.M.O.D.
    .target 公主 Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_帕奇|r 和 |cRXP_FRIENDLY_塔兰吉公主|r 交谈
    .turnin 54213 >>交任务: |cRXP_FRIENDLY_它活了！|r
    .goto 863,50.30,78.41
    .accept 54224 >>接任务: |cRXP_WARN_祖尔加废墟之战|r
    .goto 863,50.36,78.46
    .target 补丁
    .target 公主 Talanji
step
    #completewith next
    .goto 863,50.22,78.22
    .vehicle 148769 >>骑乘 |cRXP_FRIENDLY_A.F.M.O.D.|r
    .target A.F.M.O.D.
step
    >>使用 |T136050:0|t[电荷充能] (2) 提升移动速度, 使用 |T252185:0|t[霰弹冲击] (1) 击杀守卫者
    .goto 863,48.04,81.55,25,0
    .goto 863,47.30,79.87,25,0
    .goto 863,46.95,76.06,25,0
    .goto 863,45.84,75.30,20,0
    .goto 863,45.95,79.18,25,0
#loop
	.line 863,48.04,81.55,47.30,79.87,46.95,76.06,45.84,75.30,45.95,79.18
	.goto 863,48.04,81.55,25,0
	.goto 863,47.30,79.87,25,0
	.goto 863,46.95,76.06,25,0
	.goto 863,45.84,75.30,25,0
	.goto 863,45.95,79.18,25,0
    .complete 54224,1 --60/60 Fallen Outpost defenders slain
step
    >>等待短暂剧情. 用 (2) |T136050:0|t[电击冲锋] 加速, 用 (1) |T252185:0|t[霰弹枪齐射] 击杀防守者
    .goto 863,40.21,81.34,20,0
    .goto 863,39.66,80.52,16,0
    .goto 863,40.41,78.78,20,0
    .goto 863,41.53,78.61,16,0
    .goto 863,39.39,76.85,20,0
    .goto 863,41.33,78.72
    .complete 54224,2 --80/80 Zul'jan ruins defenders slain
step
    .goto 863,39.27,78.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 对话 |cRXP_FRIENDLY_Princess Talanji|r
    .turnin 54224 >>交任务: |cRXP_FRIENDLY_祖尔贾恩废墟之战|r
    .accept 54244 >>接任务: |cRXP_WARN_瓮中捉鳖|r
    .target 公主 Talanji
step
    #completewith next
    .goto 863,39.20,78.01
    .vehicle 147319 >>骑上迅猛龙
    .timer 70,Riding RP
step
    >>尽情享受旅程!
    .goto 863,31.40,52.05
    .complete 54244,1 --1/1 Ride to Zalamar on Riding Raptor
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r和|cRXP_FRIENDLY_拉克拉将军|r交谈
    .turnin 54244 >>交任务: |cRXP_FRIENDLY_我们已将他们逼入死角|r
    .accept 54249 >>接任务: |cRXP_WARN_赞达拉的正义|r
    .goto 863,30.90,51.87
    .accept 54269 >>接任务: |cRXP_WARN_一个也逃不了|r
    .accept 54270 >>接任务: |cRXP_WARN_打破镜像|r
    .goto 863,30.82,51.81
    .target 公主 Talanji
    .target General Rakera
step
    #completewith ZandalariTrollNoneShallEscape
    >>击杀 |cRXP_ENEMY_黑铁萨满|r\|cRXP_ENEMY_黑铁猛士|r 和 |cRXP_ENEMY_虚空精灵法师|r
    .complete 54249,1 --15/15 Alliance forces slain
    .mob 达尔k Iron Shaman
    .mob 达尔k Iron Bruiser
    .mob Void Elf Mage
step
    #title Machine destroyed 1/4
    >>摧毁 |cRXP_PICK_黑铁钻探机|r
    .goto 863,30.76,48.31
    .complete 54269,1,1 --1/4 Mole machine destroyed
step
    >>击杀 |cRXP_ENEMY_特拉莫恩的镜像|r
    .goto 863,31.04,45.48,8,0
    .goto 863,30.93,45.15
    .complete 54270,1 --1/1 Aid Witch Doctor Kejabu
    .mob Telaamon's Mirror Image
step
    #title Machine destroyed 2/4
    >>摧毁 |cRXP_PICK_黑铁钻探机|r
    .goto 863,32.58,44.49
    .complete 54269,1,2 --2/4 Mole machine destroyed
step
    >>击杀 |cRXP_ENEMY_特拉莫恩的镜像|r
    .goto 863,33.04,46.36,12,0
    .goto 863,33.36,45.92
    .complete 54270,2 --1/1 Aid Jo'chunga
    .mob Telaamon's Mirror Image
step
    #title Machine destroyed 3/4
    >>摧毁 |cRXP_PICK_黑铁钻探机|r
    .goto 863,32.91,47.29
    .complete 54269,1,3 --3/4 Mole machine destroyed
step
    #label ZandalariTrollNoneShallEscape
    #title Machine destroyed 4/4
    >>摧毁 |cRXP_PICK_黑铁钻探机|r
    .goto 863,32.12,48.25
    .complete 54269,1 --4/4 Mole machine destroyed
step
    >>击杀 |cRXP_ENEMY_黑铁萨满|r\|cRXP_ENEMY_黑铁猛士|r 和 |cRXP_ENEMY_虚空精灵法师|r
    .goto 863,33.04,50.28,20,0
    .goto 863,30.57,50.00,20,0
    .goto 863,29.81,47.91,20,0
    .goto 863,30.39,46.01,25,0
    .goto 863,32.58,44.49,25,0
#loop
	.line 863,33.04,50.28,30.57,50.00,29.81,47.91,30.39,46.01,32.58,44.49
	.goto 863,33.04,50.28,25,0
	.goto 863,30.57,50.00,25,0
	.goto 863,29.81,47.91,25,0
	.goto 863,30.39,46.01,25,0
	.goto 863,32.58,44.49,25,0
    .complete 54249,1 --15/15 Alliance forces slain
    .mob 达尔k Iron Shaman
    .mob 达尔k Iron Bruiser
    .mob Void Elf Mage
step
    >>跳下去. |cRXP_WARN_此处不会受到坠落伤害|r
    .goto 863,31.25,46.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_洛坎|r
    .turnin 54249 >>交任务: |cRXP_FRIENDLY_赞达拉正义|r
    .turnin 54270 >>交任务: |cRXP_FRIENDLY_打破镜子|r
    .turnin 54269 >>交任务: |cRXP_FRIENDLY_无人能逃|r
    .accept 54271 >>接任务: |cRXP_WARN_清除特拉蒙|r
    .target 洛坎
step
    >>击杀 |cRXP_ENEMY_刀锋大师特拉莫恩|r
    .goto 863,29.06,46.60
    .complete 54271,1 --1/1 Blademaster Telaamon slain
    .mob Blademaster Telaamon
step
    .goto 863,31.24,46.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_洛坎|r
    .turnin 54271 >>交任务: |cRXP_FRIENDLY_泰拉蒙净化|r
    .accept 54275 >>接任务: |cRXP_WARN_驱散迷雾|r
    .target 洛坎
step
    >>冲进龙卷风
    .goto 863,31.44,47.02
    .complete 54275,1 --1/1 Use Rokhan's mojo to fly out of Hir'eek's lair (Optional)
step
    #completewith next
    .goto 863,31.78,45.45
    .vehicle 147685 >>骑上 |cRXP_FRIENDLY_骑乘用迅猛龙|r
    .timer 48,Riding RP
step
    >>尽情享受旅程!
    .goto 863,31.51,31.90
    .complete 54275,2 --1/1 Ride out to dispel fog voodoo
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .goto 863,31.62,31.77
    .skipgossip 146921,1
    .timer 24,Talanji RP
    .complete 54275,3 --1/1 Ask Talanji to nullify the Abyssal Scepter
    .target 公主 Talanji
step
    .goto 863,31.62,31.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈.按"ESC"键跳过接下来的过场动画
    .turnin 54275 >>交任务: |cRXP_FRIENDLY_雾散时分|r
    .target 公主 Talanji
step
    .goto 863,31.35,31.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉克拉将军|r交谈
    .accept 54280 >>接任务: |cRXP_WARN_飞回应敌|r
    .target General Rakera
step
    #completewith next
    .goto 863,31.46,32.05
    .vehicle 147716 >>骑上 |cRXP_FRIENDLY_翼手龙|r
    .timer 78,Flying RP
    .target Hexlord Raal
step
    .goto 1165,36.86,5.25
    .complete 54280,1 --1/1 Ride back to Zuldazar with Hexlord Raal
step
    .goto 1165,37.02,5.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .turnin 54280 >>交任务: |cRXP_FRIENDLY_飞出去见他们|r
    .target 公主 Talanji
]])