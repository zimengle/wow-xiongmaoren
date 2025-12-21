RXPGuides.RegisterGuide([[
#version 1
#group +RestedXP 诺森德日常任务
#subgroup 阵营日常任务
#wotlk
#cata
#name 霍迪尔之子开启日常任务
#displayname 霍迪尔之子开启日常任务 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    +您已完成霍迪尔之子前置任务链. 请使用霍迪尔之子日常任务路线指南完成日常任务
	.isQuestTurnedIn 13047
step
	.goto TheStormPeaks,41.15,86.14
	>>飞往K3
    >>进入旅店. 与格雷琴对话
    .accept 12843 >>接任务: |cRXP_LOOT_她们把男人都抓走了！|r
step
    .goto TheStormPeaks,40.1,73.8,70,0
    .goto TheStormPeaks,40.3,69.8,70,0
    .goto TheStormPeaks,42.2,71.0,70,0
    .goto TheStormPeaks,41.6,73.7,60,0
    .goto TheStormPeaks,40.7,72.7
	>>飞往希弗列尔达村
	>>杀死希弗尔达尔获取寒铁钥匙. 用这些钥匙打开该区域的地精囚犯牢笼
    .collect 40641,5,12843,1,-1
    .complete 12843,1 --Goblin Prisoner freed (5)
step
    .goto TheStormPeaks,41.15,86.14
	>>返回K3, 进入旅店与格雷琴对话
    .turnin 12843 >>交任务: |cRXP_FRIENDLY_她们把男人都抓走了！|r
    .accept 12846 >>接任务: |cRXP_LOOT_一个地精也不能少|r
step << !Human
	#completewith tribute
	>>奥杜尔遗物会从风暴峭壁各地怪物身上掉落, 你也可以通过拍卖行购买
    .collect 42780,10 --Relic of Ulduar (10)
    .reputation 1119,friendly,>0,1 -- Step only shows if rep is below friendly
step
    .goto TheStormPeaks,42.1,69.5,60,0
    .goto TheStormPeaks,42.80,68.90
	>>进入弗隆矿井. 与洛克里拉交谈
    .turnin 12846 >>交任务: |cRXP_FRIENDLY_一个地精也不能少|r
    .accept 12841 >>接任务: |cRXP_LOOT_女巫的交易|r
step
    .goto TheStormPeaks,44.3,67.1,30,0
    .goto TheStormPeaks,44.1,70.2,30,0
    .goto TheStormPeaks,45.1,71.0
	>>击杀弗隆矿井内的监督者希尔拉. 从她身上搜刮伊尔奎文符文
    .complete 12841,1 --符文 of the Yrkvinn (1)
	.unitscan Overseer Syra
step
    .goto TheStormPeaks,42.80,68.90
	>>返回洛克里拉
    .turnin 12841 >>交任务: |cRXP_FRIENDLY_女巫的交易|r
    .accept 12905 >>接任务: |cRXP_LOOT_残酷的米尔德蕾|r
step
    .goto TheStormPeaks,44.39,68.93
	>>上楼梯. 与米尔德丽德交谈
    .turnin 12905 >>交任务: |cRXP_FRIENDLY_残酷的米尔德蕾|r
    .accept 12906 >>接任务: |cRXP_LOOT_训诫|r
step
    .goto TheStormPeaks,44.8,67.2,40,0
    .goto TheStormPeaks,44.6,70.6,40,0
    .goto TheStormPeaks,44.1,69.9,40,0
    .goto TheStormPeaks,44.8,71.3,40,0
    .goto TheStormPeaks,44.3,66.8,40,0
    .goto TheStormPeaks,43.0,68.0,40,0
    .goto TheStormPeaks,43.4,70.5
	.use 42837 >>在矿井的竖井中, 使用背包中的训诫之杖对筋疲力尽的维库人进行施法
    .complete 12906,1 --Exhausted Vrykul Disciplined (6)
step
    .goto TheStormPeaks,44.39,68.93
	>>与米尔德丽德对话
    .turnin 12906 >>交任务: |cRXP_FRIENDLY_训诫|r
    .accept 12907 >>接任务: |cRXP_LOOT_杀一儆百|r
step
    .goto TheStormPeaks,45.40,69.10
	>>在米尔德丽德以东的洞穴中击杀加哈尔
    .complete 12907,1 --Garhal (1)
step
    .goto TheStormPeaks,44.39,68.93
	>>与米尔德丽德对话
    .turnin 12907 >>交任务: |cRXP_FRIENDLY_杀一儆百|r
    .accept 12908 >>接任务: |cRXP_LOOT_特殊的囚犯|r
step
    .goto TheStormPeaks,42.80,68.90
	>>与洛克里拉交谈
    .turnin 12908 >>交任务: |cRXP_FRIENDLY_特殊的囚犯|r
    .accept 12921 >>接任务: |cRXP_LOOT_改头换面|r
step
    .goto TheStormPeaks,41.8,69.6,30,0
    .goto TheStormPeaks,47.47,69.09
	>>离开弗隆矿井, 飞往布伦希尔达村
    .turnin 12921 >>交任务: |cRXP_FRIENDLY_改头换面|r
    .accept 12969 >>接任务: |cRXP_LOOT_这是你的地精吗？|r
step
    .goto TheStormPeaks,48.25,69.77
	>>与阿格内塔交谈, 然后击杀她以解救齐夫
    .complete 12969,1 --Agnetta Tyrsdottar (1)
	.skipgossip
step
    .goto TheStormPeaks,47.47,69.09
	>>与洛克里拉交谈
    .turnin 12969 >>交任务: |cRXP_FRIENDLY_这是你的地精吗？|r
    .accept 12970 >>接任务: |cRXP_LOOT_海德比武会|r
	>>与巫婆洛克里拉谈谈她的提议
    .complete 12970,1 --Listen to Lok'lira's proposal (1)
	.skipgossip 29975,1
    .turnin 12970 >>交任务: |cRXP_FRIENDLY_海德比武会|r
    .accept 12971 >>接任务: |cRXP_LOOT_迎接挑战者|r
step
    .goto TheStormPeaks,50.5,68.1,30,0
    .goto TheStormPeaks,51.5,66.2
	>>与该区域的获胜挑战者交谈, 然后攻击他们. 杀死他们
    .complete 12971,1 --Victorious Challenger (6)
	.skipgossip
step
    .goto TheStormPeaks,47.47,69.09
	>>与洛克里拉交谈
    .turnin 12971 >>交任务: |cRXP_FRIENDLY_迎接挑战者|r
    .accept 12972 >>接任务: |cRXP_LOOT_你需要一头熊|r
step
    .goto TheStormPeaks,53.14,65.72
	>>与布莉亚娜交谈
    .turnin 12972 >>交任务: |cRXP_FRIENDLY_你需要一头熊|r
    .accept 12851 >>接任务: |cRXP_LOOT_熊熊大作战|r
step
   	#completewith next
    .goto The Storm Peaks,53.12,65.61
	.vehicle >>在布莉亚娜旁边召唤冰牙山
step
    .goto TheStormPeaks,53.1,65.6,0
    .goto TheStormPeaks,57.4,63.0
	>>使用烈焰之箭(1)击中冰霜座狼和霜巨人. 不要使用疾风突进(2), 只需专注于命中所有目标
    .complete 12851,1 --Frostworgs Burned (7)
    .complete 12851,2 --Frost Giants Burned (15)
step
    .goto TheStormPeaks,53.14,65.72
	>>使用“速度爆发”(2)更快回到布里亚娜身边. 然后与她交谈
    .turnin 12851 >>交任务: |cRXP_FRIENDLY_熊熊大作战|r
    .accept 12856 >>接任务: |cRXP_LOOT_冰冷的心|r
step
    #completewith next
    .goto TheStormPeaks,63.20,62.88
	.vehicle >>飞往丹尼芬雷. 骑上一只被捕获的始祖幼龙, 它们被锁链拴在丹尼芬雷外城墙周围的大冰刺上
step
    .waypoint TheStormPeaks,53.1,65.7,0,niffelen,VEHICLE_PASSENGERS_CHANGED,VEHICLE_UPDATE
    .goto The Storm Peaks,66.75,60.63
	>>当你靠近被寒冰屏障冻结的布伦希尔达囚犯时, 使用你的坐骑龙的第一个技能
    >>当你在你的始祖幼龙上拥有3名囚犯时, 返回布伦希尔达. 重复此任务3次
    .complete 12856,1 --Rescued Brunnhildar Prisoners (9)
    .complete 12856,2 --Freed Proto-Drakes (3)
step
    .goto TheStormPeaks,53.14,65.72
	>>与布莉亚娜交谈
    .turnin 12856 >>交任务: |cRXP_FRIENDLY_冰冷的心|r
    .accept 13063 >>接任务: |cRXP_LOOT_证明价值|r
step
    .goto TheStormPeaks,49.75,71.81
	>>返回布伦希尔达. 与阿斯特丽德对话
    .turnin 13063 >>交任务: |cRXP_FRIENDLY_证明价值|r
    .accept 12900 >>接任务: |cRXP_LOOT_制造挽具|r
step
    .goto TheStormPeaks,48.3,74.7,70,0
    .goto TheStormPeaks,48.3,77.1,70,0
    .goto TheStormPeaks,44.8,74.1
	>>击杀冰鬃雪人, 掠夺它们的兽皮
    .complete 12900,1 --Icemane Yeti Hide (3)
step
    .goto TheStormPeaks,49.75,71.81
	>>与阿斯特丽德对话
    .turnin 12900 >>交任务: |cRXP_FRIENDLY_制造挽具|r
    .accept 12983 >>接任务: |cRXP_LOOT_最后的母熊|r
    .accept 12989 >>接任务: |cRXP_LOOT_黑暗的冰虫|r
step
    #completewith next
    .goto TheStormPeaks,55.8,63.9,30 >>进入冬眠洞穴
step
    .goto TheStormPeaks,54.8,60.4
	>>击杀洞穴中的蛇颈龙
 	>>暂时不要骑乘洞穴中间那只受伤的熊
    .complete 12989,1 --Ravenous Jormungar (8)
step
	#completewith next
    .goto TheStormPeaks,54.79,60.37
	.vehicle >>右键点击冰爪母后, 骑乘它离开冬眠洞穴
step
    .goto TheStormPeaks,49.82,71.12
	>>骑着熊返回布鲁恩希尔达. 这段路程需要1分8秒, 你可以在途中稍作休息
    .complete 12983,1 --Icemaw Matriarch Rescued (1)
step
    .goto TheStormPeaks,49.75,71.81
	>>与阿斯特丽德对话
    .turnin 12983 >>交任务: |cRXP_FRIENDLY_最后的母熊|r
    .accept 12996 >>接任务: |cRXP_LOOT_热身赛|r
    .turnin 12989 >>交任务: |cRXP_FRIENDLY_黑暗的冰虫|r
step
	#completewith next
    .goto TheStormPeaks,50.79,67.68
	.vehicle >>飞往基尔格拉克. 使用背包中的冰喉母熊的缰绳骑乘它
	.use 42481
step
    .goto TheStormPeaks,50.79,67.68
	.use 42481 >>击杀基尔加拉克. 使用重击(1)造成伤害. 使用猛击(2)接冲锋(3)以造成额外伤害
    .complete 12996,1 --Kirgaraak Defeated (1)
step
	.goto TheStormPeaks,49.75,71.81
	>>下熊. 与阿斯特丽德交谈
    .turnin 12996 >>交任务: |cRXP_FRIENDLY_热身赛|r
    .accept 12997 >>接任务: |cRXP_LOOT_进入利齿之坑|r
step
	#completewith next
    .goto TheStormPeaks,49.24,68.46
	.vehicle >>飞往獠牙之坑. 使用背包中的冰喉母熊的缰绳骑乘它
	.use 42499
step
    .goto TheStormPeaks,49.24,68.46
	.use 42499 >>击杀坑中的战熊. 使用重击(1)造成伤害. 使用猛击(2)接冲锋(3)以造成额外伤害
    .complete 12997,1 --Hyldsmeet Warbear (6)
step
    .goto TheStormPeaks,49.75,71.81
	>>下熊. 与阿斯特丽德交谈
    .turnin 12997 >>交任务: |cRXP_FRIENDLY_进入利齿之坑|r
    .accept 13061 >>接任务: |cRXP_LOOT_为荣耀而战|r
step
    .goto TheStormPeaks,47.47,69.09
	>>与洛克里拉交谈
    .turnin 13061 >>交任务: |cRXP_FRIENDLY_为荣耀而战|r
    .accept 13062 >>接任务: |cRXP_LOOT_洛莉拉的离别赠礼|r
step
    .goto TheStormPeaks,50.88,65.58
	>>与格雷塔对话
    .turnin 13062 >>交任务: |cRXP_FRIENDLY_洛莉拉的离别赠礼|r
    .accept 12886 >>接任务: |cRXP_LOOT_驭龙赛|r
step
    .goto TheStormPeaks,35.4,57.8
	.use 41058 >>骑乘飞龙前往风暴神殿(耗时1分10秒, 途中可稍作休息). 使用背包中的海德尼尔鱼叉跃上搭载龙骑士的飞龙, 并击杀它们
    .complete 12886,1 --Hyldsmeet Drakerider Defeated (10)
step
    .goto TheStormPeaks,33.42,57.95
	>>使用海德尼尔鱼叉击中风暴神殿柱子上的装饰石柱(较小的球体), 即可跳到其上
	>>与托里姆对话
    .turnin 12886 >>交任务: |cRXP_FRIENDLY_驭龙赛|r
    .accept 13064 >>接任务: |cRXP_LOOT_骨肉相残|r
	>>与托里姆对话
    .complete 13064,1 --Thorim's History Heard (1)
	.skipgossip 29445,1
    .turnin 13064 >>交任务: |cRXP_FRIENDLY_骨肉相残|r
    .accept 12915 >>接任务: |cRXP_LOOT_弥补关系|r
	.use 41058
step
	#completewith Giants
	#label Slag
    .goto TheStormPeaks,71.8,61.1,0
	>>击杀风暴铸铁巨人, 搜刮其身上的炉渣覆盖金属, 开始任务
	.collect 41556,1,12922,1 --Slag Covered Metal (1)
    .accept 12922 >>接任务: |cRXP_LOOT_精炼之火|r
step
	#completewith next
	#requires Slag
    .goto TheStormPeaks,70.7,56.7,70,0
    .goto TheStormPeaks,69.6,62.0,70,0
    .goto TheStormPeaks,76.8,62.9
	>>击杀你所见的所有火热的亡魂, 搜刮它们身上的火花
    .complete 12922,1 --Furious Spark (10)
step
	#label Giants
    .goto TheStormPeaks,75.0,63.6,70,0
    .goto TheStormPeaks,71.8,61.1
	>>掠夺霜原湖和弗约恩铁砧地面上的花岗岩石块(一次只能携带一块)
	.use 41505 >>当你在雷铸铁巨人处携带巨石时, 使用背包中的托里姆大地护身符来帮助击杀它们
	.collect 41506,1,12915,1,-1
    .complete 12915,2 --Stormforged Iron Giants (5)
step
    .goto TheStormPeaks,71.8,61.1
	>>击杀风暴铸铁巨人, 搜刮其身上的炉渣覆盖金属, 开始任务
	.collect 41505,1,12922,1 --Slag Covered Metal (1)
    .accept 12922 >>接任务: |cRXP_LOOT_精炼之火|r
step
    .goto TheStormPeaks,70.7,56.7,70,0
    .goto TheStormPeaks,69.6,62.0,70,0
    .goto TheStormPeaks,76.8,62.9
	>>击杀躁动的亡灵, 搜刮它们身上的火花
    .complete 12922,1 --Furious Spark (10)
step
	#completewith end
	#label FjornAnvil
    .goto TheStormPeaks,77.17,62.84
	>>点击弗约恩旁边的铁砧
    .turnin 12922 >>交任务: |cRXP_FRIENDLY_精炼之火|r
    .accept 12956 >>接任务: |cRXP_LOOT_希望的火花|r
step
    .goto TheStormPeaks,77.34,62.87
	>>掠夺霜原湖和弗约恩铁砧地面上的花岗岩石块(一次只能携带一块)
	.use 41505 >>当你在弗约恩身上叠加了巨石时, 使用背包中的托里姆大地护符来帮助击杀他
    .complete 12915,1 --Fjorn (1)
step
	#label Thorim1
    .goto TheStormPeaks,33.4,57.9
	>>飞往托里姆
    .turnin 12915 >>交任务: |cRXP_FRIENDLY_弥补关系|r
    .turnin 12956 >>交任务: |cRXP_FRIENDLY_希望的火花|r
    .accept 12924 >>接任务: |cRXP_LOOT_重铸盟约|r
step
	.goto TheStormPeaks,65.45,60.16
	>>与约库姆国王交谈
    .accept 12966 >>接任务: |cRXP_LOOT_你不会找不到他|r
step
	.goto TheStormPeaks,75.37,63.57
	>>与亚米尔德交谈
    .turnin 12966 >>交任务: |cRXP_FRIENDLY_你不会找不到他|r
    .accept 12967 >>接任务: |cRXP_LOOT_元素之战|r
step
    #completewith next
    .goto TheStormPeaks,75.71,63.91
    .vehicle >>右键点击斯诺雷骑乘他 :3
step
    .goto TheStormPeaks,77.2,62.7
	>>使用“采集雪”(1)从附近的雪堆中获取雪. 然后使用“投掷雪球”(2)攻击火热的亡魂, 将其消灭
    .complete 12967,1 --Seething Revenants (10)
step
    .goto TheStormPeaks,75.37,63.57
	>>与亚米尔德交谈
    .turnin 12967 >>交任务: |cRXP_FRIENDLY_元素之战|r
    .complete 12924,1 --Fjorn's Anvil Brought to Dun Niffelem (1)
step << Human
	>>返回邓尼费勒姆. 与亚米尔德和铁砧交谈
    .turnin 12924 >>交任务: |cRXP_FRIENDLY_重铸盟约|r
    .accept 13009 >>接任务: |cRXP_LOOT_新的开始|r
    .accept 12985 >>接任务: |cRXP_LOOT_雷铸徽记|r
    .goto TheStormPeaks,63.20,63.27
	.daily 12981 >>接任务: |cRXP_LOOT_热与冷|r
    .goto TheStormPeaks,63.13,62.94
	.isQuestAvailable 13047
step << !Human
	>>返回邓尼费勒姆. 与亚米尔德和铁砧交谈
    .turnin 12924 >>交任务: |cRXP_FRIENDLY_重铸盟约|r
    .accept 13009 >>接任务: |cRXP_LOOT_新的开始|r
    .goto TheStormPeaks,63.20,63.27
	.daily 12981 >>接任务: |cRXP_LOOT_热与冷|r
    .goto TheStormPeaks,63.13,62.94
	.isQuestAvailable 13047
step << Human
    .goto TheStormPeaks,65.45,60.16
	>>与约库姆国王交谈
    .accept 13011 >>接任务: |cRXP_LOOT_斩除尤卡塔尔|r
    .accept 12975 >>接任务: |cRXP_LOOT_回首往事|r
step << !Human
    .goto TheStormPeaks,65.45,60.16
	>>与约库姆国王交谈
    .accept 12975 >>接任务: |cRXP_LOOT_回首往事|r
step << Human
	#completewith HornF
	>>留意该区域的“永冻薄片”物品. 如果你看到一个, 就拾取它并开始任务
	.accept 13420 >>接任务: |cRXP_LOOT_永冻之冰|r
step << Human
    .goto TheStormPeaks,69.6,58.8,70,0
    .goto TheStormPeaks,70.3,62.2
	>>击杀脆弱的亡灵, 搜刮冰霜精华
	.use 42424 >>使用钻石尖锄挖掘死去的钢铁巨人. 有时会刷新出怪物, 你需要击杀它们并掉落雷铸徽记
	.collect 42246,6 --Essence of Ice (6)
	.complete 12985,1 --Stormforged Eye (8)
	.isQuestAvailable 13047
step << !Human
    .goto TheStormPeaks,69.6,58.8,70,0
    .goto TheStormPeaks,70.3,62.2
	>>击杀脆弱的亡灵, 搜刮冰霜精华
	.collect 42246,6 --Essence of Ice (6)
	.isOnQuest 12981
	.isQuestAvailable 13047
step
    .goto TheStormPeaks,73.5,62.9,70,0
    .goto TheStormPeaks,76.2,63.4
	.use 42246 >>在弗约恩铁砧附近的冒烟的碎片旁使用冰之精华. 拾取冻铁碎片
    .complete 12981,1 --Frozen Iron Scrap (6)
	.isQuestAvailable 13047
step
	#label HornF
    .goto TheStormPeaks,71.7,47.6
	>>搜刮该区域地面上的小扁石
    .complete 12975,1 --Horn Fragment (8)
step << Human
	>>返回邓尼费勒姆. 与卡尔德和约库姆国王, 然后与亚米尔德和弗约恩之砧和霍迪尔的号角交谈
	.turnin 13420 >>交任务: |cRXP_FRIENDLY_永冻之冰|r
    .goto TheStormPeaks,67.11,60.97
    .turnin 12975 >>交任务: |cRXP_FRIENDLY_回首往事|r
    .accept 12976 >>接任务: |cRXP_LOOT_亡者的纪念碑|r
    .goto TheStormPeaks,65.45,60.16
    .turnin 12976 >>交任务: |cRXP_FRIENDLY_亡者的纪念碑|r
    .turnin 12985 >>交任务: |cRXP_FRIENDLY_雷铸徽记|r
    .accept 12987 >>接任务: |cRXP_LOOT_放置霍迪尔之盔|r
    .goto TheStormPeaks,63.20,63.27
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .daily 12977 >>接任务: |cRXP_LOOT_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.isOnQuest 13420
	.isQuestAvailable 13047
step << Human
	>>返回邓尼费勒姆. 与约库姆国王和亚米尔德和弗约恩之砧交谈
    .turnin 12975 >>交任务: |cRXP_FRIENDLY_回首往事|r
    .accept 12976 >>接任务: |cRXP_LOOT_亡者的纪念碑|r
    .goto TheStormPeaks,65.45,60.16
    .turnin 12976 >>交任务: |cRXP_FRIENDLY_亡者的纪念碑|r
    .turnin 12985 >>交任务: |cRXP_FRIENDLY_雷铸徽记|r
    .accept 12987 >>接任务: |cRXP_LOOT_放置霍迪尔之盔|r
    .goto TheStormPeaks,63.20,63.27
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
	.isQuestAvailable 13047
step << !Human
	>>返回邓尼费勒姆. 与约库姆国王和弗约恩之砧和亚米尔德交谈
    .turnin 12975 >>交任务: |cRXP_FRIENDLY_回首往事|r
    .accept 12976 >>接任务: |cRXP_LOOT_亡者的纪念碑|r
    .goto TheStormPeaks,65.45,60.16
    .turnin 12981 >>交任务: |cRXP_FRIENDLY_热与冷|r
    .goto TheStormPeaks,63.13,62.94
    .turnin 12976 >>交任务: |cRXP_FRIENDLY_亡者的纪念碑|r
    .goto TheStormPeaks,63.20,63.27
 step << !Human
	#label tribute
	.goto TheStormPeaks,66.16,61.44
    >>你可能需要完成一次奥杜尔遗迹的单人副本, 以与霍迪尔之子建立友好关系. 如果你已经与他们友好, 请跳过此步骤
    >>奥杜尔的遗物可以通过击杀风暴峭壁区域的所有怪物获得, 也可以从拍卖行购买
	>>与李奥霍夫交谈
    .collect 42780,10 --Relic of Ulduar (10)
	.turnin 13559 >>交任务: |cRXP_FRIENDLY_霍迪尔的供品|r
    .reputation 1119,friendly,>0,1 -- Step only shows if rep is below friendly
step << !Human
    >>与亚米尔德交谈
    .accept 12985 >>接任务: |cRXP_LOOT_雷铸徽记|r
    .goto TheStormPeaks,63.20,63.27
step << !Human
    .goto TheStormPeaks,69.6,58.8,70,0
    .goto TheStormPeaks,70.3,62.2
	.use 42424 >>使用钻石尖锄挖掘死去的钢铁巨人. 有时会刷新出怪物, 你需要击杀它们并掉落雷铸徽记
	.complete 12985,1 --Stormforged Eye (8)
step << !Human
	>>返回邓尼弗莱姆. 与亚米尔德和霍迪尔的号角交谈
    .turnin 12985 >>交任务: |cRXP_FRIENDLY_雷铸徽记|r
    .accept 12987 >>接任务: |cRXP_LOOT_放置霍迪尔之盔|r
    .goto TheStormPeaks,63.20,63.27
    .daily 12977 >>接任务: |cRXP_LOOT_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.isQuestAvailable 13047
step
    .goto TheStormPeaks,64.24,59.23
	.use 42442 >>飞到邓尼费伦姆闪耀的冰峰处. 骑上飞行坐骑时, 使用背包中的“宣告石板”
    .complete 12987,1 --Hodir's Helm Mounted (1)
step
    .goto TheStormPeaks,63.20,63.27
	>>与亚米尔德交谈
    .turnin 12987 >>交任务: |cRXP_FRIENDLY_放置霍迪尔之盔|r
step
    .goto TheStormPeaks,64.22,59.39
	>>与你刚放置的舵交谈
    .daily 13006 >>接任务: |cRXP_LOOT_粘滞清洁|r
	.isQuestAvailable 13047
step << !Human
    .goto TheStormPeaks,65.45,60.16
	>>与约库姆国王交谈
    .accept 13011 >>接任务: |cRXP_LOOT_斩除尤卡塔尔|r
step
	#completewith Jorcuttar
    .goto TheStormPeaks,54.4,63.2,0
	>>击杀寒冰洞穴中的粘性油污. 掠夺它们的粘性油污
    .complete 13006,1 --Viscous Oil (5)
	.isQuestAvailable 13047
step
    .goto TheStormPeaks,55.8,63.9,30,0
    .goto TheStormPeaks,54.7,60.6
	.use 42732 >>进入冬眠洞穴, 沿右侧前进. 使用永冻刀片击杀死亡的冰喉熊, 直到获得冰喉熊腰肉
	.collect 42733,1 --Icemaw Bear Flank (1)
	.isQuestAvailable 13047
step
	#label Jorcuttar
    .goto TheStormPeaks,54.8,60.8
	.use 42733 >>一直沿着洞穴右侧前进, 直到抵达主房间. 在冰封带刺湖中央使用“冰喉熊腰肉”——击杀乔克塔尔
    .complete 13011,1 --Jorcuttar (1)
step
    .goto TheStormPeaks,54.4,63.2
	>>击杀寒冰洞穴中的粘性油污. 掠夺它们的粘性油污
    .complete 13006,1 --Viscous Oil (5)
	.isQuestAvailable 13047
step
    .goto TheStormPeaks,33.42,57.95
	>>飞往风暴神殿顶端的托里姆处, 与他交谈
    .turnin 13009 >>交任务: |cRXP_FRIENDLY_新的开始|r
    .accept 13050 >>接任务: |cRXP_LOOT_维拉努斯|r
step
    .goto TheStormPeaks,45.4,66.9,40,0
    .goto TheStormPeaks,43.7,67.5
	>>掠夺山顶巢穴中的蛋
    .complete 13050,1 --Small Proto-Drake Egg (5)
step
    .goto TheStormPeaks,33.42,57.95
	>>飞往风暴神殿顶端的托里姆处, 与他交谈
    .turnin 13050 >>交任务: |cRXP_FRIENDLY_维拉努斯|r
    .accept 13051 >>接任务: |cRXP_LOOT_侵犯领土|r
step
    .goto TheStormPeaks,38.73,65.54
	.cast 56788 >>使用背包中[偷来的始祖龙卵], 放置在巢母之巢顶部, 以引诱维拉努斯
	.timer 42,Veranus RP (CONTINUE QUESTING)
	.use 42797
	.isQuestAvailable 13047
step
    .goto TheStormPeaks,33.42,57.95
	>>飞到风暴神殿顶端的托里姆那里. 与他对话. 在托里姆处等待前一个任务的剧情动画播放完毕, 大约需要1分钟
    .turnin 13051 >>交任务: |cRXP_FRIENDLY_侵犯领土|r
    .accept 13010 >>接任务: |cRXP_LOOT_科洛米尔，风暴之锤|r
step
	#completewith DunNif2
    .goto TheStormPeaks,29.5,74.3
	>>飞往丹尼芬雷
	.isQuestAvailable 13047
step
	>>与霍迪尔的号角交谈
    .daily 12977 >>接任务: |cRXP_LOOT_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.isQuestAvailable 13047
step
	#label DunNif2
	>>与丹尼芬雷的霍迪尔头盔和约库姆国王交谈
    .turnin 13006 >>交任务: |cRXP_FRIENDLY_粘滞清洁|r
    .goto TheStormPeaks,64.22,59.39
    .turnin 13011 >>交任务: |cRXP_FRIENDLY_斩除尤卡塔尔|r
	.vehicle >>与乔库姆国王交谈. 骑着他前往落雷谷
	.timer 118,Krolmir, Hammer of Storms RP
	.skipgossip
	.isQuestAvailable 13047
step
	#completewith TerraceM
	>>留意该区域的“永冻薄片”物品. 如果你看到一个, 就拾取它并开始任务
	.accept 13420 >>接任务: |cRXP_LOOT_永冻之冰|r
	.isQuestAvailable 13047
step
	#completewith ThorimRP
    .goto TheStormPeaks,70.7,47.3,0
    .goto TheStormPeaks,70.1,52.5,0
    .goto TheStormPeaks,72.7,52.1,0
    .goto TheStormPeaks,74.7,48.3,0
	.use 42164 >>击杀该区域的尼芬雷先祖和躁动霜裔, 在他们的尸体上使用背包中的霍迪尔的号角, 以解救他们
	>>你可以在RP活动期间执行此操作
    .complete 12977,1 --Niffelem Forefather freed (5)
    .complete 12977,2 --Restless Frostborn freed (5)
	.isQuestAvailable 13047
step
    .goto TheStormPeaks,71.37,48.78
	>>等待RP完成
    .complete 13010,1 --Krolmir's Fate Discovered (1)
	.isQuestAvailable 13047
step
	#label ThorimRP
    .goto TheStormPeaks,71.37,48.78
	>>在托里姆消失前与他对话
    .turnin 13010 >>交任务: |cRXP_FRIENDLY_科洛米尔，风暴之锤|r
    .accept 13057 >>接任务: |cRXP_LOOT_造物者圣台|r
	.isQuestAvailable 13047
step
    .goto TheStormPeaks,70.7,47.3,60,0
    .goto TheStormPeaks,70.1,52.5,60,0
    .goto TheStormPeaks,72.7,52.1,60,0
    .goto TheStormPeaks,74.7,48.3
	.use 42164 >>击杀该区域的尼芬雷先祖和躁动霜裔, 在他们的尸体上使用背包中的霍迪尔的号角, 以解救他们
    .complete 12977,1 --Niffelem Forefather freed (5)
    .complete 12977,2 --Restless Frostborn freed (5)
	.isQuestAvailable 13047
step
	#label TerraceM
    .goto TheStormPeaks,56.26,51.36
	>>与造物者圣台的托里姆交谈
    .turnin 13057 >>交任务: |cRXP_FRIENDLY_造物者圣台|r
    .accept 13005 >>接任务: |cRXP_LOOT_土灵的誓言|r
    .accept 13035 >>接任务: |cRXP_LOOT_洛肯的副官|r
	.isQuestAvailable 13047
step
	#completewith Duronn
    .goto TheStormPeaks,52.0,50.4,0
	.use 42840 >>使用背包中的[峭壁号角], 帮助你在前往指定目标怪物的途中击杀铁矮人和铁哨兵
    .complete 13005,1 --Iron Sentinel (7)
    .complete 13005,2 --Iron Dwarf Assailant (20)
	.isQuestAvailable 13047
step
    .goto TheStormPeaks,48.72,45.65
	.use 42840 >>使用背包中的峭壁号角召唤一支小军队, 然后用它击杀哈雷夫尼尔
    .complete 13035,2 --Halefnir the Windborn (1)
step
	#label Duronn
    .goto TheStormPeaks,44.94,38.03
	.use 42840 >>使用背包中的峭壁号角召唤一支小军队, 然后用它击杀杜隆
    .complete 13035,3 --Duronn the Runewrought (1)
step
	#completewith next
    .goto TheStormPeaks,57.7,44.5,50,0
    .goto TheStormPeaks,57.7,44.5,0
	.use 42840 >>使用[峭壁号角]帮助你击杀艾森福斯特洞穴外的铁哨兵
    .complete 13005,1 --Iron Sentinel (7)
step
    .goto TheStormPeaks,56.9,44.1,30,0
    .goto TheStormPeaks,55.30,43.32
	>>进入位于山脉东侧山脚的塑造者之厅
	.use 42840 >>使用峭壁号角召唤一支小队. 用它击杀伊森法斯
    .complete 13035,1 --Eisenfaust (1)
step
    .goto TheStormPeaks,58.48,45.21
	.use 42840 >>使用背包中的[峭壁号角], 帮助你击杀该区域的铁矮人和铁哨兵
    .complete 13005,1 --Iron Sentinel (7)
    .complete 13005,2 --Iron Dwarf Assailant (20)
step
    .goto TheStormPeaks,56.26,51.36
	>>与造物者圣台的托里姆交谈
    .turnin 13005 >>交任务: |cRXP_FRIENDLY_土灵的誓言|r
    .turnin 13035 >>交任务: |cRXP_FRIENDLY_洛肯的副官|r
    .accept 13047 >>接任务: |cRXP_LOOT_清算之战|r
step
    #completewith next
	.goto TheStormPeaks,44.49,28.19
	>>飞到奥杜尔外围
    .fp Ulduar >>获取奥杜尔飞行路径
    .skill riding,<300,1
step
    .goto TheStormPeaks,35.93,31.52
	>>飞到奥杜尔外的托里姆那里, 与他交谈并等待剧情事件结束
    .complete 13047,1 --Witness the Reckoning (1)
	.skipgossip
	.timer 91,The Reckoning RP
step
	#completewith end
    .goto TheStormPeaks,44.49,28.19
	>>飞到奥杜尔外围
    .fp Ulduar >>获取奥杜尔飞行路径
	.fly Dun Niffelem >>飞往丹尼弗莱姆. 这段路程需要1分44秒, 你可以在飞行途中稍作休息
    .skill riding,300,1
step
	#completewith next
    .goto TheStormPeaks,36.2,49.3,200 >>骑上飞行坐骑前往丹尼芬雷
    .skill riding,<300,1
step
	>>返回邓尼弗莱姆. 与约克姆和卡尔德和霍迪尔的号角交谈
    .turnin 13047 >>交任务: |cRXP_FRIENDLY_清算之战|r
--  .accept 13108 >>接任务: |cRXP_LOOT_不惜代价！|r
    .goto TheStormPeaks,65.45,60.16
	.turnin 13420 >>交任务: |cRXP_FRIENDLY_永冻之冰|r
    .goto TheStormPeaks,67.11,60.97
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
	.isOnQuest 13420
step
	#label end
	>>返回邓尼弗莱姆. 与乔克姆和霍迪尔的号角交谈
    .turnin 13047 >>交任务: |cRXP_FRIENDLY_清算之战|r
--  .accept 13108 >>接任务: |cRXP_LOOT_不惜代价！|r
    .goto TheStormPeaks,65.45,60.16
    .turnin 12977 >>交任务: |cRXP_FRIENDLY_霍迪尔的呼唤|r
    .goto TheStormPeaks,64.17,65.01
step -- checking that player has honored with hodir to get this quest. will only be humans and any other that turned in rep items
	>>与丹尼芬雷的博学者兰德维尔交谈
	.goto TheStormPeaks,64.84,59.05
	.accept 13001 >>接任务: |cRXP_LOOT_打造霍迪尔之矛|r
	.reputation 1119,honored,<0,1
step
	>>击杀斯多葛猛犸象, 掠夺它们的兽皮
	.goto TheStormPeaks,58.68,60.94,60,0
	>>在冬眠洞穴中拾取永冻碎片
	.complete 13001,2 --Stoic Mammoth Hide (3)
	.complete 13001,1 --Everfrost Shard (3)
	.goto TheStormPeaks,55.84,63.94,50,0
   	.goto TheStormPeaks,54.72,60.82
	.isOnQuest 13001
step
	>>与丹尼芬雷的博学者兰德维尔交谈
	.goto TheStormPeaks,64.84,59.05
	.turnin 13001 >>交任务: |cRXP_FRIENDLY_打造霍迪尔之矛|r
	.isQuestComplete 13001
step
    +您已完成霍迪尔之子前置任务链. 请使用霍迪尔之子日常任务路线指南来完成日常任务. 请注意, 部分任务可能因今日已提前完成而无法接取
	.isQuestTurnedIn 13047
]])
