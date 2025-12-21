RXPGuides.RegisterGuide([[
#version 1
#group +RestedXP 诺森德日常任务
#subgroup 职业日常任务
#wotlk
#cata
#name Cooking
#displayname Cooking

step << Alliance
	.goto Dalaran,40.43,65.66
	.daily 13100,13101,13102,13103,13107 >>接任务: |cRXP_WARN_魔法蘑菇肉片|r, 与旅馆里的凯瑟琳·李交谈。接受任何可用的任务
	>>魔法蘑菇肉片
	>>下水道炖肉
	>>芥末狗
	>>交任务: |cRXP_FRIENDLY_魔术旅馆的集会|r
	>>交任务: |cRXP_FRIENDLY_兰尼德的奶酪|r
step << Horde
	.goto Dalaran,69.96,39.05
	.daily 13112,13113,13114,13115,13116 >>接任务: |cRXP_WARN_魔法蘑菇肉片|r, 与旅馆里的 埃维罗·隆古巴 交谈, 接受任何可用的任务
	>>魔法蘑菇肉片
	>>下水道炖肉
	>>芥末狗
	>>交任务: |cRXP_FRIENDLY_魔术旅馆的集会|r
	>>交任务: |cRXP_FRIENDLY_兰尼德的奶酪|r

-- Quest: 芥末狗!
step << Alliance
	>>在达拉然的草地区域采集野芥菜
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
	>>在达拉然的草地区域采集野芥菜
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
	>>在风暴峭壁击杀犀牛以获取犀牛肉. 或者, 你也可以直接从达拉然的拍卖行购买犀牛肉或犀牛热狗
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
	>>在风暴峭壁击杀犀牛以获取犀牛肉. 或者, 你也可以直接从暴风城或铁炉堡的拍卖行购买犀牛肉或犀牛热狗
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
	>>在风暴峭壁击杀犀牛以获取犀牛肉. 或者, 你也可以直接从奥格瑞玛的拍卖行购买犀牛肉或犀牛热狗
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
	>>使用你的烹饪专业将4份[犀牛肉]制作成4个[犀牛热狗]
	.collect 34752,4 -- Rhino Dogs (4)
	.isOnQuest 13107
step << Horde
	.goto Dalaran,70.44,39.80
	>>使用你的烹饪专业将4份[犀牛肉]制作成4个[犀牛热狗]
	.collect 34752,4 -- Rhino Dogs (4)
	.isOnQuest 13116
step << Alliance
	.use 43142 >>使用背包中的[空午餐篮], 将4只[犀牛热狗]和4株[野芥菜]组合, 制作出一个芥菜热狗野餐篮
	.complete 13107,1 --Mustard Dog Basket! (1)
	.isOnQuest 13107
step << Horde
	.use 43142 >>使用背包中的[空午餐篮], 将4只[犀牛热狗]和4株[野芥菜]组合, 制作出一个芥菜热狗野餐篮
	.complete 13116,1 --Mustard Dog Basket! (1)
	.isOnQuest 13116
step
	>>与停机坪上的大法师伯塔鲁斯交谈
	.goto Dalaran,68.53,42.04
	.turnin 13107 >>交任务: |cRXP_FRIENDLY_荠菜热狗！|r << Alliance
	.isQuestComplete 13107 << Alliance
	.turnin 13116 >>交任务: |cRXP_FRIENDLY_荠菜热狗！|r << Horde
	.isQuestComplete 13116 << Horde

-- Quest: 魔法蘑菇肉片
step << Alliance
	>>进入达拉然下水道. 拾取地上散落的蓝色魔法蘑菇
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
	>>跳入井中进入达拉然下水道. 搜刮散落在地上的蓝色魔法蘑菇
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
	>>在风暴峭壁击杀犀牛以获取冰冷的肉. 或者, 你也可以直接从达拉然拍卖行购买冰冷的肉
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
	>>在风暴峭壁击杀犀牛以获取冰冷的肉. 或者, 你也可以直接从暴风城或铁炉堡的拍卖行购买冰冷的肉
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
	>>在风暴峭壁击杀犀牛以获取冰冷的肉. 或者, 你可以直接从奥格瑞玛拍卖行购买冰冷的肉
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
	.use 43101 >>使用背包中的[煎肉锅], 在火上将4个[魔法蘑菇]和2块[冰冷的肉]混合制作成肉饼
	.goto Dalaran,40.20,66.98
	.complete 13100,1 --魔法蘑菇肉片 (1)
	.isOnQuest 13100
step << Horde
	.use 43101 >>使用背包中的[煎肉锅], 在火上将4个[魔法蘑菇]和2块[冰冷的肉]混合制作成肉饼
	.goto Dalaran,59.46,31.33,60,0
	.goto Dalaran,70.44,39.80
	.complete 13112,1 --魔法蘑菇肉片 (1)
	.isOnQuest 13112
step
	>>前往摩尔珍品店大楼二楼, 与奥尔顿·本内特交谈
	.goto Dalaran,49.01,56.96,6,0
	.goto Dalaran,48.79,54.94,6,0
	.goto Dalaran,50.11,53.10,6,0
	.goto Dalaran,52.31,55.59
	.turnin 13100 >>交任务: |cRXP_FRIENDLY_魔法蘑菇肉片|r << Alliance
	.isQuestComplete 13100 << Alliance
	.turnin 13112 >>交任务: |cRXP_FRIENDLY_魔法蘑菇肉片|r << Horde
	.isQuestComplete 13112 << Horde

-- Quest: 下水道炖肉
step
	.zone CrystalsongForest >>在达拉然进入紫罗兰之门建筑, 点击紫罗兰丝带水晶, 即可传送到下方的晶歌森林
	.goto Dalaran,57.32,46.55,6,0
	.goto Dalaran,55.91,46.77
	.isOnQuest 13102 << Alliance
	.isOnQuest 13114 << Horde
step
	>>拾取晶歌胡萝卜
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
	>>在风暴峭壁击杀犀牛以获取冰冷的肉. 或者, 你也可以直接从达拉然拍卖行购买冰冷的肉
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
	>>在风暴峭壁击杀犀牛以获取冰冷的肉. 或者, 你也可以直接从暴风城或铁炉堡的拍卖行购买冰冷的肉
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
	>>在风暴峭壁击杀犀牛以获取冰冷的肉. 或者, 你可以直接从奥格瑞玛拍卖行购买冰冷的肉
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
	.use 43147 >>使用背包中的[炖肉锅], 在火上将4个[晶歌胡萝卜]和4块[冰冷的肉]合成
	.goto Dalaran,40.20,66.98
	.complete 13102,1 --Vegetable Stew (1)
	.isOnQuest 13102
step << Horde
	.use 43101 >>使用背包中的[炖肉锅], 在火上将4个[晶歌胡萝卜]和4块[冰冷的肉]合成
	.goto Dalaran,59.46,31.33,57,0
	.goto Dalaran,70.44,39.80
	.complete 13114,1 --Vegetable Stew (1)
	.isOnQuest 13114
step << Alliance
	>>与达拉然下水道的埃因·格林交谈
	.goto Dalaran,35.31,45.28,10,0
	.goto 126,22.66,41.71,10,0
	.goto 126,36.30,43.97,10,0
	.goto 126,35.47,57.55
	.turnin 13102 >>交任务: |cRXP_FRIENDLY_下水道炖肉|r
	.isQuestComplete 13102
step << Horde
	>>跳入达拉然下水道的井中, 然后与埃因·格林交谈
	.goto Dalaran,48.25,32.33,5,0
	.goto 126,35.47,57.55
	.turnin 13114 >>交任务: |cRXP_FRIENDLY_下水道炖肉|r
	.isQuestComplete 13114

-- Quest: 交任务: |cRXP_FRIENDLY_兰尼德的奶酪|r
step << Alliance
	#completewith Cheese
	>>开始寻找达拉然半满酒杯. 这些酒杯散落在达拉然各处建筑中, 记得检查旅店内部以及楼上区域
	.goto Dalaran,43.75,63.27
	.collect 43138,6 --Half Full Dalaran Wine Glass (6)
	.isOnQuest 13103
step << Horde
	#completewith Cheese
	>>开始寻找达拉然半满酒杯. 这些酒杯散落在达拉然各处建筑中, 记得检查旅店内部以及楼上区域
	.goto Dalaran,69.42,31.39
	.collect 43138,6 --Half Full Dalaran Wine Glass (6)
	.isOnQuest 13115
step
	#label Cheese
	>>在达拉然进入“再来一杯”大楼, 拾取“陈年达拉然林堡干酪”. 该物品可能随机出现在室内外的桌子上
	.goto Dalaran,54.70,31.57
	.collect 43137,1 --Aged Dalaran Limburger (1)
	.isOnQuest 13103 << Alliance
	.isOnQuest 13115 << Horde
step
	>>开始寻找达拉然半满酒杯. 这些酒杯散落在达拉然各处建筑中, 记得检查旅店内部以及楼上区域
	.goto Dalaran,54.70,31.57
	.collect 43138,6 --Half Full Dalaran Wine Glass (6)
    .isOnQuest 13103 << Alliance
	.isOnQuest 13115 << Horde
step << Alliance
	.use 43139 >>使用背包中的[空的奶酪盘], 将6个[半满的达拉然酒杯]和[陈年达拉然干酪]组合, 制作出一份[美酒和奶酪盘]
	.complete 13103,1 --Wine and Cheese Platter (1)
	.isOnQuest 13103
step << Horde
	.use 43139 >>使用背包中的[空的奶酪盘], 将6个[半满的达拉然酒杯]和[陈年达拉然干酪]组合, 制作出一份[美酒和奶酪盘]
	.complete 13115,1 --Wine and Cheese Platter (1)
	.isOnQuest 13115
step
	>>与达拉然的兰尼德·怒金交谈
	.goto Dalaran,36.42,29.64,10,0
	.goto Dalaran,36.62,27.88
	.turnin 13103 >>交任务: |cRXP_FRIENDLY_兰尼德的奶酪|r << Alliance
	.isQuestComplete 13103 << Alliance
	.turnin 13115 >>交任务: |cRXP_FRIENDLY_兰尼德的奶酪|r << Horde
	.isQuestComplete 13115 << Horde

-- Quest: 交任务: |cRXP_FRIENDLY_魔术旅馆的集会|r
step << Alliance
	>>在达拉然前往“再来一杯”酒馆. 拾取酒壶. 注意该物品为随机生成, 可能出现在室外或楼上
	.goto Dalaran,54.00,32.26
	.complete 13101,2 --Jug of Wine (1)
	.isOnQuest 13101
step << Horde
	>>在达拉然前往“再来一杯”酒馆. 拾取酒壶. 注意该物品为随机生成, 可能出现在室外或楼上
	.goto Dalaran,54.00,32.26
	.complete 13113,2 --Jug of Wine (1)
	.isOnQuest 13113
step
	#sticky
    #completewith stew
	>>在风暴峭壁击杀犀牛以获取冰冷的肉. 或者, 你可以直接从达拉然的拍卖行购买冰冷的肉或诺森德炖肉
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
	>>在风暴峭壁击杀犀牛以获取冰冷的肉. 或者, 你也可以直接从暴风城或铁炉堡的拍卖行购买冰冷的肉或诺森德炖肉
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
	>>在风暴峭壁击杀犀牛以获取冰冷的肉. 或者, 你也可以直接从奥格瑞玛拍卖行购买冰冷的肉或诺森德炖肉
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
	>>要学习如何烹饪诺森德炖肉, 你必须将4份冰冷的肉交给嚎风峡湾的布罗姆·布鲁巴斯特. 或者, 你可以直接从拍卖行购买诺森德炖肉. 如果你是从拍卖行购买诺森德炖肉, 请跳过此步骤
	>>如果你正在完成这个任务, 总共需要 8 块冰冷的肉
	.collect 43013,4 -- Chilled Meat (4)
	.accept 13087 >>接任务: |cRXP_LOOT_诺森德的厨师|r
	.turnin 13087 >>交任务: |cRXP_FRIENDLY_诺森德的厨师|r
	.goto HowlingFjord,58.21,62.06
step << Horde
	#completewith next
	.isQuestAvailable 13089
	.isOnQuest 13113
	>>要学习如何烹饪诺森德炖肉, 你必须将4份冰冷的肉交给嚎风峡湾的托马斯·克里奇. 或者, 你可以直接从拍卖行购买诺森德炖肉. 如果你是从拍卖行购买诺森德炖肉, 请跳过此步骤
	>>如果你正在完成这个任务, 总共需要 8 块冰冷的肉
	.collect 43013,4 -- Chilled Meat (4)
	.accept 13089 >>接任务: |cRXP_LOOT_诺森德的厨师|r
	.turnin 13089 >>交任务: |cRXP_FRIENDLY_诺森德的厨师|r
	.goto HowlingFjord,78.61,29.48
step << Alliance
    #label stew
	.goto Dalaran,40.20,66.98
	>>使用你的烹饪专业技能, 将4块[冰冷的肉]制成4份[诺森德炖肉]
	.complete 13101,1 --Northern Stew (4)
	.isOnQuest 13101
step << Horde
    #label stew
	.goto Dalaran,70.44,39.80
	>>使用你的烹饪专业技能, 将4块[冰冷的肉]制成4份[诺森德炖肉]
	.complete 13113,1 --Northern Stew (4)
	.isOnQuest 13113
step
	>>与达拉然的埃里雷·艾索盖兹交谈
	.goto Dalaran,48.37,37.47
	.turnin 13101 >>交任务: |cRXP_FRIENDLY_魔术旅馆的集会|r << Alliance
	.isQuestComplete 13101 << Alliance
	.turnin 13113 >>交任务: |cRXP_FRIENDLY_魔术旅馆的集会|r << Horde
	.isQuestComplete 13113 << Horde
step
	>>您已完成今天的烹饪日常任务
]])
