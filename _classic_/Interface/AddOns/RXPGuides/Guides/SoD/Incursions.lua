RXPGuides.RegisterGuide([[
#classic
#season 2
#group RestedXP 梦魇入侵日常任务
#name (25-32)暮色森林 梦魇入侵
#displayname (25-32)暮色森林 梦魇入侵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r
step
    #optional
    #completewith travel
    +|cRXP_WARN_你已超出此入侵区域的等级, 因此在此进行任务将获得减少的经验奖励. 请从列表中选择一个更适合你当前等级的入侵区域|r
    >>|cRXP_WARN_无论你的等级如何, 声望收益都是一样的. 但是一旦达到53级, 就可以无限重复一个职业材料提交任务, 从而快速获取大量声望|r
    .xp <33,1
    .xp >53,1
step
#ah
    >>在前往暮色森林之前, 请先从拍卖行购买10个|T133852:0|t[|cRXP_LOOT_梦魇苔藓|r]和10个|T134314:0|t[|cRXP_LOOT_梦境龙鳞|r]和10个|T134575:0|t[|cRXP_LOOT_寒铁矿石|r]
    >>|cRXP_WARN_如果附近没有拍卖行, 或者价格不划算, 可以跳过此步骤. 这三个任务总共可获得16,000经验值和225点声望|r
    .collect 219399,10 --Nightmare Moss
    .collect 219402,10 --Dream-Touched Dragonscale
    .collect 219401,10 --Cold Iron Ore
    .maxlevel 53
step
#completewith next
.zone Duskwood >>|cRXP_WARN_前往: |cRXP_PICK_暮色森林|r. Make sure you have plenty of QuestLog space. You will need to hold from 12 to 15 quests at once from the incursion in the log|r
.maxlevel 53
step
    #label travel
  .goto 1431/0,-438.800,-10793.400,30 >>前往通向暮光森林的小径
  .maxlevel 53
step
    .goto 1431/0,-376.600,-10768.500,30 >>沿着小路向上前进
    .maxlevel 53
step
    >>在标记位置寻找|cRXP_FRIENDLY_翡翠守卫|r的军需官, 并向他们购买你的符文
    .goto Duskwood,45.6,51.2
    .target Quartermaster Falinar
    .collect 221480,1 << Mage --Spell Notes: 熔岩护甲
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alclarity
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
    .maxlevel 53
step
    #completewith next
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_无政府主义顿悟|r] |cRXP_WARN_进行训练|r |T132886:0|t[虚空地带] << Priest
    .train 429308 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术说明:熔岩护甲|r]|cRXP_WARN_来训练|r|T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r]|cRXP_WARN_来训练|r|T136228:0|t[不稳定痛苦] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r]|cRXP_WARN_进行训练|r|T135822:0|t[燃烧] << Shaman
    .train 432297 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_阿尔克拉里塔符文|r]|cRXP_WARN_来训练|r|T236269:0|t[直截了当] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_爆炸符文|r]|cRXP_WARN_来训练|r|T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_鲜血符文|r]|cRXP_WARN_来训练|r|T304501:0|t[戈尔] << Druid
    .train 429261 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_锤之符文|r]|cRXP_WARN_来训练|r|T236262:0|t[增强版怒锤] << Paladin
    .use 221480 << Mage -- Spell Notes: 熔岩护甲
    .use 221481 << Priest --Nihilist Epiphany
    .use 221482 << Warlock --Rune of Affliciton
    .use 221483 << Shaman --Rune of Burn
    .use 221512 << Rogue --Rune of Alclarity
    .use 221515 << Hunter --Rune of Detonation
    .use 221517 << Druid --Rune of Bloodshed
    .use 223288,1 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 53
step
    .goto Duskwood,45.6,51.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官法利纳尔|r交谈
    .vendor >>|cRXP_BUY_如果你需要, 最多可从他那里购买 5|r|T134718:0|t[强效治疗药水]|cRXP_BUY_. |r|cRXP_WARN_这些药水只能在突袭区域使用|r
    .target Quartermaster Falinar
    .xp >40,1
    .maxlevel 53
step
    .goto Duskwood,45.6,51.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官法利纳尔|r交谈
    .vendor >>|cRXP_BUY_最多可购买5|r |T236885:0|t[特效治疗药水] |cRXP_BUY_|r |cRXP_WARN_这些物品仅可在突袭区域中使用|r
    .target Quartermaster Falinar
    .xp <40,1
    .maxlevel 53
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官帕兰达尔|r交谈
    .goto Duskwood,45.6,51.2
    .accept 81739 >>接任务: |cRXP_WARN_暮色森林使命X：梦魇苔|r
    .accept 81740 >>接任务: |cRXP_WARN_暮色森林使命XI：冷铁矿石|r
    .accept 81741 >>接任务: |cRXP_WARN_暮色森林使命XII：梦触龙鳞|r
    .itemcount 219399,10 --Nightmare Moss
    .itemcount 219401,10 --Cold Iron Ore
    .itemcount 219402,10 --Dream-Touched Dragonscale
    .maxlevel 53
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官帕兰达尔|r交谈
    .goto Duskwood,45.6,51.2
    .accept 81739 >>接任务: |cRXP_WARN_暮色森林使命X：梦魇苔|r
    .itemcount 219399,10 --Nightmare Moss
    .maxlevel 53
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官帕兰达尔|r交谈
    .goto Duskwood,45.6,51.2
    .accept 81740 >>接任务: |cRXP_WARN_暮色森林使命XI：冷铁矿石|r
    .itemcount 219401,10 --Cold Iron Ore
    .maxlevel 53
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官帕兰达尔|r交谈
    .goto Duskwood,45.6,51.2
    .accept 81741 >>接任务: |cRXP_WARN_暮色森林使命XII：梦触龙鳞|r
    .itemcount 219402,10 --Dream-Touched Dragonscale
    .maxlevel 53
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官帕兰达尔|r交谈
    .goto Duskwood,45.6,51.2
    .turnin -81739 >>交任务: |cRXP_FRIENDLY_暮色森林使命X：梦魇苔|r
    .turnin -81740 >>交任务: |cRXP_FRIENDLY_暮色森林使命XI：冷铁矿石|r
    .turnin -81741 >>交任务: |cRXP_FRIENDLY_暮色森林使命XII：梦触龙鳞|r
    .isOnQuest 81739
    .isOnQuest 81740
    .maxlevel 53
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官帕兰达尔|r交谈
    >>|cRXP_WARN_你现在将进行一次突袭任务循环. 所有这些任务都可以组队完成, 效率更高. 如果看到任务发布者附近有其他玩家, 请尝试组队一起做任务. 如果能凑到一两个玩家, 还可以一起挑战原本无法 solo 完成的 Boss 任务|r
    .goto Duskwood,45.6,51.2
    .target Field Captain Palandar
    .accept 81730 >>接任务: |cRXP_WARN_暮色森林使命I：击败狼人|r
    .accept 81731 >>接任务: |cRXP_WARN_暮色森林使命II：击败食人魔|r
    .accept 81732 >>接任务: |cRXP_WARN_暮色森林使命III：击败龙类|r
    .accept 81733 >>接任务: |cRXP_WARN_暮色森林使命IV：食人魔情报|r
    .accept 81734 >>接任务: |cRXP_WARN_暮色森林使命V：狼人情报|r
    .accept 81735 >>接任务: |cRXP_WARN_暮色森林使命VI：巨龙情报|r
    .accept 81736 >>接任务: |cRXP_WARN_暮色森林使命VII：取回暗影之镰|r
    .accept 81737 >>接任务: |cRXP_WARN_暮色森林使命VIII：取回食人魔法师手记|r
    .accept 81738 >>接任务: |cRXP_WARN_暮色森林使命IX：取回龙蛋|r
    .accept 81745 >>接任务: |cRXP_WARN_暮色森林使命XVI：营救克洛尔·丘影|r
    .accept 81746 >>接任务: |cRXP_WARN_暮色森林使命XVII：营救阿拉菈·愈林|r
    .accept 81747 >>接任务: |cRXP_WARN_暮色森林使命XVIII：营救艾乐诺拉·涉沼|r
    .maxlevel 53
step
.group 3
    .goto Duskwood,45.6,51.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官帕兰达尔|r交谈
    >>|cRXP_WARN_如果你在组队, 也可以考虑接取精英击杀任务. 这些任务需要你击杀的首领拥有大量生命值, 根据你的队伍情况可能会具有一定的挑战性|r
    .accept 81742 >>接任务: |cRXP_WARN_暮色森林使命XIII：击败伊兰希乌斯|r
    .accept 81743 >>接任务: |cRXP_WARN_暮色森林使命XIV：击败瓦阿克祖|r
    .accept 81744 >>接任务: |cRXP_WARN_暮色森林使命XV：击败阿莫卡洛克|r
    .maxlevel 53
step
    #completewith next
    +|cRXP_WARN_点击任务发布者旁边的传送门|r, 进入翡翠梦境
    .maxlevel 53
step
    .goto Duskwood,47.07,49.64,10 >>|cRXP_WARN_一旦进入翡翠梦境|r将离开暮光林地
    .maxlevel 53
step
    #sticky
    #label Ogres
    >>完成其他目标的同时, 击杀|cRXP_ENEMY_狂乱食人魔|r和|cRXP_ENEMY_发疯的火焰德拉维沃尔|r
    .complete 81731,1
    .complete 81731,2
    .mob Deranged Ogre
    .mob Demented Fire Weaver
    .maxlevel 53
step
    .goto Duskwood,32.48,69.60
    .gossipoption 122140 >>与躺在地上的|cRXP_FRIENDLY_艾琳娜·马什沃克|r交谈. 她应该会开始跟随你
    >>|cRXP_WARN_如果她不在那里, 说明有人正在护送她, 如果你找不到她, 就跳过这一步|r
    .target Elenora Marshwalker
    .maxlevel 53
step
    #completewith next
    +|cRXP_WARN_请注意, 如果你死亡, 所有跟随你的护送NPC将返回至接任务时的位置, 你需要重新找到他们|r
    >>|cRXP_WARN_护送NPC在接取后15分钟内若未完成任务将自动停止跟随, 请尽快完成！|r
    .maxlevel 53
step
    .goto Duskwood,35.67,80.35
    >>进入洞穴, 拾取位于中央平台上的食人魔法师尸体
    .complete 81737,1 --Ogre Magi Text(1)
    .maxlevel 53
step
    .goto Duskwood,36.62,83.75
    >>深入洞穴并与|cRXP_FRIENDLY_梦境守护者 塞拉纳尔|r交谈, 以获得|T134939:0|t[|cRXP_LOOT_情报报告|r]
    .complete 81733,1
    .target Dreamwarden Thalinar
    .skipgossip
    .maxlevel 53
step
    .goto Duskwood,37.6,84.6
    .group 3
    >>|cRXP_WARN_击杀|r|cRXP_ENEMY_Vvarc'Zul|r|cRXP_WARN_. 请注意, 他拥有庞大的生命值, 并会施放|r|T135812:0|t[火球]|cRXP_WARN_以及召唤|r|T135819:0|t[火元素]|cRXP_WARN_小怪|r
    .complete 81743,1 --Vvarc'Zul slain
    .target Vvarc'Zul
    .isOnQuest 81743
    .maxlevel 53
step
    #sticky
    #label Dragons
    #requires Ogres
    >>完成其他目标的同时, 击杀|cRXP_ENEMY_Nightterror Whelps|r(夜魇幼崽)和|cRXP_ENEMY_Wyrmkin Terrorwalkers|r(恐惧行者)
    .complete 81732,1
    .complete 81732,2
    .mob Nightterror Whelp
    .mob Wyrmkin Terrorwalker
    .maxlevel 53
step
    #requires Ogres
    .goto Duskwood,48.92,72.97
    >>拾取树桩旁地面上的 [|cRXP_LOOT_未孵化的绿龙蛋|r]
    .complete 81738,1
    .maxlevel 53
step
    .goto Duskwood,49.13,77.41
    .gossipoption 122136 >>与躺在地上的|cRXP_FRIENDLY_阿拉·格罗维门德|r交谈. 她应该会开始跟随你
    >>|cRXP_WARN_如果她不在那里, 说明有人正在护送她, 如果你找不到她, 就跳过这一步|r
    .target Alara Grovemender
    .maxlevel 53
step
    .goto Duskwood,50.6,77.0
    >>进入农舍, 与|r|cRXP_FRIENDLY_Dreamwarden Amalia|r交谈, 以获取|r|T134939:0|t[|cRXP_LOOT_情报报告|r]
    .complete 81735,1
    .target Dreamwarden Amalia
    .skipgossip
    .maxlevel 53
step
    .goto Duskwood,49.8,74.4
    .group 3
    >>|cRXP_WARN_击杀|r |cRXP_ENEMY_Ylanthrius|r. |cRXP_WARN_一只绿色巨龙正在农场上空盘旋|r|cRXP_WARN_. 他拥有巨额生命值, 对自然系法术免疫, 并具备|r|T132338:0|t[斩击]|cRXP_WARN_和|r |T134307:0|t[尾扫]|cRXP_WARN_以及|r |T135745:0|t[召唤]|cRXP_WARN_技能, 还会召唤出一个|r |cRXP_ENEMY_Drake|r |cRXP_WARN_小怪, 该小怪会释放面向前方的喷吐攻击, 造成巨额伤害|r
    .complete 81742,1 --Ylanthrius (1)
    .maxlevel 53
    .isOnQuest 81742
step
    #sticky
    #label Worgen
    #requires Dragons
    >>完成其他目标的同时, 击杀梦魇奔跑者和梦魇编织者
    .complete 81730,1
    .complete 81730,2
    .mob Nightmare Runner
    .mob Nightmare Weaver
    .maxlevel 53
step
    #requires Dragons
    .goto Duskwood,66.32,76.09
    >>进入谷仓, 与|r|cRXP_FRIENDLY_Dreamwarden Dorilar|r交谈, 以领取|r|T134939:0|t[|cRXP_LOOT_情报报告|r]
    >>|cRXP_WARN_请勿深入谷仓. 您可以通过瞄准NPC, 然后使用交互键与其对话|r
    >>|cRXP_WARN_小心, 因为Boss|r |cRXP_ENEMY_Amokarok|r |cRXP_WARN_就在NPC旁边|r
    .complete 81734,1
    .target Dreamwarden Dorilar
    .skipgossip
    .maxlevel 53
step
    .goto Duskwood,66.0,76.4
    >>|cRXP_WARN_击杀|r|cRXP_ENEMY_阿莫卡洛克|r|cRXP_WARN_在谷仓内. 请注意, 他拥有巨额血量, 并会施放范围伤害技能|r|T136183:0|t[恐惧]
    .complete 81744,1 --Amokarok (1)
    .maxlevel 53
    .isOnQuest 81744
    .group 3
step
    .goto Duskwood,65.99,69.36
    .gossipoption 122146 >>与躺在地上的|cRXP_FRIENDLY_Kroll Mountainshade|r交谈. 他会开始跟随你
    >>|cRXP_WARN_如果他不在那里, 说明有人正在护送他, 如果你找不到他, 就跳过这一步|r
    .target Kroll Mountainshade
    .maxlevel 53
step
    .goto Duskwood,65.60,67.30
    >>前往较大房子的二楼, 搜刮那里的箱子以获得 |T135138:0|t[|cRXP_LOOT_Shadowscythe|r]
    .complete 81736,1
    .maxlevel 53
step
    #requires Worgen
    .goto Duskwood,70.93,65.90
    .goto Duskwood,44.60,65.80,50 >>向西前进, 直到抵达噩梦区域的边界之外. 你的屏幕将开始泛起绿光, 随后你会被传送回入口附近. |cRXP_WARN_别担心, 你护送的NPC会跟着你回来|r
    .maxlevel 53
step
    #completewith next
    .goto 1431/0,-421.400,-10360.601,5 >>返回噩梦传送门. |cRXP_WARN_路上不要死亡, 否则护送任务将失败！如果你安全抵达传送门, 所有三个任务都会完成|r
    .maxlevel 53
step
    .goto 1431/0,-421.400,-10360.601
    >>确保你已获得所有护送任务的奖励. 在到达传送门时, 这些任务都应已完成. |cRXP_WARN_如果你没有获得奖励, 请尝试前后移动一下|r
    .complete 81745,1
    .complete 81746,1
    .complete 81747,1
    .maxlevel 53
step
    .goto Duskwood,46.63,47.90,5 >>返回到你用来进入翡翠梦境的传送门, 并|cRXP_WARN_click它以返回正常世界|r
    .maxlevel 53
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官帕兰达尔|r交谈
    .goto Duskwood,45.6,51.2
    .target Field Captain Palandar
    .turnin 81730 >>交任务: |cRXP_FRIENDLY_暮色森林使命I：击败狼人|r
    .turnin 81731 >>交任务: |cRXP_FRIENDLY_暮色森林使命II：击败食人魔|r
    .turnin 81732 >>交任务: |cRXP_FRIENDLY_暮色森林使命III：击败龙类|r
    .turnin 81733 >>交任务: |cRXP_FRIENDLY_暮色森林使命IV：食人魔情报|r
    .turnin 81734 >>交任务: |cRXP_FRIENDLY_暮色森林使命V：狼人情报|r
    .turnin 81735 >>交任务: |cRXP_FRIENDLY_暮色森林使命VI：巨龙情报|r
    .turnin 81736 >>交任务: |cRXP_FRIENDLY_暮色森林使命VII：取回暗影之镰|r
    .turnin 81737 >>交任务: |cRXP_FRIENDLY_暮色森林使命VIII：取回食人魔法师手记|r
    .turnin 81738 >>交任务: |cRXP_FRIENDLY_暮色森林使命IX：取回龙蛋|r
    .turnin 81745 >>交任务: |cRXP_FRIENDLY_暮色森林使命XVI：营救克洛尔·丘影|r
    .turnin 81746 >>交任务: |cRXP_FRIENDLY_暮色森林使命XVII：营救阿拉菈·愈林|r
    .turnin 81747 >>交任务: |cRXP_FRIENDLY_暮色森林使命XVIII：营救艾乐诺拉·涉沼|r
    .maxlevel 53
step
    #optional
    .goto Duskwood,45.6,51.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官帕兰达尔|r交谈
    >>|cRXP_WARN_如果你在组队, 也可以考虑接取精英击杀任务. 这些任务需要你击杀的首领拥有大量生命值, 根据你的队伍情况可能会具有一定的挑战性|r
    .turnin -81742 >>交任务: |cRXP_FRIENDLY_暮色森林使命XIII：击败伊兰希乌斯|r
    .turnin -81743 >>交任务: |cRXP_FRIENDLY_暮色森林使命XIV：击败瓦阿克祖|r
    .turnin -81744 >>交任务: |cRXP_FRIENDLY_暮色森林使命XV：击败阿莫卡洛克|r
    .maxlevel 53
    .target Field Captain Palandar
step
    #optional
    +|cRXP_WARN_你已超出所有入侵区域的等级限制, 将无法再接受其中任何常规任务|r
    >>如果你想提升与|r|cRXP_FRIENDLY_Emerald 守卫者|r的声望, 可以在菲拉斯地区完成无限重复的任务, 提交10个以下任意一种物品:|T134186:0|t[|cRXP_LOOT_Moonroot|r]和|T133594:0|t[|cRXP_LOOT_Greater Moonstones|r] 或 |T134312:0|t[|cRXP_LOOT_Moon Dragon Scales|r]
    >>这些任务不提供经验值或金币, 每次提交可获得100点声望. 请根据需要从拍卖行购买尽可能多的性价比最高的材料, 然后前往菲拉斯提交任务
    .xp <53,1
step
    #optional
    +你已完成此噩梦入侵循环. 任务将在每日重置后再次可用. |cRXP_WARN_请选择列表中的其他指南继续|r
]])

RXPGuides.RegisterGuide([[
#classic
#season 2
#group RestedXP 梦魇入侵日常任务
#name (40-49)灰谷 梦魇入侵
#displayname (40-49)灰谷 梦魇入侵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #optional
    #completewith next
    +|cRXP_WARN_你已超出此入侵区域的等级, 因此在此进行任务将获得减少的经验奖励. 请从列表中选择一个更适合你当前等级的入侵区域|r
    >>|cRXP_WARN_无论你的等级如何, 声望收益都是一样的. 但是一旦达到53级, 就可以无限重复一个职业材料提交任务, 从而快速获取大量声望|r
    .xp <48,1
    .xp >53,1
step
    #ah
    >>在前往灰谷之前, 请先从拍卖行购买10个|T132106:0|t[|cRXP_LOOT_Dreamroot|r]和10个|T134306:0|t[|cRXP_LOOT_Dream-Infused Dragonscale|r]和10个|T133848:0|t[|cRXP_LOOT_Fool's Gold Dust|r]
    >>|cRXP_WARN_如果附近没有拍卖行, 或者价格不值得, 可以跳过此步骤. 这三个任务合计提供25.875点经验值和225点声望|r
    .collect 219444,10 --Dreamroot
    .collect 219446,10 --Dream-Infused Dragonscale
    .collect 219445,10 --Fool's Gold Dust
    .maxlevel 53
step
    #season 2
    #label travel
    .zone Ashenvale >>前往: |cRXP_PICK_灰谷|r. |cRXP_WARN_Make sure you have plenty of QuestLog space. You will need to hold from 12 to 15 quests at once from the incursion in the log|r
    >>如果你有艾萨拉的飞行点, 直接飞过去再跑往灰谷, 比飞到阿斯特兰纳更省时 << Alliance
    .maxlevel 53
step
    .goto Ashenvale,88.9,42.0,65 >>前往灰谷东北部的翡翠梦魇传送门区域
    .maxlevel 53
step
    .goto Ashenvale,89.60,40.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库瑞琳军需官|r交谈
    .target Quartermaster Kyleen
    .collect 221480,1 << Mage --Spell Notes: 熔岩护甲
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alclarity
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
    .maxlevel 53
step
    #completewith next
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_无政府主义顿悟|r] |cRXP_WARN_进行训练|r |T132886:0|t[虚空地带] << Priest
    .train 429308 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术说明:熔岩护甲|r]|cRXP_WARN_来训练|r|T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r]|cRXP_WARN_来训练|r|T136228:0|t[不稳定痛苦] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r]|cRXP_WARN_进行训练|r|T135822:0|t[燃烧] << Shaman
    .train 432297 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_阿尔克拉里塔符文|r]|cRXP_WARN_来训练|r|T236269:0|t[直截了当] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_爆炸符文|r]|cRXP_WARN_来训练|r|T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_鲜血符文|r]|cRXP_WARN_来训练|r|T304501:0|t[戈尔] << Druid
    .train 429261 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_锤之符文|r]|cRXP_WARN_来训练|r|T236262:0|t[增强版怒锤] << Paladin
    .use 221480 << Mage -- Spell Notes: 熔岩护甲
    .use 221481 << Priest --Nihilist Epiphany
    .use 221482 << Warlock --Rune of Affliciton
    .use 221483 << Shaman --Rune of Burn
    .use 221512 << Rogue --Rune of Alclarity
    .use 221515 << Hunter --Rune of Detonation
    .use 221517 << Druid --Rune of Bloodshed
    .use 223288,1 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 53
step
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官汉娜拉|r交谈
    .accept 81777 >>接任务: |cRXP_WARN_灰谷使命X：梦之根|r
    .accept 81778 >>接任务: |cRXP_WARN_灰谷使命XI：愚人金砂|r
    .accept 81779 >>接任务: |cRXP_WARN_灰谷使命XII：梦注龙鳞|r
    .itemcount 219444,10 --Dreamroot
    .itemcount 219446,10 --Dream-Infused Dragonscale
    .itemcount 219445,10 --Fool's Gold Dust
    .maxlevel 53
step
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官汉娜拉|r交谈
    .accept 81777 >>接任务: |cRXP_WARN_灰谷使命X：梦之根|r
    .itemcount 219444,10 --Dreamroot
    .maxlevel 53
step
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官汉娜拉|r交谈
    .accept 81778 >>接任务: |cRXP_WARN_灰谷使命XI：愚人金砂|r
    .itemcount 219445,10 --Fool's Gold Dust
    .maxlevel 53
step
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官汉娜拉|r交谈
    .accept 81779 >>接任务: |cRXP_WARN_灰谷使命XII：梦注龙鳞|r
    .itemcount 219446,10 --Dream-Infused Dragonscale
    .maxlevel 53
step
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官汉娜拉|r交谈
    .turnin -81777 >>交任务: |cRXP_FRIENDLY_灰谷使命X：梦之根|r
    .turnin -81778 >>交任务: |cRXP_FRIENDLY_灰谷使命XI：愚人金砂|r
    .turnin -81779 >>交任务: |cRXP_FRIENDLY_灰谷使命XII：梦注龙鳞|r
    .maxlevel 53
step
    #season 2
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官汉娜拉|r交谈
    .accept 81772 >>接任务: |cRXP_WARN_灰谷使命V：萨特情报|r
    .accept 81785 >>接任务: |cRXP_WARN_灰谷使命XVIII：营救马塞拉·秋月|r
    .accept 81784 >>接任务: |cRXP_WARN_灰谷使命XVII：营救多兰·梦枝|r
    .accept 81783 >>接任务: |cRXP_WARN_灰谷使命XVI：营救阿莱希娅·唤风者|r
    .accept 81776 >>接任务: |cRXP_WARN_灰谷使命IX：取回梦触龙蛋|r
    .accept 81775 >>接任务: |cRXP_WARN_灰谷使命VIII：取回艾萨拉预言|r
    .accept 81774 >>接任务: |cRXP_WARN_灰谷使命VII：取回造梦引擎|r
    .accept 81773 >>接任务: |cRXP_WARN_灰谷使命VI：树人情报|r
    .accept 81771 >>接任务: |cRXP_WARN_灰谷使命IV：巨龙情报|r
    .accept 81768 >>接任务: |cRXP_WARN_灰谷使命I：击败萨特|r
    .accept 81769 >>接任务: |cRXP_WARN_灰谷使命II：击败树人|r
    .accept 81770 >>接任务: |cRXP_WARN_灰谷使命III：击败龙类|r
    .target Field Captain Hannalah
    .maxlevel 53
step
    #season 2
    #optional
    .group 3
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官汉娜拉|r交谈
    >>|cRXP_WARN_如果你在组队, 也可以考虑接取精英击杀任务. 这些任务需要你击杀的首领拥有大量生命值, 根据你的队伍情况可能会具有一定的挑战性|r
    .accept 81780 >>接任务: |cRXP_WARN_灰谷使命XIII：击败拉尔瑟拉|r
    .accept 81781 >>接任务: |cRXP_WARN_灰谷使命XIV：击败查利乌斯|r
    .accept 81782 >>接任务: |cRXP_WARN_灰谷使命XV：击败伐木机9000型|r
    .maxlevel 53
step
    #season 2
    .goto Ashenvale,89.60,40.61
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_库瑞琳军需官|r交谈
    .vendor >>|cRXP_BUY_|cRXP_BUY_如果你愿意，从她那里最多购买5个|r|T236885:0|t[特效治疗药水]|r 
    >>|cRXP_WARN_这些只能在突袭区域使用|r
    .target Quartermaster Kyleen
    .maxlevel 53
step
    #season 2
    #completewith IncursionsComplete
    .goto Ashenvale,93.94,38.21,25,0
    .goto Ashenvale,94.27,35.13,20 >>进入|cRXP_PICK_梦境之门|r
    >>|cRXP_WARN_直接跑过|cRXP_ENEMY_Satyr's|r和|cRXP_ENEMY_地狱巨犬|r和 |cRXP_ENEMY_Imps|r. 当你进入传送门时, 它们会失去仇恨|r
    .aura 444759
    .maxlevel 53
step
    #season 2
    #completewith EllodarReport
    >>击杀|cRXP_ENEMY_Wyrmkin 夜行豹|r和|cRXP_ENEMY_Terror 恐怖幼龙|r
    >>|cRXP_WARN_小心. |r|cRXP_ENEMY_Wyrmkin 夜行豹|r|cRXP_WARN_是41级精英|r
    .complete 81770,1 --Wyrmkin Nightstalker slain: 3/3
    .mob +Wyrmkin Nightstalker
    .complete 81770,2 --Terror Whelp slain: 10/10
    .mob +Terror Whelp 
    .maxlevel 53
step
    #season 2
    .goto Ashenvale,87.24,43.58
    .gossipoption 122139 >>与|cRXP_FRIENDLY_Doran Dreambough|r交谈. 他会开始跟随你
    .target Doran Dreambough
    .isOnQuest 81784
    .maxlevel 53
step
    #completewith next
    +|cRXP_WARN_请注意, 如果你死亡, 所有跟随你的护送NPC将返回至接任务时的位置, 你需要重新找到他们|r
    >>|cRXP_WARN_护送NPC在接取后15分钟内若未完成任务将自动停止跟随, 请尽快完成！|r
    .maxlevel 53
step
    #season 2
    .goto Ashenvale,86.11,45.87
    >>拾取地面上的|cRXP_LOOT_Dream-Touched Dragon Egg|r
    .complete 81776,1 --Dream-Touched Dragon Egg: 1/1
    .maxlevel 53
step
    #season 2
    .group 3
    .goto Ashenvale,86.0,46.0
    >>|cRXP_WARN_击杀|r|cRXP_ENEMY_Larsera|r|cRXP_WARN_. 她拥有庞大的生命值, 对自然系法术免疫, 并且拥有|r|T132338:0|t[劈砍]|cRXP_WARN_和|r|T134307:0|t[尾扫]|cRXP_WARN_以及|r|T135745:0|t[召唤]|cRXP_WARN_, 还会召唤一只|r|cRXP_ENEMY_Drake|r|cRXP_WARN_小怪, 该小怪会释放一道前方范围吐息, 造成巨额伤害|r
    .complete 81780,1 --Defeat Larsera
    .isOnQuest 81780
    .maxlevel 53
step
    #season 2
    #label EllodarReport
    .goto Ashenvale,83.64,45.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦守者艾洛达尔|r交谈
    .complete 81771,1 --Intelligence Report: Forest Song: 1/1
    .target Dreamwarden Ellodar
    .skipgossip
    .maxlevel 53
step
    #season 2
    .goto Ashenvale,81.54,48.54
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦守护者曼多兰|r交谈
    .complete 81772,1 --Intelligence Report: Satyrnaar: 1/1
    .target Dreamwarden Mandoran
    .skipgossip
    .maxlevel 53
step
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
    >>击杀|cRXP_ENEMY_Dreamfire 背叛者|r和|cRXP_ENEMY_Dreamfire 地狱召唤者|r
    .complete 81768,2 --Dreamfire Betrayer slain: 10/10
    .mob +Dreamfire Betrayer
    .complete 81768,1 --Dreamfire Hellcaller slain: 10/10
    .mob +Dreamfire Hellcaller
    .maxlevel 53
step
    #season 2
    .goto 1440/1,-2950.700,2791.700
    >>在地面上掠夺|cRXP_LOOT_Azsharan Prophecy|r
    .complete 81775,1 --Azsharan Prophecy: 1/1
    .maxlevel 53
step
    #season 2
    #label MasearaAut
    #season 2
    .goto 1440/1,-2978.000,2739.500
    .gossipoption 122150 >>与|cRXP_FRIENDLY_Maseara Autumnmoon|r交谈. 她应该会开始跟随你
    .target Maseara Autumnmoon
    .isOnQuest 81785
    .maxlevel 53
step
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
    >>击杀|cRXP_ENEMY_Dreamfire 背叛者|r和|cRXP_ENEMY_Dreamfire 地狱召唤者|r
    .complete 81768,2 --Dreamfire Betrayer slain: 10/10
    .mob +Dreamfire Betrayer
    .complete 81768,1 --Dreamfire Hellcaller slain: 10/10
    .mob +Dreamfire Hellcaller
    .maxlevel 53
step
    #season 2
    .goto 1440/1,-3394.600,2540.900
    >>打开|cRXP_PICK_Vibrating Crate|r. 搜刮出|cRXP_LOOT_Dreamengine|r
    .complete 81774,1 --Dreamengine: 1/1
    .maxlevel 53
step
    #season 2
    #completewith next
    .goto Ashenvale,90.14,58.08,10 >>进入卡加西亚要塞
    >>|cRXP_WARN_入口被|r|cRXP_ENEMY_梦收割者|r|cRXP_WARN_(等级41精英)堵住. 在你冲进去时, 先控制住它或将其击杀|r
    .mob Dreamharvester
    .maxlevel 53
step
    #season 2
    .goto Ashenvale,91.23,58.05
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦境守护者兰妮娅|r交谈
    .complete 81773,1 --Intelligence Report: Warsong Lumber Camp: 1/1
    .target Dreamwarden Lanaria
    .skipgossip
    .maxlevel 53
step
.group 3
    #season 2
    .goto Ashenvale,87.6,62.2
    >>|cRXP_WARN_击杀|r|cRXP_ENEMY_剪切者9000|r. 请注意, 他拥有庞大的生命值, 并且具备 |T132338:0|t[斩击] 和 |T132338:0|t[范围击退] 技能
    .complete 81782,1 --Defeat Shredder 9000
    .isOnQuest 81782
    .maxlevel 53
step
    #sticky
    #label Treants
    .goto Ashenvale,85.6,65.6,0
    .goto Ashenvale,86.6,59.6,0
    .goto Ashenvale,90.0,50.2,0
    >>击杀该区域内的|cRXP_ENEMY_狂怒的树人|r
    >>|cRXP_WARN_要小心, 因为他们是精英怪, 如果你实力不够无法单刷, 请跳过此步骤|r
    .complete 81769,1 --Vengeful Ancient slain (7)
    .maxlevel 53
step
    #season 2
    .goto Ashenvale,92.11,54.21
    .gossipoption 122138 >>与|cRXP_FRIENDLY_艾莉西亚风语者|r交谈. 他会开始跟随你
    .target Alyssian Windcaller
    .isOnQuest 81783
    .maxlevel 53
step
    #season 2
    #requires Treants
    .goto Ashenvale,81.0,50.6
    .group 3
    >>击杀|cRXP_ENEMY_Zalius|r|cRXP_WARN_请注意, 他拥有庞大的生命值|r
    .complete 81781,1 --Defeat Zalius (1)
    .isOnQuest 81781
    .maxlevel 53
step
    #season 2
    #loop
    .goto Ashenvale,86.31,43.07,0
    .goto Ashenvale,86.57,47.66,50,0
    .goto Ashenvale,87.03,45.92,50,0
    .goto Ashenvale,88.26,42.14,50,0
    .goto Ashenvale,86.31,43.07,50,0
    .goto Ashenvale,84.36,45.06,50,0
    .goto Ashenvale,83.90,47.38,50,0
    >>完成击杀|cRXP_ENEMY_Wyrmkin Nightstalkers|r和|cRXP_ENEMY_Terror Whelps|r
    >>|cRXP_WARN_小心. |r|cRXP_ENEMY_Wyrmkin 夜行豹|r|cRXP_WARN_是41级精英|r
    .complete 81770,1 --Wyrmkin Nightstalker slain: 3/3
    .mob +Wyrmkin Nightstalker
    .complete 81770,2 --Terror Whelp slain: 10/10
    .mob +Terror Whelp 
    .maxlevel 53
step
    #season 2
    #requires Treants
    #label IncursionsComplete
    .goto Ashenvale,93.97,38.02
    >>前往|cRXP_PICK_梦境之门|r
    >>|cRXP_WARN_如果|cRXP_FRIENDLY_Maseara|r和|cRXP_FRIENDLY_Alyssian|r或|cRXP_FRIENDLY_Doran|r不再跟随你, 请返回并再次与他们交谈|r
    >>|cRXP_WARN_请在箭头所指的标记位置(传送门坡道底部)来回走动几次. 这样会让NPC穿过阈值区域, 从而给予你任务奖励|r
    .complete 81783,1 --Rescue Alyssian Windcaller: 1/1
    .target +Alyssian Windcaller
    .goto Ashenvale,92.11,54.21,0
    .complete 81784,1 --Rescue Doran Dreambough: 1/1
    .goto Ashenvale,87.24,43.58,0
    .target +Doran Dreambough
    .complete 81785,1 --Rescue Maseara Autumnmoon: 1/1
    .goto Ashenvale,81.16,50.28,0
    .target +Maseara Autumnmoon
    .maxlevel 53
step
    #season 2
    #completewith next
    .goto Ashenvale,93.94,38.21,25,0
    .goto Ashenvale,94.27,35.13,20 >>退出|cRXP_PICK_Emerald 梦境之门|r
    .aura -444759
    .maxlevel 53
step
    #season 2
    .goto Ashenvale,89.57,40.68
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官汉娜拉|r交谈
    .turnin 81771 >>交任务: |cRXP_FRIENDLY_灰谷使命IV：巨龙情报|r
    .turnin 81772 >>交任务: |cRXP_FRIENDLY_灰谷使命V：萨特情报|r
    .turnin 81773 >>交任务: |cRXP_FRIENDLY_灰谷使命VI：树人情报|r
    .turnin 81774 >>交任务: |cRXP_FRIENDLY_灰谷使命VII：取回造梦引擎|r
    .turnin 81775 >>交任务: |cRXP_FRIENDLY_灰谷使命VIII：取回艾萨拉预言|r
    .turnin 81776 >>交任务: |cRXP_FRIENDLY_灰谷使命IX：取回梦触龙蛋|r
    .turnin 81783 >>交任务: |cRXP_FRIENDLY_灰谷使命XVI：营救阿莱希娅·唤风者|r
    .turnin 81784 >>交任务: |cRXP_FRIENDLY_灰谷使命XVII：营救多兰·梦枝|r
    .turnin 81785 >>交任务: |cRXP_FRIENDLY_灰谷使命XVIII：营救马塞拉·秋月|r
    .turnin 81768 >>交任务: |cRXP_FRIENDLY_灰谷使命I：击败萨特|r
    .turnin 81769 >>交任务: |cRXP_FRIENDLY_灰谷使命II：击败树人|r
    .turnin 81770 >>交任务: |cRXP_FRIENDLY_灰谷使命III：击败龙类|r
    .target Field Captain Hannalah
    .maxlevel 53
step
    #season 2
    #optional
    .goto Ashenvale,89.53,40.71
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官汉娜拉|r交谈
    .turnin -81780 >>交任务: |cRXP_FRIENDLY_灰谷使命XIII：击败拉尔瑟拉|r
    .turnin -81781 >>交任务: |cRXP_FRIENDLY_灰谷使命XIV：击败查利乌斯|r
    .turnin -81782 >>交任务: |cRXP_FRIENDLY_灰谷使命XV：击败伐木机9000型|r
    .target Field Captain Hannalah
    .maxlevel 53
step
    #optional
    +|cRXP_WARN_你已超出所有入侵区域的等级限制, 将无法再接受其中任何常规任务|r
    >>如果你想提升与|r|cRXP_FRIENDLY_Emerald 守卫者|r的声望, 可以在菲拉斯地区完成无限重复的任务, 提交10个以下任意一种物品:|T134186:0|t[|cRXP_LOOT_Moonroot|r]和|T133594:0|t[|cRXP_LOOT_Greater Moonstones|r] 或 |T134312:0|t[|cRXP_LOOT_Moon Dragon Scales|r]
    >>这些任务不提供经验值或金币, 每次提交可获得100点声望. 请根据需要从拍卖行购买尽可能多的性价比最高的材料, 然后前往菲拉斯提交任务
    .xp <53,1
step
    #optional
    +你已完成此噩梦入侵循环. 任务将在每日重置后再次可用. |cRXP_WARN_请选择列表中的其他指南继续|r
]])

RXPGuides.RegisterGuide([[
#classic
#season 2
#group RestedXP 梦魇入侵日常任务
#name (50-53) 辛特兰梦魇入侵
#displayname (50-53) 辛特兰梦魇入侵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r


step
    #ah
    >>在前往荒野之地之前, 请从拍卖行购买10个|T134207:0|t[|cRXP_LOOT_星莲草|r]和10个|T134964:0|t[|cRXP_LOOT_星壳|r]和10个|T237436:0|t[|cRXP_LOOT_星银矿石|r]
    >>|cRXP_WARN_如果附近没有拍卖行, 或者价格不划算, 可以跳过此步骤. 这三个任务合计可获得38,250点经验值和300点声望|r
    .collect 219454,10 --Star Lotus
    .collect 219487,10 --Starshell
    .collect 219486,10 --Starsilver Ore
    .maxlevel 53
step
    #completewith next
    #label travel
    .zone The Hinterlands >>前往荒野地区
    .maxlevel 53
step
    .goto The Hinterlands,60.81,37.86,20 >>前往通往塞拉丹的桥
    .maxlevel 53
step
    .goto The Hinterlands,61.4,34.6 
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官阿兰德拉|r交谈
    .target Quartermaster Alandra
    .collect 221480,1 << Mage --Spell Notes: 熔岩护甲
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alclarity
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
    .maxlevel 53
step
    #completewith next
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_无政府主义顿悟|r] |cRXP_WARN_进行训练|r |T132886:0|t[虚空地带] << Priest
    .train 429308 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术说明:熔岩护甲|r]|cRXP_WARN_来训练|r|T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r]|cRXP_WARN_来训练|r|T136228:0|t[不稳定痛苦] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r]|cRXP_WARN_进行训练|r|T135822:0|t[燃烧] << Shaman
    .train 432297 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_阿尔克拉里塔符文|r]|cRXP_WARN_来训练|r|T236269:0|t[直截了当] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_爆炸符文|r]|cRXP_WARN_来训练|r|T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_鲜血符文|r]|cRXP_WARN_来训练|r|T304501:0|t[戈尔] << Druid
    .train 429261 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_锤之符文|r]|cRXP_WARN_来训练|r|T236262:0|t[增强版怒锤] << Paladin
    .use 221480 << Mage -- Spell Notes: 熔岩护甲
    .use 221481 << Priest --Nihilist Epiphany
    .use 221482 << Warlock --Rune of Affliciton
    .use 221483 << Shaman --Rune of Burn
    .use 221512 << Rogue --Rune of Alclarity
    .use 221515 << Hunter --Rune of Detonation
    .use 221517 << Druid --Rune of Bloodshed
    .use 223288,1 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 53
step
    #optional
    >>过桥 and |Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁卫队长科里安|r交谈
    .goto The Hinterlands,61.4,34.6
    .accept 81833 >>接任务: |cRXP_WARN_辛特兰使命X：星辉莲|r
    .accept 81834 >>接任务: |cRXP_WARN_辛特兰使命XI：星银矿石|r
    .accept 81835 >>接任务: |cRXP_WARN_辛特兰使命XII：星之壳|r
    .itemcount 219454,10 --Star Lotus
    .itemcount 219487,10 --Starshell
    .itemcount 219486,10 --Starsilver Ore
    .target Field Captain Korlian
    .maxlevel 53
step
    #optional
    >>过桥 and |Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁卫队长科里安|r交谈
    .goto The Hinterlands,61.4,34.6
    .accept 81833 >>接任务: |cRXP_WARN_辛特兰使命X：星辉莲|r
    .itemcount 219454,10 --Star Lotus
    .target Field Captain Korlian
    .maxlevel 53
step
    #optional
    >>过桥 and |Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁卫队长科里安|r交谈
    .goto The Hinterlands,61.4,34.6
    .accept 81834 >>接任务: |cRXP_WARN_辛特兰使命XI：星银矿石|r
    .itemcount 219486,10 --Starsilver Ore
    .target Field Captain Korlian
    .maxlevel 53
step
    #optional
    >>过桥 and |Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁卫队长科里安|r交谈
    .goto The Hinterlands,61.4,34.6
    .accept 81835 >>接任务: |cRXP_WARN_辛特兰使命XII：星之壳|r
    .itemcount 219487,10 --Starshell
    .target Field Captain Korlian
    .maxlevel 53
step
    #optional
    >>过桥 and |Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁卫队长科里安|r交谈
    .goto The Hinterlands,61.4,34.6
    .turnin -81833 >>交任务: |cRXP_FRIENDLY_辛特兰使命X：星辉莲|r
    .turnin -81834 >>交任务: |cRXP_FRIENDLY_辛特兰使命XI：星银矿石|r
    .turnin -81835 >>交任务: |cRXP_FRIENDLY_辛特兰使命XII：星之壳|r
    .target Field Captain Korlian
step
    >>过桥 and |Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁卫队长科里安|r交谈
    .goto The Hinterlands,61.4,34.6
    .accept 82068 >>接任务: |cRXP_WARN_抗击梦魇进犯|r
    .accept 81786 >>接任务: |cRXP_WARN_辛特兰使命I：击败枭兽|r
    .accept 81787 >>接任务: |cRXP_WARN_辛特兰使命II：击败巨龟|r
    .accept 81788 >>接任务: |cRXP_WARN_辛特兰使命III：击败龙类|r
    .accept 81789 >>接任务: |cRXP_WARN_辛特兰使命IV：巨龙情报|r
    .accept 81817 >>接任务: |cRXP_WARN_辛特兰使命V：巨龟情报|r
    .accept 81820 >>接任务: |cRXP_WARN_辛特兰使命VI：枭兽情报|r
    .accept 81826 >>接任务: |cRXP_WARN_辛特兰使命VII：取回星触龙蛋|r
    .accept 81830 >>接任务: |cRXP_WARN_辛特兰使命VIII：取回艾露纳圣物|r
    .accept 81832 >>接任务: |cRXP_WARN_辛特兰使命IX：取回梦境珍珠|r
    .accept 81850 >>接任务: |cRXP_WARN_辛特兰使命XVI：营救伊利阿纳尔·啜影者|r
    .accept 81851 >>接任务: |cRXP_WARN_辛特兰使命XVII：营救瑟丽娜·星辉|r
    .accept 81852 >>接任务: |cRXP_WARN_辛特兰使命XVIII：营救维阿娜·云梦|r
    .target Field Captain Korlian
    .maxlevel 53
step
    #optional
    .group 3
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁卫队长科里安|r交谈
    >>|cRXP_WARN_如果你在组队, 也可以考虑接取精英击杀任务. 这些任务需要你击杀的首领拥有大量生命值, 根据你的队伍情况可能会具有一定的挑战性|r
    .accept 81837 >>接任务: |cRXP_WARN_辛特兰使命XIII：击败弗洛里斯|r
    .accept 81838 >>接任务: |cRXP_WARN_辛特兰使命XIV：击败末日枭兽|r
    .accept 81839 >>接任务: |cRXP_WARN_辛特兰使命XV：击败加摩拉伽|r
    .goto The Hinterlands,61.4,34.6
    .target Field Captain Korlian
    .maxlevel 53
step
    .goto The Hinterlands,61.4,34.6 
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官阿兰德拉|r交谈
    .vendor >>|cRXP_BUY_最多可购买5|r|T236885:0|t[特效治疗药水]|cRXP_BUY_, 如需购买, 请向她购买. |r|cRXP_WARN_这些药水只能在入侵区域中使用|r
    .target Quartermaster Alandra
    .maxlevel 53
step
    #completewith next
    +|cRXP_WARN_点击任务发布者旁边的传送门|r, 进入翡翠梦境
step
    .goto 1425/0,-3788.100,468.800,20 >>前往潜伏岩. |cRXP_WARN_避免碰到|cRXP_ENEMY_不稳定的小精灵|r, 否则它们会爆炸并对你造成约700点伤害|r
    .maxlevel 53
step
    #sticky
    #label Moonkin
    .goto The Hinterlands,57.9,39.6,0
    >>击杀|cRXP_ENEMY_Fallen Moonkin|rinside Skulk Rock
    .complete 81786,1 --Fallen Moonkin slain (20)
    .mob Fallen Moonkin
    .maxlevel 53
step
    >>进入洞穴, 清理右侧通往高处的坡道. 在那儿的宝箱中获取 |T133247:0|t[|cRXP_PICK_月神遗物|r]
    .goto 1425/0,-3799.300,354.700
    .complete 81830,1 --|Elunar Relic: 1/1 
    .maxlevel 53
step
    .solo
    >>前往洞穴底部的大房间, 与|cRXP_FRIENDLY_Dreamwarden Valori|r交谈, 以获取他的|T134939:0|t[|cRXP_LOOT_情报报告|r]
    >>|cRXP_WARN_他正潜行在|r|cRXP_ENEMY_Doomkin|r|cRXP_WARN_首领附近. 尽快获取情报后撤离, 不要与首领正面交战|r
    >>|cRXP_WARN_你很可能在完成此任务时死亡, 因为|r|cRXP_ENEMY_Doomkins|r|cRXP_WARN_高额伤害, 但返回路程非常短|r
    .goto 1425/0,-3756.200,357.000
    .complete 81820,1 --|Intelligence Report: Skulk Rock: 1/1
    .target Dreamwarden Valori
    .skipgossip
    .maxlevel 53
step
    #sticky
    #label groupSkulk
    .group 3
    >>前往洞穴底部的大房间, 与|cRXP_FRIENDLY_Dreamwarden Valori|r交谈, 以获取他的|T134939:0|t[|cRXP_LOOT_情报报告|r]
    >>|cRXP_WARN_他就在|r|cRXP_ENEMY_末日魔人|r|cRXP_WARN_首领附近潜行. |r
    .goto 1425/0,-3756.200,357.000
    .complete 81820,1 --|Intelligence Report: Skulk Rock: 1/1
    .target Dreamwarden Valori
    .skipgossip
    .maxlevel 53
step
    .group 3
    .goto The Hinterlands,56.6,44.6
    >>在洞穴底部的大房间中击杀|cRXP_ENEMY_Doomkin|r首领 
    >>|cRXP_WARN_注意, 当他施放|r|T136096:0|t[回春之触]|cRXP_WARN_和|r|T136006:0|t[愤怒]|cRXP_WARN_时会造成高额伤害并具有范围效果|r|T136183:0|t[恐惧]
    .complete 81838,1 --Defeat Doomkin
    .mob Doomkin
    .isOnQuest 81838
    .maxlevel 53
step
    #requires Moonkin
    #requires groupSkulk
    .goto The Hinterlands,53.58,39.10
    .gossipoption 122141 >>与躺在地上的|cRXP_FRIENDLY_Ealianar Shadowdrinker|r交谈. 他会开始跟随你
    >>|cRXP_WARN_你可以通过木栅栏背面与他对话, 而无需进入区域|r
    >>|cRXP_WARN_如果他不在那里, 说明有人正在护送他, 如果你找不到他, 就跳过这一步|r
    .target Ealianar Shadowdrinker
    .maxlevel 53
step
    #sticky
    #label Dragonkin
    .goto The Hinterlands,46.7,39.9,0
    >>击杀废墟中的|cRXP_ENEMY_Wrath Whelps|r和|cRXP_ENEMY_Wyrmkin Starhunters|r
    >>|cRXP_WARN_请注意, |r |cRXP_ENEMY_Wyrmkin Starhunters|r |cRXP_WARN_是精英敌人, 并会施放|r |T135812:0|t[火球术] |cRXP_WARN_, 造成超过500点伤害. 如果你无法单人击败他们, 请跳过此任务|r
    .complete 81788,1 --Wrath Whelp Slain (10)
    .complete 81788,2 --Wyrmkin Starhunter SLain (3)
    .mob Wrath Whelp
    .mob Wyrmkin Starhunter
    .maxlevel 53
step
    #completewith next
    +|cRXP_WARN_请注意, 如果你死亡, 所有跟随你的护送NPC将返回至接任务时的位置, 你需要重新找到他们|r
    >>|cRXP_WARN_护送NPC在接取后15分钟内若未完成任务将自动停止跟随, 请尽快完成！|r
    .maxlevel 53
step
    .goto The Hinterlands,46.85,41.17
    >>与标记位置潜行的|cRXP_FRIENDLY_梦境守护者拉尼娜尔(Dreamwarden Laninar)|r交谈, 以获得[情报报告]
    .complete 81789,1 --|Intelligence Report: Agol'watha: 1/1
    .target Dreamwarden Laninar
    .skipgossip
    .maxlevel 53
step
    >>从帐篷内拾取 |T236997:0|t[|cRXP_PICK_星之眷顾龙蛋|r]
    >>|cRXP_WARN_尽量沿着城墙外围行动, 以避免引怪到该区域的任何精英龙人. 你可以从帐篷后方拾取蛋, 而无需与任何精英战斗|r
    .goto 1425/0,-3320.800,474.500
    .complete 81826,1 --|Star-Touched Dragonegg: 1/1
    .maxlevel 53
step
    .group 3
    .goto The Hinterlands,46.0,39.8
    >>杀死在废墟上空飞行的绿龙|cRXP_ENEMY_Florius|r
    >>|cRXP_WARN_请注意, 他拥有庞大的生命值, 对自然系法术免疫, 并且具有|r|T132338:0|t[劈砍]|cRXP_WARN_和|r|T134307:0|t[尾扫]|cRXP_WARN_以及|r|T135745:0|t[召唤]|cRXP_WARN_技能. 此外, 他还召唤了一只会从正面喷吐火焰的巨龙|r|cRXP_ENEMY_Drake|r|cRXP_WARN_, 造成巨大伤害|r
    .complete 81837,1 --Defeat Florius
    .mob Florius
    .isOnQuest 81837
    .maxlevel 53
step
    #requires Dragonkin
    .goto The Hinterlands,42.31,31.43
    .goto The Hinterlands,60.67,38.32,150 >>向西进入山区, 直到屏幕开始呈现绿色光芒, 你将被传送至更靠近起始位置的位置
    >>|cRXP_WARN_别担心, 所有护送任务的NPC最终都会跟上你|r
    .maxlevel 53
step
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
    >>在完成其他目标时击杀|cRXP_ENEMY_Dreamwater 钳颚|r
    .complete 81787,1 --Dreamwater Vicejaw slain (20)
    .mob Dreamwater Vicejaw
    .maxlevel 53
step
    .goto The Hinterlands,57.30,42.95
    .gossipoption 122151 >>爬上山顶, 与躺在地上的|cRXP_FRIENDLY_Veanna Cloudsleeper|r交谈. 她会开始跟随你
    >>|cRXP_WARN_如果她不在那里, 说明有人正在护送她, 如果你找不到她, 就跳过这一步|r
    .target Veanna Cloudsleeper
    .maxlevel 53
step
    .goto The Hinterlands,71.09,48.14
    .gossipoption 122149 >>进入小型木制堡垒. 与躺在地上的 |cRXP_FRIENDLY_Serlina Starbright|r 交谈, 她会开始跟随你
    >>|cRXP_WARN_如果她不在那里, 说明有人正在护送她, 如果你找不到她, 就跳过这一步|r
    .target Serlina Starbright
    .maxlevel 53
step
    >>进入沙奥瓦萨废墟, 拾取 |T237371:0|t[|cRXP_PICK_梦珍珠|r]. |cRXP_WARN_注意不要激怒首领|r|cRXP_ENEMY_加穆拉贾|r
    .goto 1425/0,-4355.400,79.400
    .complete 81832,1 --|Dreampearl: 1/1
    .maxlevel 53
step
    .group 3
    .goto The Hinterlands,72.7,54.2
    >>击杀|cRXP_ENEMY_Ghamoo-Raja|r
    >>|cRXP_WARN_请注意, 她施放的技能|r|T136231:0|t[穿刺护甲]|cRXP_WARN_和|r|T132270:0|t[三重撕咬]|cRXP_WARN_是一种快速连续攻击, 会对你造成三次伤害. |r|T132270:0|t[三重撕咬]|cRXP_WARN_同样可以远程发动攻击|r
    .complete 81839,1 --Defeat Ghamoo-Raja
    .isOnQuest 81839
    .maxlevel 53
step
    >>与潜行于标记位置的|cRXP_FRIENDLY_梦境守护者萨纳塞尔|r交谈, 以获得|T134939:0|t[|cRXP_LOOT_情报报告|r]
    .goto 1425/0,-4389.800,81.400
    .complete 81817,1 --|Intelligence Report: Shaol'watha: 1/1
    .target Dreamwarden Sanathel
    .skipgossip
    .maxlevel 53
step
    .goto The Hinterlands,77.13,54.35
    .goto The Hinterlands,60.67,38.32,150 >>向东走, 直到屏幕开始变绿. 你将被传送到更靠近起始位置的地方
    >>|cRXP_WARN_别担心, 所有护送任务的NPC最终都会跟上你|r
    .maxlevel 53
step
    #requires Turtles
    .goto 1425/0,-4010.800,758.000
    >>确保你已获得所有护送任务的奖励. 当你到达大梦之门时, 这些任务都应该已完成
    >>|cRXP_WARN_如果三个NPC中的任何一个不再跟随你, 请返回并再次与他们交谈|r
    >>|cRXP_WARN_请在箭头所指的标记位置(传送门坡道底部)来回走动几次. 这样会让NPC穿过阈值区域, 从而给予你任务奖励|r
    .complete 81850,1
    .complete 81851,1
    .complete 81852,1
    .maxlevel 53
step
    .goto The Hinterlands,61.35,34.58,5 >>通过传送门返回辛特兰
    .maxlevel 53
step
    >>与|cRXP_FRIENDLY_铁血队长科尔里安|r交谈
    .goto The Hinterlands,61.4,34.6
    .turnin 82068 >>交任务: |cRXP_FRIENDLY_抗击梦魇进犯|r
    .turnin 81786 >>交任务: |cRXP_FRIENDLY_辛特兰使命I：击败枭兽|r
    .turnin 81787 >>交任务: |cRXP_FRIENDLY_辛特兰使命II：击败巨龟|r
    .turnin 81788 >>交任务: |cRXP_FRIENDLY_辛特兰使命III：击败龙类|r
    .turnin 81789 >>交任务: |cRXP_FRIENDLY_辛特兰使命IV：巨龙情报|r
    .turnin 81817 >>交任务: |cRXP_FRIENDLY_辛特兰使命V：巨龟情报|r
    .turnin 81820 >>交任务: |cRXP_FRIENDLY_辛特兰使命VI：枭兽情报|r
    .turnin 81826 >>交任务: |cRXP_FRIENDLY_辛特兰使命VII：取回星触龙蛋|r
    .turnin 81830 >>交任务: |cRXP_FRIENDLY_辛特兰使命VIII：取回艾露纳圣物|r
    .turnin 81832 >>交任务: |cRXP_FRIENDLY_辛特兰使命IX：取回梦境珍珠|r
    .turnin 81850 >>交任务: |cRXP_FRIENDLY_辛特兰使命XVI：营救伊利阿纳尔·啜影者|r
    .turnin 81851 >>交任务: |cRXP_FRIENDLY_辛特兰使命XVII：营救瑟丽娜·星辉|r
    .turnin 81852 >>交任务: |cRXP_FRIENDLY_辛特兰使命XVIII：营救维阿娜·云梦|r
    .target Field Captain Korlian
    .maxlevel 53
step
    #optional
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁卫队长科里安|r交谈
    .turnin -81837 >>交任务: |cRXP_FRIENDLY_辛特兰使命XIII：击败弗洛里斯|r
    .turnin -81838 >>交任务: |cRXP_FRIENDLY_辛特兰使命XIV：击败末日枭兽|r
    .turnin -81839 >>交任务: |cRXP_FRIENDLY_辛特兰使命XV：击败加摩拉伽|r
    .goto The Hinterlands,61.4,34.6
    .target Field Captain Korlian
    .maxlevel 53

step
    #optional
    +|cRXP_WARN_你已超出所有入侵区域的等级限制, 将无法再接受其中任何常规任务|r
    >>如果你想提升与|r|cRXP_FRIENDLY_Emerald 守卫者|r的声望, 可以在菲拉斯地区完成无限重复的任务, 提交10个以下任意一种物品:|T134186:0|t[|cRXP_LOOT_Moonroot|r]和|T133594:0|t[|cRXP_LOOT_Greater Moonstones|r] 或 |T134312:0|t[|cRXP_LOOT_Moon Dragon Scales|r]
    >>这些任务不提供经验值或金币, 每次提交可获得100点声望. 请根据需要从拍卖行购买尽可能多的性价比最高的材料, 然后前往菲拉斯提交任务
    .xp <53,1
step
    #optional
    +你已完成此噩梦入侵循环. 任务将在每日重置后再次可用. |cRXP_WARN_请选择列表中的其他指南继续|r
    ]])

RXPGuides.RegisterGuide([[
#classic
#season 2
#group RestedXP 梦魇入侵日常任务
#name (50-53) 菲拉斯 梦魇入侵
#displayname (50-53) 菲拉斯 梦魇入侵 \n|cffff559a狮|r|cfff049b9心|r|cffde49d6-|r|cffc349eb北|r|cffb153f0美|r|cff9967f5刘|r|cff827bf7嘉|r|cff6a90f9玲|r|cff54a4fb·|r|cff3abdfc汉|r|cff27cefc化|r|cff14e0fd版|r

step
    #ah
    >>在前往荒野之地之前, 请先从拍卖行购买10个|T134186:0|t[|cRXP_LOOT_月根|r]和|T133594:0|t[|cRXP_LOOT_大月石|r]和|T134312:0|t[|cRXP_LOOT_月亮龙鳞|r]
    >>|cRXP_WARN_如果附近没有拍卖行, 或者价格不划算, 可以跳过此步骤. 这三个任务合计可获得38,250点经验值和300点声望|r
    .maxlevel 53
    .collect 219514,10 --Moonroot
    .collect 219517,10 --Moondragon Scale
    .collect 219515,10 --Greater Moonstone
step
    #completewith next
    .zone Feralas >>前往: |cRXP_PICK_菲拉斯|r
    .maxlevel 53
step
    .goto Feralas,48.0,13.2,50 >>前往菲拉斯西北部的翡翠梦境传送门区域
    .maxlevel 53
step
    .goto Feralas,48.6,12.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官瓦尔丹|r交谈
    .collect 221480,1 << Mage --Spell Notes: 熔岩护甲
    .collect 221481,1 << Priest --Nihilist Epiphany
    .collect 221482,1 << Warlock --Rune of Affliciton
    .collect 221483,1 << Shaman --Rune of Burn
    .collect 221511,1 << Warrior --Rune of the Protector
    .collect 221512,1 << Rogue --Rune of Alclarity
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
    .target Quartermaster Valdane
    .maxlevel 53
step
    #completewith next
    .train 431705 >>|cRXP_WARN_使用|r |T135791:0|t[|cRXP_FRIENDLY_无政府主义顿悟|r] |cRXP_WARN_进行训练|r |T132886:0|t[虚空地带] << Priest
    .train 429308 >>|cRXP_WARN_使用|r|T134939:0|t[|cRXP_FRIENDLY_法术说明:熔岩护甲|r]|cRXP_WARN_来训练|r|T132221:0|t[熔岩护甲] << Mage
    .train 431747 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_痛苦符文|r]|cRXP_WARN_来训练|r|T136228:0|t[不稳定痛苦] << Warlock
    .train 416066 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_燃烧符文|r]|cRXP_WARN_进行训练|r|T135822:0|t[燃烧] << Shaman
    .train 432297 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_阿尔克拉里塔符文|r]|cRXP_WARN_来训练|r|T236269:0|t[直截了当] << Rogue
    .train 431611 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_爆炸符文|r]|cRXP_WARN_来训练|r|T133713:0|t[T.N.T.] << Hunter
    .train 431447 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_鲜血符文|r]|cRXP_WARN_来训练|r|T304501:0|t[戈尔] << Druid
    .train 429261 >>|cRXP_WARN_使用|r|T134419:0|t[|cRXP_FRIENDLY_锤之符文|r]|cRXP_WARN_来训练|r|T236262:0|t[增强版怒锤] << Paladin
    .use 221480 << Mage -- Spell Notes: 熔岩护甲
    .use 221481 << Priest --Nihilist Epiphany
    .use 221482 << Warlock --Rune of Affliciton
    .use 221483 << Shaman --Rune of Burn
    .use 221512 << Rogue --Rune of Alclarity
    .use 221515 << Hunter --Rune of Detonation
    .use 221517 << Druid --Rune of Bloodshed
    .use 223288,1 << Paladin --Rune of the Hammer
    .train 431705,1 << Priest
    .train 429308,1 << Mage
    .train 431747,1 << Warlock
    .train 416066,1 << Shaman
    .train 432297,1 << Rogue
    .train 431611,1 << Hunter
    .train 431447,1 << Druid
    .train 429261,1 << Paladin
    .train 427080,1 << Warrior
    .maxlevel 53
step 
    #season 2
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿伦内尔|r交谈
    .accept 81865 >>接任务: |cRXP_WARN_菲拉斯使命X：月之根|r
    .accept 81866 >>接任务: |cRXP_WARN_菲拉斯使命XI：强效月亮石|r
    .accept 81867 >>接任务: |cRXP_WARN_菲拉斯使命XII：强效月龙之鳞|r
    .itemcount 219514,10 --Moonroot
    .itemcount 219517,10 --Moondragon Scale
    .itemcount 219515,10 --Greater Moonstone
    .target Field Captain Arunnel
    .maxlevel 53
step 
    #season 2
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿伦内尔|r交谈
    .accept 81865 >>接任务: |cRXP_WARN_菲拉斯使命X：月之根|r
    .itemcount 219514,10 --Moonroot
    .target Field Captain Arunnel
    .maxlevel 53
step 
    #season 2
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿伦内尔|r交谈
    .accept 81866 >>接任务: |cRXP_WARN_菲拉斯使命XI：强效月亮石|r
    .itemcount 219515,10 --Greater Moonstone
    .target Field Captain Arunnel
    .maxlevel 53
step 
    #season 2
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿伦内尔|r交谈
    .accept 81867 >>接任务: |cRXP_WARN_菲拉斯使命XII：强效月龙之鳞|r
    .itemcount 219517,10 --Moondragon Scale
    .target Field Captain Arunnel
    .maxlevel 53
step 
    #season 2
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿伦内尔|r交谈
    .turnin -81865 >>交任务: |cRXP_FRIENDLY_菲拉斯使命X：月之根|r
    .turnin -81866 >>交任务: |cRXP_FRIENDLY_菲拉斯使命XI：强效月亮石|r
    .turnin -81867 >>交任务: |cRXP_FRIENDLY_菲拉斯使命XII：强效月龙之鳞|r
    .target Field Captain Arunnel
    .maxlevel 53
step 
    #season 2
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿伦内尔|r交谈
    .accept 81855 >>接任务: |cRXP_WARN_菲拉斯使命I：击败塞纳留斯之子|r
    .accept 81856 >>接任务: |cRXP_WARN_菲拉斯使命II：击败鹰身人|r
    .accept 81857 >>接任务: |cRXP_WARN_菲拉斯使命III：击败龙类|r
    .accept 81858 >>接任务: |cRXP_WARN_菲拉斯使命IV：巨龙情报|r
    .accept 81859 >>接任务: |cRXP_WARN_菲拉斯使命V：塞纳里奥情报|r
    .accept 81860 >>接任务: |cRXP_WARN_菲拉斯使命VI：鹰身人情报|r
    .accept 81861 >>接任务: |cRXP_WARN_菲拉斯使命VII：取回月光龙蛋|r
    .accept 81863 >>接任务: |cRXP_WARN_菲拉斯使命VIII：取回守护者的笔记|r
    .accept 81864 >>接任务: |cRXP_WARN_菲拉斯使命IX：取回鹰身人长文|r
    .accept 81872 >>接任务: |cRXP_WARN_菲拉斯使命XVI：营救梅里阿斯·护地者|r
    .accept 81873 >>接任务: |cRXP_WARN_菲拉斯使命XVII：营救奈勒内·溪吟|r
    .accept 81874 >>接任务: |cRXP_WARN_菲拉斯使命XVIII：营救贾姆尼斯·愈树者|r
    .accept 82068 >>接任务: |cRXP_WARN_抗击梦魇进犯|r
    .target Field Captain Arunnel
    .maxlevel 53
step
    #optional
    .group 3
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿伦内尔|r交谈
    >>|cRXP_WARN_如果你在组队, 也可以考虑接取精英击杀任务. 这些任务需要你击杀的首领拥有大量生命值, 根据你的队伍情况可能会具有一定的挑战性|r
    .accept 81868 >>接任务: |cRXP_WARN_菲拉斯使命XIII：击败泰兰尼库斯|r
    .accept 81870 >>接任务: |cRXP_WARN_菲拉斯使命XIV：击败阿隆迪乌斯|r
    .accept 81871 >>接任务: |cRXP_WARN_菲拉斯使命XV：击败斯蕾娜|r
    .target Field Captain Arunnel
    .maxlevel 53
step 
    #season 2
    #completewith IncursionsComplete3
    .goto Feralas,50.95,11.67,30,0
    .goto Feralas,51.28,10.64,20 >>进入|cRXP_PICK_梦境之门|r
    >>|cRXP_WARN_直接跑过|cRXP_ENEMY_Satyr's|r和|cRXP_ENEMY_地狱巨犬|r和 |cRXP_ENEMY_Imps|r. 当你进入传送门时, 它们会失去仇恨|r
    .aura 444762
    .maxlevel 53
step 
    #season 2 
    #completewith DreamWardenGorlas
    >>击杀|cRXP_ENEMY_Frenzied 嗜血幼龙|r和|cRXP_ENEMY_Wyrmkin 狂暴者|r
    >>|cRXP_WARN_小心. |r|cRXP_ENEMY_Wyrmkin Berserkers|r|cRXP_WARN_是精英敌人, 单独应对可能会比较困难|r
    .complete 81857,1 --Frenzied Whelp slain 10/10
    .mob +Frenzied Whelp
    .complete 81857,2 --Wyrmkin Berserker slain 10/10
    .mob +Wyrmkin Berserker
    .maxlevel 53
step 
    #season 2
    .goto Feralas,49.64,15.44
    .gossipoption 122147 >>与|cRXP_FRIENDLY_Mellias Earthtender|r交谈. 她应该会开始跟随你
    .target Mellias Earthtender
    .isOnQuest 81872
    .maxlevel 53
step
    #completewith next
    +|cRXP_WARN_请注意, 如果你死亡, 所有跟随你的护送NPC将返回至接任务时的位置, 你需要重新找到他们|r
    >>|cRXP_WARN_护送NPC在接取后15分钟内若未完成任务将自动停止跟随, 请尽快完成！|r
    .maxlevel 53
step 
    #season 2
    .goto Feralas,50.71,17.17
    >>在地面上拾取|cRXP_LOOT_月色酒龙蛋|r的战利品
    .complete 81861,1 --Moonglow Dragonegg: 1/1
    .maxlevel 53
step
    #optional
    .group 3
    .goto Feralas,53.2,16.6
    >>击杀首领巨龙|cRXP_ENEMY_Tyrannikus|r
    >>|cRXP_WARN_请注意, 他拥有庞大的生命值, 对自然系法术免疫, 并且具有|r|T132338:0|t[劈砍]|cRXP_WARN_和|r|T134307:0|t[尾扫]|cRXP_WARN_以及|r|T135745:0|t[召唤]|cRXP_WARN_技能. 此外, 他还召唤了一只会从正面喷吐火焰的巨龙|r|cRXP_ENEMY_Drake|r|cRXP_WARN_, 造成巨大伤害|r
    .complete 81868,1 --Tyrannikus slain
    .mob Tyrannikus
    .maxlevel 53
step 
    #season 2
    .goto Feralas,50.73,19.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦守者谢尔德林|r交谈
    .complete 81858,1 --Intelligence Report: Oneiros: 1/1
    .target Dreamwarden Sheldryn
    .skipgossip
    .maxlevel 53
step
    .solo
    #completewith RuinsofRav
    #season 2
    +|cRXP_WARN_小心|r|cRXP_WARN_阿隆德里乌斯|r|cRXP_WARN_, 一个在道路上巡逻的精英首领. 尽量避开他|r
    .unitscan Alondrius
    .maxlevel 53
step
    .group 3
    #completewith RuinsofRav
    #season 2
    #label Alondrius
    .goto Feralas,46.8,19.6
    .line Feralas,47.6,25.5,48.1,24.2,48.0,23.0,46.9,22.2,46.2,20.9,46.3,18.1,46.3,16.2,46.1,14.1
    >>|cRXP_WARN_寻找|r|cRXP_WARN_阿隆德里乌斯|r|cRXP_WARN_, 一名在道路上巡逻的精英首领. 击杀他|r
    .complete 81870,1 --Alondrius Slain
    .unitscan Alondrius
    .maxlevel 53
step 
    #season 2
    #label DreamWardenGorlas
    .goto Feralas,47.14,21.63
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦守护者戈拉斯|r交谈
    .complete 81859,1 --Intelligence Report: Twin Colossals: 1/1
    .target Dreamwarden Gorlas
    .skipgossip
    .maxlevel 53
step 
    #season 2
    #completewith RuinsofRav
    #requires Alondrius
    >>击杀|cRXP_ENEMY_Lost Daughters|r和|cRXP_ENEMY_Vengeful Sons|r
    .complete 81855,1 --Lost Daughter slain 10/10
    .mob +Lost Daughter
    .complete 81855,2 --Vengeful Son slain 10/10
    .mob +Vengeful Son
    .maxlevel 53
step 
    #season 2
    #requires Alondrius
    .goto Feralas,46.63,18.94
    >>在地面上拾取|cRXP_LOOT_Mad Keeper's Notes|r
    .complete 81863,1 --Mad Keeper's Notes: 1/1
    .maxlevel 53
step 
    #season 2
    .goto Feralas,45.81,16.47
    .gossipoption 122148 >>与|cRXP_FRIENDLY_妮瑞娜·布鲁克辛格|r交谈. 她应该会开始跟随你
    .target Nerene Brooksinger
    .skipgossip
    .isOnQuest 81873
    .maxlevel 53
step 
    #season 2
    #label RuinsofRav
    .goto Feralas,41.94,12.93
    .subzone 1114 >>前往鸦风城废墟
    .maxlevel 53
step 
    #season 2
    #completewith IncursionsComplete3
    >>击杀 |cRXP_ENEMY_Dreamspring 梦泉潜行者|r 和 |cRXP_ENEMY_Dreamspring 梦泉风暴召唤者|r
    .complete 81856,1 --Dreamspring Roguefeather 10/10
    .mob +Dreamspring Roguefeather
    .complete 81856,2 --Dreamspring Stormcaller 10/10
    .mob +Dreamspring Stormcaller
    .maxlevel 53
step 
    #season 2
    .goto Feralas,38.94,13.13
    >>在地面上掠夺|cRXP_LOOT_Harpy Screed|r
    >>|cRXP_WARN_这会立即被掠夺. |r|cRXP_ENEMY_Slirena|r|cRXP_WARN_可能会攻击你, 请确保有逃生路线|r
    .complete 81864,1 --Harpy Screed: 1/1
    .maxlevel 53
step
    #optional
    .group 3
    .goto Feralas,39.6,13.8
    >>击杀哈皮首领|cRXP_ENEMY_Slirena|r
    >>|cRXP_WARN_注意她施放的技能:|T136015:0|t[链闪电]和|T136018:0|t[缠绕之风]|cRXP_WARN_a 一个持续10秒的旋风, 以及|r|T132104:0|t[酸雨]|cRXP_WARN_a 一个圆形区域, 如果你不及时离开, 将会受到伤害|r
    .complete 81871,1 --Slirena slain
    .mob Slirena
    .maxlevel 53
step 
    #season 2
    .goto Feralas,37.71,12.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_梦境守护者安德拉尔|r交谈
    .complete 81860,1 --Intelligence Report: Ruins of Ravenwind: 1/1
    .target Dreamwarden Anadelle
    .skipgossip
    .maxlevel 53
step 
    #season 2
    #label IncursionsComplete3
    .goto Feralas,40.58,8.09
    .gossipoption 122145 >>与|cRXP_FRIENDLY_贾尼斯·特里梅德|r交谈. 她应该会开始跟随你
    .target Jamniss Treemender
    .isOnQuest 81874
    .maxlevel 53
step 
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
    >>击杀 |cRXP_ENEMY_Dreamspring 梦泉潜行者|r 和 |cRXP_ENEMY_Dreamspring 梦泉风暴召唤者|r
    .complete 81856,1 --Dreamspring Roguefeather 10/10
    .mob +Dreamspring Roguefeather
    .complete 81856,2 --Dreamspring Stormcaller 10/10
    .mob +Dreamspring Stormcaller
    .maxlevel 53
step 
    #season 2
    #loop
    .goto Feralas,46.44,15.89,0
    .goto Feralas,45.36,22.36,0
    .goto Feralas,44.45,12.29,50,0
    .goto Feralas,46.44,15.89,50,0
    .goto Feralas,46.35,18.82,50,0
    .goto Feralas,45.36,22.36,50,0
    .goto Feralas,45.55,19.10,50,0
    >>击杀|cRXP_ENEMY_Lost Daughters|r和|cRXP_ENEMY_Vengeful Sons|r
    .complete 81855,1 --Lost Daughter slain 10/10
    .mob +Lost Daughter
    .complete 81855,2 --Vengeful Son slain 10/10
    .mob +Vengeful Son
    .maxlevel 53
step 
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
    >>击杀|cRXP_ENEMY_Frenzied 嗜血幼龙|r和|cRXP_ENEMY_Wyrmkin 狂暴者|r
    >>|cRXP_WARN_小心. |r|cRXP_ENEMY_Wyrmkin Berserkers|r|cRXP_WARN_是精英敌人, 单独应对可能会比较困难|r
    .complete 81857,1 --Frenzied Whelp slain 10/10
    .mob +Frenzied Whelp
    .complete 81857,2 --Wyrmkin Berserker slain 10/10
    .mob +Wyrmkin Berserker
    .maxlevel 53
step 
    #season 2
    .goto Feralas,51.00,11.69
    >>前往|cRXP_PICK_梦境之门|r
    >>|cRXP_WARN_如果|cRXP_FRIENDLY_Mellias|r和|cRXP_FRIENDLY_Nerene|r或|cRXP_FRIENDLY_Jamniss|r不再跟随你, 请返回并再次与他们交谈|r
    >>|cRXP_WARN_请在箭头所指的标记位置(传送门坡道底部)来回走动几次. 这样会让NPC穿过阈值区域, 从而给予你任务奖励|r
    .complete 81872,1 --Rescue Mellias Earthtender: 1/1
    .goto Feralas,49.64,15.44,0
    .target +Mellias Earthtender
    .complete 81873,1 --Rescue Nerene Brooksinger: 1/1
    .goto Feralas,45.81,16.47,0
    .target +Nerene Brooksinger
    .complete 81874,1 --Rescue Jamniss Treemender: 1/1
    .goto Feralas,40.58,8.09,0
    .target
    .target +Jamniss Treemender
    .maxlevel 53
step 
    #season 2
    #completewith next
    .goto Feralas,50.95,11.67,30,0
    .goto Feralas,51.28,10.64,20 >>退出|cRXP_PICK_Emerald 梦境之门|r
    .aura -444762
    .maxlevel 53
step 
    #season 2
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿伦内尔|r交谈
    .turnin 81855 >>交任务: |cRXP_FRIENDLY_菲拉斯使命I：击败塞纳留斯之子|r
    .turnin 81856 >>交任务: |cRXP_FRIENDLY_菲拉斯使命II：击败鹰身人|r
    .turnin 81857 >>交任务: |cRXP_FRIENDLY_菲拉斯使命III：击败龙类|r
    .turnin 81858 >>交任务: |cRXP_FRIENDLY_菲拉斯使命IV：巨龙情报|r
    .turnin 81859 >>交任务: |cRXP_FRIENDLY_菲拉斯使命V：塞纳里奥情报|r
    .turnin 81860 >>交任务: |cRXP_FRIENDLY_菲拉斯使命VI：鹰身人情报|r
    .turnin 81861 >>交任务: |cRXP_FRIENDLY_菲拉斯使命VII：取回月光龙蛋|r
    .turnin 81863 >>交任务: |cRXP_FRIENDLY_菲拉斯使命VIII：取回守护者的笔记|r
    .turnin 81864 >>交任务: |cRXP_FRIENDLY_菲拉斯使命IX：取回鹰身人长文|r
    .turnin 81872 >>交任务: |cRXP_FRIENDLY_菲拉斯使命XVI：营救梅里阿斯·护地者|r
    .turnin 81873 >>交任务: |cRXP_FRIENDLY_菲拉斯使命XVII：营救奈勒内·溪吟|r
    .turnin 81874 >>交任务: |cRXP_FRIENDLY_菲拉斯使命XVIII：营救贾姆尼斯·愈树者|r
    .turnin 82068 >>交任务: |cRXP_FRIENDLY_抗击梦魇进犯|r
    .target Field Captain Arunnel
    .maxlevel 53
step
    #optional
    .goto Feralas,48.49,12.44
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_指挥官阿伦内尔|r交谈
    >>|cRXP_WARN_如果你在组队, 也可以考虑接取精英击杀任务. 这些任务需要你击杀的首领拥有大量生命值, 根据你的队伍情况可能会具有一定的挑战性|r
    .turnin -81868 >>交任务: |cRXP_FRIENDLY_菲拉斯使命XIII：击败泰兰尼库斯|r
    .turnin -81870 >>交任务: |cRXP_FRIENDLY_菲拉斯使命XIV：击败阿隆迪乌斯|r
    .turnin -81871 >>交任务: |cRXP_FRIENDLY_菲拉斯使命XV：击败斯蕾娜|r
    .target Field Captain Arunnel
    .maxlevel 53
step
    #optional
    +|cRXP_WARN_你已超出所有入侵区域的等级限制, 将无法再接受其中任何常规任务|r
    >>如果你想提升与|r|cRXP_FRIENDLY_Emerald 守卫者|r的声望, 可以在菲拉斯地区完成无限重复的任务, 提交10个以下任意一种物品:|T134186:0|t[|cRXP_LOOT_Moonroot|r]和|T133594:0|t[|cRXP_LOOT_Greater Moonstones|r] 或 |T134312:0|t[|cRXP_LOOT_Moon Dragon Scales|r]
    >>这些任务不提供经验值或金币, 每次提交可获得100点声望. 请根据需要从拍卖行购买尽可能多的性价比最高的材料, 然后前往菲拉斯提交任务
    .xp <53,1
step
    #optional
    +你已完成此噩梦入侵循环. 任务将在每日重置后再次可用. |cRXP_WARN_请选择列表中的其他指南继续|r
]])