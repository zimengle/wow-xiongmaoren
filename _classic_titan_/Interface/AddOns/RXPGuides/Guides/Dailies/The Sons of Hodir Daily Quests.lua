RXPGuides.RegisterGuide([[
#version 1
#group +休息经验 诺森德每日任务
#subgroup 派系每日任务
#wotlk
#cata
#name 霍迪尔之子日常任务路线

step
	+要解锁霍迪尔之子的日常任务，你必须先完成风暴峭壁中的任务链。请使用霍迪尔之子的每日任务解锁指南来解锁每日任务
	.isQuestAvailable 13047
step
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔、霜狼兽母、霍迪尔的长矛和贪得无厌的阿恩格里姆交谈
    .daily 12981 >>接任务: |cRXP_LOOT_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .daily 12977 >>接任务: |cRXP_LOOT_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.daily 13006 >>接任务: |cRXP_LOOT_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.daily 12994 >>接任务: |cRXP_LOOT_猎杀间谍|r
	.goto TheStormPeaks,63.49,59.73
	.daily 13003 >>接任务: |cRXP_LOOT_屠龙记|r
	.goto TheStormPeaks,65.00,60.95
	.daily 13046 >>接任务: |cRXP_LOOT_喂饱安格里姆|r
	.goto TheStormPeaks,67.61,59.95
	.reputation 1119,revered,<0,1 -- if you're 0 into revered it will display this step
step
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔、霜狼兽母和霍迪尔的长矛交谈
    .daily 12981 >>接任务: |cRXP_LOOT_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .daily 12977 >>接任务: |cRXP_LOOT_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.daily 13006 >>接任务: |cRXP_LOOT_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.daily 12994 >>接任务: |cRXP_LOOT_猎杀间谍|r
	.goto TheStormPeaks,63.49,59.73
	.daily 13003 >>接任务: |cRXP_LOOT_屠龙记|r
	.goto TheStormPeaks,65.00,60.95
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
	.goto TheStormPeaks,58.67,60.64,60,0
	.goto TheStormPeaks,57.23,64.02,60,0
	.goto TheStormPeaks,55.94,65.69,60,0
	.goto TheStormPeaks,59.25,59.94
	.use 42769 >>使用背包中的霍迪尔之矛来钩住一条野生巨龙。在执行此操作之前，请确保您的生命值已满
	>>反复使用“抓握” (1) 来增加你的抓握力。当巨龙向你挥动时，使用“躲避爪子” (2)。使用“长矛刺击” (3) 和“复仇长矛刺击” (4) 冷却中
	>>记住要不断抓住（1），否则如果你只使用（3）和（4）进行攻击，你就会掉下去！
	>>一旦野生巨龙的生命值低于 30%，你的攻击条就会改变。使用撬开下巴 (1) 五次，然后使用致命一击 (3)。如果致命一击失败，继续使用撬开下巴 (1)，直到致命一击 (3) 冷却完毕
	.complete 13003,1 --Stormforged Infiltrators Slain (3)
	.isOnQuest 13003
step
	>>返回丹·尼弗莱姆
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔、霜狼兽母、霍迪尔的长矛和贪得无厌的阿恩格里姆交谈
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.turnin 12994 >>交任务: |cRXP_FRIENDLY_猎杀间谍|r
	.goto TheStormPeaks,63.49,59.73
	.turnin 13003 >>交任务: |cRXP_FRIENDLY_屠龙记|r
	.goto TheStormPeaks,65.00,60.95
	.turnin 13046 >>交任务: |cRXP_FRIENDLY_喂饱安格里姆|r
	.goto TheStormPeaks,67.61,59.95
	.isQuestComplete 12994
	.isQuestComplete 13003
	.isQuestComplete 13046
step
	>>返回丹·尼弗莱姆
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔、霍迪尔的长矛和贪得无厌的阿恩格里姆交谈
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.turnin 13003 >>交任务: |cRXP_FRIENDLY_屠龙记|r
	.goto TheStormPeaks,65.00,60.95
	.turnin 13046 >>交任务: |cRXP_FRIENDLY_喂饱安格里姆|r
	.goto TheStormPeaks,67.61,59.95
	.isQuestComplete 13003
	.isQuestComplete 13046
step
	>>返回丹·尼弗莱姆
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔、霜狼兽母和霍迪尔的长矛交谈
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.turnin 12994 >>交任务: |cRXP_FRIENDLY_猎杀间谍|r
	.goto TheStormPeaks,63.49,59.73
	.turnin 13003 >>交任务: |cRXP_FRIENDLY_屠龙记|r
	.goto TheStormPeaks,65.00,60.95
	.isQuestComplete 12994
	.isQuestComplete 13003
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
	>>与菲约恩的铁砧、霍迪尔的号角、霍迪尔的头盔和霍迪尔的长矛交谈
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
	.goto TheStormPeaks,64.24,59.23
	.turnin 13003 >>交任务: |cRXP_FRIENDLY_屠龙记|r
	.goto TheStormPeaks,65.00,60.95
	.isQuestComplete 13003
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
step
	+您已完成今天的所有“霍迪尔之子”日常任务 :) 请记住，您可以交出该区域地面上找到的永霜碎片以获得额外的声望，也可以交出奥杜尔遗物！
]])
