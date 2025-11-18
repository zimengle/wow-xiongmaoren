RXPGuides.RegisterGuide([[
#version 1
#wotlk
#cata
#group +休息经验 诺森德每日任务
#name 最佳每日任务每小时金币路线

--20 daily quests total
--5(rep depending) quests from Hodir (didnt include dragon flying one. its terrible) may not be 5 quests for everyone. should be at least 3 though
--6 from icecrown. quests from Ebon Blade
--9 from icecrown. quests from gunship/surroundings
--all of these quests require pre quests to be completed/unlocked. each section has checks to see if they have completed pre quests or not. if they havnt they're told to do pre quest guide
--gives the player still room to do daily heroic+正常以及jc/烹饪/钓鱼日常任务


--5 Quest section for The Sons of Hodir Daily Quests. Didn't include slaying dragon quest because its really bad/slow

step
	+要解锁霍迪尔之子的日常任务，你必须先完成风暴峭壁中的任务链。请使用霍迪尔之子的每日任务解锁指南来解锁每日任务
	.isQuestAvailable 13047
step
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔、霜狼母鹿和贪得无厌的阿恩格里姆交谈
    .daily 12981 >>接任务: |cRXP_LOOT_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .daily 12977 >>接任务: |cRXP_LOOT_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.daily 13006 >>接任务: |cRXP_LOOT_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.daily 12994 >>接任务: |cRXP_LOOT_猎杀间谍|r
	.goto TheStormPeaks,63.49,59.73
	.daily 13046 >>接任务: |cRXP_LOOT_喂饱安格里姆|r
	.goto TheStormPeaks,67.61,59.95
	.reputation 1119,revered,<0,1 -- if you're 0 into revered it will display this step
step
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔和霜狼兽母交谈
    .daily 12981 >>接任务: |cRXP_LOOT_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .daily 12977 >>接任务: |cRXP_LOOT_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.daily 13006 >>接任务: |cRXP_LOOT_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.daily 12994 >>接任务: |cRXP_LOOT_猎杀间谍|r
	.goto TheStormPeaks,63.49,59.73
	.reputation 1119,honored,<0,1 -- if you're 0 into honored it will display this step
step
	>>与菲约恩的铁砧、霍迪尔的号角和霍迪尔的头盔交谈
    .daily 12981 >>接任务: |cRXP_LOOT_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .daily 12977 >>接任务: |cRXP_LOOT_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.daily 13006 >>接任务: |cRXP_LOOT_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.reputation 1119,friendly,<0,1 -- if you're 0 into friendly it will display this step
step
	.goto TheStormPeaks,70.00,58.00,60,0
    .goto TheStormPeaks,70.14,61.16
	>>杀死脆弱的亡灵。从他们身上获取冰精华
	.collect 42246,6 --Essence of Ice (6)
	.isOnQuest 12981
step
	.goto TheStormPeaks,73.5,62.9,70,0
    .goto TheStormPeaks,76.2,63.4
	.use 42246 >>使用 Fjorn 铁砧附近的闷烧废料旁边的冰精华。拾取冰冻铁废料
    .complete 12981,1 --Frozen Iron Scrap (6)
	.isOnQuest 12981
step
    .goto TheStormPeaks,70.73,50.96,65,0
	.goto TheStormPeaks,73.00,49.05,65,0
    .goto TheStormPeaks,71.45,47.76
	.use 42164 >>杀死该区域的尼菲莱姆先祖和不安分的霜裔。使用背包中的霍迪尔之角，解救他们的尸体
    .complete 12977,1 --Niffelem Forefather freed (5)
    .complete 12977,2 --Restless Frostborn freed (5)
	.isOnQuest 12977
step
	#completewith next
    .goto TheStormPeaks,57.23,64.02
	.use 42479 >>使用背包中的虚灵狼牙，对付堕落狼人的尸体。跟踪虚灵霜狼，直到它追踪到一名风暴锻造渗透者，然后将其杀死。
	.complete 12994,1 --Stormforged Infiltrators Slain (3)
	.isOnQuest 12994
step
	.goto TheStormPeaks,57.92,61.07,60,0
	.goto TheStormPeaks,57.83,63.59,60,0
	.goto TheStormPeaks,56.51,65.00
	.use 42774 >>使用背包中的阿恩格林之牙对付流浪的冰虫。将其伤害至 30% 或更低的生命值，但不要杀死它
	.complete 13046,1 --Arngrim's spirit fed (5)
	.isOnQuest 13046
step
    .goto TheStormPeaks,57.23,64.02
	.use 42479 >>使用背包中的虚灵狼牙，对付堕落狼人的尸体。跟踪虚灵霜狼，直到它追踪到一名风暴锻造渗透者，然后将其杀死。
	.complete 12994,1 --Stormforged Infiltrators Slain (3)
	.isOnQuest 12994
step
	.goto TheStormPeaks,55.84,63.94,50,0
    .goto TheStormPeaks,54.4,63.2
	>>杀死冬日洞穴中的粘稠油怪。掠夺它们的油
    .complete 13006,1 --Viscous Oil (5)
	.isOnQuest 13006
step
	>>返回丹·尼弗莱姆
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔、霜狼母鹿和贪得无厌的阿恩格里姆交谈
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.turnin 12994 >>交任务: |cRXP_FRIENDLY_猎杀间谍|r
	.goto TheStormPeaks,63.49,59.73
	.turnin 13046 >>交任务: |cRXP_FRIENDLY_喂饱安格里姆|r
	.goto TheStormPeaks,67.61,59.95
	.isQuestComplete 12994
	.isQuestComplete 13046
step
	>>返回丹·尼弗莱姆
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔和贪得无厌的阿恩格里姆交谈
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.turnin 13046 >>交任务: |cRXP_FRIENDLY_喂饱安格里姆|r
	.goto TheStormPeaks,67.61,59.95
	.isQuestComplete 13046
step
	>>返回丹·尼弗莱姆
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔和霜狼兽母交谈
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.turnin 12994 >>交任务: |cRXP_FRIENDLY_猎杀间谍|r
	.goto TheStormPeaks,63.49,59.73
	.isQuestComplete 12994
step
	>>返回丹·尼弗莱姆
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔、霜狼母鹿和贪得无厌的阿恩格里姆交谈
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.turnin 12994 >>交任务: |cRXP_FRIENDLY_猎杀间谍|r
	.goto TheStormPeaks,63.49,59.73
	.turnin 13046 >>交任务: |cRXP_FRIENDLY_喂饱安格里姆|r
	.goto TheStormPeaks,67.61,59.95
	.isQuestComplete 12994
	.isQuestComplete 13046
step
	>>返回丹·尼弗莱姆
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔和贪得无厌的阿恩格里姆交谈
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,65.00,60.95
	.turnin 13046 >>交任务: |cRXP_FRIENDLY_喂饱安格里姆|r
	.goto TheStormPeaks,67.61,59.95
	.isQuestComplete 13046
step
	>>返回丹·尼弗莱姆
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔和霜狼兽母交谈
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.turnin 12994 >>交任务: |cRXP_FRIENDLY_猎杀间谍|r
	.goto TheStormPeaks,63.49,59.73
	.isQuestComplete 12994
step
	>>返回丹·尼弗莱姆
	>>与菲约恩的铁砧、霍迪尔的号角和霍迪尔的头盔交谈
    .turnin -12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin -12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin -13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
step << Mage
	#completewith next
	.zone Dalaran >>前往: |cRXP_PICK_达拉然|r
	>>前往: |cRXP_PICK_冰冠冰川|r
step << !Mage
	#completewith next
    .hs >>如果你的炉石位于达拉然或者冰冠冰川附近的某个地方，那么炉石就位于达拉然。
	>>前往: |cRXP_PICK_冰冠冰川|r

--9 Quest section from Icecrown Gunship and close surroundings section. 6 Quests from the gunship, other 3 from on the ground/in Ymirheim

step << Alliance
	+要解锁所有冰冠炮艇日常任务，您必须先完成前置任务链。请使用冰冠炮艇解锁日常任务指南来解锁所有日常任务
	.isQuestAvailable 13314,13342,13321,13318
--	13314  Get the Message
-- 	13342  Not a Bug
--	13321  Retest Now
--	13318  Drag and Drop

step << Horde
	+要解锁所有冰冠炮艇日常任务，您必须先完成前置任务链。请使用冰冠炮艇前置任务指南来解锁所有日常任务
	.isQuestAvailable 13313,13356,13352,13358
--	13313  接任务: |cRXP_WARN_遮挡天空|r
--	13356  Retest Now
--	13352  Drag and Drop
--	13358  Not a Bug

step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>在冰冠冰川，飞往联盟武装直升机“破天者”号
	>>与骑士队长 Drosche、虔诚者 Absalan、高级队长 Justin Bartlett、首席工程师 Boltwrench 和 Thassarian 交谈
	>>它们分别位于船的左后方、上甲板、主中央舱和下甲板下方
    .daily 13336 >>接任务: |cRXP_LOOT_伊米亚之血|r
    .daily 13300 >>接任务: |cRXP_LOOT_萨隆邪铁的奴隶|r
    .daily 13322 >>接任务: |cRXP_LOOT_重新考验|r
    .daily 13323 >>接任务: |cRXP_LOOT_从天而“降”|r
	.daily 13344 >>接任务: |cRXP_LOOT_活动窃听器|r
    .daily 13333 >>接任务: |cRXP_LOOT_抢夺急件|r
step << Horde
	.goto IcecrownGlacier,67.00,38,0
	>>在冰冠冰川，飞到部落武装直升机“奥格瑞姆之锤”
	>>与战争使者戴佛斯·里欧特、凯尔坦兄弟、掠天者科姆·黑痕、首席工程师科珀克劳和织死者科尔蒂拉交谈
	>>它们分别位于主前舱，巡逻上甲板和下甲板
    .daily 13330 >>接任务: |cRXP_LOOT_伊米亚之血|r
    .daily 13302 >>接任务: |cRXP_LOOT_萨隆邪铁的奴隶|r
    .daily 13357 >>接任务: |cRXP_LOOT_重新考验|r
    .daily 13353 >>接任务: |cRXP_LOOT_从天而“降”|r
	.daily 13365 >>接任务: |cRXP_LOOT_活动窃听器|r
    .daily 13331 >>接任务: |cRXP_WARN_盲目的联盟|r
step << Alliance
    .goto IcecrownGlacier,62.6,51.3
	>>飞往地面指挥官 Koup（在地面 - 不在船上）
    .daily 13309 >>接任务: |cRXP_LOOT_空中突袭|r
step << Alliance
    #completewith next
    .goto Icecrown,62.55,50.67
    .vehicle 32227 >>右键点击飞行器顶部的炮塔来开始任务
	.isOnQuest 13309
step << Alliance
	>>飞行时向所有看到的鱼叉枪射击，使其失效。当你这样做时，渗透者会掉落
    .goto Icecrown,52.65,56.93
    .complete 13309,1 --4/4 Skybreaker Infiltrators dropped
	.isOnQuest 13309
step << Alliance
    .goto Icecrown,62.55,51.29
	>>离开飞行器。你将收到一个降落伞。返回 Koup
    .turnin 13309 >>交任务: |cRXP_FRIENDLY_空中突袭|r
	.isQuestComplete 13309
step << Horde
	>>飞到地面指挥官 Xutjja (在地面 - 不在船上)
    .goto IcecrownGlacier,58.3,46.0
    .daily 13310 >>接任务: |cRXP_LOOT_空中突袭|r
step << Horde
	#completewith next
	.vehicle >>右键点击飞行器顶部的炮塔来开始任务
    .goto IcecrownGlacier,59.60,45.84
	.isOnQuest 13310
step << Horde
	>>飞行时向所有看到的鱼叉枪射击，使其失效。当你这样做时，渗透者会掉落
    .goto IcecrownGlacier,56.8,64.3
    .complete 13310,1 --Kor'kron Infiltrators dropped (4)
	.isOnQuest 13310
step << Horde
    .goto IcecrownGlacier,58.3,46.0
	>>离开飞行器。你将收到一个降落伞。返回 Xutjja
    .turnin 13310 >>交任务: |cRXP_FRIENDLY_空中突袭|r
	.isQuestComplete 13310
step << Alliance
    .goto IcecrownGlacier,62.5,51.1,15,0
    .goto IcecrownGlacier,62.8,51.6
	>>与小队队长交谈。如果其他人开始了任务，他可能不在这里，重生时间大约为 6 分钟，重生地点在 Koup 右侧约 10 码处。如果您不想等待或稍后查看，可以跳过此步骤
    .daily 13284 >>接任务: |cRXP_LOOT_地面突袭|r
step << Alliance
    .goto IcecrownGlacier,58.2,55.9,0
    .goto IcecrownGlacier,59.6,59.3,0
    .goto IcecrownGlacier,57.8,62.6,0
	#completewith Mineslave
	>>消灭伊米海姆各地的维库人
	.complete 13336,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13336
step << Alliance
    .goto Icecrown,59.89,53.50
	>>护送部队。必要时让一些部队去对付怪物
    .complete 13284,1 --4/4 Alliance troops escorted to Ymirheim
	.isOnQuest 13284
step << Alliance
	#label Mineslave
    .goto IcecrownGlacier,55.7,57.3,40,0
    .goto IcecrownGlacier,56.2,58.9,40,0
    .goto IcecrownGlacier,55.6,59.7,40,0
    .goto IcecrownGlacier,54.5,60.0,40,0
    .goto IcecrownGlacier,55.7,57.3
	>>进入萨隆邪铁矿井。与奴隶交谈以拯救他们（有时他们可能会攻击你）。
    .complete 13300,1 --Saronite Mine Slave rescued (10)
	.skipgossip
	.isOnQuest 13300
step << Alliance
    .goto IcecrownGlacier,58.2,55.9,70,0
    .goto IcecrownGlacier,59.6,59.3,70,0
    .goto IcecrownGlacier,57.8,62.6
	>>消灭伊米海姆各地的维库人
	.complete 13336,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13336
step << Alliance
    .goto Icecrown,57.01,62.53
	>>注意：此任务标记您为 PVP。但是它非常简单。
    .daily 13280 >>接任务: |cRXP_LOOT_占山为王|r
step << Alliance
    #completewith next
    .goto Icecrown,56.99,62.60
    .vehicle 31784 >>右键点击看起来像侏儒的机器人
	.isOnQuest 13280
step << Alliance
    .goto Icecrown,54.89,60.12
	>>垃圾邮件使用“跳跃喷气机”（3）快速攀爬悬崖（没有冷却时间）。到达山顶后，使用“种植联盟战斗旗帜”（1）种植旗帜。然后，离开车辆
    .complete 13280,1 --1/1 Alliance Battle Standard planted
	.isOnQuest 13280
step << Alliance
    .goto Icecrown,56.97,62.55
    .turnin 13280 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13280
step << Alliance
	>>返回地面指挥官库普
    .goto Icecrown,62.60,51.35
    .turnin 13284 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13284
step << Horde
    .goto IcecrownGlacier,58.3,46.0
	>>与小队队长交谈。如果其他人开始了任务，他可能不在这里，并且重生时间大约为 6 分钟。如果您不想等待或稍后查看，可以跳过此步骤
    .daily 13301 >>接任务: |cRXP_LOOT_地面突袭|r
step << Horde
    .goto IcecrownGlacier,58.2,55.9,0
    .goto IcecrownGlacier,59.6,59.3,0
    .goto IcecrownGlacier,57.8,62.6,0
	#completewith Mineslave
	>>消灭伊米海姆各地的维库人
	.complete 13330,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13330
step << Horde
	>>护送部队。必要时让一些部队去对付怪物
    .goto IcecrownGlacier,59.4,52.8
    .complete 13301,1 --Horde troops escorted to Ymirheim (4)
	.isOnQuest 13301
step << Horde
	#label Mineslave
    .goto IcecrownGlacier,55.7,57.3,40,0
    .goto IcecrownGlacier,56.2,58.9,40,0
    .goto IcecrownGlacier,55.6,59.7,40,0
    .goto IcecrownGlacier,54.5,60.0,40,0
    .goto IcecrownGlacier,55.7,57.3
	>>进入萨隆邪铁矿井。与奴隶交谈以拯救他们（有时他们可能会攻击你）。
    .complete 13302,1 --Saronite Mine Slave rescued (10)
	.skipgossip
	.isOnQuest 13302
step << Horde
    .goto IcecrownGlacier,58.2,55.9,70,0
    .goto IcecrownGlacier,59.6,59.3,70,0
    .goto IcecrownGlacier,57.8,62.6
	>>消灭伊米海姆各地的维库人
	.complete 13330,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13330
step << Horde
    .goto IcecrownGlacier,51.9,57.6
	>>注意：此任务会标记您为 PvP。但是它非常简单。
    .daily 13283 >>接任务: |cRXP_LOOT_占山为王|r
step << Horde
    #completewith next
    .goto Icecrown,51.95,57.62
    .vehicle >>右键点击看起来像侏儒的机器人
	.isOnQuest 13283
step << Horde
    .goto Icecrown,54.89,60.12
	>>垃圾邮件使用“跳跃喷气机”（3）快速攀爬悬崖（没有冷却时间）。到达山顶后，使用“种植部落战旗”（1）种植旗帜。然后，离开车辆
    .complete 13283,1 --1/1 Horde Battle Standard planted
	.isOnQuest 13283
step << Horde
    .goto Icecrown,51.9,57.6
    .turnin 13283 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13283
step << Horde
	>>返回地面指挥官 Xutjja
    .goto Icecrown,58.3,46.0
    .turnin 13301 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13301
step
	>>前往平台并杀死该区域的苦涩新兵。掠夺他们的幻象之球
	.use 44246 >>当你脱离战斗时，使用幻象之球对付区域内的黑暗征服者。
	.collect 44246,3,13353,1,-1 << Horde--Orb of Illusion (3 -1)
	.collect 44246,3,13323,1,-1 << Alliance--Orb of Illusion (3 -1)
    .goto IcecrownGlacier,53.7,46.1
    .complete 13323,1 << Alliance --Dark Subjugator dragged and dropped (3)
    .complete 13353,1 << Horde --Dark Subjugator dragged and dropped (3)
    .goto IcecrownGlacier,54.7,45.9,60,0
    .goto IcecrownGlacier,54.0,46.3,60,0
    .goto IcecrownGlacier,52.2,45.7,60,0
    .goto IcecrownGlacier,54.0,46.3
	.isOnQuest 13323 << Alliance
	.isOnQuest 13353 << Horde
step << Alliance
    .goto IcecrownGlacier,46.2,52.1,70,0
    .goto IcecrownGlacier,42.4,59.4,0,0
	.use 44222 >>使用背包中的飞镖枪对付奥格瑞姆之锤侦察兵（你可以在飞行坐骑上使用它）。搜刮他们的尸体，用于派遣
    .complete 13333,1 --Orgrim's Hammer Dispatch (6)
	.isOnQuest 13333
step << Horde
	.goto IcecrownGlacier,48.85,40.44
	.use 44212 >>使用背包中的 SGM-3 对空中的 Skybreaker 侦察战斗机进行攻击
	.complete 13331,1 --Skybreaker Recon Fighters shot down (6)
	.isOnQuest 13331
step
    .goto IcecrownGlacier,49.7,34.4
	.use 44307 >>使用包中的稀释邪教补药来获得“黑暗洞察力”增益。这让你可以从你杀死的该区域的所有类人生物身上掠夺污染精华
	.collect 44301,10,13322,1 << Alliance
	.collect 44301,10,13357,1 << Horde
	.isOnQuest 13322 << Alliance
	.isOnQuest 13357 << Horde
step
    .goto IcecrownGlacier,49.7,34.4
	.use 44301 -- to combine the 10 tainted essences into a writhing mass
	.use 44304 >>右键点击包里的污秽精华，将其变成翻滚的物质。将其扔进大锅里
	.complete 13322,1 << Alliance
	.complete 13357,1 << Horde
	.isOnQuest 13322 << Alliance
	.isOnQuest 13357 << Horde
step
    .goto IcecrownGlacier,54.1,31.4,70,0
    .goto IcecrownGlacier,54.7,28.0,70,0
    .goto IcecrownGlacier,57.0,28.8,70,0
    .goto IcecrownGlacier,54.1,31.4
	.use 44433 >>杀死 5 名被奴役的奴仆（虚空行者）。使用虹吸棒在他们的尸体上获取暗物质
	.collect 44434,5,13344,1 << Alliance --Dark Matter (5)
	.collect 44434,5,13365,1 << Horde --Dark Matter (5)
	.isOnQuest 13344 << Alliance
	.isOnQuest 13365 << Horde
step
    .goto IcecrownGlacier,53.8,33.6
	>>点击召唤石
	.complete 13344,1 << Alliance  --Dark Messenger Summoned (1)
    .complete 13365,1 << Horde --Dark Messenger Summoned (1)
	.isOnQuest 13344 << Alliance
	.isOnQuest 13365 << Horde
step << Alliance
    .goto IcecrownGlacier,65.1,57.2,0
    .goto IcecrownGlacier,64.7,52.4,0
    .goto IcecrownGlacier,62.1,45.9,0
    .goto IcecrownGlacier,57.5,39.1,0
    .goto IcecrownGlacier,54.7,35.3,0
	>>返回破天者号。与骑士队长德洛什、虔诚者阿布萨兰、高级队长贾斯汀·巴特利特、首席工程师博尔特维伦奇和萨萨里安交谈。
    .turnin -13336 >>交任务: |cRXP_FRIENDLY_伊米亚之血|r
    .turnin -13300 >>交任务: |cRXP_FRIENDLY_萨隆邪铁的奴隶|r
    .turnin -13322 >>交任务: |cRXP_FRIENDLY_重新考验|r
    .turnin -13323 >>交任务: |cRXP_FRIENDLY_从天而“降”|r
	.turnin -13344 >>交任务: |cRXP_FRIENDLY_活动窃听器|r
    .turnin -13333 >>交任务: |cRXP_FRIENDLY_抢夺急件|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>返回奥格瑞姆之锤。与战争使者戴佛斯·里欧特、凯尔坦修士、掠天者科姆·黑痕、首席工程师科珀克劳和死亡织者科尔蒂拉交谈
    .turnin -13330 >>交任务: |cRXP_FRIENDLY_伊米亚之血|r
    .turnin -13302 >>交任务: |cRXP_FRIENDLY_萨隆邪铁的奴隶|r
    .turnin -13357 >>交任务: |cRXP_FRIENDLY_重新考验|r
    .turnin -13353 >>交任务: |cRXP_FRIENDLY_从天而“降”|r
	.turnin -13365 >>交任务: |cRXP_FRIENDLY_活动窃听器|r
    .turnin -13331 >>交任务: |cRXP_FRIENDLY_盲目的联盟|r

--6 Quest section from Knights of the Ebon Blade. 3 come from The Shadow Vault, other 3 from Death's Rise

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
	>>|cff00ecff注意：只有打开闪闪发光的箱子才能获得文件。没有闪闪发光的箱子里不包含文件。|r
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
]])
