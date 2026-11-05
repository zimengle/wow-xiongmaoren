local faction = UnitFactionGroup("player")
if faction == "Horde" then return end

RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#forever
#disabledungeons
<< Human Mage
#name 1-10 ADV Elwynn Forest Human Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none Human Mage
#next 10-11 ADV Dun Morogh Human Mage AoE
#displayname 1-10 艾尔文森林（人类法师进阶 AoE）
step << !Human Mage
    #season 2
    #completewith next
    +在探索赛季，法师不应从其他种族的新手区开始，因为你无法在这里获得第一个符文（|T133816:0|t[铭刻手套 - 冰枪术]）
step
    #completewith next
    +你已选择进阶指南。这是为游戏中升级最快的职业（联盟法师）设计的最快路线，因此会运用许多冷门机制，以及难度很高的 AoE 拉怪技巧。学习时请坚持练习，祝你好运！
step
    #completewith next
    .goto 1429/0,-146.20,-8999.660,50,0
    +|cRXP_WARN_击杀|cRXP_ENEMY_幼狼|r。拾取战利品，直到可出售物品价值达到 10 铜币|r
    .mob 幼狼
step
    .goto 1429/0,-136.52,-8933.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里|r交谈
    .accept 783 >> 接取《身边的危机》
    .target 维里副队长
step
    .goto 1429/0,-112.54,-8899.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔|r交谈
    .vendor >> 出售垃圾，直到拥有 10+ 铜币
    .target 丹尼尔修士
step
    .goto 1429/0,-139.61,-8910.09,15,0
    .goto 1429/0,-162.62,-8902.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克布莱德|r交谈（在屋内）
    .turnin 783 >> 交还《身边的危机》
    .accept 7 >> 接取《剿灭狗头人》
    .target 治安官玛克布莱德
step
    #completewith next
    .goto 1429/0,-164.25,-8891.80,10,0
    .goto 1429/0,-174.32,-8880.92,10,0
    .goto 1429/0,-188.20,-8868.89,10,0
    .goto 1429/0,-180.56,-8862.87,5,0
    >>从楼梯跳上栏杆
    .goto 1429/0,-188.20,-8851.76,10 >>前往楼上的|cRXP_FRIENDLY_凯尔登|r处
step
    .goto 1429/0,-188.20,-8851.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯尔登|r交谈
    .train 1459 >> 学习|T135932:0|t[奥术智慧]
    .target 凯尔登·布雷门
step
    #completewith next
    .goto 1429/0,-188.20,-8868.89,10,0
    .goto 1429/0,-174.32,-8880.92,10,0
    .goto 1429/0,-164.25,-8891.80,10,0
    .goto 1429/0,-136.52,-8933.53,10 >>前往|cRXP_FRIENDLY_维里|r处
step
    .goto 1429/0,-136.52,-8933.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里|r交谈
    .accept 5261 >> 接取《伊根·派特斯金纳》
    .target 维里副队长
step
    #completewith next
    .goto 1429/0,-64.64,-8924.9,70,0
    .goto 1429/0,-81.64,-8850.37
    +|cRXP_WARN_击杀|cRXP_ENEMY_幼狼|r。拾取战利品，直到可出售物品（包括身上的护甲）价值达到 50 铜币|r
    .mob 幼狼
step
    .goto 1429/0,-112.54,-8899.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔|r交谈
    >>|cRXP_BUY_向他购买 10 瓶|r|T132794:0|t[清凉的泉水]|cRXP_BUY_|r
    .vendor >> 出售垃圾
    .collect 159,10,7,1 --Collect Refreshing Spring Water (x10)
    .target 丹尼尔修士
step
    .goto 1429/0,-163.21,-8869.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊根|r交谈
    .turnin 5261 >> 交还《伊根·派特斯金纳》
    .accept 33 >> 接取《林中的群狼》
    .target 伊根·派特斯金纳
step
    #completewith next
    >>击杀|cRXP_LOOT_幼狼|r和|cRXP_LOOT_森林狼|r，拾取|cRXP_LOOT_硬狼肉|r
    >>优先击杀|cRXP_LOOT_幼狼|r
    .complete 33,1 --Collect Tough Wolf Meat (x8)
	.mob 幼狼
    .mob 森林狼
step
#loop
	.line Elwynn Forest,47.01,35.68,47.70,35.04,49.81,35.14,49.82,36.23,49.18,37.16,47.01,35.68
	.goto 1429/0,-96.22,-8765.43,35,0
	.goto 1429/0,-120.17,-8750.61,35,0
	.goto 1429/0,-193.41,-8752.93,35,0
	.goto 1429/0,-193.75,-8778.16,35,0
	.goto 1429/0,-171.54,-8799.68,35,0
	.goto 1429/0,-96.22,-8765.43,35,0
    >>击杀|cRXP_ENEMY_狗头人歹徒|r
    >>|cRXP_WARN_尽量击杀 1 级|cRXP_ENEMY_狗头人歹徒|r|r
    .complete 7,1 --Kill Kobold Vermin (x10)
	.mob 狗头人歹徒
step
#loop
	.line Elwynn Forest,49.32,37.91,48.24,37.88,46.18,37.29,45.69,39.05,46.03,40.91,48.04,39.55,49.32,37.91
	.goto 1429/0,-176.40,-8817.04,35,0
	.goto 1429/0,-138.91,-8816.35,35,0
	.goto 1429/0,-67.41,-8802.69,35,0
	.goto 1429/0,-50.41,-8843.43,35,0
	.goto 1429/0,-62.21,-8886.48,35,0
	.goto 1429/0,-131.97,-8855.00,35,0
	.goto 1429/0,-176.40,-8817.04,35,0
    >>击杀|cRXP_LOOT_幼狼|r和|cRXP_LOOT_森林狼|r，拾取|cRXP_LOOT_硬狼肉|r
    >>优先击杀|cRXP_LOOT_幼狼|r
    .complete 33,1 --Collect Tough Wolf Meat (x8)
	.mob 幼狼
    .mob 森林狼
step
    .goto 1429/0,-163.21,-8869.12
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_伊根|r交谈
    .turnin 33,1 >> 交还《林中的群狼》
    .target 伊根·派特斯金纳
step
    .goto 1429/0,-112.54,-8899.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔|r交谈
    >>|cRXP_BUY_向他购买 10 瓶|r |T132794:0|t[清凉的泉水]
    .vendor >>出售垃圾
    .collect 159,10,15,1 --Collect Refreshing Spring Water (x10)
    .target 丹尼尔修士
step
    .goto 1429/0,-162.62,-8902.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克布莱德|r交谈（在屋内）
    .turnin 7 >> 交还《剿灭狗头人》
    .accept 15 >> 接取《回音山调查行动》
    .accept 3104 >> 接取《雕文信件》
    .target 治安官玛克布莱德
step
#loop
	.line Elwynn Forest,47.25,36.41,47.39,35.77,47.35,34.06,46.29,32.42,47.75,32.77,50.11,34.98,47.25,36.41
	.goto 1429/0,-104.55,-8782.32,35,0
	.goto 1429/0,-109.41,-8767.51,35,0
	.goto 1429/0,-108.02,-8727.93,35,0
	.goto 1429/0,-71.23,-8689.97,35,0
	.goto 1429/0,-121.91,-8698.07,35,0
	.goto 1429/0,-203.82,-8749.22,35,0
	.goto 1429/0,-104.55,-8782.32,35,0
    >>击杀|cRXP_ENEMY_狗头人劳工|r
    .complete 15,1 --Kill Kobold Worker (x10)
	.mob 狗头人劳工
step
#loop
	.line Elwynn Forest,49.32,37.91,48.24,37.88,46.18,37.29,45.69,39.05,46.03,40.91,48.04,39.55,49.32,37.91
	.goto 1429/0,-176.40,-8817.04,35,0
	.goto 1429/0,-138.91,-8816.35,35,0
	.goto 1429/0,-67.41,-8802.69,35,0
	.goto 1429/0,-50.41,-8843.43,35,0
	.goto 1429/0,-62.21,-8886.48,35,0
	.goto 1429/0,-131.97,-8855.00,35,0
	.goto 1429/0,-176.40,-8817.04,35,0
    .xp 3+1110 >> 刷怪，直到经验值达到 1110+/1400
	.mob 幼狼
	.mob 狗头人歹徒
    .mob 森林狼
 step
    .goto 1429/0,-112.54,-8899.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔|r交谈
    >>|cRXP_BUY_向他购买 10 瓶|r|T132794:0|t[清凉的泉水]|cRXP_BUY_|r
    .vendor >>出售垃圾
    .collect 159,10,15,1 --Collect Refreshing Spring Water (x10)
    .target 丹尼尔修士
step
    .goto 1429/0,-162.62,-8902.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克布莱德|r交谈（在屋内）
    .turnin 15 >> 交还《回音山调查行动》
    .accept 21 >> 接取《回音山清剿行动》
    .target 治安官玛克布莱德
step
    #completewith next
    .goto 1429/0,-164.25,-8891.80,10,0
    .goto 1429/0,-174.32,-8880.92,10,0
    .goto 1429/0,-188.20,-8868.89,10,0
    .goto 1429/0,-180.56,-8862.87,5,0
    >>从楼梯跳上栏杆
    .goto 1429/0,-188.20,-8851.76,10 >>前往楼上的|cRXP_FRIENDLY_凯尔登|r处
step
    #season 0
    .goto 1429/0,-188.20,-8851.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯尔登|r交谈
    .turnin 3104 >> 交还《雕文信件》
    .train 116 >> 学习|T135846:0|t[寒冰箭]
    .target 凯尔登·布雷门
step
    #season 2
    .goto 1429/0,-188.20,-8851.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯尔登|r交谈
    .accept 77620 >> 接取《法术研究》 << Human
    .turnin 3104 >> 交还《雕文信件》
    .train 116 >> 学习|T135846:0|t[寒冰箭]
    .target 凯尔登·布雷门
step
    #completewith next
    .goto 1429/0,-188.20,-8868.89,10,0
    .goto 1429/0,-174.32,-8880.92,10,0
    .goto 1429/0,-164.25,-8891.80,10,0
    .goto 1429/0,-136.52,-8933.53,10 >>前往|cRXP_FRIENDLY_维里|r处
step
    .goto 1429/0,-136.52,-8933.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里|r交谈
    .accept 18 >> 接取《潜行者兄弟会》
    .target 维里副队长
step
    #season 2
    #loop
    #label CALEENCI
    #completewith RedBurlapBandana
    .goto 1429/0,-288.51,-9068.87,0
    .goto 1429/0,-388.47,-9001.28,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取|T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r
    >>|cRXP_WARN_注意：你无法在这里学习|r|T133816:0|t[铭刻手套 - 冰枪术]|cRXP_WARN_，因为只有在自己种族的新手区才能获得|r|T133736:0|t[理解入门]|cRXP_WARN_|r << !Human
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
    .goto 1429/0,-288.51,-9068.87,0
    .goto 1429/0,-388.47,-9001.28,0
    .goto 1429/0,-288.51,-9068.87,30,0
    .goto 1429/0,-335.02,-9108.91,30,0
    .goto 1429/0,-376.67,-9073.73,30,0
    .goto 1429/0,-388.47,-9001.28,30,0
    .goto 1429/0,-333.97,-9028.59,30,0
#loop
	.line Elwynn Forest,51.14,49.29,52.55,48.75,53.81,48.09,54.58,49.02,55.15,47.86,54.76,45.96,53.81,44.79,51.14,49.29
	.goto 1429/0,-239.57,-9080.44,35,0
	.goto 1429/0,-288.51,-9067.94,35,0
	.goto 1429/0,-332.24,-9052.67,35,0
	.goto 1429/0,-358.96,-9074.19,35,0
	.goto 1429/0,-378.75,-9047.34,35,0
	.goto 1429/0,-365.21,-9003.37,35,0
	.goto 1429/0,-332.24,-8976.29,35,0
	.goto 1429/0,-239.57,-9080.44,35,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取|cRXP_LOOT_红色粗麻面罩|r
    .complete 18,1 --Collect Red Burlap Bandana (x12)
	.mob 迪菲亚暴徒
step
    #optional
    #season 2
    #loop
    .goto 1429/0,-288.51,-9068.87,0
    .goto 1429/0,-388.47,-9001.28,0
    .goto 1429/0,-288.51,-9068.87,50,0
    .goto 1429/0,-335.02,-9108.91,50,0
    .goto 1429/0,-376.67,-9073.73,50,0
    .goto 1429/0,-388.47,-9001.28,50,0
    .goto 1429/0,-333.97,-9028.59,50,0
    >>击杀|cRXP_ENEMY_迪菲亚暴徒|r，拾取|T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r
    >>|cRXP_WARN_注意：你无法在这里学习|r|T133816:0|t[铭刻手套 - 冰枪术]|cRXP_WARN_，因为只有在自己种族的新手区才能获得|r|T133736:0|t[理解入门]|cRXP_WARN_|r << !Human
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
    .goto 1429/0,-136.52,-8933.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里|r交谈
    .turnin 18,5 >> 交还《潜行者兄弟会》
    .accept 6 >> 接取《加瑞克·帕德弗特的赏金》
    .accept 3903 >> 接取《米莉·奥斯沃斯》
    .target 维里副队长
step
    #completewith Laborer
    +装备|T135145:0|t[民兵短杖]
    .use 1159
    .itemcount 1159,1
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<2.7
step
    .goto 1429/0,-112.54,-8899.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_丹尼尔|r交谈
    >>|cRXP_BUY_向他购买 10 瓶|r|T132794:0|t[清凉的泉水]|cRXP_BUY_|r
    .vendor >> 出售垃圾
    .collect 159,10,21,1 --Collect Refreshing Spring Water (x10)
    .target 丹尼尔修士
step
    #completewith next
    .goto 1429/0,-122.25,-8671.45,40 >>进入矿洞
step
    #label Laborer
    .goto 1429/0,-130.24,-8649.23,40,0
    .goto 1429/0,-141.69,-8607.11,40,0
    .goto 1429/0,-150.71,-8554.57,40,0
    .goto 1429/0,-198.26,-8535.36,40,0
    .goto 1429/0,-209.37,-8560.59
    >>击杀|cRXP_ENEMY_狗头人苦力|r
    .complete 21,1 --Kill Kobold Laborer (x12)
	.mob 狗头人苦力
step
    .goto 1429/0,-224.3,-8850.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莉|r交谈
    .turnin 3903 >> 交还《米莉·奥斯沃斯》
    .accept 3904 >> 接取《米莉的葡萄》
    .target 米莉·奥斯沃斯
step
    #completewith Harvest
#loop
	.line Elwynn Forest,53.68,47.29,52.82,48.78,54.43,48.10,54.52,49.58,53.85,50.68,54.52,49.58,54.43,48.10,53.68,47.29
	.goto 1429/0,-327.73,-9034.15,35,0
	.goto 1429/0,-297.88,-9068.64,35,0
	.goto 1429/0,-353.76,-9052.900,35,0
	.goto 1429/0,-356.88,-9087.15,35,0
	.goto 1429/0,-333.63,-9112.61,35,0
	.goto 1429/0,-356.88,-9087.15,35,0
	.goto 1429/0,-353.76,-9052.900,35,0
	.goto 1429/0,-327.73,-9034.15,35,0
    .xp 5+1175 >> 刷怪，直到经验值达到 1175+/2800
    .mob 迪菲亚暴徒
step
    #completewith next
#loop
	.line Elwynn Forest,53.68,47.29,52.82,48.78,54.43,48.10,54.52,49.58,53.85,50.68,54.52,49.58,54.43,48.10,53.68,47.29
	.goto 1429/0,-327.73,-9034.15,35,0
	.goto 1429/0,-297.88,-9068.64,35,0
	.goto 1429/0,-353.76,-9052.900,35,0
	.goto 1429/0,-356.88,-9087.15,35,0
	.goto 1429/0,-333.63,-9112.61,35,0
	.goto 1429/0,-356.88,-9087.15,35,0
	.goto 1429/0,-353.76,-9052.900,35,0
	.goto 1429/0,-327.73,-9034.15,35,0
    >>拾取地上的|cRXP_PICK_葡萄桶|r
    >>|cRXP_WARN_需要施法 5 秒|r
    .complete 3904,1 --Collect Milly's Harvest (x8)
step
    .goto 1429/0,-461.01,-9056.37
    >>击杀|cRXP_ENEMY_加瑞克·帕德弗特|r，拾取|cRXP_LOOT_加瑞克的头颅|r
    .complete 6,1 --Collect Garrick's Head (x1)
	.mob 加瑞克·帕德弗特
step
    #label Harvest
#loop
	.line Elwynn Forest,53.68,47.29,52.82,48.78,54.43,48.10,54.52,49.58,53.85,50.68,54.52,49.58,54.43,48.10,53.68,47.29
	.goto 1429/0,-327.73,-9034.15,35,0
	.goto 1429/0,-297.88,-9068.64,35,0
	.goto 1429/0,-353.76,-9052.900,35,0
	.goto 1429/0,-356.88,-9087.15,35,0
	.goto 1429/0,-333.63,-9112.61,35,0
	.goto 1429/0,-356.88,-9087.15,35,0
	.goto 1429/0,-353.76,-9052.900,35,0
	.goto 1429/0,-327.73,-9034.15,35,0
    >>拾取地上的|cRXP_PICK_葡萄桶|r
    >>|cRXP_WARN_需要施法 5 秒|r
    .complete 3904,1 --Collect Milly's Harvest (x8)
step
#loop
	.line Elwynn Forest,53.68,47.29,52.82,48.78,54.43,48.10,54.52,49.58,53.85,50.68,54.52,49.58,54.43,48.10,53.68,47.29
	.goto 1429/0,-327.73,-9034.15,35,0
	.goto 1429/0,-297.88,-9068.64,35,0
	.goto 1429/0,-353.76,-9052.900,35,0
	.goto 1429/0,-356.88,-9087.15,35,0
	.goto 1429/0,-333.63,-9112.61,35,0
	.goto 1429/0,-356.88,-9087.15,35,0
	.goto 1429/0,-353.76,-9052.900,35,0
	.goto 1429/0,-327.73,-9034.15,35,0
    .xp 5+1175 >> 刷怪，直到经验值达到 1175+/2800
    .mob 迪菲亚暴徒
step
    .goto 1429/0,-224.3,-8850.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米莉|r交谈
    .turnin 3904 >>交还《米莉的葡萄》
    .accept 3905 >>接取《葡萄出货单》
    .target 米莉·奥斯沃斯
step
    .goto 1429/0,-136.52,-8933.53
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_维里|r交谈
    .turnin 6,1 >> 交还《加瑞克·帕德弗特的赏金》
    .target 维里副队长
step
    .goto 1429/0,-162.62,-8902.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛克布莱德|r交谈（在屋内）
    .turnin 21,3 >> 交还《回音山清剿行动》
    .accept 54 >> 接取《去闪金镇报到》
    .target 治安官玛克布莱德
step
    #completewith next
    .goto 1429/0,-171.54,-8908.00,10,0
    .goto 1429/0,-184.38,-8901.52,10,0
    .goto 1429/0,-178.83,-8888.10,10,0
    .goto 1429/0,-164.60,-8892.50,10,0
    .goto 1429/0,-172.23,-8907.31,10,0
    .goto 1429/0,-185.08,-8899.21,10,0
    .goto 1429/0,-176.75,-8886.94,10,0
    >>上楼
    .goto 1429/0,-181.64,-8902.13,10 >> 前往|cRXP_FRIENDLY_尼尔斯|r处
step
    .goto 1429/0,-181.64,-8902.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_尼尔斯|r交谈
    .turnin 3905,1 >>交还《葡萄出货单》
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
    .goto 1429/0,-188.23,-8851.58,12 >>下楼，然后前往|cRXP_FRIENDLY_凯尔登·布雷门|r处
    .isQuestComplete 77620
step << Human
    #season 2
    .goto 1429/0,-188.23,-8851.58
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯尔登·布雷门|r交谈（在屋内）
    .turnin 77620 >> 交还《法术研究》
    .target 凯尔登·布雷门
    .isQuestComplete 77620
step
    .goto 1429/0,-45.90,-9044.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法尔坎|r交谈
    .accept 2158 >> 接取《休息和放松》
    .target 法尔坎·伊森斯泰德
step
    .goto 1429/0,74.02,-9465.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜汉|r交谈
    .turnin 54 >> 交还《去闪金镇报到》
    .accept 62 >> 接取《法戈第矿洞》
    .target 治安官杜汉
step
    .goto 1429/0,33.14,-9460.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入旅店时，隔墙与|cRXP_FRIENDLY_威廉|r交谈
    .accept 60 >> 接取《狗头人的蜡烛》
    .target 威廉·匹斯特
step
    #completewith next
    .home >> 将炉石绑定在闪金镇
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法雷|r交谈
step
    .goto 1429/0,16.20,-9462.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法雷|r交谈
    .turnin 2158,2 >> 交还《休息和放松》
    .vendor 295 >> 出售垃圾。|cRXP_BUY_购买|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_，直到只剩 2 银币|r
    .target 旅店老板法雷
step
    .goto 1429/0,34.28,-9472.99
    >>跳上下方的吊灯
    >>隔墙与|cRXP_FRIENDLY_扎尔迪玛|r交谈
    .trainer >> 学习职业法术（火球术等级 2、火焰冲击）
	.target 扎尔迪玛·维夫希尔特
step
    .goto 1429/0,72.81,-9496.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米|r交谈
    .accept 47 >> 接取《金砂交易》
    .target 雷米
step
    #completewith BoarMeat1
    >>击杀|cRXP_ENEMY_石牙野猪|r，拾取|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,4,86,1 --Collect Chunk of Boar Meat (x4)
    .mob 石牙野猪
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_波尼斯|r和|cRXP_FRIENDLY_斯通菲尔德妈妈|r交谈
    .accept 85 >> 接取《丢失的项链》
    .target +波尼斯·斯通菲尔德姑妈
    .goto 1429/0,338.47,-9889.69
    .accept 88 >> 接取《公主必须死！》
	.goto 1429/0,332.43,-9894.99--c:Elwynn Forest,34.660,84.482
    .target +斯通菲尔德妈妈
step
    #completewith next
    >>击杀|cRXP_ENEMY_狗头人隧道工|r，拾取|cRXP_LOOT_金砂|r和|cRXP_LOOT_大蜡烛|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
    .mob 狗头人隧道工
step
    .goto 1429/0,38.38,-9923.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利|r交谈
    .turnin 85 >> 交还《丢失的项链》
    .accept 86 >> 接取《比利的馅饼》
    .target 比利·马科伦
step
    #label BoarMeat1
    .goto 1429/0,37.40,-10014.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝尔|r交谈（在屋内）
    .accept 106 >> 接取《年轻的恋人》
    .target 梅贝尔·马科伦
step
    .goto 1429/0,65.17,-10008.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_向他购买尽可能多的|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_|r
    .vendor 258 >>出售垃圾
    .target 乔舒·马科伦
step
    #completewith next
    >>击杀|cRXP_ENEMY_石牙野猪|r，拾取|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,4,86,1 --Collect Chunk of Boar Meat (x4)
    .mob 石牙野猪
step
    .goto 1429/0,499.72,-9930.05--c:Elwynn Forest,29.840,85.997
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托米|r交谈
    .turnin 106 >> 交还《年轻的恋人》
    .accept 111 >> 接取《托米的祖母》
    .target 托米·乔·斯通菲尔德
step
#loop
	.line Elwynn Forest,31.15,85.36,33.08,86.64,33.51,85.22,32.17,83.88,31.15,85.36
	.goto 1429/0,454.25,-9915.31,35,0
	.goto 1429/0,387.26,-9944.94,35,0
	.goto 1429/0,372.34,-9912.07,35,0
	.goto 1429/0,418.85,-9881.06,35,0
	.goto 1429/0,454.25,-9915.31,35,0
    >>击杀|cRXP_ENEMY_石牙野猪|r，拾取|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .collect 769,4,86,1 --Collect Chunk of Boar Meat (x4)
    .mob 石牙野猪
step
    .goto 1429/0,338.47,-9889.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t先与|cRXP_FRIENDLY_波尼斯|r交谈，再与屋内的|cRXP_FRIENDLY_米莱德|r交谈
    .turnin 86 >> 交还《比利的馅饼》
    .accept 84 >> 接取《比利的馅饼》
    .target +波尼斯·斯通菲尔德姑妈
    .goto 1429/0,338.47,-9889.69
    .turnin 111 >> 交还《托米的祖母》
    .accept 107 >> 接取《给威廉·匹斯特的信》
    .target +米莱德·斯通菲尔德
    .goto 1429/0,322.71,-9880.59
step
    #completewith next
    >>击杀|cRXP_ENEMY_狗头人隧道工|r，拾取|cRXP_LOOT_金砂|r和|cRXP_LOOT_大蜡烛|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
    .mob 狗头人隧道工
step
    .goto 1429/0,38.38,-9923.69
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_比利|r交谈
    .turnin 84 >> 交还《比利的馅饼》
    .accept 87 >> 接取《金牙》
    .target 比利·马科伦
step
    .goto 1429/0,65.17,-10008.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_乔舒|r交谈
    >>|cRXP_BUY_向他购买尽可能多的|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_|r
    .vendor 258 >>出售垃圾
    .target 乔舒·马科伦
    .itemcount 1179,<8
step
    #completewith Mine
    .goto 1429/0,181.79,-9843.79,15 >>进入法戈第矿洞
step
    #completewith Goldtooth
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r，拾取|cRXP_LOOT_金砂|r和|cRXP_LOOT_大蜡烛|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step
    #label Mine
    .goto 1429/0,179.36,-9811.39,12,0
    .goto 1429/0,157.15,-9789.40
    >>进入法戈第矿洞内一处较大的开阔区域
    .complete 62,1 --Scout Through the Fargodeep Mine
step
    #completewith next
    .goto 1429/0,148.82,-9763.71,12,0
    .goto 1429/0,132.16,-9752.60,12,0
    .goto 1429/0,87.04,-9745.65,40 >>前往|cRXP_ENEMY_金牙|r处
step
    #label Goldtooth
    .goto 1429/0,87.04,-9745.65
    >>击杀|cRXP_ENEMY_金牙|r，拾取|cRXP_LOOT_波尼斯的项链|r
    .complete 87,1 --Collect Bernice's Necklace (x1)
    .mob 金牙
step
#loop
	.line Elwynn Forest,39.14,82.87,39.16,84.79,37.81,85.40,36.76,83.19,38.02,81.70,39.14,82.87
	.goto 1429/0,176.93,-9857.68,35,0
	.goto 1429/0,176.24,-9902.12,35,0
	.goto 1429/0,223.09,-9916.240,35,0
	.goto 1429/0,259.54,-9865.09,35,0
	.goto 1429/0,215.81,-9830.600,35,0
	.goto 1429/0,176.93,-9857.68,35,0
    >>击杀|cRXP_ENEMY_狗头人隧道工|r和|cRXP_ENEMY_狗头人矿工|r，拾取|cRXP_LOOT_金砂|r和|cRXP_LOOT_大蜡烛|r
    .complete 47,1 --Collect Gold Dust (x10)
    .complete 60,1 --Collect Kobold Candle (x8)
    .mob 狗头人隧道工
    .mob 狗头人矿工
step << skip
    #completewith next
    .goto 1429/0,102.31,-9787.78,-1
    .goto 1429/0,86.34,-9756.30,-1
    .goto 1429/0,80.79,-9740.56,-1
    .goto 1429/0,141.88,-9794.03,-1
    .goto 1429/0,150.55,-9825.04,-1
    .goto 1429/0,117.23,-9819.95,-1
    .goto 1429/0,135.98,-9775.28,-1
    .goto 1429/0,171.38,-9339.44,30 >>|cRXP_WARN_在洞内跳上伐木机、悬空的原木、箱子或矿车灯，退出并重新登录，利用登出跳跃离开洞穴|r
    >>|cRXP_WARN_也可以跑回闪金镇|r
    >>|cRXP_WARN_注意：ItemRack 目前可能导致登出跳跃后游戏界面卡死。请禁用该插件，或制作可点击的 /reload 宏，在出现此问题时使用|r
    .link https://www.youtube.com/watch?v=SWBtPqm5M0Q >>|cRXP_WARN_点击此处了解如何进行登出跳跃|r
step
    #completewith next
    .subzone 87 >> 返回闪金镇
step
    .goto 1429/0,72.81,-9496.37
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_雷米|r交谈
    .turnin 47 >> 交还《金砂交易》
    .accept 40 >> 接取《鱼人的威胁》
    .target 雷米
step
    .goto 1429/0,74.02,-9465.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜汉|r交谈
    .turnin 40 >> 交还《鱼人的威胁》
    .accept 35 >> 接取《卫兵托马斯》
    .turnin 62 >> 交还《法戈第矿洞》
    .accept 76 >> 接取《玉石矿洞》
    .target 治安官杜汉
step
    .goto 1429/0,33.14,-9460.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t进入旅店时，隔墙与|cRXP_FRIENDLY_威廉|r交谈
    .turnin 60 >> 交还《狗头人的蜡烛》
    .accept 61 >> 接取《送往暴风城的货物》
    .turnin 107 >> 交还《给威廉·匹斯特的信》
    .accept 112 >> 接取《收集海藻》
    .target 威廉·匹斯特
step
    .goto 1429/0,16.20,-9462.65
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_法雷|r交谈
    >>|cRXP_BUY_向他购买 35 瓶|r|T132815:0|t[冰镇牛奶]|cRXP_BUY_|r
    .vendor >>出售垃圾
    .collect 1179,35,432,1 --Ice Cold Milk (35)
    .target 旅店老板法雷
step
    .goto 1429/0,9.64,-9465.36
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布洛葛|r交谈
    .vendor >>|cRXP_BUY_向他购买一个|r|T133634:0|t[棕色小包]|cRXP_BUY_|r
	.target 布洛葛·哈姆菲斯特
    .money <0.05
step
    #completewith next
    .goto 1429/0,34.63,-9466.28,10,0
    .goto 1429/0,47.12,-9456.10,12 >> 离开旅店
step
    .goto 1429/0,-215.62,-9390.60,50,0
    .goto 1429/0,-237.83,-9438.28,50,0
    .goto 1429/0,-292.32,-9442.91,50,0
    .goto 1429/0,-342.3,-9391.75,50,0
    .goto 1429/0,-459.62,-9402.63,50,0
    .goto 1429/0,-421.09,-9478.780
    >>击杀|cRXP_ENEMY_鱼人士兵|r和|cRXP_ENEMY_鱼人|r，拾取|cRXP_LOOT_水晶藻叶|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_鱼人士兵|r具有|r|T132307:0|t[移动速度提高]效果
    .complete 112,1 --Collect Crystal Kelp Frond (x4)
	.mob 鱼人士兵
	.mob 鱼人
step
    #completewith next
    .goto 1429/0,-604.70,-9188.53,12 >>进入玉石矿洞
step
    .goto 1429/0,-588.39,-9130.90,12,0
    .goto 1429/0,-570.68,-9116.32,12,0
    .goto 1429/0,-560.97,-9100.58
    >>沿洞穴中间的道路前进
    >>|cRXP_WARN_小心，|cRXP_ENEMY_狗头人地卜师|r会施放|r|T135812:0|t[火球术]|cRXP_WARN_（远程施法：造成约 30 点伤害）|r
    .complete 76,1 --Scout through the Jasperlode Mine
step
    #completewith next
    .goto 1429/0,-570.68,-9116.32,12,0
    .goto 1429/0,-588.39,-9130.90,12,0
    .goto 1429/0,-609.91,-9186.91,15 >>离开玉石矿洞
step
    .goto 1429/0,-1032.06,-9610.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯|r交谈
    .turnin 35 >> 交还《卫兵托马斯》
    .accept 37 >> 接取《失踪的卫兵》
    .accept 52 >> 接取《保卫边境》
    .target 卫兵托马斯
step
    #completewith next
    .goto 1429/0,-1063.89,-9494.980,45,0
    .goto 1429/0,-984.06,-9457.950,45,0
    .goto 1429/0,-950.05,-9347.31,50,0
    >>击杀沿途所有|cRXP_ENEMY_森林熊幼崽|r和|cRXP_ENEMY_觅食的灰狼|r
    .complete 52,2 --Kill Young Forest Bear (x5)
    .unitscan +森林熊幼崽
    .complete 52,1 --Kill Prowler (x8)
	.mob +觅食的灰狼
step
    .goto 1429/0,-986.14,-9335.97
	>>点击地上|cRXP_PICK_被吃掉一半的尸体|r
    >>|cRXP_WARN_需要施法 5 秒|r
    .turnin 37 >> 交还《失踪的卫兵》
    .accept 45 >> 接取《罗尔夫的下落》
step
    #completewith Bears
    .goto 1429/0,-1198.91,-9350.09,70,0
    >>击杀沿途所有|cRXP_ENEMY_森林熊幼崽|r和|cRXP_ENEMY_觅食的灰狼|r
    .complete 52,2 --Kill Young Forest Bear (x5)
    .unitscan +森林熊幼崽
    .complete 52,1 --Kill Prowler (x8)
	.mob +觅食的灰狼
step
    .goto 1429/0,-1289.22,-9469.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱琳|r交谈
    .accept 5545 >> 接取《木材危机》
    .target 管理员莱琳
step
    #completewith next
    >>拾取树脚下的|cRXP_PICK_一捆木柴|r
    >>|cRXP_WARN_需要施法 5 秒|r
    .complete 5545,1 --Collect Bundle of Wood (x8)
step
    .goto 1429/0,-1233.96,-9224.41,45 >> 前往|cRXP_PICK_罗尔夫的尸体|r处
    .isOnQuest 45
step
    .goto 1429/0,-1233.96,-9224.41
    >>击杀|cRXP_ENEMY_鱼人潜伏者|r和|cRXP_ENEMY_鱼人强盗|r，它们守在|cRXP_PICK_罗尔夫的尸体|r旁
    >>|cRXP_WARN_你可能需要先击杀一只，再脱战重置|r
    >>小心，|cRXP_ENEMY_鱼人潜伏者|r会施放|T132090:0|t[背刺]|cRXP_WARN_（近战瞬发：从背后攻击造成双倍伤害），而|cRXP_ENEMY_鱼人强盗|r会施放|r|T135915:0|t[喝下初级药水]|cRXP_WARN_（对自身施法：恢复约 65 点生命值）|r
	>>点击地上的|cRXP_PICK_罗尔夫的尸体|r
    >>|cRXP_WARN_需要施法 5 秒|r
    .turnin 45 >> 交还《罗尔夫的下落》
    .accept 71 >> 接取《回复托马斯》
step
#loop
	.line Elwynn Forest,80.48,55.18,80.88,53.88,79.68,52.31,80.86,52.17,80.88,53.88,80.48,55.18,79.76,56.70,80.15,60.03,80.24,61.46,81.27,61.59,81.58,62.64,82.79,60.12,83.25,61.12,83.48,59.19,81.77,59.17,80.48,55.18
	.goto 1429/0,-1257.91,-9216.77,35,0
	.goto 1429/0,-1271.79,-9186.68,35,0
	.goto 1429/0,-1230.14,-9150.34,35,0
	.goto 1429/0,-1271.10,-9147.10,35,0
	.goto 1429/0,-1271.79,-9186.68,35,0
	.goto 1429/0,-1257.91,-9216.77,35,0
	.goto 1429/0,-1232.92,-9251.950,35,0
	.goto 1429/0,-1246.46,-9329.03,35,0
	.goto 1429/0,-1249.58,-9362.13,35,0
	.goto 1429/0,-1285.33,-9365.14,35,0
	.goto 1429/0,-1296.09,-9389.44,35,0
	.goto 1429/0,-1338.09,-9331.11,35,0
	.goto 1429/0,-1354.05,-9354.26,35,0
	.goto 1429/0,-1362.03,-9309.59,35,0
	.goto 1429/0,-1302.68,-9309.12,35,0
	.goto 1429/0,-1257.91,-9216.77,35,0
    >>拾取树脚下的|cRXP_PICK_一捆木柴|r
    >>|cRXP_WARN_需要施法 5 秒|r
    .complete 5545,1 --Collect Bundle of Wood (x8)
step
    .goto 1429/0,-1289.22,-9469.80
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_莱琳|r交谈
    .turnin 5545 >> 交还《木材危机》
    .target 管理员莱琳
step
    #label Bears
    .goto 1429/0,-1222.40,-9531.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉|r交谈
    .accept 83 >> 接取《红色亚麻布》
    .target 萨拉·迪博雷恩
step
    .goto 1429/0,-1069.44,-9618.58,0
    .goto 1429/0,-1063.89,-9494.980,45,0
    .goto 1429/0,-1093.74,-9665.57,45,0
    .goto 1429/0,-1125.32,-9714.41,45,0
    .goto 1429/0,-1215.91,-9778.29,45,0
    .goto 1429/0,-1295.74,-9718.34,45,0
    .goto 1429/0,-1063.89,-9494.980,45,0
    .goto 1429/0,-1093.74,-9665.57,45,0
    .goto 1429/0,-1125.32,-9714.41,45,0
    .goto 1429/0,-1215.91,-9778.29,45,0
    .goto 1429/0,-1295.74,-9718.34
    >>击杀沿途所有|cRXP_ENEMY_森林熊幼崽|r和|cRXP_ENEMY_觅食的灰狼|r
    >>|cRXP_WARN_对|cRXP_ENEMY_森林熊幼崽|r和|cRXP_ENEMY_觅食的灰狼|r造成 51%+ 的伤害，再将它们拉到|cRXP_FRIENDLY_暴风城卫兵|r处，让卫兵帮忙击杀以提高效率|r
    .complete 52,2 --Kill Young Forest Bear (x5)
    .complete 52,1 --Kill Prowler (x8)
    .unitscan 森林熊幼崽
    .mob 觅食的灰狼
step
    .goto 1429/0,-1032.06,-9610.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯|r交谈
    .turnin 52 >> 交还《保卫边境》
    .turnin 71 >> 交还《回复托马斯》
    .accept 39 >> 接取《托马斯的报告》
    .accept 109 >> 接取《向格里安·斯托曼报到》
    .target 卫兵托马斯
    .xp <9,1
step
    .goto 1429/0,-1032.06,-9610.23
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_托马斯|r交谈
    .turnin 52 >> 交还《保卫边境》
    .turnin 71 >> 交还《回复托马斯》
    .accept 39 >> 接取《托马斯的报告》
    .target 卫兵托马斯
step
#loop
	.line Elwynn Forest,70.45,76.94,68.68,76.69,68.23,77.78,67.80,80.76,68.49,82.68,70.71,81.48,70.63,80.66,71.51,78.96,70.95,77.25,71.38,76.77,70.95,77.25,70.45,76.94
	.goto 1429/0,-909.79,-9720.42,40,0
	.goto 1429/0,-848.35,-9714.64,40,0
	.goto 1429/0,-832.73,-9739.87,40,0
	.goto 1429/0,-817.81,-9808.84,40,0
	.goto 1429/0,-841.76,-9853.28,40,0
	.goto 1429/0,-918.81,-9825.51,40,0
	.goto 1429/0,-916.03,-9806.53,40,0
	.goto 1429/0,-946.58,-9767.18,40,0
	.goto 1429/0,-927.14,-9727.60,40,0
	.goto 1429/0,-942.06,-9716.49,40,0
	.goto 1429/0,-927.14,-9727.60,40,0
	.goto 1429/0,-909.79,-9720.42,40,0
    >>击杀|cRXP_ENEMY_迪菲亚强盗|r，拾取|cRXP_LOOT_红色亚麻面罩|r和|T134939:0|t[|cRXP_LOOT_西部荒野地契|r]
    >>|cRXP_WARN_使用|T134939:0|t[|cRXP_LOOT_西部荒野地契|r]接取任务|r
    .complete 83,1 --Collect Red Linen Bandana (x6)
    .collect 1972,1,184,1 --Collect Westfall Deed (x1)
    .disablecheckbox
	.mob 迪菲亚强盗
    .isOnQuest 83
step
    #label Deed
    >>|cRXP_WARN_使用|T134939:0|t[|cRXP_LOOT_西部荒野地契|r]接取任务|r
    .use 1972
    .accept 184 >> 接取《法布隆的地契》
    .itemcount 1972,1
step
    .goto 1429/0,-890.35,-9780.14
    >>击杀|cRXP_ENEMY_公主|r，拾取|cRXP_LOOT_黄铜项圈|r
    >>|cRXP_WARN_记得利用栅栏风筝她|r
    .complete 88,1 --Collect Brass Collar (x1)
    .mob 公主
step
    .goto 1429/0,-1222.40,-9531.76
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_萨拉|r交谈
    .turnin 83 >> 交还《红色亚麻布》
    .target 萨拉·迪博雷恩
    .isQuestComplete 83
step << skip
    .goto 1433/0,-1779.67,-9608.23
    .zone Redridge Mountains >> 进入赤脊山
    .isOnQuest 88
step << skip
    #completewith next
    +|cRXP_WARN_小心沿道路前往|cRXP_FRIENDLY_艾蕾娜|r处，避开沿途的|cRXP_ENEMY_狼蛛|r和|cRXP_ENEMY_黑龙雏龙|r|r
    .mob 黑龙雏龙
    .mob 狼蛛
step << skip
    .goto 1433/0,-2234.89,-9435.21
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜|r交谈
    .fp Redridge Mountains >> 开通赤脊山飞行点
    .target 艾蕾娜·斯托姆法瑟
step
    #completewith next
    .hs >> 使用炉石返回闪金镇
step
    .goto 1429/0,33.14,-9460.75
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_威廉|r交谈
    .turnin 112 >> 交还《收集海藻》
    .accept 114 >> 接取《梅贝尔的隐形水》
    .target 威廉·匹斯特
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜汉|r和|cRXP_FRIENDLY_阿古斯|r交谈
    .turnin 39 >> 交还《托马斯的报告》
    .turnin 76 >> 交还《玉石矿洞》
    .accept 239 >> 接取《西泉要塞》
    .accept 109 >> 接取《向格里安·斯托曼报到》
    .target +治安官杜汉
    .goto 1429/0,74.02,-9465.52
    .accept 1097 >> 接取《艾尔默的任务》
    .target +铁匠阿古斯
    .goto 1429/0,87.87,-9456.65
step
    .goto 1429/0,37.40,-10014.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梅贝尔|r交谈（在屋内）
    .turnin 114 >> 交还《梅贝尔的隐形水》
    .target 梅贝尔·马科伦
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯通菲尔德妈妈|r和|cRXP_FRIENDLY_波尼斯|r交谈
    .turnin 88,3 >> 交还《公主必须死！》
    .target +斯通菲尔德妈妈
    .goto 1429/0,332.43,-9894.99--c:Elwynn Forest,34.660,84.482
    .turnin 87 >> 交还《金牙》
    .goto 1429/0,338.47,-9889.69
    .target +波尼斯·斯通菲尔德姑妈
step
#loop
	.line Elwynn Forest,31.15,85.36,33.08,86.64,33.51,85.22,32.17,83.88,31.15,85.36
	.goto 1429/0,454.25,-9915.31,35,0
	.goto 1429/0,387.26,-9944.94,35,0
	.goto 1429/0,372.34,-9912.07,35,0
	.goto 1429/0,418.85,-9881.06,35,0
	.goto 1429/0,454.25,-9915.31,35,0
    .xp 9+4825 >> 刷怪，直到9级经验值达到 4825+/6500
    .mob 石牙野猪
    .isOnQuest 184
step
#loop
	.line Elwynn Forest,31.15,85.36,33.08,86.64,33.51,85.22,32.17,83.88,31.15,85.36
	.goto 1429/0,454.25,-9915.31,35,0
	.goto 1429/0,387.26,-9944.94,35,0
	.goto 1429/0,372.34,-9912.07,35,0
	.goto 1429/0,418.85,-9881.06,35,0
	.goto 1429/0,454.25,-9915.31,35,0
    .xp 9+4825 >> 刷怪，直到9级经验值达到 4825+/6500
    .mob 石牙野猪
    .itemcount 1972,<1
step
    .goto 1429/0,694.43,-9662.79
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_瑞尼尔|r交谈
    .turnin 239 >> 交还《西泉要塞》
    .target 瑞尼尔副队长
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜|r交谈
    .accept 64 >> 接取《遗失的怀表》
    .turnin 184 >> 交还《法布隆的地契》
    .target +农夫法布隆
    .goto 1436/0,918.42,-9851.50
    .accept 36 >> 接取《杂味炖肉》
    .accept 151 >> 接取《老马布兰契》
    .goto 1436/0,919.82,-9852.90
    .target +弗娜·法布隆
    .isOnQuest 184
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫法布隆|r和|cRXP_FRIENDLY_弗娜|r交谈
    .accept 64 >> 接取《遗失的怀表》
    .target +农夫法布隆
    .goto 1436/0,918.42,-9851.50
    .accept 36 >> 接取《杂味炖肉》
    .accept 151 >> 接取《老马布兰契》
    .target +弗娜·法布隆
    .goto 1436/0,919.82,-9852.90
step
    #completewith next
    >>打开地上的|cRXP_PICK_燕麦袋|r，拾取|cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_需要施法 5 秒|r
    .complete 151,1 --Handful of Oats (8)
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t先与|cRXP_FRIENDLY_农夫萨丁|r交谈，再与屋内的|cRXP_FRIENDLY_萨尔玛|r交谈
    .accept 9 >>接取《清理荒野》
    .target +农夫萨丁
    .goto 1436/0,1055.27,-10128.70
    .turnin 36 >> 交还《杂味炖肉》
    .accept 38 >> 接取《杂味炖肉》
    .accept 22 >> 接取《猪肝馅饼》
    .target +萨尔玛·萨丁
    .goto 1436/0,1041.97,-10112.13
step
    #completewith next
    >>|cRXP_WARN_途中务必小心|cRXP_ENEMY_看守傀儡|r和|cRXP_ENEMY_麦田傀儡|r|r
    .goto 1436/0,1045.12,-10508.80,20 >>前往|cRXP_FRIENDLY_格里安|r处
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t先与|cRXP_FRIENDLY_格里安|r、|cRXP_FRIENDLY_丹努文|r交谈，再与屋内的|cRXP_FRIENDLY_刘易斯|r交谈
    .turnin 109 >> 交还《向格里安·斯托曼报到》
    .accept 12 >> 接取《西部荒野人民军》
    .target +格里安·斯托曼
    .goto 1436/0,1045.12,-10508.80
    .accept 102 >> 接取《西部荒野的豺狼人》
    .target +丹努文队长
    .goto 1436/0,1041.97,-10511.13
    .accept 6181 >> 接取《快递消息》
    .goto 1436/0,1021.60,-10500.61
    .target +军需官刘易斯
step
    .goto 1436/0,1037.07,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .turnin 6181 >> 交还《快递消息》
    .accept 6281 >> 接取《赶赴暴风城》
    .target 索尔
step
    #completewith next
    .goto 1436/0,1037.07,-10628.27
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >> 飞往暴风城
	.target 索尔
step
    #completewith next
    .goto 1453/0,532.74,-8863.09,20,0
    .goto 1453/0,599.55,-8811.28,20,0
    .goto 1453/0,613.93,-8833.07,20,0
    .goto 1453/0,620.79,-8859.6,12,0
    .goto 1453/0,625.49,-8857.89,12 >>前往|cRXP_FRIENDLY_摩根|r处
step
    .goto 1453/0,625.49,-8857.890
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_摩根|r交谈
    .turnin 61,1 >> 交还《送往暴风城的货物》
    .target 摩根·匹斯特
step
    .goto 1453/0,635.44,-8863.81
    >>与|cRXP_FRIENDLY_凯德雷克|r交谈
    .vendor 1257 >> |cRXP_BUY_向他购买|r|T134830:0|t[次级治疗药水]|cRXP_BUY_（如果有货）|r
    .target 凯德雷克·布舍尔
step << skip
    #completewith next
    .goto 1453/0,686.25,-8815.41,8,0
    .goto 1453/0,684.24,-8820.34,4,0
    .goto 1453/0,687.46,-8818.01,6,0
    .goto 1453/0,854.42,-8965.28,12,0
    >>|cRXP_WARN_跳上火把，再跳下去进入暴风城地下|r
    >>|cRXP_WARN_将阴影设为“普通”或“低”，站在蓝色虚空前的地形定位点 Derek the Dinosaur 双脚之间的中点（土色较浅的位置），然后径直向前走|r
    .goto 1453/0,861.95,-8990.47,10 >>前往|cRXP_FRIENDLY_詹妮亚|r处
step << skip
    .goto 1453/0,861.95,-8990.47
    >>与|cRXP_FRIENDLY_詹妮亚|r交谈
    .trainer >> 学习职业法术（霜甲术等级 2、冰霜新星、变形术、造水术等级 1 和等级 2）
    >>总花费：15 银币
    >>记得预留治疗药水（每瓶 3 银币）、青铜管（每根 8 银币）和 5 级食物（20 铜币可买 5 个）的费用
    .target 詹妮亚·坎农
step << skip
    #completewith next
    .goto 1453/0,893.0,-9021.93,6 >>穿过绿色传送门
step
    #completewith next
    .goto 1453/0,610.44,-8809.04,10,0
    .goto 1453/0,599.01,-8797.84,12,0
    .goto 1453/0,603.85,-8769.42,12,0
    .goto 1453/0,573.74,-8741.37,12,0
    .goto 1453/0,473.05,-8699.06,12,0
    .goto 1453/0,426.4,-8714.66,12,0
    .goto 1453/0,382.04,-8702.11,12 >>前往|cRXP_FRIENDLY_奥斯瑞克|r处
step
    .goto 1453/0,382.04,-8702.11
    >>与|cRXP_FRIENDLY_奥斯瑞克|r交谈
    .turnin 6281 >> 交还《赶赴暴风城》
    .accept 6261 >> 接取《杜加尔·朗德瑞克》
    .target 奥斯瑞克·斯图恩
step
    #completewith next
    .goto 1453/0,450.74,-8644.11,15,0
    .goto 1453/0,479.91,-8639.81,15,0
    .goto 1453/0,514.05,-8608.26,15,0
    .goto 1453/0,507.6,-8541.66,15,0
    .goto 1453/0,683.43,-8397.08,12,0
    .goto 1453/0,685.18,-8387.13,12 >>前往|cRXP_FRIENDLY_格瑞曼德|r处
step
    .goto 1453/0,685.18,-8387.13
    >>与|cRXP_FRIENDLY_格瑞曼德|r交谈
    .turnin 1097 >> 交还《艾尔默的任务》
    .accept 353 >> 接取《雷矛的包裹》
    .target 格瑞曼德·艾尔默
step
    .goto 1453/0,638.26,-8342.22
    >>与|cRXP_FRIENDLY_比利巴布|r交谈
    .vendor 5519 >>|cRXP_BUY_如果有货，向他购买一根|r|T133024:0|t[青铜管]|cRXP_BUY_|r
    .target 比利巴布·旋轮
    .itemcount 4371,<1
    .money <0.08
step
    #completewith next
    .goto 1453/0,522.12,-8352.80,20 >> 前往矿道地铁
step
    #completewith next
    +乘坐矿道地铁前往铁炉堡；稍后向|cRXP_FRIENDLY_丁克|r学习|T132794:0|t[造水术等级 2]
step
    #label Monty
    .goto 1455/0,-1317.71,-4839.48,30,0
    >>乘坐地铁后，与|cRXP_FRIENDLY_蒙提|r交谈
    .accept 6661 >> 接取《捕捉矿道老鼠》
    .target 蒙提
step
    >>使用|T133942:0|t[捕鼠者之笛]，对矿道地铁内的|cRXP_FRIENDLY_矿道老鼠|r施放
    .complete 6661,1 --Rats Captured (x5)
    .target 矿道老鼠
    .use 17117
step
    >>与|cRXP_FRIENDLY_蒙提|r交谈
--  >>|cRXP_WARN_Wait out the RP|r
    .turnin 6661 >> 交还《捕捉矿道老鼠》
    .target 蒙提
    .zoneskip Stormwind City
step
    .zone Ironforge >> 进入铁炉堡
step
    .goto 1455/0,-1249.87,-4793.31
    >>与|cRXP_FRIENDLY_考格斯宾|r交谈
    .vendor 5175 >>|cRXP_BUY_如果有货，向他购买一根|r|T133024:0|t[青铜管]|cRXP_BUY_|r
    .target 考格斯宾
    .itemcount 4371,<1
    .isQuestAvailable 174
step
    #completewith next
    .goto 1455/0,-1266.48,-4749.31,30,0
    .goto 1455/0,-1211.92,-4728.00,30,0
    .goto 1455/0,-1170.41,-4754.48,30,0
    .goto 1455/0,-1152.31,-4821.12,10 >>前往|cRXP_FRIENDLY_格莱斯|r处
step
    .goto 1455/0,-1152.39,-4820.914
    >>与|cRXP_FRIENDLY_格莱斯|r交谈
    .fp Ironforge >> 开通铁炉堡飞行点
    .target 格莱斯·瑟登
step
    #completewith next
    .goto 1455/0,-1101.87,-4864.81,30,0
    .goto 1455/0,-1062.10,-4815.100,20,0
    .goto 1455/0,-1036.48,-4804.50,20,0
    .goto 1455/0,-992.68,-4742.08,20,0
    .goto 1455/0,-931.8,-4627.59,20,0
    .goto 1455/0,-928.40,-4614.51,10 >>前往|cRXP_FRIENDLY_丁克|r处
step
    .goto 1455/0,-928.40,-4614.51
    >>与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >> 学习职业法术（霜甲术等级 2、冰霜新星、变形术、造水术等级 1 和等级 2）
    >>总花费：15 银币
    >>记得预留治疗药水（每瓶 3 银币）、青铜管（每根 8 银币）和 5 级食物（20 铜币可买 5 个）的费用
    .target 丁克
step
    #completewith next
    .goto 1455/0,-929.04,-4636.72,20,0
    .goto 1455/0,-892.19,-4770.42,20,0
    .goto 1455/0,-874.88,-4849.87,20,0
    >>进入建筑内
    .goto 1455/0,-857.01,-4840.69,10 >>前往|cRXP_FRIENDLY_洛雷·火酒|r处
step
    #label IFHS
    .goto 1455/0,-857.01,-4840.69
    >>与|cRXP_FRIENDLY_洛雷·火酒|r交谈
    .home >> 将炉石绑定在铁炉堡
    .target 旅店老板洛雷·火酒
step
    #completewith BankDeposit
    .goto 1455/0,-974.89,-4902.21,20,0
    .goto 1455/0,-997.66,-4886.49,30 >>进入铁炉堡银行
step
    #label BankDeposit
    .goto 1455/0,-997.66,-4886.49
    >>与|cRXP_FRIENDLY_拜雷|r交谈
    .bankdeposit 4371,16115 >> 将下列物品存入银行：
    >>|T133024:0|t[青铜管]
    >>|T132763:0|t[奥斯瑞克的箱子]
    .target 拜雷·石衣
step << skip
    .goto 1455/0,-1000.98,-4874.62
    .goto 1426/0,-809.64,-5049.56,10 >>|cRXP_WARN_跳上金库两侧的顶部。利用登出跳跃前往丹莫罗|r
    .isQuestAvailable 314
step
    .goto 1455/0,-833.45,-5021.400,20,0
    .goto 1426/0,-1145.04,-5504.30
    .zone Dun Morogh >> 离开铁炉堡
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#forever
#disabledungeons
<< Human Mage
#name 10-11 ADV Dun Morogh Human Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none Human Mage
#next 10-12 ADV Darkshore 1 Mage AoE
#displayname 10-11 丹莫罗（人类法师进阶 AoE）
step
    #completewith Rudra
    #label Dirt
    .goto 1426/0,-1145.04,-5504.30,40,0
    .goto 1426/0,-1219.90,-5422.55,40 >>沿土路上行
    .isQuestAvailable 314
step
    #completewith next
    #requires Dirt
    +|cRXP_WARN_将|cRXP_ENEMY_瓦加什|r一路风筝下行至|r|cRXP_FRIENDLY_鲁德拉·冻石|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >>|cRXP_WARN_遇到困难时点击此处|r
    .mob 瓦加什
step
    #label Rudra
    .goto 1426/0,-1304.61,-5513.82
    >>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >> 接任务：保护牲畜
    .target 鲁德拉·冻石
step
    .goto 1426/0,-1279.49,-5392.01,0
    .goto 1426/0,-1289.83,-5669.780,40,0
    .goto 1426/0,-1291.80,-5706.89
    >>击杀|cRXP_ENEMY_瓦加什|r，并拾取掉落的|cRXP_LOOT_瓦加什的牙齿|r
    >>|cRXP_WARN_将|cRXP_ENEMY_瓦加什|r风筝到牧场南侧的|cRXP_FRIENDLY_丹莫罗巡山人|r那里，确保对它造成至少51%的伤害|r
    >>|cRXP_WARN_记得获取冻土岭的探索经验；方便的话，把|cRXP_ENEMY_雪豹|r也风筝到|cRXP_FRIENDLY_丹莫罗巡山人|r那里|r
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob 瓦加什
step
    .goto 1426/0,-1304.61,-5513.82
    >>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314,3 >> 交任务：保护牲畜
    .target 鲁德拉·冻石
step
    #completewith Ghilm
    +|cRXP_WARN_记得保留练级时获得的|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_，后续把|r |T133971:0|t[烹饪]|cRXP_WARN_提升到50点时需要用到|r
step
    #completewith next
    .goto 1426/0,-1465.16,-5548.96,50,0
    .goto 1426/0,-1533.13,-5638.92,30,0
    +|cRXP_WARN_将|cRXP_ENEMY_冰爪熊|r风筝到|cRXP_FRIENDLY_铁炉堡巡山人|r那里（确保造成至少51%的伤害以获得击杀归属）|r
    >>|cRXP_WARN_小心，它们会施放|r |T135853:0|t[冰爪]|cRXP_WARN_（瞬发近战攻击：额外造成4点近战伤害）|r
    .mob 冰爪熊
step
    #sticky
    #label Ghilm
    .goto 1426/0,-1566.62,-5664.86,0,0
    >>与|cRXP_FRIENDLY_厨师格瑞姆|r交谈
    .train 2550 >> 学习 |T133971:0|t[烹饪]
    .target 厨师格瑞姆
step
    .goto 1426/0,-1568.09,-5665.19,8,0
    .goto 1426/0,-1573.02,-5671.10
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买15个|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,15,432,1 --Ice Cold Milk (15)
    .target 卡杉·莫格什
    .money <0.0395
step
    .goto 1426/0,-1568.09,-5665.19,8,0
    .goto 1426/0,-1573.02,-5671.10
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买10个|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,10,432,1 --Ice Cold Milk (10)
    .target 卡杉·莫格什
    .money <0.0260
step
    .goto 1426/0,-1568.09,-5665.19,8,0
    .goto 1426/0,-1573.02,-5671.10
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
    .goto 1426/0,-1579.91,-5714.77
    .accept 432 >> 接任务：该死的石腭怪！
    .goto 1426/0,-1600.30,-5726.590
    .target +工头乔尼·石眉
step
    #completewith Bonesnappers
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    >>|cRXP_WARN_无需特意绕路击杀它们|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
step
    #completewith next
    .goto 1426/0,-1681.86,-5723.30,30 >>进入洞穴
step
    #label Bonesnappers
    .goto 1426/0,-1693.68,-5660.26,40,0
    .goto 1426/0,-1686.29,-5622.83,40,0
    .goto 1426/0,-1740.96,-5534.51,40,0
    .goto 1426/0,-1771.00,-5568.000,40,0
    .goto 1426/0,-1774.45,-5602.80
    >>击杀洞穴内的|cRXP_ENEMY_石腭断骨者|r
    >>|cRXP_WARN_小心，它们会施放|r |T132154:0|t[击倒]|cRXP_WARN_（瞬发近战攻击：使你昏迷2秒）|r
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob 石腭断骨者
step
    .goto 1426/0,-1681.86,-5723.30,30,0
#loop
	.line Dun Morogh,69.93,57.29,70.57,58.61,69.68,59.37,68.36,59.57,69.16,57.51,69.93,57.29
	.goto 1426/0,-1641.97,-5758.11,30,0
	.goto 1426/0,-1673.49,-5801.45,30,0
	.goto 1426/0,-1629.66,-5826.40,30,0
	.goto 1426/0,-1564.65,-5832.97,30,0
	.goto 1426/0,-1604.05,-5765.33,30,0
	.goto 1426/0,-1641.97,-5758.11,30,0
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
step
    #sticky
    #label Frast
    .goto 1426/0,-1589.76,-5714.44,0,0
    >>与|cRXP_FRIENDLY_弗拉斯特·多克南|r交谈
    .vendor >> 出售杂物
    .target 弗拉斯特·多克南
    .isQuestAvailable 419
step
    >>与|cRXP_FRIENDLY_工头乔尼·石眉|r和|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 432 >> 交任务：该死的石腭怪！
    .target +工头乔尼·石眉
    .goto 1426/0,-1600.30,-5726.590
    .turnin 433 >> 交任务：公众之仆
    .goto 1426/0,-1579.91,-5714.77
    .target +参议员梅尔·圣石
step
    #requires Frast
    .goto 1426/0,-1612.42,-5698.02
    >>与|cRXP_FRIENDLY_丹克|r交谈
    .train 2575 >> 学习专业技能：|T136248:0|t[采矿]
    .target 丹克·利刃
step
    #label Shortcut1
    #completewith Pilot
    .goto 1426/0,-1662.65,-5692.11,5,0
    .link https://youtu.be/G2IscpFZVeQ?t=4034 >>|cRXP_WARN_遇到困难时点击此处|r
    .goto 1426/0,-1671.03,-5674.71,12 >>从|cRXP_FRIENDLY_丹克|r身后的近路上山
step
    #completewith Pilot
    #requires Shortcut1
    #label Shortcut2
    .goto 1426/0,-1693.19,-5541.730,50,0
    .goto 1426/0,-1788.24,-5511.85,50,0
    .goto 1426/0,-1995.58,-5480.01,50 >>|cRXP_WARN_将附近的|cRXP_ENEMY_石腭伏击者|r风筝到路上巡逻的|cRXP_FRIENDLY_铁炉堡巡山人|r那里（确保造成至少51%的伤害以获得击杀归属）|r
    .mob 石腭伏击者
    .unitscan 铁炉堡巡山人
step
    #requires Shortcut2
    #completewith next
    .goto 1426/0,-2198.49,-5277.75,50,0
    .goto 1426/0,-2286.16,-5200.59,30 >>风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r穿过隧道
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（瞬发自身技能：提高移动速度，持续3秒；命中时造成40–100点近战伤害，只能在远处施放）|r
    .mob 有伤疤的峭壁野猪
step
    #label Pilot
    .goto 1426/0,-2329.50,-5163.82
    >>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >> 接任务：失踪的驾驶员
    .target 驾驶员塞克·锤足
step
    .goto 1426/0,-2205.39,-5092.57,30,0
    .goto 1426/0,-2121.66,-5064.66
    >>点击地面上的|cRXP_PICK_矮人尸体|r
    >>|cRXP_WARN_确保背包里有空位；如果不接取下一个任务，|cRXP_ENEMY_癞爪|r就不会下来|r
    >>|cRXP_WARN_记得把|r|cRXP_ENEMY_癞爪|r|cRXP_WARN_风筝回|r|cRXP_FRIENDLY_驾驶员塞克·锤足|r|cRXP_WARN_身边|r
    .turnin 419 >> 交任务：失踪的驾驶员
    .accept 417 >> 接任务：驾驶员的复仇
step
    .goto 1426/0,-2059.61,-5118.180,60,0
    .goto 1426/0,-2329.50,-5163.82
    >>击杀|cRXP_ENEMY_癞爪|r，并拾取掉落的|cRXP_LOOT_肮脏的爪子|r
    >>|cRXP_WARN_一路把它风筝到|cRXP_FRIENDLY_驾驶员塞克·锤足|r身边（记得造成至少51%的伤害以获得击杀归属）|r
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob 癞爪
    .target 驾驶员塞克·锤足
step
    .goto 1426/0,-2329.60,-5163.76
    >>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 417,1 >> 交任务：驾驶员的复仇
    .target 驾驶员塞克·锤足
step
    #label Tunnel1
    #completewith Cobbleflint
    .goto 1426/0,-2286.16,-5200.59,30,0
    .goto 1426/0,-2198.49,-5277.75,30 >>穿过隧道原路返回
step
    #requires Tunnel1
    #completewith Cobbleflint
    .goto 1426/0,-2118.71,-5516.78,20,0
    .goto 1426/0,-2192.09,-5510.87,20,0
    .goto 1426/0,-2216.72,-5519.08,20,0
    .goto 1426/0,-2314.72,-5491.83,20,0
    >>沿途风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r
    .goto 1426/0,-2347.72,-5483.62,20 >>执行跳山操作，记得小心落下
    .mob 有伤疤的峭壁野猪
step
    .goto 1432/0,-2518.11,-5625.83
    >>风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r穿过隧道
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（瞬发自身技能：提高移动速度，持续3秒；命中时造成40–100点近战伤害，只能在远处施放）|r
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
    .goto 1432/0,-2602.54,-5832.73
    >>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >> 接任务：保卫国王的领土
    .target 巡山人库伯弗林特
step
    #optional
    #completewith next
    .goto 1432/0,-2635.61,-5879.14,12,0
    .goto 1432/0,-2645.27,-5874.91,12,0
    .goto 1432/0,-2631.48,-5847.50,12 >> 进入地堡，前往顶层
step
    #label Rugelfuss
    .goto 1432/0,-2634.59,-5842.81
    >>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .accept 267 >> 接任务：穴居人的威胁
    .target 拉格弗斯上尉
step << skip
    #completewith next
    .goto 1432/0,-2586.52,-5740.99,20,0
    .goto 1432/0,-2569.14,-5673.30,20,0
    .goto 1432/0,-2531.62,-5638.34,30 >>返回隧道
step << skip
    .goto 1432/0,-2513.42,-5618.48
    .link https://www.youtube.com/watch?v=AOAlX9B5aO0 >>|cRXP_WARN_遇到困难时点击此处|r
    .goto 1432/0,-2881.66,-5351.18,30 >>|cRXP_WARN_从隧道里的火盆处起跳，通过重新登录传送到塞尔萨玛|r
    .isOnQuest 267
step
    #completewith next
    .subzone 144 >> 前往塞尔萨玛
step
    .goto 1432/0,-2902.07,-5398.28,40,0
    .goto 1432/0,-2945.10,-5360.20,40,0
    .goto 1432/0,-3015.71,-5335.73,40,0
    .goto 1432/0,-3025.09,-5318.44,40,0
    .goto 1432/0,-3017.64,-5274.66
    >>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_沿塞尔萨玛主路巡逻|r
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    #completewith next
    .goto 1432/0,-2929.93,-5424.95
    >>与|cRXP_FRIENDLY_索格拉姆|r交谈
    .fp Thelsamar >> 获取塞尔萨玛飞行点
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
step
    .zone Ironforge >> 前往铁炉堡
step << skip
    #completewith next
    .goto 1455/0,-1060.12,-4883.59,20,0
    .goto 1455/0,-1016.16,-4946.11,20,0
    .goto 1455/0,-980.03,-4971.49,10 >>|cRXP_WARN_前往重新登录传送的位置|r
step << skip
    .goto 1455/0,-980.03,-4971.49
    .zone Dun Morogh >>|cRXP_WARN_调整角色位置，直到看起来像是漂浮在金属栏杆边缘，然后通过重新登录传送返回丹莫罗|r
    .isOnQuest 416
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#forever
#disabledungeons
<< Gnome Mage
#name 1-10 ADV Dun Morogh Gnome Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none Gnome Mage
#next 10-12 ADV Darkshore 1 Mage AoE
#displayname 1-10 丹莫罗（侏儒法师进阶 AoE）
step << !Gnome Mage
    #season 2
    #completewith next
    +在探索季中，法师应从本种族出生区域开始，否则无法在当地获得第一个符文（|T133816:0|t[铭刻手套 - 冰枪术]）
step
    #completewith next
    +你已选择高级指南。这是为游戏中升级最快的职业（联盟法师）提供的最快路线，因此会使用大量小众机制，并包含高难度的 AoE 拉怪操作。在学习过程中保持耐心与毅力！祝你好运！
step
    #completewith Adlin
	.destroy 6948 >> 暂时删除背包里的 |T134414:0|t[炉石]；稍后在雷酒酿制厂重新绑定时补领
step
    .goto 1426/0,328.18,-6214.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .accept 179 >> 接任务：矮人的交易
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
    .goto 1426/0,320.30,-6226.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    >>出售杂物
    >>|cRXP_BUY_购买15瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_如果钱不够，就额外刷|cRXP_ENEMY_蓬毛幼狼|r|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
    .xp >6,1
step
    #season 2
    .goto 1426/0,320.30,-6226.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾德林·怒流|r交谈
    >>出售杂物
    >>|cRXP_BUY_购买15瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    >>|cRXP_WARN_如果钱不够，就额外刷|cRXP_ENEMY_蓬毛幼狼|r|r
    >>|cRXP_WARN_记得留 10 铜币备用|r
    .collect 159,15 --Collect Refreshing Spring Water (x15)
    .target 艾德林·怒流
    .xp >6,1
step
    #xprate <1.1
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r、|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 179,3 >> 交任务：矮人的交易
    .accept 233 >> 接任务：寒脊山谷的送信任务
    .accept 3114 >> 接任务：雕文备忘录
    .target +斯登·粗臂
    .goto 1426/0,328.18,-6214.85
    .accept 170 >> 接任务：新的威胁
    .goto 1426/0,338.87,-6216.46
    .target +巴尔林·霜锤
step
    #xprate >1.09
    .goto 1426/0,328.18,-6214.85
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯登·粗臂|r交谈
    .turnin 179,3 >> 交任务：矮人的交易
    .accept 233 >> 接任务：寒脊山谷的送信任务
    .accept 3114 >> 接任务：雕文备忘录
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
    .goto 1426/0,485.48,-6259.21
    >>打开地面上的|cRXP_PICK_石颚手提箱|r，拾取 |T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r
    >>|cRXP_WARN_注意：你无法在这里学习|r |T133816:0|t[铭刻手套 - 冰枪术]|cRXP_WARN_，因为|r |T133736:0|t[理解入门]|cRXP_WARN_只能在本种族的出生区域获得|r << !Gnome
    .collect 203751,1,77667,1 -- Spell Notes: CALE ENCI (1)
    .train 401760,1
step << Gnome
    #season 2
    .train 401760 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_LOOT_[法术笔记：NNGABIIHGQSU]|r |cRXP_WARN_学习|r |T133816:0|t[铭刻手套 - 冰枪术]
    .use 203751
    .itemcount 203751,1 -- Spell Notes: CALE ENCI (1)
step
    #season 2
    #label EnterAnvilmar
    #optional
    #completewith next
    .goto 1426,28.792,68.804,12,0
    .goto 1426,28.642,68.375,12 >> 进入安威玛尔
step
    #season 2
    .goto 1426/0,388.17,-6056.10
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r交谈
    .turnin 3114 >> 交任务：雕文备忘录 << Gnome
    .accept 77667 >> 接任务：法术研究 << Gnome
    .turnin 77667 >> 交任务：法术研究 << Gnome
    .train 1459 >> 学习 |T135932:0|t[奥术智慧]
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
    .engrave 10 >>|cRXP_WARN_为|r |T132961:0|t[破布手套]铭刻|r |T133816:0|t[铭刻手套 - 冰枪术]
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
    .goto 1426/0,688.98,-6222.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 233 >> 交任务：寒脊山谷的送信任务
    .accept 183 >> 接任务：猎杀野猪
    .accept 234 >> 接任务：寒脊山谷的送信任务
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
    .goto 1426/0,688.98,-6222.47
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_塔林·锐眼|r交谈
    .turnin 183 >> 交任务：猎杀野猪
    .target 塔林·锐眼
step
    #label Rockjaw
    .goto 1426,25.077,75.711
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    .turnin 234 >> 交任务：寒脊山谷的送信任务
    .accept 182 >> 接任务：巨魔洞穴
    .target 格瑞林·白须
step
    #completewith next
    >>击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    .complete 182,1 --Kill Frostmane Troll Whelp (x14)
    .mob 霜鬃巨魔幼崽
step
    .goto 1426/0,485.63,-6494.56,30 >>进入洞穴
    .isOnQuest 182
step
    .goto 1426/0,457.56,-6531.66,20,0
    .goto 1426/0,408.80,-6498.83,20,0
    .goto 1426/0,357.09,-6473.87,30,0
    .goto 1426/0,408.80,-6498.83,20,0
    .goto 1426/0,457.56,-6531.66,20,0
    .goto 1426/0,408.80,-6498.83,20,0
    .goto 1426/0,357.09,-6473.87,30,0
    .goto 1426/0,408.80,-6498.83,20,0
    .goto 1426/0,457.56,-6531.66,20,0
    .goto 1426/0,408.80,-6498.83,20,0
    .goto 1426/0,357.09,-6473.87,30,0
    .goto 1426/0,408.80,-6498.83
    >>在洞穴内击杀|cRXP_ENEMY_霜鬃巨魔幼崽|r
    >>|cRXP_WARN_清理通往冻结之湖房间前的道路|r
    .complete 182,1,10 --Kill Frostmane Troll Whelp (x14)
    .mob 霜鬃巨魔幼崽
step
    .goto 1426/0,408.80,-6498.83,50,0
    .goto 1426/0,457.56,-6531.66,40,0
    .goto 1426/0,532.42,-6448.26,40,0
    .goto 1426/0,466.42,-6460.41,40,0
    .goto 1426/0,524.05,-6516.56,40,0
    .goto 1426/0,532.42,-6448.26
    >>击杀沿途的|cRXP_ENEMY_霜鬃巨魔幼崽|r，返回|cRXP_FRIENDLY_格瑞林·白须|r身边
    .complete 182,1--Kill Frostmane Troll Whelp (x14)
    .mob 霜鬃巨魔幼崽
step << skip
    #completewith next
    +|cRXP_WARN_如果不清楚如何触发登出跳点，请先观看此视频|r
    .link https://www.youtube.com/watch?v=SWBtPqm5M0Q >>|cRXP_WARN_点击此处了解如何进行登出跳点|r
step << skip
    >>与|cRXP_FRIENDLY_格瑞林·白须|r、|cRXP_FRIENDLY_诺里斯·激流|r交谈
    >>|cRXP_WARN_注意：“热酒快递”任务限时5分钟|r
    >>|cRXP_WARN_确保留出3个背包空位，用于接取和交还后续任务|r
    .turnin 182,4 >> 交任务：巨魔洞穴
    .accept 218 >> 接任务：被窃取的日记
    .goto 1426/0,567.09,-6362.99,-1
    .target +格瑞林·白须
    .accept 3364 >> 接任务：热酒快递
    .goto 1426/0,571.82,-6371.10,-1
    .target +诺里斯·激流
step
    >>与|cRXP_FRIENDLY_格瑞林·白须|r交谈
    >>|cRXP_WARN_确保留出3个背包空位，用于接取和交还后续任务|r
    .turnin 182,4 >> 交任务：巨魔洞穴
    .accept 218 >> 接任务：被窃取的日记
    .goto 1426/0,567.09,-6362.99
    .target +格瑞林·白须
step
    .goto 1426/0,485.63,-6494.56,40,0
    .goto 1426/0,357.09,-6473.87,30,0
    .goto 1426/0,340.84,-6493.24,10 >>|cRXP_WARN_进入洞穴，沿着已清理出的路线尽量避免战斗，前往洞穴内的冻结之湖|r
    .isOnQuest 218
step
    .goto 1426/0,300.94,-6509.00
    >>|cRXP_WARN_击杀面前的|cRXP_ENEMY_霜鬃巨魔幼崽|r|r
    >>击杀|cRXP_ENEMY_冷酷的格瑞克尼尔|r，并拾取|cRXP_LOOT_格瑞林·白须的日记|r
    >>|cRXP_WARN_小心，他会施放|r |T135849:0|t[冰霜震击] |cRXP_WARN_（远程瞬发：造成10点冰霜伤害，并使移动速度降低50%，持续8秒）|r
    .complete 218,1 --Collect Grelin Whitebeard's Journal (x1)
    .mob 冷酷的格瑞克尼尔
step << skip
    #completewith Rybrad
    #label LogoutSkip1
    .goto 1426/0,342.81,-6487.330
    .goto 1426/0,336.40,-6164.25,30 >>|cRXP_WARN_调整角色位置，使其看起来像是漂浮在冻结之湖上方的悬崖边缘，然后执行登出跳点返回安威玛尔|r
    .isOnQuest 218
step
    >>与|cRXP_FRIENDLY_格瑞林·白须|r、|cRXP_FRIENDLY_诺里斯·激流|r交谈
    .turnin 218 >> 交任务：被窃取的日记
    .accept 282 >> 接任务：森内尔的观察站
    .goto 1426/0,567.09,-6362.99,-1
    .target +格瑞林·白须
    .accept 3364 >> 接任务：热酒快递
    .goto 1426/0,571.82,-6371.10,-1
    .target +诺里斯·激流
step
    #completewith Rybrad
    #label LogoutSkip2
    .goto 1426/0,384.18,-6143.90,20,0
    .goto 1426/0,392.06,-6123.87,10 >>进入安威玛尔
    .isOnQuest 218,3364
step
    #label Rybrad
    .goto 1426/0,390.58,-6101.21
    >>与|cRXP_FRIENDLY_雷布莱德·寒椅|r交谈
    .vendor >> 出售杂物
    .target 雷布莱德·寒椅
    .isOnQuest 218,3364
step
    >>与|cRXP_FRIENDLY_德南·弗卡特|r、|cRXP_FRIENDLY_玛瑞克·斯托纳尔|r交谈
    .turnin 3364 >> 交任务：热酒快递
    .accept 3365 >> 接任务：归还酒杯
    .goto 1426/0,385.16,-6056.23
    .target +德南·弗卡特
    .turnin 3114 >> 交任务：雕文备忘录
    .trainer >> 学习职业技能（奥术智慧、寒冰箭）
    .goto 1426/0,388.17,-6056.10
    .target +玛瑞克·斯托纳尔
    .isQuestAvailable 420
step
    #optional
    #xprate <1.1
    .goto 1426/0,338.87,-6216.46
    >>与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
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
    >>与|cRXP_FRIENDLY_诺里斯·激流|r交谈
    -- >>Talk to |cRXP_FRIENDLY_Grelin Whitebeard|r and |cRXP_FRIENDLY_Nori Pridedrift|r
    -- .turnin 218,2 >> Turn in The Stolen Journal
    -- .accept 282 >> Accept Senir's Observations
    -- .goto 1426/0,567.09,-6362.99
    -- .target +Grelin Whitebeard
    .turnin 3365 >> 交任务：归还酒杯
    .goto 1426/0,571.82,-6371.10
    .target +诺里斯·激流
step
    #xprate <1.1
    #requires TroggEnd
    .goto 1426/0,338.87,-6216.46
    >>与|cRXP_FRIENDLY_巴尔林·霜锤|r交谈
    .turnin 170,3 >> 交任务：新的威胁
    .target 巴尔林·霜锤
    .isQuestComplete 170
step
    #requires TroggEnd
    #label Observations
    >>与|cRXP_FRIENDLY_巡山人萨鲁斯|r、|cRXP_FRIENDLY_汉兹·跳链|r交谈
    .turnin 282 >> 交任务：森内尔的观察站
    .accept 420 >> 接任务：森内尔的观察站
    .goto 1426/0,153.00,-6235.86
    .target +巡山人萨鲁斯
    .accept 2160 >> 接任务：塔诺克的补给品
    .goto 1426/0,134.97,-6248.96
    .target +汉兹·跳链
step
    #xprate <1.1
    #optional
    #completewith StockingJ
    .abandon 170 >> 放弃任务：新的威胁
    .isQuestNotComplete 170
step
    .goto 1426/0,111.82,-6206.61,15,0
    .goto 1426/0,46.32,-6037.19,15 >> 穿越寒脊山小径
    .subzoneskip 800,1
    .isOnQuest 2160
step
    #completewith StockingJ
    .goto 1426/0,3.97,-5943.61,40,0
    >>击杀|cRXP_ENEMY_峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，野猪会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在目标距离较远时施放）|r
    .collect 769,4,317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
step
    .goto 1426/0,-67.94,-5908.48,30,0
    .goto 1426/0,-162.50,-5822.79,45 >> |cRXP_WARN_对附近的|cRXP_ENEMY_雪豹幼崽|r和|cRXP_ENEMY_黑熊幼崽|r造成至少51%的伤害，再将它们引给|cRXP_FRIENDLY_铁炉堡巡山人|r，以便更快击杀|r
    .mob 雪豹幼崽
    .mob 黑熊幼崽
    .target 铁炉堡巡山人
    .isOnQuest 2160
step
    #completewith next
    .goto 1426/0,-337.34,-5703.93,50,0
    .goto 1426/0,-371.81,-5605.43,50,0
    .goto 1426/0,-464.45,-5573.78,20 >>前往|cRXP_FRIENDLY_萨雷克|r处
step
    .goto 1426/0,-464.45,-5573.78
    >>与|cRXP_FRIENDLY_萨雷克|r交谈
    .accept 400 >> 接任务：贝尔丁的工具
    .target 萨雷克·黑石
step
    #label StockingJ
    .goto 1426/0,-632.15,-5466.540
    >>沿途风筝|cRXP_ENEMY_黑熊幼崽|r |cRXP_WARN_（确保自己造成至少51%的伤害，以获得击杀进度）|r
    >>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .accept 317 >> 接任务：贝尔丁的补给
    .mob 黑熊幼崽
    .target 驾驶员贝隆·风箱
step
    >>与|cRXP_FRIENDLY_驾驶员迪恩·石轮|r、|cRXP_FRIENDLY_贝尔丁·钢架|r和|cRXP_FRIENDLY_罗斯洛·鲁治|r交谈
    >>|cRXP_WARN_如果引到了|cRXP_ENEMY_黑熊幼崽|r，就将它们风筝给|cRXP_FRIENDLY_铁炉堡巡山人|r（确保自己造成至少51%的伤害，以获得击杀进度）|r
    .accept 313 >> 接任务：灰色洞穴
    .target +驾驶员迪恩·石轮
    .goto 1426/0,-641.80,-5473.18
    .turnin 400 >> 交任务：贝尔丁的工具
    .target +贝尔丁·钢架
    .goto 1426/0,-682.58,-5488.87
    .accept 5541 >> 接任务：海格纳的弹药
    .vendor >> 出售杂物
    .goto 1426/0,-664.55,-5499.710
    .target +罗斯洛·鲁治
    .isQuestAvailable 312
step
    #completewith next
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，野猪会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在目标距离较远时施放）|r
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .mob 峭壁野猪
    .mob 大峭壁野猪
step
    .goto 1426/0,-679.62,-5573.58,50,0
    .goto 1426/0,-678.64,-5618.89,50,0
    .goto 1426/0,-620.03,-5550.60,50,0
    .goto 1426/0,-432.39,-5502.330,50,0
    .goto 1426/0,-349.65,-5586.06,50,0
    .goto 1426/0,-423.03,-5662.56,50,0
    .goto 1426/0,-422.05,-5775.18,50,0
    .goto 1426/0,-679.62,-5573.58,50,0
    .goto 1426/0,-678.64,-5618.89,50,0
    .goto 1426/0,-620.03,-5550.60,50,0
    .goto 1426/0,-432.39,-5502.330,50,0
    .goto 1426/0,-349.65,-5586.06,50,0
    .goto 1426/0,-423.03,-5662.56,50,0
    .goto 1426/0,-422.05,-5775.18,50,0
    .goto 1426/0,-679.62,-5573.58,50,0
    .goto 1426/0,-678.64,-5618.89,50,0
    .goto 1426/0,-620.03,-5550.60,50,0
    .goto 1426/0,-432.39,-5502.330,50,0
    .goto 1426/0,-349.65,-5586.06,50,0
    .goto 1426/0,-423.03,-5662.56
    >>击杀|cRXP_ENEMY_黑熊幼崽|r和|cRXP_ENEMY_冰爪熊|r，并拾取掉落的|cRXP_LOOT_厚熊皮|r
    >>|cRXP_WARN_将|cRXP_ENEMY_黑熊幼崽|r和|cRXP_ENEMY_冰爪熊|r风筝给附近的|cRXP_FRIENDLY_铁炉堡巡山人|r（确保自己造成至少51%的伤害，以获得击杀进度）|r
    >>|cRXP_WARN_小心，它们会施放|r |T135853:0|t[冰爪]|cRXP_WARN_（瞬发近战攻击：额外造成4点近战伤害）|r
    .complete 317,2 --Collect Thick Bear Fur (x2)
    .mob 黑熊幼崽
    .mob 冰爪熊
step
#loop
	.line Dun Morogh,51.70,49.66,51.08,52.42,51.43,53.21,50.06,51.66,49.56,50.82,48.12,49.10,48.21,46.93,45.48,50.04,44.07,52.50,43.69,55.59,42.78,56.86,44.45,59.33,46.31,61.85,46.26,59.49,48.08,59.05,49.40,58.97,48.30,56.86,49.09,54.74,49.61,54.32,51.43,53.21
	.goto 1426/0,-744.14,-5507.59,40,0
	.goto 1426/0,-713.61,-5598.21,40,0
	.goto 1426/0,-730.84,-5624.15,40,0
	.goto 1426/0,-663.37,-5573.25,40,0
	.goto 1426/0,-638.75,-5545.67,40,0
	.goto 1426/0,-567.83,-5489.200,40,0
	.goto 1426/0,-572.26,-5417.95,40,0
	.goto 1426/0,-437.81,-5520.06,40,0
	.goto 1426/0,-368.36,-5600.830,40,0
	.goto 1426/0,-349.65,-5702.29,40,0
	.goto 1426/0,-304.83,-5743.99,40,0
	.goto 1426/0,-387.08,-5825.09,40,0
	.goto 1426/0,-478.68,-5907.83,40,0
	.goto 1426/0,-476.22,-5830.34,40,0
	.goto 1426/0,-565.86,-5815.89,40,0
	.goto 1426/0,-630.87,-5813.27,40,0
	.goto 1426/0,-576.69,-5743.99,40,0
	.goto 1426/0,-615.60,-5674.38,40,0
	.goto 1426/0,-641.21,-5660.59,40,0
	.goto 1426/0,-730.84,-5624.15,40,0
    >>击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_大峭壁野猪|r，拾取 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r和|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，野猪会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在目标距离较远时施放）|r
    .complete 317,1 --Collect Chunk of Boar Meat (x4)
    .collect 2886,6,384,1 --Collect Crag Boar Rib (x6)
    .disablecheckbox
    .mob 峭壁野猪
    .mob 大峭壁野猪
step
    .goto 1426/0,-632.15,-5466.540
    >>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r交谈
    .turnin 317 >> 交任务：贝尔丁的补给
    .accept 318 >> 接任务：艾沃沙酒
    .target 驾驶员贝隆·风箱
step
#loop
	.line Dun Morogh,51.70,49.66,51.08,52.42,51.43,53.21,50.06,51.66,49.56,50.82,48.12,49.10,48.21,46.93,45.48,50.04,44.07,52.50,43.69,55.59,42.78,56.86,44.45,59.33,46.31,61.85,46.26,59.49,48.08,59.05,49.40,58.97,48.30,56.86,49.09,54.74,49.61,54.32,51.43,53.21
	.goto 1426/0,-744.14,-5507.59,40,0
	.goto 1426/0,-713.61,-5598.21,40,0
	.goto 1426/0,-730.84,-5624.15,40,0
	.goto 1426/0,-663.37,-5573.25,40,0
	.goto 1426/0,-638.75,-5545.67,40,0
	.goto 1426/0,-567.83,-5489.200,40,0
	.goto 1426/0,-572.26,-5417.95,40,0
	.goto 1426/0,-437.81,-5520.06,40,0
	.goto 1426/0,-368.36,-5600.830,40,0
	.goto 1426/0,-349.65,-5702.29,40,0
	.goto 1426/0,-304.83,-5743.99,40,0
	.goto 1426/0,-387.08,-5825.09,40,0
	.goto 1426/0,-478.68,-5907.83,40,0
	.goto 1426/0,-476.22,-5830.34,40,0
	.goto 1426/0,-565.86,-5815.89,40,0
	.goto 1426/0,-630.87,-5813.27,40,0
	.goto 1426/0,-576.69,-5743.99,40,0
	.goto 1426/0,-615.60,-5674.38,40,0
	.goto 1426/0,-641.21,-5660.59,40,0
	.goto 1426/0,-730.84,-5624.15,40,0
    .xp 5+2690 >> 刷怪至5级 2690+/2800 经验值
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
    .goto 1426/0,-504.29,-5596.24
    >>与|cRXP_FRIENDLY_拉格纳|r交谈
    .accept 384 >> 接任务：啤酒烤猪排
    .target 拉格纳·雷酒
step
    #completewith next
    .goto 1426/0,-511.19,-5584.09,10,0
    .goto 1426/0,-537.29,-5587.04,12 >>进入旅店
step
    .goto 1426/0,-523.35,-5590.82
    >>与|cRXP_FRIENDLY_塔诺克·霜锤|r交谈
    .turnin 2160,2 >> 交任务：塔诺克的补给品
    .target 塔诺克·霜锤
    .xp >6,1
step
    #completewith next
    .goto 1426/0,-511.19,-5584.09,10,0
    .goto 1426/0,-537.29,-5587.04,12 >>进入旅店
step
    #sticky
    #label Tannok
    .goto 1426/0,-523.35,-5590.82,0,0
    >>与|cRXP_FRIENDLY_塔诺克·霜锤|r交谈
    .turnin 2160,2 >> 交任务：塔诺克的补给品
    .target 塔诺克·霜锤
step
    .goto 1426/0,-537.29,-5587.04
    >>与楼上的|cRXP_FRIENDLY_玛济斯·石衣|r交谈
    .trainer >> 学习职业技能（火球术等级2、火焰冲击）
    .target 玛济斯·石衣
    .isQuestAvailable 312
step
    #completewith Golorn
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    .home >> 将你的炉石设置为雷酒酿制厂
    .target 旅店老板贝尔姆
    .isQuestAvailable 312
step
    #requires Tannok
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_向他购买|r |T132800:0|t[狂想麦酒]|cRXP_BUY_一杯|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .target 旅店老板贝尔姆
    .itemcount 2886,6
    .money <0.0050
step
    #requires Tannok
    .goto 1426/0,-504.29,-5596.24
    >>与|cRXP_FRIENDLY_拉格纳|r交谈
    .turnin 384 >> 交任务：啤酒烤猪排
    .target 拉格纳·雷酒
    .isQuestComplete 384
step
    #requires Tannok
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买20瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,20,312,1 --Ice Cold Milk (20)
    .target 旅店老板贝尔姆
    .money <0.0582
step
    #requires Tannok
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买15瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,15,312,1 --Ice Cold Milk (15)
    .target 旅店老板贝尔姆
    .money <0.0457
step
    #requires Tannok
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买10瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,10,312,1 --Ice Cold Milk (10)
    .target 旅店老板贝尔姆
    .money <0.0332
step
    #label InnLS1
    #requires Tannok
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买5瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,5,312,1 --Ice Cold Milk (5)
    .target 旅店老板贝尔姆
    .money <0.0207
step
    #requires Tannok
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买20瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    .collect 159,20,312,1 --Refreshing Spring Water (20)
    .itemcount 1179,<1
    .target 旅店老板贝尔姆
    .money <0.0182
step
    #requires Tannok
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买15瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    .collect 159,15,312,1 --Refreshing Spring Water (15)
    .itemcount 1179,<1
    .target 旅店老板贝尔姆
    .money <0.0157
step
    #requires Tannok
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买10瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    .collect 159,10,312,1 --Refreshing Spring Water (10)
    .itemcount 1179,<1
    .target 旅店老板贝尔姆
    .money <0.0132
step
    #requires Tannok
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买5瓶|r |T132794:0|t[清凉的泉水]|cRXP_BUY_（向他购买）|r
    .collect 159,5,312,1 --Refreshing Spring Water (5)
    .itemcount 1179,<1
    .target 旅店老板贝尔姆
    .money <0.0107
step << skip
    #completewith SenirO
    .goto 1426/0,-535.32,-5604.120,-1
    .goto 1426/0,-519.07,-5679.96,35 >>|cRXP_WARN_跳到|cRXP_FRIENDLY_旅店老板贝尔姆|r身后墙边的木桶上，再执行登出跳点前往卡拉诺斯|r
step
    #sticky
    #label Golorn
    .goto 1426/0,-501.34,-5640.89,-1
    >>与|cRXP_FRIENDLY_戈隆·霜须|r交谈
    >>|cRXP_BUY_购买一把|r |T135637:0|t[剥皮小刀]|cRXP_BUY_（向他购买）|r
    .collect 7005,1,312,1 --Skinning Knife (1)
    .target 戈隆·霜须
step
    #label SenirO
    .goto 1426/0,-499.17,-5644.37,-1
    >>与|cRXP_FRIENDLY_森内尔·白须|r交谈
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
	.goto 1426/0,-294.49,-5676.350,10,0
	.goto 1426/0,-261.00,-5666.83,10,0
	.goto 1426/0,-272.82,-5606.74,10,0
	.goto 1426/0,-289.07,-5583.10,10,0
	.goto 1426/0,-261.98,-5565.70,10,0
	.goto 1426/0,-289.07,-5583.10,10,0
	.goto 1426/0,-272.82,-5606.74,10,0
	.goto 1426/0,-294.49,-5676.350,10,0
    >>击杀|cRXP_ENEMY_雪怪幼崽|r和|cRXP_ENEMY_雪怪|r，并拾取掉落的|cRXP_LOOT_雪怪的鬃毛|r
    >>|cRXP_WARN_小心，它们会施放|r |T135848:0|t[冰霜吐息]|cRXP_WARN_（近战施法：造成6–10点冰霜伤害），并拥有更高的|r |T135849:0|t[冰霜抗性]
    .complete 313,1 --Collect Wendigo Mane (x8)
    .mob 雪怪幼崽
    .mob 雪怪
step
    .goto 1426/0,-371.32,-5746.94
    >>打开地面上的|cRXP_PICK_弹药箱|r，拾取|cRXP_LOOT_海格纳的弹药|r
    >>|cRXP_WARN_采集需要 5 秒读条|r
    .complete 5541,1 --Collect Rumbleshot's Ammo (x1)
step
    #completewith Ammo
    .goto 1426/0,-197.47,-5920.63,45,0
    >>沿途击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_雪豹幼崽|r
    >>从|cRXP_ENEMY_峭壁野猪|r身上拾取|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在目标距离较远时施放）|r
    .complete 384,1 --Crag Boar Rib (6)
    .disablecheckbox
    .goto 1426/0,-201.51,-6015.520,20 >>前往|cRXP_FRIENDLY_海格纳|r处
    .mob 峭壁野猪
    .mob 雪豹幼崽
    .xp >7-1000,1
    .isQuestAvailable 384
step
    #completewith Ammo
    .goto 1426/0,-197.47,-5920.63,45,0
    >>沿途击杀|cRXP_ENEMY_峭壁野猪|r和|cRXP_ENEMY_雪豹幼崽|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在目标距离较远时施放）|r
    .goto 1426/0,-201.51,-6015.520,20 >>前往|cRXP_FRIENDLY_海格纳|r处
    .mob 峭壁野猪
    .mob 雪豹幼崽
    .xp >7-1000,1
    .isQuestTurnedIn 384
step
    #completewith next
    .goto 1426/0,-197.47,-5920.63,45,0
    .goto 1426/0,-201.51,-6015.520,20 >>前往|cRXP_FRIENDLY_海格纳|r处
    .xp <7-1000,1
step
    #label Ammo
    .goto 1426/0,-201.51,-6015.520
    >>与|cRXP_FRIENDLY_海格纳|r交谈
    .turnin 5541 >> 交任务：海格纳的弹药
    .vendor >> 出售杂物
    .target 海格纳·重枪
    .isQuestAvailable 312
step
    #completewith TundraOne
    .goto 1426/0,-68.43,-5909.470,50,0
    .goto 1426/0,72.92,-5741.36,45,0
    .goto 1426/0,47.80,-5674.05,50,0
    .goto 1426/0,10.37,-5600.51,40,0
    >>|cRXP_WARN_对附近的|cRXP_ENEMY_雪豹幼崽|r和|cRXP_ENEMY_黑熊幼崽|r造成至少51%的伤害，再将它们引给|cRXP_FRIENDLY_铁炉堡巡山人|r，以便更快击杀|r
    >>击杀沿途的|cRXP_ENEMY_大峭壁野猪|r和|cRXP_ENEMY_峭壁野猪|r，并拾取掉落的|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_大峭壁野猪|r和|cRXP_ENEMY_峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在目标距离较远时施放）|r
    .complete 384,1 --Crag Boar Rib (6)
    .disablecheckbox
    .xp 7 >> 在前往 |cRXP_FRIENDLY_图德拉|r 的途中刷怪升到 7 级，再与他交谈
    .target 铁炉堡巡山人
    .mob 峭壁野猪
    .mob 雪豹幼崽
    .isQuestAvailable 384
step
    #completewith next
    .goto 1426/0,-68.43,-5909.470,50,0
    .goto 1426/0,72.92,-5741.36,45,0
    .goto 1426/0,47.80,-5674.05,50,0
    .goto 1426/0,10.37,-5600.51,40,0
    >>|cRXP_WARN_对附近的|cRXP_ENEMY_雪豹幼崽|r和|cRXP_ENEMY_黑熊幼崽|r造成至少51%的伤害，再将它们引给|cRXP_FRIENDLY_铁炉堡巡山人|r，以便更快击杀|r
    >>沿途击杀|cRXP_ENEMY_大峭壁野猪|r和|cRXP_ENEMY_峭壁野猪|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_大峭壁野猪|r和|cRXP_ENEMY_峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在目标距离较远时施放）|r
    .xp 7 >> 在前往 |cRXP_FRIENDLY_图德拉|r 的途中刷怪升到 7 级，再与他交谈
    .target 铁炉堡巡山人
    .mob 峭壁野猪
    .mob 雪豹幼崽
    .isQuestTurnedIn 384
step
    #label TundraOne
    .goto 1426/0,99.51,-5573.25
    >>与|cRXP_FRIENDLY_图德拉|r交谈
    .accept 312 >> 接任务：马克格拉恩的干肉
    .target 图德拉·马克格拉恩
step
    #completewith next
    +|cRXP_WARN_把|cRXP_ENEMY_冰爪熊|r风筝到|r|cRXP_FRIENDLY_雷杰德|r处
    >>|cRXP_WARN_尽量在|cRXP_ENEMY_冰爪熊|r死亡前接取任务，以获得任务进度|r
    >>|cRXP_WARN_小心，它们会施放|r |T135853:0|t[冰爪]|cRXP_WARN_（瞬发近战攻击：额外造成4点近战伤害）|r
    >>|cRXP_WARN_确保自己造成至少51%的伤害，以获得击杀进度|r
    .mob 冰爪熊
step
    >>与|cRXP_FRIENDLY_雷杰德|r和|cRXP_FRIENDLY_马莱斯|r交谈
    .turnin 318 >> 交任务：艾沃沙酒
    .accept 319 >> 接任务：艾沃沙酒
    .accept 315 >> 接任务：完美烈酒
    .target +雷杰德·麦酒
    .goto 1426/0,315.23,-5378.55
    .accept 310 >> 接任务：针锋相对
    .goto 1426/0,315.42,-5372.02
    .target +马莱斯·麦酒
step
    .goto 1426/0,302.42,-5387.74,0,0
    >>与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    >>|cRXP_BUY_将数量补足至10瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .vendor >> 出售杂物
    .collect 1179,10,312,1 --Ice Cold Milk (10)
    .target 基格·吉布恩
    .itemcount 1179,<10
    .money <0.0350
    .isOnQuest 319
step
    .goto 1426/0,302.42,-5387.74,0,0
    >>与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    >>|cRXP_BUY_将数量补足至5瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .vendor >> 出售杂物
    .collect 1179,5,312,1 --Ice Cold Milk (5)
    .target 基格·吉布恩
    .itemcount 1179,<5
    .money <0.0225
    .isOnQuest 319
step
    #completewith FrostmaneAccept
    .goto 1426/0,151.72,-5436.670,50,0
    .goto 1426/0,-12.78,-5370.34,50,0
    >>前往洞穴途中击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r；从|cRXP_ENEMY_老峭壁野猪|r身上拾取|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_优先击杀|r|cRXP_ENEMY_雪豹|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_冰爪熊|r会施放|r |T135853:0|t[冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害），而|cRXP_ENEMY_老峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在远处施放）|r
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
    #completewith FrostmaneAccept
    .goto 1426/0,151.72,-5436.670,50,0
    .goto 1426/0,-12.78,-5370.34,50,0
    >>沿途击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r，前往洞穴
    >>|cRXP_WARN_优先击杀|r|cRXP_ENEMY_雪豹|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_冰爪熊|r会施放|r |T135853:0|t[冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害），而|cRXP_ENEMY_老峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–70点近战伤害，仅能在远处施放）|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
    .isQuestTurnedIn 384
step << skip
    #completewith next
    .goto 1426/0,-69.42,-5281.36,30 >> 进入洞穴
    .isOnQuest 319
step << skip
    #label CaveLS
    .goto 1426/0,-85.18,-5300.74
    .goto 1426/0,-519.07,-5679.96,30 >> |cRXP_WARN_在洞穴内执行登出跳点回卡拉诺斯|r
    .isOnQuest 319
step
    #label FrostmaneAccept
    .goto 1426/0,-499.17,-5644.37
    >>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .accept 287 >> 接任务：霜鬃巨魔要塞
    .target 森内尔·白须
step
    #completewith Rhapsody1
    .goto 1426/0,-511.19,-5584.09,10,0
    .goto 1426/0,-522.02,-5585.07,12 >>进入旅店
step
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_购买|r |T132800:0|t[狂想麦酒]|cRXP_BUY_和|r |T132800:0|t[雷霆麦酒]|cRXP_BUY_（向他购买）|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .collect 2686,1,311,1 --Collect Thunder Ale (x1)
    .target 旅店老板贝尔姆
    .itemcount 2886,6
    .isQuestAvailable 384
step
    #label Rhapsody1
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_向他购买|r |T132800:0|t[雷霆麦酒]|cRXP_BUY_一杯|r
    .collect 2686,1,311,1 --Collect Thunder Ale (x1)
    .target 旅店老板贝尔姆
    .itemcount 2886,<6
step
    #completewith next
    .goto 1426/0,-537.29,-5597.55,8,0
    .goto 1426/0,-548.13,-5598.54,8 >>下楼
step
    #completewith next
    .goto 1426/0,-544.68,-5606.09
    >>与楼下的|cRXP_FRIENDLY_加文·雷酒|r交谈
    .turnin 308 >> 交任务：加文的爱好
    .target 加文·雷酒
step
    .goto 1426/0,-548.13,-5607.400
    >>持续将鼠标悬停在楼下的|cRXP_PICK_被看守着的酒桶|r上，等待|cRXP_PICK_被看守着的酒桶|r变为无人看守状态
    >>点击|cRXP_PICK_无人守卫的雷酒桶|r
    .turnin 310 >> 交任务：针锋相对
    .accept 311 >> 接任务：向马莱斯回报
step
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_最多再买10瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,10,312,1 --Ice Cold Milk (10)
    .target 旅店老板贝尔姆
    .money <0.0250
step
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_最多再买5瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,5,312,1 --Ice Cold Milk (5)
    .target 旅店老板贝尔姆
    .money <0.0125
step
    .goto 1426/0,-522.02,-5585.07,12,0
    .goto 1426/0,-511.19,-5584.09,10,0
    .goto 1426/0,-504.29,-5596.24,20 >>离开旅店
    .isOnQuest 287
step
    .goto 1426/0,-504.29,-5596.24
    >>与|cRXP_FRIENDLY_拉格纳|r交谈
    .turnin 384 >> 交任务：啤酒烤猪排
    .target 拉格纳·雷酒
    .isQuestComplete 384
step
    #completewith next
    .goto 1426/0,-495.43,-5434.04,40,0
    +|cRXP_WARN_对附近的|cRXP_ENEMY_雪狼|r、|cRXP_ENEMY_冬狼|r和|cRXP_ENEMY_黑熊幼崽|r造成至少51%的伤害，再将它们引给|cRXP_FRIENDLY_铁炉堡巡山人|r，以便更快击杀|r
    >>|cRXP_WARN_注意，|cRXP_ENEMY_雪狼|r的|r |T132150:0|t[仇恨范围提高]|cRXP_WARN_仇恨范围约增加8码|r
    .mob 雪狼
    .mob 冬狼
    .mob 黑熊幼崽
    .target 铁炉堡巡山人
step
    #label SeerRamp
    .goto 1426/0,-311.23,-5360.16,25,0
    .goto 1426/0,-282.18,-5363.45,45 >> 沿坡道跑上去，前往|cRXP_ENEMY_霜鬃先知|r所在处
    .isOnQuest 315
step
    #requires SeerRamp
    #completewith next
    >>击杀巡逻的|cRXP_ENEMY_霜鬃猎头者|r
    >>|cRXP_WARN_小心，巡逻者会在固定不动的|r|cRXP_ENEMY_霜鬃先知|r之间巡逻|r
    >>|cRXP_WARN_小心，它们会施放|r |T132222:0|t[射击]|cRXP_WARN_（远程施法：造成8–15点伤害）|r
    .complete 287,1 --Kill Frostmane Headhunters (5)
    .mob 霜鬃猎头者
step
    #label ShimmerB
    .goto 1426/0,-269.86,-5370.34,40,0
    .goto 1426/0,-271.83,-5342.43,40,0
    .goto 1426/0,-250.16,-5306.32,40,0
    .goto 1426/0,-230.46,-5333.90,20,0
    .goto 1426/0,-240.81,-5354.91,30,0
    .goto 1426/0,-221.11,-5349.99,30,0
    .goto 1426/0,-224.06,-5372.31,40,0
    .goto 1426/0,-184.66,-5283.66,40,0
    .goto 1426/0,-151.66,-5186.15,20,0
    .goto 1426/0,-164.96,-5114.900,20,0
    .goto 1426/0,-258.54,-5046.93
    >>击杀|cRXP_ENEMY_霜鬃先知|r，拾取|cRXP_LOOT_微光草|r
    >>打开地面上的|cRXP_PICK_微光草篮|r，拾取|cRXP_LOOT_微光草|r
    >>|cRXP_WARN_采集需要 5 秒读条|r
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
    .goto 1426/0,-190.08,-5427.80,40,0
    .goto 1426/0,-55.63,-5580.48,40,0
    >>沿途击杀两只|cRXP_ENEMY_老峭壁野猪|r（如果它们已刷新）
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成25–85点近战伤害，仅能在目标距离较远时施放）|r
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob 老峭壁野猪
step
    #label IBCave
    .goto 1426/0,-62.03,-5640.56,50 >>前往洞穴
    .isOnQuest 312
step
    #completewith next
    +|cRXP_WARN_拾取物品后，记得在它攻击时跳跃转身，以免被打出眩晕减速；并跳上树干暂时躲开它|r
step
    .goto 1426/0,-94.53,-5647.79
    >>|cRXP_WARN_如果|cRXP_ENEMY_冰须|r在洞穴里，就沿洞穴侧壁把它风筝上去，再一路引到洞顶。等它靠近后再跳下去，然后前往洞穴深处|r
    >>打开地面上的|cRXP_PICK_马克格拉恩的储肉柜|r，拾取其中的|cRXP_LOOT_马克格拉恩的干肉|r
    >>|cRXP_WARN_采集需要 5 秒读条|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3120 >>|cRXP_WARN_如果遇到困难，点击查看详细说明|r
    .complete 312,1 --Collect MacGrann's Dried Meats (x1)
    .mob 冰须
step
    .goto 1426/0,99.51,-5573.25
    >>与|cRXP_FRIENDLY_图德拉|r交谈
    .turnin 312,1 >> 交任务：马克格拉恩的干肉
    .target 图德拉·马克格拉恩
step
    .goto 1426/0,220.67,-5509.56,40,0
    .goto 1426/0,355.12,-5644.50,40,0
    .goto 1426/0,378.27,-5520.39,40,0
    .goto 1426/0,402.40,-5359.18,40,0
    .goto 1426/0,381.22,-5247.87,40,0
    .goto 1426/0,260.56,-5163.16,40,0
    .goto 1426/0,220.67,-5509.56,40,0
    .goto 1426/0,355.12,-5644.50,40,0
    .goto 1426/0,378.27,-5520.39,40,0
    .goto 1426/0,402.40,-5359.18,40,0
    .goto 1426/0,381.22,-5247.87,40,0
    .goto 1426/0,260.56,-5163.16
    >>击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r，并从|cRXP_ENEMY_老峭壁野猪|r身上拾取|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_如果可以，把|cRXP_ENEMY_冰爪熊|r或|cRXP_ENEMY_雪豹|r风筝回任务给予者身边|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_冰爪熊|r会施放|r |T135853:0|t[冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害），而|cRXP_ENEMY_老峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成35–85点近战伤害，仅能在目标距离较远时施放）|r
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
    .goto 1426/0,220.67,-5509.56,40,0
    .goto 1426/0,355.12,-5644.50,40,0
    .goto 1426/0,378.27,-5520.39,40,0
    .goto 1426/0,402.40,-5359.18,40,0
    .goto 1426/0,381.22,-5247.87,40,0
    .goto 1426/0,260.56,-5163.16,40,0
    .goto 1426/0,220.67,-5509.56,40,0
    .goto 1426/0,355.12,-5644.50,40,0
    .goto 1426/0,378.27,-5520.39,40,0
    .goto 1426/0,402.40,-5359.18,40,0
    .goto 1426/0,381.22,-5247.87,40,0
    .goto 1426/0,260.56,-5163.16
    >>击杀|cRXP_ENEMY_冰爪熊|r、|cRXP_ENEMY_老峭壁野猪|r和|cRXP_ENEMY_雪豹|r
    >>|cRXP_WARN_如果可以，把|cRXP_ENEMY_冰爪熊|r或|cRXP_ENEMY_雪豹|r风筝回任务给予者身边|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_冰爪熊|r会施放|r |T135853:0|t[冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害），而|cRXP_ENEMY_老峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成35–85点近战伤害，仅能在目标距离较远时施放）|r
    .complete 319,1 --Kill Ice Claw Bear (x6)
    .mob +冰爪熊
    .complete 319,2 --Kill Elder Crag Boar (x8)
    .mob +老峭壁野猪
    .complete 319,3 --Kill Snow Leopard (x8)
    .mob +雪豹
    .isQuestTurnedIn 384
step
    >>与|cRXP_FRIENDLY_雷杰德|r和|cRXP_FRIENDLY_马莱斯|r交谈
    .turnin 315,1 >> 交任务：完美烈酒
    .accept 413 >> 接任务：微光酒
    .turnin 319 >> 交任务：艾沃沙酒
    .accept 320 >> 接任务：艾沃沙酒
    .goto 1426/0,315.28,-5378.39
    .turnin 311 >> 交任务：向马莱斯回报
    .goto 1426/0,315.42,-5372.02
    .target 雷杰德·麦酒
step
    .goto 1426/0,302.42,-5387.74
    >>与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    >>|cRXP_BUY_最多再买10瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,10,287,1 --Ice Cold Milk (10)
    .target 基格·吉布恩
    .money <0.0250
step
    .goto 1426/0,302.42,-5387.74
    >>与|cRXP_FRIENDLY_基格·吉布恩|r交谈
    >>|cRXP_BUY_最多再买5瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,5,287,1 --Ice Cold Milk (5)
    .target 基格·吉布恩
    .money <0.0125
step
    .goto 1426/0,220.67,-5509.56,40,0
    .goto 1426/0,355.12,-5644.50,40,0
    .goto 1426/0,378.27,-5520.39,40,0
    .goto 1426/0,402.40,-5359.18,40,0
    .goto 1426/0,381.22,-5247.87,40,0
    .goto 1426/0,260.56,-5163.16,40,0
    .goto 1426/0,220.67,-5509.56,40,0
    .goto 1426/0,355.12,-5644.50,40,0
    .goto 1426/0,378.27,-5520.39,40,0
    .goto 1426/0,402.40,-5359.18,40,0
    .goto 1426/0,381.22,-5247.87,40,0
    .goto 1426/0,260.56,-5163.16
    >>击杀|cRXP_ENEMY_老峭壁野猪|r，拾取|cRXP_LOOT_峭壁野猪肋排|r
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成35–85点近战伤害，仅能在目标距离较远时施放）|r
    .complete 384,1 --Crag Boar Rib (6)
    .mob 老峭壁野猪
step
    #completewith Explore
    .goto 1426/0,564.92,-5503.65,35,0
    .goto 1426/0,573.79,-5538.78,12 >>从北侧进入洞穴
step
    .goto 1426/0,605.80,-5545.020,40,0
    .goto 1426/0,654.07,-5563.40
    >>击杀洞穴内的|cRXP_ENEMY_霜鬃猎头者|r
    >>|cRXP_WARN_小心，它们会施放|r |T132222:0|t[射击]|cRXP_WARN_（远程施法：造成8–15点伤害）|r
    >>|cRXP_WARN_小心洞穴里的|cRXP_ENEMY_霜鬃猎头者|r正在巡逻|r
    .complete 287,1 --Kill Frostmane Headhunter (x5)
    .mob 霜鬃猎头者
step
    #label Explore
    .goto 1426/0,668.84,-5585.73,8,0
    .goto 1426/0,674.26,-5587.37
    >>|cRXP_WARN_小心走到下方的凹槽上（不要掉下去），再沿凹槽慢慢向下走，直到获得任务进度|r
    >>|cRXP_WARN_小心下方的|cRXP_ENEMY_霜鬃剥皮者|r；如果它离凹槽太近，可能会攻击到你|r
    >>|cRXP_WARN_准备使用|r |T134414:0|t[炉石]
    .link https://youtu.be/Zg4FNWw-P5k?t=3619 >>|cRXP_WARN_如果遇到困难，点击查看详细说明|r
    .complete 287,2 --Fully explore Frostmane Hold
step << skip
    #completewith next
    +|cRXP_WARN_记得接下来要执行旅店登出跳点！|r
step
    #completewith Senir2
    .hs >> 炉石回卡拉诺斯
step
    .goto 1426/0,-531.38,-5601.49
    >>与|cRXP_FRIENDLY_旅店老板贝尔姆|r交谈
    >>|cRXP_BUY_向他购买|r |T132800:0|t[狂想麦酒]|cRXP_BUY_一杯|r
    .complete 384,2 --Collect Rhapsody Malt (x1)
    .target 旅店老板贝尔姆
step
    .goto 1426/0,-537.29,-5587.04
    >>与楼上的|cRXP_FRIENDLY_玛济斯·石衣|r交谈
    .trainer >> 学习职业技能（寒冰箭等级2、变形术）
    .target 玛济斯·石衣
    .isQuestAvailable 314
step
    #completewith Senir2
    +|cRXP_WARN_记得保留练级时获得的|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_后续将|r |T133971:0|t[烹饪]|cRXP_WARN_提升到50点时需要用|r
step
    .goto 1426/0,-504.29,-5596.24
    >>与|cRXP_FRIENDLY_拉格纳|r交谈
    .turnin 384 >> 交任务：啤酒烤猪排
    .target 拉格纳·雷酒
step
    #label Senir2
    .goto 1426/0,-499.17,-5644.37
    >>与|cRXP_FRIENDLY_森内尔·白须|r交谈
    .turnin 287,2 >> 交任务：霜鬃巨魔要塞
    .accept 291 >> 接任务：森内尔的报告
    .target 森内尔·白须
step
    #completewith next
    .cast 1459 >> 重新施放 |T135932:0|t[奥术智慧]
    .cast 168 >> 重新施放 |T135843:0|t[霜甲术]
step
    >>与|cRXP_FRIENDLY_驾驶员贝隆·风箱|r和|cRXP_FRIENDLY_驾驶员迪恩·石轮|r交谈
    .turnin 320,2 >> 交任务：艾沃沙酒
    .target +驾驶员贝隆·风箱
    .goto 1426/0,-632.15,-5466.540
    .turnin 313 >> 交任务：灰色洞穴
    .goto 1426/0,-641.80,-5473.18
    .target +驾驶员迪恩·石轮
step
    #completewith next
    +|cRXP_WARN_对附近的|cRXP_ENEMY_冬狼|r造成至少51%的伤害，再将它们引给可能在道路上巡逻的|cRXP_FRIENDLY_铁炉堡巡山人|r，以便更快击杀|r
    >>|cRXP_WARN_如果没看到|cRXP_FRIENDLY_铁炉堡巡山人|r，就跳过此步骤|r
    .mob 冬狼
    .target 铁炉堡巡山人
step
    #completewith Rudra
    #label Dirt
    .goto 1426/0,-1145.04,-5504.30,40,0
    .goto 1426/0,-1219.90,-5422.55,40 >>沿土路上行
    .isQuestAvailable 314
step
    #completewith next
    #requires Dirt
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >>|cRXP_WARN_如果遇到困难，点击查看详细说明|r
    +|cRXP_WARN_把|cRXP_ENEMY_瓦加什|r风筝到下方的|r|cRXP_FRIENDLY_鲁德拉·冻石|r
    .mob 瓦加什
step
    #label Rudra
    .goto 1426/0,-1304.61,-5513.82
    >>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .accept 314 >> 接任务：保护牲畜
    .target 鲁德拉·冻石
step
    .goto 1426/0,-1279.49,-5392.01,0
    .goto 1426/0,-1289.83,-5669.780,40,0
    .goto 1426/0,-1291.80,-5706.89
    >>击杀|cRXP_ENEMY_瓦加什|r，并拾取掉落的|cRXP_LOOT_瓦加什的牙齿|r
    >>|cRXP_WARN_将|cRXP_ENEMY_瓦加什|r风筝给牧场南边的|cRXP_FRIENDLY_丹莫罗巡山人|r。确保自己对它造成至少51%的伤害|r
    >>|cRXP_WARN_记得获取冻土岭的探索经验；方便的话，把|cRXP_ENEMY_雪豹|r也风筝到|cRXP_FRIENDLY_丹莫罗巡山人|r那里|r
    .link https://youtu.be/Zg4FNWw-P5k?t=3815 >>|cRXP_WARN_如果遇到困难，点击查看详细说明|r
    .complete 314,1 --Collect Fang of Vagash (1)
    .mob 瓦加什
step
    .goto 1426/0,-1304.61,-5513.82
    >>与|cRXP_FRIENDLY_鲁德拉·冻石|r交谈
    .turnin 314,3 >> 交任务：保护牲畜
    .target 鲁德拉·冻石
step << skip
    #completewith Ghilm
    +|cRXP_WARN_记得保留练级时获得的|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_后续将|r |T133971:0|t[烹饪]|cRXP_WARN_提升到50点时需要用|r
step
    #completewith next
    .goto 1426/0,-1465.16,-5548.96,50,0
    .goto 1426/0,-1533.13,-5638.92,30,0
    +|cRXP_WARN_将|cRXP_ENEMY_冰爪熊|r风筝给|cRXP_FRIENDLY_铁炉堡巡山人|r（确保自己造成至少51%的伤害，以获得击杀进度）|r
    >>|cRXP_WARN_小心，它们会施放|r |T135853:0|t[冰爪]|cRXP_WARN_（瞬发近战攻击：额外造成4点近战伤害）|r
    .mob 冰爪熊
step
    #sticky
    #label Ghilm
    .goto 1426/0,-1566.62,-5664.86,0,0
    >>与|cRXP_FRIENDLY_格瑞姆|r交谈
    .train 2550 >> 学习|T133971:0|t[烹饪]
    .target 厨师格瑞姆
step
    .goto 1426/0,-1568.09,-5665.19,8,0
    .goto 1426/0,-1573.02,-5671.10
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买15瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,15,432,1 --Ice Cold Milk (15)
    .target 卡杉·莫格什
    .money <0.0395
step
    .goto 1426/0,-1568.09,-5665.19,8,0
    .goto 1426/0,-1573.02,-5671.10
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买10瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,10,432,1 --Ice Cold Milk (10)
    .target 卡杉·莫格什
    .money <0.0260
step
    .goto 1426/0,-1568.09,-5665.19,8,0
    .goto 1426/0,-1573.02,-5671.10
    >>与|cRXP_FRIENDLY_卡杉|r交谈
    >>|cRXP_BUY_购买5瓶|r |T132815:0|t[冰镇牛奶]|cRXP_BUY_（向他购买）|r
    .collect 1179,5,432,1 --Ice Cold Milk (5)
    .target 卡杉·莫格什
    .money <0.0135
step
    #requires Ghilm
    >>与|cRXP_FRIENDLY_参议员梅尔·圣石|r和|cRXP_FRIENDLY_工头乔尼·石眉|r交谈
    .accept 433 >> 接任务：公众之仆
    .target +参议员梅尔·圣石
    .goto 1426/0,-1579.91,-5714.77
    .accept 432 >> 接任务：该死的石腭怪！
    .goto 1426/0,-1600.30,-5726.590
    .target +工头乔尼·石眉
step
    #completewith Bonesnappers
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    >>|cRXP_WARN_无需特意绕路击杀它们|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
step
    #completewith next
    .goto 1426/0,-1681.86,-5723.30,30 >>进入洞穴
step
    #label Bonesnappers
    .goto 1426/0,-1693.68,-5660.26,40,0
    .goto 1426/0,-1686.29,-5622.83,40,0
    .goto 1426/0,-1740.96,-5534.51,40,0
    .goto 1426/0,-1771.00,-5568.000,40,0
    .goto 1426/0,-1774.45,-5602.80
    >>击杀洞穴内的|cRXP_ENEMY_石腭断骨者|r
    >>|cRXP_WARN_小心，它们会施放|r |T132154:0|t[击倒]|cRXP_WARN_（瞬发近战攻击：使你昏迷2秒）|r
    .complete 433,1 --Kill Rockjaw Bonesnapper (x10)
    .mob 石腭断骨者
step
    .goto 1426/0,-1681.86,-5723.30,30,0
#loop
	.line Dun Morogh,69.93,57.29,70.57,58.61,69.68,59.37,68.36,59.57,69.16,57.51,69.93,57.29
	.goto 1426/0,-1641.97,-5758.11,30,0
	.goto 1426/0,-1673.49,-5801.45,30,0
	.goto 1426/0,-1629.66,-5826.40,30,0
	.goto 1426/0,-1564.65,-5832.97,30,0
	.goto 1426/0,-1604.05,-5765.33,30,0
	.goto 1426/0,-1641.97,-5758.11,30,0
    >>击杀|cRXP_ENEMY_石腭击颅者|r
    .complete 432,1 --Kill Rockjaw Skullthumper (x6)
    .mob 石腭击颅者
step
    #sticky
    #label Frast
    .goto 1426/0,-1589.76,-5714.44,0,0
    >>与|cRXP_FRIENDLY_弗拉斯特·多克南|r交谈
    .vendor >> 出售杂物
    .target 弗拉斯特·多克南
step
    >>与|cRXP_FRIENDLY_工头乔尼·石眉|r和|cRXP_FRIENDLY_参议员梅尔·圣石|r交谈
    .turnin 432 >> 交任务：该死的石腭怪！
    .target +工头乔尼·石眉
    .goto 1426/0,-1600.30,-5726.590
    .turnin 433 >> 交任务：公众之仆
    .goto 1426/0,-1579.91,-5714.77
    .target +参议员梅尔·圣石
step
    #requires Frast
    .goto 1426/0,-1612.42,-5698.02
    >>与|cRXP_FRIENDLY_丹克|r交谈
    .train 2575 >> 学习专业技能：|T136248:0|t[采矿]
    .target 丹克·利刃
step
    #label Shortcut1
    #completewith Pilot
    .goto 1426/0,-1662.65,-5692.11,5,0
    .link https://youtu.be/G2IscpFZVeQ?t=4034 >>|cRXP_WARN_遇到困难时点击此处|r
    .goto 1426/0,-1671.03,-5674.71,12 >>从|cRXP_FRIENDLY_丹克|r身后的近路上山
step
    #completewith Pilot
    #requires Shortcut1
    #label Shortcut2
    .goto 1426/0,-1693.19,-5541.730,50,0
    .goto 1426/0,-1788.24,-5511.85,50,0
    .goto 1426/0,-1995.58,-5480.01,50 >>|cRXP_WARN_将附近的|cRXP_ENEMY_石腭伏击者|r风筝给可能在道路上巡逻的|cRXP_FRIENDLY_铁炉堡巡山人|r（确保自己造成至少51%的伤害，以获得击杀进度）|r
    .mob 石腭伏击者
    .unitscan 铁炉堡巡山人
step
    #requires Shortcut2
    #completewith next
    .goto 1426/0,-2198.49,-5277.75,50,0
    .goto 1426/0,-2286.16,-5200.59,30 >>风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r穿过隧道
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（瞬发自身技能：提高移动速度，持续3秒；命中时造成40–100点近战伤害，只能在远处施放）|r
    .mob 有伤疤的峭壁野猪
step
    #label Pilot
    .goto 1426/0,-2329.50,-5163.82
    >>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .accept 419 >> 接任务：失踪的驾驶员
    .target 驾驶员塞克·锤足
    .isQuestAvailable 419
step
    .goto 1426/0,-2205.39,-5092.57,30,0
    .goto 1426/0,-2121.66,-5064.66
    >>点击地面上的|cRXP_PICK_矮人的尸体|r
    >>|cRXP_WARN_确保背包中至少留有1个空位，用于交还任务|r
    >>|cRXP_WARN_记得把|cRXP_ENEMY_癞爪|r风筝回|cRXP_FRIENDLY_驾驶员塞克·锤足|r身边|r
    .turnin 419 >> 交任务：失踪的驾驶员
    .accept 417 >> 接任务：驾驶员的复仇
step
    .goto 1426/0,-2059.61,-5118.180,60,0
    .goto 1426/0,-2329.50,-5163.82
    >>击杀|cRXP_ENEMY_癞爪|r，并拾取掉落的|cRXP_LOOT_肮脏的爪子|r
    >>|cRXP_WARN_将它一路风筝给|cRXP_FRIENDLY_驾驶员塞克·锤足|r（确保自己造成至少51%的伤害，以获得击杀进度）|r
    .complete 417,1 --Collect Mangy Claw (x1)
    .mob 癞爪
    .target 驾驶员塞克·锤足
step
    .goto 1426/0,-2329.60,-5163.76
    >>与|cRXP_FRIENDLY_驾驶员塞克·锤足|r交谈
    .turnin 417,1 >> 交任务：驾驶员的复仇
    .target 驾驶员塞克·锤足
step
    #label Tunnel1
    #completewith Barleybrew
    .goto 1426/0,-2286.16,-5200.59,30,0
    .goto 1426/0,-2198.49,-5277.75,30 >>穿过隧道原路返回
step
    .goto 1426/0,-2075.37,-5511.20
    >>|cRXP_WARN_小心，|cRXP_ENEMY_有伤疤的峭壁野猪|r和|cRXP_ENEMY_老峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成40–100点近战伤害，仅能在目标距离较远时施放），而|cRXP_ENEMY_冰爪熊|r会施放|r |T135853:0|t[冰爪]|cRXP_WARN_（近战瞬发：额外造成4点近战伤害）|r
    .xp 9+5450 >> 刷怪至9级 5450+/6500 经验值
    .mob 冰爪熊
    .mob 老峭壁野猪
    .mob 有伤疤的峭壁野猪
step
    #requires Tunnel1
    #label Tunnel2
    #completewith Barleybrew
    .goto 1426/0,-2118.71,-5516.78,20,0
    .goto 1426/0,-2192.09,-5510.87,20,0
    .goto 1426/0,-2216.72,-5519.08,20,0
    .goto 1426/0,-2314.72,-5491.83,20,0
    >>沿途风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（瞬发自身技能：提高移动速度，持续3秒；命中时造成40–100点近战伤害，只能在远处施放）|r
    .goto 1426/0,-2347.72,-5483.62,20 >>执行跳山操作，记得小心落下
    .mob 有伤疤的峭壁野猪
step
    #requires Tunnel2
    #completewith next
    >>|cRXP_WARN_小心，|cRXP_ENEMY_有伤疤的峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成40–100点近战伤害，仅能在目标距离较远时施放）|r
    .xp 9+5990 >> 刷怪至9级 5990+/6500 经验值
    .mob 有伤疤的峭壁野猪
step
    #label Barleybrew
    .goto 1426/0,-2447.11,-5479.74
    >>与|cRXP_FRIENDLY_巡山人维拉特·麦酒|r交谈
    .turnin 413 >> 交任务：微光酒
    .accept 414 >> 接任务：卡德雷尔的酒
    .target 巡山人维拉特·麦酒
step
    .goto 1426/0,-2469.86,-5504.96,40,0
    .goto 1426/0,-2451.15,-5432.07
    .xp 9+6320 >> 刷怪至9级 6320+/6500 经验值
    >>|cRXP_WARN_小心，|cRXP_ENEMY_有伤疤的峭壁野猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发：提高移动速度，持续3秒；命中时造成40–100点近战伤害，仅能在目标距离较远时施放）|r
    .mob 有伤疤的峭壁野猪
step
    #label CragB1
    #completewith Cobbleflint
    .goto 1432/0,-2447.50,-5564.39,20,0
    .goto 1432/0,-2534.11,-5642.02,30 >>风筝一只|cRXP_ENEMY_有伤疤的峭壁野猪|r穿过隧道
    >>|cRXP_WARN_小心，它们会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（瞬发自身技能：提高移动速度，持续3秒；命中时造成40–100点近战伤害，只能在远处施放）|r
    .mob 有伤疤的峭壁野猪
step
#loop
	.line Loch Modan,21.14,71.62,19.06,75.46,20.91,77.67,21.14,71.62
	.goto 1432/0,-2576.86,-5805.01,35,0
	.goto 1432/0,-2519.49,-5875.65,35,0
	.goto 1432/0,-2570.52,-5916.30,35,0
	.goto 1432/0,-2576.86,-5805.01,35,0
    .xp 10 >> 刷怪升至10级
    .mob 老黑熊
    .mob 森林潜伏者
step
    #requires CragB1
    #completewith Rugelfuss
    +|cRXP_WARN_尝试将附近的|cRXP_ENEMY_老黑熊|r或|cRXP_ENEMY_森林潜伏者|r风筝进掩体（记得自己造成至少51%的伤害，以获得击杀进度）|r
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
    .goto 1432/0,-2602.54,-5832.73
    >>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >> 接任务：保卫国王的领土
    .target 巡山人库伯弗林特
step
    #completewith next
    .goto 1432/0,-2635.61,-5879.14,12,0
    .goto 1432/0,-2645.27,-5874.91,12,0
    .goto 1432/0,-2631.48,-5847.50,12 >> 进入掩体，前往顶层
step
    #label Rugelfuss
    .goto 1432/0,-2634.59,-5842.81
    >>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .accept 267 >> 接任务：穴居人的威胁
    .target 拉格弗斯上尉
step << skip
    #completewith next
    .goto 1432/0,-2586.52,-5740.99,20,0
    .goto 1432/0,-2569.14,-5673.30,20,0
    .goto 1432/0,-2531.62,-5638.34,30 >>返回隧道
step << skip
    .goto 1432/0,-2513.42,-5618.48
    .link https://www.youtube.com/watch?v=AOAlX9B5aO0 >>|cRXP_WARN_如果遇到困难，点击查看详细说明|r
    .goto 1432/0,-2881.66,-5351.18,30 >>|cRXP_WARN_从隧道里的火盆处起跳，执行登出跳点传送到塞尔萨玛|r
    .isOnQuest 414
step
    .goto 1432/0,-2902.07,-5398.28,40,0
    .goto 1432/0,-2945.10,-5360.20,40,0
    .goto 1432/0,-3015.71,-5335.73,40,0
    .goto 1432/0,-3025.09,-5318.44,40,0
    .goto 1432/0,-3017.64,-5274.66
    >>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_沿塞尔萨玛主路巡逻|r
    .turnin 414 >>交任务：卡德雷尔的酒
    .accept 416 >> 接任务：狗头人的耳朵
    .accept 1339 >> 接任务：巡山人卡尔·雷矛的任务
    .target 巡山人卡德雷尔
step
    .goto 1432/0,-3019.30,-5354.50,10,0
    .goto 1432/0,-3014.88,-5366.820
    >>与|cRXP_FRIENDLY_布洛克|r交谈
    >>|cRXP_WARN_他可能在建筑内或建筑外|r
    .accept 6387 >>接任务：荣誉学员
    .target 布洛克·寻石者
step
    .goto 1432/0,-2929.93,-5424.95
    >>与|cRXP_FRIENDLY_索格拉姆|r交谈
    .fp Thelsamar >> 获取塞尔萨玛飞行点
    .turnin 6387 >>交任务：荣誉学员
    .accept 6391 >>接任务：飞往铁炉堡
    .target 索格拉姆·伯雷森
step
    #completewith next
    .goto 1432/0,-2929.93,-5424.95
    >>与|cRXP_FRIENDLY_索格拉姆|r交谈
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
--VV Merge with step above
step
    .zone Ironforge >> 前往铁炉堡
    .isOnQuest 6391
step
    #completewith next
    .goto 1455/0,-1154.84,-4771.58,30,0
    .goto 1455/0,-1123.37,-4726.31,15,0
    .goto 1455/0,-1106.29,-4718.18,12,0
    >>进入建筑
    .goto 1455/0,-1121.08,-4708.000,10 >>前往|cRXP_FRIENDLY_高尼尔·石趾|r处
step
    .goto 1455/0,-1121.08,-4708.000
    >>与|cRXP_FRIENDLY_高尼尔·石趾|r交谈
    .turnin 6391 >>交任务：飞往铁炉堡
    .accept 6388 >>接任务：格莱斯·瑟登
    .vendor >> 出售杂物
    .target 高尼尔·石趾
    .isOnQuest 291
step
    #completewith next
    .goto 1455/0,-1106.29,-4718.18,12,0
    .goto 1455/0,-1154.84,-4771.58,30,0
    >>离开建筑
    .goto 1455/0,-1152.31,-4821.12,10 >>前往 |cRXP_FRIENDLY_格莱斯|r 处
step
    .goto 1455/0,-1152.39,-4820.914
    >>与|cRXP_FRIENDLY_格莱斯|r交谈
    .turnin 6388 >>交任务：格莱斯·瑟登
--   .accept 6392 >>Accept Return to Brock
-- .fly Thelsamar >> Fly to Thelsamar
    .target 格莱斯·瑟登
step
    #completewith next
    .goto 1455/0,-1148.99,-4840.22,30,0
    .goto 1455/0,-1101.87,-4864.81,30,0
    .goto 1455/0,-1082.58,-4836.00,20,0
    .goto 1455/0,-1062.42,-4835.00,20,0
    .goto 1455/0,-1026.28,-4872.56,10 >>前往|cRXP_FRIENDLY_巴林|r处
step
    .goto 1455/0,-1026.28,-4872.56
    >>与|cRXP_FRIENDLY_巴林|r交谈
    .turnin 291 >>交任务：森内尔的报告
    .target 参议员巴林·红石
step
    #completewith next
    .goto 1455/0,-1064.87,-4828.19,20,0
    .goto 1455/0,-1062.10,-4815.100,20,0
    .goto 1455/0,-1036.48,-4804.50,20,0
    .goto 1455/0,-992.68,-4742.08,20,0
    .goto 1455/0,-931.8,-4627.59,20,0
    .goto 1455/0,-928.40,-4614.51,10 >>前往 |cRXP_FRIENDLY_丁克|r
step
    .goto 1455/0,-928.40,-4614.51
    >>与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >> 学习职业技能（霜甲术等级2、冰霜新星、变形术、造水术等级1和等级2）
    >>总费用：15 银
    >>记得留些钱买治疗药水（每瓶 3 银），青铜管（每根 8 银），以及 5 级食物（5 个 20 铜）
    .target 丁克
step << skip
    #completewith IFHS
    +|cRXP_WARN_绑定|r |T134414:0|t[炉石]后，记得在蜡烛上执行登出跳点
step
    #completewith next
    --.goto 1455/0,-929.04,-4636.72,20,0
    --.goto 1455/0,-892.19,-4770.42,20,0
    --.goto Ironforge,20.40,53.19,20,0
    >>进入建筑
    .goto 1455/0,-857.01,-4840.69,10 >>前往 |cRXP_FRIENDLY_火酒|r 处
step
    #label IFHS
    .goto 1455/0,-857.01,-4840.69
    >>与|cRXP_FRIENDLY_火酒|r交谈
    .home >> 将炉石设在铁炉堡
    .target 旅店老板洛雷·火酒
step << skip
    .goto 1455/0,-864.68,-4847.820
    .zone Dun Morogh >>|cRXP_WARN_跳上桌上的蜡烛，再执行登出跳点前往丹莫罗|r
    .isOnQuest 416
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#forever
#disabledungeons
<< Alliance Mage
#name 10-12 ADV Darkshore 1 Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none Mage
#next 12-14 ADV Loch Modan Mage AoE
#displayname 10-12 黑海岸 1（法师进阶 AoE）
step
    #completewith DeathlessSkip
    .goto 1455/0,-833.45,-5021.400,20,0
    .goto 1426/0,-1145.04,-5504.30
    .zone Dun Morogh >> 离开铁炉堡
step
    #completewith next
    .goto 1426/0,-831.81,-5108.330,30,0
    .goto 1426/0,-859.39,-5144.450,30,0
    .goto 1426/0,-1124.84,-5283.99,150 >> 前往跳点，沿途紧贴山体左侧。
step
    #label DeathlessSkip
    .goto 1426/0,-1161.78,-5289.24,12,0
    .goto 1426/0,-1173.60,-5313.54,12,0
    .goto 1426/0,-1187.88,-5327.66,4,0
    .goto 1426/0,-1199.70,-5327.00,6,0
    .goto 1426/0,-1224.33,-5245.58,10,0
    .goto 1426/0,-1239.60,-5239.670,4,0
    .goto 1426/0,-1243.54,-5243.93,4,0
    .goto 1426/0,-1251.91,-5233.100,8,0
    .goto 1426/0,-1241.07,-5180.89,15,0
    .goto 1426/0,-1225.81,-5086.99,12,0
    .goto 1426/0,-1224.82,-4952.70,15,0
    .goto 1426/0,-1220.88,-4826.62,30,0
    .goto 1426/0,-1197.73,-4626.34,30,0
    .goto 1426/0,-1178.03,-4408.980,5,0
    .goto 1426/0,-1178.53,-4396.18,5,0
    .goto 1426/0,-1189.36,-4374.84,15,0
    .goto 1426/0,-1173.11,-4348.24,8,0
    .goto 1426/0,-1184.44,-4333.14,6,0
    .goto 1426/0,-1221.87,-4312.78,10,0
    .goto 1426/0,-1227.78,-4290.13,8,0
    >>|cRXP_WARN_做丹莫罗至湿地的无死亡跳点|r
    >>|cRXP_WARN_如果没把握，每次坠落后都吃东西恢复满生命，再继续。|r
    .link https://youtu.be/QcEUvwu49KI?t=73 >> |cRXP_WARN_点击此处观看参考视频（强烈建议观看）。|r
    .goto 1426/0,-1184.93,-4250.73,20 >>小心地沿山坡往下跳。
    .isQuestAvailable 983
step
    .goto 1426/0,-1192.32,-4216.25,10,0
    .goto 1426/0,-1182.96,-4196.55,8,0
    .goto 1437/0,-1166.63,-4147.02,12,0
    .goto 1437/0,-1162.91,-4104.03,12,0
    .goto 1437/0,-1154.64,-4060.48,12,0
    .goto 1437/0,-1118.24,-4031.81,15,0
    .goto 1437/0,-1092.6,-4013.35,12,0
    .goto 1437/0,-1049.60,-3998.74,12,0
    .goto 1437/0,-1012.79,-3978.34,20,0
    .goto 1437/0,-1022.72,-3952.43,20,0
    .goto 1437/0,-1014.03,-3904.2,12,0
    >>|cRXP_WARN_做丹莫罗至湿地的无死亡跳点|r
    >>|cRXP_WARN_如果稀有怪|cRXP_ENEMY_斯拉丁|r已刷新，朝海岸下行前小心它|r
    >>|cRXP_WARN_到达海边后，小心西侧的|cRXP_ENEMY_蓝腮袭击者|r。|r
    >>|cRXP_WARN_渡海时避开|cRXP_ENEMY_湿地鳄鱼幼崽|r，等它们巡逻离开后再通过|r
    .link https://youtu.be/QcEUvwu49KI?t=336 >> |cRXP_WARN_点击此处观看参考视频（强烈建议观看）。|r
    .goto 1437/0,-914.37,-3828.40,15 >> 前往米奈希尔港
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
    .unitscan 斯拉丁
    .isQuestAvailable 983
step
    #completewith next
    .goto 1437/0,-836.21,-3796.15,10,0
    .goto 1437/0,-829.18,-3804.420,10 >>进入旅店。
step
    .goto 1437/0,-823.8,-3807.180
    >>跳上楼下的吊灯
    >>隔着墙与|cRXP_FRIENDLY_萨莫尔|r交谈。
    >>|cRXP_WARN_注意：要执行此操作，请在选项菜单的“游戏”→“控制”中绑定“与目标互动”按键|r
    >>|cRXP_WARN_如果船刚刚抵达，跳过此步骤。|r
    .vendor 1457 >> |cRXP_BUY_向他购买|r |T134831:0|t[治疗药水] |cRXP_BUY_（如果有货）|r
    .target 萨莫尔·菲斯蒂沃斯
    .money <0.03
step
    .goto 1437/0,-782.03,-3793.12
    >>与|cRXP_FRIENDLY_谢尔雷·布隆迪尔|r交谈。
    .fp Menethil Harbor >> 获取米奈希尔港飞行点
    .target 谢尔雷·布隆迪尔
step
    #completewith DarkshoreBoat
    .goto 1437/0,-715.87,-3697.48
    >>|cRXP_WARN_如果船刚刚抵达，跳过此步骤。|r
    +|cRXP_WARN_站在外面烹饪背包里所有的|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_（室内有篝火）|r
    .itemcount 769,1
step
    .goto 1437/0,-715.87,-3697.48
    >>隔墙与|cRXP_FRIENDLY_德温·晨光|r交谈。
    >>|cRXP_WARN_如果船刚刚抵达，跳过此步骤。|r
    .vendor 1453 >> |cRXP_BUY_向他购买|r |T134831:0|t[治疗药水] |cRXP_BUY_（如果有货）|r
    .target 德温·晨光
    .money <0.03
step
    #completewith Darkshore
    #label DarkshoreBoat
    .goto 1437/0,-641.43,-3758.94,20,0
    .goto 1437/0,-575.68,-3719.53,20 >>前往黑海岸渡船。
step
    #completewith next
    #requires DarkshoreBoat
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级 2）]|cRXP_WARN_，尽可能多造水|r
step
    #label Darkshore
    .goto 1437/0,-565.34,-3724.77
    .zone Darkshore >> 乘船前往 黑海岸
step
    #label Darkshoreshore
    #completewith Wizbang
    .goto 1439/1,601.35,6358.29,60 >>在最靠近岸边时跳下船。
step
    #requires Darkshoreshore
    #completewith Wizbang
    +|cRXP_WARN_将2–3只|cRXP_ENEMY_小潮行蟹|r风筝到|cRXP_FRIENDLY_维兹班恩·曲针|r附近（记得施放|r |T135848:0|t[冰霜新星]|cRXP_WARN_），接到任务后击杀它们|r
    .mob 小潮行蟹
step
    #requires Darkshoreshore
    #completewith next
    .goto 1439/1,533.23,6399.77,0,0
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_向他购买|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_，最多20条|r
    .vendor >> 出售杂物
    .collect 4592,20,983,1 --Longjaw Mud Snapper (20)
    .isQuestAvailable 983
step
    #requires Darkshoreshore
    #completewith next
    .goto 1439/1,536.51,6389.29,20,0
    .goto 1439/1,528.65,6404.14,10,0
    .goto 1439/1,537.16,6417.68,10,0
    >>上楼到顶层
    .goto 1439/1,519.48,6405.89,8 >>前往|cRXP_FRIENDLY_维兹班恩·曲针|r处。
step
    #label Wizbang
    .goto 1439/1,519.48,6405.89
    >>与|cRXP_FRIENDLY_维兹班恩·曲针|r交谈。
    .accept 983 >>接任务：传声盒827号
    .target 维兹班恩·曲针
step
    #completewith next
    >>击杀你引来的|cRXP_ENEMY_小潮行蟹|r，并拾取它们掉落的|cRXP_LOOT_蟹腿|r。
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
step
    #completewith next
    .goto 1439/1,489.35,6450.43,20,0
    .goto 1439/1,470.35,6525.530,20,0
    .goto 1439/1,492.62,6580.99,10 >>前往|cRXP_FRIENDLY_桑迪斯·织风|r处。
step
    #sticky
    #label DalmondBags
    .goto 1439/1,488.69,6564.830
    >>与|cRXP_FRIENDLY_达蒙德|r交谈。
    .vendor 4182 >> |cRXP_BUY_购买|r |T133634:0|t[棕色小包]|cRXP_BUY_，按需要和资金允许的数量尽量多买|r
    .target 达蒙德
    .money <0.0500
    .isQuestAvailable 954
step
    .goto 1439/1,492.62,6580.99
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
    .goto 1439/1,492.62,6580.99
    .accept 2178 >>接任务：炖陆行鸟
    .goto 1439/1,472.97,6557.85
    .target +奥兰达利亚·夜歌
	.skill cooking,<10,1
step
    #requires DalmondBags
    #completewith next
    .goto 1439/1,462.49,6525.97,20,0
    .goto 1439/1,414.68,6472.70,20,0
    .goto 1439/1,383.89,6445.62,20,0
    .goto 1439/1,362.93,6434.27,12 >>前往|cRXP_FRIENDLY_特伦希斯|r处。
step
    #requires DalmondBags
    >>与|cRXP_FRIENDLY_特伦希斯|r和|cRXP_FRIENDLY_萨纳瑞恩|r交谈。
    .accept 984 >>接任务：熊怪的威胁
    .target +特伦希斯
    .goto 1439/1,362.93,6434.27
    .accept 2118 >>接任务：瘟疫蔓延
    .goto 1439/1,397.65,6437.76
    .target +萨纳瑞恩·绿树
 step
    .goto 1439/1,533.23,6399.77
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_向他购买|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_，最多20条|r
    .vendor >> 出售杂物
    .collect 4592,20,983,1 --Longjaw Mud Snapper (20)
    .isQuestAvailable 983
    .itemcount 4592,<20
step
    #completewith next
    .goto 1439/1,569.26,6373.14,50,0
    .goto 1439/1,596.11,6334.27,50,0
    .goto 1439/1,592.84,6265.72,50,0
    .goto 1439/1,600.70,6228.600,50,0
    .goto 1439/1,567.29,6154.370,50,0
    >>击杀|cRXP_ENEMY_小潮行蟹|r，并拾取它们掉落的|cRXP_LOOT_蟹腿|r。
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
step
    #completewith next
    .goto 1439/1,437.60,6025.99,75,0
    >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望]|cRXP_WARN_捕捉一只|cRXP_ENEMY_狂暴蓟熊|r；射程为50码|r
    >>|cRXP_WARN_小心，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命值恢复降低50%，持续10分钟）|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .use 7586
    .unitscan 狂暴蓟熊
step
    .goto 1439/1,393.72,5993.24
    >>跑向熊怪营地。
    >>|cRXP_WARN_不要尝试与|r|cRXP_ENEMY_黑木风语者|r战斗
    .complete 984,1 --Find a corrupt furbolg camp (1)
step
    .goto 1439/1,411.40,5873.15,60,0
    .goto 1439/1,400.27,5788.0,60,0
    .goto 1439/1,427.78,5680.58,60,0
    .goto 1439/1,415.33,5434.30
    >>|cRXP_WARN_使用|r |T134335:0|t[萨纳瑞恩的希望]|cRXP_WARN_捕捉一只|cRXP_ENEMY_狂暴蓟熊|r；射程为50码|r
    >>|cRXP_WARN_小心，它们会施放|r |T135914:0|t[狂犬病] |cRXP_WARN_（近战瞬发：所有生命值恢复降低50%，持续10分钟）|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .use 7586
    .unitscan 狂暴蓟熊
step
    .goto 1439/1,302.02,5726.433
    >>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈。
    .accept 953 >>接任务：亚米萨兰的毁灭
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
    .goto 1439/1,148.09,5575.78
    >>点击地上的|cRXP_PICK_亚米萨兰的毁灭|r
    >>|cRXP_WARN_采集需要 5 秒读条|r
    .complete 953,2 --Read the Fall of Ameth'Aran (1)
step
    .goto 1439/1,105.52,5770.100
    >>点击地上的|cRXP_PICK_亚米萨兰的衰落|r
    >>|cRXP_WARN_采集需要 5 秒读条|r
    .complete 953,1 --Read the Lay of Ameth'Aran (1)
step
    #label Fall
    .goto 1439/1,302.02,5726.433
    >>与|cRXP_FRIENDLY_哨兵坦莎·月刃|r交谈。
    .turnin 953 >>交任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
step
    #label Relics
    .goto 1439/1,206.39,5802.41,50,0
    .goto 1439/1,117.96,5820.32,50,0
    .goto 1439/1,71.46,5788.00,50,0
    .goto 1439/1,87.18,5713.77,50,0
    .goto 1439/1,93.07,5585.83,50,0
    .goto 1439/1,165.78,5564.870,50,0
    .goto 1439/1,242.41,5641.72,50,0
    .goto 1439/1,206.39,5802.41
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
    .goto 1439/1,48.53,6748.67
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
	.goto 1439/1,22.33,6736.44,35,0
	.goto 1439/1,28.88,6669.20,35,0
	.goto 1439/1,58.36,6649.98,35,0
	.goto 1439/1,-6.49,6603.26,35,0
	.goto 1439/1,-45.79,6638.63,35,0
	.goto 1439/1,-17.62,6695.40,35,0
	.goto 1439/1,-62.16,6719.41,35,0
	.goto 1439/1,-130.94,6712.86,35,0
	.goto 1439/1,-36.62,6760.90,35,0
	.goto 1439/1,22.33,6736.44,35,0
    >>击杀 |cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_野生劣魔|r，并拾取它们掉落的 |cRXP_LOOT_劣魔耳环|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_恶灵劣魔|r会施放|r |T136016:0|t[毒药]|cRXP_WARN_（近战瞬发，每3秒造成3点伤害，持续15秒）；|cRXP_ENEMY_野生劣魔|r会施放|r |T136215:0|t[癫狂]|cRXP_WARN_（自身瞬发，生命值低于20%时攻击速度提高20%）|r
    .complete 955,1 --Grell Earring (8)
    .mob 恶灵劣魔
    .mob 野生劣魔
step
    .goto 1439/1,48.53,6748.67
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 955 >> 交任务：巴莎兰
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    .goto 1439/1,-38.58,6739.5,45,0
    .goto 1439/1,-66.75,6683.61,45,0
    .goto 1439/1,-67.40,6672.25,45,0
    .goto 1439/1,-34.00,6601.51,45,0
    .goto 1439/1,-115.22,6626.40,45,0
    .goto 1439/1,-160.41,6690.16,45,0
    .goto 1439/1,-187.27,6708.930,45,0
    .goto 1439/1,-165.65,6728.15,45,0
    .goto 1439/1,-38.58,6739.5,45,0
    .goto 1439/1,-66.75,6683.61,45,0
    .goto 1439/1,-67.40,6672.25,45,0
    .goto 1439/1,-34.00,6601.51,45,0
    .goto 1439/1,-115.22,6626.40,45,0
    .goto 1439/1,-160.41,6690.16,45,0
    .goto 1439/1,-187.27,6708.930,45,0
    .goto 1439/1,-165.65,6728.15
    >>击杀|cRXP_ENEMY_戴瑟雷萨特|r，拾取|cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_小心，它们会施放|r |T132222:0|t[射击]|cRXP_WARN_（远程读条，造成15–25点伤害）|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob 戴瑟雷萨特
step
#loop
	.line Darkshore,44.57,36.57,44.47,38.11,44.02,38.55,45.01,39.62,45.61,38.81,45.18,37.51,45.86,36.96,46.91,37.11,45.47,36.01,44.57,36.57
	.goto 1439/1,22.33,6736.44,35,0
	.goto 1439/1,28.88,6669.20,35,0
	.goto 1439/1,58.36,6649.98,35,0
	.goto 1439/1,-6.49,6603.26,35,0
	.goto 1439/1,-45.79,6638.63,35,0
	.goto 1439/1,-17.62,6695.40,35,0
	.goto 1439/1,-62.16,6719.41,35,0
	.goto 1439/1,-130.94,6712.86,35,0
	.goto 1439/1,-36.62,6760.90,35,0
	.goto 1439/1,22.33,6736.44,35,0
    .xp 11+1100 >> 刷怪至11级 1100+/8800 经验
    .mob 恶灵劣魔
    .mob 野生劣魔
--910+900+750+975+850 = 4385 (Turnins starting from Bashal Seal turnin)
--675+975 = 1650 (Turtle turnins)
step
    #label BashalF
    .goto 1439/1,48.53,6748.67
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 956 >> 交任务：巴莎兰
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    #sticky
    #label DalmondBags1
    .goto 1439/1,488.69,6564.830,0,0
    >>与|cRXP_FRIENDLY_达蒙德|r交谈。
    .vendor >> 出售杂物
    .target 达蒙德
    .isQuestAvailable 3524
step
    .goto 1439/1,491.97,6582.303
    >>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈。
    .turnin 958 >>交任务：上层精灵的工具
    .target 桑迪斯·织风
step
    #requires DalmondBags1
    .goto 1439/1,472.97,6557.85
    >>与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈。
    .turnin 2178 >>交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5
    .skill cooking,<10,1
step
    >>与|cRXP_FRIENDLY_特伦希斯|r和|cRXP_FRIENDLY_萨纳瑞恩|r交谈。
    .turnin 984 >> 交任务：熊怪的威胁
    .accept 985 >> 接任务：熊怪的威胁
    .accept 4761 >> 接任务：桑迪斯·织风
    .target +特伦希斯
    .goto 1439/1,362.93,6434.27
    .turnin 2118 >> 交任务：瘟疫蔓延
    .accept 2138 >> 接任务：清除疫病
    .goto 1439/1,397.65,6437.76
    .target +萨纳瑞恩·绿树
step
    #sticky
    #label Gwennyth
    .goto 1439/1,543.06,6342.57
    >>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈。
    .accept 3524 >>接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
    .goto 1439/1,561.40,6343.01
    >>与|cRXP_FRIENDLY_凯莱斯·月羽|r交谈。
    .fp Auberdine >> 开通奥伯丁飞行点
    .target 凯莱斯·月羽
step
    #requires Gwennyth
    #completewith Bones
    .goto 1439/1,569.26,6373.14,50,0
    .goto 1439/1,596.11,6334.27,50,0
    .goto 1439/1,592.84,6265.72,50,0
    .goto 1439/1,600.70,6228.600,50,0
    .goto 1439/1,567.29,6154.370,50,0
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
    .goto 1439/1,558.78,6111.57
    >>拾取|cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_小心，附近的|cRXP_ENEMY_灰雾滩行者|r具有|r |T132307:0|t[移动速度提升]
    >>|cRXP_WARN_采集需要 5 秒读条|r
    .complete 3524,1 --Sea Creature Bones (1)
step
    .goto 1439/1,569.26,6373.14
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，拾取|cRXP_LOOT_蟹腿|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    .goto 1439/1,541.75,6313.31
    >>点击|cRXP_PICK_传声盒827号|r
    .turnin 983 >>交任务：传声盒827号
    .accept 1001 >>接任务：传声盒411号
step
    .goto 1439/1,536.51,6365.28,12,0
    .goto 1439/1,543.06,6342.57
    >>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈。
    .turnin 3524 >>交任务：搁浅的巨兽
    .accept 4681 >>接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
 step
    .goto 1439/1,533.23,6399.77
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_向他购买|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_，最多40条|r
    .collect 4592,40,4681,1 --Longjaw Mud Snapper (40)
    .target 莱尔德
step
    .goto 1439/1,539.13,6409.82,12,0
    .goto 1439/1,600.70,6425.100
    >>与|cRXP_FRIENDLY_塞瑞利恩|r交谈。
    .accept 963 >>接任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #completewith Gwen
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r。
    >>|cRXP_WARN_不要特意绕路击杀它们。|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
step
    #completewith next
    .goto 1439/1,786.06,6488.85,15,0
    .goto 1439/1,818.81,6419.86,25 >> 沿码头跑向|cRXP_LOOT_海龟的残骸|r
step
    .goto 1439/1,854.84,6310.26
    >>潜到水下。
    >>拾取|cRXP_LOOT_海龟遗骸|r
    .complete 4681,1 --Sea Turtle Remains (1)
step
    .goto 1439/1,575.81,6381.430,50,0
    .goto 1439/1,596.77,6329.91,50,0
    .goto 1439/1,581.05,6209.82,50,0
    .goto 1439/1,575.15,6144.32,50,0
    .goto 1439/1,545.68,6010.270,50,0
    .goto 1439/1,634.10,5983.63,50,0
    .goto 1439/1,634.76,5915.51,50,0
    .goto 1439/1,537.82,5840.4,50,0
    .goto 1439/1,575.81,6381.430,50,0
    .goto 1439/1,596.77,6329.91,50,0
    .goto 1439/1,581.05,6209.82,50,0
    .goto 1439/1,575.15,6144.32,50,0
    .goto 1439/1,545.68,6010.270,50,0
    .goto 1439/1,634.10,5983.63,50,0
    .goto 1439/1,634.76,5915.51,50,0
    .goto 1439/1,537.82,5840.40
    .xp 11+7825 >> 刷怪至11级 7825+/8800 经验
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    #label Gwen
    .goto 1439/1,539.78,6364.84,12,0
    .goto 1439/1,543.06,6342.57
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
    .goto 1439/1,515.55,6406.32
    >>|cRXP_WARN_===请特别注意===|r
    >>|cRXP_WARN_与|r|cRXP_FRIENDLY_旅店老板莎希因|r交谈
    >>|cRXP_WARN_如果第一次使用炉石批处理技巧，请先观看下方指南。|r
    >>|cRXP_WARN_打开“设置炉石”菜单，然后使用|r |T134414:0|t[炉石]
    .hs >> |cRXP_WARN_炉石批处理：从奥伯丁传送至铁炉堡。|r
    .link https://www.youtube.com/watch?v=Is-h2TJpL3M >> |cRXP_WARN_点击此处观看操作指南（强烈建议观看）。为降低失败风险，请先设置并测试批处理窗口大小。|r
    .target 旅店老板莎希因
    .zoneskip Ironforge
step
    .goto 1455/0,-928.40,-4614.51
    >>与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >> 学习职业法术：[火球术（等级 3）]和魔法抑制。
    >>总费用：12 银。
    >>记得预留一些钱购买 |T133024:0|t[青铜管] （每根8银），以及飞往塞尔萨玛的费用（1银10铜）
    .target 丁克
step << skip
    .goto 1455/0,-928.80,-4614.51,-1
    .goto 1455/0,-1249.87,-4793.31,-1
    .vendor 5175 >> 如果愿意，可在|cRXP_FRIENDLY_丁克|r上方的柱子上执行登出跳点，然后去|cRXP_FRIENDLY_考格斯宾|r处查看是否有|T133024:0|t[青铜管]可买
    .itemcount 4371,<1
    .isQuestAvailable 418
step
    #completewith next
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级 2）]|cRXP_WARN_，尽可能多造水，然后乘坐飞行|r
step << Gnome
    .goto 1455/0,-1152.39,-4820.914
    >>与|cRXP_FRIENDLY_格莱斯|r交谈
    .accept 6392 >>接任务: 向布洛克回复
    .target 格莱斯·瑟登
step
    .goto 1455/0,-1152.39,-4820.914
    >>与|cRXP_FRIENDLY_格莱斯|r交谈
    .fly Thelsamar >> 飞往塞尔萨玛。
    .target 格莱斯·瑟登
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#forever
#disabledungeons
<< Alliance Mage
#name 10-12 LAUNCH ADV Darkshore 1 Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none none
#next 12-14 ADV Loch Modan Mage AoE
--VV Make this an alternative route that must be manually selected
#displayname 10-12 黑海岸 1（法师进阶 AoE，开服路线）
step
    #completewith next
    +|cRXP_WARN_注意：开服路线包含极难单人完成的任务，专为能在拥挤服务器上组队完成难任务的玩家，或有其他玩家协助击杀已由自己标记的怪物的玩家设计|r
step
    #completewith next
    .goto 1426/0,-831.81,-5108.330,30,0
    .goto 1426/0,-859.39,-5144.450,30,0
    .goto 1426/0,-1124.84,-5283.99,150 >> 前往跳点位置，沿途紧贴山体左侧
step
    .goto 1426/0,-1161.78,-5289.24,12,0
    .goto 1426/0,-1173.60,-5313.54,12,0
    .goto 1426/0,-1187.88,-5327.66,4,0
    .goto 1426/0,-1199.70,-5327.00,6,0
    .goto 1426/0,-1224.33,-5245.58,10,0
    .goto 1426/0,-1239.60,-5239.670,4,0
    .goto 1426/0,-1243.54,-5243.93,4,0
    .goto 1426/0,-1251.91,-5233.100,8,0
    .goto 1426/0,-1241.07,-5180.89,15,0
    .goto 1426/0,-1225.81,-5086.99,12,0
    .goto 1426/0,-1224.82,-4952.70,15,0
    .goto 1426/0,-1220.88,-4826.62,30,0
    .goto 1426/0,-1197.73,-4626.34,30,0
    .goto 1426/0,-1178.03,-4408.980,5,0
    .goto 1426/0,-1178.53,-4396.18,5,0
    .goto 1426/0,-1189.36,-4374.84,15,0
    .goto 1426/0,-1173.11,-4348.24,8,0
    .goto 1426/0,-1184.44,-4333.14,6,0
    .goto 1426/0,-1221.87,-4312.78,10,0
    .goto 1426/0,-1227.78,-4290.13,8,0
    >>|cRXP_WARN_沿无需死亡的跳点路线从丹莫罗前往湿地|r
    >>|cRXP_WARN_如果没有把握，每次下落后都先进食，将生命值回满|r
    .link https://youtu.be/QcEUvwu49KI?t=73 >> |cRXP_WARN_点击这里查看参考视频（强烈建议观看）|r
    .goto 1426/0,-1184.93,-4250.73,20 >>沿山坡小心下落
    .isQuestAvailable 983
step
    .goto 1426/0,-1192.32,-4216.25,10,0
    .goto 1426/0,-1182.96,-4196.55,8,0
    .goto 1437/0,-1166.63,-4147.02,12,0
    .goto 1437/0,-1162.91,-4104.03,12,0
    .goto 1437/0,-1154.64,-4060.48,12,0
    .goto 1437/0,-1118.24,-4031.81,15,0
    .goto 1437/0,-1092.6,-4013.35,12,0
    .goto 1437/0,-1049.60,-3998.74,12,0
    .goto 1437/0,-1012.79,-3978.34,20,0
    .goto 1437/0,-1022.72,-3952.43,20,0
    .goto 1437/0,-1014.03,-3904.2,12,0
    >>|cRXP_WARN_沿无需死亡的跳点路线从丹莫罗前往湿地|r
    >>|cRXP_WARN_跳向海岸前，留意可能刷新的稀有怪|cRXP_ENEMY_斯拉丁|r|r
    >>|cRXP_WARN_抵达海边时，留意西侧的|cRXP_ENEMY_蓝腮袭击者|r|r
    >>|cRXP_WARN_游过海湾时避开|cRXP_ENEMY_湿地鳄鱼幼崽|r，等它们巡逻走远后再通过|r
    .link https://youtu.be/QcEUvwu49KI?t=336 >> |cRXP_WARN_点击这里查看参考视频（强烈建议观看）|r
    .goto 1437/0,-914.37,-3828.40,15 >> 前往米奈希尔港
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
    .unitscan 斯拉丁
    .isQuestAvailable 983
--VV Custom Video
step
    #completewith next
    .goto 1437/0,-836.21,-3796.15,10,0
    .goto 1437/0,-829.18,-3804.420,10 >>进入旅店
step
    .goto 1437/0,-823.8,-3807.180
    >>跳到楼下的吊灯上
    >>隔墙与|cRXP_FRIENDLY_萨莫尔|r交谈
    >>|cRXP_WARN_注意：先在选项菜单的“游戏设置→控制”中，为“与目标互动”设置按键|r
    >>|cRXP_WARN_如果船刚好到港，就跳过此步骤|r
    .vendor 1457 >> |cRXP_BUY_有货时向他购买|r|T134831:0|t[治疗药水]|cRXP_BUY_。|r
    .target 萨莫尔·菲斯蒂沃斯
    .money <0.03
step
    .goto 1437/0,-782.03,-3793.12
    >>与|cRXP_FRIENDLY_谢尔雷|r交谈
    .fp Menethil Harbor >> 获取米奈希尔港飞行点
    .target 谢尔雷·布隆迪尔
step
    #completewith DarkshoreBoat
    .goto 1437/0,-715.87,-3697.48
    >>|cRXP_WARN_如果船刚好到港，就跳过此步骤|r
    +|cRXP_WARN_烹饪背包里的所有|r|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r|cRXP_WARN_。站在屋外就能使用屋内的篝火|r
    .itemcount 769,1
step
    .goto 1437/0,-715.87,-3697.48
    >>隔墙与|cRXP_FRIENDLY_德温|r交谈
    >>|cRXP_WARN_如果船刚好到港，就跳过此步骤|r
    .vendor 1453 >> |cRXP_BUY_有货时向他购买|r|T134831:0|t[治疗药水]|cRXP_BUY_。|r
    .target 德温·晨光
    .money <0.03
step
    #completewith Darkshore
    #label DarkshoreBoat
    .goto 1437/0,-641.43,-3758.94,20,0
    .goto 1437/0,-575.68,-3719.53,20 >>前往开往黑海岸的船
step
    #completewith next
    #requires DarkshoreBoat
    +|cRXP_WARN_连续施放|r|T132794:0|t[造水术2级]|cRXP_WARN_，尽可能多地制造饮水|r
step
    #label Darkshore
    .goto 1437/0,-565.34,-3724.77
    .zone Darkshore >> 乘船前往黑海岸
step
    #label Darkshoreshore
    #completewith Wizbang
    .goto 1439/1,601.35,6358.29,60 >>在船最靠近岸边时跳船
step
    #requires Darkshoreshore
    #completewith Wizbang
    +|cRXP_WARN_风筝2-3只|cRXP_ENEMY_小潮行蟹|r，带到|cRXP_FRIENDLY_维兹班恩|r附近（记得使用|r|T135848:0|t[冰霜新星]|cRXP_WARN_），接取任务后再击杀它们|r
    .mob 小潮行蟹
step
    #requires Darkshoreshore
    #completewith next
    .goto 1439/1,533.23,6399.77,0,0
    >>与|cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_BUY_向他购买|r|T133918:0|t[长嘴泥鳅]|cRXP_BUY_，补足20条|r
    .vendor >> 出售杂物
    .collect 4592,20,983,1 --Longjaw Mud Snapper (20)
    .isQuestAvailable 983
step
    #requires Darkshoreshore
    #completewith next
    .goto 1439/1,536.51,6389.29,20,0
    .goto 1439/1,528.65,6404.14,10,0
    .goto 1439/1,537.16,6417.68,10,0
    >>上楼，前往顶层
    .goto 1439/1,519.48,6405.89,8 >>前往|cRXP_FRIENDLY_维兹班恩|r处
step
    #label Wizbang
    .goto 1439/1,519.48,6405.89
    >>与|cRXP_FRIENDLY_维兹班恩|r交谈
    .accept 983 >>接任务：传声盒827号
    .target 维兹班恩·曲针
step
    #completewith DalmondBags
    >>击杀风筝过来的|cRXP_ENEMY_小潮行蟹|r，拾取|cRXP_LOOT_蟹腿|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
step
    .goto 1439/1,533.23,6399.77
    >>与|cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_BUY_向他购买|r|T133918:0|t[长嘴泥鳅]|cRXP_BUY_，补足20条|r
    .vendor >> 出售杂物
    .collect 4592,20,983,1 --Longjaw Mud Snapper (20)
    .isQuestAvailable 983
    .itemcount 4592,<20
step << skip
    #requires DalmondBags
    #completewith next
    .goto 1439/1,462.49,6525.97,20,0
    .goto 1439/1,414.68,6472.70,20,0
    .goto 1439/1,383.89,6445.62,20,0
    .goto 1439/1,362.93,6434.27,12 >>前往|cRXP_FRIENDLY_特伦希斯|r处
step
    >>与|cRXP_FRIENDLY_特伦希斯|r和|cRXP_FRIENDLY_萨纳瑞恩|r交谈
    .accept 984 >>接任务：熊怪的威胁
    .target +特伦希斯
    .goto 1439/1,362.93,6434.27,-1
    .accept 2118 >>接任务：瘟疫蔓延
    .goto 1439/1,397.65,6437.76,-1
    .target +萨纳瑞恩·绿树
step << skip
    #completewith next
    .goto 1439/1,489.35,6450.43,20,0
    .goto 1439/1,470.35,6525.530,20,0
    .goto 1439/1,492.62,6580.99,10 >>前往|cRXP_FRIENDLY_桑迪斯|r处
step
    #sticky
    #label DalmondBags
    .goto 1439/1,488.69,6564.830
    >>与|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor 4182 >> |cRXP_BUY_购买|r|T133634:0|t[棕色小包]|cRXP_BUY_，按需求和财力决定数量|r
    .target 达蒙德
    .money <0.0500
    .isQuestAvailable 954
step
    .goto 1439/1,492.62,6580.99
    >>与|cRXP_FRIENDLY_桑迪斯|r交谈
    .accept 954 >>接任务：巴莎兰
    .accept 958 >>接任务：上层精灵的工具
    .target 桑迪斯·织风
	.skill cooking,10,1
step
    >>与|cRXP_FRIENDLY_桑迪斯|r和|cRXP_FRIENDLY_奥兰达利亚|r交谈
    .accept 954 >>接任务：巴莎兰
    .accept 958 >>接任务：上层精灵的工具
    .target +桑迪斯·织风
    .goto 1439/1,492.62,6580.99,-1
    .accept 2178 >>接任务：炖陆行鸟
    .goto 1439/1,472.97,6557.85,-1
    .target +奥兰达利亚·夜歌
	.skill cooking,<10,1
step
    .goto 1439/1,-117.84,6820.72
    >>|cRXP_WARN_如果发现|cRXP_ENEMY_狂暴蓟熊|r，先使用|r|T134335:0|t[萨纳瑞恩的希望]|cRXP_WARN_，再引它过来|r
    >>|cRXP_WARN_小心它们会施放|r|T135914:0|t[狂犬病]|cRXP_WARN_（近战瞬发：所有生命回复效果降低50%，持续10分钟）|r
    .complete 2118,1 --Rabid Thistle Bear Captured (1)
    .use 7586
    .unitscan 狂暴蓟熊
step
    #completewith next
    +|cRXP_WARN_风筝2-3只|cRXP_ENEMY_恶灵劣魔|r，带到|cRXP_FRIENDLY_阿斯特利安|r附近（记得使用|r|T135848:0|t[冰霜新星]|cRXP_WARN_），接取任务后再击杀它们|r
    .mob 恶灵劣魔
step
    #label Bash1
    .goto 1439/1,48.53,6748.67
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 954 >> 交任务：巴莎兰
    .accept 955 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    #completewith BashalF
    +|cRXP_WARN_留意可能刷新的稀有怪|cRXP_ENEMY_利斯林|r|r
    >>|cRXP_WARN_他会施放|r|T136197:0|t[暗影箭]|cRXP_WARN_（远程读条：造成55-70点暗影伤害）|r
    .unitscan 利斯林
step
#loop
	.line Darkshore,44.57,36.57,44.47,38.11,44.02,38.55,45.01,39.62,45.61,38.81,45.18,37.51,45.86,36.96,46.91,37.11,45.47,36.01,44.57,36.57
	.goto 1439/1,22.33,6736.44,35,0
	.goto 1439/1,28.88,6669.20,35,0
	.goto 1439/1,58.36,6649.98,35,0
	.goto 1439/1,-6.49,6603.26,35,0
	.goto 1439/1,-45.79,6638.63,35,0
	.goto 1439/1,-17.62,6695.40,35,0
	.goto 1439/1,-62.16,6719.41,35,0
	.goto 1439/1,-130.94,6712.86,35,0
	.goto 1439/1,-36.62,6760.90,35,0
	.goto 1439/1,22.33,6736.44,35,0
    >>击杀|cRXP_ENEMY_恶灵劣魔|r和|cRXP_ENEMY_野生劣魔|r，拾取|cRXP_LOOT_劣魔耳环|r
    >>|cRXP_WARN_注意|cRXP_ENEMY_恶灵劣魔|r会施放|r|T136016:0|t[毒药]|cRXP_WARN_（近战瞬发：每3秒造成3点伤害，持续15秒），而|cRXP_ENEMY_野生劣魔|r会施放|r|T136215:0|t[癫狂]|cRXP_WARN_（自身瞬发：生命值低于20%时，攻击速度提高20%）|r
    .complete 955,1 --Grell Earring (8)
    .mob 恶灵劣魔
    .mob 野生劣魔
step
    .goto 1439/1,48.53,6748.67
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 955 >> 交任务：巴莎兰
    .accept 956 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    .goto 1439/1,-38.58,6739.5,45,0
    .goto 1439/1,-66.75,6683.61,45,0
    .goto 1439/1,-67.40,6672.25,45,0
    .goto 1439/1,-34.00,6601.51,45,0
    .goto 1439/1,-115.22,6626.40,45,0
    .goto 1439/1,-160.41,6690.16,45,0
    .goto 1439/1,-187.27,6708.930,45,0
    .goto 1439/1,-165.65,6728.15,45,0
    .goto 1439/1,-38.58,6739.5,45,0
    .goto 1439/1,-66.75,6683.61,45,0
    .goto 1439/1,-67.40,6672.25,45,0
    .goto 1439/1,-34.00,6601.51,45,0
    .goto 1439/1,-115.22,6626.40,45,0
    .goto 1439/1,-160.41,6690.16,45,0
    .goto 1439/1,-187.27,6708.930,45,0
    .goto 1439/1,-165.65,6728.15
    >>击杀|cRXP_ENEMY_戴瑟雷萨特|r，拾取|cRXP_LOOT_远古月亮石封印|r
    >>|cRXP_WARN_注意它们会施放|r|T132222:0|t[射击]|cRXP_WARN_（远程读条：造成15-25点伤害）|r
    .complete 956,1 --Ancient Moonstone Seal (1)
    .mob 戴瑟雷萨特
step
    #label BashalF
    .goto 1439/1,48.53,6748.67
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 956 >> 交任务：巴莎兰
    .accept 957 >> 接任务：巴莎兰
    .target 阿斯特利安
step
    .goto 1439/1,397.65,6437.76
    .xp 10+6625 >> 返回|cRXP_FRIENDLY_萨纳瑞恩|r处的路上刷怪，直到10级经验达到6625+/7600
step
    .goto 1439/1,397.65,6437.76
    >>与|cRXP_FRIENDLY_萨纳瑞恩|r交谈
    .turnin 2118 >> 交任务：瘟疫蔓延
    .accept 2138 >> 接任务：清除疫病
    .target 萨纳瑞恩·绿树
step
    .goto 1439/1,539.13,6409.82,12,0
    .goto 1439/1,600.70,6425.100
    >>与|cRXP_FRIENDLY_塞瑞利恩|r交谈
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
    .goto 1439/1,543.06,6342.57
    >>与|cRXP_FRIENDLY_温尼斯|r交谈
    .accept 3524 >>接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step
    .goto 1439/1,561.40,6343.01
    >>与|cRXP_FRIENDLY_凯莱斯|r交谈
    .fp Auberdine >> 获取奥伯丁飞行点
    .target 凯莱斯·月羽
step
    #requires Gwennyth
    #completewith Bones
    .goto 1439/1,569.26,6373.14,50,0
    .goto 1439/1,596.11,6334.27,50,0
    .goto 1439/1,592.84,6265.72,50,0
    .goto 1439/1,600.70,6228.600,50,0
    .goto 1439/1,567.29,6154.370,50,0
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，拾取|cRXP_LOOT_蟹腿|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    #requires Gwennyth
    #completewith next
    >>|cRXP_WARN_保留|r|T133884:0|t[鱼人的眼球]|cRXP_WARN_，它们来自|cRXP_ENEMY_灰雾滩行者|r和|r|cRXP_ENEMY_灰雾袭击者|r
    .collect 730,3,38,1 --Murloc Eyes (3)
    .mob 灰雾滩行者
    .mob 灰雾袭击者
step
    #requires Gwennyth
    #label Bones
    .goto 1439/1,558.78,6111.57
    >>拾取|cRXP_LOOT_搁浅的海洋生物|r的骸骨
    >>|cRXP_WARN_注意附近的|cRXP_ENEMY_灰雾滩行者|r拥有|r|T132307:0|t[移动速度提升]
    >>|cRXP_WARN_互动需要5秒|r
    .complete 3524,1 --Sea Creature Bones (1)
step
    .goto 1439/1,569.26,6373.14
    >>击杀|cRXP_ENEMY_小潮行蟹|r和|cRXP_ENEMY_暗礁蟹幼崽|r，拾取|cRXP_LOOT_蟹腿|r
    .complete 983,1 --Crawler Leg (6)
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    #requires Gwennyth
    .goto 1439/1,393.72,5993.24
    >>跑向熊怪营地
    >>|cRXP_WARN_不要尝试与|r|cRXP_ENEMY_黑木风语者|r战斗
    .complete 984,1 --Find a corrupt furbolg camp (1)
step
    .goto 1439/1,302.02,5726.433
    >>与|cRXP_FRIENDLY_坦莎|r交谈
    .accept 953 >>接任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
step
    #completewith Anaya
    +|cRXP_WARN_如果稀有怪|cRXP_ENEMY_莫嘉泽尔|r已刷新，避免引到她|r
    .unitscan 莫嘉泽尔
 step
    #completewith Relics
    .goto 1439/1,161.19,5684.51,0
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
step
    #completewith Fall
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r，拾取|cRXP_LOOT_上层精灵的遗物|r
    >>|cRXP_WARN_只有挡路时才击杀|cRXP_ENEMY_哀嚎的贵族|r|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
step
    .goto 1439/1,166.43,5633.86
    >>点击|cRXP_PICK_上古之火|r
    >>|cRXP_WARN_互动需要5秒|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
step
    .goto 1439/1,148.09,5575.78
    >>点击地上的|cRXP_PICK_亚米萨兰的毁灭|r
    >>|cRXP_WARN_互动需要5秒|r
    .complete 953,2 --Read the Fall of Ameth'Aran (1)
step
    .goto 1439/1,105.52,5770.100
    >>点击地上的|cRXP_PICK_亚米萨兰的衰落|r
    >>|cRXP_WARN_互动需要5秒|r
    .complete 953,1 --Read the Lay of Ameth'Aran (1)
step
    #label Fall
    .goto 1439/1,302.02,5726.433
    >>与|cRXP_FRIENDLY_坦莎|r交谈
    .turnin 953 >>交任务：亚米萨兰的毁灭
    .target 哨兵坦莎·月刃
step
    #label Relics
    .goto 1439/1,206.39,5802.41,50,0
    .goto 1439/1,117.96,5820.32,50,0
    .goto 1439/1,71.46,5788.00,50,0
    .goto 1439/1,87.18,5713.77,50,0
    .goto 1439/1,93.07,5585.83,50,0
    .goto 1439/1,165.78,5564.870,50,0
    .goto 1439/1,242.41,5641.72,50,0
    .goto 1439/1,206.39,5802.41
    >>击杀|cRXP_ENEMY_被诅咒的贵族|r和|cRXP_ENEMY_挣扎的贵族|r
    >>|cRXP_WARN_只有挡路时才击杀|cRXP_ENEMY_哀嚎的贵族|r|r
    .complete 958,1 --Highborne Relic (7)
    .mob 被诅咒的贵族
    .mob 挣扎的贵族
step
    #label Anaya
    .goto 1439/1,161.19,5684.51
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
step
    #completewith next
    .goto 1439/1,-22.21,5999.79,30 >>进入洞穴
    >>|cRXP_WARN_沿途尽量避开|cRXP_ENEMY_蓟熊|r、|cRXP_ENEMY_月夜枭兽|r和|cRXP_ENEMY_狂暴的月夜枭兽|r|r
    .isOnQuest 958
step
    .goto 1439/1,-54.96,6015.51
    .goto 1439/1,210.32,6739.501,30 >>|cRXP_WARN_击杀洞内的|cRXP_ENEMY_月夜枭兽圣者|r ，随后坐下喝水，并在洞穴后方的蘑菇顶上登出再登录，跳转至巴莎兰附近|r
    >>|cRXP_WARN_注意它会施放|r|T136006:0|t[愤怒]|cRXP_WARN_（远程读条：造成30-45点自然伤害）、|r|T136096:0|t[月火术]|cRXP_WARN_（远程瞬发：造成20-30点自然伤害，随后在12秒内造成44点自然伤害），以及|r|T136085:0|t[愈合]|cRXP_WARN_（自身读条：回复约150点生命值。较少施放，但如果施放就逃跑）|r
    >>|cRXP_WARN_可以避开他的|r|T136006:0|t[愤怒]|cRXP_WARN_，方法是躲在洞口内的岩石后面遮挡视线|r
    .mob 月夜枭兽圣者
    .isOnQuest 958
step
    .goto 1439/1,47.88,6748.67
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈
    .turnin 957,3 >>交任务：巴莎兰
    .target 阿斯特利安
step
    #sticky
    #label DalmondBags1
    .goto 1439/1,488.69,6564.830,0,0
    >>与|cRXP_FRIENDLY_达蒙德|r交谈
    .vendor >> 出售杂物
    .target 达蒙德
    .isQuestAvailable 3524
step
    .goto 1439/1,491.97,6582.303
    >>与|cRXP_FRIENDLY_桑迪斯|r交谈
    .turnin 958 >>交任务：上层精灵的工具
    .target 桑迪斯·织风
step
    #requires DalmondBags1
    .goto 1439/1,472.97,6557.85
    >>与|cRXP_FRIENDLY_奥兰达利亚|r交谈
    .turnin 2178 >>交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
    .itemcount 5469,5
    .skill cooking,<10,1
step
    .goto 1439/1,362.93,6434.27
    >>与|cRXP_FRIENDLY_特伦希斯|r交谈
    .turnin 984 >> 交任务：熊怪的威胁
    .accept 985 >> 接任务：熊怪的威胁
    .accept 4761 >> 接任务：桑迪斯·织风
    .target 特伦希斯
step
    .goto 1439/1,541.75,6313.31
    >>点击|cRXP_PICK_传声盒827号|r
    .turnin 983 >>交任务：传声盒827号
    .accept 1001 >>接任务：传声盒411号
step
    .goto 1439/1,536.51,6365.28,12,0
    .goto 1439/1,543.06,6342.57
    >>与|cRXP_FRIENDLY_温尼斯|r交谈
    .turnin 3524 >>交任务：搁浅的巨兽
    .accept 4681 >>接任务：搁浅的巨兽
    .target 温尼斯·布莱葛
 step
    .goto 1439/1,533.23,6399.77
    >>与|cRXP_FRIENDLY_莱尔德|r交谈
    >>|cRXP_BUY_向他购买|r|T133918:0|t[长嘴泥鳅]|cRXP_BUY_，补足40条|r
    .collect 4592,40,4681,1 --Longjaw Mud Snapper (40)
    .target 莱尔德
step
    .goto 1439/1,539.13,6409.82,12,0
    .goto 1439/1,600.70,6425.100
    >>与|cRXP_FRIENDLY_塞瑞利恩|r交谈
    .turnin 963 >>交任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #completewith Gwen
    >>击杀|cRXP_ENEMY_黑海岸蛇颈龙|r
    >>|cRXP_WARN_不要为了它们特意绕路|r
    .complete 1001,1 --Thresher Eye (3)
    .mob 黑海岸蛇颈龙
step
    #completewith next
    .goto 1439/1,786.06,6488.85,15,0
    .goto 1439/1,818.81,6419.86,25 >> 沿码头朝|cRXP_LOOT_海龟的残骸|r方向跑
step
    .goto 1439/1,854.84,6310.26
    >>潜入水中
    >>拾取|cRXP_LOOT_海龟的残骸|r
    .complete 4681,1 --Sea Turtle Remains (1)
step
    .goto 1439/1,575.81,6381.430,50,0
    .goto 1439/1,596.77,6329.91,50,0
    .goto 1439/1,581.05,6209.82,50,0
    .goto 1439/1,575.15,6144.32,50,0
    .goto 1439/1,545.68,6010.270,50,0
    .goto 1439/1,634.10,5983.63,50,0
    .goto 1439/1,634.76,5915.51,50,0
    .goto 1439/1,537.82,5840.4,50,0
    .goto 1439/1,575.81,6381.430,50,0
    .goto 1439/1,596.77,6329.91,50,0
    .goto 1439/1,581.05,6209.82,50,0
    .goto 1439/1,575.15,6144.32,50,0
    .goto 1439/1,545.68,6010.270,50,0
    .goto 1439/1,634.10,5983.63,50,0
    .goto 1439/1,634.76,5915.51,50,0
    .goto 1439/1,537.82,5840.40
    .xp 11+7825 >> 刷怪至11级 7825+/8800 经验
    .mob 小潮行蟹
    .mob 暗礁蟹幼崽
step
    #label Gwen
    .goto 1439/1,539.78,6364.84,12,0
    .goto 1439/1,543.06,6342.57
    >>与|cRXP_FRIENDLY_温尼斯|r交谈
    .turnin 4681,1 >> 交任务：搁浅的巨兽
    .target 温尼斯·布莱葛
step << skip
    #completewith next
    +装备新鞋（装备|T132537:0|t[沙浪之靴]）
    .use 15398
    .itemcount 15398,1
    .itemStat 8,LEVEL,<14
step
    .goto 1439/1,515.55,6406.32
    >>|cRXP_WARN_===注意===|r
    >>|cRXP_WARN_与|r|cRXP_FRIENDLY_莎希因|r交谈
    >>|cRXP_WARN_如果首次使用炉石批处理操作，请先观看下方教学视频|r
    >>|cRXP_WARN_打开“将这里设为家”的对话菜单，再使用|r|T134414:0|t[炉石]
    .hs >> |cRXP_WARN_使用炉石批处理操作，从奥伯丁返回铁炉堡|r
    .link https://www.youtube.com/watch?v=Is-h2TJpL3M >> |cRXP_WARN_点击这里观看视频（强烈建议）。事先设置并测试批处理窗口大小，以降低失败风险|r
    .target 旅店老板莎希因
    .zoneskip Ironforge
step
    .goto 1455/0,-928.40,-4614.51
    >>与|cRXP_FRIENDLY_丁克|r交谈
    .trainer >> 学习职业技能：火球术3级、魔法抑制
    >>总花费：12银
    >>记得留钱购买|T133024:0|t[青铜管]（每根8银）以及支付飞往塞尔萨玛的费用（1银10铜）
    .target 丁克
step << skip
    .goto 1455/0,-928.80,-4614.51,-1
    .goto 1455/0,-1249.87,-4793.31,-1
    .vendor 5175 >> 如有需要，可在|cRXP_FRIENDLY_丁克|r上方的石柱上登出跳点，查看|cRXP_FRIENDLY_考格斯宾|r是否出售|T133024:0|t[青铜管]
    .itemcount 4371,<1
    .isQuestAvailable 418
step
    #completewith next
    +|cRXP_WARN_乘坐航班前，连续施放|r|T132794:0|t[造水术2级]|cRXP_WARN_，尽可能多地制造饮水|r
step << Gnome
    .goto 1455/0,-1152.39,-4820.914
    >>与|cRXP_FRIENDLY_格莱斯|r交谈
    .accept 6392 >>接任务：向布洛克回复
    .target 格莱斯·瑟登
step
    .goto 1455/0,-1152.39,-4820.914
    >>与|cRXP_FRIENDLY_格莱斯|r交谈
    .fly Thelsamar >> 飞往塞尔萨玛
    .target 格莱斯·瑟登
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#forever
#disabledungeons
<< Alliance Mage
#name 12-14 ADV Loch Modan Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none Mage
#next 14-16 ADV Darkshore 2 Mage AoE
#displayname 12-14 洛克莫丹（法师进阶 AoE）
step
    #completewith next
    +|cRXP_WARN_在洛克莫丹做任务时，拾取到的所有|T133970:0|t[|cRXP_LOOT_大块野猪肉]|r都留着，后面要用|r
step
    .zone Loch Modan >> 前往洛克莫丹
    .isOnQuest 6392 << Gnome
step
    .goto 1432/0,-2602.54,-5832.73
    >>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .accept 224 >> 接任务：保卫国王的领土
    .target 巡山人库伯弗林特
step
    #completewith next
    .goto 1432/0,-2635.61,-5879.14,12,0
    .goto 1432/0,-2645.27,-5874.91,12,0
    .goto 1432/0,-2631.48,-5847.50,12 >> 进入掩体, 前往顶层
step
    .goto 1432/0,-2634.59,-5842.81
    >>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .accept 267 >> 接任务：穴居人的威胁
    .target 拉格弗斯上尉
step
    #completewith Rugel2
    >>击杀|cRXP_ENEMY_山猪|r，拾取|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_山猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发，提升移动速度3秒；命中时造成40–100点近战伤害，仅能在远距离施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .goto 1432/0,-2729.40,-5534.96
    >>击杀|cRXP_ENEMY_碎石穴居人|r和|cRXP_ENEMY_碎石怪斥候|r，拾取|cRXP_LOOT_穴居人的石牙|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_碎石怪斥候|r会施放|r |T132222:0|t[射击]|cRXP_WARN_（远程施法：造成14-20点伤害）|r
    >>|cRXP_WARN_这里的怪物刷新很快，应该无需离开此处|r
    .complete 224,1 --Kill Stonesplinter Trogg (x10)
    .mob +碎石穴居人
    .complete 224,2 --Kill Stonesplinter Scout (x10)
    .mob +碎石怪斥候
    .complete 267,1 --Collect Trogg Stone Tooth (x8)
    .mob +碎石穴居人
    .mob +碎石怪斥候
step
    .goto 1432/0,-2602.54,-5832.73
    >>与|cRXP_FRIENDLY_巡山人库伯弗林特|r交谈
    .turnin 224 >> 交任务：保卫国王的领土
    .target 巡山人库伯弗林特
step
    #completewith next
    .goto 1432/0,-2635.61,-5879.14,12,0
    .goto 1432/0,-2645.27,-5874.91,12,0
    .goto 1432/0,-2631.48,-5847.50,12 >> 进入掩体, 前往顶层
step
    #label Rugel2
    .goto 1432/0,-2634.59,-5842.81
    >>与|cRXP_FRIENDLY_拉格弗斯上尉|r交谈
    .turnin 267 >> 交任务：穴居人的威胁
    .target 拉格弗斯上尉
step << skip
    #completewith next
    .goto 1432/0,-2586.52,-5740.99,20,0
    .goto 1432/0,-2569.14,-5673.30,20,0
    .goto 1432/0,-2531.62,-5638.34,30 >>返回隧道
step << skip
    .goto 1432/0,-2513.42,-5618.48
    .goto 1432/0,-2881.66,-5351.18,30 >>在隧道内的火盆上跳跃并登出，跳过路程前往塞尔萨玛
    .isOnQuest 1339
step
    #completewith next
    >>击杀|cRXP_ENEMY_山猪|r，拾取|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_山猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发，提升移动速度3秒；命中时造成40–100点近战伤害，仅能在远距离施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .goto 1432/0,-2643.89,-4817.34,30 >>前往阿尔加兹车站
    .isOnQuest 1339
step
    .goto 1432/0,-2659.34,-4822.300
    >>与|cRXP_FRIENDLY_高索·布鲁姆|r交谈。
    .vendor >>出售杂物
    .target 高索·布鲁姆
    .isOnQuest 1339
step
    .goto 1432/0,-2676.82,-4825.93
    >>上楼
    >>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈。
    .turnin 353 >> 交任务：雷矛的包裹 << Human
    .turnin 1339 >> 交任务：巡山人卡尔·雷矛的任务
    .accept 1338 >> 接任务：卡尔·雷矛的订单
    .accept 307 >> 接任务：肮脏的爪子
    .target 巡山人卡尔·雷矛
step
    #completewith Entrance
    >>击杀|cRXP_ENEMY_山猪|r，拾取|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_山猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发，提升移动速度3秒；命中时造成40–100点近战伤害，仅能在远距离施放）|r
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
    .goto 1432/0,-2972.13,-4836.10,40 >>前往矿洞入口
    .isOnQuest 307
step
    #label Gear
    .goto 1432/0,-2971.58,-4854.31,12,0
    .goto 1432/0,-2998.33,-4868.66,12,0
    .goto 1432/0,-2965.79,-4891.84,12,0
    .goto 1432/0,-2983.99,-4892.58,12,0
    .goto 1432/0,-2955.86,-4919.99,12,0
    .goto 1432/0,-2989.51,-4910.05,12,0
    .goto 1432/0,-2993.09,-4945.19,12,0
    .goto 1432/0,-2957.24,-4945.37,12,0
    .goto 1432/0,-2971.58,-4854.31,12,0
    .goto 1432/0,-2998.33,-4868.66,12,0
    .goto 1432/0,-2965.79,-4891.84,12,0
    .goto 1432/0,-2983.99,-4892.58,12,0
    .goto 1432/0,-2955.86,-4919.99,12,0
    .goto 1432/0,-2989.51,-4910.05,12,0
    .goto 1432/0,-2993.09,-4945.19,12,0
    .goto 1432/0,-2957.24,-4945.37
    >>拾取地上的|cRXP_LOOT_矿工装备|r；|cRXP_WARN_它们共享刷新点|r
    >>|cRXP_WARN_小心，|r|cRXP_ENEMY_坑道鼠地卜师|r会施放 |T135824:0|t[快速烈焰防护结界]|cRXP_WARN_（自身读条，免疫火焰伤害10秒），以及|r |T135824:0|t[火焰冲击]|cRXP_WARN_（远程瞬发，造成20–30点火焰伤害）|r
    .complete 307,1 --Collect Miners' Gear (x4)
--VV Rat Diggers
step
    #label Exit
    .goto 1432/0,-2972.13,-4836.10,40 >>离开矿洞
    .isOnQuest 307
step
#loop
	.line Loch Modan,34.38,17.67,35.44,15.34,37.15,10.53,39.38,10.92,38.46,14.43,39.67,18.12,39.84,24.83,37.34,26.82,37.15,24.53,38.85,21.25,37.89,18.88,34.38,17.67
	.goto 1432/0,-2942.06,-4812.55,40,0
	.goto 1432/0,-2971.30,-4769.69,40,0
	.goto 1432/0,-3018.47,-4681.21,40,0
	.goto 1432/0,-3079.98,-4688.38,40,0
	.goto 1432/0,-3054.60,-4752.95,40,0
	.goto 1432/0,-3087.98,-4820.83,40,0
	.goto 1432/0,-3092.67,-4944.27,40,0
	.goto 1432/0,-3023.71,-4980.88,40,0
	.goto 1432/0,-3018.47,-4938.75,40,0
	.goto 1432/0,-3065.36,-4878.41,40,0
	.goto 1432/0,-3038.88,-4834.81,40,0
	.goto 1432/0,-2942.06,-4812.55,40,0
    >>击杀|cRXP_ENEMY_坑道鼠斥候|r、|cRXP_ENEMY_坑道鼠歹徒|r、|cRXP_ENEMY_坑道鼠狗头人|r和|cRXP_ENEMY_坑道鼠征粮官|r，拾取它们掉落的|cRXP_LOOT_坑道鼠的耳朵|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_坑道鼠狗头人|r会施放|r |T132152:0|t[痛击]|cRXP_WARN_（每10秒获得2次额外攻击机会）|r
    .complete 416,1 --Collect Tunnel Rat Ear (x12)
    .mob 坑道鼠歹徒
    .mob 坑道鼠狗头人
    .mob 坑道鼠斥候
    .mob 坑道鼠征粮官
step
    #completewith next
    >>击杀|cRXP_ENEMY_山猪|r，拾取|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_山猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发，提升移动速度3秒；命中时造成40–100点近战伤害，仅能在远距离施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
step
    .goto 1432/0,-2643.89,-4817.34,30 >>前往阿尔加兹车站
    .isOnQuest 307
step
    .goto 1432/0,-2659.34,-4822.300
    >>与|cRXP_FRIENDLY_高索·布鲁姆|r交谈。
    .vendor >>出售杂物
    .target 高索·布鲁姆
    .isOnQuest 307
step
    .goto 1432/0,-2676.82,-4825.93
    >>上楼
    >>与|cRXP_FRIENDLY_巡山人卡尔·雷矛|r交谈。
    .turnin 307,2 >> 交任务：肮脏的爪子
    .target 巡山人卡尔·雷矛
step
#loop
	.line Loch Modan,31.01,24.84,32.69,28.67,34.93,31.55,36.78,33.19,39.65,32.82,38.15,38.16,33.53,40.53,29.87,53.51,29.58,46.54,29.95,39.84,27.09,40.10,29.03,33.44,27.19,29.01,25.77,25.60,23.64,22.20,31.01,24.84
	.goto 1432/0,-2849.11,-4944.45,35,0
	.goto 1432/0,-2895.45,-5014.91,35,0
	.goto 1432/0,-2957.24,-5067.89,35,0
	.goto 1432/0,-3008.26,-5098.06,35,0
	.goto 1432/0,-3087.43,-5091.25,35,0
	.goto 1432/0,-3046.05,-5189.48,35,0
	.goto 1432/0,-2918.62,-5233.08,35,0
	.goto 1432/0,-2817.66,-5471.86,35,0
	.goto 1432/0,-2809.66,-5343.64,35,0
	.goto 1432/0,-2819.87,-5220.39,35,0
	.goto 1432/0,-2740.98,-5225.170,35,0
	.goto 1432/0,-2794.49,-5102.66,35,0
	.goto 1432/0,-2743.74,-5021.16,35,0
	.goto 1432/0,-2704.57,-4958.430,35,0
	.goto 1432/0,-2645.82,-4895.890,35,0
	.goto 1432/0,-2849.11,-4944.45,35,0
    >>击杀|cRXP_ENEMY_山猪|r，拾取|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_老黑熊|r，拾取|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_森林潜伏者|r，拾取|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_山猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发，提升移动速度3秒；命中时造成40–100点近战伤害，仅能在远距离施放）|r
    .collect 3172,3,418,1 --Collect Boar Intestines (x3)
    .mob +山猪
    .collect 3173,3,418,1 --Collect Bear Meat (x3)
    .mob +老黑熊
    .collect 3174,3,418,1 --Collect Spider Ichor (x3)
    .mob +森林潜伏者
    .xp <13+5500,1 << Gnome
step
    #completewith Boast
    >>击杀|cRXP_ENEMY_癞皮山猪|r和|cRXP_ENEMY_山猪|r，拾取掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_灰斑黑熊|r和|cRXP_ENEMY_老黑熊|r，拾取掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_峭壁潜伏者|r和|cRXP_ENEMY_森林潜伏者|r，拾取掉落的|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_山猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发，提升移动速度3秒；命中时造成40–100点近战伤害，仅能在远距离施放）|r
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
    .goto 1432/0,-3019.30,-5354.50,10,0
    >>与|cRXP_FRIENDLY_布洛克·寻石者|r和|cRXP_FRIENDLY_吉恩·角盔|r交谈。
    >>|cRXP_WARN_他们可能在建筑内，也可能在建筑外。|r
    .turnin 6392 >>交任务：向布洛克回复 << Gnome
    .target +布洛克·寻石者
    .goto 1432/0,-3014.88,-5366.820
    .accept 436 >> 接任务：铁环挖掘场
    .goto 1432/0,-3020.68,-5358.91
    .target +吉恩·角盔
    .xp >13+5500,1 << Gnome
step
    .goto 1432/0,-3020.68,-5358.91
    >>与|cRXP_FRIENDLY_吉恩·角盔|r交谈。
    >>|cRXP_WARN_他可能在建筑内或建筑外|r
    .accept 436 >> 接任务：铁环挖掘场
    .target 吉恩·角盔
    .xp >13+6550,1 << Gnome
    .isQuestTurnedIn 6392
step << Human
#loop
	.line Loch Modan,31.01,24.84,32.69,28.67,34.93,31.55,36.78,33.19,39.65,32.82,38.15,38.16,33.53,40.53,29.87,53.51,29.58,46.54,29.95,39.84,27.09,40.10,29.03,33.44,27.19,29.01,25.77,25.60,23.64,22.20,31.01,24.84
	.goto 1432/0,-2849.11,-4944.45,50,0
	.goto 1432/0,-2895.45,-5014.91,50,0
	.goto 1432/0,-2957.24,-5067.89,50,0
	.goto 1432/0,-3008.26,-5098.06,50,0
	.goto 1432/0,-3087.43,-5091.25,50,0
	.goto 1432/0,-3046.05,-5189.48,50,0
	.goto 1432/0,-2918.62,-5233.08,50,0
	.goto 1432/0,-2817.66,-5471.86,50,0
	.goto 1432/0,-2809.66,-5343.64,50,0
	.goto 1432/0,-2819.87,-5220.39,50,0
	.goto 1432/0,-2740.98,-5225.170,50,0
	.goto 1432/0,-2794.49,-5102.66,50,0
	.goto 1432/0,-2743.74,-5021.16,50,0
	.goto 1432/0,-2704.57,-4958.430,50,0
	.goto 1432/0,-2645.82,-4895.890,50,0
	.goto 1432/0,-2849.11,-4944.45,50,0
    .xp 13+8675 >> 刷怪使13级经验达到8675+/11400
step << Gnome
#loop
	.line Loch Modan,31.01,24.84,32.69,28.67,34.93,31.55,36.78,33.19,39.65,32.82,38.15,38.16,33.53,40.53,29.87,53.51,29.58,46.54,29.95,39.84,27.09,40.10,29.03,33.44,27.19,29.01,25.77,25.60,23.64,22.20,31.01,24.84
	.goto 1432/0,-2849.11,-4944.45,50,0
	.goto 1432/0,-2895.45,-5014.91,50,0
	.goto 1432/0,-2957.24,-5067.89,50,0
	.goto 1432/0,-3008.26,-5098.06,50,0
	.goto 1432/0,-3087.43,-5091.25,50,0
	.goto 1432/0,-3046.05,-5189.48,50,0
	.goto 1432/0,-2918.62,-5233.08,50,0
	.goto 1432/0,-2817.66,-5471.86,50,0
	.goto 1432/0,-2809.66,-5343.64,50,0
	.goto 1432/0,-2819.87,-5220.39,50,0
	.goto 1432/0,-2740.98,-5225.170,50,0
	.goto 1432/0,-2794.49,-5102.66,50,0
	.goto 1432/0,-2743.74,-5021.16,50,0
	.goto 1432/0,-2704.57,-4958.430,50,0
	.goto 1432/0,-2645.82,-4895.890,50,0
	.goto 1432/0,-2849.11,-4944.45,50,0
    .xp 13+6545 >> 刷怪使13级经验达到6545+/11400
    .xp <13+5500,1
    .isOnQuest 6392
step << Gnome
    #completewith next
    .goto 1432/0,-3266.44,-5656.19,50,0
    .goto 1432/0,-3354.99,-5726.64,50,0
    .goto 1432/0,-3425.60,-5738.42,50,0
    .goto 1432/0,-3781.98,-5702.54,20 >>前往|cRXP_FRIENDLY_奥德伦·科尔东|r处
step << Gnome
    #completewith Boast
    .goto 1432/0,-3781.98,-5702.54
    >>与|cRXP_FRIENDLY_奥德伦·科尔东|r交谈
    .vendor 1214 >> |cRXP_BUY_购买|r |T132491:0|t[智者腰带] |cRXP_BUY_（如果他有货）|r
    .isQuestAvailable 298
step << Gnome
    >>与|cRXP_FRIENDLY_勘察员基恩萨·铁环|r和|cRXP_FRIENDLY_麦格玛尔·落斧|r交谈。
    .accept 298 >> 接任务：挖掘进度报告
    .target +勘察员基恩萨·铁环
    .goto 1432/0,-3812.59,-5694.63
    .turnin 436 >> 交任务：铁环挖掘场
    .goto 1432/0,-3783.63,-5713.77
    .target +麦格玛尔·落斧
    .isOnQuest 436
step << Gnome
    #label ExcavationP
    .goto 1432/0,-3812.59,-5694.63
    >>与|cRXP_FRIENDLY_勘察员基恩萨·铁环|r交谈。
    .accept 298 >> 接任务：挖掘进度报告
    .target 勘察员基恩萨·铁环
    .isQuestTurnedIn 436
step << Gnome
    #completewith next
    .goto 1432/0,-3816.18,-5786.250,30,0
    .goto 1432/0,-4013.68,-5791.58,40,0
    .goto 1432/0,-4124.56,-5742.100,40,0
    .goto 1432/0,-4258.62,-5650.48,15,0
    .goto 1432/0,-4296.41,-5694.63,20 >>前往|cRXP_FRIENDLY_达瑞尔|r处。
step << Gnome
    #label Boast
    .goto 1432/0,-4296.41,-5694.63
    >>与|cRXP_FRIENDLY_达瑞尔|r交谈。
    .accept 257 >> 接任务：自豪的猎人
    .target 年轻的达瑞尔
    .isOnQuest 298
step << Gnome
#loop
	.line Loch Modan,79.89,65.91,76.70,74.44,74.74,69.21,77.03,60.55,76.09,57.94,77.39,55.98,79.63,59.85,79.89,65.91
	.goto 1432/0,-4197.38,-5699.97,45,0
	.goto 1432/0,-4109.39,-5856.89,45,0
	.goto 1432/0,-4055.33,-5760.68,45,0
	.goto 1432/0,-4118.49,-5601.37,45,0
	.goto 1432/0,-4092.57,-5553.35,45,0
	.goto 1432/0,-4128.42,-5517.30,45,0
	.goto 1432/0,-4190.21,-5588.49,45,0
	.goto 1432/0,-4197.38,-5699.97,45,0
    >>击杀|cRXP_ENEMY_山鹫|r
    .complete 257,1 --Mountain Buzzard (6)
    .mob 山鹫
    .isOnQuest 257
step << Gnome
    #completewith next
    .goto 1432/0,-4258.62,-5650.48,15,0
    .goto 1432/0,-4296.41,-5694.63,20 >>前往|cRXP_FRIENDLY_达瑞尔|r处。
step << Gnome
    .goto 1432/0,-4296.41,-5694.63
    >>与|cRXP_FRIENDLY_达瑞尔|r交谈。
    .turnin 257,2 >> 交任务：自豪的猎人
    .target 年轻的达瑞尔
    .isQuestComplete 257
step << Gnome
#loop
	.line Loch Modan,31.01,24.84,32.69,28.67,34.93,31.55,36.78,33.19,39.65,32.82,38.15,38.16,33.53,40.53,29.87,53.51,29.58,46.54,29.95,39.84,27.09,40.10,29.03,33.44,27.19,29.01,25.77,25.60,23.64,22.20,31.01,24.84
	.goto 1432/0,-2849.11,-4944.45,50,0
	.goto 1432/0,-2895.45,-5014.91,50,0
	.goto 1432/0,-2957.24,-5067.89,50,0
	.goto 1432/0,-3008.26,-5098.06,50,0
	.goto 1432/0,-3087.43,-5091.25,50,0
	.goto 1432/0,-3046.05,-5189.48,50,0
	.goto 1432/0,-2918.62,-5233.08,50,0
	.goto 1432/0,-2817.66,-5471.86,50,0
	.goto 1432/0,-2809.66,-5343.64,50,0
	.goto 1432/0,-2819.87,-5220.39,50,0
	.goto 1432/0,-2740.98,-5225.170,50,0
	.goto 1432/0,-2794.49,-5102.66,50,0
	.goto 1432/0,-2743.74,-5021.16,50,0
	.goto 1432/0,-2704.57,-4958.430,50,0
	.goto 1432/0,-2645.82,-4895.890,50,0
	.goto 1432/0,-2849.11,-4944.45,50,0
    >>击杀|cRXP_ENEMY_癞皮山猪|r和|cRXP_ENEMY_山猪|r，拾取掉落的|cRXP_LOOT_猪大肠|r
    >>击杀|cRXP_ENEMY_灰斑黑熊|r和|cRXP_ENEMY_老黑熊|r，拾取掉落的|cRXP_LOOT_熊肉|r
    >>击杀|cRXP_ENEMY_峭壁潜伏者|r和|cRXP_ENEMY_森林潜伏者|r，拾取掉落的|cRXP_LOOT_蜘蛛的毒液|r
    >>|cRXP_WARN_必要时，记得把它们风筝到|cRXP_FRIENDLY_巡山人|r身边。|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_山猪|r会施放|r |T132337:0|t[冲锋]|cRXP_WARN_（自身瞬发，提升移动速度3秒；命中时造成40–100点近战伤害，仅能在远距离施放）|r
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
	.goto 1432/0,-2849.11,-4944.45,50,0
	.goto 1432/0,-2895.45,-5014.91,50,0
	.goto 1432/0,-2957.24,-5067.89,50,0
	.goto 1432/0,-3008.26,-5098.06,50,0
	.goto 1432/0,-3087.43,-5091.25,50,0
	.goto 1432/0,-3046.05,-5189.48,50,0
	.goto 1432/0,-2918.62,-5233.08,50,0
	.goto 1432/0,-2817.66,-5471.86,50,0
	.goto 1432/0,-2809.66,-5343.64,50,0
	.goto 1432/0,-2819.87,-5220.39,50,0
	.goto 1432/0,-2740.98,-5225.170,50,0
	.goto 1432/0,-2794.49,-5102.66,50,0
	.goto 1432/0,-2743.74,-5021.16,50,0
	.goto 1432/0,-2704.57,-4958.430,50,0
	.goto 1432/0,-2645.82,-4895.890,50,0
	.goto 1432/0,-2849.11,-4944.45,50,0
    .xp 13+6780 >> 刷怪使13级经验达到6780+/11400
    .isOnQuest 298
step
    #sticky
    #label Kadrell
    .goto 1432/0,-2902.07,-5398.28,40,0
    .goto 1432/0,-2945.10,-5360.20,40,0
    .goto 1432/0,-3015.71,-5335.73,40,0
    .goto 1432/0,-3025.09,-5318.44,40,0
    .goto 1432/0,-3017.64,-5274.66
    >>与|cRXP_FRIENDLY_巡山人卡德雷尔|r交谈
    >>|cRXP_FRIENDLY_巡山人卡德雷尔|r|cRXP_WARN_沿塞尔萨玛主路巡逻|r
    .turnin 416,2 >> 交任务：狗头人的耳朵
    .target 巡山人卡德雷尔
step << Gnome
    .goto 1432/0,-3019.30,-5354.50,10,0
    >>与|cRXP_FRIENDLY_布洛克·寻石者|r和|cRXP_FRIENDLY_吉恩·角盔|r交谈。
    >>|cRXP_WARN_他们可能在建筑内，也可能在建筑外。|r
    .turnin 6392 >>交任务：向布洛克回复
    .target +布洛克·寻石者
    .goto 1432/0,-3014.88,-5366.820
    .turnin 298 >> 交任务：挖掘进度报告
    .accept 301 >> 接任务：向铁炉堡报告
    .goto 1432/0,-3020.68,-5358.91
    .target +吉恩·角盔
    .isOnQuest 298
step << Gnome
    .goto 1432/0,-3019.30,-5354.50,10,0
    >>与|cRXP_FRIENDLY_布洛克·寻石者|r和|cRXP_FRIENDLY_吉恩·角盔|r交谈。
    >>|cRXP_WARN_他们可能在建筑内，也可能在建筑外。|r
    .turnin 6392 >>交任务：向布洛克回复
    .target 布洛克·寻石者
    .goto 1432/0,-3014.88,-5366.820
    .accept 301 >> 接任务：向铁炉堡报告
    .goto 1432/0,-3020.68,-5358.91
    .target +吉恩·角盔
    .isQuestTurnedIn 298
step << Gnome
    .goto 1432/0,-3019.30,-5354.50,10,0
    .goto 1432/0,-3014.88,-5366.820
    >>与|cRXP_FRIENDLY_布洛克|r交谈
    >>|cRXP_WARN_他可能在建筑内或建筑外|r
    .turnin 6392 >>交任务：向布洛克回复
    .target 布洛克·寻石者
step
    #completewith next
    .goto 1432/0,-2966.06,-5365.72,12,0
    .goto 1432/0,-2969.92,-5377.12,12,0
    >>进入旅店。
    .goto 1432/0,-2954.42,-5394.10,10 >>前往|cRXP_FRIENDLY_维德拉·壁炉|r处。
step
    .goto 1432/0,-2954.42,-5394.10
    >>与|cRXP_FRIENDLY_维德拉·壁炉|r交谈。
    .accept 418 >> 接任务：塞尔萨玛血肠
    .turnin 418 >> 交任务：塞尔萨玛血肠
    .target 维德拉·壁炉
step
    .goto 1432/0,-2952.55,-5381.91
    >>|cRXP_WARN_不要丢掉任何多余的|r |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r
    .skill cooking,10 >> 将|T133970:0|t|cRXP_LOOT_[大块野猪肉]|r烹制成|T133974:0|t[烤野猪肉]，直到|T133971:0|t[烹饪]技能达到10
step
    .goto 1432/0,-2952.55,-5381.91
    >>与|cRXP_FRIENDLY_雅尼·铁心|r交谈。
    >>|cRXP_BUY_购买|r |T133634:0|t[棕色小包]|cRXP_BUY_，按需要和资金允许的数量尽量多买|r
    >>|cRXP_WARN_身上的银币不要低于 45 银。|r
    .vendor >> 出售杂物
    .isOnQuest 1338
step
    #completewith next
    #requires Kadrell
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级 2）]|cRXP_WARN_，尽可能多造水，然后乘坐飞行|r
step
    #requires Kadrell
    .goto 1432/0,-2929.93,-5424.95
    >>与|cRXP_FRIENDLY_索格拉姆|r交谈
    .fly Ironforge >> 飞往铁炉堡
    .target 索格拉姆·伯雷森
    .isOnQuest 1338
--VV WIP. Report to Ironforge needed
step << Gnome
    .goto 1455/0,-1303.71,-4631.08
    >>与|cRXP_FRIENDLY_勘察员塔伯斯·雷矛|r交谈
    .turnin 301 >> 交任务：向铁炉堡报告
    .target 勘察员塔伯斯·雷矛
    .isOnQuest 301
step << skip
    #completewith Monty
    .goto 1455/0,-1305.14,-4615.09,-1
    .goto 1455/0,-1158.00,-4816.48,-1
    .goto 1455/0,-1317.71,-4839.48,30 >>登出跳过路程，前往矿道地铁入口外
step
    .goto 1455/0,-1249.87,-4793.31
    >>与|cRXP_FRIENDLY_考格斯宾|r交谈
    .vendor 5175 >>|cRXP_BUY_购买一根|r |T133024:0|t[青铜管]|cRXP_BUY_（若有货）|r
    .target 考格斯宾
    .itemcount 4371,<1
step << Gnome
    #label Monty
    .goto 1455/0,-1317.71,-4839.48,30,0
    >>进入矿道地铁
    >>与|cRXP_FRIENDLY_蒙提|r交谈
    .accept 6661 >> 接任务：捕捉矿道老鼠
    .target 蒙提
step << Gnome
    >>在矿道地铁内使用 |T133942:0|t[捕鼠者之笛]对|cRXP_FRIENDLY_矿道老鼠|r吹奏
    .complete 6661,1 --Rats Captured (x5)
    .target 矿道老鼠
    .use 17117
step
    >>与|cRXP_FRIENDLY_蒙提|r交谈
    >>|cRXP_WARN_等待剧情演出结束|r << Gnome
    .turnin 6661 >> 交任务：捕捉矿道老鼠 << Gnome
    .timer 13,捕捉矿道老鼠剧情 << Gnome
    .accept 6662 >> 接任务：我的兄弟，尼普希
    .target 蒙提
    .zoneskip Stormwind City
step
    >>|cRXP_WARN_乘坐矿道地铁时连续施放|r |T132794:0|t[造水术（等级2）]
    >>在矿道地铁另一端与|cRXP_FRIENDLY_尼普希|r交谈。
    .turnin 6662 >> 交任务：我的兄弟，尼普希
    .target 尼普希
    .isOnQuest 6662
step
    #label Monty << Human
    .zone Stormwind City >> 进入暴风城
    .isOnQuest 1338
step
    #completewith next
    .goto 1453/0,574.95,-8388.30,20,0
    .goto 1453/0,614.33,-8380.77,20,0
    .goto 1453/0,638.26,-8342.22,15 >>前往|cRXP_FRIENDLY_比利巴布·旋轮|r处。
step
    .goto 1453/0,638.26,-8342.22
    >>与|cRXP_FRIENDLY_比利巴布·旋轮|r交谈
    .vendor 5519 >>|cRXP_BUY_购买一根|r |T133024:0|t[青铜管]|cRXP_BUY_（若有货）|r
    .target 比利巴布·旋轮
    .itemcount 4371,<1
step
    .goto 1453/0,600.08,-8427.20
    >>与|cRXP_FRIENDLY_弗伦·长须|r交谈。
    .turnin 1338 >> 交任务：卡尔·雷矛的订单
    .target 弗伦·长须
step
    #completewith next
    .goto 1453/0,663.94,-8451.76,20,0
    .goto 1453/0,686.79,-8473.27,20,0
    .goto 1453/0,678.86,-8562.64,20,0
    .goto 1453/0,711.26,-8587.38,20,0
    .goto 1453/0,737.60,-8557.89,12,0
    .goto 1453/0,719.86,-8550.36,12 >>前往|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r处。
step
    .goto 1453/0,719.86,-8550.36
    >>进入建筑
    >>与|cRXP_FRIENDLY_巴隆斯·阿历克斯顿|r交谈。
    .accept 399 >> 接任务：童年的记忆
    .target 巴隆斯·阿历克斯顿
step
    #completewith next
    .goto 1453/0,739.49,-8661.68,15,0
    .goto 1453/0,720.67,-8699.06,15,0
    .goto 1453/0,728.33,-8718.06,15,0
    .goto 1453/0,699.16,-8743.88,15,0
    .goto 1453/0,674.29,-8775.79,15,0
    .goto 1453/0,686.25,-8815.41,8,0
    .goto 1453/0,684.24,-8820.34,4,0
    .goto 1453/0,687.46,-8818.01,6,0
    .goto 1453/0,854.42,-8965.28,12,0
    >>|cRXP_WARN_跳上火炬，再向下落到暴风城地下|r
    >>|cRXP_WARN_将阴影设为"一般"或"低"，站在蓝色虚空前方、地形定位点 Derek the Dinosaur 双脚之间的中点（土色较浅处），然后径直向前走|r
    >>|cRXP_WARN_注意：使用此方法有较小几率死亡。你也可以选择正常步行前往法师塔|r
    .link https://youtu.be/gV8-wgQEomc >> 点击此处查看操作指南
    .goto 1453/0,861.95,-8990.47,10 >>前往 |cRXP_FRIENDLY_詹妮亚|r 处
step
    .goto 1453/0,861.95,-8990.47
    >>与|cRXP_FRIENDLY_詹妮亚|r交谈
    .accept 1861 >> 接任务：明镜湖 << Gnome
    .trainer >> 学习职业技能（火焰冲击等级2、奥术智慧等级2、魔爆术）
    >>总费用：27银
    >>记得预留购买药水（每瓶1–3银）和卷轴（每张50铜至3银）的钱
    .target 詹妮亚·坎农
step
    #completewith next
    .goto 1453/0,887.22,-9017.80,10,0
    .goto 1453/0,871.36,-9013.14,10,0
    .goto 1453/0,868.8,-9004.27,8,0
    .goto 1453/0,877.00,-9008.03,6,0
    .goto 1453/0,863.96,-9001.40,8,0
    .goto 1453/0,928.62,-9010.10,15,0
    .goto 1453/0,962.63,-8990.73,15,0
    .goto 1453/0,949.86,-9009.380,10,0
    .goto 1453/0,942.34,-9001.49,8,0
    >>离开法师塔
    .goto 1453/0,948.65,-8994.50,10 >>前往|cRXP_FRIENDLY_查瑞斯|r处。
step
    .goto 1453/0,948.65,-8994.50
    >>进入建筑
    >>与|cRXP_FRIENDLY_查瑞斯|r交谈。
    .vendor 1307 >> |cRXP_BUY_购买|r |T134851:0|t[次级法力药水] |cRXP_BUY_和|r |T134831:0|t[治疗药水] |cRXP_BUY_（如果她有货）|r
    .money <0.0120
    .target 查瑞斯·伊瑟里安
step
    #completewith next
    .goto 1453/0,852.40,-8920.10,20,0
    .goto 1453/0,829.01,-8901.28,20,0
    .goto 1453/0,789.22,-8904.59,20,0
    .goto 1453/0,758.31,-8878.78,20,0
    .goto 1453/0,810.33,-8832.44,20,0
    .goto 1453/0,827.54,-8850.19,15,0
    .goto 1453/0,822.16,-8865.60,10 >>前往|cRXP_FRIENDLY_艾代尔|r处。
    .money <0.0090
step
    .goto 1453/0,822.16,-8865.60
    >>进入建筑
    >>与|cRXP_FRIENDLY_艾代尔|r交谈。
    .vendor 1316 >> |cRXP_BUY_购买非智力类|r |T134943:0|t[卷轴] |cRXP_BUY_（如果他有货）|r
    .money <0.0090
    .target 艾代尔·吉尔罗
step << skip
    #completewith next
    .goto 1453/0,661.38,-8858.16,12,0
    .goto 1453/0,680.61,-8829.39,12,0
    .goto 1453/0,717.44,-8847.32,12,0
    .goto 1453/0,693.24,-8891.51,12,0
    .goto 1453/0,681.28,-8888.01,10 >>前往|cRXP_FRIENDLY_罗伯特|r处。
step << skip
    .goto 1453/0,681.28,-8888.01
    >>进入建筑
    >>与|cRXP_FRIENDLY_罗伯特|r交谈。
    >>|cRXP_BUY_向他购买|r |T132620:0|t[一桶葡萄酒]|cRXP_BUY_。|r
    .collect 1941,1,116,1 --Cask of Merlot
    .target 罗伯特·奥布斯
step
    #completewith next
    .goto 1453/0,680.61,-8828.67,15,0
    .goto 1453/0,635.44,-8863.81,8 >>前往|cRXP_FRIENDLY_凯德雷克·布舍尔|r处。
    .money <0.01
step
    .goto 1453/0,635.44,-8863.81
    >>隔墙与|cRXP_FRIENDLY_凯德雷克·布舍尔|r交谈。
    .vendor 1257 >> |cRXP_BUY_购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_（向他购买，若有货）|r
    .money <0.01
    .target 凯德雷克·布舍尔
step
    #completewith next
    .goto 1453/0,637.59,-8889.81,10 >>进入暴风城银行
step
    .goto 1453/0,614.33,-8932.92
    >>与|cRXP_FRIENDLY_牛顿·伯恩赛德|r交谈。
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
    .goto 1453/0,614.33,-8932.92
    .bankdeposit 769,4371,7207 >> 将以下物品存入银行：
    >>|T133970:0|t[大块野猪肉]
    >>|T133024:0|t[青铜管]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 769,1
    .itemcount 4371,1
    .itemcount 7207,1
step << skip
    .goto 1453/0,614.33,-8932.92
    .bankdeposit 769,730,7207 >> 将以下物品存入银行：
    >>|T133970:0|t[大块野猪肉]
    >>|T133884:0|t[鱼人的眼球]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 769,1
    .itemcount 730,1
    .itemcount 7207,1
step << skip
    .goto 1453/0,614.33,-8932.92
    .bankdeposit 4371,730,7207 >> 将以下物品存入银行：
    >>|T133024:0|t[青铜管]
    >>|T133884:0|t[鱼人的眼球]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 4371,1
    .itemcount 730,1
    .itemcount 7207,1
step << skip
    .goto 1453/0,614.33,-8932.92
    .bankdeposit 769,7207 >> 将以下物品存入银行：
    >>|T133970:0|t[大块野猪肉]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 769,1
    .itemcount 7207,1
step << skip
    .goto 1453/0,614.33,-8932.92
    .bankdeposit 4371,7207 >> 将以下物品存入银行：
    >>|T133024:0|t[青铜管]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 4371,1
    .itemcount 7207,1
step << skip
    .goto 1453/0,614.33,-8932.92
    .bankdeposit 730,7207 >> 将以下物品存入银行：
    >>|T133884:0|t[鱼人的眼球]
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 730,1
    .itemcount 7207,1
step << skip
    .goto 1453/0,614.33,-8932.92
    .bankdeposit 7207 >> 将以下物品存入银行：
    >>|T132788:0|t[詹妮亚的瓶子]
    .target 牛顿·伯恩赛德
    .itemcount 7207,1
step
    #completewith next
    .goto 1453/0,662.46,-8860.76,10,0
    >>进入旅店
    .goto 1453/0,673.75,-8867.93,10 >>前往|cRXP_FRIENDLY_旅店老板奥里森|r处。
    .target 旅店老板奥里森
step
    .goto 1453/0,673.75,-8867.93
    >>|cRXP_WARN_===请特别注意===|r
    >>|cRXP_WARN_与|r|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    >>|cRXP_WARN_打开“设置炉石”菜单，然后使用|r |T134414:0|t[炉石]
    .hs >> |cRXP_WARN_利用服务器批次窗口，从暴风城炉石返回奥伯丁|r
    .target 旅店老板奥里森
    .zoneskip Darkshore
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#forever
#disabledungeons
<< Alliance Mage
#name 14-16 ADV Darkshore 2 Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none Mage
#next 16-18 ADV Westfall Mage AoE
#displayname 14-16 黑海岸 2（法师进阶 AoE）
step
    #completewith DeepO
    +|cRXP_WARN_保留捡到的 |T132917:0|t[轻羽毛]，留作后用。|r
step
    .goto 1439/1,533.23,6399.77
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_向他购买|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_，最多20条|r
    .collect 4592,20,982,1 --Longjaw Mud Snapper (20)
    .target 莱尔德
    .isQuestAvailable 982
step
    >>与|cRXP_FRIENDLY_巴瑞萨斯·月影|r和|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈。
    .accept 947 >>接任务：洞中的蘑菇
    .target +巴瑞萨斯·月影
    .goto 1439/1,497.21,6427.72
    .accept 4811 >>接任务：红色水晶
    .goto 1439/1,473.63,6439.07
    .target +哨兵戈琳达·纳希恩
step
    #label DeepOAccept
    .goto 1439/1,445.46,6536.01
    >>与|cRXP_FRIENDLY_高尔博德|r交谈
    .accept 982 >> 接任务：深不可测的海洋
    .target 高尔博德·钢手
step
    .goto 1439/1,492.62,6580.99
    >>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈。
    .turnin 4761 >> 交任务：桑迪斯·织风
    .accept 4762 >> 接任务：壁泉河
    .target 桑迪斯·织风
step
    #completewith MistV
    .goto 1439/1,592.18,6666.14,50,0
    .goto 1439/1,565.33,6925.96,50,0
    .goto 1439/1,478.21,6985.78,50,0
    >>在水中击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，拾取掉落的|cRXP_LOOT_蛇颈龙的眼球|r。
   .complete 1001,1 --Thresher Eye (3)
   .mob 黑海岸蛇颈龙
step
   .goto 1439/1,438.91,7077.48
--  .goto 1439/1,437.60,7076.17
    >>隔着船体拾取|cRXP_LOOT_银色清晨号的保险箱|r。
    >>|cRXP_WARN_在水下箭头所在位置附近，使用“与目标互动”快捷键。|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
   .complete 982,1 --Silver Dawning's Lockbox (1)
step
   #label MistV
   .goto 1439/1,349.18,7133.81
--  .goto 1439/1,345.90,7134.68
   >>隔着船体拾取|cRXP_LOOT_迷雾之纱号的保险箱|r。
   >>|cRXP_WARN_在水下箭头所在位置附近，使用“与目标互动”快捷键。|r
   >>|cRXP_WARN_此操作需读条 5 秒|r
   .complete 982,2 --Mist Veil's Lockbox (1)
step
   .goto 1439/1,292.85,7083.16,50,0
   .goto 1439/1,592.18,6666.14,50,0
   .goto 1439/1,565.33,6925.96,50,0
   .goto 1439/1,478.21,6985.78,50,0
   .goto 1439/1,292.85,7083.16,50,0
   .goto 1439/1,592.18,6666.14,50,0
   .goto 1439/1,565.33,6925.96,50,0
   .goto 1439/1,478.21,6985.78
   >>在水中击杀|cRXP_ENEMY_黑海岸蛇颈龙|r，拾取掉落的|cRXP_LOOT_蛇颈龙的眼球|r。
   .complete 1001,1 --Thresher Eye (3)
   .mob 黑海岸蛇颈龙
step
   #completewith next
   +|cRXP_WARN_保留|r |T133884:0|t[鱼人的眼球]，|cRXP_WARN_它们来自|r|cRXP_ENEMY_灰雾滩行者|r|cRXP_WARN_和|r|cRXP_ENEMY_灰雾先知|r
step
   .goto 1439/1,196.56,6958.71
   >>拾取地上的|cRXP_LOOT_搁浅的海洋生物|r
   >>|cRXP_WARN_此操作需读条 5 秒|r
   .accept 4723 >> 接任务：搁浅的海洋生物
step
   .goto 1439/1,193.29,7084.03
   >>点击|cRXP_PICK_传声盒 411 号|r
   .turnin 1001 >> 交任务：传声盒411号
   .accept 1002 >> 接任务：传声盒323号
step
    #completewith SeaTurtle1
    .goto 1439/1,81.28,7118.96,50,0
    >>用范围技能击杀|cRXP_ENEMY_森林陆行鸟雏鸟|r，拾取它们掉落的|cRXP_LOOT_陆行鸟肉|r。
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
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，它们会施放|r |T135914:0|t[狂犬病]|cRXP_WARN_（瞬发近战技能：使所有生命恢复速度降低50%，持续10分钟）|r
    .complete 2138,1 --Rabid Thistle Bear (20)
    .mob 狂暴蓟熊
step
    #label SeaTurtle1
    .goto 1439/1,46.57,7433.8,80 >>前往 |cRXP_LOOT_搁浅的海龟|r
    .isQuestAvailable 4725
step
    #completewith next
    +保留|T133884:0|t[鱼人的眼球]，它们来自|cRXP_ENEMY_灰雾战士|r和|cRXP_ENEMY_灰雾撒网者|r
step
    .goto 1439/1,46.57,7433.800
    >>拾取地上的|cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .accept 4725 >> 接任务：搁浅的海龟
step
    #completewith River
    >>击杀 |cRXP_ENEMY_森林陆行鸟雏鸟|r, 搜刮 |cRXP_LOOT_陆行鸟肉|r
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
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，它们会施放|r |T135914:0|t[狂犬病]|cRXP_WARN_（瞬发近战技能：使所有生命恢复速度降低50%，持续10分钟）|r
    .complete 2138,1 --Rabid Thistle Bear (20)
    .mob 狂暴蓟熊
step
    #label River
    .goto 1439/1,-383.77,7222.89
    >>在水中使用 |T134865:0|t[空的水样试管]取样。
    .complete 4762,1 --Cliffspring River Sample (1)
    .use 12350
step
    #completewith RedC
    >>击杀 |cRXP_ENEMY_森林陆行鸟|r, 搜刮 |cRXP_LOOT_陆行鸟肉|r
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
    .goto 1439/1,-144.04,6209.82,400 >>前往|cRXP_PICK_红色水晶|r
    .isOnQuest 4811
step
    #completewith Bash
    >>击杀 |cRXP_ENEMY_森林陆行鸟雏鸟|r, 搜刮 |cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
step
    #completewith Bash
    >>击杀 |cRXP_ENEMY_月夜猛虎幼崽|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
step
    .goto 1439/1,-144.04,6209.82
    >>跑到|cRXP_PICK_红色水晶|r
    >>|cRXP_WARN_记得拉那些会一起进入战斗的|cRXP_ENEMY_狂暴的月夜枭兽|r|r
    .complete 4811,1 --Locate the large, red crystal on Darkshore's eastern mountain range (1)
step
    #label Bash
    .goto 1439/1,166.43,5633.86,175 >>前往|cRXP_PICK_上古之火|r
    .isOnQuest 957
step
    #completewith next
    .goto 1439/1,161.19,5684.51,0
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
step
    .goto 1439/1,166.43,5633.86
    >>点击 |cRXP_PICK_上古之火|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 957,1 --Destroy the seal at the ancient flame (1)
step
    .goto 1439/1,161.19,5684.51,50,0
    .goto 1439/1,108.79,5608.10,50,0
    .goto 1439/1,155.95,5757.00,50,0
    .goto 1439/1,161.19,5684.51,50,0
    .goto 1439/1,108.79,5608.10,50,0
    .goto 1439/1,155.95,5757.00,50,0
    .goto 1439/1,161.19,5684.51,50,0
    .goto 1439/1,108.79,5608.10
    >>击杀|cRXP_ENEMY_安娜雅·晨路|r，拾取|cRXP_LOOT_安娜雅的坠饰|r
    .complete 963,1 --Anaya's Pendant (1)
    .unitscan 安娜雅·晨路
step
    #completewith RBears
    >>击杀 |cRXP_ENEMY_森林陆行鸟雏鸟|r, 搜刮 |cRXP_LOOT_陆行鸟肉|r
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
    .goto 1439/1,511.62,5618.58
    >>点击 |cRXP_PICK_搁浅的海龟|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .accept 4722 >> 接任务：搁浅的海龟
step
#loop
	.line Darkshore,38.74,58.10,39.91,58.50,39.23,63.60,39.87,66.31,39.98,70.55,37.40,70.05,38.63,67.72,38.50,63.73,38.74,58.10
	.goto 1439/1,404.20,5796.300,45,0
	.goto 1439/1,327.56,5778.830,45,0
	.goto 1439/1,372.10,5556.130,45,0
	.goto 1439/1,330.18,5437.80,45,0
	.goto 1439/1,322.98,5252.65,45,0
	.goto 1439/1,491.97,5274.48,45,0
	.goto 1439/1,411.40,5376.23,45,0
	.goto 1439/1,419.92,5550.46,45,0
	.goto 1439/1,404.20,5796.300,45,0
    >>击杀 |cRXP_ENEMY_狂暴蓟熊|r
    >>|cRXP_WARN_小心，它们会施放|r |T135914:0|t[狂犬病]|cRXP_WARN_（瞬发近战技能：使所有生命恢复速度降低50%，持续10分钟）|r
    .complete 2138,1 --Rabid Thistle Bear (20)
    .mob 狂暴蓟熊
step
    #label RBears
#loop
	.line Darkshore,39.26,56.72,40.21,56.23,39.96,55.22,39.90,54.38,40.24,53.47,39.21,53.01,39.90,54.38
	.goto 1439/1,370.14,5856.56,50,0
	.goto 1439/1,307.91,5877.96,50,0
	.goto 1439/1,324.29,5922.06,50,0
	.goto 1439/1,328.22,5958.74,50,0
	.goto 1439/1,305.95,5998.48,50,0
	.goto 1439/1,373.41,6018.56,50,0
	.goto 1439/1,328.22,5958.74,50,0
    >>击杀 |cRXP_ENEMY_黑木探路者|r 和 |cRXP_ENEMY_黑木风语者|r
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
	.goto 1439/1,411.40,6095.42,50,0
	.goto 1439/1,431.05,6150.00,50,0
	.goto 1439/1,440.88,6218.99,50,0
	.goto 1439/1,404.85,6253.93,50,0
	.goto 1439/1,355.07,6252.62,50,0
	.goto 1439/1,229.97,6275.32,50,0
	.goto 1439/1,212.28,6173.14,50,0
	.goto 1439/1,226.69,6113.32,50,0
	.goto 1439/1,411.40,6095.42,50,0
    >>击杀 |cRXP_ENEMY_森林陆行鸟雏鸟|r, 搜刮 |cRXP_LOOT_陆行鸟肉|r
    .collect 5469,5,2178,1 --Strider Meat (5)
    .mob 森林陆行鸟雏鸟
step
    #label Auberdine
    .goto 1439/1,543.06,6342.57,150 >>前往 |cRXP_FRIENDLY_温尼斯·布莱葛|r
    .isOnQuest 982
step
    .goto 1439/1,536.51,6365.28,12,0
    .goto 1439/1,543.06,6342.57
    >>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈。
    .turnin 4722 >> 交任务：搁浅的海龟
    .turnin 4723 >> 交任务 搁浅的海洋生物
    .turnin 4725 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛
--Fruit of the Sea at 18
step
    .goto 1439/1,533.23,6399.77
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_向他购买|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_，最多20条|r
    .vendor >> 卖掉杂物
    .collect 4592,20,4763,1 --Longjaw Mud Snapper (40)
    .target 莱尔德
    .isOnQuest 982
step
    .goto 1439/1,539.13,6409.82,12,0
    .goto 1439/1,600.70,6425.100
    >>与|cRXP_FRIENDLY_塞瑞利恩|r交谈。
    .turnin 963 >>交任务：永志不渝
    .target 塞瑞利恩·白爪
step
    #completewith CliffRi
    +若已装备单手武器，将|T134797:0|t[悲伤之泪]装备到副手；使用双手法杖时可跳过
    .use 5611
    .itemcount 5611,1
    .itemStat 17,LEVEL,<16
step
    .goto 1439,37.12,43.62
    >>与|cRXP_FRIENDLY_奥林迪雅|r交谈
    >>|cRXP_BUY_向她购买 15 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,15,4763,1 --Melon Juice (15)
    .target 奥林迪雅
    .money <0.1500
step
    .goto 1439,37.12,43.62
    >>与|cRXP_FRIENDLY_奥林迪雅|r交谈
    >>|cRXP_BUY_向她购买 10 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,10,4763,1 --Melon Juice (10)
    .target 奥林迪雅
    .money <0.1000
step
    .goto 1439,37.12,43.62
    >>与|cRXP_FRIENDLY_奥林迪雅|r交谈
    >>|cRXP_BUY_向她购买 5 瓶|r |T132796:0|t[甜瓜汁]|cRXP_BUY_。|r
    .collect 1205,5,4763,1 --Melon Juice (5)
    .target 奥林迪雅
    .money <0.0500
step
    #completewith next
    .goto 1439/1,488.69,6451.300,20,0
    .goto 1439/1,487.38,6481.870,20,0
    .goto 1439/1,489.35,6506.32,15 >>前往 |cRXP_FRIENDLY_霍莉|r
step
    .goto 1439/1,489.35,6506.32
    >>与|cRXP_FRIENDLY_霍莉|r交谈
    .accept 729 >>接任务：健忘的勘察员
    .target 考古学家霍莉
step
    .goto 1439/1,488.69,6564.830
    >>与|cRXP_FRIENDLY_达蒙德|r交谈。
    .vendor 4182 >> |cRXP_BUY_购买|r |T133634:0|t[棕色小包]|cRXP_BUY_，按需要和资金允许的数量尽量多买|r
    .target 达蒙德
    .money <0.0500
    .money >0.2500
step
    .goto 1439/1,488.69,6564.830
    >>与|cRXP_FRIENDLY_达蒙德|r交谈。
    .vendor 4182 >> |cRXP_BUY_向他购买一个|r |T133634:0|t[棕色小皮包] |cRXP_BUY_。|r
    .target 达蒙德
    .money <0.2500
step
    #label CliffRi
    .goto 1439/1,492.62,6580.99
    >>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈。
    .turnin 4762 >> 交任务：壁泉河
    .accept 4763 >> 接任务：黑木熊怪的堕落
    .target 桑迪斯·织风
step
    .goto 1439/1,472.97,6557.85
    >>与|cRXP_FRIENDLY_奥兰达利亚·夜歌|r交谈。
    .accept 2178 >>接任务：炖陆行鸟
    .turnin 2178 >>交任务：炖陆行鸟
    .target 奥兰达利亚·夜歌
step
    #label DeepO
    .goto 1439/1,445.46,6536.01
    >>与|cRXP_FRIENDLY_高尔博德|r交谈
    .turnin 982,2 >> 交任务：深不可测的海洋
    .target 高尔博德·钢手
step
    #completewith next
    .goto 1439/1,476.25,6479.25,15,0
    .goto 1439/1,478.21,6446.50,15,0
    .goto 1439/1,473.63,6439.07,20 >>前往戈琳达·纳希恩
step
    .goto 1439/1,473.63,6439.07
    >>与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r交谈
    .turnin 4811 >>交任务：红色水晶
    .accept 4812 >>接任务：清洗水晶
    .target 哨兵戈琳达·纳希恩
step
    .goto 1439/1,465.11,6416.80
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
    .goto 1439/1,397.65,6437.33
    .turnin 985 >> 交任务：熊怪的威胁
    .accept 986 >> 接任务：丢失的主人
    .target +特伦希斯
    .goto 1439/1,362.93,6434.27
    .accept 965 >>接任务：奥萨拉克斯之塔
    .goto 1439/1,369.48,6449.99,8,0
    .goto 1439/1,384.55,6431.65
    .target +哨兵艾莉萨·星风
step << Gnome
    #completewith next
    +装备 |T132491:0|t[智者腰带]
    .use 4786
    .itemcount 4786,1
    .itemStat 6,LEVEL,<20
step
    .goto 1439/1,-157.79,6206.770
    >>点击|cRXP_PICK_红色水晶|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    >>|cRXP_WARN_记得拉那些会一起进入战斗的|cRXP_ENEMY_狂暴的月夜枭兽|r|r
    .turnin 4812 >> 交任务：清洗水晶
    .accept 4813 >> 接任务：水晶中的碎骨
step
    #completewith GrainSample
    >>击杀|cRXP_ENEMY_月夜猛虎幼崽|r和|cRXP_ENEMY_月夜猛虎|r，拾取|cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎幼崽
    .mob 月夜猛虎
step
    .goto 1439/1,47.88,6748.67
    >>与|cRXP_FRIENDLY_阿斯特利安|r交谈。
    .turnin 957,3 >>交任务：巴莎兰
    .target 阿斯特利安
step
    #label GrainSample
    .goto 1439/1,-376.56,6805.87
    >>打开|cRXP_PICK_黑木谷物|r，拾取其中的|cRXP_LOOT_黑木谷物|r
    >>|cRXP_WARN_将守着它的怪物引入战斗，施放|r |T135848:0|t[冰霜新星]|cRXP_WARN_，拾取|cRXP_LOOT_黑木谷物|r，再朝|cRXP_ENEMY_雌蓟熊|r方向逃离新刷出的怪物。|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .collect 12342,1,4763,1 --Blackwood Grain Sample (1)
step
    #completewith next
    >>击杀 |cRXP_ENEMY_月夜猛虎|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎
step
    #completewith DenM
    .goto 1439/1,-485.95,6763.95,20,0
    .goto 1439/1,-489.88,6724.22,20,0
    .goto 1439/1,-436.82,6694.96,30 >>前往|cRXP_ENEMY_雌蓟熊|r附近。
step
    .goto 1439/1,-432.24,6664.39
    >>击杀 |cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_雌蓟熊|r和她的|cRXP_ENEMY_蓟熊幼崽|r会施放|r |T132141:0|t[毁灭]|cRXP_WARN_（使你昏迷 2 秒）。|r
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊
    .itemcount 4358,<1
step
    #label DenM
    .goto 1439/1,-432.24,6664.39
    >>击杀 |cRXP_ENEMY_雌蓟熊|r
    >>|cRXP_WARN_小心|cRXP_ENEMY_雌蓟熊|r和她的|cRXP_ENEMY_蓟熊幼崽|r会施放|r |T132141:0|t[毁灭]|cRXP_WARN_（使你昏迷 2 秒）。|r
    >>|cRXP_WARN_若已学习工程学，可用|r |T133714:0|t[劣质炸药]|cRXP_WARN_单独拉出|cRXP_ENEMY_雌蓟熊|r；否则按常规方式击杀
    .complete 2139,1 --Den Mother (1)
    .mob 雌蓟熊
    .itemcount 4358,1
    .use 4358
step
    #completewith Talisman
    >>击杀 |cRXP_ENEMY_月夜猛虎|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎
step
    .goto 1439/1,-451.23,6870.06
    >>打开|cRXP_PICK_黑木坚果|r，拾取|cRXP_LOOT_黑木坚果|r :3
    >>|cRXP_WARN_将守着它的怪物引入战斗，施放|r |T135848:0|t[冰霜新星]|cRXP_WARN_，拾取|cRXP_LOOT_黑木坚果|r，然后向北跑。|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .collect 12343,1,4763,1 --Blackwood Nut Sample (1)
step
    .goto 1439/1,-520.01,6873.99
    >>打开|cRXP_PICK_黑木水果|r，拾取其中的|cRXP_LOOT_黑木水果|r
    >>击杀主动攻击你的|cRXP_ENEMY_黑木战士|r。
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .collect 12341,1,4763,1 --Blackwood Fruit Sample (1)
step
    #completewith next
    .goto 1439/1,-497.74,6887.53
    .cast 16072 >>在篝火旁使用 |T134712:0|t[装满水的净化碗]，召唤|cRXP_ENEMY_萨巴克希斯|r。
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .timer 20,黑木熊怪的堕落剧情
    .use 12347
step
    #label Talisman
    .goto 1439/1,-480.05,6888.84
    >>|cRXP_WARN_等待剧情演出结束|r
    >>击杀|cRXP_ENEMY_萨巴克希斯|r
    >>拾取掉在地上的|cRXP_PICK_萨巴克希斯的恶魔之包|r，从中获得|cRXP_LOOT_堕落护符|r。
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 4763,1 --Talisman of Corruption (1)
    .mob 萨巴克希斯
step
    .goto 1439/1,-417.83,7262.19
    >>点击|cRXP_PICK_传声盒 323 号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
    .isQuestComplete 1002
step
    .goto 1439/1,-417.83,7262.19
    >>点击|cRXP_PICK_传声盒 323 号|r
    .accept 1003 >> 接任务：传声盒525号
    .isQuestTurnedIn 1002
step
    #completewith next
    .goto 1439/1,-578.30,6956.96,60,0
    .goto 1439/1,-629.39,7042.98,60,0
    .goto 1439/1,-538.35,7099.75,60,0
    .goto 1439/1,-499.70,7221.14,60,0
    .goto 1439/1,-674.59,7333.80,60,0
    .goto 1439/1,-637.91,7415.02,60,0
    >>击杀 |cRXP_ENEMY_月夜猛虎|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎
step
    .goto 1439/1,-537.04,7542.970
    >>拾取|cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .accept 4727 >>接任务：搁浅的海龟
step
    .goto 1439/1,-578.30,6956.96,60,0
    .goto 1439/1,-629.39,7042.98,60,0
    .goto 1439/1,-538.35,7099.75,60,0
    .goto 1439/1,-499.70,7221.14,60,0
    .goto 1439/1,-674.59,7333.80,60,0
    .goto 1439/1,-637.91,7415.02,60,0
    .goto 1439/1,-578.30,6956.96,60,0
    .goto 1439/1,-629.39,7042.98,60,0
    .goto 1439/1,-538.35,7099.75,60,0
    .goto 1439/1,-499.70,7221.14,60,0
    .goto 1439/1,-674.59,7333.80,60,0
    .goto 1439/1,-637.91,7415.02
    >>击杀 |cRXP_ENEMY_月夜猛虎|r, 搜刮 |cRXP_LOOT_月夜猛虎的牙齿|r
    .complete 1002,1 --Moonstalker Fang (6)
    .mob 月夜猛虎
step
    .goto 1439/1,-417.83,7262.19
    >>点击|cRXP_PICK_传声盒 323 号|r
    .turnin 1002 >> 交任务：传声盒323号
    .accept 1003 >> 接任务：传声盒525号
step
    .goto 1439/1,-658.87,7246.47
    >>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈。
    .turnin 965 >>交任务: 奥萨拉克斯之塔
    .accept 966 >>接任务：奥萨拉克斯之塔
    .target 巴苏尔·影击
step
    .goto 1439/1,-684.41,7176.60,50,0
    .goto 1439/1,-749.91,7153.90,50,0
    .goto 1439/1,-875.02,7228.570,50,0
    .goto 1439/1,-684.41,7176.60,50,0
    .goto 1439/1,-749.91,7153.90
    >>击杀|cRXP_ENEMY_暗滩狂热者|r，拾取|cRXP_LOOT_破旧的羊皮纸|r
    .complete 966,1 --Worn Parchment (4)
    .mob 暗滩狂热者
step
    .goto 1439/1,-658.87,7246.47
    >>与|cRXP_FRIENDLY_巴苏尔·影击|r交谈。
    .turnin 966 >>交任务: 奥萨拉克斯之塔
    .accept 967 >>接任务：奥萨拉克斯之塔
    .target 巴苏尔·影击
step
    #label CapCave
    #completewith CapCave1
    .goto 1439/1,-660.83,6873.99,30 >>进入洞穴
step << skip
    #requires CapCave
    #completewith CapCave1
    +|cRXP_WARN_记住洞穴中的登出跳点，马上要用。|r
step
    #completewith next
    .goto 1439/1,-663.45,6877.49,8,0
    .goto 1439/1,-679.17,6848.67,8,0
    .goto 1439/1,-666.73,6819.41,8,0
    .goto 1439/1,-680.48,6779.67,8,0
    >>拾取地上的蓝色|cRXP_LOOT_粗柄蘑菇|r
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 947,1,4 --Scaber Stalk (5)
step
    .goto 1439/1,-690.31,6751.29,12,0
    .goto 1439/1,-706.68,6748.23,12,0
    .goto 1439/1,-719.13,6787.530,12,0
    >>待在洞穴的上层。如果上层没有|cRXP_LOOT_毒帽蘑菇|r，再跳下去
    >>在洞穴上层路线尽头拾取地上的橙色|cRXP_LOOT_毒帽蘑菇|r。
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 947,2 --Death Cap (1)
step
    #label CapCave1
    .goto 1439/1,-663.45,6877.49,8,0
    .goto 1439/1,-679.17,6848.67,8,0
    .goto 1439/1,-666.73,6819.41,8,0
    .goto 1439/1,-680.48,6779.67
    >>在洞口拾取第一株|cRXP_LOOT_粗柄蘑菇|r，需先拾取|cRXP_LOOT_毒帽蘑菇|r再返回此处。
    >>|cRXP_WARN_此操作需读条 5 秒|r
    .complete 947,1 --Scaber Stalk (5)
step << skip
    .goto 1439/1,-658.21,6825.96
    .goto 1439/1,210.32,6739.501,30 >> |cRXP_WARN_在洞穴内执行登出跳点。|r
    .isOnQuest 4763
step
    #completewith next
    .subzone 442 >> 前往奥伯丁
    .isOnQuest 4763
step
    .goto 1439/1,492.62,6580.99
    >>与|cRXP_FRIENDLY_桑迪斯·织风|r交谈。
    .turnin 4763,1 >> 交任务: 黑木熊怪的堕落
    .target 桑迪斯·织风
step
    .goto 1439/1,488.69,6564.830
    >>与|cRXP_FRIENDLY_达蒙德|r交谈。
    .vendor 4182 >> |cRXP_BUY_向他购买一个|r |T133634:0|t[棕色小皮包] |cRXP_BUY_。|r
    >>|cRXP_WARN_身上的钱不要低于 30 银|r
    .target 达蒙德
step
    .goto 1439/1,397.65,6437.33
    >>与|cRXP_FRIENDLY_萨纳瑞恩·绿树|r交谈
    .turnin 2139,1 >>交任务: 萨纳瑞恩的希望
    .target 萨纳瑞恩·绿树
step
    >>依次与|cRXP_FRIENDLY_哨兵戈琳达·纳希恩|r、|cRXP_FRIENDLY_巴瑞萨斯·月影|r交谈，并查看|cRXP_PICK_通缉告示|r。
    .turnin 4813,2 >>交任务：水晶中的碎骨
    .target +哨兵戈琳达·纳希恩
    .goto 1439/1,473.63,6439.07
    .turnin 947 >>交任务：洞中的蘑菇
    .accept 948 >>接任务：安努
    .target +巴瑞萨斯·月影
    .goto 1439/1,497.21,6427.72
    .accept 4740 >> 接任务：通缉：莫克迪普！
    .goto 1439/1,503.76,6402.39
step
    .goto 1439/1,533.23,6399.77
    >>与|cRXP_FRIENDLY_莱尔德|r交谈。
    >>|cRXP_BUY_从他那里最多购买 40 条|r |T133918:0|t[长嘴泥鳅]|cRXP_BUY_。|r
    .collect 4592,40,729,1 --Longjaw Mud Snapper (40)
    .target 莱尔德
step
    .goto 1439/1,543.06,6342.57
    >>与|cRXP_FRIENDLY_温尼斯·布莱葛|r交谈。
    .turnin 4727 >> 交任务：搁浅的海龟
    .target 温尼斯·布莱葛
step
    .goto 1439/1,515.55,6406.32
    >>|cRXP_WARN_===请特别注意===|r
    >>|cRXP_WARN_与|r|cRXP_FRIENDLY_旅店老板莎希因|r交谈
    >>|cRXP_WARN_打开“设置炉石”菜单，然后使用|r |T134414:0|t[炉石]
    .hs >> |cRXP_WARN_利用服务器批次窗口，从奥伯丁炉石返回暴风城|r
    .target 旅店老板莎希因
    .zoneskip Stormwind City
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#forever
#disabledungeons
<< Alliance Mage
#name 16-18 ADV Westfall Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none Mage
#next 18-20 ADV Darkshore 3 Mage AoE
#displayname 16-18 西部荒野（法师进阶 AoE）
step
    #completewith JenneaT
    +|cRXP_WARN_注意：稍后交布料任务时，每种布料都需要 12 组（|r|T132911:0|t[毛料]|cRXP_WARN_、|r |T132905:0|t[丝绸]|cRXP_WARN_、|r |T132892:0|t[魔纹布]|cRXP_WARN_和|r |T132903:0|t[符文布]|cRXP_WARN_）。升级过程中会自然积攒这些布料|r
step << skip
    #completewith next
    .goto 1453/0,661.38,-8858.16,12,0
    .goto 1453/0,680.61,-8829.39,12,0
    .goto 1453/0,717.44,-8847.32,12,0
    .goto 1453/0,693.24,-8891.51,12,0
    .goto 1453/0,681.28,-8888.01,10 >>前往 |cRXP_FRIENDLY_罗伯特|r处
step << skip
    .goto 1453/0,681.28,-8888.01
    >>进入建筑
    >>与 |cRXP_FRIENDLY_罗伯特|r交谈
    >>|cRXP_BUY_向他购买|r |T132620:0|t[一桶葡萄酒] |cRXP_BUY_。|r
    .collect 1941,1,116,1 --Cask of Merlot
    .target 罗伯特·奥布斯
step
    #sticky
    #label Bank2
    >>与 |cRXP_FRIENDLY_牛顿|r交谈
    .bankdeposit 17056,5354,2592,6889 >> 将下列物品存入银行：
    >>|T132917:0|t[轻羽毛]
    >>|T133469:0|t[写给德尔格伦的信]
    >>|T132911:0|t[毛料]
    >>|T132832:0|t[小蛋]
    .target 牛顿·伯恩赛德
step
    .goto 1453/0,614.33,-8932.92
    >>与 |cRXP_FRIENDLY_牛顿|r交谈
    .bankwithdraw 730,7207 >> 从银行取出下列物品： << Gnome
    .bankwithdraw 730,16115 >> 从银行取出下列物品： << Human
    >>|T133884:0|t[鱼人的眼球]
    >>|T132788:0|t[詹妮亚的瓶子] << Gnome
    >>|T132763:0|t[奥斯瑞克的箱子] << Human
    .target 牛顿·伯恩赛德
step
    #requires Bank2
    #completewith next
    .goto 1453/0,686.25,-8815.41,8,0
    .goto 1453/0,684.24,-8820.34,4,0
    .goto 1453/0,687.46,-8818.01,6,0
    .goto 1453/0,854.42,-8965.28,12,0
    >>|cRXP_WARN_跳上火把，然后落到暴风城下方|r
    >>|cRXP_WARN_将阴影设为“普通”或“低”，在蓝色虚空前，站到恐龙图案（Derek the Dinosaur）的双脚之间，即泥土颜色较浅的部位，然后径直向前走|r
    >>|cRXP_WARN_注意：这种方法有小概率导致死亡。也可以按正常路线走到法师塔|r
    .link https://youtu.be/gV8-wgQEomc >> 点击此处查看指南
    .goto 1453/0,861.95,-8990.47,10 >>前往 |cRXP_FRIENDLY_詹妮亚|r处
step
    #requires Bank2
    #label JenneaT
    .goto 1453/0,861.95,-8990.47
    >>与 |cRXP_FRIENDLY_詹妮亚|r交谈
    .trainer >> 学习职业技能（烈焰风暴）
    >>总花费：15 银币
    .target 詹妮亚·坎农
step
    .goto 1453/0,635.44,-8863.81
    >>隔墙与 |cRXP_FRIENDLY_凯德雷克|r交谈
    .vendor 1257 >> |cRXP_BUY_向他购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_（如果有货）|r
    .target 凯德雷克·布舍尔
    .money <0.14
step
    #completewith next
    .goto 1453/0,618.90,-8796.58,12,0
    .goto 1453/0,612.99,-8795.96,10 >>前往 |cRXP_FRIENDLY_吴平|r处
step
    .goto 1453/0,612.99,-8795.96
    >>与 |cRXP_FRIENDLY_吴平|r交谈
    .train 1180 >> 学习 |T132321:0|t[匕首]
    .target 吴平
step
    #completewith next
    .goto 1453/0,612.45,-8806.18,12,0
    .goto 1453/0,528.43,-8850.28,20,0
    .goto 1453/0,532.20,-8863.72,15,0
    .goto 1453/0,490.12,-8835.67,10 >>前往 |cRXP_FRIENDLY_杜加尔|r处
step << Human
    .goto 1453/0,490.12,-8835.67
    >>与 |cRXP_FRIENDLY_杜加尔|r交谈
    .turnin 6261 >> 交任务：杜加尔·朗德瑞克
    .accept 6285 >> 接任务：返回西部荒野
    .target 杜加尔·朗德瑞克
step
    #completewith next << Human
    .goto 1453/0,490.12,-8835.67
    >>与 |cRXP_FRIENDLY_杜加尔|r交谈
    .fp Stormwind City >> 开通暴风城的飞行点 << Gnome
    .fly Westfall >> 飞往西部荒野 << Human
    .target 杜加尔·朗德瑞克
    .zoneskip Westfall << Human
step << Gnome
    #completewith next
    #label Stormwind1
    .goto 1453/0,494.56,-8865.78,12,0
    .goto 1453/0,495.77,-8870.44,8,0
    .goto 1453/0,504.24,-8956.31,40 >>落到 |cRXP_FRIENDLY_杜加尔|r下方的平台上
step << Gnome
    #completewith next
    .goto 1429/0,421.28,-9104.28,40 >>离开暴风城
step << skip
    #completewith next
    #requires Stormwind1
    .goto 1429/0,44.35,-9458.41,30 >>前往闪金镇旅店
step << skip
    #label GoldshireTrain
    .goto 1429/0,34.28,-9472.99
    >>如果还没学技能，就跳上楼下的吊灯；否则从椅子处跳上去
    >>隔墙与 |cRXP_FRIENDLY_扎尔迪玛|r交谈
    .accept 1919 >> 接任务：向詹妮亚报告
    .trainer >> 学习职业技能（烈焰风暴）
    >>总花费：15 银币
step << skip
    .goto 1429/0,8.25,-9460.03
    >>与 |cRXP_FRIENDLY_杜宾斯|r交谈
    >>|cRXP_BUY_向他购买|r |T132794:0|t[一袋蜂蜜酒] |cRXP_BUY_。|r
    .collect 1939,1,116,1 --Skin of Sweet Rum
    .target 酒吧老板杜宾斯
step << skip
    .goto 1429/0,16.23,-9462.580
    >>与 |cRXP_FRIENDLY_法雷|r交谈
    >>|cRXP_BUY_向他购买 45 份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_。|r
    .collect 1205,45,64,1 --Melon Juice (45)
    .target 旅店老板法雷
    .money <0.45
step << Gnome
    .goto 1429/0,529.57,-9363.050
    >>在瀑布处使用 |T132788:0|t[詹妮亚的瓶子]
    >>|cRXP_WARN_需要 5 秒施法时间|r
    .use 7207
    .complete 1861,1 --Mirror Lake Water Sample (1)
step
    >>与 |cRXP_FRIENDLY_农夫法布隆|r和 |cRXP_FRIENDLY_弗娜|r交谈
    .accept 64 >> 接任务：遗失的怀表
    .accept 109 >> 接任务：向格里安·斯托曼报到
    .target +农夫法布隆
    .goto 1436/0,918.42,-9851.50
    .accept 36 >> 接任务：杂味炖肉
    .accept 151 >> 接任务：老马布兰契
    .goto 1436/0,919.82,-9852.90
    .target +弗娜·法布隆
step << Gnome
    #completewith Gryan
    >>打开地上的 |cRXP_PICK_燕麦袋|r，拾取 |cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_需要 5 秒施法时间|r
    .complete 151,1 --Handful of Oats (8)
step
    >>与 |cRXP_FRIENDLY_农夫萨丁|r交谈，再与屋内的 |cRXP_FRIENDLY_萨尔玛|r交谈
    .accept 9 >> 接任务：清理荒野
    .target +农夫萨丁
    .goto 1436/0,1055.27,-10128.70
    .turnin 36 >> 交任务：杂味炖肉
    .accept 38 >> 接任务：杂味炖肉
    .accept 22 >> 接任务：猪肝馅饼
    .goto 1436/0,1041.97,-10112.13
    .target +萨尔玛·萨丁
step << Gnome
    #completewith Gryan
    .goto 1436/0,1142.77,-10140.13,60,0
    >>用范围法术击杀 |cRXP_ENEMY_看守傀儡|r和 |cRXP_ENEMY_麦田傀儡|r，拾取它们的 |cRXP_LOOT_灯油|r和 |cRXP_LOOT_蛇麻草|r
    >>|cRXP_WARN_现在记得用|r |T135826:0|t[烈焰风暴]|cRXP_WARN_/|r|T136116:0|t[魔爆术] |cRXP_WARN_进行范围攻击|r
    .complete 9,1 --Harvest Watcher (20)
    .collect 814,5,103,1 --Flask of Oil (5)
    .collect 1274,5,117,1 --Hops (5)
    .mob 看守傀儡
    .mob 麦田傀儡
step << Gnome
    #completewith next
    >>用范围法术击杀 |cRXP_ENEMY_幼年血牙野猪|r，拾取它们的 |cRXP_LOOT_血牙野猪的肝|r和 |cRXP_LOOT_血牙野猪的头|r
    >>用范围法术击杀 |cRXP_ENEMY_小碎尸鸟|r，拾取它们的 |cRXP_LOOT_秃鹫肉条|r
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +小碎尸鸟
step
    #label Gryan << Gnome
	>> 与 |cRXP_FRIENDLY_格里安|r和 |cRXP_FRIENDLY_丹努文|r交谈 << Gnome
	>> 与 |cRXP_FRIENDLY_格里安|r交谈，再与屋内的 |cRXP_FRIENDLY_刘易斯|r交谈 << Human
    .turnin 109 >> 交任务：向格里安·斯托曼报到 << Gnome
    .accept 65 >> 接任务：迪菲亚兄弟会
    .accept 12 >> 接任务：西部荒野人民军 << Gnome
    .target +格里安·斯托曼
    .goto 1436/0,1045.12,-10508.80
    .turnin 6285 >> 交任务：返回西部荒野 << Human
    .goto 1436/0,1021.60,-10500.61 << Human
    .accept 102 >> 接任务：西部荒野的豺狼人 << Gnome
    .goto 1436/0,1041.97,-10511.13 << Gnome
	.target +丹努文队长 << Gnome
    .target +军需官刘易斯 << Human
step
    .goto 1436/0,1127.37,-10636.43
	>>与 |cRXP_FRIENDLY_加里安|r交谈
    .accept 153 >> 接任务：红色皮质面罩
	.target 哨兵加里安
step
    .goto 1436/0,1166.57,-10653.47
	>>与 |cRXP_FRIENDLY_希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 45 份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_。|r
    .collect 1205,45,64,1 --Melon Juice (45)
	.target 旅店老板希瑟尔
    .money <0.45
step
    .goto 1436/0,1166.57,-10653.47
	>>与 |cRXP_FRIENDLY_希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 40 份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_。|r
    .collect 1205,40,64,1 --Melon Juice (40)
	.target 旅店老板希瑟尔
    .money <0.40
step
    .goto 1436/0,1166.57,-10653.47
	>>与 |cRXP_FRIENDLY_希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 35 份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_。|r
    .collect 1205,35,64,1 --Melon Juice (35)
	.target 旅店老板希瑟尔
    .money <0.35
step
    .goto 1436/0,1166.57,-10653.47
	>>与 |cRXP_FRIENDLY_希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 30 份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_。|r
    .collect 1205,30,64,1 --Melon Juice (30)
	.target 旅店老板希瑟尔
    .money <0.30
step
    .goto 1436/0,1166.57,-10653.47
	>>与 |cRXP_FRIENDLY_希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 25 份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_。|r
    .collect 1205,25,64,1 --Melon Juice (25)
	.target 旅店老板希瑟尔
    .money <0.25
step
    .goto 1436/0,1166.57,-10653.47
	>>与 |cRXP_FRIENDLY_希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 20 份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_。|r
    .collect 1205,20,64,1 --Melon Juice (20)
	.target 旅店老板希瑟尔
    .money <0.20
step
    .goto 1436/0,1166.57,-10653.47
	>>与 |cRXP_FRIENDLY_希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 15 份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_。|r
    .collect 1205,15,64,1 --Melon Juice (15)
	.target 旅店老板希瑟尔
    .money <0.15
step
    .goto 1436/0,1166.57,-10653.47
	>>与 |cRXP_FRIENDLY_希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 10 份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_。|r
    .collect 1205,10,64,1 --Melon Juice (10)
	.target 旅店老板希瑟尔
    .money <0.10
step
    .goto 1436/0,1166.57,-10653.47
	>>与 |cRXP_FRIENDLY_希瑟尔|r交谈
    >>|cRXP_BUY_向她购买 5 份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_。|r
    .collect 1205,5,64,1 --Melon Juice (5)
	.target 旅店老板希瑟尔
    .money <0.05
step
    #completewith Grayson
    >>打开地上的 |cRXP_PICK_燕麦袋|r，拾取 |cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_需要 5 秒施法时间|r
    .complete 151,1 --Handful of Oats (8)
step
    #completewith Oil
    >>用范围法术击杀 |cRXP_ENEMY_血牙野猪|r，拾取它们的 |cRXP_LOOT_血牙野猪的肝|r和 |cRXP_LOOT_血牙野猪的头|r
    >>用范围法术击杀 |cRXP_ENEMY_碎尸鸟|r，拾取它们的 |cRXP_LOOT_秃鹫肉条|r
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +血牙野猪
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +血牙野猪
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +碎尸鸟
step
    #completewith Compass
    .goto 1436/0,1635.92,-10621.27,60,0
    >>用范围法术击杀 |cRXP_ENEMY_看守傀儡|r，拾取它们的 |cRXP_LOOT_灯油|r和 |cRXP_LOOT_蛇麻草|r
    .complete 9,1 --Harvest Watcher (20)
    .collect 814,5,103,1 --Flask of Oil (5)
    .collect 1274,5,117,1 --Hops (5)
    .mob 看守傀儡
step
    #completewith Oil
    >>用范围法术击杀 |cRXP_ENEMY_迪菲亚成员|r，拾取他们的 |cRXP_LOOT_红色皮质面罩|r
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚走私者
    .mob 迪菲亚捕兽者
    .mob 迪菲亚强夺者
    .mob 迪菲亚抢劫者
step
    #label Compass
    .goto 1436/0,1748.27,-10672.13
    >>打开 |cRXP_PICK_阿历克斯顿的箱子|r，拾取 |cRXP_LOOT_简易罗盘|r
    >>|cRXP_WARN_需要 5 秒施法时间|r
    .complete 399,1 --A Simple Compass (1)
step
    #label Oil
    .goto 1436/0,1708.02,-10578.80,60,0
    .goto 1436/0,1772.07,-10493.63,60,0
    .goto 1436/0,1839.27,-10496.90,60,0
    .goto 1436/0,1863.07,-10251.20,60,0
    .goto 1436/0,1635.92,-10621.27,60,0
    .goto 1436/0,1708.02,-10578.80,60,0
    .goto 1436/0,1772.07,-10493.63,60,0
    .goto 1436/0,1839.27,-10496.90,60,0
    .goto 1436/0,1863.07,-10251.20,60,0
    .goto 1436/0,1635.92,-10621.27
    >>用范围法术击杀 |cRXP_ENEMY_看守傀儡|r和 |cRXP_ENEMY_麦田傀儡|r，拾取它们的 |cRXP_LOOT_灯油|r和 |cRXP_LOOT_蛇麻草|r
    .collect 814,5,103,1 --Flask of Oil (5)
    .collect 1274,5,117,1 --Hops (5)
    .mob 看守傀儡
    .mob 麦田傀儡
step
    #completewith next
    +|cRXP_WARN_留意 |cRXP_ENEMY_老瞎眼|r，尽量沿山脊边缘前进，以免错过他|r
    .unitscan 老瞎眼
step
    .goto 1436/0,1952.67,-10751.7,60,0
    .goto 1436/0,1991.52,-10927.40,60,0
    .goto 1436/0,1874.97,-10996.000,60,0
    .goto 1436/0,1929.22,-11019.80,60,0
    .goto 1436/0,1917.67,-11086.77,30 >> 用范围法术清理豺狼人营地
    >>用范围法术击杀 |cRXP_ENEMY_河爪草药师|r、|cRXP_ENEMY_混血河爪豺狼人|r和 |cRXP_ENEMY_河爪蛮兵|r，拾取他们的 |cRXP_LOOT_豺狼人的爪子|r
    >>如果找到了 |cRXP_ENEMY_老瞎眼|r，就跳过此步骤
    .complete 102,1 --Gnoll Paws (8)
    .mob 河爪草药师
    .mob 混血河爪豺狼人
    .mob 河爪蛮兵
step
    #completewith next
    +|cRXP_WARN_找到 |cRXP_ENEMY_老瞎眼|r，将他风筝到|r |cRXP_FRIENDLY_葛瑞森|r附近
    .unitscan 老瞎眼
step
    #label Grayson
    .goto 1436/0,1965.97,-11407.13
    >>与 |cRXP_FRIENDLY_葛瑞森|r交谈
    .accept 104 >> 接任务：海岸上的威胁
    .target 葛瑞森船长
step
    .goto 1436/0,1829.47,-11357.20,70,0
    .goto 1436/0,1795.87,-11402.47,70,0
    .goto 1436/0,1778.37,-11374.70,70,0
    .goto 1436/0,1829.47,-11357.20,70,0
    .goto 1436/0,1900.52,-11319.87,70,0
    .goto 1436/0,1955.12,-11284.17,70,0
    .goto 1436/0,1984.17,-11236.33,70,0
    .goto 1436/0,1999.57,-11160.50,70,0
    .goto 1436/0,2009.37,-11093.53,70,0
    .goto 1436/0,2042.27,-11064.37,70,0
    .goto 1436/0,2062.22,-11032.40,70,0
    .goto 1436/0,2076.57,-10959.13,70,0
    .goto 1436/0,2097.22,-10934.40,70,0
    .goto 1436/0,1829.47,-11357.20,70,0
    .goto 1436/0,1795.87,-11402.47,70,0
    .goto 1436/0,1778.37,-11374.70,70,0
    .goto 1436/0,1829.47,-11357.20,70,0
    .goto 1436/0,1900.52,-11319.87,70,0
    .goto 1436/0,1955.12,-11284.17,70,0
    .goto 1436/0,1984.17,-11236.33,70,0
    .goto 1436/0,1999.57,-11160.50,70,0
    .goto 1436/0,2009.37,-11093.53,70,0
    .goto 1436/0,2042.27,-11064.37,70,0
    .goto 1436/0,2062.22,-11032.40,70,0
    .goto 1436/0,2076.57,-10959.13,70,0
    .goto 1436/0,2097.22,-10934.40
    >>用范围法术击杀 |cRXP_ENEMY_老瞎眼|r，拾取 |cRXP_LOOT_老瞎眼的鳞片|r
    .complete 104,1 --Scale of Old Murk-Eye
    .unitscan 老瞎眼
step
    .goto 1436/0,1965.97,-11407.13
    >>与 |cRXP_FRIENDLY_葛瑞森|r交谈
    .accept 103 >> 接任务：长明的灯塔
    .turnin 103,1 >> 交任务：长明的灯塔
    .turnin 104,3 >> 交任务：海岸上的威胁
    .target 葛瑞森船长
step
    #completewith next
    >>用范围法术击杀 |cRXP_ENEMY_迪菲亚拳匪|r和 |cRXP_ENEMY_迪菲亚路霸|r，拾取他们的 |cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_当心，|cRXP_ENEMY_迪菲亚路霸|r会施放|r |T132090:0|t[背刺] |cRXP_WARN_（从背后造成双倍伤害）|r
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚拳匪
    .mob 迪菲亚路霸
step
    .goto 1436/0,1454.97,-11272.73
    >>与 |cRXP_FRIENDLY_葛瑞姆|r交谈
    .accept 117 >> 接任务：雷霆啤酒
    .turnin 117 >> 交任务：雷霆啤酒
    .target 葛瑞姆·雷酒
step
    #completewith next
    .goto 1436/0,1309.72,-11213.000,60,0
    .goto 1436/0,1206.12,-11142.30,60,0
    .goto 1436/0,1177.07,-11100.30,60,0
    >>用范围法术击杀 |cRXP_ENEMY_迪菲亚拳匪|r和 |cRXP_ENEMY_迪菲亚路霸|r，拾取他们的 |cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_当心，|cRXP_ENEMY_迪菲亚路霸|r会施放|r |T132090:0|t[背刺] |cRXP_WARN_（从背后造成双倍伤害）|r
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚拳匪
    .mob 迪菲亚路霸
step
    .goto 1436/0,1193.87,-11078.60,60 >> 前往匕首岭的尽头
    .isOnQuest 153
step
    #completewith Footpads
    >>打开地上的 |cRXP_PICK_燕麦袋|r，拾取 |cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_需要 5 秒施法时间|r
    .complete 151,1 --Handful of Oats (8)
step
    #completewith AoE1
    >>用范围法术击杀 |cRXP_ENEMY_血牙野猪|r，拾取它们的 |cRXP_LOOT_血牙野猪的肝|r和 |cRXP_LOOT_血牙野猪的头|r
    >>用范围法术击杀 |cRXP_ENEMY_碎尸鸟|r，拾取它们的 |cRXP_LOOT_秃鹫肉条|r
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
    >>用范围法术击杀 |cRXP_ENEMY_迪菲亚捕兽者|r和 |cRXP_ENEMY_迪菲亚走私者|r，拾取他们的 |cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_当心，|cRXP_ENEMY_迪菲亚捕兽者|r会施放|r |T132090:0|t[背刺] |cRXP_WARN_（从背后造成双倍伤害）和|r |T132149:0|t[投网] |cRXP_WARN_（定身 9 秒）|r
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚捕兽者
    .mob 迪菲亚走私者
step
    #label AoE1
    .goto 1436/0,1383.92,-10636.43,60,0
    .goto 1436/0,1328.97,-10454.90,60,0
    .goto 1436/0,1414.72,-10314.43,60,0
    .goto 1436/0,1389.52,-10270.330,60,0
    .goto 1436/0,1457.77,-10209.90,150 >> 前往摩尔森农场
    .isOnQuest 153
step
    #completewith Watch
    .goto 1436/0,1457.77,-10209.90,60,0
    >>用范围法术击杀 |cRXP_ENEMY_看守傀儡|r
    .complete 9,1 --Harvest Watcher (20)
    .mob 看守傀儡
step
    #completewith Furlbrows
    >>用范围法术击杀 |cRXP_ENEMY_幼年血牙野猪|r，拾取它们的 |cRXP_LOOT_血牙野猪的肝|r和 |cRXP_LOOT_血牙野猪的头|r
    >>用范围法术击杀 |cRXP_ENEMY_碎尸鸟|r和 |cRXP_ENEMY_小碎尸鸟|r，拾取它们的 |cRXP_LOOT_秃鹫肉条|r
    .collect 723,8,22,1 --Goretusk Liver (8)
    .mob +幼年血牙野猪
    .collect 731,3,38,1 --Goretusk Snout (3)
    .mob +幼年血牙野猪
    .collect 729,3,38,1 --Stringy Vulture Meat (3)
    .mob +碎尸鸟
    .mob +小碎尸鸟
step
    .goto 1436/0,1471.77,-10022.07,60,0
    .goto 1436/0,1402.12,-10018.80,60,0
    .goto 1436/0,1310.77,-9885.10
    >>用范围法术击杀 |cRXP_ENEMY_迪菲亚捕兽者|r和 |cRXP_ENEMY_迪菲亚走私者|r，拾取他们的 |cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_当心，|cRXP_ENEMY_迪菲亚捕兽者|r会施放|r |T132090:0|t[背刺] |cRXP_WARN_和|r |T132149:0|t[投网]
    >>|cRXP_WARN_如果以下两个目标的进度未同时达到 10/15，就跳过此步骤：|cRXP_ENEMY_迪菲亚捕兽者|r和|r |cRXP_ENEMY_迪菲亚走私者|r
    .complete 153,1,1 --Red Leather Bandana (15)
    .mob +迪菲亚捕兽者
    .mob +迪菲亚走私者
    .complete 12,1 --Defias Trapper (15)
    .mob +迪菲亚捕兽者
    .complete 12,2 --Defias Smuggler (15)
    .mob +迪菲亚走私者
step
    #completewith next
    .goto 1436/0,1310.77,-9885.10,60,0
    >>用范围法术击杀 |cRXP_ENEMY_迪菲亚捕兽者|r和 |cRXP_ENEMY_迪菲亚走私者|r，拾取他们的 |cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_当心，|cRXP_ENEMY_迪菲亚捕兽者|r会施放|r |T132090:0|t[背刺] |cRXP_WARN_和|r |T132149:0|t[投网]
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚捕兽者
    .mob 迪菲亚走私者
step
    #label Watch
    .goto 1436/0,1290.12,-9849.40
    >>打开 |cRXP_PICK_法布隆的柜子|r，拾取 |cRXP_LOOT_法布隆的怀表|r
    >>|cRXP_WARN_需要 5 秒施法时间|r
    .complete 64,1 --Furlbrow's Pocket Watch (1)
step
    #completewith Oats
    .goto 1436/0,1249.17,-9898.87,60,0
    .goto 1436/0,1207.17,-9940.4,60,0
    >>用范围法术击杀 |cRXP_ENEMY_看守傀儡|r
    .complete 9,1 --Harvest Watcher (20)
    .mob 看守傀儡
step
    .goto 1436/0,1195.97,-9750.00,60,0
    .goto 1436/0,1024.12,-9697.50
    >>用范围法术击杀 |cRXP_ENEMY_河爪斥候|r和 |cRXP_ENEMY_河爪豺狼人|r，拾取他们的 |cRXP_LOOT_豺狼人的爪子|r
    .complete 102,1 --Gnoll Paws (8)
    .mob 河爪斥候
    .mob 河爪豺狼人
step
    .goto 1436/0,1184.07,-9623.77,60,0
    .goto 1436/0,1133.67,-9649.43,60,0
    .goto 1436/0,1058.07,-9591.80
    >>用范围法术击杀 |cRXP_ENEMY_滩行鱼人|r和 |cRXP_ENEMY_鱼人袭击者|r，拾取它们的 |cRXP_LOOT_鱼人的眼球|r
    .collect 730,3,38,1 --Murloc Eye (3)
    .mob 滩行鱼人
    .mob 鱼人袭击者
step
    #label Footpads
    .goto 1436/0,1037.07,-9849.17
    >>用范围法术击杀 |cRXP_ENEMY_迪菲亚拦路贼|r，拾取他们的 |cRXP_LOOT_红色皮质面罩|r
    >>|cRXP_WARN_当心，|cRXP_ENEMY_迪菲亚拦路贼|r会施放|r |T132090:0|t[背刺]
    .complete 153,1 --Red Leather Bandana (15)
    .mob 迪菲亚拦路贼
step
    #label Oats
    .goto 1436/0,1037.07,-9849.17
    >>打开地上的 |cRXP_PICK_燕麦袋|r，拾取 |cRXP_LOOT_一捧燕麦|r
    >>|cRXP_WARN_需要 5 秒施法时间|r
    .complete 151,1 --Handful of Oats (8)
step
    #label Furlbrows
    >>与 |cRXP_FRIENDLY_农夫法布隆|r和 |cRXP_FRIENDLY_弗娜|r交谈
    .turnin 64 >> 交任务：遗失的怀表
    .target +农夫法布隆
    .goto 1436/0,918.42,-9851.50
    .turnin 151 >> 交任务：老马布兰契
    .goto 1436/0,919.82,-9852.90
    .target +弗娜·法布隆
step
    .goto 1436/0,926.47,-10207.80,80,0
    .goto 1436/0,908.27,-10506.000
    >>用范围法术击杀 |cRXP_ENEMY_血牙野猪|r和 |cRXP_ENEMY_幼年血牙野猪|r，拾取它们的 |cRXP_LOOT_血牙野猪的肝|r和 |cRXP_LOOT_血牙野猪的头|r
    >>用范围法术击杀 |cRXP_ENEMY_碎尸鸟|r和 |cRXP_ENEMY_小碎尸鸟|r，拾取它们的 |cRXP_LOOT_秃鹫肉条|r
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
    .goto 1436/0,1167.27,-10110.73,60,0
    .goto 1436/0,1207.17,-9940.40
    >>用范围法术击杀 |cRXP_ENEMY_看守傀儡|r
    .complete 9,1 --Harvest Watcher (20)
    .mob 看守傀儡
step
    .goto 1436/0,1207.17,-9940.40
    .xp 17+11890 >> 刷怪至17级 11890+/17700 经验值
    .isQuestComplete 12
step
    .goto 1436/0,1207.17,-9940.40
    >>|cRXP_WARN_如果已经完成“西部荒野人民军”的任务目标，就跳过此步骤|r
    .xp 17+12800 >> 刷怪至17级 12800+/17700 经验值
    .isQuestNotComplete 12
step
    >>与 |cRXP_FRIENDLY_农夫萨丁|r交谈，再与屋内的 |cRXP_FRIENDLY_萨尔玛|r交谈
    .turnin 9,1 >> 交任务：清理荒野
    .vendor >> 出售垃圾物品
    .target +农夫萨丁
    .goto 1436/0,1055.27,-10128.70
    .turnin 22 >> 交任务：猪肝馅饼
    .turnin 38 >> 交任务：杂味炖肉
    .goto 1436/0,1041.97,-10112.13
    .target +萨尔玛·萨丁
step
	>> 与 |cRXP_FRIENDLY_格里安|r和 |cRXP_FRIENDLY_丹努文|r交谈
    .turnin 12 >> 交任务：西部荒野人民军
    .target +格里安·斯托曼
    .goto 1436/0,1045.12,-10508.80
    .turnin 102,1 >> 交任务：西部荒野的豺狼人
    .goto 1436/0,1041.97,-10511.13
	.target +丹努文队长
    .isQuestComplete 12
step
    .goto 1436/0,1041.97,-10511.13
	>> 与 |cRXP_FRIENDLY_丹努文|r交谈
    .turnin 102,1 >> 交任务：西部荒野的豺狼人
	.target 丹努文队长
step
    .goto 1436/0,1127.37,-10636.43
	>>与 |cRXP_FRIENDLY_加里安|r交谈
    .turnin 153,2 >> 交任务：红色皮质面罩
	.target 哨兵加里安
step
    #completewith next
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级 2）] |cRXP_WARN_，在起飞前尽可能多地制造饮用水|r
step
    #completewith next
    .goto 1436/0,1037.07,-10628.27
	>>与 |cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >> 飞往暴风城
	.target 索尔
step
    #completewith next
    .goto 1453/0,686.25,-8815.41,8,0
    .goto 1453/0,684.24,-8820.34,4,0
    .goto 1453/0,687.46,-8818.01,6,0
    .goto 1453/0,854.42,-8965.28,12,0
    >>|cRXP_WARN_跳上火把，然后落到暴风城下方|r
    >>|cRXP_WARN_将阴影设为“普通”或“低”，在蓝色虚空前，站到恐龙图案（Derek the Dinosaur）的双脚之间，即泥土颜色较浅的部位，然后径直向前走|r
    >>|cRXP_WARN_注意：这种方法有小概率导致死亡。也可以按正常路线走到法师塔|r
    .link https://youtu.be/gV8-wgQEomc >> 点击此处查看指南
    .goto 1453/0,861.95,-8990.47,10 >>前往 |cRXP_FRIENDLY_詹妮亚|r处
step
    .goto 1453/0,861.95,-8990.47
    >>与 |cRXP_FRIENDLY_詹妮亚|r交谈
    .turnin 1861,1 >> 交任务：明镜湖 << Gnome
--   .turnin 1919 >> Turn in Report to Jennea
    .trainer >> 学习职业技能（火球术等级 4）
    >>总花费：18 银币
    .target 詹妮亚·坎农
step
    #completewith next
    .goto 1453/0,887.22,-9017.80,10,0
    .goto 1453/0,871.36,-9013.14,10,0
    .goto 1453/0,868.8,-9004.27,8,0
    .goto 1453/0,877.00,-9008.03,6,0
    .goto 1453/0,863.96,-9001.40,8,0
    .goto 1453/0,928.62,-9010.10,15,0
    .goto 1453/0,962.63,-8990.73,15,0
    .goto 1453/0,949.86,-9009.380,10,0
    .goto 1453/0,942.34,-9001.49,8,0
    >>离开法师塔
    .goto 1453/0,948.65,-8994.50,10 >>前往 |cRXP_FRIENDLY_查瑞斯|r处
step
    .goto 1453/0,948.65,-8994.50
    >>进入建筑
    >>与 |cRXP_FRIENDLY_查瑞斯|r交谈
    .vendor 1307 >> |cRXP_BUY_向她购买|r |T134851:0|t[次级法力药水] |cRXP_BUY_和|r |T134831:0|t[治疗药水] |cRXP_BUY_（如果有货）|r
    .target 查瑞斯·伊瑟里安
step
    #completewith next
    .goto 1453/0,958.74,-8987.870,20,0
    .goto 1453/0,941.80,-8918.49,20,0
    .goto 1453/0,916.79,-8891.960,20,0
    .goto 1453/0,948.65,-8816.30,20,0
    .goto 1453/0,946.64,-8803.31,20,0
    .goto 1453/0,970.57,-8772.740,20,0
    .goto 1453/0,1030.92,-8747.20,20,0
    .goto 1453/0,1049.34,-8750.330,20,0
    .goto 1453/0,1093.16,-8779.020,10 >>前往 |cRXP_FRIENDLY_阿古斯|r处
step
    .goto 1453/0,1093.16,-8779.020
    >>与 |cRXP_FRIENDLY_阿古斯|r交谈
    .accept 3765 >> 接任务：遥远的旅途
    .target 阿古斯·夜语
step
    .goto 1453/0,822.16,-8865.60
    >>进入建筑
    >>与 |cRXP_FRIENDLY_艾代尔|r交谈
    .vendor 1316 >> |cRXP_BUY_向他购买不加智力的|r |T134943:0|t[卷轴] |cRXP_BUY_（如果有货）|r
    .target 艾代尔·吉尔罗
step
    #completewith next
    .goto 1453/0,661.38,-8858.16,12,0
    .goto 1453/0,680.61,-8829.39,12,0
    .goto 1453/0,717.44,-8847.32,12,0
    .goto 1453/0,693.24,-8891.51,12,0
    .goto 1453/0,681.28,-8888.01,10 >>前往 |cRXP_FRIENDLY_罗伯特|r处
step
    .goto 1453/0,681.28,-8888.01
    >>进入建筑
    >>与 |cRXP_FRIENDLY_罗伯特|r交谈
    >>|cRXP_BUY_向他购买|r |T132620:0|t[一桶葡萄酒] |cRXP_BUY_。|r
    .collect 1941,1,116,1 --Cask of Merlot
    .target 罗伯特·奥布斯
step
    #completewith next
    .goto 1453/0,680.61,-8828.67,15,0
    .goto 1453/0,635.44,-8863.81,8 >>前往 |cRXP_FRIENDLY_凯德雷克|r处
step
    .goto 1453/0,635.44,-8863.81
    >>隔墙与 |cRXP_FRIENDLY_凯德雷克|r交谈
    .vendor 1257 >> |cRXP_BUY_向他购买|r |T134830:0|t[次级治疗药水] |cRXP_BUY_（如果有货）|r
    .target 凯德雷克·布舍尔
step
    #completewith Bank3
    .goto 1453/0,637.59,-8889.81,10 >>进入暴风城银行
step
    #sticky
    #label Bank4
    .goto 1453/0,614.33,-8932.92
    >>与 |cRXP_FRIENDLY_牛顿|r交谈
    .bankwithdraw 769,5354,6889 >> 从银行取出下列物品：
    >>|T133970:0|t[大块野猪肉]
    >>|T133469:0|t[写给德尔格伦的信]
    >>|T132832:0|t[小蛋]
step
    #label Bank3
    .goto 1453/0,614.33,-8932.92
    >>与 |cRXP_FRIENDLY_牛顿|r交谈
    >>|cRXP_WARN_注意：稍后交布料任务时，每种布料都需要 12 组（|r|T132911:0|t[毛料]|cRXP_WARN_、|r |T132905:0|t[丝绸]|cRXP_WARN_、|r |T132892:0|t[魔纹布]|cRXP_WARN_和|r |T132903:0|t[符文布]|cRXP_WARN_）。升级过程中会自然积攒这些布料|r
    .bankdeposit 2998,4371,1711,1478,1712,3012,1180,1181,3013,17056,2592,1941 >> 将下列物品存入银行：
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
    .goto 1453/0,662.46,-8860.76,10,0
    >>进入旅店
    .goto 1453/0,673.75,-8867.93,10 >>前往 |cRXP_FRIENDLY_奥里森|r处
    .target 旅店老板奥里森
step
    .goto 1453/0,673.75,-8867.93
    >>|cRXP_WARN_===注意===|r
    >>|cRXP_WARN_交谈对象：|r |cRXP_FRIENDLY_奥里森|r
    >>|cRXP_WARN_打开“设置炉石”菜单，然后施放|r |T134414:0|t[炉石]
    .hs >> |cRXP_WARN_利用炉石批处理，从暴风城返回奥伯丁|r
    .target 旅店老板奥里森
    .zoneskip Darkshore
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#forever
#disabledungeons
<< Alliance Mage
#name 18-20 ADV Darkshore 3 Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none Mage
#next 20-22 ADV Redridge 1 Mage AoE
#displayname 18-20 黑海岸 3（法师进阶 AoE）
step
    .goto 1439/1,529.30,6415.93
    >>与 |cRXP_FRIENDLY_塔尔丹|r 交谈
    >>|cRXP_BUY_向他购买45份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_|r
    .collect 1205,45,4740,1 --Melon Juice (45)
    .target 塔尔丹
    .money <0.45
step
    .goto 1439/1,529.30,6415.93
    >>与 |cRXP_FRIENDLY_塔尔丹|r 交谈
    >>|cRXP_BUY_向他购买40份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_|r
    .collect 1205,40,4740,1 --Melon Juice (40)
    .target 塔尔丹
    .money <0.40
step
    .goto 1439/1,529.30,6415.93
    >>与 |cRXP_FRIENDLY_塔尔丹|r 交谈
    >>|cRXP_BUY_向他购买35份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_|r
    .collect 1205,35,4740,1 --Melon Juice (35)
    .target 塔尔丹
    .money <0.35
step
    .goto 1439/1,529.30,6415.93
    >>与 |cRXP_FRIENDLY_塔尔丹|r 交谈
    >>|cRXP_BUY_向他购买30份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_|r
    .collect 1205,30,4740,1 --Melon Juice (30)
    .target 塔尔丹
    .money <0.30
step
    .goto 1439/1,529.30,6415.93
    >>与 |cRXP_FRIENDLY_塔尔丹|r 交谈
    >>|cRXP_BUY_向他购买25份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_|r
    .collect 1205,25,4740,1 --Melon Juice (25)
    .target 塔尔丹
    .money <0.25
step
    .goto 1439/1,529.30,6415.93
    >>与 |cRXP_FRIENDLY_塔尔丹|r 交谈
    >>|cRXP_BUY_向他购买20份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_|r
    .collect 1205,20,4740,1 --Melon Juice (20)
    .target 塔尔丹
    .money <0.20
step
    .goto 1439/1,529.30,6415.93
    >>与 |cRXP_FRIENDLY_塔尔丹|r 交谈
    >>|cRXP_BUY_向他购买15份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_|r
    .collect 1205,15,4740,1 --Melon Juice (15)
    .target 塔尔丹
    .money <0.15
step
    .goto 1439/1,529.30,6415.93
    >>与 |cRXP_FRIENDLY_塔尔丹|r 交谈
    >>|cRXP_BUY_向他购买10份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_|r
    .collect 1205,10,4740,1 --Melon Juice (10)
    .target 塔尔丹
    .money <0.10
step
    .goto 1439/1,529.30,6415.93
    >>与 |cRXP_FRIENDLY_塔尔丹|r 交谈
    >>|cRXP_BUY_向他购买5份|r |T132796:0|t[甜瓜汁] |cRXP_BUY_|r
    .collect 1205,5,4740,1 --Melon Juice (5)
    .target 塔尔丹
    .money <0.05
step
    .goto 1439/1,533.23,6399.77
    >>与 |cRXP_FRIENDLY_莱尔德|r 交谈
    >>|cRXP_BUY_向他购买至多40条|r |T133918:0|t[长嘴泥鳅] |cRXP_BUY_|r
    .collect 4592,40,4740,1 --Longjaw Mud Snapper (40)
    .target 莱尔德
step
    >>接取通缉任务，后续路线将击杀莫克迪普
    .accept 4740 >> 接任务：通缉：莫克迪普！
    .goto 1439/1,503.76,6402.39
step
    .goto 1439/1,577.77,6371.39
    >>与 |cRXP_FRIENDLY_古博|r 交谈
    .accept 1138 >>接任务：海中的水果
    .target 古博·布拉普
step
    .goto 1439/1,89.14,5002.00
    >>与 |cRXP_FRIENDLY_安努|r 交谈
    .turnin 948 >> 交任务：安努
    .accept 944 >> 接任务：主宰之剑
    .target 安努
step
    .goto 1439/1,33.47,4996.33
    >>与 |cRXP_FRIENDLY_克罗尼亚|r 交谈
    >>|cRXP_WARN_如果 |cRXP_FRIENDLY_克罗尼亚|r 不在这里，就跳过此步|r
    .accept 5321 >>接任务：昏昏欲睡
    .target 克罗尼亚·恒影
step
    .goto 1439/1,34.12,5001.570
    >>打开 |cRXP_PICK_克罗尼亚的箱子|r，拾取 |cRXP_LOOT_唤醒号角|r
    >>|cRXP_WARN_使用|r |T134229:0|t[|cRXP_LOOT_唤醒号角|r] |cRXP_WARN_，每当 |cRXP_FRIENDLY_克罗尼亚|r 睡着时对他使用|r
    >>|cRXP_WARN_这两项操作的施法时间均为5秒|r
    .complete 5321,1 --Horn of Awakening (1)
    .isOnQuest 5321
step
    #completewith Glaive1
    >>用AoE击杀 |cRXP_ENEMY_月夜雄虎|r，拾取 |cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r 与 |cRXP_ENEMY_灰斑蓟熊|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
   .complete 986,1 --Fine Moonstalker Pelt (5)
   .mob 月夜雄虎
   .use 13536
   .isOnQuest 5321
step
    #completewith next
    >>用AoE击杀 |cRXP_ENEMY_灰斑蓟熊|r，拾取 |cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r 与 |cRXP_ENEMY_月夜雄虎|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
   .complete 1003,1 --Grizzled Scalp (4)
   .mob 灰斑蓟熊
   .use 13536
   .isOnQuest 5321
step
    #label Glaive1
   .goto 1439/1,410.09,4519.49
    >>前往主宰之剑
   .complete 944,1 --Enter the Master's Glaive (1)
   .use 13536
   .isOnQuest 5321
step
    #completewith Therylune1
    >>用AoE击杀 |cRXP_ENEMY_暮光信徒|r 和 |cRXP_ENEMY_暮光暴徒|r，拾取 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r] 开始任务|r
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .use 5352
    .accept 968 >> 接任务：深渊之神
    .mob 暮光信徒
    .mob 暮光暴徒
    .use 13536
    .isOnQuest 5321
step
    #completewith next
    .goto 1439/1,410.09,4519.49
    >>将 |T134715:0|t[占卜之水] 放到地上
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    >>点击地上的 |cRXP_PICK_占卜之水|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接任务：暮光之锤的营地
    .use 13536
    .use 5251
    .isOnQuest 5321
step
   .goto 1439/1,410.09,4519.49
    >>与 |cRXP_FRIENDLY_瑟瑞露尼|r 交谈
    >>|cRXP_WARN_如果 |cRXP_FRIENDLY_瑟瑞露尼|r 不在这里，就用AoE击杀 |cRXP_ENEMY_暮光信徒|r 和 |cRXP_ENEMY_暮光暴徒|r，拾取 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r]，直到她出现|r
   .accept 945 >> 接任务：护送瑟瑞露尼
   .target 瑟瑞露尼
   .use 13536
   .isOnQuest 5321
step
    #completewith Tome1
    >>护送 |cRXP_FRIENDLY_瑟瑞露尼|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .use 13536
    .target 瑟瑞露尼
    .isOnQuest 5321
step
   .goto 1439/1,416.64,4576.69
   >>将 |T134715:0|t[占卜之水] 放到地上
   >>|cRXP_WARN_此操作的施法时间为5秒|r
   >>点击地上的 |cRXP_PICK_占卜之水|r
   .turnin 944 >> 交任务：主宰之剑
   .accept 949 >> 接任务：暮光之锤的营地
   .use 13536
   .use 5251
   .isOnQuest 5321
step
    #label Tome1
   .goto 1439/1,416.64,4576.69
    >>点击 |cRXP_PICK_暮光之书|r
   .turnin 949 >> 交任务：暮光之锤的营地
   .accept 950 >> 接任务：向安努回复
   .use 13536
   .isOnQuest 5321
step
   #label Therylune1
   >>护送 |cRXP_FRIENDLY_瑟瑞露尼|r
   >>|cRXP_WARN_确保 |cRXP_FRIENDLY_瑟瑞露尼|r 一直在你的可视范围内，否则任务会失败|r
   .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
   .use 13536
   .target 瑟瑞露尼
   .isOnQuest 950
step
    #completewith Remtravel1
    >>用AoE击杀 |cRXP_ENEMY_月夜雄虎|r，拾取 |cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r 与 |cRXP_ENEMY_灰斑蓟熊|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .use 13536
    .isOnQuest 950
step
    #completewith next
    >>用AoE击杀 |cRXP_ENEMY_灰斑蓟熊|r，拾取 |cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r 与 |cRXP_ENEMY_月夜雄虎|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
    .use 13536
    .isOnQuest 950
step
    #label Remtravel1
    .goto 1439/1,602.01,4678.87
    >>与 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r 交谈，开始护送
    .turnin 729 >> 交任务：健忘的勘察员
    .accept 731 >> 接任务：健忘的勘察员
    .target 勘察员雷姆塔维尔
    .use 13536
    .isOnQuest 950
step
    .goto 1439/1,626.24,4633.89,40,0
    .goto 1439/1,569.26,4572.76,40,0
    .goto 1439/1,626.24,4633.89,40,0
    .goto 1439/1,602.01,4678.87,40,0
    .goto 1439/1,892.83,4517.30
    >>护送 |cRXP_FRIENDLY_雷姆塔维尔|r
    >>|cRXP_ENEMY_砂石断骨者|r 和 |cRXP_ENEMY_砂石地占师|r 出现后，先让 |cRXP_ENEMY_砂石地占师|r 施放 |T135812:0|t[火球术] 攻击 |cRXP_FRIENDLY_雷姆塔维尔|r，再对它施放 |T136071:0|t[变形术]。先击杀 |cRXP_ENEMY_砂石断骨者|r，再击杀 |cRXP_ENEMY_砂石地占师|r
    .complete 731,1 --Escort Prospector Remtravel (1)
    .target 勘察员雷姆塔维尔
    .mob 砂石地占师
    .mob 砂石断骨者
    .use 13536
    .isOnQuest 950
step
    #completewith SeaC
    >>用AoE击杀 |cRXP_ENEMY_月夜雄虎|r，拾取 |cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r 与 |cRXP_ENEMY_灰斑蓟熊|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .use 13536
    .isOnQuest 950
step
    #completewith SeaC
    >>用AoE击杀 |cRXP_ENEMY_灰斑蓟熊|r，拾取 |cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r 与 |cRXP_ENEMY_月夜雄虎|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
    .use 13536
    .isOnQuest 950
step
    #completewith next
    +从现在起，不要再唤醒 |cRXP_FRIENDLY_克罗尼亚|r
    >>留意 |cRXP_ENEMY_雌性森林陆行鸟|r
    .unitscan 雌性森林陆行鸟
    .isOnQuest 950
step
    #label SeaC
    .goto 1439/1,892.83,4517.30
    >>拾取地上的 |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_在颈部位置拾取|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .accept 4733 >>接任务：搁浅的海洋生物
    .isOnQuest 950
step
    #completewith next
    .abandon 5321 >> 放弃任务：昏昏欲睡
    .isOnQuest 950
    .isQuestNotComplete 5321
step
    .goto 1439/1,896.76,4597.21
    >>拾取地上的 |cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_龟壳可以阻挡视线，可利用它卡住视线。|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .accept 4732 >>接任务：搁浅的海龟
    .isOnQuest 950
step
    #completewith SeaCreature
    >>用AoE击杀 |cRXP_ENEMY_硬壳潮行蟹|r，拾取 |cRXP_LOOT_优质蟹肉|r
   .complete 1138,1 --Fine Crab Chunks (6)
   .mob 硬壳潮行蟹
   .isOnQuest 950
step
    .goto 1439/1,865.32,4678.432
    >>拾取地上的 |cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_龟壳可以阻挡视线，可利用它卡住视线。|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .accept 4731 >>接任务：搁浅的海龟
    .isOnQuest 950
step
    #label SeaCreature
    .goto 1439/1,799.82,4808.12
    >>拾取地上的 |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .accept 4730 >>接任务：搁浅的海洋生物
    .isOnQuest 950
step
    #completewith next
    >>用AoE击杀 |cRXP_ENEMY_暗礁蟹|r，拾取 |cRXP_LOOT_优质蟹肉|r
   .complete 1138,1 --Fine Crab Chunks (6)
   .mob 暗礁蟹
   .isOnQuest 950
step
   .goto 1439/1,549.61,4990.65
   >>清理鱼人营地，暂时不要走到营地中央
   >>清理完所有敌人后，走到营地中央触发3波敌人（3名灰雾滩行者、2名灰雾战士、莫克迪普和一名灰雾猎人）
   >>|cRXP_WARN_运气好的话，|cRXP_ENEMY_莫克迪普|r 可能已在西边离岸约30码处出现（如果之前有人与他战斗时死亡）|r
   .complete 4740,1 --Murkdeep (1)
   .unitscan 莫克迪普
   .isOnQuest 950
step
    #completewith next
    .goto 1439/1,586.29,5048.73,60,0
    .goto 1439/1,583.01,5124.71,60,0
    .goto 1439/1,647.86,5180.600,60,0
    .goto 1439/1,621.66,5210.29,60,0
    >>用AoE击杀 |cRXP_ENEMY_暗礁蟹|r，拾取 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹
    .isOnQuest 950
step
    .goto 1439/1,585.63,5237.370
    >>拾取地上的 |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .accept 4728 >>接任务：搁浅的海洋生物
    .isOnQuest 950
step
    .goto 1439/1,621.66,5210.29,60,0
    .goto 1439/1,647.86,5180.600,60,0
    .goto 1439/1,583.01,5124.71,60,0
    .goto 1439/1,586.29,5048.73,60,0
    .goto 1439/1,609.21,4921.66,60,0
    .goto 1439/1,631.48,4858.78,60,0
    .goto 1439/1,702.88,4809.00
    >>用AoE击杀 |cRXP_ENEMY_暗礁蟹|r，拾取 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹
    .isOnQuest 950
step
    #completewith SeaCreatureGiga
    >>用AoE击杀 |cRXP_ENEMY_月夜雄虎|r，拾取 |cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r 与 |cRXP_ENEMY_灰斑蓟熊|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .use 13536
step
    #completewith SeaCreatureGiga
    >>用AoE击杀 |cRXP_ENEMY_灰斑蓟熊|r，拾取 |cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r 与 |cRXP_ENEMY_月夜雄虎|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
    .use 13536
step
    #label Onu2
    .goto 1439/1,89.14,5002.00
    >>与 |cRXP_FRIENDLY_安努|r 交谈
    .turnin 950 >> 交任务：向安努回复
    .target 安努
    .isQuestComplete 950
step
    #label SeaCreatureGiga
    .goto 1439/1,585.63,5237.370
    >>拾取地上的 |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .accept 4728 >>接任务：搁浅的海洋生物
step
    #completewith next
    .goto 1439/1,621.66,5210.29,60,0
    .goto 1439/1,647.86,5180.600,60,0
    .goto 1439/1,583.01,5124.71,60,0
    .goto 1439/1,586.29,5048.73,60,0
    >>用AoE击杀 |cRXP_ENEMY_暗礁蟹|r，拾取 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹
step
    .goto 1439/1,549.61,4990.65
    >>清理鱼人营地，暂时不要走到营地中央
    >>清理完所有敌人后，走到营地中央触发3波敌人（3名灰雾滩行者、2名灰雾战士、莫克迪普和一名灰雾猎人）
    >>|cRXP_WARN_运气好的话，|cRXP_ENEMY_莫克迪普|r 可能已在西边离岸约30码处出现（如果之前有人与他战斗时死亡）|r
    .complete 4740,1 --Murkdeep (1)
    .unitscan 莫克迪普
step
    #completewith next
    .goto 1439/1,609.21,4921.66,60,0
    .goto 1439/1,631.48,4858.78,60,0
    .goto 1439/1,702.88,4809.00,60,0
    >>用AoE击杀 |cRXP_ENEMY_暗礁蟹|r，拾取 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 暗礁蟹
step
    .goto 1439/1,799.82,4808.12
    >>拾取地上的 |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .accept 4730 >>接任务：搁浅的海洋生物
step
    .goto 1439/1,793.27,4764.89,60,0
    .goto 1439/1,840.43,4696.77
    >>用AoE击杀 |cRXP_ENEMY_硬壳潮行蟹|r，拾取 |cRXP_LOOT_优质蟹肉|r
    .complete 1138,1 --Fine Crab Chunks (6)
    .mob 硬壳潮行蟹
step
    .goto 1439/1,865.32,4678.432
    >>拾取地上的 |cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_龟壳可以阻挡视线，可利用它卡住视线。|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .accept 4731 >>接任务：搁浅的海龟
step
    .goto 1439/1,896.76,4597.21
    >>拾取地上的 |cRXP_LOOT_搁浅的海龟|r
    >>|cRXP_WARN_龟壳可以阻挡视线，可利用它卡住视线。|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .accept 4732 >>接任务：搁浅的海龟
step
    .goto 1439/1,892.83,4517.30
    >>拾取地上的 |cRXP_LOOT_搁浅的海洋生物|r
    >>|cRXP_WARN_在颈部位置拾取|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .accept 4733 >>接任务：搁浅的海洋生物
step
    #completewith Remtravel3
    >>用AoE击杀 |cRXP_ENEMY_月夜雄虎|r，拾取 |cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r 与 |cRXP_ENEMY_灰斑蓟熊|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
    .use 13536
step
    #completewith Remtravel3
    >>用AoE击杀 |cRXP_ENEMY_灰斑蓟熊|r，拾取 |cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r 与 |cRXP_ENEMY_月夜雄虎|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
    .use 13536
step
    #completewith next
    +从现在起，不要再唤醒 |cRXP_FRIENDLY_克罗尼亚|r
    >>留意 |cRXP_ENEMY_雌性森林陆行鸟|r
    .unitscan 雌性森林陆行鸟
 step
    #label Remtravel3
    .goto 1439/1,602.01,4678.87
    >>与 |cRXP_FRIENDLY_勘察员雷姆塔维尔|r 交谈，开始护送
    .turnin 729 >> 交任务：健忘的勘察员
    .accept 731 >> 接任务：健忘的勘察员
    .target 勘察员雷姆塔维尔
step
    .goto 1439/1,626.24,4633.89,40,0
    .goto 1439/1,569.26,4572.76,40,0
    .goto 1439/1,626.24,4633.89,40,0
    .goto 1439/1,602.01,4678.87,40,0
    .goto 1439/1,410.09,4519.49
    >>护送 |cRXP_FRIENDLY_雷姆塔维尔|r
    >>|cRXP_ENEMY_砂石断骨者|r 和 |cRXP_ENEMY_砂石地占师|r 出现后，先让 |cRXP_ENEMY_砂石地占师|r 施放 |T135812:0|t[火球术] 攻击 |cRXP_FRIENDLY_雷姆塔维尔|r，再对它施放 |T136071:0|t[变形术]。先击杀 |cRXP_ENEMY_砂石断骨者|r，再击杀 |cRXP_ENEMY_砂石地占师|r
    .complete 731,1 --Escort Prospector Remtravel (1)
    .target 勘察员雷姆塔维尔
    .mob 砂石地占师
    .mob 砂石断骨者
step
    #completewith Glaive2
    >>用AoE击杀 |cRXP_ENEMY_月夜雄虎|r，拾取 |cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r 与 |cRXP_ENEMY_灰斑蓟熊|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
step
    #completewith next
    >>用AoE击杀 |cRXP_ENEMY_灰斑蓟熊|r，拾取 |cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r 与 |cRXP_ENEMY_月夜雄虎|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
step
    #label Glaive2
   .goto 1439/1,410.09,4519.49
    >>前往主宰之剑
   .complete 944,1 --Enter the Master's Glaive (1)
step
    #completewith Therylune2
    >>用AoE击杀 |cRXP_ENEMY_暮光信徒|r 和 |cRXP_ENEMY_暮光暴徒|r，拾取 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r]
    >>|cRXP_WARN_使用 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r] 开始任务|r
    .collect 5352,1,968,1 --Book: The Powers Below (1)
    .use 5352
    .accept 968 >> 接任务：深渊之神
    .mob 暮光信徒
    .mob 暮光暴徒
step
    #completewith next
    .goto 1439/1,410.09,4519.49
    >>将 |T134715:0|t[占卜之水] 放到地上
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    >>点击地上的 |cRXP_PICK_占卜之水|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接任务：暮光之锤的营地
    .use 5251
step
    .goto 1439/1,410.09,4519.49
    >>与 |cRXP_FRIENDLY_瑟瑞露尼|r 交谈
    >>|cRXP_WARN_如果 |cRXP_FRIENDLY_瑟瑞露尼|r 不在这里，就用AoE击杀 |cRXP_ENEMY_暮光信徒|r 和 |cRXP_ENEMY_暮光暴徒|r，拾取 |T133743:0|t[|cRXP_LOOT_《深渊之神》|r]，直到她出现|r
    .accept 945 >> 接任务：护送瑟瑞露尼
    .target 瑟瑞露尼
step
    #completewith Tome2
    >>护送 |cRXP_FRIENDLY_瑟瑞露尼|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .target 瑟瑞露尼
step
    .goto 1439/1,416.64,4576.69
    >>将 |T134715:0|t[占卜之水] 放到地上
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    >>点击地上的 |cRXP_PICK_占卜之水|r
    .turnin 944 >> 交任务：主宰之剑
    .accept 949 >> 接任务：暮光之锤的营地
    .use 5251
step
    #label Tome2
    .goto 1439/1,416.64,4576.69
    >>点击 |cRXP_PICK_暮光之书|r
    .turnin 949 >> 交任务：暮光之锤的营地
    .accept 950 >> 接任务：向安努回复
    .use 13536
step
    #label Therylune2
    >>护送 |cRXP_FRIENDLY_瑟瑞露尼|r
    >>|cRXP_WARN_确保 |cRXP_FRIENDLY_瑟瑞露尼|r 一直在你的可视范围内，否则任务会失败|r
    .complete 945,1 --Escort Therylune away from the Master's Glaive (1)
    .use 13536
    .target 瑟瑞露尼
step
    #completewith Onu3
    >>用AoE击杀 |cRXP_ENEMY_月夜雄虎|r，拾取 |cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r 与 |cRXP_ENEMY_灰斑蓟熊|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
step
    #completewith Onu3
    #label Scalps2
    >>用AoE击杀 |cRXP_ENEMY_灰斑蓟熊|r，拾取 |cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r 与 |cRXP_ENEMY_月夜雄虎|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
step
    #requires Scalps2
    #completewith next
    .goto 1439/1,229.97,4815.55,-1
    >>点击 |cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务：传声盒525号
step
    #label Onu3
    .goto 1439/1,89.14,5002.00,-1
    >>与 |cRXP_FRIENDLY_安努|r 交谈
    .turnin 950 >> 交任务：向安努回复
    .target 安努
step
    .goto 1439/1,33.47,4996.33
    >>与 |cRXP_FRIENDLY_克罗尼亚|r 交谈
    >>|cRXP_WARN_如果 |cRXP_FRIENDLY_克罗尼亚|r 不在这里，就跳过此步|r
    .accept 5321 >>接任务：昏昏欲睡
    .target 克罗尼亚·恒影
step
    .goto 1439/1,34.12,5001.570
    >>打开 |cRXP_PICK_克罗尼亚的箱子|r，拾取 |cRXP_LOOT_唤醒号角|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .complete 5321,1 --Horn of Awakening (1)
    .isOnQuest 5321
step
    #completewith 525
    >>用AoE击杀 |cRXP_ENEMY_月夜雄虎|r，拾取 |cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r 与 |cRXP_ENEMY_灰斑蓟熊|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .mob 月夜雄虎
step
    .goto 1439/1,63.60,4833.89,60,0
    .goto 1439/1,119.27,4764.89,60,0
    .goto 1439/1,217.52,4686.29,60,0
    .goto 1439/1,311.84,4708.13,60,0
    .goto 1439/1,406.82,4733.45,60,0
    .goto 1439/1,444.15,4850.92,60,0
    .goto 1439/1,287.61,4815.11,60,0
    .goto 1439/1,63.60,4833.89,60,0
    .goto 1439/1,119.27,4764.89,60,0
    .goto 1439/1,217.52,4686.29,60,0
    .goto 1439/1,311.84,4708.13,60,0
    .goto 1439/1,406.82,4733.45,60,0
    .goto 1439/1,444.15,4850.92,60,0
    .goto 1439/1,287.61,4815.11
    >>用AoE击杀 |cRXP_ENEMY_灰斑蓟熊|r，拾取 |cRXP_LOOT_灰色头皮|r
    >>|cRXP_ENEMY_灰斑蓟熊|r 与 |cRXP_ENEMY_月夜雄虎|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 1003,1 --Grizzled Scalp (4)
    .mob 灰斑蓟熊
    .use 13536
step
    #label 525
    .goto 1439/1,229.97,4815.55
    >>点击 |cRXP_PICK_传声盒525号|r
    .turnin 1003 >> 交任务：传声盒525号
    .use 13536
step
    .goto 1439/1,249.62,4657.91,70,0
    .goto 1439/1,296.78,4381.94,70,0
    .goto 1439/1,545.68,4379.32,70,0
    .goto 1439/1,537.82,4202.47,70,0
    .goto 1439/1,140.89,4372.770,70,0
    .goto 1439/1,205.73,4495.91,70,0
    .goto 1439/1,22.33,4271.02,70,0
    .goto 1439/1,249.62,4657.91,70,0
    .goto 1439/1,296.78,4381.94,70,0
    .goto 1439/1,545.68,4379.32,70,0
    .goto 1439/1,537.82,4202.47,70,0
    .goto 1439/1,140.89,4372.770,70,0
    .goto 1439/1,205.73,4495.91,70,0
    .goto 1439/1,22.33,4271.02
    >>用AoE击杀 |cRXP_ENEMY_月夜雌虎|r 和 |cRXP_ENEMY_月夜雄虎|r，拾取 |cRXP_LOOT_优质月夜猛虎毛皮|r
    >>|cRXP_ENEMY_月夜雄虎|r 与 |cRXP_ENEMY_灰斑蓟熊|r 和 |cRXP_ENEMY_凶猛的森林陆行鸟|r 共享刷新点
    .complete 986,1 --Fine Moonstalker Pelt (5)
    .unitscan 月夜雄虎
    .unitscan 月夜雌虎
    .use 13536
step
    #completewith Sleeper
    .xp 19+4635 >> 刷怪至19级 4635+/21300 经验值
    .isOnQuest 5321
step
    #completewith Delgren
    >>用AoE击杀 |cRXP_ENEMY_幽爪奔跑者|r，拾取 |cRXP_LOOT_狼肋排|r
    .collect 1015,10,90,1 --Lean Wolf Flank (10)
    .mob 幽爪奔跑者
step
    #label Sleeper
    .goto 1440/1,128.01,3305.31
    >>与 |cRXP_FRIENDLY_利拉迪斯|r 交谈
    .turnin 5321,1 >>交任务：昏昏欲睡
    .target 利拉迪斯·月河
    .use 13536
    .isOnQuest 5321
step
    #label Delgren
    .goto 1440/1,189.71,3185.390
    >>与 |cRXP_FRIENDLY_德尔格伦|r 交谈
    .turnin 967 >>交任务：奥萨拉克斯之塔
    .target 净化者德尔格伦
step
    .goto 1440/1,394.43,2677.63
    >>与 |cRXP_FRIENDLY_瑟瑞希尔|r 交谈
    .turnin 945 >>交任务：护送瑟瑞露尼
    .target 瑟瑞希尔
step
    .goto 1440/1,-284.31,2828.30
    .xp 19+8720 >> 刷怪至19级 8720+/21300 经验值
step << skip
    #completewith next
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级2）] |cRXP_WARN_，在乘坐飞行坐骑之前尽量多制造饮用水|r
step
    #completewith next
    .goto 1440/1,-284.31,2828.30
    >>与 |cRXP_FRIENDLY_黛琳希亚|r 交谈
    .fly Auberdine >> 飞往奥伯丁
    .target 黛琳希亚
step
    >>与 |cRXP_FRIENDLY_温尼斯|r 和 |cRXP_FRIENDLY_古博|r 交谈
    .turnin 4728 >>交任务：搁浅的海洋生物
    .turnin 4730 >>交任务：搁浅的海洋生物
    .turnin 4731 >>交任务：搁浅的海龟
    .turnin 4732 >>交任务：搁浅的海龟
    .turnin 4733 >>交任务：搁浅的海洋生物
    .target +温尼斯·布莱葛
    .goto 1439/1,543.06,6342.130
    .turnin 1138,2 >>交任务：海中的水果
    .goto 1439/1,577.77,6371.39
    .target +古博·布拉普
step
    .goto 1439/1,470.35,6439.07
    >>与 |cRXP_FRIENDLY_戈琳达|r 交谈
    .turnin 4740 >>交任务：通缉：莫克迪普！
    .target 哨兵戈琳达·纳希恩
step
    >>与 |cRXP_FRIENDLY_特伦希斯|r 和 |cRXP_FRIENDLY_戈沙拉|r 交谈
    .turnin 986 >>交任务：丢失的主人
    --.accept 993 >>Accept A Lost Master
    .target +特伦希斯
    .goto 1439/1,362.93,6434.71
    .turnin 3765 >> 交任务：遥远的旅途
    .goto 1439/1,431.71,6453.92
    .target +戈沙拉·夜语
step
    .goto 1439/1,445.46,6536.01
    >>与 |cRXP_FRIENDLY_高尔博德|r 交谈
    >>|cRXP_BUY_向他购买20份|r |T134059:0|t[甜香料] |cRXP_BUY_|r
    .collect 2678,20,90,1 --Mild Spices (20)
    .target 高尔博德·钢手
    .itemcount 6889,20
    .skill cooking,50,1
step
    .goto 1439/1,445.46,6536.01
    >>与 |cRXP_FRIENDLY_高尔博德|r 交谈
    >>|cRXP_BUY_向他购买15份|r |T134059:0|t[甜香料] |cRXP_BUY_|r
    .collect 2678,15,90,1 --Mild Spices (15)
    .target 高尔博德·钢手
    .itemcount 6889,15
    .skill cooking,50,1
step
    .goto 1439/1,445.46,6536.01
    >>与 |cRXP_FRIENDLY_高尔博德|r 交谈
    >>|cRXP_BUY_向他购买10份|r |T134059:0|t[甜香料] |cRXP_BUY_|r
    .collect 2678,10,90,1 --Mild Spices (10)
    .target 高尔博德·钢手
    .itemcount 6889,10
    .skill cooking,50,1
step
    .goto 1439/1,445.46,6536.01
    >>与 |cRXP_FRIENDLY_高尔博德|r 交谈
    >>|cRXP_BUY_向他购买5份|r |T134059:0|t[甜香料] |cRXP_BUY_|r
    .collect 2678,5,90,1 --Mild Spices (5)
    .target 高尔博德·钢手
    .itemcount 6889,5
    .skill cooking,50,1
step
    .goto 1439/1,488.69,6564.830
    >>与 |cRXP_FRIENDLY_达蒙德|r 交谈
    >>|cRXP_BUY_向他购买|r |T135435:0|t[普通木柴] |cRXP_BUY_和|r |T135237:0|t[燧石和火绒] |cRXP_BUY_|r
    .collect 4470,1,90,1 --Simple Wood (1)
    .collect 4471,1,90,1 --Flint and Tinder (1)
    .target 达蒙德
    .skill cooking,50,1
step
    .goto 1439/1,489.35,6506.32
    >>与 |cRXP_FRIENDLY_霍莉|r 交谈
    .turnin 731 >> 交任务：健忘的勘察员
    .accept 741 >> 接任务：健忘的勘察员
    .target 考古学家霍莉
step
    #completewith Teldrassil
    #label BoatT
    .goto 1439/1,487.38,6479.68,20,0
    .goto 1439/1,489.35,6454.36,20,0
    .goto 1439/1,527.99,6409.82,20,0
    .goto 1439/1,782.79,6504.57,20,0
    .goto 1439/1,765.10,6590.60,50 >>前往开往达纳苏斯的船只
step
    #completewith Teldrassil
    #requires BoatT
    .cast 818 >> 在船上施放|T135805:0|t[基础营火]（如果船还没到，就在码头施放）
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .skill cooking,50,1
step
    #completewith Teldrassil
    #requires BoatT
    #label BoarM
    +将所有 |T133970:0|t|cRXP_LOOT_[大块野猪肉]|r 烹饪成 |T133974:0|t[烤野猪肉]
    .itemcount 769,1
    .skill cooking,50,1
step
    #completewith next
    #requires BoarM
    +|cRXP_WARN_开始连续施放|r |T132794:0|t[造水术（等级2）] |cRXP_WARN_，尽量多制造饮用水|r
step
    #label Teldrassil
    .goto 1438/1,1018.75,8564.77,100 >> 乘船前往泰达希尔
step
    #completewith next
    .goto 1438/1,987.69,8651.99,60,0
    .goto 1438/1,922.52,8678.46,40,0
    .goto 1438/1,888.40,8676.08,20,0
    .goto 1438/1,841.05,8641.121,20 >>前往 |cRXP_FRIENDLY_维斯派塔斯|r 处
step
    .goto 1438/1,841.05,8641.121
    >>与 |cRXP_FRIENDLY_维斯派塔斯|r 交谈
    .fp Rut'theran >> 获取鲁瑟兰村飞行点
    .target 维斯派塔斯
step
    #completewith next
    .goto 1438,55.885,89.350
    .zone Darnassus >> 通过紫色传送门进入达纳苏斯
step
    #completewith next
    .goto 1457/1,2536.83,9898.58,30,0
    .goto 1457/1,2534.08,9772.82,30,0
    .goto 1457/1,2549.00,9727.09,30,0
    .goto 1457/1,2607.74,9642.04,20 >>前往 |cRXP_FRIENDLY_杜瑟·灰须|r 处
step
    .goto 1457/1,2607.74,9642.04
    >>与 |cRXP_FRIENDLY_杜瑟·灰须|r 交谈
    .turnin 741,3 >>交任务：健忘的勘察员
    .accept 942 >>接任务：健忘的勘察员
    .target 首席考古学家杜瑟·灰须
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 联盟法师进阶 AoE
#forever
#disabledungeons
<< Alliance Mage
#name 20-22 ADV Redridge 1 Mage AoE
#version 2
#group RestedXP ADV AoE Alliance Mage
#defaultfor none Mage
#next 22-26 ADV Wetlands 1 Mage AoE
#displayname 20-22 赤脊山 1（法师进阶 AoE）
step
    #completewith next
    .hs >> 炉石返回暴风城
    .zoneskip Stormwind City
step
    .goto 1453/0,635.44,-8863.81
    >>隔墙与 |cRXP_FRIENDLY_凯德雷克|r 交谈
    .vendor 1257 >> 卖掉杂物。|cRXP_BUY_购买|r|T134830:0|t[次级治疗药水]|cRXP_BUY_（如果他有货）|r
    .target 凯德雷克·布舍尔
step
    #completewith Bank
    .goto 1453/0,637.59,-8889.81,10 >>进入暴风城银行
step
    #sticky
    #label Bank1
    .goto 1453/0,614.33,-8932.92
    >>与 |cRXP_FRIENDLY_牛顿|r 交谈
    .bankwithdraw 4371,1941,1711,1478,1712,3012,1180,1181,3013,2998 >> 从银行取出以下物品：
    >>|T133024:0|t[青铜管]
    >>|T134943:0|t[卷轴]
    >>|T132620:0|t[一桶葡萄酒]
    >>|T134377:0|t[简易罗盘]
    .target 牛顿·伯恩赛德
step
    #label Bank
    .goto 1453/0,614.33,-8932.92
    >>与 |cRXP_FRIENDLY_牛顿|r 交谈
    >>|cRXP_WARN_注意：后续交布任务需要每种布料各12组（|r|T132911:0|t[毛料]|cRXP_WARN_、|r |T132905:0|t[丝绸]|cRXP_WARN_、|r |T132892:0|t[魔纹布]|cRXP_WARN_和|r |T132903:0|t[符文布]|cRXP_WARN_）。升级途中会自然获得这些布料|r
    .bankdeposit 17056,2592,1015,4654 >> 将以下物品存入银行：
    >>|T132917:0|t[轻羽毛]
    >>|T132911:0|t[毛料]
    >>|T133970:0|t[狼肋排]
    >>|T134431:0|t[神秘的化石]
    .target 牛顿·伯恩赛德
step
    #completewith next
    #requires Bank1
    .goto 1453/0,679.80,-8829.57,12,0
    .goto 1453/0,716.77,-8847.23,12,0
    .goto 1453/0,693.24,-8891.33,12 >>前往 |cRXP_FRIENDLY_罗伯特|r 处
step
    #requires Bank1
    .goto 1453/0,681.28,-8888.01
    >>进入建筑
    >>与 |cRXP_FRIENDLY_罗伯特|r 交谈
    >>|cRXP_BUY_向他购买|r |T132620:0|t[一桶葡萄酒] |cRXP_BUY_|r
    .collect 1941,1,116,1 --Cask of Merlot
    .target 罗伯特·奥布斯
step
    #completewith next
    #requires Bank1
    .goto 1453/0,686.25,-8815.41,8,0
    .goto 1453/0,684.24,-8820.34,4,0
    .goto 1453/0,687.46,-8818.01,6,0
    .goto 1453/0,854.42,-8965.28,12,0
    >>|cRXP_WARN_跳上火把，再向下跳到暴风城地下|r
    >>|cRXP_WARN_将阴影设为“普通”或“低”，在蓝色虚空前找到恐龙Derek双脚之间的位置（泥土颜色较浅的部分），然后径直向前走|r
    >>|cRXP_WARN_注意：此方法有小概率导致死亡。你也可以沿正常路线步行前往法师塔|r
    .link https://youtu.be/gV8-wgQEomc >> 点击这里查看指南
    .goto 1453/0,861.95,-8990.47,10 >>前往 |cRXP_FRIENDLY_拉瑞麦尼|r 处
step
    #requires Bank1
    .goto 1453/0,847.43,-8991.99
    >>与 |cRXP_FRIENDLY_拉瑞麦尼|r 交谈
    .train 3561 >> 学习 |T135763:0|t[传送：暴风城]
    >>总花费：20银
    .target 拉瑞麦尼·普尔度
step
    .goto 1453/0,861.95,-8990.47
    >>与 |cRXP_FRIENDLY_詹妮亚|r 交谈
    .trainer >> 学习职业技能（闪现术、唤醒、霜甲术等级3、法力护盾、造水术等级3）
    >>|cRXP_WARN_暂时不要学习暴风雪|r
    >>总花费：1金
    .target 詹妮亚·坎农
step
    #completewith Charys
    .goto 1453/0,887.22,-9017.80,10,0
    .goto 1453/0,871.36,-9013.14,10,0
    .goto 1453/0,868.8,-9004.27,8,0
    .goto 1453/0,877.00,-9008.03,6,0
    .goto 1453/0,863.96,-9001.40,8,0
    .goto 1453/0,928.62,-9010.10,15,0
    .goto 1453/0,962.63,-8990.73,15,0
    .goto 1453/0,949.86,-9009.380,10,0
    .goto 1453/0,942.34,-9001.49,8,0
    >>离开法师塔
    .goto 1453/0,948.65,-8994.50,10 >>前往 |cRXP_FRIENDLY_查瑞斯|r 处
step
    .goto 1453/0,948.65,-8994.50
    >>进入建筑
    >>与 |cRXP_FRIENDLY_查瑞斯|r 交谈
    >>|cRXP_BUY_向她购买2枚|r |T134419:0|t[传送符文]|cRXP_BUY_、|r |T134851:0|t[次级法力药水]|cRXP_BUY_、|r |T134831:0|t[治疗药水]|cRXP_BUY_和一条|r |T132515:0|t[布甲腰带] |cRXP_BUY_（有货时）|r
    >>|cRXP_WARN_花费后余额不要低于18银31铜。|r
    .collect 17031,2,344,1 --Rune of Teleportation (2)
    .target 查瑞斯·伊瑟里安
    .itemcount 4371,1
step
    #label Charys
    .goto 1453/0,948.65,-8994.50
    >>进入建筑
    >>与 |cRXP_FRIENDLY_查瑞斯|r 交谈
    >>|cRXP_BUY_购买两个|r|T134419:0|t[传送符文]|cRXP_BUY_、|r|T134851:0|t[次级法力药水]|cRXP_BUY_、|r|T134831:0|t[治疗药水]|cRXP_BUY_和一条|r|T132515:0|t[布甲腰带]|cRXP_BUY_（如果她有货）|r
    >>|cRXP_WARN_花费后余额不要低于26银31铜。|r
    .collect 17031,2,344,1 --Rune of Teleportation (2)
    .target 查瑞斯·伊瑟里安
    .itemcount 4371,<1
step
    #completewith Adair
    .goto 1453/0,852.40,-8920.10,20,0
    .goto 1453/0,829.01,-8901.28,20,0
    .goto 1453/0,789.22,-8904.59,20,0
    .goto 1453/0,758.31,-8878.78,20,0
    .goto 1453/0,810.33,-8832.44,20,0
    .goto 1453/0,827.54,-8850.19,15,0
    .goto 1453/0,822.16,-8865.60,10 >>前往 |cRXP_FRIENDLY_艾代尔|r 处
step
    .goto 1453/0,822.16,-8865.60
    >>进入建筑
    >>与 |cRXP_FRIENDLY_艾代尔|r 交谈
    .vendor 1316 >> |cRXP_BUY_向他购买增加智力以外属性的|r |T134943:0|t[卷轴] |cRXP_BUY_（有货时）|r
    >>|cRXP_WARN_花费后余额不要低于18银31铜。|r
    .money <0.1831
    .target 艾代尔·吉尔罗
    .itemcount 4371,1
step
    #label Adair
    .goto 1453/0,822.16,-8865.60
    >>进入建筑
    >>与 |cRXP_FRIENDLY_艾代尔|r 交谈
    .vendor 1316 >> |cRXP_BUY_向他购买增加智力以外属性的|r |T134943:0|t[卷轴] |cRXP_BUY_（有货时）|r
    >>|cRXP_WARN_花费后余额不要低于26银31铜。|r
    .money <0.2631
    .target 艾代尔·吉尔罗
    .itemcount 4371,<1
step
    #completewith next
    .goto 1453/0,872.30,-8803.220,5,0
    .goto 1453/0,872.70,-8682.39,20 >>沿墙边向上跑，无需绕行
step
    .goto 1453/0,766.64,-8623.23
    >>与 |cRXP_FRIENDLY_克里斯托弗|r 交谈
    .accept 343 >> 接任务：关于坚韧的演讲
    .target 克里斯托弗修士
step
    #completewith next
    .goto 1453/0,737.74,-8571.69,15,0
    .goto 1453/0,736.26,-8558.06,12,0
    .goto 1453/0,719.86,-8550.36,12 >>前往 |cRXP_FRIENDLY_巴隆斯|r 处
step
    .goto 1453/0,719.86,-8550.36
    >>进入建筑
    >>与 |cRXP_FRIENDLY_巴隆斯|r 交谈
    .turnin 399 >> 交任务：童年的记忆
    .target 巴隆斯·阿历克斯顿
step
    .goto 1453/0,638.26,-8342.22
    >>与 |cRXP_FRIENDLY_比利巴布|r 交谈
    .vendor 5519 >>|cRXP_BUY_向他购买|r |T133024:0|t[青铜管] |cRXP_BUY_（有货时）|r
    .target 比利巴布·旋轮
    .itemcount 4371,<1
step
    #completewith next
    .goto 1453/0,453.16,-8533.33,30,0
    .goto 1453/0,405.03,-8486.89,20,0
    .goto 1453/0,442.94,-8427.47,20,0
    .goto 1453/0,435.41,-8381.66,20,0
    .goto 1453/0,383.66,-8345.63,12 >>前往 |cRXP_FRIENDLY_米尔顿|r 处
step
    .goto 1453/0,383.66,-8345.63
    >>与 |cRXP_FRIENDLY_米尔顿|r 交谈
    .turnin 343 >> 交任务：关于坚韧的演讲
    .accept 344 >> 接任务：帕克斯顿修士
    .target 米尔顿·西弗
step
    #completewith next
    .goto 1453/0,435.41,-8381.66,20,0
    .goto 1453/0,442.94,-8427.47,20,0
    .goto 1453/0,405.03,-8486.89,20,0
    .goto 1453/0,450.74,-8539.51,30,0
    .goto 1453/0,551.02,-8658.37,20,0
    .goto 1453/0,509.88,-8819.71,12,0
    .goto 1453/0,518.35,-8822.040,12 >>前往 |cRXP_FRIENDLY_菲利希亚|r 处
step
    .goto 1453/0,518.35,-8822.040
    >>与 |cRXP_FRIENDLY_菲利希亚|r 交谈
    >>|cRXP_BUY_购买|r |T133849:0|t[暴风城特产调料]|cRXP_BUY_（向她购买）|r
    .collect 2665,1,90,1 --Stormwind Seasoning Herbs
    .target 菲利希亚·加姆
step
    #completewith next
    .goto 1453/0,508.41,-8803.04,30,0
    .goto 1453/0,575.62,-8741.370,30,0
    .goto 1453/0,603.58,-8771.67,30,0
    .goto 1453/0,530.45,-8847.41,20,0
    .goto 1453/0,532.33,-8863.54,20,0
    .goto 1453/0,494.56,-8865.78,12,0
    .goto 1453/0,495.77,-8870.44,8,0
    .goto 1453/0,504.24,-8956.31,40 >>向下跳到 |cRXP_FRIENDLY_杜加尔|r 下方的平台
step
    #completewith next
    .goto 1429/0,44.35,-9458.41,30 >>前往闪金镇旅店
step << skip
    #completewith next
    .goto 1429/0,398.72,-9085.76,50,0
    .goto 1429/0,125.22,-9079.98,20,0
    .goto 1429/0,-139.95,-8910.09,50,0
    .goto 1429/0,-158.00,-8901.52,10,0
    .goto 1429/0,-174.32,-8881.39,10,0
    >>沿山路前往|cRXP_FRIENDLY_帕克斯顿修士|r处。
    .goto 1429/0,-186.46,-8874.91,10 >>前往 |cRXP_FRIENDLY_帕克斯顿|r 处
step
    .goto 1429/0,8.25,-9460.03
    >>与 |cRXP_FRIENDLY_杜宾斯|r 交谈
    >>|cRXP_BUY_向他购买|r |T132794:0|t[一袋蜂蜜酒] |cRXP_BUY_|r
    .collect 1939,1,116,1 --Skin of Sweet Rum
    .target 酒吧老板杜宾斯
step
    #sticky
    #label FarleyHome
    .goto 1429/0,16.23,-9462.580,0,0
    >>与 |cRXP_FRIENDLY_法雷|r 交谈
    .home >> 将炉石设在闪金镇
    .target 旅店老板法雷
step
    #completewith next
    #requires FarleyHome
    .goto 1429/0,-158.00,-8901.52,10,0
    .goto 1429/0,-174.32,-8881.39,10,0
    .goto 1429/0,-186.46,-8874.91,10 >>前往 |cRXP_FRIENDLY_帕克斯顿|r 处
step
    #requires FarleyHome
    .goto 1429/0,-186.46,-8874.91
    >>与 |cRXP_FRIENDLY_帕克斯顿|r 交谈
    .turnin 344 >> 交任务：帕克斯顿修士
    .accept 345 >> 接任务：墨水短缺
    .target 帕克斯顿修士
step
    #completewith Theo
    .goto 1429/0,-174.32,-8881.39,10,0
    .goto 1429/0,-158.00,-8901.52,10,0
    .goto 1429/0,-140.30,-8916.57,10,0
    .goto 1429/0,-464.48,-9142.47,30,0
    .goto 1429/0,-701.54,-9538.960,15 >>沿山路前往阿祖拉之塔
step
    #sticky
    #label Dawn
    .goto 1429/0,-716.46,-9541.04,0,0
    >>与楼上的 |cRXP_FRIENDLY_当恩|r 交谈
    .vendor 958 >> |cRXP_BUY_购买智力以外的|r|T134943:0|t[卷轴]|cRXP_BUY_、|r|T134850:0|t[初级法力药水]|cRXP_BUY_和|r|T134830:0|t[次级治疗药水]|cRXP_BUY_（如果她有货）|r
    >>|cRXP_WARN_花费后余额不要低于11银38铜|r
    .money <0.1138
    .target 当恩·布赖特斯塔
    .itemcount 4371,1
step
    #sticky
    #label Dawn2
    .goto 1429/0,-716.46,-9541.04,0,0
    >>与楼上的 |cRXP_FRIENDLY_当恩|r 交谈
    .vendor 958 >> |cRXP_BUY_购买智力以外的|r|T134943:0|t[卷轴]|cRXP_BUY_、|r|T134850:0|t[初级法力药水]|cRXP_BUY_和|r|T134830:0|t[次级治疗药水]|cRXP_BUY_（如果她有货）|r
    >>|cRXP_WARN_花费后余额不要低于19银38铜|r
    .money <0.1938
    .target 当恩·布赖特斯塔
    .itemcount 4371,<1
step
    #label Theo
    .goto 1429/0,-728.26,-9553.08
    >>上楼
    >>与 |cRXP_FRIENDLY_塞欧克瑞图斯|r 交谈
    .accept 94 >> 接任务：法师的眼线
    .target 塞欧克瑞图斯
step
    #requires Dawn
step
    #completewith next
    #requires Dawn2
    .goto 1431/0,-1159.00,-10544.31,20,0
    .goto 1431/0,-1164.94,-10533.15,10 >>进入旅店
step
    #requires Dawn2
    .goto 1431/0,-1159.54,-10509.03
    >>与|cRXP_FRIENDLY_酒吧老板汉恩|r交谈。
    >>|cRXP_BUY_购买|r |T132798:0|t[一瓶月光酒]|cRXP_BUY_（向他购买）|r
    .collect 1942,1,116,1 --Bottle of Moonshine (1)
    .target 酒吧老板汉恩
step
    #completewith Viktori
    .goto 1431/0,-1164.94,-10533.15,10,0
    .goto 1431/0,-1159.00,-10544.31,10 >>离开旅店
step
    #completewith next
    .goto 1431/0,-1197.61,-10585.35,12 >>进入建筑
step
    .goto 1431/0,-1200.85,-10593.99
    >>与 |cRXP_FRIENDLY_艾莱尼|r 交谈
    .accept 163 >>接任务：乌鸦岭
    .accept 164 >>接任务：斯温的货物
    .accept 165 >>接任务：隐士
    .target 艾莱尼·卡尔文
step
    .goto 1431/0,-1272.67,-10586.073
    >>与|cRXP_FRIENDLY_赫尔伯|r交谈。
    .vendor 3133 >>|cRXP_BUY_向他购买|r |T133024:0|t[青铜管] |cRXP_BUY_（有货时）|r
    .target 赫尔伯
    .itemcount 4371,<1
step
    .goto 1431/0,-1320.73,-10581.75
    >>与 |cRXP_FRIENDLY_维克托|r 交谈
    .accept 174 >> 接任务：仰望星空
    .turnin 174 >> 交任务：仰望星空
    .accept 175 >> 接任务：仰望星空
    .target 维克托·安特拉斯
    .itemcount 4371,1
step
    #label Viktori
    .goto 1431/0,-1320.73,-10581.75
    >>与 |cRXP_FRIENDLY_维克托|r 交谈
    .accept 175 >> 接任务：仰望星空
    .target 维克托·安特拉斯
    .isQuestTurnedIn 174
step
    .goto 1431/0,-1366.09,-10779.03
    >>与 |cRXP_FRIENDLY_玛丽|r 交谈
    .turnin 175 >> 交任务：仰望星空
    .accept 177 >> 接任务：仰望星空
    .target 盲眼玛丽
    .isQuestTurnedIn 174
step
    .goto 1431/0,-1258.63,-10513.89
    >>与 |cRXP_FRIENDLY_菲利希亚|r 交谈
    .fp Duskwood >> 获取暮色森林飞行点
    .target 菲利希亚·玛林
step
    #completewith Kzixx
    .goto 1431/0,-1236.49,-10139.49,60,0
    .goto 1431/0,-1375.81,-10072.35,20 >>前往|cRXP_FRIENDLY_卡兹克斯|r处。
step
    .goto 1431/0,-1375.81,-10072.35
    >>与|cRXP_FRIENDLY_卡兹克斯|r交谈。
    .vendor 3134 >>|cRXP_BUY_向他购买|r |T134851:0|t[次级法力药水] |cRXP_BUY_和|r  |T134831:0|t[治疗药水] |cRXP_BUY_（有货时）|r
    .itemcount 4827,1
    .target 卡兹克斯
step
    .goto 1431/0,-1375.81,-10072.35
    >>与|cRXP_FRIENDLY_卡兹克斯|r交谈。
    .vendor 3134 >>|cRXP_BUY_向他购买|r |T134851:0|t[次级法力药水] |cRXP_BUY_和|r  |T134831:0|t[治疗药水] |cRXP_BUY_（有货时）|r
    .itemcount 4828,1
    .target 卡兹克斯
step
    .goto 1431/0,-1375.81,-10072.35
    >>与|cRXP_FRIENDLY_卡兹克斯|r交谈。
    .vendor 3134 >>|cRXP_BUY_向他购买|r |T134851:0|t[次级法力药水] |cRXP_BUY_和|r  |T134831:0|t[治疗药水] |cRXP_BUY_（有货时）|r
    .itemcount 4829,1
    .target 卡兹克斯
step
    #label Kzixx
    .goto 1431/0,-1375.81,-10072.35
    >>与|cRXP_FRIENDLY_卡兹克斯|r交谈。
    .vendor 3134 >>|cRXP_BUY_向他购买|r |T134851:0|t[次级法力药水]|cRXP_BUY_、|r |T134831:0|t[治疗药水]|cRXP_BUY_和一条|r |T132515:0|t[布甲腰带] |cRXP_BUY_（有货且需要时）|r
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
    >>用AoE击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
    .mob +狼蛛
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob +巨型血牙野猪
    .skill cooking,<50,1
step
    .goto 1433/0,-1907.75,-9625.90,60,0
    .goto 1433/0,-1893.64,-9592.880,60,0
    .goto 1433/0,-1938.36,-9591.440
    >>与|cRXP_FRIENDLY_卫兵帕克|r交谈。
    .accept 244 >>接任务：豺狼人的入侵
    .target 卫兵帕克
step << skip
    #label AoE1
    .goto 1433/0,-1912.31,-9479.51,60 >>用 AoE 技能击杀|cRXP_ENEMY_混血赤脊山豺狼人|r和|cRXP_ENEMY_赤脊山鞭笞者|r。
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
    >>用AoE击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob 巨型血牙野猪
    .skill cooking,50
step
    #label Gnolls
    .goto 1433/0,-2238.15,-9443.60
    >>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈。
    .turnin 244 >>交任务：豺狼人的入侵
    .accept 246 >>接任务：审时度势
    .target 菲尔顿副队长
step
    .goto 1433/0,-2234.89,-9435.060
    >>与 |cRXP_FRIENDLY_艾蕾娜|r 交谈
    .fp Redridge Mountains >> 获取赤脊山飞行点
step
    >>与|cRXP_FRIENDLY_治安官马瑞斯|r和|cRXP_FRIENDLY_工头奥斯洛|r交谈。
    .accept 20 >>接任务：黑石氏族的威胁
    .target +治安官马瑞斯
    .goto 1433/0,-2298.28,-9283.90
    .accept 125 >>接任务：丢失的工具
    .turnin 345 >>交任务：墨水短缺
    .accept 347 >>接任务：瑞斯班矿石
    .goto 1433/0,-2268.54,-9279.27
    .target +工头奥斯洛
step
    .goto 1433/0,-2219.70,-9260.73
    >>与|cRXP_FRIENDLY_卡伦|r交谈。
    >>|cRXP_BUY_向她购买|r |T134708:0|t[矿工锄] |cRXP_BUY_|r
    >>|cRXP_WARN_之后会用到它|r
    .collect 2901,1,125,1 --Mining Pick (1)
    .target 卡伦·泰勒
step
    >>与|cRXP_FRIENDLY_拜里弗·科纳彻尔|r交谈。
--  .accept 120 >>Accept Messenger to Stormwind
--  .goto 1433/0,-2221.87,-9218.60
    .accept 91 >>接任务：所罗门的律法
    .goto 1433/0,-2216.00,-9215.85
--  .target Magistrate Solomon
    .target 拜里弗·科纳彻尔
step
    >>与|cRXP_FRIENDLY_码头管理员巴伦|r交谈，并查看|cRXP_PICK_[通缉告示]|r。
    .accept 127 >>接任务：卖鱼
    .goto 1433/0,-2172.59,-9261.02
    .accept 180 >>接任务：通缉：范高雷中尉
    .goto 1433/0,-2151.53,-9247.12
    .target 码头管理员巴伦
step
    #sticky
    #label Darcy1
    .goto 1433/0,-2155.22,-9225.84,0,0
    >>进入旅店
    >>与 |cRXP_FRIENDLY_达希|r 交谈
    .accept 129 >>接任务：免费的午餐
    .target 达希
step
    .goto 1433/0,-2145.89,-9211.36
    >>在旅店内
    >>与|cRXP_FRIENDLY_酒吧老板丹尼尔|r交谈。
    .accept 116 >>接任务：旱季
    .turnin 116 >>交任务：旱季
    .target 酒吧老板丹尼尔
step
    .goto 1433/0,-2145.45,-9231.34
    >>在旅店内
    >>在楼下的扶手处起跳，与|cRXP_FRIENDLY_黑衣威利|r交谈。
    .turnin 65 >>交任务：迪菲亚兄弟会
--  .accept 132 >>Accept The Defias Brotherhood
    .target 黑衣威利
step
    .goto 1433/0,-2207.32,-9351.66
    >>与 |cRXP_FRIENDLY_肖恩|r 交谈
    .accept 3741 >>接任务：希拉里的项链
    .target 肖恩
step
    .goto 1433/0,-2250.09,-9360.78,90,0
    .goto 1433/0,-2174.32,-9386.56,90,0
    .goto 1433/0,-2147.41,-9308.08,90,0
    .goto 1433/0,-2090.96,-9373.82,90,0
    .goto 1433/0,-1986.76,-9324.30,90,0
    .goto 1433/0,-2246.40,-9359.92,90,0
    .goto 1433/0,-2309.57,-9376.28,90,0
    .goto 1433/0,-2397.70,-9363.97
    >>|cRXP_WARN_潜入水下检查各刷新点。共有8处位置，同时会在其中2处刷新|r
    >>打开 |cRXP_PICK_闪光的泥土|r，拾取 |cRXP_LOOT_希拉里的项链|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .complete 3741,1 --Hilary's Necklace (1)
step
    .goto 1433/0,-2205.58,-9351.52
    >>与 |cRXP_FRIENDLY_希拉里|r 交谈
    .turnin 3741 >>交任务：希拉里的项链
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
    >>用AoE击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob 巨型血牙野猪
    .skill cooking,<50,1
step
    #label Gnolls2
    .goto 1433/0,-1912.31,-9479.51
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
    >>用AoE击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
    .mob +狼蛛
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob +巨型血牙野猪
    .skill cooking,<50,1
step
    .goto 1433/0,-1907.75,-9625.90,60,0
    .goto 1433/0,-1893.64,-9592.880,60,0
    .goto 1433/0,-1938.36,-9591.440
    >>与|cRXP_FRIENDLY_卫兵帕克|r交谈。
    .turnin 129 >>交任务：免费的午餐
    .accept 130 >>接任务：寻访草药师
    .target 卫兵帕克
step
    #label Gnolls3
    .goto 1433/0,-2209.06,-9790.24,60,0
    .goto 1433/0,-2242.71,-9792.700,60,0
    .goto 1433/0,-2271.14,-9774.31,60,0
    .goto 1433/0,-2321.94,-9776.63,60,0
    .goto 1433/0,-2512.32,-9603.17,60,0
    .goto 1433/0,-2209.06,-9790.24,60,0
    .goto 1433/0,-2242.71,-9792.700,60,0
    .goto 1433/0,-2271.14,-9774.31,60,0
    .goto 1433/0,-2321.94,-9776.63,60,0
    .goto 1433/0,-2512.32,-9603.17
    >>用 AoE 技能击杀|cRXP_ENEMY_混血赤脊山豺狼人|r、|cRXP_ENEMY_赤脊山鞭笞者|r和|cRXP_ENEMY_赤脊山偷猎者|r。
    >>|cRXP_WARN_记得站在|r |cRXP_ENEMY_赤脊山偷猎者|r 的远程攻击盲区内
    .complete 246,1 --Redridge Mongrel (10)
    .mob +混血赤脊山豺狼人
    .complete 246,2 --Redridge Poacher (6)
    .mob +赤脊山偷猎者
step
    .goto 1433/0,-2238.15,-9443.60
    >>与|cRXP_FRIENDLY_菲尔顿副队长|r交谈。
    .turnin 246 >>交任务：审时度势
    .target 菲尔顿副队长
step
    .goto 1433/0,-2472.16,-9366.72,-1
    >>潜入水下
    >>打开 |cRXP_PICK_沉没的箱子|r，拾取 |cRXP_LOOT_奥斯洛的工具箱|r
    >>|cRXP_WARN_此操作的施法时间为5秒|r
    .complete 125,1 --Oslow's Toolbox (1)
step
    #completewith next
    .goto 1433/0,-2445.68,-9240.75,60,0
    >>使用 AoE 技能击杀|cRXP_ENEMY_鱼人食腐者|r和|cRXP_ENEMY_鱼人斥候|r，并拾取|cRXP_LOOT_斑点太阳鱼|r和|cRXP_LOOT_鱼人鳍|r。
    .complete 127,1 --Spotted Sunfish (10)
    .collect 1468,8,150,1 --Murloc Fin (8)
    .mob 鱼人食腐者
    .mob 鱼人斥候
step
    .goto 1433/0,-2268.54,-9279.12
    >>与|cRXP_FRIENDLY_工头奥斯洛|r交谈。
    .turnin 125 >>交任务：丢失的工具
    .accept 89 >>接任务：止水湖上的桥
    .target 工头奥斯洛
step
    .goto 1433/0,-2240.10,-9248.14
    >>与 |cRXP_FRIENDLY_多林|r 交谈
    .vendor >> 卖掉杂物
    .target 多林·桑布雷德
    .isOnQuest 89
step << skip
    #completewith next
    .goto 1433/0,-2205.58,-9232.350,10,0
    .goto 1433/0,-2197.99,-9224.68,8 >>进入镇公所
step
    .goto 1433/0,-2377.51,-9229.460,60,0
    .goto 1433/0,-2403.56,-9173.57,60,0
    .goto 1433/0,-2415.07,-9034.28,60,0
    .goto 1433/0,-2509.72,-9067.73,60,0
    .goto 1433/0,-2599.16,-9078.44,60,0
    .goto 1433/0,-2772.39,-9226.85,60,0
    .goto 1433/0,-2808.64,-9313.58,60,0
    .goto 1433/0,-2791.71,-9355.86,60,0
    .goto 1433/0,-2838.17,-9350.50,60,0
    .goto 1433/0,-2840.12,-9220.92,60,0
    .goto 1433/0,-2854.01,-9211.65,60,0
    .goto 1433/0,-2867.69,-9183.27,60,0
    .goto 1433/0,-2924.13,-9179.65,60,0
    .goto 1433/0,-2928.91,-9231.77,60,0
    >>使用 AoE 技能击杀|cRXP_ENEMY_黑石前锋|r、|cRXP_ENEMY_黑石叛节者|r和|cRXP_ENEMY_黑石步兵|r，并拾取|cRXP_LOOT_破斧|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_鱼人招潮者|r和|cRXP_ENEMY_鱼人斥候|r，并拾取|cRXP_LOOT_斑点太阳鱼|r和|cRXP_LOOT_鱼人鳍|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_恐鹫|r，并拾取|cRXP_LOOT_硬秃鹫肉|r。
    >>使用 AoE 技能击杀|cRXP_ENEMY_巨型狼蛛|r，并拾取|cRXP_LOOT_香脆蜘蛛肉|r。
    >>用AoE击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    >>用AoE击杀 |cRXP_ENEMY_赤脊山秘法师|r 和 |cRXP_ENEMY_赤脊山蛮兵|r，拾取 |cRXP_LOOT_铁矛|r 和 |cRXP_LOOT_铁铆钉|r
    >>|cRXP_WARN_小心，|cRXP_ENEMY_黑石前锋|r 会施放 |T132149:0|t[投网]|cRXP_WARN_，|cRXP_ENEMY_恐鹫|r 会施放 |T132154:0|t[击倒]
    .complete 20,1 --Blackrock Axe (10)
#loop
	.line Redridge Mountains,37.16,45.20,38.36,41.34,40.09,40.64,42.89,39.26,59.36,44.56,59.79,42.05,62.58,41.46,62.57,45.48,59.36,44.56
	.goto 1433/0,-2377.51,-9229.460,30,0
	.goto 1433/0,-2403.56,-9173.57,30,0
	.goto 1433/0,-2441.12,-9163.43,30,0
	.goto 1433/0,-2501.90,-9143.45,30,0
	.goto 1433/0,-2859.44,-9220.19,30,0
	.goto 1433/0,-2868.77,-9183.85,30,0
	.goto 1433/0,-2929.34,-9175.31,30,0
	.goto 1433/0,-2929.12,-9233.51,30,0
	.goto 1433/0,-2859.44,-9220.19,30,0
    .complete 127,1 --Spotted Sunfish (10)
    .collect 1468,8,150,1 --Murloc Fin (8)
    .goto 1433/0,-2831.22,-9328.06,40,0
    .goto 1433/0,-2809.95,-9313.87,40,0
    .goto 1433/0,-2789.11,-9350.36,40,0
    .goto 1433/0,-2831.22,-9328.06
    .collect 1080,5,92,1 --Tough Condor Meat (5)
#loop
	.line Redridge Mountains,43.25,34.03,47.37,34.77,47.37,34.77,49.97,33.60,51.90,39.75,54.81,40.66,54.70,44.93,57.63,46.48
	.goto 1433/0,-2509.72,-9067.73,30,0
	.goto 1433/0,-2599.16,-9078.44,30,0
	.goto 1433/0,-2599.16,-9078.44,30,0
	.goto 1433/0,-2655.60,-9061.500,30,0
	.goto 1433/0,-2697.5,-9150.55,30,0
	.goto 1433/0,-2760.67,-9163.72,30,0
	.goto 1433/0,-2758.28,-9225.55,30,0
	.goto 1433/0,-2821.88,-9247.99,30,0
    .collect 1081,5,92,1 --Crisp Spider Meat (5)
#loop
	.line Redridge Mountains,52.26,36.56,54.08,38.28,54.98,40.31,56.79,41.36,57.26,47.60,54.76,45.58,52.67,42.73,50.50,41.55,52.26,36.56
	.goto 1433/0,-2705.31,-9104.36,30,0
	.goto 1433/0,-2744.82,-9129.26,30,0
	.goto 1433/0,-2764.36,-9158.65,30,0
	.goto 1433/0,-2803.65,-9173.86,30,0
	.goto 1433/0,-2813.85,-9264.210,30,0
	.goto 1433/0,-2759.58,-9234.96,30,0
	.goto 1433/0,-2714.21,-9193.69,30,0
	.goto 1433/0,-2667.1,-9176.61,30,0
	.goto 1433/0,-2705.31,-9104.36,30,0
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .disablecheckbox
    .complete 89,1 --Iron Pike (5)
    .disablecheckbox
    .complete 89,2 --Iron Rivet (5)
    .disablecheckbox
    .goto 1433/0,-2415.07,-9034.28
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
    .goto 1433/0,-2366.23,-9110.87,60,0
    .goto 1433/0,-2270.06,-9155.47,60,0
    >>用AoE击杀 |cRXP_ENEMY_赤脊山秘法师|r 和 |cRXP_ENEMY_赤脊山蛮兵|r，拾取 |cRXP_LOOT_铁矛|r 和 |cRXP_LOOT_铁铆钉|r
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .mob 赤脊山秘法师
    .mob 赤脊山蛮兵
step
    .goto 1433/0,-2063.18,-9209.62
    >>进入屋内
    >>与 |cRXP_FRIENDLY_布雷纳|r 交谈
    .accept 92 >> 接任务：赤脊山炖肉
    .turnin 92 >> 交任务：赤脊山炖肉
    .target 厨师布雷纳
    .itemcount 1080,5
    .itemcount 1081,5
    .itemcount 2296,5
step
    #label Herbalist
    .goto 1433/0,-2045.38,-9245.82
    >>与|cRXP_FRIENDLY_玛蒂|r交谈。
    .turnin 130 >>交任务：寻访草药师
    .accept 131 >>接任务：水仙诉衷情
    .accept 34 >>接任务：不速之客
    .target 玛蒂·詹罗斯
step
    #completewith next
    .goto 1433/0,-1955.50,-9381.63,60,0
    .goto 1433/0,-1920.12,-9343.55,60,0
    >>用AoE击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob 巨型血牙野猪
step
    .goto 1433/0,-1910.79,-9288.97
    >>击杀|cRXP_ENEMY_贝利格拉布|r。
    >>|cRXP_WARN_将她风筝到 |cRXP_FRIENDLY_拉玛尔|r 北边的栅栏处，来回跳跃，利用安全位置避免受到伤害|r
    >>小心，|cRXP_ENEMY_贝利格拉布|r会施放|T132337:0|t[冲锋]和|T136025:0|t[震颤]。
    .complete 34,1 --Bellygrub's Tusk (1)
    .mob 贝利格拉布
    .target 拉玛尔·维斯利
step
    .goto 1433/0,-2045.38,-9245.82
    >>与|cRXP_FRIENDLY_玛蒂|r交谈。
    .turnin 34 >>交任务：不速之客
    .target 玛蒂·詹罗斯
step
    .goto 1433/0,-1950.08,-9206.58,60,0
    .goto 1433/0,-2024.97,-9145.04,60,0
    .goto 1433/0,-1955.50,-9381.63,60,0
    .goto 1433/0,-1920.12,-9343.55,60,0
    .goto 1433/0,-1950.08,-9206.58,60,0
    .goto 1433/0,-2024.97,-9145.04,60,0
    .goto 1433/0,-1955.50,-9381.63,60,0
    .goto 1433/0,-1920.12,-9343.55
    >>用AoE击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取 |cRXP_LOOT_巨型血牙野猪头|r
    .collect 2296,5,92,1 --Great Goretusk Snout (5)
    .mob 巨型血牙野猪
step
    #completewith next
    .goto 1433/0,-2034.31,-9101.17,60,0
    >>用AoE击杀 |cRXP_ENEMY_赤脊山秘法师|r 和 |cRXP_ENEMY_赤脊山蛮兵|r，拾取 |cRXP_LOOT_铁矛|r 和 |cRXP_LOOT_铁铆钉|r
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
    .mob 赤脊山秘法师
    .mob 赤脊山蛮兵
step
    .goto 1433/0,-1994.15,-9037.03,60,0
    .goto 1433/0,-2017.59,-8984.62,40 >>前往瑞斯班洞穴。
    .isOnQuest 347
step
#loop
	.line Redridge Mountains,18.95,24.50,21.62,23.72,21.89,15.06,20.21,13.25,18.82,15.03,16.06,17.08,17.48,19.55,16.05,21.04,18.95,24.50
	.goto 1433/0,-1982.21,-8929.740,20,0
	.goto 1433/0,-2040.17,-8918.45,20,0
	.goto 1433/0,-2046.03,-8793.06,20,0
	.goto 1433/0,-2009.56,-8766.85,20,0
	.goto 1433/0,-1979.38,-8792.62,20,0
	.goto 1433/0,-1919.47,-8822.30,20,0
	.goto 1433/0,-1950.29,-8858.07,20,0
	.goto 1433/0,-1919.25,-8879.64,20,0
	.goto 1433/0,-1982.21,-8929.740,20,0
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
	.goto 1433/0,-1982.21,-8929.740,20,0
	.goto 1433/0,-2040.17,-8918.45,20,0
	.goto 1433/0,-2046.03,-8793.06,20,0
	.goto 1433/0,-2009.56,-8766.85,20,0
	.goto 1433/0,-1979.38,-8792.62,20,0
	.goto 1433/0,-1919.47,-8822.30,20,0
	.goto 1433/0,-1950.29,-8858.07,20,0
	.goto 1433/0,-1919.25,-8879.64,20,0
	.goto 1433/0,-1982.21,-8929.740,20,0
    .xp 21+14365 >> 刷怪直到21级经验值达到 14365+/25200。
    .isQuestAvailable 92
step
#loop
	.line Redridge Mountains,18.95,24.50,21.62,23.72,21.89,15.06,20.21,13.25,18.82,15.03,16.06,17.08,17.48,19.55,16.05,21.04,18.95,24.50
	.goto 1433/0,-1982.21,-8929.740,20,0
	.goto 1433/0,-2040.17,-8918.45,20,0
	.goto 1433/0,-2046.03,-8793.06,20,0
	.goto 1433/0,-2009.56,-8766.85,20,0
	.goto 1433/0,-1979.38,-8792.62,20,0
	.goto 1433/0,-1919.47,-8822.30,20,0
	.goto 1433/0,-1950.29,-8858.07,20,0
	.goto 1433/0,-1919.25,-8879.64,20,0
	.goto 1433/0,-1982.21,-8929.740,20,0
    .xp 21+15715 >> 刷怪直到21级经验值达到 15715+/25200。
    .isQuestTurnedIn 92
step << skip
    #completewith next
    .goto 1433/0,-1978.73,-8775.39,-1
    .goto 1433/0,-2049.28,-8823.17,-1
    .goto 1433/0,-1970.27,-8924.38,-1
    .goto 1433/0,-2033.00,-8923.37,-1
    .goto 1433/0,-1930.76,-8878.63,-1
    .goto 1433/0,-2305.01,-9271.01,30 >>在洞穴东侧利用下线跳过路线，返回湖畔镇
step
    #completewith next
    .subzone 69 >> 返回湖畔镇
step
    >>与|cRXP_FRIENDLY_治安官马瑞斯|r和|cRXP_FRIENDLY_工头奥斯洛|r交谈。
    .turnin 20 >>交任务：黑石氏族的威胁
    .accept 19 >>接任务：萨瑞尔祖恩
    .target +治安官马瑞斯
    .goto 1433/0,-2298.28,-9283.90
    .turnin 89,1 >>交任务：止水湖上的桥
    .goto 1433/0,-2268.54,-9279.27
    .target +工头奥斯洛
step
    .goto 1433/0,-2242.49,-9259.00
    >>与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈。
    .accept 118 >>接任务：马掌
    .target 弗纳·奥斯古
step
    .goto 1433/0,-2172.59,-9261.02
    >>与 |cRXP_FRIENDLY_巴伦|r 交谈
    .turnin 127 >> 交任务：卖鱼
    .accept 150 >> 接任务：鱼人偷猎者
    .turnin 150 >> 交任务：鱼人偷猎者
    .goto 1433/0,-2172.59,-9261.02
    .target 码头管理员巴伦
step
    #sticky
    #label Kimberly
    .goto 1433/0,-2158.69,-9234.38,0,0
    .vendor >> 卖掉杂物。愿意的话，现在可以卖掉|T134708:0|t[矿工锄]。
    .target 金伯利·海特
step
    .goto 1433/0,-2155.22,-9225.84
    >>进入旅店
    >>与 |cRXP_FRIENDLY_达希|r 交谈
    .turnin 131 >>交任务：水仙诉衷情
    .target 达希
step
    #completewith next
    .goto 1433/0,-2146.54,-9246.54,12,0
    .goto 1433/0,-2067.09,-9220.34,12,0
    >>前往 |cRXP_FRIENDLY_布雷纳|r 处
step
    .goto 1433/0,-2063.18,-9209.62
    >>进入屋内
    >>与 |cRXP_FRIENDLY_布雷纳|r 交谈
    .accept 92 >> 接任务：赤脊山炖肉
    .turnin 92 >> 交任务：赤脊山炖肉
    .target 厨师布雷纳
step
    #completewith next
    .hs >> 炉石返回闪金镇
step
    .goto 1429/0,87.73,-9456.79
    >>与|cRXP_FRIENDLY_铁匠阿古斯|r交谈。
    .turnin 118 >>交任务：马掌
    .accept 119 >>接任务：回复弗纳
    .target 铁匠阿古斯
step
    #completewith next
    .goto 1429/0,-158.00,-8901.52,10,0
    .goto 1429/0,-174.32,-8881.39,10,0
    .goto 1429/0,-186.46,-8874.91,10 >>前往 |cRXP_FRIENDLY_帕克斯顿|r 处
step
    .goto 1429/0,-186.46,-8874.91
    >>与 |cRXP_FRIENDLY_帕克斯顿|r 交谈
    .turnin 347 >> 交任务：瑞斯班矿石
    .accept 346 >> 接任务：克里斯托弗的书
    .target 帕克斯顿修士
step
    #completewith CharysEnd
    .cast 3561 >> 施放 |T135763:0|t[传送：暴风城]
    .zoneskip Stormwind City
step
    #completewith CharysEnd
    >>|cRXP_WARN_===注意===|r
    +|cRXP_WARN_洗天赋，改为冰霜AoE天赋|r
    .xp <22,1
step
    .goto 1453/0,867.06,-9012.61
    >>与 |cRXP_FRIENDLY_仲马|r 交谈
    .train 10 >> 学习暴风雪
    .target 玛吉诺·仲马
    .xp <22,1
step
    #completewith CharysEnd
    .goto 1453/0,887.22,-9017.80,10,0
    .goto 1453/0,871.36,-9013.14,10,0
    .goto 1453/0,868.8,-9004.27,8,0
    .goto 1453/0,877.00,-9008.03,6,0
    .goto 1453/0,863.96,-9001.40,8,0
    .goto 1453/0,928.62,-9010.10,15,0
    .goto 1453/0,962.63,-8990.73,15,0
    .goto 1453/0,949.86,-9009.380,10,0
    .goto 1453/0,942.34,-9001.49,8,0
    >>离开法师塔
    .goto 1453/0,948.65,-8994.50,10 >>前往 |cRXP_FRIENDLY_查瑞斯|r 处
step
    #completewith BankDeposit
    +|cRXP_WARN_花费后余额不要低于1金43银30铜。|r
    .xp >22,1
step
    .goto 1453/0,948.65,-8994.50
    >>进入建筑
    >>与 |cRXP_FRIENDLY_查瑞斯|r 交谈
    .vendor 1307 >>|cRXP_BUY_向她购买|r |T134851:0|t[次级法力药水] |cRXP_BUY_和|r  |T134831:0|t[治疗药水] |cRXP_BUY_（有货时）|r
    .itemcount 4827,1
    .target 查瑞斯·伊瑟里安
step
    .goto 1453/0,948.65,-8994.50
    >>进入建筑
    >>与 |cRXP_FRIENDLY_查瑞斯|r 交谈
    .vendor 1307 >>|cRXP_BUY_向她购买|r |T134851:0|t[次级法力药水] |cRXP_BUY_和|r  |T134831:0|t[治疗药水] |cRXP_BUY_（有货时）|r
    .itemcount 4828,1
    .target 查瑞斯·伊瑟里安
step
    .goto 1453/0,948.65,-8994.50
    >>进入建筑
    >>与 |cRXP_FRIENDLY_查瑞斯|r 交谈
    .vendor 1307 >>|cRXP_BUY_向她购买|r |T134851:0|t[次级法力药水] |cRXP_BUY_和|r  |T134831:0|t[治疗药水] |cRXP_BUY_（有货时）|r
    .itemcount 4829,1
    .target 查瑞斯·伊瑟里安
step
    #label CharysEnd
    .goto 1453/0,948.65,-8994.50
    >>进入建筑
    >>与 |cRXP_FRIENDLY_查瑞斯|r 交谈
    .vendor 1307 >>|cRXP_BUY_向她购买|r |T134851:0|t[次级法力药水]|cRXP_BUY_、|r |T134831:0|t[治疗药水]|cRXP_BUY_和一条|r |T132515:0|t[布甲腰带] |cRXP_BUY_（有货且需要时）|r
    .itemcount 4827,<1
    .itemcount 4828,<1
    .itemcount 4829,<1
    .target 查瑞斯·伊瑟里安
step
    #completewith next
    .goto 1453/0,852.40,-8920.10,20,0
    .goto 1453/0,829.01,-8901.28,20,0
    .goto 1453/0,789.22,-8904.59,20,0
    .goto 1453/0,758.31,-8878.78,20,0
    .goto 1453/0,810.33,-8832.44,20,0
    .goto 1453/0,827.54,-8850.19,15,0
    .goto 1453/0,822.16,-8865.60,10 >>前往 |cRXP_FRIENDLY_艾代尔|r 处
step
    #label AdairX
    .goto 1453/0,822.16,-8865.60
    >>进入建筑
    >>与 |cRXP_FRIENDLY_艾代尔|r 交谈
    .vendor 1316 >> |cRXP_BUY_向他购买增加智力以外属性的|r |T134943:0|t[卷轴] |cRXP_BUY_（有货时）|r
    .target 艾代尔·吉尔罗
step
    #completewith next
    .goto 1453/0,872.30,-8803.220,5,0
    .goto 1453/0,872.70,-8682.39,20 >>沿墙边向上跑，无需绕行
step
    .goto 1453/0,766.64,-8623.23
    >>与 |cRXP_FRIENDLY_克里斯托弗|r 交谈
    .turnin 346 >> 交任务：克里斯托弗的书
    .target 克里斯托弗修士
step
    .goto 1453/0,638.26,-8342.22
    >>与 |cRXP_FRIENDLY_比利巴布|r 交谈
    .vendor 5519 >>|cRXP_BUY_向他购买|r |T133024:0|t[青铜管] |cRXP_BUY_（有货时）|r
    .target 比利巴布·旋轮
    .itemcount 4371,<1
    .isQuestAvailable 174
step
    #completewith next
    .goto 1453/0,522.12,-8352.80,20 >> 前往矿道地铁
step
    #completewith next
    +|cRXP_WARN_乘坐矿道地铁时，连续施放|r |T132816:0|t[造水术（等级3）]
step
    .zone Ironforge >> 乘坐矿道地铁前往铁炉堡
step
    .goto 1455/0,-1249.87,-4793.31
    >>与 |cRXP_FRIENDLY_考格斯宾|r 交谈
    .vendor 5175>>|cRXP_BUY_向他购买|r |T133024:0|t[青铜管] |cRXP_BUY_（有货时）|r
    .target 考格斯宾
    .itemcount 4371,<1
    .isQuestAvailable 174
step
    #completewith BankDeposit
    .goto 1455/0,-977.98,-4904.59,30 >>进入铁炉堡银行
step
    .goto 1455/0,-997.66,-4886.49
    >>与 |cRXP_FRIENDLY_拜雷|r 交谈
    >>|cRXP_WARN_注意：后续交布任务需要每种布料各12组（|r|T132911:0|t[毛料]|cRXP_WARN_、|r |T132905:0|t[丝绸]|cRXP_WARN_、|r |T132892:0|t[魔纹布]|cRXP_WARN_和|r |T132903:0|t[符文布]|cRXP_WARN_）。升级途中会自然获得这些布料|r
    .bankdeposit 17056,2592,1015,1083,2665,1922,1284 >> 将以下物品存入银行：
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
    .goto 1455/0,-997.66,-4886.49
    .bankwithdraw 4654 >> 从银行取出以下物品：
    >>|T134431:0|t[神秘的化石]
    .target 拜雷·石衣
step
    .goto 1455/0,-915.2,-4606.38
    >>与 |cRXP_FRIENDLY_贝尔斯塔弗|r 交谈
    .train 3562 >> 学习 |T135757:0|t[传送：铁炉堡]
    .target 贝尔斯塔弗·风暴之眼
step
    #completewith FlyMene
    >>|cRXP_WARN_===注意===|r
    +|cRXP_WARN_若尚未在暴风城洗过天赋，现在改为冰霜AoE天赋|r
    .train 10,1
    .xp <22,1
step
    .goto 1455/0,-928.48,-4614.620
    >>与 |cRXP_FRIENDLY_丁克|r 交谈
    .train 10 >> 学习暴风雪
    .target 丁克
step
    #completewith next
    +|cRXP_WARN_开始连续施放|r |T132816:0|t[造水术（等级3）] |cRXP_WARN_，在乘坐飞行坐骑之前尽量多制造饮用水|r
step
    #completewith next
    #label FlyMene
    .goto 1455/0,-1152.39,-4820.914
    >>与 |cRXP_FRIENDLY_格莱斯|r 交谈
    .fly Menethil >> 飞往米奈希尔港
    .target 格莱斯·瑟登
step
    .zone Wetlands >> 前往湿地
step
    +本路线到此结束。若未自动切换到后续湿地 AoE 指南，请手动选择适合当前等级的升级路线。
]])
