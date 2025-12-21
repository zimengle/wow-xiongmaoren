RXPGuides.RegisterGuide([[
#version 1
#group +RestedXP 诺森德日常任务
#subgroup 阵营日常任务
#wotlk
#cata
#name 黑锋之刃日常任务解锁
#displayname 黑锋之刃日常任务解锁 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    +您已完成黑锋骑士团前置任务链. 请使用黑锋骑士团日常任务路线指南来完成日常任务
	.isQuestTurnedIn 12814

step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>飞往“破天号”, 那艘在高空中飞行的大型联盟飞船
	>>与船左后角的萨萨里安交谈
    .accept 12887 >>接任务: |cRXP_LOOT_乐趣十足|r
step << Horde
	.goto Icecrown,62.58,45.04
	>>飞往奥格瑞姆之锤, 那艘在高空中翱翔的大型部落飞行舰船
	>>与船上前室的库尔迪拉·织亡者交谈
    .accept 12892 >>接任务: |cRXP_LOOT_乐趣十足|r
step
    .goto IcecrownGlacier,44.5,21.6
	.use 41265 >>飞到塔顶, 使用背包中的魔眼冲击炮攻击眼球, 直到它死亡
    .complete 12887,1 << Alliance --The Ocular has been destroyed (1)
    .complete 12892,1 << Horde --The Ocular has been destroyed (1)
step
    .goto IcecrownGlacier,44.1,24.7
	>>一路飞到地面上的银色男爵那里, 与他交谈
    .turnin 12887 >>交任务: |cRXP_FRIENDLY_乐趣十足|r << Alliance
    .turnin 12892 >>交任务: |cRXP_FRIENDLY_乐趣十足|r << Horde
    .accept 12891 >>接任务: |cRXP_LOOT_我有一计……|r
step
	>>击杀恶鬼并获取他们的绳索, 击杀憎恶并获取他们的钩子, 击杀邪教徒并获取他们的法杖, 击杀亡灵怪物并获取他们的灵魂精粹
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
	>>返回银色
    .turnin 12891 >>交任务: |cRXP_FRIENDLY_我有一计……|r
    .accept 12893 >>接任务: |cRXP_LOOT_解放你的思想|r
step
    .goto IcecrownGlacier,44.4,27.0
	.use 41366 >>击杀Vile. 在其尸体上使用统治魔棒
    .complete 12893,1 --Vile turned (1)
step
    .goto IcecrownGlacier,41.8,24.5
	.use 41366 >>击杀雷蒂. 在她的尸体上使用统治魔棒
    .complete 12893,2 --Lady Nightswood turned (1)
step
    .goto IcecrownGlacier,43.0,23.5,70,0
    .goto IcecrownGlacier,44.8,24.3,70,0
    .goto IcecrownGlacier,46.2,21.9,70,0
    .goto IcecrownGlacier,45.7,19.7,70,0
    .goto IcecrownGlacier,43.7,19.0,70,0
    .goto IcecrownGlacier,42.6,21.1
	.use 41366 >>击杀跳跃者. 用统治魔棒在他的尸体上使用. 他会在主建筑顶层的外部区域游荡
    .complete 12893,3 --The Leaper turned (1)
	.unitscan The Leaper
step
	#label Freemind
    .goto IcecrownGlacier,44.2,24.7
	>>返回银色
    .turnin 12893 >>交任务: |cRXP_FRIENDLY_解放你的思想|r
    .accept 12896 >>接任务: |cRXP_LOOT_顽固的敌人|r << Alliance
    .accept 12897 >>接任务: |cRXP_LOOT_顽固的敌人|r << Horde
step
    .goto IcecrownGlacier,44.7,19.8
	>>进入建筑, 点击将军的武器架. 注意, 这会召唤一名精英敌人. 击杀莱斯班恩将军
    .complete 12896,1 << Alliance --General Lightsbane (1)
    .complete 12897,1 << Horde --General Lightsbane (1)
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>飞回破天者号. 到船体左后方角落找萨萨里安交谈
    .turnin 12896 >>交任务: |cRXP_FRIENDLY_顽固的敌人|r
    .accept 12898 >>接任务: |cRXP_LOOT_暗影拱顶|r
step << Horde
	>>飞回奥格瑞姆之锤号. 前往船舱前室, 与库尔迪拉·织亡者对话
    .turnin 12897 >>交任务: |cRXP_FRIENDLY_顽固的敌人|r
    .accept 12899 >>接任务: |cRXP_LOOT_暗影拱顶|r
step
    .goto IcecrownGlacier,42.8,24.9
	>>返回银色男爵
	.turnin 12898 >>交任务: |cRXP_FRIENDLY_暗影拱顶|r << Alliance
    .turnin 12899 >>交任务: |cRXP_FRIENDLY_暗影拱顶|r << Horde
    .accept 12938 >>接任务: |cRXP_LOOT_公爵|r
step
	#completewith next
    .goto IcecrownGlacier,43.7,24.4
    .fp The Shadow Vault >>获取暗影拱顶的飞行路径
step
    .goto IcecrownGlacier,44.7,20.3
	>>进入建筑内, 与兰克拉尔交谈
    .turnin 12938 >>交任务: |cRXP_FRIENDLY_公爵|r
    .accept 12939 >>接任务: |cRXP_LOOT_荣耀的挑战|r
step
    .goto Icecrown,43.60,25.13
	>>与跳跃者交谈, 他正在帐篷附近游荡
    .accept 12955 >>接任务: |cRXP_LOOT_消灭竞争者|r
step
    .goto IcecrownGlacier,37.5,24.7,0,0
	#sticky
	#label mjordincombat
	.use 41372 >>在远处对尤尔丁格斗者使用挑战之旗. 只要不进入战斗状态, 即可同时挑战多名格斗者(但每组两人只能挑战1个目标)
    .complete 12939,1 --Mjordin Combatants challenged and defeated (6)
step
	>>飞往野蛮之台
	>>前往蛮荒峭壁, 与丁奇和西格丽德和奥努祖和埃弗雷姆对话, 然后击败他们
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
	>>返回跳跃者
    .turnin 12955 >>交任务: |cRXP_FRIENDLY_消灭竞争者|r
step
    .goto IcecrownGlacier,44.7,20.3
	>>进入建筑内, 与兰克拉尔交谈
    .turnin 12939 >>交任务: |cRXP_FRIENDLY_荣耀的挑战|r
    .accept 12943 >>接任务: |cRXP_LOOT_暗影拱顶裁决令|r
step
	#completewith next
    .goto IcecrownGlacier,39.01,23.99,25 >>通往乌弗朗之厅的道路从此处开始
step
    .goto IcecrownGlacier,41.0,23.9
	>>回到野蛮之台, 然后进入乌弗朗大厅. 与被锁在里面的瓦伦交谈
    .accept 12949 >>接任务: |cRXP_LOOT_夺取钥匙|r
step
    .goto IcecrownGlacier,40.3,23.9
	.use 41776 >>在萨恩面前使用背包中的暗影拱顶裁决令. 杀死他
    .complete 12943,1 --Thane Ufrang the Mighty (1)
step
    .goto IcecrownGlacier,37.7,23.9,70,0
    .goto IcecrownGlacier,36.7,23.7
	>>回到外面的野蛮岩架, 击杀正在巡逻的教官霍加尔, 搜刮他的钥匙
    .complete 12949,1 --Key to Vaelen's Chains (1)
	.unitscan Instructor Hroegar
step
    .goto IcecrownGlacier,41.0,23.9
	>>回到乌弗朗大厅. 返回瓦伦
    .turnin 12949 >>交任务: |cRXP_FRIENDLY_夺取钥匙|r
    .accept 12951 >>接任务: |cRXP_LOOT_通知男爵|r
step
    .goto IcecrownGlacier,39.01,23.99,25,0
    .goto IcecrownGlacier,42.9,24.9
	>>离开大厅. 返回银色男爵
    .turnin 12951 >>交任务: |cRXP_FRIENDLY_通知男爵|r
    .daily 12995 >>接任务: |cRXP_LOOT_彰显军威|r
    .accept 13085 >>接任务: |cRXP_LOOT_维林回来了|r
step
    .goto IcecrownGlacier,43.6,24.1,60,0
    .goto IcecrownGlacier,42.7,26.8
	>>与沿主路巡逻的劣尸维尔交谈
    .accept 12992 >>接任务: |cRXP_LOOT_干掉那些维库人！|r
step
    .goto IcecrownGlacier,43.8,23.3,30,0
    .goto IcecrownGlacier,43.1,21.1
	>>进入建筑内部, 与左侧的瓦伦交谈
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
	.use 42480 >>击杀该区域的维库人, 并从他们身上搜刮笼子钥匙. 将背包中的黑锋旗帜使用在他们的尸体上. 然后点击约顿海姆各地发现的笼子上所拾取的任何钥匙
	>>烧毁约顿海姆各地的旗帜
	.collect 42422,8,12982,1,-1 --Jotunheim Cage Key (8)
    .complete 12982,1 --Ebon Blade Prisoners set free (8)
    .complete -12995,1 --Ebon Blade Banner planted near Vrykul corpse (0/15)
    .complete 12992,1 --Jotunheim Vrykul slain (0/15)
    .complete 13084,1 --Vrykul banners burned (10)
step
    .goto IcecrownGlacier,42.7,26.8,60,0
    .goto IcecrownGlacier,43.6,24.1
	>>返回暗影地窖. 与沿主路巡逻的劣尸维尔交谈
    .turnin 12992 >>交任务: |cRXP_FRIENDLY_干掉那些维库人！|r
    .daily 13071 >>接任务: |cRXP_LOOT_维尔喜欢火焰！|r
step
    .goto IcecrownGlacier,43.8,23.3,30,0
    .goto IcecrownGlacier,43.1,21.1
	>>进入建筑内部, 与左侧的瓦伦交谈
    .turnin 12982 >>交任务: |cRXP_FRIENDLY_黑锋囚犯|r
step
    .goto IcecrownGlacier,44.7,20.4
	>>与兰克拉尔交谈
    .turnin 13084 >>交任务: |cRXP_FRIENDLY_破坏尤顿海姆|r
step
    .goto IcecrownGlacier,42.9,24.9
    >>返回银色
	.turnin 12995 >>交任务: |cRXP_FRIENDLY_彰显军威|r
	.isQuestComplete 12995
step
    .goto IcecrownGlacier,42.9,24.9
	>>与银对话
    .accept 12806 >>接任务: |cRXP_LOOT_全速赶往死亡高地！|r
step
    .goto IcecrownGlacier,43.5,25.0
	>>与跳跃者交谈, 他正在帐篷附近游荡
    .daily 13069 >>接任务: |cRXP_LOOT_把它们打下来！|r
step
    .goto IcecrownGlacier,27.9,33.2
	>>进入位于中心位置的尤顿海姆速射鱼叉之一
	>>在鱼叉内部时, 频繁使用“快速射击鱼叉”(3)击落龙
	.complete 13069,1 --Jotunheim Proto-Drakes & their riders shot down
	.isOnQuest 13069
step
	#completewith next
    .goto IcecrownGlacier,28.0,37.7
    .vehicle 30564 >>右键点击约尔达始祖龙以骑乘它
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
	>>在冷却完毕时使用“速度爆发”(1)以提升移动速度. 使用“扫射约顿海姆建筑”(3)点燃建筑物
    .complete 13071,1 --Vrykul buildings set ablaze (8)
	.isOnQuest 13071
step
    .goto IcecrownGlacier,19.5,48.1
	>>下龙, 然后前往死亡之巅. 这是一个位于海平面与山顶中间的小平台. 与阿雷特交谈
    .turnin 12806 >>交任务: |cRXP_FRIENDLY_全速赶往死亡高地！|r
    .accept 12807 >>接任务: |cRXP_LOOT_迄今为止的故事……|r
step
    .goto IcecrownGlacier,19.5,48.1
	>>再次与高级指挥官埃雷特交谈
    .complete 12807,1 --Lord-Commander Arete's tale listened to. (1)
    .turnin 12807 >>交任务: |cRXP_FRIENDLY_迄今为止的故事……|r
    .accept 12810 >>接任务: |cRXP_LOOT_水中之血|r
	.skipgossip
step
	#sticky
	#label DeathRise
    .goto IcecrownGlacier,19.3,47.8
    .fp Death's Rise >>获取死亡高地的飞行路径
step
	>>与塞塔尔交谈
    .daily 12813 >>接任务: |cRXP_LOOT_转化尸体|r
    .goto Icecrown,19.67,48.39
	>>与野牛交谈. 他会在中间的火堆附近巡逻
    .daily 12838 >>接任务: |cRXP_LOOT_收集情报|r
    .goto IcecrownGlacier,20.1,47.5,20,0
    .goto IcecrownGlacier,20.4,47.9,20,0
    .goto IcecrownGlacier,20.1,48.4,20,0
    .goto IcecrownGlacier,19.7,47.9
	>>可选. 您可以跳过或完成以下2个日常任务
step
	#requires DeathRise
    #sticky
	#label transformedcorpse
    .goto IcecrownGlacier,9.5,44.8,50,0
    .goto IcecrownGlacier,9.5,44.8,0,0
	.use 40587 >>击杀该区域的“狂潮”怪物. 在它们的尸体上使用背包中的“暗愈者药剂”
    .complete 12813,1 --Scarlet Onslaught corpse transformed (10)
	.isOnQuest 12813
step
	#requires DeathRise
	>>击杀猛攻部队的敌人, 然后从他们身上获取钥匙. 用这些钥匙打开先锋军港口周围的所有宝箱, 以获得文件
	>>宝箱中获取文件的掉落率并非100%
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
	.use 40551 >>前往离海岸约30-90码的海域, 击杀贪婪之颚. 使用背包中的血囊放在其尸体上
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
	>>返回死亡之崛起. 与阿瑞忒交谈
    .turnin 12810 >>交任务: |cRXP_FRIENDLY_水中之血|r
    .accept 12814 >>接任务: |cRXP_LOOT_你需要狮鹫|r
    .goto IcecrownGlacier,19.6,48.1
step
	>>与野牛交谈. 他会在中间的火堆附近巡逻
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
	>>击杀该区域内的先锋军狮鹫骑士, 搜刮他们的先锋军狮鹫的缰绳
	.collect 40970,1,12814,1 --Onslaught Grpyhon Reins (1)
step
    .goto IcecrownGlacier,19.6,47.8
	>>骑着你的普通坐骑返回死亡高地. 到达任务发布者处后, 使用狮鹫缰绳, 并选择“交付狮鹫”(1)来完成任务
    .complete 12814,1 --Onslaught Gryphon delivered to Uzo Deathcaller (1)
	.use 40970
step
    .goto Icecrown,19.64,47.80
	>>与乌佐·唤亡者交谈
    .turnin 12814 >>交任务: |cRXP_FRIENDLY_你需要狮鹫|r
    .daily 12815 >>接任务: |cRXP_LOOT_禁飞区|r
step
    .goto IcecrownGlacier,10.5,44.1,70,0
    .goto IcecrownGlacier,5.0,43.4,70,0
    .goto IcecrownGlacier,10.5,39.0,70,0
    .goto IcecrownGlacier,12.7,41.2,70,0
    .goto IcecrownGlacier,10.5,44.1
	>>击杀该区域内的狮鹫骑士. 可使用远程技能将它们击落, 或在空中集中多个狮鹫骑士后俯冲下来击杀. 若聚集较多敌人, 请勿让它们从背后攻击你, 否则你会被击落
    .complete 12815,1 --Onslaught Gryphon Rider (10)
step
	.goto Icecrown,19.64,47.80
	>>返回死亡之潮. 与乌佐交谈
    .turnin 12815 >>交任务: |cRXP_FRIENDLY_禁飞区|r
step
    >>返回暗影地窖. 与跳跃者和劣尸维尔交谈
    .turnin -13069 >>交任务: |cRXP_FRIENDLY_把它们打下来！|r
	.goto IcecrownGlacier,43.5,25.0
    .turnin -13071 >>交任务: |cRXP_FRIENDLY_维尔喜欢火焰！|r
    .goto IcecrownGlacier,43.6,24.1,60,0
    .goto IcecrownGlacier,42.7,26.8
step
    +您已完成黑锋骑士团前置任务链. 请使用黑锋骑士团日常任务路线指南来完成日常任务. 请注意, 部分任务可能因今日已提前完成而无法接取
	.isQuestTurnedIn 12814
]])
