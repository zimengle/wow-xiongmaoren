RXPGuides.RegisterGuide([[
#version 1
#group +RestedXP 诺森德日常任务
#subgroup 阵营日常任务
#wotlk
#cata
#name 霍迪尔之子日常任务路线
#displayname 霍迪尔之子日常任务路线 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
	+要解锁霍迪尔之子的日常任务, 你必须先完成风暴峭壁中的任务链. 请使用《霍迪尔之子日常任务解锁指南》来解锁这些日常任务
	.isQuestAvailable 13047
step
	>>与弗约恩之砧和霍迪尔之号角和霍迪尔之盔和冰霜座狼母兽和霍迪尔之矛以及贪婪的安格里姆交谈
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
	>>与弗约恩之砧和霍迪尔之号角和霍迪尔之盔和冰霜座狼母兽和霍迪尔之矛交谈
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
	.goto TheStormPeaks,58.67,60.64,60,0
	.goto TheStormPeaks,57.23,64.02,60,0
	.goto TheStormPeaks,55.94,65.69,60,0
	.goto TheStormPeaks,59.25,59.94
	.use 42769 >>使用背包中的霍迪尔之矛钩住一条狂野巨龙. 执行此操作前, 请确保你的生命值已满
	>>反复使用“抓握”(1)来提升你的抓握值. 当巨龙挥击时, 使用“闪避爪击”(2). 在冷却完毕后, 使用“长矛突刺”(3)和“复仇长矛突刺”(4)
	>>记得持续按住(1)键, 否则如果你只用(3)和(4)键狂攻, 就会掉下去！
	>>当野生巨龙的生命值低于30%时, 你的技能条会改变. 连续使用“撬开颚骨(1)”五次, 然后使用“致命打击(3)”. 如果“致命打击”未命中, 请继续使用“撬开颚骨(1)”, 直到“致命打击(3)”的冷却时间结束
	.complete 13003,1 --Stormforged Infiltrators Slain (3)
	.isOnQuest 13003
step
	>>返回丹尼芬雷
	>>与弗约恩之砧和霍迪尔之号角和霍迪尔之盔和冰霜座狼母兽和霍迪尔之矛以及贪婪的安格里姆交谈
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
	>>返回丹尼芬雷
	>>与弗约恩之砧和霍迪尔之号角和霍迪尔之盔和霍迪尔之矛以及贪婪的安格里姆交谈
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
	>>返回丹尼芬雷
	>>与弗约恩之砧和霍迪尔之号角和霍迪尔之盔和冰霜座狼母兽和霍迪尔之矛交谈
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
	>>与弗约恩之砧和霍迪尔之号角和霍迪尔之盔和霍迪尔之矛交谈
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
step
	+你已完成今日所有“霍迪尔之子”日常任务 :) 记住, 你可以将该区域地面拾取的永冻薄片交给NPC以获取额外声望, 同时也可以提交 [奥杜尔的圣物] 来换取更多声望！
]])
