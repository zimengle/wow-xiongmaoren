RXPGuides.RegisterGuide([[
#version 1
#group +休息经验 诺森德每日任务
#subgroup 派系每日任务
#wotlk
#cata
#name 卡鲁亚克日常任务

step
	>>前往龙骨荒野的莫亚基港。与毛伊交谈
    .daily 11960 >>接任务: |cRXP_LOOT_未来的种子|r
    .goto Dragonblight,48.25,74.35
step
    .goto Dragonblight,47.4,64.3,40,0
    .goto Dragonblight,47.2,61.5,40,0
    .goto Dragonblight,45.2,61.6
	>>右键点击小屋附近的小狼獾人幼崽
    .complete 11960,1 --降雪林地小狗 (12)
	.isOnQuest 11960
step
	>>返回莫亚基港。与毛伊交谈
    .turnin 11960 >>交任务: |cRXP_FRIENDLY_未来的种子|r
    .goto Dragonblight,48.25,74.35
	.isQuestComplete 11960
step
	>>前往北风苔原的卡斯卡拉。与乌泰克交谈
    .daily 11945 >>接任务: |cRXP_LOOT_做最坏的打算|r
    .goto BoreanTundra,63.95,45.72
step
    .goto BoreanTundra,66.2,45.9,60,0
    .goto BoreanTundra,63.7,52.2
	>>抢劫村庄周围的小篮子
	.complete 11945,1 --Kaskala Supplies (8)
    .isOnQuest 11945
step
	>>返回乌泰克
    .turnin 11945 >>交任务: |cRXP_FRIENDLY_做最坏的打算|r
    .goto BoreanTundra,63.95,45.72
    .isQuestComplete 11945
step
	>>前往嚎风峡湾的卡玛古。与阿努尼亚交谈
    .daily 11472 >>接任务: |cRXP_LOOT_心心相印……|r
	.goto HowlingFjord,24.59,58.87
step
    .goto HowlingFjord,31.2,74.8,30,0
    .goto HowlingFjord,30.96,71.85
	.use 40946 >>使用包中的 Anuniaq 渔网捕捞该地区的美味珊瑚鱼群，捕获大约 7-8 条美味珊瑚鱼。大约投网 2 次即可捕获
	.use 34127 >>将美味礁鱼以最大射程扔向礁牛，它现在会去到你站立的地方
	>>把它带到海岸线另一边的 Reef Cow 上面
	>>如果你没有鱼了，再买 7-8 条，再试一次
    .complete 11472,1 --Reef Bull led to a Reef Cow (1)
	.isOnQuest 11472
step
    .goto HowlingFjord,24.59,58.87
	>>与阿努尼亚克交谈
    .turnin 11472 >>交任务: |cRXP_FRIENDLY_心心相印……|r
	.isQuestComplete 11472
]])
