RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#version 1
#season 2
<< Alliance
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 16-17 Westfall SoD
#next 17-22 Redridge SoD
#defaultfor !NightElf
#displayname 16-17 西部荒野
step << Paladin
    .goto Stormwind City,74.182,7.465 << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_米尔顿·西弗|r交谈 << Alliance
    >>向他购买|T133745:0|t|cRXP_LOOT_[论述：驱魔人]|r，使用它学习|T135956:0|t[驱魔人] << Paladin
    .collect 226400,1 << Paladin
    .train 415076,1 << Paladin
step
    .goto StormwindClassic,58.08,16.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗伦·长须|r交谈
    .turnin 1338 >> 交任务：卡尔·雷矛的订单
    .target 弗伦·长须
step << Priest !NightElf
    #season 2
    .goto StormwindClassic,20.8,50.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_娜拉·梅德隆|r交谈
    .target 娜拉·梅德隆
    .accept 78195 >> 接任务：艾露恩的秘密
step << Human Paladin
    #optional
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin -2998 >> 交任务：圣洁之书
    .accept 1641 >> 接任务：圣洁之书
    .turnin 1641 >> 交任务：圣洁之书
    .target 达索瑞恩·拉尔
step << Human Paladin
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .accept 1641 >> 接任务：圣洁之书
    .turnin 1641 >> 交任务：圣洁之书
    .target 达索瑞恩·拉尔
step << Human Paladin
    .goto StormwindClassic,39.80,29.77
    >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_圣洁之书|r] 来开启任务|r
    .accept 1642 >>接受任务圣洁之书
    .use 6775
step << Human Paladin
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1642 >>交任务圣洁之书
    .accept 1643 >>接受任务圣洁之书
    .target 达索瑞恩·拉尔
step << Paladin
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
step << Human Paladin
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯蒂芬妮·特纳|r交谈
    .turnin 1643 >> 交任务：圣洁之书
    .accept 1644 >> 接任务：圣洁之书
    .turnin 1644 >> 交任务：圣洁之书
    .accept 1780 >> 接任务：圣洁之书
    .target 斯蒂芬妮·特纳
step << Human Paladin
    .goto StormwindClassic,40.1,29.9
    >>与|cRXP_FRIENDLY_达索瑞恩·拉尔|r交谈
    .turnin 1780 >>交任务圣洁之书
    .target 达索瑞恩·拉尔
    .accept 1781 >>接受任务圣洁之书
step << Human Paladin
    .goto StormwindClassic,38.7,26.6
    >>与|cRXP_FRIENDLY_贾森·坦诺姆|r交谈
    .turnin 1781 >>交任务圣洁之书
    .target 贾森·坦诺姆
    .accept 1786 >>接受任务圣洁之书
step << Priest !NightElf
    #season 2
    .goto StormwindClassic,20.8,50.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_娜拉·梅德隆|r交谈
    .target 娜拉·梅德隆
    .trainer >> 学习职业技能
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >> 前往已宰的羔羊旅店，然后下楼
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厄苏拉·德林|r交谈
    .trainer >> 学习职业技能
    .target 厄苏拉·德林
step << Warlock
    .goto StormwindClassic,25.7,77.7
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_斯巴克尔|r交谈
    >> |cRXP_BUY_购买|r|T133738:0|t[魔典：吞噬暗影（等级1）]
    .collect 16357,1
    .target 斯巴克尔
    .train 20387,1
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .turnin 1688 >> 交任务：苏伦娜·凯尔东
    .accept 1689 >> 接任务：誓缚
    .target 黑暗缚灵者加科因
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往已宰的羔羊旅店最底层|r
    .cast 7728 >> |cRXP_WARN_使用|r |T133292:0|t[血石颈环] |cRXP_WARN_召唤|r |cRXP_ENEMY_虚空行者|r
    .use 6928
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 6928 >> 击杀 |cRXP_ENEMY_召唤出的虚空行者|r
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
    .mob 虚空行者
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黑暗缚灵者加科因|r交谈
    .target 黑暗缚灵者加科因
    .goto StormwindClassic,25.25,78.59
    .turnin 1689 >> 交任务：誓缚
step << Priest/Mage/Warlock
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与屋内的|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    .vendor 1312 >>|cRXP_BUY_从她那里购买一个|r |T135468:0|t[烟尘魔杖] |cRXP_BUY_，如果你买得起（35银）|r
    >>|cRXP_BUY_或者，如果拍卖行的价格更便宜，也可以从那里购买|r|T135144:0|t[强效魔法杖]|cRXP_BUY_ |r
    .collect 5208,1
    .disablecheckbox
    .target 阿德温·凯伦
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
step << Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_确保也学习|r|T136058:0|t[开锁]|cRXP_WARN_，稍后的盗贼职业任务会用到它|r
    .trainer >> 学习职业技能
    .train 1804 >> 学习 |T136058:0|t[开锁]
    .target 夜行者奥斯伯
step << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >> 进入军情7处总部，沿楼梯上楼前往|cRXP_FRIENDLY_“剃刀”雷吉克|r处
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_“剃刀”雷吉克|r交谈
    .accept 2281 >> 接任务：赤脊山的联络员
    .goto StormwindClassic,75.76,60.35
    .target “剃刀”雷吉克
step << Warrior
    #season 2
    #completewith next
    .gossipoption 109045 >> 与|cRXP_FRIENDLY_丽芙·布拉德弗|r交谈，她在花园区的旅店内
    .goto Stormwind City,22.608,64.621
    .gossipoption 109084 >> 与|cRXP_ENEMY_斯图阿特|r交谈，然后击败他；他的生命值降至0%时会昏倒
    .goto Stormwind City,21.213,62.781
    >>如果|cRXP_ENEMY_斯图阿特|r不在，请等待他刷新
    .skipgossipid 109047
    .skipgossipid 109045
    .skipgossipid 109084
    --.train 425447,1
step << Warrior
    #season 2
    .goto Stormwind City,22.608,64.621
    .use 204716 >> 再次与|cRXP_FRIENDLY_丽芙·布拉德弗|r交谈（击倒|cRXP_ENEMY_斯图阿特|r后），领取|T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r]
    .collect 204716,1
    .train 425447,1 >> |cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_狂乱攻击符文|r] |cRXP_WARN_学习|r |T236317:0|t[狂乱攻击]
    >>|cRXP_WARN_根据你的等级，单人完成此步骤可能很困难；必要时找人帮忙|r
    .skipgossip 203478,1
    .target 丽芙·布拉德弗
    .mob 斯图阿特
step << Hunter
    .goto 1453/0,702.100,-8792.601
    .target 黎娜·斯图瓦
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_黎娜·斯图瓦|r交谈
    >>购买|T135612:0|t[大口径短枪]（7.4点每秒伤害），或到拍卖行寻找更好的升级装备
    .collect 3023,1
    .money <0.3771
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.3
step << !Human/!Mage
    #season 1 << Rogue
    .goto StormwindClassic,57.129,57.698
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_吴平|r交谈
    .train 227 >>学习 [法杖] << Priest/Warlock/Hunter
    .train 201 >>学习单手剑（1h） << Mage/Warlock
    .train 202 >>学习双手剑（2h） << Warrior/Paladin/Hunter
    --.train 5011 >>Train Crossbows << Hunter
    .target 吴平
step << Warrior/Paladin
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    >>购买 |T135353:0|t[普通长剑]（12.6点每秒伤害），或到拍卖行寻找更好的升级装备
    .target 玛尔达·维勒
    .collect 2024,1 --Collect Espadon (1)
    .money <0.6397
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拍卖师亚克森|r交谈
    >>购买|T134437:0|t[抗毒药剂] 用于你稍后的 |T132290:0|t[毒药] 职业任务，其余的留着稍后在赤脊山快速交任务 << !Dwarf Rogue
    >>购买以下物品，以便稍后在赤脊山快速交任务 << !Rogue/Dwarf Rogue
    >>这样可以省去四处找怪击杀的时间。如果不想购买物品，可以跳过此步骤
    >>|T134437:0|t[抗毒药剂] << !Dwarf Rogue
    >>|T134172:0|t[巨型血牙野猪头]
    >>|T134028:0|t[硬秃鹫肉]
    >>|T134321:0|t[香脆蜘蛛肉]
    >>抗毒药剂可通过急救技能，使用一个|T134339:0|t[小毒囊]制作 << Rogue !Dwarf
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 2296,5,92,1 -- Great Goretusk Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target 拍卖师亚克森
step << Mage
    #season 2
    .goto StormwindClassic,55.8,65.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_凯德雷克·布舍尔|r交谈
    >>查看他是否有|T134830:0|t[|cRXP_LOOT_次级治疗药水|r]，如果有货就购买
    .collect 211779,3 >> 向他购买3个|T135933:0|t[|cRXP_LOOT_理解魔符|r]
    .target 凯德雷克·布舍尔
step << Human
    .goto StormwindClassic,66.28,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .turnin 6261 >> 交任务：杜加尔·朗德瑞克
    .accept 6285 >> 接任务：返回西部荒野
    .target 杜加尔·朗德瑞克
    .isQuestTurnedIn 6281
step << !Human/Warlock
    .goto StormwindClassic,66.28,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fp Stormwind >> 获取暴风城飞行点 << !Human
    .fly Redridge >> 飞往赤脊山 << Warlock
    .target 杜加尔·朗德瑞克
step << !Warlock
    .goto Elwynn Forest,32.45,50.16
    .zone Elwynn Forest >> 前往艾尔文森林
    .zoneskip Westfall
    .zoneskip Redridge Mountains
step << Warrior
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_里瑞亚·杜拉克|r 对话
    .trainer >> 学习职业技能
    .target 里瑞亚·杜拉克
step << Paladin
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_威尔海姆修士|r 对话
    .trainer >> 学习职业技能
    .target 威尔海姆修士
step << !Human !Warlock
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_旅店老板法雷|r 对话
    .home >> 将你的炉石设置为闪金镇
    .target 旅店老板法雷
step << Mage
    #optional
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >> 前往旅店二楼
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r 对话
	.target 扎尔迪玛·维夫希尔特
    .goto Elwynn Forest,43.25,66.19
    .trainer >> 学习职业技能
step << !Warlock
    .goto 1429/0,73.800,-9465.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官杜汉|r交谈
    .target 治安官杜汉
    .accept 109 >>接受任务 向格里安·斯托曼报到
step << Human Paladin
    .goto Elwynn Forest,72.7,51.5
    >>把|cRXP_PICK_生命符记|r用在 |cRXP_FRIENDLY_亨兹·法奥克|r 身上
>>与|cRXP_FRIENDLY_亨兹·法奥克|r交谈
    .turnin 1786 >>交任务圣洁之书
.target 亨兹·法奥克
    .accept 1787 >>接受任务圣洁之书
    .use 6866
step << Human Paladin
    .goto Elwynn Forest,73.5,51.3
    >>击杀岛屿周围的 |cRXP_ENEMY_迪菲亚流浪巫师|r
    .complete 1787,1 --Defias Script (1)
    .mob 迪菲亚流浪巫师
step << !Warlock
    #label RedridgeS
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >> 前往赤脊山
step
    .goto Redridge Mountains,17.4,69.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
    .accept 244 >> 接任务：豺狼人的入侵
    .target 卫兵帕克
step
    .goto Redridge Mountains,30.73,59.99
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
    .turnin 244 >> 交任务：豺狼人的入侵
    .accept 246 >> 接任务：审时度势
    .target 菲尔顿副队长
step << !Warlock
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fp Redridge Mountains >> 获取赤脊山飞行点
    .target 艾蕾娜·斯托姆法瑟
step << !Human
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .accept 118 >> 接任务：马掌
step << Human
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fly Westfall >> 飞往西部荒野
    .target 艾蕾娜·斯托姆法瑟
step << Gnome Warlock
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
step << Gnome Warlock
    .goto Elwynn Forest,32.45,50.16
    .zone Elwynn Forest >> 前往艾尔文森林
    .zoneskip Westfall
    .isQuestAvailable 153
step << !Human !Warlock
    #completewith next
    .hs >> 炉石回闪金镇
step << !Human
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
	.target 铁匠阿古斯
    .turnin 118 >> 交任务：马掌
    .accept 119 >> 接任务：回复弗纳
step << !Human
    #completewith next
    .zone Westfall >> 前往西部荒野
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .goto Westfall,56.327,47.520
    .turnin -109 >> 交任务：向格里安·斯托曼报到
    .accept 12 >> 接任务：西部荒野人民军
    .target 格里安·斯托曼
step << Human
    #label Lewis
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_军需官刘易斯|r交谈
    .target 军需官刘易斯
    .goto Westfall,57.00,47.17
    .turnin 6285 >> 交任务：返回西部荒野
    .isOnQuest 6285
step
    .goto Westfall,54.00,53.00
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
    .target 哨兵加里安
    .accept 153 >> 接任务：红色皮质面罩
step << Rogue
    .goto Westfall,52.8,53.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板希瑟尔|r交谈
    .target 旅店老板希瑟尔
    .home >> 将炉石绑定在西部荒野
step
    >>击杀|cRXP_ENEMY_迪菲亚捕兽者|r和|cRXP_ENEMY_迪菲亚走私者|r，拾取其掉落的|cRXP_LOOT_红色皮质面罩|r
    .goto Westfall,48.21,46.70,60,0
    .goto Westfall,46.74,52.87,60,0
    .goto Westfall,50.74,40.07,60,0
    .goto Westfall,46.21,38.26,60,0
    .goto Westfall,41.21,40.75,60,0
    .goto Westfall,44.57,26.09,60,0
    .goto Westfall,48.21,46.70
    .goto Westfall,41.21,40.75,0
    .complete 12,1 -- Defias Trapper slain (15)
    .complete 12,2 -- Defias Smuggler slain (15)
    .complete 153,1 -- Red Leather Bandana (15)
    .mob 迪菲亚捕兽者
    .mob 迪菲亚走私者
step << Mage
    #loop
    .goto 1436,35.043,53.785,0
    .goto 1436,43.045,67.127,0
    .goto 1436,43.459,70.800,0
    .goto 1436,45.458,70.322,0
    .goto 1436,44.547,65.624,0
    .goto 1436,35.043,53.785,40,0
    .goto 1436,35.952,53.085,40,0
    .goto 1436,36.549,54.105,40,0
    .goto 1436,36.025,54.822,40,0
    .goto 1436,38.732,56.872,40,0
    .goto 1436,43.045,67.127,40,0
    .goto 1436,42.825,68.290,40,0
    .goto 1436,42.524,69.212,40,0
    .goto 1436,42.103,69.530,40,0
    .goto 1436,42.240,70.517,40,0
    .goto 1436,43.459,70.800,40,0
    .goto 1436,43.698,69.251,40,0
    .goto 1436,43.798,67.692,40,0
    .goto 1436,44.042,69.247,40,0
    .goto 1436,44.333,68.588,40,0
    .goto 1436,45.458,70.322,40,0
    .goto 1436,45.794,69.292,40,0
    .goto 1436,44.952,67.095,40,0
    .goto 1436,44.547,65.624,40,0
    >>击杀 |cRXP_ENEMY_迪菲亚抢劫者|r，拾取 |T134939:0|t|cRXP_FRIENDLY_[法术笔记：NIZHGAES]|r
    .collect 208754,1 --Spell Notes: TENGI RONEERA (1)
    .mob 迪菲亚抢劫者
    .train 401767,1
step << Mage
    .train 401767 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术笔记：NIZHGAES]|r |cRXP_WARN_学习|r |T133815:0|t[铭刻胸甲：再生]
    .use 208754
    .itemcount 208754,1 --Spell Notes: TENGI RONEERA (1)
step
    .goto Westfall,56.04,31.23
    .target 农夫萨丁
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
    .accept 9 >> 接任务：清理荒野
step
#loop
    .goto Westfall,37.4,50.6,0
    .goto Westfall,44.8,33.6,0
    .goto Westfall,54.0,32.0,0
    .goto Westfall,51.0,22.0,0
    .goto Westfall,53.84,32.00,60,0
    .goto Westfall,50.80,21.76,80,0
    .goto Westfall,44.47,35.35,80,0
    .goto Westfall,53.84,32.00,80,0
    .goto Westfall,50.80,21.76,80,0
    .goto Westfall,44.47,35.35,80,0
    .goto Westfall,53.84,32.00,60,0
    .goto Westfall,44.47,35.35,60,0
    .goto Westfall,50.80,21.76,60,0
    >>击杀|cRXP_ENEMY_看守傀儡|r，拾取其掉落的[|cRXP_LOOT_灯油|r]，留给后续任务使用
    >>可以留在萨丁的田地里；看守傀儡全部被击杀后，会不断刷新
    .complete 9,1 --Harvest Watcher (20)
    .collect 814,5 -- Flask of Oil (5)
    .mob 看守傀儡
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_农夫萨丁|r交谈
	.target 农夫萨丁
    .goto Westfall,56.04,31.23
    .turnin 9 >> 交任务：清理荒野
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_哨兵加里安|r交谈
	.target 哨兵加里安
    .goto Westfall,54.00,53.00
    .turnin 153 >> 交任务：红色皮质面罩
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
	.target 格里安·斯托曼
    .goto Westfall,56.33,47.52
    .turnin 12 >> 交任务：西部荒野人民军
    .accept 65 >> 接任务：迪菲亚兄弟会
step
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Redridge >> 飞往赤脊山
    .target 索尔
]])
RXPGuides.RegisterGuide([[
#groupweight 500
#groupdisplayname RestedXP 经典旧世 1-60（联盟）
#classic
#version 1
#season 2
<< Alliance
#group RestedXP Alliance 1-20
#subgroupdisplayname 1-20 << tbc
#subgroupdisplayname 1-20
#groupid RXP-SRGCE-A1
#name 17-22 Redridge SoD
#next RestedXP Alliance 20-30\22-24 Wetlands SoD
#defaultfor !NightElf
#displayname 17-22 赤脊山
step
    #label BMenace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .goto Redridge Mountains,33.50,48.97
    .accept 20 >> 接任务：黑石氏族的威胁
    .target 治安官马瑞斯
    .xp <18,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
    .goto Redridge Mountains,32.13,48.63
    .accept 125 >> 接任务：丢失的工具
    .target 工头奥斯洛
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target 弗纳·奥斯古
    .goto Redridge Mountains,30.97,47.27
    .accept 118 >> 接任务：马掌
step
#optional
    .goto Redridge Mountains,30.97,47.27
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target 弗纳·奥斯古
    .turnin 119 >> 交任务：回复弗纳
    .isOnQuest 119
step
#optional
    .goto Redridge Mountains,30.97,47.27
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target 弗纳·奥斯古
    .accept 124 >> 接任务：豺狼人的乱吠
    .accept 122 >> 接任务：雏龙的鳞片
    .isQuestTurnedIn 119
step
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_所罗门镇长|r交谈
	.target 所罗门镇长
    .accept 120 >> 接任务：送往暴风城的信
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
	.target 码头管理员巴伦
    .goto Redridge Mountains,27.70,47.40
    .accept 127 >> 接任务：卖鱼
step
    .goto Redridge Mountains,26.80,44.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达希|r交谈
    >>|cRXP_FRIENDLY_达希|r|cRXP_WARN_在旅店内来回走动|r
	.target 达希
    .accept 129 >> 接任务：免费的午餐
step << !Rogue
    .goto Redridge Mountains,27.0,44.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板布瑞安娜|r交谈
    .target 旅店老板布瑞安娜
    .home >> 将炉石绑定在湖畔镇
    .isQuestAvailable 20
step
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与楼上的|cRXP_FRIENDLY_黑衣威利|r交谈
	.target 黑衣威利
    .turnin 65 >> 交任务：迪菲亚兄弟会
    .isOnQuest 65
step
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t上楼与|cRXP_FRIENDLY_黑衣威利|r交谈
    .turnin 65 >> 交任务：迪菲亚兄弟会
    .accept 132 >> 接任务：迪菲亚兄弟会
	.target 黑衣威利
step
#optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师布雷纳|r交谈
    .accept 92 >> 接任务：赤脊山炖肉
    .turnin 92 >> 交任务：赤脊山炖肉
    .itemcount 2296,5 -- Great Goretusk Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target 厨师布雷纳
step << Rogue
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢修斯|r交谈
    .turnin 2281 >> 交任务：赤脊山的联络员
    .accept 2282 >> 接任务：奥瑟尔伐木场
    .target 卢修斯
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_肖恩|r交谈
	.target 肖恩
    .goto Redridge Mountains,29.31,53.63
    .accept 3741 >> 接任务：希拉里的项链
step
#loop
    >>|cRXP_WARN_跳入湖中|r
    >>打开|cRXP_PICK_闪光的泥浆|r，获取|cRXP_LOOT_希拉里的项链|r
    >>|cRXP_WARN_它在湖里有好几个刷新点|r
    .goto Redridge Mountains,27.80,56.05,0
    .goto Redridge Mountains,26.56,50.63,0
    .goto Redridge Mountains,23.96,55.17,0
    .goto Redridge Mountains,19.16,51.75,0
    .goto Redridge Mountains,31.12,54.21,0
    .goto Redridge Mountains,34.03,55.34,0
    .goto Redridge Mountains,38.09,54.49,0
    .goto Redridge Mountains,19.16,51.75,70,0
    .goto Redridge Mountains,38.09,54.49,70,0
    .complete 3741,1 --Hilary's Necklace (1)
step
    >>打开|cRXP_PICK_沉没的箱子|r，拾取|cRXP_LOOT_奥斯洛的工具箱|r
    .goto Redridge Mountains,41.52,54.68
    .complete 125,1 --Oslow's Toolbox (1)
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
	.target 工头奥斯洛
    .goto Redridge Mountains,32.13,48.63
    .turnin 125 >> 交任务：丢失的工具
    .accept 89 >> 接任务：止水湖上的桥
step
    #label BMenace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .goto Redridge Mountains,33.50,48.97
    .accept 20 >> 接任务：黑石氏族的威胁
    .target 治安官马瑞斯
    .xp <18,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_希拉里|r交谈
	.target 希拉里
    .goto Redridge Mountains,29.24,53.63
    .turnin 3741 >> 交任务：希拉里的项链
step
    #optional
	#completewith threat1
	>>击杀 |cRXP_ENEMY_黑龙雏龙|r，拾取它们的 |cRXP_LOOT_雏龙的腹鳞|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob 黑龙雏龙
    .isOnQuest 122
step
    #optional
    #completewith threat1
    >>击杀 |cRXP_ENEMY_巨型血牙野猪|r，拾取它们的 |cRXP_LOOT_巨型血牙野猪头|r
    .collect 2296,5,92,1
    .mob 巨型血牙野猪
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卫兵帕克|r交谈
	.target 卫兵帕克
    .goto Redridge Mountains,15.27,71.45
    .turnin 129 >> 交任务：免费的午餐
    .accept 130 >> 接任务：寻访草药师
step
    .goto Redridge Mountains,21.22,67.77,45,0
    .goto Redridge Mountains,17.70,73.39,45,0
    .goto Redridge Mountains,11.20,76.31,45,0
    .goto Redridge Mountains,13.37,81.48,45,0
    .goto Redridge Mountains,18.86,73.63
    >>击杀|cRXP_ENEMY_狼蛛|r，拾取|cRXP_LOOT_香脆蜘蛛肉|r
    .collect 1081,5,92,1
    .mob 狼蛛
step
#loop
    .goto Redridge Mountains,29.49,82.80,0
    .goto Redridge Mountains,32.52,81.78,0
    .goto Redridge Mountains,43.18,72.22,0
    .goto Redridge Mountains,31.13,82.18,0
    .goto Redridge Mountains,29.49,82.80,45,0
    .goto Redridge Mountains,32.52,81.78,45,0
    .goto Redridge Mountains,43.18,72.22,45,0
    .goto Redridge Mountains,31.13,82.18,45,0
	>>击杀 |cRXP_ENEMY_混血赤脊山豺狼人|r 和 |cRXP_ENEMY_赤脊山偷猎者|r
    .complete 246,1 --Redridge Mongrel (10)
    .complete 246,2 --Redridge Poacher (6)
    .mob 混血赤脊山豺狼人
	.mob 赤脊山偷猎者
step
#label threat1
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_菲尔顿副队长|r交谈
	.target 菲尔顿副队长
    .goto Redridge Mountains,30.73,59.99
    .turnin 246 >> 交任务：审时度势
step
    #completewith next
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
    .dungeon DM << !Human
step
    #optional
    .goto StormwindClassic,63.982,75.338
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马库斯·乔纳森将军|r交谈
    .turnin 120 >> 交任务：送往暴风城的信
    .accept 121 >> 接任务：送往暴风城的信
    .target 马库斯·乔纳森将军
    .isQuestTurnedIn 118
    .dungeon DM << !Human
step
    .accept 167 >> 接任务：我的兄弟……
    .accept 168 >> 接任务：收集记忆
    .goto StormwindClassic,65.438,21.175
    .target 维尔德·蓟草
    .dungeon DM
step << Human Paladin
    .goto StormwindClassic,38.6,26.7
>>对话 |cRXP_FRIENDLY_贾森·坦诺姆|r
    .turnin 1787 >>交任务圣洁之书
.target 贾森·坦诺姆
    .accept 1788 >>接受任务圣洁之书
step << Human Paladin
    .goto StormwindClassic,39.9,29.8
.target 达索瑞恩·拉尔
>>对话 |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1788 >>交任务圣洁之书
step
    .goto StormwindClassic,55.510,12.504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沉默的舒尼|r交谈
    .accept 2040 >> 接任务：地底突袭
    .target 沉默的舒尼
    .dungeon DM
step << Hunter
    .goto 1453/0,702.100,-8792.601
    .target 黎娜·斯图瓦
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话 |cRXP_FRIENDLY_黎娜·斯图瓦|r
    >>购买 |T135612:0|t[BKP 2700“执行者”]（每秒伤害9.6），或在拍卖行寻找更好的武器
    .collect 3024,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.6
    .dungeon DM << !Human
step << Rogue
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛尔达·维勒|r交谈
    .target 玛尔达·维勒
    >>|cRXP_WARN_购买|r |T135342:0|t[波刃短剑]
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的武器，就购买它|r
    .collect 2209,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.9
    .dungeon DM << !Human
step << Warrior/Paladin
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_冈瑟尔·维勒|r交谈
    >>|cRXP_WARN_如果你有足够的金币，购买一把|r |T135280:0|t[微光重剑] |cRXP_WARN_在21级时装备上|r
    >>|cRXP_WARN_如果你之前一直使用锤类武器，可以购买一把|r |T133044:0|t[牢固的木槌] |cRXP_WARN_暂时避免武器技能问题|r
    >>|cRXP_WARN_如果拍卖行有更便宜或更好的武器，就购买它|r
    .collect 922,1 --Heavy Spiked Mace (1)
    .itemcount 924,<1 --Ironwood Maul (1)
    .itemcount 4778,<1 --Heavy Spiked Mace (<1)
    .itemcount 4777,<1 --Ironwood Maul (<1)
    .target 冈瑟尔·维勒
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0
    .dungeon DM << !Human
step << Warlock/Priest
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_阿德温·凯伦|r交谈
    .vendor 1312 >>|cRXP_BUY_向她购买|r |T135139:0|t[燃烧魔杖] |cRXP_BUY_（若负担得起）|r
    .collect 5210,1
    .disablecheckbox
    .target 阿德温·凯伦
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.4
    .dungeon DM << !Human
step
    .goto StormwindClassic,63.982,75.338
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马库斯·乔纳森将军|r交谈
    .turnin 120 >> 交任务：送往暴风城的信
    .accept 121 >> 接任务：送往暴风城的信
    .target 马库斯·乔纳森将军
    .dungeon DM << !Human
step
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_铁匠阿古斯|r交谈
	.target 铁匠阿古斯
    .turnin 118 >> 交任务：马掌
    .accept 119 >> 接任务：回复弗纳
    .dungeon DM << !Human
step << Human
    .dungeon !DM
    .cooldown item,6948,>120,1
    .hs >> 炉石回湖畔镇
    .zoneskip Redridge Mountains
step << Human
#optional
.dungeon !DM
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Redridge >> 飞往赤脊山
    .target 杜加尔·朗德瑞克
    .zoneskip Redridge Mountains
step
    #label BMenace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
    .goto Redridge Mountains,33.50,48.97
    .accept 20 >> 接任务：黑石氏族的威胁
    .target 治安官马瑞斯
    .xp <18,1
step
    .goto Redridge Mountains,30.97,47.27
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target 弗纳·奥斯古
    .turnin 119 >> 交任务：回复弗纳
step
    .goto Redridge Mountains,30.97,47.27
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target 弗纳·奥斯古
    .accept 124 >> 接任务：豺狼人的乱吠
    .accept 122 >> 接任务：雏龙的鳞片
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_所罗门镇长|r交谈
	.target 所罗门镇长
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    .turnin 121 >> 交任务：送往暴风城的信
step
    .goto Redridge Mountains,29.71,44.26
    .target 拜里弗·科纳彻尔
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_拜里弗·科纳彻尔|r 交谈
    .accept 91 >> 接任务：所罗门的律法
step
    .goto Redridge Mountains,26.75,46.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击|cRXP_FRIENDLY_通缉告示|r
    .accept 180 >> 接任务：通缉：范高雷中尉
step
    .goto Redridge Mountains,21.85,46.32
    .target 玛蒂·詹罗斯
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_玛蒂·詹罗斯|r交谈
    .turnin 130 >> 交任务：寻访草药师
    .accept 131 >> 接任务：水仙诉衷情
    .accept 34 >> 接任务：不速之客
step
#optional
	#completewith BayingOfGnolls
	>>击杀 |cRXP_ENEMY_黑龙雏龙|r，拾取它们的 |cRXP_LOOT_雏龙的腹鳞|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob 黑龙雏龙
step << !Rogue
    #label BayingOfGnolls
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,22.5,35.7,0
    >>击杀|cRXP_ENEMY_赤脊山蛮兵|r和|cRXP_ENEMY_赤脊山秘法师|r，拾取|cRXP_LOOT_铁矛|r和|cRXP_LOOT_铁铆钉|r
    .complete 124,1 --Redridge Brute (10)
    .complete 124,2 --Redridge Mystic (8)
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
	.mob 赤脊山秘法师
	.mob 赤脊山蛮兵
step << Rogue
    #sticky
    #completewith next
    #label BayingOfGnolls
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,22.5,35.7,0
    >>击杀 |cRXP_ENEMY_赤脊山蛮兵|r 和 |cRXP_ENEMY_赤脊山秘法师|r, 获取 |cRXP_LOOT_铁矛|r 和 |cRXP_LOOT_铁铆钉|r. |cRXP_WARN_前往奥瑟尔伐木场途中推进此任务, 返回时完成|r
    .complete 124,1 --Redridge Brute (10)
    .complete 124,2 --Redridge Mystic (8)
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
	.mob 赤脊山秘法师
	.mob 赤脊山蛮兵
step << Rogue
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_必须完成这一步，才能进行后续的|r |T132290:0|t[毒药]|cRXP_WARN_任务|r
    >>|cRXP_WARN_站在路点位置，调整镜头和鼠标位置，使你无需移动即可点击 3 个|cRXP_PICK_练习用保险箱|r|r
    .skill lockpicking,80 >>|cRXP_WARN_打开奥瑟尔伐木场地面上的|r|cRXP_PICK_练习用保险箱|r，直到你的 |T136058:0|t[开锁]技能达到 80
step << Rogue
	.goto Redridge Mountains,52.05,44.69
    >>打开|cRXP_PICK_卢修斯的箱子|r，获取|cRXP_LOOT_偷窃技能证明物|r
    .complete 2282,1 --Token of Thievery (1)
step << Rogue
    #label BayingOfGnolls
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,21.23,36.17,60,0
    .goto Redridge Mountains,34.20,39.70,60,0
    .goto Redridge Mountains,39.61,31.46,60,0
    .goto Redridge Mountains,22.5,35.7,0
    >>继续击杀 |cRXP_ENEMY_赤脊山蛮兵|r 和 |cRXP_ENEMY_赤脊山秘法师|r, 获取 |cRXP_LOOT_铁矛|r 和 |cRXP_LOOT_铁铆钉|r
    .complete 124,1 --Redridge Brute (10)
    .complete 124,2 --Redridge Mystic (8)
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
	.mob 赤脊山秘法师
	.mob 赤脊山蛮兵
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_达希|r交谈
    >>|cRXP_FRIENDLY_达希|r|cRXP_WARN_在旅店内来回走动|r
	.target 达希
    .goto Redridge Mountains,26.80,44.30
    .turnin 131 >> 交任务：水仙诉衷情
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target 弗纳·奥斯古
    .goto Redridge Mountains,31.00,47.30
    .turnin 124 >> 交任务：豺狼人的乱吠
    .accept 126 >> 接任务：群山中的嚎叫
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_工头奥斯洛|r交谈
	.target 工头奥斯洛
    .goto Redridge Mountains,32.13,48.63
    .turnin 89 >> 交任务：止水湖上的桥
step << Rogue
    .goto Redridge Mountains,28.07,52.02
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_卢修斯|r交谈
    .turnin 2282 >> 交任务：奥瑟尔伐木场
    .target 卢修斯
step << Rogue
#label xp20
    >> 你应该在这里达到 20 级, 如果没有, 就去东边做鱼人任务并刷怪直到升到 20 级
    .xp 20
----Start of Rogue Poison and Deadmines section----
step << Rogue
    .goto Redridge Mountains,30.6,59.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 艾蕾娜·斯托姆法瑟
    .zoneskip Westfall
step << Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_从现在起注意安排花费。到达湿地后，你需要留出 75 银币来解锁符文|r
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
step << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >> 进入军情7处总部，沿楼梯上楼前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r处
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔|r交谈
    .accept 2360 >> 接任务：马迪亚斯和迪菲亚潜行者
    .goto StormwindClassic,75.78,59.84
    .target 马迪亚斯·肖尔
step << !Rogue
.dungeon DM
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
    .fly Westfall >> 飞往西部荒野
    .target 艾蕾娜·斯托姆法瑟
step << Rogue
#completewith next
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
    .zoneskip Westfall
step << Rogue
.dungeon !DM
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 132 >> 交任务：迪菲亚兄弟会
    .accept 135 >> 接任务：迪菲亚兄弟会
    .target 格里安·斯托曼
step
    .dungeon DM
    .goto Westfall,56.325,47.519
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 132 >> 交任务：迪菲亚兄弟会
    .accept 135 >> 接任务：迪菲亚兄弟会
    .target 格里安·斯托曼
step
    .dungeon DM
    .isOnQuest 135
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step
    .dungeon DM
    .goto StormwindClassic,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔|r交谈
    .turnin 135 >> 交任务：迪菲亚兄弟会
    .accept 141 >> 接任务：迪菲亚兄弟会
    .target 马迪亚斯·肖尔
step
    .dungeon DM
    .isOnQuest 141
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
step
.dungeon DM
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 141 >> 交任务：迪菲亚兄弟会
    .accept 142 >> 接任务：迪菲亚兄弟会
    .target 格里安·斯托曼
step
.dungeon DM
    #completewith next
    .goto Westfall,44.50,69.62,55 >> 前往月溪镇
step
.dungeon DM
    .goto Westfall,44.50,69.62
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>击杀|cRXP_ENEMY_迪菲亚信使|r，拾取|cRXP_LOOT_神秘的信件|r
    >>|cRXP_WARN_|cRXP_ENEMY_迪菲亚信使|r 会在月溪镇刷新. 他会沿着月溪镇以北的道路前往金海岸矿洞和詹戈洛德矿洞. 如果在路上没有看到他, 请等待他在月溪镇重新刷新|r
    >>|cRXP_WARN_他的刷新时间大约是 4 到 5 分钟|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan 迪菲亚信使
step
.dungeon DM
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 142 >> 交任务：迪菲亚兄弟会
    .target 格里安·斯托曼
step
.dungeon DM
    .goto Westfall,55.68,47.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_迪菲亚叛徒|r交谈
    >>|cRXP_WARN_如果他不在，你可能得等一下|cRXP_FRIENDLY_迪菲亚叛徒|r刷新|r
    .accept 155 >> 接任务：迪菲亚兄弟会
    .target 迪菲亚叛徒
step
.dungeon DM
    .goto Westfall,42.56,71.71
    >>护送 |cRXP_FRIENDLY_迪菲亚叛徒|r 前往死亡矿井
    >>|cRXP_WARN_全程跟紧|cRXP_FRIENDLY_迪菲亚叛徒|r！到月溪镇后，随时准备开打|cRXP_ENEMY_迪菲亚|r|r
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target 迪菲亚叛徒
step
.dungeon DM
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r交谈
    .turnin 155 >> 交任务：迪菲亚兄弟会
    .accept 166 >> 接任务：迪菲亚兄弟会
    .target 格里安·斯托曼
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与塔顶的|cRXP_FRIENDLY_哨兵瑞尔|r交谈
    .accept 214 >> 接任务：红色丝质面罩
    .goto Westfall,56.67,47.35
    .target 哨兵瑞尔
step << Rogue
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==请注意接下来的操作==|r
    >>|cRXP_WARN_按 Esc 键，进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选"启用互动按键"，并将"与目标互动"选项绑定至一个快捷键|r
    >>|cRXP_WARN_另外，建议开启"显示敌方姓名板"（默认快捷键：V），这样你就能隔墙看到塔内转角处的敌人了|r
step << Rogue
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_密探吉尔妮|r交谈
    >>|cRXP_WARN_必须完成此任务才能获得|r |T132290:0|t[毒药]
    .turnin 2360 >> 交任务：马迪亚斯和迪菲亚潜行者
    .accept 2359 >> 接任务：克拉文之塔
    .target 密探吉尔妮
step << Rogue
    #label TowerKey
    #loop
    .goto Westfall,71.49,73.49,0
    .goto Westfall,71.01,75.72,0
    .goto Westfall,69.58,73.07,0
    .goto Westfall,71.49,73.49,30,0
    .goto Westfall,71.01,75.72,30,0
    .goto Westfall,69.58,73.07,30,0
    >>|T133644:0|t[搜索]|cRXP_ENEMY_丑陋的迪菲亚懒汉|r，获取|cRXP_LOOT_迪菲亚塔楼钥匙|r
    >>|cRXP_WARN_必须处于|r |T132320:0|t[潜行]|cRXP_WARN_状态才能使用|r |T133644:0|t[搜索]
    >>|cRXP_WARN_|cRXP_ENEMY_丑陋的迪菲亚懒汉|r会在塔楼入口刷新，然后在塔外巡逻|r
    >>|cRXP_WARN_小心，他的伤害很高。如果|r |T132320:0|t[潜行]|cRXP_WARN_被识破，立刻使用|r |T132307:0|t[疾跑]|cRXP_WARN_逃离|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 丑陋的迪菲亚懒汉
step << Rogue
    #optional
    #completewith Mortwake
    +|cRXP_WARN_若尚未装备匕首，可为此任务装备|r |T135641:0|t[曲木匕首] |cRXP_WARN_；若已装备|r |T135641:0|t[匕首] |cRXP_WARN_则无需更换|r
    .use 15396
    .itemcount 15396,1
step << Rogue
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔楼从上往下第 2 层。在|r |T132320:0|t[潜行] |cRXP_WARN_状态下，趁 |cRXP_ENEMY_迪菲亚哨兵|r 不在身边，依次跳上椅子、灯和路点位置上方的书架顶|r
    >>|cRXP_WARN_手动|r |T132320:0|t[取消潜行]|cRXP_WARN_，然后按下“与目标互动”快捷键打开|cRXP_PICK_暮色森林的箱子|r，拾取其中的|r|cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_注意：你的|r |T132320:0|t[潜行]|cRXP_WARN_在拾取后会暂时失效，因为你拿到了|r|cRXP_LOOT_克拉文·摩特维克的日记|r
    >>|cRXP_WARN_如果你在第2层没有击杀 |cRXP_ENEMY_迪菲亚哨兵|r，请做好逃跑的准备。当你站在书架顶部时，他们很可能会一直对你产生仇恨 (但不会攻击你) ，因为那里是一个怪物无法攻击的位置|r
    >>|cRXP_WARN_如果背包里有或已装备|r |T135641:0|t[匕首]|cRXP_WARN_，先装备匕首，再施放|r |T132282:0|t[伏击]|cRXP_WARN_瞬间击杀塔内的|cRXP_ENEMY_迪菲亚巡塔员|r和|cRXP_ENEMY_迪菲亚哨兵|r。击杀第一个|cRXP_ENEMY_迪菲亚哨兵|r后准备逃跑，并留意上方可能袭来的攻击。这种方法较慢，但安全得多|r
    >>|cRXP_WARN_如果必须跑出塔楼，小心入口处可能出现的|cRXP_ENEMY_丑陋的迪菲亚懒汉|r和|cRXP_ENEMY_迪菲亚苦工|r|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >> 点击此处查看视频演示
    .mob 迪菲亚巡塔员
    .mob 迪菲亚哨兵
step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
step << !Dwarf Rogue
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包里的 |T134437:0|t[抗毒药剂]移除 |T136230:0|t[赞吉尔之触]减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
step << Dwarf Rogue
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石像形态]移除 |T136230:0|t[赞吉尔之触]减益效果|r
    .aura -9991
step << Rogue
    #optional
    #completewith KlavenEnd
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step << !Dwarf Rogue
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >> 前往 |cRXP_FRIENDLY_珊娜·弗勒|r 处
    .aura -9991
step << !Dwarf Rogue
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以改请他们移除你的|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_减益效果|r
    .skill firstaid,80 >> |cRXP_WARN_将|r |T135966:0|t[急救] |cRXP_WARN_练到80点|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
step << !Dwarf Rogue
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_珊娜·弗勒|r交谈
    >>|cRXP_WARN_如果有|r |T626003:0|t|cFFF48CBA圣骑士|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0A德鲁伊|r |cRXP_WARN_朋友，可以改请他们移除你的|r |T136230:0|t[赞吉尔之触] |cRXP_WARN_减益效果|r
    .train 7934 >> |cRXP_WARN_学习|r |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >> 制作一份 |T134437:0|t[抗毒药剂]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
step << !Dwarf Rogue
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包里的 |T134437:0|t[抗毒药剂]移除 |T136230:0|t[赞吉尔之触]减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
step << Rogue
    #optional
    #requires AntiVenomEnd2 << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,10 >> 进入军情7处总部，沿楼梯上楼前往|cRXP_FRIENDLY_马迪亚斯·肖尔|r处
step << Rogue
    #label KlavenEnd
    #requires AntiVenomEnd2 << Rogue
    .goto StormwindClassic,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_马迪亚斯·肖尔|r交谈
    >>|cRXP_WARN_如果之前换用了|r |T135641:0|t[匕首]|cRXP_WARN_，记得重新装备主武器|r << Rogue
    .turnin 2359 >> 交任务：克拉文之塔
    .turnin 135 >> 交任务：迪菲亚兄弟会
    .target 马迪亚斯·肖尔
step << Rogue
#completewith next
.dungeon DM
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Westfall >> 飞往西部荒野
    .target 杜加尔·朗德瑞克
    .zoneskip Westfall
step
.dungeon DM
    .goto Westfall,60.4,72.2
    .goto Westfall,40.4,71.6
    .subzone 1581 >> 现在开始寻找死亡矿井队伍
    >>组建死亡矿井队伍期间，刷豺狼人练级
step
.dungeon DM
    .goto Westfall,42.55,71.69
    .subzone 1581 >> 前往死亡矿井
step
.dungeon DM
    #completewith EnterDM
    >>击杀|cRXP_ENEMY_迪菲亚|r，拾取|cRXP_LOOT_红色丝质面罩|r
    >>|cRXP_WARN_你也可以进入副本后再完成此目标|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
step
.dungeon DM
    #completewith next
    >>击杀 |cRXP_ENEMY_骷髅矿工|r、|cRXP_ENEMY_亡灵爆破者|r 和 |cRXP_ENEMY_亡灵挖掘者|r，搜刮 |cRXP_LOOT_卡片|r
    >>|cRXP_WARN_这一步要在副本外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀|cRXP_ENEMY_工头希斯耐特|r，拾取|cRXP_LOOT_徽章|r
    >>|cRXP_WARN_这一步要在副本外完成|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan 工头希斯耐特
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>击杀 |cRXP_ENEMY_骷髅矿工|r、|cRXP_ENEMY_亡灵爆破者|r 和 |cRXP_ENEMY_亡灵挖掘者|r，搜刮 |cRXP_LOOT_卡片|r
    >>|cRXP_WARN_这一步要在副本外完成|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob 骷髅矿工
    .mob 亡灵爆破者
    .mob 亡灵挖掘者
step
.dungeon DM
    #label EnterDM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >> 进入"死亡矿井"副本
step
.dungeon DM
    #completewith DMend
    >>击杀死亡矿井内的|cRXP_ENEMY_迪菲亚|r，拾取|cRXP_LOOT_红色丝质面罩|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
step
.dungeon DM
    >>击杀|cRXP_ENEMY_斯尼德|r，拾取|cRXP_LOOT_小型高能发动机|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)
step
.dungeon DM
    >>击杀|cRXP_ENEMY_艾德温·范克里夫|r，拾取|cRXP_LOOT_头颅|r和 |T133471:0|t[|cRXP_LOOT_未寄出的信|r]
    >>|cRXP_WARN_使用|T133471:0|t[|cRXP_LOOT_未寄出的信|r]开启任务|r
    .collect 2874,1,373 -- An Unsent Letter (1)
    .complete 166,1 -- Head of VanCleef (1)
    .accept 373 >> 接任务：未寄出的信
    .use 2874 -- An Unsent Letter
step
.dungeon DM
    #label DMend
    #completewith next
    .goto Westfall,56.33,47.52,100 >> 前往哨兵岭
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_格里安·斯托曼|r和塔顶的|cRXP_FRIENDLY_哨兵瑞尔|r交谈
    .turnin 166 >> 交任务：迪菲亚兄弟会
    .goto Westfall,56.33,47.52
    .turnin -214 >> 交任务：红色丝质面罩
    .goto Westfall,56.67,47.35
    .target 格里安·斯托曼
    .target 哨兵瑞尔
step
.dungeon DM
    #completewith next
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_索尔|r交谈
    .fly Stormwind >> 飞往暴风城
    .target 索尔
step
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与里面的|cRXP_FRIENDLY_维尔德·蓟草|r交谈
    .turnin 167 >> 交任务：我的兄弟……
    .turnin 168 >> 交任务：收集记忆
    .target 维尔德·蓟草
    .dungeon DM
step
    #label ShoniEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_沉默的舒尼|r交谈
    .turnin 2040 >> 交任务：地底突袭
    .goto StormwindClassic,55.510,12.504
    .target 沉默的舒尼
    .dungeon DM
step
    .dungeon DM
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_杜加尔·朗德瑞克|r交谈
    .fly Redridge >> 飞往赤脊山
    .target 杜加尔·朗德瑞克
    .zoneskip Redridge Mountains
----End of Rogue Poison and Deadmines section----
step
    #optional
    #completewith orcs
    >>击杀|cRXP_ENEMY_恐鹫|r，拾取|cRXP_LOOT_硬秃鹫肉|r
    >>击杀 |cRXP_ENEMY_黑龙雏龙|r，搜刮 |cRXP_LOOT_雏龙的腹鳞|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob +黑龙雏龙
    .collect 1080,5,92,1
    .mob +恐鹫
    .subzoneskip 997--Render's Valley
step
#completewith next
    >>击杀 |cRXP_ENEMY_巨型血牙野猪|r，搜刮 |cRXP_LOOT_巨型血牙野猪头|r
    .collect 2296,5,92,1
    .mob 巨型血牙野猪
step
    .goto Redridge Mountains,49.0,70.0
    >>击杀|cRXP_ENEMY_鱼人巡滩者|r和|cRXP_ENEMY_鱼人小招潮者|r，拾取|cRXP_LOOT_鱼人的鳍|r和|cRXP_LOOT_斑点太阳鱼|r
	>>|cRXP_WARN_注意，此区域会快速刷新，|cRXP_ENEMY_鱼人|r复活得很快|r
    .complete 127,1
    .collect 1468,8,150,1
    .mob 鱼人巡滩者
    .mob 鱼人小招潮者
step << Warlock
    #season 2
    #sticky
    #label Incinerate
    .goto Redridge Mountains,76.8,82.2
    .train 416015 >>击杀 |cRXP_ENEMY_焚化者加因姆|r |cRXP_WARN_(23 级精英)|r, 搜刮 |T134419:0|t[|cRXP_FRIENDLY_烧尽符文|r]
    .use 211477>>这个符文有一定难度，但完全可以完成。持续恐惧加因姆；之后的任务还会用到这个符文
    .collect 211477,1
    .disablecheckbox
    .unitscan 焚化者加因姆
step
    #label orcs
    #loop
    >>击杀|cRXP_ENEMY_黑石步兵|r和|cRXP_ENEMY_黑石前锋|r，拾取|cRXP_LOOT_斧头|r
	>>|cRXP_WARN_注意，|cRXP_ENEMY_黑石前锋|r会对你施放|T132149:0|t[投网]|r
    .goto Redridge Mountains,74.00,79.00,60,0
    .goto Redridge Mountains,76.18,83.39,60,0
    .goto Redridge Mountains,77.80,68.50,60,0
    .goto Redridge Mountains,70.11,77.34,60,0
    .goto Redridge Mountains,74.00,79.00,60,0
    .goto Redridge Mountains,74.00,79.00,0
    .complete 20,1 --Battleworn Axe (10)
    .mob 黑石步兵
	.mob 黑石前锋
step
    #requires Incinerate << Warlock
    .goto Redridge Mountains,61.37,77.10
    >>击杀|cRXP_ENEMY_恐鹫|r，拾取|cRXP_LOOT_硬秃鹫肉|r
    >>击杀 |cRXP_ENEMY_黑龙雏龙|r，搜刮 |cRXP_LOOT_雏龙的腹鳞|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob +黑龙雏龙
    .collect 1080,5,92,1
    .mob +恐鹫
step << Rogue
    .goto Redridge Mountains,74.00,79.00,60,0
    .goto Redridge Mountains,76.18,83.39,60,0
    .goto Redridge Mountains,77.80,68.50,60,0
    .goto Redridge Mountains,70.11,77.34,60,0
    .goto Redridge Mountains,74.00,79.00,60,0
    .goto Redridge Mountains,74.00,79.00,0
    .xp 22-18500 >> 刷怪，直到距离 22 级还差 18500 点经验
    .itemcount 1080,5 --Tough condor meat (5)
    .itemcount 2296,5 --Great goretusk snout (5)
    .itemcount 1221,6 --Underbelly Whelp Scale (6)
step
    #softcore
    .deathskip >> 主动死亡后在灵魂医者处复活，并接受复活虚弱效果。接下来一段时间内无需与怪物战斗
    .itemcount 1080,5 --Tough condor meat (5)
    .itemcount 2296,5 --Great goretusk snout (5)
    .itemcount 1221,6 --Underbelly Whelp Scale (6)
    .itemcount 3014,10 --Battleworn Axe (10)
    .xp <21.25
step
    #loop
    >>击杀 |cRXP_ENEMY_巨型血牙野猪|r，搜刮 |cRXP_LOOT_巨型血牙野猪头|r
    .goto Redridge Mountains,15.73,52.83,60,0
    .goto Redridge Mountains,32.25,70.20,60,0
    .goto Redridge Mountains,31.02,72.14,60,0
    .goto Redridge Mountains,15.73,52.83,0
    .goto Redridge Mountains,32.25,70.20,0
    .goto Redridge Mountains,31.02,72.14,0
    .collect 2296,5,92,1
    .mob 巨型血牙野猪
step << Rogue
    .xp 22-18500 >> 刷怪，直到距离 22 级还差 18500 点经验
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_厨师布雷纳|r交谈
	.target 厨师布雷纳
    .goto Redridge Mountains,22.67,43.83
    .accept 92 >> 接任务：赤脊山炖肉
    .turnin 92 >> 交任务：赤脊山炖肉
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_码头管理员巴伦|r交谈
	.target 码头管理员巴伦
    .goto Redridge Mountains,27.72,47.38
    .turnin 127 >> 交任务：卖鱼
    .accept 150 >> 接任务：鱼人偷猎者
    .turnin 150 >> 交任务：鱼人偷猎者
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_弗纳·奥斯古|r交谈
	.target 弗纳·奥斯古
    .goto Redridge Mountains,31.00,47.30
    .turnin 122 >> 交任务：雏龙的鳞片
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_治安官马瑞斯|r交谈
	.target 治安官马瑞斯
    .goto Redridge Mountains,33.50,48.97
    .turnin 20 >> 交任务：黑石氏族的威胁
step
    .goto Redridge Mountains,30.59,59.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r交谈
	.target 艾蕾娜·斯托姆法瑟
    .fly Stormwind >> 飞往暴风城
step << !Mage/Paladin/Warlock
    .goto StormwindClassic,52.623,65.701
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_旅店老板奥里森|r交谈
    .home >> 将炉石设在暴风城
    .target 旅店老板奥里森
step << Mage
    .goto Stormwind City,39.681,79.538
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_拉瑞麦尼·普尔度|r交谈
    .train 3561 >> 学习 |T135763:0|t[传送：暴风城]
    .target +拉瑞麦尼·普尔度
step << Mage
    .goto Stormwind City,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与 |cRXP_FRIENDLY_詹妮亚|r交谈
    .trainer >> 学习职业技能
    .target 艾尔莎林
	.target 詹妮亚·坎农
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_武神|r或|cRXP_FRIENDLY_伊尔萨·考宾|r交谈
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >> 学习职业技能
    .target 武神
    .target 伊尔萨·考宾
step << Rogue
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_夜行者奥斯伯|r交谈
    >>|cRXP_WARN_学完技能后确保还剩 75 银币，稍后解锁符文需要这笔钱。如果有必要，只购买必需的技能|r
    .train 1856 >> |cRXP_WARN_确保学会|T132331:0|t[消失]。|r|cRXP_WARN_稍后解锁符文需要使用它|r
    .trainer >> 学习职业技能
    .target 夜行者奥斯伯
step << Paladin
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_虔诚的亚瑟|r交谈
    .trainer >> 学习职业技能
    .target 虔诚的亚瑟
step << Priest
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_高阶牧师劳瑞娜|r交谈
    .trainer >> 学习职业技能
    .target 高阶牧师劳瑞娜
step << Hunter
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_恩瑞斯·锐矛|r交谈
    .trainer >> 学习职业技能
    .target 恩瑞斯·锐矛
step
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    .zone Ironforge >> 进入矿道地铁，乘坐地铁前往铁炉堡
step << Warlock
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_布瑞尔索恩|r交谈
    .trainer >> 学习职业技能
    .target 布瑞尔索恩
step << Warlock
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t与|cRXP_FRIENDLY_寻尸者祖贝尔|r交谈
    .vendor 6382 >> |cRXP_BUY_购买|r|T133738:0|t[魔典：折磨（等级 2）]
    .collect 16346,1
    .disablecheckbox
    .target 寻尸者祖贝尔
    .train 427733,1 --skips if you have a felguard
step << Mage
    .goto Ironforge,25.50,7.04
    >>与|cRXP_FRIENDLY_贝尔斯塔弗·风暴之眼|r交谈。
    .train 3562 >> 学习 |T135757:0|t[传送：铁炉堡]
    .target 贝尔斯塔弗·风暴之眼
step
    #completewith next
    .goto Dun Morogh,53.48,37.50,30,0
    .goto Dun Morogh,54.04,38.60,30,0
    .goto Dun Morogh,59.43,42.85,150 >> 前往跳点，沿途紧贴山体左侧。
    .subzoneskip 150 -- Skips if already in menethil
    .subzoneskip 2104 -- Skips if already in menethil inn
step
    .goto Dun Morogh,60.18,43.01,12,0
    .goto Dun Morogh,60.42,43.75,12,0
    .goto Dun Morogh,60.71,44.18,4,0
    .goto Dun Morogh,60.95,44.16,6,0
    .goto Dun Morogh,61.45,41.68,10,0
    .goto Dun Morogh,61.76,41.50,4,0
    .goto Dun Morogh,61.84,41.63,4,0
    .goto Dun Morogh,62.01,41.30,8,0
    .goto Dun Morogh,61.79,39.71,15,0
    .goto Dun Morogh,61.48,36.85,12,0
    .goto Dun Morogh,61.46,32.76,15,0
    .goto Dun Morogh,61.38,28.92,30,0
    .goto Dun Morogh,60.91,22.82,30,0
    .goto Dun Morogh,60.51,16.20,5,0
    .goto Dun Morogh,60.52,15.81,5,0
    .goto Dun Morogh,60.74,15.16,15,0
    .goto Dun Morogh,60.41,14.35,8,0
    .goto Dun Morogh,60.64,13.89,6,0
    .goto Dun Morogh,61.40,13.27,10,0
    .goto Dun Morogh,61.52,12.58,8,0
    >>|cRXP_WARN_按无死亡路线从丹莫罗前往湿地|r
    >>|cRXP_WARN_如果没把握，每次坠落后都吃东西恢复满生命，再继续。|r
    .link https://youtu.be/QcEUvwu49KI?t=73 >> |cRXP_WARN_点击此处观看参考视频（强烈建议观看）。|r
    .goto Dun Morogh,60.65,11.38,20 >>小心地沿山坡往下跳。
    .isQuestAvailable 983
    .subzoneskip 150 -- Skips if already in menethil
    .subzoneskip 2104 -- Skips if already in menethil inn
step
    .goto Dun Morogh,60.80,10.33,10,0
    .goto Dun Morogh,60.61,9.73,8,0
    .goto Wetlands,18.79,72.53,12,0
    .goto Wetlands,18.70,70.97,12,0
    .goto Wetlands,18.50,69.39,12,0
    .goto Wetlands,17.62,68.35,15,0
    .goto Wetlands,17.00,67.68,12,0
    .goto Wetlands,15.96,67.15,12,0
    .goto Wetlands,15.07,66.41,20,0
    .goto Wetlands,15.31,65.47,20,0
    .goto Wetlands,15.10,63.72,12,0
    >>|cRXP_WARN_按无死亡路线从丹莫罗前往湿地|r
    >>|cRXP_WARN_如果稀有怪|cRXP_ENEMY_斯拉丁|r已刷新，朝海岸下行前小心它|r
    >>|cRXP_WARN_到达海边后，小心西侧的|cRXP_ENEMY_蓝腮袭击者|r。|r
    .link https://youtu.be/QcEUvwu49KI?t=336 >> |cRXP_WARN_点击此处观看参考视频（强烈建议观看）。|r
    .goto Wetlands,12.69,60.97,15 >> 前往米奈希尔港
    .mob 湿地鳄鱼幼崽
    .mob 蓝腮袭击者
    .unitscan 斯拉丁
    .isQuestAvailable 983
    .subzoneskip 150 -- Skips if already in menethil
    .subzoneskip 2104 -- Skips if already in menethil inn
]])
