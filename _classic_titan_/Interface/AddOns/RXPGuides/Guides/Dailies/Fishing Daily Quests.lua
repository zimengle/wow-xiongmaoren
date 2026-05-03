RXPGuides.RegisterGuide([[
#version 1
#group +休息经验 诺森德每日任务
#subgroup 专业日常任务
#wotlk
#cata
#name 钓鱼

step
	.goto Dalaran,53.04,64.95
	.daily 13830,13832,13833,13834,13836, >>接任务: |cRXP_WARN_幽灵鱼|r, 与达拉然的玛西娅·切斯交谈。接受任何可用的任务
	>>幽灵鱼——13830
	>>下水道的珍宝 -- 13832
	>>血浓于水 -- 13833
	>>危险的美味 -- 13834
	>>解除武装！--13836

-- Quest: 危险的美味 -- 13834
step << Alliance
	#completewith next
	>>记得买一些小饰品挂在你的钓鱼竿上
	.fly Valiance Landing Camp >>与 Aludane 交谈以飞往 Wintergrasp - 从 dala 到 valiance 登陆营地的自动飞行不起作用 (wg)
	.goto Dalaran,72.18,45.78,20,0
	.isOnQuest 13834
step << Horde
	#completewith next
	>>记得买一些小饰品挂在你的钓鱼竿上
	.fly Warsong Camp, Wintergrasp>>与阿鲁丹交谈，飞往冬拥湖——从达拉到战歌营地的自动飞行不起作用（wg）
	.goto Dalaran,72.18,45.78,20,0
	.isOnQuest 13834
step
	.goto Wintergrasp,79.57,46.92,-1
	.goto Wintergrasp,79.88,41.38,-1
	.zone Wintergrasp >>前往: |cRXP_PICK_冬拥湖|r
	.isOnQuest 13834
step << Alliance
	>>在冬拥湖的任何地方钓恐怖鱼
	.goto Wintergrasp,71.05,36.85,-1
	.goto Wintergrasp,79.57,46.92,-1
	.goto Wintergrasp,79.88,41.38,-1
	.complete 13834,1 --Terrorfish (10)
	.isOnQuest 13834
step << Horde
	>>在冬拥湖的任何地方钓恐怖鱼
	.goto Wintergrasp,22.62,37.33,-1
	.goto Wintergrasp,79.57,46.92,-1
	.goto Wintergrasp,79.88,41.38,-1
	.complete 13834,1 --Terrorfish (10)
	.isOnQuest 13834
step << Alliance
	#completewith next
	.fly Dalaran >>飞往达拉然
	.goto Wintergrasp,71.98,30.95
	.isOnQuest 13834
step << Horde
	#completewith next
	.fly Dalaran >>飞往达拉然
	.goto Wintergrasp,21.62,34.96
	.isOnQuest 13834
step
	>>与达拉然的玛西娅·蔡斯交谈
	.goto Dalaran,53.04,64.95
	.turnin 13834 >>交任务: |cRXP_FRIENDLY_危险的美食|r
	.isQuestComplete 13834

-- Quest: 幽灵鱼——13830
step
	#completewith next
	>>记得买一些小饰品挂在你的钓鱼竿上
	.fly River's Heart >>与阿鲁丹交谈，飞往索拉查盆地
	.goto Dalaran,72.18,45.78,15,0
	.isOnQuest 13830
step
	.goto SholazarBasin,49.40,62.13
	.zone SholazarBasin >>前往索拉查盆地
	.isOnQuest 13830
step
	#completewith next
	>>在河心钓幽灵鱼
	.goto SholazarBasin,49.40,62.13
	.collect 45902,1 --Phantom Ghostfish (1)
	.isOnQuest 13830
step
	.use 45902 >>吃掉包里的幽灵鱼
	.complete 13830,1 --Discover the Ghostfish mystery (1)
	.isOnQuest 13830
step
	#completewith next
	.fly Dalaran >>飞往达拉然
	.goto SholazarBasin,50.13,61.36
	.isOnQuest 13830
step
	>>与达拉然的玛西娅·蔡斯交谈
	.goto Dalaran,53.04,64.95
	.turnin 13834 >>交任务: |cRXP_FRIENDLY_危险的美食|r
	.isQuestComplete 13830

-- Quest: 下水道的珍宝 -- 13832
step
	>>记得买一些小饰品挂在你的钓鱼竿上
	>>进入达拉然下水道。钓起腐蚀的珠宝
	.goto Dalaran,35.31,45.28,10,0
	.goto 126,22.66,41.71,10,0
	.goto 126,37.06,48.02
	.complete 13832,1 --Corroded Jewelry (1)
	.isOnQuest 13832
step
	>>与达拉然的玛西娅·蔡斯交谈
	.goto 126,22.66,41.71,10,0
	.goto Dalaran,35.31,45.28,10,0
	.goto Dalaran,53.04,64.95
	.turnin 13832 >>交任务: |cRXP_FRIENDLY_下水道中的珍宝|r
	.isQuestComplete 13832

-- Quest: 解除武装！--13836
step
	>>记得买一些小饰品挂在你的钓鱼竿上
	>>在达拉然的紫罗兰堡外钓取肿胀的滑溜鳗鱼
	.goto Dalaran,62.16,67.18
	.collect 45328,1 -- Bloated Slippery Eel (1)
	.isOnQuest 13836
step
	.use 45328 >>打开背包里的肿胀滑溜鳗鱼，拾取断臂
	.complete 13836,1 --Severed Arm (1)
	.isOnQuest 13836
step
	>>与达拉然的奥利萨拉交谈
	.goto Dalaran,36.58,37.33
	.turnin 13836 >>交任务: |cRXP_FRIENDLY_胳膊丢了！|r
	.isQuestComplete 13836

-- Quest: 血浓于水 -- 13833
step << Alliance
	#completewith next
	>>记得买一些小饰品挂在你的钓鱼竿上
	.fly Une'pe >>与 Aludane 交谈，飞往北风苔原的 Une'pe
	.goto Dalaran,72.18,45.78,20,0
	.isOnQuest 13833
step << Horde
	#completewith next
	>>记得买一些小饰品挂在你的钓鱼竿上
	.fly Taunka'le >>与阿鲁丹交谈，飞往北风苔原的陶卡雷
	.goto Dalaran,72.18,45.78,20,0
	.isOnQuest 13833
step
	.goto BoreanTundra,75.56,42.01
	.zone BoreanTundra >>前往北风苔原
	.isOnQuest 13833
step -- WIP. Currently no check for debuff. If they get debuff @ first WP then it will point to the next 2 WP's before pointing to the sea to start fishing
	>>杀死北风苔原中的任意动物都会使你受到动物血液减益效果
	>>跳入水中消除减益效果，水中会形成一滩血
	.goto BoreanTundra,75.56,42.01,60,0
	>>从这血池中钓出血牙狂暴鱼
	.complete 13833,1 --Bloodtooth Frenzy (5)
	.goto BoreanTundra,82.28,49.62,-1
	.goto BoreanTundra,79.22,51.61,-1
	.isOnQuest 13833
step
	#completewith next
	.fly Dalaran >>飞往达拉然
	.goto BoreanTundra,78.54,51.53
	.isOnQuest 13833
step
	>>与达拉然的玛西娅·蔡斯交谈
	.goto Dalaran,53.04,64.95
	.turnin 13834 >>交任务: |cRXP_FRIENDLY_危险的美食|r
	.isQuestComplete 13833
step
	+您已完成今天的钓鱼每日任务
]])
