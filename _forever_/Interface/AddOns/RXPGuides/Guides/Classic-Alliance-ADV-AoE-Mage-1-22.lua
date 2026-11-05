local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#classic
#tbc
<< Human Mage
#name 1-10 ADV Elwynn Forest Human Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor Human Mage
#next 10-11 ADV Dun Morogh Human Mage AoE
#displayname 1-10 艾尔文森林（人类法师进阶 AoE）
step << !Human Mage
    #season 2
    #completewith next
    +在探索赛季，法师不应从其他种族的新手区开始练级，因为你无法在这里获得第一个符文（|T133816:0|t[铭刻手套 - 冰枪术]）
step
    #completewith next
    +你选择了进阶指南。这是为游戏中练级最快的职业（联盟法师）设计的最快路线，因此会运用许多冷门机制，也会进行难度很高的群体拉怪。在学习过程中坚持练习！祝你好运！
step
    #completewith next
    .goto Elwynn Forest,48.45,45.80,50,0
    +|cRXP_WARN_击杀|cRXP_ENEMY_幼狼|r，拾取掉落，直到可卖给商人的物品价值达到10铜币|r
    .mob 幼狼
step
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维里|r 交谈
    .accept 783 >> 接任务：身边的危机
    .target 维里副队长
step
    .goto Elwynn Forest,47.48,41.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    .vendor >> 卖掉杂物，直到拥有10铜以上
    .target 丹尼尔修士
step
    .goto Elwynn Forest,48.26,41.93,15,0
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_玛克布莱德|r交谈
    .turnin 783 >> 交任务：身边的危机
    .accept 7 >> 接任务：剿灭狗头人
    .target 治安官玛克布莱德
step
    #completewith next
    .goto Elwynn Forest,48.97,41.14,10,0
    .goto Elwynn Forest,49.26,40.67,10,0
    .goto Elwynn Forest,49.66,40.15,10,0
    .goto Elwynn Forest,49.44,39.89,5,0
    >>从楼梯跳到栏杆上
    .goto Elwynn Forest,49.66,39.41,10 >>前往楼上的|cRXP_FRIENDLY_凯尔登|r处
step
    .goto Elwynn Forest,49.66,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯尔登|r 交谈
    .train 1459 >> 学习|T135932:0|t[奥术智慧]
    .target 凯尔登·布雷门
step
    #completewith next
    .goto Elwynn Forest,49.66,40.15,10,0
    .goto Elwynn Forest,49.26,40.67,10,0
    .goto Elwynn Forest,48.97,41.14,10,0
    .goto Elwynn Forest,48.171,42.943,10 >>前往|cRXP_FRIENDLY_维里|r处
step
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维里|r 交谈
    .accept 5261 >> 接任务：伊根·派特斯金纳
    .target 维里副队长
step
    #completewith next
    .goto Elwynn Forest,46.10,42.57,70,0
    .goto Elwynn Forest,46.59,39.35
    +|cRXP_WARN_击杀|cRXP_ENEMY_幼狼|r，拾取掉落，直到可卖给商人的物品（包括你的护甲）价值达到50铜币|r
    .mob 幼狼
step
    .goto Elwynn Forest,47.48,41.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    >>|cRXP_BUY_购买10瓶|r |T132794:0|t[清凉的泉水] |cRXP_BUY_（向他购买）|r
    .vendor >> 卖掉杂物
    .collect 159,10,7,1 --Collect Refreshing Spring Water (x10)
    .target 丹尼尔修士
step
    .goto Elwynn Forest,48.94,40.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊根|r 交谈
    .turnin 5261 >> 交任务：伊根·派特斯金纳
    .accept 33 >> 接任务：林中的群狼
    .target 伊根·派特斯金纳
step
    #completewith next
    >>击杀|cRXP_LOOT_幼狼|r和|cRXP_LOOT_森林狼|r，拾取它们的|cRXP_LOOT_硬狼肉|r
    >>优先击杀|cRXP_LOOT_幼狼|r
    .complete 33,1 --Collect Tough Wolf Meat (x8)
	.mob 幼狼
    .mob 森林狼
step
#loop
	.line Elwynn Forest,47.01,35.68,47.70,35.04,49.81,35.14,49.82,36.23,49.18,37.16,47.01,35.68
	.goto Elwynn Forest,47.01,35.68,35,0
	.goto Elwynn Forest,47.70,35.04,35,0
	.goto Elwynn Forest,49.81,35.14,35,0
	.goto Elwynn Forest,49.82,36.23,35,0
	.goto Elwynn Forest,49.18,37.16,35,0
	.goto Elwynn Forest,47.01,35.68,35,0
    >>击杀|cRXP_ENEMY_狗头人歹徒|r
    >>|cRXP_WARN_尽可能击杀1级的|cRXP_ENEMY_狗头人歹徒|r|r
    .complete 7,1 --Kill Kobold Vermin (x10)
	.mob 狗头人歹徒
step
#loop
	.line Elwynn Forest,49.32,37.91,48.24,37.88,46.18,37.29,45.69,39.05,46.03,40.91,48.04,39.55,49.32,37.91
	.goto Elwynn Forest,49.32,37.91,35,0
	.goto Elwynn Forest,48.24,37.88,35,0
	.goto Elwynn Forest,46.18,37.29,35,0
	.goto Elwynn Forest,45.69,39.05,35,0
	.goto Elwynn Forest,46.03,40.91,35,0
	.goto Elwynn Forest,48.04,39.55,35,0
	.goto Elwynn Forest,49.32,37.91,35,0
    >>击杀|cRXP_LOOT_幼狼|r和|cRXP_LOOT_森林狼|r，拾取它们的|cRXP_LOOT_硬狼肉|r
    >>优先击杀|cRXP_LOOT_幼狼|r
    .complete 33,1 --Collect Tough Wolf Meat (x8)
	.mob 幼狼
    .mob 森林狼
step
    .goto Elwynn Forest,48.94,40.16
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_伊根|r 交谈
    .turnin 33,1 >> 交任务：林中的群狼
    .target 伊根·派特斯金纳
step
    .goto Elwynn Forest,47.48,41.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    >>|cRXP_BUY_向他购买|r |T132794:0|t[清凉的泉水] |cRXP_BUY_，共10瓶|r
    .vendor >>卖掉杂物
    .collect 159,10,15,1 --Collect Refreshing Spring Water (x10)
    .target 丹尼尔修士
step
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_玛克布莱德|r交谈
    .turnin 7 >> 交任务：剿灭狗头人
    .accept 15 >> 接任务：回音山调查行动
    .accept 3104 >> 接任务：雕文信件
    .target 治安官玛克布莱德
step
#loop
	.line Elwynn Forest,47.25,36.41,47.39,35.77,47.35,34.06,46.29,32.42,47.75,32.77,50.11,34.98,47.25,36.41
	.goto Elwynn Forest,47.25,36.41,35,0
	.goto Elwynn Forest,47.39,35.77,35,0
	.goto Elwynn Forest,47.35,34.06,35,0
	.goto Elwynn Forest,46.29,32.42,35,0
	.goto Elwynn Forest,47.75,32.77,35,0
	.goto Elwynn Forest,50.11,34.98,35,0
	.goto Elwynn Forest,47.25,36.41,35,0
    >>击杀|cRXP_ENEMY_狗头人劳工|r
    .complete 15,1 --Kill Kobold Worker (x10)
	.mob 狗头人劳工
step
#loop
	.line Elwynn Forest,49.32,37.91,48.24,37.88,46.18,37.29,45.69,39.05,46.03,40.91,48.04,39.55,49.32,37.91
	.goto Elwynn Forest,49.32,37.91,35,0
	.goto Elwynn Forest,48.24,37.88,35,0
	.goto Elwynn Forest,46.18,37.29,35,0
	.goto Elwynn Forest,45.69,39.05,35,0
	.goto Elwynn Forest,46.03,40.91,35,0
	.goto Elwynn Forest,48.04,39.55,35,0
	.goto Elwynn Forest,49.32,37.91,35,0
    .xp 3+1110 >> 刷怪至 1110+/1400 经验值
	.mob 幼狼
	.mob 狗头人歹徒
    .mob 森林狼
 step
    .goto Elwynn Forest,47.48,41.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    >>|cRXP_BUY_购买10瓶|r |T132794:0|t[清凉的泉水] |cRXP_BUY_（向他购买）|r
    .vendor >>卖掉杂物
    .collect 159,10,15,1 --Collect Refreshing Spring Water (x10)
    .target 丹尼尔修士
step
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_玛克布莱德|r交谈
    .turnin 15 >> 交任务：回音山调查行动
    .accept 21 >> 接任务：回音山清剿行动
    .target 治安官玛克布莱德
step
    #completewith next
    .goto Elwynn Forest,48.97,41.14,10,0
    .goto Elwynn Forest,49.26,40.67,10,0
    .goto Elwynn Forest,49.66,40.15,10,0
    .goto Elwynn Forest,49.44,39.89,5,0
    >>从楼梯跳到栏杆上
    .goto Elwynn Forest,49.66,39.41,10 >>前往楼上的|cRXP_FRIENDLY_凯尔登|r处
step
    #season 0
    .goto Elwynn Forest,49.66,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯尔登|r 交谈
    .turnin 3104 >> 交任务：雕文信件
    .train 116 >> 学习|T135846:0|t[寒冰箭]
    .target 凯尔登·布雷门
step
    #season 2
    .goto Elwynn Forest,49.66,39.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_凯尔登|r 交谈
    .accept 77620 >> 接任务：法术研究 << Human
    .turnin 3104 >> 交任务：雕文信件
    .train 116 >> 学习|T135846:0|t[寒冰箭]
    .target 凯尔登·布雷门
step
    #completewith next
    .goto Elwynn Forest,49.66,40.15,10,0
    .goto Elwynn Forest,49.26,40.67,10,0
    .goto Elwynn Forest,48.97,41.14,10,0
    .goto Elwynn Forest,48.171,42.943,10 >>前往|cRXP_FRIENDLY_维里|r处
step
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维里|r 交谈
    .accept 18 >> 接任务：潜行者兄弟会
    .target 维里副队长
step
    #season 2
    #loop
    #label CALEENCI
    #completewith RedBurlapBandana
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取|T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r
    >>|cRXP_WARN_注意：你无法在这里学习|r|T133816:0|t[铭刻手套 - 冰枪术]|cRXP_WARN_，因为|r|T133736:0|t[理解入门]|cRXP_WARN_只能在你所属种族的新手区获得|r << !Human
    .collect 203751,1,77620,1 -- Spell Notes: CALE ENCI (1)
    .mob 迪菲亚暴徒
    .train 401760,1
step << Human
    #season 2
    #requires CALEENCI
    #completewith RedBurlapBandana
    .train 401760 >>|cRXP_WARN_使用|r|T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r|cRXP_WARN_学习|r|T133816:0|t[铭刻手套 - 冰枪术]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
step
    #loop
    #label RedBurlapBandana
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,30,0
    .goto Elwynn Forest,53.89,50.52,30,0
    .goto Elwynn Forest,55.09,49.00,30,0
    .goto Elwynn Forest,55.43,45.87,30,0
    .goto Elwynn Forest,53.86,47.05,30,0
#loop
	.line Elwynn Forest,51.14,49.29,52.55,48.75,53.81,48.09,54.58,49.02,55.15,47.86,54.76,45.96,53.81,44.79,51.14,49.29
	.goto Elwynn Forest,51.14,49.29,35,0
	.goto Elwynn Forest,52.55,48.75,35,0
	.goto Elwynn Forest,53.81,48.09,35,0
	.goto Elwynn Forest,54.58,49.02,35,0
	.goto Elwynn Forest,55.15,47.86,35,0
	.goto Elwynn Forest,54.76,45.96,35,0
	.goto Elwynn Forest,53.81,44.79,35,0
	.goto Elwynn Forest,51.14,49.29,35,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取|cRXP_LOOT_红色粗麻面罩|r
    .complete 18,1 --Collect Red Burlap Bandana (x12)
	.mob 迪菲亚暴徒
step
    #optional
    #season 2
    #loop
    .goto Elwynn Forest,52.55,48.79,0
    .goto Elwynn Forest,55.43,45.87,0
    .goto Elwynn Forest,52.55,48.79,50,0
    .goto Elwynn Forest,53.89,50.52,50,0
    .goto Elwynn Forest,55.09,49.00,50,0
    .goto Elwynn Forest,55.43,45.87,50,0
    .goto Elwynn Forest,53.86,47.05,50,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取|T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r
    >>|cRXP_WARN_注意：你无法在这里学习|r|T133816:0|t[铭刻手套 - 冰枪术]|cRXP_WARN_，因为|r|T133736:0|t[理解入门]|cRXP_WARN_只能在你所属种族的新手区获得|r << !Human
    .collect 203751,1,77620,1 -- Spell Notes: CALE ENCI (1)
    .mob 迪菲亚暴徒
    .train 401760,1
step << Human
    #optional
    #season 2
    .train 401760 >>|cRXP_WARN_使用|r|T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r|cRXP_WARN_学习|r|T133816:0|t[铭刻手套 - 冰枪术]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
step
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维里|r 交谈
    .turnin 18,5 >> 交任务：潜行者兄弟会
    .accept 6 >> 接任务：加瑞克·帕德弗特的赏金
    .accept 3903 >> 接任务：米莉·奥斯沃斯
    .target 维里副队长
step
    #completewith Laborer
    +装备 |T135145:0|t[民兵短杖]
    .use 1159
    .itemcount 1159,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.7
step
    .goto Elwynn Forest,47.48,41.46
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔修士|r交谈
    >>|cRXP_BUY_购买10瓶|r |T132794:0|t[清凉的泉水] |cRXP_BUY_（向他购买）|r
    .vendor >> 卖掉杂物
    .collect 159,10,21,1 --Collect Refreshing Spring Water (x10)
    .target 丹尼尔修士
step
    #completewith next
    .goto Elwynn Forest,47.76,31.62,40 >>进入矿洞
step
    #label Laborer
    .goto Elwynn Forest,47.99,30.66,40,0
    .goto Elwynn Forest,48.32,28.84,40,0
    .goto Elwynn Forest,48.58,26.57,40,0
    .goto Elwynn Forest,49.95,25.74,40,0
    .goto Elwynn Forest,50.27,26.83
    >>击杀|cRXP_ENEMY_狗头人苦力|r
    .complete 21,1 --Kill Kobold Laborer (x12)
	.mob 狗头人苦力
step
    .goto Elwynn Forest,50.70,39.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莉|r交谈
    .turnin 3903 >> 交任务：米莉·奥斯沃斯
    .accept 3904 >> 接任务：米莉的葡萄
    .target 米莉·奥斯沃斯
step
    #completewith Harvest
#loop
	.line Elwynn Forest,53.68,47.29,52.82,48.78,54.43,48.10,54.52,49.58,53.85,50.68,54.52,49.58,54.43,48.10,53.68,47.29
	.goto Elwynn Forest,53.68,47.29,35,0
	.goto Elwynn Forest,52.82,48.78,35,0
	.goto Elwynn Forest,54.43,48.10,35,0
	.goto Elwynn Forest,54.52,49.58,35,0
	.goto Elwynn Forest,53.85,50.68,35,0
	.goto Elwynn Forest,54.52,49.58,35,0
	.goto Elwynn Forest,54.43,48.10,35,0
	.goto Elwynn Forest,53.68,47.29,35,0
    .xp 5+1175 >> 刷怪至 1175+/2800 经验值
    .mob 迪菲亚暴徒
step
    #completewith next
#loop
	.line Elwynn Forest,53.68,47.29,52.82,48.78,54.43,48.10,54.52,49.58,53.85,50.68,54.52,49.58,54.43,48.10,53.68,47.29
	.goto Elwynn Forest,53.68,47.29,35,0
	.goto Elwynn Forest,52.82,48.78,35,0
	.goto Elwynn Forest,54.43,48.10,35,0
	.goto Elwynn Forest,54.52,49.58,35,0
	.goto Elwynn Forest,53.85,50.68,35,0
	.goto Elwynn Forest,54.52,49.58,35,0
	.goto Elwynn Forest,54.43,48.10,35,0
	.goto Elwynn Forest,53.68,47.29,35,0
    >>拾取地上的|cRXP_PICK_葡萄桶|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .complete 3904,1 --Collect Milly's Harvest (x8)
step
    .goto Elwynn Forest,57.52,48.25
    >>击杀|cRXP_ENEMY_加瑞克·帕德弗特|r，拾取|cRXP_LOOT_加瑞克的头颅|r
    .complete 6,1 --Collect Garrick's Head (x1)
	.mob 加瑞克·帕德弗特
step
    #label Harvest
#loop
	.line Elwynn Forest,53.68,47.29,52.82,48.78,54.43,48.10,54.52,49.58,53.85,50.68,54.52,49.58,54.43,48.10,53.68,47.29
	.goto Elwynn Forest,53.68,47.29,35,0
	.goto Elwynn Forest,52.82,48.78,35,0
	.goto Elwynn Forest,54.43,48.10,35,0
	.goto Elwynn Forest,54.52,49.58,35,0
	.goto Elwynn Forest,53.85,50.68,35,0
	.goto Elwynn Forest,54.52,49.58,35,0
	.goto Elwynn Forest,54.43,48.10,35,0
	.goto Elwynn Forest,53.68,47.29,35,0
    >>拾取地上的|cRXP_PICK_葡萄桶|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .complete 3904,1 --Collect Milly's Harvest (x8)
step
#loop
	.line Elwynn Forest,53.68,47.29,52.82,48.78,54.43,48.10,54.52,49.58,53.85,50.68,54.52,49.58,54.43,48.10,53.68,47.29
	.goto Elwynn Forest,53.68,47.29,35,0
	.goto Elwynn Forest,52.82,48.78,35,0
	.goto Elwynn Forest,54.43,48.10,35,0
	.goto Elwynn Forest,54.52,49.58,35,0
	.goto Elwynn Forest,53.85,50.68,35,0
	.goto Elwynn Forest,54.52,49.58,35,0
	.goto Elwynn Forest,54.43,48.10,35,0
	.goto Elwynn Forest,53.68,47.29,35,0
    .xp 5+1175 >> 刷怪至 1175+/2800 经验值
    .mob 迪菲亚暴徒
step
    .goto Elwynn Forest,50.70,39.35
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莉|r交谈
    .turnin 3904 >>交还任务：米莉的葡萄
    .accept 3905 >>接取任务：葡萄出货单
    .target 米莉·奥斯沃斯
step
    .goto Elwynn Forest,48.171,42.943
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_维里|r 交谈
    .turnin 6,1 >> 交任务：加瑞克·帕德弗特的赏金
    .target 维里副队长
step
    .goto Elwynn Forest,48.923,41.606
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_玛克布莱德|r交谈
    .turnin 21,3 >> 交任务：回音山清剿行动
    .accept 54 >> 接任务：去闪金镇报到
    .target 治安官玛克布莱德
step
    #completewith next
    .goto Elwynn Forest,49.18,41.84,10,0
    .goto Elwynn Forest,49.55,41.56,10,0
    .goto Elwynn Forest,49.39,40.98,10,0
    .goto Elwynn Forest,48.98,41.17,10,0
    .goto Elwynn Forest,49.20,41.81,10,0
    .goto Elwynn Forest,49.57,41.46,10,0
    .goto Elwynn Forest,49.33,40.93,10,0
    >>上楼
    .goto Elwynn Forest,49.471,41.586,10 >> 前往|cRXP_FRIENDLY_尼尔斯|r处
step
    .goto Elwynn Forest,49.471,41.586
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔斯修士|r交谈
    .turnin 3905,1 >>交还任务：葡萄出货单
    .target 尼尔斯修士
step << Human
    #season 2
    #optional
    #completewith next
    .goto 1429,48.79,41.58,12,0
    .goto 1429,48.975,41.146,12,0
    .goto 1429,49.262,40.633,12,0
    .goto 1429,49.510,40.095,6,0
    .goto 1429,49.691,40.230,6,0
    .goto 1429,49.595,40.673,6,0
    .goto 1429,49.324,40.492,6,0
    .goto 1429,49.436,39.881,10,0
    .goto Elwynn Forest,49.661,39.402,12 >>下楼，然后前往|cRXP_FRIENDLY_凯尔登·布雷门|r处
    .isQuestComplete 77620
step << Human
    #season 2
    .goto Elwynn Forest,49.661,39.402
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_凯尔登·布雷门|r交谈
    .turnin 77620 >> 交任务：法术研究
    .target 凯尔登·布雷门
    .isQuestComplete 77620
step << Human
    #season 2
    #label IceLanceGloves
    #completewith NorthshireExit
    .equip 10,711 >> 装备|T132961:0|t[破布手套]
    .train 401760,3
step << Human
    #season 2
    #requires IceLanceGloves
    #completewith NorthshireExit
    .engrave 10 >> 在|T132961:0|t[破布手套]上铭刻|T133816:0|t[铭刻手套 - 冰枪术]
    .train 401760,3
step
    #label NorthshireExit
    .goto Elwynn Forest,45.56,47.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_法尔坎|r 交谈
    .accept 2158 >> 接任务：休息和放松
    .target 法尔坎·伊森斯泰德
step
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜汉|r 交谈
    .turnin 54 >> 交任务：去闪金镇报到
    .accept 62 >> 接任务：法戈第矿洞
    .target 治安官杜汉
step
    .goto Elwynn Forest,43.283,65.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入旅店时隔墙与|cRXP_FRIENDLY_威廉|r交谈
    .accept 60 >> 接任务：狗头人的蜡烛
    .target 威廉·匹斯特
step
    #completewith next
    .home >> 将炉石设为闪金镇
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法雷|r交谈
step
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法雷|r交谈
    .turnin 2158,2 >> 交任务：休息和放松
    .vendor 295 >> 卖掉杂物。|cRXP_BUY_购买|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_，直到剩下2银币|r
    .target 旅店老板法雷
step
    .goto Elwynn Forest,43.25,66.25
    >>跳到楼下的吊灯上
    >>隔墙与|cRXP_FRIENDLY_扎尔迪玛|r交谈
    .trainer >> 学习职业技能（火球术等级2、火焰冲击）
	.target 扎尔迪玛·维夫希尔特
step
    .goto Elwynn Forest,42.14,67.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷米|r 交谈
    .accept 47 >> 接任务：金砂交易
    .target 雷米
step
    #completewith BoarMeat1
    >>击杀|cRXP_ENEMY_石牙野猪|r，拾取|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,4,86,1 --Collect Chunk of Boar Meat (x4)
    .mob 石牙野猪
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯|r和|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .accept 85 >> 接任务：丢失的项链
    .target +波尼斯·斯通菲尔德姑妈
    .goto Elwynn Forest,34.486,84.253
    .accept 88 >> 接任务：公主必须死！
	.goto Elwynn Forest,34.660,84.482
    .target +斯通菲尔德妈妈
step
    #completewith next
    >>击杀|cRXP_ENEMY_狗头人隧道工|r，拾取|cRXP_LOOT_金砂|r和|cRXP_LOOT_狗头人的蜡烛|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
    .mob 狗头人隧道工
step
    .goto Elwynn Forest,43.132,85.722
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利|r 交谈
    .turnin 85 >> 交任务：丢失的项链
    .accept 86 >> 接任务：比利的馅饼
    .target 比利·马科伦
step
    #label BoarMeat1
    .goto Elwynn Forest,43.16,89.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_梅贝尔|r交谈
    .accept 106 >> 接任务：年轻的恋人
    .target 梅贝尔·马科伦
step
    .goto Elwynn Forest,42.36,89.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_尽可能多地向他购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_，以你能负担的数量为限|r
    .vendor 258 >>卖掉杂物
    .target 乔舒·马科伦
step
    #completewith next
    >>击杀|cRXP_ENEMY_石牙野猪|r，拾取|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,4,86,1 --Collect Chunk of Boar Meat (x4)
    .mob 石牙野猪
step
    .goto Elwynn Forest,29.840,85.997
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托米|r 交谈
    .turnin 106 >> 交任务：年轻的恋人
    .accept 111 >> 接任务：托米的祖母
    .target 托米·乔·斯通菲尔德
step
#loop
	.line Elwynn Forest,31.15,85.36,33.08,86.64,33.51,85.22,32.17,83.88,31.15,85.36
	.goto Elwynn Forest,31.15,85.36,35,0
	.goto Elwynn Forest,33.08,86.64,35,0
	.goto Elwynn Forest,33.51,85.22,35,0
	.goto Elwynn Forest,32.17,83.88,35,0
	.goto Elwynn Forest,31.15,85.36,35,0
    >>击杀|cRXP_ENEMY_石牙野猪|r，拾取|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,4,86,1 --Collect Chunk of Boar Meat (x4)
    .mob 石牙野猪
step
    .goto Elwynn Forest,34.486,84.253
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t先与|cRXP_FRIENDLY_波尼斯|r交谈，再与屋内的|cRXP_FRIENDLY_米莱德|r交谈
    .turnin 86 >> 交任务：比利的馅饼
    .accept 84 >> 接任务：比利的馅饼
    .target +波尼斯·斯通菲尔德姑妈
    .goto Elwynn Forest,34.486,84.253
    .turnin 111 >> 交任务：托米的祖母
    .accept 107 >> 接任务：给威廉·匹斯特的信
    .target +米莱德·斯通菲尔德
    .goto Elwynn Forest,34.94,83.86
step
    #completewith next
    >>击杀|cRXP_ENEMY_狗头人隧道工|r，拾取|cRXP_LOOT_金砂|r和|cRXP_LOOT_狗头人的蜡烛|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
    .mob 狗头人隧道工
step
    .goto Elwynn Forest,43.132,85.722
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_比利|r 交谈
    .turnin 84 >> 交任务：比利的馅饼
    .accept 87 >> 接任务：金牙
    .target 比利·马科伦
step
    .goto Elwynn Forest,42.36,89.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_尽可能多地向他购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_，以你能负担的数量为限|r
    .vendor 258 >>卖掉杂物
    .target 乔舒·马科伦
    .itemcount 1179,<8
step
    #completewith Mine
    .goto Elwynn Forest,39.00,82.27,15 >>进入法戈第矿洞
step
    #completewith Goldtooth
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r，拾取|cRXP_LOOT_金砂|r和|cRXP_LOOT_狗头人的蜡烛|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step
    #label Mine
    .goto Elwynn Forest,39.07,80.87,12,0
    .goto Elwynn Forest,39.71,79.92
    >>进入法戈第矿洞中较大的开阔区域
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    #completewith next
    .goto Elwynn Forest,39.95,78.81,12,0
    .goto Elwynn Forest,40.43,78.33,12,0
    .goto Elwynn Forest,41.73,78.03,40 >>前往 |cRXP_ENEMY_金牙|r 处
step
    #label Goldtooth
    .goto Elwynn Forest,41.73,78.03
    >>击杀|cRXP_ENEMY_金牙|r，拾取|cRXP_LOOT_波尼斯的项链|r
    .complete 87,1 --Collect Bernice's Necklace (x1)
    .mob 金牙
step
#loop
	.line Elwynn Forest,39.14,82.87,39.16,84.79,37.81,85.40,36.76,83.19,38.02,81.70,39.14,82.87
	.goto Elwynn Forest,39.14,82.87,35,0
	.goto Elwynn Forest,39.16,84.79,35,0
	.goto Elwynn Forest,37.81,85.40,35,0
	.goto Elwynn Forest,36.76,83.19,35,0
	.goto Elwynn Forest,38.02,81.70,35,0
	.goto Elwynn Forest,39.14,82.87,35,0
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r，拾取|cRXP_LOOT_金砂|r和|cRXP_LOOT_狗头人的蜡烛|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step << skip
    #completewith next
    .goto Elwynn Forest,41.29,79.85,-1
    .goto Elwynn Forest,41.75,78.49,-1
    .goto Elwynn Forest,41.91,77.81,-1
    .goto Elwynn Forest,40.15,80.12,-1
    .goto Elwynn Forest,39.90,81.46,-1
    .goto Elwynn Forest,40.86,81.24,-1
    .goto Elwynn Forest,40.32,79.31,-1
    .goto Elwynn Forest,39.30,60.48,30 >>|cRXP_WARN_在洞内跳到伐木机、悬空的原木、箱子或矿车灯上，然后退出角色再登录，进行下线跳点|r
    >>|cRXP_WARN_也可以跑回闪金镇|r
    >>|cRXP_WARN_注意：Itemrack 目前可能导致下线跳点后游戏界面卡住。请禁用该插件，或制作一个 /reload 宏，以便发生此情况时点击|r
    .link https://www.youtube.com/watch?v=SWBtPqm5M0Q >>|cRXP_WARN_点击这里了解如何进行下线跳点|r
step
    #completewith next
    .subzone 87 >> 返回闪金镇
step
    .goto Elwynn Forest,42.14,67.26
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_雷米|r 交谈
    .turnin 47 >> 交任务：金砂交易
    .accept 40 >> 接任务：鱼人的威胁
    .target 雷米
step
    .goto Elwynn Forest,42.105,65.927
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_杜汉|r 交谈
    .turnin 40 >> 交任务：鱼人的威胁
    .accept 35 >> 接任务：卫兵托马斯
    .turnin 62 >> 交任务：法戈第矿洞
    .accept 76 >> 接任务：玉石矿洞
    .target 治安官杜汉
step
    .goto Elwynn Forest,43.283,65.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入旅店时隔墙与|cRXP_FRIENDLY_威廉|r交谈
    .turnin 60 >> 交任务：狗头人的蜡烛
    .accept 61 >> 接任务：送往暴风城的货物
    .turnin 107 >> 交任务：给威廉·匹斯特的信
    .accept 112 >> 接任务：收集海藻
    .target 威廉·匹斯特
step
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法雷|r交谈
    >>|cRXP_BUY_购买35瓶|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .vendor >>卖掉杂物
    .collect 1179,35,432,1 --Ice Cold Milk (35)
    .target 旅店老板法雷
step
    .goto Elwynn Forest,43.96,65.92
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛葛|r交谈
    .vendor >>|cRXP_BUY_购买一个|r|T133634:0|t[棕色小包]|cRXP_BUY_（向他购买）|r
	.target 布洛葛·哈姆菲斯特
    .money <0.05
step
    #completewith next
    .goto Elwynn Forest,43.24,65.96,10,0
    .goto Elwynn Forest,42.88,65.52,12 >> 离开旅店
step
    .goto Elwynn Forest,50.45,62.69,50,0
    .goto Elwynn Forest,51.09,64.75,50,0
    .goto Elwynn Forest,52.66,64.95,50,0
    .goto Elwynn Forest,54.10,62.74,50,0
    .goto Elwynn Forest,57.48,63.21,50,0
    .goto Elwynn Forest,56.37,66.50
    >>击杀|cRXP_ENEMY_鱼人士兵|r和|cRXP_ENEMY_鱼人|r，拾取|cRXP_LOOT_水晶藻叶|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_鱼人士兵|r拥有|r|T132307:0|t[移动速度提高]
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
	.mob 鱼人士兵
	.mob 鱼人
step
    #completewith next
    .goto Elwynn Forest,61.66,53.96,12 >>进入玉石矿洞
step
    .goto Elwynn Forest,61.19,51.47,12,0
    .goto Elwynn Forest,60.68,50.84,12,0
    .goto Elwynn Forest,60.40,50.16
    >>沿洞穴中间的路线前进
    >>|cRXP_WARN_小心，|cRXP_ENEMY_狗头人地卜师|r会施放|r|T135812:0|t[火球术]|cRXP_WARN_（远程施法：造成约30点伤害）|r
    .complete 76,1 --Scout through the Jasperlode Mine
step
    #completewith next
    .goto Elwynn Forest,60.68,50.84,12,0
    .goto Elwynn Forest,61.19,51.47,12,0
    .goto Elwynn Forest,61.81,53.89,15 >>离开玉石矿洞
step
    .goto Elwynn Forest,73.973,72.179
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托马斯|r 交谈
    .turnin 35 >> 交任务：卫兵托马斯
    .accept 37 >> 接任务：失踪的卫兵
    .accept 52 >> 接任务：保卫边境
    .target 卫兵托马斯
step
    #completewith next
    .goto Elwynn Forest,74.89,67.20,45,0
    .goto Elwynn Forest,72.59,65.60,45,0
    .goto Elwynn Forest,71.61,60.82,50,0
    >>击杀所有看到的|cRXP_ENEMY_森林熊幼崽|r和|cRXP_ENEMY_觅食的灰狼|r
    .complete 52,2 --Kill Young Forest Bear (x5)
    .unitscan +森林熊幼崽
    .complete 52,1 --Kill Prowler (x8)
	.mob +觅食的灰狼
step
    .goto Elwynn Forest,72.65,60.33
	>>点击地上的|cRXP_PICK_被吃掉一半的尸体|r
    >>|cRXP_WARN_采集需要 5 秒读条|r
    .turnin 37 >> 交任务：失踪的卫兵
    .accept 45 >> 接任务：罗尔夫的下落
step
    #completewith Bears
    .goto Elwynn Forest,78.78,60.94,70,0
    >>击杀所有看到的|cRXP_ENEMY_森林熊幼崽|r和|cRXP_ENEMY_觅食的灰狼|r
    .complete 52,2 --Kill Young Forest Bear (x5)
    .unitscan +森林熊幼崽
    .complete 52,1 --Kill Prowler (x8)
	.mob +觅食的灰狼
step
    .goto Elwynn Forest,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱琳|r 交谈
    .accept 5545 >> 接任务：木材危机
    .target 管理员莱琳
step
    #completewith next
    >>拾取树根处的|cRXP_PICK_木柴|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .complete 5545,1 --Collect Bundle of Wood (x8)
step
    .goto Elwynn Forest,79.79,55.51,45 >> 前往|cRXP_PICK_罗尔夫的尸体|r处
    .isOnQuest 45
step
    .goto Elwynn Forest,79.79,55.51
    >>击杀|cRXP_ENEMY_鱼人潜伏者|r和|cRXP_ENEMY_鱼人觅食者|r，它们守着|cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_可能需要先击杀一个，然后脱战重置|r
    >>小心，|cRXP_ENEMY_鱼人潜伏者|r会施放|T132090:0|t[背刺] |cRXP_WARN_（近战瞬发：从背后攻击造成双倍伤害）；|cRXP_ENEMY_鱼人觅食者|r会施放|r |T135915:0|t[饮用初级药水] |cRXP_WARN_（对自身施放：恢复约65点生命值）|r
	>>点击地上的|cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_采集需要 5 秒读条|r
    .turnin 45 >> 交任务：罗尔夫的下落
    .accept 71 >> 接任务：回复托马斯
step
#loop
	.line Elwynn Forest,80.48,55.18,80.88,53.88,79.68,52.31,80.86,52.17,80.88,53.88,80.48,55.18,79.76,56.70,80.15,60.03,80.24,61.46,81.27,61.59,81.58,62.64,82.79,60.12,83.25,61.12,83.48,59.19,81.77,59.17,80.48,55.18
	.goto Elwynn Forest,80.48,55.18,35,0
	.goto Elwynn Forest,80.88,53.88,35,0
	.goto Elwynn Forest,79.68,52.31,35,0
	.goto Elwynn Forest,80.86,52.17,35,0
	.goto Elwynn Forest,80.88,53.88,35,0
	.goto Elwynn Forest,80.48,55.18,35,0
	.goto Elwynn Forest,79.76,56.70,35,0
	.goto Elwynn Forest,80.15,60.03,35,0
	.goto Elwynn Forest,80.24,61.46,35,0
	.goto Elwynn Forest,81.27,61.59,35,0
	.goto Elwynn Forest,81.58,62.64,35,0
	.goto Elwynn Forest,82.79,60.12,35,0
	.goto Elwynn Forest,83.25,61.12,35,0
	.goto Elwynn Forest,83.48,59.19,35,0
	.goto Elwynn Forest,81.77,59.17,35,0
	.goto Elwynn Forest,80.48,55.18,35,0
    >>拾取树根处的|cRXP_PICK_木柴|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .complete 5545,1 --Collect Bundle of Wood (x8)
step
    .goto Elwynn Forest,81.382,66.112
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_莱琳|r 交谈
    .turnin 5545 >> 交任务：木材危机
    .target 管理员莱琳
step
    #label Bears
    .goto Elwynn Forest,79.457,68.789
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨拉|r 交谈
    .accept 83 >> 接任务：红色亚麻布
    .target 萨拉·迪博雷恩
step
    .goto Elwynn Forest,75.05,72.54,0
    .goto Elwynn Forest,74.89,67.20,45,0
    .goto Elwynn Forest,75.75,74.57,45,0
    .goto Elwynn Forest,76.66,76.68,45,0
    .goto Elwynn Forest,79.27,79.44,45,0
    .goto Elwynn Forest,81.57,76.85,45,0
    .goto Elwynn Forest,74.89,67.20,45,0
    .goto Elwynn Forest,75.75,74.57,45,0
    .goto Elwynn Forest,76.66,76.68,45,0
    .goto Elwynn Forest,79.27,79.44,45,0
    .goto Elwynn Forest,81.57,76.85
    >>击杀所有看到的|cRXP_ENEMY_森林熊幼崽|r和|cRXP_ENEMY_觅食的灰狼|r
    >>|cRXP_WARN_对|cRXP_ENEMY_森林熊幼崽|r和|cRXP_ENEMY_觅食的灰狼|r造成51%以上的伤害，然后将它们拉到|cRXP_FRIENDLY_暴风城卫兵|r处，以便更高效地击杀|r
    .complete 52,2 --Kill Young Forest Bear (x5)
    .complete 52,1 --Kill Prowler (x8)
    .unitscan 森林熊幼崽
    .mob 觅食的灰狼
step
    .goto Elwynn Forest,73.973,72.179
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托马斯|r 交谈
    .turnin 52 >> 交任务：保卫边境
    .turnin 71 >> 交任务：回复托马斯
    .accept 39 >> 接任务：托马斯的报告
    .accept 109 >> 接任务：向格里安·斯托曼报到
    .target 卫兵托马斯
    .xp <9,1
step
    .goto Elwynn Forest,73.973,72.179
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_托马斯|r 交谈
    .turnin 52 >> 交任务：保卫边境
    .turnin 71 >> 交任务：回复托马斯
    .accept 39 >> 接任务：托马斯的报告
    .target 卫兵托马斯
step
#loop
	.line Elwynn Forest,70.45,76.94,68.68,76.69,68.23,77.78,67.80,80.76,68.49,82.68,70.71,81.48,70.63,80.66,71.51,78.96,70.95,77.25,71.38,76.77,70.95,77.25,70.45,76.94
	.goto Elwynn Forest,70.45,76.94,40,0
	.goto Elwynn Forest,68.68,76.69,40,0
	.goto Elwynn Forest,68.23,77.78,40,0
	.goto Elwynn Forest,67.80,80.76,40,0
	.goto Elwynn Forest,68.49,82.68,40,0
	.goto Elwynn Forest,70.71,81.48,40,0
	.goto Elwynn Forest,70.63,80.66,40,0
	.goto Elwynn Forest,71.51,78.96,40,0
	.goto Elwynn Forest,70.95,77.25,40,0
	.goto Elwynn Forest,71.38,76.77,40,0
	.goto Elwynn Forest,70.95,77.25,40,0
	.goto Elwynn Forest,70.45,76.94,40,0
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r，拾取|cRXP_LOOT_红色亚麻面罩|r和|T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    >>|cRXP_WARN_使用|T134939:0|t[|cRXP_LOOT_西部荒野地契|r]开启任务|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .collect 1972,1,184,1 --Collect Westfall Deed (x1)
    .disablecheckbox
	.mob 迪菲亚强盗
    .isOnQuest 83
step
    #label Deed
    >>|cRXP_WARN_使用 |T134939:0|t[|cRXP_LOOT_西部荒野地契|r] 开启任务|r
    .accept 184 >> 接任务：法布隆的地契
    .itemcount 1972,1
step
    .goto Elwynn Forest,69.89,79.52
    >>击杀|cRXP_ENEMY_公主|r，拾取|cRXP_LOOT_黄铜项圈|r
    >>|cRXP_WARN_记得利用栅栏风筝她|r
    .complete 88,1 --Collect Brass Collar (x1)
    .mob 公主
step
    .goto Elwynn Forest,79.457,68.789
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_萨拉|r 交谈
    .turnin 83 >> 交任务：红色亚麻布
    .target 萨拉·迪博雷恩
    .isQuestComplete 83
step << skip
    .goto Redridge Mountains,9.62,71.36
    .zone Redridge Mountains >> 前往赤脊山
    .isOnQuest 88
step << skip
    #completewith next
    +|cRXP_WARN_沿道路小心前往|cRXP_FRIENDLY_艾蕾娜|r处。途中避开|cRXP_ENEMY_狼蛛|r和|cRXP_ENEMY_黑龙雏龙|r|r
    .mob 黑龙雏龙
    .mob 狼蛛
step << skip
    .goto Redridge Mountains,30.59,59.41
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_艾蕾娜|r 交谈
    .fp Redridge Mountains >> 获取赤脊山飞行点
    .target 艾蕾娜·斯托姆法瑟
step
    #completewith next
    .hs >> 炉石回闪金镇
step
    .goto Elwynn Forest,43.283,65.721
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威廉|r 交谈
    .turnin 112 >> 交任务：收集海藻
    .accept 114 >> 接任务：梅贝尔的隐形水
    .target 威廉·匹斯特
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜汉|r和|cRXP_FRIENDLY_阿古斯|r交谈
    .turnin 39 >> 交任务：托马斯的报告
    .turnin 76 >> 交任务：玉石矿洞
    .accept 239 >> 接任务：西泉要塞
    .accept 109 >> 接任务：向格里安·斯托曼报到
    .target +治安官杜汉
    .goto Elwynn Forest,42.105,65.927
    .accept 1097 >> 接任务：艾尔默的任务
    .target +铁匠阿古斯
    .goto Elwynn Forest,41.706,65.544
step
    .goto Elwynn Forest,43.16,89.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_梅贝尔|r交谈
    .turnin 114 >> 交任务：梅贝尔的隐形水
    .target 梅贝尔·马科伦
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r和|cRXP_FRIENDLY_波尼斯|r交谈
    .turnin 88,3 >> 交任务：公主必须死！
    .target +斯通菲尔德妈妈
    .goto Elwynn Forest,34.660,84.482
    .turnin 87 >> 交任务：金牙
    .goto Elwynn Forest,34.486,84.253
    .target +波尼斯·斯通菲尔德姑妈
step
#loop
	.line Elwynn Forest,31.15,85.36,33.08,86.64,33.51,85.22,32.17,83.88,31.15,85.36
	.goto Elwynn Forest,31.15,85.36,35,0
	.goto Elwynn Forest,33.08,86.64,35,0
	.goto Elwynn Forest,33.51,85.22,35,0
	.goto Elwynn Forest,32.17,83.88,35,0
	.goto Elwynn Forest,31.15,85.36,35,0
    .xp 9+4225 >> 刷怪至 4225+/6500 经验值
    .mob 石牙野猪
    .isOnQuest 184
step
#loop
	.line Elwynn Forest,31.15,85.36,33.08,86.64,33.51,85.22,32.17,83.88,31.15,85.36
	.goto Elwynn Forest,31.15,85.36,35,0
	.goto Elwynn Forest,33.08,86.64,35,0
	.goto Elwynn Forest,33.51,85.22,35,0
	.goto Elwynn Forest,32.17,83.88,35,0
	.goto Elwynn Forest,31.15,85.36,35,0
    .xp 9+4825 >> 刷怪至 4825+/6500 经验值
    .mob 石牙野猪
    .itemcount 1972,<1
step
    .goto Elwynn Forest,24.23,74.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_瑞尼尔|r 交谈
    .turnin 239 >> 交任务：西泉要塞
    .target 瑞尼尔副队长
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜|r交谈
    .accept 64 >> 接任务：遗失的怀表
    .turnin 184 >> 交任务：法布隆的地契
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .accept 36 >> 接任务：杂味炖肉
    .accept 151 >> 接任务：老马布兰契
    .goto Westfall,59.91,19.41
    .target +弗娜·法布隆
    .isOnQuest 184
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜|r交谈
    .accept 64 >> 接任务：遗失的怀表
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .accept 36 >> 接任务：杂味炖肉
    .accept 151 >> 接任务：老马布兰契
    .target +弗娜·法布隆
    .goto Westfall,59.91,19.41
step
    #completewith next
    >>打开地上的|cRXP_PICK_燕麦袋|r，拾取|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .complete 151,1 --Handful of Oats (8)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t先与|cRXP_FRIENDLY_农夫萨丁|r交谈，再与屋内的|cRXP_FRIENDLY_萨尔玛|r交谈
    .accept 9 >>接任务：清理荒野
    .target +农夫萨丁
    .goto Westfall,56.04,31.23
    .turnin 36 >> 交任务：杂味炖肉
    .accept 38 >> 接任务：杂味炖肉
    .accept 22 >> 接任务：猪肝馅饼
    .target +萨尔玛·萨丁
    .goto Westfall,56.42,30.52
step
    #completewith next
    >>|cRXP_WARN_途中务必小心|cRXP_ENEMY_看守傀儡|r和|cRXP_ENEMY_麦田傀儡|r|r
    .goto Westfall,56.33,47.52,20 >>前往 |cRXP_FRIENDLY_格里安|r 处
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t先与|cRXP_FRIENDLY_格里安|r、|cRXP_FRIENDLY_丹努文|r交谈，再与屋内的|cRXP_FRIENDLY_刘易斯|r交谈
    .turnin 109 >> 交任务：向格里安·斯托曼报到
    .accept 12 >> 接任务：西部荒野人民军
    .target +格里安·斯托曼
    .goto Westfall,56.33,47.52
    .accept 102 >> 接任务：西部荒野的豺狼人
    .target +丹努文队长
    .goto Westfall,56.42,47.62
    .accept 6181 >> 接任务：快递消息
    .goto Westfall,57.002,47.169
    .target +军需官刘易斯
step
    .goto Westfall,56.56,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    .turnin 6181 >> 交任务：快递消息
    .accept 6281 >> 接任务：赶赴暴风城
    .target 索尔
step
    #completewith next
    .goto Westfall,56.56,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_索尔|r 交谈
    .fly Stormwind >> 飞往暴风城
	.target 索尔
step
    #completewith next
    .goto StormwindClassic,63.10,65.18,20,0
    .goto StormwindClassic,58.13,59.40,20,0
    .goto StormwindClassic,57.06,61.83,20,0
    .goto StormwindClassic,56.55,64.79,12,0
    .goto StormwindClassic,56.20,64.60,12 >>前往 |cRXP_FRIENDLY_摩根|r 处
step
    .goto StormwindClassic,56.20,64.60
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_摩根|r 交谈
    .turnin 61,1 >> 交任务：送往暴风城的货物
    .target 摩根·匹斯特
step
    .goto Stormwind City,55.46,65.26
    >>与|cRXP_FRIENDLY_凯德雷克|r交谈
    .vendor 1257 >> |cRXP_BUY_购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_（向他购买，若有货）|r
    .target 凯德雷克·布舍尔
step << skip
    #completewith next
    .goto Stormwind City,51.68,59.86,8,0
    .goto Stormwind City,51.83,60.41,4,0
    .goto Stormwind City,51.59,60.15,6,0
    .goto Stormwind City,39.17,76.58,12,0
    >>|cRXP_WARN_跳上火把，然后跳下去，进入暴风城地下|r
    >>|cRXP_WARN_将阴影设为“一般”或“低”，站在蓝色虚空前方、恐龙德里克双脚中间（泥地较浅处），然后径直向前走|r
    .goto Stormwind City,38.61,79.39,10 >>前往|cRXP_FRIENDLY_詹妮亚|r处
step << skip
    .goto Stormwind City,38.61,79.39
    >>与|cRXP_FRIENDLY_詹妮亚|r交谈
    .trainer >> 学习职业技能（霜甲术等级2、冰霜新星、变形术、造水术等级1和等级2）
    >>总花费：15银币
    >>记得留钱购买治疗药水（每瓶3银）、青铜管（每根8银）和5级食物（每20铜购买5份）
    .target 詹妮亚·坎农
step << skip
    #completewith next
    .goto Stormwind City,36.30,82.90,6 >>穿过绿色传送门
step
    #completewith next
    .goto StormwindClassic,57.32,59.15,10,0
    .goto StormwindClassic,58.17,57.90,12,0
    .goto StormwindClassic,57.81,54.73,12,0
    .goto StormwindClassic,60.05,51.60,12,0
    .goto StormwindClassic,67.54,46.88,12,0
    .goto StormwindClassic,71.01,48.62,12,0
    .goto StormwindClassic,74.31,47.22,12 >>前往|cRXP_FRIENDLY_奥斯瑞克|r处
step
    .goto StormwindClassic,74.31,47.22
    >>与|cRXP_FRIENDLY_奥斯瑞克|r交谈
    .turnin 6281 >> 交任务：赶赴暴风城
    .accept 6261 >> 接任务：杜加尔·朗德瑞克
    .target 奥斯瑞克·斯图恩
step
    #completewith next
    .goto StormwindClassic,69.20,40.75,15,0
    .goto StormwindClassic,67.03,40.27,15,0
    .goto StormwindClassic,64.49,36.75,15,0
    .goto StormwindClassic,64.97,29.32,15,0
    .goto StormwindClassic,51.89,13.19,12,0
    .goto StormwindClassic,51.76,12.08,12 >>前往 |cRXP_FRIENDLY_格瑞曼德|r 处
step
    .goto StormwindClassic,51.76,12.08
    >>与|cRXP_FRIENDLY_格瑞曼德|r交谈
    .turnin 1097 >> 交任务：艾尔默的任务
    .accept 353 >> 接任务：雷矛的包裹
    .target 格瑞曼德·艾尔默
step
    .goto Stormwind City,55.25,7.07
    >>与|cRXP_FRIENDLY_比利巴布|r交谈
    .vendor 5519 >>|cRXP_BUY_向他购买一根|r|T133024:0|t[青铜管]|cRXP_BUY_（如果有货）|r
    .target 比利巴布·旋轮
    .itemcount 4371,<1
    .money <0.08
step
    #completewith next
    .goto Stormwind City,63.89,8.25,20 >> 前往矿道地铁
step
    #label Monty
    .goto Ironforge,76.41,51.22,30,0
    >>乘坐地铁后与|cRXP_FRIENDLY_蒙提|r交谈
    .accept 6661 >> 接任务：捕捉矿道老鼠
    .target 蒙提
step
    >>在矿道地铁中使用|T133942:0|t[捕鼠者之笛]捕捉|cRXP_FRIENDLY_矿道老鼠|r
    .complete 6661,1 --Rats Captured (x5)
    .target 矿道老鼠
    .use 17117
step
    >>与|cRXP_FRIENDLY_蒙提|r交谈
--  >>|cRXP_WARN_Wait out the RP|r
    .turnin 6661 >> 交任务：捕捉矿道老鼠
    .target 蒙提
    .zoneskip Stormwind City
step
    .zone Ironforge >> 进入铁炉堡
    .isQuestAvailable 314
step
    .goto Ironforge,67.83,42.47
    >>与|cRXP_FRIENDLY_考格斯宾|r交谈
    .vendor 5175 >>|cRXP_BUY_向他购买一根|r|T133024:0|t[青铜管]|cRXP_BUY_（如果有货）|r
    .target 考格斯宾
    .itemcount 4371,<1
    .isQuestAvailable 174
step
    #completewith next
    .goto Ironforge,69.93,34.13,30,0
    .goto Ironforge,63.03,30.09,30,0
    .goto Ironforge,57.78,35.11,30,0
    .goto Ironforge,55.49,47.74,10 >>前往|cRXP_FRIENDLY_格莱斯|r处
step
    .goto Ironforge,55.50,47.74
    >>与|cRXP_FRIENDLY_格莱斯|r交谈
    .fp Ironforge >> 获取铁炉堡飞行点
    .target 格莱斯·瑟登
step
    #completewith next
    .goto Ironforge,49.11,56.02,30,0
    .goto Ironforge,44.08,46.60,20,0
    .goto Ironforge,40.84,44.59,20,0
    .goto Ironforge,35.30,32.76,20,0
    .goto Ironforge,27.60,11.06,20,0
    .goto Ironforge,27.17,8.58,10 >>前往|cRXP_FRIENDLY_丁克|r处
step
    .goto Ironforge,27.17,8.58
    >>与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >> 学习职业技能（霜甲术等级2、冰霜新星、变形术、造水术等级1和等级2）
    >>总花费：15银币
    >>记得留钱购买治疗药水（每瓶3银）、青铜管（每根8银）和5级食物（每20铜购买5份）
    .target 丁克
step
    #completewith IFHS
    +|cRXP_WARN_前往旅店途中不断施放|r|T132794:0|t[造水术（等级2）]
step
    #completewith next
    .goto Ironforge,27.25,12.79,20,0
    .goto Ironforge,22.59,38.13,20,0
    .goto Ironforge,20.40,53.19,20,0
    >>进入建筑
    .goto Ironforge,18.14,51.45,10 >>前往|cRXP_FRIENDLY_火酒|r处
step
    #label IFHS
    .goto Ironforge,18.14,51.45
    >>与|cRXP_FRIENDLY_火酒|r交谈
    .home >> 将炉石设为铁炉堡
    .target 旅店老板洛雷·火酒
step
    #completewith BankDeposit
    .goto Ironforge,33.05,63.11,20,0
    .goto Ironforge,35.93,60.13,30 >>进入铁炉堡银行
step
    #label BankDeposit
    .goto Ironforge,35.93,60.13
    >>与|cRXP_FRIENDLY_拜雷|r交谈
    .bankdeposit 4371,16115 >> 将以下物品存入银行：
    >>|T133024:0|t[青铜管]
    >>|T132763:0|t[奥斯瑞克的箱子]
    .target 拜雷·石衣
step << skip
    .goto Ironforge,36.35,57.88
    .goto Dun Morogh,53.03,35.71,10 >>|cRXP_WARN_跳到银行金库两侧的顶部，利用下线跳点前往丹莫罗|r
    .isQuestAvailable 314
step
    .goto Ironforge,15.16,85.70,20,0
    .goto Dun Morogh,59.84,49.56
    .zone Dun Morogh >> 离开铁炉堡，前往丹莫罗
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#classic
#tbc
<< Human Mage
#name 10-11 ADV Dun Morogh Human Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor Human Mage
#next 10-12 ADV Darkshore 1 Mage AoE
#displayname 10-11 丹莫罗（人类法师进阶 AoE）
step
    #completewith Rudra
    #label Dirt
    .goto Dun Morogh,59.84,49.56,40,0
    .goto Dun Morogh,61.36,47.07,40 >>沿土路上行
    .isQuestAvailable 314
step
    #completewith next
    #requires Dirt
    +|cRXP_WARN_将|cRXP_ENEMY_瓦加什|r一路风筝下行至|r|cRXP_FRIENDLY_鲁德拉·冻石|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >>|cRXP_WARN_遇到困难时点击此处|r
    .mob 瓦加什
step
    #label Rudra
    .goto Dun Morogh,63.08,49.85
    >>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >> 接任务：保护牲畜
    .target 鲁德拉·冻石
step
    .goto Dun Morogh,62.57,46.14,0
    .goto Dun Morogh,62.78,54.60,40,0
    .goto Dun Morogh,62.82,55.73
    >>击杀|cRXP_ENEMY_瓦加什|r，并拾取掉落的|cRXP_LOOT_瓦加什的牙齿|r
    >>|cRXP_WARN_将|cRXP_ENEMY_瓦加什|r风筝到牧场南侧的|cRXP_FRIENDLY_丹莫罗巡山人|r那里，确保对它造成至少51%的伤害|r
    >>|cRXP_WARN_记得获取冻土岭的探索经验；方便的话，把|cRXP_ENEMY_雪豹|r也风筝到|cRXP_FRIENDLY_丹莫罗巡山人|r那里|r
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob 瓦加什
step
    .goto Dun Morogh,63.08,49.85
    >>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314,3 >> 交任务：保护牲畜
    .target 鲁德拉·冻石
step
    #completewith Ghilm
    +|cRXP_WARN_记得保留练级时获得的|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_后续将|r |T133971:0|t[烹饪]|cRXP_WARN_提升到50点时需要用|r
step
    #completewith next
    .goto Dun Morogh,66.34,50.92,50,0
    .goto Dun Morogh,67.72,53.66,30,0
    +|cRXP_WARN_将|cRXP_ENEMY_冰爪熊|r风筝到|cRXP_FRIENDLY_铁炉堡巡山人|r那里（确保造成至少51%的伤害以获得击杀归属）|r
    >>|cRXP_WARN_小心，它们会施放|r |T135853:0|t[冰爪]|cRXP_WARN_（瞬发近战攻击：额外造成4点近战伤害）|r
    .mob 冰爪熊
step
    #sticky
    #label Ghilm
    .goto Dun Morogh,68.40,54.45,0,0
    >>与|cRXP_FRIENDLY_格瑞姆|r交谈
    .train 2550 >> 学习 |T133971:0|t[烹饪]
    .target 厨师格瑞姆
step
    .goto Dun Morogh,68.43,54.46,8,0
    .goto Dun Morogh,68.53,54.64
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买15个|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,15,432,1 --Ice Cold Milk (15)
    .target 卡杉·莫格什
    .money <0.0395
step
    .goto Dun Morogh,68.43,54.46,8,0
    .goto Dun Morogh,68.53,54.64
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买10个|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,10,432,1 --Ice Cold Milk (10)
    .target 卡杉·莫格什
    .money <0.0260
step
    .goto Dun Morogh,68.43,54.46,8,0
    .goto Dun Morogh,68.53,54.64
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买5个|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,5,432,1 --Ice Cold Milk (5)
    .target 卡杉·莫格什
    .money <0.0135
step
    #requires Ghilm
    >>与|cRXP_FRIENDLY_参议员梅尔·圣石|r和|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 433 >> 接任务：公众之仆
    .target +参议员梅尔·圣石
    .goto Dun Morogh,68.67,55.97
    .accept 432 >> 接任务：该死的石腭怪！
    .goto Dun Morogh,69.084,56.330
    .target +工头乔尼·石眉
step
    #completewith Bonesnappers
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    >>|cRXP_WARN_无需特意绕路击杀它们|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
step
    #completewith next
    .goto Dun Morogh,70.74,56.23,30 >>进入洞穴
step
    #label Bonesnappers
    .goto Dun Morogh,70.98,54.31,40,0
    .goto Dun Morogh,70.83,53.17,40,0
    .goto Dun Morogh,71.94,50.48,40,0
    .goto Dun Morogh,72.55,51.50,40,0
    .goto Dun Morogh,72.62,52.56
    >>击杀洞穴内的|cRXP_ENEMY_石腭断骨者|r
    >>|cRXP_WARN_小心，它们会施放|r |T132154:0|t[击倒]|cRXP_WARN_（瞬发近战攻击：使你昏迷2秒）|r
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob 石腭断骨者
step
    .goto Dun Morogh,70.74,56.23,30,0
#loop
	.line Dun Morogh,69.93,57.29,70.57,58.61,69.68,59.37,68.36,59.57,69.16,57.51,69.93,57.29
	.goto Dun Morogh,69.93,57.29,30,0
	.goto Dun Morogh,70.57,58.61,30,0
	.goto Dun Morogh,69.68,59.37,30,0
	.goto Dun Morogh,68.36,59.57,30,0
	.goto Dun Morogh,69.16,57.51,30,0
	.goto Dun Morogh,69.93,57.29,30,0
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
step
    #sticky
    #label Frast
    .goto Dun Morogh,68.87,55.96,0,0
    >>与|cRXP_FRIENDLY_弗拉斯特·多克南|r交谈
    .vendor >> 卖掉杂物
    .target 弗拉斯特·多克南
    .isQuestAvailable 419
step
    >>与|cRXP_FRIENDLY_工头乔尼·石眉|r和|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 432 >> 交任务：该死的石腭怪！
    .target +工头乔尼·石眉
    .goto Dun Morogh,69.084,56.330
    .turnin 433 >> 交任务：公众之仆
    .goto Dun Morogh,68.67,55.97
    .target +参议员梅尔·圣石
step
    #requires Frast
    .goto Dun Morogh,69.33,55.46
    >>与|cRXP_FRIENDLY_丹克|r交谈
    .train 2575 >> 学习专业技能：|T136248:0|t[采矿]
    .target 丹克·利刃
step
    #label Shortcut1
    #completewith Pilot
    .goto Dun Morogh,70.35,55.28,5,0
    .link https://youtu.be/G2IscpFZVeQ?t=4034 >>|cRXP_WARN_遇到困难时点击此处|r
    .goto Dun Morogh,70.52,54.75,12 >>从|cRXP_FRIENDLY_丹克|r身后的近路上山
step
    #completewith Pilot
    #requires Shortcut1
    #label Shortcut2
    .goto Dun Morogh,70.97,50.70,50,0
    .goto Dun Morogh,72.90,49.79,50,0
    .goto Dun Morogh,77.11,48.82,50 >>|cRXP_WARN_将附近的|cRXP_ENEMY_石腭伏击者|r风筝到路上巡逻的|cRXP_FRIENDLY_铁炉堡巡山人|r那里（确保造成至少51%的伤害以获得击杀归属）|r
    .mob 石腭伏击者
    .unitscan 铁炉堡巡山人
step
    #requires Shortcut2
    #completewith next
    .goto Dun Morogh,81.23,42.66,50,0
    .goto Dun Morogh,83.01,40.31,30 >>风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r穿过隧道
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（瞬发自身技能：提高移动速度，持续3秒；命中时造成40–100点近战伤害，只能在远处施放）|r
    .mob 有伤疤的峭壁野猪
step
    #label Pilot
    .goto Dun Morogh,83.89,39.19
    >>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >> 接任务：失踪的驾驶员
    .target 驾驶员塞克·锤足
step
    .goto Dun Morogh,81.37,37.02,30,0
    .goto Dun Morogh,79.67,36.17
    >>点击地面上的|cRXP_PICK_矮人尸体|r
    >>|cRXP_WARN_确保背包里有空位；如果不接取下一个任务，|cRXP_ENEMY_癞爪|r就不会下来|r
    >>|cRXP_WARN_记得将|cRXP_ENEMY_癞爪|r风筝回|cRXP_FRIENDLY_驾驶员塞克·锤足|r身边|r
    .turnin 419 >> 交任务：失踪的驾驶员
    .accept 417 >> 接任务：驾驶员的复仇
step
    .goto Dun Morogh,78.41,37.80,60,0
    .goto Dun Morogh,83.89,39.19
    >>击杀|cRXP_ENEMY_癞爪|r，并拾取掉落的|cRXP_LOOT_肮脏的爪子|r
    >>|cRXP_WARN_一路把它风筝到|cRXP_FRIENDLY_驾驶员塞克·锤足|r身边（记得造成至少51%的伤害以获得击杀归属）|r
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob 癞爪
    .target 驾驶员塞克·锤足
step
    .goto Dun Morogh,83.892,39.188
    >>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 417,1 >> 交任务：驾驶员的复仇
    .target 驾驶员塞克·锤足
step
    #label Tunnel1
    #completewith Cobbleflint
    .goto Dun Morogh,83.01,40.31,30,0
    .goto Dun Morogh,81.23,42.66,30 >>穿过隧道原路返回
step
    #requires Tunnel1
    #completewith Cobbleflint
    .goto Dun Morogh,79.61,49.94,20,0
    .goto Dun Morogh,81.10,49.76,20,0
    .goto Dun Morogh,81.60,50.01,20,0
    .goto Dun Morogh,83.59,49.18,20,0
    >>沿途风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r
    .goto Dun Morogh,84.26,48.93,20 >>执行跳山操作，记得小心落下
    .mob 有伤疤的峭壁野猪
step
    .goto Loch Modan,19.01,61.88
    >>风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r穿过隧道
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋] |cRXP_WARN_（瞬发自身技能：提高移动速度，持续3秒；命中时造成40–100点近战伤害，只能在远处施放）|r
    .zone Loch Modan >> 穿过隧道前往洛克莫丹
    .mob 有伤疤的峭壁野猪
step
    #completewith Rugelfuss
    +|cRXP_WARN_尽量把附近的|cRXP_ENEMY_老黑熊|r或|cRXP_ENEMY_森林潜伏者|r风筝进地堡（记得造成至少51%的伤害以获得击杀归属）|r
    >>|cRXP_WARN_拾取|cRXP_ENEMY_老黑熊|r的|r |T134027:0|t[|cRXP_LOOT_熊肉|r]
    >>|cRXP_WARN_拾取|cRXP_ENEMY_森林潜伏者|r掉落的|r |T134437:0|t[|cRXP_LOOT_蜘蛛的毒液|r]
    >>|cRXP_FRIENDLY_巡山人库伯弗林特|r|cRXP_WARN_、|cRXP_FRIENDLY_巡山人格拉维戈|r和|cRXP_FRIENDLY_巡山人沃尔班|r不会帮助你|r
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .disablecheckbox
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .disablecheckbox
    .mob 老黑熊
    .mob 森林潜伏者
step
    #label Cobbleflint
    .goto Loch Modan,22.071,73.127
    >>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >> 接任务：保卫国王的领土
    .target 巡山人库伯弗林特
step
    #optional
    #completewith next
    .goto Loch Modan,23.27,75.65,12,0
    .goto Loch Modan,23.62,75.42,12,0
    .goto Loch Modan,23.12,73.93,12 >> 进入地堡，前往顶层
step
    #label Rugelfuss
    .goto Loch Modan,23.233,73.675
    >>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .accept 267 >> 接任务：穴居人的威胁
    .target 拉格弗斯上尉
step << skip
    #completewith next
    .goto Loch Modan,21.49,68.14,20,0
    .goto Loch Modan,20.86,64.46,20,0
    .goto Loch Modan,19.50,62.56,30 >>返回隧道
step << skip
    .goto Loch Modan,18.84,61.48
    .link https://www.youtube.com/watch?v=AOAlX9B5aO0 >>|cRXP_WARN_遇到困难时点击此处|r
    .goto Loch Modan,32.19,46.95,30 >>|cRXP_WARN_从隧道里的火盆处起跳，执行登出跳点传送到塞尔萨玛|r
    .isOnQuest 267
step
    #completewith next
    .subzone 144 >> 前往塞尔萨玛
step
    .goto Loch Modan,32.93,49.51,40,0
    .goto Loch Modan,34.49,47.44,40,0
    .goto Loch Modan,37.05,46.11,40,0
    .goto Loch Modan,37.39,45.17,40,0
    .goto Loch Modan,37.12,42.79
    >>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿塞尔萨玛主路巡逻|r
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    #completewith next
    .goto Loch Modan,33.94,50.96
    >>与|cRXP_FRIENDLY_索格拉姆|r交谈
    .fp Thelsamar >> 获取塞尔萨玛飞行点
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
step
    .zone Ironforge >> 前往铁炉堡
    .isOnQuest 416
step << skip
    #completewith next
    .goto Ironforge,43.83,59.58,20,0
    .goto Ironforge,38.27,71.43,20,0
    .goto Ironforge,33.70,76.24,10 >>|cRXP_WARN_前往重新登录传送的位置|r
step << skip
    .goto Ironforge,33.70,76.24
    .zone Dun Morogh >>|cRXP_WARN_调整角色位置，直到看起来像是漂浮在金属栏杆边缘，然后执行登出跳点返回丹莫罗|r
    .isOnQuest 416
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#classic
#tbc
<< Gnome Mage
#name 1-10 ADV Dun Morogh Gnome Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor Gnome Mage
#next 10-12 ADV Darkshore 1 Mage AoE
#displayname 1-10 丹莫罗（侏儒法师进阶 AoE）
step << !Gnome Mage
    #season 2
    #completewith next
    +在探索赛季中，法师应从本种族出生区域开始，否则无法在当地获得第一个符文（|T133816:0|t[铭刻手套 - 冰枪术]）
step
    #completewith next
    +你选择了进阶指南。这是游戏中升级速度最快职业——联盟法师——的最快路线，因此会用到许多少见机制，也包含难度很高的 AoE 拉怪。学习时请保持耐心，祝你好运！
step
    #completewith Adlin
	.destroy 6948 >> 删除背包里的 |T134414:0|t[炉石]，后续不再需要。
step
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯登·粗臂|r 交谈
    .accept 179 >> 接受任务：矮人的交易
    .target 斯登·粗臂
step
    .goto 1426,29.529,73.286,0
    .goto 1426,28.117,75.088,0
    .goto 1426,28.557,72.487,0
    .goto 1426,29.529,73.286,60,0
    .goto 1426,29.054,74.608,60,0
    .goto 1426,28.558,75.781,60,0
    .goto 1426,28.117,75.088,60,0
    .goto 1426,27.562,74.331,60,0
    .goto 1426,27.793,73.123,60,0
    .goto 1426,28.557,72.487,60,0
    >>击杀|cRXP_ENEMY_蓬毛幼狼|r，拾取|cRXP_LOOT_硬狼肉|r
    .complete 179,1 --Collect Tough Wolf Meat (x8)
    .mob 蓬毛幼狼
step
    #season 0
    #sticky
    #label Adlin
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    >>卖掉杂物
    >>|cRXP_BUY_购买15瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_如果钱不够，就额外刷一些|cRXP_ENEMY_蓬毛幼狼|r|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
    .xp >6,1
step
    #season 2
    .goto Dun Morogh,30.087,71.563
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    >>卖掉杂物
    >>|cRXP_BUY_购买15瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_如果钱不够，就额外刷一些|cRXP_ENEMY_蓬毛幼狼|r|r
    >>|cRXP_WARN_记得留出10铜币备用|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
    .xp >6,1
step
    #xprate <1.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯登·粗臂|r 和 |cRXP_FRIENDLY_巴尔林·霜锤|r 交谈
    .turnin 179,3 >> 交任务：矮人的交易
    .accept 233 >> 接受任务：寒脊山谷的送信任务
    .accept 3114 >> 接受任务：雕文备忘录
    .target +斯登·粗臂
    .goto Dun Morogh,29.927,71.201
    .accept 170 >> 接受任务：新的威胁
    .goto Dun Morogh,29.71,71.25
    .target +巴尔林·霜锤
step
    #xprate >1.09
    .goto Dun Morogh,29.927,71.201
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_斯登·粗臂|r 交谈
    .turnin 179,3 >> 交任务：矮人的交易
    .accept 233 >> 接受任务：寒脊山谷的送信任务
    .accept 3114 >> 接受任务：雕文备忘录
    .target 斯登·粗臂
step
    #season 2
    #xprate <1.1
    #completewith EnterAnvilmar
    .goto 1426,27.096,72.545,0
    .goto 1426,26.620,73.548,0
    .goto 1426,25.722,72.261,0
    .goto 1426,24.878,72.329,0
    .goto 1426,24.100,73.749,0
    .goto 1426,24.920,74.697,0
    .goto 1426,21.813,72.584,0
    .goto 1426,19.578,72.086,0
    .goto 1426,20.627,70.415,0
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
    .isOnQuest 170
step
    #season 2
    .goto Dun Morogh,26.733,72.552
    >>打开地面上的|cRXP_PICK_石颚提箱|r，拾取 |T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r
    >>|cRXP_WARN_注意：你无法在此处学习|r |T133816:0|t[铭刻手套 - 冰枪术]|cRXP_WARN_，因为你只能在自己种族的起始区域获得|r |T133736:0|t[理解入门]|cRXP_WARN_该物品|r << !Gnome
    .collect 203751,1,77667,1 -- Spell Notes: CALE ENCI (1)
    .train 401760,1
step
    #season 2
    #label EnterAnvilmar
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.642,68.375,12 >> 进入安威玛尔
step
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的 |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r 交谈
    .turnin 3114 >> 交任务：雕文备忘录 << Gnome
    .accept 77667 >> 接受任务：法术研究 << Gnome
    .train 1459 >> 学习 |T135932:0|t[奥术智慧]
    .target 玛瑞克·斯托纳尔
step << Gnome
    #season 2
    .train 401760 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 冰枪术]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
step << Gnome
    #season 2
    .goto Dun Morogh,28.709,66.366
    >>与|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r交谈
    .turnin 77667 >> 交任务：法术研究
    .target 玛瑞克·斯托纳尔
step << Gnome
    #season 2
    #label GlovesEquip
    #completewith Observations
    .equip 10,711 >> |cRXP_WARN_装备|r |T132961:0|t[破布手套]
    .use 711
    .train 401760,3
step << Gnome
    #season 2
    #requires GlovesEquip
    #completewith Observations
    .engrave 10 >>|cRXP_WARN_在你的|r |T132961:0|t[破布手套] 上铭刻|r |T133816:0|t[铭刻手套 - 冰枪术]
    .train 401760,3
step
    #season 2
    #optional
    #completewith Talin
    .goto 1426,28.792,68.804,12 >> 离开安威玛尔
    .subzoneskip 77,1
step
    #xprate <1.1
    #completewith Rockjaw
    .goto 1426,27.096,72.545,0
    .goto 1426,26.620,73.548,0
    .goto 1426,25.722,72.261,0
    .goto 1426,24.878,72.329,0
    .goto 1426,24.100,73.749,0
    .goto 1426,24.920,74.697,0
    .goto 1426,21.813,72.584,0
    .goto 1426,19.578,72.086,0
    .goto 1426,20.627,70.415,0
    >>击杀|cRXP_ENEMY_石腭穴居人|r和|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
    .isOnQuest 170
step
    #label Talin
    .goto Dun Morogh,22.601,71.433
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔林·锐眼|r 交谈
    .turnin 233 >> 交任务：寒脊山谷的送信任务
    .accept 183 >> 接受任务：猎杀野猪
    .accept 234 >> 接受任务：寒脊山谷的送信任务
    .target 塔林·锐眼
step
    #loop
    .goto 1426,22.276,72.549,0
    .goto 1426,20.924,70.393,0
    .goto 1426,22.662,69.331,0
    .goto 1426,24.358,72.591,0
    .goto 1426,22.276,72.549,45,0
    .goto 1426,21.209,72.266,45,0
    .goto 1426,20.880,71.470,45,0
    .goto 1426,20.924,70.393,45,0
    .goto 1426,21.330,69.261,45,0
    .goto 1426,22.035,69.231,45,0
    .goto 1426,22.662,69.331,45,0
    .goto 1426,24.317,68.026,45,0
    .goto 1426,24.754,69.257,45,0
    .goto 1426,24.878,71.191,45,0
    .goto 1426,24.358,72.591,45,0
    >>击杀|cRXP_ENEMY_小型峭壁野猪|r
    .complete 183,1 --Kill Small Crag Boar (x12)
    .mob 小型峭壁野猪
step
    .goto Dun Morogh,22.601,71.433
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_塔林·锐眼|r 交谈
    .turnin 183 >> 交任务：猎杀野猪
    .target 塔林·锐眼
step
    #label Rockjaw
    .goto 1426,25.077,75.711
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    .turnin 234 >> 交任务：寒脊山谷的送信任务
    .accept 182 >> 接受任务：巨魔洞穴
    .target 格瑞林·白须
step
    #completewith next
    >>击杀 |cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob 霜鬃巨魔幼崽
step
    .goto Dun Morogh,26.73,79.72,30 >>进入洞穴
    .isOnQuest 182
step
    .goto Dun Morogh,27.30,80.85,20,0
    .goto Dun Morogh,28.29,79.85,20,0
    .goto Dun Morogh,29.34,79.09,30,0
    .goto Dun Morogh,28.29,79.85,20,0
    .goto Dun Morogh,27.30,80.85,20,0
    .goto Dun Morogh,28.29,79.85,20,0
    .goto Dun Morogh,29.34,79.09,30,0
    .goto Dun Morogh,28.29,79.85,20,0
    .goto Dun Morogh,27.30,80.85,20,0
    .goto Dun Morogh,28.29,79.85,20,0
    .goto Dun Morogh,29.34,79.09,30,0
    .goto Dun Morogh,28.29,79.85
    >>在洞穴内击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    >>|cRXP_WARN_清理通往冻结之湖房间前的道路|r
    .complete 182,1,10 --Kill Frostmane Troll Whelp (x14)
    .mob 霜鬃巨魔幼崽
step
    .goto Dun Morogh,28.29,79.85,50,0
    .goto Dun Morogh,27.30,80.85,40,0
    .goto Dun Morogh,25.78,78.31,40,0
    .goto Dun Morogh,27.12,78.68,40,0
    .goto Dun Morogh,25.95,80.39,40,0
    .goto Dun Morogh,25.78,78.31
    >>击杀沿途的|cRXP_ENEMY_霜鬃巨魔幼崽|r，返回|cRXP_FRIENDLY_格瑞林·白须|r身边
    .complete 182,1--Kill Frostmane Troll Whelp (x14)
    .mob 霜鬃巨魔幼崽
step << skip
    #completewith next
    +|cRXP_WARN_如果不清楚如何触发登出跳点，请先观看此视频|r
    .link https://www.youtube.com/watch?v=SWBtPqm5M0Q >>|cRXP_WARN_点击此处了解如何执行登出跳点|r
step << skip
    >>与 |cRXP_FRIENDLY_格瑞林·白须|r 和 |cRXP_FRIENDLY_诺里斯·激流|r 交谈
    >>|cRXP_WARN_注意：“热酒快递”有 5 分钟时限|r
    >>|cRXP_WARN_确保背包有 3 个空格，以完成这些任务的交接|r
    .turnin 182,4 >> 交任务：巨魔洞穴
    .accept 218 >> 接受任务：被窃取的日记
    .goto Dun Morogh,25.076,75.713,-1
    .target +格瑞林·白须
    .accept 3364 >> 接受任务：热酒快递
    .goto Dun Morogh,24.98,75.96,-1
    .target +诺里斯·激流
step
    >>与 |cRXP_FRIENDLY_格瑞林·白须|r 交谈
    >>|cRXP_WARN_确保背包有 3 个空格，以完成这些任务的交接|r
    .turnin 182,4 >> 交任务：巨魔洞穴
    .accept 218 >> 接受任务：被窃取的日记
    .goto Dun Morogh,25.076,75.713
    .target +格瑞林·白须
step
    .goto Dun Morogh,26.73,79.72,40,0
    .goto Dun Morogh,29.34,79.09,30,0
    .goto Dun Morogh,29.67,79.68,10 >>|cRXP_WARN_进入洞穴，沿着已清理出的路线尽量避免战斗，前往洞穴内的冻结之湖|r
    .isOnQuest 218
step
    .goto Dun Morogh,30.48,80.16
    >>|cRXP_WARN_击杀面前的|cRXP_ENEMY_霜鬃巨魔幼崽|r|r
    >>击杀|cRXP_ENEMY_冷酷的格瑞克尼尔|r，并拾取|cRXP_LOOT_格瑞林·白须的日记|r
    >>|cRXP_WARN_小心，他会施放|r |T135849:0|t[冰霜震击]|cRXP_WARN_（远程瞬发：造成10点冰霜伤害，并使移动速度降低50%，持续8秒）|r
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
    .mob 冷酷的格瑞克尼尔
step << skip
    #completewith Rybrad
    #label LogoutSkip1
    .goto Dun Morogh,29.63,79.50
    .goto Dun Morogh,29.76,69.66,30 >>|cRXP_WARN_调整角色位置，使其看起来像是漂浮在冻结之湖上方的悬崖边缘，然后执行登出跳点返回安威玛尔|r
    .isOnQuest 218
step
    >>与 |cRXP_FRIENDLY_格瑞林·白须|r 和 |cRXP_FRIENDLY_诺里斯·激流|r 交谈
    .turnin 218 >> 交任务：被窃取的日记
    .accept 282 >> 接受任务：森内尔的观察站
    .goto Dun Morogh,25.076,75.713,-1
    .target +格瑞林·白须
    .accept 3364 >> 接受任务：热酒快递
    .goto Dun Morogh,24.98,75.96,-1
    .target +诺里斯·激流
step
    #completewith Rybrad
    #requires LogoutSkip1
    #label LogoutSkip2
    .goto Dun Morogh,28.79,69.04,20,0
    .goto Dun Morogh,28.63,68.43,10 >>进入安威玛尔
    .isOnQuest 218,3364
step
    #label Rybrad
    .goto Dun Morogh,28.66,67.74
    >>与 |cRXP_FRIENDLY_雷布莱德·寒椅|r 交谈
    .vendor >> 卖掉杂物
    .target 雷布莱德·寒椅
    .isOnQuest 218,3364
step
    >>与 |cRXP_FRIENDLY_德南·弗卡特|r 和 |cRXP_FRIENDLY_玛瑞克·斯托纳尔|r 交谈
    .turnin 3364 >> 交任务：热酒快递
    .accept 3365 >> 接受任务：归还酒杯
    .goto Dun Morogh,28.77,66.37
    .target +德南·弗卡特
    .turnin 3114 >> 交任务：雕文备忘录
    .trainer >> 学习职业技能（奥术智慧、寒冰箭）
    .goto Dun Morogh,28.709,66.366
    .target +玛瑞克·斯托纳尔
    .isQuestAvailable 420
step
    #optional
    #xprate <1.1
    .goto Dun Morogh,29.71,71.25
    >>与 |cRXP_FRIENDLY_巴尔林·霜锤|r 交谈
    .turnin 170,3 >> 交任务：新的威胁
    .target 巴尔林·霜锤
    .isQuestComplete 170
step
    #xprate <1.1
    #sticky
    #label TroggEnd
    .goto 1426,27.858,76.482,0
    .goto 1426,30.727,76.831,0
    .goto 1426,29.280,75.500,0
    .waypoint 1426,27.858,76.482,50,0
    .waypoint 1426,28.946,77.153,50,0
    .waypoint 1426,29.716,77.605,50,0
    .waypoint 1426,30.727,76.831,50,0
    .waypoint 1426,32.814,75.221,50,0
    .waypoint 1426,31.138,74.048,50,0
    .waypoint 1426,30.077,74.479,50,0
    .waypoint 1426,29.280,75.500,50,0
    >>|cRXP_WARN_击杀你遇到的所有|cRXP_ENEMY_石腭穴居人|r以及|r|cRXP_ENEMY_壮实的石腭怪|r
    .complete 170,1 --Kill Rockjaw Trogg (x6)
    .mob +石腭穴居人
    .complete 170,2 --Kill Burly Rockjaw Trogg (x6)
    .mob +壮实的石腭怪
    .isOnQuest 170
step
    #label StolenJ
    >>与 |cRXP_FRIENDLY_诺里斯·激流|r 交谈
    -- >>Talk to |cRXP_FRIENDLY_Grelin Whitebeard|r and |cRXP_FRIENDLY_Nori Pridedrift|r
    -- .turnin 218,2 >> Turn in The Stolen Journal
    -- .accept 282 >> Accept Senir's Observations
    -- .goto Dun Morogh,25.076,75.713
    -- .target +Grelin Whitebeard
    .turnin 3365 >> 交任务：归还酒杯
    .goto Dun Morogh,24.98,75.96
    .target +诺里斯·激流
step
    #xprate <1.1
    #requires TroggEnd
    .goto Dun Morogh,29.71,71.25
    >>与 |cRXP_FRIENDLY_巴尔林·霜锤|r 交谈
    .turnin 170,3 >> 交任务：新的威胁
    .target 巴尔林·霜锤
    .isQuestComplete 170
step
    #requires TroggEnd
    #label Observations
    >>与 |cRXP_FRIENDLY_巡山人萨鲁斯|r 和 |cRXP_FRIENDLY_汉兹·跳链|r 交谈
    .turnin 282 >> 交任务：森内尔的观察站
    .accept 420 >> 接受任务：森内尔的观察站
    .goto Dun Morogh,33.484,71.841
    .target +巡山人萨鲁斯
    .accept 2160 >> 接受任务：塔诺克的补给品
    .goto Dun Morogh,33.85,72.24
    .target +汉兹·跳链
step
    #xprate <1.1
    #optional
    #completewith StockingJ
    .abandon 170 >> 放弃任务：新的威胁
step
    .goto Dun Morogh,34.32,70.95,15,0
    .goto Dun Morogh,35.65,65.79,15 >> 穿过寒脊山口
    .subzoneskip 800,1
    .isOnQuest 2160
step
    #completewith StockingJ
    .goto Dun Morogh,36.51,62.94,40,0
    >>击杀|cRXP_ENEMY_峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，野猪会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在远程施放）|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
step
    .goto Dun Morogh,37.97,61.87,30,0
    .goto Dun Morogh,39.89,59.26,45 >> |cRXP_WARN_对附近的|cRXP_ENEMY_雪豹幼崽|r和|cRXP_ENEMY_黑熊幼崽|r造成至少51%的伤害，再把它们拉到|cRXP_FRIENDLY_铁炉堡巡山人|r处，以便更高效地击杀|r
    .mob 雪豹幼崽
    .mob 黑熊幼崽
    .target 铁炉堡巡山人
    .isOnQuest 2160
step
    #completewith next
    .goto Dun Morogh,43.44,55.64,50,0
    .goto Dun Morogh,44.14,52.64,50,0
    .goto Dun Morogh,46.021,51.676,20 >>前往|cRXP_FRIENDLY_萨雷克|r处
step
    .goto Dun Morogh,46.021,51.676
    >>与 |cRXP_FRIENDLY_萨雷克|r 交谈
    .accept 400 >> 接受任务：贝尔丁的工具
    .target 萨雷克·黑石
step
    #label StockingJ
    .goto Dun Morogh,49.426,48.410
    >>沿途风筝 |cRXP_ENEMY_黑熊幼崽|r |cRXP_WARN_（确保造成 51%+ 的伤害，以获得击杀归属）|r
    >>与 |cRXP_FRIENDLY_贝隆|r 交谈
    .accept 317 >> 接受任务：贝尔丁的补给
    .mob 黑熊幼崽
    .target 驾驶员贝隆·风箱
step
    >>与 |cRXP_FRIENDLY_迪恩|r、|cRXP_FRIENDLY_贝尔丁|r和 |cRXP_FRIENDLY_罗斯洛|r 交谈
    >>|cRXP_WARN_如果拉到了 |cRXP_ENEMY_黑熊幼崽|r，就将它们风筝到 |cRXP_FRIENDLY_铁炉堡巡山人|r 身边（确保造成 51%+ 的伤害，以获得击杀归属）|r
    .accept 313 >> 接受任务：灰色洞穴
    .target +驾驶员迪恩·石轮
    .goto Dun Morogh,49.622,48.612
    .turnin 400 >> 交任务：贝尔丁的工具
    .target +贝尔丁·钢架
    .goto Dun Morogh,50.45,49.09
    .accept 5541 >> 接受任务：海格纳的弹药
    .vendor >> 卖掉杂物
    .goto Dun Morogh,50.084,49.420
    .target +罗斯洛·鲁治
    .isQuestAvailable 312
step
    #completewith next
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，野猪会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在远程施放）|r
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .mob 大峭壁野猪
step
    .goto Dun Morogh,50.39,51.67,50,0
    .goto Dun Morogh,50.37,53.05,50,0
    .goto Dun Morogh,49.18,50.97,50,0
    .goto Dun Morogh,45.37,49.50,50,0
    .goto Dun Morogh,43.69,52.05,50,0
    .goto Dun Morogh,45.18,54.38,50,0
    .goto Dun Morogh,45.16,57.81,50,0
    .goto Dun Morogh,50.39,51.67,50,0
    .goto Dun Morogh,50.37,53.05,50,0
    .goto Dun Morogh,49.18,50.97,50,0
    .goto Dun Morogh,45.37,49.50,50,0
    .goto Dun Morogh,43.69,52.05,50,0
    .goto Dun Morogh,45.18,54.38,50,0
    .goto Dun Morogh,45.16,57.81,50,0
    .goto Dun Morogh,50.39,51.67,50,0
    .goto Dun Morogh,50.37,53.05,50,0
    .goto Dun Morogh,49.18,50.97,50,0
    .goto Dun Morogh,45.37,49.50,50,0
    .goto Dun Morogh,43.69,52.05,50,0
    .goto Dun Morogh,45.18,54.38
    >>击杀|cRXP_ENEMY_黑熊幼崽|r和|cRXP_ENEMY_冰爪熊|r，并拾取掉落的|cRXP_LOOT_厚熊皮|r
    >>|cRXP_WARN_把|cRXP_ENEMY_黑熊幼崽|r和|cRXP_ENEMY_冰爪熊|r风筝到附近的|cRXP_FRIENDLY_铁炉堡巡山人|r身边（确保造成至少51%的伤害以获得击杀归属）|r
    >>|cRXP_WARN_小心，它们会施放|r |T135853:0|t[寒冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害）|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob 黑熊幼崽
    .mob 冰爪熊
step
#loop
	.line Dun Morogh,51.70,49.66,51.08,52.42,51.43,53.21,50.06,51.66,49.56,50.82,48.12,49.10,48.21,46.93,45.48,50.04,44.07,52.50,43.69,55.59,42.78,56.86,44.45,59.33,46.31,61.85,46.26,59.49,48.08,59.05,49.40,58.97,48.30,56.86,49.09,54.74,49.61,54.32,51.43,53.21
	.goto Dun Morogh,51.70,49.66,40,0
	.goto Dun Morogh,51.08,52.42,40,0
	.goto Dun Morogh,51.43,53.21,40,0
	.goto Dun Morogh,50.06,51.66,40,0
	.goto Dun Morogh,49.56,50.82,40,0
	.goto Dun Morogh,48.12,49.10,40,0
	.goto Dun Morogh,48.21,46.93,40,0
	.goto Dun Morogh,45.48,50.04,40,0
	.goto Dun Morogh,44.07,52.50,40,0
	.goto Dun Morogh,43.69,55.59,40,0
	.goto Dun Morogh,42.78,56.86,40,0
	.goto Dun Morogh,44.45,59.33,40,0
	.goto Dun Morogh,46.31,61.85,40,0
	.goto Dun Morogh,46.26,59.49,40,0
	.goto Dun Morogh,48.08,59.05,40,0
	.goto Dun Morogh,49.40,58.97,40,0
	.goto Dun Morogh,48.30,56.86,40,0
	.goto Dun Morogh,49.09,54.74,40,0
	.goto Dun Morogh,49.61,54.32,40,0
	.goto Dun Morogh,51.43,53.21,40,0
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，野猪会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在远程施放）|r
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .disablecheckbox
    .mob 峭壁野猪
    .mob 大峭壁野猪
step
    .goto Dun Morogh,49.426,48.410
    >>与 |cRXP_FRIENDLY_贝隆|r 交谈
    .turnin 317 >> 交任务：贝尔丁的补给
    .accept 318 >> 接受任务：艾沃沙酒
    .target 驾驶员贝隆·风箱
step
#loop
	.line Dun Morogh,51.70,49.66,51.08,52.42,51.43,53.21,50.06,51.66,49.56,50.82,48.12,49.10,48.21,46.93,45.48,50.04,44.07,52.50,43.69,55.59,42.78,56.86,44.45,59.33,46.31,61.85,46.26,59.49,48.08,59.05,49.40,58.97,48.30,56.86,49.09,54.74,49.61,54.32,51.43,53.21
	.goto Dun Morogh,51.70,49.66,40,0
	.goto Dun Morogh,51.08,52.42,40,0
	.goto Dun Morogh,51.43,53.21,40,0
	.goto Dun Morogh,50.06,51.66,40,0
	.goto Dun Morogh,49.56,50.82,40,0
	.goto Dun Morogh,48.12,49.10,40,0
	.goto Dun Morogh,48.21,46.93,40,0
	.goto Dun Morogh,45.48,50.04,40,0
	.goto Dun Morogh,44.07,52.50,40,0
	.goto Dun Morogh,43.69,55.59,40,0
	.goto Dun Morogh,42.78,56.86,40,0
	.goto Dun Morogh,44.45,59.33,40,0
	.goto Dun Morogh,46.31,61.85,40,0
	.goto Dun Morogh,46.26,59.49,40,0
	.goto Dun Morogh,48.08,59.05,40,0
	.goto Dun Morogh,49.40,58.97,40,0
	.goto Dun Morogh,48.30,56.86,40,0
	.goto Dun Morogh,49.09,54.74,40,0
	.goto Dun Morogh,49.61,54.32,40,0
	.goto Dun Morogh,51.43,53.21,40,0
    .xp 5+2690 >> 刷怪至 2690+/2800 经验值
    .mob 黑熊幼崽
    .mob 峭壁野猪
step
    #completewith InnLS1
    +|cRXP_WARN_卸下当前的|r |T135148:0|t[法杖]
    -- +|cRXP_WARN_Remember the Inn Logout Skip soon. Unequip your current|r |T135148:0|t[Staff]
    -- >>|cRXP_WARN_NOTE: Itemrack currently can cause problems after logout skipping where your ingame UI freezes. Make sure to disable the addon or make a /reload command you can click when/if that happens|r
step
    #completewith Tannok
    .cast 1459 >> 重新施放 |T135932:0|t[奥术智慧]
    .cast 168 >> 重新施放 |T135843:0|t[霜甲术]
step
    .goto Dun Morogh,46.83,52.36
    >>与 |cRXP_FRIENDLY_拉格纳|r 交谈
    .accept 384 >> 接受任务：啤酒烤猪排
    .target 拉格纳·雷酒
step
    #completewith next
    .goto Dun Morogh,46.97,51.99,10,0
    .goto Dun Morogh,47.50,52.08,12 >>进入旅店
step
    .goto Dun Morogh,47.217,52.195
    >>与 |cRXP_FRIENDLY_塔诺克|r 交谈
    .turnin 2160,2 >> 交任务：塔诺克的补给品
    .target 塔诺克·霜锤
    .xp >6,1
step
    #completewith next
    .goto Dun Morogh,46.97,51.99,10,0
    .goto Dun Morogh,47.50,52.08,12 >>进入旅店
step
    #sticky
    #label Tannok
    .goto Dun Morogh,47.217,52.195,0,0
    >>与 |cRXP_FRIENDLY_塔诺克|r 交谈
    .turnin 2160,2 >> 交任务：塔诺克的补给品
    .target 塔诺克·霜锤
step
    .goto Dun Morogh,47.50,52.08
    >>与楼上的 |cRXP_FRIENDLY_玛济斯|r 交谈
    .trainer >> 学习职业技能（火球术等级2、火焰冲击）
    .target 玛济斯·石衣
    .isQuestAvailable 312
step
    #completewith Golorn
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .home >> 将炉石设在雷酒酿制厂
    .target 旅店老板贝尔姆
    .isQuestAvailable 312
step
    #requires Tannok
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买一杯|r |T132800:0|t[狂想麦酒]|cRXP_BUY_（向他购买）|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .target 旅店老板贝尔姆
    .itemcount 2886,6
    .money <0.0050
step
    #requires Tannok
    .goto Dun Morogh,46.83,52.36
    >>与 |cRXP_FRIENDLY_拉格纳|r 交谈
    .turnin 384 >> 交任务：啤酒烤猪排
    .target 拉格纳·雷酒
    .isQuestComplete 384
step
    #requires Tannok
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买20瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,20,312,1 --Ice Cold Milk (20)
    .target 旅店老板贝尔姆
    .money <0.0582
step
    #requires Tannok
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买15瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,15,312,1 --Ice Cold Milk (15)
    .target 旅店老板贝尔姆
    .money <0.0457
step
    #requires Tannok
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买10瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,10,312,1 --Ice Cold Milk (10)
    .target 旅店老板贝尔姆
    .money <0.0332
step
    #label InnLS1
    #requires Tannok
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买5瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,5,312,1 --Ice Cold Milk (5)
    .target 旅店老板贝尔姆
    .money <0.0207
step
    #requires Tannok
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买20瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    .collect 159,20,312,1 --Refreshing Spring Water (20)
    .itemcount 1179,<1
    .target 旅店老板贝尔姆
    .money <0.0182
step
    #requires Tannok
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买15瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    .collect 159,15,312,1 --Refreshing Spring Water (15)
    .itemcount 1179,<1
    .target 旅店老板贝尔姆
    .money <0.0157
step
    #requires Tannok
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买10瓶|r |T132794:0|t[清凉的泉水] |cRXP_BUY_（向他购买）|r
    .collect 159,10,312,1 --Refreshing Spring Water (10)
    .itemcount 1179,<1
    .target 旅店老板贝尔姆
    .money <0.0132
step
    #requires Tannok
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买5瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    .collect 159,5,312,1 --Refreshing Spring Water (5)
    .itemcount 1179,<1
    .target 旅店老板贝尔姆
    .money <0.0107
step << skip
    #completewith SenirO
    .goto Dun Morogh,47.46,52.60,-1
    .goto Dun Morogh,47.13,54.91,35 >>|cRXP_WARN_跳到|cRXP_FRIENDLY_旅店老板贝尔姆|r身后墙边的木桶上，再通过重新登录传送前往卡拉诺斯|r
step
    #sticky
    #label Golorn
    .goto Dun Morogh,46.77,53.72,-1
    >>与|cRXP_FRIENDLY_戈隆·霜须|r交谈
    >>|cRXP_BUY_购买一把|r |T135637:0|t[剥皮小刀]|cRXP_BUY_（向他购买）|r
    .collect 7005,1,312,1 --Skinning Knife (1)
    .target 戈隆·霜须
step
    #label SenirO
    .goto Dun Morogh,46.726,53.826,-1
    >>与 |cRXP_FRIENDLY_森内尔|r 交谈
    .turnin 420 >> 交任务：森内尔的观察站
    .target 森内尔·白须
step
    #completewith next
    #requires Golorn
    +装备 |T135637:0|t[剥皮小刀]
    .use 7005
    .itemcount 7005,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.2
step
    #requires Golorn
#loop
	.line Dun Morogh,42.57,54.80,41.89,54.51,42.13,52.68,42.46,51.96,41.91,51.43,42.46,51.96,42.13,52.68,42.57,54.80
	.goto Dun Morogh,42.57,54.80,10,0
	.goto Dun Morogh,41.89,54.51,10,0
	.goto Dun Morogh,42.13,52.68,10,0
	.goto Dun Morogh,42.46,51.96,10,0
	.goto Dun Morogh,41.91,51.43,10,0
	.goto Dun Morogh,42.46,51.96,10,0
	.goto Dun Morogh,42.13,52.68,10,0
	.goto Dun Morogh,42.57,54.80,10,0
    >>击杀|cRXP_ENEMY_雪怪幼崽|r和|cRXP_ENEMY_雪怪|r，并拾取掉落的|cRXP_LOOT_雪怪的鬃毛|r
    >>|cRXP_WARN_小心，它们会施放|r |T135848:0|t[冰息术]|cRXP_WARN_（近战施法：造成6–10点冰霜伤害），并拥有更高的|r |T135849:0|t[冰霜抗性]
    .complete 313,1 --Collect Wendigo Mane (x8)
    .mob 雪怪幼崽
    .mob 雪怪
step
    .goto Dun Morogh,44.13,56.95
    >>打开地面上的|cRXP_PICK_弹药箱|r，拾取|cRXP_LOOT_海格纳的弹药|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    #completewith Ammo
    .goto Dun Morogh,40.60,62.24,45,0
    >>沿途击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_雪豹幼崽|r
    >>从|cRXP_ENEMY_峭壁野猪|r身上拾取|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在远程施放）|r
    .complete 384,1 --Crag Boar Rib (6)
    .disablecheckbox
    .goto Dun Morogh,40.682,65.130,20 >>前往|cRXP_FRIENDLY_海格纳|r处
    .mob 峭壁野猪
    .mob 雪豹幼崽
    .xp >7-1000,1
    .isQuestAvailable 384
step
    #completewith Ammo
    .goto Dun Morogh,40.60,62.24,45,0
    >>沿途击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_雪豹幼崽|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在远程施放）|r
    .goto Dun Morogh,40.682,65.130,20 >>前往|cRXP_FRIENDLY_海格纳|r处
    .mob 峭壁野猪
    .mob 雪豹幼崽
    .xp >7-1000,1
    .isQuestTurnedIn 384
step
    #completewith next
    .goto Dun Morogh,40.60,62.24,45,0
    .goto Dun Morogh,40.682,65.130,20 >>前往|cRXP_FRIENDLY_海格纳|r处
    .xp <7-1000,1
step
    #label Ammo
    .goto Dun Morogh,40.682,65.130
    >>与 |cRXP_FRIENDLY_海格纳|r 交谈
    .turnin 5541 >> 交任务：海格纳的弹药
    .vendor >> 卖掉杂物
    .target 海格纳·重枪
    .isQuestAvailable 312
step
    #completewith TundraOne
    .goto Dun Morogh,37.98,61.90,50,0
    .goto Dun Morogh,35.11,56.78,45,0
    .goto Dun Morogh,35.62,54.73,50,0
    .goto Dun Morogh,36.38,52.49,40,0
    >>|cRXP_WARN_对附近的 |cRXP_ENEMY_雪豹幼崽|r 和 |cRXP_ENEMY_黑熊幼崽|r 造成 51%+ 的伤害，再将它们拉到 |cRXP_FRIENDLY_铁炉堡巡山人|r 身边，以便更高效地击杀|r
    >>沿途击杀 |cRXP_ENEMY_大峭壁野猪|r 和 |cRXP_ENEMY_峭壁野猪|r，拾取它们掉落的 |cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_大峭壁野猪|r 和 |cRXP_ENEMY_峭壁野猪|r 会施放|r |T132337:0|t[冲锋] |cRXP_WARN_（自身瞬发：提高移动速度，持续 3 秒；命中时造成 25–70 点近战伤害，只能在远处施放）|r
    .complete 384,1 --Crag Boar Rib (6)
    .disablecheckbox
    .xp 7 >> 在前往 |cRXP_FRIENDLY_图德拉|r 的途中刷怪升到 7 级，再与他交谈
    .target 铁炉堡巡山人
    .mob 峭壁野猪
    .mob 雪豹幼崽
    .isQuestAvailable 384
step
    #completewith next
    .goto Dun Morogh,37.98,61.90,50,0
    .goto Dun Morogh,35.11,56.78,45,0
    .goto Dun Morogh,35.62,54.73,50,0
    .goto Dun Morogh,36.38,52.49,40,0
    >>|cRXP_WARN_对附近的 |cRXP_ENEMY_雪豹幼崽|r 和 |cRXP_ENEMY_黑熊幼崽|r 造成 51%+ 的伤害，再将它们拉到 |cRXP_FRIENDLY_铁炉堡巡山人|r 身边，以便更高效地击杀|r
    >>沿途击杀 |cRXP_ENEMY_大峭壁野猪|r 和 |cRXP_ENEMY_峭壁野猪|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_大峭壁野猪|r 和 |cRXP_ENEMY_峭壁野猪|r 会施放|r |T132337:0|t[冲锋] |cRXP_WARN_（自身瞬发：提高移动速度，持续 3 秒；命中时造成 25–70 点近战伤害，只能在远处施放）|r
    .xp 7 >> 在前往 |cRXP_FRIENDLY_图德拉|r 的途中刷怪升到 7 级，再与他交谈
    .target 铁炉堡巡山人
    .mob 峭壁野猪
    .mob 雪豹幼崽
    .isQuestTurnedIn 384
step
    #label TundraOne
    .goto Dun Morogh,34.57,51.66
    >>与 |cRXP_FRIENDLY_图德拉|r 交谈
    .accept 312 >> 接受任务：马克格拉恩的干肉
    .target 图德拉·马克格拉恩
step
    #completewith next
    +|cRXP_WARN_把|cRXP_ENEMY_冰爪熊|r风筝到|r|cRXP_FRIENDLY_雷杰德|r处
    >>|cRXP_WARN_尽量在|cRXP_ENEMY_冰爪熊|r死亡前接取任务，以获得任务进度|r
    >>|cRXP_WARN_小心，它们会施放|r |T135853:0|t[寒冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害）|r
    >>|cRXP_WARN_确保造成至少51%的伤害以获得击杀归属|r
    .mob 冰爪熊
step
    >>与 |cRXP_FRIENDLY_雷杰德|r 和 |cRXP_FRIENDLY_马莱斯|r 交谈
    .turnin 318 >> 交任务：艾沃沙酒
    .accept 319 >> 接受任务：艾沃沙酒
    .accept 315 >> 接受任务：完美烈酒
    .target +雷杰德·麦酒
    .goto Dun Morogh,30.19,45.73
    .accept 310 >> 接受任务：针锋相对
    .goto Dun Morogh,30.186,45.531
    .target +马莱斯·麦酒
step
    .goto Dun Morogh,30.45,46.01,0,0
    >>与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    >>|cRXP_BUY_补足至10瓶|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（向他购买）|r
    .vendor >> 卖掉杂物
    .collect 1179,10,312,1 --Ice Cold Milk (10)
    .target 基格·吉布恩
    .itemcount 1179,<10
    .money <0.0350
    .isOnQuest 319
step
    .goto Dun Morogh,30.45,46.01,0,0
    >>与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    >>|cRXP_BUY_补足至5瓶|r |T132815:0|t[冰镇牛奶] |cRXP_BUY_（向他购买）|r
    .vendor >> 卖掉杂物
    .collect 1179,5,312,1 --Ice Cold Milk (5)
    .target 基格·吉布恩
    .itemcount 1179,<5
    .money <0.0225
    .isOnQuest 319
step
    #completewith SenirFrostmane
    .goto Dun Morogh,33.51,47.50,50,0
    .goto Dun Morogh,36.85,45.48,50,0
    >>前往洞穴途中击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r；从|cRXP_ENEMY_老峭壁野猪|r身上拾取|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_优先击杀|r|cRXP_ENEMY_雪豹|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_冰爪熊|r会施放|r |T135853:0|t[寒冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害），而|cRXP_ENEMY_老峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在远处施放）|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
    .complete 384,1 --Crag Boar Rib (6)
    .mob +老峭壁野猪
    .isQuestAvailable 384
step
    #completewith SenirFrostmane
    .goto Dun Morogh,33.51,47.50,50,0
    .goto Dun Morogh,36.85,45.48,50,0
    >>沿途击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r，前往洞穴
    >>|cRXP_WARN_优先击杀|r|cRXP_ENEMY_雪豹|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_冰爪熊|r会施放|r |T135853:0|t[寒冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害），而|cRXP_ENEMY_老峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在远处施放）|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
    .isQuestTurnedIn 384
step << skip
    #completewith next
    .goto Dun Morogh,38.00,42.77,30 >> 进入洞穴
    .isOnQuest 319
step << skip
    #label CaveLS
    .goto Dun Morogh,38.32,43.36
    .goto Dun Morogh,47.13,54.91,30 >> |cRXP_WARN_在洞穴内通过重新登录传送回卡拉诺斯|r
    .isOnQuest 319
step
    #label SenirFrostmane
    .goto Dun Morogh,46.726,53.826
    >>与 |cRXP_FRIENDLY_森内尔|r 交谈
    .accept 287 >> 接受任务：霜鬃巨魔要塞
    .target 森内尔·白须
step
    #completewith Rhapsody1
    .goto Dun Morogh,46.97,51.99,10,0
    .goto Dun Morogh,47.19,52.02,12 >>进入旅店
step
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买|r |T132800:0|t[狂想麦酒]|cRXP_BUY_和|r |T132800:0|t[雷霆麦酒]|cRXP_BUY_（向他购买）|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .collect 2686,1,311,1 --Collect Thunder Ale (x1)
    .target 旅店老板贝尔姆
    .itemcount 2886,6
    .isQuestAvailable 384
step
    #label Rhapsody1
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买一杯|r |T132800:0|t[雷霆麦酒]|cRXP_BUY_（向他购买）|r
    .collect 2686,1,311,1 --Collect Thunder Ale (x1)
    .target 旅店老板贝尔姆
    .itemcount 2886,<6
step
    #completewith next
    .goto Dun Morogh,47.50,52.40,8,0
    .goto Dun Morogh,47.72,52.43,8 >>下楼
step
    #completewith next
    .goto Dun Morogh,47.65,52.66
    >>与楼下的 |cRXP_FRIENDLY_加文|r 交谈
    .turnin 308 >> 交任务：加文的爱好
    .target 加文·雷酒
step
    .goto Dun Morogh,47.72,52.70
    >>持续将鼠标悬停在楼下的 |cRXP_PICK_被看守着的酒桶|r 上，等待 |cRXP_PICK_被看守着的酒桶|r 变成无人看守状态
    >>点击 |cRXP_PICK_无人守卫的雷酒桶|r
    .turnin 310 >> 交任务：针锋相对
    .accept 311 >> 接受任务：向马莱斯回报
step
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_补足至10瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,10,312,1 --Ice Cold Milk (10)
    .target 旅店老板贝尔姆
    .money <0.0250
step
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_补足至5瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,5,312,1 --Ice Cold Milk (5)
    .target 旅店老板贝尔姆
    .money <0.0125
step
    .goto Dun Morogh,47.19,52.02,12,0
    .goto Dun Morogh,46.97,51.99,10,0
    .goto Dun Morogh,46.83,52.36,20 >>离开旅店
    .isOnQuest 287
step
    .goto Dun Morogh,46.83,52.36
    >>与 |cRXP_FRIENDLY_拉格纳|r 交谈
    .turnin 384 >> 交任务：啤酒烤猪排
    .target 拉格纳·雷酒
    .isQuestComplete 384
step
    #completewith next
    .goto Dun Morogh,46.65,47.42,40,0
    +|cRXP_WARN_对附近的|cRXP_ENEMY_雪狼|r、|cRXP_ENEMY_冬狼|r和|cRXP_ENEMY_黑熊幼崽|r造成至少51%的伤害，再将它们拉到|cRXP_FRIENDLY_铁炉堡巡山人|r处，以便更高效地击杀|r
    >>|cRXP_WARN_注意，|cRXP_ENEMY_雪狼|r的|r |T132150:0|t[仇恨范围提高]|cRXP_WARN_仇恨范围约增加8码|r
    .mob 雪狼
    .mob 冬狼
    .mob 黑熊幼崽
    .target 铁炉堡巡山人
step
    #label SeerRamp
    .goto Dun Morogh,42.91,45.17,25,0
    .goto Dun Morogh,42.32,45.27,45 >> 沿坡道跑上去，前往|cRXP_ENEMY_霜鬃先知|r所在处
    .isOnQuest 315
step
    #requires SeerRamp
    #completewith next
    >>击杀巡逻的|cRXP_ENEMY_霜鬃猎头者|r
    >>|cRXP_WARN_小心，巡逻者会在固定不动的|r|cRXP_ENEMY_霜鬃先知|r之间巡逻
    >>|cRXP_WARN_小心，它们会施放|r |T132222:0|t[射击]|cRXP_WARN_（远程施法：造成8–15点伤害）|r
    .complete 287,1 --Kill Frostmane Headhunters (5)
    .mob 霜鬃猎头者
step
    #label ShimmerB
    .goto Dun Morogh,42.07,45.48,40,0
    .goto Dun Morogh,42.11,44.63,40,0
    .goto Dun Morogh,41.67,43.53,40,0
    .goto Dun Morogh,41.27,44.37,20,0
    .goto Dun Morogh,41.48,45.01,30,0
    .goto Dun Morogh,41.08,44.86,30,0
    .goto Dun Morogh,41.14,45.54,40,0
    .goto Dun Morogh,40.34,42.84,40,0
    .goto Dun Morogh,39.67,39.87,20,0
    .goto Dun Morogh,39.94,37.70,20,0
    .goto Dun Morogh,41.84,35.63
    >>击杀 |cRXP_ENEMY_霜鬃先知|r, 搜刮 |cRXP_LOOT_微光草|r
    >>打开地面上的|cRXP_PICK_微光草篮|r，并拾取其中的|cRXP_LOOT_微光草|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    >>|cRXP_WARN_小心，它们会施放|r |T136048:0|t[闪电箭]|cRXP_WARN_（远程施法：造成15–30点自然伤害）|r
    .complete 315,1 --Collect Shimmerweed (x6)
    .mob 霜鬃先知
step
    #completewith IBCave
    >>击杀|cRXP_ENEMY_大峭壁野猪|r和|cRXP_ENEMY_老峭壁野猪|r，并拾取掉落的|cRXP_LOOT_峭壁野猪肋排|r
    .complete 384,1 --Crag Boar Rib (6)
    .mob 大峭壁野猪
    .mob 老峭壁野猪
step
    #completewith next
    .goto Dun Morogh,40.45,47.23,40,0
    .goto Dun Morogh,37.72,51.88,40,0
    >>沿途击杀两只|cRXP_ENEMY_老峭壁野猪|r（如果它们已刷新）
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–85点近战伤害，仅能在远程施放）|r
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob 老峭壁野猪
step
    #label IBCave
    .goto Dun Morogh,37.85,53.71,50 >>前往洞穴
    .isOnQuest 312
step
    #completewith next
    +|cRXP_WARN_拾取物品后，记得在它攻击时跳跃转身，以免被打出眩晕减速；并跳上树干暂时躲开它|r
step
    .goto Dun Morogh,38.51,53.93
    >>|cRXP_WARN_如果|cRXP_ENEMY_冰须|r在洞穴里，就沿洞穴侧壁把它风筝上去，再一路引到洞顶。等它靠近后再跳下去，然后前往洞穴深处|r
    >>打开地面上的|cRXP_PICK_马克格拉恩的储肉柜|r，拾取其中的|cRXP_LOOT_马克格拉恩的干肉|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3120 >>|cRXP_WARN_如果此步骤遇到困难，请点击链接观看说明|r
    .complete 312,1 --Collect MacGrann's Dried Meats (x1)
    .mob 冰须
step
    .goto Dun Morogh,34.57,51.66
    >>与 |cRXP_FRIENDLY_图德拉|r 交谈
    .turnin 312,1 >> 交任务：马克格拉恩的干肉
    .target 图德拉·马克格拉恩
step
    .goto Dun Morogh,32.11,49.72,40,0
    .goto Dun Morogh,29.38,53.83,40,0
    .goto Dun Morogh,28.91,50.05,40,0
    .goto Dun Morogh,28.42,45.14,40,0
    .goto Dun Morogh,28.85,41.75,40,0
    .goto Dun Morogh,31.30,39.17,40,0
    .goto Dun Morogh,32.11,49.72,40,0
    .goto Dun Morogh,29.38,53.83,40,0
    .goto Dun Morogh,28.91,50.05,40,0
    .goto Dun Morogh,28.42,45.14,40,0
    .goto Dun Morogh,28.85,41.75,40,0
    .goto Dun Morogh,31.30,39.17
    >>击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r，并从|cRXP_ENEMY_老峭壁野猪|r身上拾取|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_如果可以，把|cRXP_ENEMY_冰爪熊|r或|cRXP_ENEMY_雪豹|r风筝回任务给予者身边|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_冰爪熊|r会施放|r |T135853:0|t[寒冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害），而|cRXP_ENEMY_老峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成35–85点近战伤害，仅能在远程施放）|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
    .complete 384,1 --Crag Boar Rib (6)
    .disablecheckbox
    .mob 老峭壁野猪
    .isQuestAvailable 384
step
    .goto Dun Morogh,32.11,49.72,40,0
    .goto Dun Morogh,29.38,53.83,40,0
    .goto Dun Morogh,28.91,50.05,40,0
    .goto Dun Morogh,28.42,45.14,40,0
    .goto Dun Morogh,28.85,41.75,40,0
    .goto Dun Morogh,31.30,39.17,40,0
    .goto Dun Morogh,32.11,49.72,40,0
    .goto Dun Morogh,29.38,53.83,40,0
    .goto Dun Morogh,28.91,50.05,40,0
    .goto Dun Morogh,28.42,45.14,40,0
    .goto Dun Morogh,28.85,41.75,40,0
    .goto Dun Morogh,31.30,39.17
    >>击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r
    >>|cRXP_WARN_如果可以，把|cRXP_ENEMY_冰爪熊|r或|cRXP_ENEMY_雪豹|r风筝回任务给予者身边|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_冰爪熊|r会施放|r |T135853:0|t[寒冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害），而|cRXP_ENEMY_老峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成35–85点近战伤害，仅能在远程施放）|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
    .isQuestTurnedIn 384
step
    >>与 |cRXP_FRIENDLY_雷杰德|r 和 |cRXP_FRIENDLY_马莱斯|r 交谈
    .turnin 315,1 >> 交任务：完美烈酒
    .accept 413 >> 接受任务：微光酒
    .turnin 319 >> 交任务：艾沃沙酒
    .accept 320 >> 接受任务：艾沃沙酒
    .goto Dun Morogh,30.189,45.725
    .turnin 311 >> 交任务：向马莱斯回报
    .goto Dun Morogh,30.186,45.531
    .target 雷杰德·麦酒
step
    .goto Dun Morogh,30.45,46.01
    >>与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    >>|cRXP_BUY_补足至10瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,10,287,1 --Ice Cold Milk (10)
    .target 基格·吉布恩
    .money <0.0250
step
    .goto Dun Morogh,30.45,46.01
    >>与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    >>|cRXP_BUY_补足至5瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,5,287,1 --Ice Cold Milk (5)
    .target 基格·吉布恩
    .money <0.0125
step
    .goto Dun Morogh,32.11,49.72,40,0
    .goto Dun Morogh,29.38,53.83,40,0
    .goto Dun Morogh,28.91,50.05,40,0
    .goto Dun Morogh,28.42,45.14,40,0
    .goto Dun Morogh,28.85,41.75,40,0
    .goto Dun Morogh,31.30,39.17,40,0
    .goto Dun Morogh,32.11,49.72,40,0
    .goto Dun Morogh,29.38,53.83,40,0
    .goto Dun Morogh,28.91,50.05,40,0
    .goto Dun Morogh,28.42,45.14,40,0
    .goto Dun Morogh,28.85,41.75,40,0
    .goto Dun Morogh,31.30,39.17
    >>击杀|cRXP_ENEMY_老峭壁野猪|r并拾取|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成35–85点近战伤害，仅能在远程施放）|r
    .complete 384,1 --Crag Boar Rib (6)
    .mob 老峭壁野猪
step
    #completewith Explore
    .goto Dun Morogh,25.12,49.54,35,0
    .goto Dun Morogh,24.94,50.61,12 >>从北侧进入洞穴
step
    .goto Dun Morogh,24.29,50.80,40,0
    .goto Dun Morogh,23.31,51.36
    >>在洞穴内击杀|cRXP_ENEMY_霜鬃猎头者|r
    >>|cRXP_WARN_小心，它们会施放|r |T132222:0|t[射击]|cRXP_WARN_（远程施法：造成8–15点伤害）|r
    >>|cRXP_WARN_小心洞穴里的|cRXP_ENEMY_霜鬃猎头者|r正在巡逻|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob 霜鬃猎头者
step
    #label Explore
    .goto Dun Morogh,23.01,52.04,8,0
    .goto Dun Morogh,22.90,52.09
    >>|cRXP_WARN_小心走到下方的凹槽上（不要掉下去），再沿凹槽慢慢向下走，直到获得任务进度|r
    >>|cRXP_WARN_小心下方的|cRXP_ENEMY_霜鬃剥皮者|r；如果它离凹槽太近，可能会攻击到你|r
    >>|cRXP_WARN_准备使用|r |T134414:0|t[炉石]
    .link https://youtu.be/Zg4FNWw-P5k?t=3619 >>|cRXP_WARN_如果此步骤遇到困难，请点击链接观看说明|r
    .complete 287,2 --Fully explore Frostmane Hold
step << skip
    #completewith next
    +|cRXP_WARN_记得接下来要执行旅店登出跳点！|r
step
    #completewith Senir2
    .hs >> 使用炉石返回卡拉诺斯
step
    .goto Dun Morogh,47.38,52.52
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买一杯|r |T132800:0|t[狂想麦酒]|cRXP_BUY_（向他购买）|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .target 旅店老板贝尔姆
step
    .goto Dun Morogh,47.50,52.08
    >>与楼上的 |cRXP_FRIENDLY_玛济斯|r 交谈
    .trainer >> 学习职业技能（寒冰箭等级2、变形术）
    .target 玛济斯·石衣
    .isQuestAvailable 314
step
    #completewith Senir2
    +|cRXP_WARN_记得保留|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_以便之后将|r |T133971:0|t[烹饪]|cRXP_WARN_练到50点|r
step
    .goto Dun Morogh,46.83,52.36
    >>与 |cRXP_FRIENDLY_拉格纳|r 交谈
    .turnin 384 >> 交任务：啤酒烤猪排
    .target 拉格纳·雷酒
step
    #label Senir2
    .goto Dun Morogh,46.726,53.826
    >>与 |cRXP_FRIENDLY_森内尔|r 交谈
    .turnin 287,2 >> 交任务：霜鬃巨魔要塞
    .accept 291 >> 接受任务：森内尔的报告
    .target 森内尔·白须
step
    #completewith next
    .cast 1459 >> 重新施放 |T135932:0|t[奥术智慧]
    .cast 168 >> 重新施放 |T135843:0|t[霜甲术]
step
    >>与 |cRXP_FRIENDLY_贝隆|r 和 |cRXP_FRIENDLY_迪恩|r 交谈
    .turnin 320,2 >> 交任务：艾沃沙酒
    .target +驾驶员贝隆·风箱
    .goto Dun Morogh,49.426,48.410
    .turnin 313 >> 交任务：灰色洞穴
    .goto Dun Morogh,49.622,48.612
    .target +驾驶员迪恩·石轮
step
    #completewith next
    +|cRXP_WARN_对附近的|cRXP_ENEMY_冬狼|r造成至少51%的伤害，再把它们拉到可能在路上巡逻的|cRXP_FRIENDLY_铁炉堡巡山人|r处，以便更高效地击杀|r
    >>|cRXP_WARN_如果没看到|cRXP_FRIENDLY_铁炉堡巡山人|r，就跳过此步骤|r
    .mob 冬狼
    .target 铁炉堡巡山人
step
    #completewith Rudra
    #label Dirt
    .goto Dun Morogh,59.84,49.56,40,0
    .goto Dun Morogh,61.36,47.07,40 >>沿土路上行
    .isQuestAvailable 314
step
    #completewith next
    #requires Dirt
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >>|cRXP_WARN_如果此步骤遇到困难，请点击链接观看说明|r
    +|cRXP_WARN_将|cRXP_ENEMY_瓦加什|r一路风筝下行至|r|cRXP_FRIENDLY_鲁德拉·冻石|r
    .mob 瓦加什
step
    #label Rudra
    .goto Dun Morogh,63.08,49.85
    >>与 |cRXP_FRIENDLY_鲁德拉|r 交谈
    .accept 314 >> 接受任务：保护牲畜
    .target 鲁德拉·冻石
step
    .goto Dun Morogh,62.57,46.14,0
    .goto Dun Morogh,62.78,54.60,40,0
    .goto Dun Morogh,62.82,55.73
    >>击杀|cRXP_ENEMY_瓦加什|r并拾取|cRXP_LOOT_瓦加什的牙齿|r
    >>|cRXP_WARN_将|cRXP_ENEMY_瓦加什|r风筝到牧场南侧的|cRXP_FRIENDLY_丹莫罗巡山人|r那里，确保对它造成至少51%的伤害|r
    >>|cRXP_WARN_记得获得冻土岭的探索经验；方便时，把|cRXP_ENEMY_雪豹|r拉到|cRXP_FRIENDLY_丹莫罗巡山人|r处|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >>|cRXP_WARN_如果此步骤遇到困难，请点击链接观看说明|r
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob 瓦加什
step
    .goto Dun Morogh,63.08,49.85
    >>与 |cRXP_FRIENDLY_鲁德拉|r 交谈
    .turnin 314,3 >> 交任务：保护牲畜
    .target 鲁德拉·冻石
step << skip
    #completewith Ghilm
    +|cRXP_WARN_记得保留|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_以便之后将|r |T133971:0|t[烹饪]|cRXP_WARN_练到50点|r
step
    #completewith next
    .goto Dun Morogh,66.34,50.92,50,0
    .goto Dun Morogh,67.72,53.66,30,0
    +|cRXP_WARN_将 |cRXP_ENEMY_冰爪熊|r 风筝到 |cRXP_FRIENDLY_铁炉堡巡山人|r 身边（确保造成 51%+ 的伤害，以获得击杀归属）|r
    >>|cRXP_WARN_小心，它们会施放|r |T135853:0|t[寒冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害）|r
    .mob 冰爪熊
step
    #sticky
    #label Ghilm
    .goto Dun Morogh,68.40,54.45,0,0
    >>与 |cRXP_FRIENDLY_格瑞姆|r 交谈
    .train 2550 >> 学习 |T133971:0|t[烹饪]
    .target 厨师格瑞姆
step
    .goto Dun Morogh,68.43,54.46,8,0
    .goto Dun Morogh,68.53,54.64
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买15瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,15,432,1 --Ice Cold Milk (15)
    .target 卡杉·莫格什
    .money <0.0395
step
    .goto Dun Morogh,68.43,54.46,8,0
    .goto Dun Morogh,68.53,54.64
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买10瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,10,432,1 --Ice Cold Milk (10)
    .target 卡杉·莫格什
    .money <0.0260
step
    .goto Dun Morogh,68.43,54.46,8,0
    .goto Dun Morogh,68.53,54.64
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买5瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,5,432,1 --Ice Cold Milk (5)
    .target 卡杉·莫格什
    .money <0.0135
step
    #requires Ghilm
    >>与 |cRXP_FRIENDLY_梅尔|r 和 |cRXP_FRIENDLY_乔尼|r 交谈
    .accept 433 >> 接受任务：公众之仆
    .target +参议员梅尔·圣石
    .goto Dun Morogh,68.67,55.97
    .accept 432 >> 接受任务：该死的石腭怪！
    .goto Dun Morogh,69.084,56.330
    .target +工头乔尼·石眉
step
    #completewith Bonesnappers
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    >>|cRXP_WARN_无需特意绕路击杀它们|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
step
    #completewith next
    .goto Dun Morogh,70.74,56.23,30 >>进入洞穴
step
    #label Bonesnappers
    .goto Dun Morogh,70.98,54.31,40,0
    .goto Dun Morogh,70.83,53.17,40,0
    .goto Dun Morogh,71.94,50.48,40,0
    .goto Dun Morogh,72.55,51.50,40,0
    .goto Dun Morogh,72.62,52.56
    >>在洞穴内击杀|cRXP_ENEMY_石腭断骨者|r
    >>|cRXP_WARN_小心，它们会施放|r |T132154:0|t[击倒]|cRXP_WARN_（瞬发近战攻击：使你昏迷2秒）|r
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob 石腭断骨者
step
    .goto Dun Morogh,70.74,56.23,30,0
#loop
	.line Dun Morogh,69.93,57.29,70.57,58.61,69.68,59.37,68.36,59.57,69.16,57.51,69.93,57.29
	.goto Dun Morogh,69.93,57.29,30,0
	.goto Dun Morogh,70.57,58.61,30,0
	.goto Dun Morogh,69.68,59.37,30,0
	.goto Dun Morogh,68.36,59.57,30,0
	.goto Dun Morogh,69.16,57.51,30,0
	.goto Dun Morogh,69.93,57.29,30,0
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
step
    #sticky
    #label Frast
    .goto Dun Morogh,68.87,55.96,0,0
    >>与 |cRXP_FRIENDLY_弗拉斯特|r 交谈
    .vendor >> 卖掉杂物
    .target 弗拉斯特·多克南
step
    >>与 |cRXP_FRIENDLY_乔尼|r 和 |cRXP_FRIENDLY_梅尔|r 交谈
    .turnin 432 >> 交任务：该死的石腭怪！
    .target +工头乔尼·石眉
    .goto Dun Morogh,69.084,56.330
    .turnin 433 >> 交任务：公众之仆
    .goto Dun Morogh,68.67,55.97
    .target +参议员梅尔·圣石
step
    #requires Frast
    .goto Dun Morogh,69.33,55.46
    >>与 |cRXP_FRIENDLY_丹克|r 交谈
    .train 2575 >> 学习 |T136248:0|t[采矿]
    .target 丹克·利刃
step
    #label Shortcut1
    #completewith Pilot
    .goto Dun Morogh,70.35,55.28,5,0
    .link https://youtu.be/G2IscpFZVeQ?t=4034 >>|cRXP_WARN_如果此步骤遇到困难，请点击链接观看说明|r
    .goto Dun Morogh,70.52,54.75,12 >>沿|cRXP_FRIENDLY_丹克|r身后的捷径上去
step
    #completewith Pilot
    #requires Shortcut1
    #label Shortcut2
    .goto Dun Morogh,70.97,50.70,50,0
    .goto Dun Morogh,72.90,49.79,50,0
    .goto Dun Morogh,77.11,48.82,50 >>|cRXP_WARN_将附近的 |cRXP_ENEMY_石腭伏击者|r 风筝到可能在路上巡逻的 |cRXP_FRIENDLY_铁炉堡巡山人|r 身边（确保造成 51%+ 的伤害，以获得击杀归属）|r
    .mob 石腭伏击者
    .unitscan 铁炉堡巡山人
step
    #requires Shortcut2
    #completewith next
    .goto Dun Morogh,81.23,42.66,50,0
    .goto Dun Morogh,83.01,40.31,30 >>风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r穿过隧道
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（瞬发自身技能：提高移动速度，持续3秒；命中时造成40–100点近战伤害，只能在远处施放）|r
    .mob 有伤疤的峭壁野猪
step
    #label Pilot
    .goto Dun Morogh,83.89,39.19
    >>与 |cRXP_FRIENDLY_锤足|r 交谈
    .accept 419 >> 接受任务：失踪的驾驶员
    .target 驾驶员塞克·锤足
    .isQuestAvailable 419
step
    .goto Dun Morogh,81.37,37.02,30,0
    .goto Dun Morogh,79.67,36.17
    >>点击地上的 |cRXP_PICK_矮人的尸体|r
    >>|cRXP_WARN_交此任务前，务必确保背包有 1 个空格|r
    >>|cRXP_WARN_记得将 |cRXP_ENEMY_癞爪|r 风筝回 |cRXP_FRIENDLY_锤足|r 身边|r
    .turnin 419 >> 交任务：失踪的驾驶员
    .accept 417 >> 接受任务：驾驶员的复仇
step
    .goto Dun Morogh,78.41,37.80,60,0
    .goto Dun Morogh,83.89,39.19
    >>击杀|cRXP_ENEMY_癞爪|r，并拾取掉落的|cRXP_LOOT_肮脏的爪子|r
    >>|cRXP_WARN_将它一路风筝到 |cRXP_FRIENDLY_锤足|r 身边（确保造成 51%+ 的伤害，以获得击杀归属）|r
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob 癞爪
    .target 驾驶员塞克·锤足
step
    .goto Dun Morogh,83.892,39.188
    >>与 |cRXP_FRIENDLY_锤足|r 交谈
    .turnin 417,1 >> 交任务：驾驶员的复仇
    .target 驾驶员塞克·锤足
step
    #label Tunnel1
    #completewith Barleybrew
    .goto Dun Morogh,83.01,40.31,30,0
    .goto Dun Morogh,81.23,42.66,30 >>穿过隧道返回
step
    .goto Dun Morogh,78.73,49.77
    >>|cRXP_WARN_小心，|cRXP_ENEMY_有伤疤的峭壁野猪|r 和 |cRXP_ENEMY_老峭壁野猪|r 会施放|r |T132337:0|t[冲锋] |cRXP_WARN_（自身瞬发：提高移动速度，持续 3 秒；命中时造成 40–100 点近战伤害，只能在远处施放），而 |cRXP_ENEMY_冰爪熊|r 会施放|r |T135853:0|t[寒冰爪] |cRXP_WARN_（近战瞬发：额外造成 4 点近战伤害）|r
    .xp 9+5450 >> 刷怪至 5450+/6500 经验值
    .mob 冰爪熊
    .mob 老峭壁野猪
    .mob 有伤疤的峭壁野猪
step
    #requires Tunnel1
    #label Tunnel2
    #completewith Barleybrew
    .goto Dun Morogh,79.61,49.94,20,0
    .goto Dun Morogh,81.10,49.76,20,0
    .goto Dun Morogh,81.60,50.01,20,0
    .goto Dun Morogh,83.59,49.18,20,0
    >>沿途风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（瞬发自身技能：提高移动速度，持续3秒；命中时造成40–100点近战伤害，只能在远处施放）|r
    .goto Dun Morogh,84.26,48.93,20 >>执行山地跳点，记得小心落下
    .mob 有伤疤的峭壁野猪
step
    #requires Tunnel2
    #completewith next
    >>|cRXP_WARN_小心，|cRXP_ENEMY_有伤疤的峭壁野猪|r 会施放|r |T132337:0|t[冲锋] |cRXP_WARN_（自身瞬发：提高移动速度，持续 3 秒；命中时造成 40–100 点近战伤害，只能在远处施放）|r
    .xp 9+5990 >> 刷怪至 5990+/6500 经验值
    .mob 有伤疤的峭壁野猪
step
    #label Barleybrew
    .goto Dun Morogh,86.278,48.812
    >>与 |cRXP_FRIENDLY_麦酒|r 交谈
    .turnin 413 >> 交任务：微光酒
    .accept 414 >> 接受任务：卡德雷尔的酒
    .target 巡山人维拉特·麦酒
step
    .goto Dun Morogh,86.74,49.58,40,0
    .goto Dun Morogh,86.36,47.36
    .xp 9+6320 >> 刷怪至 6320+/6500 经验值
    >>|cRXP_WARN_小心，|cRXP_ENEMY_有伤疤的峭壁野猪|r 会施放|r |T132337:0|t[冲锋] |cRXP_WARN_（自身瞬发：提高移动速度，持续 3 秒；命中时造成 40–100 点近战伤害，只能在远处施放）|r
    .mob 有伤疤的峭壁野猪
step
    #label CragB1
    #completewith Cobbleflint
    .goto Loch Modan,16.45,58.54,20,0
    .goto Loch Modan,19.59,62.76,30 >>风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r穿过隧道
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（瞬发自身技能：提高移动速度，持续3秒；命中时造成40–100点近战伤害，只能在远处施放）|r
    .mob 有伤疤的峭壁野猪
step
#loop
	.line Loch Modan,21.14,71.62,19.06,75.46,20.91,77.67,21.14,71.62
	.goto Loch Modan,21.14,71.62,35,0
	.goto Loch Modan,19.06,75.46,35,0
	.goto Loch Modan,20.91,77.67,35,0
	.goto Loch Modan,21.14,71.62,35,0
    .xp 10 >> 刷怪升至10级
    .mob 老黑熊
    .mob 森林潜伏者
step
    #requires CragB1
    #completewith Rugelfuss
    +|cRXP_WARN_尽量把附近的|cRXP_ENEMY_老黑熊|r或|cRXP_ENEMY_森林潜伏者|r风筝进地堡（确保造成至少51%的伤害以获得击杀归属）|r
    >>|cRXP_WARN_从|cRXP_ENEMY_老黑熊|r身上拾取|r |T134027:0|t[|cRXP_LOOT_熊肉|r]
    >>|cRXP_WARN_从|cRXP_ENEMY_森林潜伏者|r身上拾取|r |T134437:0|t[|cRXP_LOOT_蜘蛛的毒液|r]
    >>|cRXP_FRIENDLY_库伯弗林特|r|cRXP_WARN_、|cRXP_FRIENDLY_格拉维戈|r和|cRXP_FRIENDLY_沃尔班|r不会协助你|r
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .disablecheckbox
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .disablecheckbox
    .mob 老黑熊
    .mob 森林潜伏者
step
    #label Cobbleflint
    .goto Loch Modan,22.071,73.127
    >>与 |cRXP_FRIENDLY_库伯弗林特|r 交谈
    .accept 224 >> 接受任务：保卫国王的领土
    .target 巡山人库伯弗林特
step
    #completewith next
    .goto Loch Modan,23.27,75.65,12,0
    .goto Loch Modan,23.62,75.42,12,0
    .goto Loch Modan,23.12,73.93,12 >> 进入地堡并前往顶层
step
    #label Rugelfuss
    .goto Loch Modan,23.233,73.675
    >>与 |cRXP_FRIENDLY_拉格弗斯|r 交谈
    .accept 267 >> 接受任务：穴居人的威胁
    .target 拉格弗斯上尉
step << skip
    #completewith next
    .goto Loch Modan,21.49,68.14,20,0
    .goto Loch Modan,20.86,64.46,20,0
    .goto Loch Modan,19.50,62.56,30 >>回到隧道
step << skip
    .goto Loch Modan,18.84,61.48
    .link https://www.youtube.com/watch?v=AOAlX9B5aO0 >>|cRXP_WARN_如果此步骤遇到困难，请点击链接观看说明|r
    .goto Loch Modan,32.19,46.95,30 >>|cRXP_WARN_从隧道里的火盆处起跳，执行登出跳点传送到塞尔萨玛|r
    .isOnQuest 414
step
    .goto Loch Modan,32.93,49.51,40,0
    .goto Loch Modan,34.49,47.44,40,0
    .goto Loch Modan,37.05,46.11,40,0
    .goto Loch Modan,37.39,45.17,40,0
    .goto Loch Modan,37.12,42.79
    >>与 |cRXP_FRIENDLY_卡德雷尔|r 交谈
    >>|cRXP_FRIENDLY_卡德雷尔|r |cRXP_WARN_沿塞尔萨玛主路巡逻|r
    .turnin 414 >>交任务：卡德雷尔的酒
    .accept 416 >> 接受任务：狗头人的耳朵
    .accept 1339 >> 接受任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    .goto Loch Modan,37.18,47.13,10,0
    .goto Loch Modan,37.02,47.80
    >>与|cRXP_FRIENDLY_布洛克|r交谈
    >>|cRXP_WARN_他可能在建筑内，也可能在建筑外。|r
    .accept 6387 >>接取任务：荣誉学员
    .target 布洛克·寻石者
step
    .goto Loch Modan,33.94,50.96
    >>与 |cRXP_FRIENDLY_索格拉姆|r 交谈
    .fp Thelsamar >> 开通塞尔萨玛飞行点
    .turnin 6387 >>交任务：荣誉学员
    .accept 6391 >>接受任务：飞往铁炉堡
    .target 索格拉姆·伯雷森
step
    #completewith next
    .goto Loch Modan,33.94,50.96
    >>与 |cRXP_FRIENDLY_索格拉姆|r 交谈
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
--VV Merge with step above
step
    .zone Ironforge >> 前往铁炉堡
    .isOnQuest 6391
step
    #completewith next
    .goto Ironforge,55.81,38.35,30,0
    .goto Ironforge,51.83,29.77,15,0
    .goto Ironforge,49.67,28.23,12,0
    >>进入建筑
    .goto Ironforge,51.54,26.30,10 >>前往|cRXP_FRIENDLY_高尼尔·石趾|r处
step
    .goto Ironforge,51.54,26.30
    >>与 |cRXP_FRIENDLY_高尼尔|r 交谈
    .turnin 6391 >>交任务：飞往铁炉堡
    .accept 6388 >>接受任务：格莱斯·瑟登
    .vendor >> 卖掉杂物
    .target 高尼尔·石趾
    .isOnQuest 291
step
    #completewith next
    .goto Ironforge,49.67,28.23,12,0
    .goto Ironforge,55.81,38.35,30,0
    >>离开建筑
    .goto Ironforge,55.49,47.74,10 >>前往|cRXP_FRIENDLY_格莱斯·瑟登|r处
step
    .goto Ironforge,55.50,47.74
    >>与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .turnin 6388 >>交还任务：格莱斯·瑟登
--   .accept 6392 >>Accept Return to Brock
-- .fly Thelsamar >> Fly to Thelsamar
    .target 格莱斯·瑟登
step
    #completewith next
    .goto Ironforge,55.07,51.36,30,0
    .goto Ironforge,49.11,56.02,30,0
    .goto Ironforge,46.67,50.56,20,0
    .goto Ironforge,44.12,50.37,20,0
    .goto Ironforge,39.55,57.49,10 >>前往|cRXP_FRIENDLY_巴林|r处
step
    .goto Ironforge,39.55,57.49
    >>与|cRXP_FRIENDLY_巴林|r交谈
    .turnin 291 >>交还任务：森内尔的报告
    .target 参议员巴林·红石
step
    #completewith next
    .goto Ironforge,44.43,49.08,20,0
    .goto Ironforge,44.08,46.60,20,0
    .goto Ironforge,40.84,44.59,20,0
    .goto Ironforge,35.30,32.76,20,0
    .goto Ironforge,27.60,11.06,20,0
    .goto Ironforge,27.17,8.58,10 >>前往|cRXP_FRIENDLY_丁克|r处
step
    .goto Ironforge,27.17,8.58
    >>与 |cRXP_FRIENDLY_丁克|r 交谈
    .trainer >> 学习职业技能（霜甲术等级2、冰霜新星、变形术、造水术等级1和等级2）
    >>总花费：15 银币
    >>记得预留购买治疗药水（每瓶 3 银币）、青铜管（每个 8 银币）和 5 级食物（20 铜币买 5 份）的钱
    .target 丁克
step << skip
    #completewith IFHS
    +|cRXP_WARN_设置炉石绑定点后，记得在蜡烛上通过重新登录传送：|r |T134414:0|t[炉石]
step
    #completewith next
    --.goto Ironforge,27.25,12.79,20,0
    --.goto Ironforge,22.59,38.13,20,0
    --.goto Ironforge,20.40,53.19,20,0
    >>进入建筑
    .goto Ironforge,18.14,51.45,10 >>前往|cRXP_FRIENDLY_旅店老板火酒|r处
step
    #label IFHS
    .goto Ironforge,18.14,51.45
    >>与 |cRXP_FRIENDLY_火酒|r 交谈
    .home >> 将炉石设在铁炉堡
    .target 旅店老板洛雷·火酒
step << skip
    .goto Ironforge,19.11,52.80
    .zone Dun Morogh >>|cRXP_WARN_跳上桌上的蜡烛，再通过重新登录传送前往丹莫罗|r
    .isOnQuest 416
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#classic
#tbc
<< Alliance Mage
#name 10-12 ADV Darkshore 1 Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor Human Mage/Gnome Mage
#next 12-14 ADV Loch Modan Mage AoE
#displayname 10-12 黑海岸 1（法师进阶 AoE）
step
    #completewith DeathlessSkip
    .goto Ironforge,15.16,85.70,20,0
    .goto Dun Morogh,59.84,49.56
    .zone Dun Morogh >> 离开铁炉堡
step
    #completewith next
    .goto Dun Morogh,53.48,37.50,30,0
    .goto Dun Morogh,54.04,38.60,30,0
    .goto Dun Morogh,59.43,42.85,150 >> 前往跳点，沿途紧贴山体左侧。
step
    #label DeathlessSkip
    .goto Dun Morogh,60.18,43.01,12,0
    .goto Dun Morogh,60.42,43.75,12,0
    .goto Dun Morogh,60.71,44.18,4,0
    .goto Dun Morogh,60.95,44.16,6,0
    .goto Dun Morogh,61.45,41.68,10,0
    .goto Dun Morogh,61.76,41.50,4,0
    .goto Dun Morogh,61.84,41.63,4,0
    .goto Dun Morogh,62.01,41.30,8,0
    .goto Dun Morogh,61.79,39.71,15,0
    .goto Dun Morogh,61.48,36.85,12,0
    .goto Dun Morogh,61.46,32.76,15,0
    .goto Dun Morogh,61.38,28.92,30,0
    .goto Dun Morogh,60.91,22.82,30,0
    .goto Dun Morogh,60.51,16.20,5,0
    .goto Dun Morogh,60.52,15.81,5,0
    .goto Dun Morogh,60.74,15.16,15,0
    .goto Dun Morogh,60.41,14.35,8,0
    .goto Dun Morogh,60.64,13.89,6,0
    .goto Dun Morogh,61.40,13.27,10,0
    .goto Dun Morogh,61.52,12.58,8,0
    >>|cRXP_WARN_执行丹莫罗至湿地的翻山跳点（全程不死亡）。|r
    >>|cRXP_WARN_如果没把握，每次坠落后都吃东西恢复满生命，再继续。|r
    .link https://youtu.be/QcEUvwu49KI?t=73 >> |cRXP_WARN_点击此处观看参考视频（强烈建议观看）。|r
    .goto Dun Morogh,60.65,11.38,20 >>小心地沿山坡往下跳。
    .isQuestAvailable 983
step
    .goto Dun Morogh,60.80,10.33,10,0
    .goto Dun Morogh,60.61,9.73,8,0
    .goto Wetlands,18.79,72.53,12,0
    .goto Wetlands,18.70,70.97,12,0
    .goto Wetlands,18.50,69.39,12,0
    .goto Wetlands,17.62,68.35,15,0
    .goto Wetlands,17.00,67.68,12,0
    .goto Wetlands,15.96,67.15,12,0
    .goto Wetlands,15.07,66.41,20,0
    .goto Wetlands,15.31,65.47,20,0
    .goto Wetlands,15.10,63.72,12,0
    >>|cRXP_WARN_执行丹莫罗至湿地的翻山跳点（全程不死亡）。|r
    >>|cRXP_WARN_如果稀有怪|cRXP_ENEMY_斯拉丁|r已刷新，朝海岸下行前小心它|r
    >>|cRXP_WARN_到达海边后，小心西侧的|cRXP_ENEMY_蓝腮袭击者|r。|r
    >>|cRXP_WARN_渡海时避开|cRXP_ENEMY_湿地鳄鱼幼崽|r，等它们巡逻离开后再通过|r
    .link https://youtu.be/QcEUvwu49KI?t=336 >> |cRXP_WARN_点击此处观看参考视频（强烈建议观看）。|r
    .goto Wetlands,12.69,60.97,15 >> 前往湿地的米奈希尔港。
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
    .unitscan 斯拉丁
    .isQuestAvailable 983
step
    #completewith next
    .goto Wetlands,10.80,59.80,10,0
    .goto Wetlands,10.63,60.10,10 >>进入旅店。
step
    .goto Wetlands,10.50,60.20
    >>跳到楼下的吊灯上。
    >>隔着墙与|cRXP_FRIENDLY_萨莫尔|r交谈。
    >>|cRXP_WARN_注意：要执行此操作，请在选项菜单的“游戏”→“控制”中绑定“与目标互动”按键|r
    >>|cRXP_WARN_如果船刚刚抵达，跳过此步骤。|r
    .vendor 1457 >> |cRXP_BUY_购买|r |T134831:0|t[治疗药水] |cRXP_BUY_（如果他有货）|r
    .target 萨莫尔·菲斯蒂沃斯
    .money <0.03
step
    .goto Wetlands,9.49,59.69
    >>与|cRXP_FRIENDLY_谢尔雷·布隆迪尔|r交谈。
    .fp Menethil Harbor >> 开启米奈希尔港飞行点。
    .target 谢尔雷·布隆迪尔
step
    #completewith DarkshoreBoat
    .goto Wetlands,7.89,56.22
    >>|cRXP_WARN_如果船刚刚抵达，跳过此步骤。|r
    +|cRXP_WARN_站在屋外，烹饪持有的所有|r|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_（屋内有篝火）|r
    .itemcount 769,1
step
    .goto Wetlands,7.89,56.22
    >>隔墙与|cRXP_FRIENDLY_德温·晨光|r交谈。
    >>|cRXP_WARN_如果船刚刚抵达，跳过此步骤。|r
    .vendor 1453 >> |cRXP_BUY_购买|r |T134831:0|t[治疗药水] |cRXP_BUY_（如果他有货）|r
    .target 德温·晨光
    .money <0.03
step
    #completewith Darkshore
    #label DarkshoreBoat
    .goto Wetlands,6.09,58.45,20,0
    .goto Wetlands,4.50,57.02,20 >>前往黑海岸渡船。
step
    #completewith next
    #requires DarkshoreBoat
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级 2）]|cRXP_WARN_，尽可能多造水|r
step
    #label Darkshore
    .goto Wetlands,4.25,57.21
    .zone Darkshore >> 乘船前往黑海岸
step
    #label Darkshoreshore
    #completewith Wizbang
    .goto Darkshore,35.73,45.23,60 >>在最靠近岸边时跳下船。
step
    #requires Darkshoreshore
    #completewith Wizbang
    +|cRXP_WARN_将2–3只|cRXP_ENEMY_小潮行蟹|r风筝到|cRXP_FRIENDLY_维兹班恩·曲针|r附近（记得施放|r |T135848:0|t[冰霜新星]|cRXP_WARN_），接到任务后击杀它们|r
    .mob 小潮行蟹
step
    #requires Darkshoreshore
    #completewith next
    .goto Darkshore,36.77,44.28,0,0
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_最多购买20条|r |T133918:0|t[长嘴泥鳅] |cRXP_BUY_（从他那里购买）|r
    .vendor >> 把杂物卖给商人。
    .collect 4592,20,983,1 --Longjaw Mud Snapper (20)
    .isQuestAvailable 983
step
    #requires Darkshoreshore
    #completewith next
    .goto Darkshore,36.72,44.52,20,0
    .goto Darkshore,36.84,44.18,10,0
    .goto Darkshore,36.71,43.87,10,0
    >>上楼到最顶层。
    .goto Darkshore,36.98,44.14,8 >>前往|cRXP_FRIENDLY_维兹班恩·曲针|r处。
step
    #label Wizbang
    .goto Darkshore,36.98,44.14
    >>与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈。
    .accept 983 >>接取任务：传声盒 827 号
    .target 维兹班恩·曲针
step
    #completewith next
    >>击杀你引来的|cRXP_ENEMY_小潮行蟹|r，并拾取它们掉落的|cRXP_LOOT_蟹腿|r。
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
step
    #completewith next
    .goto Darkshore,37.44,43.12,20,0
    .goto Darkshore,37.73,41.40,20,0
    .goto Darkshore,37.39,40.13,10 >>前往|cRXP_FRIENDLY_桑迪斯·织风|r处。
step
    #sticky
    #label DalmondBags
    .goto Darkshore,37.45,40.50
    >>与|cRXP_FRIENDLY_达蒙德|r交谈。
    .vendor 4182 >> |cRXP_BUY_购买|r |T133634:0|t[棕色小包] |cRXP_BUY_，按需要和资金允许的数量尽量多买|r
    .target 达蒙德
    .money <0.0500
    .isQuestAvailable 954
step
    .goto Darkshore,37.39,40.13
    >>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈。
    .accept 954 >>接取任务：巴莎兰
    .accept 958 >>接取任务：上层精灵的工具
    .target 桑迪斯·织风
	.skill cooking,10,1
step
    >>与|cRXP_FRIENDLY_桑迪斯·织风|r和|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈。
    .accept 954 >>接取任务：巴莎兰
    .accept 958 >>接取任务：上层精灵的工具
    .target +桑迪斯·织风
    .goto Darkshore,37.39,40.13
    .accept 2178 >>接取任务：炖陆行鸟
    .goto Darkshore,37.69,40.66
    .target +奥兰达利亚·夜歌
	.skill cooking,<10,1
step
    #requires DalmondBags
    #completewith next
    .goto Darkshore,37.85,41.39,20,0
    .goto Darkshore,38.58,42.61,20,0
    .goto Darkshore,39.05,43.23,20,0
    .goto Darkshore,39.37,43.49,12 >>前往|cRXP_FRIENDLY_特伦希斯|r处。
step
    #requires DalmondBags
    >>与|cRXP_FRIENDLY_特伦希斯|r和|cRXP_FRIENDLY_萨纳瑞恩|r交谈。
    .accept 984 >>接取任务：熊怪的威胁
    .target +特伦希斯
    .goto Darkshore,39.37,43.49
    .accept 2118 >>接取任务：瘟疫蔓延
    .goto Darkshore,38.84,43.41
    .target +萨纳瑞恩·绿树
 step
    .goto Darkshore,36.77,44.28
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_最多购买20条|r |T133918:0|t[长嘴泥鳅] |cRXP_BUY_（从他那里购买）|r
    .vendor >> 把杂物卖给商人。
    .collect 4592,20,983,1 --Longjaw Mud Snapper (20)
    .isQuestAvailable 983
    .itemcount 4592,<20
step
    #completewith next
    .goto Darkshore,36.22,44.89,50,0
    .goto Darkshore,35.81,45.78,50,0
    .goto Darkshore,35.86,47.35,50,0
    .goto Darkshore,35.74,48.20,50,0
    .goto Darkshore,36.25,49.90,50,0
    >>击杀|cRXP_ENEMY_小潮行蟹|r，并拾取它们掉落的|cRXP_LOOT_蟹腿|r。
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
step
    #completewith next
    .goto Darkshore,38.23,52.84,75,0
    >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望]|cRXP_WARN_捕捉一只|cRXP_ENEMY_狂暴蓟熊|r；射程为50码|r
    >>|cRXP_WARN_小心：它们会施放|r |T135914:0|t|cRXP_WARN_[狂犬病]（瞬发近战技能：使所有生命恢复速度降低 50%，持续 10 分钟）。|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .use 7586
    .unitscan 狂暴蓟熊
step
    .goto Darkshore,38.90,53.59
    >>跑向熊怪营地。
    >>|cRXP_WARN_不要尝试与|r|cRXP_ENEMY_黑木风语者|r战斗
    .complete 984,1 --Find a corrupt furbolg camp (1)
step
    .goto Darkshore,38.63,56.34,60,0
    .goto Darkshore,38.80,58.29,60,0
    .goto Darkshore,38.38,60.75,60,0
    .goto Darkshore,38.57,66.39
    >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望]|cRXP_WARN_捕捉一只|cRXP_ENEMY_狂暴蓟熊|r；射程为50码|r
    >>|cRXP_WARN_小心：它们会施放|r |T135914:0|t|cRXP_WARN_[狂犬病]（瞬发近战技能：使所有生命恢复速度降低 50%，持续 10 分钟）。|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .use 7586
    .unitscan 狂暴蓟熊
step
    .goto Darkshore,40.30,59.73
    >>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈。
    .accept 953 >>接取任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
step
    #completewith Relics
    +|cRXP_WARN_若稀有怪|cRXP_ENEMY_莫嘉泽尔|r已刷新，避免引到她|r
    .unitscan 莫嘉泽尔
step
    #completewith Fall
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r，并拾取它们掉落的|cRXP_LOOT_上层精灵的遗物|r。
    >>|cRXP_WARN_只有挡路时才击杀|cRXP_ENEMY_哀嚎的贵族|r。|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
step
    .goto Darkshore,42.65,63.15
    >>点击地上的|cRXP_PICK_亚米萨兰的毁灭|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .complete 953,2 --Read the Fall of Ameth'Aran (1)
step
    .goto Darkshore,43.30,58.70
    >>点击地上的|cRXP_PICK_亚米萨兰的衰落|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .complete 953,1 --Read the Lay of Ameth'Aran (1)
step
    #label Fall
    .goto Darkshore,40.30,59.73
    >>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈。
    .turnin 953 >>交还任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
step
    #label Relics
    .goto Darkshore,41.76,57.96,50,0
    .goto Darkshore,43.11,57.55,50,0
    .goto Darkshore,43.82,58.29,50,0
    .goto Darkshore,43.58,59.99,50,0
    .goto Darkshore,43.49,62.92,50,0
    .goto Darkshore,42.38,63.40,50,0
    .goto Darkshore,41.21,61.64,50,0
    .goto Darkshore,41.76,57.96
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r。
    >>|cRXP_WARN_只有挡路时才击杀|cRXP_ENEMY_哀嚎的贵族|r。|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
step
    #completewith next
    +|cRXP_WARN_将2–3只|cRXP_ENEMY_恶灵劣魔|r风筝到|cRXP_FRIENDLY_阿斯特利安|r附近（记得施放|r |T135848:0|t[冰霜新星]|cRXP_WARN_），接到任务后击杀它们|r
    .mob 恶灵劣魔
step
    .goto Darkshore,44.17,36.29
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 954 >> 交还任务：巴莎兰
    .accept 955 >> 接取任务：巴莎兰
    .target 阿斯特利安
step
    #completewith BashalF
    +|cRXP_WARN_小心，稀有怪|cRXP_ENEMY_利斯林|r可能已刷新|r
    >>|cRXP_WARN_它会施放|r |T136197:0|t[暗影箭]|cRXP_WARN_（远程读条，造成55–70点暗影伤害）|r
    .unitscan 利斯林
step
#loop
	.line Darkshore,44.57,36.57,44.47,38.11,44.02,38.55,45.01,39.62,45.61,38.81,45.18,37.51,45.86,36.96,46.91,37.11,45.47,36.01,44.57,36.57
	.goto Darkshore,44.57,36.57,35,0
	.goto Darkshore,44.47,38.11,35,0
	.goto Darkshore,44.02,38.55,35,0
	.goto Darkshore,45.01,39.62,35,0
	.goto Darkshore,45.61,38.81,35,0
	.goto Darkshore,45.18,37.51,35,0
	.goto Darkshore,45.86,36.96,35,0
	.goto Darkshore,46.91,37.11,35,0
	.goto Darkshore,45.47,36.01,35,0
	.goto Darkshore,44.57,36.57,35,0
    >>击杀 |cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_野生劣魔|r，并拾取它们掉落的 |cRXP_LOOT_劣魔耳环|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_恶灵劣魔|r会施放|r|T136016:0|t[毒药]|cRXP_WARN_（近战瞬发：每3秒造成3点伤害，持续15秒）；|cRXP_ENEMY_野生劣魔|r会施放|r|T136215:0|t[癫狂]|cRXP_WARN_（自身瞬发：生命值低于20%时攻击速度提高20%）|r
    .complete 955,1 --Grell Earring (8)
    .mob 恶灵劣魔
    .mob 野生劣魔
step
    .goto Darkshore,44.17,36.29
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 955 >> 交还任务：巴莎兰
    .accept 956 >> 接取任务：巴莎兰
    .target 阿斯特利安
step
    .goto Darkshore,45.50,36.50,45,0
    .goto Darkshore,45.93,37.78,45,0
    .goto Darkshore,45.94,38.04,45,0
    .goto Darkshore,45.43,39.66,45,0
    .goto Darkshore,46.67,39.09,45,0
    .goto Darkshore,47.36,37.63,45,0
    .goto Darkshore,47.77,37.20,45,0
    .goto Darkshore,47.44,36.76,45,0
    .goto Darkshore,45.50,36.50,45,0
    .goto Darkshore,45.93,37.78,45,0
    .goto Darkshore,45.94,38.04,45,0
    .goto Darkshore,45.43,39.66,45,0
    .goto Darkshore,46.67,39.09,45,0
    .goto Darkshore,47.36,37.63,45,0
    .goto Darkshore,47.77,37.20,45,0
    .goto Darkshore,47.44,36.76
    >>击杀|cRXP_ENEMY_戴瑟雷萨特|r，并拾取它们掉落的|cRXP_LOOT_远古月亮石封印|r。
    >>|cRXP_WARN_小心，它们会施放|r |T132222:0|t[射击]|cRXP_WARN_（远程读条，造成15–25点伤害）|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob 戴瑟雷萨特
step
#loop
	.line Darkshore,44.57,36.57,44.47,38.11,44.02,38.55,45.01,39.62,45.61,38.81,45.18,37.51,45.86,36.96,46.91,37.11,45.47,36.01,44.57,36.57
	.goto Darkshore,44.57,36.57,35,0
	.goto Darkshore,44.47,38.11,35,0
	.goto Darkshore,44.02,38.55,35,0
	.goto Darkshore,45.01,39.62,35,0
	.goto Darkshore,45.61,38.81,35,0
	.goto Darkshore,45.18,37.51,35,0
	.goto Darkshore,45.86,36.96,35,0
	.goto Darkshore,46.91,37.11,35,0
	.goto Darkshore,45.47,36.01,35,0
	.goto Darkshore,44.57,36.57,35,0
    .xp 11+1100 >> 刷怪升至1100+/8800经验
    .mob 恶灵劣魔
    .mob 野生劣魔
--910+900+750+975+850 = 4385 (Turnins starting from Bashal Seal turnin)
--675+975 = 1650 (Turtle turnins)
step
    #label BashalF
    .goto Darkshore,44.17,36.29
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 956 >> 交还任务：巴莎兰
    .accept 957 >> 接取任务：巴莎兰
    .target 阿斯特利安
step
    #sticky
    #label DalmondBags1
    .goto Darkshore,37.45,40.50,0,0
    >>与|cRXP_FRIENDLY_达蒙德|r交谈。
    .vendor >> 把杂物卖给商人。
    .target 达蒙德
    .isQuestAvailable 3524
step
    .goto Darkshore,37.40,40.13
    >>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈。
    .turnin 958 >>交还任务：上层精灵的工具
    .target 桑迪斯·织风
step
    #requires DalmondBags1
    .goto Darkshore,37.69,40.66
    >>与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈。
    .turnin 2178 >>交还任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5
    .skill cooking,<10,1
step
    >>与|cRXP_FRIENDLY_特伦希斯|r和|cRXP_FRIENDLY_萨纳瑞恩|r交谈。
    .turnin 984 >> 交还任务：熊怪的威胁
    .accept 985 >> 接取任务：熊怪的威胁
    .accept 4761 >> 接取任务：桑迪斯·织风
    .target +特伦希斯
    .goto Darkshore,39.37,43.49
    .turnin 2118 >> 交还任务：瘟疫蔓延
    .accept 2138 >> 接取任务：清除疫病
    .goto Darkshore,38.84,43.41
    .target +萨纳瑞恩·绿树
step
    #sticky
    #label Gwennyth
    .goto Darkshore,36.62,45.59
    >>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈。
    .accept 3524 >>接取任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
    .goto Darkshore,36.34,45.58
    >>与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈。
    .fp Auberdine >> 开启奥伯丁飞行点。
    .target 凯莱斯·月羽
step
    #requires Gwennyth
    #completewith Bones
    .goto Darkshore,36.22,44.89,50,0
    .goto Darkshore,35.81,45.78,50,0
    .goto Darkshore,35.86,47.35,50,0
    .goto Darkshore,35.74,48.20,50,0
    .goto Darkshore,36.25,49.90,50,0
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，并拾取它们掉落的|cRXP_LOOT_蟹腿|r。
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    #requires Gwennyth
    #completewith next
    >>|cRXP_WARN_保留|r |T133884:0|t[鱼人的眼球]|cRXP_WARN_，它们来自|cRXP_ENEMY_灰雾滩行者|r和|r|cRXP_ENEMY_灰雾袭击者|r
    .collect 730,3,38,1 --Murloc Eyes (3)
    .mob 灰雾滩行者
    .mob 灰雾袭击者
step
    #requires Gwennyth
    #label Bones
    .goto Darkshore,36.38,50.88
    >>拾取|cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_小心，附近的|cRXP_ENEMY_灰雾滩行者|r具有|r |T132307:0|t[移动速度提升]
    >>|cRXP_WARN_此操作需要5秒读条|r
    .complete 3524,1 --Sea Creature Bones (1)
step
    .goto Darkshore,36.22,44.89
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，并拾取它们掉落的|cRXP_LOOT_蟹腿|r。
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    .goto Darkshore,36.64,46.26
    >>点击|cRXP_PICK_传声盒827号|r
    .turnin 983 >>交还任务：传声盒 827 号
    .accept 1001 >>接取任务：传声盒 411 号
step
    .goto Darkshore,36.72,45.07,12,0
    .goto Darkshore,36.62,45.59
    >>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈。
    .turnin 3524 >>交还任务：搁浅的巨兽
    .accept 4681 >>接取任务：搁浅的巨兽
    .target 温尼斯·布莱葛
 step
    .goto Darkshore,36.77,44.28
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_最多购买40条|r|T133918:0|t[长嘴泥鳅]|cRXP_BUY_，向他购买|r
    .collect 4592,40,4681,1 --Longjaw Mud Snapper (40)
    .target 莱尔德
step
    .goto Darkshore,36.68,44.05,12,0
    .goto Darkshore,35.74,43.70
    >>与|cRXP_FRIENDLY_塞瑞利恩|r交谈。
    .accept 963 >>接取任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #completewith Gwen
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r。
    >>|cRXP_WARN_不要特意绕路击杀它们。|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
step
    #completewith next
    .goto Darkshore,32.91,42.24,15,0
    .goto Darkshore,32.41,43.82,25 >> 沿码头跑向|cRXP_LOOT_海龟的残骸|r
step
    .goto Darkshore,31.86,46.33
    >>潜到水下。
    >>拾取|cRXP_LOOT_海龟遗骸|r
    .complete 4681,1 --Sea Turtle Remains (1)
step
    .goto Darkshore,36.12,44.70,50,0
    .goto Darkshore,35.80,45.88,50,0
    .goto Darkshore,36.04,48.63,50,0
    .goto Darkshore,36.13,50.13,50,0
    .goto Darkshore,36.58,53.20,50,0
    .goto Darkshore,35.23,53.81,50,0
    .goto Darkshore,35.22,55.37,50,0
    .goto Darkshore,36.70,57.09,50,0
    .goto Darkshore,36.12,44.70,50,0
    .goto Darkshore,35.80,45.88,50,0
    .goto Darkshore,36.04,48.63,50,0
    .goto Darkshore,36.13,50.13,50,0
    .goto Darkshore,36.58,53.20,50,0
    .goto Darkshore,35.23,53.81,50,0
    .goto Darkshore,35.22,55.37,50,0
    .goto Darkshore,36.70,57.09
    .xp 11+7825 >> 刷怪升至7825+/8800经验
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    #label Gwen
    .goto Darkshore,36.67,45.08,12,0
    .goto Darkshore,36.62,45.59
    >>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈。
    .turnin 4681,1 >> 交还任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step << skip
    #completewith next
    +装备新获得的|T132537:0|t[沙浪之靴]。
    .use 15398
    .itemcount 15398,1
    .itemStat 8,LEVEL,<14
step
    .goto Darkshore,37.04,44.13
    >>|cRXP_WARN_===请特别注意===|r
    >>|cRXP_WARN_与|r |cRXP_FRIENDLY_旅店老板莎希因|r交谈
    >>|cRXP_WARN_如果你第一次使用炉石批处理技巧，请先观看下方指南。|r
    >>|cRXP_WARN_打开“设置炉石”菜单，然后使用|r |T134414:0|t[炉石]
    .hs >> |cRXP_WARN_炉石批处理：从奥伯丁传送至铁炉堡。|r
    .link https://www.youtube.com/watch?v=Is-h2TJpL3M >> |cRXP_WARN_点击此处观看操作指南（强烈建议观看）。为降低失败风险，请先设置并测试批处理窗口大小。|r
    .target 旅店老板莎希因
    .zoneskip Ironforge
step
    .goto Ironforge,27.17,8.58
    >>与|cRXP_FRIENDLY_丁克|r交谈。
    .trainer >> 学习职业法术：[火球术（等级 3）]和魔法抑制。
    >>总费用：12 银。
    >>记得预留一些钱购买 |T133024:0|t[青铜管] （每根8银），以及飞往塞尔萨玛的费用（1银10铜）
    .target 丁克
step << skip
    .goto Ironforge,27.22,8.58,-1
    .goto Ironforge,67.83,42.47,-1
    .vendor 5175 >> 如果愿意，可在|cRXP_FRIENDLY_丁克|r上方的柱子上执行登出跳点，然后去|cRXP_FRIENDLY_考格斯宾|r处查看是否有|T133024:0|t[青铜管]可买
    .itemcount 4371,<1
    .isQuestAvailable 418
step
    #completewith next
    +|cRXP_WARN_开始连续施放|r|T132794:0|t[造水术（等级2）]|cRXP_WARN_，在起飞前尽可能多制造一些水|r
step << Gnome
    .goto Ironforge,55.50,47.74
    >>与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈。
    .accept 6392 >>接取任务：向布洛克回复
    .target 格莱斯·瑟登
step
    .goto Ironforge,55.50,47.74
    >>与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈。
    .fly Thelsamar >> 飞往塞尔萨玛。
    .target 格莱斯·瑟登
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#classic
#tbc
<< Alliance Mage
#name 10-12 LAUNCH ADV Darkshore 1 Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none
#next 12-14 ADV Loch Modan Mage AoE
--VV Make this an alternative route that must be manually selected
#displayname 10-12 黑海岸 1（法师进阶 AoE，开服路线）
step
    #completewith next
    +|cRXP_WARN_注意：开服路线包含一些单人完成难度很高的任务，适合玩家密集、可以组队完成高难度任务的服务器，或有帮手协助获取怪物击杀归属的玩家|r
step
    #completewith DeathlessSkip
    .goto Ironforge,15.16,85.70,20,0
    .goto Dun Morogh,59.84,49.56
    .zone Dun Morogh >> 离开铁炉堡
step
    #completewith next
    .goto Dun Morogh,53.48,37.50,30,0
    .goto Dun Morogh,54.04,38.60,30,0
    .goto Dun Morogh,59.43,42.85,150 >> 前往跳点，沿途紧贴山体左侧。
step
    #label DeathlessSkip
    .goto Dun Morogh,60.18,43.01,12,0
    .goto Dun Morogh,60.42,43.75,12,0
    .goto Dun Morogh,60.71,44.18,4,0
    .goto Dun Morogh,60.95,44.16,6,0
    .goto Dun Morogh,61.45,41.68,10,0
    .goto Dun Morogh,61.76,41.50,4,0
    .goto Dun Morogh,61.84,41.63,4,0
    .goto Dun Morogh,62.01,41.30,8,0
    .goto Dun Morogh,61.79,39.71,15,0
    .goto Dun Morogh,61.48,36.85,12,0
    .goto Dun Morogh,61.46,32.76,15,0
    .goto Dun Morogh,61.38,28.92,30,0
    .goto Dun Morogh,60.91,22.82,30,0
    .goto Dun Morogh,60.51,16.20,5,0
    .goto Dun Morogh,60.52,15.81,5,0
    .goto Dun Morogh,60.74,15.16,15,0
    .goto Dun Morogh,60.41,14.35,8,0
    .goto Dun Morogh,60.64,13.89,6,0
    .goto Dun Morogh,61.40,13.27,10,0
    .goto Dun Morogh,61.52,12.58,8,0
    >>|cRXP_WARN_从丹莫罗走免死跳点前往湿地|r
    >>|cRXP_WARN_如果没有把握，每次跌落后都吃东西回满生命|r
    .link https://youtu.be/QcEUvwu49KI?t=73 >> |cRXP_WARN_点击此处查看参考视频（强烈建议观看）|r
    .goto Dun Morogh,60.65,11.38,20 >>小心沿山坡跳下
    .isQuestAvailable 983
step
    .goto Dun Morogh,60.80,10.33,10,0
    .goto Dun Morogh,60.61,9.73,8,0
    .goto Wetlands,18.79,72.53,12,0
    .goto Wetlands,18.70,70.97,12,0
    .goto Wetlands,18.50,69.39,12,0
    .goto Wetlands,17.62,68.35,15,0
    .goto Wetlands,17.00,67.68,12,0
    .goto Wetlands,15.96,67.15,12,0
    .goto Wetlands,15.07,66.41,20,0
    .goto Wetlands,15.31,65.47,20,0
    .goto Wetlands,15.10,63.72,12,0
    >>|cRXP_WARN_从丹莫罗走免死跳点前往湿地|r
    >>|cRXP_WARN_跳下前往海岸前，小心可能刷新的稀有怪|cRXP_ENEMY_斯拉丁|r|r
    >>|cRXP_WARN_抵达海边时，小心西侧的|cRXP_ENEMY_蓝腮袭击者|r|r
    >>|cRXP_WARN_渡海时避开|cRXP_ENEMY_湿地鳄鱼幼崽|r，等它们巡逻离开后再走|r
    .link https://youtu.be/QcEUvwu49KI?t=336 >> |cRXP_WARN_点击此处查看参考视频（强烈建议观看）|r
    .goto Wetlands,12.69,60.97,15 >> 前往米奈希尔港
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
    .unitscan 斯拉丁
    .isQuestAvailable 983
--VV Custom Video
step
    #completewith next
    .goto Wetlands,10.80,59.80,10,0
    .goto Wetlands,10.63,60.10,10 >>进入旅店。
step
    .goto Wetlands,10.50,60.20
    >>跳到楼下的吊灯上
    >>隔墙与|cRXP_FRIENDLY_萨莫尔·菲斯蒂沃斯|r交谈
    >>|cRXP_WARN_注意：要这样操作，需先在选项菜单的“游戏”→“控制”中，为“与目标互动”绑定按键|r
    >>|cRXP_WARN_如果船刚刚抵达，跳过此步骤。|r
    .vendor 1457 >> |cRXP_BUY_向他购买|r|T134831:0|t[治疗药水]|cRXP_BUY_（如果有货）|r
    .target 萨莫尔·菲斯蒂沃斯
    .money <0.03
step
    .goto Wetlands,9.49,59.69
    >>与|cRXP_FRIENDLY_谢尔雷·布隆迪尔|r交谈
    .fp Menethil Harbor >> 开通米奈希尔港飞行点
    .target 谢尔雷·布隆迪尔
step
    #completewith DarkshoreBoat
    .goto Wetlands,7.89,56.22
    >>|cRXP_WARN_如果船刚刚抵达，跳过此步骤。|r
    +|cRXP_WARN_站在外面烹饪背包里所有的|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_（室内有篝火）|r
    .itemcount 769,1
step
    .goto Wetlands,7.89,56.22
    >>隔墙与|cRXP_FRIENDLY_德温·晨光|r交谈
    >>|cRXP_WARN_如果船刚刚抵达，跳过此步骤。|r
    .vendor 1453 >> |cRXP_BUY_向他购买|r|T134831:0|t[治疗药水]|cRXP_BUY_（如果有货）|r
    .target 德温·晨光
    .money <0.03
step
    #completewith Darkshore
    #label DarkshoreBoat
    .goto Wetlands,6.09,58.45,20,0
    .goto Wetlands,4.50,57.02,20 >>前往开往黑海岸的船只
step
    #completewith next
    #requires DarkshoreBoat
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级 2）]|cRXP_WARN_，尽可能多造水|r
step
    #label Darkshore
    .goto Wetlands,4.25,57.21
    .zone Darkshore >> 乘船前往黑海岸
step
    #label Darkshoreshore
    #completewith Wizbang
    .goto Darkshore,35.73,45.23,60 >>船最靠近海岸时跳下船
step
    #requires Darkshoreshore
    #completewith Wizbang
    +|cRXP_WARN_将2–3只|cRXP_ENEMY_小潮行蟹|r风筝到|cRXP_FRIENDLY_维兹班恩·曲针|r附近（记得施放|r |T135848:0|t[冰霜新星]|cRXP_WARN_），接到任务后击杀它们|r
    .mob 小潮行蟹
step
    #requires Darkshoreshore
    #completewith next
    .goto Darkshore,36.77,44.28,0,0
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_向他购买最多20条|r|T133918:0|t[长嘴泥鳅]|cRXP_BUY_|r
    .vendor >> 出售杂物
    .collect 4592,20,983,1 --Longjaw Mud Snapper (20)
    .isQuestAvailable 983
step
    #requires Darkshoreshore
    #completewith next
    .goto Darkshore,36.72,44.52,20,0
    .goto Darkshore,36.84,44.18,10,0
    .goto Darkshore,36.71,43.87,10,0
    >>上楼到顶层
    .goto Darkshore,36.98,44.14,8 >>前往|cRXP_FRIENDLY_维兹班恩·曲针|r处。
step
    #label Wizbang
    .goto Darkshore,36.98,44.14
    >>与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈。
    .accept 983 >>接任务：传声盒827号
    .target 维兹班恩·曲针
step
    #completewith DalmondBags
    >>击杀你风筝过来的|cRXP_ENEMY_小潮行蟹|r，拾取|cRXP_LOOT_蟹腿|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
step
    .goto Darkshore,36.77,44.28
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_向他购买最多20条|r|T133918:0|t[长嘴泥鳅]|cRXP_BUY_|r
    .vendor >> 出售杂物
    .collect 4592,20,983,1 --Longjaw Mud Snapper (20)
    .isQuestAvailable 983
    .itemcount 4592,<20
step << skip
    #requires DalmondBags
    #completewith next
    .goto Darkshore,37.85,41.39,20,0
    .goto Darkshore,38.58,42.61,20,0
    .goto Darkshore,39.05,43.23,20,0
    .goto Darkshore,39.37,43.49,12 >>前往|cRXP_FRIENDLY_特伦希斯|r处。
step
    >>与|cRXP_FRIENDLY_特伦希斯|r和|cRXP_FRIENDLY_萨纳瑞恩|r交谈。
    .accept 984 >>接任务：熊怪的威胁
    .target +特伦希斯
    .goto Darkshore,39.37,43.49,-1
    .accept 2118 >>接任务：瘟疫蔓延
    .goto Darkshore,38.84,43.41,-1
    .target +萨纳瑞恩·绿树
step << skip
    #completewith next
    .goto Darkshore,37.44,43.12,20,0
    .goto Darkshore,37.73,41.40,20,0
    .goto Darkshore,37.39,40.13,10 >>前往|cRXP_FRIENDLY_桑迪斯·织风|r处。
step
    #sticky
    #label DalmondBags
    .goto Darkshore,37.45,40.50
    >>与|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor 4182 >> |cRXP_BUY_根据需要和财力，尽量购买|r|T133634:0|t[棕色小包]|cRXP_BUY_|r
    .target 达蒙德
    .money <0.0500
    .isQuestAvailable 954
step
    .goto Darkshore,37.39,40.13
    >>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈。
    .accept 954 >>接任务：巴莎兰
    .accept 958 >>接任务：上层精灵的工具
    .target 桑迪斯·织风
	.skill cooking,10,1
step
    >>与|cRXP_FRIENDLY_桑迪斯·织风|r和|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈。
    .accept 954 >>接任务：巴莎兰
    .accept 958 >>接任务：上层精灵的工具
    .target +桑迪斯·织风
    .goto Darkshore,37.39,40.13,-1
    .accept 2178 >>接任务：炖陆行鸟
    .goto Darkshore,37.69,40.66,-1
    .target +奥兰达利亚·夜歌
	.skill cooking,<10,1
step
    .goto Darkshore,46.71,34.64
    >>|cRXP_WARN_遇到|cRXP_ENEMY_狂暴蓟熊|r时，先使用|r |T134335:0|t[萨纳瑞恩的希望]|cRXP_WARN_，再把它引入战斗|r
    >>|cRXP_WARN_小心，它们会施放|r|T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命恢复速度降低50%，持续10分钟）|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .use 7586
    .unitscan 狂暴蓟熊
step
    #completewith next
    +|cRXP_WARN_将2–3只|cRXP_ENEMY_恶灵劣魔|r风筝到|cRXP_FRIENDLY_阿斯特利安|r附近（记得施放|r |T135848:0|t[冰霜新星]|cRXP_WARN_），接到任务后击杀它们|r
    .mob 恶灵劣魔
step
    #label Bash1
    .goto Darkshore,44.17,36.29
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 954 >> 交任务：巴莎兰
    .accept 955 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    #completewith BashalF
    +|cRXP_WARN_小心，稀有怪|cRXP_ENEMY_利斯林|r可能已刷新|r
    >>|cRXP_WARN_它会施放|r |T136197:0|t[暗影箭]|cRXP_WARN_（远程读条，造成55–70点暗影伤害）|r
    .unitscan 利斯林
step
#loop
	.line Darkshore,44.57,36.57,44.47,38.11,44.02,38.55,45.01,39.62,45.61,38.81,45.18,37.51,45.86,36.96,46.91,37.11,45.47,36.01,44.57,36.57
	.goto Darkshore,44.57,36.57,35,0
	.goto Darkshore,44.47,38.11,35,0
	.goto Darkshore,44.02,38.55,35,0
	.goto Darkshore,45.01,39.62,35,0
	.goto Darkshore,45.61,38.81,35,0
	.goto Darkshore,45.18,37.51,35,0
	.goto Darkshore,45.86,36.96,35,0
	.goto Darkshore,46.91,37.11,35,0
	.goto Darkshore,45.47,36.01,35,0
	.goto Darkshore,44.57,36.57,35,0
    >>击杀|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_野生劣魔|r，拾取|cRXP_LOOT_劣魔耳环|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_恶灵劣魔|r会施放|r |T136016:0|t[毒药]|cRXP_WARN_（近战瞬发，每3秒造成3点伤害，持续15秒）；|cRXP_ENEMY_野生劣魔|r会施放|r |T136215:0|t[癫狂]|cRXP_WARN_（自身瞬发，生命值低于20%时攻击速度提高20%）|r
    .complete 955,1 --Grell Earring (8)
    .mob 恶灵劣魔
    .mob 野生劣魔
step
    .goto Darkshore,44.17,36.29
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 955 >> 交任务：巴莎兰
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    .goto Darkshore,45.50,36.50,45,0
    .goto Darkshore,45.93,37.78,45,0
    .goto Darkshore,45.94,38.04,45,0
    .goto Darkshore,45.43,39.66,45,0
    .goto Darkshore,46.67,39.09,45,0
    .goto Darkshore,47.36,37.63,45,0
    .goto Darkshore,47.77,37.20,45,0
    .goto Darkshore,47.44,36.76,45,0
    .goto Darkshore,45.50,36.50,45,0
    .goto Darkshore,45.93,37.78,45,0
    .goto Darkshore,45.94,38.04,45,0
    .goto Darkshore,45.43,39.66,45,0
    .goto Darkshore,46.67,39.09,45,0
    .goto Darkshore,47.36,37.63,45,0
    .goto Darkshore,47.77,37.20,45,0
    .goto Darkshore,47.44,36.76
    >>击杀|cRXP_ENEMY_戴瑟雷萨特|r，拾取|cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_小心，它们会施放|r |T132222:0|t[射击]|cRXP_WARN_（远程读条，造成15–25点伤害）|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob 戴瑟雷萨特
step
    #label BashalF
    .goto Darkshore,44.17,36.29
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 956 >> 交任务：巴莎兰
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    .goto Darkshore,38.84,43.41
    .xp 10+6625 >> 返回|cRXP_FRIENDLY_萨纳瑞恩·绿树|r的途中，刷怪至当前等级经验达到6625+/7600
step
    .goto Darkshore,38.84,43.41
    >>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2118 >> 交任务：瘟疫蔓延
    .accept 2138 >> 接任务：清除疫病
    .target 萨纳瑞恩·绿树
step
    .goto Darkshore,36.68,44.05,12,0
    .goto Darkshore,35.74,43.70
    >>与|cRXP_FRIENDLY_塞瑞利恩|r交谈。
    .accept 963 >>接任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #completewith next
    >>击杀|cRXP_ENEMY_小潮行蟹|r，拾取|cRXP_LOOT_蟹腿|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
step
    #sticky
    #label Gwennyth
    .goto Darkshore,36.62,45.59
    >>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈。
    .accept 3524 >>接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
    .goto Darkshore,36.34,45.58
    >>与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈
    .fp Auberdine >> 开通奥伯丁飞行点
    .target 凯莱斯·月羽
step
    #requires Gwennyth
    #completewith Bones
    .goto Darkshore,36.22,44.89,50,0
    .goto Darkshore,35.81,45.78,50,0
    .goto Darkshore,35.86,47.35,50,0
    .goto Darkshore,35.74,48.20,50,0
    .goto Darkshore,36.25,49.90,50,0
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，拾取|cRXP_LOOT_蟹腿|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    #requires Gwennyth
    #completewith next
    >>|cRXP_WARN_保留|r |T133884:0|t[鱼人的眼球]|cRXP_WARN_，它们来自|cRXP_ENEMY_灰雾滩行者|r和|r|cRXP_ENEMY_灰雾袭击者|r
    .collect 730,3,38,1 --Murloc Eyes (3)
    .mob 灰雾滩行者
    .mob 灰雾袭击者
step
    #requires Gwennyth
    #label Bones
    .goto Darkshore,36.38,50.88
    >>拾取|cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_小心，附近的|cRXP_ENEMY_灰雾滩行者|r具有|r |T132307:0|t[移动速度提升]
    >>|cRXP_WARN_该操作需要 5 秒施法时间。|r
    .complete 3524,1 --Sea Creature Bones (1)
step
    .goto Darkshore,36.22,44.89
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，拾取|cRXP_LOOT_蟹腿|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    #requires Gwennyth
    .goto Darkshore,38.90,53.59
    >>跑向熊怪营地
    >>|cRXP_WARN_不要尝试与|r|cRXP_ENEMY_黑木风语者|r战斗
    .complete 984,1 --Find a corrupt furbolg camp (1)
step
    .goto Darkshore,40.30,59.73
    >>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈。
    .accept 953 >>接任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
step
    #completewith Anaya
    +|cRXP_WARN_若稀有怪|cRXP_ENEMY_莫嘉泽尔|r已刷新，避免引到她|r
    .unitscan 莫嘉泽尔
 step
    #completewith Relics
    .goto Darkshore,42.45,60.66,0
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
step
    #completewith Fall
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r，拾取|cRXP_LOOT_上层精灵遗物|r
    >>|cRXP_WARN_只有挡路时才击杀|cRXP_ENEMY_哀嚎的贵族|r。|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
step
    .goto Darkshore,42.37,61.82
    >>点击|cRXP_PICK_上古之火|r
    >>|cRXP_WARN_该操作需要 5 秒施法时间。|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
step
    .goto Darkshore,42.65,63.15
    >>点击地上的|cRXP_PICK_《亚米萨兰的毁灭》|r
    >>|cRXP_WARN_该操作需要 5 秒施法时间。|r
    .complete 953,2 --Read the Fall of Ameth'Aran (1)
step
    .goto Darkshore,43.30,58.70
    >>点击地上的|cRXP_PICK_《亚米萨兰的衰落》|r
    >>|cRXP_WARN_该操作需要 5 秒施法时间。|r
    .complete 953,1 --Read the Lay of Ameth'Aran (1)
step
    #label Fall
    .goto Darkshore,40.30,59.73
    >>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈。
    .turnin 953 >>交任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
step
    #label Relics
    .goto Darkshore,41.76,57.96,50,0
    .goto Darkshore,43.11,57.55,50,0
    .goto Darkshore,43.82,58.29,50,0
    .goto Darkshore,43.58,59.99,50,0
    .goto Darkshore,43.49,62.92,50,0
    .goto Darkshore,42.38,63.40,50,0
    .goto Darkshore,41.21,61.64,50,0
    .goto Darkshore,41.76,57.96
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r
    >>|cRXP_WARN_只有挡路时才击杀|cRXP_ENEMY_哀嚎的贵族|r。|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
step
    #label Anaya
    .goto Darkshore,42.45,60.66
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
step << skip
    #completewith next
    .goto Darkshore,45.25,53.44,30 >>进入洞穴
    >>|cRXP_WARN_沿途尽量避开|cRXP_ENEMY_蓟熊|r、|cRXP_ENEMY_月夜枭兽|r和|cRXP_ENEMY_狂暴的月夜枭兽|r|r
    .isOnQuest 958
step << skip
    .goto Darkshore,45.75,53.08
    .goto Darkshore,41.70,36.51,30 >>|cRXP_WARN_击杀洞穴内的|cRXP_ENEMY_月夜枭兽圣者|r --, then drink Logout Skip by logging out on top of the Mushroom at the back of the cave|r
    >>|cRXP_WARN_小心，它会施放|r |T136006:0|t[愤怒]|cRXP_WARN_（远程读条，造成30–45点自然伤害）、|r |T136096:0|t[月火术]|cRXP_WARN_（远程瞬发，造成20–30点自然伤害，再在12秒内额外造成44点自然伤害），以及|r |T136085:0|t[愈合]|cRXP_WARN_（自身读条，恢复约150点生命值；较少施放，若它施放就逃跑）|r
    >>|cRXP_WARN_可以避开它的|r |T136006:0|t[愤怒]|cRXP_WARN_：躲到洞口内的岩石后方，卡住它的视线|r
    .mob 月夜枭兽圣者
    .isOnQuest 958
step
    .goto Darkshore,44.18,36.29
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 957,3 >>交任务：巴莎兰
    .target 阿斯特利安
step
    #sticky
    #label DalmondBags1
    .goto Darkshore,37.45,40.50,0,0
    >>与|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor >> 出售杂物
    .target 达蒙德
    .isQuestAvailable 3524
step
    .goto Darkshore,37.40,40.13
    >>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈。
    .turnin 958 >>交任务：上层精灵的工具
    .target 桑迪斯·织风
step
    #requires DalmondBags1
    .goto Darkshore,37.69,40.66
    >>与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈。
    .turnin 2178 >>交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5
    .skill cooking,<10,1
step
    .goto Darkshore,39.37,43.49
    >>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >> 交任务：熊怪的威胁
    .accept 985 >> 接任务：熊怪的威胁
    .accept 4761 >> 接任务：桑迪斯·织风
    .target 特伦希斯
step
    .goto Darkshore,36.64,46.26
    >>点击|cRXP_PICK_传声盒827号|r
    .turnin 983 >>交任务：传声盒827号
    .accept 1001 >>接任务：传声盒411号
step
    .goto Darkshore,36.72,45.07,12,0
    .goto Darkshore,36.62,45.59
    >>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈。
    .turnin 3524 >>交任务：搁浅的巨兽
    .accept 4681 >>接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
 step
    .goto Darkshore,36.77,44.28
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_向他购买|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_，最多40条|r
    .collect 4592,40,4681,1 --Longjaw Mud Snapper (40)
    .target 莱尔德
step
    .goto Darkshore,36.68,44.05,12,0
    .goto Darkshore,35.74,43.70
    >>与|cRXP_FRIENDLY_塞瑞利恩|r交谈。
    .turnin 963 >>交任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #completewith Gwen
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r
    >>|cRXP_WARN_不要特意绕路击杀它们。|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
step
    #completewith next
    .goto Darkshore,32.91,42.24,15,0
    .goto Darkshore,32.41,43.82,25 >> 沿码头跑向|cRXP_LOOT_海龟遗骸|r
step
    .goto Darkshore,31.86,46.33
    >>潜入水下
    >>拾取|cRXP_LOOT_海龟遗骸|r
    .complete 4681,1 --Sea Turtle Remains (1)
step
    .goto Darkshore,36.12,44.70,50,0
    .goto Darkshore,35.80,45.88,50,0
    .goto Darkshore,36.04,48.63,50,0
    .goto Darkshore,36.13,50.13,50,0
    .goto Darkshore,36.58,53.20,50,0
    .goto Darkshore,35.23,53.81,50,0
    .goto Darkshore,35.22,55.37,50,0
    .goto Darkshore,36.70,57.09,50,0
    .goto Darkshore,36.12,44.70,50,0
    .goto Darkshore,35.80,45.88,50,0
    .goto Darkshore,36.04,48.63,50,0
    .goto Darkshore,36.13,50.13,50,0
    .goto Darkshore,36.58,53.20,50,0
    .goto Darkshore,35.23,53.81,50,0
    .goto Darkshore,35.22,55.37,50,0
    .goto Darkshore,36.70,57.09
    .xp 11+7825 >> 刷怪至当前等级经验达到7825+/8800
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    #label Gwen
    .goto Darkshore,36.67,45.08,12,0
    .goto Darkshore,36.62,45.59
    >>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈。
    .turnin 4681,1 >> 交任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step << skip
    #completewith next
    +装备新获得的|T132537:0|t[沙浪之靴]。
    .use 15398
    .itemcount 15398,1
    .itemStat 8,LEVEL,<14
step
    .goto Darkshore,37.04,44.13
    >>|cRXP_WARN_===注意===|r
    >>|cRXP_WARN_与|r|cRXP_FRIENDLY_旅店老板莎希因|r交谈
    >>|cRXP_WARN_如果这是你第一次使用炉石批处理技巧，请观看下面的指南视频|r
    >>|cRXP_WARN_打开“设置炉石”对话选项，然后使用|r|T134414:0|t[炉石]
    .hs >> |cRXP_WARN_利用炉石批处理技巧从奥伯丁返回铁炉堡|r
    .link https://www.youtube.com/watch?v=Is-h2TJpL3M >> |cRXP_WARN_点击此处观看视频（强烈建议）。请提前设置并测试批处理窗口大小，以降低失败风险|r
    .target 旅店老板莎希因
    .zoneskip Ironforge
step
    .goto Ironforge,27.17,8.58
    >>与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >> 学习职业技能（火球术等级3、魔法抑制）
    >>总费用：12银币
    >>记得预留购买|T133024:0|t[青铜管]的钱（每根8银币）和飞往塞尔萨玛的费用（1银币10铜币）
    .target 丁克
step << skip
    .goto Ironforge,27.22,8.58,-1
    .goto Ironforge,67.83,42.47,-1
    .vendor 5175 >> 如果愿意，可在|cRXP_FRIENDLY_丁克|r上方的柱子上执行登出跳点，去|cRXP_FRIENDLY_考格斯宾|r处查看是否有 |T133024:0|t[青铜管]可买。
    .itemcount 4371,<1
    .isQuestAvailable 418
step
    #completewith next
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级 2）]|cRXP_WARN_，尽可能多造水，然后乘坐飞行|r
step << Gnome
    .goto Ironforge,55.50,47.74
    >>与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈。
    .accept 6392 >>接任务：向布洛克回复
    .target 格莱斯·瑟登
step
    .goto Ironforge,55.50,47.74
    >>与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈。
    .fly Thelsamar >> 飞往塞尔萨玛
    .target 格莱斯·瑟登
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#classic
#tbc
<< Alliance Mage
#name 12-14 ADV Loch Modan Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor Human Mage/Gnome Mage
#next 14-16 ADV Darkshore 2 Mage AoE
#displayname 12-14 洛克莫丹（法师进阶 AoE）
step
    #completewith next
    +|cRXP_WARN_在洛克莫丹做任务时，拾取到的所有|T133970:0|t[|cRXP_LOOT_大块野猪肉]|r都留着，后面要用|r
step
    .zone Loch Modan >> 前往洛克莫丹
    .isOnQuest 6392 << Gnome
step
    .goto Loch Modan,22.071,73.127
    >>交谈：|cRXP_FRIENDLY_巡山人库伯弗林特|r
    .accept 224 >> 接任务：保卫国王的领土
    .target 巡山人库伯弗林特
step
    #completewith next
    .goto Loch Modan,23.27,75.65,12,0
    .goto Loch Modan,23.62,75.42,12,0
    .goto Loch Modan,23.12,73.93,12 >> 进入地堡，前往顶层
step
    .goto Loch Modan,23.233,73.675
    >>交谈：|cRXP_FRIENDLY_拉格弗斯上尉|r
    .accept 267 >> 接任务：穴居人的威胁
    .target 拉格弗斯上尉
step
    #completewith Rugel2
    >>击杀|cRXP_ENEMY_山猪|r，拾取它们掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取它们掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取它们掉落的|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_山猪|r施放的|r |T132337:0|t[冲锋] |cRXP_WARN_（对自身瞬发：提高移动速度，持续3秒，命中时造成40-100点近战伤害。只能在远处施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .goto Loch Modan,26.67,56.94
    >>击杀|cRXP_ENEMY_碎石穴居人|r和|cRXP_ENEMY_碎石怪斥候|r，拾取它们掉落的|cRXP_LOOT_穴居人的石牙|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_碎石怪斥候|r施放的|r |T132222:0|t[射击] |cRXP_WARN_（远程施法：造成14-20点伤害）|r
    >>|cRXP_WARN_这里的怪物刷新速度很快，通常不必离开此处。|r
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +碎石穴居人
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +碎石怪斥候
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +碎石穴居人
    .mob +碎石怪斥候
step
    .goto Loch Modan,22.071,73.127
    >>交谈：|cRXP_FRIENDLY_巡山人库伯弗林特|r
    .turnin 224 >> 交任务：保卫国王的领土
    .target 巡山人库伯弗林特
step
    #completewith next
    .goto Loch Modan,23.27,75.65,12,0
    .goto Loch Modan,23.62,75.42,12,0
    .goto Loch Modan,23.12,73.93,12 >> 进入地堡，前往顶层
step
    #label Rugel2
    .goto Loch Modan,23.233,73.675
    >>交谈：|cRXP_FRIENDLY_拉格弗斯上尉|r
    .turnin 267 >> 交任务：穴居人的威胁
    .target 拉格弗斯上尉
step << skip
    #completewith next
    .goto Loch Modan,21.49,68.14,20,0
    .goto Loch Modan,20.86,64.46,20,0
    .goto Loch Modan,19.50,62.56,30 >>返回隧道内
step << skip
    .goto Loch Modan,18.84,61.48
    .goto Loch Modan,32.19,46.95,30 >>在隧道内的火盆上跳跃并登出，跳过路程前往塞尔萨玛
    .isOnQuest 1339
step
    #completewith next
    >>击杀|cRXP_ENEMY_山猪|r，拾取它们掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取它们掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取它们掉落的|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_山猪|r施放的|r |T132337:0|t[冲锋] |cRXP_WARN_（对自身瞬发：提高移动速度，持续3秒，命中时造成40-100点近战伤害。只能在远处施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .goto Loch Modan,23.57,17.93,30 >>前往奥加兹岗哨
    .isOnQuest 1339
step
    .goto Loch Modan,24.13,18.20
    >>与|cRXP_FRIENDLY_高索·布鲁姆|r交谈。
    .vendor >>卖掉杂物
    .target 高索·布鲁姆
    .isOnQuest 1339
step
    .goto Loch Modan,24.764,18.397
    >>上楼
    >>交谈：|cRXP_FRIENDLY_巡山人卡尔·雷矛|r
    .turnin 353 >> 交任务：雷矛的包裹 << Human
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务：卡尔·雷矛的订单
    .accept 307 >> 接任务：肮脏的爪子
    .target 巡山人卡尔·雷矛
step
    #completewith Entrance
    >>击杀|cRXP_ENEMY_山猪|r，拾取它们掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取它们掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取它们掉落的|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_山猪|r施放的|r |T132337:0|t[冲锋] |cRXP_WARN_（对自身瞬发：提高移动速度，持续3秒，命中时造成40-100点近战伤害。只能在远处施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    #completewith Exit
    >>击杀|cRXP_ENEMY_坑道鼠|r，拾取它们掉落的|cRXP_LOOT_坑道鼠的耳朵|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠歹徒
    .mob 坑道鼠狗头人
    .mob 坑道鼠斥候
    .mob 坑道鼠征粮官
    .mob 坑道鼠地卜师
    .mob 坑道鼠掘地工
step
    #label Entrance
    .goto Loch Modan,35.47,18.95,40 >>前往矿洞入口
    .isOnQuest 307
step
    #label Gear
    .goto Loch Modan,35.45,19.94,12,0
    .goto Loch Modan,36.42,20.72,12,0
    .goto Loch Modan,35.24,21.98,12,0
    .goto Loch Modan,35.90,22.02,12,0
    .goto Loch Modan,34.88,23.51,12,0
    .goto Loch Modan,36.10,22.97,12,0
    .goto Loch Modan,36.23,24.88,12,0
    .goto Loch Modan,34.93,24.89,12,0
    .goto Loch Modan,35.45,19.94,12,0
    .goto Loch Modan,36.42,20.72,12,0
    .goto Loch Modan,35.24,21.98,12,0
    .goto Loch Modan,35.90,22.02,12,0
    .goto Loch Modan,34.88,23.51,12,0
    .goto Loch Modan,36.10,22.97,12,0
    .goto Loch Modan,36.23,24.88,12,0
    .goto Loch Modan,34.93,24.89
    >>拾取地上的|cRXP_LOOT_矿工装备|r；|cRXP_WARN_它们共享刷新点|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_坑道鼠地卜师|r施放的|r |T135824:0|t[快速烈焰防护结界] |cRXP_WARN_（对自身施法：获得10秒火焰免疫）以及|r |T135824:0|t[火焰冲击] |cRXP_WARN_（远程瞬发：造成20-30点火焰伤害）|r
    .complete 307,1 --Collect Miners' Gear (x4)
--VV Rat Diggers
step
    #label Exit
    .goto Loch Modan,35.47,18.95,40 >>离开矿洞
    .isOnQuest 307
step
#loop
	.line Loch Modan,34.38,17.67,35.44,15.34,37.15,10.53,39.38,10.92,38.46,14.43,39.67,18.12,39.84,24.83,37.34,26.82,37.15,24.53,38.85,21.25,37.89,18.88,34.38,17.67
	.goto Loch Modan,34.38,17.67,40,0
	.goto Loch Modan,35.44,15.34,40,0
	.goto Loch Modan,37.15,10.53,40,0
	.goto Loch Modan,39.38,10.92,40,0
	.goto Loch Modan,38.46,14.43,40,0
	.goto Loch Modan,39.67,18.12,40,0
	.goto Loch Modan,39.84,24.83,40,0
	.goto Loch Modan,37.34,26.82,40,0
	.goto Loch Modan,37.15,24.53,40,0
	.goto Loch Modan,38.85,21.25,40,0
	.goto Loch Modan,37.89,18.88,40,0
	.goto Loch Modan,34.38,17.67,40,0
    >>击杀|cRXP_ENEMY_坑道鼠斥候|r、|cRXP_ENEMY_坑道鼠歹徒|r、|cRXP_ENEMY_坑道鼠狗头人|r和|cRXP_ENEMY_坑道鼠征粮官|r，拾取它们掉落的|cRXP_LOOT_坑道鼠的耳朵|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_坑道鼠狗头人|r施放的|r |T132152:0|t[痛击] |cRXP_WARN_（每10秒获得2次额外攻击）|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠歹徒
    .mob 坑道鼠狗头人
    .mob 坑道鼠斥候
    .mob 坑道鼠征粮官
step
    #completewith next
    >>击杀|cRXP_ENEMY_山猪|r，拾取它们掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取它们掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取它们掉落的|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_山猪|r施放的|r |T132337:0|t[冲锋] |cRXP_WARN_（对自身瞬发：提高移动速度，持续3秒，命中时造成40-100点近战伤害。只能在远处施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .goto Loch Modan,23.57,17.93,30 >>前往奥加兹岗哨
    .isOnQuest 307
step
    .goto Loch Modan,24.13,18.20
    >>与|cRXP_FRIENDLY_高索·布鲁姆|r交谈。
    .vendor >>卖掉杂物
    .target 高索·布鲁姆
    .isOnQuest 307
step
    .goto Loch Modan,24.764,18.397
    >>上楼
    >>交谈：|cRXP_FRIENDLY_巡山人卡尔·雷矛|r
    .turnin 307,2 >> 交任务：肮脏的爪子
    .target 巡山人卡尔·雷矛
step
#loop
	.line Loch Modan,31.01,24.84,32.69,28.67,34.93,31.55,36.78,33.19,39.65,32.82,38.15,38.16,33.53,40.53,29.87,53.51,29.58,46.54,29.95,39.84,27.09,40.10,29.03,33.44,27.19,29.01,25.77,25.60,23.64,22.20,31.01,24.84
	.goto Loch Modan,31.01,24.84,35,0
	.goto Loch Modan,32.69,28.67,35,0
	.goto Loch Modan,34.93,31.55,35,0
	.goto Loch Modan,36.78,33.19,35,0
	.goto Loch Modan,39.65,32.82,35,0
	.goto Loch Modan,38.15,38.16,35,0
	.goto Loch Modan,33.53,40.53,35,0
	.goto Loch Modan,29.87,53.51,35,0
	.goto Loch Modan,29.58,46.54,35,0
	.goto Loch Modan,29.95,39.84,35,0
	.goto Loch Modan,27.09,40.10,35,0
	.goto Loch Modan,29.03,33.44,35,0
	.goto Loch Modan,27.19,29.01,35,0
	.goto Loch Modan,25.77,25.60,35,0
	.goto Loch Modan,23.64,22.20,35,0
	.goto Loch Modan,31.01,24.84,35,0
    >>击杀|cRXP_ENEMY_山猪|r，拾取它们掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取它们掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取它们掉落的|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_山猪|r施放的|r |T132337:0|t[冲锋] |cRXP_WARN_（对自身瞬发：提高移动速度，持续3秒，命中时造成40-100点近战伤害。只能在远处施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    .xp <13+5500,1 << Gnome
step
    #completewith Boast
    >>击杀|cRXP_ENEMY_癞皮山猪|r和|cRXP_ENEMY_山猪|r，拾取它们掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_灰斑黑熊|r和|cRXP_ENEMY_老黑熊|r，拾取它们掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_峭壁潜伏者|r和|cRXP_ENEMY_森林潜伏者|r，拾取它们掉落的|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_山猪|r施放的|r |T132337:0|t[冲锋] |cRXP_WARN_（对自身瞬发：提高移动速度，持续3秒，命中时造成40-100点近战伤害。只能在远处施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +癞皮山猪
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +灰斑黑熊
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +峭壁潜伏者
    .mob +森林潜伏者
    .xp >13+5500,1 << Gnome
step
    .goto Loch Modan,37.18,47.13,10,0
    >>与|cRXP_FRIENDLY_布洛克·寻石者|r和|cRXP_FRIENDLY_吉恩·角盔|r交谈
    >>|cRXP_WARN_他们可能在建筑内，也可能在建筑外|r
    .turnin 6392 >>交任务：向布洛克回复 << Gnome
    .target +布洛克·寻石者
    .goto Loch Modan,37.02,47.80
    .accept 436 >> 接任务：铁环挖掘场
    .goto Loch Modan,37.23,47.37
    .target +吉恩·角盔
    .xp >13+5500,1 << Gnome
step
    .goto Loch Modan,37.23,47.37
    >>交谈：|cRXP_FRIENDLY_吉恩·角盔|r
    >>|cRXP_WARN_他可能在建筑内，也可能在建筑外。|r
    .accept 436 >> 接任务：铁环挖掘场
    .target 吉恩·角盔
    .xp >13+6550,1 << Gnome
    .isQuestTurnedIn 6392
step << Human
#loop
	.line Loch Modan,31.01,24.84,32.69,28.67,34.93,31.55,36.78,33.19,39.65,32.82,38.15,38.16,33.53,40.53,29.87,53.51,29.58,46.54,29.95,39.84,27.09,40.10,29.03,33.44,27.19,29.01,25.77,25.60,23.64,22.20,31.01,24.84
	.goto Loch Modan,31.01,24.84,50,0
	.goto Loch Modan,32.69,28.67,50,0
	.goto Loch Modan,34.93,31.55,50,0
	.goto Loch Modan,36.78,33.19,50,0
	.goto Loch Modan,39.65,32.82,50,0
	.goto Loch Modan,38.15,38.16,50,0
	.goto Loch Modan,33.53,40.53,50,0
	.goto Loch Modan,29.87,53.51,50,0
	.goto Loch Modan,29.58,46.54,50,0
	.goto Loch Modan,29.95,39.84,50,0
	.goto Loch Modan,27.09,40.10,50,0
	.goto Loch Modan,29.03,33.44,50,0
	.goto Loch Modan,27.19,29.01,50,0
	.goto Loch Modan,25.77,25.60,50,0
	.goto Loch Modan,23.64,22.20,50,0
	.goto Loch Modan,31.01,24.84,50,0
    .xp 13+8675 >> 刷怪使经验达到8675+/11400
step << Gnome
#loop
	.line Loch Modan,31.01,24.84,32.69,28.67,34.93,31.55,36.78,33.19,39.65,32.82,38.15,38.16,33.53,40.53,29.87,53.51,29.58,46.54,29.95,39.84,27.09,40.10,29.03,33.44,27.19,29.01,25.77,25.60,23.64,22.20,31.01,24.84
	.goto Loch Modan,31.01,24.84,50,0
	.goto Loch Modan,32.69,28.67,50,0
	.goto Loch Modan,34.93,31.55,50,0
	.goto Loch Modan,36.78,33.19,50,0
	.goto Loch Modan,39.65,32.82,50,0
	.goto Loch Modan,38.15,38.16,50,0
	.goto Loch Modan,33.53,40.53,50,0
	.goto Loch Modan,29.87,53.51,50,0
	.goto Loch Modan,29.58,46.54,50,0
	.goto Loch Modan,29.95,39.84,50,0
	.goto Loch Modan,27.09,40.10,50,0
	.goto Loch Modan,29.03,33.44,50,0
	.goto Loch Modan,27.19,29.01,50,0
	.goto Loch Modan,25.77,25.60,50,0
	.goto Loch Modan,23.64,22.20,50,0
	.goto Loch Modan,31.01,24.84,50,0
    .xp 13+6545 >> 刷怪使经验达到6545+/11400
    .xp <13+5500,1
    .isOnQuest 6392
step << Gnome
    #completewith next
    .goto Loch Modan,46.14,63.53,50,0
    .goto Loch Modan,49.35,67.36,50,0
    .goto Loch Modan,51.91,68.00,50,0
    .goto Loch Modan,64.83,66.05,20 >>前往|cRXP_FRIENDLY_奥德伦|r处。
    .isOnQuest 436
step << Gnome
    #completewith Boast
    .goto Loch Modan,64.83,66.05
    >>交谈：|cRXP_FRIENDLY_奥德伦|r
    .vendor 1214 >> |cRXP_BUY_购买|r |T132491:0|t[智者腰带] |cRXP_BUY_（如果他有货）|r
    .isQuestAvailable 298
    .isOnQuest 436
step << Gnome
    >>与|cRXP_FRIENDLY_勘察员基恩萨·铁环|r和|cRXP_FRIENDLY_麦格玛尔·落斧|r交谈
    .accept 298 >> 接任务：挖掘进度报告
    .target +勘察员基恩萨·铁环
    .goto Loch Modan,65.94,65.62
    .turnin 436 >> 交任务：铁环挖掘场
    .goto Loch Modan,64.89,66.66
    .target +麦格玛尔·落斧
    .isOnQuest 436
step << Gnome
    #label ExcavationP
    .goto Loch Modan,65.94,65.62
    >>交谈：|cRXP_FRIENDLY_勘察员基恩萨·铁环|r
    .accept 298 >> 接任务：挖掘进度报告
    .target 勘察员基恩萨·铁环
    .isQuestTurnedIn 436
step << Gnome
    #completewith next
    .goto Loch Modan,66.07,70.60,30,0
    .goto Loch Modan,73.23,70.89,40,0
    .goto Loch Modan,77.25,68.20,40,0
    .goto Loch Modan,82.11,63.22,15,0
    .goto Loch Modan,83.48,65.62,20 >>前往|cRXP_FRIENDLY_达瑞尔|r处。
    .isOnQuest 298
step << Gnome
    #label Boast
    .goto Loch Modan,83.48,65.62
    >>交谈：|cRXP_FRIENDLY_达瑞尔|r
    .accept 257 >> 接任务：自豪的猎人
    .target 年轻的达瑞尔
    .isOnQuest 298
step << Gnome
#loop
	.line Loch Modan,79.89,65.91,76.70,74.44,74.74,69.21,77.03,60.55,76.09,57.94,77.39,55.98,79.63,59.85,79.89,65.91
	.goto Loch Modan,79.89,65.91,45,0
	.goto Loch Modan,76.70,74.44,45,0
	.goto Loch Modan,74.74,69.21,45,0
	.goto Loch Modan,77.03,60.55,45,0
	.goto Loch Modan,76.09,57.94,45,0
	.goto Loch Modan,77.39,55.98,45,0
	.goto Loch Modan,79.63,59.85,45,0
	.goto Loch Modan,79.89,65.91,45,0
    >>击杀|cRXP_ENEMY_山鹫|r
    .complete 257,1 --Mountain Buzzard (6)
    .mob 山鹫
    .isOnQuest 257
step << Gnome
    #completewith next
    .goto Loch Modan,82.11,63.22,15,0
    .goto Loch Modan,83.48,65.62,20 >>前往|cRXP_FRIENDLY_达瑞尔|r处。
    .isOnQuest 257
step << Gnome
    .goto Loch Modan,83.48,65.62
    >>交谈：|cRXP_FRIENDLY_达瑞尔|r
    .turnin 257,2 >> 交任务：自豪的猎人
    .target 年轻的达瑞尔
    .isQuestComplete 257
step << Gnome
#loop
	.line Loch Modan,31.01,24.84,32.69,28.67,34.93,31.55,36.78,33.19,39.65,32.82,38.15,38.16,33.53,40.53,29.87,53.51,29.58,46.54,29.95,39.84,27.09,40.10,29.03,33.44,27.19,29.01,25.77,25.60,23.64,22.20,31.01,24.84
	.goto Loch Modan,31.01,24.84,50,0
	.goto Loch Modan,32.69,28.67,50,0
	.goto Loch Modan,34.93,31.55,50,0
	.goto Loch Modan,36.78,33.19,50,0
	.goto Loch Modan,39.65,32.82,50,0
	.goto Loch Modan,38.15,38.16,50,0
	.goto Loch Modan,33.53,40.53,50,0
	.goto Loch Modan,29.87,53.51,50,0
	.goto Loch Modan,29.58,46.54,50,0
	.goto Loch Modan,29.95,39.84,50,0
	.goto Loch Modan,27.09,40.10,50,0
	.goto Loch Modan,29.03,33.44,50,0
	.goto Loch Modan,27.19,29.01,50,0
	.goto Loch Modan,25.77,25.60,50,0
	.goto Loch Modan,23.64,22.20,50,0
	.goto Loch Modan,31.01,24.84,50,0
    >>击杀|cRXP_ENEMY_癞皮山猪|r和|cRXP_ENEMY_山猪|r，拾取它们的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_灰斑黑熊|r和|cRXP_ENEMY_老黑熊|r，拾取它们的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_峭壁潜伏者|r和|cRXP_ENEMY_森林潜伏者|r，拾取它们的|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_山猪|r施放的|r |T132337:0|t[冲锋] |cRXP_WARN_（对自身瞬发：提高移动速度，持续3秒，命中时造成40-100点近战伤害。只能在远处施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +癞皮山猪
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +灰斑黑熊
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +峭壁潜伏者
    .mob +森林潜伏者
step << Gnome
#loop
	.line Loch Modan,31.01,24.84,32.69,28.67,34.93,31.55,36.78,33.19,39.65,32.82,38.15,38.16,33.53,40.53,29.87,53.51,29.58,46.54,29.95,39.84,27.09,40.10,29.03,33.44,27.19,29.01,25.77,25.60,23.64,22.20,31.01,24.84
	.goto Loch Modan,31.01,24.84,50,0
	.goto Loch Modan,32.69,28.67,50,0
	.goto Loch Modan,34.93,31.55,50,0
	.goto Loch Modan,36.78,33.19,50,0
	.goto Loch Modan,39.65,32.82,50,0
	.goto Loch Modan,38.15,38.16,50,0
	.goto Loch Modan,33.53,40.53,50,0
	.goto Loch Modan,29.87,53.51,50,0
	.goto Loch Modan,29.58,46.54,50,0
	.goto Loch Modan,29.95,39.84,50,0
	.goto Loch Modan,27.09,40.10,50,0
	.goto Loch Modan,29.03,33.44,50,0
	.goto Loch Modan,27.19,29.01,50,0
	.goto Loch Modan,25.77,25.60,50,0
	.goto Loch Modan,23.64,22.20,50,0
	.goto Loch Modan,31.01,24.84,50,0
    .xp 13+6780 >> 刷怪使经验达到6780+/11400
    .isOnQuest 298
step
    #sticky
    #label Kadrell
    .goto Loch Modan,32.93,49.51,40,0
    .goto Loch Modan,34.49,47.44,40,0
    .goto Loch Modan,37.05,46.11,40,0
    .goto Loch Modan,37.39,45.17,40,0
    .goto Loch Modan,37.12,42.79
    >>交谈：|cRXP_FRIENDLY_巡山人卡德雷尔|r
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r |cRXP_WARN_沿塞尔萨玛主路巡逻|r
    .turnin 416,2 >> 交任务：狗头人的耳朵
    .target 巡山人卡德雷尔
step << Gnome
    .goto Loch Modan,37.18,47.13,10,0
    >>与|cRXP_FRIENDLY_布洛克·寻石者|r和|cRXP_FRIENDLY_吉恩·角盔|r交谈
    >>|cRXP_WARN_他们可能在建筑内，也可能在建筑外|r
    .turnin 6392 >>交任务：向布洛克回复
    .target +布洛克·寻石者
    .goto Loch Modan,37.02,47.80
    .turnin 298 >> 交任务：挖掘进度报告
    .accept 301 >> 接任务：向铁炉堡报告
    .goto Loch Modan,37.23,47.37
    .target +吉恩·角盔
    .isOnQuest 298
step << Gnome
    .goto Loch Modan,37.18,47.13,10,0
    >>与|cRXP_FRIENDLY_布洛克·寻石者|r和|cRXP_FRIENDLY_吉恩·角盔|r交谈
    >>|cRXP_WARN_他们可能在建筑内，也可能在建筑外|r
    .turnin 6392 >>交任务：向布洛克回复
    .target 布洛克·寻石者
    .goto Loch Modan,37.02,47.80
    .accept 301 >> 接任务：向铁炉堡报告
    .goto Loch Modan,37.23,47.37
    .target +吉恩·角盔
    .isQuestTurnedIn 298
step << Gnome
    .goto Loch Modan,37.18,47.13,10,0
    .goto Loch Modan,37.02,47.80
    >>与|cRXP_FRIENDLY_布洛克·寻石者|r交谈。
    >>|cRXP_WARN_他可能在建筑内，也可能在建筑外。|r
    .turnin 6392 >>交任务：向布洛克回复
    .target 布洛克·寻石者
step
    #completewith next
    .goto Loch Modan,35.25,47.74,12,0
    .goto Loch Modan,35.39,48.36,12,0
    >>进入旅店
    .goto Loch Modan,34.828,49.283,10 >>前往|cRXP_FRIENDLY_维德拉·壁炉|r处。
step
    .goto Loch Modan,34.828,49.283
    >>交谈：|cRXP_FRIENDLY_维德拉·壁炉|r
    .accept 418 >> 接任务：塞尔萨玛血肠
    .turnin 418 >> 交任务：塞尔萨玛血肠
    .target 维德拉·壁炉
step
    .goto Loch Modan,34.76,48.62
    >>|cRXP_WARN_不要丢弃任何多余的|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .skill cooking,10 >> 将|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r烹制成|T133974:0|t[烤野猪肉]，直到|T133971:0|t[烹饪]技能达到10
step
    .goto Loch Modan,34.76,48.62
    >>交谈：|cRXP_FRIENDLY_雅尼·铁心|r
    >>|cRXP_BUY_按需求和财力购买|r |T133634:0|t[棕色小包] |cRXP_BUY_，数量自行决定|r
    >>|cRXP_WARN_身上的钱不要低于45银|r
    .vendor >> 卖掉杂物
    .isOnQuest 1338
step
    #completewith next
    #requires Kadrell
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级2）] |cRXP_WARN_，在乘坐航班前尽量多制造一些水|r
step
    #requires Kadrell
    .goto Loch Modan,33.94,50.96
    >>交谈：|cRXP_FRIENDLY_索格拉姆·伯雷森|r
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
    .isOnQuest 1338
--VV WIP. Report to Ironforge needed
step << Gnome
    .goto Ironforge,74.64,11.72
    >>与|cRXP_FRIENDLY_勘察员塔伯斯·雷矛|r交谈
    .turnin 301 >> 交任务：向铁炉堡报告
    .target 勘察员塔伯斯·雷矛
    .isOnQuest 301
step << skip
    #completewith Monty
    .goto Ironforge,74.82,8.69,-1
    .goto Ironforge,56.21,46.86,-1
    .goto Ironforge,76.41,51.22,30 >>登出跳过路程，前往矿道地铁入口外
step
    .goto Ironforge,67.83,42.47
    >>与|cRXP_FRIENDLY_考格斯宾|r交谈。
    .vendor 5175 >>|cRXP_BUY_如果有货，向他购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_备用|r
    .target 考格斯宾
    .itemcount 4371,<1,1
step << Gnome
    #label Monty
    .goto Ironforge,76.41,51.22,30,0
    >>进入矿道地铁
    >>交谈：|cRXP_FRIENDLY_蒙提|r
    .accept 6661 >> 接任务：捕捉矿道老鼠
    .target 蒙提
step << Gnome
    >>在矿道地铁内使用|T133942:0|t[捕鼠者之笛]捕捉|cRXP_FRIENDLY_矿道老鼠|r
    .complete 6661,1 --Rats Captured (x5)
    .target 矿道老鼠
    .use 17117
step
    >>交谈：|cRXP_FRIENDLY_蒙提|r
    >>|cRXP_WARN_等待剧情结束|r << Gnome
    .turnin 6661 >> 交任务：捕捉矿道老鼠 << Gnome
    .timer 13,捕捉矿道老鼠剧情 << Gnome
    .accept 6662 >> 接任务：我的兄弟，尼普希
    .target 蒙提
    .zoneskip Stormwind City
step
    >>|cRXP_WARN_乘坐矿道地铁时，连续施放|r |T132794:0|t[造水术（等级2）]
    >>在矿道地铁另一端与|cRXP_FRIENDLY_尼普希|r交谈
    .turnin 6662 >> 交任务：我的兄弟，尼普希
    .target 尼普希
    .isOnQuest 6662
step
    #label Monty << Human
    .zone Stormwind City >> 进入暴风城
    .isOnQuest 1338
step
    #completewith next
    .goto Stormwind City,59.96,12.21,20,0
    .goto Stormwind City,57.03,11.37,20,0
    .goto Stormwind City,55.25,7.07,15 >>前往|cRXP_FRIENDLY_比利巴布·旋轮|r处。
step
    .goto Stormwind City,55.25,7.07
    >>与|cRXP_FRIENDLY_比利巴布·旋轮|r交谈。
    .vendor 5519 >>|cRXP_BUY_如果有货，向他购买一根|r |T133024:0|t[青铜管] |cRXP_BUY_备用|r
    .target 比利巴布·旋轮
    .itemcount 4371,<1,1
step
    .goto Stormwind City,58.09,16.55
    >>交谈：|cRXP_FRIENDLY_弗伦·长须|r
    .turnin 1338 >> 交任务：卡尔·雷矛的订单
    .target 弗伦·长须
step
    #completewith next
    .goto Stormwind City,53.34,19.29,20,0
    .goto Stormwind City,51.64,21.69,20,0
    .goto Stormwind City,52.23,31.66,20,0
    .goto Stormwind City,49.82,34.42,20,0
    .goto Stormwind City,47.86,31.13,12,0
    .goto Stormwind City,49.18,30.29,12 >>前往|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r处。
step
    .goto Stormwind City,49.18,30.29
    >>进入建筑
    >>交谈：|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r
    .accept 399 >> 接任务：童年的记忆
    .target 巴隆斯·阿历克斯顿
step
    #completewith next
    .goto Stormwind City,47.72,42.71,15,0
    .goto Stormwind City,49.12,46.88,15,0
    .goto Stormwind City,48.55,49.00,15,0
    .goto Stormwind City,50.72,51.88,15,0
    .goto Stormwind City,52.57,55.44,15,0
    .goto Stormwind City,51.68,59.86,8,0
    .goto Stormwind City,51.83,60.41,4,0
    .goto Stormwind City,51.59,60.15,6,0
    .goto Stormwind City,39.17,76.58,12,0
    >>|cRXP_WARN_跳上火把，再从上面落下，进入暴风城地面下方|r
    >>|cRXP_WARN_将阴影质量设为“一般”或“低”后，在蓝色虚空边缘前站到“恐龙德里克”双脚中间较浅色的地面上，然后径直向前走|r
    >>|cRXP_WARN_注意：使用此方法有较小几率死亡。你也可以选择正常步行前往法师塔|r
    .link https://youtu.be/gV8-wgQEomc >> 点击此处查看操作指南
    .goto Stormwind City,38.61,79.39,10 >>前往|cRXP_FRIENDLY_詹妮亚·坎农|r
step
    .goto Stormwind City,38.61,79.39
    >>交谈：|cRXP_FRIENDLY_詹妮亚·坎农|r
    .accept 1861 >> 接任务：明镜湖 << Gnome
    .trainer >> 学习职业技能（火焰冲击等级2、奥术智慧等级2、魔爆术）
    >>总费用：27银
    >>记得预留购买药水（每瓶1–3银）和卷轴（每张50铜至3银）的钱
    .target 詹妮亚·坎农
step
    #completewith next
    .goto Stormwind City,36.73,82.44,10,0
    .goto Stormwind City,37.91,81.92,10,0
    .goto Stormwind City,38.10,80.93,8,0
    .goto Stormwind City,37.49,81.35,6,0
    .goto Stormwind City,38.46,80.61,8,0
    .goto Stormwind City,33.65,81.58,15,0
    .goto Stormwind City,31.12,79.42,15,0
    .goto Stormwind City,32.07,81.50,10,0
    .goto Stormwind City,32.63,80.62,8,0
    >>离开法师塔
    .goto Stormwind City,32.16,79.84,10 >>前往|cRXP_FRIENDLY_查瑞斯|r处。
step
    .goto Stormwind City,32.16,79.84
    >>进入建筑
    >>交谈：|cRXP_FRIENDLY_查瑞斯|r
    .vendor 1307 >> |cRXP_BUY_购买|r |T134851:0|t[次级法力药水] |cRXP_BUY_和|r |T134831:0|t[治疗药水] |cRXP_BUY_（如果她有货）|r
    .money <0.0120
    .target 查瑞斯·伊瑟里安
step
    #completewith next
    .goto Stormwind City,39.32,71.54,20,0
    .goto Stormwind City,41.06,69.44,20,0
    .goto Stormwind City,44.02,69.81,20,0
    .goto Stormwind City,46.32,66.93,20,0
    .goto Stormwind City,42.45,61.76,20,0
    .goto Stormwind City,41.17,63.74,15,0
    .goto Stormwind City,41.57,65.46,10 >>前往|cRXP_FRIENDLY_艾代尔|r处。
    .money <0.0090
step
    .goto Stormwind City,41.57,65.46
    >>进入建筑
    >>交谈：|cRXP_FRIENDLY_艾代尔|r
    .vendor 1316 >> |cRXP_BUY_购买非智力类|r |T134943:0|t[卷轴] |cRXP_BUY_（如果他有货）|r
    .money <0.0090
    .target 艾代尔·吉尔罗
step << skip
    #completewith next
    .goto Stormwind City,53.53,64.63,12,0
    .goto Stormwind City,52.10,61.42,12,0
    .goto Stormwind City,49.36,63.42,12,0
    .goto Stormwind City,51.16,68.35,12,0
    .goto Stormwind City,52.05,67.96,10 >>前往|cRXP_FRIENDLY_罗伯特|r处。
step << skip
    .goto Stormwind City,52.05,67.96
    >>进入建筑
    >>与|cRXP_FRIENDLY_罗伯特|r交谈。
    >>|cRXP_BUY_向他购买|r |T132620:0|t[一桶葡萄酒] |cRXP_BUY_备用|r
    .collect 1941,1,116,1 --Cask of Merlot
    .target 罗伯特·奥布斯
step
    #completewith next
    .goto Stormwind City,52.10,61.34,15,0
    .goto Stormwind City,55.46,65.26,8 >>前往|cRXP_FRIENDLY_凯德雷克·布舍尔|r处。
    .money <0.01
step
    .goto Stormwind City,55.46,65.26
    >>隔墙与|cRXP_FRIENDLY_凯德雷克·布舍尔|r交谈
    .vendor 1257 >> |cRXP_BUY_购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_（如果他有货）|r
    .money <0.01
    .target 凯德雷克·布舍尔
step
    #completewith Bank
    .goto Stormwind City,55.30,68.16,10 >>进入暴风城银行
step
    #label Bank
    .goto Stormwind City,57.03,72.97
    >>交谈：|cRXP_FRIENDLY_牛顿·伯恩赛德|r
    .bankdeposit 769,4371,730,7207,1941,1711,1478,1712,3012,1180,1181,3013,6889 >> 将以下物品存入银行：
    >>|T133970:0|t[大块野猪肉]
    >>|T133024:0|t[青铜管]
    >>|T133884:0|t[鱼人的眼球]
    >>|T132788:0|t[詹妮亚的瓶子]
    >>|T132620:0|t[一桶葡萄酒]
    >>|T134943:0|t[卷轴]
    >>|T132832:0|t[小蛋]
    .target 牛顿·伯恩赛德
--   .itemcount 769,1
--   .itemcount 4371,1
-- .itemcount 730,1
--  .itemcount 7207,1
-- 1711 level 20 scroll
--VV Vendor Crisp Spider Meat for now
step << skip
    .goto Stormwind City,57.03,72.97
    .bankdeposit 769,4371,7207 >> 将以下物品存入银行：
    >>|T133970:0|t[大块野猪肉]
    >>|T133024:0|t[青铜管]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 769,1
    .itemcount 4371,1
    .itemcount 7207,1
step << skip
    .goto Stormwind City,57.03,72.97
    .bankdeposit 769,730,7207 >> 将以下物品存入银行：
    >>|T133970:0|t[大块野猪肉]
    >>|T133884:0|t[鱼人的眼球]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 769,1
    .itemcount 730,1
    .itemcount 7207,1
step << skip
    .goto Stormwind City,57.03,72.97
    .bankdeposit 4371,730,7207 >> 将以下物品存入银行：
    >>|T133024:0|t[青铜管]
    >>|T133884:0|t[鱼人的眼球]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 4371,1
    .itemcount 730,1
    .itemcount 7207,1
step << skip
    .goto Stormwind City,57.03,72.97
    .bankdeposit 769,7207 >> 将以下物品存入银行：
    >>|T133970:0|t[大块野猪肉]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 769,1
    .itemcount 7207,1
step << skip
    .goto Stormwind City,57.03,72.97
    .bankdeposit 4371,7207 >> 将以下物品存入银行：
    >>|T133024:0|t[青铜管]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 4371,1
    .itemcount 7207,1
step << skip
    .goto Stormwind City,57.03,72.97
    .bankdeposit 730,7207 >> 将以下物品存入银行：
    >>|T133884:0|t[鱼人的眼球]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 730,1
    .itemcount 7207,1
step << skip
    .goto Stormwind City,57.03,72.97
    .bankdeposit 7207 >> 将以下物品存入银行：
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 7207,1
step
    #completewith next
    .goto Stormwind City,53.45,64.92,10,0
    >>进入旅店
    .goto Stormwind City,52.61,65.72,10 >>前往|cRXP_FRIENDLY_旅店老板奥里森|r处。
    .target 旅店老板奥里森
step
    .goto Stormwind City,52.61,65.72
    >>|cRXP_WARN_===注意===|r
    >>|cRXP_WARN_交谈：|r |cRXP_FRIENDLY_奥里森|r
    >>|cRXP_WARN_打开“设置炉石”菜单，然后使用|r |T134414:0|t[炉石]
    .hs >> |cRXP_WARN_利用炉石批处理技巧，从暴风城炉石返回奥伯丁|r
    .target 旅店老板奥里森
    .zoneskip Darkshore
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#classic
#tbc
<< Alliance Mage
#name 14-16 ADV Darkshore 2 Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor Human Mage/Gnome Mage
#next 16-18 ADV Westfall Mage AoE
#displayname 14-16 黑海岸 2（法师进阶 AoE）
step
    #completewith DeepO
    +|cRXP_WARN_保留捡到的 |T132917:0|t[轻羽毛]，留作后用。|r
step
    .goto Darkshore,36.77,44.28
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_从他那里最多购买 20 条|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_。|r
    .collect 4592,20,982,1 --Longjaw Mud Snapper (20)
    .target 莱尔德
    .isQuestAvailable 982
step
    >>与|cRXP_FRIENDLY_巴瑞萨斯·月影|r和|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈。
    .accept 947 >>接受任务 洞中的蘑菇
    .target +巴瑞萨斯·月影
    .goto Darkshore,37.32,43.64
    .accept 4811 >>接受任务 红色水晶
    .goto Darkshore,37.68,43.38
    .target +哨兵戈琳达·纳希恩
step
    #label DeepO
    .goto Darkshore,38.11,41.16
    >>交谈：|cRXP_FRIENDLY_高尔博德·钢手|r
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手
step
    .goto Darkshore,37.39,40.13
    >>交谈：|cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .target 桑迪斯·织风
step
    #completewith MistV
    .goto Darkshore,35.87,38.18,50,0
    .goto Darkshore,36.28,32.23,50,0
    .goto Darkshore,37.61,30.86,50,0
    >>在水中击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，拾取掉落的|cRXP_LOOT_蛇颈龙的眼球|r。
   .complete 1001,1 --Thresher Eye (3)
   .mob 黑海岸蛇颈龙
step
   .goto Darkshore,38.21,28.76
--  .goto Darkshore,38.23,28.79
    >>隔着船体拾取|cRXP_LOOT_银色清晨号的保险箱|r。
    >>|cRXP_WARN_在箭头所在位置附近潜入水下，按下“与目标互动”快捷键。|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
   .complete 982,1 --Silver Dawning's Lockbox (1)
step
   #label MistV
   .goto Darkshore,39.58,27.47
--  .goto Darkshore,39.63,27.45
   >>隔着船体拾取|cRXP_LOOT_迷雾之纱号的保险箱|r。
   >>|cRXP_WARN_在箭头所在位置附近潜入水下，按下“与目标互动”快捷键。|r
   >>|cRXP_WARN_此操作需读条 5 秒|r
   .complete 982,2 --Mist Veil's Lockbox (1)
step
   .goto Darkshore,40.44,28.63,50,0
   .goto Darkshore,35.87,38.18,50,0
   .goto Darkshore,36.28,32.23,50,0
   .goto Darkshore,37.61,30.86,50,0
   .goto Darkshore,40.44,28.63,50,0
   .goto Darkshore,35.87,38.18,50,0
   .goto Darkshore,36.28,32.23,50,0
   .goto Darkshore,37.61,30.86
   >>在水中击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，拾取掉落的|cRXP_LOOT_蛇颈龙的眼球|r。
   .complete 1001,1 --Thresher Eye (3)
   .mob 黑海岸蛇颈龙
step
   #completewith next
   +|cRXP_WARN_保留|r |T133884:0|t[鱼人的眼球]，|cRXP_WARN_它们来自|r|cRXP_ENEMY_灰雾滩行者|r|cRXP_WARN_和|r|cRXP_ENEMY_灰雾先知|r
step
   .goto Darkshore,41.91,31.48
   >>拾取地上的|cRXP_LOOT_搁浅的海洋生物|r
   >>|cRXP_WARN_此操作需要 5 秒读条|r
   .accept 4723 >> 接任务：搁浅的海洋生物
step
   .goto Darkshore,41.96,28.61
   >>点击|cRXP_PICK_传声盒411号|r
   .turnin 1001 >> 交任务：传声盒411号
   .accept 1002 >> 接任务：传声盒323号
step
    #completewith SeaTurtle1
    .goto Darkshore,43.67,27.81,50,0
    >>使用范围攻击击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取它们的|cRXP_LOOT_陆行鸟肉|r。
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
step
    #completewith SeaTurtle1
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
step
    #completewith next
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r。
    >>|cRXP_WARN_小心：它们会施放|r |T135914:0|t|cRXP_WARN_[狂犬病]（瞬发近战技能：使所有生命恢复速度降低 50%，持续 10 分钟）。|r
    .complete 2138,1 --Rabid Thistle Bear (20)
    .mob 狂暴蓟熊
step
    #label SeaTurtle1
    .goto Darkshore,44.20,20.60,80 >>前往 |cRXP_LOOT_搁浅的海龟|r
    .isQuestAvailable 4725
step
    #completewith next
    +保留|T133884:0|t[鱼人的眼球]，它们来自|cRXP_ENEMY_灰雾战士|r和|cRXP_ENEMY_灰雾撒网者|r
step
    .goto Darkshore,44.20,20.60
    >>拾取地上的|cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_此操作需要 5 秒读条|r
    .accept 4725 >> 接任务：搁浅的海龟
step
    #completewith River
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
step
    #completewith River
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
step
    #completewith RedC
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r。
    >>|cRXP_WARN_小心：它们会施放|r |T135914:0|t|cRXP_WARN_[狂犬病]（瞬发近战技能：使所有生命恢复速度降低 50%，持续 10 分钟）。|r
    .complete 2138,1 --Rabid Thistle Bear (20)
    .mob 狂暴蓟熊
step
    #label River
    .goto Darkshore,50.77,25.43
    >>在水中使用 |T134865:0|t[空的水样试管]取样。
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350
step
    #completewith RedC
    >>击杀|cRXP_ENEMY_森林陆行鸟|r，拾取掉落的|cRXP_LOOT_陆行鸟肉|r。
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟
step
    #completewith RedC
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
step
    #label RedC
    .goto Darkshore,47.11,48.63,400 >>前往|cRXP_PICK_红色水晶|r
    .isOnQuest 4811
step
    #completewith Bash
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
step
    #completewith Bash
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
step
    .goto Darkshore,47.11,48.63
    >>跑到|cRXP_PICK_红色水晶|r
    >>|cRXP_WARN_记得拉那些会一起进入战斗的|cRXP_ENEMY_狂暴的月夜枭兽|r|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range (1)
step
    #label Bash
    .goto Darkshore,42.37,61.82,175 >>前往|cRXP_PICK_上古之火|r
    .isOnQuest 957
step
    #completewith next
    .goto Darkshore,42.45,60.66,0
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
step
    .goto Darkshore,42.37,61.82
    >>点击|cRXP_PICK_上古之火|r
    >>|cRXP_WARN_该操作需要 5 秒施法时间。|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
step
    .goto Darkshore,42.45,60.66,50,0
    .goto Darkshore,43.25,62.41,50,0
    .goto Darkshore,42.53,59.00,50,0
    .goto Darkshore,42.45,60.66,50,0
    .goto Darkshore,43.25,62.41,50,0
    .goto Darkshore,42.53,59.00,50,0
    .goto Darkshore,42.45,60.66,50,0
    .goto Darkshore,43.25,62.41
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
step
    #completewith RBears
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
step
    #completewith RBears
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
step
    #completewith next
    +保留|T133884:0|t[鱼人的眼球]，它们来自|cRXP_ENEMY_灰雾滩行者|r和|cRXP_ENEMY_灰雾先知|r
step
    #label BeachedST
    .goto Darkshore,37.10,62.17
    >>点击|cRXP_PICK_搁浅的海龟|r
    >>|cRXP_WARN_此操作需要 5 秒读条|r
    .accept 4722 >> 接任务：搁浅的海龟
step
#loop
	.line Darkshore,38.74,58.10,39.91,58.50,39.23,63.60,39.87,66.31,39.98,70.55,37.40,70.05,38.63,67.72,38.50,63.73,38.74,58.10
	.goto Darkshore,38.74,58.10,45,0
	.goto Darkshore,39.91,58.50,45,0
	.goto Darkshore,39.23,63.60,45,0
	.goto Darkshore,39.87,66.31,45,0
	.goto Darkshore,39.98,70.55,45,0
	.goto Darkshore,37.40,70.05,45,0
	.goto Darkshore,38.63,67.72,45,0
	.goto Darkshore,38.50,63.73,45,0
	.goto Darkshore,38.74,58.10,45,0
    >>击杀|cRXP_ENEMY_狂暴蓟熊|r。
    >>|cRXP_WARN_小心：它们会施放|r |T135914:0|t|cRXP_WARN_[狂犬病]（瞬发近战技能：使所有生命恢复速度降低 50%，持续 10 分钟）。|r
    .complete 2138,1 --Rabid Thistle Bear (20)
    .mob 狂暴蓟熊
step
    #label RBears
#loop
	.line Darkshore,39.26,56.72,40.21,56.23,39.96,55.22,39.90,54.38,40.24,53.47,39.21,53.01,39.90,54.38
	.goto Darkshore,39.26,56.72,50,0
	.goto Darkshore,40.21,56.23,50,0
	.goto Darkshore,39.96,55.22,50,0
	.goto Darkshore,39.90,54.38,50,0
	.goto Darkshore,40.24,53.47,50,0
	.goto Darkshore,39.21,53.01,50,0
	.goto Darkshore,39.90,54.38,50,0
    >>击杀|cRXP_ENEMY_黑木探路者|r和|cRXP_ENEMY_黑木风语者|r
    >>|cRXP_WARN_小心：|cRXP_ENEMY_黑木探路者|r会施放|r |T132152:0|t[痛击]|cRXP_WARN_（每 10 秒获得 2 次额外攻击机会），而|cRXP_ENEMY_黑木风语者|r会施放|r |T136022:0|t[阵风]|cRXP_WARN_（近战范围群体击晕）。|r
    .complete 985,1 --Blackwood Pathfinder (8)
    .mob +黑木探路者
    .complete 985,2 --Blackwood Windtalker (5)
    .mob +黑木风语者
step
    #completewith Auberdine
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r，拾取掉落的|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
step
#loop
	.line Darkshore,38.63,51.25,38.33,50.00,38.18,48.42,38.73,47.62,39.49,47.65,41.40,47.13,41.67,49.47,41.45,50.84,38.63,51.25
	.goto Darkshore,38.63,51.25,50,0
	.goto Darkshore,38.33,50.00,50,0
	.goto Darkshore,38.18,48.42,50,0
	.goto Darkshore,38.73,47.62,50,0
	.goto Darkshore,39.49,47.65,50,0
	.goto Darkshore,41.40,47.13,50,0
	.goto Darkshore,41.67,49.47,50,0
	.goto Darkshore,41.45,50.84,50,0
	.goto Darkshore,38.63,51.25,50,0
    >>击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取|cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
step
    #label Auberdine
    .goto Darkshore,36.62,45.59,150 >>前往 |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .isOnQuest 982
step
    .goto Darkshore,36.72,45.07,12,0
    .goto Darkshore,36.62,45.59
    >>交谈：|cRXP_FRIENDLY_温尼斯·布莱葛|r
    .turnin 4722 >> 交任务：搁浅的海龟
    .turnin 4723 >> 交任务：搁浅的海洋生物
    .turnin 4725 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛
--Fruit of the Sea at 18
step
    .goto Darkshore,36.77,44.28
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_从他那里最多购买 20 条|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_。|r
    .vendor >> 卖掉杂物
    .collect 4592,20,4763,1 --Longjaw Mud Snapper (40)
    .target 莱尔德
    .isOnQuest 982
step
    .goto Darkshore,36.68,44.05,12,0
    .goto Darkshore,35.74,43.70
    >>与|cRXP_FRIENDLY_塞瑞利恩·白爪|r交谈。
    .turnin 963 >>交任务 永志不渝
    .target 塞瑞利恩·白爪
step
    #completewith CliffRi
    +装备 |T134797:0|t[悲伤之泪]
    .use 5611
    .itemcount 5611,1
    .itemStat 17,LEVEL,<16
step
    .goto Darkshore,37.12,43.62
    >>与|cRXP_FRIENDLY_奥林迪雅|r交谈
    >>|cRXP_BUY_向她购买 15 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,15,4763,1 --Melon Juice (15)
    .target 奥林迪雅
    .money <0.1500
step
    .goto Darkshore,37.12,43.62
    >>与|cRXP_FRIENDLY_奥林迪雅|r交谈
    >>|cRXP_BUY_向她购买 10 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,10,4763,1 --Melon Juice (10)
    .target 奥林迪雅
    .money <0.1000
step
    .goto Darkshore,37.12,43.62
    >>与|cRXP_FRIENDLY_奥林迪雅|r交谈
    >>|cRXP_BUY_向她购买 5 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,5,4763,1 --Melon Juice (5)
    .target 奥林迪雅
    .money <0.0500
step
    #completewith next
    .goto Darkshore,37.45,43.10,20,0
    .goto Darkshore,37.47,42.40,20,0
    .goto Darkshore,37.44,41.84,15 >>前往 |cRXP_FRIENDLY_霍莉|r
step
    .goto Darkshore,37.44,41.84
    >>与|cRXP_FRIENDLY_霍莉|r交谈
    .accept 729 >>接受任务 健忘的勘察员
    .target 考古学家霍莉
step
    .goto Darkshore,37.45,40.50
    >>交谈：|cRXP_FRIENDLY_达蒙德|r
    .vendor 4182 >> |cRXP_BUY_按需求和财力购买|r |T133634:0|t[棕色小包] |cRXP_BUY_，数量自行决定|r
    .target 达蒙德
    .money <0.0500
    .money >0.2500
step
    .goto Darkshore,37.45,40.50
    >>交谈：|cRXP_FRIENDLY_达蒙德|r
    .vendor 4182 >> |cRXP_BUY_向他购买一个|r |T133634:0|t[棕色小皮包] |cRXP_BUY_。|r
    .target 达蒙德
    .money <0.2500
step
    #label CliffRi
    .goto Darkshore,37.39,40.13
    >>交谈：|cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4762 >> 交任务：壁泉河
    .accept 4763 >> 接任务：黑木熊怪的堕落
    .target 桑迪斯·织风
step
    .goto Darkshore,37.69,40.66
    >>与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈。
    .accept 2178 >>接受任务 炖陆行鸟
    .turnin 2178 >>交任务 炖陆行鸟
    .target 奥兰达利亚·夜歌
step
    #label DeepO
    .goto Darkshore,38.11,41.16
    >>交谈：|cRXP_FRIENDLY_高尔博德·钢手|r
    .turnin 982,2 >> 交任务：深不可测的海洋
    .target 高尔博德·钢手
step
    #completewith next
    .goto Darkshore,37.64,42.46,15,0
    .goto Darkshore,37.61,43.21,15,0
    .goto Darkshore,37.68,43.38,20 >>前往戈琳达·纳希恩
step
    .goto Darkshore,37.68,43.38
    >>与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >>交任务 红色水晶
    .accept 4812 >>接受任务 清洗水晶
    .target 哨兵戈琳达·纳希恩
step
    .goto Darkshore,37.81,43.89
    >>在月亮井旁使用 |T133748:0|t[空的净化碗]和 |T134865:0|t[空水瓶]。
    .collect 12347,1,4763,1 --Filled Cleansing Bowl (1)
    .collect 14339,1,4812,1 --Moonwell Water Tube (1)
    .use 12346
    .use 14338
step
    >>依次与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r、|cRXP_FRIENDLY_特伦希斯|r交谈，再上楼找|cRXP_FRIENDLY_艾莉萨|r。
    .turnin 2138 >>交任务：清除疫病
    .accept 2139 >>接任务：萨纳瑞恩的希望
    .target +萨纳瑞恩·绿树
    .goto Darkshore,38.84,43.42
    .turnin 985 >> 交任务：熊怪的威胁
    .accept 986 >> 接任务：丢失的主人
    .target +特伦希斯
    .goto Darkshore,39.37,43.49
    .accept 965 >>接任务：奥萨拉克斯之塔
    .goto Darkshore,39.27,43.13,8,0
    .goto Darkshore,39.04,43.55
    .target +哨兵艾莉萨·星风
step << Gnome
    #completewith next
    +装备 |T132491:0|t[智者腰带]
    .use 4786
    .itemcount 4786,1
    .itemStat 6,LEVEL,<20
step
    .goto Darkshore,47.32,48.70
    >>点击|cRXP_PICK_红色水晶|r
    >>|cRXP_WARN_此操作需要 5 秒读条|r
    >>|cRXP_WARN_记得拉那些会一起进入战斗的 |cRXP_ENEMY_狂暴的月夜枭兽|r|r
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨
step
    #completewith GrainSample
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
step
    .goto Darkshore,44.18,36.29
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 957,3 >>交任务 巴莎兰
    .target 阿斯特利安
step
    #label GrainSample
    .goto Darkshore,50.66,34.98
    >>打开|cRXP_PICK_黑木谷物|r，拾取|cRXP_LOOT_黑木谷物|r。
    >>|cRXP_WARN_将守着它的怪物引入战斗，施放|r |T135848:0|t[冰霜新星]|cRXP_WARN_，拾取|cRXP_LOOT_黑木谷物|r，再朝|cRXP_ENEMY_雌蓟熊|r方向逃离新刷出的怪物。|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .collect 12342,1,4763,1 --Blackwood Grain Sample (1)
step
    #completewith next
    >>击杀|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎
step
    #completewith DenM
    .goto Darkshore,52.33,35.94,20,0
    .goto Darkshore,52.39,36.85,20,0
    .goto Darkshore,51.58,37.52,30 >>前往|cRXP_ENEMY_雌蓟熊|r附近。
step
    .goto Darkshore,51.51,38.22
    >>击杀|cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_雌蓟熊|r和她的|cRXP_ENEMY_蓟熊幼崽|r会施放|r |T132141:0|t[毁灭]|cRXP_WARN_（使你昏迷 2 秒）。|r
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊
    .itemcount 4358,<1
step
    #label DenM
    .goto Darkshore,51.51,38.22
    >>击杀|cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_雌蓟熊|r和她的|cRXP_ENEMY_蓟熊幼崽|r会施放|r |T132141:0|t[毁灭]|cRXP_WARN_（使你昏迷 2 秒）。|r
    >>|cRXP_WARN_单独拉出|cRXP_ENEMY_雌蓟熊|r，使用|r |T133714:0|t[劣质炸药]
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊
    .itemcount 4358,1
step
    #completewith Talisman
    >>击杀|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎
step
    .goto Darkshore,51.80,33.51
    >>打开|cRXP_PICK_黑木坚果|r，拾取|cRXP_LOOT_黑木坚果|r :3
    >>|cRXP_WARN_将守着它的怪物引入战斗，施放|r |T135848:0|t[冰霜新星]|cRXP_WARN_，拾取|cRXP_LOOT_黑木坚果|r，然后向北跑。|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .collect 12343,1,4763,1 --Blackwood Nut Sample (1)
step
    .goto Darkshore,52.85,33.42
    >>打开|cRXP_PICK_黑木水果|r，从中拾取|cRXP_LOOT_黑木水果|r
    >>击杀主动攻击你的|cRXP_ENEMY_黑木战士|r。
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .collect 12341,1,4763,1 --Blackwood Fruit Sample (1)
step
    #completewith next
    .goto Darkshore,52.51,33.11
    .cast 16072 >>在篝火旁使用 |T134712:0|t[装满水的净化碗]，召唤|cRXP_ENEMY_萨巴克希斯|r。
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .timer 20,黑木熊怪的堕落剧情
    .use 12347
step
    #label Talisman
    .goto Darkshore,52.24,33.08
    >>|cRXP_WARN_等待剧情演出结束|r
    >>击杀|cRXP_ENEMY_萨巴克希斯|r
    >>拾取掉在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，从中获得|cRXP_LOOT_堕落护符|r。
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 4763,1 --Talisman of Corruption (1)
    .mob 萨巴克希斯
step
    .goto Darkshore,51.29,24.53
    >>点击|cRXP_PICK_传声盒323号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
    .isQuestComplete 1002
step
    .goto Darkshore,51.29,24.53
    >>点击|cRXP_PICK_传声盒323号|r
    .accept 1003 >> 接任务：传声盒525号
    .isQuestTurnedIn 1002
step
    #completewith next
    .goto Darkshore,53.74,31.52,60,0
    .goto Darkshore,54.52,29.55,60,0
    .goto Darkshore,53.13,28.25,60,0
    .goto Darkshore,52.54,25.47,60,0
    .goto Darkshore,55.21,22.89,60,0
    .goto Darkshore,54.65,21.03,60,0
    >>击杀|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎
step
    .goto Darkshore,53.11,18.10
    >>拾取|cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .accept 4727 >>接受任务 搁浅的海龟
step
    .goto Darkshore,53.74,31.52,60,0
    .goto Darkshore,54.52,29.55,60,0
    .goto Darkshore,53.13,28.25,60,0
    .goto Darkshore,52.54,25.47,60,0
    .goto Darkshore,55.21,22.89,60,0
    .goto Darkshore,54.65,21.03,60,0
    .goto Darkshore,53.74,31.52,60,0
    .goto Darkshore,54.52,29.55,60,0
    .goto Darkshore,53.13,28.25,60,0
    .goto Darkshore,52.54,25.47,60,0
    .goto Darkshore,55.21,22.89,60,0
    .goto Darkshore,54.65,21.03
    >>击杀|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎
step
    .goto Darkshore,51.29,24.53
    >>点击|cRXP_PICK_传声盒323号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
step
    .goto Darkshore,54.97,24.89
    >>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈。
    .turnin 965 >>交任务 奥萨拉克斯之塔
    .accept 966 >>接受任务 奥萨拉克斯之塔
    .target 巴苏尔·影击
step
    .goto Darkshore,55.36,26.49,50,0
    .goto Darkshore,56.36,27.01,50,0
    .goto Darkshore,58.27,25.30,50,0
    .goto Darkshore,55.36,26.49,50,0
    .goto Darkshore,56.36,27.01
    >>击杀|cRXP_ENEMY_暗滩狂热者|r，拾取|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者
step
    .goto Darkshore,54.97,24.89
    >>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈。
    .turnin 966 >>交任务 奥萨拉克斯之塔
    .accept 967 >>接受任务 奥萨拉克斯之塔
    .target 巴苏尔·影击
step
    #label CapCave
    #completewith CapCave1
    .goto Darkshore,55.00,33.42,30 >>进入洞穴
step << skip
    #requires CapCave
    #completewith CapCave1
    +|cRXP_WARN_记住洞穴中的登出跳点，马上要用。|r
step
    #completewith next
    .goto Darkshore,55.04,33.34,8,0
    .goto Darkshore,55.28,34.00,8,0
    .goto Darkshore,55.09,34.67,8,0
    .goto Darkshore,55.30,35.58,8,0
    >>拾取地上的蓝色|cRXP_LOOT_粗柄蘑菇|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 947,1,4 --Scaber Stalk (5)
step
    .goto Darkshore,55.45,36.23,12,0
    .goto Darkshore,55.70,36.30,12,0
    .goto Darkshore,55.89,35.40,12,0
    >>待在洞穴的上层。如果上层没有|cRXP_LOOT_毒帽蘑菇|r，再跳下去
    >>在洞穴上层路线尽头拾取地上的橙色|cRXP_LOOT_毒帽蘑菇|r。
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 947,2 --Death Cap (1)
step
    #label CapCave1
    .goto Darkshore,55.04,33.34,8,0
    .goto Darkshore,55.28,34.00,8,0
    .goto Darkshore,55.09,34.67,8,0
    .goto Darkshore,55.30,35.58
    >>拾取|cRXP_LOOT_毒帽蘑菇|r后，在洞口拾取第一株|cRXP_LOOT_粗柄蘑菇|r。
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 947,1 --Scaber Stalk (5)
step << skip
    .goto Darkshore,54.96,34.52
    .goto Darkshore,41.70,36.51,30 >> |cRXP_WARN_在洞穴内执行登出跳点。|r
    .isOnQuest 4763
step
    #completewith next
    .subzone 442 >> 前往奥伯丁
    .isOnQuest 4763
step
    .goto Darkshore,37.39,40.13
    >>交谈：|cRXP_FRIENDLY_桑迪斯·织风|r
    .turnin 4763,1 >> 交任务：黑木熊怪的堕落
    .target 桑迪斯·织风
step
    .goto Darkshore,37.45,40.50
    >>交谈：|cRXP_FRIENDLY_达蒙德|r
    .vendor 4182 >> |cRXP_BUY_向他购买一个|r |T133634:0|t[棕色小皮包] |cRXP_BUY_。|r
    >>|cRXP_WARN_身上的钱不要低于30银|r
    .target 达蒙德
step
    .goto Darkshore,38.84,43.42
    >>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139,1 >>交任务 萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
step
    >>与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r、|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈，并点击|cRXP_PICK_通缉告示|r
    .turnin 4813,2 >>交任务：水晶中的碎骨
    .target +哨兵戈琳达·纳希恩
    .goto Darkshore,37.68,43.38
    .turnin 947 >>交任务：洞中的蘑菇
    .accept 948 >>接任务：安努
    .target +巴瑞萨斯·月影
    .goto Darkshore,37.32,43.64
    .accept 4740 >> 接任务：通缉：莫克迪普！
    .goto Darkshore,37.22,44.22
step
    .goto Darkshore,36.77,44.28
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_从他那里最多购买 40 条|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_。|r
    .collect 4592,40,729,1 --Longjaw Mud Snapper (40)
    .target 莱尔德
step
    .goto Darkshore,36.62,45.59
    >>交谈：|cRXP_FRIENDLY_温尼斯·布莱葛|r
    .turnin 4727 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛
step
    .goto Darkshore,37.04,44.13
    >>|cRXP_WARN_===注意===|r
    >>|cRXP_WARN_交谈：|r |cRXP_FRIENDLY_莎希因|r
    >>|cRXP_WARN_打开“设置炉石”菜单，然后使用|r |T134414:0|t[炉石]
    .hs >> |cRXP_WARN_利用炉石批处理技巧，从奥伯丁炉石返回暴风城|r
    .target 旅店老板莎希因
    .zoneskip Stormwind City
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#classic
#tbc
<< Alliance Mage
#name 16-18 ADV Westfall Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor Human Mage/Gnome Mage
#next 18-20 ADV Darkshore 3 Mage AoE
#displayname 16-18 西部荒野（法师进阶 AoE）
step
    #completewith JenneaT
    +|cRXP_WARN_注意：后续布料捐献任务需要每种布料各 12 组（|r|T132911:0|t[毛料]|cRXP_WARN_、|r |T132905:0|t[丝绸]|cRXP_WARN_、|r |T132892:0|t[魔纹布]|cRXP_WARN_和|r |T132903:0|t[符文布]|cRXP_WARN_）。升级过程中会自然获得这些布料。|r
step << skip
    #completewith next
    .goto Stormwind City,53.53,64.63,12,0
    .goto Stormwind City,52.10,61.42,12,0
    .goto Stormwind City,49.36,63.42,12,0
    .goto Stormwind City,51.16,68.35,12,0
    .goto Stormwind City,52.05,67.96,10 >>前往|cRXP_FRIENDLY_罗伯特|r处。
step << skip
    .goto Stormwind City,52.05,67.96
    >>进入建筑
    >>与|cRXP_FRIENDLY_罗伯特|r交谈。
    >>|cRXP_BUY_向他购买|r |T132620:0|t[一桶葡萄酒]|cRXP_BUY_。|r
    .collect 1941,1,116,1 --Cask of Merlot
    .target 罗伯特·奥布斯
step
    #sticky
    #label Bank2
    >>与|cRXP_FRIENDLY_牛顿|r 交谈
    .bankdeposit 17056,5354,2592,6889 >> 将以下物品存入银行：
    >>|T132917:0|t[轻羽毛]
    >>|T133469:0|t[写给德尔格伦的信]
    >>|T132911:0|t[毛料]
    >>|T132832:0|t[小蛋]
    .target 牛顿·伯恩赛德
step
    .goto Stormwind City,57.03,72.97
    >>与|cRXP_FRIENDLY_牛顿|r 交谈
    .bankwithdraw 730,7207 >> 从银行取出以下物品： << Gnome
    .bankwithdraw 730,16115 >> 从银行取出以下物品： << Human
    >>|T133884:0|t[鱼人的眼球]
    >>|T132788:0|t[詹妮亚的瓶子] << Gnome
    >>|T132763:0|t[奥斯瑞克的箱子] << Human
    .target 牛顿·伯恩赛德
step
    #requires Bank2
    #completewith next
    .goto Stormwind City,51.68,59.86,8,0
    .goto Stormwind City,51.83,60.41,4,0
    .goto Stormwind City,51.59,60.15,6,0
    .goto Stormwind City,39.17,76.58,12,0
    >>|cRXP_WARN_跳上火把，然后落下进入暴风城下方|r
    >>|cRXP_WARN_在阴影设置为"一般"或"低"时，站在德里克恐龙双脚中间（地上较亮的部分），就在蓝色虚空前方，然后径直向前走|r
    >>|cRXP_WARN_注意：使用此方法有较小概率死亡。若你愿意，也可以正常步行前往法师塔|r
    .link https://youtu.be/gV8-wgQEomc >> 点击此处查看指南
    .goto Stormwind City,38.61,79.39,10 >>前去找 |cRXP_FRIENDLY_詹妮亚·坎农|r
step
    #requires Bank2
    #label JenneaT
    .goto Stormwind City,38.61,79.39
    >>与 |cRXP_FRIENDLY_詹妮亚·坎农|r 对话
    .trainer >> 学习职业技能（烈焰风暴）
    >>总花费：15银
    .target 詹妮亚·坎农
step
    .goto Stormwind City,55.46,65.26
    >>透过墙与 |cRXP_FRIENDLY_凯德雷克|r 对话
    .vendor 1257 >> |cRXP_BUY_购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_，若有货则向他购买|r
    .target 凯德雷克·布舍尔
    .money <0.14
step
    #completewith next
    .goto Stormwind City,56.69,57.76,12,0
    .goto Stormwind City,57.13,57.69,10 >>前往 |cRXP_FRIENDLY_吴平|r
step
    .goto Stormwind City,57.13,57.69
    >>与 |cRXP_FRIENDLY_吴平|r 对话
    .train 1180 >> 学习 |T132321:0|t[匕首] 使用技能
    .target 吴平
step
    #completewith next
    .goto Stormwind City,57.17,58.83,12,0
    .goto Stormwind City,63.42,63.75,20,0
    .goto Stormwind City,63.14,65.25,15,0
    .goto Stormwind City,66.27,62.12,10 >>前往 |cRXP_FRIENDLY_杜加尔·朗德瑞克|r 处
step << Human
    .goto Stormwind City,66.27,62.12
    >>与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r 交谈
    .turnin 6261 >> 交任务：杜加尔·朗德瑞克
    .accept 6285 >> 接任务：返回西部荒野
    .target 杜加尔·朗德瑞克
step
    #completewith next << Human
    .goto Stormwind City,66.27,62.12
    >>与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r 交谈
    .fp Stormwind City >> 获取暴风城飞行点 << Gnome
    .fly Westfall >> 飞往西部荒野 << Human
    .target 杜加尔·朗德瑞克
    .zoneskip Westfall << Human
step << Gnome
    #completewith next
    #label Stormwind1
    .goto Stormwind City,65.94,65.48,12,0
    .goto Stormwind City,65.85,66.00,8,0
    .goto Stormwind City,65.22,75.58,40 >>跳下到|cRXP_FRIENDLY_杜加尔·朗德瑞克|r下方的平台上
step << Gnome
    #completewith next
    .goto Elwynn Forest,32.10,50.32,40 >>离开暴风城，进入 艾尔文森林。
step << skip
    #completewith next
    #requires Stormwind1
    .goto Elwynn Forest,42.96,65.62,30 >>前往闪金镇的狮王之傲旅店
step << skip
    #label GoldshireTrain
    .goto Elwynn Forest,43.25,66.25
    >>若尚未接受训练，就跳上楼下的吊灯；否则从椅子上跳上去
    >>隔着墙与 |cRXP_FRIENDLY_扎尔迪玛|r 对话
    .accept 1919 >> 接任务：向詹妮亚报告
    .trainer >> 学习职业技能（烈焰风暴）
    >>总花费：15银
step << skip
    .goto Elwynn Forest,44.00,65.69
    >>与|cRXP_FRIENDLY_酒吧老板杜宾斯|r交谈
    >>|cRXP_BUY_向他购买|r |T132794:0|t[一袋蜂蜜酒]|cRXP_BUY_。|r
    .collect 1939,1,116,1 --Skin of Sweet Rum
    .target 酒吧老板杜宾斯
step << skip
    .goto Elwynn Forest,43.77,65.80
    >>与|cRXP_FRIENDLY_旅店老板法雷|r交谈
    >>|cRXP_BUY_向他购买 45 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,45,64,1 --Melon Juice (45)
    .target 旅店老板法雷
    .money <0.45
step << Gnome
    .goto Elwynn Forest,28.98,61.50
    >>在瀑布处使用 |T132788:0|t[詹妮亚的瓶子]
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .use 7207
    .complete 1861,1 --Mirror Lake Water Sample (1)
step
    >>与 |cRXP_FRIENDLY_农夫法布隆|r 和 |cRXP_FRIENDLY_弗娜·法布隆|r 对话
    .accept 64 >> 接任务：遗失的怀表
    .accept 109 >> 接任务：向格里安·斯托曼报到
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .accept 36 >> 接任务：杂味炖肉
    .accept 151 >> 接任务：老马布兰契
    .goto Westfall,59.91,19.41
    .target +弗娜·法布隆
step << Gnome
    #completewith Gryan
    >>打开地上的|cRXP_PICK_一袋燕麦|r，从中拾取|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 151,1 --Handful of Oats (8)
step
    >>与 |cRXP_FRIENDLY_农夫萨丁|r 对话，然后与里面的 |cRXP_FRIENDLY_萨尔玛|r 对话
    .accept 9 >> 接任务：清理荒野
    .target +农夫萨丁
    .goto Westfall,56.04,31.23
    .turnin 36 >> 交任务：杂味炖肉
    .accept 38 >> 接任务：杂味炖肉
    .accept 22 >> 接任务：猪肝馅饼
    .goto Westfall,56.42,30.52
    .target +萨尔玛·萨丁
step << Gnome
    #completewith Gryan
    .goto Westfall,53.54,31.72,60,0
    >>使用群伤技能击杀|cRXP_ENEMY_看守傀儡|r和|cRXP_ENEMY_麦田傀儡|r，拾取掉落的|cRXP_LOOT_油瓶|r和|cRXP_LOOT_蛇麻草|r
    >>|cRXP_WARN_现在记得使用|r |T135826:0|t[烈焰风暴]|cRXP_WARN_/|r|T136116:0|t[魔爆术]|cRXP_WARN_进行 范围攻击。|r
    .complete 9,1 --Harvest Watcher (20)
    .collect 814,5,103,1 --Flask of Oil (5)
    .collect 1274,5,117,1 --Hops (5)
    .mob 看守傀儡
    .mob 麦田傀儡
step << Gnome
    #completewith next
    >>使用群伤技能击杀|cRXP_ENEMY_幼年血牙野猪|r，拾取掉落的|cRXP_LOOT_血牙野猪的肝|r和|cRXP_LOOT_血牙野猪的鼻子|r
    >>使用群伤技能击杀|cRXP_ENEMY_小碎尸鸟|r，拾取掉落的|cRXP_LOOT_秃鹫肉条|r
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +小碎尸鸟
step
    #label Gryan << Gnome
	>> 与|cRXP_FRIENDLY_格里安·斯托曼|r和|cRXP_FRIENDLY_丹努文队长|r交谈 << Gnome
	>> 与 |cRXP_FRIENDLY_格里安·斯托曼|r 交谈，然后与里面的 |cRXP_FRIENDLY_军需官刘易斯|r 交谈 << Human
    .turnin 109 >> 交任务：向格里安·斯托曼报到 << Gnome
    .accept 65 >> 接任务：迪菲亚兄弟会
    .accept 12 >> 接任务：西部荒野人民军 << Gnome
    .target +格里安·斯托曼
    .goto Westfall,56.33,47.52
    .turnin 6285 >> 交任务：返回西部荒野 << Human
    .goto Westfall,57.002,47.169 << Human
    .accept 102 >> 接任务：西部荒野的豺狼人 << Gnome
    .goto Westfall,56.42,47.62 << Gnome
	.target +丹努文队长 << Gnome
    .target +军需官刘易斯 << Human
step
    .goto Westfall,53.98,52.99
	>>与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .accept 153 >> 接任务：红色皮质面罩
	.target 哨兵加里安
step
    .goto Westfall,52.86,53.72
	>>与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 45 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,45,64,1 --Melon Juice (45)
	.target 旅店老板希瑟尔
    .money <0.45
step
    .goto Westfall,52.86,53.72
	>>与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 40 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,40,64,1 --Melon Juice (40)
	.target 旅店老板希瑟尔
    .money <0.40
step
    .goto Westfall,52.86,53.72
	>>与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 35 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,35,64,1 --Melon Juice (35)
	.target 旅店老板希瑟尔
    .money <0.35
step
    .goto Westfall,52.86,53.72
	>>与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 30 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,30,64,1 --Melon Juice (30)
	.target 旅店老板希瑟尔
    .money <0.30
step
    .goto Westfall,52.86,53.72
	>>与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 25 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,25,64,1 --Melon Juice (25)
	.target 旅店老板希瑟尔
    .money <0.25
step
    .goto Westfall,52.86,53.72
	>>与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 20 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,20,64,1 --Melon Juice (20)
	.target 旅店老板希瑟尔
    .money <0.20
step
    .goto Westfall,52.86,53.72
	>>与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 15 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,15,64,1 --Melon Juice (15)
	.target 旅店老板希瑟尔
    .money <0.15
step
    .goto Westfall,52.86,53.72
	>>与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 10 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,10,64,1 --Melon Juice (10)
	.target 旅店老板希瑟尔
    .money <0.10
step
    .goto Westfall,52.86,53.72
	>>与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 5 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,5,64,1 --Melon Juice (5)
	.target 旅店老板希瑟尔
    .money <0.05
step
    #completewith Grayson
    >>打开地上的|cRXP_PICK_一袋燕麦|r，从中拾取|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 151,1 --Handful of Oats (8)
step
    #completewith Oil
    >>使用群伤技能击杀|cRXP_ENEMY_血牙野猪|r，拾取掉落的|cRXP_LOOT_血牙野猪的肝|r和|cRXP_LOOT_血牙野猪的鼻子|r
    >>使用群伤技能击杀|cRXP_ENEMY_碎尸鸟|r，拾取掉落的|cRXP_LOOT_秃鹫肉条|r
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +血牙野猪
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +血牙野猪
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +碎尸鸟
step
    #completewith Compass
    .goto Westfall,39.45,52.34,60,0
    >>使用群伤技能击杀|cRXP_ENEMY_看守傀儡|r，拾取掉落的|cRXP_LOOT_油瓶|r和|cRXP_LOOT_蛇麻草|r
    .complete 9,1 --Harvest Watcher (20)
    .collect 814,5,103,1 --Flask of Oil (5)
    .collect 1274,5,117,1 --Hops (5)
    .mob 看守傀儡
step
    #completewith Oil
    >>使用群伤技能击杀|cRXP_ENEMY_迪菲亚成员|r，拾取掉落的|cRXP_LOOT_红色皮质面罩|r
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚走私者
    .mob 迪菲亚捕兽者
    .mob 迪菲亚强夺者
    .mob 迪菲亚抢劫者
step
    #label Compass
    .goto Westfall,36.24,54.52
    >>打开|cRXP_PICK_阿历克斯顿的箱子|r，获取|cRXP_LOOT_简易罗盘|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 399,1 --A Simple Compass (1)
step
    #label Oil
    .goto Westfall,37.39,50.52,60,0
    .goto Westfall,35.56,46.87,60,0
    .goto Westfall,33.64,47.01,60,0
    .goto Westfall,32.96,36.48,60,0
    .goto Westfall,39.45,52.34,60,0
    .goto Westfall,37.39,50.52,60,0
    .goto Westfall,35.56,46.87,60,0
    .goto Westfall,33.64,47.01,60,0
    .goto Westfall,32.96,36.48,60,0
    .goto Westfall,39.45,52.34
    >>使用群伤技能击杀|cRXP_ENEMY_看守傀儡|r和|cRXP_ENEMY_麦田傀儡|r，拾取掉落的|cRXP_LOOT_油瓶|r和|cRXP_LOOT_蛇麻草|r
    .collect 814,5,103,1 --Flask of Oil (5)
    .collect 1274,5,117,1 --Hops (5)
    .mob 看守傀儡
    .mob 麦田傀儡
step
    #completewith next
    +|cRXP_WARN_留意|cRXP_ENEMY_老瞎眼|r，尽量靠近山脊边缘以免错过他|r
    .unitscan 老瞎眼
step
    .goto Westfall,30.40,57.93,60,0
    .goto Westfall,29.29,65.46,60,0
    .goto Westfall,32.62,68.40,60,0
    .goto Westfall,31.07,69.42,60,0
    .goto Westfall,31.40,72.29,30 >> 用范围技能清理豺狼人营地
    >>使用群伤技能击杀|cRXP_ENEMY_河爪草药师|r、|cRXP_ENEMY_混血河爪豺狼人|r和|cRXP_ENEMY_河爪蛮兵|r，拾取它们掉落的|cRXP_LOOT_豺狼人爪子|r
    >>如果你找到了|cRXP_ENEMY_老瞎眼|r，跳过此步骤
    .complete 102,1 --Gnoll Paws (8)
    .mob 河爪草药师
    .mob 混血河爪豺狼人
    .mob 河爪蛮兵
step
    #completewith next
    +|cRXP_WARN_找到|cRXP_ENEMY_老瞎眼|r，将其风筝至|r|cRXP_FRIENDLY_葛瑞森船长|r处
    .unitscan 老瞎眼
step
    #label Grayson
    .goto Westfall,30.02,86.02
    >>与 |cRXP_FRIENDLY_葛瑞森船长|r 对话
    .accept 104 >> 接任务：海岸上的威胁
    .target 葛瑞森船长
step
    .goto Westfall,33.92,83.88,70,0
    .goto Westfall,34.88,85.82,70,0
    .goto Westfall,35.38,84.63,70,0
    .goto Westfall,33.92,83.88,70,0
    .goto Westfall,31.89,82.28,70,0
    .goto Westfall,30.33,80.75,70,0
    .goto Westfall,29.50,78.70,70,0
    .goto Westfall,29.06,75.45,70,0
    .goto Westfall,28.78,72.58,70,0
    .goto Westfall,27.84,71.33,70,0
    .goto Westfall,27.27,69.96,70,0
    .goto Westfall,26.86,66.82,70,0
    .goto Westfall,26.27,65.76,70,0
    .goto Westfall,33.92,83.88,70,0
    .goto Westfall,34.88,85.82,70,0
    .goto Westfall,35.38,84.63,70,0
    .goto Westfall,33.92,83.88,70,0
    .goto Westfall,31.89,82.28,70,0
    .goto Westfall,30.33,80.75,70,0
    .goto Westfall,29.50,78.70,70,0
    .goto Westfall,29.06,75.45,70,0
    .goto Westfall,28.78,72.58,70,0
    .goto Westfall,27.84,71.33,70,0
    .goto Westfall,27.27,69.96,70,0
    .goto Westfall,26.86,66.82,70,0
    .goto Westfall,26.27,65.76
    >>使用群伤技能击杀|cRXP_ENEMY_老瞎眼|r，拾取掉落的|cRXP_LOOT_老瞎眼的鳞片|r
    .complete 104,1 --Scale of Old Murk-Eye
    .unitscan 老瞎眼
step
    .goto Westfall,30.02,86.02
    >>与 |cRXP_FRIENDLY_葛瑞森船长|r 对话
    .accept 103 >> 接任务：长明的灯塔
    .turnin 103,1 >> 交任务：长明的灯塔
    .turnin 104,3 >> 交任务：海岸上的威胁
    .target 葛瑞森船长
step
    #completewith next
    >>使用群伤技能击杀|cRXP_ENEMY_迪菲亚拳匪|r和|cRXP_ENEMY_迪菲亚路霸|r，拾取掉落的|cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_迪菲亚路霸|r会施放|r |T132090:0|t[背刺]|cRXP_WARN_（从背后攻击会造成双倍伤害）。|r
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚拳匪
    .mob 迪菲亚路霸
step
    .goto Westfall,44.62,80.26
    >>与 |cRXP_FRIENDLY_葛瑞姆|r 对话
    .accept 117 >> 接任务：雷霆啤酒
    .turnin 117 >> 交任务：雷霆啤酒
    .target 葛瑞姆·雷酒
step
    #completewith next
    .goto Westfall,48.77,77.70,60,0
    .goto Westfall,51.73,74.67,60,0
    .goto Westfall,52.56,72.87,60,0
    >>使用群伤技能击杀|cRXP_ENEMY_迪菲亚拳匪|r和|cRXP_ENEMY_迪菲亚路霸|r，拾取掉落的|cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_迪菲亚路霸|r会施放|r |T132090:0|t[背刺]|cRXP_WARN_（从背后攻击会造成双倍伤害）。|r
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚拳匪
    .mob 迪菲亚路霸
step
    .goto Westfall,52.08,71.94,60 >> 前往匕首山的尽头。
    .isOnQuest 153
step
    #completewith Footpads
    >>打开地上的|cRXP_PICK_一袋燕麦|r，从中拾取|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 151,1 --Handful of Oats (8)
step
    #completewith AoE1
    >>使用群伤技能击杀|cRXP_ENEMY_血牙野猪|r，拾取掉落的|cRXP_LOOT_血牙野猪的肝|r和|cRXP_LOOT_血牙野猪的鼻子|r
    >>使用群伤技能击杀|cRXP_ENEMY_碎尸鸟|r，拾取掉落的|cRXP_LOOT_秃鹫肉条|r
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +巨型血牙野猪
    .mob +血牙野猪
    .mob +幼年血牙野猪
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +巨型血牙野猪
    .mob +血牙野猪
    .mob +幼年血牙野猪
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +碎尸鸟
step
    #completewith next
    >>使用群伤技能击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取掉落的|cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_迪菲亚捕兽者|r会施放|r |T132090:0|t[背刺]|cRXP_WARN_（从背后攻击会造成双倍伤害）和|r |T132149:0|t[投网]|cRXP_WARN_（会定身 9 秒）。|r
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚捕兽者
    .mob 迪菲亚走私者
step
    #label AoE1
    .goto Westfall,46.65,52.99,60,0
    .goto Westfall,48.22,45.21,60,0
    .goto Westfall,45.77,39.19,60,0
    .goto Westfall,46.49,37.30,60,0
    .goto Westfall,44.54,34.71,150 >> 前往莫尔森农场
    .isOnQuest 153
step
    #completewith Watch
    .goto Westfall,44.54,34.71,60,0
    >>使用群伤技能击杀|cRXP_ENEMY_看守傀儡|r
    .complete 9,1 --Harvest Watcher (20)
    .mob 看守傀儡
step
    #completewith Furlbrows
    >>使用群伤技能击杀|cRXP_ENEMY_幼年血牙野猪|r，拾取掉落的|cRXP_LOOT_血牙野猪的肝|r和|cRXP_LOOT_血牙野猪的鼻子|r
    >>使用群伤技能击杀|cRXP_ENEMY_碎尸鸟|r和|cRXP_ENEMY_小碎尸鸟|r，拾取掉落的|cRXP_LOOT_秃鹫肉条|r
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +碎尸鸟
    .mob +小碎尸鸟
step
    .goto Westfall,44.14,26.66,60,0
    .goto Westfall,46.13,26.52,60,0
    .goto Westfall,48.74,20.79
    >>使用群伤技能击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取掉落的|cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_迪菲亚捕兽者|r会施放|r |T132090:0|t[背刺]|cRXP_WARN_和|r |T132149:0|t[投网]
    >>|cRXP_WARN_如果两种怪物的击杀进度没有都至少达到 10/15，就跳过此步骤：|cRXP_ENEMY_迪菲亚捕兽者|r和|r|cRXP_ENEMY_迪菲亚走私者|r
    .complete 153,1,1 --Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者
    .complete 12,1 --Defias Trapper (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 --Defias Smuggler (15)
    .mob +迪菲亚走私者
step
    #completewith next
    .goto Westfall,48.74,20.79,60,0
    >>使用群伤技能击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取掉落的|cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_迪菲亚捕兽者|r会施放|r |T132090:0|t[背刺]|cRXP_WARN_和|r |T132149:0|t[投网]
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚捕兽者
    .mob 迪菲亚走私者
step
    #label Watch
    .goto Westfall,49.33,19.26
    >>打开|cRXP_PICK_法布隆的柜子|r，获取|cRXP_LOOT_法布隆的怀表|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 64,1 --Furlbrow's Pocket Watch (1)
step
    #completewith Oats
    .goto Westfall,50.50,21.38,60,0
    .goto Westfall,51.70,23.16,60,0
    >>使用群伤技能击杀|cRXP_ENEMY_看守傀儡|r
    .complete 9,1 --Harvest Watcher (20)
    .mob 看守傀儡
step
    .goto Westfall,52.02,15.00,60,0
    .goto Westfall,56.93,12.75
    >>使用群伤技能击杀|cRXP_ENEMY_河爪斥候|r和|cRXP_ENEMY_河爪豺狼人|r，拾取掉落的|cRXP_LOOT_豺狼人爪子|r
    .complete 102,1 --Gnoll Paws (8)
    .mob 河爪斥候
    .mob 河爪豺狼人
step
    .goto Westfall,52.36,9.59,60,0
    .goto Westfall,53.80,10.69,60,0
    .goto Westfall,55.96,8.22
    >>使用群伤技能击杀|cRXP_ENEMY_滩行鱼人|r和|cRXP_ENEMY_鱼人袭击者|r，拾取掉落的|cRXP_LOOT_鱼人的眼球|r
    .collect 730,3,38,1 --Murloc Eye (3)
    .mob 滩行鱼人
    .mob 鱼人袭击者
step
    #label Footpads
    .goto Westfall,56.56,19.25
    >>使用群伤技能击杀|cRXP_ENEMY_迪菲亚拦路贼|r，拾取掉落的|cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_迪菲亚拦路贼|r会施放|r |T132090:0|t[背刺]。
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚拦路贼
step
    #label Oats
    .goto Westfall,56.56,19.25
    >>打开地上的|cRXP_PICK_一袋燕麦|r，从中拾取|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 151,1 --Handful of Oats (8)
step
    #label Furlbrows
    >>与 |cRXP_FRIENDLY_农夫法布隆|r 和 |cRXP_FRIENDLY_弗娜·法布隆|r 对话
    .turnin 64 >> 交任务：遗失的怀表
    .target +农夫法布隆
    .goto Westfall,59.95,19.35
    .turnin 151 >> 交任务：老马布兰契
    .goto Westfall,59.91,19.41
    .target +弗娜·法布隆
step
    .goto Westfall,59.72,34.62,80,0
    .goto Westfall,60.24,47.40
    >>使用群伤技能击杀|cRXP_ENEMY_血牙野猪|r和|cRXP_ENEMY_幼年血牙野猪|r，拾取掉落的|cRXP_LOOT_血牙野猪的肝|r和|cRXP_LOOT_血牙野猪的鼻子|r
    >>使用群伤技能击杀|cRXP_ENEMY_碎尸鸟|r和|cRXP_ENEMY_小碎尸鸟|r，拾取掉落的|cRXP_LOOT_秃鹫肉条|r
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +血牙野猪
    .mob +幼年血牙野猪
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +血牙野猪
    .mob +幼年血牙野猪
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +碎尸鸟
    .mob +小碎尸鸟
step
    .goto Westfall,52.84,30.46,60,0
    .goto Westfall,51.70,23.16
    >>使用群伤技能击杀|cRXP_ENEMY_看守傀儡|r
    .complete 9,1 --Harvest Watcher (20)
    .mob 看守傀儡
step
    .goto Westfall,51.70,23.16
    .xp 17+11890 >> 刷怪至 11890+/17700 经验值
    .isQuestComplete 12
step
    .goto Westfall,51.70,23.16
    >>|cRXP_WARN_如果已完成 西部荒野人民军 任务目标，可跳过此步骤|r
    .xp 17+12800 >> 刷怪至12800+/17700经验值
step
    >>与 |cRXP_FRIENDLY_农夫萨丁|r 对话，然后与里面的 |cRXP_FRIENDLY_萨尔玛|r 对话
    .turnin 9,1 >> 交任务：清理荒野
    .vendor >> 出售杂物
    .target +农夫萨丁
    .goto Westfall,56.04,31.23
    .turnin 22 >> 交任务：猪肝馅饼
    .turnin 38 >> 交任务：杂味炖肉
    .goto Westfall,56.42,30.52
    .target +萨尔玛·萨丁
step
	>> 与|cRXP_FRIENDLY_格里安·斯托曼|r和|cRXP_FRIENDLY_丹努文队长|r交谈
    .turnin 12 >> 交任务：西部荒野人民军
    .target +格里安·斯托曼
    .goto Westfall,56.33,47.52
    .turnin 102,1 >> 交任务：西部荒野的豺狼人
    .goto Westfall,56.42,47.62
	.target +丹努文队长
    .isQuestComplete 12
step
    .goto Westfall,56.42,47.62
	>> 与|cRXP_FRIENDLY_丹努文队长|r交谈
    .turnin 102,1 >> 交任务：西部荒野的豺狼人
	.target 丹努文队长
step
    .goto Westfall,53.98,52.99
	>>与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .turnin 153,2 >> 交任务：红色皮质面罩
	.target 哨兵加里安
step
    #completewith next
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级 2）]|cRXP_WARN_，尽可能多造水，然后乘坐飞行|r
step
    #completewith next
    .goto Westfall,56.56,52.64
	>>与|cRXP_FRIENDLY_索尔|r 对话
    .fly Stormwind >> 飞往暴风城
	.target 索尔
step
    #completewith next
    .goto Stormwind City,51.68,59.86,8,0
    .goto Stormwind City,51.83,60.41,4,0
    .goto Stormwind City,51.59,60.15,6,0
    .goto Stormwind City,39.17,76.58,12,0
    >>|cRXP_WARN_跳上火把，然后落下进入暴风城下方|r
    >>|cRXP_WARN_在阴影设置为"一般"或"低"时，站在德里克恐龙双脚中间（地上较亮的部分），就在蓝色虚空前方，然后径直向前走|r
    >>|cRXP_WARN_注意：使用此方法有较小概率死亡。若你愿意，也可以正常步行前往法师塔|r
    .link https://youtu.be/gV8-wgQEomc >> 点击此处查看指南
    .goto Stormwind City,38.61,79.39,10 >>前去找 |cRXP_FRIENDLY_詹妮亚·坎农|r
step
    .goto Stormwind City,38.61,79.39
    >>与 |cRXP_FRIENDLY_詹妮亚·坎农|r 对话
    .turnin 1861,1 >> 交任务：明镜湖 << Gnome
--   .turnin 1919 >> Turn in Report to Jennea
    .trainer >> 学习职业技能（火球术等级4）
    >>总花费：18银
    .target 詹妮亚·坎农
step
    #completewith next
    .goto Stormwind City,36.73,82.44,10,0
    .goto Stormwind City,37.91,81.92,10,0
    .goto Stormwind City,38.10,80.93,8,0
    .goto Stormwind City,37.49,81.35,6,0
    .goto Stormwind City,38.46,80.61,8,0
    .goto Stormwind City,33.65,81.58,15,0
    .goto Stormwind City,31.12,79.42,15,0
    .goto Stormwind City,32.07,81.50,10,0
    .goto Stormwind City,32.63,80.62,8,0
    >>离开法师塔
    .goto Stormwind City,32.16,79.84,10 >>前往 |cRXP_FRIENDLY_查瑞斯|r
step
    .goto Stormwind City,32.16,79.84
    >>进入建筑
    >>与 |cRXP_FRIENDLY_查瑞斯|r 对话
    .vendor 1307 >> |cRXP_BUY_购买|r |T134851:0|t[次级法力药水] |cRXP_BUY_和|r |T134831:0|t[治疗药水] |cRXP_BUY_，若有货则向她购买|r
    .target 查瑞斯·伊瑟里安
step
    #completewith next
    .goto Stormwind City,31.41,79.10,20,0
    .goto Stormwind City,32.67,71.36,20,0
    .goto Stormwind City,34.53,68.40,20,0
    .goto Stormwind City,32.16,59.96,20,0
    .goto Stormwind City,32.31,58.51,20,0
    .goto Stormwind City,30.53,55.10,20,0
    .goto Stormwind City,26.04,52.25,20,0
    .goto Stormwind City,24.67,52.60,20,0
    .goto Stormwind City,21.41,55.80,10 >>前往|cRXP_FRIENDLY_阿古斯·夜语|r
step
    .goto Stormwind City,21.41,55.80
    >>与|cRXP_FRIENDLY_阿古斯·夜语|r交谈
    .accept 3765 >> 接任务：遥远的旅途
    .target 阿古斯·夜语
step
    .goto Stormwind City,41.57,65.46
    >>进入建筑
    >>与|cRXP_FRIENDLY_艾代尔|r 对话
    .vendor 1316 >> |cRXP_BUY_购买非智力类|r |T134943:0|t[卷轴] |cRXP_BUY_，若有货则向他购买|r
    .target 艾代尔·吉尔罗
step
    #completewith next
    .goto Stormwind City,53.53,64.63,12,0
    .goto Stormwind City,52.10,61.42,12,0
    .goto Stormwind City,49.36,63.42,12,0
    .goto Stormwind City,51.16,68.35,12,0
    .goto Stormwind City,52.05,67.96,10 >>前往 |cRXP_FRIENDLY_罗伯特|r
step
    .goto Stormwind City,52.05,67.96
    >>进入建筑
    >>与|cRXP_FRIENDLY_罗伯特|r交谈
    >>|cRXP_BUY_向他购买|r |T132620:0|t[一桶葡萄酒]|cRXP_BUY_。|r
    .collect 1941,1,116,1 --Cask of Merlot
    .target 罗伯特·奥布斯
step
    #completewith next
    .goto Stormwind City,52.10,61.34,15,0
    .goto Stormwind City,55.46,65.26,8 >>前往 |cRXP_FRIENDLY_凯德雷克|r 处
step
    .goto Stormwind City,55.46,65.26
    >>透过墙与 |cRXP_FRIENDLY_凯德雷克|r 对话
    .vendor 1257 >> |cRXP_BUY_购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_，若有货则向他购买|r
    .target 凯德雷克·布舍尔
step
    #completewith Bank3
    .goto Stormwind City,55.30,68.16,10 >>进入[暴风城银行]
step
    #sticky
    #label Bank4
    .goto Stormwind City,57.03,72.97
    >>与|cRXP_FRIENDLY_牛顿|r 交谈
    .bankwithdraw 769,5354,6889 >> 从银行取出以下物品：
    >>|T133970:0|t[大块野猪肉]
    >>|T133469:0|t[写给德尔格伦的信]
    >>|T132832:0|t[小蛋]
step
    #label Bank3
    .goto Stormwind City,57.03,72.97
    >>与|cRXP_FRIENDLY_牛顿|r 交谈
    >>|cRXP_WARN_注意：后续布料捐献任务需要每种布料各 12 组（|r|T132911:0|t[毛料]|cRXP_WARN_、|r |T132905:0|t[丝绸]|cRXP_WARN_、|r |T132892:0|t[魔纹布]|cRXP_WARN_和|r |T132903:0|t[符文布]|cRXP_WARN_）。升级过程中会自然获得这些布料。|r
    .bankdeposit 2998,4371,1711,1478,1712,3012,1180,1181,3013,17056,2592,2998,1941 >> 将以下物品存入银行：
    >>|T133024:0|t[青铜管]
    >>|T134943:0|t[卷轴]
    >>|T132917:0|t[轻羽毛]
    >>|T132911:0|t[毛料]
    >>|T134377:0|t[简易罗盘]
    >>|T132620:0|t[一桶葡萄酒]
    .target 牛顿·伯恩赛德
--   .itemcount 769,1
--   .itemcount 4371,1
-- .itemcount 730,1
--  .itemcount 7207,1
-- 1711 level 20 scroll
--VV Vendor Crisp Spider Meat for now
step
    #completewith next
    .goto Stormwind City,53.45,64.92,10,0
    >>进入旅店
    .goto Stormwind City,52.61,65.72,10 >>前往 |cRXP_FRIENDLY_奥里森|r
    .target 旅店老板奥里森
step
    .goto Stormwind City,52.61,65.72
    >>|cRXP_WARN_===请特别注意===|r
    >>|cRXP_WARN_与|r |cRXP_FRIENDLY_奥里森|r交谈。
    >>|cRXP_WARN_打开“设置炉石”菜单，然后施放|r |T134414:0|t[炉石]。
    .hs >> |cRXP_WARN_通过炉石批处理，从暴风城传送至奥伯丁|r
    .target 旅店老板奥里森
    .zoneskip Darkshore
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#classic
#tbc
<< Alliance Mage
#name 18-20 ADV Darkshore 3 Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor Human Mage/Gnome Mage
#next 20-22 ADV Redridge 1 Mage AoE
#displayname 18-20 黑海岸 3（法师进阶 AoE）
step
    .goto Darkshore,36.83,43.91
    >>与|cRXP_FRIENDLY_塔尔丹|r交谈
    >>|cRXP_BUY_购买45瓶|r |T132796:0|t[甜瓜汁] |cRXP_BUY_（向他购买）|r
    .collect 1205,45,4740,1 --Melon Juice (45)
    .target 塔尔丹
    .money <0.45
step
    .goto Darkshore,36.83,43.91
    >>与|cRXP_FRIENDLY_塔尔丹|r交谈
    >>|cRXP_BUY_购买40瓶|r |T132796:0|t[甜瓜汁] |cRXP_BUY_（向他购买）|r
    .collect 1205,40,4740,1 --Melon Juice (40)
    .target 塔尔丹
    .money <0.40
step
    .goto Darkshore,36.83,43.91
    >>与|cRXP_FRIENDLY_塔尔丹|r交谈
    >>|cRXP_BUY_购买35瓶|r |T132796:0|t[甜瓜汁] |cRXP_BUY_（向他购买）|r
    .collect 1205,35,4740,1 --Melon Juice (35)
    .target 塔尔丹
    .money <0.35
step
    .goto Darkshore,36.83,43.91
    >>与|cRXP_FRIENDLY_塔尔丹|r交谈
    >>|cRXP_BUY_购买30瓶|r |T132796:0|t[甜瓜汁] |cRXP_BUY_（向他购买）|r
    .collect 1205,30,4740,1 --Melon Juice (30)
    .target 塔尔丹
    .money <0.30
step
    .goto Darkshore,36.83,43.91
    >>与|cRXP_FRIENDLY_塔尔丹|r交谈
    >>|cRXP_BUY_购买25瓶|r |T132796:0|t[甜瓜汁] |cRXP_BUY_（向他购买）|r
    .collect 1205,25,4740,1 --Melon Juice (25)
    .target 塔尔丹
    .money <0.25
step
    .goto Darkshore,36.83,43.91
    >>与|cRXP_FRIENDLY_塔尔丹|r交谈
    >>|cRXP_BUY_购买20瓶|r |T132796:0|t[甜瓜汁] |cRXP_BUY_（向他购买）|r
    .collect 1205,20,4740,1 --Melon Juice (20)
    .target 塔尔丹
    .money <0.20
step
    .goto Darkshore,36.83,43.91
    >>与|cRXP_FRIENDLY_塔尔丹|r交谈
    >>|cRXP_BUY_购买15瓶|r |T132796:0|t[甜瓜汁] |cRXP_BUY_（向他购买）|r
    .collect 1205,15,4740,1 --Melon Juice (15)
    .target 塔尔丹
    .money <0.15
step
    .goto Darkshore,36.83,43.91
    >>与|cRXP_FRIENDLY_塔尔丹|r交谈
    >>|cRXP_BUY_购买10瓶|r |T132796:0|t[甜瓜汁] |cRXP_BUY_（向他购买）|r
    .collect 1205,10,4740,1 --Melon Juice (10)
    .target 塔尔丹
    .money <0.10
step
    .goto Darkshore,36.83,43.91
    >>与|cRXP_FRIENDLY_塔尔丹|r交谈
    >>|cRXP_BUY_购买5瓶|r |T132796:0|t[甜瓜汁] |cRXP_BUY_（向他购买）|r
    .collect 1205,5,4740,1 --Melon Juice (5)
    .target 塔尔丹
    .money <0.05
step
    .goto Darkshore,36.77,44.28
    >>与|cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_BUY_购买最多40条|r |T133918:0|t[长嘴泥鳅] |cRXP_BUY_（向他购买）|r
    .collect 4592,40,4740,1 --Longjaw Mud Snapper (40)
    .target 莱尔德
step
    >>点击|cRXP_PICK_通缉告示|r
    .accept 4740 >> 接任务：通缉：莫克迪普！
    .goto Darkshore,37.22,44.22
step
    .goto Darkshore,36.09,44.93
    >>与|cRXP_FRIENDLY_古博|r交谈
    .accept 1138 >>接受任务 海中的水果
    .target 古博·布拉普
step
    .goto Darkshore,43.55,76.29
    >>与|cRXP_FRIENDLY_安努|r交谈
    .turnin 948 >> 交任务：安努
    .accept 944 >> 接任务：主宰之剑
    .target 安努
step
    .goto Darkshore,44.40,76.42
    >>与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈
    >>|cRXP_WARN_如果|cRXP_FRIENDLY_克罗尼亚|r不在，就跳过此步骤|r
    .accept 5321 >>接受任务 昏昏欲睡
    .target 克罗尼亚·恒影
step
    .goto Darkshore,44.39,76.30
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取|cRXP_LOOT_唤醒号角|r
    >>|cRXP_WARN_使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r] |cRXP_WARN_在|cRXP_FRIENDLY_克罗尼亚|r睡着时唤醒他|r
    >>|cRXP_WARN_这两项操作均需5秒读条|r
    .complete 5321,1 --Horn of Awakening (1)
    .isOnQuest 5321
step
    #completewith Glaive1
    >>用范围伤害击杀|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r与|cRXP_ENEMY_灰斑蓟熊|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
   .complete 986,1 --Fine Moonstalker Pelt (5)
   .mob 月夜雄虎
   .use 13536
   .isOnQuest 5321
step
    #completewith next
    >>用范围伤害击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r与|cRXP_ENEMY_月夜雄虎|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
   .complete 1003,1 --Grizzled Scalp (4)
   .mob 灰斑蓟熊
   .use 13536
   .isOnQuest 5321
step
    #label Glaive1
   .goto Darkshore,38.65,87.34
    >>前往主宰之剑
   .complete 944,1 --Enter the Master's Glaive (1)
   .use 13536
   .isOnQuest 5321
step
    #completewith Therylune1
    >>使用 AoE 击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，搜刮|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    >>|cRXP_WARN_使用|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]接取任务|r
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .accept 968 >> 接任务：深渊之神
    .mob 暮光信徒
    .mob 暮光暴徒
    .use 13536
    .isOnQuest 5321
step
    #completewith next
    .goto Darkshore,38.65,87.34
    >>将|T134715:0|t[占卜之水]放在地上
    >>|cRXP_WARN_此操作需要 5 秒读条|r
    >>点击地上的|cRXP_PICK_占卜之水|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接任务：暮光之锤的营地
    .use 13536
    .use 5251
    .isOnQuest 5321
step
   .goto Darkshore,38.65,87.34
    >>与|cRXP_FRIENDLY_瑟瑞露尼|r交谈
    >>|cRXP_WARN_如果|cRXP_FRIENDLY_瑟瑞露尼|r不在，就使用 AoE 击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，搜刮|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]，直到她出现|r
   .accept 945 >> 接任务：护送瑟瑞露尼
   .target 瑟瑞露尼
   .use 13536
   .isOnQuest 5321
step
    #completewith Tome1
    >>护送|cRXP_FRIENDLY_瑟瑞露尼|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .use 13536
    .target 瑟瑞露尼
    .isOnQuest 5321
step
   .goto Darkshore,38.55,86.03
   >>将|T134715:0|t[占卜之水]放在地上
   >>|cRXP_WARN_此操作需要 5 秒读条|r
   >>点击地上的|cRXP_PICK_占卜之水|r
   .turnin 944 >> 交任务：主宰之剑
   .accept 949 >> 接任务：暮光之锤的营地
   .use 13536
   .use 5251
   .isOnQuest 5321
step
    #label Tome1
   .goto Darkshore,38.55,86.03
    >>点击|cRXP_PICK_暮光之书|r
   .turnin 949 >> 交任务：暮光之锤的营地
   .accept 950 >> 接任务：向安努回复
   .use 13536
   .isOnQuest 5321
step
   #label Therylune1
   >>护送|cRXP_FRIENDLY_瑟瑞露尼|r
   >>|cRXP_WARN_确保|cRXP_FRIENDLY_瑟瑞露尼|r始终处于可见距离内，否则任务会失败|r
   .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
   .use 13536
   .target 瑟瑞露尼
   .isOnQuest 950
step
    #completewith Remtravel1
    >>用范围伤害击杀|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r与|cRXP_ENEMY_灰斑蓟熊|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .use 13536
    .isOnQuest 950
step
    #completewith next
    >>用范围伤害击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r与|cRXP_ENEMY_月夜雄虎|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
    .use 13536
    .isOnQuest 950
step
    #label Remtravel1
    .goto Darkshore,35.72,83.69
    >>与|cRXP_FRIENDLY_雷姆塔维尔|r交谈，开始护送
    .turnin 729 >> 交任务：健忘的勘察员
    .accept 731 >> 接任务：健忘的勘察员
    .target 勘察员雷姆塔维尔
    .use 13536
    .isOnQuest 950
step
    .goto Darkshore,35.35,84.72,40,0
    .goto Darkshore,36.22,86.12,40,0
    .goto Darkshore,35.35,84.72,40,0
    .goto Darkshore,35.72,83.69,40,0
    .goto Darkshore,31.28,87.39
    >>护送|cRXP_FRIENDLY_雷姆塔维尔|r
    >>当|cRXP_ENEMY_砂石断骨者|r和|cRXP_ENEMY_砂石地占师|r出现时，先让|cRXP_ENEMY_砂石地占师|r施放|T135812:0|t[火球术]攻击|cRXP_FRIENDLY_雷姆塔维尔|r，再对地占师施放|T136071:0|t[变形术]。先击杀|cRXP_ENEMY_砂石断骨者|r，再击杀|cRXP_ENEMY_砂石地占师|r
    .complete 731,1 --Escort Prospector Remtravel (1)
    .target 勘察员雷姆塔维尔
    .mob 砂石地占师
    .mob 砂石断骨者
    .use 13536
    .isOnQuest 950
step
    #completewith SeaC
    >>用范围伤害击杀|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r与|cRXP_ENEMY_灰斑蓟熊|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .use 13536
    .isOnQuest 950
step
    #completewith SeaC
    >>用范围伤害击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r与|cRXP_ENEMY_月夜雄虎|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
    .use 13536
    .isOnQuest 950
step
    #completewith next
    +从现在起不要再唤醒|cRXP_FRIENDLY_克罗尼亚|r
    >>留意|cRXP_ENEMY_雌性森林陆行鸟|r
    .unitscan 雌性森林陆行鸟
    .isOnQuest 950
step
    #label SeaC
    .goto Darkshore,31.28,87.39
    >>拾取地上的|cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_在颈部位置拾取|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .accept 4733 >>接受任务 搁浅的海洋生物
    .isOnQuest 950
step
    #completewith next
    .abandon 5321 >> 放弃任务: [昏昏欲睡]
    .isOnQuest 950
step
    .goto Darkshore,31.22,85.56
    >>拾取地上的|cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_龟壳可以阻挡视线，可利用它卡住视线。|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .accept 4732 >>接受任务 搁浅的海龟
    .isOnQuest 950
step
    #completewith SeaCreature
    >>用范围伤害击杀|cRXP_ENEMY_硬壳潮行蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
   .complete 1138,1 --Fine Crab Chunks (6)
   .mob 硬壳潮行蟹
   .isOnQuest 950
step
    .goto Darkshore,31.70,83.72
    >>拾取地上的|cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_龟壳可以阻挡视线，可利用它卡住视线。|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .accept 4731 >>接受任务 搁浅的海龟
    .isOnQuest 950
step
    #label SeaCreature
    .goto Darkshore,32.70,80.73
    >>拾取地上的|cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .accept 4730 >>接受任务 搁浅的海洋生物
    .isOnQuest 950
step
    #completewith next
    >>用范围伤害击杀|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
   .complete 1138,1 --Fine Crab Chunks (6)
   .mob 暗礁蟹
   .isOnQuest 950
step
   .goto Darkshore,36.52,76.55
   >>清理鱼人营地，先不要走到营地中央
   >>清理完所有敌人后，走到营地中央触发3波敌人（3名灰雾滩行者、2名灰雾战士、莫克迪普和一名灰雾猎人）
   >>|cRXP_WARN_运气好的话，|cRXP_ENEMY_莫克迪普|r可能已经在西侧离岸约30码的水中（如果之前有人被他击杀过）|r
   .complete 4740,1 --Murkdeep (1)
   .unitscan 莫克迪普
   .isOnQuest 950
step
    #completewith next
    .goto Darkshore,35.96,75.22,60,0
    .goto Darkshore,36.01,73.48,60,0
    .goto Darkshore,35.02,72.20,60,0
    .goto Darkshore,35.42,71.52,60,0
    >>用范围伤害击杀|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹
    .isOnQuest 950
step
    .goto Darkshore,35.97,70.90
    >>拾取地上的|cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .accept 4728 >>接受任务 搁浅的海洋生物
    .isOnQuest 950
step
    .goto Darkshore,35.42,71.52,60,0
    .goto Darkshore,35.02,72.20,60,0
    .goto Darkshore,36.01,73.48,60,0
    .goto Darkshore,35.96,75.22,60,0
    .goto Darkshore,35.61,78.13,60,0
    .goto Darkshore,35.27,79.57,60,0
    .goto Darkshore,34.18,80.71
    >>用范围伤害击杀|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹
    .isOnQuest 950
step
    #completewith SeaCreatureGiga
    >>用范围伤害击杀|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r与|cRXP_ENEMY_灰斑蓟熊|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .use 13536
step
    #completewith SeaCreatureGiga
    >>用范围伤害击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r与|cRXP_ENEMY_月夜雄虎|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
    .use 13536
step
    #label Onu2
    .goto Darkshore,43.55,76.29
    >>与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >> 交任务：向安努回复
    .target 安努
    .isQuestComplete 950
step
    #label SeaCreatureGiga
    .goto Darkshore,35.97,70.90
    >>拾取地上的|cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .accept 4728 >>接受任务 搁浅的海洋生物
step
    #completewith next
    .goto Darkshore,35.42,71.52,60,0
    .goto Darkshore,35.02,72.20,60,0
    .goto Darkshore,36.01,73.48,60,0
    .goto Darkshore,35.96,75.22,60,0
    >>用范围伤害击杀|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹
step
    .goto Darkshore,36.52,76.55
    >>清理鱼人营地，先不要走到营地中央
    >>清理完所有敌人后，走到营地中央触发3波敌人（3名灰雾滩行者、2名灰雾战士、莫克迪普和一名灰雾猎人）
    >>|cRXP_WARN_运气好的话，|cRXP_ENEMY_莫克迪普|r可能已经在西侧离岸约30码的水中（如果之前有人被他击杀过）|r
    .complete 4740,1 --Murkdeep (1)
    .unitscan 莫克迪普
step
    #completewith next
    .goto Darkshore,35.61,78.13,60,0
    .goto Darkshore,35.27,79.57,60,0
    .goto Darkshore,34.18,80.71,60,0
    >>用范围伤害击杀|cRXP_ENEMY_暗礁蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹
step
    .goto Darkshore,32.70,80.73
    >>拾取地上的|cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .accept 4730 >>接受任务 搁浅的海洋生物
step
    .goto Darkshore,32.80,81.72,60,0
    .goto Darkshore,32.08,83.28
    >>用范围伤害击杀|cRXP_ENEMY_硬壳潮行蟹|r，拾取|cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
step
    .goto Darkshore,31.70,83.72
    >>拾取地上的|cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_龟壳可以阻挡视线，可利用它卡住视线。|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .accept 4731 >>接受任务 搁浅的海龟
step
    .goto Darkshore,31.22,85.56
    >>拾取地上的|cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_龟壳可以阻挡视线，可利用它卡住视线。|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .accept 4732 >>接受任务 搁浅的海龟
step
    .goto Darkshore,31.28,87.39
    >>拾取地上的|cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_在颈部位置拾取|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .accept 4733 >>接受任务 搁浅的海洋生物
step
    #completewith Remtravel3
    >>用范围伤害击杀|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r与|cRXP_ENEMY_灰斑蓟熊|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .use 13536
step
    #completewith Remtravel3
    >>用范围伤害击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r与|cRXP_ENEMY_月夜雄虎|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
    .use 13536
step
    #completewith next
    +从现在起不要再唤醒|cRXP_FRIENDLY_克罗尼亚|r
    >>留意|cRXP_ENEMY_雌性森林陆行鸟|r
    .unitscan 雌性森林陆行鸟
 step
    #label Remtravel3
    .goto Darkshore,35.72,83.69
    >>与|cRXP_FRIENDLY_雷姆塔维尔|r交谈，开始护送
    .turnin 729 >> 交任务：健忘的勘察员
    .accept 731 >> 接任务：健忘的勘察员
    .target 勘察员雷姆塔维尔
step
    .goto Darkshore,35.35,84.72,40,0
    .goto Darkshore,36.22,86.12,40,0
    .goto Darkshore,35.35,84.72,40,0
    .goto Darkshore,35.72,83.69,40,0
    .goto Darkshore,38.65,87.34
    >>护送|cRXP_FRIENDLY_雷姆塔维尔|r
    >>当|cRXP_ENEMY_砂石断骨者|r和|cRXP_ENEMY_砂石地占师|r出现时，先让|cRXP_ENEMY_砂石地占师|r施放 |T135812:0|t[火球术] 攻击|cRXP_FRIENDLY_勘察员雷姆塔维尔|r，再对地占师施放 |T136071:0|t[变形术]。先击杀|cRXP_ENEMY_砂石断骨者|r，再击杀|cRXP_ENEMY_砂石地占师|r。
    .complete 731,1 --Escort Prospector Remtravel (1)
    .target 勘察员雷姆塔维尔
    .mob 砂石地占师
    .mob 砂石断骨者
step
    #completewith Glaive2
    >>用范围伤害击杀|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r与|cRXP_ENEMY_灰斑蓟熊|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
step
    #completewith next
    >>用范围伤害击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r与|cRXP_ENEMY_月夜雄虎|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
step
    #label Glaive2
   .goto Darkshore,38.65,87.34
    >>前往主宰之剑
   .complete 944,1 --Enter the Master's Glaive (1)
step
    #completewith Therylune2
    >>使用 AoE 击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，搜刮|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    >>|cRXP_WARN_使用|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]接取任务|r
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .accept 968 >> 接任务：深渊之神
    .mob 暮光信徒
    .mob 暮光暴徒
step
    #completewith next
    .goto Darkshore,38.65,87.34
    >>将|T134715:0|t[占卜之水]放在地上
    >>|cRXP_WARN_此操作需要 5 秒读条|r
    >>点击地上的|cRXP_PICK_占卜之水|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接任务：暮光之锤的营地
    .use 5251
step
    .goto Darkshore,38.65,87.34
    >>与|cRXP_FRIENDLY_瑟瑞露尼|r交谈
    >>|cRXP_WARN_如果|cRXP_FRIENDLY_瑟瑞露尼|r不在，就使用 AoE 击杀|cRXP_ENEMY_暮光信徒|r和|cRXP_ENEMY_暮光暴徒|r，搜刮|T133743:0|t[|cRXP_LOOT_《深渊之神》|r]，直到她出现|r
    .accept 945 >> 接任务：护送瑟瑞露尼
    .target 瑟瑞露尼
step
    #completewith Tome2
    >>护送|cRXP_FRIENDLY_瑟瑞露尼|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .target 瑟瑞露尼
step
    .goto Darkshore,38.55,86.03
    >>将|T134715:0|t[占卜之水]放在地上
    >>|cRXP_WARN_此操作需要 5 秒读条|r
    >>点击地上的|cRXP_PICK_占卜之水|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接任务：暮光之锤的营地
    .use 5251
step
    #label Tome2
    .goto Darkshore,38.55,86.03
    >>点击|cRXP_PICK_暮光之书|r
    .turnin 949 >> 交任务：暮光之锤的营地
    .accept 950 >> 接任务：向安努回复
    .use 13536
step
    #label Therylune2
    >>护送|cRXP_FRIENDLY_瑟瑞露尼|r
    >>|cRXP_WARN_确保|cRXP_FRIENDLY_瑟瑞露尼|r始终处于可见距离内，否则任务会失败|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .use 13536
    .target 瑟瑞露尼
step
    #completewith Onu3
    >>用范围伤害击杀|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r与|cRXP_ENEMY_灰斑蓟熊|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
step
    #completewith Onu3
    #label Scalps2
    >>用范围伤害击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r与|cRXP_ENEMY_月夜雄虎|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
step
    #requires Scalps2
    #completewith next
    .goto Darkshore,41.40,80.56,-1
    >>点击|cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务：传声盒525号
step
    #label Onu3
    .goto Darkshore,43.55,76.29,-1
    >>与|cRXP_FRIENDLY_安努|r交谈
    .turnin 950 >> 交任务：向安努回复
    .target 安努
step
    .goto Darkshore,44.40,76.42
    >>与|cRXP_FRIENDLY_克罗尼亚·恒影|r交谈
    >>|cRXP_WARN_如果|cRXP_FRIENDLY_克罗尼亚|r不在，就跳过此步骤|r
    .accept 5321 >>接受任务 昏昏欲睡
    .target 克罗尼亚·恒影
step
    .goto Darkshore,44.39,76.30
    >>打开|cRXP_PICK_克罗尼亚的箱子|r，拾取|cRXP_LOOT_唤醒号角|r
    >>|cRXP_WARN_此操作需要5秒读条|r
    .complete 5321,1 --Horn of Awakening (1)
    .isOnQuest 5321
step
    #completewith 525
    >>用范围伤害击杀|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r与|cRXP_ENEMY_灰斑蓟熊|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
step
    .goto Darkshore,43.94,80.14,60,0
    .goto Darkshore,43.09,81.72,60,0
    .goto Darkshore,41.59,83.52,60,0
    .goto Darkshore,40.15,83.02,60,0
    .goto Darkshore,38.70,82.44,60,0
    .goto Darkshore,38.13,79.75,60,0
    .goto Darkshore,40.52,80.57,60,0
    .goto Darkshore,43.94,80.14,60,0
    .goto Darkshore,43.09,81.72,60,0
    .goto Darkshore,41.59,83.52,60,0
    .goto Darkshore,40.15,83.02,60,0
    .goto Darkshore,38.70,82.44,60,0
    .goto Darkshore,38.13,79.75,60,0
    .goto Darkshore,40.52,80.57
    >>用范围伤害击杀|cRXP_ENEMY_灰斑蓟熊|r，拾取|cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r与|cRXP_ENEMY_月夜雄虎|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
    .use 13536
step
    #label 525
    .goto Darkshore,41.40,80.56
    >>点击|cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务：传声盒525号
    .use 13536
step
    .goto Darkshore,41.10,84.17,70,0
    .goto Darkshore,40.38,90.49,70,0
    .goto Darkshore,36.58,90.55,70,0
    .goto Darkshore,36.70,94.60,70,0
    .goto Darkshore,42.76,90.70,70,0
    .goto Darkshore,41.77,87.88,70,0
    .goto Darkshore,44.57,93.03,70,0
    .goto Darkshore,41.10,84.17,70,0
    .goto Darkshore,40.38,90.49,70,0
    .goto Darkshore,36.58,90.55,70,0
    .goto Darkshore,36.70,94.60,70,0
    .goto Darkshore,42.76,90.70,70,0
    .goto Darkshore,41.77,87.88,70,0
    .goto Darkshore,44.57,93.03
    >>用范围伤害击杀|cRXP_ENEMY_月夜雌虎|r和|cRXP_ENEMY_月夜雄虎|r，拾取|cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r与|cRXP_ENEMY_灰斑蓟熊|r及|cRXP_ENEMY_凶猛的森林陆行鸟|r共用刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .unitscan 月夜雄虎
    .unitscan 月夜雌虎
    .use 13536
step
    #completewith Sleeper
    .xp 19+4635 >> 刷怪至 4635+/21300 经验值
    .isOnQuest 5321
step
    #completewith Delgren
    >>用范围伤害击杀|cRXP_ENEMY_幽爪奔跑者|r，拾取|cRXP_LOOT_狼肋排|r
    .collect 1015,10,90,1 --Lean Wolf Flank (10)
    .mob 幽爪奔跑者
step
    #label Sleeper
    .goto Ashenvale,27.26,35.58
    >>与|cRXP_FRIENDLY_利拉迪斯|r交谈
    .turnin 5321,1 >>交任务 昏昏欲睡
    .target 利拉迪斯·月河
    .use 13536
    .isOnQuest 5321
step
    #label Delgren
    .goto Ashenvale,26.19,38.70
    >>与|cRXP_FRIENDLY_德尔格伦|r交谈
    .turnin 967 >>交任务 奥萨拉克斯之塔
    .target 净化者德尔格伦
step
    .goto Ashenvale,22.64,51.91
    >>与|cRXP_FRIENDLY_瑟瑞希尔|r交谈
    .turnin 945 >>交任务 护送瑟瑞露尼
    .target 瑟瑞希尔
step
    .goto Ashenvale,34.41,47.99
    .xp 19+8720 >> 刷怪至 8720+/21300 经验值
step << skip
    #completewith next
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级 2）] |cRXP_WARN_在起飞前尽量多制造一些水。|r
step
    #completewith next
    .goto Ashenvale,34.41,47.99
    >>与|cRXP_FRIENDLY_黛琳希亚|r交谈
    .fly Auberdine >> 飞往奥伯丁
    .target 黛琳希亚
step
    >>与|cRXP_FRIENDLY_温尼斯|r和|cRXP_FRIENDLY_古博|r交谈
    .turnin 4728 >>交任务 搁浅的海洋生物
    .turnin 4730 >>交任务 搁浅的海洋生物
    .turnin 4731 >>交任务 搁浅的海龟
    .turnin 4732 >>交任务 搁浅的海龟
    .turnin 4733 >>交任务 搁浅的海洋生物
    .target +温尼斯·布莱葛
    .goto Darkshore,36.62,45.60
    .turnin 1138,2 >>交任务 海中的水果
    .goto Darkshore,36.09,44.93
    .target +古博·布拉普
step
    .goto Darkshore,37.73,43.38
    >>与|cRXP_FRIENDLY_戈琳达|r交谈
    .turnin 4740 >>交任务 通缉：莫克迪普！
    .target 哨兵戈琳达·纳希恩
step
    >>与|cRXP_FRIENDLY_特伦希斯|r和|cRXP_FRIENDLY_戈沙拉|r交谈
    .turnin 986 >>交任务：丢失的主人
    --.accept 993 >>Accept A Lost Master
    .target +特伦希斯
    .goto Darkshore,39.37,43.48
    .turnin 3765 >> 交任务：遥远的旅途
    .goto Darkshore,38.32,43.04
    .target +戈沙拉·夜语
step
    .goto Darkshore,38.11,41.16
    >>与|cRXP_FRIENDLY_高尔博德|r交谈
    >>|cRXP_BUY_购买20份|r |T134059:0|t[甜香料] |cRXP_BUY_（向他购买）|r
    .collect 2678,20,90,1 --Mild Spices (20)
    .target 高尔博德·钢手
    .itemcount 6889,20
    .skill cooking,50,1
step
    .goto Darkshore,38.11,41.16
    >>与|cRXP_FRIENDLY_高尔博德|r交谈
    >>|cRXP_BUY_购买15份|r |T134059:0|t[甜香料] |cRXP_BUY_（向他购买）|r
    .collect 2678,15,90,1 --Mild Spices (15)
    .target 高尔博德·钢手
    .itemcount 6889,15
    .skill cooking,50,1
step
    .goto Darkshore,38.11,41.16
    >>与|cRXP_FRIENDLY_高尔博德|r交谈
    >>|cRXP_BUY_购买10份|r |T134059:0|t[甜香料] |cRXP_BUY_（向他购买）|r
    .collect 2678,10,90,1 --Mild Spices (10)
    .target 高尔博德·钢手
    .itemcount 6889,10
    .skill cooking,50,1
step
    .goto Darkshore,38.11,41.16
    >>与|cRXP_FRIENDLY_高尔博德|r交谈
    >>|cRXP_BUY_购买5份|r |T134059:0|t[甜香料] |cRXP_BUY_（向他购买）|r
    .collect 2678,5,90,1 --Mild Spices (5)
    .target 高尔博德·钢手
    .itemcount 6889,5
    .skill cooking,50,1
step
    .goto Darkshore,37.45,40.50
    >>与|cRXP_FRIENDLY_达蒙德|r交谈
    >>|cRXP_BUY_购买一份|r |T135435:0|t[普通木柴] |cRXP_BUY_和|r |T135237:0|t[燧石和火绒] |cRXP_BUY_（向他购买）|r
    .collect 4470,1,90,1 --Simple Wood (1)
    .collect 4471,1,90,1 --Flint and Tinder (1)
    .target 达蒙德
    .skill cooking,50,1
step
    .goto Darkshore,37.44,41.84
    >>与|cRXP_FRIENDLY_霍莉|r交谈
    .turnin 731 >> 交任务：健忘的勘察员
    .accept 741 >> 接任务：健忘的勘察员
    .target 考古学家霍莉
step
    #completewith Teldrassil
    #label BoatT
    .goto Darkshore,37.47,42.45,20,0
    .goto Darkshore,37.44,43.03,20,0
    .goto Darkshore,36.85,44.05,20,0
    .goto Darkshore,32.96,41.88,20,0
    .goto Darkshore,33.23,39.91,50 >>前往开往达纳苏斯的船只停靠的码头
step
    #completewith Teldrassil
    #requires BoatT
    .cast 818 >> 在船上施放|T135805:0|t[基础营火]（如果船还没到，就在码头施放）
    >>|cRXP_WARN_此操作需要 5 秒读条|r
    .skill cooking,50,1
step
    #completewith Teldrassil
    #requires BoatT
    #label BoarM
    +烹饪持有的所有 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r，制成 |T133974:0|t[烤野猪肉]。
    .itemcount 769,1
    .skill cooking,50,1
step
    #completewith next
    #requires BoarM
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级2）] |cRXP_WARN_尽量多制造一些水|r
step
    #label Teldrassil
    .goto Teldrassil,54.91,96.25,100 >> 坐船前往泰达希尔 (达纳苏斯)
step
    #completewith next
    .goto Teldrassil,55.52,93.68,60,0
    .goto Teldrassil,56.80,92.90,40,0
    .goto Teldrassil,57.47,92.97,20,0
    .goto Teldrassil,58.40,94.01,20 >>前往 |cRXP_FRIENDLY_维斯派塔斯|r 处
step
    .goto Teldrassil,58.40,94.01
    >>与|cRXP_FRIENDLY_维斯派塔斯|r交谈
    .fp Rut'theran >> 获取鲁瑟兰村飞行点
    .target 维斯派塔斯
step
    #completewith next
    .goto 1438,55.885,89.350
    .zone Darnassus >> 通过紫色传送门进入达纳苏斯
step
    #completewith next
    .goto Darnassus,37.94,48.14,30,0
    .goto Darnassus,38.20,65.96,30,0
    .goto Darnassus,36.79,72.44,30,0
    .goto Darnassus,31.24,84.49,20 >>前往|cRXP_FRIENDLY_灰须|r处
step
    .goto Darnassus,31.24,84.49
    >>与|cRXP_FRIENDLY_灰须|r交谈
    .turnin 741,3 >>交任务 健忘的勘察员
    .accept 942 >>接受任务 健忘的勘察员
    .target 首席考古学家杜瑟·灰须
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#classic
#tbc
<< Alliance Mage
#name 20-22 ADV Redridge 1 Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor Human Mage/Gnome Mage
#next 22-26 ADV Wetlands 1 Mage AoE
#displayname 20-22 赤脊山 1（法师进阶 AoE）
step
    #completewith next
    .hs >> 使用炉石返回暴风城。
    .zoneskip Stormwind City
step
    .goto Stormwind City,55.46,65.26
    >>隔着墙与|cRXP_FRIENDLY_凯德雷克·布舍尔|r交谈
    .vendor 1257 >> 卖掉杂物。|cRXP_BUY_购买|r|T134830:0|t[次级治疗药水]|cRXP_BUY_（如果他有货）|r
    .target 凯德雷克·布舍尔
step
    #completewith Bank
    .goto Stormwind City,55.30,68.16,10 >>进入暴风城银行。
step
    #sticky
    #label Bank1
    .goto Stormwind City,57.03,72.97
    >>与|cRXP_FRIENDLY_牛顿·伯恩赛德|r交谈
    .bankwithdraw 4371,1941,1711,1478,1712,3012,1180,1181,3013,2998 >> 从银行取出下列物品：
    >>|T133024:0|t[青铜管]
    >>|T134943:0|t[卷轴]
    >>|T132620:0|t[一桶葡萄酒]
    >>|T134377:0|t[简易罗盘]
    .target 牛顿·伯恩赛德
step
    #label Bank
    .goto Stormwind City,57.03,72.97
    >>与|cRXP_FRIENDLY_牛顿·伯恩赛德|r交谈
    >>|cRXP_WARN_注意：后续布料捐献任务需要每种布料各 12 组（|r|T132911:0|t[毛料]|cRXP_WARN_、|r |T132905:0|t[丝绸]|cRXP_WARN_、|r |T132892:0|t[魔纹布]|cRXP_WARN_和|r |T132903:0|t[符文布]|cRXP_WARN_）。升级过程中会自然获得这些布料。|r
    .bankdeposit 17056,2592,1015,4654 >> 将下列物品存入银行：
    >>|T132917:0|t[轻羽毛]
    >>|T132911:0|t[毛料]
    >>|T133970:0|t[狼肋排]
    >>|T134431:0|t[神秘的化石]
    .target 牛顿·伯恩赛德
step
    #completewith next
    #requires Bank1
    .goto Stormwind City,52.16,61.44,12,0
    .goto Stormwind City,49.41,63.41,12,0
    .goto Stormwind City,51.16,68.33,12 >>前往|cRXP_FRIENDLY_罗伯特|r处。
step
    #requires Bank1
    .goto Stormwind City,52.05,67.96
    >>进入建筑
    >>与|cRXP_FRIENDLY_罗伯特|r交谈。
    >>|cRXP_BUY_购买|r |T132620:0|t[一桶葡萄酒]|cRXP_BUY_（向他购买）|r
    .collect 1941,1,116,1 --Cask of Merlot
    .target 罗伯特·奥布斯
step
    #completewith next
    #requires Bank1
    .goto Stormwind City,51.68,59.86,8,0
    .goto Stormwind City,51.83,60.41,4,0
    .goto Stormwind City,51.59,60.15,6,0
    .goto Stormwind City,39.17,76.58,12,0
    >>|cRXP_WARN_跳上火炬, 然后跳下去进入暴风城内部模型下面 (钻地技巧)|r
    >>|cRXP_WARN_将阴影设为 "一般" 或 "低"，站在蓝色虚空前方、恐龙德里克双脚中间（泥地较浅处），然后径直向前走|r
    >>|cRXP_WARN_注意：使用此方法有小概率死亡。愿意的话，也可以正常走到法师塔|r
    .link https://youtu.be/gV8-wgQEomc >> 点击这里查看攻略
    .goto Stormwind City,38.61,79.39,10 >>前往|cRXP_FRIENDLY_拉瑞麦尼·普尔度|r
step
    #requires Bank1
    .goto Stormwind City,39.69,79.56
    >>与|cRXP_FRIENDLY_拉瑞麦尼·普尔度|r交谈
    .train 3561 >> 学习|T135763:0|t[传送：暴风城]
    >>总花费：20银
    .target 拉瑞麦尼·普尔度
step
    .goto Stormwind City,38.61,79.39
    >>与|cRXP_FRIENDLY_詹妮亚·坎农|r交谈
    .trainer >> 学习职业技能（闪现术、唤醒、霜甲术等级3、法力护盾、造水术等级3）
    >>|cRXP_WARN_暂时不要学习暴风雪|r
    >>总花费：1金
    .target 詹妮亚·坎农
step
    #completewith Charys
    .goto Stormwind City,36.73,82.44,10,0
    .goto Stormwind City,37.91,81.92,10,0
    .goto Stormwind City,38.10,80.93,8,0
    .goto Stormwind City,37.49,81.35,6,0
    .goto Stormwind City,38.46,80.61,8,0
    .goto Stormwind City,33.65,81.58,15,0
    .goto Stormwind City,31.12,79.42,15,0
    .goto Stormwind City,32.07,81.50,10,0
    .goto Stormwind City,32.63,80.62,8,0
    >>离开法师塔
    .goto Stormwind City,32.16,79.84,10 >>前往|cRXP_FRIENDLY_查瑞斯·伊瑟里安|r处。
step
    .goto Stormwind City,32.16,79.84
    >>进入建筑
    >>与|cRXP_FRIENDLY_查瑞斯·伊瑟里安|r交谈。
    >>|cRXP_BUY_购买2个|r |T134419:0|t[传送符文]|cRXP_BUY_、|r |T134851:0|t[次级法力药水]|cRXP_BUY_、|r |T134831:0|t[治疗药水]|cRXP_BUY_和一条|r |T132515:0|t[布甲腰带]|cRXP_BUY_（若她有货）|r
    >>|cRXP_WARN_花费后余额不要低于18银31铜。|r
    .collect 17031,2,344,1 --Rune of Teleportation (2)
    .target 查瑞斯·伊瑟里安
    .itemcount 4371,1
step
    #label Charys
    .goto Stormwind City,32.16,79.84
    >>进入建筑
    >>与|cRXP_FRIENDLY_查瑞斯·伊瑟里安|r交谈
    >>|cRXP_BUY_购买两个|r|T134419:0|t[传送符文]|cRXP_BUY_、|r|T134851:0|t[次级法力药水]|cRXP_BUY_、|r|T134831:0|t[治疗药水]|cRXP_BUY_和一条|r|T132515:0|t[布甲腰带]|cRXP_BUY_（如果她有货）|r
    >>|cRXP_WARN_花费后余额不要低于26银31铜。|r
    .collect 17031,2,344,1 --Rune of Teleportation (2)
    .target 查瑞斯·伊瑟里安
    .itemcount 4371,<1
step
    #completewith Adair
    .goto Stormwind City,39.32,71.54,20,0
    .goto Stormwind City,41.06,69.44,20,0
    .goto Stormwind City,44.02,69.81,20,0
    .goto Stormwind City,46.32,66.93,20,0
    .goto Stormwind City,42.45,61.76,20,0
    .goto Stormwind City,41.17,63.74,15,0
    .goto Stormwind City,41.57,65.46,10 >>前往|cRXP_FRIENDLY_艾代尔|r处。
step
    .goto Stormwind City,41.57,65.46
    >>进入建筑
    >>与|cRXP_FRIENDLY_艾代尔·吉尔罗|r交谈
    .vendor 1316 >> |cRXP_BUY_购买智力以外的|r|T134943:0|t[卷轴]|cRXP_BUY_（如果他有货）|r
    >>|cRXP_WARN_花费后余额不要低于18银31铜。|r
    .money <0.1831
    .target 艾代尔·吉尔罗
    .itemcount 4371,1
step
    #label Adair
    .goto Stormwind City,41.57,65.46
    >>进入建筑
    >>与|cRXP_FRIENDLY_艾代尔·吉尔罗|r交谈
    .vendor 1316 >> |cRXP_BUY_购买智力以外的|r|T134943:0|t[卷轴]|cRXP_BUY_（如果他有货）|r
    >>|cRXP_WARN_花费后余额不要低于26银31铜。|r
    .money <0.2631
    .target 艾代尔·吉尔罗
    .itemcount 4371,<1
step
    #completewith next
    .goto Stormwind City,37.84,58.50,5,0
    .goto Stormwind City,37.81,45.02,20 >>沿墙边跑上去，不要绕行。
step
    .goto Stormwind City,45.70,38.42
    >>与|cRXP_FRIENDLY_克里斯托弗修士|r交谈
    .accept 343 >> 接任务：关于坚韧的演讲
    .target 克里斯托弗修士
step
    #completewith next
    .goto Stormwind City,47.85,32.67,15,0
    .goto Stormwind City,47.96,31.15,12,0
    .goto Stormwind City,49.18,30.29,12 >>前往|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r处。
step
    .goto Stormwind City,49.18,30.29
    >>进入建筑
    >>与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈
    .turnin 399 >> 交任务：童年的记忆
    .target 巴隆斯·阿历克斯顿
step
    .goto Stormwind City,55.25,7.07
    >>与|cRXP_FRIENDLY_比利巴布·旋轮|r交谈。
    .vendor 5519 >>|cRXP_BUY_购买|r |T133024:0|t[青铜管]|cRXP_BUY_（若他有货）|r
    .target 比利巴布·旋轮
    .itemcount 4371,<1
step
    #completewith next
    .goto Stormwind City,69.02,28.39,30,0
    .goto Stormwind City,72.60,23.21,20,0
    .goto Stormwind City,69.78,16.58,20,0
    .goto Stormwind City,70.34,11.47,20,0
    .goto Stormwind City,74.19,7.45,12 >>前往|cRXP_FRIENDLY_米尔顿|r处。
step
    .goto Stormwind City,74.19,7.45
    >>与|cRXP_FRIENDLY_米尔顿|r交谈
    .turnin 343 >> 交任务：关于坚韧的演讲
    .accept 344 >> 接任务：帕克斯顿修士
    .target 米尔顿·西弗
step
    #completewith next
    .goto Stormwind City,70.34,11.47,20,0
    .goto Stormwind City,69.78,16.58,20,0
    .goto Stormwind City,72.60,23.21,20,0
    .goto Stormwind City,69.20,29.08,30,0
    .goto Stormwind City,61.74,42.34,20,0
    .goto Stormwind City,64.80,60.34,12,0
    .goto Stormwind City,64.17,60.60,12 >>前往|cRXP_FRIENDLY_菲利希亚|r处。
step
    .goto Stormwind City,64.17,60.60
    >>与|cRXP_FRIENDLY_菲利希亚|r交谈。
    >>|cRXP_BUY_购买|r |T133849:0|t[暴风城特产调料]|cRXP_BUY_（向她购买）|r
    .collect 2665,1,90,1 --Stormwind Seasoning Herbs
    .target 菲利希亚·加姆
step
    #completewith next
    .goto Stormwind City,64.91,58.48,30,0
    .goto Stormwind City,59.91,51.60,30,0
    .goto Stormwind City,57.83,54.98,30,0
    .goto Stormwind City,63.27,63.43,20,0
    .goto Stormwind City,63.13,65.23,20,0
    .goto Stormwind City,65.94,65.48,12,0
    .goto Stormwind City,65.85,66.00,8,0
    .goto Stormwind City,65.22,75.58,40 >>跳下到|cRXP_FRIENDLY_杜加尔·朗德瑞克|r下方的岩架上。
step
    #completewith next
    .goto Elwynn Forest,42.96,65.62,30 >>前往闪金镇的狮王之傲旅店。
step << skip
    #completewith Paxton
    #requires PaxtonT
    .goto Elwynn Forest,32.75,49.52,50,0
    .goto Elwynn Forest,40.63,49.27,20,0
    .goto Elwynn Forest,48.27,41.93,50,0
    .goto Elwynn Forest,48.79,41.56,10,0
    .goto Elwynn Forest,49.26,40.69,10,0
    >>沿山路前往|cRXP_FRIENDLY_帕克斯顿修士|r处。
    .goto Elwynn Forest,49.61,40.41,10 >>前往|cRXP_FRIENDLY_帕克斯顿修士|r处。
step
    .goto Elwynn Forest,44.00,65.69
    >>与|cRXP_FRIENDLY_酒吧老板杜宾斯|r交谈。
    >>|cRXP_BUY_购买|r |T132794:0|t[一袋蜂蜜酒]|cRXP_BUY_（向他购买）|r
    .collect 1939,1,116,1 --Skin of Sweet Rum
    .target 酒吧老板杜宾斯
step
    #sticky
    #label FarleyHome
    .goto Elwynn Forest,43.77,65.80,0,0
    >>与 |cRXP_FRIENDLY_旅店老板法雷|r 交谈
    .home >> 将炉石绑定在闪金镇
    .target 旅店老板法雷
step
    #completewith next
    #requires FarleyHome
    .goto Elwynn Forest,48.79,41.56,10,0
    .goto Elwynn Forest,49.26,40.69,10,0
    .goto Elwynn Forest,49.61,40.41,10 >>前往|cRXP_FRIENDLY_帕克斯顿修士|r处。
step
    #requires FarleyHome
    .goto Elwynn Forest,49.61,40.41
    >>与|cRXP_FRIENDLY_帕克斯顿修士|r交谈
    .turnin 344 >> 交任务：帕克斯顿修士
    .accept 345 >> 接任务：墨水短缺
    .target 帕克斯顿修士
step
    #completewith Theo
    .goto Elwynn Forest,49.26,40.69,10,0
    .goto Elwynn Forest,48.79,41.56,10,0
    .goto Elwynn Forest,48.28,42.21,10,0
    .goto Elwynn Forest,57.62,51.97,30,0
    .goto Elwynn Forest,64.45,69.10,15 >>沿山路前往阿佐拉之塔。
step
    #sticky
    #label Dawn
    .goto Elwynn Forest,64.88,69.19,0,0
    >>与|cRXP_FRIENDLY_当恩·布赖特斯塔|r（在楼上）交谈
    .vendor 958 >> |cRXP_BUY_购买智力以外的|r|T134943:0|t[卷轴]|cRXP_BUY_、|r|T134850:0|t[初级法力药水]|cRXP_BUY_和|r|T134830:0|t[次级治疗药水]|cRXP_BUY_（如果她有货）|r
    >>|cRXP_WARN_余额不要低于11银38铜|r
    .money <0.1138
    .target 当恩·布赖特斯塔
    .itemcount 4371,1
step
    #sticky
    #label Dawn2
    .goto Elwynn Forest,64.88,69.19,0,0
    >>与|cRXP_FRIENDLY_当恩·布赖特斯塔|r（在楼上）交谈
    .vendor 958 >> |cRXP_BUY_购买智力以外的|r|T134943:0|t[卷轴]|cRXP_BUY_、|r|T134850:0|t[初级法力药水]|cRXP_BUY_和|r|T134830:0|t[次级治疗药水]|cRXP_BUY_（如果她有货）|r
    >>|cRXP_WARN_余额不要低于19银38铜|r
    .money <0.1938
    .target 当恩·布赖特斯塔
    .itemcount 4371,<1
step
    #label Theo
    .goto Elwynn Forest,65.22,69.71
    >>上楼
    >>与|cRXP_FRIENDLY_塞欧克瑞图斯|r交谈
    .accept 94 >> 接任务：法师的眼线
    .target 塞欧克瑞图斯
step
    #requires Dawn
step
    #completewith next
    #requires Dawn2
    .goto Duskwood,73.79,45.98,20,0
    .goto Duskwood,74.01,45.36,10 >>进入旅店
step
    #requires Dawn2
    .goto Duskwood,73.81,44.02
    >>与|cRXP_FRIENDLY_酒吧老板汉恩|r交谈。
    >>|cRXP_BUY_购买|r |T132798:0|t[一瓶月光酒]|cRXP_BUY_（向他购买）|r
    .collect 1942,1,116,1 --Bottle of Moonshine (1)
    .target 酒吧老板汉恩
step
    #completewith Viktori
    .goto Duskwood,74.01,45.36,10,0
    .goto Duskwood,73.79,45.98,10 >>离开旅店
step
    #completewith next
    .goto Duskwood,75.22,48.26,12 >>进入建筑
step
    .goto Duskwood,75.34,48.74
    >>与|cRXP_FRIENDLY_艾莱尼|r交谈。
    .accept 163 >>接任务：乌鸦岭
    .accept 164 >>接任务：斯温的货物
    .accept 165 >>接任务：隐士
    .target 艾莱尼·卡尔文
step
    .goto Duskwood,78.00,48.33
    >>与|cRXP_FRIENDLY_赫尔伯|r交谈。
    .vendor 3133 >>|cRXP_BUY_购买|r |T133024:0|t[青铜管]|cRXP_BUY_（若他有货）|r
    .target 赫尔伯
    .itemcount 4371,<1
step
    .goto Duskwood,79.78,48.06
    >>与 |cRXP_FRIENDLY_维克托|r 交谈
    .accept 174 >> 接任务：眺望群星
    .turnin 174 >> 交任务：眺望群星
    .accept 175 >> 接任务：眺望群星
    .target 维克托·安特拉斯
    .itemcount 4371,1
step
    #label Viktori
    .goto Duskwood,79.78,48.06
    >>与 |cRXP_FRIENDLY_维克托|r 交谈
    .accept 175 >> 接任务：眺望群星
    .target 维克托·安特拉斯
    .isQuestTurnedIn 174
step
    .goto Duskwood,81.46,59.02
    >>与|cRXP_FRIENDLY_玛丽|r交谈
    .turnin 175 >> 交任务：眺望群星
    .accept 177 >> 接任务：眺望群星
    .target 盲眼玛丽
    .isQuestTurnedIn 174
step
    .goto Duskwood,77.48,44.29
    >>与|cRXP_FRIENDLY_菲利希亚|r交谈。
    .fp Duskwood >> 获取暮色森林飞行点
    .target 菲利希亚·玛林
step
    #completewith Kzixx
    .goto Duskwood,76.66,23.49,60,0
    .goto Duskwood,81.82,19.76,20 >>前往|cRXP_FRIENDLY_卡兹克斯|r处。
step
    .goto Duskwood,81.82,19.76
    >>与|cRXP_FRIENDLY_卡兹克斯|r交谈。
    .vendor 3134 >>|cRXP_BUY_购买|r |T134851:0|t[次级法力药水]|cRXP_BUY_和|r  |T134831:0|t[治疗药水]|cRXP_BUY_（若他有货）|r
    .itemcount 4827,1
    .target 卡兹克斯
step
    .goto Duskwood,81.82,19.76
    >>与|cRXP_FRIENDLY_卡兹克斯|r交谈。
    .vendor 3134 >>|cRXP_BUY_购买|r |T134851:0|t[次级法力药水]|cRXP_BUY_和|r  |T134831:0|t[治疗药水]|cRXP_BUY_（若他有货）|r
    .itemcount 4828,1
    .target 卡兹克斯
step
    .goto Duskwood,81.82,19.76
    >>与|cRXP_FRIENDLY_卡兹克斯|r交谈。
    .vendor 3134 >>|cRXP_BUY_购买|r |T134851:0|t[次级法力药水]|cRXP_BUY_和|r  |T134831:0|t[治疗药水]|cRXP_BUY_（若他有货）|r
    .itemcount 4829,1
    .target 卡兹克斯
step
    #label Kzixx
    .goto Duskwood,81.82,19.76
    >>与|cRXP_FRIENDLY_卡兹克斯|r交谈。
    .vendor 3134 >>|cRXP_BUY_向他购买|r |T134851:0|t[次级法力药水]|cRXP_BUY_、|r |T134831:0|t[治疗药水]|cRXP_BUY_以及一条|r |T132515:0|t[布甲腰带]|cRXP_BUY_（若有货，且需要时）|r
    .itemcount 4827,<1
    .itemcount 4828,<1
    .itemcount 4829,<1
    .target 卡兹克斯
step
    #completewith Gnolls
    >>使用 AoE 技能击杀|cRXP_ENEMY_狼蛛|r，并拾取|cRXP_LOOT_香脆蜘蛛肉|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型血牙野猪|r，并拾取|cRXP_LOOT_巨型血牙野猪头|r和 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r。
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
    .mob +狼蛛
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob +巨型血牙野猪
    .collect 769,50,90,1,1 --Chunk of Boar Meat (50)
    .mob +巨型血牙野猪
    .skill cooking,50,1
step
    #completewith Gnolls
    >>使用 AoE 技能击杀|cRXP_ENEMY_狼蛛|r，并拾取|cRXP_LOOT_香脆蜘蛛肉|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型血牙野猪|r，并拾取|cRXP_LOOT_巨型血牙野猪头|r。
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
    .mob +狼蛛
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob +巨型血牙野猪
    .skill cooking,<50,1
step
    .goto Redridge Mountains,15.52,72.58,60,0
    .goto Redridge Mountains,14.87,70.30,60,0
    .goto Redridge Mountains,16.93,70.20
    >>与|cRXP_FRIENDLY_卫兵帕克|r交谈。
    .accept 244 >>接受任务 豺狼人的入侵
    .target 卫兵帕克
step << skip
    #label AoE1
    .goto Redridge Mountains,15.73,62.47,60 >>用 AoE 技能击杀|cRXP_ENEMY_混血赤脊山豺狼人|r和|cRXP_ENEMY_赤脊山鞭笞者|r。
    .isOnQuest 244
step << skip
    #completewith Gnolls
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型血牙野猪|r，并拾取|cRXP_LOOT_巨型血牙野猪头|r和 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r。
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .collect 769,50,90,1,1 --Chunk of Boar Meat (50)
    .mob 巨型血牙野猪
    .skill cooking,50,1
step << skip
    #completewith next
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型血牙野猪|r，并拾取|cRXP_LOOT_巨型血牙野猪头|r。
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob 巨型血牙野猪
    .skill cooking,50
step
    #label Gnolls
    .goto Redridge Mountains,30.74,59.99
    >>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈。
    .turnin 244 >>交任务 豺狼人的入侵
    .accept 246 >>接受任务 审时度势
    .target 菲尔顿副队长
step
    .goto Redridge Mountains,30.59,59.40
    >>与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >> 获取赤脊山飞行点
step
    >>与|cRXP_FRIENDLY_治安官马瑞斯|r和|cRXP_FRIENDLY_工头奥斯洛|r交谈。
    .accept 20 >>接受任务 黑石氏族的威胁
    .target +治安官马瑞斯
    .goto Redridge Mountains,33.51,48.96
    .accept 125 >>接受任务 丢失的工具
    .turnin 345 >>交任务：墨水短缺
    .accept 347 >>接任务：瑞斯班矿石
    .goto Redridge Mountains,32.14,48.64
    .target +工头奥斯洛
step
    .goto Redridge Mountains,29.89,47.36
    >>与|cRXP_FRIENDLY_卡伦|r交谈。
    >>|cRXP_BUY_购买|r |T134708:0|t[矿工锄]|cRXP_BUY_（向她购买）|r
    >>|cRXP_WARN_后续需要|r
    .collect 2901,1,125,1 --Mining Pick (1)
    .target 卡伦·泰勒
step
    >>与|cRXP_FRIENDLY_拜里弗·科纳彻尔|r交谈。
--  .accept 120 >>Accept Messenger to Stormwind
--  .goto Redridge Mountains,29.99,44.45
    .accept 91 >>接受任务 所罗门的律法
    .goto Redridge Mountains,29.72,44.26
--  .target Magistrate Solomon
    .target 拜里弗·科纳彻尔
step
    >>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈，并查看|cRXP_PICK_[通缉告示]|r。
    .accept 127 >>接受任务 卖鱼
    .goto Redridge Mountains,27.72,47.38
    .accept 180 >>接受任务 通缉：范高雷中尉
    .goto Redridge Mountains,26.75,46.42
    .target 码头管理员巴伦
step
    #sticky
    #label Darcy1
    .goto Redridge Mountains,26.92,44.95,0,0
    >>进入旅店
    >>与|cRXP_FRIENDLY_达希|r交谈。
    .accept 129 >>接受任务 免费的午餐
    .target 达希
step
    .goto Redridge Mountains,26.49,43.95
    >>旅店内
    >>与|cRXP_FRIENDLY_酒吧老板丹尼尔|r交谈。
    .accept 116 >>接任务：旱季
    .turnin 116 >>交任务：旱季
    .target 酒吧老板丹尼尔
step
    .goto Redridge Mountains,26.47,45.33
    >>旅店内
    >>在楼下的楼梯扶手处跳起，与|cRXP_FRIENDLY_黑衣威利|r交谈。
    .turnin 65 >>交任务 迪菲亚兄弟会
--  .accept 132 >>Accept The Defias Brotherhood
    .target 黑衣威利
step
    .goto Redridge Mountains,29.32,53.64
    >>与|cRXP_FRIENDLY_肖恩|r交谈
    .accept 3741 >>接受任务 希拉里的项链
    .target 肖恩
step
    .goto Redridge Mountains,31.29,54.27,90,0
    .goto Redridge Mountains,27.80,56.05,90,0
    .goto Redridge Mountains,26.56,50.63,90,0
    .goto Redridge Mountains,23.96,55.17,90,0
    .goto Redridge Mountains,19.16,51.75,90,0
    .goto Redridge Mountains,31.12,54.21,90,0
    .goto Redridge Mountains,34.03,55.34,90,0
    .goto Redridge Mountains,38.09,54.49
    >>|cRXP_WARN_潜入水下检查刷新点。共有8处刷新位置，同时有2处刷新。|r
    >>打开|cRXP_PICK_闪光的泥浆|r，拾取其中的|cRXP_LOOT_希拉里的项链|r。
    >>|cRXP_WARN_该操作需要5秒施法时间。|r
    .complete 3741,1 --Hilary's Necklace (1)
step
    .goto Redridge Mountains,29.24,53.63
    >>与|cRXP_FRIENDLY_希拉里|r交谈。
    .turnin 3741 >>交任务 希拉里的项链
    .target 希拉里
step
    #completewith Gnolls2
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型血牙野猪|r，并拾取|cRXP_LOOT_巨型血牙野猪头|r和 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r。
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .collect 769,50,90,1,1 --Chunk of Boar Meat (50)
    .mob 巨型血牙野猪
    .skill cooking,50,1
step
    #completewith next
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型血牙野猪|r，并拾取|cRXP_LOOT_巨型血牙野猪头|r。
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob 巨型血牙野猪
    .skill cooking,<50,1
step
    #label Gnolls2
    .goto Redridge Mountains,15.73,62.47
    >>用 AoE 技能击杀|cRXP_ENEMY_混血赤脊山豺狼人|r和|cRXP_ENEMY_赤脊山鞭笞者|r。
    .complete 246,1,1 --Redridge Mongrel (1)
    .mob 混血赤脊山豺狼人
    .mob 赤脊山鞭笞者
step
    #completewith Gnolls3
    >>使用 AoE 技能击杀|cRXP_ENEMY_狼蛛|r，并拾取|cRXP_LOOT_香脆蜘蛛肉|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型血牙野猪|r，并拾取|cRXP_LOOT_巨型血牙野猪头|r和 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r。
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
    .mob +狼蛛
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob +巨型血牙野猪
    .collect 769,50,90,1,1 --Chunk of Boar Meat (50)
    .mob +巨型血牙野猪
    .skill cooking,50,1
step
    #completewith Gnolls3
    >>使用 AoE 技能击杀|cRXP_ENEMY_狼蛛|r，并拾取|cRXP_LOOT_香脆蜘蛛肉|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型血牙野猪|r，并拾取|cRXP_LOOT_巨型血牙野猪头|r。
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
    .mob +狼蛛
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob +巨型血牙野猪
    .skill cooking,<50,1
step
    .goto Redridge Mountains,15.52,72.58,60,0
    .goto Redridge Mountains,14.87,70.30,60,0
    .goto Redridge Mountains,16.93,70.20
    >>与|cRXP_FRIENDLY_卫兵帕克|r交谈。
    .turnin 129 >>交任务 免费的午餐
    .accept 130 >>接受任务 寻访草药师
    .target 卫兵帕克
step
    #label Gnolls3
    .goto Redridge Mountains,29.40,83.93,60,0
    .goto Redridge Mountains,30.95,84.10,60,0
    .goto Redridge Mountains,32.26,82.83,60,0
    .goto Redridge Mountains,34.60,82.99,60,0
    .goto Redridge Mountains,43.37,71.01,60,0
    .goto Redridge Mountains,29.40,83.93,60,0
    .goto Redridge Mountains,30.95,84.10,60,0
    .goto Redridge Mountains,32.26,82.83,60,0
    .goto Redridge Mountains,34.60,82.99,60,0
    .goto Redridge Mountains,43.37,71.01
    >>用 AoE 技能击杀|cRXP_ENEMY_混血赤脊山豺狼人|r、|cRXP_ENEMY_赤脊山鞭笞者|r和|cRXP_ENEMY_赤脊山偷猎者|r。
    >>|cRXP_WARN_记得站进|r|cRXP_ENEMY_赤脊山偷猎者|r的射击死区
    .complete 246,1 --Redridge Mongrel (10)
    .mob +混血赤脊山豺狼人
    .complete 246,2 --Redridge Poacher (6)
    .mob +赤脊山偷猎者
step
    .goto Redridge Mountains,30.74,59.99
    >>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈。
    .turnin 246 >>交任务 审时度势
    .target 菲尔顿副队长
step
    .goto Redridge Mountains,41.52,54.68,-1
    >>潜入水下
    >>打开|cRXP_PICK_沉没的箱子|r，拾取|cRXP_LOOT_奥斯洛的工具箱|r。
    >>|cRXP_WARN_该操作需要5秒施法时间。|r
    .complete 125,1 --Oslow's Toolbox (1)
step
    #completewith next
    .goto Redridge Mountains,40.30,45.98,60,0
    >>使用 AoE 技能击杀|cRXP_ENEMY_鱼人食腐者|r和|cRXP_ENEMY_鱼人斥候|r，并拾取|cRXP_LOOT_斑点太阳鱼|r和|cRXP_LOOT_鱼人鳍|r。
    .complete 127,1 --Spotted Sunfish (10)
    .collect 1468,8,150,1 --Murloc Fin (8)
    .mob 鱼人食腐者
    .mob 鱼人斥候
step
    .goto Redridge Mountains,32.14,48.63
    >>与|cRXP_FRIENDLY_工头奥斯洛|r交谈。
    .turnin 125 >>交任务 丢失的工具
    .accept 89 >>接受任务 止水湖上的桥
    .target 工头奥斯洛
step
    .goto Redridge Mountains,30.83,46.49
    >>与|cRXP_FRIENDLY_多林·桑布雷德|r交谈
    .vendor >> 卖掉杂物
    .target 多林·桑布雷德
    .isOnQuest 89
step << skip
    #completewith next
    .goto Redridge Mountains,29.24,45.40,10,0
    .goto Redridge Mountains,28.89,44.87,8 >>进入议政厅。
step
    .goto Redridge Mountains,37.16,45.20,60,0
    .goto Redridge Mountains,38.36,41.34,60,0
    .goto Redridge Mountains,38.89,31.72,60,0
    .goto Redridge Mountains,43.25,34.03,60,0
    .goto Redridge Mountains,47.37,34.77,60,0
    .goto Redridge Mountains,55.35,45.02,60,0
    .goto Redridge Mountains,57.02,51.01,60,0
    .goto Redridge Mountains,56.24,53.93,60,0
    .goto Redridge Mountains,58.38,53.56,60,0
    .goto Redridge Mountains,58.47,44.61,60,0
    .goto Redridge Mountains,59.11,43.97,60,0
    .goto Redridge Mountains,59.74,42.01,60,0
    .goto Redridge Mountains,62.34,41.76,60,0
    .goto Redridge Mountains,62.56,45.36,60,0
    >>使用 AoE 技能击杀|cRXP_ENEMY_黑石前锋|r、|cRXP_ENEMY_黑石叛节者|r和|cRXP_ENEMY_黑石步兵|r，并拾取|cRXP_LOOT_破斧|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_鱼人招潮者|r和|cRXP_ENEMY_鱼人斥候|r，并拾取|cRXP_LOOT_斑点太阳鱼|r和|cRXP_LOOT_鱼人鳍|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_恐鹫|r，并拾取|cRXP_LOOT_硬秃鹫肉|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型狼蛛|r，并拾取|cRXP_LOOT_香脆蜘蛛肉|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型血牙野猪|r，并拾取|cRXP_LOOT_巨型血牙野猪头|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_赤脊山秘法师|r和|cRXP_ENEMY_赤脊山蛮兵|r，并拾取|cRXP_LOOT_铁矛|r和|cRXP_LOOT_铁铆钉|r。
    >>|cRXP_WARN_小心，|cRXP_ENEMY_黑石前锋|r会施放|r |T132149:0|t[投网]|cRXP_WARN_，|cRXP_ENEMY_恐鹫|r会施放|r |T132154:0|t[击倒]
    .complete 20,1 --Blackrock Axe (10)
#loop
	.line Redridge Mountains,37.16,45.20,38.36,41.34,40.09,40.64,42.89,39.26,59.36,44.56,59.79,42.05,62.58,41.46,62.57,45.48,59.36,44.56
	.goto Redridge Mountains,37.16,45.20,30,0
	.goto Redridge Mountains,38.36,41.34,30,0
	.goto Redridge Mountains,40.09,40.64,30,0
	.goto Redridge Mountains,42.89,39.26,30,0
	.goto Redridge Mountains,59.36,44.56,30,0
	.goto Redridge Mountains,59.79,42.05,30,0
	.goto Redridge Mountains,62.58,41.46,30,0
	.goto Redridge Mountains,62.57,45.48,30,0
	.goto Redridge Mountains,59.36,44.56,30,0
    .complete 127,1 --Spotted Sunfish (10)
    .collect 1468,8,150,1 --Murloc Fin (8)
    .goto Redridge Mountains,58.06,52.01,40,0
    .goto Redridge Mountains,57.08,51.03,40,0
    .goto Redridge Mountains,56.12,53.55,40,0
    .goto Redridge Mountains,58.06,52.01
    .collect 1080,5,92,1 --Tough Condor Meat (5)
#loop
	.line Redridge Mountains,43.25,34.03,47.37,34.77,47.37,34.77,49.97,33.60,51.90,39.75,54.81,40.66,54.70,44.93,57.63,46.48
	.goto Redridge Mountains,43.25,34.03,30,0
	.goto Redridge Mountains,47.37,34.77,30,0
	.goto Redridge Mountains,47.37,34.77,30,0
	.goto Redridge Mountains,49.97,33.60,30,0
	.goto Redridge Mountains,51.90,39.75,30,0
	.goto Redridge Mountains,54.81,40.66,30,0
	.goto Redridge Mountains,54.70,44.93,30,0
	.goto Redridge Mountains,57.63,46.48,30,0
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
#loop
	.line Redridge Mountains,52.26,36.56,54.08,38.28,54.98,40.31,56.79,41.36,57.26,47.60,54.76,45.58,52.67,42.73,50.50,41.55,52.26,36.56
	.goto Redridge Mountains,52.26,36.56,30,0
	.goto Redridge Mountains,54.08,38.28,30,0
	.goto Redridge Mountains,54.98,40.31,30,0
	.goto Redridge Mountains,56.79,41.36,30,0
	.goto Redridge Mountains,57.26,47.60,30,0
	.goto Redridge Mountains,54.76,45.58,30,0
	.goto Redridge Mountains,52.67,42.73,30,0
	.goto Redridge Mountains,50.50,41.55,30,0
	.goto Redridge Mountains,52.26,36.56,30,0
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .disablecheckbox
    .complete 89,1 --Iron Pike (5)
    .disablecheckbox
    .complete 89,2 --Iron Rivet (5)
    .disablecheckbox
    .goto Redridge Mountains,38.89,31.72
    .mob 黑石前锋
    .mob 黑石步兵
    .mob 黑石叛节者
    .mob 鱼人斥候
    .mob 鱼人招潮者
    .mob 恐鹫
    .mob 巨型狼蛛
    .mob 巨型血牙野猪
    .mob 赤脊山秘法师
    .mob 赤脊山蛮兵
step
    #completewith Herbalist
    .goto Redridge Mountains,36.64,37.01,60,0
    .goto Redridge Mountains,32.21,40.09,60,0
    >>使用 AoE 技能击杀|cRXP_ENEMY_赤脊山秘法师|r和|cRXP_ENEMY_赤脊山蛮兵|r，并拾取|cRXP_LOOT_铁矛|r和|cRXP_LOOT_铁铆钉|r。
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .mob 赤脊山秘法师
    .mob 赤脊山蛮兵
step
    .goto Redridge Mountains,22.68,43.83
    >>进入建筑
    >>与|cRXP_FRIENDLY_厨师布雷纳|r交谈
    .accept 92 >> 接任务：赤脊山炖肉
    .turnin 92 >> 交任务：赤脊山炖肉
    .target 厨师布雷纳
    .itemcount 1080,5
    .itemcount 1081,5
    .itemcount 2296,5
step
    #label Herbalist
    .goto Redridge Mountains,21.86,46.33
    >>与|cRXP_FRIENDLY_玛蒂|r交谈。
    .turnin 130 >>交任务 寻访草药师
    .accept 131 >>接受任务 水仙诉衷情
    .accept 34 >>接受任务 不速之客
    .target 玛蒂·詹罗斯
step
    #completewith next
    .goto Redridge Mountains,17.72,55.71,60,0
    .goto Redridge Mountains,16.09,53.08,60,0
    >>使用群伤技能击杀|cRXP_ENEMY_巨型血牙野猪|r，拾取掉落的|cRXP_LOOT_巨型血牙野猪头|r
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob 巨型血牙野猪
step
    .goto Redridge Mountains,15.66,49.31
    >>击杀|cRXP_ENEMY_贝利格拉布|r，拾取|cRXP_LOOT_贝利格拉布的獠牙|r。
    >>|cRXP_WARN_将贝利格拉布引到|cRXP_FRIENDLY_拉玛尔|r北侧的栅栏边，来回跳跃卡在安全点，避免受到伤害。|r
    >>小心，|cRXP_ENEMY_贝利格拉布|r会施放|T132337:0|t[冲锋]和|T136025:0|t[震颤]。
    .complete 34,1 --Bellygrub's Tusk (1)
    .mob 贝利格拉布
    .target 拉玛尔·维斯利
step
    .goto Redridge Mountains,21.86,46.33
    >>与|cRXP_FRIENDLY_玛蒂|r交谈。
    .turnin 34 >>交任务 不速之客
    .target 玛蒂·詹罗斯
step
    .goto Redridge Mountains,17.47,43.62,60,0
    .goto Redridge Mountains,20.92,39.37,60,0
    .goto Redridge Mountains,17.72,55.71,60,0
    .goto Redridge Mountains,16.09,53.08,60,0
    .goto Redridge Mountains,17.47,43.62,60,0
    .goto Redridge Mountains,20.92,39.37,60,0
    .goto Redridge Mountains,17.72,55.71,60,0
    .goto Redridge Mountains,16.09,53.08
    >>使用群伤技能击杀|cRXP_ENEMY_巨型血牙野猪|r，拾取掉落的|cRXP_LOOT_巨型血牙野猪头|r
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob 巨型血牙野猪
step
    #completewith next
    .goto Redridge Mountains,21.35,36.34,60,0
    >>使用 AoE 技能击杀|cRXP_ENEMY_赤脊山秘法师|r和|cRXP_ENEMY_赤脊山蛮兵|r，并拾取|cRXP_LOOT_铁矛|r和|cRXP_LOOT_铁铆钉|r。
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .mob 赤脊山秘法师
    .mob 赤脊山蛮兵
step
    .goto Redridge Mountains,19.50,31.91,60,0
    .goto Redridge Mountains,20.58,28.29,40 >>前往瑞斯班洞穴。
    .isOnQuest 347
step
#loop
	.line Redridge Mountains,18.95,24.50,21.62,23.72,21.89,15.06,20.21,13.25,18.82,15.03,16.06,17.08,17.48,19.55,16.05,21.04,18.95,24.50
	.goto Redridge Mountains,18.95,24.50,20,0
	.goto Redridge Mountains,21.62,23.72,20,0
	.goto Redridge Mountains,21.89,15.06,20,0
	.goto Redridge Mountains,20.21,13.25,20,0
	.goto Redridge Mountains,18.82,15.03,20,0
	.goto Redridge Mountains,16.06,17.08,20,0
	.goto Redridge Mountains,17.48,19.55,20,0
	.goto Redridge Mountains,16.05,21.04,20,0
	.goto Redridge Mountains,18.95,24.50,20,0
    >>使用 AoE 技能击杀|cRXP_ENEMY_赤脊山苦工|r，并拾取|cRXP_LOOT_瑞斯班矿石|r、|cRXP_LOOT_铁矛|r和|cRXP_LOOT_铁铆钉|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_赤脊山猛击者|r，并拾取|cRXP_LOOT_铁矛|r和|cRXP_LOOT_铁铆钉|r。
    >>在洞穴中开采|cRXP_PICK_铜矿|r，获取|cRXP_LOOT_瑞斯班矿石|r。
    .complete 347,1 --Rethban Ore (5)
    .mob +赤脊山苦工
    .complete 89,1 --Iron Pike (5)
    .mob +赤脊山猛击者
    .complete 89,2 --Iron Rivet (5)
    .mob +赤脊山猛击者
step
#loop
	.line Redridge Mountains,18.95,24.50,21.62,23.72,21.89,15.06,20.21,13.25,18.82,15.03,16.06,17.08,17.48,19.55,16.05,21.04,18.95,24.50
	.goto Redridge Mountains,18.95,24.50,20,0
	.goto Redridge Mountains,21.62,23.72,20,0
	.goto Redridge Mountains,21.89,15.06,20,0
	.goto Redridge Mountains,20.21,13.25,20,0
	.goto Redridge Mountains,18.82,15.03,20,0
	.goto Redridge Mountains,16.06,17.08,20,0
	.goto Redridge Mountains,17.48,19.55,20,0
	.goto Redridge Mountains,16.05,21.04,20,0
	.goto Redridge Mountains,18.95,24.50,20,0
    .xp 21+14365 >> 刷怪直到经验值达到 14365+/25200。
    .isQuestAvailable 92
step
#loop
	.line Redridge Mountains,18.95,24.50,21.62,23.72,21.89,15.06,20.21,13.25,18.82,15.03,16.06,17.08,17.48,19.55,16.05,21.04,18.95,24.50
	.goto Redridge Mountains,18.95,24.50,20,0
	.goto Redridge Mountains,21.62,23.72,20,0
	.goto Redridge Mountains,21.89,15.06,20,0
	.goto Redridge Mountains,20.21,13.25,20,0
	.goto Redridge Mountains,18.82,15.03,20,0
	.goto Redridge Mountains,16.06,17.08,20,0
	.goto Redridge Mountains,17.48,19.55,20,0
	.goto Redridge Mountains,16.05,21.04,20,0
	.goto Redridge Mountains,18.95,24.50,20,0
    .xp 21+15715 >> 刷怪直到经验值达到 15715+/25200。
    .isQuestTurnedIn 92
step << skip
    #completewith next
    .goto Redridge Mountains,18.79,13.84,-1
    .goto Redridge Mountains,22.04,17.14,-1
    .goto Redridge Mountains,18.40,24.13,-1
    .goto Redridge Mountains,21.29,24.06,-1
    .goto Redridge Mountains,16.58,20.97,-1
    .goto Redridge Mountains,33.82,48.07,30 >>从洞穴东侧执行登出跳点，返回湖畔镇。
step
    #completewith next
    .subzone 69 >> 返回湖畔镇
step
    >>与|cRXP_FRIENDLY_治安官马瑞斯|r和|cRXP_FRIENDLY_工头奥斯洛|r交谈。
    .turnin 20 >>交任务 黑石氏族的威胁
    .accept 19 >>接任务：萨瑞尔祖恩
    .target +治安官马瑞斯
    .goto Redridge Mountains,33.51,48.96
    .turnin 89,1 >>交任务 止水湖上的桥
    .goto Redridge Mountains,32.14,48.64
    .target +工头奥斯洛
step
    .goto Redridge Mountains,30.94,47.24
    >>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈。
    .accept 118 >>接受任务 马掌
    .target 弗纳·奥斯古
step
    .goto Redridge Mountains,27.72,47.38
    >>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
    .turnin 127 >> 交任务 卖鱼
    .accept 150 >> 接受任务 鱼人偷猎者
    .turnin 150 >> 交任务 鱼人偷猎者
    .goto Redridge Mountains,27.72,47.38
    .target 码头管理员巴伦
step
    #sticky
    #label Kimberly
    .goto Redridge Mountains,27.08,45.54,0,0
    .vendor >> 卖掉杂物。愿意的话，现在可以卖掉|T134708:0|t[矿工锄]。
    .target 金伯利·海特
step
    .goto Redridge Mountains,26.92,44.95
    >>进入旅店
    >>与|cRXP_FRIENDLY_达希|r交谈。
    .turnin 131 >>交任务：水仙诉衷情
    .target 达希
step
    #completewith next
    .goto Redridge Mountains,26.52,46.38,12,0
    .goto Redridge Mountains,22.86,44.57,12,0
    >>前往|cRXP_FRIENDLY_厨师布雷纳|r处。
step
    .goto Redridge Mountains,22.68,43.83
    >>进入建筑
    >>与|cRXP_FRIENDLY_厨师布雷纳|r交谈
    .accept 92 >> 接任务：赤脊山炖肉
    .turnin 92 >> 交任务：赤脊山炖肉
    .target 厨师布雷纳
step
    #completewith next
    .hs >> 使用炉石返回闪金镇。
step
    .goto Elwynn Forest,41.71,65.55
    >>与|cRXP_FRIENDLY_铁匠阿古斯|r交谈。
    .turnin 118 >>交任务 马掌
    .accept 119 >>接受任务 回复弗纳
    .target 铁匠阿古斯
step
    #completewith next
    .goto Elwynn Forest,48.79,41.56,10,0
    .goto Elwynn Forest,49.26,40.69,10,0
    .goto Elwynn Forest,49.61,40.41,10 >>前往|cRXP_FRIENDLY_帕克斯顿修士|r处。
step
    .goto Elwynn Forest,49.61,40.41
    >>与|cRXP_FRIENDLY_帕克斯顿修士|r交谈
    .turnin 347 >> 交任务：瑞斯班矿石
    .accept 346 >> 接任务：克里斯托弗的书
    .target 帕克斯顿修士
step
    #completewith CharysEnd
    .cast 3561 >> 施放 |T135763:0|t[传送：暴风城]。
    .zoneskip Stormwind City
step
    #completewith CharysEnd
    >>|cRXP_WARN_===请特别注意===|r
    +|cRXP_WARN_洗点切换为冰霜 AoE 天赋。|r
    .xp <22,1
step
    .goto Stormwind City,38.23,81.86
    >>与|cRXP_FRIENDLY_玛吉诺·仲马|r交谈
    .train 10 >> 学习暴风雪
    .target 玛吉诺·仲马
    .xp <22,1
step
    #completewith CharysEnd
    .goto Stormwind City,36.73,82.44,10,0
    .goto Stormwind City,37.91,81.92,10,0
    .goto Stormwind City,38.10,80.93,8,0
    .goto Stormwind City,37.49,81.35,6,0
    .goto Stormwind City,38.46,80.61,8,0
    .goto Stormwind City,33.65,81.58,15,0
    .goto Stormwind City,31.12,79.42,15,0
    .goto Stormwind City,32.07,81.50,10,0
    .goto Stormwind City,32.63,80.62,8,0
    >>离开法师塔
    .goto Stormwind City,32.16,79.84,10 >>前往|cRXP_FRIENDLY_查瑞斯·伊瑟里安|r处。
step
    #completewith BankDeposit
    +|cRXP_WARN_花费后余额不要低于1金43银30铜。|r
    .xp >22,1
step
    .goto Stormwind City,32.16,79.84
    >>进入建筑
    >>与|cRXP_FRIENDLY_查瑞斯·伊瑟里安|r交谈。
    .vendor 1307 >>|cRXP_BUY_购买|r |T134851:0|t[次级法力药水]|cRXP_BUY_和|r  |T134831:0|t[治疗药水]|cRXP_BUY_（若她有货）|r
    .itemcount 4827,1
    .target 查瑞斯·伊瑟里安
step
    .goto Stormwind City,32.16,79.84
    >>进入建筑
    >>与|cRXP_FRIENDLY_查瑞斯·伊瑟里安|r交谈。
    .vendor 1307 >>|cRXP_BUY_购买|r |T134851:0|t[次级法力药水]|cRXP_BUY_和|r  |T134831:0|t[治疗药水]|cRXP_BUY_（若她有货）|r
    .itemcount 4828,1
    .target 查瑞斯·伊瑟里安
step
    .goto Stormwind City,32.16,79.84
    >>进入建筑
    >>与|cRXP_FRIENDLY_查瑞斯·伊瑟里安|r交谈。
    .vendor 1307 >>|cRXP_BUY_购买|r |T134851:0|t[次级法力药水]|cRXP_BUY_和|r  |T134831:0|t[治疗药水]|cRXP_BUY_（若她有货）|r
    .itemcount 4829,1
    .target 查瑞斯·伊瑟里安
step
    #label CharysEnd
    .goto Stormwind City,32.16,79.84
    >>进入建筑
    >>与|cRXP_FRIENDLY_查瑞斯·伊瑟里安|r交谈
    .vendor 1307 >>|cRXP_BUY_向她购买|r |T134851:0|t[次级法力药水]|cRXP_BUY_、|r |T134831:0|t[治疗药水]|cRXP_BUY_以及一条|r |T132515:0|t[布甲腰带]|cRXP_BUY_（若有货，且需要时）|r
    .itemcount 4827,<1
    .itemcount 4828,<1
    .itemcount 4829,<1
    .target 查瑞斯·伊瑟里安
step
    #completewith next
    .goto Stormwind City,39.32,71.54,20,0
    .goto Stormwind City,41.06,69.44,20,0
    .goto Stormwind City,44.02,69.81,20,0
    .goto Stormwind City,46.32,66.93,20,0
    .goto Stormwind City,42.45,61.76,20,0
    .goto Stormwind City,41.17,63.74,15,0
    .goto Stormwind City,41.57,65.46,10 >>前往|cRXP_FRIENDLY_艾代尔|r处。
step
    #label AdairX
    .goto Stormwind City,41.57,65.46
    >>进入建筑
    >>与|cRXP_FRIENDLY_艾代尔·吉尔罗|r交谈
    .vendor 1316 >> |cRXP_BUY_购买智力以外的|r|T134943:0|t[卷轴]|cRXP_BUY_（如果他有货）|r
    .target 艾代尔·吉尔罗
step
    #completewith next
    .goto Stormwind City,37.84,58.50,5,0
    .goto Stormwind City,37.81,45.02,20 >>沿墙边跑上去，不要绕行。
step
    .goto Stormwind City,45.70,38.42
    >>与|cRXP_FRIENDLY_克里斯托弗修士|r交谈
    .turnin 346 >> 交任务：克里斯托弗的书
    .target 克里斯托弗修士
step
    .goto Stormwind City,55.25,7.07
    >>与|cRXP_FRIENDLY_比利巴布·旋轮|r交谈。
    .vendor 5519 >>|cRXP_BUY_购买|r |T133024:0|t[青铜管]|cRXP_BUY_（若他有货）|r
    .target 比利巴布·旋轮
    .itemcount 4371,<1
    .isQuestAvailable 174
step
    #completewith next
    .goto Stormwind City,63.89,8.25,20 >> 前往矿道地铁。
step
    #completewith next
    +|cRXP_WARN_乘坐矿道地铁时，持续施放|r |T132816:0|t[造水术（等级3）]。
step
    .zone Ironforge >> 乘坐矿道地铁前往铁炉堡
step
    .goto Ironforge,67.83,42.47
    >>与|cRXP_FRIENDLY_考格斯宾|r交谈。
    .vendor 5175>>|cRXP_BUY_购买|r |T133024:0|t[青铜管]|cRXP_BUY_（若他有货）|r
    .target 考格斯宾
    .itemcount 4371,<1
    .isQuestAvailable 174
step
    #completewith BankDeposit
    .goto Ironforge,33.44,63.56,30 >>进入铁炉堡银行。
step
    .goto Ironforge,35.93,60.13
    >>与 |cRXP_FRIENDLY_拜雷|r 交谈
    >>|cRXP_WARN_注意：后续布料捐献任务需要每种布料各 12 组（|r|T132911:0|t[毛料]|cRXP_WARN_、|r |T132905:0|t[丝绸]|cRXP_WARN_、|r |T132892:0|t[魔纹布]|cRXP_WARN_和|r |T132903:0|t[符文布]|cRXP_WARN_）。升级过程中会自然获得这些布料。|r
    .bankdeposit 17056,2592,1015,1083,2665,1922,1284 >> 将下列物品存入银行：
    >>|T132917:0|t[轻羽毛]
    >>|T132911:0|t[毛料]
    >>|T133970:0|t[狼肋排]
    >>|T133277:0|t[阿祖拉的铭文饰品]
    >>|T133849:0|t[暴风城特产调料]
    >>|T133629:0|t[斯温的货物]
    >>|T132761:0|t[一箱马掌]
    .target 拜雷·石衣
step
    #label BankDeposit
    .goto Ironforge,35.93,60.13
    .bankwithdraw 4654 >> 从银行取出下列物品：
    >>|T134431:0|t[神秘的化石]
    .target 拜雷·石衣
step
    .goto Ironforge,25.50,7.04
    >>与|cRXP_FRIENDLY_贝尔斯塔弗·风暴之眼|r交谈
    .train 3562 >> 学习|T135757:0|t[传送：铁炉堡]
    .target 贝尔斯塔弗·风暴之眼
step
    #completewith FlyMene
    >>|cRXP_WARN_===请特别注意===|r
    +|cRXP_WARN_若尚未切换天赋，现在洗点切换为冰霜 AoE 天赋；已切换则无需再次洗点。|r
step
    .goto Ironforge,27.18,8.60
    >>与|cRXP_FRIENDLY_丁克|r交谈
    .train 10 >> 学习暴风雪
    .target 丁克
step
    #completewith next
    +|cRXP_WARN_开始持续施放|r |T132816:0|t[造水术（等级3）]|cRXP_WARN_，在起飞前尽量多制造一些水。|r
step
    #completewith next
    #label FlyMene
    .goto Ironforge,55.50,47.74
    >>与|cRXP_FRIENDLY_格莱斯·瑟登|r交谈
    .fly Menethil >> 飞往米奈希尔港
    .target 格莱斯·瑟登
step
    .zone Wetlands >> 前往湿地
]])
