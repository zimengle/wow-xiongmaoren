RXPGuides.RegisterGuide([[
#version 1
#group +休息经验 诺森德每日任务
#subgroup 专业日常任务
#wotlk
#cata
#name 烹饪

step << Alliance
	.goto Dalaran,40.43,65.66
	.daily 13100,13101,13102,13103,13107 >>接任务: |cRXP_WARN_魔法蘑菇肉片|r, 与旅馆里的凯瑟琳·李交谈。接受任何可用的任务
	>>蘑菇肉饼
	>>下水道炖菜
	>>芥末狗
	>>交任务: |cRXP_FRIENDLY_魔术旅馆的集会|r
	>>交任务: |cRXP_FRIENDLY_兰尼德的奶酪|r
step << Horde
	.goto Dalaran,69.96,39.05
	.daily 13112,13113,13114,13115,13116 >>接任务: |cRXP_WARN_魔法蘑菇肉片|r, 与旅馆里的 埃维罗·隆古巴 交谈, 接受任何可用的任务
	>>蘑菇肉饼
	>>下水道炖菜
	>>芥末狗
	>>交任务: |cRXP_FRIENDLY_魔术旅馆的集会|r
	>>交任务: |cRXP_FRIENDLY_兰尼德的奶酪|r

-- Quest: 芥末狗!
step << Alliance
	>>在达拉然的草地上拾取野芥菜
	.goto Dalaran,35.78,51.51,15,0
	.goto Dalaran,33.94,58.63,15,0
	.goto Dalaran,37.05,47.56,15,0
	.goto Dalaran,31.88,32.70,15,0
	.goto Dalaran,49.95,43.88,15,0
	.goto Dalaran,52.04,46.39,15,0
	.goto Dalaran,67.71,39.70,15,0
	.goto Dalaran,68.90,48.77
	.collect 43143,4 --Wild Mustard (4)
	.isOnQuest 13107
step << Horde
	>>在达拉然的草地上拾取野芥菜
	.goto Dalaran,55.17,38.59,25,0
	.goto Dalaran,67.71,39.70,15,0
	.goto Dalaran,68.90,48.77,15,0
	.goto Dalaran,51.70,47.34,15,0
	.goto Dalaran,49.38,44.26,15,0
	.goto Dalaran,47.58,47.52,15,0
	.goto Dalaran,50.19,50.54,15,0
	.goto Dalaran,35.78,51.51,15,0
	.goto Dalaran,33.94,58.63,15,0
	.goto Dalaran,37.05,47.56,15,0
	.goto Dalaran,31.88,32.70
	.collect 43143,4 --Wild Mustard (4)
	.isOnQuest 13116
step
	#sticky
	>>在风暴峭壁杀死犀牛以获取犀牛肉。或者，你可以直接从达拉然的拍卖行购买犀牛肉或犀牛狗
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43012,4,-1 -- Rhino Meat (4)
	.skill engineering,<350,1
	.goto Dalaran,38.65,25.13,0
	.isOnQuest 13107 << Alliance
	.isOnQuest 13116 << Horde
step << Alliance
	#sticky
	>>在风暴峭壁杀死犀牛以获取犀牛肉。或者，你可以直接从暴风城或铁炉堡的拍卖行购买犀牛肉或犀牛狗
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43012,4,-1 -- Rhino Meat (4)
	.goto Ironforge,24.83,73.83,0
	.goto Stormwind City,60.88,70.92,0
	.skill engineering,350,1
	.isOnQuest 13107
step << Horde
	#sticky
	>>在风暴峭壁杀死犀牛以获取犀牛肉。或者，你可以直接从奥格瑞玛的拍卖行购买犀牛肉或犀牛狗
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43012,4,-1 -- Rhino Meat (4)
	.goto Orgrimmar,54.57,63.68,0
	.skill engineering,350,1
	.isOnQuest 13116
step << Alliance
	.goto Dalaran,40.20,66.98
	>>使用你的烹饪技能将 4 只犀牛肉烹制成 4 只犀牛狗
	.collect 34752,4 -- Rhino Dogs (4)
	.isOnQuest 13107
step << Horde
	.goto Dalaran,70.44,39.80
	>>使用你的烹饪技能将 4 只犀牛肉烹制成 4 只犀牛狗
	.collect 34752,4 -- Rhino Dogs (4)
	.isOnQuest 13116
step << Alliance
	.use 43142 >>使用包中的空野餐篮，将 4 只犀牛狗和 4 只野芥菜组合在一起，制作一个芥菜狗野餐篮
	.complete 13107,1 --Mustard Dog Basket! (1)
	.isOnQuest 13107
step << Horde
	.use 43142 >>使用包中的空野餐篮，将 4 只犀牛狗和 4 只野芥菜组合在一起，制作一个芥菜狗野餐篮
	.complete 13116,1 --Mustard Dog Basket! (1)
	.isOnQuest 13116
step
	>>与着陆台上的大法师 Pentarus 交谈
	.goto Dalaran,68.53,42.04
	.turnin 13107 >>交任务: |cRXP_FRIENDLY_荠菜热狗！|r << Alliance
	.isQuestComplete 13107 << Alliance
	.turnin 13116 >>交任务: |cRXP_FRIENDLY_荠菜热狗！|r << Horde
	.isQuestComplete 13116 << Horde

-- Quest: 蘑菇肉饼
step << Alliance
	>>进入达拉然下水道。拾取散落在地面上的蓝色注魔蘑菇
	.goto Dalaran,35.31,45.28,10,0
	.goto 126,22.66,41.71,10,0
	.goto 126,36.30,43.97,10,0
	.goto 126,54.12,64.98,10,0
	.goto 126,57.12,49.90,10,0
	.goto 126,45.46,47.06,10,0
	.goto 126,47.29,33.14,10,0
	.goto 126,53.79,29.20,10,0
	.goto 126,59.73,44.33
	.collect 43100,4 --Infused Mushrooms
	.isOnQuest 13100
step << Horde
	>>从井里掉进达拉然下水道。拾取散落在地上的蓝色蘑菇
	.goto Dalaran,48.25,32.33,5,0
	.goto 126,36.30,43.97,10,0
	.goto 126,54.12,64.98,10,0
	.goto 126,57.12,49.90,10,0
	.goto 126,45.46,47.06,10,0
	.goto 126,47.29,33.14,10,0
	.goto 126,53.79,29.20,10,0
	.goto 126,59.73,44.33
	.collect 43100,4 --Infused Mushrooms (4)
	.isOnQuest 13112
step
	#sticky
	>>在风暴峭壁杀死犀牛以获取冰鲜肉。或者，你可以直接从达拉然的拍卖行购买冰鲜肉
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43013,2 -- Chilled Meat (2)
	.skill engineering,<350,1
	.goto Dalaran,38.65,25.13,0
	.isOnQuest 13100 << Alliance
	.isOnQuest 13112 << Horde
step << Alliance
	#sticky
	>>在风暴峭壁杀死犀牛以获取冰冻肉。或者，你可以直接从暴风城或铁炉堡的拍卖行购买冰冻肉
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43013,2 -- Chilled Meat (2)
	.goto Ironforge,24.83,73.83,0
	.goto Stormwind City,60.88,70.92,0
	.skill engineering,350,1
	.isOnQuest 13100
step << Horde
	#sticky
	>>在风暴峭壁杀死犀牛以获取冰鲜肉。或者，你可以直接从奥格瑞玛的拍卖行购买冰鲜肉
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43013,2 -- Chilled Meat (2)
	.goto Orgrimmar,54.57,63.68,0
	.skill engineering,350,1
	.isOnQuest 13112
step << Alliance
	.use 43101 >>使用包中的肉饼锅将 4 份浸泡过的蘑菇和 2 份冷冻肉放在火上烤
	.goto Dalaran,40.20,66.98
	.complete 13100,1 --蘑菇肉饼 (1)
	.isOnQuest 13100
step << Horde
	.use 43101 >>使用包中的肉饼锅将 4 份浸泡过的蘑菇和 2 份冷冻肉放在火上烤
	.goto Dalaran,59.46,31.33,60,0
	.goto Dalaran,70.44,39.80
	.complete 13112,1 --蘑菇肉饼 (1)
	.isOnQuest 13112
step
	>>与 Curiosities Moore 大楼楼上的 Orton Bennet 交谈。
	.goto Dalaran,49.01,56.96,6,0
	.goto Dalaran,48.79,54.94,6,0
	.goto Dalaran,50.11,53.10,6,0
	.goto Dalaran,52.31,55.59
	.turnin 13100 >>交任务: |cRXP_FRIENDLY_魔法蘑菇肉片|r << Alliance
	.isQuestComplete 13100 << Alliance
	.turnin 13112 >>交任务: |cRXP_FRIENDLY_魔法蘑菇肉片|r << Horde
	.isQuestComplete 13112 << Horde

-- Quest: 下水道炖菜
step
	.zone CrystalsongForest >>在达拉然，进入紫罗兰之门建筑，点击紫罗兰水晶传送到下面的晶歌森林
	.goto Dalaran,57.32,46.55,6,0
	.goto Dalaran,55.91,46.77
	.isOnQuest 13102 << Alliance
	.isOnQuest 13114 << Horde
step
	>>掠夺晶歌胡萝卜
	.goto CrystalsongForest,25.83,39.27,40,0
	.goto CrystalsongForest,28.74,42.89,40,0
	.goto CrystalsongForest,31.87,43.25,40,0
	.goto CrystalsongForest,30.69,37.48,40,0
	.goto CrystalsongForest,26.96,47.00
	.collect 43148,4 --Crystalsong Carrot (4)
	.isOnQuest 13102 << Alliance
	.isOnQuest 13114 << Horde
step
	#sticky
	>>在风暴峭壁杀死犀牛以获取冰鲜肉。或者，你可以直接从达拉然的拍卖行购买冰鲜肉
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43013,4 -- Chilled Meat (4)
	.skill engineering,<350,1
	.goto Dalaran,38.65,25.13,0
	.isOnQuest 13102 << Alliance
	.isOnQuest 13114 << Horde
step << Alliance
	#sticky
	>>在风暴峭壁杀死犀牛以获取冰冻肉。或者，你可以直接从暴风城或铁炉堡的拍卖行购买冰冻肉
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43013,4 -- Chilled Meat (4)
	.goto Ironforge,24.83,73.83,0
	.goto Stormwind City,60.88,70.92,0
	.skill engineering,350,1
	.isOnQuest 13102
step << Horde
	#sticky
	>>在风暴峭壁杀死犀牛以获取冰鲜肉。或者，你可以直接从奥格瑞玛的拍卖行购买冰鲜肉
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43013,4 -- Chilled Meat (4)
	.goto Orgrimmar,54.57,63.68,0
	.skill engineering,350,1
	.isOnQuest 13114
step << Alliance
	.use 43147 >>使用包中的炖锅将 4 根晶歌胡萝卜和 4 块冰鲜肉放在火上煮熟
	.goto Dalaran,40.20,66.98
	.complete 13102,1 --Vegetable Stew (1)
	.isOnQuest 13102
step << Horde
	.use 43101 >>使用包中的炖锅将 4 根晶歌胡萝卜和 4 块冰鲜肉放在火上煮熟
	.goto Dalaran,59.46,31.33,57,0
	.goto Dalaran,70.44,39.80
	.complete 13114,1 --Vegetable Stew (1)
	.isOnQuest 13114
step << Alliance
	>>与达拉然下水道的阿贾伊·格林交谈
	.goto Dalaran,35.31,45.28,10,0
	.goto 126,22.66,41.71,10,0
	.goto 126,36.30,43.97,10,0
	.goto 126,35.47,57.55
	.turnin 13102 >>交任务: |cRXP_FRIENDLY_下水道炖肉|r
	.isQuestComplete 13102
step << Horde
	>>跳进达拉然下水道的井里。和阿杰·格林交谈
	.goto Dalaran,48.25,32.33,5,0
	.goto 126,35.47,57.55
	.turnin 13114 >>交任务: |cRXP_FRIENDLY_下水道炖肉|r
	.isQuestComplete 13114

-- Quest: 交任务: |cRXP_FRIENDLY_兰尼德的奶酪|r
step << Alliance
	#completewith Cheese
	>>开始寻找半满的达拉然酒杯。它们散落在达拉然的建筑物中。检查旅馆内部以及楼上
	.goto Dalaran,43.75,63.27
	.collect 43138,6 --Half Full Dalaran Wine Glass (6)
	.isOnQuest 13103
step << Horde
	#completewith Cheese
	>>开始寻找半满的达拉然酒杯。它们散落在达拉然的建筑物中。检查旅馆内部以及楼上
	.goto Dalaran,69.42,31.39
	.collect 43138,6 --Half Full Dalaran Wine Glass (6)
	.isOnQuest 13115
step
	#label Cheese
	>>在达拉然，进入“再来一杯”大楼。拾取“达拉然陈年林堡干酪”。它可以随机出现在室内或室外的桌子上。
	.goto Dalaran,54.70,31.57
	.collect 43137,1 --Aged Dalaran Limburger (1)
	.isOnQuest 13103 << Alliance
	.isOnQuest 13115 << Horde
step
	>>开始寻找半满的达拉然酒杯。它们散落在达拉然的建筑物中。检查旅馆内部以及楼上
	.goto Dalaran,54.70,31.57
	.collect 43138,6 --Half Full Dalaran Wine Glass (6)
    .isOnQuest 13103 << Alliance
	.isOnQuest 13115 << Horde
step << Alliance
	.use 43139 >>使用包中的空奶酪拼盘将 6 个半满的达拉然酒杯和陈年的达拉然林堡干酪组合在一起，制作一份葡萄酒和奶酪拼盘
	.complete 13103,1 --Wine and Cheese Platter (1)
	.isOnQuest 13103
step << Horde
	.use 43139 >>使用包中的空奶酪拼盘将 6 个半满的达拉然酒杯和陈年的达拉然林堡干酪组合在一起，制作一份葡萄酒和奶酪拼盘
	.complete 13115,1 --Wine and Cheese Platter (1)
	.isOnQuest 13115
step
	>>与达拉然的拉尼德·格洛尔戈德交谈
	.goto Dalaran,36.42,29.64,10,0
	.goto Dalaran,36.62,27.88
	.turnin 13103 >>交任务: |cRXP_FRIENDLY_兰尼德的奶酪|r << Alliance
	.isQuestComplete 13103 << Alliance
	.turnin 13115 >>交任务: |cRXP_FRIENDLY_兰尼德的奶酪|r << Horde
	.isQuestComplete 13115 << Horde

-- Quest: 交任务: |cRXP_FRIENDLY_魔术旅馆的集会|r
step << Alliance
	>>在达拉然，前往“再来一杯”大楼。拾取酒壶。注意，它是随机生成的，也可以在外面和楼上生成
	.goto Dalaran,54.00,32.26
	.complete 13101,2 --Jug of Wine (1)
	.isOnQuest 13101
step << Horde
	>>在达拉然，前往“再来一杯”大楼。拾取酒壶。注意，它是随机生成的，也可以在外面和楼上生成
	.goto Dalaran,54.00,32.26
	.complete 13113,2 --Jug of Wine (1)
	.isOnQuest 13113
step
	#sticky
    #completewith stew
	>>在风暴峭壁杀死犀牛以获取冰鲜肉。或者，你可以直接从达拉然的拍卖行购买冰鲜肉或北方炖菜
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43013,4,-1 -- Chilled Meat (4)
	.skill engineering,<350,1
	.goto Dalaran,38.65,25.13,0
	.isOnQuest 13101 << Alliance
	.isOnQuest 13113 << Horde
step << Alliance
	#sticky
    #completewith stew
	>>在风暴峭壁杀死犀牛以获取冰鲜肉。或者，你可以直接从暴风城或铁炉堡的拍卖行购买冰鲜肉或北方炖菜
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43013,4,-1 -- Chilled Meat (4)
	.goto Ironforge,24.83,73.83,0
	.goto Stormwind City,60.88,70.92,0
	.skill engineering,350,1
	.isOnQuest 13101
step << Horde
	#sticky
    #completewith stew
	>>在风暴峭壁杀死犀牛以获取冰鲜肉。或者，你可以直接从奥格瑞玛的拍卖行购买冰鲜肉或北方炖菜
	.goto TheStormPeaks,43.26,59.11,70,0
	.goto TheStormPeaks,44.93,61.45,70,0
	.goto TheStormPeaks,45.77,57.91,70,0
	.goto TheStormPeaks,43.82,55.42,70,0
	.goto TheStormPeaks,41.79,53.43,70,0
	.goto TheStormPeaks,38.81,54.06,70,0
	.goto TheStormPeaks,38.58,59.45
	.collect 43013,4,-1 -- Chilled Meat (4)
	.goto Orgrimmar,54.57,63.68,0
	.skill engineering,350,1
	.isOnQuest 13113
step << Alliance
	#completewith next
	.isQuestAvailable 13087
	.isOnQuest 13101
	>>要学习如何烹饪北方炖菜，你必须将 4 块冰鲜肉带到嚎风峡湾的布罗姆·布鲁巴斯特那里。或者，你可以直接从拍卖行购买北方炖菜。如果你从拍卖行购买北方炖菜，请跳过此步骤
	>>如果你要完成这个任务，你将总共需要 8 块冷冻肉
	.collect 43013,4 -- Chilled Meat (4)
	.accept 13087 >>接任务: |cRXP_LOOT_诺森德的厨师|r
	.turnin 13087 >>交任务: |cRXP_FRIENDLY_诺森德的厨师|r
	.goto HowlingFjord,58.21,62.06
step << Horde
	#completewith next
	.isQuestAvailable 13089
	.isOnQuest 13113
	>>要学习如何烹饪北方炖菜，您必须将 4 块冷冻肉带给嚎风峡湾的托马斯·科利奇奥。或者，您可以直接从拍卖行购买北方炖菜。如果您从拍卖行购买北方炖菜，请跳过此步骤
	>>如果你要完成这个任务，你将总共需要 8 块冷冻肉
	.collect 43013,4 -- Chilled Meat (4)
	.accept 13089 >>接任务: |cRXP_LOOT_诺森德的厨师|r
	.turnin 13089 >>交任务: |cRXP_FRIENDLY_诺森德的厨师|r
	.goto HowlingFjord,78.61,29.48
step << Alliance
    #label stew
	.goto Dalaran,40.20,66.98
	>>使用你的烹饪技能将 4 块冰鲜肉烹制成 4 道北方炖菜
	.complete 13101,1 --Northern Stew (4)
	.isOnQuest 13101
step << Horde
    #label stew
	.goto Dalaran,70.44,39.80
	>>使用你的烹饪技能将 4 块冰鲜肉烹制成 4 道北方炖菜
	.complete 13113,1 --Northern Stew (4)
	.isOnQuest 13113
step
	>>与达拉然的阿瑞尔·艾索盖兹交谈
	.goto Dalaran,48.37,37.47
	.turnin 13101 >>交任务: |cRXP_FRIENDLY_魔术旅馆的集会|r << Alliance
	.isQuestComplete 13101 << Alliance
	.turnin 13113 >>交任务: |cRXP_FRIENDLY_魔术旅馆的集会|r << Horde
	.isQuestComplete 13113 << Horde
step
	>>您已完成今天的烹饪每日任务
]])
