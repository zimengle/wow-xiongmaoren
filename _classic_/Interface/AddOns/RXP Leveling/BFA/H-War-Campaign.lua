RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#groupweight 4
#name 01) 艾泽拉斯之心
#displayname 第1章 - 艾泽拉斯之心 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 02) 战役:提拉加德据点
<< Horde
step
    .goto 1165,50.38,41.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_土灵守护者|r交谈
    .accept 53028 >>接任务: |cRXP_WARN_垂死的世界|r
    .target Earthen Guardian
step
    .isOnQuest 53028
    #completewith next
    .zone 81 >>通过传送门前往希利苏斯
step
    .goto 81,42.22,44.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格尼·铜须|r交谈
    .turnin 53028 >>交任务: |cRXP_FRIENDLY_垂死的世界|r
    .accept 51211 >>接任务: |cRXP_WARN_艾泽拉斯之心|r
    .target Magni Bronzebeard
step
    >>点击|cRXP_PICK_Titan Translocator|r
    .goto 81,43.16,44.51
    .complete 51211,1 --1/1 Use device in Silithus  to travel to Chamber of the Heart
step
    .goto 1021,50.17,53.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格尼·铜须|r交谈. 按键盘上的“ESC”键可跳过过场动画
    .complete 51211,3 --1/1 Speak to Magni within the Chamber of Heart
    .skipgossip 136907,1
    .target Magni Bronzebeard
step
    .goto 1021,50.17,53.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_麦格尼·铜须|r交谈
    .turnin 51211 >>交任务: |cRXP_FRIENDLY_艾泽拉斯之心|r
    .target Magni Bronzebeard
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 02) 战役:提拉加德据点
#displayname 第2章 - 提拉加德据点 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 03) 战争战役 德鲁斯瓦据点
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与大印内的|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .accept 52749 >>接任务: |cRXP_WARN_阵营战役|r
    .target Nathanos Blightcaller
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
    .home >>将你的炉石设置为“灵魂与你同在”
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在船上与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .groundgoto 1165,50.26,99.98,10,0
    .goto 862,58.44,62.67
    .turnin 52749 >>交任务: |cRXP_FRIENDLY_阵营战役|r
    .target Nathanos Blightcaller
step
    .isQuestAvailable 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .accept 51803 >>接任务: |cRXP_WARN_库尔提拉斯战役|r
    .target Nathanos Blightcaller
step
    .isQuestAvailable 51801 
    .isQuestTurnedIn 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .accept 51979 >>接任务: |cRXP_WARN_继续作战|r
    .target Nathanos Blightcaller
step
    .isQuestAvailable 51801 
    .isQuestTurnedIn 51979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .accept 52444 >>接任务: |cRXP_WARN_最后的据点|r
    .target Nathanos Blightcaller
step
    >>与库尔提拉斯战役桌互动 |cRXP_WARN_并选择提拉加德海峡|r. 点击小地图下方的弹出窗口提交任务
    >>|cRXP_WARN_如果您不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51800 >>接任务: |cRXP_WARN_据点：提拉加德海峡|r
    .turnin 51800 >>交任务: |cRXP_FRIENDLY_据点：提拉加德海峡|r
    .complete 51803,2 --1/1 Choose a foothold
    .goto 862,58.44,62.62
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 51803 >>交任务: |cRXP_FRIENDLY_库尔提拉斯战役|r
    .accept 51421 >>接任务: |cRXP_WARN_坐船前行|r
    .target Nathanos Blightcaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_TATTERSAIL|r交谈
    .complete 51421,1 --1/1 Speak with Tattersail to sail to Tiragarde Sound
    .goto 862,58.46,62.99
    .skipgossip
    .target Dread-Admiral Tattersail
step
    .goto 895,89.33,53.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影猎人Ty'jin|r交谈
    .turnin 51421 >>交任务: |cRXP_FRIENDLY_坐船前行|r
    .accept 51435 >>接任务: |cRXP_WARN_另类海盗|r
    .target Shadow Hunter Ty'jin
step
    .goto 895,89.46,53.67
    >>拾取地面上的|cRXP_PICK_海盗服饰|r
    .complete 51435,1 --1/1 Pirate Garb acquired
step
    .goto 895,89.33,53.38
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影猎人Ty'jin|r交谈
    .turnin 51435 >>交任务: |cRXP_FRIENDLY_另类海盗|r
    .accept 51436 >>接任务: |cRXP_WARN_与海盗打交道|r
    .target Shadow Hunter Ty'jin
step
    #completewith next
    .goto 895,89.33,53.36
    .vehicle >>点击地面上的|cRXP_PICK_Rope|r
    .timer 14,Parleyin' Wit Pirates RP
step
    .goto 895,88.22,51.17
    >>等待RP结束
    .complete 51436,1 --1/1 Use the Mala's Fortune Rope
step
    .goto 895,88.21,51.11,-1
    .goto 895,87.31,49.99,-1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Shadow Hunter Ty'jin|r交谈. 跟随他
    .complete 51436,2 --1/1 Walk with Ty'jin
    .skipgossip
    .timer 65, Ty'jin Walk RP
    .target Shadow Hunter Ty'jin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_第一副官 奥因斯|r和|cRXP_FRIENDLY_暗影猎人 泰金|r交谈
    .turnin 51436 >>交任务: |cRXP_FRIENDLY_与海盗打交道|r
    .accept 51437 >>接任务: |cRXP_WARN_混合烈酒|r
    .goto 895,87.31,49.99
    .accept 51439 >>接任务: |cRXP_WARN_收集炮弹|r
    .goto 895,87.28,50.01
    .target First Mate Owings
    .target Shadow Hunter Ty'jin
step
    #completewith KegGrog
    >>击杀|cRXP_ENEMY_Fogsail炮手|r. 击败他们后搜刮出|cRXP_LOOT_炮弹|r
    .complete 51439,1 --3/3 Fogsail Cannonball
    .mob Fogsail Cannoneer
step
    #title Keg spiked 1/6
    .goto 895,87.20,50.36
    >>点击|cRXP_PICK_Keg of Grog|r来刺穿它
    .complete 51437,1,1 --1/6 Keg of Grog spiked
step
    #title Keg spiked 2/6
    .goto 895,87.53,50.96
    >>点击|cRXP_PICK_Keg of Grog|r来刺穿它
    .complete 51437,1,2 --2/6 Keg of Grog spiked
step
    #title Keg spiked 3/6
    .goto 895,87.73,51.59
    >>点击|cRXP_PICK_Keg of Grog|r来刺穿它
    .complete 51437,1,3 --3/6 Keg of Grog spiked
step
    #title Keg spiked 4/6
    .goto 895,87.82,50.92
    >>点击|cRXP_PICK_Keg of Grog|r来刺穿它
    .complete 51437,1,4 --4/6 Keg of Grog spiked
step
    #title Keg spiked 5/6
    .goto 895,88.01,50.76
    >>点击|cRXP_PICK_Keg of Grog|r来刺穿它
    .complete 51437,1,5 --5/6 Keg of Grog spiked
step
    #label KegGrog
    #title Keg spiked 6/6
    .goto 895,88.27,50.74
    >>点击|cRXP_PICK_Keg of Grog|r来刺穿它
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
    >>击杀|cRXP_ENEMY_Fogsail炮手|r. 击败他们后搜刮出|cRXP_LOOT_炮弹|r
    .complete 51439,1 --3/3 Fogsail Cannonball
    .mob Fogsail Cannoneer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑影猎人 泰金|r和|cRXP_FRIENDLY_大副 奥因斯|r交谈
    .turnin 51439 >>交任务: |cRXP_FRIENDLY_收集炮弹|r
    .goto 895,87.28,50.01
    .turnin 51437 >>交任务: |cRXP_FRIENDLY_混合烈酒|r
    .accept 51440 >>接任务: |cRXP_WARN_改变方向|r
    .goto 895,87.31,49.99
    .accept 51441 >>接任务: |cRXP_WARN_轰炸信号|r
    .goto 895,87.28,50.01
    .target Shadow Hunter Ty'jin
    .target First Mate Owings
step
    #sticky
    #label FogRowboat
    >>在水中的船上使用 |T252185:0|t[地精制造的手炮]
    .complete 51441,1,2 --3/3 Fogsail Rowboat sunk
    .use 160405
step
    .goto 895,87.47,49.98,10,0
    .goto 895,87.43,49.73,20,0
    .goto 895,87.29,49.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_领航员 斯温克|r交谈. 等待他的复仇(RP)结束, 然后杀死他
    .complete 51440,3 --1/1 Navigator Swink ordered
    .skipgossip
    .timer 13,Swink RP
    .mob Navigator Swink
step
    #requires FogRowboat
    #completewith KillianMbappe
    >>在水中的船上使用 |T252185:0|t[地精制造的手炮]
    .complete 51441,1 --3/3 Fogsail Rowboat sunk
    .use 160405
step
    #requires FogRowboat
    .goto 895,87.83,50.41,8,0
    .goto 895,87.85,50.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_ENEMY_Boatswain Taryn|r交谈. 等待她完成角色扮演(RP)后, 再杀掉她
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
    >>在水中的船上使用 |T252185:0|t[地精制造的手炮]
    .complete 51441,1 --3/3 Fogsail Rowboat sunk
    .use 160405
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑影猎人 泰金|r和|cRXP_FRIENDLY_大副 奥因斯|r交谈
    .turnin 51441 >>交任务: |cRXP_FRIENDLY_轰炸信号|r
    .goto 895,87.28,50.01
    .turnin 51440 >>交任务: |cRXP_FRIENDLY_改变方向|r
    .accept 51442 >>接任务: |cRXP_WARN_现在我是船长了|r
    .goto 895,87.31,49.99
    .target Shadow Hunter Ty'jin
    .target First Mate Owings
step
    .goto 895,86.92,53.16
    >>击杀洞穴内的|RXP_ENEMY_Rhenik|r
    .complete 51442,1 --1/1 Captain Rhenik slain
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_第一副官 奥因斯|r和|cRXP_FRIENDLY_暗影猎人 泰金|r交谈
    >>与欧文斯和泰金交谈
    .turnin 51442 >>交任务: |cRXP_FRIENDLY_现在我是船长了|r
    .goto 895,87.31,49.99
    .accept 51438 >>接任务: |cRXP_WARN_标记领地|r
    .goto 895,87.28,50.01
    .target First Mate Owings
    .target Shadow Hunter Ty'jin
step
    .goto 895,87.47,50.41
    >>点击|cRXP_PICK_banner|r来放置旗帜. 按键盘上的“Esc”键可跳过过场动画
    .complete 51438,1 --1/1 Horde Banner planted
step
    .goto 895,87.28,50.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_影猎人Ty'jin|r交谈
    .turnin 51438 >>交任务: |cRXP_FRIENDLY_标记领地|r
    .turnin 51975 >>交任务: |cRXP_FRIENDLY_勇士：暗影猎手塔金|r
    .accept 51984 >>接任务: |cRXP_WARN_回到祖达萨|r
    .target Shadow Hunter Ty'jin
step
    .goto 895,87.84,51.19
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t出去. 和埃鲁尔· dawnbrook 交谈
    .complete 51984,1 --Speak to Erul Dawnbrook
    .skipgossip
    .target Erul Dawnbrook
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 51984 >>交任务: |cRXP_FRIENDLY_回到祖达萨|r
    .target Nathanos Blightcaller
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 03) 战争战役 德鲁斯瓦据点
#displayname 第3章 - 德鲁斯瓦据点 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 04) 战争战役岛屿远征
<< Horde
step
    .isQuestAvailable 51801 
    .isQuestAvailable 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .accept 51803 >>接任务: |cRXP_WARN_库尔提拉斯战役|r
    .target Nathanos Blightcaller
step
    .isQuestAvailable 51801 
    .isQuestTurnedIn 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .accept 51979 >>接任务: |cRXP_WARN_继续作战|r
    .target Nathanos Blightcaller
step
    .isQuestAvailable 51801 
    .isQuestTurnedIn 51979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .accept 52444 >>接任务: |cRXP_WARN_最后的据点|r
    .target Nathanos Blightcaller
step
    .isQuestAvailable 51801 
    .isOnQuest 51979
    >>与库尔提拉斯战役桌交互|cRXP_WARN_并选择德拉斯特瓦尔|r. 点击小地图下方的弹出窗口以提交任务
    >>|cRXP_WARN_如果您不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51801 >>接任务: |cRXP_WARN_据点：德鲁斯瓦|r
    .turnin 51801 >>交任务: |cRXP_FRIENDLY_据点：德鲁斯瓦|r
    .complete 51979,1 --1/1 Choose a foothold
    .goto 862,58.44,62.62
step
    .isQuestAvailable 51801 
    .isOnQuest 51803
    >>与库尔提拉斯战役桌交互|cRXP_WARN_并选择德拉斯特瓦尔|r. 点击小地图下方的弹出窗口以提交任务
    >>|cRXP_WARN_如果您不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51801 >>接任务: |cRXP_WARN_据点：德鲁斯瓦|r
    .turnin 51801 >>交任务: |cRXP_FRIENDLY_据点：德鲁斯瓦|r
    .complete 51803,2 --1/1 Choose a foothold
    .goto 862,58.44,62.62
step
    .isQuestAvailable 51801 
    .isOnQuest 52444
    >>与库尔提拉斯战役桌交互|cRXP_WARN_并选择德拉斯特瓦尔|r. 点击小地图下方的弹出窗口以提交任务
    >>|cRXP_WARN_如果您不小心选择了其他区域, 请从指南列表中选择对应区域的攻略|r
    .accept 51801 >>接任务: |cRXP_WARN_据点：德鲁斯瓦|r
    .turnin 51801 >>交任务: |cRXP_FRIENDLY_据点：德鲁斯瓦|r
    .complete 52444,1 --1/1 Choose a foothold
    .goto 862,58.44,62.62
step
    .isOnQuest 52444
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .turnin 52444 >>交任务: |cRXP_FRIENDLY_最后的据点|r
    .accept 51332 >>接任务: |cRXP_WARN_跨越大洋的旅途|r
    .target Nathanos Blightcaller
step
    .isOnQuest 51979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .turnin 51979 >>交任务: |cRXP_FRIENDLY_继续作战|r
    .accept 51332 >>接任务: |cRXP_WARN_跨越大洋的旅途|r
    .target Nathanos Blightcaller
step
    .isOnQuest 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .turnin 51803 >>交任务: |cRXP_FRIENDLY_库尔提拉斯战役|r
    .accept 51332 >>接任务: |cRXP_WARN_跨越大洋的旅途|r
    .target Nathanos Blightcaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入船舱. 与|cRXP_FRIENDLY_贸易大王加里维克斯|r交谈
    .goto 862,58.50,62.36,8,0
    .goto 862,58.45,62.64
    .turnin 51332 >>交任务: |cRXP_FRIENDLY_跨越大洋的旅途|r
    .accept 51340 >>接任务: |cRXP_WARN_德鲁斯瓦呀！|r
    .target Trade Prince Gallywix
step
    #completewith next
    .goto 862,58.39,62.26,10,0
    .goto 862,58.55,62.72
    .gossipoption 49250 >>上楼. 与伊崔格交谈
step
    .goto 862,58.55,62.72
    .skipgossip 2
    .complete 51340,1 --1/1 Speak with Eitrigg
    .target Eitrigg
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_TATTERSAIL|r交谈
    .complete 51340,2 --1/1 Speak with Tattersail to sail to Drustvar
    .goto 862,58.46,62.99
    .skipgossip 1
    .target Dread-Admiral Tattersail
step
    #completewith ZandalariTrollProfitandReconnaissanceA
    .noflyable 896
    .goto 896,19.14,43.31
    .fp >>获取Anyport飞行路径
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊崔格|r交谈
    .goto 896,20.78,43.85
    .turnin 51340 >>交任务: |cRXP_FRIENDLY_德鲁斯瓦呀！|r
    .accept 51224 >>接任务: |cRXP_WARN_利益与勘察|r
    .target Eitrigg
step
    .isOnQuest 51224
    .vehicle 137090 >>坐骑|cRXP_FRIENDLY_加里维克斯的战争三轮车|r
    .goto 896,20.73,43.75
    .target Gallywix's War Trike
step
    #label ZandalariTrollProfitandReconnaissanceA
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bilgewater Azerite Drudge|r交谈. 等待剧情发展
    .goto 896,21.09,44.85,10,0
    .goto 896,20.37,47.28,15,0
    .goto 896,22.28,46.32
    .complete 51224,1 --1/1 Board Gallywix's trike and search for a goblin scout
    .target Bilgewater Azerite Drudge
step
    .isOnQuest 51224
    .vehicle 137090 >>坐骑|cRXP_FRIENDLY_加里维克斯的战争三轮车|r
    .goto 896,22.28,46.32
    .target Gallywix's War Trike
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bilgewater Azerite Drudge|r交谈. 等待剧情发展
    .goto 896,25.47,46.31
    .complete 51224,2 --1/1 Search deeper into the woods
    .target Bilgewater Azerite Drudge
step
    .isOnQuest 51224
    .vehicle 137090 >>坐骑|cRXP_FRIENDLY_加里维克斯的战争三轮车|r
    .goto 896,25.47,46.31
    .target Gallywix's War Trike
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Bilgewater Azerite Drudge|r交谈. 等待剧情发展
    .goto 896,29.52,54.84
    .complete 51224,3 --1/1 Find another goblin scout
    .target Bilgewater Azerite Drudge
step
    .isOnQuest 51224
    .vehicle 137090 >>坐骑|cRXP_FRIENDLY_加里维克斯的战争三轮车|r
    .goto 896,29.52,54.84
    .target Gallywix's War Trike
step
    >>跟随箭头前往航点位置
    .goto 896,32.09,54.48
    .complete 51224,4 --1/1 Find the final goblin scout
step
    .goto 896,32.32,54.57
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 与|cRXP_FRIENDLY_伊崔格|r交谈
    .turnin 51224 >>交任务: |cRXP_FRIENDLY_利益与勘察|r
    .accept 51231 >>接任务: |cRXP_WARN_巫术恐惧症|r
    .target Eitrigg
step
    >>击杀生成的|cRXP_ENEMY_witches|r和|cRXP_ENEMY_Sister Redweather|r
    .goto 896,32.32,54.57
    .complete 51231,1 --1/1 Protect Eitrigg and Gallywix
    .mob Sister Readweather
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊崔格|r和|cRXP_FRIENDLY_贸易大王加里维克斯|r交谈
    .turnin 51231 >>交任务: |cRXP_FRIENDLY_巫术恐惧症|r
    .goto 896,32.32,54.57
    .accept 51233 >>接任务: |cRXP_WARN_我希望山上没有女巫|r
    .goto 896,32.35,54.59
    .target Eitrigg
    .target Trade Prince Gallywix
step
    .isOnQuest 51233
    .vehicle 137090 >>坐骑|cRXP_FRIENDLY_加里维克斯的战争三轮车|r
    .goto 896,32.33,54.73
    .target Gallywix's War Trike
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
    .goto 896,28.93,46.48,15,0
    .goto 896,28.21,44.45,15,0
    .goto 896,33.58,37.87
    .skipgossip
    .complete 51233,1 --1/1 Drive Eitrigg and Gallywix to the mountains
    .target Hobart Grapplehammer
step
    >>沿着箭头爬上山
    .goto 896,37.22,34.78,30,0
    .goto 896,37.68,31.08,30,0
    .goto 896,37.31,27.86
    .complete 51233,2 --1/1 Bring Eitrigg and Gallywix to Krazzlefrazz Outpost
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 与|r伊崔格|r和|r霍巴特·钩锤|r交谈
    .turnin 51233 >>交任务: |cRXP_FRIENDLY_我希望山上没有女巫|r
    .goto 896,37.23,27.19
    .accept 51234 >>接任务: |cRXP_WARN_卡兹弗拉兹岗哨|r
    .goto 896,36.90,27.11
    .target Eitrigg
    .target Hobart Grapplehammer
step
    >>拾取|cRXP_PICK_Kyante-Laser Embiggener|r. 使用你的[额外动作按钮]
    .goto 896,36.80,26.37
    .complete 51234,1 --1/1 Supply Hut constructed
step
    >>点击|cRXP_PICK_Boom Button|r
    .goto 896,36.74,25.13
    .complete 51234,2 --1/1 Engineering Works constructed
step
    >>点击|cRXP_PICK_Plunger|r
    .goto 896,37.75,24.62
    .complete 51234,3 --1/1 Fishing Hut constructed
step
    >>点击|cRXP_PICK_Wormhole|r. 击杀|cRXP_ENEMY_Interdimensional Abomination|r. 然后再次点击|cRXP_PICK_Wormhole|r
    .goto 896,37.62,25.50
    .complete 51234,4 --1/1 Inn constructed
    .skipgossip
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贸易大王加里维克斯|r和|cRXP_FRIENDLY_霍巴特·钩锤|r交谈
    >>您可以按 ESC 键跳过接下来的过场动画
    .turnin 51234 >>交任务: |cRXP_FRIENDLY_卡兹弗拉兹岗哨|r
    .goto 896,37.18,27.20
    .turnin 51987 >>交任务: |cRXP_FRIENDLY_勇士：霍巴特·钩锤|r
    .goto 896,36.90,27.11
    .accept 51985 >>接任务: |cRXP_WARN_回到祖达萨|r
    .goto 896,37.18,27.19
    .target Trade Prince Gallywix
    .target Hobart Grapplehammer
step
    #completewith next
    .isOnQuest 51985
    .noflyable 896
    .goto 896,37.38,24.03
    .fp >>获取Krazzlefrazz前哨飞行路径
    .fly Anyport >>飞往任意港口
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Swellthrasher|r交谈
    .goto 896,20.60,43.34
    .skipgossip
    .complete 51985,1 --Speak to Swellthrasher in Anyport
    .target Swellthrasher
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 51985 >>交任务: |cRXP_FRIENDLY_回到祖达萨|r
    .target Nathanos Blightcaller
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 04) 战争战役岛屿远征
#displayname 第4章 - 海岛探险 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 05) 战争战役:风暴之歌山谷据点
<< Horde
step
    .isQuestAvailable 51994
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .accept 51870 >>接任务: |cRXP_WARN_海岛探险|r
    .target Nathanos Blightcaller
step
    .isQuestAvailable 51994
    .goto 1165,44.48,95.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_猎豹队长Rez'okun|r交谈
    .turnin 51870 >>交任务: |cRXP_FRIENDLY_海岛探险|r
    .accept 51888 >>接任务: |cRXP_WARN_海岛探险|r
    .target Captain Rez'okun
step
    .isQuestAvailable 51994
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_猎豹队长Rez'okun|r交谈
    .goto 1165,44.48,95.46
    .complete 51888,1 --1/1 Speak with Captain Rez'okun
    .skipgossip 123000,1
    .target Captain Rez'okun
step
    .isOnQuest 51888
    #sticky
    #label ZandalariTrollIslandExpedition
    >>完成岛屿远征剧情场景
    .complete 51888,2 --1/1 Explore the Uncharted Island
step
    .isOnQuest 51888
    >>跟随箭头前往航点位置
    .goto 1022,79.23,63.90
    .scenario 3838,1 --1/1 Investigate the Azerite
step
    .isOnQuest 51888
    #title Crystal mined 1/3
    >>挖掘|cRXP_PICK_Azerite Crystal|r
    .goto 1022,79.23,63.90
    .scenario 3839,1,1 --1/3 Mine Azerite Crystals
step
    .isOnQuest 51888
    #title Crystal mined 2/3
    >>挖掘|cRXP_PICK_Azerite Crystal|r
    .goto 1022,75.50,55.76
    .scenario 3839,1,2 --2/3 Mine Azerite Crystals
step
    .isOnQuest 51888
    #title Crystal mined 3/3
    >>挖掘|cRXP_PICK_Azerite Crystal|r
    .goto 1022,77.46,50.15
    .scenario 3839,1 --3/3 Mine Azerite Crystals
step
    .isOnQuest 51888
    >>跟随箭头前往航点位置
    .goto 1022,62.41,26.06
    .scenario 3840,1 --1/1 Investigate the second source of Azerite
step
    .isOnQuest 51888
    >>击杀|cRXP_ENEMY_Encrusted Kingscuttler|r
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
    >>击杀|cRXP_ENEMY_Akakakoo|r或拾取|cRXP_PICK_Pouches/Sacks of Azerite|r
    .goto 1022,29.49,58.76,15,0
    .goto 1022,36.36,68.65,15,0
    .goto 1022,40.33,52.26,15,0
    .goto 1022,29.49,58.76
    .scenario 3843,1 --500/500 Take the Azerite from the Kunzen hozen tribe.
    .mob Akakakoo
    .mob Kunzen Hozen
    .mob Kunzen Hunter
    .mob Kunzen Leafeater
step
    .isOnQuest 51888
    >>跑回船上. 你可以按 ESC 跳过接下来的过场动画
    .goto 1022,77.39,73.61
    .scenario 3844,1 --1/1 Escape from Uncharted Isle before the Horde arrive.
step
    .isQuestAvailable 51994
    .isOnQuest 51888
    #requires ZandalariTrollIslandExpedition
    .goto 1165,44.48,95.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_猎豹队长Rez'okun|r交谈
    .turnin 51888 >>交任务: |cRXP_FRIENDLY_海岛探险|r
    .target Captain Rez'okun
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 05) 战争战役:风暴之歌山谷据点
#displayname 第5章 - 斯托颂谷地据点 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 06) 赞达拉统一战争
<< Horde
step
    .isQuestAvailable 51802 
    .isQuestAvailable 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .accept 51803 >>接任务: |cRXP_WARN_库尔提拉斯战役|r
    .target Nathanos Blightcaller
step
    .isQuestAvailable 51802 
    .isQuestTurnedIn 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .accept 51979 >>接任务: |cRXP_WARN_继续作战|r
    .target Nathanos Blightcaller
step
    .isQuestAvailable 51802 
    .isQuestTurnedIn 51979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .accept 52444 >>接任务: |cRXP_WARN_最后的据点|r
    .target Nathanos Blightcaller
step
    .isQuestAvailable 51802 
    .isOnQuest 52444
    >>与库尔提拉斯战役桌互动|cRXP_WARN_and 选择风暴之歌谷|r. 点击小地图下方的弹出窗口提交任务
    .accept 51802 >>接任务: |cRXP_WARN_据点：斯托颂谷地|r
    .turnin 51802 >>交任务: |cRXP_FRIENDLY_据点：斯托颂谷地|r
    .complete 52444,1 --1/1 Review final foothold
    .goto 862,58.44,62.62
    .turnin 51979 >>交任务: |cRXP_FRIENDLY_最后的据点|r
    .goto 862,58.44,62.67
step
    .isQuestAvailable 51802 
    .isOnQuest 51979
    >>与库尔提拉斯战役桌互动|cRXP_WARN_and 选择风暴之歌谷|r. 点击小地图下方的弹出窗口提交任务
    .accept 51802 >>接任务: |cRXP_WARN_据点：斯托颂谷地|r
    .turnin 51802 >>交任务: |cRXP_FRIENDLY_据点：斯托颂谷地|r
    .complete 51979,1 --1/1 Choose a foothold
    .goto 862,58.44,62.62
    .turnin 51979 >>交任务: |cRXP_FRIENDLY_继续作战|r
    .goto 862,58.44,62.67
step
    .isQuestAvailable 51802 
    .isOnQuest 51803
    >>与库尔提拉斯战役桌互动|cRXP_WARN_and 选择风暴之歌谷|r. 点击小地图下方的弹出窗口提交任务
    .accept 51802 >>接任务: |cRXP_WARN_据点：斯托颂谷地|r
    .turnin 51802 >>交任务: |cRXP_FRIENDLY_据点：斯托颂谷地|r
    .complete 51803,2 --1/1 Choose a foothold
    .goto 862,58.44,62.62
    .turnin 51803 >>交任务: |cRXP_FRIENDLY_库尔提拉斯战役|r
    .goto 862,58.44,62.67
step
    .isOnQuest 52444
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .turnin 52444 >>交任务: |cRXP_FRIENDLY_最后的据点|r
    .accept 51526 >>接任务: |cRXP_WARN_督军的召唤|r
    .target Nathanos Blightcaller
step
    .isOnQuest 51979
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .turnin 51979 >>交任务: |cRXP_FRIENDLY_继续作战|r
    .accept 51526 >>接任务: |cRXP_WARN_督军的召唤|r
    .target Nathanos Blightcaller
step
    .isOnQuest 51803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .turnin 51803 >>交任务: |cRXP_FRIENDLY_库尔提拉斯战役|r
    .accept 51526 >>接任务: |cRXP_WARN_督军的召唤|r
    .target Nathanos Blightcaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶督军克鲁姆什|r交谈
    .turnin 51526 >>交任务: |cRXP_FRIENDLY_督军的召唤|r
    .accept 51532 >>接任务: |cRXP_WARN_迅捷出击|r
    .goto 862,58.54,62.49
    .target High Warlord Cromush
step
    .groundgoto 862,58.38,62.77,8,0
    .goto 862,58.46,62.98
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_TATTERSAIL|r交谈
    .complete 51532,1 --1/1 Speak with Tattersail to sail to Stormsong Valley
    .skipgossip 1
    .target Dread-Admiral Tattersail
step
    .goto 942,51.11,21.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶督军克鲁姆什|r交谈
    .turnin 51532 >>交任务: |cRXP_FRIENDLY_迅捷出击|r
    .accept 51643 >>接任务: |cRXP_WARN_钢铁之墙|r
    .target High Warlord Cromush
step
    #completewith next
    .goto 942,51.50,20.76,12,0
    .goto 942,51.18,21.12
    >>下到船舱里, 操作火炮
    .complete 51643,1 --1/1 Cannon manned
step
    >>对库尔提拉斯军队使用 |T236179:0|t[炮击] (1)
    .complete 51643,2 --40/40 Kul Tiran forces slain
step
    .goto 942,51.53,20.75,10,0
    .goto 942,51.10,20.81,10,0
    .goto 942,51.11,21.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t返回上方. 与|cRXP_FRIENDLY_高阶督军克鲁姆什|r交谈
    .turnin 51643 >>交任务: |cRXP_FRIENDLY_钢铁之墙|r
    .accept 51536 >>接任务: |cRXP_WARN_狩猎开始|r
    .target High Warlord Cromush
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
    >>从|huelo|r拔出鱼叉
    .complete 51536,2 --1/1 Seawatch Point investigated
    .timer 28,On the Hunt RP
    .skipgossip
    .target Huelo
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 与|cRXP_FRIENDLY_雷克萨|r交谈
    .goto 942,50.40,26.17
    .turnin 51536 >>交任务: |cRXP_FRIENDLY_狩猎开始|r
    .accept 51587 >>接任务: |cRXP_WARN_前进！|r
    .target Rexxar
step
    .goto 942,52.04,29.97
    .complete 51587,1 --1/1 Travel with Rexxar
step
    #completewith next
    .goto 942,52.32,29.57,30,0
    .goto 942,52.10,29.96,30 >>前往山顶
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_百夫长加贺暖石|r和|cRXP_FRIENDLY_雷克萨|r交谈
    .turnin 51587 >>交任务: |cRXP_FRIENDLY_前进！|r
    .accept 51691 >>接任务: |cRXP_WARN_小命还算值钱|r
    .accept 51675 >>接任务: |cRXP_WARN_绝命猎杀|r
    .goto 942,51.65,29.83
    .accept 51674 >>接任务: |cRXP_WARN_扑灭大火|r
    .goto 942,51.68,29.89
    .target Centurion Kaga Warmstone
    .target Rexxar
step
    #completewith Barricade
    >>击杀|cRXP_ENEMY_风暴之潮步兵|r和|cRXP_ENEMY_潮汐术士|r
    >>击杀|cRXP_ENEMY_Tidesages|r获取 |T433449:0|t[|cRXP_LOOT_暗影魔杖|r]. 将暗影魔杖用于火焰上, 每次使用可获得2个
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
    >>击杀|cRXP_ENEMY_Captain Ara|r
    .complete 51675,1 --1/1 Captain Ara slain
    .mob Capatin Ara
step
    #label Barricade
    .goto 942,51.83,33.58
    .cast 272499 >>摧毁|cRXP_ENEMY_Captain Ara|r背后的|cRXP_PICK_攻城傀儡|r
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
    >>击杀|cRXP_ENEMY_风暴之潮步兵|r和|cRXP_ENEMY_潮汐术士|r
    >>击杀|cRXP_ENEMY_Tidesages|r获取 |T433449:0|t[|cRXP_LOOT_暗影魔杖|r]. 将暗影魔杖用于火焰上, 每次使用可获得2个
    >>点击|cRXP_FRIENDLY_受惊吓的苦工|r来解救他们
    .complete 51675,2 --8/8 Storm's Wake Footman slain
    .collect 160565,4,51674,0x1,-1 --Fading Umbral Wand (4)
    .complete 51674,1 --4/4 Flames doused
    .complete 51691,1 --6/6 Frightened Peon rescued
    .use 160565
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与小桥对面的|cRXP_FRIENDLY_百夫长加嘉·温石和雷克萨|r交谈
    .turnin 51675 >>交任务: |cRXP_FRIENDLY_绝命猎杀|r
    .turnin 51691 >>交任务: |cRXP_FRIENDLY_小命还算值钱|r
    .goto 942,49.19,34.21
    .turnin 51674 >>交任务: |cRXP_FRIENDLY_扑灭大火|r
    .accept 51696 >>接任务: |cRXP_WARN_夺回我们的东西|r
    .goto 942,49.24,34.26
    .target Centurion Kaga Warmstone
    .target Rexxar
step
    .goto 942,49.61,34.79
    >>爬上高塔, 点击|cRXP_PICK_Warhorn|r鸣响号角. 按键盘上的“ESC”键可跳过过场动画
    .complete 51696,1 --1/1 Warhorn of the Hold sounded
step
    .goto 942,52.13,33.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r交谈
    .turnin 51696 >>交任务: |cRXP_FRIENDLY_夺回我们的东西|r
    .accept 51753 >>接任务: |cRXP_WARN_勇士：雷克萨|r
    .turnin 51753 >>交任务: |cRXP_FRIENDLY_勇士：雷克萨|r
    .accept 51986 >>接任务: |cRXP_WARN_回到祖达萨|r
    .target Rexxar
step
    .goto 942,51.43,33.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t出去. 与|cRXP_FRIENDLY_Muka Stormbreaker|r交谈
    .complete 51986,1 --Speak to Muka Stormbreaker
    .skipgossip 2
    .target Muka Stormbreaker
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 51986 >>交任务: |cRXP_FRIENDLY_回到祖达萨|r
    .target Nathanos Blightcaller
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 06) 赞达拉统一战争
#displayname 第6章 - 赞达拉众志成城 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 07) 战争战役 已准备就绪
<< Horde
step
    .isQuestAvailable 52451
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .daily 52451,51916 >>接任务: |cRXP_WARN_赞达拉众志成城|r
    .target Nathanos Blightcaller
step
    .isOnQuest 52451
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 52451 >>交任务: |cRXP_FRIENDLY_赞达拉众志成城|r
    .accept 51589 >>接任务: |cRXP_WARN_征服库尔提拉斯|r
    .goto 862,58.44,62.67
    .target Nathanos Blightcaller
step
    .isOnQuest 51916
    .isQuestComplete 51916
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 51916 >>交任务: |cRXP_FRIENDLY_赞达拉众志成城|r
    .goto 862,58.44,62.67
    .target Nathanos Blightcaller
step
    .isOnQuest 51916
    >>在|cRXP_WARN_祖达萨|r完成赞达拉帝国的任务, 在|cRXP_WARN_纳兹米尔|r完成塔兰吉远征队的任务, 在|cRXP_WARN_沃顿|r完成沃顿奈的任务
    .complete 51916,1 -- Zandalari Empire (Friendly)
    .complete 51916,2 -- Talanji's Expedition (Friendly)
    .complete 51916,3 -- Voldunai (Friendly)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 51916 >>交任务: |cRXP_FRIENDLY_赞达拉众志成城|r
    .goto 862,58.44,62.67
    .target Nathanos Blightcaller
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 07) 战争战役 已准备就绪
#displayname 第7章 - 战鼓震天 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
#next 08) 战争战役 复仇之潮
<< Horde
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t前往祖达萨. 与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .accept 51589 >>接任务: |cRXP_WARN_征服库尔提拉斯|r
    .target Nathanos Blightcaller
step
    .goto 862,58.46,62.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_TATTERSAIL|r交谈
    .complete 51589,1 --1/1 Speak with Tattersail to sail to Tiragarde Sound
    .goto 862,58.46,62.99
    .skipgossip 135690,1
    .target Dread-Admiral Tattersail
step
    #completewith ZandalariTrollIntotheHeartofTiragarde
    .isOnQuest 51589
    .noflyable 895
    .goto 895,87.27,50.66
    .fp >>获取掠夺港飞行路径
step
    .goto 895,87.37,50.51
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 51589 >>交任务: |cRXP_FRIENDLY_征服库尔提拉斯|r
    .accept 51590 >>接任务: |cRXP_WARN_进入提拉加德之心|r
    .target Nathanos Blightcaller
step
    #label ZandalariTrollIntotheHeartofTiragarde
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t沿着路径前进, 然后与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .groundgoto 895,87.59,51.03,13,0
    .groundgoto 895,87.00,51.78,13,0
    .groundgoto 895,83.53,49.96,32,0
    .groundgoto 895,70.54,49.03,25,0
    .goto 895,71.19,50.91
    .turnin 51590 >>交任务: |cRXP_FRIENDLY_进入提拉加德之心|r
    .accept 51591 >>接任务: |cRXP_WARN_占山为王|r
    .target Nathanos Blightcaller
step
    >>击杀|cRXP_ENEMY_Roughneck 伐木工|r和|cRXP_ENEMY_Roughneck 打手|r
    .complete 51591,1 --10/10 Roughneck slain
    .goto 895,71.99,51.91
    .mob Roughneck Logger
    .mob Roughneck Goon
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r和|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 51591 >>交任务: |cRXP_FRIENDLY_占山为王|r
    .accept 51592 >>接任务: |cRXP_WARN_我们就不客气了|r
    .goto 895,72.02,51.85
    .accept 51593 >>接任务: |cRXP_WARN_调查桥港|r
    .goto 895,72.05,51.77
    .target Nathanos Blightcaller
    .target Lilian Voss
step
    #completewith ZandalariTrollBridgeportInvestigation
    >>拾取|cRXP_PICK_chests|r和|cRXP_PICK_chains|r和|cRXP_PICK_bolts|r
    .complete 51592,1 --7/7 Length of Chain
    .complete 51592,2 --7/7 Sail Canvas
step
    >>跑进圆圈里. 按“ESC”键跳过过场动画
    >>|cRXP_WARN_小心精英敌人|r
    .goto 895,75.31,51.13
    .complete 51593,3 --1/1 Investigate the outdoor workshop
step
    >>跑进圆圈里. 按“ESC”键跳过过场动画
    >>|cRXP_WARN_小心精英敌人|r
    .groundgoto 895,74.58,50.41,10,0
    .groundgoto 895,74.70,50.32,8,0
    .groundgoto 895,74.44,50.15,8,0
    .goto 895,74.62,49.68
    .complete 51593,1 --1/1 Investigate the harbor terrace
step
    #label ZandalariTrollBridgeportInvestigation
    >>跑进圆圈里. 按“ESC”键跳过过场动画
    .groundgoto 895,73.51,47.16,20,0
    .goto 895,73.46,48.24
    .complete 51593,2 --1/1 Investigate the watchpost cabin
step
    >>拾取|cRXP_PICK_chests|r和|cRXP_PICK_chains|r和|cRXP_PICK_bolts|r
    .goto 895,75.31,51.13,20,0
    .goto 895,74.62,49.68,20,0
    .goto 895,75.31,51.13,20,0
    .goto 895,75.13,50.57
    .complete 51592,1 --7/7 Length of Chain
    .complete 51592,2 --7/7 Sail Canvas
step
    .groundgoto 895,71.75,48.95,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r和|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 51592 >>交任务: |cRXP_FRIENDLY_我们就不客气了|r
    .goto 895,72.02,51.85
    .turnin 51593 >>交任务: |cRXP_FRIENDLY_调查桥港|r
    .accept 51594 >>接任务: |cRXP_WARN_铸造厂里的炸药|r
    .goto 895,72.05,51.77
    .target Nathanos Blightcaller
    .target Lilian Voss
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .goto 895,77.50,49.93
    .turnin 51594 >>交任务: |cRXP_FRIENDLY_铸造厂里的炸药|r
    .accept 51595 >>接任务: |cRXP_WARN_爆炸性|r
    .target Lilian Voss
step
    >>使用你旁边的 [ExtraActionButton], 在|cRXP_PICK_Pile of Ashvane Crates|r旁边进行操作
    .goto 895,77.69,49.79
    .complete 51595,1 --1/1 Test bomb explosiveness
step
    .goto 895,77.50,49.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 51595 >>交任务: |cRXP_FRIENDLY_爆炸性|r
    .accept 51596 >>接任务: |cRXP_WARN_获取弹药|r
    .accept 51597 >>接任务: |cRXP_WARN_火药研究|r
    .accept 51598 >>接任务: |cRXP_WARN_一点混乱|r
    .target Lilian Voss
step
    #completewith ZandalariTrollGunpowderResearch
    >>击杀|cRXP_ENEMY_工人|r并拾取|cRXP_PICK_箱子|r
    .complete 51598,1 --15/15 Ashvane workers slain
    .complete 51596,1 --8/8 Ashvane Explosives
    .mob Foundry Worker
    .mob Company Watchman
    .mob Company Enforcer
step
    >>击杀|cRXP_ENEMY_Taskmaster Williams|r. 搜刮其尸体获得|cRXP_LOOT_Gunpowder Manufacturing Guide|r
    .goto 895,79.36,47.24,20,0
    .goto 895,79.09,46.97
    .complete 51597,2 --1/1 Gunpowder Manufacturing Guide
    .mob Taskmaster Williams
step
    #label ZandalariTrollGunpowderResearch
    >>击杀|cRXP_ENEMY_Forgemaster Farthing|r, 搜刮其身上的|cRXP_LOOT_Ashvane Explosives Formula|r
    .groundgoto 895,81.73,46.54,25,0
    .goto 895,82.18,48.61
    .complete 51597,1 --1/1 Ashvane Explosives Formula
    .mob Forgemaster Farthing
step
    >>击杀|cRXP_ENEMY_工人|r并拾取|cRXP_PICK_箱子|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 51596 >>交任务: |cRXP_FRIENDLY_获取弹药|r
    .turnin 51597 >>交任务: |cRXP_FRIENDLY_火药研究|r
    .turnin 51598 >>交任务: |cRXP_FRIENDLY_一点混乱|r
    .accept 51599 >>接任务: |cRXP_WARN_死亡陷阱|r
    .target Lilian Voss
step
    >>放置 |cRXP_PICK_crates|r
    .goto 895,74.23,52.94
    .complete 51599,1 --8/8 Gunpowder Crate placed
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .groundgoto 895,76.82,50.51,25,0
    .goto 895,77.00,49.19
    .turnin 51599 >>交任务: |cRXP_FRIENDLY_死亡陷阱|r
    .accept 51601 >>接任务: |cRXP_WARN_桥港之旅|r
    .target Lilian Voss
step
    #completewith next
    .goto 895,76.99,49.23
    .vehicle 138552 >>骑上|cRXP_FRIENDLY_Stolen Horse|r
step
    >>跟随箭头骑乘前进, 穿过足够的敌方守卫和敌方队长阿玛莉亚·斯通
    >>按“ESC”键跳过即将播放的过场动画
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 51601 >>交任务: |cRXP_FRIENDLY_桥港之旅|r
    .target Nathanos Blightcaller
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin -53065 >>交任务: |cRXP_FRIENDLY_行动代号：掘墓人|r
    .accept 51784 >>接任务: |cRXP_WARN_墓园漫步|r
    .target Nathanos Blightcaller
step
    .isOnQuest 51784
    .goto 862,58.46,62.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_TATTERSAIL|r交谈
    .gossipoption 48342
    .complete 51784,1 --1/1 Speak with Tattersail to sail to Drustvar (Optional)
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r和|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .groundgoto 896,38.13,34.38,30,0
    .groundgoto 896,45.23,34.79,50,0
    .groundgoto 896,48.38,32.14,30,0
    .turnin 51784 >>交任务: |cRXP_FRIENDLY_墓园漫步|r
    .accept 51785 >>接任务: |cRXP_WARN_查看墓志铭|r
    .accept 51786 >>接任务: |cRXP_WARN_无法安息|r
    .goto 896,61.37,51.09
    .accept 51787 >>接任务: |cRXP_WARN_我们悲惨的生命|r
    .goto 896,61.32,51.03
    .target Nathanos Blightcaller
    .target Lilian Voss
step
    #completewith ZandalariTrollExaminingtheEpitaphs
    >>击杀|cRXP_ENEMY_怒灵|r
    .complete 51786,1 --8/8 Enraged Spirit slain
    .mob Enraged Spirit
step
    #title Gravebloom 1/10
    >>拾取|cRXP_PICK_Gravebloom|r
    .goto 896,61.16,48.82
    .complete 51787,1,1 --1/10 Gravebloom
step
    #title Geave Plague read 1/4
    >>阅读墓碑铭文|cRXP_PICK_Grave Plaque|r
    .goto 896,61.11,48.88
    .complete 51785,1,1 --1/4 Grave Plaque
step
    #title Geave Plague read 2/4
    >>阅读墓碑铭文|cRXP_PICK_Grave Plaque|r
    .goto 896,61.91,47.86
    .complete 51785,1,2 --2/4 Grave Plaque
step
    #title Gravebloom 2/10
    >>拾取|cRXP_PICK_Gravebloom|r
    .goto 896,61.97,47.71
    .complete 51787,1,2 --2/10 Gravebloom
step
    #title Gravebloom 3/10
    >>拾取|cRXP_PICK_Gravebloom|r
    .goto 896,61.29,47.64
    .complete 51787,1,3 --3/10 Gravebloom
step
    #title Gravebloom 4/10
    >>拾取|cRXP_PICK_Gravebloom|r
    .goto 896,61.06,47.44
    .complete 51787,1,4 --4/10 Gravebloom
step
    #title Gravebloom 5/10
    >>拾取|cRXP_PICK_Gravebloom|r
    .goto 896,60.92,47.07
    .complete 51787,1,5 --5/10 Gravebloom
step
    #title Gravebloom 6/10
    >>拾取|cRXP_PICK_Gravebloom|r
    .goto 896,60.49,45.71
    .complete 51787,1,6 --6/10 Gravebloom
step
    #title Gravebloom 7/10
    >>拾取|cRXP_PICK_Gravebloom|r
    .goto 896,60.31,44.90
    .complete 51787,1,7 --7/10 Gravebloom
step
    #title Geave Plague read 3/4
    >>阅读墓碑铭文|cRXP_PICK_Grave Plaque|r
    .goto 896,60.31,44.95
    .complete 51785,1,3 --3/4 Grave Plaque
step
    #title Gravebloom 8/10
    >>拾取|cRXP_PICK_Gravebloom|r
    .goto 896,60.22,45.98
    .complete 51787,1,8 --8/10 Gravebloom
step
    #title Gravebloom 9/10
    >>拾取|cRXP_PICK_Gravebloom|r
    .goto 896,60.00,46.33
    .complete 51787,1,9 --9/10 Gravebloom
step
    #title Geave Plague read 4/4
    >>阅读墓碑铭文|cRXP_PICK_Grave Plaque|r
    .goto 896,59.54,47.31
    .complete 51785,1 --4/4 Grave Plaque
step
    #label ZandalariTrollExaminingtheEpitaphs
    #title Gravebloom 10/10
    >>拾取|cRXP_PICK_Gravebloom|r
    .goto 896,60.26,47.16
    .complete 51787,1 --10/10 Gravebloom
step
    >>击杀|cRXP_ENEMY_怒灵|r
#loop
	.line 896,61.11,48.88,61.91,47.86,60.31,44.95,59.54,47.31
	.goto 896,61.11,48.88,30,0
	.goto 896,61.91,47.86,30,0
	.goto 896,60.31,44.95,30,0
	.goto 896,59.54,47.31,30,0
    .complete 51786,1 --8/8 Enraged Spirit slain
    .mob Enraged Spirit
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r和|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈 
    .turnin 51787 >>交任务: |cRXP_FRIENDLY_我们悲惨的生命|r
    .goto 896,61.32,51.03
    .turnin 51785 >>交任务: |cRXP_FRIENDLY_查看墓志铭|r
    .turnin 51786 >>交任务: |cRXP_FRIENDLY_无法安息|r
    .accept 51788 >>接任务: |cRXP_WARN_守墓人|r
    .goto 896,61.37,51.09
    .target Lilian Voss
    .target Nathanos Blightcaller
step
    >>击杀 |cRXP_ENEMY_布鲁图斯·桑顿|r. 击败他后搜刮出 |cRXP_LOOT_情人节钥匙|r
    .goto 896,59.24,49.26
    .complete 51788,1 --1/1 Valentine's Key
    .mob Brutus Thronton
step
    .goto 896,61.37,51.09
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈 
    .turnin 51788 >>交任务: |cRXP_FRIENDLY_守墓人|r
    .accept 51789 >>接任务: |cRXP_WARN_瓦伦丁元帅的记忆|r
    .target Nathanos Blightcaller
step
    >>打开|cRXP_PICK_crypt 陵墓之门|r
    .goto 896,61.11,48.88
    .complete 51789,1 --1/1 Crypt Door opened
step
    >>击杀生成的 |cRXP_ENEMY_mobs|r 和 |cRXP_ENEMY_Echo of Marshal M. Valentine|r
    .goto 896,61.12,48.75
    .complete 51789,2 --1/1 Echo of Marshal M. Valentine slain
    .mob Echo of Marshal M. Valentine
step
    >>等待RP. 从墓穴内地上拾取|cRXP_PICK_情人节日志|r
    .goto 896,61.11,48.99
    .complete 51789,3 --1/1 Crypt searched
    .complete 51789,4 --1/1 Valentine's location uncovered
    .complete 51789,5 --1/1 Valentine's Log
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈 
    .goto 896,61.18,48.74
    .turnin 51789 >>交任务: |cRXP_FRIENDLY_瓦伦丁元帅的记忆|r
    .target Nathanos Blightcaller
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
    .hs >>愿灵魂与你同在
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈 
    .goto 862,58.44,62.68
    .accept 51797 >>接任务: |cRXP_WARN_追踪海潮贤者|r
    .target Nathanos Blightcaller
step
    .goto 862,58.46,62.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_TATTERSAIL|r交谈
    .complete 51797,1 --1/1 Speak with Tattersail to sail to Stormsong Valley
    .goto 862,58.46,62.99
    .skipgossip 135690,1
    .target Dread-Admiral Tattersail
step
    #completewith next
    .goto 942,51.79,33.56,10 >>进入大厅
step
    .goto 942,52.12,33.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r交谈
    .turnin 51797 >>交任务: |cRXP_FRIENDLY_追踪海潮贤者|r
    .accept 51798 >>接任务: |cRXP_WARN_不计代价|r
    .target Rexxar
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r谈话. 等待剧情事件
    .goto 942,59.30,30.18
    .complete 51798,1 --1/1 Help Rexxar locate a tidesage
    .skipgossip 1
    .target Rexxar
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯·泽林|r交谈. 等待剧情触发
    .goto 942,62.64,31.87
    .complete 51798,2 --1/1 Tidesage located
    .skipgossip 1
    .timer 55,Tidesage RP
    .target Thomas Zelling
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r和|cRXP_FRIENDLY_托马斯·泽林格|r和|cRXP_FRIENDLY_雷克萨|r谈话
    .turnin 51798 >>交任务: |cRXP_FRIENDLY_不计代价|r
    .accept 51805 >>接任务: |cRXP_WARN_传播恐惧|r
    .goto 942,62.65,31.94
    .accept 51818 >>接任务: |cRXP_WARN_指挥官和队长|r
    .goto 942,62.64,31.87
    .accept 51819 >>接任务: |cRXP_WARN_溃敌之兵|r
    .goto 942,62.68,31.82
    .target Lilian Voss
    .target Thomas Zelling
    .target Rexxar
step
    #completewith ZandalariTrollCommanderandCaptain
    >>在|cRXP_ENEMY_Kul Tiran 工人|r附近使用|T134229:0|t[瓦尔基尔号角]
    >>击杀|cRXP_ENEMY_Kul Tiran|r和|cRXP_ENEMY_Alliance|r势力
    .complete 51805,1 --20/20 Civilians terrorized
    .complete 51819,1 --10/10 Alliance and Kul Tiran forces slain
    .use 160901
step
    >>击杀|cRXP_ENEMY_指挥官奥古斯丁|r. 击败他后搜刮出|cRXP_LOOT_禁忌魔法之书|r
    .groundgoto 942,61.69,36.40,15,0
    .groundgoto 942,60.02,38.04,15,0
    .goto 942,58.24,35.52
    .complete 51818,2 --1/1 Book of Forbidden Magics
    .mob Commander Augustine
step
    #label ZandalariTrollCommanderandCaptain
    >>击杀|cRXP_ENEMY_Captain Malia|r
    .goto 942,62.68,39.55
    .complete 51818,1 --1/1 Captain Malia slain
    .mob Captain Malia
step
    >>在|cRXP_ENEMY_Kul Tiran 工人|r附近使用|T134229:0|t[瓦尔基尔号角]
    >>击杀|cRXP_ENEMY_Kul Tiran|r和|cRXP_ENEMY_Alliance|r势力
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r和|cRXP_FRIENDLY_雷克萨|r和|cRXP_FRIENDLY_托马斯·泽林格|r谈话
    .turnin 51805 >>交任务: |cRXP_FRIENDLY_传播恐惧|r
    .goto 942,62.65,31.95
    .turnin 51819 >>交任务: |cRXP_FRIENDLY_溃敌之兵|r
    .goto 942,62.68,31.81
    .turnin 51818 >>交任务: |cRXP_FRIENDLY_指挥官和队长|r
    .accept 51830 >>接任务: |cRXP_WARN_泽林的潜力|r
    .goto 942,62.64,31.88
    .target Lilian Voss
    .target Rexxar
    .target Thomas Zelling
step
    >>击杀|cRXP_ENEMY_Tidesages|r和|cRXP_ENEMY_Tidebounds|r和|cRXP_ENEMY_Risen Bloodhounds|r和|cRXP_ENEMY_Drowned|r或|cRXP_ENEMY_Dagrus the Scorned|r以填满进度条
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
    >>使用[ExtraActionButton]
    .goto 942,66.61,42.20
    .complete 51830,2 --1/1 Empowered essence activated within Port Fogtide
step
    .groundgoto 942,62.00,32.02,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 跑上山, 与|cRXP_FRIENDLY_托马斯·泽林|r和|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 51830 >>交任务: |cRXP_FRIENDLY_泽林的潜力|r
    .goto 942,62.64,31.88
    .accept 51837 >>接任务: |cRXP_WARN_顺其自然|r
    .goto 942,62.64,31.95
    .target Thomas Zelling
    .target Lilian Voss
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯·泽林|r交谈. 等待角色扮演(RP)
    .goto 942,62.64,31.88
    .skipgossip
    .timer 66,Thomas Zelling RP
    .complete 51837,1 --1/1 Thomas Zelling spoken to
step
    .goto 942,62.65,31.94
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .turnin 51837 >>交任务: |cRXP_FRIENDLY_顺其自然|r
    .accept 52122 >>接任务: |cRXP_WARN_被遗忘者|r
    .target Lilian Voss
step
    .goto 942,59.93,30.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈. 等待剧情发展
    .complete 52122,1 --1/1 Thomas Zelling found
    .skipgossip
    .timer 58,Thomas Zelling RP
    .target Lilian Voss
step
    .zoneskip 942,1
    #completewith next
    .goto 942,51.43,33.74
    .gossipoption 48826 >>与穆卡·风暴破坏者交谈
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 52122 >>交任务: |cRXP_FRIENDLY_被遗忘者|r
    .accept 52764 >>接任务: |cRXP_WARN_前往与世隔绝之地|r
    .target Nathanos Blightcaller
step
    .goto 862,58.46,62.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_TATTERSAIL|r交谈
    .complete 52764,1 --1/1 Speak with Tattersail to sail to the Great Sea
    .goto 862,58.46,62.99
    .skipgossip 135690,1
    .target Dread-Admiral Tattersail
step
    .goto 1157,40.28,67.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 52764 >>交任务: |cRXP_FRIENDLY_前往与世隔绝之地|r
    .accept 52765 >>接任务: |cRXP_WARN_纵身深潜|r
    .target Nathanos Blightcaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_霍巴特·钩锤|r对话. 等待你抵达海底
    .goto 1157,41.62,67.63
    .complete 52765,1 --1/1 Speak with Hobart to dive into the Great Sea
    .complete 52765,2 --1/1 Reach the ocean floor
    .skipgossip 1
    .target Hobart Grapplehammer
step
    >>使用你的[ExtraActionButton]两次来开启和关闭头灯
    .goto 1157,41.40,68.24
    .complete 52765,3 --1/1 Test your headlamp
step
    >>点击小地图或任务日志下方的弹出窗口或任务
    .goto 1157,41.40,68.24
    .turnin 52765 >>交任务: |cRXP_FRIENDLY_纵身深潜|r
    .accept 52766 >>接任务: |cRXP_WARN_海底沉船|r
step
    #completewith ZandalariTrollGrabandGo
    +如果你长时间开启头灯, 可能会导致死亡. 只有在确实需要看清目标时才使用它
step
    >>跟着箭头走. 不要吸引怪物仇恨
    .goto 1157,47.17,67.93
    .complete 52766,1 --1/1 Find the shipwreck
step
    >>点击小地图或任务日志下方的弹出窗口或任务
    .goto 1157,47.17,67.93
    .turnin 52766 >>交任务: |cRXP_FRIENDLY_海底沉船|r
    .accept 52767 >>接任务: |cRXP_WARN_检查狗牌|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与溺亡水手(|cRXP_FRIENDLY_Drowned Sailor|r)交谈
    .goto 1157,48.63,70.79
    .complete 52767,1 --1/1 Find the ship's captain
    .target Drowned Sailor
step
    >>点击小地图或任务日志下方的弹出窗口或任务
    .goto 1157,48.63,70.79
    .turnin 52767 >>交任务: |cRXP_FRIENDLY_检查狗牌|r
    .accept 52768 >>接任务: |cRXP_WARN_沉没的墓地|r
step
    >>跟着箭头走. 不要吸引怪物仇恨
    .goto 1157,55.87,51.20
    .complete 52768,1 --1/1 Find another shipwreck
step
    .goto 1157,55.87,51.20
    >>点击小地图或任务日志下方的弹出窗口或任务
    .turnin 52768 >>交任务: |cRXP_FRIENDLY_沉没的墓地|r
    .accept 52769 >>接任务: |cRXP_WARN_船长们|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与上方帆上的|cRXP_FRIENDLY_溺水水手|r交谈
    .goto 1157,54.52,49.65
    .complete 52769,1 --1/1 Identify the first sea captain
    .target Drowned Sailor
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上的|cRXP_FRIENDLY_溺水水手|r交谈
    .goto 1157,56.46,45.03
    .complete 52769,2 --1/1 Identify the second sea captain
    .target Drowned Sailor
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与地面上方稍高的|cRXP_FRIENDLY_Drowned Sailor|r交谈
    .goto 1157,66.50,42.30
    .complete 52769,3 --1/1 Identify the third sea captain
    .target Drowned Sailor
step
    .goto 1157,66.50,42.35
    >>点击小地图或任务日志中的弹出窗口或任务. 您可能需要等待一段时间, 下一个任务才会出现. 如果未弹出, 请击杀怪物
    .turnin 52769 >>交任务: |cRXP_FRIENDLY_船长们|r
    .accept 52770 >>接任务: |cRXP_WARN_萤光闪烁|r
step
    >>击杀|cRXP_ENEMY_Luminescent Siltfeeder|r和|cRXP_ENEMY_Deep Ocean Jelly|r和|cRXP_ENEMY_Seafloor Shambleclaw|r和|cRXP_ENEMY_Underlight Scouts|r
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
    >>点击小地图或任务日志下方的弹出窗口或任务
    .turnin 52770 >>交任务: |cRXP_FRIENDLY_萤光闪烁|r
    .accept 52772 >>接任务: |cRXP_WARN_海底礁石|r
step
    >>跟随箭头指引
    .goto 1157,67.03,56.26
    .complete 52772,1 --1/1 Find the shipwreck on the ledge
step
    .goto 1157,67.03,56.26
    >>点击小地图或任务日志下方的弹出窗口或任务
    .turnin 52772 >>交任务: |cRXP_FRIENDLY_海底礁石|r
    .accept 52773 >>接任务: |cRXP_WARN_水底的龙|r
step
    >>击杀|cRXP_ENEMY_Daenistrasz|r
    .goto 1157,68.26,55.54
    .complete 52773,1 --1/1 Daenistrasz slain
    .mob Daenistrasz
step
    .goto 1157,68.26,55.54
    >>点击小地图或任务日志下方的弹出窗口或任务
    .turnin 52773 >>交任务: |cRXP_FRIENDLY_水底的龙|r
    .accept 52774 >>接任务: |cRXP_WARN_拿了就走|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与溺亡水手(|cRXP_FRIENDLY_Drowned Sailor|r)交谈
    .goto 1157,68.25,55.60
    .complete 52774,1 --1/1 Gather Marshal M. Valentine's body
    .skipgossip
    .target Drowned Sailor
step
    #label ZandalariTrollGrabandGo
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与溺亡水手(|cRXP_FRIENDLY_Drowned Sailor|r)交谈
    .goto 1157,68.73,55.96
    .complete 52774,2 --1/1 Gather the other sailor's body
    .skipgossip
    .target Drowned Sailor
step
    #completewith next
    +打开头灯, 直到死亡为止
    .goto 1157,68.73,55.96,10,0
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t跳下去. 与|cRXP_FRIENDLY_莉莉安·沃斯|r交谈
    .goto 1157,41.56,66.50
    .turnin 53121 >>交任务: |cRXP_FRIENDLY_围攻伯拉勒斯|r
    .target Lilian Voss
step
    .goto 1157,42.08,66.24,8,0
    .goto 1157,40.12,68.01
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入船内. 与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 52774 >>交任务: |cRXP_FRIENDLY_拿了就走|r
    .accept 52978 >>接任务: |cRXP_WARN_王子随行|r
    .target Nathanos Blightcaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t回到上方. 与|cRXP_FRIENDLY_Tattersail|r交谈
    .goto 1157,42.08,66.24,8,0
    .goto 1157,39.91,68.31
    .complete 52978,1 --1/1 Speak with Dread-Admiral Tattersail to return
    .skipgossip 1
    .target Tattersail
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 52978 >>交任务: |cRXP_FRIENDLY_王子随行|r
    .accept 52183 >>接任务: |cRXP_WARN_计划已备|r
    .target Nathanos Blightcaller
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r对话. 等待剧情发展
    .gossipoption 48861
    .timer 30,Nathanos RP
    .complete 52183,1 --1/1 Listen to Nathanos' plan
    .target Nathanos Blightcaller
step
    .goto 862,58.46,62.99
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_TATTERSAIL|r交谈
    .complete 52183,2 --1/1 Speak with Tattersail to sail to Tiragarde Sound
    .goto 862,58.46,62.99
    .skipgossip 135690,1
    .target Dread-Admiral Tattersail
step
    .groundgoto 895,87.54,51.52,20,0
    .groundgoto 895,87.20,52.18,20,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r和|cRXP_FRIENDLY_阿玛莉亚·斯通|r交谈
    .turnin 52183 >>交任务: |cRXP_FRIENDLY_计划已备|r
    .accept 52186 >>接任务: |cRXP_WARN_大批守卫|r
    .goto 895,86.91,53.15
    .accept 52187 >>接任务: |cRXP_WARN_老同事|r
    .goto 895,86.96,53.12
    .target Nathanos Blightcaller
    .target Captain Amalia Stone
step
    .isOnQuest 52187
    #completewith next
    .goto 895,87.23,52.72
    .gossipoption 48830 >>与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
step
    #completewith ZandalariTrollOldColleagues
    >>击杀|cRXP_ENEMY_普罗德摩尔守卫|r
    .complete 52186,1 --12/12 Proudmoore Guard slain
    .mob Proudmoore Guard
step
    >>击杀|cRXP_ENEMY_Captain Gastrod|r
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
    >>进入船内. 杀死|cRXP_ENEMY_Guard-Commander Trunksal|r
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
    .gossipoption 48789 >>与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
step
    #label ZandalariTrollOldColleagues
    >>击杀|cRXP_ENEMY_Helmsman Miria|r
    .groundgoto 895,92.09,51.70,12,0
    .goto 895,92.28,51.12
    .complete 52187,3 --1/1 Helmsman Miria slain
    .mob Helmsman Miria
step
    >>击杀船上的普罗德摩尔守卫
    .complete 52186,1 --12/12 Proudmoore Guard slain
    .goto 895,92.08,51.44
    .mob Proudmoore Guard
step
    .isQuestComplete 52186
    #completewith next
    .noflyable 895
    .goto 895,91.59,52.16
    .gossipoption 48790 >>与|cRXP_FRIENDLY_霍巴特·钩锤|r谈话
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Captain Amalia Stone|r交谈
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
    .target Thomas Zelling
step
    #title 离开地窖
    #completewith next
    .goto 1161,70.47,86.07,8,0
    .goto 1161,70.02,85.34,8 >>离开地窖
step
    #completewith ZandalariTrollTidesageTeachings
    >>击杀|cRXP_ENEMY_Tidesage 档案师|r
    .complete 52189,1 --8/8 Tidesages slain
step
    #title Tome 1/5
    >>从架子上拿起 |cRXP_PICK_Tome|r
    .goto 1161,69.82,83.82
    .complete 52188,1,1 --1/5 Tome of Tidesage Research
step
    >>击杀档案管理员梅迪拉. 从她身上搜刮指南针
    .goto 1161,67.69,81.66
    .complete 52184,1 --1/1 Compass of Clarity
step
    #title Tome 2/5
    >>从架子上拿起 |cRXP_PICK_Tome|r
    .goto 1161,67.82,82.15
    .complete 52188,1,2 --2/5 Tome of Tidesage Research
step
    #title Tome 3/5
    >>从架子上拿起 |cRXP_PICK_Tome|r
    .goto 1161,67.55,81.21
    .complete 52188,1,3 --3/5 Tome of Tidesage Research
step
    >>击杀|cRXP_ENEMY_Brother Marrin|r. 击败他后搜刮出|cRXP_LOOT_Curio|r
    .groundgoto 1161,68.75,81.89,15,0
    .groundgoto 1161,67.43,80.01,15,0
    .groundgoto 1161,65.99,82.05,15,0
    .goto 1161,64.01,80.10
    .complete 52184,2 --1/1 Curio of the Depths
step
    #title Tome 4/5
    >>从架子上拿起 |cRXP_PICK_Tome|r
    .goto 1161,63.86,79.35
    .complete 52188,1,4 --4/5 Tome of Tidesage Research
step
    >>击杀潮破者周围的3名|cRXP_ENEMY_Tidesage Summoners|r. 击杀|cRXP_ENEMY_Unleashed Tidebreaker|r. 拾取它以获得|cRXP_LOOT_Key|r
    .groundgoto 1161,63.63,82.78,15,0
    .goto 1161,59.60,86.54
    .complete 52184,3 --1/1 Key of the Sea
step
    #label ZandalariTrollTidesageTeachings
    #title Tome 5/5
    >>从架子上拿起 |cRXP_PICK_Tome|r
    .goto 1161,60.56,85.11
    .complete 52188,1 --5/5 Tome of Tidesage Research
step
    >>击杀|cRXP_ENEMY_Tidesage 档案师|r
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
    .target Thomas Zelling
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯·泽林|r交谈
    .goto 1161,71.19,84.78
    .skipgossip 1
    .complete 52190,1 --1/1 Talk to Zelling
    .target Thomas Zelling
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
    >>将|r|cRXP_PICK_Key的海|r放置
    .goto 1161,71.15,82.59
    .complete 52190,2 --1/1 Begin the ritual
step
    >>保卫|cRXP_FRIENDLY_托马斯·泽林|r
    .goto 1161,71.15,82.24
    .complete 52190,3 --Zelling protected (100%)
    .mob Crawling Monstrosity
    .mob K'thir Guardian
step
    >>拾取|cRXP_PICK_深渊节杖|r
    .goto 1161,71.14,82.63
    .complete 52190,4 --1/1 Abyssal Scepter
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯·泽林|r交谈
    .goto 1161,71.14,82.63
    .turnin 52190 >>交任务: |cRXP_FRIENDLY_占据优势|r
    .accept 52990 >>接任务: |cRXP_WARN_回到港口|r
    .target Thomas Zelling
step
    #title 离开地下室+房屋
    #completewith next
    .goto 1161,71.68,81.67,5,0
    .goto 1161,71.67,82.70,5,0
    .goto 1161,70.62,82.25,5 >>离开地下室+房屋
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 895,86.91,53.14
    .turnin 52990 >>交任务: |cRXP_FRIENDLY_回到港口|r
    .accept 52191 >>接任务: |cRXP_WARN_人质劫持|r
    .target Nathanos Blightcaller
step
    >>等待角色扮演
    .goto 895,87.21,52.12
    .complete 52191,1 --1/1 Walk with Nathanos
step
    >>击杀|cRXP_ENEMY_General Cadarin|r
    .goto 895,87.50,52.29
    .complete 52191,2 --1/1 General Cadarin slain
    .mob General Cadarin
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .groundgoto 895,87.20,52.18,10,0
    .goto 895,86.91,53.15
    .turnin 52191 >>交任务: |cRXP_FRIENDLY_人质劫持|r
    .accept 52192 >>接任务: |cRXP_WARN_潮汐助力|r
    .target Nathanos Blightcaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 895,86.91,53.15
    .skipgossip
    .complete 52192,1 --1/1 Speak with Nathanos
    .target Nathanos Blightcaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .goto 862,58.44,62.67
    .turnin 52192 >>交任务: |cRXP_FRIENDLY_潮汐助力|r
    .accept 53003 >>接任务: |cRXP_WARN_仇恨循环|r
    .target Nathanos Blightcaller
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
    .fly The Great Seal >>飞往大符文封印
step
    #completewith next
    .isOnQuest 53003
    .zoneskip 85
    .goto 1165,49.95,42.16,15 >>进入大印
step
    #completewith next
    .isOnQuest 53003
    .zoneskip 85
    .goto 1163,73.94,69.92
    .zone 85 >>前往: |cRXP_PICK_奥格瑞玛|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与格罗玛什要塞内的|r希尔瓦娜斯·风行者|r交谈
    .goto 85,53.20,90.46,10,0
    .goto 85,49.83,75.38,10,0
    .goto 85,48.33,71.16
    .turnin 53003 >>交任务: |cRXP_FRIENDLY_仇恨循环|r
    .target Lady Sylvanas Windrunner
]])
RXPGuides.RegisterGuide([[
#df
#version 1
#group 争霸艾泽拉斯战争战役
#name 08) 战争战役 复仇之潮
#displayname 第8章 - 复仇之潮 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
<< Horde
step
    .noflyable 864
    #completewith ZandalariTrollOurWarContinues
    .goto 85,48.33,71.16
    .hs >>心灵与灵同在
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t在船上与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .accept 53851 >>接任务: |cRXP_WARN_战火连绵|r
    .target Nathanos Blightcaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希尔瓦娜斯·风行者|r交谈
    .goto 862,58.44,62.56
    .skipgossip
    .complete 53851,1 --1/1 Speak with Sylvanas Windrunner
    .target Lady Sylvanas Windrunner
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 53851 >>交任务: |cRXP_FRIENDLY_战火连绵|r
    .accept 53852 >>接任务: |cRXP_WARN_切断艾泽里特补给|r
    .target Nathanos Blightcaller
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_TATTERSAIL|r交谈
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r交谈
    .turnin 53852 >>交任务: |cRXP_FRIENDLY_切断艾泽里特补给|r
    .accept 53856 >>接任务: |cRXP_WARN_部落的愤怒|r
    .target Rexxar
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r交谈
    .goto 895,47.52,21.76
    .skipgossip 145422,1
    .complete 53856,1 --1/1 Horde army deployed
    .target Rexxar
step
    .groundgoto 895,47.04,22.41,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r和|cRXP_FRIENDLY_托马斯·泽林|r交谈
    .turnin 53856 >>交任务: |cRXP_FRIENDLY_部落的愤怒|r
    .accept 53879 >>接任务: |cRXP_WARN_肃清庄园|r
    .accept 53880 >>接任务: |cRXP_WARN_艾泽里特战争机器|r
    .goto 895,48.92,24.99
    .target Rexxar
    .target Thomas Zelling
step
    #completewith ZandalariTrollMachinesofWarAndAzerite
    >>击杀|cRXP_ENEMY_Lightforged|r和|cRXP_ENEMY_Alliance|r部队
    .complete 53879,1 --Estate defenders disrupted (100%)
step
    #title Azerite Bomb Cluster 1/4
    >>拾取|cRXP_PICK_Azerite 炸弹|r
    .goto 895,49.33,25.58
    .complete 53880,1,1 --1/4 Azerite Bomb Cluster
step
    #title Azerite Bomb Cluster 2/4
    >>拾取|cRXP_PICK_Azerite 炸弹|r
    .goto 895,49.76,25.33
    .complete 53880,1,2 --2/4 Azerite Bomb Cluster
step
    #title Azerite Rifle 1/3
    >>拾取|cRXP_PICK_Azerite武器宝箱|r
    .goto 895,49.96,25.86
    .complete 53880,2,1 --1/3 Azerite Rifle
step
    #title Azerite Bomb Cluster 3/4
    >>拾取|cRXP_PICK_Azerite 炸弹|r
    .goto 895,49.62,26.19
    .complete 53880,1,3 --3/4 Azerite Bomb Cluster
step
    #title Azerite Rifle 2/3
    >>拾取|cRXP_PICK_Azerite武器宝箱|r
    .goto 895,49.83,26.72
    .complete 53880,2,2 --2/3 Azerite Rifle
step
    #title Azerite Bomb Cluster 4/4
    >>拾取|cRXP_PICK_Azerite 炸弹|r
    .goto 895,50.64,26.57
    .complete 53880,1 --4/4 Azerite Bomb Cluster
step
    #label ZandalariTrollMachinesofWarAndAzerite
    #title Azerite Rifle 3/3
    >>拾取|cRXP_PICK_Azerite武器宝箱|r
    .goto 895,50.86,26.00
    .complete 53880,2 --3/3 Azerite Rifle
step
    >>击杀|cRXP_ENEMY_Lightforged|r和|cRXP_ENEMY_Alliance|r部队
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r和|cRXP_FRIENDLY_托马斯·泽林|r交谈
    .turnin 53879 >>交任务: |cRXP_FRIENDLY_肃清庄园|r
    .turnin 53880 >>交任务: |cRXP_FRIENDLY_艾泽里特战争机器|r
    .accept 53913 >>接任务: |cRXP_WARN_荣耀之战|r
    .target Rexxar
    .target Thomas Zelling
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r谈话. 按“ESC”键跳过接下来的过场动画
    .goto 895,51.24,26.56
    .skipgossip 146462,1
    .complete 53913,1 --1/1 Speak with Rexxar to face Lieutenant Cole
    .target Rexxar
step
    >>击杀|cRXP_ENEMY_Azerite Tank|r和|cRXP_ENEMY_Lieutenant Cole|r
    .goto 895,50.95,26.91
    .complete 53913,2 --1/1 Lieutenant Cole slain
    .mob Azerite Tank
    .mob Lieutenant Cole
step
    .goto 895,50.95,26.91
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r交谈
    .turnin 53913 >>交任务: |cRXP_FRIENDLY_荣耀之战|r
    .accept 53912 >>接任务: |cRXP_WARN_狩猎永不停歇|r
    .target Rexxar
step
    >>跟随箭头指引
    .goto 895,52.86,30.46
    .complete 53912,1 --Approach Norwington manor
step
    .goto 895,53.02,30.49
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r谈话. 按“ESC”键跳过接下来的过场动画
    .turnin 53912 >>交任务: |cRXP_FRIENDLY_狩猎永不停歇|r
    .accept 53973 >>接任务: |cRXP_WARN_出击迎敌|r
    .target Rexxar
step
    >>坐上|cRXP_FRIENDLY_Gyrocopter|r
    .goto 895,53.04,30.33
    .complete 53973,1 --1/1 Goblin gyrocopter boarded
step
    >>在|T463515:0|t[艾泽里特轰炸] (2)冷却时使用. 否则, 频繁施放|T2065561:0|t[艾泽里特大炮] (1)
    .goto 895,53.04,30.33
    .complete 53973,2 --Alliance army defeated (100%)
step
    .goto 895,47.41,21.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷克萨|r交谈
    .turnin 53973 >>交任务: |cRXP_FRIENDLY_出击迎敌|r
    .accept 53981 >>接任务: |cRXP_WARN_旗开得胜|r
    .target Rexxar
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
    .gossipoption 48794 >>与|cRXP_FRIENDLY_Erul Dawnbrook|r交谈以返回祖尔达萨
step
    .goto 862,58.44,62.66
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 53981 >>交任务: |cRXP_FRIENDLY_旗开得胜|r
    .accept 53941 >>接任务: |cRXP_WARN_地精机甲|r
    .target Nathanos Blightcaller
step
    .groundgoto 1165,44.45,81.72,20,0
    .groundgoto 1165,50.92,56.26,30,0
    .groundgoto 1165,47.46,59.69,15,0
    .groundgoto 1165,45.50,60.06,15,0
    .groundgoto 1165,45.50,61.78,15,0
    .groundgoto 1165,41.00,72.33,25,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贸易大王加里维克斯|r和|r补丁|r交谈
    .turnin 53941 >>交任务: |cRXP_FRIENDLY_地精机甲|r
    .accept 54123 >>接任务: |cRXP_WARN_它应该在我的机甲里！|r
    .goto 862,36.32,72.03
    .accept 54124 >>接任务: |cRXP_WARN_别吃官司|r
    .goto 862,36.25,72.02
    .target Trade Prince Gallywix
    .target Patch
step
    #completewith ZandalariTrollsAvoidingLawsuits
    >>使用 |T134519:0|t[艾泽里特真空器] 吸走|cRXP_ENEMY_Azerite Mucks|r
    .use 166309
    .complete 54123,1 --Azerite pack fueled (100%)
    .mob Azerite Muck
step
    #title Worker healed 1/6
    >>治疗|cRXP_FRIENDLY_Uninsured Goblin Worker|r. 可通过点击它或使用你的治疗法术来完成
    .goto 862,35.48,70.84
    .complete 54124,1,1 --1/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    #title Worker healed 2/6
    >>治疗|cRXP_FRIENDLY_Uninsured Goblin Worker|r. 可通过点击它或使用你的治疗法术来完成
    .goto 862,35.16,71.30
    .complete 54124,1,2 --2/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    #title Worker healed 3/6
    >>治疗|cRXP_FRIENDLY_Uninsured Goblin Worker|r. 可通过点击它或使用你的治疗法术来完成
    .goto 862,35.19,71.99
    .complete 54124,1,3 --3/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    #title Worker healed 4/6
    >>治疗|cRXP_FRIENDLY_Uninsured Goblin Worker|r. 可通过点击它或使用你的治疗法术来完成
    .goto 862,34.69,71.74
    .complete 54124,1,4 --4/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    #title Worker healed 5/6
    >>治疗|cRXP_FRIENDLY_Uninsured Goblin Worker|r. 可通过点击它或使用你的治疗法术来完成
    .goto 862,34.94,71.00
    .complete 54124,1,5 --5/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    #label ZandalariTrollsAvoidingLawsuits
    #title Worker healed 6/6
    >>治疗|cRXP_FRIENDLY_Uninsured Goblin Worker|r. 可通过点击它或使用你的治疗法术来完成
    .goto 862,34.98,70.03
    .complete 54124,1 --6/6 Uninsured Goblin Worker healed
    .target Uninsured Goblin Worker
step
    >>使用 |T134519:0|t[艾泽里特真空器] 吸走|cRXP_ENEMY_Azerite Mucks|r
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Patch|r和|cRXP_FRIENDLY_贸易大王加里维克斯|r交谈
    .turnin 54124 >>交任务: |cRXP_FRIENDLY_别吃官司|r
    .goto 862,36.25,72.02
    .turnin 54123 >>交任务: |cRXP_FRIENDLY_它应该在我的机甲里！|r
    .accept 53942 >>接任务: |cRXP_WARN_毁天灭地之无敌机甲|r
    .goto 862,36.31,72.02
    .target Patch
    .target Trade Prince Gallywix
step
    #completewith next
    .goto 862,36.29,72.13
    .vehicle 145754 >>骑乘G.M.O.D.
step
    >>等待角色扮演
    .complete 53942,1 --1/1 Fly the G.M.O.D to Drustvar
step
    >>在冷却结束后使用 |T236171:0|t[艾泽里特践踏] (2), 否则使用 |T252185:0|t[艾泽里特爆破] (1) 杀死敌人
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
    >>在冷却结束后使用 |T236171:0|t[艾泽里特践踏] (2), 否则使用 |T252185:0|t[艾泽里特爆破] (1) 杀死敌人
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_教授克拉兹莱弗拉兹|r交谈
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
    .vehicle 146062 >>骑乘G.M.O.D.
step
    >>等待RP. 尽可能使用 |T237290:0|t[大红按钮] (1)
    .goto 896,75.97,56.01
    .complete 54004,1 --1/1 Ride G.M.O.D to face Mekkatorque
step
    .goto 895,54.60,64.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贸易大王加里维克斯|r交谈
    .turnin 54004 >>交任务: |cRXP_FRIENDLY_测试样例#1；机甲对战梅卡托克|r
    .accept 54007 >>接任务: |cRXP_WARN_保险措施|r
    .target Trade Prince Gallywix
step
    >>与|cRXP_FRIENDLY_G.M.O.D|r互动 3 次
    .goto 895,54.63,64.42
    .complete 54007,1 --1/1 Call for roadside assistance
    .complete 54007,2 --1/1 Try calling roadside assistance again
    .complete 54007,3 --1/1 Keep pushing buttons until something happens
step
    .goto 895,54.60,64.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贸易大王加里维克斯|r交谈
    .turnin 54007 >>交任务: |cRXP_FRIENDLY_保险措施|r
    .accept 54009 >>接任务: |cRXP_WARN_地精战事|r
    .accept 54008 >>接任务: |cRXP_WARN_保险续费|r
    .target Trade Prince Gallywix
step
    #completewith ZandalariTrollMekkatorquesBattlePlans
    >>击杀|cRXP_ENEMY_侏儒技师|r 和|cRXP_ENEMY_维吉尔山海军陆战队员|r
    .complete 54009,1 --15/15 Alliance and Kul Tiran forces slain
    .mob Vigil Hill Marine
    .mob Gnomish Engineer
step
    #completewith ZandalariTrollInsuranceRenewal
    >>击杀联盟部队, 搜刮其身上物品以获得联盟作战计划, 然后使用该计划接受任务
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
    >>击杀联盟部队, 搜刮其身上物品以获得联盟作战计划, 然后使用该计划接受任务
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
    >>在帐篷里拾取|cRXP_PICK_梅卡托克的作战计划|r
    .goto 895,59.12,61.80
    .complete 54022,1 --1/1 Mekkatorque's Battle Plans
step
    >>击杀|cRXP_ENEMY_侏儒技师|r 和|cRXP_ENEMY_维吉尔山海军陆战队员|r
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
    .mob Gnomish Engineer
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_贸易大王加里维克斯|r交谈
    .goto 895,54.60,64.58
    .turnin 54008 >>交任务: |cRXP_FRIENDLY_保险续费|r
    .turnin 54009 >>交任务: |cRXP_FRIENDLY_地精战事|r
    .turnin 54022 >>交任务: |cRXP_FRIENDLY_梅卡托克的作战计划|r
    .accept 54028 >>接任务: |cRXP_WARN_机甲对飞艇|r
    .target Trade Prince Gallywix
step
    >>坐骑|cRXP_FRIENDLY_G.M.O.D|r
    .goto 895,54.61,64.65
    .complete 54028,1 --1/1 Board G.M.O.D
    .timer 34,Flight RP
step
    >>等待 RP. 当 |T2032581:0|t[艾泽里特大炮] (1) 可用时, 瞄准飞船
    .goto 895,54.61,64.65
    .complete 54028,2 --Wreck the Alliance Airship (100%)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_G.M.O.D|r交谈
    .goto 895,68.05,84.11
    .skipgossip
    .complete 54028,3 --1/1 Speak with Gallywix to sound the SOS
    .target G.M.O.D
step    
    >>击败|cRXP_ENEMY_大工匠梅卡托克|r. 击杀|cRXP_ENEMY_超磁发生器|r
    .goto 895,67.84,84.28
    .complete 54028,4 --1/1 Confront Mekkatorque
    .timer 30, Flight RP
    .mob High Tinker Mekkatorque
    .mob Ultra Magnetizer
step
    .goto 895,87.63,53.48
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 与|cRXP_FRIENDLY_G.M.O.D|r交谈
    .turnin 54028 >>交任务: |cRXP_FRIENDLY_机甲对飞艇|r
    .accept 54094 >>接任务: |cRXP_WARN_地精成功学|r
    .target G.M.O.D
step
    #completewith next
    .goto 895,87.84,51.18
    .gossipoption 48794 >>与|cRXP_FRIENDLY_Erul Dawnbrook|r交谈以返回祖尔达萨
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 54094 >>交任务: |cRXP_FRIENDLY_地精成功学|r
    .accept 54121 >>接任务: |cRXP_WARN_救出艾什凡|r
    .target Nathanos Blightcaller
step
    #completewith next
    .goto 862,58.46,62.99
    .skipgossip 1
    .zone 895 >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_TATTERSAIL|r谈话, 搭乘其船只前往提拉加德海峡
    .target Dread-Admiral Tattersail
step
    .groundgoto 895,87.04,51.89,20,0
    .groundgoto 895,85.28,51.76,20,0
    .groundgoto 895,84.75,51.65,14,0
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cFF00FF2N奥术师瓦尔特罗伊|r和|cFF00FF2N雷克萨|r交谈
    .turnin 54121 >>交任务: |cRXP_FRIENDLY_救出艾什凡|r
    .accept 54175 >>接任务: |cRXP_WARN_观察敌人|r
    .accept 54176 >>接任务: |cRXP_WARN_统一制服|r
    .goto 895,82.94,49.54
    .accept 54177 >>接任务: |cRXP_WARN_扰乱计划|r
    .goto 895,83.00,49.65
    .target Arcanist Valtrois
    .target Rexxar
step
    #completewith ZandalariTrollFaceYourEnemy
    >>击杀普罗德摩尔部队. 从他们身上搜刮物品
    .complete 54176,1 --12/12 Proudmoore Equipment
    .mob Proudmoore Sentry
    .mob Proudmoore Infantry
    .mob Proudmoore Defender
step
    >>对|cRXP_ENEMY_Ollie Oakman|r使用 |T135144:0|t[维萨拉碎片]
    .goto 895,81.54,48.44
    .use 165702
    .complete 54175,3 --1/1 Ollie Oakman sent
    .mob Ollie Oakman
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
    >>在|rDrusilla Whiteblade|r身上使用|T135144:0|t[维萨拉碎片]
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
    >>击杀 |cRXP_ENEMY_Captain Serafina|r. 搜刮她的 |cRXP_LOOT_Overcoat|r
    .goto 895,79.10,46.97
    .complete 54176,2 --1/1 Captain's Overcoat
    .mob Captain Serafina
step
    #label ZandalariTrollFaceYourEnemy
    >>对|cRXP_ENEMY_Rosie Walker|r使用 |T135144:0|t[维萨拉碎片]
    .goto 895,80.47,45.95
    .use 165702
    .complete 54175,2 --1/1 Rosie Walker sent
    .mob Rosie Walker
step
    >>击杀普罗德摩尔部队. 从他们身上搜刮物品
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cFF00FF2N雷克萨|r和 |cFF00FF2N奥术师瓦尔特罗斯|r交谈
    .turnin 54177 >>交任务: |cRXP_FRIENDLY_扰乱计划|r
    .goto 895,83.00,49.65
    .turnin 54176 >>交任务: |cRXP_FRIENDLY_统一制服|r
    .turnin 54175 >>交任务: |cRXP_FRIENDLY_观察敌人|r
    .accept 54178 >>接任务: |cRXP_WARN_搭便车|r
    .goto 895,82.95,49.53
    .target Arcanist Valtrois
    .target Rexxar
step
    .groundgoto 895,84.78,51.67,15,0
    .goto 895,88.20,50.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 54178 >>交任务: |cRXP_FRIENDLY_搭便车|r
    .accept 54179 >>接任务: |cRXP_WARN_穿过前门|r
    .target Nathanos Blightcaller
step
    #completewith ZandalariTrollsEscapefromTolDagor
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r对话. 完成该场景任务
    .goto 895,88.20,50.75,0,0
    .skipgossip 1
    .complete 54179,1 --1/1 Scenario "Escape from Tol Dagor" completed
    .target Nathanos Blightcaller
step
    .isOnQuest 54179
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_守卫阿玛卡尔|r交谈. 等待剧情发展
    .goto 1349,32.01,66.37,20,0
    .goto 1349,38.94,70.67
    .skipgossip
    .timer 34,Warden Amical RP
    .scenario 4033,1
    .target Warden Amical
step
    .isOnQuest 54179
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Proudmoore 保卫者|r或|cRXP_FRIENDLY_Proudmoore 哨兵|r交谈
    .goto 1351,50.17,84.14
    .skipgossip
    .scenario 4035,1
    .target Proudmoore Defender
    .target Proudmoore Sentry
step
    .isOnQuest 54179
    >>从桌上拿起|cRXP_PICK_Master Key|r
    .goto 1351,50.66,84.43
    .scenario 4035,2
step
    .isOnQuest 54179
    >>等待短暂的剧情动画. 打开牢房门
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
    >>放置|cRXP_PICK_Volatile Azerite 武器|r
    .goto 1350,32.94,71.59
    .scenario 4047,1,1 --1/4 Set explosives in the drain
step
    .isOnQuest 54179
    #title Explosives set 2/4
    >>放置|cRXP_PICK_Volatile Azerite 武器|r
    .goto 1350,46.20,86.12
    .scenario 4047,1,2 --2/4 Set explosives in the drain
step
    .isOnQuest 54179
    #title Explosives set 3/4
    >>放置|cRXP_PICK_Volatile Azerite 武器|r
    .goto 1350,59.69,61.12
    .scenario 4047,1,3 --3/4 Set explosives in the drain
step
    .isOnQuest 54179
    #title Explosives set 4/4
    >>放置|cRXP_PICK_Volatile Azerite 武器|r
    .goto 1350,63.92,44.53
    .scenario 4047,1 --4/4 Set explosives in the drain
step
    .isOnQuest 54179
    >>离开下水道
    .goto 1349,51.45,47.96
    .scenario 4047,2
step
    .isOnQuest 54179
    >>击杀|cRXP_ENEMY_Warden Amical|r
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
    .gossipoption 48794 >>与|cRXP_FRIENDLY_Erul Dawnbrook|r交谈以返回祖尔达萨
step
    .goto 862,58.44,62.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_纳萨诺斯·凋零者|r交谈
    .turnin 54179 >>交任务: |cRXP_FRIENDLY_穿过前门|r
    .accept 54139 >>接任务: |cRXP_WARN_战争降临|r
    .target Nathanos Blightcaller
step
    #completewith next
    .noflyable 1165
    .goto 1165,50.32,99.92,10,0
    .goto 1165,50.59,85.57,15,0
    .goto 1165,52.09,90.13
    .fly The Great Seal >>飞往大符文封印
step
    #completewith next
    .goto 1165,49.95,42.28,10 >>进入大封印
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与cRXP_FRIENDLY_King Rastakhan|r交谈
    .goto 1164,39.94,70.17
    .complete 54139,1 --1/1 Speak with King Rastakhan
    .skipgossip
    .target King Rastakhan
step
    .goto 1164,41.26,66.67
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .turnin 54139 >>交任务: |cRXP_FRIENDLY_战争降临|r
    .accept 54140 >>接任务: |cRXP_WARN_赞达拉大军|r
    .target Princess Talanji
step
    #completewith next
    .goto 1165,49.95,42.28,10 >>离开大符文
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_狩猎暴掠龙 Rez'okun|r交谈. 按“ESC”键跳过接下来的过场动画
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
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉克雷将军|r交谈
    .goto 862,52.95,40.16
    .skipgossip 1
    .complete 54140,2 --1/1 Speak with General Rakera to mobilize the army
    .target General Rakera
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Hexlord Raal|r交谈
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
    .vehicle 149509>>坐骑|cRXP_FRIENDLY_Ata 翼王|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r和|r将军拉克瑞拉|r交谈
    .turnin 54140 >>交任务: |cRXP_FRIENDLY_赞达拉大军|r
    .accept 54157 >>接任务: |cRXP_WARN_[No One Left Behind]|r
    .goto 862,57.95,21.26
    .accept 54156 >>接任务: |cRXP_WARN_[A Path of Blood]|r
    .goto 862,57.95,21.31
    .target Princess Talanji
    .target General Rakera
step
    #completewith next
    >>消灭第七军团部队
    .complete 54156,1 --15/15 Alliance forces slain
    .mob 7th Legion Marine
    .mob 7th Legion Rifleman
step
    >>削弱敌方刀锋大师塔拉蒙以救出洛坎
    .goto 862,59.07,18.46
    .complete 54157,1 --1/1 Rokhan rescued
    .mob Blademaster Telaamon
step
    >>消灭第七军团部队
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
    .mob 7th Legion Marine
    .mob 7th Legion Rifleman
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r和|r将军拉克瑞拉|r交谈
    .turnin 54157 >>交任务: |cRXP_FRIENDLY_[No One Left Behind]|r
    .goto 862,57.95,21.26
    .turnin 54156 >>交任务: |cRXP_FRIENDLY_[A Path of Blood]|r
    .accept 54207 >>接任务: |cRXP_WARN_[Retaking the Outpost]|r
    .goto 862,57.96,21.31
    .target Princess Talanji
    .target General Rakera
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_六足领主拉尔|r和|cRXP_FRIENDLY_补丁|r交谈
    .turnin 54207 >>交任务: |cRXP_FRIENDLY_[Retaking the Outpost]|r
    .goto 863,50.27,78.47
    .accept 54211 >>接任务: |cRXP_WARN_地精小队大营救|r
    .accept 54212 >>接任务: |cRXP_WARN_重建灭世空战机甲|r
    .goto 863,50.30,78.42
    .target Hexlord Raal
    .target Patch
step
    #completewith ZandalariTrollPuttingtheGobinGobSquad
    >>击杀 |cRXP_ENEMY_吉尔尼斯伏击者|r和 |cRXP_ENEMY_暗夜精灵哨兵|r. 从他们身上搜刮 |cRXP_LOOT_A.F.M.O.D. 零件|r
    .complete 54212,1 --10/10 A.F.M.O.D. Part
    .mob Gilnean Ambusher
    .mob Night Elf Sentinel
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_钟摆|r交谈
    .goto 863,49.46,79.75
    .complete 54211,1 --1/1 Ticker found
    .target Ticker
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_蝾螈|r交谈
    .goto 863,48.26,78.99
    .complete 54211,2 --1/1 Newt found
    .target Newt
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伏特|r交谈
    .goto 863,47.94,76.93
    .complete 54211,4 --1/1 Volt found
    .target Volt
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沙砾|r交谈
    .goto 863,47.94,76.93
    .complete 54211,3 --1/1 Grit found
    .target Grit
step
    >>击杀 |cRXP_ENEMY_吉尔尼斯伏击者|r和 |cRXP_ENEMY_暗夜精灵哨兵|r. 从他们身上搜刮 |cRXP_LOOT_A.F.M.O.D. 零件|r
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
    .mob Gilnean Ambusher
    .mob Night Elf Sentinel
step
    .goto 863,50.30,78.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Patch|r交谈
    .turnin 54211 >>交任务: |cRXP_FRIENDLY_地精小队大营救|r
    .turnin 54212 >>交任务: |cRXP_FRIENDLY_重建灭世空战机甲|r
    .accept 54213 >>接任务: |cRXP_WARN_[It's Alive!]|r
    .target Patch
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .goto 863,50.36,78.46
    .skipgossip 1
    .timer 13,Talanji RP
    .complete 54213,1 --1/1 Speak with Talanji to power up the A.F.M.O.D.
    .target Princess Talanji
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_Patch|r和|cRXP_FRIENDLY_公主Talanji|r交谈
    .turnin 54213 >>交任务: |cRXP_FRIENDLY_[It's Alive!]|r
    .goto 863,50.30,78.41
    .accept 54224 >>接任务: |cRXP_WARN_[The Battle of Zul'jan Ruins]|r
    .goto 863,50.36,78.46
    .target Patch
    .target Princess Talanji
step
    #completewith next
    .goto 863,50.22,78.22
    .vehicle 148769 >>骑乘|cRXP_FRIENDLY_A.F.M.O.D.|r
    .target A.F.M.O.D.
step
    >>使用 |T136050:0|t[电荷充能] (2) 以提升移动速度, 使用 |T252185:0|t[霰弹冲击] (1) 击杀守卫者
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
    >>等待短暂的剧情演出. 使用 |T136050:0|t[电击冲锋] (2) 提升移动速度, 使用 |T252185:0|t[霰弹枪齐射] (1) 击杀防守者
    .goto 863,40.21,81.34,20,0
    .goto 863,39.66,80.52,16,0
    .goto 863,40.41,78.78,20,0
    .goto 863,41.53,78.61,16,0
    .goto 863,39.39,76.85,20,0
    .goto 863,41.33,78.72
    .complete 54224,2 --80/80 Zul'jan ruins defenders slain
step
    .goto 863,39.27,78.20
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t等待RP. 与|cRXP_FRIENDLY_Princess Talanji|r交谈
    .turnin 54224 >>交任务: |cRXP_FRIENDLY_[The Battle of Zul'jan Ruins]|r
    .accept 54244 >>接任务: |cRXP_WARN_[We Have Them Cornered]|r
    .target Princess Talanji
step
    #completewith next
    .goto 863,39.20,78.01
    .vehicle 147319 >>骑乘用迅猛龙
    .timer 70,Riding RP
step
    >>尽情享受旅程吧！
    .goto 863,31.40,52.05
    .complete 54244,1 --1/1 Ride to Zalamar on Riding Raptor
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r和|r将军拉克瑞拉|r交谈
    .turnin 54244 >>交任务: |cRXP_FRIENDLY_[We Have Them Cornered]|r
    .accept 54249 >>接任务: |cRXP_WARN_[Zandalari Justice]|r
    .goto 863,30.90,51.87
    .accept 54269 >>接任务: |cRXP_WARN_[None Shall Escape]|r
    .accept 54270 >>接任务: |cRXP_WARN_[Breaking Mirrors]|r
    .goto 863,30.82,51.81
    .target Princess Talanji
    .target General Rakera
step
    #completewith ZandalariTrollNoneShallEscape
    >>击杀|cRXP_ENEMY_黑铁萨满|r和|cRXP_ENEMY_黑铁猛士|r和|cRXP_ENEMY_虚空精灵法师|r
    .complete 54249,1 --15/15 Alliance forces slain
    .mob Dark Iron Shaman
    .mob Dark Iron Bruiser
    .mob Void Elf Mage
step
    #title Machine destroyed 1/4
    >>摧毁|cRXP_PICK_黑铁钻探机|r
    .goto 863,30.76,48.31
    .complete 54269,1,1 --1/4 Mole machine destroyed
step
    >>击杀|cRXP_ENEMY_Telaamon的镜像|r
    .goto 863,31.04,45.48,8,0
    .goto 863,30.93,45.15
    .complete 54270,1 --1/1 Aid Witch Doctor Kejabu
    .mob Telaamon's Mirror Image
step
    #title Machine destroyed 2/4
    >>摧毁|cRXP_PICK_黑铁钻探机|r
    .goto 863,32.58,44.49
    .complete 54269,1,2 --2/4 Mole machine destroyed
step
    >>击杀|cRXP_ENEMY_Telaamon的镜像|r
    .goto 863,33.04,46.36,12,0
    .goto 863,33.36,45.92
    .complete 54270,2 --1/1 Aid Jo'chunga
    .mob Telaamon's Mirror Image
step
    #title Machine destroyed 3/4
    >>摧毁|cRXP_PICK_黑铁钻探机|r
    .goto 863,32.91,47.29
    .complete 54269,1,3 --3/4 Mole machine destroyed
step
    #label ZandalariTrollNoneShallEscape
    #title Machine destroyed 4/4
    >>摧毁|cRXP_PICK_黑铁钻探机|r
    .goto 863,32.12,48.25
    .complete 54269,1 --4/4 Mole machine destroyed
step
    >>击杀|cRXP_ENEMY_黑铁萨满|r和|cRXP_ENEMY_黑铁猛士|r和|cRXP_ENEMY_虚空精灵法师|r
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
    .mob Dark Iron Shaman
    .mob Dark Iron Bruiser
    .mob Void Elf Mage
step
    >>跳下去. |cRXP_WARN_你不会受到坠落伤害|r
    .goto 863,31.25,46.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 54249 >>交任务: |cRXP_FRIENDLY_[Zandalari Justice]|r
    .turnin 54270 >>交任务: |cRXP_FRIENDLY_[Breaking Mirrors]|r
    .turnin 54269 >>交任务: |cRXP_FRIENDLY_[None Shall Escape]|r
    .accept 54271 >>接任务: |cRXP_WARN_[Telaamon's Purge]|r
    .target Rokhan
step
    >>击杀|cRXP_ENEMY_Blademaster Telaamon|r
    .goto 863,29.06,46.60
    .complete 54271,1 --1/1 Blademaster Telaamon slain
    .mob Blademaster Telaamon
step
    .goto 863,31.24,46.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_洛坎|r交谈
    .turnin 54271 >>交任务: |cRXP_FRIENDLY_[Telaamon's Purge]|r
    .accept 54275 >>接任务: |cRXP_WARN_[Parting Mists]|r
    .target Rokhan
step
    >>冲进龙卷风
    .goto 863,31.44,47.02
    .complete 54275,1 --1/1 Use Rokhan's mojo to fly out of Hir'eek's lair (Optional)
step
    #completewith next
    .goto 863,31.78,45.45
    .vehicle 147685 >>骑上|cRXP_FRIENDLY_骑乘用迅猛龙|r
    .timer 48,Riding RP
step
    >>尽情享受旅程吧！
    .goto 863,31.51,31.90
    .complete 54275,2 --1/1 Ride out to dispel fog voodoo
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .goto 863,31.62,31.77
    .skipgossip 146921,1
    .timer 24,Talanji RP
    .complete 54275,3 --1/1 Ask Talanji to nullify the Abyssal Scepter
    .target Princess Talanji
step
    .goto 863,31.62,31.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈. 按“ESC”键跳过接下来的过场动画
    .turnin 54275 >>交任务: |cRXP_FRIENDLY_[Parting Mists]|r
    .target Princess Talanji
step
    .goto 863,31.35,31.96
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉克雷将军|r交谈
    .accept 54280 >>接任务: |cRXP_WARN_[Fly Out to Meet Them]|r
    .target General Rakera
step
    #completewith next
    .goto 863,31.46,32.05
    .vehicle 147716 >>骑乘|cRXP_FRIENDLY_翼手龙|r
    .timer 78,Flying RP
    .target Hexlord Raal
step
    .goto 1165,36.86,5.25
    .complete 54280,1 --1/1 Ride back to Zuldazar with Hexlord Raal
step
    .goto 1165,37.02,5.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_公主塔兰吉|r交谈
    .turnin 54280 >>交任务: |cRXP_FRIENDLY_[Fly Out to Meet Them]|r
    .target Princess Talanji
]])