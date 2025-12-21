RXPGuides.RegisterGuide([[
#version 1
#group +RestedXP 诺森德日常任务
#subgroup 阵营日常任务
#wotlk
#cata
#name 卡鲁亚克日常任务
#displayname 卡鲁亚克日常任务 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
	>>前往龙骨荒野的莫阿基港. 与毛伊交谈
    .daily 11960 >>接任务: |cRXP_LOOT_未来的种子|r
    .goto Dragonblight,48.25,74.35
step
    .goto Dragonblight,47.4,64.3,40,0
    .goto Dragonblight,47.2,61.5,40,0
    .goto Dragonblight,45.2,61.6
	>>右键点击小屋附近的小狼人幼崽
    .complete 11960,1 --Snowfall Glade Pup (12)
	.isOnQuest 11960
step
	>>返回莫阿基港, 与毛伊交谈
    .turnin 11960 >>交任务: |cRXP_FRIENDLY_未来的种子|r
    .goto Dragonblight,48.25,74.35
	.isQuestComplete 11960
step
	>>前往北风苔原的卡斯卡拉. 与乌泰克交谈
    .daily 11945 >>接任务: |cRXP_LOOT_做最坏的打算|r
    .goto BoreanTundra,63.95,45.72
step
    .goto BoreanTundra,66.2,45.9,60,0
    .goto BoreanTundra,63.7,52.2
	>>搜刮村庄周围的小篮子
	.complete 11945,1 --Kaskala Supplies (8)
    .isOnQuest 11945
step
	>>返回乌泰克
    .turnin 11945 >>交任务: |cRXP_FRIENDLY_做最坏的打算|r
    .goto BoreanTundra,63.95,45.72
    .isQuestComplete 11945
step
	>>前往嚎风峡湾的卡玛古. 与阿努尼亚交谈
    .daily 11472 >>接任务: |cRXP_LOOT_心心相印……|r
	.goto HowlingFjord,24.59,58.87
step
    .goto HowlingFjord,31.2,74.8,30,0
    .goto HowlingFjord,30.96,71.85
	.use 40946 >>在该区域的美味暗礁鱼群中, 使用背包中的阿努尼亚克渔网进行投掷, 可捕获约7-8条美味暗礁鱼. 大约投网2次即可完成任务
	.use 34127 >>将美味礁鱼以最大射程投向雄性暗礁海狮, 它就会飞到你所在的位置
	>>把它带到海岸线另一侧的雌性暗礁海狮身上
	>>如果你的鱼用完了, 再拿7-8条试试
    .complete 11472,1 --Reef Bull led to a Reef Cow (1)
	.isOnQuest 11472
step
    .goto HowlingFjord,24.59,58.87
	>>与阿努尼克交谈
    .turnin 11472 >>交任务: |cRXP_FRIENDLY_心心相印……|r
	.isQuestComplete 11472
]])
