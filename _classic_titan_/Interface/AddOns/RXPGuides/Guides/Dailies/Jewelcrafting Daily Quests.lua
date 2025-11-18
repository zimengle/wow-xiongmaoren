RXPGuides.RegisterGuide([[
#version 1
#group +休息经验 诺森德每日任务
#subgroup 专业日常任务
#wotlk
#cata
#name 珠宝加工

step
	.goto Dalaran,40.67,35.35
	>>要开始珠宝加工日常任务，你必须先完成任务完成货物，这需要你给达拉然的蒂莫西·琼斯带去一颗玉髓
	.collect 36923,1 --Chalcedony (1)
	.isQuestAvailable 13041
step
	>>与蒂莫西·琼斯交谈
    .goto Dalaran,40.67,35.35
    .accept 13041 >>接任务: |cRXP_LOOT_完成订单|r
	.complete 13041,1 --Chalcedony (1)
    .turnin 13041 >>交任务: |cRXP_FRIENDLY_完成订单|r
	.isQuestAvailable 13041
step
	.goto Dalaran,40.67,35.35
	.daily 12958,12959,12960,12961,12962,12963 >>接任务: |cRXP_WARN_货单：血玉护符|r, 与达拉然的提莫斯·琼斯交谈。接受任何可用的任务
	>>发货：血玉护身符——12958
	>>发货：发光象牙雕像——12959
	>>发货：邪恶太阳胸针——12960
	>>发货：精致的骨制雕像——12961
	>>发货：光明铠甲遗物——12962
	>>发货：Shifting Sun Curio——12963

-- Quest: 发货：血玉护身符——12958
step
	#completewith Amulet
	>>收集一块暗玉和一块血石，然后与维库护身符结合
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
	>>杀死风暴峭壁的女武神候选人，获得维库护身符
	.collect 41989,1 --Vrykul Amulet (1)
	.isOnQuest 12958
step
	#label Amulet
	.use 41989 >>使用背包中的维库护身符将暗玉和血石结合，打造血玉护身符
	.complete 12958,1 --Blood Jade Amulet (1)
	.isOnQuest 12958
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的蒂莫西·琼斯交谈
	.goto Dalaran,40.67,35.35
	.turnin 12958 >>交任务: |cRXP_FRIENDLY_货单：血玉护符|r
	.isQuestComplete 12958

-- Quest: 发货：发光象牙雕像——12959
step
	#completewith Ivory
	>>收集玉髓和暗影水晶，然后与北方象牙结合
	.collect 36923,1 --Chalcedony (1)
	.collect 36926,1 --Shadow Crystal (1)
	.isOnQuest 12959
step
	.goto Dragonblight,67.00,31.04,60,0
	.goto Dragonblight,65.94,36.65,60,0
	.goto Dragonblight,65.00,45.69,60,0
	.goto Dragonblight,56.41,48.12
	>>杀死龙骨荒野的瘦弱猛犸象以获取北方象牙
	.collect 42104,1 --Northern Ivory (1)
	.isOnQuest 12959
step
	#label Ivory
	.use 42104 >>使用包中的北方象牙将玉髓和暗影水晶结合起来，打造一个发光的象牙雕像
	.complete 12959,1 --Glowing Ivory Figurine (1)
	.isOnQuest 12959
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的蒂莫西·琼斯交谈
	.goto Dalaran,40.67,35.35
	.turnin 12959 >>交任务: |cRXP_FRIENDLY_货单：炽热鹿牙雕像|r
	.isQuestComplete 12959

-- Quest: 发货：邪恶太阳胸针——12960
step
	#completewith Brooch
	>>收集一颗巨大的黄水晶和一颗太阳水晶，然后与铁矮人胸针结合
	.collect 36929,1 --Huge Citrine (1)
	.collect 36920,1 --Sun Crystal (1)
	.isOnQuest 12960
step
	.goto TheStormPeaks,26.82,66.90,40,0
	.goto TheStormPeaks,26.13,66.93,30,0
	.goto TheStormPeaks,26.00,67.60,20,0
	.goto TheStormPeaks,26.82,66.90
	>>进入位于风暴峭壁的 Bor's Breath 洞穴。杀死风暴锻造矮人，获得铁矮人胸针
	.collect 42105,1 --Iron Dwarf Brooch (1)
	.isOnQuest 12960
step
	#label Brooch
	.use 42105 >>使用背包中的铁矮人胸针将巨大的黄水晶和太阳水晶结合起来，制作出邪恶太阳胸针
	.complete 12960,1 --Wicked Sun Brooch (1)
	.isOnQuest 12960
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的蒂莫西·琼斯交谈
	.goto Dalaran,40.67,35.35
	.turnin 12960 >>交任务: |cRXP_FRIENDLY_货单：邪恶太阳胸针|r
	.isQuestComplete 12960

-- Quest: 发货：精致的骨制雕像——12961
step
	#completewith Figurine
	>>收集太阳水晶和暗玉，然后与原始龙骨结合
	.collect 36920,1 --Sun Crystal (1)
	.collect 36932,1 --Dark Jade (1)
	.isOnQuest 12961
step
	.goto TheStormPeaks,45.77,67.09,60,0
	.goto TheStormPeaks,43.80,64.03,70,0
	.goto TheStormPeaks,45.80,62.52
	>>杀死风暴峭壁中的风暴峭壁原始幼龙，获得原始龙骨
	.collect 42106,1 --Proto Dragon Bone (1)
	.isOnQuest 12961
step
	#label Figurine
	.use 42106 >>使用包中的原龙骨将太阳水晶和暗玉结合起来，制作出精致的骨头雕像
	.complete 12961,1 --Intricate Bone Figurine (1)
	.isOnQuest 12961
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的蒂莫西·琼斯交谈
	.goto Dalaran,40.67,35.35
	.turnin 12961 >>交任务: |cRXP_FRIENDLY_货单：精致龙骨雕像|r
	.isQuestComplete 12961

-- Quest: 发货：光明铠甲遗物——12962
step
	#completewith Relic
	>>收集血石和巨大的黄水晶，然后与元素护甲碎片结合
	.collect 36917,1 --Bloodstone (1)
	.collect 36929,1 --Huge Citrine (1)
	.isOnQuest 12962
step
	.goto Dragonblight,57.83,14.22,50,0
	.goto Dragonblight,58.62,16.39,50,0
	.goto Dragonblight,54.77,19.10
	>>杀死龙骨荒野的冰晶元素，获得元素护甲碎片
	.collect 42107,1 --Elemental Armor Scrap (1)
	.isOnQuest 12962
step
	#label Relic
	.use 42107 >>使用包中的元素护甲碎片将血石和巨大的黄水晶结合起来，打造一件明亮的护甲遗物
	.complete 12962,1 --Bright Armor Relic (1)
	.isOnQuest 12962
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的蒂莫西·琼斯交谈
	.goto Dalaran,40.67,35.35
	.turnin 12962 >>交任务: |cRXP_FRIENDLY_货单：光芒护甲圣物|r
	.isQuestComplete 12962

-- Quest: 发货：Shifting Sun Curio——12963
step
	#completewith Curio
	>>收集太阳水晶和暗影水晶，然后与天灾古玩结合
	.collect 36920,1 --Sun Crystal (1)
	.collect 36926,1 --Shadow Crystal (1)
	.isOnQuest 12963
step
	.goto Icecrown,70.77,68.13,50,0
	.goto Icecrown,68.66,68.07
	>>杀死冰冠冰川中的巨型憎恶或邪恶的亡灵法师，获得天灾奇珍
	.collect 42108,1 --Scourge Curio (1)
	.isOnQuest 12963
step
	#label Curio
	.use 42108 >>使用背包中的天灾奇珍，将太阳水晶和暗影水晶结合起来，制作出变幻太阳奇珍
	.complete 12963,1 --Shifting Sun Curio (1)
	.isOnQuest 12963
step << Mage
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
step
	>>与达拉然的蒂莫西·琼斯交谈
	.goto Dalaran,40.67,35.35
	.turnin 12963 >>交任务: |cRXP_FRIENDLY_货单：光芒护甲圣物|r
	.isQuestComplete 12963
step
	>>您已完成今天的珠宝加工日常任务
]])
