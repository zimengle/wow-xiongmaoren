RXPGuides.RegisterGuide([[
#version 1
#group +休息经验 诺森德每日任务
#subgroup 派系每日任务
#wotlk
#cata
#name 黑锋骑士团每日任务路线

step
	+要解锁黑锋骑士团的日常任务，您必须先完成冰冠冰川中的任务链。请使用黑锋骑士团解锁日常任务指南来解锁日常任务
	.isQuestAvailable 12814

-- 3 Quests from The Shadow Vault
step
	>>从暗影宝库接受 3 个日常任务
    >>与 Silver 交谈
	.daily 12995 >>接任务: |cRXP_LOOT_彰显军威|r
	.goto Icecrown,42.84,24.92
	>>与跳跃者交谈。他在帐篷周围走来走去
	.daily 13069 >>接任务: |cRXP_LOOT_把它们打下来！|r
	.goto IcecrownGlacier,43.5,25.0
	>>与 Vile 交谈，他是一个在入口和主楼之间的道路上巡逻的怪物
    .daily 13071 >>接任务: |cRXP_LOOT_维尔喜欢火焰！|r
    .goto IcecrownGlacier,42.7,26.8,60,0
    .goto IcecrownGlacier,43.6,24.1
step
    .goto IcecrownGlacier,29.5,43.4,50,0
    .goto IcecrownGlacier,29.6,45.7,50,0
    .goto IcecrownGlacier,27.9,45.8,50,0
    .goto IcecrownGlacier,27.8,40.2,50,0
    .goto IcecrownGlacier,28.3,38.0,50,0
    .goto IcecrownGlacier,29.0,35.1,50,0
    .goto IcecrownGlacier,34.1,28.7,50,0
    .goto IcecrownGlacier,29.5,43.4
	.use 42480 >>杀死该区域的维库人。使用背包中的黑锋之刃旗帜攻击他们的尸体
    .complete 12995,1--Ebon Blade Banner planted near Vrykul corpse (15)
	.isOnQuest 12995
step
    .goto IcecrownGlacier,27.9,33.2
	>>在鱼叉内，垃圾邮件使用“快速射击鱼叉”（3）击落龙
	.complete 13069,1 --Jotunheim Proto-Drakes & their riders shot down
	.isOnQuest 13069
step
	#completewith next
    .goto IcecrownGlacier,28.0,37.7
    .vehicle 30564 >>右键点击 Njorndar Proto-Drake 来骑上它
	.isOnQuest 13071
step
    .goto IcecrownGlacier,27.7,41.1,70,0
    .goto IcecrownGlacier,29.2,41.0,70,0
    .goto IcecrownGlacier,29.6,39.7,70,0
    .goto IcecrownGlacier,31.5,36.9,70,0
    .goto IcecrownGlacier,32.0,39.1,70,0
    .goto IcecrownGlacier,30.8,40.2,70,0
    .goto IcecrownGlacier,32.4,40.7,70,0
    .goto IcecrownGlacier,31.5,43.9,70,0
    .goto IcecrownGlacier,30.1,43.1,70,0
    .goto IcecrownGlacier,27.7,41.1
	>>使用冷却中的“速度爆发”(1) 来加快移动速度。使用“扫射约顿海姆建筑”(3) 来点燃建筑物
    .complete 13071,1 --Vrykul buildings set ablaze (8)
	.isOnQuest 13071
step
    >>返回暗影地窖。与 Silver、跳跃者和 Vile 交谈
	.turnin 12995 >>交任务: |cRXP_FRIENDLY_彰显军威|r
	.goto Icecrown,42.84,24.92
    .turnin 13069 >>交任务: |cRXP_FRIENDLY_把它们打下来！|r
	.goto IcecrownGlacier,43.5,25.0
    .turnin 13071 >>交任务: |cRXP_FRIENDLY_维尔喜欢火焰！|r
    .goto IcecrownGlacier,43.6,24.1,60,0
    .goto IcecrownGlacier,42.7,26.8

-- 3 Quests from Death's Rise
step
	>>从死亡崛起接受 3 个日常任务
	>>与塞塔尔交谈
	.daily 12813 >>接任务: |cRXP_LOOT_转化尸体|r
	.goto Icecrown,19.67,48.39
	>>与野牛交谈。他在中间的火堆周围巡逻
    .daily 12838 >>接任务: |cRXP_LOOT_收集情报|r
    .goto IcecrownGlacier,20.1,47.5,20,0
    .goto IcecrownGlacier,20.4,47.9,20,0
    .goto IcecrownGlacier,20.1,48.4,20,0
    .goto IcecrownGlacier,19.7,47.9
	>>与乌佐交谈
    .daily 12815 >>接任务: |cRXP_LOOT_禁飞区|r
	.goto Icecrown,19.64,47.80
step
	#sticky
	#label Gryphon
	.goto IcecrownGlacier,10.5,44.1,70,0
    .goto IcecrownGlacier,5.0,43.4,70,0
    .goto IcecrownGlacier,10.5,39.0,70,0
    .goto IcecrownGlacier,12.7,41.2,70,0
    .goto IcecrownGlacier,10.5,44.1
	>>杀死该区域的狮鹫骑士。使用远程技能将其击落，或将其中的多个狮鹫骑士聚集在空中，然后飞下来杀死它们
    .complete 12815,1 --Onslaught Gryphon Rider (10)
	.isOnQuest 12815
step
    #completewith next
	.goto IcecrownGlacier,9.5,44.8,50,0
    .goto IcecrownGlacier,9.5,44.8,0,0
	.use 40587 >>杀死该区域的猛攻怪物。使用背包中的黑暗治愈者酊剂对付他们的尸体
    .complete 12813,1 --Scarlet Onslaught corpse transformed (10)
	.isOnQuest 12813
step
	>>杀死猛攻怪物，然后掠夺他们的钥匙。使用它们打开猛攻港口周围的箱子，获取文件
	>>箱子里的文件的掉落率并非 100%
    .goto IcecrownGlacier,10.7,45.6,40,0
    .goto IcecrownGlacier,10.3,46.4,40,0
    .goto IcecrownGlacier,8.8,46.7,40,0
    .goto IcecrownGlacier,8.8,42.2,40,0
    .goto IcecrownGlacier,10.6,42.9,40,0
    .goto IcecrownGlacier,9.6,40.6,40,0
    .goto IcecrownGlacier,9.3,37.5,40,0
    .goto IcecrownGlacier,10.1,36.2,40,0
    .goto IcecrownGlacier,9.1,36.3,40,0
    .goto IcecrownGlacier,8.5,36.4,40,0
    .goto IcecrownGlacier,10.7,45.6,40,0
    .goto IcecrownGlacier,10.3,46.4,40,0
    .goto IcecrownGlacier,8.8,46.7,40,0
    .goto IcecrownGlacier,8.8,42.2,40,0
    .goto IcecrownGlacier,10.6,42.9,40,0
    .goto IcecrownGlacier,9.6,40.6,40,0
    .goto IcecrownGlacier,9.3,37.5,40,0
    .goto IcecrownGlacier,10.1,36.2,40,0
    .goto IcecrownGlacier,9.1,36.3,40,0
    .goto IcecrownGlacier,8.5,36.4
	.collect 40652,6,12838,-1
    .complete 12838,1 --Onslaught Intel Documents (5)
	.isOnQuest 12838
step
	.goto IcecrownGlacier,9.5,44.8,50,0
    .goto IcecrownGlacier,9.5,44.8,0,0
	.use 40587 >>杀死该区域的猛攻怪物。使用背包中的黑暗治愈者酊剂对付他们的尸体
    .complete 12813,1 --Scarlet Onslaught corpse transformed (10)
	.isOnQuest 12813
step
	#requires Gryphon
	>>返回死亡高地。与乌佐、塞塔尔和奥罗克斯交谈
    .turnin 12815 >>交任务: |cRXP_FRIENDLY_禁飞区|r
    .goto Icecrown,19.64,47.80
    .turnin 12813 >>交任务: |cRXP_FRIENDLY_转化尸体|r
    .goto Icecrown,19.67,48.39
    .turnin 12838 >>交任务: |cRXP_FRIENDLY_收集情报|r
    .goto IcecrownGlacier,20.1,47.5,20,0
    .goto IcecrownGlacier,20.4,47.9,20,0
    .goto IcecrownGlacier,20.1,48.4,20,0
    .goto IcecrownGlacier,19.7,47.9
step
	+您已完成今天的所有黑锋骑士日常任务 :) 请记住，您可以在进行 WotLK 地下城时穿着他们的战袍来获得额外的声望！
]])
