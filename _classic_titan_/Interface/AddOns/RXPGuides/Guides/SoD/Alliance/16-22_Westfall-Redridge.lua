
RXPGuides.RegisterGuide([[
#classic
#version 1
#season 2
<< Alliance
#group RestedXP 联盟 1-20
#name 16-17 西部荒野 赛季服
#displayname 16-17 Westfall
#next 17-22 赤脊山 赛季服
#defaultfor !NightElf

step << Paladin
    .goto Stormwind City,74.182,7.465 << Alliance
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_米尔顿·西弗|r << Alliance
    >>从他那里购买 |T133745:0|t|cRXP_LOOT_[驱魔人的证言]|r，用它来训练 |T135956:0|t[驱魔人] << Paladin
    .collect 226398,1 << Paladin
    .train 415076,1 << Paladin
step
    .goto StormwindClassic,58.08,16.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗伦·长须|r
    .turnin 1338 >>交任务: |cRXP_FRIENDLY_卡尔·雷矛的订单|r
    .target Furen Longbeard
step << Priest !NightElf
    #season 2
    .goto StormwindClassic,20.8,50.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娜拉·梅德隆|r
    .target Nara Meideros
    .accept 78194 >>接受艾露恩的秘密
step << Human Paladin
    #optional
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin -2998 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1641 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1641 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Duthorian Rall
step << Human Paladin
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .accept 1641 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1641 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Duthorian Rall
step << Human Paladin
    .goto StormwindClassic,39.80,29.77
    >>|cRXP_WARN_使用 |T133739:0|t[|cRXP_LOOT_The Tome of Divinity|r] 开始任务|r
    .accept 1642 >>接任务: |cRXP_LOOT_圣洁之书|r
    .use 6775
step << Human Paladin
    .goto StormwindClassic,39.80,29.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1642 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1643 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Duthorian Rall
step << Paladin
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虔诚的亚瑟|r
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
step << Human Paladin
    .goto StormwindClassic,57.08,61.74
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯蒂芬妮·特纳|r
    .turnin 1643 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1644 >>接任务: |cRXP_LOOT_圣洁之书|r
    .turnin 1644 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .accept 1780 >>接任务: |cRXP_LOOT_圣洁之书|r
    .target Stephanie Turner
step << Human Paladin
    .goto StormwindClassic,40.1,29.9
    >>对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1780 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Duthorian Rall
    .accept 1781 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Human Paladin
    .goto StormwindClassic,38.7,26.6
    >>对话: |cRXP_FRIENDLY_贾森·坦诺姆|r
    .turnin 1781 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
    .target Gazin Tenorm
    .accept 1786 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Priest !NightElf
    #season 2
    .goto StormwindClassic,20.8,50.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_娜拉·梅德隆|r
    .target Nara Meideros
    .train >>训练你的职业法术
step << Warlock
    #completewith next
    .goto StormwindClassic,29.2,74.0,20,0
    .goto StormwindClassic,27.2,78.1,15 >>前往被屠宰的羔羊并下楼
step << Warlock
    .goto StormwindClassic,26.117,77.225
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厄苏拉·德林|r
    .trainer >>训练你的职业法术
    .target Ursula Deline
step << Warlock
    .goto Elwynn Forest,44.397,65.989
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_斯巴克尔|r
    >>|cRXP_BUY_购买|r |T133738:0|t[消耗阴影魔典 (等级 1)]
    .collect 16357,1
    .target Spackle Thornberry
    .train 20387,1
step << Warlock
    .goto StormwindClassic,25.25,78.59
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑暗缚灵者加科因|r
    .turnin 1688 >>交任务: |cRXP_FRIENDLY_苏伦娜·凯尔东|r
    .accept 1689 >>接任务: |cRXP_LOOT_誓缚|r
    .target Gakin the Darkbinder
step << Warlock
    #completewith next
    .goto StormwindClassic,25.2,80.7,18,0
    .goto StormwindClassic,23.2,79.5,18,0
    .goto StormwindClassic,26.3,79.5,18,0
    .goto StormwindClassic,25.154,77.406
    >>|cRXP_WARN_前往被屠宰的羔羊底部|r
    .cast 7728 >>|cRXP_WARN_使用|r |T133292:0|t[血石颈链] |cRXP_WARN_召唤|r |cRXP_ENEMY_虚空行者|r
    .use 6928
step << Warlock
    .goto StormwindClassic,25.154,77.406
    .use 6928 >>杀死|cRXP_ENEMY_Summoned Voidwalker|r
    .complete 1689,1 --Kill Summoned Voidwalker (x1)
    .mob Summoned Voidwalker
step << Warlock
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑暗缚灵者加科因|r
    .target Gakin the Darkbinder
    .goto StormwindClassic,25.25,78.59
    .turnin 1689 >>交任务: |cRXP_FRIENDLY_誓缚|r
step << Priest/Mage/Warlock
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿德温·凯伦|r, 他在里面
    .vendor 1312 >>|cRXP_BUY_如果你能负担得起，从她那里买一把|r |T135468:0|t[闷烧魔杖] |cRXP_BUY_（35 秒）|r
    >>|cRXP_BUY_或者，如果价格更便宜的话，从拍卖行购买 a|r |T135144:0|t[高级魔杖] |cRXP_BUY_|r
    .collect 5208,1
    .disablecheckbox
    .target Ardwyn Cailen
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<13.4
    .itemcount 11288,<1 --Greater Magic Wand (1)
step << Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保你训练|r|T136058:0|t[开锁]|cRXP_WARN_因为你很快就会需要它来完成你的盗贼职业任务|r
    .trainer >>训练你的职业法术
    .train 1804 >>列车 |T136058:0|t[撬锁]
    .target Osborne the Night Man
step << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >>进入 SI:7 总部。走上楼梯前往 |cRXP_FRIENDLY_Renzik \"The Shiv\"|r
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_\"剃刀\"雷吉克|r
    .accept 2281 >>接任务: |cRXP_LOOT_赤脊山的联络员|r
    .goto StormwindClassic,75.76,60.35
    .target “剃刀”雷吉克
step << Warrior
    #season 2
    #completewith next
    .gossipoption 109045 >>Talk to |cRXP_FRIENDLY_Liv Bradford|r inside the Inn at the Park
    .goto Stormwind City,22.608,64.621
    .gossipoption 109084 >>Talk to |cRXP_ENEMY_Stuart|r, then beat him up. He will pass out at 0%
    .goto Stormwind City,21.213,62.781
    >>如果 |cRXP_ENEMY_Stuart|r 不在，等待他重生
    .skipgossipid 109047
    .skipgossipid 109045
    .skipgossipid 109084
    --.train 425447,1
step << Warrior
    #season 2
    .goto Stormwind City,22.608,64.621
    .use 204716 >>Talk to |cRXP_FRIENDLY_Liv Bradford|r again after knocking out |cRXP_ENEMY_Stuart|r to receive the |T134419:0|t[|cRXP_FRIENDLY_Rune of Frenzied Assault|r]
    .collect 204716,1
    .train 425447,1 >>|cRXP_WARN_使用|r |T134419:0|t[|cRXP_FRIENDLY_疯狂袭击符文|r] |cRXP_WARN_训练|r |T236317:0|t[疯狂袭击]
    >>|cRXP_WARN_注意：根据你的水平，单人完成可能相当困难。如果需要，可以寻求帮助|r
    .skipgossip 203478,1
    .target Liv Bradford
    .mob Stuart
step << Hunter
    .goto 1453/0,702.100,-8792.601
    .target Lina Stover
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黎娜·斯图瓦|r
    >>购买 |T135612:0|t[大口径火枪] (7.4 dps) 或在拍卖行寻找更好的升级
    .collect 3023,1
    .money <0.3771
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<7.3
step << !Human/!Mage
    #season 1 << Rogue
    .goto StormwindClassic,57.129,57.698
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_吴平|r
    .train 227 >>火车五线谱 << Priest/Warlock/Hunter
    .train 201 >>训练 1h 剑 << Mage/Warlock
    .train 202 >>训练 2h 剑 << Warrior/Paladin/Hunter
    --.train 5011 >>训练弩 << Hunter
    .target Woo Ping
step << Warrior/Paladin
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛尔达·维勒|r
    >>购买 |T135353:0|t[Espadon] (12.6 dps) 或在拍卖行寻找更好的升级
    .target Marda Weller
    .collect 2024,1 --Collect Espadon (1)
    .money <0.6397
    .itemStat 16,QUALITY,<7
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<12.5
step
    #ah
    .goto Stormwind City,53.612,59.764
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拍卖师亚克森|r
    >>稍后为你的 |T132290:0|t[毒药] 任务购买 |T134437：0|吨[抗毒液]，其余的则很快在赤脊山更快地交付 << !Dwarf Rogue
    >>购买以下物品以便更快地在赤脊山上交 << !Rogue/Dwarf Rogue
    >>这将节省你的时间，因为你不需要到处寻找怪物来杀死。如果你不想购买任何怪物，请跳过此步骤
    >>|T134437：0|吨[抗毒] << !Dwarf Rogue
    >>|T134172:0|t[巨大血牙兽]
    >>|T134028:0|t[坚韧的秃鹫肉]
    >>|T134321:0|t[酥脆蜘蛛肉]
    >>抗毒液可以通过急救技能使用 |T134339:0|t[小毒囊] 制作 << Rogue !Dwarf
    .collect 6452,1,2359,1 << !Dwarf Rogue --Anti-Venom (1)
    .collect 2296,5,92,1 -- 大血牙 Snout (5)
    .collect 1080,5,92,1 -- Tough Condor Meat (5)
    .collect 1081,5,92,1 -- Crisp Spider Meat (5)
    .target Auctioneer Jaxon
step << Mage
    #season 2
    .goto StormwindClassic,55.8,65.2
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_凯德雷克·布舍尔|r
    >>检查他是否有 |T134830:0|t[|cRXP_LOOT_Lesser Healing Potions|r]，如果有就买
    .collect 211779,3 >>从他那里买几个 |T135933:0|t[|cRXP_LOOT_Comprehension Charms|r]
    .target Keldric Boucher
step << Human
    .goto StormwindClassic,66.28,62.13
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .turnin 6261 >>交任务: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .accept 6285 >>接任务: |cRXP_LOOT_返回西部荒野|r
    .target Dungar Longdrink
    .isQuestTurnedIn 6281
step << !Human/Warlock
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fp Stormwind >>获取暴风城飞行路线 << !Human
    .fly Redridge >>飞往赤脊山 << Warlock
    .target Thor
step << !Warlock
    .goto Elwynn Forest,32.45,50.16
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .zoneskip Westfall
    .zoneskip Redridge Mountains
step << Warrior
    .goto Elwynn Forest,41.087,65.768
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_里瑞亚·杜拉克|r
    .trainer >>训练你的职业法术
    .target Lyria Du Lac
step << Paladin
    .goto Elwynn Forest,41.096,66.041
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_威尔海姆修士|r
    .trainer >>训练你的职业法术
    .target Brother Wilhelm
step << !Human !Warlock
    .goto Elwynn Forest,43.771,65.803
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板法雷|r
    .home >>将你的炉石设置为闪金郡
    .target Innkeeper Farley
step << Mage
    #optional
    #completewith next
    .goto Elwynn Forest,43.877,66.546,9 >>在旅馆上楼
step << Mage
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_扎尔迪玛·维夫希尔特|r
	.target Zaldimar Wefhellt
    .goto Elwynn Forest,43.25,66.19
    .trainer >>训练你的职业法术
step << !Warlock
    .goto 1429/0,73.800,-9465.000
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官杜汉|r
    .target 杜汉元帅
    .accept 109 >>接任务: |cRXP_LOOT_向格里安·斯托曼报到|r
step << Human Paladin
    .goto Elwynn Forest,72.7,51.5
    >>使用 |cRXP_PICK_生命的象征|r 对 |cRXP_FRIENDLY_Henze Faulk|r 使用 |cRXP_PICK_生命的象征|r
>>对话: |cRXP_FRIENDLY_亨兹·法奥克|r
    .turnin 1786 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
.target Henze Faulk
    .accept 1787 >>接任务: |cRXP_LOOT_圣洁之书|r
    .use 6866
step << Human Paladin
    .goto Elwynn Forest,73.5,51.3
    >>杀死岛屿周围的|cRXP_ENEMY_Defias 流氓巫师|r
    .complete 1787,1 --Defias Script (1)
    .mob Defias Rogue Wizard
step << !Warlock
    #label RedridgeS
    .goto Redridge Mountains,17.4,69.6
    .zone Redridge Mountains >>前往: |cRXP_PICK_赤脊山|r
step
    .goto Redridge Mountains,17.4,69.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Parker|r
    .accept 244 >>接任务: |cRXP_LOOT_豺狼人的入侵|r
    .target Guard Parker
step
    .goto Redridge Mountains,30.73,59.99
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_菲尔顿副队长|r
    .turnin 244 >>交任务: |cRXP_FRIENDLY_豺狼人的入侵|r
    .accept 246 >>接任务: |cRXP_LOOT_审时度势|r
    .target Deputy Feldon
step << !Warlock
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fp Redridge Mountains >>获取赤脊山飞行路线
    .target Ariena Stormfeather
step << !Human
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗纳·奥斯古|r
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .accept 118 >>接任务: |cRXP_LOOT_马掌|r
step << Human/Dwarf Paladin
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fly Westfall >>飞往西部荒野
    .target Ariena Stormfeather
step << Gnome Warlock
    .goto Redridge Mountains,30.590,59.410
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fly Stormwind >>飞往暴风城
    .target Ariena Stormfeather
step << Gnome Warlock
    .goto Elwynn Forest,32.45,50.16
    .zone Elwynn Forest >>前往: |cRXP_PICK_艾尔文森林|r
    .zoneskip Westfall
    .isQuestAvailable 153
step << !Human !Paladin !Warlock
    #completewith next
    .hs >>炉石到闪金镇
step << !Human !Paladin
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_铁匠阿古斯|r
	.target Smith Argus
    .turnin 118 >>交任务: |cRXP_FRIENDLY_马掌|r
    .accept 119 >>接任务: |cRXP_LOOT_回复弗纳|r
step << !Human !Paladin
    #completewith next
    .zone Westfall >>前往: |cRXP_PICK_西部荒野|r
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r, |cRXP_FRIENDLY_达努温上尉|r
    .goto Westfall,56.327,47.520
    .turnin -109 >>交任务: |cRXP_FRIENDLY_向格里安·斯托曼报到|r
    .accept 12 >>接任务: |cRXP_LOOT_西部荒野人民军|r
    .target 格里安·斯托曼托
step << Human
    #label Lewis
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_军需官刘易斯|r
    .target Quartermaster Lewis
    .goto Westfall,57.00,47.17
    .turnin 6285 >>交任务: |cRXP_FRIENDLY_返回西部荒野|r
    .isOnQuest 6285
step
    .goto Westfall,54.00,53.00
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵加里安|r
    .target Scout Galiaan
    .accept 153 >>接任务: |cRXP_LOOT_红色皮质面罩|r
step << Rogue
    .goto Westfall,52.8,53.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板希瑟尔|r
    .target Innkeeper Heather
    .home >>将你的炉石设置为西部荒野
step
    >>杀死 |cRXP_ENEMY_Defias Trappers|r 和 |cRXP_ENEMY_Defias Smugglers|r。掠夺他们的 |cRXP_LOOT_Red Leather Bandanas|r
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
    .mob Defias Trapper
    .mob Defias Smuggler
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
    >>杀死 |cRXP_ENEMY_Defias 掠夺者|r。掠夺他们以获得 |T134939:0|t|cRXP_FRIENDLY_[法术说明：TENGI RONEERA]|r
    .collect 208754,1 --Spell Notes: TENGI RONEERA (1)
    .mob Defias Pillager
    .train 401767,1
step << Mage
    .train 401767 >>|cRXP_WARN_使用|r |T134939:0|t|cRXP_FRIENDLY_[法术说明：TENGI RONEERA]|r |cRXP_WARN_学习|r |T133815:0|t[雕刻胸部 - 再生]
    .use 208754
    .itemcount 208754,1 --Spell Notes: TENGI RONEERA (1)
step
    .goto Westfall,56.04,31.23
    .target Farmer Saldean
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_农夫萨丁|r
    .accept 9 >>接任务: |cRXP_LOOT_清理荒野|r
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
    >>杀死 |cRXP_ENEMY_Harvest Watchers|r。掠夺他们以获得 [|cRXP_LOOT_Flasks of Oil|]，你稍后会需要它们来完成任务
    >>你可以留在萨尔迪恩的田野上。如果所有人都死了，他们会继续重生。
    .complete 9,1 --Harvest Watcher (20)
    .collect 814,5 -- Flask of Oil (5)
    .mob Harvest Watcher
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_农夫萨丁|r
	.target Farmer Saldean
    .goto Westfall,56.04,31.23
    .turnin 9 >>交任务: |cRXP_FRIENDLY_清理荒野|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵加里安|r
	.target Scout Galiaan
    .goto Westfall,54.00,53.00
    .turnin 153 >>交任务: |cRXP_FRIENDLY_红色皮质面罩|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
	.target 格里安·斯托曼托
    .goto Westfall,56.33,47.52
    .turnin 12 >>交任务: |cRXP_FRIENDLY_西部荒野人民军|r
    .accept 65 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
step
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fly Redridge >>飞往赤脊山
    .target Thor

]])

RXPGuides.RegisterGuide([[
#classic
#version 1
#season 2
<< Alliance
#group RestedXP 联盟 1-20
#name 17-22 赤脊山 赛季服
#displayname 17-22 Redridge
#next RestedXP 联盟 20-30\\22-24 湿地 赛季服
#defaultfor !NightElf


step
    #label BMenace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官马瑞斯|r
    .goto Redridge Mountains,33.50,48.97
    .accept 20 >>接任务: |cRXP_LOOT_黑石氏族的威胁|r
    .target 马里斯元帅
    .xp <18,1
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头奥斯洛|r
    .goto Redridge Mountains,32.13,48.63
    .accept 125 >>接任务: |cRXP_LOOT_丢失的工具|r
    .target 工头奥斯洛
step
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗纳·奥斯古|r
	.target Verner Osgood
    .goto Redridge Mountains,30.97,47.27
    .accept 118 >>接任务: |cRXP_LOOT_马掌|r
step
#optional
    .goto Redridge Mountains,30.97,47.27
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗纳·奥斯古|r
	.target Verner Osgood
    .turnin 119 >>交任务: |cRXP_FRIENDLY_回复弗纳|r
    .isOnQuest 119
step
#optional
    .goto Redridge Mountains,30.97,47.27
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗纳·奥斯古|r
	.target Verner Osgood
    .accept 124 >>接任务: |cRXP_LOOT_豺狼人的乱吠|r
    .accept 122 >>接任务: |cRXP_LOOT_雏龙的鳞片|r
    .isQuestTurnedIn 119

step
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_所罗门镇长|r
	.target 所罗门法官
    .accept 120 >>接任务: |cRXP_LOOT_送往暴风城的信|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_码头管理员巴伦|r
	.target Dockmaster Baren
    .goto Redridge Mountains,27.70,47.40
    .accept 127 >>接任务: |cRXP_LOOT_卖鱼|r
step
    .goto Redridge Mountains,26.80,44.40
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darcy|r
    >>|cRXP_FRIENDLY_Darcy|r |cRXP_WARN_在旅馆里走来走去|r
	.target Darcy
    .accept 129 >>接任务: |cRXP_LOOT_免费的午餐|r
step << !Rogue
    .goto Redridge Mountains,27.0,44.8
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板布瑞安娜|r
    .target Innkeeper Brianna
    .home >>将你的炉石设置为湖畔小镇
    .isQuestAvailable 20
step
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑衣威利|r, 他在楼上
	.target Wiley the Black
    .turnin 65 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .isOnQuest 65
step
    .goto Redridge Mountains,27.35,44.07,8,0
    .goto Redridge Mountains,26.48,45.34
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黑衣威利|r, 他在楼上
    .turnin 65 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 132 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
	.target Wiley the Black
step
#optional
    .goto Redridge Mountains,22.67,43.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厨师布雷纳|r
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
    .itemcount 2296,5 -- 大血牙 Snout (5)
    .itemcount 1080,5 -- Tough Condor Meat (5)
    .itemcount 1081,5 -- Crisp Spider Meat (5)
    .target Chef Breanna
step << Rogue
    .goto Redridge Mountains,28.07,52.02
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卢修斯|r
    .turnin 2281 >>交任务: |cRXP_FRIENDLY_赤脊山的联络员|r
    .accept 2282 >>接任务: |cRXP_LOOT_奥瑟尔伐木场|r
    .target Lucius
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_肖恩|r
	.target Shawn
    .goto Redridge Mountains,29.31,53.63
    .accept 3741 >>接任务: |cRXP_LOOT_希拉里的项链|r
step
#loop
    >>|cRXP_WARN_跳进湖里|r
    >>打开 |cRXP_PICK_Glinting Mud|r。拾取它以获得 |cRXP_LOOT_Hilary's Necklace|r
    >>|cRXP_WARN_它在湖中有多个刷新点|r
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
    >>打开 |cRXP_PICK_Sunken Chest|r。将其拾取以获取 |cRXP_LOOT_Oslow's Toolbox|r
    .goto Redridge Mountains,41.52,54.68
    .complete 125,1 --Oslow's Toolbox (1)
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头奥斯洛|r
	.target 工头奥斯洛
    .goto Redridge Mountains,32.13,48.63
    .turnin 125 >>交任务: |cRXP_FRIENDLY_丢失的工具|r
    .accept 89 >>接任务: |cRXP_LOOT_止水湖上的桥|r
step
    #label BMenace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官马瑞斯|r
    .goto Redridge Mountains,33.50,48.97
    .accept 20 >>接任务: |cRXP_LOOT_黑石氏族的威胁|r
    .target 马里斯元帅
    .xp <18,1
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hilary|r
	.target Hilary
    .goto Redridge Mountains,29.24,53.63
    .turnin 3741 >>交任务: |cRXP_FRIENDLY_希拉里的项链|r
step
    #optional
	#completewith threat1
	>>杀死 |cRXP_ENEMY_黑龙幼龙|r。掠夺它们的 |cRXP_LOOT_Scales|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob 黑龙幼崽
    .isOnQuest 122
step
    #optional
    #completewith threat1
    >>杀死 |cRXP_ENEMY_大血牙s|r。掠夺它们的 |cRXP_LOOT_大血牙 Snouts|r
    .collect 2296,5,92,1
    .mob 大血牙
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Guard Parker|r
	.target Guard Parker
    .goto Redridge Mountains,15.27,71.45
    .turnin 129 >>交任务: |cRXP_FRIENDLY_免费的午餐|r
    .accept 130 >>接任务: |cRXP_LOOT_寻访草药师|r
step
    .goto Redridge Mountains,21.22,67.77,45,0
    .goto Redridge Mountains,17.70,73.39,45,0
    .goto Redridge Mountains,11.20,76.31,45,0
    .goto Redridge Mountains,13.37,81.48,45,0
    .goto Redridge Mountains,18.86,73.63
    >>杀死 |cRXP_ENEMY_狼蛛s|r。掠夺他们的 |cRXP_LOOT_酥脆蜘蛛肉|r
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
	>>杀死 |cRXP_ENEMY_Redridge Mongrels|r 和 |cRXP_ENEMY_Redridge Poachers|r
    .complete 246,1 --Redridge Mongrel (10)
    .complete 246,2 --Redridge Poacher (6)
    .mob Redridge Mongrel
	.mob Redridge Poacher
step
#label threat1
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_菲尔顿副队长|r
	.target Deputy Feldon
    .goto Redridge Mountains,30.73,59.99
    .turnin 246 >>交任务: |cRXP_FRIENDLY_审时度势|r
step
    #completewith db1
    .goto Redridge Mountains,30.59,59.42
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fly Stormwind >>飞往暴风城
    .target Ariena Stormfeather
    .dungeon DM << !Human
step
    #optional
    .goto StormwindClassic,63.982,75.338
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马库斯·乔纳森将军|r
    .turnin 120 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
    .accept 121 >>接任务: |cRXP_LOOT_送往暴风城的信|r
    .target General Marcus Jonathan
    .isQuestTurnedIn 118
    .dungeon DM << !Human
step
    .accept 167 >>接任务: |cRXP_WARN_我的兄弟……|r
    .accept 168 >>接任务: |cRXP_WARN_收集记忆|r
    .goto StormwindClassic,65.438,21.175
    .target Wilder Thistlenettle
    .target Shoni the Shilent
    .dungeon DM
step << Human Paladin
    .goto StormwindClassic,38.6,26.7
>>对话: |cRXP_FRIENDLY_贾森·坦诺姆|r
    .turnin 1787 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
.target Gazin Tenorm
    .accept 1788 >>接任务: |cRXP_LOOT_圣洁之书|r
step << Human Paladin
    .goto StormwindClassic,39.9,29.8
.target Duthorian Rall
>>对话: |cRXP_FRIENDLY_达索瑞恩·拉尔|r
    .turnin 1788 >>交任务: |cRXP_FRIENDLY_圣洁之书|r
step
    .goto StormwindClassic,55.510,12.504
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沉默的舒尼|r
    .accept 2040 >>接任务: |cRXP_WARN_地底突袭|r
    .target Shoni the Shilent
    .dungeon DM
step << Hunter
    .goto 1453/0,702.100,-8792.601
    .target Lina Stover
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_黎娜·斯图瓦|r
    >>购买 |T135612:0|t[BKP 2700“执法者”] (9.6 dps) 或在拍卖行寻找更好的升级
    .collect 3024,1
    .itemStat 18,QUALITY,<7
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<9.6
    .dungeon DM << !Human
step << Rogue
    .goto StormwindClassic,57.38,56.77
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛尔达·维勒|r
    .target Marda Weller
    >>|cRXP_WARN_购买 a|r |T135342:0|t[克里斯]
    >>|cRXP_WARN_如果有更便宜/更好的东西，就从拍卖行买一些东西|r
    .collect 2209,1
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<10.9
    .dungeon DM << !Human
step << Warrior/Paladin
    .goto StormwindClassic,57.54,57.07
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_冈瑟尔·维勒|r
    >>|cRXP_WARN_如果你有足够的钱，可以买 a|r |T135280:0|t[Dacian Falx] |cRXP_WARN_。21 级时装备它|r
    >>|cRXP_WARN_如果您之前使用的是狼牙棒，那么您可以购买 |r |T133044:0|t[Maul] |cRXP_WARN_to 来暂时避免武器技能问题。|r
    >>|cRXP_WARN_如果有更便宜/更好的东西，就从拍卖行买一些东西|r
    .collect 922,1 --Heavy Spiked Mace (1)
    .collect 924,1 --Ironwood Maul (1)
    .itemcount 4778,<1 --Heavy Spiked Mace (<1)
    .itemcount 4777,<1 --Ironwood Maul (<1)
    .target Gunther Weller
    .itemStat 16,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<16.0
    .dungeon DM << !Human
step << Warlock/Priest
    .goto StormwindClassic,42.65,67.16,14,0
    .goto StormwindClassic,42.88,65.11
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_阿德温·凯伦|r, 他在里面
    .vendor 1312 >>|cRXP_BUY_如果你能负担得起，从她那里买一把|r |T135139:0|t[燃烧魔杖] |cRXP_BUY_|r
    .collect 5210,1
    .disablecheckbox
    .target Ardwyn Cailen
    .itemStat 18,ITEM_MOD_DAMAGE_PER_SECOND_SHORT,<17.4
    .dungeon DM << !Human
step
    .goto StormwindClassic,63.982,75.338
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马库斯·乔纳森将军|r
    .turnin 120 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
    .accept 121 >>接任务: |cRXP_LOOT_送往暴风城的信|r
    .target General Marcus Jonathan
    .dungeon DM << !Human
step
    .goto Elwynn Forest,41.71,65.55
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_铁匠阿古斯|r
	.target Smith Argus
    .turnin 118 >>交任务: |cRXP_FRIENDLY_马掌|r
    .accept 119 >>接任务: |cRXP_LOOT_回复弗纳|r
    .dungeon DM << !Human
step << Human
    .dungeon !DM
    .cooldown item,6948,>120,1
    .hs >>从炉边到湖畔
    .zoneskip Redridge Mountains
step << Human
#optional
.dungeon !DM
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Redridge >>飞往赤脊山
    .target Dungar Longdrink
    .zoneskip Redridge Mountains
step
    #label BMenace
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官马瑞斯|r
    .goto Redridge Mountains,33.50,48.97
    .accept 20 >>接任务: |cRXP_LOOT_黑石氏族的威胁|r
    .target 马里斯元帅
    .xp <18,1
step
    .goto Redridge Mountains,30.97,47.27
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗纳·奥斯古|r
	.target Verner Osgood
    .turnin 119 >>交任务: |cRXP_FRIENDLY_回复弗纳|r
step
    .goto Redridge Mountains,30.97,47.27
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗纳·奥斯古|r
	.target Verner Osgood
    .accept 124 >>接任务: |cRXP_LOOT_豺狼人的乱吠|r
    .accept 122 >>接任务: |cRXP_LOOT_雏龙的鳞片|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Magistrate Soloman|r
	.target 所罗门法官
    .goto Redridge Mountains,29.31,45.33,15,0
    .goto Redridge Mountains,29.98,44.45
    .turnin 121 >>交任务: |cRXP_FRIENDLY_送往暴风城的信|r
step
    .goto Redridge Mountains,29.71,44.26
    .target 法警康纳彻
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拜里弗·科纳彻尔|r
    .accept 91 >>接任务: |cRXP_LOOT_所罗门的律法|r
step
    .goto Redridge Mountains,26.75,46.43
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t点击|cRXP_FRIENDLY_The Wanted Poster|r
    .accept 180 >>接任务: |cRXP_LOOT_通缉：范高雷中尉|r
step
    .goto Redridge Mountains,21.85,46.32
    .target Martie Jainrose
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_玛蒂·詹罗斯|r
    .turnin 130 >>交任务: |cRXP_FRIENDLY_寻访草药师|r
    .accept 131 >>接任务: |cRXP_LOOT_水仙诉衷情|r
    .accept 34 >>接任务: |cRXP_LOOT_不速之客|r
step
#optional
	#completewith BayingOfGnolls
	>>杀死 |cRXP_ENEMY_黑龙幼龙|r。掠夺它们的 |cRXP_LOOT_Scales|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob 黑龙幼崽
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
    >>杀死 |cRXP_ENEMY_Redridge Brutes|r 和 |cRXP_ENEMY_Redridge Mystics|r。掠夺他们的 |cRXP_LOOT_Iron Pikes|r 和 |cRXP_LOOT_Iron Rivets|r
    .complete 124,1 --Redridge Brute (10)
    .complete 124,2 --Redridge Mystic (8)
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
	.mob Redridge Mystic
	.mob Redridge Brute
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
    >>杀死 |cRXP_ENEMY_Redridge Brutes|r 和 |cRXP_ENEMY_Redridge Mystics|r。掠夺他们的 |cRXP_LOOT_Iron Pikes|r 和 |cRXP_LOOT_Iron Rivets|r。|cRXP_WARN_在前往 Alther's Mill 的路上完成此任务。您将在回来的路上完成它|r
    .complete 124,1 --Redridge Brute (10)
    .complete 124,2 --Redridge Mystic (8)
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
	.mob Redridge Mystic
	.mob Redridge Brute
step << Rogue
    .goto 1433,51.846,45.116
    >>|cRXP_WARN_你必须为你的|r |T132290:0|t[Poisons] |cRXP_WARN_quest 稍后完成此操作|r
    >>|cRXP_WARN_站在航点位置。调整相机和光标的位置，直到您可以一次点击 3 |cRXP_PICK_Practice Lockboxes|r 而无需移动任何东西|r
    .skill lockpicking,80 >>|cRXP_WARN_打开 Alther's Mill 地面上的 |cRXP_PICK_Practice Lockboxes|r 直到你的|r |T136058:0|t[Lockpicking] 技能达到 80|r
step << Rogue
	.goto Redridge Mountains,52.05,44.69
    >>打开 |cRXP_PICK_Lucius 的锁箱|r。从中获取 |cRXP_LOOT_盗窃令牌|r
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
    >>杀死 |cRXP_ENEMY_Redridge Brutes|r 和 |cRXP_ENEMY_Redridge Mystics|r。掠夺他们的 |cRXP_LOOT_Iron Pikes|r 和 |cRXP_LOOT_Iron Rivets|r
    .complete 124,1 --Redridge Brute (10)
    .complete 124,2 --Redridge Mystic (8)
    .complete 89,1 --Iron Pike (5)
    .complete 89,2 --Iron Rivet (5)
	.mob Redridge Mystic
	.mob Redridge Brute
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Darcy|r
    >>|cRXP_FRIENDLY_Darcy|r |cRXP_WARN_在旅馆里走来走去|r
	.target Darcy
    .goto Redridge Mountains,26.80,44.30
    .turnin 131 >>交任务: |cRXP_FRIENDLY_水仙诉衷情|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗纳·奥斯古|r
	.target Verner Osgood
    .goto Redridge Mountains,31.00,47.30
    .turnin 124 >>交任务: |cRXP_FRIENDLY_豺狼人的乱吠|r
    .accept 126 >>接任务: |cRXP_LOOT_群山中的嚎叫|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_工头奥斯洛|r
	.target 工头奥斯洛
    .goto Redridge Mountains,32.13,48.63
    .turnin 89 >>交任务: |cRXP_FRIENDLY_止水湖上的桥|r
step << Rogue
    .goto Redridge Mountains,28.07,52.02
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_卢修斯|r
    .turnin 2282 >>交任务: |cRXP_FRIENDLY_奥瑟尔伐木场|r
    .target Lucius
step << Rogue
#label xp20
    >>你应该在这里达到 20 级，如果没有，就去东边做鱼人任务，一直刷到 20 级
    .xp 20


----Start of Rogue Poison and Deadmines section----

step << Rogue
    .goto Redridge Mountains,30.6,59.6
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
    .fly Stormwind >>飞往暴风城
    .target Ariena Stormfeather
    .zoneskip Westfall
step << Rogue
    .goto StormwindClassic,74.64,52.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_从现在起，要小心管理你的资金。到达湿地后，你需要 75 银币才能解锁符文|r
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
step << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,5 >>进入 SI:7 总部。走上楼梯前往 |cRXP_FRIENDLY_马蒂亚斯·肖大师|r
step << Rogue
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    .accept 2360 >>接任务: |cRXP_LOOT_马迪亚斯和迪菲亚潜行者|r
    .goto StormwindClassic,75.78,59.84
    .target 马蒂亚斯·肖大师
step
#completewith next
.dungeon DM << !Rogue
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink
    .zoneskip Westfall
step << Rogue
.dungeon !DM
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 132 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 135 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
step
.dungeon DM
    .goto Westfall,56.325,47.519
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 141 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 142 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
step
.dungeon DM
    #completewith next
    .goto Westfall,44.50,69.62,55 >>前往 Moonbrook 的交通
step
.dungeon DM
    .goto Westfall,44.50,69.62
    .line Westfall,44.50,69.62,44.50,69.62,45.08,69.40,45.21,69.35,45.63,68.69,45.85,67.73,45.62,66.99,45.52,65.71,45.61,64.95,44.28,63.88,44.26,62.80,43.60,59.89,43.37,58.42,43.26,57.01,43.12,54.24,42.15,52.74,41.74,51.42,41.48,49.89,40.91,48.71,38.93,46.05,38.51,45.46,37.85,45.54,36.60,44.21,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.26,43.77,36.87,42.87,36.95,40.85,37.04,39.79,37.91,36.98,39.06,35.58,40.48,34.31,41.27,32.87,41.76,31.27,42.26,30.26,43.20,28.99,44.29,28.19,44.64,26.85,44.57,24.94,44.64,26.85,44.29,28.19,43.20,28.99,42.26,30.26,41.76,31.27,41.27,32.87,40.48,34.31,39.06,35.58,37.91,36.98,37.04,39.79,36.95,40.85,36.87,42.87,36.26,43.77,36.06,43.86,35.12,43.49,33.92,43.21,32.56,43.05,31.34,44.54,32.56,43.05,33.92,43.21,35.12,43.49,36.06,43.86,36.60,44.21,37.85,45.54,38.51,45.46,38.93,46.05,40.91,48.71,41.48,49.89,41.74,51.42,42.15,52.74,43.12,54.24,43.26,57.01,43.37,58.42,43.60,59.89,44.26,62.80,44.28,63.88,45.61,64.95,45.52,65.71,45.62,66.99,45.85,67.73,45.63,68.69,45.21,69.35,45.08,69.40,44.50,69.62
    >>杀死 |cRXP_ENEMY_Defias Messenger|r。搜刮他的 |cRXP_LOOT_Mysterious Message|r
    >>|cRXP_WARN_|cRXP_ENEMY_Defias Messenger|r 出现在 Moonbrook。他沿着 Moonbrook 北部的道路行走，前往 Gold Coast Quarry 和 Jangolode Mine。如果你在路上没有看到他，请等待他在 Moonbrook 出现|r
    >>|cRXP_WARN_他有 4-5 分钟的重生计时器|r
    .complete 142,1 -- A Mysterious Message (1)
    .unitscan Defias Messenger
step
.dungeon DM
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 142 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
step
.dungeon DM
    .goto Westfall,55.68,47.50
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_迪菲亚叛徒|r
    >>|cRXP_WARN_如果他不在那里，你可能需要等待 |cRXP_FRIENDLY_The Defias Traitor|r 出现|r
    .accept 155 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target The Defias Traitor
step
.dungeon DM
    .goto Westfall,42.56,71.71
    >>护送 |cRXP_FRIENDLY_迪菲亚叛徒|r 到死亡矿井
    >>|cRXP_WARN_时刻待在 |cRXP_FRIENDLY_迪菲亚叛徒|r 身边！到达月溪镇后，做好与 |cRXP_ENEMY_迪菲亚|r 战斗的准备|r
    .complete 155,1 -- Escort The Defias Traitor to discover where VanCleef is hiding (1)
    .target The Defias Traitor
step
.dungeon DM
    .goto Westfall,56.33,47.52
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_格里安·斯托曼|r
    .turnin 155 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .accept 166 >>接任务: |cRXP_LOOT_迪菲亚兄弟会|r
    .target 格里安·斯托曼托
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_哨兵瑞尔|r, 他在塔上
    .accept 214 >>接任务: |cRXP_WARN_红色丝质面罩|r
    .goto Westfall,56.67,47.35
    .target Scout Riell
step << Rogue
    #optional
    #completewith TowerKey
    +|cRXP_WARN_==关注接下来的部分==|r
    >>|cRXP_WARN_按 Esc，然后进入 -> 选项 -> 控制|r
    >>|cRXP_WARN_勾选“启用互动键”，并将“与目标互动”选项绑定到按键|r
    >>|cRXP_WARN_此外，建议你启用敌人铭牌（默认键：V），因为它可以让你看到塔内某些角落后面的敌人|r
step << Rogue
    .goto Westfall,68.50,70.08
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_密探吉尔妮|r
    >>|cRXP_WARN_你必须完成这个任务你的|r |T132290:0|t[毒药]
    .turnin 2360 >>交任务: |cRXP_FRIENDLY_马迪亚斯和迪菲亚潜行者|r
    .accept 2359 >>接任务: |cRXP_LOOT_克拉文之塔|r
    .target Agent Kearnen
step << Rogue
    #label TowerKey
    #loop
    .goto Westfall,71.49,73.49,0
    .goto Westfall,71.01,75.72,0
    .goto Westfall,69.58,73.07,0
    .goto Westfall,71.49,73.49,30,0
    .goto Westfall,71.01,75.72,30,0
    .goto Westfall,69.58,73.07,30,0
    >>|T133644:0|t[偷窃] |cRXP_ENEMY_畸形迪菲亚无人机|r。将其拾取以获得 |cRXP_LOOT_迪菲亚塔钥匙|r
    >>|cRXP_WARN_您必须处于|r |T132320:0|t[隐身] |cRXP_WARN_才能使用|r |T133644:0|t[扒窃]
    >>|cRXP_WARN_|cRXP_ENEMY_Malformed Defias Drone|出现在塔的入口处，然后在塔的外围巡逻|r
    >>|cRXP_WARN_小心，因为他会造成大量伤害。如果你的|r |T132320:0|t[隐身] |cRXP_WARN_被打破，请快速使用|r |T132307:0|t[冲刺] |cRXP_WARN_并逃跑|r
    .complete 2359,2 --Collect Defias Tower Key (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频指南
    .mob Malformed Defias Drone
step << Rogue
    #optional
    #completewith Mortwake
    +|cRXP_WARN_如果你还没有|r |T135641:0|t[Dagger] |cRXP_WARN_equipped，请装备|r |T135641:0|t[Curvewood Dagger] |cRXP_WARN_for此任务|r
    .use 15396
    .itemcount 15396,1
step << Rogue
    #label Mortwake
    .goto 1436,70.421,74.031
    >>|cRXP_WARN_前往塔顶第二层。当 |r |T132320:0|t[潜行] |cRXP_WARN_并且 |cRXP_ENEMY_Defias 塔哨兵|r 不在你身边时，跳到椅子上，然后跳到灯上，然后跳到路径点位置顶部的书架上|r
    >>|cRXP_WARN_手动|r |T132320:0|t[Unstealth]|cRXP_WARN_，然后按“与目标互动”键打开|cRXP_PICK_Duskwood Chest|r。从中获取|r |cRXP_LOOT_Klaven Mortwake 的日记|r
    >>|cRXP_WARN_注意：你的|r|T132320:0|t[隐身]|cRXP_WARN_在掠夺后会暂时停止工作|r|cRXP_LOOT_Klaven Mortwake的日记|r
    >>|cRXP_WARN_如果你没能杀死二楼的 |cRXP_ENEMY_Defias Tower Sentries|r，就要做好逃跑的准备。当你在书架顶部时，它们很可能会永久地激怒你（但不会攻击你），因为这是一个躲避点|r
    >>|cRXP_WARN_如果你的包里或装备中有|r |T135641:0|t[匕首] |cRXP_WARN_，你可以对里面的|cRXP_ENEMY_Defias 塔巡逻者|r 和 |cRXP_ENEMY_Defias 塔哨兵|r 施放|r |T132282:0|t[伏击] |cRXP_WARN_，立即杀死它们。杀死第一个|cRXP_ENEMY_Defias 塔哨兵|r 后，请做好逃跑的准备，并记住你可能会被从上面击中。这样速度会慢一些，但安全得多|r
    >>|cRXP_WARN_如果你必须跑出塔楼，请小心，因为 |cRXP_ENEMY_Malformed Defias Drone|r 和 |cRXP_ENEMY_Defias Drones|r 可能位于塔楼入口处|r
    .complete 2359,1 --Collect Klaven Mortwake's Journal (x1)
    .link https://www.youtube.com/watch?v=5sIew15IcG0 >>点击此处查看视频指南
    .mob Defias Tower Patroller
    .mob Defias Tower Sentry
step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart
    .collect 6452,1 >>制作 |T134437：0|吨[抗毒液]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
step << !Dwarf Rogue
    #optional
    #requires AntiVenomStart
    #label AntiVenomEnd
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437：0|吨[抗毒] 来消除 |T136230:0|t[Touch of Zanzil] 减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
step << Dwarf Rogue
    #optional
    #sticky
    #label AntiVenomEnd2
    .cast 20594 >>|cRXP_WARN_施放 |T136225:0|t[石像形态] 来消除 |T136230:0|t[赞吉尔之触] 减益效果|r
    .aura -9991
step << Rogue
    #optional
    #completewith KlavenEnd
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fly Stormwind >>飞往暴风城
    .target Thor
step << !Dwarf Rogue
    #optional
    #requires AntiVenomEnd
    #completewith FirstAidEnd
    .goto 1453,42.938,33.878,20,0
    .goto 1453,41.544,31.330,20,0
    .goto 1453,41.688,28.049,20,0
    .goto 1453,43.070,26.155,15 >>前往 |cRXP_FRIENDLY_Shaina Fuller|r
    .aura -9991
step << !Dwarf Rogue
    #requires AntiVenomEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_珊娜·弗勒|r
    >>|cRXP_WARN_如果您有|r |T626003:0|t|cFFF48CBAPaladin|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0ADruid|r |cRXP_WARN_朋友，请他们为您删除|r |T136230:0|t[Touch of Zanzil] |cRXP_WARN_|r
    .skill firstaid,80 >>|cRXP_WARN_你的|r |T135966:0|t[急救] |cRXP_WARN_to 等级为 80|r
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
step << !Dwarf Rogue
    #label FirstAidEnd
    .goto 1453,43.070,26.155
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_珊娜·弗勒|r
    >>|cRXP_WARN_如果您有|r |T626003:0|t|cFFF48CBAPaladin|r |cRXP_WARN_或|r |T625999:0|t|cFFFF7C0ADruid|r |cRXP_WARN_朋友，请他们为您删除|r |T136230:0|t[Touch of Zanzil] |cRXP_WARN_|r
    .train 7934 >>|cRXP_WARN_Train|r |T134437：0|吨[反毒液]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
step << !Dwarf Rogue
    #sticky
    #label AntiVenomStart2
    .collect 6452,1 >>制作 |T134437：0|吨[抗毒液]
    .aura -9991
    .itemcount 6452,<1 --Anti-Venom (<1)
    .train 7934,3 --Anti Venom spell trained
step << !Dwarf Rogue
    #sticky
    #requires AntiVenomStart2
    #label AntiVenomEnd2
    .cast 7932 >>|cRXP_WARN_使用背包中的 |T134437：0|吨[抗毒] 来消除 |T136230:0|t[Touch of Zanzil] 减益效果|r
    .use 6452
    .aura -9991
    .itemcount 6452,1 --Anti-Venom (1)
step << Rogue
    #optional
    #requires AntiVenomEnd2 << Rogue
    #completewith next
    .goto StormwindClassic,74.90,54.00,20,0
    .goto StormwindClassic,78.43,60.15,20,0
    .goto StormwindClassic,78.67,60.13,10 >>进入 SI:7 总部。走上楼梯前往 |cRXP_FRIENDLY_马蒂亚斯·肖大师|r
step << Rogue
    #label KlavenEnd
    #requires AntiVenomEnd2 << Rogue
    .goto StormwindClassic,75.78,59.84
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_马迪亚斯·肖尔大师|r
    >>|cRXP_WARN_如果你切换到 a|r |T135641:0|t[Dagger] |cRXP_WARN_earlier，请记得重新装备你的主要武器|r << Rogue
    .turnin 2359 >>交任务: |cRXP_FRIENDLY_克拉文之塔|r
    .turnin 135 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .target 马蒂亚斯·肖大师
step << Rogue
#completewith next
.dungeon DM
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Westfall >>飞往西部荒野
    .target Dungar Longdrink
    .zoneskip Westfall
step
.dungeon DM
    .goto Westfall,60.4,72.2
    .goto Westfall,40.4,71.6
    .subzone 1581 >>现在你应该在寻找一个去死亡矿井的团队
    >>组建死亡矿井小组的同时磨练豺狼人
step
.dungeon DM
    .goto Westfall,42.55,71.69
    .subzone 1581 >>前往死亡矿井
step
.dungeon DM
    #completewith EnterDM
    >>杀死 |cRXP_ENEMY_Defias|r。掠夺他们的 |cRXP_LOOT_Bandanas|r
    >>|cRXP_WARN_你可以在进入地下城后完成此操作|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
step
.dungeon DM
    #completewith next
    >>杀死 |cRXP_ENEMY_Skeletal Miners|r、|cRXP_ENEMY_Undead Dynamiters|r 和 |cRXP_ENEMY_Undead Excavators|r。掠夺他们的 |cRXP_LOOT_Cards|r
    >>|cRXP_WARN_这是在地下城外完成的|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>杀死 |cRXP_ENEMY_Foreman Thistlenettle|r。夺取他的 |cRXP_LOOT_Badge|r
    >>|cRXP_WARN_这是在地下城外完成的|r
    .complete 167,1 -- Thistlenettle's Badge (1)
    .unitscan Foreman Thistlenettle
step
.dungeon DM
    .goto 1415,41.18,79.80,25,0
    .goto 1415,41.03,79.96,25,0
    .goto 1415,40.92,80.05,25,0
    .goto 1415,41.08,80.11
    >>杀死 |cRXP_ENEMY_Skeletal Miners|r、|cRXP_ENEMY_Undead Dynamiters|r 和 |cRXP_ENEMY_Undead Excavators|r。掠夺他们的 |cRXP_LOOT_Cards|r
    >>|cRXP_WARN_这是在地下城外完成的|r
    .complete 168,1 -- Miners' Union Card (4)
    .mob Skeletal Miner
    .mob Undead Dynamiter
    .mob Undead Excavator
step
.dungeon DM
    #label EnterDM
    .goto 1415,40.94,79.76,25,0
    .goto 1415,40.86,79.62,20,0
    .goto 1415,40.678,79.578
    .subzone 1581,2 >>进入死亡矿井地下城
step
.dungeon DM
    #completewith DMend
    >>杀死死亡矿井内的 |cRXP_ENEMY_Defias|r。搜刮他们的 |cRXP_LOOT_Bandanas|r
    .complete 214,1 -- Red Silk Bandana (10)
    .isOnQuest 214
step
.dungeon DM
    >>杀死 |cRXP_ENEMY_Sneed|r。从他身上搜刮 |cRXP_LOOT_Gnoam Sprecklesprocket|r
    .complete 2040,1 -- Gnoam Sprecklesprocket (1)
step
.dungeon DM
    >>杀死 |cRXP_ENEMY_Edwin VanCleef|r。搜刮他的 |cRXP_LOOT_Head|r 和 |T133471:0|t[|cRXP_LOOT_An Unsent Letter|r]
    >>|cRXP_WARN_使用 |T133471:0|t[|cRXP_LOOT_An Unsent Letter|r] 开始任务|r
    .collect 2874,1,373 -- An Unsent Letter (1)
    .complete 166,1 -- Head of VanCleef (1)
    .accept 373 >>接任务: |cRXP_WARN_未寄出的信|r
    .use 2874 -- An Unsent Letter
step
.dungeon DM
    #label DMend
    #completewith next
    .goto Westfall,56.33,47.52,100 >>前往哨兵岭
step
.dungeon DM
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: 格里安·斯托曼托|r and |cRXP_FRIENDLY_Scout Riell, 他在塔上
    .turnin 166 >>交任务: |cRXP_FRIENDLY_迪菲亚兄弟会|r
    .goto Westfall,56.33,47.52
    .turnin -214 >>交任务: |cRXP_FRIENDLY_红色丝质面罩|r
    .goto Westfall,56.67,47.35
    .target 格里安·斯托曼托
    .target Scout Riell
step
.dungeon DM
    #completewith next
    .goto Westfall,56.55,52.64
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_索尔|r
    .fly Stormwind >>飞往暴风城
    .target Thor
step
    .goto StormwindClassic,65.438,21.175
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_维尔德·蓟草|r, 他在里面
    .turnin 167 >>交任务: |cRXP_FRIENDLY_我的兄弟……|r
    .turnin 168 >>交任务: |cRXP_FRIENDLY_收集记忆|r
    .target Wilder Thistlenettle
    .dungeon DM
step
    #label ShoniEnd
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_沉默的舒尼|r
    .turnin 2040 >>交任务: |cRXP_FRIENDLY_地底突袭|r
    .goto StormwindClassic,55.510,12.504
    .target Shoni the Shilent
    .dungeon DM
step
    .dungeon DM
    .goto StormwindClassic,66.277,62.137
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_杜加尔·朗德瑞克|r
    .fly Redridge >>飞往赤脊山
    .target Dungar Longdrink
    .zoneskip Redridge Mountains


----End of Rogue Poison and Deadmines section----


step
    #optional
    #completewith orcs
    >>杀死 |cRXP_ENEMY_凶猛秃鹰s|r。掠夺它们的 |cRXP_LOOT_Tough Condor Meat|r
    >>杀死 |cRXP_ENEMY_黑龙幼龙|r。掠夺它们的 |cRXP_LOOT_Scales|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob +黑龙幼崽
    .collect 1080,5,92,1
    .mob +凶猛秃鹰
    .subzoneskip 997--Render's Valley
step
#completewith next
    >>杀死 |cRXP_ENEMY_大血牙s|r。掠夺它们的 |cRXP_LOOT_大血牙 Snouts|r
    .collect 2296,5,92,1
    .mob 大血牙
step
    .goto Redridge Mountains,49.0,70.0
    >>杀死 |cRXP_ENEMY_Murloc Shorestrikers|r 和 |cRXP_ENEMY_Murloc Minor Tidecallers|r。掠夺他们的 |cRXP_LOOT_Fins|r 和 |cRXP_LOOT_Sunfish|r
	>>|cRXP_WARN_请注意，此区域是超级重生区，这意味着 |cRXP_ENEMY_Murlocs|r 会快速重生|r
    .complete 127,1
    .collect 1468,8,150,1
    .mob Murloc Shorestriker
    .mob Murloc Minor Tidecaller
step << Warlock
    #season 2
    #sticky
    #label Incinerate
    .goto Redridge Mountains,76.8,82.2
    .train 416015 >>杀死 |cRXP_ENEMY_Incinerator Gar'im|r |cRXP_WARN_(lvl 23 elite)|r。从他身上搜刮 |T134419:0|t[|cRXP_FRIENDLY_Rune of Incinerate|r]
    .use 211477>>这个符文可能有点难，但还是可以做到的，只要让 Gar'im 保持恐惧，你稍后会需要这个符文来完成任务
    .collect 211477,1
    .disablecheckbox
    .unitscan Incinerator Gar'im
step
    #loop
    >>杀死 |cRXP_ENEMY_Blackrock Grunts|r 和 |cRXP_ENEMY_Blackrock Outrunners|r。掠夺他们的 |cRXP_LOOT_Axes|r
	>>|cRXP_WARN_请注意 |cRXP_ENEMY_Blackrock Outrunners|r 将对你施放 |T132149:0|t[Net]|r
    .goto Redridge Mountains,74.00,79.00,60,0
    .goto Redridge Mountains,76.18,83.39,60,0
    .goto Redridge Mountains,77.80,68.50,60,0
    .goto Redridge Mountains,70.11,77.34,60,0
    .goto Redridge Mountains,74.00,79.00,60,0
    .goto Redridge Mountains,74.00,79.00,0
    .complete 20,1 --Battleworn Axe (10)
    .mob Blackrock Grunt
	.mob Blackrock Outrunner
step
    #requires Incinerate<< Warlock
    .goto Redridge Mountains,61.37,77.10
    >>杀死 |cRXP_ENEMY_凶猛秃鹰s|r。掠夺它们的 |cRXP_LOOT_Tough Condor Meat|r
    >>杀死 |cRXP_ENEMY_黑龙幼龙|r。掠夺它们的 |cRXP_LOOT_Scales|r
    .complete 122,1 --Underbelly Whelp Scale (6)
    .mob +黑龙幼崽
    .collect 1080,5,92,1
    .mob +凶猛秃鹰
step << Rogue
    .goto Redridge Mountains,74.00,79.00,60,0
    .goto Redridge Mountains,76.18,83.39,60,0
    .goto Redridge Mountains,77.80,68.50,60,0
    .goto Redridge Mountains,70.11,77.34,60,0
    .goto Redridge Mountains,74.00,79.00,60,0
    .goto Redridge Mountains,74.00,79.00,0
    .xp 22-18500 >>努力学习直到你距离 22 级还有 18500 xp
    .itemcount 1080,5 --Tough condor meat (5)
    .itemcount 2296,5 --Great goretusk snout (5)
    .itemcount 1221,5 --Underbelly Whelp Scale (6)
step
    #softcore
    .deathskip >>死亡后在灵魂治疗师处重生。带上复活病，你将有一段时间无法与任何怪物战斗
    .itemcount 1080,5 --Tough condor meat (5)
    .itemcount 2296,5 --Great goretusk snout (5)
    .itemcount 1221,5 --Underbelly Whelp Scale (6)
    .itemcount 3014,10 --Battleworn Axe (10)
    .xp <21.25
step
    #loop
    >>杀死 |cRXP_ENEMY_大血牙s|r。掠夺它们的 |cRXP_LOOT_大血牙 Snouts|r
    .goto Redridge Mountains,15.73,52.83,60,0
    .goto Redridge Mountains,32.25,70.20,60,0
    .goto Redridge Mountains,31.02,72.14,60,0
    .goto Redridge Mountains,15.73,52.83,0
    .goto Redridge Mountains,32.25,70.20,0
    .goto Redridge Mountains,31.02,72.14,0
    .collect 2296,5,92,1
    .mob 大血牙
step << Rogue
    .xp 22-18500 >>磨练怪物直到你距离 22 级还有 18500 经验值
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_厨师布雷纳|r
	.target Chef Breanna
    .goto Redridge Mountains,22.67,43.83
    .accept 92 >>接任务: |cRXP_LOOT_赤脊山炖肉|r
    .turnin 92 >>交任务: |cRXP_FRIENDLY_赤脊山炖肉|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_码头管理员巴伦|r
	.target Dockmaster Baren
    .goto Redridge Mountains,27.72,47.38
    .turnin 127 >>交任务: |cRXP_FRIENDLY_卖鱼|r
    .accept 150 >>接任务: |cRXP_LOOT_鱼人偷猎者|r
    .turnin 150 >>交任务: |cRXP_FRIENDLY_鱼人偷猎者|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_弗纳·奥斯古|r
	.target Verner Osgood
    .goto Redridge Mountains,31.00,47.30
    .turnin 122 >>交任务: |cRXP_FRIENDLY_雏龙的鳞片|r
step
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_治安官马瑞斯|r
	.target 马里斯元帅
    .goto Redridge Mountains,33.50,48.97
    .turnin 20 >>交任务: |cRXP_FRIENDLY_黑石氏族的威胁|r
step
    .goto Redridge Mountains,30.59,59.42
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_艾蕾娜·斯托姆法瑟|r
	.target Ariena Stormfeather
    .fly Stormwind >>飞往暴风城
step << !Mage/Paladin/Warlock
    .goto StormwindClassic,52.623,65.701
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_旅店老板奥里森|r
    .home >>将你的炉石设置为暴风城
    .target Innkeeper Allison
step << Mage
    .goto Stormwind City,39.681,79.538
	>>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_拉瑞麦尼·普尔度|r
    .train 3561 >>火车 |T135763:0|t[传送：暴风城]
    .target +拉里曼普渡大学
step << Mage
    .goto Stormwind City,36.87,81.14
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_詹妮亚·坎农|r
    .trainer >>训练你的职业法术
    .target Elsharin
	.target Jennea Cannon
step << Warrior
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Wu|r or |cRXP_FRIENDLY_Ilsa|r
    .goto StormwindClassic,76.08,50.14,15,0
    .goto StormwindClassic,80.22,45.37,15,0
	.goto StormwindClassic,78.68,45.79
    .trainer >>训练你的职业法术
    .target Wu Shen
    .target Ilsa Corbin
step << Rogue
    .goto StormwindClassic,74.65,52.83
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_夜行者奥斯伯|r
    >>|cRXP_WARN_确保训练后你还剩下 75 银币。你很快就会需要它来解锁符文。只在必要时购买必要的法术|r
    .train 1856 >>|cRXP_WARN_确保你训练 |T132331:0|t[Vanish]。|r |cRXP_WARN_你很快就会需要它来解锁符文|r
    .trainer >>训练你的职业法术
    .target Osborne the Night Man
step << Paladin
    .goto StormwindClassic,38.67,32.82
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_虔诚的亚瑟|r
    .trainer >>训练你的职业法术
    .target Arthur the Faithful
step << Priest
    .goto StormwindClassic,38.54,26.86
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_高阶牧师劳瑞娜|r
    .trainer >>训练你的职业法术
    .target High Priestess Laurena
step << Hunter
    .goto StormwindClassic,61.609,15.269
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_恩瑞斯·锐矛|r
    .trainer >>训练你的职业法术
    .target Einris Brightspear
step
    .goto StormwindClassic,61.149,11.568,25,0
    .goto StormwindClassic,64.0,8.10
    .zone Ironforge >>前往: |cRXP_PICK_铁炉堡|r
step << Warlock
    .goto Ironforge,51.1,8.7,15,0
    .goto Ironforge,50.343,5.657
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_布瑞尔索恩|r
    .trainer >>训练你的职业法术
    .target Briarthorn
step << Warlock
    .goto Ironforge,52.701,6.070
    >>|Tinterface/worldmap/chatbubble_64grey.blp:20|t对话: |cRXP_FRIENDLY_寻尸者祖贝尔|r
    .vendor 6382 >>|cRXP_BUY_Buy a|r |T133738:0|t[折磨魔典 (等级 2)]
    .collect 16346,1
    .disablecheckbox
    .target Jubahl Corpseseeker
    .train 427733,1 --skips if you have a felguard
step << Mage
    .goto Ironforge,25.50,7.04
    >>对话: |cRXP_FRIENDLY_贝尔斯塔弗·风暴之眼|r
    .train 3562 >>火车 |T135757:0|t[传送：铁炉堡]
    .target Milstaff Stormeye
step
    #completewith next
    .goto Dun Morogh,53.48,37.50,30,0
    .goto Dun Morogh,54.04,38.60,30,0
    .goto Dun Morogh,59.43,42.85,150 >>前往跳跃点。沿途沿着山的左侧行走
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
    >>|cRXP_WARN_做不死丹莫洛->湿地跳过|r
    >>|cRXP_WARN_如果你没有信心，每次跌倒后都要吃饱|r
    .link https://youtu.be/QcEUvwu49KI?t=73 >>|cRXP_WARN_点击此处查看参考（强烈建议您这样做）|r
    .goto Dun Morogh,60.65,11.38,20 >>小心地从山边掉下来
    .isQuestAvailable 983
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
    >>|cRXP_WARN_做不死丹莫洛->湿地跳过|r
    >>|cRXP_WARN_在你降落到海岸之前（如果他在上面的话），请小心 |cRXP_ENEMY_Sludginn|r（罕见）|r
    >>|cRXP_WARN_到达海边时要小心西边的|cRXP_ENEMY_Bluegill Raiders|r|r
    .link https://youtu.be/QcEUvwu49KI?t=336 >>|cRXP_WARN_点击此处查看参考（强烈建议您这样做）|r
    .goto Wetlands,12.69,60.97,15 >>前往: |cRXP_PICK_湿地|r
    .mob Young Wetlands Crocolisk
    .mob Bluegill Raider
    .unitscan Sludginn
    .isQuestAvailable 983
]])
