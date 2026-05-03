RXPGuides.RegisterGuide([[
#version 1
#group +休息经验 诺森德每日任务
#subgroup 派系每日任务
#wotlk
#cata
#name 黑锋骑士团解锁每日任务

step
    +您已完成黑锋骑士团前期任务链。请使用黑锋骑士团每日任务路线指南来完成每日任务。
	.isQuestTurnedIn 12814

step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>飞往“破天者”号，这是一艘在高空飞行的大型联盟飞船
	>>与船左后角的萨萨里安交谈
    .accept 12887 >>接任务: |cRXP_LOOT_乐趣十足|r
step << Horde
	.goto Icecrown,62.58,45.04
	>>飞往奥格瑞姆之锤，一艘在空中高高飞翔的大型部落飞船
	>>与船前室的 库尔迪拉·死亡编织者 交谈
    .accept 12892 >>接任务: |cRXP_LOOT_乐趣十足|r
step
    .goto IcecrownGlacier,44.5,21.6
	.use 41265 >>飞到塔顶。使用背包里的 Eyesore Blaster 攻击 Ocular，直到它死亡
    .complete 12887,1 << Alliance --The Ocular has been destroyed (1)
    .complete 12892,1 << Horde --The Ocular has been destroyed (1)
step
    .goto IcecrownGlacier,44.1,24.7
	>>飞到地面上的 Baron Silver 那里。和他交谈
    .turnin 12887 >>交任务: |cRXP_FRIENDLY_乐趣十足|r << Alliance
    .turnin 12892 >>交任务: |cRXP_FRIENDLY_乐趣十足|r << Horde
    .accept 12891 >>接任务: |cRXP_LOOT_我有一计……|r
step
	>>杀死游魂并掠夺他们的绳索，杀死憎恶并掠夺他们的钩子，杀死邪教徒并掠夺他们的魔杖，杀死亡灵怪物并掠夺他们的精华
    .complete 12891,1 --Cultist Rod (1)
    .goto IcecrownGlacier,43.8,24.2,40,0
    .goto IcecrownGlacier,43.6,25.1,40,0
    .goto IcecrownGlacier,43.7,25.4,40,0
    .goto IcecrownGlacier,42.5,25.1,40,0
    .goto IcecrownGlacier,42.3,26.1
    .complete 12891,3 --Geist Rope (1)
    .goto IcecrownGlacier,43.4,25.6,40,0
    .goto IcecrownGlacier,43.3,26.6,40,0
    .goto IcecrownGlacier,42.5,26.4,40,0
    .goto IcecrownGlacier,42.9,24.5
    .complete 12891,2 --Abomination Hook (1)
    .goto IcecrownGlacier,43.3,24.1,40,0
    .goto IcecrownGlacier,43.5,26.2,40,0
    .goto IcecrownGlacier,42.5,28.1,40,0
    .goto IcecrownGlacier,42.7,25.7
   .complete 12891,4 --Scourge Essence (5)
    .goto IcecrownGlacier,43.6,24.1,40,0
    .goto IcecrownGlacier,42.6,27.2,40,0
    .goto IcecrownGlacier,42.3,26.1
step
    .goto IcecrownGlacier,44.2,24.6
	>>重返银牌
    .turnin 12891 >>交任务: |cRXP_FRIENDLY_我有一计……|r
    .accept 12893 >>接任务: |cRXP_LOOT_解放你的思想|r
step
    .goto IcecrownGlacier,44.4,27.0
	.use 41366 >>杀死 Vile。用 Sovereign Rod 攻击他的尸体
    .complete 12893,1 --Vile turned (1)
step
    .goto IcecrownGlacier,41.8,24.5
	.use 41366 >>杀死奈茨伍德夫人。用君主权杖攻击她的尸体
    .complete 12893,2 --Lady Nightswood turned (1)
step
    .goto IcecrownGlacier,43.0,23.5,70,0
    .goto IcecrownGlacier,44.8,24.3,70,0
    .goto IcecrownGlacier,46.2,21.9,70,0
    .goto IcecrownGlacier,45.7,19.7,70,0
    .goto IcecrownGlacier,43.7,19.0,70,0
    .goto IcecrownGlacier,42.6,21.1
	.use 41366 >>杀死跳跃者。用君主之杖攻击他的尸体。他在主楼楼外的上层走来走去。
    .complete 12893,3 --The Leaper turned (1)
	.unitscan The Leaper
step
	#label Freemind
    .goto IcecrownGlacier,44.2,24.7
	>>重返银牌
    .turnin 12893 >>交任务: |cRXP_FRIENDLY_解放你的思想|r
    .accept 12896 >>接任务: |cRXP_LOOT_顽固的敌人|r << Alliance
    .accept 12897 >>接任务: |cRXP_LOOT_顽固的敌人|r << Horde
step
    .goto IcecrownGlacier,44.7,19.8
	>>进入建筑，点击将军的武器架。小心，因为这会生成一个精英。杀死 Lightsbane 将军
    .complete 12896,1 << Alliance --General Lightsbane (1)
    .complete 12897,1 << Horde --General Lightsbane (1)
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>飞回破天者号。与船左后角的萨萨里安交谈
    .turnin 12896 >>交任务: |cRXP_FRIENDLY_顽固的敌人|r
    .accept 12898 >>接任务: |cRXP_LOOT_暗影拱顶|r
step << Horde
	>>飞回奥格瑞姆之锤。与船前室的库尔迪拉·死亡织者交谈
    .turnin 12897 >>交任务: |cRXP_FRIENDLY_顽固的敌人|r
    .accept 12899 >>接任务: |cRXP_LOOT_暗影拱顶|r
step
    .goto IcecrownGlacier,42.8,24.9
	>>返回 Baron Silver
	.turnin 12898 >>交任务: |cRXP_FRIENDLY_暗影拱顶|r << Alliance
    .turnin 12899 >>交任务: |cRXP_FRIENDLY_暗影拱顶|r << Horde
    .accept 12938 >>接任务: |cRXP_LOOT_公爵|r
step
	#completewith next
    .goto IcecrownGlacier,43.7,24.4
    .fp The Shadow Vault >>获取暗影地窖飞行路线
step
    .goto IcecrownGlacier,44.7,20.3
	>>进入建筑内。与兰克拉尔交谈
    .turnin 12938 >>交任务: |cRXP_FRIENDLY_公爵|r
    .accept 12939 >>接任务: |cRXP_LOOT_荣耀的挑战|r
step
    .goto Icecrown,43.60,25.13
	>>与跳跃者交谈，他在帐篷周围走动
    .accept 12955 >>接任务: |cRXP_LOOT_消灭竞争者|r
step
    .goto IcecrownGlacier,37.5,24.7,0,0
	#sticky
	#label mjordincombat
	.use 41372 >>在远处对 Mjordin 战斗员使用挑战旗帜。只要您不参与战斗，就可以同时挑战多名战斗员（但每 2 人组只能挑战 1 名战斗员）
    .complete 12939,1 --Mjordin Combatants challenged and defeated (6)
step
	>>飞往野蛮岩架
	>>与野蛮岩架上的丁奇、西格丽德、奥努祖和埃弗雷姆交谈。击败他们
    .complete 12955,4 --Tinky Wickwhistle defeated (1)
    .goto IcecrownGlacier,36.1,23.6
    .complete 12955,1 --Sigrid Iceborn defeated (1)
    .goto IcecrownGlacier,37.1,22.4
    .complete 12955,3 --Onu'zun defeated (1)
    .goto IcecrownGlacier,37.9,22.9
    .complete 12955,2 --Efrem the Faithful defeated (1)
    .goto IcecrownGlacier,37.9,25.1
	.skipgossip
step
    .goto IcecrownGlacier,43.5,25.0
	>>返回 Leaper
    .turnin 12955 >>交任务: |cRXP_FRIENDLY_消灭竞争者|r
step
    .goto IcecrownGlacier,44.7,20.3
	>>进入建筑内。与兰克拉尔交谈
    .turnin 12939 >>交任务: |cRXP_FRIENDLY_荣耀的挑战|r
    .accept 12943 >>接任务: |cRXP_LOOT_暗影拱顶裁决令|r
step
	#completewith next
    .goto IcecrownGlacier,39.01,23.99,25 >>通往乌弗朗大厅的道路从这里开始
step
    .goto IcecrownGlacier,41.0,23.9
	>>回到野蛮岩架，然后进入乌弗朗大厅。与被锁在里面的瓦伦交谈
    .accept 12949 >>接任务: |cRXP_LOOT_夺取钥匙|r
step
    .goto IcecrownGlacier,40.3,23.9
	.use 41776 >>在 Thane 面前使用背包中的暗影穹顶法令。杀死他。
    .complete 12943,1 --Thane Ufrang the Mighty (1)
step
    .goto IcecrownGlacier,37.7,23.9,70,0
    .goto IcecrownGlacier,36.7,23.7
	>>回到外面的野蛮岩架。杀死正在巡逻的教官 Hroegar。搜刮他的钥匙
    .complete 12949,1 --Key to Vaelen's Chains (1)
	.unitscan Instructor Hroegar
step
    .goto IcecrownGlacier,41.0,23.9
	>>回到 Ufrang 的大厅。返回 Vaelen
    .turnin 12949 >>交任务: |cRXP_FRIENDLY_夺取钥匙|r
    .accept 12951 >>接任务: |cRXP_LOOT_通知男爵|r
step
    .goto IcecrownGlacier,39.01,23.99,25,0
    .goto IcecrownGlacier,42.9,24.9
	>>离开大厅。返回 Baron Silver
    .turnin 12951 >>交任务: |cRXP_FRIENDLY_通知男爵|r
    .daily 12995 >>接任务: |cRXP_LOOT_彰显军威|r
    .accept 13085 >>接任务: |cRXP_LOOT_维林回来了|r
step
    .goto IcecrownGlacier,43.6,24.1,60,0
    .goto IcecrownGlacier,42.7,26.8
	>>与在主干道上巡逻的 Vile 交谈
    .accept 12992 >>接任务: |cRXP_LOOT_干掉那些维库人！|r
step
    .goto IcecrownGlacier,43.8,23.3,30,0
    .goto IcecrownGlacier,43.1,21.1
	>>进入建筑内部。与左边的 Vaelen 交谈
    .turnin 13085 >>交任务: |cRXP_FRIENDLY_维林回来了|r
    .accept 12982 >>接任务: |cRXP_LOOT_黑锋囚犯|r
step
    .goto IcecrownGlacier,44.7,20.4
	>>与兰克拉尔交谈
    .turnin 12943 >>交任务: |cRXP_FRIENDLY_暗影拱顶裁决令|r
    .accept 13084 >>接任务: |cRXP_LOOT_破坏尤顿海姆|r
step
    .goto IcecrownGlacier,29.5,43.4,50,0
    .goto IcecrownGlacier,29.6,45.7,50,0
    .goto IcecrownGlacier,27.9,45.8,50,0
    .goto IcecrownGlacier,27.8,40.2,50,0
    .goto IcecrownGlacier,28.3,38.0,50,0
    .goto IcecrownGlacier,29.0,35.1,50,0
    .goto IcecrownGlacier,34.1,28.7,50,0
    .goto IcecrownGlacier,29.5,43.4
	.use 42480 >>杀死该地区的维库人并掠夺他们的笼子钥匙。使用背包中的黑刃旗帜对着他们的尸体。点击在约腾海姆各处找到的笼子上掠夺的任何钥匙
	>>烧毁约腾海姆各处的旗帜
	.collect 42422,8,12982,1,-1 --Jotunheim Cage Key (8)
    .complete 12982,1 --Ebon Blade Prisoners set free (8)
    .complete -12995,1 --Ebon Blade Banner planted near Vrykul corpse (0/15)
    .complete 12992,1 --Jotunheim Vrykul slain (0/15)
    .complete 13084,1 --Vrykul banners burned (10)
step
    .goto IcecrownGlacier,42.7,26.8,60,0
    .goto IcecrownGlacier,43.6,24.1
	>>返回暗影地窖。与在主干道上巡逻的维尔交谈
    .turnin 12992 >>交任务: |cRXP_FRIENDLY_干掉那些维库人！|r
    .daily 13071 >>接任务: |cRXP_LOOT_维尔喜欢火焰！|r
step
    .goto IcecrownGlacier,43.8,23.3,30,0
    .goto IcecrownGlacier,43.1,21.1
	>>进入建筑内部。与左边的 Vaelen 交谈
    .turnin 12982 >>交任务: |cRXP_FRIENDLY_黑锋囚犯|r
step
    .goto IcecrownGlacier,44.7,20.4
	>>与兰克拉尔交谈
    .turnin 13084 >>交任务: |cRXP_FRIENDLY_破坏尤顿海姆|r
step
    .goto IcecrownGlacier,42.9,24.9
    >>重返银牌
	.turnin 12995 >>交任务: |cRXP_FRIENDLY_彰显军威|r
	.isQuestComplete 12995
step
    .goto IcecrownGlacier,42.9,24.9
	>>与 Silver 交谈
    .accept 12806 >>接任务: |cRXP_LOOT_全速赶往死亡高地！|r
step
    .goto IcecrownGlacier,43.5,25.0
	>>与跳跃者交谈，他在帐篷周围走动
    .daily 13069 >>接任务: |cRXP_LOOT_把它们打下来！|r
step
    .goto IcecrownGlacier,27.9,33.2
	>>进入位于中心位置的约顿海姆速射鱼叉之一。
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
    .goto IcecrownGlacier,19.5,48.1
	>>下龙，然后前往死亡之巅。这是位于海平面和山顶中间的一个小平台。与阿雷特交谈
    .turnin 12806 >>交任务: |cRXP_FRIENDLY_全速赶往死亡高地！|r
    .accept 12807 >>接任务: |cRXP_LOOT_迄今为止的故事……|r
step
    .goto IcecrownGlacier,19.5,48.1
	>>再次与指挥官阿雷特交谈
    .complete 12807,1 --Lord-Commander Arete's tale listened to. (1)
    .turnin 12807 >>交任务: |cRXP_FRIENDLY_迄今为止的故事……|r
    .accept 12810 >>接任务: |cRXP_LOOT_水中之血|r
	.skipgossip
step
	#sticky
	#label DeathRise
    .goto IcecrownGlacier,19.3,47.8
    .fp Death's Rise >>获取死亡崛起飞行路线
step
	>>与塞塔尔交谈
    .daily 12813 >>接任务: |cRXP_LOOT_转化尸体|r
    .goto Icecrown,19.67,48.39
	>>与野牛交谈。他在中间的火堆周围巡逻
    .daily 12838 >>接任务: |cRXP_LOOT_收集情报|r
    .goto IcecrownGlacier,20.1,47.5,20,0
    .goto IcecrownGlacier,20.4,47.9,20,0
    .goto IcecrownGlacier,20.1,48.4,20,0
    .goto IcecrownGlacier,19.7,47.9
	>>可选。您可以跳过或完成这 2 个每日任务
step
	#requires DeathRise
    #sticky
	#label transformedcorpse
    .goto IcecrownGlacier,9.5,44.8,50,0
    .goto IcecrownGlacier,9.5,44.8,0,0
	.use 40587 >>杀死该区域的猛攻怪物。使用背包中的黑暗治愈者酊剂对付他们的尸体
    .complete 12813,1 --Scarlet Onslaught corpse transformed (10)
	.isOnQuest 12813
step
	#requires DeathRise
	>>杀死猛攻怪物，然后掠夺他们的钥匙。使用它们打开猛攻港口周围的箱子，获取文件
	>>箱子里文件的掉落率并非 100%
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
	#requires transformedcorpse
	.use 40551 >>前往离海岸约 30-90 码的海域，杀死贪婪的颚。使用背包中的血囊压在他们的尸体上
    .goto IcecrownGlacier,4.8,41.5,90,0
    .goto IcecrownGlacier,4.3,35.9,90,0
    .goto IcecrownGlacier,11.7,35.6,90,0
    .goto IcecrownGlacier,13.7,42.0,90,0
    .goto IcecrownGlacier,10.3,41.5,90,0
    .goto IcecrownGlacier,4.8,41.5,90,0
    .goto IcecrownGlacier,4.3,35.9,90,0
    .goto IcecrownGlacier,11.7,35.6,90,0
    .goto IcecrownGlacier,13.7,42.0,90,0
    .goto IcecrownGlacier,10.3,41.5
    .complete 12810,1 --Blood collected from Ravenous Jaws (10)
step
	>>返回死亡高地。与阿雷特交谈
    .turnin 12810 >>交任务: |cRXP_FRIENDLY_水中之血|r
    .accept 12814 >>接任务: |cRXP_LOOT_你需要狮鹫|r
    .goto IcecrownGlacier,19.6,48.1
step
	>>与野牛交谈。他在中间的火堆周围巡逻
    .turnin -12838 >>交任务: |cRXP_FRIENDLY_收集情报|r
    .goto IcecrownGlacier,20.1,47.5,20,0
    .goto IcecrownGlacier,20.4,47.9,20,0
    .goto IcecrownGlacier,20.1,48.4,20,0
    .goto IcecrownGlacier,19.7,47.9
	>>与塞塔尔交谈
    .turnin -12813 >>交任务: |cRXP_FRIENDLY_转化尸体|r
    .goto IcecrownGlacier,19.7,48.4
step
    .goto IcecrownGlacier,10.4,44.1
	>>杀死该区域的突袭狮鹫骑士。掠夺他们的突袭狮鹫缰绳
	.collect 40970,1,12814,1 --Onslaught Grpyhon Reins (1)
step
    .goto IcecrownGlacier,19.6,47.8
	>>骑着普通坐骑返回死亡高地。当你找到任务给予者时，使用狮鹫缰绳并使用“运送狮鹫”(1) 将其运送。
    .complete 12814,1 --Onslaught Gryphon delivered to Uzo Deathcaller (1)
	.use 40970
step
    .goto Icecrown,19.64,47.80
	>>与乌佐·死亡召唤者交谈
    .turnin 12814 >>交任务: |cRXP_FRIENDLY_你需要狮鹫|r
    .daily 12815 >>接任务: |cRXP_LOOT_禁飞区|r
step
    .goto IcecrownGlacier,10.5,44.1,70,0
    .goto IcecrownGlacier,5.0,43.4,70,0
    .goto IcecrownGlacier,10.5,39.0,70,0
    .goto IcecrownGlacier,12.7,41.2,70,0
    .goto IcecrownGlacier,10.5,44.1
	>>杀死该区域的狮鹫骑士。使用远程技能将其击落，或者在空中将其中的多个狮鹫骑士聚集起来，然后飞下来杀死它们。如果你聚集了许多人，不要让他们从背后攻击你，否则你会被打下马。
    .complete 12815,1 --Onslaught Gryphon Rider (10)
step
	.goto Icecrown,19.64,47.80
	>>返回死亡高地。与乌佐交谈
    .turnin 12815 >>交任务: |cRXP_FRIENDLY_禁飞区|r
step
    >>返回暗影地窖。与跳跃者和维尔交谈
    .turnin -13069 >>交任务: |cRXP_FRIENDLY_把它们打下来！|r
	.goto IcecrownGlacier,43.5,25.0
    .turnin -13071 >>交任务: |cRXP_FRIENDLY_维尔喜欢火焰！|r
    .goto IcecrownGlacier,43.6,24.1,60,0
    .goto IcecrownGlacier,42.7,26.8
step
    +您已完成黑锋骑士团前期任务链。请使用黑锋骑士团每日任务路线指南完成每日任务。请注意，有些任务可能今天无法完成，因为之前已经完成
	.isQuestTurnedIn 12814
]])
