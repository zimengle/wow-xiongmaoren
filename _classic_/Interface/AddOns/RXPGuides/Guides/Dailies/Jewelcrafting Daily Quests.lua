RXPGuides.RegisterGuide([[
#version 1
#group +RestedXP 诺森德日常任务
#subgroup 职业日常任务
#wotlk
#cata
#name Jewelcrafting
#displayname Jewelcrafting

step
	.goto Dalaran,40.67,35.35
	>>要开始珠宝加工日常任务, 你必须先完成“完成订单”任务, 该任务要求你将一颗玉髓石交给达拉然的提莫斯·琼斯
	.collect 36923,1 --Chalcedony (1)
	.isQuestAvailable 13041
step
	>>与提莫斯·琼斯交谈
    .goto Dalaran,40.67,35.35
    .accept 13041 >>接任务: |cRXP_LOOT_完成订单|r
	.complete 13041,1 --Chalcedony (1)
    .turnin 13041 >>交任务: |cRXP_FRIENDLY_完成订单|r
	.isQuestAvailable 13041
step
	.goto Dalaran,40.67,35.35
	.daily 12958,12959,12960,12961,12962,12963 >>接任务: |cRXP_WARN_货单：血玉护符|r, 与达拉然的提莫斯·琼斯交谈。接受任何可用的任务
	>>货单：血玉护符 -- 12958
	>>货单：炽热鹿牙雕像 -- 12959
	>>货单：邪恶太阳胸针 -- 12960
	>>货单：精致龙骨雕像 -- 12961
	>>货单：光芒护甲圣物 -- 12962
	>>货单：迅捷烈日古器 -- 12963

-- Quest: 货单：血玉护符 -- 12958
step
	#completewith Amulet
	>>收集一块黑玉和一块血石, 然后与维库护身符合成
	.collect 36932,1 --Dark Jade (1)
	.collect 36917,1 --Bloodstone (1)
	.isOnQuest 12958
step
	.goto TheStormPeaks,22.50,59.67,60,0
	.goto TheStormPeaks,23.46,59.89,60,0
	.goto TheStormPeaks,25.31,59.98,60,0
	.goto TheStormPeaks,26.29,59.11,60,0
	.goto TheStormPeaks,27.57,60.98,60,0
	.goto TheStormPeaks,26.10,62.50
	>>在风暴峭壁击杀瓦基里安候选者, 以获取维库护身符
	.collect 41989,1 --Vrykul Amulet (1)
	.isOnQuest 12958
step
	#label Amulet
	.use 41989 >>使用背包中的[维库护身符], 将[黑玉]与[血石]合成一件[血玉护符]
	.complete 12958,1 --Blood Jade Amulet (1)
	.isOnQuest 12958
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的提莫斯·琼斯对话
	.goto Dalaran,40.67,35.35
	.turnin 12958 >>交任务: |cRXP_FRIENDLY_货单：血玉护符|r
	.isQuestComplete 12958

-- Quest: 货单：炽热鹿牙雕像 -- 12959
step
	#completewith Ivory
	>>收集一块玉髓石和一颗暗影水晶, 然后与诺森德鹿牙融合
	.collect 36923,1 --Chalcedony (1)
	.collect 36926,1 --Shadow Crystal (1)
	.isOnQuest 12959
step
	.goto Dragonblight,67.00,31.04,60,0
	.goto Dragonblight,65.94,36.65,60,0
	.goto Dragonblight,65.00,45.69,60,0
	.goto Dragonblight,56.41,48.12
	>>在龙骨荒野击杀瘦弱的猛犸象以获取诺森德鹿牙
	.collect 42104,1 --Northern Ivory (1)
	.isOnQuest 12959
step
	#label Ivory
	.use 42104 >>使用背包中的[诺森德鹿牙], 将[玉髓石]与[暗影水晶]合成, 制作出[炽热鹿牙雕像]
	.complete 12959,1 --Glowing Ivory Figurine (1)
	.isOnQuest 12959
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的提莫斯·琼斯对话
	.goto Dalaran,40.67,35.35
	.turnin 12959 >>交任务: |cRXP_FRIENDLY_货单：炽热鹿牙雕像|r
	.isQuestComplete 12959

-- Quest: 货单：邪恶太阳胸针 -- 12960
step
	#completewith Brooch
	>>收集一颗巨大的茶晶石和一颗太阳水晶, 然后与铁矮人胸针合成
	.collect 36929,1 --Huge Citrine (1)
	.collect 36920,1 --Sun Crystal (1)
	.isOnQuest 12960
step
	.goto TheStormPeaks,26.82,66.90,40,0
	.goto TheStormPeaks,26.13,66.93,30,0
	.goto TheStormPeaks,26.00,67.60,20,0
	.goto TheStormPeaks,26.82,66.90
	>>前往风暴峭壁的伯尔之息洞穴指定位置进入. 击杀风暴锻造矮人, 获取铁矮人胸针
	.collect 42105,1 --Iron Dwarf Brooch (1)
	.isOnQuest 12960
step
	#label Brooch
	.use 42105 >>使用背包中的[铁矮人胸针], 将[茶晶石]与[太阳水晶]合成, 制作出[邪恶太阳胸针]
	.complete 12960,1 --Wicked Sun Brooch (1)
	.isOnQuest 12960
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的提莫斯·琼斯对话
	.goto Dalaran,40.67,35.35
	.turnin 12960 >>交任务: |cRXP_FRIENDLY_货单：邪恶太阳胸针|r
	.isQuestComplete 12960

-- Quest: 货单：精致龙骨雕像 -- 12961
step
	#completewith Figurine
	>>收集一颗太阳水晶和一块黑玉, 然后与始祖龙骨合成
	.collect 36920,1 --Sun Crystal (1)
	.collect 36932,1 --Dark Jade (1)
	.isOnQuest 12961
step
	.goto TheStormPeaks,45.77,67.09,60,0
	.goto TheStormPeaks,43.80,64.03,70,0
	.goto TheStormPeaks,45.80,62.52
	>>在风暴峭壁击杀风暴尖峰原始幼龙, 以获取始祖龙骨
	.collect 42106,1 --Proto Dragon Bone (1)
	.isOnQuest 12961
step
	#label Figurine
	.use 42106 >>使用背包中的[始祖龙骨], 将[太阳水晶]与[黑玉]制作出一个[精致龙骨雕像]
	.complete 12961,1 --Intricate Bone Figurine (1)
	.isOnQuest 12961
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的提莫斯·琼斯对话
	.goto Dalaran,40.67,35.35
	.turnin 12961 >>交任务: |cRXP_FRIENDLY_货单：精致龙骨雕像|r
	.isQuestComplete 12961

-- Quest: 货单：光芒护甲圣物 -- 12962
step
	#completewith Relic
	>>收集一块血石和一块茶晶石, 然后与元素护甲片合成
	.collect 36917,1 --Bloodstone (1)
	.collect 36929,1 --Huge Citrine (1)
	.isOnQuest 12962
step
	.goto Dragonblight,57.83,14.22,50,0
	.goto Dragonblight,58.62,16.39,50,0
	.goto Dragonblight,54.77,19.10
	>>在龙骨荒野击杀水晶冰雪元素, 以获得元素护甲片
	.collect 42107,1 --Elemental Armor Scrap (1)
	.isOnQuest 12962
step
	#label Relic
	.use 42107 >>使用背包中的[元素护甲片], 将[血石]与[茶晶石]合成, 制作出[光芒护甲圣物]
	.complete 12962,1 --Bright Armor Relic (1)
	.isOnQuest 12962
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的提莫斯·琼斯对话
	.goto Dalaran,40.67,35.35
	.turnin 12962 >>交任务: |cRXP_FRIENDLY_货单：光芒护甲圣物|r
	.isQuestComplete 12962

-- Quest: 货单：迅捷烈日古器 -- 12963
step
	#completewith Curio
	>>收集一颗太阳水晶和一颗暗影水晶, 然后与一个天灾古物合成
	.collect 36920,1 --Sun Crystal (1)
	.collect 36926,1 --Shadow Crystal (1)
	.isOnQuest 12963
step
	.goto Icecrown,70.77,68.13,50,0
	.goto Icecrown,68.66,68.07
	>>在冰冠冰川击杀笨重的憎恶或邪恶通灵师, 以获得天灾古物
	.collect 42108,1 --Scourge Curio (1)
	.isOnQuest 12963
step
	#label Curio
	.use 42108 >>使用背包中的[天灾古物], 将[太阳水晶]和[暗影水晶]合成为[迅捷烈日古器]
	.complete 12963,1 --Shifting Sun Curio (1)
	.isOnQuest 12963
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的提莫斯·琼斯对话
	.goto Dalaran,40.67,35.35
	.turnin 12963 >>交任务: |cRXP_FRIENDLY_货单：光芒护甲圣物|r
	.isQuestComplete 12963
step
	>>您已完成今天的珠宝加工日常任务
]])
