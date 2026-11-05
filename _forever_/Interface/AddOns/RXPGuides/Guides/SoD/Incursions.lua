RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 梦魇进犯日常
#classic
#season 2
#group RestedXP Nightmare Incursion Dailies
#name (25-32) Duskwood Nightmare Incursion
#title 暮色森林梦魇进犯
#displayname （25-32）暮色森林梦魇进犯
step
    #optional
    #completewith travel
    +|cRXP_WARN_你的等级已超出本处梦魇进犯区域，继续做这里的任务会获得较少经验。请从列表中选择适合当前等级的入侵区域|r
    >>|cRXP_WARN_声望奖励不受等级影响；达到53级后，可反复交付专业材料任务快速获取声望|r
    .xp <33,1
    .xp >53,1
step
#ah
    >>前往暮色森林前，从拍卖行各购买 10 个 |T133852:0|t[|cRXP_LOOT_梦魇苔|r]、10 个 |T134314:0|t[|cRXP_LOOT_梦触龙鳞|r] 和 10 个 |T134575:0|t[|cRXP_LOOT_冷铁矿石|r]
    >>|cRXP_WARN_如果附近没有拍卖行，或材料价格不划算，可跳过此步骤。这三个日常合计奖励225点基础声望，经验收益受等级和经验加成影响|r
    .collect 219399,10 --Nightmare Moss
    .collect 219402,10 --Dream-Touched Dragonscale
    .collect 219401,10 --Cold Iron Ore
    .maxlevel 52
step
#completewith next
.zone Duskwood >> |cRXP_WARN_前往暮色森林。确保任务日志有足够空间：入侵任务需要同时保留12到15个任务|r
.maxlevel 52
step
    #label travel
  .goto 1431/0,-438.800,-10793.400,30 >> 前往通向暮光林地的小径
  .maxlevel 52
step
    .goto 1431/0,-376.600,-10768.500,30 >> 沿小路向上前进
    .maxlevel 52
step
    >>|cRXP_WARN_这些符文已无声望购买门槛；也可从各族起始区域的符文商人处购买|r
    >>在标记位置找到|cRXP_FRIENDLY_翡翠守望者|r军需官，向其购买本职业符文
    .goto Duskwood,45.6,51.2
    .target 军需官法里纳尔
    .collect 221480,1 << Mage --Spell Notes: Molten Armor
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alacrity
    .collect 221515,1 << Hunter --Rune of Detonation
    .collect 221517,1 << Druid --Rune of Bloodshed
    .collect 223288,1 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 52
step
    .train 427080 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_守护符文|r] |cRXP_WARN_学习|r |T132359:0|t[盾牌精通] << Warrior
    .use 221511 << Warrior
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_虚无顿悟|r] |cRXP_WARN_学习|r |T132886:0|t[虚空领域] << Priest
    .train 429308 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：熔岩护甲|r] |cRXP_WARN_学习|r |T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r] |cRXP_WARN_学习|r |T136228:0|t[痛苦无常] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r] |cRXP_WARN_学习|r |T135822:0|t[燃烧] << Shaman
    .train 432297 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_敏锐符文|r] |cRXP_WARN_学习|r |T236269:0|t[穷追猛砍] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_爆破符文|r] |cRXP_WARN_学习|r |T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_溅血符文|r] |cRXP_WARN_学习|r |T304501:0|t[淤血] << Druid
    .train 429261 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_锤头符文|r] |cRXP_WARN_学习|r |T236262:0|t[强化愤怒之锤] << Paladin
    .use 221480 << Mage -- Spell Notes: Molten Armor
    .use 221481 << Priest --Nihilist Epiphany
    .use 221482 << Warlock --Rune of Affliciton
    .use 221483 << Shaman --Rune of Burn
    .use 221512 << Rogue --Rune of Alacrity
    .use 221515 << Hunter --Rune of Detonation
    .use 221517 << Druid --Rune of Bloodshed
    .use 223288 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 52
step
    #optional
    .goto Duskwood,45.6,51.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_军需官法里纳尔|r 交谈
    .vendor >> |cRXP_BUY_最多购买 5 瓶|r |T134718:0|t[强效治疗药水] |cRXP_BUY_，可按需向他购买。|r |cRXP_WARN_这些药水仅能在梦魇进犯区域内使用|r
    .target 军需官法里纳尔
    .xp >40,1
    .maxlevel 52
step
    #optional
    .goto Duskwood,45.6,51.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_军需官法里纳尔|r 交谈
    .vendor >> |cRXP_BUY_最多购买 5 瓶|r |T236885:0|t[特效治疗药水] |cRXP_BUY_，可按需向他购买。|r |cRXP_WARN_这些药水仅能在梦魇进犯区域内使用|r
    .target 军需官法里纳尔
    .xp <40,1
    .maxlevel 52
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长帕兰达尔|r 交谈
    .goto Duskwood,45.6,51.2
    .accept 81739 >> 接任务：暮色森林使命X：梦魇苔
    .accept 81740 >> 接任务：暮色森林使命XI：冷铁矿石
    .accept 81741 >> 接任务：暮色森林使命XII：梦触龙鳞
    .itemcount 219399,10 --Nightmare Moss
    .itemcount 219401,10 --Cold Iron Ore
    .itemcount 219402,10 --Dream-Touched Dragonscale
    .maxlevel 52
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长帕兰达尔|r 交谈
    .goto Duskwood,45.6,51.2
    .accept 81739 >> 接任务：暮色森林使命X：梦魇苔
    .itemcount 219399,10 --Nightmare Moss
    .maxlevel 52
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长帕兰达尔|r 交谈
    .goto Duskwood,45.6,51.2
    .accept 81740 >> 接任务：暮色森林使命XI：冷铁矿石
    .itemcount 219401,10 --Cold Iron Ore
    .maxlevel 52
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长帕兰达尔|r 交谈
    .goto Duskwood,45.6,51.2
    .accept 81741 >> 接任务：暮色森林使命XII：梦触龙鳞
    .itemcount 219402,10 --Dream-Touched Dragonscale
    .maxlevel 52
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长帕兰达尔|r 交谈
    .goto Duskwood,45.6,51.2
    .turnin -81739,1 >> 交任务：暮色森林使命X：梦魇苔
    .turnin -81740,1 >> 交任务：暮色森林使命XI：冷铁矿石
    .turnin -81741,1 >> 交任务：暮色森林使命XII：梦触龙鳞
step
    >>首次参与时，若队长提供“取回进犯战地报告”，可先在现实世界击杀门外恶魔，并向斥候取得报告后交付
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长帕兰达尔|r 交谈
    >>|cRXP_WARN_接下来完成一轮梦魇进犯任务。这些任务均可组队完成，从而提高效率。若任务发布者附近有其他玩家，可尝试组队。找到几名队友后，还能完成单人无法击败的首领任务|r
    .goto Duskwood,45.6,51.2
    .target 战地队长帕兰达尔
    .accept 81730 >> 接任务：暮色森林使命I：击败狼人
    .accept 81731 >> 接任务：暮色森林使命II：击败食人魔
    .accept 81732 >> 接任务：暮色森林使命III：击败龙类
    .accept 81733 >> 接任务：暮色森林使命IV：食人魔情报
    .accept 81734 >> 接任务：暮色森林使命V：狼人情报
    .accept 81735 >> 接任务：暮色森林使命VI：巨龙情报
    .accept 81736 >> 接任务：暮色森林使命VII：取回暗影之镰
    .accept 81737 >> 接任务：暮色森林使命VIII：取回食人魔法师手记
    .accept 81738 >> 接任务：暮色森林使命IX：取回龙蛋
    .accept 81745 >> 接任务：暮色森林使命XVI：营救克洛尔·丘影
    .accept 81746 >> 接任务：暮色森林使命XVII：营救阿拉菈·愈林
    .accept 81747 >> 接任务：暮色森林使命XVIII：营救艾乐诺拉·涉沼
    .maxlevel 52
step
.group 3
    .goto Duskwood,45.6,51.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长帕兰达尔|r 交谈
    >>|cRXP_WARN_若已组队，也可考虑接受精英击杀任务。需要击杀的首领血量极高，难度取决于队伍配置|r
    .accept 81742 >> 接任务：暮色森林使命XIII：击败伊兰希乌斯
    .accept 81743 >> 接任务：暮色森林使命XIV：击败瓦阿克祖
    .accept 81744 >> 接任务：暮色森林使命XV：击败阿莫卡洛克
    .maxlevel 52
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #completewith next
    +|cRXP_WARN_点击任务发布者旁的小型梦境传送门|r，进入翡翠梦境
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    .goto Duskwood,47.07,49.64,10 >> |cRXP_WARN_进入翡翠梦境后|r，离开暮光林地
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #sticky
    #label Ogres
    >>完成其他目标的同时, 击杀 |cRXP_ENEMY_错乱的食人魔|r 和 |cRXP_ENEMY_癫狂的织火者|r
    .complete 81731,1
    .complete 81731,2
    .mob 错乱的食人魔
    .mob 癫狂的织火者
step
    #optional
    .isOnQuest 81747
    .isQuestNotComplete 81747
    .goto Duskwood,32.48,69.60
    .gossipoption 122140 >> 与躺在地上的 |cRXP_FRIENDLY_艾乐诺拉·涉沼|r 交谈。她应该会开始跟随你。
    >>|cRXP_WARN_若她不在，说明其他玩家正在护送她。找不到她就跳过此步骤|r
    .target 艾乐诺拉·涉沼
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #completewith next
    +|cRXP_WARN_注意：如果你死亡，所有跟随你的护送 NPC 都会返回原位置，需要重新找到他们|r
    >>|cRXP_WARN_护送 NPC 会在开始跟随你15分钟后停止跟随，请尽快带他们返回|r
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    .goto Duskwood,35.67,80.35
    >>进入洞穴, 拾取中央平台上的 [|cRXP_LOOT_食人魔法师手记|r]
    .complete 81737,1 --Ogre Magi Text(1)
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    .goto Duskwood,36.62,83.75
    >>深入洞穴, 与 |cRXP_FRIENDLY_梦境卫士塔林纳尔|r 交谈, 领取 |T134939:0|t[|cRXP_LOOT_情侦报告：沃古尔食人魔山|r]
    .complete 81733,1
    .target 梦境卫士塔林纳尔
    .skipgossip
step
    .goto Duskwood,37.6,84.6
    .group 3
    >>|cRXP_WARN_击杀|r |cRXP_ENEMY_瓦阿克祖|r|cRXP_WARN_。它血量极高，会施放|r |T135812:0|t[火球术] |cRXP_WARN_并召唤|r |T135819:0|t[火元素] |cRXP_WARN_小怪|r
    .complete 81743,1 --Vvarc'Zul slain
    .target 瓦阿克祖
    .isOnQuest 81743
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #sticky
    #label Dragons
    #requires Ogres
    >>完成其他目标的同时, 击杀 |cRXP_ENEMY_梦惧雏龙|r 和 |cRXP_ENEMY_龙族巡惧者|r
    .complete 81732,1
    .complete 81732,2
    .mob 梦惧雏龙
    .mob 龙族巡惧者
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #requires Ogres
    .goto Duskwood,48.92,72.97
    >>拾取树桩旁地面上的 [|cRXP_LOOT_未孵化的绿龙蛋|r]
    .complete 81738,1
step
    #optional
    .isOnQuest 81746
    .isQuestNotComplete 81746
    .goto Duskwood,49.13,77.41
    .gossipoption 122136 >> 与躺在地上的 |cRXP_FRIENDLY_阿拉菈·愈林|r 交谈。她应该会开始跟随你。
    >>|cRXP_WARN_若她不在，说明其他玩家正在护送她。找不到她就跳过此步骤|r
    .target 阿拉菈·愈林
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    .goto Duskwood,50.6,77.0
    >>进入农舍, 与 |cRXP_FRIENDLY_梦境卫士阿玛利亚|r 交谈, 领取 |T134939:0|t[|cRXP_LOOT_情侦报告：约根农场|r]
    .complete 81735,1
    .target 梦境卫士阿玛利亚
    .skipgossip
step
    .goto Duskwood,49.8,74.4
    .group 3
    >>|cRXP_WARN_击杀|r |cRXP_ENEMY_伊兰希乌斯|r。|cRXP_WARN_它是在农场上空飞行的绿龙|r|cRXP_WARN_，血量极高，免疫自然系法术，会施放|r|T132338:0|t[顺劈斩]|cRXP_WARN_、|r |T134307:0|t[龙尾扫击] |cRXP_WARN_，还会|r |T135745:0|t[召唤] |cRXP_WARN_一只|r |cRXP_ENEMY_幼龙|r |cRXP_WARN_；幼龙的正面吐息伤害极高|r
    .complete 81742,1 --Ylanthrius (1)
    .isOnQuest 81742
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #sticky
    #label Worgen
    #requires Dragons
    >>完成其他目标的同时, 击杀 |cRXP_ENEMY_梦魇奔行者|r 和 |cRXP_ENEMY_梦魇编织者|r
    .complete 81730,1
    .complete 81730,2
    .mob 梦魇奔行者
    .mob 梦魇编织者
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #requires Dragons
    .goto Duskwood,66.32,76.09
    >>进入谷仓, 与 |cRXP_FRIENDLY_梦境卫士多力拉|r 交谈, 领取 |T134939:0|t[|cRXP_LOOT_情侦报告：烂果园|r]
    >>|cRXP_WARN_不要深入谷仓。选中 NPC 后使用交互键，可隔着内墙与他交谈|r
    >>|cRXP_WARN_小心首领|r |cRXP_ENEMY_阿莫卡洛克|r |cRXP_WARN_就在NPC旁边|r
    .complete 81734,1
    .target 梦境卫士多力拉
    .skipgossip
step
    .goto Duskwood,66.0,76.4
    >>|cRXP_WARN_在谷仓内击杀|r |cRXP_ENEMY_阿莫卡洛克|r |cRXP_WARN_——血量极高, 会施放范围|r |T136183:0|t[恐惧]
    .complete 81744,1 --Amokarok (1)
    .isOnQuest 81744
    .group 3
step
    #optional
    .isOnQuest 81745
    .isQuestNotComplete 81745
    .goto Duskwood,65.99,69.36
    .gossipoption 122146 >> 与躺在地上的 |cRXP_FRIENDLY_克洛尔·丘影|r 交谈。他应该会开始跟随你。
    >>|cRXP_WARN_若他不在，说明其他玩家正在护送他。找不到他就跳过此步骤|r
    .target 克洛尔·丘影
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    .goto Duskwood,65.60,67.30
    >>前往较大房屋的二楼, 拾取箱子中的 |T135138:0|t[|cRXP_LOOT_暗影之镰|r]
    .complete 81736,1
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #requires Worgen
    .goto Duskwood,70.93,65.90
    .goto Duskwood,44.60,65.80,50 >> 向西走到梦境边界，屏幕泛绿光后会被传送回入口附近。|cRXP_WARN_护送中的 NPC 也会跟着传送|r
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #completewith next
    .goto 1431/0,-421.400,-10360.601,5 >> 返回梦魇传送门。|cRXP_WARN_途中不要死亡，否则护送任务会失败；安全抵达后，三个护送任务应会完成|r
step
    #optional
    .isOnQuest 81745
    .goto 1431/0,-421.400,-10360.601
    >>确认三个护送任务均已获得进度。抵达传送门时应全部完成；|cRXP_WARN_若没有进度，可在附近来回走动|r
    >>|cRXP_WARN_未能找到或带回的护送对象可跳过，其余已完成任务仍可交付|r
    .complete 81745,1
step
    #optional
    .isOnQuest 81746
    .goto 1431/0,-421.400,-10360.601
    >>将这名护送对象带到梦境传送门坡道底部；如果未能带回，可跳过此任务
    .complete 81746,1
step
    #optional
    .isOnQuest 81747
    .goto 1431/0,-421.400,-10360.601
    >>将这名护送对象带到梦境传送门坡道底部；如果未能带回，可跳过此任务
    .complete 81747,1
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    .goto Duskwood,46.63,47.90,5 >> 返回进入翡翠梦境时使用的小型梦境传送门，|cRXP_WARN_点击它回到现实世界|r
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长帕兰达尔|r 交谈
    .goto Duskwood,45.6,51.2
    .target 战地队长帕兰达尔
    .turnin 81730 >> 交任务：暮色森林使命I：击败狼人
    .turnin 81731 >> 交任务：暮色森林使命II：击败食人魔
    .turnin 81732 >> 交任务：暮色森林使命III：击败龙类
    .turnin 81733 >> 交任务：暮色森林使命IV：食人魔情报
    .turnin 81734 >> 交任务：暮色森林使命V：狼人情报
    .turnin 81735 >> 交任务：暮色森林使命VI：巨龙情报
    .turnin 81736 >> 交任务：暮色森林使命VII：取回暗影之镰
    .turnin 81737 >> 交任务：暮色森林使命VIII：取回食人魔法师手记
    .turnin 81738 >> 交任务：暮色森林使命IX：取回龙蛋
    .turnin -81745,1 >> 交任务：暮色森林使命XVI：营救克洛尔·丘影
    .turnin -81746,1 >> 交任务：暮色森林使命XVII：营救阿拉菈·愈林
    .turnin -81747,1 >> 交任务：暮色森林使命XVIII：营救艾乐诺拉·涉沼
step
    .isOnQuest 81739,81740,81741,81730,81731,81732,81733,81734,81735,81736,81737,81738,81745,81746,81747,81742,81743,81744
    #optional
    .goto Duskwood,45.6,51.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长帕兰达尔|r 交谈
    >>|cRXP_WARN_交付本轮已经完成的精英击杀任务；未接取或未完成的任务会跳过|r
    .turnin -81742,1 >> 交任务：暮色森林使命XIII：击败伊兰希乌斯
    .turnin -81743,1 >> 交任务：暮色森林使命XIV：击败瓦阿克祖
    .turnin -81744,1 >> 交任务：暮色森林使命XV：击败阿莫卡洛克
    .target 战地队长帕兰达尔
step
    #optional
    +|cRXP_WARN_你已超过所有梦魇进犯区域的任务等级上限，无法再接取其中的常规任务|r
    >>若想提升声望，可向|r |cRXP_FRIENDLY_翡翠守望者|r 在菲拉斯的无限重复任务交付 10 个 |T134186:0|t[|cRXP_LOOT_月之根|r]、|T133594:0|t[|cRXP_LOOT_强效月亮石|r] 或 |T134312:0|t[|cRXP_LOOT_月龙之鳞|r]，三种材料任选一种
    >>这些任务没有经验或金币奖励，每次交付获得100点声望。按需要从拍卖行购买单价最划算的材料，前往菲拉斯反复交付
    .xp <53,1
step
    #optional
    +你已完成这轮梦魇进犯任务，每日重置后可再次接取。|cRXP_WARN_从列表中选择其他指南继续|r
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 梦魇进犯日常
#classic
#season 2
#group RestedXP Nightmare Incursion Dailies
#name (40-49) Ashenvale Nightmare Incursion
#title 灰谷梦魇进犯
#displayname （40-49）灰谷梦魇进犯
step
    #optional
    #completewith next
    +|cRXP_WARN_你的等级已超出本处梦魇进犯区域，继续做这里的任务会获得较少经验。请从列表中选择适合当前等级的入侵区域|r
    >>|cRXP_WARN_声望奖励不受等级影响；达到53级后，可反复交付专业材料任务快速获取声望|r
    .xp <48,1
    .xp >53,1
step
    #ah
    >>前往灰谷前，从拍卖行购买10个|T132106:0|t[|cRXP_LOOT_梦之根|r]、10个|T134306:0|t[|cRXP_LOOT_梦注龙鳞|r]和10个|T133848:0|t[|cRXP_LOOT_愚人金砂|r]
    >>|cRXP_WARN_如果附近没有拍卖行，或材料价格不划算，可跳过此步骤。这三个日常合计奖励225点基础声望，经验收益受等级和经验加成影响|r
    .collect 219444,10 --Dreamroot
    .collect 219446,10 --Dream-Infused Dragonscale
    .collect 219445,10 --Fool's Gold Dust
    .maxlevel 52
step
    #season 2
    #label travel
    .zone Ashenvale >> 前往灰谷。|cRXP_WARN_确保任务日志有足够空间：进犯任务需要同时保留12到15个任务|r
    >>若有艾萨拉飞行点, 飞过去再跑往灰谷比飞到阿斯特兰纳更省时 << Alliance
    .maxlevel 52
step
    .goto Ashenvale,88.9,42.0,65 >>前往灰谷东北部的翡翠梦魇传送门区域
    .maxlevel 52
step
    >>|cRXP_WARN_这些符文已无声望购买门槛；也可从各族起始区域的符文商人处购买|r
    .goto Ashenvale,89.60,40.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官基琳|r交谈
    .target 军需官基琳
    .collect 221480,1 << Mage --Spell Notes: Molten Armor
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alacrity
    .collect 221515,1 << Hunter --Rune of Detonation
    .collect 221517,1 << Druid --Rune of Bloodshed
    .collect 223288,1 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 52
step
    .train 427080 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_守护符文|r] |cRXP_WARN_学习|r |T132359:0|t[盾牌精通] << Warrior
    .use 221511 << Warrior
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_虚无顿悟|r] |cRXP_WARN_学习|r |T132886:0|t[虚空领域] << Priest
    .train 429308 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：熔岩护甲|r] |cRXP_WARN_学习|r |T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r] |cRXP_WARN_学习|r |T136228:0|t[痛苦无常] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r] |cRXP_WARN_学习|r |T135822:0|t[燃烧] << Shaman
    .train 432297 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_敏锐符文|r] |cRXP_WARN_学习|r |T236269:0|t[穷追猛砍] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_爆破符文|r] |cRXP_WARN_学习|r |T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_溅血符文|r] |cRXP_WARN_学习|r |T304501:0|t[淤血] << Druid
    .train 429261 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_锤头符文|r] |cRXP_WARN_学习|r |T236262:0|t[强化愤怒之锤] << Paladin
    .use 221480 << Mage -- Spell Notes: Molten Armor
    .use 221481 << Priest --Nihilist Epiphany
    .use 221482 << Warlock --Rune of Affliciton
    .use 221483 << Shaman --Rune of Burn
    .use 221512 << Rogue --Rune of Alacrity
    .use 221515 << Hunter --Rune of Detonation
    .use 221517 << Druid --Rune of Bloodshed
    .use 223288 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 52
step
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长汉娜拉|r交谈
    .accept 81777 >> 接任务：灰谷使命X：梦之根
    .accept 81778 >> 接任务：灰谷使命XI：愚人金砂
    .accept 81779 >> 接任务：灰谷使命XII：梦注龙鳞
    .itemcount 219444,10 --Dreamroot
    .itemcount 219446,10 --Dream-Infused Dragonscale
    .itemcount 219445,10 --Fool's Gold Dust
    .maxlevel 52
step
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长汉娜拉|r交谈
    .accept 81777 >> 接任务：灰谷使命X：梦之根
    .itemcount 219444,10 --Dreamroot
    .maxlevel 52
step
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长汉娜拉|r交谈
    .accept 81778 >> 接任务：灰谷使命XI：愚人金砂
    .itemcount 219445,10 --Fool's Gold Dust
    .maxlevel 52
step
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长汉娜拉|r交谈
    .accept 81779 >> 接任务：灰谷使命XII：梦注龙鳞
    .itemcount 219446,10 --Dream-Infused Dragonscale
    .maxlevel 52
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长汉娜拉|r交谈
    .turnin -81777,1 >> 交任务：灰谷使命X：梦之根
    .turnin -81778,1 >> 交任务：灰谷使命XI：愚人金砂
    .turnin -81779,1 >> 交任务：灰谷使命XII：梦注龙鳞
step
    >>首次参与时，若队长提供“取回进犯战地报告”，可先在现实世界击杀门外恶魔，并向斥候取得报告后交付
    #season 2
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长汉娜拉|r交谈
    .accept 81772 >>接任务：灰谷使命V：萨特情报
    .accept 81785 >>接任务：灰谷使命XVIII：营救马塞拉·秋月
    .accept 81784 >>接任务：灰谷使命XVII：营救多兰·梦枝
    .accept 81783 >>接任务：灰谷使命XVI：营救阿莱希娅·唤风者
    .accept 81776 >>接任务：灰谷使命IX：取回梦触龙蛋
    .accept 81775 >>接任务：灰谷使命VIII：取回艾萨拉预言
    .accept 81774 >>接任务：灰谷使命VII：取回造梦引擎
    .accept 81773 >>接任务：灰谷使命VI：树人情报
    .accept 81771 >>接任务：灰谷使命IV：巨龙情报
    .accept 81768 >>接任务：灰谷使命I：击败萨特
    .accept 81769 >>接任务：灰谷使命II：击败树人
    .accept 81770 >>接任务：灰谷使命III：击败龙类
    .target 战地队长汉娜拉
    .maxlevel 52
step
    #season 2
    #optional
    .group 3
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长汉娜拉|r交谈
    >>|cRXP_WARN_若已组队，也可考虑接精英击杀任务；首领血量极高，难度取决于队伍配置|r
    .accept 81780 >> 接任务：灰谷使命XIII：击败拉尔瑟拉
    .accept 81781 >> 接任务：灰谷使命XIV：击败查利乌斯
    .accept 81782 >> 接任务：灰谷使命XV：击败伐木机9000型
    .maxlevel 52
step
    #optional
    #season 2
    .goto Ashenvale,89.60,40.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官基琳|r交谈
    .vendor >>|cRXP_BUY_最多购买5瓶|r |T236885:0|t[特效治疗药水]|cRXP_BUY_，可按需要向她购买|r
    >>|cRXP_WARN_这些药水只能在梦魇进犯区域内使用|r
    .target 军需官基琳
    .maxlevel 52
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    #completewith IncursionsComplete
    .goto Ashenvale,93.94,38.21,25,0
    .goto Ashenvale,94.27,35.13,20 >>点击大型翡翠梦境传送门前的|cRXP_PICK_小型梦境传送门|r，进入梦魇进犯区域
    >>|cRXP_WARN_避开沿途恶魔，使用小型梦境传送门切换区域；大型传送门通往梦魇巨龙团队副本|r
    .aura 444759
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    #completewith EllodarReport
    >>击杀 |cRXP_ENEMY_龙族夜行者|r 和 |cRXP_ENEMY_惊惧雏龙|r
    >>|cRXP_WARN_小心：|r|cRXP_ENEMY_龙族夜行者|r|cRXP_WARN_是41级精英|r
    .complete 81770,1 --Wyrmkin Nightstalker slain: 3/3
    .mob +龙族夜行者
    .complete 81770,2 --Terror Whelp slain: 10/10
    .mob +惊惧雏龙
step
    #optional
    #season 2
    .goto Ashenvale,87.24,43.58
    .gossipoption 122139 >>与 |cRXP_FRIENDLY_多兰·梦枝|r 交谈, 他会开始跟随你
    .target 多兰·梦枝
    .isOnQuest 81784
    .isQuestNotComplete 81784
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #completewith next
    +|cRXP_WARN_注意：如果你死亡，所有跟随你的护送 NPC 都会返回原位置，需要重新找到他们|r
    >>|cRXP_WARN_护送 NPC 会在开始跟随你15分钟后停止跟随，请尽快带他们返回|r
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    .goto Ashenvale,86.11,45.87
    >>拾取地面上的 |cRXP_LOOT_梦触龙蛋|r
    .complete 81776,1 --Dream-Touched Dragon Egg: 1/1
step
    #season 2
    .group 3
    .goto Ashenvale,86.0,46.0
    >>|cRXP_WARN_击杀|r |cRXP_ENEMY_拉尔瑟拉|r|cRXP_WARN_。她血量极高，免疫自然系法术，会施放|r|T132338:0|t[顺劈斩]|cRXP_WARN_、|r |T134307:0|t[龙尾扫击] |cRXP_WARN_，还会|r |T135745:0|t[召唤] |cRXP_WARN_一只|r |cRXP_ENEMY_幼龙|r |cRXP_WARN_；幼龙的正面吐息伤害极高|r
    .complete 81780,1 --Defeat Larsera
    .isOnQuest 81780
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    #label EllodarReport
    .goto Ashenvale,83.64,45.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦境卫士艾罗达|r交谈
    .complete 81771,1 --Intelligence Report: Forest Song: 1/1
    .target 梦境卫士艾罗达
    .skipgossip
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    .goto Ashenvale,81.54,48.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦境卫士曼多兰|r交谈
    .complete 81772,1 --Intelligence Report: Satyrnaar: 1/1
    .target 梦境卫士曼多兰
    .skipgossip
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    #completewith MasearaAut
    .goto Ashenvale,80.74,51.19,0
    .goto Ashenvale,80.72,50.24,0
    .goto Ashenvale,80.74,51.19,0
    .goto Ashenvale,79.89,49.31,0
    .goto Ashenvale,80.78,48.47,0
    .goto Ashenvale,81.72,48.52,0
    .goto Ashenvale,82.20,50.18,0
    .goto Ashenvale,80.00,46.71,0
    .goto Ashenvale,78.29,44.73,0
    .goto Ashenvale,80.72,50.24,0
    >>击杀 |cRXP_ENEMY_梦火背叛者|r 和 |cRXP_ENEMY_梦火唤魔者|r
    .complete 81768,2 --Dreamfire Betrayer slain: 10/10
    .mob +梦火背叛者
    .complete 81768,1 --Dreamfire Hellcaller slain: 10/10
    .mob +梦火唤魔者
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    .goto 1440/1,-2950.700,2791.700
    >>拾取地上的 |cRXP_LOOT_艾萨拉预言|r
    .complete 81775,1 --Azsharan Prophecy: 1/1
step
    #optional
    #season 2
    #label MasearaAut
    .goto 1440/1,-2978.000,2739.500
    .gossipoption 122150 >>与 |cRXP_FRIENDLY_马塞拉·秋月|r 交谈, 她会开始跟随你
    .target 马塞拉·秋月
    .isOnQuest 81785
    .isQuestNotComplete 81785
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    #loop
    .goto Ashenvale,80.74,51.19,0
    .goto Ashenvale,80.72,50.24,0
    .goto Ashenvale,80.74,51.19,50,0
    .goto Ashenvale,79.89,49.31,50,0
    .goto Ashenvale,80.78,48.47,50,0
    .goto Ashenvale,81.72,48.52,50,0
    .goto Ashenvale,82.20,50.18,50,0
    .goto Ashenvale,80.00,46.71,50,0
    .goto Ashenvale,78.29,44.73,50,0
    .goto Ashenvale,80.72,50.24,50,0
    >>击杀 |cRXP_ENEMY_梦火背叛者|r 和 |cRXP_ENEMY_梦火唤魔者|r
    .complete 81768,2 --Dreamfire Betrayer slain: 10/10
    .mob +梦火背叛者
    .complete 81768,1 --Dreamfire Hellcaller slain: 10/10
    .mob +梦火唤魔者
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    .goto 1440/1,-3394.600,2540.900
    >>打开 |cRXP_PICK_震动的箱子|r. 搜刮出 |cRXP_LOOT_造梦引擎|r
    .complete 81774,1 --Dreamengine: 1/1
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    #completewith next
    .goto Ashenvale,90.14,58.08,10 >>进入卡加希亚要塞
    >>|cRXP_WARN_入口被|r |cRXP_ENEMY_梦境收割者|r |cRXP_WARN_（41级精英）挡住；可控制或击杀它，再冲进要塞|r
    .mob 梦境收割者
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    .goto Ashenvale,91.23,58.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦境卫士拉娜莉亚|r交谈
    .complete 81773,1 --Intelligence Report: Warsong Lumber Camp: 1/1
    .target 梦境卫士拉娜莉亚
    .skipgossip
step
.group 3
    #season 2
    .goto Ashenvale,87.6,62.2
    >>|cRXP_WARN_击杀|r |cRXP_ENEMY_伐木机9000型|r。它血量极高，会施放 |T132338:0|t[顺劈斩] 和 |T132338:0|t[范围击退]
    .complete 81782,1 --Defeat Shredder 9000
    .isOnQuest 81782
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #sticky
    #label Treants
    .goto Ashenvale,85.6,65.6,0
    .goto Ashenvale,86.6,59.6,0
    .goto Ashenvale,90.0,50.2,0
    >>击杀区域内的 |cRXP_ENEMY_狂怒的古树|r
    >>|cRXP_WARN_这些是精英怪, 无法单刷可跳过|r
    .complete 81769,1 --Vengeful Ancient slain (7)
step
    #optional
    #season 2
    .goto Ashenvale,92.11,54.21
    .gossipoption 122138 >>与|cRXP_FRIENDLY_阿莱希娅·唤风者|r交谈，对方会开始跟随你
    .target 阿莱希娅·唤风者
    .isOnQuest 81783
    .isQuestNotComplete 81783
step
    #season 2
    #requires Treants
    .goto Ashenvale,81.0,50.6
    .group 3
    >>击杀 |cRXP_ENEMY_查利乌斯|r |cRXP_WARN_——血量极高|r
    .complete 81781,1 --Defeat Zalius (1)
    .isOnQuest 81781
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    #loop
    .goto Ashenvale,86.31,43.07,0
    .goto Ashenvale,86.57,47.66,50,0
    .goto Ashenvale,87.03,45.92,50,0
    .goto Ashenvale,88.26,42.14,50,0
    .goto Ashenvale,86.31,43.07,50,0
    .goto Ashenvale,84.36,45.06,50,0
    .goto Ashenvale,83.90,47.38,50,0
    >>完成剩余击杀： |cRXP_ENEMY_龙族夜行者|r 和 |cRXP_ENEMY_惊惧雏龙|r
    >>|cRXP_WARN_小心：|r|cRXP_ENEMY_龙族夜行者|r|cRXP_WARN_是41级精英|r
    .complete 81770,1 --Wyrmkin Nightstalker slain: 3/3
    .mob +龙族夜行者
    .complete 81770,2 --Terror Whelp slain: 10/10
    .mob +惊惧雏龙
step
    #optional
    .isOnQuest 81783
    #season 2
    #requires Treants
    #label IncursionsComplete
    .goto Ashenvale,93.97,38.02
    >>前往 |cRXP_PICK_翡翠梦境传送门|r
    >>|cRXP_WARN_未能找到或带回的护送对象可跳过，其余已完成任务仍可交付|r
    >>|cRXP_WARN_如果|cRXP_FRIENDLY_马塞拉|r、|cRXP_FRIENDLY_阿莱希娅|r或|cRXP_FRIENDLY_多兰|r不再跟随你，返回与他们交谈|r
    >>|cRXP_WARN_在箭头指向的传送门坡道底部来回走动几次，让护送 NPC 穿过判定位置，取得任务进度|r
    .complete 81783,1 --Rescue Alyssian Windcaller: 1/1
    .target +阿莱希娅·唤风者
    .goto Ashenvale,92.11,54.21,0
step
    #optional
    .isOnQuest 81784
    .goto Ashenvale,93.97,38.02
    >>将这名护送对象带到梦境传送门坡道底部；如果未能带回，可跳过此任务
    .complete 81784,1 --Rescue Doran Dreambough: 1/1
    .goto Ashenvale,87.24,43.58,0
    .target +多兰·梦枝
step
    #optional
    .isOnQuest 81785
    .goto Ashenvale,93.97,38.02
    >>将这名护送对象带到梦境传送门坡道底部；如果未能带回，可跳过此任务
    .complete 81785,1 --Rescue Maseara Autumnmoon: 1/1
    .goto Ashenvale,81.16,50.28,0
    .target +马塞拉·秋月
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    #completewith next
    .goto Ashenvale,93.94,38.21,25,0
    .goto Ashenvale,94.27,35.13,20 >>点击|cRXP_PICK_小型梦境传送门|r，返回现实世界
    .aura -444759
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    .goto Ashenvale,89.57,40.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长汉娜拉|r交谈
    .turnin 81771 >>交任务：灰谷使命IV：巨龙情报
    .turnin 81772 >>交任务：灰谷使命V：萨特情报
    .turnin 81773 >>交任务：灰谷使命VI：树人情报
    .turnin 81774 >>交任务：灰谷使命VII：取回造梦引擎
    .turnin 81775 >>交任务：灰谷使命VIII：取回艾萨拉预言
    .turnin 81776 >>交任务：灰谷使命IX：取回梦触龙蛋
    .turnin -81783,1 >>交任务：灰谷使命XVI：营救阿莱希娅·唤风者
    .turnin -81784,1 >>交任务：灰谷使命XVII：营救多兰·梦枝
    .turnin -81785,1 >>交任务：灰谷使命XVIII：营救马塞拉·秋月
    .turnin 81768 >>交任务：灰谷使命I：击败萨特
    .turnin -81769,1 >>交任务：灰谷使命II：击败树人
    .turnin 81770 >>交任务：灰谷使命III：击败龙类
    .target 战地队长汉娜拉
step
    .isOnQuest 81777,81778,81779,81772,81785,81784,81783,81776,81775,81774,81773,81771,81768,81769,81770,81780,81781,81782
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长汉娜拉|r交谈
    .turnin -81780,1 >> 交任务：灰谷使命XIII：击败拉尔瑟拉
    .turnin -81781,1 >> 交任务：灰谷使命XIV：击败查利乌斯
    .turnin -81782,1 >> 交任务：灰谷使命XV：击败伐木机9000型
    .target 战地队长汉娜拉
step
    #optional
    +|cRXP_WARN_你已超过所有梦魇进犯区域的任务等级上限，无法再接取其中的常规任务|r
    >>如果想提升声望：|cRXP_FRIENDLY_翡翠守望者|r在菲拉斯提供可无限重复的任务，每次交付10个|T134186:0|t[|cRXP_LOOT_月之根|r]、|T133594:0|t[|cRXP_LOOT_强效月亮石|r]或|T134312:0|t[|cRXP_LOOT_月龙之鳞|r]中的任一种材料
    >>这些任务没有经验或金币奖励，每次交付获得100点声望。按需要从拍卖行购买单价最划算的材料，前往菲拉斯反复交付
    .xp <53,1
step
    #optional
    +你已完成这轮梦魇进犯任务，每日重置后可再次接取。|cRXP_WARN_从列表中选择其他指南继续|r
]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 梦魇进犯日常
#classic
#season 2
#group RestedXP Nightmare Incursion Dailies
#name (50-53) The Hinterlands Nightmare Incursion
#title 辛特兰梦魇进犯
#displayname （50-53）辛特兰梦魇进犯
step
    #ah
    >>前往辛特兰前，从拍卖行购买10朵|T134207:0|t[|cRXP_LOOT_星辉莲|r]、10个|T134964:0|t[|cRXP_LOOT_星之壳|r]和10块|T237436:0|t[|cRXP_LOOT_星银矿石|r]
    >>|cRXP_WARN_如果附近没有拍卖行，或材料价格不划算，可跳过此步骤。这三个日常合计奖励300点基础声望，经验收益受等级和经验加成影响|r
    .collect 219454,10 --Star Lotus
    .collect 219487,10 --Starshell
    .collect 219486,10 --Starsilver Ore
    .maxlevel 52
step
    #completewith next
    #label travel
    .zone The Hinterlands >> 前往辛特兰
    .maxlevel 52
step
    .goto The Hinterlands,60.81,37.86,20 >> 前往通向瑟拉丹的桥
    .maxlevel 52
step
    >>|cRXP_WARN_这些符文已无声望购买门槛；也可从各族起始区域的符文商人处购买|r
    .goto The Hinterlands,61.4,34.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官阿兰德拉|r交谈
    .target 军需官阿兰德拉
    .collect 221480,1 << Mage --Spell Notes: Molten Armor
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alacrity
    .collect 221515,1 << Hunter --Rune of Detonation
    .collect 221517,1 << Druid --Rune of Bloodshed
    .collect 223288,1 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 52
step
    .train 427080 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_守护符文|r] |cRXP_WARN_学习|r |T132359:0|t[盾牌精通] << Warrior
    .use 221511 << Warrior
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_虚无顿悟|r] |cRXP_WARN_学习|r |T132886:0|t[虚空领域] << Priest
    .train 429308 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：熔岩护甲|r] |cRXP_WARN_学习|r |T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r] |cRXP_WARN_学习|r |T136228:0|t[痛苦无常] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r] |cRXP_WARN_学习|r |T135822:0|t[燃烧] << Shaman
    .train 432297 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_敏锐符文|r] |cRXP_WARN_学习|r |T236269:0|t[穷追猛砍] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_爆破符文|r] |cRXP_WARN_学习|r |T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_溅血符文|r] |cRXP_WARN_学习|r |T304501:0|t[淤血] << Druid
    .train 429261 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_锤头符文|r] |cRXP_WARN_学习|r |T236262:0|t[强化愤怒之锤] << Paladin
    .use 221480 << Mage -- Spell Notes: Molten Armor
    .use 221481 << Priest --Nihilist Epiphany
    .use 221482 << Warlock --Rune of Affliciton
    .use 221483 << Shaman --Rune of Burn
    .use 221512 << Rogue --Rune of Alacrity
    .use 221515 << Hunter --Rune of Detonation
    .use 221517 << Druid --Rune of Bloodshed
    .use 223288 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 52
step
    #optional
    >>过桥，|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长考利安|r交谈
    .goto The Hinterlands,61.4,34.6
    .accept 81833 >> 接任务：辛特兰使命X：星辉莲
    .accept 81834 >> 接任务：辛特兰使命XI：星银矿石
    .accept 81835 >> 接任务：辛特兰使命XII：星之壳
    .itemcount 219454,10 --Star Lotus
    .itemcount 219487,10 --Starshell
    .itemcount 219486,10 --Starsilver Ore
    .target 战地队长考利安
    .maxlevel 52
step
    #optional
    >>过桥，|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长考利安|r交谈
    .goto The Hinterlands,61.4,34.6
    .accept 81833 >> 接任务：辛特兰使命X：星辉莲
    .itemcount 219454,10 --Star Lotus
    .target 战地队长考利安
    .maxlevel 52
step
    #optional
    >>过桥，|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长考利安|r交谈
    .goto The Hinterlands,61.4,34.6
    .accept 81834 >> 接任务：辛特兰使命XI：星银矿石
    .itemcount 219486,10 --Starsilver Ore
    .target 战地队长考利安
    .maxlevel 52
step
    #optional
    >>过桥，|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长考利安|r交谈
    .goto The Hinterlands,61.4,34.6
    .accept 81835 >> 接任务：辛特兰使命XII：星之壳
    .itemcount 219487,10 --Starshell
    .target 战地队长考利安
    .maxlevel 52
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    #optional
    >>过桥，|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长考利安|r交谈
    .goto The Hinterlands,61.4,34.6
    .turnin -81833,1 >> 交任务：辛特兰使命X：星辉莲
    .turnin -81834,1 >> 交任务：辛特兰使命XI：星银矿石
    .turnin -81835,1 >> 交任务：辛特兰使命XII：星之壳
    .target 战地队长考利安
step
    >>首次参与时，若队长提供“取回进犯战地报告”，可先在现实世界击杀门外恶魔，并向斥候取得报告后交付
    >>过桥，|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长考利安|r交谈
    .goto The Hinterlands,61.4,34.6
    .accept 82068 >> 接任务：抗击梦魇进犯
    .accept 81786 >> 接任务：辛特兰使命I：击败枭兽
    .accept 81787 >> 接任务：辛特兰使命II：击败巨龟
    .accept 81788 >> 接任务：辛特兰使命III：击败龙人
    .accept 81789 >> 接任务：辛特兰使命IV：巨龙情报
    .accept 81817 >> 接任务：辛特兰使命V：巨龟情报
    .accept 81820 >> 接任务：辛特兰使命VI：枭兽情报
    .accept 81826 >> 接任务：辛特兰使命VII：取回星触龙蛋
    .accept 81830 >> 接任务：辛特兰使命VIII：取回艾露纳圣物
    .accept 81832 >> 接任务：辛特兰使命IX：取回梦境珍珠
    .accept 81850 >> 接任务：辛特兰使命XVI：营救伊利阿纳尔·啜影者
    .accept 81851 >> 接任务：辛特兰使命XVII：营救瑟丽娜·星辉
    .accept 81852 >> 接任务：辛特兰使命XVIII：营救维阿娜·云梦
    .target 战地队长考利安
    .maxlevel 52
step
    #optional
    .group 3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长考利安|r 交谈
    >>|cRXP_WARN_如果你已组队，也可以考虑接取击杀精英的任务。这些首领血量极高，是否容易击杀取决于队伍实力|r
    .accept 81837 >> 接任务：辛特兰使命XIII：击败弗洛里斯
    .accept 81838 >> 接任务：辛特兰使命XIV：击败末日枭兽
    .accept 81839 >> 接任务：辛特兰使命XV：击败加摩拉伽
    .goto The Hinterlands,61.4,34.6
    .target 战地队长考利安
    .maxlevel 52
step
    #optional
    .goto The Hinterlands,61.4,34.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官阿兰德拉|r交谈
    .vendor >> |cRXP_BUY_如有需要，可向她购买最多5瓶|r|T236885:0|t[特效治疗药水]|cRXP_BUY_。|r|cRXP_WARN_这些药水只能在梦魇进犯区域使用|r
    .target 军需官阿兰德拉
    .maxlevel 52
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    #completewith next
    +|cRXP_WARN_点击任务发布者旁边的小型梦境传送门|r 进入翡翠梦境
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    .goto 1425/0,-3788.100,468.800,20 >> 前往隐匿石。|cRXP_WARN_避开|cRXP_ENEMY_不稳定的小精灵|r，它们会爆炸，对你造成约700点伤害|r
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    #sticky
    #label Moonkin
    .goto The Hinterlands,57.9,39.6,0
    >>在隐匿石洞穴内击杀|cRXP_ENEMY_堕落的枭兽|r
    .complete 81786,1 --Fallen Moonkin slain (20)
    .mob 堕落的枭兽
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    >>进入洞穴, 清理右侧坡道, 拾取宝箱中的 |T133247:0|t[|cRXP_PICK_艾露纳圣物|r]
    .goto 1425/0,-3799.300,354.700
    .complete 81830,1 --|Elunar Relic: 1/1
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    .solo
    >>清理至洞穴底部的大房间，与|cRXP_FRIENDLY_梦境卫士瓦罗丽|r交谈，取得|T134939:0|t[|cRXP_LOOT_情侦报告：隐匿石|r]
    >>|cRXP_WARN_该 NPC 潜行在|r |cRXP_ENEMY_末日枭兽|r |cRXP_WARN_首领旁。迅速拿到情报后撤离，不要与首领交战|r
    >>|cRXP_WARN_由于|r|cRXP_ENEMY_末日枭兽|r|cRXP_WARN_伤害很高，做此任务可能会死亡，不过跑回来只需很短的路程|r
    .goto 1425/0,-3756.200,357.000
    .complete 81820,1 --|Intelligence Report: Skulk Rock: 1/1
    .target 梦境卫士瓦罗丽
    .skipgossip
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    #sticky
    #label groupSkulk
    .group 3
    >>清理至洞穴底部的大房间，与|cRXP_FRIENDLY_梦境卫士瓦罗丽|r交谈，取得|T134939:0|t[|cRXP_LOOT_情侦报告：隐匿石|r]
    >>|cRXP_WARN_他潜行在|r|cRXP_ENEMY_末日枭兽|r|cRXP_WARN_首领身旁。|r
    .goto 1425/0,-3756.200,357.000
    .complete 81820,1 --|Intelligence Report: Skulk Rock: 1/1
    .target 梦境卫士瓦罗丽
    .skipgossip
step
    .group 3
    .goto The Hinterlands,56.6,44.6
    >>击杀洞穴底部大房间里的|cRXP_ENEMY_末日枭兽|r首领
    >>|cRXP_WARN_注意他会施放|r |T136096:0|t[月火术] |cRXP_WARN_和|r |T136006:0|t[愤怒] |cRXP_WARN_造成高额伤害, 并有范围|r |T136183:0|t[恐惧]
    .complete 81838,1 --Defeat Doomkin
    .mob 末日枭兽
    .isOnQuest 81838
step
    #optional
    .isOnQuest 81850
    .isQuestNotComplete 81850
    #requires Moonkin
    .goto The Hinterlands,53.58,39.10
    .gossipoption 122141 >> 与躺在地上的|cRXP_FRIENDLY_伊利阿纳尔·啜影者|r交谈，他会开始跟随你
    >>|cRXP_WARN_可以隔着木栅栏的背面与他交谈，无需进入内部|r
    >>|cRXP_WARN_如果他不在，说明其他玩家正在护送他；找不到时可跳过此步骤|r
    .target 伊利阿纳尔·啜影者
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    #sticky
    #label Dragonkin
    .goto The Hinterlands,46.7,39.9,0
    >>击杀废墟中的 |cRXP_ENEMY_愤怒的雏龙|r 和 |cRXP_ENEMY_龙族狩星者|r
    >>|cRXP_WARN_小心|r |cRXP_ENEMY_龙族狩星者|r |cRXP_WARN_是精英，会施放|r |T135812:0|t[火球术] |cRXP_WARN_，造成500点以上伤害；若无法单独击杀，可跳过此任务|r
    .complete 81788,1 --Wrath Whelp Slain (10)
    .complete 81788,2 --Wyrmkin Starhunter SLain (3)
    .mob 愤怒的雏龙
    .mob 龙族狩星者
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    #completewith next
    +|cRXP_WARN_注意：如果你死亡，所有跟随你的护送 NPC 都会返回原位置，需要重新找到他们|r
    >>|cRXP_WARN_护送 NPC 会在开始跟随你15分钟后停止跟随，请尽快带他们返回|r
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    .goto The Hinterlands,46.85,41.17
    >>与潜行在标记位置的|cRXP_FRIENDLY_梦境卫士拉妮纳尔|r交谈，取得|T134939:0|t[|cRXP_LOOT_情侦报告：亚戈瓦萨|r]
    .complete 81789,1 --|Intelligence Report: Agol'watha: 1/1
    .target 梦境卫士拉妮纳尔
    .skipgossip
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    >>从帐篷内拾取 |T236997:0|t[|cRXP_PICK_星触龙蛋|r]
    >>|cRXP_WARN_沿城墙外围绕行, 避免拉到精英龙人. 可从帐篷后方拾取龙蛋, 无需与精英交战|r
    .goto 1425/0,-3320.800,474.500
    .complete 81826,1 --|Star-Touched Dragonegg: 1/1
step
    .group 3
    .goto The Hinterlands,46.0,39.8
    >>击杀在废墟上空飞行的绿龙 |cRXP_ENEMY_弗洛里斯|r
    >>|cRXP_WARN_注意，它的血量极高，免疫自然法术，还会施放|r|T132338:0|t[顺劈斩]|cRXP_WARN_、|r |T134307:0|t[扫尾] |cRXP_WARN_并|r |T135745:0|t[召唤] |cRXP_WARN_一只|r |cRXP_ENEMY_幼龙|r |cRXP_WARN_，会向正面喷吐，造成极高伤害|r
    .complete 81837,1 --Defeat Florius
    .mob 弗洛里斯
    .isOnQuest 81837
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    #requires Dragonkin
    .goto The Hinterlands,42.31,31.43
    .goto The Hinterlands,60.67,38.32,150 >> 向西进入山地，直到屏幕开始泛绿。你会被传送到靠近起点的位置
    >>|cRXP_WARN_不用担心，所有护送 NPC 最终都会跟上你|r
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    #sticky
    #label Turtles
    .goto The Hinterlands,62.9,41.0,0
    .goto The Hinterlands,62.9,45.0,0
    .goto The Hinterlands,67.1,41.5,0
    .goto The Hinterlands,66.0,47.5,0
    .goto The Hinterlands,71.5,45.3,0
    .goto The Hinterlands,69.8,51.2,0
    .goto The Hinterlands,65.1,39.1,0
    .goto The Hinterlands,58.6,36.0,0
    >>在完成其他目标时击杀 |cRXP_ENEMY_梦水钳颚龟|r
    .complete 81787,1 --Dreamwater Vicejaw slain (20)
    .mob 梦水钳颚龟
step
    #optional
    .isOnQuest 81852
    .isQuestNotComplete 81852
    .goto The Hinterlands,57.30,42.95
    .gossipoption 122151 >>爬上山顶. 与躺在地上的|cRXP_FRIENDLY_维阿娜·云梦|r交谈. 她会开始跟随你
    >>|cRXP_WARN_如果找不到她，说明其他玩家可能正在护送她，可跳过此步骤|r
    .target 维阿娜·云梦
step
    #optional
    .isOnQuest 81851
    .isQuestNotComplete 81851
    .goto The Hinterlands,71.09,48.14
    .gossipoption 122149 >> 进入小木堡，与躺在地上的|cRXP_FRIENDLY_瑟丽娜·星辉|r交谈，她会开始跟随你
    >>|cRXP_WARN_如果找不到她，说明其他玩家可能正在护送她，可跳过此步骤|r
    .target 瑟丽娜·星辉
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    >>进入沙尔瓦萨废墟, 拾取 |T237371:0|t[|cRXP_PICK_梦境珍珠|r]. |cRXP_WARN_注意不要引到首领|r |cRXP_ENEMY_加摩拉伽|r
    .goto 1425/0,-4355.400,79.400
    .complete 81832,1 --|Dreampearl: 1/1
step
    .group 3
    .goto The Hinterlands,72.7,54.2
    >>击杀 |cRXP_ENEMY_加摩拉伽|r
    >>|cRXP_WARN_小心，她会施放|r|T136231:0|t[刺穿护甲]|cRXP_WARN_和|r|T132270:0|t[三重噬咬]|cRXP_WARN_，后者会迅速连续攻击你3次。|r|T132270:0|t[三重噬咬]|cRXP_WARN_也能攻击远处的目标|r
    .complete 81839,1 --Defeat Ghamoo-Raja
    .isOnQuest 81839
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    >>与潜行在标记位置的|cRXP_FRIENDLY_梦境卫士萨娜瑟尔|r交谈，取得|T134939:0|t[|cRXP_LOOT_情侦报告：沙尔瓦萨|r]
    .goto 1425/0,-4389.800,81.400
    .complete 81817,1 --|Intelligence Report: Shaol'watha: 1/1
    .target 梦境卫士萨娜瑟尔
    .skipgossip
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    .goto The Hinterlands,77.13,54.35
    .goto The Hinterlands,60.67,38.32,150 >> 向东走，直到屏幕开始泛绿。你会被传送到靠近起点的位置
    >>|cRXP_WARN_不用担心，所有护送 NPC 最终都会跟上你|r
step
    #optional
    .isOnQuest 81850
    #requires Turtles
    .goto 1425/0,-4010.800,758.000
    >>确认已获得所有护送任务的进度；抵达大型梦境传送门时，应全部完成
    >>|cRXP_WARN_未能找到或带回的护送对象可跳过，其余已完成任务仍可交付|r
    >>|cRXP_WARN_若三名护送 NPC 中有人不再跟随你，返回与其交谈|r
    >>|cRXP_WARN_在箭头指向的传送门坡道底部来回走动几次，让护送 NPC 穿过判定位置，取得任务进度|r
    .complete 81850,1
step
    #optional
    .isOnQuest 81851
    .goto 1425/0,-4010.800,758.000
    >>将这名护送对象带到梦境传送门坡道底部；如果未能带回，可跳过此任务
    .complete 81851,1
step
    #optional
    .isOnQuest 81852
    .goto 1425/0,-4010.800,758.000
    >>将这名护送对象带到梦境传送门坡道底部；如果未能带回，可跳过此任务
    .complete 81852,1
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    .goto The Hinterlands,61.35,34.58,5 >> 点击小型梦境传送门返回真实世界的辛特兰
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    >>与|cRXP_FRIENDLY_战地队长考利安|r交谈
    .goto The Hinterlands,61.4,34.6
    .turnin 81786 >> 交任务：辛特兰使命I：击败枭兽
    .turnin 81787 >> 交任务：辛特兰使命II：击败巨龟
    .turnin -81788,1 >> 交任务：辛特兰使命III：击败龙人
    .turnin 81789 >> 交任务：辛特兰使命IV：巨龙情报
    .turnin 81817 >> 交任务：辛特兰使命V：巨龟情报
    .turnin 81820 >> 交任务：辛特兰使命VI：枭兽情报
    .turnin 81826 >> 交任务：辛特兰使命VII：取回星触龙蛋
    .turnin 81830 >> 交任务：辛特兰使命VIII：取回艾露纳圣物
    .turnin 81832 >> 交任务：辛特兰使命IX：取回梦境珍珠
    .turnin -81850,1 >> 交任务：辛特兰使命XVI：营救伊利阿纳尔·啜影者
    .turnin -81851,1 >> 交任务：辛特兰使命XVII：营救瑟丽娜·星辉
    .turnin -81852,1 >> 交任务：辛特兰使命XVIII：营救维阿娜·云梦
    .turnin 82068 >> 交任务：抗击梦魇进犯
    .target 战地队长考利安
step
    .isOnQuest 81833,81834,81835,82068,81786,81787,81788,81789,81817,81820,81826,81830,81832,81850,81851,81852,81837,81838,81839
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_战地队长考利安|r 交谈
    .turnin -81837,1 >> 交任务：辛特兰使命XIII：击败弗洛里斯
    .turnin -81838,1 >> 交任务：辛特兰使命XIV：击败末日枭兽
    .turnin -81839,1 >> 交任务：辛特兰使命XV：击败加摩拉伽
    .goto The Hinterlands,61.4,34.6
    .target 战地队长考利安
step
    #optional
    +|cRXP_WARN_你已超过所有梦魇进犯区域的任务等级上限，无法再接取其中的常规任务|r
    >>如果你想提升|r|cRXP_FRIENDLY_翡翠守望者|r声望，菲拉斯有可无限重复的任务，每次可以交付10个|T134186:0|t[|cRXP_LOOT_月之根|r]、|T133594:0|t[|cRXP_LOOT_强效月亮石|r]或|T134312:0|t[|cRXP_LOOT_月龙之鳞|r]
    >>这些任务没有经验或金币奖励，每次交付获得100点声望。按需要从拍卖行购买单价最划算的材料，前往菲拉斯反复交付
    .xp <53,1
step
    #optional
    +你已完成这轮梦魇进犯任务，每日重置后可再次接取。|cRXP_WARN_从列表中选择其他指南继续|r
    ]])
RXPGuides.RegisterGuide([[
#groupdisplayname RestedXP 梦魇进犯日常
#classic
#season 2
#group RestedXP Nightmare Incursion Dailies
#name (50-53) Feralas Nightmare Incursion
#title 菲拉斯梦魇进犯
#displayname （50-53）菲拉斯梦魇进犯
step
    #ah
    >>前往菲拉斯之前，从拍卖行购买|T134186:0|t[|cRXP_LOOT_月之根|r]、|T133594:0|t[|cRXP_LOOT_强效月亮石|r]和|T134312:0|t[|cRXP_LOOT_月龙之鳞|r]，每种各10份
    >>|cRXP_WARN_如果附近没有拍卖行，或材料价格不划算，可跳过此步骤。这三个日常合计奖励300点基础声望，经验收益受等级和经验加成影响|r
    .maxlevel 52
    .collect 219514,10 --Moonroot
    .collect 219517,10 --Moondragon Scale
    .collect 219515,10 --Greater Moonstone
step
    #completewith next
    .zone Feralas >> 前往菲拉斯
    .maxlevel 52
step
    .goto Feralas,48.0,13.2,50 >> 前往菲拉斯西北部的翡翠梦魇传送门区域
    .maxlevel 52
step
    >>|cRXP_WARN_这些符文已无声望购买门槛；也可从各族起始区域的符文商人处购买|r
    .goto Feralas,48.6,12.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官瓦尔达内|r交谈
    .collect 221480,1 << Mage --Spell Notes: Molten Armor
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alacrity
    .collect 221515,1 << Hunter --Rune of Detonation
    .collect 221517,1 << Druid --Rune of Bloodshed
    .collect 223288,1 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .target 军需官瓦尔达内
    .maxlevel 52
step
    .train 427080 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_守护符文|r] |cRXP_WARN_学习|r |T132359:0|t[盾牌精通] << Warrior
    .use 221511 << Warrior
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_虚无顿悟|r]|cRXP_WARN_学习|r |T132886:0|t[虚空领域] << Priest
    .train 429308 >>|cRXP_WARN_使用|r |T134939:0|t[|cRXP_FRIENDLY_法术笔记：熔岩护甲|r]|cRXP_WARN_学习|r |T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r]|cRXP_WARN_学习|r |T136228:0|t[痛苦无常] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r]|cRXP_WARN_学习|r |T135822:0|t[燃烧] << Shaman
    .train 432297 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_敏锐符文|r]|cRXP_WARN_学习|r |T236269:0|t[穷追猛砍] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_爆破符文|r]|cRXP_WARN_学习|r |T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_溅血符文|r]|cRXP_WARN_学习|r |T304501:0|t[淤血] << Druid
    .train 429261 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_锤头符文|r]|cRXP_WARN_学习|r |T236262:0|t[强化愤怒之锤] << Paladin
    .use 221480 << Mage -- Spell Notes: Molten Armor
    .use 221481 << Priest --Nihilist Epiphany
    .use 221482 << Warlock --Rune of Affliciton
    .use 221483 << Shaman --Rune of Burn
    .use 221512 << Rogue --Rune of Alacrity
    .use 221515 << Hunter --Rune of Detonation
    .use 221517 << Druid --Rune of Bloodshed
    .use 223288 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 52
step
    #season 2
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长阿伦奈尔|r交谈
    .accept 81865 >> 接任务：菲拉斯使命X：月之根
    .accept 81866 >> 接任务：菲拉斯使命XI：强效月亮石
    .accept 81867 >> 接任务：菲拉斯使命XII：强效月龙之鳞
    .itemcount 219514,10 --Moonroot
    .itemcount 219517,10 --Moondragon Scale
    .itemcount 219515,10 --Greater Moonstone
    .target 战地队长阿伦奈尔
    .maxlevel 52
step
    #season 2
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长阿伦奈尔|r交谈
    .accept 81865 >> 接任务：菲拉斯使命X：月之根
    .itemcount 219514,10 --Moonroot
    .target 战地队长阿伦奈尔
    .maxlevel 52
step
    #season 2
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长阿伦奈尔|r交谈
    .accept 81866 >> 接任务：菲拉斯使命XI：强效月亮石
    .itemcount 219515,10 --Greater Moonstone
    .target 战地队长阿伦奈尔
    .maxlevel 52
step
    #season 2
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长阿伦奈尔|r交谈
    .accept 81867 >> 接任务：菲拉斯使命XII：强效月龙之鳞
    .itemcount 219517,10 --Moondragon Scale
    .target 战地队长阿伦奈尔
    .maxlevel 52
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长阿伦奈尔|r交谈
    .turnin -81865,1 >> 交任务：菲拉斯使命X：月之根
    .turnin -81866,1 >> 交任务：菲拉斯使命XI：强效月亮石
    .turnin -81867,1 >> 交任务：菲拉斯使命XII：强效月龙之鳞
    .target 战地队长阿伦奈尔
step
    >>首次参与时，若队长提供“取回进犯战地报告”，可先在现实世界击杀门外恶魔，并向斥候取得报告后交付
    #season 2
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长阿伦奈尔|r交谈
    .accept 81855 >>接任务：菲拉斯使命I：击败塞纳留斯之子
    .accept 81856 >>接任务：菲拉斯使命II：击败鹰身人
    .accept 81857 >>接任务：菲拉斯使命III：击败龙类
    .accept 81858 >>接任务：菲拉斯使命IV：巨龙情报
    .accept 81859 >>接任务：菲拉斯使命V：塞纳里奥情报
    .accept 81860 >>接任务：菲拉斯使命VI：鹰身人情报
    .accept 81861 >>接任务：菲拉斯使命VII：取回月光龙蛋
    .accept 81863 >>接任务：菲拉斯使命VIII：取回守护者的笔记
    .accept 81864 >>接任务：菲拉斯使命IX：取回鹰身人长文
    .accept 81872 >>接任务：菲拉斯使命XVI：营救梅里阿斯·护地者
    .accept 81873 >>接任务：菲拉斯使命XVII：营救奈勒内·溪吟
    .accept 81874 >>接任务：菲拉斯使命XVIII：营救贾姆尼斯·愈树者
    .accept 82068 >>接任务：抗击梦魇进犯
    .target 战地队长阿伦奈尔
    .maxlevel 52
step
    #optional
    .group 3
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长阿伦奈尔|r交谈
    >>|cRXP_WARN_如果已经组队，也可以考虑接取精英击杀任务。这些任务的首领生命值极高，能否应对取决于队伍实力|r
    .accept 81868 >> 接任务：菲拉斯使命XIII：击败泰兰尼库斯
    .accept 81870 >> 接任务：菲拉斯使命XIV：击败阿隆迪乌斯
    .accept 81871 >> 接任务：菲拉斯使命XV：击败斯蕾娜
    .target 战地队长阿伦奈尔
    .maxlevel 52
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #completewith IncursionsComplete3
    .goto Feralas,50.95,11.67,30,0
    .goto Feralas,51.28,10.64,20 >>点击大型翡翠梦境传送门前的|cRXP_PICK_小型梦境传送门|r，进入梦魇进犯区域
    >>|cRXP_WARN_避开沿途恶魔，使用小型梦境传送门切换区域；大型传送门通往梦魇巨龙团队副本|r
    .aura 444762
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #completewith DreamWardenGorlas
    >>击杀|cRXP_ENEMY_癫狂的雏龙|r和|cRXP_ENEMY_龙族狂暴者|r
    >>|cRXP_WARN_小心。|r|cRXP_ENEMY_龙族狂暴者|r|cRXP_WARN_是精英，单刷可能比较困难|r
    .complete 81857,1 --Frenzied Whelp slain 10/10
    .mob +癫狂的雏龙
    .complete 81857,2 --Wyrmkin Berserker slain 10/10
    .mob +龙族狂暴者
step
    #optional
    #season 2
    .goto Feralas,49.64,15.44
    .gossipoption 122147 >>与|cRXP_FRIENDLY_梅里阿斯·护地者|r交谈，对方随后应该会开始跟随你
    .target 梅里阿斯·护地者
    .isOnQuest 81872
    .isQuestNotComplete 81872
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #completewith next
    +|cRXP_WARN_注意：如果你死亡，所有跟随你的护送对象都会返回最初的位置，需要重新找到它们|r
    >>|cRXP_WARN_护送对象也会在开始跟随15分钟后停止跟随，请尽快完成！|r
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    .goto Feralas,50.71,17.17
    >>拾取地上的|cRXP_LOOT_月光龙蛋|r
    .complete 81861,1 --Moonglow Dragonegg: 1/1
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #optional
    .group 3
    .goto Feralas,53.2,16.6
    >>击杀巨龙首领|cRXP_ENEMY_泰兰尼库斯|r
    >>|cRXP_WARN_小心：他的生命值极高，免疫自然法术，会施放|r|T132338:0|t[顺劈斩]|cRXP_WARN_、|r |T134307:0|t[扫尾]|cRXP_WARN_，并|r |T135745:0|t[召唤]|cRXP_WARN_一只|r |cRXP_ENEMY_幼龙|r|cRXP_WARN_。幼龙会朝前方喷吐，造成极高伤害|r
    .complete 81868,1 --Tyrannikus slain
    .mob 泰兰尼库斯
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    .goto Feralas,50.73,19.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦境卫士谢尔德林|r交谈
    .complete 81858,1 --Intelligence Report: Oneiros: 1/1
    .target 梦境卫士谢尔德林
    .skipgossip
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    .solo
    #completewith RuinsofRav
    #season 2
    +|cRXP_WARN_小心|r |cRXP_WARN_阿隆迪乌斯|r|cRXP_WARN_，这名精英首领会沿道路巡逻，尽量避开他|r
    .unitscan 阿隆迪乌斯
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    .group 3
    #completewith RuinsofRav
    #season 2
    #label Alondrius
    .goto Feralas,46.8,19.6
    .line Feralas,47.6,25.5,48.1,24.2,48.0,23.0,46.9,22.2,46.2,20.9,46.3,18.1,46.3,16.2,46.1,14.1
    >>|cRXP_WARN_寻找|r |cRXP_WARN_阿隆迪乌斯|r|cRXP_WARN_，这名精英首领会沿道路巡逻，找到后将其击杀|r
    .complete 81870,1 --Alondrius Slain
    .unitscan 阿隆迪乌斯
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #label DreamWardenGorlas
    .goto Feralas,47.14,21.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦境卫士高拉斯|r交谈
    .complete 81859,1 --Intelligence Report: Twin Colossals: 1/1
    .target 梦境卫士高拉斯
    .skipgossip
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #completewith RuinsofRav
    >>击杀|cRXP_ENEMY_迷失之女|r和|cRXP_ENEMY_复仇之子|r
    .complete 81855,1 --Lost Daughter slain 10/10
    .mob +迷失之女
    .complete 81855,2 --Vengeful Son slain 10/10
    .mob +复仇之子
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    .goto Feralas,46.63,18.94
    >>拾取地上的|cRXP_LOOT_疯狂守护者的笔记|r
    .complete 81863,1 --Mad Keeper's Notes: 1/1
step
    #optional
    #season 2
    .goto Feralas,45.81,16.47
    .gossipoption 122148 >>与|cRXP_FRIENDLY_奈勒内·溪吟|r交谈，对方随后应该会开始跟随你
    .target 奈勒内·溪吟
    .skipgossip
    .isOnQuest 81873
    .isQuestNotComplete 81873
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #label RuinsofRav
    .goto Feralas,41.94,12.93
    .subzone 1114 >>前往鸦风废墟
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #completewith IncursionsComplete3
    >>击杀|cRXP_ENEMY_梦泉游荡者|r和|cRXP_ENEMY_梦泉唤雷者|r
    .complete 81856,1 --Dreamspring Roguefeather 10/10
    .mob +梦泉游荡者
    .complete 81856,2 --Dreamspring Stormcaller 10/10
    .mob +梦泉唤雷者
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    .goto Feralas,38.94,13.13
    >>拾取地上的|cRXP_LOOT_鹰身人长文|r
    >>|cRXP_WARN_此物品可瞬间拾取。|r|cRXP_ENEMY_斯蕾娜|r|cRXP_WARN_可能会攻击你，请提前清出撤退路线|r
    .complete 81864,1 --Harpy Screed: 1/1
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #optional
    .group 3
    .goto Feralas,39.6,13.8
    >>击杀鹰身人首领|cRXP_ENEMY_斯蕾娜|r
    >>|cRXP_WARN_小心：她会施放|r |T136015:0|t[闪电链]、|T136018:0|t[包围之风]|cRXP_WARN_（持续10秒的旋风），以及|r |T132104:0|t[酸雨]|cRXP_WARN_（地面圆形伤害区域，应及时离开）|r
    .complete 81871,1 --Slirena slain
    .mob 斯蕾娜
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    .goto Feralas,37.71,12.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦境卫士阿纳德拉|r交谈
    .complete 81860,1 --Intelligence Report: Ruins of Ravenwind: 1/1
    .target 梦境卫士阿纳德拉
    .skipgossip
step
    #optional
    #season 2
    #label IncursionsComplete3
    .goto Feralas,40.58,8.09
    .gossipoption 122145 >>与|cRXP_FRIENDLY_贾姆尼斯·愈树者|r交谈，对方随后应该会开始跟随你
    .target 贾姆尼斯·愈树者
    .isOnQuest 81874
    .isQuestNotComplete 81874
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #loop
    .goto Feralas,42.11,9.07,0
    .goto Feralas,38.98,16.20,0
    .goto Feralas,42.11,9.07,60,0
    .goto Feralas,42.19,11.58,60,0
    .goto Feralas,41.02,13.08,60,0
    .goto Feralas,40.19,15.21,60,0
    .goto Feralas,38.98,16.20,60,0
    .goto Feralas,38.31,15.77,60,0
    .goto Feralas,37.95,14.21,60,0
    .goto Feralas,39.42,13.77,60,0
    .goto Feralas,39.58,10.69,60,0
    >>击杀|cRXP_ENEMY_梦泉游荡者|r和|cRXP_ENEMY_梦泉唤雷者|r
    .complete 81856,1 --Dreamspring Roguefeather 10/10
    .mob +梦泉游荡者
    .complete 81856,2 --Dreamspring Stormcaller 10/10
    .mob +梦泉唤雷者
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #loop
    .goto Feralas,46.44,15.89,0
    .goto Feralas,45.36,22.36,0
    .goto Feralas,44.45,12.29,50,0
    .goto Feralas,46.44,15.89,50,0
    .goto Feralas,46.35,18.82,50,0
    .goto Feralas,45.36,22.36,50,0
    .goto Feralas,45.55,19.10,50,0
    >>击杀|cRXP_ENEMY_迷失之女|r和|cRXP_ENEMY_复仇之子|r
    .complete 81855,1 --Lost Daughter slain 10/10
    .mob +迷失之女
    .complete 81855,2 --Vengeful Son slain 10/10
    .mob +复仇之子
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #loop
    .goto Feralas,49.81,15.80,0
    .goto Feralas,53.85,12.74,0
    .goto Feralas,49.81,15.80,50,0
    .goto Feralas,50.68,17.37,50,0
    .goto Feralas,51.62,19.54,50,0
    .goto Feralas,52.76,16.27,50,0
    .goto Feralas,53.68,15.81,50,0
    .goto Feralas,53.85,12.74,50,0
    .goto Feralas,54.32,10.44,50,0
    >>击杀|cRXP_ENEMY_癫狂的雏龙|r和|cRXP_ENEMY_龙族狂暴者|r
    >>|cRXP_WARN_小心。|r|cRXP_ENEMY_龙族狂暴者|r|cRXP_WARN_是精英，单刷可能比较困难|r
    .complete 81857,1 --Frenzied Whelp slain 10/10
    .mob +癫狂的雏龙
    .complete 81857,2 --Wyrmkin Berserker slain 10/10
    .mob +龙族狂暴者
step
    #optional
    .isOnQuest 81872
    #season 2
    .goto Feralas,51.00,11.69
    >>前往|cRXP_PICK_翡翠梦境传送门|r
    >>|cRXP_WARN_未能找到或带回的护送对象可跳过，其余已完成任务仍可交付|r
    >>|cRXP_WARN_如果|cRXP_FRIENDLY_梅里阿斯|r、|cRXP_FRIENDLY_奈勒内|r或|cRXP_FRIENDLY_贾姆尼斯|r不再跟随你，就回去重新与对方交谈|r
    >>|cRXP_WARN_在箭头标记的位置（传送门坡道底端）来回走几次，让护送对象跨过边界并计入任务进度|r
    .complete 81872,1 --Rescue Mellias Earthtender: 1/1
    .goto Feralas,49.64,15.44,0
    .target +梅里阿斯·护地者
step
    #optional
    .isOnQuest 81873
    .goto Feralas,51.00,11.69
    >>将这名护送对象带到梦境传送门坡道底部；如果未能带回，可跳过此任务
    .complete 81873,1 --Rescue Nerene Brooksinger: 1/1
    .goto Feralas,45.81,16.47,0
    .target +奈勒内·溪吟
step
    #optional
    .isOnQuest 81874
    .goto Feralas,51.00,11.69
    >>将这名护送对象带到梦境传送门坡道底部；如果未能带回，可跳过此任务
    .complete 81874,1 --Rescue Jamniss Treemender: 1/1
    .goto Feralas,40.58,8.09,0
    .target +贾姆尼斯·愈树者
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    #completewith next
    .goto Feralas,50.95,11.67,30,0
    .goto Feralas,51.28,10.64,20 >>点击|cRXP_PICK_小型梦境传送门|r，返回现实世界
    .aura -444762
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #season 2
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长阿伦奈尔|r交谈
    .turnin 81855 >>交任务：菲拉斯使命I：击败塞纳留斯之子
    .turnin 81856 >>交任务：菲拉斯使命II：击败鹰身人
    .turnin 81857 >>交任务：菲拉斯使命III：击败龙类
    .turnin 81858 >>交任务：菲拉斯使命IV：巨龙情报
    .turnin 81859 >>交任务：菲拉斯使命V：塞纳里奥情报
    .turnin 81860 >>交任务：菲拉斯使命VI：鹰身人情报
    .turnin 81861 >>交任务：菲拉斯使命VII：取回月光龙蛋
    .turnin 81863 >>交任务：菲拉斯使命VIII：取回守护者的笔记
    .turnin 81864 >>交任务：菲拉斯使命IX：取回鹰身人长文
    .turnin -81872,1 >>交任务：菲拉斯使命XVI：营救梅里阿斯·护地者
    .turnin -81873,1 >>交任务：菲拉斯使命XVII：营救奈勒内·溪吟
    .turnin -81874,1 >>交任务：菲拉斯使命XVIII：营救贾姆尼斯·愈树者
    .turnin 82068 >>交任务：抗击梦魇进犯
    .target 战地队长阿伦奈尔
step
    .isOnQuest 81865,81866,81867,81855,81856,81857,81858,81859,81860,81861,81863,81864,81872,81873,81874,82068,81868,81870,81871
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_战地队长阿伦奈尔|r交谈
    >>|cRXP_WARN_交付本轮已经完成的精英击杀任务；未接取或未完成的任务会跳过|r
    .turnin -81868,1 >> 交任务：菲拉斯使命XIII：击败泰兰尼库斯
    .turnin -81870,1 >> 交任务：菲拉斯使命XIV：击败阿隆迪乌斯
    .turnin -81871,1 >> 交任务：菲拉斯使命XV：击败斯蕾娜
    .target 战地队长阿伦奈尔
step
    #optional
    +|cRXP_WARN_你已经超过所有入侵区域的等级上限，无法再接取这些区域的普通任务|r
    >>如果你想提升|r |cRXP_FRIENDLY_翡翠守望者|r声望，菲拉斯有可无限次重复的任务，每次可上交10份|T134186:0|t[|cRXP_LOOT_月之根|r]、|T133594:0|t[|cRXP_LOOT_强效月亮石|r]或|T134312:0|t[|cRXP_LOOT_月龙之鳞|r]中的任意一种
    >>这些任务不提供经验或金币，每次上交可获得100点声望。根据需要从拍卖行购买性价比最高的材料，然后前往菲拉斯上交
    .xp <53,1
step
    #optional
    +你已完成本轮梦魇进犯任务，每日重置后可以再次接取。|cRXP_WARN_请从列表中选择其他指南继续|r
]])
