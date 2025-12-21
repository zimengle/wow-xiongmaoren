RXPGuides.RegisterGuide([[
#version 1
#wotlk
#cata
#group +RestedXP 诺森德日常任务
#name 每小时收益最高的日常任务路线
#displayname 每小时收益最高的日常任务路线 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

--20 daily quests total
--5(rep depending) quests from Hodir (didnt include dragon flying one. its terrible) may not be 5 quests for everyone. should be at least 3 though
--6 from icecrown. quests from Ebon Blade
--9 from icecrown. quests from gunship/surroundings
--all of these quests require pre quests to be completed/unlocked. each section has checks to see if they have completed pre quests or not. if they havnt they're told to do pre quest guide
--gives the player still room to do daily heroic+正常以及JC/烹饪/钓鱼日常任务


--5 Quest section for The Sons of Hodir Daily Quests. Didn't include slaying dragon quest because its really bad/slow

step
	+要解锁霍迪尔之子的日常任务, 你必须先完成风暴峭壁中的任务链. 请使用《霍迪尔之子日常任务解锁指南》来解锁这些日常任务
	.isQuestAvailable 13047
step
	>>与弗约恩之砧和霍迪尔之盔和霍迪尔之盔和冰霜座狼母兽和贪婪的安格里姆交谈
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
	>>与弗约恩之砧和霍迪尔之盔和霍迪尔之盔以及冰霜座狼母兽交谈
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
	>>与弗约恩之砧和霍迪尔之号角和霍迪尔之盔交谈
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
	>>击杀脆弱的亡灵, 搜刮冰霜精华
	.collect 42246,6 --Essence of Ice (6)
	.isOnQuest 12981
step
	.goto TheStormPeaks,73.5,62.9,70,0
    .goto TheStormPeaks,76.2,63.4
	.use 42246 >>在弗约恩铁砧附近的冒烟的碎片旁使用冰之精华. 拾取冻铁碎片
    .complete 12981,1 --Frozen Iron Scrap (6)
	.isOnQuest 12981
step
    .goto TheStormPeaks,70.73,50.96,65,0
	.goto TheStormPeaks,73.00,49.05,65,0
    .goto TheStormPeaks,71.45,47.76
	.use 42164 >>击杀该区域的尼芬雷先祖和躁动霜裔, 在他们的尸体上使用背包中的霍迪尔的号角, 以解救他们
    .complete 12977,1 --Niffelem Forefather freed (5)
    .complete 12977,2 --Restless Frostborn freed (5)
	.isOnQuest 12977
step
	#completewith next
    .goto TheStormPeaks,57.23,64.02
	.use 42479 >>使用背包中的虚灵狼牙对倒在地上的堕落冰霜狼尸体施放. 跟随灵体冰霜座狼, 直到它追踪到一名雷铸渗透者, 然后将其击杀
	.complete 12994,1 --Stormforged Infiltrators Slain (3)
	.isOnQuest 12994
step
	.goto TheStormPeaks,57.92,61.07,60,0
	.goto TheStormPeaks,57.83,63.59,60,0
	.goto TheStormPeaks,56.51,65.00
	.use 42774 >>在游荡的约曼加身上使用背包中的阿恩格林之牙, 将其生命值降至30%或以下, 但不要杀死它
	.complete 13046,1 --Arngrim's spirit fed (5)
	.isOnQuest 13046
step
    .goto TheStormPeaks,57.23,64.02
	.use 42479 >>使用背包中的虚灵狼牙对倒在地上的堕落冰霜狼尸体施放. 跟随灵体冰霜座狼, 直到它追踪到一名雷铸渗透者, 然后将其击杀
	.complete 12994,1 --Stormforged Infiltrators Slain (3)
	.isOnQuest 12994
step
	.goto TheStormPeaks,55.84,63.94,50,0
    .goto TheStormPeaks,54.4,63.2
	>>击杀寒冰洞穴中的粘性油污. 掠夺它们的粘性油污
    .complete 13006,1 --Viscous Oil (5)
	.isOnQuest 13006
step
	>>返回丹尼芬雷
	>>与弗约恩之砧和霍迪尔之盔和霍迪尔之盔和冰霜座狼母兽和贪婪的安格里姆交谈
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
	>>返回丹尼芬雷
	>>与弗约恩之砧和霍迪尔之号角和霍迪尔之盔以及贪婪的安格里姆交谈
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
	>>返回丹尼芬雷
	>>与弗约恩之砧和霍迪尔之盔和霍迪尔之盔以及冰霜座狼母兽交谈
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
	>>返回丹尼芬雷
	>>与弗约恩之砧和霍迪尔之盔和霍迪尔之盔和冰霜座狼母兽和贪婪的安格里姆交谈
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
	>>返回丹尼芬雷
	>>与弗约恩之砧和霍迪尔之号角和霍迪尔之盔以及贪婪的安格里姆交谈
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
	>>返回丹尼芬雷
	>>与弗约恩之砧和霍迪尔之盔和霍迪尔之盔以及冰霜座狼母兽交谈
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
	>>返回丹尼芬雷
	>>与弗约恩之砧和霍迪尔之号角和霍迪尔之盔交谈
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
    .hs >>如果你的炉石位于达拉然或冰冠城附近, 就传送到达拉然
	>>前往: |cRXP_PICK_冰冠冰川|r

--9 Quest section from Icecrown Gunship and close surroundings section. 6 Quests from the gunship, other 3 from on the ground/in Ymirheim

step << Alliance
	+要解锁所有冰冠堡垒炮艇日常任务, 您必须先完成前置任务链. 请使用冰冠堡垒炮艇日常任务解锁指南来解锁全部日常任务
	.isQuestAvailable 13314,13342,13321,13318
--	13314  Get the Message
-- 	13342  Not a Bug
--	13321  Retest Now
--	13318  Drag and Drop

step << Horde
	+要解锁所有冰冠堡垒炮艇日常任务, 您必须先完成前置任务链. 请使用冰冠堡垒炮艇前置任务指南来解锁全部日常任务
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
	>>在冰冠冰川, 飞往联盟炮艇“破天号”
	>>与骑士队长德洛斯彻和虔诚的阿布萨兰和高级指挥官加斯汀·巴雷特和首席技师波尔维克以及萨萨里安交谈
	>>它们分别位于船的左后方和上层甲板和主中央舱以及底层甲板处
    .daily 13336 >>接任务: |cRXP_LOOT_伊米亚之血|r
    .daily 13300 >>接任务: |cRXP_LOOT_萨隆邪铁的奴隶|r
    .daily 13322 >>接任务: |cRXP_LOOT_重新考验|r
    .daily 13323 >>接任务: |cRXP_LOOT_从天而“降”|r
	.daily 13344 >>接任务: |cRXP_LOOT_活动窃听器|r
    .daily 13333 >>接任务: |cRXP_LOOT_抢夺急件|r
step << Horde
	.goto IcecrownGlacier,67.00,38,0
	>>在冰冠冰川, 飞往部落炮艇“奥格瑞姆之锤”
	>>与战争使者达沃斯·里赫和凯尔坦修士和掠天者考尔姆·黑痕和首席技师考伯克拉和库尔迪拉·织亡者交谈
	>>它们分别位于主前舱和上甲板巡逻和下甲板区域
    .daily 13330 >>接任务: |cRXP_LOOT_伊米亚之血|r
    .daily 13302 >>接任务: |cRXP_LOOT_萨隆邪铁的奴隶|r
    .daily 13357 >>接任务: |cRXP_LOOT_重新考验|r
    .daily 13353 >>接任务: |cRXP_LOOT_从天而“降”|r
	.daily 13365 >>接任务: |cRXP_LOOT_活动窃听器|r
    .daily 13331 >>接任务: |cRXP_WARN_盲目的联盟|r
step << Alliance
    .goto IcecrownGlacier,62.6,51.3
	>>飞往地面指挥官库普(在地面上, 不在船上)
    .daily 13309 >>接任务: |cRXP_LOOT_空中突袭|r
step << Alliance
    #completewith next
    .goto Icecrown,62.55,50.67
    .vehicle 32227 >>右键点击飞行器顶部的炮塔以开始任务
	.isOnQuest 13309
step << Alliance
	>>在飞行时射击所有看到的鱼叉枪以使其失效. 这样做时, 潜行者会掉落
    .goto Icecrown,52.65,56.93
    .complete 13309,1 --4/4 Skybreaker Infiltrators dropped
	.isOnQuest 13309
step << Alliance
    .goto Icecrown,62.55,51.29
	>>离开飞行机器. 你将获得一个降落伞. 返回库普
    .turnin 13309 >>交任务: |cRXP_FRIENDLY_空中突袭|r
	.isQuestComplete 13309
step << Horde
	>>飞到地面指挥官科特亚(在地面, 不在船上)
    .goto IcecrownGlacier,58.3,46.0
    .daily 13310 >>接任务: |cRXP_LOOT_空中突袭|r
step << Horde
	#completewith next
	.vehicle >>右键点击飞行器顶部的炮塔以开始任务
    .goto IcecrownGlacier,59.60,45.84
	.isOnQuest 13310
step << Horde
	>>在飞行时射击所有看到的鱼叉枪以使其失效. 这样做时, 潜行者会掉落
    .goto IcecrownGlacier,56.8,64.3
    .complete 13310,1 --Kor'kron Infiltrators dropped (4)
	.isOnQuest 13310
step << Horde
    .goto IcecrownGlacier,58.3,46.0
	>>离开飞行器. 你会获得一个降落伞. 返回许特贾
    .turnin 13310 >>交任务: |cRXP_FRIENDLY_空中突袭|r
	.isQuestComplete 13310
step << Alliance
    .goto IcecrownGlacier,62.5,51.1,15,0
    .goto IcecrownGlacier,62.8,51.6
	>>与小队队长交谈. 如果其他玩家已开始任务, 他可能不在原地, 其刷新时间约为6分钟, 刷新位置位于库普(Koup)右侧约10码处. 若不想等待或打算稍后再来, 可跳过此步骤
    .daily 13284 >>接任务: |cRXP_LOOT_地面突袭|r
step << Alliance
    .goto IcecrownGlacier,58.2,55.9,0
    .goto IcecrownGlacier,59.6,59.3,0
    .goto IcecrownGlacier,57.8,62.6,0
	#completewith Mineslave
	>>在伊米海姆各地击杀维库人
	.complete 13336,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13336
step << Alliance
    .goto Icecrown,59.89,53.50
	>>护送部队. 必要时让部分部队承担怪物仇恨
    .complete 13284,1 --4/4 Alliance troops escorted to Ymirheim
	.isOnQuest 13284
step << Alliance
	#label Mineslave
    .goto IcecrownGlacier,55.7,57.3,40,0
    .goto IcecrownGlacier,56.2,58.9,40,0
    .goto IcecrownGlacier,55.6,59.7,40,0
    .goto IcecrownGlacier,54.5,60.0,40,0
    .goto IcecrownGlacier,55.7,57.3
	>>进入萨隆邪铁矿井, 与奴隶交谈以解救他们(有时他们可能会攻击你)
    .complete 13300,1 --Saronite Mine Slave rescued (10)
	.skipgossip
	.isOnQuest 13300
step << Alliance
    .goto IcecrownGlacier,58.2,55.9,70,0
    .goto IcecrownGlacier,59.6,59.3,70,0
    .goto IcecrownGlacier,57.8,62.6
	>>在伊米海姆各地击杀维库人
	.complete 13336,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13336
step << Alliance
    .goto Icecrown,57.01,62.53
	>>注意:此任务将使你处于PVP状态. 不过, 完成起来非常简单
    .daily 13280 >>接任务: |cRXP_LOOT_占山为王|r
step << Alliance
    #completewith next
    .goto Icecrown,56.99,62.60
    .vehicle 31784 >>右键点击那个看起来像侏儒的机器人
	.isOnQuest 13280
step << Alliance
    .goto Icecrown,54.89,60.12
	>>使用“跳跃喷气机”(3)快速攀爬悬崖(无冷却时间). 到达山顶后, 使用“插置联盟战斗旗帜”(1)放置旗帜. 然后离开载具
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
	>>与小队队长交谈. 如果其他玩家已开始任务, 他可能不在现场, 且有约6分钟的刷新时间. 若不想等待或打算稍后再来, 可跳过此步骤
    .daily 13301 >>接任务: |cRXP_LOOT_地面突袭|r
step << Horde
    .goto IcecrownGlacier,58.2,55.9,0
    .goto IcecrownGlacier,59.6,59.3,0
    .goto IcecrownGlacier,57.8,62.6,0
	#completewith Mineslave
	>>在伊米海姆各地击杀维库人
	.complete 13330,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13330
step << Horde
	>>护送部队. 必要时让部分部队承担怪物仇恨
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
	>>进入萨隆邪铁矿井, 与奴隶交谈以解救他们(有时他们可能会攻击你)
    .complete 13302,1 --Saronite Mine Slave rescued (10)
	.skipgossip
	.isOnQuest 13302
step << Horde
    .goto IcecrownGlacier,58.2,55.9,70,0
    .goto IcecrownGlacier,59.6,59.3,70,0
    .goto IcecrownGlacier,57.8,62.6
	>>在伊米海姆各地击杀维库人
	.complete 13330,1 --Ymirheim Vrykul Slain (20)
	.isOnQuest 13330
step << Horde
    .goto IcecrownGlacier,51.9,57.6
	>>注意:此任务会使你处于PvP状态, 但难度非常低
    .daily 13283 >>接任务: |cRXP_LOOT_占山为王|r
step << Horde
    #completewith next
    .goto Icecrown,51.95,57.62
    .vehicle >>右键点击那个看起来像侏儒的机器人
	.isOnQuest 13283
step << Horde
    .goto Icecrown,54.89,60.12
	>>使用“跳跃喷气机”(3)快速攀爬悬崖(无冷却时间). 到达山顶后, 使用“竖立部落战旗”(1)插上旗帜. 然后离开载具
    .complete 13283,1 --1/1 Horde Battle Standard planted
	.isOnQuest 13283
step << Horde
    .goto Icecrown,51.9,57.6
    .turnin 13283 >>交任务: |cRXP_FRIENDLY_占山为王|r
	.isQuestComplete 13283
step << Horde
	>>返回地面指挥官科特亚
    .goto Icecrown,58.3,46.0
    .turnin 13301 >>交任务: |cRXP_FRIENDLY_地面突袭|r
	.isQuestComplete 13301
step
	>>前往平台, 击杀该区域的苦痛新兵, 搜刮他们的幻象之球
	.use 44246 >>当你脱离战斗时, 对区域内的黑暗压制者使用幻象宝珠
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
	.use 44222 >>在背包中使用飞镖枪攻击奥格瑞姆之锤侦察兵(可在飞行坐骑上使用). 击杀后, 搜刮他们的尸体以获取密令
    .complete 13333,1 --Orgrim's Hammer Dispatch (6)
	.isOnQuest 13333
step << Horde
	.goto IcecrownGlacier,48.85,40.44
	.use 44212 >>在空中使用背包中的SGM-3对[破天号侦查机]进行攻击
	.complete 13331,1 --Skybreaker Recon Fighters shot down (6)
	.isOnQuest 13331
step
    .goto IcecrownGlacier,49.7,34.4
	.use 44307 >>使用背包中的稀释过的诅咒教徒滋补剂, 获得“黑暗洞察”增益效果. 该效果使你在该区域击杀所有类人生物时, 可直接获取被污染的精华
	.collect 44301,10,13322,1 << Alliance
	.collect 44301,10,13357,1 << Horde
	.isOnQuest 13322 << Alliance
	.isOnQuest 13357 << Horde
step
    .goto IcecrownGlacier,49.7,34.4
	.use 44301 -- to combine the 10 tainted essences into a writhing mass
	.use 44304 >>右键点击背包中的被污染的精华, 将其转化为蠕动之物. 然后将其投入坩埚中
	.complete 13322,1 << Alliance
	.complete 13357,1 << Horde
	.isOnQuest 13322 << Alliance
	.isOnQuest 13357 << Horde
step
    .goto IcecrownGlacier,54.1,31.4,70,0
    .goto IcecrownGlacier,54.7,28.0,70,0
    .goto IcecrownGlacier,57.0,28.8,70,0
    .goto IcecrownGlacier,54.1,31.4
	.use 44433 >>击杀5名被奴役的爪牙(虚空行者). 使用虹吸魔杖在它们尸体上获取暗物质
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
	>>返回破天者号. 与骑士队长德洛斯彻和虔诚的阿布萨兰和高级指挥官加斯汀·巴雷特和首席技师波尔维克以及萨萨里安交谈
    .turnin -13336 >>交任务: |cRXP_FRIENDLY_伊米亚之血|r
    .turnin -13300 >>交任务: |cRXP_FRIENDLY_萨隆邪铁的奴隶|r
    .turnin -13322 >>交任务: |cRXP_FRIENDLY_重新考验|r
    .turnin -13323 >>交任务: |cRXP_FRIENDLY_从天而“降”|r
	.turnin -13344 >>交任务: |cRXP_FRIENDLY_活动窃听器|r
    .turnin -13333 >>交任务: |cRXP_FRIENDLY_抢夺急件|r
step << Horde
	.goto IcecrownGlacier,67.00,38.00
	>>返回奥格瑞姆之锤. 与战争使者达沃斯·里赫和凯尔坦修士和掠天者考尔姆·黑痕和首席技师考伯克拉和库尔迪拉·织亡者交谈
    .turnin -13330 >>交任务: |cRXP_FRIENDLY_伊米亚之血|r
    .turnin -13302 >>交任务: |cRXP_FRIENDLY_萨隆邪铁的奴隶|r
    .turnin -13357 >>交任务: |cRXP_FRIENDLY_重新考验|r
    .turnin -13353 >>交任务: |cRXP_FRIENDLY_从天而“降”|r
	.turnin -13365 >>交任务: |cRXP_FRIENDLY_活动窃听器|r
    .turnin -13331 >>交任务: |cRXP_FRIENDLY_盲目的联盟|r

--6 Quest section from Knights of the Ebon Blade. 3 come from The Shadow Vault, other 3 from Death's Rise

step
	+要解锁黑锋骑士团的日常任务, 您必须先完成冰冠冰川中的任务链. 请使用“黑锋骑士团日常任务解锁指南”来解锁这些任务
	.isQuestAvailable 12814

-- 3 Quests from The Shadow Vault
step
	>>从暗影拱顶接受3个日常任务
    >>与银对话
	.daily 12995 >>接任务: |cRXP_LOOT_彰显军威|r
	.goto Icecrown,42.84,24.92
	>>与跳跃者交谈. 他在帐篷附近游荡
	.daily 13069 >>接任务: |cRXP_LOOT_把它们打下来！|r
	.goto IcecrownGlacier,43.5,25.0
	>>与劣尸维尔交谈, 他是一名在入口与主楼之间的道路上巡逻的憎恶
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
	.use 42480 >>击杀该区域的维库人. 在他们的尸体上使用背包中的黑锋旗帜
    .complete 12995,1--Ebon Blade Banner planted near Vrykul corpse (15)
	.isOnQuest 12995
step
    .goto IcecrownGlacier,27.9,33.2
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
    >>返回暗影地窖. 与银和跳跃者和劣尸维尔交谈
	.turnin 12995 >>交任务: |cRXP_FRIENDLY_彰显军威|r
	.goto Icecrown,42.84,24.92
    .turnin 13069 >>交任务: |cRXP_FRIENDLY_把它们打下来！|r
	.goto IcecrownGlacier,43.5,25.0
    .turnin 13071 >>交任务: |cRXP_FRIENDLY_维尔喜欢火焰！|r
    .goto IcecrownGlacier,43.6,24.1,60,0
    .goto IcecrownGlacier,42.7,26.8

-- 3 Quests from Death's Rise
step
	>>从死亡高地接受3个日常任务
	>>与塞塔尔交谈
	.daily 12813 >>接任务: |cRXP_LOOT_转化尸体|r
	.goto Icecrown,19.67,48.39
	>>与野牛交谈. 他会在中间的火堆附近巡逻
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
	>>击杀该区域内的狮鹫骑士. 使用远程技能将它们击落, 或将其引到空中集中后俯冲而下进行击杀
    .complete 12815,1 --Onslaught Gryphon Rider (10)
	.isOnQuest 12815
step
    #completewith next
	.goto IcecrownGlacier,9.5,44.8,50,0
    .goto IcecrownGlacier,9.5,44.8,0,0
	.use 40587 >>击杀该区域的“狂潮”怪物. 在它们的尸体上使用背包中的“暗愈者药剂”
    .complete 12813,1 --Scarlet Onslaught corpse transformed (10)
	.isOnQuest 12813
step
	>>击杀猛攻部队的敌人, 然后从他们身上获取钥匙. 用这些钥匙打开先锋军港口周围的所有宝箱, 以获得文件
	>>|cff00ecff注意:只有闪烁的宝箱中才包含文件, 未闪烁的宝箱不包含文件. |r
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
	.use 40587 >>击杀该区域的“狂潮”怪物. 在它们的尸体上使用背包中的“暗愈者药剂”
    .complete 12813,1 --Scarlet Onslaught corpse transformed (10)
	.isOnQuest 12813
step
	#requires Gryphon
	>>返回死亡之巅. 与乌佐和塞塔尔和奥罗克斯交谈
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
